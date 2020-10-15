.data
str1: .asciiz "Entet First Number: "
str2: .asciiz "\nEntet Second Number: "
str3: .asciiz "\nResult: "

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
li $v0,5
syscall 
move $s1,$v0
la $s2,0
bne $s0,$s1,sum
syscall 

sum:
add $s2,$s0,$s2
add $s0,$s0,1
bne $s0,$s1,sum
beq $s0,$s1,print

print:
add $s2,$s0,$s2
li $v0,4
la $a0,str3
syscall 
li $v0,1
move $a0,$s2
syscall 




