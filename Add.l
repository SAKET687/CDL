%{
#include<stdio.h>
#include<stdlib.h>
int size, i;
int arr1[100], arr2[100], result[100];
int count1 = 0, count2 = 0, step = 0;

void printArray(int arr[], int size) {
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}
%}
%%
[0-9]+ {
    if (step == 0) {
        size = atoi(yytext); // Read size
        step++;
        printf("Size of arrays: %d\n", size);
    } else if (step == 1) {
        arr1[count1++] = atoi(yytext); // Read elements of array 1
        if (count1 == size) {
            step++;
            printf("Array 1 input completed.\n");
        }
    } else if (step == 2) {
        arr2[count2++] = atoi(yytext); // Read elements of array 2
        if (count2 == size) {
            step++;
            printf("Array 2 input completed.\n");
        }
    }

    if (step == 3) {
        // Calculate the resultant array
        for (i = 0; i < size; i++) {
            result[i] = arr1[i] + arr2[i];
        }
        printf("Resultant Array: ");
        printArray(result, size);
        step++;
    }
}
.|\n { /* Ignore other characters */ }
%%
int main()
{
    printf("Enter the size of arrays followed by elements of Array 1 and Array 2:\n");
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
