; .segment "BANK_01_s2"
; .include "copy_bank_ram.inc"
; .include "copy_bank_val.inc"
; 0x006510-0x00777F

; SRAM_2 (from bank_01)

.org $6C90



.export ofs_bat_6C90_bank_s2_asm_import
.export sub_bat_6C90
.export loc_bat_6C90
.export loc_bat_6CC0_count_rupees_and_update_hud_info
.export sub_bat_6D00_update_hud_info
.export sub_bat_6D7C_set_sfx_1
.export sub_bat_6D80_set_sfx_3
.export loc_bat_6D80_set_sfx_3
.export ofs_038_bat_6D89_07
.export ofs_039_bat_6D89_07
.export sub_bat_6DB7_clear_special_metatile_addresses
.export tbl_bat_6DC3_direction
.export sub_bat_6FD1_prepare_save_slot_addresses
.export sub_bat_6E10
.export sub_bat_6E1D
.export sub_bat_6E36_increase_counter_00_27
.export sub_bat_6E40_clear_counter_00_27
.export sub_bat_6E46
.export sub_bat_6E55_convert_to_decimal
.export sub_bat_6E79
.export sub_bat_6EE9
.export loc_bat_6EE9
.export tbl_bat_6EF9
.export sub_bat_6EFB
.export sub_bat_6F29
.export sub_bat_6F73
.export sub_bat_6FB6
.export sub_bat_6FB8
.export sub_bat_6FC1
.export sub_bat_6FE8
.export sub_bat_7013_get_Y_from_direction
.export sub_bat_701F_EOR_FF_if_negative
.export sub_bat_7021_EOR_FF
.export sub_bat_7027
.export sub_bat_704A
.export sub_bat_706F
.export sub_bat_70AB
.export ofs_021_bat_70DD_01_bomb
.export loc_bat_7114
.export sub_bat_7116
.export sub_bat_711B
.export sub_bat_711F
.export ofs_021_bat_714F_04_candle
.export sub_bat_714F_candle
.export sub_bat_718A
.export sub_bat_718C
.export loc_bat_71A5_reset_obj_stats
.export sub_bat_71BB
.export sub_bat_71DE_draw_dot_on_minimap
.export loc_bat_71ED
.export sub_bat_7240_curtain_movement_handler
.export sub_bat_7248_curtain_movement_handler
.export sub_bat_7274_inc_0000_pointer_by_01
.export sub_bat_7276_inc_0000_pointer_by_A
.export sub_bat_7280_inc_0002_pointer_by_01
.export sub_bat_7282_inc_0002_pointer_by_A
.export sub_bat_728C_inc_0004_pointer_by_01
.export sub_bat_728E_inc_0004_pointer_by_A
.export sub_bat_7298_dec_0004_pointer_by_01
.export tbl_bat_72A4
.export tbl_bat_72C8
.export tbl_bat_72EC
.export sub_bat_730C_set_map_bit4
.export sub_bat_7314_check_map_bit4
.export sub_bat_7328
.export sub_bat_733F
.export sub_bat_7370
.export sub_bat_746C
.export sub_bat_74A3_increase_rupees_and_add_sfx
.export sub_bat_74B7
.export sub_bat_7512
.export sub_bat_752F_check_overworld_secret_correct_path
.export sub_bat_7570
.export tbl_bat_77AB
.export sub_bat_77D4
.export sub_bat_77DB
.export loc_bat_77DB
.export sub_bat_77DF
.export loc_bat_77DF
.export sub_bat_77E6
.export sub_bat_77E7
.export loc_bat_7804
.export sub_bat_7885
.export sub_bat_790C
.export loc_bat_790C
.export loc_bat_7915
.export sub_bat_7915
.export sub_bat_792C
.export sub_bat_7986
.export sub_bat_7988_set_spr_A
.export loc_bat_7988_set_spr_A
.export sub_bat_798D
.export sub_bat_7991
.export sub_bat_79A5
.export loc_bat_79AF
.export loc_bat_79BA
.export sub_bat_79CA
.export loc_bat_79CA
.export sub_bat_79D0
.export loc_bat_79D0
.export sub_bat_7A2D
.export sub_bat_7AA7
.export loc_bat_7AA7
.export sub_bat_7AC5
.export loc_bat_7B4F
.export sub_bat_7C54
.export sub_bat_7C96
.export sub_bat_7C9D
.export sub_bat_7CDC
.export sub_bat_7D29
.export loc_bat_7D29
.export sub_bat_7D5F
.export sub_bat_7DFB
.export loc_bat_7DFB
.export sub_bat_7E26



ofs_bat_6C90_bank_s2_asm_import:    ; start position of SRAM_2



sub_bat_6C90:
loc_bat_6C90:
; out
    ; A = 00 (for 0x00AA17)
    LDA #$00
    STA ram_subscript
    INC ram_0011_screen_ready_flag
bra_6C96_RTS:
    RTS



tbl_6C97_ppu_buffer_data_for_hud:   ; 28h bytes
    .dbyt $20B6 ; ppu address
    .byte $08   ; counter
    .byte $24, $24, $24, $24, $24, $24, $24, $24   ; hearts

    .dbyt $20D6 ; ppu address
    .byte $08   ; counter
    .byte $24, $24, $24, $24, $24, $24, $24, $24   ; hearts

    .dbyt $206C ; ppu address
    .byte $03   ; counter
    .byte $21, $00, $24   ; rupees

    .dbyt $20AC ; ppu address
    .byte $03   ; counter
    .byte $21, $00, $24   ; keys

    .dbyt $20CC ; ppu address
    .byte $03   ; counter
    .byte $21, $00, $24   ; bombs

    .byte $FF   ; close buffer



loc_bat_6CC0_count_rupees_and_update_hud_info:
    LDA ram_ppu_load_index
    BNE bra_6C96_RTS
    LDA ram_0302_ppu_buffer
    BPL bra_6C96_RTS
    LDY #con_item_rup_sbc
    LDA ram_item_rupees
    BEQ bra_6CD6
    LDY #con_item_rup_adc
    CMP #$FF
    BNE bra_6CDB
bra_6CD6:
    LDA #$00
    STA ram_items,Y
bra_6CDB:
    LDA ram_frm_cnt
    LSR
    BCS bra_6C96_RTS
    LDA ram_rupees_adc
    BEQ bra_6CF0_nothing_to_add
    DEC ram_rupees_adc
    INC ram_item_rupees
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
bra_6CF0_nothing_to_add:
    LDA ram_rupees_sbc
    BEQ bra_6D00_nothing_to_substract
    DEC ram_rupees_sbc
    DEC ram_item_rupees
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
bra_6D00_nothing_to_substract:
sub_bat_6D00_update_hud_info:   ; when link is dead
    LDY #$28
bra_6D02_loop:
    LDA tbl_6C97_ppu_buffer_data_for_hud,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_6D02_loop
    LDY #$03
    LDA ram_item_hearts
    STA ram_000E_t02
    LDA ram_item_hearts + $01
    STA ram_000F_t03
    JSR sub_6E79
; bzk optimize, useless LDX
    LDX #$02
    LDA ram_item_rupees
    LDY #$1B
    JSR sub_6D50_convert_to_decimal_and_write_to_buffer
    LDY #$21
    LDA ram_item_magic_key
    BEQ bra_6D3E
    STY ram_0000_t3D_ppu_buffer_index
    LDA #$21
    STA ram_0001_t04_decimal
    LDA #$0A
    JSR sub_6D75_set_fixed_decimal
; bzk optimize, useless LDX
    LDX #$08
    JSR sub_6D55_write_decimal_to_buffer
    JMP loc_6D46
bra_6D3E:
; bzk optimize, useless LDX
    LDX #$08
    LDA ram_item_keys
    JSR sub_6D50_convert_to_decimal_and_write_to_buffer
loc_6D46:
    LDX #$0E
    LDA ram_item_bombs
    LDY #$27
; bzk optimize, useless JMP
    JMP loc_6D50_convert_to_decimal_and_write_to_buffer



sub_6D50_convert_to_decimal_and_write_to_buffer:
loc_6D50_convert_to_decimal_and_write_to_buffer:
; in
    ; A = hex number
    ; Y = ppu buffer index
    STY ram_0000_t3D_ppu_buffer_index
    JSR sub_6D64
sub_6D55_write_decimal_to_buffer:
    LDY #$02
    LDX ram_0000_t3D_ppu_buffer_index
bra_6D59_loop:
    LDA ram_0001_t04_decimal,Y
    STA ram_0302_ppu_buffer,X
    DEX
    DEY
    BPL bra_6D59_loop
    RTS



sub_6D64:
; in
    ; A = hex number
; out
    ; ram_0001_t04_decimal
    JSR sub_6E55_convert_to_decimal
    CPY #$24
    BNE bra_6D6D
    LDY #$21
bra_6D6D:
    STY ram_0001_t04_decimal
    CMP #$24
    BNE bra_6D7B_RTS
    LDA ram_0001_t04_decimal + $02
sub_6D75_set_fixed_decimal:
; in
    ; A = 
; out
    ; ram_0001_t04_decimal
    STA ram_0001_t04_decimal + $01
    LDA #$24
    STA ram_0001_t04_decimal + $02
bra_6D7B_RTS:
    RTS



sub_6D7C_set_sfx_1:
sub_bat_6D7C_set_sfx_1:
    LDY #$01    ; ram_sfx_1
    BNE bra_6D82    ; jmp



sub_6D80_set_sfx_3:
sub_bat_6D80_set_sfx_3:
loc_bat_6D80_set_sfx_3:
    LDY #$03    ; ram_sfx_3
bra_6D82:
    ORA ram_music,Y
    STA ram_music,Y
    RTS



ofs_038_bat_6D89_07:
ofs_039_bat_6D89_07:
; bzk optimize, move to bank_05
; !!! ram 6D90-6D9B has some weird SRAM checks when going into save elimination mode
; see 0x00A479 and 0x00A42A, address is specified via 0x009D10
; also see 6D9C-6D9D
    LDA ram_subscript
    PHA
    JSR sub_0x0147D6
    JSR sub_0x0170C6
    LDA #$70
    STA ram_pos_X_link
    LDA #$DD
    STA ram_pos_Y_link
    LDA #con_dir_Up
    STA ram_dir_link
    JSR sub_0x01F24C
    JSR sub_0x01EADB
    PLA
    STA ram_subscript
    LDA #$00
    STA ram_0011_screen_ready_flag
    INC ram_subscript
    LDA #$30
    STA ram_0394_link
    LDA #$01
    STA ram_005A
    RTS



sub_bat_6DB7_clear_special_metatile_addresses:
    LDA #$00
    STA ram_052B_special_metatile_id
    STA ram_052C_special_metatile_pos_X
    STA ram_052D_special_metatile_pos_Y
    RTS



tbl_bat_6DC3_direction:
    .byte con_dir_Up      ; 00 
    .byte con_dir_Down    ; 01 
    .byte con_dir_Left    ; 02 
    .byte con_dir_Right   ; 03 



tbl_6DC7_save_slot_addresses:
; 00 (00)
    .word ram_601A ; 
    .word ram_6092 ; 
    .word ram_save_slot_name ; 
    .word ram_6512 ; 
    .word ram_6515 ; 
    .word ram_slot_death_cnt ; 
    .word ram_slot_current_quest ; 
; 01 (0E)
    .word ram_601A + $28 ; 
    .word ram_6092 + $180 ; 
    .word ram_save_slot_name + $08 ; 
    .word ram_6512 + $01 ; 
    .word ram_6515 + $01 ; 
    .word ram_slot_death_cnt + $01 ; 
    .word ram_slot_current_quest + $01 ; 
; 02 (1C)
    .word ram_601A + $50 ; 
    .word ram_6092 + $300 ; 
    .word ram_save_slot_name + $10 ; 
    .word ram_6512 + $02 ; 
    .word ram_6515 + $02 ; 
    .word ram_slot_death_cnt + $02 ; 
    .word ram_slot_current_quest + $02 ; 



sub_bat_6FD1_prepare_save_slot_addresses:
; out
    ; ram_0000_t19_data
    ; ram_0002_t03_data
    ; ram_0004_t02_slot_name_data
    ; ram_0006_t01_data
    ; ram_0008_t03_data
; bzk optimize, move to bank 02
    LDA #$FF
    LDY ram_current_save_slot
bra_6DF5_loop:
    CLC
    ADC #$0E
    DEY
    BPL bra_6DF5_loop
    TAY
    LDX #$0D
bra_6DFE_loop:
; 0000-000D
    LDA tbl_6DC7_save_slot_addresses,Y
; ram_0000_t19_data
; ram_0002_t03_data
; ram_0004_t02_slot_name_data
; ram_0006_t01_data
; ram_0008_t03_data
; ram_000A_t01_data
; ram_000C_t01_data
    STA $00,X
    DEY
    DEX
    BPL bra_6DFE_loop
    LDA #< ram_067F
    STA ram_000E_t04_data
    LDA #> ram_067F
    STA ram_000E_t04_data + $01
    RTS



sub_bat_6E10:
; in
    ; Y = con_sfx_3
; bzk optimize, use LDA instead of LDY before JSR to here,
; use LDY instead of LDA here, delete TYA
    LDA ram_timer_obj + $13
    BNE bra_6E1C_RTS
    TYA
    JSR sub_6D80_set_sfx_3
    LDA #$0A
    STA ram_timer_obj + $13
bra_6E1C_RTS:
    RTS



sub_bat_6E1D:
    LDX #$60
    LDA #$F8
