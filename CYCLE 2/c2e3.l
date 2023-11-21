%{
#include<stdio.h>
int character=0;
int word=0;
int line=0;
%}
%%
[a-zA-Z] {character++;}
[ ] {word++;}
[\n] {word++;line++;}
. {}
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("NUMBER OF CHARACTRS : %d\n",character);
	printf("NUMBER OF WORDS : %d\n",word);
	printf("NUMBER OF LINES : %d\n",line);
	return 0;
}

