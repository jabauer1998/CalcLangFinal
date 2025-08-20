module CalcLangParser(runCalcLangLexer, runCalcLangParser) where

import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Char
import Data.Text (Text)
import System.IO
import Numeric
import CalcLangAst

type CalcLangLexer a = ParsecT String () IO a

parseLexeme :: (CalcLangLexer a) -> (CalcLangLexer a)
parseLexeme a = a <* spaces

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
               parsePeriod
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
           c <- (char '$')
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
            parseLexeme (char '%')
            return (Perc (d ++ [p] ++ delse) startPosition)
            
            

parseToken :: CalcLangLexer Token
parseToken = try parseElse <|> try parseThen <|> try parseIf <|> try parseGtOrEq <|> try parseLtOrEq <|> try parseGT <|> try parseLT <|> try parsePow <|> try parseEq <|> try parseNot <|> try parseDiv <|> try parseTimes <|> try parseMinus <|> try parsePlus <|> try parseLBrack <|> try parseRBrack <|> try parseComma <|> try parseLPar <|> try parseRPar <|> try parseFunc <|> try parseLet <|> try parseDol <|> try parsePerc <|> try parseNum <|> try parsePeriod <|> try parseBool <|> try parseIdent

parseTokens :: CalcLangLexer [Token]
parseTokens = spaces *> many parseToken

--The Lexer is completed as shown above it is a Parser that parses the program into a flat list of tokens. The rule order is important here because an Ident can also be Then or an if or a true. We need to check the most specific Parser first then go toward the least specific

--Next we need to design the Parser...
type CalcLangParser a = ParsecT String () IO a

parseBoolean :: CalcLangParser AstNode
parseBoolean = do
               start <- getPosition
               b <- parseBool
               case b of
                 (TF x _) -> return (BooleanAst start x)


parseSet :: CalcLangParser AstNode
parseSet = do
           start <- getPosition
           parseLBrack
           x <- parseExpressionList
           parseRBrack
           return (SetAst start x)

parseTuple :: CalcLangParser AstNode
parseTuple = do
             start <- getPosition
             parseLPar
             x <- parseExpressionList
             parseRPar
             return (TupleAst start x)

parseIfExpr :: CalcLangParser AstNode
parseIfExpr = do
              start <- getPosition
              parseIf
              cond <- parseExpression
              parseThen
              ifTrue <- parseExpression
              parseElse
              ifFalse <- parseExpression
              return (IfExpr start cond ifTrue ifFalse)

parseDollarAst :: CalcLangParser AstNode
parseDollarAst = do
                 start <- getPosition
                 x <- parseDol
                 case x of
                   Dol a p -> return (DollarAst start a)

parsePercentAst :: CalcLangParser AstNode
parsePercentAst = do
                  start <- getPosition
                  x <- parsePerc
                  case x of
                    Perc a p -> return (PercentAst start a)


parseIntNumber :: CalcLangParser AstNode
parseIntNumber = do
                 startPosition <- getPosition
                 x <- parseIntNum
                 case x of
                   (IntNum s p) -> return (IntNumberAst p s)

parseRealNumber :: CalcLangParser AstNode
parseRealNumber = do
                  startPosition <- getPosition
                  x <- parseRealNum
                  case x of
                    (RealNum s p) -> return (RealNumberAst startPosition s)

parseNumber :: CalcLangParser AstNode
parseNumber = try parseRealNumber <|> try parseIntNumber
              

parseIdentifier :: CalcLangParser AstNode
parseIdentifier = do
                  startPosition <- getPosition
                  x <- parseIdent
                  case x of
                    Ident y _ -> return (IdentAst startPosition y)

parseFunctionCall :: CalcLangParser AstNode
parseFunctionCall = do
                    start <- getPosition
                    name <- parseIdentifier
                    parseLPar
                    l <- parseExpressionList
                    parseRPar
                    case name of
                          IdentAst _ n -> return (FunctionCall start n l)

