-- |
-- Module      : Crypto.Number.Generate
-- License     : BSD-style
-- Maintainer  : Vincent Hanquez <vincent@snarc.org>
-- Stability   : experimental
-- Portability : Good
module Crypto.Number.Generate (
    GenTopPolicy (..),
    generateParams,
    generatePrefix,
    generateMax,
    generateBetween,
) where

import Control.Monad (when)
import Crypto.Internal.ByteArray (ScrubbedBytes)
import qualified Crypto.Internal.ByteArray as B
import Crypto.Internal.Imports
import Crypto.Number.Basic
import Crypto.Number.Serialize
import Crypto.Random.Types
import Data.Bits (complement, shiftL, testBit, unsafeShiftR, (.&.), (.|.))
import Foreign.Ptr
import Foreign.Storable

-- | Top bits policy when generating a number
data GenTopPolicy
    = -- | set the highest bit
      SetHighest
    | -- | set the two highest bit
      SetTwoHighest
    deriving (Show, Eq)

-- | Generate a number for a specific size of bits,
-- and optionaly set bottom and top bits
--
-- If the top bit policy is 'Nothing', then nothing is
-- done on the highest bit (it's whatever the random generator set).
--
-- If @generateOdd is set to 'True', then the number generated
-- is guaranteed to be odd. Otherwise it will be whatever is generated
generateParams
    :: MonadRandom m
    => Int
    -- ^ number of bits
    -> Maybe GenTopPolicy
    -- ^ top bit policy
    -> Bool
    -- ^ force the number to be odd
    -> m Integer
generateParams bits genTopPolicy generateOdd
    | bits <= 0 = return 0
    | otherwise = os2ip . tweak <$> getRandomBytes bytes
  where
    tweak :: ScrubbedBytes -> ScrubbedBytes
    tweak orig = B.copyAndFreeze orig $ \p0 -> do
        let p1 = p0 `plusPtr` 1
            pEnd = p0 `plusPtr` (bytes - 1)
        case genTopPolicy of
            Nothing -> return ()
            Just SetHighest -> p0 |= (1 `shiftL` bit)
            Just SetTwoHighest
                | bit == 0 -> do
                    p0 $= 0x1
                    p1 |= 0x80
                | otherwise -> p0 |= (0x3 `shiftL` (bit - 1))
        p0 &= (complement $ mask)
        when generateOdd (pEnd |= 0x1)

    ($=) :: Ptr Word8 -> Word8 -> IO ()
    ($=) p w = poke p w

    (|=) :: Ptr Word8 -> Word8 -> IO ()
    (|=) p w = peek p >>= \v -> poke p (v .|. w)

    (&=) :: Ptr Word8 -> Word8 -> IO ()
    (&=) p w = peek p >>= \v -> poke p (v .&. w)

    bytes = (bits + 7) `div` 8
    bit = (bits - 1) `mod` 8
    mask = 0xff `shiftL` (bit + 1)

-- | Generate a number for a specific size of bits.
--
-- * @'generateParams' n Nothing False@ generates bytes and uses the suffix of @n@ bits
-- * @'generatePrefix' n@ generates bytes and uses the prefix of @n@ bits
generatePrefix :: MonadRandom m => Int -> m Integer
generatePrefix bits
    | bits <= 0 = return 0
    | otherwise = do
        let (count, offset) = (bits + 7) `divMod` 8
        bytes <- getRandomBytes count
        return $ os2ip (bytes :: ScrubbedBytes) `unsafeShiftR` (7 - offset)

-- | Generate a positive integer x, s.t. 0 <= x < range
generateMax
    :: MonadRandom m
    => Integer
    -- ^ range
    -> m Integer
generateMax range
    | range <= 1 = return 0
    | range < 127 = generateSimple
    | canOverGenerate = loopGenerateOver tries
    | otherwise = loopGenerate tries
  where
    -- this "generator" is mostly for quickcheck benefits. it'll be biased if
    -- range is not a multiple of 2, but overall, no security should be
    -- assumed for a number between 0 and 127.
    generateSimple = flip mod range `fmap` generateParams bits Nothing False

    loopGenerate count
        | count == 0 =
            error $
                "internal: generateMax("
                    ++ show range
                    ++ " bits="
                    ++ show bits
                    ++ ") (normal) doesn't seems to work properly"
        | otherwise = do
            r <- generateParams bits Nothing False
            if isValid r then return r else loopGenerate (count - 1)

    loopGenerateOver count
        | count == 0 =
            error $
                "internal: generateMax("
                    ++ show range
                    ++ " bits="
                    ++ show bits
                    ++ ") (over) doesn't seems to work properly"
        | otherwise = do
            r <- generateParams (bits + 1) Nothing False
            let r2 = r - range
                r3 = r2 - range
            if isValid r
                then return r
                else
                    if isValid r2
                        then return r2
                        else
                            if isValid r3
                                then return r3
                                else loopGenerateOver (count - 1)

    bits = numBits range
    canOverGenerate =
        bits > 3 && not (range `testBit` (bits - 2)) && not (range `testBit` (bits - 3))

    isValid n = n < range

    tries :: Int
    tries = 100

-- | generate a number between the inclusive bound [low,high].
generateBetween :: MonadRandom m => Integer -> Integer -> m Integer
generateBetween low high = (low +) <$> generateMax (high - low + 1)
