.data
str1: .asciiz "Enter Your Name: "
str2: .asciiz "\nHello "

.text
main:
li $v0,4
la $a0,str1
syscall 
li $v0,8 
li $a1,10
move $s1,$a0
syscall 
li $v0,4
la $a0,str2
syscall 
li $v0,4
move $a0,$s1
syscall 