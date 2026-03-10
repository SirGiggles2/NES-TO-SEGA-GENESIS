.segment "BANK_06"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000  ; for listing file
; 0x018010-0x019CE7

; !! bzk .org control commands here
; take them into account when making
; changes inside this file



.export loc_0x01804E
.export sub_0x01809C
.export sub_0x018119
.export sub_0x01A090_write_buffer_to_ppu



tbl_8000_1st_quest:
    .word _off009_8400_00
    .word _off009_8700_01
    .word _off009_8700_02
    .word _off009_8700_03
    .word _off009_8700_04
    .word _off009_8700_05
    .word _off009_8700_06
    .word _off009_8A00_07
    .word _off009_8A00_08
    .word _off009_8A00_09



tbl_8014:
    .word _off010_9300_00
    .word _off010_93FC_01
    .word _off010_94F8_02
    .word _off010_95F4_03
    .word _off010_96F0_04
    .word _off010_97EC_05
    .word _off010_98E8_06
    .word _off010_99E4_07
    .word _off010_9AE0_08
    .word _off010_9BDC_09



tbl_8028_bat_table_location:
    .word ofs_9CD8_bank_s1_asm_export



tbl_802A_2nd_quest:
    .word _off011_8400_00
    .word _off011_8D00_01
    .word _off011_8D00_02
    .word _off011_8D00_03
    .word _off011_8D00_04
    .word _off011_8D00_05
    .word _off011_8D00_06
    .word _off011_9000_07
    .word _off011_9000_08
    .word _off011_9000_09



loc_0x01804E:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_027_8047_00
    .word ofs_027_8070_01



ofs_027_8047_00:
    LDA ram_dungeon_level
    ASL
    TAX
    LDY ram_current_save_slot
    LDA ram_current_quest,Y
    BNE bra_805E_2nd_quest
; if 1st quest
    LDA tbl_8000_1st_quest,X
    STA ram_0000_t09_copy_data_from
    INX
    LDA tbl_8000_1st_quest,X
    JMP loc_8067
bra_805E_2nd_quest:
    LDA tbl_802A_2nd_quest,X
    STA ram_0000_t09_copy_data_from
    INX
    LDA tbl_802A_2nd_quest,X
loc_8067:
    STA ram_0000_t09_copy_data_from + $01
    JSR sub_80A4_set_copy_range_687E_6B7D
; bzk optimize, JMP
    JSR sub_80D7_copy_bat_table_to_bat
    RTS



ofs_027_8070_01:
    LDA ram_dungeon_level
    ASL
    TAX
    LDA tbl_8014,X
    STA ram_0000_t09_copy_data_from
    INX
    LDA tbl_8014,X
    STA ram_0000_t09_copy_data_from + $01
    JSR sub_80B5_set_copy_range_6B7E_6C7D
    JSR sub_80D7_copy_bat_table_to_bat
    LDA #$00
    STA ram_subscript
    INC ram_0011_screen_ready_flag
    RTS



sub_0x01809C:
    LDX #$00    ; bzk optimize, no loop here, X is not needed
    LDA tbl_8028_bat_table_location,X
    STA ram_0000_t09_copy_data_from
    INX ; 01
    LDA tbl_8028_bat_table_location,X
    STA ram_0000_t09_copy_data_from + $01
    JSR sub_80C6
    JSR sub_80D7_copy_bat_table_to_bat
    LDA #$00
    STA ram_subscript
    RTS



sub_80A4_set_copy_range_687E_6B7D:
; out
    ; ram_0002_t06_copy_data_into
    ; ram_0004_t08_max_addr_lo
    ; ram_0005_t01_max_addr_hi
.scope
tmp_copy_start = ram_687E_map_data
tmp_copy_end   = ram_687E_map_data + $300 - $01
    LDA #< tmp_copy_start
    STA ram_0002_t06_copy_data_into
    LDA #> tmp_copy_start
    STA ram_0002_t06_copy_data_into + $01
    LDA #< tmp_copy_end
    STA ram_0004_t08_max_addr_lo
    LDA #> tmp_copy_end
    STA ram_0005_t01_max_addr_hi
    RTS
.endscope



sub_80B5_set_copy_range_6B7E_6C7D:
; out
    ; ram_0002_t06_copy_data_into
    ; ram_0004_t08_max_addr_lo
    ; ram_0005_t01_max_addr_hi
.scope
tmp_copy_start = ram_6B7E_palette_buffer
tmp_copy_end   = ram_6B7E_palette_buffer + $100 - $01
    LDA #< tmp_copy_start
    STA ram_0002_t06_copy_data_into
    LDA #> tmp_copy_start
    STA ram_0002_t06_copy_data_into + $01
    LDA #< tmp_copy_end
    STA ram_0004_t08_max_addr_lo
    LDA #> tmp_copy_end
    STA ram_0005_t01_max_addr_hi
    RTS
.endscope



sub_80C6:
; out
    ; ram_0002_t06_copy_data_into
    ; ram_0004_t08_max_addr_lo
    ; ram_0005_t01_max_addr_hi
    LDA #< ofs_bat_67F0_bank_s1_asm_import
    STA ram_0002_t06_copy_data_into
    LDA #> ofs_bat_67F0_bank_s1_asm_import
    STA ram_0002_t06_copy_data_into + $01
    LDA #< ram_687D
    STA ram_0004_t08_max_addr_lo
    LDA #> ram_687D
    STA ram_0005_t01_max_addr_hi
    RTS



sub_80D7_copy_bat_table_to_bat:
; in
    ; ram_0000_t09_copy_data_from
    ; ram_0002_t06_copy_data_into
    ; ram_0004_t08_max_addr_lo
    ; ram_0005_t01_max_addr_hi
    LDY #$00
loc_80D9_loop:
    LDA (ram_0000_t09_copy_data_from),Y
    STA (ram_0002_t06_copy_data_into),Y
    LDA ram_0002_t06_copy_data_into
    CMP ram_0004_t08_max_addr_lo
    BNE bra_80EC_not_finished
    LDA ram_0002_t06_copy_data_into + $01
    CMP ram_0005_t01_max_addr_hi
    BNE bra_80EC_not_finished
    INC ram_subscript
    RTS
bra_80EC_not_finished:
; bzk optimize, INC lo + BNE check + INC hi if needed
    LDA ram_0002_t06_copy_data_into
    CLC
    ADC #< $0001
    STA ram_0002_t06_copy_data_into
    LDA ram_0002_t06_copy_data_into + $01
    ADC #> $0001
    STA ram_0002_t06_copy_data_into + $01
    LDA ram_0000_t09_copy_data_from
    CLC
    ADC #< $0001
    STA ram_0000_t09_copy_data_from
    LDA ram_0000_t09_copy_data_from + $01
    ADC #> $0001
    STA ram_0000_t09_copy_data_from + $01
    JMP loc_80D9_loop



sub_0x018119:
    LDY ram_current_save_slot
    LDA ram_current_quest,Y
    BEQ bra_812C_RTS
; if 2nd quest
    LDA ram_dungeon_level
    BEQ bra_812D    ; if overworld
; if dungeon
    TAX
    ASL
    TAY
    LDA tbl_83A4 - $02,Y
    STA ram_0000_t08_data
    LDA tbl_83A4 - $01,Y
    STA ram_0000_t08_data + $01
    LDY tbl_83B6_data_size - $01,X
bra_8124_loop:
    LDA (ram_0000_t08_data),Y
    STA ram_6BA7,Y
    DEY
    BPL bra_8124_loop
bra_812C_RTS:
    RTS
bra_812D:
    LDY #$07
bra_812F_loop:
    LDX tbl_815F,Y
    LDA tbl_8167,Y
    STA ram_68FE_map_data,X     ; bzk uncomfortable pointers
    DEY
    BPL bra_812F_loop
    LDA #con_obj_id_7B
    STA ram_69FE_map_data + $0B
    LDA #con_obj_id_7B
    STA ram_69FE_map_data + $3C
    LDA #con_obj_id_5A
    STA ram_69FE_map_data + $74
    LDA #$72
    STA ram_687E_map_data + $3C
    LDA #$72
    STA ram_687E_map_data + $74
    LDA #$01
    STA ram_6AFE_map_data + $3C
    LDA #$00
    STA ram_6AFE_map_data + $74
    RTS



tbl_815F:
    .byte $0E   ; 00 ram_690C
    .byte $0F   ; 01 ram_690D
    .byte $22   ; 02 ram_6920
    .byte $34   ; 03 ram_6932
    .byte $3C   ; 04 ram_693A
    .byte $45   ; 05 ram_6943
    .byte $74   ; 06 ram_6972
    .byte $8B   ; 07 ram_6989



tbl_8167:
    .byte $7B   ; 00 
    .byte $83   ; 01 
    .byte $84   ; 02 
    .byte $0F   ; 03 
    .byte $0B   ; 04 
    .byte $12   ; 05 
    .byte $7A   ; 06 
    .byte $2F   ; 07 



_off012_816F_01:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $B7   ; ram_6BAA
    .byte $00   ; ram_6BAB
    .byte $E0   ; ram_6BAC
    .byte $77   ; ram_6BAD
    .byte $00 + $08   ; ram_6BAE
    .word ram_06FF
    .byte $01   ; 
    .byte $28   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $07   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $FF   ; 
    .byte $DB   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $65   ; 
    .byte $42   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $85   ; 
    .byte $02   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $A5   ; 
    .byte $02   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $C5   ; 
    .byte $42   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_81A8_02:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $87   ; ram_6BAA
    .byte $05   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $75   ; ram_6BAD
    .byte $20 + $00   ; ram_6BAE
    .word ram_06FF
    .byte $03   ; 
    .byte $56   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $30   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $30   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $7F   ; 
    .byte $03   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $67   ; 
    .byte $01   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $82   ; 
    .byte $01   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $87   ; 
    .byte $C3   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C8   ; 
    .byte $01   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_81DF_03:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $37   ; ram_6BAA
    .byte $0D   ; ram_6BAB
    .byte $C8   ; ram_6BAC
    .byte $79   ; ram_6BAD
    .byte $10 + $0B   ; ram_6BAE
    .word ram_06FF
    .byte $02   ; 
    .byte $09   ; 
    .byte $0B   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $2B   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $7F   ; 
    .byte $EC   ; 
    .byte $7F   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $03   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $84   ; 
    .byte $03   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A4   ; 
    .byte $43   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C4   ; 
    .byte $03   ; 
    .byte $FF   ; 
    .byte $24   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_821C_04:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $86   ; ram_6BAA
    .byte $06   ; ram_6BAB
    .byte $10   ; ram_6BAC
    .byte $72   ; ram_6BAD
    .byte $00 + $00   ; ram_6BAE
    .word ram_06FF
    .byte $05   ; 
    .byte $21   ; 
    .byte $58   ; 
    .byte $7A   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $10   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $CF   ; 
    .byte $DB   ; 
    .byte $F3   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $43   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $85   ; 
    .byte $02   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A4   ; 
    .byte $02   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $C4   ; 
    .byte $43   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_8255_05:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $87   ; ram_6BAA
    .byte $0A   ; ram_6BAB
    .byte $B0   ; ram_6BAC
    .byte $7D   ; ram_6BAD
    .byte $40 + $0F   ; ram_6BAE
    .word ram_06FF
    .byte $04   ; 
    .byte $0F   ; 
    .byte $6A   ; 
    .byte $7F   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $5F   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $E7   ; 
    .byte $7E   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $04   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $84   ; 
    .byte $04   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A4   ; 
    .byte $04   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C4   ; 
    .byte $04   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $FF   ; 



_off012_8298_06:
    .byte $49   ; ram_6BA7
    .byte $79   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $56   ; ram_6BAA
    .byte $04   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $74   ; ram_6BAD
    .byte $10 + $06   ; ram_6BAE
    .word ram_06FF
    .byte $06   ; 
    .byte $03   ; 
    .byte $73   ; 
    .byte $46   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $26   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $04   ; 
    .byte $0C   ; 
    .byte $7E   ; 
    .byte $FF   ; 
    .byte $80   ; 
    .byte $F0   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $65   ; 
    .byte $03   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $68   ; 
    .byte $C2   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $86   ; 
    .byte $C3   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $85   ; 
    .byte $83   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $A3   ; 
    .byte $02   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_82D8_07:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $79   ; ram_6BAA
    .byte $0C   ; ram_6BAB
    .byte $C0   ; ram_6BAC
    .byte $7F   ; ram_6BAD
    .byte $20 + $0D   ; ram_6BAE
    .word ram_077F
    .byte $08   ; 
    .byte $02   ; 
    .byte $03   ; 
    .byte $04   ; 
    .byte $05   ; 
    .byte $20   ; 
    .byte $21   ; 
    .byte $26   ; 
    .byte $2B   ; 
    .byte $2C   ; 
    .byte $FF   ; 
    .byte $3D   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $FE   ; 
    .byte $FE   ; 
    .byte $82   ; 
    .byte $82   ; 
    .byte $82   ; 
    .byte $BE   ; 
    .byte $80   ; 
    .byte $FF   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $62   ; 
    .byte $C3   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $63   ; 
    .byte $C3   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $45   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $69   ; 
    .byte $C4   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $87   ; 
    .byte $C2   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C2   ; 
    .byte $46   ; 
    .byte $67   ; 
    .byte $FF   ; 



_off012_8317_08:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $57   ; ram_6BAA
    .byte $0C   ; ram_6BAB
    .byte $C0   ; ram_6BAC
    .byte $79   ; ram_6BAD
    .byte $10 + $0B   ; ram_6BAE
    .word ram_077F
    .byte $07   ; 
    .byte $27   ; 
    .byte $30   ; 
    .byte $37   ; 
    .byte $60   ; 
    .byte $67   ; 
    .byte $70   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $1C   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $01   ; 
    .byte $01   ; 
    .byte $7D   ; 
    .byte $5D   ; 
    .byte $5D   ; 
    .byte $41   ; 
    .byte $7F   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $45   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $84   ; 
    .byte $05   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $FB   ; 
    .byte $24   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A4   ; 
    .byte $43   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A8   ; 
    .byte $01   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C2   ; 
    .byte $46   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $C8   ; 
    .byte $01   ; 
    .byte $FF   ; 
    .byte $FF   ; 



_off012_835A_09:
    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $B6   ; ram_6BAA
    .byte $04   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $74   ; ram_6BAD
    .byte $00 + $07   ; ram_6BAE
    .word ram_077F
    .byte $09   ; 
    .byte $71   ; 
    .byte $72   ; 
    .byte $75   ; 
    .byte $76   ; 
    .byte $77   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $17   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $CC   ; 
    .byte $DE   ; 
    .byte $76   ; 
    .byte $7F   ; 
    .byte $7F   ; 
    .byte $76   ; 
    .byte $DE   ; 
    .byte $CC   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $20   ; 
    .byte $62   ; 
    .byte $48   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $64   ; 
    .byte $44   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $83   ; 
    .byte $46   ; 
    .byte $FB   ; 
    .byte $20   ; 
    .byte $84   ; 
    .byte $44   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $A2   ; 
    .byte $08   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FB   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $20   ; 
    .byte $C3   ; 
    .byte $46   ; 
    .byte $67   ; 
    .byte $20   ; 
    .byte $C5   ; 
    .byte $42   ; 
    .byte $FF   ; 
    .byte $FF   ; 



tbl_83A4:
    .word _off012_816F_01
    .word _off012_81A8_02
    .word _off012_81DF_03
    .word _off012_821C_04
    .word _off012_8255_05
    .word _off012_8298_06
    .word _off012_82D8_07
    .word _off012_8317_08
    .word _off012_835A_09



tbl_83B6_data_size:
    .byte $39   ; 01 
    .byte $37   ; 02 
    .byte $3D   ; 03 
    .byte $39   ; 04 
    .byte $43   ; 05 
    .byte $40   ; 06 
    .byte $3F   ; 07 
    .byte $43   ; 08 
    .byte $4A   ; 09 


; bzk garbage
    .byte $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



