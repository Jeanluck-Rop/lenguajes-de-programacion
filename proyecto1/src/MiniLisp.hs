module MiniLisp where

import Token
import ASA
import AST
import ASV
import Lexer
import Grammar
import Desugar
import Interprete
import EvalStrict
import Saca
import Funciones
import Control.Exception (catch, SomeException)
import Data.List (isPrefixOf)

-- Combinador Z
combZ :: String
combZ = "(lambda (f) ((lambda (x) (f (lambda (v) ((x x) v)))) (lambda (x) (f (lambda (v) ((x x) v))))))"


-- Evaluamos el combinador Z
z :: ASV
--z = eval (toFinalState $ desugar $ parse $ lexer combZ) []
z = evalS (desugar $ parse $ lexer combZ) []


-- Punto de entrada principal
main :: IO ()
main =
  do
  putStrLn "\nBienvenido a MiniLisp. "
  putStrLn "Escriba (exit) para salir."
  minilisp


-- Bucle principal del interprete
minilisp =
  do
    putStr "[MiniLisp]> "
    str <- getLine
    if str == ""
      then minilisp
      else if str == ":q"
           then putStrLn "Bye :)"
      else do
      run str
      minilisp


-- Envuelve la evaluacion con manejo de errores
run :: String -> IO ()
run input =
  catch
    (do
        expr <-
          if "fact" `isPrefixOf` input
          then return $ fact (read (last (words input)))
          else if "sum" `isPrefixOf` input
               then return $ sumSum (read (last (words input)))
          else if "fibo" `isPrefixOf` input
               then return $ fibo (read (last (words input)))
          else return input 
      
        let tokens = lexer expr
        let asa = parse tokens
        let ast = desugar asa
        --let asv = eval (toFinalState ast) []
        --let asv = eval (toFinalState ast) [("Z", z)]
        let asv = evalS (ast) [("Z", z)]
        putStrLn (saca asv))
    errors


-- Manejador de errores
errors :: SomeException -> IO ()
errors e = putStrLn $ "[Error]: " ++ show e
