/*
 *
 */

%{
#include <stdlib.h>
#include "rpcalc.hpp"
extern "C" int yywrap() { }
%}

%%
[ \t]
[0-9]+                  { yylval = atoi(yytext); return NUMBER; }
[+\-*/\n]                 return *yytext;
.                       
%%
