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
import Data.List (intercalate)
import Text.Blaze.Html.Renderer.Text (renderHtml)
import Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes as A
import Data.Text.Lazy(Text)
import Network.Wai.Handler.Warp (Settings, defaultSettings, setHost, setPort)
import qualified Network.Wai.Handler.Warp as Warp
import Network.Wai (Application)

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
       vT <- IORef.newIORef (Environment [])
       fT <- IORef.newIORef (SymbolTable [])
       hist <- IORef.newIORef []

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
    
       putStrLn $ "Starting CalcLang Web Server on 0.0.0.0:" ++ (show port)

       let settings = setHost "0.0.0.0" $ setPort port defaultSettings
       Scott.scottyOpts (Scott.Options 1 settings) $ do 
                           Scott.get "/" $ do
                                           fileContent <- liftIO $ readFile "./help/files/Intro.txt"
                                           let pageHtml = H.docTypeHtml $ do
                                                                          H.head $ do
                                                                                   H.title "Intro To CalcLang"
                                                                          H.body $ do
                                                                                   H.h1 "Intro To CalcLang:"
                                                                                   H.pre $ H.toHtml fileContent -- Display raw content in <pre> tag
                                                                                   H.a ! A.href "/help" $ "Help using CalcLang"
                                                                                   H.a ! A.href "/eval" $ "Evaluate CalcLang"
                                           Scott.html (renderHtml pageHtml)

                           Scott.get "/help" $ do
                                               fileContent <- liftIO $ readFile "./help/files/Help.txt"
                                               let pageHtml = H.docTypeHtml $ do
                                                                              H.head $ do
                                                                                       H.title "Intro To CalcLang"
                                                                              H.body $ do
                                                                                       H.h1 "Intro To CalcLang:"
                                                                                       H.pre $ H.toHtml fileContent -- Display raw content in <pre> tag
                                                                                       H.a ! href "/" $ "Back to Intro"
                                                                                       H.a ! A.href "/eval" $ "Evaluate CalcLang"
                                               Scott.html (renderHtml pageHtml)
                                           
                                             
                           Scott.get "/result" $ do
                                                 param <- Scott.queryParam "userInput"
                                                 oldHist <- liftIO (IORef.readIORef hist)
                                                 let newHist = oldHist ++ [param]
                                                 _ <- liftIO (IORef.writeIORef hist newHist)
                                                 parseResult <- liftIO (runCalcLangParser param)
                                                 myVTBefore <- liftIO (IORef.readIORef vT)
                                                 myFTBefore <- liftIO (IORef.readIORef fT)
                                                 let (res, myVTAfter, myFTAfter) = interpret parseResult myVTBefore myFTBefore
                                                 _ <- liftIO (IORef.writeIORef vT myVTAfter)
                                                 _ <- liftIO (IORef.writeIORef fT myFTAfter)
                                                 _ <- case res of
                                                        QuitVal -> liftIO (IORef.writeIORef hist [])
                                                        _ -> return ()
                                                 let pageHtml = case res of
                                                                         ErrorVal val -> H.docTypeHtml $ do
                                                                                                         H.head $ do
                                                                                                                  H.title "Intro To CalcLang"
                                                                                                         H.body $ do
                                                                                                                  H.h1 "Error Detected:"
                                                                                                                  H.pre $ H.toHtml (CalcLangInterpreter.toStr res)
                                                                                                                  H.a ! A.href "/" $ "Back To Intro"
                                                                                                                  H.a ! A.href "/help" $ "Help using CalcLang"
                                                                         HelpCommandVal -> H.docTypeHtml $ do
                                                                                                           H.head $ do
                                                                                                                    H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/help" :: Text))
                                                                         ReadHistoryCommandVal -> H.docTypeHtml $ do
                                                                                                                  H.head $ do
                                                                                                                           H.title "History Of CalcLang Commands"
                                                                                                                  H.body $ do
                                                                                                                           H.h1 "History Of CalcLang Inputs"
                                                                                                                           H.pre $ H.toHtml (intercalate "\n" newHist)
                                                                         QuitVal -> H.docTypeHtml $ do
                                                                                                    H.head $ do
                                                                                                             H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/" :: Text))
                                                                         VoidVal -> H.docTypeHtml $ do
                                                                                                    H.head $ do
                                                                                                             H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/eval" :: Text))
                                                                         _ -> H.docTypeHtml $ do
                                                                                              H.head $ do
                                                                                                       H.title "Result Of Expression Or Command"
                                                                                              H.body $ do
                                                                                                       H.h1 "Expression Result:"
                                                                                                       H.pre $ H.toHtml (CalcLangInterpreter.toStr res)
                                                                                                       H.a ! A.href "/help" $ "Help using CalcLang"
                                                                                                       H.a ! A.href "/eval" $ "Evaluate CalcLang Operation"
                                                 Scott.html (renderHtml pageHtml)
                                                               
                           Scott.get "/eval" $ do
                                               let myInputForm = H.form ! A.action "/result" ! A.method "get" $ do
                                                                                                                H.h1 "Enter CalcLang Expression Or Command"
                                                                                                                H.label ! A.for "myInput" $ "Enter Equation"
                                                                                                                H.input ! A.type_ "text" ! A.id "myInput" ! A.name "userInput"
                                                                                                                H.input ! A.type_ "submit" ! A.value "Submit"
                                                                                                                H.a ! A.href "/" $ "Back To Intro"
                                                                                                                H.a ! A.href "/help" $ "Help Page"
                                               Scott.html (renderHtml myInputForm)
                                                                                           