_off009_8400_00:
_off011_8400_00:
    .byte $A3   ; 00 
    .byte $93   ; 01 
    .byte $63   ; 02 
    .byte $73   ; 03 
    .byte $C3   ; 04 
    .byte $53   ; 05 
    .byte $B3   ; 06 
    .byte $A3   ; 07 
    .byte $03   ; 08 
    .byte $93   ; 09 
    .byte $2B   ; 0A 
    .byte $73   ; 0B 
    .byte $83   ; 0C 
    .byte $93   ; 0D 
    .byte $57   ; 0E 
    .byte $87   ; 0F 
    .byte $93   ; 10 
    .byte $53   ; 11 
    .byte $83   ; 12 
    .byte $23   ; 13 
    .byte $C3   ; 14 
    .byte $C3   ; 15 
    .byte $63   ; 16 
    .byte $0B   ; 17 
    .byte $CB   ; 18 
    .byte $4B   ; 19 
    .byte $6B   ; 1A 
    .byte $93   ; 1B 
    .byte $33   ; 1C 
    .byte $27   ; 1D 
    .byte $CF   ; 1E 
    .byte $67   ; 1F 
    .byte $50   ; 20 
    .byte $50   ; 21 
    .byte $73   ; 22 
    .byte $43   ; 23 
    .byte $03   ; 24 
    .byte $A3   ; 25 
    .byte $3B   ; 26 
    .byte $EB   ; 27 
    .byte $EB   ; 28 
    .byte $B3   ; 29 
    .byte $03   ; 2A 
    .byte $B3   ; 2B 
    .byte $93   ; 2C 
    .byte $5F   ; 2D 
    .byte $0F   ; 2E 
    .byte $60   ; 2F 
    .byte $70   ; 30 
    .byte $70   ; 31 
    .byte $03   ; 32 
    .byte $A3   ; 33 
    .byte $43   ; 34 
    .byte $0B   ; 35 
    .byte $0B   ; 36 
    .byte $73   ; 37 
    .byte $0B   ; 38 
    .byte $03   ; 39 
    .byte $C3   ; 3A 
    .byte $63   ; 3B 
    .byte $72   ; 3C 
    .byte $92   ; 3D 
    .byte $0F   ; 3E 
    .byte $0F   ; 3F 
    .byte $00   ; 40 
    .byte $00   ; 41 
    .byte $63   ; 42 
    .byte $03   ; 43 
    .byte $4B   ; 44 
    .byte $83   ; 45 
    .byte $8A   ; 46 
    .byte $BA   ; 47 
    .byte $BA   ; 48 
    .byte $32   ; 49 
    .byte $B2   ; 4A 
    .byte $C2   ; 4B 
    .byte $02   ; 4C 
    .byte $C2   ; 4D 
    .byte $72   ; 4E 
    .byte $0F   ; 4F 
    .byte $00   ; 50 
    .byte $A3   ; 51 
    .byte $03   ; 52 
    .byte $83   ; 53 
    .byte $0A   ; 54 
    .byte $0A   ; 55 
    .byte $BA   ; 56 
    .byte $02   ; 57 
    .byte $C2   ; 58 
    .byte $0A   ; 59 
    .byte $0A   ; 5A 
    .byte $32   ; 5B 
    .byte $02   ; 5C 
    .byte $02   ; 5D 
    .byte $72   ; 5E 
    .byte $0F   ; 5F 
    .byte $C3   ; 60 
    .byte $03   ; 61 
    .byte $63   ; 62 
    .byte $73   ; 63 
    .byte $72   ; 64 
    .byte $0A   ; 65 
    .byte $72   ; 66 
    .byte $72   ; 67 
    .byte $32   ; 68 
    .byte $0A   ; 69 
    .byte $DA   ; 6A 
    .byte $52   ; 6B 
    .byte $42   ; 6C 
    .byte $62   ; 6D 
    .byte $C2   ; 6E 
    .byte $3F   ; 6F 
    .byte $B3   ; 70 
    .byte $53   ; 71 
    .byte $43   ; 72 
    .byte $03   ; 73 
    .byte $82   ; 74 
    .byte $2A   ; 75 
    .byte $62   ; 76 
    .byte $42   ; 77 
    .byte $52   ; 78 
    .byte $63   ; 79 
    .byte $03   ; 7A 
    .byte $9F   ; 7B 
    .byte $6F   ; 7C 
    .byte $6F   ; 7D 
    .byte $0F   ; 7E 
    .byte $0F   ; 7F 

    .byte $27   ; 00 
    .byte $5F   ; 01 
    .byte $6B   ; 02 
    .byte $5F   ; 03 
    .byte $6B   ; 04 
    .byte $27   ; 05 
    .byte $47   ; 06 
    .byte $5F   ; 07 
    .byte $03   ; 08 
    .byte $4F   ; 09 
    .byte $4B   ; 0A 
    .byte $17   ; 0B 
    .byte $7B   ; 0C 
    .byte $6B   ; 0D 
    .byte $63   ; 0E 
    .byte $8B   ; 0F 
    .byte $5B   ; 10 
    .byte $63   ; 11 
    .byte $7F   ; 12 
    .byte $87   ; 13 
    .byte $5F   ; 14 
    .byte $7B   ; 15 
    .byte $5B   ; 16 
    .byte $03   ; 17 
    .byte $6B   ; 18 
    .byte $1F   ; 19 
    .byte $6F   ; 1A 
    .byte $17   ; 1B 
    .byte $57   ; 1C 
    .byte $53   ; 1D 
    .byte $5F   ; 1E 
    .byte $5A   ; 1F 
    .byte $44   ; 20 
    .byte $4C   ; 21 
    .byte $18   ; 22 
    .byte $53   ; 23 
    .byte $03   ; 24 
    .byte $77   ; 25 
    .byte $7F   ; 26 
    .byte $6B   ; 27 
    .byte $86   ; 28 
    .byte $6B   ; 29 
    .byte $03   ; 2A 
    .byte $8F   ; 2B 
    .byte $47   ; 2C 
    .byte $87   ; 2D 
    .byte $03   ; 2E 
    .byte $44   ; 2F 
    .byte $18   ; 30 
    .byte $00   ; 31 
    .byte $03   ; 32 
    .byte $68   ; 33 
    .byte $83   ; 34 
    .byte $03   ; 35 
    .byte $03   ; 36 
    .byte $07   ; 37 
    .byte $03   ; 38 
    .byte $02   ; 39 
    .byte $47   ; 3A 
    .byte $03   ; 3B 
    .byte $0A   ; 3C 
    .byte $86   ; 3D 
    .byte $03   ; 3E 
    .byte $03   ; 3F 
    .byte $00   ; 40 
    .byte $00   ; 41 
    .byte $1F   ; 42 
    .byte $02   ; 43 
    .byte $76   ; 44 
    .byte $12   ; 45 
    .byte $7E   ; 46 
    .byte $46   ; 47 
    .byte $86   ; 48 
    .byte $52   ; 49 
    .byte $76   ; 4A 
    .byte $6A   ; 4B 
    .byte $02   ; 4C 
    .byte $7E   ; 4D 
    .byte $8E   ; 4E 
    .byte $03   ; 4F 
    .byte $00   ; 50 
    .byte $8F   ; 51 
    .byte $03   ; 52 
    .byte $8A   ; 53 
    .byte $02   ; 54 
    .byte $02   ; 55 
    .byte $8E   ; 56 
    .byte $02   ; 57 
    .byte $86   ; 58 
    .byte $02   ; 59 
    .byte $02   ; 5A 
    .byte $8E   ; 5B 
    .byte $02   ; 5C 
    .byte $02   ; 5D 
    .byte $7A   ; 5E 
    .byte $03   ; 5F 
    .byte $5B   ; 60 
    .byte $03   ; 61 
    .byte $8B   ; 62 
    .byte $5F   ; 63 
    .byte $6A   ; 64 
    .byte $03   ; 65 
    .byte $7B   ; 66 
    .byte $86   ; 67 
    .byte $5E   ; 68 
    .byte $02   ; 69 
    .byte $5E   ; 6A 
    .byte $8A   ; 6B 
    .byte $22   ; 6C 
    .byte $22   ; 6D 
    .byte $8E   ; 6E 
    .byte $77   ; 6F 
    .byte $73   ; 70 
    .byte $87   ; 71 
    .byte $5F   ; 72 
    .byte $03   ; 73 
    .byte $0F   ; 74 
    .byte $66   ; 75 
    .byte $5A   ; 76 
    .byte $42   ; 77 
    .byte $6A   ; 78 
    .byte $53   ; 79 
    .byte $03   ; 7A 
    .byte $47   ; 7B 
    .byte $5B   ; 7C 
    .byte $5F   ; 7D 
    .byte $03   ; 7E 
    .byte $03   ; 7F 

    .byte $00   ; 00 
    .byte $42   ; 01 
    .byte $42   ; 02 
    .byte $1F   ; 03 
    .byte $C1   ; 04 
    .byte $E6   ; 05 
    .byte $E4   ; 06 
    .byte $02   ; 07 
    .byte $1F   ; 08 
    .byte $00   ; 09 
    .byte $01   ; 0A 
    .byte $10   ; 0B 
    .byte $CE   ; 0C 
    .byte $CE   ; 0D 
    .byte $00   ; 0E 
    .byte $00   ; 0F 
    .byte $41   ; 10 
    .byte $E4   ; 11 
    .byte $C1   ; 12 
    .byte $65   ; 13 
    .byte $42   ; 14 
    .byte $E4   ; 15 
    .byte $1F   ; 16 
    .byte $1F   ; 17 
    .byte $1F   ; 18 
    .byte $1F   ; 19 
    .byte $CE   ; 1A 
    .byte $00   ; 1B 
    .byte $00   ; 1C 
    .byte $DA   ; 1D 
    .byte $CE   ; 1E 
    .byte $DA   ; 1F 
    .byte $21   ; 20 
    .byte $21   ; 21 
    .byte $02   ; 22 
    .byte $42   ; 23 
    .byte $00   ; 24 
    .byte $5A   ; 25 
    .byte $DA   ; 26 
    .byte $DA   ; 27 
    .byte $DA   ; 28 
    .byte $50   ; 29 
    .byte $CF   ; 2A 
    .byte $E7   ; 2B 
    .byte $4E   ; 2C 
    .byte $AA   ; 2D 
    .byte $49   ; 2E 
    .byte $00   ; 2F 
    .byte $21   ; 30 
    .byte $21   ; 31 
    .byte $E4   ; 32 
    .byte $00   ; 33 
    .byte $4F   ; 34 
    .byte $00   ; 35 
    .byte $00   ; 36 
    .byte $08   ; 37 
    .byte $E8   ; 38 
    .byte $2F   ; 39 
    .byte $E7   ; 3A 
    .byte $4F   ; 3B 
    .byte $0A   ; 3C 
    .byte $43   ; 3D 
    .byte $AA   ; 3E 
    .byte $09   ; 3F 
    .byte $21   ; 40 
    .byte $21   ; 41 
    .byte $04   ; 42 
    .byte $2F   ; 43 
    .byte $47   ; 44 
    .byte $1A   ; 45 
    .byte $00   ; 46 
    .byte $00   ; 47 
    .byte $50   ; 48 
    .byte $E8   ; 49 
    .byte $CD   ; 4A 
    .byte $C4   ; 4B 
    .byte $AA   ; 4C 
    .byte $43   ; 4D 
    .byte $43   ; 4E 
    .byte $AB   ; 4F 
    .byte $82   ; 50 
    .byte $83   ; 51 
    .byte $63   ; 52 
    .byte $A2   ; 53 
    .byte $69   ; 54 
    .byte $07   ; 55 
    .byte $47   ; 56 
    .byte $69   ; 57 
    .byte $69   ; 58 
    .byte $5A   ; 59 
    .byte $47   ; 5A 
    .byte $63   ; 5B 
    .byte $43   ; 5C 
    .byte $43   ; 5D 
    .byte $83   ; 5E 
    .byte $AA   ; 5F 
    .byte $E4   ; 60 
    .byte $83   ; 61 
    .byte $83   ; 62 
    .byte $EC   ; 63 
    .byte $AA   ; 64 
    .byte $69   ; 65 
    .byte $69   ; 66 
    .byte $47   ; 67 
    .byte $47   ; 68 
    .byte $47   ; 69 
    .byte $69   ; 6A 
    .byte $EC   ; 6B 
    .byte $44   ; 6C 
    .byte $44   ; 6D 
    .byte $EC   ; 6E 
    .byte $A8   ; 6F 
    .byte $5A   ; 70 
    .byte $83   ; 71 
    .byte $62   ; 72 
    .byte $43   ; 73 
    .byte $0E   ; 74 
    .byte $E7   ; 75 
    .byte $4E   ; 76 
    .byte $00   ; 77 
    .byte $47   ; 78 
    .byte $8D   ; 79 
    .byte $4D   ; 7A 
    .byte $D0   ; 7B 
    .byte $D0   ; 7C 
    .byte $49   ; 7D 
    .byte $48   ; 7E 
    .byte $09   ; 7F 

    .byte $00 + $00 + con_obj_id_null   ; 00 
    .byte $00 + $00 + con_obj_id_01   ; 01 
    .byte $00 + $00 + con_obj_id_02   ; 02 
    .byte $00 + $00 + con_obj_id_03   ; 03 
    .byte $00 + $00 + con_obj_id_04   ; 04 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 05 
    .byte $00 + $80 + con_obj_id_46 - $40   ; 06 
    .byte $00 + $00 + con_obj_id_07   ; 07 
    .byte $00 + $00 + con_obj_id_06   ; 08 
    .byte $00 + $00 + con_obj_id_08   ; 09 
    .byte $00 + $00 + con_obj_id_09   ; 0A 
    .byte $00 + $00 + con_obj_id_0A   ; 0B 
    .byte $00 + $00 + con_obj_id_0B   ; 0C 
    .byte $00 + $00 + con_obj_id_0C   ; 0D 
    .byte $00 + $00 + con_obj_id_0D   ; 0E 
    .byte $00 + $00 + con_obj_id_0E   ; 0F 
    .byte $00 + $00 + con_obj_id_0F   ; 10 
    .byte $00 + $80 + con_obj_id_50 - $40   ; 11 
    .byte $00 + $00 + con_obj_id_11   ; 12 
    .byte $00 + $80 + con_obj_id_52 - $40   ; 13 
    .byte $00 + $00 + con_obj_id_13   ; 14 
    .byte $00 + $80 + con_obj_id_54 - $40   ; 15 
    .byte $00 + $00 + con_obj_id_15   ; 16 
    .byte $00 + $00 + con_obj_id_16   ; 17 
    .byte $00 + $00 + con_obj_id_17   ; 18 
    .byte $00 + $00 + con_obj_id_18   ; 19 
    .byte $00 + $00 + con_obj_id_19   ; 1A 
    .byte $00 + $00 + con_obj_id_1A   ; 1B 
    .byte $00 + $00 + con_obj_id_1B   ; 1C 
    .byte $00 + $00 + con_obj_id_1C   ; 1D 
    .byte $00 + $00 + con_obj_id_1D   ; 1E 
    .byte $00 + $00 + con_obj_id_1E   ; 1F 
    .byte $00 + $00 + con_obj_id_1F   ; 20 
    .byte $00 + $00 + con_obj_id_20   ; 21 
    .byte $00 + $00 + con_obj_id_21   ; 22 
    .byte $00 + $00 + con_obj_id_22   ; 23 
    .byte $00 + $00 + con_obj_id_23   ; 24 
    .byte $00 + $00 + con_obj_id_24   ; 25 
    .byte $00 + $00 + con_obj_id_25   ; 26 
    .byte $00 + $00 + con_obj_id_26   ; 27 
    .byte $00 + $00 + con_obj_id_27   ; 28 
    .byte $00 + $00 + con_obj_id_28   ; 29 
    .byte $00 + $00 + con_obj_id_29   ; 2A 
    .byte $00 + $80 + con_obj_id_6A - $40   ; 2B 
    .byte $00 + $00 + con_obj_id_2B   ; 2C 
    .byte $00 + $80 + con_obj_id_6C - $40   ; 2D 
    .byte $00 + $00 + con_obj_id_2D   ; 2E 
    .byte $00 + $00 + con_obj_id_2E   ; 2F 
    .byte $00 + $00 + con_obj_id_2F   ; 30 
    .byte $00 + $00 + con_obj_id_30   ; 31 
    .byte $00 + $80 + con_obj_id_71 - $40   ; 32 
    .byte $00 + $00 + con_obj_id_32   ; 33 
    .byte $00 + $00 + con_obj_id_33   ; 34 
    .byte $00 + $00 + con_obj_id_34   ; 35 
    .byte $00 + $00 + con_obj_id_35   ; 36 
    .byte $00 + $00 + con_obj_id_36   ; 37 
    .byte $00 + $80 + con_obj_id_77 - $40   ; 38 
    .byte $00 + $00 + con_obj_id_38   ; 39 
    .byte $00 + $80 + con_obj_id_79 - $40   ; 3A 
    .byte $00 + $00 + con_obj_id_3A   ; 3B 
    .byte $00 + $00 + con_obj_id_0A   ; 3C 
    .byte $00 + $00 + con_obj_id_3B   ; 3D 
    .byte $00 + $80 + con_obj_id_7C - $40   ; 3E 
    .byte $00 + $00 + con_obj_id_3D   ; 3F 
    .byte $00 + $00 + con_obj_id_3E   ; 40 
    .byte $00 + $00 + con_obj_id_3F   ; 41 
    .byte $00 + $00 + con_obj_id_38   ; 42 
    .byte $00 + $00 + con_obj_id_38   ; 43 
    .byte $40 + $00 + con_obj_id_null   ; 44 
    .byte $40 + $00 + con_obj_id_01   ; 45 
    .byte $40 + $00 + con_obj_id_02   ; 46 
    .byte $40 + $00 + con_obj_id_03   ; 47 
    .byte $40 + $00 + con_obj_id_04   ; 48 
    .byte $40 + $80 + con_obj_id_45 - $40   ; 49 
    .byte $40 + $00 + con_obj_id_06   ; 4A 
    .byte $40 + $00 + con_obj_id_07   ; 4B 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 4C 
    .byte $40 + $00 + con_obj_id_09   ; 4D 
    .byte $40 + $00 + con_obj_id_0A   ; 4E 
    .byte $40 + $80 + con_obj_id_4B - $40   ; 4F 
    .byte $40 + $00 + con_obj_id_0C   ; 50 
    .byte $40 + $00 + con_obj_id_0D   ; 51 
    .byte $40 + $80 + con_obj_id_4E - $40   ; 52 
    .byte $40 + $80 + con_obj_id_4F - $40   ; 53 
    .byte $40 + $80 + con_obj_id_50 - $40   ; 54 
    .byte $40 + $00 + con_obj_id_11   ; 55 
    .byte $40 + $00 + con_obj_id_12   ; 56 
    .byte $40 + $80 + con_obj_id_53 - $40   ; 57 
    .byte $40 + $80 + con_obj_id_54 - $40   ; 58 
    .byte $40 + $00 + con_obj_id_15   ; 59 
    .byte $40 + $00 + con_obj_id_16   ; 5A 
    .byte $40 + $80 + con_obj_id_57 - $40   ; 5B 
    .byte $40 + $00 + con_obj_id_18   ; 5C 
    .byte $40 + $00 + con_obj_id_19   ; 5D 
    .byte $40 + $00 + con_obj_id_1A   ; 5E 
    .byte $40 + $80 + con_obj_id_4B - $40   ; 5F 
    .byte $40 + $80 + con_obj_id_5B - $40   ; 60 
    .byte $40 + $00 + con_obj_id_1C   ; 61 
    .byte $40 + $00 + con_obj_id_1D   ; 62 
    .byte $40 + $80 + con_obj_id_5E - $40   ; 63 
    .byte $40 + $80 + con_obj_id_5F - $40   ; 64 
    .byte $40 + $80 + con_obj_id_60 - $40   ; 65 
    .byte $40 + $80 + con_obj_id_61 - $40   ; 66 
    .byte $40 + $00 + con_obj_id_22   ; 67 
    .byte $40 + $00 + con_obj_id_23   ; 68 
    .byte $40 + $00 + con_obj_id_24   ; 69 
    .byte $40 + $80 + con_obj_id_65 - $40   ; 6A 
    .byte $40 + $80 + con_obj_id_66 - $40   ; 6B 
    .byte $40 + $00 + con_obj_id_27   ; 6C 
    .byte $40 + $00 + con_obj_id_28   ; 6D 
    .byte $40 + $80 + con_obj_id_69 - $40   ; 6E 
    .byte $40 + $80 + con_obj_id_6A - $40   ; 6F 
    .byte $40 + $00 + con_obj_id_2B   ; 70 
    .byte $40 + $00 + con_obj_id_2C   ; 71 
    .byte $40 + $80 + con_obj_id_6D - $40   ; 72 
    .byte $40 + $00 + con_obj_id_2E   ; 73 
    .byte $40 + $00 + con_obj_id_2F   ; 74 
    .byte $40 + $80 + con_obj_id_70 - $40   ; 75 
    .byte $40 + $00 + con_obj_id_31   ; 76 
    .byte $40 + $00 + con_obj_id_32   ; 77 
    .byte $40 + $00 + con_obj_id_33   ; 78 
    .byte $40 + $00 + con_obj_id_34   ; 79 
    .byte $00 + $00 + con_obj_id_06   ; 7A 
    .byte $40 + $00 + con_obj_id_35   ; 7B 
    .byte $40 + $00 + con_obj_id_36   ; 7C 
    .byte $40 + $00 + con_obj_id_36   ; 7D 
    .byte $40 + $00 + con_obj_id_37   ; 7E 
    .byte $40 + $00 + con_obj_id_38   ; 7F 

    .byte $3F   ; 00 
    .byte $01   ; 01 
    .byte $7F   ; 02 
    .byte $20   ; 03 
    .byte $3F   ; 04 
    .byte $5A   ; 05 
    .byte $7F   ; 06 
    .byte $02   ; 07 
    .byte $7F   ; 08 
    .byte $7F   ; 09 
    .byte $03   ; 0A 
    .byte $7F   ; 0B 
    .byte $3F   ; 0C 
    .byte $3F   ; 0D 
    .byte $3F   ; 0E 
    .byte $3F   ; 0F 
    .byte $3F   ; 10 
    .byte $3F   ; 11 
    .byte $98   ; 12 
    .byte $98   ; 13 
    .byte $D8   ; 14 
    .byte $3F   ; 15 
    .byte $3F   ; 16 
    .byte $3F   ; 17 
    .byte $3F   ; 18 
    .byte $15   ; 19 
    .byte $7F   ; 1A 
    .byte $3F   ; 1B 
    .byte $3F   ; 1C 
    .byte $3F   ; 1D 
    .byte $1F   ; 1E 
    .byte $3F   ; 1F 
    .byte $E0   ; 20 
    .byte $98   ; 21 
    .byte $58   ; 22 
    .byte $D8   ; 23 
    .byte $98   ; 24 
    .byte $58   ; 25 
    .byte $D8   ; 26 
    .byte $1C   ; 27 
    .byte $00   ; 28 
    .byte $C8   ; 29 
    .byte $1C   ; 2A 
    .byte $19   ; 2B 
    .byte $C6   ; 2C 
    .byte $1C   ; 2D 
    .byte $04   ; 2E 
    .byte $E2   ; 2F 
    .byte $19   ; 30 
    .byte $12   ; 31 
    .byte $C4   ; 32 
    .byte $3F   ; 33 
    .byte $98   ; 34 
    .byte $7F   ; 35 
    .byte $3F   ; 36 
    .byte $98   ; 37 
    .byte $7F   ; 38 
    .byte $3F   ; 39 
    .byte $98   ; 3A 
    .byte $7F   ; 3B 
    .byte $00   ; 3C 
    .byte $00   ; 3D 
    .byte $00   ; 3E 
    .byte $00   ; 3F 
    .byte $00   ; 40 
    .byte $00   ; 41 
    .byte $00   ; 42 
    .byte $00   ; 43 
    .byte $00   ; 44 
    .byte $00   ; 45 
    .byte $00   ; 46 
    .byte $00   ; 47 
    .byte $00   ; 48 
    .byte $00   ; 49 
    .byte $00   ; 4A 
    .byte $00   ; 4B 
    .byte $00   ; 4C 
    .byte $00   ; 4D 
    .byte $0A   ; 4E 
    .byte $0A   ; 4F 
    .byte $0A   ; 50 
    .byte $00   ; 51 
    .byte $00   ; 52 
    .byte $00   ; 53 
    .byte $00   ; 54 
    .byte $00   ; 55 
    .byte $00   ; 56 
    .byte $00   ; 57 
    .byte $00   ; 58 
    .byte $00   ; 59 
    .byte $28   ; 5A 
    .byte $00   ; 5B 
    .byte $44   ; 5C 
    .byte $05   ; 5D 
    .byte $0A   ; 5E 
    .byte $14   ; 5F 
    .byte $0A   ; 60 
    .byte $1E   ; 61 
    .byte $32   ; 62 
    .byte $82   ; 63 
    .byte $14   ; 64 
    .byte $50   ; 65 
    .byte $A0   ; 66 
    .byte $64   ; 67 
    .byte $3C   ; 68 
    .byte $5A   ; 69 
    .byte $64   ; 6A 
    .byte $0A   ; 6B 
    .byte $50   ; 6C 
    .byte $FA   ; 6D 
    .byte $3C   ; 6E 
    .byte $00   ; 6F 
    .byte $1E   ; 70 
    .byte $00   ; 71 
    .byte $00   ; 72 
    .byte $64   ; 73 
    .byte $00   ; 74 
    .byte $00   ; 75 
    .byte $0A   ; 76 
    .byte $00   ; 77 
    .byte $FF   ; 78 
    .byte $FF   ; 79 
    .byte $FF   ; 7A 
    .byte $FF   ; 7B 
    .byte $FF   ; 7C 
    .byte $FF   ; 7D 
    .byte $FF   ; 7E 
    .byte $FF   ; 7F 

    .byte $83   ; 00 
    .byte $00   ; 01 
    .byte $83   ; 02 
    .byte $03   ; 03 
    .byte $00   ; 04 
    .byte $45   ; 05 
    .byte $84   ; 06 
    .byte $03   ; 07 
    .byte $00   ; 08 
    .byte $A4   ; 09 
    .byte $00   ; 0A 
    .byte $03   ; 0B 
    .byte $00   ; 0C 
    .byte $00   ; 0D 
    .byte $0B   ; 0E 
    .byte $03   ; 0F 
    .byte $00   ; 10 
    .byte $A4   ; 11 
    .byte $00   ; 12 
    .byte $00   ; 13 
    .byte $00   ; 14 
    .byte $80   ; 15 
    .byte $00   ; 16 
    .byte $00   ; 17 
    .byte $82   ; 18 
    .byte $82   ; 19 
    .byte $03   ; 1A 
    .byte $A4   ; 1B 
    .byte $02   ; 1C 
    .byte $02   ; 1D 
    .byte $00   ; 1E 
    .byte $03   ; 1F 
    .byte $B3   ; 20 
    .byte $62   ; 21 
    .byte $03   ; 22 
    .byte $11   ; 23 
    .byte $00   ; 24 
    .byte $00   ; 25 
    .byte $00   ; 26 
    .byte $40   ; 27 
    .byte $05   ; 28 
    .byte $84   ; 29 
    .byte $00   ; 2A 
    .byte $84   ; 2B 
    .byte $45   ; 2C 
    .byte $00   ; 2D 
    .byte $00   ; 2E 
    .byte $03   ; 2F 
    .byte $84   ; 30 
    .byte $04   ; 31 
    .byte $00   ; 32 
    .byte $00   ; 33 
    .byte $02   ; 34 
    .byte $00   ; 35 
    .byte $00   ; 36 
    .byte $03   ; 37 
    .byte $00   ; 38 
    .byte $80   ; 39 
    .byte $84   ; 3A 
    .byte $02   ; 3B 
    .byte $03   ; 3C 
    .byte $02   ; 3D 
    .byte $00   ; 3E 
    .byte $00   ; 3F 
    .byte $00   ; 40 
    .byte $00   ; 41 
    .byte $01   ; 42 
    .byte $00   ; 43 
    .byte $00   ; 44 
    .byte $03   ; 45 
    .byte $06   ; 46 
    .byte $45   ; 47 
    .byte $02   ; 48 
    .byte $02   ; 49 
    .byte $00   ; 4A 
    .byte $09   ; 4B 
    .byte $00   ; 4C 
    .byte $0C   ; 4D 
    .byte $0A   ; 4E 
    .byte $00   ; 4F 
    .byte $00   ; 50 
    .byte $05   ; 51 
    .byte $08   ; 52 
    .byte $85   ; 53 
    .byte $00   ; 54 
    .byte $00   ; 55 
    .byte $06   ; 56 
    .byte $08   ; 57 
    .byte $8C   ; 58 
    .byte $00   ; 59 
    .byte $00   ; 5A 
    .byte $0D   ; 5B 
    .byte $08   ; 5C 
    .byte $08   ; 5D 
    .byte $00   ; 5E 
    .byte $00   ; 5F 
    .byte $84   ; 60 
    .byte $08   ; 61 
    .byte $4B   ; 62 
    .byte $05   ; 63 
    .byte $00   ; 64 
    .byte $00   ; 65 
    .byte $00   ; 66 
    .byte $40   ; 67 
    .byte $0C   ; 68 
    .byte $00   ; 69 
    .byte $05   ; 6A 
    .byte $4D   ; 6B 
    .byte $89   ; 6C 
    .byte $49   ; 6D 
    .byte $84   ; 6E 
    .byte $00   ; 6F 
    .byte $00   ; 70 
    .byte $48   ; 71 
    .byte $8C   ; 72 
    .byte $08   ; 73 
    .byte $03   ; 74 
    .byte $00   ; 75 
    .byte $00   ; 76 
    .byte $00   ; 77 
    .byte $0C   ; 78 
    .byte $22   ; 79 
    .byte $00   ; 7A 
    .byte $40   ; 7B 
    .byte $00   ; 7C 
    .byte $00   ; 7D 
    .byte $00   ; 7E 
    .byte $00   ; 7F 



