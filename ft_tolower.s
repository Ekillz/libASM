global ft_tolower

section .text

ft_tolower:
	cmp rdi, 65
	jae second_check
	jmp ret_arg

second_check:
	cmp rdi, 90
	jbe return

ret_arg:
	mov rax, rdi
	ret

return:
	add rdi, 32
	mov rax, rdi
	ret
