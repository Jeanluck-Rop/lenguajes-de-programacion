module AST where

-- ASA sin azucar (AST)
data AST
  = VarC String
  | NumC Int
  | BoolC Bool
  | AddC AST AST
  | SubC AST AST
  | MulC AST AST
  | DivC AST AST
  | SqrtC AST
  | NotC AST
  | EqualC AST AST
  | LessC AST AST
  | GreaterC AST AST
  | DiffC AST AST
  | LeqC AST AST
  | GeqC AST AST
  | PairC AST AST
  | FstC AST
  | SndC AST
  | IfC AST AST AST
  | FunC String AST
  | AppC AST AST
  | ConS AST AST
  | HeadC AST
  | TailC AST
  | NiL
  deriving (Show, Eq)
