module Main where

import CalcLangParser
import CalcLangAstH
import CalcLangMarshall
import Foreign.Ptr
import Foreign.C.String
import System.IO
import System.Environment

foreign import ccall processASTList :: (Ptr CSA) -> CString -> IO ()

main :: IO ()
main = do
       args <- getArgs
       case args of
         [arg, arg2] -> do
                        contents <- (readFile arg)
                        let allLines = (lines contents)
                        result <- (runCalcLangParserSequence allLines)
                        array <- (marshallStorageArray result)
                        cArg2 <- newCString arg2
                        _ <- (processASTList array cArg2)
                        return ()
         [] -> putStrLn "Error no file path found!!!"
         (arg1:args) -> putStrLn "Error to many paths found!!!"


