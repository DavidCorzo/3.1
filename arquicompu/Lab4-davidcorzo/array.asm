# 2) Defina un vector de 5 enteros. Solicite los valores iniciales al usuario e imprima el vector ordenado de menor a mayor.

.data 
    arr: .space 20 # sizeof(int) = 4 bytes -> 4 * 5 = 20.
    msg1: .asciiz "Enter integer "
    debug1: .asciiz "excecuted 1"
    colon: .asciiz ":"

.text 
main:
    addi $t0, $zero, 4  # $t0 = 5 -> limit 
    addi $t1, $zero, 0  # $t1 = 0 -> index
    addi $t2, $zero, 0 # $t2 = temp. To save a temporary integer.
    # print(msg1)
    li $v0, 4
    la $a0, msg1
    syscall
    begin_for: 
        bgt $t1, $t0, end_for
        # cout << "Enter integer";
        li $v0, 4
        move $a0, $t1
        syscall
        # cout << index;
        li $v0, 1
        move $a0, $t1
        syscall
        # increment index: index++
        addi $t1, $t1, 1
        j begin_for
    end_for: 

    # print(debug1)
    li $v0, 4
    la $a0, debug1
    syscall
    # End Program
    li $v0, 10
    syscall

