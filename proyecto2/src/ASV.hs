module ASV where

type Env = [(String, ASV)]

data ASV
  = VarV String
  | NumV Int
  | BoolV Bool
  | AddV ASV ASV
  | SubV ASV ASV
  | MulV ASV ASV
  | DiV ASV ASV
  | NotV ASV
  | EqualV ASV ASV
  | LessV ASV ASV
  | GreaterV ASV ASV
  | DiffV ASV ASV
  | LeqV ASV ASV
  | GeqV ASV ASV
  | IfV ASV ASV ASV
  | FunV String ASV
  | AppV ASV ASV
  | Closure String ASV Env
  deriving (Show, Eq)
