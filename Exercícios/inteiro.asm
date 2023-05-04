.data
	idade: .word 56 #calor inteiro na RAM

.text
	li $v0, 1
	lw $a0, idade
	syscall