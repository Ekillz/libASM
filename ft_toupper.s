global ft_toupper

section .text

ft_toupper:
	cmp rdi, 97
	jae second_check
	jmp ret_arg

second_check:
	cmp rdi, 122
	jbe return

ret_arg:
	mov rax, rdi
	ret

return:
	sub rdi, 32
	mov rax, rdi
	ret
