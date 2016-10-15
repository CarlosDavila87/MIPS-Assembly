#Carlos B. Davila
#CST 450
#Lab 1

main:

.data


	greet: .asciiz  "Hello World from SPIM!!!\n"
	terminatemessage: .asciiz "terminate?(1=Yes, 2=No) "
	errormessage: .asciiz "invalid option!!!\n"
	goodbye: .asciiz "Bye!!!"
.text

#GREETING
	greeting:
		li $v0, 4	#get ready to print a string
		la $a0, greet	#location of string
		syscall		#execute	

#TERMINATE MESSAGE 
		li $v0, 4			#get ready to print a string	
		la $a0, terminatemessage	#message to print
		syscall				#execute 

#GET INTEGER INPUT
		li $v0, 5		#get ready to read an integer
		syscall			#execute reading
		move $t0, $v0 		#store into $t0	

#BEGIN COMPARING	
	#if 1
		ori $t1, $zero, 1	#comparator to 1
		beq $t1, $t0, exit	#jump to exit if user input = 1	

	#if 2
		and $t1, $t1, $zero	#clear comparator $t0
		ori $t1, $zero, 2	#comparator to 2
		beq $t1, $t0, greeting	#greet again if user input = 2

#ERROR MESSAGE
	#else				#if user input != 1 or != 2. Error!
		li $v0, 4		#prepare to print error message	
		la $a0, errormessage
		syscall

		j greeting		#greet again for new input

#EXIT THE PROGRAM
	exit:
		li $v0, 4		#get ready to print string	
		la $a0, goodbye		#print goodbye string
		syscall
		li $v0, 10		#prepare to exit
		syscall			#execute exit
