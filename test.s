global _start
section .text

_start:
	mv rax, 5

	add rax, 3

	sub rax, 1

	inc rax

	dec rax

	mov rdi, rax

	mov rax, 60 ; syscall 60
	syscall		; run systemcall
