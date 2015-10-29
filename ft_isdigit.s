global ft_isdigit

section .text

ft_isdigit:
	cmp	rdi, '9'
	jbe second_check
	jmp ret0

second_check:
	cmp rdi, '0'
	jae ret1

ret0:
	mov rax, 0
	ret

ret1:
	mov rax, 1
	ret
