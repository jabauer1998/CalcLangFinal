module CalcLangParser(runCalcLangLexer, runCalcLangParser, runCalcLangParserSequence) where

import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Char
import System.IO
import Numeric
import CalcLangAstH
import CalcLangMarshall
import Foreign.C.String
import Foreign.Ptr
import Foreign.Marshal.Alloc
import Foreign.Storable
import Prelude
import Data.List
import System.Console.Haskeline
import Foreign.Ptr

type CalcLangLexer a b  = ParsecT String () a b

parseLexeme :: (Monad a) => (CalcLangLexer a b) -> (CalcLangLexer a b)
parseLexeme a = a <* spaces

parseWindowsNewLine :: (Monad a) => CalcLangLexer a Token
parseWindowsNewLine = do
                      start <- getPosition
                      (char '\r') >> (char '\n') >> return (NewLine start)

parseLinuxNewLine :: (Monad a) => CalcLangLexer a Token
parseLinuxNewLine = do
                    start <- getPosition
                    (char '\n') >> return (NewLine start)
                      

parseNewLine :: (Monad a) => CalcLangLexer a Token
parseNewLine = (try parseWindowsNewLine) <|> parseLinuxNewLine

parseIdent :: (Monad a) => CalcLangLexer a Token
parseIdent = do
             startPos <- getPosition
             restChars <- parseLexeme letter
             return (Ident restChars startPos)

parsePeriod :: (Monad a) => CalcLangLexer a Token
parsePeriod = do
              start <- getPosition
              parseLexeme (char '.')  >> return (Dot start)

parseNum :: (Monad a) => CalcLangLexer a Token
parseNum = (try parseRealNum) <|> try parseIntNum

parseRealNum :: (Monad a) => CalcLangLexer a Token
parseRealNum = do
               start <- getPosition
               result <- many1 digit
               _ <- parsePeriod
               resultRest <- parseLexeme (many1 digit)
               return (RealNum (result ++ ['.'] ++ resultRest) start)


parseIntNum :: (Monad a) => CalcLangLexer a Token
parseIntNum = do
              startPos <- getPosition
              result <- parseLexeme (many1 digit)
              return (IntNum  result startPos)

parseBool :: (Monad a) => CalcLangLexer a Token
parseBool = do
            startPos <- getPosition
            res <- parseLexeme (string "TRUE" <|> string "FALSE")
            return (TF res startPos)

parseComma :: (Monad a) => CalcLangLexer a Token
parseComma = do
             start <- getPosition
             parseLexeme (char ',') >> return (Comma start)

parsePlus :: (Monad a) => CalcLangLexer a Token
parsePlus = do
            startPosition <- getPosition
            parseLexeme (char '+') >> return (Plus startPosition)

parseMinus :: (Monad a) => CalcLangLexer a Token
parseMinus = do
             startPosition <- getPosition
             parseLexeme (char '-') >> return (Minus startPosition)

parseTimes :: (Monad a) => CalcLangLexer a Token
parseTimes = do
             startPosition <- getPosition
             parseLexeme (char '*') >> return (Minus startPosition)

parseNot :: (Monad a) => CalcLangLexer a Token
parseNot = do
           startPosition <- getPosition
           parseLexeme (char '\'') >> return (Not startPosition)
           
parseDiv :: (Monad a) => CalcLangLexer a Token
parseDiv = do
           startPosition <- getPosition
           parseLexeme (char '/') >> return (Div startPosition)

parseEq :: (Monad a) => CalcLangLexer a Token
parseEq = do
           startPosition <- getPosition
           parseLexeme (char '=') >> return (Eq startPosition)

parsePow :: (Monad a) => CalcLangLexer a Token
parsePow = do
           startPosition <- getPosition
           parseLexeme (char '^') >> return (Pow startPosition)

parseLPar :: (Monad a) => CalcLangLexer a Token
parseLPar = do
            start <- getPosition
            parseLexeme (char '(') >> return (LPar start)

