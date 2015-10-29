global ft_strcat

section .text

ft_strcat:
	push rdi
	cmp byte [rdi], 0
	je loop2

loop1:
	inc rdi
	cmp byte [rdi], 0
	JNE loop1

loop2:
	cmp byte [rsi], 0
	movsb
	JNE loop2

ret:
	pop rax
	ret
