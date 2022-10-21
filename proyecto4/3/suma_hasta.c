// gcc -Wall -Wextra -std=c99 suma_hasta.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int pedirEntero(void)
{
    int x = 0;
    printf("Ingresa un numero entero\n");
    scanf("%d", &x);
    return x;
}

int suma_hasta(int N)
{
    int res;
    res = N * (N + 1) / 2;
    return res;
}

int main(void)
{
    int x;
    int resultado = 0;
    x = pedirEntero();
    if (x >= 0)
    {
        resultado = suma_hasta(x);
        printf("La sumatoria es %i\n", resultado);
    }
    else
    {
        printf("ERROR\n");
    }
    return 0;
}