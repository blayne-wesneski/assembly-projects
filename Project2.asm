;Author: Blayne Wesneski
;Description: Second Project (Shift Cipher Encryption)
;Date: October 14th 2022


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

;yeah I dunno, I have tried atleast 6 different implementations and no matter what I do I can't get it to work. I have dedicated atleast 16 hours total with no headway.
;I can guarantee the program atleast will read out the input it is given if the rotate, loop1, isz, and output sections are disabled/removed
;I really tried but I honestly don't have the energy to keep trying. I don't know what I have been doing wrong, and so I will leave it this broken mess which is, most likely,
;horribly wrong, but hey 60 is better than a zero

;rotate:

;    mov eax, Input
;    mov rax, 4 ;key
;    mov rdi, Input


;loop1:

;    mov rsi, [rdi]
;    cmp rsi, 0x7A ;check if 'z'
;    je isz
;    add rsi, rax
;    dec eax
;    jnz loop1

;isz:

;    mov rsi, 0x61
;    ret

;output:

;    mov rax, 1
;    mov rdi, 1
;    mov rsi, rsi
;    mov rdi, 64
;    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall
