.data 
str1: .asciiz  "Calculate this equation  s = (a + b)–(c + 101)\n"
str2: .asciiz  "Enter a: "
str3: .asciiz  "Enter b: "
str4: .asciiz  "Enter c: "
str5: .asciiz  "Result: "

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
move $s0,$v0 
li $v0,4
la $a0,str3
syscall 
li $v0,5
syscall 
move $s1,$v0
li $v0,4
la $a0,str4
syscall 
li $v0,5
syscall 
move $s2,$v0
li $v0,4
la $a0,str5
syscall 
add $s4,$s0,$s1
add $s5,$s2,101
sub $s6,$s4,$s5
li $v0,1
move $a0,$s6
syscall 