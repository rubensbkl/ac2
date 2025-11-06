; Exemplo básico de Assembly x86-64 para Linux
; Este programa imprime "Hello, World!" na tela e termina

section .data
    ; Definição de dados/variáveis
    msg db 'Hello, World!', 0x0A    ; Mensagem com quebra de linha
    len equ $ - msg                  ; Calcula o tamanho da mensagem

section .text
    global _start

_start:
    ; Escrever na tela (syscall write)
    mov rax, 1          ; syscall number para sys_write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, msg        ; endereço da mensagem
    mov rdx, len        ; tamanho da mensagem
    syscall             ; chama o kernel

    ; Sair do programa (syscall exit)
    mov rax, 60         ; syscall number para sys_exit
    mov rdi, 0          ; código de retorno 0
    syscall             ; chama o kernel
