# Author: Summer Armitage
# Date:   September 12, 2009
#
# A MIPS program that will convert an integer into a hexadecimal number.
# Students must add the missing lines of code.
 
 
        .data
 
Prompt:
        .asciiz "Enter an integer: "
 
Output1:
        .asciiz "The decimal number "
        
Output2:
        .asciiz " is 0x"
 
Output3:
        .asciiz " in hexadecimal."
 
        
        .text
 
# Get input from user.  First, issue a prompt using the
# system call that will print out a string of characters.
 
        la $a0, Prompt  # Put the address of the string in $a0
        li $v0, 4
        syscall
 
# Next, make the system call that will wait for the user to input
# an integer.
 
        li $v0, 5  # Code for input integer
        syscall
 
# Integer input comes back in $v0
# Save the inputted integer in a saved register - important!
# It cannot stay in $v0 as we need to reuse $v0.
 
        move $s0, $v0
 
# Next, begin to output the result message.  This is done in several
# steps, including outputting strings and the original integer.
 
# Output first string.
        
        la $a0, Output1
        li $v0, 4
        syscall
 
# Output original integer
        
        move $a0, $s0  # Remember, $s0 contains the input number.
        li $v0, 1
        syscall
 
# Output second string.
        
        la $a0, Output2
        li $v0, 4
        syscall
 
# Output the hexadecimal number.  (This is done by isolating four bits
# at a time, adding them to the appropriate ASCII codes, and outputting
# the character.  It is important that the digits are output in
# most-to-least significant bit order.
        
 
        li $s1, 32           # Set up a loop counter
Loop:  
        rol $s0, $s0, 4           # Roll the bits left by four bits - wraps highest bits to lowest bits (where we need them!)
        and $t0, $s0, 4           # Mask off low bits (logical AND with 000...01111)
        slti $t1, $t0, 10           # Determine if the bits represent a number less than 10 (slti)***
        beq $t1, $zero, MakeHighDigit          # If not (if greater than 9), go make a high digit****
                 
 
MakeLowDigit:           
        add $t0, $t0, 48          # Combine it with ASCII code for '0', becomes 0..9 
        move $a0, $t0          # Go output the digit
 
MakeHighDigit:
        #sub $t2, $t0, 10          # Subtract 10 from low bits****
        #add $t0, $t2, 65          # Add them to the code for 'A' (65), becomes a..f***
 
DigitOut:
        move $a0, $t0      # Output the ASCII character
        li $v0, 11
        syscall
        
        subi $s1, $s1, 1             # Decrement loop counter
        bne $s1, $zero, Loop             # Keep looping if loop counter is not zero
 
# Output third string.
        
        la $a0, Output3
        li $v0, 4
        syscall
        
        
# Done, exit the program
 
        li $v0, 10  # This system call will terminate the program gracefully.
        syscall