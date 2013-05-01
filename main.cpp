#include <stdio.h>
extern int yyparse();

int main(int argc, char **argv)
{
        yyparse();
        return 0;
}

void yyerror(const char *s)
{
        printf("ERROR: %s\n", s);
}
