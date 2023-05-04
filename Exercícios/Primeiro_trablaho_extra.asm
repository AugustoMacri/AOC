#macros sao responsaveis por modularizar e organizar os codigos escritos em assembly

#essa macro, quando chamada na func principal, ira fazer com que seja printado um val inteiro
.macro printInt(%r)
	li $v0, 1	#usando para dar o comando que ira printar um inteiro 
	addi $s0, $zero, %r
	syscall
.end_macro

#essa macro é responsavel por fazer com que seja lido um valor inteiro 
.macro readInt
	li $v0, 1
	syscall
.end_macro
	
#responsavel por finalizar o programa
.macro return0
	li $v0, 10
	syscall
.end_macro
	
#func responsavel por ler um float
.macro readSingle
	li $v0, 6
	syscall
.end_macro

#funcao responsavel por ler um double
.macro readDouble
	li $v0, 7
	syscall
.end_macro

#funcao responsavel por printar um double
.macro printDouble(%d)
	li $v0, 7
	add $s0, $zero,%d
	syscall
.end_macro

#responsavel por ler string
.macro readStr(%b, %size)
	li $v0, 8
	add $a0, $zero, $size
	la $a0, %b
	syscall
.end_macro

#reponsavel por printar string
.macro printStr(%str)
	li $v0, 4
	la $a0, %str
	syscall
.end_macro

#agora vamo para as funccoes push e pop
.macro push
	#sw = store word -> copia o dado de um registrador para a memoria (o registrador n eh alterado)
	sw $ra, 0   ($sp) # aqui fizemos o uso do ra porque ele segura o return addres que precisamos quando o programa acaba 
	sw $a0, -4  ($sp) # $sp = stack pointer
	sw $a1, -8  ($sp)
	sw $a2, -12 ($sp)
	sw $a3, -16 ($sp)
	sw $s0, -20 ($sp)
	sw $s1, -24 ($sp)
	sw $s2, -28 ($sp)
	sw $s3, -32 ($sp)
	sw $s4, -36 ($sp)
	sw $s5, -40 ($sp)
	sw $s6, -44 ($sp)
	sw $s7, -48 ($sp)
	addi $sp, $sp, -52 #nao esquecer de contar a posicao 0
.end_macro	
	
.macro pop
	#lw = load store -> carrega o dado que esta na memoria por um endereco especifico
	addi $sp, $sp, 52
	lw $ra, 0   ($sp)
	lw $a0, -4  ($sp)
	lw $a1, -8  ($sp)
	lw $a2, -12 ($sp)
	lw $a3, -16 ($sp)
	lw $s0, -20 ($sp)
	lw $s1, -24 ($sp)
	lw $s2, -28 ($sp)
	lw $s3, -32 ($sp)
	lw $s4, -36 ($sp)
	lw $s5, -40 ($sp)
	lw $s6, -44 ($sp)
	lw $s7, -48 ($sp)
.end_macro
	
	