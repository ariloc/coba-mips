#### 1)

```assembly
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
```

#### 2)

```assembly
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
```

#### 3)

```assembly
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
```

#### 4)

```assembly
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
```
