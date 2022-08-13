            .data 0x10000000
nums:       .word 18, -12, 15

            .text
main:
            la $t0, nums        # dirección vector
            li $t1, 0x10010000  # dirección resultados
            li $t3, 5           # divisor

            lw $t2, ($t0)
            div $t2, $t3
            mflo $t2
            sw $t2, ($t1)

            lw $t2, 4($t0)
            div $t2, $t3
            mflo $t2
            sw $t2, 4($t1)

            lw $t2, 8($t0)
            div $t2, $t3
            mflo $t2
            sw $t2, 8($t1)
