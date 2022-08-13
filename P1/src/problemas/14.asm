            .data 0x10000000
int:        .word 0xabcd12bd
        
            .text
main:
            # Asumiendo que el bit menos signif. es el 0°
            lw $t0, int($0)
            andi $t0, $t0, 0xfffffd77
            sw $t0, int($0)
