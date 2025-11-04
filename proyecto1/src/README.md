# Ejecución y Pruebas de MiniLisp

Para probar el lenguaje, diríjase al directorio `src/`.

1. Generar el analizador léxico:
```
alex Lexer.x
```

2. Generar el analizador sintáctico
```
happy Grammar.y
```

3. Iniciar el intérprete interactivo de Haskell (GHCi)
```
ghci
GHCi, version 9.4.5: https://www.haskell.org/ghc/  :? for help
ghci> :l MiniLisp.hs
[ 1 of 11] Compiling ASA              ( ASA.hs, interpreted )
[ 2 of 11] Compiling AST              ( AST.hs, interpreted )
[ 3 of 11] Compiling ASV              ( ASV.hs, interpreted )
[ 4 of 11] Compiling Desugar          ( Desugar.hs, interpreted )
[ 5 of 11] Compiling Interprete       ( Interprete.hs, interpreted )
[ 6 of 11] Compiling EvalStrict       ( EvalStrict.hs, interpreted )
[ 7 of 11] Compiling Saca             ( Saca.hs, interpreted )
[ 8 of 11] Compiling Token            ( Token.hs, interpreted )
[ 9 of 11] Compiling Lexer            ( Lexer.hs, interpreted )
[10 of 11] Compiling Grammar          ( Grammar.hs, interpreted )
[11 of 11] Compiling MiniLisp         ( MiniLisp.hs, interpreted )
Ok, 11 modules loaded.
```

Esto cargará el módulo principal del lenguaje, permitiendo ejecutar expresiones de MiniLisp dentro del entorno interactivo de Haskell.


## Lexer
Define las reglas del analizador léxico, responsable de convertir el programa del usuario en una secuencia de tokens.

### Valores

+ Var
```
ghci> lexer "x"
[TokenVar "x"]
ghci> lexer "variable"
[TokenVar "variable"]
```

+ Num
```
ghci> lexer "5"
[TokenNum 5]
ghci> lexer "2048"
[TokenNum 2048]
```

+ Bool
```
ghci> lexer "#t"
[TokenBool True]
ghci> lexer "#f"
[TokenBool False]
```

### Operadores

+ Suma
```
ghci> lexer "(+ 1 2 8 51)"
[TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenNum 8,TokenNum 51,TokenPC]
ghci> lexer "(+ 1 (* 2 (+ 3 4)))"
[TokenPA,TokenAdd,TokenNum 1,TokenPA,TokenMul,TokenNum 2,TokenPA,TokenAdd,TokenNum 3,TokenNum 4,TokenPC,TokenPC,TokenPC]
```

+ Resta
```
ghci> lexer "(- 5 2)"
[TokenPA,TokenSub,TokenNum 5,TokenNum 2,TokenPC]
ghci> lexer "(- (* 10 3) (+ 4 2))"
[TokenPA,TokenSub,TokenPA,TokenMul,TokenNum 10,TokenNum 3,TokenPC,TokenPA,TokenAdd,TokenNum 4,TokenNum 2,TokenPC,TokenPC]
```

+ Multiplicación
```
ghci> lexer "(* 2 3)"
[TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC]
ghci> lexer "(* (+ 2 3) (- 10 4))"
[TokenPA,TokenMul,TokenPA,TokenAdd,TokenNum 2,TokenNum 3,TokenPC,TokenPA,TokenSub,TokenNum 10,TokenNum 4,TokenPC,TokenPC]
```

+ División
```
ghci> lexer "(/ 6 2)"
[TokenPA,TokenDiv,TokenNum 6,TokenNum 2,TokenPC]
ghci> lexer "(/ (* 12 2) (- 3 3))"
[TokenPA,TokenDiv,TokenPA,TokenMul,TokenNum 12,TokenNum 2,TokenPC,TokenPA,TokenSub,TokenNum 3,TokenNum 3,TokenPC,TokenPC]
```

+ Incremento
```
ghci> lexer "(add1 4)"
[TokenPA,TokenAdd1,TokenNum 4,TokenPC]
ghci> lexer "(add1 (* 2 3))"
[TokenPA,TokenAdd1,TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC,TokenPC]
```

+ Decremento
```
ghci> lexer "(sub1 10)"
[TokenPA,TokenSub1,TokenNum 10,TokenPC]
ghci> lexer "(sub1 (+ 4 (* 2 3)))"
[TokenPA,TokenSub1,TokenPA,TokenAdd,TokenNum 4,TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC,TokenPC,TokenPC]
```

+ Raíz cuadrada
```
ghci> lexer "(sqrt 9)"
[TokenPA,TokenSqrt,TokenNum 9,TokenPC]
ghci> lexer "(sqrt (+ (* 3 3) (* 4 4)))"
[TokenPA,TokenSqrt,TokenPA,TokenAdd,TokenPA,TokenMul,TokenNum 3,TokenNum 3,TokenPC,TokenPA,TokenMul,TokenNum 4,TokenNum 4,TokenPC,TokenPC,TokenPC]
```

+ Potencia al cuadrado
```
ghci> lexer "(expt 8)"
[TokenPA,TokenExpt,TokenNum 8,TokenPC]
ghci> lexer "(expt (add1 (* 2 2)))"
[TokenPA,TokenExpt,TokenPA,TokenAdd1,TokenPA,TokenMul,TokenNum 2,TokenNum 2,TokenPC,TokenPC,TokenPC]
```

### Not
```
ghci> lexer "(not #t)"
[TokenPA,TokenNot,TokenBool True,TokenPC]
ghci> lexer "(not (< (+ 1 2) (* 3 1)))"
[TokenPA,TokenNot,TokenPA,TokenLt,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenPA,TokenMul,TokenNum 3,TokenNum 1,TokenPC,TokenPC,TokenPC]
```

### Comparadores

+ Igual
```
ghci> lexer "(= 2 2)"
[TokenPA,TokenEq,TokenNum 2,TokenNum 2,TokenPC]
ghci> lexer "(= (+ 2 3) (* 5 1))"
[TokenPA,TokenEq,TokenPA,TokenAdd,TokenNum 2,TokenNum 3,TokenPC,TokenPA,TokenMul,TokenNum 5,TokenNum 1,TokenPC,TokenPC]
```

+ Menor que
```
ghci> lexer "(< 1 2)"
[TokenPA,TokenLt,TokenNum 1,TokenNum 2,TokenPC]
ghci> lexer "(< (+ 1 2) (* 2 3))"
[TokenPA,TokenLt,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC,TokenPC]
```