bra_6E21_loop:
    STA ram_spr_Y,X
    INX
    INX
    INX
    INX
    CPX #$00    ; bzk optimize, BNE is enough
    BNE bra_6E21_loop
; bzk optimize, delete LDA, make JSR to 0x0066B6
    LDA ram_copy_counter_00_27
    JSR sub_6E39_increase_counter_00_27
; bzk optimize, useless STA
    STA ram_copy_counter_00_27
    RTS



sub_6E36_increase_counter_00_27:
loc_6E36_increase_counter_00_27:
sub_bat_6E36_increase_counter_00_27:
    LDA ram_counter_00_27
sub_6E39_increase_counter_00_27:
    CLC
    ADC #$01
    CMP #$28
    BNE bra_6E42_not_overflow
; if overflow
sub_bat_6E40_clear_counter_00_27:
    LDA #$00
bra_6E42_not_overflow:
    STA ram_counter_00_27
bra_6E45_RTS:
    RTS



sub_bat_6E46:
    LDA ram_pos_Y_link
    CMP #$8E
    BCS bra_6E45_RTS
    LDA ram_000F_t01_direction
    AND #$08
    BEQ bra_6E45_RTS
    JMP loc_0x01F159_set_00_direction



sub_6E55_convert_to_decimal:
sub_bat_6E55_convert_to_decimal:
; in
    ; A = hex number
; out
    ; Y = 
    ; ram_0001_t04_decimal
    JSR sub_6E6E_convert_to_decimal
    STA ram_0001_t04_decimal + $02
    TYA ; tens
    JSR sub_6E6E_convert_to_decimal
    CPY #$00
    BNE bra_6E69
    LDY #$24
    CMP #$00
    BNE bra_6E69
    TYA
bra_6E69:
    STA ram_0001_t04_decimal + $01
    STY ram_0001_t04_decimal
bra_6E6D_RTS:
    RTS



sub_6E6E_convert_to_decimal:
; in
    ; A = hex number
; out
    ; A = ones
    ; Y = tens
    LDY #$00
bra_6E70_loop:
    CMP #$0A
    BCC bra_6E6D_RTS
    SBC #$0A
    INY
    BNE bra_6E70_loop   ; jmp




sub_6E79:
sub_bat_6E79:
; in
    ; Y = 03/0C
    ; ram_000E_t02
    STY ram_000D_t02
    LDA ram_000E_t02
    PHA
    AND #$0F
    STA ram_0000_t3F
    LDA #$0F
    SEC
    SBC ram_0000_t3F
    STA ram_0000_t3D_ppu_buffer_index
    PLA
; / 10
    LSR
    LSR
    LSR
    LSR
    STA ram_0001_t03
    LDA #$0F
    SEC
    SBC ram_0001_t03
    STA ram_0001_t03
    LDX #$00
    TYA
    CLC
    ADC #$07
    STA ram_000B_t01
    LDY #$07
bra_6EA1_loop:
    CPY #$FF
    BNE bra_6EAE
    LDA ram_000D_t02
    CLC
    ADC #$12
    STA ram_000B_t01
    LDY #$12
bra_6EAE:
    LDA ram_000E_t02
    BEQ bra_6EB6
    CPX ram_0001_t03
    BCS bra_6EBA
bra_6EB6:
    LDA #$24
    BNE bra_6ED7    ; jmp
bra_6EBA:
    CPX ram_0000_t3D_ppu_buffer_index
    BEQ bra_6EC4
    BCC bra_6ED5
bra_6EC0:
    LDA #$F2
    BNE bra_6ED7    ; jmp
bra_6EC4:
    LDA ram_000F_t01_direction
    BEQ bra_6ED5
    CMP #$80
    BCS bra_6EC0
    LDA #$00
    STA ram_0529
    LDA #$65
    BNE bra_6ED7    ; jmp
bra_6ED5:
    LDA #$66
bra_6ED7:
    STY ram_000C_t05
    LDY ram_000B_t01
    STA ram_0302_ppu_buffer,Y
    DEC ram_000B_t01
    LDY ram_000C_t05
    DEY
    INX
    CPX #$10
    BNE bra_6EA1_loop
    RTS



sub_bat_6EE9:
loc_bat_6EE9:
    LDA #$80    ; con_sfx_4_80  con_sfx_3_80
    STA ram_sfx_4
    STA ram_sfx_3
    ASL ; -> 00
    STA ram_0605_sfx_4
    STA ram_0607_sfx_2
    RTS



tbl_6EF9:
tbl_bat_6EF9:
    .byte $08   ; 00 
    .byte $00   ; 01 



sub_bat_6EFB:
    LDY #$0A
    LDX #$00
    LDA ram_pos_X_enemy,X
    STA ram_0000_t4E_pos_X
    LDX #$01
bra_6F05_loop:
    LDA ram_0000_t4E_pos_X
    CLC
    ADC tbl_6EF9,X
    CMP #$E9
    BCS bra_6F13
; bzk bug maybe, 0x0112C2 has CMP 18
    CMP #$10
    BCS bra_6F1B
bra_6F13:
; 00-0F, E9-FF
    LDA ram_spr_Y + $40,Y
    ORA #$20
    STA ram_spr_Y + $40,Y
bra_6F1B:
; 10-E8
    INY
    INY
    INY
    INY
    CPY #$00    ; bzk optimize, BNE is enough
    BNE bra_6F25
    LDY #$20
bra_6F25:
    DEX
    BPL bra_6F05_loop
    RTS



sub_6F29:
sub_bat_6F29:
    LDY #$02
    LDA ram_pos_X_enemy,X
    STA ram_0000_t32_pos_X
    CPX #$00
    BEQ bra_6F45
    CPX #$0D
    BCS bra_6F3E
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5C
    BNE bra_6F45
bra_6F3E:
    LDA ram_0000_t32_pos_X
    CLC
    ADC #$0B
    STA ram_0000_t32_pos_X
bra_6F45:
    LDA ram_0000_t32_pos_X
    CMP ram_0346
    BCC bra_6F6B
    CPX #$00
    BEQ bra_6F62
    CPX #$0D
    BCS bra_6F5B
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5C
    BNE bra_6F62
bra_6F5B:
    LDA ram_0000_t32_pos_X
    SEC
    SBC #$17
    STA ram_0000_t32_pos_X
bra_6F62:
    LDY #$01
    LDA ram_0000_t32_pos_X
    CMP ram_0347
    BCC bra_6FB5_RTS
bra_6F6B:
    TYA
    AND ram_000F_t01_direction
    BEQ bra_6FB5_RTS
    JMP loc_0x01F159_set_00_direction



sub_6F73:
sub_bat_6F73:
    LDY #$08
    LDA ram_pos_Y_enemy,X
    STA ram_0000_t33_pos_Y
    CPX #$00
    BEQ bra_6F8F
    CPX #$0D
    BCS bra_6F88
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5C
    BNE bra_6F8F
bra_6F88:
    LDA ram_0000_t33_pos_Y
    CLC
    ADC #$0F
    STA ram_0000_t33_pos_Y
bra_6F8F:
    LDA ram_0000_t33_pos_Y
    CMP ram_0348
    BCC bra_6F6B
    CPX #$00
    BEQ bra_6FAC
    CPX #$0D
    BCS bra_6FA5
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5C
    BNE bra_6FAC
bra_6FA5:
    LDA ram_0000_t33_pos_Y
    SEC
    SBC #$21
    STA ram_0000_t33_pos_Y
bra_6FAC:
    LDY #$04
    LDA ram_0000_t33_pos_Y
    CMP ram_0349
    BCS bra_6F6B
bra_6FB5_RTS:
    RTS



sub_6FB6:
sub_bat_6FB6:
; in
    ; A = con_dir
; out
    ; Z
        ; 0 = 
        ; 1 = 
    STA ram_000F_t01_direction
sub_bat_6FB8:
; in
    ; ram_000F_t01_direction
; out
    ; Z
        ; 0 = 
        ; 1 = 
    JSR sub_6F29
    JSR sub_6F73
    LDA ram_000F_t01_direction
    RTS




sub_bat_6FC1:
    LDA ram_03A8_enemy,X
    CLC
    ADC ram_03BC_obj,X
    STA ram_03A8_enemy,X
    PHP
    LDA ram_0394_enemy,X
    CMP ram_010E
    BEQ bra_6FD9
    CMP ram_010F
    BNE bra_6FDC
bra_6FD9:
    PLP
    CLC
    PHP
bra_6FDC:
    PLP
    PHP
    LDA ram_0394_enemy,X
    ADC #$00
    STA ram_0394_enemy,X
    PLP
    RTS



sub_bat_6FE8:
    LDA ram_03A8_enemy,X
    SEC
    SBC ram_03BC_obj,X
    STA ram_03A8_enemy,X
    PHP
    LDA ram_0394_enemy,X
    CMP ram_010E
    BEQ bra_7000
    CMP ram_010F
    BNE bra_7003
bra_7000:
    PLP
    SEC
    PHP
bra_7003:
    PLP
    PHP
    LDA ram_0394_enemy,X
    SBC #$00
    STA ram_0394_enemy,X
    PLP
    RTS



tbl_700F_direction:
    .byte con_dir_Down    ; 00 
    .byte con_dir_Up      ; 01 
    .byte con_dir_Right   ; 02 
    .byte con_dir_Left    ; 03 



sub_7013_get_Y_from_direction:
sub_bat_7013_get_Y_from_direction:
; in
    ; A = direction
; out
    ; A = direction
    ; Y = 
    LDY #$03
bra_7015_loop:
    LSR
    BCS bra_701B
    DEY
    BPL bra_7015_loop
bra_701B:
    LDA tbl_700F_direction,Y
    RTS



sub_701F_EOR_FF_if_negative:
sub_bat_701F_EOR_FF_if_negative:
    BPL bra_7026_RTS
sub_bat_7021_EOR_FF:
    EOR #$FF
    CLC
    ADC #$01
bra_7026_RTS:
    RTS



sub_bat_7027:
; in
    ; A = con_dir
    ; ram_000E_t02
; out
    ; ram_000E_t02
    JSR sub_6FB6
    BEQ bra_7045
    LDA ram_0394_enemy,X
    PHA
    LDA #$00
    STA ram_0394_enemy,X
    JSR sub_0x01F09D
    PLA
    LDY ram_000E_t02
    BNE bra_7041
    CLC
    ADC ram_0394_enemy,X
bra_7041:
    STA ram_0394_enemy,X
    RTS
bra_7045:
    LDA #$80
    STA ram_000E_t02
    RTS



sub_bat_704A:
; out
    ; ram_0003_t20
    ; ram_0004_t11
    ; ram_000A_t06
    ; ram_000B_t03
    PHA
    TAY
    LDA #$02
    STA ram_000A_t06
    LDA ram_pos_X_obj,Y
    LDY ram_pos_X_obj,X
    JSR sub_70C3
    STA ram_0003_t20
    LDA ram_000A_t06
    STA ram_000B_t03
    PLA
    TAY
    LDA #$08
    STA ram_000A_t06
    LDA ram_pos_Y_obj,Y
    LDY ram_pos_Y_obj,X
    JSR sub_70C3
    STA ram_0004_t11
    RTS



sub_bat_706F:
; in
    ; Y = 
    ; ram_0003_t20
; out
    ; Y = 
    STY ram_0000_t4F
    LDA #$FF
    STA ram_0001_t05
    LDA ram_0003_t20
    CMP ram_0004_t11
    BCS bra_7087
; swap
    PHA
    LDA ram_0004_t11
    STA ram_0003_t20
    PLA
    STA ram_0004_t11
; 
    LDA #$01
    STA ram_0001_t05
bra_7087:
    LDA ram_0003_t20
    SEC
    SBC ram_0004_t11
    CMP #$08
    BCC bra_70A8
bra_7090_loop:
    LDA ram_0000_t4F
    CLC
    ADC ram_0001_t05
    STA ram_0000_t4F
    BEQ bra_70A8
    CMP #$08
    BEQ bra_70A8
    LDA ram_0003_t20
    SEC
    SBC ram_0004_t11
    STA ram_0003_t20
    CMP ram_0004_t11
    BCS bra_7090_loop
bra_70A8:
    LDY ram_0000_t4F
    RTS



sub_bat_70AB:
    STA ram_03BC_obj,X
    LDA ram_state_obj,X
    AND #$F0
    CMP #$40
    BNE bra_70C2_RTS
    LSR ram_03BC_obj,X
    DEC ram_0380_enemy,X
    BNE bra_70C2_RTS
    LDA #$50
    STA ram_state_obj,X
bra_70C2_RTS:
    RTS



sub_70C3:
; in
    ; A = 
    ; Y = 
    ; ram_0000_t6A
    ; ram_000A_t06
; out
    ; A = 
    ; ram_000A_t06
    ; ram_0000_t6A
    STA ram_0001_t06
    STY ram_0002_t23
    CPY ram_0001_t06
    BCS bra_70D1
    STA ram_0002_t23
    STY ram_0001_t06
    LSR ram_000A_t06
bra_70D1:
    LDA ram_0002_t23
    SEC
    SBC ram_0001_t06
    CMP #$09
    BCS bra_70DC_RTS
; bzk bug, this 0000 can be from ram_0000_t07_data
    INC ram_0000_t6A
bra_70DC_RTS:
    RTS



