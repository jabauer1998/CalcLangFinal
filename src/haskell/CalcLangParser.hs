module CalcLangParser(runCalcLangLexer, runCalcLangParser, runCalcLangParserSequence) where

import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Char
import System.IO
import Numeric
import CalcLangAstH
import Foreign.C.String
import Foreign.Ptr
import Foreign.Marshal.Alloc
import Foreign.Storable
import Prelude
import Data.List
import Foreign.Ptr

type CalcLangLexer b  = ParsecT String () IO b

parseLexeme :: (CalcLangLexer b) -> (CalcLangLexer b)
parseLexeme a = a <* spaces

parseWindowsNewLine :: CalcLangLexer Token
parseWindowsNewLine = do
                      start <- getPosition
                      (char '\r') >> (char '\n') >> return (NewLine start)

parseLinuxNewLine :: CalcLangLexer Token
parseLinuxNewLine = do
                    start <- getPosition
                    (char '\n') >> return (NewLine start)
                      

parseNewLine :: CalcLangLexer Token
parseNewLine = (try parseWindowsNewLine) <|> parseLinuxNewLine

parseIdent :: CalcLangLexer Token
parseIdent = do
             startPos <- getPosition
             restChars <- parseLexeme letter
             return (Ident restChars startPos)

parsePeriod :: CalcLangLexer Token
parsePeriod = do
              start <- getPosition
              parseLexeme (char '.')  >> return (Dot start)

parseNum :: CalcLangLexer Token
parseNum = (try parseRealNum) <|> try parseIntNum

parseRealNum :: CalcLangLexer Token
parseRealNum = do
               start <- getPosition
               result <- many1 digit
               _ <- parsePeriod
               resultRest <- parseLexeme (many1 digit)
               return (RealNum (result ++ ['.'] ++ resultRest) start)


parseIntNum :: CalcLangLexer Token
parseIntNum = do
              startPos <- getPosition
              result <- parseLexeme (many1 digit)
              return (IntNum  result startPos)

parseBool :: CalcLangLexer Token
parseBool = do
            startPos <- getPosition
            res <- parseLexeme (string "TRUE" <|> string "FALSE")
            return (TF res startPos)

parseComma :: CalcLangLexer Token
parseComma = do
             start <- getPosition
             parseLexeme (char ',') >> return (Comma start)

parsePlus :: CalcLangLexer Token
parsePlus = do
            startPosition <- getPosition
            parseLexeme (char '+') >> return (Plus startPosition)

parseMinus :: CalcLangLexer Token
parseMinus = do
             startPosition <- getPosition
             parseLexeme (char '-') >> return (Minus startPosition)

parseTimes :: CalcLangLexer Token
parseTimes = do
             startPosition <- getPosition
             parseLexeme (char '*') >> return (Minus startPosition)

parseNot :: CalcLangLexer Token
parseNot = do
           startPosition <- getPosition
           parseLexeme (char '\'') >> return (Not startPosition)
           
parseDiv :: CalcLangLexer Token
parseDiv = do
           startPosition <- getPosition
           parseLexeme (char '/') >> return (Div startPosition)

parseEq :: CalcLangLexer Token
parseEq = do
           startPosition <- getPosition
           parseLexeme (char '=') >> return (Eq startPosition)

parsePow :: CalcLangLexer Token
parsePow = do
           startPosition <- getPosition
           parseLexeme (char '^') >> return (Pow startPosition)

parseLPar :: CalcLangLexer Token
parseLPar = do
            start <- getPosition
            parseLexeme (char '(') >> return (LPar start)

parseRPar :: CalcLangLexer Token
parseRPar = do
            start <- getPosition
            parseLexeme (char ')') >> return (RPar start)

parseLBrack :: CalcLangLexer Token
parseLBrack = do
              start <- getPosition
              parseLexeme (char '{') >> return (LBrack start)

parseRBrack :: CalcLangLexer Token
parseRBrack = do
              start <- getPosition
              parseLexeme (char '}') >> return (RBrack start)

parseLT :: CalcLangLexer Token
parseLT = do
          startPosition <- getPosition
          parseLexeme (char '<') >> return (LessThen startPosition)