parseRPar :: (Monad a) => CalcLangLexer a Token
parseRPar = do
            start <- getPosition
            parseLexeme (char ')') >> return (RPar start)

parseLBrack :: (Monad a) => CalcLangLexer a Token
parseLBrack = do
              start <- getPosition
              parseLexeme (char '{') >> return (LBrack start)

parseRBrack :: (Monad a) => CalcLangLexer a Token
parseRBrack = do
              start <- getPosition
              parseLexeme (char '}') >> return (RBrack start)

parseLT :: (Monad a) => CalcLangLexer a Token
parseLT = do
          startPosition <- getPosition
          parseLexeme (char '<') >> return (LessThen startPosition)

parseGT :: (Monad a) => CalcLangLexer a Token
parseGT = do
          startPosition <- getPosition
          parseLexeme (char '>') >> return (GreaterThen startPosition)

parseLtOrEq :: (Monad a) => CalcLangLexer a Token
parseLtOrEq = do
              startPosition <- getPosition
              parseLexeme (string "<=") >> return (LtOrEq startPosition)

parseGtOrEq :: (Monad a) => CalcLangLexer a Token
parseGtOrEq = do
              startPosition <- getPosition
              parseLexeme (string ">=") >> return (GtOrEq startPosition)

parseIf :: (Monad a) => CalcLangLexer a Token
parseIf = do
          startPosition <- getPosition
          (parseLexeme (string "if")) >> return (If startPosition)

parseThen :: (Monad a) => CalcLangLexer a Token
parseThen = do
            startPosition <- getPosition
            (parseLexeme (string "then")) >> return (Then startPosition)

parseElse :: (Monad a) => CalcLangLexer a Token
parseElse = do
            startPosition <- getPosition
            (parseLexeme (string "else")) >> return (Else startPosition)

parseFunc :: (Monad a) => CalcLangLexer a Token
parseFunc = do
            startPosition <- getPosition
            (parseLexeme (string "func")) >> return (Func startPosition)

parseLet :: (Monad a) => CalcLangLexer a Token
parseLet = do
           startPosition <- getPosition
           (parseLexeme (string "let")) >> return (Let startPosition)

parseDol :: (Monad a) => CalcLangLexer a Token
parseDol = do
           startPosition <- getPosition
           _ <- (char '$')
           d <- many1 digit
           p <- (char '.')
           d1 <- digit
           d2 <- parseLexeme digit
           return (Dol (d ++ [p, d1, d2]) startPosition)

parsePerc :: (Monad a) => CalcLangLexer a Token
parsePerc = do
            startPosition <- getPosition
            d <- many1 digit
            p <- (char '.')
            delse <- (many1 digit)
            _ <- parseLexeme (char '%')
            return (Perc (d ++ [p] ++ delse) startPosition)

parseShow :: (Monad a) => CalcLangLexer a Token
parseShow = do
            startPosition <- getPosition
            (parseLexeme (string "show")) >> return (ShowCmd startPosition)

parseFunctions :: (Monad a) => CalcLangLexer a Token
parseFunctions = do
                 startPosition <- getPosition
                 (parseLexeme (string "functions")) >> return (FunctionsCmd startPosition)

parseVariables :: (Monad a) => CalcLangLexer a Token
parseVariables = do
                 startPosition <- getPosition
                 (parseLexeme (string "variables")) >> return (VariablesCmd startPosition)

parseQuit :: (Monad a) => CalcLangLexer a Token
parseQuit = do
            startPosition <- getPosition
            (parseLexeme (string "quit")) >> return (QuitCmd startPosition)

parseCreate :: (Monad a) => CalcLangLexer a Token
parseCreate = do
              startPosition <- getPosition
              (parseLexeme (string "create")) >> return (CreateCmd startPosition)

parseLesson :: (Monad a) => CalcLangLexer a Token
parseLesson = do
              startPosition <- getPosition
              (parseLexeme (string "lesson")) >> return (LessonCmd startPosition)

parsePlan :: (Monad a) => CalcLangLexer a Token
parsePlan = do
            startPosition <- getPosition
            (parseLexeme (string "plan")) >> return (PlanCmd startPosition)

