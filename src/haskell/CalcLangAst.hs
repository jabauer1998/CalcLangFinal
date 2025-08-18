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



