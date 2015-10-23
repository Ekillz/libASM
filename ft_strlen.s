global ft_strlen

section .text

ft_strlen:
	rep scasb
	mov rax, 0x2000004
	mov r8, rdi
	mov rdi, 1
	mov rsi, r8
	mov rdx, 1
	syscall
	ret
