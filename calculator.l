/* lexical grammar */
%%

\s+                   /* skip whitespace */
[0-9]+("."[0-9]+)?\b  return 'NUMBER'
"PI"                  return 'PI'
"E"                   return 'E'
[a-zA-Z_]\w*          return 'ID'     /* retornamos el token identificador */
"*"                   return '*'
"/"                   return '/'
"-"                   return '-'
"+"                   return '+'
"^"                   return '^'
"!"                   return '!'
"%"                   return '%'
"("                   return '('
")"                   return ')'
"="                   return '='      /* permitimos que acepte el =*/
";"                   return ';'      /* permitimos que acepte el ; */
<<EOF>>               return 'EOF'
.                     return 'INVALID'


/* Esta mal, las palabras reservadas son identificadores y PI y E, la idea es que cuando se vea PI y E se devuelvan los token correspondientes. Hay que
poner todas las palabras reservadas antes del token ID ya que las absorbe todas*/


/* /b es el borde de la palabra */


/*Seccion de inicializer, hemos creado un objeto que contiene todas las palabras reservadas. Si la palabra reservada esta en este objeto la devolvemos*/
