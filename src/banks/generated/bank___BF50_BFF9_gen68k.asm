; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; Source: bank___BF50_BFF9.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════


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
vec_inc_0x003F60_RESET:  ; orig: vec_inc_0x003F60_RESET:
    NOP                     ; SEI: NES IRQ mask must not block Genesis VBlank/NMI bridge  ; orig: - - - - - - 0x003F60 00:BF50: 78        SEI
    ; CLD (clear decimal) - 68000 has no decimal mode, NOP  ; orig: - - - - - - 0x003F61 00:BF51: D8        CLD
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x003F62 00:BF52: A9 00     LDA #$00
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: - - - - - - 0x003F64 00:BF54: 8D 00 20  STA $2000
    MOVE.B  #$FF,D1  ; orig: - - - - - - 0x003F67 00:BF57: A2 FF     LDX #$FF
    MOVE.L  D1,A7           ; TXS (approx)  ; orig: - - - - - - 0x003F69 00:BF59: 9A        TXS
bra_BF5A_loop:  ; orig: bra_BF5A_loop:
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: - - - - - - 0x003F6A 00:BF5A: AD 02 20  LDA $2002
    ANDI.B  #$80,D0  ; orig: - - - - - - 0x003F6D 00:BF5D: 29 80     AND #$80
    BEQ     bra_BF5A_loop             ; BEQ  ; orig: - - - - - - 0x003F6F 00:BF5F: F0 F9     BEQ bra_BF5A_loop
bra_BF61_loop:  ; orig: bra_BF61_loop:
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: - - - - - - 0x003F71 00:BF61: AD 02 20  LDA $2002
    ANDI.B  #$80,D0  ; orig: - - - - - - 0x003F74 00:BF64: 29 80     AND #$80
    BEQ     bra_BF61_loop             ; BEQ  ; orig: - - - - - - 0x003F76 00:BF66: F0 F9     BEQ bra_BF61_loop
    ORI.B   #$FF,D0  ; orig: - - - - - - 0x003F78 00:BF68: 09 FF     ORA #$FF
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003F7A 00:BF6A: 8D 00 80  STA $8000
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F7D 00:BF6D: 8D 00 A0  STA $A000
    MOVE.B  D0,ROM_$C000  ; orig: - - - - - - 0x003F80 00:BF70: 8D 00 C0  STA $C000
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003F83 00:BF73: 8D 00 E0  STA $E000
    MOVE.B  #con_mirroring_H,D0  ; orig: - - - - - - 0x003F86 00:BF76: A9 0F     LDA #con_mirroring_H
    BSR     sub_BF98_set_control_register             ; JSR -> BSR  ; orig: - - - - - - 0x003F88 00:BF78: 20 98 BF  JSR sub_BF98_set_con
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x003F8B 00:BF7B: A9 00     LDA #$00
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F8D 00:BF7D: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003F90 00:BF80: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F91 00:BF81: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003F94 00:BF84: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F95 00:BF85: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003F98 00:BF88: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F99 00:BF89: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003F9C 00:BF8C: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: - - - - - - 0x003F9D 00:BF8D: 8D 00 A0  STA $A000
    MOVE.B  #con_prg_bank + $07,D0  ; orig: - - - - - - 0x003FA0 00:BF90: A9 07     LDA #con_prg_bank + 
    BSR     sub_BFAC_prg_bankswitch             ; JSR -> BSR  ; orig: - - - - - - 0x003FA2 00:BF92: 20 AC BF  JSR sub_BFAC_prg_ban
    JMP     loc_out_0x01E450  ; orig: - - - - - - 0x003FA5 00:BF95: 4C 40 E4  JMP loc_out_0x01E450



sub_BF98_set_control_register:  ; orig: sub_BF98_set_control_register:
sub_inc_0x003FA8_set_control_register:  ; orig: sub_inc_0x003FA8_set_control_register:

; bzk optimize, same code as 0x01FFA8
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003FA8 00:BF98: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FAB 00:BF9B: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003FAC 00:BF9C: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FAF 00:BF9F: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003FB0 00:BFA0: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FB3 00:BFA3: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003FB4 00:BFA4: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FB7 00:BFA7: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: - - - - - - 0x003FB8 00:BFA8: 8D 00 80  STA $8000
    RTS                     ; RTS  ; orig: - - - - - - 0x003FBB 00:BFAB: 60        RTS



sub_BFAC_prg_bankswitch:  ; orig: sub_BFAC_prg_bankswitch:
sub_inc_0x003FBC_prg_bankswitch:  ; orig: sub_inc_0x003FBC_prg_bankswitch:
loc_inc_0x003FBC_prg_bankswitch:  ; orig: loc_inc_0x003FBC_prg_bankswitch:

; bzk optimize, same code as 0x01FFBC
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003FBC 00:BFAC: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FBF 00:BFAF: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003FC0 00:BFB0: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FC3 00:BFB3: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003FC4 00:BFB4: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FC7 00:BFB7: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003FC8 00:BFB8: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x003FCB 00:BFBB: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: - - - - - - 0x003FCC 00:BFBC: 8D 00 E0  STA $E000
    RTS                     ; RTS  ; orig: - - - - - - 0x003FCF 00:BFBF: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FD0 00:BFC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FD8 00:BFC8: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FE0 00:BFD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FE8 00:BFD8: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FF0 00:BFE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x003FF8 00:BFE8: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x004000 00:BFF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x004008 00:BFF8: FF        .byte $FF, $FF   ;

; ── Translation Stats ──
; Translated:  49
; Warnings:    11
; Unknown:     0