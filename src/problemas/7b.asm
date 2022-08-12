                .data 0x10000000
V:              .half 10, 20, 25, 500, 3

                .text
main:           lh $s0, V($0)
                lh $s1, V+2($0)
                lh $s2, V+4($0)
                lh $s3, V+6($0)
                lh $s4, V+8($0)
