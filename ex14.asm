.text

.globl main
main:
li $a0, 5
jal function

move $a0, $v0
li $v0, 1
syscall

li $v0, 10
syscall

function:
move $t0, $a0
li $t1, 0
loop : beq $t0, 0, end
add $t1, $t1, $t0
sub, $t0, $t0, 1
b loop
end: move $v0, $t1
jr $ra 
