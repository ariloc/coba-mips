            .data
cadena:     .asciiz "hola mundo bonito!"
char:       .byte 'o'
            .align 2
res:        .space 4

            .text
main:       la $t0, cadena
            lb $t1, char($0)        # <- char
            and $t2, $t2, $0        # res = 0
        
while:      lb $t3, 0($t0)          # <- cadena[i]
            beq $t3, $0, endwhile   # cadena[i] = '\0'?
            seq $t3, $t3, $t1       # cadena[i] = char?
            add $t2, $t2, $t3       # res += (cadena[i] == char)
            addi $t0, $t0, 1        # i++
            j while
        
endwhile:   sw $t2, res($0)
