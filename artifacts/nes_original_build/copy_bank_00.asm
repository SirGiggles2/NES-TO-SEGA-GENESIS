.segment "BANK_00"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000  ; for listing file
; 0x000010-0x00400F



.export sub_0x001835_update_sound_driver


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



tbl_8D60_offset:
tbl__8D60:
    .byte off_8DDD_00 - tbl__8D60   ; 00 
    .byte off_8E15_01 - tbl__8D60   ; 01 
    .byte off_8DCE_02 - tbl__8D60   ; 02 
    .byte off_8DC7_03 - tbl__8D60   ; 03 
    .byte off_8DDD_04 - tbl__8D60   ; 04 
    .byte off_8E0D_05 - tbl__8D60   ; 05 
    .byte off_8DC4_06 - tbl__8D60   ; 06 
    .byte off_8DC4_07 - tbl__8D60   ; 07 
    .byte off_8DD5_08 - tbl__8D60   ; 08 
    .byte off_8DDD_09 - tbl__8D60   ; 09 
    .byte off_8DE5_0A - tbl__8D60   ; 0A 
    .byte off_8DF5_0B - tbl__8D60   ; 0B 
    .byte off_8DDD_0C - tbl__8D60   ; 0C 
    .byte off_8DED_0D - tbl__8D60   ; 0D 
    .byte off_8DF5_0E - tbl__8D60   ; 0E 
    .byte off_8DFD_0F - tbl__8D60   ; 0F 
    .byte off_8E05_10 - tbl__8D60   ; 10 
    .byte off_8E1D_11 - tbl__8D60   ; 11 
    .byte off_8E25_12 - tbl__8D60   ; 12 
    .byte off_8E2D_13 - tbl__8D60   ; 13 
    .byte off_8E35_14 - tbl__8D60   ; 14 
    .byte off_8E3D_15 - tbl__8D60   ; 15 
    .byte off_8E35_16 - tbl__8D60   ; 16 
    .byte off_8E45_17 - tbl__8D60   ; 17 
    .byte off_8E4D_18 - tbl__8D60   ; 18 
    .byte off_8D84_19 - tbl__8D60   ; 19 
    .byte off_8D8C_1A - tbl__8D60   ; 1A 
    .byte off_8D94_1B - tbl__8D60   ; 1B 
    .byte off_8D9C_1C - tbl__8D60   ; 1C 
    .byte off_8DA4_1D - tbl__8D60   ; 1D 
    .byte off_8D94_1E - tbl__8D60   ; 1E 
    .byte off_8DAC_1F - tbl__8D60   ; 1F 
    .byte off_8DB4_20 - tbl__8D60   ; 20 
    .byte off_8DBC_21 - tbl__8D60   ; 21 
    .byte off_8DA4_22 - tbl__8D60   ; 22 
    .byte off_8E55_23 - tbl__8D60   ; 23 



tbl_8D84_music:
; offset via 0x000D70
off_8D84_19:
; 24
    .byte $20   ; ram_05F4
    .word _off000_948B
    .byte $3B   ; ram_060C
    .byte $1D   ; ram_060B
    .byte $4F   ; ram_060D ram_05F5
    .byte $80   ; ram_0619
    .byte $01   ; ram_05F1

off_8D8C_1A:
; 2C
    .byte $20   ; 
    .word _off000_94DC
    .byte $27   ; 
    .byte $57   ; 
    .byte $23   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8D94_1B:
off_8D94_1E:
; 34
    .byte $20   ; 
    .word _off000_95A1
    .byte $38   ; 
    .byte $17   ; 
    .byte $B8   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8D9C_1C:
; 3C
    .byte $20   ; 
    .word _off000_95F1
    .byte $6C   ; 
    .byte $26   ; 
    .byte $68   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8DA4_1D:
off_8DA4_22:
; 44
    .byte $20   ; 
    .word _off000_968D
    .byte $3E   ; 
    .byte $25   ; 
    .byte $21   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8DAC_1F:
; 4C
    .byte $20   ; 
    .word _off000_96EB
    .byte $19   ; 
    .byte $0D   ; 
    .byte $31   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8DB4_20:
; 54
    .byte $20   ; 
    .word _off000_9720
    .byte $3F   ; 
    .byte $27   ; 
    .byte $7C   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8DBC_21:
; 5C
    .byte $20   ; 
    .word _off000_978F
    .byte $1D   ; 
    .byte $11   ; 
    .byte $0D   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8DC4_06:
off_8DC4_07:
; 64 unused?
    .byte $10   ; 
    .byte $A1   ; _off000_8EA1 ?
    .byte $8E   ; 

off_8DC7_03:
; 67
    .byte $10   ; 
    .word _off000_8E5D
    .byte $0D   ; 
    .byte $07   ; 
    .byte $00   ; 
    .byte $80   ; 

off_8DCE_02:
; 6E
    .byte $10   ; 
    .word _off000_91A4
    .byte $46   ; 
    .byte $22   ; 
    .byte $00   ; 
    .byte $80   ; 

off_8DD5_08:
; 75
    .byte $10   ; 
    .word _off000_8E70
    .byte $32   ; 
    .byte $5D   ; 
    .byte $8E   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8DDD_00:
off_8DDD_04:
off_8DDD_09:
off_8DDD_0C:
; 7D
    .byte $10   ; 
    .word _off000_8F0F
    .byte $35   ; 
    .byte $16   ; 
    .byte $CE   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8DE5_0A:
; 85
    .byte $10   ; 
    .word _off000_8F55
    .byte $60   ; 
    .byte $26   ; 
    .byte $88   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8DED_0D:
; 8D
    .byte $10   ; 
    .word _off000_9032
    .byte $59   ; 
    .byte $2D   ; 
    .byte $A4   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8DF5_0B:
off_8DF5_0E:
; 95
    .byte $10   ; 
    .word _off000_8FE4
    .byte $3B   ; 
    .byte $1A   ; 
    .byte $F2   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8DFD_0F:
; 9D
    .byte $00   ; 
    .word _off000_90DD
    .byte $45   ; 
    .byte $22   ; 
    .byte $00   ; 
    .byte $01   ; 
    .byte $01   ; 

off_8E05_10:
; A5
    .byte $00   ; 
    .word _off000_913A
    .byte $39   ; 
    .byte $1C   ; 
    .byte $00   ; 
    .byte $01   ; 
    .byte $01   ; 

off_8E0D_05:
; AD
    .byte $10   ; 
    .word _off000_91FD
    .byte $A5   ; 
    .byte $53   ; 
    .byte $CD   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8E15_01:
; B5
    .byte $10   ; 
    .word _off000_92CC
    .byte $22   ; 
    .byte $10   ; 
    .byte $00   ; 
    .byte $80   ; 
    .byte $01   ; 

off_8E1D_11:
; BD
    .byte $08   ; 
    .word _off000_92F7
    .byte $22   ; 
    .byte $50   ; 
    .byte $59   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8E25_12:
; C5
    .byte $08   ; 
    .word _off000_92F7
    .byte $2F   ; 
    .byte $50   ; 
    .byte $59   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8E2D_13:
; CD
    .byte $08   ; 
    .word _off000_9352
    .byte $7A   ; 
    .byte $1B   ; 
    .byte $C2   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8E35_14:
off_8E35_16:
; D5
    .byte $08   ; 
    .word _off000_9386
    .byte $46   ; 
    .byte $24   ; 
    .byte $8E   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8E3D_15:
; DD
    .byte $08   ; 
    .word _off000_939D
    .byte $44   ; 
    .byte $23   ; 
    .byte $77   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8E45_17:
; E5
    .byte $08   ; 
    .word _off000_93ED
    .byte $1B   ; 
    .byte $0E   ; 
    .byte $27   ; 
    .byte $01   ; 
    .byte $80   ; 

off_8E4D_18:
; ED
    .byte $08   ; 
    .word _off000_941A
    .byte $40   ; 
    .byte $1A   ; 
    .byte $6B   ; 
    .byte $80   ; 
    .byte $80   ; 

off_8E55_23:
; F5
    .byte $10   ; 
    .word _off000_97C4
    .byte $3F   ; 
    .byte $20   ; 
    .byte $00   ; 
    .byte $80   ; 
    .byte $80   ; 



_off000_8E5D:
    .byte $81   ; 
    .byte $1E   ; 
    .byte $20   ; 
    .byte $22   ; 
    .byte $85   ; 
    .byte $24   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $30   ; 
    .byte $32   ; 
    .byte $34   ; 
    .byte $85   ; 
    .byte $36   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $85   ; 
    .byte $2E   ; 



_off000_8E70:
    .byte $85   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $2E   ; 
    .byte $83   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $2E   ; 
    .byte $83   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $80   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $00   ; 00
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $83   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $83   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $83   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $81   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $85   ; 
    .byte $22   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $1E   ; 
    .byte $08   ; 
    .byte $1E   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $08   ; 
    .byte $82   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $20   ; 
    .byte $08   ; 
    .byte $20   ; 
    .byte $83   ; 
    .byte $20   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $80   ; 
    .byte $20   ; 
    .byte $08   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $80   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $80   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $B1   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $B1   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $B1   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $D0   ; 
    .byte $D0   ; 
    .byte $D0   ; 
    .byte $50   ; 
    .byte $50   ; 



_off000_8F0F:
    .byte $81   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $40   ; 
    .byte $82   ; 
    .byte $40   ; 
    .byte $06   ; 
    .byte $44   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $22   ; 
    .byte $08   ; 
    .byte $82   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $22   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $24   ; 
    .byte $28   ; 
    .byte $2C   ; 
    .byte $81   ; 
    .byte $2E   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $82   ; 
    .byte $2E   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $16   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $12   ; 
    .byte $83   ; 
    .byte $16   ; 
    .byte $16   ; 



