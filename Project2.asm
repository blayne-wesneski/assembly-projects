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

    mov rdi, Input
    mov rax, 26
    mov esi, 3 ;key

loop:

    ;load character from Input
    mov ch, [rdi]

    mov cl, ch
    or cl, 0x20
    cmp cl, 'a'
    jl no_encoding
    cmp cl, 'z'
    jl no_encoding

    and cl, 0x1f
    add cl, esi

    dec cl
    xor ax, ax
    mov al, cl
    div rax
    inc ah

    and ch, 0xE0
    or ch, ah

no_encoding:
 
    ;; write to the result
    mov [rdx], ch

    ;; prepare next iteration
    inc rdi
    inc rdx

    ;; more to do?
    and ch, ch
    jnz _loop
    ret

output:
    mov rax, 1
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 64
    syscall

exit:
    mov rax, 60
    mov rdi, 0
    syscall