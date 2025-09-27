lexer :: String -> [Token]
lexer = --Clean string

data Token
  = TokenVar String
  | TokenNum Int
  | TokenBool Bool
  | TokenAdd
  | TokenSub
  | TokenNot
  | TokenLet
  | TokenLetRec
  | TokenLetStar
  | TokenIf0
  | TokenLambda
  | TokenApp
  | TokenPA
  | TokenPC
  deriving (Show)

%name parse
%tokentype { Token }
%error { parseError }

%token 
      var                { TokenVar $$ }
      num                { TokenNum $$ }
      bool               { TokenBool $$ }
      '+'                { TokenAdd }
      '-'                { TokenSub }
      "not"              { TokenNot }
      "let"              { TokenLet }
      "letrec"           { TokenLetRec }
      "letstar"          { TokenLetStar }
      "if0"              { TokenIf0 }
      "lambda"           { TokenLambda }
      "app"              { TokenApp }
      '('                { TokenPA }
      ')'                { TokenPC }

%%

ASA : var                                            { Var $1 }
    | num                                            { Num $1 }
    | bool                                           { Bool $1 }
    | '(' '+' ASA ASA ')'                            { Add $3 $4 }
    | '(' '-' ASA ASA ')'                            { Sub $3 $4 }
    | '(' "not" ASA ')'                              { Not $3 }
    | '(' "let" '(' Var ASA ')' ASA ')'              { Let $4 $5 $7 }
    | '(' "letrec" '(' Var ASA ')' ASA ')'           { LetRec $4 $5 $7 }
    | '(' "letstar" '(' Var ASA ')' ASA ')'          { LetStar $4 $5 $7 }
    | '(' "if0" ASA ASA ASA ')'                      { If0 $3 $4 $5 }
    | '(' "lambda" '(' Var ')' ASA ')'               { Lambda $3 }
    | '(' ASA ASA ')'                                { $2 $3 }


parseError :: [Token] -> a
parseError _ = error "Parse error"


--- ASA con azucar (ASA)
data ASA = Var ASA
         | Num ASA
         | Bool ASA
         | Add ASA ASA
         | Sub ASA ASA
         | Not ASA
         | Let Var ASA ASA
         | LetRec Var ASA ASA
         | LetStar Var ASA ASA
         | If0 ASA ASA ASA
         | Lambda Var ASA
         | ASA ASA
         --- No estoy seguro
         | Add1 ASA
         | Sub1 ASA
         | Squirt ASA
         | Greater ASA ASA
         | Minor ASA ASA
         | Equal ASA ASA
         | If ASA ASA ASA
         | Head ASA
         | Tail ASA
         | Cond [(ASA, ASA)]
         | NAdd [ASA]
         | Fact ASA
         | Fibo ASA
         | Map ASA ASA
         | Filter ASA ASA
         deriving(Show, Eq)

--Desazucaramos

-- ASA sin azucar (AST)
data AST
  = CVar String
  | CNum Int
  | CBool Bool
  | CAdd CoreAST CoreAST
  | CSub CoreAST CoreAST
  | CIf0 CoreAST CoreAST CoreAST
  | CIf CoreAST CoreAST CoreAST
  | CLambda String CoreAST
  | CoreAST CoreAST
  deriving (Show, Eq)
