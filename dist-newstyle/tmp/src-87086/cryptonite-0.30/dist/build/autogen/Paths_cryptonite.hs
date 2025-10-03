{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_cryptonite (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,30] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/bin"
libdir     = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/lib"
dynlibdir  = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/lib"
datadir    = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/share"
libexecdir = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/libexec"
sysconfdir = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/cryptonite-0.30-d01386730799b8e7861f810d679dcc17a8ad6f57aa4a469519b02b6a3b2693f5/etc"

getBinDir     = catchIO (getEnv "cryptonite_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "cryptonite_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "cryptonite_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "cryptonite_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cryptonite_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cryptonite_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
