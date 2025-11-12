# Exercício: Compilar para MIPS
# a = 5;
# b = 3;
# c = a + b;
# print(c);

.text
.globl main

main:
    # a = 5
    li $t0, 5           # LOAD IMMEDIATE: Carrega o valor 5 no registrador $t0 (variável a)
    
    # b = 3
    li $t1, 3           # LOAD IMMEDIATE: Carrega o valor 3 no registrador $t1 (variável b)
    
    # c = a + b
    add $t2, $t0, $t1   # ADD: Soma $t0 + $t1 e armazena o resultado em $t2 (c = 5 + 3 = 8)
    
    # Imprimir o resultado (c)
    li $v0, 1           # SYSCALL 1: Código de sistema para imprimir um inteiro
    move $a0, $t2       # MOVE: Copia o valor de $t2 para $a0 (argumento da syscall)
    syscall             # SYSCALL: Executa a chamada de sistema (imprime o valor 8)
    
    # Imprimir uma quebra de linha
    li $v0, 11          # SYSCALL 11: Código de sistema para imprimir um caractere
    li $a0, 10          # ASCII 10 = '\n' (quebra de linha)
    syscall             # SYSCALL: Executa a chamada de sistema (imprime \n)
    
    # Fim do programa
    li $v0, 10          # SYSCALL 10: Código de sistema para terminar o programa
    syscall             # SYSCALL: Executa a chamada de sistema (exit)