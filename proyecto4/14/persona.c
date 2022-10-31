// gcc -Wall -Wextra -std=c99 persona.c -o hola
// ./hola

// unsigned int:
// Le indica a la variable que no va a llevar signo (sin valores negativos)

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

typedef struct
{
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

// Las tres funciones toman como argumento un arreglo de personas y su longitud.
float peso_promedio(persona_t arr[], unsigned int longitud)
{
    float suma = 0;
    int i = 0;

    while (i < longitud)
    {
        suma = suma + arr[i].peso;
        i = i + 1;
    }

    float promedio = suma / longitud;

    return promedio;
}

persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud)
{
    persona_t mayor = arr[0];
    int i = 0;

    while (i < longitud)
    {
        if (mayor.edad < arr[i + 1].edad)
        {
            mayor = arr[i + 1];
        }
        i = i + 1;
    }
    return mayor;
}

persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud)
{
    persona_t baja = arr[0];
    int i = 0;

    while (i < longitud)
    {
        if (baja.altura > arr[i + 1].altura)
        {
            baja = arr[i + 1];
        }
        i = i + 1;
    }
    return baja;
}

int main(void)
{
    persona_t p1 = {"Paola", 21, 1.85, 75};
    persona_t p2 = {"Luis", 54, 1.75, 69};
    persona_t p3 = {"Julio", 40, 1.70, 80};

    unsigned int longitud = 3;

    persona_t arr[] = {p1, p2, p3};

    printf("El peso promedio es %f\n", peso_promedio(arr, longitud));

    persona_t p = persona_de_mayor_edad(arr, longitud);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);

    p = persona_de_menor_altura(arr, longitud);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);

    return 0;
}