#
# First part of the Lab 3 test program
#

# data section
.data

# code/instruction section
.text

jal stop
addi $0, $0, 0
addi  $2,  $0,  10              # Place "10" in $v0 to signal an "exit" or "halt"
syscall  

stop:
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
addi $1, $0, 1
jr $31 
addi $0, $0, 0                   # Actually cause the halt
