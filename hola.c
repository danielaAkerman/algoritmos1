// gcc -Wall -Wextra -std=c99 hola.c -o holaPrograma
// ./holaPrograma

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

// int main(void)
// {
//     int x, y, z, fac, aux;
//     x = 10;
//     y = 9;
//     z = 23;
//     fac = 1;

//     printf("Ingresa x\n\n");
//     scanf("%d", &x);
//     aux = x;

//     while (x > 0)
//     {
//         fac = fac * x;
//         x = x - 1;
//     }
//     if (true) // Es false
//     {
//         printf("Hola Mundo!\n");
//     }
//     else
//     {
//         printf("Otra cosa\n");
//     }
//     printf("x: %i, y: %i, z: %i\n", x, y, z);
//     printf("El factorial de %i es %i\n", aux, fac);
//     return 0;
// }

// EJERCICIO 1

// int main(void)
// {
//     int x, y, z, res1, res2, res3, res4, res5;

//     // Solicito el ingreso de las variables x, y, z.

//     printf("Ingresa x\n\n");
//     scanf("%d", &x);

//     printf("Ingresa y\n\n");
//     scanf("%d", &y);

//     printf("Ingresa z\n\n");
//     scanf("%d", &z);

//     res1 = x + y + z;
//     res2 = z * z + y * 45 - 15 * x;
//     res3 = y - 2 == (x * 3 + 1) % 5; // Bool
//     res4 = y / 2 * x;
//     res5 = y < x * z; // Bool

//     // Imprimo el resultado de las siguiente expresiones.

//     printf("x es %i, y es %i, z es %i\n", x, y, z);
//     printf("x + y + 1 es %i\n", res1);
//     printf("z * z + y * 45 - 15 * x es %i\n", res2);
//     printf("y - 2 == (x * 3 + 1) mod 5 es el valor booleano %i\n", res3);
//     printf("y / 2 * x es %i\n", res4);
//     printf("y < x * z es el valor booleano %i\n", res5);

//     return 0;
// }
// RESULTADOS
// x es 7, y es 3, z es 5
// x + y + 1 es 15
// z * z + y * 45 - 15 * x es 55
// y - 2 == (x * 3 + 1) mod 5 es el valor booleano 0
// y / 2 * x es 7
// y < x * z es el valor booleano 1

// x es 1, y es 10, z es 8
// x + y + 1 es 19
// z * z + y * 45 - 15 * x es 499
// y - 2 == (x * 3 + 1) mod 5 es el valor booleano 0
// y / 2 * x es 5
// y < x * z es el valor booleano 0

// EJERCICIO 2

// int main(void)
// {
//     int x, y, z, b, w, res1, res2, res3;

//     // Solicito el ingreso de las variables x, y, z.

//     printf("Ingresa x\n\n");
//     scanf("%d", &x);

//     printf("Ingresa y\n\n");
//     scanf("%d", &y);

//     printf("Ingresa z\n\n");
//     scanf("%d", &z);

//     printf("Ingresa b\n\n");
//     scanf("%d", &b);

//     printf("Ingresa w\n\n");
//     scanf("%d", &w);

//     res1 = x % 4 == 0;                      // True
//     res2 = x + y == 0 && y - x == (-1) * z; // True
//     res3 = !b && w;                         // False

//     // Imprimo el resultado de las siguiente expresiones.

//     printf("x es %i, y es %i, z es %i\n", x, y, z);
//     printf("x mod 4 == 0 es el valor booleano %i\n", res1);
//     printf("x + y == 0 && y - x == (-1) * z es el valor booleano %i\n", res2);
//     printf("!b && w es el valor booleano %i\n", res3);

//     // Resultado:
//     // x=4, y=-4 , z=8, b=1, w=1;

//     return 0;
// }

// EJERCICIO 3:
// Traduccion de programas:

// 1A
// int main(void)
// {
//     int x;
//     printf("Ingresa x\n\n");
//     scanf("%d", &x);
//     x = 5;
//     printf("x es %i\n", x);
//     return 0;
// }

// 1B
// int main(void)
// {
//     int x, y;
//     printf("Ingresa x\n\n");
//     scanf("%d", &x);
//     printf("Ingresa y\n\n");
//     scanf("%d", &y);
//     x = x + y;
//     y = y + y;
//     printf("x es %i, y es %i\n", x, y);
//     return 0;
// }

// 1C
// int main(void)
// {
//     int x, y;
//     printf("Ingresa x\n\n");
//     scanf("%d", &x);
//     printf("Ingresa y\n\n");
//     scanf("%d", &y);
//     y = y + y;
//     x = x + y;
//     printf("x es %i, y es %i\n", x, y);
//     return 0;
// }

// RESULTADOS
// 1.a ejecución 1 = Ingreso: x = 900              - Salida:  x = 5; 
// 1.a ejecución 2 = Ingreso: x = 234              - Salida:  x = 5; 
// 1.a ejecución 3 = Ingreso: x = 555              - Salida:  x = 5; 
// 1.b ejecución 1 = Ingreso: x = 8 ,    y= 9      - Salida:  x = 17 ,   y= 18   
// 1.b ejecución 2 = Ingreso: x = 2 ,    y= 10     - Salida:  x = 12 ,   y= 20   
// 1.b ejecución 3 = Ingreso: x = 8 ,    y= 800    - Salida:  x = 808 ,  y= 1600   
// 1.c ejecución 1 = Ingreso: x = 44 ,   y= 600    - Salida:  x = 1244 , y= 1200   
// 1.c ejecución 2 = Ingreso: x = 1000 , y= 1      - Salida:  x = 1002 , y= 2   
// 1.c ejecución 3 = Ingreso: x = 6 ,    y= 0      - Salida:  x = 6 ,    y= 0   

