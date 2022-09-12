        .data
V:      .byte 0,1,1,1,0
res:    .space 3

        .text
        # read to registers
main:   la $t0, V           # load address to register for easy access
        lb $t1, 0($t0)
        lb $t2, 1($t0)
        lb $t3, 2($t0)
        lb $t4, 3($t0)
        lb $t5, 4($t0)
        la $t0, res
        
        # res[1]
        and $t6, $t1, $t5
        sb $t6, 0($t0)
        
        # res[2]
        or $t6, $t2, $t4
        sb $t6, 1($t0)
        
        # res[3]
        or $t6, $t1, $t2
        and $t6, $t6, $t3
        sb $t6, 2($t0)
