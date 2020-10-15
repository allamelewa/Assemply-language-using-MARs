.data 
str1: .asciiz "Enter Char: "
str2: .asciiz "\nChar After Converter: "

.text 
main:
li $v0,4
la $a0,str1
syscall 
li $v0,12
syscall 
sub $s0,$v0,32
li $v0,4
la $a0,str2
syscall 
li $v0,11
move $a0,$s0
syscall 
