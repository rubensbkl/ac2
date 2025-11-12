.text
.globl main

# a - > $s0
# b - > $s1
# c - > $s2

main:
    sub $s0, $s0, $s0 # a = 0
    sub $s1, $s1, $s1 # b = 0
    sub $s2, $s2, $s2 # c = 0

    addi $s0, $zero, 5 # a = 5
    addi $s1, $zero, 3 # b = 3

    and $s2, $s0, $s1 # c = 1

    or $s2, $s0, $s1 # c = 7