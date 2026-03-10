.segment "BANK_02"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000  ; for listing file
; 0x008010-0x00C00F



.export loc_0x008022_fill_ppu_with_tiles_1
.export loc_0x009010
.export ofs_main_script_2_0x009030_00_title_screen
.export loc_0x009E21
.export ofs_main_script_2_0x009F00_0E_register
.export ofs_main_script_2_0x009FD5_0F_elimination
.export loc_0x00A29A
.export ofs_main_script_2_0x00A5A1_01_slot_selection
.export ofs_main_script_2_0x00A6BD_0D
.export loc_0x00A910_final_credits_handler
.export ofs_main_script_2_0x00AA20_13_final_credits



tbl_8000_tiles:
    .word tbl_807F___0000_06FF
    .word tbl_877F___1000_16FF
    .word tbl_8E7F___1F20_1FFF



tbl_8006_counter:
    .dbyt $0700     ; 700 bytes
    .dbyt $0700     ; 700 bytes
    .dbyt $00E0     ;  E0 bytes



tbl_800C_ppu_ppu_addr:
    .dbyt $0000     ; 0000-06FF
    .dbyt $1000     ; 1000-16FF
    .dbyt $1F20     ; 1F20-1FFF



loc_0x008022_fill_ppu_with_tiles_1:
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA $2002
bra_8018_loop:
    LDA ram_051D
    ASL
    TAX
    LDA tbl_8000_tiles,X
    STA ram_0000_t10_tiles_data
    LDA tbl_8006_counter,X
    STA ram_0002_t13_counter_lo
    LDA tbl_800C_ppu_ppu_addr,X ; hi
    STA $2006
    INX
    LDA tbl_8000_tiles,X
    STA ram_0000_t10_tiles_data + $01
    LDA tbl_8006_counter,X
    STA ram_0003_t09_counter_hi
    LDA tbl_800C_ppu_ppu_addr,X ; lo
    JSR sub_804F_write_to_ppu
    LDA ram_051D
    CMP #$03
    BNE bra_8018_loop
    LDA #$5A
    STA ram_00F5_reset_check_5A
    LDA #$00
    STA ram_051D
    RTS



sub_804F_write_to_ppu:
    STA $2006
    LDY #$00
bra_8054_loop:
    LDA (ram_0000_t10_tiles_data),Y
    STA $2007
    LDA ram_0000_t10_tiles_data
    CLC
    ADC #< $0001
    STA ram_0000_t10_tiles_data
    LDA ram_0000_t10_tiles_data + $01
    ADC #> $0001
    STA ram_0000_t10_tiles_data + $01
    LDA ram_0003_t09_counter_hi
    SEC
    SBC #< $0001
    STA ram_0003_t09_counter_hi
    LDA ram_0002_t13_counter_lo
    SBC #> $0001
    STA ram_0002_t13_counter_lo
; bzk optimize, useless LDA
    LDA ram_0002_t13_counter_lo
    BNE bra_8054_loop
    LDA ram_0003_t09_counter_hi
    BNE bra_8054_loop
    INC ram_051D
    RTS



tbl_807F___0000_06FF:
; 0x00808F
    .incbin "incbin/chr/02___807F_877E.chr"



tbl_877F___1000_16FF:
; 0x00878F
    .incbin "incbin/chr/02___877F_8E7E.chr"



tbl_8E7F___1F20_1FFF:
; 0x008E8F
    .incbin "incbin/chr/02___8E7F_8F5E.chr"


; bzk garbage
    .byte $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



loc_0x009010:
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA ram_042B_enemy
    BNE bra_9014
    LDA ram_042B_enemy + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_94E7_00
    .word ofs_9512_01
    .word ofs_9545_02



bra_9014:
    LDA ram_042B_enemy + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_94E7_00
    .word ofs_9573_01
    .word ofs_959A_02



ofs_main_script_2_0x009030_00_title_screen:
; con_script_title_screen
    LDA ram_subscript
    BNE bra_9030
    LDA ram_0528
    BNE bra_9030
    JSR sub_90CF
    LDA ram_0011_screen_ready_flag
    BEQ bra_905C_RTS
bra_9030:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_006_903B_00_title_screen_handler
    .word ofs_006_A2A0_01_prepare_slot_select_screen_1
    .word ofs_006_905D_02_prepare_slot_select_screen_2



ofs_006_903B_00_title_screen_handler:
    LDA ram_btn_press
    AND #con_btn_Start
    BEQ bra_905C_RTS
    STA ram_00F6_reset_check_A5
    LDA #con_music_00   ; bzk seems useless
    STA ram_music
    JSR sub_bat_6EE9
    LDA #$5A
    STA ram_0528
    INC ram_subscript
    JSR sub_0x01E635_disable_rendering_and_nmi
    JSR sub_0x01E607_hide_all_sprites
    LDA #con_ppu_buf_12
    STA ram_ppu_load_index
bra_905C_RTS:
    RTS



ofs_006_905D_02_prepare_slot_select_screen_2:
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA #$00
    STA ram_current_save_slot
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    LDY #$02
bra_9069_loop:
    LDA (ram_0006_t01_data),Y    ; 6512 6513 6514
    STA ram_slot_active_flag,Y
    BNE bra_9083
    TYA
    PHA
    STY ram_current_save_slot
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    JSR sub_A35D
    LDA #$00
    STA ram_current_save_slot
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    PLA
    TAY
bra_9083:
    LDA (ram_000A_t01_data),Y    ; ram_slot_death_cnt
    STA ram_death_cnt,Y
    LDA (ram_000C_t01_data),Y    ; ram_slot_current_quest
    STA ram_current_quest,Y
    DEY
    BPL bra_9069_loop
    LDY #$18
    LDX #$00
bra_9094_loop:
loc_9094_loop:
    LDA (ram_0000_t19_data),Y    ; ram_601A + $18
    PHA
    TXA
    LSR
    BCS bra_90A7
    PLA
    AND #$F0
    STA ram_000C_t04
; / 10
    LSR
    LSR
    LSR
    LSR
    ORA ram_000C_t04
    PHA
bra_90A7:
    PLA
    STA ram_slot_hearts,X
    INY
    INX
    CPX #$06
    BEQ bra_90BC
    TXA
    LSR
    BCS bra_9094_loop
    TYA
    ADC #$26
    TAY
    JMP loc_9094_loop
bra_90BC:
    LDY #$17
bra_90BE_loop:
    LDA (ram_0004_t02_slot_name_data),Y    ; ram_save_slot_name
    STA ram_slot_name,Y
    DEY
    BPL bra_90BE_loop
    INC ram_script
    LDA #$00
    STA ram_0011_screen_ready_flag
    STA ram_subscript
    RTS



sub_90CF:
    LDA ram_042B_enemy
    BNE bra_90DE_demo_manual
    LDA ram_042B_enemy + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_007_95AC_00
    .word ofs_007_9B79_01   ; logo blackout



bra_90DE_demo_manual:
    LDA ram_042B_enemy + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_008_95C1_00   ; demo begins to load and scroll down
    .word ofs_008_95EC_01   ; "legend of zelda" screen loads completely, pause
    .word ofs_008_960C_02   ; scrolling down manual
    .word ofs_008_9830_03   ; pause at "read the manual"
    .word ofs_008_983C_04   ; back to logo



tbl_90EE_spr_data:
;                                              +-------------------- spr_Y
;                                              |    +--------------- spr_T
;                                              |    |    +---------- spr_A
;                                              |    |    |    +----- spr_X
;                                              |    |    |    |
    .byte $77, $CA, $C2, $D0   ; 
    .byte $77, $CC, $C2, $C8   ; 
    .byte $77, $CA, $82, $28   ; 
    .byte $77, $CC, $82, $30   ; 
    .byte $27, $CA, $42, $D0   ; 
    .byte $27, $CC, $42, $C8   ; 
    .byte $27, $CA, $02, $28   ; 
    .byte $27, $CC, $02, $30   ; 
    .byte $57, $CE, $02, $74   ; 
    .byte $57, $D0, $02, $7C   ; 
    .byte $31, $D2, $02, $57   ; 
    .byte $4F, $D2, $02, $CC   ; 
    .byte $67, $D2, $02, $7B   ; 
    .byte $83, $D2, $02, $50   ; 
    .byte $31, $D4, $02, $5F   ; 
    .byte $3F, $D4, $02, $24   ; 
    .byte $41, $D4, $02, $64   ; 
    .byte $7B, $D4, $02, $90   ; 
    .byte $27, $D6, $02, $50   ; 
    .byte $2B, $D6, $02, $A0   ; 
    .byte $4F, $D6, $02, $2C   ; 
    .byte $7B, $D6, $02, $BC   ; 
    .byte $67, $A0, $03, $60   ; 
    .byte $67, $A0, $03, $68   ; 
    .byte $67, $A0, $03, $70   ; 
    .byte $67, $A0, $03, $78   ; 
    .byte $67, $A0, $03, $80   ; 
    .byte $67, $A0, $03, $88   ; 



tbl_915E:
;                                              +----------------- 
;                                              |     +----------- 
;                                              |     |     +----- 
;                                              |     |     |
    .byte $80 + $00 + $00   ; 00 
    .byte $00 + $00 + $00   ; 01 
    .byte $00 + $00 + $00   ; 02 
    .byte $00 + $00 + $00   ; 03 
    .byte $00 + $00 + $00   ; 04 
    .byte $00 + $00 + $00   ; 05 
    .byte $00 + $00 + $00   ; 06 
    .byte $00 + $00 + $00   ; 07 
    .byte $00 + $40 + $00   ; 08 
    .byte $80 + $00 + $00   ; 09 
    .byte $80 + $00 + $00   ; 0A 
    .byte $00 + $00 + $00   ; 0B 
    .byte $00 + $40 + $20   ; 0C 
    .byte $00 + $00 + $00   ; 0D 
    .byte $00 + $00 + $00   ; 0E 
    .byte $00 + $00 + $00   ; 0F 
    .byte $00 + $40 + $00   ; 10 
    .byte $80 + $00 + $00   ; 11 
    .byte $00 + $00 + $00   ; 12 
    .byte $00 + $00 + $00   ; 13 
    .byte $00 + $40 + $20   ; 14 
    .byte $00 + $00 + $00   ; 15 
    .byte $00 + $00 + $00   ; 16 
    .byte $00 + $00 + $00   ; 17 
    .byte $00 + $00 + $00   ; 18 
    .byte $80 + $40 + $00   ; 19 
    .byte $00 + $00 + $00   ; 1A 
    .byte $00 + $00 + $00   ; 1B 
    .byte $00 + $40 + $20   ; 1C 
    .byte $00 + $00 + $00   ; 1D 
    .byte $00 + $40 + $00   ; 1E 
    .byte $00 + $00 + $00   ; 1F 
    .byte $00 + $00 + $00   ; 20 
    .byte $80 + $40 + $00   ; 21 
    .byte $00 + $00 + $00   ; 22 
    .byte $00 + $00 + $00   ; 23 
    .byte $00 + $00 + $20   ; 24 
    .byte $00 + $00 + $00   ; 25 
    .byte $00 + $40 + $00   ; 26 
    .byte $00 + $00 + $00   ; 27 
    .byte $00 + $00 + $00   ; 28 
    .byte $80 + $40 + $00   ; 29 
    .byte $00 + $00 + $00   ; 2A 
    .byte $00 + $00 + $00   ; 2B 
    .byte $00 + $00 + $20   ; 2C 
    .byte $00 + $00 + $00   ; 2D 
    .byte $00 + $40 + $00   ; 2E 
    .byte $00 + $00 + $00   ; 2F 
    .byte $00 + $40 + $00   ; 30 
    .byte $80 + $00 + $00   ; 31 
    .byte $80 + $00 + $00   ; 32 
    .byte $00 + $00 + $00   ; 33 
    .byte $00 + $00 + $20   ; 34 
    .byte $00 + $00 + $00   ; 35 
    .byte $00 + $40 + $00   ; 36 
    .byte $00 + $00 + $00   ; 37 
    .byte $00 + $40 + $00   ; 38 
    .byte $80 + $00 + $00   ; 39 
    .byte $80 + $00 + $00   ; 3A 
    .byte $00 + $00 + $00   ; 3B 
    .byte $00 + $40 + $20   ; 3C 
    .byte $00 + $00 + $00   ; 3D 
    .byte $00 + $00 + $00   ; 3E 
    .byte $00 + $00 + $00   ; 3F 
    .byte $00 + $40 + $00   ; 40 
    .byte $80 + $00 + $00   ; 41 
    .byte $80 + $00 + $00   ; 42 
    .byte $00 + $00 + $00   ; 43 
    .byte $00 + $40 + $20   ; 44 
    .byte $00 + $00 + $00   ; 45 
    .byte $00 + $00 + $00   ; 46 
    .byte $00 + $00 + $00   ; 47 
    .byte $00 + $40 + $00   ; 48 
    .byte $80 + $00 + $00   ; 49 
    .byte $00 + $00 + $00   ; 4A 
    .byte $00 + $00 + $00   ; 4B 
    .byte $00 + $40 + $20   ; 4C 
    .byte $00 + $00 + $00   ; 4D 
    .byte $00 + $00 + $00   ; 4E 
    .byte $00 + $00 + $00   ; 4F 
    .byte $00 + $40 + $00   ; 50 
    .byte $80 + $00 + $00   ; 51 
    .byte $80 + $00 + $00   ; 52 
    .byte $00 + $00 + $00   ; 53 
    .byte $00 + $40 + $20   ; 54 
    .byte $00 + $00 + $00   ; 55 
    .byte $00 + $00 + $00   ; 56 
    .byte $00 + $00 + $00   ; 57 
    .byte $00 + $40 + $00   ; 58 
    .byte $80 + $40 + $00   ; 59 
    .byte $80 + $00 + $00   ; 5A 
    .byte $00 + $00 + $00   ; 5B 
    .byte $00 + $00 + $20   ; 5C 
    .byte $00 + $00 + $00   ; 5D 
    .byte $00 + $40 + $00   ; 5E 
    .byte $00 + $00 + $00   ; 5F 
    .byte $00 + $40 + $00   ; 60 
    .byte $80 + $00 + $00   ; 61 
    .byte $80 + $00 + $00   ; 62 
    .byte $00 + $00 + $00   ; 63 
    .byte $00 + $00 + $20   ; 64 
    .byte $00 + $00 + $00   ; 65 
    .byte $00 + $40 + $00   ; 66 
    .byte $00 + $00 + $00   ; 67 
    .byte $00 + $40 + $00   ; 68 
    .byte $80 + $00 + $00   ; 69 
    .byte $80 + $00 + $00   ; 6A 
    .byte $00 + $00 + $00   ; 6B 
    .byte $00 + $00 + $20   ; 6C 
    .byte $00 + $00 + $00   ; 6D 
    .byte $00 + $40 + $00   ; 6E 
    .byte $00 + $00 + $00   ; 6F 
    .byte $00 + $40 + $00   ; 70 
    .byte $80 + $00 + $00   ; 71 
    .byte $00 + $00 + $00   ; 72 
    .byte $00 + $00 + $00   ; 73 
    .byte $00 + $00 + $20   ; 74 
    .byte $00 + $00 + $00   ; 75 
    .byte $00 + $40 + $00   ; 76 
    .byte $00 + $00 + $00   ; 77 
    .byte $00 + $40 + $00   ; 78 
    .byte $80 + $00 + $00   ; 79 
    .byte $80 + $00 + $00   ; 7A 
    .byte $00 + $00 + $00   ; 7B 
    .byte $00 + $40 + $20   ; 7C 
    .byte $00 + $00 + $00   ; 7D 
    .byte $00 + $00 + $00   ; 7E 
    .byte $00 + $00 + $00   ; 7F 
    .byte $00 + $40 + $00   ; 80 
    .byte $80 + $00 + $00   ; 81 
    .byte $80 + $00 + $00   ; 82 
    .byte $00 + $00 + $00   ; 83 
    .byte $00 + $40 + $20   ; 84 
    .byte $00 + $00 + $00   ; 85 
    .byte $00 + $00 + $00   ; 86 
    .byte $00 + $00 + $00   ; 87 
    .byte $00 + $00 + $00   ; 88 
    .byte $80 + $40 + $00   ; 89 
    .byte $00 + $00 + $00   ; 8A 
    .byte $00 + $00 + $00   ; 8B 
    .byte $00 + $40 + $20   ; 8C 
    .byte $00 + $00 + $00   ; 8D 
    .byte $00 + $00 + $00   ; 8E 
    .byte $00 + $00 + $00   ; 8F 
    .byte $00 + $40 + $00   ; 90 
    .byte $00 + $00 + $00   ; 91 
    .byte $80 + $40 + $00   ; 92 
    .byte $00 + $00 + $00   ; 93 
    .byte $00 + $00 + $00   ; 94 
    .byte $00 + $00 + $20   ; 95 
    .byte $00 + $40 + $00   ; 96 
    .byte $00 + $00 + $00   ; 97 
    .byte $00 + $00 + $00   ; 98 
    .byte $00 + $00 + $00   ; 99 
    .byte $00 + $40 + $00   ; 9A 
    .byte $00 + $00 + $00   ; 9B 
    .byte $00 + $00 + $00   ; 9C 
    .byte $00 + $00 + $00   ; 9D 
    .byte $00 + $00 + $00   ; 9E 
    .byte $00 + $00 + $20   ; 9F 
    .byte $00 + $00 + $00   ; A0 
    .byte $00 + $00 + $20   ; A1 
    .byte $00 + $00 + $00   ; A2 
    .byte $00 + $00 + $20   ; A3 
    .byte $00 + $00 + $00   ; A4 
    .byte $00 + $00 + $20   ; A5 
    .byte $00 + $00 + $00   ; A6 
    .byte $00 + $00 + $00   ; A7 
    .byte $00 + $00 + $00   ; A8 
    .byte $00 + $00 + $00   ; A9 
    .byte $00 + $00 + $00   ; AA 
    .byte $00 + $00 + $00   ; AB 
    .byte $00 + $00 + $00   ; AC 
    .byte $00 + $00 + $00   ; AD 
    .byte $00 + $00 + $00   ; AE 


