            .data       # zona de datos
            # Máx. Positivo representable 0x7FFFFFFF
numero:     .word 2147483647
            .text       # zona de instrucciones
main:       lw $t0, numero($0)
            addi $t1, $t0, 1
