module ASA where

-- Definir los tipos básicos
type Var = String
type Int = Int

-- Constantes booleanas
data Bool
  = BTrue -- #t
  | BFalse -- #f
  deriving (Show, Eq)

-- Sintaxis abstracta
data Expr
-- Marque con E los constructores para que no se mezclen con otros constructores pero se puede quitar
  = EVar Var
  | EInt Int
  | EBool Bool
  | EAdd Expr Expr
  | ESub Expr EXpr
  | ENot Expr
  | ELet Var Expr Expr
  | ELetrec Var Expr Expr
  | EIf0 Expr Expr Expr
  | ELambda Var Expr
  | EApp Expr Expr
  deriving (Show, Eq)  
