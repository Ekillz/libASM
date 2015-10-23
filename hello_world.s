global start

section .text

start:
	mov rax, 0x2000004
	mov rdi, 1
	lea rsi, [rel msg]
	mov rdx, msg.len
	syscall
	mov rax, 0x2000001
	mov rdi, 0
	syscall

section .data
msg: db "hello",10
.len:  equ $ - msg
