{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_crypton (
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
version = Version [1,0,4] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/bin"
libdir     = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/lib"
dynlibdir  = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/lib"
datadir    = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/share"
libexecdir = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/libexec"
sysconfdir = "/home/jabauer/.cabal/store/ghc-9.10.3-b4c3/crypton-1.0.4-5c622287f6e749a2f12d0f9f007bedd13c82da43ea6a3c412be71ac82fdbf853/etc"

getBinDir     = catchIO (getEnv "crypton_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "crypton_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "crypton_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "crypton_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "crypton_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "crypton_sysconfdir") (\_ -> return sysconfdir)



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
