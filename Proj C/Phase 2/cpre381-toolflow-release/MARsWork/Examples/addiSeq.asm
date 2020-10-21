#
# First part of the Lab 3 test program
#

# data section
.data

# code/instruction section
.text
addi $t1, $0, 1
addi $t2, $0, 2
addi $t0, $0, 1
addi $t3, $0, 2
sub $t5, $t2, $t0	#n-i
subi $t5, $t5, 1	#t5-1
slt $t3, $t1, $t2
beq $t3, 0, outerloop # if( j < n-i-1) we break the loop
	
end:
addi  $2,  $0,  10              # Place "10" in $v0 to signal an "exit" or "halt"
syscall  

outerloop:
j end