; bzk garbage
    .byte $00, $00, $00   ; 
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 



tbl_9240:
    .byte $22   ; 00 
    .byte $23   ; 01 
    .byte $18   ; 02 
    .byte $1F   ; 03 
    .byte $15   ; 04 
    .byte $01   ; 05 
    .byte $03   ; 06 
    .byte $1D   ; 07 
    .byte $00   ; 08 
    .byte $08   ; 09 
    .byte $06   ; 0A 
    .byte $12   ; 0B 
    .byte $14   ; 0C 
    .byte $0C   ; 0D 
    .byte $10   ; 0E 
    .byte $19   ; 0F 
    .byte $17   ; 10 
    .byte $1B   ; 11 
    .byte $30   ; 12 
    .byte $31   ; 13 
    .byte $32   ; 14 
    .byte $33   ; 15 



tbl_9256:
    .byte $1A   ; 00 
    .byte $21   ; 01 
    .byte $0F   ; 02 
    .byte $20   ; 03 
    .byte $04   ; 04 
    .byte $02   ; 05 
    .byte $1C   ; 06 
    .byte $1E   ; 07 
    .byte $0A   ; 08 
    .byte $09   ; 09 
    .byte $07   ; 0A 
    .byte $13   ; 0B 
    .byte $05   ; 0C 
    .byte $0D   ; 0D 
    .byte $11   ; 0E 
    .byte $0B   ; 0F 
    .byte $16   ; 10 
    .byte $1B   ; 11 



tbl_9268_pos_X_44:     ; bzk optimize, LDA #$44
    .byte $44   ; 



tbl_9269_pos_X_AC:     ; bzk optimize, LDA #$AC
    .byte $AC   ; 



tbl_926A_spr_T:
    .byte $E0, $E2, $EC, $EE, $F8, $FA   ; 00 
    .byte $E4, $E6, $F0, $F2, $FC, $FE   ; 01 
    .byte $E8, $EA, $F4, $F6, $DC, $DE   ; 02 
    .byte $00, $00, $78, $78, $00, $00   ; 03 



tbl_9282_spr_A:
    .byte $00, $00, $00, $00, $00, $00   ; 00 
    .byte $00, $00, $00, $00, $00, $00   ; 01 
    .byte $00, $00, $00, $00, $00, $00   ; 02 
    .byte $00, $00, $00, $40, $00, $00   ; 03 



_off002_929A_00_all_of_treasures:
    .byte $00   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $0A, $15, $15, $24, $18, $0F, $24, $1D   ; 
    .byte $1B, $0E, $0A, $1C, $1E, $1B, $0E, $1C, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5   ; 

    .byte $FF   ; end token



_off002_92BC_01_heart___container:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $11, $0E, $0A, $1B, $1D, $24, $24, $24, $24   ; 
    .byte $24, $0C, $18, $17, $1D, $0A, $12, $17, $0E, $1B   ; 

    .byte $FF   ; end token



_off002_92D1_02_heart:
    .byte $14   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $11, $0E, $0A, $1B, $1D   ; 

    .byte $FF   ; end token



_off002_92D8_03_fairy___clock:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $0F, $0A, $12, $1B, $22, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $0C, $15, $18, $0C, $14   ; 

    .byte $FF   ; end token



_off002_92EC_04_rupy___5_rupies:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $1B, $1E, $19, $22, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $05, $24, $1B, $1E, $19, $12, $0E, $1C   ; 

    .byte $FF   ; end token



_off002_9301_07_sword___white:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $1C, $20, $18, $1B, $0D, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $20, $11, $12, $1D, $0E   ; 

    .byte $FF   ; end token



_off002_9315_08_sword:
    .byte $14   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $1C, $20, $18, $1B, $0D   ; 

    .byte $FF   ; end token



_off002_931C_09_magical___magical:
    .byte $06   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                               $16, $0A, $10, $12, $0C, $0A, $15, $24, $24, $24   ; 
    .byte $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15   ; 

    .byte $FF   ; end token



_off002_9332_0A_sword_shield:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $1C, $20, $18, $1B, $0D, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $1C, $11, $12, $0E, $15, $0D   ; 

    .byte $FF   ; end token



_off002_9347_0B_boomerang___magical:
    .byte $05   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0B, $18, $18, $16, $0E, $1B, $0A, $17, $10, $24, $24   ; 
    .byte $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15   ; 

    .byte $FF   ; end token



_off002_935E_0C_boomerang:
    .byte $12   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte           $0B, $18, $18, $16, $0E, $1B, $0A, $17, $10   ; 

    .byte $FF   ; end token



_off002_9369_0D_bomb___bow:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $0B, $18, $16, $0B, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $0B, $18, $20   ; 

    .byte $FF   ; end token



_off002_937C_0E_arrow___silver:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $0A, $1B, $1B, $18, $20, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $1C, $12, $15, $1F, $0E, $1B   ; 

    .byte $FF   ; end token



_off002_9391_0F_arrow:
    .byte $14   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $0A, $1B, $1B, $18, $20   ; 

    .byte $FF   ; end token



_off002_9398_10_blue___red:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $0B, $15, $1E, $0E, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $1B, $0E, $0D   ; 

    .byte $FF   ; end token



_off002_93AB_11_candle___candle:
    .byte $06   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                               $0C, $0A, $17, $0D, $15, $0E, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $0C, $0A, $17, $0D, $15, $0E   ; 

    .byte $FF   ; end token



_off002_93C1_12_blue___red:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $0B, $15, $1E, $0E, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $1B, $0E, $0D   ; 

    .byte $FF   ; end token



_off002_93D4_13_ring___ring:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $1B, $12, $17, $10, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $1B, $12, $17, $10   ; 

    .byte $FF   ; end token



_off002_93E8_14_power___recorder:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $19, $18, $20, $0E, $1B, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $1B, $0E, $0C, $18, $1B, $0D, $0E, $1B   ; 

    .byte $FF   ; end token



_off002_93FE_15_bracelet:
    .byte $05   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0B, $1B, $0A, $0C, $0E, $15, $0E, $1D   ; 

    .byte $FF   ; end token



_off002_9408_16_raft___stepladder:
    .byte $07   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                    $1B, $0A, $0F, $1D, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $1C, $1D, $0E, $19, $15, $0A, $0D, $0D, $0E, $1B   ; 

    .byte $FF   ; end token



_off002_941F_17_magical___book_of:
    .byte $06   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                               $16, $0A, $10, $12, $0C, $0A, $15, $24, $24, $24   ; 
    .byte $24, $24, $24, $0B, $18, $18, $14, $24, $18, $0F   ; 

    .byte $FF   ; end token



_off002_9435_18_rod___magic:
    .byte $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                         $1B, $18, $0D, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $16, $0A, $10, $12, $0C   ; 

    .byte $FF   ; end token



_off002_9448_19_key___magical:
    .byte $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                         $14, $0E, $22, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15   ; 

    .byte $FF   ; end token



_off002_945C_1A_key:
    .byte $15   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $14, $0E, $22   ; 

    .byte $FF   ; end token



_off002_9461_1B_map___compass:
    .byte $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                         $16, $0A, $19, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $0C, $18, $16, $19, $0A, $1C, $1C   ; 

    .byte $FF   ; end token



_off002_9475_1C_triforce:
    .byte $0C   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                             $1D, $1B, $12, $0F   ; 
    .byte $18, $1B, $0C, $0E   ; 

    .byte $FF   ; end token



_off002_947F_05_life_potion___2nd_potion:
    .byte $04   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $15, $12, $0F, $0E, $24, $19, $18, $1D, $12, $18, $17, $24   ; 
    .byte $24, $24, $02, $17, $0D, $24, $19, $18, $1D, $12, $18, $17   ; 

    .byte $FF   ; end token



_off002_9499_06_letter___food:
    .byte $06   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                               $15, $0E, $1D, $1D, $0E, $1B, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $0F, $18, $18, $0D   ; 

    .byte $FF   ; end token



tbl_94AD_demo_manual_text:
    .word _off002_929A_00_all_of_treasures
    .word _off002_92BC_01_heart___container
    .word _off002_92D1_02_heart
    .word _off002_92D8_03_fairy___clock
    .word _off002_92EC_04_rupy___5_rupies
    .word _off002_947F_05_life_potion___2nd_potion
    .word _off002_9499_06_letter___food
    .word _off002_9301_07_sword___white
    .word _off002_9315_08_sword
    .word _off002_931C_09_magical___magical
    .word _off002_9332_0A_sword_shield
    .word _off002_9347_0B_boomerang___magical
    .word _off002_935E_0C_boomerang
    .word _off002_9369_0D_bomb___bow
    .word _off002_937C_0E_arrow___silver
    .word _off002_9391_0F_arrow
    .word _off002_9398_10_blue___red
    .word _off002_93AB_11_candle___candle
    .word _off002_93C1_12_blue___red
    .word _off002_93D4_13_ring___ring
    .word _off002_93E8_14_power___recorder
    .word _off002_93FE_15_bracelet
    .word _off002_9408_16_raft___stepladder
    .word _off002_941F_17_magical___book_of
    .word _off002_9435_18_rod___magic
    .word _off002_9448_19_key___magical
    .word _off002_945C_1A_key
    .word _off002_9461_1B_map___compass
    .word _off002_9475_1C_triforce



ofs_94E7_00:
    JSR sub_0x01E47D_clear_screen
loc_94EA:
    INC ram_042B_enemy + $01
    RTS



tbl_94EE_logo_palette:
    .dbyt $3F00 ; ppu address
    .byte $00 + $00 + $20   ; counter

    .byte $36, $0F, $00, $10   ; 
    .byte $36, $17, $27, $0F   ; 
    .byte $36, $08, $1A, $28   ; 
    .byte $36, $30, $3B, $22   ; 

    .byte $36, $30, $3B, $16   ; 
    .byte $36, $17, $27, $0F   ; 
    .byte $36, $08, $1A, $28   ; 
    .byte $36, $30, $3B, $22   ; 

    .byte $FF   ; end token



ofs_9512_01:
    LDX #$23
    STX ram_0300_useless
    STX ram_0301_buffer_index
bra_951A_loop:
    LDA tbl_94EE_logo_palette,X
    STA ram_0302_ppu_buffer,X
    DEX
    BPL bra_951A_loop
    LDX #$0A
    LDA #$00
    STA ram_042B_enemy + $02
    STA ram_042B_enemy + $03
bra_952D_loop:
    STA ram_0412,X
    STA ram_041F,X
    STA ram_0437_enemy,X
    DEX
    BPL bra_952D_loop
    LDX #$0A
bra_953B_loop:
    LDA #$FF
    STA ram_state_obj,X
    DEX
    BNE bra_953B_loop
    JMP loc_94EA



ofs_9545_02:
    LDA #con_music_title
    STA ram_music
    LDA #con_ppu_buf_title_screen
    JMP loc_95A2



tbl_954F_demo_manual_palette:
    .dbyt $3F00 ; 
    .byte $00 + $00 + $20   ; counter

    .byte $0F, $30, $30, $30   ; 
    .byte $0F, $21, $30, $30   ; 
    .byte $0F, $16, $30, $30   ; 
    .byte $0F, $29, $1A, $09   ; 

    .byte $0F, $29, $37, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0B, $1B, $2B   ; 

    .byte $FF   ; end token



ofs_9573_01:
    LDX #$23
    STX ram_0300_useless
    STX ram_0301_buffer_index
bra_957B_loop:
    LDA tbl_954F_demo_manual_palette,X
    STA ram_0302_ppu_buffer,X
    DEX
    BPL bra_957B_loop
    LDX #$0A
    LDA #$00
bra_9588_loop:
    STA ram_0412,X
    STA ram_041F,X
    STA ram_0437_enemy,X
    STA ram_0444_enemy,X
    DEX
    BPL bra_9588_loop
    JMP loc_94EA



ofs_959A_02:
    INC ram_005C
    LDA #$10
    STA ram_scroll_Y
    LDA #con_ppu_buf_guide
loc_95A2:
    STA ram_ppu_load_index
    LDA #$00
    STA ram_042B_enemy + $01
    INC ram_0011_screen_ready_flag
    RTS



ofs_007_95AC_00:
    LDA ram_frm_cnt
    AND #$01
    BEQ bra_95BD
    INC ram_041A
    LDA ram_041A
    BNE bra_95BD
    JMP loc_94EA
bra_95BD:
; bzk optimize, JMP
    JSR sub_986B
    RTS



ofs_008_95C1_00:
    LDA ram_frm_cnt
    AND #$01
    BEQ bra_95D8
    INC ram_scroll_Y
    LDA ram_scroll_Y
    CMP #$F0
    BNE bra_95D8
    INC ram_0415
    LDA #$00
    STA ram_scroll_Y
    INC ram_005C
bra_95D8:
    LDA ram_scroll_Y
    CMP #$08
    BNE bra_95EB_RTS
    LDA ram_0415
    BEQ bra_95EB_RTS
    LDA #$00
    STA ram_0415
    INC ram_042B_enemy + $01
bra_95EB_RTS:
    RTS



ofs_008_95EC_01:
; triggers during manual
    INC ram_041A
    LDA ram_041A
    BNE bra_95F7
    INC ram_042B_enemy + $01
bra_95F7:
    LDA #$29
    STA ram_041D
    LDA #$00
    STA ram_041C
    LDA #$2B
    STA ram_0418
    LDA #$E0
    STA ram_0417
    RTS



ofs_008_960C_02:
    JSR sub_0x01E607_hide_all_sprites
    JSR sub_972A
    JSR sub_979D
    LDA ram_frm_cnt
    AND #$01
    BEQ bra_963E_RTS
    LDX #$0A
bra_961D_loop:
    DEC ram_pos_Y_enemy,X
    DEX
    BNE bra_961D_loop
    INC ram_041B
    LDA ram_041B
    BNE bra_962D
    INC ram_0415
bra_962D:
    LDA ram_0415
    CMP #$05
    BNE bra_963F
    LDA ram_041B
    CMP #$80
    BNE bra_963F
    INC ram_042B_enemy + $01
bra_963E_RTS:
    RTS
bra_963F:
    INC ram_scroll_Y
    LDA ram_scroll_Y
    CMP #$F0
    BNE bra_964D
    INC ram_005C
    LDA #$00
    STA ram_scroll_Y
bra_964D:
    LDA ram_041B
    AND #$07
    BNE bra_963E_RTS
    JSR sub_973A
    LDX #$20
    LDA #$FF
    STA ram_0302_ppu_buffer + $03,X
    DEX ; 1F
