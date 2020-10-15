.data 
str1: .asciiz "\nEnter an integer value: "
str2: .asciiz "Your Entered: "
str3: .asciiz "\nRepeat Again(Y,N)??"
s: "y"
.globl main

.text 
main:
li $v0,4
la $a0,str1
syscall 
li $v0,5
syscall 
move $s0,$v0
li $v0,4
la $a0,str2
syscall 
li $v0,1
move $a0,$s0
syscall 
li $v0,4
la $a0,str3
syscall 
li $v0,12
syscall 
beq $v0,'y',main
syscall 