+ Mayor que
```
ghci> lexer "(> 5 3)"
[TokenPA,TokenGt,TokenNum 5,TokenNum 3,TokenPC]
ghci> lexer "(> (* 3 3) (+ 4 2))"
[TokenPA,TokenGt,TokenPA,TokenMul,TokenNum 3,TokenNum 3,TokenPC,TokenPA,TokenAdd,TokenNum 4,TokenNum 2,TokenPC,TokenPC]
```

+ Diferencia
```
ghci> lexer "(!= 4 5)"
[TokenPA,TokenNeq,TokenNum 4,TokenNum 5,TokenPC]
ghci> lexer "(!= (* 2 3) (+ 3 3))"
[TokenPA,TokenNeq,TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC,TokenPA,TokenAdd,TokenNum 3,TokenNum 3,TokenPC,TokenPC]
```

+ Menor o igual
```
ghci> lexer "(<= 2 3)"
[TokenPA,TokenLeq,TokenNum 2,TokenNum 3,TokenPC]
ghci> lexer "(<= (+ 2 3) (* 2 3))"
[TokenPA,TokenLeq,TokenPA,TokenAdd,TokenNum 2,TokenNum 3,TokenPC,TokenPA,TokenMul,TokenNum 2,TokenNum 3,TokenPC,TokenPC]
```

+ Mayor o igual
```
ghci> lexer "(>= 3 3)"
[TokenPA,TokenGeq,TokenNum 3,TokenNum 3,TokenPC]
ghci> lexer "(>= (* 3 3) (+ 4 2))"
[TokenPA,TokenGeq,TokenPA,TokenMul,TokenNum 3,TokenNum 3,TokenPC,TokenPA,TokenAdd,TokenNum 4,TokenNum 2,TokenPC,TokenPC]
```

### Pares
```
ghci> lexer "(1, 2)"
[TokenPA,TokenNum 1,TokenComma,TokenNum 2,TokenPC]
ghci> lexer "((+ 1 2), (* 3 4))"
[TokenPA,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenComma,TokenPA,TokenMul,TokenNum 3,TokenNum 4,TokenPC,TokenPC]
```

+ First
```
ghci> lexer "(fst (1, 2))"
[TokenPA,TokenFst,TokenPA,TokenNum 1,TokenComma,TokenNum 2,TokenPC,TokenPC]
ghci> lexer "(fst ((+ 1 2), (sqrt 9)))"
[TokenPA,TokenFst,TokenPA,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenComma,TokenPA,TokenSqrt,TokenNum 9,TokenPC,TokenPC,TokenPC]
```

+ Second
```
ghci> lexer "(snd (3, 4))"
[TokenPA,TokenSnd,TokenPA,TokenNum 3,TokenComma,TokenNum 4,TokenPC,TokenPC]
ghci> lexer "(snd ((sqrt 16), (+ 3 5)))"
[TokenPA,TokenSnd,TokenPA,TokenPA,TokenSqrt,TokenNum 16,TokenPC,TokenComma,TokenPA,TokenAdd,TokenNum 3,TokenNum 5,TokenPC,TokenPC,TokenPC]
```

### Condicionales

+ If
```
ghci> lexer "(if #t 1 0)"
[TokenPA,TokenIf,TokenBool True,TokenNum 1,TokenNum 0,TokenPC]
ghci> lexer "(if (> 3 2) (+ 1 2) (* 2 2))"
[TokenPA,TokenIf,TokenPA,TokenGt,TokenNum 3,TokenNum 2,TokenPC,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenPA,TokenMul,TokenNum 2,TokenNum 2,TokenPC,TokenPC]
```

+ If0
```
ghci> lexer "(if0 0 1 2)"
[TokenPA,TokenIf0,TokenNum 0,TokenNum 1,TokenNum 2,TokenPC]
ghci> lexer "(if0 (- 3 3) (+ 1 2) (* 3 3))"
[TokenPA,TokenIf0,TokenPA,TokenSub,TokenNum 3,TokenNum 3,TokenPC,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenPA,TokenMul,TokenNum 3,TokenNum 3,TokenPC,TokenPC]
```

+ Cond
```
ghci> lexer "(cond [#t 1] [else 0])"
[TokenPA,TokenCond,TokenLI,TokenBool True,TokenNum 1,TokenLD,TokenLI,TokenElse,TokenNum 0,TokenLD,TokenPC]
ghci> lexer "(cond [(< x 0) (- 0 x)] [(= x 0) 0] [else (+ x 1)])"
[TokenPA,TokenCond,TokenLI,TokenPA,TokenLt,TokenVar "x",TokenNum 0,TokenPC,TokenPA,TokenSub,TokenNum 0,TokenVar "x",TokenPC,TokenLD,TokenLI,TokenPA,TokenEq,TokenVar "x",TokenNum 0,TokenPC,TokenNum 0,TokenLD,TokenLI,TokenElse,TokenPA,TokenAdd,TokenVar "x",TokenNum 1,TokenPC,TokenLD,TokenPC]
```

### Listas
```
ghci> lexer "[1, 2, 3]"
[TokenLI,TokenNum 1,TokenComma,TokenNum 2,TokenComma,TokenNum 3,TokenLD]
ghci> lexer "[[1, 2, (3, 4)], #t, (+ 1 2)]"
[TokenLI,TokenLI,TokenNum 1,TokenComma,TokenNum 2,TokenComma,TokenPA,TokenNum 3,TokenComma,TokenNum 4,TokenPC,TokenLD,TokenComma,TokenBool True,TokenComma,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenLD]
```

+ Head
```
ghci> lexer "(head [1, 2, 3])"
[TokenPA,TokenHead,TokenLI,TokenNum 1,TokenComma,TokenNum 2,TokenComma,TokenNum 3,TokenLD,TokenPC]
ghci> lexer "(head [[1, 2], (+ 3 4), #f])"
[TokenPA,TokenHead,TokenLI,TokenLI,TokenNum 1,TokenComma,TokenNum 2,TokenLD,TokenComma,TokenPA,TokenAdd,TokenNum 3,TokenNum 4,TokenPC,TokenComma,TokenBool False,TokenLD,TokenPC]
```

+ Tail
```
ghci> lexer "(tail [1, 2, 3])"
[TokenPA,TokenTail,TokenLI,TokenNum 1,TokenComma,TokenNum 2,TokenComma,TokenNum 3,TokenLD,TokenPC]
ghci> lexer "(tail [[(+ 1 2)], (* 3 4), #t])"
[TokenPA,TokenTail,TokenLI,TokenLI,TokenPA,TokenAdd,TokenNum 1,TokenNum 2,TokenPC,TokenLD,TokenComma,TokenPA,TokenMul,TokenNum 3,TokenNum 4,TokenPC,TokenComma,TokenBool True,TokenLD,TokenPC]
```

