module EvalStrict where

import AST
import ASV
import Interprete

{-- Funcion de evaluacion perezosa --}
{--
Evaluamos una expresion usando strict para evaluar los puntos estrictos forzosamente.
--}
evalS :: AST -> Env -> ASV
--Valores
evalS (VarC i) env = mirarriba i env
evalS (NumC n) _   = (NumV n)
evalS (BoolC b) _  = (BoolV b)
evalS NiL _        = NiV
--Operadores aritmeticos
evalS (AddC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in NumV (numN i' + numN d')
evalS (SubC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in NumV (numN i' - numN d')
evalS (MulC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in NumV (numN i' * numN d')
evalS (DivC i d) env =
  let n = numN (strict (evalS i env))
      m = numN (strict (evalS d env))
   in if m == 0
        then error "No se puede dividir entre 0"
        else NumV (div n m)
evalS (SqrtC n) env =
  let n' = numN (strict (evalS n env))
   in if n' < 0
        then error "No se puede obtener la raíz de un número negativo"
        else NumV (integerSquareRoot n')
--Not
evalS (NotC e) env =
  let e' = strict (evalS e env)
   in BoolV (not (boolN e'))
--Comparadores
evalS (EqualC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' == numN d')
evalS (LessC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' < numN d')
evalS (GreaterC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' > numN d')
evalS (DiffC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' /= numN d')
evalS (LeqC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' <= numN d')
evalS (GeqC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in BoolV (numN i' >= numN d')
--Pares
evalS (PairC i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in PairV i' d'
evalS (FstC p) env =
  case strict (evalS p env) of
    PairV f _ -> f
    _         -> error "Fst espera un par"
evalS (SndC p) env =
  case strict (evalS p env) of
    PairV _ s -> s
    _         -> error "Snd espera un par"
--Cons
evalS (ConS i d) env =
  let i' = strict (evalS i env)
      d' = strict (evalS d env)
   in ConV i' d'
evalS (HeadC p) env =
  case strict (evalS p env) of
    ConV h _ -> h
    _        -> error "Head espera una lista"
evalS (TailC p) env =
  case strict (evalS p env) of
    ConV _ t ->
      let t' = strict t
       in if not (isConV t')
          then t'
          else tailDeep t'
    _        -> error "Tail espera una lista"
--If
evalS (IfC c t e) env =
  let cond = boolN (strict (evalS c env))
   in if cond then evalS t env else evalS e env
--Funciones
evalS (FunC p c) env = ClosureF p c env
--Aplicacion de funciones
evalS (AppC f a) env =
  let f' = evalS f env
      funV = strict f'
   in evalS (closureC funV) (((closureP funV), ExprV a env) : (closureE funV))


{-- Funcion strict para forzar la evaluacion de los puntos estrictos --}
strict :: ASV -> ASV
strict (NumV n) = NumV n
strict (BoolV b) = BoolV b
strict (PairV f s) = PairV (strict f) (strict s)
strict (ConV i d) = ConV (strict i) (strict d)
strict (ExprV a e) = strict (evalS a e)
strict (NiV) = NiV
strict (ClosureF p c e) = ClosureF p c e


{-- Funcion auxiliar para devolver el numero de NumV--}
numN :: ASV -> Int
numN (NumV n) = n


{-- Funcion auxiliar para devolver el booleano de BoolV --}
boolN :: ASV -> Bool
boolN (BoolV b) = b
boolN _ = False


{-- Funcion auxiliar para devoler el parametro de la cerradura --}
closureP :: ASV -> String
closureP (ClosureF p _ _) = p


{-- Funcion auxiliar para devoler el cuerpo de la cerradura --}
closureC :: ASV -> AST
closureC (ClosureF _ c _) = c


{-- Funcion auxiliar para devoler el ambiente de la cerradura --}
closureE :: ASV -> Env
closureE (ClosureF _ _ e) = e


{-- Funcion auxiliar para encontrar el ultimo elemento canonico de los ConV anidados--}
tailDeep :: ASV -> ASV
tailDeep (ConV _ rest) =
  let rest' = strict rest
  in if not (isConV rest')
     then rest'
     else tailDeep rest'
tailDeep v = v
