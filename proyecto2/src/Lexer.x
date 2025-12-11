{
module Lexer where

import Token
import Data.Char (isSpace)
}

%wrapper "basic"

-- Definiciones de patrones
$digit   = 0-9
$alpha   = [a-zA-Z]
$alnum   = [a-zA-Z0-9]

-- Usamos códigos hex para los espacios en blanco Unicode más comunes:
--   \x20 = ' ' (space), \x09 = tab, \x0A = LF, \x0D = CR, \x0C = FF, \x0B = VT
$white = [\x20\x09\x0A\x0D\x0C\x0B]


tokens :-

-- Ignoramos espacios y saltos de línea
$white+                       ;


\(                            { \_ -> TokenPA }
\)                            { \_ -> TokenPC }
\+                            { \_ -> TokenAdd }
\-                            { \_ -> TokenSub }
\*                            { \_ -> TokenMul }
\/                            { \_ -> TokenDiv }
\=                            { \_ -> TokenEq }
\<                            { \_ -> TokenLt }
\>                            { \_ -> TokenGt }
"!="                          { \_ -> TokenNeq }
"<="                          { \_ -> TokenLeq }
">="                          { \_ -> TokenGeq }
"not"                         { \_ -> TokenNot }
"if"                          { \_ -> TokenIf }
"let"                         { \_ -> TokenLet }
"lambda"                      { \_ -> TokenLambda }
"#t"                          { \_ -> TokenBool True }
"#f"                          { \_ -> TokenBool False }
"-"?$digit+                   { \s -> TokenNum (read s) }
$alpha ($alnum)*              { \s -> TokenVar s }

-- Catch-all para diagnosticar caracteres inesperados
.                     { \s -> error ("Lexical error: caracter no reconocido = "
                                    ++ show s
                                    ++ " | codepoints = "
                                    ++ show (map fromEnum s)) }

{
-- Normaliza cualquier espacios en blanco Unicode a ' ' para que $white+ lo consuma
normalizeSpaces :: String -> String
normalizeSpaces = map (\c -> if isSpace c then '\x20' else c)


lexer :: String -> [Token]
lexer = alexScanTokens . normalizeSpaces
}
