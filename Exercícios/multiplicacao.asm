.text
	li $t0, 2
	li $t1, 3
	mul $s0, $t0, $t1
	
	sll $s1, $s0, 10 #multiplicar por 2^10
	
	#$s0 terá o resultado da multiplicaçao
	
	li $v0, 1
	move $a0, $s0
	syscall