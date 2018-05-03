#assignment
#Name: Ozore Efeoghene Jesse
#mat_no; COS/1721/2016
#Department: Computer Science
#A program to compute the root of a quadratic equation

.data
	purpose:.asciiz"A program to compute and solve the root of a quadratic equation"
	input1:.asciiz"Enter value for A: \n"
	input2:.asciiz"Enter value for B: \n"
	input3:.asciiz"Enter value for C: \n"
	output1:.asciiz"Sorry, Complex Number! \n"
	digit1:.float 4.0
	digit2:.float 2.0
	output2:.asciiz"The roots are:\n"
	output3:.asciiz" and  "
	output5:.asciiz"\n\n"

.text
main:
	lwc1 $f6,digit1
	lwc1 $f7,digit2
	
	#purpose of the program
	li $v0,4
	la $a0,purpose
	syscall
	
	li $v0,4
	la $a0,output5
	syscall
	
	#prompt/request the user for value of A
	li $v0,4
	la $a0,input1
	syscall
	
	li $v0,6
	syscall
	mov.s $f1,$f0
	
	#prompt/request the user for value of B
	li $v0,4
	la $a0,input2
	syscall
	
	li $v0,6
	syscall
	mov.s $f2,$f0
	
	#prompt/request the user for value of c
	li $v0,4
	la $a0,input3
	syscall
	
	li $v0,6
	syscall
	mov.s $f3,$f0
	
	
	jal Solution
	
	li $v0,4
	la $a0,output2
	syscall
	
	li $v0,2
	mov.s $f12,$f11
	syscall
	
	li $v0,4
	la $a0,output3
	syscall
	
	li $v0,2
	mov.s $f12,$f13
	syscall
	
	
	b exit
	
	Solution:
	
	# the calculation for a * c
	mul.s $f30,$f1,$f3
	
	# the calculation for 4 * a * c
	mul.s $f29,$f30,$f6
	
	# the calculation for b * b
	mul.s $f28,$f2,$f2
	
	# the calculattion for b square (b ^ 2)-4*a*c
	
	sub.s $f27,$f28,$f29
	
	mfc1 $t2,$f27
	
	bltz $t2 output
	sqrt.s $f26,$f27
	neg.s $f9,$f2
	add.s $f25,$f9,$f26
	sub.s $f22,$f9,$f26
	mul.s $f8,$f7,$f1
	div.s $f11,$f25,$f8
	div.s $f13,$f22,$f8
	jr $ra
	
	output:
	li $v0,4
	la $a0,output1
	syscall
	
	exit: 
	li $v0,10
	syscall
	