parseHistory :: (Monad a) => CalcLangLexer a Token
parseHistory = do
               startPosition <- getPosition
               (parseLexeme (string "history")) >> return (HistoryCmd startPosition)

parseHelp :: (Monad a) => CalcLangLexer a Token
parseHelp = do
            start <- getPosition
            (parseLexeme (string "help")) >> return (HelpCmd start)

parseWindowsSeperator ::  (Monad a) => CalcLangLexer a Token
parseWindowsSeperator = do
                        start <- getPosition
                        char '\\' >> return (PathSeperator '\\' start)

parseLinuxSeperator :: (Monad a) => CalcLangLexer a Token
parseLinuxSeperator = do
                      start <- getPosition
                      char '/' >> return (PathSeperator '/' start)

parseSeparator :: (Monad a) => CalcLangLexer a Token
parseSeparator = try parseLinuxSeperator <|> parseWindowsSeperator

parseComponent :: (Monad a) => CalcLangLexer a Token
parseComponent = do
                 start <- getPosition
                 toRet <- many1 (noneOf "\\/\"'")
                 return (PathComponent toRet start)

parseSingleQuote :: (Monad a) => CalcLangLexer a Token
parseSingleQuote = do
                   start <- getPosition
                   char '\'' >> return (SingleQuote start)

parseDoubleQuote :: (Monad a) => CalcLangLexer a Token
parseDoubleQuote = do
                   start <- getPosition
                   char '"' >> return (DoubleQuote start)

parseToken :: (Monad a) => CalcLangLexer a Token
parseToken = try parseSingleQuote <|> try parseDoubleQuote <|> try parseSeparator <|> try parseHelp <|> try parseShow <|> try parseHistory <|> try parseVariables <|> try parseFunctions <|> try parseQuit <|> try parseCreate <|> try parseLesson <|> try parsePlan <|> try parseElse <|> try parseThen <|> try parseIf <|> try parseGtOrEq <|> try parseLtOrEq <|> try parseGT <|> try parseLT <|> try parsePow <|> try parseEq <|> try parseNot <|> try parseDiv <|> try parseTimes <|> try parseMinus <|> try parsePlus <|> try parseLBrack <|> try parseRBrack <|> try parseComma <|> try parseLPar <|> try parseRPar <|> try parseFunc <|> try parseLet <|> try parseDol <|> try parsePerc <|> try parseNum <|> try parsePeriod <|> try parseBool <|> try parseIdent <|> try parseNewLine

parseTokens :: (Monad a) => CalcLangLexer a [Token]
parseTokens = spaces *> many parseToken

--The Lexer is completed as shown above it is a Parser that parses the program into a flat list of tokens. The rule order is important here because an Ident can also be Then or an if or a true. We need to check the most specific Parser first then go toward the least specific

--Next we need to design the Parser...
type CalcLangParser a b = ParsecT String () a b

parseBoolean :: (Monad a) => CalcLangParser a AstNode
parseBoolean = do
               start <- getPosition
               b <- parseBool
               case b of
                 (TF x _) -> return (BooleanAst start x)
                 _ -> return (ErrorNode "this is an error")


parseSet :: (Monad a) => CalcLangParser a AstNode
parseSet = do
           start <- getPosition
           _ <- parseLBrack
           x <- parseExpressionList
           _ <- parseRBrack
           return (SetAst start x)

parseTuple :: (Monad a) => CalcLangParser a AstNode
parseTuple = do
             start <- getPosition
             _ <- parseLPar
             x <- parseExpressionList
             _ <- parseRPar
             return (TupleAst start x)

parseIfExpr :: (Monad a) => CalcLangParser a AstNode
parseIfExpr = do
              start <- getPosition
              _ <- parseIf
              cond <- parseExpression
              _ <- parseThen
              ifTrue <- parseExpression
              _ <- parseElse
              ifFalse <- parseExpression
              return (IfExpr start cond ifTrue ifFalse)