parseGT :: CalcLangLexer Token
parseGT = do
          startPosition <- getPosition
          parseLexeme (char '>') >> return (GreaterThen startPosition)

parseLtOrEq :: CalcLangLexer Token
parseLtOrEq = do
              startPosition <- getPosition
              parseLexeme (string "<=") >> return (LtOrEq startPosition)

parseGtOrEq :: CalcLangLexer Token
parseGtOrEq = do
              startPosition <- getPosition
              parseLexeme (string ">=") >> return (GtOrEq startPosition)

parseIf :: CalcLangLexer Token
parseIf = do
          startPosition <- getPosition
          (parseLexeme (string "if")) >> return (If startPosition)

parseThen :: CalcLangLexer Token
parseThen = do
            startPosition <- getPosition
            (parseLexeme (string "then")) >> return (Then startPosition)

parseElse :: CalcLangLexer Token
parseElse = do
            startPosition <- getPosition
            (parseLexeme (string "else")) >> return (Else startPosition)

parseFunc :: CalcLangLexer Token
parseFunc = do
            startPosition <- getPosition
            (parseLexeme (string "func")) >> return (Func startPosition)

parseLet :: CalcLangLexer Token
parseLet = do
           startPosition <- getPosition
           (parseLexeme (string "let")) >> return (Let startPosition)

parseDol :: CalcLangLexer Token
parseDol = do
           startPosition <- getPosition
           _ <- (char '$')
           d <- many1 digit
           p <- (char '.')
           d1 <- digit
           d2 <- parseLexeme digit
           return (Dol (d ++ [p, d1, d2]) startPosition)

parsePerc :: CalcLangLexer Token
parsePerc = do
            startPosition <- getPosition
            d <- many1 digit
            p <- (char '.')
            delse <- (many1 digit)
            _ <- parseLexeme (char '%')
            return (Perc (d ++ [p] ++ delse) startPosition)

parseShow :: CalcLangLexer Token
parseShow = do
            startPosition <- getPosition
            (parseLexeme (string "show")) >> return (ShowCmd startPosition)

parseFunctions :: CalcLangLexer Token
parseFunctions = do
                 startPosition <- getPosition
                 (parseLexeme (string "functions")) >> return (FunctionsCmd startPosition)

parseVariables :: CalcLangLexer Token
parseVariables = do
                 startPosition <- getPosition
                 (parseLexeme (string "variables")) >> return (VariablesCmd startPosition)

parseQuit :: CalcLangLexer Token
parseQuit = do
            startPosition <- getPosition
            (parseLexeme (string "quit")) >> return (QuitCmd startPosition)

parseCreate :: CalcLangLexer Token
parseCreate = do
              startPosition <- getPosition
              (parseLexeme (string "create")) >> return (CreateCmd startPosition)

parseLesson :: CalcLangLexer Token
parseLesson = do
              startPosition <- getPosition
              (parseLexeme (string "lesson")) >> return (LessonCmd startPosition)

parsePlan :: CalcLangLexer Token
parsePlan = do
            startPosition <- getPosition
            (parseLexeme (string "plan")) >> return (PlanCmd startPosition)

parseHistory :: CalcLangLexer Token
parseHistory = do
               startPosition <- getPosition
               (parseLexeme (string "history")) >> return (HistoryCmd startPosition)

parseHelp :: CalcLangLexer Token
parseHelp = do
            start <- getPosition
            (parseLexeme (string "help")) >> return (HelpCmd start)

parseWindowsSeperator ::  CalcLangLexer Token
parseWindowsSeperator = do
                        start <- getPosition
                        char '\\' >> return (PathSeperator '\\' start)

parseLinuxSeperator :: CalcLangLexer Token
parseLinuxSeperator = do
                      start <- getPosition
                      char '/' >> return (PathSeperator '/' start)

parseSeparator :: CalcLangLexer Token
parseSeparator = try parseLinuxSeperator <|> parseWindowsSeperator

parseComponent :: CalcLangLexer Token
parseComponent = do
                 start <- getPosition
                 toRet <- many1 (noneOf "\\/\"'")
                 return (PathComponent toRet start)

