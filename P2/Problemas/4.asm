            .data
dato1:      .word 2
dato2:      .word 10
dato3:      .word 50
dato4:      .word 70
dato5:      .word 34
res:        .space 4

            .text
main:       lw $t0, dato5($0)

            lw $t1, dato1($0)
            lw $t2, dato2($0)
            sge $t1, $t0, $t1   # dato5 >= dato1?
            sle $t2, $t0, $t2   # dato5 <= dato2?
            and $t1, $t1, $t2   # dato5 >= dato1? AND dato5 <= dato2?
            
            lw $t2, dato3($0)
            lw $t3, dato4($0)
            sge $t2, $t0, $t2   # dato5 >= dato3?
            sle $t3, $t0, $t3   # dato5 <= dato4?
            and $t2, $t2, $t3   # dato5 >= dato3? AND dato5 <= dato4?
            
            or $t1, $t1, $t2    # (dato5 >= dato1? AND dato5 <= dato2?) OR (dato5 >= dato3? AND dato5 <= dato4?)
            sw $t1, res($0)
