global ft_memcpy

section .text

ft_memcpy:
	cmp rdi, 0
	je null
	cmp rsi, 0
	je null
	mov r8, rdi
	mov rcx, rdx
	cld
	rep movsb

null:
	mov rax, r8
	ret
