.data
string: .asciiz "Para trabajar basta estar convencido de una cosa: que trabajar es menos aburrido que divertirse."
.text
.globl main
main: sub $sp, $sp, 24
sw $ra, 20($sp)
sw $a0, 4($sp)
la $a0, string
jal Vowels
move $a0, $v0
li $v0, 1
syscall
lw $ra, 20($sp)
lw $a0, 4($sp)
addi $sp, $sp, 24
li $v0, 10
syscall
jr $ra
Vowels: li $t0, -1 # count the number of ‘a’
move $t1, $a0
beqz $t1, DONE
li $t0, 0
li $t2, 'a'
LOOP: lbu $t3, ($t1)
beqz $t3, DONE
bne $t3, $t2, ZERO_AS
addi $t0, $t0, 1
ZERO_AS: addi $t1, $t1, 1
b LOOP
DONE: move $v0, $t0
jr $ra
