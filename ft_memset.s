global ft_memset

section .text

ft_memset:
	cmp rdi, 0
	je null
	mov r8, rdi
	mov rax, rsi
	mov rcx, rdx
	cld
	rep stosb
	mov rax, r8
	ret

null:
	mov rax, rdi
	ret
