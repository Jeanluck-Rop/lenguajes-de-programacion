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
  | TokenAdd1
  | TokenSub1
  | TokenSqrt
  | TokenExpt
  | TokenNot
  | TokenEq
  | TokenLt
  | TokenGt
  | TokenNeq
  | TokenLeq
  | TokenGeq
  | TokenIf0
  | TokenIf
  | TokenFst
  | TokenSnd
  | TokenLet
  | TokenLetRec
  | TokenLetStar
  | TokenHead
  | TokenTail
  | TokenLambda
  | TokenCond
  | TokenElse
  | TokenLI
  | TokenLD
  | TokenComma
  | TokenPA
  | TokenPC
  deriving (Show, Eq)