ofs_021_bat_70DD_01_bomb:
; bzk optimize, up to 0x006992 can be moved to bank 05
    LDA ram_item_bombs
    BEQ bra_70DC_RTS
    LDX #$10
    LDA ram_state_obj,X
    BEQ bra_70F9
    AND #$F0
    CMP #$10
    BNE bra_70F9
    INX
    LDA ram_state_obj,X
    BEQ bra_70F9
    AND #$F0
    CMP #$10
    BEQ bra_713B_RTS
bra_70F9:
    TXA
    EOR #$01
    TAY
    LDA ram_state_obj,Y
    BEQ bra_7106
    CMP #$13
    BCC bra_713B_RTS
bra_7106:
    DEC ram_item_bombs
    LDA #con_sfx_4_plant_bomb
    STA ram_sfx_4
    LDA #$00
    STA ram_timer_enemy,X
    LDA #$11    ; bomb
loc_bat_7114:
    STA ram_state_obj,X
sub_bat_7116:
    LDA #$01
    STA ram_anim_timer_link
sub_711B:
sub_bat_711B:
; triggers when link has just pressed a button to swing a sword/staff
    LDA #con_obj_state_10
    STA ram_state_link
sub_bat_711F:
; in
    ; A = 
    LDY #$F0
    STA ram_0000_t6B + $01
    STY ram_0000_t6B + $02
    LDA ram_dir_link
    STA ram_dir_enemy,X
    JSR sub_713C
    ADC ram_pos_X_link
    STA ram_pos_X_enemy,X
    LDA ram_dir_link
; / 04
    LSR
    LSR
    JSR sub_713C
    ADC ram_pos_Y_link
    STA ram_pos_Y_enemy,X
bra_713B_RTS:
    RTS



sub_713C:
; in
    ; A = 
    ; ram_0000_t6B
; out
    ; A = position
    LDY #$00
    STY ram_0000_t6B
    AND #$03
    BEQ bra_714A
    INY ; 01
    AND #$01
    BNE bra_714A
    INY ; 02
bra_714A:
    LDA ram_0000_t6B,Y
    CLC
bra_714E_RTS:
    RTS



ofs_021_bat_714F_04_candle:
sub_bat_714F_candle:
    LDX #$10
    LDA ram_state_obj,X
    BEQ bra_715A
    INX ; 11
    LDA ram_state_obj,X
    BNE bra_714E_RTS
bra_715A:
    LDA ram_item_candle
    CMP #$01
    BNE bra_7166
    LDA ram_candle_usage_flag
    BNE bra_714E_RTS
bra_7166:
    LDA #$01
    STA ram_candle_usage_flag
    LDA #$00
    STA ram_0394_enemy,X
    STA ram_03A8_enemy,X
    LDA #$20
    STA ram_03BC_obj,X
    LDA #$21
    STA ram_state_obj,X
    LDA #con_sfx_3_04
    JSR sub_6D80_set_sfx_3
    LDA #$04
    STA ram_anim_timer_obj,X
; bzk optimize, JMP
    JSR sub_711B
    RTS



sub_bat_718A:
    LDY ram_map_location
sub_bat_718C:
    LDA ram_6AFE_map_data,Y
    AND #$30
; / 10
    LSR
    LSR
    LSR
    LSR
    TAY
    LDA ram_6BA7,Y
    PHA
    AND #$0F
; * 10
    ASL
    ASL
    ASL
    ASL
    TAY
    PLA
    AND #$F0
    RTS



loc_bat_71A5_reset_obj_stats:
; A = 00
    STA ram_00C0_enemy,X
    STA ram_00D3_enemy,X
    STA ram_timer_enemy,X
    STA ram_state_obj,X
    STA ram_invinc_enemy,X
    LDA #$FF
    STA ram_0492_enemy,X
    LDA #$01
    STA ram_0405_enemy,X
    RTS



sub_bat_71BB:
; X = 10 11
    LDA ram_state_obj,X
    CMP #$13
    BNE bra_71DD_RTS
    LDA ram_for_2001
    LSR
    LDY ram_timer_enemy,X
    CPY #$16
    BEQ bra_71CE
    CPY #$11
    BNE bra_71D2
bra_71CE:   ; 11 or 16
    ROL
    JMP loc_71DB
bra_71D2:
    CPY #$12
    BEQ bra_71DA
    CPY #$0D
    BNE bra_71DD_RTS
bra_71DA:   ; 12 or 0D
    ASL
loc_71DB:
    STA ram_for_2001
bra_71DD_RTS:
    RTS



sub_bat_71DE_draw_dot_on_minimap:
    LDA ram_script
    CMP #con_script_09
    BEQ bra_723F_RTS
    LDX ram_0522_flag
    BNE bra_723F_RTS
    LDA ram_map_location
    LDX #$00
loc_bat_71ED:   ; X = 04
    PHA
    AND #$70
; / 04
    LSR
    LSR
    ADC #$17
    STA ram_spr_Y + $54,X
    LDA #$11
    LDY ram_dungeon_level
    BEQ bra_71FF    ; if overworld
; if dungeon
    LDA #$12
bra_71FF:
    STA ram_0000_t44
    PLA
    AND #$0F
    CPY #$00
    BEQ bra_7209    ; if overworld
; if dungeon
    ASL
bra_7209:
; * 04
    ASL
    ASL
    ADC ram_0000_t44
    ADC ram_6BAC
    STA ram_spr_X + $54,X
    LDA #$3E
    STA ram_spr_T + $54,X
    LDA #$00
    CPX #$00
    BEQ bra_723C
    LDA #$03
    PHA
    LDY ram_dungeon_level
    CPY #$09
    BEQ bra_722F
    LDA ram_item_triforce_pieces
    AND tbl_0x01E6CE_8_bits - $01,Y
    BNE bra_723B
bra_722F:
    LDA ram_frm_cnt
    AND #$1F
    CMP #$10
    BCS bra_723B
    PLA
    LDA #$02
    PHA
bra_723B:
    PLA
bra_723C:
    STA ram_spr_A + $54,X
bra_723F_RTS:
    RTS



sub_bat_7240_curtain_movement_handler:
    JSR sub_7248_curtain_movement_handler
    LDA #con_prg_bank + $02
    JMP loc_inc_0x003FBC_prg_bankswitch



sub_7248_curtain_movement_handler:
sub_bat_7248_curtain_movement_handler:
    LDA ram_timer_link
    BNE bra_7273_RTS
    LDA #$01
    STA ram_000A_t11
bra_7250_loop:
    LDX ram_000A_t11
    LDA ram_007C,X
    STA ram_00E8
    LDA #con_prg_bank + $05
    JSR sub_inc_0x003FBC_prg_bankswitch
    LDA #con_mirroring_V
    JSR sub_inc_0x003FA8_set_control_register
    JSR sub_0x0168EE_move_curtain
    DEC ram_000A_t11
    BPL bra_7250_loop
    LDA #$FF
    STA ram_00E8
    LDA #$05
    STA ram_timer_link
    DEC ram_007C
    INC ram_007C + $01
bra_7273_RTS:
    RTS



sub_bat_7274_inc_0000_pointer_by_01:
    LDA #$01
sub_bat_7276_inc_0000_pointer_by_A:
    CLC
    ADC ram_0000_temp
    STA ram_0000_temp
    BCC bra_727F_RTS
; if overflow
    INC ram_0001_temp
bra_727F_RTS:
    RTS



sub_bat_7280_inc_0002_pointer_by_01:
    LDA #$01
sub_bat_7282_inc_0002_pointer_by_A:
    CLC
    ADC ram_0002_temp
    STA ram_0002_temp
    BCC bra_728B_RTS
; if overflow
    INC ram_0003_temp
bra_728B_RTS:
    RTS



sub_bat_728C_inc_0004_pointer_by_01:
    LDA #$01
sub_bat_728E_inc_0004_pointer_by_A:
    CLC
    ADC ram_0004_temp
    STA ram_0004_temp
    BCC bra_7297_RTS
; if overflow
    INC ram_0005_temp
bra_7297_RTS:
    RTS



sub_bat_7298_dec_0004_pointer_by_01:
    LDA ram_0004_temp
    SEC
    SBC #$01
    STA ram_0004_temp
    BCS bra_72A3_RTS
; if underflow
    DEC ram_0005_temp
bra_72A3_RTS:
    RTS



tbl_72A4:
tbl_bat_72A4:
    .byte $01   ; 00 bomb
    .byte $00   ; 01 wooden sword
    .byte $00   ; 02 white sword
    .byte $00   ; 03 magical sword
    .byte $06   ; 04 meat
    .byte $05   ; 05 flute
    .byte $04   ; 06 blue candle
    .byte $04   ; 07 red candle
    .byte $02   ; 08 arrow
    .byte $02   ; 09 silver arrow
    .byte $03   ; 0A bow
    .byte $0D   ; 0B magical key
    .byte $09   ; 0C raft
    .byte $0C   ; 0D ladder
    .byte $1B   ; 0E unused? or is 0x01F86C it?
    .byte $1C   ; 0F 5 rupees
    .byte $08   ; 10 magical rod (staff)
    .byte $0A   ; 11 recorder
    .byte $0B   ; 12 blue ring
    .byte $0B   ; 13 red ring
    .byte $0E   ; 14 power bracelet
    .byte $0F   ; 15 letter
    .byte $10   ; 16 compass
    .byte $11   ; 17 map
    .byte $16   ; 18 1 rupee
    .byte $17   ; 19 key
    .byte $18   ; 1A heart container
    .byte $1A   ; 1B triforce piece
    .byte $1F   ; 1C magical shield
    .byte $1D   ; 1D boomerang
    .byte $1E   ; 1E magical boomerang
    .byte $07   ; 1F blue potion
    .byte $07   ; 20 red potion
    .byte $15   ; 21 clock
    .byte $19   ; 22 small heart
    .byte $14   ; 23 fairy flying around



tbl_72C8:
tbl_bat_72C8:
; .... xxxx = item counter
; xxxx .... = ???
    .byte $10 + $04   ; 00 bomb
    .byte $20 + $01   ; 01 wooden sword
    .byte $20 + $02   ; 02 white sword
    .byte $20 + $03   ; 03 magical sword
    .byte $00 + $01   ; 04 meat
    .byte $00 + $01   ; 05 flute
    .byte $20 + $01   ; 06 blue candle
    .byte $20 + $02   ; 07 red candle
    .byte $20 + $01   ; 08 arrow
    .byte $20 + $02   ; 09 silver arrow
    .byte $00 + $01   ; 0A bow
    .byte $00 + $01   ; 0B magical key
    .byte $00 + $01   ; 0C raft
    .byte $00 + $01   ; 0D ladder
    .byte $00 + $01   ; 0E final triforce from ganon
    .byte $10 + $05   ; 0F 5 rupees
    .byte $00 + $01   ; 10 magical rod (staff)
    .byte $00 + $01   ; 11 recorder
    .byte $20 + $01   ; 12 blue ring
    .byte $20 + $02   ; 13 red ring
    .byte $00 + $01   ; 14 power bracelet
    .byte $00 + $01   ; 15 letter
    .byte $00 + $01   ; 16 compass
    .byte $00 + $01   ; 17 map
    .byte $10 + $01   ; 18 1 rupee
    .byte $10 + $01   ; 19 key
    .byte $10 + $00   ; 1A heart container
    .byte $00 + $01   ; 1B triforce piece
    .byte $00 + $01   ; 1C magical shield
    .byte $00 + $01   ; 1D boomerang
    .byte $00 + $01   ; 1E magical boomerang
    .byte $10 + $01   ; 1F blue potion
    .byte $20 + $02   ; 20 red potion
    .byte $00 + $01   ; 21 clock
    .byte $10 + $00   ; 22 small heart
    .byte $10 + $02   ; 23 fairy flying around



tbl_bat_72EC:
    .byte $FF   ; 00 
    .byte $01   ; 01 
    .byte $FF   ; 02 
    .byte $00   ; 03 
    .byte $00   ; 04 
    .byte $02   ; 05 
    .byte $02   ; 06 
    .byte $00   ; 07 
    .byte $01   ; 08 
    .byte $00   ; 09 
    .byte $02   ; 0A 
    .byte $00   ; 0B 
    .byte $00   ; 0C 
    .byte $02   ; 0D 
    .byte $02   ; 0E 
    .byte $01   ; 0F 
    .byte $02   ; 10 
    .byte $02   ; 11 
    .byte $02   ; 12 
    .byte $02   ; 13 
    .byte $02   ; 14 
    .byte $02   ; 15 
    .byte $02   ; 16 
    .byte $02   ; 17 
    .byte $02   ; 18 
    .byte $02   ; 19 
    .byte $02   ; 1A 
    .byte $02   ; 1B 
    .byte $01   ; 1C 
    .byte $00   ; 1D 
    .byte $01   ; 1E 
    .byte $00   ; 1F 



sub_730C_set_map_bit4:
sub_bat_730C_set_map_bit4:
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    ORA #$10
    STA (ram_0000_t13_data),Y
    RTS



sub_7314_check_map_bit4:
sub_bat_7314_check_map_bit4:
; out
    ; Z
        ; 0 = 
        ; 1 = 
    LDA ram_6BAF
    STA ram_0008_t01_data
    LDA ram_6BB0
    STA ram_0008_t01_data + $01
    LDY ram_map_location
    LDA (ram_0008_t01_data),Y
    AND #$10
bra_7324_RTS:
    RTS



tbl_7325_tunic_color:
    .byte $29   ; 00 green
    .byte $32   ; 01 blue
    .byte $16   ; 02 red



