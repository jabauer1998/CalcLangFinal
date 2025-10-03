{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_assoc (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "assoc"
version :: Version
version = Version [1,1,1] []

synopsis :: String
synopsis = "swap and assoc: Symmetric and Semigroupy Bifunctors"
copyright :: String
copyright = ""
homepage :: String
homepage = ""
