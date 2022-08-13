            .data
palabra:    .word 0x10203040
palabra2:   .space 4

            .text
main:       la $t0, palabra2
            la $t1, palabra
            
            lbu $t2, 0($t1)
            sb $t2, 3($t0)
            lbu $t2, 1($t1)
            sb $t2, 2($t0)
            lbu $t2, 2($t1)
            sb $t2, 1($t0)
            lbu $t2, 3($t1)
            sb $t2, 0($t0)
