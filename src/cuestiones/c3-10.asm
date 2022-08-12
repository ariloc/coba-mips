            .data
numero:     .word 0xffffff41
            .text
main:       lw $t0, numero($0)
            sra $t1, $t0, 4
