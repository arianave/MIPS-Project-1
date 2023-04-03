# Name: Taylor Knobloch, Ariana Villagrana
# Date: April 2nd, 2023
# Assignment: Program 1
# Description: A program that will fulfill 3 tasks
	# Task 1: Practice getting user input, moving them to register, and printing them back to the user
	# Task 2: Using the user input values in registers $s0 and $s1 then output the results by completing,
		# addition, subtraction, multiplication, division
	# Task 3: Practice the use of conditions,
		# 1. If the user inputs from Task 1 are equal to each other, output "User inputs are the same"
		# 2. If the two user inputs from Task 1 are not equal to each other, output "User inputs are different"
# Github Repository: https://github.com/arianave/MIPS-Project-1.git


.data
# Declaring header strings
info: .asciiz	"This program will ask for two ints and perfom the following operations: addition, subtraction, mulitplication, and division\n"

add_header: .asciiz "\n--Addition--"
sub_header: .asciiz "\n--Subtraction--"
multi_header: .asciiz "\n--Multiplication--"
div_header: .asciiz "\n--Division--"
r: .asciiz " R: "

# Declaring strings for user input
firstNum: .asciiz	"Type first Integer: "
secondNum: .asciiz	"Type second Integer: "

# Declarings strings for returns
result: .asciiz "\nFinal result is equal to \n"
same: .asciiz "\n\nUser inputs are the same\n"
diff: .asciiz "\n\nUser inputs are different\n"

.text
main:
# Getting the inputs for both integers
	# Printing info string
	li $v0, 4
	la $a0, info
	syscall

	# Printing firstNum
	li $v0, 4
	la $a0, firstNum
	syscall

	# Getting user input
	li $v0, 5
	syscall
	move $s0, $v0		#Int1 is held in $s0

	# Printing secondNum
	li $v0, 4
	la $a0, secondNum
	syscall

	# Getting user input
	li $v0, 5
	syscall
	move $s1, $v0		#Int2 is held in $s1

# Printing the arthithemtic operations
	# Printing add_header
        li $v0, 4
        la $a0, add_header
        syscall

	# Adding firstNum and secondNum
	add $t1, $s0, $s1	# Storing add result in $t1

	li $v0, 4
	la $a0, result
	syscall

	li $v0, 1
	la $a0, ($t1)
	syscall

	# Printing sub_header
	li $v0, 4
        la $a0, sub_header
        syscall

        # Subtraction firstNum and secondNum
        sub $t2, $s0, $s1	# Storing sub result in $t2

	li $v0, 4
	la $a0, result
	syscall

	li $v0, 1
	la $a0, ($t2)
	syscall

        # Printing multi_header
        li $v0, 4
        la $a0, multi_header
        syscall

        # Multiplying firstnum and secondNum
        mul $t3, $s0, $s1	# Storing mul result in $t3

	li $v0, 4
	la $a0, result
	syscall

	li $v0, 1
	la $a0, ($t3)
	syscall


        # Printing div_header
        li $v0, 4
        la $a0, div_header
        syscall

        # Dividing firstNum and secondNum
        div $s0, $s1	# dividing first and second integer

        mflo $s2 #quotient
        mfhi $s3 #remainder

	li $v0, 4	#prints out the result string
	la $a0, result
	syscall

	li $v0, 1
	la $a0, ($s2) #prints out quotient
	syscall

	li $v0, 4
	la $a0, r     #prints out remainder string
	syscall

	li $v0, 1
	la $a0, ($s3) #prints out the remainder
	syscall


# Comparing user inputs
	# Checking if user inputs are the same
	#beq
	beq $s0, $s1, equal

	# Checking if use inputs are different
	#bne
	bne $s0, $s1, notEqual

	equal:  #will print this section of code saying that user inputs are the same
	li $v0, 4
	la $a0, same
	syscall

	j exit #this will prevent the code from also going through the notEqual code if the two user inputs are equal and will instead exit the program

	notEqual: #will print this section of code saying that user inputs are different
	li $v0, 4
	la $a0, diff
	syscall


exit: 	# Exits program
	li $v0, 10
	syscall
