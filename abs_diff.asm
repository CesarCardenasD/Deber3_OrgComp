.text
.globl main

main:
    # Solicitar el valor de a
    li $v0, 4
    la $a0, prompt_a
    syscall

    # Leer el valor de a
    li $v0, 5
    syscall
    move $s0, $v0

    # Solicitar el valor de b
    li $v0, 4
    la $a0, prompt_b
    syscall

    # Leer el valor de b
    li $v0, 5
    syscall
    move $s1, $v0

    # Llamar a la funcion abs_diff
    jal abs_diff

    # Mostrar Resultado
    move $a0, $v0
    li $v0, 1
    syscall

    # Exit program
    li $v0, 10
    syscall

abs_diff:
    # Restar a -b
    sub $v0, $s0, $s1

    # si es negativo
    bltz $v0, negate

    # Return result
    jr $ra

negate:
    # Restar b-a
    sub $v0, $s1, $s0

    # Return result
    jr $ra

.data
prompt_a: .asciiz "Ingrese el valor de a: "
prompt_b: .asciiz "Ingrese el valor de b: "
