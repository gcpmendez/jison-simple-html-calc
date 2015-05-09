# Simple example in the browser using jison.

* run `rake` to produce `calculator.js`
* lexical analysis in a separated file

See gh-page at 
[//crguezl.github.io/jison-simple-html-calc](//crguezl.github.io/jison-simple-html-calc)

# Práctica: Secuencia de Asignaciones Simples

Modifique este ejemplo para que el lenguaje acepte una secuencia
de sentencias de asignación de la forma 
`ID = NUM` separadas por
puntos y comas, por ejemplo `a = 4; b = 4.56; c = -8.57e34`. El
analizador retorna un hash/objeto cuyas claves son los identificadores
y cuyos valores son los números. 

Modifique los analizadores léxico y sintáctico de forma conveniente.

Añada acciones semánticas para que el analizador devuelva una tabla de símbolos con los identificadores y sus valores.
