/*YAAC FILE*/

%{
#include<stdio.h>
%}
%{
#include <stdio.h>
#include <stdlib.h>
%}

%token num alpha LT GT EQ LE GE NE AND OR INC DEC END
%left '+' '-'
%left '*' '/'
%right '^'
%right '='
%nonassoc UMINUS
%nonassoc IF
%nonassoc ELSE
%left GE NE LT GT LE EQ
%left AND OR

%%

S: ST END { printf("\nAccepted\n"); exit(0); }
  ;

ST: IF '(' F ')' '{' ST '}' %prec IF
  | IF '(' F ')' '{' ST '}' ELSE '{' ST '}'
  | E ';' ST
  | E ';'
  ;

F: C LO C
  | C
  ;

LO: AND
   | OR
   ;

C: E RELOP E
  | E
  ;

E: alpha '=' E
  | E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | E '^' E
  | '(' E ')'
  | '-' E %prec UMINUS
  | alpha
  | num
  | alpha INC
  | alpha DEC
  ;

RELOP: LT
     | GT
     | EQ
     | LE
     | GE
     | NE
     ;

%%

int main()
{
    printf("Enter the expression\n");
    yyparse();
    yylex();
    return END;
}

void yyerror(char *s)
{
    printf("\nError\n");
}


