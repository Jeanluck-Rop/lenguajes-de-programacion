module MiniLisp where

import Token
import ASA
import ASV
import Lexer
import Grammar
import Desugar
import StaticScope
import DynamicScope
import InterpAux
import Control.Exception (catch, SomeException)
import Data.List (isPrefixOf)

-- Obtenemos el resultado como cadena para mostrarlo al usuario
saca :: ASV -> String
saca (NumV n) = show n
saca (BoolV b)
  | b == True = "#t"
  | otherwise = "#f"
saca (FunV p c) = "#<procedure>"
saca (Closure p c e) = "#<procedure>"

-- Punto de entrada principal
main :: IO ()
main =
  do
  putStrLn "\nBienvenido a MiniLisp. "
  putStrLn "Escriba (exit) para salir."
  minilisp

-- Ciclo principal del interprete
minilisp =
  do
    putStr "[MiniLisp]> "
    str <- getLine
    if str == ""
      then minilisp
      else if str == ":q" || str == "(exit)"
           then putStrLn "Bye :)"
      else do
      run str
      minilisp

-- Envuelve la evaluacion con manejo de errores
run :: String -> IO ()
run input = catch (validate input) errors

-- Validamos el prefijo (static/dynamic/both) y evalua la expresion correspondiente
validate :: String -> IO ()
validate input
  | "staticScope" `isPrefixOf` input = let expr = quitPrefix "staticScope" input
                                       in evalMode True False expr
  | "dynamicScope" `isPrefixOf` input = let expr = quitPrefix "dynamicScope" input
                                        in evalMode False True expr
  | "bothScope" `isPrefixOf` input = let expr = quitPrefix "bothScope" input
                                     in evalMode True True expr
  | otherwise = do
      putStrLn "Por favor indique el tipo de alcance:"
      putStrLn "staticScope <expr>"
      putStrLn "dynamicScope <expr>"
      putStrLn "bothScope <expr>"

-- Evaluamos la expresion usando alcance estatico/dinamico Bool1 para static Bool2 para dynamic
evalMode :: Bool -> Bool -> String -> IO ()
evalMode static dynamic expr = do
  let tokens = lexer expr
  let asa    = parse tokens
  let asv   = desugar asa
  if static
    then do
    let res = evalStatic asv []
    putStr "\n[Alcance Estático]: "
    putStrLn (saca res)
    else return ()
  if dynamic
    then do
    let res = evalDynamic asv []
    putStr "\n[Alcance Dinámico]: "
    putStrLn (saca res)
    else return ()
  putStrLn ""

-- Eliminamos el prefijo (staticScope/dynamicScope/bothScope) y espacios extra
quitPrefix :: String -> String -> String
quitPrefix pref str = dropWhile (== ' ') (drop (length pref) str)

-- Manejador de errores
errors :: SomeException -> IO ()
errors e = putStrLn $ "[Error]: " ++ show e
