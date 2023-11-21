%{
#include <stdio.h>
#include <stdlib.h>

int yyerror(char *);
int yylex();
%}

%token NUM
%token IDENTIFIER
%token PLUSPLUS MINUSMINUS
%token FOR
%token LESS LESSEQUAL GREATER GREATEREQUAL EQUAL NOTEQUAL
%token AND OR

%%

for_loop : FOR '(' init_expr  ';' condition ';' incr_list ')' '{' '}'  { printf("Valid for loop\n"); exit(0); }
        | FOR '(' init_expr  ';' condition ';' incr_list ')'  { printf("Valid for loop\n");exit(0);}
        ;

init_expr : init_expr ',' init_assign
          | init_assign
          ;

init_assign : IDENTIFIER '=' NUM
            ;

condition : condition AND condition
          | condition OR condition
          | expression LESS expression
          | expression LESSEQUAL expression
          | expression GREATER expression
          | expression GREATEREQUAL expression
          | expression EQUAL expression
          | expression NOTEQUAL expression
          ;

incr_list : incr_list ',' incr
          | incr
          ;

incr : IDENTIFIER PLUSPLUS
     | IDENTIFIER MINUSMINUS
     | IDENTIFIER '=' expression
     | expression
     ;

expression : NUM
           | IDENTIFIER
           | expression '+' expression
           | expression '-' expression
           | expression '*' expression
           | expression '/' expression
           | '(' expression ')'
           | 
           ;



%%

int yyerror(char *s){
    printf("Invalid\n");
    exit(-1);
}

int main(){
    printf("Enter for loop: ");
    yyparse();
    return 0;
}




