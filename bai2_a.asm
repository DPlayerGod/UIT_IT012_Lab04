	.data	
str1: .asciiz "\nNhap ki tu:\n"
prev: .asciiz "\nKy tu truoc: "
next: .asciiz "\nKy tu sau: "
digitType: .asciiz "\nType: Digit"
lowercaseType: .asciiz "\nType: Lowercase"
uppercaseType: .asciiz "\nType: Uppercase"
invalidType: .asciiz "\ninvalid type\n"
	.text
_start:
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 12
	syscall
	move $t7, $v0
	
	li $t1, 48 # ASCII code of '0'	
	li $t2, 58 # ASCII code of '9' + 1
	li $t3, 65 # ASCII code of 'A'
	li $t4, 91 # ASCII code of 'Z' + 1
	li $t5, 97 # ASCII code of 'a'
	li $t6, 123 # ASCII code of 'z' + 1
	slt $t0, $v0, $t1
	bne $t0, $zero, invalid
	slt $t0, $v0, $t2
	bne $t0, $zero, digit
	slt $t0, $v0, $t3
	bne $t0, $zero, invalid
	slt $t0, $v0, $t4
	bne $t0, $zero, uppercase
	slt $t0, $v0, $t5
	bne $t0, $zero, invalid
	slt $t0, $v0, $t6
	bne $t0, $zero, lowercase
digit:
	li $v0, 4
	la $a0, digitType
	syscall
	j process
lowercase:
	li $v0, 4
	la $a0, lowercaseType
	syscall
	j process
uppercase:
	li $v0, 4
	la $a0, uppercaseType
	syscall
	j process
process:
	li $v0, 4
	la $a0, prev
	syscall
	li $v0, 11
	subi $a0, $t7, 1
	syscall
	li $v0, 4
	la $a0, next
	syscall
	li $v0, 11
	addi $a0, $t7, 1
	syscall
	j END
invalid:
	li $v0, 4
	la $a0, invalidType
	syscall
	j END
END: