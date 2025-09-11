module CalcLangInterpreter(runCalcLang) where

import CalcLangParser
import Numeric
import System.IO
import CalcLangAstH
import Data.List

data CalcLangValue = BoolVal Bool
                   | IntVal Int
                   | RealVal Double
                   | VoidVal
                   | TupleVal [CalcLangValue]
                   | SetVal [CalcLangValue]
                   | DollarVal Double
                   | PercentVal Double
                   | PrintVal String
                   | QuitVal
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
envToStrings :: Env -> [String]
envToStrings e = case e of
                   Environment a -> do
                                    let res = (map varTableToStrings a)
                                    (concat res)
                                    

funcTableToStrings :: FunctionTable -> [String]
funcTableToStrings table = case table of
                              SymbolTable a -> map (\(b,c) -> case c of
                                                                (list, node) -> "func " ++ [b] ++ "(" ++ (intercalate ", " (map toString list)) ++ ") = " ++ (toString node)) a

varTableToStrings :: VariableTable -> [String]
varTableToStrings table = case table of
                              SymbolTable a -> map (\(b,c) -> "let " ++ [b] ++ " = " ++ (toStr c)) a

funcTableToString :: FunctionTable -> String
funcTableToString table = do
                            let x = (funcTableToStrings table)
                            let longest = (foldl (\b a -> if ((length a) > b) then length a else b) 0 x)
                            let trans = map (\s -> s ++ (replicate (longest - (length s)) ' ')) x
                            foldl (\myElem list -> "| " ++ myElem ++ " |" ++ "\n" ++ list) "" trans

envToString :: Env -> String
envToString table = do
                    let x = (envToStrings table)
                    let longest = (foldl (\b a -> if ((length a) > b) then length a else b) 0 x)
                    let trans = map (\s -> s ++ (replicate (longest - (length s)) ' ')) x
                    foldl (\myElem myList -> "| " ++ myElem ++ " |" ++ "\n" ++ myList) "" trans

varTableToString :: VariableTable -> String
varTableToString table = do
                         let x = (varTableToStrings table)
                         let longest = (foldl (\b a -> if ((length a) > b) then length a else b) 0 x)
                         let trans = map (\s -> s ++ (replicate (longest - (length s)) ' ')) x
                         foldl (\myElem myList -> "| " ++ myElem ++ " |" ++ "\n" ++ myList) "" trans 
                            
                            


removeScopeFromEnv :: Env -> Env
removeScopeFromEnv a = case a of
                         Environment [] -> Environment []
                         Environment [_] -> Environment []
                         Environment (_ : r) -> Environment r
                  

addEntryToEnv :: Env -> (Char, CalcLangValue) ->  Env
addEntryToEnv e t = case e of
                      Environment [] -> case (addScopeToEnv e) of
                                          Environment [a] -> Environment [addEntryToTable a t]
                                          _ -> e
                      Environment [a] -> Environment [addEntryToTable a t]
                      Environment (a : b) -> Environment ((addEntryToTable a t) : b)  

addEntryToTable :: STable a b -> (a, b) -> STable a b
addEntryToTable table entry = case table of
                                SymbolTable x -> SymbolTable (entry : x)


getEntryFromEnv :: Env -> Char -> Maybe CalcLangValue
getEntryFromEnv e c = case e of
                        Environment [] -> Nothing
                        Environment [a] -> (getEntryFromTable a c)
                        Environment (a : rest) -> do
                                                  let x = (getEntryFromTable a c)
                                                  case x of
                                                    Nothing -> (getEntryFromEnv (Environment  rest) c)
                                                    _ -> x

getEntryFromTable :: (Eq a) => STable a b -> a -> Maybe b
getEntryFromTable table key = case table of
                                  SymbolTable [] -> Nothing
                                  SymbolTable list -> getKey list key

getKey :: (Eq key) => [(key,a)] -> key -> Maybe a
getKey list key = case list of
                    [] -> Nothing
                    ((elemKey, elemData) : rest) -> case elemKey == key of
                                                      True -> Just elemData
                                                      False -> (getKey rest key)
                        
                           
                           