sub_bat_7328:
    LDA ram_state_link
    AND #con_obj_state_freeze + con_obj_state_80
    CMP #con_obj_state_freeze
    BEQ bra_7324_RTS
    JSR sub_7314_check_map_bit4
    BNE bra_7324_RTS
    LDX #$13
    LDA ram_room_item_flag - $13,X
    BMI bra_7324_RTS
    LDA ram_drop_id_room - $13,X
    STA ram_0004_t17
sub_bat_733F:
    LDA ram_03A8_enemy,X
    CMP #$F0
    BCS bra_73B8_RTS
    LDA ram_pos_Y_link
    CLC
    ADC #$03
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_701F_EOR_FF_if_negative
    CMP #$09
    BCS bra_73B8_RTS
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_701F_EOR_FF_if_negative
    CMP #$09
    BCS bra_73B8_RTS
    LDA #$FF
    STA ram_drop_id_enemy,X
    STA ram_pos_Y_enemy,X
    CPX #$13
    BNE bra_736E
    JSR sub_730C_set_map_bit4
bra_736E:
    LDA ram_0004_t17
sub_bat_7370:
    LDX #con_sfx_2_pick_up_item
    STX ram_sfx_2
    CMP #$0E
    BNE bra_737E
    LDX #con_sfx_2_02
    STX ram_sfx_2
bra_737E:
    LDX ram_script
    CPX #con_script_05_gameplay
    BEQ bra_7391
    LDX #$80
    STX ram_0506
    LDX #con_music_pick_up_item
    STX ram_music
    STA ram_0505
bra_7391:
    TAX
    LDA tbl_72A4,X
    TAY
    LDA tbl_72C8,X
    PHA
    AND #$0F
    STA ram_000A_t12_item_amount
    PLA
    AND #$F0
    BNE bra_73C2
    CPY #con_item_map
    BEQ bra_7419
    CPY #con_item_compass
    BEQ bra_7419
    CPY #con_item_triforce
    BEQ bra_7419
    CPY #con_item_1B
    BEQ bra_7419
    LDA ram_000A_t12_item_amount
loc_73B5:
    STA ram_items,Y
bra_73B8_RTS:
    RTS



bra_73B9_5_rupees:
    LDY #$04
bra_73BB_loop:
    JSR sub_74A3_increase_rupees_and_add_sfx
    DEY
    BPL bra_73BB_loop
    RTS



bra_73C2:
    CMP #con_item_compass
    BNE bra_7413_compass
    CPY #con_item_hearts_1
    BEQ bra_7404_hearts_1
    CPY #con_item_5_rupees
    BEQ bra_73B9_5_rupees
    CPY #con_item_1_rupee
    BEQ bra_7410_1_rupee
    CPY #con_item_hearts_2
    BEQ bra_744B_hearts_2
    CPY #con_item_keys
    BNE bra_73DD
; if keys
    JSR sub_74AC_set_item_pickup_sfx
bra_73DD:
    CPY #con_item_14
    BEQ bra_744E
    LDA ram_000A_t12_item_amount
    CLC
    ADC ram_items,Y
    BCC bra_73EB
bra_73E9_loop:
    LDA #$FF
bra_73EB:
    CPY #con_item_potion
    BNE bra_73F5
    CMP #$03
    BCC bra_73F5
    LDA #$02
bra_73F5:
    CPY #con_item_bomb
    BNE bra_7401
    CMP ram_item_max_bombs
    BCC bra_7401
    LDA ram_item_max_bombs
bra_7401:
    JMP loc_73B5
bra_7404_hearts_1:
    LDA ram_items,Y
    CMP #$F0
    BCS bra_73B8_RTS
    ADC #$11
    JMP loc_73B5
bra_7410_1_rupee:
    JMP loc_74A3_increase_rupees_and_add_sfx
bra_7413_compass:
    CMP #$20
    BNE bra_73E9_loop
    BEQ bra_7484    ; jmp
bra_7419:
    LDA ram_dungeon_level
    BEQ bra_744A_RTS    ; if overworld
; if dungeon
    CPY #con_item_1B
    BEQ bra_747C
    CPY #con_item_map
    BNE bra_742A
    LDX #$01
    STX ram_04E5
bra_742A:
    SEC
    SBC #$01
    CMP #$08
    BCC bra_7433
    INY
    INY
bra_7433:
    AND #$07
    TAX
    LDA ram_items,Y
    ORA tbl_0x01E6CE_8_bits,X
    STA ram_items,Y
    CPY #con_item_triforce
    BNE bra_744A_RTS
    JSR sub_0x01EBB3_clear_subscript
    LDA #con_script_triforce_collected
    STA ram_script
bra_744A_RTS:
    RTS
bra_744B_hearts_2:
    JSR sub_74AC_set_item_pickup_sfx
bra_744E:
    LDA ram_000A_t12_item_amount
    STA ram_0001_t19_item_amount
bra_7452_loop:
    JSR sub_746C
    BNE bra_745E
    LDX ram_item_hearts + $01
    INX
    BNE bra_7466
    RTS
bra_745E:
    INC ram_item_hearts
    DEC ram_0001_t19_item_amount
    BPL bra_7452_loop
    RTS
bra_7466:
    LDA #$FF
    STA ram_item_hearts + $01
    RTS



sub_746C:
sub_bat_746C:
    LDA ram_item_hearts
    PHA
    AND #$0F
    STA ram_0000_t47
    PLA
; / 10
    LSR
    LSR
    LSR
    LSR
    CMP ram_0000_t47
    RTS



bra_747C:
    LDA #con_prg_bank + $01
    JSR sub_inc_0x003FBC_prg_bankswitch
    JMP loc_0x0061C1



bra_7484:
    LDA ram_000A_t12_item_amount
    CMP ram_items,Y
    BCC bra_74AB_RTS
    STA ram_items,Y
    CPY #con_item_ring
    BNE bra_74AB_RTS
; if ring
    LDX ram_current_save_slot
    LDY ram_item_ring
    LDA tbl_7325_tunic_color,Y
    LDY tbl_0x01EA1E_save_slot_index,X
    STA ram_6804_tunic_color,Y
; bzk optimize, JMP to 0x01EA43
    JMP loc_0x01EA3B_set_tunic_color



sub_74A3_increase_rupees_and_add_sfx:
loc_74A3_increase_rupees_and_add_sfx:
sub_bat_74A3_increase_rupees_and_add_sfx:
    LDA #con_sfx_2_cursor_select
    STA ram_sfx_2
    INC ram_rupees_adc
bra_74AB_RTS:
    RTS



sub_74AC_set_item_pickup_sfx:
    LDA #con_sfx_2_00
    STA ram_sfx_2
    LDA #con_sfx_4_pick_up_item
    STA ram_sfx_4
    RTS



sub_bat_74B7:
    LDA ram_timer_obj + $0C
    BNE bra_7506_RTS
    LDA ram_051C
    BPL bra_74C2
; after EOR 83
; 80/81/82/83 -> 03/02/01/00
; A0/A1/A2/A3 -> 23/22/21/20
; C0/C1/C2/C3 -> 83/82/81/80
    EOR #$83
bra_74C2:
    STA ram_0000_t2F
; * 09
    ASL
    ASL
    ASL
    CLC
    ADC ram_0000_t2F
    AND #$FC
; considering ram_051C, Y will be
; 00/01/02/03 -> 00/08/10/18
; 20/21/22/23 -> 20/28/30/38
; 40/41/42/43 -> 40/48/50/58
; 60/61/62/63 -> 60/68/70/78
; 80/81/82/83 -> 18/10/08/00
; A0/A1/A2/A3 -> 38/30/28/20
; C0/C1/C2/C3 -> 58/50/48/40
    TAY
    LDX ram_0301_buffer_index
; last 8 background colors
    LDA #> $3F08
    STA ram_0302_ppu_buffer,X
    INX
    LDA #< $3F08
    STA ram_0302_ppu_buffer,X
    INX
; A = 08 (counter)
    STA ram_0302_ppu_buffer,X
    STA ram_0000_t6C_colors_counter
    INX
bra_74E2_loop:
    LDA ram_6BFA,Y
    STA ram_0302_ppu_buffer,X
    INY
    INX
    DEC ram_0000_t6C_colors_counter
    BNE bra_74E2_loop
    LDA #$FF
    STA ram_0302_ppu_buffer,X
    STX ram_0301_buffer_index
    INC ram_051C
    LDA ram_051C
    AND #$0F
    CMP #$04
    BEQ bra_7507
    LDA #$0A
    STA ram_timer_obj + $0C
bra_7506_RTS:
    RTS
bra_7507:
    LDA #$00
    RTS



tbl_750A_spr_data:
; pos y, tile, attr, pos X
    .byte $3D, $1C, $20, $00   ; 
    .byte $DD, $1C, $20, $00   ; 



sub_bat_7512:
    LDY #$00
    LDX #$00
bra_7516_loop:
    LDA tbl_750A_spr_data,X
    STA ram_oam,Y
    INX
    TXA
    AND #$07    ; fill 16 sprites with these 8 bytes, bzk is it really necessary?
    TAX
    INY
    CPY #$40
    BNE bra_7516_loop
    RTS



tbl_7527_forest_maze:
    .byte con_dir_Up     ; 00 
    .byte con_dir_Left   ; 01 
    .byte con_dir_Down   ; 02 
    .byte con_dir_Left   ; 03 



tbl_752B_mountain_ladder:   ; bzk optimize, same bytes
    .byte con_dir_Up   ; 00 
    .byte con_dir_Up   ; 01 
    .byte con_dir_Up   ; 02 
    .byte con_dir_Up   ; 03 



sub_bat_752F_check_overworld_secret_correct_path:
    LDX ram_correct_path_cnt
    LDA ram_dir_link
    LDY ram_map_location
    CPY #con_map_location + $61
    BNE bra_7558_not_forest_maze
    CMP tbl_7527_forest_maze,X
    BNE bra_754F_incorrect_path
    CPX #$03
    BEQ bra_756A_path_is_complete
bra_7543_still_not_enough:
    INC ram_correct_path_cnt
bra_7546_exit:
    STY ram_next_map_location
bra_7548_RTS:
    RTS



sub_7549_clear_path_counter:
bra_7549_not_mountain_ladder:
    LDA #$00
    STA ram_correct_path_cnt
    RTS
bra_754F_incorrect_path:
    CMP #con_dir_Right
    BEQ bra_7548_RTS
bra_7553:
    JSR sub_7549_clear_path_counter
    BEQ bra_7546_exit    ; jmp
bra_7558_not_forest_maze:
    CPY #$1B
    BNE bra_7549_not_mountain_ladder
    CMP tbl_752B_mountain_ladder,X
    BEQ bra_7566_correct_path
    CMP #con_dir_Left
    BNE bra_7553
    RTS
bra_7566_correct_path:
    CPX #$03
    BNE bra_7543_still_not_enough
bra_756A_path_is_complete:
    LDA #con_sfx_2_secret_found
    STA ram_sfx_2
    RTS



sub_bat_7570:
; in
    ; ram_0002_t18_pos_Y
    ; ram_0003_t07_pos_X
; out
    ; ram_0000_t6D
    ; ram_0001_t16
    LDA #$08
    STA ram_0000_t6D
    LDA ram_0002_t18_pos_Y
; * 04
    ASL
    ROL ram_0000_t6D
    ASL
    ROL ram_0000_t6D
    AND #$E0
    STA ram_0001_t16
    LDA ram_0003_t07_pos_X
; / 08
    LSR
    LSR
    LSR
    ORA ram_0001_t16
    STA ram_0001_t16
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF   ; 



