.data
    prompt: .asciiz "Entra un anio: "
    leap_msg: .asciiz "Es un anio bisiesto."
    not_leap_msg: .asciiz "No es un anio bisiesto."
    
.text
.globl main
main:
    # Mostrar mensaje
    li $v0, 4
    la $a0, prompt
    syscall

    # leer input anio
    li $v0, 5
    syscall
    move $t0, $v0

    # ver si es anio bisiesto
    li $t1, 4
    div $t0, $t1
    mfhi $t2
    bnez $t2, not_leap

    # si divisible para 4, verificar que sea divisible para 100
    li $t1, 100
    div $t0, $t1
    mfhi $t2
    beqz $t2, leap

    # No es bisiesto
not_leap:
    li $v0, 4
    la $a0, not_leap_msg
    syscall
    j exit

    # Si es bisiesto
leap:
    li $v0, 4
    la $a0, leap_msg
    syscall

exit:
    # Exit program
    li $v0, 10
    syscall