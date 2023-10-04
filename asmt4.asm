# CSC 256
# 2023-10-04
# Name:		    Mos Kullathon
# Description: 	User enters limit. Program computes sum of
# integers from 1 to limit, and prints the sum.

.data
prompt: .asciiz "Enter a limit: "
result: .asciiz "The sum is: "

.text
.globl main

main:

    li      $v0,    4               # print_string
    la      $a0,    prompt
    syscall 

    li      $v0,    5               # read_int
    syscall 

    move    $s2,    $v0             # limit: $s2 <- read_int
    li      $s0,    0               # sum: $s0 = 0
    li      $s1,    1               # i counter: $s1 = 1

loop:

    bgt     $s1,    $s2,    done    # if $s2 > $t1 then goto done
                                    # Check if i <= limit

    add     $s0,    $s0,    $s1     # Increment sum
    addi    $s1,    $s1,    1       # Increment counter

    j       loop                    # Repeat the loop

done:

    li      $v0,    4               # print_string
    la      $a0,    result
    syscall 

    move    $a0,    $s0             # print_int
    li      $v0,    1
    syscall 

    li      $v0,    10              # exit
    syscall 
