; Exemplo de Assembly com operações aritméticas
; Este programa soma dois números e imprime o resultado

section .data
    num1 dq 10          ; primeiro número (64 bits)
    num2 dq 32          ; segundo número (64 bits)
    result dq 0         ; variável para armazenar o resultado
    msg db 'Resultado: ', 0
    newline db 0x0A

section .bss
    ; Seção para variáveis não inicializadas
    buffer resb 20      ; buffer para converter número em string

section .text
    global _start

_start:
    ; Carregar os números
    mov rax, [num1]     ; carrega num1 no registrador rax
    mov rbx, [num2]     ; carrega num2 no registrador rbx
    
    ; Realizar operações aritméticas
    add rax, rbx        ; soma: rax = rax + rbx
    mov [result], rax   ; salva o resultado
    
    ; Imprimir mensagem
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 11
    syscall
    
    ; Aqui você precisaria converter o número para string
    ; (código simplificado - em um programa real, você implementaria isso)
    
    ; Sair
    mov rax, 60
    mov rdi, 0
    syscall

; Exemplos de outras operações:
; sub rax, rbx    ; subtração
; imul rbx        ; multiplicação
; idiv rbx        ; divisão
; inc rax         ; incrementa
; dec rax         ; decrementa
