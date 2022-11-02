// gcc -Wall -Wextra -std=c99 minimos.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>

int minimo_pares(int a[], int tam)
{
    int i = 0;
    int j = 0;

    while (i < tam)
    {
        if (a[i] % 2 != 0)
        {
            a[i] = INT_MAX;
        }
        i = i + 1;
    }

    int menor = a[0];

    while (j + 1 < tam)
    {
        if (menor > a[j + 1])
        {
            menor = a[j + 1];
        }

        j = j + 1;
    }
    printf("\n\nEl minimo elemento par es %i\n\n", menor);
    return menor;
}

int minimo_impares(int b[], int tam)
{
    int i = 0;
    int j = 0;

    while (i < tam)
    {
        if (b[i] % 2 == 0)
        {
            b[i] = INT_MAX;
        }
        i = i + 1;
    }

    int menor = b[0];

    while (j + 1 < tam)
    {
        if (menor > b[j + 1])
        {
            menor = b[j + 1];
        }

        j = j + 1;
    }
    printf("El minimo elemento impar es %i\n\n", menor);
    return menor;
}

int main(void)
{
    int size = 7;
    int a[size];
    int b[size];

    int i = 0;
    int j = 0;
    int par, impar;

    while (i < size)
    {
        printf("Ingresa el valor en la posicion %i: ", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }

    while (j < size)
    {
        b[j] = a[j];
        j = j + 1;
    }

    par = minimo_pares(a, size);
    impar = minimo_impares(b, size);

    if (par <= impar)
    {
        printf("El minimo elemento del arreglo es: %i ", par);
    }
    else
    {
        printf("El minimo elemento del arreglo es: %i ", impar);
    }
    return 0;
}
