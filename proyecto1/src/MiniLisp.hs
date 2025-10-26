module MiniLisp where

import Token
import ASA
import AST
import ASV
import Lexer
import Grammar
import Desugar
import Interprete
import Control.Exception (catch, SomeException)

--
saca :: ASV -> String
saca (NiV) = "[]"
saca (NumV n) = show n
saca (BoolV b)
  | b == True = "#t"
  | otherwise = "#f"
saca (Closure p c e) = "#<procedure>"
saca _ = "#<unknown>"


-- Punto de entrada principal
main :: IO ()
main =
  do
  putStrLn "Bienvenido a MiniLisp "
  putStrLn "Escriba (exit) para salir."
  minilisp


-- Bucle principal del intérprete
minilisp =
  do
    putStr "[MiniLisp]> "
    str <- getLine
    if str == ""
      then minilisp
      else if str == ":q"
           then putStrLn "Bye :)"
      else do
      ejecutar str
      minilisp

-- Envuelve la evaluación con manejo de errores
ejecutar :: String -> IO ()
ejecutar input =
  catch
    (do
      let tokens = lexer input
      let asa = parse tokens
      let ast = desugar asa
      let asv = eval (desugalues ast) []
      putStrLn (saca asv))
    handler

-- Manejador de errores
handler :: SomeException -> IO ()
handler e = putStrLn $ "[Error]: " ++ show e
