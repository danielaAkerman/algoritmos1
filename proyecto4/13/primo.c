// gcc -Wall -Wextra -std=c99 primo.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

bool esprimo(p)
{
    int divisor = 2;
    bool respuesta = true;

    while (divisor < p)
    {
        if (p % divisor == 0) // Si tiene divisor NO es primo
        {
            respuesta = false;
            return respuesta;
        }
        else
        {
            divisor = divisor + 1;
        }
    }

    return respuesta;
}

int nesimo_primo(int N)
{
    int un_primo = 1;
    int orden_primo = 1;
    int numero_actual = 1;

    while (N > orden_primo) // cuando no se cumpla es porque el Nsimo es el q tengo ahora
    {
        numero_actual = numero_actual + 1; // subo el actual porque lo q tengo no es

        if (esprimo(numero_actual))
        {
            orden_primo = orden_primo + 1;
            un_primo = numero_actual;
        }
    }
    // Dejo de entrar al ciclo porque el orden del primo es el enésimo.
    return un_primo;
}

int main(void)
{
    int n, resultado;

    printf("Ingresa el orden del numero primo requerido: ");
    scanf("%i", &n);

    while (n < 1)
    {

        printf("El orden del numero primo requerido debe ser un valor positivo natural: ");
        scanf("%i", &n);
    }

    resultado = nesimo_primo(n);

    printf("El numero es %i \n", resultado);

    return 0;
}