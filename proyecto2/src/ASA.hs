module ASA where

data ASA
  = Var String
  | Num Int
  | Boolean Bool
  | Add [ASA]
  | Sub [ASA]
  | Mul [ASA]
  | Div [ASA]
  | Not ASA
  | Equal [ASA]
  | Less [ASA]
  | Greater [ASA]
  | Diff [ASA]
  | Leq [ASA]
  | Geq [ASA]
  | Let String ASA ASA
  | If ASA ASA ASA
  | Lambda [String] ASA
  | App ASA [ASA]
  deriving (Show, Eq)
