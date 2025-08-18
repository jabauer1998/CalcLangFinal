module CalcLangInterpreter where

import CalcLangParser
import Numeric
import System.IO

data CalcLangValue = BoolVal Bool
                   | IntVal Int
                   | RealVal Double
                   | VoidVal
                   | TupleVal [CalcLangValue]
                   | SetVal [CalcLangValue]
                   | DollarVal Double
                   | PercentVal Double
                   | ErrorVal [String]
                   deriving (Show, Eq)

data STable a b = SymbolTable [(a, b)] deriving (Show, Eq)
type VariableTable = STable Char CalcLangValue
type FunctionTable = STable Char ([AstNode], AstNode)
data Env = Environment [VariableTable]

addScopeToEnv :: Env -> Env
addScopeToEnv a = case a of
                      Environment [] -> Environment [SymbolTable []]
                      Environment [b] -> Environment [SymbolTable [], b]
                      Environment (b:c) -> Environment ([SymbolTable []] ++ [b] ++ c)

removeScopeFromEnv :: Env -> Env
removeScopeFromEnv a = case a of
                         Environment [] -> Environment []
                         Environment [a] -> Environment []
                         Environment (s : r) -> Environment r
                  

addEntryToEnv :: Env -> (Char, CalcLangValue) ->  Env
addEntryToEnv e t = case e of
                      Environment [] -> case (addScopeToEnv e) of
                                          Environment [a] -> Environment [addEntryToTable a t]
                      Environment [a] -> Environment [addEntryToTable a t]
                      Environment (a : b) -> Environment ((addEntryToTable a t) : b)  

addEntryToTable :: STable a b -> (a, b) -> STable a b
addEntryToTable table entry = case table of
                                SymbolTable x -> SymbolTable (entry : x)

removeEntry :: (Eq a, Show a, Show b) => STable a b -> a -> STable a b
removeEntry table key = case table of
                          SymbolTable [] -> SymbolTable []
                          SymbolTable list -> SymbolTable (removeKey list key)

removeKey :: (Eq key) => [(key, a)] -> key -> [(key, a)]
removeKey list key = case list of
                       [] -> []
                       ((itemKey, _) : rest) -> case itemKey == key of
                                                      True -> rest
                                                      False -> removeKey rest key

getEntryFromEnv :: Env -> Char -> Maybe CalcLangValue
getEntryFromEnv e c = case e of
                        Environment [] -> Nothing
                        Environment [a] -> (getEntryFromTable a c)
                        Environment (a : rest) -> do
                                                  let x = (getEntryFromTable a c)
                                                  case x of
                                                    Nothing -> (getEntryFromEnv (Environment  rest) c)
                                                    otherwise -> x

getEntryFromTable :: (Eq a) => STable a b -> a -> Maybe b
getEntryFromTable table key = case table of
                                  SymbolTable [] -> Nothing
                                  SymbolTable list -> getKey list key

getKey :: (Eq key) => [(key,a)] -> key -> Maybe a
getKey list key = case list of
                    [] -> Nothing
                    ((elemKey, elem) : rest) -> case elemKey == key of
                                                  True -> Just elem
                                                  False -> (getKey rest key)
                        
                           
                           
toErrorLog :: [String] -> String
toErrorLog errors = case errors of
                      [] -> ""
                      (current:[]) -> current ++ "\n"
                      (current:rest) -> (toErrorLog rest) ++ current ++ "\n"                           

toStr :: [CalcLangValue] -> String
toStr list = case list of
               [] -> ""
               (val:[]) -> toString val
               (val:rest) -> (toStr rest) ++ ", " ++ (toString val)

