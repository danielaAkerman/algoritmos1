// gcc -Wall -Wextra -std=c99 sumatoria.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>

int sumatoria(int a[], int tam)
{
    int j = 0;
    int resultado = 0;
    while (j < tam)
    {
        resultado = resultado + a[j];
        j = j + 1;
    }
    printf("Sumatoria: %i", resultado);
    return 0;
}

int main(void)
{
    int size = 7;
    int a[size];
    int i = 0;

    while (i < size)
    {
        printf("Ingresa el valor en la posicion %i: ", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }
    sumatoria(a, size);
}
