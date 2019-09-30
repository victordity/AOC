.data
	A: .word 10
	B: .word 101
	restMessage: .asciiz "Not multiples \n"
	noRestMessage: .asciiz "Multiples \n"
.text
	lw $s0, A($zero)
	lw $s1, B($zero)
	div $s1, $s0
	
	mfhi $t0 # Carrega o resto da divisao
		
	beq $t0, $zero, ELSE
    	li $v0, 4
    	la $a0, restMessage
    	syscall
		j DONE
	ELSE:
		li $v0, 4
    	la $a0, noRestMessage
    	syscall
	DONE:
	