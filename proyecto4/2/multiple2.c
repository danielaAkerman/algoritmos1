// gcc -Wall -Wextra -std=c99 multiple2.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

void imprimirResultado(int x, int y, int z)
{
    printf("El valor de x es %i\n", x);
    printf("El valor de y es %i\n", y);
    printf("El valor de z es %i\n", z);
}
int main(void)
{
    int x = 0;
    int y = 0;
    int z = 0;
    int X, Y, Z;

    printf("Ingresa x\n");
    scanf("%d", &x);
    printf("Ingresa y\n");
    scanf("%d", &y);
    printf("Ingresa z\n");
    scanf("%d", &z);

    X = x;
    Y = y;
    Z = z;

    assert(x == X && y == Y && z == Z);

    x = Y;
    y = X + Y + Z;
    z = Y + X;

    assert(x == Y && y == Y + X + Z && z == Y + X);
    
    imprimirResultado(x, y, z);
}