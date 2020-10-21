.data
array: .word 112, 6, 22, 1, 913, 23, 78, 200, 233, 251, 345, 142, 5, 761
newline: .asciiz ", "

.text


Main: 
	#la    $a0, array		#array base address
	lui $1, 4097 
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	ori $4, $1, 0
	
	addi  $5, $0, 14 	#array size
	jal BubbleSort
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0

	addi $v0, $0, 10 
	syscall

BubbleSort:


#la $t0, array  # load array address
#lb $t1, 5($t0) # get 6th byte from offset
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
addi $t0, $t0, 0 #int i
addi $t1, $t1, 0 #int j
addi $t2, $a1, 0 #size of array
addi $t3, $t3, 0 #comparison variable
addi $s1, $s1, 0 #array address
addi   $s0, $a0, 0  #load base address for the array passed from function

outerloop:
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	beq $t0, $t2 exit	#if int i == len(array)
	addi $0, $0, 0
	addi $t0 ,$t0, 1	#i++
	addi $t1, $zero, 0	#reset j to 0
	addi $s1, $s0,  0	#reset address to base address
	j innerloop
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0

innerloop:
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	sub $t5, $t2, $t0	#n-i
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $1, $0, 1
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	sub $13, $13, $1
	slt $t3, $t1, $t2
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	beq $t3, $0, outerloop # if( j < n-i-1) we break the loop
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	lw $t6, 0($s1) 		#load first  int
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	lw $t7, 4($s1) 		#load second int
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	slt $t3, $t7, $t6 	# t3 = second < first
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $1, $0, 1
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	beq $t3, $1, swap
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0

	#end loop increase j loop back
	addi $t1, $t1, 1	#j++
	addi $s1, $s1, 4	#base address +=4
	j innerloop
	addi $0, $0, 0

swap:
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $t5, $t6, 0   	#temp = t6
	addi $t6, $t7, 0	#t6   = t7
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $t7, $t5, 0	#t7   = temp
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	sw $t6, 0($s1)
	sw $t7, 4($s1)
	


	addi $t1, $t1, 1	#j++
	addi $s1, $s1, 4	#base address +=4
	j innerloop
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0

exit:
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $t5, $zero, 0	#t5 will be used as i
	add $s1, $zero, $s0 	#set current address to base address
	j printArray
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	

	

printArray:
#s0 base
#s1 address
#t2 array size

	
	slt $t3, $t5, $t2	#if( t5 < t2)  go to end
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	beq $t3, $0, end		#otherwise load array[i] and print
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	#print integer at array[i]
	lw $t6, 0($s1)   	#load array[i]
	addiu $v0, $0, 1		#syscall to print int
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0
	addi $a0, $t6, 0	#load value into printer
	syscall			#print value
	
	#print newline for organization
	addiu $v0, $0, 4		#syscall to print int
	lui $1, 4097
	addi $0, $0, 0
	addi $0, $0, 0
	addi $0, $0, 0	#load value into printer
	ori $4, $1, 0x00000038
	syscall			#print value

	addi $t5, $t5, 1
	addi $s1, $s1, 4
	j printArray
	addi $0, $0, 0

end:
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
jr $ra
addi $0, $0, 0













