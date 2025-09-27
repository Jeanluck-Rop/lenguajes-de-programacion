module ASA where

-- Definir los tipos básicos
type Var = String
type Int = Int

-- Constantes booleanas
data Bool
  = BTrue -- #t
  | BFalse -- #f
  deriving (Show, Eq)

-- Sintaxis abstracta
data Expr
-- Marque con E los constructores para que no se mezclen con otros constructores pero se puede quitar
  = EVar Var
  | EInt Int
  | EBool Bool
  | EAdd Expr Expr
  | ESub Expr EXpr
  | ENot Expr
  | ELet Var Expr Expr
  | ELetrec Var Expr Expr
  | EIf0 Expr Expr Expr
  | ELambda Var Expr
  | EApp Expr Expr
  deriving (Show, Eq)  


-- Correccion echa por manolito

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


--- ASA con azucar (ASA)
data ASA
  = Var String              -- variable
  | Num Int                 -- enteros
  | Bool Bool               -- booleanos
  | Add ASA [ASA]           -- suma variádica
  | Sub ASA [ASA]           -- resta variádica
  | Mul ASA [ASA]           -- multiplicación variádica
  | Div ASA [ASA]           -- división variádica
  | Not ASA                 -- negación
  | Let (Var ASA) ASA       -- let paralelo
  | LetRec (Var ASA) ASA    -- letrec
  | LetStar (Var ASA) ASA   -- let* secuencial
  | If0 ASA ASA ASA         -- if0
  | If ASA ASA ASA          -- if booleano
  | Lambda (Var) ASA        -- funciones anónimas (variádicas)
  | App ASA ASA             -- aplicación: (f x y z)
  | Add1 ASA                -- incremento
  | Sub1 ASA                -- decremento
  | Sqrt ASA                -- raíz cuadrada
  | Expt ASA ASA            -- potencia
  | Equal ASA [ASA]         -- igualdad variádica
  | Greater ASA [ASA]       -- mayor que (variádica)
  | Less ASA [ASA]          -- menor que (variádica)
  | GEqual ASA [ASA]        -- >=
  | LEqual ASA [ASA]        -- <=
  | Diff ASA [ASA]          -- !=
  | Pair ASA ASA            -- pares ordenados
  | Fst ASA                 -- proyección 1
  | Snd ASA                 -- proyección 2
  | List [ASA]              -- listas [1,2,3]
  | Head ASA                -- cabeza
  | Tail ASA                -- cola
  | Cond [ASA] ASA          -- cond [(cond, expr), ..., (else, expr)]
  deriving (Show, Eq)


--Desazucaramos

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
