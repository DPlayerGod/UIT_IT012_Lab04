# Tong cac so tu 1 den N
	.data
	.text
main:
	addi $s2, $zero, 0 	#sum = 0
	addi $s0, $zero, 1	# i = 1
	
	li $v0, 5	#Nhap N
	syscall
	move $s1, $v0
	
	loop:
		slt $t0, $s1, $s0
		bne $t0, $zero, endloop
		DO:
			add $s2, $s2, $s0	#sum += i
			addi $s0, $s0, 1	# i++
			j loop
	endloop: 	#Ket thuc vong lap va in sum
		li $v0, 1
		move $a0, $s2
		syscall