toErrorLog :: [String] -> String
toErrorLog errors = case errors of
                      [] -> ""
                      (current:[]) -> current ++ "\n"
                      (current:rest) -> (toErrorLog rest) ++ current ++ "\n"

toStr :: CalcLangValue -> String
toStr aval = case aval of
                   IntVal val -> show val
                   RealVal val -> show val
                   TupleVal val -> "(" ++ (intercalate ", " (map toStr val)) ++ ")"
                   SetVal val -> "{" ++ (intercalate ", " (map toStr val)) ++ "}"
                   DollarVal val -> "$" ++ (showFFloat (Just 2) val "")
                   PercentVal val -> (showFFloat (Just 2) (val*100.0) "") ++ "%"
                   BoolVal val -> if val then "TRUE" else "FALSE"
                   PrintVal val -> val
                   ErrorVal val -> "<<<~~~ERROR~~~>>>\n\n" ++ (toErrorLog val)
                   _ -> ""

generateParam :: AstNode -> AstNode -> (Char, AstNode)
generateParam paramLexeme toExpr = case paramLexeme of
                                     IdentAst _ x -> (x, toExpr)
                                     _ -> ('\0', ErrorNode "param does have expression")

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
                          SetAst _ x -> case x of
                                          StoreArray _ arr -> (SetVal (map (\s -> (gV (interpret s vT fT))) arr), vT, fT)
                          TupleAst _ x -> case x of
                                            StoreArray _ arr -> (TupleVal (map (\s -> (gV (interpret s vT fT))) arr), vT, fT)
                          IdentAst _ x -> do
                                          let entry = (getEntryFromEnv vT x)
                                          case entry of
                                            Just y -> (y, vT, fT)
                                            Nothing -> (ErrorVal [("Variable " ++ [x] ++ " not found")], vT, fT)
                          FunctionCall _ x y -> case y of
                                                  StoreArray _ arr -> do
                                                                      let entry = (getEntryFromTable fT x)
                                                                      case entry of
                                                                        Just (params, retExpr) -> do
                                                                                                  let zippedData = (zipWith generateParam params arr)
                                                                                                  let finalZippedData = (map (\(zx, zy) -> (zx, (gV (interpret zy vT fT)))) zippedData)
                                                                                                  let addedScopeEnv = addScopeToEnv vT
                                                                                                  let vTable = (foldl (\table tuple -> addEntryToEnv table tuple) addedScopeEnv  finalZippedData)
                                                                                                  let retVal = (gV (interpret retExpr vTable fT))
                                                                                                  (retVal, removeScopeFromEnv vTable, fT)
                                                                        Nothing -> (ErrorVal ["Function " ++ [x] ++ " not found"], vT, fT)
                          NegateOperation _ x -> (negVal (gV (interpret x vT fT)), vT, fT)
                          NotOperation _ x -> (notVal (gV (interpret x vT fT)), vT, fT)
                          FunctionDef _ s l e -> case l of
                                                   StoreArray _ ad -> (VoidVal, vT, (addEntryToTable fT (s, (ad, e)))) 
                          Assign _ s e -> (VoidVal, (addEntryToEnv vT (s, (gV (interpret e vT fT)))),  fT)
                          IfExpr _ cond ifTrue ifFalse -> if (asBool (gV (interpret cond vT fT))) then (interpret ifTrue vT fT) else (interpret ifFalse vT fT)
                          ParenExpr _ expr -> interpret expr vT fT
                          ShowFunctionsCommand _ -> (PrintVal (funcTableToString fT), vT, fT)
                          ShowVariablesCommand _ -> (PrintVal (envToString vT), vT, fT)
                          QuitCommand _ -> (QuitVal, vT, fT)
                          ErrorNode s -> (ErrorVal ["Error at" ++ (show s)], vT, fT)

gV :: (CalcLangValue, Env, FunctionTable) -> CalcLangValue
gV t = case t of
         (a, _, _) -> a

asBool :: CalcLangValue -> Bool
asBool aval = case aval of
                BoolVal val -> val
                IntVal val -> val /= 0
                RealVal val -> val /= 0
                PercentVal val -> val /= 0
                _ -> False

powVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
powVals a1 a2 = case (a1, a2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (_, TupleVal _) -> ErrorVal [("Unable to exponent " ++ show a1 ++ " by " ++ show a2)] 
                 (_, SetVal _) -> ErrorVal [("Unable to exponent " ++ show a1 ++ " by " ++ show a2)] 
                 (TupleVal v1, _) -> TupleVal (map (\x -> (powVals x a2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (powVals x a2)) v1)
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
                 (x,y) -> ErrorVal [("Unable to exponent " ++ show x ++ " by " ++ show y)]

multVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
multVals a1 a2 = case (a1,a2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x,y) -> multVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (multVals a1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (multVals a1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (multVals x a2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (multVals x a2)) v1)
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
divVals a1 a2 = case (a1,a2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x,y) -> divVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (divVals a1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (divVals a1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (divVals x a2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (divVals x a2)) v1)
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
dotProductVals a1 a2 = case (a1,a2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (TupleVal v1, TupleVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (SetVal v1, TupleVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (SetVal v1, SetVal v2) -> (foldl (\x y -> addVals x y) (IntVal 0) (map (\(x,y) -> multVals x y) (zip v1 v2))) 
                 (x,y) -> ErrorVal [("Unable to perform dot product on  " ++ show x ++ " and " ++ show y)]

addVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
addVals a1 a2 = case (a1,a2) of
                 (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
                 (ErrorVal v1, _) -> ErrorVal v1
                 (_, ErrorVal v2) -> ErrorVal v2
                 (TupleVal v1, SetVal v2) -> TupleVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (TupleVal v1, TupleVal v2) -> TupleVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (SetVal v1, TupleVal v2) -> SetVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (SetVal v1, SetVal v2) -> SetVal (map (\(x, y) -> addVals x y) (zip v1 v2))
                 (_, TupleVal v2) -> TupleVal (map (\x -> (addVals a1 x)) v2)
                 (_, SetVal v2) -> SetVal (map (\x -> (addVals a1 x)) v2)
                 (TupleVal v1, _) -> TupleVal (map (\x -> (addVals x a2)) v1)
                 (SetVal v1, _) -> SetVal (map (\x -> (addVals x a2)) v1)
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
negVal a1 = case a1 of
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
notVal a1 = case a1 of
                 ErrorVal v1 -> ErrorVal v1
                 TupleVal v1 -> TupleVal (map (\x -> notVal x) v1)
                 SetVal v1 -> SetVal (map (\x -> notVal x) v1)
                 IntVal v1 -> BoolVal (v1 /= 0)
                 RealVal v1 -> BoolVal (v1 /= 0.0)
                 BoolVal v1 -> BoolVal (not v1)
                 x -> ErrorVal [("Unable to perform logical not on " ++ show x)]

andVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
andVals a1 a2 = case (a1, a2) of
              (ErrorVal v1, ErrorVal v2) -> ErrorVal (v1 ++ v2)
              (ErrorVal v1, _) -> ErrorVal v1
              (_, ErrorVal v2) -> ErrorVal v2
              (_, TupleVal _) -> ErrorVal [("Error: Tuple value found in boolean expression")]
              (_, SetVal _) -> ErrorVal [("Error: Set value found in boolean expression")]
              (TupleVal _, _) -> ErrorVal [("Error: Tuple value found in boolean expression")]
              (SetVal _, _) -> ErrorVal [("Error: Set value found in boolean expression")]
              (DollarVal _, _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (_,DollarVal _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (PercentVal _, _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (_,PercentVal _) -> ErrorVal [("Error: Dollar value found in boolean expression")]
              (v1,v2) -> BoolVal((asBool v1) && (asBool v2))


equalVals :: CalcLangValue -> CalcLangValue -> CalcLangValue
equalVals a1 a2 = case (a1,a2) of
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
lessThanVals a1 a2 = case (a1,a2) of
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
greaterThanVals a1 a2 = case (a1,a2) of
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
                       parseResult <- (runCalcLangParser input)
                       case parseResult of
                         ErrorNode err -> print err
                         t -> do
                              let interpreterResult = (interpret t vT fT)
                              case interpreterResult of
                                    (VoidVal, x, y) -> runCommandLine x y
                                    (QuitVal, _, _) -> return ()
                                    (a, x, y) -> do
                                                 putStrLn (toStr a)
                                                 runCommandLine x y
