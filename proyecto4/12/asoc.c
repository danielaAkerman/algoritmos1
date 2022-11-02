// gcc -Wall -Wextra -std=c99 asoc.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

struct asoc
{
    clave_t clave;
    valor_t valor
};

bool asoc_existe(struct asoc a[], int tam, clave_t c)
{
    bool resultado = false;
    int i = 0;

    while (i < tam)
    {
        if (a[i].clave == c)
        {
            resultado = true;
        }
        i = i + 1;
    }

    return resultado;
}

int main(void)
{
    int size;
    int i = 0;
    bool resultado;
    clave_t c;

    printf("Cuantos elementos posee este arreglo? ");
    scanf("%i", &size);

    struct asoc a[size];

    while (i < size)
    {
        printf("Cual es la clave en la posicion %i? ", i);
        scanf(" %c", &a[i].clave);

        printf("Cual es el valor en la posicion %i? ", i);
        scanf("%i", &a[i].valor);

        i = i + 1;
    }

    printf("Cual es la clave a comprobar? ");
    scanf(" %c", &c);

    resultado = asoc_existe(a, size, c);

    if (resultado)
    {

        printf("La clave existe\n");
    }
    else
    {
        printf("La clave NO existe\n");
    }

    return 0;
}