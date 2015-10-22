global ft_strcat

section .text

ft_strcat:
	lea r8, [rel rdi]

loop1:
	add rdi, 1
	cmp byte [rdi], 0
	JNE loop1

loop2:
	cmp byte [rsi], 0
	movsb
	JNE loop2
	mov rax, r8
	ret
