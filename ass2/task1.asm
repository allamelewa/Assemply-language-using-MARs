.data 
str1: .asciiz "Enter an integer value: "
str2: .asciiz "Your Entered: "

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


