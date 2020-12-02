; ******************************************************************
; * Ejercicio 6.asm
; * Curso de Especialización en Ciberseguridad IES Campanillas
; * Autor. Gregorio Coronado Morón
; * Fecha. 02/12/2020
; * ****************************************************************

section .bss
len resb 1

section .data

msg db "Hola!",0


section .text

global _start

_start:

push msg
call longitud

; Voy a comprobar que funciona imprimiendo aqui len.

add BYTE[len], '0'
mov rax, 4
mov rbx, 1
mov rcx, len
mov rdx, 1
int 80h

mov rax,1
mov rbx, 0
int 80h

; Aquí defino la subrutina

longitud:
    mov BYTE[len], 0    ; Igualamos el contenido de len con 0. (La longitud inicial es 0).
    mov rax, msg        ; Movemos en rax la dirección de msg

    comparaCaracter:
    cmp BYTE[rax], 0           ; Comparamos el caracter con 0. Si el caracter es 0 activa el flag de 0
    jne siguienteCaracter ; Si el caracter no es el valor 0 me muevo a siguienteCaracter
    ret                 ; Si el caracter es 0 he terminado y devuelvo el control a call.

    siguienteCaracter: 
    inc rax             ; Incrementamos la dirección para apuntar al siguiente caracter
    inc BYTE[len]       ; Contabilizo en len un nuevo caracter que no es 0
    jmp comparaCaracter ; Salto a cuenta para volver a comparar





