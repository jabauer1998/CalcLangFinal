module CalcLangAst(Token(..), Pos, AstNode(..)) where
--Below are all the Ast Nodes for Tokens
import Text.Parsec

type Pos = SourcePos

data Token = Ident Char Pos
           | IntNum String Pos
           | RealNum String Pos
           | TF String Pos
           | Func Pos
           | Plus Pos
           | Minus Pos
           | Times Pos
           | Div Pos
           | Eq Pos
           | Pow Pos
           | Not Pos
           | Comma Pos
           | LPar Pos
           | RPar Pos
           | LBrack Pos
           | RBrack Pos
           | LessThen Pos
           | GreaterThen Pos
           | GtOrEq Pos
           | LtOrEq Pos
           | If Pos
           | Then Pos
           | Else Pos
           | Let Pos
           | Dol String Pos
           | Perc String Pos
           | Dot Pos
           deriving (Show, Eq)

--Below are all the regular AstNodes


data AstNode = EqualOperation Pos AstNode AstNode
             | LessThenOrEqualsOperation Pos AstNode AstNode
             | GreaterThenOrEqualsOperation Pos AstNode AstNode
             | LessThenOperation Pos AstNode AstNode
             | GreaterThenOperation Pos AstNode AstNode
             | AdditionOperation Pos AstNode AstNode
             | SubtractionOperation Pos AstNode AstNode
             | MultiplicationOperation Pos AstNode AstNode
             | DotProductOperation Pos AstNode AstNode
             | DivisionOperation Pos AstNode AstNode
             | PowerOperation Pos AstNode AstNode
             | IntNumberAst Pos String
             | RealNumberAst Pos String
             | BooleanAst Pos String
             | SetAst Pos [AstNode]
             | TupleAst Pos [AstNode]
             | IdentAst Pos Char
             | DollarAst Pos String
             | PercentAst Pos String
             | FunctionCall Pos Char [AstNode]
             | NegateOperation Pos AstNode
             | NotOperation Pos AstNode
             | FunctionDef Pos Char [AstNode] AstNode
             | Assign Pos Char AstNode
             | IfExpr Pos AstNode AstNode AstNode
             | ErrorNode String
             deriving (Eq, Show)

--Now we need to make the AstNodes Visible from C. This will be accomplished through the Storable class
instance Storable SourcePos where
  sizeOf _ = (sizeOf (undefined :: CInt)) * 2
  alignment _ = ()
instance Storable AstNode where
    sizeOf _ = sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr Pos) + sizeOf (undefined :: Ptr AstNode) + sizeOf (undefined :: Ptr AstNode) -- Example size, adjust for actual fields
    alignment _ = alignment (undefined :: CInt)

    peek ptr = do
        tag <- peekByteOff ptr 0 :: IO CInt
        case tag of
            0 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (EqualOperation pos leftPtr rightPtr)
            1 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (LessThenOrEqualsOperation  pos leftPtr rightPtr)
            2 <- do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (GreaterThenOrEqualsOperation  pos leftPtr rightPtr)
            3->  do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (GreaterThenOperation  pos leftPtr rightPtr)
            4 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (LessThenOperation  pos leftPtr rightPtr)
            5 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (AdditionOperation  pos leftPtr rightPtr)
            6 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (SubtractionOperation  pos leftPtr rightPtr)
            7 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (MultiplicationOperation  pos leftPtr rightPtr)
            8 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (DotProductOperation  pos leftPtr rightPtr)
            9 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (DivisionOperation  pos leftPtr rightPtr)
            10 -> do
                 pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                 leftPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO (Ptr AstNode)
                 rightPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos)) + (sizeOf (undefined :: Ptr AstNode))) :: IO (Ptr AstNode)
                 return (PowerOperation  pos leftPtr rightPtr)
            11 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO CString
                  return (IntNumberAst pos (peekCString strPtr))
            12 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO CString
                  return (RealNumberAst pos (peekCString strPtr))
            13 -> do
                  pos <- peekByteOff ptr (sizeOf (undefined :: CInt)) :: IO (Ptr Pos)
                  strPtr <- peekByteOff ptr ((sizeOf (undefined :: CInt)) + (sizeOf (undefined :: Ptr Pos))) :: IO CString
                  return (BooleanAst pos (peekCString strPtr))
            2 -> Var <$> peekByteOff ptr (sizeOf (undefined :: CInt))
            _ -> error "Unknown AST node tag"

    poke ptr (Lit i) = do
        pokeByteOff ptr 0 (0 :: CInt) -- Tag for Lit
        pokeByteOff ptr (sizeOf (undefined :: CInt)) i
    poke ptr (Add l r) = do
        pokeByteOff ptr 0 (1 :: CInt) -- Tag for Add
        pokeByteOff ptr (sizeOf (undefined :: CInt)) l
        pokeByteOff ptr (sizeOf (undefined :: CInt) + sizeOf (undefined :: Ptr Expr)) r
    poke ptr (Var s) = do
        pokeByteOff ptr 0 (2 :: CInt) -- Tag for Var
        pokeByteOff ptr (sizeOf (undefined :: CInt)) s



