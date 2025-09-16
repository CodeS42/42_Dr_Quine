bits 64

global _start
extern printf ; using printf to handle formatting with placeholders

section .data
	message db "bits 64%1$c%1$cglobal _start%1$cextern printf ; using printf to handle formatting with placeholders%1$c%1$csection .data%1$c%2$cmessage db %3$c%4$s%3$c%1$c%1$csection .text%1$c%2$c_start:%1$c%2$c%2$cmov rax, 0 ; nb d'arguments flottants pour printf%1$c%2$c%2$cmov rdi, message%1$c%2$c%2$cmov rsi, 10%1$c%2$c%2$cmov rdx, 9%1$c%2$c%2$cmov rcx, 34%1$c%2$c%2$cmov r8, message%1$c%2$c%2$ccall printf%1$c%1$c%2$c%2$cmov rax, 60%1$c%2$c%2$cmov rdi, 0%1$c%2$c%2$csyscall%1$c"

section .text
	_start:
		mov rax, 0 ; nb d'arguments flottants pour printf
		mov rdi, message
		mov rsi, 10
		mov rdx, 9
		mov rcx, 34
		mov r8, message
		call printf

		mov rax, 60
		mov rdi, 0
		syscall
