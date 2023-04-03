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

.data
# Declaring header strings
info: .asciiz	"This program will ask for two ints and perfom the following operations: addition, subtraction, mulitplication, and division\n"

# Declaring strings for user input
firstNum: .asciiz	"Type first Integer: "
secondNum: .asciiz	"Type second Integer: "

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


exit: 	# Exits program
	li $v0, 10
	syscall
