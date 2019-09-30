.data
    myMessage: .asciiz "Hello World! \n"
    myCharacter: .byte 'm'
    age: .word 23
.text
    li $v0, 4 # Printar uma frase ou char
    la $a0, myCharacter
    syscall
    li $v0, 4
    la $a0, myMessage
    syscall
    li $v0, 1 # Printar uma word (4 bytes)
    lw $a0, age
    syscall
    