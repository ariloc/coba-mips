            .data
            .word 0xffffffff        # palabra dummy
palabra:    .word 0x10203040
            .text                   # zona de instrucciones
main:       lw $s0, palabra($0)
