; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; Source: bank_s2.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════


; .segment "BANK_01_s2"

; .include "copy_bank_ram.inc"

; .include "copy_bank_val.inc"

; 0x006510-0x00777F


; SRAM_2 (from bank_01)

    ; [DIRECTIVE] .ORG $6C90  -- needs manual handling  ; orig: .org $6C90



    ; [DIRECTIVE] .EXPORT ofs_bat_6C90_bank_s2_asm_import  -- needs manual handling  ; orig: .export ofs_bat_6C90_bank_s2_asm_import
    ; [DIRECTIVE] .EXPORT sub_bat_6C90  -- needs manual handling  ; orig: .export sub_bat_6C90
    ; [DIRECTIVE] .EXPORT loc_bat_6C90  -- needs manual handling  ; orig: .export loc_bat_6C90
    ; [DIRECTIVE] .EXPORT loc_bat_6CC0_count_rupees_and_update_hud_info  -- needs manual handling  ; orig: .export loc_bat_6CC0_count_rupees_and_update_hud_info
    ; [DIRECTIVE] .EXPORT sub_bat_6D00_update_hud_info  -- needs manual handling  ; orig: .export sub_bat_6D00_update_hud_info
    ; [DIRECTIVE] .EXPORT sub_bat_6D7C_set_sfx_1  -- needs manual handling  ; orig: .export sub_bat_6D7C_set_sfx_1
    ; [DIRECTIVE] .EXPORT sub_bat_6D80_set_sfx_3  -- needs manual handling  ; orig: .export sub_bat_6D80_set_sfx_3
    ; [DIRECTIVE] .EXPORT loc_bat_6D80_set_sfx_3  -- needs manual handling  ; orig: .export loc_bat_6D80_set_sfx_3
    ; [DIRECTIVE] .EXPORT ofs_038_bat_6D89_07  -- needs manual handling  ; orig: .export ofs_038_bat_6D89_07
    ; [DIRECTIVE] .EXPORT ofs_039_bat_6D89_07  -- needs manual handling  ; orig: .export ofs_039_bat_6D89_07
    ; [DIRECTIVE] .EXPORT sub_bat_6DB7_clear_special_metatile_addresses  -- needs manual handling  ; orig: .export sub_bat_6DB7_clear_special_metatile_addresses
    ; [DIRECTIVE] .EXPORT tbl_bat_6DC3_direction  -- needs manual handling  ; orig: .export tbl_bat_6DC3_direction
    ; [DIRECTIVE] .EXPORT sub_bat_6FD1_prepare_save_slot_addresses  -- needs manual handling  ; orig: .export sub_bat_6FD1_prepare_save_slot_addresses
    ; [DIRECTIVE] .EXPORT sub_bat_6E10  -- needs manual handling  ; orig: .export sub_bat_6E10
    ; [DIRECTIVE] .EXPORT sub_bat_6E1D  -- needs manual handling  ; orig: .export sub_bat_6E1D
    ; [DIRECTIVE] .EXPORT sub_bat_6E36_increase_counter_00_27  -- needs manual handling  ; orig: .export sub_bat_6E36_increase_counter_00_27
    ; [DIRECTIVE] .EXPORT sub_bat_6E40_clear_counter_00_27  -- needs manual handling  ; orig: .export sub_bat_6E40_clear_counter_00_27
    ; [DIRECTIVE] .EXPORT sub_bat_6E46  -- needs manual handling  ; orig: .export sub_bat_6E46
    ; [DIRECTIVE] .EXPORT sub_bat_6E55_convert_to_decimal  -- needs manual handling  ; orig: .export sub_bat_6E55_convert_to_decimal
    ; [DIRECTIVE] .EXPORT sub_bat_6E79  -- needs manual handling  ; orig: .export sub_bat_6E79
    ; [DIRECTIVE] .EXPORT sub_bat_6EE9  -- needs manual handling  ; orig: .export sub_bat_6EE9
    ; [DIRECTIVE] .EXPORT loc_bat_6EE9  -- needs manual handling  ; orig: .export loc_bat_6EE9
    ; [DIRECTIVE] .EXPORT tbl_bat_6EF9  -- needs manual handling  ; orig: .export tbl_bat_6EF9
    ; [DIRECTIVE] .EXPORT sub_bat_6EFB  -- needs manual handling  ; orig: .export sub_bat_6EFB
    ; [DIRECTIVE] .EXPORT sub_bat_6F29  -- needs manual handling  ; orig: .export sub_bat_6F29
    ; [DIRECTIVE] .EXPORT sub_bat_6F73  -- needs manual handling  ; orig: .export sub_bat_6F73
    ; [DIRECTIVE] .EXPORT sub_bat_6FB6  -- needs manual handling  ; orig: .export sub_bat_6FB6
    ; [DIRECTIVE] .EXPORT sub_bat_6FB8  -- needs manual handling  ; orig: .export sub_bat_6FB8
    ; [DIRECTIVE] .EXPORT sub_bat_6FC1  -- needs manual handling  ; orig: .export sub_bat_6FC1
    ; [DIRECTIVE] .EXPORT sub_bat_6FE8  -- needs manual handling  ; orig: .export sub_bat_6FE8
    ; [DIRECTIVE] .EXPORT sub_bat_7013_get_Y_from_direction  -- needs manual handling  ; orig: .export sub_bat_7013_get_Y_from_direction
    ; [DIRECTIVE] .EXPORT sub_bat_701F_EOR_FF_if_negative  -- needs manual handling  ; orig: .export sub_bat_701F_EOR_FF_if_negative
    ; [DIRECTIVE] .EXPORT sub_bat_7021_EOR_FF  -- needs manual handling  ; orig: .export sub_bat_7021_EOR_FF
    ; [DIRECTIVE] .EXPORT sub_bat_7027  -- needs manual handling  ; orig: .export sub_bat_7027
    ; [DIRECTIVE] .EXPORT sub_bat_704A  -- needs manual handling  ; orig: .export sub_bat_704A
    ; [DIRECTIVE] .EXPORT sub_bat_706F  -- needs manual handling  ; orig: .export sub_bat_706F
    ; [DIRECTIVE] .EXPORT sub_bat_70AB  -- needs manual handling  ; orig: .export sub_bat_70AB
    ; [DIRECTIVE] .EXPORT ofs_021_bat_70DD_01_bomb  -- needs manual handling  ; orig: .export ofs_021_bat_70DD_01_bomb
    ; [DIRECTIVE] .EXPORT loc_bat_7114  -- needs manual handling  ; orig: .export loc_bat_7114
    ; [DIRECTIVE] .EXPORT sub_bat_7116  -- needs manual handling  ; orig: .export sub_bat_7116
    ; [DIRECTIVE] .EXPORT sub_bat_711B  -- needs manual handling  ; orig: .export sub_bat_711B
    ; [DIRECTIVE] .EXPORT sub_bat_711F  -- needs manual handling  ; orig: .export sub_bat_711F
    ; [DIRECTIVE] .EXPORT ofs_021_bat_714F_04_candle  -- needs manual handling  ; orig: .export ofs_021_bat_714F_04_candle
    ; [DIRECTIVE] .EXPORT sub_bat_714F_candle  -- needs manual handling  ; orig: .export sub_bat_714F_candle
    ; [DIRECTIVE] .EXPORT sub_bat_718A  -- needs manual handling  ; orig: .export sub_bat_718A
    ; [DIRECTIVE] .EXPORT sub_bat_718C  -- needs manual handling  ; orig: .export sub_bat_718C
    ; [DIRECTIVE] .EXPORT loc_bat_71A5_reset_obj_stats  -- needs manual handling  ; orig: .export loc_bat_71A5_reset_obj_stats
    ; [DIRECTIVE] .EXPORT sub_bat_71BB  -- needs manual handling  ; orig: .export sub_bat_71BB
    ; [DIRECTIVE] .EXPORT sub_bat_71DE_draw_dot_on_minimap  -- needs manual handling  ; orig: .export sub_bat_71DE_draw_dot_on_minimap
    ; [DIRECTIVE] .EXPORT loc_bat_71ED  -- needs manual handling  ; orig: .export loc_bat_71ED
    ; [DIRECTIVE] .EXPORT sub_bat_7240_curtain_movement_handler  -- needs manual handling  ; orig: .export sub_bat_7240_curtain_movement_handler
    ; [DIRECTIVE] .EXPORT sub_bat_7248_curtain_movement_handler  -- needs manual handling  ; orig: .export sub_bat_7248_curtain_movement_handler
    ; [DIRECTIVE] .EXPORT sub_bat_7274_inc_0000_pointer_by_01  -- needs manual handling  ; orig: .export sub_bat_7274_inc_0000_pointer_by_01
    ; [DIRECTIVE] .EXPORT sub_bat_7276_inc_0000_pointer_by_A  -- needs manual handling  ; orig: .export sub_bat_7276_inc_0000_pointer_by_A
    ; [DIRECTIVE] .EXPORT sub_bat_7280_inc_0002_pointer_by_01  -- needs manual handling  ; orig: .export sub_bat_7280_inc_0002_pointer_by_01
    ; [DIRECTIVE] .EXPORT sub_bat_7282_inc_0002_pointer_by_A  -- needs manual handling  ; orig: .export sub_bat_7282_inc_0002_pointer_by_A
    ; [DIRECTIVE] .EXPORT sub_bat_728C_inc_0004_pointer_by_01  -- needs manual handling  ; orig: .export sub_bat_728C_inc_0004_pointer_by_01
    ; [DIRECTIVE] .EXPORT sub_bat_728E_inc_0004_pointer_by_A  -- needs manual handling  ; orig: .export sub_bat_728E_inc_0004_pointer_by_A
    ; [DIRECTIVE] .EXPORT sub_bat_7298_dec_0004_pointer_by_01  -- needs manual handling  ; orig: .export sub_bat_7298_dec_0004_pointer_by_01
    ; [DIRECTIVE] .EXPORT tbl_bat_72A4  -- needs manual handling  ; orig: .export tbl_bat_72A4
    ; [DIRECTIVE] .EXPORT tbl_bat_72C8  -- needs manual handling  ; orig: .export tbl_bat_72C8
    ; [DIRECTIVE] .EXPORT tbl_bat_72EC  -- needs manual handling  ; orig: .export tbl_bat_72EC
    ; [DIRECTIVE] .EXPORT sub_bat_730C_set_map_bit4  -- needs manual handling  ; orig: .export sub_bat_730C_set_map_bit4
    ; [DIRECTIVE] .EXPORT sub_bat_7314_check_map_bit4  -- needs manual handling  ; orig: .export sub_bat_7314_check_map_bit4
    ; [DIRECTIVE] .EXPORT sub_bat_7328  -- needs manual handling  ; orig: .export sub_bat_7328
    ; [DIRECTIVE] .EXPORT sub_bat_733F  -- needs manual handling  ; orig: .export sub_bat_733F
    ; [DIRECTIVE] .EXPORT sub_bat_7370  -- needs manual handling  ; orig: .export sub_bat_7370
    ; [DIRECTIVE] .EXPORT sub_bat_746C  -- needs manual handling  ; orig: .export sub_bat_746C
    ; [DIRECTIVE] .EXPORT sub_bat_74A3_increase_rupees_and_add_sfx  -- needs manual handling  ; orig: .export sub_bat_74A3_increase_rupees_and_add_sfx
    ; [DIRECTIVE] .EXPORT sub_bat_74B7  -- needs manual handling  ; orig: .export sub_bat_74B7
    ; [DIRECTIVE] .EXPORT sub_bat_7512  -- needs manual handling  ; orig: .export sub_bat_7512
    ; [DIRECTIVE] .EXPORT sub_bat_752F_check_overworld_secret_correct_path  -- needs manual handling  ; orig: .export sub_bat_752F_check_overworld_secret_correct_path
    ; [DIRECTIVE] .EXPORT sub_bat_7570  -- needs manual handling  ; orig: .export sub_bat_7570
    ; [DIRECTIVE] .EXPORT tbl_bat_77AB  -- needs manual handling  ; orig: .export tbl_bat_77AB
    ; [DIRECTIVE] .EXPORT sub_bat_77D4  -- needs manual handling  ; orig: .export sub_bat_77D4
    ; [DIRECTIVE] .EXPORT sub_bat_77DB  -- needs manual handling  ; orig: .export sub_bat_77DB
    ; [DIRECTIVE] .EXPORT loc_bat_77DB  -- needs manual handling  ; orig: .export loc_bat_77DB
    ; [DIRECTIVE] .EXPORT sub_bat_77DF  -- needs manual handling  ; orig: .export sub_bat_77DF
    ; [DIRECTIVE] .EXPORT loc_bat_77DF  -- needs manual handling  ; orig: .export loc_bat_77DF
    ; [DIRECTIVE] .EXPORT sub_bat_77E6  -- needs manual handling  ; orig: .export sub_bat_77E6
    ; [DIRECTIVE] .EXPORT sub_bat_77E7  -- needs manual handling  ; orig: .export sub_bat_77E7
    ; [DIRECTIVE] .EXPORT loc_bat_7804  -- needs manual handling  ; orig: .export loc_bat_7804
    ; [DIRECTIVE] .EXPORT sub_bat_7885  -- needs manual handling  ; orig: .export sub_bat_7885
    ; [DIRECTIVE] .EXPORT sub_bat_790C  -- needs manual handling  ; orig: .export sub_bat_790C
    ; [DIRECTIVE] .EXPORT loc_bat_790C  -- needs manual handling  ; orig: .export loc_bat_790C
    ; [DIRECTIVE] .EXPORT loc_bat_7915  -- needs manual handling  ; orig: .export loc_bat_7915
    ; [DIRECTIVE] .EXPORT sub_bat_7915  -- needs manual handling  ; orig: .export sub_bat_7915
    ; [DIRECTIVE] .EXPORT sub_bat_792C  -- needs manual handling  ; orig: .export sub_bat_792C
    ; [DIRECTIVE] .EXPORT sub_bat_7986  -- needs manual handling  ; orig: .export sub_bat_7986
    ; [DIRECTIVE] .EXPORT sub_bat_7988_set_spr_A  -- needs manual handling  ; orig: .export sub_bat_7988_set_spr_A
    ; [DIRECTIVE] .EXPORT loc_bat_7988_set_spr_A  -- needs manual handling  ; orig: .export loc_bat_7988_set_spr_A
    ; [DIRECTIVE] .EXPORT sub_bat_798D  -- needs manual handling  ; orig: .export sub_bat_798D
    ; [DIRECTIVE] .EXPORT sub_bat_7991  -- needs manual handling  ; orig: .export sub_bat_7991
    ; [DIRECTIVE] .EXPORT sub_bat_79A5  -- needs manual handling  ; orig: .export sub_bat_79A5
    ; [DIRECTIVE] .EXPORT loc_bat_79AF  -- needs manual handling  ; orig: .export loc_bat_79AF
    ; [DIRECTIVE] .EXPORT loc_bat_79BA  -- needs manual handling  ; orig: .export loc_bat_79BA
    ; [DIRECTIVE] .EXPORT sub_bat_79CA  -- needs manual handling  ; orig: .export sub_bat_79CA
    ; [DIRECTIVE] .EXPORT loc_bat_79CA  -- needs manual handling  ; orig: .export loc_bat_79CA
    ; [DIRECTIVE] .EXPORT sub_bat_79D0  -- needs manual handling  ; orig: .export sub_bat_79D0
    ; [DIRECTIVE] .EXPORT loc_bat_79D0  -- needs manual handling  ; orig: .export loc_bat_79D0
    ; [DIRECTIVE] .EXPORT sub_bat_7A2D  -- needs manual handling  ; orig: .export sub_bat_7A2D
    ; [DIRECTIVE] .EXPORT sub_bat_7AA7  -- needs manual handling  ; orig: .export sub_bat_7AA7
    ; [DIRECTIVE] .EXPORT loc_bat_7AA7  -- needs manual handling  ; orig: .export loc_bat_7AA7
    ; [DIRECTIVE] .EXPORT sub_bat_7AC5  -- needs manual handling  ; orig: .export sub_bat_7AC5
    ; [DIRECTIVE] .EXPORT loc_bat_7B4F  -- needs manual handling  ; orig: .export loc_bat_7B4F
    ; [DIRECTIVE] .EXPORT sub_bat_7C54  -- needs manual handling  ; orig: .export sub_bat_7C54
    ; [DIRECTIVE] .EXPORT sub_bat_7C96  -- needs manual handling  ; orig: .export sub_bat_7C96
    ; [DIRECTIVE] .EXPORT sub_bat_7C9D  -- needs manual handling  ; orig: .export sub_bat_7C9D
    ; [DIRECTIVE] .EXPORT sub_bat_7CDC  -- needs manual handling  ; orig: .export sub_bat_7CDC
    ; [DIRECTIVE] .EXPORT sub_bat_7D29  -- needs manual handling  ; orig: .export sub_bat_7D29
    ; [DIRECTIVE] .EXPORT loc_bat_7D29  -- needs manual handling  ; orig: .export loc_bat_7D29
    ; [DIRECTIVE] .EXPORT sub_bat_7D5F  -- needs manual handling  ; orig: .export sub_bat_7D5F
    ; [DIRECTIVE] .EXPORT sub_bat_7DFB  -- needs manual handling  ; orig: .export sub_bat_7DFB
    ; [DIRECTIVE] .EXPORT loc_bat_7DFB  -- needs manual handling  ; orig: .export loc_bat_7DFB
    ; [DIRECTIVE] .EXPORT sub_bat_7E26  -- needs manual handling  ; orig: .export sub_bat_7E26



ofs_bat_6C90_bank_s2_asm_import:
; start position of SRAM_2



sub_bat_6C90:  ; orig: sub_bat_6C90:
loc_bat_6C90:  ; orig: loc_bat_6C90:

; out

; A = 00 (for 0x00AA17)
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006510 01:6C90: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: - D 1 - I - 0x006512 01:6C92: 85 13     STA ram_subscript
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: - D 1 - I - 0x006514 01:6C94: E6 11     INC ram_0011_screen_
bra_6C96_RTS:  ; orig: bra_6C96_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006516 01:6C96: 60        RTS



tbl_6C97_ppu_buffer_data_for_hud:
; 28h bytes
    ; !! UNKNOWN: .DBYT $20B6  ; orig: - D 1 - I - 0x006517 01:6C97: 20 B6     .dbyt $20B6 ; ppu ad
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006519 01:6C99: 08        .byte $08   ; counte
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 1 - I - 0x00651A 01:6C9A: 24        .byte $24, $24, $24,

    ; !! UNKNOWN: .DBYT $20D6  ; orig: - D 1 - I - 0x006522 01:6CA2: 20 D6     .dbyt $20D6 ; ppu ad
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006524 01:6CA4: 08        .byte $08   ; counte
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 1 - I - 0x006525 01:6CA5: 24        .byte $24, $24, $24,

    ; !! UNKNOWN: .DBYT $206C  ; orig: - D 1 - I - 0x00652D 01:6CAD: 20 6C     .dbyt $206C ; ppu ad
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00652F 01:6CAF: 03        .byte $03   ; counte
    ; [DIRECTIVE] .BYTE $21, $00, $24  -- needs manual handling  ; orig: - D 1 - I - 0x006530 01:6CB0: 21        .byte $21, $00, $24 

    ; !! UNKNOWN: .DBYT $20AC  ; orig: - D 1 - I - 0x006533 01:6CB3: 20 AC     .dbyt $20AC ; ppu ad
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006535 01:6CB5: 03        .byte $03   ; counte
    ; [DIRECTIVE] .BYTE $21, $00, $24  -- needs manual handling  ; orig: - D 1 - I - 0x006536 01:6CB6: 21        .byte $21, $00, $24 

    ; !! UNKNOWN: .DBYT $20CC  ; orig: - D 1 - I - 0x006539 01:6CB9: 20 CC     .dbyt $20CC ; ppu ad
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00653B 01:6CBB: 03        .byte $03   ; counte
    ; [DIRECTIVE] .BYTE $21, $00, $24  -- needs manual handling  ; orig: - D 1 - I - 0x00653C 01:6CBC: 21        .byte $21, $00, $24 

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - I - 0x00653F 01:6CBF: FF        .byte $FF   ; close 



loc_bat_6CC0_count_rupees_and_update_hud_info:  ; orig: loc_bat_6CC0_count_rupees_and_update_hud_info:
    MOVE.B  ram_ppu_load_index,D0  ; orig: - D 1 - I - 0x006540 01:6CC0: A5 14     LDA ram_ppu_load_ind
    BNE     bra_6C96_RTS             ; BNE  ; orig: - D 1 - I - 0x006542 01:6CC2: D0 D2     BNE bra_6C96_RTS
    MOVE.B  ram_0302_ppu_buffer,D0  ; orig: - D 1 - I - 0x006544 01:6CC4: AD 02 03  LDA ram_0302_ppu_buf
    BPL     bra_6C96_RTS             ; BPL  ; orig: - D 1 - I - 0x006547 01:6CC7: 10 CD     BPL bra_6C96_RTS
    MOVE.B  #con_item_rup_sbc,D2  ; orig: - D 1 - I - 0x006549 01:6CC9: A0 27     LDY #con_item_rup_sb
    MOVE.B  ram_item_rupees,D0  ; orig: - D 1 - I - 0x00654B 01:6CCB: AD 6D 06  LDA ram_item_rupees
    BEQ     bra_6CD6             ; BEQ  ; orig: - D 1 - I - 0x00654E 01:6CCE: F0 06     BEQ bra_6CD6
    MOVE.B  #con_item_rup_adc,D2  ; orig: - D 1 - I - 0x006550 01:6CD0: A0 26     LDY #con_item_rup_ad
    CMPI.B  #$FF,D0  ; orig: - D 1 - I - 0x006552 01:6CD2: C9 FF     CMP #$FF
    BNE     bra_6CDB             ; BNE  ; orig: - D 1 - I - 0x006554 01:6CD4: D0 05     BNE bra_6CDB
bra_6CD6:  ; orig: bra_6CD6:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006556 01:6CD6: A9 00     LDA #$00
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006558 01:6CD8: 99 57 06  STA ram_items,Y
bra_6CDB:  ; orig: bra_6CDB:
    MOVE.B  ram_frm_cnt,D0  ; orig: - D 1 - I - 0x00655B 01:6CDB: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x00655D 01:6CDD: 4A        LSR
    BCS     bra_6C96_RTS             ; BCS  ; orig: - D 1 - I - 0x00655E 01:6CDE: B0 B6     BCS bra_6C96_RTS
    MOVE.B  ram_rupees_adc,D0  ; orig: - D 1 - I - 0x006560 01:6CE0: AD 7D 06  LDA ram_rupees_adc
    BEQ     bra_6CF0_nothing_to_add             ; BEQ  ; orig: - D 1 - I - 0x006563 01:6CE3: F0 0B     BEQ bra_6CF0_nothing
    SUBQ.B  #1,ram_rupees_adc  ; orig: - D 1 - I - 0x006565 01:6CE5: CE 7D 06  DEC ram_rupees_adc
    ADDQ.B  #1,ram_item_rupees  ; orig: - D 1 - I - 0x006568 01:6CE8: EE 6D 06  INC ram_item_rupees
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: - D 1 - I - 0x00656B 01:6CEB: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x00656D 01:6CED: 8D 04 06  STA ram_sfx_4
bra_6CF0_nothing_to_add:  ; orig: bra_6CF0_nothing_to_add:
    MOVE.B  ram_rupees_sbc,D0  ; orig: - D 1 - I - 0x006570 01:6CF0: AD 7E 06  LDA ram_rupees_sbc
    BEQ     bra_6D00_nothing_to_substract             ; BEQ  ; orig: - D 1 - I - 0x006573 01:6CF3: F0 0B     BEQ bra_6D00_nothing
    SUBQ.B  #1,ram_rupees_sbc  ; orig: - D 1 - I - 0x006575 01:6CF5: CE 7E 06  DEC ram_rupees_sbc
    SUBQ.B  #1,ram_item_rupees  ; orig: - D 1 - I - 0x006578 01:6CF8: CE 6D 06  DEC ram_item_rupees
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: - D 1 - I - 0x00657B 01:6CFB: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x00657D 01:6CFD: 8D 04 06  STA ram_sfx_4
bra_6D00_nothing_to_substract:  ; orig: bra_6D00_nothing_to_substract:
sub_bat_6D00_update_hud_info:
; when link is dead
    MOVE.B  #$28,D2  ; orig: - D 1 - I - 0x006580 01:6D00: A0 28     LDY #$28
bra_6D02_loop:  ; orig: bra_6D02_loop:
    MOVE.B  tbl_6C97_ppu_buffer_data_for_hud(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006582 01:6D02: B9 97 6C  LDA tbl_6C97_ppu_buf
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006585 01:6D05: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006588 01:6D08: 88        DEY
    BPL     bra_6D02_loop             ; BPL  ; orig: - D 1 - I - 0x006589 01:6D09: 10 F7     BPL bra_6D02_loop
    MOVE.B  #$03,D2  ; orig: - D 1 - I - 0x00658B 01:6D0B: A0 03     LDY #$03
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x00658D 01:6D0D: AD 6F 06  LDA ram_item_hearts
    MOVE.B  D0,ram_000E_t02  ; orig: - D 1 - I - 0x006590 01:6D10: 85 0E     STA ram_000E_t02
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006592 01:6D12: AD 70 06  LDA ram_item_hearts 
    MOVE.B  D0,ram_000F_t03  ; orig: - D 1 - I - 0x006595 01:6D15: 85 0F     STA ram_000F_t03
    BSR     sub_6E79             ; JSR -> BSR  ; orig: - D 1 - I - 0x006597 01:6D17: 20 79 6E  JSR sub_6E79

; bzk optimize, useless LDX
    MOVE.B  #$02,D1  ; orig: - D 1 - I - 0x00659A 01:6D1A: A2 02     LDX #$02
    MOVE.B  ram_item_rupees,D0  ; orig: - D 1 - I - 0x00659C 01:6D1C: AD 6D 06  LDA ram_item_rupees
    MOVE.B  #$1B,D2  ; orig: - D 1 - I - 0x00659F 01:6D1F: A0 1B     LDY #$1B
    BSR     sub_6D50_convert_to_decimal_and_write_to_buffer             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065A1 01:6D21: 20 50 6D  JSR sub_6D50_convert
    MOVE.B  #$21,D2  ; orig: - D 1 - I - 0x0065A4 01:6D24: A0 21     LDY #$21
    MOVE.B  ram_item_magic_key,D0  ; orig: - D 1 - I - 0x0065A6 01:6D26: AD 64 06  LDA ram_item_magic_k
    BEQ     bra_6D3E             ; BEQ  ; orig: - D 1 - I - 0x0065A9 01:6D29: F0 13     BEQ bra_6D3E
    MOVE.B  D2,ram_0000_t3D_ppu_buffer_index  ; orig: - D 1 - I - 0x0065AB 01:6D2B: 84 00     STY ram_0000_t3D_ppu
    MOVE.B  #$21,D0  ; orig: - D 1 - I - 0x0065AD 01:6D2D: A9 21     LDA #$21
    MOVE.B  D0,ram_0001_t04_decimal  ; orig: - D 1 - I - 0x0065AF 01:6D2F: 85 01     STA ram_0001_t04_dec
    MOVE.B  #$0A,D0  ; orig: - D 1 - I - 0x0065B1 01:6D31: A9 0A     LDA #$0A
    BSR     sub_6D75_set_fixed_decimal             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065B3 01:6D33: 20 75 6D  JSR sub_6D75_set_fix

; bzk optimize, useless LDX
    MOVE.B  #$08,D1  ; orig: - D 1 - I - 0x0065B6 01:6D36: A2 08     LDX #$08
    BSR     sub_6D55_write_decimal_to_buffer             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065B8 01:6D38: 20 55 6D  JSR sub_6D55_write_d
    JMP     loc_6D46  ; orig: - D 1 - I - 0x0065BB 01:6D3B: 4C 46 6D  JMP loc_6D46
bra_6D3E:  ; orig: bra_6D3E:

; bzk optimize, useless LDX
    MOVE.B  #$08,D1  ; orig: - D 1 - I - 0x0065BE 01:6D3E: A2 08     LDX #$08
    MOVE.B  ram_item_keys,D0  ; orig: - D 1 - I - 0x0065C0 01:6D40: AD 6E 06  LDA ram_item_keys
    BSR     sub_6D50_convert_to_decimal_and_write_to_buffer             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065C3 01:6D43: 20 50 6D  JSR sub_6D50_convert
loc_6D46:  ; orig: loc_6D46:
    MOVE.B  #$0E,D1  ; orig: - D 1 - I - 0x0065C6 01:6D46: A2 0E     LDX #$0E
    MOVE.B  ram_item_bombs,D0  ; orig: - D 1 - I - 0x0065C8 01:6D48: AD 58 06  LDA ram_item_bombs
    MOVE.B  #$27,D2  ; orig: - D 1 - I - 0x0065CB 01:6D4B: A0 27     LDY #$27

; bzk optimize, useless JMP
    JMP     loc_6D50_convert_to_decimal_and_write_to_buffer  ; orig: - D 1 - I - 0x0065CD 01:6D4D: 4C 50 6D  JMP loc_6D50_convert



sub_6D50_convert_to_decimal_and_write_to_buffer:  ; orig: sub_6D50_convert_to_decimal_and_write_to_buffer:
loc_6D50_convert_to_decimal_and_write_to_buffer:  ; orig: loc_6D50_convert_to_decimal_and_write_to_buffer:

; in

; A = hex number

; Y = ppu buffer index
    MOVE.B  D2,ram_0000_t3D_ppu_buffer_index  ; orig: - D 1 - I - 0x0065D0 01:6D50: 84 00     STY ram_0000_t3D_ppu
    BSR     sub_6D64             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065D2 01:6D52: 20 64 6D  JSR sub_6D64
sub_6D55_write_decimal_to_buffer:  ; orig: sub_6D55_write_decimal_to_buffer:
    MOVE.B  #$02,D2  ; orig: - D 1 - I - 0x0065D5 01:6D55: A0 02     LDY #$02
    MOVE.B  ram_0000_t3D_ppu_buffer_index,D1  ; orig: - D 1 - I - 0x0065D7 01:6D57: A6 00     LDX ram_0000_t3D_ppu
bra_6D59_loop:  ; orig: bra_6D59_loop:
    MOVE.B  ram_0001_t04_decimal(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0065D9 01:6D59: B9 01 00  LDA ram_0001_t04_dec
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0065DC 01:6D5C: 9D 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: - D 1 - I - 0x0065DF 01:6D5F: CA        DEX
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x0065E0 01:6D60: 88        DEY
    BPL     bra_6D59_loop             ; BPL  ; orig: - D 1 - I - 0x0065E1 01:6D61: 10 F6     BPL bra_6D59_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0065E3 01:6D63: 60        RTS



sub_6D64:  ; orig: sub_6D64:

; in

; A = hex number

; out

; ram_0001_t04_decimal
    BSR     sub_6E55_convert_to_decimal             ; JSR -> BSR  ; orig: - D 1 - I - 0x0065E4 01:6D64: 20 55 6E  JSR sub_6E55_convert
    CMPI.B  #$24,D2  ; orig: - D 1 - I - 0x0065E7 01:6D67: C0 24     CPY #$24
    BNE     bra_6D6D             ; BNE  ; orig: - D 1 - I - 0x0065E9 01:6D69: D0 02     BNE bra_6D6D
    MOVE.B  #$21,D2  ; orig: - D 1 - I - 0x0065EB 01:6D6B: A0 21     LDY #$21
bra_6D6D:  ; orig: bra_6D6D:
    MOVE.B  D2,ram_0001_t04_decimal  ; orig: - D 1 - I - 0x0065ED 01:6D6D: 84 01     STY ram_0001_t04_dec
    CMPI.B  #$24,D0  ; orig: - D 1 - I - 0x0065EF 01:6D6F: C9 24     CMP #$24
    BNE     bra_6D7B_RTS             ; BNE  ; orig: - D 1 - I - 0x0065F1 01:6D71: D0 08     BNE bra_6D7B_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0065F3 01:6D73: A5 03     LDA ram_0001_t04_dec
sub_6D75_set_fixed_decimal:  ; orig: sub_6D75_set_fixed_decimal:

; in

; A =

; out

; ram_0001_t04_decimal
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0065F5 01:6D75: 85 02     STA ram_0001_t04_dec
    MOVE.B  #$24,D0  ; orig: - D 1 - I - 0x0065F7 01:6D77: A9 24     LDA #$24
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0065F9 01:6D79: 85 03     STA ram_0001_t04_dec
bra_6D7B_RTS:  ; orig: bra_6D7B_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0065FB 01:6D7B: 60        RTS



sub_6D7C_set_sfx_1:  ; orig: sub_6D7C_set_sfx_1:
sub_bat_6D7C_set_sfx_1:  ; orig: sub_bat_6D7C_set_sfx_1:
    MOVE.B  #$01,D2  ; orig: - D 1 - I - 0x0065FC 01:6D7C: A0 01     LDY #$01    ; ram_sf
    BNE     bra_6D82             ; BNE  ; orig: - D 1 - I - 0x0065FE 01:6D7E: D0 02     BNE bra_6D82    ; jm



sub_6D80_set_sfx_3:  ; orig: sub_6D80_set_sfx_3:
sub_bat_6D80_set_sfx_3:  ; orig: sub_bat_6D80_set_sfx_3:
loc_bat_6D80_set_sfx_3:  ; orig: loc_bat_6D80_set_sfx_3:
    MOVE.B  #$03,D2  ; orig: - D 1 - I - 0x006600 01:6D80: A0 03     LDY #$03    ; ram_sf
bra_6D82:  ; orig: bra_6D82:
    ; !! ORA ram_music,Y - needs manual review  ; orig: - D 1 - I - 0x006602 01:6D82: 19 00 06  ORA ram_music,Y
    MOVE.B  D0,ram_music(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006605 01:6D85: 99 00 06  STA ram_music,Y
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006608 01:6D88: 60        RTS



ofs_038_bat_6D89_07:  ; orig: ofs_038_bat_6D89_07:
ofs_039_bat_6D89_07:  ; orig: ofs_039_bat_6D89_07:

; bzk optimize, move to bank_05

; !!! ram 6D90-6D9B has some weird SRAM checks when going into save elimination mode

; see 0x00A479 and 0x00A42A, address is specified via 0x009D10

; also see 6D9C-6D9D
    MOVE.B  ram_subscript,D0  ; orig: - D 1 - I - 0x006609 01:6D89: A5 13     LDA ram_subscript
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x00660B 01:6D8B: 48        PHA
    BSR     sub_0x0147D6             ; JSR -> BSR  ; orig: - D 1 - I - 0x00660C 01:6D8C: 20 C6 87  JSR sub_0x0147D6
    BSR     sub_0x0170C6             ; JSR -> BSR  ; orig: - D 1 - I - 0x00660F 01:6D8F: 20 B6 B0  JSR sub_0x0170C6
    MOVE.B  #$70,D0  ; orig: - D 1 - I - 0x006612 01:6D92: A9 70     LDA #$70
    MOVE.B  D0,ram_pos_X_link  ; orig: - D 1 - I - 0x006614 01:6D94: 85 70     STA ram_pos_X_link
    MOVE.B  #$DD,D0  ; orig: - D 1 - I - 0x006616 01:6D96: A9 DD     LDA #$DD
    MOVE.B  D0,ram_pos_Y_link  ; orig: - D 1 - I - 0x006618 01:6D98: 85 84     STA ram_pos_Y_link
    MOVE.B  #con_dir_Up,D0  ; orig: - D 1 - I - 0x00661A 01:6D9A: A9 08     LDA #con_dir_Up
    MOVE.B  D0,ram_dir_link  ; orig: - D 1 - I - 0x00661C 01:6D9C: 85 98     STA ram_dir_link
    BSR     sub_0x01F24C             ; JSR -> BSR  ; orig: - D 1 - I - 0x00661E 01:6D9E: 20 3C F2  JSR sub_0x01F24C
    BSR     sub_0x01EADB             ; JSR -> BSR  ; orig: - D 1 - I - 0x006621 01:6DA1: 20 CB EA  JSR sub_0x01EADB
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006624 01:6DA4: 68        PLA
    MOVE.B  D0,ram_subscript  ; orig: - D 1 - I - 0x006625 01:6DA5: 85 13     STA ram_subscript
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006627 01:6DA7: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: - D 1 - I - 0x006629 01:6DA9: 85 11     STA ram_0011_screen_
    ADDQ.B  #1,ram_subscript  ; orig: - D 1 - I - 0x00662B 01:6DAB: E6 13     INC ram_subscript
    MOVE.B  #$30,D0  ; orig: - D 1 - I - 0x00662D 01:6DAD: A9 30     LDA #$30
    MOVE.B  D0,ram_0394_link  ; orig: - D 1 - I - 0x00662F 01:6DAF: 8D 94 03  STA ram_0394_link
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006632 01:6DB2: A9 01     LDA #$01
    MOVE.B  D0,ram_005A  ; orig: - D 1 - I - 0x006634 01:6DB4: 85 5A     STA ram_005A
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006636 01:6DB6: 60        RTS



sub_bat_6DB7_clear_special_metatile_addresses:  ; orig: sub_bat_6DB7_clear_special_metatile_addresses:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006637 01:6DB7: A9 00     LDA #$00
    MOVE.B  D0,ram_052B_special_metatile_id  ; orig: - D 1 - I - 0x006639 01:6DB9: 8D 2B 05  STA ram_052B_special
    MOVE.B  D0,ram_052C_special_metatile_pos_X  ; orig: - D 1 - I - 0x00663C 01:6DBC: 8D 2C 05  STA ram_052C_special
    MOVE.B  D0,ram_052D_special_metatile_pos_Y  ; orig: - D 1 - I - 0x00663F 01:6DBF: 8D 2D 05  STA ram_052D_special
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006642 01:6DC2: 60        RTS



tbl_bat_6DC3_direction:  ; orig: tbl_bat_6DC3_direction:
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006643 01:6DC3: 08        .byte con_dir_Up    
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 1 - I - 0x006644 01:6DC4: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - I - 0x006645 01:6DC5: 02        .byte con_dir_Left  
    ; [DIRECTIVE] .BYTE con_dir_Right  -- needs manual handling  ; orig: - D 1 - I - 0x006646 01:6DC6: 01        .byte con_dir_Right 



tbl_6DC7_save_slot_addresses:  ; orig: tbl_6DC7_save_slot_addresses:

; 00 (00)
    ; [DIRECTIVE] .WORD ram_601A  -- needs manual handling  ; orig: - D 1 - I - 0x006647 01:6DC7: 1A 60     .word ram_601A ;
    ; [DIRECTIVE] .WORD ram_6092  -- needs manual handling  ; orig: - D 1 - I - 0x006649 01:6DC9: 92 60     .word ram_6092 ;
    ; [DIRECTIVE] .WORD ram_save_slot_name  -- needs manual handling  ; orig: - D 1 - I - 0x00664B 01:6DCB: 02 60     .word ram_save_slot_
    ; [DIRECTIVE] .WORD ram_6512  -- needs manual handling  ; orig: - D 1 - I - 0x00664D 01:6DCD: 12 65     .word ram_6512 ;
    ; [DIRECTIVE] .WORD ram_6515  -- needs manual handling  ; orig: - D 1 - I - 0x00664F 01:6DCF: 15 65     .word ram_6515 ;
    ; [DIRECTIVE] .WORD ram_slot_death_cnt  -- needs manual handling  ; orig: - D 1 - I - 0x006651 01:6DD1: 18 65     .word ram_slot_death
    ; [DIRECTIVE] .WORD ram_slot_current_quest  -- needs manual handling  ; orig: - D 1 - I - 0x006653 01:6DD3: 1B 65     .word ram_slot_curre

; 01 (0E)
    ; [DIRECTIVE] .WORD ram_601A + $28  -- needs manual handling  ; orig: - D 1 - I - 0x006655 01:6DD5: 42 60     .word ram_601A + $28
    ; [DIRECTIVE] .WORD ram_6092 + $180  -- needs manual handling  ; orig: - D 1 - I - 0x006657 01:6DD7: 12 62     .word ram_6092 + $18
    ; [DIRECTIVE] .WORD ram_save_slot_name + $08  -- needs manual handling  ; orig: - D 1 - I - 0x006659 01:6DD9: 0A 60     .word ram_save_slot_
    ; [DIRECTIVE] .WORD ram_6512 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00665B 01:6DDB: 13 65     .word ram_6512 + $01
    ; [DIRECTIVE] .WORD ram_6515 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00665D 01:6DDD: 16 65     .word ram_6515 + $01
    ; [DIRECTIVE] .WORD ram_slot_death_cnt + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00665F 01:6DDF: 19 65     .word ram_slot_death
    ; [DIRECTIVE] .WORD ram_slot_current_quest + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006661 01:6DE1: 1C 65     .word ram_slot_curre

; 02 (1C)
    ; [DIRECTIVE] .WORD ram_601A + $50  -- needs manual handling  ; orig: - D 1 - I - 0x006663 01:6DE3: 6A 60     .word ram_601A + $50
    ; [DIRECTIVE] .WORD ram_6092 + $300  -- needs manual handling  ; orig: - D 1 - I - 0x006665 01:6DE5: 92 63     .word ram_6092 + $30
    ; [DIRECTIVE] .WORD ram_save_slot_name + $10  -- needs manual handling  ; orig: - D 1 - I - 0x006667 01:6DE7: 12 60     .word ram_save_slot_
    ; [DIRECTIVE] .WORD ram_6512 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006669 01:6DE9: 14 65     .word ram_6512 + $02
    ; [DIRECTIVE] .WORD ram_6515 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x00666B 01:6DEB: 17 65     .word ram_6515 + $02
    ; [DIRECTIVE] .WORD ram_slot_death_cnt + $02  -- needs manual handling  ; orig: - D 1 - I - 0x00666D 01:6DED: 1A 65     .word ram_slot_death
    ; [DIRECTIVE] .WORD ram_slot_current_quest + $02  -- needs manual handling  ; orig: - D 1 - I - 0x00666F 01:6DEF: 1D 65     .word ram_slot_curre



sub_bat_6FD1_prepare_save_slot_addresses:  ; orig: sub_bat_6FD1_prepare_save_slot_addresses:

; out

; ram_0000_t19_data

; ram_0002_t03_data

; ram_0004_t02_slot_name_data

; ram_0006_t01_data

; ram_0008_t03_data

; bzk optimize, move to bank 02
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006671 01:6DF1: A9 FF     LDA #$FF
    MOVE.B  ram_current_save_slot,D2  ; orig: - D 1 - I - 0x006673 01:6DF3: A4 16     LDY ram_current_save
bra_6DF5_loop:  ; orig: bra_6DF5_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006675 01:6DF5: 18        CLC
    ADDX.B  #$0E,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006676 01:6DF6: 69 0E     ADC #$0E
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006678 01:6DF8: 88        DEY
    BPL     bra_6DF5_loop             ; BPL  ; orig: - D 1 - I - 0x006679 01:6DF9: 10 FA     BPL bra_6DF5_loop
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x00667B 01:6DFB: A8        TAY
    MOVE.B  #$0D,D1  ; orig: - D 1 - I - 0x00667C 01:6DFC: A2 0D     LDX #$0D
bra_6DFE_loop:  ; orig: bra_6DFE_loop:

; 0000-000D
    MOVE.B  tbl_6DC7_save_slot_addresses(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00667E 01:6DFE: B9 C7 6D  LDA tbl_6DC7_save_sl

; ram_0000_t19_data

; ram_0002_t03_data

; ram_0004_t02_slot_name_data

; ram_0006_t01_data

; ram_0008_t03_data

; ram_000A_t01_data

; ram_000C_t01_data
    MOVE.L  D1,D3
    ADD.L   #$FF0000,D3
    ADD.L   #$0000,D3
    MOVE.B  D0,(D3)  ; orig: - D 1 - I - 0x006681 01:6E01: 95 00     STA $00,X
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006683 01:6E03: 88        DEY
    SUBQ.B  #1,D1           ; DEX  ; orig: - D 1 - I - 0x006684 01:6E04: CA        DEX
    BPL     bra_6DFE_loop             ; BPL  ; orig: - D 1 - I - 0x006685 01:6E05: 10 F7     BPL bra_6DFE_loop
    MOVE.B  #< ram_067F,D0  ; orig: - D 1 - I - 0x006687 01:6E07: A9 7F     LDA #< ram_067F
    MOVE.B  D0,ram_000E_t04_data  ; orig: - D 1 - I - 0x006689 01:6E09: 85 0E     STA ram_000E_t04_dat
    MOVE.B  #> ram_067F,D0  ; orig: - D 1 - I - 0x00668B 01:6E0B: A9 06     LDA #> ram_067F
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x00668D 01:6E0D: 85 0F     STA ram_000E_t04_dat
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00668F 01:6E0F: 60        RTS



sub_bat_6E10:  ; orig: sub_bat_6E10:

; in

; Y = con_sfx_3

; bzk optimize, use LDA instead of LDY before JSR to here,

; use LDY instead of LDA here, delete TYA
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006690 01:6E10: A5 3B     LDA ram_timer_obj + 
    BNE     bra_6E1C_RTS             ; BNE  ; orig: - D 1 - I - 0x006692 01:6E12: D0 08     BNE bra_6E1C_RTS
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x006694 01:6E14: 98        TYA
    BSR     sub_6D80_set_sfx_3             ; JSR -> BSR  ; orig: - D 1 - I - 0x006695 01:6E15: 20 80 6D  JSR sub_6D80_set_sfx
    MOVE.B  #$0A,D0  ; orig: - D 1 - I - 0x006698 01:6E18: A9 0A     LDA #$0A
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x00669A 01:6E1A: 85 3B     STA ram_timer_obj + 
bra_6E1C_RTS:  ; orig: bra_6E1C_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00669C 01:6E1C: 60        RTS



sub_bat_6E1D:  ; orig: sub_bat_6E1D:
    MOVE.B  #$60,D1  ; orig: - D 1 - I - 0x00669D 01:6E1D: A2 60     LDX #$60
    MOVE.B  #$F8,D0  ; orig: - D 1 - I - 0x00669F 01:6E1F: A9 F8     LDA #$F8
bra_6E21_loop:  ; orig: bra_6E21_loop:
    MOVE.B  D0,ram_spr_Y(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0066A1 01:6E21: 9D 00 02  STA ram_spr_Y,X
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x0066A4 01:6E24: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x0066A5 01:6E25: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x0066A6 01:6E26: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x0066A7 01:6E27: E8        INX
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0066A8 01:6E28: E0 00     CPX #$00    ; bzk op
    BNE     bra_6E21_loop             ; BNE  ; orig: - D 1 - I - 0x0066AA 01:6E2A: D0 F5     BNE bra_6E21_loop

; bzk optimize, delete LDA, make JSR to 0x0066B6
    MOVE.B  ram_copy_counter_00_27,D0  ; orig: - D 1 - I - 0x0066AC 01:6E2C: AD 42 03  LDA ram_copy_counter
    BSR     sub_6E39_increase_counter_00_27             ; JSR -> BSR  ; orig: - D 1 - I - 0x0066AF 01:6E2F: 20 39 6E  JSR sub_6E39_increas

; bzk optimize, useless STA
    MOVE.B  D0,ram_copy_counter_00_27  ; orig: - D 1 - I - 0x0066B2 01:6E32: 8D 42 03  STA ram_copy_counter
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0066B5 01:6E35: 60        RTS



sub_6E36_increase_counter_00_27:  ; orig: sub_6E36_increase_counter_00_27:
loc_6E36_increase_counter_00_27:  ; orig: loc_6E36_increase_counter_00_27:
sub_bat_6E36_increase_counter_00_27:  ; orig: sub_bat_6E36_increase_counter_00_27:
    MOVE.B  ram_counter_00_27,D0  ; orig: - D 1 - I - 0x0066B6 01:6E36: AD 41 03  LDA ram_counter_00_2
sub_6E39_increase_counter_00_27:  ; orig: sub_6E39_increase_counter_00_27:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0066B9 01:6E39: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x0066BA 01:6E3A: 69 01     ADC #$01
    CMPI.B  #$28,D0  ; orig: - D 1 - I - 0x0066BC 01:6E3C: C9 28     CMP #$28
    BNE     bra_6E42_not_overflow             ; BNE  ; orig: - D 1 - I - 0x0066BE 01:6E3E: D0 02     BNE bra_6E42_not_ove

; if overflow
sub_bat_6E40_clear_counter_00_27:  ; orig: sub_bat_6E40_clear_counter_00_27:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0066C0 01:6E40: A9 00     LDA #$00
bra_6E42_not_overflow:  ; orig: bra_6E42_not_overflow:
    MOVE.B  D0,ram_counter_00_27  ; orig: - D 1 - I - 0x0066C2 01:6E42: 8D 41 03  STA ram_counter_00_2
bra_6E45_RTS:  ; orig: bra_6E45_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0066C5 01:6E45: 60        RTS



sub_bat_6E46:  ; orig: sub_bat_6E46:
    MOVE.B  ram_pos_Y_link,D0  ; orig: - D 1 - I - 0x0066C6 01:6E46: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$8E,D0  ; orig: - D 1 - I - 0x0066C8 01:6E48: C9 8E     CMP #$8E
    BCS     bra_6E45_RTS             ; BCS  ; orig: - D 1 - I - 0x0066CA 01:6E4A: B0 F9     BCS bra_6E45_RTS
    MOVE.B  ram_000F_t01_direction,D0  ; orig: - D 1 - I - 0x0066CC 01:6E4C: A5 0F     LDA ram_000F_t01_dir
    ANDI.B  #$08,D0  ; orig: - D 1 - I - 0x0066CE 01:6E4E: 29 08     AND #$08
    BEQ     bra_6E45_RTS             ; BEQ  ; orig: - D 1 - I - 0x0066D0 01:6E50: F0 F3     BEQ bra_6E45_RTS
    JMP     loc_0x01F159_set_00_direction  ; orig: - D 1 - I - 0x0066D2 01:6E52: 4C 49 F1  JMP loc_0x01F159_set



sub_6E55_convert_to_decimal:  ; orig: sub_6E55_convert_to_decimal:
sub_bat_6E55_convert_to_decimal:  ; orig: sub_bat_6E55_convert_to_decimal:

; in

; A = hex number

; out

; Y =

; ram_0001_t04_decimal
    BSR     sub_6E6E_convert_to_decimal             ; JSR -> BSR  ; orig: - D 1 - I - 0x0066D5 01:6E55: 20 6E 6E  JSR sub_6E6E_convert
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0066D8 01:6E58: 85 03     STA ram_0001_t04_dec
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x0066DA 01:6E5A: 98        TYA ; tens
    BSR     sub_6E6E_convert_to_decimal             ; JSR -> BSR  ; orig: - D 1 - I - 0x0066DB 01:6E5B: 20 6E 6E  JSR sub_6E6E_convert
    CMPI.B  #$00,D2  ; orig: - D 1 - I - 0x0066DE 01:6E5E: C0 00     CPY #$00
    BNE     bra_6E69             ; BNE  ; orig: - D 1 - I - 0x0066E0 01:6E60: D0 07     BNE bra_6E69
    MOVE.B  #$24,D2  ; orig: - D 1 - I - 0x0066E2 01:6E62: A0 24     LDY #$24
    CMPI.B  #$00,D0  ; orig: - D 1 - I - 0x0066E4 01:6E64: C9 00     CMP #$00
    BNE     bra_6E69             ; BNE  ; orig: - D 1 - I - 0x0066E6 01:6E66: D0 01     BNE bra_6E69
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x0066E8 01:6E68: 98        TYA
bra_6E69:  ; orig: bra_6E69:
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0066E9 01:6E69: 85 02     STA ram_0001_t04_dec
    MOVE.B  D2,ram_0001_t04_decimal  ; orig: - D 1 - I - 0x0066EB 01:6E6B: 84 01     STY ram_0001_t04_dec
bra_6E6D_RTS:  ; orig: bra_6E6D_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0066ED 01:6E6D: 60        RTS



sub_6E6E_convert_to_decimal:  ; orig: sub_6E6E_convert_to_decimal:

; in

; A = hex number

; out

; A = ones

; Y = tens
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x0066EE 01:6E6E: A0 00     LDY #$00
bra_6E70_loop:  ; orig: bra_6E70_loop:
    CMPI.B  #$0A,D0  ; orig: - D 1 - I - 0x0066F0 01:6E70: C9 0A     CMP #$0A
    BCC     bra_6E6D_RTS             ; BCC  ; orig: - D 1 - I - 0x0066F2 01:6E72: 90 F9     BCC bra_6E6D_RTS
    SUBX.B  #$0A,D0       ; SBC imm  ; orig: - D 1 - I - 0x0066F4 01:6E74: E9 0A     SBC #$0A
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x0066F6 01:6E76: C8        INY
    BNE     bra_6E70_loop             ; BNE  ; orig: - D 1 - I - 0x0066F7 01:6E77: D0 F7     BNE bra_6E70_loop   




sub_6E79:  ; orig: sub_6E79:
sub_bat_6E79:  ; orig: sub_bat_6E79:

; in

; Y = 03/0C

; ram_000E_t02
    MOVE.B  D2,ram_000D_t02  ; orig: - D 1 - I - 0x0066F9 01:6E79: 84 0D     STY ram_000D_t02
    MOVE.B  ram_000E_t02,D0  ; orig: - D 1 - I - 0x0066FB 01:6E7B: A5 0E     LDA ram_000E_t02
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0066FD 01:6E7D: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x0066FE 01:6E7E: 29 0F     AND #$0F
    MOVE.B  D0,ram_0000_t3F  ; orig: - D 1 - I - 0x006700 01:6E80: 85 00     STA ram_0000_t3F
    MOVE.B  #$0F,D0  ; orig: - D 1 - I - 0x006702 01:6E82: A9 0F     LDA #$0F
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006704 01:6E84: 38        SEC
    SUBX.B  ram_0000_t3F,D0  ; orig: - D 1 - I - 0x006705 01:6E85: E5 00     SBC ram_0000_t3F
    MOVE.B  D0,ram_0000_t3D_ppu_buffer_index  ; orig: - D 1 - I - 0x006707 01:6E87: 85 00     STA ram_0000_t3D_ppu
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006709 01:6E89: 68        PLA

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x00670A 01:6E8A: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x00670B 01:6E8B: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x00670C 01:6E8C: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x00670D 01:6E8D: 4A        LSR
    MOVE.B  D0,ram_0001_t03  ; orig: - D 1 - I - 0x00670E 01:6E8E: 85 01     STA ram_0001_t03
    MOVE.B  #$0F,D0  ; orig: - D 1 - I - 0x006710 01:6E90: A9 0F     LDA #$0F
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006712 01:6E92: 38        SEC
    SUBX.B  ram_0001_t03,D0  ; orig: - D 1 - I - 0x006713 01:6E93: E5 01     SBC ram_0001_t03
    MOVE.B  D0,ram_0001_t03  ; orig: - D 1 - I - 0x006715 01:6E95: 85 01     STA ram_0001_t03
    MOVE.B  #$00,D1  ; orig: - D 1 - I - 0x006717 01:6E97: A2 00     LDX #$00
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x006719 01:6E99: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00671A 01:6E9A: 18        CLC
    ADDX.B  #$07,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00671B 01:6E9B: 69 07     ADC #$07
    MOVE.B  D0,ram_000B_t01  ; orig: - D 1 - I - 0x00671D 01:6E9D: 85 0B     STA ram_000B_t01
    MOVE.B  #$07,D2  ; orig: - D 1 - I - 0x00671F 01:6E9F: A0 07     LDY #$07
bra_6EA1_loop:  ; orig: bra_6EA1_loop:
    CMPI.B  #$FF,D2  ; orig: - D 1 - I - 0x006721 01:6EA1: C0 FF     CPY #$FF
    BNE     bra_6EAE             ; BNE  ; orig: - D 1 - I - 0x006723 01:6EA3: D0 09     BNE bra_6EAE
    MOVE.B  ram_000D_t02,D0  ; orig: - D 1 - I - 0x006725 01:6EA5: A5 0D     LDA ram_000D_t02
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006727 01:6EA7: 18        CLC
    ADDX.B  #$12,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006728 01:6EA8: 69 12     ADC #$12
    MOVE.B  D0,ram_000B_t01  ; orig: - D 1 - I - 0x00672A 01:6EAA: 85 0B     STA ram_000B_t01
    MOVE.B  #$12,D2  ; orig: - D 1 - I - 0x00672C 01:6EAC: A0 12     LDY #$12
bra_6EAE:  ; orig: bra_6EAE:
    MOVE.B  ram_000E_t02,D0  ; orig: - D 1 - I - 0x00672E 01:6EAE: A5 0E     LDA ram_000E_t02
    BEQ     bra_6EB6             ; BEQ  ; orig: - D 1 - I - 0x006730 01:6EB0: F0 04     BEQ bra_6EB6
    CMP.B   ram_0001_t03,D1  ; orig: - D 1 - I - 0x006732 01:6EB2: E4 01     CPX ram_0001_t03
    BCS     bra_6EBA             ; BCS  ; orig: - D 1 - I - 0x006734 01:6EB4: B0 04     BCS bra_6EBA
bra_6EB6:  ; orig: bra_6EB6:
    MOVE.B  #$24,D0  ; orig: - D 1 - I - 0x006736 01:6EB6: A9 24     LDA #$24
    BNE     bra_6ED7             ; BNE  ; orig: - D 1 - I - 0x006738 01:6EB8: D0 1D     BNE bra_6ED7    ; jm
bra_6EBA:  ; orig: bra_6EBA:
    CMP.B   ram_0000_t3D_ppu_buffer_index,D1  ; orig: - D 1 - I - 0x00673A 01:6EBA: E4 00     CPX ram_0000_t3D_ppu
    BEQ     bra_6EC4             ; BEQ  ; orig: - D 1 - I - 0x00673C 01:6EBC: F0 06     BEQ bra_6EC4
    BCC     bra_6ED5             ; BCC  ; orig: - D 1 - I - 0x00673E 01:6EBE: 90 15     BCC bra_6ED5
bra_6EC0:  ; orig: bra_6EC0:
    MOVE.B  #$F2,D0  ; orig: - D 1 - I - 0x006740 01:6EC0: A9 F2     LDA #$F2
    BNE     bra_6ED7             ; BNE  ; orig: - D 1 - I - 0x006742 01:6EC2: D0 13     BNE bra_6ED7    ; jm
bra_6EC4:  ; orig: bra_6EC4:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: - D 1 - I - 0x006744 01:6EC4: A5 0F     LDA ram_000F_t01_dir
    BEQ     bra_6ED5             ; BEQ  ; orig: - D 1 - I - 0x006746 01:6EC6: F0 0D     BEQ bra_6ED5
    CMPI.B  #$80,D0  ; orig: - D 1 - I - 0x006748 01:6EC8: C9 80     CMP #$80
    BCS     bra_6EC0             ; BCS  ; orig: - D 1 - I - 0x00674A 01:6ECA: B0 F4     BCS bra_6EC0
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00674C 01:6ECC: A9 00     LDA #$00
    MOVE.B  D0,ram_0529  ; orig: - D 1 - I - 0x00674E 01:6ECE: 8D 29 05  STA ram_0529
    MOVE.B  #$65,D0  ; orig: - D 1 - I - 0x006751 01:6ED1: A9 65     LDA #$65
    BNE     bra_6ED7             ; BNE  ; orig: - D 1 - I - 0x006753 01:6ED3: D0 02     BNE bra_6ED7    ; jm
bra_6ED5:  ; orig: bra_6ED5:
    MOVE.B  #$66,D0  ; orig: - D 1 - I - 0x006755 01:6ED5: A9 66     LDA #$66
bra_6ED7:  ; orig: bra_6ED7:
    MOVE.B  D2,ram_000C_t05  ; orig: - D 1 - I - 0x006757 01:6ED7: 84 0C     STY ram_000C_t05
    MOVE.B  ram_000B_t01,D2  ; orig: - D 1 - I - 0x006759 01:6ED9: A4 0B     LDY ram_000B_t01
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x00675B 01:6EDB: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,ram_000B_t01  ; orig: - D 1 - I - 0x00675E 01:6EDE: C6 0B     DEC ram_000B_t01
    MOVE.B  ram_000C_t05,D2  ; orig: - D 1 - I - 0x006760 01:6EE0: A4 0C     LDY ram_000C_t05
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006762 01:6EE2: 88        DEY
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006763 01:6EE3: E8        INX
    CMPI.B  #$10,D1  ; orig: - D 1 - I - 0x006764 01:6EE4: E0 10     CPX #$10
    BNE     bra_6EA1_loop             ; BNE  ; orig: - D 1 - I - 0x006766 01:6EE6: D0 B9     BNE bra_6EA1_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006768 01:6EE8: 60        RTS



sub_bat_6EE9:  ; orig: sub_bat_6EE9:
loc_bat_6EE9:  ; orig: loc_bat_6EE9:
    MOVE.B  #$80,D0  ; orig: - D 1 - I - 0x006769 01:6EE9: A9 80     LDA #$80    ; con_sf
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x00676B 01:6EEB: 8D 04 06  STA ram_sfx_4
    MOVE.B  D0,ram_sfx_3  ; orig: - D 1 - I - 0x00676E 01:6EEE: 8D 03 06  STA ram_sfx_3
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006771 01:6EF1: 0A        ASL ; -> 00
    MOVE.B  D0,ram_0605_sfx_4  ; orig: - D 1 - I - 0x006772 01:6EF2: 8D 05 06  STA ram_0605_sfx_4
    MOVE.B  D0,ram_0607_sfx_2  ; orig: - D 1 - I - 0x006775 01:6EF5: 8D 07 06  STA ram_0607_sfx_2
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006778 01:6EF8: 60        RTS



tbl_6EF9:  ; orig: tbl_6EF9:
tbl_bat_6EF9:  ; orig: tbl_bat_6EF9:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006779 01:6EF9: 08        .byte $08   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x00677A 01:6EFA: 00        .byte $00   ; 01



sub_bat_6EFB:  ; orig: sub_bat_6EFB:
    MOVE.B  #$0A,D2  ; orig: - D 1 - I - 0x00677B 01:6EFB: A0 0A     LDY #$0A
    MOVE.B  #$00,D1  ; orig: - D 1 - I - 0x00677D 01:6EFD: A2 00     LDX #$00
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00677F 01:6EFF: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0000_t4E_pos_X  ; orig: - D 1 - I - 0x006781 01:6F01: 85 00     STA ram_0000_t4E_pos
    MOVE.B  #$01,D1  ; orig: - D 1 - I - 0x006783 01:6F03: A2 01     LDX #$01
bra_6F05_loop:  ; orig: bra_6F05_loop:
    MOVE.B  ram_0000_t4E_pos_X,D0  ; orig: - D 1 - I - 0x006785 01:6F05: A5 00     LDA ram_0000_t4E_pos
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006787 01:6F07: 18        CLC
    ; !! ADC tbl_6EF9,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x006788 01:6F08: 7D F9 6E  ADC tbl_6EF9,X
    CMPI.B  #$E9,D0  ; orig: - D 1 - I - 0x00678B 01:6F0B: C9 E9     CMP #$E9
    BCS     bra_6F13             ; BCS  ; orig: - D 1 - I - 0x00678D 01:6F0D: B0 04     BCS bra_6F13

; bzk bug maybe, 0x0112C2 has CMP 18
    CMPI.B  #$10,D0  ; orig: - D 1 - I - 0x00678F 01:6F0F: C9 10     CMP #$10
    BCS     bra_6F1B             ; BCS  ; orig: - D 1 - I - 0x006791 01:6F11: B0 08     BCS bra_6F1B
bra_6F13:  ; orig: bra_6F13:

; 00-0F, E9-FF
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006793 01:6F13: B9 40 02  LDA ram_spr_Y + $40,
    ORI.B   #$20,D0  ; orig: - D 1 - I - 0x006796 01:6F16: 09 20     ORA #$20
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006798 01:6F18: 99 40 02  STA ram_spr_Y + $40,
bra_6F1B:  ; orig: bra_6F1B:

; 10-E8
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x00679B 01:6F1B: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x00679C 01:6F1C: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x00679D 01:6F1D: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x00679E 01:6F1E: C8        INY
    CMPI.B  #$00,D2  ; orig: - D 1 - I - 0x00679F 01:6F1F: C0 00     CPY #$00    ; bzk op
    BNE     bra_6F25             ; BNE  ; orig: - D 1 - I - 0x0067A1 01:6F21: D0 02     BNE bra_6F25
    MOVE.B  #$20,D2  ; orig: - D 1 - I - 0x0067A3 01:6F23: A0 20     LDY #$20
bra_6F25:  ; orig: bra_6F25:
    SUBQ.B  #1,D1           ; DEX  ; orig: - D 1 - I - 0x0067A5 01:6F25: CA        DEX
    BPL     bra_6F05_loop             ; BPL  ; orig: - D 1 - I - 0x0067A6 01:6F26: 10 DD     BPL bra_6F05_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0067A8 01:6F28: 60        RTS



sub_6F29:  ; orig: sub_6F29:
sub_bat_6F29:  ; orig: sub_bat_6F29:
    MOVE.B  #$02,D2  ; orig: - D 1 - I - 0x0067A9 01:6F29: A0 02     LDY #$02
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0067AB 01:6F2B: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0000_t32_pos_X  ; orig: - D 1 - I - 0x0067AD 01:6F2D: 85 00     STA ram_0000_t32_pos
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0067AF 01:6F2F: E0 00     CPX #$00
    BEQ     bra_6F45             ; BEQ  ; orig: - D 1 - I - 0x0067B1 01:6F31: F0 12     BEQ bra_6F45
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x0067B3 01:6F33: E0 0D     CPX #$0D
    BCS     bra_6F3E             ; BCS  ; orig: - D 1 - I - 0x0067B5 01:6F35: B0 07     BCS bra_6F3E
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0067B7 01:6F37: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5C,D0  ; orig: - D 1 - I - 0x0067BA 01:6F3A: C9 5C     CMP #con_obj_id_5C
    BNE     bra_6F45             ; BNE  ; orig: - D 1 - I - 0x0067BC 01:6F3C: D0 07     BNE bra_6F45
bra_6F3E:  ; orig: bra_6F3E:
    MOVE.B  ram_0000_t32_pos_X,D0  ; orig: - D 1 - I - 0x0067BE 01:6F3E: A5 00     LDA ram_0000_t32_pos
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0067C0 01:6F40: 18        CLC
    ADDX.B  #$0B,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x0067C1 01:6F41: 69 0B     ADC #$0B
    MOVE.B  D0,ram_0000_t32_pos_X  ; orig: - D 1 - I - 0x0067C3 01:6F43: 85 00     STA ram_0000_t32_pos
bra_6F45:  ; orig: bra_6F45:
    MOVE.B  ram_0000_t32_pos_X,D0  ; orig: - D 1 - I - 0x0067C5 01:6F45: A5 00     LDA ram_0000_t32_pos
    CMP.B   ram_0346,D0  ; orig: - D 1 - I - 0x0067C7 01:6F47: CD 46 03  CMP ram_0346
    BCC     bra_6F6B             ; BCC  ; orig: - D 1 - I - 0x0067CA 01:6F4A: 90 1F     BCC bra_6F6B
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0067CC 01:6F4C: E0 00     CPX #$00
    BEQ     bra_6F62             ; BEQ  ; orig: - D 1 - I - 0x0067CE 01:6F4E: F0 12     BEQ bra_6F62
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x0067D0 01:6F50: E0 0D     CPX #$0D
    BCS     bra_6F5B             ; BCS  ; orig: - D 1 - I - 0x0067D2 01:6F52: B0 07     BCS bra_6F5B
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0067D4 01:6F54: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5C,D0  ; orig: - D 1 - I - 0x0067D7 01:6F57: C9 5C     CMP #con_obj_id_5C
    BNE     bra_6F62             ; BNE  ; orig: - D 1 - I - 0x0067D9 01:6F59: D0 07     BNE bra_6F62
bra_6F5B:  ; orig: bra_6F5B:
    MOVE.B  ram_0000_t32_pos_X,D0  ; orig: - D 1 - I - 0x0067DB 01:6F5B: A5 00     LDA ram_0000_t32_pos
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x0067DD 01:6F5D: 38        SEC
    SUBX.B  #$17,D0       ; SBC imm  ; orig: - D 1 - I - 0x0067DE 01:6F5E: E9 17     SBC #$17
    MOVE.B  D0,ram_0000_t32_pos_X  ; orig: - D 1 - I - 0x0067E0 01:6F60: 85 00     STA ram_0000_t32_pos
bra_6F62:  ; orig: bra_6F62:
    MOVE.B  #$01,D2  ; orig: - D 1 - I - 0x0067E2 01:6F62: A0 01     LDY #$01
    MOVE.B  ram_0000_t32_pos_X,D0  ; orig: - D 1 - I - 0x0067E4 01:6F64: A5 00     LDA ram_0000_t32_pos
    CMP.B   ram_0347,D0  ; orig: - D 1 - I - 0x0067E6 01:6F66: CD 47 03  CMP ram_0347
    BCC     bra_6FB5_RTS             ; BCC  ; orig: - D 1 - I - 0x0067E9 01:6F69: 90 4A     BCC bra_6FB5_RTS
bra_6F6B:  ; orig: bra_6F6B:
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x0067EB 01:6F6B: 98        TYA
    AND.B   ram_000F_t01_direction,D0  ; orig: - D 1 - I - 0x0067EC 01:6F6C: 25 0F     AND ram_000F_t01_dir
    BEQ     bra_6FB5_RTS             ; BEQ  ; orig: - D 1 - I - 0x0067EE 01:6F6E: F0 45     BEQ bra_6FB5_RTS
    JMP     loc_0x01F159_set_00_direction  ; orig: - D 1 - I - 0x0067F0 01:6F70: 4C 49 F1  JMP loc_0x01F159_set



sub_6F73:  ; orig: sub_6F73:
sub_bat_6F73:  ; orig: sub_bat_6F73:
    MOVE.B  #$08,D2  ; orig: - D 1 - I - 0x0067F3 01:6F73: A0 08     LDY #$08
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0067F5 01:6F75: B5 84     LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0000_t33_pos_Y  ; orig: - D 1 - I - 0x0067F7 01:6F77: 85 00     STA ram_0000_t33_pos
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0067F9 01:6F79: E0 00     CPX #$00
    BEQ     bra_6F8F             ; BEQ  ; orig: - D 1 - I - 0x0067FB 01:6F7B: F0 12     BEQ bra_6F8F
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x0067FD 01:6F7D: E0 0D     CPX #$0D
    BCS     bra_6F88             ; BCS  ; orig: - D 1 - I - 0x0067FF 01:6F7F: B0 07     BCS bra_6F88
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006801 01:6F81: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5C,D0  ; orig: - D 1 - I - 0x006804 01:6F84: C9 5C     CMP #con_obj_id_5C
    BNE     bra_6F8F             ; BNE  ; orig: - D 1 - I - 0x006806 01:6F86: D0 07     BNE bra_6F8F
bra_6F88:  ; orig: bra_6F88:
    MOVE.B  ram_0000_t33_pos_Y,D0  ; orig: - D 1 - I - 0x006808 01:6F88: A5 00     LDA ram_0000_t33_pos
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00680A 01:6F8A: 18        CLC
    ADDX.B  #$0F,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00680B 01:6F8B: 69 0F     ADC #$0F
    MOVE.B  D0,ram_0000_t33_pos_Y  ; orig: - D 1 - I - 0x00680D 01:6F8D: 85 00     STA ram_0000_t33_pos
bra_6F8F:  ; orig: bra_6F8F:
    MOVE.B  ram_0000_t33_pos_Y,D0  ; orig: - D 1 - I - 0x00680F 01:6F8F: A5 00     LDA ram_0000_t33_pos
    CMP.B   ram_0348,D0  ; orig: - D 1 - I - 0x006811 01:6F91: CD 48 03  CMP ram_0348
    BCC     bra_6F6B             ; BCC  ; orig: - D 1 - I - 0x006814 01:6F94: 90 D5     BCC bra_6F6B
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x006816 01:6F96: E0 00     CPX #$00
    BEQ     bra_6FAC             ; BEQ  ; orig: - D 1 - I - 0x006818 01:6F98: F0 12     BEQ bra_6FAC
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x00681A 01:6F9A: E0 0D     CPX #$0D
    BCS     bra_6FA5             ; BCS  ; orig: - D 1 - I - 0x00681C 01:6F9C: B0 07     BCS bra_6FA5
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x00681E 01:6F9E: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5C,D0  ; orig: - D 1 - I - 0x006821 01:6FA1: C9 5C     CMP #con_obj_id_5C
    BNE     bra_6FAC             ; BNE  ; orig: - D 1 - I - 0x006823 01:6FA3: D0 07     BNE bra_6FAC
bra_6FA5:  ; orig: bra_6FA5:
    MOVE.B  ram_0000_t33_pos_Y,D0  ; orig: - D 1 - I - 0x006825 01:6FA5: A5 00     LDA ram_0000_t33_pos
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006827 01:6FA7: 38        SEC
    SUBX.B  #$21,D0       ; SBC imm  ; orig: - D 1 - I - 0x006828 01:6FA8: E9 21     SBC #$21
    MOVE.B  D0,ram_0000_t33_pos_Y  ; orig: - D 1 - I - 0x00682A 01:6FAA: 85 00     STA ram_0000_t33_pos
bra_6FAC:  ; orig: bra_6FAC:
    MOVE.B  #$04,D2  ; orig: - D 1 - I - 0x00682C 01:6FAC: A0 04     LDY #$04
    MOVE.B  ram_0000_t33_pos_Y,D0  ; orig: - D 1 - I - 0x00682E 01:6FAE: A5 00     LDA ram_0000_t33_pos
    CMP.B   ram_0349,D0  ; orig: - D 1 - I - 0x006830 01:6FB0: CD 49 03  CMP ram_0349
    BCS     bra_6F6B             ; BCS  ; orig: - D 1 - I - 0x006833 01:6FB3: B0 B6     BCS bra_6F6B
bra_6FB5_RTS:  ; orig: bra_6FB5_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006835 01:6FB5: 60        RTS



sub_6FB6:  ; orig: sub_6FB6:
sub_bat_6FB6:  ; orig: sub_bat_6FB6:

; in

; A = con_dir

; out

; Z

; 0 =

; 1 =
    MOVE.B  D0,ram_000F_t01_direction  ; orig: - D 1 - I - 0x006836 01:6FB6: 85 0F     STA ram_000F_t01_dir
sub_bat_6FB8:  ; orig: sub_bat_6FB8:

; in

; ram_000F_t01_direction

; out

; Z

; 0 =

; 1 =
    BSR     sub_6F29             ; JSR -> BSR  ; orig: - D 1 - I - 0x006838 01:6FB8: 20 29 6F  JSR sub_6F29
    BSR     sub_6F73             ; JSR -> BSR  ; orig: - D 1 - I - 0x00683B 01:6FBB: 20 73 6F  JSR sub_6F73
    MOVE.B  ram_000F_t01_direction,D0  ; orig: - D 1 - I - 0x00683E 01:6FBE: A5 0F     LDA ram_000F_t01_dir
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006840 01:6FC0: 60        RTS




sub_bat_6FC1:  ; orig: sub_bat_6FC1:
    MOVE.B  ram_03A8_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006841 01:6FC1: BD A8 03  LDA ram_03A8_enemy,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006844 01:6FC4: 18        CLC
    ; !! ADC ram_03BC_obj,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x006845 01:6FC5: 7D BC 03  ADC ram_03BC_obj,X
    MOVE.B  D0,ram_03A8_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006848 01:6FC8: 9D A8 03  STA ram_03A8_enemy,X
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x00684B 01:6FCB: 08        PHP
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00684C 01:6FCC: BD 94 03  LDA ram_0394_enemy,X
    CMP.B   ram_010E,D0  ; orig: - D 1 - I - 0x00684F 01:6FCF: CD 0E 01  CMP ram_010E
    BEQ     bra_6FD9             ; BEQ  ; orig: - D 1 - I - 0x006852 01:6FD2: F0 05     BEQ bra_6FD9
    CMP.B   ram_010F,D0  ; orig: - D 1 - I - 0x006854 01:6FD4: CD 0F 01  CMP ram_010F
    BNE     bra_6FDC             ; BNE  ; orig: - D 1 - I - 0x006857 01:6FD7: D0 03     BNE bra_6FDC
bra_6FD9:  ; orig: bra_6FD9:
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x006859 01:6FD9: 28        PLP
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00685A 01:6FDA: 18        CLC
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x00685B 01:6FDB: 08        PHP
bra_6FDC:  ; orig: bra_6FDC:
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x00685C 01:6FDC: 28        PLP
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x00685D 01:6FDD: 08        PHP
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00685E 01:6FDE: BD 94 03  LDA ram_0394_enemy,X
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006861 01:6FE1: 69 00     ADC #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006863 01:6FE3: 9D 94 03  STA ram_0394_enemy,X
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x006866 01:6FE6: 28        PLP
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006867 01:6FE7: 60        RTS



sub_bat_6FE8:  ; orig: sub_bat_6FE8:
    MOVE.B  ram_03A8_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006868 01:6FE8: BD A8 03  LDA ram_03A8_enemy,X
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x00686B 01:6FEB: 38        SEC
    ; !! SBC ram_03BC_obj,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x00686C 01:6FEC: FD BC 03  SBC ram_03BC_obj,X
    MOVE.B  D0,ram_03A8_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00686F 01:6FEF: 9D A8 03  STA ram_03A8_enemy,X
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x006872 01:6FF2: 08        PHP
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006873 01:6FF3: BD 94 03  LDA ram_0394_enemy,X
    CMP.B   ram_010E,D0  ; orig: - D 1 - I - 0x006876 01:6FF6: CD 0E 01  CMP ram_010E
    BEQ     bra_7000             ; BEQ  ; orig: - D 1 - I - 0x006879 01:6FF9: F0 05     BEQ bra_7000
    CMP.B   ram_010F,D0  ; orig: - D 1 - I - 0x00687B 01:6FFB: CD 0F 01  CMP ram_010F
    BNE     bra_7003             ; BNE  ; orig: - D 1 - I - 0x00687E 01:6FFE: D0 03     BNE bra_7003
bra_7000:  ; orig: bra_7000:
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x006880 01:7000: 28        PLP
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006881 01:7001: 38        SEC
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x006882 01:7002: 08        PHP
bra_7003:  ; orig: bra_7003:
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x006883 01:7003: 28        PLP
    MOVE    SR,-(A7)        ; PHP (approx)  ; orig: - D 1 - I - 0x006884 01:7004: 08        PHP
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006885 01:7005: BD 94 03  LDA ram_0394_enemy,X
    SUBX.B  #$00,D0       ; SBC imm  ; orig: - D 1 - I - 0x006888 01:7008: E9 00     SBC #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00688A 01:700A: 9D 94 03  STA ram_0394_enemy,X
    MOVE    (A7)+,SR        ; PLP (approx - !! privilege risk)  ; orig: - D 1 - I - 0x00688D 01:700D: 28        PLP
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00688E 01:700E: 60        RTS



tbl_700F_direction:  ; orig: tbl_700F_direction:
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 1 - I - 0x00688F 01:700F: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006890 01:7010: 08        .byte con_dir_Up    
    ; [DIRECTIVE] .BYTE con_dir_Right  -- needs manual handling  ; orig: - D 1 - I - 0x006891 01:7011: 01        .byte con_dir_Right 
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - I - 0x006892 01:7012: 02        .byte con_dir_Left  



sub_7013_get_Y_from_direction:  ; orig: sub_7013_get_Y_from_direction:
sub_bat_7013_get_Y_from_direction:  ; orig: sub_bat_7013_get_Y_from_direction:

; in

; A = direction

; out

; A = direction

; Y =
    MOVE.B  #$03,D2  ; orig: - D 1 - I - 0x006893 01:7013: A0 03     LDY #$03
bra_7015_loop:  ; orig: bra_7015_loop:
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006895 01:7015: 4A        LSR
    BCS     bra_701B             ; BCS  ; orig: - D 1 - I - 0x006896 01:7016: B0 03     BCS bra_701B
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006898 01:7018: 88        DEY
    BPL     bra_7015_loop             ; BPL  ; orig: - D 1 - I - 0x006899 01:7019: 10 FA     BPL bra_7015_loop
bra_701B:  ; orig: bra_701B:
    MOVE.B  tbl_700F_direction(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00689B 01:701B: B9 0F 70  LDA tbl_700F_directi
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00689E 01:701E: 60        RTS



sub_701F_EOR_FF_if_negative:  ; orig: sub_701F_EOR_FF_if_negative:
sub_bat_701F_EOR_FF_if_negative:  ; orig: sub_bat_701F_EOR_FF_if_negative:
    BPL     bra_7026_RTS             ; BPL  ; orig: - D 1 - I - 0x00689F 01:701F: 10 05     BPL bra_7026_RTS
sub_bat_7021_EOR_FF:  ; orig: sub_bat_7021_EOR_FF:
    EORI.B  #$FF,D0  ; orig: - D 1 - I - 0x0068A1 01:7021: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0068A3 01:7023: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x0068A4 01:7024: 69 01     ADC #$01
bra_7026_RTS:  ; orig: bra_7026_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0068A6 01:7026: 60        RTS



sub_bat_7027:  ; orig: sub_bat_7027:

; in

; A = con_dir

; ram_000E_t02

; out

; ram_000E_t02
    BSR     sub_6FB6             ; JSR -> BSR  ; orig: - D 1 - I - 0x0068A7 01:7027: 20 B6 6F  JSR sub_6FB6
    BEQ     bra_7045             ; BEQ  ; orig: - D 1 - I - 0x0068AA 01:702A: F0 19     BEQ bra_7045
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0068AC 01:702C: BD 94 03  LDA ram_0394_enemy,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0068AF 01:702F: 48        PHA
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0068B0 01:7030: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0068B2 01:7032: 9D 94 03  STA ram_0394_enemy,X
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: - D 1 - I - 0x0068B5 01:7035: 20 8D F0  JSR sub_0x01F09D
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x0068B8 01:7038: 68        PLA
    MOVE.B  ram_000E_t02,D2  ; orig: - D 1 - I - 0x0068B9 01:7039: A4 0E     LDY ram_000E_t02
    BNE     bra_7041             ; BNE  ; orig: - D 1 - I - 0x0068BB 01:703B: D0 04     BNE bra_7041
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0068BD 01:703D: 18        CLC
    ; !! ADC ram_0394_enemy,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x0068BE 01:703E: 7D 94 03  ADC ram_0394_enemy,X
bra_7041:  ; orig: bra_7041:
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0068C1 01:7041: 9D 94 03  STA ram_0394_enemy,X
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0068C4 01:7044: 60        RTS
bra_7045:  ; orig: bra_7045:
    MOVE.B  #$80,D0  ; orig: - D 1 - I - 0x0068C5 01:7045: A9 80     LDA #$80
    MOVE.B  D0,ram_000E_t02  ; orig: - D 1 - I - 0x0068C7 01:7047: 85 0E     STA ram_000E_t02
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0068C9 01:7049: 60        RTS



sub_bat_704A:  ; orig: sub_bat_704A:

; out

; ram_0003_t20

; ram_0004_t11

; ram_000A_t06

; ram_000B_t03
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0068CA 01:704A: 48        PHA
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x0068CB 01:704B: A8        TAY
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x0068CC 01:704C: A9 02     LDA #$02
    MOVE.B  D0,ram_000A_t06  ; orig: - D 1 - I - 0x0068CE 01:704E: 85 0A     STA ram_000A_t06
    MOVE.B  ram_pos_X_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0068D0 01:7050: B9 70 00  LDA ram_pos_X_obj,Y
    MOVE.B  ram_pos_X_obj(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x0068D3 01:7053: B4 70     LDY ram_pos_X_obj,X
    BSR     sub_70C3             ; JSR -> BSR  ; orig: - D 1 - I - 0x0068D5 01:7055: 20 C3 70  JSR sub_70C3
    MOVE.B  D0,ram_0003_t20  ; orig: - D 1 - I - 0x0068D8 01:7058: 85 03     STA ram_0003_t20
    MOVE.B  ram_000A_t06,D0  ; orig: - D 1 - I - 0x0068DA 01:705A: A5 0A     LDA ram_000A_t06
    MOVE.B  D0,ram_000B_t03  ; orig: - D 1 - I - 0x0068DC 01:705C: 85 0B     STA ram_000B_t03
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x0068DE 01:705E: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x0068DF 01:705F: A8        TAY
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x0068E0 01:7060: A9 08     LDA #$08
    MOVE.B  D0,ram_000A_t06  ; orig: - D 1 - I - 0x0068E2 01:7062: 85 0A     STA ram_000A_t06
    MOVE.B  ram_pos_Y_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0068E4 01:7064: B9 84 00  LDA ram_pos_Y_obj,Y
    MOVE.B  ram_pos_Y_obj(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x0068E7 01:7067: B4 84     LDY ram_pos_Y_obj,X
    BSR     sub_70C3             ; JSR -> BSR  ; orig: - D 1 - I - 0x0068E9 01:7069: 20 C3 70  JSR sub_70C3
    MOVE.B  D0,ram_0004_t11  ; orig: - D 1 - I - 0x0068EC 01:706C: 85 04     STA ram_0004_t11
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0068EE 01:706E: 60        RTS



sub_bat_706F:  ; orig: sub_bat_706F:

; in

; Y =

; ram_0003_t20

; out

; Y =
    MOVE.B  D2,ram_0000_t4F  ; orig: - D 1 - I - 0x0068EF 01:706F: 84 00     STY ram_0000_t4F
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x0068F1 01:7071: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0001_t05  ; orig: - D 1 - I - 0x0068F3 01:7073: 85 01     STA ram_0001_t05
    MOVE.B  ram_0003_t20,D0  ; orig: - D 1 - I - 0x0068F5 01:7075: A5 03     LDA ram_0003_t20
    CMP.B   ram_0004_t11,D0  ; orig: - D 1 - I - 0x0068F7 01:7077: C5 04     CMP ram_0004_t11
    BCS     bra_7087             ; BCS  ; orig: - D 1 - I - 0x0068F9 01:7079: B0 0C     BCS bra_7087

; swap
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0068FB 01:707B: 48        PHA
    MOVE.B  ram_0004_t11,D0  ; orig: - D 1 - I - 0x0068FC 01:707C: A5 04     LDA ram_0004_t11
    MOVE.B  D0,ram_0003_t20  ; orig: - D 1 - I - 0x0068FE 01:707E: 85 03     STA ram_0003_t20
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006900 01:7080: 68        PLA
    MOVE.B  D0,ram_0004_t11  ; orig: - D 1 - I - 0x006901 01:7081: 85 04     STA ram_0004_t11

;
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006903 01:7083: A9 01     LDA #$01
    MOVE.B  D0,ram_0001_t05  ; orig: - D 1 - I - 0x006905 01:7085: 85 01     STA ram_0001_t05
bra_7087:  ; orig: bra_7087:
    MOVE.B  ram_0003_t20,D0  ; orig: - D 1 - I - 0x006907 01:7087: A5 03     LDA ram_0003_t20
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006909 01:7089: 38        SEC
    SUBX.B  ram_0004_t11,D0  ; orig: - D 1 - I - 0x00690A 01:708A: E5 04     SBC ram_0004_t11
    CMPI.B  #$08,D0  ; orig: - D 1 - I - 0x00690C 01:708C: C9 08     CMP #$08
    BCC     bra_70A8             ; BCC  ; orig: - D 1 - I - 0x00690E 01:708E: 90 18     BCC bra_70A8
bra_7090_loop:  ; orig: bra_7090_loop:
    MOVE.B  ram_0000_t4F,D0  ; orig: - D 1 - I - 0x006910 01:7090: A5 00     LDA ram_0000_t4F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006912 01:7092: 18        CLC
    ADDX.B  ram_0001_t05,D0  ; orig: - D 1 - I - 0x006913 01:7093: 65 01     ADC ram_0001_t05
    MOVE.B  D0,ram_0000_t4F  ; orig: - D 1 - I - 0x006915 01:7095: 85 00     STA ram_0000_t4F
    BEQ     bra_70A8             ; BEQ  ; orig: - D 1 - I - 0x006917 01:7097: F0 0F     BEQ bra_70A8
    CMPI.B  #$08,D0  ; orig: - D 1 - I - 0x006919 01:7099: C9 08     CMP #$08
    BEQ     bra_70A8             ; BEQ  ; orig: - D 1 - I - 0x00691B 01:709B: F0 0B     BEQ bra_70A8
    MOVE.B  ram_0003_t20,D0  ; orig: - D 1 - I - 0x00691D 01:709D: A5 03     LDA ram_0003_t20
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x00691F 01:709F: 38        SEC
    SUBX.B  ram_0004_t11,D0  ; orig: - D 1 - I - 0x006920 01:70A0: E5 04     SBC ram_0004_t11
    MOVE.B  D0,ram_0003_t20  ; orig: - D 1 - I - 0x006922 01:70A2: 85 03     STA ram_0003_t20
    CMP.B   ram_0004_t11,D0  ; orig: - D 1 - I - 0x006924 01:70A4: C5 04     CMP ram_0004_t11
    BCS     bra_7090_loop             ; BCS  ; orig: - D 1 - I - 0x006926 01:70A6: B0 E8     BCS bra_7090_loop
bra_70A8:  ; orig: bra_70A8:
    MOVE.B  ram_0000_t4F,D2  ; orig: - D 1 - I - 0x006928 01:70A8: A4 00     LDY ram_0000_t4F
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00692A 01:70AA: 60        RTS



sub_bat_70AB:  ; orig: sub_bat_70AB:
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00692B 01:70AB: 9D BC 03  STA ram_03BC_obj,X
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00692E 01:70AE: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x006930 01:70B0: 29 F0     AND #$F0
    CMPI.B  #$40,D0  ; orig: - D 1 - I - 0x006932 01:70B2: C9 40     CMP #$40
    BNE     bra_70C2_RTS             ; BNE  ; orig: - D 1 - I - 0x006934 01:70B4: D0 0C     BNE bra_70C2_RTS
    ; (empty translation for LSR)  ; orig: - D 1 - I - 0x006936 01:70B6: 5E BC 03  LSR ram_03BC_obj,X
    ; (empty translation for DEC)  ; orig: - D 1 - I - 0x006939 01:70B9: DE 80 03  DEC ram_0380_enemy,X
    BNE     bra_70C2_RTS             ; BNE  ; orig: - D 1 - I - 0x00693C 01:70BC: D0 04     BNE bra_70C2_RTS
    MOVE.B  #$50,D0  ; orig: - D 1 - I - 0x00693E 01:70BE: A9 50     LDA #$50
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006940 01:70C0: 95 AC     STA ram_state_obj,X
bra_70C2_RTS:  ; orig: bra_70C2_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006942 01:70C2: 60        RTS



sub_70C3:  ; orig: sub_70C3:

; in

; A =

; Y =

; ram_0000_t6A

; ram_000A_t06

; out

; A =

; ram_000A_t06

; ram_0000_t6A
    MOVE.B  D0,ram_0001_t06  ; orig: - D 1 - I - 0x006943 01:70C3: 85 01     STA ram_0001_t06
    MOVE.B  D2,ram_0002_t23  ; orig: - D 1 - I - 0x006945 01:70C5: 84 02     STY ram_0002_t23
    CMP.B   ram_0001_t06,D2  ; orig: - D 1 - I - 0x006947 01:70C7: C4 01     CPY ram_0001_t06
    BCS     bra_70D1             ; BCS  ; orig: - D 1 - I - 0x006949 01:70C9: B0 06     BCS bra_70D1
    MOVE.B  D0,ram_0002_t23  ; orig: - D 1 - I - 0x00694B 01:70CB: 85 02     STA ram_0002_t23
    MOVE.B  D2,ram_0001_t06  ; orig: - D 1 - I - 0x00694D 01:70CD: 84 01     STY ram_0001_t06
    LSR.B   #1,ram_000A_t06  ; orig: - D 1 - I - 0x00694F 01:70CF: 46 0A     LSR ram_000A_t06
bra_70D1:  ; orig: bra_70D1:
    MOVE.B  ram_0002_t23,D0  ; orig: - D 1 - I - 0x006951 01:70D1: A5 02     LDA ram_0002_t23
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006953 01:70D3: 38        SEC
    SUBX.B  ram_0001_t06,D0  ; orig: - D 1 - I - 0x006954 01:70D4: E5 01     SBC ram_0001_t06
    CMPI.B  #$09,D0  ; orig: - D 1 - I - 0x006956 01:70D6: C9 09     CMP #$09
    BCS     bra_70DC_RTS             ; BCS  ; orig: - D 1 - I - 0x006958 01:70D8: B0 02     BCS bra_70DC_RTS

; bzk bug, this 0000 can be from ram_0000_t07_data
    ADDQ.B  #1,ram_0000_t6A  ; orig: - D 1 - I - 0x00695A 01:70DA: E6 00     INC ram_0000_t6A
bra_70DC_RTS:  ; orig: bra_70DC_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00695C 01:70DC: 60        RTS



ofs_021_bat_70DD_01_bomb:  ; orig: ofs_021_bat_70DD_01_bomb:

; bzk optimize, up to 0x006992 can be moved to bank 05
    MOVE.B  ram_item_bombs,D0  ; orig: - D 1 - I - 0x00695D 01:70DD: AD 58 06  LDA ram_item_bombs
    BEQ     bra_70DC_RTS             ; BEQ  ; orig: - D 1 - I - 0x006960 01:70E0: F0 FA     BEQ bra_70DC_RTS
    MOVE.B  #$10,D1  ; orig: - D 1 - I - 0x006962 01:70E2: A2 10     LDX #$10
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006964 01:70E4: B5 AC     LDA ram_state_obj,X
    BEQ     bra_70F9             ; BEQ  ; orig: - D 1 - I - 0x006966 01:70E6: F0 11     BEQ bra_70F9
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x006968 01:70E8: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: - D 1 - I - 0x00696A 01:70EA: C9 10     CMP #$10
    BNE     bra_70F9             ; BNE  ; orig: - D 1 - I - 0x00696C 01:70EC: D0 0B     BNE bra_70F9
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x00696E 01:70EE: E8        INX
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00696F 01:70EF: B5 AC     LDA ram_state_obj,X
    BEQ     bra_70F9             ; BEQ  ; orig: - D 1 - I - 0x006971 01:70F1: F0 06     BEQ bra_70F9
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x006973 01:70F3: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: - D 1 - I - 0x006975 01:70F5: C9 10     CMP #$10
    BEQ     bra_713B_RTS             ; BEQ  ; orig: - D 1 - I - 0x006977 01:70F7: F0 42     BEQ bra_713B_RTS
bra_70F9:  ; orig: bra_70F9:
    MOVE.B  D1,D0           ; TXA  ; orig: - D 1 - I - 0x006979 01:70F9: 8A        TXA
    EORI.B  #$01,D0  ; orig: - D 1 - I - 0x00697A 01:70FA: 49 01     EOR #$01
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x00697C 01:70FC: A8        TAY
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00697D 01:70FD: B9 AC 00  LDA ram_state_obj,Y
    BEQ     bra_7106             ; BEQ  ; orig: - D 1 - I - 0x006980 01:7100: F0 04     BEQ bra_7106
    CMPI.B  #$13,D0  ; orig: - D 1 - I - 0x006982 01:7102: C9 13     CMP #$13
    BCC     bra_713B_RTS             ; BCC  ; orig: - D 1 - I - 0x006984 01:7104: 90 35     BCC bra_713B_RTS
bra_7106:  ; orig: bra_7106:
    SUBQ.B  #1,ram_item_bombs  ; orig: - D 1 - I - 0x006986 01:7106: CE 58 06  DEC ram_item_bombs
    MOVE.B  #con_sfx_4_plant_bomb,D0  ; orig: - D 1 - I - 0x006989 01:7109: A9 20     LDA #con_sfx_4_plant
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x00698B 01:710B: 8D 04 06  STA ram_sfx_4
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00698E 01:710E: A9 00     LDA #$00
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006990 01:7110: 95 28     STA ram_timer_enemy,
    MOVE.B  #$11,D0  ; orig: - D 1 - I - 0x006992 01:7112: A9 11     LDA #$11    ; bomb
loc_bat_7114:  ; orig: loc_bat_7114:
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006994 01:7114: 95 AC     STA ram_state_obj,X
sub_bat_7116:  ; orig: sub_bat_7116:
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006996 01:7116: A9 01     LDA #$01
    MOVE.B  D0,ram_anim_timer_link  ; orig: - D 1 - I - 0x006998 01:7118: 8D D0 03  STA ram_anim_timer_l
sub_711B:  ; orig: sub_711B:
sub_bat_711B:  ; orig: sub_bat_711B:

; triggers when link has just pressed a button to swing a sword/staff
    MOVE.B  #con_obj_state_10,D0  ; orig: - D 1 - I - 0x00699B 01:711B: A9 10     LDA #con_obj_state_1
    MOVE.B  D0,ram_state_link  ; orig: - D 1 - I - 0x00699D 01:711D: 85 AC     STA ram_state_link
sub_bat_711F:  ; orig: sub_bat_711F:

; in

; A =
    MOVE.B  #$F0,D2  ; orig: - D 1 - I - 0x00699F 01:711F: A0 F0     LDY #$F0
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0069A1 01:7121: 85 01     STA ram_0000_t6B + $
    ; (empty translation for STY)  ; orig: - D 1 - I - 0x0069A3 01:7123: 84 02     STY ram_0000_t6B + $
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x0069A5 01:7125: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069A7 01:7127: 95 98     STA ram_dir_enemy,X
    BSR     sub_713C             ; JSR -> BSR  ; orig: - D 1 - I - 0x0069A9 01:7129: 20 3C 71  JSR sub_713C
    ADDX.B  ram_pos_X_link,D0  ; orig: - D 1 - I - 0x0069AC 01:712C: 65 70     ADC ram_pos_X_link
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069AE 01:712E: 95 70     STA ram_pos_X_enemy,
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x0069B0 01:7130: A5 98     LDA ram_dir_link

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x0069B2 01:7132: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x0069B3 01:7133: 4A        LSR
    BSR     sub_713C             ; JSR -> BSR  ; orig: - D 1 - I - 0x0069B4 01:7134: 20 3C 71  JSR sub_713C
    ADDX.B  ram_pos_Y_link,D0  ; orig: - D 1 - I - 0x0069B7 01:7137: 65 84     ADC ram_pos_Y_link
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069B9 01:7139: 95 84     STA ram_pos_Y_enemy,
bra_713B_RTS:  ; orig: bra_713B_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0069BB 01:713B: 60        RTS



sub_713C:  ; orig: sub_713C:

; in

; A =

; ram_0000_t6B

; out

; A = position
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x0069BC 01:713C: A0 00     LDY #$00
    MOVE.B  D2,ram_0000_t6B  ; orig: - D 1 - I - 0x0069BE 01:713E: 84 00     STY ram_0000_t6B
    ANDI.B  #$03,D0  ; orig: - D 1 - I - 0x0069C0 01:7140: 29 03     AND #$03
    BEQ     bra_714A             ; BEQ  ; orig: - D 1 - I - 0x0069C2 01:7142: F0 06     BEQ bra_714A
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x0069C4 01:7144: C8        INY ; 01
    ANDI.B  #$01,D0  ; orig: - D 1 - I - 0x0069C5 01:7145: 29 01     AND #$01
    BNE     bra_714A             ; BNE  ; orig: - D 1 - I - 0x0069C7 01:7147: D0 01     BNE bra_714A
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x0069C9 01:7149: C8        INY ; 02
bra_714A:  ; orig: bra_714A:
    MOVE.B  ram_0000_t6B(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0069CA 01:714A: B9 00 00  LDA ram_0000_t6B,Y
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0069CD 01:714D: 18        CLC
bra_714E_RTS:  ; orig: bra_714E_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0069CE 01:714E: 60        RTS



ofs_021_bat_714F_04_candle:  ; orig: ofs_021_bat_714F_04_candle:
sub_bat_714F_candle:  ; orig: sub_bat_714F_candle:
    MOVE.B  #$10,D1  ; orig: - D 1 - I - 0x0069CF 01:714F: A2 10     LDX #$10
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0069D1 01:7151: B5 AC     LDA ram_state_obj,X
    BEQ     bra_715A             ; BEQ  ; orig: - D 1 - I - 0x0069D3 01:7153: F0 05     BEQ bra_715A
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x0069D5 01:7155: E8        INX ; 11
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0069D6 01:7156: B5 AC     LDA ram_state_obj,X
    BNE     bra_714E_RTS             ; BNE  ; orig: - D 1 - I - 0x0069D8 01:7158: D0 F4     BNE bra_714E_RTS
bra_715A:  ; orig: bra_715A:
    MOVE.B  ram_item_candle,D0  ; orig: - D 1 - I - 0x0069DA 01:715A: AD 5B 06  LDA ram_item_candle
    CMPI.B  #$01,D0  ; orig: - D 1 - I - 0x0069DD 01:715D: C9 01     CMP #$01
    BNE     bra_7166             ; BNE  ; orig: - D 1 - I - 0x0069DF 01:715F: D0 05     BNE bra_7166
    MOVE.B  ram_candle_usage_flag,D0  ; orig: - D 1 - I - 0x0069E1 01:7161: AD 13 05  LDA ram_candle_usage
    BNE     bra_714E_RTS             ; BNE  ; orig: - D 1 - I - 0x0069E4 01:7164: D0 E8     BNE bra_714E_RTS
bra_7166:  ; orig: bra_7166:
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x0069E6 01:7166: A9 01     LDA #$01
    MOVE.B  D0,ram_candle_usage_flag  ; orig: - D 1 - I - 0x0069E8 01:7168: 8D 13 05  STA ram_candle_usage
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0069EB 01:716B: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069ED 01:716D: 9D 94 03  STA ram_0394_enemy,X
    MOVE.B  D0,ram_03A8_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069F0 01:7170: 9D A8 03  STA ram_03A8_enemy,X
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x0069F3 01:7173: A9 20     LDA #$20
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069F5 01:7175: 9D BC 03  STA ram_03BC_obj,X
    MOVE.B  #$21,D0  ; orig: - D 1 - I - 0x0069F8 01:7178: A9 21     LDA #$21
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0069FA 01:717A: 95 AC     STA ram_state_obj,X
    MOVE.B  #con_sfx_3_04,D0  ; orig: - D 1 - I - 0x0069FC 01:717C: A9 04     LDA #con_sfx_3_04
    BSR     sub_6D80_set_sfx_3             ; JSR -> BSR  ; orig: - D 1 - I - 0x0069FE 01:717E: 20 80 6D  JSR sub_6D80_set_sfx
    MOVE.B  #$04,D0  ; orig: - D 1 - I - 0x006A01 01:7181: A9 04     LDA #$04
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A03 01:7183: 9D D0 03  STA ram_anim_timer_o

; bzk optimize, JMP
    BSR     sub_711B             ; JSR -> BSR  ; orig: - D 1 - I - 0x006A06 01:7186: 20 1B 71  JSR sub_711B
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006A09 01:7189: 60        RTS



sub_bat_718A:  ; orig: sub_bat_718A:
    MOVE.B  ram_map_location,D2  ; orig: - D 1 - I - 0x006A0A 01:718A: A4 EB     LDY ram_map_location
sub_bat_718C:  ; orig: sub_bat_718C:
    MOVE.B  ram_6AFE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006A0C 01:718C: B9 FE 6A  LDA ram_6AFE_map_dat
    ANDI.B  #$30,D0  ; orig: - D 1 - I - 0x006A0F 01:718F: 29 30     AND #$30

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A11 01:7191: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A12 01:7192: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A13 01:7193: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A14 01:7194: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x006A15 01:7195: A8        TAY
    MOVE.B  ram_6BA7(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006A16 01:7196: B9 A7 6B  LDA ram_6BA7,Y
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006A19 01:7199: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x006A1A 01:719A: 29 0F     AND #$0F

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A1C 01:719C: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A1D 01:719D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A1E 01:719E: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A1F 01:719F: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x006A20 01:71A0: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006A21 01:71A1: 68        PLA
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x006A22 01:71A2: 29 F0     AND #$F0
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006A24 01:71A4: 60        RTS



loc_bat_71A5_reset_obj_stats:  ; orig: loc_bat_71A5_reset_obj_stats:

; A = 00
    MOVE.B  D0,ram_00C0_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A25 01:71A5: 95 C0     STA ram_00C0_enemy,X
    MOVE.B  D0,ram_00D3_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A27 01:71A7: 95 D3     STA ram_00D3_enemy,X
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A29 01:71A9: 95 28     STA ram_timer_enemy,
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A2B 01:71AB: 95 AC     STA ram_state_obj,X
    MOVE.B  D0,ram_invinc_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A2D 01:71AD: 9D F0 04  STA ram_invinc_enemy
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006A30 01:71B0: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0492_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A32 01:71B2: 9D 92 04  STA ram_0492_enemy,X
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006A35 01:71B5: A9 01     LDA #$01
    MOVE.B  D0,ram_0405_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006A37 01:71B7: 9D 05 04  STA ram_0405_enemy,X
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006A3A 01:71BA: 60        RTS



sub_bat_71BB:  ; orig: sub_bat_71BB:

; X = 10 11
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006A3B 01:71BB: B5 AC     LDA ram_state_obj,X
    CMPI.B  #$13,D0  ; orig: - D 1 - I - 0x006A3D 01:71BD: C9 13     CMP #$13
    BNE     bra_71DD_RTS             ; BNE  ; orig: - D 1 - I - 0x006A3F 01:71BF: D0 1C     BNE bra_71DD_RTS
    MOVE.B  ram_for_2001,D0  ; orig: - D 1 - I - 0x006A41 01:71C1: A5 FE     LDA ram_for_2001
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A43 01:71C3: 4A        LSR
    MOVE.B  ram_timer_enemy(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x006A44 01:71C4: B4 28     LDY ram_timer_enemy,
    CMPI.B  #$16,D2  ; orig: - D 1 - I - 0x006A46 01:71C6: C0 16     CPY #$16
    BEQ     bra_71CE             ; BEQ  ; orig: - D 1 - I - 0x006A48 01:71C8: F0 04     BEQ bra_71CE
    CMPI.B  #$11,D2  ; orig: - D 1 - I - 0x006A4A 01:71CA: C0 11     CPY #$11
    BNE     bra_71D2             ; BNE  ; orig: - D 1 - I - 0x006A4C 01:71CC: D0 04     BNE bra_71D2
bra_71CE:
; 11 or 16
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: - D 1 - I - 0x006A4E 01:71CE: 2A        ROL
    JMP     loc_71DB  ; orig: - D 1 - I - 0x006A4F 01:71CF: 4C DB 71  JMP loc_71DB
bra_71D2:  ; orig: bra_71D2:
    CMPI.B  #$12,D2  ; orig: - D 1 - I - 0x006A52 01:71D2: C0 12     CPY #$12
    BEQ     bra_71DA             ; BEQ  ; orig: - D 1 - I - 0x006A54 01:71D4: F0 04     BEQ bra_71DA
    CMPI.B  #$0D,D2  ; orig: - D 1 - I - 0x006A56 01:71D6: C0 0D     CPY #$0D
    BNE     bra_71DD_RTS             ; BNE  ; orig: - D 1 - I - 0x006A58 01:71D8: D0 03     BNE bra_71DD_RTS
bra_71DA:
; 12 or 0D
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A5A 01:71DA: 0A        ASL
loc_71DB:  ; orig: loc_71DB:
    MOVE.B  D0,ram_for_2001  ; orig: - D 1 - I - 0x006A5B 01:71DB: 85 FE     STA ram_for_2001
bra_71DD_RTS:  ; orig: bra_71DD_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006A5D 01:71DD: 60        RTS



sub_bat_71DE_draw_dot_on_minimap:  ; orig: sub_bat_71DE_draw_dot_on_minimap:
    MOVE.B  ram_script,D0  ; orig: - D 1 - I - 0x006A5E 01:71DE: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: - D 1 - I - 0x006A60 01:71E0: C9 09     CMP #con_script_09
    BEQ     bra_723F_RTS             ; BEQ  ; orig: - D 1 - I - 0x006A62 01:71E2: F0 5B     BEQ bra_723F_RTS
    MOVE.B  ram_0522_flag,D1  ; orig: - D 1 - I - 0x006A64 01:71E4: AE 22 05  LDX ram_0522_flag
    BNE     bra_723F_RTS             ; BNE  ; orig: - D 1 - I - 0x006A67 01:71E7: D0 56     BNE bra_723F_RTS
    MOVE.B  ram_map_location,D0  ; orig: - D 1 - I - 0x006A69 01:71E9: A5 EB     LDA ram_map_location
    MOVE.B  #$00,D1  ; orig: - D 1 - I - 0x006A6B 01:71EB: A2 00     LDX #$00
loc_bat_71ED:
; X = 04
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006A6D 01:71ED: 48        PHA
    ANDI.B  #$70,D0  ; orig: - D 1 - I - 0x006A6E 01:71EE: 29 70     AND #$70

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A70 01:71F0: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006A71 01:71F1: 4A        LSR
    ADDX.B  #$17,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006A72 01:71F2: 69 17     ADC #$17
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006A74 01:71F4: 9D 54 02  STA ram_spr_Y + $54,
    MOVE.B  #$11,D0  ; orig: - D 1 - I - 0x006A77 01:71F7: A9 11     LDA #$11
    MOVE.B  ram_dungeon_level,D2  ; orig: - D 1 - I - 0x006A79 01:71F9: A4 10     LDY ram_dungeon_leve
    BEQ     bra_71FF             ; BEQ  ; orig: - D 1 - I - 0x006A7B 01:71FB: F0 02     BEQ bra_71FF    ; if

; if dungeon
    MOVE.B  #$12,D0  ; orig: - D 1 - I - 0x006A7D 01:71FD: A9 12     LDA #$12
bra_71FF:  ; orig: bra_71FF:
    MOVE.B  D0,ram_0000_t44  ; orig: - D 1 - I - 0x006A7F 01:71FF: 85 00     STA ram_0000_t44
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006A81 01:7201: 68        PLA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x006A82 01:7202: 29 0F     AND #$0F
    CMPI.B  #$00,D2  ; orig: - D 1 - I - 0x006A84 01:7204: C0 00     CPY #$00
    BEQ     bra_7209             ; BEQ  ; orig: - D 1 - I - 0x006A86 01:7206: F0 01     BEQ bra_7209    ; if

; if dungeon
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A88 01:7208: 0A        ASL
bra_7209:  ; orig: bra_7209:

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A89 01:7209: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006A8A 01:720A: 0A        ASL
    ADDX.B  ram_0000_t44,D0  ; orig: - D 1 - I - 0x006A8B 01:720B: 65 00     ADC ram_0000_t44
    ADDX.B  ram_6BAC,D0  ; orig: - D 1 - I - 0x006A8D 01:720D: 6D AC 6B  ADC ram_6BAC
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006A90 01:7210: 9D 57 02  STA ram_spr_X + $54,
    MOVE.B  #$3E,D0  ; orig: - D 1 - I - 0x006A93 01:7213: A9 3E     LDA #$3E
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006A95 01:7215: 9D 55 02  STA ram_spr_T + $54,
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006A98 01:7218: A9 00     LDA #$00
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x006A9A 01:721A: E0 00     CPX #$00
    BEQ     bra_723C             ; BEQ  ; orig: - D 1 - I - 0x006A9C 01:721C: F0 1E     BEQ bra_723C
    MOVE.B  #$03,D0  ; orig: - D 1 - I - 0x006A9E 01:721E: A9 03     LDA #$03
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006AA0 01:7220: 48        PHA
    MOVE.B  ram_dungeon_level,D2  ; orig: - D 1 - I - 0x006AA1 01:7221: A4 10     LDY ram_dungeon_leve
    CMPI.B  #$09,D2  ; orig: - D 1 - I - 0x006AA3 01:7223: C0 09     CPY #$09
    BEQ     bra_722F             ; BEQ  ; orig: - D 1 - I - 0x006AA5 01:7225: F0 08     BEQ bra_722F
    MOVE.B  ram_item_triforce_pieces,D0  ; orig: - D 1 - I - 0x006AA7 01:7227: AD 71 06  LDA ram_item_triforc
    ; !! AND tbl_0x01E6CE_8_bits - $01,Y - needs manual review  ; orig: - D 1 - I - 0x006AAA 01:722A: 39 BD E6  AND tbl_0x01E6CE_8_b
    BNE     bra_723B             ; BNE  ; orig: - D 1 - I - 0x006AAD 01:722D: D0 0C     BNE bra_723B
bra_722F:  ; orig: bra_722F:
    MOVE.B  ram_frm_cnt,D0  ; orig: - D 1 - I - 0x006AAF 01:722F: A5 15     LDA ram_frm_cnt
    ANDI.B  #$1F,D0  ; orig: - D 1 - I - 0x006AB1 01:7231: 29 1F     AND #$1F
    CMPI.B  #$10,D0  ; orig: - D 1 - I - 0x006AB3 01:7233: C9 10     CMP #$10
    BCS     bra_723B             ; BCS  ; orig: - D 1 - I - 0x006AB5 01:7235: B0 04     BCS bra_723B
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006AB7 01:7237: 68        PLA
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x006AB8 01:7238: A9 02     LDA #$02
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006ABA 01:723A: 48        PHA
bra_723B:  ; orig: bra_723B:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006ABB 01:723B: 68        PLA
bra_723C:  ; orig: bra_723C:
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006ABC 01:723C: 9D 56 02  STA ram_spr_A + $54,
bra_723F_RTS:  ; orig: bra_723F_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006ABF 01:723F: 60        RTS



sub_bat_7240_curtain_movement_handler:  ; orig: sub_bat_7240_curtain_movement_handler:
    BSR     sub_7248_curtain_movement_handler             ; JSR -> BSR  ; orig: - D 1 - I - 0x006AC0 01:7240: 20 48 72  JSR sub_7248_curtain
    MOVE.B  #con_prg_bank + $02,D0  ; orig: - D 1 - I - 0x006AC3 01:7243: A9 02     LDA #con_prg_bank + 
    JMP     loc_inc_0x003FBC_prg_bankswitch  ; orig: - D 1 - I - 0x006AC5 01:7245: 4C AC BF  JMP loc_inc_0x003FBC



sub_7248_curtain_movement_handler:  ; orig: sub_7248_curtain_movement_handler:
sub_bat_7248_curtain_movement_handler:  ; orig: sub_bat_7248_curtain_movement_handler:
    MOVE.B  ram_timer_link,D0  ; orig: - D 1 - I - 0x006AC8 01:7248: A5 28     LDA ram_timer_link
    BNE     bra_7273_RTS             ; BNE  ; orig: - D 1 - I - 0x006ACA 01:724A: D0 27     BNE bra_7273_RTS
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006ACC 01:724C: A9 01     LDA #$01
    MOVE.B  D0,ram_000A_t11  ; orig: - D 1 - I - 0x006ACE 01:724E: 85 0A     STA ram_000A_t11
bra_7250_loop:  ; orig: bra_7250_loop:
    MOVE.B  ram_000A_t11,D1  ; orig: - D 1 - I - 0x006AD0 01:7250: A6 0A     LDX ram_000A_t11
    MOVE.B  ram_007C(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006AD2 01:7252: B5 7C     LDA ram_007C,X
    MOVE.B  D0,ram_00E8  ; orig: - D 1 - I - 0x006AD4 01:7254: 85 E8     STA ram_00E8
    MOVE.B  #con_prg_bank + $05,D0  ; orig: - D 1 - I - 0x006AD6 01:7256: A9 05     LDA #con_prg_bank + 
    BSR     sub_inc_0x003FBC_prg_bankswitch             ; JSR -> BSR  ; orig: - D 1 - I - 0x006AD8 01:7258: 20 AC BF  JSR sub_inc_0x003FBC
    MOVE.B  #con_mirroring_V,D0  ; orig: - D 1 - I - 0x006ADB 01:725B: A9 0E     LDA #con_mirroring_V
    BSR     sub_inc_0x003FA8_set_control_register             ; JSR -> BSR  ; orig: - D 1 - I - 0x006ADD 01:725D: 20 98 BF  JSR sub_inc_0x003FA8
    BSR     sub_0x0168EE_move_curtain             ; JSR -> BSR  ; orig: - D 1 - I - 0x006AE0 01:7260: 20 DE A8  JSR sub_0x0168EE_mov
    SUBQ.B  #1,ram_000A_t11  ; orig: - D 1 - I - 0x006AE3 01:7263: C6 0A     DEC ram_000A_t11
    BPL     bra_7250_loop             ; BPL  ; orig: - D 1 - I - 0x006AE5 01:7265: 10 E9     BPL bra_7250_loop
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006AE7 01:7267: A9 FF     LDA #$FF
    MOVE.B  D0,ram_00E8  ; orig: - D 1 - I - 0x006AE9 01:7269: 85 E8     STA ram_00E8
    MOVE.B  #$05,D0  ; orig: - D 1 - I - 0x006AEB 01:726B: A9 05     LDA #$05
    MOVE.B  D0,ram_timer_link  ; orig: - D 1 - I - 0x006AED 01:726D: 85 28     STA ram_timer_link
    SUBQ.B  #1,ram_007C  ; orig: - D 1 - I - 0x006AEF 01:726F: C6 7C     DEC ram_007C
    ; (empty translation for INC)  ; orig: - D 1 - I - 0x006AF1 01:7271: E6 7D     INC ram_007C + $01
bra_7273_RTS:  ; orig: bra_7273_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006AF3 01:7273: 60        RTS



sub_bat_7274_inc_0000_pointer_by_01:  ; orig: sub_bat_7274_inc_0000_pointer_by_01:
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006AF4 01:7274: A9 01     LDA #$01
sub_bat_7276_inc_0000_pointer_by_A:  ; orig: sub_bat_7276_inc_0000_pointer_by_A:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006AF6 01:7276: 18        CLC
    ADDX.B  ram_0000_temp,D0  ; orig: - D 1 - I - 0x006AF7 01:7277: 65 00     ADC ram_0000_temp
    MOVE.B  D0,ram_0000_temp  ; orig: - D 1 - I - 0x006AF9 01:7279: 85 00     STA ram_0000_temp
    BCC     bra_727F_RTS             ; BCC  ; orig: - D 1 - I - 0x006AFB 01:727B: 90 02     BCC bra_727F_RTS

; if overflow
    ADDQ.B  #1,ram_0001_temp  ; orig: - D 1 - I - 0x006AFD 01:727D: E6 01     INC ram_0001_temp
bra_727F_RTS:  ; orig: bra_727F_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006AFF 01:727F: 60        RTS



sub_bat_7280_inc_0002_pointer_by_01:  ; orig: sub_bat_7280_inc_0002_pointer_by_01:
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006B00 01:7280: A9 01     LDA #$01
sub_bat_7282_inc_0002_pointer_by_A:  ; orig: sub_bat_7282_inc_0002_pointer_by_A:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006B02 01:7282: 18        CLC
    ADDX.B  ram_0002_temp,D0  ; orig: - D 1 - I - 0x006B03 01:7283: 65 02     ADC ram_0002_temp
    MOVE.B  D0,ram_0002_temp  ; orig: - D 1 - I - 0x006B05 01:7285: 85 02     STA ram_0002_temp
    BCC     bra_728B_RTS             ; BCC  ; orig: - D 1 - I - 0x006B07 01:7287: 90 02     BCC bra_728B_RTS

; if overflow
    ADDQ.B  #1,ram_0003_temp  ; orig: - D 1 - I - 0x006B09 01:7289: E6 03     INC ram_0003_temp
bra_728B_RTS:  ; orig: bra_728B_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006B0B 01:728B: 60        RTS



sub_bat_728C_inc_0004_pointer_by_01:  ; orig: sub_bat_728C_inc_0004_pointer_by_01:
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x006B0C 01:728C: A9 01     LDA #$01
sub_bat_728E_inc_0004_pointer_by_A:  ; orig: sub_bat_728E_inc_0004_pointer_by_A:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006B0E 01:728E: 18        CLC
    ADDX.B  ram_0004_temp,D0  ; orig: - D 1 - I - 0x006B0F 01:728F: 65 04     ADC ram_0004_temp
    MOVE.B  D0,ram_0004_temp  ; orig: - D 1 - I - 0x006B11 01:7291: 85 04     STA ram_0004_temp
    BCC     bra_7297_RTS             ; BCC  ; orig: - D 1 - I - 0x006B13 01:7293: 90 02     BCC bra_7297_RTS

; if overflow
    ADDQ.B  #1,ram_0005_temp  ; orig: - D 1 - I - 0x006B15 01:7295: E6 05     INC ram_0005_temp
bra_7297_RTS:  ; orig: bra_7297_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006B17 01:7297: 60        RTS



sub_bat_7298_dec_0004_pointer_by_01:  ; orig: sub_bat_7298_dec_0004_pointer_by_01:
    MOVE.B  ram_0004_temp,D0  ; orig: - D 1 - I - 0x006B18 01:7298: A5 04     LDA ram_0004_temp
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006B1A 01:729A: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: - D 1 - I - 0x006B1B 01:729B: E9 01     SBC #$01
    MOVE.B  D0,ram_0004_temp  ; orig: - D 1 - I - 0x006B1D 01:729D: 85 04     STA ram_0004_temp
    BCS     bra_72A3_RTS             ; BCS  ; orig: - D 1 - I - 0x006B1F 01:729F: B0 02     BCS bra_72A3_RTS

; if underflow
    SUBQ.B  #1,ram_0005_temp  ; orig: - D 1 - I - 0x006B21 01:72A1: C6 05     DEC ram_0005_temp
bra_72A3_RTS:  ; orig: bra_72A3_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006B23 01:72A3: 60        RTS



tbl_72A4:  ; orig: tbl_72A4:
tbl_bat_72A4:  ; orig: tbl_bat_72A4:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B24 01:72A4: 01        .byte $01   ; 00 bom
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B25 01:72A5: 00        .byte $00   ; 01 woo
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B26 01:72A6: 00        .byte $00   ; 02 whi
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B27 01:72A7: 00        .byte $00   ; 03 mag
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - I - 0x006B28 01:72A8: 06        .byte $06   ; 04 mea
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - I - 0x006B29 01:72A9: 05        .byte $05   ; 05 flu
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - I - 0x006B2A 01:72AA: 04        .byte $04   ; 06 blu
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - I - 0x006B2B 01:72AB: 04        .byte $04   ; 07 red
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B2C 01:72AC: 02        .byte $02   ; 08 arr
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B2D 01:72AD: 02        .byte $02   ; 09 sil
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006B2E 01:72AE: 03        .byte $03   ; 0A bow
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 1 - I - 0x006B2F 01:72AF: 0D        .byte $0D   ; 0B mag
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - I - 0x006B30 01:72B0: 09        .byte $09   ; 0C raf
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - I - 0x006B31 01:72B1: 0C        .byte $0C   ; 0D lad
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 1 - I - 0x006B32 01:72B2: 1B        .byte $1B   ; 0E unu
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - I - 0x006B33 01:72B3: 1C        .byte $1C   ; 0F 5 r
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006B34 01:72B4: 08        .byte $08   ; 10 mag
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - I - 0x006B35 01:72B5: 0A        .byte $0A   ; 11 rec
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006B36 01:72B6: 0B        .byte $0B   ; 12 blu
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006B37 01:72B7: 0B        .byte $0B   ; 13 red
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 1 - I - 0x006B38 01:72B8: 0E        .byte $0E   ; 14 pow
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - I - 0x006B39 01:72B9: 0F        .byte $0F   ; 15 let
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - I - 0x006B3A 01:72BA: 10        .byte $10   ; 16 com
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 1 - I - 0x006B3B 01:72BB: 11        .byte $11   ; 17 map
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - I - 0x006B3C 01:72BC: 16        .byte $16   ; 18 1 r
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - I - 0x006B3D 01:72BD: 17        .byte $17   ; 19 key
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - I - 0x006B3E 01:72BE: 18        .byte $18   ; 1A hea
    ; [DIRECTIVE] .BYTE $1A  -- needs manual handling  ; orig: - D 1 - I - 0x006B3F 01:72BF: 1A        .byte $1A   ; 1B tri
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 1 - I - 0x006B40 01:72C0: 1F        .byte $1F   ; 1C mag
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 1 - I - 0x006B41 01:72C1: 1D        .byte $1D   ; 1D boo
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 1 - I - 0x006B42 01:72C2: 1E        .byte $1E   ; 1E mag
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - I - 0x006B43 01:72C3: 07        .byte $07   ; 1F blu
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - I - 0x006B44 01:72C4: 07        .byte $07   ; 20 red
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 1 - I - 0x006B45 01:72C5: 15        .byte $15   ; 21 clo
    ; [DIRECTIVE] .BYTE $19  -- needs manual handling  ; orig: - D 1 - I - 0x006B46 01:72C6: 19        .byte $19   ; 22 sma
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - I - 0x006B47 01:72C7: 14        .byte $14   ; 23 fai



tbl_72C8:  ; orig: tbl_72C8:
tbl_bat_72C8:  ; orig: tbl_bat_72C8:

; .... xxxx = item counter

; xxxx .... = ???
    ; [DIRECTIVE] .BYTE $10 + $04  -- needs manual handling  ; orig: - D 1 - I - 0x006B48 01:72C8: 14        .byte $10 + $04   ; 
    ; [DIRECTIVE] .BYTE $20 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B49 01:72C9: 21        .byte $20 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B4A 01:72CA: 22        .byte $20 + $02   ; 
    ; [DIRECTIVE] .BYTE $20 + $03  -- needs manual handling  ; orig: - D 1 - I - 0x006B4B 01:72CB: 23        .byte $20 + $03   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B4C 01:72CC: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B4D 01:72CD: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B4E 01:72CE: 21        .byte $20 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B4F 01:72CF: 22        .byte $20 + $02   ; 
    ; [DIRECTIVE] .BYTE $20 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B50 01:72D0: 21        .byte $20 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B51 01:72D1: 22        .byte $20 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B52 01:72D2: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B53 01:72D3: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B54 01:72D4: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B55 01:72D5: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B56 01:72D6: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $05  -- needs manual handling  ; orig: - D 1 - I - 0x006B57 01:72D7: 15        .byte $10 + $05   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B58 01:72D8: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B59 01:72D9: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B5A 01:72DA: 21        .byte $20 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B5B 01:72DB: 22        .byte $20 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B5C 01:72DC: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B5D 01:72DD: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B5E 01:72DE: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B5F 01:72DF: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B60 01:72E0: 11        .byte $10 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B61 01:72E1: 11        .byte $10 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B62 01:72E2: 10        .byte $10 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B63 01:72E3: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B64 01:72E4: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B65 01:72E5: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B66 01:72E6: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B67 01:72E7: 11        .byte $10 + $01   ; 
    ; [DIRECTIVE] .BYTE $20 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B68 01:72E8: 22        .byte $20 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B69 01:72E9: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $10 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B6A 01:72EA: 10        .byte $10 + $00   ; 
    ; [DIRECTIVE] .BYTE $10 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B6B 01:72EB: 12        .byte $10 + $02   ; 



tbl_bat_72EC:  ; orig: tbl_bat_72EC:
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - I - 0x006B6C 01:72EC: FF        .byte $FF   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B6D 01:72ED: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - I - 0x006B6E 01:72EE: FF        .byte $FF   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B6F 01:72EF: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B70 01:72F0: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B71 01:72F1: 02        .byte $02   ; 05
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B72 01:72F2: 02        .byte $02   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B73 01:72F3: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B74 01:72F4: 01        .byte $01   ; 08
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B75 01:72F5: 00        .byte $00   ; 09
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B76 01:72F6: 02        .byte $02   ; 0A
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B77 01:72F7: 00        .byte $00   ; 0B
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B78 01:72F8: 00        .byte $00   ; 0C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B79 01:72F9: 02        .byte $02   ; 0D
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B7A 01:72FA: 02        .byte $02   ; 0E
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B7B 01:72FB: 01        .byte $01   ; 0F
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B7C 01:72FC: 02        .byte $02   ; 10
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B7D 01:72FD: 02        .byte $02   ; 11
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B7E 01:72FE: 02        .byte $02   ; 12
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B7F 01:72FF: 02        .byte $02   ; 13
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B80 01:7300: 02        .byte $02   ; 14
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B81 01:7301: 02        .byte $02   ; 15
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B82 01:7302: 02        .byte $02   ; 16
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B83 01:7303: 02        .byte $02   ; 17
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B84 01:7304: 02        .byte $02   ; 18
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B85 01:7305: 02        .byte $02   ; 19
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B86 01:7306: 02        .byte $02   ; 1A
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006B87 01:7307: 02        .byte $02   ; 1B
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B88 01:7308: 01        .byte $01   ; 1C
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B89 01:7309: 00        .byte $00   ; 1D
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006B8A 01:730A: 01        .byte $01   ; 1E
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006B8B 01:730B: 00        .byte $00   ; 1F



sub_730C_set_map_bit4:  ; orig: sub_730C_set_map_bit4:
sub_bat_730C_set_map_bit4:  ; orig: sub_bat_730C_set_map_bit4:
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: - D 1 - I - 0x006B8C 01:730C: 20 CE E6  JSR sub_0x01E6DE_get
    ORI.B   #$10,D0  ; orig: - D 1 - I - 0x006B8F 01:730F: 09 10     ORA #$10
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: - D 1 - I - 0x006B91 01:7311: 91 00     STA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006B93 01:7313: 60        RTS



sub_7314_check_map_bit4:  ; orig: sub_7314_check_map_bit4:
sub_bat_7314_check_map_bit4:  ; orig: sub_bat_7314_check_map_bit4:

; out

; Z

; 0 =

; 1 =
    MOVE.B  ram_6BAF,D0  ; orig: - D 1 - I - 0x006B94 01:7314: AD AF 6B  LDA ram_6BAF
    MOVE.B  D0,ram_0008_t01_data  ; orig: - D 1 - I - 0x006B97 01:7317: 85 08     STA ram_0008_t01_dat
    MOVE.B  ram_6BB0,D0  ; orig: - D 1 - I - 0x006B99 01:7319: AD B0 6B  LDA ram_6BB0
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006B9C 01:731C: 85 09     STA ram_0008_t01_dat
    MOVE.B  ram_map_location,D2  ; orig: - D 1 - I - 0x006B9E 01:731E: A4 EB     LDY ram_map_location
    MOVEA.W ($FF0000+ram_0008_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: - D 1 - I - 0x006BA0 01:7320: B1 08     LDA (ram_0008_t01_da
    ANDI.B  #$10,D0  ; orig: - D 1 - I - 0x006BA2 01:7322: 29 10     AND #$10
bra_7324_RTS:  ; orig: bra_7324_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006BA4 01:7324: 60        RTS



tbl_7325_tunic_color:  ; orig: tbl_7325_tunic_color:
    ; [DIRECTIVE] .BYTE $29  -- needs manual handling  ; orig: - D 1 - I - 0x006BA5 01:7325: 29        .byte $29   ; 00 gre
    ; [DIRECTIVE] .BYTE $32  -- needs manual handling  ; orig: - D 1 - I - 0x006BA6 01:7326: 32        .byte $32   ; 01 blu
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - I - 0x006BA7 01:7327: 16        .byte $16   ; 02 red



sub_bat_7328:  ; orig: sub_bat_7328:
    MOVE.B  ram_state_link,D0  ; orig: - D 1 - I - 0x006BA8 01:7328: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_freeze + con_obj_state_80,D0  ; orig: - D 1 - I - 0x006BAA 01:732A: 29 C0     AND #con_obj_state_f
    CMPI.B  #con_obj_state_freeze,D0  ; orig: - D 1 - I - 0x006BAC 01:732C: C9 40     CMP #con_obj_state_f
    BEQ     bra_7324_RTS             ; BEQ  ; orig: - D 1 - I - 0x006BAE 01:732E: F0 F4     BEQ bra_7324_RTS
    BSR     sub_7314_check_map_bit4             ; JSR -> BSR  ; orig: - D 1 - I - 0x006BB0 01:7330: 20 14 73  JSR sub_7314_check_m
    BNE     bra_7324_RTS             ; BNE  ; orig: - D 1 - I - 0x006BB3 01:7333: D0 EF     BNE bra_7324_RTS
    MOVE.B  #$13,D1  ; orig: - D 1 - I - 0x006BB5 01:7335: A2 13     LDX #$13
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006BB7 01:7337: B5 AC     LDA ram_room_item_fl
    BMI     bra_7324_RTS             ; BMI  ; orig: - D 1 - I - 0x006BB9 01:7339: 30 E9     BMI bra_7324_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006BBB 01:733B: B5 98     LDA ram_drop_id_room
    MOVE.B  D0,ram_0004_t17  ; orig: - D 1 - I - 0x006BBD 01:733D: 85 04     STA ram_0004_t17
sub_bat_733F:  ; orig: sub_bat_733F:
    MOVE.B  ram_03A8_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006BBF 01:733F: BD A8 03  LDA ram_03A8_enemy,X
    CMPI.B  #$F0,D0  ; orig: - D 1 - I - 0x006BC2 01:7342: C9 F0     CMP #$F0
    BCS     bra_73B8_RTS             ; BCS  ; orig: - D 1 - I - 0x006BC4 01:7344: B0 72     BCS bra_73B8_RTS
    MOVE.B  ram_pos_Y_link,D0  ; orig: - D 1 - I - 0x006BC6 01:7346: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006BC8 01:7348: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006BC9 01:7349: 69 03     ADC #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006BCB 01:734B: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x006BCC 01:734C: F5 84     SBC ram_pos_Y_enemy,
    BSR     sub_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: - D 1 - I - 0x006BCE 01:734E: 20 1F 70  JSR sub_701F_EOR_FF_
    CMPI.B  #$09,D0  ; orig: - D 1 - I - 0x006BD1 01:7351: C9 09     CMP #$09
    BCS     bra_73B8_RTS             ; BCS  ; orig: - D 1 - I - 0x006BD3 01:7353: B0 63     BCS bra_73B8_RTS
    MOVE.B  ram_pos_X_link,D0  ; orig: - D 1 - I - 0x006BD5 01:7355: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006BD7 01:7357: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: - D 1 - I - 0x006BD8 01:7358: F5 70     SBC ram_pos_X_enemy,
    BSR     sub_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: - D 1 - I - 0x006BDA 01:735A: 20 1F 70  JSR sub_701F_EOR_FF_
    CMPI.B  #$09,D0  ; orig: - D 1 - I - 0x006BDD 01:735D: C9 09     CMP #$09
    BCS     bra_73B8_RTS             ; BCS  ; orig: - D 1 - I - 0x006BDF 01:735F: B0 57     BCS bra_73B8_RTS
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006BE1 01:7361: A9 FF     LDA #$FF
    MOVE.B  D0,ram_drop_id_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006BE3 01:7363: 95 AC     STA ram_drop_id_enem
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006BE5 01:7365: 95 84     STA ram_pos_Y_enemy,
    CMPI.B  #$13,D1  ; orig: - D 1 - I - 0x006BE7 01:7367: E0 13     CPX #$13
    BNE     bra_736E             ; BNE  ; orig: - D 1 - I - 0x006BE9 01:7369: D0 03     BNE bra_736E
    BSR     sub_730C_set_map_bit4             ; JSR -> BSR  ; orig: - D 1 - I - 0x006BEB 01:736B: 20 0C 73  JSR sub_730C_set_map
bra_736E:  ; orig: bra_736E:
    MOVE.B  ram_0004_t17,D0  ; orig: - D 1 - I - 0x006BEE 01:736E: A5 04     LDA ram_0004_t17
sub_bat_7370:  ; orig: sub_bat_7370:
    MOVE.B  #con_sfx_2_pick_up_item,D1  ; orig: - D 1 - I - 0x006BF0 01:7370: A2 08     LDX #con_sfx_2_pick_
    MOVE.B  D1,ram_sfx_2  ; orig: - D 1 - I - 0x006BF2 01:7372: 8E 02 06  STX ram_sfx_2
    CMPI.B  #$0E,D0  ; orig: - D 1 - I - 0x006BF5 01:7375: C9 0E     CMP #$0E
    BNE     bra_737E             ; BNE  ; orig: - D 1 - I - 0x006BF7 01:7377: D0 05     BNE bra_737E
    MOVE.B  #con_sfx_2_02,D1  ; orig: - D 1 - I - 0x006BF9 01:7379: A2 02     LDX #con_sfx_2_02
    MOVE.B  D1,ram_sfx_2  ; orig: - D 1 - I - 0x006BFB 01:737B: 8E 02 06  STX ram_sfx_2
bra_737E:  ; orig: bra_737E:
    MOVE.B  ram_script,D1  ; orig: - D 1 - I - 0x006BFE 01:737E: A6 12     LDX ram_script
    CMPI.B  #con_script_05_gameplay,D1  ; orig: - D 1 - I - 0x006C00 01:7380: E0 05     CPX #con_script_05_g
    BEQ     bra_7391             ; BEQ  ; orig: - D 1 - I - 0x006C02 01:7382: F0 0D     BEQ bra_7391
    MOVE.B  #$80,D1  ; orig: - D 1 - I - 0x006C04 01:7384: A2 80     LDX #$80
    MOVE.B  D1,ram_0506  ; orig: - D 1 - I - 0x006C06 01:7386: 8E 06 05  STX ram_0506
    MOVE.B  #con_music_pick_up_item,D1  ; orig: - D 1 - I - 0x006C09 01:7389: A2 08     LDX #con_music_pick_
    MOVE.B  D1,ram_music  ; orig: - D 1 - I - 0x006C0B 01:738B: 8E 00 06  STX ram_music
    MOVE.B  D0,ram_0505  ; orig: - D 1 - I - 0x006C0E 01:738E: 8D 05 05  STA ram_0505
bra_7391:  ; orig: bra_7391:
    MOVE.B  D0,D1           ; TAX  ; orig: - D 1 - I - 0x006C11 01:7391: AA        TAX
    MOVE.B  tbl_72A4(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006C12 01:7392: BD A4 72  LDA tbl_72A4,X
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x006C15 01:7395: A8        TAY
    MOVE.B  tbl_72C8(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006C16 01:7396: BD C8 72  LDA tbl_72C8,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006C19 01:7399: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x006C1A 01:739A: 29 0F     AND #$0F
    MOVE.B  D0,ram_000A_t12_item_amount  ; orig: - D 1 - I - 0x006C1C 01:739C: 85 0A     STA ram_000A_t12_ite
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006C1E 01:739E: 68        PLA
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x006C1F 01:739F: 29 F0     AND #$F0
    BNE     bra_73C2             ; BNE  ; orig: - D 1 - I - 0x006C21 01:73A1: D0 1F     BNE bra_73C2
    CMPI.B  #con_item_map,D2  ; orig: - D 1 - I - 0x006C23 01:73A3: C0 11     CPY #con_item_map
    BEQ     bra_7419             ; BEQ  ; orig: - D 1 - I - 0x006C25 01:73A5: F0 72     BEQ bra_7419
    CMPI.B  #con_item_compass,D2  ; orig: - D 1 - I - 0x006C27 01:73A7: C0 10     CPY #con_item_compas
    BEQ     bra_7419             ; BEQ  ; orig: - D 1 - I - 0x006C29 01:73A9: F0 6E     BEQ bra_7419
    CMPI.B  #con_item_triforce,D2  ; orig: - D 1 - I - 0x006C2B 01:73AB: C0 1A     CPY #con_item_trifor
    BEQ     bra_7419             ; BEQ  ; orig: - D 1 - I - 0x006C2D 01:73AD: F0 6A     BEQ bra_7419
    CMPI.B  #con_item_1B,D2  ; orig: - D 1 - I - 0x006C2F 01:73AF: C0 1B     CPY #con_item_1B
    BEQ     bra_7419             ; BEQ  ; orig: - D 1 - I - 0x006C31 01:73B1: F0 66     BEQ bra_7419
    MOVE.B  ram_000A_t12_item_amount,D0  ; orig: - D 1 - I - 0x006C33 01:73B3: A5 0A     LDA ram_000A_t12_ite
loc_73B5:  ; orig: loc_73B5:
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006C35 01:73B5: 99 57 06  STA ram_items,Y
bra_73B8_RTS:  ; orig: bra_73B8_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006C38 01:73B8: 60        RTS



bra_73B9_5_rupees:  ; orig: bra_73B9_5_rupees:
    MOVE.B  #$04,D2  ; orig: - D 1 - I - 0x006C39 01:73B9: A0 04     LDY #$04
bra_73BB_loop:  ; orig: bra_73BB_loop:
    BSR     sub_74A3_increase_rupees_and_add_sfx             ; JSR -> BSR  ; orig: - D 1 - I - 0x006C3B 01:73BB: 20 A3 74  JSR sub_74A3_increas
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x006C3E 01:73BE: 88        DEY
    BPL     bra_73BB_loop             ; BPL  ; orig: - D 1 - I - 0x006C3F 01:73BF: 10 FA     BPL bra_73BB_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006C41 01:73C1: 60        RTS



bra_73C2:  ; orig: bra_73C2:
    CMPI.B  #con_item_compass,D0  ; orig: - D 1 - I - 0x006C42 01:73C2: C9 10     CMP #con_item_compas
    BNE     bra_7413_compass             ; BNE  ; orig: - D 1 - I - 0x006C44 01:73C4: D0 4D     BNE bra_7413_compass
    CMPI.B  #con_item_hearts_1,D2  ; orig: - D 1 - I - 0x006C46 01:73C6: C0 18     CPY #con_item_hearts
    BEQ     bra_7404_hearts_1             ; BEQ  ; orig: - D 1 - I - 0x006C48 01:73C8: F0 3A     BEQ bra_7404_hearts_
    CMPI.B  #con_item_5_rupees,D2  ; orig: - D 1 - I - 0x006C4A 01:73CA: C0 1C     CPY #con_item_5_rupe
    BEQ     bra_73B9_5_rupees             ; BEQ  ; orig: - D 1 - I - 0x006C4C 01:73CC: F0 EB     BEQ bra_73B9_5_rupee
    CMPI.B  #con_item_1_rupee,D2  ; orig: - D 1 - I - 0x006C4E 01:73CE: C0 16     CPY #con_item_1_rupe
    BEQ     bra_7410_1_rupee             ; BEQ  ; orig: - D 1 - I - 0x006C50 01:73D0: F0 3E     BEQ bra_7410_1_rupee
    CMPI.B  #con_item_hearts_2,D2  ; orig: - D 1 - I - 0x006C52 01:73D2: C0 19     CPY #con_item_hearts
    BEQ     bra_744B_hearts_2             ; BEQ  ; orig: - D 1 - I - 0x006C54 01:73D4: F0 75     BEQ bra_744B_hearts_
    CMPI.B  #con_item_keys,D2  ; orig: - D 1 - I - 0x006C56 01:73D6: C0 17     CPY #con_item_keys
    BNE     bra_73DD             ; BNE  ; orig: - D 1 - I - 0x006C58 01:73D8: D0 03     BNE bra_73DD

; if keys
    BSR     sub_74AC_set_item_pickup_sfx             ; JSR -> BSR  ; orig: - D 1 - I - 0x006C5A 01:73DA: 20 AC 74  JSR sub_74AC_set_ite
bra_73DD:  ; orig: bra_73DD:
    CMPI.B  #con_item_14,D2  ; orig: - D 1 - I - 0x006C5D 01:73DD: C0 14     CPY #con_item_14
    BEQ     bra_744E             ; BEQ  ; orig: - D 1 - I - 0x006C5F 01:73DF: F0 6D     BEQ bra_744E
    MOVE.B  ram_000A_t12_item_amount,D0  ; orig: - D 1 - I - 0x006C61 01:73E1: A5 0A     LDA ram_000A_t12_ite
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006C63 01:73E3: 18        CLC
    ; !! ADC ram_items,Y - complex mode, manual review needed  ; orig: - D 1 - I - 0x006C64 01:73E4: 79 57 06  ADC ram_items,Y
    BCC     bra_73EB             ; BCC  ; orig: - D 1 - I - 0x006C67 01:73E7: 90 02     BCC bra_73EB
bra_73E9_loop:  ; orig: bra_73E9_loop:
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006C69 01:73E9: A9 FF     LDA #$FF
bra_73EB:  ; orig: bra_73EB:
    CMPI.B  #con_item_potion,D2  ; orig: - D 1 - I - 0x006C6B 01:73EB: C0 07     CPY #con_item_potion
    BNE     bra_73F5             ; BNE  ; orig: - D 1 - I - 0x006C6D 01:73ED: D0 06     BNE bra_73F5
    CMPI.B  #$03,D0  ; orig: - D 1 - I - 0x006C6F 01:73EF: C9 03     CMP #$03
    BCC     bra_73F5             ; BCC  ; orig: - D 1 - I - 0x006C71 01:73F1: 90 02     BCC bra_73F5
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x006C73 01:73F3: A9 02     LDA #$02
bra_73F5:  ; orig: bra_73F5:
    CMPI.B  #con_item_bomb,D2  ; orig: - D 1 - I - 0x006C75 01:73F5: C0 01     CPY #con_item_bomb
    BNE     bra_7401             ; BNE  ; orig: - D 1 - I - 0x006C77 01:73F7: D0 08     BNE bra_7401
    CMP.B   ram_item_max_bombs,D0  ; orig: - D 1 - I - 0x006C79 01:73F9: CD 7C 06  CMP ram_item_max_bom
    BCC     bra_7401             ; BCC  ; orig: - D 1 - I - 0x006C7C 01:73FC: 90 03     BCC bra_7401
    MOVE.B  ram_item_max_bombs,D0  ; orig: - D 1 - I - 0x006C7E 01:73FE: AD 7C 06  LDA ram_item_max_bom
bra_7401:  ; orig: bra_7401:
    JMP     loc_73B5  ; orig: - D 1 - I - 0x006C81 01:7401: 4C B5 73  JMP loc_73B5
bra_7404_hearts_1:  ; orig: bra_7404_hearts_1:
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006C84 01:7404: B9 57 06  LDA ram_items,Y
    CMPI.B  #$F0,D0  ; orig: - D 1 - I - 0x006C87 01:7407: C9 F0     CMP #$F0
    BCS     bra_73B8_RTS             ; BCS  ; orig: - D 1 - I - 0x006C89 01:7409: B0 AD     BCS bra_73B8_RTS
    ADDX.B  #$11,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x006C8B 01:740B: 69 11     ADC #$11
    JMP     loc_73B5  ; orig: - D 1 - I - 0x006C8D 01:740D: 4C B5 73  JMP loc_73B5
bra_7410_1_rupee:  ; orig: bra_7410_1_rupee:
    JMP     loc_74A3_increase_rupees_and_add_sfx  ; orig: - D 1 - I - 0x006C90 01:7410: 4C A3 74  JMP loc_74A3_increas
bra_7413_compass:  ; orig: bra_7413_compass:
    CMPI.B  #$20,D0  ; orig: - D 1 - I - 0x006C93 01:7413: C9 20     CMP #$20
    BNE     bra_73E9_loop             ; BNE  ; orig: - D 1 - I - 0x006C95 01:7415: D0 D2     BNE bra_73E9_loop
    BEQ     bra_7484             ; BEQ  ; orig: - D 1 - I - 0x006C97 01:7417: F0 6B     BEQ bra_7484    ; jm
bra_7419:  ; orig: bra_7419:
    MOVE.B  ram_dungeon_level,D0  ; orig: - D 1 - I - 0x006C99 01:7419: A5 10     LDA ram_dungeon_leve
    BEQ     bra_744A_RTS             ; BEQ  ; orig: - D 1 - I - 0x006C9B 01:741B: F0 2D     BEQ bra_744A_RTS    

; if dungeon
    CMPI.B  #con_item_1B,D2  ; orig: - D 1 - I - 0x006C9D 01:741D: C0 1B     CPY #con_item_1B
    BEQ     bra_747C             ; BEQ  ; orig: - D 1 - I - 0x006C9F 01:741F: F0 5B     BEQ bra_747C
    CMPI.B  #con_item_map,D2  ; orig: - D 1 - I - 0x006CA1 01:7421: C0 11     CPY #con_item_map
    BNE     bra_742A             ; BNE  ; orig: - D 1 - I - 0x006CA3 01:7423: D0 05     BNE bra_742A
    MOVE.B  #$01,D1  ; orig: - D 1 - I - 0x006CA5 01:7425: A2 01     LDX #$01
    MOVE.B  D1,ram_04E5  ; orig: - D 1 - I - 0x006CA7 01:7427: 8E E5 04  STX ram_04E5
bra_742A:  ; orig: bra_742A:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x006CAA 01:742A: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: - D 1 - I - 0x006CAB 01:742B: E9 01     SBC #$01
    CMPI.B  #$08,D0  ; orig: - D 1 - I - 0x006CAD 01:742D: C9 08     CMP #$08
    BCC     bra_7433             ; BCC  ; orig: - D 1 - I - 0x006CAF 01:742F: 90 02     BCC bra_7433
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x006CB1 01:7431: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x006CB2 01:7432: C8        INY
bra_7433:  ; orig: bra_7433:
    ANDI.B  #$07,D0  ; orig: - D 1 - I - 0x006CB3 01:7433: 29 07     AND #$07
    MOVE.B  D0,D1           ; TAX  ; orig: - D 1 - I - 0x006CB5 01:7435: AA        TAX
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006CB6 01:7436: B9 57 06  LDA ram_items,Y
    ; !! ORA tbl_0x01E6CE_8_bits,X - needs manual review  ; orig: - D 1 - I - 0x006CB9 01:7439: 1D BE E6  ORA tbl_0x01E6CE_8_b
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006CBC 01:743C: 99 57 06  STA ram_items,Y
    CMPI.B  #con_item_triforce,D2  ; orig: - D 1 - I - 0x006CBF 01:743F: C0 1A     CPY #con_item_trifor
    BNE     bra_744A_RTS             ; BNE  ; orig: - D 1 - I - 0x006CC1 01:7441: D0 07     BNE bra_744A_RTS
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: - D 1 - I - 0x006CC3 01:7443: 20 A3 EB  JSR sub_0x01EBB3_cle
    MOVE.B  #con_script_triforce_collected,D0  ; orig: - D 1 - I - 0x006CC6 01:7446: A9 12     LDA #con_script_trif
    MOVE.B  D0,ram_script  ; orig: - D 1 - I - 0x006CC8 01:7448: 85 12     STA ram_script
bra_744A_RTS:  ; orig: bra_744A_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006CCA 01:744A: 60        RTS
bra_744B_hearts_2:  ; orig: bra_744B_hearts_2:
    BSR     sub_74AC_set_item_pickup_sfx             ; JSR -> BSR  ; orig: - D 1 - I - 0x006CCB 01:744B: 20 AC 74  JSR sub_74AC_set_ite
bra_744E:  ; orig: bra_744E:
    MOVE.B  ram_000A_t12_item_amount,D0  ; orig: - D 1 - I - 0x006CCE 01:744E: A5 0A     LDA ram_000A_t12_ite
    MOVE.B  D0,ram_0001_t19_item_amount  ; orig: - D 1 - I - 0x006CD0 01:7450: 85 01     STA ram_0001_t19_ite
bra_7452_loop:  ; orig: bra_7452_loop:
    BSR     sub_746C             ; JSR -> BSR  ; orig: - D 1 - I - 0x006CD2 01:7452: 20 6C 74  JSR sub_746C
    BNE     bra_745E             ; BNE  ; orig: - D 1 - I - 0x006CD5 01:7455: D0 07     BNE bra_745E
    ; (empty translation for LDX)  ; orig: - D 1 - I - 0x006CD7 01:7457: AE 70 06  LDX ram_item_hearts 
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006CDA 01:745A: E8        INX
    BNE     bra_7466             ; BNE  ; orig: - D 1 - I - 0x006CDB 01:745B: D0 09     BNE bra_7466
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006CDD 01:745D: 60        RTS
bra_745E:  ; orig: bra_745E:
    ADDQ.B  #1,ram_item_hearts  ; orig: - D 1 - I - 0x006CDE 01:745E: EE 6F 06  INC ram_item_hearts
    SUBQ.B  #1,ram_0001_t19_item_amount  ; orig: - D 1 - I - 0x006CE1 01:7461: C6 01     DEC ram_0001_t19_ite
    BPL     bra_7452_loop             ; BPL  ; orig: - D 1 - I - 0x006CE3 01:7463: 10 ED     BPL bra_7452_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006CE5 01:7465: 60        RTS
bra_7466:  ; orig: bra_7466:
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006CE6 01:7466: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006CE8 01:7468: 8D 70 06  STA ram_item_hearts 
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006CEB 01:746B: 60        RTS



sub_746C:  ; orig: sub_746C:
sub_bat_746C:  ; orig: sub_bat_746C:
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x006CEC 01:746C: AD 6F 06  LDA ram_item_hearts
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x006CEF 01:746F: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x006CF0 01:7470: 29 0F     AND #$0F
    MOVE.B  D0,ram_0000_t47  ; orig: - D 1 - I - 0x006CF2 01:7472: 85 00     STA ram_0000_t47
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x006CF4 01:7474: 68        PLA

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006CF5 01:7475: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006CF6 01:7476: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006CF7 01:7477: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006CF8 01:7478: 4A        LSR
    CMP.B   ram_0000_t47,D0  ; orig: - D 1 - I - 0x006CF9 01:7479: C5 00     CMP ram_0000_t47
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006CFB 01:747B: 60        RTS



bra_747C:  ; orig: bra_747C:
    MOVE.B  #con_prg_bank + $01,D0  ; orig: - D 1 - I - 0x006CFC 01:747C: A9 01     LDA #con_prg_bank + 
    BSR     sub_inc_0x003FBC_prg_bankswitch             ; JSR -> BSR  ; orig: - D 1 - I - 0x006CFE 01:747E: 20 AC BF  JSR sub_inc_0x003FBC
    JMP     loc_0x0061C1  ; orig: - D 1 - I - 0x006D01 01:7481: 4C B1 A1  JMP loc_0x0061C1



bra_7484:  ; orig: bra_7484:
    MOVE.B  ram_000A_t12_item_amount,D0  ; orig: - D 1 - I - 0x006D04 01:7484: A5 0A     LDA ram_000A_t12_ite
    CMP.B   ram_items(D2.L),D0  ; orig: - D 1 - I - 0x006D06 01:7486: D9 57 06  CMP ram_items,Y
    BCC     bra_74AB_RTS             ; BCC  ; orig: - D 1 - I - 0x006D09 01:7489: 90 20     BCC bra_74AB_RTS
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006D0B 01:748B: 99 57 06  STA ram_items,Y
    CMPI.B  #con_item_ring,D2  ; orig: - D 1 - I - 0x006D0E 01:748E: C0 0B     CPY #con_item_ring
    BNE     bra_74AB_RTS             ; BNE  ; orig: - D 1 - I - 0x006D10 01:7490: D0 19     BNE bra_74AB_RTS

; if ring
    MOVE.B  ram_current_save_slot,D1  ; orig: - D 1 - I - 0x006D12 01:7492: A6 16     LDX ram_current_save
    MOVE.B  ram_item_ring,D2  ; orig: - D 1 - I - 0x006D14 01:7494: AC 62 06  LDY ram_item_ring
    MOVE.B  tbl_7325_tunic_color(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006D17 01:7497: B9 25 73  LDA tbl_7325_tunic_c
    MOVE.B  tbl_0x01EA1E_save_slot_index(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x006D1A 01:749A: BC 0E EA  LDY tbl_0x01EA1E_sav
    MOVE.B  D0,ram_6804_tunic_color(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006D1D 01:749D: 99 04 68  STA ram_6804_tunic_c

; bzk optimize, JMP to 0x01EA43
    JMP     loc_0x01EA3B_set_tunic_color  ; orig: - D 1 - I - 0x006D20 01:74A0: 4C 2B EA  JMP loc_0x01EA3B_set



sub_74A3_increase_rupees_and_add_sfx:  ; orig: sub_74A3_increase_rupees_and_add_sfx:
loc_74A3_increase_rupees_and_add_sfx:  ; orig: loc_74A3_increase_rupees_and_add_sfx:
sub_bat_74A3_increase_rupees_and_add_sfx:  ; orig: sub_bat_74A3_increase_rupees_and_add_sfx:
    MOVE.B  #con_sfx_2_cursor_select,D0  ; orig: - D 1 - I - 0x006D23 01:74A3: A9 01     LDA #con_sfx_2_curso
    MOVE.B  D0,ram_sfx_2  ; orig: - D 1 - I - 0x006D25 01:74A5: 8D 02 06  STA ram_sfx_2
    ADDQ.B  #1,ram_rupees_adc  ; orig: - D 1 - I - 0x006D28 01:74A8: EE 7D 06  INC ram_rupees_adc
bra_74AB_RTS:  ; orig: bra_74AB_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006D2B 01:74AB: 60        RTS



sub_74AC_set_item_pickup_sfx:  ; orig: sub_74AC_set_item_pickup_sfx:
    MOVE.B  #con_sfx_2_00,D0  ; orig: - D 1 - I - 0x006D2C 01:74AC: A9 00     LDA #con_sfx_2_00
    MOVE.B  D0,ram_sfx_2  ; orig: - D 1 - I - 0x006D2E 01:74AE: 8D 02 06  STA ram_sfx_2
    MOVE.B  #con_sfx_4_pick_up_item,D0  ; orig: - D 1 - I - 0x006D31 01:74B1: A9 08     LDA #con_sfx_4_pick_
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x006D33 01:74B3: 8D 04 06  STA ram_sfx_4
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006D36 01:74B6: 60        RTS



sub_bat_74B7:  ; orig: sub_bat_74B7:
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x006D37 01:74B7: A5 34     LDA ram_timer_obj + 
    BNE     bra_7506_RTS             ; BNE  ; orig: - D 1 - I - 0x006D39 01:74B9: D0 4B     BNE bra_7506_RTS
    MOVE.B  ram_051C,D0  ; orig: - D 1 - I - 0x006D3B 01:74BB: AD 1C 05  LDA ram_051C
    BPL     bra_74C2             ; BPL  ; orig: - D 1 - I - 0x006D3E 01:74BE: 10 02     BPL bra_74C2

; after EOR 83

; 80/81/82/83 -> 03/02/01/00

; A0/A1/A2/A3 -> 23/22/21/20

; C0/C1/C2/C3 -> 83/82/81/80
    EORI.B  #$83,D0  ; orig: - D 1 - I - 0x006D40 01:74C0: 49 83     EOR #$83
bra_74C2:  ; orig: bra_74C2:
    MOVE.B  D0,ram_0000_t2F  ; orig: - D 1 - I - 0x006D42 01:74C2: 85 00     STA ram_0000_t2F

; * 09
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006D44 01:74C4: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006D45 01:74C5: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006D46 01:74C6: 0A        ASL
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x006D47 01:74C7: 18        CLC
    ADDX.B  ram_0000_t2F,D0  ; orig: - D 1 - I - 0x006D48 01:74C8: 65 00     ADC ram_0000_t2F
    ANDI.B  #$FC,D0  ; orig: - D 1 - I - 0x006D4A 01:74CA: 29 FC     AND #$FC

; considering ram_051C, Y will be

; 00/01/02/03 -> 00/08/10/18

; 20/21/22/23 -> 20/28/30/38

; 40/41/42/43 -> 40/48/50/58

; 60/61/62/63 -> 60/68/70/78

; 80/81/82/83 -> 18/10/08/00

; A0/A1/A2/A3 -> 38/30/28/20

; C0/C1/C2/C3 -> 58/50/48/40
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x006D4C 01:74CC: A8        TAY
    MOVE.B  ram_0301_buffer_index,D1  ; orig: - D 1 - I - 0x006D4D 01:74CD: AE 01 03  LDX ram_0301_buffer_

; last 8 background colors
    MOVE.B  #> $3F08,D0  ; orig: - D 1 - I - 0x006D50 01:74D0: A9 3F     LDA #> $3F08
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006D52 01:74D2: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006D55 01:74D5: E8        INX
    MOVE.B  #< $3F08,D0  ; orig: - D 1 - I - 0x006D56 01:74D6: A9 08     LDA #< $3F08
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006D58 01:74D8: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006D5B 01:74DB: E8        INX

; A = 08 (counter)
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006D5C 01:74DC: 9D 02 03  STA ram_0302_ppu_buf
    MOVE.B  D0,ram_0000_t6C_colors_counter  ; orig: - D 1 - I - 0x006D5F 01:74DF: 85 00     STA ram_0000_t6C_col
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006D61 01:74E1: E8        INX
bra_74E2_loop:  ; orig: bra_74E2_loop:
    MOVE.B  ram_6BFA(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x006D62 01:74E2: B9 FA 6B  LDA ram_6BFA,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006D65 01:74E5: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x006D68 01:74E8: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006D69 01:74E9: E8        INX
    SUBQ.B  #1,ram_0000_t6C_colors_counter  ; orig: - D 1 - I - 0x006D6A 01:74EA: C6 00     DEC ram_0000_t6C_col
    BNE     bra_74E2_loop             ; BNE  ; orig: - D 1 - I - 0x006D6C 01:74EC: D0 F4     BNE bra_74E2_loop
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x006D6E 01:74EE: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x006D70 01:74F0: 9D 02 03  STA ram_0302_ppu_buf
    MOVE.B  D1,ram_0301_buffer_index  ; orig: - D 1 - I - 0x006D73 01:74F3: 8E 01 03  STX ram_0301_buffer_
    ADDQ.B  #1,ram_051C  ; orig: - D 1 - I - 0x006D76 01:74F6: EE 1C 05  INC ram_051C
    MOVE.B  ram_051C,D0  ; orig: - D 1 - I - 0x006D79 01:74F9: AD 1C 05  LDA ram_051C
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x006D7C 01:74FC: 29 0F     AND #$0F
    CMPI.B  #$04,D0  ; orig: - D 1 - I - 0x006D7E 01:74FE: C9 04     CMP #$04
    BEQ     bra_7507             ; BEQ  ; orig: - D 1 - I - 0x006D80 01:7500: F0 05     BEQ bra_7507
    MOVE.B  #$0A,D0  ; orig: - D 1 - I - 0x006D82 01:7502: A9 0A     LDA #$0A
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x006D84 01:7504: 85 34     STA ram_timer_obj + 
bra_7506_RTS:  ; orig: bra_7506_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006D86 01:7506: 60        RTS
bra_7507:  ; orig: bra_7507:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006D87 01:7507: A9 00     LDA #$00
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006D89 01:7509: 60        RTS



tbl_750A_spr_data:  ; orig: tbl_750A_spr_data:

; pos y, tile, attr, pos X
    ; [DIRECTIVE] .BYTE $3D, $1C, $20, $00  -- needs manual handling  ; orig: - D 1 - I - 0x006D8A 01:750A: 3D        .byte $3D, $1C, $20,
    ; [DIRECTIVE] .BYTE $DD, $1C, $20, $00  -- needs manual handling  ; orig: - D 1 - I - 0x006D8E 01:750E: DD        .byte $DD, $1C, $20,



sub_bat_7512:  ; orig: sub_bat_7512:
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x006D92 01:7512: A0 00     LDY #$00
    MOVE.B  #$00,D1  ; orig: - D 1 - I - 0x006D94 01:7514: A2 00     LDX #$00
bra_7516_loop:  ; orig: bra_7516_loop:
    MOVE.B  tbl_750A_spr_data(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x006D96 01:7516: BD 0A 75  LDA tbl_750A_spr_dat
    MOVE.B  D0,ram_oam(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x006D99 01:7519: 99 00 02  STA ram_oam,Y
    ADDQ.B  #1,D1           ; INX  ; orig: - D 1 - I - 0x006D9C 01:751C: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: - D 1 - I - 0x006D9D 01:751D: 8A        TXA
    ANDI.B  #$07,D0  ; orig: - D 1 - I - 0x006D9E 01:751E: 29 07     AND #$07    ; fill 1
    MOVE.B  D0,D1           ; TAX  ; orig: - D 1 - I - 0x006DA0 01:7520: AA        TAX
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x006DA1 01:7521: C8        INY
    CMPI.B  #$40,D2  ; orig: - D 1 - I - 0x006DA2 01:7522: C0 40     CPY #$40
    BNE     bra_7516_loop             ; BNE  ; orig: - D 1 - I - 0x006DA4 01:7524: D0 F0     BNE bra_7516_loop
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006DA6 01:7526: 60        RTS



tbl_7527_forest_maze:  ; orig: tbl_7527_forest_maze:
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006DA7 01:7527: 08        .byte con_dir_Up    
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - I - 0x006DA8 01:7528: 02        .byte con_dir_Left  
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 1 - I - 0x006DA9 01:7529: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - I - 0x006DAA 01:752A: 02        .byte con_dir_Left  



tbl_752B_mountain_ladder:
; bzk optimize, same bytes
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006DAB 01:752B: 08        .byte con_dir_Up   ;
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006DAC 01:752C: 08        .byte con_dir_Up   ;
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006DAD 01:752D: 08        .byte con_dir_Up   ;
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - I - 0x006DAE 01:752E: 08        .byte con_dir_Up   ;



sub_bat_752F_check_overworld_secret_correct_path:  ; orig: sub_bat_752F_check_overworld_secret_correct_path:
    MOVE.B  ram_correct_path_cnt,D1  ; orig: - D 1 - I - 0x006DAF 01:752F: AE 2F 05  LDX ram_correct_path
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x006DB2 01:7532: A5 98     LDA ram_dir_link
    MOVE.B  ram_map_location,D2  ; orig: - D 1 - I - 0x006DB4 01:7534: A4 EB     LDY ram_map_location
    CMPI.B  #con_map_location + $61,D2  ; orig: - D 1 - I - 0x006DB6 01:7536: C0 61     CPY #con_map_locatio
    BNE     bra_7558_not_forest_maze             ; BNE  ; orig: - D 1 - I - 0x006DB8 01:7538: D0 1E     BNE bra_7558_not_for
    CMP.B   tbl_7527_forest_maze(D1.L),D0  ; orig: - D 1 - I - 0x006DBA 01:753A: DD 27 75  CMP tbl_7527_forest_
    BNE     bra_754F_incorrect_path             ; BNE  ; orig: - D 1 - I - 0x006DBD 01:753D: D0 10     BNE bra_754F_incorre
    CMPI.B  #$03,D1  ; orig: - D 1 - I - 0x006DBF 01:753F: E0 03     CPX #$03
    BEQ     bra_756A_path_is_complete             ; BEQ  ; orig: - D 1 - I - 0x006DC1 01:7541: F0 27     BEQ bra_756A_path_is
bra_7543_still_not_enough:  ; orig: bra_7543_still_not_enough:
    ADDQ.B  #1,ram_correct_path_cnt  ; orig: - D 1 - I - 0x006DC3 01:7543: EE 2F 05  INC ram_correct_path
bra_7546_exit:  ; orig: bra_7546_exit:
    MOVE.B  D2,ram_next_map_location  ; orig: - D 1 - I - 0x006DC6 01:7546: 84 EC     STY ram_next_map_loc
bra_7548_RTS:  ; orig: bra_7548_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006DC8 01:7548: 60        RTS



sub_7549_clear_path_counter:  ; orig: sub_7549_clear_path_counter:
bra_7549_not_mountain_ladder:  ; orig: bra_7549_not_mountain_ladder:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x006DC9 01:7549: A9 00     LDA #$00
    MOVE.B  D0,ram_correct_path_cnt  ; orig: - D 1 - I - 0x006DCB 01:754B: 8D 2F 05  STA ram_correct_path
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006DCE 01:754E: 60        RTS
bra_754F_incorrect_path:  ; orig: bra_754F_incorrect_path:
    CMPI.B  #con_dir_Right,D0  ; orig: - D 1 - I - 0x006DCF 01:754F: C9 01     CMP #con_dir_Right
    BEQ     bra_7548_RTS             ; BEQ  ; orig: - D 1 - I - 0x006DD1 01:7551: F0 F5     BEQ bra_7548_RTS
bra_7553:  ; orig: bra_7553:
    BSR     sub_7549_clear_path_counter             ; JSR -> BSR  ; orig: - D 1 - I - 0x006DD3 01:7553: 20 49 75  JSR sub_7549_clear_p
    BEQ     bra_7546_exit             ; BEQ  ; orig: - D 1 - I - 0x006DD6 01:7556: F0 EE     BEQ bra_7546_exit   
bra_7558_not_forest_maze:  ; orig: bra_7558_not_forest_maze:
    CMPI.B  #$1B,D2  ; orig: - D 1 - I - 0x006DD8 01:7558: C0 1B     CPY #$1B
    BNE     bra_7549_not_mountain_ladder             ; BNE  ; orig: - D 1 - I - 0x006DDA 01:755A: D0 ED     BNE bra_7549_not_mou
    CMP.B   tbl_752B_mountain_ladder(D1.L),D0  ; orig: - D 1 - I - 0x006DDC 01:755C: DD 2B 75  CMP tbl_752B_mountai
    BEQ     bra_7566_correct_path             ; BEQ  ; orig: - D 1 - I - 0x006DDF 01:755F: F0 05     BEQ bra_7566_correct
    CMPI.B  #con_dir_Left,D0  ; orig: - D 1 - I - 0x006DE1 01:7561: C9 02     CMP #con_dir_Left
    BNE     bra_7553             ; BNE  ; orig: - D 1 - I - 0x006DE3 01:7563: D0 EE     BNE bra_7553
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006DE5 01:7565: 60        RTS
bra_7566_correct_path:  ; orig: bra_7566_correct_path:
    CMPI.B  #$03,D1  ; orig: - D 1 - I - 0x006DE6 01:7566: E0 03     CPX #$03
    BNE     bra_7543_still_not_enough             ; BNE  ; orig: - D 1 - I - 0x006DE8 01:7568: D0 D9     BNE bra_7543_still_n
bra_756A_path_is_complete:  ; orig: bra_756A_path_is_complete:
    MOVE.B  #con_sfx_2_secret_found,D0  ; orig: - D 1 - I - 0x006DEA 01:756A: A9 04     LDA #con_sfx_2_secre
    MOVE.B  D0,ram_sfx_2  ; orig: - D 1 - I - 0x006DEC 01:756C: 8D 02 06  STA ram_sfx_2
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006DEF 01:756F: 60        RTS



sub_bat_7570:  ; orig: sub_bat_7570:

; in

; ram_0002_t18_pos_Y

; ram_0003_t07_pos_X

; out

; ram_0000_t6D

; ram_0001_t16
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x006DF0 01:7570: A9 08     LDA #$08
    MOVE.B  D0,ram_0000_t6D  ; orig: - D 1 - I - 0x006DF2 01:7572: 85 00     STA ram_0000_t6D
    MOVE.B  ram_0002_t18_pos_Y,D0  ; orig: - D 1 - I - 0x006DF4 01:7574: A5 02     LDA ram_0002_t18_pos

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006DF6 01:7576: 0A        ASL
    ROXL.B  #1,ram_0000_t6D  ; orig: - D 1 - I - 0x006DF7 01:7577: 26 00     ROL ram_0000_t6D
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x006DF9 01:7579: 0A        ASL
    ROXL.B  #1,ram_0000_t6D  ; orig: - D 1 - I - 0x006DFA 01:757A: 26 00     ROL ram_0000_t6D
    ANDI.B  #$E0,D0  ; orig: - D 1 - I - 0x006DFC 01:757C: 29 E0     AND #$E0
    MOVE.B  D0,ram_0001_t16  ; orig: - D 1 - I - 0x006DFE 01:757E: 85 01     STA ram_0001_t16
    MOVE.B  ram_0003_t07_pos_X,D0  ; orig: - D 1 - I - 0x006E00 01:7580: A5 03     LDA ram_0003_t07_pos

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006E02 01:7582: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006E03 01:7583: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x006E04 01:7584: 4A        LSR
    OR.B    ram_0001_t16,D0  ; orig: - D 1 - I - 0x006E05 01:7585: 05 01     ORA ram_0001_t16
    MOVE.B  D0,ram_0001_t16  ; orig: - D 1 - I - 0x006E07 01:7587: 85 01     STA ram_0001_t16
    RTS                     ; RTS  ; orig: - D 1 - I - 0x006E09 01:7589: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x006E0A 01:758A: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x006E12 01:7592: FF        .byte $FF, $FF   ;



tbl_7594:  ; orig: tbl_7594:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006E14 01:7594: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006E15 01:7595: 08        .byte $08   ; 01
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E16 01:7596: 0B        .byte $0B   ; 02
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - I - 0x006E17 01:7597: 0F        .byte $0F   ; 03
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 1 - I - 0x006E18 01:7598: 13        .byte $13   ; 04
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - I - 0x006E19 01:7599: 17        .byte $17   ; 05
    ; [DIRECTIVE] .BYTE $5C  -- needs manual handling  ; orig: - D 1 - I - 0x006E1A 01:759A: 5C        .byte $5C   ; 06
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 1 - I - 0x006E1B 01:759B: 60        .byte $60   ; 07
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 1 - I - 0x006E1C 01:759C: 1B        .byte $1B   ; 08
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 1 - I - 0x006E1D 01:759D: 1B        .byte $1B   ; 09
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - I - 0x006E1E 01:759E: 21        .byte $21   ; 0A
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - I - 0x006E1F 01:759F: 21        .byte $21   ; 0B
    ; [DIRECTIVE] .BYTE $64  -- needs manual handling  ; orig: - D 1 - I - 0x006E20 01:75A0: 64        .byte $64   ; 0C
    ; [DIRECTIVE] .BYTE $6A  -- needs manual handling  ; orig: - D 1 - I - 0x006E21 01:75A1: 6A        .byte $6A   ; 0D
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 1 - I - 0x006E22 01:75A2: 27        .byte $27   ; 0E
    ; [DIRECTIVE] .BYTE $29  -- needs manual handling  ; orig: - D 1 - I - 0x006E23 01:75A3: 29        .byte $29   ; 0F
    ; [DIRECTIVE] .BYTE $2B  -- needs manual handling  ; orig: - D 1 - I - 0x006E24 01:75A4: 2B        .byte $2B   ; 10
    ; [DIRECTIVE] .BYTE $35  -- needs manual handling  ; orig: - D 1 - I - 0x006E25 01:75A5: 35        .byte $35   ; 11
    ; [DIRECTIVE] .BYTE $3F  -- needs manual handling  ; orig: - D 1 - I - 0x006E26 01:75A6: 3F        .byte $3F   ; 12
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - I - 0x006E27 01:75A7: 70        .byte $70   ; 13
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - I - 0x006E28 01:75A8: 74        .byte $74   ; 14
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - I - 0x006E29 01:75A9: 76        .byte $76   ; 15
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - I - 0x006E2A 01:75AA: 76        .byte $76   ; 16
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x006E2B 01:75AB: 78        .byte $78   ; 17
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - I - 0x006E2C 01:75AC: 7A        .byte $7A   ; 18
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - I - 0x006E2D 01:75AD: 7E        .byte $7E   ; 19
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x006E2E 01:75AE: 80        .byte $80   ; 1A
    ; [DIRECTIVE] .BYTE $49  -- needs manual handling  ; orig: - D 1 - I - 0x006E2F 01:75AF: 49        .byte $49   ; 1B
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x006E30 01:75B0: 82        .byte $82   ; 1C
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - I - 0x006E31 01:75B1: 84        .byte $84   ; 1D
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 1 - I - 0x006E32 01:75B2: 86        .byte $86   ; 1E
    ; [DIRECTIVE] .BYTE $4B  -- needs manual handling  ; orig: - D 1 - I - 0x006E33 01:75B3: 4B        .byte $4B   ; 1F
    ; [DIRECTIVE] .BYTE $4F  -- needs manual handling  ; orig: - D 1 - I - 0x006E34 01:75B4: 4F        .byte $4F   ; 20
    ; [DIRECTIVE] .BYTE $4F  -- needs manual handling  ; orig: - D 1 - I - 0x006E35 01:75B5: 4F        .byte $4F   ; 21
    ; [DIRECTIVE] .BYTE $51  -- needs manual handling  ; orig: - D 1 - I - 0x006E36 01:75B6: 51        .byte $51   ; 22
    ; [DIRECTIVE] .BYTE $51  -- needs manual handling  ; orig: - D 1 - I - 0x006E37 01:75B7: 51        .byte $51   ; 23
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 1 - I - 0x006E38 01:75B8: 88        .byte $88   ; 24
    ; [DIRECTIVE] .BYTE $8C  -- needs manual handling  ; orig: - D 1 - I - 0x006E39 01:75B9: 8C        .byte $8C   ; 25
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - I - 0x006E3A 01:75BA: 90        .byte $90   ; 26
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - I - 0x006E3B 01:75BB: 90        .byte $90   ; 27
    ; [DIRECTIVE] .BYTE $92  -- needs manual handling  ; orig: - D 1 - I - 0x006E3C 01:75BC: 92        .byte $92   ; 28
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - I - 0x006E3D 01:75BD: 94        .byte $94   ; 29
    ; [DIRECTIVE] .BYTE $96  -- needs manual handling  ; orig: - D 1 - I - 0x006E3E 01:75BE: 96        .byte $96   ; 2A
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - I - 0x006E3F 01:75BF: 98        .byte $98   ; 2B
    ; [DIRECTIVE] .BYTE $99  -- needs manual handling  ; orig: - D 1 - I - 0x006E40 01:75C0: 99        .byte $99   ; 2C
    ; [DIRECTIVE] .BYTE $99  -- needs manual handling  ; orig: - D 1 - I - 0x006E41 01:75C1: 99        .byte $99   ; 2D
    ; [DIRECTIVE] .BYTE $99  -- needs manual handling  ; orig: - D 1 - I - 0x006E42 01:75C2: 99        .byte $99   ; 2E
    ; [DIRECTIVE] .BYTE $53  -- needs manual handling  ; orig: - D 1 - I - 0x006E43 01:75C3: 53        .byte $53   ; 2F
    ; [DIRECTIVE] .BYTE $54  -- needs manual handling  ; orig: - D 1 - I - 0x006E44 01:75C4: 54        .byte $54   ; 30
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x006E45 01:75C5: 9A        .byte $9A   ; 31
    ; [DIRECTIVE] .BYTE $9B  -- needs manual handling  ; orig: - D 1 - I - 0x006E46 01:75C6: 9B        .byte $9B   ; 32
    ; [DIRECTIVE] .BYTE $9B  -- needs manual handling  ; orig: - D 1 - I - 0x006E47 01:75C7: 9B        .byte $9B   ; 33
    ; [DIRECTIVE] .BYTE $A5  -- needs manual handling  ; orig: - D 1 - I - 0x006E48 01:75C8: A5        .byte $A5   ; 34
    ; [DIRECTIVE] .BYTE $A5  -- needs manual handling  ; orig: - D 1 - I - 0x006E49 01:75C9: A5        .byte $A5   ; 35
    ; [DIRECTIVE] .BYTE $AB  -- needs manual handling  ; orig: - D 1 - I - 0x006E4A 01:75CA: AB        .byte $AB   ; 36
    ; [DIRECTIVE] .BYTE $AB  -- needs manual handling  ; orig: - D 1 - I - 0x006E4B 01:75CB: AB        .byte $AB   ; 37
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006E4C 01:75CC: AC        .byte $AC   ; 38
    ; [DIRECTIVE] .BYTE $AE  -- needs manual handling  ; orig: - D 1 - I - 0x006E4D 01:75CD: AE        .byte $AE   ; 39
    ; [DIRECTIVE] .BYTE $AE  -- needs manual handling  ; orig: - D 1 - I - 0x006E4E 01:75CE: AE        .byte $AE   ; 3A
    ; [DIRECTIVE] .BYTE $AF  -- needs manual handling  ; orig: - D 1 - I - 0x006E4F 01:75CF: AF        .byte $AF   ; 3B
    ; [DIRECTIVE] .BYTE $AF  -- needs manual handling  ; orig: - D 1 - I - 0x006E50 01:75D0: AF        .byte $AF   ; 3C
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006E51 01:75D1: B2        .byte $B2   ; 3D
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006E52 01:75D2: B8        .byte $B8   ; 3E
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006E53 01:75D3: B8        .byte $B8   ; 3F
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006E54 01:75D4: 08        .byte $08   ; 40
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006E55 01:75D5: 08        .byte $08   ; 41
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E56 01:75D6: C6        .byte $C6   ; 42
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E57 01:75D7: C6        .byte $C6   ; 43
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E58 01:75D8: C6        .byte $C6   ; 44
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E59 01:75D9: C6        .byte $C6   ; 45
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E5A 01:75DA: C6        .byte $C6   ; 46
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006E5B 01:75DB: C6        .byte $C6   ; 47
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - I - 0x006E5C 01:75DC: C8        .byte $C8   ; 48
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - I - 0x006E5D 01:75DD: C8        .byte $C8   ; 49
    ; [DIRECTIVE] .BYTE $C9  -- needs manual handling  ; orig: - D 1 - I - 0x006E5E 01:75DE: C9        .byte $C9   ; 4A
    ; [DIRECTIVE] .BYTE $C9  -- needs manual handling  ; orig: - D 1 - I - 0x006E5F 01:75DF: C9        .byte $C9   ; 4B
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E60 01:75E0: CA        .byte $CA   ; 4C
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E61 01:75E1: CA        .byte $CA   ; 4D
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E62 01:75E2: CA        .byte $CA   ; 4E
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E63 01:75E3: CA        .byte $CA   ; 4F
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E64 01:75E4: CA        .byte $CA   ; 50
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E65 01:75E5: CA        .byte $CA   ; 51
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E66 01:75E6: CA        .byte $CA   ; 52
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006E67 01:75E7: CA        .byte $CA   ; 53
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - I - 0x006E68 01:75E8: 09        .byte $09   ; 54
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - I - 0x006E69 01:75E9: 09        .byte $09   ; 55
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - I - 0x006E6A 01:75EA: 0A        .byte $0A   ; 56
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - I - 0x006E6B 01:75EB: 0A        .byte $0A   ; 57
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E6C 01:75EC: 0B        .byte $0B   ; 58
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E6D 01:75ED: 0B        .byte $0B   ; 59
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E6E 01:75EE: 0B        .byte $0B   ; 5A
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E6F 01:75EF: 0B        .byte $0B   ; 5B
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E70 01:75F0: 0B        .byte $0B   ; 5C
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x006E71 01:75F1: 0B        .byte $0B   ; 5D
    ; [DIRECTIVE] .BYTE $CB  -- needs manual handling  ; orig: - D 1 - I - 0x006E72 01:75F2: CB        .byte $CB   ; 5E
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E73 01:75F3: 55        .byte $55   ; 5F
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E74 01:75F4: 55        .byte $55   ; 60
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E75 01:75F5: 55        .byte $55   ; 61
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E76 01:75F6: 55        .byte $55   ; 62
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E77 01:75F7: 55        .byte $55   ; 63
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E78 01:75F8: 55        .byte $55   ; 64
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - I - 0x006E79 01:75F9: 55        .byte $55   ; 65
    ; [DIRECTIVE] .BYTE $56  -- needs manual handling  ; orig: - D 1 - I - 0x006E7A 01:75FA: 56        .byte $56   ; 66
    ; [DIRECTIVE] .BYTE $57  -- needs manual handling  ; orig: - D 1 - I - 0x006E7B 01:75FB: 57        .byte $57   ; 67
    ; [DIRECTIVE] .BYTE $57  -- needs manual handling  ; orig: - D 1 - I - 0x006E7C 01:75FC: 57        .byte $57   ; 68
    ; [DIRECTIVE] .BYTE $CB  -- needs manual handling  ; orig: - D 1 - I - 0x006E7D 01:75FD: CB        .byte $CB   ; 69
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - I - 0x006E7E 01:75FE: CC        .byte $CC   ; 6A
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E7F 01:75FF: 58        .byte $58   ; 6B
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E80 01:7600: 58        .byte $58   ; 6C
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E81 01:7601: 58        .byte $58   ; 6D
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E82 01:7602: 58        .byte $58   ; 6E
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E83 01:7603: 58        .byte $58   ; 6F
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E84 01:7604: 58        .byte $58   ; 70
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E85 01:7605: 58        .byte $58   ; 71
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E86 01:7606: 58        .byte $58   ; 72
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 1 - I - 0x006E87 01:7607: 58        .byte $58   ; 73
    ; [DIRECTIVE] .BYTE $59  -- needs manual handling  ; orig: - D 1 - I - 0x006E88 01:7608: 59        .byte $59   ; 74
    ; [DIRECTIVE] .BYTE $59  -- needs manual handling  ; orig: - D 1 - I - 0x006E89 01:7609: 59        .byte $59   ; 75
    ; [DIRECTIVE] .BYTE $59  -- needs manual handling  ; orig: - D 1 - I - 0x006E8A 01:760A: 59        .byte $59   ; 76
    ; [DIRECTIVE] .BYTE $59  -- needs manual handling  ; orig: - D 1 - I - 0x006E8B 01:760B: 59        .byte $59   ; 77
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - I - 0x006E8C 01:760C: 5A        .byte $5A   ; 78
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - I - 0x006E8D 01:760D: 5A        .byte $5A   ; 79
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - I - 0x006E8E 01:760E: 5A        .byte $5A   ; 7A
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - I - 0x006E8F 01:760F: 5A        .byte $5A   ; 7B
    ; [DIRECTIVE] .BYTE $5B  -- needs manual handling  ; orig: - D 1 - I - 0x006E90 01:7610: 5B        .byte $5B   ; 7C
    ; [DIRECTIVE] .BYTE $5B  -- needs manual handling  ; orig: - D 1 - I - 0x006E91 01:7611: 5B        .byte $5B   ; 7D
    ; [DIRECTIVE] .BYTE $5B  -- needs manual handling  ; orig: - D 1 - I - 0x006E92 01:7612: 5B        .byte $5B   ; 7E



tbl_7613:  ; orig: tbl_7613:

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006E93 01:7613: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - I - 0x006E94 01:7614: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - I - 0x006E95 01:7615: 08        .byte $08   ; 02
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - I - 0x006E96 01:7616: 0C        .byte $0C   ; 03
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - I - 0x006E97 01:7617: 10        .byte $10   ; 04
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - I - 0x006E98 01:7618: 10        .byte $10   ; 05
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - I - 0x006E99 01:7619: 14        .byte $14   ; 06
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - I - 0x006E9A 01:761A: 18        .byte $18   ; 07

;
    ; [DIRECTIVE] .BYTE $5C  -- needs manual handling  ; orig: - D 1 - I - 0x006E9B 01:761B: 5C        .byte $5C   ; 08

;
    ; [DIRECTIVE] .BYTE $9E  -- needs manual handling  ; orig: - D 1 - I - 0x006E9C 01:761C: 9E        .byte $9E   ; 09

;
    ; [DIRECTIVE] .BYTE $44  -- needs manual handling  ; orig: - D 1 - I - 0x006E9D 01:761D: 44        .byte $44   ; 0A

;
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 1 - I - 0x006E9E 01:761E: CE        .byte $CE   ; 0B
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 1 - I - 0x006E9F 01:761F: D2        .byte $D2   ; 0C
    ; [DIRECTIVE] .BYTE $D6  -- needs manual handling  ; orig: - D 1 - I - 0x006EA0 01:7620: D6        .byte $D6   ; 0D
    ; [DIRECTIVE] .BYTE $DA  -- needs manual handling  ; orig: - D 1 - I - 0x006EA1 01:7621: DA        .byte $DA   ; 0E
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 1 - I - 0x006EA2 01:7622: CE        .byte $CE   ; 0F
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 1 - I - 0x006EA3 01:7623: D2        .byte $D2   ; 10
    ; [DIRECTIVE] .BYTE $D6  -- needs manual handling  ; orig: - D 1 - I - 0x006EA4 01:7624: D6        .byte $D6   ; 11
    ; [DIRECTIVE] .BYTE $DA  -- needs manual handling  ; orig: - D 1 - I - 0x006EA5 01:7625: DA        .byte $DA   ; 12

;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x006EA6 01:7626: F0        .byte $F0   ; 13
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - I - 0x006EA7 01:7627: F4        .byte $F4   ; 14
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006EA8 01:7628: F8        .byte $F8   ; 15
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x006EA9 01:7629: FC        .byte $FC   ; 16

;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x006EAA 01:762A: F0        .byte $F0   ; 17
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - I - 0x006EAB 01:762B: F4        .byte $F4   ; 18
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006EAC 01:762C: F8        .byte $F8   ; 19
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x006EAD 01:762D: FC        .byte $FC   ; 1A

;
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EAE 01:762E: B4        .byte $B4   ; 1B
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EAF 01:762F: B0        .byte $B0   ; 1C
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EB0 01:7630: B0        .byte $B0   ; 1D
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EB1 01:7631: B8        .byte $B8   ; 1E
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006EB2 01:7632: B2        .byte $B2   ; 1F
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006EB3 01:7633: B2        .byte $B2   ; 20

;
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EB4 01:7634: B4        .byte $B4   ; 21
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EB5 01:7635: B0        .byte $B0   ; 22
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EB6 01:7636: B0        .byte $B0   ; 23
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EB7 01:7637: B8        .byte $B8   ; 24
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006EB8 01:7638: B2        .byte $B2   ; 25
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006EB9 01:7639: B2        .byte $B2   ; 26

;
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006EBA 01:763A: CA        .byte $CA   ; 27
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - I - 0x006EBB 01:763B: CC        .byte $CC   ; 28

;
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - I - 0x006EBC 01:763C: CA        .byte $CA   ; 29
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - I - 0x006EBD 01:763D: CC        .byte $CC   ; 2A

;
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EBE 01:763E: BC        .byte $BC   ; 2B
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006EBF 01:763F: BE        .byte $BE   ; 2C
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006EC0 01:7640: C0        .byte $C0   ; 2D
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006EC1 01:7641: C0        .byte $C0   ; 2E
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 1 - I - 0x006EC2 01:7642: C2        .byte $C2   ; 2F
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - I - 0x006EC3 01:7643: C4        .byte $C4   ; 30
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006EC4 01:7644: C0        .byte $C0   ; 31
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006EC5 01:7645: C0        .byte $C0   ; 32
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EC6 01:7646: BC        .byte $BC   ; 33
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006EC7 01:7647: BE        .byte $BE   ; 34

;
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EC8 01:7648: BC        .byte $BC   ; 35
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006EC9 01:7649: BE        .byte $BE   ; 36
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006ECA 01:764A: C0        .byte $C0   ; 37
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006ECB 01:764B: C0        .byte $C0   ; 38
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 1 - I - 0x006ECC 01:764C: C2        .byte $C2   ; 39
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - I - 0x006ECD 01:764D: C4        .byte $C4   ; 3A
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006ECE 01:764E: C0        .byte $C0   ; 3B
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006ECF 01:764F: C0        .byte $C0   ; 3C
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006ED0 01:7650: BC        .byte $BC   ; 3D
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006ED1 01:7651: BE        .byte $BE   ; 3E

;
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006ED2 01:7652: BC        .byte $BC   ; 3F
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006ED3 01:7653: BE        .byte $BE   ; 40
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006ED4 01:7654: EC        .byte $EC   ; 41
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - I - 0x006ED5 01:7655: EE        .byte $EE   ; 42
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006ED6 01:7656: EC        .byte $EC   ; 43
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - I - 0x006ED7 01:7657: EE        .byte $EE   ; 44
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006ED8 01:7658: EC        .byte $EC   ; 45
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - I - 0x006ED9 01:7659: EE        .byte $EE   ; 46
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EDA 01:765A: BC        .byte $BC   ; 47
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006EDB 01:765B: BE        .byte $BE   ; 48

;
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x006EDC 01:765C: C6        .byte $C6   ; 49
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - I - 0x006EDD 01:765D: C8        .byte $C8   ; 4A

;
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x006EDE 01:765E: A0        .byte $A0   ; 4B
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x006EDF 01:765F: A8        .byte $A8   ; 4C
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006EE0 01:7660: A4        .byte $A4   ; 4D
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006EE1 01:7661: AC        .byte $AC   ; 4E

;
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - I - 0x006EE2 01:7662: 90        .byte $90   ; 4F
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - I - 0x006EE3 01:7663: E8        .byte $E8   ; 50

;
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - I - 0x006EE4 01:7664: E4        .byte $E4   ; 51
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x006EE5 01:7665: E0        .byte $E0   ; 52

;
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - I - 0x006EE6 01:7666: 94        .byte $94   ; 53

;
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 1 - I - 0x006EE7 01:7667: F3        .byte $F3   ; 54

;
    ; [DIRECTIVE] .BYTE $C9  -- needs manual handling  ; orig: - D 1 - I - 0x006EE8 01:7668: C9        .byte $C9   ; 55

;
    ; [DIRECTIVE] .BYTE $BD  -- needs manual handling  ; orig: - D 1 - I - 0x006EE9 01:7669: BD        .byte $BD   ; 56

;
    ; [DIRECTIVE] .BYTE $C1  -- needs manual handling  ; orig: - D 1 - I - 0x006EEA 01:766A: C1        .byte $C1   ; 57

;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - I - 0x006EEB 01:766B: 98        .byte $98   ; 58

;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x006EEC 01:766C: 9A        .byte $9A   ; 59

;
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x006EED 01:766D: 9C        .byte $9C   ; 5A

;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006EEE 01:766E: F8        .byte $F8   ; 5B

;
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EEF 01:766F: B8        .byte $B8   ; 5C
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EF0 01:7670: BC        .byte $BC   ; 5D
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EF1 01:7671: B0        .byte $B0   ; 5E
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EF2 01:7672: B4        .byte $B4   ; 5F

;
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EF3 01:7673: B8        .byte $B8   ; 60
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EF4 01:7674: BC        .byte $BC   ; 61
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EF5 01:7675: B0        .byte $B0   ; 62
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EF6 01:7676: B4        .byte $B4   ; 63

;
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EF7 01:7677: B8        .byte $B8   ; 64
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006EF8 01:7678: AC        .byte $AC   ; 65
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EF9 01:7679: B4        .byte $B4   ; 66
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006EFA 01:767A: BC        .byte $BC   ; 67
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006EFB 01:767B: B0        .byte $B0   ; 68
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EFC 01:767C: B4        .byte $B4   ; 69

;
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006EFD 01:767D: B8        .byte $B8   ; 6A
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006EFE 01:767E: AC        .byte $AC   ; 6B
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006EFF 01:767F: B4        .byte $B4   ; 6C
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006F00 01:7680: BC        .byte $BC   ; 6D
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006F01 01:7681: B0        .byte $B0   ; 6E
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006F02 01:7682: B4        .byte $B4   ; 6F

;
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006F03 01:7683: AC        .byte $AC   ; 70
    ; [DIRECTIVE] .BYTE $AE  -- needs manual handling  ; orig: - D 1 - I - 0x006F04 01:7684: AE        .byte $AE   ; 71
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006F05 01:7685: B0        .byte $B0   ; 72
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 1 - I - 0x006F06 01:7686: B2        .byte $B2   ; 73

;
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x006F07 01:7687: A8        .byte $A8   ; 74
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 1 - I - 0x006F08 01:7688: AA        .byte $AA   ; 75

;
    ; [DIRECTIVE] .BYTE $92  -- needs manual handling  ; orig: - D 1 - I - 0x006F09 01:7689: 92        .byte $92   ; 76
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - I - 0x006F0A 01:768A: 94        .byte $94   ; 77

;
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x006F0B 01:768B: A0        .byte $A0   ; 78
    ; [DIRECTIVE] .BYTE $A2  -- needs manual handling  ; orig: - D 1 - I - 0x006F0C 01:768C: A2        .byte $A2   ; 79

;
    ; [DIRECTIVE] .BYTE $A6  -- needs manual handling  ; orig: - D 1 - I - 0x006F0D 01:768D: A6        .byte $A6   ; 7A
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006F0E 01:768E: A4        .byte $A4   ; 7B
    ; [DIRECTIVE] .BYTE $A2  -- needs manual handling  ; orig: - D 1 - I - 0x006F0F 01:768F: A2        .byte $A2   ; 7C
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006F10 01:7690: A4        .byte $A4   ; 7D

;
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - I - 0x006F11 01:7691: D8        .byte $D8   ; 7E
    ; [DIRECTIVE] .BYTE $DA  -- needs manual handling  ; orig: - D 1 - I - 0x006F12 01:7692: DA        .byte $DA   ; 7F

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F13 01:7693: 00        .byte $00   ; 80
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F14 01:7694: 00        .byte $00   ; 81

;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x006F15 01:7695: 9A        .byte $9A   ; 82
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x006F16 01:7696: 9C        .byte $9C   ; 83

;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x006F17 01:7697: 9A        .byte $9A   ; 84
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x006F18 01:7698: 9C        .byte $9C   ; 85

;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x006F19 01:7699: 9A        .byte $9A   ; 86
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x006F1A 01:769A: 9C        .byte $9C   ; 87

;
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006F1B 01:769B: B4        .byte $B4   ; 88
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006F1C 01:769C: B8        .byte $B8   ; 89
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006F1D 01:769D: BC        .byte $BC   ; 8A
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006F1E 01:769E: BE        .byte $BE   ; 8B

;
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x006F1F 01:769F: B4        .byte $B4   ; 8C
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x006F20 01:76A0: B8        .byte $B8   ; 8D
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x006F21 01:76A1: BC        .byte $BC   ; 8E
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 1 - I - 0x006F22 01:76A2: BE        .byte $BE   ; 8F

;
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x006F23 01:76A3: FC        .byte $FC   ; 90
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 1 - I - 0x006F24 01:76A4: FE        .byte $FE   ; 91

;
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x006F25 01:76A5: AC        .byte $AC   ; 92
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x006F26 01:76A6: 9C        .byte $9C   ; 93

;
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x006F27 01:76A7: A0        .byte $A0   ; 94
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006F28 01:76A8: A4        .byte $A4   ; 95

;
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x006F29 01:76A9: A0        .byte $A0   ; 96
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006F2A 01:76AA: A4        .byte $A4   ; 97

;
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x006F2B 01:76AB: A8        .byte $A8   ; 98

;
    ; [DIRECTIVE] .BYTE $8E  -- needs manual handling  ; orig: - D 1 - I - 0x006F2C 01:76AC: 8E        .byte $8E   ; 99

;
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x006F2D 01:76AD: A4        .byte $A4   ; 9A

;
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x006F2E 01:76AE: DC        .byte $DC   ; 9B
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x006F2F 01:76AF: E0        .byte $E0   ; 9C
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - I - 0x006F30 01:76B0: E4        .byte $E4   ; 9D
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - I - 0x006F31 01:76B1: E8        .byte $E8   ; 9E
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006F32 01:76B2: EC        .byte $EC   ; 9F
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x006F33 01:76B3: F0        .byte $F0   ; A0
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - I - 0x006F34 01:76B4: F4        .byte $F4   ; A1
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006F35 01:76B5: F8        .byte $F8   ; A2
    ; [DIRECTIVE] .BYTE $FA  -- needs manual handling  ; orig: - D 1 - I - 0x006F36 01:76B6: FA        .byte $FA   ; A3
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 1 - I - 0x006F37 01:76B7: FE        .byte $FE   ; A4

;
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - I - 0x006F38 01:76B8: F4        .byte $F4   ; A5
    ; [DIRECTIVE] .BYTE $F6  -- needs manual handling  ; orig: - D 1 - I - 0x006F39 01:76B9: F6        .byte $F6   ; A6
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 1 - I - 0x006F3A 01:76BA: FE        .byte $FE   ; A7
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x006F3B 01:76BB: FC        .byte $FC   ; A8
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x006F3C 01:76BC: F0        .byte $F0   ; A9
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006F3D 01:76BD: F8        .byte $F8   ; AA

;
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x006F3E 01:76BE: B0        .byte $B0   ; AB

;
    ; [DIRECTIVE] .BYTE $F6  -- needs manual handling  ; orig: - D 1 - I - 0x006F3F 01:76BF: F6        .byte $F6   ; AC
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x006F40 01:76C0: F0        .byte $F0   ; AD

;
    ; [DIRECTIVE] .BYTE $D4  -- needs manual handling  ; orig: - D 1 - I - 0x006F41 01:76C1: D4        .byte $D4   ; AE

;
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x006F42 01:76C2: FC        .byte $FC   ; AF
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 1 - I - 0x006F43 01:76C3: FE        .byte $FE   ; B0
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006F44 01:76C4: F8        .byte $F8   ; B1

;
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - I - 0x006F45 01:76C5: E8        .byte $E8   ; B2
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 1 - I - 0x006F46 01:76C6: EA        .byte $EA   ; B3
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x006F47 01:76C7: E0        .byte $E0   ; B4
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - I - 0x006F48 01:76C8: E4        .byte $E4   ; B5
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006F49 01:76C9: EC        .byte $EC   ; B6
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x006F4A 01:76CA: EC        .byte $EC   ; B7

;
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - I - 0x006F4B 01:76CB: D0        .byte $D0   ; B8
    ; [DIRECTIVE] .BYTE $D4  -- needs manual handling  ; orig: - D 1 - I - 0x006F4C 01:76CC: D4        .byte $D4   ; B9
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - I - 0x006F4D 01:76CD: D8        .byte $D8   ; BA
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x006F4E 01:76CE: DC        .byte $DC   ; BB
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x006F4F 01:76CF: E0        .byte $E0   ; BC
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - I - 0x006F50 01:76D0: E4        .byte $E4   ; BD
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x006F51 01:76D1: C0        .byte $C0   ; BE
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - I - 0x006F52 01:76D2: C8        .byte $C8   ; BF
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - I - 0x006F53 01:76D3: C4        .byte $C4   ; C0
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - I - 0x006F54 01:76D4: CC        .byte $CC   ; C1
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - I - 0x006F55 01:76D5: E8        .byte $E8   ; C2
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 1 - I - 0x006F56 01:76D6: EA        .byte $EA   ; C3
    ; [DIRECTIVE] .BYTE $72  -- needs manual handling  ; orig: - D 1 - I - 0x006F57 01:76D7: 72        .byte $72   ; C4
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - I - 0x006F58 01:76D8: 74        .byte $74   ; C5

;
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x006F59 01:76D9: DE        .byte $DE   ; C6
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - I - 0x006F5A 01:76DA: EE        .byte $EE   ; C7

;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x006F5B 01:76DB: F8        .byte $F8   ; C8

;
    ; [DIRECTIVE] .BYTE $96  -- needs manual handling  ; orig: - D 1 - I - 0x006F5C 01:76DC: 96        .byte $96   ; C9

;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - I - 0x006F5D 01:76DD: 98        .byte $98   ; CA

;
    ; [DIRECTIVE] .BYTE $B1  -- needs manual handling  ; orig: - D 1 - I - 0x006F5E 01:76DE: B1        .byte $B1   ; CB



tbl_76DF_spr_A:  ; orig: tbl_76DF_spr_A:

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F5F 01:76DF: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F60 01:76E0: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F61 01:76E1: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F62 01:76E2: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F63 01:76E3: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F64 01:76E4: 00        .byte $00   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F65 01:76E5: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F66 01:76E6: 00        .byte $00   ; 07

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F67 01:76E7: 02        .byte $02   ; 08

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F68 01:76E8: 00        .byte $00   ; 09

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006F69 01:76E9: 00        .byte $00   ; 0A

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F6A 01:76EA: 01        .byte $01   ; 0B
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F6B 01:76EB: 01        .byte $01   ; 0C
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F6C 01:76EC: 01        .byte $01   ; 0D
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F6D 01:76ED: 01        .byte $01   ; 0E
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F6E 01:76EE: 02        .byte $02   ; 0F
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F6F 01:76EF: 02        .byte $02   ; 10
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F70 01:76F0: 02        .byte $02   ; 11
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F71 01:76F1: 02        .byte $02   ; 12

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F72 01:76F2: 03        .byte $03   ; 13
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F73 01:76F3: 03        .byte $03   ; 14
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F74 01:76F4: 03        .byte $03   ; 15
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F75 01:76F5: 03        .byte $03   ; 16

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F76 01:76F6: 02        .byte $02   ; 17
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F77 01:76F7: 02        .byte $02   ; 18
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F78 01:76F8: 02        .byte $02   ; 19
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F79 01:76F9: 02        .byte $02   ; 1A

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F7A 01:76FA: 02        .byte $02   ; 1B
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x006F7B 01:76FB: 82        .byte $82   ; 1C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F7C 01:76FC: 02        .byte $02   ; 1D
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F7D 01:76FD: 02        .byte $02   ; 1E
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x006F7E 01:76FE: 82        .byte $82   ; 1F

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F7F 01:76FF: 02        .byte $02   ; 20
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F80 01:7700: 01        .byte $01   ; 21
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x006F81 01:7701: 81        .byte $81   ; 22
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F82 01:7702: 01        .byte $01   ; 23
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F83 01:7703: 01        .byte $01   ; 24
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x006F84 01:7704: 81        .byte $81   ; 25
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F85 01:7705: 01        .byte $01   ; 26

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F86 01:7706: 01        .byte $01   ; 27
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F87 01:7707: 01        .byte $01   ; 28

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F88 01:7708: 02        .byte $02   ; 29
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F89 01:7709: 02        .byte $02   ; 2A

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F8A 01:770A: 02        .byte $02   ; 2B
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F8B 01:770B: 02        .byte $02   ; 2C
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F8C 01:770C: 01        .byte $01   ; 2D
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F8D 01:770D: 01        .byte $01   ; 2E
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F8E 01:770E: 01        .byte $01   ; 2F
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F8F 01:770F: 01        .byte $01   ; 30
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F90 01:7710: 01        .byte $01   ; 31
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006F91 01:7711: 01        .byte $01   ; 32
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F92 01:7712: 02        .byte $02   ; 33
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F93 01:7713: 02        .byte $02   ; 34

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F94 01:7714: 02        .byte $02   ; 35
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F95 01:7715: 02        .byte $02   ; 36
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F96 01:7716: 02        .byte $02   ; 37
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F97 01:7717: 02        .byte $02   ; 38
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F98 01:7718: 02        .byte $02   ; 39
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F99 01:7719: 02        .byte $02   ; 3A
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F9A 01:771A: 02        .byte $02   ; 3B
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F9B 01:771B: 02        .byte $02   ; 3C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F9C 01:771C: 02        .byte $02   ; 3D
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006F9D 01:771D: 02        .byte $02   ; 3E

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F9E 01:771E: 03        .byte $03   ; 3F
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006F9F 01:771F: 03        .byte $03   ; 40
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA0 01:7720: 03        .byte $03   ; 41
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA1 01:7721: 03        .byte $03   ; 42
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA2 01:7722: 03        .byte $03   ; 43
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA3 01:7723: 03        .byte $03   ; 44
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA4 01:7724: 03        .byte $03   ; 45
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA5 01:7725: 03        .byte $03   ; 46
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA6 01:7726: 03        .byte $03   ; 47
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FA7 01:7727: 03        .byte $03   ; 48

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FA8 01:7728: 02        .byte $02   ; 49
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FA9 01:7729: 02        .byte $02   ; 4A

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAA 01:772A: 02        .byte $02   ; 4B
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAB 01:772B: 02        .byte $02   ; 4C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAC 01:772C: 02        .byte $02   ; 4D
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAD 01:772D: 02        .byte $02   ; 4E

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAE 01:772E: 02        .byte $02   ; 4F
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FAF 01:772F: 02        .byte $02   ; 50

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FB0 01:7730: 01        .byte $01   ; 51
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FB1 01:7731: 01        .byte $01   ; 52

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FB2 01:7732: 01        .byte $01   ; 53

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FB3 01:7733: 02        .byte $02   ; 54

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FB4 01:7734: 03        .byte $03   ; 55

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FB5 01:7735: 03        .byte $03   ; 56

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FB6 01:7736: 03        .byte $03   ; 57

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FB7 01:7737: 02        .byte $02   ; 58

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FB8 01:7738: 02        .byte $02   ; 59

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006FB9 01:7739: 00        .byte $00   ; 5A

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FBA 01:773A: 02        .byte $02   ; 5B

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FBB 01:773B: 01        .byte $01   ; 5C
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FBC 01:773C: 01        .byte $01   ; 5D
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FBD 01:773D: 01        .byte $01   ; 5E
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FBE 01:773E: 01        .byte $01   ; 5F

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FBF 01:773F: 02        .byte $02   ; 60
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC0 01:7740: 02        .byte $02   ; 61
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC1 01:7741: 02        .byte $02   ; 62
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC2 01:7742: 02        .byte $02   ; 63

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC3 01:7743: 02        .byte $02   ; 64
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC4 01:7744: 02        .byte $02   ; 65
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC5 01:7745: 02        .byte $02   ; 66
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC6 01:7746: 02        .byte $02   ; 67
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC7 01:7747: 02        .byte $02   ; 68
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FC8 01:7748: 02        .byte $02   ; 69

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FC9 01:7749: 01        .byte $01   ; 6A
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCA 01:774A: 01        .byte $01   ; 6B
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCB 01:774B: 01        .byte $01   ; 6C
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCC 01:774C: 01        .byte $01   ; 6D
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCD 01:774D: 01        .byte $01   ; 6E
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCE 01:774E: 01        .byte $01   ; 6F

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FCF 01:774F: 01        .byte $01   ; 70
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FD0 01:7750: 01        .byte $01   ; 71
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FD1 01:7751: 01        .byte $01   ; 72
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FD2 01:7752: 01        .byte $01   ; 73

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FD3 01:7753: 03        .byte $03   ; 74
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FD4 01:7754: 03        .byte $03   ; 75

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FD5 01:7755: 03        .byte $03   ; 76
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FD6 01:7756: 03        .byte $03   ; 77

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006FD7 01:7757: 00        .byte $00   ; 78
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x006FD8 01:7758: 00        .byte $00   ; 79

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FD9 01:7759: 02        .byte $02   ; 7A
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FDA 01:775A: 02        .byte $02   ; 7B
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FDB 01:775B: 02        .byte $02   ; 7C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FDC 01:775C: 02        .byte $02   ; 7D

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FDD 01:775D: 03        .byte $03   ; 7E
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FDE 01:775E: 03        .byte $03   ; 7F

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FDF 01:775F: 03        .byte $03   ; 80
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FE0 01:7760: 03        .byte $03   ; 81

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FE1 01:7761: 01        .byte $01   ; 82
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FE2 01:7762: 01        .byte $01   ; 83

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FE3 01:7763: 02        .byte $02   ; 84
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FE4 01:7764: 02        .byte $02   ; 85

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FE5 01:7765: 03        .byte $03   ; 86
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FE6 01:7766: 03        .byte $03   ; 87

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FE7 01:7767: 01        .byte $01   ; 88
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FE8 01:7768: 01        .byte $01   ; 89
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FE9 01:7769: 01        .byte $01   ; 8A
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FEA 01:776A: 01        .byte $01   ; 8B

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FEB 01:776B: 02        .byte $02   ; 8C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FEC 01:776C: 02        .byte $02   ; 8D
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FED 01:776D: 02        .byte $02   ; 8E
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FEE 01:776E: 02        .byte $02   ; 8F

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FEF 01:776F: 01        .byte $01   ; 90
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FF0 01:7770: 01        .byte $01   ; 91

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FF1 01:7771: 01        .byte $01   ; 92
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FF2 01:7772: 01        .byte $01   ; 93

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF3 01:7773: 02        .byte $02   ; 94
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF4 01:7774: 02        .byte $02   ; 95

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF5 01:7775: 02        .byte $02   ; 96
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF6 01:7776: 02        .byte $02   ; 97

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF7 01:7777: 02        .byte $02   ; 98

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x006FF8 01:7778: 02        .byte $02   ; 99

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x006FF9 01:7779: 01        .byte $01   ; 9A

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFA 01:777A: 03        .byte $03   ; 9B
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFB 01:777B: 03        .byte $03   ; 9C
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFC 01:777C: 03        .byte $03   ; 9D
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFD 01:777D: 03        .byte $03   ; 9E
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFE 01:777E: 03        .byte $03   ; 9F
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x006FFF 01:777F: 03        .byte $03   ; A0
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007000 01:7780: 03        .byte $03   ; A1
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007001 01:7781: 03        .byte $03   ; A2
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007002 01:7782: 03        .byte $03   ; A3
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007003 01:7783: 03        .byte $03   ; A4

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007004 01:7784: 01        .byte $01   ; A5
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007005 01:7785: 01        .byte $01   ; A6
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007006 01:7786: 01        .byte $01   ; A7
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007007 01:7787: 01        .byte $01   ; A8
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007008 01:7788: 01        .byte $01   ; A9
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007009 01:7789: 01        .byte $01   ; AA

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x00700A 01:778A: 02        .byte $02   ; AB

;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x00700B 01:778B: 00        .byte $00   ; AC
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x00700C 01:778C: 00        .byte $00   ; AD

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00700D 01:778D: 03        .byte $03   ; AE

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x00700E 01:778E: 01        .byte $01   ; AF
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x00700F 01:778F: 01        .byte $01   ; B0
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007010 01:7790: 01        .byte $01   ; B1

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007011 01:7791: 01        .byte $01   ; B2
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007012 01:7792: 01        .byte $01   ; B3
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007013 01:7793: 01        .byte $01   ; B4
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007014 01:7794: 01        .byte $01   ; B5
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007015 01:7795: 01        .byte $01   ; B6
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007016 01:7796: 01        .byte $01   ; B7

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007017 01:7797: 03        .byte $03   ; B8
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007018 01:7798: 03        .byte $03   ; B9
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007019 01:7799: 03        .byte $03   ; BA
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701A 01:779A: 03        .byte $03   ; BB
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701B 01:779B: 03        .byte $03   ; BC
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701C 01:779C: 03        .byte $03   ; BD
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701D 01:779D: 03        .byte $03   ; BE
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701E 01:779E: 03        .byte $03   ; BF
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00701F 01:779F: 03        .byte $03   ; C0
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007020 01:77A0: 03        .byte $03   ; C1
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007021 01:77A1: 03        .byte $03   ; C2
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007022 01:77A2: 03        .byte $03   ; C3
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007023 01:77A3: 03        .byte $03   ; C4
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007024 01:77A4: 03        .byte $03   ; C5

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x007025 01:77A5: 02        .byte $02   ; C6
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x007026 01:77A6: 02        .byte $02   ; C7

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007027 01:77A7: 01        .byte $01   ; C8

;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - I - 0x007028 01:77A8: 01        .byte $01   ; C9

;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - I - 0x007029 01:77A9: 02        .byte $02   ; CA

;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x00702A 01:77AA: 03        .byte $03   ; CB



tbl_77AB:  ; orig: tbl_77AB:
tbl_bat_77AB:  ; orig: tbl_bat_77AB:

; reading 2 bytes at a time (mostly)
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 1 - I - 0x00702B 01:77AB: 60        .byte $60   ;
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - I - 0x00702C 01:77AC: BC        .byte $BC   ;
    ; [DIRECTIVE] .BYTE $64  -- needs manual handling  ; orig: - D 1 - I - 0x00702D 01:77AD: 64        .byte $64   ;
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - I - 0x00702E 01:77AE: B8        .byte $B8   ;
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - I - 0x00702F 01:77AF: 68        .byte $68   ;
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - I - 0x007030 01:77B0: B4        .byte $B4   ;
    ; [DIRECTIVE] .BYTE $6C  -- needs manual handling  ; orig: - D 1 - I - 0x007031 01:77B1: 6C        .byte $6C   ;
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - I - 0x007032 01:77B2: B0        .byte $B0   ;
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - I - 0x007033 01:77B3: 70        .byte $70   ;
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - I - 0x007034 01:77B4: CC        .byte $CC   ;
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - I - 0x007035 01:77B5: 74        .byte $74   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - I - 0x007036 01:77B6: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x007037 01:77B7: 78        .byte $78   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - I - 0x007038 01:77B8: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $7C  -- needs manual handling  ; orig: - D 1 - I - 0x007039 01:77B9: 7C        .byte $7C   ;
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - I - 0x00703A 01:77BA: C0        .byte $C0   ;
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x00703B 01:77BB: 80        .byte $80   ;
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x00703C 01:77BC: DC        .byte $DC   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - I - 0x00703D 01:77BD: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - I - 0x00703E 01:77BE: D8        .byte $D8   ;
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 1 - I - 0x00703F 01:77BF: 88        .byte $88   ;
    ; [DIRECTIVE] .BYTE $D4  -- needs manual handling  ; orig: - D 1 - I - 0x007040 01:77C0: D4        .byte $D4   ;
    ; [DIRECTIVE] .BYTE $8C  -- needs manual handling  ; orig: - D 1 - I - 0x007041 01:77C1: 8C        .byte $8C   ;
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - I - 0x007042 01:77C2: D0        .byte $D0   ;
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - I - 0x007043 01:77C3: 90        .byte $90   ;
    ; [DIRECTIVE] .BYTE $EC  -- needs manual handling  ; orig: - D 1 - I - 0x007044 01:77C4: EC        .byte $EC   ;
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - I - 0x007045 01:77C5: 94        .byte $94   ;
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - I - 0x007046 01:77C6: E8        .byte $E8   ;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - I - 0x007047 01:77C7: 98        .byte $98   ;
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - I - 0x007048 01:77C8: E4        .byte $E4   ;
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x007049 01:77C9: 9C        .byte $9C   ;
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x00704A 01:77CA: E0        .byte $E0   ;
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x00704B 01:77CB: A0        .byte $A0   ;
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 1 - I - 0x00704C 01:77CC: FC        .byte $FC   ;
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - I - 0x00704D 01:77CD: A4        .byte $A4   ;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 1 - I - 0x00704E 01:77CE: F8        .byte $F8   ;
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x00704F 01:77CF: A8        .byte $A8   ;
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - I - 0x007050 01:77D0: F4        .byte $F4   ;
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x007051 01:77D1: AC        .byte $AC   ;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - I - 0x007052 01:77D2: F0        .byte $F0   ;
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 1 - I - 0x007053 01:77D3: 60        .byte $60   ;



sub_bat_77D4:  ; orig: sub_bat_77D4:
    BSR     sub_0x01FA5F             ; JSR -> BSR  ; orig: - D 1 - I - 0x007054 01:77D4: 20 4F FA  JSR sub_0x01FA5F
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x007057 01:77D7: 98        TYA
    JMP     loc_77DF  ; orig: - D 1 - I - 0x007058 01:77D8: 4C DF 77  JMP loc_77DF



loc_77DB:  ; orig: loc_77DB:
sub_bat_77DB:  ; orig: sub_bat_77DB:
loc_bat_77DB:  ; orig: loc_bat_77DB:

; in

; A =

; Y =

; ram_000F_t04_flag
    MOVE.B  #$01,D2  ; orig: - D 1 - I - 0x00705B 01:77DB: A0 01     LDY #$01
    BNE     bra_77E1             ; BNE  ; orig: - D 1 - I - 0x00705D 01:77DD: D0 02     BNE bra_77E1    ; jm



loc_77DF:
; A = 02 03
sub_bat_77DF:  ; orig: sub_bat_77DF:
loc_bat_77DF:  ; orig: loc_bat_77DF:

; in

; A =

; ram_000F_t04_flag
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x00705F 01:77DF: A0 00     LDY #$00
bra_77E1:
; Y = 01
    MOVE.B  D2,ram_000C_t07_flag  ; orig: - D 1 - I - 0x007061 01:77E1: 84 0C     STY ram_000C_t07_fla
    ; (empty translation for LDY)  ; orig: - D 1 - I - 0x007063 01:77E3: BC 4F 03  LDY ram_obj_id_enemy
sub_bat_77E6:  ; orig: sub_bat_77E6:

; in

; A =

; Y =

; ram_000F_t04_flag
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x007066 01:77E6: C8        INY
sub_bat_77E7:  ; orig: sub_bat_77E7:

; in

; A =

; Y =

; ram_000F_t04_flag
    MOVE.B  D0,ram_000D_t04_table_offset  ; orig: - D 1 - I - 0x007067 01:77E7: 85 0D     STA ram_000D_t04_tab
    MOVE.B  D2,ram_000E_t02  ; orig: - D 1 - I - 0x007069 01:77E9: 84 0E     STY ram_000E_t02
    MOVE.B  D1,ram_0008_t07  ; orig: - D 1 - I - 0x00706B 01:77EB: 86 08     STX ram_0008_t07
    MOVE.B  ram_counter_00_27,D2  ; orig: - D 1 - I - 0x00706D 01:77ED: AC 41 03  LDY ram_counter_00_2
    MOVE.B  tbl_77AB(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007070 01:77F0: B9 AB 77  LDA tbl_77AB,Y
    MOVE.B  D0,ram_spr_index_1  ; orig: - D 1 - I - 0x007073 01:77F3: 8D 43 03  STA ram_spr_index_1
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007076 01:77F6: B9 AC 77  LDA tbl_77AB + $01,Y
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x007079 01:77F9: E0 00     CPX #$00
    BNE     bra_7804             ; BNE  ; orig: - D 1 - I - 0x00707B 01:77FB: D0 07     BNE bra_7804

; if link
    MOVE.B  #$48,D0  ; orig: - D 1 - I - 0x00707D 01:77FD: A9 48     LDA #$48
    MOVE.B  D0,ram_spr_index_1  ; orig: - D 1 - I - 0x00707F 01:77FF: 8D 43 03  STA ram_spr_index_1
    MOVE.B  #$4C,D0  ; orig: - D 1 - I - 0x007082 01:7802: A9 4C     LDA #$4C
bra_7804:  ; orig: bra_7804:
loc_bat_7804:  ; orig: loc_bat_7804:
    MOVE.B  D0,ram_spr_index_2  ; orig: - D 1 - I - 0x007084 01:7804: 8D 44 03  STA ram_spr_index_2
    MOVE.B  ram_000E_t02,D2  ; orig: - D 1 - I - 0x007087 01:7807: A4 0E     LDY ram_000E_t02
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x007089 01:7809: A9 01     LDA #$01
    MOVE.B  D0,ram_0007_t06_sprites_counter  ; orig: - D 1 - I - 0x00708B 01:780B: 85 07     STA ram_0007_t06_spr
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x00708D 01:780D: A9 08     LDA #$08
    MOVE.B  D0,ram_000A_t13_spr_X  ; orig: - D 1 - I - 0x00708F 01:780F: 85 0A     STA ram_000A_t13_spr
    MOVE.B  tbl_7594(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007091 01:7811: B9 94 75  LDA tbl_7594,Y
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007094 01:7814: 18        CLC
    ADDX.B  ram_000D_t04_table_offset,D0  ; orig: - D 1 - I - 0x007095 01:7815: 65 0D     ADC ram_000D_t04_tab
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x007097 01:7817: A8        TAY
    MOVE.B  tbl_7613(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007098 01:7818: B9 13 76  LDA tbl_7613,Y
    MOVE.B  D0,ram_0002_t45_spr_T  ; orig: - D 1 - I - 0x00709B 01:781B: 85 02     STA ram_0002_t45_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00709D 01:781D: 18        CLC
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00709E 01:781E: 69 02     ADC #$02
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070A0 01:7820: 85 03     STA ram_0002_t45_spr
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0070A2 01:7822: E0 00     CPX #$00
    BEQ     bra_7838             ; BEQ  ; orig: - D 1 - I - 0x0070A4 01:7824: F0 12     BEQ bra_7838
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x0070A6 01:7826: E0 0D     CPX #$0D
    BCS     bra_7838             ; BCS  ; orig: - D 1 - I - 0x0070A8 01:7828: B0 0E     BCS bra_7838

; 01-0C
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070AA 01:782A: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_02,D0  ; orig: - D 1 - I - 0x0070AD 01:782D: 29 02     AND #con_04C0_02
    BNE     bra_7849             ; BNE  ; orig: - D 1 - I - 0x0070AF 01:782F: D0 18     BNE bra_7849
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070B1 01:7831: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_08,D0  ; orig: - D 1 - I - 0x0070B4 01:7834: 29 08     AND #con_04C0_08
    BNE     bra_783E             ; BNE  ; orig: - D 1 - I - 0x0070B6 01:7836: D0 06     BNE bra_783E
bra_7838:  ; orig: bra_7838:
    MOVE.B  tbl_76DF_spr_A(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0070B8 01:7838: B9 DF 76  LDA tbl_76DF_spr_A,Y
    BSR     sub_7988_set_spr_A             ; JSR -> BSR  ; orig: - D 1 - I - 0x0070BB 01:783B: 20 88 79  JSR sub_7988_set_spr
bra_783E:  ; orig: bra_783E:
    CMPI.B  #$00,D1  ; orig: - D 1 - I - 0x0070BE 01:783E: E0 00     CPX #$00
    BEQ     bra_784E             ; BEQ  ; orig: - D 1 - I - 0x0070C0 01:7840: F0 0C     BEQ bra_784E
    MOVE.B  ram_000C_t07_flag,D2  ; orig: - D 1 - I - 0x0070C2 01:7842: A4 0C     LDY ram_000C_t07_fla
    BEQ     bra_784E             ; BEQ  ; orig: - D 1 - I - 0x0070C4 01:7844: F0 08     BEQ bra_784E
    JMP     loc_7979  ; orig: - D 1 - I - 0x0070C6 01:7846: 4C 79 79  JMP loc_7979
bra_7849:  ; orig: bra_7849:
    SUBQ.B  #1,ram_0007_t06_sprites_counter  ; orig: - D 1 - I - 0x0070C9 01:7849: C6 07     DEC ram_0007_t06_spr
    JMP     loc_7868  ; orig: - D 1 - I - 0x0070CB 01:784B: 4C 68 78  JMP loc_7868
bra_784E:  ; orig: bra_784E:
loc_784E:  ; orig: loc_784E:
    MOVE.B  ram_000F_t04_flag,D0  ; orig: - D 1 - I - 0x0070CE 01:784E: A5 0F     LDA ram_000F_t04_fla
    BEQ     bra_7868             ; BEQ  ; orig: - D 1 - I - 0x0070D0 01:7850: F0 16     BEQ bra_7868

; swap
    MOVE.B  ram_0002_t45_spr_T,D0  ; orig: - D 1 - I - 0x0070D2 01:7852: A5 02     LDA ram_0002_t45_spr
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0070D4 01:7854: 48        PHA
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070D5 01:7855: A5 03     LDA ram_0002_t45_spr
    MOVE.B  D0,ram_0002_t45_spr_T  ; orig: - D 1 - I - 0x0070D7 01:7857: 85 02     STA ram_0002_t45_spr
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x0070D9 01:7859: 68        PLA
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070DA 01:785A: 85 03     STA ram_0002_t45_spr

;
    MOVE.B  ram_0004_t13_spr_A,D0  ; orig: - D 1 - I - 0x0070DC 01:785C: A5 04     LDA ram_0004_t13_spr
    EORI.B  #$40,D0  ; orig: - D 1 - I - 0x0070DE 01:785E: 49 40     EOR #$40
    MOVE.B  D0,ram_0004_t13_spr_A  ; orig: - D 1 - I - 0x0070E0 01:7860: 85 04     STA ram_0004_t13_spr
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0070E2 01:7862: A5 05     LDA ram_0004_t13_spr
    EORI.B  #$40,D0  ; orig: - D 1 - I - 0x0070E4 01:7864: 49 40     EOR #$40
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0070E6 01:7866: 85 05     STA ram_0004_t13_spr
bra_7868:  ; orig: bra_7868:
loc_7868:  ; orig: loc_7868:
    MOVE.B  ram_invinc_enemy(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x0070E8 01:7868: BC F0 04  LDY ram_invinc_enemy
    BEQ     bra_7885             ; BEQ  ; orig: - D 1 - I - 0x0070EB 01:786B: F0 18     BEQ bra_7885
    MOVE.B  #$01,D2  ; orig: - D 1 - I - 0x0070ED 01:786D: A0 01     LDY #$01
bra_786F_loop:  ; orig: bra_786F_loop:
    MOVE.B  ram_0004_t13_spr_A(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0070EF 01:786F: B9 04 00  LDA ram_0004_t13_spr
    ANDI.B  #$FC,D0  ; orig: - D 1 - I - 0x0070F2 01:7872: 29 FC     AND #$FC
    MOVE.B  D0,ram_0004_t13_spr_A(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x0070F4 01:7874: 99 04 00  STA ram_0004_t13_spr
    MOVE.B  ram_invinc_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0070F7 01:7877: BD F0 04  LDA ram_invinc_enemy
    ANDI.B  #$03,D0  ; orig: - D 1 - I - 0x0070FA 01:787A: 29 03     AND #$03
    ; !! ORA ram_0004_t13_spr_A,Y - needs manual review  ; orig: - D 1 - I - 0x0070FC 01:787C: 19 04 00  ORA ram_0004_t13_spr
    MOVE.B  D0,ram_0004_t13_spr_A(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x0070FF 01:787F: 99 04 00  STA ram_0004_t13_spr
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x007102 01:7882: 88        DEY
    BPL     bra_786F_loop             ; BPL  ; orig: - D 1 - I - 0x007103 01:7883: 10 EA     BPL bra_786F_loop
bra_7885:  ; orig: bra_7885:
sub_bat_7885:  ; orig: sub_bat_7885:

; in

; ram_0000_t21_spr_X

; ram_0001_t15_spr_Y

; ram_0002_t45_spr_T

; ram_0004_t13_spr_A
    MOVE.B  ram_spr_index_1,D1  ; orig: - D 1 - I - 0x007105 01:7885: AE 43 03  LDX ram_spr_index_1
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x007108 01:7888: A0 00     LDY #$00
bra_788A_loop:  ; orig: bra_788A_loop:
    MOVE.B  ram_0002_t45_spr_T(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00710A 01:788A: B9 02 00  LDA ram_0002_t45_spr
    MOVE.B  D0,ram_spr_T(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00710D 01:788D: 9D 01 02  STA ram_spr_T,X
    MOVE.B  ram_0001_t15_spr_Y,D0  ; orig: - D 1 - I - 0x007110 01:7890: A5 01     LDA ram_0001_t15_spr
    MOVE.B  D0,ram_spr_Y(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007112 01:7892: 9D 00 02  STA ram_spr_Y,X
    MOVE.B  ram_0000_t21_spr_X,D0  ; orig: - D 1 - I - 0x007115 01:7895: A5 00     LDA ram_0000_t21_spr
    MOVE.B  D0,ram_spr_X(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007117 01:7897: 9D 03 02  STA ram_spr_X,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00711A 01:789A: 18        CLC
    ADDX.B  ram_000A_t13_spr_X,D0  ; orig: - D 1 - I - 0x00711B 01:789B: 65 0A     ADC ram_000A_t13_spr
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: - D 1 - I - 0x00711D 01:789D: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_0004_t13_spr_A(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00711F 01:789F: B9 04 00  LDA ram_0004_t13_spr
    MOVE.B  D0,ram_spr_A(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007122 01:78A2: 9D 02 02  STA ram_spr_A,X
    MOVE.B  ram_spr_index_2,D1  ; orig: - D 1 - I - 0x007125 01:78A5: AE 44 03  LDX ram_spr_index_2

; bzk bug? 0008 can bew from ram_0008_t03_data
    MOVE.B  ram_0008_t07,D0  ; orig: - D 1 - I - 0x007128 01:78A8: A5 08     LDA ram_0008_t07
    BEQ     bra_78AF             ; BEQ  ; orig: - D 1 - I - 0x00712A 01:78AA: F0 03     BEQ bra_78AF
    BSR     sub_6E36_increase_counter_00_27             ; JSR -> BSR  ; orig: - D 1 - I - 0x00712C 01:78AC: 20 36 6E  JSR sub_6E36_increas
bra_78AF:  ; orig: bra_78AF:
    ADDQ.B  #1,D2           ; INY  ; orig: - D 1 - I - 0x00712F 01:78AF: C8        INY
    SUBQ.B  #1,ram_0007_t06_sprites_counter  ; orig: - D 1 - I - 0x007130 01:78B0: C6 07     DEC ram_0007_t06_spr
    BPL     bra_788A_loop             ; BPL  ; orig: - D 1 - I - 0x007132 01:78B2: 10 D6     BPL bra_788A_loop

; bzk bug? 0008 can bew from ram_0008_t03_data
    MOVE.B  ram_0008_t07,D1  ; orig: - D 1 - I - 0x007134 01:78B4: A6 08     LDX ram_0008_t07
    RTS                     ; RTS  ; orig: - D 1 - I - 0x007136 01:78B6: 60        RTS



tbl_78B7_index:  ; orig: tbl_78B7_index:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - I - 0x007137 01:78B7: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - I - 0x007138 01:78B8: 03        .byte $03   ; 01
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - I - 0x007139 01:78B9: 07        .byte $07   ; 02
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - I - 0x00713A 01:78BA: 0A        .byte $0A   ; 03
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - I - 0x00713B 01:78BB: 0B        .byte $0B   ; 04
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - I - 0x00713C 01:78BC: 0C        .byte $0C   ; 05
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 1 - I - 0x00713D 01:78BD: 0D        .byte $0D   ; 06
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 1 - I - 0x00713E 01:78BE: 0E        .byte $0E   ; 07
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - I - 0x00713F 01:78BF: 0F        .byte $0F   ; 08
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 1 - I - 0x007140 01:78C0: 11        .byte $11   ; 09
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 1 - I - 0x007141 01:78C1: 12        .byte $12   ; 0A
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 1 - I - 0x007142 01:78C2: 13        .byte $13   ; 0B
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - I - 0x007143 01:78C3: 14        .byte $14   ; 0C
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 1 - I - 0x007144 01:78C4: 15        .byte $15   ; 0D
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - I - 0x007145 01:78C5: 16        .byte $16   ; 0E
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - I - 0x007146 01:78C6: 17        .byte $17   ; 0F
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - I - 0x007147 01:78C7: 18        .byte $18   ; 10
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - I - 0x007148 01:78C8: 17        .byte $17   ; 11
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - I - 0x007149 01:78C9: 18        .byte $18   ; 12
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - I - 0x00714A 01:78CA: 17        .byte $17   ; 13
    ; [DIRECTIVE] .BYTE $19  -- needs manual handling  ; orig: - D 1 - I - 0x00714B 01:78CB: 19        .byte $19   ; 14
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 1 - I - 0x00714C 01:78CC: 1B        .byte $1B   ; 15
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - I - 0x00714D 01:78CD: 1C        .byte $1C   ; 16
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 1 - I - 0x00714E 01:78CE: 1D        .byte $1D   ; 17
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 1 - I - 0x00714F 01:78CF: 1E        .byte $1E   ; 18
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 1 - I - 0x007150 01:78D0: 1F        .byte $1F   ; 19
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 1 - I - 0x007151 01:78D1: 20        .byte $20   ; 1A
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - I - 0x007152 01:78D2: 21        .byte $21   ; 1B
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - I - 0x007153 01:78D3: 1C        .byte $1C   ; 1C
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 1 - I - 0x007154 01:78D4: 22        .byte $22   ; 1D
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 1 - I - 0x007155 01:78D5: 22        .byte $22   ; 1E
    ; [DIRECTIVE] .BYTE $26  -- needs manual handling  ; orig: - D 1 - I - 0x007156 01:78D6: 26        .byte $26   ; 1F
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 1 - I - 0x007157 01:78D7: 27        .byte $27   ; 20
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 1 - I - 0x007158 01:78D8: 28        .byte $28   ; 21
    ; [DIRECTIVE] .BYTE $29  -- needs manual handling  ; orig: - D 1 - I - 0x007159 01:78D9: 29        .byte $29   ; 22
    ; [DIRECTIVE] .BYTE $2B  -- needs manual handling  ; orig: - D 1 - I - 0x00715A 01:78DA: 2B        .byte $2B   ; 23
    ; [DIRECTIVE] .BYTE $2E  -- needs manual handling  ; orig: - D 1 - I - 0x00715B 01:78DB: 2E        .byte $2E   ; 24



tbl_78DC:  ; orig: tbl_78DC:
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 1 - I - 0x00715C 01:78DC: 20        .byte $20   ; 00
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x00715D 01:78DD: 82        .byte $82   ; 01
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - D 1 - I - 0x00715E 01:78DE: 3C        .byte $3C   ; 02
    ; [DIRECTIVE] .BYTE $34  -- needs manual handling  ; orig: - D 1 - I - 0x00715F 01:78DF: 34        .byte $34   ; 03
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - I - 0x007160 01:78E0: 70        .byte $70   ; 04
    ; [DIRECTIVE] .BYTE $72  -- needs manual handling  ; orig: - D 1 - I - 0x007161 01:78E1: 72        .byte $72   ; 05
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - I - 0x007162 01:78E2: 74        .byte $74   ; 06
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 1 - I - 0x007163 01:78E3: 28        .byte $28   ; 07
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 1 - I - 0x007164 01:78E4: 86        .byte $86   ; 08
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - D 1 - I - 0x007165 01:78E5: 3C        .byte $3C   ; 09
    ; [DIRECTIVE] .BYTE $2A  -- needs manual handling  ; orig: - D 1 - I - 0x007166 01:78E6: 2A        .byte $2A   ; 0A
    ; [DIRECTIVE] .BYTE $26  -- needs manual handling  ; orig: - D 1 - I - 0x007167 01:78E7: 26        .byte $26   ; 0B
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x007168 01:78E8: 24        .byte $24   ; 0C
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 1 - I - 0x007169 01:78E9: 22        .byte $22   ; 0D
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 1 - I - 0x00716A 01:78EA: 40        .byte $40   ; 0E
    ; [DIRECTIVE] .BYTE $4A  -- needs manual handling  ; orig: - D 1 - I - 0x00716B 01:78EB: 4A        .byte $4A   ; 0F
    ; [DIRECTIVE] .BYTE $8A  -- needs manual handling  ; orig: - D 1 - I - 0x00716C 01:78EC: 8A        .byte $8A   ; 10
    ; [DIRECTIVE] .BYTE $6C  -- needs manual handling  ; orig: - D 1 - I - 0x00716D 01:78ED: 6C        .byte $6C   ; 11
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 1 - I - 0x00716E 01:78EE: 42        .byte $42   ; 12
    ; [DIRECTIVE] .BYTE $46  -- needs manual handling  ; orig: - D 1 - I - 0x00716F 01:78EF: 46        .byte $46   ; 13
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - I - 0x007170 01:78F0: 76        .byte $76   ; 14
    ; [DIRECTIVE] .BYTE $2C  -- needs manual handling  ; orig: - D 1 - I - 0x007171 01:78F1: 2C        .byte $2C   ; 15
    ; [DIRECTIVE] .BYTE $4E  -- needs manual handling  ; orig: - D 1 - I - 0x007172 01:78F2: 4E        .byte $4E   ; 16
    ; [DIRECTIVE] .BYTE $4C  -- needs manual handling  ; orig: - D 1 - I - 0x007173 01:78F3: 4C        .byte $4C   ; 17
    ; [DIRECTIVE] .BYTE $6A  -- needs manual handling  ; orig: - D 1 - I - 0x007174 01:78F4: 6A        .byte $6A   ; 18
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 1 - I - 0x007175 01:78F5: 50        .byte $50   ; 19
    ; [DIRECTIVE] .BYTE $52  -- needs manual handling  ; orig: - D 1 - I - 0x007176 01:78F6: 52        .byte $52   ; 1A
    ; [DIRECTIVE] .BYTE $66  -- needs manual handling  ; orig: - D 1 - I - 0x007177 01:78F7: 66        .byte $66   ; 1B
    ; [DIRECTIVE] .BYTE $32  -- needs manual handling  ; orig: - D 1 - I - 0x007178 01:78F8: 32        .byte $32   ; 1C
    ; [DIRECTIVE] .BYTE $2E  -- needs manual handling  ; orig: - D 1 - I - 0x007179 01:78F9: 2E        .byte $2E   ; 1D
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - I - 0x00717A 01:78FA: 68        .byte $68   ; 1E
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 1 - I - 0x00717B 01:78FB: F3        .byte $F3   ; 1F
    ; [DIRECTIVE] .BYTE $6E  -- needs manual handling  ; orig: - D 1 - I - 0x00717C 01:78FC: 6E        .byte $6E   ; 20
    ; [DIRECTIVE] .BYTE $F2  -- needs manual handling  ; orig: - D 1 - I - 0x00717D 01:78FD: F2        .byte $F2   ; 21
    ; [DIRECTIVE] .BYTE $36  -- needs manual handling  ; orig: - D 1 - I - 0x00717E 01:78FE: 36        .byte $36   ; 22
    ; [DIRECTIVE] .BYTE $38  -- needs manual handling  ; orig: - D 1 - I - 0x00717F 01:78FF: 38        .byte $38   ; 23
    ; [DIRECTIVE] .BYTE $3A  -- needs manual handling  ; orig: - D 1 - I - 0x007180 01:7900: 3A        .byte $3A   ; 24
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - D 1 - I - 0x007181 01:7901: 3C        .byte $3C   ; 25
    ; [DIRECTIVE] .BYTE $56  -- needs manual handling  ; orig: - D 1 - I - 0x007182 01:7902: 56        .byte $56   ; 26
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 1 - I - 0x007183 01:7903: 48        .byte $48   ; 27
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x007184 01:7904: 78        .byte $78   ; 28
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 1 - I - 0x007185 01:7905: 20        .byte $20   ; 29
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x007186 01:7906: 82        .byte $82   ; 2A
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - I - 0x007187 01:7907: 7A        .byte $7A   ; 2B
    ; [DIRECTIVE] .BYTE $7C  -- needs manual handling  ; orig: - D 1 - I - 0x007188 01:7908: 7C        .byte $7C   ; 2C
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - I - 0x007189 01:7909: 30        .byte $30   ; 2D
    ; [DIRECTIVE] .BYTE $64  -- needs manual handling  ; orig: - D 1 - I - 0x00718A 01:790A: 64        .byte $64   ; 2E
    ; [DIRECTIVE] .BYTE $62  -- needs manual handling  ; orig: - D 1 - I - 0x00718B 01:790B: 62        .byte $62   ; 2F



sub_bat_790C:  ; orig: sub_bat_790C:
loc_bat_790C:  ; orig: loc_bat_790C:

; in

; A =

; X =

; Y =
    BSR     sub_7988_set_spr_A             ; JSR -> BSR  ; orig: - D 1 - I - 0x00718C 01:790C: 20 88 79  JSR sub_7988_set_spr
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00718F 01:790F: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: - D 1 - I - 0x007191 01:7911: 85 0F     STA ram_000F_t04_fla
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: - D 1 - I - 0x007193 01:7913: 85 0C     STA ram_000C_t06_tab
loc_bat_7915:
; Y = 14
sub_bat_7915:
; Y = 00 08 23 24
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x007195 01:7915: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x007196 01:7916: 48        PHA
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x007197 01:7917: A9 00     LDA #$00
    MOVE.B  D0,ram_0052  ; orig: - D 1 - I - 0x007199 01:7919: 85 52     STA ram_0052
    MOVE.B  ram_counter_00_27,D2  ; orig: - D 1 - I - 0x00719B 01:791B: AC 41 03  LDY ram_counter_00_2
    MOVE.B  tbl_77AB(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00719E 01:791E: B9 AB 77  LDA tbl_77AB,Y
    MOVE.B  D0,ram_spr_index_1  ; orig: - D 1 - I - 0x0071A1 01:7921: 8D 43 03  STA ram_spr_index_1
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0071A4 01:7924: B9 AC 77  LDA tbl_77AB + $01,Y
    MOVE.B  D0,ram_spr_index_2  ; orig: - D 1 - I - 0x0071A7 01:7927: 8D 44 03  STA ram_spr_index_2
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x0071AA 01:792A: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x0071AB 01:792B: A8        TAY
sub_bat_792C:
; Y = 21
    MOVE.B  D1,ram_0008_t07  ; orig: - D 1 - I - 0x0071AC 01:792C: 86 08     STX ram_0008_t07
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x0071AE 01:792E: A9 01     LDA #$01
    MOVE.B  D0,ram_0007_t06_sprites_counter  ; orig: - D 1 - I - 0x0071B0 01:7930: 85 07     STA ram_0007_t06_spr
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x0071B2 01:7932: A9 08     LDA #$08
    MOVE.B  D0,ram_000A_t13_spr_X  ; orig: - D 1 - I - 0x0071B4 01:7934: 85 0A     STA ram_000A_t13_spr
    MOVE.B  tbl_78B7_index(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0071B6 01:7936: B9 B7 78  LDA tbl_78B7_index,Y
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0071B9 01:7939: 18        CLC
    ADDX.B  ram_000C_t06_table_offset,D0  ; orig: - D 1 - I - 0x0071BA 01:793A: 65 0C     ADC ram_000C_t06_tab
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x0071BC 01:793C: A8        TAY
    MOVE.B  tbl_78DC(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0071BD 01:793D: B9 DC 78  LDA tbl_78DC,Y
    MOVE.B  D0,ram_0002_t45_spr_T  ; orig: - D 1 - I - 0x0071C0 01:7940: 85 02     STA ram_0002_t45_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0071C2 01:7942: 18        CLC
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x0071C3 01:7943: 69 02     ADC #$02
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0071C5 01:7945: 85 03     STA ram_0002_t45_spr
    MOVE.B  ram_0002_t45_spr_T,D0  ; orig: - D 1 - I - 0x0071C7 01:7947: A5 02     LDA ram_0002_t45_spr
    CMPI.B  #$F3,D0  ; orig: - D 1 - I - 0x0071C9 01:7949: C9 F3     CMP #$F3
    BEQ     bra_7955             ; BEQ  ; orig: - D 1 - I - 0x0071CB 01:794B: F0 08     BEQ bra_7955
    CMPI.B  #$20,D0  ; orig: - D 1 - I - 0x0071CD 01:794D: C9 20     CMP #$20
    BCC     bra_796A             ; BCC  ; orig: - D 1 - I - 0x0071CF 01:794F: 90 19     BCC bra_796A
    CMPI.B  #$62,D0  ; orig: - D 1 - I - 0x0071D1 01:7951: C9 62     CMP #$62
    BCS     bra_796A             ; BCS  ; orig: - D 1 - I - 0x0071D3 01:7953: B0 15     BCS bra_796A
bra_7955:  ; orig: bra_7955:
    MOVE.B  ram_0504,D0  ; orig: - D 1 - I - 0x0071D5 01:7955: AD 04 05  LDA ram_0504
    BNE     bra_7961             ; BNE  ; orig: - D 1 - I - 0x0071D8 01:7958: D0 07     BNE bra_7961
    MOVE.B  ram_0000_t21_spr_X,D0  ; orig: - D 1 - I - 0x0071DA 01:795A: A5 00     LDA ram_0000_t21_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0071DC 01:795C: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x0071DD 01:795D: 69 04     ADC #$04
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: - D 1 - I - 0x0071DF 01:795F: 85 00     STA ram_0000_t21_spr
bra_7961:  ; orig: bra_7961:
    ADDQ.B  #1,ram_0052  ; orig: - D 1 - I - 0x0071E1 01:7961: E6 52     INC ram_0052
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0071E3 01:7963: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t06_sprites_counter  ; orig: - D 1 - I - 0x0071E5 01:7965: 85 07     STA ram_0007_t06_spr
    JMP     loc_7868  ; orig: - D 1 - I - 0x0071E7 01:7967: 4C 68 78  JMP loc_7868
bra_796A:  ; orig: bra_796A:
    CMPI.B  #$6C,D0  ; orig: - D 1 - I - 0x0071EA 01:796A: C9 6C     CMP #$6C
    BCC     bra_7975             ; BCC  ; orig: - D 1 - I - 0x0071EC 01:796C: 90 07     BCC bra_7975
    CMPI.B  #$7C,D0  ; orig: - D 1 - I - 0x0071EE 01:796E: C9 7C     CMP #$7C
    BCC     bra_7979             ; BCC  ; orig: - D 1 - I - 0x0071F0 01:7970: 90 07     BCC bra_7979
    JMP     loc_784E  ; orig: - D 1 - I - 0x0071F2 01:7972: 4C 4E 78  JMP loc_784E
bra_7975:  ; orig: bra_7975:
    MOVE.B  #$07,D0  ; orig: - D 1 - I - 0x0071F5 01:7975: A9 07     LDA #$07
    MOVE.B  D0,ram_000A_t13_spr_X  ; orig: - D 1 - I - 0x0071F7 01:7977: 85 0A     STA ram_000A_t13_spr
bra_7979:  ; orig: bra_7979:
loc_7979:  ; orig: loc_7979:
    MOVE.B  ram_0002_t45_spr_T,D0  ; orig: - D 1 - I - 0x0071F9 01:7979: A5 02     LDA ram_0002_t45_spr
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0071FB 01:797B: 85 03     STA ram_0002_t45_spr
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0071FD 01:797D: A5 05     LDA ram_0004_t14 + $
    EORI.B  #$40,D0  ; orig: - D 1 - I - 0x0071FF 01:797F: 49 40     EOR #$40
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007201 01:7981: 85 05     STA ram_0004_t14 + $
    JMP     loc_7868  ; orig: - D 1 - I - 0x007203 01:7983: 4C 68 78  JMP loc_7868



sub_bat_7986:  ; orig: sub_bat_7986:
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x007206 01:7986: A9 02     LDA #$02
sub_7988_set_spr_A:  ; orig: sub_7988_set_spr_A:
sub_bat_7988_set_spr_A:  ; orig: sub_bat_7988_set_spr_A:
loc_bat_7988_set_spr_A:  ; orig: loc_bat_7988_set_spr_A:

; in

; A =

; out

; ram_0004_t13_spr_A
    MOVE.B  D0,ram_0004_t13_spr_A  ; orig: - D 1 - I - 0x007208 01:7988: 85 04     STA ram_0004_t13_spr
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x00720A 01:798A: 85 05     STA ram_0004_t14 + $
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00720C 01:798C: 60        RTS



sub_bat_798D:  ; orig: sub_bat_798D:
    MOVE.B  #$03,D2  ; orig: - D 1 - I - 0x00720D 01:798D: A0 03     LDY #$03
    MOVE.B  D2,ram_0003_t16_spr_A  ; orig: - D 1 - I - 0x00720F 01:798F: 84 03     STY ram_0003_t16_spr
sub_bat_7991:  ; orig: sub_bat_7991:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x007211 01:7991: 48        PHA ; spr_T
    MOVE.B  ram_invinc_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007212 01:7992: BD F0 04  LDA ram_invinc_enemy
    BEQ     bra_799D             ; BEQ  ; orig: - D 1 - I - 0x007215 01:7995: F0 06     BEQ bra_799D
    MOVE.B  ram_frm_cnt,D0  ; orig: - D 1 - I - 0x007217 01:7997: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: - D 1 - I - 0x007219 01:7999: 29 03     AND #$03
    MOVE.B  D0,ram_0003_t16_spr_A  ; orig: - D 1 - I - 0x00721B 01:799B: 85 03     STA ram_0003_t16_spr
bra_799D:  ; orig: bra_799D:
    MOVE.B  ram_counter_00_27,D2  ; orig: - D 1 - I - 0x00721D 01:799D: AC 41 03  LDY ram_counter_00_2
    MOVE.B  tbl_77AB(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007220 01:79A0: B9 AB 77  LDA tbl_77AB,Y
    MOVE.B  D0,D2           ; TAY  ; orig: - D 1 - I - 0x007223 01:79A3: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x007224 01:79A4: 68        PLA ; spr_T
sub_bat_79A5:  ; orig: sub_bat_79A5:
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x007225 01:79A5: 99 01 02  STA ram_spr_T,Y
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007228 01:79A8: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_spr_X(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x00722A 01:79AA: 99 03 02  STA ram_spr_X,Y
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00722D 01:79AD: B5 84     LDA ram_pos_Y_enemy,
loc_bat_79AF:  ; orig: loc_bat_79AF:
    MOVE.B  D0,ram_spr_Y(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x00722F 01:79AF: 99 00 02  STA ram_spr_Y,Y
    MOVE.B  ram_0003_t16_spr_A,D0  ; orig: - D 1 - I - 0x007232 01:79B2: A5 03     LDA ram_0003_t16_spr
    MOVE.B  D0,ram_spr_A(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x007234 01:79B4: 99 02 02  STA ram_spr_A,Y
    JMP     loc_6E36_increase_counter_00_27  ; orig: - D 1 - I - 0x007237 01:79B7: 4C 36 6E  JMP loc_6E36_increas



loc_bat_79BA:  ; orig: loc_bat_79BA:
    BSR     sub_79D0             ; JSR -> BSR  ; orig: - D 1 - I - 0x00723A 01:79BA: 20 D0 79  JSR sub_79D0
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x00723D 01:79BD: AD 06 04  LDA ram_0405_enemy +
    BEQ     bra_79CA             ; BEQ  ; orig: - D 1 - I - 0x007240 01:79C0: F0 08     BEQ bra_79CA
    MOVE.B  D0,ram_04CC_flag  ; orig: - D 1 - I - 0x007242 01:79C2: 8D CC 04  STA ram_04CC_flag
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x007245 01:79C5: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007247 01:79C7: 8D 06 04  STA ram_0405_enemy +
bra_79CA:  ; orig: bra_79CA:
sub_bat_79CA:  ; orig: sub_bat_79CA:
loc_bat_79CA:  ; orig: loc_bat_79CA:

; in

; X =
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: - D 1 - I - 0x00724A 01:79CA: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    JMP     loc_77DB  ; orig: - D 1 - I - 0x00724D 01:79CD: 4C DB 77  JMP loc_77DB



sub_79D0:  ; orig: sub_79D0:
sub_bat_79D0:  ; orig: sub_bat_79D0:
loc_bat_79D0:  ; orig: loc_bat_79D0:
    BSR     sub_7A2D             ; JSR -> BSR  ; orig: - D 1 - I - 0x007250 01:79D0: 20 2D 7A  JSR sub_7A2D
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007253 01:79D3: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_20,D0  ; orig: - D 1 - I - 0x007256 01:79D6: 29 20     AND #con_04C0_20
    BNE     bra_79FD             ; BNE  ; orig: - D 1 - I - 0x007258 01:79D8: D0 23     BNE bra_79FD
    MOVE.B  ram_invinc_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00725A 01:79DA: BD F0 04  LDA ram_invinc_enemy
    BNE     bra_7A1C_RTS             ; BNE  ; orig: - D 1 - I - 0x00725D 01:79DD: D0 3D     BNE bra_7A1C_RTS
    MOVE.B  #$0F,D2  ; orig: - D 1 - I - 0x00725F 01:79DF: A0 0F     LDY #$0F
    BSR     sub_7BC2             ; JSR -> BSR  ; orig: - D 1 - I - 0x007261 01:79E1: 20 C2 7B  JSR sub_7BC2
    MOVE.B  #$0E,D2  ; orig: - D 1 - I - 0x007264 01:79E4: A0 0E     LDY #$0E
    BSR     sub_7C9D             ; JSR -> BSR  ; orig: - D 1 - I - 0x007266 01:79E6: 20 9D 7C  JSR sub_7C9D
    MOVE.B  #$10,D2  ; orig: - D 1 - I - 0x007269 01:79E9: A0 10     LDY #$10
    BSR     sub_7CDC             ; JSR -> BSR  ; orig: - D 1 - I - 0x00726B 01:79EB: 20 DC 7C  JSR sub_7CDC
    MOVE.B  #$11,D2  ; orig: - D 1 - I - 0x00726E 01:79EE: A0 11     LDY #$11
    BSR     sub_7CDC             ; JSR -> BSR  ; orig: - D 1 - I - 0x007270 01:79F0: 20 DC 7C  JSR sub_7CDC
    MOVE.B  #$0D,D2  ; orig: - D 1 - I - 0x007273 01:79F3: A0 0D     LDY #$0D
    BSR     sub_7D29             ; JSR -> BSR  ; orig: - D 1 - I - 0x007275 01:79F5: 20 29 7D  JSR sub_7D29
    MOVE.B  #$12,D2  ; orig: - D 1 - I - 0x007278 01:79F8: A0 12     LDY #$12
    BSR     sub_7D5F             ; JSR -> BSR  ; orig: - D 1 - I - 0x00727A 01:79FA: 20 5F 7D  JSR sub_7D5F
bra_79FD:  ; orig: bra_79FD:
    BSR     sub_7AA7             ; JSR -> BSR  ; orig: - D 1 - I - 0x00727D 01:79FD: 20 A7 7A  JSR sub_7AA7
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007280 01:7A00: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  ram_0405_enemy(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x007283 01:7A03: BC 05 04  LDY ram_0405_enemy,X
    BEQ     bra_7A1D             ; BEQ  ; orig: - D 1 - I - 0x007286 01:7A06: F0 15     BEQ bra_7A1D
    CMPI.B  #con_obj_id_05,D0  ; orig: - D 1 - I - 0x007288 01:7A08: C9 05     CMP #con_obj_id_05
    BEQ     bra_7A10             ; BEQ  ; orig: - D 1 - I - 0x00728A 01:7A0A: F0 04     BEQ bra_7A10
    CMPI.B  #con_obj_id_06,D0  ; orig: - D 1 - I - 0x00728C 01:7A0C: C9 06     CMP #con_obj_id_06
    BNE     bra_7A1C_RTS             ; BNE  ; orig: - D 1 - I - 0x00728E 01:7A0E: D0 0C     BNE bra_7A1C_RTS
bra_7A10:  ; orig: bra_7A10:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007290 01:7A10: B5 AC     LDA ram_state_obj,X
    BPL     bra_7A1C_RTS             ; BPL  ; orig: - D 1 - I - 0x007292 01:7A12: 10 08     BPL bra_7A1C_RTS
    MOVE.B  ram_042B_enemy(D1.L),D2  ; LDY abs,X  ; orig: - D 1 - I - 0x007294 01:7A14: BC 2C 04  LDY ram_042B_enemy,X
    MOVE.B  #con_obj_id_null,D0  ; orig: - D 1 - I - 0x007297 01:7A17: A9 00     LDA #con_obj_id_null
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007299 01:7A19: 99 4F 03  STA ram_obj_id_enemy
bra_7A1C_RTS:  ; orig: bra_7A1C_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00729C 01:7A1C: 60        RTS
bra_7A1D:  ; orig: bra_7A1D:
    CMPI.B  #$27,D0  ; orig: - D 1 - I - 0x00729D 01:7A1D: C9 27     CMP #$27
    BEQ     bra_7A25             ; BEQ  ; orig: - D 1 - I - 0x00729F 01:7A1F: F0 04     BEQ bra_7A25
    CMPI.B  #$17,D0  ; orig: - D 1 - I - 0x0072A1 01:7A21: C9 17     CMP #$17
    BNE     bra_7A2C_RTS             ; BNE  ; orig: - D 1 - I - 0x0072A3 01:7A23: D0 07     BNE bra_7A2C_RTS
bra_7A25:  ; orig: bra_7A25:
    MOVE.B  ram_000C_t12_flag,D0  ; orig: - D 1 - I - 0x0072A5 01:7A25: A5 0C     LDA ram_000C_t12_fla
    BEQ     bra_7A2C_RTS             ; BEQ  ; orig: - D 1 - I - 0x0072A7 01:7A27: F0 03     BEQ bra_7A2C_RTS
    ; (empty translation for INC)  ; orig: - D 1 - I - 0x0072A9 01:7A29: FE 2C 04  INC ram_042B_enemy,X
bra_7A2C_RTS:  ; orig: bra_7A2C_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0072AC 01:7A2C: 60        RTS



sub_7A2D:  ; orig: sub_7A2D:
sub_bat_7A2D:  ; orig: sub_bat_7A2D:

; out

; ram_0002_t34_pos_X

; ram_0003_t21_pos_Y
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x0072AD 01:7A2D: A9 08     LDA #$08
    MOVE.B  D0,ram_0002_t35_pos_X  ; orig: - D 1 - I - 0x0072AF 01:7A2F: 85 02     STA ram_0002_t35_pos

; bzk optimize, A is always 08
    MOVE.B  D0,ram_0003_t13_useless_08  ; orig: - D 1 - I - 0x0072B1 01:7A31: 85 03     STA ram_0003_t13_use
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0072B3 01:7A33: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_40,D0  ; orig: - D 1 - I - 0x0072B6 01:7A36: 29 40     AND #con_04C0_40
    BEQ     bra_7A3C             ; BEQ  ; orig: - D 1 - I - 0x0072B8 01:7A38: F0 02     BEQ bra_7A3C
    LSR.B   #1,ram_0002_t35_pos_X  ; orig: - D 1 - I - 0x0072BA 01:7A3A: 46 02     LSR ram_0002_t35_pos
bra_7A3C:  ; orig: bra_7A3C:
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0072BC 01:7A3C: B5 70     LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0072BE 01:7A3E: 18        CLC
    ADDX.B  ram_0002_t35_pos_X,D0  ; orig: - D 1 - I - 0x0072BF 01:7A3F: 65 02     ADC ram_0002_t35_pos
    MOVE.B  D0,ram_0002_t34_pos_X  ; orig: - D 1 - I - 0x0072C1 01:7A41: 85 02     STA ram_0002_t34_pos
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0072C3 01:7A43: B5 84     LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x0072C5 01:7A45: 18        CLC

; bzk optimize, always 08
    ADDX.B  ram_0003_t13_useless_08,D0  ; orig: - D 1 - I - 0x0072C6 01:7A46: 65 03     ADC ram_0003_t13_use
    MOVE.B  D0,ram_0003_t21_pos_Y  ; orig: - D 1 - I - 0x0072C8 01:7A48: 85 03     STA ram_0003_t21_pos
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0072CA 01:7A4A: 60        RTS



tbl_7A4B_damage_taken:  ; orig: tbl_7A4B_damage_taken:

;                                              +----------- damage hi

;                                              |     +----- damage lo

;                                              |     |
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072CB 01:7A4B: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072CC 01:7A4C: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072CD 01:7A4D: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072CE 01:7A4E: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072CF 01:7A4F: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D0 01:7A50: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D1 01:7A51: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D2 01:7A52: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D3 01:7A53: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D4 01:7A54: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072D5 01:7A55: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072D6 01:7A56: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D7 01:7A57: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072D8 01:7A58: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072D9 01:7A59: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072DA 01:7A5A: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072DB 01:7A5B: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072DC 01:7A5C: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072DD 01:7A5D: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072DE 01:7A5E: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072DF 01:7A5F: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072E0 01:7A60: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072E1 01:7A61: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072E2 01:7A62: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E3 01:7A63: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E4 01:7A64: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E5 01:7A65: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E6 01:7A66: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E7 01:7A67: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072E8 01:7A68: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072E9 01:7A69: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072EA 01:7A6A: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072EB 01:7A6B: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072EC 01:7A6C: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072ED 01:7A6D: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072EE 01:7A6E: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072EF 01:7A6F: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072F0 01:7A70: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F1 01:7A71: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F2 01:7A72: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F3 01:7A73: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F4 01:7A74: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F5 01:7A75: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F6 01:7A76: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F7 01:7A77: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F8 01:7A78: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072F9 01:7A79: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072FA 01:7A7A: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072FB 01:7A7B: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x0072FC 01:7A7C: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072FD 01:7A7D: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x0072FE 01:7A7E: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x0072FF 01:7A7F: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007300 01:7A80: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007301 01:7A81: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007302 01:7A82: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007303 01:7A83: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007304 01:7A84: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007305 01:7A85: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007306 01:7A86: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007307 01:7A87: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $04  -- needs manual handling  ; orig: - D 1 - I - 0x007308 01:7A88: 04        .byte $00 + $04   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007309 01:7A89: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00730A 01:7A8A: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00730B 01:7A8B: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00730C 01:7A8C: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00730D 01:7A8D: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00730E 01:7A8E: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x00730F 01:7A8F: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007310 01:7A90: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007311 01:7A91: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007312 01:7A92: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007313 01:7A93: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007314 01:7A94: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007315 01:7A95: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007316 01:7A96: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007317 01:7A97: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007318 01:7A98: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007319 01:7A99: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731A 01:7A9A: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731B 01:7A9B: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731C 01:7A9C: 00        .byte $00 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731D 01:7A9D: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731E 01:7A9E: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x00731F 01:7A9F: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007320 01:7AA0: 01        .byte $00 + $01   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007321 01:7AA1: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $02  -- needs manual handling  ; orig: - D 1 - I - 0x007322 01:7AA2: 02        .byte $00 + $02   ; 
    ; [DIRECTIVE] .BYTE $00 + $04  -- needs manual handling  ; orig: - D 1 - I - 0x007323 01:7AA3: 04        .byte $00 + $04   ; 
    ; [DIRECTIVE] .BYTE $00 + $04  -- needs manual handling  ; orig: - D 1 - I - 0x007324 01:7AA4: 04        .byte $00 + $04   ; 
    ; [DIRECTIVE] .BYTE $80 + $00  -- needs manual handling  ; orig: - D 1 - I - 0x007325 01:7AA5: 80        .byte $80 + $00   ; 
    ; [DIRECTIVE] .BYTE $00 + $01  -- needs manual handling  ; orig: - D 1 - I - 0x007326 01:7AA6: 01        .byte $00 + $01   ; 



sub_7AA7:  ; orig: sub_7AA7:
sub_bat_7AA7:  ; orig: sub_bat_7AA7:
loc_bat_7AA7:  ; orig: loc_bat_7AA7:
    BSR     sub_7A2D             ; JSR -> BSR  ; orig: - D 1 - I - 0x007327 01:7AA7: 20 2D 7A  JSR sub_7A2D
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00732A 01:7AAA: A9 00     LDA #$00
    MOVE.B  D0,ram_034B_flag  ; orig: - D 1 - I - 0x00732C 01:7AAC: 8D 4B 03  STA ram_034B_flag
    MOVE.B  D0,ram_0006_t10_flag  ; orig: - D 1 - I - 0x00732F 01:7AAF: 85 06     STA ram_0006_t10_fla
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x007331 01:7AB1: 85 09     STA ram_0009_t02
    MOVE.B  D0,ram_000C_t12_flag  ; orig: - D 1 - I - 0x007333 01:7AB3: 85 0C     STA ram_000C_t12_fla
    MOVE.B  #$00,D2  ; orig: - D 1 - I - 0x007335 01:7AB5: A0 00     LDY #$00
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x007337 01:7AB7: 84 00     STY ram_0000_t2A
    MOVE.B  ram_invinc_link,D0  ; orig: - D 1 - I - 0x007339 01:7AB9: AD F0 04  LDA ram_invinc_link
    OR.B    ram_item_clock,D0  ; orig: - D 1 - I - 0x00733C 01:7ABC: 0D 6C 06  ORA ram_item_clock
    OR.B    ram_003D_link,D0  ; orig: - D 1 - I - 0x00733F 01:7ABF: 05 3D     ORA ram_003D_link
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: - D 1 - I - 0x007341 01:7AC1: 15 3D     ORA ram_003D_enemy,X
    BNE     bra_7B39_RTS             ; BNE  ; orig: - D 1 - I - 0x007343 01:7AC3: D0 74     BNE bra_7B39_RTS
sub_bat_7AC5:  ; orig: sub_bat_7AC5:
    MOVE.B  ram_state_link,D0  ; orig: - D 1 - I - 0x007345 01:7AC5: A5 AC     LDA ram_state_link
    CMPI.B  #con_obj_state_freeze,D0  ; orig: - D 1 - I - 0x007347 01:7AC7: C9 40     CMP #con_obj_state_f
    BEQ     bra_7B39_RTS             ; BEQ  ; orig: - D 1 - I - 0x007349 01:7AC9: F0 6E     BEQ bra_7B39_RTS
    MOVE.B  ram_0512_flag,D0  ; orig: - D 1 - I - 0x00734B 01:7ACB: AD 12 05  LDA ram_0512_flag
    BNE     bra_7B39_RTS             ; BNE  ; orig: - D 1 - I - 0x00734E 01:7ACE: D0 69     BNE bra_7B39_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007350 01:7AD0: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #$53,D0  ; orig: - D 1 - I - 0x007353 01:7AD3: C9 53     CMP #$53
    BCC     bra_7ADF             ; BCC  ; orig: - D 1 - I - 0x007355 01:7AD5: 90 08     BCC bra_7ADF

; if projectile
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007357 01:7AD7: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x007359 01:7AD9: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: - D 1 - I - 0x00735B 01:7ADB: C9 10     CMP #$10
    BNE     bra_7B39_RTS             ; BNE  ; orig: - D 1 - I - 0x00735D 01:7ADD: D0 5A     BNE bra_7B39_RTS
bra_7ADF:  ; orig: bra_7ADF:
    MOVE.B  ram_pos_X_link,D0  ; orig: - D 1 - I - 0x00735F 01:7ADF: A5 70     LDA ram_pos_X_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007361 01:7AE1: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007362 01:7AE2: 69 08     ADC #$08
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: - D 1 - I - 0x007364 01:7AE4: 85 04     STA ram_0004_t10_pos
    MOVE.B  ram_pos_Y_link,D0  ; orig: - D 1 - I - 0x007366 01:7AE6: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007368 01:7AE8: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007369 01:7AE9: 69 08     ADC #$08
    MOVE.B  D0,ram_0005_t08_pos_Y  ; orig: - D 1 - I - 0x00736B 01:7AEB: 85 05     STA ram_0005_t08_pos
    MOVE.B  #$09,D0  ; orig: - D 1 - I - 0x00736D 01:7AED: A9 09     LDA #$09
    BSR     sub_7DFB             ; JSR -> BSR  ; orig: - D 1 - I - 0x00736F 01:7AEF: 20 FB 7D  JSR sub_7DFB
    BEQ     bra_7B39_RTS             ; BEQ  ; orig: - D 1 - I - 0x007372 01:7AF2: F0 45     BEQ bra_7B39_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007374 01:7AF4: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #$53,D0  ; orig: - D 1 - I - 0x007377 01:7AF7: C9 53     CMP #$53
    BCC     bra_7B3A_getting_hit             ; BCC  ; orig: - D 1 - I - 0x007379 01:7AF9: 90 3F     BCC bra_7B3A_getting
    ADDQ.B  #1,ram_034B_flag  ; orig: - D 1 - I - 0x00737B 01:7AFB: EE 4B 03  INC ram_034B_flag
    CMPI.B  #$56,D0  ; orig: - D 1 - I - 0x00737E 01:7AFE: C9 56     CMP #$56
    BEQ     bra_7B3A_getting_hit             ; BEQ  ; orig: - D 1 - I - 0x007380 01:7B00: F0 38     BEQ bra_7B3A_getting
    CMPI.B  #$5A,D0  ; orig: - D 1 - I - 0x007382 01:7B02: C9 5A     CMP #$5A
    BEQ     bra_7B3A_getting_hit             ; BEQ  ; orig: - D 1 - I - 0x007384 01:7B04: F0 34     BEQ bra_7B3A_getting
    MOVE.B  ram_state_link,D0  ; orig: - D 1 - I - 0x007386 01:7B06: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_10 + con_obj_state_20 + con_obj_state_freeze + con_obj_state_80,D0  ; orig: - D 1 - I - 0x007388 01:7B08: 29 F0     AND #con_obj_state_1
    BNE     bra_7B3A_getting_hit             ; BNE  ; orig: - D 1 - I - 0x00738A 01:7B0A: D0 2E     BNE bra_7B3A_getting
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x00738C 01:7B0C: A5 98     LDA ram_dir_link
    ; !! ORA ram_dir_enemy,X - needs manual review  ; orig: - D 1 - I - 0x00738E 01:7B0E: 15 98     ORA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x007390 01:7B10: 29 0C     AND #con_dir__UD
    CMPI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x007392 01:7B12: C9 0C     CMP #con_dir__UD
    BEQ     bra_7B20             ; BEQ  ; orig: - D 1 - I - 0x007394 01:7B14: F0 0A     BEQ bra_7B20
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x007396 01:7B16: A5 98     LDA ram_dir_link
    ; !! ORA ram_dir_enemy,X - needs manual review  ; orig: - D 1 - I - 0x007398 01:7B18: 15 98     ORA ram_dir_enemy,X
    ANDI.B  #con_dir__LR,D0  ; orig: - D 1 - I - 0x00739A 01:7B1A: 29 03     AND #con_dir__LR
    CMPI.B  #con_dir__LR,D0  ; orig: - D 1 - I - 0x00739C 01:7B1C: C9 03     CMP #con_dir__LR
    BNE     bra_7B3A_getting_hit             ; BNE  ; orig: - D 1 - I - 0x00739E 01:7B1E: D0 1A     BNE bra_7B3A_getting
bra_7B20:  ; orig: bra_7B20:
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0073A0 01:7B20: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #$55,D0  ; orig: - D 1 - I - 0x0073A3 01:7B23: C9 55     CMP #$55
    BCC     bra_7B30_normal_projectile             ; BCC  ; orig: - D 1 - I - 0x0073A5 01:7B25: 90 09     BCC bra_7B30_normal_
    CMPI.B  #$5B,D0  ; orig: - D 1 - I - 0x0073A7 01:7B27: C9 5B     CMP #$5B
    BCS     bra_7B30_normal_projectile             ; BCS  ; orig: - D 1 - I - 0x0073A9 01:7B29: B0 05     BCS bra_7B30_normal_

; 55-5A magic projectile
    MOVE.B  ram_item_magic_shield,D0  ; orig: - D 1 - I - 0x0073AB 01:7B2B: AD 76 06  LDA ram_item_magic_s
    BEQ     bra_7B3A_getting_hit             ; BEQ  ; orig: - D 1 - I - 0x0073AE 01:7B2E: F0 0A     BEQ bra_7B3A_getting
bra_7B30_normal_projectile:  ; orig: bra_7B30_normal_projectile:
    MOVE.B  #con_sfx_4_shield_block,D0  ; orig: - D 1 - I - 0x0073B0 01:7B30: A9 01     LDA #con_sfx_4_shiel
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x0073B2 01:7B32: 8D 04 06  STA ram_sfx_4
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0073B5 01:7B35: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t10_flag  ; orig: - D 1 - I - 0x0073B7 01:7B37: 85 06     STA ram_0006_t10_fla
bra_7B39_RTS:  ; orig: bra_7B39_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0073B9 01:7B39: 60        RTS
bra_7B3A_getting_hit:  ; orig: bra_7B3A_getting_hit:
    BSR     sub_7E26             ; JSR -> BSR  ; orig: - D 1 - I - 0x0073BA 01:7B3A: 20 26 7E  JSR sub_7E26
    ADDQ.B  #1,ram_000C_t12_flag  ; orig: - D 1 - I - 0x0073BD 01:7B3D: E6 0C     INC ram_000C_t12_fla
    ; (empty translation for LDY)  ; orig: - D 1 - I - 0x0073BF 01:7B3F: BC 4F 03  LDY ram_obj_id_enemy
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0073C2 01:7B42: B9 4A 7A  LDA tbl_7A4B_damage_
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x0073C5 01:7B45: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x0073C6 01:7B46: 29 0F     AND #$0F
    MOVE.B  D0,ram_000D_t01_damage_lo  ; orig: - D 1 - I - 0x0073C8 01:7B48: 85 0D     STA ram_000D_t01_dam
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x0073CA 01:7B4A: 68        PLA
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x0073CB 01:7B4B: 29 F0     AND #$F0
    MOVE.B  D0,ram_000E_t03_damage_hi  ; orig: - D 1 - I - 0x0073CD 01:7B4D: 85 0E     STA ram_000E_t03_dam
loc_bat_7B4F:  ; orig: loc_bat_7B4F:
    ; (empty translation for LDY)  ; orig: - D 1 - I - 0x0073CF 01:7B4F: BC 4F 03  LDY ram_obj_id_enemy
    CMPI.B  #con_obj_id_2E,D2  ; orig: - D 1 - I - 0x0073D2 01:7B52: C0 2E     CPY #con_obj_id_2E
    BEQ     bra_7B5B             ; BEQ  ; orig: - D 1 - I - 0x0073D4 01:7B54: F0 05     BEQ bra_7B5B
    MOVE.B  #con_sfx_1_plr_hit,D0  ; orig: - D 1 - I - 0x0073D6 01:7B56: A9 08     LDA #con_sfx_1_plr_h
    BSR     sub_6D7C_set_sfx_1             ; JSR -> BSR  ; orig: - D 1 - I - 0x0073D8 01:7B58: 20 7C 6D  JSR sub_6D7C_set_sfx
bra_7B5B:  ; orig: bra_7B5B:
    MOVE.B  ram_item_ring,D2  ; orig: - D 1 - I - 0x0073DB 01:7B5B: AC 62 06  LDY ram_item_ring
    BEQ     bra_7B67_no_ring             ; BEQ  ; orig: - D 1 - I - 0x0073DE 01:7B5E: F0 07     BEQ bra_7B67_no_ring

; if have ring, 1/2 damage for blue ring and 1/4 damage for red ring
bra_7B60_loop:  ; orig: bra_7B60_loop:

; divide damage by 2
    LSR.B   #1,ram_000D_t01_damage_lo  ; orig: - D 1 - I - 0x0073E0 01:7B60: 46 0D     LSR ram_000D_t01_dam
    ROXR.B  #1,ram_000E_t03_damage_hi  ; orig: - D 1 - I - 0x0073E2 01:7B62: 66 0E     ROR ram_000E_t03_dam
    SUBQ.B  #1,D2           ; DEY  ; orig: - D 1 - I - 0x0073E4 01:7B64: 88        DEY
    BNE     bra_7B60_loop             ; BNE  ; orig: - D 1 - I - 0x0073E5 01:7B65: D0 F9     BNE bra_7B60_loop
bra_7B67_no_ring:  ; orig: bra_7B67_no_ring:
bra_7B67_loop:  ; orig: bra_7B67_loop:
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x0073E7 01:7B67: A9 00     LDA #$00
    MOVE.B  D0,ram_total_kill_cnt  ; orig: - D 1 - I - 0x0073E9 01:7B69: 8D 27 06  STA ram_total_kill_c
    MOVE.B  D0,ram_0050  ; orig: - D 1 - I - 0x0073EC 01:7B6C: 85 50     STA ram_0050
    MOVE.B  D0,ram_0051  ; orig: - D 1 - I - 0x0073EE 01:7B6E: 85 51     STA ram_0051
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0073F0 01:7B70: AD 70 06  LDA ram_item_hearts 
    CMP.B   ram_000E_t03_damage_hi,D0  ; orig: - D 1 - I - 0x0073F3 01:7B73: C5 0E     CMP ram_000E_t03_dam
    BCC     bra_7B90             ; BCC  ; orig: - D 1 - I - 0x0073F5 01:7B75: 90 19     BCC bra_7B90
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x0073F7 01:7B77: 38        SEC
    SUBX.B  ram_000E_t03_damage_hi,D0  ; orig: - D 1 - I - 0x0073F8 01:7B78: E5 0E     SBC ram_000E_t03_dam
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0073FA 01:7B7A: 8D 70 06  STA ram_item_hearts 
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x0073FD 01:7B7D: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x007400 01:7B80: 29 0F     AND #$0F
    CMP.B   ram_000D_t01_damage_lo,D0  ; orig: - D 1 - I - 0x007402 01:7B82: C5 0D     CMP ram_000D_t01_dam
    BCC     bra_7BA9_death             ; BCC  ; orig: - D 1 - I - 0x007404 01:7B84: 90 23     BCC bra_7BA9_death
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x007406 01:7B86: AD 6F 06  LDA ram_item_hearts
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x007409 01:7B89: 38        SEC
    SUBX.B  ram_000D_t01_damage_lo,D0  ; orig: - D 1 - I - 0x00740A 01:7B8A: E5 0D     SBC ram_000D_t01_dam
    MOVE.B  D0,ram_item_hearts  ; orig: - D 1 - I - 0x00740C 01:7B8C: 8D 6F 06  STA ram_item_hearts
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00740F 01:7B8F: 60        RTS
bra_7B90:  ; orig: bra_7B90:
    MOVE.B  ram_000E_t03_damage_hi,D0  ; orig: - D 1 - I - 0x007410 01:7B90: A5 0E     LDA ram_000E_t03_dam
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x007412 01:7B92: 38        SEC
    ; !! SBC ram_item_hearts + $01 - complex mode, manual review needed  ; orig: - D 1 - I - 0x007413 01:7B93: ED 70 06  SBC ram_item_hearts 
    MOVE.B  D0,ram_000E_t03_damage_hi  ; orig: - D 1 - I - 0x007416 01:7B96: 85 0E     STA ram_000E_t03_dam
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x007418 01:7B98: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$0F,D0  ; orig: - D 1 - I - 0x00741B 01:7B9B: 29 0F     AND #$0F
    BEQ     bra_7BA9_death             ; BEQ  ; orig: - D 1 - I - 0x00741D 01:7B9D: F0 0A     BEQ bra_7BA9_death
    SUBQ.B  #1,ram_item_hearts  ; orig: - D 1 - I - 0x00741F 01:7B9F: CE 6F 06  DEC ram_item_hearts
    MOVE.B  #$FF,D0  ; orig: - D 1 - I - 0x007422 01:7BA2: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007424 01:7BA4: 8D 70 06  STA ram_item_hearts 
    BNE     bra_7B67_loop             ; BNE  ; orig: - D 1 - I - 0x007427 01:7BA7: D0 BE     BNE bra_7B67_loop   
bra_7BA9_death:  ; orig: bra_7BA9_death:
    MOVE.B  ram_item_hearts,D0  ; orig: - D 1 - I - 0x007429 01:7BA9: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$F0,D0  ; orig: - D 1 - I - 0x00742C 01:7BAC: 29 F0     AND #$F0
    MOVE.B  D0,ram_item_hearts  ; orig: - D 1 - I - 0x00742E 01:7BAE: 8D 6F 06  STA ram_item_hearts
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: - D 1 - I - 0x007431 01:7BB1: 20 A3 EB  JSR sub_0x01EBB3_cle

; A = 00
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x007434 01:7BB4: 8D 70 06  STA ram_item_hearts 
    MOVE.B  D0,ram_state_link  ; orig: - D 1 - I - 0x007437 01:7BB7: 85 AC     STA ram_state_link  
    MOVE.B  #con_script_death,D0  ; orig: - D 1 - I - 0x007439 01:7BB9: A9 11     LDA #con_script_deat
    MOVE.B  D0,ram_script  ; orig: - D 1 - I - 0x00743B 01:7BBB: 85 12     STA ram_script
    MOVE.B  #con_dir_Down,D0  ; orig: - D 1 - I - 0x00743D 01:7BBD: A9 04     LDA #con_dir_Down
    MOVE.B  D0,ram_dir_link  ; orig: - D 1 - I - 0x00743F 01:7BBF: 85 98     STA ram_dir_link
bra_7BC1_RTS:  ; orig: bra_7BC1_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x007441 01:7BC1: 60        RTS



sub_7BC2:  ; orig: sub_7BC2:
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007442 01:7BC2: B9 AC 00  LDA ram_state_obj,Y
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x007445 01:7BC5: 0A        ASL
    BCS     bra_7BC1_RTS             ; BCS  ; orig: - D 1 - I - 0x007446 01:7BC6: B0 F9     BCS bra_7BC1_RTS
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x007448 01:7BC8: 84 00     STY ram_0000_t2A
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x00744A 01:7BCA: A9 02     LDA #$02
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x00744C 01:7BCC: 85 09     STA ram_0009_t02
    MOVE.B  #$0A,D0  ; orig: - D 1 - I - 0x00744E 01:7BCE: A9 0A     LDA #$0A
    MOVE.B  D0,ram_000D_t11  ; orig: - D 1 - I - 0x007450 01:7BD0: 85 0D     STA ram_000D_t11
    MOVE.B  D0,ram_000E_t05  ; orig: - D 1 - I - 0x007452 01:7BD2: 85 0E     STA ram_000E_t05
    MOVE.B  ram_pos_X_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007454 01:7BD4: B9 70 00  LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007457 01:7BD7: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007458 01:7BD8: 69 04     ADC #$04
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: - D 1 - I - 0x00745A 01:7BDA: 85 04     STA ram_0004_t10_pos
    MOVE.B  ram_pos_Y_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00745C 01:7BDC: B9 84 00  LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00745F 01:7BDF: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007460 01:7BE0: 69 08     ADC #$08
loc_7BE2:  ; orig: loc_7BE2:

; in

; ram_0000_t2A
    MOVE.B  D0,ram_0005_t08_pos_Y  ; orig: - D 1 - I - 0x007462 01:7BE2: 85 05     STA ram_0005_t08_pos
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x007464 01:7BE4: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t10_flag  ; orig: - D 1 - I - 0x007466 01:7BE6: 85 06     STA ram_0006_t10_fla
    MOVE.B  ram_0000_t2A,D2  ; orig: - D 1 - I - 0x007468 01:7BE8: A4 00     LDY ram_0000_t2A
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00746A 01:7BEA: B9 AC 00  LDA ram_state_obj,Y
    BEQ     bra_7C68_RTS             ; BEQ  ; orig: - D 1 - I - 0x00746D 01:7BED: F0 79     BEQ bra_7C68_RTS
    BSR     sub_7DFF             ; JSR -> BSR  ; orig: - D 1 - I - 0x00746F 01:7BEF: 20 FF 7D  JSR sub_7DFF
    BEQ     bra_7C68_RTS             ; BEQ  ; orig: - D 1 - I - 0x007472 01:7BF2: F0 74     BEQ bra_7C68_RTS
    CMPI.B  #$0F,D2  ; orig: - D 1 - I - 0x007474 01:7BF4: C0 0F     CPY #$0F
    BNE     bra_7C16             ; BNE  ; orig: - D 1 - I - 0x007476 01:7BF6: D0 1E     BNE bra_7C16
    MOVE.B  ram_04B2_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007478 01:7BF8: BD B2 04  LDA ram_04B2_enemy,X
    AND.B   ram_0009_t02,D0  ; orig: - D 1 - I - 0x00747B 01:7BFB: 25 09     AND ram_0009_t02
    BEQ     bra_7C02             ; BEQ  ; orig: - D 1 - I - 0x00747D 01:7BFD: F0 03     BEQ bra_7C02
    BSR     sub_7DC5_shield_block_sfx             ; JSR -> BSR  ; orig: - D 1 - I - 0x00747F 01:7BFF: 20 C5 7D  JSR sub_7DC5_shield_
bra_7C02:  ; orig: bra_7C02:
    MOVE.B  #$50,D0  ; orig: - D 1 - I - 0x007482 01:7C02: A9 50     LDA #$50
    MOVE.B  D0,ram_state_obj(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x007484 01:7C04: 99 AC 00  STA ram_state_obj,Y
    MOVE.B  ram_04B2_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007487 01:7C07: BD B2 04  LDA ram_04B2_enemy,X
    AND.B   ram_0009_t02,D0  ; orig: - D 1 - I - 0x00748A 01:7C0A: 25 09     AND ram_0009_t02
    BNE     bra_7C68_RTS             ; BNE  ; orig: - D 1 - I - 0x00748C 01:7C0C: D0 5A     BNE bra_7C68_RTS
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00748E 01:7C0E: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t09_damage_to_enemy  ; orig: - D 1 - I - 0x007490 01:7C10: 85 07     STA ram_0007_t09_dam
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x007492 01:7C12: A9 10     LDA #$10
    MOVE.B  D0,ram_003D_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007494 01:7C14: 95 3D     STA ram_003D_enemy,X
bra_7C16:  ; orig: bra_7C16:
sub_7C16:  ; orig: sub_7C16:
    MOVE.B  ram_04B2_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007496 01:7C16: BD B2 04  LDA ram_04B2_enemy,X
    AND.B   ram_0009_t02,D0  ; orig: - D 1 - I - 0x007499 01:7C19: 25 09     AND ram_0009_t02
    BNE     bra_7C69             ; BNE  ; orig: - D 1 - I - 0x00749B 01:7C1B: D0 4C     BNE bra_7C69
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x00749D 01:7C1D: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_33,D0  ; orig: - D 1 - I - 0x0074A0 01:7C20: C9 33     CMP #con_obj_id_33
    BEQ     bra_7C28             ; BEQ  ; orig: - D 1 - I - 0x0074A2 01:7C22: F0 04     BEQ bra_7C28
    CMPI.B  #con_obj_id_34,D0  ; orig: - D 1 - I - 0x0074A4 01:7C24: C9 34     CMP #con_obj_id_34
    BNE     bra_7C2B             ; BNE  ; orig: - D 1 - I - 0x0074A6 01:7C26: D0 03     BNE bra_7C2B
bra_7C28:  ; orig: bra_7C28:

; triggers at 63155 frame 1st quest demo, when hitting some orange bat with an arrow
    JMP     loc_0x012450  ; orig: - D 1 - I - 0x0074A8 01:7C28: 4C 40 A4  JMP loc_0x012450
bra_7C2B:  ; orig: bra_7C2B:
    CMPI.B  #con_obj_id_13,D0  ; orig: - D 1 - I - 0x0074AB 01:7C2B: C9 13     CMP #con_obj_id_13
    BEQ     bra_7C33             ; BEQ  ; orig: - D 1 - I - 0x0074AD 01:7C2D: F0 04     BEQ bra_7C33
    CMPI.B  #con_obj_id_12,D0  ; orig: - D 1 - I - 0x0074AF 01:7C2F: C9 12     CMP #con_obj_id_12
    BNE     bra_7C3F             ; BNE  ; orig: - D 1 - I - 0x0074B1 01:7C31: D0 0C     BNE bra_7C3F
bra_7C33:  ; orig: bra_7C33:
    CMPI.B  #$0F,D2  ; orig: - D 1 - I - 0x0074B3 01:7C33: C0 0F     CPY #$0F
    BEQ     bra_7C54             ; BEQ  ; orig: - D 1 - I - 0x0074B5 01:7C35: F0 1D     BEQ bra_7C54
    MOVE.B  ram_dir_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0074B7 01:7C37: B9 98 00  LDA ram_dir_obj,Y
    MOVE.B  D0,ram_dir_obj(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x0074BA 01:7C3A: 95 98     STA ram_dir_obj,X
    JMP     loc_7C54  ; orig: - D 1 - I - 0x0074BC 01:7C3C: 4C 54 7C  JMP loc_7C54
bra_7C3F:  ; orig: bra_7C3F:
    CMPI.B  #con_obj_id_0B,D0  ; orig: - D 1 - I - 0x0074BF 01:7C3F: C9 0B     CMP #con_obj_id_0B
    BEQ     bra_7C47             ; BEQ  ; orig: - D 1 - I - 0x0074C1 01:7C41: F0 04     BEQ bra_7C47
    CMPI.B  #con_obj_id_0C,D0  ; orig: - D 1 - I - 0x0074C3 01:7C43: C9 0C     CMP #con_obj_id_0C
    BNE     bra_7C54             ; BNE  ; orig: - D 1 - I - 0x0074C5 01:7C45: D0 0D     BNE bra_7C54
bra_7C47:  ; orig: bra_7C47:
    MOVE.B  ram_dir_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0074C7 01:7C47: B9 98 00  LDA ram_dir_obj,Y
    ; !! ORA ram_dir_obj,X - needs manual review  ; orig: - D 1 - I - 0x0074CA 01:7C4A: 15 98     ORA ram_dir_obj,X
    CMPI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x0074CC 01:7C4C: C9 0C     CMP #con_dir__UD
    BEQ     bra_7C69             ; BEQ  ; orig: - D 1 - I - 0x0074CE 01:7C4E: F0 19     BEQ bra_7C69
    CMPI.B  #$03,D0  ; orig: - D 1 - I - 0x0074D0 01:7C50: C9 03     CMP #$03
    BEQ     bra_7C69             ; BEQ  ; orig: - D 1 - I - 0x0074D2 01:7C52: F0 15     BEQ bra_7C69
bra_7C54:  ; orig: bra_7C54:
loc_7C54:  ; orig: loc_7C54:
sub_bat_7C54:  ; orig: sub_bat_7C54:
    MOVE.B  #con_sfx_4_enemy_hit,D0  ; orig: - D 1 - I - 0x0074D4 01:7C54: A9 02     LDA #con_sfx_4_enemy
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x0074D6 01:7C56: 8D 04 06  STA ram_sfx_4
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0074D9 01:7C59: BD 85 04  LDA ram_hp_ememy - $
    CMP.B   ram_0007_t09_damage_to_enemy,D0  ; orig: - D 1 - I - 0x0074DC 01:7C5C: C5 07     CMP ram_0007_t09_dam
    BCC     bra_7C76             ; BCC  ; orig: - D 1 - I - 0x0074DE 01:7C5E: 90 16     BCC bra_7C76
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x0074E0 01:7C60: 38        SEC
    SUBX.B  ram_0007_t09_damage_to_enemy,D0  ; orig: - D 1 - I - 0x0074E1 01:7C61: E5 07     SBC ram_0007_t09_dam
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x0074E3 01:7C63: 9D 85 04  STA ram_hp_ememy - $
    BEQ     bra_7C76             ; BEQ  ; orig: - D 1 - I - 0x0074E6 01:7C66: F0 0E     BEQ bra_7C76
bra_7C68_RTS:  ; orig: bra_7C68_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0074E8 01:7C68: 60        RTS
bra_7C69:  ; orig: bra_7C69:
    MOVE.B  ram_0009_t02,D0  ; orig: - D 1 - I - 0x0074E9 01:7C69: A5 09     LDA ram_0009_t02
    CMPI.B  #$20,D0  ; orig: - D 1 - I - 0x0074EB 01:7C6B: C9 20     CMP #$20
    BEQ     bra_7C68_RTS             ; BEQ  ; orig: - D 1 - I - 0x0074ED 01:7C6D: F0 F9     BEQ bra_7C68_RTS
    CMPI.B  #$08,D0  ; orig: - D 1 - I - 0x0074EF 01:7C6F: C9 08     CMP #$08
    BEQ     bra_7C68_RTS             ; BEQ  ; orig: - D 1 - I - 0x0074F1 01:7C71: F0 F5     BEQ bra_7C68_RTS
    JMP     loc_7DC5_shield_block_sfx  ; orig: - D 1 - I - 0x0074F3 01:7C73: 4C C5 7D  JMP loc_7DC5_shield_
bra_7C76:  ; orig: bra_7C76:
    ADDQ.B  #1,ram_total_kill_cnt  ; orig: - D 1 - I - 0x0074F6 01:7C76: EE 27 06  INC ram_total_kill_c
    MOVE.B  ram_0050,D0  ; orig: - D 1 - I - 0x0074F9 01:7C79: A5 50     LDA ram_0050
    CMPI.B  #$0A,D0  ; orig: - D 1 - I - 0x0074FB 01:7C7B: C9 0A     CMP #$0A
    BCS     bra_7C8F             ; BCS  ; orig: - D 1 - I - 0x0074FD 01:7C7D: B0 10     BCS bra_7C8F
    ADDQ.B  #1,ram_0050  ; orig: - D 1 - I - 0x0074FF 01:7C7F: E6 50     INC ram_0050
    MOVE.B  ram_0050,D0  ; orig: - D 1 - I - 0x007501 01:7C81: A5 50     LDA ram_0050
    CMPI.B  #$0A,D0  ; orig: - D 1 - I - 0x007503 01:7C83: C9 0A     CMP #$0A
    BNE     bra_7C8F             ; BNE  ; orig: - D 1 - I - 0x007505 01:7C85: D0 08     BNE bra_7C8F
    MOVE.B  ram_0009_t02,D0  ; orig: - D 1 - I - 0x007507 01:7C87: A5 09     LDA ram_0009_t02
    CMPI.B  #$08,D0  ; orig: - D 1 - I - 0x007509 01:7C89: C9 08     CMP #$08
    BNE     bra_7C8F             ; BNE  ; orig: - D 1 - I - 0x00750B 01:7C8B: D0 02     BNE bra_7C8F
    ADDQ.B  #1,ram_0051  ; orig: - D 1 - I - 0x00750D 01:7C8D: E6 51     INC ram_0051
bra_7C8F:  ; orig: bra_7C8F:
    BSR     sub_0x01FEB6             ; JSR -> BSR  ; orig: - D 1 - I - 0x00750F 01:7C8F: 20 A6 FE  JSR sub_0x01FEB6
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x007512 01:7C92: A9 00     LDA #$00
    MOVE.B  D0,ram_003D_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007514 01:7C94: 95 3D     STA ram_003D_enemy,X
sub_bat_7C96:  ; orig: sub_bat_7C96:
    BSR     sub_0x01EEF6             ; JSR -> BSR  ; orig: - D 1 - I - 0x007516 01:7C96: 20 E6 EE  JSR sub_0x01EEF6
    MOVE.B  D0,ram_invinc_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007519 01:7C99: 9D F0 04  STA ram_invinc_enemy
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00751C 01:7C9C: 60        RTS



sub_7C9D:  ; orig: sub_7C9D:
sub_bat_7C9D:  ; orig: sub_bat_7C9D:
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x00751D 01:7C9D: 84 00     STY ram_0000_t2A
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x00751F 01:7C9F: A9 10     LDA #$10
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x007521 01:7CA1: 85 09     STA ram_0009_t02
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007523 01:7CA3: B9 AC 00  LDA ram_state_obj,Y
    LSR.B   #1,D0           ; LSR A  ; orig: - D 1 - I - 0x007526 01:7CA6: 4A        LSR
    BCS     bra_7CDB_RTS             ; BCS  ; orig: - D 1 - I - 0x007527 01:7CA7: B0 32     BCS bra_7CDB_RTS
    MOVE.B  #$0C,D0  ; orig: - D 1 - I - 0x007529 01:7CA9: A9 0C     LDA #$0C
    MOVE.B  D0,ram_000D_t11  ; orig: - D 1 - I - 0x00752B 01:7CAB: 85 0D     STA ram_000D_t11
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00752D 01:7CAD: B9 AC 00  LDA ram_state_obj,Y
    MOVE.B  #$20,D2  ; orig: - D 1 - I - 0x007530 01:7CB0: A0 20     LDY #$20
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x007532 01:7CB2: 0A        ASL
    BCS     bra_7CCA             ; BCS  ; orig: - D 1 - I - 0x007533 01:7CB3: B0 15     BCS bra_7CCA
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x007535 01:7CB5: A9 01     LDA #$01
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x007537 01:7CB7: 85 09     STA ram_0009_t02
    MOVE.B  #$40,D2  ; orig: - D 1 - I - 0x007539 01:7CB9: A0 40     LDY #$40
    MOVE.B  ram_item_sword,D0  ; orig: - D 1 - I - 0x00753B 01:7CBB: AD 57 06  LDA ram_item_sword
    CMPI.B  #$03,D0  ; orig: - D 1 - I - 0x00753E 01:7CBE: C9 03     CMP #$03
    BEQ     bra_7CCA             ; BEQ  ; orig: - D 1 - I - 0x007540 01:7CC0: F0 08     BEQ bra_7CCA
    MOVE.B  #$20,D2  ; orig: - D 1 - I - 0x007542 01:7CC2: A0 20     LDY #$20
    CMPI.B  #$02,D0  ; orig: - D 1 - I - 0x007544 01:7CC4: C9 02     CMP #$02
    BEQ     bra_7CCA             ; BEQ  ; orig: - D 1 - I - 0x007546 01:7CC6: F0 02     BEQ bra_7CCA
    MOVE.B  #$10,D2  ; orig: - D 1 - I - 0x007548 01:7CC8: A0 10     LDY #$10
bra_7CCA:  ; orig: bra_7CCA:
    MOVE.B  D2,D0           ; TYA  ; orig: - D 1 - I - 0x00754A 01:7CCA: 98        TYA
    BSR     sub_7D86             ; JSR -> BSR  ; orig: - D 1 - I - 0x00754B 01:7CCB: 20 86 7D  JSR sub_7D86
    MOVE.B  ram_0006_t10_flag,D0  ; orig: - D 1 - I - 0x00754E 01:7CCE: A5 06     LDA ram_0006_t10_fla
    BEQ     bra_7CDB_RTS             ; BEQ  ; orig: - D 1 - I - 0x007550 01:7CD0: F0 09     BEQ bra_7CDB_RTS
    MOVE.B  D1,D0           ; TXA  ; orig: - D 1 - I - 0x007552 01:7CD2: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - D 1 - I - 0x007553 01:7CD3: 48        PHA
    MOVE.B  #$0E,D1  ; orig: - D 1 - I - 0x007554 01:7CD4: A2 0E     LDX #$0E
    BSR     sub_0x01F3E4             ; JSR -> BSR  ; orig: - D 1 - I - 0x007556 01:7CD6: 20 D4 F3  JSR sub_0x01F3E4
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - D 1 - I - 0x007559 01:7CD9: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: - D 1 - I - 0x00755A 01:7CDA: AA        TAX
bra_7CDB_RTS:  ; orig: bra_7CDB_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00755B 01:7CDB: 60        RTS



sub_7CDC:  ; orig: sub_7CDC:
sub_bat_7CDC:  ; orig: sub_bat_7CDC:
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x00755C 01:7CDC: 84 00     STY ram_0000_t2A
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x00755E 01:7CDE: A9 20     LDA #$20
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x007560 01:7CE0: 85 09     STA ram_0009_t02
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x007562 01:7CE2: A9 10     LDA #$10
    MOVE.B  D0,ram_0007_t09_damage_to_enemy  ; orig: - D 1 - I - 0x007564 01:7CE4: 85 07     STA ram_0007_t09_dam
    MOVE.B  #$0E,D0  ; orig: - D 1 - I - 0x007566 01:7CE6: A9 0E     LDA #$0E
    MOVE.B  D0,ram_000D_t12  ; orig: - D 1 - I - 0x007568 01:7CE8: 85 0D     STA ram_000D_t12
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00756A 01:7CEA: B9 AC 00  LDA ram_state_obj,Y
    CMPI.B  #$20,D0  ; orig: - D 1 - I - 0x00756D 01:7CED: C9 20     CMP #$20
    BCS     bra_7D01             ; BCS  ; orig: - D 1 - I - 0x00756F 01:7CEF: B0 10     BCS bra_7D01
    CMPI.B  #$13,D0  ; orig: - D 1 - I - 0x007571 01:7CF1: C9 13     CMP #$13
    BNE     bra_7D25_RTS             ; BNE  ; orig: - D 1 - I - 0x007573 01:7CF3: D0 30     BNE bra_7D25_RTS
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x007575 01:7CF5: A9 08     LDA #$08
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x007577 01:7CF7: 85 09     STA ram_0009_t02
    MOVE.B  #$40,D0  ; orig: - D 1 - I - 0x007579 01:7CF9: A9 40     LDA #$40
    MOVE.B  D0,ram_0007_t09_damage_to_enemy  ; orig: - D 1 - I - 0x00757B 01:7CFB: 85 07     STA ram_0007_t09_dam
    MOVE.B  #$18,D0  ; orig: - D 1 - I - 0x00757D 01:7CFD: A9 18     LDA #$18
    MOVE.B  D0,ram_000D_t12  ; orig: - D 1 - I - 0x00757F 01:7CFF: 85 0D     STA ram_000D_t12
bra_7D01:  ; orig: bra_7D01:
    MOVE.B  ram_pos_X_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007581 01:7D01: B9 70 00  LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007584 01:7D04: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007585 01:7D05: 69 08     ADC #$08
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: - D 1 - I - 0x007587 01:7D07: 85 04     STA ram_0004_t10_pos
    MOVE.B  ram_pos_Y_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007589 01:7D09: B9 84 00  LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00758C 01:7D0C: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00758D 01:7D0D: 69 08     ADC #$08
    MOVE.B  D0,ram_0005_t08_pos_Y  ; orig: - D 1 - I - 0x00758F 01:7D0F: 85 05     STA ram_0005_t08_pos
    MOVE.B  ram_000D_t12,D0  ; orig: - D 1 - I - 0x007591 01:7D11: A5 0D     LDA ram_000D_t12
    BSR     sub_7DFB             ; JSR -> BSR  ; orig: - D 1 - I - 0x007593 01:7D13: 20 FB 7D  JSR sub_7DFB
    BEQ     bra_7D25_RTS             ; BEQ  ; orig: - D 1 - I - 0x007596 01:7D16: F0 0D     BEQ bra_7D25_RTS
    BSR     sub_7C16             ; JSR -> BSR  ; orig: - D 1 - I - 0x007598 01:7D18: 20 16 7C  JSR sub_7C16
    MOVE.B  ram_04B2_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00759B 01:7D1B: BD B2 04  LDA ram_04B2_enemy,X
    AND.B   ram_0009_t02,D0  ; orig: - D 1 - I - 0x00759E 01:7D1E: 25 09     AND ram_0009_t02
    BNE     bra_7D25_RTS             ; BNE  ; orig: - D 1 - I - 0x0075A0 01:7D20: D0 03     BNE bra_7D25_RTS

; bzk optimize, JMP
    BSR     sub_7E26             ; JSR -> BSR  ; orig: - D 1 - I - 0x0075A2 01:7D22: 20 26 7E  JSR sub_7E26
bra_7D25_RTS:  ; orig: bra_7D25_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0075A5 01:7D25: 60        RTS



tbl_7D26:  ; orig: tbl_7D26:
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - I - 0x0075A6 01:7D26: 10        .byte $10   ; wooden
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 1 - I - 0x0075A7 01:7D27: 20        .byte $20   ; white
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 1 - I - 0x0075A8 01:7D28: 40        .byte $40   ; magica



sub_7D29:  ; orig: sub_7D29:
sub_bat_7D29:  ; orig: sub_bat_7D29:
loc_bat_7D29:  ; orig: loc_bat_7D29:
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x0075A9 01:7D29: 84 00     STY ram_0000_t2A
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x0075AB 01:7D2B: A9 01     LDA #$01
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x0075AD 01:7D2D: 85 09     STA ram_0009_t02
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0075AF 01:7D2F: B9 AC 00  LDA ram_state_obj,Y
    CMPI.B  #$02,D0  ; orig: - D 1 - I - 0x0075B2 01:7D32: C9 02     CMP #$02
    BNE     bra_7D25_RTS             ; BNE  ; orig: - D 1 - I - 0x0075B4 01:7D34: D0 EF     BNE bra_7D25_RTS
    MOVE.B  ram_item_sword,D2  ; orig: - D 1 - I - 0x0075B6 01:7D36: AC 57 06  LDY ram_item_sword
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x0075B9 01:7D39: B9 25 7D  LDA tbl_7D26 - $01,Y
bra_7D3C:  ; orig: bra_7D3C:
    MOVE.B  D0,ram_0007_t09_damage_to_enemy  ; orig: - D 1 - I - 0x0075BC 01:7D3C: 85 07     STA ram_0007_t09_dam
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x0075BE 01:7D3E: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x0075C0 01:7D40: 29 0C     AND #con_dir__UD
    BEQ     bra_7D4D             ; BEQ  ; orig: - D 1 - I - 0x0075C2 01:7D42: F0 09     BEQ bra_7D4D
    MOVE.B  #$0C,D0  ; orig: - D 1 - I - 0x0075C4 01:7D44: A9 0C     LDA #$0C
    MOVE.B  D0,ram_000D_t11  ; orig: - D 1 - I - 0x0075C6 01:7D46: 85 0D     STA ram_000D_t11
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x0075C8 01:7D48: A9 10     LDA #$10
    JMP     loc_7D53  ; orig: - D 1 - I - 0x0075CA 01:7D4A: 4C 53 7D  JMP loc_7D53
bra_7D4D:  ; orig: bra_7D4D:
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x0075CD 01:7D4D: A9 10     LDA #$10
    MOVE.B  D0,ram_000D_t11  ; orig: - D 1 - I - 0x0075CF 01:7D4F: 85 0D     STA ram_000D_t11
    MOVE.B  #$0C,D0  ; orig: - D 1 - I - 0x0075D1 01:7D51: A9 0C     LDA #$0C
loc_7D53:  ; orig: loc_7D53:
    MOVE.B  D0,ram_000E_t05  ; orig: - D 1 - I - 0x0075D3 01:7D53: 85 0E     STA ram_000E_t05
    BSR     sub_7DD1             ; JSR -> BSR  ; orig: - D 1 - I - 0x0075D5 01:7D55: 20 D1 7D  JSR sub_7DD1
    MOVE.B  ram_0006_t10_flag,D0  ; orig: - D 1 - I - 0x0075D8 01:7D58: A5 06     LDA ram_0006_t10_fla
    BEQ     bra_7D25_RTS             ; BEQ  ; orig: - D 1 - I - 0x0075DA 01:7D5A: F0 C9     BEQ bra_7D25_RTS
    JMP     loc_7DAA  ; orig: - D 1 - I - 0x0075DC 01:7D5C: 4C AA 7D  JMP loc_7DAA



sub_7D5F:  ; orig: sub_7D5F:
sub_bat_7D5F:  ; orig: sub_bat_7D5F:
    MOVE.B  D2,ram_0000_t2A  ; orig: - D 1 - I - 0x0075DF 01:7D5F: 84 00     STY ram_0000_t2A
    MOVE.B  ram_state_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0075E1 01:7D61: B9 AC 00  LDA ram_state_obj,Y
    CMPI.B  #$30,D0  ; orig: - D 1 - I - 0x0075E4 01:7D64: C9 30     CMP #$30
    BCC     bra_7D70             ; BCC  ; orig: - D 1 - I - 0x0075E6 01:7D66: 90 08     BCC bra_7D70
    MOVE.B  #$01,D0  ; orig: - D 1 - I - 0x0075E8 01:7D68: A9 01     LDA #$01
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x0075EA 01:7D6A: 85 09     STA ram_0009_t02
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x0075EC 01:7D6C: A9 20     LDA #$20
    BNE     bra_7D3C             ; BNE  ; orig: - D 1 - I - 0x0075EE 01:7D6E: D0 CC     BNE bra_7D3C    ; jm
bra_7D70:  ; orig: bra_7D70:
    CMPI.B  #$20,D0  ; orig: - D 1 - I - 0x0075F0 01:7D70: C9 20     CMP #$20
    BCS     bra_7DCA_RTS             ; BCS  ; orig: - D 1 - I - 0x0075F2 01:7D72: B0 56     BCS bra_7DCA_RTS
    MOVE.B  #$04,D0  ; orig: - D 1 - I - 0x0075F4 01:7D74: A9 04     LDA #$04
    MOVE.B  D0,ram_0009_t02  ; orig: - D 1 - I - 0x0075F6 01:7D76: 85 09     STA ram_0009_t02
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x0075F8 01:7D78: A9 20     LDA #$20
    MOVE.B  ram_item_arrow,D2  ; orig: - D 1 - I - 0x0075FA 01:7D7A: AC 59 06  LDY ram_item_arrow
    CMPI.B  #$01,D2  ; orig: - D 1 - I - 0x0075FD 01:7D7D: C0 01     CPY #$01
    BEQ     bra_7D82             ; BEQ  ; orig: - D 1 - I - 0x0075FF 01:7D7F: F0 01     BEQ bra_7D82
    ASL.B   #1,D0           ; ASL A  ; orig: - D 1 - I - 0x007601 01:7D81: 0A        ASL
bra_7D82:  ; orig: bra_7D82:
    MOVE.B  #$0B,D2  ; orig: - D 1 - I - 0x007602 01:7D82: A0 0B     LDY #$0B
    MOVE.B  D2,ram_000D_t11  ; orig: - D 1 - I - 0x007604 01:7D84: 84 0D     STY ram_000D_t11
sub_7D86:  ; orig: sub_7D86:
    BSR     sub_7DCB             ; JSR -> BSR  ; orig: - D 1 - I - 0x007606 01:7D86: 20 CB 7D  JSR sub_7DCB
    MOVE.B  ram_0006_t10_flag,D0  ; orig: - D 1 - I - 0x007609 01:7D89: A5 06     LDA ram_0006_t10_fla
    BEQ     bra_7DCA_RTS             ; BEQ  ; orig: - D 1 - I - 0x00760B 01:7D8B: F0 3D     BEQ bra_7DCA_RTS
    CMPI.B  #$12,D2  ; orig: - D 1 - I - 0x00760D 01:7D8D: C0 12     CPY #$12
    BNE     bra_7DAA             ; BNE  ; orig: - D 1 - I - 0x00760F 01:7D8F: D0 19     BNE bra_7DAA
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007611 01:7D91: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_16,D0  ; orig: - D 1 - I - 0x007614 01:7D94: C9 16     CMP #con_obj_id_16
    BNE     bra_7DA0             ; BNE  ; orig: - D 1 - I - 0x007616 01:7D96: D0 08     BNE bra_7DA0
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x007618 01:7D98: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: - D 1 - I - 0x00761A 01:7D9A: 9D 85 04  STA ram_hp_ememy - $
    JMP     loc_7C54  ; orig: - D 1 - I - 0x00761D 01:7D9D: 4C 54 7C  JMP loc_7C54
bra_7DA0:  ; orig: bra_7DA0:
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x007620 01:7DA0: A9 20     LDA #$20
    MOVE.B  D0,ram_state_obj(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x007622 01:7DA2: 99 AC 00  STA ram_state_obj,Y
    MOVE.B  #$03,D0  ; orig: - D 1 - I - 0x007625 01:7DA5: A9 03     LDA #$03
    MOVE.B  D0,ram_anim_timer_obj(D2.L)  ; STA abs,Y  ; orig: - D 1 - I - 0x007627 01:7DA7: 99 D0 03  STA ram_anim_timer_o
loc_7DAA:  ; orig: loc_7DAA:
bra_7DAA:  ; orig: bra_7DAA:
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x00762A 01:7DAA: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_0B,D0  ; orig: - D 1 - I - 0x00762D 01:7DAD: C9 0B     CMP #con_obj_id_0B
    BEQ     bra_7DB5             ; BEQ  ; orig: - D 1 - I - 0x00762F 01:7DAF: F0 04     BEQ bra_7DB5
    CMPI.B  #con_obj_id_0C,D0  ; orig: - D 1 - I - 0x007631 01:7DB1: C9 0C     CMP #con_obj_id_0C
    BNE     bra_7DC2             ; BNE  ; orig: - D 1 - I - 0x007633 01:7DB3: D0 0D     BNE bra_7DC2
bra_7DB5:  ; orig: bra_7DB5:
    MOVE.B  ram_dir_obj(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007635 01:7DB5: B9 98 00  LDA ram_dir_obj,Y
    ; !! ORA ram_dir_obj,X - needs manual review  ; orig: - D 1 - I - 0x007638 01:7DB8: 15 98     ORA ram_dir_obj,X
    CMPI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x00763A 01:7DBA: C9 0C     CMP #con_dir__UD
    BEQ     bra_7DC5_shield_block_sfx             ; BEQ  ; orig: - D 1 - I - 0x00763C 01:7DBC: F0 07     BEQ bra_7DC5_shield_
    CMPI.B  #con_dir__LR,D0  ; orig: - D 1 - I - 0x00763E 01:7DBE: C9 03     CMP #con_dir__LR
    BEQ     bra_7DC5_shield_block_sfx             ; BEQ  ; orig: - D 1 - I - 0x007640 01:7DC0: F0 03     BEQ bra_7DC5_shield_
bra_7DC2:  ; orig: bra_7DC2:
    JMP     loc_7E26  ; orig: - D 1 - I - 0x007642 01:7DC2: 4C 26 7E  JMP loc_7E26
sub_7DC5_shield_block_sfx:  ; orig: sub_7DC5_shield_block_sfx:
loc_7DC5_shield_block_sfx:  ; orig: loc_7DC5_shield_block_sfx:
bra_7DC5_shield_block_sfx:  ; orig: bra_7DC5_shield_block_sfx:
    MOVE.B  #con_sfx_4_shield_block,D0  ; orig: - D 1 - I - 0x007645 01:7DC5: A9 01     LDA #con_sfx_4_shiel
    MOVE.B  D0,ram_sfx_4  ; orig: - D 1 - I - 0x007647 01:7DC7: 8D 04 06  STA ram_sfx_4
bra_7DCA_RTS:  ; orig: bra_7DCA_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00764A 01:7DCA: 60        RTS



sub_7DCB:  ; orig: sub_7DCB:

; in

; A =

; ram_0000_t2A
    MOVE.B  D0,ram_0007_t09_damage_to_enemy  ; orig: - D 1 - I - 0x00764B 01:7DCB: 85 07     STA ram_0007_t09_dam
    MOVE.B  ram_000D_t11,D0  ; orig: - D 1 - I - 0x00764D 01:7DCD: A5 0D     LDA ram_000D_t11
    MOVE.B  D0,ram_000E_t05  ; orig: - D 1 - I - 0x00764F 01:7DCF: 85 0E     STA ram_000E_t05
sub_7DD1:  ; orig: sub_7DD1:

; in

; ram_0000_t2A
    MOVE.B  ram_0000_t2A,D2  ; orig: - D 1 - I - 0x007651 01:7DD1: A4 00     LDY ram_0000_t2A
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x007653 01:7DD3: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__UD,D0  ; orig: - D 1 - I - 0x007655 01:7DD5: 29 0C     AND #con_dir__UD
    BEQ     bra_7DEA             ; BEQ  ; orig: - D 1 - I - 0x007657 01:7DD7: F0 11     BEQ bra_7DEA
    MOVE.B  ram_pos_X_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007659 01:7DD9: B9 70 00  LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00765C 01:7DDC: 18        CLC
    ADDX.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00765D 01:7DDD: 69 06     ADC #$06
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: - D 1 - I - 0x00765F 01:7DDF: 85 04     STA ram_0004_t10_pos
    MOVE.B  ram_pos_Y_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007661 01:7DE1: B9 84 00  LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007664 01:7DE4: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007665 01:7DE5: 69 08     ADC #$08
    JMP     loc_7DF8  ; orig: - D 1 - I - 0x007667 01:7DE7: 4C F8 7D  JMP loc_7DF8
bra_7DEA:  ; orig: bra_7DEA:
    MOVE.B  ram_pos_X_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00766A 01:7DEA: B9 70 00  LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x00766D 01:7DED: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x00766E 01:7DEE: 69 08     ADC #$08
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: - D 1 - I - 0x007670 01:7DF0: 85 04     STA ram_0004_t10_pos
    MOVE.B  ram_pos_Y_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x007672 01:7DF2: B9 84 00  LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: - D 1 - I - 0x007675 01:7DF5: 18        CLC
    ADDX.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: - D 1 - I - 0x007676 01:7DF6: 69 06     ADC #$06
loc_7DF8:  ; orig: loc_7DF8:

; bzk optimize, JMP into JMP
    JMP     loc_7BE2  ; orig: - D 1 - I - 0x007678 01:7DF8: 4C E2 7B  JMP loc_7BE2



sub_7DFB:  ; orig: sub_7DFB:
sub_bat_7DFB:  ; orig: sub_bat_7DFB:
loc_bat_7DFB:  ; orig: loc_bat_7DFB:

; in

; A =

; ram_0000_t2A

; out

; ram_000B_t04

; Z

; 0 =

; 1 =
    MOVE.B  D0,ram_000D_t11  ; orig: - D 1 - I - 0x00767B 01:7DFB: 85 0D     STA ram_000D_t11
    MOVE.B  D0,ram_000E_t05  ; orig: - D 1 - I - 0x00767D 01:7DFD: 85 0E     STA ram_000E_t05
sub_7DFF:  ; orig: sub_7DFF:

; in

; ram_0000_t2A

; ram_000D_t11

; ram_000E_t05

; out

; ram_000B_t04

; Z

; 0 =

; 1 =
    MOVE.B  #$00,D0  ; orig: - D 1 - I - 0x00767F 01:7DFF: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t10_flag  ; orig: - D 1 - I - 0x007681 01:7E01: 85 06     STA ram_0006_t10_fla
    MOVE.B  ram_0000_t2A,D2  ; orig: - D 1 - I - 0x007683 01:7E03: A4 00     LDY ram_0000_t2A
    MOVE.B  ram_0002_t34_pos_X,D0  ; orig: - D 1 - I - 0x007685 01:7E05: A5 02     LDA ram_0002_t34_pos
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x007687 01:7E07: 38        SEC
    SUBX.B  ram_0004_t10_pos_X,D0  ; orig: - D 1 - I - 0x007688 01:7E08: E5 04     SBC ram_0004_t10_pos
    BSR     sub_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: - D 1 - I - 0x00768A 01:7E0A: 20 1F 70  JSR sub_701F_EOR_FF_

; bzk optimize, useless STA
    MOVE.B  D0,ram_000A_t14_useless  ; orig: - D 1 - I - 0x00768D 01:7E0D: 85 0A     STA ram_000A_t14_use
    CMP.B   ram_000D_t11,D0  ; orig: - D 1 - I - 0x00768F 01:7E0F: C5 0D     CMP ram_000D_t11
    BCS     bra_7E23             ; BCS  ; orig: - D 1 - I - 0x007691 01:7E11: B0 10     BCS bra_7E23
    MOVE.B  ram_0003_t21_pos_Y,D0  ; orig: - D 1 - I - 0x007693 01:7E13: A5 03     LDA ram_0003_t21_pos
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - D 1 - I - 0x007695 01:7E15: 38        SEC
    SUBX.B  ram_0005_t08_pos_Y,D0  ; orig: - D 1 - I - 0x007696 01:7E16: E5 05     SBC ram_0005_t08_pos
    BSR     sub_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: - D 1 - I - 0x007698 01:7E18: 20 1F 70  JSR sub_701F_EOR_FF_
    MOVE.B  D0,ram_000B_t04  ; orig: - D 1 - I - 0x00769B 01:7E1B: 85 0B     STA ram_000B_t04
    CMP.B   ram_000E_t05,D0  ; orig: - D 1 - I - 0x00769D 01:7E1D: C5 0E     CMP ram_000E_t05
    BCS     bra_7E23             ; BCS  ; orig: - D 1 - I - 0x00769F 01:7E1F: B0 02     BCS bra_7E23
    ADDQ.B  #1,ram_0006_t10_flag  ; orig: - D 1 - I - 0x0076A1 01:7E21: E6 06     INC ram_0006_t10_fla
bra_7E23:  ; orig: bra_7E23:
    MOVE.B  ram_0006_t10_flag,D0  ; orig: - D 1 - I - 0x0076A3 01:7E23: A5 06     LDA ram_0006_t10_fla
    RTS                     ; RTS  ; orig: - D 1 - I - 0x0076A5 01:7E25: 60        RTS



sub_7E26:  ; orig: sub_7E26:
loc_7E26:  ; orig: loc_7E26:
sub_bat_7E26:  ; orig: sub_bat_7E26:

; in

; ram_0000_t2A

; ram_000B_t04
    MOVE.B  ram_0000_t2A,D2  ; orig: - D 1 - I - 0x0076A6 01:7E26: A4 00     LDY ram_0000_t2A
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x0076A8 01:7E28: E0 0D     CPX #$0D
    BCS     bra_7E33             ; BCS  ; orig: - D 1 - I - 0x0076AA 01:7E2A: B0 07     BCS bra_7E33
    MOVE.B  ram_04B2_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0076AC 01:7E2C: BD B2 04  LDA ram_04B2_enemy,X
    AND.B   ram_0009_t02,D0  ; orig: - D 1 - I - 0x0076AF 01:7E2F: 25 09     AND ram_0009_t02
    BNE     bra_7E9D_RTS             ; BNE  ; orig: - D 1 - I - 0x0076B1 01:7E31: D0 6A     BNE bra_7E9D_RTS
bra_7E33:  ; orig: bra_7E33:
    MOVE.B  #$08,D0  ; orig: - D 1 - I - 0x0076B3 01:7E33: A9 08     LDA #$08
    MOVE.B  D0,ram_0008_t08  ; orig: - D 1 - I - 0x0076B5 01:7E35: 85 08     STA ram_0008_t08
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0076B7 01:7E37: B5 84     LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0004_t25_pos_1  ; orig: - D 1 - I - 0x0076B9 01:7E39: 85 04     STA ram_0004_t25_pos
    MOVE.B  ram_pos_Y_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0076BB 01:7E3B: B9 84 00  LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0005_t02_pos_2  ; orig: - D 1 - I - 0x0076BE 01:7E3E: 85 05     STA ram_0005_t02_pos
    CMPI.B  #$00,D2  ; orig: - D 1 - I - 0x0076C0 01:7E40: C0 00     CPY #$00
    BNE     bra_7E51             ; BNE  ; orig: - D 1 - I - 0x0076C2 01:7E42: D0 0D     BNE bra_7E51
    MOVE.B  ram_0394_link,D0  ; orig: - D 1 - I - 0x0076C4 01:7E44: AD 94 03  LDA ram_0394_link
    BEQ     bra_7E51             ; BEQ  ; orig: - D 1 - I - 0x0076C7 01:7E47: F0 08     BEQ bra_7E51
    MOVE.B  ram_dir_link,D0  ; orig: - D 1 - I - 0x0076C9 01:7E49: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__LR,D0  ; orig: - D 1 - I - 0x0076CB 01:7E4B: 29 03     AND #con_dir__LR
    BNE     bra_7E57             ; BNE  ; orig: - D 1 - I - 0x0076CD 01:7E4D: D0 08     BNE bra_7E57
    BEQ     bra_7E64             ; BEQ  ; orig: - D 1 - I - 0x0076CF 01:7E4F: F0 13     BEQ bra_7E64    ; jm
bra_7E51:  ; orig: bra_7E51:
    MOVE.B  ram_000B_t04,D0  ; orig: - D 1 - I - 0x0076D1 01:7E51: A5 0B     LDA ram_000B_t04
    CMPI.B  #$04,D0  ; orig: - D 1 - I - 0x0076D3 01:7E53: C9 04     CMP #$04
    BCS     bra_7E64             ; BCS  ; orig: - D 1 - I - 0x0076D5 01:7E55: B0 0D     BCS bra_7E64
bra_7E57:  ; orig: bra_7E57:
    MOVE.B  #$02,D0  ; orig: - D 1 - I - 0x0076D7 01:7E57: A9 02     LDA #$02
    MOVE.B  D0,ram_0008_t08  ; orig: - D 1 - I - 0x0076D9 01:7E59: 85 08     STA ram_0008_t08
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x0076DB 01:7E5B: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0004_t25_pos_1  ; orig: - D 1 - I - 0x0076DD 01:7E5D: 85 04     STA ram_0004_t25_pos
    MOVE.B  ram_pos_X_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x0076DF 01:7E5F: B9 70 00  LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0005_t02_pos_2  ; orig: - D 1 - I - 0x0076E2 01:7E62: 85 05     STA ram_0005_t02_pos
bra_7E64:  ; orig: bra_7E64:
    MOVE.B  ram_0004_t25_pos_1,D0  ; orig: - D 1 - I - 0x0076E4 01:7E64: A5 04     LDA ram_0004_t25_pos
    CMP.B   ram_0005_t02_pos_2,D0  ; orig: - D 1 - I - 0x0076E6 01:7E66: C5 05     CMP ram_0005_t02_pos
    BCS     bra_7E6C             ; BCS  ; orig: - D 1 - I - 0x0076E8 01:7E68: B0 02     BCS bra_7E6C
    LSR.B   #1,ram_0008_t08  ; orig: - D 1 - I - 0x0076EA 01:7E6A: 46 08     LSR ram_0008_t08
bra_7E6C:  ; orig: bra_7E6C:
    CMPI.B  #$00,D2  ; orig: - D 1 - I - 0x0076EC 01:7E6C: C0 00     CPY #$00
    BNE     bra_7E9E             ; BNE  ; orig: - D 1 - I - 0x0076EE 01:7E6E: D0 2E     BNE bra_7E9E
    MOVE.B  ram_invinc_link,D0  ; orig: - D 1 - I - 0x0076F0 01:7E70: AD F0 04  LDA ram_invinc_link
    BNE     bra_7E9D_RTS             ; BNE  ; orig: - D 1 - I - 0x0076F3 01:7E73: D0 28     BNE bra_7E9D_RTS
    MOVE.B  ram_0008_t08,D0  ; orig: - D 1 - I - 0x0076F5 01:7E75: A5 08     LDA ram_0008_t08
    ORI.B   #$80,D0  ; orig: - D 1 - I - 0x0076F7 01:7E77: 09 80     ORA #$80
    MOVE.B  D0,ram_00C0_link  ; orig: - D 1 - I - 0x0076F9 01:7E79: 85 C0     STA ram_00C0_link
    MOVE.B  #$18,D0  ; orig: - D 1 - I - 0x0076FB 01:7E7B: A9 18     LDA #$18
    MOVE.B  D0,ram_invinc_link  ; orig: - D 1 - I - 0x0076FD 01:7E7D: 8D F0 04  STA ram_invinc_link
    MOVE.B  #$20,D0  ; orig: - D 1 - I - 0x007700 01:7E80: A9 20     LDA #$20
    MOVE.B  D0,ram_00D3_link  ; orig: - D 1 - I - 0x007702 01:7E82: 85 D3     STA ram_00D3_link
    CMPI.B  #$0D,D1  ; orig: - D 1 - I - 0x007704 01:7E84: E0 0D     CPX #$0D
    BCS     bra_7E9D_RTS             ; BCS  ; orig: - D 1 - I - 0x007706 01:7E86: B0 15     BCS bra_7E9D_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007708 01:7E88: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_80,D0  ; orig: - D 1 - I - 0x00770B 01:7E8B: 29 80     AND #con_04C0_80
    BNE     bra_7E9D_RTS             ; BNE  ; orig: - D 1 - I - 0x00770D 01:7E8D: D0 0E     BNE bra_7E9D_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x00770F 01:7E8F: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_12,D0  ; orig: - D 1 - I - 0x007712 01:7E92: C9 12     CMP #con_obj_id_12
    BEQ     bra_7E9D_RTS             ; BEQ  ; orig: - D 1 - I - 0x007714 01:7E94: F0 07     BEQ bra_7E9D_RTS
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007716 01:7E96: B5 98     LDA ram_dir_enemy,X
    BSR     sub_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: - D 1 - I - 0x007718 01:7E98: 20 13 70  JSR sub_7013_get_Y_f
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00771B 01:7E9B: 95 98     STA ram_dir_enemy,X
bra_7E9D_RTS:  ; orig: bra_7E9D_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x00771D 01:7E9D: 60        RTS
bra_7E9E:  ; orig: bra_7E9E:
    MOVE.B  ram_dir_enemy(D2.L),D0  ; LDA abs,Y  ; orig: - D 1 - I - 0x00771E 01:7E9E: B9 98 00  LDA ram_dir_enemy,Y
    MOVE.B  D0,ram_0008_t09  ; orig: - D 1 - I - 0x007721 01:7EA1: 85 08     STA ram_0008_t09
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007723 01:7EA3: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_80,D0  ; orig: - D 1 - I - 0x007726 01:7EA6: 29 80     AND #con_04C0_80
    BEQ     bra_7EB0             ; BEQ  ; orig: - D 1 - I - 0x007728 01:7EA8: F0 06     BEQ bra_7EB0
    MOVE.B  ram_0008_t09,D0  ; orig: - D 1 - I - 0x00772A 01:7EAA: A5 08     LDA ram_0008_t09
    ORI.B   #$40,D0  ; orig: - D 1 - I - 0x00772C 01:7EAC: 09 40     ORA #$40
    MOVE.B  D0,ram_0008_t09  ; orig: - D 1 - I - 0x00772E 01:7EAE: 85 08     STA ram_0008_t09
bra_7EB0:  ; orig: bra_7EB0:
    MOVE.B  ram_invinc_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x007730 01:7EB0: BD F0 04  LDA ram_invinc_enemy
    BNE     bra_7EE0_RTS             ; BNE  ; orig: - D 1 - I - 0x007733 01:7EB3: D0 2B     BNE bra_7EE0_RTS
    ; (empty translation for LDA)  ; orig: - D 1 - I - 0x007735 01:7EB5: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_33,D0  ; orig: - D 1 - I - 0x007738 01:7EB8: C9 33     CMP #con_obj_id_33
    BEQ     bra_7EC0             ; BEQ  ; orig: - D 1 - I - 0x00773A 01:7EBA: F0 04     BEQ bra_7EC0
    CMPI.B  #con_obj_id_34,D0  ; orig: - D 1 - I - 0x00773C 01:7EBC: C9 34     CMP #con_obj_id_34
    BNE     bra_7ED1             ; BNE  ; orig: - D 1 - I - 0x00773E 01:7EBE: D0 11     BNE bra_7ED1
bra_7EC0:  ; orig: bra_7EC0:
    MOVE.B  ram_000F_t05,D0  ; orig: - D 1 - I - 0x007740 01:7EC0: A5 0F     LDA ram_000F_t05
    CMPI.B  #$03,D0  ; orig: - D 1 - I - 0x007742 01:7EC2: C9 03     CMP #$03
    BEQ     bra_7ECA             ; BEQ  ; orig: - D 1 - I - 0x007744 01:7EC4: F0 04     BEQ bra_7ECA
    CMPI.B  #$04,D0  ; orig: - D 1 - I - 0x007746 01:7EC6: C9 04     CMP #$04
    BNE     bra_7EE0_RTS             ; BNE  ; orig: - D 1 - I - 0x007748 01:7EC8: D0 16     BNE bra_7EE0_RTS
bra_7ECA:  ; orig: bra_7ECA:
    MOVE.B  ram_046B_enemy(D1.L),D0  ; LDA abs,X  ; orig: - D 1 - I - 0x00774A 01:7ECA: BD 6B 04  LDA ram_046B_enemy,X
    CMPI.B  #$03,D0  ; orig: - D 1 - I - 0x00774D 01:7ECD: C9 03     CMP #$03
    BNE     bra_7EE0_RTS             ; BNE  ; orig: - D 1 - I - 0x00774F 01:7ECF: D0 0F     BNE bra_7EE0_RTS
bra_7ED1:  ; orig: bra_7ED1:
    MOVE.B  ram_0008_t09,D0  ; orig: - D 1 - I - 0x007751 01:7ED1: A5 08     LDA ram_0008_t09
    ORI.B   #$80,D0  ; orig: - D 1 - I - 0x007753 01:7ED3: 09 80     ORA #$80
    MOVE.B  D0,ram_00C0_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007755 01:7ED5: 95 C0     STA ram_00C0_enemy,X
    MOVE.B  #$40,D0  ; orig: - D 1 - I - 0x007757 01:7ED7: A9 40     LDA #$40
    MOVE.B  D0,ram_00D3_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x007759 01:7ED9: 95 D3     STA ram_00D3_enemy,X
    MOVE.B  #$10,D0  ; orig: - D 1 - I - 0x00775B 01:7EDB: A9 10     LDA #$10
    MOVE.B  D0,ram_invinc_enemy(D1.L)  ; STA abs,X  ; orig: - D 1 - I - 0x00775D 01:7EDD: 9D F0 04  STA ram_invinc_enemy
bra_7EE0_RTS:  ; orig: bra_7EE0_RTS:
    RTS                     ; RTS  ; orig: - D 1 - I - 0x007760 01:7EE0: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x007761 01:7EE1: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x007767 01:7EE7: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x00776F 01:7EEF: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - D 1 - I - 0x007777 01:7EF7: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - I - 0x00777F 01:7EFF: FF        .byte $FF   ;




; ── Translation Stats ──
; Translated:  1707
; Warnings:    1061
; Unknown:     5