// gcc -Wall -Wextra -std=c99 stats.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>

struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam)
{
    // calcula el mínimo, el máximo, y el promedio de un arreglo no vacío de números float
    // un único ciclo

    int i = 0;
    float suma_elementos = 0;
    struct datos_t resultado;

    resultado.maximo = a[0];
    resultado.minimo = a[0];
    resultado.promedio = 0;

    while (i < tam)
    {
        if (a[i] > resultado.maximo)
        {
            resultado.maximo = a[i];
        }
        if (a[i] < resultado.minimo)
        {
            resultado.minimo = a[i];
        }

        suma_elementos = suma_elementos + a[i];

        i = i + 1;
    }

    resultado.promedio = suma_elementos / tam;

    return resultado;
}

int main(void)
{
    int size;
    int i = 0;
    struct datos_t resultado;

    printf("Cuantos elementos posee este arreglo? ");
    scanf("%i", &size);

    float a[size];

    while (i < size)
    {
        printf("Cual es el valor en la posicion %i? ", i);
        scanf("%f", &a[i]);
        i = i + 1;
    }

    resultado = stats(a, size);

    printf("Valor maximo %.2f\n", resultado.maximo);
    printf("Valor minimo %.2f\n", resultado.minimo);
    printf("Promedio %.2f\n", resultado.promedio);

    return 0;
}