_off000_8F55:
    .byte $85   ; 
    .byte $46   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $46   ; 
    .byte $46   ; 
    .byte $46   ; 
    .byte $44   ; 
    .byte $06   ; 
    .byte $82   ; 
    .byte $44   ; 
    .byte $08   ; 
    .byte $06   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $81   ; 
    .byte $3C   ; 
    .byte $80   ; 
    .byte $3C   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $06   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $3C   ; 
    .byte $81   ; 
    .byte $38   ; 
    .byte $80   ; 
    .byte $38   ; 
    .byte $3C   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $81   ; 
    .byte $3C   ; 
    .byte $38   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $38   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $2A   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $38   ; 
    .byte $08   ; 
    .byte $38   ; 
    .byte $38   ; 
    .byte $36   ; 
    .byte $32   ; 
    .byte $38   ; 
    .byte $08   ; 
    .byte $2E   ; 
    .byte $2E   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $08   ; 
    .byte $2E   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $81   ; 
    .byte $2A   ; 
    .byte $80   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $2A   ; 
    .byte $80   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $83   ; 
    .byte $32   ; 
    .byte $81   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $24   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $83   ; 
    .byte $2E   ; 
    .byte $81   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $0E   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $20   ; 
    .byte $82   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $1E   ; 
    .byte $83   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $1A   ; 
    .byte $83   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $16   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $D0   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $D0   ; 
    .byte $D0   ; 
    .byte $00   ; 



_off000_8FE4:
    .byte $81   ; 
    .byte $36   ; 
    .byte $80   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $85   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $42   ; 
    .byte $80   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $00   ; 00
    .byte $83   ; 
    .byte $26   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $80   ; 
    .byte $26   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $2C   ; 
    .byte $80   ; 
    .byte $2C   ; 
    .byte $30   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $81   ; 
    .byte $30   ; 
    .byte $80   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $80   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $80   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $82   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $82   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $83   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $81   ; 
    .byte $14   ; 
    .byte $18   ; 



_off000_9032:
    .byte $86   ; 
    .byte $46   ; 
    .byte $83   ; 
    .byte $4E   ; 
    .byte $81   ; 
    .byte $02   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $48   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $06   ; 
    .byte $83   ; 
    .byte $46   ; 
    .byte $81   ; 
    .byte $48   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $06   ; 
    .byte $83   ; 
    .byte $46   ; 
    .byte $81   ; 
    .byte $48   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $83   ; 
    .byte $3A   ; 
    .byte $86   ; 
    .byte $3C   ; 
    .byte $83   ; 
    .byte $06   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $38   ; 
    .byte $83   ; 
    .byte $32   ; 
    .byte $00   ; 00
    .byte $86   ; 
    .byte $38   ; 
    .byte $83   ; 
    .byte $3E   ; 
    .byte $81   ; 
    .byte $3C   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $36   ; 
    .byte $83   ; 
    .byte $30   ; 
    .byte $86   ; 
    .byte $34   ; 
    .byte $83   ; 
    .byte $38   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $30   ; 
    .byte $83   ; 
    .byte $30   ; 
    .byte $86   ; 
    .byte $34   ; 
    .byte $83   ; 
    .byte $38   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $30   ; 
    .byte $83   ; 
    .byte $30   ; 
    .byte $86   ; 
    .byte $2A   ; 
    .byte $83   ; 
    .byte $34   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $20   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $0E   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $0C   ; 
    .byte $83   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $1A   ; 
    .byte $20   ; 
    .byte $26   ; 
    .byte $32   ; 
    .byte $38   ; 
    .byte $85   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $85   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $1A   ; 
    .byte $20   ; 
    .byte $26   ; 
    .byte $32   ; 
    .byte $38   ; 
    .byte $85   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $85   ; 
    .byte $10   ; 
    .byte $83   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $1A   ; 
    .byte $83   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $16   ; 
    .byte $83   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $D0   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $D0   ; 
    .byte $D0   ; 
    .byte $00   ; 



_off000_90DD:
    .byte $83   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2A   ; 
    .byte $3A   ; 
    .byte $2A   ; 
    .byte $3A   ; 
    .byte $2A   ; 
    .byte $3A   ; 
    .byte $2A   ; 
    .byte $3A   ; 
    .byte $28   ; 
    .byte $3A   ; 
    .byte $28   ; 
    .byte $3A   ; 
    .byte $28   ; 
    .byte $3A   ; 
    .byte $28   ; 
    .byte $3A   ; 
    .byte $26   ; 
    .byte $3A   ; 
    .byte $26   ; 
    .byte $3A   ; 
    .byte $26   ; 
    .byte $3A   ; 
    .byte $26   ; 
    .byte $3A   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $32   ; 
    .byte $3C   ; 
    .byte $32   ; 
    .byte $3C   ; 
    .byte $32   ; 
    .byte $3C   ; 
    .byte $32   ; 
    .byte $3C   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $2E   ; 
    .byte $3C   ; 
    .byte $2E   ; 
    .byte $3C   ; 
    .byte $2E   ; 
    .byte $3C   ; 
    .byte $2E   ; 
    .byte $3C   ; 
    .byte $2C   ; 
    .byte $3C   ; 
    .byte $2C   ; 
    .byte $3C   ; 
    .byte $2C   ; 
    .byte $3C   ; 
    .byte $2C   ; 
    .byte $3C   ; 
    .byte $85   ; 
    .byte $2C   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $3A   ; 
    .byte $38   ; 
    .byte $2A   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $2E   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $38   ; 
    .byte $85   ; 
    .byte $36   ; 
    .byte $26   ; 
    .byte $08   ; 
    .byte $08   ; 



_off000_913A:
    .byte $83   ; 
    .byte $24   ; 
    .byte $36   ; 
    .byte $24   ; 
    .byte $36   ; 
    .byte $24   ; 
    .byte $36   ; 
    .byte $24   ; 
    .byte $36   ; 
    .byte $22   ; 
    .byte $36   ; 
    .byte $22   ; 
    .byte $36   ; 
    .byte $22   ; 
    .byte $36   ; 
    .byte $22   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $30   ; 
    .byte $2A   ; 
    .byte $36   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $3C   ; 
    .byte $3C   ; 
    .byte $48   ; 
    .byte $48   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $2A   ; 
    .byte $36   ; 
    .byte $30   ; 
    .byte $3C   ; 
    .byte $36   ; 
    .byte $36   ; 
    .byte $06   ; 
    .byte $06   ; 
    .byte $06   ; 
    .byte $02   ; 
    .byte $81   ; 
    .byte $24   ; 
    .byte $22   ; 
    .byte $85   ; 
    .byte $24   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $2C   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $3C   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $3A   ; 
    .byte $81   ; 
    .byte $22   ; 
    .byte $20   ; 
    .byte $85   ; 
    .byte $22   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $2C   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $3A   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $38   ; 
    .byte $81   ; 
    .byte $22   ; 
    .byte $2A   ; 
    .byte $30   ; 
    .byte $2A   ; 
    .byte $30   ; 
    .byte $36   ; 
    .byte $30   ; 
    .byte $36   ; 
    .byte $3C   ; 
    .byte $36   ; 
    .byte $3C   ; 
    .byte $06   ; 
    .byte $48   ; 
    .byte $06   ; 
    .byte $3C   ; 
    .byte $36   ; 
    .byte $3C   ; 
    .byte $36   ; 
    .byte $30   ; 
    .byte $2A   ; 



_off000_91A4:
    .byte $82   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $86   ; 
    .byte $2C   ; 
    .byte $80   ; 
    .byte $2C   ; 
    .byte $30   ; 
    .byte $34   ; 
    .byte $36   ; 
    .byte $86   ; 
    .byte $3A   ; 
    .byte $82   ; 
    .byte $3A   ; 
    .byte $3A   ; 
    .byte $3A   ; 
    .byte $86   ; 
    .byte $42   ; 
    .byte $80   ; 
    .byte $42   ; 
    .byte $48   ; 
    .byte $4A   ; 
    .byte $02   ; 
    .byte $86   ; 
    .byte $50   ; 
    .byte $80   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $08   ; 
    .byte $22   ; 
    .byte $84   ; 
    .byte $2C   ; 
    .byte $00   ; 00
    .byte $85   ; 
    .byte $08   ; 
    .byte $82   ; 
    .byte $0A   ; 
    .byte $0A   ; 
    .byte $0A   ; 
    .byte $86   ; 
    .byte $14   ; 
    .byte $80   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 
    .byte $1E   ; 
    .byte $86   ; 
    .byte $22   ; 
    .byte $82   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $86   ; 
    .byte $2C   ; 
    .byte $80   ; 
    .byte $2C   ; 
    .byte $30   ; 
    .byte $34   ; 
    .byte $36   ; 
    .byte $83   ; 
    .byte $3A   ; 
    .byte $80   ; 
    .byte $12   ; 
    .byte $81   ; 
    .byte $12   ; 
    .byte $80   ; 
    .byte $12   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $2C   ; 
    .byte $2C   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $24   ; 
    .byte $24   ; 
    .byte $22   ; 
    .byte $83   ; 
    .byte $22   ; 
    .byte $80   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $08   ; 
    .byte $1E   ; 
    .byte $84   ; 
    .byte $22   ; 



