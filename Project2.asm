;Author: Blayne Wesneski
;Description: Second Project (Shift Cipher Encryption)
;Date: September 20th 2022


;.data holds the necessary known Variables/Constants
;This is stored in the program itself
section .data

    Input: times 64 db 0 ;64 byte input buffer

    Prompt:                 db  "Please type in a word: ", 0x00
    PromptLen:              EQU $-Prompt

    Response:               db  "You typed: ", 0x00
    ResponseLen:            EQU $-Response

;Undefined variables go in .bss
section .bss


section .text

global _start

_start:

    mov rax, 1
    mov rdi, 1
    mov rsi, Prompt
    mov rdx, PromptLen
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, Input
    mov rdx, 64
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, Input
    mov rdx, 64
    syscall

rotate:

    mov eax, Input
    mov rax, 4 ;key
    mov rdi, Input

loop1:

    mov rsi, [rdi]
    cmp rsi, 0x7A ;check if 'z'
    je isz
    add rsi, rax
    dec eax
    jnz loop1

isz:

    mov rsi, 0x61
    ret

output:

    mov rax, 1
    mov rdi, 1
    mov rsi, rsi
    mov rdi, 64
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall