bits 64

extern dprintf

global _start

section .bss
	fd resq 1

section .data
	error_msg db "Error: open failed.", 10
	len_error_msg equ $ - error_msg
	file_name db "Grace_kid.s", 0
	code db "bits 64%1$c%1$cextern dprintf%1$c%1$cglobal _start%1$c%1$csection .bss%1$c	fd resq 1%1$c%1$csection .data%1$c	error_msg db %2$cError: open failed.%2$c, 10%1$c	len_error_msg equ $ - error_msg%1$c	file_name db %2$cGrace_kid.s%2$c, 0%1$c	code db %2$c%3$s%2$c, 0%1$c%1$c%%macro OPEN_FILE 0%1$c	mov rax, 2 ; open%1$c	mov rdi, file_name%1$c	mov rsi, 1 | 64%1$c	mov rdx, 0666o%1$c	syscall%1$c%%endmacro%1$c%1$c%%macro WRITE_FILE 0%1$c	mov [fd], rax%1$c	xor rax, rax%1$c	mov rdi, [fd]%1$c	mov rsi, code%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, code%1$c	call dprintf%1$c%%endmacro%1$c%1$c%%macro FT 0%1$c	section .text%1$c		_start:%1$c			OPEN_FILE%1$c			cmp rax, 0%1$c			jl _fail_open%1$c			WRITE_FILE%1$c			mov rax, 3%1$c			mov rdi, [fd]%1$c			syscall%1$c%1$c		_end_of_program:%1$c			mov rax, 60%1$c			mov rdi, 0%1$c			syscall%1$c%1$c		_fail_open:%1$c			mov rax, 1%1$c			mov rdi, 2%1$c			mov rsi, error_msg%1$c			mov rdx, len_error_msg%1$c			syscall%1$c			mov rax, 60%1$c			mov rdi, 1%1$c			syscall%1$c%%endmacro%1$c%1$cFT%1$c", 0

%macro OPEN_FILE 0
	mov rax, 2 ; open
	mov rdi, file_name
	mov rsi, 1 | 64
	mov rdx, 0666o
	syscall
%endmacro

%macro WRITE_FILE 0
	mov [fd], rax
	xor rax, rax
	mov rdi, [fd]
	mov rsi, code
	mov rdx, 10
	mov rcx, 34
	mov r8, code
	call dprintf
%endmacro

%macro FT 0
	section .text
		_start:
			OPEN_FILE
			cmp rax, 0
			jl _fail_open
			WRITE_FILE
			mov rax, 3
			mov rdi, [fd]
			syscall

		_end_of_program:
			mov rax, 60
			mov rdi, 0
			syscall

		_fail_open:
			mov rax, 1
			mov rdi, 2
			mov rsi, error_msg
			mov rdx, len_error_msg
			syscall
			mov rax, 60
			mov rdi, 1
			syscall
%endmacro

FT
