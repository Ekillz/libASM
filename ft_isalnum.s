global ft_isalnum

extern ft_isalpha
extern ft_isdigit

section .text

ft_isalnum:
	call ft_isalpha
	cmp rax, 1
	je ret1
	call ft_isdigit
	cmp rax, 1
	je ret1
	mov rax, 0
	ret

ret1:
	mov rax, 1
	ret
