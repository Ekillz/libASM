global ft_bzero

section .text

ft_bzero:
	mov r10, 0

algo:
	mov byte [rdi], 0
	add rdi, 1
	add r10, 1
	cmp rsi, r10
	jg algo
	ret
