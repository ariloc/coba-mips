                .data
palabra:        .word 0x10203040
octeto:         .space 2

                .text                   # zona de instrucciones
main:           lw $s0, palabra($0)
                sb $s0, octeto+1($0)