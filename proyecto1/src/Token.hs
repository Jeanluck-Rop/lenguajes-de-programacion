module Token where

-- Tokens para el Parser
data Token
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  | TokenAdd        -- +
  | TokenSub        -- -
  | TokenMul        -- *
  | TokenDiv        -- /
  | TokenAdd1       -- ++
  | TokenSub1       -- --
  | TokenSqrt       -- sqrt
  | TokenExpt       -- **
  | TokenNot        -- not
  | TokenEq         -- =
  | TokenLt         -- <
  | TokenGt         -- >
  | TokenNeq        -- !=
  | TokenLeq        -- <=
  | TokenGeq        -- >=
  | TokenIf0        -- if0
  | TokenIf         -- if
  | TokenFst        -- fst
  | TokenSnd        -- snd
  | TokenLet        -- let
  | TokenLetRec     -- letrec
  | TokenLetStar    -- let*
  | TokenHead       -- head
  | TokenTail       -- tail
  | TokenLambda     -- lambda
  | TokenCond       -- cond
  | TokenElse       -- else
  | TokenLI         -- [
  | TokenLD         -- ]
  | TokenComma      -- ,
  | TokenPA         -- (
  | TokenPC         -- )
  deriving (Show, Eq)
