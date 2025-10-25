{
module Grammar where

import Lexer
import Token
import ASA
}

%name parse
%tokentype { Token }
%error { parseError }
  
-- Definimos las reglas de la gramatica y producciones ASA
%token
  var             { TokenVar $$ }
  num             { TokenNum $$ }
  boolean         { TokenBool $$ }
  '('             { TokenPA }
  ')'             { TokenPC }
  '['             { TokenLI }
  ']'             { TokenLD }
  ','             { TokenComma }
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
  "++"            { TokenAdd1 }
  "--"            { TokenSub1 }
  "sqrt"          { TokenSqrt }
  "**"            { TokenExpt }
  "not"           { TokenNot }
  "if0"           { TokenIf0 }
  "if"            { TokenIf }
  "first"         { TokenFst }
  "second"        { TokenSnd }
  "let"           { TokenLet }
  "letrec"        { TokenLetRec }
  "let*"          { TokenLetStar }
  "head"          { TokenHead }
  "tail"          { TokenTail }
  "lambda"        { TokenLambda }
  "cond"          { TokenCond }
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
  | '(' "++" ASA ')'                                    { Add1 $3 }
  | '(' "--" ASA ')'                                    { Sub1 $3 }
  | '(' "sqrt" ASA ')'                                  { Sqrt $3 }
  | '(' "**" ASA ')'                                    { Expt $3 }
  | '(' "not" ASA ')'                                   { Not $3 }
  | '(' ASA ',' ASA ')'                                 { Pair $2 $4 }
  | '(' "first" ASA ')'                                 { Fst $3 }
  | '(' "second" ASA ')'                                { Snd $3 }
  | '(' "let" '(' ids ')' ASA ')'                       { Let (reverse $4) $6 }
  | '(' "letrec" '(' var ASA ')' ASA ')'                { LetRec $4 $5 $7 }
  | '(' "let*" '(' ids ')' ASA ')'                      { LetStar (reverse $4) $6 }
  | '(' "if0" ASA ASA ASA ')'                           { If0 $3 $4 $5 }
  | '(' "if" ASA ASA ASA ')'                            { If $3 $4 $5 }
  | '(' "lambda" '(' vars ')' ASA ')'                   { Lambda (reverse $4) $6 }
  | '(' ASA appArgs ')'                                 { App $2 (reverse $3) }
  | '[' listArgs ']'                                    { List (reverse $2) }
  | '(' "head" ASA ')'                                  { Head $3 }
  | '(' "tail" ASA ')'                                  { Tail $3 }
  | '(' "cond" condis '[' "else" ASA ']' ')'            { Cond (reverse $3) $6 }



opArgs
  : ASA ASA                               { [$2, $1] }
  | opArgs ASA                            { $2 : $1 }


ids
  : id                                    { [$1] }
  | ids id                                { $2 : $1 }

id
  : '(' var ASA ')'                       { ($2, $3) }

  
vars
  : var                                   { [$1] }
  | vars var                              { $2 : $1 }


appArgs
  : ASA                                   { [$1] }
  | appArgs ASA                           { $2 : $1 }


listArgs
  : {- empty -}                           { [] }
  | ASA                                   { [$1] }
  | listArgs ',' ASA                      { $3 : $1 }


condis
  : condy                                 { [$1] }
  | condis condy                          { $2 : $1 }

condy
  : '[' ASA ASA ']'                       { ($2, $3) }


    
-- Error al 'Parsear'
{
parseError :: [Token] -> a
parseError _ = error "Error al Parsear los Tokens"
}
