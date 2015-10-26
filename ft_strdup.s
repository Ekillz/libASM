global ft_strdup

section .text

extern ft_strlen
extern malloc

ft_strdup:
	cmp rdi, 0
	je null
	mov r8, rdi
	call ft_strlen
	mov r9, rax
	inc r9
	mov rdi, r9
	call malloc
	cmp rax, 00
	je null
	mov rdi, [rsp]
	mov rcx, r9 
	mov r9, rax
	mov rdi, rax
	mov rsi, r8
	cld
	rep movsb
	mov byte [rdi], 0
	mov rax, r8
	ret
null:
	mov rax, 00
	ret