### Let, Let*, LetRec

+ Let
```
ghci> lexer "(let ((x 5)) (+ x 1))"
[TokenPA,TokenLet,TokenPA,TokenPA,TokenVar "x",TokenNum 5,TokenPC,TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenNum 1,TokenPC,TokenPC]
ghci> lexer "(let ((x 2) (y (* x 3))) (+ x y))"
[TokenPA,TokenLet,TokenPA,TokenPA,TokenVar "x",TokenNum 2,TokenPC,TokenPA,TokenVar "y",TokenPA,TokenMul,TokenVar "x",TokenNum 3,TokenPC,TokenPC,TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenVar "y",TokenPC,TokenPC]
```

+ Let*
```
ghci> lexer "(let* ((x 2)) (+ x 3))"
[TokenPA,TokenLetStar,TokenPA,TokenPA,TokenVar "x",TokenNum 2,TokenPC,TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenNum 3,TokenPC,TokenPC]
ghci> lexer "(let* ((x 2) (y (+ x 3)) (z (* y 2))) (+ x y z))"
[TokenPA,TokenLetStar,TokenPA,TokenPA,TokenVar "x",TokenNum 2,TokenPC,TokenPA,TokenVar "y",TokenPA,TokenAdd,TokenVar "x",TokenNum 3,TokenPC,TokenPC,TokenPA,TokenVar "z",TokenPA,TokenMul,TokenVar "y",TokenNum 2,TokenPC,TokenPC,TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenVar "y",TokenVar "z",TokenPC,TokenPC]
```

+ LetRec
```
ghci> lexer "(letrec (f (lambda (x) (+ x 1))) (f 2))"
[TokenPA,TokenLetRec,TokenPA,TokenVar "f",TokenPA,TokenLambda,TokenPA,TokenVar "x",TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenNum 1,TokenPC,TokenPC,TokenPC,TokenPA,TokenVar "f",TokenNum 2,TokenPC,TokenPC]
ghci> lexer "(letrec (fact (lambda (n) (if0 n 1 (* n (fact (sub1 n)))))) (fact 5))"
[TokenPA,TokenLetRec,TokenPA,TokenVar "fact",TokenPA,TokenLambda,TokenPA,TokenVar "n",TokenPC,TokenPA,TokenIf0,TokenVar "n",TokenNum 1,TokenPA,TokenMul,TokenVar "n",TokenPA,TokenVar "fact",TokenPA,TokenSub1,TokenVar "n",TokenPC,TokenPC,TokenPC,TokenPC,TokenPC,TokenPC,TokenPA,TokenVar "fact",TokenNum 5,TokenPC,TokenPC]
```

### Expresiones Lambda

+ Funciones Lambda
```
ghci> lexer "(lambda (x) (+ x 1))"
[TokenPA,TokenLambda,TokenPA,TokenVar "x",TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenNum 1,TokenPC,TokenPC]
ghci> lexer "(lambda (x y) (if (> x y) (- x y) (+ x y)))"
[TokenPA,TokenLambda,TokenPA,TokenVar "x",TokenVar "y",TokenPC,TokenPA,TokenIf,TokenPA,TokenGt,TokenVar "x",TokenVar "y",TokenPC,TokenPA,TokenSub,TokenVar "x",TokenVar "y",TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenVar "y",TokenPC,TokenPC,TokenPC]
```

+ Aplicación de Funciones
```
ghci> lexer "((lambda (x) (+ x 1)) 5)"
[TokenPA,TokenPA,TokenLambda,TokenPA,TokenVar "x",TokenPC,TokenPA,TokenAdd,TokenVar "x",TokenNum 1,TokenPC,TokenPC,TokenNum 5,TokenPC]
ghci> lexer "((lambda (f x) (f x)) (lambda (y) (* y y)) 4)"
[TokenPA,TokenPA,TokenLambda,TokenPA,TokenVar "f",TokenVar "x",TokenPC,TokenPA,TokenVar "f",TokenVar "x",TokenPC,TokenPC,TokenPA,TokenLambda,TokenPA,TokenVar "y",TokenPC,TokenPA,TokenMul,TokenVar "y",TokenVar "y",TokenPC,TokenPC,TokenNum 4,TokenPC]
```


## Parser
Implementa la gramática del lenguaje usando Happy.
Transforma la lista de tokens generada por Lexer.x en un árbol de sintaxis abstracta (ASA).

### Valores
+ Var
```
ghci> tokens = lexer "x"
ghci> parse tokens
Var "x" 
ghci> tokens = lexer "variable"
ghci> parse tokens
Var "variable"
```

+ Num
```
ghci> tokens = lexer "5"
ghci> parse tokens
Num 5
ghci> tokens = lexer "2048"
ghci> parse tokens
Num 2048
```

+ Bool
```
ghci> tokens = lexer "#t"
ghci> parse tokens
Boolean True
ghci> tokens = lexer "#f"
ghci> parse tokens
Boolean False
```

### Operadores

+ Suma
```
ghci> tokens = lexer "(+ 1 2 8 51)"
ghci> parse tokens
Add [Num 1,Num 2,Num 8,Num 51]
ghci> tokens = lexer "(+ 1 (* 2 (+ 3 4)))"
ghci> parse tokens
Add [Num 1,Mul [Num 2,Add [Num 3,Num 4]]]
```

+ Resta
```
ghci> tokens = lexer "(- 5 2)"
ghci> parse tokens
Sub [Num 5,Num 2]
ghci> tokens = lexer "(- (* 10 3) (+ 4 2))"
ghci> parse tokens
Sub [Mul [Num 10,Num 3],Add [Num 4,Num 2]]
```

+ Multiplicación
```
ghci> tokens = lexer "(* 2 3)"
ghci> parse tokens
Mul [Num 2,Num 3]
ghci> tokens = lexer "(* (+ 2 3) (- 10 4))"
ghci> parse tokens
Mul [Add [Num 2,Num 3],Sub [Num 10,Num 4]]
```

+ División
```
ghci> tokens = lexer "(/ 6 2)"
ghci> parse tokens
Div [Num 6,Num 2]
ghci> tokens = lexer "(/ (* 12 2) (- 3 3))"
ghci> parse tokens
Div [Mul [Num 12,Num 2],Sub [Num 3,Num 3]]
```

+ Incremento
```
ghci> tokens = lexer "(add1 4)"
ghci> parse tokens
Add1 (Num 4)
ghci> tokens = lexer "(add1 (* 2 3))"
ghci> parse tokens
Add1 (Mul [Num 2,Num 3])
```

