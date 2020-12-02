; ******************************************************************
; * Ejercicio8.asm
; * Curso de Especialización en Ciberseguridad IES Campanillas
; * Autor. Gregorio Coronado Morón
; * Fecha. 02/12/2020
; * ****************************************************************

Servicio equ 80h

section .bss
imsg resb 40  ;Variable donde vamos a guardar la cadena msg alrevés.


section .data
msg db "Hola!",0 
len  equ  $ - msg -1    ; Longitud de la cadena msg (sin contar el caracter 0)
ilen equ len + 1        ; Longitud de la cadena msg contando el caracter 0

section .text

global _start

_start:
    mov rax, len    ; Contiene el indice del ultimo caracter, para recorrer msg del revés.
    mov rcx, 0      ; Contiene el indice del primer caracter, para recorrer imsg de derecha a izquierda.

copia: 
    mov bl, [ msg + rax ]               ; Movemos el último caracter de msg al primero de imsg
    mov BYTE[ imsg + rcx ], bl
    inc rcx                              ; Incrementamos rcx para apuntar al siguiente caracter de imsg
    dec rax                              ; Decrementamos rax para apuntar al siguiente caracter de msg en sentido contrario.
    jnz copia                            ; Si rax es 0 hemos terminado de recorrer

    mov bl, [ rax + msg ]               ; Guardamos el caracter 0 en la ultima posición de imsg
    mov BYTE[ imsg + rcx ], bl

imprimir:

mov rax,4
mov rbx,1
mov rcx, imsg
mov rdx, ilen
int Servicio

mov rax,1
mov rbx, 0
int Servicio