_off000_91FD:
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $16   ; 
    .byte $86   ; 
    .byte $18   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $16   ; 
    .byte $86   ; 
    .byte $18   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $85   ; 
    .byte $26   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $1C   ; 
    .byte $87   ; 
    .byte $22   ; 
    .byte $20   ; 
    .byte $18   ; 
    .byte $1E   ; 
    .byte $1C   ; 
    .byte $16   ; 
    .byte $1C   ; 
    .byte $1A   ; 
    .byte $14   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $22   ; 
    .byte $86   ; 
    .byte $24   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $22   ; 
    .byte $86   ; 
    .byte $24   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $34   ; 
    .byte $85   ; 
    .byte $32   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $87   ; 
    .byte $30   ; 
    .byte $2E   ; 
    .byte $24   ; 
    .byte $2C   ; 
    .byte $2A   ; 
    .byte $22   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $20   ; 
    .byte $00   ; 00
    .byte $84   ; 
    .byte $10   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $81   ; 
    .byte $0A   ; 
    .byte $86   ; 
    .byte $0C   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $81   ; 
    .byte $0A   ; 
    .byte $86   ; 
    .byte $0C   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $83   ; 
    .byte $12   ; 
    .byte $81   ; 
    .byte $1C   ; 
    .byte $85   ; 
    .byte $1A   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $10   ; 
    .byte $87   ; 
    .byte $16   ; 
    .byte $14   ; 
    .byte $0C   ; 
    .byte $12   ; 
    .byte $10   ; 
    .byte $0A   ; 
    .byte $10   ; 
    .byte $0E   ; 
    .byte $04   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $16   ; 
    .byte $86   ; 
    .byte $18   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $16   ; 
    .byte $86   ; 
    .byte $18   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $85   ; 
    .byte $26   ; 
    .byte $81   ; 
    .byte $08   ; 
    .byte $1C   ; 
    .byte $87   ; 
    .byte $22   ; 
    .byte $20   ; 
    .byte $18   ; 
    .byte $1E   ; 
    .byte $1C   ; 
    .byte $16   ; 
    .byte $1C   ; 
    .byte $1A   ; 
    .byte $14   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $F0   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $F0   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $F0   ; 
    .byte $F4   ; 
    .byte $81   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $F0   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $2A   ; 
    .byte $2A   ; 
    .byte $F0   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $F0   ; 
    .byte $F8   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $26   ; 
    .byte $F0   ; 
    .byte $F4   ; 
    .byte $81   ; 
    .byte $24   ; 
    .byte $24   ; 
    .byte $F0   ; 
; bzk garbage?
    .byte $49   ; 
    .byte $00   ; 



_off000_92CC:
    .byte $81   ; 
    .byte $14   ; 
    .byte $1E   ; 
    .byte $28   ; 
    .byte $16   ; 
    .byte $20   ; 
    .byte $2A   ; 
    .byte $18   ; 
    .byte $22   ; 
    .byte $2C   ; 
    .byte $87   ; 
    .byte $2E   ; 
    .byte $30   ; 
    .byte $85   ; 
    .byte $32   ; 
    .byte $00   ; 00
    .byte $80   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $14   ; 
    .byte $1E   ; 
    .byte $28   ; 
    .byte $16   ; 
    .byte $20   ; 
    .byte $2A   ; 
    .byte $18   ; 
    .byte $22   ; 
    .byte $80   ; 
    .byte $2C   ; 
    .byte $87   ; 
    .byte $24   ; 
    .byte $26   ; 
    .byte $85   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $14   ; 
    .byte $16   ; 
    .byte $18   ; 
    .byte $87   ; 
    .byte $32   ; 
    .byte $34   ; 
    .byte $85   ; 
    .byte $36   ; 



_off000_92F7:
    .byte $83   ; 
    .byte $56   ; 
    .byte $42   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $52   ; 
    .byte $42   ; 
    .byte $5C   ; 
    .byte $4A   ; 
    .byte $5A   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $5A   ; 
    .byte $56   ; 
    .byte $02   ; 
    .byte $50   ; 
    .byte $4C   ; 
    .byte $5A   ; 
    .byte $02   ; 
    .byte $54   ; 
    .byte $5A   ; 
    .byte $58   ; 
    .byte $02   ; 
    .byte $50   ; 
    .byte $54   ; 
    .byte $4C   ; 
    .byte $42   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $50   ; 
    .byte $48   ; 
    .byte $4A   ; 
    .byte $50   ; 
    .byte $00   ; 00
    .byte $87   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $08   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1C   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1E   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $22   ; 
    .byte $26   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $26   ; 
    .byte $36   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1C   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 
    .byte $87   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $C9   ; 
    .byte $00   ; 



_off000_9352:
    .byte $86   ; 
    .byte $42   ; 
    .byte $83   ; 
    .byte $3E   ; 
    .byte $85   ; 
    .byte $3C   ; 
    .byte $4A   ; 
    .byte $85   ; 
    .byte $48   ; 
    .byte $08   ; 
    .byte $42   ; 
    .byte $08   ; 
    .byte $86   ; 
    .byte $48   ; 
    .byte $83   ; 
    .byte $4A   ; 
    .byte $85   ; 
    .byte $50   ; 
    .byte $02   ; 
    .byte $86   ; 
    .byte $42   ; 
    .byte $83   ; 
    .byte $3E   ; 
    .byte $85   ; 
    .byte $3A   ; 
    .byte $08   ; 
    .byte $00   ; 00
    .byte $86   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $36   ; 
    .byte $85   ; 
    .byte $34   ; 
    .byte $3C   ; 
    .byte $3E   ; 
    .byte $08   ; 
    .byte $3E   ; 
    .byte $08   ; 
    .byte $86   ; 
    .byte $40   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $36   ; 
    .byte $83   ; 
    .byte $36   ; 
    .byte $85   ; 
    .byte $34   ; 
    .byte $08   ; 



_off000_9386:
    .byte $82   ; 
    .byte $42   ; 
    .byte $81   ; 
    .byte $3E   ; 
    .byte $82   ; 
    .byte $3C   ; 
    .byte $80   ; 
    .byte $3C   ; 
    .byte $84   ; 
    .byte $42   ; 
    .byte $80   ; 
    .byte $4A   ; 
    .byte $82   ; 
    .byte $48   ; 
    .byte $81   ; 
    .byte $3E   ; 
    .byte $87   ; 
    .byte $42   ; 
    .byte $82   ; 
    .byte $48   ; 
    .byte $81   ; 
    .byte $4A   ; 
    .byte $00   ; 00



_off000_939D:
    .byte $83   ; 
    .byte $50   ; 
    .byte $85   ; 
    .byte $02   ; 
    .byte $83   ; 
    .byte $48   ; 
    .byte $82   ; 
    .byte $42   ; 
    .byte $81   ; 
    .byte $3E   ; 
    .byte $87   ; 
    .byte $3A   ; 
    .byte $00   ; 00
    .byte $82   ; 
    .byte $3E   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $34   ; 
    .byte $80   ; 
    .byte $34   ; 
    .byte $84   ; 
    .byte $3C   ; 
    .byte $80   ; 
    .byte $3C   ; 
    .byte $82   ; 
    .byte $3E   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $87   ; 
    .byte $3E   ; 
    .byte $82   ; 
    .byte $36   ; 
    .byte $81   ; 
    .byte $3A   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $34   ; 
    .byte $81   ; 
    .byte $2C   ; 
    .byte $87   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1C   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1E   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $22   ; 
    .byte $26   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $26   ; 
    .byte $36   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $1C   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 



_off000_93ED:
    .byte $83   ; 
    .byte $50   ; 
    .byte $85   ; 
    .byte $02   ; 
    .byte $83   ; 
    .byte $50   ; 
    .byte $87   ; 
    .byte $4C   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $4C   ; 
    .byte $4C   ; 
    .byte $00   ; 00
    .byte $83   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $87   ; 
    .byte $44   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $44   ; 
    .byte $44   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $26   ; 
    .byte $3E   ; 
    .byte $34   ; 
    .byte $3E   ; 
    .byte $26   ; 
    .byte $3E   ; 
    .byte $34   ; 
    .byte $3E   ; 
    .byte $C8   ; 
    .byte $11   ; 
    .byte $10   ; 
    .byte $C8   ; 
    .byte $D0   ; 
    .byte $00   ; 



_off000_941A:
    .byte $85   ; 
    .byte $50   ; 
    .byte $02   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $4A   ; 
    .byte $48   ; 
    .byte $86   ; 
    .byte $42   ; 
    .byte $83   ; 
    .byte $3E   ; 
    .byte $85   ; 
    .byte $48   ; 
    .byte $3E   ; 
    .byte $83   ; 
    .byte $3A   ; 
    .byte $3E   ; 
    .byte $40   ; 
    .byte $06   ; 
    .byte $85   ; 
    .byte $42   ; 
    .byte $3E   ; 
    .byte $87   ; 
    .byte $36   ; 
    .byte $08   ; 
    .byte $00   ; 00
    .byte $85   ; 
    .byte $40   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $83   ; 
    .byte $40   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $36   ; 
    .byte $83   ; 
    .byte $2C   ; 
    .byte $85   ; 
    .byte $38   ; 
    .byte $2C   ; 
    .byte $83   ; 
    .byte $28   ; 
    .byte $2C   ; 
    .byte $30   ; 
    .byte $32   ; 
    .byte $85   ; 
    .byte $34   ; 
    .byte $2C   ; 
    .byte $83   ; 
    .byte $26   ; 
    .byte $84   ; 
    .byte $26   ; 
    .byte $80   ; 
    .byte $26   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $2C   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $87   ; 
    .byte $26   ; 
    .byte $83   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $1E   ; 
    .byte $36   ; 
    .byte $28   ; 
    .byte $36   ; 
    .byte $26   ; 
    .byte $22   ; 
    .byte $1E   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $2C   ; 
    .byte $20   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $14   ; 
    .byte $22   ; 
    .byte $26   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 
    .byte $1E   ; 
    .byte $84   ; 
    .byte $1E   ; 
    .byte $80   ; 
    .byte $1E   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $80   ; 
    .byte $22   ; 
    .byte $84   ; 
    .byte $26   ; 
    .byte $80   ; 
    .byte $22   ; 
    .byte $83   ; 
    .byte $1E   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1C   ; 
    .byte $C8   ; 
    .byte $11   ; 
    .byte $10   ; 
    .byte $C8   ; 
    .byte $D0   ; 
    .byte $00   ; 



