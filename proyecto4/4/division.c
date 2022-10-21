// gcc -Wall -Wextra -std=c99 division.c -o hola
// ./hola

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

struct div_t
{
    int fst;
    int snd;
}; //PUNTO Y COMA

struct div_t division(int dividendo, int divisor)
{
    struct div_t div;
    div.fst = dividendo / divisor;
    div.snd = dividendo % divisor;

    return div;
}

int main(void)
{
    int dividendo, divisor, cociente, resto;
    struct div_t resultado;

    printf("Ingresa dividendo\n");
    scanf("%d", &dividendo);
    printf("Ingresa divisor distinto de cero\n");
    scanf("%d", &divisor);

    if (divisor == 0)
    {
        printf("ERROR\n");
    }
    else
    {
        resultado = division(dividendo, divisor);
        cociente = resultado.fst;
        resto = resultado.snd;

        printf("El cociente es %i y el resto es %i\n", cociente, resto);
    }
    return 0;
}