; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; Source: bank_s1.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════


; .segment "BANK_06_s1"

; .include "copy_bank_ram.inc"

; .include "copy_bank_val.inc"

; 0x019CE8-0x019D75


; SRAM_1 (from bank_06)


; !!! bzk do not move these tables (don't edit .org as well), because

; some of them are modified via code as SRAM addresses

    ; [DIRECTIVE] .ORG $67F0  -- needs manual handling  ; orig: .org $67F0



    ; [DIRECTIVE] .EXPORT ofs_bat_67F0_bank_s1_asm_import  -- needs manual handling  ; orig: .export ofs_bat_67F0_bank_s1_asm_import
    ; [DIRECTIVE] .EXPORT _off000_bat_67F0_12  -- needs manual handling  ; orig: .export _off000_bat_67F0_12
    ; [DIRECTIVE] .EXPORT _off000_bat_6814_06  -- needs manual handling  ; orig: .export _off000_bat_6814_06
    ; [DIRECTIVE] .EXPORT _off000_bat_681C_0C_level_text  -- needs manual handling  ; orig: .export _off000_bat_681C_0C_level_text
    ; [DIRECTIVE] .EXPORT _off000_bat_681C_2E  -- needs manual handling  ; orig: .export _off000_bat_681C_2E
    ; [DIRECTIVE] .EXPORT tbl_bat_6827_columns  -- needs manual handling  ; orig: .export tbl_bat_6827_columns
    ; [DIRECTIVE] .EXPORT _off000_bat_6847_52  -- needs manual handling  ; orig: .export _off000_bat_6847_52
    ; [DIRECTIVE] .EXPORT _off000_bat_684F_54  -- needs manual handling  ; orig: .export _off000_bat_684F_54
    ; [DIRECTIVE] .EXPORT _off000_bat_6859_56  -- needs manual handling  ; orig: .export _off000_bat_6859_56
    ; [DIRECTIVE] .EXPORT _off000_bat_6865_58  -- needs manual handling  ; orig: .export _off000_bat_6865_58
    ; [DIRECTIVE] .EXPORT _off000_bat_6873_5C_triforce_text  -- needs manual handling  ; orig: .export _off000_bat_6873_5C_triforce_text



ofs_bat_67F0_bank_s1_asm_import:
; start position of SRAM_1



_off000_bat_67F0_12:  ; orig: _off000_bat_67F0_12:
    DC.B $3F,$00,$20
    DC.B $0F,$30,$00,$12
    DC.B $0F,$16,$27,$36
    DC.B $0F,$0C,$1C,$2C
    DC.B $0F,$12,$1C,$2C
    DC.B $0F,$29,$27,$07
    DC.B $0F,$22,$27,$07
    DC.B $0F,$26,$27,$07
    DC.B $0F,$15,$27,$30
    DC.B $FF

; con_ppu_buf_12

; ram_67F0
    ; !! UNKNOWN: .DBYT $3F00  ; orig: - D 0 - I - 0x019CE8 06:67F0: 3F        .dbyt $3F00 ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - I - 0x019CEA 06:67F2: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $0F, $30, $00, $12  -- needs manual handling  ; orig: - D 0 - I - 0x019CEB 06:67F3: 0F        .byte $0F, $30, $00,
    ; [DIRECTIVE] .BYTE $0F, $16, $27, $36  -- needs manual handling  ; orig: - D 0 - I - 0x019CEF 06:67F7: 0F        .byte $0F, $16, $27,
    ; [DIRECTIVE] .BYTE $0F, $0C, $1C, $2C  -- needs manual handling  ; orig: - D 0 - I - 0x019CF3 06:67FB: 0F        .byte $0F, $0C, $1C,
    ; [DIRECTIVE] .BYTE $0F, $12, $1C, $2C  -- needs manual handling  ; orig: - D 0 - I - 0x019CF7 06:67FF: 0F        .byte $0F, $12, $1C,

; ram_6804_tunic_color
    ; [DIRECTIVE] .BYTE $0F, $29, $27, $07  -- needs manual handling  ; orig: - D 0 - I - 0x019CFB 06:6803: 0F        .byte $0F, $29, $27,

; ram_6804_tunic_color + $04
    ; [DIRECTIVE] .BYTE $0F, $22, $27, $07  -- needs manual handling  ; orig: - D 0 - I - 0x019CFF 06:6807: 0F        .byte $0F, $22, $27,

; ram_6804_tunic_color + $08
    ; [DIRECTIVE] .BYTE $0F, $26, $27, $07  -- needs manual handling  ; orig: - D 0 - I - 0x019D03 06:680B: 0F        .byte $0F, $26, $27,

; ram_6810
    ; [DIRECTIVE] .BYTE $0F, $15, $27, $30  -- needs manual handling  ; orig: - D 0 - I - 0x019D07 06:680F: 0F        .byte $0F, $15, $27,
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D0B 06:6813: FF        .byte $FF   ; end to



_off000_bat_6814_06:  ; orig: _off000_bat_6814_06:
    DC.B $3F,$1C,$04
    DC.B $0F,$0F,$0F,$0F
    DC.B $FF

; con_ppu_buf_06

; ram_6814
    ; !! UNKNOWN: .DBYT $3F1C  ; orig: - D 0 - I - 0x019D0C 06:6814: 3F        .dbyt $3F1C ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $04  -- needs manual handling  ; orig: - D 0 - I - 0x019D0E 06:6816: 04        .byte $00 + $00 + $0

; ram_6817
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x019D0F 06:6817: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D13 06:681B: FF        .byte $FF   ; end to



_off000_bat_681C_0C_level_text:  ; orig: _off000_bat_681C_0C_level_text:

; con_ppu_buf_level_text
_off000_bat_681C_2E:  ; orig: _off000_bat_681C_2E:
    DC.B $20,$42,$07
    DC.B $15,$0E,$1F,$0E,$15,$62,$00
    DC.B $FF

; ram_681C
    ; !! UNKNOWN: .DBYT $2042  ; orig: - D 0 - I - 0x019D14 06:681C: 20        .dbyt $2042 ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $07  -- needs manual handling  ; orig: - D 0 - I - 0x019D16 06:681E: 07        .byte $00 + $00 + $0

; ram_6825
    ; [DIRECTIVE] .BYTE $15, $0E, $1F, $0E, $15, $62, $00  -- needs manual handling  ; orig: - D 0 - I - 0x019D17 06:681F: 15        .byte $15, $0E, $1F,
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D1E 06:6826: FF        .byte $FF   ; end to



tbl_bat_6827_columns:  ; orig: tbl_bat_6827_columns:
    DC.B $D8,$9B,$0D,$9C,$3E,$9C,$80,$9C
    DC.B $C4,$9C,$F6,$9C,$32,$9D,$6D,$9D
    DC.B $A8,$9D,$E6,$9D,$27,$9E,$6C,$9E
    DC.B $A9,$9E,$DF,$9E,$21,$9F,$55,$9F

; ram_6827_tbl_bat_columns
    ; [DIRECTIVE] .WORD _off006_0x015BE8_00  -- needs manual handling  ; orig: - D 0 - I - 0x019D1F 06:6827: D8 9B     .word _off006_0x015B
    ; [DIRECTIVE] .WORD _off006_0x015C1D_10  -- needs manual handling  ; orig: - D 0 - I - 0x019D21 06:6829: 0D 9C     .word _off006_0x015C
    ; [DIRECTIVE] .WORD _off006_0x015C4E_20  -- needs manual handling  ; orig: - D 0 - I - 0x019D23 06:682B: 3E 9C     .word _off006_0x015C
    ; [DIRECTIVE] .WORD _off006_0x015C90_30  -- needs manual handling  ; orig: - D 0 - I - 0x019D25 06:682D: 80 9C     .word _off006_0x015C
    ; [DIRECTIVE] .WORD _off006_0x015CD4_40  -- needs manual handling  ; orig: - D 0 - I - 0x019D27 06:682F: C4 9C     .word _off006_0x015C
    ; [DIRECTIVE] .WORD _off006_0x015D06_50  -- needs manual handling  ; orig: - D 0 - I - 0x019D29 06:6831: F6 9C     .word _off006_0x015D
    ; [DIRECTIVE] .WORD _off006_0x015D42_60  -- needs manual handling  ; orig: - D 0 - I - 0x019D2B 06:6833: 32 9D     .word _off006_0x015D
    ; [DIRECTIVE] .WORD _off006_0x015D7D_70  -- needs manual handling  ; orig: - D 0 - I - 0x019D2D 06:6835: 6D 9D     .word _off006_0x015D
    ; [DIRECTIVE] .WORD _off006_0x015DB8_80  -- needs manual handling  ; orig: - D 0 - I - 0x019D2F 06:6837: A8 9D     .word _off006_0x015D
    ; [DIRECTIVE] .WORD _off006_0x015DF6_90  -- needs manual handling  ; orig: - D 0 - I - 0x019D31 06:6839: E6 9D     .word _off006_0x015D
    ; [DIRECTIVE] .WORD _off006_0x015E37_A0  -- needs manual handling  ; orig: - D 0 - I - 0x019D33 06:683B: 27 9E     .word _off006_0x015E
    ; [DIRECTIVE] .WORD _off006_0x015E7C_B0  -- needs manual handling  ; orig: - D 0 - I - 0x019D35 06:683D: 6C 9E     .word _off006_0x015E
    ; [DIRECTIVE] .WORD _off006_0x015EB9_C0  -- needs manual handling  ; orig: - D 0 - I - 0x019D37 06:683F: A9 9E     .word _off006_0x015E
    ; [DIRECTIVE] .WORD _off006_0x015EEF_D0  -- needs manual handling  ; orig: - D 0 - I - 0x019D39 06:6841: DF 9E     .word _off006_0x015E
    ; [DIRECTIVE] .WORD _off006_0x015F31_E0  -- needs manual handling  ; orig: - D 0 - I - 0x019D3B 06:6843: 21 9F     .word _off006_0x015F
    ; [DIRECTIVE] .WORD _off006_0x015F65_F0  -- needs manual handling  ; orig: - D 0 - I - 0x019D3D 06:6845: 55 9F     .word _off006_0x015F



_off000_bat_6847_52:  ; orig: _off000_bat_6847_52:
    DC.B $2A,$EE,$04,$ED,$E9,$EA,$EE,$FF

; con_ppu_buf_52

; ram_6847
    ; !! UNKNOWN: .DBYT $2AEE  ; orig: - D 0 - I - 0x019D3F 06:6847: 2A        .dbyt $2AEE ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $04  -- needs manual handling  ; orig: - D 0 - I - 0x019D41 06:6849: 04        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $ED  -- needs manual handling  ; orig: - D 0 - I - 0x019D42 06:684A: ED        .byte $ED   ;
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - I - 0x019D43 06:684B: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - I - 0x019D44 06:684C: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 0 - I - 0x019D45 06:684D: EE        .byte $EE   ;

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D46 06:684E: FF        .byte $FF   ; end to



_off000_bat_684F_54:  ; orig: _off000_bat_684F_54:
    DC.B $2B,$0D,$06,$ED,$E9,$24,$24,$EA,$EE,$FF

; con_ppu_buf_54

; ram_684F
    ; !! UNKNOWN: .DBYT $2B0D  ; orig: - D 0 - I - 0x019D47 06:684F: 2B        .dbyt $2B0D ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $06  -- needs manual handling  ; orig: - D 0 - I - 0x019D49 06:6851: 06        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $ED  -- needs manual handling  ; orig: - D 0 - I - 0x019D4A 06:6852: ED        .byte $ED   ;
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - I - 0x019D4B 06:6853: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D4C 06:6854: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D4D 06:6855: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - I - 0x019D4E 06:6856: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 0 - I - 0x019D4F 06:6857: EE        .byte $EE   ;

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D50 06:6858: FF        .byte $FF   ; end to



_off000_bat_6859_56:  ; orig: _off000_bat_6859_56:
    DC.B $2B,$2C,$08,$ED,$E9,$24,$24,$24,$24,$EA,$EE,$FF

; con_ppu_buf_56

; ram_6859
    ; !! UNKNOWN: .DBYT $2B2C  ; orig: - D 0 - I - 0x019D51 06:6859: 2B        .dbyt $2B2C ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $08  -- needs manual handling  ; orig: - D 0 - I - 0x019D53 06:685B: 08        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $ED  -- needs manual handling  ; orig: - D 0 - I - 0x019D54 06:685C: ED        .byte $ED   ;
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - I - 0x019D55 06:685D: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D56 06:685E: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D57 06:685F: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D58 06:6860: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D59 06:6861: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - I - 0x019D5A 06:6862: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 0 - I - 0x019D5B 06:6863: EE        .byte $EE   ;

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D5C 06:6864: FF        .byte $FF   ; end to



_off000_bat_6865_58:  ; orig: _off000_bat_6865_58:
    DC.B $2B,$4B,$0A,$ED,$E9,$24,$24,$24,$24,$24,$24,$EA,$EE,$FF

; con_ppu_buf_58

; ram_6865
    ; !! UNKNOWN: .DBYT $2B4B  ; orig: - D 0 - I - 0x019D5D 06:6865: 2B        .dbyt $2B4B ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $0A  -- needs manual handling  ; orig: - D 0 - I - 0x019D5F 06:6867: 0A        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $ED  -- needs manual handling  ; orig: - D 0 - I - 0x019D60 06:6868: ED        .byte $ED   ;
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - I - 0x019D61 06:6869: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D62 06:686A: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D63 06:686B: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D64 06:686C: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D65 06:686D: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D66 06:686E: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x019D67 06:686F: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - I - 0x019D68 06:6870: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 0 - I - 0x019D69 06:6871: EE        .byte $EE   ;

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x019D6A 06:6872: FF        .byte $FF   ; end to



_off000_bat_6873_5C_triforce_text:  ; orig: _off000_bat_6873_5C_triforce_text:
    DC.B $2B,$AC,$08,$1D,$1B,$12,$0F,$18,$1B,$0C,$0E

; con_ppu_buf_triforce_text

; ram_6873
    ; !! UNKNOWN: .DBYT $2BAC  ; orig: - D 0 - I - 0x019D6B 06:6873: 2B        .dbyt $2BAC ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $08  -- needs manual handling  ; orig: - D 0 - I - 0x019D6D 06:6875: 08        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $1D, $1B, $12, $0F, $18, $1B, $0C, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x019D6E 06:6876: 1D        .byte $1D, $1B, $12,

; bzk warning, no end token

; code is probably relying on 687E always being 80+

;.byte $FF   ; end token




; ── Translation Stats ──
; Translated:  0
; Warnings:    82
; Unknown:     8