_off000_948B:
    .byte $81   ; 
    .byte $32   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $2E   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $2A   ; 
    .byte $2A   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $30   ; 
    .byte $2C   ; 
    .byte $81   ; 
    .byte $30   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $00   ; 00
    .byte $83   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $81   ; 
    .byte $2E   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $2A   ; 
    .byte $2A   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $30   ; 
    .byte $2C   ; 
    .byte $81   ; 
    .byte $30   ; 
    .byte $80   ; 
    .byte $08   ; 
    .byte $86   ; 
    .byte $1A   ; 
    .byte $28   ; 
    .byte $81   ; 
    .byte $32   ; 
    .byte $86   ; 
    .byte $16   ; 
    .byte $24   ; 
    .byte $81   ; 
    .byte $2E   ; 
    .byte $86   ; 
    .byte $12   ; 
    .byte $20   ; 
    .byte $81   ; 
    .byte $2A   ; 
    .byte $86   ; 
    .byte $10   ; 
    .byte $1E   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $40   ; 
    .byte $00   ; 



_off000_94DC:
    .byte $81   ; 
    .byte $04   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $04   ; 
    .byte $08   ; 
    .byte $86   ; 
    .byte $32   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $86   ; 
    .byte $32   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $00   ; 00
    .byte $11   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $00   ; 
    .byte $F6   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $84   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $F0   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $10   ; 
    .byte $6C   ; 
    .byte $84   ; 
    .byte $0C   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1E   ; 
    .byte $22   ; 
    .byte $24   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $82   ; 
    .byte $0C   ; 
    .byte $68   ; 
    .byte $0C   ; 
    .byte $68   ; 
    .byte $0C   ; 
    .byte $68   ; 
    .byte $84   ; 
    .byte $04   ; 
    .byte $82   ; 
    .byte $04   ; 
    .byte $66   ; 
    .byte $84   ; 
    .byte $04   ; 
    .byte $82   ; 
    .byte $04   ; 
    .byte $66   ; 
    .byte $84   ; 
    .byte $04   ; 
    .byte $82   ; 
    .byte $04   ; 
    .byte $66   ; 
    .byte $04   ; 
    .byte $66   ; 
    .byte $04   ; 
    .byte $66   ; 
    .byte $84   ; 
    .byte $70   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1E   ; 
    .byte $22   ; 
    .byte $24   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $82   ; 
    .byte $70   ; 
    .byte $64   ; 
    .byte $70   ; 
    .byte $64   ; 
    .byte $70   ; 
    .byte $64   ; 



_off000_95A1:
    .byte $84   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $80   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $32   ; 
    .byte $82   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $84   ; 
    .byte $08   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $40   ; 
    .byte $06   ; 
    .byte $87   ; 
    .byte $44   ; 
    .byte $00   ; 00
    .byte $84   ; 
    .byte $22   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $87   ; 
    .byte $1E   ; 
    .byte $84   ; 
    .byte $22   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $22   ; 
    .byte $22   ; 
    .byte $24   ; 
    .byte $28   ; 
    .byte $2C   ; 
    .byte $84   ; 
    .byte $2E   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $32   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $3C   ; 
    .byte $86   ; 
    .byte $40   ; 
    .byte $85   ; 
    .byte $2E   ; 
    .byte $32   ; 
    .byte $87   ; 
    .byte $36   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $84   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $F0   ; 



_off000_95F1:
    .byte $81   ; 
    .byte $46   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $46   ; 
    .byte $46   ; 
    .byte $87   ; 
    .byte $44   ; 
    .byte $06   ; 
    .byte $44   ; 
    .byte $85   ; 
    .byte $08   ; 
    .byte $06   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $40   ; 
    .byte $84   ; 
    .byte $3C   ; 
    .byte $82   ; 
    .byte $3C   ; 
    .byte $40   ; 
    .byte $81   ; 
    .byte $06   ; 
    .byte $84   ; 
    .byte $40   ; 
    .byte $3C   ; 
    .byte $38   ; 
    .byte $82   ; 
    .byte $38   ; 
    .byte $3C   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $84   ; 
    .byte $3C   ; 
    .byte $38   ; 
    .byte $00   ; 00
    .byte $84   ; 
    .byte $2A   ; 
    .byte $82   ; 
    .byte $08   ; 
    .byte $2A   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $85   ; 
    .byte $38   ; 
    .byte $08   ; 
    .byte $87   ; 
    .byte $38   ; 
    .byte $38   ; 
    .byte $85   ; 
    .byte $36   ; 
    .byte $32   ; 
    .byte $85   ; 
    .byte $38   ; 
    .byte $08   ; 
    .byte $87   ; 
    .byte $32   ; 
    .byte $85   ; 
    .byte $2E   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $85   ; 
    .byte $2E   ; 
    .byte $08   ; 
    .byte $87   ; 
    .byte $2E   ; 
    .byte $2E   ; 
    .byte $85   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $84   ; 
    .byte $2A   ; 
    .byte $82   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $2A   ; 
    .byte $82   ; 
    .byte $2A   ; 
    .byte $2E   ; 
    .byte $86   ; 
    .byte $32   ; 
    .byte $84   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $82   ; 
    .byte $28   ; 
    .byte $24   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $82   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $86   ; 
    .byte $2E   ; 
    .byte $84   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $11   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $00   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $20   ; 
    .byte $82   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $84   ; 
    .byte $20   ; 
    .byte $82   ; 
    .byte $20   ; 
    .byte $20   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $F0   ; 



_off000_968D:
    .byte $86   ; 
    .byte $26   ; 
    .byte $84   ; 
    .byte $26   ; 
    .byte $82   ; 
    .byte $26   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $2C   ; 
    .byte $82   ; 
    .byte $2C   ; 
    .byte $30   ; 
    .byte $84   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $18   ; 
    .byte $82   ; 
    .byte $18   ; 
    .byte $18   ; 
    .byte $84   ; 
    .byte $16   ; 
    .byte $82   ; 
    .byte $16   ; 
    .byte $16   ; 
    .byte $84   ; 
    .byte $14   ; 
    .byte $82   ; 
    .byte $14   ; 
    .byte $14   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $00   ; 00
    .byte $11   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $00   ; 
    .byte $84   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $81   ; 
    .byte $3E   ; 
    .byte $86   ; 
    .byte $42   ; 
    .byte $82   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $08   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $28   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1E   ; 
    .byte $82   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $84   ; 
    .byte $1E   ; 
    .byte $82   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $F0   ; 
    .byte $84   ; 
    .byte $28   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $14   ; 
    .byte $18   ; 



_off000_96EB:
    .byte $81   ; 
    .byte $38   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $3E   ; 
    .byte $84   ; 
    .byte $3C   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $86   ; 
    .byte $30   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $46   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $4E   ; 
    .byte $84   ; 
    .byte $02   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $48   ; 
    .byte $86   ; 
    .byte $40   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $84   ; 
    .byte $12   ; 
    .byte $82   ; 
    .byte $12   ; 
    .byte $12   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $F0   ; 
    .byte $11   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $00   ; 



_off000_9720:
    .byte $85   ; 
    .byte $62   ; 
    .byte $6C   ; 
    .byte $04   ; 
    .byte $0E   ; 
    .byte $87   ; 
    .byte $1A   ; 
    .byte $20   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $86   ; 
    .byte $28   ; 
    .byte $85   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $87   ; 
    .byte $10   ; 
    .byte $81   ; 
    .byte $10   ; 
    .byte $85   ; 
    .byte $62   ; 
    .byte $6C   ; 
    .byte $04   ; 
    .byte $0E   ; 
    .byte $87   ; 
    .byte $1A   ; 
    .byte $20   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $86   ; 
    .byte $28   ; 
    .byte $85   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $87   ; 
    .byte $10   ; 
    .byte $81   ; 
    .byte $10   ; 
    .byte $00   ; 00
    .byte $81   ; 
    .byte $06   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $46   ; 
    .byte $84   ; 
    .byte $48   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $40   ; 
    .byte $81   ; 
    .byte $06   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $46   ; 
    .byte $84   ; 
    .byte $48   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $40   ; 
    .byte $86   ; 
    .byte $3A   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $0E   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $0E   ; 
    .byte $84   ; 
    .byte $0E   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $0E   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $0E   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $0E   ; 
    .byte $84   ; 
    .byte $0E   ; 
    .byte $82   ; 
    .byte $0E   ; 
    .byte $0E   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $84   ; 
    .byte $10   ; 
    .byte $82   ; 
    .byte $10   ; 
    .byte $10   ; 
    .byte $F0   ; 



_off000_978F:
    .byte $81   ; 
    .byte $2A   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $34   ; 
    .byte $84   ; 
    .byte $32   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $28   ; 
    .byte $86   ; 
    .byte $20   ; 
    .byte $00   ; 00
    .byte $11   ; 
    .byte $90   ; 
    .byte $90   ; 
    .byte $00   ; 
    .byte $81   ; 
    .byte $3C   ; 
    .byte $86   ; 
    .byte $08   ; 
    .byte $06   ; 
    .byte $84   ; 
    .byte $40   ; 
    .byte $08   ; 
    .byte $81   ; 
    .byte $38   ; 
    .byte $86   ; 
    .byte $32   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $84   ; 
    .byte $1C   ; 
    .byte $82   ; 
    .byte $1C   ; 
    .byte $1C   ; 
    .byte $F0   ; 
    .byte $F2   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $84   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $1A   ; 
    .byte $1A   ; 
    .byte $F0   ; 



_off000_97C4:
    .byte $85   ; 
    .byte $36   ; 
    .byte $80   ; 
    .byte $36   ; 
    .byte $36   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $32   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $85   ; 
    .byte $36   ; 
    .byte $80   ; 
    .byte $36   ; 
    .byte $36   ; 
    .byte $81   ; 
    .byte $36   ; 
    .byte $82   ; 
    .byte $32   ; 
    .byte $2C   ; 
    .byte $3A   ; 
    .byte $83   ; 
    .byte $36   ; 
    .byte $80   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $85   ; 
    .byte $1E   ; 
    .byte $00   ; 00
    .byte $85   ; 
    .byte $26   ; 
    .byte $80   ; 
    .byte $26   ; 
    .byte $26   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $82   ; 
    .byte $22   ; 
    .byte $1E   ; 
    .byte $28   ; 
    .byte $85   ; 
    .byte $26   ; 
    .byte $80   ; 
    .byte $26   ; 
    .byte $26   ; 
    .byte $81   ; 
    .byte $26   ; 
    .byte $82   ; 
    .byte $22   ; 
    .byte $1E   ; 
    .byte $28   ; 
    .byte $83   ; 
    .byte $2C   ; 
    .byte $80   ; 
    .byte $14   ; 
    .byte $14   ; 
    .byte $14   ; 
    .byte $14   ; 
    .byte $85   ; 
    .byte $14   ; 
    .byte $82   ; 
    .byte $26   ; 
    .byte $1E   ; 
    .byte $26   ; 
    .byte $2C   ; 
    .byte $26   ; 
    .byte $2C   ; 
    .byte $32   ; 
    .byte $2C   ; 
    .byte $32   ; 
    .byte $3A   ; 
    .byte $32   ; 
    .byte $3A   ; 
    .byte $26   ; 
    .byte $1E   ; 
    .byte $26   ; 
    .byte $2C   ; 
    .byte $26   ; 
    .byte $2C   ; 
    .byte $32   ; 
    .byte $2C   ; 
    .byte $32   ; 
    .byte $3A   ; 
    .byte $32   ; 
    .byte $3A   ; 
    .byte $83   ; 
    .byte $36   ; 
    .byte $80   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $1E   ; 
    .byte $85   ; 
    .byte $1E   ; 



sub_0x001835_update_sound_driver:
    LDA ram_pause_flag
    BEQ bra_9835_not_paused
    LDA #$00
    STA $4015
    LDA #$0F
    STA $4015
    BNE bra_9846    ; jmp
bra_9835_not_paused:
    LDA #$FF
    STA $4017
    JSR sub_9AD5_sfx_2
    JSR sub_99A0_sfx_3
    JSR sub_9B85_sfx_1
    JSR sub_9C6B_music
bra_9846:
    JSR sub_98CC_sfx_4
    LDA #$00
    STA ram_sfx_4
    STA ram_sfx_3
    STA ram_sfx_2
    STA ram_sfx_1
    STA ram_music
    RTS



tbl_985B:
tbl__985B:
    .byte off_9877 - tbl__985B   ; 
    .byte off_98A7 - tbl__985B   ; 
    .byte off_9882 - tbl__985B   ; 
    .byte off_98B7 - tbl__985B   ; 
    .byte off_98A1 - tbl__985B   ; 
    .byte off_98C2 - tbl__985B   ; 
    .byte off_9862 - tbl__985B   ; 



tbl_9862:
off_9862:   ; 07
    .byte $95   ; 
    .byte $50   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $90   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $00   ; 



off_9877:   ; 1C
    .byte $82   ; 
    .byte $4A   ; 
    .byte $48   ; 
    .byte $4A   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $00   ; 



off_9882:   ; 27
    .byte $9F   ; 
    .byte $1E   ; 
    .byte $22   ; 
    .byte $24   ; 
    .byte $26   ; 
    .byte $9F   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $2E   ; 
    .byte $9A   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $2E   ; 
    .byte $9C   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $2E   ; 
    .byte $96   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $2E   ; 
    .byte $98   ; 
    .byte $28   ; 
    .byte $2A   ; 
    .byte $2C   ; 
    .byte $2E   ; 
    .byte $00   ; 



off_98A1:   ; 46
    .byte $99   ; 
    .byte $42   ; 
    .byte $4A   ; 
    .byte $50   ; 
    .byte $54   ; 
    .byte $00   ; 



off_98A7:   ; 4C
    .byte $99   ; 
    .byte $70   ; 
    .byte $0A   ; 
    .byte $70   ; 
    .byte $0E   ; 
    .byte $70   ; 
    .byte $10   ; 
    .byte $9F   ; 
    .byte $70   ; 
    .byte $2A   ; 
    .byte $12   ; 
    .byte $1E   ; 
    .byte $2A   ; 
    .byte $70   ; 
    .byte $1E   ; 
    .byte $00   ; 



off_98B7:   ; 5C
    .byte $9A   ; 
    .byte $42   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $56   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $00   ; 
; bzk garbage
    .byte $08   ; 
    .byte $08   ; 
    .byte $00   ; 



off_98C2:   ; 67
    .byte $9F   ; 
    .byte $40   ; 
    .byte $30   ; 
    .byte $40   ; 
    .byte $3A   ; 
    .byte $28   ; 
    .byte $00   ; 



bra_98C9:
    JMP loc_9D46
sub_98CC_sfx_4:
    LDA ram_sfx_4
    BMI bra_98C9
    BEQ bra_98DC
    CMP #$40
    BNE bra_98E2
    LDX ram_0605_sfx_4
    BEQ bra_98E2
bra_98DC:
    LDA ram_0605_sfx_4
    BNE bra_98F1
    RTS
bra_98E2:
    STA ram_0605_sfx_4
    LDY #$00
bra_98E7_loop:
    INY
    LSR
    BCC bra_98E7_loop
    LDA tbl_985B - $01,Y
    STA ram_060E
bra_98F1:
    LDY ram_060E
    INC ram_060E
    LDA tbl_9862 - $07,Y
    BMI bra_9911
    BNE bra_991D
    LDX #$90
    STX $4000
    LDX #$18
    STX $4003
    LDX #$00
    STX $4002
    STX ram_0605_sfx_4
    RTS
bra_9911:
    STA $4000
    LDY ram_060E
    INC ram_060E
    LDA tbl_9862 - $07,Y
bra_991D:
    JSR sub_9C0D
    LDA #$7F
    STA $4001
    RTS
bra_9926:
    LDA #$0F
    STA $4015
    LDA #$00
    STA ram_0608_sfx_1
    STA ram_0607_sfx_2
    STA ram_061A
    STA ram_05F6
    RTS
bra_993A:
    STY ram_0606_sfx_3
    LDA #$05
    STA ram_0069_se
    LDA ram_sfx_4
    AND #con_sfx_4_rupee ^ $FF
    BNE bra_994B
    STA ram_sfx_4
bra_994B:
    LDY ram_0069_se
    LDA tbl_9FBB,Y
    BNE bra_996E    ; jmp
bra_9952:
    STY ram_0606_sfx_3
    LDA #$38
    STA ram_0069_se
bra_9959_loop:
    LDA #$0D
    STA ram_0068_se_t01
bra_995D:
    DEC ram_0068_se_t01
    LDY ram_0068_se_t01
    BEQ bra_9959_loop
    CPY #$07
    BCC bra_996B
    LDA #$10
    BNE bra_997B    ; jmp
bra_996B:
    LDA tbl_9EF8,Y
bra_996E:
    TAX
    AND #$0F
    STA $400E
    TXA
; / 10
    LSR
    LSR
    LSR
    LSR
    ORA #$10
bra_997B:
loc_997B:
    STA $400C
    LDA #$08
    STA $400F
    DEC ram_0069_se
loc_9985:
    BNE bra_9991_RTS
    LDA #$F0
    STA $400C
    LDA #$00
    STA ram_0606_sfx_3
bra_9991_RTS:
    RTS



bra_9992:
    STY ram_0606_sfx_3
    LDA #$0A
    STA ram_0069_se
bra_9999:
    LDY ram_0069_se
    LDA tbl_9FB1,Y
    BNE bra_996E    ; jmp



sub_99A0_sfx_3:
    LDY ram_sfx_3
    BMI bra_9926
    LDA ram_0606_sfx_3
    LSR ram_sfx_3
    BCS bra_9992
    LSR
    BCS bra_9999
    LSR ram_sfx_3
    BCS bra_993A
    LSR
    BCS bra_994B
    LSR ram_sfx_3
    BCS bra_99E7
    LSR
    BCS bra_99EE
    LSR ram_sfx_3
    BCS bra_9952
    LSR
    BCS bra_995D
    LSR ram_sfx_3
    BCS bra_99D9
    LSR
    BCS bra_99E0
    LSR
    BCS bra_9A09
    LSR ram_sfx_3
    BCS bra_99FD
    RTS
bra_99D9:
    STY ram_0606_sfx_3
    LDA #$18
    STA ram_0069_se
