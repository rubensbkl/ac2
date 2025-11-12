#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    clock_t inicio, fim;
    float Tempo, media = 0;
    int c;
    int k;
    float num1 = 1.0f, num2 = 3.0f;

    const int N = 10000000;

    for (k = 1; k <= 10; k = k + 1)
    {
        float i = num1;
        float j = num2;

        inicio = clock();

        /* ---------- DESCOMENTE APENAS UMA DAS LINHAS ABAIXO PARA RODAR O TESTE ---------- */

        // 0) Atribuição com variável: i = j; (TEMPO BASE)
        for (c = 1; c <= N; c = c + 1) i = j;

        // 1) Soma com constante: i = i + 3.0f;
        // for (c = 1; c <= N; c = c + 1) i = i + 3.0f;

        // 2) Soma com variável: i = i + j;
        // for (c = 1; c <= N; c = c + 1) i = i + j;

        // 3) Multiplicação com constante: i = i * 3.0f;
        // for (c = 1; c <= N; c = c + 1) i = i * 3.0f;

        // 4) Multiplicação com variável: i = i * j;
        // for (c = 1; c <= N; c = c + 1) i = i * j;

        /* --------------------------------------------------------------------------------- */

        fim = clock();

        printf("\nResultado (float): %f", i);

        Tempo = ((fim - inicio) * 1000.0 / CLOCKS_PER_SEC);
        printf("\nTempo: %g ms.", Tempo);

        media = media + Tempo;
    }

    printf("\nTempo gasto médio: %g ms.\n", media / 10);

    return 0;
}