module CalcLangAst(Token(..), AstNode(..), SA(..), CSA(..), CSourcePos(..), CAstNode(..)) where
--Below are all the Ast Nodes for Tokens
import Text.Parsec
import Foreign.Storable (Storable, sizeOf, alignment, peek, poke)
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr
import Text.Parsec.Pos
import Foreign.Marshal.Array

data CSourcePos = CSourcePos CString CInt CInt deriving (Eq, Show)

instance Storable CSourcePos where
  sizeOf _ = sizeOf (undefined :: CString) + (sizeOf (undefined :: CInt)) * 2
  alignment _ = alignment (undefined :: CInt)
  peek ptr = do
             name <- peek (castPtr ptr :: Ptr CString)
             line  <- peekByteOff ptr (sizeOf (undefined :: CString)) :: IO CInt
             col <- peekByteOff ptr ((sizeOf (undefined :: CString)) + (sizeOf (undefined :: CInt))) :: IO CInt
             return (CSourcePos name (fromIntegral line) (fromIntegral col))
  poke ptr (CSourcePos name line col) = do  
                                         poke (castPtr ptr :: Ptr CString) name
                                         pokeByteOff ptr (sizeOf (undefined :: CString)) line
                                         pokeByteOff ptr ((sizeOf(undefined :: CString)) + (sizeOf(undefined::Int))) col

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
           deriving (Show, Eq)

--Below are all the regular AstNodes
data SA = StoreArray Int [AstNode] deriving (Eq, Show)

--Below is the CStruct version
data CSA = CStoreArray Int [Ptr CAstNode]

instance Storable CSA  where
  sizeOf _ = sizeOf (undefined :: CInt) + (sizeOf (undefined :: (Ptr CAstNode)))
  alignment _ = alignment (undefined :: CInt)
  peek ptr = do
             size <- peekByteOff ptr 0 :: IO CInt
             arrPtr <- peekByteOff ptr (sizeOf (undefined::CInt)) :: IO (Ptr (Ptr CAstNode))
             arr <- peekArray (fromIntegral size) arrPtr
             
             return (CStoreArray (fromIntegral size) arr)
  poke ptr obj = case obj of
                   (CStoreArray a b) -> do
                                       x <- mallocArray a :: IO (Ptr (Ptr CAstNode))
                                       pokeArray x b

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
             | ErrorNode String
             deriving (Eq, Show)

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
              | CErrorNode String
              deriving (Eq, Show)

