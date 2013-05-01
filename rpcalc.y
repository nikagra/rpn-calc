/* 
 * Reverse polish notation calculator.
 */

%{
    #include <stdio.h>
    int yylex (void);
    void yyerror (char const *);
%}

%token NUMBER

/* 
 *Grammar rules and actions follow.
 */
%%
input:
      /* empty */
    | input line
    ;
 
line:
      '\n'
    | expr '\n'      { printf("%d\n", $1); }
    ;
     
expr:
      NUMBER          { $$ = $1;           }
    | expr expr '+'   { $$ = $1 + $2;      }
    | expr expr '-'   { $$ = $1 - $2;      }
    | expr expr '*'   { $$ = $1 * $2;      }
    | expr expr '/'   { $$ = $1 / $2;      }
    ;
%%
