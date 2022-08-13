            .data 0x10000000
num:        .word 0x1237

            .text
main:
            lw $t0, num($0)
            sll $t0, $t0, 5
            sw $t0, num($0)
