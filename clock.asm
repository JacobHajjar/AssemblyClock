;Author information
;  Author name: Jacob Hajjar
;  CPSC240-1
;  Author email: hajjarj@csu.fullerton.edu
;  Program name: Execution Clock

extern scanf

extern printf

extern gettime

extern clock_speed

extern atof

global clock

half_gravity equ 0x401399999999999A

segment .data

clock_time_message db "The current clock time is %li tics.", 10, 0
height_prompt db "Please enter the height in meters of the dropped marble: ", 0
time_calculation_message db "The marble will reach earth after %.7f  seconds.", 10 ,0
execution_time_message db "The execution time was %li tics which equals %.2f ns", 10, 0
stringform db "%s", 0

segment .bss

height resq 8




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
call gettime
mov r12, rax

;print clock time message
mov rax, 0
mov rdi, clock_time_message
mov rsi, r12
call printf

;prompt for the height in meters
mov rax, 0
mov rdi, stringform
mov rsi, height_prompt
call printf

;take in height value
mov rax, 0
mov      rdi, stringform
mov      rsi, height
call     scanf

;convert height to a float
mov rdi, height
mov rax, 1
call atof
movsd xmm4, xmm0

;put the value of 9.8/2 into xmm5
mov rax, half_gravity
movq xmm5, rax

;divide the height by half gravity, then sqrt
divsd xmm4, xmm5
sqrtsd xmm4, xmm4

;print time calculation message
mov qword rax, 0
movsd xmm0, xmm4
mov rax, 1
mov rdi, time_calculation_message
call printf

;get current tics
mov rax, 0
call gettime
mov r13, rax

;print clock time message
mov rax, 0
mov rdi, clock_time_message
mov rsi, r13
call printf

;calculate elapsed tics
sub r13, r12

;get cpu clock speed
mov rax, 1
call clock_speed   
movsd xmm5, xmm0   

;convert ticks elapsed to float
cvtsi2sd xmm6, r13
divsd xmm6, xmm5

;print execution time calculation
;prompt for the height in meters
mov rax, 1
mov rdi, execution_time_message
mov rsi, r13
movsd xmm0, xmm6
call printf

movsd xmm0, xmm6


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

