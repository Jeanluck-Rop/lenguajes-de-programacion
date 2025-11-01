module ASV where

import AST

{--
Definimos la representacion del ambiente de ejecucion.
Un ambiente es una lista de pares (id, valor).
--}
type Env = [(String, ASV)]

{-- ASA Values --}
data ASV
  = VarV String
  | NumV Int
  | BoolV Bool
  | NiV
  | AddV ASV ASV
  | SubV ASV ASV
  | MulV ASV ASV
  | DiV ASV ASV
  | SqrtV ASV
  | NotV ASV
  | EqualV ASV ASV
  | LessV ASV ASV
  | GreaterV ASV ASV
  | DiffV ASV ASV
  | LeqV ASV ASV
  | GeqV ASV ASV
  | PairV ASV ASV
  | FstV ASV
  | SndV ASV
  | IfV ASV ASV ASV
  | FunV String ASV
  | AppV ASV ASV
  | ConV ASV ASV
  | HeadV ASV
  | TailV ASV
  | Closure String ASV Env
  | ClosureF String AST Env
  | ExprV AST Env
  deriving (Show, Eq)
