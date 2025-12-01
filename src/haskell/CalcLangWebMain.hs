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
import Network.Wai.Middleware.Static
import Foreign.C.String (CString, newCString)
import Foreign.Ptr (Ptr)
import Network.Wai.Handler.Warp
import Data.Text.Encoding (encodeUtf8)

import CalcLangInterpreter
import CalcLangParser
import CalcLangAstH
import CalcLangMarshall

-- Session storage for variables and functions

data MySession = MySession { variableTable :: IORef.IORef Env,
                             functionTable :: IORef.IORef FunctionTable }

type MySessionMap = IORef.IORef (Map.Map BS.ByteString (IORef.IORef MySession))

foreign import ccall processASTListWithTriple :: Ptr CSA -> CString -> CString -> IO ()

isCommand :: AstNode -> Bool
isCommand node = case node of
                   ShowFunctionsCommand _ -> True
                   ShowVariablesCommand _ -> True
                   ShowHistoryCommand _ -> True
                   QuitCommand _ -> True
                   HelpCommand _ -> True
                   CreateLessonPlanCommand _ _ -> True
                   _ -> False

main :: IO ()
main = do
        -- Initialize session storage
       vT <- IORef.newIORef (Environment [])
       fT <- IORef.newIORef (SymbolTable [])
       hist <- IORef.newIORef []

       args <- getArgs
       (port, ipAddr) <- case args of
         [] -> do
               putStrLn "No Command Line arguments found defaulting to port 5000"
               return (5000, "127.0.0.1")
         [arg1] -> case readMaybe arg1 :: Maybe Int of
                     Just num -> return (num, "127.0.0.1")
                     Nothing -> do
                                putStrLn ("Command Line port expected but found " ++ arg1 ++ "\n defaulting to port 5000")
                                return (5000, "127.0.0.1")    
         (arg1:arg2:_) -> case (readMaybe arg1 :: Maybe Int, readMaybe arg2 :: Maybe HostPreference) of
                            (Just num, Just ip) -> do
                                                   return (num, ip)
                            (Nothing, Just ip) -> do
                                                  putStrLn ("Command Line port expected but found nothing \n defaulting to port 5000")
                                                  return (5000, ip)
                            (Nothing, Nothing) -> do
                                                  putStrLn ("Command Line Port and Ip expected defaulting to localhost and port 5000")
                                                  return (5000, "127.0.0.1")
                            (Just num, Nothing) -> do
                                                   putStrLn ("No ip found defaulting to localhost")
                                                   return (num, "127.0.0.1")
    
       putStrLn $ "Starting CalcLang Web Server on " ++ (show ipAddr) ++ ":" ++ (show port)
       let settings = setHost ipAddr $ setPort port defaultSettings
       Scott.scottyOpts (Scott.Options 1 settings) $ do
                           Scott.middleware $ staticPolicy (noDots >-> hasPrefix "css/" >-> addBase "src/")
                           Scott.get "/" $ do
                                           fileContent <- liftIO $ readFile "./help/files/Intro.txt"
                                           let pageHtml = H.docTypeHtml $ do
                                                                          H.head $ do
                                                                                   H.title "Intro To CalcLang"
                                                                                   H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
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
                                                                                       H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                              H.body $ do
                                                                                       H.h1 "Intro To CalcLang:"
                                                                                       H.pre $ H.toHtml fileContent -- Display raw content in <pre> tag
                                                                                       H.a ! href "/" $ "Back to Intro"
                                                                                       H.a ! A.href "/eval" $ "Evaluate CalcLang"
                                               Scott.html (renderHtml pageHtml)
                           Scott.get "/clp/:pathFile" $ do
                                              fileName <- Scott.pathParam "pathFile" :: Scott.ActionM TL.Text
                                              let targetTripleForm = H.docTypeHtml $ do
                                                                                     H.head $ do
                                                                                              H.title "Choose Target Triple"
                                                                                              H.link ! A.rel "stylesheet" ! A.href "../css/StyleSheet.css"
                                                                                     H.body $ do
                                                                                              H.h1 "Choose Target Triple"
                                                                                              H.form ! A.action "/compile" ! A.method "get" $ do
                                                                                                                                              H.label ! A.for "fileInput" $ "Enter File Name:"
                                                                                                                                              H.input ! A.type_ "text" ! A.id "fileInput" ! A.name "fileInput" ! A.value (toValue fileName)
                                                                                                                                              H.label ! A.for "arch" $ "Architecture:"
                                                                                                                                              H.select ! A.id "arch" ! A.name "arch" $ do
                                                                                                                                                H.option ! A.value "x86_64" $ "x86_64"
                                                                                                                                                H.option ! A.value "i386" $ "i386"
                                                                                                                                                H.option ! A.value "aarch64" $ "aarch64"
                                                                                                                                                H.option ! A.value "arm" $ "arm"
                                                                                                                                                H.option ! A.value "riscv64" $ "riscv64"
                                                                                                                                              H.label ! A.for "vendor" $ "Vendor:"
                                                                                                                                              H.select ! A.id "vendor" ! A.name "vendor" $ do
                                                                                                                                                H.option ! A.value "unknown" $ "unknown"
                                                                                                                                                H.option ! A.value "pc" $ "pc"
                                                                                                                                                H.option ! A.value "apple" $ "apple"
                                                                                                                                                H.option ! A.value "nvidia" $ "nvidia"
                                                                                                                                              H.label ! A.for "os" $ "Operating System:"
                                                                                                                                              H.select ! A.id "os" ! A.name "os" $ do
                                                                                                                                                H.option ! A.value "linux-gnu" $ "linux-gnu"
                                                                                                                                                H.option ! A.value "darwin" $ "darwin"
                                                                                                                                                H.option ! A.value "windows-msvc" $ "windows-msvc"
                                                                                                                                                H.option ! A.value "freebsd" $ "freebsd"
                                                                                                                                              H.input ! A.type_ "submit" ! A.value "Generate Target Triple"
                                                                                              H.a ! A.href "/" $ "Back To Intro"
                                                                                              H.a ! A.href "/eval" $ "Evaluate CalcLang"
                                              Scott.html (renderHtml targetTripleForm)
                           Scott.get "/compile" $ do
                                                 newFileName <- Scott.queryParam "fileInput" :: Scott.ActionM TL.Text
                                                 arch <- Scott.queryParam "arch" :: Scott.ActionM TL.Text
                                                 vendor <- Scott.queryParam "vendor" :: Scott.ActionM TL.Text
                                                 os <- Scott.queryParam "os" :: Scott.ActionM TL.Text
                                                 let targetTriple = TL.unpack $ arch <> "-" <> vendor <> "-" <> os
                                                 let fileName = TL.unpack newFileName
                                                 ioHist <- liftIO $ IORef.readIORef hist
                                                 let filteredHist = filter (not . isCommand) ioHist
                                                 _ <- liftIO $ putStrLn $ show filteredHist 
                                                 let astArray = StoreArray (length filteredHist) (reverse filteredHist)
                                                 marshalledASTPtr <- liftIO $ marshallStorageArray astArray
                                                 fileNameC <- liftIO $ newCString fileName
                                                 targetTripleC <- liftIO $ newCString targetTriple
                                                 liftIO $ processASTListWithTriple marshalledASTPtr fileNameC targetTripleC
                                                 Scott.setHeader "Content-Disposition" (TL.pack $ "attachment; filename=\"" ++ fileName ++ "\"")
                                                 Scott.setHeader "Content-Type" "application/octet-stream"
                                                 Scott.file fileName
                                                 
                           Scott.get "/result" $ do
                                                 param <- Scott.queryParam "userInput"
                                                 parseResult <- liftIO (runCalcLangParser param)
                                                 oldHist <- liftIO (IORef.readIORef hist)
                                                 let newHist = oldHist ++ [parseResult]
                                                 _ <- liftIO (IORef.writeIORef hist newHist)
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
                                                                                                                  H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                         H.body $ do
                                                                                                                  H.h1 "Error Detected:"
                                                                                                                  H.pre $ H.toHtml (CalcLangInterpreter.toStr res)
                                                                                                                  H.a ! A.href "/" $ "Back To Intro"
                                                                                                                  H.a ! A.href "/help" $ "Help using CalcLang"
                                                                         HelpCommandVal -> H.docTypeHtml $ do
                                                                                                           H.head $ do
                                                                                                                    H.title "Reloading Page"
                                                                                                                    H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                                    H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/help" :: Text))
                                                                         ReadHistoryCommandVal -> H.docTypeHtml $ do
                                                                                                                  H.head $ do
                                                                                                                           H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                                           H.title "History Of CalcLang Commands"
                                                                                                                  H.body $ do
                                                                                                                           H.h1 "History Of CalcLang Inputs"
                                                                                                                           H.pre $ H.toHtml (intercalate "\n" (Prelude.map CalcLangAstH.toString newHist))
                                                                                                                           H.a ! A.href "/" $ "Back To Intro"
                                                                                                                           H.a ! A.href "/help" $ "Help using CalcLang"
                                                                                                                           H.a ! A.href "/eval" $ "Evaluate CalcLang Operation"
                                                                         CreateLessonPlanCommandVal x -> H.docTypeHtml $ do
                                                                                                                   H.head $ do
                                                                                                                            H.title "Reloading Page"
                                                                                                                            H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                                            H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ (("0;url=/clp/" <> (TL.pack x)) :: Text))
                                                                         QuitVal -> H.docTypeHtml $ do
                                                                                                    H.head $ do
                                                                                                             H.title "Reloading Page"
                                                                                                             H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css" 
                                                                                                             H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/" :: Text))
                                                                         VoidVal -> H.docTypeHtml $ do
                                                                                                    H.head $ do
                                                                                                             H.title "Reloading Page"
                                                                                                             H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                             H.meta ! A.httpEquiv "refresh" ! A.content (toValue $ ("0;url=/eval" :: Text))
                                                                         _ -> H.docTypeHtml $ do
                                                                                              H.head $ do
                                                                                                       H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                       H.title "Result Of Expression Or Command"
                                                                                              H.body $ do
                                                                                                       H.h1 "Expression Result:"
                                                                                                       H.pre $ H.toHtml (CalcLangInterpreter.toStr res)
                                                                                                       H.a ! A.href "/help" $ "Help using CalcLang"
                                                                                                       H.a ! A.href "/eval" $ "Evaluate CalcLang Operation"
                                                 Scott.html (renderHtml pageHtml)
                                                               
                           Scott.get "/eval" $ do
                                               let myInputForm = H.docTypeHtml $ do
                                                                                 H.head $ do
                                                                                          H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                          H.title "Enter CalcLang Expression Or Command"
                                                                                 H.body $ do
                                                                                          H.h1 "Enter in CalcLang Expression Or Command"
                                                                                          H.form ! A.action "/result" ! A.method "get" $ do
                                                                                                                                         H.label ! A.for "myInput" $ "Enter Equation"
                                                                                                                                         H.input ! A.type_ "text" ! A.id "myInput" ! A.name "userInput"
                                                                                                                                         H.input ! A.type_ "submit" ! A.value "Submit"
                                                                                          H.a ! A.href "/" $ "Back To Intro"
                                                                                          H.a ! A.href "/help" $ "Help Page"
                                               Scott.html (renderHtml myInputForm)
                                                                                           
