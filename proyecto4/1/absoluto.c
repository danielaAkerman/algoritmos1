// gcc -Wall -Wextra -std=c99 absoluto.c -o hola
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
void imprimirResultado(int z)
{
    printf("El valor absoluto es %i\n", z);
}
int main(void)
{
    int x = 0;
    int z = 0;
    x = pedirEntero();
    z = x;
    assert(true);
    if (x < 0)
    {
        z = -x;
    }
    assert(z >= 0);
    imprimirResultado(z);
    return 0;
}