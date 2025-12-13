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
import Saca
import Control.Exception (catch, SomeException)
import Data.List (isPrefixOf)


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

-- Validamos el prefijo (static/dynamic/compare) y evalua la expresion correspondiente
validate :: String -> IO ()
validate input
  | "staticScope" `isPrefixOf` input = let expr = quitPrefix "staticScope" input
                                       in evalMode True False expr
  | "dynamicScope" `isPrefixOf` input = let expr = quitPrefix "dynamicScope" input
                                        in evalMode False True expr
  | "compareScopes" `isPrefixOf` input = let expr = quitPrefix "compareScopes" input
                                         in evalMode True True expr
  | otherwise = do
      putStrLn "Por favor indique el tipo de alcance:"
      putStrLn "staticScope <expr>"
      putStrLn "dynamicScope <expr>"
      putStrLn "compareScopes <expr>"

-- Evaluamos la expresion usando alcance estatico/dinamico Bool1 para static Bool2 para dynamic
evalMode :: Bool -> Bool -> String -> IO ()
evalMode static dynamic expr = do
  let tokens = lexer expr
  let asa    = parse tokens
  let asv   = desugar asa
  if static
    then do
    let res = evalStatic asv []
    putStrLn "\n===== Alcance Estático ====="
    putStrLn (saca res)
    else return ()
  if dynamic
    then do
    let res = evalDynamic asv []
    putStrLn "\n===== Alcance Dinámico ====="
    putStrLn (saca res)
    else return ()
  putStrLn ""

-- Eliminamos el prefijo (staticScope/dynamicScope/bothScope) y espacios extra
quitPrefix :: String -> String -> String
quitPrefix pref str = dropWhile (== ' ') (drop (length pref) str)

-- Manejador de errores
errors :: SomeException -> IO ()
errors e = putStrLn $ "[Error]: " ++ show e
