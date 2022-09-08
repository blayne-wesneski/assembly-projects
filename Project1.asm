;Author: Blayne Wesneski
;Description: First Project
;Date: August 28th 2022

;.data holds the necessary known Variables/Constants
;This is stored in the program itself
section .data

msg:    db "Hello World!", 0x0A, 0x00
msglen: EQU $-msg

;Undefined variables go in .bss
section .bss



section .text
global _start

_start:

print:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall