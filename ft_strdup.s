global ft_strdup

section .text

extern ft_strlen
extern malloc

ft_strdup:
	push rbp
	mov rbp, rsp
	push rdi
	call ft_strlen
	inc rax
	push rax
	mov rdi, rax
	call malloc
	test rax, rax
	je null
	pop rcx
	pop rsi
	mov rdi, rax
	rep movsb

null:
	leave
	ret
