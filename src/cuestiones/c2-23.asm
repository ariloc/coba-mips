                .data
palabra:        .word 0x10203040
octeto:         .space 2

                .text                   # zona de instrucciones
main:           lbu $s0, palabra+3($0)
                sb $s0, octeto($0)