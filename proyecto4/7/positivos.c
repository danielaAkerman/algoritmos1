// gcc -Wall -Wextra -std=c99 positivos.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

bool existe_positivo(int a[], int tam)
{
    int i = 0;
    int res = 0;

    while (i < tam)
    {
        if (a[i] >= 0)
        {
            res = res + 1;
        }
        i = i + 1;
    }
    if (res > 0)
    {
        printf("Verdadero");
    }
    else
    {

        printf("Falso");
    }
    return true;
}

bool todos_positivos(int a[], int tam)
{
    int i = 0;
    int res = 0;

    while (i < tam)
    {
        if (a[i] >= 0)
        {
            res = res + 1;
        }
        i = i + 1;
    }
    if (res == tam)
    {
        printf("Verdadero");
    }
    else
    {

        printf("Falso");
    }
    return true;
}

int main(void)
{
    int size = 7;
    int a[size];
    int i = 0;
    int seleccion = 0;

    while (i < size)
    {
        printf("Ingresa el valor en la posicion %i: ", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }

    printf("Ingresa 1 para saber si existe un positivo\n");
    printf("Ingresa 2 para saber si todos son positivos\n");
    scanf("%i", &seleccion);

    if (seleccion == 1)
    {
        existe_positivo(a, size);
    }
    if (seleccion == 2)
    {
        todos_positivos(a, size);
    }
    return 0;
}