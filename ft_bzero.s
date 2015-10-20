global ft_bzero

section .text

ft_bzero:
	mov rax, [esp + 4]
	mov rdi, [esp + 8]

