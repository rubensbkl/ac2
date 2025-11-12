#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    clock_t inicio, fim;
    float Tempo, media = 0;
    int c;
    int k;
    unsigned char num1 = 1, num2 = 3;

    const int N = 10000000;

    for (k = 1; k <= 10; k = k + 1)
    {
        unsigned char i = num1;
        unsigned char j = num2;

        inicio = clock();

        /* ---------- DESCOMENTE APENAS UMA DAS LINHAS ABAIXO PARA RODAR O TESTE ---------- */

        // 0) Atribuição com variável: i = j; (TEMPO BASE)
        for (c = 1; c <= N; c = c + 1) i = j;

        // 1) Soma com constante: i = i + 3;
        // for (c = 1; c <= N; c = c + 1) i = i + 3;

        // 2) Soma com variável: i = i + j;
        // for (c = 1; c <= N; c = c + 1) i = i + j;

        // 3) Multiplicação com constante: i = i * 3;
        // for (c = 1; c <= N; c = c + 1) i = i * 3;

        // 4) Multiplicação com variável: i = i * j;
        // for (c = 1; c <= N; c = c + 1) i = i * j;

        // 5) OR bitwise com constante: i = i | 3;
        // for (c = 1; c <= N; c = c + 1) i = i | 3;

        // 6) OR bitwise com variável: i = i | j;
        // for (c = 1; c <= N; c = c + 1) i = i | j;

        /* --------------------------------------------------------------------------------- */

        fim = clock();

        /* imprimir (promova para int para exibir) */
        printf("\nResultado (char as int): %d", (int)i);

        Tempo = ((fim - inicio) * 1000.0 / CLOCKS_PER_SEC);
        printf("\nTempo: %g ms.", Tempo);

        media = media + Tempo;
    }

    printf("\nTempo gasto médio: %g ms.\n", media / 10);

    return 0;
}