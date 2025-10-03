{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Web.Scotty as Scott
import Network.Wai.Session
import Web.Cookie
import qualified Web.ClientSession as CS
import qualified Network.Wai.Session.ClientSession as CS
import Control.Monad.IO.Class (liftIO)
import qualified Data.IORef as IORef
import qualified Data.Text.Lazy as TL
import Data.Vault.Lazy
import Text.Read(readMaybe)
import Data.UUID.V4
import Data.UUID
import Data.Default (def)
import System.Environment
import qualified Data.ByteString as BS
import qualified Data.Map as Map
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Data.Text.Lazy(Text)

import CalcLangInterpreter
import CalcLangParser
import CalcLangAstH

-- Session storage for variables and functions

data MySession = MySession { variableTable :: IORef.IORef Env,
                             functionTable :: IORef.IORef FunctionTable }

type MySessionMap = IORef.IORef (Map.Map BS.ByteString (IORef.IORef MySession))

main :: IO ()
main = do
        -- Initialize session storage
       myMap <- IORef.newIORef Map.empty

       args <- getArgs
       port <- case args of
         [] -> do
               putStrLn "No Command Line arguments found defaulting to port 5000"
               return 5000
         [arg1] -> case readMaybe arg1 :: Maybe Int of
                     Just num -> return num
                     Nothing -> do
                                putStrLn ("Command Line port expected but found " ++ arg1 ++ "\n defaulting to port 5000")
                                return 5000    
         (arg1:_) -> case readMaybe arg1 :: Maybe Int of
                       Just num -> do
                                   putStrLn "Warning to many arguments passed to command line expected just a single port number"
                                   return num
                       Nothing -> do
                                  putStrLn ("Command Line port expected but found " ++ arg1 ++ "\n defaulting to port 5000")
                                  return 5000
    
       putStrLn $ "Starting CalcLang Web Server on port " ++ (show port)

       Scott.scotty port $ do
                           Scott.get "/" $ do
                                           fileContent <- liftIO $ readFile "./help/files/Intro.txt"
                                           let pageHtml = H.docTypeHtml $ do
                                                                          H.head $ do
                                                                                   H.title "Intro To CalcLang"
                                                                          H.body $ do
                                                                                   H.h1 "Intro To CalcLang:"
                                                                                   H.pre $ H.toHtml fileContent -- Display raw content in <pre> tag
                                                                                   H.a ! A.href "/help" $ "Help using CalcLang"
                                           Scott.html (renderHtml pageHtml)
                           Scott.get "/help" $ do
                                               fileContent <- liftIO $ readFile "./help/files/Help.txt"
                                               let pageHtml = H.docTypeHtml $ do
                                                                              H.head $ do
                                                                                       H.title "CalcLang Help"
                                                                              H.body $ do
                                                                                       H.h1 "CalcLang Help"
                                                                                       H.pre $ H.toHtml fileContent
                                               Scott.html (renderHtml pageHtml)
