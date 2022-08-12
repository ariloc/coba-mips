            .data
numero1:    .word 0x80000000    # max. Negativo represent.
numero2:    .word 1
numero3:    .word 1
            .text
main:       
            lw $t0, numero1($0)
            lw $t1, numero2($0)
            sub $t0, $t0, $t1
            lw $t1, numero3($0)
            sub $t0, $t0, $t1
            sw $t0, numero1($0)
