
.macro push
	sw		$ra,  0 ($sp)
	sw		$a0, -4 ($sp)
	sw		$a1, -8 ($sp)
	sw		$a2, -12($sp)
	sw		$a3, -16($sp)
	sw		$s0, -20($sp)
	sw		$s1, -24($sp)
	sw		$s2, -28($sp)
	sw		$s3, -32($sp)
	sw		$s4, -36($sp)
	sw		$s5, -40($sp)
	sw		$s6, -44($sp)
	sw		$s7, -48($sp)
	addi	$sp, $sp, -52
.end_macro

.macro pop
	addi	$sp, $sp, 52
	lw		$ra,  0 ($sp)
	lw		$a0, -4 ($sp)
	lw		$a1, -8 ($sp)
	lw		$a2, -12($sp)
	lw		$a3, -16($sp)
	lw		$s0, -20($sp)
	lw		$s1, -24($sp)
	lw		$s2, -28($sp)
	lw		$s3, -32($sp)
	lw		$s4, -36($sp)
	lw		$s5, -40($sp)
	lw		$s6, -44($sp)
	lw		$s7, -48($sp)
.end_macro

.macro return0
	li	$v0, 10
	syscall
.end_macro

.macro	readSingle
	li	$v0, 6
	syscall
.end_macro

.macro readInt
	li	$v0, 5
	syscall
.end_macro

.macro printInt(%r)
	li	$v0, 1
	add	$a0, $zero, %r
	syscall
.end_macro

.macro printStr(%s)
	li	$v0, 4
	la	$a0, %s
	syscall
.end_macro

.macro readStr(%b, %sz)
	li	$v0, 8
	add	$a1, $zero, %sz
	la	$a0, %b
	syscall
.end_macro

