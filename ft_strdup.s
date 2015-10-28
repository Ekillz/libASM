global ft_strdup

section .text

extern ft_strlen
extern malloc

ft_strdup:
	cmp rdi, 0
	je null
	push rdi

	call ft_strlen
	inc rax
	push rax

	mov rdi, rax
	call malloc
	cmp rax, 00
	je null
	
	pop rcx
	pop rsi
	mov rdi, rax
	rep movsb
	ret
null:
	mov rax, 00
	ret
