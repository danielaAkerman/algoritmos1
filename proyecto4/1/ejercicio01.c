// gcc -Wall -Wextra -std=c99 ejercicio01.c -o hola1
// ./hola1

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void holaHasta(int n)
{
    int i = n;
    while (i > 0)
    {
        printf("Hola\n");
        i = i - 1;
    }
}

int pedirEntero(void)
{
    int x = 0;
    printf("Ingresa x\n");
    scanf("%d", &x);
    return x;
}

int main(void)
{
    int x = 0;
    x = pedirEntero();
    assert(x > 0);
    holaHasta(x);
    return 0;
}