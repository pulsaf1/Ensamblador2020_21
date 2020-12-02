; ******************************************************************
; * Ejercicio7.asm
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
    ; Ahora según el enunciado no puedo usar msg dentro de la 
    ; subrutina. Sabemos que msg está en la pila, por "push msg", así que la voy a sacar de allí.
    ; Pero RECUERDA que al hacer call se ha hehco también un PUSH de la dirección donde se debe saltar al hacer RET
    ; Por eso, lo primero ...
    
    ; Sacamos la dirección de salto y lo almaceno por ejemplo en rbx
    pop rbx
    
    ; Ahora saco la dirección de msg y la guardo en rcx
    pop rcx ; rcx contiene ahora la dirección de msg
    
    ; Devuelvo la dirección de salto de ret para que funciones correctamente al terminar.
    push rbx 

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