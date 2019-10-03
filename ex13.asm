.data 
list: .space 1025
value: .word 10
.text
la $s3, list # $s3 = Endereco do array
lw $t3, value($zero)

li $t2, 1024 # tamanho  do array
li $s1, 0 # i

FOR:
	beq $t2, $s1, ENDFOR
	sll $t0, $s1, 2 # Indice 1
	add $t0, $t0, $s3 # address of array[i]
	lw $t1, 0($t0) # $t1 = array[i] 
	sw $t3, 0($t0) # array[i] = value
	addi $s1, $s1, 1
	j FOR
ENDFOR: