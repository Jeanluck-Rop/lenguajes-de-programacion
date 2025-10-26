module ASV where

-- ASA Values
data ASV
  = VarV String
  | NumV Int
  | BoolV Bool
  | AddV ASV ASV
  | SubV ASV ASV
  | MulV ASV ASV
  | DiV ASV ASV
  | SqrtV ASV
  | ExptV ASV
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
  | NiV
  | Closure String ASV [(String, ASV)]
  deriving (Show, Eq)