--Now we need to make the AstNodes Visible from C. This will be accomplished through the Storable class
    
  
instance Storable CAstNode where
    sizeOf _ = sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr AstNode) + sizeOf (undefined :: Ptr AstNode) -- Example size, adjust for actual fields
    alignment _ = alignment (undefined :: CInt)

    peek ptr = do
        tag <- peekByteOff ptr 0 :: IO CInt
        case tag of
            0 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CEqualOperation pos leftPtr rightPtr)
            1 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CLessThenOrEqualsOperation pos leftPtr rightPtr)
            2 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CGreaterThenOrEqualsOperation pos leftPtr rightPtr)
            3 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CGreaterThenOperation pos leftPtr rightPtr)
            4 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CLessThenOperation pos leftPtr rightPtr)
            5 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CAdditionOperation pos leftPtr rightPtr)
            6 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CSubtractionOperation pos leftPtr rightPtr)
            7 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CMultiplicationOperation pos leftPtr rightPtr)
            8 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CDotProductOperation pos leftPtr rightPtr)
            9 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                 return (CDivisionOperation pos leftPtr rightPtr)
            10 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  return (CPowerOperation pos leftPtr rightPtr)
            11 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CIntNumberAst pos strPtr)
            12 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CRealNumberAst pos strPtr)
            13 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  return (CBooleanAst pos strPtr)
            14 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CSA)
                  return (CSetAst pos storageArrayPtr)
            15 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CSA)
                  return (CTupleAst pos storageArrayPtr)
            16 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  return (CIdentAst pos strPtr)
            17 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CDollarAst pos strPtr)
            18 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CString
                  return (CPercentAst pos strPtr)
            19 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CSA)
                  return (CFunctionCall pos strPtr storageArrayPtr)
            20 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  return (CNegateOperation pos dataPtr)
            21 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  return (CNotOperation pos dataPtr)
            22 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  paramPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CSA)
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar)) + (sizeOf (undefined :: Ptr CSA))) :: IO (Ptr CAstNode)
                  return (CFunctionDef pos namePtr paramPtr exprPtr)
            23 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO CChar
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr CAstNode)
                  return (CAssign pos namePtr exprPtr)
            24 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr CSourcePos)
                  condPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos))) :: IO (Ptr CAstNode)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr CSourcePos)) + (sizeOf (undefined :: Ptr CAstNode)) + (sizeOf (undefined :: Ptr CAstNode))) :: IO (Ptr CAstNode)
                  return (CIfExpr pos condPtr leftPtr rightPtr)
            _ -> error "Unknown AST node tag"

     

    poke ptr astNode = case astNode of
                         CEqualOperation pos x y -> do
                                                    pokeByteOff ptr 0 (0 :: CInt) -- Tag for EqualOperation
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CLessThenOrEqualsOperation  pos x y -> do
                                                               pokeByteOff ptr 0 (1 :: CInt) -- Tag for LessThenOrEqualOperation
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CGreaterThenOrEqualsOperation pos x y -> do
                                                                 pokeByteOff ptr 0 (2 :: CInt) -- Tag for GreaterThenOrEqualsOperation
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CGreaterThenOperation pos x y -> do
                                                         pokeByteOff ptr 0 (3 :: CInt) -- Tag for GreaterThenOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CLessThenOperation pos x y -> do
                                                      pokeByteOff ptr 0 (4 :: CInt) -- Tag for LessThenOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CAdditionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (5 :: CInt) -- Tag for AdditionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CSubtractionOperation pos x y -> do
                                                         pokeByteOff ptr 0 (6 :: CInt) -- Tag for SubtractionOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CMultiplicationOperation pos x y -> do
                                                            pokeByteOff ptr 0 (7 :: CInt) -- Tag for MultiplicationOperation
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CDotProductOperation pos x y -> do
                                                        pokeByteOff ptr 0 (8 :: CInt) -- Tag for DotProductOperation
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CDivisionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (9 :: CInt) -- Tag for DivisionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CPowerOperation pos x y -> do
                                                   pokeByteOff ptr 0 (10 :: CInt) -- Tag for PowerOperation
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) x
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf(undefined :: Ptr CAstNode)) y
                         CIntNumberAst pos s -> do
                                               pokeByteOff ptr 0 (11 :: CInt)
                                               pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CRealNumberAst pos s -> do
                                                pokeByteOff ptr 0 (12 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CBooleanAst pos s -> do
                                             pokeByteOff ptr 0 (13 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                             pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CSetAst pos a -> do
                                         pokeByteOff ptr 0 (14 :: CInt)
                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                         pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) a
                         CTupleAst pos s -> do
                                           pokeByteOff ptr 0 (15 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                           pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CIdentAst pos s -> do
                                           pokeByteOff ptr 0 (16 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                           pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CDollarAst pos s -> do
                                            pokeByteOff ptr 0 (17 :: CInt)
                                            pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) s
                         CPercentAst pos s -> do
                                             pokeByteOff ptr 0 (18 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                             pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) s
                         CFunctionCall pos name l -> do
                                                    pokeByteOff ptr 0 (19 :: CInt)
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos)) name
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: CChar)) l
                         CNegateOperation pos right -> do
                                                      pokeByteOff ptr 0 (20 :: CInt)
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) right
                         CNotOperation pos right -> do
                                                   pokeByteOff ptr 0 (21 :: CInt)
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                   pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) right
                         CFunctionDef pos name l exp -> do
                                                       pokeByteOff ptr 0 (22 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) name
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: CChar)) l
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: CChar) + sizeOf (undefined :: Ptr CSA)) exp
                         CAssign pos name exp -> do
                                                pokeByteOff ptr 0 (23 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) name
                                                pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: CChar)) exp
                         CIfExpr pos cond left right -> do
                                                       pokeByteOff ptr 0 (24 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos)) cond
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CAstNode)) left
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr CSourcePos) + sizeOf (undefined :: Ptr CAstNode) + (sizeOf (undefined :: Ptr CAstNode))) right
                         _ -> error "Unknown AST node tag"



