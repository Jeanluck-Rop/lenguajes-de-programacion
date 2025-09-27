module Token where

-- Tokens para el Parser
data Token
  -- Literales
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  -- Operadores aritméticos
  | TokenAdd     -- +
  | TokenSub     -- -
  | TokenMul     -- *
  | TokenDiv     -- /
  | TokenAdd1    -- add1
  | TokenSub1    -- sub1
  | TokenSqrt    -- sqrt
  | TokenExpt    -- expt
  -- Operadores booleanos / comparaciones
  | TokenNot     -- not
  | TokenEq      -- =
  | TokenNeq     -- !=
  | TokenLt      -- <
  | TokenGt      -- >
  | TokenLeq     -- <=
  | TokenGeq     -- >=
  -- Pares
  | TokenPair    -- pair
  | TokenFst     -- fst
  | TokenSnd     -- snd
  -- Corchetes y listas
  | TokenLI      -- [
  | TokenLD      -- ]
  | TokenComma   -- ,
  | TokenHead    -- head
  | TokenTail    -- tail
  -- Lets
  | TokenLet     -- let
  | TokenLetRec  -- letrec
  | TokenLetStar -- let*
  -- Condicionales
  | TokenIf0     -- if0
  | TokenIf      -- if
  | TokenCond    -- cond
  | TokenElse    -- else
  -- Funciones y aplicación
  | TokenLambda  -- lambda
  | TokenApp     -- app
    -- Paréntesis
  | TokenPA      -- (
  | TokenPC      -- )
  deriving (Show, Eq)
