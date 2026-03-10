; .segment "BANK_06_s1"
; .include "copy_bank_ram.inc"
; .include "copy_bank_val.inc"
; 0x019CE8-0x019D75

; SRAM_1 (from bank_06)

; !!! bzk do not move these tables (don't edit .org as well), because
; some of them are modified via code as SRAM addresses

.org $67F0



.export ofs_bat_67F0_bank_s1_asm_import
.export _off000_bat_67F0_12
.export _off000_bat_6814_06
.export _off000_bat_681C_0C_level_text
.export _off000_bat_681C_2E
.export tbl_bat_6827_columns
.export _off000_bat_6847_52
.export _off000_bat_684F_54
.export _off000_bat_6859_56
.export _off000_bat_6865_58
.export _off000_bat_6873_5C_triforce_text



ofs_bat_67F0_bank_s1_asm_import:    ; start position of SRAM_1



_off000_bat_67F0_12:
; con_ppu_buf_12
; ram_67F0
    .dbyt $3F00 ; 
    .byte $00 + $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $0C, $1C, $2C   ; 
    .byte $0F, $12, $1C, $2C   ; 
; ram_6804_tunic_color
    .byte $0F, $29, $27, $07   ; 
; ram_6804_tunic_color + $04
    .byte $0F, $22, $27, $07   ; 
; ram_6804_tunic_color + $08
    .byte $0F, $26, $27, $07   ; 
; ram_6810
    .byte $0F, $15, $27, $30   ; 
    .byte $FF   ; end token



_off000_bat_6814_06:
; con_ppu_buf_06
; ram_6814
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
; ram_6817
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $FF   ; end token



_off000_bat_681C_0C_level_text:
; con_ppu_buf_level_text
_off000_bat_681C_2E:
; ram_681C
    .dbyt $2042 ; 
    .byte $00 + $00 + $07   ; 
; ram_6825
    .byte $15, $0E, $1F, $0E, $15, $62, $00   ; LEVEL-0
    .byte $FF   ; end token



tbl_bat_6827_columns:
; ram_6827_tbl_bat_columns
    .word _off006_0x015BE8_00
    .word _off006_0x015C1D_10
    .word _off006_0x015C4E_20
    .word _off006_0x015C90_30
    .word _off006_0x015CD4_40
    .word _off006_0x015D06_50
    .word _off006_0x015D42_60
    .word _off006_0x015D7D_70
    .word _off006_0x015DB8_80
    .word _off006_0x015DF6_90
    .word _off006_0x015E37_A0
    .word _off006_0x015E7C_B0
    .word _off006_0x015EB9_C0
    .word _off006_0x015EEF_D0
    .word _off006_0x015F31_E0
    .word _off006_0x015F65_F0



_off000_bat_6847_52:
; con_ppu_buf_52
; ram_6847
    .dbyt $2AEE ; 
    .byte $00 + $00 + $04   ; 
    .byte $ED   ; 
    .byte $E9   ; ram_684B
    .byte $EA   ; ram_684C
    .byte $EE   ; 

    .byte $FF   ; end token



_off000_bat_684F_54:
; con_ppu_buf_54
; ram_684F
    .dbyt $2B0D ; 
    .byte $00 + $00 + $06   ; 
    .byte $ED   ; 
    .byte $E9   ; ram_6853
    .byte $24   ; ram_6854
    .byte $24   ; ram_6855
    .byte $EA   ; ram_6856
    .byte $EE   ; 

    .byte $FF   ; end token



_off000_bat_6859_56:
; con_ppu_buf_56
; ram_6859
    .dbyt $2B2C ; 
    .byte $00 + $00 + $08   ; 
    .byte $ED   ; 
    .byte $E9   ; ram_685D
    .byte $24   ; ram_685E
    .byte $24   ; ram_685F
    .byte $24   ; ram_6860
    .byte $24   ; ram_6861
    .byte $EA   ; ram_6862
    .byte $EE   ; 

    .byte $FF   ; end token



_off000_bat_6865_58:
; con_ppu_buf_58
; ram_6865
    .dbyt $2B4B ; 
    .byte $00 + $00 + $0A   ; 
    .byte $ED   ; 
    .byte $E9   ; ram_6869
    .byte $24   ; ram_686A
    .byte $24   ; ram_686B
    .byte $24   ; ram_686C
    .byte $24   ; ram_686D
    .byte $24   ; ram_686E
    .byte $24   ; ram_686F
    .byte $EA   ; ram_6870
    .byte $EE   ; 

    .byte $FF   ; end token



_off000_bat_6873_5C_triforce_text:
; con_ppu_buf_triforce_text
; ram_6873
    .dbyt $2BAC ; 
    .byte $00 + $00 + $08   ; 
    .byte $1D, $1B, $12, $0F, $18, $1B, $0C, $0E   ; 
; bzk warning, no end token
; code is probably relying on 687E always being 80+
                                       ;.byte $FF   ; end token



