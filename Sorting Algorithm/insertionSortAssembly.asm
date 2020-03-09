#A list is defined here
.data
my_array: .word 12, 11, 13, 5, 6, 43, 2
.text
la $s0, my_array    # based address of list loaded into $s0
addi $s1, $zero, 7 # $s1 is set to the size of the list 

move $a0, $s0
move $a1, $s1

jal insertionSort

add $t0, $0, $0		#some variable to print = 0
print_loop:
	beq $s1, $t0, end
	sll $t1, $t0, 2
	add $t2, $t1, $s0
	
	lw $t8,0($t2)
	li $v0, 1
	addi $a0, $t8, 0
	syscall
	
	addi $t0, $t0, 1
	j print_loop
	
end:
	li $v0, 10
	syscall

insertionSort:
	addi $t1, $zero, 1	#set i to 1
	
	for_loop:
		beq $t1, $a1, Exit	#if i = len(my_array) go to exit
		
		sll $t3, $t1, 2		#4*i
		add $t3, $t3, $a0	#address of $s0[i]
		lw $t0, 0($t3)		#key = my_array[i]
		
		addi $t2, $t1, -1	#j = i -1
	
		check_and_while:
			sll $t4, $t2, 2		# 4*j
			add $t9, $t4, $a0	# address of $s0[j]
			lw $t6, 0($t9)		# $t6 = my_array[j]
			
			addi $t7, $t4, 4	# $t7 = 4j + 4
			add $t8, $t7, $a0 	# address of $s0[j+1]
		
		 	beq $t2, $0, while	#if j == 0 go check
			slt $t5, $0, $t2	#if j > 0 then $t5 = 1 
			beq $t5, 1, while	#if $t5 = 1 go check
			j end_of_for
		
			while:
				slt $t5, $t0, $t6	#if key < my_array[j] then $t5 = 1
				beq $t5, $0, end_of_for #if t5 = 0 go end_of_for
				
				sw $t6, 0($t8)
				addi $t2, $t2, -1	# j = j - 1
				j check_and_while	
	
		end_of_for:
			sw $t0, 0($t8)
			addi $t1, $t1, 1	#i = i + 1
			j for_loop

	Exit:
		jr $ra
