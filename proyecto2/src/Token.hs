module Token where

-- Tokens para el Lexer
data Token
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  | TokenAdd
  | TokenSub
  | TokenNot
  | TokenLet
  | TokenLambda
  | TokenPA
  | TokenPC
  deriving (Show, Eq)
