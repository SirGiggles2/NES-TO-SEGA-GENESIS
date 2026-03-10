; content was copied from bank_00.asm
; it's a common identical include file for banks 00-06
; should be placed at the same address in all files (currently BF50)

; that's because of MMC1 stuff, read here about this
; https://wiki.nesdev.com/w/index.php/MMC1#Control_.28internal.2C_.248000-.249FFF.29



; most of this code is currently garbage and can
; be deleted (except jumps from SRAM, see exports below)

; bzk recommended to delete all this shit and redirect SRAM
; jumps to bank_FF (see duplicates at 0x003FAB and 0x003FBF)



; assembler doesn't require these exports (for now at least) as long as
; bank_s2.asm and bank_BF50_BFFF.asm are both included in bank_01.asm

; .export sub_inc_0x003FA8_set_control_register
; .export sub_inc_0x003FBC_prg_bankswitch
; .export loc_inc_0x003FBC_prg_bankswitch



; bzk garbage
vec_inc_0x003F60_RESET:
    SEI
    CLD
    LDA #$00
    STA $2000
    LDX #$FF
    TXS
bra_BF5A_loop:
    LDA $2002
    AND #$80
    BEQ bra_BF5A_loop
bra_BF61_loop:
    LDA $2002
    AND #$80
    BEQ bra_BF61_loop
    ORA #$FF
    STA $8000
    STA $A000
    STA $C000
    STA $E000
    LDA #con_mirroring_H
    JSR sub_BF98_set_control_register
    LDA #$00
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LDA #con_prg_bank + $07
    JSR sub_BFAC_prg_bankswitch
    JMP loc_out_0x01E450



sub_BF98_set_control_register:
sub_inc_0x003FA8_set_control_register:
; bzk optimize, same code as 0x01FFA8
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    RTS



sub_BFAC_prg_bankswitch:
sub_inc_0x003FBC_prg_bankswitch:
loc_inc_0x003FBC_prg_bankswitch:
; bzk optimize, same code as 0x01FFBC
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF   ; 
