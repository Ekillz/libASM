global ft_isascii

section .text

ft_isascii:
	cmp rdi, 0
	jae second_check
	jmp ret0

second_check:
	cmp rdi, 127
	jbe ret1

ret0:
	mov rax, 0
	ret

ret1:
	mov rax, 1
	ret
