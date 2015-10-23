global ft_puts

section .text

ft_puts:
	mov r8, rdi
	mov r9, 0
	mov r10, rdi

get_len:
	add r9, 1
	inc r8
	cmp byte [r8], 0
	jne get_len

output:
	mov rax, 0x2000004
	;add r9, 1
	;add r10, 10
	mov rdi, 1
	mov rsi, r10
	mov rdx, r9
	syscall
	mov rax, r9
	ret
