                .data
octeto:         .byte 0x30
siguiente:      .byte 0x20
                
                .text                   # zona de instrucciones
main:           lb $s0, octeto+1($0)