module Main where

import CalcLangParser
import CalcLangAstH
import Foreign.Ptr
import Foreign.C.String

foreign import ccall processAST :: (Ptr CAstNode) -> IO ()

main :: IO ()
main = do
       line <- getLine
       cLine <- newCString line
       result <- runCalcLangParserC cLine
       processAST(result)
       return ()


