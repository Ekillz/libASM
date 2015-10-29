global ft_bzero

section .text

ft_bzero:
	cmp rsi, 0
	je ret0
	mov r10, 0

algo:
	mov byte [rdi], 0
	inc rdi
	inc r10
	cmp rsi, r10
	jg algo

ret0:
	ret
