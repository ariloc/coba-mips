#### 1)

```assembly
        .data
V:      .byte 0,1,1,1,0
res:    .space 3

        .text
        # read to registers
        la $t0, V           # load address to register for easy access
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
        la $t0, V
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
        la $t0, V
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


