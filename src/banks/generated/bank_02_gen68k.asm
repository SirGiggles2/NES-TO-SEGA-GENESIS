; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; Source: bank_02.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_02"  -- needs manual handling  ; orig: .segment "BANK_02"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $8000  -- needs manual handling  ; orig: .org $8000  ; for listing file

; 0x008010-0x00C00F



    ; [DIRECTIVE] .EXPORT loc_0x008022_fill_ppu_with_tiles_1  -- needs manual handling  ; orig: .export loc_0x008022_fill_ppu_with_tiles_1
    ; [DIRECTIVE] .EXPORT loc_0x009010  -- needs manual handling  ; orig: .export loc_0x009010
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x009030_00_title_screen  -- needs manual handling  ; orig: .export ofs_main_script_2_0x009030_00_title_screen
    ; [DIRECTIVE] .EXPORT loc_0x009E21  -- needs manual handling  ; orig: .export loc_0x009E21
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x009F00_0E_register  -- needs manual handling  ; orig: .export ofs_main_script_2_0x009F00_0E_register
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x009FD5_0F_elimination  -- needs manual handling  ; orig: .export ofs_main_script_2_0x009FD5_0F_elimination
    ; [DIRECTIVE] .EXPORT loc_0x00A29A  -- needs manual handling  ; orig: .export loc_0x00A29A
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x00A5A1_01_slot_selection  -- needs manual handling  ; orig: .export ofs_main_script_2_0x00A5A1_01_slot_selection
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x00A6BD_0D  -- needs manual handling  ; orig: .export ofs_main_script_2_0x00A6BD_0D
    ; [DIRECTIVE] .EXPORT loc_0x00A910_final_credits_handler  -- needs manual handling  ; orig: .export loc_0x00A910_final_credits_handler
    ; [DIRECTIVE] .EXPORT ofs_main_script_2_0x00AA20_13_final_credits  -- needs manual handling  ; orig: .export ofs_main_script_2_0x00AA20_13_final_credits



tbl_8000_tiles:  ; orig: tbl_8000_tiles:
    ; The translated uploader indexes these as raw bytes, so keep NES little-endian order.
    DC.B    $7F,$80,$7F,$87,$7F,$8E



tbl_8006_counter:  ; orig: tbl_8006_counter:
    ; The uploader reads these through zp low/high bytes, so keep little-endian order.
    DC.B    $00,$07,$00,$07,$E0,$00



tbl_800C_ppu_ppu_addr:  ; orig: tbl_800C_ppu_ppu_addr:
    DC.B    $00,$00,$00,$10,$20,$1F



loc_0x008022_fill_ppu_with_tiles_1:  ; orig: loc_0x008022_fill_ppu_with_tiles_1:
    MOVE.W  #$0410,D0
    BSR     TRACE_MARK
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C D 0 - - - 0x008022 02:8012: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C - - - - - 0x008025 02:8015: AD 02 20  LDA $2002
bra_8018_loop:  ; orig: bra_8018_loop:
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x008028 02:8018: AD 1D 05  LDA ram_051D
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00802B 02:801B: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00802C 02:801C: AA        TAX
    MOVE.B  tbl_8000_tiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00802D 02:801D: BD 00 80  LDA tbl_8000_tiles,X
    MOVE.B  D0,ram_0000_t10_tiles_data  ; orig: C - - - - - 0x008030 02:8020: 85 00     STA ram_0000_t10_til
    MOVE.B  tbl_8006_counter(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x008032 02:8022: BD 06 80  LDA tbl_8006_counter
    MOVE.B  D0,ram_0002_t13_counter_lo  ; orig: C - - - - - 0x008035 02:8025: 85 02     STA ram_0002_t13_cou
    MOVE.B  tbl_800C_ppu_ppu_addr(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x008037 02:8027: BD 0C 80  LDA tbl_800C_ppu_ppu
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x00803A 02:802A: 8D 06 20  STA $2006
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00803D 02:802D: E8        INX
    MOVE.B  tbl_8000_tiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00803E 02:802E: BD 00 80  LDA tbl_8000_tiles,X
    MOVE.B  D0,ram_0001_t10  ; orig: C - - - - - 0x008041 02:8031: 85 01     STA ram_0000_t10_til
    MOVE.B  tbl_8006_counter(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x008043 02:8033: BD 06 80  LDA tbl_8006_counter
    MOVE.B  D0,ram_0003_t09_counter_hi  ; orig: C - - - - - 0x008046 02:8036: 85 03     STA ram_0003_t09_cou
    MOVE.B  tbl_800C_ppu_ppu_addr(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x008048 02:8038: BD 0C 80  LDA tbl_800C_ppu_ppu
    BSR     sub_804F_write_to_ppu             ; JSR -> BSR  ; orig: C - - - - - 0x00804B 02:803B: 20 4F 80  JSR sub_804F_write_t
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x00804E 02:803E: AD 1D 05  LDA ram_051D
    CMPI.B  #$03,D0  ; title uploader uses all three CHR ranges with real CHR payloads in place
    BNE     bra_8018_loop             ; BNE  ; orig: C - - - - - 0x008053 02:8043: D0 D3     BNE bra_8018_loop
    MOVE.B  #$5A,D0  ; orig: C - - - - - 0x008055 02:8045: A9 5A     LDA #$5A
    MOVE.B  D0,ram_00F5_reset_check_5A  ; orig: C - - - - - 0x008057 02:8047: 85 F5     STA ram_00F5_reset_c
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x008059 02:8049: A9 00     LDA #$00
    MOVE.B  D0,ram_051D  ; orig: C - - - - - 0x00805B 02:804B: 8D 1D 05  STA ram_051D
    RTS                     ; RTS  ; orig: C - - - - - 0x00805E 02:804E: 60        RTS



sub_804F_write_to_ppu:  ; orig: sub_804F_write_to_ppu:
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x00805F 02:804F: 8D 06 20  STA $2006
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x008062 02:8052: A0 00     LDY #$00
bra_8054_loop:  ; orig: bra_8054_loop:
    MOVEQ   #0,D5
    MOVE.B  ram_0001_t10,D5
    LSL.W   #8,D5
    MOVE.B  ram_0000_t10_tiles_data,D5
    MOVEA.L #$00FF0000,A0
    MOVE.B  (A0,D5.W),D0  ; orig: C - - - - - 0x008064 02:8054: B1 00     LDA (ram_0000_t10_ti
    MOVE.B  D0,PPU_REG_$2007  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x008066 02:8056: 8D 07 20  STA $2007
    ADDQ.W  #1,D5
    MOVE.W  D5,D4
    MOVE.B  D4,ram_0000_t10_tiles_data
    LSR.W   #8,D4
    MOVE.B  D4,ram_0001_t10
    MOVEQ   #0,D5
    MOVE.B  ram_0003_t09_counter_hi,D5
    LSL.W   #8,D5
    MOVE.B  ram_0002_t13_counter_lo,D5
    SUBQ.W  #1,D5
    MOVE.W  D5,D4
    MOVE.B  D4,ram_0002_t13_counter_lo
    LSR.W   #8,D4
    MOVE.B  D4,ram_0003_t09_counter_hi
    TST.W   D5
    BNE     bra_8054_loop             ; BNE  ; orig: C - - - - - 0x008085 02:8075: D0 DD     BNE bra_8054_loop
    ADDQ.B  #1,ram_051D  ; orig: C - - - - - 0x00808B 02:807B: EE 1D 05  INC ram_051D
    RTS                     ; RTS  ; orig: C - - - - - 0x00808E 02:807E: 60        RTS



tbl_807F___0000_06FF:  ; orig: tbl_807F___0000_06FF:

; 0x00808F
    incbin "..\..\..\artifacts\nes_original_build\incbin\chr\02___807F_877E.chr"



tbl_877F___1000_16FF:  ; orig: tbl_877F___1000_16FF:

; 0x00878F
    incbin "..\..\..\artifacts\nes_original_build\incbin\chr\02___877F_8E7E.chr"



tbl_8E7F___1F20_1FFF:  ; orig: tbl_8E7F___1F20_1FFF:

; 0x008E8F
    incbin "..\..\..\artifacts\nes_original_build\incbin\chr\02___8E7F_8F5E.chr"



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x008F6F 02:8F5F: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008F70 02:8F60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008F80 02:8F70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008F90 02:8F80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FA0 02:8F90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FB0 02:8FA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FC0 02:8FB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FD0 02:8FC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FE0 02:8FD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x008FF0 02:8FE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009000 02:8FF0: FF        .byte $FF, $FF, $FF,



loc_0x009010:  ; orig: loc_0x009010:
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C D 0 - - - 0x009010 02:9000: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  ram_042B_enemy,D0  ; orig: C - - - - - 0x009013 02:9003: AD 2C 04  LDA ram_042B_enemy
    BNE     bra_9014             ; BNE  ; orig: C - - - - - 0x009016 02:9006: D0 0C     BNE bra_9014
    MOVE.B  ($00FF042D).l,D0  ; orig: C - - - - - 0x009018 02:9008: AD 2D 04  LDA ram_042B_enemy +
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00901B 02:900B: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_94E7_00
    DC.L    ofs_9512_01
    DC.L    ofs_9545_02



bra_9014:  ; orig: bra_9014:
    MOVE.B  ($00FF042D).l,D0  ; orig: C - - - - - 0x009024 02:9014: AD 2D 04  LDA ram_042B_enemy +
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x009027 02:9017: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_94E7_00
    DC.L    ofs_9573_01
    DC.L    ofs_959A_02



ofs_main_script_2_0x009030_00_title_screen:  ; orig: ofs_main_script_2_0x009030_00_title_screen:

; con_script_title_screen
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x009030 02:9020: A5 13     LDA ram_subscript
    BNE     bra_9030             ; BNE  ; orig: C - - - - - 0x009032 02:9022: D0 0C     BNE bra_9030
    MOVE.B  ram_0528,D0  ; orig: C - - - - - 0x009034 02:9024: AD 28 05  LDA ram_0528
    BNE     bra_9030             ; BNE  ; orig: C - - - - - 0x009037 02:9027: D0 07     BNE bra_9030
    BSR     sub_90CF             ; JSR -> BSR  ; orig: C - - - - - 0x009039 02:9029: 20 CF 90  JSR sub_90CF
    MOVE.B  ram_0011_screen_ready_flag,D0  ; orig: C - - - - - 0x00903C 02:902C: A5 11     LDA ram_0011_screen_
    BEQ     bra_905C_RTS             ; BEQ  ; orig: C - - - - - 0x00903E 02:902E: F0 2C     BEQ bra_905C_RTS
bra_9030:  ; orig: bra_9030:
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x009040 02:9030: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x009042 02:9032: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_006_903B_00_title_screen_handler
    DC.L    ofs_006_A2A0_01_prepare_slot_select_screen_1
    DC.L    ofs_006_905D_02_prepare_slot_select_screen_2


title_autostart_cfg:
    DC.B    $00
    EVEN    ; keep jump-table target aligned for 68000 code fetch



ofs_006_903B_00_title_screen_handler:  ; orig: ofs_006_903B_00_title_screen_handler:
    MOVE.W  #$0432,D0
    BSR     TRACE_MARK
    MOVE.B  ram_btn_press,D0  ; orig: C - - J - - 0x00904B 02:903B: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x00904D 02:903D: 29 10     AND #con_btn_Start
    BNE     bra_903F_have_start
    MOVE.B  title_autostart_cfg(PC),D1
    TST.B   D1
    BEQ     bra_905C_RTS
    MOVE.B  ram_0011_screen_ready_flag,D0
    BEQ     bra_905C_RTS
    MOVE.B  ram_frm_cnt,D0
    CMPI.B  #$20,D0
    BCS     bra_905C_RTS
bra_903F_have_start:
    MOVE.W  #$0434,D0
    BSR     TRACE_MARK
    MOVE.B  #con_btn_Start,D0
    MOVE.B  D0,ram_00F6_reset_check_A5  ; orig: C - - - - - 0x009051 02:9041: 85 F6     STA ram_00F6_reset_c
    MOVE.B  #con_music_00,D0  ; orig: C - - - - - 0x009053 02:9043: A9 00     LDA #con_music_00   
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x009055 02:9045: 8D 00 06  STA ram_music
    BSR     sub_bat_6EE9             ; JSR -> BSR  ; orig: C - - - - - 0x009058 02:9048: 20 E9 6E  JSR sub_bat_6EE9
    MOVE.B  #$5A,D0  ; orig: C - - - - - 0x00905B 02:904B: A9 5A     LDA #$5A
    MOVE.B  D0,ram_0528  ; orig: C - - - - - 0x00905D 02:904D: 8D 28 05  STA ram_0528
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x009060 02:9050: E6 13     INC ram_subscript
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x009062 02:9052: 20 25 E6  JSR sub_0x01E635_dis
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x009065 02:9055: 20 F7 E5  JSR sub_0x01E607_hid
    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x009068 02:9058: A9 12     LDA #con_ppu_buf_12
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00906A 02:905A: 85 14     STA ram_ppu_load_ind
bra_905C_RTS:  ; orig: bra_905C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00906C 02:905C: 60        RTS



ofs_006_905D_02_prepare_slot_select_screen_2:  ; orig: ofs_006_905D_02_prepare_slot_select_screen_2:
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - J - - 0x00906D 02:905D: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009070 02:9060: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x009072 02:9062: 85 16     STA ram_current_save
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x009074 02:9064: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x009077 02:9067: A0 02     LDY #$02
bra_9069_loop:  ; orig: bra_9069_loop:
    MOVEA.W ($FF0000+ram_0006_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x009079 02:9069: B1 06     LDA (ram_0006_t01_da
    MOVE.B  D0,ram_slot_active_flag(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00907B 02:906B: 99 33 06  STA ram_slot_active_
    BNE     bra_9083             ; BNE  ; orig: C - - - - - 0x00907E 02:906E: D0 13     BNE bra_9083
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x009080 02:9070: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x009081 02:9071: 48        PHA
    MOVE.B  D2,ram_current_save_slot  ; orig: C - - - - - 0x009082 02:9072: 84 16     STY ram_current_save
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x009084 02:9074: 20 F1 6D  JSR sub_bat_6FD1_pre
    BSR     sub_A35D             ; JSR -> BSR  ; orig: C - - - - - 0x009087 02:9077: 20 5D A3  JSR sub_A35D
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00908A 02:907A: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x00908C 02:907C: 85 16     STA ram_current_save
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00908E 02:907E: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x009091 02:9081: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009092 02:9082: A8        TAY
bra_9083:  ; orig: bra_9083:
    MOVEA.W ($FF0000+ram_000A_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x009093 02:9083: B1 0A     LDA (ram_000A_t01_da
    MOVE.B  D0,ram_death_cnt(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009095 02:9085: 99 30 06  STA ram_death_cnt,Y
    MOVEA.W ($FF0000+ram_000C_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x009098 02:9088: B1 0C     LDA (ram_000C_t01_da
    MOVE.B  D0,ram_current_quest(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00909A 02:908A: 99 2D 06  STA ram_current_ques
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00909D 02:908D: 88        DEY
    BPL     bra_9069_loop             ; BPL  ; orig: C - - - - - 0x00909E 02:908E: 10 D9     BPL bra_9069_loop
    MOVE.B  #$18,D2  ; orig: C - - - - - 0x0090A0 02:9090: A0 18     LDY #$18
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0090A2 02:9092: A2 00     LDX #$00
bra_9094_loop:  ; orig: bra_9094_loop:
loc_9094_loop:  ; orig: loc_9094_loop:
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C D 0 - - - 0x0090A4 02:9094: B1 00     LDA (ram_0000_t19_da
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0090A6 02:9096: 48        PHA
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0090A7 02:9097: 8A        TXA
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090A8 02:9098: 4A        LSR
    BCS     bra_90A7             ; BCS  ; orig: C - - - - - 0x0090A9 02:9099: B0 0C     BCS bra_90A7
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0090AB 02:909B: 68        PLA
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0090AC 02:909C: 29 F0     AND #$F0
    MOVE.B  D0,ram_000C_t04  ; orig: C - - - - - 0x0090AE 02:909E: 85 0C     STA ram_000C_t04

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090B0 02:90A0: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090B1 02:90A1: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090B2 02:90A2: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090B3 02:90A3: 4A        LSR
    OR.B    ram_000C_t04,D0  ; orig: C - - - - - 0x0090B4 02:90A4: 05 0C     ORA ram_000C_t04
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0090B6 02:90A6: 48        PHA
bra_90A7:  ; orig: bra_90A7:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0090B7 02:90A7: 68        PLA
    MOVE.B  D0,ram_slot_hearts(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0090B8 02:90A8: 9D 50 06  STA ram_slot_hearts,
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0090BB 02:90AB: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0090BC 02:90AC: E8        INX
    CMPI.B  #$06,D1  ; orig: C - - - - - 0x0090BD 02:90AD: E0 06     CPX #$06
    BEQ     bra_90BC             ; BEQ  ; orig: C - - - - - 0x0090BF 02:90AF: F0 0B     BEQ bra_90BC
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0090C1 02:90B1: 8A        TXA
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0090C2 02:90B2: 4A        LSR
    BCS     bra_9094_loop             ; BCS  ; orig: C - - - - - 0x0090C3 02:90B3: B0 DF     BCS bra_9094_loop
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0090C5 02:90B5: 98        TYA
    ADDX.B  #$26,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0090C6 02:90B6: 69 26     ADC #$26
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0090C8 02:90B8: A8        TAY
    JMP     loc_9094_loop  ; orig: C - - - - - 0x0090C9 02:90B9: 4C 94 90  JMP loc_9094_loop
bra_90BC:  ; orig: bra_90BC:
    MOVE.B  #$17,D2  ; orig: C - - - - - 0x0090CC 02:90BC: A0 17     LDY #$17
bra_90BE_loop:  ; orig: bra_90BE_loop:
    MOVEA.W ($FF0000+ram_0004_t02_slot_name_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0090CE 02:90BE: B1 04     LDA (ram_0004_t02_sl
    MOVE.B  D0,ram_slot_name(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x0090D0 02:90C0: 99 38 06  STA ram_slot_name,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0090D3 02:90C3: 88        DEY
    BPL     bra_90BE_loop             ; BPL  ; orig: C - - - - - 0x0090D4 02:90C4: 10 F8     BPL bra_90BE_loop
    ADDQ.B  #1,ram_script  ; orig: C - - - - - 0x0090D6 02:90C6: E6 12     INC ram_script
    MOVE.W  #$0436,D0
    BSR     TRACE_MARK
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0090D8 02:90C8: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0090DA 02:90CA: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0090DC 02:90CC: 85 13     STA ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x0090DE 02:90CE: 60        RTS



sub_90CF:  ; orig: sub_90CF:
    MOVE.B  ram_042B_enemy,D0  ; orig: C - - - - - 0x0090DF 02:90CF: AD 2C 04  LDA ram_042B_enemy
    BNE     bra_90DE_demo_manual             ; BNE  ; orig: C - - - - - 0x0090E2 02:90D2: D0 0A     BNE bra_90DE_demo_ma
    MOVE.B  ($00FF042D).l,D0  ; orig: C - - - - - 0x0090E4 02:90D4: AD 2D 04  LDA ram_042B_enemy +
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0090E7 02:90D7: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_007_95AC_00
    DC.L    ofs_007_9B79_01



bra_90DE_demo_manual:  ; orig: bra_90DE_demo_manual:
    MOVE.B  ($00FF042D).l,D0  ; orig: C - - - - - 0x0090EE 02:90DE: AD 2D 04  LDA ram_042B_enemy +
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0090F1 02:90E1: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_008_95C1_00
    DC.L    ofs_008_95EC_01
    DC.L    ofs_008_960C_02
    DC.L    ofs_008_9830_03
    DC.L    ofs_008_983C_04



tbl_90EE_spr_data:  ; orig: tbl_90EE_spr_data:

;                                              +-------------------- spr_Y

;                                              |    +--------------- spr_T

;                                              |    |    +---------- spr_A

;                                              |    |    |    +----- spr_X

;                                              |    |    |    |
    ; [DIRECTIVE] .BYTE $77, $CA, $C2, $D0  -- needs manual handling  ; orig: - D 0 - - - 0x0090FE 02:90EE: 77        .byte $77, $CA, $C2,
    ; [DIRECTIVE] .BYTE $77, $CC, $C2, $C8  -- needs manual handling  ; orig: - D 0 - - - 0x009102 02:90F2: 77        .byte $77, $CC, $C2,
    ; [DIRECTIVE] .BYTE $77, $CA, $82, $28  -- needs manual handling  ; orig: - D 0 - - - 0x009106 02:90F6: 77        .byte $77, $CA, $82,
    ; [DIRECTIVE] .BYTE $77, $CC, $82, $30  -- needs manual handling  ; orig: - D 0 - - - 0x00910A 02:90FA: 77        .byte $77, $CC, $82,
    ; [DIRECTIVE] .BYTE $27, $CA, $42, $D0  -- needs manual handling  ; orig: - D 0 - - - 0x00910E 02:90FE: 27        .byte $27, $CA, $42,
    ; [DIRECTIVE] .BYTE $27, $CC, $42, $C8  -- needs manual handling  ; orig: - D 0 - - - 0x009112 02:9102: 27        .byte $27, $CC, $42,
    ; [DIRECTIVE] .BYTE $27, $CA, $02, $28  -- needs manual handling  ; orig: - D 0 - - - 0x009116 02:9106: 27        .byte $27, $CA, $02,
    ; [DIRECTIVE] .BYTE $27, $CC, $02, $30  -- needs manual handling  ; orig: - D 0 - - - 0x00911A 02:910A: 27        .byte $27, $CC, $02,
    ; [DIRECTIVE] .BYTE $57, $CE, $02, $74  -- needs manual handling  ; orig: - D 0 - - - 0x00911E 02:910E: 57        .byte $57, $CE, $02,
    ; [DIRECTIVE] .BYTE $57, $D0, $02, $7C  -- needs manual handling  ; orig: - D 0 - - - 0x009122 02:9112: 57        .byte $57, $D0, $02,
    ; [DIRECTIVE] .BYTE $31, $D2, $02, $57  -- needs manual handling  ; orig: - D 0 - - - 0x009126 02:9116: 31        .byte $31, $D2, $02,
    ; [DIRECTIVE] .BYTE $4F, $D2, $02, $CC  -- needs manual handling  ; orig: - D 0 - - - 0x00912A 02:911A: 4F        .byte $4F, $D2, $02,
    ; [DIRECTIVE] .BYTE $67, $D2, $02, $7B  -- needs manual handling  ; orig: - D 0 - - - 0x00912E 02:911E: 67        .byte $67, $D2, $02,
    ; [DIRECTIVE] .BYTE $83, $D2, $02, $50  -- needs manual handling  ; orig: - D 0 - - - 0x009132 02:9122: 83        .byte $83, $D2, $02,
    ; [DIRECTIVE] .BYTE $31, $D4, $02, $5F  -- needs manual handling  ; orig: - D 0 - - - 0x009136 02:9126: 31        .byte $31, $D4, $02,
    ; [DIRECTIVE] .BYTE $3F, $D4, $02, $24  -- needs manual handling  ; orig: - D 0 - - - 0x00913A 02:912A: 3F        .byte $3F, $D4, $02,
    ; [DIRECTIVE] .BYTE $41, $D4, $02, $64  -- needs manual handling  ; orig: - D 0 - - - 0x00913E 02:912E: 41        .byte $41, $D4, $02,
    ; [DIRECTIVE] .BYTE $7B, $D4, $02, $90  -- needs manual handling  ; orig: - D 0 - - - 0x009142 02:9132: 7B        .byte $7B, $D4, $02,
    ; [DIRECTIVE] .BYTE $27, $D6, $02, $50  -- needs manual handling  ; orig: - D 0 - - - 0x009146 02:9136: 27        .byte $27, $D6, $02,
    ; [DIRECTIVE] .BYTE $2B, $D6, $02, $A0  -- needs manual handling  ; orig: - D 0 - - - 0x00914A 02:913A: 2B        .byte $2B, $D6, $02,
    ; [DIRECTIVE] .BYTE $4F, $D6, $02, $2C  -- needs manual handling  ; orig: - D 0 - - - 0x00914E 02:913E: 4F        .byte $4F, $D6, $02,
    ; [DIRECTIVE] .BYTE $7B, $D6, $02, $BC  -- needs manual handling  ; orig: - D 0 - - - 0x009152 02:9142: 7B        .byte $7B, $D6, $02,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $60  -- needs manual handling  ; orig: - D 0 - - - 0x009156 02:9146: 67        .byte $67, $A0, $03,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $68  -- needs manual handling  ; orig: - D 0 - - - 0x00915A 02:914A: 67        .byte $67, $A0, $03,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $70  -- needs manual handling  ; orig: - D 0 - - - 0x00915E 02:914E: 67        .byte $67, $A0, $03,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $78  -- needs manual handling  ; orig: - D 0 - - - 0x009162 02:9152: 67        .byte $67, $A0, $03,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $80  -- needs manual handling  ; orig: - D 0 - - - 0x009166 02:9156: 67        .byte $67, $A0, $03,
    ; [DIRECTIVE] .BYTE $67, $A0, $03, $88  -- needs manual handling  ; orig: - D 0 - - - 0x00916A 02:915A: 67        .byte $67, $A0, $03,



tbl_915E:  ; orig: tbl_915E:

;                                              +-----------------

;                                              |     +-----------

;                                              |     |     +-----

;                                              |     |     |
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00916E 02:915E: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00916F 02:915F: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009170 02:9160: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009171 02:9161: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009172 02:9162: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009173 02:9163: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009174 02:9164: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009175 02:9165: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009176 02:9166: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009177 02:9167: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009178 02:9168: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009179 02:9169: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x00917A 02:916A: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00917B 02:916B: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00917C 02:916C: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00917D 02:916D: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00917E 02:916E: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00917F 02:916F: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009180 02:9170: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009181 02:9171: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009182 02:9172: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009183 02:9173: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009184 02:9174: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009185 02:9175: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009186 02:9176: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009187 02:9177: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009188 02:9178: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009189 02:9179: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x00918A 02:917A: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00918B 02:917B: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00918C 02:917C: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00918D 02:917D: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00918E 02:917E: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00918F 02:917F: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009190 02:9180: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009191 02:9181: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009192 02:9182: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009193 02:9183: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009194 02:9184: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009195 02:9185: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009196 02:9186: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009197 02:9187: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009198 02:9188: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009199 02:9189: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x00919A 02:918A: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00919B 02:918B: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00919C 02:918C: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00919D 02:918D: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00919E 02:918E: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00919F 02:918F: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A0 02:9190: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A1 02:9191: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091A2 02:9192: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A3 02:9193: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A4 02:9194: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A5 02:9195: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A6 02:9196: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A7 02:9197: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A8 02:9198: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091A9 02:9199: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091AA 02:919A: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091AB 02:919B: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091AC 02:919C: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091AD 02:919D: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091AE 02:919E: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091AF 02:919F: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B0 02:91A0: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B1 02:91A1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091B2 02:91A2: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B3 02:91A3: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B4 02:91A4: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B5 02:91A5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B6 02:91A6: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B7 02:91A7: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B8 02:91A8: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091B9 02:91A9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091BA 02:91AA: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091BB 02:91AB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091BC 02:91AC: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091BD 02:91AD: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091BE 02:91AE: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091BF 02:91AF: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C0 02:91B0: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C1 02:91B1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091C2 02:91B2: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C3 02:91B3: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C4 02:91B4: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C5 02:91B5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C6 02:91B6: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C7 02:91B7: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C8 02:91B8: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091C9 02:91B9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091CA 02:91BA: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091CB 02:91BB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091CC 02:91BC: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091CD 02:91BD: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091CE 02:91BE: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091CF 02:91BF: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D0 02:91C0: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D1 02:91C1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091D2 02:91C2: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D3 02:91C3: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D4 02:91C4: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D5 02:91C5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D6 02:91C6: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D7 02:91C7: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D8 02:91C8: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091D9 02:91C9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091DA 02:91CA: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091DB 02:91CB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091DC 02:91CC: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091DD 02:91CD: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091DE 02:91CE: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091DF 02:91CF: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E0 02:91D0: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E1 02:91D1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091E2 02:91D2: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E3 02:91D3: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E4 02:91D4: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E5 02:91D5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E6 02:91D6: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E7 02:91D7: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E8 02:91D8: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091E9 02:91D9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091EA 02:91DA: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091EB 02:91DB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091EC 02:91DC: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091ED 02:91DD: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091EE 02:91DE: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091EF 02:91DF: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F0 02:91E0: 80        .byte $80 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F1 02:91E1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091F2 02:91E2: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F3 02:91E3: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F4 02:91E4: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F5 02:91E5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F6 02:91E6: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F7 02:91E7: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F8 02:91E8: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091F9 02:91E9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x0091FA 02:91EA: 60        .byte $00 + $40 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091FB 02:91EB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091FC 02:91EC: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091FD 02:91ED: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091FE 02:91EE: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x0091FF 02:91EF: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $80 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009200 02:91F0: C0        .byte $80 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009201 02:91F1: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009202 02:91F2: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009203 02:91F3: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009204 02:91F4: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009205 02:91F5: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009206 02:91F6: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009207 02:91F7: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $40 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009208 02:91F8: 40        .byte $00 + $40 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009209 02:91F9: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00920A 02:91FA: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00920B 02:91FB: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00920C 02:91FC: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x00920D 02:91FD: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00920E 02:91FE: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x00920F 02:91FF: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009210 02:9200: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009211 02:9201: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009212 02:9202: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009213 02:9203: 20        .byte $00 + $00 + $2
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009214 02:9204: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009215 02:9205: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009216 02:9206: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009217 02:9207: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009218 02:9208: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x009219 02:9209: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00921A 02:920A: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00921B 02:920B: 00        .byte $00 + $00 + $0
    ; [DIRECTIVE] .BYTE $00 + $00 + $00  -- needs manual handling  ; orig: - D 0 - - - 0x00921C 02:920C: 00        .byte $00 + $00 + $0



; bzk garbage
    ; [DIRECTIVE] .BYTE $00, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x00921D 02:920D: 00        .byte $00, $00, $00 
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x009220 02:9210: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x009230 02:9220: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x009240 02:9230: 00        .byte $00, $00, $00,



tbl_9240:  ; orig: tbl_9240:
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 0 - - - 0x009250 02:9240: 22        .byte $22   ; 00
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x009251 02:9241: 23        .byte $23   ; 01
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x009252 02:9242: 18        .byte $18   ; 02
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 0 - - - 0x009253 02:9243: 1F        .byte $1F   ; 03
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 0 - - - 0x009254 02:9244: 15        .byte $15   ; 04
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x009255 02:9245: 01        .byte $01   ; 05
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x009256 02:9246: 03        .byte $03   ; 06
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 0 - - - 0x009257 02:9247: 1D        .byte $1D   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x009258 02:9248: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x009259 02:9249: 08        .byte $08   ; 09
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x00925A 02:924A: 06        .byte $06   ; 0A
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - - - 0x00925B 02:924B: 12        .byte $12   ; 0B
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - - - 0x00925C 02:924C: 14        .byte $14   ; 0C
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 0 - - - 0x00925D 02:924D: 0C        .byte $0C   ; 0D
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x00925E 02:924E: 10        .byte $10   ; 0E
    ; [DIRECTIVE] .BYTE $19  -- needs manual handling  ; orig: - D 0 - - - 0x00925F 02:924F: 19        .byte $19   ; 0F
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x009260 02:9250: 17        .byte $17   ; 10
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009261 02:9251: 1B        .byte $1B   ; 11
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x009262 02:9252: 30        .byte $30   ; 12
    ; [DIRECTIVE] .BYTE $31  -- needs manual handling  ; orig: - D 0 - - - 0x009263 02:9253: 31        .byte $31   ; 13
    ; [DIRECTIVE] .BYTE $32  -- needs manual handling  ; orig: - D 0 - - - 0x009264 02:9254: 32        .byte $32   ; 14
    ; [DIRECTIVE] .BYTE $33  -- needs manual handling  ; orig: - D 0 - - - 0x009265 02:9255: 33        .byte $33   ; 15



tbl_9256:  ; orig: tbl_9256:
    ; [DIRECTIVE] .BYTE $1A  -- needs manual handling  ; orig: - D 0 - - - 0x009266 02:9256: 1A        .byte $1A   ; 00
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009267 02:9257: 21        .byte $21   ; 01
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009268 02:9258: 0F        .byte $0F   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x009269 02:9259: 20        .byte $20   ; 03
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x00926A 02:925A: 04        .byte $04   ; 04
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x00926B 02:925B: 02        .byte $02   ; 05
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 0 - - - 0x00926C 02:925C: 1C        .byte $1C   ; 06
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 0 - - - 0x00926D 02:925D: 1E        .byte $1E   ; 07
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x00926E 02:925E: 0A        .byte $0A   ; 08
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 0 - - - 0x00926F 02:925F: 09        .byte $09   ; 09
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - - - 0x009270 02:9260: 07        .byte $07   ; 0A
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 0 - - - 0x009271 02:9261: 13        .byte $13   ; 0B
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x009272 02:9262: 05        .byte $05   ; 0C
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 0 - - - 0x009273 02:9263: 0D        .byte $0D   ; 0D
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 0 - - - 0x009274 02:9264: 11        .byte $11   ; 0E
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x009275 02:9265: 0B        .byte $0B   ; 0F
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x009276 02:9266: 16        .byte $16   ; 10
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009277 02:9267: 1B        .byte $1B   ; 11



tbl_9268_pos_X_44:
; bzk optimize, LDA #$44
    ; [DIRECTIVE] .BYTE $44  -- needs manual handling  ; orig: - D 0 - - - 0x009278 02:9268: 44        .byte $44   ;



tbl_9269_pos_X_AC:
; bzk optimize, LDA #$AC
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 0 - - - 0x009279 02:9269: AC        .byte $AC   ;



tbl_926A_spr_T:  ; orig: tbl_926A_spr_T:
    ; [DIRECTIVE] .BYTE $E0, $E2, $EC, $EE, $F8, $FA  -- needs manual handling  ; orig: - D 0 - - - 0x00927A 02:926A: E0        .byte $E0, $E2, $EC,
    ; [DIRECTIVE] .BYTE $E4, $E6, $F0, $F2, $FC, $FE  -- needs manual handling  ; orig: - D 0 - - - 0x009280 02:9270: E4        .byte $E4, $E6, $F0,
    ; [DIRECTIVE] .BYTE $E8, $EA, $F4, $F6, $DC, $DE  -- needs manual handling  ; orig: - D 0 - - - 0x009286 02:9276: E8        .byte $E8, $EA, $F4,
    ; [DIRECTIVE] .BYTE $00, $00, $78, $78, $00, $00  -- needs manual handling  ; orig: - D 0 - - - 0x00928C 02:927C: 00        .byte $00, $00, $78,



tbl_9282_spr_A:  ; orig: tbl_9282_spr_A:
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 0 - - - 0x009292 02:9282: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 0 - - - 0x009298 02:9288: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 0 - - - 0x00929E 02:928E: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $40, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x0092A4 02:9294: 00        .byte $00, $00, $00,



_off002_929A_00_all_of_treasures:  ; orig: _off002_929A_00_all_of_treasures:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - I - 0x0092AA 02:929A: 00        .byte $00   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $0A, $15, $15, $24, $18, $0F, $24, $1D  -- needs manual handling  ; orig: - D 0 - I - 0x0092AB 02:929B: E4        .byte $E4, $E5, $E4,
    ; [DIRECTIVE] .BYTE $1B, $0E, $0A, $1C, $1E, $1B, $0E, $1C, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5  -- needs manual handling  ; orig: - D 0 - I - 0x0092BB 02:92AB: 1B        .byte $1B, $0E, $0A,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0092CB 02:92BB: FF        .byte $FF   ; end to



_off002_92BC_01_heart___container:  ; orig: _off002_92BC_01_heart___container:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0092CC 02:92BC: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $11, $0E, $0A, $1B, $1D, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0092CD 02:92BD: 11        .byte               
    ; [DIRECTIVE] .BYTE $24, $0C, $18, $17, $1D, $0A, $12, $17, $0E, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x0092D6 02:92C6: 24        .byte $24, $0C, $18,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0092E0 02:92D0: FF        .byte $FF   ; end to



_off002_92D1_02_heart:  ; orig: _off002_92D1_02_heart:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - I - 0x0092E1 02:92D1: 14        .byte $14   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $11, $0E, $0A, $1B, $1D  -- needs manual handling  ; orig: - D 0 - I - 0x0092E2 02:92D2: 11        .byte               

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0092E7 02:92D7: FF        .byte $FF   ; end to



_off002_92D8_03_fairy___clock:  ; orig: _off002_92D8_03_fairy___clock:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0092E8 02:92D8: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0F, $0A, $12, $1B, $22, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0092E9 02:92D9: 0F        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $0C, $15, $18, $0C, $14  -- needs manual handling  ; orig: - D 0 - I - 0x0092F2 02:92E2: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0092FB 02:92EB: FF        .byte $FF   ; end to



_off002_92EC_04_rupy___5_rupies:  ; orig: _off002_92EC_04_rupy___5_rupies:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0092FC 02:92EC: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1B, $1E, $19, $22, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0092FD 02:92ED: 1B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $05, $24, $1B, $1E, $19, $12, $0E, $1C  -- needs manual handling  ; orig: - D 0 - I - 0x009306 02:92F6: 24        .byte $24, $24, $05,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009310 02:9300: FF        .byte $FF   ; end to



_off002_9301_07_sword___white:  ; orig: _off002_9301_07_sword___white:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x009311 02:9301: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1C, $20, $18, $1B, $0D, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009312 02:9302: 1C        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $20, $11, $12, $1D, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x00931B 02:930B: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009324 02:9314: FF        .byte $FF   ; end to



_off002_9315_08_sword:  ; orig: _off002_9315_08_sword:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - I - 0x009325 02:9315: 14        .byte $14   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1C, $20, $18, $1B, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x009326 02:9316: 1C        .byte               

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00932B 02:931B: FF        .byte $FF   ; end to



_off002_931C_09_magical___magical:  ; orig: _off002_931C_09_magical___magical:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - I - 0x00932C 02:931C: 06        .byte $06   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $16, $0A, $10, $12, $0C, $0A, $15, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x00932D 02:931D: 16        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15  -- needs manual handling  ; orig: - D 0 - I - 0x009337 02:9327: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009341 02:9331: FF        .byte $FF   ; end to



_off002_9332_0A_sword_shield:  ; orig: _off002_9332_0A_sword_shield:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x009342 02:9332: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1C, $20, $18, $1B, $0D, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009343 02:9333: 1C        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $1C, $11, $12, $0E, $15, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x00934C 02:933C: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009356 02:9346: FF        .byte $FF   ; end to



_off002_9347_0B_boomerang___magical:  ; orig: _off002_9347_0B_boomerang___magical:
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - I - 0x009357 02:9347: 05        .byte $05   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $18, $18, $16, $0E, $1B, $0A, $17, $10, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009358 02:9348: 0B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15  -- needs manual handling  ; orig: - D 0 - I - 0x009363 02:9353: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00936D 02:935D: FF        .byte $FF   ; end to



_off002_935E_0C_boomerang:  ; orig: _off002_935E_0C_boomerang:
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - I - 0x00936E 02:935E: 12        .byte $12   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $18, $18, $16, $0E, $1B, $0A, $17, $10  -- needs manual handling  ; orig: - D 0 - I - 0x00936F 02:935F: 0B        .byte           $0B,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009378 02:9368: FF        .byte $FF   ; end to



_off002_9369_0D_bomb___bow:  ; orig: _off002_9369_0D_bomb___bow:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x009379 02:9369: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $18, $16, $0B, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x00937A 02:936A: 0B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $0B, $18, $20  -- needs manual handling  ; orig: - D 0 - I - 0x009383 02:9373: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00938B 02:937B: FF        .byte $FF   ; end to



_off002_937C_0E_arrow___silver:  ; orig: _off002_937C_0E_arrow___silver:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x00938C 02:937C: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0A, $1B, $1B, $18, $20, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x00938D 02:937D: 0A        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $1C, $12, $15, $1F, $0E, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x009396 02:9386: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093A0 02:9390: FF        .byte $FF   ; end to



_off002_9391_0F_arrow:  ; orig: _off002_9391_0F_arrow:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - I - 0x0093A1 02:9391: 14        .byte $14   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0A, $1B, $1B, $18, $20  -- needs manual handling  ; orig: - D 0 - I - 0x0093A2 02:9392: 0A        .byte               

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093A7 02:9397: FF        .byte $FF   ; end to



_off002_9398_10_blue___red:  ; orig: _off002_9398_10_blue___red:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0093A8 02:9398: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $15, $1E, $0E, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0093A9 02:9399: 0B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $1B, $0E, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x0093B2 02:93A2: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093BA 02:93AA: FF        .byte $FF   ; end to



_off002_93AB_11_candle___candle:  ; orig: _off002_93AB_11_candle___candle:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - I - 0x0093BB 02:93AB: 06        .byte $06   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0C, $0A, $17, $0D, $15, $0E, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0093BC 02:93AC: 0C        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $0C, $0A, $17, $0D, $15, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x0093C6 02:93B6: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093D0 02:93C0: FF        .byte $FF   ; end to



_off002_93C1_12_blue___red:  ; orig: _off002_93C1_12_blue___red:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0093D1 02:93C1: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $15, $1E, $0E, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0093D2 02:93C2: 0B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $1B, $0E, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x0093DB 02:93CB: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093E3 02:93D3: FF        .byte $FF   ; end to



_off002_93D4_13_ring___ring:  ; orig: _off002_93D4_13_ring___ring:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0093E4 02:93D4: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1B, $12, $17, $10, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0093E5 02:93D5: 1B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $1B, $12, $17, $10  -- needs manual handling  ; orig: - D 0 - I - 0x0093EE 02:93DE: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0093F7 02:93E7: FF        .byte $FF   ; end to



_off002_93E8_14_power___recorder:  ; orig: _off002_93E8_14_power___recorder:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x0093F8 02:93E8: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $19, $18, $20, $0E, $1B, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0093F9 02:93E9: 19        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $1B, $0E, $0C, $18, $1B, $0D, $0E, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x009402 02:93F2: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00940D 02:93FD: FF        .byte $FF   ; end to



_off002_93FE_15_bracelet:  ; orig: _off002_93FE_15_bracelet:
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - I - 0x00940E 02:93FE: 05        .byte $05   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0B, $1B, $0A, $0C, $0E, $15, $0E, $1D  -- needs manual handling  ; orig: - D 0 - I - 0x00940F 02:93FF: 0B        .byte               

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009417 02:9407: FF        .byte $FF   ; end to



_off002_9408_16_raft___stepladder:  ; orig: _off002_9408_16_raft___stepladder:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - I - 0x009418 02:9408: 07        .byte $07   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1B, $0A, $0F, $1D, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009419 02:9409: 1B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $1C, $1D, $0E, $19, $15, $0A, $0D, $0D, $0E, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x009422 02:9412: 24        .byte $24, $24, $1C,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00942E 02:941E: FF        .byte $FF   ; end to



_off002_941F_17_magical___book_of:  ; orig: _off002_941F_17_magical___book_of:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - I - 0x00942F 02:941F: 06        .byte $06   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $16, $0A, $10, $12, $0C, $0A, $15, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009430 02:9420: 16        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $0B, $18, $18, $14, $24, $18, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x00943A 02:942A: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009444 02:9434: FF        .byte $FF   ; end to



_off002_9435_18_rod___magic:  ; orig: _off002_9435_18_rod___magic:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - I - 0x009445 02:9435: 08        .byte $08   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1B, $18, $0D, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009446 02:9436: 1B        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $16, $0A, $10, $12, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x00944E 02:943E: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009457 02:9447: FF        .byte $FF   ; end to



_off002_9448_19_key___magical:  ; orig: _off002_9448_19_key___magical:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - I - 0x009458 02:9448: 08        .byte $08   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $14, $0E, $22, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009459 02:9449: 14        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $16, $0A, $10, $12, $0C, $0A, $15  -- needs manual handling  ; orig: - D 0 - I - 0x009461 02:9451: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00946B 02:945B: FF        .byte $FF   ; end to



_off002_945C_1A_key:  ; orig: _off002_945C_1A_key:
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 0 - I - 0x00946C 02:945C: 15        .byte $15   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $14, $0E, $22  -- needs manual handling  ; orig: - D 0 - I - 0x00946D 02:945D: 14        .byte               

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009470 02:9460: FF        .byte $FF   ; end to



_off002_9461_1B_map___compass:  ; orig: _off002_9461_1B_map___compass:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - I - 0x009471 02:9461: 08        .byte $08   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $16, $0A, $19, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009472 02:9462: 16        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $0C, $18, $16, $19, $0A, $1C, $1C  -- needs manual handling  ; orig: - D 0 - I - 0x00947A 02:946A: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x009484 02:9474: FF        .byte $FF   ; end to



_off002_9475_1C_triforce:  ; orig: _off002_9475_1C_triforce:
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009485 02:9475: 0C        .byte $0C   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $1D, $1B, $12, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009486 02:9476: 1D        .byte               
    ; [DIRECTIVE] .BYTE $18, $1B, $0C, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x00948A 02:947A: 18        .byte $18, $1B, $0C,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x00948E 02:947E: FF        .byte $FF   ; end to



_off002_947F_05_life_potion___2nd_potion:  ; orig: _off002_947F_05_life_potion___2nd_potion:
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - I - 0x00948F 02:947F: 04        .byte $04   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $15, $12, $0F, $0E, $24, $19, $18, $1D, $12, $18, $17, $24  -- needs manual handling  ; orig: - D 0 - I - 0x009490 02:9480: 15        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $02, $17, $0D, $24, $19, $18, $1D, $12, $18, $17  -- needs manual handling  ; orig: - D 0 - I - 0x00949C 02:948C: 24        .byte $24, $24, $02,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0094A8 02:9498: FF        .byte $FF   ; end to



_off002_9499_06_letter___food:  ; orig: _off002_9499_06_letter___food:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - I - 0x0094A9 02:9499: 06        .byte $06   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $15, $0E, $1D, $1D, $0E, $1B, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - I - 0x0094AA 02:949A: 15        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $0F, $18, $18, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x0094B4 02:94A4: 24        .byte $24, $24, $24,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - I - 0x0094BC 02:94AC: FF        .byte $FF   ; end to



tbl_94AD_demo_manual_text:  ; orig: tbl_94AD_demo_manual_text:
    ; [DIRECTIVE] .WORD _off002_929A_00_all_of_treasures  -- needs manual handling  ; orig: - D 0 - - - 0x0094BD 02:94AD: 9A 92     .word _off002_929A_0
    ; [DIRECTIVE] .WORD _off002_92BC_01_heart___container  -- needs manual handling  ; orig: - D 0 - - - 0x0094BF 02:94AF: BC 92     .word _off002_92BC_0
    ; [DIRECTIVE] .WORD _off002_92D1_02_heart  -- needs manual handling  ; orig: - D 0 - - - 0x0094C1 02:94B1: D1 92     .word _off002_92D1_0
    ; [DIRECTIVE] .WORD _off002_92D8_03_fairy___clock  -- needs manual handling  ; orig: - D 0 - - - 0x0094C3 02:94B3: D8 92     .word _off002_92D8_0
    ; [DIRECTIVE] .WORD _off002_92EC_04_rupy___5_rupies  -- needs manual handling  ; orig: - D 0 - - - 0x0094C5 02:94B5: EC 92     .word _off002_92EC_0
    ; [DIRECTIVE] .WORD _off002_947F_05_life_potion___2nd_potion  -- needs manual handling  ; orig: - D 0 - - - 0x0094C7 02:94B7: 7F 94     .word _off002_947F_0
    ; [DIRECTIVE] .WORD _off002_9499_06_letter___food  -- needs manual handling  ; orig: - D 0 - - - 0x0094C9 02:94B9: 99 94     .word _off002_9499_0
    ; [DIRECTIVE] .WORD _off002_9301_07_sword___white  -- needs manual handling  ; orig: - D 0 - - - 0x0094CB 02:94BB: 01 93     .word _off002_9301_0
    ; [DIRECTIVE] .WORD _off002_9315_08_sword  -- needs manual handling  ; orig: - D 0 - - - 0x0094CD 02:94BD: 15 93     .word _off002_9315_0
    ; [DIRECTIVE] .WORD _off002_931C_09_magical___magical  -- needs manual handling  ; orig: - D 0 - - - 0x0094CF 02:94BF: 1C 93     .word _off002_931C_0
    ; [DIRECTIVE] .WORD _off002_9332_0A_sword_shield  -- needs manual handling  ; orig: - D 0 - - - 0x0094D1 02:94C1: 32 93     .word _off002_9332_0
    ; [DIRECTIVE] .WORD _off002_9347_0B_boomerang___magical  -- needs manual handling  ; orig: - D 0 - - - 0x0094D3 02:94C3: 47 93     .word _off002_9347_0
    ; [DIRECTIVE] .WORD _off002_935E_0C_boomerang  -- needs manual handling  ; orig: - D 0 - - - 0x0094D5 02:94C5: 5E 93     .word _off002_935E_0
    ; [DIRECTIVE] .WORD _off002_9369_0D_bomb___bow  -- needs manual handling  ; orig: - D 0 - - - 0x0094D7 02:94C7: 69 93     .word _off002_9369_0
    ; [DIRECTIVE] .WORD _off002_937C_0E_arrow___silver  -- needs manual handling  ; orig: - D 0 - - - 0x0094D9 02:94C9: 7C 93     .word _off002_937C_0
    ; [DIRECTIVE] .WORD _off002_9391_0F_arrow  -- needs manual handling  ; orig: - D 0 - - - 0x0094DB 02:94CB: 91 93     .word _off002_9391_0
    ; [DIRECTIVE] .WORD _off002_9398_10_blue___red  -- needs manual handling  ; orig: - D 0 - - - 0x0094DD 02:94CD: 98 93     .word _off002_9398_1
    ; [DIRECTIVE] .WORD _off002_93AB_11_candle___candle  -- needs manual handling  ; orig: - D 0 - - - 0x0094DF 02:94CF: AB 93     .word _off002_93AB_1
    ; [DIRECTIVE] .WORD _off002_93C1_12_blue___red  -- needs manual handling  ; orig: - D 0 - - - 0x0094E1 02:94D1: C1 93     .word _off002_93C1_1
    ; [DIRECTIVE] .WORD _off002_93D4_13_ring___ring  -- needs manual handling  ; orig: - D 0 - - - 0x0094E3 02:94D3: D4 93     .word _off002_93D4_1
    ; [DIRECTIVE] .WORD _off002_93E8_14_power___recorder  -- needs manual handling  ; orig: - D 0 - - - 0x0094E5 02:94D5: E8 93     .word _off002_93E8_1
    ; [DIRECTIVE] .WORD _off002_93FE_15_bracelet  -- needs manual handling  ; orig: - D 0 - - - 0x0094E7 02:94D7: FE 93     .word _off002_93FE_1
    ; [DIRECTIVE] .WORD _off002_9408_16_raft___stepladder  -- needs manual handling  ; orig: - D 0 - - - 0x0094E9 02:94D9: 08 94     .word _off002_9408_1
    ; [DIRECTIVE] .WORD _off002_941F_17_magical___book_of  -- needs manual handling  ; orig: - D 0 - - - 0x0094EB 02:94DB: 1F 94     .word _off002_941F_1
    ; [DIRECTIVE] .WORD _off002_9435_18_rod___magic  -- needs manual handling  ; orig: - D 0 - - - 0x0094ED 02:94DD: 35 94     .word _off002_9435_1
    ; [DIRECTIVE] .WORD _off002_9448_19_key___magical  -- needs manual handling  ; orig: - D 0 - - - 0x0094EF 02:94DF: 48 94     .word _off002_9448_1
    ; [DIRECTIVE] .WORD _off002_945C_1A_key  -- needs manual handling  ; orig: - D 0 - - - 0x0094F1 02:94E1: 5C 94     .word _off002_945C_1
    ; [DIRECTIVE] .WORD _off002_9461_1B_map___compass  -- needs manual handling  ; orig: - D 0 - - - 0x0094F3 02:94E3: 61 94     .word _off002_9461_1
    ; [DIRECTIVE] .WORD _off002_9475_1C_triforce  -- needs manual handling  ; orig: - D 0 - - - 0x0094F5 02:94E5: 75 94     .word _off002_9475_1



ofs_94E7_00:  ; orig: ofs_94E7_00:
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - J - - 0x0094F7 02:94E7: 20 6D E4  JSR sub_0x01E47D_cle
loc_94EA:  ; orig: loc_94EA:
    MOVE.W  #$0430,D0
    BSR     TRACE_MARK
    ADDQ.B  #1,($00FF042D).l  ; orig: C D 0 - - - 0x0094FA 02:94EA: EE 2D 04  INC ram_042B_enemy +
    RTS                     ; RTS  ; orig: C - - - - - 0x0094FD 02:94ED: 60        RTS



tbl_94EE_logo_palette:  ; orig: tbl_94EE_logo_palette:
    ; !! UNKNOWN: .DBYT $3F00  ; orig: - D 0 - - - 0x0094FE 02:94EE: 3F 00     .dbyt $3F00 ; ppu ad
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009500 02:94F0: 20        .byte $00 + $00 + $2

    ; [DIRECTIVE] .BYTE $36, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - - - 0x009501 02:94F1: 36        .byte $36, $0F, $00,
    ; [DIRECTIVE] .BYTE $36, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009505 02:94F5: 36        .byte $36, $17, $27,
    ; [DIRECTIVE] .BYTE $36, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - - - 0x009509 02:94F9: 36        .byte $36, $08, $1A,
    ; [DIRECTIVE] .BYTE $36, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - - - 0x00950D 02:94FD: 36        .byte $36, $30, $3B,

    ; [DIRECTIVE] .BYTE $36, $30, $3B, $16  -- needs manual handling  ; orig: - D 0 - - - 0x009511 02:9501: 36        .byte $36, $30, $3B,
    ; [DIRECTIVE] .BYTE $36, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009515 02:9505: 36        .byte $36, $17, $27,
    ; [DIRECTIVE] .BYTE $36, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - - - 0x009519 02:9509: 36        .byte $36, $08, $1A,
    ; [DIRECTIVE] .BYTE $36, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - - - 0x00951D 02:950D: 36        .byte $36, $30, $3B,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009521 02:9511: FF        .byte $FF   ; end to



ofs_9512_01:  ; orig: ofs_9512_01:
    MOVE.B  #$23,D1  ; orig: C - - J - - 0x009522 02:9512: A2 23     LDX #$23
    MOVE.B  D1,ram_0300_useless  ; orig: C - - - - - 0x009524 02:9514: 8E 00 03  STX ram_0300_useless
    MOVE.B  D1,ram_0301_buffer_index  ; orig: C - - - - - 0x009527 02:9517: 8E 01 03  STX ram_0301_buffer_
bra_951A_loop:  ; orig: bra_951A_loop:
    MOVE.B  tbl_94EE_logo_palette(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00952A 02:951A: BD EE 94  LDA tbl_94EE_logo_pa
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00952D 02:951D: 9D 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009530 02:9520: CA        DEX
    BPL     bra_951A_loop             ; BPL  ; orig: C - - - - - 0x009531 02:9521: 10 F7     BPL bra_951A_loop
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x009533 02:9523: A2 0A     LDX #$0A
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009535 02:9525: A9 00     LDA #$00
    MOVE.B  D0,($00FF042E).l  ; orig: C - - - - - 0x009537 02:9527: 8D 2E 04  STA ram_042B_enemy +
    MOVE.B  D0,($00FF042F).l  ; orig: C - - - - - 0x00953A 02:952A: 8D 2F 04  STA ram_042B_enemy +
bra_952D_loop:  ; orig: bra_952D_loop:
    MOVE.B  D0,ram_0412(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00953D 02:952D: 9D 12 04  STA ram_0412,X
    MOVE.B  D0,ram_041F(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009540 02:9530: 9D 1F 04  STA ram_041F,X
    MOVE.B  D0,ram_0437_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009543 02:9533: 9D 37 04  STA ram_0437_enemy,X
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009546 02:9536: CA        DEX
    BPL     bra_952D_loop             ; BPL  ; orig: C - - - - - 0x009547 02:9537: 10 F4     BPL bra_952D_loop
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x009549 02:9539: A2 0A     LDX #$0A
bra_953B_loop:  ; orig: bra_953B_loop:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00954B 02:953B: A9 FF     LDA #$FF
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00954D 02:953D: 95 AC     STA ram_state_obj,X
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00954F 02:953F: CA        DEX
    BNE     bra_953B_loop             ; BNE  ; orig: C - - - - - 0x009550 02:9540: D0 F9     BNE bra_953B_loop
    JMP     loc_94EA  ; orig: C - - - - - 0x009552 02:9542: 4C EA 94  JMP loc_94EA



ofs_9545_02:  ; orig: ofs_9545_02:
    MOVE.W  #$0470,D0
    BSR     TRACE_MARK
    MOVE.B  #con_music_title,D0  ; orig: C - - J - - 0x009555 02:9545: A9 80     LDA #con_music_title
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x009557 02:9547: 8D 00 06  STA ram_music
    MOVE.B  #con_ppu_buf_title_screen,D0  ; orig: C - - - - - 0x00955A 02:954A: A9 10     LDA #con_ppu_buf_tit
    JMP     loc_95A2  ; orig: C - - - - - 0x00955C 02:954C: 4C A2 95  JMP loc_95A2



tbl_954F_demo_manual_palette:  ; orig: tbl_954F_demo_manual_palette:
    DC.B $3F,$00,$20,$0F,$30,$30,$30,$0F,$21,$30,$30,$0F,$16,$30,$30,$0F
    DC.B $29,$1A,$09,$0F,$29,$37,$17,$0F,$02,$22,$30,$0F,$16,$27,$30,$0F
    DC.B $0B,$1B,$2B,$FF
    ; !! UNKNOWN: .DBYT $3F00  ; orig: - D 0 - - - 0x00955F 02:954F: 3F 00     .dbyt $3F00 ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $20  -- needs manual handling  ; orig: - D 0 - - - 0x009561 02:9551: 20        .byte $00 + $00 + $2

    ; [DIRECTIVE] .BYTE $0F, $30, $30, $30  -- needs manual handling  ; orig: - D 0 - - - 0x009562 02:9552: 0F        .byte $0F, $30, $30,
    ; [DIRECTIVE] .BYTE $0F, $21, $30, $30  -- needs manual handling  ; orig: - D 0 - - - 0x009566 02:9556: 0F        .byte $0F, $21, $30,
    ; [DIRECTIVE] .BYTE $0F, $16, $30, $30  -- needs manual handling  ; orig: - D 0 - - - 0x00956A 02:955A: 0F        .byte $0F, $16, $30,
    ; [DIRECTIVE] .BYTE $0F, $29, $1A, $09  -- needs manual handling  ; orig: - D 0 - - - 0x00956E 02:955E: 0F        .byte $0F, $29, $1A,

    ; [DIRECTIVE] .BYTE $0F, $29, $37, $17  -- needs manual handling  ; orig: - D 0 - - - 0x009572 02:9562: 0F        .byte $0F, $29, $37,
    ; [DIRECTIVE] .BYTE $0F, $02, $22, $30  -- needs manual handling  ; orig: - D 0 - - - 0x009576 02:9566: 0F        .byte $0F, $02, $22,
    ; [DIRECTIVE] .BYTE $0F, $16, $27, $30  -- needs manual handling  ; orig: - D 0 - - - 0x00957A 02:956A: 0F        .byte $0F, $16, $27,
    ; [DIRECTIVE] .BYTE $0F, $0B, $1B, $2B  -- needs manual handling  ; orig: - D 0 - - - 0x00957E 02:956E: 0F        .byte $0F, $0B, $1B,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009582 02:9572: FF        .byte $FF   ; end to



ofs_9573_01:  ; orig: ofs_9573_01:
    MOVE.B  #$23,D1  ; orig: C - - J - - 0x009583 02:9573: A2 23     LDX #$23
    MOVE.B  D1,ram_0300_useless  ; orig: C - - - - - 0x009585 02:9575: 8E 00 03  STX ram_0300_useless
    MOVE.B  D1,ram_0301_buffer_index  ; orig: C - - - - - 0x009588 02:9578: 8E 01 03  STX ram_0301_buffer_
bra_957B_loop:  ; orig: bra_957B_loop:
    MOVE.B  tbl_954F_demo_manual_palette(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00958B 02:957B: BD 4F 95  LDA tbl_954F_demo_ma
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00958E 02:957E: 9D 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009591 02:9581: CA        DEX
    BPL     bra_957B_loop             ; BPL  ; orig: C - - - - - 0x009592 02:9582: 10 F7     BPL bra_957B_loop
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x009594 02:9584: A2 0A     LDX #$0A
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009596 02:9586: A9 00     LDA #$00
bra_9588_loop:  ; orig: bra_9588_loop:
    MOVE.B  D0,ram_0412(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009598 02:9588: 9D 12 04  STA ram_0412,X
    MOVE.B  D0,ram_041F(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00959B 02:958B: 9D 1F 04  STA ram_041F,X
    MOVE.B  D0,ram_0437_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00959E 02:958E: 9D 37 04  STA ram_0437_enemy,X
    MOVE.B  D0,ram_0444_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0095A1 02:9591: 9D 44 04  STA ram_0444_enemy,X
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0095A4 02:9594: CA        DEX
    BPL     bra_9588_loop             ; BPL  ; orig: C - - - - - 0x0095A5 02:9595: 10 F1     BPL bra_9588_loop
    JMP     loc_94EA  ; orig: C - - - - - 0x0095A7 02:9597: 4C EA 94  JMP loc_94EA



ofs_959A_02:  ; orig: ofs_959A_02:
    ADDQ.B  #1,ram_005C  ; orig: C - - J - - 0x0095AA 02:959A: E6 5C     INC ram_005C
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0095AC 02:959C: A9 10     LDA #$10
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x0095AE 02:959E: 85 FC     STA ram_scroll_Y
    MOVE.B  #con_ppu_buf_guide,D0  ; orig: C - - - - - 0x0095B0 02:95A0: A9 02     LDA #con_ppu_buf_gui
loc_95A2:  ; orig: loc_95A2:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C D 0 - - - 0x0095B2 02:95A2: 85 14     STA ram_ppu_load_ind
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0095B4 02:95A4: A9 00     LDA #$00
    MOVE.B  D0,($00FF042D).l  ; orig: C - - - - - 0x0095B6 02:95A6: 8D 2D 04  STA ram_042B_enemy +
    MOVE.W  #$0431,D0
    BSR     TRACE_MARK
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0095B9 02:95A9: E6 11     INC ram_0011_screen_
    RTS                     ; RTS  ; orig: C - - - - - 0x0095BB 02:95AB: 60        RTS



ofs_007_95AC_00:  ; orig: ofs_007_95AC_00:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - J - - 0x0095BC 02:95AC: A5 15     LDA ram_frm_cnt
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0095BE 02:95AE: 29 01     AND #$01
    BEQ     bra_95BD             ; BEQ  ; orig: C - - - - - 0x0095C0 02:95B0: F0 0B     BEQ bra_95BD
    ADDQ.B  #1,ram_041A  ; orig: C - - - - - 0x0095C2 02:95B2: EE 1A 04  INC ram_041A
    MOVE.B  ram_041A,D0  ; orig: C - - - - - 0x0095C5 02:95B5: AD 1A 04  LDA ram_041A
    BNE     bra_95BD             ; BNE  ; orig: C - - - - - 0x0095C8 02:95B8: D0 03     BNE bra_95BD
    JMP     loc_94EA  ; orig: C - - - - - 0x0095CA 02:95BA: 4C EA 94  JMP loc_94EA
bra_95BD:  ; orig: bra_95BD:

; bzk optimize, JMP
    BSR     sub_986B             ; JSR -> BSR  ; orig: C - - - - - 0x0095CD 02:95BD: 20 6B 98  JSR sub_986B
    RTS                     ; RTS  ; orig: C - - - - - 0x0095D0 02:95C0: 60        RTS



ofs_008_95C1_00:  ; orig: ofs_008_95C1_00:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - J - - 0x0095D1 02:95C1: A5 15     LDA ram_frm_cnt
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0095D3 02:95C3: 29 01     AND #$01
    BEQ     bra_95D8             ; BEQ  ; orig: C - - - - - 0x0095D5 02:95C5: F0 11     BEQ bra_95D8
    ADDQ.B  #1,ram_scroll_Y  ; orig: C - - - - - 0x0095D7 02:95C7: E6 FC     INC ram_scroll_Y
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x0095D9 02:95C9: A5 FC     LDA ram_scroll_Y
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x0095DB 02:95CB: C9 F0     CMP #$F0
    BNE     bra_95D8             ; BNE  ; orig: C - - - - - 0x0095DD 02:95CD: D0 09     BNE bra_95D8
    ADDQ.B  #1,ram_0415  ; orig: C - - - - - 0x0095DF 02:95CF: EE 15 04  INC ram_0415
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0095E2 02:95D2: A9 00     LDA #$00
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x0095E4 02:95D4: 85 FC     STA ram_scroll_Y
    ADDQ.B  #1,ram_005C  ; orig: C - - - - - 0x0095E6 02:95D6: E6 5C     INC ram_005C
bra_95D8:  ; orig: bra_95D8:
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x0095E8 02:95D8: A5 FC     LDA ram_scroll_Y
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x0095EA 02:95DA: C9 08     CMP #$08
    BNE     bra_95EB_RTS             ; BNE  ; orig: C - - - - - 0x0095EC 02:95DC: D0 0D     BNE bra_95EB_RTS
    MOVE.B  ram_0415,D0  ; orig: C - - - - - 0x0095EE 02:95DE: AD 15 04  LDA ram_0415
    BEQ     bra_95EB_RTS             ; BEQ  ; orig: C - - - - - 0x0095F1 02:95E1: F0 08     BEQ bra_95EB_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0095F3 02:95E3: A9 00     LDA #$00
    MOVE.B  D0,ram_0415  ; orig: C - - - - - 0x0095F5 02:95E5: 8D 15 04  STA ram_0415
    ADDQ.B  #1,($00FF042D).l  ; orig: C - - - - - 0x0095F8 02:95E8: EE 2D 04  INC ram_042B_enemy +
bra_95EB_RTS:  ; orig: bra_95EB_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0095FB 02:95EB: 60        RTS



ofs_008_95EC_01:  ; orig: ofs_008_95EC_01:

; triggers during manual
    ADDQ.B  #1,ram_041A  ; orig: C - - J - - 0x0095FC 02:95EC: EE 1A 04  INC ram_041A
    MOVE.B  ram_041A,D0  ; orig: C - - - - - 0x0095FF 02:95EF: AD 1A 04  LDA ram_041A
    BNE     bra_95F7             ; BNE  ; orig: C - - - - - 0x009602 02:95F2: D0 03     BNE bra_95F7
    MOVE.W  #$0432,D0
    BSR     TRACE_MARK
    ADDQ.B  #1,($00FF042D).l  ; orig: C - - - - - 0x009604 02:95F4: EE 2D 04  INC ram_042B_enemy +
bra_95F7:  ; orig: bra_95F7:
    MOVE.B  #$29,D0  ; orig: C - - - - - 0x009607 02:95F7: A9 29     LDA #$29
    MOVE.B  D0,ram_041D  ; orig: C - - - - - 0x009609 02:95F9: 8D 1D 04  STA ram_041D
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00960C 02:95FC: A9 00     LDA #$00
    MOVE.B  D0,ram_041C  ; orig: C - - - - - 0x00960E 02:95FE: 8D 1C 04  STA ram_041C
    MOVE.B  #$2B,D0  ; orig: C - - - - - 0x009611 02:9601: A9 2B     LDA #$2B
    MOVE.B  D0,ram_0418  ; orig: C - - - - - 0x009613 02:9603: 8D 18 04  STA ram_0418
    MOVE.B  #$E0,D0  ; orig: C - - - - - 0x009616 02:9606: A9 E0     LDA #$E0
    MOVE.B  D0,ram_0417  ; orig: C - - - - - 0x009618 02:9608: 8D 17 04  STA ram_0417
    RTS                     ; RTS  ; orig: C - - - - - 0x00961B 02:960B: 60        RTS



ofs_008_960C_02:  ; orig: ofs_008_960C_02:
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - J - - 0x00961C 02:960C: 20 F7 E5  JSR sub_0x01E607_hid
    BSR     sub_972A             ; JSR -> BSR  ; orig: C - - - - - 0x00961F 02:960F: 20 2A 97  JSR sub_972A
    BSR     sub_979D             ; JSR -> BSR  ; orig: C - - - - - 0x009622 02:9612: 20 9D 97  JSR sub_979D
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x009625 02:9615: A5 15     LDA ram_frm_cnt
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x009627 02:9617: 29 01     AND #$01
    BEQ     bra_963E_RTS             ; BEQ  ; orig: C - - - - - 0x009629 02:9619: F0 23     BEQ bra_963E_RTS
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x00962B 02:961B: A2 0A     LDX #$0A
bra_961D_loop:  ; orig: bra_961D_loop:
    MOVEA.L #$FF0084,A0  ; Fix X: ; orig: C - - - - - 0x00962D 02:961D: D6 84     DEC ram_pos_Y_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00962F 02:961F: CA        DEX
    BNE     bra_961D_loop             ; BNE  ; orig: C - - - - - 0x009630 02:9620: D0 FB     BNE bra_961D_loop
    ADDQ.B  #1,ram_041B  ; orig: C - - - - - 0x009632 02:9622: EE 1B 04  INC ram_041B
    MOVE.B  ram_041B,D0  ; orig: C - - - - - 0x009635 02:9625: AD 1B 04  LDA ram_041B
    BNE     bra_962D             ; BNE  ; orig: C - - - - - 0x009638 02:9628: D0 03     BNE bra_962D
    ADDQ.B  #1,ram_0415  ; orig: C - - - - - 0x00963A 02:962A: EE 15 04  INC ram_0415
bra_962D:  ; orig: bra_962D:
    MOVE.B  ram_0415,D0  ; orig: C - - - - - 0x00963D 02:962D: AD 15 04  LDA ram_0415
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x009640 02:9630: C9 05     CMP #$05
    BNE     bra_963F             ; BNE  ; orig: C - - - - - 0x009642 02:9632: D0 0B     BNE bra_963F
    MOVE.B  ram_041B,D0  ; orig: C - - - - - 0x009644 02:9634: AD 1B 04  LDA ram_041B
    CMPI.B  #$80,D0  ; orig: C - - - - - 0x009647 02:9637: C9 80     CMP #$80
    BNE     bra_963F             ; BNE  ; orig: C - - - - - 0x009649 02:9639: D0 04     BNE bra_963F
    ADDQ.B  #1,($00FF042D).l  ; orig: C - - - - - 0x00964B 02:963B: EE 2D 04  INC ram_042B_enemy +
bra_963E_RTS:  ; orig: bra_963E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00964E 02:963E: 60        RTS
bra_963F:  ; orig: bra_963F:
    ADDQ.B  #1,ram_scroll_Y  ; orig: C - - - - - 0x00964F 02:963F: E6 FC     INC ram_scroll_Y
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x009651 02:9641: A5 FC     LDA ram_scroll_Y
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x009653 02:9643: C9 F0     CMP #$F0
    BNE     bra_964D             ; BNE  ; orig: C - - - - - 0x009655 02:9645: D0 06     BNE bra_964D
    ADDQ.B  #1,ram_005C  ; orig: C - - - - - 0x009657 02:9647: E6 5C     INC ram_005C
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009659 02:9649: A9 00     LDA #$00
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x00965B 02:964B: 85 FC     STA ram_scroll_Y
bra_964D:  ; orig: bra_964D:
    MOVE.B  ram_041B,D0  ; orig: C - - - - - 0x00965D 02:964D: AD 1B 04  LDA ram_041B
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x009660 02:9650: 29 07     AND #$07
    BNE     bra_963E_RTS             ; BNE  ; orig: C - - - - - 0x009662 02:9652: D0 EA     BNE bra_963E_RTS
    BSR     sub_973A             ; JSR -> BSR  ; orig: C - - - - - 0x009664 02:9654: 20 3A 97  JSR sub_973A
    MOVE.B  #$20,D1  ; orig: C - - - - - 0x009667 02:9657: A2 20     LDX #$20
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009669 02:9659: A9 FF     LDA #$FF
    MOVEA.L #$FF0305,A0  ; Fix X: ; orig: C - - - - - 0x00966B 02:965B: 9D 05 03  STA ram_0302_ppu_buf
    MOVE.B  D0,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00966E 02:965E: CA        DEX ; 1F
bra_965F_loop:  ; orig: bra_965F_loop:
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00966F 02:965F: A9 24     LDA #$24
    MOVEA.L #$FF0305,A0  ; Fix X: ; orig: C - - - - - 0x009671 02:9661: 9D 05 03  STA ram_0302_ppu_buf
    MOVE.B  D0,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009674 02:9664: CA        DEX
    BPL     bra_965F_loop             ; BPL  ; orig: C - - - - - 0x009675 02:9665: 10 F8     BPL bra_965F_loop
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x009677 02:9667: A9 20     LDA #$20
    MOVE.B  D0,($00FF0304).l  ; orig: C - - - - - 0x009679 02:9669: 8D 04 03  STA ram_0302_ppu_buf
    MOVE.B  ram_041D,D0  ; orig: C - - - - - 0x00967C 02:966C: AD 1D 04  LDA ram_041D
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x00967F 02:966F: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  ram_041C,D0  ; orig: C - - - - - 0x009682 02:9672: AD 1C 04  LDA ram_041C
    MOVE.B  D0,($00FF0303).l  ; orig: C - - - - - 0x009685 02:9675: 8D 03 03  STA ram_0302_ppu_buf
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009688 02:9678: 18        CLC
    ADDX.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009689 02:9679: 69 20     ADC #$20
    MOVE.B  D0,ram_041C  ; orig: C - - - - - 0x00968B 02:967B: 8D 1C 04  STA ram_041C
    BNE     bra_9686             ; BNE  ; orig: C - - - - - 0x00968E 02:967E: D0 06     BNE bra_9686
    ADDQ.B  #1,ram_041D  ; orig: C - - - - - 0x009690 02:9680: EE 1D 04  INC ram_041D
    JMP     loc_96A7  ; orig: C - - - - - 0x009693 02:9683: 4C A7 96  JMP loc_96A7
bra_9686:  ; orig: bra_9686:
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x009696 02:9686: C9 C0     CMP #$C0
    BNE     bra_96A7             ; BNE  ; orig: C - - - - - 0x009698 02:9688: D0 1D     BNE bra_96A7
    MOVE.B  ram_041D,D0  ; orig: C - - - - - 0x00969A 02:968A: AD 1D 04  LDA ram_041D
    CMPI.B  #$2B,D0  ; orig: C - - - - - 0x00969D 02:968D: C9 2B     CMP #$2B
    BNE     bra_9699             ; BNE  ; orig: C - - - - - 0x00969F 02:968F: D0 08     BNE bra_9699
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0096A1 02:9691: A9 20     LDA #$20
    MOVE.B  D0,ram_041D  ; orig: C - - - - - 0x0096A3 02:9693: 8D 1D 04  STA ram_041D
    JMP     loc_96A2  ; orig: C - - - - - 0x0096A6 02:9696: 4C A2 96  JMP loc_96A2
bra_9699:  ; orig: bra_9699:
    CMPI.B  #$23,D0  ; orig: C - - - - - 0x0096A9 02:9699: C9 23     CMP #$23
    BNE     bra_96A7             ; BNE  ; orig: C - - - - - 0x0096AB 02:969B: D0 0A     BNE bra_96A7
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x0096AD 02:969D: A9 28     LDA #$28
    MOVE.B  D0,ram_041D  ; orig: C - - - - - 0x0096AF 02:969F: 8D 1D 04  STA ram_041D
loc_96A2:  ; orig: loc_96A2:
    MOVE.B  #$00,D0  ; orig: C D 0 - - - 0x0096B2 02:96A2: A9 00     LDA #$00
    MOVE.B  D0,ram_041C  ; orig: C - - - - - 0x0096B4 02:96A4: 8D 1C 04  STA ram_041C
bra_96A7:  ; orig: bra_96A7:
loc_96A7:  ; orig: loc_96A7:
    MOVE.B  ram_0419,D1  ; orig: C D 0 - - - 0x0096B7 02:96A7: AE 19 04  LDX ram_0419
    MOVE.B  tbl_915E(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0096BA 02:96AA: BD 5E 91  LDA tbl_915E,X
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x0096BD 02:96AD: 29 80     AND #$80
    BEQ     bra_96D6             ; BEQ  ; orig: C - - - - - 0x0096BF 02:96AF: F0 25     BEQ bra_96D6
    MOVE.B  ($00FF042E).l,D0  ; orig: C - - - - - 0x0096C1 02:96B1: AD 2E 04  LDA ram_042B_enemy +
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0096C4 02:96B4: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0096C5 02:96B5: AA        TAX
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0096C6 02:96B6: A0 00     LDY #$00
    MOVE.B  tbl_94AD_demo_manual_text(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0096C8 02:96B8: BD AD 94  LDA tbl_94AD_demo_ma
    MOVE.B  D0,ram_0000_t17_demo_manual_text_data  ; orig: C - - - - - 0x0096CB 02:96BB: 85 00     STA ram_0000_t17_dem
    MOVEA.L #$FF94AE,A0  ; Fix X: ; orig: C - - - - - 0x0096CD 02:96BD: BD AE 94  LDA tbl_94AD_demo_ma
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,ram_0001_t17  ; orig: C - - - - - 0x0096D0 02:96C0: 85 01     STA ram_0000_t17_dem
    MOVEA.W ($FF0000+ram_0000_t17_demo_manual_text_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0096D2 02:96C2: B1 00     LDA (ram_0000_t17_de
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0096D4 02:96C4: AA        TAX
loc_96C5_loop:  ; orig: loc_96C5_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C D 0 - - - 0x0096D5 02:96C5: C8        INY
    MOVEA.W ($FF0000+ram_0000_t17_demo_manual_text_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0096D6 02:96C6: B1 00     LDA (ram_0000_t17_de
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x0096D8 02:96C8: C9 FF     CMP #$FF
    BEQ     bra_96D3_FF             ; BEQ  ; orig: C - - - - - 0x0096DA 02:96CA: F0 07     BEQ bra_96D3_FF
    MOVEA.L #$FF0305,A0  ; Fix X: ; orig: C - - - - - 0x0096DC 02:96CC: 9D 05 03  STA ram_0302_ppu_buf
    MOVE.B  D0,(A0,D1.L)  ; ^
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0096DF 02:96CF: E8        INX
    JMP     loc_96C5_loop  ; orig: C - - - - - 0x0096E0 02:96D0: 4C C5 96  JMP loc_96C5_loop
bra_96D3_FF:  ; orig: bra_96D3_FF:
    MOVE.W  #$0434,D0
    BSR     TRACE_MARK
    ADDQ.B  #1,($00FF042E).l  ; orig: C - - - - - 0x0096E3 02:96D3: EE 2E 04  INC ram_042B_enemy +
bra_96D6:  ; orig: bra_96D6:
    BSR     sub_96DD             ; JSR -> BSR  ; orig: C - - - - - 0x0096E6 02:96D6: 20 DD 96  JSR sub_96DD
    ADDQ.B  #1,ram_0419  ; orig: C - - - - - 0x0096E9 02:96D9: EE 19 04  INC ram_0419
    RTS                     ; RTS  ; orig: C - - - - - 0x0096EC 02:96DC: 60        RTS



sub_96DD:  ; orig: sub_96DD:
    MOVE.B  ram_0419,D1  ; orig: C - - - - - 0x0096ED 02:96DD: AE 19 04  LDX ram_0419
    MOVE.B  tbl_915E(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0096F0 02:96E0: BD 5E 91  LDA tbl_915E,X
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x0096F3 02:96E3: 29 40     AND #$40
    BEQ     bra_9729_RTS             ; BEQ  ; orig: C - - - - - 0x0096F5 02:96E5: F0 42     BEQ bra_9729_RTS
    MOVE.B  ram_0418,D0  ; orig: C - - - - - 0x0096F7 02:96E7: AD 18 04  LDA ram_0418
    MOVE.B  D0,($00FF0325).l  ; orig: C - - - - - 0x0096FA 02:96EA: 8D 25 03  STA ram_0302_ppu_buf
    MOVE.B  ram_0417,D0  ; orig: C - - - - - 0x0096FD 02:96ED: AD 17 04  LDA ram_0417
    MOVE.B  D0,($00FF0326).l  ; orig: C - - - - - 0x009700 02:96F0  STA ram_0302_ppu_buf
    MOVE.B  #$48,D0  ; orig: C - - - - - 0x009703 02:96F3: A9 48     LDA #$48
    MOVE.B  D0,($00FF0327).l  ; orig: C - - - - - 0x009705 02:96F5  STA ram_0302_ppu_buf
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009708 02:96F8: A9 00     LDA #$00
    MOVE.B  D0,($00FF0328).l  ; orig: C - - - - - 0x00970A 02:96FA  STA ram_0302_ppu_buf
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00970D 02:96FD: A9 FF     LDA #$FF
    MOVE.B  D0,($00FF0329).l  ; orig: C - - - - - 0x00970F 02:96FF  STA ram_0302_ppu_buf
    ADDQ.B  #1,ram_0416  ; orig: C - - - - - 0x009712 02:9702: EE 16 04  INC ram_0416
    MOVE.B  ram_0417,D0  ; orig: C - - - - - 0x009715 02:9705: AD 17 04  LDA ram_0417
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009718 02:9708: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009719 02:9709: 69 08     ADC #$08
    MOVE.B  D0,ram_0417  ; orig: C - - - - - 0x00971B 02:970B: 8D 17 04  STA ram_0417
    BNE     bra_9729_RTS             ; BNE  ; orig: C - - - - - 0x00971E 02:970E: D0 19     BNE bra_9729_RTS
    MOVE.B  ram_0418,D0  ; orig: C - - - - - 0x009720 02:9710: AD 18 04  LDA ram_0418
    CMPI.B  #$23,D0  ; orig: C - - - - - 0x009723 02:9713: C9 23     CMP #$23
    BNE     bra_971F             ; BNE  ; orig: C - - - - - 0x009725 02:9715: D0 08     BNE bra_971F
    MOVE.B  #$2B,D0  ; orig: C - - - - - 0x009727 02:9717: A9 2B     LDA #$2B
    MOVE.B  D0,ram_0418  ; orig: C - - - - - 0x009729 02:9719: 8D 18 04  STA ram_0418
    JMP     loc_9724  ; orig: C - - - - - 0x00972C 02:971C: 4C 24 97  JMP loc_9724
bra_971F:  ; orig: bra_971F:
    MOVE.B  #$23,D0  ; orig: C - - - - - 0x00972F 02:971F: A9 23     LDA #$23
    MOVE.B  D0,ram_0418  ; orig: C - - - - - 0x009731 02:9721: 8D 18 04  STA ram_0418
loc_9724:  ; orig: loc_9724:
    MOVE.B  #$C0,D0  ; orig: C D 0 - - - 0x009734 02:9724: A9 C0     LDA #$C0
    MOVE.B  D0,ram_0417  ; orig: C - - - - - 0x009736 02:9726: 8D 17 04  STA ram_0417
bra_9729_RTS:  ; orig: bra_9729_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x009739 02:9729: 60        RTS



sub_972A:  ; orig: sub_972A:
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x00973A 02:972A: A2 0A     LDX #$0A
bra_972C_loop:  ; orig: bra_972C_loop:
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00973C 02:972C: B5 84     LDA ram_pos_Y_enemy,
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x00973E 02:972E: C9 F0     CMP #$F0
    BNE     bra_9736             ; BNE  ; orig: C - - - - - 0x009740 02:9730: D0 04     BNE bra_9736
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009742 02:9732: A9 FF     LDA #$FF
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009744 02:9734: 95 AC     STA ram_state_obj,X
bra_9736:  ; orig: bra_9736:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009746 02:9736: CA        DEX
    BNE     bra_972C_loop             ; BNE  ; orig: C - - - - - 0x009747 02:9737: D0 F3     BNE bra_972C_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x009749 02:9739: 60        RTS



sub_973A:  ; orig: sub_973A:
    MOVE.B  ram_0419,D2  ; orig: C - - - - - 0x00974A 02:973A: AC 19 04  LDY ram_0419
    MOVE.B  tbl_915E(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00974D 02:973D: B9 5E 91  LDA tbl_915E,Y
    ANDI.B  #$20,D0  ; orig: C - - - - - 0x009750 02:9740: 29 20     AND #$20
    BNE     bra_9745             ; BNE  ; orig: C - - - - - 0x009752 02:9742: D0 01     BNE bra_9745
    RTS                     ; RTS  ; orig: C - - - - - 0x009754 02:9744: 60        RTS
bra_9745:  ; orig: bra_9745:
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x009755 02:9745: A2 0A     LDX #$0A
loc_9747_loop:  ; orig: loc_9747_loop:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C D 0 - - - 0x009757 02:9747: B5 AC     LDA ram_state_obj,X
    BNE     bra_974F             ; BNE  ; orig: C - - - - - 0x009759 02:9749: D0 04     BNE bra_974F
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00975B 02:974B: CA        DEX
    JMP     loc_9747_loop  ; orig: C - - - - - 0x00975C 02:974C: 4C 47 97  JMP loc_9747_loop
bra_974F:  ; orig: bra_974F:
    ; (empty translation for LDY)  ; orig: C - - - - - 0x00975F 02:974F: AC 2F 04  LDY ram_042B_enemy +
    MOVE.B  tbl_9240(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009762 02:9752: B9 40 92  LDA tbl_9240,Y
    MOVE.B  D0,ram_0444_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009765 02:9755: 9D 44 04  STA ram_0444_enemy,X
    MOVE.B  #$EF,D0  ; orig: C - - - - - 0x009768 02:9758: A9 EF     LDA #$EF
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00976A 02:975A: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  tbl_9268_pos_X_44,D0  ; orig: C - - - - - 0x00976C 02:975C: AD 68 92  LDA tbl_9268_pos_X_4
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00976F 02:975F: 95 70     STA ram_pos_X_enemy,
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009771 02:9761: A9 00     LDA #$00
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009773 02:9763: 95 AC     STA ram_state_obj,X
    MOVE.B  ram_0444_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009775 02:9765: BD 44 04  LDA ram_0444_enemy,X
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x009778 02:9768: C9 30     CMP #$30
    BCS     bra_9796             ; BCS  ; orig: C - - - - - 0x00977A 02:976A: B0 2A     BCS bra_9796
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00977C 02:976C: CA        DEX
    MOVE.B  tbl_9256(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00977D 02:976D: B9 56 92  LDA tbl_9256,Y
    MOVE.B  D0,ram_0444_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009780 02:9770: 9D 44 04  STA ram_0444_enemy,X
    MOVE.B  #$EF,D0  ; orig: C - - - - - 0x009783 02:9773: A9 EF     LDA #$EF
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009785 02:9775: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  tbl_9269_pos_X_AC,D0  ; orig: C - - - - - 0x009787 02:9777: AD 69 92  LDA tbl_9269_pos_X_A
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00978A 02:977A: 95 70     STA ram_pos_X_enemy,
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00978C 02:977C: A9 00     LDA #$00
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00978E 02:977E: 95 AC     STA ram_state_obj,X
    MOVE.B  tbl_9240(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009790 02:9780: B9 40 92  LDA tbl_9240,Y
    CMPI.B  #$1B,D0  ; orig: C - - - - - 0x009793 02:9783: C9 1B     CMP #$1B
    BNE     bra_9792             ; BNE  ; orig: C - - - - - 0x009795 02:9785: D0 0B     BNE bra_9792
    MOVE.B  #$78,D0  ; orig: C - - - - - 0x009797 02:9787: A9 78     LDA #$78
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009799 02:9789: 95 70     STA ram_pos_X_enemy,
    ; (empty translation for STA)  ; orig: C - - - - - 0x00979B 02:978B: 95 71     STA ram_pos_X_enemy 
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00979D 02:978D: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: C - - - - - 0x00979F 02:978F: 8D 30 04  STA ram_042B_enemy +
bra_9792:  ; orig: bra_9792:
loc_9792:  ; orig: loc_9792:
    ; (empty translation for INC)  ; orig: C D 0 - - - 0x0097A2 02:9792: EE 2F 04  INC ram_042B_enemy +
    RTS                     ; RTS  ; orig: C - - - - - 0x0097A5 02:9795: 60        RTS
bra_9796:  ; orig: bra_9796:
    MOVE.B  #$68,D0  ; orig: C - - - - - 0x0097A6 02:9796: A9 68     LDA #$68
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0097A8 02:9798: 95 70     STA ram_pos_X_enemy,
    JMP     loc_9792  ; orig: C - - - - - 0x0097AA 02:979A: 4C 92 97  JMP loc_9792



sub_979D:  ; orig: sub_979D:
    MOVE.B  #$0A,D1  ; orig: C - - - - - 0x0097AD 02:979D: A2 0A     LDX #$0A
bra_979F_loop:  ; orig: bra_979F_loop:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0097AF 02:979F: B5 AC     LDA ram_state_obj,X
    BNE     bra_97C1             ; BNE  ; orig: C - - - - - 0x0097B1 02:97A1: D0 1E     BNE bra_97C1
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0097B3 02:97A3: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0097B4 02:97A4: 48        PHA
    MOVE.B  ram_0444_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0097B5 02:97A5: BD 44 04  LDA ram_0444_enemy,X
    CMPI.B  #$23,D0  ; orig: C - - - - - 0x0097B8 02:97A8: C9 23     CMP #$23
    BNE     bra_97B2             ; BNE  ; orig: C - - - - - 0x0097BA 02:97AA: D0 06     BNE bra_97B2
    BSR     sub_97D8             ; JSR -> BSR  ; orig: C - - - - - 0x0097BC 02:97AC: 20 D8 97  JSR sub_97D8
    JMP     loc_97BF  ; orig: C - - - - - 0x0097BF 02:97AF: 4C BF 97  JMP loc_97BF
bra_97B2:  ; orig: bra_97B2:
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x0097C2 02:97B2: C9 30     CMP #$30
    BCS     bra_97BC             ; BCS  ; orig: C - - - - - 0x0097C4 02:97B4: B0 06     BCS bra_97BC
    BSR     sub_0x01E71E             ; JSR -> BSR  ; orig: C - - - - - 0x0097C6 02:97B6: 20 0E E7  JSR sub_0x01E71E
    JMP     loc_97BF  ; orig: C - - - - - 0x0097C9 02:97B9: 4C BF 97  JMP loc_97BF
bra_97BC:  ; orig: bra_97BC:
    BSR     sub_97EA             ; JSR -> BSR  ; orig: C - - - - - 0x0097CC 02:97BC: 20 EA 97  JSR sub_97EA
loc_97BF:  ; orig: loc_97BF:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C D 0 - - - 0x0097CF 02:97BF: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0097D0 02:97C0: AA        TAX
bra_97C1:  ; orig: bra_97C1:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0097D1 02:97C1: CA        DEX
    BNE     bra_979F_loop             ; BNE  ; orig: C - - - - - 0x0097D2 02:97C2: D0 DB     BNE bra_979F_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0097D4 02:97C4: 60        RTS



; bzk garbage
    MOVE.B  #$04,D1  ; orig: - - - - - - 0x0097D5 02:97C5: A2 04     LDX #$04
    CMPI.B  #$14,D0  ; orig: - - - - - - 0x0097D7 02:97C7: C9 14     CMP #$14
    BNE     bra_97CD             ; BNE  ; orig: - - - - - - 0x0097D9 02:97C9: D0 02     BNE bra_97CD
    MOVE.B  #$0C,D1  ; orig: - - - - - - 0x0097DB 02:97CB: A2 0C     LDX #$0C
bra_97CD:  ; orig: bra_97CD:
bra_97CD_loop:  ; orig: bra_97CD_loop:
    ; (empty translation for DEC)  ; orig: - - - - - - 0x0097DD 02:97CD: DE 50 02  DEC ram_spr_Y + $50,
    MOVE.B  D0,D1           ; TAX  ; orig: - - - - - - 0x0097E0 02:97D0: AA        TAX
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - - - - - - 0x0097E1 02:97D1: 38        SEC
    SUBX.B  #$04,D0       ; SBC imm  ; orig: - - - - - - 0x0097E2 02:97D2: E9 04     SBC #$04
    MOVE.B  D0,D1           ; TAX  ; orig: - - - - - - 0x0097E4 02:97D4: AA        TAX
    BPL     bra_97CD_loop             ; BPL  ; orig: - - - - - - 0x0097E5 02:97D5: 10 F6     BPL bra_97CD_loop
    RTS                     ; RTS  ; orig: - - - - - - 0x0097E7 02:97D7: 60        RTS



sub_97D8:  ; orig: sub_97D8:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x0097E8 02:97D8: 20 93 FA  JSR sub_0x01FAA3
    BSR     sub_bat_7986             ; JSR -> BSR  ; orig: C - - - - - 0x0097EB 02:97DB: 20 86 79  JSR sub_bat_7986
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0097EE 02:97DE: 0A        ASL
    AND.B   ram_frm_cnt,D0  ; orig: C - - - - - 0x0097EF 02:97DF: 25 15     AND ram_frm_cnt

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0097F1 02:97E1: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0097F2 02:97E2: 4A        LSR
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x0097F3 02:97E3: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$14,D2  ; orig: C - - - - - 0x0097F5 02:97E5: A0 14     LDY #$14
    JMP     loc_bat_7915  ; orig: C - - - - - 0x0097F7 02:97E7: 4C 15 79  JMP loc_bat_7915



sub_97EA:  ; orig: sub_97EA:
    MOVE.B  ram_0444_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0097FA 02:97EA: BD 44 04  LDA ram_0444_enemy,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0097FD 02:97ED: 29 0F     AND #$0F

; * 06
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0097FF 02:97EF: 0A        ASL
    MOVE.B  D0,ram_0000_t45  ; orig: C - - - - - 0x009800 02:97F0: 85 00     STA ram_0000_t45
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009802 02:97F2: 0A        ASL

; bzk optimize, value is too low, no need for CLC after ASL
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009803 02:97F3: 18        CLC
    ADDX.B  ram_0000_t45,D0  ; orig: C - - - - - 0x009804 02:97F4: 65 00     ADC ram_0000_t45
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009806 02:97F6: A8        TAY
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009807 02:97F7: B5 84     LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0000_t46_spr_Y  ; orig: C - - - - - 0x009809 02:97F9: 85 00     STA ram_0000_t46_spr
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00980B 02:97FB: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0001_t12_spr_X  ; orig: C - - - - - 0x00980D 02:97FD: 85 01     STA ram_0001_t12_spr
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x00980F 02:97FF: A9 05     LDA #$05
    MOVE.B  D0,ram_0002_t16_sprites_counter  ; orig: C - - - - - 0x009811 02:9801: 85 02     STA ram_0002_t16_spr
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x009813 02:9803: 98        TYA

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009814 02:9804: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009815 02:9805: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x009816 02:9806: AA        TAX
bra_9807_loop:  ; orig: bra_9807_loop:
    MOVE.B  tbl_926A_spr_T(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009817 02:9807: B9 6A 92  LDA tbl_926A_spr_T,Y
    BEQ     bra_9823_skip             ; BEQ  ; orig: C - - - - - 0x00981A 02:980A: F0 17     BEQ bra_9823_skip
    MOVE.B  D0,ram_spr_T(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00981C 02:980C: 9D 01 02  STA ram_spr_T,X
    MOVE.B  ram_0000_t46_spr_Y,D0  ; orig: C - - - - - 0x00981F 02:980F: A5 00     LDA ram_0000_t46_spr
    MOVE.B  D0,ram_spr_Y(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009821 02:9811: 9D 00 02  STA ram_spr_Y,X
    MOVE.B  tbl_9282_spr_A(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009824 02:9814: B9 82 92  LDA tbl_9282_spr_A,Y
    MOVE.B  D0,ram_spr_A(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009827 02:9817: 9D 02 02  STA ram_spr_A,X
    MOVE.B  ram_0001_t12_spr_X,D0  ; orig: C - - - - - 0x00982A 02:981A: A5 01     LDA ram_0001_t12_spr
    MOVE.B  D0,ram_spr_X(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00982C 02:981C: 9D 03 02  STA ram_spr_X,X
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00982F 02:981F: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009830 02:9820: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009831 02:9821: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009832 02:9822: E8        INX
bra_9823_skip:  ; orig: bra_9823_skip:
    MOVE.B  ram_0001_t12_spr_X,D0  ; orig: C - - - - - 0x009833 02:9823: A5 01     LDA ram_0001_t12_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009835 02:9825: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009836 02:9826: 69 08     ADC #$08
    MOVE.B  D0,ram_0001_t12_spr_X  ; orig: C - - - - - 0x009838 02:9828: 85 01     STA ram_0001_t12_spr
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00983A 02:982A: C8        INY
    SUBQ.B  #1,ram_0002_t16_sprites_counter  ; orig: C - - - - - 0x00983B 02:982B: C6 02     DEC ram_0002_t16_spr
    BPL     bra_9807_loop             ; BPL  ; orig: C - - - - - 0x00983D 02:982D: 10 D8     BPL bra_9807_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x00983F 02:982F: 60        RTS



ofs_008_9830_03:  ; orig: ofs_008_9830_03:
    ADDQ.B  #1,ram_041A  ; orig: C - - J - - 0x009840 02:9830: EE 1A 04  INC ram_041A
    MOVE.B  ram_041A,D0  ; orig: C - - - - - 0x009843 02:9833: AD 1A 04  LDA ram_041A
    BNE     bra_9854             ; BNE  ; orig: C - - - - - 0x009846 02:9836: D0 1C     BNE bra_9854
    ; (empty translation for INC)  ; orig: C - - - - - 0x009848 02:9838: EE 2D 04  INC ram_042B_enemy +
    RTS                     ; RTS  ; orig: C - - - - - 0x00984B 02:983B: 60        RTS



ofs_008_983C_04:  ; orig: ofs_008_983C_04:
    ADDQ.B  #1,ram_041A  ; orig: C - - J - - 0x00984C 02:983C: EE 1A 04  INC ram_041A
    MOVE.B  ram_041A,D0  ; orig: C - - - - - 0x00984F 02:983F: AD 1A 04  LDA ram_041A
    CMPI.B  #$39,D0  ; orig: C - - - - - 0x009852 02:9842: C9 39     CMP #$39
    BNE     bra_9854             ; BNE  ; orig: C - - - - - 0x009854 02:9844: D0 0E     BNE bra_9854
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009856 02:9846: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x009858 02:9848: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_041A  ; orig: C - - - - - 0x00985A 02:984A: 8D 1A 04  STA ram_041A
    MOVE.B  D0,ram_042B_enemy  ; orig: C - - - - - 0x00985D 02:984D: 8D 2C 04  STA ram_042B_enemy
    ; (empty translation for STA)  ; orig: C - - - - - 0x009860 02:9850: 8D 2D 04  STA ram_042B_enemy +
    RTS                     ; RTS  ; orig: C - - - - - 0x009863 02:9853: 60        RTS
bra_9854:  ; orig: bra_9854:
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x009864 02:9854: 20 F7 E5  JSR sub_0x01E607_hid

; bzk optimize, JMP
    BSR     sub_979D             ; JSR -> BSR  ; orig: C - - - - - 0x009867 02:9857: 20 9D 97  JSR sub_979D
    RTS                     ; RTS  ; orig: C - - - - - 0x00986A 02:985A: 60        RTS



tbl_985B:  ; orig: tbl_985B:
    ; [DIRECTIVE] .BYTE $3F  -- needs manual handling  ; orig: - D 0 - - - 0x00986B 02:985B: 3F        .byte $3F   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x00986C 02:985C: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x00986D 02:985D: 04        .byte $04   ; 02
    ; [DIRECTIVE] .BYTE $36  -- needs manual handling  ; orig: - D 0 - - - 0x00986E 02:985E: 36        .byte $36   ; 03
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x00986F 02:985F: 17        .byte $17   ; 04
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 0 - - - 0x009870 02:9860: 27        .byte $27   ; 05
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009871 02:9861: 0F        .byte $0F   ; 06
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009872 02:9862: FF        .byte $FF   ; 07



tbl_9863:  ; orig: tbl_9863:
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 0 - - - 0x009873 02:9863: 27        .byte $27   ; 00
    ; [DIRECTIVE] .BYTE $37  -- needs manual handling  ; orig: - D 0 - - - 0x009874 02:9864: 37        .byte $37   ; 01
    ; [DIRECTIVE] .BYTE $37  -- needs manual handling  ; orig: - D 0 - - - 0x009875 02:9865: 37        .byte $37   ; 02
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 0 - - - 0x009876 02:9866: 27        .byte $27   ; 03
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x009877 02:9867: 17        .byte $17   ; 04
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - - - 0x009878 02:9868: 07        .byte $07   ; 05
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - - - 0x009879 02:9869: 07        .byte $07   ; 06
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x00987A 02:986A: 17        .byte $17   ; 07



sub_986B:  ; orig: sub_986B:
    MOVE.B  #$70,D2  ; orig: C - - - - - 0x00987B 02:986B: A0 70     LDY #$70
bra_986D_loop:  ; orig: bra_986D_loop:
    LEA     tbl_90EE_spr_data-1,A1
    MOVE.B  (A1,D2.W),D0  ; orig: C - - - - - 0x00987D 02:986D: B9 ED 90  LDA tbl_90EE_spr_dat
    LEA     ram_spr_Y-1,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x009880 02:9870: 99 FF 01  STA ram_spr_Y - $01,
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x009883 02:9873: 88        DEY
    BNE     bra_986D_loop             ; BNE  ; orig: C - - - - - 0x009884 02:9874: D0 F7     BNE bra_986D_loop
    BSR     sub_98C3             ; JSR -> BSR  ; orig: C - - - - - 0x009886 02:9876: 20 C3 98  JSR sub_98C3
    MOVE.B  ram_0412,D0  ; orig: C - - - - - 0x009889 02:9879: AD 12 04  LDA ram_0412
    BNE     bra_98AB             ; BNE  ; orig: C - - - - - 0x00988C 02:987C: D0 2D     BNE bra_98AB
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00988E 02:987E: A0 07     LDY #$07
bra_9880_loop:  ; orig: bra_9880_loop:
    MOVE.B  tbl_985B(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009890 02:9880: B9 5B 98  LDA tbl_985B,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009893 02:9883: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x009896 02:9886: 88        DEY
    BPL     bra_9880_loop             ; BPL  ; orig: C - - - - - 0x009897 02:9887: 10 F7     BPL bra_9880_loop
    MOVE.B  ram_0413,D2  ; orig: C - - - - - 0x009899 02:9889: AC 13 04  LDY ram_0413
    MOVE.B  tbl_9863(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00989C 02:988C: B9 63 98  LDA tbl_9863,Y
    MOVE.B  D0,ram_0302_ppu_buffer+$05  ; orig: C - - - - - 0x00989F 02:988F: 8D 07 03  STA ram_0302_ppu_buf
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x0098A2 02:9892: A9 06     LDA #$06
    MOVE.B  D0,ram_0412  ; orig: C - - - - - 0x0098A4 02:9894: 8D 12 04  STA ram_0412
    ADDQ.B  #1,ram_0413  ; orig: C - - - - - 0x0098A7 02:9897: EE 13 04  INC ram_0413
    MOVE.B  ram_0413,D0  ; orig: C - - - - - 0x0098AA 02:989A: AD 13 04  LDA ram_0413
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x0098AD 02:989D: C9 08     CMP #$08
    BNE     bra_98AB             ; BNE  ; orig: C - - - - - 0x0098AF 02:989F: D0 0A     BNE bra_98AB
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0098B1 02:98A1: A9 10     LDA #$10
    MOVE.B  D0,ram_0412  ; orig: C - - - - - 0x0098B3 02:98A3: 8D 12 04  STA ram_0412
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0098B6 02:98A6: A9 00     LDA #$00
    MOVE.B  D0,ram_0413  ; orig: C - - - - - 0x0098B8 02:98A8: 8D 13 04  STA ram_0413
bra_98AB:  ; orig: bra_98AB:
    SUBQ.B  #1,ram_0412  ; orig: C - - - - - 0x0098BB 02:98AB: CE 12 04  DEC ram_0412
    RTS                     ; RTS  ; orig: C - - - - - 0x0098BE 02:98AE: 60        RTS



tbl_98AF_spr_T:  ; orig: tbl_98AF_spr_T:
    ; [DIRECTIVE] .BYTE $B2  -- needs manual handling  ; orig: - D 0 - - - 0x0098BF 02:98AF: B2        .byte $B2   ; 00
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 0 - - - 0x0098C0 02:98B0: B4        .byte $B4   ; 01
    ; [DIRECTIVE] .BYTE $B6  -- needs manual handling  ; orig: - D 0 - - - 0x0098C1 02:98B1: B6        .byte $B6   ; 02
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 0 - - - 0x0098C2 02:98B2: B8        .byte $B8   ; 03



tbl_98B3_spr_T:  ; orig: tbl_98B3_spr_T:
    ; [DIRECTIVE] .BYTE $A2  -- needs manual handling  ; orig: - D 0 - - - 0x0098C3 02:98B3: A2        .byte $A2   ; 00
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 0 - - - 0x0098C4 02:98B4: A4        .byte $A4   ; 01
    ; [DIRECTIVE] .BYTE $A6  -- needs manual handling  ; orig: - D 0 - - - 0x0098C5 02:98B5: A6        .byte $A6   ; 02
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 0 - - - 0x0098C6 02:98B6: A8        .byte $A8   ; 03



tbl_98B7_spr_X:  ; orig: tbl_98B7_spr_X:
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x0098C7 02:98B7: 50        .byte $50   ; 00
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 0 - - - 0x0098C8 02:98B8: 58        .byte $58   ; 01
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x0098C9 02:98B9: 60        .byte $60   ; 02
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 0 - - - 0x0098CA 02:98BA: 68        .byte $68   ; 03



tbl_98BB_offset:  ; orig: tbl_98BB_offset:

; added to spr address
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 0 - - - 0x0098CB 02:98BB: 70        .byte $70   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x0098CC 02:98BC: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 0 - - - 0x0098CD 02:98BD: 90        .byte $90   ; 02
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - - - - - - 0x0098CE 02:98BE: A0        .byte $A0   ; 03
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - - - - - - 0x0098CF 02:98BF: B0        .byte $B0   ; 04
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - - - - - - 0x0098D0 02:98C0: C0        .byte $C0   ; 05
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - - - - - - 0x0098D1 02:98C1: D0        .byte $D0   ; 06
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - - - - - - 0x0098D2 02:98C2: E0        .byte $E0   ; 07



sub_98C3:  ; orig: sub_98C3:
    MOVE.B  ram_041F,D0  ; orig: C - - - - - 0x0098D3 02:98C3: AD 1F 04  LDA ram_041F
    BNE     bra_98E9             ; BNE  ; orig: C - - - - - 0x0098D6 02:98C6: D0 21     BNE bra_98E9
    MOVE.B  #$B6,D0  ; orig: C - - - - - 0x0098D8 02:98C8: A9 B6     LDA #$B6
    MOVE.B  D0,ram_0420  ; orig: C - - - - - 0x0098DA 02:98CA: 8D 20 04  STA ram_0420
    MOVE.B  #$C8,D0  ; orig: C - - - - - 0x0098DD 02:98CD: A9 C8     LDA #$C8
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x0098DF 02:98CF: 8D 21 04  STA ram_0421
    MOVE.B  #$D8,D0  ; orig: C - - - - - 0x0098E2 02:98D2: A9 D8     LDA #$D8
    MOVE.B  D0,ram_0422  ; orig: C - - - - - 0x0098E4 02:98D4: 8D 22 04  STA ram_0422
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x0098E7 02:98D7: A9 C0     LDA #$C0
    MOVE.B  D0,ram_0423  ; orig: C - - - - - 0x0098E9 02:98D9: 8D 23 04  STA ram_0423
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x0098EC 02:98DC: A9 D0     LDA #$D0
    MOVE.B  D0,ram_0424  ; orig: C - - - - - 0x0098EE 02:98DE: 8D 24 04  STA ram_0424
    MOVE.B  #$DD,D0  ; orig: C - - - - - 0x0098F1 02:98E1: A9 DD     LDA #$DD
    MOVE.B  D0,ram_0425  ; orig: C - - - - - 0x0098F3 02:98E3: 8D 25 04  STA ram_0425
    ADDQ.B  #1,ram_041F  ; orig: C - - - - - 0x0098F6 02:98E6: EE 1F 04  INC ram_041F
bra_98E9:  ; orig: bra_98E9:
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x0098F9 02:98E9: A2 02     LDX #$02
bra_98EB_loop:  ; orig: bra_98EB_loop:
    BSR     sub_98F5             ; JSR -> BSR  ; orig: C - - - - - 0x0098FB 02:98EB: 20 F5 98  JSR sub_98F5
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0098FE 02:98EE: CA        DEX
    BPL     bra_98EB_loop             ; BPL  ; orig: C - - - - - 0x0098FF 02:98EF: 10 FA     BPL bra_98EB_loop

; bzk optimize, JMP
    BSR     sub_9943             ; JSR -> BSR  ; orig: C - - - - - 0x009901 02:98F1: 20 43 99  JSR sub_9943
    RTS                     ; RTS  ; orig: C - - - - - 0x009904 02:98F4: 60        RTS



sub_98F5:  ; orig: sub_98F5:
    LEA     ram_0420,A1
    ADDQ.B  #1,(A1,D1.W)  ; orig: C - - - - - 0x009905 02:98F5: FE 20 04  INC ram_0420,X
    ADDQ.B  #1,(A1,D1.W)  ; orig: C - - - - - 0x009908 02:98F8: FE 20 04  INC ram_0420,X
    MOVE.B  ram_0420(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00990B 02:98FB: BD 20 04  LDA ram_0420,X
    CMPI.B  #$E3,D0  ; orig: C - - - - - 0x00990E 02:98FE: C9 E3     CMP #$E3
    BCC     bra_9907             ; BCC  ; orig: C - - - - - 0x009910 02:9900: 90 05     BCC bra_9907
    MOVE.B  #$B2,D0  ; orig: C - - - - - 0x009912 02:9902: A9 B2     LDA #$B2
    MOVE.B  D0,ram_0420(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009914 02:9904: 9D 20 04  STA ram_0420,X
bra_9907:  ; orig: bra_9907:
    MOVE.B  D0,ram_0005_t03_spr_Y  ; orig: C - - - - - 0x009917 02:9907: 85 05     STA ram_0005_t03_spr
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009919 02:9909: A8        TAY
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x00991A 02:990A: A9 10     LDA #$10
    CMPI.B  #$C2,D2  ; orig: C - - - - - 0x00991C 02:990C: C0 C2     CPY #$C2
    BCS     bra_9917             ; BCS  ; orig: C - - - - - 0x00991E 02:990E: B0 07     BCS bra_9917
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x009920 02:9910: 4A        LSR
    CMPI.B  #$B9,D2  ; orig: C - - - - - 0x009921 02:9911: C0 B9     CPY #$B9
    BCS     bra_9917             ; BCS  ; orig: C - - - - - 0x009923 02:9913: B0 02     BCS bra_9917
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009925 02:9915: A9 00     LDA #$00
bra_9917:  ; orig: bra_9917:
    MOVE.B  D0,ram_0000_t59_spr_T  ; orig: C - - - - - 0x009927 02:9917: 85 00     STA ram_0000_t59_spr
    MOVE.B  D1,ram_0002_t14_save_X  ; orig: C - - - - - 0x009929 02:9919: 86 02     STX ram_0002_t14_sav
    MOVE.B  tbl_98BB_offset(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x00992B 02:991B: BC BB 98  LDY tbl_98BB_offset,
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x00992E 02:991E: A2 03     LDX #$03
bra_9920_loop:  ; orig: bra_9920_loop:
    MOVE.B  tbl_98AF_spr_T(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009930 02:9920: BD AF 98  LDA tbl_98AF_spr_T,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009933 02:9923: 18        CLC
    ADDX.B  ram_0000_t59_spr_T,D0  ; orig: C - - - - - 0x009934 02:9924: 65 00     ADC ram_0000_t59_spr
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009936 02:9926: 99 01 02  STA ram_spr_T,Y
    MOVE.B  tbl_98B7_spr_X(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009939 02:9929: BD B7 98  LDA tbl_98B7_spr_X,X
    MOVE.B  D0,ram_spr_X(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00993C 02:992C: 99 03 02  STA ram_spr_X,Y
    MOVE.B  ram_0005_t03_spr_Y,D0  ; orig: C - - - - - 0x00993F 02:992F: A5 05     LDA ram_0005_t03_spr
    MOVE.B  D0,ram_spr_Y(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009941 02:9931: 99 00 02  STA ram_spr_Y,Y
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009944 02:9934: A9 00     LDA #$00
    MOVE.B  D0,ram_spr_A(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009946 02:9936: 99 02 02  STA ram_spr_A,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009949 02:9939: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00994A 02:993A: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00994B 02:993B: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00994C 02:993C: C8        INY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00994D 02:993D: CA        DEX
    BPL     bra_9920_loop             ; BPL  ; orig: C - - - - - 0x00994E 02:993E: 10 E0     BPL bra_9920_loop
    MOVE.B  ram_0002_t14_save_X,D1  ; orig: C - - - - - 0x009950 02:9940: A6 02     LDX ram_0002_t14_sav
    RTS                     ; RTS  ; orig: C - - - - - 0x009952 02:9942: 60        RTS



sub_9943:  ; orig: sub_9943:
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x009953 02:9943: A2 03     LDX #$03
    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x009955 02:9945: A0 F0     LDY #$F0
bra_9947_loop:  ; orig: bra_9947_loop:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x009957 02:9947: A5 15     LDA ram_frm_cnt
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x009959 02:9949: 29 08     AND #$08
    LEA     tbl_98B3_spr_T,A1
    ADD.B   (A1,D1.W),D0  ; orig: C - - - - - 0x00995B 02:994B: 7D B3 98  ADC tbl_98B3_spr_T,X
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00995E 02:994E: 99 01 02  STA ram_spr_T,Y
    MOVE.B  #$A8,D0  ; orig: C - - - - - 0x009961 02:9951: A9 A8     LDA #$A8
    MOVE.B  D0,ram_spr_Y(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009963 02:9953: 99 00 02  STA ram_spr_Y,Y
    MOVE.B  tbl_98B7_spr_X(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009966 02:9956: BD B7 98  LDA tbl_98B7_spr_X,X
    MOVE.B  D0,ram_spr_X(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009969 02:9959: 99 03 02  STA ram_spr_X,Y
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00996C 02:995C: A9 00     LDA #$00
    MOVE.B  D0,ram_spr_A(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00996E 02:995E: 99 02 02  STA ram_spr_A,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009971 02:9961: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009972 02:9962: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009973 02:9963: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009974 02:9964: C8        INY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009975 02:9965: CA        DEX
    BPL     bra_9947_loop             ; BPL  ; orig: C - - - - - 0x009976 02:9966: 10 DF     BPL bra_9947_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x009978 02:9968: 60        RTS



tbl_9969_logo_blackout_palette:  ; orig: tbl_9969_logo_blackout_palette:

; 00
    ; [DIRECTIVE] .BYTE $36, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009979 02:9969: 36        .byte $36, $0F, $00,
    ; [DIRECTIVE] .BYTE $36, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x00997D 02:996D: 36        .byte $36, $17, $27,
    ; [DIRECTIVE] .BYTE $36, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009981 02:9971: 36        .byte $36, $08, $1A,
    ; [DIRECTIVE] .BYTE $36, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009985 02:9975: 36        .byte $36, $30, $3B,

    ; [DIRECTIVE] .BYTE $36, $30, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x009989 02:9979: 36        .byte $36, $30, $3B,
    ; [DIRECTIVE] .BYTE $36, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x00998D 02:997D: 36        .byte $36, $17, $27,
    ; [DIRECTIVE] .BYTE $36, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009991 02:9981: 36        .byte $36, $08, $1A,
    ; [DIRECTIVE] .BYTE $36, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009995 02:9985: 36        .byte $36, $30, $3B,




; 01
    ; [DIRECTIVE] .BYTE $39, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009999 02:9989: 39        .byte $39, $0F, $00,
    ; [DIRECTIVE] .BYTE $39, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x00999D 02:998D: 39        .byte $39, $17, $27,
    ; [DIRECTIVE] .BYTE $39, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099A1 02:9991: 39        .byte $39, $08, $1A,
    ; [DIRECTIVE] .BYTE $39, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099A5 02:9995: 39        .byte $39, $30, $3B,

    ; [DIRECTIVE] .BYTE $39, $30, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0099A9 02:9999: 39        .byte $39, $30, $3B,
    ; [DIRECTIVE] .BYTE $39, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099AD 02:999D: 39        .byte $39, $17, $27,
    ; [DIRECTIVE] .BYTE $39, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099B1 02:99A1: 39        .byte $39, $08, $1A,
    ; [DIRECTIVE] .BYTE $39, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099B5 02:99A5: 39        .byte $39, $30, $3B,




; 02
    ; [DIRECTIVE] .BYTE $31, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x0099B9 02:99A9: 31        .byte $31, $0F, $00,
    ; [DIRECTIVE] .BYTE $31, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099BD 02:99AD: 31        .byte $31, $17, $27,
    ; [DIRECTIVE] .BYTE $31, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099C1 02:99B1: 31        .byte $31, $08, $1A,
    ; [DIRECTIVE] .BYTE $31, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099C5 02:99B5: 31        .byte $31, $30, $3B,

    ; [DIRECTIVE] .BYTE $31, $30, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0099C9 02:99B9: 31        .byte $31, $30, $3B,
    ; [DIRECTIVE] .BYTE $31, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099CD 02:99BD: 31        .byte $31, $17, $27,
    ; [DIRECTIVE] .BYTE $31, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099D1 02:99C1: 31        .byte $31, $08, $1A,
    ; [DIRECTIVE] .BYTE $31, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099D5 02:99C5: 31        .byte $31, $30, $3B,




; 03
    ; [DIRECTIVE] .BYTE $3C, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x0099D9 02:99C9: 3C        .byte $3C, $0F, $00,
    ; [DIRECTIVE] .BYTE $3C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099DD 02:99CD: 3C        .byte $3C, $17, $27,
    ; [DIRECTIVE] .BYTE $3C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099E1 02:99D1: 3C        .byte $3C, $08, $1A,
    ; [DIRECTIVE] .BYTE $3C, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099E5 02:99D5: 3C        .byte $3C, $30, $3B,

    ; [DIRECTIVE] .BYTE $3C, $30, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0099E9 02:99D9: 3C        .byte $3C, $30, $3B,
    ; [DIRECTIVE] .BYTE $3C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099ED 02:99DD: 3C        .byte $3C, $17, $27,
    ; [DIRECTIVE] .BYTE $3C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0099F1 02:99E1: 3C        .byte $3C, $08, $1A,
    ; [DIRECTIVE] .BYTE $3C, $30, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x0099F5 02:99E5: 3C        .byte $3C, $30, $3B,




; 04
    ; [DIRECTIVE] .BYTE $3B, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x0099F9 02:99E9: 3B        .byte $3B, $0F, $00,
    ; [DIRECTIVE] .BYTE $3B, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x0099FD 02:99ED: 3B        .byte $3B, $17, $27,
    ; [DIRECTIVE] .BYTE $3B, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A01 02:99F1: 3B        .byte $3B, $08, $1A,
    ; [DIRECTIVE] .BYTE $3B, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A05 02:99F5: 3B        .byte $3B, $10, $3B,

    ; [DIRECTIVE] .BYTE $3B, $10, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x009A09 02:99F9: 3B        .byte $3B, $10, $3B,
    ; [DIRECTIVE] .BYTE $3B, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A0D 02:99FD: 3B        .byte $3B, $17, $27,
    ; [DIRECTIVE] .BYTE $3B, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A11 02:9A01: 3B        .byte $3B, $08, $1A,
    ; [DIRECTIVE] .BYTE $3B, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A15 02:9A05: 3B        .byte $3B, $10, $3B,




; 05
    ; [DIRECTIVE] .BYTE $2C, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009A19 02:9A09: 2C        .byte $2C, $0F, $00,
    ; [DIRECTIVE] .BYTE $2C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A1D 02:9A0D: 2C        .byte $2C, $17, $27,
    ; [DIRECTIVE] .BYTE $2C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A21 02:9A11: 2C        .byte $2C, $08, $1A,
    ; [DIRECTIVE] .BYTE $2C, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A25 02:9A15: 2C        .byte $2C, $10, $3B,

    ; [DIRECTIVE] .BYTE $2C, $10, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x009A29 02:9A19: 2C        .byte $2C, $10, $3B,
    ; [DIRECTIVE] .BYTE $2C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A2D 02:9A1D: 2C        .byte $2C, $17, $27,
    ; [DIRECTIVE] .BYTE $2C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A31 02:9A21: 2C        .byte $2C, $08, $1A,
    ; [DIRECTIVE] .BYTE $2C, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A35 02:9A25: 2C        .byte $2C, $10, $3B,




; 06
    ; [DIRECTIVE] .BYTE $1C, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009A39 02:9A29: 1C        .byte $1C, $0F, $00,
    ; [DIRECTIVE] .BYTE $1C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A3D 02:9A2D: 1C        .byte $1C, $17, $27,
    ; [DIRECTIVE] .BYTE $1C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A41 02:9A31: 1C        .byte $1C, $08, $1A,
    ; [DIRECTIVE] .BYTE $1C, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A45 02:9A35: 1C        .byte $1C, $10, $3B,

    ; [DIRECTIVE] .BYTE $1C, $10, $3B, $16  -- needs manual handling  ; orig: - D 0 - I - 0x009A49 02:9A39: 1C        .byte $1C, $10, $3B,
    ; [DIRECTIVE] .BYTE $1C, $17, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A4D 02:9A3D: 1C        .byte $1C, $17, $27,
    ; [DIRECTIVE] .BYTE $1C, $08, $1A, $28  -- needs manual handling  ; orig: - D 0 - I - 0x009A51 02:9A41: 1C        .byte $1C, $08, $1A,
    ; [DIRECTIVE] .BYTE $1C, $10, $3B, $22  -- needs manual handling  ; orig: - D 0 - I - 0x009A55 02:9A45: 1C        .byte $1C, $10, $3B,




; 07
    ; [DIRECTIVE] .BYTE $02, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009A59 02:9A49: 02        .byte $02, $0F, $00,
    ; [DIRECTIVE] .BYTE $02, $06, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A5D 02:9A4D: 02        .byte $02, $06, $27,
    ; [DIRECTIVE] .BYTE $02, $0A, $1A, $18  -- needs manual handling  ; orig: - D 0 - I - 0x009A61 02:9A51: 02        .byte $02, $0A, $1A,
    ; [DIRECTIVE] .BYTE $02, $10, $2B, $12  -- needs manual handling  ; orig: - D 0 - I - 0x009A65 02:9A55: 02        .byte $02, $10, $2B,

    ; [DIRECTIVE] .BYTE $02, $10, $2B, $06  -- needs manual handling  ; orig: - D 0 - I - 0x009A69 02:9A59: 02        .byte $02, $10, $2B,
    ; [DIRECTIVE] .BYTE $02, $06, $27, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A6D 02:9A5D: 02        .byte $02, $06, $27,
    ; [DIRECTIVE] .BYTE $02, $0A, $1A, $18  -- needs manual handling  ; orig: - D 0 - I - 0x009A71 02:9A61: 02        .byte $02, $0A, $1A,
    ; [DIRECTIVE] .BYTE $02, $10, $2B, $12  -- needs manual handling  ; orig: - D 0 - I - 0x009A75 02:9A65: 02        .byte $02, $10, $2B,




; 08
    ; [DIRECTIVE] .BYTE $0C, $0F, $00, $10  -- needs manual handling  ; orig: - D 0 - I - 0x009A79 02:9A69: 0C        .byte $0C, $0F, $00,
    ; [DIRECTIVE] .BYTE $0C, $03, $16, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A7D 02:9A6D: 0C        .byte $0C, $03, $16,
    ; [DIRECTIVE] .BYTE $0C, $01, $0A, $08  -- needs manual handling  ; orig: - D 0 - I - 0x009A81 02:9A71: 0C        .byte $0C, $01, $0A,
    ; [DIRECTIVE] .BYTE $0C, $00, $1B, $02  -- needs manual handling  ; orig: - D 0 - I - 0x009A85 02:9A75: 0C        .byte $0C, $00, $1B,

    ; [DIRECTIVE] .BYTE $0C, $00, $1B, $02  -- needs manual handling  ; orig: - D 0 - I - 0x009A89 02:9A79: 0C        .byte $0C, $00, $1B,
    ; [DIRECTIVE] .BYTE $0C, $03, $16, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A8D 02:9A7D: 0C        .byte $0C, $03, $16,
    ; [DIRECTIVE] .BYTE $0C, $01, $0A, $08  -- needs manual handling  ; orig: - D 0 - I - 0x009A91 02:9A81: 0C        .byte $0C, $01, $0A,
    ; [DIRECTIVE] .BYTE $0C, $00, $1B, $02  -- needs manual handling  ; orig: - D 0 - I - 0x009A95 02:9A85: 0C        .byte $0C, $00, $1B,




; 09
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $00  -- needs manual handling  ; orig: - D 0 - I - 0x009A99 02:9A89: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $01, $11, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009A9D 02:9A8D: 0F        .byte $0F, $01, $11,
    ; [DIRECTIVE] .BYTE $0F, $0C, $01, $02  -- needs manual handling  ; orig: - D 0 - I - 0x009AA1 02:9A91: 0F        .byte $0F, $0C, $01,
    ; [DIRECTIVE] .BYTE $0F, $00, $01, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009AA5 02:9A95: 0F        .byte $0F, $00, $01,

    ; [DIRECTIVE] .BYTE $0F, $00, $01, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009AA9 02:9A99: 0F        .byte $0F, $00, $01,
    ; [DIRECTIVE] .BYTE $0F, $01, $11, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AAD 02:9A9D: 0F        .byte $0F, $01, $11,
    ; [DIRECTIVE] .BYTE $0F, $0C, $01, $02  -- needs manual handling  ; orig: - D 0 - I - 0x009AB1 02:9AA1: 0F        .byte $0F, $0C, $01,
    ; [DIRECTIVE] .BYTE $0F, $00, $01, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009AB5 02:9AA5: 0F        .byte $0F, $00, $01,




; 0A
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $00  -- needs manual handling  ; orig: - D 0 - I - 0x009AB9 02:9AA9: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $01, $11, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009ABD 02:9AAD: 0F        .byte $0F, $01, $11,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0C, $01  -- needs manual handling  ; orig: - D 0 - I - 0x009AC1 02:9AB1: 0F        .byte $0F, $0F, $0C,
    ; [DIRECTIVE] .BYTE $0F, $01, $0C, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AC5 02:9AB5: 0F        .byte $0F, $01, $0C,

    ; [DIRECTIVE] .BYTE $0F, $01, $0C, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AC9 02:9AB9: 0F        .byte $0F, $01, $0C,
    ; [DIRECTIVE] .BYTE $0F, $01, $11, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009ACD 02:9ABD: 0F        .byte $0F, $01, $11,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0C, $01  -- needs manual handling  ; orig: - D 0 - I - 0x009AD1 02:9AC1: 0F        .byte $0F, $0F, $0C,
    ; [DIRECTIVE] .BYTE $0F, $01, $0C, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AD5 02:9AC5: 0F        .byte $0F, $01, $0C,




; 0B
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AD9 02:9AC9: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $01, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009ADD 02:9ACD: 0F        .byte $0F, $0F, $01,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009AE1 02:9AD1: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0C, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AE5 02:9AD5: 0F        .byte $0F, $0C, $0F,

    ; [DIRECTIVE] .BYTE $0F, $0C, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AE9 02:9AD9: 0F        .byte $0F, $0C, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $01, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AED 02:9ADD: 0F        .byte $0F, $0F, $01,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0C  -- needs manual handling  ; orig: - D 0 - I - 0x009AF1 02:9AE1: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0C, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AF5 02:9AE5: 0F        .byte $0F, $0C, $0F,




; 0C
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AF9 02:9AE9: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009AFD 02:9AED: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B01 02:9AF1: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B05 02:9AF5: 0F        .byte $0F, $0F, $0F,

    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B09 02:9AF9: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B0D 02:9AFD: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B11 02:9B01: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B15 02:9B05: 0F        .byte $0F, $0F, $0F,




; 0D
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B19 02:9B09: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B1D 02:9B0D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B21 02:9B11: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B25 02:9B15: 0F        .byte $0F, $0F, $0F,

    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B29 02:9B19: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B2D 02:9B1D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B31 02:9B21: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - D 0 - I - 0x009B35 02:9B25: 0F        .byte $0F, $0F, $0F,




; 0E

; bzk garbage?
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B39 02:9B29: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B3D 02:9B2D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B41 02:9B31: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B45 02:9B35: 0F        .byte $0F, $0F, $0F,

    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B49 02:9B39: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B4D 02:9B3D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B51 02:9B41: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B55 02:9B45: 0F        .byte $0F, $0F, $0F,




; 0F

; bzk garbage?
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B59 02:9B49: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B5D 02:9B4D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B61 02:9B51: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B65 02:9B55: 0F        .byte $0F, $0F, $0F,

    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B69 02:9B59: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B6D 02:9B5D: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B71 02:9B61: 0F        .byte $0F, $0F, $0F,
    ; [DIRECTIVE] .BYTE $0F, $0F, $0F, $0F  -- needs manual handling  ; orig: - - - - - - 0x009B75 02:9B65: 0F        .byte $0F, $0F, $0F,



tbl_9B69:  ; orig: tbl_9B69:
    DC.B    $08,$08,$06,$05,$04,$03,$02,$02
    DC.B    $02,$C0,$06,$04,$C0,$03,$04,$04



ofs_007_9B79_01:  ; orig: ofs_007_9B79_01:
    MOVE.B  ($00FF0438).l,D0  ; orig: C - - J - - 0x009B89 02:9B79: AD 38 04  LDA ram_0437_enemy +
    BNE     bra_9BD0             ; BNE  ; orig: C - - - - - 0x009B8C 02:9B7C: D0 52     BNE bra_9BD0
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009B8E 02:9B7E: A9 00     LDA #$00
    MOVE.B  D0,ram_0000_t18_palette_data+1  ; orig: C - - - - - 0x009B90 02:9B80: 85 01     STA ram_0000_t18_pal
    MOVE.B  ram_0437_link,D0  ; orig: C - - - - - 0x009B92 02:9B82: AD 37 04  LDA ram_0437_link

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009B95 02:9B85: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009B96 02:9B86: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009B97 02:9B87: 0A        ASL

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009B98 02:9B88: 0A        ASL
    MOVE.B  ram_0000_t18_palette_data+1,D1
    ROXL.B  #1,D1  ; orig: C - - - - - 0x009B99 02:9B89: 26 01     ROL ram_0000_t18_pal
    MOVE.B  D1,ram_0000_t18_palette_data+1
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009B9B 02:9B8B: 0A        ASL
    MOVE.B  ram_0000_t18_palette_data+1,D1
    ROXL.B  #1,D1  ; orig: C - - - - - 0x009B9C 02:9B8C: 26 01     ROL ram_0000_t18_pal
    MOVE.B  D1,ram_0000_t18_palette_data+1
    ADDX.B  #< tbl_9969_logo_blackout_palette,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009B9E 02:9B8E: 69 69     ADC #< tbl_9969_logo
    MOVE.B  D0,ram_0000_t18_palette_data  ; orig: C - - - - - 0x009BA0 02:9B90: 85 00     STA ram_0000_t18_pal
    MOVE.B  ram_0000_t18_palette_data+1,D0  ; orig: C - - - - - 0x009BA2 02:9B92: A5 01     LDA ram_0000_t18_pal
    ADDX.B  #> tbl_9969_logo_blackout_palette,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009BA4 02:9B94: 69 99     ADC #> tbl_9969_logo
    MOVE.B  D0,ram_0000_t18_palette_data+1  ; orig: C - - - - - 0x009BA6 02:9B96: 85 01     STA ram_0000_t18_pal
    MOVE.B  #> $3F00,D0  ; orig: C - - - - - 0x009BA8 02:9B98: A9 3F     LDA #> $3F00
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x009BAA 02:9B9A: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  #< $3F00,D0  ; orig: C - - - - - 0x009BAD 02:9B9D: A9 00     LDA #< $3F00
    MOVE.B  D0,ram_0302_ppu_buffer+1  ; orig: C - - - - - 0x009BAF 02:9B9F: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x009BB2 02:9BA2: A9 20     LDA #$20    ; counte
    MOVE.B  D0,ram_0302_ppu_buffer+2  ; orig: C - - - - - 0x009BB4 02:9BA4: 8D 04 03  STA ram_0302_ppu_buf
    MOVE.B  #$1F,D2  ; orig: C - - - - - 0x009BB7 02:9BA7: A0 1F     LDY #$1F
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009BB9 02:9BA9: A9 FF     LDA #$FF
    LEA     (ram_0302_ppu_buffer+4).l,A0
    MOVE.B  D0,(A0,D2.W)  ; orig: C - - - - - 0x009BBB 02:9BAB: 99 06 03  STA ram_0302_ppu_buf
bra_9BAE_loop:  ; orig: bra_9BAE_loop:
    MOVEA.W ($FF0000+ram_0000_t18_palette_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x009BBE 02:9BAE: B1 00     LDA (ram_0000_t18_pa
    LEA     (ram_0302_ppu_buffer+3).l,A0
    MOVE.B  D0,(A0,D2.W)  ; orig: C - - - - - 0x009BC0 02:9BB0: 99 05 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x009BC3 02:9BB3: 88        DEY
    BPL     bra_9BAE_loop             ; BPL  ; orig: C - - - - - 0x009BC4 02:9BB4: 10 F8     BPL bra_9BAE_loop
    ADDQ.B  #1,ram_0437_link  ; orig: C - - - - - 0x009BC6 02:9BB6: EE 37 04  INC ram_0437_link
    MOVE.B  ram_0437_link,D2  ; orig: C - - - - - 0x009BC9 02:9BB9: AC 37 04  LDY ram_0437_link
    MOVEA.L #tbl_9B69-1,A0
    MOVE.B  (A0,D2.L),D0  ; orig: C - - - - - 0x009BCC 02:9BBC: B9 68 9B  LDA tbl_9B69 - $01,Y
    MOVE.B  D0,($00FF0438).l  ; orig: C - - - - - 0x009BCF 02:9BBF: 8D 38 04  STA ram_0437_enemy +
    CMPI.B  #$0E,D2  ; orig: C - - - - - 0x009BD2 02:9BC2: C0 0E     CPY #$0E
    BCC     bra_9BD0             ; BCC  ; orig: C - - - - - 0x009BD4 02:9BC4: 90 0A     BCC bra_9BD0
    ADDQ.B  #1,ram_042B_enemy  ; orig: C - - - - - 0x009BD6 02:9BC6: EE 2C 04  INC ram_042B_enemy
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009BD9 02:9BC9: A9 00     LDA #$00
    MOVE.B  D0,($00FF042D).l  ; orig: C - - - - - 0x009BDB 02:9BCB: 8D 2D 04  STA ram_042B_enemy +
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x009BDE 02:9BCE: 85 11     STA ram_0011_screen_
bra_9BD0:  ; orig: bra_9BD0:
    SUBQ.B  #1,($00FF0438).l  ; orig: C - - - - - 0x009BE0 02:9BD0: CE 38 04  DEC ram_0437_enemy +

; bzk optimize, JMP
    BSR     sub_98C3             ; JSR -> BSR  ; orig: C - - - - - 0x009BE3 02:9BD3: 20 C3 98  JSR sub_98C3
    RTS                     ; RTS  ; orig: C - - - - - 0x009BE6 02:9BD6: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009BE7 02:9BD7: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009BF0 02:9BE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C00 02:9BF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C10 02:9C00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C20 02:9C10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C30 02:9C20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C40 02:9C30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C50 02:9C40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C60 02:9C50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C70 02:9C60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C80 02:9C70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009C90 02:9C80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CA0 02:9C90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CB0 02:9CA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CC0 02:9CB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CD0 02:9CC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CE0 02:9CD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009CF0 02:9CE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x009D00 02:9CF0: FF        .byte $FF, $FF, $FF,



tbl_9D00_save_slot_addresses:  ; orig: tbl_9D00_save_slot_addresses:

; 00
    ; [DIRECTIVE] .WORD ram_687E_map_data + $1A  -- needs manual handling  ; orig: - D 0 - - - 0x009D10 02:9D00: 98 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_68FE_map_data + $12  -- needs manual handling  ; orig: - D 0 - - - 0x009D12 02:9D02: 10 69     .word ram_68FE_map_d
    ; [DIRECTIVE] .WORD ram_687E_map_data + $02  -- needs manual handling  ; orig: - D 0 - - - 0x009D14 02:9D04: 80 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_6D90  -- needs manual handling  ; orig: - D 0 - - - 0x009D16 02:9D06: 90 6D     .word ram_6D90
    ; [DIRECTIVE] .WORD ram_6D93  -- needs manual handling  ; orig: - D 0 - - - 0x009D18 02:9D08: 93 6D     .word ram_6D93
    ; [DIRECTIVE] .WORD ram_6D96  -- needs manual handling  ; orig: - D 0 - - - 0x009D1A 02:9D0A: 96 6D     .word ram_6D96
    ; [DIRECTIVE] .WORD ram_6D99  -- needs manual handling  ; orig: - D 0 - - - 0x009D1C 02:9D0C: 99 6D     .word ram_6D99

; 01
    ; [DIRECTIVE] .WORD ram_687E_map_data + $42  -- needs manual handling  ; orig: - D 0 - - - 0x009D1E 02:9D0E: C0 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_6A7E_map_data + $12  -- needs manual handling  ; orig: - D 0 - - - 0x009D20 02:9D10: 90 6A     .word ram_6A7E_map_d
    ; [DIRECTIVE] .WORD ram_687E_map_data + $0A  -- needs manual handling  ; orig: - D 0 - - - 0x009D22 02:9D12: 88 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_6D90 + $01  -- needs manual handling  ; orig: - D 0 - - - 0x009D24 02:9D14: 91 6D     .word ram_6D90 + $01
    ; [DIRECTIVE] .WORD ram_6D93 + $01  -- needs manual handling  ; orig: - D 0 - - - 0x009D26 02:9D16: 94 6D     .word ram_6D93 + $01
    ; [DIRECTIVE] .WORD ram_6D96 + $01  -- needs manual handling  ; orig: - D 0 - - - 0x009D28 02:9D18: 97 6D     .word ram_6D96 + $01
    ; [DIRECTIVE] .WORD ram_6D99 + $01  -- needs manual handling  ; orig: - D 0 - - - 0x009D2A 02:9D1A: 9A 6D     .word ram_6D99 + $01

; 02
    ; [DIRECTIVE] .WORD ram_687E_map_data + $6A  -- needs manual handling  ; orig: - D 0 - - - 0x009D2C 02:9D1C: E8 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_6C10  -- needs manual handling  ; orig: - D 0 - - - 0x009D2E 02:9D1E: 10 6C     .word ram_6C10
    ; [DIRECTIVE] .WORD ram_687E_map_data + $12  -- needs manual handling  ; orig: - D 0 - - - 0x009D30 02:9D20: 90 68     .word ram_687E_map_d
    ; [DIRECTIVE] .WORD ram_6D90 + $02  -- needs manual handling  ; orig: - D 0 - - - 0x009D32 02:9D22: 92 6D     .word ram_6D90 + $02
    ; [DIRECTIVE] .WORD ram_6D93 + $02  -- needs manual handling  ; orig: - D 0 - - - 0x009D34 02:9D24: 95 6D     .word ram_6D93 + $02
    ; [DIRECTIVE] .WORD ram_6D96 + $02  -- needs manual handling  ; orig: - D 0 - - - 0x009D36 02:9D26: 98 6D     .word ram_6D96 + $02
    ; [DIRECTIVE] .WORD ram_6D99 + $02  -- needs manual handling  ; orig: - D 0 - - - 0x009D38 02:9D28: 9B 6D     .word ram_6D99 + $02



sub_9D2A_prepare_save_slot_addresses:  ; orig: sub_9D2A_prepare_save_slot_addresses:

; out

; ram_00C0_t01_data

; ram_00C2_t01_data

; ram_00C4_t01_data

; ram_00C6_t01_data

; ram_00C8_t01_data

; ram_00CA_t01_data

; ram_00CC_t01_data
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009D3A 02:9D2A: A9 FF     LDA #$FF
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x009D3C 02:9D2C: A4 16     LDY ram_current_save
bra_9D2E_loop:  ; orig: bra_9D2E_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x009D3E 02:9D2E: 18        CLC
    ADDX.B  #$0E,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x009D3F 02:9D2F: 69 0E     ADC #$0E
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x009D41 02:9D31: 88        DEY
    BPL     bra_9D2E_loop             ; BPL  ; orig: C - - - - - 0x009D42 02:9D32: 10 FA     BPL bra_9D2E_loop
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009D44 02:9D34: A8        TAY
    MOVE.B  #$0D,D1  ; orig: C - - - - - 0x009D45 02:9D35: A2 0D     LDX #$0D
bra_9D37_loop:  ; orig: bra_9D37_loop:
    MOVE.B  tbl_9D00_save_slot_addresses(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009D47 02:9D37: B9 00 9D  LDA tbl_9D00_save_sl

; ram_00C0_t01_data

; ram_00C2_t01_data

; ram_00C4_t01_data

; ram_00C6_t01_data

; ram_00C8_t01_data

; ram_00CA_t01_data

; ram_00CC_t01_data
    MOVE.B  D0,ram_00C0_indirect_data(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009D4A 02:9D3A: 95 C0     STA ram_00C0_indirec
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x009D4C 02:9D3C: 88        DEY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009D4D 02:9D3D: CA        DEX
    BPL     bra_9D37_loop             ; BPL  ; orig: C - - - - - 0x009D4E 02:9D3E: 10 F7     BPL bra_9D37_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x009D50 02:9D40: 60        RTS



tbl_9D41:  ; orig: tbl_9D41:
    ; !! UNKNOWN: .DBYT $2064  ; orig: - D 0 - - - 0x009D51 02:9D41: 20 64     .dbyt $2064 ;
    ; [DIRECTIVE] .BYTE $00 + $00 + $19  -- needs manual handling  ; orig: - D 0 - - - 0x009D53 02:9D43: 19        .byte $00 + $00 + $1

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $6A, $6A, $6A, $6A, $0E, $15, $12, $16, $12, $17, $0A, $1D  -- needs manual handling  ; orig: - D 0 - - - 0x009D54 02:9D44: 6A        .byte               
    ; [DIRECTIVE] .BYTE $12, $18, $17, $24, $24, $16, $18, $0D, $0E, $6A, $6A, $6A, $6A  -- needs manual handling  ; orig: - D 0 - - - 0x009D60 02:9D50: 12        .byte $12, $18, $17,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009D6D 02:9D5D: FF        .byte $FF   ; end to



tbl_9D5E:  ; orig: tbl_9D5E:
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009D6E 02:9D5E: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009D6F 02:9D5F: 0E        .byte $0E   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x009D70 02:9D60: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - - - 0x009D71 02:9D61: 12        .byte $12   ;
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 0 - - - 0x009D72 02:9D62: 1C        .byte $1C   ;
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 0 - - - 0x009D73 02:9D63: 1D        .byte $1D   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009D74 02:9D64: 0E        .byte $0E   ;
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009D75 02:9D65: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D76 02:9D66: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 0 - - - 0x009D77 02:9D67: 22        .byte $22   ;
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x009D78 02:9D68: 18        .byte $18   ;
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 0 - - - 0x009D79 02:9D69: 1E        .byte $1E   ;
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009D7A 02:9D6A: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D7B 02:9D6B: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x009D7C 02:9D6C: 17        .byte $17   ;
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x009D7D 02:9D6D: 0A        .byte $0A   ;
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x009D7E 02:9D6E: 16        .byte $16   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009D7F 02:9D6F: 0E        .byte $0E   ;



tbl_9D70:  ; orig: tbl_9D70:
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009D80 02:9D70: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009D81 02:9D71: 0E        .byte $0E   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x009D82 02:9D72: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - - - 0x009D83 02:9D73: 12        .byte $12   ;
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 0 - - - 0x009D84 02:9D74: 1C        .byte $1C   ;
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 0 - - - 0x009D85 02:9D75: 1D        .byte $1D   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009D86 02:9D76: 0E        .byte $0E   ;
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009D87 02:9D77: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D88 02:9D78: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D89 02:9D79: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D8A 02:9D7A: 24        .byte $24   ;



tbl_9D7B:  ; orig: tbl_9D7B:
    ; !! UNKNOWN: .DBYT $20CE  ; orig: - D 0 - - - 0x009D8B 02:9D7B: 20 CE     .dbyt $20CE ;
    ; [DIRECTIVE] .BYTE $00 + $08  -- needs manual handling  ; orig: - D 0 - - - 0x009D8D 02:9D7D: 08        .byte $00 + $08   ; 

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D8E 02:9D7E: 24        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D90 02:9D80: 24        .byte $24, $24, $24,

    ; !! UNKNOWN: .DBYT $212E  ; orig: - D 0 - - - 0x009D96 02:9D86: 21 2E     .dbyt $212E ;
    ; [DIRECTIVE] .BYTE $00 + $08  -- needs manual handling  ; orig: - D 0 - - - 0x009D98 02:9D88: 08        .byte $00 + $08   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D99 02:9D89: 24        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009D9B 02:9D8B: 24        .byte $24, $24, $24,

    ; !! UNKNOWN: .DBYT $218E  ; orig: - D 0 - - - 0x009DA1 02:9D91: 21 8E     .dbyt $218E ;
    ; [DIRECTIVE] .BYTE $00 + $08  -- needs manual handling  ; orig: - D 0 - - - 0x009DA3 02:9D93: 08        .byte $00 + $08   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009DA4 02:9D94: 24        .byte               
    ; [DIRECTIVE] .BYTE $24, $24, $24, $24, $24, $24  -- needs manual handling  ; orig: - D 0 - - - 0x009DA6 02:9D96: 24        .byte $24, $24, $24,

    ; !! UNKNOWN: .DBYT $21EA  ; orig: - D 0 - - - 0x009DAC 02:9D9C: 21 EA     .dbyt $21EA ;
    ; [DIRECTIVE] .BYTE $00 + $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009DAE 02:9D9E: 0F        .byte $00 + $0F   ;

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $0E, $15, $12, $16, $12, $17  -- needs manual handling  ; orig: - D 0 - - - 0x009DAF 02:9D9F: 0E        .byte               
    ; [DIRECTIVE] .BYTE $0A, $1D, $12, $18, $17, $24, $0E, $17, $0D  -- needs manual handling  ; orig: - D 0 - - - 0x009DB5 02:9DA5: 0A        .byte $0A, $1D, $12,

    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009DBE 02:9DAE: FF        .byte $FF   ; end to



tbl_9DAF_pos_Y:  ; orig: tbl_9DAF_pos_Y:
    ; [DIRECTIVE] .BYTE $2F  -- needs manual handling  ; orig: - D 0 - - - 0x009DBF 02:9DAF: 2F        .byte $2F   ; 00
    ; [DIRECTIVE] .BYTE $47  -- needs manual handling  ; orig: - D 0 - - - 0x009DC0 02:9DB0: 47        .byte $47   ; 01
    ; [DIRECTIVE] .BYTE $5F  -- needs manual handling  ; orig: - D 0 - - - 0x009DC1 02:9DB1: 5F        .byte $5F   ; 02
    ; [DIRECTIVE] .BYTE $77  -- needs manual handling  ; orig: - D 0 - - - 0x009DC2 02:9DB2: 77        .byte $77   ; 03



tbl_9DB3:  ; orig: tbl_9DB3:
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x009DC3 02:9DB3: 0A        .byte $0A   ;
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x009DC4 02:9DB4: 0B        .byte $0B   ;
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 0 - - - 0x009DC5 02:9DB5: 0C        .byte $0C   ;
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 0 - - - 0x009DC6 02:9DB6: 0D        .byte $0D   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009DC7 02:9DB7: 0E        .byte $0E   ;
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 0 - - - 0x009DC8 02:9DB8: 0F        .byte $0F   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x009DC9 02:9DB9: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 0 - - - 0x009DCA 02:9DBA: 11        .byte $11   ;
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - - - 0x009DCB 02:9DBB: 12        .byte $12   ;
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 0 - - - 0x009DCC 02:9DBC: 13        .byte $13   ;
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - - - 0x009DCD 02:9DBD: 14        .byte $14   ;
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 0 - - - 0x009DCE 02:9DBE: 15        .byte $15   ;
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x009DCF 02:9DBF: 16        .byte $16   ;
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x009DD0 02:9DC0: 17        .byte $17   ;
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x009DD1 02:9DC1: 18        .byte $18   ;
    ; [DIRECTIVE] .BYTE $19  -- needs manual handling  ; orig: - D 0 - - - 0x009DD2 02:9DC2: 19        .byte $19   ;
    ; [DIRECTIVE] .BYTE $1A  -- needs manual handling  ; orig: - D 0 - - - 0x009DD3 02:9DC3: 1A        .byte $1A   ;
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 0 - - - 0x009DD4 02:9DC4: 1B        .byte $1B   ;
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 0 - - - 0x009DD5 02:9DC5: 1C        .byte $1C   ;
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 0 - - - 0x009DD6 02:9DC6: 1D        .byte $1D   ;
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 0 - - - 0x009DD7 02:9DC7: 1E        .byte $1E   ;
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 0 - - - 0x009DD8 02:9DC8: 1F        .byte $1F   ;
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x009DD9 02:9DC9: 20        .byte $20   ;
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009DDA 02:9DCA: 21        .byte $21   ;
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 0 - - - 0x009DDB 02:9DCB: 22        .byte $22   ;
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x009DDC 02:9DCC: 23        .byte $23   ;
    ; [DIRECTIVE] .BYTE $62  -- needs manual handling  ; orig: - D 0 - - - 0x009DDD 02:9DCD: 62        .byte $62   ;
    ; [DIRECTIVE] .BYTE $63  -- needs manual handling  ; orig: - D 0 - - - 0x009DDE 02:9DCE: 63        .byte $63   ;
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 0 - - - 0x009DDF 02:9DCF: 28        .byte $28   ;
    ; [DIRECTIVE] .BYTE $29  -- needs manual handling  ; orig: - D 0 - - - 0x009DE0 02:9DD0: 29        .byte $29   ;
    ; [DIRECTIVE] .BYTE $2A  -- needs manual handling  ; orig: - D 0 - - - 0x009DE1 02:9DD1: 2A        .byte $2A   ;
    ; [DIRECTIVE] .BYTE $2B  -- needs manual handling  ; orig: - D 0 - - - 0x009DE2 02:9DD2: 2B        .byte $2B   ;
    ; [DIRECTIVE] .BYTE $2C  -- needs manual handling  ; orig: - D 0 - - - 0x009DE3 02:9DD3: 2C        .byte $2C   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x009DE4 02:9DD4: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x009DE5 02:9DD5: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x009DE6 02:9DD6: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x009DE7 02:9DD7: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x009DE8 02:9DD8: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x009DE9 02:9DD9: 05        .byte $05   ;
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x009DEA 02:9DDA: 06        .byte $06   ;
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - - - 0x009DEB 02:9DDB: 07        .byte $07   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x009DEC 02:9DDC: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 0 - - - 0x009DED 02:9DDD: 09        .byte $09   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009DEE 02:9DDE: 24        .byte $24   ;



tbl_9DDF:  ; orig: tbl_9DDF:

; offset via 0x009E1E

; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x009DEF 02:9DDF: 20        .byte $20   ;
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 0 - - - 0x009DF0 02:9DE0: CE        .byte $CE   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x009DF1 02:9DE1: 01        .byte $01   ;

; 05
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009DF2 02:9DE2: 21        .byte $21   ;
    ; [DIRECTIVE] .BYTE $2E  -- needs manual handling  ; orig: - D 0 - - - 0x009DF3 02:9DE3: 2E        .byte $2E   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x009DF4 02:9DE4: 01        .byte $01   ;

; 08
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009DF5 02:9DE5: 21        .byte $21   ;
    ; [DIRECTIVE] .BYTE $8E  -- needs manual handling  ; orig: - D 0 - - - 0x009DF6 02:9DE6: 8E        .byte $8E   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x009DF7 02:9DE7: 01        .byte $01   ;



tbl_9DE8:  ; orig: tbl_9DE8:

; offset via 0x009E18

; 04
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x009DF8 02:9DE8: 20        .byte $20   ;
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 0 - - - 0x009DF9 02:9DE9: CE        .byte $CE   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x009DFA 02:9DEA: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009DFB 02:9DEB: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009DFC 02:9DEC: FF        .byte $FF   ;

; 09
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009DFD 02:9DED: 21        .byte $21   ;
    ; [DIRECTIVE] .BYTE $2E  -- needs manual handling  ; orig: - D 0 - - - 0x009DFE 02:9DEE: 2E        .byte $2E   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x009DFF 02:9DEF: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009E00 02:9DF0: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009E01 02:9DF1: FF        .byte $FF   ;

; 0E
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x009E02 02:9DF2: 21        .byte $21   ;
    ; [DIRECTIVE] .BYTE $8E  -- needs manual handling  ; orig: - D 0 - - - 0x009E03 02:9DF3: 8E        .byte $8E   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x009E04 02:9DF4: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x009E05 02:9DF5: 24        .byte $24   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x009E06 02:9DF6: FF        .byte $FF   ;



tbl_9DF7_spr_data:  ; orig: tbl_9DF7_spr_data:
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 0 - - - 0x009E07 02:9DF7: F3        .byte $F3   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x009E08 02:9DF8: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $43  -- needs manual handling  ; orig: - D 0 - - - 0x009E09 02:9DF9: 43        .byte $43   ;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 0 - - - 0x009E0A 02:9DFA: F8        .byte $F8   ;
    ; [DIRECTIVE] .BYTE $25  -- needs manual handling  ; orig: - D 0 - - - 0x009E0B 02:9DFB: 25        .byte $25   ;
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x009E0C 02:9DFC: 23        .byte $23   ;
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 0 - - - 0x009E0D 02:9DFD: 70        .byte $70   ;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 0 - - - 0x009E0E 02:9DFE: F8        .byte $F8   ;
    ; [DIRECTIVE] .BYTE $25  -- needs manual handling  ; orig: - D 0 - - - 0x009E0F 02:9DFF: 25        .byte $25   ;
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x009E10 02:9E00: 23        .byte $23   ;
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x009E11 02:9E01: 30        .byte $30   ;



tbl_9E02_pos_Y:  ; orig: tbl_9E02_pos_Y:

; X = 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x009E12 02:9E02: 10        .byte $10   ; add
    ; [DIRECTIVE] .BYTE $C7  -- needs manual handling  ; orig: - D 0 - - - 0x009E13 02:9E03: C7        .byte $C7   ; compar
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - - - 0x009E14 02:9E04: 87        .byte $87   ; set if

; X = 03
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x009E15 02:9E05: F0        .byte $F0   ;
    ; [DIRECTIVE] .BYTE $77  -- needs manual handling  ; orig: - D 0 - - - 0x009E16 02:9E06: 77        .byte $77   ;
    ; [DIRECTIVE] .BYTE $B7  -- needs manual handling  ; orig: - D 0 - - - 0x009E17 02:9E07: B7        .byte $B7   ;



tbl_9E08_offset:  ; orig: tbl_9E08_offset:
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x009E18 02:9E08: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 0 - - - 0x009E19 02:9E09: 09        .byte $09   ;
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 0 - - - 0x009E1A 02:9E0A: 0E        .byte $0E   ;



tbl_9E0B:  ; orig: tbl_9E0B:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x009E1B 02:9E0B: 00        .byte $00   ; save s
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x009E1C 02:9E0C: 08        .byte $08   ; save s
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x009E1D 02:9E0D: 10        .byte $10   ; save s



tbl_9E0E_offset:  ; orig: tbl_9E0E_offset:
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x009E1E 02:9E0E: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x009E1F 02:9E0F: 05        .byte $05   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x009E20 02:9E10: 08        .byte $08   ;



loc_0x009E21:  ; orig: loc_0x009E21:
    MOVE.B  #$00,D0  ; orig: C D 0 - - - 0x009E21 02:9E11: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x009E23 02:9E13: 85 16     STA ram_current_save
    BSR     sub_9FDE             ; JSR -> BSR  ; orig: C - - - - - 0x009E25 02:9E15: 20 DE 9F  JSR sub_9FDE
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x009E28 02:9E18: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x009E2B 02:9E1B: A5 13     LDA ram_subscript
    BNE     bra_9E5A             ; BNE  ; orig: C - - - - - 0x009E2D 02:9E1D: D0 3B     BNE bra_9E5A
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - - - - 0x009E2F 02:9E1F: 20 6D E4  JSR sub_0x01E47D_cle
bra_9E22_loop:  ; orig: bra_9E22_loop:
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x009E32 02:9E22: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A437             ; JSR -> BSR  ; orig: C - - - - - 0x009E35 02:9E25: 20 37 A4  JSR sub_A437
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x009E38 02:9E28: E6 16     INC ram_current_save
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x009E3A 02:9E2A: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009E3C 02:9E2C: C9 03     CMP #$03
    BNE     bra_9E22_loop             ; BNE  ; orig: C - - - - - 0x009E3E 02:9E2E: D0 F2     BNE bra_9E22_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009E40 02:9E30: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x009E42 02:9E32: 85 16     STA ram_current_save
    MOVE.B  #$1C,D1  ; orig: C - - - - - 0x009E44 02:9E34: A2 1C     LDX #$1C
bra_9E36_loop:  ; orig: bra_9E36_loop:
    MOVE.B  tbl_9D41(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009E46 02:9E36: BD 41 9D  LDA tbl_9D41,X
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009E49 02:9E39: 9D 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009E4C 02:9E3C: CA        DEX
    BPL     bra_9E36_loop             ; BPL  ; orig: C - - - - - 0x009E4D 02:9E3D: 10 F7     BPL bra_9E36_loop
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x009E4F 02:9E3F: A5 12     LDA ram_script
    CMPI.B  #con_script_register,D0  ; orig: C - - - - - 0x009E51 02:9E41: C9 0E     CMP #con_script_regi
    BNE     bra_9E52             ; BNE  ; orig: C - - - - - 0x009E53 02:9E43: D0 0D     BNE bra_9E52
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x009E55 02:9E45: A0 00     LDY #$00
bra_9E47_loop:  ; orig: bra_9E47_loop:
    MOVE.B  tbl_9D5E(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009E57 02:9E47: B9 5E 9D  LDA tbl_9D5E,Y
    LEA     (ram_0302_ppu_buffer+$07).l,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x009E5A 02:9E4A: 99 09 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009E5D 02:9E4D: C8        INY
    CMPI.B  #$12,D2  ; orig: C - - - - - 0x009E5E 02:9E4E: C0 12     CPY #$12
    BNE     bra_9E47_loop             ; BNE  ; orig: C - - - - - 0x009E60 02:9E50: D0 F5     BNE bra_9E47_loop
bra_9E52:  ; orig: bra_9E52:
    MOVE.B  #$1D,D0  ; orig: C - - - - - 0x009E62 02:9E52: A9 1D     LDA #$1D
bra_9E54:  ; orig: bra_9E54:
    MOVE.B  D0,ram_0301_buffer_index  ; orig: C - - - - - 0x009E64 02:9E54: 8D 01 03  STA ram_0301_buffer_
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x009E67 02:9E57: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x009E69 02:9E59: 60        RTS
bra_9E5A:  ; orig: bra_9E5A:
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x009E6A 02:9E5A: C9 01     CMP #$01
    BNE     bra_9E99             ; BNE  ; orig: C - - - - - 0x009E6C 02:9E5C: D0 3B     BNE bra_9E99
    MOVE.B  #$33,D1  ; orig: C - - - - - 0x009E6E 02:9E5E: A2 33     LDX #$33
bra_9E60_loop:  ; orig: bra_9E60_loop:
    MOVE.B  tbl_9D7B(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009E70 02:9E60: BD 7B 9D  LDA tbl_9D7B,X
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x009E73 02:9E63: 9D 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009E76 02:9E66: CA        DEX
    BPL     bra_9E60_loop             ; BPL  ; orig: C - - - - - 0x009E77 02:9E67: 10 F7     BPL bra_9E60_loop
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x009E79 02:9E69: A2 00     LDX #$00
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x009E7B 02:9E6B: A0 00     LDY #$00
bra_9E6D_loop:  ; orig: bra_9E6D_loop:
    MOVE.B  ram_slot_name(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009E7D 02:9E6D: B9 38 06  LDA ram_slot_name,Y
    LEA     (ram_0302_ppu_buffer+$03).l,A1
    MOVE.B  D0,(A1,D1.W)  ; orig: C - - - - - 0x009E80 02:9E70: 9D 05 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009E83 02:9E73: E8        INX
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009E84 02:9E74: C8        INY
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x009E85 02:9E75: 98        TYA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x009E86 02:9E76: 29 07     AND #$07
    BNE     bra_9E6D_loop             ; BNE  ; orig: C - - - - - 0x009E88 02:9E78: D0 F3     BNE bra_9E6D_loop
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009E8A 02:9E7A: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009E8B 02:9E7B: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009E8C 02:9E7C: E8        INX
    CMPI.B  #$21,D1  ; orig: C - - - - - 0x009E8D 02:9E7D: E0 21     CPX #$21
    BNE     bra_9E6D_loop             ; BNE  ; orig: C - - - - - 0x009E8F 02:9E7F: D0 EC     BNE bra_9E6D_loop
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x009E91 02:9E81: A5 12     LDA ram_script
    CMPI.B  #con_script_register,D0  ; orig: C - - - - - 0x009E93 02:9E83: C9 0E     CMP #con_script_regi
    BNE     bra_9E95             ; BNE  ; orig: C - - - - - 0x009E95 02:9E85: D0 0E     BNE bra_9E95
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x009E97 02:9E87: A0 00     LDY #$00
bra_9E89_loop:  ; orig: bra_9E89_loop:
    MOVE.B  tbl_9D70(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009E99 02:9E89: B9 70 9D  LDA tbl_9D70,Y
    LEA     (ram_0302_ppu_buffer+$03).l,A1
    MOVE.B  D0,(A1,D1.W)  ; orig: C - - - - - 0x009E9C 02:9E8C: 9D 05 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009E9F 02:9E8F: E8        INX
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009EA0 02:9E90: C8        INY
    CMPI.B  #$0B,D2  ; orig: C - - - - - 0x009EA1 02:9E91: C0 0B     CPY #$0B
    BNE     bra_9E89_loop             ; BNE  ; orig: C - - - - - 0x009EA3 02:9E93: D0 F4     BNE bra_9E89_loop
bra_9E95:  ; orig: bra_9E95:
    MOVE.B  #$34,D0  ; orig: C - - - - - 0x009EA5 02:9E95: A9 34     LDA #$34
    BNE     bra_9E54             ; BNE  ; orig: C - - - - - 0x009EA7 02:9E97: D0 BB     BNE bra_9E54    ; jm
bra_9E99:  ; orig: bra_9E99:
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x009EA9 02:9E99: C9 02     CMP #$02
    BNE     bra_9EA4             ; BNE  ; orig: C - - - - - 0x009EAB 02:9E9B: D0 07     BNE bra_9EA4
    MOVE.B  #con_ppu_buf_16,D0  ; orig: C - - - - - 0x009EAD 02:9E9D: A9 16     LDA #con_ppu_buf_16
bra_9E9F:  ; orig: bra_9E9F:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x009EAF 02:9E9F: 85 14     STA ram_ppu_load_ind
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x009EB1 02:9EA1: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x009EB3 02:9EA3: 60        RTS
bra_9EA4:  ; orig: bra_9EA4:
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009EB4 02:9EA4: C9 03     CMP #$03
    BNE     bra_9EB9             ; BNE  ; orig: C - - - - - 0x009EB6 02:9EA6: D0 11     BNE bra_9EB9
    MOVE.B  #$15,D0  ; orig: C - - - - - 0x009EB8 02:9EA8: A9 15     LDA #$15
    MOVE.B  ram_script,D2  ; orig: C - - - - - 0x009EBA 02:9EAA: A4 12     LDY ram_script
    CMPI.B  #con_script_elimination,D2  ; orig: C - - - - - 0x009EBC 02:9EAC: C0 0F     CPY #con_script_elim
    BNE     bra_9EB2             ; BNE  ; orig: C - - - - - 0x009EBE 02:9EAE: D0 02     BNE bra_9EB2
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x009EC0 02:9EB0: A9 30     LDA #$30
bra_9EB2:  ; orig: bra_9EB2:
    MOVE.B  D0,ram_6810  ; orig: C - - - - - 0x009EC2 02:9EB2: 8D 10 68  STA ram_6810
    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x009EC5 02:9EB5: A9 12     LDA #con_ppu_buf_12
    BNE     bra_9E9F             ; BNE  ; orig: C - - - - - 0x009EC7 02:9EB7: D0 E6     BNE bra_9E9F    ; jm
bra_9EB9:  ; orig: bra_9EB9:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x009EC9 02:9EB9: A5 12     LDA ram_script
    CMPI.B  #con_script_elimination,D0  ; orig: C - - - - - 0x009ECB 02:9EBB: C9 0F     CMP #con_script_elim
    BEQ     bra_9ED0             ; BEQ  ; orig: C - - - - - 0x009ECD 02:9EBD: F0 11     BEQ bra_9ED0
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x009ECF 02:9EBF: A2 03     LDX #$03
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x009ED1 02:9EC1: A0 FF     LDY #$FF
    MOVE.B  D2,ram_current_save_slot  ; orig: C - - - - - 0x009ED3 02:9EC3: 84 16     STY ram_current_save
bra_9EC5_loop:  ; orig: bra_9EC5_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009ED5 02:9EC5: C8        INY
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x009ED6 02:9EC6: E6 16     INC ram_current_save
    MOVE.B  ram_slot_active_flag(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009ED8 02:9EC8: B9 33 06  LDA ram_slot_active_
    BEQ     bra_9ED0             ; BEQ  ; orig: C - - - - - 0x009EDB 02:9ECB: F0 03     BEQ bra_9ED0
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x009EDD 02:9ECD: CA        DEX
    BPL     bra_9EC5_loop             ; BPL  ; orig: C - - - - - 0x009EDE 02:9ECE: 10 F5     BPL bra_9EC5_loop
bra_9ED0:  ; orig: bra_9ED0:
    BSR     sub_A18E             ; JSR -> BSR  ; orig: C - - - - - 0x009EE0 02:9ED0: 20 8E A1  JSR sub_A18E
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x009EE3 02:9ED3: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009EE5 02:9ED5: C9 03     CMP #$03
    BNE     bra_9EDE             ; BNE  ; orig: C - - - - - 0x009EE7 02:9ED7: D0 05     BNE bra_9EDE
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x009EE9 02:9ED9: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: C - - - - - 0x009EEB 02:9EDB: 8D 08 02  STA ram_spr_Y + $08
bra_9EDE:  ; orig: bra_9EDE:
    MOVE.B  #$50,D0  ; orig: C - - - - - 0x009EEE 02:9EDE: A9 50     LDA #$50
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x009EF0 02:9EE0: 85 00     STA ram_0000_t21_spr
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x009EF2 02:9EE2: A9 30     LDA #$30
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x009EF4 02:9EE4: 85 01     STA ram_0001_t15_spr
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x009EF6 02:9EE6: E6 11     INC ram_0011_screen_
    JMP     loc_A638  ; orig: C - - - - - 0x009EF8 02:9EE8: 4C 38 A6  JMP loc_A638



tbl_9EEB_name_zelda:  ; orig: tbl_9EEB_name_zelda:
    ; [DIRECTIVE] .BYTE $23, $0E, $15, $0D, $0A  -- needs manual handling  ; orig: - D 0 - - - 0x009EFB 02:9EEB: 23        .byte $23, $0E, $15,



ofs_main_script_2_0x009F00_0E_register:  ; orig: ofs_main_script_2_0x009F00_0E_register:

; con_script_register
    MOVE.B  ram_btn_press,D0  ; orig: C - - J - - 0x009F00 02:9EF0: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x009F02 02:9EF2: 29 10     AND #con_btn_Start
    BEQ     bra_9EFC             ; BEQ  ; orig: C - - - - - 0x009F04 02:9EF4: F0 06     BEQ bra_9EFC
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x009F06 02:9EF6: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009F08 02:9EF8: C9 03     CMP #$03
    BEQ     bra_9EFF             ; BEQ  ; orig: C - - - - - 0x009F0A 02:9EFA: F0 03     BEQ bra_9EFF
bra_9EFC:  ; orig: bra_9EFC:
    JMP     loc_9FB0  ; orig: C - - - - - 0x009F0C 02:9EFC: 4C B0 9F  JMP loc_9FB0
bra_9EFF:  ; orig: bra_9EFF:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009F0F 02:9EFF: A9 00     LDA #$00
    MOVE.B  D0,ram_0607_sfx_2  ; orig: C - - - - - 0x009F11 02:9F01: 8D 07 06  STA ram_0607_sfx_2
    MOVE.B  D0,ram_0425  ; orig: C - - - - - 0x009F14 02:9F04: 8D 25 04  STA ram_0425
    MOVE.B  D0,ram_0423  ; orig: C - - - - - 0x009F17 02:9F07: 8D 23 04  STA ram_0423
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x009F1A 02:9F0A: 85 16     STA ram_current_save
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x009F1C 02:9F0C: AA        TAX
loc_9F0D_loop:  ; orig: loc_9F0D_loop:
    MOVE.B  ram_current_save_slot,D2  ; orig: C D 0 - - - 0x009F1D 02:9F0D: A4 16     LDY ram_current_save
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009F1F 02:9F0F: A9 FF     LDA #$FF
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009F21 02:9F11: 99 2A 65  STA ram_652A_slot,Y
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x009F24 02:9F14: 98        TYA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009F25 02:9F15: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009F26 02:9F16: A8        TAY
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009F27 02:9F17: A9 00     LDA #$00
    MOVE.B  D0,ram_0426  ; orig: C - - - - - 0x009F29 02:9F19: 8D 26 04  STA ram_0426
    MOVE.B  D0,ram_6D9C(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x009F2C 02:9F1C: 99 9C 6D  STA ram_6D9C,Y  ; 6D
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009F2F 02:9F1F: C8        INY
    ; (empty translation for STA)  ; orig: C - - - - - 0x009F30 02:9F20: 99 9C 6D  STA ram_6D9D - $01,Y
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x009F33 02:9F23: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x009F34 02:9F24: 48        PHA
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x009F35 02:9F25: 20 2A 9D  JSR sub_9D2A_prepare
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x009F38 02:9F28: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x009F39 02:9F29: AA        TAX
bra_9F2A_loop:  ; orig: bra_9F2A_loop:
    MOVE.B  ram_0423,D2  ; orig: C - - - - - 0x009F3A 02:9F2A: AC 23 04  LDY ram_0423
    MOVE.B  ram_slot_name(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009F3D 02:9F2D: B9 38 06  LDA ram_slot_name,Y
    MOVE.B  ram_0425,D2  ; orig: C - - - - - 0x009F40 02:9F30: AC 25 04  LDY ram_0425
    MOVEA.W ($FF0000+ram_00C4_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F43 02:9F33: 91 C4     STA (ram_00C4_t01_da
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x009F45 02:9F35: C9 24     CMP #$24
    BEQ     bra_9F79             ; BEQ  ; orig: C - - - - - 0x009F47 02:9F37: F0 40     BEQ bra_9F79
    MOVE.B  ram_slot_active_flag(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x009F49 02:9F39: BD 33 06  LDA ram_slot_active_
    BNE     bra_9F79             ; BNE  ; orig: C - - - - - 0x009F4C 02:9F3C: D0 3B     BNE bra_9F79
    MOVE.B  #$18,D2  ; orig: C - - - - - 0x009F4E 02:9F3E: A0 18     LDY #$18
    MOVE.B  #$22,D0  ; orig: C - - - - - 0x009F50 02:9F40: A9 22     LDA #$22
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F52 02:9F42: 91 C0     STA (ram_00C0_t01_da
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009F54 02:9F44: C8        INY ; 19
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x009F55 02:9F45: A9 FF     LDA #$FF
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F57 02:9F47: 91 C0     STA (ram_00C0_t01_da
    MOVE.B  #$25,D2  ; orig: C - - - - - 0x009F59 02:9F49: A0 25     LDY #$25
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x009F5B 02:9F4B: A9 08     LDA #$08
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F5D 02:9F4D: 91 C0     STA (ram_00C0_t01_da
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x009F5F 02:9F4F: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x009F60 02:9F50: 48        PHA

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009F61 02:9F51: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009F62 02:9F52: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x009F63 02:9F53: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x009F64 02:9F54: A8        TAY
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x009F65 02:9F55: A2 00     LDX #$00
bra_9F57_loop:  ; orig: bra_9F57_loop:
    MOVE.B  ram_slot_name(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x009F67 02:9F57: B9 38 06  LDA ram_slot_name,Y
    CMP.B   tbl_9EEB_name_zelda(D1.L),D0  ; orig: C - - - - - 0x009F6A 02:9F5A: DD EB 9E  CMP tbl_9EEB_name_ze
    BNE     bra_9F6E             ; BNE  ; orig: C - - - - - 0x009F6D 02:9F5D: D0 0F     BNE bra_9F6E
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x009F6F 02:9F5F: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009F70 02:9F60: E8        INX
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x009F71 02:9F61: E0 05     CPX #$05
    BCC     bra_9F57_loop             ; BCC  ; orig: C - - - - - 0x009F73 02:9F63: 90 F2     BCC bra_9F57_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x009F75 02:9F65: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x009F76 02:9F66: 48        PHA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x009F77 02:9F67: AA        TAX
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x009F78 02:9F68: A0 00     LDY #$00
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x009F7A 02:9F6A: A9 01     LDA #$01
    MOVEA.W ($FF0000+ram_00CC_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F7C 02:9F6C: 91 CC     STA (ram_00CC_t01_da
bra_9F6E:  ; orig: bra_9F6E:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x009F7E 02:9F6E: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x009F7F 02:9F6F: AA        TAX
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x009F80 02:9F70: A9 01     LDA #$01
    MOVE.B  D0,ram_0426  ; orig: C - - - - - 0x009F82 02:9F72: 8D 26 04  STA ram_0426
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x009F85 02:9F75: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_00C6_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x009F87 02:9F77: 91 C6     STA (ram_00C6_t01_da
bra_9F79:  ; orig: bra_9F79:
    ADDQ.B  #1,ram_0423  ; orig: C - - - - - 0x009F89 02:9F79: EE 23 04  INC ram_0423
    ADDQ.B  #1,ram_0425  ; orig: C - - - - - 0x009F8C 02:9F7C: EE 25 04  INC ram_0425
    MOVE.B  ram_0425,D0  ; orig: C - - - - - 0x009F8F 02:9F7F: AD 25 04  LDA ram_0425
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x009F92 02:9F82: C9 08     CMP #$08
    BNE     bra_9F2A_loop             ; BNE  ; orig: C - - - - - 0x009F94 02:9F84: D0 A4     BNE bra_9F2A_loop
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x009F96 02:9F86: E8        INX
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009F97 02:9F87: A9 00     LDA #$00
    MOVE.B  D0,ram_0425  ; orig: C - - - - - 0x009F99 02:9F89: 8D 25 04  STA ram_0425
    MOVE.B  ram_0426,D0  ; orig: C - - - - - 0x009F9C 02:9F8C: AD 26 04  LDA ram_0426
    BEQ     bra_9F94             ; BEQ  ; orig: C - - - - - 0x009F9F 02:9F8F: F0 03     BEQ bra_9F94
    BSR     sub_A3C8             ; JSR -> BSR  ; orig: C - - - - - 0x009FA1 02:9F91: 20 C8 A3  JSR sub_A3C8
bra_9F94:  ; orig: bra_9F94:
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x009FA4 02:9F94: E6 16     INC ram_current_save
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x009FA6 02:9F96: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009FA8 02:9F98: C9 03     CMP #$03
    BEQ     bra_9F9F             ; BEQ  ; orig: C - - - - - 0x009FAA 02:9F9A: F0 03     BEQ bra_9F9F
    JMP     loc_9F0D_loop  ; orig: C - - - - - 0x009FAC 02:9F9C: 4C 0D 9F  JMP loc_9F0D_loop
bra_9F9F:  ; orig: bra_9F9F:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009FAF 02:9F9F: A9 00     LDA #$00
    MOVE.B  D0,ram_0426  ; orig: C - - - - - 0x009FB1 02:9FA1: 8D 26 04  STA ram_0426
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x009FB4 02:9FA4: 85 16     STA ram_current_save
    BSR     sub_9FDE             ; JSR -> BSR  ; orig: C - - - - - 0x009FB6 02:9FA6: 20 DE 9F  JSR sub_9FDE
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x009FB9 02:9FA9: A9 01     LDA #$01
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x009FBB 02:9FAB: 85 11     STA ram_0011_screen_
    JMP     loc_A803  ; orig: C - - - - - 0x009FBD 02:9FAD: 4C 03 A8  JMP loc_A803



loc_9FB0:  ; orig: loc_9FB0:
    MOVE.B  ram_current_save_slot,D0  ; orig: C D 0 - - - 0x009FC0 02:9FB0: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009FC2 02:9FB2: C9 03     CMP #$03
    BEQ     bra_9FB9             ; BEQ  ; orig: C - - - - - 0x009FC4 02:9FB4: F0 03     BEQ bra_9FB9
    BSR     sub_A011             ; JSR -> BSR  ; orig: C - - - - - 0x009FC6 02:9FB6: 20 11 A0  JSR sub_A011
bra_9FB9:  ; orig: bra_9FB9:
    BSR     sub_A204             ; JSR -> BSR  ; orig: C - - - - - 0x009FC9 02:9FB9: 20 04 A2  JSR sub_A204
    BSR     sub_A1C3             ; JSR -> BSR  ; orig: C - - - - - 0x009FCC 02:9FBC: 20 C3 A1  JSR sub_A1C3
    BSR     sub_A1DD             ; JSR -> BSR  ; orig: C - - - - - 0x009FCF 02:9FBF: 20 DD A1  JSR sub_A1DD
    JMP     loc_A10B  ; orig: C - - - - - 0x009FD2 02:9FC2: 4C 0B A1  JMP loc_A10B



ofs_main_script_2_0x009FD5_0F_elimination:  ; orig: ofs_main_script_2_0x009FD5_0F_elimination:

; con_script_elimination
    MOVE.B  ram_btn_press,D0  ; orig: C - - J - - 0x009FD5 02:9FC5: A5 F8     LDA ram_btn_press
    CMPI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x009FD7 02:9FC7: C9 10     CMP #con_btn_Start
    BEQ     bra_9FCE             ; BEQ  ; orig: C - - - - - 0x009FD9 02:9FC9: F0 03     BEQ bra_9FCE
    JMP     loc_A204  ; orig: C - - - - - 0x009FDB 02:9FCB: 4C 04 A2  JMP loc_A204
bra_9FCE:  ; orig: bra_9FCE:
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x009FDE 02:9FCE: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x009FE0 02:9FD0: C9 03     CMP #$03
    BNE     bra_9FE8             ; BNE  ; orig: C - - - - - 0x009FE2 02:9FD2: D0 14     BNE bra_9FE8
    MOVE.B  #con_script_register,D0  ; orig: C - - - - - 0x009FE4 02:9FD4: A9 0E     LDA #con_script_regi
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x009FE6 02:9FD6: 85 12     STA ram_script
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x009FE8 02:9FD8: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x009FEA 02:9FDA: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x009FEC 02:9FDC: 85 13     STA ram_subscript
sub_9FDE:  ; orig: sub_9FDE:
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x009FEE 02:9FDE: 8D 1F 04  STA ram_041F
    MOVE.B  D0,ram_0420  ; orig: C - - - - - 0x009FF1 02:9FE1: 8D 20 04  STA ram_0420
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x009FF4 02:9FE4: 8D 21 04  STA ram_0421
    RTS                     ; RTS  ; orig: C - - - - - 0x009FF7 02:9FE7: 60        RTS
bra_9FE8:  ; orig: bra_9FE8:
    MOVE.B  #con_sfx_1_plr_hit,D0  ; orig: C - - - - - 0x009FF8 02:9FE8: A9 08     LDA #con_sfx_1_plr_h
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x009FFA 02:9FEA: 8D 01 06  STA ram_sfx_1
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x009FFD 02:9FED: A4 16     LDY ram_current_save
    MOVE.B  tbl_9E08_offset(D2.L),D1  ; LDX abs,Y  ; orig: C - - - - - 0x009FFF 02:9FEF: BE 08 9E  LDX tbl_9E08_offset,
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x00A002 02:9FF2: A0 04     LDY #$04
bra_9FF4_loop:  ; orig: bra_9FF4_loop:
    MOVE.B  tbl_9DE8(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00A004 02:9FF4: BD E8 9D  LDA tbl_9DE8,X
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A007 02:9FF7: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00A00A 02:9FFA: CA        DEX
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A00B 02:9FFB: 88        DEY
    BPL     bra_9FF4_loop             ; BPL  ; orig: C - - - - - 0x00A00C 02:9FFC: 10 F6     BPL bra_9FF4_loop
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A00E 02:9FFE: 20 F1 6D  JSR sub_bat_6FD1_pre
    BSR     sub_A35D             ; JSR -> BSR  ; orig: C - - - - - 0x00A011 02:A001: 20 5D A3  JSR sub_A35D
    BSR     sub_A80C_prepare_slot_name_address             ; JSR -> BSR  ; orig: C - - - - - 0x00A014 02:A004: 20 0C A8  JSR sub_A80C_prepare
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A017 02:A007: A0 07     LDY #$07
bra_A009_loop:  ; orig: bra_A009_loop:
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00A019 02:A009: A9 24     LDA #$24
    MOVEA.W ($FF0000+ram_000C_t02_slot_name_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A01B 02:A00B: 91 0C     STA (ram_000C_t02_sl
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A01D 02:A00D: 88        DEY
    BPL     bra_A009_loop             ; BPL  ; orig: C - - - - - 0x00A01E 02:A00E: 10 F9     BPL bra_A009_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x00A020 02:A010: 60        RTS



sub_A011:  ; orig: sub_A011:
    MOVE.B  ram_btn_hold,D0  ; orig: C - - - - - 0x00A021 02:A011: A5 FA     LDA ram_btn_hold
    ANDI.B  #con_btns_Dpad,D0  ; orig: C - - - - - 0x00A023 02:A013: 29 0F     AND #con_btns_Dpad
    BNE     bra_A021             ; BNE  ; orig: C - - - - - 0x00A025 02:A015: D0 0A     BNE bra_A021
sub_A017:  ; orig: sub_A017:
    MOVE.B  D0,ram_0426  ; orig: C - - - - - 0x00A027 02:A017: 8D 26 04  STA ram_0426
    MOVE.B  D0,ram_0428  ; orig: C - - - - - 0x00A02A 02:A01A: 8D 28 04  STA ram_0428
    MOVE.B  D0,ram_0429  ; orig: C - - - - - 0x00A02D 02:A01D: 8D 29 04  STA ram_0429
    RTS                     ; RTS  ; orig: C - - - - - 0x00A030 02:A020: 60        RTS
bra_A021:  ; orig: bra_A021:
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A031 02:A021: A8        TAY
    MOVE.B  ram_0426,D0  ; orig: C - - - - - 0x00A032 02:A022: AD 26 04  LDA ram_0426
    BNE     bra_A02D             ; BNE  ; orig: C - - - - - 0x00A035 02:A025: D0 06     BNE bra_A02D
    MOVE.B  D2,ram_0427  ; orig: C - - - - - 0x00A037 02:A027: 8C 27 04  STY ram_0427
    ADDQ.B  #1,ram_0426  ; orig: C - - - - - 0x00A03A 02:A02A: EE 26 04  INC ram_0426
bra_A02D:  ; orig: bra_A02D:
    MOVE.B  ram_btn_hold,D0  ; orig: C - - - - - 0x00A03D 02:A02D: A5 FA     LDA ram_btn_hold
    ANDI.B  #con_btns_Dpad,D0  ; orig: C - - - - - 0x00A03F 02:A02F: 29 0F     AND #con_btns_Dpad
    CMP.B   ram_0427,D0  ; orig: C - - - - - 0x00A041 02:A031: CD 27 04  CMP ram_0427
    BEQ     bra_A03B             ; BEQ  ; orig: C - - - - - 0x00A044 02:A034: F0 05     BEQ bra_A03B
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A046 02:A036: A9 00     LDA #$00
    BSR     sub_A017             ; JSR -> BSR  ; orig: C - - - - - 0x00A048 02:A038: 20 17 A0  JSR sub_A017
bra_A03B:  ; orig: bra_A03B:
    MOVE.B  ram_0429,D0  ; orig: C - - - - - 0x00A04B 02:A03B: AD 29 04  LDA ram_0429
    BEQ     bra_A044             ; BEQ  ; orig: C - - - - - 0x00A04E 02:A03E: F0 04     BEQ bra_A044
    SUBQ.B  #1,ram_0429  ; orig: C - - - - - 0x00A050 02:A040: CE 29 04  DEC ram_0429
    RTS                     ; RTS  ; orig: C - - - - - 0x00A053 02:A043: 60        RTS
bra_A044:  ; orig: bra_A044:
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x00A054 02:A044: A0 08     LDY #$08
    MOVE.B  ram_0428,D0  ; orig: C - - - - - 0x00A056 02:A046: AD 28 04  LDA ram_0428
    BNE     bra_A04D             ; BNE  ; orig: C - - - - - 0x00A059 02:A049: D0 02     BNE bra_A04D
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x00A05B 02:A04B: A0 10     LDY #$10
bra_A04D:  ; orig: bra_A04D:
    MOVE.B  D2,ram_0429  ; orig: C - - - - - 0x00A05D 02:A04D: 8C 29 04  STY ram_0429
    MOVE.B  ram_btn_hold,D0  ; orig: C - - - - - 0x00A060 02:A050: A5 FA     LDA ram_btn_hold
    ANDI.B  #con_btns_Dpad,D0  ; orig: C - - - - - 0x00A062 02:A052: 29 0F     AND #con_btns_Dpad
    CMPI.B  #con_btn_Right,D0  ; orig: C - - - - - 0x00A064 02:A054: C9 01     CMP #con_btn_Right
    BNE     bra_A07C             ; BNE  ; orig: C - - - - - 0x00A066 02:A056: D0 24     BNE bra_A07C
    ADDQ.B  #1,ram_041F  ; orig: C - - - - - 0x00A068 02:A058: EE 1F 04  INC ram_041F
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A06B 02:A05B: A5 71     LDA ram_pos_X_enemy 
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A06D 02:A05D: 18        CLC
    ADDX.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A06E 02:A05E: 69 10     ADC #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A070 02:A060: 85 71     STA ram_pos_X_enemy 
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x00A072 02:A062: C9 E0     CMP #$E0
    BNE     bra_A079             ; BNE  ; orig: C - - - - - 0x00A074 02:A064: D0 13     BNE bra_A079
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x00A076 02:A066: A9 30     LDA #$30
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A078 02:A068: 85 71     STA ram_pos_X_enemy 
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00A07A 02:A06A: A2 00     LDX #$00
    BSR     sub_A0F0             ; JSR -> BSR  ; orig: C - - - - - 0x00A07C 02:A06C: 20 F0 A0  JSR sub_A0F0
    MOVE.B  ram_042A,D0  ; orig: C - - - - - 0x00A07F 02:A06F: AD 2A 04  LDA ram_042A
    BEQ     bra_A079             ; BEQ  ; orig: C - - - - - 0x00A082 02:A072: F0 05     BEQ bra_A079
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A084 02:A074: A9 00     LDA #$00
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A086 02:A076: 8D 1F 04  STA ram_041F
bra_A079:  ; orig: bra_A079:
    JMP     loc_A0E7  ; orig: C - - - - - 0x00A089 02:A079: 4C E7 A0  JMP loc_A0E7
bra_A07C:  ; orig: bra_A07C:
    CMPI.B  #con_btn_Left,D0  ; orig: C - - - - - 0x00A08C 02:A07C: C9 02     CMP #con_btn_Left
    BNE     bra_A0A4             ; BNE  ; orig: C - - - - - 0x00A08E 02:A07E: D0 24     BNE bra_A0A4
    SUBQ.B  #1,ram_041F  ; orig: C - - - - - 0x00A090 02:A080: CE 1F 04  DEC ram_041F
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A093 02:A083: A5 71     LDA ram_pos_X_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A095 02:A085: 38        SEC
    SUBX.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x00A096 02:A086: E9 10     SBC #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A098 02:A088: 85 71     STA ram_pos_X_enemy 
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x00A09A 02:A08A: C9 20     CMP #$20
    BNE     bra_A0A1             ; BNE  ; orig: C - - - - - 0x00A09C 02:A08C: D0 13     BNE bra_A0A1
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x00A09E 02:A08E: A9 D0     LDA #$D0
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A0A0 02:A090: 85 71     STA ram_pos_X_enemy 
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x00A0A2 02:A092: A2 03     LDX #$03
    BSR     sub_A0F0             ; JSR -> BSR  ; orig: C - - - - - 0x00A0A4 02:A094: 20 F0 A0  JSR sub_A0F0
    MOVE.B  ram_042A,D0  ; orig: C - - - - - 0x00A0A7 02:A097: AD 2A 04  LDA ram_042A
    BEQ     bra_A0A1             ; BEQ  ; orig: C - - - - - 0x00A0AA 02:A09A: F0 05     BEQ bra_A0A1
    MOVE.B  #$2B,D0  ; orig: C - - - - - 0x00A0AC 02:A09C: A9 2B     LDA #$2B
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A0AE 02:A09E: 8D 1F 04  STA ram_041F
bra_A0A1:  ; orig: bra_A0A1:
    JMP     loc_A0E7  ; orig: C - - - - - 0x00A0B1 02:A0A1: 4C E7 A0  JMP loc_A0E7
bra_A0A4:  ; orig: bra_A0A4:
    CMPI.B  #con_btn_Down,D0  ; orig: C - - - - - 0x00A0B4 02:A0A4: C9 04     CMP #con_btn_Down
    BNE     bra_A0C7             ; BNE  ; orig: C - - - - - 0x00A0B6 02:A0A6: D0 1F     BNE bra_A0C7
    MOVE.B  ram_041F,D0  ; orig: C - - - - - 0x00A0B8 02:A0A8: AD 1F 04  LDA ram_041F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A0BB 02:A0AB: 18        CLC
    ADDX.B  #$0B,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A0BC 02:A0AC: 69 0B     ADC #$0B
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A0BE 02:A0AE: 8D 1F 04  STA ram_041F
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00A0C1 02:A0B1: A2 00     LDX #$00
    BSR     sub_A0F0             ; JSR -> BSR  ; orig: C - - - - - 0x00A0C3 02:A0B3: 20 F0 A0  JSR sub_A0F0
    MOVE.B  ram_042A,D0  ; orig: C - - - - - 0x00A0C6 02:A0B6: AD 2A 04  LDA ram_042A
    BEQ     bra_A0C4             ; BEQ  ; orig: C - - - - - 0x00A0C9 02:A0B9: F0 09     BEQ bra_A0C4
    MOVE.B  ram_041F,D0  ; orig: C - - - - - 0x00A0CB 02:A0BB: AD 1F 04  LDA ram_041F
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A0CE 02:A0BE: 38        SEC
    SUBX.B  #$2C,D0       ; SBC imm  ; orig: C - - - - - 0x00A0CF 02:A0BF: E9 2C     SBC #$2C
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A0D1 02:A0C1: 8D 1F 04  STA ram_041F
bra_A0C4:  ; orig: bra_A0C4:
    JMP     loc_A0E7  ; orig: C - - - - - 0x00A0D4 02:A0C4: 4C E7 A0  JMP loc_A0E7
bra_A0C7:  ; orig: bra_A0C7:
    CMPI.B  #con_btn_Up,D0  ; orig: C - - - - - 0x00A0D7 02:A0C7: C9 08     CMP #con_btn_Up
    BNE     bra_A0EF_RTS             ; BNE  ; orig: C - - - - - 0x00A0D9 02:A0C9: D0 24     BNE bra_A0EF_RTS
    MOVE.B  ram_041F,D0  ; orig: C - - - - - 0x00A0DB 02:A0CB: AD 1F 04  LDA ram_041F
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A0DE 02:A0CE: 38        SEC
    SUBX.B  #$0B,D0       ; SBC imm  ; orig: C - - - - - 0x00A0DF 02:A0CF: E9 0B     SBC #$0B
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A0E1 02:A0D1: 8D 1F 04  STA ram_041F
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x00A0E4 02:A0D4: A2 03     LDX #$03
    BSR     sub_A0F0             ; JSR -> BSR  ; orig: C - - - - - 0x00A0E6 02:A0D6: 20 F0 A0  JSR sub_A0F0
    MOVE.B  ram_042A,D0  ; orig: C - - - - - 0x00A0E9 02:A0D9: AD 2A 04  LDA ram_042A
    BEQ     bra_A0E7             ; BEQ  ; orig: C - - - - - 0x00A0EC 02:A0DC: F0 09     BEQ bra_A0E7
    MOVE.B  ram_041F,D0  ; orig: C - - - - - 0x00A0EE 02:A0DE: AD 1F 04  LDA ram_041F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A0F1 02:A0E1: 18        CLC
    ADDX.B  #$2C,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A0F2 02:A0E2: 69 2C     ADC #$2C
    MOVE.B  D0,ram_041F  ; orig: C - - - - - 0x00A0F4 02:A0E4: 8D 1F 04  STA ram_041F
bra_A0E7:  ; orig: bra_A0E7:
loc_A0E7:  ; orig: loc_A0E7:
    MOVE.B  #$01,D0  ; orig: C D 1 - - - 0x00A0F7 02:A0E7: A9 01     LDA #$01    ; con_sf
    MOVE.B  D0,ram_0428  ; orig: C - - - - - 0x00A0F9 02:A0E9: 8D 28 04  STA ram_0428
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x00A0FC 02:A0EC: 8D 02 06  STA ram_sfx_2
bra_A0EF_RTS:  ; orig: bra_A0EF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A0FF 02:A0EF: 60        RTS



sub_A0F0:  ; orig: sub_A0F0:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A100 02:A0F0: A0 00     LDY #$00
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A102 02:A0F2: A5 85     LDA ram_pos_Y_enemy 
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A104 02:A0F4: 18        CLC
    ; !! ADC tbl_9E02_pos_Y,X - complex mode, manual review needed  ; orig: C - - - - - 0x00A105 02:A0F5: 7D 02 9E  ADC tbl_9E02_pos_Y,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A108 02:A0F8: 85 85     STA ram_pos_Y_enemy 
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00A10A 02:A0FA: E8        INX
    CMP.B   tbl_9E02_pos_Y(D1.L),D0  ; orig: C - - - - - 0x00A10B 02:A0FB: DD 02 9E  CMP tbl_9E02_pos_Y,X
    BNE     bra_A107             ; BNE  ; orig: C - - - - - 0x00A10E 02:A0FE: D0 07     BNE bra_A107
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00A110 02:A100: E8        INX
    MOVE.B  tbl_9E02_pos_Y(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00A111 02:A101: BD 02 9E  LDA tbl_9E02_pos_Y,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A114 02:A104: 85 85     STA ram_pos_Y_enemy 
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A116 02:A106: C8        INY
bra_A107:  ; orig: bra_A107:
    MOVE.B  D2,ram_042A  ; orig: C - - - - - 0x00A117 02:A107: 8C 2A 04  STY ram_042A
bra_A10A_RTS:  ; orig: bra_A10A_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A11A 02:A10A: 60        RTS



loc_A10B:  ; orig: loc_A10B:
    MOVE.B  ram_0420,D0  ; orig: C D 1 - - - 0x00A11B 02:A10B: AD 20 04  LDA ram_0420
    BNE     bra_A12E             ; BNE  ; orig: C - - - - - 0x00A11E 02:A10E: D0 1E     BNE bra_A12E
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A120 02:A110: A4 16     LDY ram_current_save
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x00A122 02:A112: C0 03     CPY #$03
    BEQ     bra_A10A_RTS             ; BEQ  ; orig: C - - - - - 0x00A124 02:A114: F0 F4     BEQ bra_A10A_RTS
    MOVE.B  tbl_9E0B(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A126 02:A116: B9 0B 9E  LDA tbl_9E0B,Y
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x00A129 02:A119: 8D 21 04  STA ram_0421
    MOVE.B  tbl_9E0E_offset(D2.L),D1  ; LDX abs,Y  ; orig: C - - - - - 0x00A12C 02:A11C: BE 0E 9E  LDX tbl_9E0E_offset,
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x00A12F 02:A11F: A0 02     LDY #$02
bra_A121_loop:  ; orig: bra_A121_loop:
    MOVE.B  tbl_9DDF(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00A131 02:A121: BD DF 9D  LDA tbl_9DDF,X
    MOVE.B  D0,ram_0422(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A134 02:A124: 99 22 04  STA ram_0422,Y
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00A137 02:A127: CA        DEX
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A138 02:A128: 88        DEY
    BPL     bra_A121_loop             ; BPL  ; orig: C - - - - - 0x00A139 02:A129: 10 F6     BPL bra_A121_loop
    ADDQ.B  #1,ram_0420  ; orig: C - - - - - 0x00A13B 02:A12B: EE 20 04  INC ram_0420
bra_A12E:  ; orig: bra_A12E:
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x00A13E 02:A12E: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_B + con_btn_A,D0  ; orig: C - - - - - 0x00A140 02:A130: 29 C0     AND #con_btn_B + con
    BEQ     bra_A18B             ; BEQ  ; orig: C - - - - - 0x00A142 02:A132: F0 57     BEQ bra_A18B
    CMPI.B  #con_btn_A,D0  ; orig: C - - - - - 0x00A144 02:A134: C9 80     CMP #con_btn_A
    BNE     bra_A15A             ; BNE  ; orig: C - - - - - 0x00A146 02:A136: D0 22     BNE bra_A15A
    MOVE.B  #con_sfx_4_plant_bomb,D2  ; orig: C - - - - - 0x00A148 02:A138: A0 20     LDY #con_sfx_4_plant
    MOVE.B  D2,ram_sfx_4  ; orig: C - - - - - 0x00A14A 02:A13A: 8C 04 06  STY ram_sfx_4
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x00A14D 02:A13D: A0 02     LDY #$02
bra_A13F_loop:  ; orig: bra_A13F_loop:
    MOVE.B  ram_0422(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A14F 02:A13F: B9 22 04  LDA ram_0422,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A152 02:A142: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A155 02:A145: 88        DEY
    BPL     bra_A13F_loop             ; BPL  ; orig: C - - - - - 0x00A156 02:A146: 10 F7     BPL bra_A13F_loop
    MOVE.B  D2,ram_0302_ppu_buffer+4  ; orig: C - - - - - 0x00A158 02:A148: 8C 06 03  STY ram_0302_ppu_buf
    MOVE.B  ram_0421,D1  ; orig: C - - - - - 0x00A15B 02:A14B: AE 21 04  LDX ram_0421
    MOVE.B  ram_041F,D2  ; orig: C - - - - - 0x00A15E 02:A14E: AC 1F 04  LDY ram_041F
    MOVE.B  tbl_9DB3(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A161 02:A151: B9 B3 9D  LDA tbl_9DB3,Y
    MOVE.B  D0,ram_0302_ppu_buffer+3  ; orig: C - - - - - 0x00A164 02:A154: 8D 05 03  STA ram_0302_ppu_buf
    MOVE.B  D0,ram_slot_name(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00A167 02:A157: 9D 38 06  STA ram_slot_name,X
bra_A15A:  ; orig: bra_A15A:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x00A16A 02:A15A: A5 70     LDA ram_pos_X_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A16C 02:A15C: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A16D 02:A15D: 69 08     ADC #$08
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x00A16F 02:A15F: 85 70     STA ram_pos_X_link
    ADDQ.B  #1,ram_0421  ; orig: C - - - - - 0x00A171 02:A161: EE 21 04  INC ram_0421
    ADDQ.B  #1,ram_0423  ; orig: C - - - - - 0x00A174 02:A164: EE 23 04  INC ram_0423
    MOVE.B  ram_0423,D0  ; orig: C - - - - - 0x00A177 02:A167: AD 23 04  LDA ram_0423
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x00A17A 02:A16A: 29 0F     AND #$0F
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x00A17C 02:A16C: C9 06     CMP #$06
    BNE     bra_A18B             ; BNE  ; orig: C - - - - - 0x00A17E 02:A16E: D0 1B     BNE bra_A18B
    MOVE.B  ram_0423,D0  ; orig: C - - - - - 0x00A180 02:A170: AD 23 04  LDA ram_0423
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A183 02:A173: 38        SEC
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x00A184 02:A174: E9 08     SBC #$08
    MOVE.B  D0,ram_0423  ; orig: C - - - - - 0x00A186 02:A176: 8D 23 04  STA ram_0423
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A189 02:A179: A4 16     LDY ram_current_save
    MOVE.B  tbl_9E0B(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A18B 02:A17B: B9 0B 9E  LDA tbl_9E0B,Y
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x00A18E 02:A17E: 8D 21 04  STA ram_0421
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x00A191 02:A181: A5 70     LDA ram_pos_X_link
    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x00A193 02:A183: C9 B0     CMP #$B0
    BNE     bra_A18B             ; BNE  ; orig: C - - - - - 0x00A195 02:A185: D0 04     BNE bra_A18B
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x00A197 02:A187: A9 70     LDA #$70
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x00A199 02:A189: 85 70     STA ram_pos_X_link
bra_A18B:  ; orig: bra_A18B:
    JMP     loc_A1D7  ; orig: C - - - - - 0x00A19B 02:A18B: 4C D7 A1  JMP loc_A1D7



sub_A18E:  ; orig: sub_A18E:
    MOVE.B  #$0A,D2  ; orig: C - - - - - 0x00A19E 02:A18E: A0 0A     LDY #$0A
bra_A190_loop:  ; orig: bra_A190_loop:
    MOVE.B  tbl_9DF7_spr_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A1A0 02:A190: B9 F7 9D  LDA tbl_9DF7_spr_dat
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A1A3 02:A193: 99 01 02  STA ram_spr_T,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A1A6 02:A196: 88        DEY
    BPL     bra_A190_loop             ; BPL  ; orig: C - - - - - 0x00A1A7 02:A197: 10 F7     BPL bra_A190_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A1A9 02:A199: A4 16     LDY ram_current_save
    MOVE.B  tbl_9DAF_pos_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A1AB 02:A19B: B9 AF 9D  LDA tbl_9DAF_pos_Y,Y
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x00A1AE 02:A19E: 85 84     STA ram_pos_Y_link
    MOVE.B  D0,ram_spr_Y  ; orig: C - - - - - 0x00A1B0 02:A1A0: 8D 00 02  STA ram_spr_Y
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x00A1B3 02:A1A3: A5 12     LDA ram_script
    CMPI.B  #con_script_elimination,D0  ; orig: C - - - - - 0x00A1B5 02:A1A5: C9 0F     CMP #con_script_elim
    BEQ     bra_A1C2_RTS             ; BEQ  ; orig: C - - - - - 0x00A1B7 02:A1A7: F0 19     BEQ bra_A1C2_RTS
    MOVE.B  #$F3,D0  ; orig: C - - - - - 0x00A1B9 02:A1A9: A9 F3     LDA #$F3
    MOVE.B  D0,ram_spr_T  ; orig: C - - - - - 0x00A1BB 02:A1AB: 8D 01 02  STA ram_spr_T
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00A1BE 02:A1AE: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A1C0 02:A1B0: 38        SEC
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x00A1C1 02:A1B1: E9 08     SBC #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1C3 02:A1B3: 8D 04 02  STA ram_spr_Y + $04
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x00A1C6 02:A1B6: A9 70     LDA #$70
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x00A1C8 02:A1B8: 85 70     STA ram_pos_X_link
    MOVE.B  #$87,D0  ; orig: C - - - - - 0x00A1CA 02:A1BA: A9 87     LDA #$87
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1CC 02:A1BC: 85 85     STA ram_pos_Y_enemy 
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x00A1CE 02:A1BE: A9 30     LDA #$30
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1D0 02:A1C0: 85 71     STA ram_pos_X_enemy 
bra_A1C2_RTS:  ; orig: bra_A1C2_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A1D2 02:A1C2: 60        RTS



sub_A1C3:  ; orig: sub_A1C3:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00A1D3 02:A1C3: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$77,D0  ; orig: C - - - - - 0x00A1D5 02:A1C5: C9 77     CMP #$77
    BNE     bra_A1CF             ; BNE  ; orig: C - - - - - 0x00A1D7 02:A1C7: D0 06     BNE bra_A1CF
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x00A1D9 02:A1C9: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1DB 02:A1CB: 8D 04 02  STA ram_spr_Y + $04
    RTS                     ; RTS  ; orig: C - - - - - 0x00A1DE 02:A1CE: 60        RTS
bra_A1CF:  ; orig: bra_A1CF:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00A1DF 02:A1CF: A5 84     LDA ram_pos_Y_link
    BSR     sub_A1F7             ; JSR -> BSR  ; orig: C - - - - - 0x00A1E1 02:A1D1: 20 F7 A1  JSR sub_A1F7
    ; (empty translation for STY)  ; orig: C - - - - - 0x00A1E4 02:A1D4: 8C 04 02  STY ram_spr_Y + $04
loc_A1D7:  ; orig: loc_A1D7:
    MOVE.B  ram_pos_X_link,D0  ; orig: C D 1 - - - 0x00A1E7 02:A1D7: A5 70     LDA ram_pos_X_link
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1E9 02:A1D9: 8D 07 02  STA ram_spr_X + $04
    RTS                     ; RTS  ; orig: C - - - - - 0x00A1EC 02:A1DC: 60        RTS



sub_A1DD:  ; orig: sub_A1DD:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00A1ED 02:A1DD: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$77,D0  ; orig: C - - - - - 0x00A1EF 02:A1DF: C9 77     CMP #$77
    BNE     bra_A1E9             ; BNE  ; orig: C - - - - - 0x00A1F1 02:A1E1: D0 06     BNE bra_A1E9
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x00A1F3 02:A1E3: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A1F5 02:A1E5: 8D 08 02  STA ram_spr_Y + $08
    RTS                     ; RTS  ; orig: C - - - - - 0x00A1F8 02:A1E8: 60        RTS
bra_A1E9:  ; orig: bra_A1E9:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A1F9 02:A1E9: A5 85     LDA ram_pos_Y_enemy 
    BSR     sub_A1F7             ; JSR -> BSR  ; orig: C - - - - - 0x00A1FB 02:A1EB: 20 F7 A1  JSR sub_A1F7
    ; (empty translation for STY)  ; orig: C - - - - - 0x00A1FE 02:A1EE: 8C 08 02  STY ram_spr_Y + $08
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A201 02:A1F1: A5 71     LDA ram_pos_X_enemy 
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A203 02:A1F3: 8D 0B 02  STA ram_spr_X + $08
    RTS                     ; RTS  ; orig: C - - - - - 0x00A206 02:A1F6: 60        RTS



sub_A1F7:  ; orig: sub_A1F7:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A207 02:A1F7: 38        SEC
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x00A208 02:A1F8: E9 08     SBC #$08
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A20A 02:A1FA: A8        TAY
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x00A20B 02:A1FB: A5 15     LDA ram_frm_cnt
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x00A20D 02:A1FD: 29 08     AND #$08
    BNE     bra_A203_RTS             ; BNE  ; orig: C - - - - - 0x00A20F 02:A1FF: D0 02     BNE bra_A203_RTS
    MOVE.B  #$F8,D2  ; orig: C - - - - - 0x00A211 02:A201: A0 F8     LDY #$F8
bra_A203_RTS:  ; orig: bra_A203_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A213 02:A203: 60        RTS



sub_A204:  ; orig: sub_A204:
loc_A204:  ; orig: loc_A204:
    MOVE.B  ram_btn_press,D0  ; orig: C D 1 - - - 0x00A214 02:A204: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Select,D0  ; orig: C - - - - - 0x00A216 02:A206: 29 20     AND #con_btn_Select
    BEQ     bra_A253_RTS             ; BEQ  ; orig: C - - - - - 0x00A218 02:A208: F0 49     BEQ bra_A253_RTS
bra_A20A_loop:  ; orig: bra_A20A_loop:
    MOVE.B  #con_sfx_2_cursor_select,D0  ; orig: C - - - - - 0x00A21A 02:A20A: A9 01     LDA #con_sfx_2_curso
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x00A21C 02:A20C: 8D 02 06  STA ram_sfx_2
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x00A21F 02:A20F: E6 16     INC ram_current_save
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A221 02:A211: A4 16     LDY ram_current_save
    CMPI.B  #$04,D2  ; orig: C - - - - - 0x00A223 02:A213: C0 04     CPY #$04
    BNE     bra_A21B             ; BNE  ; orig: C - - - - - 0x00A225 02:A215: D0 04     BNE bra_A21B
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A227 02:A217: A0 00     LDY #$00
    MOVE.B  D2,ram_current_save_slot  ; orig: C - - - - - 0x00A229 02:A219: 84 16     STY ram_current_save
bra_A21B:  ; orig: bra_A21B:
    MOVE.B  tbl_9DAF_pos_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A22B 02:A21B: B9 AF 9D  LDA tbl_9DAF_pos_Y,Y
    MOVE.B  D0,ram_spr_Y  ; orig: C - - - - - 0x00A22E 02:A21E: 8D 00 02  STA ram_spr_Y
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x00A231 02:A221: A5 12     LDA ram_script
    CMPI.B  #con_script_elimination,D0  ; orig: C - - - - - 0x00A233 02:A223: C9 0F     CMP #con_script_elim
    BEQ     bra_A253_RTS             ; BEQ  ; orig: C - - - - - 0x00A235 02:A225: F0 2C     BEQ bra_A253_RTS
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00A237 02:A227: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A239 02:A229: 18        CLC
    ADDX.B  #$18,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A23A 02:A22A: 69 18     ADC #$18
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x00A23C 02:A22C: 85 84     STA ram_pos_Y_link
    CMPI.B  #$8F,D0  ; orig: C - - - - - 0x00A23E 02:A22E: C9 8F     CMP #$8F
    BNE     bra_A236             ; BNE  ; orig: C - - - - - 0x00A240 02:A230: D0 04     BNE bra_A236
    MOVE.B  #$2F,D0  ; orig: C - - - - - 0x00A242 02:A232: A9 2F     LDA #$2F
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x00A244 02:A234: 85 84     STA ram_pos_Y_link
bra_A236:  ; orig: bra_A236:
    MOVE.B  D0,ram_spr_Y  ; orig: C - - - - - 0x00A246 02:A236: 8D 00 02  STA ram_spr_Y
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x00A249 02:A239: A9 70     LDA #$70
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A24B 02:A23B: 8D 07 02  STA ram_spr_X + $04
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x00A24E 02:A23E: 85 70     STA ram_pos_X_link
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A250 02:A240: A9 00     LDA #$00
    MOVE.B  D0,ram_0420  ; orig: C - - - - - 0x00A252 02:A242: 8D 20 04  STA ram_0420
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x00A255 02:A245: 8D 21 04  STA ram_0421
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A258 02:A248: A4 16     LDY ram_current_save
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x00A25A 02:A24A: C0 03     CPY #$03
    BEQ     bra_A253_RTS             ; BEQ  ; orig: C - - - - - 0x00A25C 02:A24C: F0 05     BEQ bra_A253_RTS
    MOVE.B  ram_slot_active_flag(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A25E 02:A24E: B9 33 06  LDA ram_slot_active_
    BNE     bra_A20A_loop             ; BNE  ; orig: C - - - - - 0x00A261 02:A251: D0 B7     BNE bra_A20A_loop
bra_A253_RTS:  ; orig: bra_A253_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A263 02:A253: 60        RTS



tbl_A254:  ; orig: tbl_A254:
    DC.B    $21,$09,$11,$24,$24,$24,$24,$24
    DC.B    $24,$24,$24,$62,$00,$00,$00,$00
    DC.B    $00,$00,$00,$00,$21,$32,$08,$00
    DC.B    $00,$00,$00,$00,$00,$00,$00,$FF



tbl_A274:  ; orig: tbl_A274:
    DC.B    $21,$89,$03,$24,$24,$01
    DC.B    $21,$E9,$03,$24,$24,$01
    DC.B    $22,$49,$03,$24,$24,$01,$FF
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x00A296 02:A286: FF        .byte $FF   ; end to



tbl_A287_tunic_color:  ; orig: tbl_A287_tunic_color:
    DC.B    $29,$32,$16



loc_0x00A29A:  ; orig: loc_0x00A29A:
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C D 1 - - - 0x00A29A 02:A28A: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x00A29D 02:A28D: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00A29F 02:A28F: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_009_A2A0_00
    DC.L    ofs_009_A47F_01
    DC.L    ofs_009_A4BD_02
    DC.L    ofs_009_A4C4_03
    DC.L    ofs_009_A4C4_04
    DC.L    ofs_009_A4C4_05
    DC.L    ofs_009_A51E_06



ofs_006_A2A0_01_prepare_slot_select_screen_1:  ; orig: ofs_006_A2A0_01_prepare_slot_select_screen_1:
ofs_009_A2A0_00:  ; orig: ofs_009_A2A0_00:
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - J - - 0x00A2B0 02:A2A0: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A2B3 02:A2A3: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x00A2B5 02:A2A5: 85 16     STA ram_current_save
bra_A2A7_loop:  ; orig: bra_A2A7_loop:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A2B7 02:A2A7: A4 16     LDY ram_current_save
    MOVE.B  ram_652A_slot(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A2B9 02:A2A9: B9 2A 65  LDA ram_652A_slot,Y
    BNE     bra_A2CD             ; BNE  ; orig: C - - - - - 0x00A2BC 02:A2AC: D0 1F     BNE bra_A2CD
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A2BE 02:A2AE: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A3E1             ; JSR -> BSR  ; orig: C - - - - - 0x00A2C1 02:A2B1: 20 E1 A3  JSR sub_A3E1
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A2C4 02:A2B4: A5 16     LDA ram_current_save
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A2C6 02:A2B6: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A2C7 02:A2B7: A8        TAY
    MOVE.B  ram_6D9C(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A2C8 02:A2B8: B9 9C 6D  LDA ram_6D9C,Y
    CMP.B   ram_00CE,D0  ; orig: C - - - - - 0x00A2CB 02:A2BB: C5 CE     CMP ram_00CE
    BNE     bra_A2CD             ; BNE  ; orig: C - - - - - 0x00A2CD 02:A2BD: D0 0E     BNE bra_A2CD
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A2CF 02:A2BF: C8        INY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A2D0 02:A2C0: B9 9C 6D  LDA ram_6D9D - $01,Y
    CMP.B   ram_00CF,D0  ; orig: C - - - - - 0x00A2D3 02:A2C3: C5 CF     CMP ram_00CF
    BNE     bra_A2CD             ; BNE  ; orig: C - - - - - 0x00A2D5 02:A2C5: D0 06     BNE bra_A2CD
    BSR     sub_A764             ; JSR -> BSR  ; orig: C - - - - - 0x00A2D7 02:A2C7: 20 64 A7  JSR sub_A764
    JMP     loc_A2FC  ; orig: C - - - - - 0x00A2DA 02:A2CA: 4C FC A2  JMP loc_A2FC
bra_A2CD:  ; orig: bra_A2CD:
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A2DD 02:A2CD: 20 F1 6D  JSR sub_bat_6FD1_pre
    BSR     sub_A307             ; JSR -> BSR  ; orig: C - - - - - 0x00A2E0 02:A2D0: 20 07 A3  JSR sub_A307
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A2E3 02:A2D3: A4 16     LDY ram_current_save
    MOVE.B  ram_slot_valid_1(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A2E5 02:A2D5: B9 1E 65  LDA ram_slot_valid_1
    CMPI.B  #$5A,D0  ; orig: C - - - - - 0x00A2E8 02:A2D8: C9 5A     CMP #$5A
    BNE     bra_A2F6             ; BNE  ; orig: C - - - - - 0x00A2EA 02:A2DA: D0 1A     BNE bra_A2F6
    MOVE.B  ram_slot_valid_2(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A2EC 02:A2DC: B9 21 65  LDA ram_slot_valid_2
    CMPI.B  #$A5,D0  ; orig: C - - - - - 0x00A2EF 02:A2DF: C9 A5     CMP #$A5
    BNE     bra_A2F6             ; BNE  ; orig: C - - - - - 0x00A2F1 02:A2E1: D0 13     BNE bra_A2F6
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A2F3 02:A2E3: A5 16     LDA ram_current_save
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A2F5 02:A2E5: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A2F6 02:A2E6: A8        TAY
    MOVE.B  ram_6524(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A2F7 02:A2E7: B9 24 65  LDA ram_6524,Y
    CMP.B   ram_000E_t01_hi,D0  ; orig: C - - - - - 0x00A2FA 02:A2EA: C5 0E     CMP ram_000E_t01_hi
    BNE     bra_A2F6             ; BNE  ; orig: C - - - - - 0x00A2FC 02:A2EC: D0 08     BNE bra_A2F6
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A2FE 02:A2EE: C8        INY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A2FF 02:A2EF: B9 24 65  LDA ram_6525 - $01,Y
    CMP.B   ram_000F_t02_lo,D0  ; orig: C - - - - - 0x00A302 02:A2F2: C5 0F     CMP ram_000F_t02_lo
    BEQ     bra_A2FC             ; BEQ  ; orig: C - - - - - 0x00A304 02:A2F4: F0 06     BEQ bra_A2FC
bra_A2F6:  ; orig: bra_A2F6:
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A306 02:A2F6: 20 F1 6D  JSR sub_bat_6FD1_pre
    BSR     sub_A35D             ; JSR -> BSR  ; orig: C - - - - - 0x00A309 02:A2F9: 20 5D A3  JSR sub_A35D
bra_A2FC:  ; orig: bra_A2FC:
loc_A2FC:  ; orig: loc_A2FC:
    ADDQ.B  #1,ram_current_save_slot  ; orig: C D 1 - - - 0x00A30C 02:A2FC: E6 16     INC ram_current_save
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A30E 02:A2FE: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x00A310 02:A300: C9 03     CMP #$03
    BNE     bra_A2A7_loop             ; BNE  ; orig: C - - - - - 0x00A312 02:A302: D0 A3     BNE bra_A2A7_loop
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A314 02:A304: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A316 02:A306: 60        RTS



sub_A307:  ; orig: sub_A307:

; in

; ram_0000_t19_data

; ram_0002_t03_data

; ram_0004_t02_slot_name_data

; ram_0006_t01_data

; ram_0008_t03_data
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A317 02:A307: A9 00     LDA #$00
    MOVE.B  D0,ram_000E_t01_hi  ; orig: C - - - - - 0x00A319 02:A309: 85 0E     STA ram_000E_t01_hi
    MOVE.B  D0,ram_000F_t02_lo  ; orig: C - - - - - 0x00A31B 02:A30B: 85 0F     STA ram_000F_t02_lo
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A31D 02:A30D: A0 07     LDY #$07
bra_A30F_loop:  ; orig: bra_A30F_loop:
    MOVEA.W ($FF0000+ram_0004_t02_slot_name_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A31F 02:A30F: B1 04     LDA (ram_0004_t02_sl
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A321 02:A311: 20 51 A3  JSR sub_A351
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A324 02:A314: 88        DEY
    BPL     bra_A30F_loop             ; BPL  ; orig: C - - - - - 0x00A325 02:A315: 10 F8     BPL bra_A30F_loop
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A327 02:A317: A0 27     LDY #$27
bra_A319_loop:  ; orig: bra_A319_loop:
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A329 02:A319: B1 00     LDA (ram_0000_t19_da
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A32B 02:A31B: 20 51 A3  JSR sub_A351
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A32E 02:A31E: 88        DEY
    BPL     bra_A319_loop             ; BPL  ; orig: C - - - - - 0x00A32F 02:A31F: 10 F8     BPL bra_A319_loop
    MOVE.B  #< $0180,D0  ; orig: C - - - - - 0x00A331 02:A321: A9 80     LDA #< $0180
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A333 02:A323: 85 01     STA ram_0000_t19_dat
    MOVE.B  #> $0180,D0  ; orig: C - - - - - 0x00A335 02:A325: A9 01     LDA #> $0180
    MOVE.B  D0,ram_0000_t19_data  ; orig: C - - - - - 0x00A337 02:A327: 85 00     STA ram_0000_t19_dat
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A339 02:A329: A0 00     LDY #$00
bra_A32B_loop:  ; orig: bra_A32B_loop:
    MOVEA.W ($FF0000+ram_0002_t03_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A33B 02:A32B: B1 02     LDA (ram_0002_t03_da
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A33D 02:A32D: 20 51 A3  JSR sub_A351
    ADDQ.B  #1,ram_0002_t03_data  ; orig: C - - - - - 0x00A340 02:A330: E6 02     INC ram_0002_t03_dat
    BNE     bra_A336_not_overflow             ; BNE  ; orig: C - - - - - 0x00A342 02:A332: D0 02     BNE bra_A336_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A344 02:A334: E6 03     INC ram_0002_t03_dat
bra_A336_not_overflow:  ; orig: bra_A336_not_overflow:
    ; (empty translation for DEC)  ; orig: C - - - - - 0x00A346 02:A336: C6 01     DEC ram_0000_t19_dat
    BNE     bra_A32B_loop             ; BNE  ; orig: C - - - - - 0x00A348 02:A338: D0 F1     BNE bra_A32B_loop
    SUBQ.B  #1,ram_0000_t19_data  ; orig: C - - - - - 0x00A34A 02:A33A: C6 00     DEC ram_0000_t19_dat
    MOVE.B  ram_0000_t19_data,D0  ; orig: C - - - - - 0x00A34C 02:A33C: A5 00     LDA ram_0000_t19_dat
    BPL     bra_A32B_loop             ; BPL  ; orig: C - - - - - 0x00A34E 02:A33E: 10 EB     BPL bra_A32B_loop
    MOVEA.W ($FF0000+ram_0006_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A350 02:A340: B1 06     LDA (ram_0006_t01_da
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A352 02:A342: 20 51 A3  JSR sub_A351
    MOVEA.W ($FF0000+ram_0008_t03_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A355 02:A345: B1 08     LDA (ram_0008_t03_da
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A357 02:A347: 20 51 A3  JSR sub_A351
    MOVEA.W ($FF0000+ram_000A_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A35A 02:A34A: B1 0A     LDA (ram_000A_t01_da
    BSR     sub_A351             ; JSR -> BSR  ; orig: C - - - - - 0x00A35C 02:A34C: 20 51 A3  JSR sub_A351
    MOVEA.W ($FF0000+ram_000C_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A35F 02:A34F: B1 0C     LDA (ram_000C_t01_da
sub_A351:  ; orig: sub_A351:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A361 02:A351: 18        CLC
    ADDX.B  ram_000F_t02_lo,D0  ; orig: C - - - - - 0x00A362 02:A352: 65 0F     ADC ram_000F_t02_lo
    MOVE.B  D0,ram_000F_t02_lo  ; orig: C - - - - - 0x00A364 02:A354: 85 0F     STA ram_000F_t02_lo

; bzk optimize, BCC + INC 000E
    MOVE.B  ram_000E_t01_hi,D0  ; orig: C - - - - - 0x00A366 02:A356: A5 0E     LDA ram_000E_t01_hi
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A368 02:A358: 69 00     ADC #$00
    MOVE.B  D0,ram_000E_t01_hi  ; orig: C - - - - - 0x00A36A 02:A35A: 85 0E     STA ram_000E_t01_hi
    RTS                     ; RTS  ; orig: C - - - - - 0x00A36C 02:A35C: 60        RTS



sub_A35D:  ; orig: sub_A35D:

; in

; ram_0000_t19_data

; ram_0002_t03_data

; ram_0004_t02_slot_name_data

; ram_0006_t01_data

; ram_0008_t03_data
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A36D 02:A35D: A0 07     LDY #$07
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00A36F 02:A35F: A9 24     LDA #$24
bra_A361_loop:  ; orig: bra_A361_loop:
    MOVEA.W ($FF0000+ram_0004_t02_slot_name_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A371 02:A361: 91 04     STA (ram_0004_t02_sl
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A373 02:A363: 88        DEY
    BPL     bra_A361_loop             ; BPL  ; orig: C - - - - - 0x00A374 02:A364: 10 FB     BPL bra_A361_loop
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A376 02:A366: A0 27     LDY #$27
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A378 02:A368: A9 00     LDA #$00
bra_A36A_loop:  ; orig: bra_A36A_loop:
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A37A 02:A36A: 91 00     STA (ram_0000_t19_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A37C 02:A36C: 88        DEY
    BPL     bra_A36A_loop             ; BPL  ; orig: C - - - - - 0x00A37D 02:A36D: 10 FB     BPL bra_A36A_loop
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x00A37F 02:A36F: A9 80     LDA #$80
    MOVE.B  D0,ram_0001_t11_counter_hi  ; orig: C - - - - - 0x00A381 02:A371: 85 01     STA ram_0001_t11_cou
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x00A383 02:A373: A9 01     LDA #$01
    MOVE.B  D0,ram_0000_t30_counter_lo  ; orig: C - - - - - 0x00A385 02:A375: 85 00     STA ram_0000_t30_cou
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A387 02:A377: A0 00     LDY #$00
bra_A379_loop:  ; orig: bra_A379_loop:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A389 02:A379: A9 00     LDA #$00
    MOVEA.W ($FF0000+ram_0002_t03_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A38B 02:A37B: 91 02     STA (ram_0002_t03_da
    ADDQ.B  #1,ram_0002_t03_data  ; orig: C - - - - - 0x00A38D 02:A37D: E6 02     INC ram_0002_t03_dat
    BNE     bra_A383_not_overflow             ; BNE  ; orig: C - - - - - 0x00A38F 02:A37F: D0 02     BNE bra_A383_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A391 02:A381: E6 03     INC ram_0002_t03_dat
bra_A383_not_overflow:  ; orig: bra_A383_not_overflow:
    SUBQ.B  #1,ram_0001_t11_counter_hi  ; orig: C - - - - - 0x00A393 02:A383: C6 01     DEC ram_0001_t11_cou
    BNE     bra_A379_loop             ; BNE  ; orig: C - - - - - 0x00A395 02:A385: D0 F2     BNE bra_A379_loop
    SUBQ.B  #1,ram_0000_t30_counter_lo  ; orig: C - - - - - 0x00A397 02:A387: C6 00     DEC ram_0000_t30_cou

; bzk optimize, DEC updates N flag, no need for LDA
    MOVE.B  ram_0000_t30_counter_lo,D0  ; orig: C - - - - - 0x00A399 02:A389: A5 00     LDA ram_0000_t30_cou
    BPL     bra_A379_loop             ; BPL  ; orig: C - - - - - 0x00A39B 02:A38B: 10 EC     BPL bra_A379_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A39D 02:A38D: A9 00     LDA #$00
    MOVEA.W ($FF0000+ram_0006_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A39F 02:A38F: 91 06     STA (ram_0006_t01_da
    MOVEA.W ($FF0000+ram_0008_t03_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A3A1 02:A391: 91 08     STA (ram_0008_t03_da
    MOVEA.W ($FF0000+ram_000A_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A3A3 02:A393: 91 0A     STA (ram_000A_t01_da
    MOVEA.W ($FF0000+ram_000C_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A3A5 02:A395: 91 0C     STA (ram_000C_t01_da
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A3A7 02:A397: 20 F1 6D  JSR sub_bat_6FD1_pre
    BSR     sub_A307             ; JSR -> BSR  ; orig: C - - - - - 0x00A3AA 02:A39A: 20 07 A3  JSR sub_A307
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A3AD 02:A39D: A4 16     LDY ram_current_save
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A3AF 02:A39F: A9 00     LDA #$00
    MOVE.B  D0,ram_slot_active_flag(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3B1 02:A3A1: 99 33 06  STA ram_slot_active_
    MOVE.B  D0,ram_current_quest(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3B4 02:A3A4: 99 2D 06  STA ram_current_ques
    MOVE.B  D0,ram_death_cnt(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3B7 02:A3A7: 99 30 06  STA ram_death_cnt,Y
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00A3BA 02:A3AA: A9 FF     LDA #$FF
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3BC 02:A3AC: 99 2A 65  STA ram_652A_slot,Y
    MOVE.B  #$5A,D0  ; orig: C - - - - - 0x00A3BF 02:A3AF: A9 5A     LDA #$5A
    MOVE.B  D0,ram_slot_valid_1(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3C1 02:A3B1: 99 1E 65  STA ram_slot_valid_1
    MOVE.B  #$A5,D0  ; orig: C - - - - - 0x00A3C4 02:A3B4: A9 A5     LDA #$A5
    MOVE.B  D0,ram_slot_valid_2(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3C6 02:A3B6: 99 21 65  STA ram_slot_valid_2
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00A3C9 02:A3B9: 98        TYA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A3CA 02:A3BA: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A3CB 02:A3BB: A8        TAY
    MOVE.B  ram_000E_t01_hi,D0  ; orig: C - - - - - 0x00A3CC 02:A3BC: A5 0E     LDA ram_000E_t01_hi
    MOVE.B  D0,ram_6524(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3CE 02:A3BE: 99 24 65  STA ram_6524,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A3D1 02:A3C1: C8        INY
    MOVE.B  ram_000F_t02_lo,D0  ; orig: C - - - - - 0x00A3D2 02:A3C2: A5 0F     LDA ram_000F_t02_lo
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A3D4 02:A3C4: 99 24 65  STA ram_6525 - $01,Y
    RTS                     ; RTS  ; orig: C - - - - - 0x00A3D7 02:A3C7: 60        RTS



sub_A3C8:  ; orig: sub_A3C8:
    BSR     sub_A3E1             ; JSR -> BSR  ; orig: C - - - - - 0x00A3D8 02:A3C8: 20 E1 A3  JSR sub_A3E1
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A3DB 02:A3CB: A4 16     LDY ram_current_save
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A3DD 02:A3CD: A9 00     LDA #$00
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3DF 02:A3CF: 99 2A 65  STA ram_652A_slot,Y
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00A3E2 02:A3D2: 98        TYA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A3E3 02:A3D3: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A3E4 02:A3D4: A8        TAY
    MOVE.B  ram_00CE,D0  ; orig: C - - - - - 0x00A3E5 02:A3D5: A5 CE     LDA ram_00CE
    MOVE.B  D0,ram_6D9C(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A3E7 02:A3D7: 99 9C 6D  STA ram_6D9C,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A3EA 02:A3DA: C8        INY
    MOVE.B  ram_00CF,D0  ; orig: C - - - - - 0x00A3EB 02:A3DB: A5 CF     LDA ram_00CF
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A3ED 02:A3DD: 99 9C 6D  STA ram_6D9D - $01,Y
    RTS                     ; RTS  ; orig: C - - - - - 0x00A3F0 02:A3E0: 60        RTS



sub_A3E1:  ; orig: sub_A3E1:

; in

; ram_00C0_t01_data

; ram_00C2_t01_data

; ram_00C4_t01_data

; ram_00C6_t01_data

; ram_00C8_t01_data

; ram_00CA_t01_data

; ram_00CC_t01_data
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A3F1 02:A3E1: A9 00     LDA #$00
    MOVE.B  D0,ram_00CE  ; orig: C - - - - - 0x00A3F3 02:A3E3: 85 CE     STA ram_00CE
    MOVE.B  D0,ram_00CF  ; orig: C - - - - - 0x00A3F5 02:A3E5: 85 CF     STA ram_00CF
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A3F7 02:A3E7: A0 07     LDY #$07
bra_A3E9_loop:  ; orig: bra_A3E9_loop:
    MOVEA.W ($FF0000+ram_00C4_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A3F9 02:A3E9: B1 C4     LDA (ram_00C4_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A3FB 02:A3EB: 20 2B A4  JSR sub_A42B_add_to_
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A3FE 02:A3EE: 88        DEY
    BPL     bra_A3E9_loop             ; BPL  ; orig: C - - - - - 0x00A3FF 02:A3EF: 10 F8     BPL bra_A3E9_loop
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A401 02:A3F1: A0 27     LDY #$27
bra_A3F3_loop:  ; orig: bra_A3F3_loop:
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A403 02:A3F3: B1 C0     LDA (ram_00C0_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A405 02:A3F5: 20 2B A4  JSR sub_A42B_add_to_
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A408 02:A3F8: 88        DEY
    BPL     bra_A3F3_loop             ; BPL  ; orig: C - - - - - 0x00A409 02:A3F9: 10 F8     BPL bra_A3F3_loop
    MOVE.B  #< $0180,D0  ; orig: C - - - - - 0x00A40B 02:A3FB: A9 80     LDA #< $0180
    MOVE.B  D0,ram_00C1_t01_counter_hi  ; orig: C - - - - - 0x00A40D 02:A3FD: 85 C1     STA ram_00C1_t01_cou
    MOVE.B  #> $0180,D0  ; orig: C - - - - - 0x00A40F 02:A3FF: A9 01     LDA #> $0180
    MOVE.B  D0,ram_00C0_t02_counter_lo  ; orig: C - - - - - 0x00A411 02:A401: 85 C0     STA ram_00C0_t02_cou
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A413 02:A403: A0 00     LDY #$00
bra_A405_loop:  ; orig: bra_A405_loop:
    MOVEA.W ($FF0000+ram_00C2_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A415 02:A405: B1 C2     LDA (ram_00C2_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A417 02:A407: 20 2B A4  JSR sub_A42B_add_to_
    ADDQ.B  #1,ram_00C2_t01_data  ; orig: C - - - - - 0x00A41A 02:A40A: E6 C2     INC ram_00C2_t01_dat
    BNE     bra_A410_not_overflow             ; BNE  ; orig: C - - - - - 0x00A41C 02:A40C: D0 02     BNE bra_A410_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A41E 02:A40E: E6 C3     INC ram_00C2_t01_dat
bra_A410_not_overflow:  ; orig: bra_A410_not_overflow:
    SUBQ.B  #1,ram_00C1_t01_counter_hi  ; orig: C - - - - - 0x00A420 02:A410: C6 C1     DEC ram_00C1_t01_cou
    BNE     bra_A405_loop             ; BNE  ; orig: C - - - - - 0x00A422 02:A412: D0 F1     BNE bra_A405_loop
    SUBQ.B  #1,ram_00C0_t02_counter_lo  ; orig: C - - - - - 0x00A424 02:A414: C6 C0     DEC ram_00C0_t02_cou

; bzk optimize, DEC updates N flag, no need for LDA
    MOVE.B  ram_00C0_t02_counter_lo,D0  ; orig: C - - - - - 0x00A426 02:A416: A5 C0     LDA ram_00C0_t02_cou
    BPL     bra_A405_loop             ; BPL  ; orig: C - - - - - 0x00A428 02:A418: 10 EB     BPL bra_A405_loop
    MOVEA.W ($FF0000+ram_00C6_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A42A 02:A41A: B1 C6     LDA (ram_00C6_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A42C 02:A41C: 20 2B A4  JSR sub_A42B_add_to_
    MOVEA.W ($FF0000+ram_00C8_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A42F 02:A41F: B1 C8     LDA (ram_00C8_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A431 02:A421: 20 2B A4  JSR sub_A42B_add_to_
    MOVEA.W ($FF0000+ram_00CA_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A434 02:A424: B1 CA     LDA (ram_00CA_t01_da
    BSR     sub_A42B_add_to_00CE             ; JSR -> BSR  ; orig: C - - - - - 0x00A436 02:A426: 20 2B A4  JSR sub_A42B_add_to_
    MOVEA.W ($FF0000+ram_00CC_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A439 02:A429: B1 CC     LDA (ram_00CC_t01_da
sub_A42B_add_to_00CE:  ; orig: sub_A42B_add_to_00CE:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A43B 02:A42B: 18        CLC
    ADDX.B  ram_00CF,D0  ; orig: C - - - - - 0x00A43C 02:A42C: 65 CF     ADC ram_00CF
    MOVE.B  D0,ram_00CF  ; orig: C - - - - - 0x00A43E 02:A42E: 85 CF     STA ram_00CF
    MOVE.B  ram_00CE,D0  ; orig: C - - - - - 0x00A440 02:A430: A5 CE     LDA ram_00CE
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A442 02:A432: 69 00     ADC #$00
    MOVE.B  D0,ram_00CE  ; orig: C - - - - - 0x00A444 02:A434: 85 CE     STA ram_00CE
    RTS                     ; RTS  ; orig: C - - - - - 0x00A446 02:A436: 60        RTS



sub_A437:  ; orig: sub_A437:

; in

; ram_00C0_t01_data

; ram_00C2_t01_data

; ram_00C4_t01_data

; ram_00C6_t01_data

; ram_00C8_t01_data

; ram_00CA_t01_data

; ram_00CC_t01_data
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A447 02:A437: A0 07     LDY #$07
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00A449 02:A439: A9 24     LDA #$24
bra_A43B_loop:  ; orig: bra_A43B_loop:
    MOVEA.W ($FF0000+ram_00C4_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A44B 02:A43B: 91 C4     STA (ram_00C4_t01_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A44D 02:A43D: 88        DEY
    BPL     bra_A43B_loop             ; BPL  ; orig: C - - - - - 0x00A44E 02:A43E: 10 FB     BPL bra_A43B_loop
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A450 02:A440: A0 27     LDY #$27
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A452 02:A442: A9 00     LDA #$00
bra_A444_loop:  ; orig: bra_A444_loop:
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A454 02:A444: 91 C0     STA (ram_00C0_t01_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A456 02:A446: 88        DEY
    BPL     bra_A444_loop             ; BPL  ; orig: C - - - - - 0x00A457 02:A447: 10 FB     BPL bra_A444_loop
    MOVE.B  #< $0180,D0  ; orig: C - - - - - 0x00A459 02:A449: A9 80     LDA #< $0180
    MOVE.B  D0,ram_00C1_t02_counter_hi  ; orig: C - - - - - 0x00A45B 02:A44B: 85 C1     STA ram_00C1_t02_cou
    MOVE.B  #> $0180,D0  ; orig: C - - - - - 0x00A45D 02:A44D: A9 01     LDA #> $0180
    MOVE.B  D0,ram_00C0_t03_counter_lo  ; orig: C - - - - - 0x00A45F 02:A44F: 85 C0     STA ram_00C0_t03_cou
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A461 02:A451: A0 00     LDY #$00
bra_A453_loop:  ; orig: bra_A453_loop:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A463 02:A453: A9 00     LDA #$00
    MOVEA.W ($FF0000+ram_00C2_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A465 02:A455: 91 C2     STA (ram_00C2_t01_da
    ADDQ.B  #1,ram_00C2_t01_data  ; orig: C - - - - - 0x00A467 02:A457: E6 C2     INC ram_00C2_t01_dat
    BNE     bra_A45D_not_overflow             ; BNE  ; orig: C - - - - - 0x00A469 02:A459: D0 02     BNE bra_A45D_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A46B 02:A45B: E6 C3     INC ram_00C2_t01_dat
bra_A45D_not_overflow:  ; orig: bra_A45D_not_overflow:
    SUBQ.B  #1,ram_00C1_t02_counter_hi  ; orig: C - - - - - 0x00A46D 02:A45D: C6 C1     DEC ram_00C1_t02_cou
    BNE     bra_A453_loop             ; BNE  ; orig: C - - - - - 0x00A46F 02:A45F: D0 F2     BNE bra_A453_loop
    SUBQ.B  #1,ram_00C0_t03_counter_lo  ; orig: C - - - - - 0x00A471 02:A461: C6 C0     DEC ram_00C0_t03_cou

; bzk optimize, DEC updates N flag, no need for LDA
    MOVE.B  ram_00C0_t03_counter_lo,D0  ; orig: C - - - - - 0x00A473 02:A463: A5 C0     LDA ram_00C0_t03_cou
    BPL     bra_A453_loop             ; BPL  ; orig: C - - - - - 0x00A475 02:A465: 10 EC     BPL bra_A453_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A477 02:A467: A9 00     LDA #$00
    MOVEA.W ($FF0000+ram_00C6_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A479 02:A469: 91 C6     STA (ram_00C6_t01_da
    MOVEA.W ($FF0000+ram_00C8_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A47B 02:A46B: 91 C8     STA (ram_00C8_t01_da
    MOVEA.W ($FF0000+ram_00CA_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A47D 02:A46D: 91 CA     STA (ram_00CA_t01_da
    MOVEA.W ($FF0000+ram_00CC_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A47F 02:A46F: 91 CC     STA (ram_00CC_t01_da
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A481 02:A471: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A3E1             ; JSR -> BSR  ; orig: C - - - - - 0x00A484 02:A474: 20 E1 A3  JSR sub_A3E1
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00A487 02:A477: A9 FF     LDA #$FF
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A489 02:A479: A4 16     LDY ram_current_save
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A48B 02:A47B: 99 2A 65  STA ram_652A_slot,Y
    RTS                     ; RTS  ; orig: C - - - - - 0x00A48E 02:A47E: 60        RTS



ofs_009_A47F_01:  ; orig: ofs_009_A47F_01:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x00A48F 02:A47F: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x00A491 02:A481: 85 16     STA ram_current_save
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A493 02:A483: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  #$0B,D2  ; orig: C - - - - - 0x00A496 02:A486: A0 0B     LDY #$0B
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00A498 02:A488: A2 00     LDX #$00
bra_A48A_loop:  ; orig: bra_A48A_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00A49A 02:A48A: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A49B 02:A48B: 48        PHA
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A49C 02:A48C: B1 00     LDA (ram_0000_t19_da
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A49E 02:A48E: A8        TAY
    MOVE.B  tbl_A287_tunic_color(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A49F 02:A48F: B9 87 A2  LDA tbl_A287_tunic_c
    MOVE.B  D0,ram_6804_tunic_color(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00A4A2 02:A492: 9D 04 68  STA ram_6804_tunic_c
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A4A5 02:A495: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A4A6 02:A496: 18        CLC
    ADDX.B  #$28,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A4A7 02:A497: 69 28     ADC #$28
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A4A9 02:A499: A8        TAY
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x00A4AA 02:A49A: 8A        TXA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A4AB 02:A49B: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A4AC 02:A49C: 69 04     ADC #$04
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00A4AE 02:A49E: AA        TAX
    CMPI.B  #$0C,D1  ; orig: C - - - - - 0x00A4AF 02:A49F: E0 0C     CPX #$0C
    BCC     bra_A48A_loop             ; BCC  ; orig: C - - - - - 0x00A4B1 02:A4A1: 90 E7     BCC bra_A48A_loop
    BSR     sub_bat_6DB7_clear_special_metatile_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A4B3 02:A4A3: 20 B7 6D  JSR sub_bat_6DB7_cle
    MOVE.B  #con_ppu_buf_12,D0  ; orig: C - - - - - 0x00A4B6 02:A4A6: A9 12     LDA #con_ppu_buf_12
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00A4B8 02:A4A8: 85 14     STA ram_ppu_load_ind
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A4BA 02:A4AA: E6 13     INC ram_subscript
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - - - - 0x00A4BC 02:A4AC: 20 6D E4  JSR sub_0x01E47D_cle
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x00A4BF 02:A4AF: A0 04     LDY #$04
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A4C1 02:A4B1: A9 00     LDA #$00
    MOVE.B  D0,ram_0529  ; orig: C - - - - - 0x00A4C3 02:A4B3: 8D 29 05  STA ram_0529
bra_A4B6_loop:  ; orig: bra_A4B6_loop:
    MOVE.B  D0,ram_room_history(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A4C6 02:A4B6: 99 21 06  STA ram_room_history
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A4C9 02:A4B9: 88        DEY
    BPL     bra_A4B6_loop             ; BPL  ; orig: C - - - - - 0x00A4CA 02:A4BA: 10 FA     BPL bra_A4B6_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x00A4CC 02:A4BC: 60        RTS



ofs_009_A4BD_02:  ; orig: ofs_009_A4BD_02:
    MOVE.B  #con_ppu_buf_14,D0  ; orig: C - - J - - 0x00A4CD 02:A4BD: A9 14     LDA #con_ppu_buf_14
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00A4CF 02:A4BF: 85 14     STA ram_ppu_load_ind
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A4D1 02:A4C1: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A4D3 02:A4C3: 60        RTS



ofs_009_A4C4_03:  ; orig: ofs_009_A4C4_03:
ofs_009_A4C4_04:  ; orig: ofs_009_A4C4_04:
ofs_009_A4C4_05:  ; orig: ofs_009_A4C4_05:
    MOVE.B  #$1F,D2  ; orig: C - - J - - 0x00A4D4 02:A4C4: A0 1F     LDY #$1F
bra_A4C6_loop:  ; orig: bra_A4C6_loop:
    MOVE.B  tbl_A254(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A4D6 02:A4C6: B9 54 A2  LDA tbl_A254,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A4D9 02:A4C9: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A4DC 02:A4CC: 88        DEY
    BPL     bra_A4C6_loop             ; BPL  ; orig: C - - - - - 0x00A4DD 02:A4CD: 10 F7     BPL bra_A4C6_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A4DF 02:A4CF: A4 16     LDY ram_current_save
bra_A4D1_loop:  ; orig: bra_A4D1_loop:
    MOVEQ   #$00,D3
    MOVE.B  ram_0302_ppu_buffer+1,D3  ; orig: C - - - - - 0x00A4E1 02:A4D1: AD 03 03  LDA ram_0302_ppu_buf
    ADDI.W  #$0060,D3
    MOVE.B  D3,ram_0302_ppu_buffer+1  ; orig: C - - - - - 0x00A4E7 02:A4D7: 8D 03 03  STA ram_0302_ppu_buf
    MOVEQ   #$00,D5
    CMPI.W  #$0100,D3
    BCS     bra_A4DA_no_carry_1
    ADDQ.W  #1,D5
bra_A4DA_no_carry_1:
    MOVEQ   #$00,D4
    MOVE.B  ram_0302_ppu_buffer+$15,D4  ; orig: C - - - - - 0x00A4EA 02:A4DA: AD 17 03  LDA ram_0302_ppu_buf
    ADDI.W  #$0060,D4
    ADD.W   D5,D4
    MOVE.B  D4,ram_0302_ppu_buffer+$15  ; orig: C - - - - - 0x00A4F0 02:A4E0: 8D 17 03  STA ram_0302_ppu_buf
    MOVE.B  ram_0302_ppu_buffer,D0  ; orig: C - - - - - 0x00A4F3 02:A4E3: AD 02 03  LDA ram_0302_ppu_buf
    CMPI.W  #$0100,D4
    BCS     bra_A4E8_store_hi
    ADDQ.B  #1,D0
bra_A4E8_store_hi:
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x00A4F8 02:A4E8: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  D0,ram_0302_ppu_buffer+$14  ; orig: C - - - - - 0x00A4FB 02:A4EB: 8D 16 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A4FE 02:A4EE: 88        DEY
    BPL     bra_A4D1_loop             ; BPL  ; orig: C - - - - - 0x00A4FF 02:A4EF: 10 E0     BPL bra_A4D1_loop
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A501 02:A4F1: A5 16     LDA ram_current_save

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A503 02:A4F3: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A504 02:A4F4: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A505 02:A4F5: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00A506 02:A4F6: AA        TAX
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x00A507 02:A4F7: A0 03     LDY #$03
bra_A4F9_loop:  ; orig: bra_A4F9_loop:
    MOVE.B  ram_slot_name(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00A509 02:A4F9: BD 38 06  LDA ram_slot_name,X
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A50C 02:A4FC: 99 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00A50F 02:A4FF: E8        INX
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A510 02:A500: C8        INY
    CMPI.B  #$0B,D2  ; orig: C - - - - - 0x00A511 02:A501: C0 0B     CPY #$0B
    BNE     bra_A4F9_loop             ; BNE  ; orig: C - - - - - 0x00A513 02:A503: D0 F4     BNE bra_A4F9_loop
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A515 02:A505: A5 16     LDA ram_current_save
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A517 02:A507: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A518 02:A508: A8        TAY
    MOVE.B  ram_slot_hearts(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A519 02:A509: B9 50 06  LDA ram_slot_hearts,
    MOVE.B  D0,ram_000E_t02  ; orig: C - - - - - 0x00A51C 02:A50C: 85 0E     STA ram_000E_t02
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A51E 02:A50E: C8        INY
    MOVE.B  ram_slot_hearts(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A51F 02:A50F: B9 50 06  LDA ram_slot_hearts,
    MOVE.B  D0,ram_000F_t03  ; orig: C - - - - - 0x00A522 02:A512: 85 0F     STA ram_000F_t03
    MOVE.B  #$0C,D2  ; orig: C - - - - - 0x00A524 02:A514: A0 0C     LDY #$0C
    BSR     sub_bat_6E79             ; JSR -> BSR  ; orig: C - - - - - 0x00A526 02:A516: 20 79 6E  JSR sub_bat_6E79
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x00A529 02:A519: E6 16     INC ram_current_save
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A52B 02:A51B: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A52D 02:A51D: 60        RTS



ofs_009_A51E_06:  ; orig: ofs_009_A51E_06:
    MOVE.B  #$12,D2  ; orig: C - - J - - 0x00A52E 02:A51E: A0 12     LDY #$12
bra_A520_loop:  ; orig: bra_A520_loop:
    MOVE.B  tbl_A274(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A530 02:A520: B9 74 A2  LDA tbl_A274,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A533 02:A523: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A536 02:A526: 88        DEY
    BPL     bra_A520_loop             ; BPL  ; orig: C - - - - - 0x00A537 02:A527: 10 F7     BPL bra_A520_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A539 02:A529: A9 00     LDA #$00
    MOVE.B  D0,ram_000A_t03  ; orig: C - - - - - 0x00A53B 02:A52B: 85 0A     STA ram_000A_t03
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x00A53D 02:A52D: A9 03     LDA #$03
    MOVE.B  D0,ram_000B_t02  ; orig: C - - - - - 0x00A53F 02:A52F: 85 0B     STA ram_000B_t02
bra_A531_loop:  ; orig: bra_A531_loop:
    MOVE.B  ram_000A_t03,D2  ; orig: C - - - - - 0x00A541 02:A531: A4 0A     LDY ram_000A_t03
    MOVE.B  ram_death_cnt(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A543 02:A533: B9 30 06  LDA ram_death_cnt,Y
    BSR     sub_bat_6E55_convert_to_decimal             ; JSR -> BSR  ; orig: C - - - - - 0x00A546 02:A536: 20 55 6E  JSR sub_bat_6E55_con
    MOVE.B  ram_000B_t02,D1  ; orig: C - - - - - 0x00A549 02:A539: A6 0B     LDX ram_000B_t02
    MOVE.B  ram_0001_t04_decimal,D0  ; orig: C - - - - - 0x00A54B 02:A53B: A5 01     LDA ram_0001_t04_dec
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00A54D 02:A53D: 9D 02 03  STA ram_0302_ppu_buf
    MOVE.B  ram_0002_temp,D0  ; orig: C - - - - - 0x00A550 02:A540: A5 02     LDA ram_0001_t04_dec
    LEA     (ram_0302_ppu_buffer+1).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00A552 02:A542: 9D 03 03  STA ram_0302_ppu_buf
    MOVE.B  ram_0003_temp,D0  ; orig: C - - - - - 0x00A555 02:A545: A5 03     LDA ram_0001_t04_dec
    BNE     bra_A562             ; BNE  ; orig: C - - - - - 0x00A557 02:A547: D0 19     BNE bra_A562
    MOVE.B  ram_0001_t04_decimal,D0  ; orig: C - - - - - 0x00A559 02:A549: A5 01     LDA ram_0001_t04_dec
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x00A55B 02:A54B: C9 24     CMP #$24
    BNE     bra_A560             ; BNE  ; orig: C - - - - - 0x00A55D 02:A54D: D0 11     BNE bra_A560
    MOVE.B  ram_0002_temp,D0  ; orig: C - - - - - 0x00A55F 02:A54F: A5 02     LDA ram_0001_t04_dec
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x00A561 02:A551: C9 24     CMP #$24
    BNE     bra_A560             ; BNE  ; orig: C - - - - - 0x00A563 02:A553: D0 0B     BNE bra_A560
    MOVE.B  ram_000A_t03,D2  ; orig: C - - - - - 0x00A565 02:A555: A4 0A     LDY ram_000A_t03
    MOVE.B  ram_slot_active_flag(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A567 02:A557: B9 33 06  LDA ram_slot_active_
    BNE     bra_A560             ; BNE  ; orig: C - - - - - 0x00A56A 02:A55A: D0 04     BNE bra_A560
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00A56C 02:A55C: A9 24     LDA #$24
    BNE     bra_A562             ; BNE  ; orig: C - - - - - 0x00A56E 02:A55E: D0 02     BNE bra_A562    ; jm
bra_A560:  ; orig: bra_A560:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A570 02:A560: A9 00     LDA #$00
bra_A562:  ; orig: bra_A562:
    LEA     (ram_0302_ppu_buffer+2).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00A572 02:A562: 9D 04 03  STA ram_0302_ppu_buf
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x00A575 02:A565: 8A        TXA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A576 02:A566: 18        CLC
    ADDX.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A577 02:A567: 69 06     ADC #$06
    MOVE.B  D0,ram_000B_t02  ; orig: C - - - - - 0x00A579 02:A569: 85 0B     STA ram_000B_t02
    ADDQ.B  #1,ram_000A_t03  ; orig: C - - - - - 0x00A57B 02:A56B: E6 0A     INC ram_000A_t03
    MOVE.B  ram_000A_t03,D0  ; orig: C - - - - - 0x00A57D 02:A56D: A5 0A     LDA ram_000A_t03
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x00A57F 02:A56F: C9 03     CMP #$03
    BNE     bra_A531_loop             ; BNE  ; orig: C - - - - - 0x00A581 02:A571: D0 BE     BNE bra_A531_loop
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x00A583 02:A573: A0 FF     LDY #$FF
    MOVE.B  D2,ram_current_save_slot  ; orig: C - - - - - 0x00A585 02:A575: 84 16     STY ram_current_save
    MOVE.B  D2,ram_0526  ; orig: C - - - - - 0x00A587 02:A577: 8C 26 05  STY ram_0526
bra_A57A_loop:  ; orig: bra_A57A_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A58A 02:A57A: C8        INY
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x00A58B 02:A57B: E6 16     INC ram_current_save
    MOVE.B  ram_slot_active_flag(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A58D 02:A57D: B9 33 06  LDA ram_slot_active_
    BEQ     bra_A57A_loop             ; BEQ  ; orig: C - - - - - 0x00A590 02:A580: F0 F8     BEQ bra_A57A_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A592 02:A582: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x00A594 02:A584: 85 13     STA ram_subscript
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x00A596 02:A586: E6 11     INC ram_0011_screen_
    RTS                     ; RTS  ; orig: C - - - - - 0x00A598 02:A588: 60        RTS



tbl_A589_cursor_spr_data:  ; orig: tbl_A589_cursor_spr_data:
    DC.B    $F3,$03,$28



tbl_A58C_cursor_spr_Y:  ; orig: tbl_A58C_cursor_spr_Y:
    DC.B    $5C,$74,$8C,$A8,$B8



ofs_main_script_2_0x00A5A1_01_slot_selection:  ; orig: ofs_main_script_2_0x00A5A1_01_slot_selection:

; con_script_slot_selection
    MOVE.W  #$0437,D0
    BSR     TRACE_MARK
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x00A5A1 02:A591: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00A5A3 02:A593: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_010_A59A_00
    DC.L    ofs_010_A5DF_01



ofs_010_A59A_00:  ; orig: ofs_010_A59A_00:
    MOVE.B  ram_btn_press,D0  ; orig: C - - J - - 0x00A5AA 02:A59A: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x00A5AC 02:A59C: 29 10     AND #con_btn_Start
    BNE     bra_A5DC             ; BNE  ; orig: C - - - - - 0x00A5AE 02:A59E: D0 3C     BNE bra_A5DC
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x00A5B0 02:A5A0: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Select,D0  ; orig: C - - - - - 0x00A5B2 02:A5A2: 29 20     AND #con_btn_Select
    BEQ     bra_A5B7             ; BEQ  ; orig: C - - - - - 0x00A5B4 02:A5A4: F0 11     BEQ bra_A5B7
bra_A5A6_loop:  ; orig: bra_A5A6_loop:
    MOVE.B  #con_sfx_2_cursor_select,D0  ; orig: C - - - - - 0x00A5B6 02:A5A6: A9 01     LDA #con_sfx_2_curso
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x00A5B8 02:A5A8: 8D 02 06  STA ram_sfx_2
    ADDQ.B  #1,ram_current_save_slot  ; orig: C - - - - - 0x00A5BB 02:A5AB: E6 16     INC ram_current_save
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A5BD 02:A5AD: A5 16     LDA ram_current_save
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x00A5BF 02:A5AF: C9 05     CMP #$05
    BNE     bra_A5B7             ; BNE  ; orig: C - - - - - 0x00A5C1 02:A5B1: D0 04     BNE bra_A5B7
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A5C3 02:A5B3: A9 00     LDA #$00
    MOVE.B  D0,ram_current_save_slot  ; orig: C - - - - - 0x00A5C5 02:A5B5: 85 16     STA ram_current_save
bra_A5B7:  ; orig: bra_A5B7:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A5C7 02:A5B7: A4 16     LDY ram_current_save
    MOVE.B  ram_slot_active_flag(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A5C9 02:A5B9: B9 33 06  LDA ram_slot_active_
    BEQ     bra_A5A6_loop             ; BEQ  ; orig: C - - - - - 0x00A5CC 02:A5BC: F0 E8     BEQ bra_A5A6_loop
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x00A5CE 02:A5BE: A0 02     LDY #$02
bra_A5C0_loop:  ; orig: bra_A5C0_loop:
    MOVE.B  tbl_A589_cursor_spr_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A5D0 02:A5C0: B9 89 A5  LDA tbl_A589_cursor_
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A5D3 02:A5C3: 99 01 02  STA ram_spr_T,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A5D6 02:A5C6: 88        DEY
    BPL     bra_A5C0_loop             ; BPL  ; orig: C - - - - - 0x00A5D7 02:A5C7: 10 F7     BPL bra_A5C0_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A5D9 02:A5C9: A4 16     LDY ram_current_save
    MOVE.B  tbl_A58C_cursor_spr_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A5DB 02:A5CB: B9 8C A5  LDA tbl_A58C_cursor_
    MOVE.B  D0,ram_spr_Y  ; orig: C - - - - - 0x00A5DE 02:A5CE: 8D 00 02  STA ram_spr_Y
    MOVE.B  #$58,D0  ; orig: C - - - - - 0x00A5E1 02:A5D1: A9 58     LDA #$58
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x00A5E3 02:A5D3: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x00A5E5 02:A5D5: A9 30     LDA #$30
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x00A5E7 02:A5D7: 85 00     STA ram_0000_t21_spr
    JMP     loc_A638  ; orig: C - - - - - 0x00A5E9 02:A5D9: 4C 38 A6  JMP loc_A638
bra_A5DC:  ; orig: bra_A5DC:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A5EC 02:A5DC: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A5EE 02:A5DE: 60        RTS



ofs_010_A5DF_01:  ; orig: ofs_010_A5DF_01:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x00A5EF 02:A5DF: A9 00     LDA #$00
    MOVE.B  D0,ram_0607_sfx_2  ; orig: C - - - - - 0x00A5F1 02:A5E1: 8D 07 06  STA ram_0607_sfx_2
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A5F4 02:A5E4: A9 00     LDA #$00   ; bzk opt
    MOVE.B  D0,ram_dungeon_level  ; orig: C - - - - - 0x00A5F6 02:A5E6: 85 10     STA ram_dungeon_leve
    MOVE.B  D0,ram_item_slot_index  ; orig: C - - - - - 0x00A5F8 02:A5E8: 8D 56 06  STA ram_item_slot_in
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x00A5FB 02:A5EB: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A5FE 02:A5EE: A5 16     LDA ram_current_save
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x00A600 02:A5F0: C9 03     CMP #$03
    BCC     bra_A5FE_cursor_at_some_slot             ; BCC  ; orig: C - - - - - 0x00A602 02:A5F2: 90 0A     BCC bra_A5FE_cursor_
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A604 02:A5F4: A5 16     LDA ram_current_save
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A606 02:A5F6: 18        CLC
    ADDX.B  #$0B,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A607 02:A5F7: 69 0B     ADC #$0B    ; con_sc
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x00A609 02:A5F9: 85 12     STA ram_script
    JMP     loc_0x01EBB3_clear_subscript  ; orig: C - - - - - 0x00A60B 02:A5FB: 4C A3 EB  JMP loc_0x01EBB3_cle
bra_A5FE_cursor_at_some_slot:  ; orig: bra_A5FE_cursor_at_some_slot:
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x00A60E 02:A5FE: 20 25 E6  JSR sub_0x01E635_dis
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A611 02:A601: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A614 02:A604: A0 27     LDY #$27
bra_A606_loop:
; items 0657-067E
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A616 02:A606: B1 00     LDA (ram_0000_t19_da
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A618 02:A608: 99 57 06  STA ram_items,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A61B 02:A60B: 88        DEY
    BPL     bra_A606_loop             ; BPL  ; orig: C - - - - - 0x00A61C 02:A60C: 10 F8     BPL bra_A606_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A61E 02:A60E: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_052E  ; orig: C - - - - - 0x00A620 02:A610: 8D 2E 05  STA ram_052E
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x00A623 02:A613: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_item_clock  ; orig: C - - - - - 0x00A625 02:A615: 8D 6C 06  STA ram_item_clock
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A628 02:A618: A8        TAY
bra_A619_loop:  ; orig: bra_A619_loop:

; up to 07FE
    MOVEA.W ($FF0000+ram_0002_t03_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A629 02:A619: B1 02     LDA (ram_0002_t03_da
    MOVEA.W ($FF0000+ram_000E_t04_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A62B 02:A61B: 91 0E     STA (ram_000E_t04_da
    ADDQ.B  #1,ram_0002_t03_data  ; orig: C - - - - - 0x00A62D 02:A61D: E6 02     INC ram_0002_t03_dat
    BNE     bra_A623_not_overflow             ; BNE  ; orig: C - - - - - 0x00A62F 02:A61F: D0 02     BNE bra_A623_not_ove
    ADDQ.B  #1,ram_0002_t03_data+1  ; orig: C - - - - - 0x00A631 02:A621: E6 03     INC ram_0002_t03_dat
bra_A623_not_overflow:  ; orig: bra_A623_not_overflow:
    ADDQ.B  #1,ram_000E_t04_data  ; orig: C - - - - - 0x00A633 02:A623: E6 0E     INC ram_000E_t04_dat
    BNE     bra_A629_not_overflow             ; BNE  ; orig: C - - - - - 0x00A635 02:A625: D0 02     BNE bra_A629_not_ove
    ADDQ.B  #1,ram_000E_t04_data+1  ; orig: C - - - - - 0x00A637 02:A627: E6 0F     INC ram_000E_t04_dat
bra_A629_not_overflow:  ; orig: bra_A629_not_overflow:
    MOVE.B  ram_000E_t04_data,D0  ; orig: C - - - - - 0x00A639 02:A629: A5 0E     LDA ram_000E_t04_dat
    CMPI.B  #< $07FF,D0  ; orig: C - - - - - 0x00A63B 02:A62B: C9 FF     CMP #< $07FF
    BNE     bra_A619_loop             ; BNE  ; orig: C - - - - - 0x00A63D 02:A62D: D0 EA     BNE bra_A619_loop
    MOVE.B  ram_000E_t04_data+1,D0  ; orig: C - - - - - 0x00A63F 02:A62F: A5 0F     LDA ram_000E_t04_dat
    CMPI.B  #> $07FF,D0  ; orig: C - - - - - 0x00A641 02:A631: C9 07     CMP #> $07FF
    BNE     bra_A619_loop             ; BNE  ; orig: C - - - - - 0x00A643 02:A633: D0 E4     BNE bra_A619_loop
    JMP     loc_0x01EBB1_prepare_next_script  ; orig: C - - - - - 0x00A645 02:A635: 4C A1 EB  JMP loc_0x01EBB1_pre



loc_A638:  ; orig: loc_A638:
    MOVE.B  #$08,D0  ; orig: C D 1 - - - 0x00A648 02:A638: A9 08     LDA #$08
    MOVE.B  D0,ram_0002_t45_spr_T  ; orig: C - - - - - 0x00A64A 02:A63A: 85 02     STA ram_0002_t45_spr
    MOVE.B  #$0A,D0  ; orig: C - - - - - 0x00A64C 02:A63C: A9 0A     LDA #$0A
    MOVE.B  D0,ram_0003_t16_spr_A  ; Fix X: second slot-select sprite temp byte ; orig: C - - - - - 0x00A64E 02:A63E: 85 03     STA ram_0002_t45_spr
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A650 02:A640: A9 00     LDA #$00
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x00A652 02:A642: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x00A655 02:A645: A9 08     LDA #$08
    MOVE.B  D0,ram_spr_index_1  ; orig: C - - - - - 0x00A657 02:A647: 8D 43 03  STA ram_spr_index_1
bra_A64A_loop:  ; orig: bra_A64A_loop:
    MOVE.B  ram_spr_index_1,D0  ; orig: C - - - - - 0x00A65A 02:A64A: AD 43 03  LDA ram_spr_index_1
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A65D 02:A64D: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A65E 02:A64E: 69 08     ADC #$08
    MOVE.B  D0,ram_spr_index_1  ; orig: C - - - - - 0x00A660 02:A650: 8D 43 03  STA ram_spr_index_1
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A663 02:A653: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A664 02:A654: 69 04     ADC #$04
    MOVE.B  D0,ram_spr_index_2  ; orig: C - - - - - 0x00A666 02:A656: 8D 44 03  STA ram_spr_index_2
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x00A669 02:A659: A9 01     LDA #$01
    MOVE.B  D0,ram_0007_t06_sprites_counter  ; orig: C - - - - - 0x00A66B 02:A65B: 85 07     STA ram_0007_t06_spr
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x00A66D 02:A65D: A9 08     LDA #$08
    MOVE.B  D0,ram_000A_t13_spr_X  ; orig: C - - - - - 0x00A66F 02:A65F: 85 0A     STA ram_000A_t13_spr
    MOVE.B  ram_0000_t21_spr_X,D0  ; orig: C - - - - - 0x00A671 02:A661: A5 00     LDA ram_0000_t21_spr
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A673 02:A663: 48        PHA
    BSR     sub_bat_7885             ; JSR -> BSR  ; orig: C - - - - - 0x00A674 02:A664: 20 85 78  JSR sub_bat_7885
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00A677 02:A667: AA        TAX
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A678 02:A668: 68        PLA
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x00A679 02:A669: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_0004_t14,D2  ; orig: C - - - - - 0x00A67B 02:A66B: A4 04     LDY ram_0004_t14
    MOVE.B  ram_current_quest(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A67D 02:A66D: B9 2D 06  LDA ram_current_ques
    BEQ     bra_A68F_1st_quest             ; BEQ  ; orig: C - - - - - 0x00A680 02:A670: F0 1D     BEQ bra_A68F_1st_que

; if 2nd quest
    MOVE.B  ram_spr_index_1,D2  ; orig: C - - - - - 0x00A682 02:A672: AC 43 03  LDY ram_spr_index_1
    MOVE.B  ram_0001_t15_spr_Y,D0  ; orig: C - - - - - 0x00A685 02:A675: A5 01     LDA ram_0001_t15_spr
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00A687 02:A677: 38        SEC
    SUBX.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x00A688 02:A678: E9 03     SBC #$03
    LEA     (ram_spr_Y+$80).l,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x00A68A 02:A67A: 99 80 02  STA ram_spr_Y + $80,
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x00A68D 02:A67D: A9 20     LDA #$20
    LEA     (ram_spr_T+$80).l,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x00A68F 02:A67F: 99 81 02  STA ram_spr_T + $80,
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x00A692 02:A682: A9 03     LDA #$03
    LEA     (ram_spr_A+$80).l,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x00A694 02:A684: 99 82 02  STA ram_spr_A + $80,
    MOVE.B  ram_0000_t21_spr_X,D0  ; orig: C - - - - - 0x00A697 02:A687: A5 00     LDA ram_0000_t21_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A699 02:A689: 18        CLC
    ADDX.B  #$0C,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A69A 02:A68A: 69 0C     ADC #$0C
    LEA     (ram_spr_X+$80).l,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x00A69C 02:A68C: 99 83 02  STA ram_spr_X + $80,
bra_A68F_1st_quest:  ; orig: bra_A68F_1st_quest:
    MOVE.B  ram_0001_t15_spr_Y,D0  ; orig: C - - - - - 0x00A69F 02:A68F: A5 01     LDA ram_0001_t15_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00A6A1 02:A691: 18        CLC
    ADDX.B  #$18,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00A6A2 02:A692: 69 18     ADC #$18
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x00A6A4 02:A694: 85 01     STA ram_0001_t15_spr
    ADDQ.B  #1,ram_0004_t14  ; orig: C - - - - - 0x00A6A6 02:A696: E6 04     INC ram_0004_t14
    ADDQ.B  #1,ram_0005_temp  ; Fix X: slot-select loop temp high byte ; orig: C - - - - - 0x00A6A8 02:A698: E6 05     INC ram_0004_t14 + $
    MOVE.B  ram_0004_t14,D0  ; orig: C - - - - - 0x00A6AA 02:A69A: A5 04     LDA ram_0004_t14
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x00A6AC 02:A69C: C9 03     CMP #$03
    BNE     bra_A64A_loop             ; BNE  ; orig: C - - - - - 0x00A6AE 02:A69E: D0 AA     BNE bra_A64A_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x00A6B0 02:A6A0: 60        RTS



tbl_A6A1_hearts_slot_address_lo:  ; orig: tbl_A6A1_hearts_slot_address_lo:
    DC.B $50,$52,$54



tbl_A6A4_hearts_slot_address_hi:  ; orig: tbl_A6A4_hearts_slot_address_hi:
    DC.B $06,$06,$06



tbl_A6A7_slot_name_address_lo:  ; orig: tbl_A6A7_slot_name_address_lo:
    DC.B $38,$40,$48



tbl_A6AA_slot_name_address_hi:  ; orig: tbl_A6AA_slot_name_address_hi:
    DC.B $06,$06,$06



ofs_main_script_2_0x00A6BD_0D:  ; orig: ofs_main_script_2_0x00A6BD_0D:

; con_script_0D
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x00A6BD 02:A6AD: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00A6BF 02:A6AF: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_011_A6B8_00
    DC.L    ofs_011_A734_01
    DC.L    ofs_011_A803_02



ofs_011_A6B8_00:  ; orig: ofs_011_A6B8_00:
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - J - - 0x00A6C8 02:A6B8: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A437             ; JSR -> BSR  ; orig: C - - - - - 0x00A6CB 02:A6BB: 20 37 A4  JSR sub_A437
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A6CE 02:A6BE: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A6D1 02:A6C1: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A6D4 02:A6C4: A0 27     LDY #$27
bra_A6C6_loop:
; items 0657-067E
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A6D6 02:A6C6: B9 57 06  LDA ram_items,Y
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A6D9 02:A6C9: 91 C0     STA (ram_00C0_t01_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A6DB 02:A6CB: 88        DEY
    BPL     bra_A6C6_loop             ; BPL  ; orig: C - - - - - 0x00A6DC 02:A6CC: 10 F8     BPL bra_A6C6_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A6DE 02:A6CE: A4 16     LDY ram_current_save
    MOVE.B  ram_death_cnt(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A6E0 02:A6D0: B9 30 06  LDA ram_death_cnt,Y
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A6E3 02:A6D3: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_00CA_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A6E5 02:A6D5: 91 CA     STA (ram_00CA_t01_da
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x00A6E7 02:A6D7: A9 01     LDA #$01
    MOVEA.W ($FF0000+ram_00C6_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A6E9 02:A6D9: 91 C6     STA (ram_00C6_t01_da
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A6EB 02:A6DB: A4 16     LDY ram_current_save
    MOVE.B  D0,ram_slot_active_flag(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A6ED 02:A6DD: 99 33 06  STA ram_slot_active_
    MOVE.B  ram_current_quest(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A6F0 02:A6E0: B9 2D 06  LDA ram_current_ques
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A6F3 02:A6E3: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_00CC_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A6F5 02:A6E5: 91 CC     STA (ram_00CC_t01_da
    BSR     sub_A80C_prepare_slot_name_address             ; JSR -> BSR  ; orig: C - - - - - 0x00A6F7 02:A6E7: 20 0C A8  JSR sub_A80C_prepare
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A6FA 02:A6EA: A0 07     LDY #$07
bra_A6EC_loop:  ; orig: bra_A6EC_loop:
    MOVEA.W ($FF0000+ram_000C_t02_slot_name_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A6FC 02:A6EC: B1 0C     LDA (ram_000C_t02_sl
    MOVEA.W ($FF0000+ram_00C4_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A6FE 02:A6EE: 91 C4     STA (ram_00C4_t01_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A700 02:A6F0: 88        DEY
    BPL     bra_A6EC_loop             ; BPL  ; orig: C - - - - - 0x00A701 02:A6F1: 10 F9     BPL bra_A6EC_loop
    MOVE.B  ram_item_hearts,D0  ; orig: C - - - - - 0x00A703 02:A6F3: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x00A706 02:A6F6: 29 F0     AND #$F0
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A708 02:A6F8: 48        PHA

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00A709 02:A6F9: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00A70A 02:A6FA: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00A70B 02:A6FB: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00A70C 02:A6FC: 4A        LSR
    MOVE.B  D0,ram_000A_t02  ; orig: C - - - - - 0x00A70D 02:A6FD: 85 0A     STA ram_000A_t02
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A70F 02:A6FF: 68        PLA
    OR.B    ram_000A_t02,D0  ; orig: C - - - - - 0x00A710 02:A700: 05 0A     ORA ram_000A_t02
    MOVE.B  D0,ram_item_hearts  ; orig: C - - - - - 0x00A712 02:A702: 8D 6F 06  STA ram_item_hearts
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00A715 02:A705: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A717 02:A707: 8D 70 06  STA ram_item_hearts 
    BSR     sub_A819_save_hearts_amount             ; JSR -> BSR  ; orig: C - - - - - 0x00A71A 02:A70A: 20 19 A8  JSR sub_A819_save_he
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A71D 02:A70D: A0 00     LDY #$00
bra_A70F_loop:  ; orig: bra_A70F_loop:
    MOVEA.W ($FF0000+ram_000E_t04_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A71F 02:A70F: B1 0E     LDA (ram_000E_t04_da
    MOVEA.W ($FF0000+ram_00C2_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A721 02:A711: 91 C2     STA (ram_00C2_t01_da
    ADDQ.B  #1,ram_00C2_t01_data  ; orig: C - - - - - 0x00A723 02:A713: E6 C2     INC ram_00C2_t01_dat
    BNE     bra_A719_not_overflow             ; BNE  ; orig: C - - - - - 0x00A725 02:A715: D0 02     BNE bra_A719_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A727 02:A717: E6 C3     INC ram_00C2_t01_dat
bra_A719_not_overflow:  ; orig: bra_A719_not_overflow:
    ADDQ.B  #1,ram_000E_t04_data  ; orig: C - - - - - 0x00A729 02:A719: E6 0E     INC ram_000E_t04_dat
    BNE     bra_A71F_not_overflow             ; BNE  ; orig: C - - - - - 0x00A72B 02:A71B: D0 02     BNE bra_A71F_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A72D 02:A71D: E6 0F     INC ram_000E_t04_dat
bra_A71F_not_overflow:  ; orig: bra_A71F_not_overflow:
    MOVE.B  ram_000E_t04_data,D0  ; orig: C - - - - - 0x00A72F 02:A71F: A5 0E     LDA ram_000E_t04_dat
    CMPI.B  #< $07FF,D0  ; orig: C - - - - - 0x00A731 02:A721: C9 FF     CMP #< $07FF
    BNE     bra_A70F_loop             ; BNE  ; orig: C - - - - - 0x00A733 02:A723: D0 EA     BNE bra_A70F_loop
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A735 02:A725: A5 0F     LDA ram_000E_t04_dat
    CMPI.B  #> $07FF,D0  ; orig: C - - - - - 0x00A737 02:A727: C9 07     CMP #> $07FF
    BNE     bra_A70F_loop             ; BNE  ; orig: C - - - - - 0x00A739 02:A729: D0 E4     BNE bra_A70F_loop
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A73B 02:A72B: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A3C8             ; JSR -> BSR  ; orig: C - - - - - 0x00A73E 02:A72E: 20 C8 A3  JSR sub_A3C8
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A741 02:A731: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A743 02:A733: 60        RTS



ofs_011_A734_01:  ; orig: ofs_011_A734_01:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - J - - 0x00A744 02:A734: A4 16     LDY ram_current_save
    MOVE.B  ram_652A_slot(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A746 02:A736: B9 2A 65  LDA ram_652A_slot,Y
    BNE     bra_A757             ; BNE  ; orig: C - - - - - 0x00A749 02:A739: D0 1C     BNE bra_A757
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A74B 02:A73B: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_A3E1             ; JSR -> BSR  ; orig: C - - - - - 0x00A74E 02:A73E: 20 E1 A3  JSR sub_A3E1
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00A751 02:A741: A5 16     LDA ram_current_save
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A753 02:A743: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A754 02:A744: A8        TAY
    MOVE.B  ram_6D9C(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A755 02:A745: B9 9C 6D  LDA ram_6D9C,Y
    CMP.B   ram_00CE,D0  ; orig: C - - - - - 0x00A758 02:A748: C5 CE     CMP ram_00CE
    BNE     bra_A75A             ; BNE  ; orig: C - - - - - 0x00A75A 02:A74A: D0 0E     BNE bra_A75A
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A75C 02:A74C: C8        INY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A75D 02:A74D: B9 9C 6D  LDA ram_6D9D - $01,Y
    CMP.B   ram_00CF,D0  ; orig: C - - - - - 0x00A760 02:A750: C5 CF     CMP ram_00CF
    BNE     bra_A75A             ; BNE  ; orig: C - - - - - 0x00A762 02:A752: D0 06     BNE bra_A75A
    BSR     sub_A764             ; JSR -> BSR  ; orig: C - - - - - 0x00A764 02:A754: 20 64 A7  JSR sub_A764
bra_A757:  ; orig: bra_A757:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A767 02:A757: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A769 02:A759: 60        RTS
bra_A75A:  ; orig: bra_A75A:
    MOVE.B  ram_current_save_slot,D2  ; orig: - - - - - - 0x00A76A 02:A75A: A4 16     LDY ram_current_save
    MOVE.B  #$FF,D0  ; orig: - - - - - - 0x00A76C 02:A75C: A9 FF     LDA #$FF
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: - - - - - - 0x00A76E 02:A75E: 99 2A 65  STA ram_652A_slot,Y
    ADDQ.B  #1,ram_subscript  ; orig: - - - - - - 0x00A771 02:A761: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: - - - - - - 0x00A773 02:A763: 60        RTS



sub_A764:  ; orig: sub_A764:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A774 02:A764: A4 16     LDY ram_current_save
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A776 02:A766: A9 00     LDA #$00
    MOVE.B  D0,ram_slot_valid_1(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A778 02:A768: 99 1E 65  STA ram_slot_valid_1
    MOVE.B  D0,ram_slot_valid_2(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A77B 02:A76B: 99 21 65  STA ram_slot_valid_2
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00A77E 02:A76E: 98        TYA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A77F 02:A76F: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A780 02:A770: A8        TAY
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A781 02:A771: A9 00     LDA #$00
    MOVE.B  D0,ram_6524(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A783 02:A773: 99 24 65  STA ram_6524,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A786 02:A776: C8        INY
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A787 02:A777: 99 24 65  STA ram_6525 - $01,Y
    BSR     sub_9D2A_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A78A 02:A77A: 20 2A 9D  JSR sub_9D2A_prepare
    BSR     sub_bat_6FD1_prepare_save_slot_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x00A78D 02:A77D: 20 F1 6D  JSR sub_bat_6FD1_pre
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00A790 02:A780: A0 27     LDY #$27
bra_A782_loop:  ; orig: bra_A782_loop:
    MOVEA.W ($FF0000+ram_00C0_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A792 02:A782: B1 C0     LDA (ram_00C0_t01_da
    MOVEA.W ($FF0000+ram_0000_t19_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A794 02:A784: 91 00     STA (ram_0000_t19_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A796 02:A786: 88        DEY
    BPL     bra_A782_loop             ; BPL  ; orig: C - - - - - 0x00A797 02:A787: 10 F9     BPL bra_A782_loop
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A799 02:A789: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_00C6_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A79B 02:A78B: B1 C6     LDA (ram_00C6_t01_da
    MOVEA.W ($FF0000+ram_0006_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A79D 02:A78D: 91 06     STA (ram_0006_t01_da
    MOVEA.W ($FF0000+ram_00C8_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A79F 02:A78F: B1 C8     LDA (ram_00C8_t01_da
    MOVEA.W ($FF0000+ram_0008_t03_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A7A1 02:A791: 91 08     STA (ram_0008_t03_da
    MOVEA.W ($FF0000+ram_00CA_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7A3 02:A793: B1 CA     LDA (ram_00CA_t01_da
    MOVEA.W ($FF0000+ram_000A_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A7A5 02:A795: 91 0A     STA (ram_000A_t01_da
    MOVEA.W ($FF0000+ram_00CC_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7A7 02:A797: B1 CC     LDA (ram_00CC_t01_da
    MOVEA.W ($FF0000+ram_000C_t01_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A7A9 02:A799: 91 0C     STA (ram_000C_t01_da
    MOVEA.W ($FF0000+ram_0006_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7AB 02:A79B: B1 06     LDA (ram_0006_t01_da
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A7AD 02:A79D: 48        PHA
    MOVEA.W ($FF0000+ram_000A_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7AE 02:A79E: B1 0A     LDA (ram_000A_t01_da
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A7B0 02:A7A0: 48        PHA
    MOVEA.W ($FF0000+ram_000C_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7B1 02:A7A1: B1 0C     LDA (ram_000C_t01_da
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x00A7B3 02:A7A3: 48        PHA
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A7B4 02:A7A4: A4 16     LDY ram_current_save
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A7B6 02:A7A6: 68        PLA
    MOVE.B  D0,ram_current_quest(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A7B7 02:A7A7: 99 2D 06  STA ram_current_ques
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A7BA 02:A7AA: 68        PLA
    MOVE.B  D0,ram_death_cnt(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A7BB 02:A7AB: 99 30 06  STA ram_death_cnt,Y
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x00A7BE 02:A7AE: 68        PLA
    MOVE.B  D0,ram_slot_active_flag(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A7BF 02:A7AF: 99 33 06  STA ram_slot_active_
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x00A7C2 02:A7B2: A0 07     LDY #$07
bra_A7B4_loop:  ; orig: bra_A7B4_loop:
    MOVEA.W ($FF0000+ram_00C4_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7C4 02:A7B4: B1 C4     LDA (ram_00C4_t01_da
    MOVEA.W ($FF0000+ram_0004_t02_slot_name_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A7C6 02:A7B6: 91 04     STA (ram_0004_t02_sl
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A7C8 02:A7B8: 88        DEY
    BPL     bra_A7B4_loop             ; BPL  ; orig: C - - - - - 0x00A7C9 02:A7B9: 10 F9     BPL bra_A7B4_loop
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00A7CB 02:A7BB: A0 00     LDY #$00
bra_A7BD_loop:  ; orig: bra_A7BD_loop:
    MOVEA.W ($FF0000+ram_00C2_t01_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A7CD 02:A7BD: B1 C2     LDA (ram_00C2_t01_da
    MOVEA.W ($FF0000+ram_0002_t03_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A7CF 02:A7BF: 91 02     STA (ram_0002_t03_da
    ADDQ.B  #1,ram_0002_t03_data  ; orig: C - - - - - 0x00A7D1 02:A7C1: E6 02     INC ram_0002_t03_dat
    BNE     bra_A7C7_not_overflow             ; BNE  ; orig: C - - - - - 0x00A7D3 02:A7C3: D0 02     BNE bra_A7C7_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7D5 02:A7C5: E6 03     INC ram_0002_t03_dat
bra_A7C7_not_overflow:  ; orig: bra_A7C7_not_overflow:
    ADDQ.B  #1,ram_00C2_t01_data  ; orig: C - - - - - 0x00A7D7 02:A7C7: E6 C2     INC ram_00C2_t01_dat
    BNE     bra_A7CD_not_overflow             ; BNE  ; orig: C - - - - - 0x00A7D9 02:A7C9: D0 02     BNE bra_A7CD_not_ove
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7DB 02:A7CB: E6 C3     INC ram_00C2_t01_dat
bra_A7CD_not_overflow:  ; orig: bra_A7CD_not_overflow:
    ADDQ.B  #1,ram_000E_t04_data  ; orig: C - - - - - 0x00A7DD 02:A7CD: E6 0E     INC ram_000E_t04_dat
    BNE     bra_A7D3             ; BNE  ; orig: C - - - - - 0x00A7DF 02:A7CF: D0 02     BNE bra_A7D3
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A7E1 02:A7D1: E6 0F     INC ram_000E_t04_dat
bra_A7D3:  ; orig: bra_A7D3:
    MOVE.B  ram_000E_t04_data,D0  ; orig: C - - - - - 0x00A7E3 02:A7D3: A5 0E     LDA ram_000E_t04_dat
    CMPI.B  #< $07FF,D0  ; orig: C - - - - - 0x00A7E5 02:A7D5: C9 FF     CMP #< $07FF
    BNE     bra_A7BD_loop             ; BNE  ; orig: C - - - - - 0x00A7E7 02:A7D7: D0 E4     BNE bra_A7BD_loop
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A7E9 02:A7D9: A5 0F     LDA ram_000E_t04_dat
    CMPI.B  #> $07FF,D0  ; orig: C - - - - - 0x00A7EB 02:A7DB: C9 07     CMP #> $07FF
    BNE     bra_A7BD_loop             ; BNE  ; orig: C - - - - - 0x00A7ED 02:A7DD: D0 DE     BNE bra_A7BD_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A7EF 02:A7DF: A4 16     LDY ram_current_save
    MOVE.B  #$5A,D0  ; orig: C - - - - - 0x00A7F1 02:A7E1: A9 5A     LDA #$5A
    MOVE.B  D0,ram_slot_valid_1(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A7F3 02:A7E3: 99 1E 65  STA ram_slot_valid_1
    MOVE.B  #$A5,D0  ; orig: C - - - - - 0x00A7F6 02:A7E6: A9 A5     LDA #$A5
    MOVE.B  D0,ram_slot_valid_2(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A7F8 02:A7E8: 99 21 65  STA ram_slot_valid_2
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00A7FB 02:A7EB: 98        TYA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00A7FC 02:A7EC: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00A7FD 02:A7ED: A8        TAY
    MOVE.B  ram_6D9C(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A7FE 02:A7EE: B9 9C 6D  LDA ram_6D9C,Y
    MOVE.B  D0,ram_6524(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A801 02:A7F1: 99 24 65  STA ram_6524,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00A804 02:A7F4: C8        INY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A805 02:A7F5: B9 9C 6D  LDA ram_6D9D - $01,Y
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A808 02:A7F8: 99 24 65  STA ram_6525 - $01,Y
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A80B 02:A7FB: A4 16     LDY ram_current_save
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00A80D 02:A7FD: A9 FF     LDA #$FF
    MOVE.B  D0,ram_652A_slot(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A80F 02:A7FF: 99 2A 65  STA ram_652A_slot,Y
    RTS                     ; RTS  ; orig: C - - - - - 0x00A812 02:A802: 60        RTS



loc_A803:  ; orig: loc_A803:
ofs_011_A803_02:  ; orig: ofs_011_A803_02:
    MOVE.B  #con_script_title_screen,D0  ; orig: C D 1 - - - 0x00A813 02:A803: A9 00     LDA #con_script_titl
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x00A815 02:A805: 85 12     STA ram_script
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x00A817 02:A807: A9 01     LDA #$01
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x00A819 02:A809: 85 13     STA ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00A81B 02:A80B: 60        RTS



sub_A80C_prepare_slot_name_address:  ; orig: sub_A80C_prepare_slot_name_address:

; out

; ram_000C_t02_slot_name_data
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A81C 02:A80C: A4 16     LDY ram_current_save
    MOVE.B  tbl_A6A7_slot_name_address_lo(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A81E 02:A80E: B9 A7 A6  LDA tbl_A6A7_slot_na
    MOVE.B  D0,ram_000C_t02_slot_name_data  ; orig: C - - - - - 0x00A821 02:A811: 85 0C     STA ram_000C_t02_slo
    MOVE.B  tbl_A6AA_slot_name_address_hi(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A823 02:A813: B9 AA A6  LDA tbl_A6AA_slot_na
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A826 02:A816: 85 0D     STA ram_000C_t02_slo
    RTS                     ; RTS  ; orig: C - - - - - 0x00A828 02:A818: 60        RTS



sub_A819_save_hearts_amount:  ; orig: sub_A819_save_hearts_amount:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00A829 02:A819: A4 16     LDY ram_current_save
    MOVE.B  tbl_A6A1_hearts_slot_address_lo(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A82B 02:A81B: B9 A1 A6  LDA tbl_A6A1_hearts_
    MOVE.B  D0,ram_000C_t03_data  ; orig: C - - - - - 0x00A82E 02:A81E: 85 0C     STA ram_000C_t03_dat
    MOVE.B  tbl_A6A4_hearts_slot_address_hi(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A830 02:A820: B9 A4 A6  LDA tbl_A6A4_hearts_
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A833 02:A823: 85 0D     STA ram_000C_t03_dat
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x00A835 02:A825: A0 01     LDY #$01
bra_A827_loop:  ; orig: bra_A827_loop:
    MOVE.B  ram_item_hearts(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A837 02:A827: B9 6F 06  LDA ram_item_hearts,
    MOVEA.W ($FF0000+ram_000C_t03_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00A83A 02:A82A: 91 0C     STA (ram_000C_t03_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A83C 02:A82C: 88        DEY
    BPL     bra_A827_loop             ; BPL  ; orig: C - - - - - 0x00A83D 02:A82D: 10 F8     BPL bra_A827_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x00A83F 02:A82F: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A840 02:A830: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A850 02:A840: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A860 02:A850: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A870 02:A860: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A880 02:A870: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A890 02:A880: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8A0 02:A890: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8B0 02:A8A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8C0 02:A8B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8D0 02:A8C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8E0 02:A8D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A8F0 02:A8E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00A900 02:A8F0: FF        .byte $FF, $FF, $FF,



loc_0x00A910_final_credits_handler:  ; orig: loc_0x00A910_final_credits_handler:
    MOVE.B  ram_subscript,D0  ; orig: C D 1 - - - 0x00A910 02:A900: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00A912 02:A902: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_final_credits_A90F_00
    DC.L    ofs_final_credits_A93F_01_prepare_nametable_attributes
    DC.L    ofs_final_credits_A97F_02_thanks_link
    DC.L    ofs_final_credits_A9F5_03
    DC.L    ofs_final_credits_A9FF_04



ofs_final_credits_A90F_00:  ; orig: ofs_final_credits_A90F_00:
    BSR     sub_A921_close_curtain             ; JSR -> BSR  ; orig: C - - J - - 0x00A91F 02:A90F: 20 21 A9  JSR sub_A921_close_c
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x00A922 02:A912: A5 13     LDA ram_subscript
    BEQ     bra_A958_RTS             ; BEQ  ; orig: C - - - - - 0x00A924 02:A914: F0 42     BEQ bra_A958_RTS

; if curtain is closed
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x00A926 02:A916: 20 F7 E5  JSR sub_0x01E607_hid
    BSR     sub_0x01F241             ; JSR -> BSR  ; orig: C - - - - - 0x00A929 02:A919: 20 31 F2  JSR sub_0x01F241
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x00A92C 02:A91C: A2 01     LDX #$01
    JMP     loc_bat_79CA  ; orig: C - - - - - 0x00A92E 02:A91E: 4C CA 79  JMP loc_bat_79CA



sub_A921_close_curtain:  ; orig: sub_A921_close_curtain:
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x00A931 02:A921: A5 28     LDA ram_timer_link
    BNE     bra_A939_RTS             ; BNE  ; orig: C - - - - - 0x00A933 02:A923: D0 14     BNE bra_A939_RTS
    MOVE.B  ram_0609_music,D0  ; orig: C - - - - - 0x00A935 02:A925: AD 09 06  LDA ram_0609_music
    BNE     bra_A939_RTS             ; BNE  ; orig: C - - - - - 0x00A938 02:A928: D0 0F     BNE bra_A939_RTS
    BSR     sub_bat_7240_curtain_movement_handler             ; JSR -> BSR  ; orig: C - - - - - 0x00A93A 02:A92A: 20 40 72  JSR sub_bat_7240_cur
    MOVE.B  ram_007C,D0  ; orig: C - - - - - 0x00A93D 02:A92D: A5 7C     LDA ram_007C
    CMPI.B  #$11,D0  ; orig: C - - - - - 0x00A93F 02:A92F: C9 11     CMP #$11
    BCS     bra_A939_RTS             ; BCS  ; orig: C - - - - - 0x00A941 02:A931: B0 06     BCS bra_A939_RTS
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x00A943 02:A933: A9 80     LDA #$80
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x00A945 02:A935: 85 28     STA ram_timer_link
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A947 02:A937: E6 13     INC ram_subscript   
bra_A939_RTS:  ; orig: bra_A939_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A949 02:A939: 60        RTS



tbl_A93A_nametable_attributes:  ; orig: tbl_A93A_nametable_attributes:
    ; !! UNKNOWN: .DBYT $23D8  ; orig: - D 1 - - - 0x00A94A 02:A93A: 23 D8     .dbyt $23D8 ; ppu ad
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - - - 0x00A94C 02:A93C: 68        .byte $68   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00A94D 02:A93D: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x00A94E 02:A93E: FF        .byte $FF   ; end to



ofs_final_credits_A93F_01_prepare_nametable_attributes:  ; orig: ofs_final_credits_A93F_01_prepare_nametable_attributes:
    MOVE.B  #$04,D2  ; orig: C - - J - - 0x00A94F 02:A93F: A0 04     LDY #$04
bra_A941_loop:  ; orig: bra_A941_loop:
    MOVE.B  tbl_A93A_nametable_attributes(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A951 02:A941: B9 3A A9  LDA tbl_A93A_nametab
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A954 02:A944: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A957 02:A947: 88        DEY
    BPL     bra_A941_loop             ; BPL  ; orig: C - - - - - 0x00A958 02:A948: 10 F7     BPL bra_A941_loop
    MOVE.B  #$A4,D0  ; orig: C - - - - - 0x00A95A 02:A94A: A9 A4     LDA #$A4
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A95C 02:A94C: 8D 5F 04  STA ram_045E_enemy +
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00A95F 02:A94F: A9 00     LDA #$00
    MOVE.B  D0,ram_0416  ; orig: C - - - - - 0x00A961 02:A951: 8D 16 04  STA ram_0416
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A964 02:A954: 85 AD     STA ram_state_obj + 
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A966 02:A956: E6 13     INC ram_subscript
bra_A958_RTS:  ; orig: bra_A958_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A968 02:A958: 60        RTS



tbl_A959_text_thanks_link:  ; orig: tbl_A959_text_thanks_link:

; THANKS LINK,YOU'RE THE HERO OF HURULE.
    ; [DIRECTIVE] .BYTE $1D, $11, $0A, $17, $14, $1C, $24, $15, $12, $17, $14, $28, $22, $18, $1E, $2A, $1B, $0E + $80  -- needs manual handling  ; orig: - D 1 - I - 0x00A969 02:A959: 1D        .byte $1D, $11, $0A,
    ; [DIRECTIVE] .BYTE $64, $1D, $11, $0E, $24, $11, $0E, $1B, $18, $24, $18, $0F, $24, $11, $22, $1B, $1E, $15, $0E, $2C + $C0  -- needs manual handling  ; orig: - D 1 - I - 0x00A97B 02:A96B: 64        .byte $64, $1D, $11,



ofs_final_credits_A97F_02_thanks_link:  ; orig: ofs_final_credits_A97F_02_thanks_link:
    BSR     sub_A995_print_thanks_link             ; JSR -> BSR  ; orig: C - - J - - 0x00A98F 02:A97F: 20 95 A9  JSR sub_A995_print_t
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A992 02:A982: A5 AD     LDA ram_state_obj + 
    BEQ     bra_A98C_RTS             ; BEQ  ; orig: C - - - - - 0x00A994 02:A984: F0 06     BEQ bra_A98C_RTS
    MOVE.B  #$50,D0  ; orig: C - - - - - 0x00A996 02:A986: A9 50     LDA #$50
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A998 02:A988: 85 29     STA ram_timer_enemy 
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00A99A 02:A98A: E6 13     INC ram_subscript
bra_A98C_RTS:  ; orig: bra_A98C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00A99C 02:A98C: 60        RTS



tbl_A98D:  ; orig: tbl_A98D:
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - - - 0x00A99D 02:A98D: 21        .byte $21   ; 00
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - - - 0x00A99E 02:A98E: A4        .byte $A4   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x00A99F 02:A98F: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - - - 0x00A9A0 02:A990: 24        .byte $24   ; 03
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x00A9A1 02:A991: FF        .byte $FF   ; 04



tbl_A992_ppu_lo:  ; orig: tbl_A992_ppu_lo:
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - - - 0x00A9A2 02:A992: C4        .byte $C4   ; 00
    ; [DIRECTIVE] .BYTE $E4  -- needs manual handling  ; orig: - D 1 - - - 0x00A9A3 02:A993: E4        .byte $E4   ; 01
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 1 - - - 0x00A9A4 02:A994: A4        .byte $A4   ; 02



sub_A995_print_thanks_link:  ; orig: sub_A995_print_thanks_link:
    BSR     sub_0x01F241             ; JSR -> BSR  ; orig: C - - - - - 0x00A9A5 02:A995: 20 31 F2  JSR sub_0x01F241

; bzk optimize, code is similar to 0x004828
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A9A8 02:A998: A5 29     LDA ram_timer_enemy 
    BNE     bra_A9F4_RTS             ; BNE  ; orig: C - - - - - 0x00A9AA 02:A99A: D0 58     BNE bra_A9F4_RTS
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x00A9AC 02:A99C: A9 06     LDA #$06
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A9AE 02:A99E: 85 29     STA ram_timer_enemy 
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x00A9B0 02:A9A0: A0 04     LDY #$04
bra_A9A2_loop:  ; orig: bra_A9A2_loop:
    MOVE.B  tbl_A98D(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A9B2 02:A9A2: B9 8D A9  LDA tbl_A98D,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00A9B5 02:A9A5: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A9B8 02:A9A8: 88        DEY
    BPL     bra_A9A2_loop             ; BPL  ; orig: C - - - - - 0x00A9B9 02:A9A9: 10 F7     BPL bra_A9A2_loop
bra_A9AB_loop:  ; orig: bra_A9AB_loop:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00A9BB 02:A9AB: AD 5F 04  LDA ram_045E_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A9BE 02:A9AE: 8D 03 03  STA ram_0302_ppu_buf
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A9C1 02:A9B1: EE 5F 04  INC ram_045E_enemy +
    MOVE.B  #< tbl_A959_text_thanks_link,D0  ; orig: C - - - - - 0x00A9C4 02:A9B4: A9 59     LDA #< tbl_A959_text
    MOVE.B  D0,ram_0000_t15_text_thanks_link_data  ; orig: C - - - - - 0x00A9C6 02:A9B6: 85 00     STA ram_0000_t15_tex
    MOVE.B  #> tbl_A959_text_thanks_link,D0  ; orig: C - - - - - 0x00A9C8 02:A9B8: A9 A9     LDA #> tbl_A959_text
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A9CA 02:A9BA: 85 01     STA ram_0000_t15_tex
    MOVE.B  ram_0416,D2  ; orig: C - - - - - 0x00A9CC 02:A9BC: AC 16 04  LDY ram_0416
    ADDQ.B  #1,ram_0416  ; orig: C - - - - - 0x00A9CF 02:A9BF: EE 16 04  INC ram_0416
    MOVEA.W ($FF0000+ram_0000_t15_text_thanks_link_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A9D2 02:A9C2: B1 00     LDA (ram_0000_t15_te
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x00A9D4 02:A9C4: 29 3F     AND #$3F
    CMPI.B  #$25,D0  ; orig: C - - - - - 0x00A9D6 02:A9C6: C9 25     CMP #$25    ; skip t

; bzk optimize, is it necessary to update message pointers in a loop?
    BEQ     bra_A9AB_loop             ; BEQ  ; orig: C - - - - - 0x00A9D8 02:A9C8: F0 E1     BEQ bra_A9AB_loop
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A9DA 02:A9CA: 8D 05 03  STA ram_0302_ppu_buf
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: C - - - - - 0x00A9DD 02:A9CD: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x00A9DF 02:A9CF: 8D 04 06  STA ram_sfx_4
    MOVEA.W ($FF0000+ram_0000_t15_text_thanks_link_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00A9E2 02:A9D2: B1 00     LDA (ram_0000_t15_te
    ANDI.B  #$C0,D0  ; orig: C - - - - - 0x00A9E4 02:A9D4: 29 C0     AND #$C0
    BEQ     bra_A9F4_RTS             ; BEQ  ; orig: C - - - - - 0x00A9E6 02:A9D6: F0 1C     BEQ bra_A9F4_RTS
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x00A9E8 02:A9D8: A0 02     LDY #$02
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x00A9EA 02:A9DA: C9 C0     CMP #$C0
    BEQ     bra_A9E4             ; BEQ  ; orig: C - - - - - 0x00A9EC 02:A9DC: F0 06     BEQ bra_A9E4    ; if
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A9EE 02:A9DE: 88        DEY ; 01
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x00A9EF 02:A9DF: C9 40     CMP #$40
    BEQ     bra_A9E4             ; BEQ  ; orig: C - - - - - 0x00A9F1 02:A9E1: F0 01     BEQ bra_A9E4    ; if
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00A9F3 02:A9E3: 88        DEY ; 00        ; if
bra_A9E4:  ; orig: bra_A9E4:
    MOVE.B  tbl_A992_ppu_lo(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00A9F4 02:A9E4: B9 92 A9  LDA tbl_A992_ppu_lo,
    ; (empty translation for STA)  ; orig: C - - - - - 0x00A9F7 02:A9E7: 8D 5F 04  STA ram_045E_enemy +
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x00A9FA 02:A9EA: C0 02     CPY #$02
    BNE     bra_A9F4_RTS             ; BNE  ; orig: C - - - - - 0x00A9FC 02:A9EC: D0 06     BNE bra_A9F4_RTS
    ; (empty translation for INC)  ; orig: C - - - - - 0x00A9FE 02:A9EE: E6 AD     INC ram_state_obj + 
    MOVE.B  #con_obj_state_00,D0  ; orig: C - - - - - 0x00AA00 02:A9F0: A9 00     LDA #con_obj_state_0
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x00AA02 02:A9F2: 85 AC     STA ram_state_link
bra_A9F4_RTS:  ; orig: bra_A9F4_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AA04 02:A9F4: 60        RTS



ofs_final_credits_A9F5_03:  ; orig: ofs_final_credits_A9F5_03:
    ; (empty translation for LDA)  ; orig: C - - J - - 0x00AA05 02:A9F5: A5 29     LDA ram_timer_enemy 
    BNE     bra_A9F4_RTS             ; BNE  ; orig: C - - - - - 0x00AA07 02:A9F7: D0 FB     BNE bra_A9F4_RTS
    BSR     sub_bat_6EE9             ; JSR -> BSR  ; orig: C - - - - - 0x00AA09 02:A9F9: 20 E9 6E  JSR sub_bat_6EE9
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00AA0C 02:A9FC: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00AA0E 02:A9FE: 60        RTS



ofs_final_credits_A9FF_04:  ; orig: ofs_final_credits_A9FF_04:
    MOVE.B  #$08,D0  ; orig: C - - J - - 0x00AA0F 02:A9FF: A9 08     LDA #$08
    MOVE.B  D0,ram_050B  ; orig: C - - - - - 0x00AA11 02:AA01: 8D 0B 05  STA ram_050B
    BSR     sub_bat_6C90             ; JSR -> BSR  ; orig: C - - - - - 0x00AA14 02:AA04: 20 90 6C  JSR sub_bat_6C90

; A = 00
    MOVE.B  D0,ram_0412  ; orig: C - - - - - 0x00AA17 02:AA07: 8D 12 04  STA ram_0412
    MOVE.B  D0,ram_0413  ; orig: C - - - - - 0x00AA1A 02:AA0A: 8D 13 04  STA ram_0413
    JMP     loc_0x01E607_hide_all_sprites  ; orig: C - - - - - 0x00AA1D 02:AA0D: 4C F7 E5  JMP loc_0x01E607_hid



ofs_main_script_2_0x00AA20_13_final_credits:  ; orig: ofs_main_script_2_0x00AA20_13_final_credits:

; con_script_final_credits
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x00AA20 02:AA10: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x00AA22 02:AA12: 20 E2 E5  JSR sub_0x01E5F2_jum
    DC.L    ofs_013_AA23_00
    DC.L    ofs_013_AAA9_01
    DC.L    ofs_013_AAA9_02
    DC.L    ofs_013_ABC4_03
    DC.L    ofs_013_AB7F_04_preparations_for_2nd_quest



tbl_AA1F:  ; orig: tbl_AA1F:
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - - - 0x00AA2F 02:AA1F: 0F        .byte $0F   ; 00
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 1 - - - 0x00AA30 02:AA20: 12        .byte $12   ; 01
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - - - 0x00AA31 02:AA21: 16        .byte $16   ; 02
    ; [DIRECTIVE] .BYTE $2A  -- needs manual handling  ; orig: - D 1 - - - 0x00AA32 02:AA22: 2A        .byte $2A   ; 03



ofs_013_AA23_00:  ; orig: ofs_013_AA23_00:
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - J - - 0x00AA33 02:AA23: 20 F7 E5  JSR sub_0x01E607_hid
    ADDQ.B  #1,ram_0506  ; orig: C - - - - - 0x00AA36 02:AA26: EE 06 05  INC ram_0506
    MOVE.B  ram_0506,D0  ; orig: C - - - - - 0x00AA39 02:AA29: AD 06 05  LDA ram_0506
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x00AA3C 02:AA2C: C9 C0     CMP #$C0
    BEQ     bra_AA50             ; BEQ  ; orig: C - - - - - 0x00AA3E 02:AA2E: F0 20     BEQ bra_AA50
    BSR     sub_AA62             ; JSR -> BSR  ; orig: C - - - - - 0x00AA40 02:AA30: 20 62 AA  JSR sub_AA62
loc_AA33:  ; orig: loc_AA33:
    MOVE.B  ram_0506,D1  ; orig: C D 1 - - - 0x00AA43 02:AA33: AE 06 05  LDX ram_0506
    CMPI.B  #$40,D1  ; orig: C - - - - - 0x00AA46 02:AA36: E0 40     CPX #$40
    BCC     bra_AA4F_RTS             ; BCC  ; orig: C - - - - - 0x00AA48 02:AA38: 90 15     BCC bra_AA4F_RTS
    MOVE.B  #$23,D2  ; orig: C - - - - - 0x00AA4A 02:AA3A: A0 23     LDY #$23
bra_AA3C_loop:  ; orig: bra_AA3C_loop:
    MOVE.B  ram_6B7E_palette_buffer(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AA4C 02:AA3C: B9 7E 6B  LDA ram_6B7E_palette
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00AA4F 02:AA3F: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AA52 02:AA42: 88        DEY
    BPL     bra_AA3C_loop             ; BPL  ; orig: C - - - - - 0x00AA53 02:AA43: 10 F7     BPL bra_AA3C_loop
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x00AA55 02:AA45: 8A        TXA
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x00AA56 02:AA46: 29 03     AND #$03
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00AA58 02:AA48: AA        TAX
    MOVE.B  tbl_AA1F(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AA59 02:AA49: BD 1F AA  LDA tbl_AA1F,X
    MOVE.B  D0,ram_0302_ppu_buffer+$13  ; Fix X: animated menu buffer byte ; orig: C - - - - - 0x00AA5C 02:AA4C: 8D 15 03  STA ram_0302_ppu_buf
bra_AA4F_RTS:  ; orig: bra_AA4F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AA5F 02:AA4F: 60        RTS
bra_AA50:  ; orig: bra_AA50:
    MOVE.B  #con_music_credits,D0  ; orig: C - - - - - 0x00AA60 02:AA50: A9 10     LDA #con_music_credi
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x00AA62 02:AA52: 8D 00 06  STA ram_music
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x00AA65 02:AA55: A9 40     LDA #$40
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x00AA67 02:AA57: 85 28     STA ram_timer_link
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x00AA69 02:AA59: A9 40     LDA #$40
    MOVE.B  D0,ram_004D  ; orig: C - - - - - 0x00AA6B 02:AA5B: 85 4D     STA ram_004D
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00AA6D 02:AA5D: E6 13     INC ram_subscript
    JMP     loc_AA33  ; orig: C - - - - - 0x00AA6F 02:AA5F: 4C 33 AA  JMP loc_AA33



sub_AA62:  ; orig: sub_AA62:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x00AA72 02:AA62: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x00AA74 02:AA64: 85 83     STA ram_0083
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x00AA76 02:AA66: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00AA78 02:AA68: 38        SEC
    SUBX.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x00AA79 02:AA69: E9 10     SBC #$10
    MOVE.B  D0,ram_0097  ; orig: C - - - - - 0x00AA7B 02:AA6B: 85 97     STA ram_0097
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00AA7D 02:AA6D: A2 00     LDX #$00
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x00AA7F 02:AA6F: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x00AA82 02:AA72: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x00AA85 02:AA75: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$48,D0  ; orig: C - - - - - 0x00AA87 02:AA77: A9 48     LDA #$48
    MOVE.B  D0,ram_spr_index_1  ; orig: C - - - - - 0x00AA89 02:AA79: 8D 43 03  STA ram_spr_index_1
    MOVE.B  #$4C,D0  ; orig: C - - - - - 0x00AA8C 02:AA7C: A9 4C     LDA #$4C
    MOVE.B  D0,ram_spr_index_2  ; orig: C - - - - - 0x00AA8E 02:AA7E: 8D 44 03  STA ram_spr_index_2
    MOVE.B  #$21,D2  ; orig: C - - - - - 0x00AA91 02:AA81: A0 21     LDY #$21
    BSR     sub_bat_792C             ; JSR -> BSR  ; orig: C - - - - - 0x00AA93 02:AA83: 20 2C 79  JSR sub_bat_792C
    MOVE.B  #con_drop_id_1B,D0  ; orig: C - - - - - 0x00AA96 02:AA86: A9 1B     LDA #con_drop_id_1B
    MOVE.B  #$13,D1  ; orig: C - - - - - 0x00AA98 02:AA88: A2 13     LDX #$13
    BSR     sub_0x01E71E             ; JSR -> BSR  ; orig: C - - - - - 0x00AA9A 02:AA8A: 20 0E E7  JSR sub_0x01E71E
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x00AA9D 02:AA8D: A2 01     LDX #$01
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x00AA9F 02:AA8F: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x00AAA2 02:AA92: 8A        TXA
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x00AAA3 02:AA93: 20 DB 77  JSR sub_bat_77DB
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAA6 02:AA96: A5 71     LDA ram_pos_X_enemy 
    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAA8 02:AA98: 85 72     STA ram_pos_X_enemy 
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AAAA 02:AA9A: A5 85     LDA ram_pos_Y_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00AAAC 02:AA9C: 38        SEC
    SUBX.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x00AAAD 02:AA9D: E9 10     SBC #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x00AAAF 02:AA9F: 85 86     STA ram_pos_Y_enemy 
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x00AAB1 02:AAA1: A2 02     LDX #$02
    MOVE.B  #con_drop_id_1B,D0  ; orig: C - - - - - 0x00AAB3 02:AAA3: A9 1B     LDA #con_drop_id_1B

; bzk optimize, JMP
    BSR     sub_0x01E71E             ; JSR -> BSR  ; orig: C - - - - - 0x00AAB5 02:AAA5: 20 0E E7  JSR sub_0x01E71E
    RTS                     ; RTS  ; orig: C - - - - - 0x00AAB8 02:AAA8: 60        RTS



ofs_013_AAA9_01:  ; orig: ofs_013_AAA9_01:
ofs_013_AAA9_02:  ; orig: ofs_013_AAA9_02:
    MOVE.B  ram_004D,D0  ; orig: C - - J - - 0x00AAB9 02:AAA9: A5 4D     LDA ram_004D
    BEQ     bra_AAC7             ; BEQ  ; orig: C - - - - - 0x00AABB 02:AAAB: F0 1A     BEQ bra_AAC7
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x00AABD 02:AAAD: 20 F7 E5  JSR sub_0x01E607_hid
    MOVE.B  ram_004D,D0  ; orig: C - - - - - 0x00AAC0 02:AAB0: A5 4D     LDA ram_004D
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x00AAC2 02:AAB2: C9 04     CMP #$04
    BCC     bra_AAC6_RTS             ; BCC  ; orig: C - - - - - 0x00AAC4 02:AAB4: 90 10     BCC bra_AAC6_RTS
    BSR     sub_AA62             ; JSR -> BSR  ; orig: C - - - - - 0x00AAC6 02:AAB6: 20 62 AA  JSR sub_AA62
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x00AAC9 02:AAB9: A5 13     LDA ram_subscript
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x00AACB 02:AABB: C9 01     CMP #$01
    BNE     bra_AAC6_RTS             ; BNE  ; orig: C - - - - - 0x00AACD 02:AABD: D0 07     BNE bra_AAC6_RTS
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x00AACF 02:AABF: A5 28     LDA ram_timer_link
    BNE     bra_AAC6_RTS             ; BNE  ; orig: C - - - - - 0x00AAD1 02:AAC1: D0 03     BNE bra_AAC6_RTS

; bzk optimize, JMP
    BSR     sub_AB3C             ; JSR -> BSR  ; orig: C - - - - - 0x00AAD3 02:AAC3: 20 3C AB  JSR sub_AB3C
bra_AAC6_RTS:  ; orig: bra_AAC6_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AAD6 02:AAC6: 60        RTS
bra_AAC7:  ; orig: bra_AAC7:
    MOVE.W  #$0438,D0
    BSR     TRACE_MARK
    MOVE.B  #con_ppu_buf_6A,D0  ; orig: C - - - - - 0x00AAD7 02:AAC7: A9 6A     LDA #con_ppu_buf_6A
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x00AAD9 02:AAC9: 85 14     STA ram_ppu_load_ind
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00AADB 02:AACB: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x00AADD 02:AACD: 60        RTS



tbl_AACE:  ; orig: tbl_AACE:
    DC.B $22,$A4,$01,$24,$FF



tbl_AAD3:  ; orig: tbl_AAD3:
    DC.B    $AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3
    DC.B    $E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB
    DC.B    $EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3
    DC.B    $F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB
    DC.B    $46,$47,$48,$49,$4A,$4B,$4C,$4D
    DC.B    $4E,$4F,$50,$51,$52,$53,$54,$55
    DC.B    $56,$57,$58,$59



tbl_AB07:  ; orig: tbl_AB07:
    DC.B    $0F,$12,$17,$0A,$15,$15,$22,$28
    DC.B    $19,$0E,$0A,$0C,$0E,$24,$1B,$0E
    DC.B    $1D,$1E,$1B,$17,$1C,$24,$1D,$18
    DC.B    $24,$11,$22,$1B,$1E,$15,$0E,$2C
    DC.B    $1D,$11,$12,$1C,$24,$0E,$17,$0D
    DC.B    $1C,$24,$1D,$11,$0E,$24,$1C,$1D
    DC.B    $18,$1B,$22,$2C,$FF



sub_AB3C:  ; orig: sub_AB3C:
    ADDQ.B  #1,ram_0412  ; orig: C - - - - - 0x00AB4C 02:AB3C: EE 12 04  INC ram_0412
    MOVE.B  ram_0412,D0  ; orig: C - - - - - 0x00AB4F 02:AB3F: AD 12 04  LDA ram_0412
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x00AB52 02:AB42: 29 07     AND #$07
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x00AB54 02:AB44: C9 04     CMP #$04
    BNE     bra_AB7B_RTS             ; BNE  ; orig: C - - - - - 0x00AB56 02:AB46: D0 33     BNE bra_AB7B_RTS
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x00AB58 02:AB48: A0 04     LDY #$04
bra_AB4A_loop:  ; orig: bra_AB4A_loop:
    MOVE.B  tbl_AACE(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AB5A 02:AB4A: B9 CE AA  LDA tbl_AACE,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00AB5D 02:AB4D: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AB60 02:AB50: 88        DEY
    BPL     bra_AB4A_loop             ; BPL  ; orig: C - - - - - 0x00AB61 02:AB51: 10 F7     BPL bra_AB4A_loop
    MOVE.B  ram_0413,D2  ; orig: C - - - - - 0x00AB63 02:AB53: AC 13 04  LDY ram_0413
    MOVE.B  tbl_AB07(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AB66 02:AB56: B9 07 AB  LDA tbl_AB07,Y
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x00AB69 02:AB59: C9 FF     CMP #$FF
    BEQ     bra_AB7C             ; BEQ  ; orig: C - - - - - 0x00AB6B 02:AB5B: F0 1F     BEQ bra_AB7C
    MOVE.B  D0,ram_0302_ppu_buffer+3  ; orig: C - - - - - 0x00AB6D 02:AB5D: 8D 05 03  STA ram_0302_ppu_buf
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x00AB70 02:AB60: C9 24     CMP #$24
    BEQ     bra_AB69             ; BEQ  ; orig: C - - - - - 0x00AB72 02:AB62: F0 05     BEQ bra_AB69
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: C - - - - - 0x00AB74 02:AB64: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x00AB76 02:AB66: 8D 04 06  STA ram_sfx_4
bra_AB69:  ; orig: bra_AB69:
    ADDQ.B  #1,ram_0413  ; orig: C - - - - - 0x00AB79 02:AB69: EE 13 04  INC ram_0413
    MOVE.B  tbl_AAD3(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AB7C 02:AB6C: B9 D3 AA  LDA tbl_AAD3,Y
    MOVE.B  D0,ram_0302_ppu_buffer+1  ; orig: C - - - - - 0x00AB7F 02:AB6F: 8D 03 03  STA ram_0302_ppu_buf
    CMPI.B  #$A0,D0  ; orig: C - - - - - 0x00AB82 02:AB72: C9 A0     CMP #$A0
    BCS     bra_AB7B_RTS             ; BCS  ; orig: C - - - - - 0x00AB84 02:AB74: B0 05     BCS bra_AB7B_RTS
    MOVE.B  #$23,D0  ; orig: C - - - - - 0x00AB86 02:AB76: A9 23     LDA #$23
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x00AB88 02:AB78: 8D 02 03  STA ram_0302_ppu_buf
bra_AB7B_RTS:  ; orig: bra_AB7B_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AB8B 02:AB7B: 60        RTS
bra_AB7C:  ; orig: bra_AB7C:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00AB8C 02:AB7C: E6 13     INC ram_subscript
bra_AB7E_RTS:  ; orig: bra_AB7E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AB8E 02:AB7E: 60        RTS



ofs_013_AB7F_04_preparations_for_2nd_quest:  ; orig: ofs_013_AB7F_04_preparations_for_2nd_quest:
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - J - - 0x00AB8F 02:AB7F: 20 F7 E5  JSR sub_0x01E607_hid
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x00AB92 02:AB82: A2 02     LDX #$02
    MOVE.B  #$78,D0  ; orig: C - - - - - 0x00AB94 02:AB84: A9 78     LDA #$78
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00AB96 02:AB86: 95 70     STA ram_pos_X_enemy,
    MOVE.B  #$88,D0  ; orig: C - - - - - 0x00AB98 02:AB88: A9 88     LDA #$88
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x00AB9A 02:AB8A: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  #con_drop_id_0E,D0  ; orig: C - - - - - 0x00AB9C 02:AB8C: A9 0E     LDA #con_drop_id_0E
    BSR     sub_0x01E71E             ; JSR -> BSR  ; orig: C - - - - - 0x00AB9E 02:AB8E: 20 0E E7  JSR sub_0x01E71E
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x00ABA1 02:AB91: A2 02     LDX #$02
    MOVE.B  #con_obj_id_3E,D0  ; orig: C - - - - - 0x00ABA3 02:AB93: A9 3E     LDA #con_obj_id_3E
    LEA     (ram_obj_id_enemy-1).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00ABA5 02:AB95: 9D 4F 03  STA ram_obj_id_enemy
    BSR     sub_ABB8             ; JSR -> BSR  ; orig: C - - - - - 0x00ABA8 02:AB98: 20 B8 AB  JSR sub_ABB8
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x00ABAB 02:AB9B: A5 28     LDA ram_timer_link
    BNE     bra_AB7E_RTS             ; BNE  ; orig: C - - - - - 0x00ABAD 02:AB9D: D0 DF     BNE bra_AB7E_RTS
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x00ABAF 02:AB9F: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x00ABB1 02:ABA1: 29 10     AND #con_btn_Start
    BEQ     bra_AB7E_RTS             ; BEQ  ; orig: C - - - - - 0x00ABB3 02:ABA3: F0 D9     BEQ bra_AB7E_RTS
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C - - - - - 0x00ABB5 02:ABA5: 20 A3 EB  JSR sub_0x01EBB3_cle
    MOVE.B  #con_script_0D,D0  ; orig: C - - - - - 0x00ABB8 02:ABA8: A9 0D     LDA #con_script_0D
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x00ABBA 02:ABAA: 85 12     STA ram_script
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x00ABBC 02:ABAC: 20 25 E6  JSR sub_0x01E635_dis
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - - - - 0x00ABBF 02:ABAF: 20 6D E4  JSR sub_0x01E47D_cle
    BSR     sub_bat_6EE9             ; JSR -> BSR  ; orig: C - - - - - 0x00ABC2 02:ABB2: 20 E9 6E  JSR sub_bat_6EE9
    JMP     loc_AF5A_clear_0657_07FE  ; orig: C - - - - - 0x00ABC5 02:ABB5: 4C 5A AF  JMP loc_AF5A_clear_0



sub_ABB8:  ; orig: sub_ABB8:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x00ABC8 02:ABB8: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  #$0B,D0  ; orig: C - - - - - 0x00ABCB 02:ABBB: A9 0B     LDA #$0B
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x00ABCD 02:ABBD: 4C DF 77  JMP loc_bat_77DF



tbl_ABC0:  ; orig: tbl_ABC0:
    DC.B    $02,$03



tbl_ABC2:  ; orig: tbl_ABC2:
    DC.B    $78,$00



ofs_013_ABC4_03:  ; orig: ofs_013_ABC4_03:
    MOVE.B  ram_050B,D0  ; orig: C - - J - - 0x00ABD4 02:ABC4: AD 0B 05  LDA ram_050B
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x00ABD7 02:ABC7: C9 08     CMP #$08
    BMI     bra_ABD6             ; BMI  ; orig: C - - - - - 0x00ABD9 02:ABC9: 30 0B     BMI bra_ABD6
    MOVE.B  ram_050B,D0  ; orig: C - - - - - 0x00ABDB 02:ABCB: AD 0B 05  LDA ram_050B
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x00ABDE 02:ABCE: E9 08     SBC #$08
    MOVE.B  D0,ram_050B  ; orig: C - - - - - 0x00ABE0 02:ABD0: 8D 0B 05  STA ram_050B
    BSR     sub_AE13_print_final_credits             ; JSR -> BSR  ; orig: C - - - - - 0x00ABE3 02:ABD3: 20 13 AE  JSR sub_AE13_print_f
bra_ABD6:  ; orig: bra_ABD6:
    MOVE.B  ram_0058_ppu_addr_hi,D0  ; orig: C - - - - - 0x00ABE6 02:ABD6: A5 58     LDA ram_0058_ppu_add
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00ABE8 02:ABD8: 18        CLC
    ADDX.B  #$80,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00ABE9 02:ABD9: 69 80     ADC #$80
    MOVE.B  D0,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x00ABEB 02:ABDB: 85 58     STA ram_0058_ppu_add
    BCC     bra_ABE2             ; BCC  ; orig: C - - - - - 0x00ABED 02:ABDD: 90 03     BCC bra_ABE2
    ADDQ.B  #1,ram_050B  ; orig: C - - - - - 0x00ABEF 02:ABDF: EE 0B 05  INC ram_050B
bra_ABE2:  ; orig: bra_ABE2:
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x00ABF2 02:ABE2: A5 FC     LDA ram_scroll_Y
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00ABF4 02:ABE4: 69 00     ADC #$00
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x00ABF6 02:ABE6: 85 FC     STA ram_scroll_Y
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x00ABF8 02:ABE8: C9 F0     CMP #$F0
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00ABFA 02:ABEA: A9 00     LDA #$00
    BCC     bra_ABF3             ; BCC  ; orig: C - - - - - 0x00ABFC 02:ABEC: 90 05     BCC bra_ABF3
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x00ABFE 02:ABEE: 85 FC     STA ram_scroll_Y
    ADDQ.B  #1,($00FF00E2).l  ; orig: C - - - - - 0x00AC00 02:ABF0: EE E2 00  INC a: ram_00E2_ppu_
bra_ABF3:  ; orig: bra_ABF3:
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x00AC03 02:ABF3: 2A        ROL
    MOVE.B  D0,ram_005C  ; orig: C - - - - - 0x00AC04 02:ABF4: 85 5C     STA ram_005C
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00AC06 02:ABF6: A0 00     LDY #$00
    MOVE.B  ram_current_save_slot,D1  ; orig: C - - - - - 0x00AC08 02:ABF8: A6 16     LDX ram_current_save
    MOVE.B  ram_current_quest(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AC0A 02:ABFA: BD 2D 06  LDA ram_current_ques
    BEQ     bra_AC00_1st_quest             ; BEQ  ; orig: C - - - - - 0x00AC0D 02:ABFD: F0 01     BEQ bra_AC00_1st_que

; if 2nd quest
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AC0F 02:ABFF: C8        INY
bra_AC00_1st_quest:  ; orig: bra_AC00_1st_quest:
    MOVE.B  ($00FF00E2).l,D0  ; orig: C - - - - - 0x00AC10 02:AC00: AD E2 00  LDA a: ram_00E2_ppu_
    CMP.B   tbl_ABC0(D2.L),D0  ; orig: C - - - - - 0x00AC13 02:AC03: D9 C0 AB  CMP tbl_ABC0,Y
    BCC     bra_AC15_RTS             ; BCC  ; orig: C - - - - - 0x00AC16 02:AC06: 90 0D     BCC bra_AC15_RTS
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x00AC18 02:AC08: A5 FC     LDA ram_scroll_Y
    CMP.B   tbl_ABC2(D2.L),D0  ; orig: C - - - - - 0x00AC1A 02:AC0A: D9 C2 AB  CMP tbl_ABC2,Y
    BCC     bra_AC15_RTS             ; BCC  ; orig: C - - - - - 0x00AC1D 02:AC0D: 90 06     BCC bra_AC15_RTS
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x00AC1F 02:AC0F: E6 13     INC ram_subscript
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x00AC21 02:AC11: A9 40     LDA #$40
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x00AC23 02:AC13: 85 28     STA ram_timer_link
bra_AC15_RTS:  ; orig: bra_AC15_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x00AC25 02:AC15: 60        RTS



tbl_AC16_ppu_address_hi:  ; orig: tbl_AC16_ppu_address_hi:
    DC.B    $28,$29,$2A,$2B,$20,$21,$22,$23,$28,$29,$2A,$2B



tbl_AC22:  ; orig: tbl_AC22:
    DC.B    $46,$10,$90,$84,$24,$30,$01,$48,$03,$25,$05,$40



tbl_AC2E_lo:  ; orig: tbl_AC2E_lo:
    DC.B    (_off003_AC5C_00&$FF),(_off003_AC65_01&$FF),(_off003_AC70_02&$FF),(_off003_AC88_03&$FF)
    DC.B    (_off003_ACA0_04&$FF),(_off003_ACB8_05&$FF),(_off003_ACC8_06&$FF),(_off003_ACE0_07&$FF)
    DC.B    (_off003_ACF8_08&$FF),(_off003_AD06_09&$FF),(_off003_AD14_0A&$FF),(_off003_AD1B_0B&$FF)
    DC.B    (_off003_AD33_0C&$FF),(_off003_AD4D_0D&$FF),(_off003_AD59_0E&$FF),(_off003_AD72_0F&$FF)
    DC.B    (_off003_AD82_10&$FF),(_off003_AD92_11&$FF),(_off003_ADA1_12&$FF),(_off003_ADB6_13&$FF)
    DC.B    (_off003_ADC9_14&$FF),(_off003_ADD1_15&$FF),(_off003_ADEA_16&$FF)



tbl_AC45_hi:  ; orig: tbl_AC45_hi:
    DC.B    ((_off003_AC5C_00>>8)&$FF),((_off003_AC65_01>>8)&$FF),((_off003_AC70_02>>8)&$FF),((_off003_AC88_03>>8)&$FF)
    DC.B    ((_off003_ACA0_04>>8)&$FF),((_off003_ACB8_05>>8)&$FF),((_off003_ACC8_06>>8)&$FF),((_off003_ACE0_07>>8)&$FF)
    DC.B    ((_off003_ACF8_08>>8)&$FF),((_off003_AD06_09>>8)&$FF),((_off003_AD14_0A>>8)&$FF),((_off003_AD1B_0B>>8)&$FF)
    DC.B    ((_off003_AD33_0C>>8)&$FF),((_off003_AD4D_0D>>8)&$FF),((_off003_AD59_0E>>8)&$FF),((_off003_AD72_0F>>8)&$FF)
    DC.B    ((_off003_AD82_10>>8)&$FF),((_off003_AD92_11>>8)&$FF),((_off003_ADA1_12>>8)&$FF),((_off003_ADB6_13>>8)&$FF)
    DC.B    ((_off003_ADC9_14>>8)&$FF),((_off003_ADD1_15>>8)&$FF),((_off003_ADEA_16>>8)&$FF)



_off003_AC5C_00:  ; orig: _off003_AC5C_00:
    DC.B    $07,$0D,$24,$1C,$1D,$0A,$0F,$0F,$24



_off003_AC65_01:  ; orig: _off003_AC65_01:
    DC.B    $09,$05,$0E,$21,$0E,$0C,$1E,$1D,$12,$1F,$0E



_off003_AC70_02:  ; orig: _off003_AC70_02:
    DC.B    $16,$05,$19,$1B,$18,$0D,$1E,$0C,$0E,$1B,$63,$63,$63,$24,$11,$63
    DC.B    $22,$0A,$16,$0A,$1E,$0C,$11,$12



_off003_AC88_03:  ; orig: _off003_AC88_03:
    DC.B    $16,$05,$19,$1B,$18,$0D,$1E,$0C,$0E,$1B,$63,$63,$63,$63,$24,$1C
    DC.B    $63,$16,$12,$22,$0A,$11,$18,$17



_off003_ACA0_04:  ; orig: _off003_ACA0_04:
    DC.B    $16,$05,$0D,$12,$1B,$0E,$0C,$1D,$18,$1B,$63,$63,$63,$63,$24,$1C
    DC.B    $63,$16,$12,$22,$0A,$11,$18,$17



_off003_ACB8_05:  ; orig: _off003_ACB8_05:
    DC.B    $0E,$0D,$63,$63,$63,$63,$63,$63,$24,$1D,$0E,$17,$24,$1D,$0E,$17



_off003_ACC8_06:  ; orig: _off003_ACC8_06:
    DC.B    $16,$05,$0D,$0E,$1C,$12,$10,$17,$0E,$1B,$63,$63,$63,$63,$63,$63
    DC.B    $24,$1D,$0E,$17,$24,$1D,$0E,$17



_off003_ACE0_07:  ; orig: _off003_ACE0_07:
    DC.B    $16,$05,$19,$1B,$18,$10,$1B,$0A,$16,$16,$0E,$1B,$63,$63,$24,$1D
    DC.B    $63,$17,$0A,$14,$0A,$23,$18,$18



_off003_ACF8_08:  ; orig: _off003_ACF8_08:
    DC.B    $0C,$0F,$63,$63,$63,$63,$63,$24,$22,$0A,$0C,$11,$0A,$17



_off003_AD06_09:  ; orig: _off003_AD06_09:
    DC.B    $0C,$0F,$63,$63,$63,$24,$16,$0A,$1B,$1E,$16,$0A,$1B,$1E



_off003_AD14_0A:  ; orig: _off003_AD14_0A:
    DC.B    $05,$05,$1C,$18,$1E,$17,$0D



_off003_AD1B_0B:  ; orig: _off003_AD1B_0B:
    DC.B    $16,$05,$0C,$18,$16,$19,$18,$1C,$0E,$1B,$63,$63,$63,$63,$63,$63
    DC.B    $24,$14,$18,$17,$0C,$11,$0A,$17



_off003_AD33_0C:  ; orig: _off003_AD33_0C:
    DC.B    $18,$04,$0A,$17,$18,$1D,$11,$0E,$1B,$24,$1A,$1E,$0E,$1C,$1D,$24
    DC.B    $20,$12,$15,$15,$24,$1C,$1D,$0A,$1B,$1D



_off003_AD4D_0D:  ; orig: _off003_AD4D_0D:
    DC.B    $0A,$0B,$0F,$1B,$18,$16,$24,$11,$0E,$1B,$0E,$2C



_off003_AD59_0E:  ; orig: _off003_AD59_0E:
    DC.B    $17,$05,$19,$1B,$0E,$1C,$1C,$24,$1D,$11,$0E,$24,$1C,$1D,$0A,$1B
    DC.B    $1D,$24,$0B,$1E,$1D,$1D,$18,$17,$2C



_off003_AD72_0F:  ; orig: _off003_AD72_0F:
    DC.B    $0E,$09,$FC,$01,$09,$08,$06,$24,$17,$12,$17,$1D,$0E,$17,$0D,$18



_off003_AD82_10:  ; orig: _off003_AD82_10:
    DC.B    $0E,$09,$22,$18,$1E,$24,$0A,$1B,$0E,$24,$10,$1B,$0E,$0A,$1D,$63



_off003_AD92_11:  ; orig: _off003_AD92_11:
    DC.B    $0D,$09,$24,$24,$24,$24,$24,$24,$24,$24,$24,$62,$24,$24,$24



_off003_ADA1_12:  ; orig: _off003_ADA1_12:
    DC.B    $13,$06,$22,$18,$1E,$24,$11,$0A,$1F,$0E,$24,$0A,$17,$24,$0A,$16
    DC.B    $0A,$23,$12,$17,$10



_off003_ADB6_13:  ; orig: _off003_ADB6_13:
    DC.B    $11,$08,$20,$12,$1C,$0D,$18,$16,$24,$0A,$17,$0D,$24,$19,$18,$20
    DC.B    $0E,$1B,$63



_off003_ADC9_14:  ; orig: _off003_ADC9_14:
    DC.B    $06,$0D,$0E,$17,$0D,$24,$18,$0F



_off003_ADD1_15:  ; orig: _off003_ADD1_15:
    DC.B    $17,$04,$2D,$1D,$11,$0E,$24,$15,$0E,$10,$0E,$17,$0D,$24,$18,$0F
    DC.B    $24,$23,$0E,$15,$0D,$0A,$24,$01,$2D



_off003_ADEA_16:  ; orig: _off003_ADEA_16:
    DC.B    $0E,$09,$FC,$01,$09,$08,$06,$24,$17,$12,$17,$1D,$0E,$17,$0D,$18



tbl_ADFA:  ; orig: tbl_ADFA:
    DC.B    $00,$AA,$FF,$FF,$55,$AA,$AA,$FF,$FF,$FF,$55,$00,$00,$00,$00,$00
    DC.B    $00,$00,$50,$00,$00,$00,$AA,$00,$00
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x00AE12 02:AE02: FF        .byte $FF   ; 08
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x00AE13 02:AE03: FF        .byte $FF   ; 09
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 1 - - - 0x00AE14 02:AE04: 55        .byte $55   ; 0A
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE15 02:AE05: 00        .byte $00   ; 0B
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE16 02:AE06: 00        .byte $00   ; 0C
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE17 02:AE07: 00        .byte $00   ; 0D
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE18 02:AE08: 00        .byte $00   ; 0E
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE19 02:AE09: 00        .byte $00   ; 0F
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1A 02:AE0A: 00        .byte $00   ; 10
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1B 02:AE0B: 00        .byte $00   ; 11
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1C 02:AE0C: 50        .byte $50   ; 12
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1D 02:AE0D: 00        .byte $00   ; 13
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1E 02:AE0E: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE1F 02:AE0F: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 1 - - - 0x00AE20 02:AE10: AA        .byte $AA   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x00AE21 02:AE11: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x00AE22 02:AE12: 00        .byte $00   ;



sub_AE13_print_final_credits:  ; orig: sub_AE13_print_final_credits:
    MOVE.B  #$1F,D2  ; orig: C - - - - - 0x00AE23 02:AE13: A0 1F     LDY #$1F
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x00AE25 02:AE15: A9 24     LDA #$24
bra_AE17_loop:  ; orig: bra_AE17_loop:
    LEA     (ram_0302_ppu_buffer+3).l,A0
    MOVE.B  D0,(A0,D2.W)  ; orig: C - - - - - 0x00AE27 02:AE17: 99 05 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AE2A 02:AE1A: 88        DEY
    BPL     bra_AE17_loop             ; BPL  ; orig: C - - - - - 0x00AE2B 02:AE1B: 10 FA     BPL bra_AE17_loop
    MOVE.B  ram_050A,D0  ; orig: C - - - - - 0x00AE2D 02:AE1D: AD 0A 05  LDA ram_050A
    BEQ     bra_AE3E             ; BEQ  ; orig: C - - - - - 0x00AE30 02:AE20: F0 1C     BEQ bra_AE3E
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x00AE32 02:AE22: C9 01     CMP #$01
    BEQ     bra_AE2C             ; BEQ  ; orig: C - - - - - 0x00AE34 02:AE24: F0 06     BEQ bra_AE2C
    CMPI.B  #$2E,D0  ; orig: C - - - - - 0x00AE36 02:AE26: C9 2E     CMP #$2E
    BCC     bra_AE36             ; BCC  ; orig: C - - - - - 0x00AE38 02:AE28: 90 0C     BCC bra_AE36
    BNE     bra_AE3E             ; BNE  ; orig: C - - - - - 0x00AE3A 02:AE2A: D0 12     BNE bra_AE3E
bra_AE2C:  ; orig: bra_AE2C:
    MOVE.B  #$19,D2  ; orig: C - - - - - 0x00AE3C 02:AE2C: A0 19     LDY #$19
    MOVE.B  #$FA,D0  ; orig: C - - - - - 0x00AE3E 02:AE2E: A9 FA     LDA #$FA
bra_AE30_loop:  ; orig: bra_AE30_loop:
    LEA     (ram_0302_ppu_buffer+6).l,A0
    MOVE.B  D0,(A0,D2.W)  ; orig: C - - - - - 0x00AE40 02:AE30: 99 08 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AE43 02:AE33: 88        DEY
    BPL     bra_AE30_loop             ; BPL  ; orig: C - - - - - 0x00AE44 02:AE34: 10 FA     BPL bra_AE30_loop
bra_AE36:  ; orig: bra_AE36:
    MOVE.B  #$FA,D0  ; orig: C - - - - - 0x00AE46 02:AE36: A9 FA     LDA #$FA
    MOVE.B  D0,ram_0302_ppu_buffer+6  ; orig: C - - - - - 0x00AE48 02:AE38: 8D 08 03  STA ram_0302_ppu_buf
    MOVE.B  D0,ram_0302_ppu_buffer+$1F  ; orig: C - - - - - 0x00AE4B 02:AE3B: 8D 21 03  STA ram_0302_ppu_buf
bra_AE3E:  ; orig: bra_AE3E:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x00AE4E 02:AE3E: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0302_ppu_buffer+$23  ; orig: C - - - - - 0x00AE50 02:AE40: 8D 25 03  STA ram_0302_ppu_buf
    MOVE.B  D0,ram_0302_ppu_buffer+$2E  ; orig: C - - - - - 0x00AE53 02:AE43: 8D 30 03  STA ram_0302_ppu_buf
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x00AE56 02:AE46: A9 20     LDA #$20
    MOVE.B  D0,ram_0302_ppu_buffer+2  ; orig: C - - - - - 0x00AE58 02:AE48: 8D 04 03  STA ram_0302_ppu_buf
    MOVE.B  ram_050C,D1  ; orig: C - - - - - 0x00AE5B 02:AE4B: AE 0C 05  LDX ram_050C
    MOVE.B  tbl_AC16_ppu_address_hi(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AE5E 02:AE4E: BD 16 AC  LDA tbl_AC16_ppu_add
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x00AE61 02:AE51: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  ram_050D,D0  ; orig: C - - - - - 0x00AE64 02:AE54: AD 0D 05  LDA ram_050D
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00AE67 02:AE57: A8        TAY

; * 20
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE68 02:AE58: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE69 02:AE59: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE6A 02:AE5A: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE6B 02:AE5B: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE6C 02:AE5C: 0A        ASL
    MOVE.B  D0,ram_0302_ppu_buffer+1  ; orig: C - - - - - 0x00AE6D 02:AE5D: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  tbl_AC22(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AE70 02:AE60: BD 22 AC  LDA tbl_AC22,X
bra_AE63_loop:  ; orig: bra_AE63_loop:
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AE73 02:AE63: 0A        ASL
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AE74 02:AE64: 88        DEY
    BPL     bra_AE63_loop             ; BPL  ; orig: C - - - - - 0x00AE75 02:AE65: 10 FC     BPL bra_AE63_loop
    BCC     bra_AEE2             ; BCC  ; orig: C - - - - - 0x00AE77 02:AE67: 90 79     BCC bra_AEE2
    MOVE.B  ram_050E_counter,D2  ; orig: C - - - - - 0x00AE79 02:AE69: AC 0E 05  LDY ram_050E_counter
    CMPI.B  #$17,D2  ; orig: C - - - - - 0x00AE7C 02:AE6C: C0 17     CPY #$17
    BCS     bra_AEE2             ; BCS  ; orig: C - - - - - 0x00AE7E 02:AE6E: B0 72     BCS bra_AEE2
    MOVE.B  ram_current_save_slot,D1  ; orig: C - - - - - 0x00AE80 02:AE70: A6 16     LDX ram_current_save
    MOVE.B  ram_current_quest(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AE82 02:AE72: BD 2D 06  LDA ram_current_ques
    BNE     bra_AE7B             ; BNE  ; orig: C - - - - - 0x00AE85 02:AE75: D0 04     BNE bra_AE7B    ; if

; if 1st quest
    CMPI.B  #$10,D2  ; orig: C - - - - - 0x00AE87 02:AE77: C0 10     CPY #$10
    BCS     bra_AEDF             ; BCS  ; orig: C - - - - - 0x00AE89 02:AE79: B0 64     BCS bra_AEDF
bra_AE7B:  ; orig: bra_AE7B:
    MOVE.B  ram_current_save_slot,D1  ; orig: C - - - - - 0x00AE8B 02:AE7B: A6 16     LDX ram_current_save
    MOVE.B  ram_current_quest(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AE8D 02:AE7D: BD 2D 06  LDA ram_current_ques
    BEQ     bra_AE8A             ; BEQ  ; orig: C - - - - - 0x00AE90 02:AE80: F0 08     BEQ bra_AE8A    ; if

; if 2nd quest
    CMPI.B  #$0C,D2  ; orig: C - - - - - 0x00AE92 02:AE82: C0 0C     CPY #$0C
    BCC     bra_AE8A             ; BCC  ; orig: C - - - - - 0x00AE94 02:AE84: 90 04     BCC bra_AE8A
    CMPI.B  #$10,D2  ; orig: C - - - - - 0x00AE96 02:AE86: C0 10     CPY #$10
    BCC     bra_AEDF             ; BCC  ; orig: C - - - - - 0x00AE98 02:AE88: 90 55     BCC bra_AEDF
bra_AE8A:  ; orig: bra_AE8A:
    MOVE.B  tbl_AC2E_lo(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AE9A 02:AE8A: B9 2E AC  LDA tbl_AC2E_lo,Y
    MOVE.B  D0,ram_0000_t1A_data  ; orig: C - - - - - 0x00AE9D 02:AE8D: 85 00     STA ram_0000_t1A_dat
    MOVE.B  tbl_AC45_hi(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AE9F 02:AE8F: B9 45 AC  LDA tbl_AC45_hi,Y
    MOVE.B  D0,ram_0000_t1A_data+1  ; orig: C - - - - - 0x00AEA2 02:AE92: 85 01     STA ram_0000_t1A_dat
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00AEA4 02:AE94: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_0000_t1A_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00AEA6 02:AE96: B1 00     LDA (ram_0000_t1A_da
    MOVE.B  D0,ram_0002_t22_loop_counter  ; orig: C - - - - - 0x00AEA8 02:AE98: 85 02     STA ram_0002_t22_loo
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AEAA 02:AE9A: C8        INY ; 01
    MOVEA.W ($FF0000+ram_0000_t1A_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00AEAB 02:AE9B: B1 00     LDA (ram_0000_t1A_da
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00AEAD 02:AE9D: AA        TAX
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AEAE 02:AE9E: C8        INY ; 02
bra_AE9F_loop:  ; orig: bra_AE9F_loop:
    MOVEA.W ($FF0000+ram_0000_t1A_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x00AEAF 02:AE9F: B1 00     LDA (ram_0000_t1A_da
    LEA     (ram_0302_ppu_buffer+3).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00AEB1 02:AEA1: 9D 05 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AEB4 02:AEA4: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00AEB5 02:AEA5: E8        INX
    SUBQ.B  #1,ram_0002_t22_loop_counter  ; orig: C - - - - - 0x00AEB6 02:AEA6: C6 02     DEC ram_0002_t22_loo
    BNE     bra_AE9F_loop             ; BNE  ; orig: C - - - - - 0x00AEB8 02:AEA8: D0 F5     BNE bra_AE9F_loop
    MOVE.B  ram_050E_counter,D2  ; orig: C - - - - - 0x00AEBA 02:AEAA: AC 0E 05  LDY ram_050E_counter
    CMPI.B  #$0C,D2  ; orig: C - - - - - 0x00AEBD 02:AEAD: C0 0C     CPY #$0C
    BCC     bra_AEDF             ; BCC  ; orig: C - - - - - 0x00AEBF 02:AEAF: 90 2E     BCC bra_AEDF
    CMPI.B  #$11,D2  ; orig: C - - - - - 0x00AEC1 02:AEB1: C0 11     CPY #$11
    BNE     bra_AEDF             ; BNE  ; orig: C - - - - - 0x00AEC3 02:AEB3: D0 2A     BNE bra_AEDF
    MOVE.B  ram_current_save_slot,D0  ; orig: C - - - - - 0x00AEC5 02:AEB5: A5 16     LDA ram_current_save

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AEC7 02:AEB7: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AEC8 02:AEB8: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AEC9 02:AEB9: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00AECA 02:AEBA: A8        TAY
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00AECB 02:AEBB: A2 00     LDX #$00
bra_AEBD_loop:  ; orig: bra_AEBD_loop:
    MOVE.B  ram_slot_name(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AECD 02:AEBD: B9 38 06  LDA ram_slot_name,Y
    LEA     (ram_0302_ppu_buffer+$0C).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00AED0 02:AEC0: 9D 0E 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AED3 02:AEC3: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00AED4 02:AEC4: E8        INX
    CMPI.B  #$08,D1  ; orig: C - - - - - 0x00AED5 02:AEC5: E0 08     CPX #$08
    BCC     bra_AEBD_loop             ; BCC  ; orig: C - - - - - 0x00AED7 02:AEC7: 90 F4     BCC bra_AEBD_loop
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00AED9 02:AEC9: AC 16 00  LDY a: ram_current_s
    MOVE.B  ram_death_cnt(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AEDC 02:AECC: B9 30 06  LDA ram_death_cnt,Y
    BSR     sub_bat_6E55_convert_to_decimal             ; JSR -> BSR  ; orig: C - - - - - 0x00AEDF 02:AECF: 20 55 6E  JSR sub_bat_6E55_con
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x00AEE2 02:AED2: A2 02     LDX #$02
bra_AED4_loop:  ; orig: bra_AED4_loop:
    MOVE.B  ram_0001_t04_decimal(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AEE4 02:AED4: B5 01     LDA ram_0001_t04_dec
    LEA     (ram_0302_ppu_buffer+$16).l,A0
    MOVE.B  D0,(A0,D1.W)  ; orig: C - - - - - 0x00AEE6 02:AED6: 9D 18 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00AEE9 02:AED9: CA        DEX
    BPL     bra_AED4_loop             ; BPL  ; orig: C - - - - - 0x00AEEA 02:AEDA: 10 F8     BPL bra_AED4_loop

; bzk optimize, useless LDY
    MOVE.B  ram_050E_counter,D2  ; orig: C - - - - - 0x00AEEC 02:AEDC: AC 0E 05  LDY ram_050E_counter
bra_AEDF:  ; orig: bra_AEDF:
    ADDQ.B  #1,ram_050E_counter  ; orig: C - - - - - 0x00AEEF 02:AEDF: EE 0E 05  INC ram_050E_counter
bra_AEE2:  ; orig: bra_AEE2:
    ADDQ.B  #1,ram_050D  ; orig: C - - - - - 0x00AEF2 02:AEE2: EE 0D 05  INC ram_050D
    MOVE.B  ram_050C,D0  ; orig: C - - - - - 0x00AEF5 02:AEE5: AD 0C 05  LDA ram_050C
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x00AEF8 02:AEE8: 29 03     AND #$03
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x00AEFA 02:AEEA: C9 03     CMP #$03
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x00AEFC 02:AEEC: A9 08     LDA #$08
    BCC     bra_AEF2             ; BCC  ; orig: C - - - - - 0x00AEFE 02:AEEE: 90 02     BCC bra_AEF2
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x00AF00 02:AEF0: A9 06     LDA #$06
bra_AEF2:  ; orig: bra_AEF2:
    CMP.B   ram_050D,D0  ; orig: C - - - - - 0x00AF02 02:AEF2: CD 0D 05  CMP ram_050D
    BNE     bra_AF08             ; BNE  ; orig: C - - - - - 0x00AF05 02:AEF5: D0 11     BNE bra_AF08
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00AF07 02:AEF7: A9 00     LDA #$00
    MOVE.B  D0,ram_050D  ; orig: C - - - - - 0x00AF09 02:AEF9: 8D 0D 05  STA ram_050D
    MOVE.B  ram_050C,D2  ; orig: C - - - - - 0x00AF0C 02:AEFC: AC 0C 05  LDY ram_050C
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AF0F 02:AEFF: C8        INY
    CMPI.B  #$0C,D2  ; orig: C - - - - - 0x00AF10 02:AF00: C0 0C     CPY #$0C
    BCC     bra_AF05             ; BCC  ; orig: C - - - - - 0x00AF12 02:AF02: 90 01     BCC bra_AF05
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00AF14 02:AF04: A8        TAY
bra_AF05:  ; orig: bra_AF05:
    MOVE.B  D2,ram_050C  ; orig: C - - - - - 0x00AF15 02:AF05: 8C 0C 05  STY ram_050C
bra_AF08:  ; orig: bra_AF08:
    MOVE.B  ram_050A,D0  ; orig: C - - - - - 0x00AF18 02:AF08: AD 0A 05  LDA ram_050A
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00AF1B 02:AF0B: 4A        LSR
    BCS     bra_AF43             ; BCS  ; orig: C - - - - - 0x00AF1C 02:AF0C: B0 35     BCS bra_AF43
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x00AF1E 02:AF0E: 4A        LSR
    BCS     bra_AF43             ; BCS  ; orig: C - - - - - 0x00AF1F 02:AF0F: B0 32     BCS bra_AF43
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x00AF21 02:AF11: A2 00     LDX #$00
    MOVE.B  D1,ram_0302_ppu_buffer+$26  ; orig: C - - - - - 0x00AF23 02:AF13: 8E 28 03  STX ram_0302_ppu_buf
    MOVE.B  D1,ram_0302_ppu_buffer+$2D  ; orig: C - - - - - 0x00AF26 02:AF16: 8E 2F 03  STX ram_0302_ppu_buf
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x00AF29 02:AF19: A8        TAY
    MOVE.B  tbl_ADFA(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x00AF2A 02:AF1A: B9 FA AD  LDA tbl_ADFA,Y
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x00AF2D 02:AF1D: A0 05     LDY #$05
bra_AF1F_loop:  ; orig: bra_AF1F_loop:
    LEA     (ram_0302_ppu_buffer+$27).l,A0
    MOVE.B  D0,(A0,D2.W)  ; orig: C - - - - - 0x00AF2F 02:AF1F: 99 29 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AF32 02:AF22: 88        DEY
    BPL     bra_AF1F_loop             ; BPL  ; orig: C - - - - - 0x00AF33 02:AF23: 10 FA     BPL bra_AF1F_loop
    MOVE.B  #$23,D2  ; orig: C - - - - - 0x00AF35 02:AF25: A0 23     LDY #$23
    MOVE.B  ram_0302_ppu_buffer,D0  ; orig: C - - - - - 0x00AF37 02:AF27: AD 02 03  LDA ram_0302_ppu_buf
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x00AF3A 02:AF2A: 29 08     AND #$08
    BEQ     bra_AF30             ; BEQ  ; orig: C - - - - - 0x00AF3C 02:AF2C: F0 02     BEQ bra_AF30
    MOVE.B  #$2B,D2  ; orig: C - - - - - 0x00AF3E 02:AF2E: A0 2B     LDY #$2B
bra_AF30:  ; orig: bra_AF30:
    MOVE.B  D2,ram_0302_ppu_buffer+$23  ; orig: C - - - - - 0x00AF40 02:AF30: 8C 25 03  STY ram_0302_ppu_buf
    MOVE.B  ram_050A,D0  ; orig: C - - - - - 0x00AF43 02:AF33: AD 0A 05  LDA ram_050A
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x00AF46 02:AF36: 29 1F     AND #$1F
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00AF48 02:AF38: 0A        ASL
    ADDX.B  #$C0,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00AF49 02:AF39: 69 C0     ADC #$C0
    MOVE.B  D0,ram_0302_ppu_buffer+$24  ; orig: C - - - - - 0x00AF4B 02:AF3B: 8D 26 03  STA ram_0302_ppu_buf
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x00AF4E 02:AF3E: A9 08     LDA #$08
    MOVE.B  D0,ram_0302_ppu_buffer+$25  ; orig: C - - - - - 0x00AF50 02:AF40: 8D 27 03  STA ram_0302_ppu_buf
bra_AF43:  ; orig: bra_AF43:
    MOVE.B  ram_050A,D2  ; orig: C - - - - - 0x00AF53 02:AF43: AC 0A 05  LDY ram_050A
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AF56 02:AF46: C8        INY
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x00AF57 02:AF47: 98        TYA
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x00AF58 02:AF48: 29 1F     AND #$1F
    CMPI.B  #$1E,D0  ; orig: C - - - - - 0x00AF5A 02:AF4A: C9 1E     CMP #$1E
    BCC     bra_AF50             ; BCC  ; orig: C - - - - - 0x00AF5C 02:AF4C: 90 02     BCC bra_AF50
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AF5E 02:AF4E: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x00AF5F 02:AF4F: C8        INY
bra_AF50:  ; orig: bra_AF50:
    MOVE.B  D2,ram_050A  ; orig: C - - - - - 0x00AF60 02:AF50: 8C 0A 05  STY ram_050A
    RTS                     ; RTS  ; orig: C - - - - - 0x00AF63 02:AF53: 60        RTS



tbl_AF54:  ; orig: tbl_AF54:
    ; [DIRECTIVE] .WORD ram_067F  -- needs manual handling  ; orig: - D 1 - - - 0x00AF64 02:AF54: 7F 06     .word ram_067F  ; cl
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 1 - - - 0x00AF66 02:AF56: FF 06     .word ram_06FF  ; cl
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 1 - - - 0x00AF68 02:AF58: 7F 07     .word ram_077F  ; cl



loc_AF5A_clear_0657_07FE:  ; orig: loc_AF5A_clear_0657_07FE:
    MOVE.B  #$04,D1  ; orig: C D 1 - - - 0x00AF6A 02:AF5A: A2 04     LDX #$04
bra_AF5C_loop:
; clear 067F-07FE
    MOVE.B  tbl_AF54(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x00AF6C 02:AF5C: BD 54 AF  LDA tbl_AF54,X
    MOVE.B  D0,ram_0000_t00_data  ; orig: C - - - - - 0x00AF6F 02:AF5F: 85 00     STA ram_0000_t00_dat
    ; (empty translation for LDA)  ; orig: C - - - - - 0x00AF71 02:AF61: BD 55 AF  LDA tbl_AF54 + $01,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x00AF74 02:AF64: 85 01     STA ram_0000_t00_dat
    MOVE.B  #$7F,D2  ; orig: C - - - - - 0x00AF76 02:AF66: A0 7F     LDY #$7F
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x00AF78 02:AF68: A9 00     LDA #$00
bra_AF6A_loop:  ; orig: bra_AF6A_loop:
    MOVEA.W ($FF0000+ram_0000_t00_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x00AF7A 02:AF6A: 91 00     STA (ram_0000_t00_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AF7C 02:AF6C: 88        DEY
    BPL     bra_AF6A_loop             ; BPL  ; orig: C - - - - - 0x00AF7D 02:AF6D: 10 FB     BPL bra_AF6A_loop
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00AF7F 02:AF6F: CA        DEX
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x00AF80 02:AF70: CA        DEX
    BPL     bra_AF5C_loop             ; BPL  ; orig: C - - - - - 0x00AF81 02:AF71: 10 E9     BPL bra_AF5C_loop
    MOVE.B  #$27,D2  ; orig: C - - - - - 0x00AF83 02:AF73: A0 27     LDY #$27
bra_AF75_loop:
; clear items 0657-067E
    MOVE.B  D0,ram_items(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00AF85 02:AF75: 99 57 06  STA ram_items,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x00AF88 02:AF78: 88        DEY
    BPL     bra_AF75_loop             ; BPL  ; orig: C - - - - - 0x00AF89 02:AF79: 10 FA     BPL bra_AF75_loop
    MOVE.B  #$22,D0  ; orig: C - - - - - 0x00AF8B 02:AF7B: A9 22     LDA #$22
    MOVE.B  D0,ram_item_hearts  ; orig: C - - - - - 0x00AF8D 02:AF7D: 8D 6F 06  STA ram_item_hearts
    ; (empty translation for DEC)  ; orig: C - - - - - 0x00AF90 02:AF80: CE 70 06  DEC ram_item_hearts 
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x00AF93 02:AF83: A9 08     LDA #$08
    MOVE.B  D0,ram_item_max_bombs  ; orig: C - - - - - 0x00AF95 02:AF85: 8D 7C 06  STA ram_item_max_bom
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x00AF98 02:AF88: A4 16     LDY ram_current_save
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x00AF9A 02:AF8A: A9 01     LDA #$01
    MOVE.B  D0,ram_current_quest(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x00AF9C 02:AF8C: 99 2D 06  STA ram_current_ques
    RTS                     ; RTS  ; orig: C - - - - - 0x00AF9F 02:AF8F: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFA0 02:AF90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFB0 02:AFA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFC0 02:AFB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFD0 02:AFC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFE0 02:AFD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00AFF0 02:AFE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B000 02:AFF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B010 02:B000: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B020 02:B010: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B030 02:B020: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B040 02:B030: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B050 02:B040: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B060 02:B050: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B070 02:B060: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B080 02:B070: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B090 02:B080: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0A0 02:B090: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0B0 02:B0A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0C0 02:B0B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0D0 02:B0C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0E0 02:B0D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B0F0 02:B0E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B100 02:B0F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B110 02:B100: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B120 02:B110: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B130 02:B120: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B140 02:B130: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B150 02:B140: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B160 02:B150: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B170 02:B160: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B180 02:B170: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B190 02:B180: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1A0 02:B190: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1B0 02:B1A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1C0 02:B1B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1D0 02:B1C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1E0 02:B1D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B1F0 02:B1E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B200 02:B1F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B210 02:B200: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B220 02:B210: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B230 02:B220: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B240 02:B230: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B250 02:B240: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B260 02:B250: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B270 02:B260: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B280 02:B270: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B290 02:B280: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2A0 02:B290: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2B0 02:B2A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2C0 02:B2B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2D0 02:B2C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2E0 02:B2D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B2F0 02:B2E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B300 02:B2F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B310 02:B300: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B320 02:B310: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B330 02:B320: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B340 02:B330: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B350 02:B340: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B360 02:B350: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B370 02:B360: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B380 02:B370: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B390 02:B380: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3A0 02:B390: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3B0 02:B3A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3C0 02:B3B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3D0 02:B3C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3E0 02:B3D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B3F0 02:B3E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B400 02:B3F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B410 02:B400: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B420 02:B410: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B430 02:B420: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B440 02:B430: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B450 02:B440: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B460 02:B450: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B470 02:B460: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B480 02:B470: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B490 02:B480: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4A0 02:B490: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4B0 02:B4A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4C0 02:B4B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4D0 02:B4C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4E0 02:B4D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B4F0 02:B4E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B500 02:B4F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B510 02:B500: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B520 02:B510: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B530 02:B520: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B540 02:B530: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B550 02:B540: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B560 02:B550: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B570 02:B560: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B580 02:B570: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B590 02:B580: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5A0 02:B590: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5B0 02:B5A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5C0 02:B5B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5D0 02:B5C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5E0 02:B5D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B5F0 02:B5E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B600 02:B5F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B610 02:B600: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B620 02:B610: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B630 02:B620: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B640 02:B630: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B650 02:B640: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B660 02:B650: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B670 02:B660: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B680 02:B670: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B690 02:B680: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6A0 02:B690: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6B0 02:B6A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6C0 02:B6B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6D0 02:B6C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6E0 02:B6D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B6F0 02:B6E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B700 02:B6F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B710 02:B700: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B720 02:B710: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B730 02:B720: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B740 02:B730: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B750 02:B740: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B760 02:B750: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B770 02:B760: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B780 02:B770: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B790 02:B780: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7A0 02:B790: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7B0 02:B7A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7C0 02:B7B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7D0 02:B7C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7E0 02:B7D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B7F0 02:B7E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B800 02:B7F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B810 02:B800: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B820 02:B810: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B830 02:B820: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B840 02:B830: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B850 02:B840: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B860 02:B850: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B870 02:B860: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B880 02:B870: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B890 02:B880: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8A0 02:B890: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8B0 02:B8A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8C0 02:B8B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8D0 02:B8C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8E0 02:B8D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B8F0 02:B8E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B900 02:B8F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B910 02:B900: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B920 02:B910: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B930 02:B920: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B940 02:B930: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B950 02:B940: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B960 02:B950: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B970 02:B960: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B980 02:B970: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B990 02:B980: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9A0 02:B990: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9B0 02:B9A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9C0 02:B9B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9D0 02:B9C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9E0 02:B9D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00B9F0 02:B9E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA00 02:B9F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA10 02:BA00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA20 02:BA10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA30 02:BA20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA40 02:BA30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA50 02:BA40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA60 02:BA50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA70 02:BA60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA80 02:BA70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BA90 02:BA80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAA0 02:BA90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAB0 02:BAA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAC0 02:BAB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAD0 02:BAC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAE0 02:BAD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BAF0 02:BAE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB00 02:BAF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB10 02:BB00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB20 02:BB10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB30 02:BB20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB40 02:BB30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB50 02:BB40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB60 02:BB50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB70 02:BB60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB80 02:BB70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BB90 02:BB80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBA0 02:BB90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBB0 02:BBA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBC0 02:BBB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBD0 02:BBC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBE0 02:BBD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BBF0 02:BBE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC00 02:BBF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC10 02:BC00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC20 02:BC10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC30 02:BC20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC40 02:BC30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC50 02:BC40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC60 02:BC50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC70 02:BC60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC80 02:BC70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BC90 02:BC80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCA0 02:BC90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCB0 02:BCA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCC0 02:BCB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCD0 02:BCC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCE0 02:BCD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BCF0 02:BCE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD00 02:BCF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD10 02:BD00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD20 02:BD10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD30 02:BD20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD40 02:BD30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD50 02:BD40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD60 02:BD50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD70 02:BD60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD80 02:BD70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BD90 02:BD80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDA0 02:BD90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDB0 02:BDA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDC0 02:BDB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDD0 02:BDC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDE0 02:BDD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BDF0 02:BDE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE00 02:BDF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE10 02:BE00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE20 02:BE10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE30 02:BE20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE40 02:BE30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE50 02:BE40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE60 02:BE50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE70 02:BE60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE80 02:BE70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BE90 02:BE80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BEA0 02:BE90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BEB0 02:BEA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BEC0 02:BEB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BED0 02:BEC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BEE0 02:BED0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BEF0 02:BEE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF00 02:BEF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF10 02:BF00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF20 02:BF10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF30 02:BF20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF40 02:BF30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00BF50 02:BF40: FF        .byte $FF, $FF, $FF,



    ; [DIRECTIVE] .SEGMENT "BANK_02i"  -- needs manual handling  ; orig: .segment "BANK_02i"
    ; [DIRECTIVE] .INCLUDE "copy_bank___BF50_BFF9.asm"  -- needs manual handling  ; orig: .include "copy_bank___BF50_BFF9.asm"



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank 02: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))  ; orig: .out .sprintf("Free bytes in bank 02: 0x%04X [%d]", ($BFFA -



    ; [DIRECTIVE] .SEGMENT "VECTORS_02"  -- needs manual handling  ; orig: .segment "VECTORS_02"
    ; [DIRECTIVE] .WORD vec_0x01E494_NMI  -- needs manual handling  ; orig: - - - - - - 0x00C00A 02:BFFA: 84 E4     .word vec_0x01E494_N
    ; [DIRECTIVE] .WORD vec_inc_0x003F60_RESET  -- needs manual handling  ; orig: - - - - - - 0x00C00C 02:BFFC: 50 BF     .word vec_inc_0x003F
    ; [DIRECTIVE] .WORD $BFF0  -- needs manual handling  ; orig: - - - - - - 0x00C00E 02:BFFE: F0 BF     .word $BFF0 ; this g

; ── Translation Stats ──
; Translated:  2220
; Warnings:    1480
; Unknown:     23
