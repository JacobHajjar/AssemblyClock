;Author information
;  Author name: Jacob Hajjar
;  CPSC240-1
;  Author email: hajjarj@csu.fullerton.edu
;  Program name: Execution Clock

extern scanf

extern printf

global clock

segment .data

clock_time_message db "The current clock time is %d tics.", 10, 0

stringform db "%s", 0

segment .bss
bottles resq 30
title resd 4
resistance resq 8
current resb 8


segment .text

clock: 

;register backup
mov qword rax, 0

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf 

;get current tics
mov rax, 0  
mov rdx, 0
;cpuid                             
rdtsc  ;finds current tics
shl rdx, 32
add rax, rdx
;mov r13, rax

;print clock time message
;mov rax, 0
;mov rdi, clock_time_message
;mov rsi, r13
;call printf


popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp     

ret

