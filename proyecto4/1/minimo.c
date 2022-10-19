// gcc -Wall -Wextra -std=c99 minimo.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void imprimirMinimo(int z)
{
    printf("El minimo es %i\n", z);
}

int main(void)
{
    int x = 0;
    int y = 0;
    int z = 0;
    printf("Ingresa x\n");
    scanf("%d", &x);
    printf("Ingresa y\n");
    scanf("%d", &y);
    assert(x >= 0 && y >= 0);
    z = x;
    if (y < x)
    {
        z = y;
    }
    assert(x >= z && y >= z);
    imprimirMinimo(z);
    return 0;
}