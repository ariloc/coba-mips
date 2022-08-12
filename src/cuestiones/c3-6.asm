            .data
numero1:    .word 0x7FFFFFFF    # Máx. Positivo represent.
numero2:    .word 16
            .space 8
            .text
main:       lw $t0, numero1($0)
            lw $t1, numero2($0)
            mult $t0, $t1       # multiplica los dos números
            mfhi $t0
            mflo $t1
            sw $t0, numero2+4($0)   # 32 bits más peso
            sw $t1, numero2+8($0)   # 32 bits menos peso
