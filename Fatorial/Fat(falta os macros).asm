
.include "io.asm"


.data
	str1: .asciiz "Digite o num a ser processado: "
	str2: .asciiz "O Fatorial do num eh: "

.text
main:
		#int fat(int n){
		# if(n == 1) || (n == 0) return 1
		# return n*fat(n-1)} 
		
		printStr(str1)
		readInt
		#armazenar o inteiro lido num reg seguro		
		add		$s0, $zero, $v0		# s0 contem o inteiro lido (n)
		
		#(1) setar os argumentos
		add		$a0, $zero, $s0
		#(2) chamar a funcao
		jal		FAT

		#recupera o valor de retorno
		add		$s1, $zero, $v0
		
		printStr(str2)
		printInt($s1)

		return0

#codigo da funcao fatorial				
FAT:	#(3)  salva o contexto
		push

		beq		$a0, $zero, EHZERO
		addi	$t0, $zero, 1
		beq		$a0, $t0, EHUM
		j		CONTINUE
EHZERO:
EHUM:		
		
		#(4) restaura o contexto
		pop
		
		#(5) define o valor de retorno
		addi 	$v0, $zero, 1
		
		#(6) retorna da funcao
		jr		$ra
CONTINUE:
		# return n*fat(n-1)
			
		addi	$t0, $a0, -1  # temp = n-1
		add		$s3, $zero, $a0 #salva o n atual no s3
		add		$a0, $zero, $t0 # seta o argumento para n-1
		jal		FAT
		
		#(7) recupera o valor de retorno v0
		mult	$s3, $v0
		
		#(4) restaura o contexto
		pop
		
		#(5) define o valor de retorno
		mflo	$v0
		
		#(6) retorna da funcao
		jr		$ra
		
		