_off009_8700_01:
_off009_8700_02:
_off009_8700_03:
_off009_8700_04:
_off009_8700_05:
_off009_8700_06:
    .byte $22   ; 00 
    .byte $32   ; 01 
    .byte $22   ; 02 
    .byte $22   ; 03 
    .byte $05   ; 04 
    .byte $26   ; 05 
    .byte $36   ; 06 
    .byte $64   ; 07 
    .byte $3A   ; 08 
    .byte $36   ; 09 
    .byte $3E   ; 0A 
    .byte $22   ; 0B 
    .byte $22   ; 0C 
    .byte $26   ; 0D 
    .byte $22   ; 0E 
    .byte $69   ; 0F 
    .byte $FE   ; 10 
    .byte $92   ; 11 
    .byte $06   ; 12 
    .byte $E6   ; 13 
    .byte $22   ; 14 
    .byte $32   ; 15 
    .byte $A6   ; 16 
    .byte $26   ; 17 
    .byte $3E   ; 18 
    .byte $B6   ; 19 
    .byte $06   ; 1A 
    .byte $E6   ; 1B 
    .byte $F6   ; 1C 
    .byte $22   ; 1D 
    .byte $FE   ; 1E 
    .byte $22   ; 1F 
    .byte $16   ; 20 
    .byte $96   ; 21 
    .byte $26   ; 22 
    .byte $36   ; 23 
    .byte $E2   ; 24 
    .byte $86   ; 25 
    .byte $26   ; 26 
    .byte $22   ; 27 
    .byte $1E   ; 28 
    .byte $A2   ; 29 
    .byte $26   ; 2A 
    .byte $22   ; 2B 
    .byte $A2   ; 2C 
    .byte $06   ; 2D 
    .byte $E2   ; 2E 
    .byte $12   ; 2F 
    .byte $A2   ; 30 
    .byte $A6   ; 31 
    .byte $26   ; 32 
    .byte $A2   ; 33 
    .byte $E6   ; 34 
    .byte $36   ; 35 
    .byte $26   ; 36 
    .byte $02   ; 37 
    .byte $FE   ; 38 
    .byte $E6   ; 39 
    .byte $26   ; 3A 
    .byte $F6   ; 3B 
    .byte $E6   ; 3C 
    .byte $22   ; 3D 
    .byte $02   ; 3E 
    .byte $92   ; 3F 
    .byte $02   ; 40 
    .byte $26   ; 41 
    .byte $36   ; 42 
    .byte $12   ; 43 
    .byte $32   ; 44 
    .byte $A6   ; 45 
    .byte $36   ; 46 
    .byte $02   ; 47 
    .byte $02   ; 48 
    .byte $22   ; 49 
    .byte $22   ; 4A 
    .byte $A2   ; 4B 
    .byte $22   ; 4C 
    .byte $FE   ; 4D 
    .byte $1E   ; 4E 
    .byte $92   ; 4F 
    .byte $06   ; 50 
    .byte $22   ; 51 
    .byte $A6   ; 52 
    .byte $82   ; 53 
    .byte $86   ; 54 
    .byte $22   ; 55 
    .byte $A2   ; 56 
    .byte $06   ; 57 
    .byte $E2   ; 58 
    .byte $1E   ; 59 
    .byte $06   ; 5A 
    .byte $02   ; 5B 
    .byte $06   ; 5C 
    .byte $E6   ; 5D 
    .byte $02   ; 5E 
    .byte $92   ; 5F 
    .byte $32   ; 60 
    .byte $02   ; 61 
    .byte $26   ; 62 
    .byte $16   ; 63 
    .byte $26   ; 64 
    .byte $E6   ; 65 
    .byte $E2   ; 66 
    .byte $32   ; 67 
    .byte $02   ; 68 
    .byte $06   ; 69 
    .byte $36   ; 6A 
    .byte $02   ; 6B 
    .byte $26   ; 6C 
    .byte $22   ; 6D 
    .byte $02   ; 6E 
    .byte $86   ; 6F 
    .byte $26   ; 70 
    .byte $02   ; 71 
    .byte $26   ; 72 
    .byte $A2   ; 73 
    .byte $26   ; 74 
    .byte $09   ; 75 
    .byte $02   ; 76 
    .byte $86   ; 77 
    .byte $06   ; 78 
    .byte $22   ; 79 
    .byte $A6   ; 7A 
    .byte $06   ; 7B 
    .byte $22   ; 7C 
    .byte $02   ; 7D 
    .byte $06   ; 7E 
    .byte $22   ; 7F 

    .byte $34   ; 00 
    .byte $A3   ; 01 
    .byte $07   ; 02 
    .byte $26   ; 03 
    .byte $05   ; 04 
    .byte $36   ; 05 
    .byte $A6   ; 06 
    .byte $06   ; 07 
    .byte $1D   ; 08 
    .byte $32   ; 09 
    .byte $92   ; 0A 
    .byte $84   ; 0B 
    .byte $26   ; 0C 
    .byte $22   ; 0D 
    .byte $E6   ; 0E 
    .byte $69   ; 0F 
    .byte $32   ; 10 
    .byte $92   ; 11 
    .byte $9E   ; 12 
    .byte $E6   ; 13 
    .byte $26   ; 14 
    .byte $24   ; 15 
    .byte $33   ; 16 
    .byte $84   ; 17 
    .byte $3E   ; 18 
    .byte $03   ; 19 
    .byte $03   ; 1A 
    .byte $06   ; 1B 
    .byte $26   ; 1C 
    .byte $26   ; 1D 
    .byte $32   ; 1E 
    .byte $84   ; 1F 
    .byte $23   ; 20 
    .byte $07   ; 21 
    .byte $36   ; 22 
    .byte $A7   ; 23 
    .byte $36   ; 24 
    .byte $A2   ; 25 
    .byte $17   ; 26 
    .byte $A7   ; 27 
    .byte $32   ; 28 
    .byte $87   ; 29 
    .byte $3E   ; 2A 
    .byte $04   ; 2B 
    .byte $22   ; 2C 
    .byte $07   ; 2D 
    .byte $36   ; 2E 
    .byte $A6   ; 2F 
    .byte $37   ; 30 
    .byte $BF   ; 31 
    .byte $06   ; 32 
    .byte $27   ; 33 
    .byte $26   ; 34 
    .byte $3E   ; 35 
    .byte $06   ; 36 
    .byte $27   ; 37 
    .byte $26   ; 38 
    .byte $3F   ; 39 
    .byte $06   ; 3A 
    .byte $26   ; 3B 
    .byte $27   ; 3C 
    .byte $26   ; 3D 
    .byte $21   ; 3E 
    .byte $06   ; 3F 
    .byte $27   ; 40 
    .byte $20   ; 41 
    .byte $E2   ; 42 
    .byte $16   ; 43 
    .byte $A2   ; 44 
    .byte $06   ; 45 
    .byte $23   ; 46 
    .byte $07   ; 47 
    .byte $26   ; 48 
    .byte $22   ; 49 
    .byte $16   ; 4A 
    .byte $B6   ; 4B 
    .byte $B2   ; 4C 
    .byte $85   ; 4D 
    .byte $22   ; 4E 
    .byte $06   ; 4F 
    .byte $23   ; 50 
    .byte $06   ; 51 
    .byte $3E   ; 52 
    .byte $02   ; 53 
    .byte $06   ; 54 
    .byte $3F   ; 55 
    .byte $E2   ; 56 
    .byte $07   ; 57 
    .byte $27   ; 58 
    .byte $36   ; 59 
    .byte $A2   ; 5A 
    .byte $12   ; 5B 
    .byte $9E   ; 5C 
    .byte $E6   ; 5D 
    .byte $36   ; 5E 
    .byte $A6   ; 5F 
    .byte $32   ; 60 
    .byte $36   ; 61 
    .byte $A7   ; 62 
    .byte $26   ; 63 
    .byte $32   ; 64 
    .byte $92   ; 65 
    .byte $97   ; 66 
    .byte $A4   ; 67 
    .byte $26   ; 68 
    .byte $26   ; 69 
    .byte $24   ; 6A 
    .byte $26   ; 6B 
    .byte $22   ; 6C 
    .byte $E2   ; 6D 
    .byte $16   ; 6E 
    .byte $A6   ; 6F 
    .byte $22   ; 70 
    .byte $07   ; 71 
    .byte $22   ; 72 
    .byte $03   ; 73 
    .byte $06   ; 74 
    .byte $09   ; 75 
    .byte $23   ; 76 
    .byte $06   ; 77 
    .byte $36   ; 78 
    .byte $A3   ; 79 
    .byte $07   ; 7A 
    .byte $22   ; 7B 
    .byte $07   ; 7C 
    .byte $23   ; 7D 
    .byte $06   ; 7E 
    .byte $22   ; 7F 

    .byte $0E   ; 00 
    .byte $DB   ; 01 
    .byte $09   ; 02 
    .byte $00   ; 03 
    .byte $98   ; 04 
    .byte $8C   ; 05 
    .byte $00   ; 06 
    .byte $69   ; 07 
    .byte $69   ; 08 
    .byte $7B   ; 09 
    .byte $B3   ; 0A 
    .byte $0C   ; 0B 
    .byte $00   ; 0C 
    .byte $00   ; 0D 
    .byte $32   ; 0E 
    .byte $68   ; 0F 
    .byte $3C   ; 10 
    .byte $35   ; 11 
    .byte $52   ; 12 
    .byte $03   ; 13 
    .byte $00   ; 14 
    .byte $0D   ; 15 
    .byte $DB   ; 16 
    .byte $0F   ; 17 
    .byte $04   ; 18 
    .byte $B3   ; 19 
    .byte $A4   ; 1A 
    .byte $FC   ; 1B 
    .byte $34   ; 1C 
    .byte $B3   ; 1D 
    .byte $46   ; 1E 
    .byte $0B   ; 1F 
    .byte $52   ; 20 
    .byte $55   ; 21 
    .byte $0A   ; 22 
    .byte $06   ; 23 
    .byte $39   ; 24 
    .byte $56   ; 25 
    .byte $70   ; 26 
    .byte $B0   ; 27 
    .byte $7B   ; 28 
    .byte $7B   ; 29 
    .byte $DB   ; 2A 
    .byte $0B   ; 2B 
    .byte $F7   ; 2C 
    .byte $72   ; 2D 
    .byte $E8   ; 2E 
    .byte $55   ; 2F 
    .byte $72   ; 30 
    .byte $52   ; 31 
    .byte $B3   ; 32 
    .byte $2A   ; 33 
    .byte $B0   ; 34 
    .byte $3D   ; 35 
    .byte $00   ; 36 
    .byte $0B   ; 37 
    .byte $FC   ; 38 
    .byte $52   ; 39 
    .byte $FC   ; 3A 
    .byte $AD   ; 3B 
    .byte $7B   ; 3C 
    .byte $00   ; 3D 
    .byte $01   ; 3E 
    .byte $EE   ; 3F 
    .byte $53   ; 40 
    .byte $0C   ; 41 
    .byte $15   ; 42 
    .byte $55   ; 43 
    .byte $06   ; 44 
    .byte $E7   ; 45 
    .byte $00   ; 46 
    .byte $70   ; 47 
    .byte $09   ; 48 
    .byte $EF   ; 49 
    .byte $5B   ; 4A 
    .byte $13   ; 4B 
    .byte $AD   ; 4C 
    .byte $3C   ; 4D 
    .byte $68   ; 4E 
    .byte $05   ; 4F 
    .byte $52   ; 50 
    .byte $DB   ; 51 
    .byte $9B   ; 52 
    .byte $6A   ; 53 
    .byte $DB   ; 54 
    .byte $53   ; 55 
    .byte $31   ; 56 
    .byte $53   ; 57 
    .byte $DB   ; 58 
    .byte $4B   ; 59 
    .byte $EE   ; 5A 
    .byte $0B   ; 5B 
    .byte $0B   ; 5C 
    .byte $EF   ; 5D 
    .byte $46   ; 5E 
    .byte $55   ; 5F 
    .byte $CB   ; 60 
    .byte $12   ; 61 
    .byte $52   ; 62 
    .byte $2A   ; 63 
    .byte $4C   ; 64 
    .byte $70   ; 65 
    .byte $30   ; 66 
    .byte $0E   ; 67 
    .byte $53   ; 68 
    .byte $CB   ; 69 
    .byte $0D   ; 6A 
    .byte $53   ; 6B 
    .byte $A8   ; 6C 
    .byte $68   ; 6D 
    .byte $28   ; 6E 
    .byte $95   ; 6F 
    .byte $DB   ; 70 
    .byte $00   ; 71 
    .byte $1B   ; 72 
    .byte $00   ; 73 
    .byte $6A   ; 74 
    .byte $C8   ; 75 
    .byte $00   ; 76 
    .byte $56   ; 77 
    .byte $64   ; 78 
    .byte $00   ; 79 
    .byte $64   ; 7A 
    .byte $93   ; 7B 
    .byte $00   ; 7C 
    .byte $00   ; 7D 
    .byte $68   ; 7E 
    .byte $6A   ; 7F 

    .byte $00 + $80 + con_obj_id_66 - $40   ; 00 
    .byte $00 + $00 + con_obj_id_16   ; 01 
    .byte $00 + $80 + con_obj_id_41 - $40   ; 02 
    .byte $00 + $00 + con_obj_id_29   ; 03 
    .byte $00 + $00 + con_obj_id_3F   ; 04 
    .byte $40 + $00 + con_obj_id_22   ; 05 
    .byte $40 + $00 + con_obj_id_1A   ; 06 
    .byte $00 + $00 + con_obj_id_3E   ; 07 
    .byte $00 + $00 + con_obj_id_3E   ; 08 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 09 
    .byte $00 + $80 + con_obj_id_4A - $40   ; 0A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 0B 
    .byte $00 + $00 + con_obj_id_29   ; 0C 
    .byte $00 + $00 + con_obj_id_29   ; 0D 
    .byte $00 + $00 + con_obj_id_25   ; 0E 
    .byte $00 + $00 + con_obj_id_3F   ; 0F 
    .byte $00 + $00 + con_obj_id_06   ; 10 
    .byte $00 + $00 + con_obj_id_26   ; 11 
    .byte $40 + $00 + con_obj_id_0A   ; 12 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 13 
    .byte $00 + $00 + con_obj_id_29   ; 14 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 15 
    .byte $00 + $00 + con_obj_id_18   ; 16 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 17 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 18 
    .byte $00 + $80 + con_obj_id_53 - $40   ; 19 
    .byte $00 + $00 + con_obj_id_18   ; 1A 
    .byte $00 + $80 + con_obj_id_43 - $40   ; 1B 
    .byte $00 + $00 + con_obj_id_06   ; 1C 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 1D 
    .byte $00 + $00 + con_obj_id_0D   ; 1E 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 1F 
    .byte $00 + $00 + con_obj_id_15   ; 20 
    .byte $00 + $00 + con_obj_id_12   ; 21 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 22 
    .byte $00 + $00 + con_obj_id_15   ; 23 
    .byte $00 + $00 + con_obj_id_24   ; 24 
    .byte $00 + $00 + con_obj_id_07   ; 25 
    .byte $00 + $00 + con_obj_id_14   ; 26 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 27 
    .byte $00 + $80 + con_obj_id_4D - $40   ; 28 
    .byte $00 + $80 + con_obj_id_54 - $40   ; 29 
    .byte $00 + $00 + con_obj_id_1D   ; 2A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 2B 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 2C 
    .byte $00 + $80 + con_obj_id_53 - $40   ; 2D 
    .byte $00 + $00 + con_obj_id_1D   ; 2E 
    .byte $00 + $00 + con_obj_id_null   ; 2F 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 30 
    .byte $00 + $00 + con_obj_id_17   ; 31 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 32 
    .byte $00 + $00 + con_obj_id_17   ; 33 
    .byte $00 + $00 + con_obj_id_1E   ; 34 
    .byte $00 + $00 + con_obj_id_04   ; 35 
    .byte $00 + $00 + con_obj_id_29   ; 36 
    .byte $00 + $00 + con_obj_id_17   ; 37 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 38 
    .byte $00 + $00 + con_obj_id_13   ; 39 
    .byte $40 + $80 + con_obj_id_62 - $40   ; 3A 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 3B 
    .byte $00 + $80 + con_obj_id_57 - $40   ; 3C 
    .byte $00 + $00 + con_obj_id_29   ; 3D 
    .byte $00 + $80 + con_obj_id_65 - $40   ; 3E 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 3F 
    .byte $00 + $00 + con_obj_id_15   ; 40 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 41 
    .byte $40 + $00 + con_obj_id_22   ; 42 
    .byte $00 + $00 + con_obj_id_1F   ; 43 
    .byte $00 + $00 + con_obj_id_02   ; 44 
    .byte $00 + $00 + con_obj_id_0D   ; 45 
    .byte $00 + $00 + con_obj_id_12   ; 46 
    .byte $00 + $00 + con_obj_id_15   ; 47 
    .byte $00 + $80 + con_obj_id_41 - $40   ; 48 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 49 
    .byte $00 + $00 + con_obj_id_0F   ; 4A 
    .byte $00 + $00 + con_obj_id_08   ; 4B 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 4C 
    .byte $00 + $00 + con_obj_id_25   ; 4D 
    .byte $00 + $00 + con_obj_id_02   ; 4E 
    .byte $00 + $00 + con_obj_id_24   ; 4F 
    .byte $00 + $00 + con_obj_id_11   ; 50 
    .byte $00 + $00 + con_obj_id_03   ; 51 
    .byte $00 + $00 + con_obj_id_1E   ; 52 
    .byte $00 + $00 + con_obj_id_02   ; 53 
    .byte $00 + $00 + con_obj_id_03   ; 54 
    .byte $00 + $00 + con_obj_id_13   ; 55 
    .byte $00 + $00 + con_obj_id_null   ; 56 
    .byte $00 + $00 + con_obj_id_17   ; 57 
    .byte $00 + $00 + con_obj_id_24   ; 58 
    .byte $00 + $00 + con_obj_id_1D   ; 59 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 5A 
    .byte $00 + $00 + con_obj_id_null   ; 5B 
    .byte $00 + $00 + con_obj_id_1F   ; 5C 
    .byte $00 + $80 + con_obj_id_5E - $40   ; 5D 
    .byte $00 + $00 + con_obj_id_1F   ; 5E 
    .byte $00 + $00 + con_obj_id_03   ; 5F 
    .byte $00 + $00 + con_obj_id_3F   ; 60 
    .byte $00 + $00 + con_obj_id_02   ; 61 
    .byte $00 + $00 + con_obj_id_0C   ; 62 
    .byte $00 + $00 + con_obj_id_1E   ; 63 
    .byte $40 + $00 + con_obj_id_1A   ; 64 
    .byte $00 + $00 + con_obj_id_02   ; 65 
    .byte $00 + $00 + con_obj_id_18   ; 66 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 67 
    .byte $00 + $00 + con_obj_id_1D   ; 68 
    .byte $00 + $00 + con_obj_id_1B   ; 69 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 6A 
    .byte $00 + $00 + con_obj_id_11   ; 6B 
    .byte $00 + $00 + con_obj_id_null   ; 6C 
    .byte $00 + $00 + con_obj_id_03   ; 6D 
    .byte $00 + $00 + con_obj_id_0D   ; 6E 
    .byte $00 + $00 + con_obj_id_1E   ; 6F 
    .byte $00 + $00 + con_obj_id_null   ; 70 
    .byte $00 + $00 + con_obj_id_21   ; 71 
    .byte $00 + $00 + con_obj_id_null   ; 72 
    .byte $00 + $00 + con_obj_id_21   ; 73 
    .byte $00 + $00 + con_obj_id_1D   ; 74 
    .byte $00 + $00 + con_obj_id_3F   ; 75 
    .byte $00 + $00 + con_obj_id_21   ; 76 
    .byte $00 + $00 + con_obj_id_1D   ; 77 
    .byte $00 + $00 + con_obj_id_1F   ; 78 
    .byte $00 + $00 + con_obj_id_21   ; 79 
    .byte $00 + $00 + con_obj_id_03   ; 7A 
    .byte $00 + $00 + con_obj_id_03   ; 7B 
    .byte $00 + $00 + con_obj_id_21   ; 7C 
    .byte $00 + $00 + con_obj_id_21   ; 7D 
    .byte $00 + $00 + con_obj_id_null   ; 7E 
    .byte $00 + $00 + con_obj_id_3F   ; 7F 

    .byte $03   ; 00 
    .byte $99   ; 01 
    .byte $83   ; 02 
    .byte $1B   ; 03 
    .byte $05   ; 04 
    .byte $03   ; 05 
    .byte $03   ; 06 
    .byte $03   ; 07 
    .byte $03   ; 08 
    .byte $03   ; 09 
    .byte $03   ; 0A 
    .byte $03   ; 0B 
    .byte $1B   ; 0C 
    .byte $1B   ; 0D 
    .byte $1A   ; 0E 
    .byte $0C   ; 0F 
    .byte $03   ; 10 
    .byte $03   ; 11 
    .byte $23   ; 12 
    .byte $1A   ; 13 
    .byte $1B   ; 14 
    .byte $03   ; 15 
    .byte $19   ; 16 
    .byte $03   ; 17 
    .byte $03   ; 18 
    .byte $17   ; 19 
    .byte $99   ; 1A 
    .byte $43   ; 1B 
    .byte $1A   ; 1C 
    .byte $43   ; 1D 
    .byte $40   ; 1E 
    .byte $03   ; 1F 
    .byte $03   ; 20 
    .byte $97   ; 21 
    .byte $03   ; 22 
    .byte $19   ; 23 
    .byte $1A   ; 24 
    .byte $63   ; 25 
    .byte $19   ; 26 
    .byte $99   ; 27 
    .byte $0F   ; 28 
    .byte $99   ; 29 
    .byte $19   ; 2A 
    .byte $03   ; 2B 
    .byte $43   ; 2C 
    .byte $99   ; 2D 
    .byte $03   ; 2E 
    .byte $0F   ; 2F 
    .byte $83   ; 30 
    .byte $03   ; 31 
    .byte $03   ; 32 
    .byte $19   ; 33 
    .byte $63   ; 34 
    .byte $1A   ; 35 
    .byte $1B   ; 36 
    .byte $96   ; 37 
    .byte $03   ; 38 
    .byte $83   ; 39 
    .byte $03   ; 3A 
    .byte $03   ; 3B 
    .byte $80   ; 3C 
    .byte $1B   ; 3D 
    .byte $19   ; 3E 
    .byte $00   ; 3F 
    .byte $99   ; 40 
    .byte $03   ; 41 
    .byte $03   ; 42 
    .byte $17   ; 43 
    .byte $1D   ; 44 
    .byte $39   ; 45 
    .byte $97   ; 46 
    .byte $19   ; 47 
    .byte $03   ; 48 
    .byte $19   ; 49 
    .byte $00   ; 4A 
    .byte $19   ; 4B 
    .byte $77   ; 4C 
    .byte $1A   ; 4D 
    .byte $19   ; 4E 
    .byte $1E   ; 4F 
    .byte $83   ; 50 
    .byte $19   ; 51 
    .byte $03   ; 52 
    .byte $19   ; 53 
    .byte $16   ; 54 
    .byte $19   ; 55 
    .byte $00   ; 56 
    .byte $8F   ; 57 
    .byte $19   ; 58 
    .byte $03   ; 59 
    .byte $16   ; 5A 
    .byte $00   ; 5B 
    .byte $03   ; 5C 
    .byte $6F   ; 5D 
    .byte $03   ; 5E 
    .byte $17   ; 5F 
    .byte $0D   ; 60 
    .byte $03   ; 61 
    .byte $96   ; 62 
    .byte $03   ; 63 
    .byte $03   ; 64 
    .byte $00   ; 65 
    .byte $99   ; 66 
    .byte $03   ; 67 
    .byte $16   ; 68 
    .byte $00   ; 69 
    .byte $03   ; 6A 
    .byte $19   ; 6B 
    .byte $19   ; 6C 
    .byte $03   ; 6D 
    .byte $03   ; 6E 
    .byte $16   ; 6F 
    .byte $19   ; 70 
    .byte $03   ; 71 
    .byte $19   ; 72 
    .byte $03   ; 73 
    .byte $19   ; 74 
    .byte $10   ; 75 
    .byte $03   ; 76 
    .byte $19   ; 77 
    .byte $03   ; 78 
    .byte $03   ; 79 
    .byte $99   ; 7A 
    .byte $19   ; 7B 
    .byte $03   ; 7C 
    .byte $03   ; 7D 
    .byte $19   ; 7E 
    .byte $0A   ; 7F 

    .byte $00   ; 00 
    .byte $20   ; 01 
    .byte $00   ; 02 
    .byte $30   ; 03 
    .byte $30   ; 04 
    .byte $05   ; 05 
    .byte $00   ; 06 
    .byte $00   ; 07 
    .byte $00   ; 08 
    .byte $05   ; 09 
    .byte $01   ; 0A 
    .byte $00   ; 0B 
    .byte $00   ; 0C 
    .byte $00   ; 0D 
    .byte $07   ; 0E 
    .byte $00   ; 0F 
    .byte $01   ; 10 
    .byte $00   ; 11 
    .byte $04   ; 12 
    .byte $07   ; 13 
    .byte $30   ; 14 
    .byte $00   ; 15 
    .byte $20   ; 16 
    .byte $00   ; 17 
    .byte $01   ; 18 
    .byte $07   ; 19 
    .byte $00   ; 1A 
    .byte $01   ; 1B 
    .byte $07   ; 1C 
    .byte $00   ; 1D 
    .byte $17   ; 1E 
    .byte $00   ; 1F 
    .byte $00   ; 20 
    .byte $00   ; 21 
    .byte $20   ; 22 
    .byte $37   ; 23 
    .byte $07   ; 24 
    .byte $00   ; 25 
    .byte $27   ; 26 
    .byte $20   ; 27 
    .byte $17   ; 28 
    .byte $00   ; 29 
    .byte $01   ; 2A 
    .byte $00   ; 2B 
    .byte $00   ; 2C 
    .byte $07   ; 2D 
    .byte $01   ; 2E 
    .byte $07   ; 2F 
    .byte $10   ; 30 
    .byte $01   ; 31 
    .byte $05   ; 32 
    .byte $20   ; 33 
    .byte $01   ; 34 
    .byte $07   ; 35 
    .byte $20   ; 36 
    .byte $27   ; 37 
    .byte $04   ; 38 
    .byte $01   ; 39 
    .byte $05   ; 3A 
    .byte $04   ; 3B 
    .byte $07   ; 3C 
    .byte $00   ; 3D 
    .byte $07   ; 3E 
    .byte $00   ; 3F 
    .byte $20   ; 40 
    .byte $00   ; 41 
    .byte $04   ; 42 
    .byte $00   ; 43 
    .byte $37   ; 44 
    .byte $10   ; 45 
    .byte $20   ; 46 
    .byte $27   ; 47 
    .byte $00   ; 48 
    .byte $00   ; 49 
    .byte $07   ; 4A 
    .byte $07   ; 4B 
    .byte $00   ; 4C 
    .byte $07   ; 4D 
    .byte $07   ; 4E 
    .byte $07   ; 4F 
    .byte $00   ; 50 
    .byte $10   ; 51 
    .byte $01   ; 52 
    .byte $37   ; 53 
    .byte $00   ; 54 
    .byte $27   ; 55 
    .byte $07   ; 56 
    .byte $27   ; 57 
    .byte $07   ; 58 
    .byte $01   ; 59 
    .byte $00   ; 5A 
    .byte $07   ; 5B 
    .byte $11   ; 5C 
    .byte $27   ; 5D 
    .byte $02   ; 5E 
    .byte $00   ; 5F 
    .byte $30   ; 60 
    .byte $00   ; 61 
    .byte $20   ; 62 
    .byte $00   ; 63 
    .byte $00   ; 64 
    .byte $10   ; 65 
    .byte $11   ; 66 
    .byte $00   ; 67 
    .byte $07   ; 68 
    .byte $07   ; 69 
    .byte $00   ; 6A 
    .byte $07   ; 6B 
    .byte $00   ; 6C 
    .byte $01   ; 6D 
    .byte $00   ; 6E 
    .byte $10   ; 6F 
    .byte $17   ; 70 
    .byte $00   ; 71 
    .byte $17   ; 72 
    .byte $00   ; 73 
    .byte $00   ; 74 
    .byte $00   ; 75 
    .byte $00   ; 76 
    .byte $27   ; 77 
    .byte $02   ; 78 
    .byte $00   ; 79 
    .byte $07   ; 7A 
    .byte $00   ; 7B 
    .byte $00   ; 7C 
    .byte $00   ; 7D 
    .byte $07   ; 7E 
    .byte $20   ; 7F 



