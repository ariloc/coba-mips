            .data
numero:     .word 0x3ff41
            .space 4
            .text
main:       lw $t0, numero($0)
            andi $t1, $t0, 0xffff0001
            ori $t1, $t1, 0xfffe
            sw $t1, numero+4($0)