+ Decremento
```
ghci> tokens = lexer "(sub1 10)"
ghci> parse tokens
Sub1 (Num 10)
ghci> tokens = lexer "(sub1 (+ 4 (* 2 3)))"
ghci> parse tokens
Sub1 (Add [Num 4,Mul [Num 2,Num 3]])
```

+ Raíz cuadrada
```
ghci> tokens = lexer "(sqrt 9)"
ghci> parse tokens
Sqrt (Num 9)
ghci> tokens = lexer "(sqrt (+ (* 3 3) (* 4 4)))"
ghci> parse tokens
Sqrt (Add [Mul [Num 3,Num 3],Mul [Num 4,Num 4]])
```

+ Potencia al cuadrado
```
ghci> tokens = lexer "(expt 8)"
ghci> parse tokens 
Expt (Num 8)
ghci> tokens = lexer "(expt (add1 (* 2 2)))"
ghci> parse tokens
Expt (Add1 (Mul [Num 2,Num 2]))
ghci> 
```

### Not
```
ghci> tokens = lexer "(not #t)"
ghci> parse tokens
Not (Boolean True)
ghci> 
ghci> tokens = lexer "(not (< (+ 1 2) (* 3 1)))"
ghci> parse tokens
Not (Less [Add [Num 1,Num 2],Mul [Num 3,Num 1]])
ghci> 
```

### Comparadores

+ Igual
```
ghci> tokens = lexer "(= 2 2)"
ghci> parse tokens
Equal [Num 2,Num 2]
ghci> tokens = lexer "(= (+ 2 3) (* 5 1))"
ghci> parse tokens
Equal [Add [Num 2,Num 3],Mul [Num 5,Num 1]]
```

+ Menor que
```
ghci> tokens = lexer "(< 1 2)"
ghci> parse tokens
Less [Num 1,Num 2]
ghci> tokens = lexer "(< (+ 1 2) (* 2 3))"
ghci> parse tokens
Less [Add [Num 1,Num 2],Mul [Num 2,Num 3]]
```

+ Mayor que
```
ghci> tokens = lexer "(> 5 3)"
ghci> parse tokens
Greater [Num 5,Num 3]
ghci> tokens = lexer "(> (* 3 3) (+ 4 2))"
ghci> parse tokens
Greater [Mul [Num 3,Num 3],Add [Num 4,Num 2]]
```

+ Diferencia
```
ghci> tokens = lexer "(!= 4 5)"
ghci> parse tokens
Diff [Num 4,Num 5]
ghci> tokens = lexer "(!= (* 2 3) (+ 3 3))"
ghci> parse tokens
Diff [Mul [Num 2,Num 3],Add [Num 3,Num 3]]
```

+ Menor o igual
```
ghci> tokens = lexer "(<= 2 3)"
ghci> parse tokens
Leq [Num 2,Num 3]
ghci> tokens = lexer "(<= (+ 2 3) (* 2 3))"
ghci> parse tokens
Leq [Add [Num 2,Num 3],Mul [Num 2,Num 3]]
```

+ Mayor o igual
```
ghci> tokens = lexer "(>= 3 3)"
ghci> parse tokens
Geq [Num 3,Num 3]
ghci> tokens = lexer "(>= (* 3 3) (+ 4 2))"
ghci> parse tokens
Geq [Mul [Num 3,Num 3],Add [Num 4,Num 2]]
```

### Pares
```
ghci> tokens = lexer "(1, 2)"
ghci> parse tokens
Pair (Num 1) (Num 2)
ghci> tokens = lexer "((+ 1 2), (* 3 4))"
ghci> parse tokens
Pair (Add [Num 1,Num 2]) (Mul [Num 3,Num 4])
```

+ First
```
ghci> tokens = lexer "(fst (1, 2))"
ghci> parse tokens
Fst (Pair (Num 1) (Num 2))
ghci> tokens = lexer "(fst ((+ 1 2), (sqrt 9)))"
ghci> parse tokens
Fst (Pair (Add [Num 1,Num 2]) (Sqrt (Num 9)))
```

+ Second
```
ghci> tokens = lexer "(snd (3, 4))"
ghci> parse tokens
Snd (Pair (Num 3) (Num 4))
ghci> tokens = lexer "(snd ((sqrt 16), (+ 3 5)))"
ghci> parse tokens
Snd (Pair (Sqrt (Num 16)) (Add [Num 3,Num 5]))
```

### Condicionales

+ If
```
ghci> tokens = lexer "(if #t 1 0)"
ghci> parse tokens
If (Boolean True) (Num 1) (Num 0)
ghci> tokens = lexer "(if (> 3 2) (+ 1 2) (* 2 2))"
ghci> parse tokens
If (Greater [Num 3,Num 2]) (Add [Num 1,Num 2]) (Mul [Num 2,Num 2])
```

+ If0
```
ghci> tokens = lexer "(if0 0 1 2)"
ghci> parse tokens
If0 (Num 0) (Num 1) (Num 2)
ghci> tokens = lexer "(if0 (- 3 3) (+ 1 2) (* 3 3))"
ghci> parse tokens
If0 (Sub [Num 3,Num 3]) (Add [Num 1,Num 2]) (Mul [Num 3,Num 3])
```

+ Cond
```
ghci> tokens = lexer "(cond [#t 1] [else 0])"
ghci> parse tokens
Cond [(Boolean True,Num 1)] (Num 0)
ghci> tokens = lexer "(cond [(< x 0) (- 0 x)] [(= x 0) 0] [else (+ x 1)])"
ghci> parse tokens
Cond [(Less [Var "x",Num 0],Sub [Num 0,Var "x"]),(Equal [Var "x",Num 0],Num 0)] (Add [Var "x",Num 1])
```

### Listas
```
ghci> tokens = lexer "[1, 2, 3]"
ghci> parse tokens
List [Num 1,Num 2,Num 3]
ghci> tokens = lexer "[[1, 2, (3, 4)], #t, (+ 1 2)]"
ghci> parse tokens 
List [List [Num 1,Num 2,Pair (Num 3) (Num 4)],Boolean True,Add [Num 1,Num 2]]
```

+ Head
```
ghci> tokens = lexer "(head [1, 2, 3])"
ghci> parse tokens
Head (List [Num 1,Num 2,Num 3])
ghci> tokens = lexer "(head [[1, 2], (+ 3 4), #f])"
ghci> parse tokens
Head (List [List [Num 1,Num 2],Add [Num 3,Num 4],Boolean False])
```

