            .data
numero1:    .word 10
numero2:    .word 3
            .space 8
            .text
main:       lw $t0, numero1($0)
            lw $t1, numero2($0)
            div $t0, $t1        # divide los dos números
            mflo $t0            # resto
            mfhi $t1            # cociente
            sw $t0, numero2+4($0)   # 32 bits más peso
            sw $t1, numero2+8($0)   # 32 bits menos peso
