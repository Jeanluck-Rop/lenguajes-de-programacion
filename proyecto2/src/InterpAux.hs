module InterpAux where

import ASV

isValue :: ASV -> Bool
isValue (NumV _) = True
isValue (BoolV _) = True
isValue _ = False

isClosure :: ASV -> Bool
isClosure (Closure _ _ _) = True
isClosure _ = False

isFunV :: ASV -> Bool
isFunV (FunV  _ _) = True
isFunV _ = False

lookupEnv :: String -> Env -> ASV
lookupEnv i [] = error ("Variable 'Var " ++ i ++ "' no definida")
lookupEnv i ((j, v):e)
  | i == j = v
  | otherwise = lookupEnv i e
