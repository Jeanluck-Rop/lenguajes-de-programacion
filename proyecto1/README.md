
# Para probar cada implementacion:
```
$ alex Lexer.h
$ happy Grammar.y
$ ghci
ghci> :l ASA.hs Token.hs Lexer.hs Grammar.hs
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
```
