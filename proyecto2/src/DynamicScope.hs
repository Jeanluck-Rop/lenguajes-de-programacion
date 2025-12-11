module DynamicScope where

import ASV
import InterpAux
import Saca
import Debug.Trace (trace)

evalDynamic :: ASV -> Env -> ASV
evalDynamic asv env
  | isValue asv || isFunV asv = asv
  | otherwise =
      let (asv', env') = pasitoDyn asv env
      in evalDynamic asv' env'

pasitoDyn :: ASV -> Env -> (ASV, Env)
pasitoDyn (VarV i) env  = (lookupEnv i env, env)
pasitoDyn (NumV n) env  = (NumV n, env)
pasitoDyn (BoolV b) env = (BoolV b, env)
pasitoDyn (AddV (NumV n) (NumV m)) env = (NumV (n + m), env)
pasitoDyn (AddV (NumV n) d) env        = let (d', env') = pasitoDyn d env
                                         in (AddV (NumV n) d', env')
pasitoDyn (AddV i d) env               = let (i', env') = pasitoDyn i env
                                         in (AddV i' d, env')
pasitoDyn (SubV (NumV n) (NumV m)) env = (NumV (n - m), env)
pasitoDyn (SubV (NumV n) d) env        = let (d', env') = pasitoDyn d env
                                         in (SubV (NumV n) d', env')
pasitoDyn (SubV i d) env               = let (i', env') = pasitoDyn i env
                                         in (SubV i' d, env')
pasitoDyn (MulV (NumV n) (NumV m)) env = (NumV (n * m), env)
pasitoDyn (MulV (NumV n) d) env        = let (d', env') = pasitoDyn d env
                                      in (MulV (NumV n) d', env')
pasitoDyn (MulV i d) env               = let (i', env') = pasitoDyn i env
                                      in (MulV i' d, env')
pasitoDyn (DiV (NumV n) (NumV m)) env
  | m == 0 = error ("No se puede dividir entre 0")
  | otherwise = (NumV (div n m), env)
pasitoDyn (DiV (NumV n) d) env = let (d', env') = pasitoDyn d env
                               in (DiV (NumV n) d', env')
pasitoDyn (DiV i d) env        = let (i', env') = pasitoDyn i env
                               in (DiV i' d, env')
pasitoDyn (NotV (BoolV b)) env = (BoolV (not b), env)
pasitoDyn (NotV e) env         = let (e', env') = pasitoDyn e env
                                 in (NotV e', env')
pasitoDyn (EqualV (NumV n) (NumV m)) env   = (BoolV (n == m), env)
pasitoDyn (EqualV (NumV n) d) env          = let (d', env') = pasitoDyn d env
                                          in (EqualV (NumV n) d', env')
pasitoDyn (EqualV i d) env                 = let (i', env') = pasitoDyn i env
                                          in (EqualV i' d, env')
pasitoDyn (LessV (NumV n) (NumV m)) env    = (BoolV (n < m), env)
pasitoDyn (LessV (NumV n) d) env           = let (d', env') = pasitoDyn d env
                                          in (LessV (NumV n) d', env')
pasitoDyn (LessV i d) env                  = let (i', env') = pasitoDyn i env
                                          in (LessV i' d, env')
pasitoDyn (GreaterV (NumV n) (NumV m)) env = (BoolV (n > m), env)
pasitoDyn (GreaterV (NumV n) d) env        = let (d', env') = pasitoDyn d env
                                          in (GreaterV (NumV n) d', env')
pasitoDyn (GreaterV i d) env               = let (i', env') = pasitoDyn i env
                                          in (GreaterV i' d, env')
pasitoDyn (DiffV (NumV n) (NumV m)) env    = (BoolV (n /= m), env)
pasitoDyn (DiffV (NumV n) d) env           = let (d', env') = pasitoDyn d env
                                          in (DiffV (NumV n) d', env')
pasitoDyn (DiffV i d) env                  = let (i', env') = pasitoDyn i env
                                          in (DiffV i' d, env')
pasitoDyn (LeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasitoDyn (LeqV (NumV n) d) env            = let (d', env') = pasitoDyn d env
                                          in (LeqV (NumV n) d', env')
pasitoDyn (LeqV i d) env                   = let (i', env') = pasitoDyn i env
                                          in (LeqV i' d, env')
pasitoDyn (GeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasitoDyn (GeqV (NumV n) d) env            = let (d', env') = pasitoDyn d env
                                          in (GeqV (NumV n) d', env')
pasitoDyn (GeqV i d) env                   = let (i', env') = pasitoDyn i env
                                          in (GeqV i' d, env')
pasitoDyn (IfV (BoolV True) t e) env  = (t, env)
pasitoDyn (IfV (BoolV False) t e) env = (e, env)
pasitoDyn (IfV c t e) env             = let (c', env') = pasitoDyn c env
                                     in (IfV c' t e, env')
pasitoDyn (FunV p c) env = (FunV p c, env)
pasitoDyn (AppV (FunV p c) a) env
  | isValue a || isFunV a =
      trace ("[Aplicación]: Asignando " ++ p ++ " = " ++ saca a ++ " en el ambiente") (c, (p, a) : env)
  | otherwise =
    let (a', env') = pasitoDyn a env
    in (AppV (FunV p c) a', env')
pasitoDyn (AppV f a) env = let (f', env') = pasitoDyn f env
                           in (AppV f' a, env')
