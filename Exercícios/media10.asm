#media de 10 numeros
.data
	str1: .asciiz "Digite o prox numero:"
	str2: .asciiz "A media eh: "

.text
	add $s7, $zero, $zero
	
	#precisamos fazer um for
	#for(i=0; i<10; i++)
	
	add $s0, $zero, $zero #lembrando que s0 serve para salvar o valor (S0 = i = 0)
	
FOR1:
	slti $t0, $s0, 10  #se i<10 -> t0 <- 1
	beq $t0, $zero, SAIFOR1
	#corpo do for
	
	#imprimir a primeira mensagem 
	li $v0, 4
	la $a0, str1
	syscall
	
	#le os prox valores
	li $v0, 5
	syscall
	
	#acumula o valor inteiro lido
	add $s7, $s7, $v0
	
	### \corpo do for
	addi $s0, $s0, 1
	j FOR1
	
SAIFOR1:
	#aqui calcularemos a media em si
	addi $t3, $zero, 10 	#aqui estamos dando um valor para $t3 para conseguirmos dividir
	div  $s7, $t3
	
	#mostrando a mensagem 2
	li $v0, 4
	la $a0, str2
	syscall
	
 	li $v0, 1
 	mflo $a0 #utilizado o mflo para pegar o resultado inteiro da conta
 	syscall
 	
 	#saindo do programa
 	li $v0, 10
 	syscall
	
	
