module Token where

-- Tokens para el Parser
data Token
  -- Literales
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool

  -- Paréntesis
  | TokenPA       -- (
  | TokenPC       -- )

  -- Corchetes y listas
  | TokenLI       -- [
  | TokenLD       -- ]
  | TokenComma    -- ,

  -- Operadores aritméticos
  | TokenAdd      -- +
  | TokenSub      -- -
  | TokenMul      -- *
  | TokenDiv      -- /
  | TokenAdd1     -- add1
  | TokenSub1     -- sub1
  | TokenSqrt     -- sqrt
  | TokenExpt     -- expt

  -- Operadores booleanos / comparaciones
  | TokenNot      -- not
  | TokenEq       -- =
  | TokenNeq      -- !=
  | TokenLt       -- <
  | TokenGt       -- >
  | TokenLeq      -- <=
  | TokenGeq      -- >=

  -- Palabras clave de control
  | TokenLet      -- let
  | TokenLetRec   -- letrec
  | TokenLetStar  -- let*
  | TokenIf0      -- if0
  | TokenIf       -- if
  | TokenCond     -- cond
  | TokenElse     -- else

  -- Funciones y aplicación
  | TokenLambda   -- lambda
  -- | TokenApp      -- app (opcional)

  -- Pares y listas
  | TokenPair     -- pair
  | TokenFst      -- fst
  | TokenSnd      -- snd
  | TokenHead     -- head
  | TokenTail     -- tail

  deriving (Show, Eq)
