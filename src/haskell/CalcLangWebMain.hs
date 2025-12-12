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
import Network.Wai.Handler.Warp (Settings, defaultSettings, setHost, setPort, HostPreference)
import qualified Network.Wai.Handler.Warp as Warp
import Network.Wai (Application)
import Network.Wai.Middleware.Static
import Foreign.C.String (CString, newCString)
import Foreign.Ptr (Ptr)
import Network.Wai.Handler.Warp
import Data.Text.Encoding (encodeUtf8)
import qualified Data.String

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
         (arg1:arg2:_) -> case readMaybe arg1 :: Maybe Int of
                            Just num -> return (num, Data.String.fromString arg2)
                            Nothing -> do
                                       putStrLn ("Command Line port expected but found " ++ arg1 ++ "\n defaulting to port 5000")
                                       return (5000, Data.String.fromString arg2)
    
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
                                                                                                                                                H.option ! A.value "linux-musl" $ "Linux (musl)"
                                                                                                                                                H.option ! A.value "linux-gnu" $ "Linux (glibc)"
                                                                                                                                                H.option ! A.value "darwin" $ "macOS"
                                                                                                                                                H.option ! A.value "windows-msvc" $ "Windows"
                                                                                                                                                H.option ! A.value "freebsd" $ "FreeBSD"
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
                                                                                          H.a ! A.href "/graph" $ "Graph a Function"
                                               Scott.html (renderHtml myInputForm)

                           Scott.get "/graph" $ do
                                               myFTBefore <- liftIO (IORef.readIORef fT)
                                               let funcList = getFunctionNames myFTBefore
                                               let graphForm = H.docTypeHtml $ do
                                                                               H.head $ do
                                                                                        H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                        H.title "Graph a Function"
                                                                               H.body $ do
                                                                                        H.h1 "Graph a Function"
                                                                                        H.p "First define a function using the eval page, then graph it here."
                                                                                        H.p $ H.toHtml $ "Available functions: " ++ (if Prelude.null funcList then "(none defined)" else intercalate ", " funcList)
                                                                                        H.form ! A.action "/graph-result" ! A.method "get" $ do
                                                                                                 H.div ! A.class_ "form-group" $ do
                                                                                                          H.label ! A.for "funcName" $ "Function Name (single letter):"
                                                                                                          H.input ! A.type_ "text" ! A.id "funcName" ! A.name "funcName" ! A.maxlength "1" ! A.placeholder "f"
                                                                                                 H.div ! A.class_ "form-group" $ do
                                                                                                          H.label ! A.for "fromVal" $ "From (start x value):"
                                                                                                          H.input ! A.type_ "number" ! A.id "fromVal" ! A.name "fromVal" ! A.value "-10"
                                                                                                 H.div ! A.class_ "form-group" $ do
                                                                                                          H.label ! A.for "toVal" $ "To (end x value):"
                                                                                                          H.input ! A.type_ "number" ! A.id "toVal" ! A.name "toVal" ! A.value "10"
                                                                                                 H.div ! A.class_ "form-group" $ do
                                                                                                          H.label ! A.for "stepVal" $ "Step (increment):"
                                                                                                          H.input ! A.type_ "number" ! A.id "stepVal" ! A.name "stepVal" ! A.value "1"
                                                                                                 H.input ! A.type_ "submit" ! A.value "Generate Graph"
                                                                                        H.a ! A.href "/eval" $ "Define a Function"
                                                                                        H.a ! A.href "/" $ "Back To Intro"
                                               Scott.html (renderHtml graphForm)

                           Scott.get "/graph-result" $ do
                                                      funcNameParam <- Scott.queryParam "funcName" :: Scott.ActionM TL.Text
                                                      fromValParam <- Scott.queryParam "fromVal" :: Scott.ActionM TL.Text
                                                      toValParam <- Scott.queryParam "toVal" :: Scott.ActionM TL.Text
                                                      stepValParam <- Scott.queryParam "stepVal" :: Scott.ActionM TL.Text
                                                      let funcName = if TL.null funcNameParam then 'f' else TL.head funcNameParam
                                                      let fromVal = maybe (-10) Prelude.id (readMaybe (TL.unpack fromValParam) :: Maybe Int)
                                                      let toVal = maybe 10 Prelude.id (readMaybe (TL.unpack toValParam) :: Maybe Int)
                                                      let stepVal = maybe 1 Prelude.id (readMaybe (TL.unpack stepValParam) :: Maybe Int)
                                                      myVTBefore <- liftIO (IORef.readIORef vT)
                                                      myFTBefore <- liftIO (IORef.readIORef fT)
                                                      let graphData = computeGraphData funcName fromVal toVal stepVal myVTBefore myFTBefore
                                                      let pageHtml = case graphData of
                                                                       Left errMsg -> H.docTypeHtml $ do
                                                                                                      H.head $ do
                                                                                                               H.title "Graph Error"
                                                                                                               H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                      H.body $ do
                                                                                                               H.h1 "Error Generating Graph"
                                                                                                               H.pre $ H.toHtml errMsg
                                                                                                               H.a ! A.href "/graph" $ "Try Again"
                                                                                                               H.a ! A.href "/eval" $ "Define a Function"
                                                                       Right points -> H.docTypeHtml $ do
                                                                                                        H.head $ do
                                                                                                                 H.title $ H.toHtml $ "Graph of " ++ [funcName] ++ "(x)"
                                                                                                                 H.link ! A.rel "stylesheet" ! A.href "css/StyleSheet.css"
                                                                                                                 H.style $ H.toHtml graphStyles
                                                                                                        H.body $ do
                                                                                                                 H.h1 $ H.toHtml $ "Graph of " ++ [funcName] ++ "(x)"
                                                                                                                 H.div ! A.id "graph-container" $ do
                                                                                                                          H.canvas ! A.id "graphCanvas" ! A.width "800" ! A.height "500" $ ""
                                                                                                                 H.div ! A.class_ "graph-info" $ do
                                                                                                                          H.p $ H.toHtml $ "Range: x = " ++ show fromVal ++ " to " ++ show toVal ++ ", step = " ++ show stepVal
                                                                                                                          H.p $ H.toHtml $ "Points: " ++ show (length points)
                                                                                                                 H.script $ H.toHtml $ graphScript points fromVal toVal
                                                                                                                 H.a ! A.href "/graph" $ "Graph Another Function"
                                                                                                                 H.a ! A.href "/eval" $ "Evaluate CalcLang"
                                                      Scott.html (renderHtml pageHtml)

