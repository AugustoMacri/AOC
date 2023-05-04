# Leitura de Strings
.macro readString
	li	$v0, 8
	syscall
.end_macro

# Impressão de Strings 
.macro printString(%s)
	li	$v0, 4
	la	$a0, %s
	syscall
.end_macro

# Leitura de Inteiros 
.macro readInt
	li	$v0, 5
	syscall
.end_macro

# Impressão de Inteiros
.macro printInt(%d)
	li	$v0, 1
	add	$a0, $zero, %d
	syscall
.end_macro 

# Impressão de Char
.macro printChar(%c)	
	li	$v0, 11
	la	$a0, %c	
	syscall
.end_macro

# Leitura de Char
.macro readChar 
	li	$v0, 11
	syscall
.end_macro

# Encerramento de Programa
.macro exit
	li	$v0, 10
	syscall
.end_macro

# Recuperação do estado dos registradores 
.macro POP
	addi	$sp, $sp, 52
	lw	$ra, 0($sp)
	lw	$a0, -4($sp)
	lw	$a1, -8($sp)
	lw	$a2, -12($sp)
	lw	$a3, -16($sp)
	lw	$s0, -20($sp)
	lw	$s1, -24($sp)
	lw	$s2, -28($sp)
	lw	$s3, -32($sp)
	lw	$s4, -36($sp)
	lw	$s5, -40($sp)
	lw	$s6, -44($sp)
	lw	$s7, -48($sp)	
.end_macro

# Salvamento do estado dos registradores
.macro PUSH
	sw	$ra, 0($sp)
	sw	$a0, -4($sp)
	sw	$a1, -8($sp)
	sw	$a2, -12($sp)
	sw	$a3, -16($sp)
	sw	$s0, -20($sp)
	sw	$s1, -24($sp)
	sw	$s2, -28($sp)
	sw	$s3, -32($sp)
	sw	$s4, -36($sp)
	sw	$s5, -40($sp)
	sw	$s6, -44($sp)
	sw	$s7, -48($sp)
	addi	$sp, $sp, -52		
.end_macro
