/* description: Parses end executes mathematical expressions. */
/* operator associations and precedence */

 /* (a=4)=4 o a=(b=4)  debe ser de derecha ya que es la asignacion correcta */
 /* Poner lista de sentencias y subirlo al campus */

%right '='
%left '+' '-'
%left '*' '/'
%right '^'
%nonassoc '%'
%left UMINUS
%nonassoc '!'

 /* Cuantos mas bajo en el texto mas precedencia.*/
 /* left y right. Cuando la regla y el token que se presenta tienen la misma precedencia se utiliza left y right. */ 
 /* El unico que tiene la misma precedencia del igual es el igual */

%{
var symbolTable = {}; /* Esta vacio por que no tiene ninguna variable*/
%}

%start expressions

%% /* language grammar */

expressions
    : s
      { $$ = typeof $1 == 'undefined'? [] : [$1]; }
    | expressions ';' s
      {
        $$ = $1;
        if($3) $$.push($3);
          console.log($$);
      }
    ;

s
    : /* empty */
    | e
    ;

e
  
    
/* e '=' e da mucha potencia ya que puedes poner 4=5 . La parte izquierda de  */
/*la asignacion tiene que ser asignable, se llama un left value. lo*/
/*que esta en la parte izquierda tiene que ser una referencia a memoria. */
/*Como en la parte izquierda no tendremos array no necesitamos una*/
/*categoria gramatical. A nosotros nos basta con un identificador.*/
        
        /* REGLA 1 . ¿Cual seria la accion semantica?*/
        /* Estamos asociando un caracter a un valor y no se puede, necesitamos una memoria (un hash) . En JS no existen por que*/
        /* son lo mas comun del mundo. Debemos tener un objeto y tiene que estar visible en las acciones semanticas. ¿Donde lo ponemos? En la cabecera*/
        /* en un inicializer*/
    : ID '=' e                          
        {$$ = (symbolTable[$1] = $3);}  
    
    | e '+' e
        {$$ = $1+$3;}
    | e '-' e
        {$$ = $1-$3;}
    | e '*' e
        {$$ = $1*$3;}
    | e '/' e
        {$$ = $1/$3;}
    | e '^' e
        {$$ = Math.pow($1, $3);} 
    | e '!'
        {
          $$ = (function fact (n) { return n==0 ? 1 : fact(n-1) * n })($1);
        }
    | e '%'
        {$$ = $1/100;}
    | '-' e %prec UMINUS
        {$$ = -$2;}
    | '(' e ')'
        {$$ = $2;}
    | NUMBER
        {$$ = Number(yytext);}
        
    /*REGLA 2*/
    /* Devolveremos el symbolTable correspondiente al valor que se ha almacenado antes */
    | ID 
        { $$ = symbolTable[$1];}  
    | E
        {$$ = Math.E;}
    | PI
        {$$ = Math.PI;}
    ;

/*ERROR: conflicto o ambiguedad en la gramatica y no puede generar el parser. Hay que ver si hay ambiguedad o no. O desplazamos el token +.*/
/*a = 4 +5 es ambigua, se puede ver de dos forma y se ha dado cuenta. (a=4)+5 o a=(4+5). Aqui hay que desplazar y asociar a derechas. Tiene que ganar el token*/
/*+ para que se desplaze. El token igual no tiene ninguna precedencia y el token + tambien. La regla no tiene ninguna precedencia. Hay que ponersela*/









