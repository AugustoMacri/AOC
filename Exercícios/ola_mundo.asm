.data
	#�rea para dados na mem�ria principal
	msg: .asciiz "Ol� mundo!" #Mensagem a ser exibida para o usu�rio

.text
	#�rea para instru��es do programa
	
	#instru��o para impress�o de string
	li $v0, 4
	la $a0, msg #indicar o endere�o em que est� a mendagem
	syscall #Imprima