module Interprete where

import ASV

type Env = [(String, ASV)]

{-- --}
eval :: ASV -> Env -> ASV
eval asv env
  | isValue asv = asv
  | otherwise =
    let (asv', env') = pasito asv env
     in eval asv' env'

        
{-- --}
isValue :: ASV -> Bool
isValue (NumV _) = True
isValue (BoolV _) = True
isValue (Closure _ _ _) = True
isValue (NiV) = True
isValue _ = False


{-- --}
pasito :: ASV -> Env -> (ASV, Env)
--Valores
pasito (VarV i) env  = (mirarriba i env, env)
pasito (NumV n) env  = (NumV n, env)
pasito (BoolV b) env = (BoolV b, env)
pasito (NiV) env     = (NiV, env)
-- Operadores
pasito (AddV (NumV n) (NumV m)) env = (NumV (n + m), env)
pasito (AddV (NumV n) d) env        = let (d', env') = pasito d env
                                      in (AddV (NumV n) d', env')
pasito (AddV i d) env               = let (i', env') = pasito i env
                                      in (AddV i' d, env')
pasito (SubV (NumV n) (NumV m)) env = (NumV (n - m), env)
pasito (SubV (NumV n) d) env        = let (d', env') = pasito d env
                                      in (SubV (NumV n) d', env')
pasito (SubV i d) env               = let (i', env') = pasito i env
                                      in (SubV i' d, env')
pasito (MulV (NumV n) (NumV m)) env = (NumV (n * m), env)
pasito (MulV (NumV n) d) env        = let (d', env') = pasito d env
                                      in (MulV (NumV n) d', env')
pasito (MulV i d) env               = let (i', env') = pasito i env
                                      in (MulV i' d, env')
pasito (DiV (NumV n) (NumV m)) env
  | m == 0 = error ("No se puede dividir entre 0")
  | otherwise = (NumV (div n m), env)
pasito (DiV (NumV n) d) env = let (d', env') = pasito d env
                               in (DiV (NumV n) d', env')
pasito (DiV i d) env        = let (i', env') = pasito i env
                               in (DiV i' d, env')
pasito (SqrtV (NumV n)) env  = (NumV (integerSquareRoot n), env)
pasito (SqrtV n) env         = let (n', env') = pasito n env
                               in (SqrtV n', env')
pasito (ExptV (NumV n)) env  = (NumV (n * n), env)
pasito (ExptV n) env         = let (n', env') = pasito n env
                               in (ExptV n', env')
--Not
pasito (NotV (BoolV b)) env = (BoolV (not b), env)
pasito (NotV e) env         = let (e', env') = pasito e env
                              in (NotV e', env')
--Comparadores
pasito (EqualV (NumV n) (NumV m)) env   = (BoolV (n == m), env)
pasito (EqualV (NumV n) d) env          = let (d', env') = pasito d env
                                          in (EqualV (NumV n) d', env')
pasito (EqualV i d) env                 = let (i', env') = pasito i env
                                          in (EqualV i' d, env')
pasito (LessV (NumV n) (NumV m)) env    = (BoolV (n < m), env)
pasito (LessV (NumV n) d) env           = let (d', env') = pasito d env
                                          in (LessV (NumV n) d', env')
pasito (LessV i d) env                  = let (i', env') = pasito i env
                                          in (LessV i' d, env')
pasito (GreaterV (NumV n) (NumV m)) env = (BoolV (n > m), env)
pasito (GreaterV (NumV n) d) env        = let (d', env') = pasito d env
                                          in (GreaterV (NumV n) d', env')
pasito (GreaterV i d) env               = let (i', env') = pasito i env
                                          in (GreaterV i' d, env')
pasito (DiffV (NumV n) (NumV m)) env    = (BoolV (n /= m), env)
pasito (DiffV (NumV n) d) env           = let (d', env') = pasito d env
                                          in (DiffV (NumV n) d', env')
pasito (DiffV i d) env                  = let (i', env') = pasito i env
                                          in (DiffV i' d, env')
pasito (LeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasito (LeqV (NumV n) d) env            = let (d', env') = pasito d env
                                          in (LeqV (NumV n) d', env')
pasito (LeqV i d) env                   = let (i', env') = pasito i env
                                          in (LeqV i' d, env')
pasito (GeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasito (GeqV (NumV n) d) env            = let (d', env') = pasito d env
                                          in (GeqV (NumV n) d', env')
pasito (GeqV i d) env                   = let (i', env') = pasito i env
                                          in (GeqV i' d, env')

---
--Pares
pasito (PairV f s) env
  | isValue f && isValue s = (PairV f s, env)
pasito (PairV f s) env
  | isValue f = let (s', env') = pasito s env
                in (PairV f s', env')
pasito (PairV f s) env = let (f', env') = pasito f env
                         in (PairV f' s, env')
pasito (FstV (PairV f s)) env
  | isValue f && isValue s = (f, env)
pasito (FstV p) env = let (p', env') = pasito p env
                      in (FstV p', env')
pasito (SndV (PairV f s)) env
  | isValue f && isValue s = (s, env)
pasito (SndV p) env = let (p', env') = pasito p env
                      in (SndV p', env')
---

--If
pasito (IfV (BoolV True) t e) env  = (t, env)
pasito (IfV (BoolV False) t e) env = (e, env)
pasito (IfV c t e) env             = let (c', env') = pasito c env
                                     in (IfV c' t e, env')
--Funciones
pasito (FunV p c) env = (Closure p c env, env)
--Aplicacion de funciones
pasito (AppV (Closure p c env') a) env
  | isValue a = (c, (p, a):env')
  | otherwise =
    let (a', env'') = pasito a env
    in (AppV (Closure p c env') a', env'')  
pasito (AppV f a) env = let (f', env') = pasito f env
                        in (AppV f' a, env')


{-- --}
mirarriba :: String -> Env -> ASV
mirarriba i [] = error ("Var '" ++ i ++ "' no definida")
mirarriba i ((j, v):e)
  | i == j = v
  | otherwise = mirarriba i e



{-- --}
--numN :: ASV -> Int
--numN (NumV n) = n

--boolN :: ASV -> Bool
--boolN (BoolV b) = b
--boolN _ = False

--closureP :: ASV -> String
--closureP (Closure p _ _) = p

--closureC :: ASV -> ASV
--closureC (Closure _ c _) = c

--closureE :: ASV -> Env
--closureE (Closure _ _ e) = e


{-- --}
integerSquareRoot :: Int -> Int
integerSquareRoot n = floor (sqrt (fromIntegral n :: Double))
