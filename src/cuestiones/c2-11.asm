            .data
palabra:    .word 0x10203040
            .text                   # zona de instrucciones
            la $t0, palabra
main:       lh $s0, 2($t0)
