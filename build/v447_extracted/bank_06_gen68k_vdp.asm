; ═══════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; ── VDP Layer included via vdp_layer.asm ──
; Run: include "vdp_layer.asm" in your main build

; Source: bank_06.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_06"  -- needs manual handling  ; orig: .segment "BANK_06"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $8000  -- needs manual handling  ; orig: .org $8000  ; for listing file

; 0x018010-0x019CE7


; !! bzk .org control commands here

; take them into account when making

; changes inside this file



    ; [DIRECTIVE] .EXPORT loc_0x01804E  -- needs manual handling  ; orig: .export loc_0x01804E
    ; [DIRECTIVE] .EXPORT sub_0x01809C  -- needs manual handling  ; orig: .export sub_0x01809C
    ; [DIRECTIVE] .EXPORT sub_0x018119  -- needs manual handling  ; orig: .export sub_0x018119
    ; [DIRECTIVE] .EXPORT sub_0x01A090_write_buffer_to_ppu  -- needs manual handling  ; orig: .export sub_0x01A090_writ



tbl_8000_1st_quest:  ; orig: tbl_8000_1st_quest:
    DC.B    $00,$84,$00,$87,$00,$87,$00,$87,$00,$87
    DC.B    $00,$87,$00,$87,$00,$8A,$00,$8A,$00,$8A



tbl_8014:  ; orig: tbl_8014:
    DC.B    $00,$93,$FC,$93,$F8,$94,$F4,$95,$F0,$96
    DC.B    $EC,$97,$E8,$98,$E4,$99,$E0,$9A,$DC,$9B



tbl_8028_bat_table_location:  ; orig: tbl_8028_bat_table_location:
    DC.B    $D8,$9C



tbl_802A_2nd_quest:  ; orig: tbl_802A_2nd_quest:
    DC.B    $00,$84,$00,$8D,$00,$8D,$00,$8D,$00,$8D
    DC.B    $00,$8D,$00,$8D,$00,$90,$00,$90,$00,$90



tbl_b06_8000_1st_quest_real:
    DC.L    _off009_8400_00
    DC.L    _off009_8700_01
    DC.L    _off009_8700_02
    DC.L    _off009_8700_03
    DC.L    _off009_8700_04
    DC.L    _off009_8700_05
    DC.L    _off009_8700_06
    DC.L    _off009_8A00_07
    DC.L    _off009_8A00_08
    DC.L    _off009_8A00_09



tbl_b06_8014_real:
    DC.L    _off010_9300_00
    DC.L    _off010_93FC_01
    DC.L    _off010_94F8_02
    DC.L    _off010_95F4_03
    DC.L    _off010_96F0_04
    DC.L    _off010_97EC_05
    DC.L    _off010_98E8_06
    DC.L    _off010_99E4_07
    DC.L    _off010_9AE0_08
    DC.L    _off010_9BDC_09



tbl_b06_802A_2nd_quest_real:
    DC.L    _off011_8400_00
    DC.L    _off011_8D00_01
    DC.L    _off011_8D00_02
    DC.L    _off011_8D00_03
    DC.L    _off011_8D00_04
    DC.L    _off011_8D00_05
    DC.L    _off011_8D00_06
    DC.L    _off011_9000_07
    DC.L    _off011_9000_08
    DC.L    _off011_9000_09



loc_0x01804E:  ; orig: loc_0x01804E:
    MOVE.B  ram_subscript,D0  ; orig: C D 0 - - - 0x01804E 06:803E: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x018050 06:8040: 20 
    DC.L    ofs_027_8047_00   ; FIX v364: dispatch DC.L; NES .word subscript=0  ; orig: 06:8043: 47 80
    DC.L    ofs_027_8070_01   ; FIX v364: dispatch DC.L; NES .word subscript=1  ; orig: 06:8045: 70 80



ofs_027_8047_00:  ; orig: ofs_027_8047_00:
    MOVEQ   #$00,D1
    MOVE.B  ram_dungeon_level,D1  ; orig: C - - J - - 0x018057 06:8047: A5 10     LDA ram_dungeon_leve
    LSL.W   #2,D1
    MOVEQ   #$00,D2
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x01805B 06:804B: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    MOVE.B  (A0,D2.L),D0

    BNE     b06_bra_b06_805E_2nd_quest_real

; if 1st quest
    LEA     tbl_b06_8000_1st_quest_real(PC),A0
    MOVEA.L (A0,D1.W),A1
    BRA     b06_bra_b06_8067_copy_room_blob
b06_bra_b06_805E_2nd_quest_real:
    LEA     tbl_b06_802A_2nd_quest_real(PC),A0
    MOVEA.L (A0,D1.W),A1
b06_bra_b06_8067_copy_room_blob:
    BSR     sub_b06_copy_rom_to_687E_6B7D
    ADDQ.B  #1,ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x01807F 06:806F: 60        RTS



ofs_027_8070_01:  ; orig: ofs_027_8070_01:
    MOVEQ   #$00,D1
    MOVE.B  ram_dungeon_level,D1  ; orig: C - - J - - 0x018080 06:8070: A5 10     LDA ram_dungeon_leve
    LSL.W   #2,D1
    LEA     tbl_b06_8014_real(PC),A0
    MOVEA.L (A0,D1.W),A1
    BSR     sub_b06_copy_rom_to_6B7E_6C7D
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x018095 06:8085: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x018097 06:8087: 85 13     STA ram_subscript
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x018099 06:8089: E6 11     INC ram_0011_screen_
    RTS                     ; RTS  ; orig: C - - - - - 0x01809B 06:808B: 60        RTS



sub_0x01809C:  ; orig: sub_0x01809C:
    MOVE.W  #$0460,D0
    BSR     TRACE_MARK
    BSR     sub_b06_copy_bank_s1_bat_import
    MOVE.W  #$0461,D0
    BSR     TRACE_MARK
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0180AF 06:809F: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0180B1 06:80A1: 85 13     STA ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x0180B3 06:80A3: 60        RTS



sub_b06_copy_rom_to_687E_6B7D:
    LEA     ($FF687E).l,A0
    MOVE.W  #$0300-1,D7
b06_bra_b06_copy_rom_to_687E_loop:
    MOVE.B  (A1)+,(A0)+
    DBRA    D7,b06_bra_b06_copy_rom_to_687E_loop
    RTS



sub_b06_copy_rom_to_6B7E_6C7D:
    LEA     ($FF6B7E).l,A0
    MOVE.W  #$0100-1,D7
b06_bra_b06_copy_rom_to_6B7E_loop:
    MOVE.B  (A1)+,(A0)+
    DBRA    D7,b06_bra_b06_copy_rom_to_6B7E_loop
    RTS



sub_80A4_set_copy_range_687E_6B7D:  ; orig: sub_80A4_set_copy_range_687E_6B7D:

; out

; ram_0002_t06_copy_data_into

; ram_0004_t08_max_addr_lo

; ram_0005_t01_max_addr_hi
    ; [DIRECTIVE] .SCOPE   -- needs manual handling  ; orig: .scope
    ; !! UNKNOWN: TMP_COPY_START = ram_687E_map_data  ; orig: tmp_copy_start = ram_687E_map_data
    ; !! UNKNOWN: TMP_COPY_END = ram_687E_map_data + $300 - $01  ; orig: tmp_copy_end   = ram_687E_map_data + $300 - $0
    MOVE.B  #$7E,D0  ; orig: C - - - - - 0x0180B4 06:80A4: A9 7E     LDA #$7E
    MOVE.B  D0,ram_0002_t06_copy_data_into  ; orig: C - - - - - 0x0180B6 06:80A6: 85 02     STA ram_0002_t06_cop
    MOVE.B  #$68,D0  ; orig: C - - - - - 0x0180B8 06:80A8: A9 68     LDA #$68
    MOVE.B  D0,$FF0003  ; FIX v378: STA $03  ; orig: C - - - - - 0x0180BA 06:80AA: 85 03  STA ram_0002_t06_cop
    MOVE.B  #$7D,D0  ; orig: C - - - - - 0x0180BC 06:80AC: A9 7D     LDA #$7D
    MOVE.B  D0,ram_0004_t08_max_addr_lo  ; orig: C - - - - - 0x0180BE 06:80AE: 85 04     STA ram_0004_t08_max
    MOVE.B  #$6B,D0  ; orig: C - - - - - 0x0180C0 06:80B0: A9 6B     LDA #$6B
    MOVE.B  D0,ram_0005_t01_max_addr_hi  ; orig: C - - - - - 0x0180C2 06:80B2: 85 05     STA ram_0005_t01_max
    RTS                     ; RTS  ; orig: C - - - - - 0x0180C4 06:80B4: 60        RTS
    ; [DIRECTIVE] .ENDSCOPE   -- needs manual handling  ; orig: .endscope



sub_80B5_set_copy_range_6B7E_6C7D:  ; orig: sub_80B5_set_copy_range_6B7E_6C7D:

; out

; ram_0002_t06_copy_data_into

; ram_0004_t08_max_addr_lo

; ram_0005_t01_max_addr_hi
    ; [DIRECTIVE] .SCOPE   -- needs manual handling  ; orig: .scope
    ; !! UNKNOWN: TMP_COPY_START = ram_6B7E_palette_buffer  ; orig: tmp_copy_start = ram_6B7E_palette_buffer
    ; !! UNKNOWN: TMP_COPY_END = ram_6B7E_palette_buffer + $100 - $01  ; orig: tmp_copy_end   = ram_6B7E_palette_buffer
    MOVE.B  #$7E,D0  ; orig: C - - - - - 0x0180C5 06:80B5: A9 7E     LDA #$7E
    MOVE.B  D0,ram_0002_t06_copy_data_into  ; orig: C - - - - - 0x0180C7 06:80B7: 85 02     STA ram_0002_t06_cop
    MOVE.B  #$6B,D0  ; orig: C - - - - - 0x0180C9 06:80B9: A9 6B     LDA #$6B
    MOVE.B  D0,$FF0003  ; FIX v378: STA $03  ; orig: C - - - - - 0x0180CB 06:80BB: 85 03  STA ram_0002_t06_cop
    MOVE.B  #$7D,D0  ; orig: C - - - - - 0x0180CD 06:80BD: A9 7D     LDA #$7D
    MOVE.B  D0,ram_0004_t08_max_addr_lo  ; orig: C - - - - - 0x0180CF 06:80BF: 85 04     STA ram_0004_t08_max
    MOVE.B  #$6C,D0  ; orig: C - - - - - 0x0180D1 06:80C1: A9 6C     LDA #$6C
    MOVE.B  D0,ram_0005_t01_max_addr_hi  ; orig: C - - - - - 0x0180D3 06:80C3: 85 05     STA ram_0005_t01_max
    RTS                     ; RTS  ; orig: C - - - - - 0x0180D5 06:80C5: 60        RTS
    ; [DIRECTIVE] .ENDSCOPE   -- needs manual handling  ; orig: .endscope



sub_80C6:  ; orig: sub_80C6:

; out

; ram_0002_t06_copy_data_into

; ram_0004_t08_max_addr_lo

; ram_0005_t01_max_addr_hi
    MOVE.B  #$F0,D0  ; orig: C - - - - - 0x0180D6 06:80C6: A9 F0     LDA #$F0
    MOVE.B  D0,ram_0002_t06_copy_data_into  ; orig: C - - - - - 0x0180D8 06:80C8: 85 02     STA ram_0002_t06_cop
    MOVE.B  #$67,D0  ; orig: C - - - - - 0x0180DA 06:80CA: A9 67     LDA #$67
    MOVE.B  D0,$FF0003  ; FIX v378: STA $03  ; orig: C - - - - - 0x0180DC 06:80CC: 85 03  STA ram_0002_t06_cop
    MOVE.B  #$7D,D0  ; orig: C - - - - - 0x0180DE 06:80CE: A9 7D     LDA #$7D
    MOVE.B  D0,ram_0004_t08_max_addr_lo  ; orig: C - - - - - 0x0180E0 06:80D0: 85 04     STA ram_0004_t08_max
    MOVE.B  #$68,D0  ; orig: C - - - - - 0x0180E2 06:80D2: A9 68     LDA #$68
    MOVE.B  D0,ram_0005_t01_max_addr_hi  ; orig: C - - - - - 0x0180E4 06:80D4: 85 05     STA ram_0005_t01_max
    RTS                     ; RTS  ; orig: C - - - - - 0x0180E6 06:80D6: 60        RTS



sub_80D7_copy_bat_table_to_bat:  ; orig: sub_80D7_copy_bat_table_to_bat:

; in

; ram_0000_t09_copy_data_from

; ram_0002_t06_copy_data_into

; ram_0004_t08_max_addr_lo

; ram_0005_t01_max_addr_hi
    LEA     ($FF0000).l,A0
loc_80D9_loop:  ; orig: loc_80D9_loop:
    MOVEQ   #$00,D0
    MOVEQ   #$00,D1
    MOVE.B  $FF0001,D1        ; source ptr hi byte
    LSL.W   #8,D1
    MOVE.B  ram_0000_t09_copy_data_from,D0
    OR.W    D1,D0
    MOVE.B  (A0,D0.W),D2

    MOVEQ   #$00,D0
    MOVEQ   #$00,D1
    MOVE.B  $FF0003,D1        ; dest ptr hi byte
    LSL.W   #8,D1
    MOVE.B  ram_0002_t06_copy_data_into,D0
    OR.W    D1,D0
    MOVE.B  D2,(A0,D0.W)

    MOVE.B  ram_0002_t06_copy_data_into,D0  ; orig: C - - - - - 0x0180ED 06:80DD: A5 02     LDA ram_0002_t06_cop
    CMP.B   ram_0004_t08_max_addr_lo,D0     ; orig: C - - - - - 0x0180EF 06:80DF: C5 04     CMP ram_0004_t08_max
    BNE     b06_bra_80EC_not_finished           ; orig: C - - - - - 0x0180F1 06:80E1: D0 09     BNE bra_80EC_not_fin
    MOVE.B  $FF0003,D0                      ; orig: C - - - - - 0x0180F3 06:80E3: A5 03     LDA ram_0002_t06_cop
    CMP.B   ram_0005_t01_max_addr_hi,D0     ; orig: C - - - - - 0x0180F5 06:80E5: C5 05     CMP ram_0005_t01_max
    BNE     b06_bra_80EC_not_finished           ; orig: C - - - - - 0x0180F7 06:80E7: D0 03     BNE bra_80EC_not_fin
    ADDQ.B  #1,ram_subscript                ; orig: C - - - - - 0x0180F9 06:80E9: E6 13     INC ram_subscript
    RTS                                     ; orig: C - - - - - 0x0180FB 06:80EB: 60        RTS
b06_bra_80EC_not_finished:  ; orig: b06_bra_80EC_not_finished:

    ADDQ.B  #1,ram_0002_t06_copy_data_into
    BNE     b06_bra_80F4_dest_hi_done
    ADDQ.B  #1,$FF0003
b06_bra_80F4_dest_hi_done:
    ADDQ.B  #1,ram_0000_t09_copy_data_from
    BNE     b06_bra_80FE_src_hi_done
    ADDQ.B  #1,$FF0001
b06_bra_80FE_src_hi_done:
    JMP     loc_80D9_loop                   ; orig: C - - - - - 0x018116 06:8106: 4C D9 80  JMP loc_80D9_loop



sub_b06_copy_bank_s1_bat_import:
    LEA     ofs_bat_67F0_bank_s1_asm_import(PC),A0
    LEA     ($FF67F0).l,A1
    MOVE.W  #$008E-1,D7
b06_bra_b06_copy_bank_s1_bat_loop:
    MOVE.B  (A0)+,(A1)+
    DBRA    D7,b06_bra_b06_copy_bank_s1_bat_loop
    RTS



sub_0x018119:  ; orig: sub_0x018119:
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x018119 06:8109: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    MOVE.B  (A0,D2.L),D0

    BEQ     b06_bra_812C_RTS             ; BEQ  ; orig: C - - - - - 0x01811E 06:810E: F0 1C     BEQ b06_bra_812C_RTS

; if 2nd quest
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x018120 06:8110: A5 10     LDA ram_dungeon_leve
    BEQ     b06_bra_812D             ; BEQ  ; orig: C - - - - - 0x018122 06:8112: F0 19     BEQ b06_bra_812D    ; if

; if dungeon
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x018124 06:8114: AA        TAX
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x018125 06:8115: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x018126 06:8116: A8        TAY
    MOVEA.L #$FF83A2,A0  ; FIX v378: LDA $83A2,Y base
    MOVE.B  (A0,D2.L),D0  ; orig: C - - - - - 0x018127 06:8117: B9 A2 83  LDA tbl_83A4 - $02,Y
    MOVE.B  D0,ram_0000_t08_data  ; orig: C - - - - - 0x01812A 06:811A: 85 00     STA ram_0000_t08_dat
    MOVEA.L #$FF83A3,A0  ; FIX v378: LDA $83A3,Y base
    MOVE.B  (A0,D2.L),D0  ; orig: C - - - - - 0x01812C 06:811C: B9 A3 83  LDA tbl_83A4 - $01,Y
    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x01812F 06:811F: 85 01  STA ram_0000_t08_dat
    MOVEA.L #$FF83B5,A0  ; FIX v378: LDY $83B5,X base
    MOVE.B  (A0,D1.L),D2  ; orig: C - - - - - 0x018131 06:8121: BC B5 83  LDY tbl_83B6_data_si
