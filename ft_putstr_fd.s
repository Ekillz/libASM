global ft_putstr_fd

section .text
extern ft_strlen

ft_putstr_fd:
	push rdi
	push rsi
	call ft_strlen
	mov rdx, rax
	mov rax, 0x2000004
	pop rdi
	pop rsi
	syscall
	ret