bra_99E0:
    LDY ram_0069_se
    LDA tbl_9A3D - $01,Y
    BNE bra_996E    ; bzk
bra_99E7:
    STY ram_0606_sfx_3
    LDA #$20
    STA ram_0069_se
bra_99EE:
    LDA ram_0069_se
    LSR
    TAY
    LDX #$0E
    STX $400E
    LDA tbl_9FC0,Y
    JMP loc_997B
bra_99FD:
    STY ram_0606_sfx_3
    LDA #$D0
    STA ram_05F3
    LDA #$10
    STA ram_0068_se_t02
bra_9A09:
    LDA ram_05F3
    CMP #$BF
    BCC bra_9A14
    INC ram_0068_se_t02
    BNE bra_9A28
bra_9A14:
    LDA ram_05F3
    LSR
    BCC bra_9A28
    LSR
    BCC bra_9A28
    LSR
    BCC bra_9A28
    LDA ram_0068_se_t02
    CMP #$10
    BEQ bra_9A28
    DEC ram_0068_se_t02
bra_9A28:
    LDA ram_0068_se_t02
    STA $400C
    LDX #$03
    STX $400E
    LDA #$08
    STA $400F
    DEC ram_05F3
    JMP loc_9985



tbl_9A3D:
    .byte $1F   ; 
    .byte $2F   ; 
    .byte $2E   ; 
    .byte $3F   ; 
    .byte $3F   ; 
    .byte $4C   ; 
    .byte $4E   ; 
    .byte $5F   ; 
    .byte $6F   ; 
    .byte $6F   ; 
    .byte $7E   ; 
    .byte $8F   ; 
    .byte $9E   ; 
    .byte $AF   ; 
    .byte $BE   ; 
    .byte $CF   ; 
    .byte $DE   ; 
    .byte $EF   ; 
    .byte $FE   ; 
    .byte $FD   ; 
    .byte $FE   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FE   ; 



tbl_9A55:
tbl__9A55:
    .byte off_9A61 - tbl__9A55   ; 
    .byte off_9A5D - tbl__9A55   ; 
    .byte off_9A66 - tbl__9A55   ; 
    .byte off_9A71 - tbl__9A55   ; 
    .byte off_9A7D - tbl__9A55   ; 
    .byte off_9A88 - tbl__9A55   ; 
    .byte off_9A95 - tbl__9A55   ; 
    .byte off_9AB7 - tbl__9A55   ; 



tbl_9A5D:
off_9A5D:   ; 08
    .byte $8A   ; 
    .byte $4E   ; 
    .byte $58   ; 
    .byte $60   ; 



off_9A61:   ; 0C
    .byte $8A   ; 
    .byte $5E   ; 
    .byte $94   ; 
    .byte $60   ; 
    .byte $00   ; 



off_9A66:   ; 11
    .byte $8A   ; 
    .byte $42   ; 
    .byte $06   ; 
    .byte $3C   ; 
    .byte $30   ; 
    .byte $2E   ; 
    .byte $3E   ; 
    .byte $44   ; 
    .byte $CC   ; 
    .byte $02   ; 
    .byte $00   ; 



off_9A71:   ; 1C
    .byte $83   ; 
    .byte $40   ; 
    .byte $42   ; 
    .byte $48   ; 
    .byte $4A   ; 
    .byte $02   ; 
    .byte $50   ; 
    .byte $4C   ; 
    .byte $54   ; 
    .byte $94   ; 
    .byte $56   ; 
    .byte $00   ; 



off_9A7D:   ; 28
    .byte $94   ; 
    .byte $3A   ; 
    .byte $3E   ; 
    .byte $A8   ; 
    .byte $50   ; 
    .byte $8A   ; 
    .byte $4E   ; 
    .byte $02   ; 
    .byte $CC   ; 
    .byte $4A   ; 
    .byte $00   ; 



off_9A88:   ; 33
    .byte $81   ; 
    .byte $28   ; 
    .byte $3E   ; 
    .byte $24   ; 
    .byte $82   ; 
    .byte $3A   ; 
    .byte $81   ; 
    .byte $16   ; 
    .byte $30   ; 
    .byte $1A   ; 
    .byte $82   ; 
    .byte $34   ; 
    .byte $00   ; 



off_9A95:   ; 40
    .byte $94   ; 
    .byte $56   ; 
    .byte $42   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $52   ; 
    .byte $42   ; 
    .byte $5C   ; 
    .byte $4A   ; 
    .byte $5A   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $5A   ; 
    .byte $56   ; 
    .byte $02   ; 
    .byte $50   ; 
    .byte $4C   ; 
    .byte $5A   ; 
    .byte $02   ; 
    .byte $54   ; 
    .byte $5A   ; 
    .byte $58   ; 
    .byte $02   ; 
    .byte $50   ; 
    .byte $54   ; 
    .byte $4C   ; 
    .byte $42   ; 
    .byte $02   ; 
    .byte $4C   ; 
    .byte $50   ; 
    .byte $48   ; 
    .byte $4A   ; 
    .byte $50   ; 
    .byte $00   ; 



off_9AB7:   ; 62
    .byte $8A   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $08   ; 
    .byte $85   ; 
    .byte $3C   ; 
    .byte $3A   ; 
    .byte $38   ; 
    .byte $36   ; 
    .byte $3A   ; 
    .byte $38   ; 
    .byte $36   ; 
    .byte $34   ; 
    .byte $38   ; 
    .byte $36   ; 
    .byte $34   ; 
    .byte $32   ; 
    .byte $36   ; 
    .byte $34   ; 
    .byte $32   ; 
    .byte $30   ; 
    .byte $34   ; 
    .byte $32   ; 
    .byte $30   ; 
    .byte $2E   ; 
    .byte $2A   ; 
    .byte $28   ; 
    .byte $A8   ; 
    .byte $26   ; 
    .byte $00   ; 



sub_9AD5_sfx_2:
    LDA ram_sfx_2
    BMI bra_9AE2
    BNE bra_9AE7_loop
    LDA ram_0607_sfx_2
    BNE bra_9AFA
    RTS
bra_9AE2:
    JSR sub_9D46
    LDA #$80
bra_9AE7_loop:
    STA ram_0607_sfx_2
    LDY #$00
bra_9AEC_loop:
    INY
    LSR
    BCC bra_9AEC_loop
    LDA tbl_9A55 - $01,Y
    STA ram_0618
    LDA #$01
    STA ram_006F_se
bra_9AFA:
    DEC ram_006F_se
    BNE bra_9B47
    LDY ram_0618
    INC ram_0618
    LDA tbl_9A5D - $08,Y
    BMI bra_9B25
    BNE bra_9B32
    LDA ram_0607_sfx_2
    CMP #$40
    BEQ bra_9AE7_loop
    LDX #$90
    STX $4004
    LDX #$18
    STX $4007
    LDX #$00
    STX ram_0607_sfx_2
    STX $4006
    RTS
bra_9B25:
    AND #$7F
    STA ram_006E_se
    LDY ram_0618
    INC ram_0618
    LDA tbl_9A5D - $08,Y
bra_9B32:
    JSR sub_9C2B
    LDA #$7F
    STA $4005
    LDA #$86
    STA $4004
    LDA ram_006E_se
    STA ram_006F_se
    LDA #$1F
    STA ram_006D_se
bra_9B47:
    LDA ram_0607_sfx_2
    AND #$90
    BEQ bra_9B64_RTS
    LDY ram_006D_se
    BEQ bra_9B54
    DEC ram_006D_se
bra_9B54:
    LDA tbl_9B65,Y
    STA $4004
    LDA ram_006F_se
    LDX ram_006B_se
    JSR sub_9C54
    STX $4006
bra_9B64_RTS:
    RTS



tbl_9B65:
    .byte $95   ; 
    .byte $96   ; 
    .byte $97   ; 
    .byte $98   ; 
    .byte $99   ; 
    .byte $9A   ; 
    .byte $9B   ; 
    .byte $9C   ; 
    .byte $9D   ; 
    .byte $9E   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9F   ; 
    .byte $9E   ; 
    .byte $9D   ; 
    .byte $9C   ; 
    .byte $9B   ; 
    .byte $9A   ; 
    .byte $99   ; 
    .byte $98   ; 
    .byte $97   ; 
    .byte $96   ; 



sub_9B85_sfx_1:
    LDA ram_sfx_1
    BMI bra_9BB3
    BNE bra_9BAF
    LDA ram_0608_sfx_1
    BEQ bra_9BA9
    DEC ram_05F2
    BNE bra_9BAE_RTS
    LDA ram_0608_sfx_1
    BMI bra_9BB3
    AND #$70
    BNE bra_9BAF
    LDA #$00
    STA ram_0608_sfx_1
    LDA #$0F
    STA $4015
bra_9BA9:
    LDA ram_05F6
    BNE bra_9BB7
bra_9BAE_RTS:
    RTS
bra_9BAF:
    LDX #$00
    BEQ bra_9BB7    ; jmp
bra_9BB3:
    LDX #$7F
    AND #$F0
bra_9BB7:
    STX $4011
    STA ram_0608_sfx_1
    TAX
    AND #$F0
    BEQ bra_9BC5
    STA ram_05F6
bra_9BC5:
    TXA
    LDY #$00
bra_9BC8_loop:
    INY
    LSR
    BCC bra_9BC8_loop
    LDA tbl_9BFC - $01,Y
    STA $4010
    LDA tbl_9BEE_dpcm_start_address - $01,Y
    STA $4012
    LDA tbl_9BF5_dpcm_size - $01,Y
    STA $4013
    LDA #$A0
    STA ram_05F2
    LDA #$0F
    STA $4015
    LDA #$1F
    STA $4015
    RTS



