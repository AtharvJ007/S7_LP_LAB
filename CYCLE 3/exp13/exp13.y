/*YAAC FILE*/

%{
#include<stdio.h>
%}


%token NUMBER ID                       
%left '+' '-'                                           
%left '*' '/'
%%

expr: expr '+' expr                                
     |expr '-' expr
     |expr '*' expr
     |expr '/' expr
     |'-'NUMBER
     |'-'ID
     |'('expr')'
     |NUMBER
     |ID
     ;
%%


main()
{
printf("Enter the expression\n");
yyparse();
printf("Expression is valid\n");
exit(0);
}

int yyerror(char *s)
{
printf("Expression is invalid\n");
exit(0);
}