bra_965F_loop:
    LDA #$24
    STA ram_0302_ppu_buffer + $03,X
    DEX
    BPL bra_965F_loop
    LDA #$20
    STA ram_0302_ppu_buffer + $02
    LDA ram_041D
    STA ram_0302_ppu_buffer
    LDA ram_041C
    STA ram_0302_ppu_buffer + $01
    CLC
    ADC #$20
    STA ram_041C
    BNE bra_9686
    INC ram_041D
    JMP loc_96A7
bra_9686:
    CMP #$C0
    BNE bra_96A7
    LDA ram_041D
    CMP #$2B
    BNE bra_9699
    LDA #$20
    STA ram_041D
    JMP loc_96A2
bra_9699:
    CMP #$23
    BNE bra_96A7
    LDA #$28
    STA ram_041D
loc_96A2:
    LDA #$00
    STA ram_041C
bra_96A7:
loc_96A7:
    LDX ram_0419
    LDA tbl_915E,X
    AND #$80
    BEQ bra_96D6
    LDA ram_042B_enemy + $02
    ASL
    TAX
    LDY #$00
    LDA tbl_94AD_demo_manual_text,X
    STA ram_0000_t17_demo_manual_text_data
    LDA tbl_94AD_demo_manual_text + $01,X
    STA ram_0000_t17_demo_manual_text_data + $01
    LDA (ram_0000_t17_demo_manual_text_data),Y
    TAX
loc_96C5_loop:
    INY
    LDA (ram_0000_t17_demo_manual_text_data),Y
    CMP #$FF
    BEQ bra_96D3_FF
    STA ram_0302_ppu_buffer + $03,X
    INX
    JMP loc_96C5_loop
bra_96D3_FF:
    INC ram_042B_enemy + $02
bra_96D6:
    JSR sub_96DD
    INC ram_0419
    RTS



sub_96DD:
    LDX ram_0419
    LDA tbl_915E,X
    AND #$40
    BEQ bra_9729_RTS
    LDA ram_0418
    STA ram_0302_ppu_buffer + $23
    LDA ram_0417
    STA ram_0302_ppu_buffer + $24
    LDA #$48
    STA ram_0302_ppu_buffer + $25
    LDA #$00
    STA ram_0302_ppu_buffer + $26
    LDA #$FF
    STA ram_0302_ppu_buffer + $27
    INC ram_0416
    LDA ram_0417
    CLC
    ADC #$08
    STA ram_0417
    BNE bra_9729_RTS
    LDA ram_0418
    CMP #$23
    BNE bra_971F
    LDA #$2B
    STA ram_0418
    JMP loc_9724
bra_971F:
    LDA #$23
    STA ram_0418
loc_9724:
    LDA #$C0
    STA ram_0417
bra_9729_RTS:
    RTS



sub_972A:
    LDX #$0A
bra_972C_loop:
    LDA ram_pos_Y_enemy,X
    CMP #$F0
    BNE bra_9736
    LDA #$FF
    STA ram_state_obj,X
bra_9736:
    DEX
    BNE bra_972C_loop
    RTS



sub_973A:
    LDY ram_0419
    LDA tbl_915E,Y
    AND #$20
    BNE bra_9745
    RTS
bra_9745:
    LDX #$0A
loc_9747_loop:
    LDA ram_state_obj,X
    BNE bra_974F
    DEX
    JMP loc_9747_loop
bra_974F:
    LDY ram_042B_enemy + $03
    LDA tbl_9240,Y
    STA ram_0444_enemy,X
    LDA #$EF
    STA ram_pos_Y_enemy,X
    LDA tbl_9268_pos_X_44
    STA ram_pos_X_enemy,X
    LDA #$00
    STA ram_state_obj,X
    LDA ram_0444_enemy,X
    CMP #$30
    BCS bra_9796
    DEX
    LDA tbl_9256,Y
    STA ram_0444_enemy,X
    LDA #$EF
    STA ram_pos_Y_enemy,X
    LDA tbl_9269_pos_X_AC
    STA ram_pos_X_enemy,X
    LDA #$00
    STA ram_state_obj,X
    LDA tbl_9240,Y
    CMP #$1B
    BNE bra_9792
    LDA #$78
    STA ram_pos_X_enemy,X
    STA ram_pos_X_enemy + $01,X
    LDA #$00
    STA ram_042B_enemy + $04
bra_9792:
loc_9792:
    INC ram_042B_enemy + $03
    RTS
bra_9796:
    LDA #$68
    STA ram_pos_X_enemy,X
    JMP loc_9792



sub_979D:
    LDX #$0A
bra_979F_loop:
    LDA ram_state_obj,X
    BNE bra_97C1
    TXA
    PHA
    LDA ram_0444_enemy,X
    CMP #$23
    BNE bra_97B2
    JSR sub_97D8
    JMP loc_97BF
bra_97B2:
    CMP #$30
    BCS bra_97BC
    JSR sub_0x01E71E
    JMP loc_97BF
bra_97BC:
    JSR sub_97EA
loc_97BF:
    PLA
    TAX
bra_97C1:
    DEX
    BNE bra_979F_loop
    RTS


; bzk garbage
    LDX #$04
    CMP #$14
    BNE bra_97CD
    LDX #$0C
bra_97CD:
bra_97CD_loop:
    DEC ram_spr_Y + $50,X
    TAX
    SEC
    SBC #$04
    TAX
    BPL bra_97CD_loop
    RTS



sub_97D8:
    JSR sub_0x01FAA3
    JSR sub_bat_7986
    ASL
    AND ram_frm_cnt
; / 04
    LSR
    LSR
    STA ram_000C_t06_table_offset
    LDY #$14
    JMP loc_bat_7915



sub_97EA:
    LDA ram_0444_enemy,X
    AND #$0F
; * 06
    ASL
    STA ram_0000_t45
    ASL
; bzk optimize, value is too low, no need for CLC after ASL
    CLC
    ADC ram_0000_t45
    TAY
    LDA ram_pos_Y_enemy,X
    STA ram_0000_t46_spr_Y
    LDA ram_pos_X_enemy,X
    STA ram_0001_t12_spr_X
    LDA #$05
    STA ram_0002_t16_sprites_counter
    TYA
; * 04
    ASL
    ASL
    TAX
bra_9807_loop:
    LDA tbl_926A_spr_T,Y
    BEQ bra_9823_skip
    STA ram_spr_T,X
    LDA ram_0000_t46_spr_Y
    STA ram_spr_Y,X
    LDA tbl_9282_spr_A,Y
    STA ram_spr_A,X
    LDA ram_0001_t12_spr_X
    STA ram_spr_X,X
    INX
    INX
    INX
    INX
bra_9823_skip:
    LDA ram_0001_t12_spr_X
    CLC
    ADC #$08
    STA ram_0001_t12_spr_X
    INY
    DEC ram_0002_t16_sprites_counter
    BPL bra_9807_loop
    RTS



ofs_008_9830_03:
    INC ram_041A
    LDA ram_041A
    BNE bra_9854
    INC ram_042B_enemy + $01
    RTS



ofs_008_983C_04:
    INC ram_041A
    LDA ram_041A
    CMP #$39
    BNE bra_9854
    LDA #$00
    STA ram_0011_screen_ready_flag
    STA ram_041A
    STA ram_042B_enemy
    STA ram_042B_enemy + $01
    RTS
bra_9854:
    JSR sub_0x01E607_hide_all_sprites
; bzk optimize, JMP
    JSR sub_979D
    RTS



tbl_985B:
    .byte $3F   ; 00 
    .byte $04   ; 01 
    .byte $04   ; 02 
    .byte $36   ; 03 
    .byte $17   ; 04 
    .byte $27   ; 05 
    .byte $0F   ; 06 
    .byte $FF   ; 07 



tbl_9863:
    .byte $27   ; 00 
    .byte $37   ; 01 
    .byte $37   ; 02 
    .byte $27   ; 03 
    .byte $17   ; 04 
    .byte $07   ; 05 
    .byte $07   ; 06 
    .byte $17   ; 07 



sub_986B:
    LDY #$70
bra_986D_loop:
    LDA tbl_90EE_spr_data - $01,Y
    STA ram_spr_Y - $01,Y
    DEY
    BNE bra_986D_loop
    JSR sub_98C3
    LDA ram_0412
    BNE bra_98AB
    LDY #$07
bra_9880_loop:
    LDA tbl_985B,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_9880_loop
    LDY ram_0413
    LDA tbl_9863,Y
    STA ram_0302_ppu_buffer + $05
    LDA #$06
    STA ram_0412
    INC ram_0413
    LDA ram_0413
    CMP #$08
    BNE bra_98AB
    LDA #$10
    STA ram_0412
    LDA #$00
    STA ram_0413
bra_98AB:
    DEC ram_0412
    RTS



tbl_98AF_spr_T:
    .byte $B2   ; 00 
    .byte $B4   ; 01 
    .byte $B6   ; 02 
    .byte $B8   ; 03 



tbl_98B3_spr_T:
    .byte $A2   ; 00 
    .byte $A4   ; 01 
    .byte $A6   ; 02 
    .byte $A8   ; 03 



tbl_98B7_spr_X:
    .byte $50   ; 00 
    .byte $58   ; 01 
    .byte $60   ; 02 
    .byte $68   ; 03 



tbl_98BB_offset:
; added to spr address
    .byte $70   ; 00 
    .byte $80   ; 01 
    .byte $90   ; 02 
    .byte $A0   ; 03 
    .byte $B0   ; 04 
    .byte $C0   ; 05 
    .byte $D0   ; 06 
    .byte $E0   ; 07 



sub_98C3:
    LDA ram_041F
    BNE bra_98E9
    LDA #$B6
    STA ram_0420
    LDA #$C8
    STA ram_0421
    LDA #$D8
    STA ram_0422
    LDA #$C0
    STA ram_0423
    LDA #$D0
    STA ram_0424
    LDA #$DD
    STA ram_0425
    INC ram_041F
bra_98E9:
    LDX #$02
bra_98EB_loop:
    JSR sub_98F5
    DEX
    BPL bra_98EB_loop
; bzk optimize, JMP
    JSR sub_9943
    RTS



sub_98F5:
    INC ram_0420,X
    INC ram_0420,X
    LDA ram_0420,X
    CMP #$E3
    BCC bra_9907
    LDA #$B2
    STA ram_0420,X
bra_9907:
    STA ram_0005_t03_spr_Y
    TAY
    LDA #$10
    CPY #$C2
    BCS bra_9917
    LSR
    CPY #$B9
    BCS bra_9917
    LDA #$00
bra_9917:
    STA ram_0000_t59_spr_T
    STX ram_0002_t14_save_X
    LDY tbl_98BB_offset,X
    LDX #$03
bra_9920_loop:
    LDA tbl_98AF_spr_T,X
    CLC
    ADC ram_0000_t59_spr_T
    STA ram_spr_T,Y
    LDA tbl_98B7_spr_X,X
    STA ram_spr_X,Y
    LDA ram_0005_t03_spr_Y
    STA ram_spr_Y,Y
    LDA #$00
    STA ram_spr_A,Y
    INY
    INY
    INY
    INY
    DEX
    BPL bra_9920_loop
    LDX ram_0002_t14_save_X
    RTS



sub_9943:
    LDX #$03
    LDY #$F0
bra_9947_loop:
    LDA ram_frm_cnt
    AND #$08
    ADC tbl_98B3_spr_T,X
    STA ram_spr_T,Y
    LDA #$A8
    STA ram_spr_Y,Y
    LDA tbl_98B7_spr_X,X
    STA ram_spr_X,Y
    LDA #$00
    STA ram_spr_A,Y
    INY
    INY
    INY
    INY
    DEX
    BPL bra_9947_loop
    RTS



tbl_9969_logo_blackout_palette:
; 00 
    .byte $36, $0F, $00, $10   ; 
    .byte $36, $17, $27, $0F   ; 
    .byte $36, $08, $1A, $28   ; 
    .byte $36, $30, $3B, $22   ; 

    .byte $36, $30, $3B, $16   ; 
    .byte $36, $17, $27, $0F   ; 
    .byte $36, $08, $1A, $28   ; 
    .byte $36, $30, $3B, $22   ; 



; 01 
    .byte $39, $0F, $00, $10   ; 
    .byte $39, $17, $27, $0F   ; 
    .byte $39, $08, $1A, $28   ; 
    .byte $39, $30, $3B, $22   ; 

    .byte $39, $30, $3B, $16   ; 
    .byte $39, $17, $27, $0F   ; 
    .byte $39, $08, $1A, $28   ; 
    .byte $39, $30, $3B, $22   ; 



; 02 
    .byte $31, $0F, $00, $10   ; 
    .byte $31, $17, $27, $0F   ; 
    .byte $31, $08, $1A, $28   ; 
    .byte $31, $30, $3B, $22   ; 

    .byte $31, $30, $3B, $16   ; 
    .byte $31, $17, $27, $0F   ; 
    .byte $31, $08, $1A, $28   ; 
    .byte $31, $30, $3B, $22   ; 



; 03 
    .byte $3C, $0F, $00, $10   ; 
    .byte $3C, $17, $27, $0F   ; 
    .byte $3C, $08, $1A, $28   ; 
    .byte $3C, $30, $3B, $22   ; 

    .byte $3C, $30, $3B, $16   ; 
    .byte $3C, $17, $27, $0F   ; 
    .byte $3C, $08, $1A, $28   ; 
    .byte $3C, $30, $3B, $22   ; 



; 04 
    .byte $3B, $0F, $00, $10   ; 
    .byte $3B, $17, $27, $0F   ; 
    .byte $3B, $08, $1A, $28   ; 
    .byte $3B, $10, $3B, $22   ; 

    .byte $3B, $10, $3B, $16   ; 
    .byte $3B, $17, $27, $0F   ; 
    .byte $3B, $08, $1A, $28   ; 
    .byte $3B, $10, $3B, $22   ; 



; 05 
    .byte $2C, $0F, $00, $10   ; 
    .byte $2C, $17, $27, $0F   ; 
    .byte $2C, $08, $1A, $28   ; 
    .byte $2C, $10, $3B, $22   ; 

    .byte $2C, $10, $3B, $16   ; 
    .byte $2C, $17, $27, $0F   ; 
    .byte $2C, $08, $1A, $28   ; 
    .byte $2C, $10, $3B, $22   ; 



; 06 
    .byte $1C, $0F, $00, $10   ; 
    .byte $1C, $17, $27, $0F   ; 
    .byte $1C, $08, $1A, $28   ; 
    .byte $1C, $10, $3B, $22   ; 

    .byte $1C, $10, $3B, $16   ; 
    .byte $1C, $17, $27, $0F   ; 
    .byte $1C, $08, $1A, $28   ; 
    .byte $1C, $10, $3B, $22   ; 



; 07 
    .byte $02, $0F, $00, $10   ; 
    .byte $02, $06, $27, $0F   ; 
    .byte $02, $0A, $1A, $18   ; 
    .byte $02, $10, $2B, $12   ; 

    .byte $02, $10, $2B, $06   ; 
    .byte $02, $06, $27, $0F   ; 
    .byte $02, $0A, $1A, $18   ; 
    .byte $02, $10, $2B, $12   ; 



; 08 
    .byte $0C, $0F, $00, $10   ; 
    .byte $0C, $03, $16, $0F   ; 
    .byte $0C, $01, $0A, $08   ; 
    .byte $0C, $00, $1B, $02   ; 

    .byte $0C, $00, $1B, $02   ; 
    .byte $0C, $03, $16, $0F   ; 
    .byte $0C, $01, $0A, $08   ; 
    .byte $0C, $00, $1B, $02   ; 



; 09 
    .byte $0F, $0F, $0F, $00   ; 
    .byte $0F, $01, $11, $0F   ; 
    .byte $0F, $0C, $01, $02   ; 
    .byte $0F, $00, $01, $0C   ; 

    .byte $0F, $00, $01, $0C   ; 
    .byte $0F, $01, $11, $0F   ; 
    .byte $0F, $0C, $01, $02   ; 
    .byte $0F, $00, $01, $0C   ; 



; 0A 
    .byte $0F, $0F, $0F, $00   ; 
    .byte $0F, $01, $11, $0F   ; 
    .byte $0F, $0F, $0C, $01   ; 
    .byte $0F, $01, $0C, $0F   ; 

    .byte $0F, $01, $0C, $0F   ; 
    .byte $0F, $01, $11, $0F   ; 
    .byte $0F, $0F, $0C, $01   ; 
    .byte $0F, $01, $0C, $0F   ; 



