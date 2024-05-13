	.data
n1: 	.asciiz "Nhap so thu nhat: "
n2: 	.asciiz "Nhap so thu hai: "
bigger: .asciiz "So lon hon la "
tong: 	.asciiz "\nTong: "
hieu: 	.asciiz "\nHieu: "
tich: 	.asciiz "\nTich: "
thuong: .asciiz "\nThuong "

	.text
	
main:
	#Nhap so thu nhat
	li $v0, 4 
	la $a0, n1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#Nhap so thu hai
	li $v0, 4
	la $a0, n2
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	#in so lon hon
	li $v0, 4
	la $a0, bigger
	syscall
	
	bgt $s0, $s1, DO
	move $a0, $s1
	li $v0, 1
	syscall
	j NEXT
DO:
	move $a0, $s0
	li $v0, 1
	syscall
NEXT:
 	#Tong
	li $v0, 4
	la $a0, tong
	syscall
	add $a0, $s1, $s0
	li $v0, 1
	syscall
	
	#Hieu
	li $v0, 4
	la $a0, hieu
	syscall
	sub $a0, $s0, $s1
	li $v0, 1
	syscall
	
	# Tich
	li $v0, 4	 
	la $a0, tich
	syscall
	mult $s0, $s1
	mflo $t0
	move $a0, $t0
	li $v0, 1
	syscall
	
	#Thuong
	li $v0, 4
	la $a0, thuong
	syscall
	div $s0, $s1
	mflo $t0
	move $a0, $t0
	li $v0, 1
	syscall
	
	
