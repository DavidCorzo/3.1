.data
    text:  .asciiz "Enter a number: "
    remainder: .space 4
    p: .asciiz "number is prime."
    np: .asciiz "number is not prime"
    s: .asciiz " "
    ss: .asciiz " \n"
    t: .asciiz "\nthen excecuted\n"
    pe: .asciiz "prime statement excecuted\n"
    npe: .asciiz "not prime statement excecuted\n"
    t_0_str: .asciiz "$t0: "
    t_1_str: .asciiz "$t1: "
    t_2_str: .asciiz "$t2: "
    t_3_str: .asciiz "$t3: "
    t_4_str: .asciiz "$t4: "

.text

 main:
    # Printing out the text
    li $v0, 4
    la $a0, text
    syscall

    # Getting user input
    li $v0, 5
    syscall

    # Moving the integer input to another register
    move $t0, $v0

    # for (int i = 2; i < input_int; i++) 
    #     if ( input_int % i  == 0) { 
    #       no es primo. break; 
    #   }
    # $t0 = input_int 
    # $t1 = counter 
    # $t2 = bool is_prime
    # $t3 = remainder
    li $t1, 2 # counter = 2
    li $t2, 1 # is prime = true
    

    jal is_prime # calling loop.
    jal result
    # End Program
    li $v0, 10
    syscall

is_prime:
    bge $t1, $t0, exit # counter < input_int
    rem $t3, $t0, $t1
    beqz $t3, not_prime
    addi $t1, $t1, 1
    j is_prime

not_prime:
    addi $t2, $t2, -1
    j exit

exit: jr $ra
    
result:
    # print($t0)
    li $v0, 1
    move $a0, $t2
    syscall
jr $ra
    