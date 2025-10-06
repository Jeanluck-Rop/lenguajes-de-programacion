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
  | Add1 ASA                    -- incremento
  | Sub1 ASA                    -- decremento
  | Sqrt ASA                    -- raíz cuadrada
  | Expt ASA                    -- potencia
  | Not ASA                     -- negación
  | Equal [ASA]                 -- igualdad
  | Less [ASA]                  -- <
  | Greater [ASA]               -- >
  | Diff [ASA]                  -- !=
  | Leq [ASA]                   -- <=
  | Geq [ASA]                   -- >=
  | Pair ASA ASA                -- pares ordenados
  | Fst ASA                     -- primero
  | Snd ASA                     -- segundo
  | Let [(String, ASA)] ASA     -- let paralelo
  | LetRec [(String, ASA)] ASA  -- letrec
  | LetStar [(String, ASA)] ASA -- let* secuencial
  | If0 ASA ASA ASA             -- if0
  | If ASA ASA ASA              -- if booleano
  | Lambda [String] ASA         -- funcion anónima
  | App ASA [ASA]               -- aplicación
  | List [ASA]                  -- listas
  | Head ASA                    -- cabeza
  | Tail ASA                    -- cola
  | Cond [(ASA, ASA)] ASA -- cond [(cond, expr) (else, expr)]
  deriving (Show, Eq)
