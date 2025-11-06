# Guia de Assembly

## Como compilar e executar código Assembly

### 1. Instalar as ferramentas necessárias

```bash
# No Linux Ubuntu/Debian
sudo apt-get install nasm

# Para linker (já vem instalado geralmente)
sudo apt-get install build-essential
```

### 2. Compilar um programa Assembly

```bash
# Montar (assemblar) o código
nasm -f elf64 exemplo.asm -o exemplo.o

# Linkar
ld exemplo.o -o exemplo

# Executar
./exemplo
```

## Estrutura de um programa Assembly

### Seções principais:
- **section .data**: Dados inicializados (variáveis com valores)
- **section .bss**: Dados não inicializados (reserva espaço)
- **section .text**: Código executável

### Registradores principais (x86-64):
- **rax, rbx, rcx, rdx**: Registradores de propósito geral (64 bits)
- **rsi, rdi**: Índices de fonte/destino
- **rsp, rbp**: Ponteiros de pilha/base
- **rip**: Ponteiro de instrução

Versões menores:
- **eax** (32 bits), **ax** (16 bits), **al/ah** (8 bits)

### Instruções básicas:

#### Movimentação de dados:
```asm
mov rax, 5          ; move o valor 5 para rax
mov rbx, rax        ; copia o valor de rax para rbx
lea rax, [msg]      ; carrega endereço de msg em rax
```

#### Aritmética:
```asm
add rax, rbx        ; rax = rax + rbx
sub rax, rbx        ; rax = rax - rbx
imul rbx            ; rax = rax * rbx (signed)
idiv rbx            ; rax = rax / rbx (signed)
inc rax             ; rax++
dec rax             ; rax--
```

#### Comparação e saltos:
```asm
cmp rax, rbx        ; compara rax com rbx
je label            ; salta se igual (equal)
jne label           ; salta se diferente (not equal)
jg label            ; salta se maior (greater)
jl label            ; salta se menor (less)
jmp label           ; salta incondicionalmente
```

#### Lógica:
```asm
and rax, rbx        ; AND bit a bit
or rax, rbx         ; OR bit a bit
xor rax, rbx        ; XOR bit a bit
not rax             ; NOT bit a bit
```

### Syscalls no Linux (x86-64):

O número da syscall vai em **rax**, argumentos em **rdi, rsi, rdx, r10, r8, r9**.

Syscalls comuns:
- **sys_write** (1): escrever na tela
- **sys_read** (0): ler entrada
- **sys_exit** (60): sair do programa
- **sys_open** (2): abrir arquivo
- **sys_close** (3): fechar arquivo

Exemplo:
```asm
mov rax, 1          ; sys_write
mov rdi, 1          ; stdout
mov rsi, msg        ; buffer
mov rdx, len        ; tamanho
syscall
```

## Exemplos práticos

### Loop simples:
```asm
mov rcx, 10         ; contador
loop_start:
    ; seu código aqui
    dec rcx         ; decrementa contador
    jnz loop_start  ; continua se não for zero
```

### Função/procedimento:
```asm
my_function:
    push rbp            ; salva base pointer
    mov rbp, rsp        ; novo stack frame
    
    ; código da função
    
    mov rsp, rbp        ; restaura stack
    pop rbp
    ret                 ; retorna
```

## Dicas:
- Cada arquitetura tem suas próprias instruções
- Use comentários para documentar seu código
- Aprenda sobre registradores e suas convenções
- Entenda a pilha (stack) para funções complexas
- Use debugger (gdb) para entender o comportamento
