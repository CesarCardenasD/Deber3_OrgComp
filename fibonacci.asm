.data
    fibResult:  .dword 0        # Variable para almacenar el resultado

.text
    main:
        # Inicializar variables
        li $t0, 50                  # Cargar el índice en $t0
        li $s1, 0                   # Inicializar $s1 a 0 (fib(n-2))
        li $s2, 1                   # Inicializar $s2 a 1 (fib(n-1))
        li $t3, 0                   # Inicializar contador en 0
        li $s4, 0                   # Inicializar $s4 a 0 (resultado)

    fib_loop:
        add $s4, $s1, $s2           # Sumar $s1 y $s2 y guardar el resultado en $s4
        move $s1, $s2               # Mover el valor de $s2 a $s1
        move $s2, $s4               # Mover el valor de $s4 a $s2
        addi $t3, $t3, 1            # Incrementar el contador

        blt $t3, $t0, fib_loop      # Saltar a fib_loop si $t3 < $t0

        sw $s4, fibResult           # Almacenar el resultado en fibResult

        # Imprimir el resultado en la consola
        move $a0, $s4               # Mover el resultado a $a0
        li $v0, 1                   # Código de llamada al sistema para imprimir entero
        syscall                     # Llamar al sistema para imprimir

        # Salir del programa
        li $v0, 10                  # Código de salida del programa
        syscall                     # Llamar al sistema para salir del programa

