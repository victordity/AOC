 .text
 	addi $t1, $zero, 1
 	addi $t2, $zero, 2
 	
	addi $v0, $zero, 5
	syscall
	add $a0, $zero, $v0
	
	addi $v0, $zero, 5
	syscall
	add $a1, $zero, $v0
	
	addi $v0, $zero, 5
	syscall
	add $a2, $zero, $v0
	
	beq $a2, 4, NO
	bne $a0, 2, NO
	bne $a1, 3, NO
	
	li $v0, 1
	addi $a0, $t1, 0
    	syscall
    	j DONE
    	
	NO:
	li $v0, 1
	addi $a0, $t2, 0
    	syscall
    	
    	DONE: