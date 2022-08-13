            .data 0x10000000
nums:       .word 18, -12, 15
        
            .text
main:
            la $t0, nums        # dirección vector
            li $t1, 0x10010000  # dirección resultados
            li $t3, 5           # divisor

fun:        lw $t2, ($t0)
            div $t2, $t3
            mflo $t2
            sw $t2, ($t1)
            addi $t0, $t0, 4
            addi $t1, $t1, 4
            ble $t0, 0x10000008, fun