getFunctionNames :: FunctionTable -> [String]
getFunctionNames ft = case ft of
                        SymbolTable entries -> Prelude.map (\(c, _) -> [c]) entries

computeGraphData :: Char -> Int -> Int -> Int -> Env -> FunctionTable -> Either String [(Int, Double)]
computeGraphData funcName fromVal toVal stepVal vT fT =
    let entry = CalcLangInterpreter.getEntryFromTable fT funcName
    in case entry of
         Nothing -> Left $ "Function '" ++ [funcName] ++ "' not found. Please define it first using: func " ++ [funcName] ++ "(x) = <expression>"
         Just (params, retExpr) ->
           let xVals = [fromVal, fromVal + stepVal .. toVal]
               evalPoint x =
                 let zippedData = zipWith (\p _ -> (getParamChar p, IntVal x)) params [1..]
                     addedScopeEnv = addScopeToEnv vT
                     vTable = foldl (\table tuple -> addEntryToEnv table tuple) addedScopeEnv zippedData
                     (retVal, _, _) = interpret retExpr vTable fT
                 in (x, valToDouble retVal)
               points = Prelude.map evalPoint xVals
           in Right points

getParamChar :: AstNode -> Char
getParamChar node = case node of
                      IdentAst _ c -> c
                      _ -> 'x'

valToDouble :: CalcLangValue -> Double
valToDouble val = case val of
                    IntVal i -> fromIntegral i
                    RealVal d -> d
                    PercentVal p -> p
                    DollarVal d -> d
                    BoolVal b -> if b then 1.0 else 0.0
                    _ -> 0.0

graphStyles :: String
graphStyles = unlines
  [ "#graph-container { background: #1a1a2e; border-radius: 12px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 20px rgba(0,0,0,0.3); }"
  , "#graphCanvas { display: block; margin: 0 auto; background: #16213e; border-radius: 8px; }"
  , ".graph-info { text-align: center; margin-top: 15px; color: #a0a0a0; }"
  , ".graph-info p { margin: 5px 0; }"
  ]