_off009_8A00_07:
_off009_8A00_08:
_off009_8A00_09:
    .byte $07   ; 00 
    .byte $3E   ; 01 
    .byte $22   ; 02 
    .byte $26   ; 03 
    .byte $26   ; 04 
    .byte $26   ; 05 
    .byte $36   ; 06 
    .byte $32   ; 07 
    .byte $32   ; 08 
    .byte $3E   ; 09 
    .byte $26   ; 0A 
    .byte $36   ; 0B 
    .byte $22   ; 0C 
    .byte $26   ; 0D 
    .byte $3E   ; 0E 
    .byte $1F   ; 0F 
    .byte $32   ; 10 
    .byte $1E   ; 11 
    .byte $F6   ; 12 
    .byte $36   ; 13 
    .byte $22   ; 14 
    .byte $32   ; 15 
    .byte $A2   ; 16 
    .byte $92   ; 17 
    .byte $9E   ; 18 
    .byte $E6   ; 19 
    .byte $26   ; 1A 
    .byte $A6   ; 1B 
    .byte $E6   ; 1C 
    .byte $22   ; 1D 
    .byte $F6   ; 1E 
    .byte $26   ; 1F 
    .byte $86   ; 20 
    .byte $1E   ; 21 
    .byte $A6   ; 22 
    .byte $B6   ; 23 
    .byte $02   ; 24 
    .byte $92   ; 25 
    .byte $16   ; 26 
    .byte $92   ; 27 
    .byte $16   ; 28 
    .byte $26   ; 29 
    .byte $26   ; 2A 
    .byte $26   ; 2B 
    .byte $22   ; 2C 
    .byte $06   ; 2D 
    .byte $B2   ; 2E 
    .byte $4C   ; 2F 
    .byte $36   ; 30 
    .byte $1E   ; 31 
    .byte $3E   ; 32 
    .byte $A6   ; 33 
    .byte $06   ; 34 
    .byte $86   ; 35 
    .byte $A6   ; 36 
    .byte $82   ; 37 
    .byte $A6   ; 38 
    .byte $22   ; 39 
    .byte $26   ; 3A 
    .byte $22   ; 3B 
    .byte $F2   ; 3C 
    .byte $22   ; 3D 
    .byte $96   ; 3E 
    .byte $26   ; 3F 
    .byte $B6   ; 40 
    .byte $1E   ; 41 
    .byte $FE   ; 42 
    .byte $32   ; 43 
    .byte $22   ; 44 
    .byte $32   ; 45 
    .byte $22   ; 46 
    .byte $02   ; 47 
    .byte $36   ; 48 
    .byte $E2   ; 49 
    .byte $1A   ; 4A 
    .byte $06   ; 4B 
    .byte $86   ; 4C 
    .byte $E2   ; 4D 
    .byte $A2   ; 4E 
    .byte $10   ; 4F 
    .byte $A6   ; 50 
    .byte $02   ; 51 
    .byte $E6   ; 52 
    .byte $96   ; 53 
    .byte $02   ; 54 
    .byte $92   ; 55 
    .byte $02   ; 56 
    .byte $06   ; 57 
    .byte $A2   ; 58 
    .byte $12   ; 59 
    .byte $32   ; 5A 
    .byte $22   ; 5B 
    .byte $26   ; 5C 
    .byte $06   ; 5D 
    .byte $F2   ; 5E 
    .byte $26   ; 5F 
    .byte $14   ; 60 
    .byte $02   ; 61 
    .byte $26   ; 62 
    .byte $B6   ; 63 
    .byte $06   ; 64 
    .byte $86   ; 65 
    .byte $E2   ; 66 
    .byte $30   ; 67 
    .byte $02   ; 68 
    .byte $82   ; 69 
    .byte $82   ; 6A 
    .byte $E6   ; 6B 
    .byte $26   ; 6C 
    .byte $26   ; 6D 
    .byte $82   ; 6E 
    .byte $7C   ; 6F 
    .byte $63   ; 70 
    .byte $06   ; 71 
    .byte $71   ; 72 
    .byte $A6   ; 73 
    .byte $26   ; 74 
    .byte $20   ; 75 
    .byte $02   ; 76 
    .byte $52   ; 77 
    .byte $06   ; 78 
    .byte $02   ; 79 
    .byte $06   ; 7A 
    .byte $29   ; 7B 
    .byte $26   ; 7C 
    .byte $26   ; 7D 
    .byte $02   ; 7E 
    .byte $26   ; 7F 

    .byte $07   ; 00 
    .byte $37   ; 01 
    .byte $A4   ; 02 
    .byte $32   ; 03 
    .byte $86   ; 04 
    .byte $32   ; 05 
    .byte $84   ; 06 
    .byte $26   ; 07 
    .byte $32   ; 08 
    .byte $9E   ; 09 
    .byte $E6   ; 0A 
    .byte $25   ; 0B 
    .byte $33   ; 0C 
    .byte $86   ; 0D 
    .byte $26   ; 0E 
    .byte $1F   ; 0F 
    .byte $26   ; 10 
    .byte $26   ; 11 
    .byte $36   ; 12 
    .byte $A7   ; 13 
    .byte $36   ; 14 
    .byte $A3   ; 15 
    .byte $06   ; 16 
    .byte $26   ; 17 
    .byte $37   ; 18 
    .byte $B2   ; 19 
    .byte $92   ; 1A 
    .byte $96   ; 1B 
    .byte $A6   ; 1C 
    .byte $32   ; 1D 
    .byte $9F   ; 1E 
    .byte $06   ; 1F 
    .byte $26   ; 20 
    .byte $32   ; 21 
    .byte $96   ; 22 
    .byte $B3   ; 23 
    .byte $87   ; 24 
    .byte $36   ; 25 
    .byte $B2   ; 26 
    .byte $86   ; 27 
    .byte $24   ; 28 
    .byte $32   ; 29 
    .byte $9E   ; 2A 
    .byte $06   ; 2B 
    .byte $26   ; 2C 
    .byte $32   ; 2D 
    .byte $86   ; 2E 
    .byte $3F   ; 2F 
    .byte $32   ; 30 
    .byte $86   ; 31 
    .byte $26   ; 32 
    .byte $33   ; 33 
    .byte $87   ; 34 
    .byte $26   ; 35 
    .byte $32   ; 36 
    .byte $86   ; 37 
    .byte $3E   ; 38 
    .byte $13   ; 39 
    .byte $86   ; 3A 
    .byte $30   ; 3B 
    .byte $86   ; 3C 
    .byte $24   ; 3D 
    .byte $3F   ; 3E 
    .byte $E6   ; 3F 
    .byte $27   ; 40 
    .byte $27   ; 41 
    .byte $27   ; 42 
    .byte $24   ; 43 
    .byte $22   ; 44 
    .byte $02   ; 45 
    .byte $06   ; 46 
    .byte $26   ; 47 
    .byte $24   ; 48 
    .byte $27   ; 49 
    .byte $1A   ; 4A 
    .byte $3F   ; 4B 
    .byte $E6   ; 4C 
    .byte $36   ; 4D 
    .byte $A6   ; 4E 
    .byte $10   ; 4F 
    .byte $3F   ; 50 
    .byte $E6   ; 51 
    .byte $26   ; 52 
    .byte $27   ; 53 
    .byte $32   ; 54 
    .byte $92   ; 55 
    .byte $87   ; 56 
    .byte $27   ; 57 
    .byte $22   ; 58 
    .byte $1E   ; 59 
    .byte $07   ; 5A 
    .byte $24   ; 5B 
    .byte $22   ; 5C 
    .byte $03   ; 5D 
    .byte $F7   ; 5E 
    .byte $A7   ; 5F 
    .byte $55   ; 60 
    .byte $22   ; 61 
    .byte $16   ; 62 
    .byte $A6   ; 63 
    .byte $22   ; 64 
    .byte $03   ; 65 
    .byte $E4   ; 66 
    .byte $04   ; 67 
    .byte $32   ; 68 
    .byte $83   ; 69 
    .byte $03   ; 6A 
    .byte $02   ; 6B 
    .byte $02   ; 6C 
    .byte $07   ; 6D 
    .byte $26   ; 6E 
    .byte $7C   ; 6F 
    .byte $05   ; 70 
    .byte $26   ; 71 
    .byte $74   ; 72 
    .byte $36   ; 73 
    .byte $A6   ; 74 
    .byte $61   ; 75 
    .byte $26   ; 76 
    .byte $03   ; 77 
    .byte $26   ; 78 
    .byte $23   ; 79 
    .byte $06   ; 7A 
    .byte $0D   ; 7B 
    .byte $22   ; 7C 
    .byte $E3   ; 7D 
    .byte $03   ; 7E 
    .byte $07   ; 7F 

    .byte $69   ; 00 
    .byte $EF   ; 01 
    .byte $0E   ; 02 
    .byte $B3   ; 03 
    .byte $F7   ; 04 
    .byte $7B   ; 05 
    .byte $0D   ; 06 
    .byte $F1   ; 07 
    .byte $35   ; 08 
    .byte $BA   ; 09 
    .byte $45   ; 0A 
    .byte $01   ; 0B 
    .byte $31   ; 0C 
    .byte $F9   ; 0D 
    .byte $4B   ; 0E 
    .byte $69   ; 0F 
    .byte $F1   ; 10 
    .byte $3B   ; 11 
    .byte $3A   ; 12 
    .byte $B3   ; 13 
    .byte $57   ; 14 
    .byte $23   ; 15 
    .byte $08   ; 16 
    .byte $FC   ; 17 
    .byte $F5   ; 18 
    .byte $85   ; 19 
    .byte $BA   ; 1A 
    .byte $85   ; 1B 
    .byte $38   ; 1C 
    .byte $56   ; 1D 
    .byte $33   ; 1E 
    .byte $B8   ; 1F 
    .byte $7B   ; 20 
    .byte $07   ; 21 
    .byte $B3   ; 22 
    .byte $D5   ; 23 
    .byte $52   ; 24 
    .byte $B3   ; 25 
    .byte $D5   ; 26 
    .byte $08   ; 27 
    .byte $36   ; 28 
    .byte $BA   ; 29 
    .byte $3D   ; 2A 
    .byte $00   ; 2B 
    .byte $00   ; 2C 
    .byte $35   ; 2D 
    .byte $3C   ; 2E 
    .byte $77   ; 2F 
    .byte $F7   ; 30 
    .byte $FC   ; 31 
    .byte $37   ; 32 
    .byte $D5   ; 33 
    .byte $DB   ; 34 
    .byte $7B   ; 35 
    .byte $EF   ; 36 
    .byte $92   ; 37 
    .byte $BA   ; 38 
    .byte $38   ; 39 
    .byte $01   ; 3A 
    .byte $10   ; 3B 
    .byte $05   ; 3C 
    .byte $0F   ; 3D 
    .byte $8C   ; 3E 
    .byte $F4   ; 3F 
    .byte $7B   ; 40 
    .byte $F6   ; 41 
    .byte $3E   ; 42 
    .byte $0C   ; 43 
    .byte $A4   ; 44 
    .byte $FC   ; 45 
    .byte $A3   ; 46 
    .byte $F1   ; 47 
    .byte $0F   ; 48 
    .byte $F5   ; 49 
    .byte $69   ; 4A 
    .byte $8B   ; 4B 
    .byte $D6   ; 4C 
    .byte $33   ; 4D 
    .byte $F4   ; 4E 
    .byte $69   ; 4F 
    .byte $53   ; 50 
    .byte $97   ; 51 
    .byte $07   ; 52 
    .byte $FC   ; 53 
    .byte $7B   ; 54 
    .byte $3A   ; 55 
    .byte $B3   ; 56 
    .byte $7B   ; 57 
    .byte $31   ; 58 
    .byte $BA   ; 59 
    .byte $EA   ; 5A 
    .byte $10   ; 5B 
    .byte $0B   ; 5C 
    .byte $B0   ; 5D 
    .byte $4C   ; 5E 
    .byte $D6   ; 5F 
    .byte $69   ; 60 
    .byte $07   ; 61 
    .byte $DB   ; 62 
    .byte $53   ; 63 
    .byte $FC   ; 64 
    .byte $F1   ; 65 
    .byte $0B   ; 66 
    .byte $C6   ; 67 
    .byte $EE   ; 68 
    .byte $45   ; 69 
    .byte $DB   ; 6A 
    .byte $85   ; 6B 
    .byte $39   ; 6C 
    .byte $EA   ; 6D 
    .byte $3C   ; 6E 
    .byte $69   ; 6F 
    .byte $A9   ; 70 
    .byte $00   ; 71 
    .byte $69   ; 72 
    .byte $F1   ; 73 
    .byte $3B   ; 74 
    .byte $69   ; 75 
    .byte $00   ; 76 
    .byte $69   ; 77 
    .byte $68   ; 78 
    .byte $00   ; 79 
    .byte $01   ; 7A 
    .byte $69   ; 7B 
    .byte $F4   ; 7C 
    .byte $3C   ; 7D 
    .byte $00   ; 7E 
    .byte $EF   ; 7F 

    .byte $00 + $00 + con_obj_id_3F   ; 00 
    .byte $00 + $80 + con_obj_id_53 - $40   ; 01 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 02 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 03 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 04 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 05 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 06 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 07 
    .byte $00 + $00 + con_obj_id_26   ; 08 
    .byte $00 + $80 + con_obj_id_4A - $40   ; 09 
    .byte $00 + $00 + con_obj_id_24   ; 0A 
    .byte $00 + $80 + con_obj_id_65 - $40   ; 0B 
    .byte $00 + $00 + con_obj_id_23   ; 0C 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 0D 
    .byte $00 + $00 + con_obj_id_null   ; 0E 
    .byte $00 + $00 + con_obj_id_3F   ; 0F 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 10 
    .byte $00 + $00 + con_obj_id_25   ; 11 
    .byte $00 + $00 + con_obj_id_26   ; 12 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 13 
    .byte $00 + $00 + con_obj_id_1C   ; 14 
    .byte $00 + $00 + con_obj_id_14   ; 15 
    .byte $00 + $80 + con_obj_id_4A - $40   ; 16 
    .byte $00 + $80 + con_obj_id_5F - $40   ; 17 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 18 
    .byte $00 + $00 + con_obj_id_1F   ; 19 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 1A 
    .byte $00 + $00 + con_obj_id_null   ; 1B 
    .byte $00 + $00 + con_obj_id_24   ; 1C 
    .byte $00 + $00 + con_obj_id_11   ; 1D 
    .byte $00 + $00 + con_obj_id_24   ; 1E 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 1F 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 20 
    .byte $00 + $80 + con_obj_id_65 - $40   ; 21 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 22 
    .byte $00 + $00 + con_obj_id_12   ; 23 
    .byte $00 + $00 + con_obj_id_17   ; 24 
    .byte $00 + $80 + con_obj_id_4E - $40   ; 25 
    .byte $00 + $00 + con_obj_id_03   ; 26 
    .byte $00 + $80 + con_obj_id_4A - $40   ; 27 
    .byte $00 + $00 + con_obj_id_26   ; 28 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 29 
    .byte $00 + $00 + con_obj_id_04   ; 2A 
    .byte $00 + $00 + con_obj_id_29   ; 2B 
    .byte $00 + $00 + con_obj_id_29   ; 2C 
    .byte $00 + $00 + con_obj_id_26   ; 2D 
    .byte $00 + $00 + con_obj_id_null   ; 2E 
    .byte $00 + $00 + con_obj_id_3E   ; 2F 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 30 
    .byte $00 + $80 + con_obj_id_65 - $40   ; 31 
    .byte $00 + $00 + con_obj_id_27   ; 32 
    .byte $00 + $00 + con_obj_id_19   ; 33 
    .byte $00 + $00 + con_obj_id_14   ; 34 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 35 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 36 
    .byte $40 + $00 + con_obj_id_23   ; 37 
    .byte $00 + $80 + con_obj_id_4D - $40   ; 38 
    .byte $00 + $00 + con_obj_id_24   ; 39 
    .byte $00 + $80 + con_obj_id_65 - $40   ; 3A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 3B 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 3C 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 3D 
    .byte $00 + $00 + con_obj_id_23   ; 3E 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 3F 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 40 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 41 
    .byte $00 + $00 + con_obj_id_28   ; 42 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 43 
    .byte $00 + $00 + con_obj_id_null   ; 44 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 45 
    .byte $00 + $00 + con_obj_id_25   ; 46 
    .byte $00 + $80 + con_obj_id_5E - $40   ; 47 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 48 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 49 
    .byte $00 + $00 + con_obj_id_3F   ; 4A 
    .byte $00 + $00 + con_obj_id_23   ; 4B 
    .byte $00 + $00 + con_obj_id_1C   ; 4C 
    .byte $00 + $00 + con_obj_id_25   ; 4D 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 4E 
    .byte $00 + $00 + con_obj_id_3F   ; 4F 
    .byte $00 + $00 + con_obj_id_14   ; 50 
    .byte $00 + $00 + con_obj_id_11   ; 51 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 52 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 53 
    .byte $00 + $80 + con_obj_id_4C - $40   ; 54 
    .byte $40 + $00 + con_obj_id_1A   ; 55 
    .byte $00 + $80 + con_obj_id_59 - $40   ; 56 
    .byte $00 + $80 + con_obj_id_54 - $40   ; 57 
    .byte $00 + $00 + con_obj_id_null   ; 58 
    .byte $00 + $80 + con_obj_id_42 - $40   ; 59 
    .byte $00 + $00 + con_obj_id_19   ; 5A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 5B 
    .byte $00 + $00 + con_obj_id_24   ; 5C 
    .byte $00 + $80 + con_obj_id_51 - $40   ; 5D 
    .byte $00 + $00 + con_obj_id_24   ; 5E 
    .byte $00 + $00 + con_obj_id_18   ; 5F 
    .byte $00 + $00 + con_obj_id_3E   ; 60 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 61 
    .byte $00 + $00 + con_obj_id_26   ; 62 
    .byte $00 + $00 + con_obj_id_1B   ; 63 
    .byte $00 + $80 + con_obj_id_5F - $40   ; 64 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 65 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 66 
    .byte $00 + $00 + con_obj_id_3E   ; 67 
    .byte $00 + $80 + con_obj_id_40 - $40   ; 68 
    .byte $00 + $00 + con_obj_id_23   ; 69 
    .byte $00 + $00 + con_obj_id_09   ; 6A 
    .byte $00 + $00 + con_obj_id_1E   ; 6B 
    .byte $00 + $00 + con_obj_id_24   ; 6C 
    .byte $00 + $00 + con_obj_id_13   ; 6D 
    .byte $00 + $00 + con_obj_id_25   ; 6E 
    .byte $00 + $00 + con_obj_id_3F   ; 6F 
    .byte $00 + $00 + con_obj_id_3E   ; 70 
    .byte $00 + $00 + con_obj_id_1B   ; 71 
    .byte $00 + $00 + con_obj_id_3E   ; 72 
    .byte $00 + $80 + con_obj_id_5F - $40   ; 73 
    .byte $40 + $00 + con_obj_id_1A   ; 74 
    .byte $00 + $00 + con_obj_id_3E   ; 75 
    .byte $00 + $00 + con_obj_id_21   ; 76 
    .byte $00 + $00 + con_obj_id_3E   ; 77 
    .byte $00 + $00 + con_obj_id_23   ; 78 
    .byte $00 + $00 + con_obj_id_21   ; 79 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 7A 
    .byte $00 + $00 + con_obj_id_3E   ; 7B 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 7C 
    .byte $00 + $00 + con_obj_id_23   ; 7D 
    .byte $00 + $00 + con_obj_id_21   ; 7E 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 7F 

    .byte $13   ; 00 
    .byte $83   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 
    .byte $03   ; 04 
    .byte $03   ; 05 
    .byte $03   ; 06 
    .byte $03   ; 07 
    .byte $03   ; 08 
    .byte $0F   ; 09 
    .byte $19   ; 0A 
    .byte $00   ; 0B 
    .byte $00   ; 0C 
    .byte $03   ; 0D 
    .byte $00   ; 0E 
    .byte $0B   ; 0F 
    .byte $03   ; 10 
    .byte $00   ; 11 
    .byte $0F   ; 12 
    .byte $83   ; 13 
    .byte $03   ; 14 
    .byte $8F   ; 15 
    .byte $00   ; 16 
    .byte $03   ; 17 
    .byte $97   ; 18 
    .byte $03   ; 19 
    .byte $23   ; 1A 
    .byte $00   ; 1B 
    .byte $03   ; 1C 
    .byte $00   ; 1D 
    .byte $03   ; 1E 
    .byte $03   ; 1F 
    .byte $03   ; 20 
    .byte $03   ; 21 
    .byte $03   ; 22 
    .byte $00   ; 23 
    .byte $83   ; 24 
    .byte $00   ; 25 
    .byte $0F   ; 26 
    .byte $17   ; 27 
    .byte $03   ; 28 
    .byte $23   ; 29 
    .byte $1A   ; 2A 
    .byte $1B   ; 2B 
    .byte $1B   ; 2C 
    .byte $03   ; 2D 
    .byte $17   ; 2E 
    .byte $03   ; 2F 
    .byte $03   ; 30 
    .byte $03   ; 31 
    .byte $03   ; 32 
    .byte $83   ; 33 
    .byte $0F   ; 34 
    .byte $16   ; 35 
    .byte $03   ; 36 
    .byte $00   ; 37 
    .byte $0F   ; 38 
    .byte $03   ; 39 
    .byte $39   ; 3A 
    .byte $23   ; 3B 
    .byte $1A   ; 3C 
    .byte $23   ; 3D 
    .byte $03   ; 3E 
    .byte $00   ; 3F 
    .byte $0F   ; 40 
    .byte $A3   ; 41 
    .byte $8E   ; 42 
    .byte $23   ; 43 
    .byte $0F   ; 44 
    .byte $03   ; 45 
    .byte $03   ; 46 
    .byte $19   ; 47 
    .byte $03   ; 48 
    .byte $03   ; 49 
    .byte $07   ; 4A 
    .byte $99   ; 4B 
    .byte $39   ; 4C 
    .byte $03   ; 4D 
    .byte $0F   ; 4E 
    .byte $09   ; 4F 
    .byte $83   ; 50 
    .byte $03   ; 51 
    .byte $23   ; 52 
    .byte $03   ; 53 
    .byte $03   ; 54 
    .byte $03   ; 55 
    .byte $19   ; 56 
    .byte $99   ; 57 
    .byte $0F   ; 58 
    .byte $03   ; 59 
    .byte $96   ; 5A 
    .byte $03   ; 5B 
    .byte $19   ; 5C 
    .byte $99   ; 5D 
    .byte $19   ; 5E 
    .byte $96   ; 5F 
    .byte $03   ; 60 
    .byte $19   ; 61 
    .byte $0F   ; 62 
    .byte $03   ; 63 
    .byte $03   ; 64 
    .byte $83   ; 65 
    .byte $03   ; 66 
    .byte $03   ; 67 
    .byte $00   ; 68 
    .byte $00   ; 69 
    .byte $83   ; 6A 
    .byte $03   ; 6B 
    .byte $00   ; 6C 
    .byte $19   ; 6D 
    .byte $0F   ; 6E 
    .byte $11   ; 6F 
    .byte $03   ; 70 
    .byte $03   ; 71 
    .byte $03   ; 72 
    .byte $03   ; 73 
    .byte $03   ; 74 
    .byte $03   ; 75 
    .byte $03   ; 76 
    .byte $03   ; 77 
    .byte $19   ; 78 
    .byte $03   ; 79 
    .byte $00   ; 7A 
    .byte $03   ; 7B 
    .byte $03   ; 7C 
    .byte $0F   ; 7D 
    .byte $03   ; 7E 
    .byte $99   ; 7F 

    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $00   ; 02 
    .byte $00   ; 03 
    .byte $00   ; 04 
    .byte $05   ; 05 
    .byte $00   ; 06 
    .byte $00   ; 07 
    .byte $00   ; 08 
    .byte $07   ; 09 
    .byte $01   ; 0A 
    .byte $07   ; 0B 
    .byte $07   ; 0C 
    .byte $05   ; 0D 
    .byte $07   ; 0E 
    .byte $00   ; 0F 
    .byte $05   ; 10 
    .byte $07   ; 11 
    .byte $07   ; 12 
    .byte $00   ; 13 
    .byte $00   ; 14 
    .byte $07   ; 15 
    .byte $07   ; 16 
    .byte $10   ; 17 
    .byte $01   ; 18 
    .byte $01   ; 19 
    .byte $00   ; 1A 
    .byte $07   ; 1B 
    .byte $01   ; 1C 
    .byte $07   ; 1D 
    .byte $01   ; 1E 
    .byte $01   ; 1F 
    .byte $00   ; 20 
    .byte $20   ; 21 
    .byte $00   ; 22 
    .byte $10   ; 23 
    .byte $00   ; 24 
    .byte $07   ; 25 
    .byte $07   ; 26 
    .byte $07   ; 27 
    .byte $00   ; 28 
    .byte $00   ; 29 
    .byte $07   ; 2A 
    .byte $00   ; 2B 
    .byte $00   ; 2C 
    .byte $00   ; 2D 
    .byte $07   ; 2E 
    .byte $00   ; 2F 
    .byte $05   ; 30 
    .byte $00   ; 31 
    .byte $01   ; 32 
    .byte $00   ; 33 
    .byte $07   ; 34 
    .byte $07   ; 35 
    .byte $00   ; 36 
    .byte $07   ; 37 
    .byte $17   ; 38 
    .byte $00   ; 39 
    .byte $07   ; 3A 
    .byte $00   ; 3B 
    .byte $37   ; 3C 
    .byte $00   ; 3D 
    .byte $01   ; 3E 
    .byte $07   ; 3F 
    .byte $07   ; 40 
    .byte $00   ; 41 
    .byte $03   ; 42 
    .byte $00   ; 43 
    .byte $07   ; 44 
    .byte $00   ; 45 
    .byte $00   ; 46 
    .byte $10   ; 47 
    .byte $10   ; 48 
    .byte $01   ; 49 
    .byte $00   ; 4A 
    .byte $01   ; 4B 
    .byte $11   ; 4C 
    .byte $01   ; 4D 
    .byte $07   ; 4E 
    .byte $00   ; 4F 
    .byte $01   ; 50 
    .byte $01   ; 51 
    .byte $01   ; 52 
    .byte $00   ; 53 
    .byte $00   ; 54 
    .byte $00   ; 55 
    .byte $07   ; 56 
    .byte $07   ; 57 
    .byte $07   ; 58 
    .byte $01   ; 59 
    .byte $00   ; 5A 
    .byte $00   ; 5B 
    .byte $07   ; 5C 
    .byte $00   ; 5D 
    .byte $07   ; 5E 
    .byte $00   ; 5F 
    .byte $00   ; 60 
    .byte $10   ; 61 
    .byte $07   ; 62 
    .byte $00   ; 63 
    .byte $00   ; 64 
    .byte $00   ; 65 
    .byte $00   ; 66 
    .byte $00   ; 67 
    .byte $07   ; 68 
    .byte $07   ; 69 
    .byte $02   ; 6A 
    .byte $01   ; 6B 
    .byte $07   ; 6C 
    .byte $00   ; 6D 
    .byte $07   ; 6E 
    .byte $00   ; 6F 
    .byte $00   ; 70 
    .byte $00   ; 71 
    .byte $00   ; 72 
    .byte $00   ; 73 
    .byte $00   ; 74 
    .byte $00   ; 75 
    .byte $00   ; 76 
    .byte $00   ; 77 
    .byte $00   ; 78 
    .byte $00   ; 79 
    .byte $07   ; 7A 
    .byte $00   ; 7B 
    .byte $10   ; 7C 
    .byte $07   ; 7D 
    .byte $00   ; 7E 
    .byte $00   ; 7F 