parseSingleQuote :: CalcLangLexer Token
parseSingleQuote = do
                   start <- getPosition
                   char '\'' >> return (SingleQuote start)

parseDoubleQuote :: CalcLangLexer Token
parseDoubleQuote = do
                   start <- getPosition
                   char '"' >> return (DoubleQuote start)

parseToken :: CalcLangLexer Token
parseToken = try parseSingleQuote <|> try parseDoubleQuote <|> try parseSeparator <|> try parseHelp <|> try parseShow <|> try parseHistory <|> try parseVariables <|> try parseFunctions <|> try parseQuit <|> try parseCreate <|> try parseLesson <|> try parsePlan <|> try parseElse <|> try parseThen <|> try parseIf <|> try parseGtOrEq <|> try parseLtOrEq <|> try parseGT <|> try parseLT <|> try parsePow <|> try parseEq <|> try parseNot <|> try parseDiv <|> try parseTimes <|> try parseMinus <|> try parsePlus <|> try parseLBrack <|> try parseRBrack <|> try parseComma <|> try parseLPar <|> try parseRPar <|> try parseFunc <|> try parseLet <|> try parseDol <|> try parsePerc <|> try parseNum <|> try parsePeriod <|> try parseBool <|> try parseIdent <|> try parseNewLine

parseTokens :: CalcLangLexer [Token]
parseTokens = spaces *> many parseToken

--The Lexer is completed as shown above it is a Parser that parses the program into a flat list of tokens. The rule order is important here because an Ident can also be Then or an if or a true. We need to check the most specific Parser first then go toward the least specific

--Next we need to design the Parser...
type CalcLangParser b = ParsecT String () IO b

parseBoolean :: CalcLangParser AstNode
parseBoolean = do
               start <- getPosition
               b <- parseBool
               case b of
                 (TF x _) -> return (BooleanAst start x)
                 _ -> return (ErrorNode "this is an error")


parseSet :: CalcLangParser AstNode
parseSet = do
           start <- getPosition
           _ <- parseLBrack
           x <- parseExpressionList
           _ <- parseRBrack
           return (SetAst start x)

parseTuple :: CalcLangParser AstNode
parseTuple = do
             start <- getPosition
             _ <- parseLPar
             x <- parseExpressionList
             _ <- parseRPar
             return (TupleAst start x)

parseIfExpr :: CalcLangParser AstNode
parseIfExpr = do
              start <- getPosition
              _ <- parseIf
              cond <- parseExpression
              _ <- parseThen
              ifTrue <- parseExpression
              _ <- parseElse
              ifFalse <- parseExpression
              return (IfExpr start cond ifTrue ifFalse)

parseDollarAst :: CalcLangParser AstNode
parseDollarAst = do
                 start <- getPosition
                 x <- parseDol
                 case x of
                   Dol a _ -> return (DollarAst start a)
                   _ -> return (ErrorNode "this is an error")

parsePercentAst :: CalcLangParser AstNode
parsePercentAst = do
                  start <- getPosition
                  x <- parsePerc
                  case x of
                    Perc a _ -> return (PercentAst start a)
                    _ -> return (ErrorNode "this is an error")


parseIntNumber :: CalcLangParser AstNode
parseIntNumber = do
                 startPosition <- getPosition
                 x <- parseIntNum
                 case x of
                   (IntNum s _) -> return (IntNumberAst startPosition s)
                   _ -> return (ErrorNode "Cant parse error node")

parseRealNumber :: CalcLangParser AstNode
parseRealNumber = do
                  startPosition <- getPosition
                  x <- parseRealNum
                  case x of
                    (RealNum s _) -> return (RealNumberAst startPosition s)
                    _ -> return (ErrorNode "Cant build real Num without real number")

parseNumber :: CalcLangParser AstNode
parseNumber = try parseRealNumber <|> try parseIntNumber
              

parseIdentifier :: CalcLangParser AstNode
parseIdentifier = do
                  startPosition <- getPosition
                  x <- parseIdent
                  case x of
                    Ident y _ -> return (IdentAst startPosition y)
                    _ -> return (ErrorNode "Error cant build identifier with no name")

