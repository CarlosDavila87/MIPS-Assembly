#Carlos B. Davila

main:

.data
        twos: .asciiz  "Twos Compliment on a stack"
        newline: .asciiz "\n"
.text

li $v0, 4
la $a0, twos
syscall

li $s0, 7		#attempt twos compliment of 7
not $s0, $s0	 	#NOT s0
addi $s0, $s0, 1 	#add 1

li $v0, 1
move $a0, $s0
syscall

exit:
        li $v0, 10      #code for exit
        syscall