_off011_8D00_01:
_off011_8D00_02:
_off011_8D00_03:
_off011_8D00_04:
_off011_8D00_05:
_off011_8D00_06:
    .byte $22   ; 00 
    .byte $26   ; 01 
    .byte $22   ; 02 
    .byte $04   ; 03 
    .byte $32   ; 04 
    .byte $26   ; 05 
    .byte $26   ; 06 
    .byte $32   ; 07 
    .byte $26   ; 08 
    .byte $3B   ; 09 
    .byte $36   ; 0A 
    .byte $3A   ; 0B 
    .byte $2A   ; 0C 
    .byte $32   ; 0D 
    .byte $26   ; 0E 
    .byte $0E   ; 0F 
    .byte $E6   ; 10 
    .byte $26   ; 11 
    .byte $06   ; 12 
    .byte $22   ; 13 
    .byte $82   ; 14 
    .byte $36   ; 15 
    .byte $22   ; 16 
    .byte $86   ; 17 
    .byte $26   ; 18 
    .byte $22   ; 19 
    .byte $A2   ; 1A 
    .byte $22   ; 1B 
    .byte $52   ; 1C 
    .byte $82   ; 1D 
    .byte $22   ; 1E 
    .byte $22   ; 1F 
    .byte $22   ; 20 
    .byte $01   ; 21 
    .byte $22   ; 22 
    .byte $02   ; 23 
    .byte $02   ; 24 
    .byte $A2   ; 25 
    .byte $FE   ; 26 
    .byte $3E   ; 27 
    .byte $18   ; 28 
    .byte $E2   ; 29 
    .byte $0A   ; 2A 
    .byte $F6   ; 2B 
    .byte $82   ; 2C 
    .byte $02   ; 2D 
    .byte $E6   ; 2E 
    .byte $FE   ; 2F 
    .byte $E6   ; 30 
    .byte $22   ; 31 
    .byte $E6   ; 32 
    .byte $0A   ; 33 
    .byte $12   ; 34 
    .byte $02   ; 35 
    .byte $06   ; 36 
    .byte $02   ; 37 
    .byte $3E   ; 38 
    .byte $1E   ; 39 
    .byte $46   ; 3A 
    .byte $A6   ; 3B 
    .byte $1E   ; 3C 
    .byte $06   ; 3D 
    .byte $26   ; 3E 
    .byte $EA   ; 3F 
    .byte $3E   ; 40 
    .byte $06   ; 41 
    .byte $36   ; 42 
    .byte $46   ; 43 
    .byte $92   ; 44 
    .byte $E2   ; 45 
    .byte $51   ; 46 
    .byte $02   ; 47 
    .byte $E6   ; 48 
    .byte $02   ; 49 
    .byte $32   ; 4A 
    .byte $22   ; 4B 
    .byte $1E   ; 4C 
    .byte $26   ; 4D 
    .byte $26   ; 4E 
    .byte $42   ; 4F 
    .byte $1E   ; 50 
    .byte $26   ; 51 
    .byte $A6   ; 52 
    .byte $22   ; 53 
    .byte $82   ; 54 
    .byte $02   ; 55 
    .byte $30   ; 56 
    .byte $02   ; 57 
    .byte $11   ; 58 
    .byte $1E   ; 59 
    .byte $86   ; 5A 
    .byte $02   ; 5B 
    .byte $E2   ; 5C 
    .byte $26   ; 5D 
    .byte $46   ; 5E 
    .byte $F6   ; 5F 
    .byte $06   ; 60 
    .byte $36   ; 61 
    .byte $22   ; 62 
    .byte $06   ; 63 
    .byte $02   ; 64 
    .byte $02   ; 65 
    .byte $36   ; 66 
    .byte $02   ; 67 
    .byte $32   ; 68 
    .byte $02   ; 69 
    .byte $1F   ; 6A 
    .byte $FE   ; 6B 
    .byte $06   ; 6C 
    .byte $22   ; 6D 
    .byte $22   ; 6E 
    .byte $A6   ; 6F 
    .byte $26   ; 70 
    .byte $A6   ; 71 
    .byte $02   ; 72 
    .byte $06   ; 73 
    .byte $02   ; 74 
    .byte $02   ; 75 
    .byte $A6   ; 76 
    .byte $02   ; 77 
    .byte $86   ; 78 
    .byte $02   ; 79 
    .byte $12   ; 7A 
    .byte $06   ; 7B 
    .byte $26   ; 7C 
    .byte $02   ; 7D 
    .byte $06   ; 7E 
    .byte $5E   ; 7F 

    .byte $26   ; 00 
    .byte $3E   ; 01 
    .byte $06   ; 02 
    .byte $24   ; 03 
    .byte $36   ; 04 
    .byte $BE   ; 05 
    .byte $06   ; 06 
    .byte $3E   ; 07 
    .byte $06   ; 08 
    .byte $7B   ; 09 
    .byte $27   ; 0A 
    .byte $3A   ; 0B 
    .byte $28   ; 0C 
    .byte $5C   ; 0D 
    .byte $06   ; 0E 
    .byte $6F   ; 0F 
    .byte $36   ; 10 
    .byte $A6   ; 11 
    .byte $26   ; 12 
    .byte $3F   ; 13 
    .byte $E7   ; 14 
    .byte $26   ; 15 
    .byte $26   ; 16 
    .byte $37   ; 17 
    .byte $A6   ; 18 
    .byte $22   ; 19 
    .byte $06   ; 1A 
    .byte $26   ; 1B 
    .byte $2B   ; 1C 
    .byte $47   ; 1D 
    .byte $27   ; 1E 
    .byte $06   ; 1F 
    .byte $26   ; 20 
    .byte $71   ; 21 
    .byte $26   ; 22 
    .byte $2B   ; 23 
    .byte $46   ; 24 
    .byte $24   ; 25 
    .byte $27   ; 26 
    .byte $26   ; 27 
    .byte $68   ; 28 
    .byte $33   ; 29 
    .byte $86   ; 2A 
    .byte $26   ; 2B 
    .byte $23   ; 2C 
    .byte $12   ; 2D 
    .byte $87   ; 2E 
    .byte $27   ; 2F 
    .byte $26   ; 30 
    .byte $23   ; 31 
    .byte $05   ; 32 
    .byte $33   ; 33 
    .byte $86   ; 34 
    .byte $27   ; 35 
    .byte $26   ; 36 
    .byte $36   ; 37 
    .byte $A6   ; 38 
    .byte $26   ; 39 
    .byte $46   ; 3A 
    .byte $26   ; 3B 
    .byte $23   ; 3C 
    .byte $12   ; 3D 
    .byte $86   ; 3E 
    .byte $27   ; 3F 
    .byte $22   ; 40 
    .byte $E6   ; 41 
    .byte $30   ; 42 
    .byte $83   ; 43 
    .byte $07   ; 44 
    .byte $27   ; 45 
    .byte $51   ; 46 
    .byte $23   ; 47 
    .byte $07   ; 48 
    .byte $37   ; 49 
    .byte $A2   ; 4A 
    .byte $06   ; 4B 
    .byte $36   ; 4C 
    .byte $AA   ; 4D 
    .byte $44   ; 4E 
    .byte $46   ; 4F 
    .byte $27   ; 50 
    .byte $22   ; 51 
    .byte $17   ; 52 
    .byte $A3   ; 53 
    .byte $07   ; 54 
    .byte $26   ; 55 
    .byte $76   ; 56 
    .byte $26   ; 57 
    .byte $22   ; 58 
    .byte $36   ; 59 
    .byte $B2   ; 5A 
    .byte $87   ; 5B 
    .byte $37   ; 5C 
    .byte $BE   ; 5D 
    .byte $06   ; 5E 
    .byte $27   ; 5F 
    .byte $23   ; 60 
    .byte $02   ; 61 
    .byte $07   ; 62 
    .byte $23   ; 63 
    .byte $07   ; 64 
    .byte $36   ; 65 
    .byte $A6   ; 66 
    .byte $32   ; 67 
    .byte $86   ; 68 
    .byte $26   ; 69 
    .byte $1F   ; 6A 
    .byte $26   ; 6B 
    .byte $22   ; 6C 
    .byte $E3   ; 6D 
    .byte $06   ; 6E 
    .byte $26   ; 6F 
    .byte $2B   ; 70 
    .byte $46   ; 71 
    .byte $27   ; 72 
    .byte $36   ; 73 
    .byte $27   ; 74 
    .byte $27   ; 75 
    .byte $26   ; 76 
    .byte $23   ; 77 
    .byte $06   ; 78 
    .byte $27   ; 79 
    .byte $12   ; 7A 
    .byte $26   ; 7B 
    .byte $23   ; 7C 
    .byte $03   ; 7D 
    .byte $06   ; 7E 
    .byte $5E   ; 7F 

    .byte $00   ; 00 
    .byte $63   ; 01 
    .byte $33   ; 02 
    .byte $69   ; 03 
    .byte $DB   ; 04 
    .byte $03   ; 05 
    .byte $6D   ; 06 
    .byte $3D   ; 07 
    .byte $00   ; 08 
    .byte $68   ; 09 
    .byte $AD   ; 0A 
    .byte $68   ; 0B 
    .byte $12   ; 0C 
    .byte $11   ; 0D 
    .byte $2C   ; 0E 
    .byte $6B   ; 0F 
    .byte $04   ; 10 
    .byte $52   ; 11 
    .byte $2D   ; 12 
    .byte $7B   ; 13 
    .byte $7B   ; 14 
    .byte $86   ; 15 
    .byte $00   ; 16 
    .byte $05   ; 17 
    .byte $F9   ; 18 
    .byte $3C   ; 19 
    .byte $4B   ; 1A 
    .byte $00   ; 1B 
    .byte $FE   ; 1C 
    .byte $DB   ; 1D 
    .byte $8C   ; 1E 
    .byte $B8   ; 1F 
    .byte $00   ; 20 
    .byte $68   ; 21 
    .byte $DD   ; 22 
    .byte $52   ; 23 
    .byte $2C   ; 24 
    .byte $36   ; 25 
    .byte $33   ; 26 
    .byte $01   ; 27 
    .byte $6A   ; 28 
    .byte $DB   ; 29 
    .byte $DB   ; 2A 
    .byte $03   ; 2B 
    .byte $53   ; 2C 
    .byte $00   ; 2D 
    .byte $32   ; 2E 
    .byte $31   ; 2F 
    .byte $86   ; 30 
    .byte $FC   ; 31 
    .byte $3C   ; 32 
    .byte $FD   ; 33 
    .byte $DB   ; 34 
    .byte $AA   ; 35 
    .byte $3C   ; 36 
    .byte $D5   ; 37 
    .byte $32   ; 38 
    .byte $70   ; 39 
    .byte $00   ; 3A 
    .byte $0B   ; 3B 
    .byte $AD   ; 3C 
    .byte $B0   ; 3D 
    .byte $35   ; 3E 
    .byte $0B   ; 3F 
    .byte $F7   ; 40 
    .byte $53   ; 41 
    .byte $12   ; 42 
    .byte $F6   ; 43 
    .byte $F1   ; 44 
    .byte $45   ; 45 
    .byte $69   ; 46 
    .byte $05   ; 47 
    .byte $EE   ; 48 
    .byte $DB   ; 49 
    .byte $B0   ; 4A 
    .byte $4B   ; 4B 
    .byte $8C   ; 4C 
    .byte $4B   ; 4D 
    .byte $0F   ; 4E 
    .byte $00   ; 4F 
    .byte $FD   ; 50 
    .byte $09   ; 51 
    .byte $FC   ; 52 
    .byte $72   ; 53 
    .byte $FC   ; 54 
    .byte $A8   ; 55 
    .byte $69   ; 56 
    .byte $6A   ; 57 
    .byte $68   ; 58 
    .byte $13   ; 59 
    .byte $0B   ; 5A 
    .byte $EE   ; 5B 
    .byte $FE   ; 5C 
    .byte $3D   ; 5D 
    .byte $B0   ; 5E 
    .byte $38   ; 5F 
    .byte $72   ; 60 
    .byte $F6   ; 61 
    .byte $AD   ; 62 
    .byte $FD   ; 63 
    .byte $7B   ; 64 
    .byte $86   ; 65 
    .byte $31   ; 66 
    .byte $06   ; 67 
    .byte $9B   ; 68 
    .byte $70   ; 69 
    .byte $6A   ; 6A 
    .byte $13   ; 6B 
    .byte $B8   ; 6C 
    .byte $38   ; 6D 
    .byte $6C   ; 6E 
    .byte $2D   ; 6F 
    .byte $DD   ; 70 
    .byte $FD   ; 71 
    .byte $00   ; 72 
    .byte $6A   ; 73 
    .byte $00   ; 74 
    .byte $C0   ; 75 
    .byte $E7   ; 76 
    .byte $00   ; 77 
    .byte $46   ; 78 
    .byte $00   ; 79 
    .byte $69   ; 7A 
    .byte $70   ; 7B 
    .byte $EF   ; 7C 
    .byte $00   ; 7D 
    .byte $6D   ; 7E 
    .byte $6A   ; 7F 

    .byte $00 + $00 + con_obj_id_29   ; 00 
    .byte $40 + $00 + con_obj_id_1C   ; 01 
    .byte $00 + $00 + con_obj_id_06   ; 02 
    .byte $00 + $00 + con_obj_id_3E   ; 03 
    .byte $00 + $00 + con_obj_id_1C   ; 04 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 05 
    .byte $40 + $00 + con_obj_id_06   ; 06 
    .byte $00 + $00 + con_obj_id_04   ; 07 
    .byte $00 + $00 + con_obj_id_29   ; 08 
    .byte $00 + $00 + con_obj_id_3E   ; 09 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 0A 
    .byte $00 + $00 + con_obj_id_3F   ; 0B 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 0C 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 0D 
    .byte $40 + $00 + con_obj_id_1F   ; 0E 
    .byte $00 + $00 + con_obj_id_3E   ; 0F 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 10 
    .byte $00 + $00 + con_obj_id_1B   ; 11 
    .byte $00 + $00 + con_obj_id_1B   ; 12 
    .byte $00 + $80 + con_obj_id_64 - $40   ; 13 
    .byte $00 + $80 + con_obj_id_4B - $40   ; 14 
    .byte $00 + $00 + con_obj_id_03   ; 15 
    .byte $00 + $00 + con_obj_id_29   ; 16 
    .byte $00 + $00 + con_obj_id_24   ; 17 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 18 
    .byte $00 + $00 + con_obj_id_null   ; 19 
    .byte $00 + $00 + con_obj_id_02   ; 1A 
    .byte $00 + $00 + con_obj_id_29   ; 1B 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 1C 
    .byte $00 + $00 + con_obj_id_13   ; 1D 
    .byte $00 + $00 + con_obj_id_23   ; 1E 
    .byte $40 + $80 + con_obj_id_4C - $40   ; 1F 
    .byte $00 + $00 + con_obj_id_29   ; 20 
    .byte $00 + $00 + con_obj_id_3E   ; 21 
    .byte $00 + $00 + con_obj_id_1C   ; 22 
    .byte $00 + $00 + con_obj_id_19   ; 23 
    .byte $40 + $00 + con_obj_id_07   ; 24 
    .byte $00 + $00 + con_obj_id_26   ; 25 
    .byte $00 + $00 + con_obj_id_24   ; 26 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 27 
    .byte $00 + $00 + con_obj_id_3E   ; 28 
    .byte $00 + $00 + con_obj_id_23   ; 29 
    .byte $00 + $00 + con_obj_id_0E   ; 2A 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 2B 
    .byte $00 + $00 + con_obj_id_17   ; 2C 
    .byte $40 + $00 + con_obj_id_20   ; 2D 
    .byte $00 + $00 + con_obj_id_24   ; 2E 
    .byte $00 + $00 + con_obj_id_24   ; 2F 
    .byte $00 + $00 + con_obj_id_1B   ; 30 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 31 
    .byte $00 + $00 + con_obj_id_25   ; 32 
    .byte $00 + $80 + con_obj_id_53 - $40   ; 33 
    .byte $00 + $00 + con_obj_id_0E   ; 34 
    .byte $00 + $00 + con_obj_id_23   ; 35 
    .byte $40 + $00 + con_obj_id_0A   ; 36 
    .byte $00 + $00 + con_obj_id_1E   ; 37 
    .byte $00 + $00 + con_obj_id_25   ; 38 
    .byte $00 + $00 + con_obj_id_07   ; 39 
    .byte $00 + $00 + con_obj_id_1C   ; 3A 
    .byte $00 + $00 + con_obj_id_1B   ; 3B 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 3C 
    .byte $00 + $80 + con_obj_id_43 - $40   ; 3D 
    .byte $00 + $00 + con_obj_id_26   ; 3E 
    .byte $00 + $00 + con_obj_id_23   ; 3F 
    .byte $00 + $80 + con_obj_id_4D - $40   ; 40 
    .byte $00 + $00 + con_obj_id_26   ; 41 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 42 
    .byte $00 + $80 + con_obj_id_54 - $40   ; 43 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 44 
    .byte $00 + $00 + con_obj_id_24   ; 45 
    .byte $00 + $00 + con_obj_id_3F   ; 46 
    .byte $00 + $00 + con_obj_id_15   ; 47 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 48 
    .byte $00 + $00 + con_obj_id_23   ; 49 
    .byte $00 + $80 + con_obj_id_4D - $40   ; 4A 
    .byte $00 + $00 + con_obj_id_0A   ; 4B 
    .byte $00 + $00 + con_obj_id_06   ; 4C 
    .byte $00 + $00 + con_obj_id_0A   ; 4D 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 4E 
    .byte $00 + $00 + con_obj_id_29   ; 4F 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 50 
    .byte $40 + $80 + con_obj_id_41 - $40   ; 51 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 52 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 53 
    .byte $00 + $80 + con_obj_id_64 - $40   ; 54 
    .byte $00 + $00 + con_obj_id_11   ; 55 
    .byte $00 + $00 + con_obj_id_3E   ; 56 
    .byte $00 + $00 + con_obj_id_1F   ; 57 
    .byte $00 + $00 + con_obj_id_3E   ; 58 
    .byte $40 + $00 + con_obj_id_0A   ; 59 
    .byte $00 + $00 + con_obj_id_1E   ; 5A 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 5B 
    .byte $00 + $80 + con_obj_id_5F - $40   ; 5C 
    .byte $00 + $00 + con_obj_id_04   ; 5D 
    .byte $40 + $80 + con_obj_id_4D - $40   ; 5E 
    .byte $00 + $00 + con_obj_id_24   ; 5F 
    .byte $00 + $80 + con_obj_id_57 - $40   ; 60 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 61 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 62 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 63 
    .byte $00 + $80 + con_obj_id_4C - $40   ; 64 
    .byte $00 + $00 + con_obj_id_0D   ; 65 
    .byte $00 + $00 + con_obj_id_25   ; 66 
    .byte $00 + $00 + con_obj_id_23   ; 67 
    .byte $40 + $00 + con_obj_id_1A   ; 68 
    .byte $00 + $00 + con_obj_id_10   ; 69 
    .byte $00 + $00 + con_obj_id_3F   ; 6A 
    .byte $00 + $00 + con_obj_id_11   ; 6B 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 6C 
    .byte $00 + $00 + con_obj_id_23   ; 6D 
    .byte $00 + $00 + con_obj_id_1F   ; 6E 
    .byte $00 + $00 + con_obj_id_1B   ; 6F 
    .byte $00 + $00 + con_obj_id_null   ; 70 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 71 
    .byte $00 + $00 + con_obj_id_21   ; 72 
    .byte $00 + $00 + con_obj_id_3E   ; 73 
    .byte $00 + $00 + con_obj_id_21   ; 74 
    .byte $00 + $00 + con_obj_id_21   ; 75 
    .byte $40 + $00 + con_obj_id_08   ; 76 
    .byte $00 + $00 + con_obj_id_21   ; 77 
    .byte $00 + $00 + con_obj_id_02   ; 78 
    .byte $00 + $00 + con_obj_id_21   ; 79 
    .byte $00 + $00 + con_obj_id_3F   ; 7A 
    .byte $00 + $00 + con_obj_id_1B   ; 7B 
    .byte $00 + $80 + con_obj_id_51 - $40   ; 7C 
    .byte $00 + $00 + con_obj_id_21   ; 7D 
    .byte $00 + $00 + con_obj_id_null   ; 7E 
    .byte $00 + $00 + con_obj_id_3F   ; 7F 

    .byte $1B   ; 00 
    .byte $03   ; 01 
    .byte $19   ; 02 
    .byte $03   ; 03 
    .byte $03   ; 04 
    .byte $0F   ; 05 
    .byte $03   ; 06 
    .byte $1A   ; 07 
    .byte $1B   ; 08 
    .byte $03   ; 09 
    .byte $17   ; 0A 
    .byte $05   ; 0B 
    .byte $03   ; 0C 
    .byte $03   ; 0D 
    .byte $03   ; 0E 
    .byte $03   ; 0F 
    .byte $1A   ; 10 
    .byte $23   ; 11 
    .byte $03   ; 12 
    .byte $00   ; 13 
    .byte $19   ; 14 
    .byte $1E   ; 15 
    .byte $1B   ; 16 
    .byte $23   ; 17 
    .byte $19   ; 18 
    .byte $19   ; 19 
    .byte $03   ; 1A 
    .byte $1B   ; 1B 
    .byte $83   ; 1C 
    .byte $99   ; 1D 
    .byte $17   ; 1E 
    .byte $03   ; 1F 
    .byte $1B   ; 20 
    .byte $03   ; 21 
    .byte $03   ; 22 
    .byte $03   ; 23 
    .byte $03   ; 24 
    .byte $03   ; 25 
    .byte $1A   ; 26 
    .byte $03   ; 27 
    .byte $03   ; 28 
    .byte $03   ; 29 
    .byte $39   ; 2A 
    .byte $1A   ; 2B 
    .byte $80   ; 2C 
    .byte $03   ; 2D 
    .byte $03   ; 2E 
    .byte $03   ; 2F 
    .byte $19   ; 30 
    .byte $19   ; 31 
    .byte $0F   ; 32 
    .byte $03   ; 33 
    .byte $16   ; 34 
    .byte $19   ; 35 
    .byte $43   ; 36 
    .byte $0F   ; 37 
    .byte $03   ; 38 
    .byte $03   ; 39 
    .byte $03   ; 3A 
    .byte $20   ; 3B 
    .byte $03   ; 3C 
    .byte $19   ; 3D 
    .byte $03   ; 3E 
    .byte $03   ; 3F 
    .byte $03   ; 40 
    .byte $16   ; 41 
    .byte $03   ; 42 
    .byte $17   ; 43 
    .byte $03   ; 44 
    .byte $17   ; 45 
    .byte $0D   ; 46 
    .byte $00   ; 47 
    .byte $17   ; 48 
    .byte $19   ; 49 
    .byte $19   ; 4A 
    .byte $00   ; 4B 
    .byte $19   ; 4C 
    .byte $00   ; 4D 
    .byte $03   ; 4E 
    .byte $1B   ; 4F 
    .byte $83   ; 50 
    .byte $0F   ; 51 
    .byte $0F   ; 52 
    .byte $03   ; 53 
    .byte $03   ; 54 
    .byte $00   ; 55 
    .byte $03   ; 56 
    .byte $16   ; 57 
    .byte $03   ; 58 
    .byte $03   ; 59 
    .byte $16   ; 5A 
    .byte $19   ; 5B 
    .byte $83   ; 5C 
    .byte $03   ; 5D 
    .byte $63   ; 5E 
    .byte $1A   ; 5F 
    .byte $97   ; 60 
    .byte $0F   ; 61 
    .byte $83   ; 62 
    .byte $99   ; 63 
    .byte $80   ; 64 
    .byte $03   ; 65 
    .byte $1A   ; 66 
    .byte $19   ; 67 
    .byte $03   ; 68 
    .byte $19   ; 69 
    .byte $0C   ; 6A 
    .byte $19   ; 6B 
    .byte $16   ; 6C 
    .byte $03   ; 6D 
    .byte $03   ; 6E 
    .byte $63   ; 6F 
    .byte $99   ; 70 
    .byte $03   ; 71 
    .byte $03   ; 72 
    .byte $03   ; 73 
    .byte $03   ; 74 
    .byte $03   ; 75 
    .byte $16   ; 76 
    .byte $03   ; 77 
    .byte $1D   ; 78 
    .byte $03   ; 79 
    .byte $0A   ; 7A 
    .byte $0F   ; 7B 
    .byte $99   ; 7C 
    .byte $03   ; 7D 
    .byte $03   ; 7E 
    .byte $11   ; 7F 

    .byte $20   ; 00 
    .byte $04   ; 01 
    .byte $17   ; 02 
    .byte $00   ; 03 
    .byte $00   ; 04 
    .byte $07   ; 05 
    .byte $05   ; 06 
    .byte $07   ; 07 
    .byte $20   ; 08 
    .byte $00   ; 09 
    .byte $27   ; 0A 
    .byte $20   ; 0B 
    .byte $00   ; 0C 
    .byte $06   ; 0D 
    .byte $05   ; 0E 
    .byte $00   ; 0F 
    .byte $07   ; 10 
    .byte $02   ; 11 
    .byte $00   ; 12 
    .byte $27   ; 13 
    .byte $31   ; 14 
    .byte $37   ; 15 
    .byte $20   ; 16 
    .byte $00   ; 17 
    .byte $27   ; 18 
    .byte $27   ; 19 
    .byte $02   ; 1A 
    .byte $20   ; 1B 
    .byte $00   ; 1C 
    .byte $07   ; 1D 
    .byte $27   ; 1E 
    .byte $05   ; 1F 
    .byte $20   ; 20 
    .byte $00   ; 21 
    .byte $02   ; 22 
    .byte $00   ; 23 
    .byte $05   ; 24 
    .byte $00   ; 25 
    .byte $37   ; 26 
    .byte $01   ; 27 
    .byte $00   ; 28 
    .byte $01   ; 29 
    .byte $30   ; 2A 
    .byte $07   ; 2B 
    .byte $27   ; 2C 
    .byte $00   ; 2D 
    .byte $01   ; 2E 
    .byte $01   ; 2F 
    .byte $01   ; 30 
    .byte $30   ; 31 
    .byte $07   ; 32 
    .byte $00   ; 33 
    .byte $00   ; 34 
    .byte $27   ; 35 
    .byte $05   ; 36 
    .byte $07   ; 37 
    .byte $01   ; 38 
    .byte $01   ; 39 
    .byte $00   ; 3A 
    .byte $27   ; 3B 
    .byte $00   ; 3C 
    .byte $27   ; 3D 
    .byte $06   ; 3E 
    .byte $01   ; 3F 
    .byte $01   ; 40 
    .byte $27   ; 41 
    .byte $00   ; 42 
    .byte $17   ; 43 
    .byte $00   ; 44 
    .byte $21   ; 45 
    .byte $20   ; 46 
    .byte $17   ; 47 
    .byte $31   ; 48 
    .byte $20   ; 49 
    .byte $17   ; 4A 
    .byte $27   ; 4B 
    .byte $27   ; 4C 
    .byte $27   ; 4D 
    .byte $00   ; 4E 
    .byte $20   ; 4F 
    .byte $01   ; 50 
    .byte $35   ; 51 
    .byte $27   ; 52 
    .byte $00   ; 53 
    .byte $00   ; 54 
    .byte $27   ; 55 
    .byte $00   ; 56 
    .byte $17   ; 57 
    .byte $00   ; 58 
    .byte $04   ; 59 
    .byte $17   ; 5A 
    .byte $27   ; 5B 
    .byte $01   ; 5C 
    .byte $01   ; 5D 
    .byte $05   ; 5E 
    .byte $07   ; 5F 
    .byte $27   ; 60 
    .byte $07   ; 61 
    .byte $00   ; 62 
    .byte $10   ; 63 
    .byte $27   ; 64 
    .byte $00   ; 65 
    .byte $17   ; 66 
    .byte $27   ; 67 
    .byte $00   ; 68 
    .byte $17   ; 69 
    .byte $20   ; 6A 
    .byte $17   ; 6B 
    .byte $27   ; 6C 
    .byte $01   ; 6D 
    .byte $00   ; 6E 
    .byte $00   ; 6F 
    .byte $27   ; 70 
    .byte $00   ; 71 
    .byte $00   ; 72 
    .byte $00   ; 73 
    .byte $00   ; 74 
    .byte $00   ; 75 
    .byte $25   ; 76 
    .byte $00   ; 77 
    .byte $27   ; 78 
    .byte $00   ; 79 
    .byte $20   ; 7A 
    .byte $27   ; 7B 
    .byte $27   ; 7C 
    .byte $00   ; 7D 
    .byte $00   ; 7E 
    .byte $20   ; 7F 



