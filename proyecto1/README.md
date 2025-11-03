# MiniLisp

Proyecto Minilisp con el propósito de recorrer las etapas fundamentales de la formalización de un lenguaje de programación: desde la definici ́on de su sintaxis l ́exica y libre de contexto, pasando por la eliminación de azpúcar sintáctica y la construcción de la sintaxis abstracta, hasta la especificación de su semántica operacional en estilo estructural:

El presente proyecto cuenta con la siguiente estructura:

```
 [proyecto1/] >
.
├── README.md
├── reporte
│   ├── cap1.tex
│   ├── cap2.tex
│   ├── cap3.tex
│   ├── cap4.tex
│   ├── cap5.tex
│   ├── cap6.tex
│   ├── cap7.tex
│   ├── cap8.tex
│   ├── portada.tex
│   └── reporte.tex
└── src
    ├── ASA.hs
    ├── AST.hs
    ├── ASV.hs
    ├── Desugar.hs
    ├── EvalStrict.hs
    ├── Grammar.y
    ├── Interprete.hs
    ├── Lexer.x
    ├── MiniLisp.hs
    ├── Saca.hs
    └── Token.hs
```

**src/**: Código fuente de MiniLisp.
**reporte/**: Archivos LaTeX y PDF del reporte final


## Reporte

El directorio `reporte/` contiene el informe técnico dividido por capítulos en archivos `.tex`, junto con el PDF final **Reporte_MiniLisp.pdf**.

Para compilar el reporte manualmente:

```
pdflatex -shell-escape reporte.tex
```

Si se presentan errores por falta de paquetes de `LaTeX`, instale los siguientes paquetes (el comando de instalación varía entre distribuciones Linux):

### RedHat

```
```

Si aún aparecen errores después de instalar los paquetes, pruebe compilando nuevamente el archivo `reporte.tex`. De cualquier modo, el archivo **Reporte_MiniLisp.pdf** ya se incluye como versión final precompilada.
