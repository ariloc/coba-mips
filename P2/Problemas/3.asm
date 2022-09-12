        .data
V:      .word 1, -4, -5, 2
res:    .space 1

        .text
main:   la $t0, V
        ori $t2, $0, 1
        and $t3, $t3, $0
        
loop:   lw $t1, 0($t0)
        slt $t1, $t1, $0
        and $t2, $t2, $t1
        addiu $t0, $t0, 4
        addiu $t3, $t3, 1
        bne $t3, 4, loop
        
        sb $t2, res($0)
