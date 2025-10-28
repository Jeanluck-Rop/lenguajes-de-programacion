module Desugar where

import ASA
import AST
import ASV

{-- Desazucaramos los ASA  --}
desugar :: ASA -> AST
-- Casos base
desugar (Var x) = VarC x
desugar (Num n) = NumC n
desugar (Boolean b) = BoolC b
-- Operaciones aritmeticas
desugar (Add xs) = desugarOps AddC xs
desugar (Sub xs) = desugarOps SubC xs
desugar (Mul xs) = desugarOps MulC xs
desugar (Div xs) = desugarOps DivC xs
desugar (Add1 n) = AddC (desugar n) (NumC 1)
desugar (Sub1 n) = SubC (desugar n) (NumC 1)
desugar (Expt n) = MulC (desugar n) (desugar n)
desugar (Sqrt n) = SqrtC (desugar n)
-- Not
desugar (Not x) = NotC (desugar x)
-- Comparaciones
desugar (Equal xs) = desugarComp EqualC xs
desugar (Less xs) = desugarComp LessC xs
desugar (Greater xs) = desugarComp GreaterC xs
desugar (Diff xs) = desugarComp DiffC xs
desugar (Leq xs) = desugarComp LeqC xs
desugar (Geq xs) = desugarComp GeqC xs
-- Pares
desugar (Pair f s) = PairC (desugar f) (desugar s)
desugar (Fst p) = FstC (desugar p)
desugar (Snd p) = SndC (desugar p)
--Condicionales
desugar (If0 c t e) = IfC (EqualC (desugar c) (NumC 0)) (desugar t) (desugar e)
desugar (If c t e) = IfC (desugar c) (desugar t) (desugar e)
desugar (Cond cs e) = desugarCond cs e
--Lets
desugar (Let iv b) = desugarLet iv b
desugar (LetStar [] body) = desugar body
desugar (LetStar (iv:ivs) b) = desugar (Let [iv] (LetStar ivs b))
---
desugar (LetRec i v b) = desugar (LetStar [(i, App (Lambda [i] v) [Lambda [i] v])] b)
---
--Expresiones lambda
desugar (Lambda ps b) = desugarLmb ps b
desugar (App f as) = desugarApp (desugar f) as
--Listas
desugar (List l) = desugarList l
desugar (Head l) = HeadC (desugar l)
desugar (Tail l) = TailC (desugar l)


{-- Funciones auxiliares para desugar --}
--Funcion auxiliar para desazucarar los operadores
desugarOps :: (AST -> AST -> AST) -> [ASA] -> AST
desugarOps _ [] = error "[desugarOps Error]: Lista vacía (no debería suceder)"
desugarOps _ [x] = desugar x
desugarOps op (x:xs) = op (desugar x) (desugarOps op xs)

--Funcion auxiliar para desazucarar los comparadores
desugarComp :: (AST -> AST -> AST) -> [ASA] -> AST
desugarComp _ [] = BoolC True
desugarComp _ [_] = BoolC True
desugarComp op [i, d] = op (desugar i) (desugar d)
desugarComp op (i:d:is) = IfC (op (desugar i) (desugar d))
                          (desugarComp op (d:is))
                          (BoolC False)
  
--Funcion auxiliar para desazucarar el operador cond
desugarCond :: [(ASA, ASA)] -> ASA -> AST
desugarCond [] e = desugar e
desugarCond ((c, t):cs) e = IfC (desugar c) (desugar t) (desugarCond cs e)

--Funciones auxiliares para desazucarar let
desugarLet :: [(String, ASA)] -> ASA -> AST
desugarLet [] b = desugar b
desugarLet ((p, v):ps) b = AppC (FunC p (desugarLet ps b)) (desugar v)

--Funcion auxiliar para desazucarar las funcioneslambda
desugarLmb :: [String] -> ASA -> AST
desugarLmb [] b = desugar b
desugarLmb (p:ps) b = FunC p (desugarLmb ps b)

--Funcion auxiliar para desazucarar las aplicaciones de funcion
desugarApp :: AST -> [ASA] -> AST
desugarApp f [] = f
desugarApp f (a:as) = desugarApp (AppC f (desugar a)) as

--Funcion auxiliar para construir listas como cons y nil
desugarList :: [ASA] -> AST
desugarList [] = NiL
desugarList [x] = desugar x
desugarList (x:xs) = ConS (desugar x) (desugarList xs)


{-- Convertimos los AST a estados finales ASV --}
desugalues :: AST -> ASV
desugalues (VarC x) = VarV x
desugalues (NumC n) = NumV n
desugalues (BoolC b) = BoolV b
desugalues (AddC i d) = AddV (desugalues i) (desugalues d)
desugalues (SubC i d) = SubV (desugalues i) (desugalues d)
desugalues (MulC i d) = MulV (desugalues i) (desugalues d)
desugalues (DivC i d) = DiV (desugalues i) (desugalues d)
desugalues (SqrtC n) = SqrtV (desugalues n)
desugalues (NotC x) = NotV (desugalues x)
desugalues (EqualC i d) = EqualV (desugalues i) (desugalues d)
desugalues (LessC i d) = LessV (desugalues i) (desugalues d)
desugalues (GreaterC i d) = GreaterV (desugalues i) (desugalues d)
desugalues (DiffC i d) = DiffV (desugalues i) (desugalues d)
desugalues (LeqC i d) = LeqV (desugalues i) (desugalues d)
desugalues (GeqC i d) = GeqV (desugalues i) (desugalues d)
desugalues (PairC f s) = PairV (desugalues f) (desugalues s)
desugalues (FstC p) = FstV (desugalues p)
desugalues (SndC p) = SndV (desugalues p)
desugalues (ConS f s) = ConV (desugalues f) (desugalues s)
desugalues (HeadC p) = HeadV (desugalues p)
desugalues (TailC p) = TailV (desugalues p)
desugalues (IfC c t e) = IfV (desugalues c) (desugalues t) (desugalues e)
desugalues (FunC p b) = FunV p (desugalues b)
desugalues (AppC f a) = AppV (desugalues f) (desugalues a)
desugalues NiL = NiV
