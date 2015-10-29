global ft_putstr

extern ft_strlen
section .text

ft_putstr:
	push rdi
	call ft_strlen

	mov rdx, rax
	mov rax, 0x2000004
	mov rdi, 1
	pop rsi
	syscall
	ret
