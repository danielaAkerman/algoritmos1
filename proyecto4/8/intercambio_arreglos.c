// gcc -Wall -Wextra -std=c99 intercambio_arreglos.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>

void intercambiar(int a[], int tam, int i, int j)
{
    int iaux, jaux, index = 0;

    iaux = a[i];
    jaux = a[j];

    a[i] = jaux;
    a[j] = iaux;

    printf("El arreglo modificado es: ");

    while (index < tam)
    {
        printf(" %i", a[index]);
        index = index + 1;
    }
}

int main(void)
{
    int size = 7;
    int a[size];
    int i = 0;
    int seleccion1 = 0;
    int seleccion2 = 0;

    while (i < size)
    {
        printf("Ingresa el valor en la posicion %i: ", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }
    printf("Ingresa una posicion del arreglo (del 0 al 6)");
    scanf("%i", &seleccion1);

    printf("Ingresa otra posicion del arreglo (del 0 al 6)");
    scanf("%i", &seleccion2);

    if (seleccion1 < size && seleccion2 < size)
    {
        intercambiar(a, size, seleccion1, seleccion2);
    }

    return 0;
}