            .data
palabra:    .word 0x10203040
            .text                   # zona de instrucciones
            la $t0, palabra
main:       lw $s0, 1($t0)