; 0B 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $01, $0F   ; 
    .byte $0F, $0F, $0F, $0C   ; 
    .byte $0F, $0C, $0F, $0F   ; 

    .byte $0F, $0C, $0F, $0F   ; 
    .byte $0F, $0F, $01, $0F   ; 
    .byte $0F, $0F, $0F, $0C   ; 
    .byte $0F, $0C, $0F, $0F   ; 



; 0C 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 

    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



; 0D 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 

    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



; 0E
; bzk garbage?
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 

    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



; 0F
; bzk garbage?
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 

    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



tbl_9B69:
    .byte $08   ; 01 
    .byte $08   ; 02 
    .byte $06   ; 03 
    .byte $05   ; 04 
    .byte $04   ; 05 
    .byte $03   ; 06 
    .byte $02   ; 07 
    .byte $02   ; 08 
    .byte $02   ; 09 
    .byte $C0   ; 0A 
    .byte $06   ; 0B 
    .byte $04   ; 0C 
    .byte $C0   ; 0D 
    .byte $03   ; 0E 
    .byte $04   ; 0F 
    .byte $04   ; 10 



ofs_007_9B79_01:
    LDA ram_0437_enemy + $01
    BNE bra_9BD0
    LDA #$00
    STA ram_0000_t18_palette_data + $01
    LDA ram_0437_link
; * 08
    ASL
    ASL
    ASL
; * 04
    ASL
    ROL ram_0000_t18_palette_data + $01
    ASL
    ROL ram_0000_t18_palette_data + $01
    ADC #< tbl_9969_logo_blackout_palette
    STA ram_0000_t18_palette_data
    LDA ram_0000_t18_palette_data + $01
    ADC #> tbl_9969_logo_blackout_palette
    STA ram_0000_t18_palette_data + $01
    LDA #> $3F00
    STA ram_0302_ppu_buffer
    LDA #< $3F00
    STA ram_0302_ppu_buffer + $01
    LDA #$20    ; counter
    STA ram_0302_ppu_buffer + $02
    LDY #$1F
    LDA #$FF
    STA ram_0302_ppu_buffer + $04,Y
bra_9BAE_loop:
    LDA (ram_0000_t18_palette_data),Y
    STA ram_0302_ppu_buffer + $03,Y
    DEY
    BPL bra_9BAE_loop
    INC ram_0437_link
    LDY ram_0437_link
    LDA tbl_9B69 - $01,Y
    STA ram_0437_enemy + $01
    CPY #$0E
    BCC bra_9BD0
    INC ram_042B_enemy
    LDA #$00
    STA ram_042B_enemy + $01
    STA ram_0011_screen_ready_flag
bra_9BD0:
    DEC ram_0437_enemy + $01
; bzk optimize, JMP
    JSR sub_98C3
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



tbl_9D00_save_slot_addresses:
; 00 
    .word ram_687E_map_data + $1A
    .word ram_68FE_map_data + $12
    .word ram_687E_map_data + $02
    .word ram_6D90
    .word ram_6D93
    .word ram_6D96
    .word ram_6D99
; 01 
    .word ram_687E_map_data + $42
    .word ram_6A7E_map_data + $12
    .word ram_687E_map_data + $0A
    .word ram_6D90 + $01
    .word ram_6D93 + $01
    .word ram_6D96 + $01
    .word ram_6D99 + $01
; 02 
    .word ram_687E_map_data + $6A
    .word ram_6C10
    .word ram_687E_map_data + $12
    .word ram_6D90 + $02
    .word ram_6D93 + $02
    .word ram_6D96 + $02
    .word ram_6D99 + $02



sub_9D2A_prepare_save_slot_addresses:
; out
    ; ram_00C0_t01_data
    ; ram_00C2_t01_data
    ; ram_00C4_t01_data
    ; ram_00C6_t01_data
    ; ram_00C8_t01_data
    ; ram_00CA_t01_data
    ; ram_00CC_t01_data
    LDA #$FF
    LDY ram_current_save_slot
bra_9D2E_loop:
    CLC
    ADC #$0E
    DEY
    BPL bra_9D2E_loop
    TAY
    LDX #$0D
bra_9D37_loop:
    LDA tbl_9D00_save_slot_addresses,Y
; ram_00C0_t01_data
; ram_00C2_t01_data
; ram_00C4_t01_data
; ram_00C6_t01_data
; ram_00C8_t01_data
; ram_00CA_t01_data
; ram_00CC_t01_data
    STA ram_00C0_indirect_data,X
    DEY
    DEX
    BPL bra_9D37_loop
    RTS



tbl_9D41:
    .dbyt $2064 ; 
    .byte $00 + $00 + $19   ; counter
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $6A, $6A, $6A, $6A, $0E, $15, $12, $16, $12, $17, $0A, $1D   ; 
    .byte $12, $18, $17, $24, $24, $16, $18, $0D, $0E, $6A, $6A, $6A, $6A   ; 

    .byte $FF   ; end token



tbl_9D5E:
    .byte $1B   ; 
    .byte $0E   ; 
    .byte $10   ; 
    .byte $12   ; 
    .byte $1C   ; 
    .byte $1D   ; 
    .byte $0E   ; 
    .byte $1B   ; 
    .byte $24   ; 
    .byte $22   ; 
    .byte $18   ; 
    .byte $1E   ; 
    .byte $1B   ; 
    .byte $24   ; 
    .byte $17   ; 
    .byte $0A   ; 
    .byte $16   ; 
    .byte $0E   ; 



tbl_9D70:
    .byte $1B   ; 
    .byte $0E   ; 
    .byte $10   ; 
    .byte $12   ; 
    .byte $1C   ; 
    .byte $1D   ; 
    .byte $0E   ; 
    .byte $1B   ; 
    .byte $24   ; 
    .byte $24   ; 
    .byte $24   ; 



tbl_9D7B:
    .dbyt $20CE ; 
    .byte $00 + $08   ; counter
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                       $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24   ; 

    .dbyt $212E ; 
    .byte $00 + $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                       $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24   ; 

    .dbyt $218E ; 
    .byte $00 + $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                       $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24   ; 

    .dbyt $21EA ; 
    .byte $00 + $0F   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                   $0E, $15, $12, $16, $12, $17   ; 
    .byte $0A, $1D, $12, $18, $17, $24, $0E, $17, $0D   ; 

    .byte $FF   ; end token



tbl_9DAF_pos_Y:
    .byte $2F   ; 00 
    .byte $47   ; 01 
    .byte $5F   ; 02 
    .byte $77   ; 03 



tbl_9DB3:
    .byte $0A   ; 
    .byte $0B   ; 
    .byte $0C   ; 
    .byte $0D   ; 
    .byte $0E   ; 
    .byte $0F   ; 
    .byte $10   ; 
    .byte $11   ; 
    .byte $12   ; 
    .byte $13   ; 
    .byte $14   ; 
    .byte $15   ; 
    .byte $16   ; 
    .byte $17   ; 
    .byte $18   ; 
    .byte $19   ; 
    .byte $1A   ; 
    .byte $1B   ; 
    .byte $1C   ; 
    .byte $1D   ; 
    .byte $1E   ; 
    .byte $1F   ; 
    .byte $20   ; 
    .byte $21   ; 
    .byte $22   ; 
    .byte $23   ; 
    .byte $62   ; 
    .byte $63   ; 
    .byte $28   ; 
    .byte $29   ; 
    .byte $2A   ; 
    .byte $2B   ; 
    .byte $2C   ; 
    .byte $00   ; 
    .byte $01   ; 
    .byte $02   ; 
    .byte $03   ; 
    .byte $04   ; 
    .byte $05   ; 
    .byte $06   ; 
    .byte $07   ; 
    .byte $08   ; 
    .byte $09   ; 
    .byte $24   ; 



tbl_9DDF:
; offset via 0x009E1E
; 02
    .byte $20   ; 
    .byte $CE   ; 
    .byte $01   ; 
; 05
    .byte $21   ; 
    .byte $2E   ; 
    .byte $01   ; 
; 08
    .byte $21   ; 
    .byte $8E   ; 
    .byte $01   ; 



tbl_9DE8:
; offset via 0x009E18
; 04
    .byte $20   ; 
    .byte $CE   ; 
    .byte $48   ; 
    .byte $24   ; 
    .byte $FF   ; 
; 09
    .byte $21   ; 
    .byte $2E   ; 
    .byte $48   ; 
    .byte $24   ; 
    .byte $FF   ; 
; 0E
    .byte $21   ; 
    .byte $8E   ; 
    .byte $48   ; 
    .byte $24   ; 
    .byte $FF   ; 



tbl_9DF7_spr_data:
    .byte $F3   ; 
    .byte $03   ; 
    .byte $43   ; 
    .byte $F8   ; 
    .byte $25   ; 
    .byte $23   ; 
    .byte $70   ; 
    .byte $F8   ; 
    .byte $25   ; 
    .byte $23   ; 
    .byte $30   ; 



tbl_9E02_pos_Y:
; X = 00
    .byte $10   ; add
    .byte $C7   ; compare
    .byte $87   ; set if equal
; X = 03
    .byte $F0   ; 
    .byte $77   ; 
    .byte $B7   ; 



tbl_9E08_offset:
    .byte $04   ; 
    .byte $09   ; 
    .byte $0E   ; 



tbl_9E0B:
    .byte $00   ; save slot 1
    .byte $08   ; save slot 2
    .byte $10   ; save slot 3



tbl_9E0E_offset:
    .byte $02   ; 
    .byte $05   ; 
    .byte $08   ; 



loc_0x009E21:
    LDA #$00
    STA ram_current_save_slot
    JSR sub_9FDE
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA ram_subscript
    BNE bra_9E5A
    JSR sub_0x01E47D_clear_screen
bra_9E22_loop:
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A437
    INC ram_current_save_slot
    LDA ram_current_save_slot
    CMP #$03
    BNE bra_9E22_loop
    LDA #$00
    STA ram_current_save_slot
    LDX #$1C
bra_9E36_loop:
    LDA tbl_9D41,X
    STA ram_0302_ppu_buffer,X
    DEX
    BPL bra_9E36_loop
    LDA ram_script
    CMP #con_script_register
    BNE bra_9E52
    LDY #$00
bra_9E47_loop:
    LDA tbl_9D5E,Y
    STA ram_0302_ppu_buffer + $07,Y
    INY
    CPY #$12
    BNE bra_9E47_loop
bra_9E52:
    LDA #$1D
bra_9E54:
    STA ram_0301_buffer_index
    INC ram_subscript
    RTS
bra_9E5A:
    CMP #$01
    BNE bra_9E99
    LDX #$33
bra_9E60_loop:
    LDA tbl_9D7B,X
    STA ram_0302_ppu_buffer,X
    DEX
    BPL bra_9E60_loop
    LDX #$00
    LDY #$00
bra_9E6D_loop:
    LDA ram_slot_name,Y
    STA ram_0302_ppu_buffer + $03,X
    INX
    INY
    TYA
    AND #$07
    BNE bra_9E6D_loop
    INX
    INX
    INX
    CPX #$21
    BNE bra_9E6D_loop
    LDA ram_script
    CMP #con_script_register
    BNE bra_9E95
    LDY #$00
bra_9E89_loop:
    LDA tbl_9D70,Y
    STA ram_0302_ppu_buffer + $03,X
    INX
    INY
    CPY #$0B
    BNE bra_9E89_loop
bra_9E95:
    LDA #$34
    BNE bra_9E54    ; jmp
bra_9E99:
    CMP #$02
    BNE bra_9EA4
    LDA #con_ppu_buf_16
bra_9E9F:
    STA ram_ppu_load_index
    INC ram_subscript
    RTS
bra_9EA4:
    CMP #$03
    BNE bra_9EB9
    LDA #$15
    LDY ram_script
    CPY #con_script_elimination
    BNE bra_9EB2
    LDA #$30
bra_9EB2:
    STA ram_6810
    LDA #con_ppu_buf_12
    BNE bra_9E9F    ; jmp
bra_9EB9:
    LDA ram_script
    CMP #con_script_elimination
    BEQ bra_9ED0
    LDX #$03
    LDY #$FF
    STY ram_current_save_slot
bra_9EC5_loop:
    INY
    INC ram_current_save_slot
    LDA ram_slot_active_flag,Y
    BEQ bra_9ED0
    DEX
    BPL bra_9EC5_loop
bra_9ED0:
    JSR sub_A18E
    LDA ram_current_save_slot
    CMP #$03
    BNE bra_9EDE
    LDA #$F8
    STA ram_spr_Y + $08
bra_9EDE:
    LDA #$50
    STA ram_0000_t21_spr_X
    LDA #$30
    STA ram_0001_t15_spr_Y
    INC ram_0011_screen_ready_flag
    JMP loc_A638



tbl_9EEB_name_zelda:
    .byte $23, $0E, $15, $0D, $0A   ; ZELDA



ofs_main_script_2_0x009F00_0E_register:
; con_script_register
    LDA ram_btn_press
    AND #con_btn_Start
    BEQ bra_9EFC
    LDA ram_current_save_slot
    CMP #$03
    BEQ bra_9EFF
bra_9EFC:
    JMP loc_9FB0
bra_9EFF:
    LDA #$00
    STA ram_0607_sfx_2
    STA ram_0425
    STA ram_0423
    STA ram_current_save_slot
    TAX
loc_9F0D_loop:
    LDY ram_current_save_slot
    LDA #$FF
    STA ram_652A_slot,Y
    TYA
    ASL
    TAY
    LDA #$00
    STA ram_0426
    STA ram_6D9C,Y  ; 6D9C 6D9E 6DA0
    INY
    STA ram_6D9D - $01,Y  ; 6D9D 6D9F 6DA1
    TXA
    PHA
    JSR sub_9D2A_prepare_save_slot_addresses
    PLA
    TAX
bra_9F2A_loop:
    LDY ram_0423
    LDA ram_slot_name,Y
    LDY ram_0425
    STA (ram_00C4_t01_data),Y
    CMP #$24
    BEQ bra_9F79
    LDA ram_slot_active_flag,X
    BNE bra_9F79
    LDY #$18
    LDA #$22
    STA (ram_00C0_t01_data),Y
    INY ; 19
    LDA #$FF
    STA (ram_00C0_t01_data),Y
    LDY #$25
    LDA #$08
    STA (ram_00C0_t01_data),Y
    TXA
    PHA
; * 08
    ASL
    ASL
    ASL
    TAY
    LDX #$00
bra_9F57_loop:
    LDA ram_slot_name,Y
    CMP tbl_9EEB_name_zelda,X
    BNE bra_9F6E
    INY
    INX
    CPX #$05
    BCC bra_9F57_loop
    PLA
    PHA
    TAX
    LDY #$00
    LDA #$01
    STA (ram_00CC_t01_data),Y
bra_9F6E:
    PLA
    TAX
    LDA #$01
    STA ram_0426
    LDY #$00
    STA (ram_00C6_t01_data),Y
bra_9F79:
    INC ram_0423
    INC ram_0425
    LDA ram_0425
    CMP #$08
    BNE bra_9F2A_loop
    INX
    LDA #$00
    STA ram_0425
    LDA ram_0426
    BEQ bra_9F94
    JSR sub_A3C8
bra_9F94:
    INC ram_current_save_slot
    LDA ram_current_save_slot
    CMP #$03
    BEQ bra_9F9F
    JMP loc_9F0D_loop
bra_9F9F:
    LDA #$00
    STA ram_0426
    STA ram_current_save_slot
    JSR sub_9FDE
    LDA #$01
    STA ram_0011_screen_ready_flag
    JMP loc_A803



loc_9FB0:
    LDA ram_current_save_slot
    CMP #$03
    BEQ bra_9FB9
    JSR sub_A011
bra_9FB9:
    JSR sub_A204
    JSR sub_A1C3
    JSR sub_A1DD
    JMP loc_A10B



ofs_main_script_2_0x009FD5_0F_elimination:
; con_script_elimination
    LDA ram_btn_press
    CMP #con_btn_Start
    BEQ bra_9FCE
    JMP loc_A204
bra_9FCE:
    LDA ram_current_save_slot
    CMP #$03
    BNE bra_9FE8
    LDA #con_script_register
    STA ram_script
    LDA #$00
    STA ram_0011_screen_ready_flag
    STA ram_subscript
sub_9FDE:
    STA ram_041F
    STA ram_0420
    STA ram_0421
    RTS
