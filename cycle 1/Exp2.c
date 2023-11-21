#include<stdio.h>
#include<string.h>

int main()
{
int state=0,final=3;
char str[50];
printf("enter the string:");
scanf("%s",str);
int n=strlen(str);

for(int i=0;i<n;i++)
{
	switch(state)
{
	case 0:
	if(str[i]=='a')state=1;
	else if(str[i]=='b'||str[i]=='c')state=0;
	else{
	printf("invalid\n");
	return 0;
	}
	break;
	case 1:
	if(str[i]=='a')state=1;
	else if(str[i]=='b')state=2;	
	else if(str[i]=='c')state=0;
	else{
	printf("invalid\n");
	return 0;
	}
	break;
	case 2:
	if(str[i]=='a')state=1;
	else if(str[i]=='b')state=0;
	else if(str[i]=='c')state=3;
	else{printf("invalid \n");
	return 0;
	}
	break;
	case 3:
	if(str[i]=='a'||str[i]=='b'||str[i]=='c')state=3;
	else{printf("invalid \n");
	return 0;
	}
	break;
	}
}

if(state==final)
{
	printf("string accepted");
}
else{
printf("string not accepted");
}
return 0;
}
