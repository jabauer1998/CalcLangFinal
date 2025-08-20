module CalcLangAst(Token(..), AstNode(..), SA(..)) where
--Below are all the Ast Nodes for Tokens
import Text.Parsec
import Foreign.Storable (Storable, sizeOf, alignment, peek, poke)
import Foreign.C.Types
import Foreign.C.String
import Foreign.Storable
import Foreign.Ptr
import Text.Parsec.Pos
import Foreign.Marshal.Array

instance Storable SourcePos where
  sizeOf _ = (sizeOf (undefined :: CInt)) * 2
  alignment _ = alignment (undefined :: CInt)
  peek ptr = do
             name <- peek (castPtr ptr :: Ptr CString)
             line  <- peekByteOff ptr (sizeOf (undefined :: CString)) :: IO CInt
             col <- peekByteOff ptr ((sizeOf (undefined :: CString)) + (sizeOf (undefined :: CInt))) :: IO CInt
             myStr <- peekCString name
             return (newPos myStr (fromIntegral line) (fromIntegral col))
  poke ptr pos = do
                 nCs <- newCString (sourceName pos)  
                 poke (castPtr ptr :: Ptr CString) nCs
                 pokeByteOff ptr (sizeOf (undefined :: CString)) (sourceLine pos)
                 pokeByteOff ptr ((sizeOf(undefined :: CString)) + (sizeOf(undefined::Int))) (sourceColumn pos)

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

instance Storable SA  where
  sizeOf _ = sizeOf (undefined :: CInt) + (sizeOf (undefined :: (Ptr AstNode)))
  alignment _ = alignment (undefined :: CInt)
  peek ptr = do
             size <- peekByteOff ptr 0 :: IO CInt
             arrPtr <- peekByteOff ptr (sizeOf (undefined::CInt)) :: IO (Ptr AstNode)
             arr <- peekArray (fromIntegral size) arrPtr
             return (StoreArray (fromIntegral size) arr)
  poke ptr obj = case obj of
                   (StoreArray a b) -> do
                                       x <- mallocArray a :: IO (Ptr AstNode)
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

