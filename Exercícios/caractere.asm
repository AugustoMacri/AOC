.data

	caractere: .byte 'A' #Caracter a ser impresso

.text
	li $v0, 4 #Imprimir char ou string
	la $a0, caractere
	syscall