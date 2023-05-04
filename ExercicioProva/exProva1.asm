#ler 10 inteiros, armazenar em um array de 10 inteiros (inicializados em 0). 
#A seguir o programa deve chamar uma funcao, que calcula o cubo de todos os elementos do array e substituir nos valores previamente armazenados.
#por fim a função deve imprimir os cubos dos numeros lidos
#salve e restaure da pilha todas as variaveis pertinentes

.include "macros_pursh_pop.asm"

.data

	arr: .space 40 #reserva um espaco de 40 bits na memoria para receber os valores
	
.text
	add $s0, $zero, $zero 	#i == 0 (contador)
	add $s2, $zero, $zero 	#j == 0 (contador)
	la $s7, arr, #ponteiro que aponta para o array
	
	
	#(1) declarar um For que ira ler os 10 valores inteiros (eles precisam ser salvos)
FORi:
	#for(i=0, i<10, i++)
	slti $t0, $s0, 10	
	beq $t0, $zero, SAIFORi
	
	#ler inteiro 
	li $v0, 5
	syscall
	
	#salvar inteiro
	add $s1, $zero, $v0	#inteiro salvo em $s1
	
	#armazenar o conteudo de $s1 onde $s7 está apontando 
	#STORE WORD
	sw $s1, 0($s7) #colocar o conteudo de $s1 
	addi $s7, $s7, 4 #ir de 4 em quatro bytes
	
	#incremento de i
	addi $s0, $s0, 1
	j FORi
	
SAIFORi:
	la $a0, arr #tipo uma passagem por parametro (pega o endereço da primeira posição e joga para $a0)
	jal CUBO
	
	li $v0, 10
	syscall


#passar $s7 para $a0
CUBO:
	push #registradores limitados (reutilizacao perde eles) entao salva o estado deles antes de receber a mudanca
	slti $t0, $s2, 10 #10 porque eh o numero de posicao do array
	beq $t0, $zero, SAI
	lw $s3, 0($a0)
	
	mul $s4, $s3, $s3 #aqui sera realizado o quadrado do valor
	mul $s5, $s4, $s3 #aqui sera multiplicado o quadrado mais uma vez (cubo)
	
	sw $s5, 0($a0)   #armazena na mesma posicao antes colocada
	addi $a0, $a0, 4 #pegar a prox posicao do vetor 
	
	li $v0, 1
	push
	add $a0, $zero, $s5
	syscall
	pop
	
	addi $s2, $s2, 1
	
	j CUBO
SAI: 
	pop #pegar o que salvou e retornar o que estava antes para voltar ao estado normal
	jr $ra