parseFunctionCall :: CalcLangParser AstNode
parseFunctionCall = do
                    start <- getPosition
                    name <- parseIdentifier
                    _ <- parseLPar
                    l <- parseExpressionList
                    _ <- parseRPar
                    case name of
                          IdentAst _ n -> return (FunctionCall start n l)
                          _ -> return (ErrorNode "Error cant build function call with invalid name")
                          

parsePrimaryExpression :: CalcLangParser AstNode
parsePrimaryExpression = try parseDollarAst <|> try parsePercentAst <|> try parseNumber <|> try parseParenExpression <|> try parseTuple <|> try parseSet <|> try parseBoolean <|> try parseIfExpr <|> try parseFunctionCall <|> try parseIdentifier

parseParenExpression :: CalcLangParser AstNode
parseParenExpression = do
                       pos <- getPosition
                       _ <- parseLPar
                       x <- parseExpression
                       _ <- parseRPar
                       return (ParenExpr pos x)

parseUnaryOperation :: CalcLangParser AstNode
parseUnaryOperation = try parseNotOperation <|> try parseNegationOperation <|> parsePrimaryExpression


parseNegationOperation :: CalcLangParser AstNode
parseNegationOperation = do
                         start <- getPosition
                         _ <- parseMinus
                         rightExp <- parseUnaryOperation
                         return (NegateOperation start rightExp)
                         

parseNotOperation :: CalcLangParser AstNode
parseNotOperation = do
                    start <- getPosition
                    _ <- parseNot
                    leftExp <- parseUnaryOperation
                    return (NotOperation start leftExp)

parsePowerOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parsePowerOp = do
               start <- getPosition
               parsePow >> return (PowerOperation start)

parsePowerOperation :: CalcLangParser AstNode
parsePowerOperation = chainr1 parseUnaryOperation parsePowerOp

parseDivOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parseDivOp = do
             start <- getPosition
             parseDiv >> return (DivisionOperation start)
                    
parseMultOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parseMultOp = do
              start <- getPosition
              parseTimes >> return (MultiplicationOperation start)

parseDotOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parseDotOp = do
             start <- getPosition
             parsePeriod >> return (DotProductOperation start)

parseMultDivOp :: CalcLangParser AstNode
parseMultDivOp = chainl1 parsePowerOperation (try parseMultOp <|> try parseDivOp <|> try parseDotOp)

parseAddOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parseAddOp = do
             start <- getPosition
             parsePlus >> return (AdditionOperation start)

parseSubOp :: CalcLangParser (AstNode -> AstNode -> AstNode)
parseSubOp = do
             start <- getPosition
             parseMinus >> return (SubtractionOperation start)

parseAddSubOp :: CalcLangParser AstNode
parseAddSubOp = chainl1 parseMultDivOp (parseAddOp <|> parseSubOp)

parseExpression :: CalcLangParser  AstNode
parseExpression = parseBinaryOperation

parseLogicalOperation :: CalcLangParser AstNode
parseLogicalOperation = try parseEqualsOperation <|> try parseLessThenOrEqualsOperation <|> try parseLessThenOperation <|> try parseGreaterThenOperation <|> try parseGreaterThenOrEqualsOperation  

parseEqualsOperation :: CalcLangParser AstNode
parseEqualsOperation = do
                       start <- getPosition
                       x <- parseAddSubOp
                       _ <- parseEq
                       y <- parseAddSubOp
                       return (EqualOperation start x y)

parseLessThenOrEqualsOperation :: CalcLangParser AstNode
parseLessThenOrEqualsOperation = do
                                 start <- getPosition
                                 x <- parseAddSubOp
                                 _ <- parseLtOrEq
                                 y <- parseAddSubOp
                                 return (LessThenOrEqualsOperation start x y)

parseLessThenOperation :: CalcLangParser AstNode
parseLessThenOperation = do
                         start <- getPosition
                         x <- parseAddSubOp
                         _ <- parseLT
                         y <- parseAddSubOp
                         return (LessThenOperation start x y)

parseGreaterThenOrEqualsOperation :: CalcLangParser AstNode
parseGreaterThenOrEqualsOperation = do
                                    start <- getPosition
                                    x <- parseAddSubOp
                                    _ <- parseGtOrEq
                                    y <- parseAddSubOp
                                    return (GreaterThenOrEqualsOperation start x y)

