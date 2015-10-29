global ft_isblank

section .text

ft_isblank:
	cmp rdi, 32
	je ret1
	cmp rdi, 9
	je ret1
	mov rax, 0
	ret

ret1:
	mov rax, 1
	ret
