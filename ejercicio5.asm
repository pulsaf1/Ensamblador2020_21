section .bss

section .data
numero db "0", 10

section .text

global _start
_start:

; Imprimimos el numero
mov rax, 4
mov rbx, 1
mov rcx, numero
mov rdx, 2
int 80h

; Incremento el número. OJO es un BYTE.
inc BYTE[numero]

call atoi
jnz _start

atoi:
mov al, [numero]
sub rax, ":"
ret

; Salimos con éxito
mov rax, 1
mov rbx, 0
int 80h