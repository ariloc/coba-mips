            .data
numero:     .word 0xffffff41
            .text
main:       lw $t0, numero($0)
            sll $t1, $t0, 2
