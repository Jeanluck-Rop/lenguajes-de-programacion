module Token where

-- Tokens para el Parser
data Token
  -- Literales
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  -- Operadores aritmeticos
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
  | TokenLt      -- <
  | TokenGt      -- >
  | TokenNeq     -- !=
  | TokenLeq     -- <=
  | TokenGeq     -- >=
  -- Pares
  | TokenFirst   -- fst
  | TokenSecond  -- snd
  -- Listas
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
  -- Funciones y aplicacion
  | TokenLambda  -- lambda
  | TokenApp     -- app
  -- Corchetes y Parentesis
  | TokenLI      -- [
  | TokenLD      -- ]
  | TokenComma   -- ,
  | TokenPA      -- (
  | TokenPC      -- )
  deriving (Show, Eq)
