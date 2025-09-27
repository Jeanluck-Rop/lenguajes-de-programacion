{
{
module Lexer where
import Data.Functor.Identity
import ASA
}

%wrapper "monad"

$digit = [0-9]
$alpha = [a-zA-Z]
$alphanum = {$alpha} | {$digit}

tokens :-
    $white+                     ;

    "--".* ;

    "("                         { TokenPA }
    ")"                         { TokenPC }
    "["                         { TokenLI }
    "]"                         { TokenLD }
    ","                         { TokenComma }

    "+"                         { TokenAdd }
    "-"                         { TokenSub }
    "*"                         { TokenMul }
    "/"                         { TokenDiv }
    "add1"                      { TokenAdd1 }
    "sub1"                      { TokenSub1 }
    "sqrt"                      { TokenSqrt }
    "expt"                      { TokenExpt }

    "#t"                        { TokenBool BTrue }
    "#f"                        { TokenBool BFalse }

    "="                         { TokenEq }
    "!="                        { TokenNeq }
    "<"                         { TokenLt }
    ">"                         { TokenGt }
    "<="                        { TokenLeq }
    ">="                        { TokenGeq }

    "not"                       { TokenNot }

    "letrec"                    { TokenLetRec }
    "let"                       { TokenLet }
    "let*"                      { TokenLetStar }
    "if0"                       { TokenIf0 }
    "if"                        { TokenIf }
    "cond"                      { TokenCond }
    "else"                      { TokenElse }

    "lambda"                    { TokenLambda }
    "pair"                      { TokenPair }
    "fst"                       { TokenFst }
    "snd"                       { TokenSnd }
    "head"                      { TokenHead }
    "tail"                      { TokenTail }

    {$digit}+                   { TokenNum . read }

    {$alpha}{$alphanum}* { TokenVar }
    

{
-- The token type:
data Token
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  | TokenPA
  | TokenPC
  | TokenLI
  | TokenLD
  | TokenComma
  | TokenAdd
  | TokenSub
  | TokenMul
  | TokenDiv
  | TokenAdd1
  | TokenSub1
  | TokenSqrt
  | TokenExpt
  | TokenNot
  | TokenEq
  | TokenNeq
  | TokenLt
  | TokenGt
  | TokenLeq
  | TokenGeq
  | TokenLet
  | TokenLetRec
  | TokenLetStar
  | TokenIf0
  | TokenIf
  | TokenCond
  | TokenElse
  | TokenLambda
  | TokenPair
  | TokenFst
  | TokenSnd
  | TokenHead
  | TokenTail
  deriving (Show, Eq)

type Lexer a = Alex a

alexScanTokens :: String -> [Token]
alexScanTokens str = runIdentity (alexMonadScan (alexStartPos, str))

-- A utility function for converting a token to a string.
showToken :: Token -> String
showToken t = show t
}
