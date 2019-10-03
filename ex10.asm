.data
list: .space 1025 # Declarando array de inteiros

.text

jal function1
j DONE

function1:
addi $sp, $sp, -16
sw $ra, 12($sp)
sw $t1, 8($sp)
sw $s1, 4($sp)
sw $t0, 0($sp)

addi $s1, $0, 0 # i = 0
addi $t2, $0, 1024 # $t2 = 1000
la $s3, list # $s3 = Endereco do array

li $t2, 1024 # tamanho  do array
li $s1, 0 # i
FOR:
	beq $t2, $s1, ENDFOR
	sll $t0, $s1, 2 # Indice 1
	add $t0, $t0, $s3 # address of array[i]
	lw $t1, 0($t0) # $t1 = array[i] 
	sw $s1, 0($t0) # array[i] = i 
	addi $s1, $s1, 1
	j FOR
ENDFOR:

la $a1, ($s3)
li $a0, 1024 # a0 = 1024
jal SUM

move $t0, $v0
li $v0, 1
move $a0, $t0
syscall
    	
lw $t0, 0 ($sp)
lw $s1, 4($sp)
lw $t1, 8($sp)
lw $ra, 12($sp)
addi $sp, $sp, 16
 
jr $ra

SUM:
addi $sp, $sp, -16
sw $t2, 12($sp)
sw $t1, 8($sp)
sw $s1, 4($sp) # i
sw $t0, 0($sp) # n

move $t2, $a0 # Armazena variavel n = 1024
li $s1, 0
FOR2:
	slt $t0, $s1, $t2 # i < 1024?
 	beq $t0, $0, ENDFOR2 # if not then done 
 	
 	sll $t0, $s1, 2 # Indice 1
	add $t0, $t0, $a1 # address of array[i]
	lw $t1, 0($t0) # $t1 = array[i] 
	add $v0, $v0, $t1 # s = s + array[i]
	addi $s1, $s1, 1
	j FOR2

ENDFOR2:
lw $t0, 0 ($sp)
lw $s1, 4($sp)
lw $t1, 8($sp)
lw $t2, 12($sp)
addi $sp, $sp, 16

jr $ra

DONE:
