.data 
str: .asciiz "Calculate of $s1 = 0x87654321"
str1: .asciiz "\nS2: "
str2: .asciiz "\nS3: "
str3: .asciiz "\nS4: "

.text 
main:
li $v0,4
la $a0,str
syscall 
la $s1,0x87654321
sll $s2,$s1, 16 
srl $s3,$s1, 8 
sra $s4,$s1, 12
syscall 
li $v0,4
la $a0,str1
syscall 
la $v0,1
move $a0,$s2
syscall 
li $v0,4
la $a0,str2
syscall 
la $v0,1
move $a0,$s3
syscall 
li $v0,4
la $a0,str3
syscall 
la $v0,1
move $a0,$s4
syscall 