_off011_9000_07:
_off011_9000_08:
_off011_9000_09:
    .byte $26   ; 00 
    .byte $22   ; 01 
    .byte $18   ; 02 
    .byte $29   ; 03 
    .byte $19   ; 04 
    .byte $49   ; 05 
    .byte $26   ; 06 
    .byte $3E   ; 07 
    .byte $22   ; 08 
    .byte $26   ; 09 
    .byte $26   ; 0A 
    .byte $26   ; 0B 
    .byte $26   ; 0C 
    .byte $26   ; 0D 
    .byte $26   ; 0E 
    .byte $22   ; 0F 
    .byte $26   ; 10 
    .byte $06   ; 11 
    .byte $26   ; 12 
    .byte $3E   ; 13 
    .byte $22   ; 14 
    .byte $22   ; 15 
    .byte $46   ; 16 
    .byte $E6   ; 17 
    .byte $EA   ; 18 
    .byte $26   ; 19 
    .byte $22   ; 1A 
    .byte $26   ; 1B 
    .byte $26   ; 1C 
    .byte $26   ; 1D 
    .byte $26   ; 1E 
    .byte $02   ; 1F 
    .byte $08   ; 20 
    .byte $6A   ; 21 
    .byte $32   ; 22 
    .byte $02   ; 23 
    .byte $02   ; 24 
    .byte $02   ; 25 
    .byte $69   ; 26 
    .byte $78   ; 27 
    .byte $56   ; 28 
    .byte $32   ; 29 
    .byte $06   ; 2A 
    .byte $38   ; 2B 
    .byte $48   ; 2C 
    .byte $22   ; 2D 
    .byte $22   ; 2E 
    .byte $02   ; 2F 
    .byte $5B   ; 30 
    .byte $3E   ; 31 
    .byte $92   ; 32 
    .byte $F6   ; 33 
    .byte $12   ; 34 
    .byte $06   ; 35 
    .byte $3E   ; 36 
    .byte $5C   ; 37 
    .byte $A6   ; 38 
    .byte $86   ; 39 
    .byte $3E   ; 3A 
    .byte $3E   ; 3B 
    .byte $3E   ; 3C 
    .byte $F6   ; 3D 
    .byte $E2   ; 3E 
    .byte $02   ; 3F 
    .byte $22   ; 40 
    .byte $16   ; 41 
    .byte $8A   ; 42 
    .byte $A2   ; 43 
    .byte $82   ; 44 
    .byte $52   ; 45 
    .byte $12   ; 46 
    .byte $2A   ; 47 
    .byte $26   ; 48 
    .byte $22   ; 49 
    .byte $16   ; 4A 
    .byte $1E   ; 4B 
    .byte $1E   ; 4C 
    .byte $B2   ; 4D 
    .byte $1E   ; 4E 
    .byte $02   ; 4F 
    .byte $06   ; 50 
    .byte $B6   ; 51 
    .byte $22   ; 52 
    .byte $02   ; 53 
    .byte $02   ; 54 
    .byte $82   ; 55 
    .byte $82   ; 56 
    .byte $46   ; 57 
    .byte $2A   ; 58 
    .byte $EA   ; 59 
    .byte $A6   ; 5A 
    .byte $06   ; 5B 
    .byte $06   ; 5C 
    .byte $82   ; 5D 
    .byte $E2   ; 5E 
    .byte $02   ; 5F 
    .byte $4A   ; 60 
    .byte $A6   ; 61 
    .byte $06   ; 62 
    .byte $12   ; 63 
    .byte $E2   ; 64 
    .byte $06   ; 65 
    .byte $26   ; 66 
    .byte $1A   ; 67 
    .byte $46   ; 68 
    .byte $46   ; 69 
    .byte $26   ; 6A 
    .byte $26   ; 6B 
    .byte $26   ; 6C 
    .byte $06   ; 6D 
    .byte $02   ; 6E 
    .byte $02   ; 6F 
    .byte $2A   ; 70 
    .byte $73   ; 71 
    .byte $01   ; 72 
    .byte $86   ; 73 
    .byte $02   ; 74 
    .byte $06   ; 75 
    .byte $45   ; 76 
    .byte $00   ; 77 
    .byte $26   ; 78 
    .byte $22   ; 79 
    .byte $26   ; 7A 
    .byte $26   ; 7B 
    .byte $26   ; 7C 
    .byte $26   ; 7D 
    .byte $06   ; 7E 
    .byte $02   ; 7F 

    .byte $2A   ; 00 
    .byte $46   ; 01 
    .byte $6F   ; 02 
    .byte $5F   ; 03 
    .byte $4F   ; 04 
    .byte $0A   ; 05 
    .byte $26   ; 06 
    .byte $26   ; 07 
    .byte $32   ; 08 
    .byte $87   ; 09 
    .byte $22   ; 0A 
    .byte $F7   ; 0B 
    .byte $B3   ; 0C 
    .byte $9F   ; 0D 
    .byte $FE   ; 0E 
    .byte $E7   ; 0F 
    .byte $3F   ; 10 
    .byte $E3   ; 11 
    .byte $0B   ; 12 
    .byte $48   ; 13 
    .byte $22   ; 14 
    .byte $12   ; 15 
    .byte $9F   ; 16 
    .byte $E7   ; 17 
    .byte $22   ; 18 
    .byte $E6   ; 19 
    .byte $26   ; 1A 
    .byte $22   ; 1B 
    .byte $FE   ; 1C 
    .byte $F7   ; 1D 
    .byte $A6   ; 1E 
    .byte $27   ; 1F 
    .byte $58   ; 20 
    .byte $4D   ; 21 
    .byte $37   ; 22 
    .byte $A3   ; 23 
    .byte $E3   ; 24 
    .byte $06   ; 25 
    .byte $3F   ; 26 
    .byte $3A   ; 27 
    .byte $23   ; 28 
    .byte $E6   ; 29 
    .byte $26   ; 2A 
    .byte $38   ; 2B 
    .byte $48   ; 2C 
    .byte $26   ; 2D 
    .byte $26   ; 2E 
    .byte $24   ; 2F 
    .byte $2E   ; 30 
    .byte $22   ; 31 
    .byte $03   ; 32 
    .byte $E2   ; 33 
    .byte $02   ; 34 
    .byte $26   ; 35 
    .byte $06   ; 36 
    .byte $1E   ; 37 
    .byte $26   ; 38 
    .byte $27   ; 39 
    .byte $3E   ; 3A 
    .byte $04   ; 3B 
    .byte $27   ; 3C 
    .byte $27   ; 3D 
    .byte $27   ; 3E 
    .byte $26   ; 3F 
    .byte $32   ; 40 
    .byte $9E   ; 41 
    .byte $02   ; 42 
    .byte $3F   ; 43 
    .byte $E7   ; 44 
    .byte $2A   ; 45 
    .byte $53   ; 46 
    .byte $87   ; 47 
    .byte $36   ; 48 
    .byte $A6   ; 49 
    .byte $3E   ; 4A 
    .byte $02   ; 4B 
    .byte $E4   ; 4C 
    .byte $26   ; 4D 
    .byte $27   ; 4E 
    .byte $27   ; 4F 
    .byte $37   ; 50 
    .byte $A7   ; 51 
    .byte $26   ; 52 
    .byte $27   ; 53 
    .byte $2B   ; 54 
    .byte $4B   ; 55 
    .byte $5E   ; 56 
    .byte $06   ; 57 
    .byte $3E   ; 58 
    .byte $06   ; 59 
    .byte $27   ; 5A 
    .byte $26   ; 5B 
    .byte $26   ; 5C 
    .byte $26   ; 5D 
    .byte $27   ; 5E 
    .byte $26   ; 5F 
    .byte $7D   ; 60 
    .byte $23   ; 61 
    .byte $1F   ; 62 
    .byte $E3   ; 63 
    .byte $FC   ; 64 
    .byte $03   ; 65 
    .byte $07   ; 66 
    .byte $7C   ; 67 
    .byte $23   ; 68 
    .byte $16   ; 69 
    .byte $A6   ; 6A 
    .byte $20   ; 6B 
    .byte $E2   ; 6C 
    .byte $E6   ; 6D 
    .byte $27   ; 6E 
    .byte $26   ; 6F 
    .byte $2A   ; 70 
    .byte $35   ; 71 
    .byte $15   ; 72 
    .byte $22   ; 73 
    .byte $27   ; 74 
    .byte $57   ; 75 
    .byte $45   ; 76 
    .byte $00   ; 77 
    .byte $22   ; 78 
    .byte $03   ; 79 
    .byte $03   ; 7A 
    .byte $E3   ; 7B 
    .byte $02   ; 7C 
    .byte $FE   ; 7D 
    .byte $07   ; 7E 
    .byte $27   ; 7F 

    .byte $3B   ; 00 
    .byte $07   ; 01 
    .byte $69   ; 02 
    .byte $69   ; 03 
    .byte $69   ; 04 
    .byte $69   ; 05 
    .byte $EC   ; 06 
    .byte $37   ; 07 
    .byte $01   ; 08 
    .byte $31   ; 09 
    .byte $AD   ; 0A 
    .byte $31   ; 0B 
    .byte $FF   ; 0C 
    .byte $38   ; 0D 
    .byte $85   ; 0E 
    .byte $45   ; 0F 
    .byte $72   ; 10 
    .byte $F1   ; 11 
    .byte $F6   ; 12 
    .byte $0D   ; 13 
    .byte $ED   ; 14 
    .byte $7B   ; 15 
    .byte $08   ; 16 
    .byte $3E   ; 17 
    .byte $86   ; 18 
    .byte $6C   ; 19 
    .byte $DB   ; 1A 
    .byte $00   ; 1B 
    .byte $05   ; 1C 
    .byte $4C   ; 1D 
    .byte $FE   ; 1E 
    .byte $EE   ; 1F 
    .byte $69   ; 20 
    .byte $39   ; 21 
    .byte $A3   ; 22 
    .byte $FC   ; 23 
    .byte $00   ; 24 
    .byte $00   ; 25 
    .byte $C5   ; 26 
    .byte $39   ; 27 
    .byte $31   ; 28 
    .byte $F5   ; 29 
    .byte $B8   ; 2A 
    .byte $39   ; 2B 
    .byte $69   ; 2C 
    .byte $00   ; 2D 
    .byte $EE   ; 2E 
    .byte $36   ; 2F 
    .byte $6A   ; 30 
    .byte $F7   ; 31 
    .byte $FD   ; 32 
    .byte $00   ; 33 
    .byte $00   ; 34 
    .byte $2D   ; 35 
    .byte $72   ; 36 
    .byte $69   ; 37 
    .byte $FF   ; 38 
    .byte $45   ; 39 
    .byte $2D   ; 3A 
    .byte $11   ; 3B 
    .byte $3C   ; 3C 
    .byte $31   ; 3D 
    .byte $33   ; 3E 
    .byte $38   ; 3F 
    .byte $AD   ; 40 
    .byte $00   ; 41 
    .byte $53   ; 42 
    .byte $A4   ; 43 
    .byte $08   ; 44 
    .byte $7B   ; 45 
    .byte $07   ; 46 
    .byte $B3   ; 47 
    .byte $AA   ; 48 
    .byte $FF   ; 49 
    .byte $F0   ; 4A 
    .byte $00   ; 4B 
    .byte $11   ; 4C 
    .byte $01   ; 4D 
    .byte $8C   ; 4E 
    .byte $85   ; 4F 
    .byte $3A   ; 50 
    .byte $DD   ; 51 
    .byte $F1   ; 52 
    .byte $F7   ; 53 
    .byte $AD   ; 54 
    .byte $DD   ; 55 
    .byte $7B   ; 56 
    .byte $FD   ; 57 
    .byte $E8   ; 58 
    .byte $00   ; 59 
    .byte $8C   ; 5A 
    .byte $CC   ; 5B 
    .byte $8C   ; 5C 
    .byte $BA   ; 5D 
    .byte $4C   ; 5E 
    .byte $E8   ; 5F 
    .byte $69   ; 60 
    .byte $52   ; 61 
    .byte $F6   ; 62 
    .byte $3B   ; 63 
    .byte $0B   ; 64 
    .byte $7B   ; 65 
    .byte $FC   ; 66 
    .byte $69   ; 67 
    .byte $F5   ; 68 
    .byte $DB   ; 69 
    .byte $85   ; 6A 
    .byte $0F   ; 6B 
    .byte $FF   ; 6C 
    .byte $3D   ; 6D 
    .byte $FE   ; 6E 
    .byte $AD   ; 6F 
    .byte $39   ; 70 
    .byte $38   ; 71 
    .byte $C5   ; 72 
    .byte $FD   ; 73 
    .byte $00   ; 74 
    .byte $B5   ; 75 
    .byte $CA   ; 76 
    .byte $46   ; 77 
    .byte $AD   ; 78 
    .byte $00   ; 79 
    .byte $B8   ; 7A 
    .byte $FE   ; 7B 
    .byte $F4   ; 7C 
    .byte $3C   ; 7D 
    .byte $FE   ; 7E 
    .byte $00   ; 7F 

    .byte $40 + $00 + con_obj_id_0A   ; 00 
    .byte $40 + $80 + con_obj_id_4A - $40   ; 01 
    .byte $00 + $00 + con_obj_id_3E   ; 02 
    .byte $00 + $00 + con_obj_id_3E   ; 03 
    .byte $00 + $00 + con_obj_id_3E   ; 04 
    .byte $00 + $00 + con_obj_id_3E   ; 05 
    .byte $40 + $00 + con_obj_id_22   ; 06 
    .byte $00 + $00 + con_obj_id_27   ; 07 
    .byte $40 + $80 + con_obj_id_5A - $40   ; 08 
    .byte $00 + $00 + con_obj_id_24   ; 09 
    .byte $40 + $00 + con_obj_id_1F   ; 0A 
    .byte $00 + $00 + con_obj_id_24   ; 0B 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 0C 
    .byte $00 + $00 + con_obj_id_24   ; 0D 
    .byte $00 + $00 + con_obj_id_0C   ; 0E 
    .byte $00 + $00 + con_obj_id_23   ; 0F 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 10 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 11 
    .byte $00 + $80 + con_obj_id_59 - $40   ; 12 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 13 
    .byte $00 + $00 + con_obj_id_null   ; 14 
    .byte $40 + $80 + con_obj_id_4E - $40   ; 15 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 16 
    .byte $00 + $00 + con_obj_id_28   ; 17 
    .byte $40 + $00 + con_obj_id_22   ; 18 
    .byte $40 + $00 + con_obj_id_0A   ; 19 
    .byte $40 + $00 + con_obj_id_1A   ; 1A 
    .byte $00 + $00 + con_obj_id_29   ; 1B 
    .byte $00 + $80 + con_obj_id_45 - $40   ; 1C 
    .byte $00 + $00 + con_obj_id_24   ; 1D 
    .byte $00 + $80 + con_obj_id_5B - $40   ; 1E 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 1F 
    .byte $00 + $00 + con_obj_id_3E   ; 20 
    .byte $00 + $00 + con_obj_id_3E   ; 21 
    .byte $00 + $00 + con_obj_id_23   ; 22 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 23 
    .byte $40 + $00 + con_obj_id_20   ; 24 
    .byte $40 + $00 + con_obj_id_20   ; 25 
    .byte $00 + $00 + con_obj_id_3E   ; 26 
    .byte $00 + $00 + con_obj_id_3E   ; 27 
    .byte $00 + $00 + con_obj_id_23   ; 28 
    .byte $40 + $80 + con_obj_id_4D - $40   ; 29 
    .byte $40 + $80 + con_obj_id_5F - $40   ; 2A 
    .byte $00 + $00 + con_obj_id_3F   ; 2B 
    .byte $00 + $00 + con_obj_id_3F   ; 2C 
    .byte $00 + $00 + con_obj_id_29   ; 2D 
    .byte $40 + $80 + con_obj_id_41 - $40   ; 2E 
    .byte $00 + $00 + con_obj_id_26   ; 2F 
    .byte $00 + $00 + con_obj_id_3E   ; 30 
    .byte $00 + $80 + con_obj_id_41 - $40   ; 31 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 32 
    .byte $40 + $00 + con_obj_id_20   ; 33 
    .byte $40 + $00 + con_obj_id_20   ; 34 
    .byte $40 + $00 + con_obj_id_0A   ; 35 
    .byte $00 + $80 + con_obj_id_48 - $40   ; 36 
    .byte $00 + $00 + con_obj_id_3E   ; 37 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 38 
    .byte $00 + $00 + con_obj_id_23   ; 39 
    .byte $40 + $00 + con_obj_id_22   ; 3A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 3B 
    .byte $00 + $00 + con_obj_id_24   ; 3C 
    .byte $00 + $00 + con_obj_id_24   ; 3D 
    .byte $00 + $00 + con_obj_id_23   ; 3E 
    .byte $40 + $00 + con_obj_id_06   ; 3F 
    .byte $00 + $00 + con_obj_id_23   ; 40 
    .byte $40 + $00 + con_obj_id_20   ; 41 
    .byte $00 + $00 + con_obj_id_26   ; 42 
    .byte $00 + $00 + con_obj_id_12   ; 43 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 44 
    .byte $40 + $80 + con_obj_id_62 - $40   ; 45 
    .byte $00 + $80 + con_obj_id_64 - $40   ; 46 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 47 
    .byte $40 + $00 + con_obj_id_11   ; 48 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 49 
    .byte $40 + $00 + con_obj_id_0A   ; 4A 
    .byte $40 + $00 + con_obj_id_20   ; 4B 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 4C 
    .byte $40 + $80 + con_obj_id_47 - $40   ; 4D 
    .byte $00 + $00 + con_obj_id_23   ; 4E 
    .byte $00 + $00 + con_obj_id_18   ; 4F 
    .byte $00 + $00 + con_obj_id_24   ; 50 
    .byte $00 + $00 + con_obj_id_0D   ; 51 
    .byte $00 + $80 + con_obj_id_43 - $40   ; 52 
    .byte $00 + $80 + con_obj_id_54 - $40   ; 53 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 54 
    .byte $00 + $00 + con_obj_id_0F   ; 55 
    .byte $00 + $80 + con_obj_id_4C - $40   ; 56 
    .byte $40 + $80 + con_obj_id_5F - $40   ; 57 
    .byte $40 + $00 + con_obj_id_22   ; 58 
    .byte $40 + $00 + con_obj_id_20   ; 59 
    .byte $00 + $00 + con_obj_id_23   ; 5A 
    .byte $40 + $00 + con_obj_id_1F   ; 5B 
    .byte $40 + $00 + con_obj_id_11   ; 5C 
    .byte $00 + $80 + con_obj_id_5E - $40   ; 5D 
    .byte $00 + $00 + con_obj_id_24   ; 5E 
    .byte $40 + $00 + con_obj_id_11   ; 5F 
    .byte $00 + $00 + con_obj_id_3E   ; 60 
    .byte $00 + $00 + con_obj_id_23   ; 61 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 62 
    .byte $00 + $00 + con_obj_id_1D   ; 63 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 64 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 65 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 66 
    .byte $00 + $00 + con_obj_id_3E   ; 67 
    .byte $00 + $80 + con_obj_id_56 - $40   ; 68 
    .byte $00 + $00 + con_obj_id_0F   ; 69 
    .byte $40 + $00 + con_obj_id_1A   ; 6A 
    .byte $00 + $80 + con_obj_id_66 - $40   ; 6B 
    .byte $40 + $80 + con_obj_id_48 - $40   ; 6C 
    .byte $00 + $00 + con_obj_id_04   ; 6D 
    .byte $00 + $80 + con_obj_id_58 - $40   ; 6E 
    .byte $40 + $00 + con_obj_id_0A   ; 6F 
    .byte $00 + $00 + con_obj_id_3F   ; 70 
    .byte $00 + $00 + con_obj_id_3E   ; 71 
    .byte $00 + $00 + con_obj_id_3E   ; 72 
    .byte $00 + $80 + con_obj_id_5D - $40   ; 73 
    .byte $00 + $00 + con_obj_id_21   ; 74 
    .byte $00 + $00 + con_obj_id_3E   ; 75 
    .byte $00 + $00 + con_obj_id_3F   ; 76 
    .byte $00 + $00 + con_obj_id_3F   ; 77 
    .byte $40 + $80 + con_obj_id_5F - $40   ; 78 
    .byte $00 + $00 + con_obj_id_21   ; 79 
    .byte $00 + $80 + con_obj_id_breakable_wall - $40   ; 7A 
    .byte $00 + $80 + con_obj_id_53 - $40   ; 7B 
    .byte $40 + $80 + con_obj_id_51 - $40   ; 7C 
    .byte $40 + $00 + con_obj_id_06   ; 7D 
    .byte $00 + $80 + con_obj_id_55 - $40   ; 7E 
    .byte $00 + $00 + con_obj_id_21   ; 7F 

    .byte $03   ; 00 
    .byte $03   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 
    .byte $03   ; 04 
    .byte $03   ; 05 
    .byte $03   ; 06 
    .byte $03   ; 07 
    .byte $03   ; 08 
    .byte $19   ; 09 
    .byte $19   ; 0A 
    .byte $03   ; 0B 
    .byte $80   ; 0C 
    .byte $0F   ; 0D 
    .byte $03   ; 0E 
    .byte $19   ; 0F 
    .byte $0F   ; 10 
    .byte $03   ; 11 
    .byte $03   ; 12 
    .byte $03   ; 13 
    .byte $03   ; 14 
    .byte $03   ; 15 
    .byte $23   ; 16 
    .byte $8E   ; 17 
    .byte $03   ; 18 
    .byte $03   ; 19 
    .byte $03   ; 1A 
    .byte $1B   ; 1B 
    .byte $1A   ; 1C 
    .byte $20   ; 1D 
    .byte $03   ; 1E 
    .byte $96   ; 1F 
    .byte $03   ; 20 
    .byte $03   ; 21 
    .byte $03   ; 22 
    .byte $03   ; 23 
    .byte $83   ; 24 
    .byte $03   ; 25 
    .byte $03   ; 26 
    .byte $03   ; 27 
    .byte $03   ; 28 
    .byte $03   ; 29 
    .byte $19   ; 2A 
    .byte $10   ; 2B 
    .byte $0B   ; 2C 
    .byte $1B   ; 2D 
    .byte $19   ; 2E 
    .byte $03   ; 2F 
    .byte $03   ; 30 
    .byte $03   ; 31 
    .byte $19   ; 32 
    .byte $03   ; 33 
    .byte $03   ; 34 
    .byte $03   ; 35 
    .byte $03   ; 36 
    .byte $03   ; 37 
    .byte $03   ; 38 
    .byte $17   ; 39 
    .byte $03   ; 3A 
    .byte $03   ; 3B 
    .byte $0F   ; 3C 
    .byte $1A   ; 3D 
    .byte $03   ; 3E 
    .byte $03   ; 3F 
    .byte $03   ; 40 
    .byte $03   ; 41 
    .byte $16   ; 42 
    .byte $03   ; 43 
    .byte $0F   ; 44 
    .byte $03   ; 45 
    .byte $17   ; 46 
    .byte $03   ; 47 
    .byte $03   ; 48 
    .byte $03   ; 49 
    .byte $03   ; 4A 
    .byte $03   ; 4B 
    .byte $03   ; 4C 
    .byte $43   ; 4D 
    .byte $03   ; 4E 
    .byte $03   ; 4F 
    .byte $00   ; 50 
    .byte $83   ; 51 
    .byte $03   ; 52 
    .byte $03   ; 53 
    .byte $83   ; 54 
    .byte $8F   ; 55 
    .byte $03   ; 56 
    .byte $03   ; 57 
    .byte $03   ; 58 
    .byte $03   ; 59 
    .byte $00   ; 5A 
    .byte $03   ; 5B 
    .byte $03   ; 5C 
    .byte $0F   ; 5D 
    .byte $0F   ; 5E 
    .byte $03   ; 5F 
    .byte $03   ; 60 
    .byte $0F   ; 61 
    .byte $03   ; 62 
    .byte $80   ; 63 
    .byte $03   ; 64 
    .byte $83   ; 65 
    .byte $0F   ; 66 
    .byte $03   ; 67 
    .byte $0F   ; 68 
    .byte $03   ; 69 
    .byte $00   ; 6A 
    .byte $03   ; 6B 
    .byte $03   ; 6C 
    .byte $03   ; 6D 
    .byte $97   ; 6E 
    .byte $03   ; 6F 
    .byte $07   ; 70 
    .byte $03   ; 71 
    .byte $03   ; 72 
    .byte $03   ; 73 
    .byte $03   ; 74 
    .byte $03   ; 75 
    .byte $09   ; 76 
    .byte $13   ; 77 
    .byte $16   ; 78 
    .byte $03   ; 79 
    .byte $03   ; 7A 
    .byte $83   ; 7B 
    .byte $03   ; 7C 
    .byte $03   ; 7D 
    .byte $83   ; 7E 
    .byte $03   ; 7F 

    .byte $05   ; 00 
    .byte $05   ; 01 
    .byte $00   ; 02 
    .byte $00   ; 03 
    .byte $00   ; 04 
    .byte $00   ; 05 
    .byte $05   ; 06 
    .byte $20   ; 07 
    .byte $00   ; 08 
    .byte $27   ; 09 
    .byte $15   ; 0A 
    .byte $01   ; 0B 
    .byte $17   ; 0C 
    .byte $17   ; 0D 
    .byte $01   ; 0E 
    .byte $27   ; 0F 
    .byte $17   ; 10 
    .byte $01   ; 11 
    .byte $00   ; 12 
    .byte $00   ; 13 
    .byte $00   ; 14 
    .byte $05   ; 15 
    .byte $01   ; 16 
    .byte $03   ; 17 
    .byte $05   ; 18 
    .byte $05   ; 19 
    .byte $00   ; 1A 
    .byte $20   ; 1B 
    .byte $17   ; 1C 
    .byte $27   ; 1D 
    .byte $00   ; 1E 
    .byte $37   ; 1F 
    .byte $00   ; 20 
    .byte $20   ; 21 
    .byte $00   ; 22 
    .byte $10   ; 23 
    .byte $00   ; 24 
    .byte $00   ; 25 
    .byte $00   ; 26 
    .byte $00   ; 27 
    .byte $00   ; 28 
    .byte $05   ; 29 
    .byte $05   ; 2A 
    .byte $20   ; 2B 
    .byte $20   ; 2C 
    .byte $20   ; 2D 
    .byte $25   ; 2E 
    .byte $00   ; 2F 
    .byte $00   ; 30 
    .byte $01   ; 31 
    .byte $27   ; 32 
    .byte $00   ; 33 
    .byte $00   ; 34 
    .byte $05   ; 35 
    .byte $00   ; 36 
    .byte $00   ; 37 
    .byte $05   ; 38 
    .byte $27   ; 39 
    .byte $05   ; 3A 
    .byte $06   ; 3B 
    .byte $07   ; 3C 
    .byte $07   ; 3D 
    .byte $01   ; 3E 
    .byte $05   ; 3F 
    .byte $00   ; 40 
    .byte $00   ; 41 
    .byte $17   ; 42 
    .byte $01   ; 43 
    .byte $27   ; 44 
    .byte $05   ; 45 
    .byte $27   ; 46 
    .byte $00   ; 47 
    .byte $05   ; 48 
    .byte $05   ; 49 
    .byte $05   ; 4A 
    .byte $00   ; 4B 
    .byte $06   ; 4C 
    .byte $05   ; 4D 
    .byte $01   ; 4E 
    .byte $00   ; 4F 
    .byte $17   ; 50 
    .byte $00   ; 51 
    .byte $00   ; 52 
    .byte $00   ; 53 
    .byte $00   ; 54 
    .byte $37   ; 55 
    .byte $00   ; 56 
    .byte $05   ; 57 
    .byte $05   ; 58 
    .byte $00   ; 59 
    .byte $27   ; 5A 
    .byte $05   ; 5B 
    .byte $05   ; 5C 
    .byte $17   ; 5D 
    .byte $27   ; 5E 
    .byte $05   ; 5F 
    .byte $00   ; 60 
    .byte $17   ; 61 
    .byte $01   ; 62 
    .byte $27   ; 63 
    .byte $00   ; 64 
    .byte $00   ; 65 
    .byte $27   ; 66 
    .byte $00   ; 67 
    .byte $37   ; 68 
    .byte $00   ; 69 
    .byte $17   ; 6A 
    .byte $00   ; 6B 
    .byte $04   ; 6C 
    .byte $01   ; 6D 
    .byte $37   ; 6E 
    .byte $05   ; 6F 
    .byte $20   ; 70 
    .byte $00   ; 71 
    .byte $00   ; 72 
    .byte $00   ; 73 
    .byte $00   ; 74 
    .byte $00   ; 75 
    .byte $20   ; 76 
    .byte $20   ; 77 
    .byte $15   ; 78 
    .byte $00   ; 79 
    .byte $00   ; 7A 
    .byte $01   ; 7B 
    .byte $05   ; 7C 
    .byte $04   ; 7D 
    .byte $00   ; 7E 
    .byte $00   ; 7F 



