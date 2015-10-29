global ft_isupper

section .text

ft_isupper:
	cmp rdi, 65
	jae second_check
	jmp ret_arg

second_check:
	cmp rdi, 90
	jbe return

ret_arg:
	mov rax, 0
	ret

return:
	mov rax, 1
	ret
