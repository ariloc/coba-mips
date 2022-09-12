            .data
vector:     .word 2,10,0,63,41,-5,78,0,-66,0,0,-1
n:          .word 12
total:      .space 4

            .text
main:       la $t0, vector
            and $t1, $t1, $0        # i = 0
            lw $t2, n($0)           # <- n
            and $t3, $t3, $0        # total = 0
        
for:        bge $t1, $t2, endfor    # i >= n?
            lw $t4, 0($t0)          # <- vector[i]
            seq $t4, $t4, $0        # vector[i] = 0?
            add $t3, $t3, $t4       # total += (vector[i] == 0)
            addi $t0, $t0, 4
            addi $t1, $t1, 1        # i++
            j for

endfor:     sw $t3, total($0)