bra_9FE8:
    LDA #con_sfx_1_plr_hit
    STA ram_sfx_1
    LDY ram_current_save_slot
    LDX tbl_9E08_offset,Y
    LDY #$04
bra_9FF4_loop:
    LDA tbl_9DE8,X
    STA ram_0302_ppu_buffer,Y
    DEX
    DEY
    BPL bra_9FF4_loop
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    JSR sub_A35D
    JSR sub_A80C_prepare_slot_name_address
    LDY #$07
bra_A009_loop:
    LDA #$24
    STA (ram_000C_t02_slot_name_data),Y
    DEY
    BPL bra_A009_loop
    RTS



sub_A011:
    LDA ram_btn_hold
    AND #con_btns_Dpad
    BNE bra_A021
sub_A017:
    STA ram_0426
    STA ram_0428
    STA ram_0429
    RTS
bra_A021:
    TAY
    LDA ram_0426
    BNE bra_A02D
    STY ram_0427
    INC ram_0426
bra_A02D:
    LDA ram_btn_hold
    AND #con_btns_Dpad
    CMP ram_0427
    BEQ bra_A03B
    LDA #$00
    JSR sub_A017
bra_A03B:
    LDA ram_0429
    BEQ bra_A044
    DEC ram_0429
    RTS
bra_A044:
    LDY #$08
    LDA ram_0428
    BNE bra_A04D
    LDY #$10
bra_A04D:
    STY ram_0429
    LDA ram_btn_hold
    AND #con_btns_Dpad
    CMP #con_btn_Right
    BNE bra_A07C
    INC ram_041F
    LDA ram_pos_X_enemy + $01
    CLC
    ADC #$10
    STA ram_pos_X_enemy + $01
    CMP #$E0
    BNE bra_A079
    LDA #$30
    STA ram_pos_X_enemy + $01
    LDX #$00
    JSR sub_A0F0
    LDA ram_042A
    BEQ bra_A079
    LDA #$00
    STA ram_041F
bra_A079:
    JMP loc_A0E7
bra_A07C:
    CMP #con_btn_Left
    BNE bra_A0A4
    DEC ram_041F
    LDA ram_pos_X_enemy + $01
    SEC
    SBC #$10
    STA ram_pos_X_enemy + $01
    CMP #$20
    BNE bra_A0A1
    LDA #$D0
    STA ram_pos_X_enemy + $01
    LDX #$03
    JSR sub_A0F0
    LDA ram_042A
    BEQ bra_A0A1
    LDA #$2B
    STA ram_041F
bra_A0A1:
    JMP loc_A0E7
bra_A0A4:
    CMP #con_btn_Down
    BNE bra_A0C7
    LDA ram_041F
    CLC
    ADC #$0B
    STA ram_041F
    LDX #$00
    JSR sub_A0F0
    LDA ram_042A
    BEQ bra_A0C4
    LDA ram_041F
    SEC
    SBC #$2C
    STA ram_041F
bra_A0C4:
    JMP loc_A0E7
bra_A0C7:
    CMP #con_btn_Up
    BNE bra_A0EF_RTS
    LDA ram_041F
    SEC
    SBC #$0B
    STA ram_041F
    LDX #$03
    JSR sub_A0F0
    LDA ram_042A
    BEQ bra_A0E7
    LDA ram_041F
    CLC
    ADC #$2C
    STA ram_041F
bra_A0E7:
loc_A0E7:
    LDA #$01    ; con_sfx_2_cursor_select
    STA ram_0428
    STA ram_sfx_2
bra_A0EF_RTS:
    RTS



sub_A0F0:
    LDY #$00
    LDA ram_pos_Y_enemy + $01
    CLC
    ADC tbl_9E02_pos_Y,X
    STA ram_pos_Y_enemy + $01
    INX
    CMP tbl_9E02_pos_Y,X
    BNE bra_A107
    INX
    LDA tbl_9E02_pos_Y,X
    STA ram_pos_Y_enemy + $01
    INY
bra_A107:
    STY ram_042A
bra_A10A_RTS:
    RTS



loc_A10B:
    LDA ram_0420
    BNE bra_A12E
    LDY ram_current_save_slot
    CPY #$03
    BEQ bra_A10A_RTS
    LDA tbl_9E0B,Y
    STA ram_0421
    LDX tbl_9E0E_offset,Y
    LDY #$02
bra_A121_loop:
    LDA tbl_9DDF,X
    STA ram_0422,Y
    DEX
    DEY
    BPL bra_A121_loop
    INC ram_0420
bra_A12E:
    LDA ram_btn_press
    AND #con_btn_B + con_btn_A
    BEQ bra_A18B
    CMP #con_btn_A
    BNE bra_A15A
    LDY #con_sfx_4_plant_bomb
    STY ram_sfx_4
    LDY #$02
bra_A13F_loop:
    LDA ram_0422,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_A13F_loop
    STY ram_0302_ppu_buffer + $04
    LDX ram_0421
    LDY ram_041F
    LDA tbl_9DB3,Y
    STA ram_0302_ppu_buffer + $03
    STA ram_slot_name,X
bra_A15A:
    LDA ram_pos_X_link
    CLC
    ADC #$08
    STA ram_pos_X_link
    INC ram_0421
    INC ram_0423
    LDA ram_0423
    AND #$0F
    CMP #$06
    BNE bra_A18B
    LDA ram_0423
    SEC
    SBC #$08
    STA ram_0423
    LDY ram_current_save_slot
    LDA tbl_9E0B,Y
    STA ram_0421
    LDA ram_pos_X_link
    CMP #$B0
    BNE bra_A18B
    LDA #$70
    STA ram_pos_X_link
bra_A18B:
    JMP loc_A1D7



sub_A18E:
    LDY #$0A
bra_A190_loop:
    LDA tbl_9DF7_spr_data,Y
    STA ram_spr_T,Y
    DEY
    BPL bra_A190_loop
    LDY ram_current_save_slot
    LDA tbl_9DAF_pos_Y,Y
    STA ram_pos_Y_link
    STA ram_spr_Y
    LDA ram_script
    CMP #con_script_elimination
    BEQ bra_A1C2_RTS
    LDA #$F3
    STA ram_spr_T
    LDA ram_pos_Y_link
    SEC
    SBC #$08
    STA ram_spr_Y + $04
    LDA #$70
    STA ram_pos_X_link
    LDA #$87
    STA ram_pos_Y_enemy + $01
    LDA #$30
    STA ram_pos_X_enemy + $01
bra_A1C2_RTS:
    RTS



sub_A1C3:
    LDA ram_pos_Y_link
    CMP #$77
    BNE bra_A1CF
    LDA #$F8
    STA ram_spr_Y + $04
    RTS
bra_A1CF:
    LDA ram_pos_Y_link
    JSR sub_A1F7
    STY ram_spr_Y + $04
loc_A1D7:
    LDA ram_pos_X_link
    STA ram_spr_X + $04
    RTS



sub_A1DD:
    LDA ram_pos_Y_link
    CMP #$77
    BNE bra_A1E9
    LDA #$F8
    STA ram_spr_Y + $08
    RTS
bra_A1E9:
    LDA ram_pos_Y_enemy + $01
    JSR sub_A1F7
    STY ram_spr_Y + $08
    LDA ram_pos_X_enemy + $01
    STA ram_spr_X + $08
    RTS



sub_A1F7:
    SEC
    SBC #$08
    TAY
    LDA ram_frm_cnt
    AND #$08
    BNE bra_A203_RTS
    LDY #$F8
bra_A203_RTS:
    RTS



sub_A204:
loc_A204:
    LDA ram_btn_press
    AND #con_btn_Select
    BEQ bra_A253_RTS
bra_A20A_loop:
    LDA #con_sfx_2_cursor_select
    STA ram_sfx_2
    INC ram_current_save_slot
    LDY ram_current_save_slot
    CPY #$04
    BNE bra_A21B
    LDY #$00
    STY ram_current_save_slot
bra_A21B:
    LDA tbl_9DAF_pos_Y,Y
    STA ram_spr_Y
    LDA ram_script
    CMP #con_script_elimination
    BEQ bra_A253_RTS
    LDA ram_pos_Y_link
    CLC
    ADC #$18
    STA ram_pos_Y_link
    CMP #$8F
    BNE bra_A236
    LDA #$2F
    STA ram_pos_Y_link
bra_A236:
    STA ram_spr_Y
    LDA #$70
    STA ram_spr_X + $04
    STA ram_pos_X_link
    LDA #$00
    STA ram_0420
    STA ram_0421
    LDY ram_current_save_slot
    CPY #$03
    BEQ bra_A253_RTS
    LDA ram_slot_active_flag,Y
    BNE bra_A20A_loop
bra_A253_RTS:
    RTS



tbl_A254:
    .dbyt $2109 ; 
    .byte $00 + $10 + $01   ; counter
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte      $24, $24, $24, $24, $24, $24, $24, $24, $62, $00, $00, $00, $00, $00, $00   ; 
    .byte $00, $00   ; 

    .dbyt $2132 ; 
    .byte $00 + $00 + $08   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte           $00, $00, $00, $00, $00, $00, $00, $00   ; 

    .byte $FF   ; end token



tbl_A274:
    .dbyt $2189 ; 
    .byte $00 + $00 + $03   ; counter
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $24, $24, $01   ; 

    .dbyt $21E9 ; 
    .byte $00 + $00 + $03   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $24, $24, $01   ; 

    .dbyt $2249 ; 
    .byte $00 + $00 + $03   ; 
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $24, $24, $01   ; 
    .byte $FF   ; end token



tbl_A287_tunic_color:
    .byte $29   ; 00 ram_6804_tunic_color
    .byte $32   ; 01 ram_6804_tunic_color + $04
    .byte $16   ; 02 ram_6804_tunic_color + $08



loc_0x00A29A:
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_009_A2A0_00
    .word ofs_009_A47F_01
    .word ofs_009_A4BD_02
    .word ofs_009_A4C4_03
    .word ofs_009_A4C4_04
    .word ofs_009_A4C4_05
    .word ofs_009_A51E_06



ofs_006_A2A0_01_prepare_slot_select_screen_1:
ofs_009_A2A0_00:
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA #$00
    STA ram_current_save_slot
bra_A2A7_loop:
    LDY ram_current_save_slot
    LDA ram_652A_slot,Y
    BNE bra_A2CD
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A3E1
    LDA ram_current_save_slot
    ASL
    TAY
    LDA ram_6D9C,Y
    CMP ram_00CE
    BNE bra_A2CD
    INY
    LDA ram_6D9D - $01,Y
    CMP ram_00CF
    BNE bra_A2CD
    JSR sub_A764
    JMP loc_A2FC
bra_A2CD:
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    JSR sub_A307
    LDY ram_current_save_slot
    LDA ram_slot_valid_1,Y
    CMP #$5A
    BNE bra_A2F6
    LDA ram_slot_valid_2,Y
    CMP #$A5
    BNE bra_A2F6
    LDA ram_current_save_slot
    ASL
    TAY
    LDA ram_6524,Y
    CMP ram_000E_t01_hi
    BNE bra_A2F6
    INY
    LDA ram_6525 - $01,Y
    CMP ram_000F_t02_lo
    BEQ bra_A2FC
bra_A2F6:
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    JSR sub_A35D
bra_A2FC:
loc_A2FC:
    INC ram_current_save_slot
    LDA ram_current_save_slot
    CMP #$03
    BNE bra_A2A7_loop
    INC ram_subscript
    RTS



sub_A307:
; in
    ; ram_0000_t19_data
    ; ram_0002_t03_data
    ; ram_0004_t02_slot_name_data
    ; ram_0006_t01_data
    ; ram_0008_t03_data
    LDA #$00
    STA ram_000E_t01_hi
    STA ram_000F_t02_lo
    LDY #$07
bra_A30F_loop:
    LDA (ram_0004_t02_slot_name_data),Y
    JSR sub_A351
    DEY
    BPL bra_A30F_loop
    LDY #$27
bra_A319_loop:
    LDA (ram_0000_t19_data),Y
    JSR sub_A351
    DEY
    BPL bra_A319_loop
    LDA #< $0180
    STA ram_0000_t19_data + $01
    LDA #> $0180
    STA ram_0000_t19_data
    LDY #$00
bra_A32B_loop:
    LDA (ram_0002_t03_data),Y
    JSR sub_A351
    INC ram_0002_t03_data
    BNE bra_A336_not_overflow
    INC ram_0002_t03_data + $01
bra_A336_not_overflow:
    DEC ram_0000_t19_data + $01
    BNE bra_A32B_loop
    DEC ram_0000_t19_data
    LDA ram_0000_t19_data
    BPL bra_A32B_loop
    LDA (ram_0006_t01_data),Y
    JSR sub_A351
    LDA (ram_0008_t03_data),Y
    JSR sub_A351
    LDA (ram_000A_t01_data),Y
    JSR sub_A351
    LDA (ram_000C_t01_data),Y
sub_A351:
    CLC
    ADC ram_000F_t02_lo
    STA ram_000F_t02_lo
; bzk optimize, BCC + INC 000E
    LDA ram_000E_t01_hi
    ADC #$00
    STA ram_000E_t01_hi
    RTS



sub_A35D:
; in
    ; ram_0000_t19_data
    ; ram_0002_t03_data
    ; ram_0004_t02_slot_name_data
    ; ram_0006_t01_data
    ; ram_0008_t03_data
    LDY #$07
    LDA #$24
bra_A361_loop:
    STA (ram_0004_t02_slot_name_data),Y
    DEY
    BPL bra_A361_loop
    LDY #$27
    LDA #$00
bra_A36A_loop:
    STA (ram_0000_t19_data),Y
    DEY
    BPL bra_A36A_loop
    LDA #$80
    STA ram_0001_t11_counter_hi
    LDA #$01
    STA ram_0000_t30_counter_lo
    LDY #$00
bra_A379_loop:
    LDA #$00
    STA (ram_0002_t03_data),Y
    INC ram_0002_t03_data
    BNE bra_A383_not_overflow
    INC ram_0002_t03_data + $01
bra_A383_not_overflow:
    DEC ram_0001_t11_counter_hi
    BNE bra_A379_loop
    DEC ram_0000_t30_counter_lo
; bzk optimize, DEC updates N flag, no need for LDA
    LDA ram_0000_t30_counter_lo
    BPL bra_A379_loop
    LDA #$00
    STA (ram_0006_t01_data),Y
    STA (ram_0008_t03_data),Y
    STA (ram_000A_t01_data),Y
    STA (ram_000C_t01_data),Y
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    JSR sub_A307
    LDY ram_current_save_slot
    LDA #$00
    STA ram_slot_active_flag,Y
    STA ram_current_quest,Y
    STA ram_death_cnt,Y
    LDA #$FF
    STA ram_652A_slot,Y
    LDA #$5A
    STA ram_slot_valid_1,Y
    LDA #$A5
    STA ram_slot_valid_2,Y
    TYA
    ASL
    TAY
    LDA ram_000E_t01_hi
    STA ram_6524,Y
    INY
    LDA ram_000F_t02_lo
    STA ram_6525 - $01,Y
    RTS



sub_A3C8:
    JSR sub_A3E1
    LDY ram_current_save_slot
    LDA #$00
    STA ram_652A_slot,Y
    TYA
    ASL
    TAY
    LDA ram_00CE
    STA ram_6D9C,Y
    INY
    LDA ram_00CF
    STA ram_6D9D - $01,Y
    RTS



sub_A3E1:
; in
    ; ram_00C0_t01_data
    ; ram_00C2_t01_data
    ; ram_00C4_t01_data
    ; ram_00C6_t01_data
    ; ram_00C8_t01_data
    ; ram_00CA_t01_data
    ; ram_00CC_t01_data
    LDA #$00
    STA ram_00CE
    STA ram_00CF
    LDY #$07
bra_A3E9_loop:
    LDA (ram_00C4_t01_data),Y
    JSR sub_A42B_add_to_00CE
    DEY
    BPL bra_A3E9_loop
    LDY #$27
bra_A3F3_loop:
    LDA (ram_00C0_t01_data),Y
    JSR sub_A42B_add_to_00CE
    DEY
    BPL bra_A3F3_loop
    LDA #< $0180
    STA ram_00C1_t01_counter_hi
    LDA #> $0180
    STA ram_00C0_t02_counter_lo
    LDY #$00
bra_A405_loop:
    LDA (ram_00C2_t01_data),Y
    JSR sub_A42B_add_to_00CE
    INC ram_00C2_t01_data
    BNE bra_A410_not_overflow
    INC ram_00C2_t01_data + $01
