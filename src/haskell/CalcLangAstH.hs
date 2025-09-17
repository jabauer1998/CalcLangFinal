{-# LANGUAGE CPP #-}

module CalcLangAstH(Token(..), AstNode(..), SA(..), CSA(..), CSourcePos(..), CAstNode(..), toString) where
--Below are Some of the preprocessor Statements

#define EQUAL_OPERATION 0
#define LESS_THEN_OR_EQUALS_OPERATION 1
#define GREATER_THEN_OR_EQUALS_OPERATION 2
#define LESS_THEN_OPERATION 3
#define GREATER_THEN_OPERATION 4
#define ADDITION_OPERATION 5
#define SUBTRACTION_OPERATION 6
#define MULTIPLICATON_OPERATION 7
#define DOT_PRODUCT_OPERATION 8
#define DIVISION_OPERATION 9
#define POWER_OPERATION 10
#define INT_AST 11
#define REAL_AST 12
#define BOOL_AST 13
#define SET_AST 14
#define TUPLE_AST 15
#define IDENT_AST 16
#define DOLLAR_AST 17
#define PERCENT_AST 18
#define FUNCTION_CALL 19
#define NEGATE_OPERATION 20
#define NOT_OPERATION 21
#define FUNCTION_DEFINITION 22
#define ASSIGN 23
#define IF_EXPR 24
#define PAREN_EXPR 25

--Below are all the Ast Nodes for Tokens
import Text.Parsec
import Foreign.Storable (Storable, sizeOf, alignment, peek, poke)
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr
import Text.Parsec.Pos
import Foreign.Marshal.Array
import Data.List

data CSourcePos = CSourcePos CString CInt CInt deriving (Eq, Show)

instance Storable CSourcePos where
  sizeOf _ = sizeOf (undefined :: CString) + (sizeOf (undefined :: Ptr CInt)) * 2
  alignment _ = alignment (undefined :: CString)
  peek ptr = do
             name <- peekByteOff ptr 0 :: IO CString
             line  <- peekByteOff ptr (sizeOf (undefined :: CString)) :: IO CInt
             col <- peekByteOff ptr ((sizeOf (undefined :: CString)) + (sizeOf (undefined :: Ptr CInt))) :: IO CInt
             return (CSourcePos name (fromIntegral line) (fromIntegral col))
  poke ptr (CSourcePos name line col) = do  
                                         pokeByteOff ptr 0  name
                                         pokeByteOff ptr (sizeOf (undefined :: CString)) line
                                         pokeByteOff ptr ((sizeOf(undefined :: CString)) + (sizeOf(undefined :: Ptr Int))) col

data Token = Ident Char SourcePos
           | IntNum String SourcePos
           | RealNum String SourcePos
           | TF String SourcePos
           | Func SourcePos
           | Plus SourcePos
           | Minus SourcePos
           | Times SourcePos
           | Div SourcePos
           | Eq SourcePos
           | Pow SourcePos
           | Not SourcePos
           | Comma SourcePos
           | LPar SourcePos
           | RPar SourcePos
           | LBrack SourcePos
           | RBrack SourcePos
           | LessThen SourcePos
           | GreaterThen SourcePos
           | GtOrEq SourcePos
           | LtOrEq SourcePos
           | If SourcePos
           | Then SourcePos
           | Else SourcePos
           | Let SourcePos
           | Dol String SourcePos
           | Perc String SourcePos
           | Dot SourcePos
           | NewLine SourcePos
           | ShowCmd SourcePos
           | FunctionsCmd SourcePos
           | VariablesCmd SourcePos
           | QuitCmd SourcePos
           | CreateCmd SourcePos
           | LessonCmd SourcePos
           | PlanCmd SourcePos
           | HistoryCmd SourcePos
           | HelpCmd SourcePos
           deriving (Show, Eq)

--Below are all the regular AstNodes
data SA = StoreArray Int [AstNode] deriving (Eq, Show)

sAToString :: SA -> String
sAToString a = case a of
               StoreArray _ l -> intercalate ", " (map toString l)

--Below is the CStruct version
data CSA = CStoreArray CInt (Ptr (Ptr CAstNode))

instance Storable CSA  where
  sizeOf _ = sizeOf (undefined :: Ptr CInt) + sizeOf (undefined :: (Ptr (Ptr CAstNode)))
  alignment _ = alignment (undefined :: (Ptr (Ptr AstNode)))
  peek ptr = do
             size <- peekByteOff ptr 0 :: IO CInt
             arrPtr <- peekByteOff ptr (sizeOf (undefined::CInt)) :: IO (Ptr (Ptr CAstNode))
             return (CStoreArray (fromIntegral size) arrPtr)
  poke ptr obj = case obj of
                   (CStoreArray a b) -> do
                                        pokeByteOff ptr 0 a
                                        pokeByteOff ptr (sizeOf(undefined::Ptr CInt)) b

data AstNode = EqualOperation SourcePos AstNode AstNode
             | LessThenOrEqualsOperation SourcePos AstNode AstNode
             | GreaterThenOrEqualsOperation SourcePos AstNode AstNode
             | LessThenOperation SourcePos AstNode AstNode
             | GreaterThenOperation SourcePos AstNode AstNode
             | AdditionOperation SourcePos AstNode AstNode
             | SubtractionOperation SourcePos AstNode AstNode
             | MultiplicationOperation SourcePos AstNode AstNode
             | DotProductOperation SourcePos AstNode AstNode
             | DivisionOperation SourcePos AstNode AstNode
             | PowerOperation SourcePos AstNode AstNode
             | IntNumberAst SourcePos String
             | RealNumberAst SourcePos String
             | BooleanAst SourcePos String
             | SetAst SourcePos SA
             | TupleAst SourcePos SA
             | IdentAst SourcePos Char
             | DollarAst SourcePos String
             | PercentAst SourcePos String
             | FunctionCall SourcePos Char SA
             | NegateOperation SourcePos AstNode
             | NotOperation SourcePos AstNode
             | FunctionDef SourcePos Char SA AstNode
             | Assign SourcePos Char AstNode
             | IfExpr SourcePos AstNode AstNode AstNode
             | ParenExpr SourcePos AstNode
             | ShowFunctionsCommand SourcePos
             | ShowVariablesCommand SourcePos
             | ShowHistoryCommand SourcePos
             | QuitCommand SourcePos
             | HelpCommand SourcePos
             | CreateLessonPlanCommand SourcePos
             | ErrorNode String
             deriving (Eq, Show)

toString :: AstNode -> String
toString myA = case myA of
               EqualOperation _ a1 a2 -> (toString a1) ++ " = " ++ (toString a2)
               LessThenOrEqualsOperation _ a1 a2 -> (toString a1) ++ " <= " ++ (toString a2)
               GreaterThenOrEqualsOperation _ a1 a2 -> (toString a1) ++ "> = " ++ (toString a2)
               LessThenOperation _ a1 a2 -> (toString a1) ++ " < " ++ (toString a2)
               GreaterThenOperation _ a1 a2 -> (toString a1) ++ " > " ++ (toString a2)
               AdditionOperation _ a1 a2 -> (toString a1) ++ " + " ++ (toString a2)
               SubtractionOperation _ a1 a2 -> (toString a1) ++ " - " ++ (toString a2)
               MultiplicationOperation _ a1 a2 -> (toString a1) ++ " * " ++ (toString a2)
               DotProductOperation _ a1 a2 -> (toString a1) ++ " . " ++ (toString a2)
               DivisionOperation _ a1 a2 -> (toString a1) ++ " / " ++ (toString a2)
               PowerOperation _ a1 a2 -> (toString a1) ++ " ^ " ++ (toString a2)
               IntNumberAst _ s -> s
               RealNumberAst _ s -> s
               BooleanAst _ s -> s
               SetAst _ s -> '{' : (sAToString s) ++ "}"
               TupleAst _ s -> '(' : (sAToString s) ++ "}"
               IdentAst _ c -> [c]
               DollarAst _ s -> s
               PercentAst _ s -> s
               FunctionCall _ c l -> [c, '('] ++ (sAToString l) ++ ")"
               NegateOperation _ a -> '-' : (toString a)
               NotOperation _ a -> '\'' : (toString a)
               FunctionDef _ name param expr -> "func " ++ [name] ++ "(" ++ (sAToString param) ++ ") = " ++ (toString expr)
               Assign _ name expr -> "let " ++ [name] ++ " = " ++ (toString expr)
               IfExpr _ cond ifTrue ifFalse -> "if " ++ (toString cond) ++ " then " ++ (toString ifTrue) ++ " else " ++ (toString ifFalse)
               ParenExpr _ expr -> "(" ++ (toString expr) ++ ")"
               ErrorNode err -> err
               

--Now define the Same Thing that can be utilized in C

data CAstNode = CEqualOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CLessThenOrEqualsOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CGreaterThenOrEqualsOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CLessThenOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CGreaterThenOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CAdditionOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CSubtractionOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CMultiplicationOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CDotProductOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CDivisionOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CPowerOperation (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode)
              | CIntNumberAst (Ptr CSourcePos) CString
              | CRealNumberAst (Ptr CSourcePos) CString
              | CBooleanAst (Ptr CSourcePos) CString
              | CSetAst (Ptr CSourcePos) (Ptr CSA)
              | CTupleAst (Ptr CSourcePos) (Ptr CSA)
              | CIdentAst (Ptr CSourcePos) CChar
              | CDollarAst (Ptr CSourcePos) CString
              | CPercentAst (Ptr CSourcePos) CString
              | CFunctionCall (Ptr CSourcePos) CChar (Ptr CSA)
              | CNegateOperation (Ptr CSourcePos) (Ptr CAstNode)
              | CNotOperation (Ptr CSourcePos) (Ptr CAstNode)
              | CFunctionDef (Ptr CSourcePos) CChar (Ptr CSA) (Ptr CAstNode)
              | CAssign (Ptr CSourcePos) CChar (Ptr CAstNode)
              | CIfExpr (Ptr CSourcePos) (Ptr CAstNode) (Ptr CAstNode) (Ptr CAstNode)
              | CParenExpr (Ptr CSourcePos) (Ptr CAstNode)
              | CErrorNode String
              deriving (Eq, Show)

--Now we need to make the AstNodes Visible from C. This will be accomplished through the Storable class
    
  
instance Storable CAstNode where
    sizeOf _ = sizeOf (undefined :: Ptr CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr AstNode) + sizeOf (undefined :: Ptr AstNode) + sizeOf (undefined :: Ptr AstNode) -- Example size, adjust for actual fields
    alignment _ = alignment (undefined :: Ptr CAstNode)

    peek ptr = do
        tag <- peekByteOff ptr 0 :: IO CInt
        case tag of
            EQUAL_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CEqualOperation pos leftPtr rightPtr)
            LESS_THEN_OR_EQUALS_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CLessThenOrEqualsOperation pos leftPtr rightPtr)
            GREATER_THEN_OR_EQUALS_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CGreaterThenOrEqualsOperation pos leftPtr rightPtr)
            GREATER_THEN_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CGreaterThenOperation pos leftPtr rightPtr)
            LESS_THEN_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CLessThenOperation pos leftPtr rightPtr)
            ADDITION_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CAdditionOperation pos leftPtr rightPtr)
            SUBTRACTION_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CSubtractionOperation pos leftPtr rightPtr)
            MULTIPLICATON_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CMultiplicationOperation pos leftPtr rightPtr)
            DOT_PRODUCT_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CDotProductOperation pos leftPtr rightPtr)
            DIVISION_OPERATION -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CDivisionOperation pos leftPtr rightPtr)
            POWER_OPERATION -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  return (CPowerOperation pos leftPtr rightPtr)
            INT_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CIntNumberAst pos strPtr)
            REAL_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CRealNumberAst pos strPtr)
            BOOL_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  return (CBooleanAst pos strPtr)
            SET_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CSA)
                  return (CSetAst pos storageArrayPtr)
            TUPLE_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CSA)
                  return (CTupleAst pos storageArrayPtr)
            IDENT_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  return (CIdentAst pos strPtr)
            DOLLAR_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CDollarAst pos strPtr)
            PERCENT_AST -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CPercentAst pos strPtr)
            FUNCTION_CALL -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CSA)
                  return (CFunctionCall pos strPtr storageArrayPtr)
            NEGATE_OPERATION -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  return (CNegateOperation pos dataPtr)
            NOT_OPERATION -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  return (CNotOperation pos dataPtr)
            FUNCTION_DEFINITION -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  paramPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CSA)
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar)) + (sizeOf (undefined :: Ptr CSA))) :: IO (Ptr CAstNode)
                  return (CFunctionDef pos namePtr paramPtr exprPtr)
            ASSIGN -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CAstNode)
                  return (CAssign pos namePtr exprPtr)
            IF_EXPR -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  condPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  return (CIfExpr pos condPtr leftPtr rightPtr)
            PAREN_EXPR -> do
                          pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                          expr <- peekByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) :: IO (Ptr CAstNode)
                          return (CParenExpr pos expr)
            _ -> error "Unknown AST node tag"

     

    poke ptr astNode = case astNode of
                         CEqualOperation pos x y -> do
                                                    pokeByteOff ptr 0 (0 :: CInt) -- Tag for EqualOperation
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CLessThenOrEqualsOperation  pos x y -> do
                                                               pokeByteOff ptr 0 (1 :: CInt) -- Tag for LessThenOrEqualOperation
                                                               pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                               pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                               pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CGreaterThenOrEqualsOperation pos x y -> do
                                                                 pokeByteOff ptr 0 (2 :: CInt) -- Tag for GreaterThenOrEqualsOperation
                                                                 pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                                 pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                                 pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CGreaterThenOperation pos x y -> do
                                                         pokeByteOff ptr 0 (3 :: CInt) -- Tag for GreaterThenOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CLessThenOperation pos x y -> do
                                                      pokeByteOff ptr 0 (4 :: CInt) -- Tag for LessThenOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CAdditionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (5 :: CInt) -- Tag for AdditionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CSubtractionOperation pos x y -> do
                                                         pokeByteOff ptr 0 (6 :: CInt) -- Tag for SubtractionOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CMultiplicationOperation pos x y -> do
                                                            pokeByteOff ptr 0 (7 :: CInt) -- Tag for MultiplicationOperation
                                                            pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                            pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                            pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CDotProductOperation pos x y -> do
                                                        pokeByteOff ptr 0 (8 :: CInt) -- Tag for DotProductOperation
                                                        pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                        pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                        pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CDivisionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (9 :: CInt) -- Tag for DivisionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CPowerOperation pos x y -> do
                                                   pokeByteOff ptr 0 (10 :: CInt) -- Tag for PowerOperation
                                                   pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                   pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                   pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CIntNumberAst pos s -> do
                                               pokeByteOff ptr 0 (11 :: CInt)
                                               pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                               pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CRealNumberAst pos s -> do
                                                pokeByteOff ptr 0 (12 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CBooleanAst pos s -> do
                                             pokeByteOff ptr 0 (13 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                             pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CSetAst pos a -> do
                                         pokeByteOff ptr 0 (14 :: CInt)
                                         pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                         pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) a
                         CTupleAst pos s -> do
                                           pokeByteOff ptr 0 (15 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                           pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CIdentAst pos s -> do
                                           pokeByteOff ptr 0 (16 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                           pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CDollarAst pos s -> do
                                            pokeByteOff ptr 0 (17 :: CInt)
                                            pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                            pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CPercentAst pos s -> do
                                             pokeByteOff ptr 0 (18 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                             pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr SourcePos)) s
                         CFunctionCall pos name l -> do
                                                    pokeByteOff ptr 0 (19 :: CInt)
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf (undefined :: Ptr SourcePos)) name
                                                    pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr CChar)) l
                         CNegateOperation pos right -> do
                                                      pokeByteOff ptr 0 (20 :: CInt)
                                                      pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                      pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) right
                         CNotOperation pos right -> do
                                                   pokeByteOff ptr 0 (21 :: CInt)
                                                   pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                   pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) right
                         CFunctionDef pos name l myExp -> do
                                                       pokeByteOff ptr 0 (22 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                       pokeByteOff ptr (sizeOf (undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) name
                                                       pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CChar)) l
                                                       pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CChar) + sizeOf (undefined :: Ptr CSA)) myExp
                         CAssign pos name myExp -> do
                                                pokeByteOff ptr 0 (23 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) name
                                                pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CChar)) myExp
                         CIfExpr pos cond left right -> do
                                                       pokeByteOff ptr 0 (24 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                       pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) cond
                                                       pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CAstNode)) left
                                                       pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CAstNode) + (sizeOf (undefined :: Ptr CAstNode))) right
                         CParenExpr pos expr -> do
                                                pokeByteOff ptr 0 (25 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: Ptr CInt)) pos
                                                pokeByteOff ptr (sizeOf(undefined :: Ptr CInt) + sizeOf(undefined :: Ptr CSourcePos)) expr
                         _ -> error "Unknown AST node tag"



