.data
value: .word 5
v: .word 7, 8, 3, 4, 5, 6 

.text
la $a0, v
li $a1, 6
lw $a2, value($zero)
jal AddValue
j DONE

AddValue:
addi $sp, $sp, -16
sw $t0, 12($sp)
sw $t1, 8($sp)
sw $s1, 4($sp)
sw $t2, 0($sp)

li $s1, 0
move $t2, $a1

FOR:
	beq $t2, $s1, ENDFOR
	sll $t0, $s1, 2 # Indice 1
	add $t0, $t0, $a0 # address of array[i]
	lw $t1, 0($t0) # $t1 = array[i]
	add $t1, $t1, $a2 
	sw $t1, 0($t0) # array[i] = 100
	addi $s1, $s1, 1

	# Printa o valor do array
	la $s0, ($a0)
	li $v0, 1
    add $a0, $zero, $t1
    syscall
    la $a0, ($s0)
	j FOR
ENDFOR:

lw $t2, 0 ($sp)
lw $s1, 4($sp)
lw $t1, 8($sp)
lw $t0, 12($sp)
addi $sp, $sp, 16

jr $ra

DONE: