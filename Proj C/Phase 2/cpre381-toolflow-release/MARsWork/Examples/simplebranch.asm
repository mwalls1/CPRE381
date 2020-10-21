
lui $1, 4097
addi $2, $0, 100
sw $2, 0($1)
lw $3, 0($1)
addi $3, $3, 100



li   $v0, 10          # system call for exit
syscall               # Exit!
