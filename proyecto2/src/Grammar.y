{
module Grammar where

import Lexer
import Token
import ASA
}

%name parse
%tokentype { Token }
%error { parseError }
  
%token
  var             { TokenVar $$ }
  num             { TokenNum $$ }
  boolean         { TokenBool $$ }
  '('             { TokenPA }
  ')'             { TokenPC }
  '+'             { TokenAdd }
  '-'             { TokenSub }
  '*'             { TokenMul }
  '/'             { TokenDiv }
  '='             { TokenEq }
  '<'             { TokenLt }
  '>'             { TokenGt }
  "!="            { TokenNeq }
  "<="            { TokenLeq }
  ">="            { TokenGeq }
  "not"           { TokenNot }
  "if"            { TokenIf }
  "let"           { TokenLet }
  "lambda"        { TokenLambda }
  "else"          { TokenElse }
    
%%
  
ASA
  : var                                                 { Var $1 }
  | num                                                 { Num $1 }
  | boolean                                             { Boolean $1 }
  | '(' '+' opArgs ')'                                  { Add (reverse $3) }
  | '(' '-' opArgs ')'                                  { Sub (reverse $3) }
  | '(' '*' opArgs ')'                                  { Mul (reverse $3) }
  | '(' '/' opArgs ')'                                  { Div (reverse $3) }
  | '(' '=' opArgs ')'                                  { Equal (reverse $3) }
  | '(' '<' opArgs ')'                                  { Less (reverse $3) }
  | '(' '>' opArgs ')'                                  { Greater (reverse $3) }
  | '(' "!=" opArgs ')'                                 { Diff (reverse $3) }
  | '(' "<=" opArgs ')'                                 { Leq (reverse $3) }
  | '(' ">=" opArgs ')'                                 { Geq (reverse $3) }
  | '(' "not" ASA ')'                                   { Not $3 }
  | '(' "if" ASA ASA ASA ')'                            { If $3 $4 $5 }
  | '(' "let" '(' var ASA ')' ASA ')'                   { Let $4 $5 $7 }
  | '(' "lambda" '(' vars ')' ASA ')'                   { Lambda (reverse $4) $6 }
  | '(' ASA appArgs ')'                                 { App $2 (reverse $3) }


opArgs
  : ASA ASA                               { [$2, $1] }
  | opArgs ASA                            { $2 : $1 }

vars
  : var                                   { [$1] }
  | vars var                              { $2 : $1 }
  
appArgs
  : ASA                                   { [$1] }
  | appArgs ASA                           { $2 : $1 }


{
parseError :: [Token] -> a
parseError _ = error "Error al Parsear los Tokens"
}