_off010_9300_00:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $1A, $37, $12   ; 
    .byte $0F, $17, $37, $12   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0C, $1C, $2C   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $01   ; index 00
    .byte $04   ; index 40
    .byte $05   ; index 80
    .byte $06   ; index C0



    .byte $8D   ; ram_pos_Y_link



    .byte $57   ; ram_6BA7
    .byte $49   ; ram_6BA8
    .byte $99   ; ram_6BA9
    .byte $69   ; ram_6BAA
    .byte $00   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $77   ; ram_6BAD
    .byte $20 + $0A   ; ram_6BAE
    .word ram_067F
    .byte $00   ; 
    .byte $1D   ; 
    .byte $23   ; 
    .byte $49   ; 
    .byte $79   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $2A   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 



; HUD minimap ram_6BCD
    .dbyt $2062 ; 
    .byte $00 + $40 + $08   ; 
    .byte $F5   ; 

    .dbyt $2082 ; 
    .byte $00 + $40 + $08   ; 
    .byte $F5   ; 

    .dbyt $20A2 ; 
    .byte $00 + $40 + $08   ; 
    .byte $F5   ; 

    .dbyt $20C2 ; 
    .byte $00 + $40 + $08   ; 
    .byte $F5   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 08 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 10 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 18 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 20 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 28 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 30 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 38 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 40 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 48 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 50 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 58 
    .byte $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_93FC_01:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $0C, $1C, $2C   ; 
    .byte $0F, $12, $1C, $2C   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0C, $1C, $2C   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $C9   ; ram_6BA7
    .byte $AC   ; ram_6BA8
    .byte $89   ; ram_6BA9
    .byte $87   ; ram_6BAA
    .byte $04   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $73   ; ram_6BAD
    .byte $30 + $06   ; ram_6BAE
    .word ram_06FF
    .byte $01   ; 
    .byte $7F   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $35   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $08   ; 
    .byte $2D   ; 
    .byte $3F   ; 
    .byte $0D   ; 
    .byte $18   ; 
    .byte $10   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2084 ; 
    .byte $00 + $00 + $05   ; 
    .byte $67, $FF, $24, $FB, $FB   ; 

    .dbyt $20A3 ; 
    .byte $00 + $00 + $05   ; 
    .byte $67, $FF, $FF, $FF, $67   ; 

    .dbyt $20C4 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FB, $FF, $FB   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $0C, $1C, $2C   ; 
    .byte $0F, $12, $1C, $2C   ; 
; 08 
    .byte $0F, $0C, $0C, $1C   ; 
    .byte $0F, $11, $0C, $1C   ; 
; 10 
    .byte $0F, $0F, $0C, $0C   ; 
    .byte $0F, $02, $0C, $0C   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $0C, $1C, $2C   ; 
    .byte $0F, $12, $1C, $2C   ; 
; 48 
    .byte $0F, $0C, $0C, $1C   ; 
    .byte $0F, $11, $0C, $1C   ; 
; 50 
    .byte $0F, $0F, $0C, $0C   ; 
    .byte $0F, $02, $0C, $0C   ; 
; 58 
    .byte $0F, $0F, $0F, $0C   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_94F8_02:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $02, $12, $22   ; 
    .byte $0F, $16, $12, $22   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $02, $12, $22   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $0A   ; ram_6BAB
    .byte $B0   ; ram_6BAC
    .byte $7D   ; ram_6BAD
    .byte $00 + $0D   ; ram_6BAE
    .word ram_06FF
    .byte $02   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $0E   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $02   ; 
    .byte $83   ; 
    .byte $FF   ; 
    .byte $7E   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2065 ; 
    .byte $00 + $00 + $03   ; 
    .byte $67, $FF, $FB   ; 

    .dbyt $2086 ; 
    .byte $00 + $00 + $02   ; 
    .byte $FF, $FF   ; 

    .dbyt $20A6 ; 
    .byte $00 + $00 + $02   ; 
    .byte $FF, $FF   ; 

    .dbyt $20C4 ; 
    .byte $00 + $00 + $04   ; 
    .byte $67, $FF, $FF, $67   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $02, $12, $22   ; 
    .byte $0F, $16, $12, $22   ; 
; 08 
    .byte $0F, $01, $02, $12   ; 
    .byte $0F, $17, $02, $12   ; 
; 10 
    .byte $0F, $0F, $01, $02   ; 
    .byte $0F, $06, $01, $02   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $02, $12, $22   ; 
    .byte $0F, $16, $12, $22   ; 
; 48 
    .byte $0F, $01, $02, $12   ; 
    .byte $0F, $17, $02, $12   ; 
; 50 
    .byte $0F, $0F, $01, $02   ; 
    .byte $0F, $06, $01, $02   ; 
; 58 
    .byte $0F, $0F, $0F, $01   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_95F4_03:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $0B, $1B, $2B   ; 
    .byte $0F, $16, $1B, $2B   ; 

    .byte $0F, $29, $37, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0B, $1B, $2B   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $0C   ; ram_6BAB
    .byte $C0   ; ram_6BAC
    .byte $7C   ; ram_6BAD
    .byte $30 + $0D   ; ram_6BAE
    .word ram_06FF
    .byte $03   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $4D   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $0E   ; 
    .byte $2C   ; 
    .byte $3F   ; 
    .byte $0D   ; 
    .byte $1C   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2084 ; 
    .byte $00 + $00 + $04   ; 
    .byte $67, $FF, $24, $FB   ; 

    .dbyt $20A3 ; 
    .byte $00 + $00 + $05   ; 
    .byte $FF, $FF, $FF, $FF, $FF   ; 

    .dbyt $20C3 ; 
    .byte $00 + $00 + $04   ; 
    .byte $67, $24, $FF, $FB   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $0B, $1B, $2B   ; 
    .byte $0F, $16, $1B, $2B   ; 
; 08 
    .byte $0F, $0B, $0B, $1B   ; 
    .byte $0F, $17, $0B, $1B   ; 
; 10 
    .byte $0F, $0F, $0B, $0B   ; 
    .byte $0F, $06, $0B, $0B   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $0B, $1B, $2B   ; 
    .byte $0F, $16, $1B, $2B   ; 
; 48 
    .byte $0F, $0B, $0B, $1B   ; 
    .byte $0F, $17, $0B, $1B   ; 
; 50 
    .byte $0F, $0F, $0B, $0B   ; 
    .byte $0F, $06, $0B, $0B   ; 
; 58 
    .byte $0F, $0F, $0F, $0B   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_96F0_04:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $12, $18, $28   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0F, $18, $28   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $DC   ; ram_6BA7
    .byte $99   ; ram_6BA8
    .byte $88   ; ram_6BA9
    .byte $89   ; ram_6BAA
    .byte $06   ; ram_6BAB
    .byte $10   ; ram_6BAC
    .byte $71   ; ram_6BAD
    .byte $00 + $03   ; ram_6BAE
    .word ram_06FF
    .byte $04   ; 
    .byte $60   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $13   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $FD   ; 
    .byte $B7   ; 
    .byte $D2   ; 
    .byte $C0   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2064 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FF, $67, $FF, $FF   ; 

    .dbyt $2084 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FF, $FF, $FB   ; 

    .dbyt $20A4 ; 
    .byte $00 + $00 + $02   ; 
    .byte $FF, $FB   ; 

    .dbyt $20C4 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FB, $FF, $67   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $12, $18, $28   ; 
; 08 
    .byte $0F, $08, $08, $18   ; 
    .byte $0F, $11, $08, $18   ; 
; 10 
    .byte $0F, $0F, $08, $08   ; 
    .byte $0F, $02, $08, $08   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $12, $18, $28   ; 
; 48 
    .byte $0F, $08, $08, $18   ; 
    .byte $0F, $11, $08, $18   ; 
; 50 
    .byte $0F, $0F, $08, $08   ; 
    .byte $0F, $02, $08, $08   ; 
; 58 
    .byte $0F, $0F, $0F, $08   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_97EC_05:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $16, $1A, $2A   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0A, $1A, $2A   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $87   ; ram_6BA7
    .byte $C8   ; ram_6BA8
    .byte $8A   ; ram_6BA9
    .byte $89   ; ram_6BAA
    .byte $02   ; ram_6BAB
    .byte $F0   ; ram_6BAC
    .byte $76   ; ram_6BAD
    .byte $10 + $04   ; ram_6BAE
    .word ram_06FF
    .byte $05   ; 
    .byte $07   ; 
    .byte $04   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $24   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $72   ; 
    .byte $A6   ; 
    .byte $EF   ; 
    .byte $7F   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2064 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FB, $67, $FF, $FB   ; 

    .dbyt $2084 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FF, $67, $67, $FF   ; 

    .dbyt $20A5 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FB, $FF, $FF   ; 

    .dbyt $20C4 ; 
    .byte $00 + $00 + $04   ; 
    .byte $67, $67, $FF, $FF   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $16, $1A, $2A   ; 
; 08 
    .byte $0F, $0A, $0A, $1A   ; 
    .byte $0F, $17, $0A, $1A   ; 
; 10 
    .byte $0F, $0F, $0A, $0A   ; 
    .byte $0F, $06, $0A, $0A   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $16, $1A, $2A   ; 
; 48 
    .byte $0F, $0A, $0A, $1A   ; 
    .byte $0F, $17, $0A, $1A   ; 
; 50 
    .byte $0F, $0F, $0A, $0A   ; 
    .byte $0F, $06, $0A, $0A   ; 
; 58 
    .byte $0F, $0F, $0F, $0A   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_98E8_06:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $16, $18, $28   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $08, $18, $28   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $0D   ; ram_6BAB
    .byte $C8   ; ram_6BAC
    .byte $79   ; ram_6BAD
    .byte $00 + $0C   ; ram_6BAE
    .word ram_06FF
    .byte $06   ; 
    .byte $08   ; 
    .byte $75   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $1C   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $7F   ; 
    .byte $F1   ; 
    .byte $D3   ; 
    .byte $C0   ; 
    .byte $F0   ; 
    .byte $60   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2063 ; 
    .byte $00 + $00 + $06   ; 
    .byte $FB, $FF, $FF, $FF, $FF, $FB   ; 

    .dbyt $2083 ; 
    .byte $00 + $00 + $06   ; 
    .byte $FF, $FF, $FB, $24, $FF, $67   ; 

    .dbyt $20A3 ; 
    .byte $00 + $00 + $01   ; 
    .byte $FF   ; 

    .dbyt $20C3 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FF, $FB, $FF   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $16, $18, $28   ; 
; 08 
    .byte $0F, $08, $08, $18   ; 
    .byte $0F, $17, $08, $18   ; 
; 10 
    .byte $0F, $0F, $08, $08   ; 
    .byte $0F, $06, $08, $08   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $08, $18, $28   ; 
    .byte $0F, $16, $18, $28   ; 
; 48 
    .byte $0F, $08, $08, $18   ; 
    .byte $0F, $17, $08, $18   ; 
; 50 
    .byte $0F, $0F, $08, $08   ; 
    .byte $0F, $06, $08, $08   ; 
; 58 
    .byte $0F, $0F, $0F, $08   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_99E4_07:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $12, $1A, $2A   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0A, $1A, $2A   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $0D   ; ram_6BAB
    .byte $C8   ; ram_6BAC
    .byte $79   ; ram_6BAD
    .byte $20 + $0B   ; ram_6BAE
    .word ram_077F
    .byte $07   ; 
    .byte $7B   ; 
    .byte $4A   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $2A   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $7F   ; 
    .byte $FF   ; 
    .byte $B7   ; 
    .byte $E6   ; 
    .byte $C2   ; 
    .byte $82   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2063 ; 
    .byte $00 + $00 + $06   ; 
    .byte $FB, $FF, $67, $FF, $FF, $67   ; 

    .dbyt $2083 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FF, $FF, $FF, $67   ; 

    .dbyt $20A3 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FF, $FF, $FB, $FB   ; 

    .dbyt $20C3 ; 
    .byte $00 + $00 + $06   ; 
    .byte $FF, $FF, $FF, $67, $67, $67   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $12, $1A, $2A   ; 
; 08 
    .byte $0F, $0A, $0A, $1A   ; 
    .byte $0F, $11, $0A, $1A   ; 
; 10 
    .byte $0F, $0F, $0A, $0A   ; 
    .byte $0F, $02, $0A, $0A   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $0A, $1A, $2A   ; 
    .byte $0F, $12, $1A, $2A   ; 
; 48 
    .byte $0F, $0A, $0A, $1A   ; 
    .byte $0F, $11, $0A, $1A   ; 
; 50 
    .byte $0F, $0F, $0A, $0A   ; 
    .byte $0F, $02, $0A, $0A   ; 
; 58 
    .byte $0F, $0F, $0F, $0A   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_9AE0_08:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $22, $10, $30   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $00, $10, $30   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $0A   ; ram_6BAB
    .byte $B0   ; ram_6BAC
    .byte $7E   ; ram_6BAD
    .byte $20 + $0C   ; ram_6BAE
    .word ram_077F
    .byte $08   ; 
    .byte $2F   ; 
    .byte $0F   ; 
    .byte $6F   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $3C   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $18   ; 
    .byte $3D   ; 
    .byte $5D   ; 
    .byte $FF   ; 
    .byte $55   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2065 ; 
    .byte $00 + $00 + $03   ; 
    .byte $FB, $FF, $FB   ; 

    .dbyt $2083 ; 
    .byte $00 + $00 + $05   ; 
    .byte $FB, $FF, $FB, $FF, $FB   ; 

    .dbyt $20A3 ; 
    .byte $00 + $00 + $05   ; 
    .byte $67, $FF, $FF, $FF, $FB   ; 

    .dbyt $20C4 ; 
    .byte $00 + $00 + $04   ; 
    .byte $FB, $FB, $FF, $FB   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $22, $10, $30   ; 
; 08 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $12, $00, $10   ; 
; 10 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $02, $00, $00   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $22, $10, $30   ; 
; 48 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $12, $00, $10   ; 
; 50 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $02, $00, $00   ; 
; 58 
    .byte $0F, $0F, $0F, $00   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



_off010_9BDC_09:
; default palette
    .dbyt $3F00 ; 
    .byte $00 + $20   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $16, $27, $36   ; 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $16, $10, $30   ; 

    .byte $0F, $29, $27, $17   ; 
    .byte $0F, $02, $22, $30   ; 
    .byte $0F, $16, $27, $30   ; 
    .byte $0F, $0F, $10, $30   ; 

    .byte $FF   ; end token



; enemy counter ram_6BA2 based on ram_69FE_map_data
    .byte $03   ; index 00
    .byte $05   ; index 40
    .byte $06   ; index 80
    .byte $08   ; index C0



    .byte $DD   ; ram_pos_Y_link



    .byte $89   ; ram_6BA7
    .byte $D6   ; ram_6BA8
    .byte $26   ; ram_6BA9
    .byte $2C   ; ram_6BAA
    .byte $04   ; ram_6BAB
    .byte $00   ; ram_6BAC
    .byte $76   ; ram_6BAD
    .byte $30 + $02   ; ram_6BAE
    .word ram_077F
    .byte $09   ; 
    .byte $60   ; 
    .byte $70   ; 
    .byte $72   ; 
    .byte $75   ; 
    .byte $67   ; 
    .byte $77   ; 
    .byte $00   ; 
    .byte $4F   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $42   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $7C   ; 
    .byte $FF   ; 
    .byte $EE   ; 
    .byte $FF   ; 
    .byte $FF   ; 
    .byte $EE   ; 
    .byte $FF   ; 
    .byte $7C   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



; HUD minimap ram_6BCD
    .dbyt $2062 ; 
    .byte $00 + $00 + $08   ; 
    .byte $FB, $FF, $FF, $FF, $FF, $FF, $FF, $FB   ; 

    .dbyt $2082 ; 
    .byte $00 + $00 + $08   ; 
    .byte $FF, $FF, $67, $FF, $FF, $67, $FF, $FF   ; 

    .dbyt $20A2 ; 
    .byte $00 + $40 + $08   ; 
    .byte $FF   ; 

    .dbyt $20C3 ; 
    .byte $00 + $00 + $06   ; 
    .byte $FF, $67, $FF, $FF, $67, $FF   ; 

    .byte $FF   ; end token
; filling with FF bytes up to the end of the range
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



; custom palette ram_6BFA (see 0x006D4C)
; 00 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $16, $10, $30   ; 
; 08 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $17, $00, $10   ; 
; 10 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $06, $00, $00   ; 
; 18 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 20 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $00, $10, $30   ; 
; 28 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $00, $00, $10   ; 
; 30 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $0F, $00, $00   ; 
; 38 
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 40 
    .byte $0F, $00, $10, $30   ; 
    .byte $0F, $16, $10, $30   ; 
; 48 
    .byte $0F, $00, $00, $10   ; 
    .byte $0F, $17, $00, $10   ; 
; 50 
    .byte $0F, $0F, $00, $00   ; 
    .byte $0F, $06, $00, $00   ; 
; 58 
    .byte $0F, $0F, $0F, $00   ; 
    .byte $0F, $0F, $0F, $0F   ; 
; 60 
    .byte $0F, $06, $17, $16   ; 
    .byte $0F, $06, $17, $16   ; 
; 68 
    .byte $0F, $07, $06, $16   ; 
    .byte $0F, $07, $06, $16   ; 
; 70 
    .byte $0F, $0F, $07, $06   ; 
    .byte $0F, $0F, $07, $06   ; 
; 78
    .byte $0F, $0F, $0F, $0F   ; 
    .byte $0F, $0F, $0F, $0F   ; 



ofs_9CD8_bank_s1_asm_export:
.include "copy_bank_s1.asm"



; 0x019D76-0x01C00F
.org $9D66



; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



tbl_A000_ppu_data:
; see con_ppu_buf
    .word ram_0302_ppu_buffer  ; 00 con_ppu_buf_00
    .word _off000_A3FE_02_guide
    .word _off000_A2B4_04_continue
    .word _off000_bat_6814_06
    .word _off000_A28E_08
    .word _off000_A296_0A
    .word _off000_bat_681C_0C_level_text
    .word _off000_A2D3_0E_hud
    .word _off000_A869_10_title_screen
    .word _off000_bat_67F0_12
    .word _off000_A100_14
    .word _off000_A183_16
    .word ram_6B7E_palette_buffer ; 18
    .word ram_0302_ppu_buffer  ; 1A unused, index not found
    .word ram_0302_ppu_buffer  ; 1C unused, index not found
    .word _off000_A21D_1E
    .word _off000_A245_20
    .word _off000_A24D_22
    .word _off000_A255_24
    .word _off000_A269_26
    .word ram_0302_ppu_buffer  ; 28 unused, index not found
    .word _off000_A226_2A
    .word _off000_A3C8_2C
    .word _off000_bat_681C_2E   ; 2E unused, index not found
    .word _off000_A316_30
    .word _off000_A323_32
    .word _off000_A337_34
    .word _off000_A202_36
    .word _off000_A348_38
    .word _off000_A350_3A
    .word _off000_A360_3C
    .word _off000_A25D_3E_cave_palette
    .word _off000_A378_40
    .word _off000_A39C_42
    .word ram_6BCD  ; 44
    .word _off000_A3D0_46_game_over
    .word _off000_A3B0_48
    .word _off000_A3B9_4A
    .word _off000_A3BE_4C
    .word _off000_A3C3_4E
    .word _off000_A22F_50
    .word _off000_bat_6847_52
    .word _off000_bat_684F_54
    .word _off000_bat_6859_56
    .word _off000_bat_6865_58
    .word _off000_A235_5A
    .word _off000_bat_6873_5C_triforce_text
    .word _off000_A3E8_5E
    .word _off000_A3F4_60
    .word _off000_A3F9_62
    .word ram_0302_ppu_buffer  ; 64 unused, index not found
    .word ram_0302_ppu_buffer  ; 66 unused, index not found
    .word ram_0302_ppu_buffer  ; 68 unused, index not found
    .word _off000_A20A_6A
    .word _off000_A29E_6C
    .word ram_0302_ppu_buffer  ; 6E unused, index not found
    .word ram_0302_ppu_buffer  ; 70 unused, index not found
    .word ram_0302_ppu_buffer  ; 72 unused, index not found
    .word ram_0302_ppu_buffer  ; 74 unused, index not found
    .word _off000_A2A6_76
    .word _off000_A272_78
    .word _off000_A27E_7A
    .word _off000_A286_7C
    .word ram_0302_ppu_buffer  ; 7E unused, index not found



sub_0x01A090_write_buffer_to_ppu:
    LDX ram_ppu_load_index
    LDA tbl_A000_ppu_data,X
    STA ram_0000_t11_ppu_data
    LDA tbl_A000_ppu_data + $01,X
    STA ram_0000_t11_ppu_data + $01
    JSR sub_A0F6_write_to_ppu
    LDA #$3F
    STA ram_0300_useless
    LDX #$00
    STX ram_ppu_load_index  ; con_ppu_buf_00
    STX ram_005C
    STX ram_0301_buffer_index
    DEX ; FF
    STX ram_0302_ppu_buffer
    RTS



bra_A0A2_loop:
    PHA ; push ppu_hi
    STA $2006
    INY
    LDA (ram_0000_t11_ppu_data),Y
    STA $2006
    INY
    LDA (ram_0000_t11_ppu_data),Y
    ASL
    PHA
    LDA ram_for_2000
    ORA #$04    ; write vertically
    BCS bra_A0B9
    AND #$FB    ; write horisontally
bra_A0B9:
    STA $2000
    STA ram_for_2000
    PLA
    ASL
    PHP
    BCC bra_A0C6
    ORA #$02
    INY
bra_A0C6:
    PLP
    CLC
    BNE bra_A0CB
    SEC
bra_A0CB:
    ROR
    LSR
    TAX
bra_A0CE_loop:
    BCS bra_A0D1_write_the_same_byte
    INY
bra_A0D1_write_the_same_byte:
    LDA (ram_0000_t11_ppu_data),Y
    STA $2007
    DEX
    BNE bra_A0CE_loop
; X = 00
    PLA ; pull ppu_hi
    CMP #$3F
    BNE bra_A0EA_not_palette
    STA $2006
    STX $2006
    STX $2006
    STX $2006
bra_A0EA_not_palette:
    SEC
    TYA
    ADC ram_0000_t11_ppu_data
    STA ram_0000_t11_ppu_data
    LDA #$00
    ADC ram_0000_t11_ppu_data + $01
    STA ram_0000_t11_ppu_data + $01
sub_A0F6_write_to_ppu:
    LDX $2002
    LDY #$00
    LDA (ram_0000_t11_ppu_data),Y
    BPL bra_A0A2_loop
; FF
    RTS



_off000_A100_14:
; con_ppu_buf_14
    .dbyt $23C0 ; 
    .byte $00 + $40 + $3F   ; 
    .byte $00   ; 

    .dbyt $23D4 ; 
    .byte $00 + $00 + $03   ; 
    .byte $40, $50, $50   ; 

    .dbyt $23DC ; 
    .byte $00 + $00 + $03   ; 
    .byte $44, $55, $55   ; 

    .dbyt $23E4 ; 
    .byte $00 + $00 + $03   ; 
    .byte $44, $55, $55   ; 

    .dbyt $20A8 ; 
    .byte $0F   ; 
    .byte $62, $24, $1C, $24, $0E, $24, $15, $24, $0E, $24, $0C, $24, $1D, $24, $62   ; 

    .dbyt $2103 ; 
    .byte $01   ; 
    .byte $69   ; 

    .dbyt $2104 ; 
    .byte $00 + $40 + $18   ; 
    .byte $6A   ; 

    .dbyt $211C ; 
    .byte $00 + $00 + $01   ; 
    .byte $6B   ; 

    .dbyt $2123 ; 
    .byte $80 + $40 + $10   ; 
    .byte $6C   ; 

    .dbyt $213C ; 
    .byte $80 + $40 + $10   ; 
    .byte $6C   ; 

    .dbyt $2323 ; 
    .byte $00 + $00 + $01   ; 
    .byte $6E   ; 

    .dbyt $2324 ; 
    .byte $00 + $40 + $18   ; 
    .byte $6A   ; 

    .dbyt $233C ; 
    .byte $00 + $00 + $01   ; 
    .byte $6D   ; 

    .dbyt $210A ; 
    .byte $00 + $00 + $06   ; 
    .byte $24, $17, $0A, $16, $0E, $24   ; 

    .dbyt $2113 ; 
    .byte $00 + $00 + $06   ; 
    .byte $24, $15, $12, $0F, $0E, $24   ; LIFE

    .dbyt $22A6 ; 
    .byte $00 + $00 + $12   ; 
    .byte $1B, $0E, $10, $12, $1C, $1D, $0E, $1B, $24, $22, $18, $1E, $1B, $24, $17, $0A   ; 
    .byte $16, $0E   ; 

    .dbyt $22E6 ; 
    .byte $00 + $00 + $10   ; 
    .byte $0E, $15, $12, $16, $12, $17, $0A, $1D, $12, $18, $17, $24, $16, $18, $0D, $0E   ; 

    .byte $FF   ; end token



