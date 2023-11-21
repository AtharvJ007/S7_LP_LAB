%{
#include<stdio.h>
int consonent=0,vowel=0;
%}
%%
[aeiouAEIOU] {vowel++;}
[a-zA-Z] {consonent++;}
. {}
%%

int yywrap()
{
	return 1;
}

int main()
{
	yylex();
	printf("Number of vowels : %d\n",vowel);
	printf("Number of consonets : %d\n",consonent);
	return 0;
}