--Now we need to make the AstNodes Visible from C. This will be accomplished through the Storable class
    
  
instance Storable AstNode where
    sizeOf _ = sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr AstNode) + sizeOf (undefined :: Ptr AstNode) -- Example size, adjust for actual fields
    alignment _ = alignment (undefined :: CInt)

    peek ptr = do
        tag <- peekByteOff ptr 0 :: IO CInt
        case tag of
            0 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (EqualOperation actPos leftExpr rightExpr)
            1 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (LessThenOrEqualsOperation actPos leftExpr rightExpr)
            2 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (GreaterThenOrEqualsOperation actPos leftExpr rightExpr)
            3 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (GreaterThenOperation actPos leftExpr rightExpr)
            4 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (LessThenOperation actPos leftExpr rightExpr)
            5 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (AdditionOperation actPos leftExpr rightExpr)
            6 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (SubtractionOperation actPos leftExpr rightExpr)
            7 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (MultiplicationOperation actPos leftExpr rightExpr)
            8 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (DotProductOperation actPos leftExpr rightExpr)
            9 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 actPos <- peek pos
                 leftExpr <- peek leftPtr
                 rightExpr <- peek rightPtr
                 return (DivisionOperation actPos leftExpr rightExpr)
            10 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  leftExpr <- peek leftPtr
                  rightExpr <- peek rightPtr
                  return (PowerOperation actPos leftExpr rightExpr)
            11 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  actPos <- peek pos
                  actStr <- peekCString strPtr
                  return (IntNumberAst actPos actStr)
            12 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  actPos <- peek pos
                  actStr <- peekCString strPtr
                  return (RealNumberAst actPos actStr)
            13 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  actPos <- peek pos
                  actStr <- peekCString strPtr
                  return (BooleanAst actPos actStr)
            14 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr SA)
                  actPos <- peek pos
                  actArr <- peek storageArrayPtr
                  return (SetAst actPos actArr)
            15 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr SA)
                  actPos <- peek pos
                  actArr <- peek storageArrayPtr
                  return (TupleAst actPos actArr)
            16 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CChar
                  actPos <- peek pos
                  return (IdentAst actPos (toEnum (fromIntegral strPtr)))
            17 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  actPos <- peek pos
                  actStr <- peekCString strPtr
                  return (DollarAst actPos actStr)
            18 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CString
                  actPos <- peek pos
                  actStr <- peekCString strPtr
                  return (PercentAst actPos actStr)
            19 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CChar
                  storageArrayPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr SA)
                  actPos <- peek pos
                  actArr <- peek storageArrayPtr
                  return (FunctionCall actPos  (toEnum (fromIntegral strPtr)) actArr)
            20 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  actData <- peek dataPtr
                  return (NegateOperation actPos actData)
            21 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  dataPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  actData <- peek dataPtr
                  return (NotOperation actPos actData)
            22 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CChar
                  paramPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr SA)
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: CChar)) + (sizeOf (undefined :: Ptr SA))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  actParams <- peek paramPtr
                  actExpr <- peek exprPtr
                  return (FunctionDef actPos (toEnum (fromIntegral namePtr)) actParams actExpr)
            23 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  namePtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO CChar
                  exprPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: CChar))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  actExpr <- peek exprPtr
                  return (Assign actPos (toEnum (fromIntegral namePtr)) actExpr)
            24 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr SourcePos)
                  condPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos))) :: IO (Ptr AstNode)
                  leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                  rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr SourcePos)) + (sizeOf (undefined :: Ptr AstNode)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                  actPos <- peek pos
                  actCond <- peek condPtr
                  actLeft <- peek leftPtr
                  actRight <- peek rightPtr
                  return (IfExpr actPos actCond actLeft actRight)
            _ -> error "Unknown AST node tag"

     

    poke ptr astNode = case astNode of
                         EqualOperation pos x y -> do
                                                   pokeByteOff ptr 0 (0 :: CInt) -- Tag for EqualOperation
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         LessThenOrEqualsOperation  pos x y -> do
                                                               pokeByteOff ptr 0 (1 :: CInt) -- Tag for LessThenOrEqualOperation
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         GreaterThenOrEqualsOperation pos x y -> do
                                                                 pokeByteOff ptr 0 (2 :: CInt) -- Tag for GreaterThenOrEqualsOperation
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                                 pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         GreaterThenOperation pos x y -> do
                                                         pokeByteOff ptr 0 (3 :: CInt) -- Tag for GreaterThenOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         LessThenOperation pos x y -> do
                                                      pokeByteOff ptr 0 (4 :: CInt) -- Tag for LessThenOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         AdditionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (5 :: CInt) -- Tag for AdditionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         SubtractionOperation pos x y -> do
                                                         pokeByteOff ptr 0 (6 :: CInt) -- Tag for SubtractionOperation
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                         pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         MultiplicationOperation pos x y -> do
                                                            pokeByteOff ptr 0 (7 :: CInt) -- Tag for MultiplicationOperation
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         DotProductOperation pos x y -> do
                                                        pokeByteOff ptr 0 (8 :: CInt) -- Tag for DotProductOperation
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                        pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         DivisionOperation pos x y -> do
                                                      pokeByteOff ptr 0 (9 :: CInt) -- Tag for DivisionOperation
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         PowerOperation pos x y -> do
                                                   pokeByteOff ptr 0 (10 :: CInt) -- Tag for PowerOperation
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) x
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf(undefined :: Ptr AstNode)) y
                         IntNumberAst pos s -> do
                                               pokeByteOff ptr 0 (11 :: CInt)
                                               pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                               ns <- newCString s
                                               pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) ns
                         RealNumberAst pos s -> do
                                                pokeByteOff ptr 0 (12 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                ns <- newCString s
                                                pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) ns
                         BooleanAst pos s -> do
                                             pokeByteOff ptr 0 (13 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                             ns <- newCString s
                                             pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) ns
                         SetAst pos a -> do
                                         pokeByteOff ptr 0 (14 :: CInt)
                                         pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                         pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) a
                         TupleAst pos s -> do
                                           pokeByteOff ptr 0 (15 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                           pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) s
                         IdentAst pos s -> do
                                           pokeByteOff ptr 0 (16 :: CInt)
                                           pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                           pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) (castCharToCChar s)
                         DollarAst pos s -> do
                                            pokeByteOff ptr 0 (17 :: CInt)
                                            pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                            ns <- newCString s
                                            pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) ns
                         PercentAst pos s -> do
                                             pokeByteOff ptr 0 (18 :: CInt)
                                             pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                             ns <- newCString s
                                             pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) ns
                         FunctionCall pos name l -> do
                                                    pokeByteOff ptr 0 (19 :: CInt)
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos)) (castCharToCChar name)
                                                    pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr SourcePos) + sizeOf (undefined :: CChar)) l
                         NegateOperation pos right -> do
                                                      pokeByteOff ptr 0 (20 :: CInt)
                                                      pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                      pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) right
                         NotOperation pos right -> do
                                                   pokeByteOff ptr 0 (21 :: CInt)
                                                   pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                   pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) right
                         FunctionDef pos name l exp -> do
                                                       pokeByteOff ptr 0 (22 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) name
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf (undefined :: CChar)) l
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf (undefined :: CChar) + sizeOf (undefined :: Ptr SA)) exp
                         Assign pos name exp -> do
                                                pokeByteOff ptr 0 (23 :: CInt)
                                                pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) name
                                                pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf (undefined :: CChar)) exp
                         IfExpr pos cond left right -> do
                                                       pokeByteOff ptr 0 (24 :: CInt)
                                                       pokeByteOff ptr (sizeOf (undefined :: CInt)) pos
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos)) cond
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr AstNode)) left
                                                       pokeByteOff ptr (sizeOf(undefined :: CInt) + sizeOf(undefined :: Ptr SourcePos) + sizeOf (undefined :: Ptr AstNode) + (sizeOf (undefined :: Ptr AstNode))) right
                         _ -> error "Unknown AST node tag"



