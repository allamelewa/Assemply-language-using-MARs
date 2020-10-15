.data
str: .asciiz "S1:0x12345678, S2:0xffff9a00\n"
str1: .asciiz "\nAND Operation, S3: "
str2: .asciiz "\nOR Operation, S4: "
str3: .asciiz "\nXOR Operation S5: "
str4: .asciiz "\nNOR Operation S6: "
.text
main:
li $v0,4
la $a0,str
syscall 
la $s1,0x12345678
la $s2,0xffff9a00
and $s3,$s1,$s2 
or $s4,$s1,$s2 
xor $s5,$s1,$s2
nor $s6,$s1,$s2 
syscall 
li $v0,4
la $a0,str1
syscall 
li $v0,1
move $a0,$s3
syscall 
li $v0,4
la $a0,str2
syscall 
li $v0,1
move $a0,$s4
syscall 
li $v0,4
la $a0,str3
syscall 
li $v0,1
move $a0,$s5
syscall 
li $v0,4
la $a0,str4
syscall 
li $v0,1
move $a0,$s6
syscall 