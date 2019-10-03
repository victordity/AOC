.data
	A: .word 2
    B: .word 6
	C: .word 4

.text
lw $s0, A($zero)
lw $s1, B($zero)
lw $s2, C($zero)

bne $s0, 2, OR # A == 2?
bne $s1, 3, OR # B == 3?

DONE:
# Imprime 1
li $v0, 1
li $a0, 1
syscall
j EXIT

OR:
bne $s2, 4, DONE # C != 4?

li $v0, 1
li $a0, 0
syscall

EXIT: