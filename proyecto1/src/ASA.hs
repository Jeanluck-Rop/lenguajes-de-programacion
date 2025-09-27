module ASA where

--- ASA con azucar (ASA)
data ASA
  = Var String                  -- variable
  | Num Int                     -- enteros
  | Boolean Bool                -- booleanos
  | Add [ASA]                   -- suma
  | Sub [ASA]                   -- resta
  | Mul [ASA]                   -- multiplicación
  | Div [ASA]                   -- división
  | Not ASA                     -- negación
  | Let [(Var, ASA)] ASA        -- let paralelo
  | LetRec [(Var, ASA)] ASA     -- letrec
  | LetStar [(Var, ASA)] ASA    -- let* secuencial
  | If0 ASA ASA ASA             -- if0
  | If ASA ASA ASA              -- if booleano
  | Lambda [Var] ASA            -- funcion anónima
  | App ASA ASA                 -- aplicación
  | Add1 ASA                    -- incremento
  | Sub1 ASA                    -- decremento
  | Sqrt ASA                    -- raíz cuadrada
  | Expt ASA                    -- potencia
  | Equal [ASA]                 -- igualdad
  | Less [ASA]                  -- <
  | Greater [ASA]               -- >
  | LEqual [ASA]                -- <=
  | GEqual [ASA]                -- >=
  | Diff [ASA]                  -- !=
  | Pair ASA ASA                -- pares ordenados
  | Fst ASA                     -- primero
  | Snd ASA                     -- segundo
  | List [ASA]                  -- listas
  | Head ASA                    -- cabeza
  | Tail ASA                    -- cola
  | Cond [(ASA, ASA)] Maybe ASA -- cond [(cond, expr), ..., (else, expr)]
  deriving (Show, Eq)
