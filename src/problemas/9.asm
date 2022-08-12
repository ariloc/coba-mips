            .data
palabra:    .word 0x10203040
palabra2:   .space 4

            .text
main:       la $t0, palabra2
        
            lw $t1, palabra($0)
            sb $t1, 3($t0)
            srl $t1, $t1, 8
            sb $t1, 2($t0)
            srl $t1, $t1, 8
            sb $t1, 1($t0)
            srl $t1, $t1, 8
            sb $t1, 0($t0)
