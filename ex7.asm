.data
	A: .word 101
	oddNumber: .asciiz "Impar number \n"
	evenNumber: .asciiz "Par number \n"
.text
	lw $s0, A($zero)
	addi $t0, $zero, 2
	
	div $s0, $t0
	mfhi $t0 # Carrega o resto da divisao
		
	beq $t0, $zero, ELSE
    	li $v0, 4
    	la $a0, oddNumber
    	syscall
		j DONE
		ELSE:
		li $v0, 4
    	la $a0, evenNumber
    	syscall
		
	DONE: