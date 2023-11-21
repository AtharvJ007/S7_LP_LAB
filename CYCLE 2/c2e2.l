%{
#include<stdio.h>
int flag1=0,flag2=0;

%}
%%
aa[a|b]*bb {flag1++;}
[0|1]*000[0|1]* {flag1++;}
. {flag2=-1;}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the Regular expression : ");
	
	yylex();
	if(flag2==-1)
	{
		printf("NOT VALID\n");
		return 0;
	}
	if(flag1==1)
	{
		printf("VALID\n");
	}
	else
	{
		printf("NOT VALID\n");
	}
	return 0;
}

