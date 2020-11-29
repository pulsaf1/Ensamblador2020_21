section .data
    msg db "Hola! Mundo", 10
    msg2 db "HastaLosmismosdelEnsamblador",10    
section .text
    global _start
    _start:
    mov rax, 4
    mov rbx, 1
    mov rcx, msg	
    mov rdx, 30
    int 80h

    mov rax,1
    mov rbx, 0
    int 80h
