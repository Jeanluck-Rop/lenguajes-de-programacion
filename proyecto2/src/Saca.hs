module Saca where

import ASV

-- Funcion saca extendida, no solo mostramos valores canonicos
--   sino que mostramos todos los tipos de datos ASV para poder mostrar al usuario como vamos generando
---  los ambientes y las asignaciones que vamos metiendo
saca :: ASV -> String
saca (NumV n)  = show n
saca (BoolV True)  = "#t"
saca (BoolV False) = "#f"
saca (VarV x) = x
saca (AddV a b) = "(" ++ " + " ++ saca a ++ saca b ++ ")"
saca (SubV a b) = "(" ++ " - " ++ saca a ++ saca b ++ ")"
saca (MulV a b) = "(" ++ " * " ++ saca a ++ saca b ++ ")"
saca (DiV a b) = "(" ++ " / "  ++ saca a ++ saca b ++ ")"
saca (EqualV a b) = "(" ++ " = "  ++ saca a++ saca b ++ ")"
saca (LessV a b) = "(" ++ " < "  ++ saca a++ saca b ++ ")"
saca (GreaterV a b) = "(" ++ " > " ++ saca a ++ saca b ++ ")"
saca (DiffV a b) = "(" ++ " != "  ++ saca a++ saca b ++ ")"
saca (LeqV a b) = "(" ++ " <= " ++ saca a ++ saca b ++ ")"
saca (GeqV a b) = "(" ++ " >= " ++ saca a ++ saca b ++ ")"
saca (NotV e) = "(not " ++ saca e ++ ")"
saca (IfV c t e) = "(if " ++ saca c ++ " then " ++ saca t ++ " else " ++ saca e ++ ")"
saca (AppV f a) = "(" ++ saca f ++ " " ++ saca a ++ ")"
saca (FunV p body) = "λ" ++ p ++ ". " ++ saca body
saca (Closure p body env) = "<λ" ++ p ++ ". " ++ saca body ++ ", env = {" ++ showEnv env ++ "}>"


-- Funcion auxiliar para representar ambientes
showEnv :: Env -> String
showEnv [] = ""
showEnv ((x,v):xs) = x ++ " -> " ++ saca v ++ (if null xs then "" else ", " ++ showEnv xs)
