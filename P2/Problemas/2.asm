        .data
V:      .word 2, -4, -6
res:    .space 3

        .text
main:   la $t0, V
        lw $t1, 0($t0)
        lw $t2, 4($t0)
        lw $t3, 8($t0)
        la $t0, res
        
        sge $t4, $t1, $0
        sb $t4, 0($t0)
        
        sge $t4, $t2, $0
        sb $t4, 1($t0)
        
        sge $t4, $t3, $0
        sb $t4, 2($t0)
