.data
	A: .word 100
	B: .word 20
.text
	lw $s0, A($zero)
	lw $s1, B($zero)
	sgt $t0, $s0, $s1
	beq $t0, $zero, ELSE
	li $v0, 1
    move $a0, $s0
    syscall
    j DONE
    ELSE:
    li $v0, 1
    move $a0, $s1
    syscall

	DONE: