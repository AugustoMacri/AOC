.macro push
	sw $ra, 0   ($sp)
	sw $a0, -4  ($sp)
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
	addi $sp, $sp, -52
.end_macro

.macro pop
	addi $sp, $sp, 52
	lw $ra, 0   ($sp)
	lw $a0, -4  ($sp)
	lw $a1, -8  ($sp)
	lw $a2, -12 ($sp)
	lw $a3, -16 ($sp)
	sw $s0, -20 ($sp)
	sw $s1, -24 ($sp)
	sw $s2, -28 ($sp)
	sw $s3, -32 ($sp)
	sw $s4, -36 ($sp)
	sw $s5, -40 ($sp)
	sw $s6, -44 ($sp)
	sw $s7, -48 ($sp)
.end_macro
		
	
	
	