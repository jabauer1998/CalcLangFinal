{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_focus (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "focus"
version :: Version
version = Version [1,0,3,2] []

synopsis :: String
synopsis = "A general abstraction for manipulating elements of container data structures"
copyright :: String
copyright = "(c) 2014, Nikita Volkov"
homepage :: String
homepage = "https://github.com/nikita-volkov/focus"
