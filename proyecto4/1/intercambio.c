// gcc -Wall -Wextra -std=c99 intercambio.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

void imprimirResultado(int x, int y)
{
    printf("El valor de x es %i\n", x);
    printf("El valor de y es %i\n", y);
}

int main(void)
{
    int x = 0;
    int y = 0;
    int z = 0;
    printf("Ingresa el valor de x\n");
    scanf("%d", &x);
    printf("Ingresa el valor de y\n");
    scanf("%d", &y);
    assert(true);
    z = x;
    x = y;
    y = z;
    assert(true);

    imprimirResultado(x, y);
}