.data
str1: .asciiz "Calculate A + 2B - 5\n"
str2: .asciiz "Enter A: "
str3: .asciiz  "Enter B: "
str4: .asciiz  "\nResult is : "
.text 
main:
li $v0,4
la $a0,str1
syscall 
li $v0,4
la $a0,str2
syscall 
li $v0,5
syscall 
move $s1,$v0
li $v0,4
la $a0,str3
syscall 
li $v0,5
syscall 
move $s2,$v0
sll $s3,$s2,1
add $s4,$s3,$s1
sub $s5,$s4,5
li $v0,4
la $a0,str4
syscall 
li $v0,1
move $a0,$s5
syscall 

