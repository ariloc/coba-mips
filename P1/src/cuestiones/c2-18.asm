                .data
palabra1:       .word 0x10203040
palabra2:       .space 4
palabra3:       .word 0xffffffff

                .text                   # zona de instrucciones
main:           lw $s0, palabra1($0)
                sw $s0, palabra2($0)
                sw $s0, palabra3($0)