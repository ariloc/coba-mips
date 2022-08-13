                .data
octeto:         .byte 0xf3
siguiente:      .byte 0x20
                
                .text                   # zona de instrucciones
main:           lb $s0, octeto($0)