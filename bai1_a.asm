	.data
	.text

main:
	li $v0, 5	# Nhap i
	syscall
	move $s0, $v0
	
	li $v0, 5	# Nhap  j
	syscall
	move $s1, $v0
	
	li $v0, 5	# Nhap g 
	syscall
	move $t0, $v0
	
	li $v0, 5	# Nhap h 
	syscall
	move $t1, $v0
	
	# Cau truc re nhannh
	bne $s0, $s1, ELSE	#So sanh i va j
IF:
	add $s2, $t0, $t1	# f = g + h
	j PRINT
ELSE:
	sub $s2, $t0, $t1 	# f = g - h
PRINT:
	li $v0, 1	# In f
	move $a0, $s2
	syscall