module Funciones where

--Generamos la funcion factorial con letrec
fact :: Int -> String
fact n = "(letrec (fact (lambda (n) (if0 n 1 (* n (fact (- n 1)))))) (fact " ++ show n ++ "))"

--Generamos la suma de los primeros n números con letrec
sumSum :: Int -> String
sumSum n = "(letrec (sum (lambda (n) (if0 n 0 (+ n (sum (- n 1)))))) (sum " ++ show n ++ "))"

--Generamos el n-esimo numero de Fibonacci con letrec
fibo :: Int -> String
fibo n = "(letrec (fib (lambda (n) (if0 n 0 (if0 (- n 1) 1 (+ (fib (- n 1)) (fib (- n 2))))))) (fib " ++ show n ++ "))"
