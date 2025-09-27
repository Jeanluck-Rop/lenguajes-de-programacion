module Lexer where

import Token
import Data.Char


-- Función principal del lexer
lexer :: String -> [Token]
lexer [] = []
lexer (' ':xs) = lexer xs -- Ignorar espacios en blanco
lexer ('\n':xs) = lexer xs -- Ignorar saltos de línea
lexer ('\t':xs) = lexer xs -- Ignorar tabulaciones
lexer ('(':xs) = TokenPA : lexer xs
lexer (')':xs) = TokenPC : lexer xs
lexer ('+':xs) = TokenAdd : lexer xs
lexer ('-':xs) = TokenSub : lexer xs
lexer s@(c:_)
  | isDigit c = let (numStr, rest) = span isDigit s
                in TokenNum (read numStr) : lexer rest
  | isAlpha c = let (varStr, rest) = span isAlphaNum s
                in case varStr of
                     "add1" -> TokenAdd1 : lexer rest
                     "if"   -> TokenIf : lexer rest
                     _      -> TokenVar varStr : lexer rest
  | otherwise = error ("Carácter inesperado: " ++ [c])
