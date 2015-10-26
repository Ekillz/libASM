global ft_strlen

section .text

ft_strlen:
	cmp rdi, 0
	je null
	mov rcx, 0
	not rcx
	mov al, 0
	cld
	repne scasb
	not rcx
	dec rcx
	mov rax, rcx
	ret

null:
	mov rax, 0
	ret