tbl_7594:
    .byte $00   ; 00 
    .byte $08   ; 01 
    .byte $0B   ; 02 
    .byte $0F   ; 03 
    .byte $13   ; 04 
    .byte $17   ; 05 
    .byte $5C   ; 06 
    .byte $60   ; 07 
    .byte $1B   ; 08 
    .byte $1B   ; 09 
    .byte $21   ; 0A 
    .byte $21   ; 0B 
    .byte $64   ; 0C 
    .byte $6A   ; 0D 
    .byte $27   ; 0E 
    .byte $29   ; 0F 
    .byte $2B   ; 10 
    .byte $35   ; 11 
    .byte $3F   ; 12 
    .byte $70   ; 13 
    .byte $74   ; 14 
    .byte $76   ; 15 
    .byte $76   ; 16 
    .byte $78   ; 17 
    .byte $7A   ; 18 
    .byte $7E   ; 19 
    .byte $80   ; 1A 
    .byte $49   ; 1B 
    .byte $82   ; 1C 
    .byte $84   ; 1D 
    .byte $86   ; 1E 
    .byte $4B   ; 1F 
    .byte $4F   ; 20 
    .byte $4F   ; 21 
    .byte $51   ; 22 
    .byte $51   ; 23 
    .byte $88   ; 24 
    .byte $8C   ; 25 
    .byte $90   ; 26 
    .byte $90   ; 27 
    .byte $92   ; 28 
    .byte $94   ; 29 
    .byte $96   ; 2A 
    .byte $98   ; 2B 
    .byte $99   ; 2C 
    .byte $99   ; 2D 
    .byte $99   ; 2E 
    .byte $53   ; 2F 
    .byte $54   ; 30 
    .byte $9A   ; 31 
    .byte $9B   ; 32 
    .byte $9B   ; 33 
    .byte $A5   ; 34 
    .byte $A5   ; 35 
    .byte $AB   ; 36 
    .byte $AB   ; 37 
    .byte $AC   ; 38 
    .byte $AE   ; 39 
    .byte $AE   ; 3A 
    .byte $AF   ; 3B 
    .byte $AF   ; 3C 
    .byte $B2   ; 3D 
    .byte $B8   ; 3E 
    .byte $B8   ; 3F 
    .byte $08   ; 40 
    .byte $08   ; 41 
    .byte $C6   ; 42 
    .byte $C6   ; 43 
    .byte $C6   ; 44 
    .byte $C6   ; 45 
    .byte $C6   ; 46 
    .byte $C6   ; 47 
    .byte $C8   ; 48 
    .byte $C8   ; 49 
    .byte $C9   ; 4A 
    .byte $C9   ; 4B 
    .byte $CA   ; 4C 
    .byte $CA   ; 4D 
    .byte $CA   ; 4E 
    .byte $CA   ; 4F 
    .byte $CA   ; 50 
    .byte $CA   ; 51 
    .byte $CA   ; 52 
    .byte $CA   ; 53 
    .byte $09   ; 54 
    .byte $09   ; 55 
    .byte $0A   ; 56 
    .byte $0A   ; 57 
    .byte $0B   ; 58 
    .byte $0B   ; 59 
    .byte $0B   ; 5A 
    .byte $0B   ; 5B 
    .byte $0B   ; 5C 
    .byte $0B   ; 5D 
    .byte $CB   ; 5E 
    .byte $55   ; 5F 
    .byte $55   ; 60 
    .byte $55   ; 61 
    .byte $55   ; 62 
    .byte $55   ; 63 
    .byte $55   ; 64 
    .byte $55   ; 65 
    .byte $56   ; 66 
    .byte $57   ; 67 
    .byte $57   ; 68 
    .byte $CB   ; 69 
    .byte $CC   ; 6A 
    .byte $58   ; 6B 
    .byte $58   ; 6C 
    .byte $58   ; 6D 
    .byte $58   ; 6E 
    .byte $58   ; 6F 
    .byte $58   ; 70 
    .byte $58   ; 71 
    .byte $58   ; 72 
    .byte $58   ; 73 
    .byte $59   ; 74 
    .byte $59   ; 75 
    .byte $59   ; 76 
    .byte $59   ; 77 
    .byte $5A   ; 78 
    .byte $5A   ; 79 
    .byte $5A   ; 7A 
    .byte $5A   ; 7B 
    .byte $5B   ; 7C 
    .byte $5B   ; 7D 
    .byte $5B   ; 7E 



tbl_7613:
; 
    .byte $00   ; 00 
    .byte $04   ; 01 
    .byte $08   ; 02 
    .byte $0C   ; 03 
    .byte $10   ; 04 
    .byte $10   ; 05 
    .byte $14   ; 06 
    .byte $18   ; 07 
; 
    .byte $5C   ; 08 
; 
    .byte $9E   ; 09 
; 
    .byte $44   ; 0A 
; 
    .byte $CE   ; 0B 
    .byte $D2   ; 0C 
    .byte $D6   ; 0D 
    .byte $DA   ; 0E 
    .byte $CE   ; 0F 
    .byte $D2   ; 10 
    .byte $D6   ; 11 
    .byte $DA   ; 12 
; 
    .byte $F0   ; 13 
    .byte $F4   ; 14 
    .byte $F8   ; 15 
    .byte $FC   ; 16 
; 
    .byte $F0   ; 17 
    .byte $F4   ; 18 
    .byte $F8   ; 19 
    .byte $FC   ; 1A 
; 
    .byte $B4   ; 1B 
    .byte $B0   ; 1C 
    .byte $B0   ; 1D 
    .byte $B8   ; 1E 
    .byte $B2   ; 1F 
    .byte $B2   ; 20 
; 
    .byte $B4   ; 21 
    .byte $B0   ; 22 
    .byte $B0   ; 23 
    .byte $B8   ; 24 
    .byte $B2   ; 25 
    .byte $B2   ; 26 
; 
    .byte $CA   ; 27 
    .byte $CC   ; 28 
; 
    .byte $CA   ; 29 
    .byte $CC   ; 2A 
; 
    .byte $BC   ; 2B 
    .byte $BE   ; 2C 
    .byte $C0   ; 2D 
    .byte $C0   ; 2E 
    .byte $C2   ; 2F 
    .byte $C4   ; 30 
    .byte $C0   ; 31 
    .byte $C0   ; 32 
    .byte $BC   ; 33 
    .byte $BE   ; 34 
; 
    .byte $BC   ; 35 
    .byte $BE   ; 36 
    .byte $C0   ; 37 
    .byte $C0   ; 38 
    .byte $C2   ; 39 
    .byte $C4   ; 3A 
    .byte $C0   ; 3B 
    .byte $C0   ; 3C 
    .byte $BC   ; 3D 
    .byte $BE   ; 3E 
; 
    .byte $BC   ; 3F 
    .byte $BE   ; 40 
    .byte $EC   ; 41 
    .byte $EE   ; 42 
    .byte $EC   ; 43 
    .byte $EE   ; 44 
    .byte $EC   ; 45 
    .byte $EE   ; 46 
    .byte $BC   ; 47 
    .byte $BE   ; 48 
; 
    .byte $C6   ; 49 
    .byte $C8   ; 4A 
; 
    .byte $A0   ; 4B 
    .byte $A8   ; 4C 
    .byte $A4   ; 4D 
    .byte $AC   ; 4E 
; 
    .byte $90   ; 4F 
    .byte $E8   ; 50 
; 
    .byte $E4   ; 51 
    .byte $E0   ; 52 
; 
    .byte $94   ; 53 
; 
    .byte $F3   ; 54 
; 
    .byte $C9   ; 55 
; 
    .byte $BD   ; 56 
; 
    .byte $C1   ; 57 
; 
    .byte $98   ; 58 
; 
    .byte $9A   ; 59 
; 
    .byte $9C   ; 5A 
; 
    .byte $F8   ; 5B 
; 
    .byte $B8   ; 5C 
    .byte $BC   ; 5D 
    .byte $B0   ; 5E 
    .byte $B4   ; 5F 
; 
    .byte $B8   ; 60 
    .byte $BC   ; 61 
    .byte $B0   ; 62 
    .byte $B4   ; 63 
; 
    .byte $B8   ; 64 
    .byte $AC   ; 65 
    .byte $B4   ; 66 
    .byte $BC   ; 67 
    .byte $B0   ; 68 
    .byte $B4   ; 69 
; 
    .byte $B8   ; 6A 
    .byte $AC   ; 6B 
    .byte $B4   ; 6C 
    .byte $BC   ; 6D 
    .byte $B0   ; 6E 
    .byte $B4   ; 6F 
; 
    .byte $AC   ; 70 
    .byte $AE   ; 71 
    .byte $B0   ; 72 
    .byte $B2   ; 73 
; 
    .byte $A8   ; 74 
    .byte $AA   ; 75 
; 
    .byte $92   ; 76 
    .byte $94   ; 77 
; 
    .byte $A0   ; 78 
    .byte $A2   ; 79 
; 
    .byte $A6   ; 7A 
    .byte $A4   ; 7B 
    .byte $A2   ; 7C 
    .byte $A4   ; 7D 
; 
    .byte $D8   ; 7E 
    .byte $DA   ; 7F 
; 
    .byte $00   ; 80 
    .byte $00   ; 81 
; 
    .byte $9A   ; 82 
    .byte $9C   ; 83 
; 
    .byte $9A   ; 84 
    .byte $9C   ; 85 
; 
    .byte $9A   ; 86 
    .byte $9C   ; 87 
; 
    .byte $B4   ; 88 
    .byte $B8   ; 89 
    .byte $BC   ; 8A 
    .byte $BE   ; 8B 
; 
    .byte $B4   ; 8C 
    .byte $B8   ; 8D 
    .byte $BC   ; 8E 
    .byte $BE   ; 8F 
; 
    .byte $FC   ; 90 
    .byte $FE   ; 91 
; 
    .byte $AC   ; 92 
    .byte $9C   ; 93 
; 
    .byte $A0   ; 94 
    .byte $A4   ; 95 
; 
    .byte $A0   ; 96 
    .byte $A4   ; 97 
; 
    .byte $A8   ; 98 
; 
    .byte $8E   ; 99 
; 
    .byte $A4   ; 9A 
; 
    .byte $DC   ; 9B 
    .byte $E0   ; 9C 
    .byte $E4   ; 9D 
    .byte $E8   ; 9E 
    .byte $EC   ; 9F 
    .byte $F0   ; A0 
    .byte $F4   ; A1 
    .byte $F8   ; A2 
    .byte $FA   ; A3 
    .byte $FE   ; A4 
; 
    .byte $F4   ; A5 
    .byte $F6   ; A6 
    .byte $FE   ; A7 
    .byte $FC   ; A8 
    .byte $F0   ; A9 
    .byte $F8   ; AA 
; 
    .byte $B0   ; AB 
; 
    .byte $F6   ; AC 
    .byte $F0   ; AD 
; 
    .byte $D4   ; AE 
; 
    .byte $FC   ; AF 
    .byte $FE   ; B0 
    .byte $F8   ; B1 
; 
    .byte $E8   ; B2 
    .byte $EA   ; B3 
    .byte $E0   ; B4 
    .byte $E4   ; B5 
    .byte $EC   ; B6 
    .byte $EC   ; B7 
; 
    .byte $D0   ; B8 
    .byte $D4   ; B9 
    .byte $D8   ; BA 
    .byte $DC   ; BB 
    .byte $E0   ; BC 
    .byte $E4   ; BD 
    .byte $C0   ; BE 
    .byte $C8   ; BF 
    .byte $C4   ; C0 
    .byte $CC   ; C1 
    .byte $E8   ; C2 
    .byte $EA   ; C3 
    .byte $72   ; C4 
    .byte $74   ; C5 
; 
    .byte $DE   ; C6 
    .byte $EE   ; C7 
; 
    .byte $F8   ; C8 
; 
    .byte $96   ; C9 
; 
    .byte $98   ; CA 
; 
    .byte $B1   ; CB 



tbl_76DF_spr_A:
; 
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $00   ; 02 
    .byte $00   ; 03 
    .byte $00   ; 04 
    .byte $00   ; 05 
    .byte $00   ; 06 
    .byte $00   ; 07 
; 
    .byte $02   ; 08 
; 
    .byte $00   ; 09 
; 
    .byte $00   ; 0A 
; 
    .byte $01   ; 0B 
    .byte $01   ; 0C 
    .byte $01   ; 0D 
    .byte $01   ; 0E 
    .byte $02   ; 0F 
    .byte $02   ; 10 
    .byte $02   ; 11 
    .byte $02   ; 12 
; 
    .byte $03   ; 13 
    .byte $03   ; 14 
    .byte $03   ; 15 
    .byte $03   ; 16 
; 
    .byte $02   ; 17 
    .byte $02   ; 18 
    .byte $02   ; 19 
    .byte $02   ; 1A 
; 
    .byte $02   ; 1B 
    .byte $82   ; 1C 
    .byte $02   ; 1D 
    .byte $02   ; 1E 
    .byte $82   ; 1F 
; 
    .byte $02   ; 20 
    .byte $01   ; 21 
    .byte $81   ; 22 
    .byte $01   ; 23 
    .byte $01   ; 24 
    .byte $81   ; 25 
    .byte $01   ; 26 
; 
    .byte $01   ; 27 
    .byte $01   ; 28 
; 
    .byte $02   ; 29 
    .byte $02   ; 2A 
; 
    .byte $02   ; 2B 
    .byte $02   ; 2C 
    .byte $01   ; 2D 
    .byte $01   ; 2E 
    .byte $01   ; 2F 
    .byte $01   ; 30 
    .byte $01   ; 31 
    .byte $01   ; 32 
    .byte $02   ; 33 
    .byte $02   ; 34 
; 
    .byte $02   ; 35 
    .byte $02   ; 36 
    .byte $02   ; 37 
    .byte $02   ; 38 
    .byte $02   ; 39 
    .byte $02   ; 3A 
    .byte $02   ; 3B 
    .byte $02   ; 3C 
    .byte $02   ; 3D 
    .byte $02   ; 3E 
; 
    .byte $03   ; 3F 
    .byte $03   ; 40 
    .byte $03   ; 41 
    .byte $03   ; 42 
    .byte $03   ; 43 
    .byte $03   ; 44 
    .byte $03   ; 45 
    .byte $03   ; 46 
    .byte $03   ; 47 
    .byte $03   ; 48 
; 
    .byte $02   ; 49 
    .byte $02   ; 4A 
; 
    .byte $02   ; 4B 
    .byte $02   ; 4C 
    .byte $02   ; 4D 
    .byte $02   ; 4E 
; 
    .byte $02   ; 4F 
    .byte $02   ; 50 
; 
    .byte $01   ; 51 
    .byte $01   ; 52 
; 
    .byte $01   ; 53 
; 
    .byte $02   ; 54 
; 
    .byte $03   ; 55 
; 
    .byte $03   ; 56 
; 
    .byte $03   ; 57 
; 
    .byte $02   ; 58 
; 
    .byte $02   ; 59 
; 
    .byte $00   ; 5A 
; 
    .byte $02   ; 5B 
; 
    .byte $01   ; 5C 
    .byte $01   ; 5D 
    .byte $01   ; 5E 
    .byte $01   ; 5F 
; 
    .byte $02   ; 60 
    .byte $02   ; 61 
    .byte $02   ; 62 
    .byte $02   ; 63 
; 
    .byte $02   ; 64 
    .byte $02   ; 65 
    .byte $02   ; 66 
    .byte $02   ; 67 
    .byte $02   ; 68 
    .byte $02   ; 69 
