module Desugar where

import ASA
import ASV

{-- Desazucaramos los ASA  --}
desugar :: ASA -> ASV
desugar (Var x) = VarV x
desugar (Num n) = NumV n
desugar (Boolean b) = BoolV b
desugar (Add xs) = desugarOps AddV xs
desugar (Sub xs) = desugarOps SubV xs
desugar (Mul xs) = desugarOps MulV xs
desugar (Div xs) = desugarOps DiV xs
desugar (Not x) = NotV (desugar x)
desugar (Equal xs) = desugarComp EqualV xs
desugar (Less xs) = desugarComp LessV xs
desugar (Greater xs) = desugarComp GreaterV xs
desugar (Diff xs) = desugarComp DiffV xs
desugar (Leq xs) = desugarComp LeqV xs
desugar (Geq xs) = desugarComp GeqV xs
desugar (If c t e) = IfV (desugar c) (desugar t) (desugar e)
desugar (Let i v b) = AppV (FunV i (desugar b)) (desugar v)
desugar (Lambda ps b) = desugarLmb ps b
desugar (App f as) = desugarApp (desugar f) as


--Funcion auxiliar para desazucarar los operadores
desugarOps :: (ASV -> ASV -> ASV) -> [ASA] -> ASV
desugarOps _ [] = error "[desugarOps Error]: Lista vacía (no debería suceder)"
desugarOps _ [x] = desugar x
desugarOps op (x:xs) = op (desugar x) (desugarOps op xs)

--Funcion auxiliar para desazucarar los comparadores
desugarComp :: (ASV -> ASV -> ASV) -> [ASA] -> ASV
desugarComp _ [] = BoolV True
desugarComp _ [_] = BoolV True
desugarComp op [i, d] = op (desugar i) (desugar d)
desugarComp op (i:d:is) = IfV (op (desugar i) (desugar d))
                          (desugarComp op (d:is))
                          (BoolV False)
                          
--Funcion auxiliar para desazucarar as funciones lambda
desugarLmb :: [String] -> ASA -> ASV
desugarLmb [] b = desugar b
desugarLmb (p:ps) b = FunV p (desugarLmb ps b)

--Funcion auxiliar para desazucarar las aplicaciones de funcion
desugarApp :: ASV -> [ASA] -> ASV
desugarApp f [] = f
desugarApp f (a:as) = desugarApp (AppV f (desugar a)) as
