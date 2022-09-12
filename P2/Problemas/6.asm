            .data
V:          .word -5,3,0,-20,-36,42,30,64,102,-71,15,89,22,-10,6,-7,-12
n:          .word 17
rango1:     .word -10
rango2:     .word 30
res:        .space 4

            .text
main:       la $t0, V
            lw $t1, n($0)           # <- n
            lw $t2, rango1($0)      # <- rango1
            lw $t3, rango2($0)      # <- rango2
            and $t4, $t4, $0        # i = 0
            and $t5, $t5, $0        # res = 0
            
for:        bge $t4, $t1, endfor    # i >= n?
            lw $t6, 0($t0)          # <- V[i]
            sge $t7, $t6, $t2       # V[i] >= rango1?
            sle $t6, $t6, $t3       # V[i] <= rango2?
            and $t6, $t6, $t7       # V[i] >= rango1? AND V[i] <= rango2?
            add $t5, $t5, $t6       # res += (V[i] >= rango1 && V[i] <= rango2)
            addi $t0, $t0, 4
            addi $t4, $t4, 1        # i++
            j for
        
endfor:     sw $t5, res($0)
