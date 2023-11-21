#include <stdio.h>
#include <string.h>

int main() {
    int currentState = 0;
    int flag = 0;
    char inputString[100];
    int matrix[5][2] = {{1, 3}, {2, 4}, {4, 3}, {1, 3}, {4, 4}};

    printf("Enter a Binary String: ");
    scanf("%s", inputString);

    int length = strlen(inputString);
    for (int i = 0; i < length; i++) {
        int inputBit = inputString[i] - '0';
        currentState = matrix[currentState][inputBit];

        if (currentState == 3) {
            flag = 1;
        }
        if (currentState == 4) {
            flag = 0;
            break;
        }
    }

    if (flag == 1) {
        printf("\nAccepted");
    } else {
        printf("\nRejected");
    }

    return 0;
}