+ Tail
```
ghci> tokens = lexer "(tail [1, 2, 3])"
ghci> parse tokens
Tail (List [Num 1,Num 2,Num 3])
ghci> tokens = lexer "(tail [[(+ 1 2)], (* 3 4), #t])"
ghci> parse tokens
Tail (List [List [Add [Num 1,Num 2]],Mul [Num 3,Num 4],Boolean True])
```

### Let, Let* y LetRec

+ Let
```
ghci> tokens = lexer "(let ((x 5)) (+ x 1))"
ghci> parse tokens
Let [("x",Num 5)] (Add [Var "x",Num 1])
ghci> tokens = lexer "(let ((x 2) (y (* x 3))) (+ x y))"
ghci> parse tokens
Let [("x",Num 2),("y",Mul [Var "x",Num 3])] (Add [Var "x",Var "y"])
```

+ Let*
```
ghci> tokens = lexer "(let* ((x 2)) (+ x 3))"
ghci> parse tokens
LetStar [("x",Num 2)] (Add [Var "x",Num 3])
ghci> tokens = lexer "(let* ((x 2) (y (+ x 3)) (z (* y 2))) (+ x y z))"
ghci> parse tokens
LetStar [("x",Num 2),("y",Add [Var "x",Num 3]),("z",Mul [Var "y",Num 2])] (Add [Var "x",Var "y",Var "z"])
```

+ LetRec
```
ghci> tokens = lexer "(letrec (f (lambda (x) (+ x 1))) (f 2))"
ghci> parse tokens
LetRec "f" (Lambda ["x"] (Add [Var "x",Num 1])) (App (Var "f") [Num 2])
ghci> tokens = lexer "(letrec (fact (lambda (n) (if0 n 1 (* n (fact (sub1 n)))))) (fact 5))"
ghci> parse tokens
LetRec "fact" (Lambda ["n"] (If0 (Var "n") (Num 1) (Mul [Var "n",App (Var "fact") [Sub1 (Var "n")]]))) (App (Var "fact") [Num 5])
```

### Expresiones Lambda

+ Lambda
```
ghci> tokens = lexer "(lambda (x) (+ x 1))"
ghci> parse tokens
Lambda ["x"] (Add [Var "x",Num 1])
ghci> tokens = lexer "(lambda (x y) (if (> x y) (- x y) (+ x y)))"
ghci> parse tokens
Lambda ["x","y"] (If (Greater [Var "x",Var "y"]) (Sub [Var "x",Var "y"]) (Add [Var "x",Var "y"]))
```

+ Aplicación de Funciones
```
ghci> tokens = lexer "((lambda (x) (+ x 1)) 5)"
ghci> parse tokens
App (Lambda ["x"] (Add [Var "x",Num 1])) [Num 5] 
ghci> tokens = lexer "((lambda (f x) (f x)) (lambda (y) (* y y)) 4)"
ghci> parse tokens
App (Lambda ["f","x"] (App (Var "f") [Var "x"])) [Lambda ["y"] (Mul [Var "y",Var "y"]),Num 4]
```


## Desugar
Desazucara las estructuras ASA para convertirlas en estructuras núcleo, una forma más básica del lenguaje.

### Valores

+ Var
```
ghci> tokens = lexer "x"
ghci> asa = parse tokens
ghci> desugar asa
VarC "x"
ghci> 
ghci> tokens = lexer "variable"
ghci> asa = parse tokens
ghci> desugar asa
VarC "variable"
```

+ Num
```
ghci> tokens = lexer "5"
ghci> asa = parse tokens
ghci> desugar asa
NumC 5 
ghci> tokens = lexer "2048"
ghci> asa = parse tokens
ghci> desugar asa
NumC 2048
```

+ Bool
```
ghci> tokens = lexer "#t"
ghci> asa = parse tokens
ghci> desugar asa
BoolC True
ghci> tokens = lexer "#f"
ghci> asa = parse tokens
ghci> desugar asa
BoolC False
```

### Operadores

+ Suma
```
ghci> tokens = lexer "(+ 1 2 8 51)"
ghci> asa = parse tokens
ghci> desugar asa
AddC (NumC 1) (NumC 2) (NumC 8) (NumC 51)
ghci> tokens = lexer "(+ 1 (* 2 (+ 3 4)))"
ghci> asa = parse tokens
ghci> desugar asa
AddC (NumC 1) (MulC (NumC 2) (AddC (NumC 3) (NumC 4)))
```

+ Resta
```
ghci> tokens = lexer "(- 5 2)"
ghci> asa = parse tokens
ghci> desugar asa
SubC (NumC 5) (NumC 2)
ghci> tokens = lexer "(- (* 10 3) (+ 4 2))"
ghci> asa = parse tokens
ghci> desugar asa
SubC (MulC (NumC 10) (NumC 3)) (AddC (NumC 4) (NumC 2))
```

+ Multiplicación
```
ghci> tokens = lexer "(* 2 3)"
ghci> asa = parse tokens
ghci> desugar asa
MulC (NumC 2) (NumC 3)
ghci> tokens = lexer "(* (+ 2 3) (- 10 4))"
ghci> asa = parse tokens
ghci> desugar asa
MulC (AddC (NumC 2) (NumC 3)) (SubC (NumC 10) (NumC 4))
```

+ División
```
ghci> tokens = lexer "(/ 6 2)"
ghci> asa = parse tokens
ghci> desugar asa
DivC (NumC 6) (NumC 2)
ghci> tokens = lexer "(/ (* 12 2) (- 3 3))"
ghci> asa = parse tokens
ghci> desugar asa
DivC (MulC (NumC 12) (NumC 2)) (SubC (NumC 3) (NumC 3))
```

+ Incremento
```
ghci> tokens = lexer "(add1 4)"
ghci> asa = parse tokens
ghci> desugar asa
AddC (NumC 4) (NumC 1)
ghci> tokens = lexer "(add1 (* 2 3))"
ghci> asa = parse tokens
ghci> desugar asa
AddC (MulC (NumC 2) (NumC 3)) (NumC 1)
```

+ Decremento
```
ghci> tokens = lexer "(sub1 10)"
ghci> asa = parse tokens
ghci> desugar asa
SubC (NumC 10) (NumC 1)> 
ghci> tokens = lexer "(sub1 (+ 4 (* 2 3)))"
ghci> asa = parse tokens
ghci> desugar asa
SubC (AddC (NumC 4) (MulC (NumC 2) (NumC 3))) (NumC 1)
```

