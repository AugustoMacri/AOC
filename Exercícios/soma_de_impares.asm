#programa que le 10 inteiros e soma apenas os valores impares
.data
	add $s0, $zero, $zero
	add $s2, $zero, $zero
	add $s1, $zero, $zero
	
	str1: .asciiz "Digite o proximo valor: "
	str2: .asciiz "A soma dos valores impares eh:"

.text
	#primeiro precisamos criar o vetor que ira armazenar os valores digitados
	addi $s6, $zero, 10	#aqui sera o $s6, pq precisamos que esses valores sejam salvos
	add $s1, $zero, $zero #aqui sera o contador do nosso for
	
FOR:
	
	#verificacao do FOR
	slti $t0, $s1, 10 #aqui será o contador, fazer com que se repita ate i ser igual a 10
	beq $t0, $zero, SAI #marcacao de saida
	
	li $v0, 4 	#funcao responsavel por fazer imprimir string
	la $a0, str1
	syscall	  	#sempre lembrar de colocar ***syscall***
	
	li $v0, 5 	#le os proximos valores int
	syscall		#***syscall***
	
	add $s0, $zero, $v0 #salva o int lido acima em $s0
	
	#if(x %2 == 0){
	addi $t1, $zero, 1 #mascara para o LSB (aqui vamos saber se o LSB eh 1 ou 0, assim poderemos definir se eh impar ou par)
	and $t1, $t1, $s0  #aplica a mascara
	
	bne $t1, $zero, IMPAR 
	
	#adicionara 1 ao contador e retornara para o inicio do for 
	addi $s1, $s1, 1
	j FOR 
		
IMPAR: 	#aqui sera onde os valores impares serao somados 
	add $s2, $s0, $s2
	addi $s1, $s1, 1
	j FOR
	
	
	
SAI: #essa funcao sera responsavel e imprimir o valor final e finalizar o codigo
	
	li $v0, 1	#funcao responsavel por imprimir um inteiro
	add $a0, $zero, $s2
	syscall
	
	li $v0, 10
	syscall

	
