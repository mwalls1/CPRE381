#
# First part of the Lab 3 test program
#

# data section
.data

# code/instruction section
.text

addi $1, $0, 2000
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
addi $0, $0, 0
addi $2, $1, 0

addi  $2,  $0,  10              # Place "10" in $v0 to signal an "exit" or "halt"
syscall  