+ Raíz cuadrada
```
ghci> tokens = lexer "(sqrt 9)"
ghci> asa = parse tokens
ghci> desugar asa
SqrtC (NumC 9)
ghci> tokens = lexer "(sqrt (+ (* 3 3) (* 4 4)))"
ghci> asa = parse tokens
ghci> desugar asa
SqrtC (AddC (MulC (NumC 3) (NumC 3)) (MulC (NumC 4) (NumC 4)))
```

+ Potencia al cuadrado
```
ghci> tokens = lexer "(expt 8)"
ghci> asa = parse tokens
ghci> desugar asa
MulC (NumC 8) (NumC 8)
ghci> tokens = lexer "(expt (add1 (* 2 2)))"
ghci> asa = parse tokens
ghci> desugar asa
MulC (AddC (MulC (NumC 2) (NumC 2)) (NumC 1)) (AddC (MulC (NumC 2) (NumC 2)) (NumC 1))
```

### Not
```
ghci> tokens = lexer "(not #t)"
ghci> asa = parse tokens
ghci> desugar asa
NotC (BoolC True)
ghci> tokens = lexer "(not (< (+ 1 2) (* 3 1)))"
ghci> asa = parse tokens
ghci> desugar asa
NotC (LessC (AddC (NumC 1) (NumC 2)) (MulC (NumC 3) (NumC 1)))
```

### Comparadores

+ Igual
```
ghci> tokens = lexer "(= 2 2)"
ghci> asa = parse tokens
ghci> desugar asa
EqualC (NumC 2) (NumC 2)
ghci> tokens = lexer "(= (+ 2 3) (* 5 1))"
ghci> asa = parse tokens
ghci> desugar asa
EqualC (AddC (NumC 2) (NumC 3)) (MulC (NumC 5) (NumC 1))
```

+ Menor que
```
ghci> tokens = lexer "(< 1 2)"
ghci> asa = parse tokens
ghci> desugar asa
LessC (NumC 1) (NumC 2)
ghci> tokens = lexer "(< (+ 1 2) (* 2 3))"
ghci> asa = parse tokens
ghci> desugar asa
LessC (AddC (NumC 1) (NumC 2)) (MulC (NumC 2) (NumC 3))
```

+ Mayor que
```
ghci> tokens = lexer "(> 5 3)"
ghci> asa = parse tokens
ghci> desugar asa
GreaterC (NumC 5) (NumC 3)
ghci> tokens = lexer "(> (* 3 3) (+ 4 2))"
ghci> asa = parse tokens
ghci> desugar asa
GreaterC (MulC (NumC 3) (NumC 3)) (AddC (NumC 4) (NumC 2))
```

+ Diferencia
```
ghci> tokens = lexer "(!= 4 5)"
ghci> asa = parse tokens
ghci> desugar asa
DiffC (NumC 4) (NumC 5)
ghci> tokens = lexer "(!= (* 2 3) (+ 3 3))"
ghci> asa = parse tokens
ghci> desugar asa
DiffC (MulC (NumC 2) (NumC 3)) (AddC (NumC 3) (NumC 3))
```

+ Menor o igual
```
ghci> tokens = lexer "(<= 2 3)"
ghci> asa = parse tokens
ghci> desugar asa
LeqC (NumC 2) (NumC 3)
ghci> tokens = lexer "(<= (+ 2 3) (* 2 3))"
ghci> asa = parse tokens
ghci> desugar asa
LeqC (AddC (NumC 2) (NumC 3)) (MulC (NumC 2) (NumC 3))
```

+ Mayor o igual
```
ghci> tokens = lexer "(>= 3 3)"
ghci> asa = parse tokens
ghci> desugar asa
GeqC (NumC 3) (NumC 3)
ghci> tokens = lexer "(>= (* 3 3) (+ 4 2))"
ghci> asa = parse tokens
ghci> desugar asa
GeqC (MulC (NumC 3) (NumC 3)) (AddC (NumC 4) (NumC 2))
```

### Pares
```
ghci> tokens = lexer "(1, 2)"
ghci> asa = parse tokens
ghci> desugar asa
PairC (NumC 1) (NumC 2)
ghci> tokens = lexer "((+ 1 2), (* 3 4))"
ghci> asa = parse tokens
ghci> desugar asa
PairC (AddC (NumC 1) (NumC 2)) (MulC (NumC 3) (NumC 4))
```

+ First
```
ghci> tokens = lexer "(fst (1, 2))"
ghci> asa = parse tokens
ghci> desugar asa
FstC (PairC (NumC 1) (NumC 2))
ghci> tokens = lexer "(fst ((+ 1 2), (sqrt 9)))"
ghci> asa = parse tokens
ghci> desugar asa
FstC (PairC (AddC (NumC 1) (NumC 2)) (SqrtC (NumC 9)))
```

+ Second
```
ghci> tokens = lexer "(snd (3, 4))"
ghci> asa = parse tokens
ghci> desugar asa
SndC (PairC (NumC 3) (NumC 4))
ghci> tokens = lexer "(snd ((sqrt 16), (+ 3 5)))"
ghci> asa = parse tokens
ghci> desugar asa
SndC (PairC (SqrtC (NumC 16)) (AddC (NumC 3) (NumC 5)))
```

### Condicionales

+ If
```
ghci> tokens = lexer "(if #t 1 0)"
ghci> asa = parse tokens
ghci> desugar asa
IfC (BoolC True) (NumC 1) (NumC 0)
ghci> tokens = lexer "(if (> 3 2) (+ 1 2) (* 2 2))"
ghci> asa = parse tokens
ghci> desugar asa
IfC (GreaterC (NumC 3) (NumC 2)) (AddC (NumC 1) (NumC 2)) (MulC (NumC 2) (NumC 2))
```

+ If0
```
ghci> tokens = lexer "(if0 0 1 2)"
ghci> asa = parse tokens
ghci> desugar asa
IfC (EqualC (NumC 0) (NumC 0)) (NumC 1) (NumC 2) 
ghci> tokens = lexer "(if0 (- 3 3) (+ 1 2) (* 3 3))"
ghci> asa = parse tokens
ghci> desugar asa
IfC (EqualC (SubC (NumC 3) (NumC 3)) (NumC 0)) (AddC (NumC 1) (NumC 2)) (MulC (NumC 3) (NumC 3))
```

+ Cond
```
ghci> tokens = lexer "(cond [#t 1] [else 0])"
ghci> asa = parse tokens
ghci> desugar asa
IfC (BoolC True) (NumC 1) (NumC 0)
ghci> tokens = lexer "(cond [(< x 0) (- 0 x)] [(= x 0) 0] [else (+ x 1)])"
ghci> asa = parse tokens
ghci> desugar asa
IfC (LessC (VarC "x") (NumC 0)) (SubC (NumC 0) (VarC "x")) (IfC (EqualC (VarC "x") (NumC 0)) (NumC 0) (AddC (VarC "x") (NumC 1)))
```