parseGreaterThenOperation :: CalcLangParser AstNode
parseGreaterThenOperation = do
                            start <- getPosition
                            x <- parseAddSubOp
                            _ <- parseGT
                            y <- parseAddSubOp
                            return (GreaterThenOperation start x y)


                        

parseBinaryOperation :: CalcLangParser AstNode
parseBinaryOperation = try parseLogicalOperation <|> try parseAddSubOp

parseExpressionList :: CalcLangParser SA
parseExpressionList = do
                      x <- (sepBy1 parseExpression parseComma)
                      return (StoreArray (length x) (reverse x))


parseParamaters :: CalcLangParser SA
parseParamaters = do
                  x <- (sepBy parseIdentifier parseComma)
                  return (StoreArray (length x) (reverse x))

parseFunctionDefinition :: CalcLangParser AstNode
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

parseMacroAssignment :: CalcLangParser AstNode
parseMacroAssignment = do
                       start <- getPosition
                       _ <- parseLet
                       x <- parseIdentifier
                       _ <- parseEq
                       e <- parseExpression
                       case x of
                         IdentAst _ s -> return (Assign start s e)
                         _ -> return (ErrorNode "identifier didnt parse correctly")
                            

parseShowFunctionsCommand :: CalcLangParser AstNode
parseShowFunctionsCommand = do
                            start <- getPosition
                            _ <- parseShow
                            _ <- parseFunctions
                            return (ShowFunctionsCommand start)

parseShowVariablesCommand :: CalcLangParser AstNode
parseShowVariablesCommand = do
                            start <- getPosition
                            _ <- parseShow
                            _ <- parseVariables
                            return (ShowVariablesCommand start)

parseShowHistoryCommand :: CalcLangParser AstNode
parseShowHistoryCommand = do
                          start <- getPosition
                          _ <- parseShow
                          _ <- parseHistory
                          return (ShowHistoryCommand start)

parseQuitCommand :: CalcLangParser AstNode
parseQuitCommand = do
                   start <- getPosition
                   _ <- parseQuit
                   return (QuitCommand start)
                   
parseStringPath :: CalcLangParser AstNode
parseStringPath = do
                  start <- getPosition
                  _ <- parseDoubleQuote
                  list <- sepBy1 parseComponent parseSeparator
                  let toStrList = (map tokToString list)
                  let fullPath = (intercalate "/" toStrList)
                  _ <- parseDoubleQuote
                  return (FullPath start fullPath)
                  
parseCharPath :: CalcLangParser AstNode
parseCharPath = do
                start <- getPosition
                _ <- parseSingleQuote
                list <- sepBy1 parseComponent parseSeparator
                let toStrList = (map tokToString list)
                let fullPath = (intercalate "/" toStrList)
                _ <- parseSingleQuote
                return (FullPath start fullPath)

parseDefaultPath :: CalcLangParser AstNode
parseDefaultPath = do
                   start <- getPosition
                   list <- sepBy1 parseComponent parseSeparator
                   let toStrList = (map tokToString list)
                   let fullPath = (intercalate "/" toStrList)
                   return (FullPath start fullPath)

parsePath :: CalcLangParser AstNode
parsePath = try parseStringPath <|> try parseCharPath <|> parseDefaultPath

parseLessonPlanCommand :: CalcLangParser AstNode
parseLessonPlanCommand = do
                         start <- getPosition
                         _ <- parseCreate
                         _ <- parseLesson
                         _ <- parsePlan
                         path <- parsePath
                         case path of
                           FullPath _ str -> return (CreateLessonPlanCommand start str)

parseHelpCommand :: CalcLangParser AstNode
parseHelpCommand = do
                   start <- getPosition
                   _ <- parseHelp
                   return (HelpCommand start)

parseCommand :: CalcLangParser AstNode
parseCommand = try parseHelpCommand <|> try parseShowFunctionsCommand <|> try parseShowHistoryCommand <|> try parseShowVariablesCommand <|> try parseQuitCommand <|> try parseLessonPlanCommand

  
parseAstNode :: CalcLangParser AstNode
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
