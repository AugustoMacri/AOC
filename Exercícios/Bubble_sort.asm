#bublesort.asm
#
#DESC: implementa o algoritmo de ordenacao bubblesort
#
#DDA 31.10.22
#
# int v = {3, 2, 1, 4, 8, 6, 5, 9, 7}
# void bubbleSort(int *v, int n){
 
#    for (int i=0; i<n; i++)
#        if (v[i] > v[i+1])
#            swap(&v[i], &v[i+1]);  
#    bubbleSort(v, n-1);
#
#.include "io.asm"

.data
	v: .word 3, 2, 1, 4, 8, 6, 5, 9, 7

.text
	#parametro de funçoes são normalmente salvos em $a
	#ganhar acesso a tosort[0]
	la $s7, v	#endereço para a primeira posição do array
		
	#tamanho do array
	addi $s6, $zero, 9
	addi $s5, $zero, 8 #comparamos até a penultima posição
	
	addi $s1, $zero, 0 #setando i=0
	add $s0, $zero, $zero #setando j=0
	
FORi:
	slt $t1, $s1, $s5     
	beq $t1, $zero, SAIDA 
	li $s0, 0
		
FORj:
	slt $t0, $s0, $s6  
	beq $t0, $zero, FORi
	
	sll $t3, $s0, 2 	#multiplicando 
	add $t3, $s7, $t3	#avançandp uma posição no vetor
	
	lw $t4, 0($t3)		#carregando a posicao atual no $t4
	lw $t5, 4($t3)		#carregando a proxima posicao em t5
	
	slt $t0, $t5, $t4	#verificando se v[j] < v[j+1] / t0=0 true | t0=1 false  ??????????????????
	beq $t0, $zero, INCREMENTOj #se t0=0, incrementa j
	
	sw $t4, 4($t3) #salvando v[j+i] no registrador t3
	sw $t5, 0($t3) #salvando v[j] no registrador t3
	
	beq $s1, $zero, INCREMENTOi 

INCREMENTOj: 
	addi $s1, $s1, 1
	j FORi
	
INCREMENTOi:
	addi $s0, $s0, 1
	j FORj
	
SAIDA:
	li $s2, 0
	
FORk:
	#imprimindo o array ordenado
	slt $t2, $s2, $s6
	beq $t2, $zero, FIM
	
	sll $t3, $s2, 2
	add $t3, $s7, $t3
	
	lw $t4, 0($t3)
	
	li $v0, 1 
	add $a0, $zero, $t4
	syscall
	
	addi $s2, $s2, 1 #incrementar k (K++)
	j FORk
	
FIM:
	li $v0, 10
	syscall
	

		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

