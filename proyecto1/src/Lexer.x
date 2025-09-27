{
module Lexer where
import Tokens
}

%wrapper "basic"

-- Definiciones de patrones
$digit   = 0-9
$alpha   = [a-zA-Z]
$alnum   = [a-zA-Z0-9]

tokens :-

-- Espacios y saltos de línea (se ignoran)
$white+                       ;

-- Paréntesis y corchetes
"("                            { \_ -> TokenPA }
")"                            { \_ -> TokenPC }
"["                            { \_ -> TokenLI }
"]"                            { \_ -> TokenLD }
","                            { \_ -> TokenComma }

-- Operadores aritméticos
"+"                            { \_ -> TokenAdd }
"-"                            { \_ -> TokenSub }
"*"                            { \_ -> TokenMul }
"/"                            { \_ -> TokenDiv }
"add1"                         { \_ -> TokenAdd1 }
"sub1"                         { \_ -> TokenSub1 }
"sqrt"                         { \_ -> TokenSqrt }
"expt"                         { \_ -> TokenExpt }

-- Comparaciones y booleanos
"="                            { \_ -> TokenEq }
"!="                           { \_ -> TokenNeq }
"<="                           { \_ -> TokenLeq }
">="                           { \_ -> TokenGeq }
"<"                            { \_ -> TokenLt }
">"                            { \_ -> TokenGt }
"not"                          { \_ -> TokenNot }
"true"                         { \_ -> TokenBool True }
"false"                        { \_ -> TokenBool False }

-- Palabras clave
"let"                          { \_ -> TokenLet }
"letrec"                       { \_ -> TokenLetRec }
"let*"                         { \_ -> TokenLetStar }
"if0"                          { \_ -> TokenIf0 }
"if"                           { \_ -> TokenIf }
"cond"                         { \_ -> TokenCond }
"else"                         { \_ -> TokenElse }
"lambda"                       { \_ -> TokenLambda }

-- Pares y listas
"pair"                         { \_ -> TokenPair }
"fst"                          { \_ -> TokenFst }
"snd"                          { \_ -> TokenSnd }
"head"                         { \_ -> TokenHead }
"tail"                         { \_ -> TokenTail }

-- Literales
$digit+                        { \s -> TokenNum (read s) }
$alpha $alnum*                 { \s -> TokenVar s }
{
lexer :: String -> [Token]
lexer = alexScanTokens
}

