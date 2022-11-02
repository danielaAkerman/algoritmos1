// gcc -Wall -Wextra -std=c99 arreglos.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>

void pedirArreglo(int a[], int longitud_del_arreglo)
{
    int i = 0;

    while (i < longitud_del_arreglo)
    {
        printf("Ingresa el valor del arreglo en la posicion %i\n", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }
}

void imprimeArreglo(int a[], int longitud_del_arreglo)
{
    printf("El arreglo es ");
    int j = 0;

    while (j < longitud_del_arreglo)
    {
        printf("%i,", a[j]);

        j = j + 1;
    }
}

int main(void)
{
    int longitud_del_arreglo;

    printf("Ingresa la longitud del arreglo\n");
    scanf("%i", &longitud_del_arreglo);

    int a[longitud_del_arreglo];

    pedirArreglo(a, longitud_del_arreglo);

    imprimeArreglo(a, longitud_del_arreglo);

}