### Listas
```
ghci> tokens = lexer "[1, 2, 3]"
ghci> asa = parse tokens
ghci> desugar asa
ConS (NumC 1) (ConS (NumC 2) (NumC 3))
ghci> tokens = lexer "[[1, 2, (3, 4)], #t, (+ 1 2)]"
ghci> asa = parse tokens
ghci> desugar asa
ConS (ConS (NumC 1) (ConS (NumC 2) (PairC (NumC 3) (NumC 4)))) (ConS (BoolC True) (AddC (NumC 1) (NumC 2)))
```

+ Head
```
ghci> tokens = lexer "(head [1, 2, 3])"
ghci> asa = parse tokens
ghci> desugar asa
HeadC (ConS (NumC 1) (ConS (NumC 2) (NumC 3)))
ghci> tokens = lexer "(head [[1, 2], (+ 3 4), #f])"
ghci> asa = parse tokens
ghci> desugar asa
HeadC (ConS (ConS (NumC 1) (NumC 2)) (ConS (AddC (NumC 3) (NumC 4)) (BoolC False)))
```

+ Tail
```
ghci> tokens = lexer "(tail [1, 2, 3])"
ghci> asa = parse tokens
ghci> desugar asa
TailC (ConS (NumC 1) (ConS (NumC 2) (NumC 3)))
ghci> tokens = lexer "(tail [[(+ 1 2)], (* 3 4), #t])"
ghci> asa = parse tokens
ghci> desugar asa
TailC (ConS (AddC (NumC 1) (NumC 2)) (ConS (MulC (NumC 3) (NumC 4)) (BoolC True)))
```

### Let, Let*, LetRec

+ Let
```
ghci> tokens = lexer "(let ((x 5)) (+ x 1))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "x" (AddC (VarC "x") (NumC 1))) (NumC 5)
ghci> tokens = lexer "(let ((x 2) (y (* x 3))) (+ x y))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "x" (AppC (FunC "y" (AddC (VarC "x") (VarC "y"))) (MulC (VarC "x") (NumC 3)))) (NumC 2)
```

+ Let*
```
ghci> tokens = lexer "(let* ((x 2)) (+ x 3))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "x" (AddC (VarC "x") (NumC 3))) (NumC 2)
ghci> tokens = lexer "(let* ((x 2) (y (+ x 3)) (z (* y 2))) (+ x y z))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "x" (AppC (FunC "y" (AppC (FunC "z" (AddC (VarC "x") (AddC (VarC "y") (VarC "z")))) (MulC (VarC "y") (NumC 2)))) (AddC (VarC "x") (NumC 3)))) (NumC 2)
```

+ LetRec
```
ghci> tokens = lexer "(letrec (f (lambda (x) (+ x 1))) (f 2))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "f" (AppC (VarC "f") (NumC 2))) (AppC (VarC "Z") (FunC "f" (FunC "x" (AddC (VarC "x") (NumC 1)))))
ghci> tokens = lexer "(letrec (fact (lambda (n) (if0 n 1 (* n (fact (sub1 n)))))) (fact 5))"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "fact" (AppC (VarC "fact") (NumC 5))) (AppC (VarC "Z") (FunC "fact" (FunC "n" (IfC (EqualC (VarC "n") (NumC 0)) (NumC 1) (MulC (VarC "n") (AppC (VarC "fact") (SubC (VarC "n") (NumC 1))))))))
```

### Expresiones Lambda

+ Funciones Lambda
```
ghci> tokens = lexer "(lambda (x) (+ x 1))"
ghci> asa = parse tokens
ghci> desugar asa
FunC "x" (AddC (VarC "x") (NumC 1))
ghci> tokens = lexer "(lambda (x y) (if (> x y) (- x y) (+ x y)))"
ghci> asa = parse tokens
ghci> desugar asa
FunC "x" (FunC "y" (IfC (GreaterC (VarC "x") (VarC "y")) (SubC (VarC "x") (VarC "y")) (AddC (VarC "x") (VarC "y"))))
```

+ Aplicación de Funciones
```
ghci> tokens = lexer "((lambda (x) (+ x 1)) 5)"
ghci> asa = parse tokens
ghci> desugar asa
AppC (FunC "x" (AddC (VarC "x") (NumC 1))) (NumC 5)
ghci> 
ghci> tokens = lexer "((lambda (f x) (f x)) (lambda (y) (* y y)) 4)"
ghci> asa = parse tokens
ghci> desugar asa
AppC (AppC (FunC "f" (FunC "x" (AppC (VarC "f") (VarC "x")))) (FunC "y" (MulC (VarC "y") (VarC "y")))) (NumC 4)
```


## Interprete
Para evaluar las expresiones del lenguaje aplicamos reglas semánticas, ambientes hasta llegar a valores canónicos a través de un menú interactivo donde ejecutamos todo el procedimiento, se devuelve el resultado de del programa dado después de ser procesado por cada fase.

Para correr el intérprete de **MiniLisp**, comprobamos que hemos cargado el módulo `MiniLisp.hs`:
```
ghci> :l MiniLisp.hs 
[ 1 of 11] Compiling ASA              ( ASA.hs, interpreted )
[ 2 of 11] Compiling AST              ( AST.hs, interpreted )
[ 3 of 11] Compiling ASV              ( ASV.hs, interpreted )
[ 4 of 11] Compiling Desugar          ( Desugar.hs, interpreted )
[ 5 of 11] Compiling Interprete       ( Interprete.hs, interpreted )
[ 6 of 11] Compiling EvalStrict       ( EvalStrict.hs, interpreted )
[ 7 of 11] Compiling Saca             ( Saca.hs, interpreted )
[ 8 of 11] Compiling Token            ( Token.hs, interpreted )
[ 9 of 11] Compiling Lexer            ( Lexer.hs, interpreted )
[10 of 11] Compiling Grammar          ( Grammar.hs, interpreted )
[11 of 11] Compiling MiniLisp         ( MiniLisp.hs, interpreted )
Ok, 11 modules loaded.
ghci> 
```

Corremos el intérprete:
```
ghci> main

Bienvenido a MiniLisp. 
Escriba (exit) para salir.
[MiniLisp]> 
```

Ahora, veamos el resultado de la evaluación de cada ejemplo. Pero cabe remarcar que recomendamos tener mucho cuidado al escribir cualquier programa de prueba, pues parace ser que `getLine` no registra adecuadamente la tecla de retroceso `backspace`; de preferencia copiar y pegar los programas:

### Valores