b06_bra_8124_loop:  ; orig: b06_bra_8124_loop:
    MOVEA.L #ram_0000_t08_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVEA.L #ram_6BA7,A0
    MOVE.B  D0,(A0,D2.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x018139 06:8129: 88        DEY
    BPL     b06_bra_8124_loop             ; BPL  ; orig: C - - - - - 0x01813A 06:812A: 10 F8     BPL b06_bra_8124_loop
b06_bra_812C_RTS:  ; orig: b06_bra_812C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01813C 06:812C: 60        RTS
b06_bra_812D:  ; orig: b06_bra_812D:
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x01813D 06:812D: A0 07     LDY #$07
b06_bra_812F_loop:  ; orig: b06_bra_812F_loop:
    MOVEA.L #tbl_815F,A0
    MOVE.B  (A0,D2.L),D1

    MOVEA.L #tbl_8167,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_68FE_map_data,A0
    MOVE.B  D0,(A0,D1.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x018148 06:8138: 88        DEY
    BPL     b06_bra_812F_loop             ; BPL  ; orig: C - - - - - 0x018149 06:8139: 10 F4     BPL b06_bra_812F_loop
    MOVE.B  #con_obj_id_7B,D0  ; orig: C - - - - - 0x01814B 06:813B: A9 7B     LDA #con_obj_id_7B
    MOVE.B  D0,$FF6A09  ; FIX v378: STA $6A09  ; orig: C - - - - - 0x01814D 06:813D: 8D 09 6A  STA ram_69FE_map_dat
    MOVE.B  #con_obj_id_7B,D0  ; orig: C - - - - - 0x018150 06:8140: A9 7B     LDA #con_obj_id_7B
    MOVE.B  D0,$FF6A3A  ; FIX v378: STA $6A3A  ; orig: C - - - - - 0x018152 06:8142: 8D 3A 6A  STA ram_69FE_map_dat
    MOVE.B  #con_obj_id_5A,D0  ; orig: C - - - - - 0x018155 06:8145: A9 5A     LDA #con_obj_id_5A
    MOVE.B  D0,$FF6A72  ; FIX v378: STA $6A72  ; orig: C - - - - - 0x018157 06:8147: 8D 72 6A  STA ram_69FE_map_dat
    MOVE.B  #$72,D0  ; orig: C - - - - - 0x01815A 06:814A: A9 72     LDA #$72
    MOVE.B  D0,$FF68BA  ; FIX v378: STA $68BA  ; orig: C - - - - - 0x01815C 06:814C: 8D BA 68  STA ram_687E_map_dat
    MOVE.B  #$72,D0  ; orig: C - - - - - 0x01815F 06:814F: A9 72     LDA #$72
    MOVE.B  D0,$FF68F2  ; FIX v378: STA $68F2  ; orig: C - - - - - 0x018161 06:8151: 8D F2 68  STA ram_687E_map_dat
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x018164 06:8154: A9 01     LDA #$01
    MOVE.B  D0,$FF6B3A  ; FIX v378: STA $6B3A  ; orig: C - - - - - 0x018166 06:8156: 8D 3A 6B  STA ram_6AFE_map_dat
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x018169 06:8159: A9 00     LDA #$00
    MOVE.B  D0,$FF6B72  ; FIX v378: STA $6B72  ; orig: C - - - - - 0x01816B 06:815B: 8D 72 6B  STA ram_6AFE_map_dat
    RTS                     ; RTS  ; orig: C - - - - - 0x01816E 06:815E: 60        RTS



tbl_815F:  ; orig: tbl_815F:
    DC.B $0E
    DC.B $0F
    DC.B $22
    DC.B $34
    DC.B $3C
    DC.B $45
    DC.B $74
    DC.B $8B



tbl_8167:  ; orig: tbl_8167:
    DC.B $7B
    DC.B $83
    DC.B $84
    DC.B $0F
    DC.B $0B
    DC.B $12
    DC.B $7A
    DC.B $2F



_off012_816F_01:  ; orig: _off012_816F_01:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $B7
    DC.B $00
    DC.B $E0
    DC.B $77
    DC.B $08
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x018187 06:8177: FF 06     .word ram_0
    DC.B $01
    DC.B $28
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $FF
    DC.B $DB
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $65
    DC.B $42
    DC.B $FF
    DC.B $20
    DC.B $85
    DC.B $02
    DC.B $FF
    DC.B $FB
    DC.B $20
    DC.B $A5
    DC.B $02
    DC.B $FF
    DC.B $67
    DC.B $20
    DC.B $C5
    DC.B $42
    DC.B $FF
    DC.B $FF



_off012_81A8_02:  ; orig: _off012_81A8_02:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $87
    DC.B $05
    DC.B $00
    DC.B $75
    DC.B $20
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x0181C0 06:81B0: FF 06     .word ram_0
    DC.B $03
    DC.B $56
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $30
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $30
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $7F
    DC.B $03
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $67
    DC.B $01
    DC.B $FB
    DC.B $20
    DC.B $82
    DC.B $01
    DC.B $FF
    DC.B $20
    DC.B $87
    DC.B $C3
    DC.B $FF
    DC.B $20
    DC.B $C8
    DC.B $01
    DC.B $FF
    DC.B $FF



_off012_81DF_03:  ; orig: _off012_81DF_03:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $37
    DC.B $0D
    DC.B $C8
    DC.B $79
    DC.B $1B
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x0181F7 06:81E7: FF 06     .word ram_0
    DC.B $02
    DC.B $09
    DC.B $0B
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $2B
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $7F
    DC.B $EC
    DC.B $7F
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $64
    DC.B $03
    DC.B $FB
    DC.B $FF
    DC.B $FB
    DC.B $20
    DC.B $84
    DC.B $03
    DC.B $FF
    DC.B $67
    DC.B $FF
    DC.B $20
    DC.B $A4
    DC.B $43
    DC.B $FF
    DC.B $20
    DC.B $C4
    DC.B $03
    DC.B $FF
    DC.B $24
    DC.B $FF
    DC.B $FF



_off012_821C_04:  ; orig: _off012_821C_04:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $86
    DC.B $06
    DC.B $10
    DC.B $72
    DC.B $00
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x018234 06:8224: FF 06     .word ram_0
    DC.B $05
    DC.B $21
    DC.B $58
    DC.B $7A
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $10
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $CF
    DC.B $DB
    DC.B $F3
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $64
    DC.B $43
    DC.B $FF
    DC.B $20
    DC.B $85
    DC.B $02
    DC.B $FB
    DC.B $FF
    DC.B $20
    DC.B $A4
    DC.B $02
    DC.B $FF
    DC.B $67
    DC.B $20
    DC.B $C4
    DC.B $43
    DC.B $FF
    DC.B $FF



_off012_8255_05:  ; orig: _off012_8255_05:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $87
    DC.B $0A
    DC.B $B0
    DC.B $7D
    DC.B $4F
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x01826D 06:825D: FF 06     .word ram_0
    DC.B $04
    DC.B $0F
    DC.B $6A
    DC.B $7F
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $5F
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $FF
    DC.B $FF
    DC.B $E7
    DC.B $7E
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $64
    DC.B $04
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FB
    DC.B $20
    DC.B $84
    DC.B $04
    DC.B $FF
    DC.B $FF
    DC.B $67
    DC.B $FF
    DC.B $20
    DC.B $A4
    DC.B $04
    DC.B $FF
    DC.B $FF
    DC.B $FB
    DC.B $FF
    DC.B $20
    DC.B $C4
    DC.B $04
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $67
    DC.B $FF



_off012_8298_06:  ; orig: _off012_8298_06:
    DC.B $49
    DC.B $79
    DC.B $89
    DC.B $56
    DC.B $04
    DC.B $00
    DC.B $74
    DC.B $16
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x0182B0 06:82A0: FF 06     .word ram_0
    DC.B $06
    DC.B $03
    DC.B $73
    DC.B $46
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $26
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $04
    DC.B $0C
    DC.B $7E
    DC.B $FF
    DC.B $80
    DC.B $F0
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $65
    DC.B $03
    DC.B $FB
    DC.B $FF
    DC.B $67
    DC.B $20
    DC.B $68
    DC.B $C2
    DC.B $FF
    DC.B $20
    DC.B $86
    DC.B $C3
    DC.B $FF
    DC.B $20
    DC.B $85
    DC.B $83
    DC.B $FF
    DC.B $FF
    DC.B $67
    DC.B $20
    DC.B $A3
    DC.B $02
    DC.B $FB
    DC.B $FF
    DC.B $FF



_off012_82D8_07:  ; orig: _off012_82D8_07:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $79
    DC.B $0C
    DC.B $C0
    DC.B $7F
    DC.B $2D
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x0182F0 06:82E0: 7F 07     .word ram_0
    DC.B $08
    DC.B $02
    DC.B $03
    DC.B $04
    DC.B $05
    DC.B $20
    DC.B $21
    DC.B $26
    DC.B $2B
    DC.B $2C
    DC.B $FF
    DC.B $3D
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $FE
    DC.B $FE
    DC.B $82
    DC.B $82
    DC.B $82
    DC.B $BE
    DC.B $80
    DC.B $FF
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $62
    DC.B $C3
    DC.B $FF
    DC.B $20
    DC.B $63
    DC.B $C3
    DC.B $FF
    DC.B $20
    DC.B $64
    DC.B $45
    DC.B $67
    DC.B $20
    DC.B $69
    DC.B $C4
    DC.B $FF
    DC.B $20
    DC.B $87
    DC.B $C2
    DC.B $FF
    DC.B $20
    DC.B $C2
    DC.B $46
    DC.B $67
    DC.B $FF



_off012_8317_08:  ; orig: _off012_8317_08:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $57
    DC.B $0C
    DC.B $C0
    DC.B $79
    DC.B $1B
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x01832F 06:831F: 7F 07     .word ram_0
    DC.B $07
    DC.B $27
    DC.B $30
    DC.B $37
    DC.B $60
    DC.B $67
    DC.B $70
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $1C
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $01
    DC.B $01
    DC.B $7D
    DC.B $5D
    DC.B $5D
    DC.B $41
    DC.B $7F
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $64
    DC.B $45
    DC.B $FB
    DC.B $20
    DC.B $84
    DC.B $05
    DC.B $FF
    DC.B $FB
    DC.B $FB
    DC.B $24
    DC.B $FF
    DC.B $20
    DC.B $A4
    DC.B $43
    DC.B $FF
    DC.B $20
    DC.B $A8
    DC.B $01
    DC.B $FF
    DC.B $20
    DC.B $C2
    DC.B $46
    DC.B $FB
    DC.B $20
    DC.B $C8
    DC.B $01
    DC.B $FF
    DC.B $FF



_off012_835A_09:  ; orig: _off012_835A_09:
    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $B6
    DC.B $04
    DC.B $00
    DC.B $74
    DC.B $07
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x018372 06:8362: 7F 07     .word ram_0
    DC.B $09
    DC.B $71
    DC.B $72
    DC.B $75
    DC.B $76
    DC.B $77
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $17
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $CC
    DC.B $DE
    DC.B $76
    DC.B $7F
    DC.B $7F
    DC.B $76
    DC.B $DE
    DC.B $CC
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $62
    DC.B $48
    DC.B $FF
    DC.B $20
    DC.B $64
    DC.B $44
    DC.B $FB
    DC.B $20
    DC.B $83
    DC.B $46
    DC.B $FB
    DC.B $20
    DC.B $84
    DC.B $44
    DC.B $FF
    DC.B $20
    DC.B $A2
    DC.B $08
    DC.B $FF
    DC.B $FF
    DC.B $FB
    DC.B $FF
    DC.B $FF
    DC.B $FB
    DC.B $FF
    DC.B $FF
    DC.B $20
    DC.B $C3
    DC.B $46
    DC.B $67
    DC.B $20
    DC.B $C5
    DC.B $42
    DC.B $FF
    DC.B $FF



tbl_83A4:  ; orig: tbl_83A4:
    ; [DIRECTIVE] .WORD _off012_816F_01  -- needs manual handling  ; orig: - D 0 - - - 0x0183B4 06:83A4: 6F 81     .wor
    ; [DIRECTIVE] .WORD _off012_81A8_02  -- needs manual handling  ; orig: - D 0 - - - 0x0183B6 06:83A6: A8 81     .wor
    ; [DIRECTIVE] .WORD _off012_81DF_03  -- needs manual handling  ; orig: - D 0 - - - 0x0183B8 06:83A8: DF 81     .wor
    ; [DIRECTIVE] .WORD _off012_821C_04  -- needs manual handling  ; orig: - D 0 - - - 0x0183BA 06:83AA: 1C 82     .wor
    ; [DIRECTIVE] .WORD _off012_8255_05  -- needs manual handling  ; orig: - D 0 - - - 0x0183BC 06:83AC: 55 82     .wor
    ; [DIRECTIVE] .WORD _off012_8298_06  -- needs manual handling  ; orig: - D 0 - - - 0x0183BE 06:83AE: 98 82     .wor
    ; [DIRECTIVE] .WORD _off012_82D8_07  -- needs manual handling  ; orig: - D 0 - - - 0x0183C0 06:83B0: D8 82     .wor
    ; [DIRECTIVE] .WORD _off012_8317_08  -- needs manual handling  ; orig: - D 0 - - - 0x0183C2 06:83B2: 17 83     .wor
    ; [DIRECTIVE] .WORD _off012_835A_09  -- needs manual handling  ; orig: - D 0 - - - 0x0183C4 06:83B4: 5A 83     .wor



tbl_83B6_data_size:  ; orig: tbl_83B6_data_size:
    DC.B $39
    DC.B $37
    DC.B $3D
    DC.B $39
    DC.B $43
    DC.B $40
    DC.B $3F
    DC.B $43
    DC.B $4A



; bzk garbage
    DC.B $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF



_off009_8400_00:  ; orig: _off009_8400_00:
_off011_8400_00:  ; orig: _off011_8400_00:
    DC.B $A3
    DC.B $93
    DC.B $63
    DC.B $73
    DC.B $C3
    DC.B $53
    DC.B $B3
    DC.B $A3
    DC.B $03
    DC.B $93
    DC.B $2B
    DC.B $73
    DC.B $83
    DC.B $93
    DC.B $57
    DC.B $87
    DC.B $93
    DC.B $53
    DC.B $83
    DC.B $23
    DC.B $C3
    DC.B $C3
    DC.B $63
    DC.B $0B
    DC.B $CB
    DC.B $4B
    DC.B $6B
    DC.B $93
    DC.B $33
    DC.B $27
    DC.B $CF
    DC.B $67
    DC.B $50
    DC.B $50
    DC.B $73
    DC.B $43
    DC.B $03
    DC.B $A3
    DC.B $3B
    DC.B $EB
    DC.B $EB
    DC.B $B3
    DC.B $03
    DC.B $B3
    DC.B $93
    DC.B $5F
    DC.B $0F
    DC.B $60
    DC.B $70
    DC.B $70
    DC.B $03
    DC.B $A3
    DC.B $43
    DC.B $0B
    DC.B $0B
    DC.B $73
    DC.B $0B
    DC.B $03
    DC.B $C3
    DC.B $63
    DC.B $72
    DC.B $92
    DC.B $0F
    DC.B $0F
    DC.B $00
    DC.B $00
    DC.B $63
    DC.B $03
    DC.B $4B
    DC.B $83
    DC.B $8A
    DC.B $BA
    DC.B $BA
    DC.B $32
    DC.B $B2
    DC.B $C2
    DC.B $02
    DC.B $C2
    DC.B $72
    DC.B $0F
    DC.B $00
    DC.B $A3
    DC.B $03
    DC.B $83
    DC.B $0A
    DC.B $0A
    DC.B $BA
    DC.B $02
    DC.B $C2
    DC.B $0A
    DC.B $0A
    DC.B $32
    DC.B $02
    DC.B $02
    DC.B $72
    DC.B $0F
    DC.B $C3
    DC.B $03
    DC.B $63
    DC.B $73
    DC.B $72
    DC.B $0A
    DC.B $72
    DC.B $72
    DC.B $32
    DC.B $0A
    DC.B $DA
    DC.B $52
    DC.B $42
    DC.B $62
    DC.B $C2
    DC.B $3F
    DC.B $B3
    DC.B $53
    DC.B $43
    DC.B $03
    DC.B $82
    DC.B $2A
    DC.B $62
    DC.B $42
    DC.B $52
    DC.B $63
    DC.B $03
    DC.B $9F
    DC.B $6F
    DC.B $6F
    DC.B $0F
    DC.B $0F

    DC.B $27
    DC.B $5F
    DC.B $6B
    DC.B $5F
    DC.B $6B
    DC.B $27
    DC.B $47
    DC.B $5F
    DC.B $03
    DC.B $4F
    DC.B $4B
    DC.B $17
    DC.B $7B
    DC.B $6B
    DC.B $63
    DC.B $8B
    DC.B $5B
    DC.B $63
    DC.B $7F
    DC.B $87
    DC.B $5F
    DC.B $7B
    DC.B $5B
    DC.B $03
    DC.B $6B
    DC.B $1F
    DC.B $6F
    DC.B $17
    DC.B $57
    DC.B $53
    DC.B $5F
    DC.B $5A
    DC.B $44
    DC.B $4C
    DC.B $18
    DC.B $53
    DC.B $03
    DC.B $77
    DC.B $7F
    DC.B $6B
    DC.B $86
    DC.B $6B
    DC.B $03
    DC.B $8F
    DC.B $47
    DC.B $87
    DC.B $03
    DC.B $44
    DC.B $18
    DC.B $00
    DC.B $03
    DC.B $68
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $07
    DC.B $03
    DC.B $02
    DC.B $47
    DC.B $03
    DC.B $0A
    DC.B $86
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $00
    DC.B $1F
    DC.B $02
    DC.B $76
    DC.B $12
    DC.B $7E
    DC.B $46
    DC.B $86
    DC.B $52
    DC.B $76
    DC.B $6A
    DC.B $02
    DC.B $7E
    DC.B $8E
    DC.B $03
    DC.B $00
    DC.B $8F
    DC.B $03
    DC.B $8A
    DC.B $02
    DC.B $02
    DC.B $8E
    DC.B $02
    DC.B $86
    DC.B $02
    DC.B $02
    DC.B $8E
    DC.B $02
    DC.B $02
    DC.B $7A
    DC.B $03
    DC.B $5B
    DC.B $03
    DC.B $8B
    DC.B $5F
    DC.B $6A
    DC.B $03
    DC.B $7B
    DC.B $86
    DC.B $5E
    DC.B $02
    DC.B $5E
    DC.B $8A
    DC.B $22
    DC.B $22
    DC.B $8E
    DC.B $77
    DC.B $73
    DC.B $87
    DC.B $5F
    DC.B $03
    DC.B $0F
    DC.B $66
    DC.B $5A
    DC.B $42
    DC.B $6A
    DC.B $53
    DC.B $03
    DC.B $47
    DC.B $5B
    DC.B $5F
    DC.B $03
    DC.B $03

    DC.B $00
    DC.B $42
    DC.B $42
    DC.B $1F
    DC.B $C1
    DC.B $E6
    DC.B $E4
    DC.B $02
    DC.B $1F
    DC.B $00
    DC.B $01
    DC.B $10
    DC.B $CE
    DC.B $CE
    DC.B $00
    DC.B $00
    DC.B $41
    DC.B $E4
    DC.B $C1
    DC.B $65
    DC.B $42
    DC.B $E4
    DC.B $1F
    DC.B $1F
    DC.B $1F
    DC.B $1F
    DC.B $CE
    DC.B $00
    DC.B $00
    DC.B $DA
    DC.B $CE
    DC.B $DA
    DC.B $21
    DC.B $21
    DC.B $02
    DC.B $42
    DC.B $00
    DC.B $5A
    DC.B $DA
    DC.B $DA
    DC.B $DA
    DC.B $50
    DC.B $CF
    DC.B $E7
    DC.B $4E
    DC.B $AA
    DC.B $49
    DC.B $00
    DC.B $21
    DC.B $21
    DC.B $E4
    DC.B $00
    DC.B $4F
    DC.B $00
    DC.B $00
    DC.B $08
    DC.B $E8
    DC.B $2F
    DC.B $E7
    DC.B $4F
    DC.B $0A
    DC.B $43
    DC.B $AA
    DC.B $09
    DC.B $21
    DC.B $21
    DC.B $04
    DC.B $2F
    DC.B $47
    DC.B $1A
    DC.B $00
    DC.B $00
    DC.B $50
    DC.B $E8
    DC.B $CD
    DC.B $C4
    DC.B $AA
    DC.B $43
    DC.B $43
    DC.B $AB
    DC.B $82
    DC.B $83
    DC.B $63
    DC.B $A2
    DC.B $69
    DC.B $07
    DC.B $47
    DC.B $69
    DC.B $69
    DC.B $5A
    DC.B $47
    DC.B $63
    DC.B $43
    DC.B $43
    DC.B $83
    DC.B $AA
    DC.B $E4
    DC.B $83
    DC.B $83
    DC.B $EC
    DC.B $AA
    DC.B $69
    DC.B $69
    DC.B $47
    DC.B $47
    DC.B $47
    DC.B $69
    DC.B $EC
    DC.B $44
    DC.B $44
    DC.B $EC
    DC.B $A8
    DC.B $5A
    DC.B $83
    DC.B $62
    DC.B $43
    DC.B $0E
    DC.B $E7
    DC.B $4E
    DC.B $00
    DC.B $47
    DC.B $8D
    DC.B $4D
    DC.B $D0
    DC.B $D0
    DC.B $49
    DC.B $48
    DC.B $09

    DC.B $00
    DC.B $01
    DC.B $02
    DC.B $03
    DC.B $04
    DC.B $85
    DC.B $86
    DC.B $07
    DC.B $06
    DC.B $08
    DC.B $09
    DC.B $0A
    DC.B $0B
    DC.B $0C
    DC.B $0D
    DC.B $0E
    DC.B $0F
    DC.B $90
    DC.B $11
    DC.B $92
    DC.B $13
    DC.B $94
    DC.B $15
    DC.B $16
    DC.B $17
    DC.B $18
    DC.B $19
    DC.B $1A
    DC.B $1B
    DC.B $1C
    DC.B $1D
    DC.B $1E
    DC.B $1F
    DC.B $20
    DC.B $21
    DC.B $22
    DC.B $23
    DC.B $24
    DC.B $25
    DC.B $26
    DC.B $27
    DC.B $28
    DC.B $29
    DC.B $AA
    DC.B $2B
    DC.B $AC
    DC.B $2D
    DC.B $2E
    DC.B $2F
    DC.B $30
    DC.B $B1
    DC.B $32
    DC.B $33
    DC.B $34
    DC.B $35
    DC.B $36
    DC.B $B7
    DC.B $38
    DC.B $B9
    DC.B $3A
    DC.B $0A
    DC.B $3B
    DC.B $BC
    DC.B $3D
    DC.B $3E
    DC.B $3F
    DC.B $38
    DC.B $38
    DC.B $40
    DC.B $41
    DC.B $42
    DC.B $43
    DC.B $44
    DC.B $C5
    DC.B $46
    DC.B $47
    DC.B $C8
    DC.B $49
    DC.B $4A
    DC.B $CB
    DC.B $4C
    DC.B $4D
    DC.B $CE
    DC.B $CF
    DC.B $D0
    DC.B $51
    DC.B $52
    DC.B $D3
    DC.B $D4
    DC.B $55
    DC.B $56
    DC.B $D7
    DC.B $58
    DC.B $59
    DC.B $5A
    DC.B $CB
    DC.B $DB
    DC.B $5C
    DC.B $5D
    DC.B $DE
    DC.B $DF
    DC.B $E0
    DC.B $E1
    DC.B $62
    DC.B $63
    DC.B $64
    DC.B $E5
    DC.B $E6
    DC.B $67
    DC.B $68
    DC.B $E9
    DC.B $EA
    DC.B $6B
    DC.B $6C
    DC.B $ED
    DC.B $6E
    DC.B $6F
    DC.B $F0
    DC.B $71
    DC.B $72
    DC.B $73
    DC.B $74
    DC.B $06
    DC.B $75
    DC.B $76
    DC.B $76
    DC.B $77
    DC.B $78

    DC.B $3F
    DC.B $01
    DC.B $7F
    DC.B $20
    DC.B $3F
    DC.B $5A
    DC.B $7F
    DC.B $02
    DC.B $7F
    DC.B $7F
    DC.B $03
    DC.B $7F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $98
    DC.B $98
    DC.B $D8
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $15
    DC.B $7F
    DC.B $3F
    DC.B $3F
    DC.B $3F
    DC.B $1F
    DC.B $3F
    DC.B $E0
    DC.B $98
    DC.B $58
    DC.B $D8
    DC.B $98
    DC.B $58
    DC.B $D8
    DC.B $1C
    DC.B $00
    DC.B $C8
    DC.B $1C
    DC.B $19
    DC.B $C6
    DC.B $1C
    DC.B $04
    DC.B $E2
    DC.B $19
    DC.B $12
    DC.B $C4
    DC.B $3F
    DC.B $98
    DC.B $7F
    DC.B $3F
    DC.B $98
    DC.B $7F
    DC.B $3F
    DC.B $98
    DC.B $7F
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $0A
    DC.B $0A
    DC.B $0A
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $28
    DC.B $00
    DC.B $44
    DC.B $05
    DC.B $0A
    DC.B $14
    DC.B $0A
    DC.B $1E
    DC.B $32
    DC.B $82
    DC.B $14
    DC.B $50
    DC.B $A0
    DC.B $64
    DC.B $3C
    DC.B $5A
    DC.B $64
    DC.B $0A
    DC.B $50
    DC.B $FA
    DC.B $3C
    DC.B $00
    DC.B $1E
    DC.B $00
    DC.B $00
    DC.B $64
    DC.B $00
    DC.B $00
    DC.B $0A
    DC.B $00
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF

    DC.B $83
    DC.B $00
    DC.B $83
    DC.B $03
    DC.B $00
    DC.B $45
    DC.B $84
    DC.B $03
    DC.B $00
    DC.B $A4
    DC.B $00
    DC.B $03
    DC.B $00
    DC.B $00
    DC.B $0B
    DC.B $03
    DC.B $00
    DC.B $A4
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $80
    DC.B $00
    DC.B $00
    DC.B $82
    DC.B $82
    DC.B $03
    DC.B $A4
    DC.B $02
    DC.B $02
    DC.B $00
    DC.B $03
    DC.B $B3
    DC.B $62
    DC.B $03
    DC.B $11
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $40
    DC.B $05
    DC.B $84
    DC.B $00
    DC.B $84
    DC.B $45
    DC.B $00
    DC.B $00
    DC.B $03
    DC.B $84
    DC.B $04
    DC.B $00
    DC.B $00
    DC.B $02
    DC.B $00
    DC.B $00
    DC.B $03
    DC.B $00
    DC.B $80
    DC.B $84
    DC.B $02
    DC.B $03
    DC.B $02
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $03
    DC.B $06
    DC.B $45
    DC.B $02
    DC.B $02
    DC.B $00
    DC.B $09
    DC.B $00
    DC.B $0C
    DC.B $0A
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $08
    DC.B $85
    DC.B $00
    DC.B $00
    DC.B $06
    DC.B $08
    DC.B $8C
    DC.B $00
    DC.B $00
    DC.B $0D
    DC.B $08
    DC.B $08
    DC.B $00
    DC.B $00
    DC.B $84
    DC.B $08
    DC.B $4B
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $40
    DC.B $0C
    DC.B $00
    DC.B $05
    DC.B $4D
    DC.B $89
    DC.B $49
    DC.B $84
    DC.B $00
    DC.B $00
    DC.B $48
    DC.B $8C
    DC.B $08
    DC.B $03
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $0C
    DC.B $22
    DC.B $00
    DC.B $40
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00



_off009_8700_01:  ; orig: _off009_8700_01:
_off009_8700_02:  ; orig: _off009_8700_02:
_off009_8700_03:  ; orig: _off009_8700_03:
_off009_8700_04:  ; orig: _off009_8700_04:
_off009_8700_05:  ; orig: _off009_8700_05:
_off009_8700_06:  ; orig: _off009_8700_06:
    DC.B $22
    DC.B $32
    DC.B $22
    DC.B $22
    DC.B $05
    DC.B $26
    DC.B $36
    DC.B $64
    DC.B $3A
    DC.B $36
    DC.B $3E
    DC.B $22
    DC.B $22
    DC.B $26
    DC.B $22
    DC.B $69
    DC.B $FE
    DC.B $92
    DC.B $06
    DC.B $E6
    DC.B $22
    DC.B $32
    DC.B $A6
    DC.B $26
    DC.B $3E
    DC.B $B6
    DC.B $06
    DC.B $E6
    DC.B $F6
    DC.B $22
    DC.B $FE
    DC.B $22
    DC.B $16
    DC.B $96
    DC.B $26
    DC.B $36
    DC.B $E2
    DC.B $86
    DC.B $26
    DC.B $22
    DC.B $1E
    DC.B $A2
    DC.B $26
    DC.B $22
    DC.B $A2
    DC.B $06
    DC.B $E2
    DC.B $12
    DC.B $A2
    DC.B $A6
    DC.B $26
    DC.B $A2
    DC.B $E6
    DC.B $36
    DC.B $26
    DC.B $02
    DC.B $FE
    DC.B $E6
    DC.B $26
    DC.B $F6
    DC.B $E6
    DC.B $22
    DC.B $02
    DC.B $92
    DC.B $02
    DC.B $26
    DC.B $36
    DC.B $12
    DC.B $32
    DC.B $A6
    DC.B $36
    DC.B $02
    DC.B $02
    DC.B $22
    DC.B $22
    DC.B $A2
    DC.B $22
    DC.B $FE
    DC.B $1E
    DC.B $92
    DC.B $06
    DC.B $22
    DC.B $A6
    DC.B $82
    DC.B $86
    DC.B $22
    DC.B $A2
    DC.B $06
    DC.B $E2
    DC.B $1E
    DC.B $06
    DC.B $02
    DC.B $06
    DC.B $E6
    DC.B $02
    DC.B $92
    DC.B $32
    DC.B $02
    DC.B $26
    DC.B $16
    DC.B $26
    DC.B $E6
    DC.B $E2
    DC.B $32
    DC.B $02
    DC.B $06
    DC.B $36
    DC.B $02
    DC.B $26
    DC.B $22
    DC.B $02
    DC.B $86
    DC.B $26
    DC.B $02
    DC.B $26
    DC.B $A2
    DC.B $26
    DC.B $09
    DC.B $02
    DC.B $86
    DC.B $06
    DC.B $22
    DC.B $A6
    DC.B $06
    DC.B $22
    DC.B $02
    DC.B $06
    DC.B $22

    DC.B $34
    DC.B $A3
    DC.B $07
    DC.B $26
    DC.B $05
    DC.B $36
    DC.B $A6
    DC.B $06
    DC.B $1D
    DC.B $32
    DC.B $92
    DC.B $84
    DC.B $26
    DC.B $22
    DC.B $E6
    DC.B $69
    DC.B $32
    DC.B $92
    DC.B $9E
    DC.B $E6
    DC.B $26
    DC.B $24
    DC.B $33
    DC.B $84
    DC.B $3E
    DC.B $03
    DC.B $03
    DC.B $06
    DC.B $26
    DC.B $26
    DC.B $32
    DC.B $84
    DC.B $23
    DC.B $07
    DC.B $36
    DC.B $A7
    DC.B $36
    DC.B $A2
    DC.B $17
    DC.B $A7
    DC.B $32
    DC.B $87
    DC.B $3E
    DC.B $04
    DC.B $22
    DC.B $07
    DC.B $36
    DC.B $A6
    DC.B $37
    DC.B $BF
    DC.B $06
    DC.B $27
    DC.B $26
    DC.B $3E
    DC.B $06
    DC.B $27
    DC.B $26
    DC.B $3F
    DC.B $06
    DC.B $26
    DC.B $27
    DC.B $26
    DC.B $21
    DC.B $06
    DC.B $27
    DC.B $20
    DC.B $E2
    DC.B $16
    DC.B $A2
    DC.B $06
    DC.B $23
    DC.B $07
    DC.B $26
    DC.B $22
    DC.B $16
    DC.B $B6
    DC.B $B2
    DC.B $85
    DC.B $22
    DC.B $06
    DC.B $23
    DC.B $06
    DC.B $3E
    DC.B $02
    DC.B $06
    DC.B $3F
    DC.B $E2
    DC.B $07
    DC.B $27
    DC.B $36
    DC.B $A2
    DC.B $12
    DC.B $9E
    DC.B $E6
    DC.B $36
    DC.B $A6
    DC.B $32
    DC.B $36
    DC.B $A7
    DC.B $26
    DC.B $32
    DC.B $92
    DC.B $97
    DC.B $A4
    DC.B $26
    DC.B $26
    DC.B $24
    DC.B $26
    DC.B $22
    DC.B $E2
    DC.B $16
    DC.B $A6
    DC.B $22
    DC.B $07
    DC.B $22
    DC.B $03
    DC.B $06
    DC.B $09
    DC.B $23
    DC.B $06
    DC.B $36
    DC.B $A3
    DC.B $07
    DC.B $22
    DC.B $07
    DC.B $23
    DC.B $06
    DC.B $22

    DC.B $0E
    DC.B $DB
    DC.B $09
    DC.B $00
    DC.B $98
    DC.B $8C
    DC.B $00
    DC.B $69
    DC.B $69
    DC.B $7B
    DC.B $B3
    DC.B $0C
    DC.B $00
    DC.B $00
    DC.B $32
    DC.B $68
    DC.B $3C
    DC.B $35
    DC.B $52
    DC.B $03
    DC.B $00
    DC.B $0D
    DC.B $DB
    DC.B $0F
    DC.B $04
    DC.B $B3
    DC.B $A4
    DC.B $FC
    DC.B $34
    DC.B $B3
    DC.B $46
    DC.B $0B
    DC.B $52
    DC.B $55
    DC.B $0A
    DC.B $06
    DC.B $39
    DC.B $56
    DC.B $70
    DC.B $B0
    DC.B $7B
    DC.B $7B
    DC.B $DB
    DC.B $0B
    DC.B $F7
    DC.B $72
    DC.B $E8
    DC.B $55
    DC.B $72
    DC.B $52
    DC.B $B3
    DC.B $2A
    DC.B $B0
    DC.B $3D
    DC.B $00
    DC.B $0B
    DC.B $FC
    DC.B $52
    DC.B $FC
    DC.B $AD
    DC.B $7B
    DC.B $00
    DC.B $01
    DC.B $EE
    DC.B $53
    DC.B $0C
    DC.B $15
    DC.B $55
    DC.B $06
    DC.B $E7
    DC.B $00
    DC.B $70
    DC.B $09
    DC.B $EF
    DC.B $5B
    DC.B $13
    DC.B $AD
    DC.B $3C
    DC.B $68
    DC.B $05
    DC.B $52
    DC.B $DB
    DC.B $9B
    DC.B $6A
    DC.B $DB
    DC.B $53
    DC.B $31
    DC.B $53
    DC.B $DB
    DC.B $4B
    DC.B $EE
    DC.B $0B
    DC.B $0B
    DC.B $EF
    DC.B $46
    DC.B $55
    DC.B $CB
    DC.B $12
    DC.B $52
    DC.B $2A
    DC.B $4C
    DC.B $70
    DC.B $30
    DC.B $0E
    DC.B $53
    DC.B $CB
    DC.B $0D
    DC.B $53
    DC.B $A8
    DC.B $68
    DC.B $28
    DC.B $95
    DC.B $DB
    DC.B $00
    DC.B $1B
    DC.B $00
    DC.B $6A
    DC.B $C8
    DC.B $00
    DC.B $56
    DC.B $64
    DC.B $00
    DC.B $64
    DC.B $93
    DC.B $00
    DC.B $00
    DC.B $68
    DC.B $6A

    DC.B $A6
    DC.B $16
    DC.B $81
    DC.B $29
    DC.B $3F
    DC.B $62
    DC.B $5A
    DC.B $3E
    DC.B $3E
    DC.B $CA
    DC.B $8A
    DC.B $A6
    DC.B $29
    DC.B $29
    DC.B $25
    DC.B $3F
    DC.B $06
    DC.B $26
    DC.B $4A
    DC.B $85
    DC.B $29
    DC.B $A6
    DC.B $18
    DC.B $A6
    DC.B $85
    DC.B $93
    DC.B $18
    DC.B $83
    DC.B $06
    DC.B $9B
    DC.B $0D
    DC.B $A6
    DC.B $15
    DC.B $12
    DC.B $DA
    DC.B $15
    DC.B $24
    DC.B $07
    DC.B $14
    DC.B $95
    DC.B $8D
    DC.B $94
    DC.B $1D
    DC.B $A6
    DC.B $80
    DC.B $93
    DC.B $1D
    DC.B $00
    DC.B $98
    DC.B $17
    DC.B $CA
    DC.B $17
    DC.B $1E
    DC.B $04
    DC.B $29
    DC.B $17
    DC.B $CA
    DC.B $13
    DC.B $E2
    DC.B $CA
    DC.B $97
    DC.B $29
    DC.B $A5
    DC.B $80
    DC.B $15
    DC.B $A6
    DC.B $62
    DC.B $1F
    DC.B $02
    DC.B $0D
    DC.B $12
    DC.B $15
    DC.B $81
    DC.B $80
    DC.B $0F
    DC.B $08
    DC.B $80
    DC.B $25
    DC.B $02
    DC.B $24
    DC.B $11
    DC.B $03
    DC.B $1E
    DC.B $02
    DC.B $03
    DC.B $13
    DC.B $00
    DC.B $17
    DC.B $24
    DC.B $1D
    DC.B $80
    DC.B $00
    DC.B $1F
    DC.B $9E
    DC.B $1F
    DC.B $03
    DC.B $3F
    DC.B $02
    DC.B $0C
    DC.B $1E
    DC.B $5A
    DC.B $02
    DC.B $18
    DC.B $A6
    DC.B $1D
    DC.B $1B
    DC.B $A6
    DC.B $11
    DC.B $00
    DC.B $03
    DC.B $0D
    DC.B $1E
    DC.B $00
    DC.B $21
    DC.B $00
    DC.B $21
    DC.B $1D
    DC.B $3F
    DC.B $21
    DC.B $1D
    DC.B $1F
    DC.B $21
    DC.B $03
    DC.B $03
    DC.B $21
    DC.B $21
    DC.B $00
    DC.B $3F

    DC.B $03
    DC.B $99
    DC.B $83
    DC.B $1B
    DC.B $05
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $1B
    DC.B $1B
    DC.B $1A
    DC.B $0C
    DC.B $03
    DC.B $03
    DC.B $23
    DC.B $1A
    DC.B $1B
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $17
    DC.B $99
    DC.B $43
    DC.B $1A
    DC.B $43
    DC.B $40
    DC.B $03
    DC.B $03
    DC.B $97
    DC.B $03
    DC.B $19
    DC.B $1A
    DC.B $63
    DC.B $19
    DC.B $99
    DC.B $0F
    DC.B $99
    DC.B $19
    DC.B $03
    DC.B $43
    DC.B $99
    DC.B $03
    DC.B $0F
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $63
    DC.B $1A
    DC.B $1B
    DC.B $96
    DC.B $03
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $80
    DC.B $1B
    DC.B $19
    DC.B $00
    DC.B $99
    DC.B $03
    DC.B $03
    DC.B $17
    DC.B $1D
    DC.B $39
    DC.B $97
    DC.B $19
    DC.B $03
    DC.B $19
    DC.B $00
    DC.B $19
    DC.B $77
    DC.B $1A
    DC.B $19
    DC.B $1E
    DC.B $83
    DC.B $19
    DC.B $03
    DC.B $19
    DC.B $16
    DC.B $19
    DC.B $00
    DC.B $8F
    DC.B $19
    DC.B $03
    DC.B $16
    DC.B $00
    DC.B $03
    DC.B $6F
    DC.B $03
    DC.B $17
    DC.B $0D
    DC.B $03
    DC.B $96
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $99
    DC.B $03
    DC.B $16
    DC.B $00
    DC.B $03
    DC.B $19
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $16
    DC.B $19
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $19
    DC.B $10
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $99
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $0A

    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $30
    DC.B $30
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $01
    DC.B $00
    DC.B $04
    DC.B $07
    DC.B $30
    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $01
    DC.B $07
    DC.B $00
    DC.B $01
    DC.B $07
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $37
    DC.B $07
    DC.B $00
    DC.B $27
    DC.B $20
    DC.B $17
    DC.B $00
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $01
    DC.B $07
    DC.B $10
    DC.B $01
    DC.B $05
    DC.B $20
    DC.B $01
    DC.B $07
    DC.B $20
    DC.B $27
    DC.B $04
    DC.B $01
    DC.B $05
    DC.B $04
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $04
    DC.B $00
    DC.B $37
    DC.B $10
    DC.B $20
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $10
    DC.B $01
    DC.B $37
    DC.B $00
    DC.B $27
    DC.B $07
    DC.B $27
    DC.B $07
    DC.B $01
    DC.B $00
    DC.B $07
    DC.B $11
    DC.B $27
    DC.B $02
    DC.B $00
    DC.B $30
    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $00
    DC.B $10
    DC.B $11
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $01
    DC.B $00
    DC.B $10
    DC.B $17
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $27
    DC.B $02
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $20



_off009_8A00_07:  ; orig: _off009_8A00_07:
_off009_8A00_08:  ; orig: _off009_8A00_08:
_off009_8A00_09:  ; orig: _off009_8A00_09:
    DC.B $07
    DC.B $3E
    DC.B $22
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $36
    DC.B $32
    DC.B $32
    DC.B $3E
    DC.B $26
    DC.B $36
    DC.B $22
    DC.B $26
    DC.B $3E
    DC.B $1F
    DC.B $32
    DC.B $1E
    DC.B $F6
    DC.B $36
    DC.B $22
    DC.B $32
    DC.B $A2
    DC.B $92
    DC.B $9E
    DC.B $E6
    DC.B $26
    DC.B $A6
    DC.B $E6
    DC.B $22
    DC.B $F6
    DC.B $26
    DC.B $86
    DC.B $1E
    DC.B $A6
    DC.B $B6
    DC.B $02
    DC.B $92
    DC.B $16
    DC.B $92
    DC.B $16
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $22
    DC.B $06
    DC.B $B2
    DC.B $4C
    DC.B $36
    DC.B $1E
    DC.B $3E
    DC.B $A6
    DC.B $06
    DC.B $86
    DC.B $A6
    DC.B $82
    DC.B $A6
    DC.B $22
    DC.B $26
    DC.B $22
    DC.B $F2
    DC.B $22
    DC.B $96
    DC.B $26
    DC.B $B6
    DC.B $1E
    DC.B $FE
    DC.B $32
    DC.B $22
    DC.B $32
    DC.B $22
    DC.B $02
    DC.B $36
    DC.B $E2
    DC.B $1A
    DC.B $06
    DC.B $86
    DC.B $E2
    DC.B $A2
    DC.B $10
    DC.B $A6
    DC.B $02
    DC.B $E6
    DC.B $96
    DC.B $02
    DC.B $92
    DC.B $02
    DC.B $06
    DC.B $A2
    DC.B $12
    DC.B $32
    DC.B $22
    DC.B $26
    DC.B $06
    DC.B $F2
    DC.B $26
    DC.B $14
    DC.B $02
    DC.B $26
    DC.B $B6
    DC.B $06
    DC.B $86
    DC.B $E2
    DC.B $30
    DC.B $02
    DC.B $82
    DC.B $82
    DC.B $E6
    DC.B $26
    DC.B $26
    DC.B $82
    DC.B $7C
    DC.B $63
    DC.B $06
    DC.B $71
    DC.B $A6
    DC.B $26
    DC.B $20
    DC.B $02
    DC.B $52
    DC.B $06
    DC.B $02
    DC.B $06
    DC.B $29
    DC.B $26
    DC.B $26
    DC.B $02
    DC.B $26

    DC.B $07
    DC.B $37
    DC.B $A4
    DC.B $32
    DC.B $86
    DC.B $32
    DC.B $84
    DC.B $26
    DC.B $32
    DC.B $9E
    DC.B $E6
    DC.B $25
    DC.B $33
    DC.B $86
    DC.B $26
    DC.B $1F
    DC.B $26
    DC.B $26
    DC.B $36
    DC.B $A7
    DC.B $36
    DC.B $A3
    DC.B $06
    DC.B $26
    DC.B $37
    DC.B $B2
    DC.B $92
    DC.B $96
    DC.B $A6
    DC.B $32
    DC.B $9F
    DC.B $06
    DC.B $26
    DC.B $32
    DC.B $96
    DC.B $B3
    DC.B $87
    DC.B $36
    DC.B $B2
    DC.B $86
    DC.B $24
    DC.B $32
    DC.B $9E
    DC.B $06
    DC.B $26
    DC.B $32
    DC.B $86
    DC.B $3F
    DC.B $32
    DC.B $86
    DC.B $26
    DC.B $33
    DC.B $87
    DC.B $26
    DC.B $32
    DC.B $86
    DC.B $3E
    DC.B $13
    DC.B $86
    DC.B $30
    DC.B $86
    DC.B $24
    DC.B $3F
    DC.B $E6
    DC.B $27
    DC.B $27
    DC.B $27
    DC.B $24
    DC.B $22
    DC.B $02
    DC.B $06
    DC.B $26
    DC.B $24
    DC.B $27
    DC.B $1A
    DC.B $3F
    DC.B $E6
    DC.B $36
    DC.B $A6
    DC.B $10
    DC.B $3F
    DC.B $E6
    DC.B $26
    DC.B $27
    DC.B $32
    DC.B $92
    DC.B $87
    DC.B $27
    DC.B $22
    DC.B $1E
    DC.B $07
    DC.B $24
    DC.B $22
    DC.B $03
    DC.B $F7
    DC.B $A7
    DC.B $55
    DC.B $22
    DC.B $16
    DC.B $A6
    DC.B $22
    DC.B $03
    DC.B $E4
    DC.B $04
    DC.B $32
    DC.B $83
    DC.B $03
    DC.B $02
    DC.B $02
    DC.B $07
    DC.B $26
    DC.B $7C
    DC.B $05
    DC.B $26
    DC.B $74
    DC.B $36
    DC.B $A6
    DC.B $61
    DC.B $26
    DC.B $03
    DC.B $26
    DC.B $23
    DC.B $06
    DC.B $0D
    DC.B $22
    DC.B $E3
    DC.B $03
    DC.B $07

    DC.B $69
    DC.B $EF
    DC.B $0E
    DC.B $B3
    DC.B $F7
    DC.B $7B
    DC.B $0D
    DC.B $F1
    DC.B $35
    DC.B $BA
    DC.B $45
    DC.B $01
    DC.B $31
    DC.B $F9
    DC.B $4B
    DC.B $69
    DC.B $F1
    DC.B $3B
    DC.B $3A
    DC.B $B3
    DC.B $57
    DC.B $23
    DC.B $08
    DC.B $FC
    DC.B $F5
    DC.B $85
    DC.B $BA
    DC.B $85
    DC.B $38
    DC.B $56
    DC.B $33
    DC.B $B8
    DC.B $7B
    DC.B $07
    DC.B $B3
    DC.B $D5
    DC.B $52
    DC.B $B3
    DC.B $D5
    DC.B $08
    DC.B $36
    DC.B $BA
    DC.B $3D
    DC.B $00
    DC.B $00
    DC.B $35
    DC.B $3C
    DC.B $77
    DC.B $F7
    DC.B $FC
    DC.B $37
    DC.B $D5
    DC.B $DB
    DC.B $7B
    DC.B $EF
    DC.B $92
    DC.B $BA
    DC.B $38
    DC.B $01
    DC.B $10
    DC.B $05
    DC.B $0F
    DC.B $8C
    DC.B $F4
    DC.B $7B
    DC.B $F6
    DC.B $3E
    DC.B $0C
    DC.B $A4
    DC.B $FC
    DC.B $A3
    DC.B $F1
    DC.B $0F
    DC.B $F5
    DC.B $69
    DC.B $8B
    DC.B $D6
    DC.B $33
    DC.B $F4
    DC.B $69
    DC.B $53
    DC.B $97
    DC.B $07
    DC.B $FC
    DC.B $7B
    DC.B $3A
    DC.B $B3
    DC.B $7B
    DC.B $31
    DC.B $BA
    DC.B $EA
    DC.B $10
    DC.B $0B
    DC.B $B0
    DC.B $4C
    DC.B $D6
    DC.B $69
    DC.B $07
    DC.B $DB
    DC.B $53
    DC.B $FC
    DC.B $F1
    DC.B $0B
    DC.B $C6
    DC.B $EE
    DC.B $45
    DC.B $DB
    DC.B $85
    DC.B $39
    DC.B $EA
    DC.B $3C
    DC.B $69
    DC.B $A9
    DC.B $00
    DC.B $69
    DC.B $F1
    DC.B $3B
    DC.B $69
    DC.B $00
    DC.B $69
    DC.B $68
    DC.B $00
    DC.B $01
    DC.B $69
    DC.B $F4
    DC.B $3C
    DC.B $00
    DC.B $EF

    DC.B $3F
    DC.B $93
    DC.B $A6
    DC.B $DA
    DC.B $DA
    DC.B $CA
    DC.B $A6
    DC.B $DA
    DC.B $26
    DC.B $8A
    DC.B $24
    DC.B $A5
    DC.B $23
    DC.B $C8
    DC.B $00
    DC.B $3F
    DC.B $C8
    DC.B $25
    DC.B $26
    DC.B $80
    DC.B $1C
    DC.B $14
    DC.B $8A
    DC.B $9F
    DC.B $96
    DC.B $1F
    DC.B $DA
    DC.B $00
    DC.B $24
    DC.B $11
    DC.B $24
    DC.B $DA
    DC.B $DA
    DC.B $A5
    DC.B $9D
    DC.B $12
    DC.B $17
    DC.B $8E
    DC.B $03
    DC.B $8A
    DC.B $26
    DC.B $DA
    DC.B $04
    DC.B $29
    DC.B $29
    DC.B $26
    DC.B $00
    DC.B $3E
    DC.B $CA
    DC.B $A5
    DC.B $27
    DC.B $19
    DC.B $14
    DC.B $A6
    DC.B $80
    DC.B $63
    DC.B $8D
    DC.B $24
    DC.B $A5
    DC.B $A6
    DC.B $85
    DC.B $A6
    DC.B $23
    DC.B $9B
    DC.B $96
    DC.B $80
    DC.B $28
    DC.B $A6
    DC.B $00
    DC.B $80
    DC.B $25
    DC.B $9E
    DC.B $A6
    DC.B $98
    DC.B $3F
    DC.B $23
    DC.B $1C
    DC.B $25
    DC.B $80
    DC.B $3F
    DC.B $14
    DC.B $11
    DC.B $9B
    DC.B $A3
    DC.B $8C
    DC.B $5A
    DC.B $99
    DC.B $94
    DC.B $00
    DC.B $82
    DC.B $19
    DC.B $A6
    DC.B $24
    DC.B $91
    DC.B $24
    DC.B $18
    DC.B $3E
    DC.B $DA
    DC.B $26
    DC.B $1B
    DC.B $9F
    DC.B $98
    DC.B $A6
    DC.B $3E
    DC.B $80
    DC.B $23
    DC.B $09
    DC.B $1E
    DC.B $24
    DC.B $13
    DC.B $25
    DC.B $3F
    DC.B $3E
    DC.B $1B
    DC.B $3E
    DC.B $9F
    DC.B $5A
    DC.B $3E
    DC.B $21
    DC.B $3E
    DC.B $23
    DC.B $21
    DC.B $9D
    DC.B $3E
    DC.B $DA
    DC.B $23
    DC.B $21
    DC.B $96

    DC.B $13
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $19
    DC.B $00
    DC.B $00
    DC.B $03
    DC.B $00
    DC.B $0B
    DC.B $03
    DC.B $00
    DC.B $0F
    DC.B $83
    DC.B $03
    DC.B $8F
    DC.B $00
    DC.B $03
    DC.B $97
    DC.B $03
    DC.B $23
    DC.B $00
    DC.B $03
    DC.B $00
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $83
    DC.B $00
    DC.B $0F
    DC.B $17
    DC.B $03
    DC.B $23
    DC.B $1A
    DC.B $1B
    DC.B $1B
    DC.B $03
    DC.B $17
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $0F
    DC.B $16
    DC.B $03
    DC.B $00
    DC.B $0F
    DC.B $03
    DC.B $39
    DC.B $23
    DC.B $1A
    DC.B $23
    DC.B $03
    DC.B $00
    DC.B $0F
    DC.B $A3
    DC.B $8E
    DC.B $23
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $07
    DC.B $99
    DC.B $39
    DC.B $03
    DC.B $0F
    DC.B $09
    DC.B $83
    DC.B $03
    DC.B $23
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $99
    DC.B $0F
    DC.B $03
    DC.B $96
    DC.B $03
    DC.B $19
    DC.B $99
    DC.B $19
    DC.B $96
    DC.B $03
    DC.B $19
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $00
    DC.B $83
    DC.B $03
    DC.B $00
    DC.B $19
    DC.B $0F
    DC.B $11
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $00
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $03
    DC.B $99

    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $01
    DC.B $07
    DC.B $07
    DC.B $05
    DC.B $07
    DC.B $00
    DC.B $05
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $10
    DC.B $01
    DC.B $01
    DC.B $00
    DC.B $07
    DC.B $01
    DC.B $07
    DC.B $01
    DC.B $01
    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $10
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $05
    DC.B $00
    DC.B $01
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $17
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $37
    DC.B $00
    DC.B $01
    DC.B $07
    DC.B $07
    DC.B $00
    DC.B $03
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $10
    DC.B $10
    DC.B $01
    DC.B $00
    DC.B $01
    DC.B $11
    DC.B $01
    DC.B $07
    DC.B $00
    DC.B $01
    DC.B $01
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $07
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $10
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $07
    DC.B $02
    DC.B $01
    DC.B $07
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $00
    DC.B $10
    DC.B $07
    DC.B $00
    DC.B $00



_off011_8D00_01:  ; orig: _off011_8D00_01:
_off011_8D00_02:  ; orig: _off011_8D00_02:
_off011_8D00_03:  ; orig: _off011_8D00_03:
_off011_8D00_04:  ; orig: _off011_8D00_04:
_off011_8D00_05:  ; orig: _off011_8D00_05:
_off011_8D00_06:  ; orig: _off011_8D00_06:
    DC.B $22
    DC.B $26
    DC.B $22
    DC.B $04
    DC.B $32
    DC.B $26
    DC.B $26
    DC.B $32
    DC.B $26
    DC.B $3B
    DC.B $36
    DC.B $3A
    DC.B $2A
    DC.B $32
    DC.B $26
    DC.B $0E
    DC.B $E6
    DC.B $26
    DC.B $06
    DC.B $22
    DC.B $82
    DC.B $36
    DC.B $22
    DC.B $86
    DC.B $26
    DC.B $22
    DC.B $A2
    DC.B $22
    DC.B $52
    DC.B $82
    DC.B $22
    DC.B $22
    DC.B $22
    DC.B $01
    DC.B $22
    DC.B $02
    DC.B $02
    DC.B $A2
    DC.B $FE
    DC.B $3E
    DC.B $18
    DC.B $E2
    DC.B $0A
    DC.B $F6
    DC.B $82
    DC.B $02
    DC.B $E6
    DC.B $FE
    DC.B $E6
    DC.B $22
    DC.B $E6
    DC.B $0A
    DC.B $12
    DC.B $02
    DC.B $06
    DC.B $02
    DC.B $3E
    DC.B $1E
    DC.B $46
    DC.B $A6
    DC.B $1E
    DC.B $06
    DC.B $26
    DC.B $EA
    DC.B $3E
    DC.B $06
    DC.B $36
    DC.B $46
    DC.B $92
    DC.B $E2
    DC.B $51
    DC.B $02
    DC.B $E6
    DC.B $02
    DC.B $32
    DC.B $22
    DC.B $1E
    DC.B $26
    DC.B $26
    DC.B $42
    DC.B $1E
    DC.B $26
    DC.B $A6
    DC.B $22
    DC.B $82
    DC.B $02
    DC.B $30
    DC.B $02
    DC.B $11
    DC.B $1E
    DC.B $86
    DC.B $02
    DC.B $E2
    DC.B $26
    DC.B $46
    DC.B $F6
    DC.B $06
    DC.B $36
    DC.B $22
    DC.B $06
    DC.B $02
    DC.B $02
    DC.B $36
    DC.B $02
    DC.B $32
    DC.B $02
    DC.B $1F
    DC.B $FE
    DC.B $06
    DC.B $22
    DC.B $22
    DC.B $A6
    DC.B $26
    DC.B $A6
    DC.B $02
    DC.B $06
    DC.B $02
    DC.B $02
    DC.B $A6
    DC.B $02
    DC.B $86
    DC.B $02
    DC.B $12
    DC.B $06
    DC.B $26
    DC.B $02
    DC.B $06
    DC.B $5E

    DC.B $26
    DC.B $3E
    DC.B $06
    DC.B $24
    DC.B $36
    DC.B $BE
    DC.B $06
    DC.B $3E
    DC.B $06
    DC.B $7B
    DC.B $27
    DC.B $3A
    DC.B $28
    DC.B $5C
    DC.B $06
    DC.B $6F
    DC.B $36
    DC.B $A6
    DC.B $26
    DC.B $3F
    DC.B $E7
    DC.B $26
    DC.B $26
    DC.B $37
    DC.B $A6
    DC.B $22
    DC.B $06
    DC.B $26
    DC.B $2B
    DC.B $47
    DC.B $27
    DC.B $06
    DC.B $26
    DC.B $71
    DC.B $26
    DC.B $2B
    DC.B $46
    DC.B $24
    DC.B $27
    DC.B $26
    DC.B $68
    DC.B $33
    DC.B $86
    DC.B $26
    DC.B $23
    DC.B $12
    DC.B $87
    DC.B $27
    DC.B $26
    DC.B $23
    DC.B $05
    DC.B $33
    DC.B $86
    DC.B $27
    DC.B $26
    DC.B $36
    DC.B $A6
    DC.B $26
    DC.B $46
    DC.B $26
    DC.B $23
    DC.B $12
    DC.B $86
    DC.B $27
    DC.B $22
    DC.B $E6
    DC.B $30
    DC.B $83
    DC.B $07
    DC.B $27
    DC.B $51
    DC.B $23
    DC.B $07
    DC.B $37
    DC.B $A2
    DC.B $06
    DC.B $36
    DC.B $AA
    DC.B $44
    DC.B $46
    DC.B $27
    DC.B $22
    DC.B $17
    DC.B $A3
    DC.B $07
    DC.B $26
    DC.B $76
    DC.B $26
    DC.B $22
    DC.B $36
    DC.B $B2
    DC.B $87
    DC.B $37
    DC.B $BE
    DC.B $06
    DC.B $27
    DC.B $23
    DC.B $02
    DC.B $07
    DC.B $23
    DC.B $07
    DC.B $36
    DC.B $A6
    DC.B $32
    DC.B $86
    DC.B $26
    DC.B $1F
    DC.B $26
    DC.B $22
    DC.B $E3
    DC.B $06
    DC.B $26
    DC.B $2B
    DC.B $46
    DC.B $27
    DC.B $36
    DC.B $27
    DC.B $27
    DC.B $26
    DC.B $23
    DC.B $06
    DC.B $27
    DC.B $12
    DC.B $26
    DC.B $23
    DC.B $03
    DC.B $06
    DC.B $5E

    DC.B $00
    DC.B $63
    DC.B $33
    DC.B $69
    DC.B $DB
    DC.B $03
    DC.B $6D
    DC.B $3D
    DC.B $00
    DC.B $68
    DC.B $AD
    DC.B $68
    DC.B $12
    DC.B $11
    DC.B $2C
    DC.B $6B
    DC.B $04
    DC.B $52
    DC.B $2D
    DC.B $7B
    DC.B $7B
    DC.B $86
    DC.B $00
    DC.B $05
    DC.B $F9
    DC.B $3C
    DC.B $4B
    DC.B $00
    DC.B $FE
    DC.B $DB
    DC.B $8C
    DC.B $B8
    DC.B $00
    DC.B $68
    DC.B $DD
    DC.B $52
    DC.B $2C
    DC.B $36
    DC.B $33
    DC.B $01
    DC.B $6A
    DC.B $DB
    DC.B $DB
    DC.B $03
    DC.B $53
    DC.B $00
    DC.B $32
    DC.B $31
    DC.B $86
    DC.B $FC
    DC.B $3C
    DC.B $FD
    DC.B $DB
    DC.B $AA
    DC.B $3C
    DC.B $D5
    DC.B $32
    DC.B $70
    DC.B $00
    DC.B $0B
    DC.B $AD
    DC.B $B0
    DC.B $35
    DC.B $0B
    DC.B $F7
    DC.B $53
    DC.B $12
    DC.B $F6
    DC.B $F1
    DC.B $45
    DC.B $69
    DC.B $05
    DC.B $EE
    DC.B $DB
    DC.B $B0
    DC.B $4B
    DC.B $8C
    DC.B $4B
    DC.B $0F
    DC.B $00
    DC.B $FD
    DC.B $09
    DC.B $FC
    DC.B $72
    DC.B $FC
    DC.B $A8
    DC.B $69
    DC.B $6A
    DC.B $68
    DC.B $13
    DC.B $0B
    DC.B $EE
    DC.B $FE
    DC.B $3D
    DC.B $B0
    DC.B $38
    DC.B $72
    DC.B $F6
    DC.B $AD
    DC.B $FD
    DC.B $7B
    DC.B $86
    DC.B $31
    DC.B $06
    DC.B $9B
    DC.B $70
    DC.B $6A
    DC.B $13
    DC.B $B8
    DC.B $38
    DC.B $6C
    DC.B $2D
    DC.B $DD
    DC.B $FD
    DC.B $00
    DC.B $6A
    DC.B $00
    DC.B $C0
    DC.B $E7
    DC.B $00
    DC.B $46
    DC.B $00
    DC.B $69
    DC.B $70
    DC.B $EF
    DC.B $00
    DC.B $6D
    DC.B $6A

    DC.B $29
    DC.B $5C
    DC.B $06
    DC.B $3E
    DC.B $1C
    DC.B $85
    DC.B $46
    DC.B $04
    DC.B $29
    DC.B $3E
    DC.B $A3
    DC.B $3F
    DC.B $A6
    DC.B $A6
    DC.B $5F
    DC.B $3E
    DC.B $85
    DC.B $1B
    DC.B $1B
    DC.B $A4
    DC.B $8B
    DC.B $03
    DC.B $29
    DC.B $24
    DC.B $9B
    DC.B $00
    DC.B $02
    DC.B $29
    DC.B $95
    DC.B $13
    DC.B $23
    DC.B $CC
    DC.B $29
    DC.B $3E
    DC.B $1C
    DC.B $19
    DC.B $47
    DC.B $26
    DC.B $24
    DC.B $9D
    DC.B $3E
    DC.B $23
    DC.B $0E
    DC.B $85
    DC.B $17
    DC.B $60
    DC.B $24
    DC.B $24
    DC.B $1B
    DC.B $98
    DC.B $25
    DC.B $93
    DC.B $0E
    DC.B $23
    DC.B $4A
    DC.B $1E
    DC.B $25
    DC.B $07
    DC.B $1C
    DC.B $1B
    DC.B $95
    DC.B $83
    DC.B $26
    DC.B $23
    DC.B $8D
    DC.B $26
    DC.B $A6
    DC.B $94
    DC.B $98
    DC.B $24
    DC.B $3F
    DC.B $15
    DC.B $98
    DC.B $23
    DC.B $8D
    DC.B $0A
    DC.B $06
    DC.B $0A
    DC.B $A6
    DC.B $29
    DC.B $95
    DC.B $C1
    DC.B $A3
    DC.B $95
    DC.B $A4
    DC.B $11
    DC.B $3E
    DC.B $1F
    DC.B $3E
    DC.B $4A
    DC.B $1E
    DC.B $A3
    DC.B $9F
    DC.B $04
    DC.B $CD
    DC.B $24
    DC.B $97
    DC.B $9D
    DC.B $A3
    DC.B $96
    DC.B $8C
    DC.B $0D
    DC.B $25
    DC.B $23
    DC.B $5A
    DC.B $10
    DC.B $3F
    DC.B $11
    DC.B $9D
    DC.B $23
    DC.B $1F
    DC.B $1B
    DC.B $00
    DC.B $9B
    DC.B $21
    DC.B $3E
    DC.B $21
    DC.B $21
    DC.B $48
    DC.B $21
    DC.B $02
    DC.B $21
    DC.B $3F
    DC.B $1B
    DC.B $91
    DC.B $21
    DC.B $00
    DC.B $3F

    DC.B $1B
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $03
    DC.B $1A
    DC.B $1B
    DC.B $03
    DC.B $17
    DC.B $05
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $1A
    DC.B $23
    DC.B $03
    DC.B $00
    DC.B $19
    DC.B $1E
    DC.B $1B
    DC.B $23
    DC.B $19
    DC.B $19
    DC.B $03
    DC.B $1B
    DC.B $83
    DC.B $99
    DC.B $17
    DC.B $03
    DC.B $1B
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $1A
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $39
    DC.B $1A
    DC.B $80
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $19
    DC.B $0F
    DC.B $03
    DC.B $16
    DC.B $19
    DC.B $43
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $20
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $16
    DC.B $03
    DC.B $17
    DC.B $03
    DC.B $17
    DC.B $0D
    DC.B $00
    DC.B $17
    DC.B $19
    DC.B $19
    DC.B $00
    DC.B $19
    DC.B $00
    DC.B $03
    DC.B $1B
    DC.B $83
    DC.B $0F
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $03
    DC.B $16
    DC.B $03
    DC.B $03
    DC.B $16
    DC.B $19
    DC.B $83
    DC.B $03
    DC.B $63
    DC.B $1A
    DC.B $97
    DC.B $0F
    DC.B $83
    DC.B $99
    DC.B $80
    DC.B $03
    DC.B $1A
    DC.B $19
    DC.B $03
    DC.B $19
    DC.B $0C
    DC.B $19
    DC.B $16
    DC.B $03
    DC.B $03
    DC.B $63
    DC.B $99
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $16
    DC.B $03
    DC.B $1D
    DC.B $03
    DC.B $0A
    DC.B $0F
    DC.B $99
    DC.B $03
    DC.B $03
    DC.B $11

    DC.B $20
    DC.B $04
    DC.B $17
    DC.B $00
    DC.B $00
    DC.B $07
    DC.B $05
    DC.B $07
    DC.B $20
    DC.B $00
    DC.B $27
    DC.B $20
    DC.B $00
    DC.B $06
    DC.B $05
    DC.B $00
    DC.B $07
    DC.B $02
    DC.B $00
    DC.B $27
    DC.B $31
    DC.B $37
    DC.B $20
    DC.B $00
    DC.B $27
    DC.B $27
    DC.B $02
    DC.B $20
    DC.B $00
    DC.B $07
    DC.B $27
    DC.B $05
    DC.B $20
    DC.B $00
    DC.B $02
    DC.B $00
    DC.B $05
    DC.B $00
    DC.B $37
    DC.B $01
    DC.B $00
    DC.B $01
    DC.B $30
    DC.B $07
    DC.B $27
    DC.B $00
    DC.B $01
    DC.B $01
    DC.B $01
    DC.B $30
    DC.B $07
    DC.B $00
    DC.B $00
    DC.B $27
    DC.B $05
    DC.B $07
    DC.B $01
    DC.B $01
    DC.B $00
    DC.B $27
    DC.B $00
    DC.B $27
    DC.B $06
    DC.B $01
    DC.B $01
    DC.B $27
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $21
    DC.B $20
    DC.B $17
    DC.B $31
    DC.B $20
    DC.B $17
    DC.B $27
    DC.B $27
    DC.B $27
    DC.B $00
    DC.B $20
    DC.B $01
    DC.B $35
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $27
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $04
    DC.B $17
    DC.B $27
    DC.B $01
    DC.B $01
    DC.B $05
    DC.B $07
    DC.B $27
    DC.B $07
    DC.B $00
    DC.B $10
    DC.B $27
    DC.B $00
    DC.B $17
    DC.B $27
    DC.B $00
    DC.B $17
    DC.B $20
    DC.B $17
    DC.B $27
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $25
    DC.B $00
    DC.B $27
    DC.B $00
    DC.B $20
    DC.B $27
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $20



_off011_9000_07:  ; orig: _off011_9000_07:
_off011_9000_08:  ; orig: _off011_9000_08:
_off011_9000_09:  ; orig: _off011_9000_09:
    DC.B $26
    DC.B $22
    DC.B $18
    DC.B $29
    DC.B $19
    DC.B $49
    DC.B $26
    DC.B $3E
    DC.B $22
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $22
    DC.B $26
    DC.B $06
    DC.B $26
    DC.B $3E
    DC.B $22
    DC.B $22
    DC.B $46
    DC.B $E6
    DC.B $EA
    DC.B $26
    DC.B $22
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $02
    DC.B $08
    DC.B $6A
    DC.B $32
    DC.B $02
    DC.B $02
    DC.B $02
    DC.B $69
    DC.B $78
    DC.B $56
    DC.B $32
    DC.B $06
    DC.B $38
    DC.B $48
    DC.B $22
    DC.B $22
    DC.B $02
    DC.B $5B
    DC.B $3E
    DC.B $92
    DC.B $F6
    DC.B $12
    DC.B $06
    DC.B $3E
    DC.B $5C
    DC.B $A6
    DC.B $86
    DC.B $3E
    DC.B $3E
    DC.B $3E
    DC.B $F6
    DC.B $E2
    DC.B $02
    DC.B $22
    DC.B $16
    DC.B $8A
    DC.B $A2
    DC.B $82
    DC.B $52
    DC.B $12
    DC.B $2A
    DC.B $26
    DC.B $22
    DC.B $16
    DC.B $1E
    DC.B $1E
    DC.B $B2
    DC.B $1E
    DC.B $02
    DC.B $06
    DC.B $B6
    DC.B $22
    DC.B $02
    DC.B $02
    DC.B $82
    DC.B $82
    DC.B $46
    DC.B $2A
    DC.B $EA
    DC.B $A6
    DC.B $06
    DC.B $06
    DC.B $82
    DC.B $E2
    DC.B $02
    DC.B $4A
    DC.B $A6
    DC.B $06
    DC.B $12
    DC.B $E2
    DC.B $06
    DC.B $26
    DC.B $1A
    DC.B $46
    DC.B $46
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $06
    DC.B $02
    DC.B $02
    DC.B $2A
    DC.B $73
    DC.B $01
    DC.B $86
    DC.B $02
    DC.B $06
    DC.B $45
    DC.B $00
    DC.B $26
    DC.B $22
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $06
    DC.B $02

    DC.B $2A
    DC.B $46
    DC.B $6F
    DC.B $5F
    DC.B $4F
    DC.B $0A
    DC.B $26
    DC.B $26
    DC.B $32
    DC.B $87
    DC.B $22
    DC.B $F7
    DC.B $B3
    DC.B $9F
    DC.B $FE
    DC.B $E7
    DC.B $3F
    DC.B $E3
    DC.B $0B
    DC.B $48
    DC.B $22
    DC.B $12
    DC.B $9F
    DC.B $E7
    DC.B $22
    DC.B $E6
    DC.B $26
    DC.B $22
    DC.B $FE
    DC.B $F7
    DC.B $A6
    DC.B $27
    DC.B $58
    DC.B $4D
    DC.B $37
    DC.B $A3
    DC.B $E3
    DC.B $06
    DC.B $3F
    DC.B $3A
    DC.B $23
    DC.B $E6
    DC.B $26
    DC.B $38
    DC.B $48
    DC.B $26
    DC.B $26
    DC.B $24
    DC.B $2E
    DC.B $22
    DC.B $03
    DC.B $E2
    DC.B $02
    DC.B $26
    DC.B $06
    DC.B $1E
    DC.B $26
    DC.B $27
    DC.B $3E
    DC.B $04
    DC.B $27
    DC.B $27
    DC.B $27
    DC.B $26
    DC.B $32
    DC.B $9E
    DC.B $02
    DC.B $3F
    DC.B $E7
    DC.B $2A
    DC.B $53
    DC.B $87
    DC.B $36
    DC.B $A6
    DC.B $3E
    DC.B $02
    DC.B $E4
    DC.B $26
    DC.B $27
    DC.B $27
    DC.B $37
    DC.B $A7
    DC.B $26
    DC.B $27
    DC.B $2B
    DC.B $4B
    DC.B $5E
    DC.B $06
    DC.B $3E
    DC.B $06
    DC.B $27
    DC.B $26
    DC.B $26
    DC.B $26
    DC.B $27
    DC.B $26
    DC.B $7D
    DC.B $23
    DC.B $1F
    DC.B $E3
    DC.B $FC
    DC.B $03
    DC.B $07
    DC.B $7C
    DC.B $23
    DC.B $16
    DC.B $A6
    DC.B $20
    DC.B $E2
    DC.B $E6
    DC.B $27
    DC.B $26
    DC.B $2A
    DC.B $35
    DC.B $15
    DC.B $22
    DC.B $27
    DC.B $57
    DC.B $45
    DC.B $00
    DC.B $22
    DC.B $03
    DC.B $03
    DC.B $E3
    DC.B $02
    DC.B $FE
    DC.B $07
    DC.B $27

    DC.B $3B
    DC.B $07
    DC.B $69
    DC.B $69
    DC.B $69
    DC.B $69
    DC.B $EC
    DC.B $37
    DC.B $01
    DC.B $31
    DC.B $AD
    DC.B $31
    DC.B $FF
    DC.B $38
    DC.B $85
    DC.B $45
    DC.B $72
    DC.B $F1
    DC.B $F6
    DC.B $0D
    DC.B $ED
    DC.B $7B
    DC.B $08
    DC.B $3E
    DC.B $86
    DC.B $6C
    DC.B $DB
    DC.B $00
    DC.B $05
    DC.B $4C
    DC.B $FE
    DC.B $EE
    DC.B $69
    DC.B $39
    DC.B $A3
    DC.B $FC
    DC.B $00
    DC.B $00
    DC.B $C5
    DC.B $39
    DC.B $31
    DC.B $F5
    DC.B $B8
    DC.B $39
    DC.B $69
    DC.B $00
    DC.B $EE
    DC.B $36
    DC.B $6A
    DC.B $F7
    DC.B $FD
    DC.B $00
    DC.B $00
    DC.B $2D
    DC.B $72
    DC.B $69
    DC.B $FF
    DC.B $45
    DC.B $2D
    DC.B $11
    DC.B $3C
    DC.B $31
    DC.B $33
    DC.B $38
    DC.B $AD
    DC.B $00
    DC.B $53
    DC.B $A4
    DC.B $08
    DC.B $7B
    DC.B $07
    DC.B $B3
    DC.B $AA
    DC.B $FF
    DC.B $F0
    DC.B $00
    DC.B $11
    DC.B $01
    DC.B $8C
    DC.B $85
    DC.B $3A
    DC.B $DD
    DC.B $F1
    DC.B $F7
    DC.B $AD
    DC.B $DD
    DC.B $7B
    DC.B $FD
    DC.B $E8
    DC.B $00
    DC.B $8C
    DC.B $CC
    DC.B $8C
    DC.B $BA
    DC.B $4C
    DC.B $E8
    DC.B $69
    DC.B $52
    DC.B $F6
    DC.B $3B
    DC.B $0B
    DC.B $7B
    DC.B $FC
    DC.B $69
    DC.B $F5
    DC.B $DB
    DC.B $85
    DC.B $0F
    DC.B $FF
    DC.B $3D
    DC.B $FE
    DC.B $AD
    DC.B $39
    DC.B $38
    DC.B $C5
    DC.B $FD
    DC.B $00
    DC.B $B5
    DC.B $CA
    DC.B $46
    DC.B $AD
    DC.B $00
    DC.B $B8
    DC.B $FE
    DC.B $F4
    DC.B $3C
    DC.B $FE
    DC.B $00

    DC.B $4A
    DC.B $CA
    DC.B $3E
    DC.B $3E
    DC.B $3E
    DC.B $3E
    DC.B $62
    DC.B $27
    DC.B $DA
    DC.B $24
    DC.B $5F
    DC.B $24
    DC.B $95
    DC.B $24
    DC.B $0C
    DC.B $23
    DC.B $95
    DC.B $A3
    DC.B $99
    DC.B $A6
    DC.B $00
    DC.B $CE
    DC.B $A3
    DC.B $28
    DC.B $62
    DC.B $4A
    DC.B $5A
    DC.B $29
    DC.B $85
    DC.B $24
    DC.B $9B
    DC.B $96
    DC.B $3E
    DC.B $3E
    DC.B $23
    DC.B $96
    DC.B $60
    DC.B $60
    DC.B $3E
    DC.B $3E
    DC.B $23
    DC.B $CD
    DC.B $DF
    DC.B $3F
    DC.B $3F
    DC.B $29
    DC.B $C1
    DC.B $26
    DC.B $3E
    DC.B $81
    DC.B $A3
    DC.B $60
    DC.B $60
    DC.B $4A
    DC.B $88
    DC.B $3E
    DC.B $C8
    DC.B $23
    DC.B $62
    DC.B $A6
    DC.B $24
    DC.B $24
    DC.B $23
    DC.B $46
    DC.B $23
    DC.B $60
    DC.B $26
    DC.B $12
    DC.B $A3
    DC.B $E2
    DC.B $A4
    DC.B $A3
    DC.B $51
    DC.B $C8
    DC.B $4A
    DC.B $60
    DC.B $A6
    DC.B $C7
    DC.B $23
    DC.B $18
    DC.B $24
    DC.B $0D
    DC.B $83
    DC.B $94
    DC.B $96
    DC.B $0F
    DC.B $8C
    DC.B $DF
    DC.B $62
    DC.B $60
    DC.B $23
    DC.B $5F
    DC.B $51
    DC.B $9E
    DC.B $24
    DC.B $51
    DC.B $3E
    DC.B $23
    DC.B $A3
    DC.B $1D
    DC.B $A6
    DC.B $95
    DC.B $A3
    DC.B $3E
    DC.B $96
    DC.B $0F
    DC.B $5A
    DC.B $A6
    DC.B $C8
    DC.B $04
    DC.B $98
    DC.B $4A
    DC.B $3F
    DC.B $3E
    DC.B $3E
    DC.B $9D
    DC.B $21
    DC.B $3E
    DC.B $3F
    DC.B $3F
    DC.B $DF
    DC.B $21
    DC.B $A3
    DC.B $93
    DC.B $D1
    DC.B $46
    DC.B $95
    DC.B $21

    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $19
    DC.B $03
    DC.B $80
    DC.B $0F
    DC.B $03
    DC.B $19
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $23
    DC.B $8E
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $1B
    DC.B $1A
    DC.B $20
    DC.B $03
    DC.B $96
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $10
    DC.B $0B
    DC.B $1B
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $19
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $17
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $1A
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $16
    DC.B $03
    DC.B $0F
    DC.B $03
    DC.B $17
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $43
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $8F
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $00
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $0F
    DC.B $03
    DC.B $03
    DC.B $0F
    DC.B $03
    DC.B $80
    DC.B $03
    DC.B $83
    DC.B $0F
    DC.B $03
    DC.B $0F
    DC.B $03
    DC.B $00
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $97
    DC.B $03
    DC.B $07
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $03
    DC.B $09
    DC.B $13
    DC.B $16
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $03
    DC.B $03
    DC.B $83
    DC.B $03

    DC.B $05
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $20
    DC.B $00
    DC.B $27
    DC.B $15
    DC.B $01
    DC.B $17
    DC.B $17
    DC.B $01
    DC.B $27
    DC.B $17
    DC.B $01
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $01
    DC.B $03
    DC.B $05
    DC.B $05
    DC.B $00
    DC.B $20
    DC.B $17
    DC.B $27
    DC.B $00
    DC.B $37
    DC.B $00
    DC.B $20
    DC.B $00
    DC.B $10
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $05
    DC.B $20
    DC.B $20
    DC.B $20
    DC.B $25
    DC.B $00
    DC.B $00
    DC.B $01
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $05
    DC.B $27
    DC.B $05
    DC.B $06
    DC.B $07
    DC.B $07
    DC.B $01
    DC.B $05
    DC.B $00
    DC.B $00
    DC.B $17
    DC.B $01
    DC.B $27
    DC.B $05
    DC.B $27
    DC.B $00
    DC.B $05
    DC.B $05
    DC.B $05
    DC.B $00
    DC.B $06
    DC.B $05
    DC.B $01
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $37
    DC.B $00
    DC.B $05
    DC.B $05
    DC.B $00
    DC.B $27
    DC.B $05
    DC.B $05
    DC.B $17
    DC.B $27
    DC.B $05
    DC.B $00
    DC.B $17
    DC.B $01
    DC.B $27
    DC.B $00
    DC.B $00
    DC.B $27
    DC.B $00
    DC.B $37
    DC.B $00
    DC.B $17
    DC.B $00
    DC.B $04
    DC.B $01
    DC.B $37
    DC.B $05
    DC.B $20
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $20
    DC.B $20
    DC.B $15
    DC.B $00
    DC.B $00
    DC.B $01
    DC.B $05
    DC.B $04
    DC.B $00
    DC.B $00



_off010_9300_00:  ; orig: _off010_9300_00:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $1A, $37, $12
    DC.B $0F, $17, $37, $12

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0C, $1C, $2C

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $01
    DC.B $04
    DC.B $05
    DC.B $06



    DC.B $8D



    DC.B $57
    DC.B $49
    DC.B $99
    DC.B $69
    DC.B $00
    DC.B $00
    DC.B $77
    DC.B $2A
    ; [DIRECTIVE] .WORD ram_067F  -- needs manual handling  ; orig: - D 0 - I - 0x019341 06:9331: 7F 06     .word ram_0
    DC.B $00
    DC.B $1D
    DC.B $23
    DC.B $49
    DC.B $79
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $2A
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF




; HUD minimap ram_6BCD
    DC.W $2062
    DC.B $48
    DC.B $F5

    DC.W $2082
    DC.B $48
    DC.B $F5

    DC.W $20A2
    DC.B $48
    DC.B $F5

    DC.W $20C2
    DC.B $48
    DC.B $F5

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 08
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 10
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 18
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 20
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 28
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 30
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 38
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 40
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 48
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 50
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 58
    DC.B $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_93FC_01:  ; orig: _off010_93FC_01:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $0C, $1C, $2C
    DC.B $0F, $12, $1C, $2C

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0C, $1C, $2C

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $C9
    DC.B $AC
    DC.B $89
    DC.B $87
    DC.B $04
    DC.B $00
    DC.B $73
    DC.B $36
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x01943D 06:942D: FF 06     .word ram_0
    DC.B $01
    DC.B $7F
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $35
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $08
    DC.B $2D
    DC.B $3F
    DC.B $0D
    DC.B $18
    DC.B $10
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2084
    DC.B $05
    DC.B $67, $FF, $24, $FB, $FB

    DC.W $20A3
    DC.B $05
    DC.B $67, $FF, $FF, $FF, $67

    DC.W $20C4
    DC.B $03
    DC.B $FB, $FF, $FB

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $0C, $1C, $2C
    DC.B $0F, $12, $1C, $2C

; 08
    DC.B $0F, $0C, $0C, $1C
    DC.B $0F, $11, $0C, $1C

; 10
    DC.B $0F, $0F, $0C, $0C
    DC.B $0F, $02, $0C, $0C

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $0C, $1C, $2C
    DC.B $0F, $12, $1C, $2C

; 48
    DC.B $0F, $0C, $0C, $1C
    DC.B $0F, $11, $0C, $1C

; 50
    DC.B $0F, $0F, $0C, $0C
    DC.B $0F, $02, $0C, $0C

; 58
    DC.B $0F, $0F, $0F, $0C
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_94F8_02:  ; orig: _off010_94F8_02:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $02, $12, $22
    DC.B $0F, $16, $12, $22

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $02, $12, $22

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $0A
    DC.B $B0
    DC.B $7D
    DC.B $0D
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x019539 06:9529: FF 06     .word ram_0
    DC.B $02
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $0E
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $02
    DC.B $83
    DC.B $FF
    DC.B $7E
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2065
    DC.B $03
    DC.B $67, $FF, $FB

    DC.W $2086
    DC.B $02
    DC.B $FF, $FF

    DC.W $20A6
    DC.B $02
    DC.B $FF, $FF

    DC.W $20C4
    DC.B $04
    DC.B $67, $FF, $FF, $67

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $02, $12, $22
    DC.B $0F, $16, $12, $22

; 08
    DC.B $0F, $01, $02, $12
    DC.B $0F, $17, $02, $12

; 10
    DC.B $0F, $0F, $01, $02
    DC.B $0F, $06, $01, $02

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $02, $12, $22
    DC.B $0F, $16, $12, $22

; 48
    DC.B $0F, $01, $02, $12
    DC.B $0F, $17, $02, $12

; 50
    DC.B $0F, $0F, $01, $02
    DC.B $0F, $06, $01, $02

; 58
    DC.B $0F, $0F, $0F, $01
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_95F4_03:  ; orig: _off010_95F4_03:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $0B, $1B, $2B
    DC.B $0F, $16, $1B, $2B

    DC.B $0F, $29, $37, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0B, $1B, $2B

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $0C
    DC.B $C0
    DC.B $7C
    DC.B $3D
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x019635 06:9625: FF 06     .word ram_0
    DC.B $03
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $4D
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $0E
    DC.B $2C
    DC.B $3F
    DC.B $0D
    DC.B $1C
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2084
    DC.B $04
    DC.B $67, $FF, $24, $FB

    DC.W $20A3
    DC.B $05
    DC.B $FF, $FF, $FF, $FF, $FF

    DC.W $20C3
    DC.B $04
    DC.B $67, $24, $FF, $FB

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $0B, $1B, $2B
    DC.B $0F, $16, $1B, $2B

; 08
    DC.B $0F, $0B, $0B, $1B
    DC.B $0F, $17, $0B, $1B

; 10
    DC.B $0F, $0F, $0B, $0B
    DC.B $0F, $06, $0B, $0B

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $0B, $1B, $2B
    DC.B $0F, $16, $1B, $2B

; 48
    DC.B $0F, $0B, $0B, $1B
    DC.B $0F, $17, $0B, $1B

; 50
    DC.B $0F, $0F, $0B, $0B
    DC.B $0F, $06, $0B, $0B

; 58
    DC.B $0F, $0F, $0F, $0B
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_96F0_04:  ; orig: _off010_96F0_04:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $08, $18, $28
    DC.B $0F, $12, $18, $28

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0F, $18, $28

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $DC
    DC.B $99
    DC.B $88
    DC.B $89
    DC.B $06
    DC.B $10
    DC.B $71
    DC.B $03
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x019731 06:9721: FF 06     .word ram_0
    DC.B $04
    DC.B $60
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $13
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $FD
    DC.B $B7
    DC.B $D2
    DC.B $C0
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2064
    DC.B $04
    DC.B $FF, $67, $FF, $FF

    DC.W $2084
    DC.B $03
    DC.B $FF, $FF, $FB

    DC.W $20A4
    DC.B $02
    DC.B $FF, $FB

    DC.W $20C4
    DC.B $03
    DC.B $FB, $FF, $67

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $08, $18, $28
    DC.B $0F, $12, $18, $28

; 08
    DC.B $0F, $08, $08, $18
    DC.B $0F, $11, $08, $18

; 10
    DC.B $0F, $0F, $08, $08
    DC.B $0F, $02, $08, $08

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $08, $18, $28
    DC.B $0F, $12, $18, $28

; 48
    DC.B $0F, $08, $08, $18
    DC.B $0F, $11, $08, $18

; 50
    DC.B $0F, $0F, $08, $08
    DC.B $0F, $02, $08, $08

; 58
    DC.B $0F, $0F, $0F, $08
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_97EC_05:  ; orig: _off010_97EC_05:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $16, $1A, $2A

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0A, $1A, $2A

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $87
    DC.B $C8
    DC.B $8A
    DC.B $89
    DC.B $02
    DC.B $F0
    DC.B $76
    DC.B $14
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x01982D 06:981D: FF 06     .word ram_0
    DC.B $05
    DC.B $07
    DC.B $04
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $24
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $72
    DC.B $A6
    DC.B $EF
    DC.B $7F
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2064
    DC.B $04
    DC.B $FB, $67, $FF, $FB

    DC.W $2084
    DC.B $04
    DC.B $FF, $67, $67, $FF

    DC.W $20A5
    DC.B $03
    DC.B $FB, $FF, $FF

    DC.W $20C4
    DC.B $04
    DC.B $67, $67, $FF, $FF

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $16, $1A, $2A

; 08
    DC.B $0F, $0A, $0A, $1A
    DC.B $0F, $17, $0A, $1A

; 10
    DC.B $0F, $0F, $0A, $0A
    DC.B $0F, $06, $0A, $0A

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $16, $1A, $2A

; 48
    DC.B $0F, $0A, $0A, $1A
    DC.B $0F, $17, $0A, $1A

; 50
    DC.B $0F, $0F, $0A, $0A
    DC.B $0F, $06, $0A, $0A

; 58
    DC.B $0F, $0F, $0F, $0A
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_98E8_06:  ; orig: _off010_98E8_06:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $08, $18, $28
    DC.B $0F, $16, $18, $28

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $08, $18, $28

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $0D
    DC.B $C8
    DC.B $79
    DC.B $0C
    ; [DIRECTIVE] .WORD ram_06FF  -- needs manual handling  ; orig: - D 0 - I - 0x019929 06:9919: FF 06     .word ram_0
    DC.B $06
    DC.B $08
    DC.B $75
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $1C
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $7F
    DC.B $F1
    DC.B $D3
    DC.B $C0
    DC.B $F0
    DC.B $60
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2063
    DC.B $06
    DC.B $FB, $FF, $FF, $FF, $FF, $FB

    DC.W $2083
    DC.B $06
    DC.B $FF, $FF, $FB, $24, $FF, $67

    DC.W $20A3
    DC.B $01
    DC.B $FF

    DC.W $20C3
    DC.B $03
    DC.B $FF, $FB, $FF

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $08, $18, $28
    DC.B $0F, $16, $18, $28

; 08
    DC.B $0F, $08, $08, $18
    DC.B $0F, $17, $08, $18

; 10
    DC.B $0F, $0F, $08, $08
    DC.B $0F, $06, $08, $08

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $08, $18, $28
    DC.B $0F, $16, $18, $28

; 48
    DC.B $0F, $08, $08, $18
    DC.B $0F, $17, $08, $18

; 50
    DC.B $0F, $0F, $08, $08
    DC.B $0F, $06, $08, $08

; 58
    DC.B $0F, $0F, $0F, $08
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_99E4_07:  ; orig: _off010_99E4_07:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $12, $1A, $2A

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0A, $1A, $2A

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $0D
    DC.B $C8
    DC.B $79
    DC.B $2B
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x019A25 06:9A15: 7F 07     .word ram_0
    DC.B $07
    DC.B $7B
    DC.B $4A
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $2A
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $7F
    DC.B $FF
    DC.B $B7
    DC.B $E6
    DC.B $C2
    DC.B $82
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2063
    DC.B $06
    DC.B $FB, $FF, $67, $FF, $FF, $67

    DC.W $2083
    DC.B $04
    DC.B $FF, $FF, $FF, $67

    DC.W $20A3
    DC.B $04
    DC.B $FF, $FF, $FB, $FB

    DC.W $20C3
    DC.B $06
    DC.B $FF, $FF, $FF, $67, $67, $67

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $12, $1A, $2A

; 08
    DC.B $0F, $0A, $0A, $1A
    DC.B $0F, $11, $0A, $1A

; 10
    DC.B $0F, $0F, $0A, $0A
    DC.B $0F, $02, $0A, $0A

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $0A, $1A, $2A
    DC.B $0F, $12, $1A, $2A

; 48
    DC.B $0F, $0A, $0A, $1A
    DC.B $0F, $11, $0A, $1A

; 50
    DC.B $0F, $0F, $0A, $0A
    DC.B $0F, $02, $0A, $0A

; 58
    DC.B $0F, $0F, $0F, $0A
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_9AE0_08:  ; orig: _off010_9AE0_08:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $00, $10, $30
    DC.B $0F, $22, $10, $30

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $00, $10, $30

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $0A
    DC.B $B0
    DC.B $7E
    DC.B $2C
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x019B21 06:9B11: 7F 07     .word ram_0
    DC.B $08
    DC.B $2F
    DC.B $0F
    DC.B $6F
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $FF
    DC.B $3C
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $18
    DC.B $3D
    DC.B $5D
    DC.B $FF
    DC.B $55
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2065
    DC.B $03
    DC.B $FB, $FF, $FB

    DC.W $2083
    DC.B $05
    DC.B $FB, $FF, $FB, $FF, $FB

    DC.W $20A3
    DC.B $05
    DC.B $67, $FF, $FF, $FF, $FB

    DC.W $20C4
    DC.B $04
    DC.B $FB, $FB, $FF, $FB

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $00, $10, $30
    DC.B $0F, $22, $10, $30

; 08
    DC.B $0F, $00, $00, $10
    DC.B $0F, $12, $00, $10

; 10
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $02, $00, $00

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $00, $10, $30
    DC.B $0F, $22, $10, $30

; 48
    DC.B $0F, $00, $00, $10
    DC.B $0F, $12, $00, $10

; 50
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $02, $00, $00

; 58
    DC.B $0F, $0F, $0F, $00
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



_off010_9BDC_09:  ; orig: _off010_9BDC_09:

; default palette
    DC.W $3F00
    DC.B $20
    DC.B $0F, $30, $00, $12
    DC.B $0F, $16, $27, $36
    DC.B $0F, $00, $10, $30
    DC.B $0F, $16, $10, $30

    DC.B $0F, $29, $27, $17
    DC.B $0F, $02, $22, $30
    DC.B $0F, $16, $27, $30
    DC.B $0F, $0F, $10, $30

    DC.B $FF




; enemy counter ram_6BA2 based on ram_69FE_map_data
    DC.B $03
    DC.B $05
    DC.B $06
    DC.B $08



    DC.B $DD



    DC.B $89
    DC.B $D6
    DC.B $26
    DC.B $2C
    DC.B $04
    DC.B $00
    DC.B $76
    DC.B $32
    ; [DIRECTIVE] .WORD ram_077F  -- needs manual handling  ; orig: - D 0 - I - 0x019C1D 06:9C0D: 7F 07     .word ram_0
    DC.B $09
    DC.B $60
    DC.B $70
    DC.B $72
    DC.B $75
    DC.B $67
    DC.B $77
    DC.B $00
    DC.B $4F
    DC.B $FF
    DC.B $FF
    DC.B $42
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $7C
    DC.B $FF
    DC.B $EE
    DC.B $FF
    DC.B $FF
    DC.B $EE
    DC.B $FF
    DC.B $7C
    DC.B $00
    DC.B $00
    DC.B $00
    DC.B $00




; HUD minimap ram_6BCD
    DC.W $2062
    DC.B $08
    DC.B $FB, $FF, $FF, $FF, $FF, $FF, $FF, $FB

    DC.W $2082
    DC.B $08
    DC.B $FF, $FF, $67, $FF, $FF, $67, $FF, $FF

    DC.W $20A2
    DC.B $48
    DC.B $FF

    DC.W $20C3
    DC.B $06
    DC.B $FF, $67, $FF, $FF, $67, $FF

    DC.B $FF

; filling with FF bytes up to the end of the range
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF




; custom palette ram_6BFA (see 0x006D4C)

; 00
    DC.B $0F, $00, $10, $30
    DC.B $0F, $16, $10, $30

; 08
    DC.B $0F, $00, $00, $10
    DC.B $0F, $17, $00, $10

; 10
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $06, $00, $00

; 18
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 20
    DC.B $0F, $00, $10, $30
    DC.B $0F, $00, $10, $30

; 28
    DC.B $0F, $00, $00, $10
    DC.B $0F, $00, $00, $10

; 30
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $0F, $00, $00

; 38
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F

; 40
    DC.B $0F, $00, $10, $30
    DC.B $0F, $16, $10, $30

; 48
    DC.B $0F, $00, $00, $10
    DC.B $0F, $17, $00, $10

; 50
    DC.B $0F, $0F, $00, $00
    DC.B $0F, $06, $00, $00

; 58
    DC.B $0F, $0F, $0F, $00
    DC.B $0F, $0F, $0F, $0F

; 60
    DC.B $0F, $06, $17, $16
    DC.B $0F, $06, $17, $16

; 68
    DC.B $0F, $07, $06, $16
    DC.B $0F, $07, $06, $16

; 70
    DC.B $0F, $0F, $07, $06
    DC.B $0F, $0F, $07, $06

; 78
    DC.B $0F, $0F, $0F, $0F
    DC.B $0F, $0F, $0F, $0F



ofs_9CD8_bank_s1_asm_export:  ; orig: ofs_9CD8_bank_s1_asm_export:
    ; [DIRECTIVE] .INCLUDE "copy_bank_s1.asm"  -- needs manual handling  ; orig: .include "copy_bank_s1.asm"




; 0x019D76-0x01C00F
    ; [DIRECTIVE] .ORG $9D66  -- needs manual handling  ; orig: .org $9D66




; bzk garbage
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF



tbl_A000_ppu_data:  ; orig: tbl_A000_ppu_data:

; PPU buffer pointer table: 64 entries x 2 bytes = 128 bytes (NES little-endian 16-bit addresses)
; RAM entries (NES $0000-$07FF) resolve correctly via +$FF0000. ROM/bat stored verbatim.
    DC.B $02,$03  ; $00  ram_0302_ppu_buffer (NES $0302)
    DC.B $FE,$A3  ; $02  _off000_A3FE_02_guide
    DC.B $B4,$A2  ; $04  _off000_A2B4_04_continue
    DC.B $14,$68  ; $06  _off000_bat_6814_06
    DC.B $8E,$A2  ; $08  _off000_A28E_08
    DC.B $96,$A2  ; $0A  _off000_A296_0A
    DC.B $1C,$68  ; $0C  _off000_bat_681C_0C_level_text
    DC.B $D3,$A2  ; $0E  _off000_A2D3_0E_hud
    DC.B $69,$A8  ; $10  _off000_A869_10_title_screen
    DC.B $F0,$67  ; $12  _off000_bat_67F0_12
    DC.B $00,$A1  ; $14  _off000_A100_14
    DC.B $83,$A1  ; $16  _off000_A183_16
    DC.B $7E,$6B  ; $18  ram_6B7E_palette_buffer (NES $6B7E)
    DC.B $02,$03  ; $1A  ram_0302_ppu_buffer
    DC.B $02,$03  ; $1C  ram_0302_ppu_buffer
    DC.B $1D,$A2  ; $1E  _off000_A21D_1E
    DC.B $45,$A2  ; $20  _off000_A245_20
    DC.B $4D,$A2  ; $22  _off000_A24D_22
    DC.B $55,$A2  ; $24  _off000_A255_24
    DC.B $69,$A2  ; $26  _off000_A269_26
    DC.B $02,$03  ; $28  ram_0302_ppu_buffer
    DC.B $26,$A2  ; $2A  _off000_A226_2A
    DC.B $C8,$A3  ; $2C  _off000_A3C8_2C
    DC.B $1C,$68  ; $2E  _off000_bat_681C_2E
    DC.B $16,$A3  ; $30  _off000_A316_30
    DC.B $23,$A3  ; $32  _off000_A323_32
    DC.B $37,$A3  ; $34  _off000_A337_34
    DC.B $02,$A2  ; $36  _off000_A202_36
    DC.B $48,$A3  ; $38  _off000_A348_38
    DC.B $50,$A3  ; $3A  _off000_A350_3A
    DC.B $60,$A3  ; $3C  _off000_A360_3C
    DC.B $5D,$A2  ; $3E  _off000_A25D_3E_cave_palette
    DC.B $78,$A3  ; $40  _off000_A378_40
    DC.B $9C,$A3  ; $42  _off000_A39C_42
    DC.B $CD,$6B  ; $44  ram_6BCD (NES $6BCD)
    DC.B $D0,$A3  ; $46  _off000_A3D0_46_game_over
    DC.B $B0,$A3  ; $48  _off000_A3B0_48
    DC.B $B9,$A3  ; $4A  _off000_A3B9_4A
    DC.B $BE,$A3  ; $4C  _off000_A3BE_4C
    DC.B $C3,$A3  ; $4E  _off000_A3C3_4E
    DC.B $2F,$A2  ; $50  _off000_A22F_50
    DC.B $47,$68  ; $52  _off000_bat_6847_52
    DC.B $4F,$68  ; $54  _off000_bat_684F_54
    DC.B $59,$68  ; $56  _off000_bat_6859_56
    DC.B $65,$68  ; $58  _off000_bat_6865_58
    DC.B $35,$A2  ; $5A  _off000_A235_5A
    DC.B $73,$68  ; $5C  _off000_bat_6873_5C_triforce_text
    DC.B $E8,$A3  ; $5E  _off000_A3E8_5E
    DC.B $F4,$A3  ; $60  _off000_A3F4_60
    DC.B $F9,$A3  ; $62  _off000_A3F9_62
    DC.B $02,$03  ; $64  ram_0302_ppu_buffer
    DC.B $02,$03  ; $66  ram_0302_ppu_buffer
    DC.B $02,$03  ; $68  ram_0302_ppu_buffer
    DC.B $0A,$A2  ; $6A  _off000_A20A_6A
    DC.B $9E,$A2  ; $6C  _off000_A29E_6C
    DC.B $02,$03  ; $6E  ram_0302_ppu_buffer
    DC.B $02,$03  ; $70  ram_0302_ppu_buffer
    DC.B $02,$03  ; $72  ram_0302_ppu_buffer
    DC.B $02,$03  ; $74  ram_0302_ppu_buffer
    DC.B $A6,$A2  ; $76  _off000_A2A6_76
    DC.B $72,$A2  ; $78  _off000_A272_78
    DC.B $7E,$A2  ; $7A  _off000_A27E_7A
    DC.B $86,$A2  ; $7C  _off000_A286_7C
    DC.B $02,$03  ; $7E  ram_0302_ppu_buffer

    EVEN


sub_0x01A090_write_buffer_to_ppu:  ; orig: sub_0x01A090_write_buffer_to_ppu:
    MOVEQ   #$00,D1        ; FIX v395: zero-extend buffer index before any D1.L table indexing
    MOVE.B  ram_ppu_load_index,D1  ; orig: C - - - - - 0x01A090 06:A080: A6 14     LDX ram_ppu_load_ind
    MOVE.W  D1,(TRACE_PPU_INDEX).l
    CLR.W   (TRACE_PPU_PTR_RAW).l
    CLR.L   (TRACE_PPU_PTR_RES).l
    CLR.B   (TRACE_PPU_ROM_REC_HI).l
    CLR.B   (TRACE_PPU_ROM_REC_LO).l
    CLR.B   (TRACE_PPU_ROM_REC_CTRL).l
    CLR.L   (TRACE_PPU_ROM_REC_DATA).l
    MOVEQ   #$00,D5
    MOVEA.L #tbl_A000_ppu_data+1,A0
    MOVE.B  (A0,D1.L),D5
    LSL.W   #8,D5
    MOVEA.L #tbl_A000_ppu_data,A0
    MOVE.B  (A0,D1.L),D5

    MOVE.W  D5,(TRACE_PPU_PTR_RAW).l
    MOVE.W  D1,(TRACE_PPU_EVT_ARG0).l
    MOVE.W  D5,(TRACE_PPU_EVT_ARG1).l
    CLR.W   (TRACE_PPU_EVT_ARG2).l
    TST.B   D1
    BNE     b06_bra_b06_trace_request_ready
    MOVE.B  ram_0302_ppu_buffer,D0
    ANDI.W  #$00FF,D0
    MOVE.W  D0,(TRACE_PPU_EVT_ARG2).l
b06_bra_b06_trace_request_ready:
    MOVE.W  #$04A9,D0
    BSR     TRACE_PPU_EVENT
    BSR     sub_b06_select_ppu_buffer_ptr
    MOVE.L  A1,(TRACE_PPU_PTR_RES).l
    MOVE.L  A1,D4
    BEQ     b06_bra_b06_ppu_legacy
    MOVE.W  #$0440,D0
    BSR     TRACE_MARK
    BSR     sub_b06_write_ppu_buffer_rom
    MOVE.W  #$0441,D0
    BSR     TRACE_MARK
    BRA     b06_bra_b06_ppu_cleanup
b06_bra_b06_ppu_legacy:
    MOVE.W  #$0442,D0
    BSR     TRACE_MARK
    MOVEA.L #tbl_A000_ppu_data,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t11_ppu_data  ; orig: C - - - - - 0x01A095 06:A085: 85 00     STA ram_0000_t11_ppu
    MOVEA.L #tbl_A000_ppu_data+1,A0  ; bzk fix: was empty translation for LDA $A001,X
    MOVE.B  (A0,D1.L),D0             ; load HIGH byte of pointer from table
    MOVE.B  D0,ram_0000_t11_ppu_data+1  ; bzk fix: STA $01 — store HIGH byte of pointer
    BSR     sub_A0F6_write_to_ppu             ; JSR -> BSR  ; orig: C - - - - - 0x01A09C 06:A08C: 20 F6 A0  JSR sub_A0F
b06_bra_b06_ppu_cleanup:
    MOVE.B  #$3F,D0  ; orig: C - - - - - 0x01A09F 06:A08F: A9 3F     LDA #$3F
    MOVE.B  D0,ram_0300_useless  ; orig: C - - - - - 0x01A0A1 06:A091: 8D 00 03  STA ram_0300_useless
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01A0A4 06:A094: A2 00     LDX #$00
    MOVE.B  D1,ram_ppu_load_index  ; orig: C - - - - - 0x01A0A6 06:A096: 86 14     STX ram_ppu_load_ind
    MOVE.B  D1,ram_005C  ; orig: C - - - - - 0x01A0A8 06:A098: 86 5C     STX ram_005C
    MOVE.B  D1,ram_0301_buffer_index  ; orig: C - - - - - 0x01A0AA 06:A09A: 8E 01 03  STX ram_0301_buffer_
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01A0AD 06:A09D: CA        DEX ; FF
    MOVE.B  D1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x01A0AE 06:A09E: 8E 02 03  STX ram_0302_ppu_buf
    RTS                     ; RTS  ; orig: C - - - - - 0x01A0B1 06:A0A1: 60        RTS



b06_bra_A0A2_loop:  ; orig: b06_bra_A0A2_loop:
    MOVE.B  D0,(TRACE_PPU_EVT_ARG0).l
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01A0B2 06:A0A2: 48        PHA ; push ppu_hi
    BSR     PPU_WRITE_2006
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01A0B6 06:A0A6: C8        INY
    MOVEA.L #ram_0000_t11_ppu_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVE.B  D0,(TRACE_PPU_EVT_ARG1).l
    BSR     PPU_WRITE_2006
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01A0BC 06:A0AC: C8        INY
    MOVEA.L #ram_0000_t11_ppu_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVE.B  D0,D4           ; exact legacy header decode starts from raw control byte
    MOVE.B  D4,(TRACE_PPU_EVT_ARG2).l
    MOVE.W  #$04A0,D0
    BSR     TRACE_PPU_EVENT
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01A0C1 06:A0B1: A5 FF     LDA ram_for_2000
    BTST    #7,D4
    BEQ     b06_bra_A0B8_inc_by_1
    ORI.B   #$04,D0
    BRA     b06_bra_A0B9
b06_bra_A0B8_inc_by_1:
    ANDI.B  #$FB,D0
b06_bra_A0B9:  ; orig: b06_bra_A0B9:
    MOVE.W  D4,-(A7)
    BSR     PPU_WRITE_2000
    MOVE.W  (A7)+,D4
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01A0CC 06:A0BC: 85 FF     STA ram_for_2000
    MOVEQ   #$00,D1
    MOVEQ   #$00,D6
    MOVE.B  D4,D1
    ANDI.B  #$3F,D1         ; literal count comes from low 6 bits, with 0 meaning 64 bytes
    BNE     b06_bra_A0C6
    MOVE.B  #$40,D1
b06_bra_A0C6:  ; orig: b06_bra_A0C6:
    BTST    #6,D4
    BEQ     b06_bra_A0CC
    MOVEQ   #$01,D6         ; non-zero => repeat run
    ADDQ.B  #1,D2           ; exact extra INY on repeat headers
b06_bra_A0CC:
    MOVE.B  D1,(TRACE_PPU_EVT_ARG1).l
    MOVE.B  D6,(TRACE_PPU_EVT_ARG2).l
    MOVE.W  #$04A1,D0
    TST.B   D6
    BEQ     b06_bra_A0CD_literal
    MOVE.W  #$04A2,D0
b06_bra_A0CD_literal:
    BSR     TRACE_PPU_EVENT
b06_bra_A0CE_loop:  ; orig: b06_bra_A0CE_loop:
    TST.B   D6
    BNE     b06_bra_A0D1_write_the_same_byte
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01A0E0 06:A0D0: C8        INY
b06_bra_A0D1_write_the_same_byte:  ; orig: b06_bra_A0D1_write_the_same_byte:
    MOVEA.L #ram_0000_t11_ppu_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVE.W  D1,-(A7)
    BSR     PPU_WRITE_2007
    MOVE.W  (A7)+,D1
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01A0E6 06:A0D6: CA        DEX
    BNE     b06_bra_A0CE_loop             ; BNE  ; orig: C - - - - - 0x01A0E7 06:A0D7: D0 F5     BNE b06_bra_A0CE_loop

; X = 00
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01A0E9 06:A0D9: 68        PLA ; pull ppu_hi
    CMPI.B  #$3F,D0  ; orig: C - - - - - 0x01A0EA 06:A0DA: C9 3F     CMP #$3F
    BNE     b06_bra_A0EA_not_palette             ; BNE  ; orig: C - - - - - 0x01A0EC 06:A0DC: D0 0C     BNE bra_A0EA_no
    MOVE.B  D0,(TRACE_PPU_EVT_ARG0).l
    CLR.W   (TRACE_PPU_EVT_ARG1).l
    CLR.W   (TRACE_PPU_EVT_ARG2).l
    MOVE.W  #$04A3,D4
    MOVE.W  D4,D0
    BSR     TRACE_PPU_EVENT
    MOVE.B  #$3F,D0
    BSR     PPU_WRITE_2006
    MOVEQ   #$00,D0
    BSR     PPU_WRITE_2006
    BSR     PPU_WRITE_2006
    BSR     PPU_WRITE_2006
b06_bra_A0EA_not_palette:  ; orig: b06_bra_A0EA_not_palette:
    ; Fix: advance 16-bit PPU buffer pointer by (Y+1) bytes
    ; NES was: SEC; TYA; ADC ptr_lo; STA ptr_lo; LDA #0; ADC ptr_hi; STA ptr_hi
    MOVE.B  ram_0000_t11_ppu_data,D1            ; start from current low byte
    MOVE.B  D2,D4                               ; D4 = Y (bytes consumed this record)
    ADDQ.B  #1,D4                               ; D4 = Y+1 (NES SEC effect)
    ADD.B   D4,D1                               ; D1 = lo_ptr + Y + 1, carry = high-byte bump
    MOVE.B  D1,ram_0000_t11_ppu_data            ; store new low byte without clobbering carry first
    BCC     b06_bra_b06_ppu_ptr_nocarry             ; no carry into high byte
    ADDQ.B  #1,ram_0000_t11_ppu_data+1         ; carry into high byte
b06_bra_b06_ppu_ptr_nocarry:
    MOVE.B  D2,(TRACE_PPU_EVT_ARG0).l
    MOVE.B  ram_0000_t11_ppu_data,D4
    MOVE.B  D4,(TRACE_PPU_EVT_ARG1).l
    MOVE.B  ram_0000_t11_ppu_data+1,D4
    MOVE.B  D4,(TRACE_PPU_EVT_ARG2).l
    MOVE.W  #$04A4,D0
    BSR     TRACE_PPU_EVENT
    MOVE.B  #$00,D0                             ; LDA #$00 (orig 06:A0F0)
sub_A0F6_write_to_ppu:  ; orig: sub_A0F6_write_to_ppu:
    BSR     PPU_READ_2002  ; read VDP status → D0  ; was: C - - - - - 0x01A106 06:A0F6: AE 02 20  LDX $2002
    MOVE.B  D0,D1
    MOVEQ   #$00,D2  ; orig: C - - - - - 0x01A109 06:A0F9: A0 00     LDY #$00
    MOVEA.L #ram_0000_t11_ppu_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    BPL     b06_bra_A0A2_loop             ; BPL  ; orig: C - - - - - 0x01A10D 06:A0FD: 10 A3     BPL b06_bra_A0A2_loop

; FF
    RTS                     ; RTS  ; orig: C - - - - - 0x01A10F 06:A0FF: 60        RTS



sub_b06_select_ppu_buffer_ptr:
    TST.B   D1
    BEQ     b06_bra_b06_ppu_buf_ram_0302
    CMPI.B  #con_ppu_buf_title_screen,D1
    BEQ     b06_bra_b06_ppu_buf_title
    CMPI.B  #con_ppu_buf_guide,D1
    BEQ     b06_bra_b06_ppu_buf_guide
    CMPI.B  #$04,D1
    BEQ     b06_bra_b06_ppu_buf_continue
    CMPI.B  #con_ppu_buf_14,D1
    BEQ     b06_bra_b06_ppu_buf_14
    CMPI.B  #con_ppu_buf_16,D1
    BEQ     b06_bra_b06_ppu_buf_16
    CMPI.B  #$08,D1
    BEQ     b06_bra_b06_ppu_buf_08
    CMPI.B  #$0A,D1
    BEQ     b06_bra_b06_ppu_buf_0a
    CMPI.B  #$20,D1
    BEQ     b06_bra_b06_ppu_buf_20
    CMPI.B  #$22,D1
    BEQ     b06_bra_b06_ppu_buf_22
    CMPI.B  #$24,D1
    BEQ     b06_bra_b06_ppu_buf_24
    CMPI.B  #$26,D1
    BEQ     b06_bra_b06_ppu_buf_26
    CMPI.B  #$36,D1
    BEQ     b06_bra_b06_ppu_buf_36
    CMPI.B  #$50,D1
    BEQ     b06_bra_b06_ppu_buf_50
    CMPI.B  #$5A,D1
    BEQ     b06_bra_b06_ppu_buf_5a
    CMPI.B  #$1E,D1
    BEQ     b06_bra_b06_ppu_buf_1e
    CMPI.B  #$2A,D1
    BEQ     b06_bra_b06_ppu_buf_2a
    CMPI.B  #$6A,D1
    BEQ     b06_bra_b06_ppu_buf_6a
    CMPI.B  #$6C,D1
    BEQ     b06_bra_b06_ppu_buf_6c
    CMPI.B  #$76,D1
    BEQ     b06_bra_b06_ppu_buf_76
    CMPI.B  #$78,D1
    BEQ     b06_bra_b06_ppu_buf_78
    CMPI.B  #$7A,D1
    BEQ     b06_bra_b06_ppu_buf_7a
    CMPI.B  #$7C,D1
    BEQ     b06_bra_b06_ppu_buf_7c
    CMPI.B  #$12,D1
    BEQ     b06_bra_b06_ppu_buf_bat_12
    CMPI.B  #con_ppu_buf_06,D1
    BEQ     b06_bra_b06_ppu_buf_bat_06
    CMPI.B  #con_ppu_buf_level_text,D1
    BEQ     b06_bra_b06_ppu_buf_bat_0c
    CMPI.B  #$2E,D1
    BEQ     b06_bra_b06_ppu_buf_bat_2e
    CMPI.B  #$1A,D1
    BEQ     b06_bra_b06_ppu_buf_legacy_title_alias
    CMPI.B  #$1C,D1
    BEQ     b06_bra_b06_ppu_buf_legacy_title_alias
    CMPI.B  #$28,D1
    BEQ     b06_bra_b06_ppu_buf_legacy_title_alias
    CMPI.B  #$52,D1
    BEQ     b06_bra_b06_ppu_buf_bat_52
    CMPI.B  #$54,D1
    BEQ     b06_bra_b06_ppu_buf_bat_54
    CMPI.B  #$56,D1
    BEQ     b06_bra_b06_ppu_buf_bat_56
    CMPI.B  #$58,D1
    BEQ     b06_bra_b06_ppu_buf_bat_58
    CMPI.B  #con_ppu_buf_triforce_text,D1
    BEQ     b06_bra_b06_ppu_buf_bat_5c
    CMPI.B  #con_ppu_buf_overworld_palette,D1
    BEQ     b06_bra_b06_ppu_buf_18
    CMPI.B  #con_ppu_buf_hud,D1
    BEQ     b06_bra_b06_ppu_buf_0e
    CMPI.B  #$44,D1
    BEQ     b06_bra_b06_ppu_buf_44
    MOVEQ   #$00,D4
    MOVEA.L D4,A1
    RTS

b06_cfg_real_1e_2a:
    DC.B    $01
b06_cfg_real_6a_6c:
    DC.B    $00
b06_cfg_real_76_78:
    DC.B    $00
b06_cfg_real_26_50_5a:
    DC.B    $00
b06_cfg_real_continue:
    DC.B    $00
b06_cfg_alias_title_legacy:
    DC.B    $00
b06_cfg_ram_0302_direct:
    DC.B    $00
b06_cfg_ram_0302_alias_direct:
    DC.B    $00

sub_b06_optional_legacy_fallback:
    MOVE.W  D1,(TRACE_PPU_EVT_ARG0).l
    MOVE.W  D5,(TRACE_PPU_EVT_ARG1).l
    MOVE.W  D4,(TRACE_PPU_EVT_ARG2).l
    MOVE.W  #$04A8,D0
    BSR     TRACE_PPU_EVENT
    MOVE.W  #$048A,D0
    BSR     TRACE_MARK
    MOVEQ   #$00,D4
    MOVEA.L D4,A1
    RTS
b06_bra_b06_ppu_buf_ram_0302:
    MOVE.B  b06_cfg_ram_0302_direct(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_ram_0302_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_ram_0302_enabled:
    MOVE.W  #$0494,D0
    BSR     TRACE_MARK
    LEA     (ram_0302_ppu_buffer).l,A1
    RTS
b06_bra_b06_ppu_buf_title:
    LEA     ppu_buf_title_screen_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_guide:
    LEA     ppu_buf_guide_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_continue:
    MOVE.B  b06_cfg_real_continue(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_continue_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_continue_enabled:
    MOVE.W  #$0489,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_continue_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_14:
    LEA     ppu_buf_14_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_16:
    LEA     _off000_A183_16(PC),A1
    RTS
b06_bra_b06_ppu_buf_18:
    CMPI.B  #$3F,($FF6B7E).l
    BNE     b06_bra_b06_ppu_buf_18_fallback
    LEA     ($FF6B7E).l,A1
    RTS
b06_bra_b06_ppu_buf_18_fallback:
    LEA     ppu_buf_18_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_0e:
    LEA     ppu_buf_0e_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_44:
    LEA     ppu_buf_44_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_08:
    LEA     ppu_buf_08_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_0a:
    LEA     ppu_buf_0a_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_20:
    LEA     ppu_buf_20_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_22:
    LEA     ppu_buf_22_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_24:
    LEA     ppu_buf_24_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_26:
    MOVE.B  b06_cfg_real_26_50_5a(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_26_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_26_enabled:
    MOVE.W  #$0488,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_26_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_36:
    LEA     ppu_buf_36_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_50:
    MOVE.B  b06_cfg_real_26_50_5a(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_50_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_50_enabled:
    MOVE.W  #$0488,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_50_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_5a:
    MOVE.B  b06_cfg_real_26_50_5a(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_5a_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_5a_enabled:
    MOVE.W  #$0488,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_5a_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_1e:
    MOVE.B  b06_cfg_real_1e_2a(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_1e_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_1e_enabled:
    MOVE.W  #$0485,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_1e_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_2a:
    MOVE.B  b06_cfg_real_1e_2a(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_2a_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_2a_enabled:
    MOVE.W  #$0485,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_2a_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_legacy_title_alias:
    MOVE.B  b06_cfg_ram_0302_alias_direct(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_ram_0302_alias
    MOVE.B  b06_cfg_alias_title_legacy(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_legacy_title_alias_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_legacy_title_alias_enabled:
    MOVE.W  #$0493,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_title_screen_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_ram_0302_alias:
    MOVE.W  #$0495,D0
    BSR     TRACE_MARK
    LEA     (ram_0302_ppu_buffer).l,A1
    RTS
b06_bra_b06_ppu_buf_6a:
    MOVE.B  b06_cfg_real_6a_6c(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_6a_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_6a_enabled:
    MOVE.W  #$0486,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_6a_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_6c:
    MOVE.B  b06_cfg_real_6a_6c(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_6c_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_6c_enabled:
    MOVE.W  #$0486,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_6c_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_76:
    MOVE.B  b06_cfg_real_76_78(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_76_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_76_enabled:
    MOVE.W  #$0487,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_76_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_78:
    MOVE.B  b06_cfg_real_76_78(PC),D4
    TST.B   D4
    BNE     b06_bra_b06_ppu_buf_78_enabled
    JMP     sub_b06_optional_legacy_fallback
b06_bra_b06_ppu_buf_78_enabled:
    MOVE.W  #$0487,D0
    BSR     TRACE_MARK
    LEA     ppu_buf_78_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_7a:
    LEA     ppu_buf_7a_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_7c:
    LEA     ppu_buf_7c_real(PC),A1
    RTS
b06_bra_b06_ppu_buf_bat_12:
    LEA     ppu_buf_bat_12_real(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_06:
    LEA     _off000_bat_6814_06(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_0c:
    LEA     _off000_bat_681C_0C_level_text(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_2e:
    LEA     _off000_bat_681C_2E(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_52:
    LEA     _off000_bat_6847_52(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_54:
    LEA     _off000_bat_684F_54(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_56:
    LEA     _off000_bat_6859_56(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_58:
    LEA     _off000_bat_6865_58(PC),A1
    BRA     b06_bra_b06_ppu_buf_bat_trace
b06_bra_b06_ppu_buf_bat_5c:
    LEA     _off000_bat_6873_5C_triforce_text(PC),A1
b06_bra_b06_ppu_buf_bat_trace:
    MOVE.W  #$0462,D0
    BSR     TRACE_MARK
    RTS



sub_b06_write_ppu_buffer_rom:
    BSR     PPU_READ_2002
b06_bra_b06_rom_buffer_next_record:
    MOVEQ   #$00,D2
    MOVE.B  (A1)+,D2
    CMPI.B  #$FF,D2
    BEQ     b06_bra_b06_rom_buffer_done
    MOVE.B  D2,(TRACE_PPU_ROM_REC_HI).l
    MOVE.B  D2,D0
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    MOVE.B  (A1)+,D0
    MOVE.B  D0,(TRACE_PPU_ROM_REC_LO).l
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    MOVEQ   #$00,D3
    MOVE.B  (A1)+,D3
    MOVE.B  D3,(TRACE_PPU_ROM_REC_CTRL).l
    MOVE.L  A1,(TRACE_PPU_ROM_REC_DATA).l
    MOVE.B  ram_for_2000,D0
    BTST    #7,D3
    BEQ     b06_bra_b06_rom_inc_by_1
    ORI.B   #$04,D0
    BRA     b06_bra_b06_rom_write_ppuctrl
b06_bra_b06_rom_inc_by_1:
    ANDI.B  #$FB,D0
b06_bra_b06_rom_write_ppuctrl:
    MOVE.L  D3,-(A7)
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2000
    MOVEA.L (A7)+,A1
    MOVE.L  (A7)+,D3
    MOVE.B  D0,ram_for_2000
    MOVEQ   #$00,D1
    MOVE.B  D3,D1
    ANDI.W  #$003F,D1
    BNE     b06_bra_b06_rom_count_ready
    MOVE.W  #$0040,D1         ; legacy PPU buffer semantics: zero count means 64 bytes
b06_bra_b06_rom_count_ready:
    BTST    #6,D3
    BNE     b06_bra_b06_rom_repeat_mode
b06_bra_b06_rom_literal_loop:
    MOVE.B  (A1)+,D0
    MOVE.L  A1,-(A7)
    MOVE.W  D1,-(A7)
    BSR     PPU_WRITE_2007
    MOVE.W  (A7)+,D1
    MOVEA.L (A7)+,A1
    SUBQ.W  #1,D1
    BNE     b06_bra_b06_rom_literal_loop
    BRA     b06_bra_b06_rom_palette_fix
b06_bra_b06_rom_repeat_mode:
    MOVE.B  (A1)+,D4
b06_bra_b06_rom_repeat_loop:
    MOVE.B  D4,D0
    MOVE.L  A1,-(A7)
    MOVE.W  D1,-(A7)
    MOVE.W  D4,-(A7)
    BSR     PPU_WRITE_2007
    MOVE.W  (A7)+,D4
    MOVE.W  (A7)+,D1
    MOVEA.L (A7)+,A1
    SUBQ.W  #1,D1
    BNE     b06_bra_b06_rom_repeat_loop
b06_bra_b06_rom_palette_fix:
    CMPI.B  #$3F,D2
    BNE     b06_bra_b06_rom_buffer_next_record
    MOVE.B  #$3F,D0
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    MOVEQ   #$00,D0
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    MOVE.L  A1,-(A7)
    BSR     PPU_WRITE_2006
    MOVEA.L (A7)+,A1
    BRA     b06_bra_b06_rom_buffer_next_record
b06_bra_b06_rom_buffer_done:
    RTS



ppu_buf_14_real:
    DC.B $23,$C0,$7F,$00,$23,$D4,$03,$40,$50,$50,$23,$DC,$03,$44,$55,$55
    DC.B $23,$E4,$03,$44,$55,$55,$20,$A8,$0F,$62,$24,$1C,$24,$0E,$24,$15
    DC.B $24,$0E,$24,$0C,$24,$1D,$24,$62,$21,$03,$01,$69,$21,$04,$58,$6A
    DC.B $21,$1C,$01,$6B,$21,$23,$D0,$6C,$21,$3C,$D0,$6C,$23,$23,$01,$6E
    DC.B $23,$24,$58,$6A,$23,$3C,$01,$6D,$21,$0A,$06,$24,$17,$0A,$16,$0E
    DC.B $24,$21,$13,$06,$24,$15,$12,$0F,$0E,$24,$22,$A6,$12,$1B,$0E,$10
    DC.B $12,$1C,$1D,$0E,$1B,$24,$22,$18,$1E,$1B,$24,$17,$0A,$16,$0E,$22
    DC.B $E6,$10,$0E,$15,$12,$16,$12,$17,$0A,$1D,$12,$18,$17,$24,$16,$18
    DC.B $0D,$0E,$FF



ppu_buf_18_real:
    ; FIX v372: overworld palette - provide default palette in ROM to bypass uninitialized ram_6B7E
    DC.B $3F,$00,$20
    DC.B $0F,$30,$00,$12,$0F,$16,$27,$36,$0F,$0C,$1C,$2C,$0F,$12,$1C,$2C
    DC.B $0F,$29,$27,$07,$0F,$22,$27,$07,$0F,$26,$27,$07,$0F,$15,$27,$30
    DC.B $FF

ppu_buf_0e_real:
    ; FIX v372: HUD buffer - converted from commented _off000_A2D3_0E_hud ROM data
    DC.B $23,$C2,$0E
    DC.B $40,$00,$00,$44,$55,$55,$00,$00,$04,$00,$00,$44,$55,$55
    DC.B $20,$6F,$0E
    DC.B $69,$0B,$6B,$69,$0A,$6B,$24,$24,$62,$15,$12,$0F,$0E,$62
    DC.B $20,$CF,$06
    DC.B $6E,$6A,$6D,$6E,$6A,$6D
    DC.B $20,$8F,$C2,$6C
    DC.B $20,$91,$C2,$6C
    DC.B $20,$92,$C2,$6C
    DC.B $20,$94,$C2,$6C
    DC.B $20,$6B,$84
    DC.B $F7,$24,$F9,$61
    DC.B $FF

ppu_buf_44_real:
    ; FIX v372: minimap buffer ($44) - no-op (minimap at ram_6BCD is dynamic, computed at runtime)
    DC.B $FF



ppu_buf_title_screen_real:
    DC.B $20,$00,$20,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$20,$20,$20,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$20,$40,$20,$E0,$D5,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$D4,$E0,$20,$60,$20,$DC,$D7,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$D6,$DD,$20,$80,$20,$DC
    DC.B $EE,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$D6,$DB,$20
    DC.B $A0,$20,$DE,$D7,$24,$24,$24,$E6,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5
    DC.B $E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E6,$24,$24,$24
    DC.B $D6,$DB,$20,$C0,$20,$DC,$D7,$24,$24,$24,$E2,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E3
    DC.B $24,$24,$24,$D6,$DF,$20,$E0,$20,$DE,$EE,$24,$24,$24,$E3,$24,$24
    DC.B $71,$72,$73,$74,$75,$76,$77,$78,$79,$79,$79,$7A,$7B,$24,$24,$24
    DC.B $24,$24,$E2,$24,$24,$24,$D6,$DB,$21,$00,$20,$DE,$D8,$EF,$24,$24
    DC.B $E2,$24,$7C,$7D,$7E,$7F,$80,$81,$82,$83,$84,$85,$86,$87,$88,$89
    DC.B $8A,$8B,$24,$24,$24,$E3,$24,$24,$24,$D6,$DF,$21,$20,$20,$DC,$DA
    DC.B $D7,$24,$24,$E3,$24,$8C,$8D,$8E,$8F,$90,$91,$92,$93,$94,$95,$96
    DC.B $97,$98,$99,$9A,$9B,$9C,$24,$24,$E2,$24,$24,$D4,$D9,$DB,$21,$40
    DC.B $20,$DC,$D9,$EE,$24,$24,$E2,$24,$9D,$9E,$9F,$A0,$A1,$A2,$A3,$A4
    DC.B $A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$24,$E3,$24,$24,$D6,$DB
    DC.B $DF,$21,$60,$20,$DE,$DB,$D7,$24,$24,$E3,$70,$AF,$B0,$B1,$B2,$B3
    DC.B $B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$24,$E2,$24
    DC.B $24,$D6,$DB,$DB,$21,$80,$20,$DC,$DD,$D7,$24,$24,$E2,$24,$24,$24
    DC.B $24,$24,$24,$24,$C1,$C2,$C3,$C4,$C5,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$E3,$24,$24,$D6,$DB,$DF,$21,$A0,$20,$DE,$DB,$EE,$24,$24,$E3
    DC.B $24,$C6,$C7,$C8,$C8,$C8,$24,$C9,$CA,$CB,$CC,$CD,$C8,$C8,$C8,$C8
    DC.B $E8,$E9,$D3,$24,$E2,$24,$24,$D6,$DB,$DB,$21,$C0,$20,$DC,$DB,$D7
    DC.B $24,$24,$E2,$24,$24,$24,$24,$24,$24,$24,$24,$24,$CE,$CF,$24,$24
    DC.B $24,$24,$24,$EA,$EB,$EC,$24,$E3,$24,$24,$D6,$DB,$DF,$21,$E0,$20
    DC.B $DC,$DB,$D7,$24,$24,$E3,$24,$24,$24,$24,$24,$24,$24,$24,$24,$D1
    DC.B $D2,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E2,$24,$24,$D6,$DB,$DB
    DC.B $22,$00,$20,$DC,$D8,$E1,$D5,$24,$E6,$E4,$E5,$E4,$E5,$E4,$E5,$E4
    DC.B $E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E6,$24,$D4
    DC.B $E1,$D9,$DD,$22,$20,$20,$DC,$DA,$DC,$D7,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$F0,$01,$09,$08,$06,$24,$17,$12,$17,$1D,$0E,$17,$0D
    DC.B $18,$24,$D6,$DC,$DB,$DF,$22,$40,$20,$DC,$DA,$DC,$EE,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$D6,$DE,$ED,$DD,$22,$60,$20,$DC,$DA,$DE,$D7
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$D6,$DE,$DB,$DD,$22,$80,$20,$E1
    DC.B $D9,$DC,$ED,$E0,$EF,$24,$24,$19,$1E,$1C,$11,$24,$1C,$1D,$0A,$1B
    DC.B $1D,$24,$0B,$1E,$1D,$1D,$18,$17,$24,$24,$24,$D6,$D8,$E1,$D9,$22
    DC.B $A0,$20,$DD,$ED,$DE,$D8,$E1,$E1,$D5,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$D6,$DA
    DC.B $DD,$ED,$22,$C0,$20,$DD,$DB,$DE,$DA,$DC,$DD,$D8,$E0,$E0,$EF,$24
    DC.B $24,$24,$24,$D4,$E0,$E0,$D5,$24,$24,$24,$24,$24,$24,$24,$24,$D4
    DC.B $EF,$DA,$DA,$DF,$DB,$22,$E0,$20,$DF,$DB,$DC,$DA,$DE,$DF,$DA,$DC
    DC.B $DD,$DB,$26,$26,$26,$26,$DA,$DC,$DD,$ED,$E0,$E0,$EF,$24,$D4,$E0
    DC.B $E0,$E0,$D9,$DB,$DA,$DA,$DF,$DB,$23,$00,$20,$ED,$D8,$E1,$D9,$DE
    DC.B $D8,$E1,$D9,$DF,$DB,$26,$26,$26,$26,$DA,$DC,$D8,$E1,$D9,$DC,$D8
    DC.B $E0,$D9,$DC,$DD,$DD,$D8,$E1,$E1,$D9,$DD,$ED,$23,$20,$20,$ED,$DA
    DC.B $DD,$ED,$DE,$DA,$DC,$DB,$DD,$DB,$26,$26,$26,$26,$DA,$DE,$DA,$DC
    DC.B $DB,$DE,$DA,$DD,$ED,$DC,$DC,$DD,$DA,$DC,$DC,$DB,$DD,$ED,$23,$40
    DC.B $20,$ED,$DA,$DD,$D8,$E1,$DA,$DC,$DB,$DF,$DB,$26,$26,$26,$26,$DA
    DC.B $D8,$D9,$DC,$DB,$DC,$DA,$D8,$E1,$D9,$DE,$DF,$DA,$D8,$E1,$E1,$D9
    DC.B $E1,$23,$60,$20,$ED,$D9,$DF,$DA,$DC,$DA,$DE,$DB,$DD,$DB,$26,$26
    DC.B $26,$26,$DA,$DA,$ED,$DE,$D8,$E1,$E1,$D9,$DC,$DB,$DE,$D8,$E1,$D9
    DC.B $DD,$DD,$DB,$DC,$23,$80,$20,$DF,$DB,$DF,$DA,$DC,$DB,$DE,$DB,$DD
    DC.B $DB,$26,$26,$26,$26,$DA,$DA,$DB,$DD,$DA,$DE,$D8,$E1,$D9,$DB,$DE
    DC.B $DA,$DD,$DB,$DE,$DF,$D8,$E1,$23,$A0,$20,$DF,$DB,$DF,$DA,$DC,$DB
    DC.B $DE,$DB,$DD,$DB,$26,$26,$26,$26,$DA,$DA,$DB,$DD,$DA,$DE,$DA,$DD
    DC.B $DB,$DB,$DE,$DA,$DD,$DB,$DE,$DF,$DC,$DF,$23,$C0,$20,$05,$05,$05
    DC.B $05,$05,$05,$05,$05,$08,$6A,$5A,$5A,$5A,$5A,$9A,$22,$00,$66,$55
    DC.B $55,$55,$55,$99,$00,$00,$6E,$5F,$55,$5D,$DF,$BB,$00,$23,$E0,$20
    DC.B $00,$0A,$0A,$0A,$0A,$0A,$0A,$00,$00,$00,$C0,$30,$00,$00,$00,$00
    DC.B $00,$00,$CC,$33,$00,$00,$00,$00,$00,$20,$FC,$F3,$00,$00,$F0,$F0
    DC.B $FF



ppu_buf_continue_real:
    DC.B $23,$C0,$7F,$00,$21,$4A,$08,$0C,$18,$17,$1D,$12,$17,$1E,$0E,$21
    DC.B $AA,$04,$1C,$0A,$1F,$0E,$22,$0A,$05,$1B,$0E,$1D,$1B,$22,$FF,$23
    DC.B $C2,$0E,$40,$00,$00,$44,$55,$55,$00,$00,$04,$00,$00,$44,$55,$55
    DC.B $20,$6F,$0E,$69,$0B,$6B,$69,$0A,$6B,$24,$24,$62,$15,$12,$0F,$0E
    DC.B $62,$20,$CF,$06,$6E,$6A,$6D,$6E,$6A,$6D,$20,$8F,$C2,$6C,$20,$91
    DC.B $C2,$6C,$20,$92,$C2,$6C,$20,$94,$C2,$6C,$20,$6B,$84,$F7,$24,$F9
    DC.B $61,$FF,$29,$84,$09,$12,$17,$1F,$0E,$17,$1D,$18,$1B,$22,$FF,$29
    DC.B $C7,$04,$69,$6A,$6A,$6B,$29,$CF,$01,$69,$29,$D0,$4B,$6A,$29,$DB
    DC.B $01,$6B,$FF,$29,$E7,$C2,$6C,$29,$EA,$C2,$6C,$29,$EF,$C4,$6C,$29
    DC.B $FB,$C4,$6C,$FF,$2A,$27,$04,$6E,$6A,$6A,$6D,$FF,$2A,$42,$0C,$1E
    DC.B $1C,$0E,$24,$0B,$24,$0B,$1E,$1D,$1D,$18,$17,$FF,$2A,$64,$08,$0F
    DC.B $18,$1B,$24,$1D,$11,$12,$1C,$2A,$6F,$01,$6E,$2A,$70,$4B,$6A,$2A
    DC.B $7B,$01,$6D,$FF,$2B,$43,$07,$0C,$18,$16,$19,$0A,$1C,$1C,$2A,$A5
    DC.B $03,$16,$0A,$19,$2A,$8C,$10,$F5,$F5,$FD,$F5,$F5,$FD,$F5,$F5,$FD
    DC.B $F5,$F5,$F5,$FD,$F5,$F5,$F5,$FF,$2B,$AC,$10,$F5,$FE,$F5,$F5,$F5
    DC.B $FE,$F5,$F5,$F5,$F5,$FE,$F5,$F5,$F5,$FE,$F5,$FF,$2B,$D9,$43,$05
    DC.B $2B,$DC,$4B,$00,$FF,$2B,$E9,$56,$55,$FF,$2B,$A0,$60,$24,$FF,$28
    DC.B $E0,$60,$24,$FF,$3F,$10,$04,$0F,$10,$30,$00,$FF,$23,$E3,$03,$0F
    DC.B $0F,$CF,$22,$4C,$0A,$10,$0A,$16,$0E,$24,$18,$1F,$0E,$1B,$24,$22
    DC.B $6C,$4A,$24,$FF,$3F,$08,$08,$0F,$17,$16,$26,$0F,$17,$16,$26,$FF
    DC.B $23,$D0,$58,$FF,$FF,$23,$E8,$58,$FF,$FF



ppu_buf_08_real:
    DC.B $3F,$1C,$04,$0F,$0A,$29,$30,$FF



ppu_buf_0a_real:
    DC.B $3F,$1C,$04,$0F,$17,$27,$30,$FF



ppu_buf_20_real:
    DC.B $3F,$1C,$04,$0F,$30,$00,$12,$FF



ppu_buf_22_real:
    DC.B $3F,$1C,$04,$0F,$1A,$37,$12,$FF



ppu_buf_24_real:
    DC.B $3F,$1C,$04,$0F,$17,$37,$12,$FF



ppu_buf_26_real:
    DC.B $23,$D0,$60,$AA,$23,$F0,$50,$AA,$FF



ppu_buf_36_real:
    DC.B $3F,$1C,$04,$0F,$16,$2C,$3C,$FF



ppu_buf_50_real:
    DC.B $2A,$CF,$02,$ED,$EE,$FF



ppu_buf_5a_real:
    DC.B $2B,$6A,$0C,$EB,$EF,$F1,$F1,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$EC,$FF



ppu_buf_1e_real:
    DC.B $21,$A4,$58,$24,$21,$C4,$58,$24,$FF



ppu_buf_2a_real:
    DC.B $21,$E4,$58,$24,$22,$C8,$4D,$24,$FF



ppu_buf_6a_real:
    DC.B $3F,$08,$08,$0F,$22,$10,$00,$0F,$2A,$10,$00,$3F,$1C,$04,$0F,$27
    DC.B $06,$16,$FF



ppu_buf_6c_real:
    DC.B $22,$CD,$04,$62,$01,$00,$00,$FF



ppu_buf_76_real:
    DC.B $22,$CB,$0A,$62,$01,$24,$24,$24,$24,$24,$62,$05,$00,$FF



ppu_buf_78_real:
    DC.B $3F,$08,$08,$0F,$30,$30,$30,$0F,$30,$30,$30,$FF



ppu_buf_7a_real:
    DC.B $3F,$1C,$04,$0F,$0F,$1C,$16,$FF



ppu_buf_7c_real:
    DC.B $3F,$1C,$04,$0F,$2A,$1A,$0C,$FF



ppu_buf_guide_real:
    DC.B $20,$00,$20,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$20,$20,$20,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$20,$40,$20,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$20,$60,$20,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$20,$80,$20,$24
    DC.B $24,$E6,$E4,$E5,$24,$1D,$11,$0E,$24,$15,$0E,$10,$0E,$17,$0D,$24
    DC.B $18,$0F,$24,$23,$0E,$15,$0D,$0A,$24,$E5,$E4,$E5,$E6,$24,$24,$20
    DC.B $A0,$20,$24,$24,$E2,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E3
    DC.B $24,$24,$20,$C0,$20,$24,$24,$E3,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$E2,$24,$24,$20,$E0,$20,$24,$24,$E2,$24,$16,$0A,$17,$22
    DC.B $24,$24,$22,$0E,$0A,$1B,$1C,$24,$24,$0A,$10,$18,$24,$24,$19,$1B
    DC.B $12,$17,$0C,$0E,$24,$E3,$24,$24,$21,$00,$20,$24,$24,$E3,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$F8,$24,$24,$24,$24,$24,$24,$24
    DC.B $F8,$24,$24,$24,$24,$24,$24,$24,$E2,$24,$24,$21,$20,$20,$24,$24
    DC.B $E2,$24,$0D,$0A,$1B,$14,$17,$0E,$1C,$1C,$24,$24,$24,$10,$0A,$17
    DC.B $17,$18,$17,$24,$24,$1C,$1D,$18,$15,$0E,$24,$E3,$24,$24,$21,$40
    DC.B $20,$24,$24,$E3,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E2,$24
    DC.B $24,$21,$60,$20,$24,$24,$E2,$24,$18,$17,$0E,$24,$18,$0F,$24,$1D
    DC.B $11,$0E,$24,$1D,$1B,$12,$0F,$18,$1B,$0C,$0E,$24,$20,$12,$1D,$11
    DC.B $24,$E3,$24,$24,$21,$80,$20,$24,$24,$E3,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$E2,$24,$24,$21,$A0,$20,$24,$24,$E2,$24,$19,$18
    DC.B $20,$0E,$1B,$63,$24,$24,$24,$24,$19,$1B,$12,$17,$0C,$0E,$1C,$1C
    DC.B $24,$23,$0E,$15,$0D,$0A,$24,$E3,$24,$24,$21,$C0,$20,$24,$24,$E3
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E2,$24,$24,$21,$E0,$20
    DC.B $24,$24,$E2,$24,$11,$0A,$0D,$24,$24,$18,$17,$0E,$24,$18,$0F,$24
    DC.B $1D,$11,$0E,$24,$1D,$1B,$12,$0F,$18,$1B,$0C,$0E,$24,$E3,$24,$24
    DC.B $22,$00,$20,$24,$24,$E3,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $E2,$24,$24,$22,$20,$20,$24,$24,$E2,$24,$20,$12,$1D,$11,$24,$20
    DC.B $12,$1C,$0D,$18,$16,$63,$24,$1C,$11,$0E,$24,$0D,$12,$1F,$12,$0D
    DC.B $0E,$0D,$24,$E2,$24,$24,$22,$40,$20,$24,$24,$E3,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$F8,$24,$24,$F8,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$E3,$24,$24,$22,$60,$20,$24,$24,$E2,$24
    DC.B $12,$1D,$24,$12,$17,$1D,$18,$24,$24,$08,$24,$1E,$17,$12,$1D,$1C
    DC.B $24,$1D,$18,$24,$11,$12,$0D,$0E,$24,$E3,$24,$24,$22,$80,$20,$24
    DC.B $24,$E3,$24,$24,$24,$24,$24,$24,$24,$24,$24,$F8,$24,$24,$24,$24
    DC.B $24,$24,$24,$F8,$24,$24,$24,$24,$24,$24,$24,$24,$E2,$24,$24,$22
    DC.B $A0,$20,$24,$24,$E2,$24,$12,$1D,$24,$0F,$1B,$18,$16,$24,$24,$24
    DC.B $10,$0A,$17,$17,$18,$17,$24,$24,$0B,$0E,$0F,$18,$1B,$0E,$24,$E3
    DC.B $24,$24,$22,$C0,$20,$24,$24,$E3,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$E2,$24,$24,$22,$E0,$20,$24,$24,$E2,$24,$1C,$11,$0E,$24
    DC.B $20,$0A,$1C,$24,$0C,$0A,$19,$1D,$1E,$1B,$0E,$0D,$63,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$E3,$24,$24,$23,$00,$20,$24,$24,$E3,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$F8,$24,$24,$F8
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$E2,$24,$24,$23,$20,$20,$24,$24
    DC.B $E2,$24,$24,$24,$10,$18,$24,$0F,$12,$17,$0D,$24,$1D,$11,$0E,$24
    DC.B $24,$08,$24,$1E,$17,$12,$1D,$1C,$24,$24,$24,$E3,$24,$24,$23,$40
    DC.B $20,$24,$24,$E3,$24,$24,$24,$F8,$24,$24,$24,$24,$24,$F8,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$E2,$24
    DC.B $24,$23,$60,$20,$24,$24,$E2,$24,$24,$24,$24,$24,$15,$12,$17,$14
    DC.B $24,$24,$1D,$18,$24,$1C,$0A,$1F,$0E,$24,$11,$0E,$1B,$63,$24,$24
    DC.B $24,$E3,$24,$24,$23,$80,$20,$24,$24,$E3,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24,$24
    DC.B $24,$24,$24,$24,$E2,$24,$24,$23,$A0,$20,$24,$24,$E6,$E4,$E5,$E4
    DC.B $E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4,$E5,$E4
    DC.B $E5,$E4,$E5,$E4,$E5,$E4,$E5,$E6,$24,$24,$23,$C0,$20,$FF,$FF,$00
    DC.B $00,$00,$00,$FF,$FF,$FF,$0B,$0A,$0A,$0A,$0A,$0E,$FF,$FF,$00,$00
    DC.B $4A,$5A,$52,$00,$FF,$FF,$00,$00,$00,$00,$58,$5A,$FF,$23,$E0,$20
    DC.B $FF,$00,$00,$10,$00,$00,$00,$FF,$FF,$00,$00,$0A,$0A,$02,$00,$FF
    DC.B $FF,$FA,$FA,$BA,$AA,$AA,$AA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
    DC.B $2B,$D0,$02,$FF,$FF,$2B,$D6,$02,$FF,$FF,$FF



_off000_A100_14:  ; orig: _off000_A100_14:

; con_ppu_buf_14
    DC.B    $23,$C0,$7F,$00
    DC.B    $23,$D4,$03,$40,$50,$50
    DC.B    $23,$DC,$03,$44,$55,$55
    DC.B    $23,$E4,$03,$44,$55,$55
    DC.B    $20,$A8,$0F,$62,$24,$1C,$24,$0E,$24,$15,$24,$0E,$24,$0C,$24,$1D,$24,$62
    DC.B    $21,$03,$01,$69
    DC.B    $21,$04,$58,$6A
    DC.B    $21,$1C,$01,$6B
    DC.B    $21,$23,$D0,$6C
    DC.B    $21,$3C,$D0,$6C
    DC.B    $23,$23,$01,$6E
    DC.B    $23,$24,$58,$6A
    DC.B    $23,$3C,$01,$6D
    DC.B    $21,$0A,$06,$24,$17,$0A,$16,$0E,$24
    DC.B    $21,$13,$06,$24,$15,$12,$0F,$0E,$24
    DC.B    $22,$A6,$12,$1B,$0E,$10,$12,$1C,$1D,$0E,$1B,$24,$22,$18,$1E,$1B,$24,$17,$0A,$16,$0E
    DC.B    $22,$E6,$10,$0E,$15,$12,$16,$12,$17,$0A,$1D,$12,$18,$17,$24,$16,$18,$0D,$0E
    DC.B    $FF



_off000_A183_16:  ; orig: _off000_A183_16:

; con_ppu_buf_16
    DC.B    $22,$05,$01,$69
    DC.B    $22,$06,$55,$6A
    DC.B    $22,$1B,$01,$6B
    DC.B    $22,$25,$C7,$6C
    DC.B    $22,$3B,$C7,$6C
    DC.B    $23,$05,$01,$6E
    DC.B    $23,$06,$55,$6A
    DC.B    $23,$1B,$01,$6D
    DC.B    $22,$26,$15,$0A,$24,$0B,$24,$0C,$24,$0D,$24,$0E,$24,$0F,$24,$10,$24,$11,$24,$12,$24,$13,$24,$14
    DC.B    $22,$66,$15,$15,$24,$16,$24,$17,$24,$18,$24,$19,$24,$1A,$24,$1B,$24,$1C,$24,$1D,$24,$1E,$24,$1F
    DC.B    $22,$A6,$15,$20,$24,$21,$24,$22,$24,$23,$24,$62,$24,$63,$24,$28,$24,$29,$24,$2A,$24,$2B,$24,$2C
    DC.B    $22,$E6,$13,$00,$24,$01,$24,$02,$24,$03,$24,$04,$24,$05,$24,$06,$24,$07,$24,$08,$24,$09
    DC.B    $FF



_off000_A202_36:  ; orig: _off000_A202_36:

; con_ppu_buf_36
    DC.B    $3F,$1C,$04,$0F,$16,$2C,$3C
    DC.B    $FF



_off000_A20A_6A:  ; orig: _off000_A20A_6A:

; con_ppu_buf_6A
    DC.B    $3F,$08,$08,$0F,$22,$10,$00,$0F,$2A,$10,$00
    DC.B    $3F,$1C,$04,$0F,$27,$06,$16
    DC.B    $FF



_off000_A21D_1E:  ; orig: _off000_A21D_1E:

; con_ppu_buf_1E
    DC.W $21A4
    DC.B $58
    DC.B $24

    DC.W $21C4
    DC.B $58
    DC.B $24

    DC.B $FF



_off000_A226_2A:  ; orig: _off000_A226_2A:

; con_ppu_buf_2A
    DC.W $21E4
    DC.B $58
    DC.B $24

    DC.W $22C8
    DC.B $4D
    DC.B $24

    DC.B $FF



_off000_A22F_50:  ; orig: _off000_A22F_50:

; con_ppu_buf_50
    DC.W $2ACF
    DC.B $02
    DC.B $ED, $EE

    DC.B $FF



_off000_A235_5A:  ; orig: _off000_A235_5A:

; con_ppu_buf_5A
    DC.W $2B6A
    DC.B $0C
    DC.B $EB, $EF, $F1, $F1, $F1, $F1, $F1, $F1, $F1, $F1, $F0, $EC

    DC.B $FF



_off000_A245_20:  ; orig: _off000_A245_20:

; con_ppu_buf_20
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $30, $00, $12

    DC.B $FF



_off000_A24D_22:  ; orig: _off000_A24D_22:

; con_ppu_buf_22
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $1A, $37, $12

    DC.B $FF



_off000_A255_24:  ; orig: _off000_A255_24:

; con_ppu_buf_24
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $17, $37, $12

    DC.B $FF



_off000_A25D_3E_cave_palette:  ; orig: _off000_A25D_3E_cave_palette:

; con_ppu_buf_cave_palette
    DC.W $3F08
    DC.B $08
    DC.B $0F, $30, $00, $12
    DC.B $0F, $07, $0F, $17

    DC.B $FF



_off000_A269_26:  ; orig: _off000_A269_26:

; con_ppu_buf_26
    DC.W $23D0
    DC.B $60
    DC.B $AA

    DC.W $23F0
    DC.B $50
    DC.B $AA

    DC.B $FF



_off000_A272_78:  ; orig: _off000_A272_78:

; con_ppu_buf_78
    DC.W $3F08
    DC.B $08
    DC.B $0F, $30, $30, $30
    DC.B $0F, $30, $30, $30

    DC.B $FF



_off000_A27E_7A:  ; orig: _off000_A27E_7A:

; con_ppu_buf_7A
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $0F, $1C, $16

    DC.B $FF



_off000_A286_7C:  ; orig: _off000_A286_7C:

; con_ppu_buf_7C
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $2A, $1A, $0C

    DC.B $FF



_off000_A28E_08:  ; orig: _off000_A28E_08:

; con_ppu_buf_08
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $0A, $29, $30

    DC.B $FF



_off000_A296_0A:  ; orig: _off000_A296_0A:

; con_ppu_buf_0A
    DC.W $3F1C
    DC.B $04
    DC.B $0F, $17, $27, $30

    DC.B $FF



_off000_A29E_6C:  ; orig: _off000_A29E_6C:

; con_ppu_buf_6C
    DC.W $22CD
    DC.B $04
    DC.B $62, $01, $00, $00

    DC.B $FF



_off000_A2A6_76:  ; orig: _off000_A2A6_76:

; con_ppu_buf_76
    DC.W $22CB
    DC.B $0A
    DC.B $62, $01, $24, $24, $24, $24, $24, $62, $05, $00

    DC.B $FF



_off000_A2B4_04_continue:  ; orig: _off000_A2B4_04_continue:

; con_ppu_buf_continue
    DC.W $23C0
    DC.B $7F
    DC.B $00

    DC.W $214A
    DC.B $08
    DC.B $0C, $18, $17, $1D, $12, $17, $1E, $0E

    DC.W $21AA
    DC.B $04
    DC.B $1C, $0A, $1F, $0E

    DC.W $220A
    DC.B $05
    DC.B $1B, $0E, $1D, $1B, $22

    DC.B $FF



_off000_A2D3_0E_hud:  ; orig: _off000_A2D3_0E_hud:

; con_ppu_buf_hud
    DC.W $23C2
    DC.B $0E
    DC.B $40, $00, $00, $44, $55, $55, $00, $00, $04, $00, $00, $44, $55, $55

    DC.W $206F
    DC.B $0E
    DC.B $69, $0B, $6B, $69, $0A, $6B, $24, $24, $62, $15, $12, $0F, $0E, $62

    DC.W $20CF
    DC.B $06
    DC.B $6E, $6A, $6D, $6E, $6A, $6D

    DC.W $208F
    DC.B $C2
    DC.B $6C

    DC.W $2091
    DC.B $C2
    DC.B $6C

    DC.W $2092
    DC.B $C2
    DC.B $6C

    DC.W $2094
    DC.B $C2
    DC.B $6C

    DC.W $206B
    DC.B $84
    DC.B $F7, $24, $F9, $61

    DC.B $FF



_off000_A316_30:  ; orig: _off000_A316_30:

; con_ppu_buf_30
    DC.W $2984
    DC.B $09
    DC.B $12, $17, $1F, $0E, $17, $1D, $18, $1B, $22

    DC.B $FF



_off000_A323_32:  ; orig: _off000_A323_32:

; con_ppu_buf_32
    DC.W $29C7
    DC.B $04
    DC.B $69, $6A, $6A, $6B

    DC.W $29CF
    DC.B $01
    DC.B $69

    DC.W $29D0
    DC.B $4B
    DC.B $6A

    DC.W $29DB
    DC.B $01
    DC.B $6B

    DC.B $FF



_off000_A337_34:  ; orig: _off000_A337_34:

; con_ppu_buf_34
    DC.W $29E7
    DC.B $C2
    DC.B $6C

    DC.W $29EA
    DC.B $C2
    DC.B $6C

    DC.W $29EF
    DC.B $C4
    DC.B $6C

    DC.W $29FB
    DC.B $C4
    DC.B $6C

    DC.B $FF



_off000_A348_38:  ; orig: _off000_A348_38:

; con_ppu_buf_38
    DC.W $2A27
    DC.B $04
    DC.B $6E, $6A, $6A, $6D

    DC.B $FF



_off000_A350_3A:  ; orig: _off000_A350_3A:

; con_ppu_buf_3A
    DC.W $2A42
    DC.B $0C
    DC.B $1E, $1C, $0E, $24, $0B, $24, $0B, $1E, $1D, $1D, $18, $17

    DC.B $FF



_off000_A360_3C:  ; orig: _off000_A360_3C:

; con_ppu_buf_3C
    DC.W $2A64
    DC.B $08
    DC.B $0F, $18, $1B, $24, $1D, $11, $12, $1C

    DC.W $2A6F
    DC.B $01
    DC.B $6E

    DC.W $2A70
    DC.B $4B
    DC.B $6A

    DC.W $2A7B
    DC.B $01
    DC.B $6D

    DC.B $FF



_off000_A378_40:  ; orig: _off000_A378_40:

; con_ppu_buf_40
    DC.W $2B43
    DC.B $07
    DC.B $0C, $18, $16, $19, $0A, $1C, $1C

    DC.W $2AA5
    DC.B $03
    DC.B $16, $0A, $19

    DC.W $2A8C
    DC.B $10
    DC.B $F5, $F5, $FD, $F5, $F5, $FD, $F5, $F5, $FD, $F5, $F5, $F5, $FD, $F5, $F5, $F5

    DC.B $FF



_off000_A39C_42:  ; orig: _off000_A39C_42:

; con_ppu_buf_42
    DC.W $2BAC
    DC.B $10
    DC.B $F5, $FE, $F5, $F5, $F5, $FE, $F5, $F5, $F5, $F5, $FE, $F5, $F5, $F5, $FE, $F5

    DC.B $FF



_off000_A3B0_48:  ; orig: _off000_A3B0_48:

; con_ppu_buf_48
    DC.W $2BD9
    DC.B $43
    DC.B $05

    DC.W $2BDC
    DC.B $4B
    DC.B $00

    DC.B $FF



_off000_A3B9_4A:  ; orig: _off000_A3B9_4A:

; con_ppu_buf_4A
    DC.W $2BE9
    DC.B $56
    DC.B $55

    DC.B $FF



_off000_A3BE_4C:  ; orig: _off000_A3BE_4C:

; con_ppu_buf_4C
    DC.W $2BA0
    DC.B $60
    DC.B $24

    DC.B $FF



_off000_A3C3_4E:  ; orig: _off000_A3C3_4E:

; con_ppu_buf_4E
    DC.W $28E0
    DC.B $60
    DC.B $24

    DC.B $FF



_off000_A3C8_2C:  ; orig: _off000_A3C8_2C:

; con_ppu_buf_2C
    DC.W $3F10
    DC.B $04
    DC.B $0F, $10, $30, $00

    DC.B $FF



_off000_A3D0_46_game_over:  ; orig: _off000_A3D0_46_game_over:

; con_ppu_buf_46_game_over
    DC.W $23E3
    DC.B $03
    DC.B $0F, $0F, $CF

    DC.W $224C
    DC.B $0A
    DC.B $10, $0A, $16, $0E, $24, $18, $1F, $0E, $1B, $24

    DC.W $226C
    DC.B $4A
    DC.B $24

    DC.B $FF



_off000_A3E8_5E:  ; orig: _off000_A3E8_5E:

; con_ppu_buf_5E
    DC.W $3F08
    DC.B $08

    DC.B $0F, $17, $16, $26
    DC.B $0F, $17, $16, $26

    DC.B $FF



_off000_A3F4_60:  ; orig: _off000_A3F4_60:

; con_ppu_buf_60
    DC.W $23D0
    DC.B $58
    DC.B $FF

    DC.B $FF



_off000_A3F9_62:  ; orig: _off000_A3F9_62:

; con_ppu_buf_62
    DC.W $23E8
    DC.B $58
    DC.B $FF

    DC.B $FF



_off000_A3FE_02_guide:  ; orig: _off000_A3FE_02_guide:

; con_ppu_buf_guide
    DC.W $2000
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2020
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2040
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2060
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2080
    DC.B $20
    DC.B $24, $24, $E6, $E4, $E5, $24, $1D, $11, $0E, $24, $15, $0E, $10, $0E, $17, $0D
    DC.B $24, $18, $0F, $24, $23, $0E, $15, $0D, $0A, $24, $E5, $E4, $E5, $E6, $24, $24

    DC.W $20A0
    DC.B $20
    DC.B $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24

    DC.W $20C0
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $20E0
    DC.B $20
    DC.B $24, $24, $E2, $24, $16, $0A, $17, $22, $24, $24, $22, $0E, $0A, $1B, $1C, $24
    DC.B $24, $0A, $10, $18, $24, $24, $19, $1B, $12, $17, $0C, $0E, $24, $E3, $24, $24

    DC.W $2100
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24
    DC.B $24, $24, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $2120
    DC.B $20
    DC.B $24, $24, $E2, $24, $0D, $0A, $1B, $14, $17, $0E, $1C, $1C, $24, $24, $24, $10
    DC.B $0A, $17, $17, $18, $17, $24, $24, $1C, $1D, $18, $15, $0E, $24, $E3, $24, $24

    DC.W $2140
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $2160
    DC.B $20
    DC.B $24, $24, $E2, $24, $18, $17, $0E, $24, $18, $0F, $24, $1D, $11, $0E, $24, $1D
    DC.B $1B, $12, $0F, $18, $1B, $0C, $0E, $24, $20, $12, $1D, $11, $24, $E3, $24, $24

    DC.W $2180
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $21A0
    DC.B $20
    DC.B $24, $24, $E2, $24, $19, $18, $20, $0E, $1B, $63, $24, $24, $24, $24, $19, $1B
    DC.B $12, $17, $0C, $0E, $1C, $1C, $24, $23, $0E, $15, $0D, $0A, $24, $E3, $24, $24

    DC.W $21C0
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $21E0
    DC.B $20
    DC.B $24, $24, $E2, $24, $11, $0A, $0D, $24, $24, $18, $17, $0E, $24, $18, $0F, $24
    DC.B $1D, $11, $0E, $24, $1D, $1B, $12, $0F, $18, $1B, $0C, $0E, $24, $E3, $24, $24

    DC.W $2200
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $2220
    DC.B $20
    DC.B $24, $24, $E2, $24, $20, $12, $1D, $11, $24, $20, $12, $1C, $0D, $18, $16, $63
    DC.B $24, $1C, $11, $0E, $24, $0D, $12, $1F, $12, $0D, $0E, $0D, $24, $E2, $24, $24

    DC.W $2240
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24, $F8, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24

    DC.W $2260
    DC.B $20
    DC.B $24, $24, $E2, $24, $12, $1D, $24, $12, $17, $1D, $18, $24, $24, $08, $24, $1E
    DC.B $17, $12, $1D, $1C, $24, $1D, $18, $24, $11, $12, $0D, $0E, $24, $E3, $24, $24

    DC.W $2280
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24, $24
    DC.B $24, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $22A0
    DC.B $20
    DC.B $24, $24, $E2, $24, $12, $1D, $24, $0F, $1B, $18, $16, $24, $24, $24, $10, $0A
    DC.B $17, $17, $18, $17, $24, $24, $0B, $0E, $0F, $18, $1B, $0E, $24, $E3, $24, $24

    DC.W $22C0
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $22E0
    DC.B $20
    DC.B $24, $24, $E2, $24, $1C, $11, $0E, $24, $20, $0A, $1C, $24, $0C, $0A, $19, $1D
    DC.B $1E, $1B, $0E, $0D, $63, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24

    DC.W $2300
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $F8, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $2320
    DC.B $20
    DC.B $24, $24, $E2, $24, $24, $24, $10, $18, $24, $0F, $12, $17, $0D, $24, $1D, $11
    DC.B $0E, $24, $24, $08, $24, $1E, $17, $12, $1D, $1C, $24, $24, $24, $E3, $24, $24

    DC.W $2340
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $F8, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $2360
    DC.B $20
    DC.B $24, $24, $E2, $24, $24, $24, $24, $24, $15, $12, $17, $14, $24, $24, $1D, $18
    DC.B $24, $1C, $0A, $1F, $0E, $24, $11, $0E, $1B, $63, $24, $24, $24, $E3, $24, $24

    DC.W $2380
    DC.B $20
    DC.B $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24

    DC.W $23A0
    DC.B $20
    DC.B $24, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4
    DC.B $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $24

    DC.W $23C0
    DC.B $20
    DC.B $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FF, $0B, $0A, $0A, $0A, $0A, $0E, $FF
    DC.B $FF, $00, $00, $4A, $5A, $52, $00, $FF, $FF, $00, $00, $00, $00, $58, $5A, $FF

    DC.W $23E0
    DC.B $20
    DC.B $FF, $00, $00, $10, $00, $00, $00, $FF, $FF, $00, $00, $0A, $0A, $02, $00, $FF
    DC.B $FF, $FA, $FA, $BA, $AA, $AA, $AA, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF

    DC.W $2BD0
    DC.B $02
    DC.B $FF, $FF

    DC.W $2BD6
    DC.B $02
    DC.B $FF, $FF

    DC.B $FF

ppu_buf_bat_12_real:
    DC.B $3F,$00,$20
    DC.B $0F,$30,$00,$12    ; FIX v441: keep NES-authentic accent row, backdrop duplication below is the real test
    DC.B $0F,$16,$27,$36
    DC.B $0F,$30,$1C,$2C    ; FIX v442: match the primary frontend text color across BG palette 2
    DC.B $0F,$30,$1C,$2C    ; FIX v442: match the primary frontend text color across BG palette 3
    DC.B $0F,$29,$27,$07
    DC.B $0F,$22,$27,$07
    DC.B $0F,$26,$27,$07
    DC.B $0F,$15,$27,$30
    DC.B $FF

_off000_A869_10_title_screen:  ; orig: _off000_A869_10_title_screen:

; con_ppu_buf_title_screen
    DC.W $2000
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2020
    DC.B $20
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

    DC.W $2040
    DC.B $20
    DC.B $E0, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D4, $E0

    DC.W $2060
    DC.B $20
    DC.B $DC, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DD

    DC.W $2080
    DC.B $20
    DC.B $DC, $EE, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DB

    DC.W $20A0
    DC.B $20
    DC.B $DE, $D7, $24, $24, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5
    DC.B $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $24, $24, $D6, $DB

    DC.W $20C0
    DC.B $20
    DC.B $DC, $D7, $24, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24, $24, $D6, $DF

    DC.W $20E0
    DC.B $20
    DC.B $DE, $EE, $24, $24, $24, $E3, $24, $24, $71, $72, $73, $74, $75, $76, $77, $78
    DC.B $79, $79, $79, $7A, $7B, $24, $24, $24, $24, $24, $E2, $24, $24, $24, $D6, $DB

    DC.W $2100
    DC.B $20
    DC.B $DE, $D8, $EF, $24, $24, $E2, $24, $7C, $7D, $7E, $7F, $80, $81, $82, $83, $84
    DC.B $85, $86, $87, $88, $89, $8A, $8B, $24, $24, $24, $E3, $24, $24, $24, $D6, $DF

    DC.W $2120
    DC.B $20
    DC.B $DC, $DA, $D7, $24, $24, $E3, $24, $8C, $8D, $8E, $8F, $90, $91, $92, $93, $94
    DC.B $95, $96, $97, $98, $99, $9A, $9B, $9C, $24, $24, $E2, $24, $24, $D4, $D9, $DB

    DC.W $2140
    DC.B $20
    DC.B $DC, $D9, $EE, $24, $24, $E2, $24, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5
    DC.B $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $24, $E3, $24, $24, $D6, $DB, $DF

    DC.W $2160
    DC.B $20
    DC.B $DE, $DB, $D7, $24, $24, $E3, $70, $AF, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7
    DC.B $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $C0, $24, $E2, $24, $24, $D6, $DB, $DB

    DC.W $2180
    DC.B $20
    DC.B $DC, $DD, $D7, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $C1, $C2, $C3
    DC.B $C4, $C5, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24, $D6, $DB, $DF

    DC.W $21A0
    DC.B $20
    DC.B $DE, $DB, $EE, $24, $24, $E3, $24, $C6, $C7, $C8, $C8, $C8, $24, $C9, $CA, $CB
    DC.B $CC, $CD, $C8, $C8, $C8, $C8, $E8, $E9, $D3, $24, $E2, $24, $24, $D6, $DB, $DB

    DC.W $21C0
    DC.B $20
    DC.B $DC, $DB, $D7, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $CE
    DC.B $CF, $24, $24, $24, $24, $24, $EA, $EB, $EC, $24, $E3, $24, $24, $D6, $DB, $DF

    DC.W $21E0
    DC.B $20
    DC.B $DC, $DB, $D7, $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D1
    DC.B $D2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24, $D6, $DB, $DB

    DC.W $2200
    DC.B $20
    DC.B $DC, $D8, $E1, $D5, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5
    DC.B $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $D4, $E1, $D9, $DD

    DC.W $2220
    DC.B $20
    DC.B $DC, $DA, $DC, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F0, $01, $09
    DC.B $08, $06, $24, $17, $12, $17, $1D, $0E, $17, $0D, $18, $24, $D6, $DC, $DB, $DF

    DC.W $2240
    DC.B $20
    DC.B $DC, $DA, $DC, $EE, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DE, $ED, $DD

    DC.W $2260
    DC.B $20
    DC.B $DC, $DA, $DE, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DE, $DB, $DD

    DC.W $2280
    DC.B $20
    DC.B $E1, $D9, $DC, $ED, $E0, $EF, $24, $24, $19, $1E, $1C, $11, $24, $1C, $1D, $0A
    DC.B $1B, $1D, $24, $0B, $1E, $1D, $1D, $18, $17, $24, $24, $24, $D6, $D8, $E1, $D9

    DC.W $22A0
    DC.B $20
    DC.B $DD, $ED, $DE, $D8, $E1, $E1, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $24
    DC.B $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DA, $DD, $ED

    DC.W $22C0
    DC.B $20
    DC.B $DD, $DB, $DE, $DA, $DC, $DD, $D8, $E0, $E0, $EF, $24, $24, $24, $24, $D4, $E0
    DC.B $E0, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $D4, $EF, $DA, $DA, $DF, $DB

    DC.W $22E0
    DC.B $20
    DC.B $DF, $DB, $DC, $DA, $DE, $DF, $DA, $DC, $DD, $DB, $26, $26, $26, $26, $DA, $DC
    DC.B $DD, $ED, $E0, $E0, $EF, $24, $D4, $E0, $E0, $E0, $D9, $DB, $DA, $DA, $DF, $DB

    DC.W $2300
    DC.B $20
    DC.B $ED, $D8, $E1, $D9, $DE, $D8, $E1, $D9, $DF, $DB, $26, $26, $26, $26, $DA, $DC
    DC.B $D8, $E1, $D9, $DC, $D8, $E0, $D9, $DC, $DD, $DD, $D8, $E1, $E1, $D9, $DD, $ED

    DC.W $2320
    DC.B $20
    DC.B $ED, $DA, $DD, $ED, $DE, $DA, $DC, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DE
    DC.B $DA, $DC, $DB, $DE, $DA, $DD, $ED, $DC, $DC, $DD, $DA, $DC, $DC, $DB, $DD, $ED

    DC.W $2340
    DC.B $20
    DC.B $ED, $DA, $DD, $D8, $E1, $DA, $DC, $DB, $DF, $DB, $26, $26, $26, $26, $DA, $D8
    DC.B $D9, $DC, $DB, $DC, $DA, $D8, $E1, $D9, $DE, $DF, $DA, $D8, $E1, $E1, $D9, $E1

    DC.W $2360
    DC.B $20
    DC.B $ED, $D9, $DF, $DA, $DC, $DA, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA
    DC.B $ED, $DE, $D8, $E1, $E1, $D9, $DC, $DB, $DE, $D8, $E1, $D9, $DD, $DD, $DB, $DC

    DC.W $2380
    DC.B $20
    DC.B $DF, $DB, $DF, $DA, $DC, $DB, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA
    DC.B $DB, $DD, $DA, $DE, $D8, $E1, $D9, $DB, $DE, $DA, $DD, $DB, $DE, $DF, $D8, $E1

    DC.W $23A0
    DC.B $20
    DC.B $DF, $DB, $DF, $DA, $DC, $DB, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA
    DC.B $DB, $DD, $DA, $DE, $DA, $DD, $DB, $DB, $DE, $DA, $DD, $DB, $DE, $DF, $DC, $DF

    DC.W $23C0
    DC.B $20
    DC.B $05, $05, $05, $05, $05, $05, $05, $05, $08, $6A, $5A, $5A, $5A, $5A, $9A, $22
    DC.B $00, $66, $55, $55, $55, $55, $99, $00, $00, $6E, $5F, $55, $5D, $DF, $BB, $00

    DC.W $23E0
    DC.B $20
    DC.B $00, $0A, $0A, $0A, $0A, $0A, $0A, $00, $00, $00, $C0, $30, $00, $00, $00, $00
    DC.B $00, $00, $CC, $33, $00, $00, $00, $00, $00, $20, $FC, $F3, $00, $00, $F0, $F0

    DC.B $FF



; bzk garbage
    DC.B $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
    DC.B $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF



    ; [DIRECTIVE] .ORG $BF50  -- needs manual handling  ; orig: .org $BF50
    ; [DIRECTIVE] .SEGMENT "BANK_06i"  -- needs manual handling  ; orig: .segment "BANK_06i"
    ; [DIRECTIVE] .INCLUDE "copy_bank___BF50_BFF9.asm"  -- needs manual handling  ; orig: .include "copy_bank___BF50_BF



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank 06: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))  ; orig: .out .sprintf(



    ; [DIRECTIVE] .SEGMENT "VECTORS_06"  -- needs manual handling  ; orig: .segment "VECTORS_06"
    ; [DIRECTIVE] .WORD vec_0x01E494_NMI  -- needs manual handling  ; orig: - - - - - - 0x01C00A 06:BFFA: 84 E4     .wo
    ; [DIRECTIVE] .WORD vec_inc_0x003F60_RESET  -- needs manual handling  ; orig: - - - - - - 0x01C00C 06:BFFC: 50 BF  
    ; [DIRECTIVE] .WORD $BFF0  -- needs manual handling  ; orig: - - - - - - 0x01C00E 06:BFFE: F0 BF     .word $BFF0 ; 

; ── Translation Stats ──
; Translated:  177
; Warnings:    6279
; Unknown:     213

