.data
	str: .asciiz "abacate loro do bico dourado"
	char1: .asciiz "a"
	char2: .asciiz "#"
.text
lw $s0, str($zero)
lw $s2, char1($zero)
lw $s3, char2($zero)
add $s1,$s1,$zero #initializing $s1 to 0
loop:
    add $t0,$s0,$s1
    lb $t1,0($t0)
    bne $t1,$s2,skip_replace
    sb $s3,0($t0)
    skip_replace:
    addi $s1,$s1,1
    bne $t1,$zero,loop
print:
    li $v0, 4
    addi $a0, $t1, 0
    syscall