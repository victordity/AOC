.data
	N: .word 10
	nextLine: .asciiz " \n"
	space: .asciiz " "
.text
	lw $s0, N($zero)
	move $s1, $zero # i
	move $t0, $zero # Count
	FOR1:
		li $v0, 4
    	la $a0, nextLine
    	syscall
		addi $s1, $s1, 1 # i++
		addi $t0, $zero, 0 # Count = 0
		slt $t1, $s1, $s0
		beq $t1, $zero, DONE
		FOR2:
			slt $t2, $t0, $s1
			beq $t2, $zero, FOR1
			addi $t0, $t0, 1
			# Printa o numero
			li $v0, 1
    		move $a0, $t0
    		syscall
    		# Printa o espaco
    		li $v0, 4
    		la $a0, space
    		syscall
		j FOR2
	DONE:
	
	