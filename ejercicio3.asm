; ******************************************************************
; * Ejercicio3.asm
; * Curso de Especialización en Ciberseguridad IES Campanillas
; * Autor. Gregorio Coronado Morón
; * Fecha. 02/12/2020
; * ****************************************************************

section .bss

nombre resb 50
msg resb 18 
msg2 resb 5 

section .text

global _start
_start:

mov DWORD[msg], "Escr"
mov DWORD[msg+4], "ibe "
mov DWORD[msg+8], "tu n"
mov DWORD[msg+12], "ombr"
mov DWORD[msg+16], "e: "

mov DWORD[msg2], "Hola"
mov DWORD[msg2+4], " "

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