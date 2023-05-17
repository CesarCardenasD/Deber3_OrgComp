.data
    celsius_msg: .asciiz "\n Ingresa la temperatura en Celsius: "
    fahrenheit_msg: .asciiz "\n Ingresa la temperatura en Fahrenheit: "
    result_msg: .asciiz "Resultado: "

.text
.globl main
main:
    # Convertir Celsius to Fahrenheit
    jal celsius_to_fahrenheit

    # Convertir Fahrenheit to Celsius
    jal fahrenheit_to_celsius

exit:
    # Exit the program
    li $v0, 10
    syscall

celsius_to_fahrenheit:
    # Mostrar mensaje de Celsius
    li $v0, 4
    la $a0, celsius_msg
    syscall

    # Leer temperatura en Celsius
    li $v0, 5
    syscall
    move $t0, $v0

    # Convertir de Celsius a Fahrenheit: F = (C * 9/5) + 32
    li $t1, 9
    mult $t0, $t1
    mflo $t2
    li $t3, 5
    div $t2, $t3
    mflo $t2
    addi $t2, $t2, 32

    # Mostrar Resultado
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    jr $ra

fahrenheit_to_celsius:
    # Mostrar mensaje de Fahrenheit
    li $v0, 4
    la $a0, fahrenheit_msg
    syscall

    # Leer temperatura de Fahrenheit
    li $v0, 5
    syscall
    move $t0, $v0

    # Convertir de Fahrenheit a Celsius: C = (F - 32) * 5/9
    subi $t0, $t0, 32
    li $t1, 5
    mult $t0, $t1
    mflo $t0
    li $t1, 9
    div $t0, $t1
    mflo $t0

    # Mostrar Resultado
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    jr $ra
