#Carlos B. Davila

main:

.data
        fibonacci: .asciiz  "Running a stack"
        newline: .asciiz "\n"
.text

	addi $s0, $zero, 10
	
	jal increase

	li $v0, 1 
	move $a0, $s0 #print 10
	syscall

	j exit

increase:
	addi $sp, $sp -4
	sw $s0, 0($sp)
	
	addi $s0, $s0, 30

	#print new value in function

	li $v0, 1
	move $a0, $s0
	syscall

 	lw $s0, 0($sp)	
	addi $sp, $sp, 4
	jr $ra

#exit program


exit:
        li $v0, 10      #code for exit
        syscall