tbl_9BEE_dpcm_start_address:
; C7E0-C7FF is unused
    .byte $00   ; 00 C000-C74F
    .byte $4C   ; 01 D300-DEFF
    .byte $80   ; 02 E000-E3FF
    .byte $1D   ; 03 C740-C7DF
    .byte $20   ; 04 C800-D2FF
    .byte $28   ; 05 CA00-D2FF
    .byte $4C   ; 06 D300-DFFF



tbl_9BF5_dpcm_size:
    .byte $75   ; 00 750
    .byte $C0   ; 01 C00
    .byte $40   ; 02 400
    .byte $0A   ; 03  A0
    .byte $B0   ; 04 B00
    .byte $90   ; 05 900
    .byte $D0   ; 06 D00



tbl_9BFC:
    .byte $0F   ; 00 
    .byte $0F   ; 01 
    .byte $0D   ; 02 
    .byte $0F   ; 03 
    .byte $0E   ; 04 
    .byte $0F   ; 05 
    .byte $0E   ; 06 



sub_9C03_set_4000_4001:
    STY $4001
    STX $4000
    RTS


; bzk garbage
    JSR sub_9C03_set_4000_4001



sub_9C0D:
    TAY
    LDA tbl_9F00 + $01,Y
    BEQ bra_9C20_RTS
    STA ram_006A_se
    STA $4002
    LDA tbl_9F00,Y
    ORA #$08
    STA $4003
bra_9C20_RTS:
    RTS



sub_9C21_set_4004_4005:
    STX $4004
    STY $4005
    RTS


; bzk garbage
    JSR sub_9C21_set_4004_4005



sub_9C2B:
    TAY
    LDA tbl_9F00 + $01,Y
    BEQ bra_9C20_RTS
    STA ram_006B_se
    STA $4006
    LDA tbl_9F00,Y
    ORA #$08
    STA $4007
    RTS



sub_9C3F:
    TAY
    LDA tbl_9F00 + $01,Y
    BEQ bra_9C20_RTS
    STA ram_05F0
    STA $400A
    LDA tbl_9F00,Y
    ORA #$08
    STA $400B
    RTS



sub_9C54:
    CMP #$10
    BCC bra_9C67_RTS
; / 08
    LSR
    LSR
    LSR
    BCS bra_9C62
    TXA
    ADC #$01
    BNE bra_9C66    ; jmp
bra_9C62:
    TXA
    CLC
    ADC #$FF
bra_9C66:
    TAX
bra_9C67_RTS:
    RTS



bra_9C68:   ; bzk
    JMP loc_9D2C



sub_9C6B_music:
    LDA ram_music
    BNE bra_9C76
    LDA ram_0609_music
    BNE bra_9C68
    RTS
bra_9C76:
    STA ram_0609_music
    BMI bra_9C93
    CMP #$06
    BNE bra_9C83
    LDY #$24
    BNE bra_9CE5    ; jmp
bra_9C83:
    CMP #$01
    BEQ bra_9C9B
    CMP #$40
    BEQ bra_9C97
    CMP #$10
    BNE bra_9C9F
    LDY #$11
    BNE bra_9C9D    ; jmp
bra_9C93:
    LDY #$19
    BNE bra_9C9D    ; jmp
bra_9C97:
    LDY #$0F
    BNE bra_9C9D    ; jmp
bra_9C9B:
    LDY #$08
bra_9C9D:
    STY ram_006C_se
bra_9C9F:
loc_9C9F:
    TAX
    BMI bra_9CD2
    CMP #$01
    BEQ bra_9CC6
    CMP #$40
    BEQ bra_9CBA
    CMP #$10
    BNE bra_9CDE
    INC ram_006C_se
    LDY ram_006C_se
    CPY #$1A
    BNE bra_9CE5
    LDY #$14
    BNE bra_9C9D    ; jmp
bra_9CBA:
    INC ram_006C_se
    LDY ram_006C_se
    CPY #$12
    BNE bra_9CE5
    LDY #$0F
    BNE bra_9C9D    ; jmp
bra_9CC6:
    INC ram_006C_se
    LDY ram_006C_se
    CPY #$10
    BNE bra_9CE5
    LDY #$09
    BNE bra_9C9D    ; jmp
bra_9CD2:
    INC ram_006C_se
    LDY ram_006C_se
    CPY #$24
    BNE bra_9CE5
    LDY #$19
    BNE bra_9C9D    ; jmp
bra_9CDE:
    TXA
    LDY #$00
bra_9CE1_loop:
    INY
    LSR
    BCC bra_9CE1_loop
bra_9CE5:
    LDA tbl_8D60_offset - $01,Y
    TAY
    LDA tbl_8D84_music - $24,Y
    STA ram_05F4
    LDA tbl_8D84_music - $24 + $01,Y
    STA ram_0066_se_t01_data
    LDA tbl_8D84_music - $24 + $02,Y
    STA ram_0066_se_t01_data + $01
    LDA tbl_8D84_music - $24 + $03,Y
    STA ram_060C
    LDA tbl_8D84_music - $24 + $04,Y
    STA ram_060B
    LDA tbl_8D84_music - $24 + $05,Y
    STA ram_060D
    STA ram_05F5
    LDA tbl_8D84_music - $24 + $06,Y
    STA ram_0619
    LDA tbl_8D84_music - $24 + $07,Y
    STA ram_05F1
    LDA #$01
    STA ram_0611
    STA ram_0613
    STA ram_0616
    STA ram_0617
    LSR
    STA ram_060A
loc_9D2C:
    DEC ram_0611
    BNE bra_9D83
    LDY ram_060A
    INC ram_060A
    LDA (ram_0066_se_t01_data),Y
    BEQ bra_9D3F_00
    BPL bra_9D65_01_7F
    BNE bra_9D57_80_FF    ; jmp
bra_9D3F_00:
    LDA ram_0609_music
    AND #$F1
    BNE bra_9D54
loc_9D46:
sub_9D46:
    LDA #$00
    STA ram_0609_music
    STA $4015
    LDA #$0F
    STA $4015
    RTS
bra_9D54:
    JMP loc_9C9F
bra_9D57_80_FF:
; 80-FF
    JSR sub_9EE6
    STA ram_0610
    LDY ram_060A
    INC ram_060A
    LDA (ram_0066_se_t01_data),Y
bra_9D65_01_7F:
    LDX ram_0607_sfx_2
    BNE bra_9D7D
    JSR sub_9C2B
    BEQ bra_9D72
    JSR sub_9F72
bra_9D72:
    STA ram_0612
    JSR sub_9C21_set_4004_4005
    LDA #$00
    STA ram_061B
bra_9D7D:
    LDA ram_0610
    STA ram_0611
bra_9D83:
    LDY ram_0607_sfx_2
    BNE bra_9DAE
    INC ram_061B
    LDY ram_0612
    BEQ bra_9D93
    DEC ram_0612
bra_9D93:
    JSR sub_9F7C
    STA $4004
    LDX #$7F
    STX $4005
    LDA ram_0609_music
    BPL bra_9DAE
    LDA ram_061B
    LDX ram_006B_se
    JSR sub_9C54
    STX $4006
bra_9DAE:
    LDY ram_060B
    BEQ bra_9E19
    DEC ram_0613
    BNE bra_9DEE
    LDY ram_060B
    INC ram_060B
    LDA (ram_0066_se_t01_data),Y
    BPL bra_9DD0
; 80-FF
    JSR sub_9EE6
    STA ram_060F
    LDY ram_060B
    INC ram_060B
    LDA (ram_0066_se_t01_data),Y
bra_9DD0:
    LDX ram_0605_sfx_4
    BNE bra_9DE8
    JSR sub_9C0D
    BEQ bra_9DDD
    JSR sub_9F72
bra_9DDD:
    STA ram_0614
    JSR sub_9C03_set_4000_4001
    LDA #$00
    STA ram_061C
bra_9DE8:
    LDA ram_060F
    STA ram_0613
bra_9DEE:
    LDX ram_0605_sfx_4
    BNE bra_9E19
    INC ram_061C
    LDY ram_0614
    BEQ bra_9DFE
    DEC ram_0614
bra_9DFE:
    JSR sub_9F7C
    STA $4000
    LDA ram_0609_music
    BPL bra_9E14
    LDA ram_061C
    LDX ram_006A_se
    JSR sub_9C54
    STX $4002
bra_9E14:
    LDA #$7F
    STA $4001
bra_9E19:
    LDA ram_060C
    BNE bra_9E21
    JMP loc_9E95
bra_9E21:
    DEC ram_0616
    BNE bra_9E78
loc_9E26:
    LDY ram_060C
    INC ram_060C
    LDA (ram_0066_se_t01_data),Y
    BEQ bra_9E92
    BPL bra_9E6A
; 80-FF
    CMP #$F0
    BEQ bra_9E47
    BCC bra_9E55
    SEC
    SBC #$F0
    STA ram_061E
    LDA ram_060C
    STA ram_061F
    JMP loc_9E26
bra_9E47:
    DEC ram_061E
    BEQ bra_9E52
    LDA ram_061F
    STA ram_060C
bra_9E52:
    JMP loc_9E26
bra_9E55:
    JSR sub_9EE6
    STA ram_0615
    LDA #$1F
    STA $4008
    LDY ram_060C
    INC ram_060C
    LDA (ram_0066_se_t01_data),Y
    BEQ bra_9E92
bra_9E6A:
    JSR sub_9C3F
    LDA #$00
    STA ram_061D
    LDX ram_0615
    STX ram_0616
