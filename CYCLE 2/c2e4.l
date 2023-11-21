%{
#include<stdio.h>
int intgr=0;
int st=0;
int id=0;
int rel=0;
int key=0;
int assign=0;

%}
%%
"int"|"float"|"char"|"double"|"void"|"if"|"else"|"while"|"for"|"do"|"return"|"break"|"continue" {key++;}
[0-9]+ {intgr++;}
[#][a-zA-Z<>.]* {}
[a-zA-Z][a-zA-Z0-9]* {id++;}
[=] {assign++;}
[<|<[=]*|>=*|>] {rel++;}
[;] {st++;}
. {}
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("NUMBER OF STATEMENTS : %d\n",st);
	printf("NUMBER OF IDENTIFIER : %d\n",id);
	printf("NUMBER OF ASSIGNMENT OPERATOR : %d\n",assign);
	printf("NUMBER OF RELATIONAL OPERATOR: %d\n",rel-2);
	printf("NUMBER OF KEYWORDS: %d\n",key);
	printf("NUMBER OF INTEGERS: %d\n",intgr);
	return 0;
}

