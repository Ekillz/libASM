global ft_islower

section .text

ft_islower:
	cmp rdi, 97
	jae second_check
	jmp ret_arg

second_check:
	cmp rdi, 122
	jbe return

ret_arg:
	mov rax, 0
	ret

return:
	mov rax, 1
	ret
