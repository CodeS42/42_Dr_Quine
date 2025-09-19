; Colleen
bits 64

global _start
extern printf
extern fflush

section .data
	code db "; Colleen%1$cbits 64%1$c%1$cglobal _start%1$cextern printf%1$cextern fflush%1$c%1$csection .data%1$c	code db %2$c%3$s%2$c%1$c%1$csection .text%1$c	_start:%1$c		call _print_source_code%1$c		mov rdi, 0%1$c		call fflush%1$c%1$c		mov rax, 60 ; exit%1$c		mov rdi, 0%1$c		syscall%1$c%1$c	_print_source_code:%1$c		sub rsp, 8%1$c		xor rax, rax%1$c		mov rdi, code%1$c		mov rsi, 10%1$c		mov rdx, 34%1$c		mov rcx, code%1$c		call printf%1$c		add rsp, 8%1$c		ret%1$c"

section .text
	_start:
		call _print_source_code
		mov rdi, 0
		call fflush

		mov rax, 60 ; exit
		mov rdi, 0
		syscall

	_print_source_code:
		sub rsp, 8
		xor rax, rax
		mov rdi, code
		mov rsi, 10
		mov rdx, 34
		mov rcx, code
		call printf
		add rsp, 8
		ret
