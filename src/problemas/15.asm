            .data 0x10000000
int:        .word 0xff0f1235
        
            .text
main:
            # Asumiendo que el bit menos signif. es el 0°
            lw $t0, int($0)
            xori $t0, 0x288
            sw $t0, int($0)
