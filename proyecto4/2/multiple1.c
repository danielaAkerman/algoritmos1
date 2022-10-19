// gcc -Wall -Wextra -std=c99 multiple1.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

// {Pre: x = X, y = Y}
// x, y := x + 1, x + y
// {Post: x = X + 1, y = X + Y}

void imprimirResultado(int x, int y)
{
    printf("El valor de x es %i\n", x);
    printf("El valor de y es %i\n", y);
}
int main(void)
{
    int x = 0;
    int y = 0;
    int X, Y;
    printf("Ingresa x\n");
    scanf("%d", &x);
    printf("Ingresa y\n");
    scanf("%d", &y);

    X = x;
    Y = y;

    assert(x == X && y == Y);

    x = X + 1;
    y = X + Y;

    assert(x == X + 1 && y == X + Y);

    imprimirResultado(x, y);
}