; 
    .byte $01   ; 6A 
    .byte $01   ; 6B 
    .byte $01   ; 6C 
    .byte $01   ; 6D 
    .byte $01   ; 6E 
    .byte $01   ; 6F 
; 
    .byte $01   ; 70 
    .byte $01   ; 71 
    .byte $01   ; 72 
    .byte $01   ; 73 
; 
    .byte $03   ; 74 
    .byte $03   ; 75 
; 
    .byte $03   ; 76 
    .byte $03   ; 77 
; 
    .byte $00   ; 78 
    .byte $00   ; 79 
; 
    .byte $02   ; 7A 
    .byte $02   ; 7B 
    .byte $02   ; 7C 
    .byte $02   ; 7D 
; 
    .byte $03   ; 7E 
    .byte $03   ; 7F 
; 
    .byte $03   ; 80 
    .byte $03   ; 81 
; 
    .byte $01   ; 82 
    .byte $01   ; 83 
; 
    .byte $02   ; 84 
    .byte $02   ; 85 
; 
    .byte $03   ; 86 
    .byte $03   ; 87 
; 
    .byte $01   ; 88 
    .byte $01   ; 89 
    .byte $01   ; 8A 
    .byte $01   ; 8B 
; 
    .byte $02   ; 8C 
    .byte $02   ; 8D 
    .byte $02   ; 8E 
    .byte $02   ; 8F 
; 
    .byte $01   ; 90 
    .byte $01   ; 91 
; 
    .byte $01   ; 92 
    .byte $01   ; 93 
; 
    .byte $02   ; 94 
    .byte $02   ; 95 
; 
    .byte $02   ; 96 
    .byte $02   ; 97 
; 
    .byte $02   ; 98 
; 
    .byte $02   ; 99 
; 
    .byte $01   ; 9A 
; 
    .byte $03   ; 9B 
    .byte $03   ; 9C 
    .byte $03   ; 9D 
    .byte $03   ; 9E 
    .byte $03   ; 9F 
    .byte $03   ; A0 
    .byte $03   ; A1 
    .byte $03   ; A2 
    .byte $03   ; A3 
    .byte $03   ; A4 
; 
    .byte $01   ; A5 
    .byte $01   ; A6 
    .byte $01   ; A7 
    .byte $01   ; A8 
    .byte $01   ; A9 
    .byte $01   ; AA 
; 
    .byte $02   ; AB 
; 
    .byte $00   ; AC 
    .byte $00   ; AD 
; 
    .byte $03   ; AE 
; 
    .byte $01   ; AF 
    .byte $01   ; B0 
    .byte $01   ; B1 
; 
    .byte $01   ; B2 
    .byte $01   ; B3 
    .byte $01   ; B4 
    .byte $01   ; B5 
    .byte $01   ; B6 
    .byte $01   ; B7 
; 
    .byte $03   ; B8 
    .byte $03   ; B9 
    .byte $03   ; BA 
    .byte $03   ; BB 
    .byte $03   ; BC 
    .byte $03   ; BD 
    .byte $03   ; BE 
    .byte $03   ; BF 
    .byte $03   ; C0 
    .byte $03   ; C1 
    .byte $03   ; C2 
    .byte $03   ; C3 
    .byte $03   ; C4 
    .byte $03   ; C5 
; 
    .byte $02   ; C6 
    .byte $02   ; C7 
; 
    .byte $01   ; C8 
; 
    .byte $01   ; C9 
; 
    .byte $02   ; CA 
; 
    .byte $03   ; CB 



tbl_77AB:
tbl_bat_77AB:
; reading 2 bytes at a time (mostly)
    .byte $60   ; 
    .byte $BC   ; 
    .byte $64   ; 
    .byte $B8   ; 
    .byte $68   ; 
    .byte $B4   ; 
    .byte $6C   ; 
    .byte $B0   ; 
    .byte $70   ; 
    .byte $CC   ; 
    .byte $74   ; 
    .byte $C8   ; 
    .byte $78   ; 
    .byte $C4   ; 
    .byte $7C   ; 
    .byte $C0   ; 
    .byte $80   ; 
    .byte $DC   ; 
    .byte $84   ; 
    .byte $D8   ; 
    .byte $88   ; 
    .byte $D4   ; 
    .byte $8C   ; 
    .byte $D0   ; 
    .byte $90   ; 
    .byte $EC   ; 
    .byte $94   ; 
    .byte $E8   ; 
    .byte $98   ; 
    .byte $E4   ; 
    .byte $9C   ; 
    .byte $E0   ; 
    .byte $A0   ; 
    .byte $FC   ; 
    .byte $A4   ; 
    .byte $F8   ; 
    .byte $A8   ; 
    .byte $F4   ; 
    .byte $AC   ; 
    .byte $F0   ; 
    .byte $60   ; 



sub_bat_77D4:
    JSR sub_0x01FA5F
    TYA
    JMP loc_77DF



loc_77DB:
sub_bat_77DB:
loc_bat_77DB:
; in
    ; A = 
    ; Y = 
    ; ram_000F_t04_flag
    LDY #$01
    BNE bra_77E1    ; jmp



loc_77DF:   ; A = 02 03
sub_bat_77DF:
loc_bat_77DF:
; in
    ; A = 
    ; ram_000F_t04_flag
    LDY #$00
bra_77E1:   ; Y = 01
    STY ram_000C_t07_flag
    LDY ram_obj_id_enemy - $01,X
sub_bat_77E6:
; in
    ; A = 
    ; Y = 
    ; ram_000F_t04_flag
    INY
sub_bat_77E7:
; in
    ; A = 
    ; Y = 
    ; ram_000F_t04_flag
    STA ram_000D_t04_table_offset
    STY ram_000E_t02
    STX ram_0008_t07
    LDY ram_counter_00_27
    LDA tbl_77AB,Y
    STA ram_spr_index_1
    LDA tbl_77AB + $01,Y
    CPX #$00
    BNE bra_7804
; if link
    LDA #$48
    STA ram_spr_index_1
    LDA #$4C
bra_7804:
loc_bat_7804:
    STA ram_spr_index_2
    LDY ram_000E_t02
    LDA #$01
    STA ram_0007_t06_sprites_counter
    LDA #$08
    STA ram_000A_t13_spr_X
    LDA tbl_7594,Y
    CLC
    ADC ram_000D_t04_table_offset
    TAY
    LDA tbl_7613,Y
    STA ram_0002_t45_spr_T
    CLC
    ADC #$02
    STA ram_0002_t45_spr_T + $01
    CPX #$00
    BEQ bra_7838
    CPX #$0D
    BCS bra_7838
; 01-0C
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_02
    BNE bra_7849
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_08
    BNE bra_783E
bra_7838:
    LDA tbl_76DF_spr_A,Y
    JSR sub_7988_set_spr_A
bra_783E:
    CPX #$00
    BEQ bra_784E
    LDY ram_000C_t07_flag
    BEQ bra_784E
    JMP loc_7979
bra_7849:
    DEC ram_0007_t06_sprites_counter
    JMP loc_7868
bra_784E:
loc_784E:
    LDA ram_000F_t04_flag
    BEQ bra_7868
; swap
    LDA ram_0002_t45_spr_T
    PHA
    LDA ram_0002_t45_spr_T + $01
    STA ram_0002_t45_spr_T
    PLA
    STA ram_0002_t45_spr_T + $01
; 
    LDA ram_0004_t13_spr_A
    EOR #$40
    STA ram_0004_t13_spr_A
    LDA ram_0004_t13_spr_A + $01
    EOR #$40
    STA ram_0004_t13_spr_A + $01
bra_7868:
loc_7868:
    LDY ram_invinc_enemy,X
    BEQ bra_7885
    LDY #$01
bra_786F_loop:
    LDA ram_0004_t13_spr_A,Y
    AND #$FC
    STA ram_0004_t13_spr_A,Y
    LDA ram_invinc_enemy,X
    AND #$03
    ORA ram_0004_t13_spr_A,Y
    STA ram_0004_t13_spr_A,Y
    DEY
    BPL bra_786F_loop
bra_7885:
sub_bat_7885:
; in
    ; ram_0000_t21_spr_X
    ; ram_0001_t15_spr_Y
    ; ram_0002_t45_spr_T
    ; ram_0004_t13_spr_A
    LDX ram_spr_index_1
    LDY #$00
bra_788A_loop:
    LDA ram_0002_t45_spr_T,Y
    STA ram_spr_T,X
    LDA ram_0001_t15_spr_Y
    STA ram_spr_Y,X
    LDA ram_0000_t21_spr_X
    STA ram_spr_X,X
    CLC
    ADC ram_000A_t13_spr_X
    STA ram_0000_t21_spr_X
    LDA ram_0004_t13_spr_A,Y
    STA ram_spr_A,X
    LDX ram_spr_index_2
; bzk bug? 0008 can bew from ram_0008_t03_data
    LDA ram_0008_t07
    BEQ bra_78AF
    JSR sub_6E36_increase_counter_00_27
bra_78AF:
    INY
    DEC ram_0007_t06_sprites_counter
    BPL bra_788A_loop
; bzk bug? 0008 can bew from ram_0008_t03_data
    LDX ram_0008_t07
    RTS



tbl_78B7_index:
    .byte $00   ; 00 
    .byte $03   ; 01 
    .byte $07   ; 02 
    .byte $0A   ; 03 
    .byte $0B   ; 04 
    .byte $0C   ; 05 
    .byte $0D   ; 06 
    .byte $0E   ; 07 
    .byte $0F   ; 08 
    .byte $11   ; 09 
    .byte $12   ; 0A 
    .byte $13   ; 0B 
    .byte $14   ; 0C 
    .byte $15   ; 0D 
    .byte $16   ; 0E 
    .byte $17   ; 0F 
    .byte $18   ; 10 
    .byte $17   ; 11 
    .byte $18   ; 12 
    .byte $17   ; 13 
    .byte $19   ; 14 
    .byte $1B   ; 15 
    .byte $1C   ; 16 
    .byte $1D   ; 17 
    .byte $1E   ; 18 
    .byte $1F   ; 19 
    .byte $20   ; 1A 
    .byte $21   ; 1B 
    .byte $1C   ; 1C 
    .byte $22   ; 1D 
    .byte $22   ; 1E 
    .byte $26   ; 1F 
    .byte $27   ; 20 
    .byte $28   ; 21 
    .byte $29   ; 22 
    .byte $2B   ; 23 
    .byte $2E   ; 24 



tbl_78DC:
    .byte $20   ; 00 
    .byte $82   ; 01 
    .byte $3C   ; 02 
    .byte $34   ; 03 
    .byte $70   ; 04 
    .byte $72   ; 05 
    .byte $74   ; 06 
    .byte $28   ; 07 
    .byte $86   ; 08 
    .byte $3C   ; 09 
    .byte $2A   ; 0A 
    .byte $26   ; 0B 
    .byte $24   ; 0C 
    .byte $22   ; 0D 
    .byte $40   ; 0E 
    .byte $4A   ; 0F 
    .byte $8A   ; 10 
    .byte $6C   ; 11 
    .byte $42   ; 12 
    .byte $46   ; 13 
    .byte $76   ; 14 
    .byte $2C   ; 15 
    .byte $4E   ; 16 
    .byte $4C   ; 17 
    .byte $6A   ; 18 
    .byte $50   ; 19 
    .byte $52   ; 1A 
    .byte $66   ; 1B 
    .byte $32   ; 1C 
    .byte $2E   ; 1D 
    .byte $68   ; 1E 
    .byte $F3   ; 1F 
    .byte $6E   ; 20 
    .byte $F2   ; 21 
    .byte $36   ; 22 
    .byte $38   ; 23 
    .byte $3A   ; 24 
    .byte $3C   ; 25 
    .byte $56   ; 26 
    .byte $48   ; 27 
    .byte $78   ; 28 
    .byte $20   ; 29 
    .byte $82   ; 2A 
    .byte $7A   ; 2B 
    .byte $7C   ; 2C 
    .byte $30   ; 2D 
    .byte $64   ; 2E 
    .byte $62   ; 2F 



sub_bat_790C:
loc_bat_790C:
; in
    ; A = 
    ; X = 
    ; Y = 
    JSR sub_7988_set_spr_A
    LDA #$00
    STA ram_000F_t04_flag
    STA ram_000C_t06_table_offset
loc_bat_7915:     ; Y = 14
sub_bat_7915:     ; Y = 00 08 23 24
    TYA
    PHA
    LDA #$00
    STA ram_0052
    LDY ram_counter_00_27
    LDA tbl_77AB,Y
    STA ram_spr_index_1
    LDA tbl_77AB + $01,Y
    STA ram_spr_index_2
    PLA
    TAY
sub_bat_792C:     ; Y = 21
    STX ram_0008_t07
    LDA #$01
    STA ram_0007_t06_sprites_counter
    LDA #$08
    STA ram_000A_t13_spr_X
    LDA tbl_78B7_index,Y
    CLC
    ADC ram_000C_t06_table_offset
    TAY
    LDA tbl_78DC,Y
    STA ram_0002_t45_spr_T
    CLC
    ADC #$02
    STA ram_0002_t45_spr_T + $01
    LDA ram_0002_t45_spr_T
    CMP #$F3
    BEQ bra_7955
    CMP #$20
    BCC bra_796A
    CMP #$62
    BCS bra_796A
bra_7955:
    LDA ram_0504
    BNE bra_7961
    LDA ram_0000_t21_spr_X
    CLC
    ADC #$04
    STA ram_0000_t21_spr_X