bra_A410_not_overflow:
    DEC ram_00C1_t01_counter_hi
    BNE bra_A405_loop
    DEC ram_00C0_t02_counter_lo
; bzk optimize, DEC updates N flag, no need for LDA
    LDA ram_00C0_t02_counter_lo
    BPL bra_A405_loop
    LDA (ram_00C6_t01_data),Y
    JSR sub_A42B_add_to_00CE
    LDA (ram_00C8_t01_data),Y
    JSR sub_A42B_add_to_00CE
    LDA (ram_00CA_t01_data),Y
    JSR sub_A42B_add_to_00CE
    LDA (ram_00CC_t01_data),Y
sub_A42B_add_to_00CE:
    CLC
    ADC ram_00CF
    STA ram_00CF
    LDA ram_00CE
    ADC #$00
    STA ram_00CE
    RTS



sub_A437:
; in
    ; ram_00C0_t01_data
    ; ram_00C2_t01_data
    ; ram_00C4_t01_data
    ; ram_00C6_t01_data
    ; ram_00C8_t01_data
    ; ram_00CA_t01_data
    ; ram_00CC_t01_data
    LDY #$07
    LDA #$24
bra_A43B_loop:
    STA (ram_00C4_t01_data),Y
    DEY
    BPL bra_A43B_loop
    LDY #$27
    LDA #$00
bra_A444_loop:
    STA (ram_00C0_t01_data),Y
    DEY
    BPL bra_A444_loop
    LDA #< $0180
    STA ram_00C1_t02_counter_hi
    LDA #> $0180
    STA ram_00C0_t03_counter_lo
    LDY #$00
bra_A453_loop:
    LDA #$00
    STA (ram_00C2_t01_data),Y
    INC ram_00C2_t01_data
    BNE bra_A45D_not_overflow
    INC ram_00C2_t01_data + $01
bra_A45D_not_overflow:
    DEC ram_00C1_t02_counter_hi
    BNE bra_A453_loop
    DEC ram_00C0_t03_counter_lo
; bzk optimize, DEC updates N flag, no need for LDA
    LDA ram_00C0_t03_counter_lo
    BPL bra_A453_loop
    LDA #$00
    STA (ram_00C6_t01_data),Y
    STA (ram_00C8_t01_data),Y
    STA (ram_00CA_t01_data),Y
    STA (ram_00CC_t01_data),Y
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A3E1
    LDA #$FF
    LDY ram_current_save_slot
    STA ram_652A_slot,Y
    RTS



ofs_009_A47F_01:
    LDA #$00
    STA ram_current_save_slot
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    LDY #$0B
    LDX #$00
bra_A48A_loop:
    TYA
    PHA
    LDA (ram_0000_t19_data),Y
    TAY
    LDA tbl_A287_tunic_color,Y
    STA ram_6804_tunic_color,X
    PLA
    CLC
    ADC #$28
    TAY
    TXA
    CLC
    ADC #$04
    TAX
    CPX #$0C
    BCC bra_A48A_loop
    JSR sub_bat_6DB7_clear_special_metatile_addresses
    LDA #con_ppu_buf_12
    STA ram_ppu_load_index
    INC ram_subscript
    JSR sub_0x01E47D_clear_screen
    LDY #$04
    LDA #$00
    STA ram_0529
bra_A4B6_loop:
    STA ram_room_history,Y
    DEY
    BPL bra_A4B6_loop
    RTS



ofs_009_A4BD_02:
    LDA #con_ppu_buf_14
    STA ram_ppu_load_index
    INC ram_subscript
    RTS



ofs_009_A4C4_03:
ofs_009_A4C4_04:
ofs_009_A4C4_05:
    LDY #$1F
bra_A4C6_loop:
    LDA tbl_A254,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_A4C6_loop
    LDY ram_current_save_slot
bra_A4D1_loop:
    LDA ram_0302_ppu_buffer + $01
    CLC
    ADC #$60
    STA ram_0302_ppu_buffer + $01
    LDA ram_0302_ppu_buffer + $15
    CLC
    ADC #< $0060
    STA ram_0302_ppu_buffer + $15
    LDA ram_0302_ppu_buffer
    ADC #> $0060
    STA ram_0302_ppu_buffer
    STA ram_0302_ppu_buffer + $14
    DEY
    BPL bra_A4D1_loop
    LDA ram_current_save_slot
; * 08
    ASL
    ASL
    ASL
    TAX
    LDY #$03
bra_A4F9_loop:
    LDA ram_slot_name,X
    STA ram_0302_ppu_buffer,Y
    INX
    INY
    CPY #$0B
    BNE bra_A4F9_loop
    LDA ram_current_save_slot
    ASL
    TAY
    LDA ram_slot_hearts,Y
    STA ram_000E_t02
    INY
    LDA ram_slot_hearts,Y
    STA ram_000F_t03
    LDY #$0C
    JSR sub_bat_6E79
    INC ram_current_save_slot
    INC ram_subscript
    RTS



ofs_009_A51E_06:
    LDY #$12
bra_A520_loop:
    LDA tbl_A274,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_A520_loop
    LDA #$00
    STA ram_000A_t03
    LDA #$03
    STA ram_000B_t02
bra_A531_loop:
    LDY ram_000A_t03
    LDA ram_death_cnt,Y
    JSR sub_bat_6E55_convert_to_decimal
    LDX ram_000B_t02
    LDA ram_0001_t04_decimal
    STA ram_0302_ppu_buffer,X
    LDA ram_0001_t04_decimal + $01
    STA ram_0302_ppu_buffer + $01,X
    LDA ram_0001_t04_decimal + $02
    BNE bra_A562
    LDA ram_0001_t04_decimal
    CMP #$24
    BNE bra_A560
    LDA ram_0001_t04_decimal + $01
    CMP #$24
    BNE bra_A560
    LDY ram_000A_t03
    LDA ram_slot_active_flag,Y
    BNE bra_A560
    LDA #$24
    BNE bra_A562    ; jmp
bra_A560:
    LDA #$00
bra_A562:
    STA ram_0302_ppu_buffer + $02,X
    TXA
    CLC
    ADC #$06
    STA ram_000B_t02
    INC ram_000A_t03
    LDA ram_000A_t03
    CMP #$03
    BNE bra_A531_loop
    LDY #$FF
    STY ram_current_save_slot
    STY ram_0526
bra_A57A_loop:
    INY
    INC ram_current_save_slot
    LDA ram_slot_active_flag,Y
    BEQ bra_A57A_loop
    LDA #$00
    STA ram_subscript
    INC ram_0011_screen_ready_flag
    RTS



tbl_A589_cursor_spr_data:
    .byte $F3   ; 00 
    .byte $03   ; 01 
    .byte $28   ; 02 



tbl_A58C_cursor_spr_Y:
    .byte $5C   ; 00 save slot 1
    .byte $74   ; 01 save slot 2
    .byte $8C   ; 02 save slot 3
    .byte $A8   ; 03 register
    .byte $B8   ; 04 elimination



ofs_main_script_2_0x00A5A1_01_slot_selection:
; con_script_slot_selection
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_010_A59A_00
    .word ofs_010_A5DF_01



ofs_010_A59A_00:
    LDA ram_btn_press
    AND #con_btn_Start
    BNE bra_A5DC
    LDA ram_btn_press
    AND #con_btn_Select
    BEQ bra_A5B7
bra_A5A6_loop:
    LDA #con_sfx_2_cursor_select
    STA ram_sfx_2
    INC ram_current_save_slot
    LDA ram_current_save_slot
    CMP #$05
    BNE bra_A5B7
    LDA #$00
    STA ram_current_save_slot
bra_A5B7:
    LDY ram_current_save_slot
    LDA ram_slot_active_flag,Y
    BEQ bra_A5A6_loop
    LDY #$02
bra_A5C0_loop:
    LDA tbl_A589_cursor_spr_data,Y
    STA ram_spr_T,Y
    DEY
    BPL bra_A5C0_loop
    LDY ram_current_save_slot
    LDA tbl_A58C_cursor_spr_Y,Y
    STA ram_spr_Y
    LDA #$58
    STA ram_0001_t15_spr_Y
    LDA #$30
    STA ram_0000_t21_spr_X
    JMP loc_A638
bra_A5DC:
    INC ram_subscript
    RTS



ofs_010_A5DF_01:
    LDA #$00
    STA ram_0607_sfx_2
    LDA #$00   ; bzk optimize, loading the same value twice
    STA ram_dungeon_level
    STA ram_item_slot_index      ; con_item_sword
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA ram_current_save_slot
    CMP #$03
    BCC bra_A5FE_cursor_at_some_slot
    LDA ram_current_save_slot   ; bzk optimize, loading the same value twice
    CLC
    ADC #$0B    ; con_script_register   con_script_elimination
    STA ram_script
    JMP loc_0x01EBB3_clear_subscript
bra_A5FE_cursor_at_some_slot:
    JSR sub_0x01E635_disable_rendering_and_nmi
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    LDY #$27
bra_A606_loop:  ; items 0657-067E
    LDA (ram_0000_t19_data),Y    ; 6042-6091
    STA ram_items,Y
    DEY
    BPL bra_A606_loop
    LDA #$00    ; con_obj_state_00
    STA ram_052E
    STA ram_state_link
    STA ram_item_clock
    TAY
bra_A619_loop:
; up to 07FE
    LDA (ram_0002_t03_data),Y    ; 6212-6511
    STA (ram_000E_t04_data),Y    ; 067F-07FE
    INC ram_0002_t03_data
    BNE bra_A623_not_overflow
    INC ram_0002_t03_data + $01
bra_A623_not_overflow:
    INC ram_000E_t04_data
    BNE bra_A629_not_overflow
    INC ram_000E_t04_data + $01
bra_A629_not_overflow:
    LDA ram_000E_t04_data
    CMP #< $07FF
    BNE bra_A619_loop
    LDA ram_000E_t04_data + $01
    CMP #> $07FF
    BNE bra_A619_loop
    JMP loc_0x01EBB1_prepare_next_script



loc_A638:
    LDA #$08
    STA ram_0002_t45_spr_T
    LDA #$0A
    STA ram_0002_t45_spr_T + $01
    LDA #$00
    JSR sub_bat_7988_set_spr_A
    LDA #$08
    STA ram_spr_index_1
bra_A64A_loop:
    LDA ram_spr_index_1
    CLC
    ADC #$08
    STA ram_spr_index_1
    CLC
    ADC #$04
    STA ram_spr_index_2
    LDA #$01
    STA ram_0007_t06_sprites_counter
    LDA #$08
    STA ram_000A_t13_spr_X
    LDA ram_0000_t21_spr_X
    PHA
    JSR sub_bat_7885
    TAX
    PLA
    STA ram_0000_t21_spr_X
    LDY ram_0004_t14
    LDA ram_current_quest,Y
    BEQ bra_A68F_1st_quest
; if 2nd quest
    LDY ram_spr_index_1
    LDA ram_0001_t15_spr_Y
    SEC
    SBC #$03
    STA ram_spr_Y + $80,Y
    LDA #$20
    STA ram_spr_T + $80,Y
    LDA #$03
    STA ram_spr_A + $80,Y
    LDA ram_0000_t21_spr_X
    CLC
    ADC #$0C
    STA ram_spr_X + $80,Y
bra_A68F_1st_quest:
    LDA ram_0001_t15_spr_Y
    CLC
    ADC #$18
    STA ram_0001_t15_spr_Y
    INC ram_0004_t14
    INC ram_0004_t14 + $01
    LDA ram_0004_t14
    CMP #$03
    BNE bra_A64A_loop
    RTS



tbl_A6A1_hearts_slot_address_lo:
    .byte < ram_slot_hearts   ; save slot 1
    .byte < (ram_slot_hearts + $02)   ; save slot 2
    .byte < (ram_slot_hearts + $04)   ; save slot 3



tbl_A6A4_hearts_slot_address_hi:
    .byte > ram_slot_hearts   ; save slot 1
    .byte > (ram_slot_hearts + $04)   ; save slot 2
    .byte > (ram_slot_hearts + $04)   ; save slot 3



tbl_A6A7_slot_name_address_lo:
    .byte < ram_slot_name   ; save slot 1
    .byte < (ram_slot_name + $08)   ; save slot 2
    .byte < (ram_slot_name + $10)   ; save slot 3



tbl_A6AA_slot_name_address_hi:
    .byte > ram_slot_name   ; save slot 1
    .byte > (ram_slot_name + $08)   ; save slot 2
    .byte > (ram_slot_name + $10)   ; save slot 3



ofs_main_script_2_0x00A6BD_0D:
; con_script_0D
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_011_A6B8_00
    .word ofs_011_A734_01
    .word ofs_011_A803_02



ofs_011_A6B8_00:
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A437
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    LDY #$27
bra_A6C6_loop:  ; items 0657-067E
    LDA ram_items,Y
    STA (ram_00C0_t01_data),Y    ; 68C0-690F
    DEY
    BPL bra_A6C6_loop
    LDY ram_current_save_slot
    LDA ram_death_cnt,Y
    LDY #$00
    STA (ram_00CA_t01_data),Y    ; 6D97 6D98
    LDA #$01
    STA (ram_00C6_t01_data),Y    ; 6D91 6D92
    LDY ram_current_save_slot
    STA ram_slot_active_flag,Y
    LDA ram_current_quest,Y
    LDY #$00
    STA (ram_00CC_t01_data),Y    ; 6D9A 6D9B
    JSR sub_A80C_prepare_slot_name_address
    LDY #$07
bra_A6EC_loop:
    LDA (ram_000C_t02_slot_name_data),Y    ; 0640-064F
    STA (ram_00C4_t01_data),Y    ; 6888-6897
    DEY
    BPL bra_A6EC_loop
    LDA ram_item_hearts
    AND #$F0
    PHA
; / 10
    LSR
    LSR
    LSR
    LSR
    STA ram_000A_t02
    PLA
    ORA ram_000A_t02
    STA ram_item_hearts
    LDA #$FF
    STA ram_item_hearts + $01
    JSR sub_A819_save_hearts_amount
    LDY #$00
bra_A70F_loop:
    LDA (ram_000E_t04_data),Y    ; 067F-07FE
    STA (ram_00C2_t01_data),Y    ; 6A90-6D8F
    INC ram_00C2_t01_data
    BNE bra_A719_not_overflow
    INC ram_00C2_t01_data + $01
bra_A719_not_overflow:
    INC ram_000E_t04_data
    BNE bra_A71F_not_overflow
    INC ram_000E_t04_data + $01
bra_A71F_not_overflow:
    LDA ram_000E_t04_data
    CMP #< $07FF
    BNE bra_A70F_loop
    LDA ram_000E_t04_data + $01
    CMP #> $07FF
    BNE bra_A70F_loop
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A3C8
    INC ram_subscript
    RTS



ofs_011_A734_01:
    LDY ram_current_save_slot
    LDA ram_652A_slot,Y
    BNE bra_A757
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_A3E1
    LDA ram_current_save_slot
    ASL
    TAY
    LDA ram_6D9C,Y
    CMP ram_00CE
    BNE bra_A75A
    INY
    LDA ram_6D9D - $01,Y
    CMP ram_00CF
    BNE bra_A75A
    JSR sub_A764
bra_A757:
    INC ram_subscript
    RTS
bra_A75A:
    LDY ram_current_save_slot
    LDA #$FF
    STA ram_652A_slot,Y
    INC ram_subscript
    RTS



sub_A764:
    LDY ram_current_save_slot
    LDA #$00
    STA ram_slot_valid_1,Y
    STA ram_slot_valid_2,Y
    TYA
    ASL
    TAY
    LDA #$00
    STA ram_6524,Y
    INY
    STA ram_6525 - $01,Y
    JSR sub_9D2A_prepare_save_slot_addresses
    JSR sub_bat_6FD1_prepare_save_slot_addresses
    LDY #$27
bra_A782_loop:
    LDA (ram_00C0_t01_data),Y
    STA (ram_0000_t19_data),Y
    DEY
    BPL bra_A782_loop
    LDY #$00
    LDA (ram_00C6_t01_data),Y
    STA (ram_0006_t01_data),Y
    LDA (ram_00C8_t01_data),Y
    STA (ram_0008_t03_data),Y
    LDA (ram_00CA_t01_data),Y
    STA (ram_000A_t01_data),Y
    LDA (ram_00CC_t01_data),Y
    STA (ram_000C_t01_data),Y
    LDA (ram_0006_t01_data),Y
    PHA
    LDA (ram_000A_t01_data),Y
    PHA
    LDA (ram_000C_t01_data),Y
    PHA
    LDY ram_current_save_slot
    PLA
    STA ram_current_quest,Y
    PLA
    STA ram_death_cnt,Y
    PLA
    STA ram_slot_active_flag,Y
    LDY #$07