graphScript :: [(Int, Double)] -> Int -> Int -> String
graphScript points fromVal toVal = unlines
  [ "const canvas = document.getElementById('graphCanvas');"
  , "const ctx = canvas.getContext('2d');"
  , "const width = canvas.width;"
  , "const height = canvas.height;"
  , "const padding = 50;"
  , ""
  , "const points = " ++ pointsToJS points ++ ";"
  , ""
  , "const xMin = " ++ show fromVal ++ ";"
  , "const xMax = " ++ show toVal ++ ";"
  , "const yVals = points.map(p => p.y);"
  , "const yMin = Math.min(...yVals);"
  , "const yMax = Math.max(...yVals);"
  , "const yRange = yMax - yMin || 1;"
  , "const yPadding = yRange * 0.1;"
  , ""
  , "function scaleX(x) { return padding + ((x - xMin) / (xMax - xMin)) * (width - 2 * padding); }"
  , "function scaleY(y) { return height - padding - ((y - (yMin - yPadding)) / (yRange + 2 * yPadding)) * (height - 2 * padding); }"
  , ""
  , "ctx.strokeStyle = '#3a3a5c';"
  , "ctx.lineWidth = 1;"
  , "ctx.beginPath();"
  , "for (let i = 0; i <= 10; i++) {"
  , "  const x = padding + (i / 10) * (width - 2 * padding);"
  , "  ctx.moveTo(x, padding);"
  , "  ctx.lineTo(x, height - padding);"
  , "  const y = padding + (i / 10) * (height - 2 * padding);"
  , "  ctx.moveTo(padding, y);"
  , "  ctx.lineTo(width - padding, y);"
  , "}"
  , "ctx.stroke();"
  , ""
  , "ctx.strokeStyle = '#6c63ff';"
  , "ctx.lineWidth = 2;"
  , "if (scaleY(0) >= padding && scaleY(0) <= height - padding) {"
  , "  ctx.beginPath();"
  , "  ctx.moveTo(padding, scaleY(0));"
  , "  ctx.lineTo(width - padding, scaleY(0));"
  , "  ctx.stroke();"
  , "}"
  , "if (scaleX(0) >= padding && scaleX(0) <= width - padding) {"
  , "  ctx.beginPath();"
  , "  ctx.moveTo(scaleX(0), padding);"
  , "  ctx.lineTo(scaleX(0), height - padding);"
  , "  ctx.stroke();"
  , "}"
  , ""
  , "ctx.strokeStyle = '#e94560';"
  , "ctx.lineWidth = 3;"
  , "ctx.beginPath();"
  , "if (points.length > 0) {"
  , "  ctx.moveTo(scaleX(points[0].x), scaleY(points[0].y));"
  , "  for (let i = 1; i < points.length; i++) {"
  , "    ctx.lineTo(scaleX(points[i].x), scaleY(points[i].y));"
  , "  }"
  , "}"
  , "ctx.stroke();"
  , ""
  , "ctx.fillStyle = '#e94560';"
  , "points.forEach(p => {"
  , "  ctx.beginPath();"
  , "  ctx.arc(scaleX(p.x), scaleY(p.y), 4, 0, 2 * Math.PI);"
  , "  ctx.fill();"
  , "});"
  , ""
  , "ctx.fillStyle = '#a0a0a0';"
  , "ctx.font = '12px Arial';"
  , "ctx.textAlign = 'center';"
  , "for (let i = 0; i <= 5; i++) {"
  , "  const xVal = xMin + (i / 5) * (xMax - xMin);"
  , "  ctx.fillText(xVal.toFixed(0), scaleX(xVal), height - padding + 20);"
  , "}"
  , "ctx.textAlign = 'right';"
  , "for (let i = 0; i <= 5; i++) {"
  , "  const yVal = (yMin - yPadding) + (i / 5) * (yRange + 2 * yPadding);"
  , "  ctx.fillText(yVal.toFixed(1), padding - 10, scaleY(yVal) + 4);"
  , "}"
  ]

pointsToJS :: [(Int, Double)] -> String
pointsToJS pts = "[" ++ intercalate "," (Prelude.map (\(x,y) -> "{x:" ++ show x ++ ",y:" ++ show y ++ "}") pts) ++ "]"
