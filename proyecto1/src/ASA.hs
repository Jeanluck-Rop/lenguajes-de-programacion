module ASA where

--- ASA con azucar lo llamaremos simplemente ASA
data ASA
  = Var String
  | Num Int
  | Boolean Bool
  | Add [ASA]
  | Sub [ASA]
  | Mul [ASA]
  | Div [ASA]
  | Add1 ASA
  | Sub1 ASA
  | Sqrt ASA
  | Expt ASA    --Eleva al cuadrado
  | Not ASA
  | Equal [ASA]
  | Less [ASA]
  | Greater [ASA]
  | Diff [ASA]
  | Leq [ASA]
  | Geq [ASA]
  | Pair ASA ASA
  | Fst ASA
  | Snd ASA
  | If0 ASA ASA ASA
  | If ASA ASA ASA
  | Let [(String, ASA)] ASA
  | LetRec [(String, ASA)] ASA
  | LetStar [(String, ASA)] ASA
  | Lambda [String] ASA
  | App ASA [ASA]
  | List [ASA]
  | Head ASA
  | Tail ASA
  | Cond [(ASA, ASA)] ASA
  deriving (Show, Eq)
