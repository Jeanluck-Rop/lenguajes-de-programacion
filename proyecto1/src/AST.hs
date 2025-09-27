module AST where

-- ASA sin azucar (AST)
data AST
  = CVar String
  | CNum Int
  | CBool Bool
  | CAdd AST AST
  | CSub AST AST
  | CMul AST AST
  | CDiv AST AST
  | CIf AST AST AST
  | CLambda CVar AST
  | CAPP AST AST
  | CPair AST AST
  | CFst AST
  | CSnd AST
  | CList [AST]
  | CHead AST
  | CTail AST
  | CCond [AST] AST
  deriving (Show, Eq)