parseDollarAst :: (Monad a) => CalcLangParser a AstNode
parseDollarAst = do
                 start <- getPosition
                 x <- parseDol
                 case x of
                   Dol a _ -> return (DollarAst start a)
                   _ -> return (ErrorNode "this is an error")

parsePercentAst :: (Monad a) => CalcLangParser a AstNode
parsePercentAst = do
                  start <- getPosition
                  x <- parsePerc
                  case x of
                    Perc a _ -> return (PercentAst start a)
                    _ -> return (ErrorNode "this is an error")


parseIntNumber :: (Monad a) => CalcLangParser a AstNode
parseIntNumber = do
                 startPosition <- getPosition
                 x <- parseIntNum
                 case x of
                   (IntNum s _) -> return (IntNumberAst startPosition s)
                   _ -> return (ErrorNode "Cant parse error node")

parseRealNumber :: (Monad a) => CalcLangParser a AstNode
parseRealNumber = do
                  startPosition <- getPosition
                  x <- parseRealNum
                  case x of
                    (RealNum s _) -> return (RealNumberAst startPosition s)
                    _ -> return (ErrorNode "Cant build real Num without real number")

parseNumber :: (Monad a) => CalcLangParser a AstNode
parseNumber = try parseRealNumber <|> try parseIntNumber
              

parseIdentifier :: (Monad a) => CalcLangParser a AstNode
parseIdentifier = do
                  startPosition <- getPosition
                  x <- parseIdent
                  case x of
                    Ident y _ -> return (IdentAst startPosition y)
                    _ -> return (ErrorNode "Error cant build identifier with no name")

parseFunctionCall :: (Monad a) => CalcLangParser a AstNode
parseFunctionCall = do
                    start <- getPosition
                    name <- parseIdentifier
                    _ <- parseLPar
                    l <- parseExpressionList
                    _ <- parseRPar
                    case name of
                          IdentAst _ n -> return (FunctionCall start n l)
                          _ -> return (ErrorNode "Error cant build function call with invalid name")
                          

parsePrimaryExpression :: (Monad a) => CalcLangParser a AstNode
parsePrimaryExpression = try parseDollarAst <|> try parsePercentAst <|> try parseNumber <|> try parseParenExpression <|> try parseTuple <|> try parseSet <|> try parseBoolean <|> try parseIfExpr <|> try parseFunctionCall <|> try parseIdentifier

parseParenExpression :: (Monad a) => CalcLangParser a AstNode
parseParenExpression = do
                       pos <- getPosition
                       _ <- parseLPar
                       x <- parseExpression
                       _ <- parseRPar
                       return (ParenExpr pos x)

parseUnaryOperation :: (Monad a) => CalcLangParser a AstNode
parseUnaryOperation = try parseNotOperation <|> try parseNegationOperation <|> parsePrimaryExpression


parseNegationOperation :: (Monad a) => CalcLangParser a AstNode
parseNegationOperation = do
                         start <- getPosition
                         _ <- parseMinus
                         rightExp <- parseUnaryOperation
                         return (NegateOperation start rightExp)
                         

parseNotOperation :: (Monad a) => CalcLangParser a AstNode
parseNotOperation = do
                    start <- getPosition
                    _ <- parseNot
                    leftExp <- parseUnaryOperation
                    return (NotOperation start leftExp)

parsePowerOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parsePowerOp = do
               start <- getPosition
               parsePow >> return (PowerOperation start)

parsePowerOperation :: (Monad a) => CalcLangParser a AstNode
parsePowerOperation = chainr1 parseUnaryOperation parsePowerOp

parseDivOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parseDivOp = do
             start <- getPosition
             parseDiv >> return (DivisionOperation start)
                    
parseMultOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parseMultOp = do
              start <- getPosition
              parseTimes >> return (MultiplicationOperation start)

parseDotOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parseDotOp = do
             start <- getPosition
             parsePeriod >> return (DotProductOperation start)

