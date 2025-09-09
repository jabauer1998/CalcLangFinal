module Main where

import CalcLangParser
import CalcLangAstH
import Foreign.Ptr
import Foreign.C.String

foreign import ccall processAST :: (Ptr AstNode) -> IO ()
foreign import ccall processASTList :: (Ptr CSA) -> IO ()

main :: IO ()
main = do
       line <- getLine
       cLine <- newCString line
       result <- runCalcLangProgramParserC cLine
       processASTList result
       return ()


