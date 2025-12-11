module StaticScope where

import ASV
import InterpAux
import Saca
import Debug.Trace (trace)

evalStatic :: ASV -> Env -> ASV
evalStatic asv env
  | isValue asv || isClosure asv = asv
  | otherwise =
    let (asv', env') = pasitoLex asv env
     in evalStatic asv' env'

pasitoLex :: ASV -> Env -> (ASV, Env)
pasitoLex (VarV i) env  = (lookupEnv i env, env)
pasitoLex (NumV n) env  = (NumV n, env)
pasitoLex (BoolV b) env = (BoolV b, env)
pasitoLex (AddV (NumV n) (NumV m)) env = (NumV (n + m), env)
pasitoLex (AddV (NumV n) d) env        = let (d', env') = pasitoLex d env
                                         in (AddV (NumV n) d', env')
pasitoLex (AddV i d) env               = let (i', env') = pasitoLex i env
                                         in (AddV i' d, env')
pasitoLex (SubV (NumV n) (NumV m)) env = (NumV (n - m), env)
pasitoLex (SubV (NumV n) d) env        = let (d', env') = pasitoLex d env
                                         in (SubV (NumV n) d', env')
pasitoLex (SubV i d) env               = let (i', env') = pasitoLex i env
                                         in (SubV i' d, env')
pasitoLex (MulV (NumV n) (NumV m)) env = (NumV (n * m), env)
pasitoLex (MulV (NumV n) d) env        = let (d', env') = pasitoLex d env
                                      in (MulV (NumV n) d', env')
pasitoLex (MulV i d) env               = let (i', env') = pasitoLex i env
                                      in (MulV i' d, env')
pasitoLex (DiV (NumV n) (NumV m)) env
  | m == 0 = error ("No se puede dividir entre 0")
  | otherwise = (NumV (div n m), env)
pasitoLex (DiV (NumV n) d) env = let (d', env') = pasitoLex d env
                               in (DiV (NumV n) d', env')
pasitoLex (DiV i d) env        = let (i', env') = pasitoLex i env
                               in (DiV i' d, env')
pasitoLex (NotV (BoolV b)) env = (BoolV (not b), env)
pasitoLex (NotV e) env         = let (e', env') = pasitoLex e env
                                 in (NotV e', env')
pasitoLex (EqualV (NumV n) (NumV m)) env   = (BoolV (n == m), env)
pasitoLex (EqualV (NumV n) d) env          = let (d', env') = pasitoLex d env
                                          in (EqualV (NumV n) d', env')
pasitoLex (EqualV i d) env                 = let (i', env') = pasitoLex i env
                                          in (EqualV i' d, env')
pasitoLex (LessV (NumV n) (NumV m)) env    = (BoolV (n < m), env)
pasitoLex (LessV (NumV n) d) env           = let (d', env') = pasitoLex d env
                                          in (LessV (NumV n) d', env')
pasitoLex (LessV i d) env                  = let (i', env') = pasitoLex i env
                                          in (LessV i' d, env')
pasitoLex (GreaterV (NumV n) (NumV m)) env = (BoolV (n > m), env)
pasitoLex (GreaterV (NumV n) d) env        = let (d', env') = pasitoLex d env
                                          in (GreaterV (NumV n) d', env')
pasitoLex (GreaterV i d) env               = let (i', env') = pasitoLex i env
                                          in (GreaterV i' d, env')
pasitoLex (DiffV (NumV n) (NumV m)) env    = (BoolV (n /= m), env)
pasitoLex (DiffV (NumV n) d) env           = let (d', env') = pasitoLex d env
                                          in (DiffV (NumV n) d', env')
pasitoLex (DiffV i d) env                  = let (i', env') = pasitoLex i env
                                          in (DiffV i' d, env')
pasitoLex (LeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasitoLex (LeqV (NumV n) d) env            = let (d', env') = pasitoLex d env
                                          in (LeqV (NumV n) d', env')
pasitoLex (LeqV i d) env                   = let (i', env') = pasitoLex i env
                                          in (LeqV i' d, env')
pasitoLex (GeqV (NumV n) (NumV m)) env     = (BoolV (n <= m), env)
pasitoLex (GeqV (NumV n) d) env            = let (d', env') = pasitoLex d env
                                          in (GeqV (NumV n) d', env')
pasitoLex (GeqV i d) env                   = let (i', env') = pasitoLex i env
                                          in (GeqV i' d, env')
pasitoLex (IfV (BoolV True) t e) env  = (t, env)
pasitoLex (IfV (BoolV False) t e) env = (e, env)
pasitoLex (IfV c t e) env             = let (c', env') = pasitoLex c env
                                     in (IfV c' t e, env')
pasitoLex (FunV p c) env =
  let msg = "[Closure]: λ" ++ p ++ ". captura el ambiente: { " 
            ++ showEnv env ++ " }"
  in trace msg (Closure p c env, env)
pasitoLex (AppV (Closure p c e) a) env
  | isValue a || isClosure a =
      let msg = "[Aplicación]: Asignando " ++ p ++ " = " ++ saca a
                ++ " en el ambiente capturado"
      in trace msg (c, (p, a) : e)
  | otherwise =
    let (a', env') = pasitoLex a env
    in (AppV (Closure p c e) a', env')
pasitoLex (AppV f a) env = let (f', env') = pasitoLex f env
                           in (AppV f' a, env')
