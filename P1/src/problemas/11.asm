            .data 0x10010002
bytes:      .byte 0x10, 0x20, 0x30, 0x40
            .align 4
palabra:    .space 4

            .text
main:       la $t0, bytes
            la $t1, palabra

            lh $t2, 0($t0)
            sh $t2, 0($t1)
            lh $t2, 2($t0)
            sh $t2, 2($t1)
