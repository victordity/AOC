.data
	b: .word 36
	c: .word 27
.text
	lw $s0, b($zero)
	lw $s1, c($zero)
	add $s2, $s0, $s1 # a = b + c
	addi $s2, $s2, 100 # a = b + c + 100
	li $v0, 1
	addi $a0, $s2, 0
    	syscall