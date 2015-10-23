global ft_puts

section .text

ft_puts:
	mov r8, rdi
	mov r9, 0
	mov r10, rdi

check_null:
	cmp byte [r8], 0
	je new_line

get_len:
	add r9, 1
	inc r8
	cmp byte [r8], 0
	jne get_len

output:
	mov rax, 0x2000004
	mov rdi, 1
	mov rsi, r10
	mov rdx, r9
	syscall

new_line:
	mov rax, 0x2000004
	mov rdi, 1
	lea rsi, [rel msg]
	mov rdx, 1
	syscall

ret0:
	mov rax, r9
	ret

section .data
	msg: db "", 10