bra_A7B4_loop:
    LDA (ram_00C4_t01_data),Y
    STA (ram_0004_t02_slot_name_data),Y
    DEY
    BPL bra_A7B4_loop
    LDY #$00
bra_A7BD_loop:
    LDA (ram_00C2_t01_data),Y
    STA (ram_0002_t03_data),Y
    INC ram_0002_t03_data
    BNE bra_A7C7_not_overflow
    INC ram_0002_t03_data + $01
bra_A7C7_not_overflow:
    INC ram_00C2_t01_data
    BNE bra_A7CD_not_overflow
    INC ram_00C2_t01_data + $01
bra_A7CD_not_overflow:
    INC ram_000E_t04_data
    BNE bra_A7D3
    INC ram_000E_t04_data + $01
bra_A7D3:
    LDA ram_000E_t04_data
    CMP #< $07FF
    BNE bra_A7BD_loop
    LDA ram_000E_t04_data + $01
    CMP #> $07FF
    BNE bra_A7BD_loop
    LDY ram_current_save_slot
    LDA #$5A
    STA ram_slot_valid_1,Y
    LDA #$A5
    STA ram_slot_valid_2,Y
    TYA
    ASL
    TAY
    LDA ram_6D9C,Y
    STA ram_6524,Y
    INY
    LDA ram_6D9D - $01,Y
    STA ram_6525 - $01,Y
    LDY ram_current_save_slot
    LDA #$FF
    STA ram_652A_slot,Y
    RTS



loc_A803:
ofs_011_A803_02:
    LDA #con_script_title_screen
    STA ram_script
    LDA #$01
    STA ram_subscript
    RTS



sub_A80C_prepare_slot_name_address:
; out
    ; ram_000C_t02_slot_name_data
    LDY ram_current_save_slot
    LDA tbl_A6A7_slot_name_address_lo,Y
    STA ram_000C_t02_slot_name_data
    LDA tbl_A6AA_slot_name_address_hi,Y
    STA ram_000C_t02_slot_name_data + $01
    RTS



sub_A819_save_hearts_amount:
    LDY ram_current_save_slot
    LDA tbl_A6A1_hearts_slot_address_lo,Y
    STA ram_000C_t03_data
    LDA tbl_A6A4_hearts_slot_address_hi,Y
    STA ram_000C_t03_data + $01
    LDY #$01
bra_A827_loop:
    LDA ram_item_hearts,Y
    STA (ram_000C_t03_data),Y
    DEY
    BPL bra_A827_loop
    RTS


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



loc_0x00A910_final_credits_handler:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_final_credits_A90F_00
    .word ofs_final_credits_A93F_01_prepare_nametable_attributes
    .word ofs_final_credits_A97F_02_thanks_link
    .word ofs_final_credits_A9F5_03
    .word ofs_final_credits_A9FF_04



ofs_final_credits_A90F_00:
    JSR sub_A921_close_curtain
    LDA ram_subscript
    BEQ bra_A958_RTS
; if curtain is closed
    JSR sub_0x01E607_hide_all_sprites
    JSR sub_0x01F241
    LDX #$01
    JMP loc_bat_79CA



sub_A921_close_curtain:
    LDA ram_timer_link
    BNE bra_A939_RTS
    LDA ram_0609_music
    BNE bra_A939_RTS
    JSR sub_bat_7240_curtain_movement_handler
    LDA ram_007C
    CMP #$11
    BCS bra_A939_RTS
    LDA #$80
    STA ram_timer_link
    INC ram_subscript   ; -> 01
bra_A939_RTS:
    RTS



tbl_A93A_nametable_attributes:
    .dbyt $23D8 ; ppu address
    .byte $68   ; 
    .byte $00   ; 
    .byte $FF   ; end token



ofs_final_credits_A93F_01_prepare_nametable_attributes:
    LDY #$04
bra_A941_loop:
    LDA tbl_A93A_nametable_attributes,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_A941_loop
    LDA #$A4
    STA ram_045E_enemy + $01
    LDA #$00
    STA ram_0416
    STA ram_state_obj + $01
    INC ram_subscript
bra_A958_RTS:
    RTS



tbl_A959_text_thanks_link:
; THANKS LINK,YOU'RE THE HERO OF HURULE.
    .byte $1D, $11, $0A, $17, $14, $1C, $24, $15, $12, $17, $14, $28, $22, $18, $1E, $2A, $1B, $0E + $80   ; 
    .byte $64, $1D, $11, $0E, $24, $11, $0E, $1B, $18, $24, $18, $0F, $24, $11, $22, $1B, $1E, $15, $0E, $2C + $C0   ; 



ofs_final_credits_A97F_02_thanks_link:
    JSR sub_A995_print_thanks_link
    LDA ram_state_obj + $01
    BEQ bra_A98C_RTS
    LDA #$50
    STA ram_timer_enemy + $01
    INC ram_subscript
bra_A98C_RTS:
    RTS



tbl_A98D:
    .byte $21   ; 00 
    .byte $A4   ; 01 
    .byte $01   ; 02 
    .byte $24   ; 03 
    .byte $FF   ; 04 



tbl_A992_ppu_lo:
    .byte $C4   ; 00 
    .byte $E4   ; 01 
    .byte $A4   ; 02 



sub_A995_print_thanks_link:
    JSR sub_0x01F241
; bzk optimize, code is similar to 0x004828
    LDA ram_timer_enemy + $01
    BNE bra_A9F4_RTS
    LDA #$06
    STA ram_timer_enemy + $01
    LDY #$04
bra_A9A2_loop:
    LDA tbl_A98D,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_A9A2_loop
bra_A9AB_loop:
    LDA ram_045E_enemy + $01
    STA ram_0302_ppu_buffer + $01
    INC ram_045E_enemy + $01
    LDA #< tbl_A959_text_thanks_link
    STA ram_0000_t15_text_thanks_link_data
    LDA #> tbl_A959_text_thanks_link
    STA ram_0000_t15_text_thanks_link_data + $01
    LDY ram_0416
    INC ram_0416
    LDA (ram_0000_t15_text_thanks_link_data),Y
    AND #$3F
    CMP #$25    ; skip to next position control byte
; bzk optimize, is it necessary to update message pointers in a loop?
    BEQ bra_A9AB_loop
    STA ram_0302_ppu_buffer + $03
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
    LDA (ram_0000_t15_text_thanks_link_data),Y
    AND #$C0
    BEQ bra_A9F4_RTS
    LDY #$02
    CMP #$C0
    BEQ bra_A9E4    ; if message end
    DEY ; 01
    CMP #$40
    BEQ bra_A9E4    ; if new line 2
    DEY ; 00        ; if new line 1
bra_A9E4:
    LDA tbl_A992_ppu_lo,Y
    STA ram_045E_enemy + $01
    CPY #$02
    BNE bra_A9F4_RTS
    INC ram_state_obj + $01
    LDA #con_obj_state_00
    STA ram_state_link
bra_A9F4_RTS:
    RTS



ofs_final_credits_A9F5_03:
    LDA ram_timer_enemy + $01
    BNE bra_A9F4_RTS
    JSR sub_bat_6EE9
    INC ram_subscript
    RTS



ofs_final_credits_A9FF_04:
    LDA #$08
    STA ram_050B
    JSR sub_bat_6C90
; A = 00
    STA ram_0412
    STA ram_0413
    JMP loc_0x01E607_hide_all_sprites



ofs_main_script_2_0x00AA20_13_final_credits:
; con_script_final_credits
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_013_AA23_00
    .word ofs_013_AAA9_01
    .word ofs_013_AAA9_02
    .word ofs_013_ABC4_03
    .word ofs_013_AB7F_04_preparations_for_2nd_quest



tbl_AA1F:
    .byte $0F   ; 00 
    .byte $12   ; 01 
    .byte $16   ; 02 
    .byte $2A   ; 03 



ofs_013_AA23_00:
    JSR sub_0x01E607_hide_all_sprites
    INC ram_0506
    LDA ram_0506
    CMP #$C0
    BEQ bra_AA50
    JSR sub_AA62
loc_AA33:
    LDX ram_0506
    CPX #$40
    BCC bra_AA4F_RTS
    LDY #$23
bra_AA3C_loop:
    LDA ram_6B7E_palette_buffer,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_AA3C_loop
    TXA
    AND #$03
    TAX
    LDA tbl_AA1F,X
    STA ram_0302_ppu_buffer + $13
bra_AA4F_RTS:
    RTS
bra_AA50:
    LDA #con_music_credits
    STA ram_music
    LDA #$40
    STA ram_timer_link
    LDA #$40
    STA ram_004D
    INC ram_subscript
    JMP loc_AA33



sub_AA62:
    LDA ram_pos_X_link
    STA ram_0083
    LDA ram_pos_Y_link
    SEC
    SBC #$10
    STA ram_0097
    LDX #$00
    JSR sub_0x01FAA3
; A = 00
    JSR sub_bat_7988_set_spr_A
    STA ram_000C_t06_table_offset
    LDA #$48
    STA ram_spr_index_1
    LDA #$4C
    STA ram_spr_index_2
    LDY #$21
    JSR sub_bat_792C
    LDA #con_drop_id_1B
    LDX #$13
    JSR sub_0x01E71E
    LDX #$01
    JSR sub_0x01FAA3
    TXA
    JSR sub_bat_77DB
    LDA ram_pos_X_enemy + $01
    STA ram_pos_X_enemy + $02
    LDA ram_pos_Y_enemy + $01
    SEC
    SBC #$10
    STA ram_pos_Y_enemy + $02
    LDX #$02
    LDA #con_drop_id_1B
; bzk optimize, JMP
    JSR sub_0x01E71E
    RTS



ofs_013_AAA9_01:
ofs_013_AAA9_02:
    LDA ram_004D
    BEQ bra_AAC7
    JSR sub_0x01E607_hide_all_sprites
    LDA ram_004D
    CMP #$04
    BCC bra_AAC6_RTS
    JSR sub_AA62
    LDA ram_subscript
    CMP #$01
    BNE bra_AAC6_RTS
    LDA ram_timer_link
    BNE bra_AAC6_RTS
; bzk optimize, JMP
    JSR sub_AB3C
bra_AAC6_RTS:
    RTS
bra_AAC7:
    LDA #con_ppu_buf_6A
    STA ram_ppu_load_index
    INC ram_subscript
    RTS



tbl_AACE:
    .byte $22   ; 00 
    .byte $A4   ; 01 
    .byte $01   ; 02 
    .byte $24   ; 03 
    .byte $FF   ; 04 



tbl_AAD3:
    .byte $AC   ; 
    .byte $AD   ; 
    .byte $AE   ; 
    .byte $AF   ; 
    .byte $B0   ; 
    .byte $B1   ; 
    .byte $B2   ; 
    .byte $B3   ; 
    .byte $E4   ; 
    .byte $E5   ; 
    .byte $E6   ; 
    .byte $E7   ; 
    .byte $E8   ; 
    .byte $E9   ; 
    .byte $EA   ; 
    .byte $EB   ; 
    .byte $EC   ; 
    .byte $ED   ; 
    .byte $EE   ; 
    .byte $EF   ; 
    .byte $F0   ; 
    .byte $F1   ; 
    .byte $F2   ; 
    .byte $F3   ; 
    .byte $F4   ; 
    .byte $F5   ; 
    .byte $F6   ; 
    .byte $F7   ; 
    .byte $F8   ; 
    .byte $F9   ; 
    .byte $FA   ; 
    .byte $FB   ; 
    .byte $46   ; 
    .byte $47   ; 
    .byte $48   ; 
    .byte $49   ; 
    .byte $4A   ; 
    .byte $4B   ; 
    .byte $4C   ; 
    .byte $4D   ; 
    .byte $4E   ; 
    .byte $4F   ; 
    .byte $50   ; 
    .byte $51   ; 
    .byte $52   ; 
    .byte $53   ; 
    .byte $54   ; 
    .byte $55   ; 
    .byte $56   ; 
    .byte $57   ; 
    .byte $58   ; 
    .byte $59   ; 



tbl_AB07:
    .byte $0F   ; 
    .byte $12   ; 
    .byte $17   ; 
    .byte $0A   ; 
    .byte $15   ; 
    .byte $15   ; 
    .byte $22   ; 
    .byte $28   ; 
    .byte $19   ; 
    .byte $0E   ; 
    .byte $0A   ; 
    .byte $0C   ; 
    .byte $0E   ; 
    .byte $24   ; 
    .byte $1B   ; 
    .byte $0E   ; 
    .byte $1D   ; 
    .byte $1E   ; 
    .byte $1B   ; 
    .byte $17   ; 
    .byte $1C   ; 
    .byte $24   ; 
    .byte $1D   ; 
    .byte $18   ; 
    .byte $24   ; 
    .byte $11   ; 
    .byte $22   ; 
    .byte $1B   ; 
    .byte $1E   ; 
    .byte $15   ; 
    .byte $0E   ; 
    .byte $2C   ; 
    .byte $1D   ; 
    .byte $11   ; 
    .byte $12   ; 
    .byte $1C   ; 
    .byte $24   ; 
    .byte $0E   ; 
    .byte $17   ; 
    .byte $0D   ; 
    .byte $1C   ; 
    .byte $24   ; 
    .byte $1D   ; 
    .byte $11   ; 
    .byte $0E   ; 
    .byte $24   ; 
    .byte $1C   ; 
    .byte $1D   ; 
    .byte $18   ; 
    .byte $1B   ; 
    .byte $22   ; 
    .byte $2C   ; 
    .byte $FF   ; 



sub_AB3C:
    INC ram_0412
    LDA ram_0412
    AND #$07
    CMP #$04
    BNE bra_AB7B_RTS
    LDY #$04
bra_AB4A_loop:
    LDA tbl_AACE,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_AB4A_loop
    LDY ram_0413
    LDA tbl_AB07,Y
    CMP #$FF
    BEQ bra_AB7C
    STA ram_0302_ppu_buffer + $03
    CMP #$24
    BEQ bra_AB69
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
bra_AB69:
    INC ram_0413
    LDA tbl_AAD3,Y
    STA ram_0302_ppu_buffer + $01
    CMP #$A0
    BCS bra_AB7B_RTS
    LDA #$23
    STA ram_0302_ppu_buffer
bra_AB7B_RTS:
    RTS
bra_AB7C:
    INC ram_subscript
bra_AB7E_RTS:
    RTS



ofs_013_AB7F_04_preparations_for_2nd_quest:
    JSR sub_0x01E607_hide_all_sprites
    LDX #$02
    LDA #$78
    STA ram_pos_X_enemy,X
    LDA #$88
    STA ram_pos_Y_enemy,X
    LDA #con_drop_id_0E
    JSR sub_0x01E71E
    LDX #$02
    LDA #con_obj_id_3E
    STA ram_obj_id_enemy - $01,X
    JSR sub_ABB8
    LDA ram_timer_link
    BNE bra_AB7E_RTS
    LDA ram_btn_press
    AND #con_btn_Start
    BEQ bra_AB7E_RTS
    JSR sub_0x01EBB3_clear_subscript
    LDA #con_script_0D
    STA ram_script
    JSR sub_0x01E635_disable_rendering_and_nmi
    JSR sub_0x01E47D_clear_screen
    JSR sub_bat_6EE9
    JMP loc_AF5A_clear_0657_07FE



sub_ABB8:
    JSR sub_0x01FAA3
    LDA #$0B
    JMP loc_bat_77DF



tbl_ABC0:
    .byte $02   ; 00 
    .byte $03   ; 01 



tbl_ABC2:
    .byte $78   ; 00 
    .byte $00   ; 01 



ofs_013_ABC4_03:
    LDA ram_050B
    CMP #$08
    BMI bra_ABD6
    LDA ram_050B
    SBC #$08
    STA ram_050B
    JSR sub_AE13_print_final_credits
bra_ABD6:
    LDA ram_0058_ppu_addr_hi
    CLC
    ADC #$80
    STA ram_0058_ppu_addr_hi
    BCC bra_ABE2
    INC ram_050B
