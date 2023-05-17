.data
    array: .word 100, 28, 17, 20, 40   # Arreglo 
    array_size: .word 5                # Tamaño arreglo
    result_msg: .asciiz "El promedio es: "

.text
.globl main
main:
    # Inicializar
    li $s0, 0    # Sum
    li $s1, 0    # contador

    # Suma arreglo
    la $t0, array        # Cargar el arreglo
    lw $t1, array_size   # Cargar tamaño arreglo
    li $t2, 0            # Inicializar un registro para mantener el índice
    
loop:
    beq $s1, $t1, calculate_average   # Salir del loop si el contador es mayor al tamaño del arreglo

    lw $t3, ($t0)    # cargar elemento arreglo
    add $s0, $s0, $t3   # añadir a la sum
    addi $t0, $t0, 4   # mover el puntero al siguiente elemento arreglo
    addi $s1, $s1, 1     # incrementar el contador
    j loop

calculate_average:
    # Calcular el promedio
    div $s0, $t1   # dividir para el tamaño arrelo la suma tot
    mflo $s2       # guardar resultado en $s2

    # mostrar resultado
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

exit:
    # Exit the program
    li $v0, 10
    syscall
