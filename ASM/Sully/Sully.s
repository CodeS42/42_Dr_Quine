bits 64

global _start

extern snprintf
extern dprintf
extern system

section .bss
	fd resq 1
	file_name resb 50
	cmd resb 150

section .data
	error_msg db "Error: open failed.", 10
	len_error_msg equ $ - error_msg
	i dq 5
	file_name_ph db "Sully_%1$d.s", 0
	cmd_ph db "nasm -f elf64 -DNOT_ORIGINAL Sully_%1$d.s -o Sully_%1$d.o ; ld Sully_%1$d.o -o Sully_%1$d -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 ; rm *.o ; ./Sully_%1$d", 0
	code db "bits 64%1$c%1$cglobal _start%1$c%1$cextern snprintf%1$cextern dprintf%1$cextern system%1$c%1$csection .bss%1$c	fd resq 1%1$c	file_name resb 50%1$c	cmd resb 150%1$c%1$csection .data%1$c	error_msg db %2$cError: open failed.%2$c, 10%1$c	len_error_msg equ $ - error_msg%1$c	i dq %3$d%1$c	file_name_ph db %2$cSully_%%1$d.s%2$c, 0%1$c	cmd_ph db %2$cnasm -f elf64 -DNOT_ORIGINAL Sully_%%1$d.s -o Sully_%%1$d.o ; ld Sully_%%1$d.o -o Sully_%%1$d -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 ; rm *.o ; ./Sully_%%1$d%2$c, 0%1$c	code db %2$c%4$s%2$c, 0%1$c%1$csection .text%1$c	_start:%1$c		cmp qword [i], 0%1$c		jle _end_of_program%1$c%1$c		; change i value%1$c		%%ifdef NOT_ORIGINAL%1$c			dec qword [i]%1$c		%%endif%1$c%1$c		; init file name%1$c		xor rax, rax%1$c		mov rdi, file_name%1$c		mov rsi, 50%1$c		mov rdx, file_name_ph%1$c		mov rcx, [i]%1$c		call snprintf%1$c%1$c		; init cmd%1$c		xor rax, rax%1$c		mov rdi, cmd%1$c		mov rsi, 150%1$c		mov rdx, cmd_ph%1$c		mov rcx, [i]%1$c		call snprintf%1$c%1$c		; open file%1$c		mov rax, 2%1$c		mov rdi, file_name%1$c		mov rsi, 1 | 64%1$c		mov rdx, 0666o%1$c		syscall%1$c		cmp rax, 0%1$c		jl _fail_open%1$c%1$c		mov [fd], rax%1$c%1$c		; write file%1$c		xor rax, rax%1$c		mov rdi, [fd]%1$c		mov rsi, code%1$c		mov rdx, 10%1$c		mov rcx, 34%1$c		mov r8, [i]%1$c		mov r9, code%1$c		call dprintf%1$c%1$c		; close file%1$c		mov rax, 3%1$c		mov rdi, [fd]%1$c		syscall%1$c%1$c		xor rax, rax%1$c		mov rdi, cmd%1$c		call system%1$c%1$c	_end_of_program:%1$c		mov rax, 60%1$c		mov rdi, 0%1$c		syscall%1$c%1$c	_fail_open:%1$c		mov rax, 1%1$c		mov rdi, 2%1$c		mov rsi, error_msg%1$c		mov rcx, len_error_msg%1$c		syscall%1$c		mov rax, 60%1$c		mov rdi, 1%1$c		syscall%1$c", 0

section .text
	_start:
		cmp qword [i], 0
		jle _end_of_program

		; change i value
		%ifdef NOT_ORIGINAL
			dec qword [i]
		%endif

		; init file name
		xor rax, rax
		mov rdi, file_name
		mov rsi, 50
		mov rdx, file_name_ph
		mov rcx, [i]
		call snprintf

		; init cmd
		xor rax, rax
		mov rdi, cmd
		mov rsi, 150
		mov rdx, cmd_ph
		mov rcx, [i]
		call snprintf

		; open file
		mov rax, 2
		mov rdi, file_name
		mov rsi, 1 | 64
		mov rdx, 0666o
		syscall
		cmp rax, 0
		jl _fail_open

		mov [fd], rax

		; write file
		xor rax, rax
		mov rdi, [fd]
		mov rsi, code
		mov rdx, 10
		mov rcx, 34
		mov r8, [i]
		mov r9, code
		call dprintf

		; close file
		mov rax, 3
		mov rdi, [fd]
		syscall

		xor rax, rax
		mov rdi, cmd
		call system

	_end_of_program:
		mov rax, 60
		mov rdi, 0
		syscall

	_fail_open:
		mov rax, 1
		mov rdi, 2
		mov rsi, error_msg
		mov rcx, len_error_msg
		syscall
		mov rax, 60
		mov rdi, 1
		syscall