bra_9E78:
    INC ram_061D
    LDA ram_061D
    LDX ram_05F0
    JSR sub_9C54
    STX $400A
    LDA ram_05F1
    BPL bra_9E90
    LDA #$1F
    BNE bra_9E92    ; jmp
bra_9E90:
    LDA #$FF
bra_9E92:
    STA $4008
loc_9E95:
    LDA ram_0609_music
    AND #$91
    BEQ bra_9ED3_RTS
    DEC ram_0617
    BNE bra_9ED3_RTS
bra_9EA1_loop:
    LDY ram_060D
    INC ram_060D
    LDA (ram_0066_se_t01_data),Y
    BNE bra_9EB3
; 00
    LDA ram_05F5
    STA ram_060D
    BNE bra_9EA1_loop
bra_9EB3:
    JSR sub_9EE0
    STA ram_0617
    TXA
    AND #$3E
; / 10
    LSR
    LSR
    LSR
    LSR
    TAY
    LDA tbl_9ED4_400C,Y
    STA $400C
    LDA tbl_9ED8_400E,Y
    STA $400E
    LDA tbl_9EDC_400F,Y
    STA $400F
bra_9ED3_RTS:
    RTS



tbl_9ED4_400C:
    .byte $10   ; 00 
    .byte $1C   ; 10 
    .byte $1C   ; 20 
    .byte $1C   ; 30 



tbl_9ED8_400E:
    .byte $00   ; 00 
    .byte $03   ; 10 
    .byte $0A   ; 20 
    .byte $03   ; 30 



tbl_9EDC_400F:
    .byte $00   ; 00 
    .byte $18   ; 10 
    .byte $18   ; 20 
    .byte $58   ; 30 



sub_9EE0:
    TAX
    ROR
    TXA
    ROL
    ROL
    ROL
sub_9EE6:
    AND #$07
    CLC
    ADC ram_05F4
    TAY
    LDA tbl_9FD1,Y
    RTS


; bzk garbage
    AND #$07
    TAY
    LDA tbl_9FD1,Y
    RTS



tbl_9EF8:
    .byte $CB   ; 00 unused 0x001971
    .byte $0E   ; 01 
    .byte $0E   ; 02 
    .byte $4C   ; 03 
    .byte $6D   ; 04 
    .byte $8C   ; 05 
    .byte $CD   ; 06 
; bzk garbage 0x001975
    .byte $FF   ; 07 



tbl_9F00:
    .byte $00, $23   ; 00 
    .byte $00, $6A   ; 01 
    .byte $03, $27   ; 02 
    .byte $00, $97   ; 03 
    .byte $00, $00   ; 04 
    .byte $02, $F9   ; 05 
    .byte $02, $CF   ; 06 
    .byte $02, $A6   ; 07 
    .byte $02, $80   ; 08 
    .byte $02, $5C   ; 09 
    .byte $02, $3A   ; 0A 
    .byte $02, $1A   ; 0B 
    .byte $01, $FC   ; 0C 
    .byte $01, $DF   ; 0D 
    .byte $01, $C4   ; 0E 
    .byte $01, $AB   ; 0F 
    .byte $01, $93   ; 10 
    .byte $01, $7C   ; 11 
    .byte $01, $67   ; 12 
    .byte $01, $53   ; 13 
    .byte $01, $40   ; 14 
    .byte $01, $2E   ; 15 
    .byte $01, $1D   ; 16 
    .byte $01, $0D   ; 17 
    .byte $00, $FE   ; 18 
    .byte $00, $EF   ; 19 
    .byte $00, $E2   ; 1A 
    .byte $00, $D5   ; 1B 
    .byte $00, $C9   ; 1C 
    .byte $00, $BE   ; 1D 
    .byte $00, $B3   ; 1E 
    .byte $00, $A9   ; 1F 
    .byte $00, $A0   ; 20 
    .byte $00, $8E   ; 21 
    .byte $00, $86   ; 22 
    .byte $00, $77   ; 23 
    .byte $00, $7E   ; 24 
    .byte $00, $71   ; 25 
    .byte $00, $54   ; 26 
    .byte $00, $64   ; 27 
    .byte $00, $5F   ; 28 
    .byte $00, $59   ; 29 
    .byte $00, $50   ; 2A 
    .byte $00, $47   ; 2B 
    .byte $00, $43   ; 2C 
    .byte $00, $3F   ; 2D 
    .byte $00, $38   ; 2E 
    .byte $00, $32   ; 2F 
    .byte $00, $21   ; 30 
    .byte $05, $4D   ; 31 
    .byte $05, $01   ; 32 
    .byte $04, $B9   ; 33 
    .byte $04, $35   ; 34 
    .byte $03, $F8   ; 35 
    .byte $03, $BF   ; 36 
    .byte $03, $89   ; 37 
    .byte $03, $57   ; 38 



sub_9F72:
    LDA ram_0619
    LDA #$20
    LDX #$82
    LDY #$7F
    RTS



sub_9F7C:
    LDA ram_0619
    BPL bra_9F88
    LDA tbl_9F92,Y
    AND #$0F
    BNE bra_9F8F
bra_9F88:
    LDA tbl_9F92,Y
; / 10
    LSR
    LSR
    LSR
    LSR
bra_9F8F:
    ORA #$90
    RTS



tbl_9F92:
;                                              +----------- 
;                                              |     +----- 
;                                              |     |
    .byte $04 + $00   ; 00 
    .byte $04 + $20   ; 01 
    .byte $04 + $20   ; 02 
    .byte $04 + $30   ; 03 
    .byte $04 + $30   ; 04 
    .byte $05 + $30   ; 05 
    .byte $05 + $30   ; 06 
    .byte $05 + $30   ; 07 
    .byte $05 + $40   ; 08 
    .byte $05 + $40   ; 09 
    .byte $06 + $40   ; 0A 
    .byte $06 + $40   ; 0B 
    .byte $06 + $40   ; 0C 
    .byte $06 + $40   ; 0D 
    .byte $06 + $40   ; 0E 
    .byte $06 + $40   ; 0F 
    .byte $06 + $40   ; 10 
    .byte $06 + $40   ; 11 
    .byte $07 + $50   ; 12 
    .byte $07 + $50   ; 13 
    .byte $07 + $50   ; 14 
    .byte $07 + $50   ; 15 
    .byte $08 + $60   ; 16 
    .byte $08 + $60   ; 17 
    .byte $08 + $60   ; 18 
    .byte $08 + $60   ; 19 
    .byte $09 + $70   ; 1A 
    .byte $09 + $70   ; 1B 
    .byte $09 + $70   ; 1C 
    .byte $08 + $60   ; 1D 
    .byte $08 + $60   ; 1E 



tbl_9FB1:
    .byte $57   ; 00 
    .byte $47   ; 01 
    .byte $67   ; 02 
    .byte $87   ; 03 
    .byte $A8   ; 04 
    .byte $B9   ; 05 
    .byte $9A   ; 06 
    .byte $8A   ; 07 
    .byte $5A   ; 08 
    .byte $9B   ; 09 



tbl_9FBB:
    .byte $8B   ; 00 
    .byte $FB   ; 01 
    .byte $F9   ; 02 
    .byte $9D   ; 03 
    .byte $6E   ; 04 



tbl_9FC0:
    .byte $3F   ; 00 
    .byte $1A   ; 01 
    .byte $1A   ; 02 
    .byte $1C   ; 03 
    .byte $1D   ; 04 
    .byte $1D   ; 05 
    .byte $1E   ; 06 
    .byte $1E   ; 07 
    .byte $1F   ; 08 
    .byte $1F   ; 09 
    .byte $1E   ; 0A 
    .byte $1A   ; 0B 
    .byte $19   ; 0C 
    .byte $16   ; 0D 
    .byte $13   ; 0E 
    .byte $11   ; 0F 
    .byte $11   ; 10 



tbl_9FD1:
; 00 
    .byte $03   ; 00 
    .byte $0A   ; 01 
    .byte $01   ; 02 
    .byte $14   ; 03 
    .byte $05   ; 04 
    .byte $28   ; 05 
    .byte $3C   ; 06 
    .byte $70   ; 07 
; 08 
    .byte $07   ; 00 
    .byte $1B   ; 01 
    .byte $35   ; 02 
    .byte $14   ; 03 
    .byte $0D   ; 04 
    .byte $28   ; 05 
    .byte $3C   ; 06 
    .byte $50   ; 07 
; 10 
    .byte $06   ; 00 
    .byte $0C   ; 01 
    .byte $08   ; 02 
    .byte $18   ; 03 
    .byte $24   ; 04 
    .byte $30   ; 05 
    .byte $48   ; 06 
    .byte $10   ; 07 
; 18 
    .byte $07   ; 00 
    .byte $0D   ; 01 
    .byte $09   ; 02 
    .byte $1B   ; 03 
    .byte $24   ; 04 
    .byte $36   ; 05 
    .byte $48   ; 06 
    .byte $10   ; 07 
; 20 
    .byte $3C   ; 00 
    .byte $50   ; 01 
    .byte $0A   ; 02 
    .byte $05   ; 03 
    .byte $14   ; 04 
    .byte $0D   ; 05 
    .byte $28   ; 06 
    .byte $0E   ; 07 


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



.segment "BANK_00i"
.include "copy_bank___BF50_BFF9.asm"



.out .sprintf("Free bytes in bank 00: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))



.segment "VECTORS_00"
    .word vec_0x01E494_NMI
    .word vec_inc_0x003F60_RESET
    .word $BFF0 ; this game doesn't use IRQ