toString :: CalcLangValue -> String
toString val = case val of
                 IntVal val -> show val
                 RealVal val -> show val
                 TupleVal val -> "(" ++ (toStr val) ++ ")"
                 SetVal val -> "{" ++ (toStr val) ++ "}"
                 DollarVal val -> "$" ++ (showFFloat (Just 2) val "")
                 PercentVal val -> (showFFloat (Just 2) (val*100.0) "") ++ "%"
                 BoolVal val -> if val then "TRUE" else "FALSE"
                 ErrorVal val -> "<<<~~~ERROR~~~>>>\n\n" ++ (toErrorLog val)
                 otherwise -> ""

generateParam :: AstNode -> AstNode -> (Char, AstNode)
generateParam paramLexeme toExpr = case paramLexeme of
                                     IdentAst _ x -> (x, toExpr)

interpret :: AstNode -> Env -> FunctionTable -> (CalcLangValue, Env, FunctionTable)
interpret node vT fT = case node of
                          EqualOperation _ x y -> (equalVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          LessThenOrEqualsOperation _ x y -> (lessOrEqualVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          GreaterThenOrEqualsOperation _ x y -> (greaterOrEqualVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          LessThenOperation _ x y -> (lessThanVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          GreaterThenOperation _ x y -> (greaterThanVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          AdditionOperation _ x y -> (addVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          SubtractionOperation _ x y -> (subtractVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          MultiplicationOperation _ x y -> (multVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          DivisionOperation _ x y -> (divVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          DotProductOperation _ x y -> (dotProductVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          PowerOperation _ x y -> (powVals (gV (interpret x vT fT)) (gV (interpret y vT fT)), vT, fT)
                          DollarAst _ x -> (DollarVal (read x :: Double), vT, fT)
                          PercentAst _ x -> (PercentVal ((read x :: Double) / 100.0), vT, fT)
                          IntNumberAst _ x -> (IntVal (read x :: Int), vT, fT) 
                          RealNumberAst _ x -> (RealVal (read x :: Double), vT, fT)
                          BooleanAst _ x -> (BoolVal (if x == "TRUE" then True else False), vT, fT)
                          SetAst _ x -> (SetVal (map (\s -> (gV (interpret s vT fT))) x), vT, fT)
                          TupleAst _ x -> (TupleVal (map (\s -> (gV (interpret s vT fT))) x), vT, fT)
                          IdentAst _ x -> do
                                          let entry = (getEntryFromEnv vT x)
                                          case entry of
                                            Just y -> (y, vT, fT)
                                            Nothing -> (ErrorVal [("Variable " ++ [x] ++ " not found")], vT, fT)
                          FunctionCall _ x y -> do
                                                let entry = (getEntryFromTable fT x)
                                                case entry of
                                                    Just (params, retExpr) -> do
                                                                              let zippedData = (zipWith generateParam params y)
                                                                              let finalZippedData = (map (\(x, y) -> (x, (gV (interpret y vT fT)))) zippedData)
                                                                              let addedScopeEnv = addScopeToEnv vT
                                                                              let vTable = (foldl (\table tuple -> addEntryToEnv table tuple) addedScopeEnv  finalZippedData)
                                                                              let retVal = (gV (interpret retExpr vTable fT))
                                                                              (retVal, removeScopeFromEnv vTable, fT)
                                                    Nothing -> (ErrorVal ["Function " ++ [x] ++ " not found"], vT, fT)
                          NegateOperation _ x -> (negVal (gV (interpret x vT fT)), vT, fT)
                          NotOperation _ x -> (notVal (gV (interpret x vT fT)), vT, fT)
                          FunctionDef _ s l e -> (VoidVal, vT, (addEntryToTable fT (s, (l, e)))) 
                          Assign _ s e -> (VoidVal, (addEntryToEnv vT (s, (gV (interpret e vT fT)))),  fT)
                          IfExpr _ cond ifTrue ifFalse -> if (asBool (gV (interpret cond vT fT))) then (interpret ifTrue vT fT) else (interpret ifFalse vT fT)

gV :: (CalcLangValue, Env, FunctionTable) -> CalcLangValue
gV t = case t of
         (a, _, _) -> a

asBool :: CalcLangValue -> Bool
asBool val = case val of
               BoolVal val -> val
               IntVal val -> val /= 0
               RealVal val -> val /= 0
               PercentVal val -> val /= 0

asReal :: CalcLangValue -> Double
asReal val = case val of
               IntVal val -> (fromIntegral val :: Double)
               DollarVal val -> val
               RealVal val -> val
               PercentVal val -> val
               BoolVal val -> if val then 1.0 else 0.0
               _ -> -1.0

powVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
powVals v1 v2 = case (v1, v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, _) -> TupleVal (map (\x -> (powVals x v2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (powVals x v2)) v1)
                 (IntVal v1, IntVal v2) -> IntVal (v1^v2)
                 (IntVal v1, BoolVal v2) -> IntVal (v1^(if v2 then 1 else 0))
                 (IntVal v1, RealVal v2) -> RealVal ((fromIntegral v1 :: Double)**v2)
                 (RealVal v1, IntVal v2) -> RealVal (v1**(fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> RealVal (v1**(if v2 then 1.0 else 0.0))
                 (RealVal v1, RealVal v2) -> RealVal (v1**v2)
                 (RealVal v1, PercentVal v2) -> RealVal (v1**v2)
                 (BoolVal v1, IntVal v2) -> IntVal ((if v1 then 1 else 0)^v2)
                 (BoolVal v1, BoolVal v2) -> BoolVal (((if v1 then 1 else 0)^(if v2 then 1 else 0) /= 0))
                 (BoolVal v1, RealVal v2) -> RealVal ((if v1 then 1.0 else 0.0)**v2)
                 (PercentVal v1, RealVal v2) -> PercentVal (v1**v2)
                 (PercentVal v1, IntVal v2) -> PercentVal (v1**(fromIntegral v2 :: Double))
                 (x,y) -> ErrorVal [("Unable to multiply " ++ show x ++ " by " ++ show y)]

multVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
multVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (multVals v1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (multVals v1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (multVals x v2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (multVals x v2)) v1)
                 (IntVal v1, IntVal v2) -> IntVal (v1 * v2)
                 (IntVal v1, BoolVal v2) -> IntVal (v1 * (if v2 then 1 else 0))
                 (IntVal v1, RealVal v2) -> RealVal ((fromIntegral v1 :: Double) * v2)
                 (IntVal v1, PercentVal v2) -> RealVal ((fromIntegral v1 :: Double) * v2)
                 (IntVal v1, DollarVal v2) -> DollarVal ((fromIntegral v1 :: Double) * v2)
                 (RealVal v1, IntVal v2) -> RealVal (v1 * (fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> RealVal (v1 * (if v2 then 1.0 else 0.0))
                 (RealVal v1, RealVal v2) -> RealVal (v1 * v2)
                 (RealVal v1, PercentVal v2) -> RealVal (v1 * v2)
                 (RealVal v1, DollarVal v2) -> DollarVal (v1 * v2)
                 (BoolVal v1, IntVal v2) -> IntVal ((if v1 then 1 else 0) * v2)
                 (BoolVal v1, BoolVal v2) -> BoolVal (((if v1 then 1 else 0)*(if v2 then 1 else 0)) /= 0)
                 (BoolVal v1, RealVal v2) -> RealVal ((if v1 then 1.0 else 0.0) * v2)
                 (BoolVal v1, PercentVal v2) -> RealVal ((if v1 then 1.0 else 0.0) * v2)
                 (BoolVal v1, DollarVal v2) -> DollarVal ((if v1 then 1.0 else 0.0) * v2)
                 (DollarVal v1, PercentVal v2) -> DollarVal (v1 * v2)
                 (DollarVal v1, IntVal v2) -> DollarVal (v1 * (fromIntegral v2 :: Double))
                 (DollarVal v1, RealVal v2) -> DollarVal (v1 * v2)
                 (DollarVal v1, BoolVal v2) -> DollarVal (v1 * (if v2 then 1.0 else 0.0))
                 (PercentVal v1, PercentVal v2) -> PercentVal (v1*v2)
                 (PercentVal v1, RealVal v2) -> PercentVal (v1*v2)
                 (PercentVal v1, IntVal v2) -> PercentVal (v1 * (fromIntegral v2 :: Double))
                 (PercentVal v1, BoolVal v2) -> PercentVal (v1 * (if v2 then 1.0 else 0.0))
                 (x,y) -> ErrorVal [("Unable to multiply " ++ show x ++ " by " ++ show y)]


divVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
divVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (divVals v1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (divVals v1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (divVals x v2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (divVals x v2)) v1)
                 (IntVal v1, IntVal v2) -> RealVal ((fromIntegral v1 :: Double) / (fromIntegral v2 :: Double))
                 (IntVal v1, BoolVal v2) -> RealVal ((fromIntegral v1 :: Double) / (if v2 then 1.0 else 0.0))
                 (IntVal v1, RealVal v2) -> RealVal ((fromIntegral v1 :: Double) / v2)
                 (IntVal v1, PercentVal v2) -> RealVal ((fromIntegral v1 :: Double) / v2)
                 (RealVal v1, IntVal v2) -> RealVal (v1 / (fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> RealVal (v1 / (if v2 then 1.0 else 0.0))
                 (RealVal v1, RealVal v2) -> RealVal (v1 / v2)
                 (RealVal v1, PercentVal v2) -> RealVal (v1 / v2)
                 (BoolVal v1, IntVal v2) -> RealVal ((if v1 then 1.0 else 0.0)/(fromIntegral v2 :: Double))
                 (BoolVal v1, BoolVal v2) -> RealVal ((if v1 then 1 else 0)/(if v2 then 1 else 0))
                 (BoolVal v1, RealVal v2) -> RealVal ((if v1 then 1.0 else 0.0)/v2)
                 (BoolVal v1, PercentVal v2) -> RealVal ((if v1 then 1.0 else 0.0)/v2)
                 (DollarVal v1, DollarVal v2) -> RealVal (v1 / v2)
                 (DollarVal v1, PercentVal v2) -> DollarVal (v1 / v2)
                 (DollarVal v1, IntVal v2) -> DollarVal (v1 / (fromIntegral v2 :: Double))
                 (DollarVal v1, RealVal v2) -> DollarVal (v1 / v2)
                 (PercentVal v1, PercentVal v2) -> RealVal (v1 / v2)
                 (PercentVal v1, RealVal v2) -> PercentVal (v1 / v2)
                 (PercentVal v1, IntVal v2) -> PercentVal (v1 / (fromIntegral v2 :: Double))
                 (x,y) -> ErrorVal [("Unable to divide " ++ show x ++ " by " ++ show y)]

dotProductVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
dotProductVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (TupleVal v1, TupleVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (SetVal v1, TupleVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (SetVal v1, SetVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (x,y) -> ErrorVal [("Unable to perform dot product on  " ++ show x ++ " and " ++ show y)]

addVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
addVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (addVals v1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (addVals v1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (addVals x v2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (addVals x v2)) v1)
                 (IntVal v1, IntVal v2) -> IntVal (v1 + v2)
                 (IntVal v1, BoolVal v2) -> IntVal (v1 + (if v2 then 1 else 0))
                 (IntVal v1, RealVal v2) -> RealVal ((fromIntegral v1 :: Double) + v2)
                 (RealVal v1, IntVal v2) -> RealVal (v1 + (fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> RealVal (v1 + (if v2 then 1.0 else 0.0))
                 (RealVal v1, RealVal v2) -> RealVal (v1 + v2)
                 (BoolVal v1, IntVal v2) -> IntVal ((if v1 then 1 else 0)+v2)
                 (BoolVal v1, BoolVal v2) -> IntVal ((if v1 then 1 else 0)+(if v2 then 1 else 0))
                 (BoolVal v1, RealVal v2) -> RealVal ((if v1 then 1.0 else 0.0) + v2)
                 (DollarVal v1, DollarVal v2) -> DollarVal(v1+v2)
                 (PercentVal v1, PercentVal v2) -> PercentVal(v1+v2)
                 (x,y) -> ErrorVal [("Unable to add " ++ show x ++ " and " ++ show y)]

subtractVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
subtractVals v1 v2 = addVals v1 (negVal v2)

negVal :: CalcLangValue -> CalcLangValue
negVal v1 = case v1 of
                 ErrorVal v1 -> ErrorVal v1
                 TupleVal v1 -> TupleVal (map (\x -> negVal x) v1)
                 SetVal v1 -> SetVal (map (\x -> negVal x) v1)
                 IntVal v1 -> IntVal (-v1)
                 RealVal v1 -> RealVal (-v1)
                 BoolVal v1 -> IntVal (-(if v1 then 1 else 0))
                 DollarVal v1 -> DollarVal (-v1)
                 PercentVal v1 -> PercentVal (-v1)
                 x -> ErrorVal [("Unable to negate " ++ show x)]

notVal :: CalcLangValue -> CalcLangValue
notVal v1 = case v1 of
                 ErrorVal v1 -> ErrorVal v1
                 TupleVal v1 -> TupleVal (map (\x -> notVal x) v1)
                 SetVal v1 -> SetVal (map (\x -> notVal x) v1)
                 IntVal v1 -> BoolVal (v1 /= 0)
                 RealVal v1 -> BoolVal (v1 /= 0.0)
                 BoolVal v1 -> BoolVal (not v1)
                 x -> ErrorVal [("Unable to perform logical not on " ++ show x)]

andVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
andVals v1 v2 = case (v1, v2) of
              (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
              (ErrorVal v1, _) -> ErrorVal v1
              (_, ErrorVal v2) -> ErrorVal v2
              (_, TupleVal v2) -> ErrorVal [("Error: Tuple value found in boolean expression")]
              (_, SetVal v2) -> ErrorVal [("Error: Set value found in boolean expression")]
              (TupleVal v1, _) -> ErrorVal [("Error: Tuple value found in boolean expression")]
              (SetVal v1, _) -> ErrorVal [("Error: Set value found in boolean expression")]
              (DollarVal v1, _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (_,DollarVal v2) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (PercentVal v1, _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (_,PercentVal v2) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (v1,v2) -> BoolVal((asBool v1) && (asBool v2))


equalVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
equalVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> foldl (\x y -> andVals x y) (BoolVal True) (map (\(x,y) -> equalVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> foldl (\x y -> andVals x y) (BoolVal True) (map (\(x,y) -> equalVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> foldl (\x y -> andVals x y) (BoolVal True) (map (\(x,y) -> equalVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> foldl (\x y -> andVals x y) (BoolVal True) (map (\(x,y) -> equalVals x y) (zip v1 v2))
                 (IntVal v1, IntVal v2) -> BoolVal (v1 == v2)
                 (IntVal v1, BoolVal v2) -> BoolVal (v1 == (if v2 then 1 else 0))
                 (IntVal v1, RealVal v2) -> BoolVal ((fromIntegral v1 :: Double) == v2)
                 (RealVal v1, IntVal v2) -> BoolVal (v1 == (fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> BoolVal (v1 == if v2 then 1.0 else 0.0)
                 (RealVal v1, RealVal v2) -> BoolVal (v1 == v2)
                 (BoolVal v1, IntVal v2) -> BoolVal ((if v1 then 1 else 0) == v2)
                 (BoolVal v1, BoolVal v2) -> BoolVal (v1 == v2)
                 (BoolVal v1, RealVal v2) -> BoolVal ((if v1 then 1.0 else 2.0) == v2)
                 (DollarVal v1, DollarVal v2) -> BoolVal(v1 == v2)
                 (PercentVal v1, PercentVal v2) -> BoolVal(v1 == v2)
                 (x,y) -> ErrorVal [("Unable to check for equality on types " ++ show x ++ " and " ++ show y)]

lessThanVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
lessThanVals v1 v2 = case (v1,v2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (IntVal v1, IntVal v2) -> BoolVal (v1 < v2)
                 (IntVal v1, BoolVal v2) -> BoolVal (v1 < (if v2 then 1 else 0))
                 (IntVal v1, RealVal v2) -> BoolVal ((fromIntegral v1 :: Double) < v2)
                 (RealVal v1, IntVal v2) -> BoolVal (v1 < (fromIntegral v2 :: Double))
                 (RealVal v1, BoolVal v2) -> BoolVal (v1 < (if v2 then 1.0 else 0.0))
                 (RealVal v1, RealVal v2) -> BoolVal (v1 < v2)
                 (BoolVal v1, IntVal v2) -> BoolVal ((if v1 then 1 else 0) < v2)
                 (BoolVal v1, BoolVal v2) -> BoolVal ((if v1 then 1 else 0) < (if v2 then 1 else 0))
                 (BoolVal v1, RealVal v2) -> BoolVal ((if v1 then 1.0 else 0.0) < v2)
                 (DollarVal v1, DollarVal v2) -> BoolVal(v1<v2)
                 (PercentVal v1, PercentVal v2) -> BoolVal(v1<v2)
                 (x,y) -> ErrorVal [("Unable to check for equality on types " ++ show x ++ " and " ++ show y)]

greaterThanVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
greaterThanVals v1 v2 = case (v1,v2) of
                   (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                   (ErrorVal v1, _) -> ErrorVal v1
                   (_, ErrorVal v2) -> ErrorVal v2
                   (IntVal v1, IntVal v2) -> BoolVal (v1 > v2)
                   (IntVal v1, BoolVal v2) -> BoolVal (v1 > (if v2 then 1 else 0))
                   (IntVal v1, RealVal v2) -> BoolVal ((fromIntegral v1 :: Double) > v2)
                   (RealVal v1, IntVal v2) -> BoolVal (v1 > (fromIntegral v2 :: Double))
                   (RealVal v1, BoolVal v2) -> BoolVal (v1 > (if v2 then 1.0 else 0.0))
                   (RealVal v1, RealVal v2) -> BoolVal (v1 > v2)
                   (BoolVal v1, IntVal v2) -> BoolVal ((if v1 then 1 else 0) > v2)
                   (BoolVal v1, BoolVal v2) -> BoolVal ((if v1 then 1 else 0) > (if v2 then 1 else 0))
                   (BoolVal v1, RealVal v2) -> BoolVal ((if v1 then 1.0 else 0.0) > v2)
                   (DollarVal v1, DollarVal v2) -> BoolVal(v1 > v2)
                   (PercentVal v1, PercentVal v2) -> BoolVal(v1 > v2)
                   (x,y) -> ErrorVal [("Unable to check for equality on types " ++ show x ++ " and " ++ show y)]

lessOrEqualVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
lessOrEqualVals v1 v2 = notVal (greaterThanVals v1 v2)

greaterOrEqualVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
greaterOrEqualVals v1 v2 = notVal (lessThanVals v1 v2)

runCalcLang :: IO ()
runCalcLang = do
              let x = (Environment [])
              let y = (SymbolTable [])
              runCommandLine x y

runCommandLine :: Env -> FunctionTable -> IO ()
runCommandLine vT fT = do
                       putStr ">>CalcLang>> "
                       hFlush stdout
                       input <- getLine
                       lexResult <- (runCalcLangLexer input)
                       parseResult <- (runCalcLangParser input)
                       case parseResult of
                         ErrorNode err -> print err
                         t -> do
                              let interpreterResult = (interpret t vT fT)
                              case interpreterResult of
                                    (VoidVal, x, y) -> runCommandLine x y
                                    (a, x, y) -> do
                                                 putStrLn (toString a)
                                                 runCommandLine x y
