%{

#include <stdio.h>

%}

exp1 [a-zA-Z]+
exp2 [0-9]+
exp3 " "

%%

{exp1} {fprintf(yyout,"%s ",yytext);}
{exp2} {continue;}
{exp3} {}
. {}

%%

int yywrap(void){}
int main()
{
    yyin=fopen("test_file.txt","r");
    yyout=fopen("test_file_out.txt","w");
    yylex();

    return 0;
}
