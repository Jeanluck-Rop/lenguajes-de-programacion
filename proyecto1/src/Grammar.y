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
  '+'             { TokenAdd }
  '-'             { TokenSub }
  '*'             { TokenMul }
  '/'             { TokenDiv }
  "add1"          { TokenAdd1 }
  "sub1"          { TokenSub1 }
  "sqrt"          { TokenSqrt }
  "expt"          { TokenExpt }
  "not"           { TokenNot }
  '='             { TokenEq }
  '<'             { TokenLt }
  '>'             { TokenGt }
  '!='            { TokenNeq }
  '<='            { TokenLeq }
  '>='            { TokenGeq }
  -- "pair"          { TokenPair } Creo este no es necesario
  "fst"           { TokenFst }
  "snd"           { TokenSnd }
  "head"          { TokenHead }
  "tail"          { TokenTail }
  "let"           { TokenLet }
  "letrec"        { TokenLetRec }
  "let*"          { TokenLetStar }
  "if0"           { TokenIf0 }
  "if"            { TokenIf }
  "cond"          { TokenCond }
  "else"          { TokenElse }
  "lambda"        { TokenLambda }
  "app"           { TokenApp }
  '['             { TokenLI }
  ']'             { TokenLD }
  ','             { TokenComma }
  '('             { TokenPA }
  ')'             { TokenPC }
  
%%

ASA
  : var                                  { Var $1 }
  | num                                  { Num $1 }
  | boolean                              { Boolean $1 }
  | '(' '+' ASA ASA ')'                  { Add $3 $4 }
  | '(' '-' ASA ASA ')'                  { Sub $3 $4 }
  | '(' '*' ASA ASA ')'                  { Mul $3 $4 }
  | '(' '/' ASA ASA ')'                  { Div $3 $4 }
  | '(' "add1" ASA ')'                   { Add1 $3 }
  | '(' "sub1" ASA ')'                   { Sub1 $3 }
  | '(' "sqrt" ASA ')'                   { Sqrt $3 }
  | '(' "expt" ASA ')'                   { Expt $3 }
  | '(' "not" ASA ')'                    { Not $3 }
  | '(' '=' ASA ')'                      { Equal $3 }
  | '(' '<' ASA ASA ')'                  { Less $3 $4 }
  | '(' '>' ASA ASA ')'                  { Greater $3 $4 }
  | '(' '!=' ASA ASA ')'                 { Diff $3 $4 }
  | '(' '<=' ASA ASA ')'                 { Leq $3 $4 }
  | '(' '>=' ASA ASA ')'                 { Geq $3 $4 }
  | '(' ASA ',' ASA ')'                  { Pair $2 $4 }
  | '(' "fst" ASA ')'                    { Fst $3 }
  | '(' "snd" ASA ')'                    { Snd $3 }
  | '(' "let" '(' Var ASA ')' ASA ')'    { Let $4 $5 $7 }
  | '(' "letrec" '(' Var ASA ')' ASA ')' { LetRec $4 $5 $7 }
  | '(' "let*" '(' Var ASA ')' ASA ')'   { LetStar $4 $5 $7 }
  | '(' "if0" ASA ASA ASA ')'            { If0 $3 $4 $5 }
  | '(' "if" ASA ASA ASA ')'             { If $3 $4 $5 }
  | '(' "lambda" Var ASA ')'             { Lambda $3  $4 }
  | '(' "app" ASA ASA ')'                { App $3 $4 }
  | '[' ASA ']'                          { List $2 }
  | '(' "head" ASA ')'                   { Head $3 }
  | '(' "tail" ASA ')'                   { Tail $3 }
  | '(' "cond" '[' ASA ASA ']' '[' "else" ASA ']' ')'   { LetStar $4 $5 $9 }

-- Error al 'Parsear'
{
parseError :: [Token] -> a
parseError _ = error "Sintaxis Error in Parser"
}
