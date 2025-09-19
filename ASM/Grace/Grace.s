bits 64

extern dprintf

global _start

section .bss
	fd resq 1

section .data
	file_name db "Grace_kid.s", 0
	code db "bits 64%1$c%1$cextern dprintf%1$c%1$cglobal _start%1$c%1$csection .bss%1$c%2$cfd resq 1%1$c%1$csection .data%1$c%2$cfile_name db %3$cGrace_kid.s%3$c, 0%1$c%2$ccode db %3$c%4$s%3$c, 0%1$c%1$c%%macro OPEN_FILE 0%1$c%2$cmov rax, 2 ; open%1$c%2$cmov rdi, file_name%1$c%2$cmov rsi, 1 | 64%1$c%2$cmov rdx, 0666o%1$c%2$csyscall%1$c%%endmacro%1$c%1$c%%macro WRITE_FILE 0%1$c%2$cmov [fd], rax%1$c%2$cxor rax, rax%1$c%2$cmov rdi, [fd]%1$c%2$cmov rsi, code%1$c%2$cmov rdx, 10%1$c%2$cmov rcx, 9%1$c%2$cmov r8, 34%1$c%2$cmov r9, code%1$c%2$ccall dprintf%1$c%%endmacro%1$c%1$c%%macro FT 0%1$c%2$csection .text%1$c%2$c%2$c_start:%1$c%2$c%2$c%2$cOPEN_FILE%1$c%2$c%2$c%2$cWRITE_FILE%1$c%2$c%2$c%2$cmov rax, 3%1$c%2$c%2$c%2$cmov rdi, [fd]%1$c%2$c%2$c%2$csyscall%1$c%1$c%2$c%2$c%2$cmov rax, 60%1$c%2$c%2$c%2$cmov rdi, 0%1$c%2$c%2$c%2$csyscall%1$c%%endmacro%1$c%1$cFT%1$c", 0

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
	mov rcx, 9
	mov r8, 34
	mov r9, code
	call dprintf
%endmacro

%macro FT 0
	section .text
		_start:
			OPEN_FILE
			WRITE_FILE
			mov rax, 3
			mov rdi, [fd]
			syscall

			mov rax, 60
			mov rdi, 0
			syscall
%endmacro

FT