_off000_A183_16:
; con_ppu_buf_16
    .dbyt $2205 ; 
    .byte $00 + $00 + $01   ; 
    .byte $69   ; 

    .dbyt $2206 ; 
    .byte $00 + $40 + $15   ; 
    .byte $6A   ; 

    .dbyt $221B ; 
    .byte $00 + $00 + $01   ; 
    .byte $6B   ; 

    .dbyt $2225 ; 
    .byte $80 + $40 + $07   ; 
    .byte $6C   ; 

    .dbyt $223B ; 
    .byte $80 + $40 + $07   ; 
    .byte $6C   ; 

    .dbyt $2305 ; 
    .byte $00 + $00 + $01   ; 
    .byte $6E   ; 

    .dbyt $2306 ; 
    .byte $00 + $40 + $15   ; 
    .byte $6A   ; 

    .dbyt $231B ; 
    .byte $00 + $00 + $01   ; 
    .byte $6D   ; 

    .dbyt $2226 ; 
    .byte $00 + $00 + $15   ; 
    .byte $0A, $24, $0B, $24, $0C, $24, $0D, $24, $0E, $24, $0F, $24, $10, $24, $11, $24   ; 
    .byte $12, $24, $13, $24, $14   ; 

    .dbyt $2266 ; 
    .byte $00 + $00 + $15   ; 
    .byte $15, $24, $16, $24, $17, $24, $18, $24, $19, $24, $1A, $24, $1B, $24, $1C, $24   ; 
    .byte $1D, $24, $1E, $24, $1F   ; 

    .dbyt $22A6 ; 
    .byte $00 + $00 + $15   ; 
    .byte $20, $24, $21, $24, $22, $24, $23, $24, $62, $24, $63, $24, $28, $24, $29, $24   ; 
    .byte $2A, $24, $2B, $24, $2C   ; 

    .dbyt $22E6 ; 
    .byte $00 + $00 + $13   ; 
    .byte $00, $24, $01, $24, $02, $24, $03, $24, $04, $24, $05, $24, $06, $24, $07, $24   ; 
    .byte $08, $24, $09   ; 

    .byte $FF   ; end token



_off000_A202_36:
; con_ppu_buf_36
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $16, $2C, $3C   ; 

    .byte $FF   ; end token



_off000_A20A_6A:
; con_ppu_buf_6A
    .dbyt $3F08 ; 
    .byte $00 + $00 + $08   ; 
    .byte $0F, $22, $10, $00   ; 
    .byte $0F, $2A, $10, $00   ; 

    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $27, $06, $16   ; 

    .byte $FF   ; end token



_off000_A21D_1E:
; con_ppu_buf_1E
    .dbyt $21A4 ; 
    .byte $00 + $40 + $18   ; 
    .byte $24   ; 

    .dbyt $21C4 ; 
    .byte $00 + $40 + $18   ; 
    .byte $24   ; 

    .byte $FF   ; end token



_off000_A226_2A:
; con_ppu_buf_2A
    .dbyt $21E4 ; 
    .byte $00 + $40 + $18   ; 
    .byte $24   ; 

    .dbyt $22C8 ; 
    .byte $00 + $40 + $0D   ; 
    .byte $24   ; 

    .byte $FF   ; end token



_off000_A22F_50:
; con_ppu_buf_50
    .dbyt $2ACF ; 
    .byte $00 + $00 + $02   ; 
    .byte $ED, $EE   ; 

    .byte $FF   ; end token



_off000_A235_5A:
; con_ppu_buf_5A
    .dbyt $2B6A ; 
    .byte $00 + $00 + $0C   ; 
    .byte $EB, $EF, $F1, $F1, $F1, $F1, $F1, $F1, $F1, $F1, $F0, $EC   ; 

    .byte $FF   ; end token



_off000_A245_20:
; con_ppu_buf_20
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $30, $00, $12   ; 

    .byte $FF   ; end token



_off000_A24D_22:
; con_ppu_buf_22
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $1A, $37, $12   ; 

    .byte $FF   ; end token



_off000_A255_24:
; con_ppu_buf_24
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $17, $37, $12   ; 

    .byte $FF   ; end token



_off000_A25D_3E_cave_palette:
; con_ppu_buf_cave_palette
    .dbyt $3F08 ; 
    .byte $00 + $00 + $08   ; 
    .byte $0F, $30, $00, $12   ; 
    .byte $0F, $07, $0F, $17   ; 

    .byte $FF   ; end token



_off000_A269_26:
; con_ppu_buf_26
    .dbyt $23D0 ; 
    .byte $00 + $40 + $20   ; 
    .byte $AA   ; 

    .dbyt $23F0 ; 
    .byte $00 + $40 + $10   ; 
    .byte $AA   ; 

    .byte $FF   ; end token



_off000_A272_78:
; con_ppu_buf_78
    .dbyt $3F08 ; 
    .byte $00 + $00 + $08   ; 
    .byte $0F, $30, $30, $30   ; 
    .byte $0F, $30, $30, $30   ; 

    .byte $FF   ; end token



_off000_A27E_7A:
; con_ppu_buf_7A
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $0F, $1C, $16   ; 

    .byte $FF   ; end token



_off000_A286_7C:
; con_ppu_buf_7C
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $2A, $1A, $0C   ; 

    .byte $FF   ; end token



_off000_A28E_08:
; con_ppu_buf_08
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $0A, $29, $30   ; 

    .byte $FF   ; end token



_off000_A296_0A:
; con_ppu_buf_0A
    .dbyt $3F1C ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $17, $27, $30   ; 

    .byte $FF   ; end token



_off000_A29E_6C:
; con_ppu_buf_6C
    .dbyt $22CD ; 
    .byte $00 + $00 + $04   ; 
    .byte $62, $01, $00, $00   ; 

    .byte $FF   ; end token



_off000_A2A6_76:
; con_ppu_buf_76
    .dbyt $22CB ; 
    .byte $00 + $00 + $0A   ; 
    .byte $62, $01, $24, $24, $24, $24, $24, $62, $05, $00   ; 

    .byte $FF   ; end token



_off000_A2B4_04_continue:
; con_ppu_buf_continue
    .dbyt $23C0 ; 
    .byte $00 + $40 + $3F   ; 
    .byte $00   ; 

    .dbyt $214A ; 
    .byte $00 + $00 + $08   ; 
    .byte $0C, $18, $17, $1D, $12, $17, $1E, $0E   ; CONTINUE

    .dbyt $21AA ; 
    .byte $00 + $00 + $04   ; 
    .byte $1C, $0A, $1F, $0E   ; SAVE

    .dbyt $220A ; 
    .byte $00 + $00 + $05   ; 
    .byte $1B, $0E, $1D, $1B, $22   ; RETRY

    .byte $FF   ; end token



_off000_A2D3_0E_hud:
; con_ppu_buf_hud
    .dbyt $23C2 ; 
    .byte $00 + $00 + $0E   ; 
    .byte $40, $00, $00, $44, $55, $55, $00, $00, $04, $00, $00, $44, $55, $55   ; 

    .dbyt $206F ; 
    .byte $00 + $00 + $0E   ; 
    .byte $69, $0B, $6B, $69, $0A, $6B, $24, $24, $62, $15, $12, $0F, $0E, $62   ; B A -LIFE-

    .dbyt $20CF ; 
    .byte $00 + $00 + $06   ; 
    .byte $6E, $6A, $6D, $6E, $6A, $6D   ; 

    .dbyt $208F ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $2091 ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $2092 ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $2094 ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $206B ; 
    .byte $80 + $00 + $04   ; 
    .byte $F7, $24, $F9, $61   ; 

    .byte $FF   ; end token



_off000_A316_30:
; con_ppu_buf_30
    .dbyt $2984 ; 
    .byte $00 + $00 + $09   ; 
    .byte $12, $17, $1F, $0E, $17, $1D, $18, $1B, $22   ; 

    .byte $FF   ; end token



_off000_A323_32:
; con_ppu_buf_32
    .dbyt $29C7 ; 
    .byte $00 + $00 + $04   ; 
    .byte $69, $6A, $6A, $6B   ; 

    .dbyt $29CF ; 
    .byte $00 + $00 + $01   ; 
    .byte $69   ; 

    .dbyt $29D0 ; 
    .byte $00 + $40 + $0B   ; 
    .byte $6A   ; 

    .dbyt $29DB ; 
    .byte $00 + $00 + $01   ; 
    .byte $6B   ; 

    .byte $FF   ; end token



_off000_A337_34:
; con_ppu_buf_34
    .dbyt $29E7 ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $29EA ; 
    .byte $80 + $40 + $02   ; 
    .byte $6C   ; 

    .dbyt $29EF ; 
    .byte $80 + $40 + $04   ; 
    .byte $6C   ; 

    .dbyt $29FB ; 
    .byte $80 + $40 + $04   ; 
    .byte $6C   ; 

    .byte $FF   ; end token



_off000_A348_38:
; con_ppu_buf_38
    .dbyt $2A27 ; 
    .byte $00 + $00 + $04   ; 
    .byte $6E, $6A, $6A, $6D   ; 

    .byte $FF   ; end token



_off000_A350_3A:
; con_ppu_buf_3A
    .dbyt $2A42 ; 
    .byte $00 + $00 + $0C   ; 
    .byte $1E, $1C, $0E, $24, $0B, $24, $0B, $1E, $1D, $1D, $18, $17   ; 

    .byte $FF   ; end token



_off000_A360_3C:
; con_ppu_buf_3C
    .dbyt $2A64 ; 
    .byte $00 + $00 + $08   ; 
    .byte $0F, $18, $1B, $24, $1D, $11, $12, $1C   ; 

    .dbyt $2A6F ; 
    .byte $00 + $00 + $01   ; 
    .byte $6E   ; 

    .dbyt $2A70 ; 
    .byte $00 + $40 + $0B   ; 
    .byte $6A   ; 

    .dbyt $2A7B ; 
    .byte $00 + $00 + $01   ; 
    .byte $6D   ; 

    .byte $FF   ; end token



_off000_A378_40:
; con_ppu_buf_40
    .dbyt $2B43 ; 
    .byte $00 + $00 + $07   ; 
    .byte $0C, $18, $16, $19, $0A, $1C, $1C   ; 

    .dbyt $2AA5 ; 
    .byte $00 + $00 + $03   ; 
    .byte $16, $0A, $19   ; 

    .dbyt $2A8C ; 
    .byte $00 + $00 + $10   ; 
    .byte $F5, $F5, $FD, $F5, $F5, $FD, $F5, $F5, $FD, $F5, $F5, $F5, $FD, $F5, $F5, $F5   ; 

    .byte $FF   ; end token



_off000_A39C_42:
; con_ppu_buf_42
    .dbyt $2BAC ; 
    .byte $00 + $00 + $10   ; 
    .byte $F5, $FE, $F5, $F5, $F5, $FE, $F5, $F5, $F5, $F5, $FE, $F5, $F5, $F5, $FE, $F5   ; 

    .byte $FF   ; end token



_off000_A3B0_48:
; con_ppu_buf_48
    .dbyt $2BD9 ; 
    .byte $00 + $40 + $03   ; 
    .byte $05   ; 

    .dbyt $2BDC ; 
    .byte $00 + $40 + $0B   ; 
    .byte $00   ; 

    .byte $FF   ; end token



_off000_A3B9_4A:
; con_ppu_buf_4A
    .dbyt $2BE9 ; 
    .byte $00 + $40 + $16   ; 
    .byte $55   ; 

    .byte $FF   ; end token



_off000_A3BE_4C:
; con_ppu_buf_4C
    .dbyt $2BA0 ; 
    .byte $00 + $40 + $20   ; 
    .byte $24   ; 

    .byte $FF   ; end token



_off000_A3C3_4E:
; con_ppu_buf_4E
    .dbyt $28E0 ; 
    .byte $00 + $40 + $20   ; 
    .byte $24   ; 

    .byte $FF   ; end token



_off000_A3C8_2C:
; con_ppu_buf_2C
    .dbyt $3F10 ; 
    .byte $00 + $00 + $04   ; 
    .byte $0F, $10, $30, $00   ; 

    .byte $FF   ; end token



_off000_A3D0_46_game_over:
; con_ppu_buf_46_game_over
    .dbyt $23E3 ; 
    .byte $00 + $00 + $03   ; 
    .byte $0F, $0F, $CF   ; 

    .dbyt $224C ; 
    .byte $00 + $00 + $0A   ; 
    .byte $10, $0A, $16, $0E, $24, $18, $1F, $0E, $1B, $24   ; GAME OVER

    .dbyt $226C ; 
    .byte $00 + $40 + $0A   ; 
    .byte $24   ; 

    .byte $FF   ; end token



_off000_A3E8_5E:
; con_ppu_buf_5E
    .dbyt $3F08 ; 
    .byte $00 + $00 + $08   ; 

    .byte $0F, $17, $16, $26   ; 
    .byte $0F, $17, $16, $26   ; 

    .byte $FF   ; end token



_off000_A3F4_60:
; con_ppu_buf_60
    .dbyt $23D0 ; 
    .byte $00 + $40 + $18   ; 
    .byte $FF   ; 

    .byte $FF   ; end token



_off000_A3F9_62:
; con_ppu_buf_62
    .dbyt $23E8 ; 
    .byte $00 + $40 + $18   ; 
    .byte $FF   ; 

    .byte $FF   ; end token



_off000_A3FE_02_guide:
; con_ppu_buf_guide
    .dbyt $2000 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2020 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2040 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2060 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2080 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E6, $E4, $E5, $24, $1D, $11, $0E, $24, $15, $0E, $10, $0E, $17, $0D   ; 
    .byte $24, $18, $0F, $24, $23, $0E, $15, $0D, $0A, $24, $E5, $E4, $E5, $E6, $24, $24   ; 

    .dbyt $20A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24   ; 

    .dbyt $20C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $20E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $16, $0A, $17, $22, $24, $24, $22, $0E, $0A, $1B, $1C, $24   ; 
    .byte $24, $0A, $10, $18, $24, $24, $19, $1B, $12, $17, $0C, $0E, $24, $E3, $24, $24   ; 

    .dbyt $2100 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $2120 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $0D, $0A, $1B, $14, $17, $0E, $1C, $1C, $24, $24, $24, $10   ; 
    .byte $0A, $17, $17, $18, $17, $24, $24, $1C, $1D, $18, $15, $0E, $24, $E3, $24, $24   ; 

    .dbyt $2140 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $2160 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $18, $17, $0E, $24, $18, $0F, $24, $1D, $11, $0E, $24, $1D   ; 
    .byte $1B, $12, $0F, $18, $1B, $0C, $0E, $24, $20, $12, $1D, $11, $24, $E3, $24, $24   ; 

    .dbyt $2180 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $21A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $19, $18, $20, $0E, $1B, $63, $24, $24, $24, $24, $19, $1B   ; 
    .byte $12, $17, $0C, $0E, $1C, $1C, $24, $23, $0E, $15, $0D, $0A, $24, $E3, $24, $24   ; 

    .dbyt $21C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $21E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $11, $0A, $0D, $24, $24, $18, $17, $0E, $24, $18, $0F, $24   ; 
    .byte $1D, $11, $0E, $24, $1D, $1B, $12, $0F, $18, $1B, $0C, $0E, $24, $E3, $24, $24   ; 

    .dbyt $2200 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $2220 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $20, $12, $1D, $11, $24, $20, $12, $1C, $0D, $18, $16, $63   ; 
    .byte $24, $1C, $11, $0E, $24, $0D, $12, $1F, $12, $0D, $0E, $0D, $24, $E2, $24, $24   ; 

    .dbyt $2240 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24, $F8, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24   ; 

    .dbyt $2260 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $12, $1D, $24, $12, $17, $1D, $18, $24, $24, $08, $24, $1E   ; 
    .byte $17, $12, $1D, $1C, $24, $1D, $18, $24, $11, $12, $0D, $0E, $24, $E3, $24, $24   ; 

    .dbyt $2280 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F8, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $22A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $12, $1D, $24, $0F, $1B, $18, $16, $24, $24, $24, $10, $0A   ; 
    .byte $17, $17, $18, $17, $24, $24, $0B, $0E, $0F, $18, $1B, $0E, $24, $E3, $24, $24   ; 

    .dbyt $22C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $22E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $1C, $11, $0E, $24, $20, $0A, $1C, $24, $0C, $0A, $19, $1D   ; 
    .byte $1E, $1B, $0E, $0D, $63, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24   ; 

    .dbyt $2300 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $F8, $24, $24, $F8, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $2320 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $24, $24, $10, $18, $24, $0F, $12, $17, $0D, $24, $1D, $11   ; 
    .byte $0E, $24, $24, $08, $24, $1E, $17, $12, $1D, $1C, $24, $24, $24, $E3, $24, $24   ; 

    .dbyt $2340 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $F8, $24, $24, $24, $24, $24, $F8, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $2360 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E2, $24, $24, $24, $24, $24, $15, $12, $17, $14, $24, $24, $1D, $18   ; 
    .byte $24, $1C, $0A, $1F, $0E, $24, $11, $0E, $1B, $63, $24, $24, $24, $E3, $24, $24   ; 

    .dbyt $2380 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24   ; 

    .dbyt $23A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4   ; 
    .byte $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $24   ; 

    .dbyt $23C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $FF, $FF, $00, $00, $00, $00, $FF, $FF, $FF, $0B, $0A, $0A, $0A, $0A, $0E, $FF   ; 
    .byte $FF, $00, $00, $4A, $5A, $52, $00, $FF, $FF, $00, $00, $00, $00, $58, $5A, $FF   ; 

    .dbyt $23E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $FF, $00, $00, $10, $00, $00, $00, $FF, $FF, $00, $00, $0A, $0A, $02, $00, $FF   ; 
    .byte $FF, $FA, $FA, $BA, $AA, $AA, $AA, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 

    .dbyt $2BD0 ; 
    .byte $00 + $00 + $02   ; 
    .byte $FF, $FF   ; 

    .dbyt $2BD6 ; 
    .byte $00 + $00 + $02   ; 
    .byte $FF, $FF   ; 

    .byte $FF   ; end token



_off000_A869_10_title_screen:
; con_ppu_buf_title_screen
    .dbyt $2000 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2020 ; 
    .byte $00 + $00 + $20   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 

    .dbyt $2040 ; 
    .byte $00 + $00 + $20   ; 
    .byte $E0, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D4, $E0   ; 

    .dbyt $2060 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DD   ; 

    .dbyt $2080 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $EE, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DB   ; 

    .dbyt $20A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DE, $D7, $24, $24, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5   ; 
    .byte $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $24, $24, $D6, $DB   ; 

    .dbyt $20C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $D7, $24, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24, $24, $D6, $DF   ; 

    .dbyt $20E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DE, $EE, $24, $24, $24, $E3, $24, $24, $71, $72, $73, $74, $75, $76, $77, $78   ; 
    .byte $79, $79, $79, $7A, $7B, $24, $24, $24, $24, $24, $E2, $24, $24, $24, $D6, $DB   ; 

    .dbyt $2100 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DE, $D8, $EF, $24, $24, $E2, $24, $7C, $7D, $7E, $7F, $80, $81, $82, $83, $84   ; 
    .byte $85, $86, $87, $88, $89, $8A, $8B, $24, $24, $24, $E3, $24, $24, $24, $D6, $DF   ; 

    .dbyt $2120 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DA, $D7, $24, $24, $E3, $24, $8C, $8D, $8E, $8F, $90, $91, $92, $93, $94   ; 
    .byte $95, $96, $97, $98, $99, $9A, $9B, $9C, $24, $24, $E2, $24, $24, $D4, $D9, $DB   ; 

    .dbyt $2140 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $D9, $EE, $24, $24, $E2, $24, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5   ; 
    .byte $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $24, $E3, $24, $24, $D6, $DB, $DF   ; 

    .dbyt $2160 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DE, $DB, $D7, $24, $24, $E3, $70, $AF, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7   ; 
    .byte $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $C0, $24, $E2, $24, $24, $D6, $DB, $DB   ; 

    .dbyt $2180 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DD, $D7, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $C1, $C2, $C3   ; 
    .byte $C4, $C5, $24, $24, $24, $24, $24, $24, $24, $24, $E3, $24, $24, $D6, $DB, $DF   ; 

    .dbyt $21A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DE, $DB, $EE, $24, $24, $E3, $24, $C6, $C7, $C8, $C8, $C8, $24, $C9, $CA, $CB   ; 
    .byte $CC, $CD, $C8, $C8, $C8, $C8, $E8, $E9, $D3, $24, $E2, $24, $24, $D6, $DB, $DB   ; 

    .dbyt $21C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DB, $D7, $24, $24, $E2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $CE   ; 
    .byte $CF, $24, $24, $24, $24, $24, $EA, $EB, $EC, $24, $E3, $24, $24, $D6, $DB, $DF   ; 

    .dbyt $21E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DB, $D7, $24, $24, $E3, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D1   ; 
    .byte $D2, $24, $24, $24, $24, $24, $24, $24, $24, $24, $E2, $24, $24, $D6, $DB, $DB   ; 

    .dbyt $2200 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $D8, $E1, $D5, $24, $E6, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5   ; 
    .byte $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E4, $E5, $E6, $24, $D4, $E1, $D9, $DD   ; 

    .dbyt $2220 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DA, $DC, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $F0, $01, $09   ; 
    .byte $08, $06, $24, $17, $12, $17, $1D, $0E, $17, $0D, $18, $24, $D6, $DC, $DB, $DF   ; 

    .dbyt $2240 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DA, $DC, $EE, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DE, $ED, $DD   ; 

    .dbyt $2260 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DC, $DA, $DE, $D7, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DE, $DB, $DD   ; 

    .dbyt $2280 ; 
    .byte $00 + $00 + $20   ; 
    .byte $E1, $D9, $DC, $ED, $E0, $EF, $24, $24, $19, $1E, $1C, $11, $24, $1C, $1D, $0A   ; 
    .byte $1B, $1D, $24, $0B, $1E, $1D, $1D, $18, $17, $24, $24, $24, $D6, $D8, $E1, $D9   ; 

    .dbyt $22A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DD, $ED, $DE, $D8, $E1, $E1, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $24   ; 
    .byte $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $D6, $DA, $DD, $ED   ; 

    .dbyt $22C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DD, $DB, $DE, $DA, $DC, $DD, $D8, $E0, $E0, $EF, $24, $24, $24, $24, $D4, $E0   ; 
    .byte $E0, $D5, $24, $24, $24, $24, $24, $24, $24, $24, $D4, $EF, $DA, $DA, $DF, $DB   ; 

    .dbyt $22E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DF, $DB, $DC, $DA, $DE, $DF, $DA, $DC, $DD, $DB, $26, $26, $26, $26, $DA, $DC   ; 
    .byte $DD, $ED, $E0, $E0, $EF, $24, $D4, $E0, $E0, $E0, $D9, $DB, $DA, $DA, $DF, $DB   ; 

    .dbyt $2300 ; 
    .byte $00 + $00 + $20   ; 
    .byte $ED, $D8, $E1, $D9, $DE, $D8, $E1, $D9, $DF, $DB, $26, $26, $26, $26, $DA, $DC   ; 
    .byte $D8, $E1, $D9, $DC, $D8, $E0, $D9, $DC, $DD, $DD, $D8, $E1, $E1, $D9, $DD, $ED   ; 

    .dbyt $2320 ; 
    .byte $00 + $00 + $20   ; 
    .byte $ED, $DA, $DD, $ED, $DE, $DA, $DC, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DE   ; 
    .byte $DA, $DC, $DB, $DE, $DA, $DD, $ED, $DC, $DC, $DD, $DA, $DC, $DC, $DB, $DD, $ED   ; 

    .dbyt $2340 ; 
    .byte $00 + $00 + $20   ; 
    .byte $ED, $DA, $DD, $D8, $E1, $DA, $DC, $DB, $DF, $DB, $26, $26, $26, $26, $DA, $D8   ; 
    .byte $D9, $DC, $DB, $DC, $DA, $D8, $E1, $D9, $DE, $DF, $DA, $D8, $E1, $E1, $D9, $E1   ; 

    .dbyt $2360 ; 
    .byte $00 + $00 + $20   ; 
    .byte $ED, $D9, $DF, $DA, $DC, $DA, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA   ; 
    .byte $ED, $DE, $D8, $E1, $E1, $D9, $DC, $DB, $DE, $D8, $E1, $D9, $DD, $DD, $DB, $DC   ; 

    .dbyt $2380 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DF, $DB, $DF, $DA, $DC, $DB, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA   ; 
    .byte $DB, $DD, $DA, $DE, $D8, $E1, $D9, $DB, $DE, $DA, $DD, $DB, $DE, $DF, $D8, $E1   ; 

    .dbyt $23A0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $DF, $DB, $DF, $DA, $DC, $DB, $DE, $DB, $DD, $DB, $26, $26, $26, $26, $DA, $DA   ; 
    .byte $DB, $DD, $DA, $DE, $DA, $DD, $DB, $DB, $DE, $DA, $DD, $DB, $DE, $DF, $DC, $DF   ; 

    .dbyt $23C0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $05, $05, $05, $05, $05, $05, $05, $05, $08, $6A, $5A, $5A, $5A, $5A, $9A, $22   ; 
    .byte $00, $66, $55, $55, $55, $55, $99, $00, $00, $6E, $5F, $55, $5D, $DF, $BB, $00   ; 

    .dbyt $23E0 ; 
    .byte $00 + $00 + $20   ; 
    .byte $00, $0A, $0A, $0A, $0A, $0A, $0A, $00, $00, $00, $C0, $30, $00, $00, $00, $00   ; 
    .byte $00, $00, $CC, $33, $00, $00, $00, $00, $00, $20, $FC, $F3, $00, $00, $F0, $F0   ; 

    .byte $FF   ; end token


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



.org $BF50
.segment "BANK_06i"
.include "copy_bank___BF50_BFF9.asm"



.out .sprintf("Free bytes in bank 06: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))



.segment "VECTORS_06"
    .word vec_0x01E494_NMI
    .word vec_inc_0x003F60_RESET
    .word $BFF0 ; this game doesn't use IRQ
