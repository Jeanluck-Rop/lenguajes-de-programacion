module Token where

-- Tokens para el Lexer
data Token
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  | TokenAdd
  | TokenSub
  | TokenMul
  | TokenDiv
  | TokenNot
  | TokenEq
  | TokenLt
  | TokenGt
  | TokenNeq
  | TokenLeq
  | TokenGeq
  | TokenIf
  | TokenLet
  | TokenLambda
  | TokenPA
  | TokenPC
  deriving (Show, Eq)