parseMultDivOp :: (Monad a) => CalcLangParser a AstNode
parseMultDivOp = chainl1 parsePowerOperation (try parseMultOp <|> try parseDivOp <|> try parseDotOp)

parseAddOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parseAddOp = do
             start <- getPosition
             parsePlus >> return (AdditionOperation start)

parseSubOp :: (Monad a) => CalcLangParser a (AstNode -> AstNode -> AstNode)
parseSubOp = do
             start <- getPosition
             parseMinus >> return (SubtractionOperation start)

parseAddSubOp :: (Monad a) => CalcLangParser a AstNode
parseAddSubOp = chainl1 parseMultDivOp (parseAddOp <|> parseSubOp)

parseExpression :: (Monad a) => CalcLangParser a  AstNode
parseExpression = parseBinaryOperation

parseLogicalOperation :: (Monad a) => CalcLangParser a AstNode
parseLogicalOperation = try parseEqualsOperation <|> try parseLessThenOrEqualsOperation <|> try parseLessThenOperation <|> try parseGreaterThenOperation <|> try parseGreaterThenOrEqualsOperation  

parseEqualsOperation :: (Monad a) => CalcLangParser a AstNode
parseEqualsOperation = do
                       start <- getPosition
                       x <- parseAddSubOp
                       _ <- parseEq
                       y <- parseAddSubOp
                       return (EqualOperation start x y)

parseLessThenOrEqualsOperation :: (Monad a) => CalcLangParser a AstNode
parseLessThenOrEqualsOperation = do
                                 start <- getPosition
                                 x <- parseAddSubOp
                                 _ <- parseLtOrEq
                                 y <- parseAddSubOp
                                 return (LessThenOrEqualsOperation start x y)

parseLessThenOperation :: (Monad a) => CalcLangParser a AstNode
parseLessThenOperation = do
                         start <- getPosition
                         x <- parseAddSubOp
                         _ <- parseLT
                         y <- parseAddSubOp
                         return (LessThenOperation start x y)

parseGreaterThenOrEqualsOperation :: (Monad a) => CalcLangParser a AstNode
parseGreaterThenOrEqualsOperation = do
                                    start <- getPosition
                                    x <- parseAddSubOp
                                    _ <- parseGtOrEq
                                    y <- parseAddSubOp
                                    return (GreaterThenOrEqualsOperation start x y)

parseGreaterThenOperation :: (Monad a) => CalcLangParser a AstNode
parseGreaterThenOperation = do
                            start <- getPosition
                            x <- parseAddSubOp
                            _ <- parseGT
                            y <- parseAddSubOp
                            return (GreaterThenOperation start x y)


                        

parseBinaryOperation :: (Monad a) => CalcLangParser a AstNode
parseBinaryOperation = try parseLogicalOperation <|> try parseAddSubOp

parseExpressionList :: (Monad a) => CalcLangParser a SA
parseExpressionList = do
                      x <- (sepBy1 parseExpression parseComma)
                      return (StoreArray (length x) (reverse x))


parseParamaters :: (Monad a) => CalcLangParser a SA
parseParamaters = do
                  x <- (sepBy parseIdentifier parseComma)
                  return (StoreArray (length x) (reverse x))

parseFunctionDefinition :: (Monad a) => CalcLangParser a AstNode
parseFunctionDefinition = do
                          pos <- getPosition
                          _ <- parseFunc
                          x <- parseIdentifier
                          _ <- parseLPar
                          y <- parseParamaters
                          _ <- parseRPar
                          _ <- parseEq
                          z <- parseExpression
                          case x of
                            IdentAst _ s -> return (FunctionDef pos s y z)
                            _ -> return (ErrorNode "Error Ident was not parsed")

parseMacroAssignment :: (Monad a) => CalcLangParser a AstNode
parseMacroAssignment = do
                       start <- getPosition
                       _ <- parseLet
                       x <- parseIdentifier
                       _ <- parseEq
                       e <- parseExpression
                       case x of
                         IdentAst _ s -> return (Assign start s e)
                         _ -> return (ErrorNode "identifier didnt parse correctly")
                            