parsePrimaryExpression :: CalcLangParser AstNode
parsePrimaryExpression = try parseDollarAst <|> try parsePercentAst <|> try parseNumber <|> try parseParenExpression <|> try parseTuple <|> try parseSet <|> try parseBoolean <|> try parseIfExpr <|> try parseFunctionCall <|> try parseIdentifier

parseParenExpression :: CalcLangParser AstNode
parseParenExpression = do
                       parseLPar
                       x <- parseExpression
                       parseRPar
                       return x

parseUnaryOperation :: CalcLangParser AstNode
parseUnaryOperation = try parseNotOperation <|> try parseNegationOperation <|> parsePrimaryExpression


parseNegationOperation :: CalcLangParser AstNode
parseNegationOperation = do
                         start <- getPosition
                         parseMinus
                         exp <- parseUnaryOperation
                         return (NegateOperation start exp)
                         

parseNotOperation :: CalcLangParser AstNode
parseNotOperation = do
                    start <- getPosition
                    parseNot
                    exp <- parseUnaryOperation
                    return (NotOperation start exp)

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

parseExpression :: CalcLangParser AstNode
parseExpression = parseBinaryOperation

parseLogicalOperation :: CalcLangParser AstNode
parseLogicalOperation = try parseEqualsOperation <|> try parseLessThenOrEqualsOperation <|> try parseLessThenOperation <|> try parseGreaterThenOperation <|> try parseGreaterThenOrEqualsOperation  

parseEqualsOperation :: CalcLangParser AstNode
parseEqualsOperation = do
                       start <- getPosition
                       x <- parseAddSubOp
                       parseEq
                       y <- parseAddSubOp
                       return (EqualOperation start x y)

parseLessThenOrEqualsOperation :: CalcLangParser AstNode
parseLessThenOrEqualsOperation = do
                                 start <- getPosition
                                 x <- parseAddSubOp
                                 parseLtOrEq
                                 y <- parseAddSubOp
                                 return (LessThenOrEqualsOperation start x y)

parseLessThenOperation :: CalcLangParser AstNode
parseLessThenOperation = do
                         start <- getPosition
                         x <- parseAddSubOp
                         parseLT
                         y <- parseAddSubOp
                         return (LessThenOperation start x y)

parseGreaterThenOrEqualsOperation :: CalcLangParser AstNode
parseGreaterThenOrEqualsOperation = do
                                    start <- getPosition
                                    x <- parseAddSubOp
                                    parseGtOrEq
                                    y <- parseAddSubOp
                                    return (GreaterThenOrEqualsOperation start x y)

parseGreaterThenOperation :: CalcLangParser AstNode
parseGreaterThenOperation = do
                            start <- getPosition
                            x <- parseAddSubOp
                            parseGT
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
                          parseFunc
                          x <- parseIdentifier
                          parseLPar
                          y <- parseParamaters
                          parseRPar
                          parseEq
                          z <- parseExpression
                          case x of
                            IdentAst _ s -> return (FunctionDef pos s y z)

parseMacroAssignment :: CalcLangParser AstNode
parseMacroAssignment = do
                       start <- getPosition
                       parseLet
                       x <- parseIdentifier
                       parseEq
                       e <- parseExpression
                       case x of
                         IdentAst _ s -> return (Assign start s e)
                            

parseAstNode :: CalcLangParser AstNode
parseAstNode = spaces *> (try parseFunctionDefinition <|> try parseMacroAssignment <|> try parseExpression)

foreign export ccall runCalcLangParser :: String -> IO AstNode
runCalcLangParser i = do
              parseResult <- (runParserT parseAstNode () "" i)
              case parseResult of
                Left err -> do
                            print err
                            return (ErrorNode (show err))
                Right t -> return t
                

runCalcLangLexer :: String -> IO [Token]
runCalcLangLexer i = do
                     lexResult <- (runParserT parseTokens () "" i)
                     case lexResult of
                           Left err -> do
                                       print err
                                       return []
                           Right t -> return t
