#Carlos B. Davila
#CST 450
#Lab 1

main:

.data
	array: .space 80	#array for 20 elements #testing
        fibonacci: .asciiz  "Fibonacci series...numbers < 1000\nReverse order\n"
	newline: .asciiz "\n"
.text

#Program Start
	li $v0,4	#get ready to print string
	la $a0, fibonacci
	syscall		

	li $t0, 0	#n-2
	li $t1, 1	#n-1
	li $t2, 0	#comparator
	li $t3, 0	#current(total)
	li $t5, 0	#counter
	li $t7, 0
#start fibonacci	

fib:
	slti $t2, $t0, 1000	#$t2 = 1 if $t1 < 1000, else $t2 = 0
	beq $t2, $0, istack 	#jump if $t1 > 1000

	addi $t5, $t5, 1	#increment by 1

	jal addToArray          #jump and add to array
	add $t3, $t0, $t1	# (n-1)+(n-2)

	move $t1, $t0
	move $t0, $t3
	j fib 

#initialize the stack size
istack:
	sll $t5, $t5, 2		#multiply count by 4
	not $t5, $t5		#twos compliment of total count	
	addi $t5, $t5, 1	#stack position
	move $t7, $zero		#array position
	add $sp, $sp, $t5	#get space on stack
stackem:
	beq $t5,$zero, print1
	lw $t4, array($t7)	#verify stack position variable
	addi $sp, $sp, 4        #increment the stack
	sw $t4, 0($sp)		#store in stack location
	addi $t7, $t7, 4	#increment array counter by 4
	addi $t5, $t5, 4	#increment comparator by 4
	j stackem

#print values from stack
print1:
	not $t7, $t7
	addi $t7, $t7, 1	
print2:
	beq $t7, $t5, exit	#jump when at bottom of stack
	lw $t0, 0($sp)		#load current value at position
	addi $sp, $sp, -4	#move stack pointer
	addi $t7, $t7, 4

	li $v0, 1       #print value
        move $a0, $t0
        syscall
        li $v0, 4       #print new line
        la $a0, newline
        syscall
j print2

jr $ra 

#exit the program
exit:
	li $v0, 10	#code for exit
	syscall

addToArray:
	sw $t0, array($t7)
	lw $t4, array($t7)
	addi $t7, $t7, 4	

	jr $ra


