{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_crypton (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "crypton"
version :: Version
version = Version [1,0,4] []

synopsis :: String
synopsis = "Cryptography Primitives sink"
copyright :: String
copyright = "Vincent Hanquez <vincent@snarc.org>"
homepage :: String
homepage = "https://github.com/kazu-yamamoto/crypton"