bra_7961:
    INC ram_0052
    LDA #$00
    STA ram_0007_t06_sprites_counter
    JMP loc_7868
bra_796A:
    CMP #$6C
    BCC bra_7975
    CMP #$7C
    BCC bra_7979
    JMP loc_784E
bra_7975:
    LDA #$07
    STA ram_000A_t13_spr_X
bra_7979:
loc_7979:
    LDA ram_0002_t45_spr_T
    STA ram_0002_t45_spr_T + $01
    LDA ram_0004_t14 + $01
    EOR #$40
    STA ram_0004_t14 + $01
    JMP loc_7868



sub_bat_7986:
    LDA #$02
sub_7988_set_spr_A:
sub_bat_7988_set_spr_A:
loc_bat_7988_set_spr_A:
; in
    ; A = 
; out
    ; ram_0004_t13_spr_A
    STA ram_0004_t13_spr_A
    STA ram_0004_t14 + $01
    RTS



sub_bat_798D:
    LDY #$03
    STY ram_0003_t16_spr_A
sub_bat_7991:
    PHA ; spr_T
    LDA ram_invinc_enemy,X
    BEQ bra_799D
    LDA ram_frm_cnt
    AND #$03
    STA ram_0003_t16_spr_A
bra_799D:
    LDY ram_counter_00_27
    LDA tbl_77AB,Y
    TAY
    PLA ; spr_T
sub_bat_79A5:
    STA ram_spr_T,Y
    LDA ram_pos_X_enemy,X
    STA ram_spr_X,Y
    LDA ram_pos_Y_enemy,X
loc_bat_79AF:
    STA ram_spr_Y,Y
    LDA ram_0003_t16_spr_A
    STA ram_spr_A,Y
    JMP loc_6E36_increase_counter_00_27



loc_bat_79BA:
    JSR sub_79D0
    LDA ram_0405_enemy + $01
    BEQ bra_79CA
    STA ram_04CC_flag
    LDA #$00
    STA ram_0405_enemy + $01
bra_79CA:
sub_bat_79CA:
loc_bat_79CA:
; in
    ; X = 
    JSR sub_0x01FAA3
; A = 00
    JMP loc_77DB



sub_79D0:
sub_bat_79D0:
loc_bat_79D0:
    JSR sub_7A2D
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_20
    BNE bra_79FD
    LDA ram_invinc_enemy,X
    BNE bra_7A1C_RTS
    LDY #$0F
    JSR sub_7BC2
    LDY #$0E
    JSR sub_7C9D
    LDY #$10
    JSR sub_7CDC
    LDY #$11
    JSR sub_7CDC
    LDY #$0D
    JSR sub_7D29
    LDY #$12
    JSR sub_7D5F
bra_79FD:
    JSR sub_7AA7
    LDA ram_obj_id_enemy - $01,X
    LDY ram_0405_enemy,X
    BEQ bra_7A1D
    CMP #con_obj_id_05
    BEQ bra_7A10
    CMP #con_obj_id_06
    BNE bra_7A1C_RTS
bra_7A10:
    LDA ram_state_obj,X
    BPL bra_7A1C_RTS
    LDY ram_042B_enemy,X
    LDA #con_obj_id_null
    STA ram_obj_id_enemy - $01,Y
bra_7A1C_RTS:
    RTS
bra_7A1D:
    CMP #$27
    BEQ bra_7A25
    CMP #$17
    BNE bra_7A2C_RTS
bra_7A25:
    LDA ram_000C_t12_flag
    BEQ bra_7A2C_RTS
    INC ram_042B_enemy,X
bra_7A2C_RTS:
    RTS



sub_7A2D:
sub_bat_7A2D:
; out
    ; ram_0002_t34_pos_X
    ; ram_0003_t21_pos_Y
    LDA #$08
    STA ram_0002_t35_pos_X
; bzk optimize, A is always 08
    STA ram_0003_t13_useless_08
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_40
    BEQ bra_7A3C
    LSR ram_0002_t35_pos_X    ; -> 04
bra_7A3C:
    LDA ram_pos_X_enemy,X
    CLC
    ADC ram_0002_t35_pos_X
    STA ram_0002_t34_pos_X
    LDA ram_pos_Y_enemy,X
    CLC
; bzk optimize, always 08
    ADC ram_0003_t13_useless_08
    STA ram_0003_t21_pos_Y
    RTS



tbl_7A4B_damage_taken:
;                                              +----------- damage hi
;                                              |     +----- damage lo
;                                              |     |
    .byte $00 + $02   ; 01 
    .byte $00 + $01   ; 02 
    .byte $80 + $00   ; 03 
    .byte $80 + $00   ; 04 
    .byte $00 + $01   ; 05 
    .byte $80 + $00   ; 06 
    .byte $80 + $00   ; 07 
    .byte $80 + $00   ; 08 
    .byte $80 + $00   ; 09 
    .byte $80 + $00   ; 0A 
    .byte $00 + $01   ; 0B 
    .byte $00 + $02   ; 0C 
    .byte $80 + $00   ; 0D 
    .byte $80 + $00   ; 0E 
    .byte $00 + $01   ; 0F 
    .byte $80 + $00   ; 10 
    .byte $80 + $00   ; 11 
    .byte $00 + $01   ; 12 
    .byte $00 + $01   ; 13 
    .byte $80 + $00   ; 14 
    .byte $80 + $00   ; 15 
    .byte $00 + $02   ; 16 
    .byte $00 + $01   ; 17 
    .byte $00 + $02   ; 18 
    .byte $00 + $00   ; 19 
    .byte $80 + $00   ; 1A 
    .byte $80 + $00   ; 1B 
    .byte $80 + $00   ; 1C 
    .byte $80 + $00   ; 1D 
    .byte $00 + $01   ; 1E 
    .byte $80 + $00   ; 1F 
    .byte $80 + $00   ; 20 
    .byte $00 + $01   ; 21 
    .byte $00 + $01   ; 22 
    .byte $00 + $02   ; 23 
    .byte $00 + $01   ; 24 
    .byte $00 + $02   ; 25 
    .byte $00 + $02   ; 26 
    .byte $80 + $00   ; 27 
    .byte $80 + $00   ; 28 
    .byte $80 + $00   ; 29 
    .byte $80 + $00   ; 2A 
    .byte $00 + $00   ; 2B 
    .byte $00 + $00   ; 2C 
    .byte $00 + $00   ; 2D 
    .byte $00 + $00   ; 2E 
    .byte $00 + $00   ; 2F 
    .byte $00 + $02   ; 30 
    .byte $00 + $01   ; 31 
    .byte $00 + $01   ; 32 
    .byte $00 + $02   ; 33 
    .byte $00 + $02   ; 34 
    .byte $00 + $00   ; 35 
    .byte $00 + $00   ; 36 
    .byte $00 + $00   ; 37 
    .byte $00 + $02   ; 38 
    .byte $00 + $02   ; 39 
    .byte $00 + $02   ; 3A 
    .byte $00 + $02   ; 3B 
    .byte $00 + $01   ; 3C 
    .byte $00 + $01   ; 3D 
    .byte $00 + $04   ; 3E 
    .byte $80 + $00   ; 3F 
    .byte $80 + $00   ; 40 
    .byte $80 + $00   ; 41 
    .byte $00 + $01   ; 42 
    .byte $00 + $01   ; 43 
    .byte $00 + $01   ; 44 
    .byte $00 + $01   ; 45 
    .byte $00 + $01   ; 46 
    .byte $00 + $02   ; 47 
    .byte $00 + $02   ; 48 
    .byte $00 + $01   ; 49 
    .byte $00 + $01   ; 4A 
    .byte $00 + $00   ; 4B 
    .byte $00 + $00   ; 4C 
    .byte $00 + $00   ; 4D 
    .byte $00 + $00   ; 4E 
    .byte $00 + $00   ; 4F 
    .byte $00 + $00   ; 50 
    .byte $00 + $00   ; 51 
    .byte $00 + $00   ; 52 
    .byte $80 + $00   ; 53 
    .byte $80 + $00   ; 54 
    .byte $80 + $00   ; 55 
    .byte $00 + $01   ; 56 
    .byte $00 + $02   ; 57 
    .byte $00 + $02   ; 58 
    .byte $00 + $04   ; 59 
    .byte $00 + $04   ; 5A 
    .byte $80 + $00   ; 5B 
    .byte $00 + $01   ; 5C 



sub_7AA7:
sub_bat_7AA7:
loc_bat_7AA7:
    JSR sub_7A2D
    LDA #$00
    STA ram_034B_flag
    STA ram_0006_t10_flag
    STA ram_0009_t02
    STA ram_000C_t12_flag
    LDY #$00
    STY ram_0000_t2A
    LDA ram_invinc_link
    ORA ram_item_clock
    ORA ram_003D_link
    ORA ram_003D_enemy,X
    BNE bra_7B39_RTS
sub_bat_7AC5:
    LDA ram_state_link
    CMP #con_obj_state_freeze
    BEQ bra_7B39_RTS
    LDA ram_0512_flag
    BNE bra_7B39_RTS
    LDA ram_obj_id_enemy - $01,X
    CMP #$53
    BCC bra_7ADF
; if projectile
    LDA ram_state_obj,X
    AND #$F0
    CMP #$10
    BNE bra_7B39_RTS
bra_7ADF:
    LDA ram_pos_X_link
    CLC
    ADC #$08
    STA ram_0004_t10_pos_X
    LDA ram_pos_Y_link
    CLC
    ADC #$08
    STA ram_0005_t08_pos_Y
    LDA #$09
    JSR sub_7DFB
    BEQ bra_7B39_RTS
    LDA ram_obj_id_enemy - $01,X
    CMP #$53
    BCC bra_7B3A_getting_hit
    INC ram_034B_flag
    CMP #$56
    BEQ bra_7B3A_getting_hit
    CMP #$5A
    BEQ bra_7B3A_getting_hit
    LDA ram_state_link
    AND #con_obj_state_10 + con_obj_state_20 + con_obj_state_freeze + con_obj_state_80
    BNE bra_7B3A_getting_hit
    LDA ram_dir_link
    ORA ram_dir_enemy,X
    AND #con_dir__UD
    CMP #con_dir__UD
    BEQ bra_7B20
    LDA ram_dir_link
    ORA ram_dir_enemy,X
    AND #con_dir__LR
    CMP #con_dir__LR
    BNE bra_7B3A_getting_hit
bra_7B20:
    LDA ram_obj_id_enemy - $01,X
    CMP #$55
    BCC bra_7B30_normal_projectile
    CMP #$5B
    BCS bra_7B30_normal_projectile
; 55-5A magic projectile
    LDA ram_item_magic_shield
    BEQ bra_7B3A_getting_hit    ; if no magic shield
bra_7B30_normal_projectile:
    LDA #con_sfx_4_shield_block
    STA ram_sfx_4
    LDA #$00
    STA ram_0006_t10_flag
bra_7B39_RTS:
    RTS
bra_7B3A_getting_hit:
    JSR sub_7E26
    INC ram_000C_t12_flag
    LDY ram_obj_id_enemy - $01,X
    LDA tbl_7A4B_damage_taken - $01,Y
    PHA
    AND #$0F
    STA ram_000D_t01_damage_lo
    PLA
    AND #$F0
    STA ram_000E_t03_damage_hi
loc_bat_7B4F:
    LDY ram_obj_id_enemy - $01,X
    CPY #con_obj_id_2E
    BEQ bra_7B5B
    LDA #con_sfx_1_plr_hit
    JSR sub_6D7C_set_sfx_1
bra_7B5B:
    LDY ram_item_ring
    BEQ bra_7B67_no_ring
; if have ring, 1/2 damage for blue ring and 1/4 damage for red ring
bra_7B60_loop:
; divide damage by 2
    LSR ram_000D_t01_damage_lo
    ROR ram_000E_t03_damage_hi
    DEY
    BNE bra_7B60_loop
bra_7B67_no_ring:
bra_7B67_loop:
    LDA #$00
    STA ram_total_kill_cnt
    STA ram_0050
    STA ram_0051
    LDA ram_item_hearts + $01
    CMP ram_000E_t03_damage_hi
    BCC bra_7B90
    SEC
    SBC ram_000E_t03_damage_hi
    STA ram_item_hearts + $01
    LDA ram_item_hearts
    AND #$0F
    CMP ram_000D_t01_damage_lo
    BCC bra_7BA9_death
    LDA ram_item_hearts
    SEC
    SBC ram_000D_t01_damage_lo
    STA ram_item_hearts
    RTS
bra_7B90:
    LDA ram_000E_t03_damage_hi
    SEC
    SBC ram_item_hearts + $01
    STA ram_000E_t03_damage_hi
    LDA ram_item_hearts
    AND #$0F
    BEQ bra_7BA9_death
    DEC ram_item_hearts
    LDA #$FF
    STA ram_item_hearts + $01
    BNE bra_7B67_loop    ; jmp
bra_7BA9_death:
    LDA ram_item_hearts
    AND #$F0
    STA ram_item_hearts
    JSR sub_0x01EBB3_clear_subscript
; A = 00
    STA ram_item_hearts + $01
    STA ram_state_link  ; con_obj_state_00
    LDA #con_script_death
    STA ram_script
    LDA #con_dir_Down
    STA ram_dir_link
bra_7BC1_RTS:
    RTS



