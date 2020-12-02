; ******************************************************************
; * Ejercicio 6_v2.asm
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
    cmp BYTE[msg], 0    ; Comparamos el primer caracter con 0. Si son ambos 0 se activa el flag de cero y je saltará.
    je fin              ; Si la comparación anterior fue correcta acabamos. La cadena está vacía.
    
    mov rax, msg        ; Movemos en rax la dirección de msg

    comparaCaracter:
    inc rax             ; Incrementamos rax para contener la dirección del siguiente caracter    
    cmp BYTE[rax], 0    ; Comparamos el caracter con 0.  
    jne comparaCaracter ; Si el caracter no es el valor 0 me muevo a comparaCaracter
    
    ; Aquí hemos encontrado el caracter 0. El tamañó será la resta de la dirección del primer caracter
    ; con la dirección del último caracter.

    mov QWORD[len], rax  
    sub QWORD[len], msg

    fin:
    ret ; DEvolvemos el control a call