+ Var
```
[MiniLisp]> x
[Error]: Var 'x' no definida
CallStack (from HasCallStack):
  error, called at ./Interprete.hs:154:18 in main:Interprete
[MiniLisp]> variable
[Error]: Var 'variable' no definida
CallStack (from HasCallStack):
  error, called at ./Interprete.hs:154:18 in main:Interprete
```

+ Num
```
[MiniLisp]> 5
5
[MiniLisp]> 2028
2028
```

+ Bool
```
[MiniLisp]> #t
#t
[MiniLisp]> #f
#f
```

### Operadores

+ Suma
```
[MiniLisp]> (+ 1 2 8 51)
62
[MiniLisp]> (+ 1 (* 2 (+ 3 4)))
15
```

+ Resta
```
[MiniLisp]> (- 5 2)
3
[MiniLisp]> (- (* 10 3) (+ 4 2))
24
```

+ Multiplicación
```
[MiniLisp]> (* 2 3)
6
[MiniLisp]> (* (+ 2 3) (- 10 4))
30
```

+ División
```
[MiniLisp]> (/ 6 2)
3
[MiniLisp]> (/ (* 12 2) (- 3 3))
[Error]: No se puede dividir entre 0
CallStack (from HasCallStack):
  error, called at ./EvalStrict.hs:34:14 in main:EvalStrict
```

+ Incremento
```
[MiniLisp]> (add1 4)
5
[MiniLisp]> (add1 (* 2 3))
7
```

+ Decremento
```
[MiniLisp]> (sub1 10)
9
[MiniLisp]> (sub1 (+ 4 (* 2 3)))
9
```

+ Raíz cuadrada
```
[MiniLisp]> (sqrt 9)
3
[MiniLisp]> (sqrt (+ (* 3 3) (* 4 4)))
5
```

+ Potencia al cuadrado
```
[MiniLisp]> (expt 8)
64
[MiniLisp]> (expt (add1 (* 2 2)))
25
```

### Not
```
[MiniLisp]> (not #t)
#f
[MiniLisp]> (not (< (+ 1 2) (* 3 1)))
#t
```

### Comparadores

+ Igual
```
[MiniLisp]> (= 2 2)
#t
[MiniLisp]> (= (+ 2 3) (* 5 1))
#t
```

+ Menor que
```
[MiniLisp]> (< 1 2)
#t
[MiniLisp]> (< (+ 1 2) (* 2 3))
#t
```

+ Mayor que
```
[MiniLisp]> (> 5 3)
#t
[MiniLisp]> (> (* 3 3) (+ 4 2))
#t
```

+ Diferencia
```
[MiniLisp]> (!= 4 5)
#t
[MiniLisp]> (!= (* 2 3) (+ 3 3))
#f
```

+ Menor o igual
```
[MiniLisp]> (<= 2 3)
#t
[MiniLisp]> (<= (+ 2 3) (* 2 3))
#t
```

+ Mayor o igual
```
[MiniLisp]> (>= 3 3)
#t
[MiniLisp]> (>= (* 3 3) (+ 4 2))
#t
```

### Pares
```
[MiniLisp]> (1, 2)
(1,2)
[MiniLisp]> ((+ 1 2), (* 3 4))
(3,12)
```

+ First
```
[MiniLisp]> (fst (1, 2))
1
[MiniLisp]> (fst ((+ 1 2), (sqrt 9)))
3
```

+ Second
```
[MiniLisp]> (snd (3, 4))
4
[MiniLisp]> (snd ((sqrt 16), (+ 3 5)))
8
```

### Condicionales

+ If
```
[MiniLisp]> (if #t 1 0)
1
[MiniLisp]> (if (> 3 2) (+ 1 2) (* 2 2))
3
```

+ If0
```
[MiniLisp]> (if0 0 1 2)
1
[MiniLisp]> (if0 (- 3 3) (+ 1 2) (* 3 3))
3
```

+ Cond
```
[MiniLisp]> (cond [#t 1] [else 0])
1
[MiniLisp]> (cond [(< x 0) (- 0 x)] [(= x 0) 0] [else (+ x 1)])
[Error]: Var 'x' no definida
CallStack (from HasCallStack):
  error, called at ./Interprete.hs:154:18 in main:Interprete
```

### Listas
```
[MiniLisp]> [1, 2, 3]
[1, 2, 3]
[MiniLisp]> [[1, 2], [(3, 4)], #t, (+ 1 2)]
[[1, 2], (3,4), #t, 3]
```

+ Head
```
[MiniLisp]> (head [1, 2, 3])
1
[MiniLisp]> (head [[1, 2], (+ 3 4), #f])
[1, 2]
```

+ Tail
```
[MiniLisp]> (tail [1, 2, 3])
3
[MiniLisp]> (tail [[(+ 1 2)], (* 3 4), #t])
#t
```

### Let, Let*, LetRec

+ Let
```
[MiniLisp]> (let ((x 5)) (+ x 1))
6
[MiniLisp]> (let ((x 2) (y (* x 3))) (+ x y))
8
```

+ Let*
```
[MiniLisp]> (let* ((x 2)) (+ x 3))
5
[MiniLisp]> (let* ((x 2) (y (+ x 3)) (z (* y 2))) (+ x y z))
17
```

+ LetRec
```
[MiniLisp]> (letrec (f (lambda (x) (+ x 1))) (f 2))
3
[MiniLisp]> (letrec (fact (lambda (n) (if0 n 1 (* n (fact (sub1 n)))))) (fact 5))
120
```

### Expresiones Lambda

+ Funciones Lambda
```
[MiniLisp]> (lambda (x) (+ x 1))
#<procedure>
[MiniLisp]> (lambda (x y) (if (> x y) (- x y) (+ x y)))
#<procedure>
```

+ Aplicación de Funciones
```
[MiniLisp]> ((lambda (x) (+ x 1)) 5)
6
[MiniLisp]> ((lambda (f x) (f x)) (lambda (y) (* y y)) 4)
16
```

## Funciones de prueba

+ Factorial:
```
[MiniLisp]> fact 5
120
[MiniLisp]> fact 8
40320
[MiniLisp]> fact 3
6
[MiniLisp]> fact 7
5040
```

+ Suma de los primeros n números naturales:
```
[MiniLisp]> sum 15
120
[MiniLisp]> sum 5
15
[MiniLisp]> sum 50
1275
[MiniLisp]> sum 3
6
```

+ Fibonacci:
```
[MiniLisp]> fibo 12
144
[MiniLisp]> fibo 18
2584
[MiniLisp]> fibo 7
13
[MiniLisp]> fibo 2
1
```