sub_7BC2:
    LDA ram_state_obj,Y
    ASL
    BCS bra_7BC1_RTS
    STY ram_0000_t2A
    LDA #$02
    STA ram_0009_t02
    LDA #$0A
    STA ram_000D_t11
    STA ram_000E_t05
    LDA ram_pos_X_enemy,Y
    CLC
    ADC #$04
    STA ram_0004_t10_pos_X
    LDA ram_pos_Y_enemy,Y
    CLC
    ADC #$08
loc_7BE2:
; in
    ; ram_0000_t2A
    STA ram_0005_t08_pos_Y
    LDA #$00
    STA ram_0006_t10_flag
    LDY ram_0000_t2A
    LDA ram_state_obj,Y
    BEQ bra_7C68_RTS
    JSR sub_7DFF
    BEQ bra_7C68_RTS
    CPY #$0F
    BNE bra_7C16
    LDA ram_04B2_enemy,X
    AND ram_0009_t02
    BEQ bra_7C02
    JSR sub_7DC5_shield_block_sfx
bra_7C02:
    LDA #$50
    STA ram_state_obj,Y
    LDA ram_04B2_enemy,X
    AND ram_0009_t02
    BNE bra_7C68_RTS
    LDA #$00
    STA ram_0007_t09_damage_to_enemy
    LDA #$10
    STA ram_003D_enemy,X
bra_7C16:
sub_7C16:
    LDA ram_04B2_enemy,X
    AND ram_0009_t02
    BNE bra_7C69
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_33
    BEQ bra_7C28
    CMP #con_obj_id_34
    BNE bra_7C2B
bra_7C28:
; triggers at 63155 frame 1st quest demo, when hitting some orange bat with an arrow 
    JMP loc_0x012450
bra_7C2B:
    CMP #con_obj_id_13
    BEQ bra_7C33
    CMP #con_obj_id_12
    BNE bra_7C3F
bra_7C33:
    CPY #$0F
    BEQ bra_7C54
    LDA ram_dir_obj,Y
    STA ram_dir_obj,X
    JMP loc_7C54
bra_7C3F:
    CMP #con_obj_id_0B
    BEQ bra_7C47
    CMP #con_obj_id_0C
    BNE bra_7C54
bra_7C47:
    LDA ram_dir_obj,Y
    ORA ram_dir_obj,X
    CMP #con_dir__UD
    BEQ bra_7C69
    CMP #$03
    BEQ bra_7C69
bra_7C54:
loc_7C54:
sub_bat_7C54:
    LDA #con_sfx_4_enemy_hit
    STA ram_sfx_4
    LDA ram_hp_ememy - $01 - $01,X
    CMP ram_0007_t09_damage_to_enemy
    BCC bra_7C76
    SEC
    SBC ram_0007_t09_damage_to_enemy
    STA ram_hp_ememy - $01 - $01,X
    BEQ bra_7C76
bra_7C68_RTS:
    RTS
bra_7C69:
    LDA ram_0009_t02
    CMP #$20
    BEQ bra_7C68_RTS
    CMP #$08
    BEQ bra_7C68_RTS
    JMP loc_7DC5_shield_block_sfx
bra_7C76:
    INC ram_total_kill_cnt
    LDA ram_0050
    CMP #$0A
    BCS bra_7C8F
    INC ram_0050
    LDA ram_0050
    CMP #$0A
    BNE bra_7C8F
    LDA ram_0009_t02
    CMP #$08
    BNE bra_7C8F
    INC ram_0051
bra_7C8F:
    JSR sub_0x01FEB6
    LDA #$00
    STA ram_003D_enemy,X
sub_bat_7C96:
    JSR sub_0x01EEF6
    STA ram_invinc_enemy,X
    RTS



sub_7C9D:
sub_bat_7C9D:
    STY ram_0000_t2A
    LDA #$10
    STA ram_0009_t02
    LDA ram_state_obj,Y
    LSR
    BCS bra_7CDB_RTS
    LDA #$0C
    STA ram_000D_t11
    LDA ram_state_obj,Y
    LDY #$20
    ASL
    BCS bra_7CCA
    LDA #$01
    STA ram_0009_t02
    LDY #$40
    LDA ram_item_sword
    CMP #$03
    BEQ bra_7CCA
    LDY #$20
    CMP #$02
    BEQ bra_7CCA
    LDY #$10
bra_7CCA:
    TYA
    JSR sub_7D86
    LDA ram_0006_t10_flag
    BEQ bra_7CDB_RTS
    TXA
    PHA
    LDX #$0E
    JSR sub_0x01F3E4
    PLA
    TAX
bra_7CDB_RTS:
    RTS



sub_7CDC:
sub_bat_7CDC:
    STY ram_0000_t2A
    LDA #$20
    STA ram_0009_t02
    LDA #$10
    STA ram_0007_t09_damage_to_enemy
    LDA #$0E
    STA ram_000D_t12
    LDA ram_state_obj,Y
    CMP #$20
    BCS bra_7D01
    CMP #$13
    BNE bra_7D25_RTS
    LDA #$08
    STA ram_0009_t02
    LDA #$40
    STA ram_0007_t09_damage_to_enemy
    LDA #$18
    STA ram_000D_t12
bra_7D01:
    LDA ram_pos_X_enemy,Y
    CLC
    ADC #$08
    STA ram_0004_t10_pos_X
    LDA ram_pos_Y_enemy,Y
    CLC
    ADC #$08
    STA ram_0005_t08_pos_Y
    LDA ram_000D_t12
    JSR sub_7DFB
    BEQ bra_7D25_RTS
    JSR sub_7C16
    LDA ram_04B2_enemy,X
    AND ram_0009_t02
    BNE bra_7D25_RTS
; bzk optimize, JMP
    JSR sub_7E26
bra_7D25_RTS:
    RTS



tbl_7D26:
    .byte $10   ; wooden
    .byte $20   ; white
    .byte $40   ; magical



sub_7D29:
sub_bat_7D29:
loc_bat_7D29:
    STY ram_0000_t2A
    LDA #$01
    STA ram_0009_t02
    LDA ram_state_obj,Y
    CMP #$02
    BNE bra_7D25_RTS
    LDY ram_item_sword
    LDA tbl_7D26 - $01,Y
bra_7D3C:
    STA ram_0007_t09_damage_to_enemy
    LDA ram_dir_link
    AND #con_dir__UD
    BEQ bra_7D4D
    LDA #$0C
    STA ram_000D_t11
    LDA #$10
    JMP loc_7D53
bra_7D4D:
    LDA #$10
    STA ram_000D_t11
    LDA #$0C
loc_7D53:
    STA ram_000E_t05
    JSR sub_7DD1
    LDA ram_0006_t10_flag
    BEQ bra_7D25_RTS
    JMP loc_7DAA



sub_7D5F:
sub_bat_7D5F:
    STY ram_0000_t2A
    LDA ram_state_obj,Y
    CMP #$30
    BCC bra_7D70
    LDA #$01
    STA ram_0009_t02
    LDA #$20
    BNE bra_7D3C    ; jmp
bra_7D70:
    CMP #$20
    BCS bra_7DCA_RTS
    LDA #$04
    STA ram_0009_t02
    LDA #$20
    LDY ram_item_arrow
    CPY #$01
    BEQ bra_7D82
    ASL
bra_7D82:
    LDY #$0B
    STY ram_000D_t11
sub_7D86:
    JSR sub_7DCB
    LDA ram_0006_t10_flag
    BEQ bra_7DCA_RTS
    CPY #$12
    BNE bra_7DAA
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_16
    BNE bra_7DA0
    LDA #$00
    STA ram_hp_ememy - $01 - $01,X
    JMP loc_7C54
bra_7DA0:
    LDA #$20
    STA ram_state_obj,Y
    LDA #$03
    STA ram_anim_timer_obj,Y
loc_7DAA:
bra_7DAA:
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_0B
    BEQ bra_7DB5
    CMP #con_obj_id_0C
    BNE bra_7DC2
bra_7DB5:
    LDA ram_dir_obj,Y
    ORA ram_dir_obj,X
    CMP #con_dir__UD
    BEQ bra_7DC5_shield_block_sfx
    CMP #con_dir__LR
    BEQ bra_7DC5_shield_block_sfx
bra_7DC2:
    JMP loc_7E26
sub_7DC5_shield_block_sfx:
loc_7DC5_shield_block_sfx:
bra_7DC5_shield_block_sfx:
    LDA #con_sfx_4_shield_block
    STA ram_sfx_4
bra_7DCA_RTS:
    RTS



sub_7DCB:
; in
    ; A = 
    ; ram_0000_t2A
    STA ram_0007_t09_damage_to_enemy
    LDA ram_000D_t11
    STA ram_000E_t05
sub_7DD1:
; in
    ; ram_0000_t2A
    LDY ram_0000_t2A
    LDA ram_dir_link
    AND #con_dir__UD
    BEQ bra_7DEA
    LDA ram_pos_X_enemy,Y
    CLC
    ADC #$06
    STA ram_0004_t10_pos_X
    LDA ram_pos_Y_enemy,Y
    CLC
    ADC #$08
    JMP loc_7DF8
bra_7DEA:
    LDA ram_pos_X_enemy,Y
    CLC
    ADC #$08
    STA ram_0004_t10_pos_X
    LDA ram_pos_Y_enemy,Y
    CLC
    ADC #$06
loc_7DF8:
; bzk optimize, JMP into JMP
    JMP loc_7BE2



sub_7DFB:
sub_bat_7DFB:
loc_bat_7DFB:
; in
    ; A = 
    ; ram_0000_t2A
; out
    ; ram_000B_t04
    ; Z
        ; 0 = 
        ; 1 = 
    STA ram_000D_t11
    STA ram_000E_t05
sub_7DFF:
; in
    ; ram_0000_t2A
    ; ram_000D_t11
    ; ram_000E_t05
; out
    ; ram_000B_t04
    ; Z
        ; 0 = 
        ; 1 = 
    LDA #$00
    STA ram_0006_t10_flag
    LDY ram_0000_t2A
    LDA ram_0002_t34_pos_X
    SEC
    SBC ram_0004_t10_pos_X
    JSR sub_701F_EOR_FF_if_negative
; bzk optimize, useless STA
    STA ram_000A_t14_useless
    CMP ram_000D_t11
    BCS bra_7E23
    LDA ram_0003_t21_pos_Y
    SEC
    SBC ram_0005_t08_pos_Y
    JSR sub_701F_EOR_FF_if_negative
    STA ram_000B_t04
    CMP ram_000E_t05
    BCS bra_7E23
    INC ram_0006_t10_flag
bra_7E23:
    LDA ram_0006_t10_flag
    RTS



sub_7E26:
loc_7E26:
sub_bat_7E26:
; in
    ; ram_0000_t2A
    ; ram_000B_t04
    LDY ram_0000_t2A
    CPX #$0D
    BCS bra_7E33
    LDA ram_04B2_enemy,X
    AND ram_0009_t02
    BNE bra_7E9D_RTS
bra_7E33:
    LDA #$08
    STA ram_0008_t08
    LDA ram_pos_Y_enemy,X
    STA ram_0004_t25_pos_1
    LDA ram_pos_Y_enemy,Y
    STA ram_0005_t02_pos_2
    CPY #$00
    BNE bra_7E51
    LDA ram_0394_link
    BEQ bra_7E51
    LDA ram_dir_link
    AND #con_dir__LR
    BNE bra_7E57
    BEQ bra_7E64    ; jmp
bra_7E51:
    LDA ram_000B_t04
    CMP #$04
    BCS bra_7E64
bra_7E57:
    LDA #$02
    STA ram_0008_t08
    LDA ram_pos_X_enemy,X
    STA ram_0004_t25_pos_1
    LDA ram_pos_X_enemy,Y
    STA ram_0005_t02_pos_2
bra_7E64:
    LDA ram_0004_t25_pos_1
    CMP ram_0005_t02_pos_2
    BCS bra_7E6C
    LSR ram_0008_t08
bra_7E6C:
    CPY #$00
    BNE bra_7E9E
    LDA ram_invinc_link
    BNE bra_7E9D_RTS
    LDA ram_0008_t08
    ORA #$80
    STA ram_00C0_link
    LDA #$18
    STA ram_invinc_link
    LDA #$20
    STA ram_00D3_link
    CPX #$0D
    BCS bra_7E9D_RTS
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_80
    BNE bra_7E9D_RTS
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_12
    BEQ bra_7E9D_RTS
    LDA ram_dir_enemy,X
    JSR sub_7013_get_Y_from_direction
    STA ram_dir_enemy,X
bra_7E9D_RTS:
    RTS
bra_7E9E:
    LDA ram_dir_enemy,Y
    STA ram_0008_t09
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_80
    BEQ bra_7EB0
    LDA ram_0008_t09
    ORA #$40
    STA ram_0008_t09
bra_7EB0:
    LDA ram_invinc_enemy,X
    BNE bra_7EE0_RTS
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_33
    BEQ bra_7EC0
    CMP #con_obj_id_34
    BNE bra_7ED1
bra_7EC0:
    LDA ram_000F_t05
    CMP #$03
    BEQ bra_7ECA
    CMP #$04
    BNE bra_7EE0_RTS
bra_7ECA:
    LDA ram_046B_enemy,X
    CMP #$03
    BNE bra_7EE0_RTS
bra_7ED1:
    LDA ram_0008_t09
    ORA #$80
    STA ram_00C0_enemy,X
    LDA #$40
    STA ram_00D3_enemy,X
    LDA #$10
    STA ram_invinc_enemy,X
bra_7EE0_RTS:
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF   ; 



