#Nesse codigo faremos o usuario digitar 10 elemento e iremos printar o maior

.data
	str1: .asciiz "Digite o proximo valor: "
	str2: .asciiz "O maior valor digitado eh: "
	v: .space 40
.text
	add $s0, $zero, $zero #aqui vamos comecar o contador 1
	add $s1, $zero, $zero #aqui vamos comecar o contador 2
	la $s7, v #endereco para a primeira posicao do array 

	#(1) criar um for
	#for(i =0, i<10, i==)
	#nesse caso iremos precisar de dois FOR

FOR2:
	slti $t1, $s1, 10
	beq $t1, $zero, SAI
	
	
	addi $s1, $s1, 1
			

FOR1:
	slti $t0, $s0, 9
	beq $t0, $zero, FOR2
	
	#vamos chamar a string
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5 #digitar o valor
	syscall
	
	#agora precisamos salvar o valor digitado 
	add $s1, $zero, $v0
	
	#if(v[i] < v[i+1])
	
	
	
	addi $s0, $s0, 1 #adiciona 1 no contador
	j FOR1

SAI:

	
	li $v0, 10
	syscall	
