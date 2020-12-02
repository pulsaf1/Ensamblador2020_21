; ******************************************************************
; * Ejercicio2.asm
; * Curso de Especialización en Ciberseguridad IES Campanillas
; * Autor. Gregorio Coronado Morón
; * Fecha. 02/12/2020
; * ****************************************************************

section .data
msg db "Escribe tu nombre:"
msg2 db "Hola "

section .bss 
nombre resb 50

section .text

global _start
_start:

; Imprimir "Escribe tu nombre:"
mov rax, 4
mov rbx, 1
mov rcx, msg
mov rdx, 18
int 80h

; Recoger de teclado el nombre del usuario
mov rax, 3
mov rbx, 0
mov rcx, nombre
mov rdx, 50
int 80h

; Imprimo Hola
mov rax, 4
mov rbx, 1
mov rcx, msg2
mov rdx, 5
int 80h

; Imprimo el nombre
mov rax, 4
mov rbx, 1
mov rcx, nombre
mov rdx, 50
int 80h


; Salimos con éxito
mov rax, 1
mov rbx, 0
int 80h