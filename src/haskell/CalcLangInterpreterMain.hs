module Main where

import CalcLangInterpreter
import Foreign.Ptr
import Foreign.C.String
import System.Console.Haskeline
import System.Console.Haskeline.History
import CalcLangMarshall
import CalcLangParser
import CalcLangAstH
import Data.Char (isSpace)
import Control.Monad.IO.Class
import Data.Text.Chart (plot)


foreign import ccall processASTList :: (Ptr CSA) -> CString -> IO ()

isNotCommand :: AstNode -> Bool
isNotCommand node = case node of
                      ShowFunctionsCommand _ -> False
                      ShowVariablesCommand _ -> False
                      ShowHistoryCommand _ -> False
                      HelpCommand _ -> False
                      QuitCommand _ -> False
                      CreateLessonPlanCommand _ _ -> False
                      ErrorNode _ -> False
                      _ -> True
                  
filterLines :: SA -> SA
filterLines list = case list of
                     StoreArray len arrList -> do
                                               let newList = (filter isNotCommand arrList)
                                               StoreArray (length newList) (reverse newList)

runCommandLine :: Env -> FunctionTable -> InputT IO ()
runCommandLine vT fT = do
                       input <- (getInputLine ">>CalcLang>> ")
                       case input of
                         Just myInput -> if (all isSpace myInput) then (runCommandLine vT fT) else do
                                                                                                   parseResult <- liftIO (runCalcLangParser myInput)
                                                                                                   case parseResult of
                                                                                                      ErrorNode err -> do
                                                                                                                       outputStrLn err
                                                                                                                       runCommandLine vT fT
                                                                                                      t -> do
                                                                                                           let interpreterResult = (interpret t vT fT)
                                                                                                           case interpreterResult of
                                                                                                                   (VoidVal, x, y) -> runCommandLine x y
                                                                                                                   (QuitVal, _, _) -> do
                                                                                                                                      modifyHistory (const emptyHistory)
                                                                                                                                      return ()
                                                                                                                   (PrintVal j, x, y) -> do
                                                                                                                                         outputStrLn (toStr (PrintVal j))
                                                                                                                                         runCommandLine x y
                                                                                                                   (ReadHistoryCommandVal, x, y) -> do
                                                                                                                                                    history <- getHistory
                                                                                                                                                    let lines = (reverse (historyLines history))
                                                                                                                                                    mapM_ outputStrLn lines
                                                                                                                                                    runCommandLine x y
                                                                                                                   (HelpCommandVal, x, y) -> do
                                                                                                                                             contents <- liftIO $ readFile "help/files/Help.txt"
                                                                                                                                             outputStrLn contents
                                                                                                                                             runCommandLine x y
                                                                                                                   (CreateLessonPlanCommandVal str, x, y) -> do
                                                                                                                                                             history <- getHistory
                                                                                                                                                             let lines = (reverse (historyLines history))
                                                                                                                                                             parsedLines <- liftIO ((runCalcLangParserSequence lines))
                                                                                                                                                             let filteredLines = (filterLines parsedLines)
                                                                                                                                                             storeArray <- liftIO (marshallStorageArray filteredLines)
                                                                                                                                                             cStr <- liftIO (newCString str)
                                                                                                                                                             _ <- liftIO (processASTList storeArray cStr)
                                                                                                                                                             runCommandLine x y
                                                                                                                   (CreateGraphCommandIntVal ys, x, y) -> do
                                                                                                                                                 _ <- liftIO $ plot ys
                                                                                                                                                 runCommandLine x y
                                                                                                                   (a, x, y) -> do
                                                                                                                                outputStrLn (toStr a)
                                                                                                                                runCommandLine x y
                         Nothing -> (runCommandLine vT fT)


runCalcLang :: IO ()
runCalcLang = do
              let x = (Environment [])
              let y = (SymbolTable [])
              contents <- readFile "help/files/Intro.txt"
              putStrLn contents
              runInputT settings (runCommandLine x y) where
                settings = defaultSettings
                  { historyFile = Just ".CalcLangHistory.txt" -- Specify a file to store history
                  , autoAddHistory = True -- Automatically add non-blank lines to history
                  }


main :: IO ()
main = runCalcLang
