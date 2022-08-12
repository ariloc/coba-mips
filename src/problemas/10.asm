            .data
palabra:    .word 0x10203040
        
            .text
main:       la $t0, palabra

            lh $t1, 0($t0)
            lh $t2, 2($t0)
            sh $t1, 2($t0)
            sh $t2, 0($t0)
