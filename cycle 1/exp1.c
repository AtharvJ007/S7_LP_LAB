#include <stdio.h>

int transition(int state, char input) 
{
    if (state == 0 && input == '0')
    {
        return 1;
    }
    else if (state == 1 && input == '0')
    {
        return 2;
    }
    else if (state == 2 && input == '0')
    {
        return 2;
    }
    else
    {
        return 0;
	}
}

int main() 
{
    int currentState = 0;
    char inputString[100];
    printf("Enter a Binary String: ");
    scanf("%s", inputString);
    for(int i=0;inputString[i]!='\0';i++) 
    {
    	if(inputString[i]=='0' || inputString[i]=='1')
    	{
        	currentState = transition(currentState, inputString[i]);
        }
        else
        {
        	goto x;
        }
    }
    if (currentState == 2) 
    {
        printf("Accepted");
    } 
    else 
    {
    	x:
        printf("Rejected");
    }
    return 0;
}

