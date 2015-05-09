%%
expressions
    : exp EOF
        { typeof console !== 'undefined' ? console.log($1) : print($1);
          return $1; }
    ;

exp:      NUMBER          { $$ = Number(yytext);}
        | exp exp '+'     { $$ = $1 + $2;    }
        | exp exp '-'     { $$ = $1 - $2;    }
        | exp exp '*'     { $$ = $1 * $2;    }
        | exp exp '/'     { $$ = $1 / $2;    }
          /* Exponentiation */
        | exp exp '^'     { $$ = Math.pow ($1, $2); }
          /* Unary minus    */
        | exp 'n'         { $$ = -$1;        }
;
%%
