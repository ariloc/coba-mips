            .data 0x10000000
ops:        .word 10, 20
sum:        .space 4
        
            .text
main:
            lw $t0, ops($0)
            lw $t1, ops+4($0)
            add $t0, $t0, $t1
            sw $t0, sum($0)
