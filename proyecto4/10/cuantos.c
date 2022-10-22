// gcc -Wall -Wextra -std=c99 cuantos.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem)
{
    int i = 0;
    struct comp_t resultado;

    resultado.menores = 0;
    resultado.iguales = 0;
    resultado.mayores = 0;

    while (i < tam)
    {
        if (a[i] < elem)
        {
            resultado.menores = resultado.menores + 1;
        }
        if (a[i] == elem)
        {
            resultado.iguales = resultado.iguales + 1;
        }
        if (a[i] > elem)
        {
            resultado.mayores = resultado.mayores + 1;
        }
        i = i + 1;
    }

    return resultado;
}

int main(void)
{
    int size;
    int i = 0;
    int elem = 0;
    struct comp_t resultado;

    printf("Cuantos elementos posee este arreglo? ");
    scanf("%i", &size);

    int a[size];

    while (i < size)
    {
        printf("Cual es el valor en la posicion %i? ", i);
        scanf("%i", &a[i]);
        i = i + 1;
    }

    printf("Cual es el numero que vamos a comparar? ");
    scanf("%i", &elem);

    resultado = cuantos(a, size, elem);

    printf("Los menores son %i\n", resultado.menores);
    printf("Los iguales son %i\n", resultado.iguales);
    printf("Los mayores son %i\n", resultado.mayores);

    return 0;
}