bra_ABE2:
    LDA ram_scroll_Y
    ADC #$00
    STA ram_scroll_Y
    CMP #$F0
    LDA #$00
    BCC bra_ABF3
    STA ram_scroll_Y
    INC a: ram_00E2_ppu_addr_lo
bra_ABF3:
    ROL
    STA ram_005C
    LDY #$00
    LDX ram_current_save_slot
    LDA ram_current_quest,X
    BEQ bra_AC00_1st_quest
; if 2nd quest
    INY
bra_AC00_1st_quest:
    LDA a: ram_00E2_ppu_addr_lo
    CMP tbl_ABC0,Y
    BCC bra_AC15_RTS
    LDA ram_scroll_Y
    CMP tbl_ABC2,Y
    BCC bra_AC15_RTS
    INC ram_subscript
    LDA #$40
    STA ram_timer_link
bra_AC15_RTS:
    RTS



tbl_AC16_ppu_address_hi:
    .byte $28   ; 00 
    .byte $29   ; 01 
    .byte $2A   ; 02 
    .byte $2B   ; 03 
    .byte $20   ; 04 
    .byte $21   ; 05 
    .byte $22   ; 06 
    .byte $23   ; 07 
    .byte $28   ; 08 
    .byte $29   ; 09 
    .byte $2A   ; 0A 
    .byte $2B   ; 0B 



tbl_AC22:
    .byte $46   ; 00 
    .byte $10   ; 01 
    .byte $90   ; 02 
    .byte $84   ; 03 
    .byte $24   ; 04 
    .byte $30   ; 05 
    .byte $01   ; 06 
    .byte $48   ; 07 
    .byte $03   ; 08 
    .byte $25   ; 09 
    .byte $05   ; 0A 
    .byte $40   ; 0B 



tbl_AC2E_lo:
    .byte < _off003_AC5C_00   ; 
    .byte < _off003_AC65_01   ; 
    .byte < _off003_AC70_02   ; 
    .byte < _off003_AC88_03   ; 
    .byte < _off003_ACA0_04   ; 
    .byte < _off003_ACB8_05   ; 
    .byte < _off003_ACC8_06   ; 
    .byte < _off003_ACE0_07   ; 
    .byte < _off003_ACF8_08   ; 
    .byte < _off003_AD06_09   ; 
    .byte < _off003_AD14_0A   ; 
    .byte < _off003_AD1B_0B   ; 
    .byte < _off003_AD33_0C   ; 
    .byte < _off003_AD4D_0D   ; 
    .byte < _off003_AD59_0E   ; 
    .byte < _off003_AD72_0F   ; 
    .byte < _off003_AD82_10   ; 
    .byte < _off003_AD92_11   ; 
    .byte < _off003_ADA1_12   ; 
    .byte < _off003_ADB6_13   ; 
    .byte < _off003_ADC9_14   ; 
    .byte < _off003_ADD1_15   ; 
    .byte < _off003_ADEA_16   ; 



tbl_AC45_hi:
    .byte > _off003_AC5C_00   ; 
    .byte > _off003_AC65_01   ; 
    .byte > _off003_AC70_02   ; 
    .byte > _off003_AC88_03   ; 
    .byte > _off003_ACA0_04   ; 
    .byte > _off003_ACB8_05   ; 
    .byte > _off003_ACC8_06   ; 
    .byte > _off003_ACE0_07   ; 
    .byte > _off003_ACF8_08   ; 
    .byte > _off003_AD06_09   ; 
    .byte > _off003_AD14_0A   ; 
    .byte > _off003_AD1B_0B   ; 
    .byte > _off003_AD33_0C   ; 
    .byte > _off003_AD4D_0D   ; 
    .byte > _off003_AD59_0E   ; 
    .byte > _off003_AD72_0F   ; 
    .byte > _off003_AD82_10   ; 
    .byte > _off003_AD92_11   ; 
    .byte > _off003_ADA1_12   ; 
    .byte > _off003_ADB6_13   ; 
    .byte > _off003_ADC9_14   ; 
    .byte > _off003_ADD1_15   ; 
    .byte > _off003_ADEA_16   ; 



_off003_AC5C_00:
    .byte $07   ; counter
    .byte $0D   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                  $24, $1C, $1D   ; 
    .byte $0A, $0F, $0F, $24   ; 



_off003_AC65_01:
    .byte $09   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0E, $21, $0E, $0C, $1E, $1D, $12, $1F, $0E   ; 



_off003_AC70_02:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $19, $1B, $18, $0D, $1E, $0C, $0E, $1B, $63, $63, $63   ; 
    .byte $24, $11, $63, $22, $0A, $16, $0A, $1E, $0C, $11, $12   ; 



_off003_AC88_03:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $19, $1B, $18, $0D, $1E, $0C, $0E, $1B, $63, $63, $63   ; 
    .byte $63, $24, $1C, $63, $16, $12, $22, $0A, $11, $18, $17   ; 



_off003_ACA0_04:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0D, $12, $1B, $0E, $0C, $1D, $18, $1B, $63, $63, $63   ; 
    .byte $63, $24, $1C, $63, $16, $12, $22, $0A, $11, $18, $17   ; 



_off003_ACB8_05:
    .byte $0E   ; counter
    .byte $0D   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                  $63, $63, $63   ; 
    .byte $63, $63, $63, $24, $1D, $0E, $17, $24, $1D, $0E, $17   ; 



_off003_ACC8_06:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0D, $0E, $1C, $12, $10, $17, $0E, $1B, $63, $63, $63   ; 
    .byte $63, $63, $63, $24, $1D, $0E, $17, $24, $1D, $0E, $17   ; 



_off003_ACE0_07:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $19, $1B, $18, $10, $1B, $0A, $16, $16, $0E, $1B, $63   ; 
    .byte $63, $24, $1D, $63, $17, $0A, $14, $0A, $23, $18, $18   ; 



_off003_ACF8_08:
    .byte $0C   ; counter
    .byte $0F   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                            $63   ; 
    .byte $63, $63, $63, $63, $24, $22, $0A, $0C, $11, $0A, $17   ; 



_off003_AD06_09:
    .byte $0C   ; counter
    .byte $0F   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                            $63   ; 
    .byte $63, $63, $24, $16, $0A, $1B, $1E, $16, $0A, $1B, $1E   ; 



_off003_AD14_0A:
    .byte $05   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $1C, $18, $1E, $17, $0D   ; 



_off003_AD1B_0B:
    .byte $16   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $0C, $18, $16, $19, $18, $1C, $0E, $1B, $63, $63, $63   ; 
    .byte $63, $63, $63, $24, $14, $18, $17, $0C, $11, $0A, $17   ; 



_off003_AD33_0C:
    .byte $18   ; counter
    .byte $04   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $0A, $17, $18, $1D, $11, $0E, $1B, $24, $1A, $1E, $0E, $1C   ; 
    .byte $1D, $24, $20, $12, $15, $15, $24, $1C, $1D, $0A, $1B, $1D   ; 



_off003_AD4D_0D:
    .byte $0A   ; counter
    .byte $0B   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                        $0F, $1B, $18, $16, $24   ; 
    .byte $11, $0E, $1B, $0E, $2C   ; 



_off003_AD59_0E:
    .byte $17   ; counter
    .byte $05   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                          $19, $1B, $0E, $1C, $1C, $24, $1D, $11, $0E, $24, $1C   ; 
    .byte $1D, $0A, $1B, $1D, $24, $0B, $1E, $1D, $1D, $18, $17, $2C   ; 



_off003_AD72_0F:
    .byte $0E   ; counter
    .byte $09   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $FC, $01, $09, $08, $06, $24, $17   ; 
    .byte $12, $17, $1D, $0E, $17, $0D, $18   ; 



_off003_AD82_10:
    .byte $0E   ; counter
    .byte $09   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $22, $18, $1E, $24, $0A, $1B, $0E   ; 
    .byte $24, $10, $1B, $0E, $0A, $1D, $63   ; 



_off003_AD92_11:
    .byte $0D   ; counter
    .byte $09   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $62, $24, $24, $24   ; 



_off003_ADA1_12:
    .byte $13   ; counter
    .byte $06   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                               $22, $18, $1E, $24, $11, $0A, $1F, $0E, $24, $0A   ; 
    .byte $17, $24, $0A, $16, $0A, $23, $12, $17, $10   ; 



_off003_ADB6_13:
    .byte $11   ; counter
    .byte $08   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                         $20, $12, $1C, $0D, $18, $16, $24, $0A   ; 
    .byte $17, $0D, $24, $19, $18, $20, $0E, $1B, $63   ; 



_off003_ADC9_14:
    .byte $06   ; counter
    .byte $0D   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                                                  $0E, $17, $0D   ; 
    .byte $24, $18, $0F   ; 



_off003_ADD1_15:
    .byte $17   ; counter
    .byte $04   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                     $2D, $1D, $11, $0E, $24, $15, $0E, $10, $0E, $17, $0D, $24   ; 
    .byte $18, $0F, $24, $23, $0E, $15, $0D, $0A, $24, $01, $2D   ; 



_off003_ADEA_16:
    .byte $0E   ; counter
    .byte $09   ; ppu offset
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte                                              $FC, $01, $09, $08, $06, $24, $17   ; 
    .byte $12, $17, $1D, $0E, $17, $0D, $18   ; 



tbl_ADFA:
    .byte $00   ; 00 
    .byte $AA   ; 01 
    .byte $FF   ; 02 
    .byte $FF   ; 03 
    .byte $55   ; 04 
    .byte $AA   ; 05 
    .byte $AA   ; 06 
    .byte $FF   ; 07 
    .byte $FF   ; 08 
    .byte $FF   ; 09 
    .byte $55   ; 0A 
    .byte $00   ; 0B 
    .byte $00   ; 0C 
    .byte $00   ; 0D 
    .byte $00   ; 0E 
    .byte $00   ; 0F 
    .byte $00   ; 10 
    .byte $00   ; 11 
    .byte $50   ; 12 
    .byte $00   ; 13 
    .byte $00   ; 
    .byte $00   ; 
    .byte $AA   ; 
    .byte $00   ; 
    .byte $00   ; 



sub_AE13_print_final_credits:
    LDY #$1F
    LDA #$24
bra_AE17_loop:
    STA ram_0302_ppu_buffer + $03,Y
    DEY
    BPL bra_AE17_loop
    LDA ram_050A
    BEQ bra_AE3E
    CMP #$01
    BEQ bra_AE2C
    CMP #$2E
    BCC bra_AE36
    BNE bra_AE3E
bra_AE2C:
    LDY #$19
    LDA #$FA
bra_AE30_loop:
    STA ram_0302_ppu_buffer + $06,Y
    DEY
    BPL bra_AE30_loop
bra_AE36:
    LDA #$FA
    STA ram_0302_ppu_buffer + $06
    STA ram_0302_ppu_buffer + $1F
bra_AE3E:
    LDA #$FF
    STA ram_0302_ppu_buffer + $23
    STA ram_0302_ppu_buffer + $2E
    LDA #$20
    STA ram_0302_ppu_buffer + $02
    LDX ram_050C
    LDA tbl_AC16_ppu_address_hi,X
    STA ram_0302_ppu_buffer
    LDA ram_050D
    TAY
; * 20
    ASL
    ASL
    ASL
    ASL
    ASL
    STA ram_0302_ppu_buffer + $01
    LDA tbl_AC22,X
bra_AE63_loop:
    ASL
    DEY
    BPL bra_AE63_loop
    BCC bra_AEE2
    LDY ram_050E_counter
    CPY #$17
    BCS bra_AEE2
    LDX ram_current_save_slot
    LDA ram_current_quest,X
    BNE bra_AE7B    ; if 2nd quest
; if 1st quest
    CPY #$10
    BCS bra_AEDF
bra_AE7B:
    LDX ram_current_save_slot
    LDA ram_current_quest,X
    BEQ bra_AE8A    ; if 1st quest
; if 2nd quest
    CPY #$0C
    BCC bra_AE8A
    CPY #$10
    BCC bra_AEDF
bra_AE8A:
    LDA tbl_AC2E_lo,Y
    STA ram_0000_t1A_data
    LDA tbl_AC45_hi,Y
    STA ram_0000_t1A_data + $01
    LDY #$00
    LDA (ram_0000_t1A_data),Y
    STA ram_0002_t22_loop_counter
    INY ; 01
    LDA (ram_0000_t1A_data),Y
    TAX
    INY ; 02
bra_AE9F_loop:
    LDA (ram_0000_t1A_data),Y
    STA ram_0302_ppu_buffer + $03,X
    INY
    INX
    DEC ram_0002_t22_loop_counter
    BNE bra_AE9F_loop
    LDY ram_050E_counter
    CPY #$0C
    BCC bra_AEDF
    CPY #$11
    BNE bra_AEDF
    LDA ram_current_save_slot
; * 08
    ASL
    ASL
    ASL
    TAY
    LDX #$00
bra_AEBD_loop:
    LDA ram_slot_name,Y
    STA ram_0302_ppu_buffer + $0C,X
    INY
    INX
    CPX #$08
    BCC bra_AEBD_loop
    LDY a: ram_current_save_slot
    LDA ram_death_cnt,Y
    JSR sub_bat_6E55_convert_to_decimal
    LDX #$02
bra_AED4_loop:
    LDA ram_0001_t04_decimal,X
    STA ram_0302_ppu_buffer + $16,X
    DEX
    BPL bra_AED4_loop
; bzk optimize, useless LDY
    LDY ram_050E_counter
bra_AEDF:
    INC ram_050E_counter
bra_AEE2:
    INC ram_050D
    LDA ram_050C
    AND #$03
    CMP #$03
    LDA #$08
    BCC bra_AEF2
    LDA #$06
bra_AEF2:
    CMP ram_050D
    BNE bra_AF08
    LDA #$00
    STA ram_050D
    LDY ram_050C
    INY
    CPY #$0C
    BCC bra_AF05
    TAY
bra_AF05:
    STY ram_050C
bra_AF08:
    LDA ram_050A
    LSR
    BCS bra_AF43
    LSR
    BCS bra_AF43
    LDX #$00
    STX ram_0302_ppu_buffer + $26
    STX ram_0302_ppu_buffer + $2D
    TAY
    LDA tbl_ADFA,Y
    LDY #$05
bra_AF1F_loop:
    STA ram_0302_ppu_buffer + $27,Y
    DEY
    BPL bra_AF1F_loop
    LDY #$23
    LDA ram_0302_ppu_buffer
    AND #$08
    BEQ bra_AF30
    LDY #$2B
bra_AF30:
    STY ram_0302_ppu_buffer + $23
    LDA ram_050A
    AND #$1F
    ASL
    ADC #$C0
    STA ram_0302_ppu_buffer + $24
    LDA #$08
    STA ram_0302_ppu_buffer + $25
bra_AF43:
    LDY ram_050A
    INY
    TYA
    AND #$1F
    CMP #$1E
    BCC bra_AF50
    INY
    INY
bra_AF50:
    STY ram_050A
    RTS



tbl_AF54:
    .word ram_067F  ; clear 067F-06FE
    .word ram_06FF  ; clear 06FF-077E
    .word ram_077F  ; clear 077F-07FE



loc_AF5A_clear_0657_07FE:
    LDX #$04
bra_AF5C_loop:  ; clear 067F-07FE
    LDA tbl_AF54,X
    STA ram_0000_t00_data
    LDA tbl_AF54 + $01,X
    STA ram_0000_t00_data + $01
    LDY #$7F
    LDA #$00
bra_AF6A_loop:
    STA (ram_0000_t00_data),Y
    DEY
    BPL bra_AF6A_loop
    DEX
    DEX
    BPL bra_AF5C_loop
    LDY #$27
bra_AF75_loop:  ; clear items 0657-067E
    STA ram_items,Y
    DEY
    BPL bra_AF75_loop
    LDA #$22
    STA ram_item_hearts
    DEC ram_item_hearts + $01    ; FF
    LDA #$08
    STA ram_item_max_bombs
    LDY ram_current_save_slot
    LDA #$01
    STA ram_current_quest,Y
    RTS


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
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



.segment "BANK_02i"
.include "copy_bank___BF50_BFF9.asm"



.out .sprintf("Free bytes in bank 02: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))



.segment "VECTORS_02"
    .word vec_0x01E494_NMI
    .word vec_inc_0x003F60_RESET
    .word $BFF0 ; this game doesn't use IRQ
