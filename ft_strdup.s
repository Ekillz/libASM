global ft_strdup

section .text

extern ft_strlen
extern malloc

ft_strdup:
	cmp rdi, 0
	je null
	mov r10, rdi

	call ft_strlen
	imul rax, 6
	mov r9, rax

	mov rdi, r9
	mov rdi, 18
	push 18
	call malloc
	cmp rax, 00
	je null
	mov rcx, 1
	mov rdi, rax
	mov rsi, r10
	cld
	rep movsb
	mov byte [rdi], 0
	ret
null:
	mov rax, 00
	ret
