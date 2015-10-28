global ft_cat

extern ft_strlen
extern malloc

section .text

ft_cat:
	push rdi
	mov rdi, 1000
	call malloc 

read:
	mov rsi, rax
	pop rdi
	push rsi
	mov rax, 0x2000003
	mov rdx, 1000
	syscall

get_len:
	pop rdi
	push rdi
	call ft_strlen

write:
	mov rdx, rax
	mov rax, 0x2000004
	mov rdi, 1
	pop rsi
	syscall
	ret
