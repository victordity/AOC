.data
	maxValue: .word 101

.text
	lw $t1, maxValue($zero)
	li $s1, 0 #i
	move $s0, $zero # soma
	#FOR
	FOR: 
	slt $t0, $s1, $t1 # t0 = 0 se $s1 >= $s2 ( i >= 100), t0 = 1 caso contrário 
	beq $t0, $zero, DONE
		add $s0, $s0, $s1
		addi $s1, $s1, 1
		j FOR
	DONE:
  	li $v0, 1
    move $a0, $s0
    syscall