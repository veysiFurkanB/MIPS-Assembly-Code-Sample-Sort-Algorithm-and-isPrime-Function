#A list is defined here
.data
my_array: .word 42, 23, 16, 15, 8, 4
.text
la $s0, my_array    # based address of list loaded into $s0
addi $s1, $zero, 6 # $s1 is set to the size of the list 

move $a0, $s0
add $t0, $0, $0		#set index = 0
add $t1, $0, $0		#set i = 0
for_loop:
	beq $t0, $s1, Exit
	
	sll $t2, $t1, 2		# i*4
	add $t2, $t2, $s0	# address of $s0[i]
	lw $a0, 0($t2)		# $t2 = my_array[i]
	
	sll $t3, $t0, 2		# index * 4
	add $t3, $t3, $s0	# adress of $s0[index]
	
	jal is_prime		# go to the is_prime function
	
	sw $v0, 0($t3)		#my_array[index] = $v0
	addi $t0, $t0, 1
	addi $t1, $t1, 1
	
	j for_loop
	
is_prime:
	addi $t4, $0, 2 	# set j = 2
	
	loop:
		beq $a0, $t4, func_exit # if j = x go exit
		remu $t5, $a0, $t4	#$t5 = x % j 
		beq $t5, $0, return_0	
		j return_1

		return_0:
			add $v0, $0, $0
			j func_exit
			
		return_1:
			addi $v0, $0, 1
			addi $t4, $t4, 1
			j loop
			
	func_exit:
		jr $ra
		

Exit:
	
	li $v0, 10
	syscall	
	
		
	
