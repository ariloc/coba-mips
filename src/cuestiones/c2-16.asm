                .data
octeto:         .word 0x10203040
siguiente:      .byte 0x20
                
                .text                   # zona de instrucciones
main:           lb $s0, octeto($0)