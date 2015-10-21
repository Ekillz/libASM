global ft_bzero

section .text

ft_bzero:
	mov r8, rdi
	mov r9, rsi
	mov r10, 0

algo:
	mov byte [r8], 0
	add r8, 1
	add r10, 1
	cmp r9, r10
	jg algo

fin:
	ret