parseShowFunctionsCommand :: (Monad a) => CalcLangParser a AstNode
parseShowFunctionsCommand = do
                            start <- getPosition
                            _ <- parseShow
                            _ <- parseFunctions
                            return (ShowFunctionsCommand start)

parseShowVariablesCommand :: (Monad a) => CalcLangParser a AstNode
parseShowVariablesCommand = do
                            start <- getPosition
                            _ <- parseShow
                            _ <- parseVariables
                            return (ShowVariablesCommand start)

parseShowHistoryCommand :: (Monad a) => CalcLangParser a AstNode
parseShowHistoryCommand = do
                          start <- getPosition
                          _ <- parseShow
                          _ <- parseHistory
                          return (ShowHistoryCommand start)

parseQuitCommand :: (Monad a) => CalcLangParser a AstNode
parseQuitCommand = do
                   start <- getPosition
                   _ <- parseQuit
                   return (QuitCommand start)
                   
parseStringPath :: (Monad a) => CalcLangParser a AstNode
parseStringPath = do
                  start <- getPosition
                  _ <- parseDoubleQuote
                  list <- sepBy1 parseComponent parseSeparator
                  let toStrList = (map tokToString list)
                  let fullPath = (intercalate "/" toStrList)
                  _ <- parseDoubleQuote
                  return (FullPath start fullPath)
                  
parseCharPath :: (Monad a) => CalcLangParser a AstNode
parseCharPath = do
                start <- getPosition
                _ <- parseSingleQuote
                list <- sepBy1 parseComponent parseSeparator
                let toStrList = (map tokToString list)
                let fullPath = (intercalate "/" toStrList)
                _ <- parseSingleQuote
                return (FullPath start fullPath)

parseDefaultPath :: (Monad a) => CalcLangParser a AstNode
parseDefaultPath = do
                   start <- getPosition
                   list <- sepBy1 parseComponent parseSeparator
                   let toStrList = (map tokToString list)
                   let fullPath = (intercalate "/" toStrList)
                   return (FullPath start fullPath)

parsePath :: (Monad a) => CalcLangParser a AstNode
parsePath = try parseStringPath <|> try parseCharPath <|> parseDefaultPath

parseLessonPlanCommand :: (Monad a) => CalcLangParser a AstNode
parseLessonPlanCommand = do
                         start <- getPosition
                         _ <- parseCreate
                         _ <- parseLesson
                         _ <- parsePlan
                         path <- parsePath
                         case path of
                           FullPath _ str -> return (CreateLessonPlanCommand start str)

parseHelpCommand :: (Monad a) => CalcLangParser a AstNode
parseHelpCommand = do
                   start <- getPosition
                   _ <- parseHelp
                   return (HelpCommand start)

parseCommand :: (Monad a) => CalcLangParser a AstNode
parseCommand = try parseHelpCommand <|> try parseShowFunctionsCommand <|> try parseShowHistoryCommand <|> try parseShowVariablesCommand <|> try parseQuitCommand <|> try parseLessonPlanCommand

  
parseAstNode :: (Monad a) => CalcLangParser a AstNode
parseAstNode = spaces *> (try parseCommand <|> try parseFunctionDefinition <|> try parseMacroAssignment <|> try parseExpression) <* eof

runCalcLangParser :: String -> IO AstNode
runCalcLangParser i = do
                      parseResult <- (runParserT parseAstNode () "" i)
                      case parseResult of
                         Left err -> return (ErrorNode (show err))
                         Right t -> return t

runCalcLangParserSequence :: [String] -> IO SA
runCalcLangParserSequence l = do
                              x <- (mapM runCalcLangParser l)
                              return (StoreArray (length x) x)
                              

readMyFile :: FilePath -> IO String
readMyFile filePath = readFile filePath

                

runCalcLangLexer :: String -> IO [Token]
runCalcLangLexer i = do
                     lexResult <- (runParserT parseTokens () "" i)
                     case lexResult of
                           Left err -> do
                                       return []
                           Right t -> return t
