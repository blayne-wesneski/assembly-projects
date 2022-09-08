;Author: Blayne Wesneski
;Description: A program that prints an Exit Stamement when the process terminates
;Date: September 1st 2022

section .data


ExitStatement:          db   "Program Completed Successfully!", 0x00
ExitStatementLen:       EQU   $-ExitStatement

Prompt:                 db  "Please type in a word: ", 0x00
PromptLen:              EQU $-Prompt

Response:               db  "You typed: ", 0x00
ResponseLen:            EQU $-Response

Input:                  db  "                ", 0x00
InputLen:               EQU $-Input

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
    mov rdx, InputLen
    syscall
    mov qword [InputSize], rax

    mov rax, 1
    mov rdi, 1
    mov rsi, Response
    mov rdx, ResponseLen
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, Input
    mov rdx, qword [InputSize]
    syscall

exit:

    mov rax, 1
    mov rdi, 1
    mov rsi, ExitStatement
    mov rdx, ExitStatementLen
    syscall                     ;Print out exit statement

    mov rax, 60
    mov rdi, 0
    syscall                     ;End process