global ft_isalpha

section .text

ft_isalpha:
	cmp rdi, 65
	jae second_check
	jmp ret0

second_check:
	cmp rdi, 90
	jbe ret1
	cmp rdi, 97
	jae third_check
	jmp ret0

third_check:
	cmp rdi, 122
	jbe ret1
	jmp ret0

ret1:
	mov rax, 1
	ret

ret0:
	mov rax, 0
	ret
