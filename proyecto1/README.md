
# Para probar cada implementacion:
```
$ alex Lexer.x
$ happy Grammar.y
$ ghci
ghci> :l ASA.hs AST.hs ASV.hs Token.hs Lexer.hs Grammar.hs Desugar.hs
```

## Lexer:
```
ghci> Lexer.lexer "(+ 1 2 3 4)"
```

```
ghci> import Lexer
ghci> lexer "(+ 1 2 3 4)"

```

## Parser:
```
ghci> import Grammar
ghci> tokens = Lexer.lexer "(+ 1 2 3 4)"
ghci> parse tokens
Add [Num 1,Num 2,Num 3,Num 4]
```

Nuestro parser funciona porque, por ejemplo, al intentar dar un numero de argumentos invalida sale error en el aprser:
```
ghci> tokens = lexer "(+ 1)"
ghci> parse tokens 
*** Exception: Parser Error
CallStack (from HasCallStack):
  error, called at Grammar.hs:1210:16 in main:Grammar
ghci> tokens = lexer "(+ 1 2)"
ghci> parse tokens 
Add [Num 1,Num 2]
ghci> 
```
