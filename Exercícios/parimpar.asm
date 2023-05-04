#teste se um numero lido e par ou impar

.data
	str1: .asciiz "Digite um numero: "
	str2: .asciiz "O numero e par"
	str3: .asciiz "O numero e impar"

.text
	#Aqui vai pedir para o cara digitar
	li $v0, 4	#li $v0, 4 - Imprimir String ou Char
	la $a0, str1 	#load addres (aqui vai ler oq esta no endereço de str1 e colocar em a0)
	syscall
	
	#ler o numero
	li $v0, 5	#li $v0, 5 - le um int
	syscall
	
	add $s0, $zero, $v0 #salva o int lido acima em $s0
	
	#testar se o numero lido eh par ou impar
	addi $t0, $zero, 1 #mascara para o LSB (less significative bit)
	and $t0, $t0, $s0  #aplica a mascara
	
	beq $t0, $zero, PAR #se $t0 for igual a $zero execute a partir do rotulo PAR
	#imprime quem eh impar
	li $v0, 4
	la $a0, str3
	syscall
	j SAI
	
PAR:	li $v0, 4
	la $a0, str2
	syscall

SAI:	li $v0, 10
	syscall
