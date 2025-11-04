module Saca where

import ASV

--Funcion para obtener el resultado e imprimirlo como cadena y no como tipo de dato ASV
saca :: ASV -> String
saca (NiV) = "[]"
saca (NumV n) = show n
saca (BoolV b)
  | b == True = "#t"
  | otherwise = "#f"
--saca (Closure p c e) = "#<procedure>"
saca (ClosureF p c e) = "#<procedure>"
saca (ConV f s) = "[" ++ sacaElems (ConV f s) ++ "]"
saca (PairV f s) = "(" ++ saca f ++ "," ++ saca s ++ ")"
saca _ = "#<unknown>"


-- Funcion auxiliar para recorrer ConV
sacaElems :: ASV -> String
sacaElems NiV = "[]"
sacaElems (ConV x xs) = saca x ++ ", " ++ sacaElems xs
sacaElems x = saca x
