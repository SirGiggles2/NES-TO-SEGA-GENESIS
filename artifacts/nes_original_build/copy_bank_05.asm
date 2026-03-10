.segment "BANK_05"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000  ; for listing file
; 0x014010-0x01800F



.export loc_0x014010_pause_screen_handler
.export sub_0x0142B8
.export sub_0x01442E_screen_transition_handlers
.export sub_0x014531
.export ofs_main_script_1_0x014610_08_prepare_save_menu
.export ofs_main_script_1_0x01462A_0D
.export ofs_main_script_1_0x014638_10
.export ofs_main_script_1_0x01478B_04
.export sub_0x0147D6
.export sub_0x014939
.export sub_0x014A23
.export ofs_main_script_1_0x014A3F_11_death
.export sub_0x014ABD
.export loc_0x014B04_save_menu_handler
.export loc_0x014B9B
.export sub_0x014BB8
.export sub_0x014BCC
.export loc_0x014C8D_death_subroutines
.export sub_0x014EE7
.export sub_0x014F8B
.export sub_0x015034
.export ofs_main_script_1_0x015090_0B
.export ofs_main_script_1_0x0150A7_0C
.export ofs_main_script_1_0x01511A_09
.export sub_0x01518C
.export sub_0x015338
.export _off006_0x015BE8_00
.export _off006_0x015C1D_10
.export _off006_0x015C4E_20
.export _off006_0x015C90_30
.export _off006_0x015CD4_40
.export _off006_0x015D06_50
.export _off006_0x015D42_60
.export _off006_0x015D7D_70
.export _off006_0x015DB8_80
.export _off006_0x015DF6_90
.export _off006_0x015E37_A0
.export _off006_0x015E7C_B0
.export _off006_0x015EB9_C0
.export _off006_0x015EEF_D0
.export _off006_0x015F31_E0
.export _off006_0x015F65_F0
.export sub_0x016406
.export sub_0x016603
.export ofs_main_script_1_0x016843_12_triforce_collected
.export loc_0x016868
.export sub_0x0168EE_move_curtain
.export sub_0x016BD4
.export sub_0x016C17_set_block_address_pointer
.export ofs_002_0x017010_02
.export ofs_002_0x017019_03
.export ofs_002_0x017020_04
.export ofs_002_0x017026_05
.export ofs_002_0x01702D_06
.export ofs_002_0x01703A_07_draw_level_text
.export ofs_002_0x017046_08
.export sub_0x01706E
.export ofs_main_script_1_0x01708A_06
.export sub_0x0170C6
.export ofs_main_script_1_0x01710C_0A
.export sub_0x0171F6
.export sub_0x0172AA
.export sub_0x017404
.export sub_0x0174BC_check_battery_integrity
.export sub_0x0174F8_clear_memory
.export ofs_000_0x017527_01
.export ofs_000_0x017527_08
.export ofs_000_0x017532_00
.export ofs_000_0x017532_02
.export ofs_000_0x017532_03
.export ofs_000_0x017532_04
.export ofs_000_0x017532_05
.export ofs_000_0x017532_06
.export ofs_000_0x017532_07
.export sub_0x017569_disable_greyscale
.export sub_0x0175FB
.export sub_0x0177D8
.export sub_0x01782C
.export loc_0x01782C
.export sub_0x01784A



loc_0x014010_pause_screen_handler:
    JSR sub_8006_pause_screen_handler
    JMP loc_0x01ED99



sub_8006_pause_screen_handler:
    LDA ram_pause_script
    LDY ram_dungeon_level
    BEQ bra_8021_overworld
; if dungeon
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_dungeon_pause_handler_8056_00_RTS
    .word ofs_dungeon_pause_handler_8038_01
    .word ofs_dungeon_pause_handler_8057_02
    .word ofs_dungeon_pause_handler_805E_03
    .word ofs_dungeon_pause_handler_8062_04
    .word ofs_dungeon_pause_handler_8066_05
    .word ofs_dungeon_pause_handler_8076_06
    .word ofs_dungeon_pause_handler_80D4_07_inventory
    .word ofs_dungeon_pause_handler_810F_08



bra_8021_overworld:
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_overworld_pause_handler_8056_00_RTS
    .word ofs_overworld_pause_handler_819A_01_draw_triforce_triangles
    .word ofs_overworld_pause_handler_8038_02
    .word ofs_overworld_pause_handler_8057_03
    .word ofs_overworld_pause_handler_805E_04
    .word ofs_overworld_pause_handler_8062_05
    .word ofs_overworld_pause_handler_806C_06_draw_triforce_text
    .word ofs_overworld_pause_handler_8070_07
    .word ofs_overworld_pause_handler_80D4_08_inventory
    .word ofs_overworld_pause_handler_810F_09



ofs_dungeon_pause_handler_8038_01:
ofs_overworld_pause_handler_8038_02:
    JSR sub_0x01E607_hide_all_sprites
    JSR sub_bat_71DE_draw_dot_on_minimap
    JSR sub_0x01E689
    LDA #$EF
    STA ram_scroll_Y
    STA ram_005C
    LDA #$01
    JSR sub_8130
    INC ram_pause_script
    LDA #$2B
    STA ram_005E
    LDA #$7F
    STA ram_005D
ofs_dungeon_pause_handler_8056_00_RTS:
ofs_overworld_pause_handler_8056_00_RTS:
    RTS



ofs_dungeon_pause_handler_8057_02:
ofs_overworld_pause_handler_8057_03:
    LDA #con_ppu_buf_48
bra_8059:
    STA ram_ppu_load_index
loc_805B:
    INC ram_pause_script
    RTS



ofs_dungeon_pause_handler_805E_03:
ofs_overworld_pause_handler_805E_04:
    LDA #con_ppu_buf_4A
    BNE bra_8059    ; jmp



ofs_dungeon_pause_handler_8062_04:
ofs_overworld_pause_handler_8062_05:
    LDA #con_ppu_buf_4C
    BNE bra_8059    ; jmp



ofs_dungeon_pause_handler_8066_05:
    JSR sub_B23A
    JMP loc_805B



ofs_overworld_pause_handler_806C_06_draw_triforce_text:
    LDA #con_ppu_buf_triforce_text
    BNE bra_8059    ; jmp



ofs_overworld_pause_handler_8070_07:
    JSR sub_B282
    JMP loc_8079



ofs_dungeon_pause_handler_8076_06:
    JSR sub_B23A
loc_8079:
    LDA #$03
    JSR sub_8130
    LDA ram_scroll_Y
    SEC
    SBC #$03
    STA ram_scroll_Y
    CMP #$41
    BNE bra_80D3_RTS
    INC ram_pause_script
    LDA ram_dungeon_level
    BEQ bra_80D3_RTS    ; if overworld
; if dungeon
    LDA ram_script
    CMP #con_script_09
    BEQ bra_80D3_RTS
    LDA ram_map_location
    AND #$0F
; * 08
    ASL
    ASL
    ASL
    STA ram_0000_t60
    LDA ram_6BAB
    CMP #$08
    BCC bra_80B3
    LDA #$10
    SBC ram_6BAB
; * 08
    ASL
    ASL
    ASL
    JSR sub_bat_7021_EOR_FF
    JMP loc_80B6
bra_80B3:
; * 08
    ASL
    ASL
    ASL
loc_80B6:
    CLC
    ADC ram_0000_t60
    CLC
    ADC #$62
    STA ram_spr_X + $50
    LDA ram_map_location
    AND #$F0
    LSR
    ADC #$69
    STA ram_spr_Y + $50
    LDA #$3E
    STA ram_spr_T + $50
    LDA #$00
    STA ram_spr_A + $50
bra_80D3_RTS:
    RTS



ofs_dungeon_pause_handler_80D4_07_inventory:
ofs_overworld_pause_handler_80D4_08_inventory:
; triggers when inventory is loaded
    JSR sub_B6A7
    JSR sub_B726
    LDA ram_btn_hold + $01
    AND #con_btn_A + con_btn_Up
    CMP #con_btn_A + con_btn_Up
    BNE bra_80F3    ; don't show save menu if not held
    JSR sub_0x01EBB3_clear_subscript
; A = 00
    STA ram_pause_script
    LDA #con_script_save_menu
    STA ram_script
    LDA #$00
    STA ram_0619
    JMP loc_8A8E
bra_80F3:
    LDA ram_btn_press
    AND #con_btn_Start
    BEQ bra_8151_RTS    ; bzk
    LDA ram_spr_Y + $54
    PHA
    LDA ram_spr_Y + $58
    PHA
    JSR sub_0x01E607_hide_all_sprites
    PLA
    STA ram_spr_Y + $58
    PLA
    STA ram_spr_Y + $54
    INC ram_pause_script
    RTS



ofs_dungeon_pause_handler_810F_08:
ofs_overworld_pause_handler_810F_09:
    LDA #$FD
    JSR sub_8130
    LDA ram_scroll_Y
    CLC
    ADC #$03
    STA ram_scroll_Y
    CMP #$F0
    BCC bra_8151_RTS
    STA ram_005C
    LDA ram_dungeon_level
    BEQ bra_8128    ; if overworld
; if dungeon
    JSR sub_bat_7512
bra_8128:
    LDA #$00
    STA ram_scroll_Y
    STA ram_pause_script
    LDA #$02
sub_8130:
; in
    ; A = 
    STA ram_0000_t61_spr_Y
    LDA ram_spr_Y + $54
    CMP #$F8
    BEQ bra_813F
    CLC
    ADC ram_0000_t61_spr_Y
    STA ram_spr_Y + $54
bra_813F:
    LDA ram_dungeon_level
    BEQ bra_8151_RTS    ; if overworld
; if dungeon
    JSR sub_B5EB
    BEQ bra_8151_RTS
    LDA ram_spr_Y + $58
    CLC
    ADC ram_0000_t61_spr_Y
    STA ram_spr_Y + $58
bra_8151_RTS:
    RTS



tbl_8152:
    .byte $00   ; ram_684B
    .byte $08   ; ram_6853
    .byte $09   ; ram_6854
    .byte $01   ; ram_684C
    .byte $0A   ; ram_6855
    .byte $0B   ; ram_6856
    .byte $12   ; ram_685D
    .byte $1E   ; ram_6869
    .byte $1F   ; ram_686A
    .byte $17   ; ram_6862
    .byte $24   ; ram_686F
    .byte $25   ; ram_6870
    .byte $13   ; ram_685E
    .byte $14   ; ram_685F
    .byte $21   ; ram_686C
    .byte $13   ; ram_685E
    .byte $20   ; ram_686B
    .byte $21   ; ram_686C
    .byte $15   ; ram_6860
    .byte $16   ; ram_6861
    .byte $22   ; ram_686D
    .byte $16   ; ram_6861
    .byte $22   ; ram_686D
    .byte $23   ; ram_686E



tbl_816A:
    .byte $E7   ; ram_684B
    .byte $E7   ; ram_6853
    .byte $F5   ; ram_6854
    .byte $E8   ; ram_684C
    .byte $F5   ; ram_6855
    .byte $E8   ; ram_6856
    .byte $E7   ; ram_685D
    .byte $E7   ; ram_6869
    .byte $F5   ; ram_686A
    .byte $E8   ; ram_6862
    .byte $F5   ; ram_686F
    .byte $E8   ; ram_6870
    .byte $E5   ; ram_685E
    .byte $F5   ; ram_685F
    .byte $E5   ; ram_686C
    .byte $E8   ; ram_685E
    .byte $F5   ; ram_686B
    .byte $E8   ; ram_686C
    .byte $F5   ; ram_6860
    .byte $E6   ; ram_6861
    .byte $E6   ; ram_686D
    .byte $E7   ; ram_6861
    .byte $E7   ; ram_686D
    .byte $F5   ; ram_686E



tbl_8182:
    .byte $E9   ; ram_684B
    .byte $E9   ; ram_6853
    .byte $24   ; ram_6854
    .byte $EA   ; ram_684C
    .byte $24   ; ram_6855
    .byte $EA   ; ram_6856
    .byte $E9   ; ram_685D
    .byte $E9   ; ram_6869
    .byte $24   ; ram_686A
    .byte $EA   ; ram_6862
    .byte $24   ; ram_686F
    .byte $EA   ; ram_6870
    .byte $24   ; ram_685E
    .byte $24   ; ram_685F
    .byte $24   ; ram_686C
    .byte $24   ; ram_685E
    .byte $24   ; ram_686B
    .byte $24   ; ram_686C
    .byte $24   ; ram_6860
    .byte $24   ; ram_6861
    .byte $24   ; ram_686D
    .byte $24   ; ram_6861
    .byte $24   ; ram_686D
    .byte $24   ; ram_686E



ofs_overworld_pause_handler_819A_01_draw_triforce_triangles:
    LDY #$17
bra_819C_loop:
    LDX tbl_8152,Y
    LDA tbl_8182,Y
    STA ram_684B,X
    DEY
    BPL bra_819C_loop
    INY ; 00
    LDA #$01
    STA ram_0006_t03_triforce_piece
bra_81AD_loop:
    LDA #$03
    STA ram_0007_t03_loop_counter
bra_81B1_loop:
    LDX tbl_8152,Y
    LDA ram_0006_t03_triforce_piece
    BIT ram_item_triforce_pieces
    BEQ bra_81D1_not_collected
    LDA ram_684B,X
    CMP #$E5
    BEQ bra_81CC
    CMP #$E6
    BEQ bra_81CC
    LDA tbl_816A,Y
    JMP loc_81CE
bra_81CC:
; replace triangle tiles with a square tile
    LDA #$F5
loc_81CE:
    STA ram_684B,X
bra_81D1_not_collected:
    INY
    DEC ram_0007_t03_loop_counter
    BNE bra_81B1_loop
    ASL ram_0006_t03_triforce_piece
    BNE bra_81AD_loop
    INC ram_pause_script
    RTS



sub_81DD:
    LDA ram_frm_cnt
    AND #$03
    LDY ram_dungeon_level
    BNE bra_81E7    ; if dungeon
; if overworld
    AND #$01
bra_81E7:
    CMP ram_00E6
    BNE bra_8255
    LDA #con_dir_Up
    BIT ram_dir_link
    BEQ bra_8228
    DEC ram_00E9
    LDA ram_pos_Y_link
    CMP #$DD
    BCS bra_81FD
    ADC #$08
    STA ram_pos_Y_link
bra_81FD:
    LDA ram_00E2_ppu_addr_lo
    SEC
    SBC #$20
    STA ram_00E2_ppu_addr_lo
    BCS bra_8208_not_underflow
    DEC ram_0058_ppu_addr_hi
bra_8208_not_underflow:
    CMP #$E0    ; < xxE0
    BNE bra_821E_RTS
    LDA ram_0058_ppu_addr_hi
    CMP #$20    ; > 20xx
    BEQ bra_821F
    CMP #$27    ; > 27xx
    BNE bra_821E_RTS
    LDA #> $23A0
    STA ram_0058_ppu_addr_hi
    LDA #< $23A0
    STA ram_00E2_ppu_addr_lo
bra_821E_RTS:
    RTS
bra_821F:
    INC ram_0058_ppu_addr_hi
loc_8221:
    LDA #$00
    STA ram_00E2_ppu_addr_lo
bra_8225:
loc_8225:
    INC ram_subscript
    RTS
bra_8228:
    LSR ; -> 04 con_dir_Down
    BIT ram_dir_link
    BEQ bra_8255
    INC ram_00E9
    LDA ram_pos_Y_link
    CMP #$3E
    BCC bra_8239
    SBC #$08
    STA ram_pos_Y_link
bra_8239:
    LDA ram_00E2_ppu_addr_lo
    CLC
    ADC #$20
    STA ram_00E2_ppu_addr_lo
    BCC bra_8244_not_overflow
    INC ram_0058_ppu_addr_hi
bra_8244_not_overflow:
    CMP #< $23C0
    BNE bra_8287_RTS
    LDA ram_0058_ppu_addr_hi
    CMP #> $23C0
    BNE bra_8287_RTS
    LDA #$28    ; > 2800
    STA ram_0058_ppu_addr_hi
    JMP loc_8221
bra_8255:
    LDA #$02
    LDX #$FE
    LDY ram_dungeon_level
    BNE bra_8260    ; if overworld
; if dungeon
    ASL
    LDX #$FC
bra_8260:
    STA ram_0000_t62
    STX ram_0001_t27
    LDA #con_dir_Left
    BIT ram_dir_link
    BEQ bra_8288
    DEC ram_00E8
    LDA ram_pos_X_link
    CMP #$F0
    BCS bra_8276
    ADC ram_0000_t62
    STA ram_pos_X_link
bra_8276:
    LDA ram_scroll_X
    SEC
    SBC ram_0000_t62
    STA ram_scroll_X
    BEQ bra_8225
    CMP ram_0001_t27
    BNE bra_8287_RTS
sub_8283:
    LDA #$01
    STA ram_005F
bra_8287_RTS:
    RTS
bra_8288:
    LSR ; -> 01 con_dir_Right
    BIT ram_dir_link
    BEQ bra_8287_RTS
    INC ram_00E8
    LDA ram_pos_X_link
    CMP #$01
    BCC bra_8299
    SBC ram_0000_t62
    STA ram_pos_X_link
bra_8299:
    LDA ram_scroll_X
    CLC
    ADC ram_0000_t62
    STA ram_scroll_X
    BNE bra_8287_RTS
    JSR sub_8283
    JMP loc_8225



sub_0x0142B8:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_017_830E_00
    .word ofs_017_82BB_01
    .word ofs_017_831F_02
    .word ofs_017_833D_03
    .word ofs_017_833D_04
    .word ofs_017_835C_05
    .word ofs_017_839E_06



ofs_017_82BB_01:
    JSR sub_0x01EA4D
    JSR sub_0x01F248
    LDA ram_00EE
    STA ram_0521
    JSR sub_83C2
    DEC ram_00ED
    INC ram_subscript
    JSR sub_0x01E69F
    LDA ram_next_map_location
    BMI bra_82F4_RTS
    LDA ram_map_location
    PHA
    LDY ram_dir_link
    CPY #con_dir_Up
    BEQ bra_82E1
    LDA ram_next_map_location
    STA ram_map_location
bra_82E1:
    JSR sub_83D7
    LDA #$15
    STA ram_00E9
    LDY ram_dir_link
    CPY #con_dir_Up
    BEQ bra_82F5
    JSR sub_A8C4
loc_82F1:
    PLA
    STA ram_map_location
bra_82F4_RTS:
    RTS
bra_82F5:
    JSR sub_82FB
    JMP loc_82F1



sub_82FB:
    LDA ram_dungeon_level
    BEQ bra_830D_RTS    ; if overworld
; if dungeon
    LDA ram_00EE
    PHA
    LDA ram_0521
    STA ram_00EE
    JSR sub_A4F6
    PLA
    STA ram_00EE
bra_830D_RTS:
    RTS



ofs_017_830E_00:
    LDA ram_0522_flag
    BEQ bra_8317
    LDA ram_flute_map_location
    STA ram_map_location
bra_8317:
    LDA ram_051A
    BEQ bra_833A
; if you exit location while lake is changing/already changed colors,
; smoothly change colors back and only then resume exiting
    JMP loc_0x01FF44



ofs_017_831F_02:
    JSR sub_A924
    LDA ram_0302_ppu_buffer
    AND #$0F
    CLC
    ADC #$27
    STA ram_0302_ppu_buffer
    LDA ram_dir_link
    CMP #$04
    BCS bra_8336    ; con_dir_Down or con_dir_Up ?
    INC ram_0302_ppu_buffer
bra_8336:
    DEC ram_00E9
    BPL bra_833C_RTS
bra_833A:
    INC ram_subscript
bra_833C_RTS:
    RTS



ofs_017_833D_03:
ofs_017_833D_04:
    LDA #con_dir_Up
    BIT ram_dir_link
    BNE bra_8348
    LSR ; -> 04 con_dir_Down
    BIT ram_dir_link
    BEQ bra_8358
bra_8348:
    LDA #$C0
bra_834A:
    LDY #$17
    LDX ram_subscript
    CPX #$03
    BEQ bra_8355
    JSR sub_848C
bra_8355:
    JMP loc_8CA4
bra_8358:
    LDA #$D0
    BNE bra_834A    ; jmp



ofs_017_835C_05:
    LDA #$00
    STA ram_051C
    LDA ram_dir_link
    CMP #$04
    BCS bra_836B    ; con_dir_Down or con_dir_Up ?
    LDY #con_ppu_buf_4E
    STY ram_ppu_load_index
bra_836B:
    CMP #con_dir_Up
    BNE bra_837C
    LDA ram_map_location
    PHA
    LDA ram_next_map_location
    STA ram_map_location
    JSR sub_A8C4
    PLA
    STA ram_map_location
bra_837C:
    LDY ram_next_map_location
    JSR sub_B68D
    BEQ bra_83A3
    LDY ram_map_location
    JSR sub_B68D
    BNE bra_8397
bra_838A:
    LDA #$00
    STA ram_051F_script
    LDA #$40
    STA ram_051C
    INC ram_subscript
    RTS
bra_8397:
    LDA ram_051F_script
    BNE bra_838A
    BEQ bra_83A3    ; jmp



ofs_017_839E_06:
    JSR sub_bat_74B7
    BNE bra_83AD_RTS
bra_83A3:
    LDA ram_next_map_location
    STA ram_map_location
    JSR sub_83B2
; bzk optimize, JMP
    JSR sub_bat_6C90
bra_83AD_RTS:
    RTS



tbl_83AE_spr_data:
    .byte $27   ; spr_Y
    .byte $61   ; spr_T
    .byte $20   ; spr_A
    .byte $58   ; spr_X



sub_83B2:
loc_83B2:
    LDA #$01    ; transition is ON
    STA ram_screen_transition_flag
    LDY #$03
bra_83B8_loop:
    LDA tbl_83AE_spr_data,Y
    STA ram_oam,Y
    DEY
    BPL bra_83B8_loop
    RTS



sub_83C2:
    LDA ram_dir_link
    LSR
    AND #$05    ; con_dir_Left    con_dir_Up
    STA ram_0000_t50_direction
    LDA ram_dir_link
    ASL
    AND #$0A    ; con_dir_Right    con_dir_Down
    ORA ram_0000_t50_direction
    STA ram_00EE
    RTS



tbl_83D3_nametale_attribute:
    .byte $00   ; 00 
    .byte $55   ; 01 
    .byte $AA   ; 02 
    .byte $FF   ; 03 



sub_83D7:
    TAY
    LDA ram_687E_map_data,Y
    AND #$03
    TAX
    LDA tbl_83D3_nametale_attribute,X
    LDX #$2F
bra_83E3_loop:
    STA ram_0530_nmt_attr_buffer,X
    DEX
    BPL bra_83E3_loop
    LDA ram_68FE_map_data,Y
    AND #$03
    TAX
    LDY #$09
bra_83F1_loop:
    TYA
    AND #$07
    BEQ bra_8404
    CMP #$07
    BEQ bra_8404
    CPY #$21
    BCS bra_840A
    LDA tbl_83D3_nametale_attribute,X
    STA ram_0530_nmt_attr_buffer,Y
bra_8404:
loc_8404_loop:
    INY
    CPY #$27
    BCC bra_83F1_loop
    RTS
bra_840A:
    LDA tbl_83D3_nametale_attribute,X
    AND #$0F
    STA ram_0000_t63
    LDA ram_0530_nmt_attr_buffer,Y
    AND #$F0
    ORA ram_0000_t63
    STA ram_0530_nmt_attr_buffer,Y
    JMP loc_8404_loop



sub_0x01442E_screen_transition_handlers:
    JSR sub_8424
    JMP loc_0x01F248



sub_8424:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_018_8439_00
    .word ofs_018_847E_01
    .word ofs_018_8492_02
    .word ofs_018_84A4_03
    .word ofs_018_84DF_04
    .word ofs_018_84E8_05
    .word ofs_018_84BA_06
    .word ofs_018_84CC_07



ofs_018_8439_00:
    LDA #$00
    STA ram_00E2_ppu_addr_lo
    STA ram_scroll_X
    LDA #con_dir_Up
    BIT ram_dir_link
    BNE bra_8471
    LSR ; -> 04 con_dir_Down
    BIT ram_dir_link
    BEQ bra_8457
    LDA #$21
    STA ram_0058_ppu_addr_hi
    LDA #$FF
    STA ram_00E9
loc_8452:
    INC ram_subscript
    INC ram_subscript
    RTS
bra_8457:
    LDY #$A0
    LDX ram_dungeon_level
    BNE bra_845F    ; if dungeon
; if overworld
    LDY #$E0
bra_845F:
    LSR
    BIT ram_dir_link
    BEQ bra_846C
    LDY #$81
    LDX ram_dungeon_level
    BNE bra_846C    ; if dungeon
; if overworld
    LDY #$41
bra_846C:
    STY ram_00E8
    JMP loc_8452
bra_8471:
    LDA #$28
    STA ram_0058_ppu_addr_hi
    LDA #$16
    STA ram_00E9
    LDA ram_map_location
    JSR sub_83D7
ofs_018_847E_01:
    JSR sub_8484
    JMP loc_8501



sub_8484:
; out
    ; A = 
    ; Y = 
    LDA #$D0
    LDY #$17
    LDX ram_subscript
    BEQ bra_8491_RTS
sub_848C:
; in
    ; A = 
; out
    ; A = 
    ; Y = 
    LDY #$2F
    CLC
    ADC #$18
bra_8491_RTS:
    RTS



ofs_018_8492_02:
    INC ram_subscript
    LDA ram_frm_cnt
    CLC
    ADC #$01
    AND #$03
    LDY ram_dungeon_level
    BNE bra_84A1    ; if dungeon
; if overworld
    AND #$01
bra_84A1:
    STA ram_00E6
    RTS



ofs_018_84A4_03:
    JSR sub_81DD
    JSR sub_8506
    LDA ram_subscript
    CMP #$03
    BEQ bra_84B9_RTS
    LDY #$FF
    STY ram_00E9
    STY ram_00ED
    INY ; 00
    STY ram_00E8
bra_84B9_RTS:
    RTS



ofs_018_84BA_06:
    LDA ram_dungeon_level
    BEQ bra_84CC    ; if overworld
; if dungeon
    LDY ram_map_location
    JSR sub_B68D
    BEQ bra_84CC
    LDA #$00
    STA ram_00E9
    INC ram_subscript
    RTS
bra_84CC:
ofs_018_84CC_07:
    LDA #$01
    STA ram_subscript
    LSR ; -> 00
    STA ram_0011_screen_ready_flag
; bzk optimize, useless STA
    STA ram_010C_useless
    STA ram_00E7
    STA ram_screen_transition_flag
    LDA #con_script_04_screen_trans_end
    STA ram_script
    RTS



ofs_018_84DF_04:
    LDA #con_dir_Up
    BIT ram_dir_link
    BEQ bra_84E8
    JMP loc_8452
bra_84E8:
ofs_018_84E8_05:
    LDA #$D0
    LDY #$17
    LDX ram_subscript
    CPX #$04
    BEQ bra_8501
    PHA
    LDA ram_dir_link
    CMP #$04
    BCS bra_84FD    ; con_dir_Down or con_dir_Up ?
    LDA #$00
    STA ram_005F
bra_84FD:
    PLA
    JSR sub_848C
bra_8501:
loc_8501:
    LDX #$23
    JMP loc_8CA6



sub_8506:
    LDA ram_00E9
    CMP #$16
    BCS bra_8515
    CMP ram_00ED
    BEQ bra_8520_RTS
    STA ram_00ED
    JMP loc_A924
bra_8515:
    LDA ram_00E8
    BEQ bra_8520_RTS
    CMP #$21
    BCS bra_8520_RTS
    JMP loc_A8DE_move_curtain
bra_8520_RTS:
    RTS



sub_0x014531:
bra_8521_infinite_loop:
    LDA $2002
    AND #$40    ; bzk optimize, BIT + BVC
    BEQ bra_8521_infinite_loop
    LDA $2002
    LDY #$03
bra_852D_garbage_loop:
    LDX #$30
bra_852F_garbage_loop:
    DEX
    BPL bra_852F_garbage_loop
    DEY
    BPL bra_852D_garbage_loop
; Y = FF
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    NOP
    LDA ram_script
    CMP #$08
    BCS bra_858C
    LDA ram_subscript
    BEQ bra_858B_RTS
    LDA ram_dir_link
    CMP #$04    ; check for either con_dir_Right or con_dir_Left
    BCC bra_856D
    LDY #$5E
bra_8550_garbage_loop:
    NOP
    DEY
    BPL bra_8550_garbage_loop
    NOP
    NOP
    NOP
    NOP
    NOP
    LDA $2002
    LDA ram_0058_ppu_addr_hi
    LDY ram_00E2_ppu_addr_lo
    STA $2006
    STY $2006
    LDA $2007
    LDA $2007
    RTS
bra_856D:
    LDY #$5E
bra_856F_garbage_loop:
    NOP
    DEY
    BPL bra_856F_garbage_loop
    NOP
    NOP
    NOP
    LDA ram_for_2000
    AND #$FE
    ORA ram_005F
    STA ram_for_2000
    STA $2000
    LDA ram_scroll_X
    STA $2005
    LDA #$00    ; scroll Y
    STA $2005
bra_858B_RTS:
    RTS
bra_858C:
    CMP #$11
    BCS bra_8593
    JMP loc_0x01E635_disable_rendering_and_nmi
bra_8593:
    LDA ram_for_2000
    ORA #$01
    STA ram_for_2000
    STA $2000
    RTS


; bzk garbage
    .byte $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



ofs_main_script_1_0x014610_08_prepare_save_menu:
; con_script_save_menu
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA ram_subscript
    BNE bra_8613
    STA a: ram_005A
    JSR sub_0x01E47D_clear_screen
    JSR sub_0x01EA3B_set_tunic_color
    JMP loc_0x01EA10_clear_room_history
bra_8613:
    LDA #con_ppu_buf_continue
    STA ram_ppu_load_index
    JMP loc_bat_6C90



ofs_main_script_1_0x01462A_0D:
; con_script_0D
    JSR sub_0x01E47D_clear_screen
    JSR sub_B4AC_check_battery_integrity
    BCS bra_8625_battery_is_not_ok
    JMP loc_bat_6C90
bra_8625_battery_is_not_ok:
    JMP loc_0x01FF60_RESET_vector



ofs_main_script_1_0x014638_10:
; con_script_10
    LDX #$00
    JSR sub_0x01EE04_find_current_collision_tile___direction_00
    CMP #$24
    BNE bra_8643
    LDA #$00
    STA ram_0619
    LDA #con_sfx_3_walking
    STA ram_sfx_3
    LDA ram_pos_Y_link
    CLC
    ADC #$10
    STA ram_0412
bra_8643:
    INC ram_0011_screen_ready_flag
    RTS



tbl_8646_enemy_spawn_positions_lo:
    .byte < off_864E_01_right   ; 
    .byte < off_8657_02_left   ; 
    .byte < off_8660_04_down   ; 
    .byte < off_8669_08_up   ; 



tbl_864A_enemy_spawn_positions_hi:
    .byte > off_864E_01_right   ; 
    .byte > off_8657_02_left   ; 
    .byte > off_8660_04_down   ; 
    .byte > off_8669_08_up   ; 



off_864E_01_right:
    .byte $55   ; 
    .byte $B5   ; 
    .byte $78   ; 
    .byte $98   ; 
    .byte $7A   ; 
    .byte $9A   ; 
    .byte $6C   ; 
    .byte $AC   ; 
    .byte $8D   ; 



off_8657_02_left:
    .byte $82   ; 
    .byte $63   ; 
    .byte $A3   ; 
    .byte $75   ; 
    .byte $95   ; 
    .byte $77   ; 
    .byte $97   ; 
    .byte $5A   ; 
    .byte $BA   ; 



off_8660_04_down:
    .byte $A3   ; 
    .byte $75   ; 
    .byte $B5   ; 
    .byte $96   ; 
    .byte $87   ; 
    .byte $99   ; 
    .byte $7A   ; 
    .byte $BA   ; 
    .byte $AC   ; 



off_8669_08_up:
    .byte $63   ; 
    .byte $55   ; 
    .byte $95   ; 
    .byte $76   ; 
    .byte $88   ; 
    .byte $79   ; 
    .byte $5A   ; 
    .byte $9A   ; 
    .byte $6C   ; 



tbl_8672:
    .byte $18   ; 
    .byte $E8   ; 
    .byte $28   ; 
    .byte $D8   ; 



_off007_8676_62:
    .byte con_obj_id_03   ; 
    .byte con_obj_id_03   ; 
    .byte con_obj_id_04   ; 
    .byte con_obj_id_03   ; 
    .byte con_obj_id_04   ; 



_off007_867B_63:
    .byte con_obj_id_03   ; 
    .byte con_obj_id_04   ; 
    .byte con_obj_id_03   ; 
    .byte con_obj_id_04   ; 



_off007_867F_64:
    .byte con_obj_id_1A   ; 
    .byte con_obj_id_1A   ; 
    .byte con_obj_id_02   ; 
    .byte con_obj_id_01   ; 
    .byte con_obj_id_02   ; 
    .byte con_obj_id_01   ; 



_off007_8685_65:
    .byte con_obj_id_01   ; 
    .byte con_obj_id_02   ; 
    .byte con_obj_id_01   ; 
    .byte con_obj_id_02   ; 



_off007_8689_66:
    .byte con_obj_id_01   ; 
    .byte con_obj_id_0F   ; 
    .byte con_obj_id_02   ; 
    .byte con_obj_id_01   ; 
    .byte con_obj_id_10   ; 
    .byte con_obj_id_02   ; 



_off007_868F_67:
    .byte con_obj_id_0F   ; 
    .byte con_obj_id_1A   ; 
    .byte con_obj_id_10   ; 
    .byte con_obj_id_1A   ; 
    .byte con_obj_id_0F   ; 
    .byte con_obj_id_1A   ; 



_off007_8695_68:
    .byte con_obj_id_09   ; 
    .byte con_obj_id_08   ; 
    .byte con_obj_id_08   ; 
    .byte con_obj_id_08   ; 
    .byte con_obj_id_08   ; 



_off007_869A_69:
    .byte con_obj_id_08   ; 
    .byte con_obj_id_07   ; 
    .byte con_obj_id_08   ; 
    .byte con_obj_id_07   ; 



_off007_869E_6A:
    .byte con_obj_id_08   ; 
    .byte con_obj_id_09   ; 
    .byte con_obj_id_08   ; 
    .byte con_obj_id_09   ; 
    .byte con_obj_id_08   ; 



_off007_86A3_6B:
    .byte con_obj_id_0A   ; 
    .byte con_obj_id_07   ; 
    .byte con_obj_id_0A   ; 
    .byte con_obj_id_07   ; 
    .byte con_obj_id_07   ; 



_off007_86A8_6C:
    .byte con_obj_id_03   ; 
    .byte con_obj_id_0A   ; 
    .byte con_obj_id_04   ; 
    .byte con_obj_id_0A   ; 
    .byte con_obj_id_04   ; 
    .byte con_obj_id_04   ; 



_off007_86AE_6D:
    .byte con_obj_id_4A   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_13   ; 
    .byte con_obj_id_13   ; 
; bzk garbage?
    .byte $00   ; 
    .byte $13   ; 



_off007_86B6_6E:
    .byte con_obj_id_4A   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 



_off007_86BE_6F:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_13   ; 
    .byte con_obj_id_13   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 



_off007_86C6_70:
    .byte con_obj_id_16   ; 
    .byte con_obj_id_30   ; 
    .byte con_obj_id_30   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_16   ; 
; bzk garbage?
    .byte $00   ; 
    .byte $00   ; 



_off007_86CE_71:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 



_off007_86D6_72:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_12   ; 
    .byte con_obj_id_12   ; 
    .byte con_obj_id_12   ; 
; bzk garbage?
    .byte $00   ; 
    .byte $00   ; 
    .byte $00   ; 



_off007_86DE_73:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_13   ; 
    .byte con_obj_id_13   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_17   ; 



_off007_86E4_74:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_0C   ; 
    .byte con_obj_id_0B   ; 
    .byte con_obj_id_0B   ; 
    .byte con_obj_id_30   ; 
    .byte con_obj_id_30   ; 
    .byte con_obj_id_30   ; 



_off007_86EC_75:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_05   ; 
    .byte con_obj_id_05   ; 
    .byte con_obj_id_05   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 
    .byte con_obj_id_1B   ; 



_off007_86F4_76:
    .byte con_obj_id_4A   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_17   ; 



_off007_86FC_77:
    .byte con_obj_id_4A   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_null   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 



_off007_8704_78:
    .byte con_obj_id_16   ; 
    .byte con_obj_id_0C   ; 
    .byte con_obj_id_0B   ; 
    .byte con_obj_id_0C   ; 
    .byte con_obj_id_0B   ; 
    .byte con_obj_id_16   ; 



_off007_870A_79:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 



_off007_8712_7A:
    .byte con_obj_id_05   ; 
    .byte con_obj_id_06   ; 
    .byte con_obj_id_06   ; 
    .byte con_obj_id_05   ; 
    .byte con_obj_id_06   ; 
    .byte con_obj_id_05   ; 
; bzk garbage?
    .byte $00   ; 
    .byte $00   ; 



_off007_871A_7B:
    .byte con_obj_id_23   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 



_off007_871F_7C:
    .byte con_obj_id_2B   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_24   ; 
    .byte con_obj_id_17   ; 
    .byte con_obj_id_24   ; 



_off007_8727_7D:
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2C   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 
    .byte con_obj_id_23   ; 
    .byte con_obj_id_24   ; 



_off007_872F_7E:
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2C   ; 
    .byte con_obj_id_0C   ; 
    .byte con_obj_id_0B   ; 
    .byte con_obj_id_0C   ; 
    .byte con_obj_id_0B   ; 



_off007_8737_7F:
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2D   ; 
    .byte con_obj_id_2C   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 
    .byte con_obj_id_27   ; 



tbl_873F_enemy_groups:
    .word _off007_8676_62
    .word _off007_867B_63
    .word _off007_867F_64
    .word _off007_8685_65
    .word _off007_8689_66
    .word _off007_868F_67
    .word _off007_8695_68
    .word _off007_869A_69
    .word _off007_869E_6A
    .word _off007_86A3_6B
    .word _off007_86A8_6C
    .word _off007_86AE_6D
    .word _off007_86B6_6E
    .word _off007_86BE_6F
    .word _off007_86C6_70
    .word _off007_86CE_71
    .word _off007_86D6_72
    .word _off007_86DE_73
    .word _off007_86E4_74
    .word _off007_86EC_75
    .word _off007_86F4_76
    .word _off007_86FC_77
    .word _off007_8704_78
    .word _off007_870A_79
    .word _off007_8712_7A
    .word _off007_871A_7B
    .word _off007_871F_7C
    .word _off007_8727_7D
    .word _off007_872F_7E
    .word _off007_8737_7F



ofs_main_script_1_0x01478B_04:
; con_script_04_screen_trans_end
    LDX ram_subscript
    BEQ bra_87C6
    DEX
    BNE bra_878E
    LDA ram_00E9
    BMI bra_878B
    JSR sub_AC16
    BCC bra_878D_RTS
bra_878B:
    INC ram_subscript
bra_878D_RTS:
    RTS
bra_878E:
    DEX
    BNE bra_87B9
    LDY ram_map_location
    JSR sub_B68D
    BNE bra_87BE
    LDA ram_dir_link
    JSR sub_B560
    SEC
    SBC ram_map_location
    JSR sub_bat_7021_EOR_FF
    CLC
    ADC ram_map_location
    TAY
    JSR sub_B68D
    BEQ bra_87BE
    LDA ram_051F_script
    BNE bra_87BE
    LDA #$C0
sub_87B3:   ; A = 00 A0
    STA ram_051C
    INC ram_subscript
bra_87B8_RTS:
    RTS
bra_87B9:
    JSR sub_bat_74B7
    BNE bra_87B8_RTS
bra_87BE:
    LDA #$00
    STA ram_subscript
    STA ram_051F_script
    RTS



bra_87C6:   ; bzk
sub_87C6:
sub_0x0147D6:
    JSR sub_0x01EA4D
    JSR sub_0x01EA61
    LDA #$05
    LDY #$1F
    JSR sub_0x01E618_clear_memory   ; clear 0300-051F
    LDA #$00
    STA ram_0054_timer
; bzk optimize, useless STA?
    STA ram_0055_direction
    LDY ram_map_location
    LDA ram_6AFE_map_data,Y
    STA ram_04CD_map_data_byte
    JSR sub_B0B6
    LDA ram_005A
    BEQ bra_8820
    LDA ram_dungeon_level
    BNE bra_8815    ; if dungeon
; if overworld
    LDY ram_map_location
    LDA ram_687E_map_data,Y
    AND #$F0
    STA ram_pos_X_link
    LDA ram_6AFE_map_data,Y
    AND #$07
; * 10
    ASL
    ASL
    ASL
    ASL
    ADC #$4D
    STA ram_pos_Y_link
    LDY ram_0065
    CPY #$24
    BNE bra_8815
    STA ram_0412
    CLC
    ADC #$10
    STA ram_pos_Y_link
    LDA #con_sfx_3_walking
    STA ram_sfx_3
bra_8815:
    LDA #con_dir_Down
    STA ram_dir_link
    LDA #$00
    STA ram_0053
    JMP loc_8859
bra_8820:
    LDA ram_dir_link
    STA ram_0053
    JSR sub_bat_7013_get_Y_from_direction
    AND ram_00EE
    STA ram_0055_direction
    BEQ bra_8831
    LDA #$02
    STA ram_0054_timer
bra_8831:
    LDA ram_dungeon_level
    BEQ bra_8859    ; if overworld
; if dungeon
    LDY #$00    ; pos X
    LDA ram_dir_link
    AND #con_dir__LR
    BEQ bra_8845
    AND #con_dir_Right
    BNE bra_8843
    LDY #$F0    ; pos X
bra_8843:
    STY ram_pos_X_link
bra_8845:
    JSR sub_B0C3
    AND #$07
    BEQ bra_8856
    CMP #$05
    BEQ bra_8856
    CMP #$06
    BEQ bra_8856
; 01, 02, 03, 04, 07
    INY
    INY
bra_8856:
; 00, 05, 06
    LDA tbl_8672,Y
bra_8859:
loc_8859:
    STA ram_0394_link
    JSR sub_B05E
    LDX #$0B
    STX ram_obj_index
bra_8864_loop:
    DEC ram_0492_enemy,X
    JSR sub_0x01EEF4
; A = 00
    STA ram_state_obj,X
    STA ram_dir_enemy,X
    STA ram_003D_enemy,X
    INC ram_anim_timer_obj,X
    INC ram_0405_enemy,X
    LDA #$20
    STA ram_03BC_obj,X
    DEX
    BNE bra_8864_loop
    LDY ram_map_location
    LDA ram_697E_map_data,Y
    PHA
    AND #$3F
    STA ram_0002_t38_obj_id
    LDA ram_69FE_map_data,Y
    ASL
    BCC bra_8895
; 80+
    LDA ram_0002_t38_obj_id
    CLC
    ADC #$40
    STA ram_0002_t38_obj_id
bra_8895:
    PLA
    AND #$C0
    CLC
    ROL
    ROL
    ROL
    TAY
    LDA ram_6BA2,Y  ; 6BA2 6BA3 6BA4 6BA5
    LDY ram_0002_t38_obj_id
    CPY #$62
    BCS bra_88AC
    CPY #$32
    BCC bra_88AC
; 32-61
    LDA #$01
bra_88AC:
; 00-31, 62-7F
    STA ram_0003_t15_objects_counter
    LDA ram_dungeon_level
    BNE bra_88B8    ; if dungeon
; if overworld
    JSR sub_90AE_check_room_history
    JMP loc_88C7
bra_88B8:
    JSR sub_9293
    LDA ram_script
    CMP #con_script_09
    BNE bra_88C7
    LDA #$00
    STA ram_0002_t38_obj_id
    STA ram_0003_t15_objects_counter
bra_88C7:
loc_88C7:
    LDA ram_0003_t15_objects_counter
    STA ram_enemy_cnt
    BEQ bra_8909
    LDA ram_0002_t38_obj_id
    BEQ bra_8909
    CMP #$62
    BCS bra_88E5_spawn_a_group_of_enemies
; spawn the same enemy N times
    LDX #$00
bra_88D8_loop:
    LDA ram_0002_t38_obj_id
    STA ram_obj_id_enemy,X
    INX
    DEC ram_0003_t15_objects_counter
    BNE bra_88D8_loop
    JMP loc_8903
bra_88E5_spawn_a_group_of_enemies:
    LDA ram_0002_t38_obj_id
    SEC
    SBC #$62
    ASL
    TAY
    LDA tbl_873F_enemy_groups,Y
    STA ram_0004_t03_enemy_groups_data
    INY
    LDA tbl_873F_enemy_groups,Y
    STA ram_0004_t03_enemy_groups_data + $01
    LDY #$00
bra_88F9_loop:
    LDA (ram_0004_t03_enemy_groups_data),Y
    STA ram_obj_id_enemy,Y
    INY
    CPY ram_0003_t15_objects_counter
    BNE bra_88F9_loop
loc_8903:
    LDA ram_obj_id_enemy
    STA ram_copy_obj_id
bra_8909:
    JSR sub_896E
    LDA ram_dungeon_level
    BNE bra_8913    ; if dungeon
; if overworld
    JSR sub_8941
bra_8913:
    JSR sub_bat_71DE_draw_dot_on_minimap
    LDA #$00
    STA ram_003D_link
    STA ram_00C0_link
    STA ram_00D3_link
    LDA #$04
    STA ram_anim_timer_link
    JSR sub_B366
    JSR sub_0x01EAE3
sub_8929:
sub_0x014939:
    JSR sub_bat_6E40_clear_counter_00_27
    LDA ram_script
    CMP #con_script_0B
    BEQ bra_8939
    CMP #con_script_0C
    BEQ bra_8939
    JSR sub_0x01F248
bra_8939:
    LDA ram_005A
    BEQ bra_8940_RTS
; bzk optimize, JMP
    JSR sub_8BAB
bra_8940_RTS:
    RTS



sub_8941:
    LDA ram_map_location
    CMP #con_map_location + $3F
    BEQ bra_894B
    CMP #con_map_location + $55
    BNE bra_8950
bra_894B:
    LDA #con_obj_id_61
    JMP loc_895D
bra_8950:
    LDA ram_052C_special_metatile_pos_X
    STA ram_pos_X_enemy + $0B
    LDA ram_052D_special_metatile_pos_Y
    STA ram_pos_Y_enemy + $0B
    LDA ram_052B_special_metatile_id
loc_895D:
    STA ram_obj_id_enemy + $0A
    JSR sub_bat_6DB7_clear_special_metatile_addresses
    STA ram_state_obj + $0B
    RTS



tbl_8966_pos_X:
    .byte $20   ; 00 
    .byte $60   ; 01 
    .byte $90   ; 02 
    .byte $D0   ; 03 



tbl_896A_pos_Y:
    .byte $9D   ; 00 
    .byte $5D   ; 01 
    .byte $7D   ; 02 
    .byte $9D   ; 03 



sub_896E:
; in
    ; ram_0002_t38_obj_id
    LDY ram_enemy_cnt
    LDA ram_0002_t38_obj_id
    BEQ bra_89C4
    CMP #$37
    BEQ bra_89C4
    LDA ram_dungeon_level
    BNE bra_8984    ; if dungeon
; if overworld
    LDA ram_04CD_map_data_byte
    AND #$08
    BNE bra_89C4
bra_8984:
    LDA ram_enemy_cnt
    BEQ bra_89C4
; spawn depends on where link is approaching from
    LDA ram_dir_link
    LDY #$FF
bra_898D_loop:
    INY
    LSR
    BCC bra_898D_loop
    LDA tbl_8646_enemy_spawn_positions_lo,Y
    STA ram_0006_t02_enemy_spawn_pos_data
    LDA tbl_864A_enemy_spawn_positions_hi,Y
    STA ram_0006_t02_enemy_spawn_pos_data + $01
    LDY ram_0524
    LDX #$01
bra_89A0_loop:
    LDA (ram_0006_t02_enemy_spawn_pos_data),Y
    PHA
; * 10
    ASL
    ASL
    ASL
    ASL
    STA ram_pos_X_enemy,X
    PLA
    AND #$F0
    ORA #$0D
    STA ram_pos_Y_enemy,X
    JSR sub_8A04_check_for_valid_spawn_position
    BCS bra_89B6_not_valid
    INX
bra_89B6_not_valid:
    INY
    CPY #$09
    BCC bra_89BD_not_overflow
    LDY #$00
bra_89BD_not_overflow:
    CPX #$0A
    BCC bra_89A0_loop
    STY ram_0524
bra_89C4:
    LDA ram_script
    CMP #con_script_09
    BNE bra_89DF
    LDX #$03
bra_89CC_loop:
    LDA #con_obj_id_1B
    STA ram_obj_id_enemy,X
    LDA tbl_8966_pos_X,X
    STA ram_pos_X_enemy + $01,X
    LDA tbl_896A_pos_Y,Y
    STA ram_pos_Y_enemy + $01,X
    DEX
    BPL bra_89CC_loop
    RTS
bra_89DF:
    CMP #con_script_0B
    BEQ bra_89E7
    CMP #con_script_0C
    BNE bra_8A03_RTS
bra_89E7:
    LDX #$07
    LDA #con_obj_id_null
bra_89EB_loop:
    STA ram_obj_id_enemy,X
    DEX
    BPL bra_89EB_loop
    LDY ram_map_location
    LDA ram_68FE_map_data,Y
    AND #$FC
    SEC
    SBC #$40
; / 04
    LSR
    LSR
    CLC
    ADC #$6A
    STA ram_obj_id_enemy
bra_8A03_RTS:
    RTS



sub_8A04_check_for_valid_spawn_position:
    TYA
    PHA
    JSR sub_0x01EE04_find_current_collision_tile___direction_00
    PLA
    TAY
    LDA ram_collision_tile_enemy,X
    CMP ram_min_collision_tile
    BCS bra_8A2D_not_valid
sub_0x014A23:
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$22
    BCS bra_8A2B_valid
    LDA ram_pos_Y_link
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$22
    BCC bra_8A2D_not_valid
bra_8A2B_valid:
    CLC
    RTS
bra_8A2D_not_valid:
    SEC
    RTS



ofs_main_script_1_0x014A3F_11_death:
; con_script_death
    LDX #$00
    JSR sub_0x01FEA8_decrease_invincibility_timer
    JSR sub_0x01F24C
    LDA ram_subscript
    BNE bra_8A60
    JSR sub_0x01E607_hide_all_sprites
    JSR sub_0x01E689
    JSR sub_8929
    JSR sub_0x01E79A
    JSR sub_B559_disable_greyscale
    LDA #$00
    STA ram_pause_flag
    STA ram_item_hearts + $01
    JSR sub_bat_6D00_update_hud_info
    INC ram_subscript
    LDA #$10
    STA ram_invinc_link
    LDA #$21
    STA ram_timer_link
    RTS
bra_8A60:
    LDA ram_timer_link
    BNE bra_8A96_RTS
    JSR sub_0x01E86A_get_enemy_id_from_current_map_location
    AND #$3E
    CMP #$3E
    BEQ bra_8A75
    LDA ram_00EE
    STA ram_0521
    JSR sub_82FB
bra_8A75:
    LDA #$60
    STA ram_051C
    LDA #$02
    STA ram_timer_enemy + $0A
    LDA #$00    ; con_obj_state_00
    STA ram_subscript
    STA ram_00E9
    STA ram_state_link
    LDA #$04    ; con_dir_Down
    STA ram_00E5_t02_counter
    STA ram_dir_link
    INC ram_0011_screen_ready_flag
loc_8A8E:
    LDA #$80    ; con_sfx_4_80  con_sfx_3_80
    STA ram_sfx_4
    STA ram_sfx_3
bra_8A96_RTS:
    RTS



sub_8A97:
; out
    ; ram_0000_t13_data
; code for dungeons only, not for overworld
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    ORA tbl_0x01E6CE_8_bits,X
    STA (ram_0000_t13_data),Y
    RTS



sub_8AA0:
; code for dungeons only, not for overworld
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    LDA tbl_0x01E6CE_8_bits,X
    EOR #$FF
    AND (ram_0000_t13_data),Y
    STA (ram_0000_t13_data),Y
    RTS



sub_0x014ABD:
    LDA ram_04CE_flag
    BEQ bra_8AC2
    LDA #$08
    STA ram_000E_t08_direction
bra_8AB6:
    LDA ram_000E_t08_direction
    AND ram_00EE
    BEQ bra_8AC8
bra_8ABC:
    LSR ram_000E_t08_direction
    LDA ram_000E_t08_direction
    BNE bra_8AB6
bra_8AC2:
    LDA #$00
    STA ram_04CE_flag
    RTS
bra_8AC8:
    LDA ram_000E_t08_direction
    STA ram_0002_t24_direction
    JSR sub_A3F6
    CMP #$07
    BNE bra_8ABC
; 07
    LDA a: ram_0054_timer
    BNE bra_8AE2_RTS
    LDA ram_0002_t24_direction
sub_8ADA:
    STA a: ram_0055_direction
    LDA #$06
    STA a: ram_0054_timer
bra_8AE2_RTS:
    RTS



tbl_8AE3_spr_data:
    .byte $F3   ; spr_T
    .byte $02   ; spr_A
    .byte $40   ; spr_X



tbl_8AE6_spr_Y:
    .byte $4F   ; 
    .byte $67   ; 
    .byte $7F   ; 



tbl_8AE9:
    .byte con_script_03   ; 00 
    .byte con_script_0D   ; 01 
    .byte con_script_title_screen   ; 02 



tbl_8AEC:
    .byte $23   ; 00 
    .byte $D2   ; 01 
    .byte $43   ; 02 
    .byte $00   ; 03 
    .byte $FF   ; 04 



tbl_8AF1:
    .byte $D2   ; 00 
    .byte $DA   ; 01 
    .byte $E2   ; 02 



loc_0x014B04_save_menu_handler:
    LDA ram_subscript
    ASL
    BCS bra_8B35_option_was_selected
; if was not selected yet
    LDA ram_btn_press
    AND #con_btn_Start
    BNE bra_8B2A_select_option
    LDA ram_btn_press
    AND #con_btn_Select
    BEQ bra_8B16
    LDA #con_sfx_4_shield_block
    STA ram_sfx_4
    INC ram_subscript
    LDA ram_subscript
    CMP #$03
    BNE bra_8B16
    LDA #$00
    STA ram_subscript
bra_8B16:
    LDY #$02
bra_8B18_loop:
    LDA tbl_8AE3_spr_data,Y
    STA ram_spr_T,Y
    DEY
    BPL bra_8B18_loop
    LDY ram_subscript
    LDA tbl_8AE6_spr_Y,Y
    STA ram_spr_Y
    RTS
bra_8B2A_select_option:
    LDA ram_subscript
    ORA #$80
    STA ram_subscript
    LDA #$40
    STA ram_timer_enemy + $01
    RTS
bra_8B35_option_was_selected:
    LDA ram_timer_enemy + $01
    BEQ bra_8B5D
    LDY #$04
bra_8B3B_loop:
    LDA tbl_8AEC,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_8B3B_loop
    LDA ram_subscript
    AND #$03
    TAY
    LDA tbl_8AF1,Y
    STA ram_0302_ppu_buffer + $01
    LDY #$00
    LDA ram_timer_enemy + $01
    AND #$04
    BEQ bra_8B59
    LDY #$55
bra_8B59:
    STY ram_0302_ppu_buffer + $03
    RTS
bra_8B5D:
    LDA ram_subscript
    AND #$03
    STA ram_subscript
    JSR sub_0x01EA61
    LDY ram_subscript
    LDA tbl_8AE9,Y
    STA ram_script
    LDA ram_item_hearts
    AND #$F0
    ORA #$02
    STA ram_item_hearts
    LDA #$FF
    STA ram_item_hearts + $01
    JSR sub_0x01EBB3_clear_subscript
    CPY #$02
    BNE bra_8B88    ; if CONTINUE or SAVE
; if RETRY
    DEY ; 01
    STY ram_subscript
    INC ram_0011_screen_ready_flag
bra_8B88:
    JMP loc_bat_6EE9



loc_0x014B9B:
    LDA ram_collision_tile_link
    CMP #con_collision_tile + $24
    BNE bra_8BA1
    LDA ram_frm_cnt
    AND #$03
    BNE bra_8BA8
    INC ram_pos_Y_link
    LDA ram_pos_Y_link
    CMP ram_0412
    BNE bra_8BA8
bra_8BA1:
    LDA ram_next_script
    STA ram_script
    JSR sub_0x01EBB3_clear_subscript
bra_8BA8:
sub_0x014BB8:
    JSR sub_0x01F24C
sub_8BAB:
    LDA ram_spr_A + $48
    ORA #$20
    STA ram_spr_A + $48
    LDA ram_spr_A + $4C
    ORA #$20
    STA ram_spr_A + $4C
    RTS



sub_0x014BCC:
    JSR sub_8BFA
    LDA ram_04CD_map_data_byte
    AND #$07
    BEQ bra_8BE6_RTS
    JSR sub_8BE7
    BCC bra_8BE6_RTS
    LDA ram_04CD_map_data_byte
    AND #$07
    CMP #$07
    BNE bra_8BE6_RTS
    LDA ram_room_item_flag
    BEQ bra_8BE6_RTS
; if room doesn't have an item
    JSR sub_bat_7314_check_map_bit4
    BNE bra_8BE6_RTS
    LDA #$00
    STA ram_room_item_flag
    LDA #con_sfx_2_02
    STA ram_sfx_2
bra_8BE6_RTS:
ofs_019_8BE6_00_RTS:
    RTS



sub_8BE7:
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_019_8BE6_00_RTS   ; unused 0x014BD4
    .word ofs_019_8C1A_01
    .word ofs_019_8C28_02
    .word ofs_019_8C6F_03
    .word ofs_019_8C4C_04
    .word ofs_019_8C53_05
    .word ofs_019_8C76_06
    .word ofs_019_8C1A_07



sub_8BFA:
    LDY ram_obj_index
bra_8BFD_loop:
    LDA ram_obj_id_enemy,Y
    BEQ bra_8C0E    ; if not exist
    CMP #$2B
    BCC bra_8C19_RTS
    CMP #$2E
    BCC bra_8C0E
    CMP #$49
    BCC bra_8C19_RTS
bra_8C0E:
    DEY
    BPL bra_8BFD_loop
    LDA #$00
    STA ram_0512_flag
    INC ram_034D_flag
bra_8C19_RTS:
    RTS



ofs_019_8C1A_01:
ofs_019_8C1A_07:
    LDA ram_034D_flag
    BEQ bra_8C26
bra_8C1F:
    LDA #$01
    STA ram_04CE_flag
    SEC
    RTS
bra_8C26:
    CLC
    RTS



ofs_019_8C28_02:
    LDA ram_obj_id_enemy
    BEQ bra_8C31    ; if not exist
    CMP #$53
    BCC bra_8C26
bra_8C31:
    LDY ram_obj_index
bra_8C34_loop:
    LDA ram_obj_id_enemy,Y
    BEQ bra_8C47    ; if not exist
    CMP #$53
    BCS bra_8C47
    LDA ram_0405_enemy + $01,Y
    BNE bra_8C47
    LDA #$10
    STA ram_0405_enemy + $01,Y
bra_8C47:
    DEY
    BPL bra_8C34_loop
    SEC
    RTS



ofs_019_8C4C_04:
    LDA ram_04CF_flag
    BEQ bra_8C26
    BNE bra_8C1F    ; jmp



ofs_019_8C53_05:
    LDA ram_04CF_flag
    BEQ bra_8C26
    LSR
    BCC bra_8C26
    INC ram_04CF_flag
    LDX #$0B
    LDA #$D0
    STA ram_pos_X_enemy,X
    LDA #$60
    STA ram_pos_Y_enemy,X
    LDA #$70
    JSR sub_0x01E872_bomb_blasts_breakable_wall
    SEC
    RTS



ofs_019_8C6F_03:
    LDA ram_item_0672
    BNE bra_8C1F
    CLC
    RTS



ofs_019_8C76_06:
    LDA ram_obj_id_enemy
    BEQ bra_8C1F    ; if not exist
    CLC
    RTS



loc_0x014C8D_death_subroutines:
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_link_death_8CA1_00
    .word ofs_link_death_8C9C_01
    .word ofs_link_death_8CAC_02
    .word ofs_link_death_8CBE_03
    .word ofs_link_death_8CC3_04
    .word ofs_link_death_8CC8_05
    .word ofs_link_death_8CD1_06
    .word ofs_link_death_8CDA_07
    .word ofs_link_death_8CFB_08
    .word ofs_link_death_8D01_09
    .word ofs_link_death_8D0D_0A
    .word ofs_link_death_8D56_0B
    .word ofs_link_death_8D63_0C



ofs_link_death_8C9C_01:
    LDA #con_sfx_2_death
    STA ram_sfx_2
ofs_link_death_8CA1_00:
    JSR sub_8484
loc_8CA4:
    LDX #$2B
loc_8CA6:
    JSR sub_B0E1_write_nametable_attributes_to_buffer
    INC ram_subscript
    RTS



ofs_link_death_8CAC_02:
    JSR sub_AC10
    BCC bra_8CB4
    JSR sub_83B2
bra_8CB4:
    LDA ram_0302_ppu_buffer
    CLC
    ADC #$08
    STA ram_0302_ppu_buffer
    RTS



ofs_link_death_8CBE_03:
    LDA #con_ppu_buf_60
loc_8CC0_set_ppu_load_index:
; bzk optimize, JMP into JMP
    JMP loc_B12E_set_ppu_load_index



ofs_link_death_8CC3_04:
    LDA #con_ppu_buf_62
    JMP loc_8CC0_set_ppu_load_index



ofs_link_death_8CC8_05:
    LDA #$00
    STA ram_screen_transition_flag
    LDA #con_ppu_buf_5E
    JMP loc_8CC0_set_ppu_load_index



ofs_link_death_8CD1_06:
    LDA ram_for_2000
    AND #$FE
    STA ram_for_2000
bra_8CD7_next_subscript:
    INC ram_subscript
    RTS



ofs_link_death_8CDA_07:
    LDA ram_00E5_t02_counter
    BEQ bra_8CD7_next_subscript
    LDA ram_timer_enemy + $0B
    BNE bra_8CF2
    LDA #$05
    STA ram_timer_enemy + $0B
    LDA ram_dir_link
; / 04
    LSR
    LSR
    BCC bra_8CF5_not_down
; if down
    DEC ram_00E5_t02_counter
    LDA #con_dir_Down
bra_8CF0:
    STA ram_dir_link
bra_8CF2:
    JMP loc_0x01F24C
bra_8CF5_not_down:
    BNE bra_8CF0
    LDA #con_dir_Up
    BNE bra_8CF0    ; jmp



loc_8CFB:
ofs_link_death_8CFB_08:
    JSR sub_bat_74B7
    BEQ bra_8CD7_next_subscript
    RTS



ofs_link_death_8D01_09:
    LDA #con_ppu_buf_2C
    STA ram_ppu_load_index
    LDA #$0F
    STA ram_00E5_t01
    LDA #$18
    BNE bra_8D51    ; jmp



ofs_link_death_8D0D_0A:
    LDA ram_timer_enemy + $0B
    BNE bra_8D55_RTS
    LDX #$62
    LDA ram_00E5_t01
    CMP #$06
    BCS bra_8D1B
    LDX #$64
bra_8D1B:
    LDA ram_pos_Y_link
    STA ram_spr_Y + $48
    STA ram_spr_Y + $4C
    STX ram_spr_T + $48
    STX ram_spr_T + $4C
    LDA #$01
    STA ram_spr_A + $48
    LDA #$41
    STA ram_spr_A + $4C
    LDA ram_pos_X_link
    STA ram_spr_X + $48
    CLC
    ADC #$08
    STA ram_spr_X + $4C
    DEC ram_00E5_t01
    BNE bra_8D55_RTS
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
    LDA #$F8
    STA ram_spr_Y + $48
    STA ram_spr_Y + $4C
    LDA #$2E
bra_8D51:
    STA ram_timer_enemy + $0B
    INC ram_subscript
bra_8D55_RTS:
    RTS



ofs_link_death_8D56_0B:
    LDA ram_timer_enemy + $0B
    BNE bra_8D55_RTS
    LDA #$60
    STA ram_timer_enemy + $0B
    LDA #con_ppu_buf_46_game_over
    JMP loc_8CC0_set_ppu_load_index



ofs_link_death_8D63_0C:
    LDA ram_timer_enemy + $0B
    BNE bra_8D7F_RTS
    JSR sub_0x01EBB3_clear_subscript
    LDA #con_script_save_menu
    STA ram_script
    LDA #con_sfx_2_40
    STA ram_sfx_2
    LDX ram_current_save_slot
    LDA ram_death_cnt,X
    CMP #$FF
    BEQ bra_8D7F_RTS
    INC ram_death_cnt,X
bra_8D7F_RTS:
    RTS



tbl_8D80:
    .byte $D6   ; 00 
    .byte $45   ; 01 
    .byte $E9   ; 02 
    .byte $07   ; 03 
    .byte $C6   ; 04 
    .byte $55   ; 05 
    .byte $D9   ; 06 
    .byte $17   ; 07 
    .byte $BE   ; 08 
    .byte $54   ; 09 
    .byte $D1   ; 0A 
    .byte $1F   ; 0B 



sub_8D8C:
    LDA ram_dir_link
    JSR sub_bat_7013_get_Y_from_direction
    STA ram_0000_t64
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_pos_X_link
    CPY #$02
    BCS bra_8D9E
    LDA ram_pos_Y_link
bra_8D9E:
    STA ram_0002_t39
    TYA
    PHA
    CLC
    ADC #$08
    TAY
    LDA #con_btn_A
    JSR sub_8DC5
    PLA
    TAY
    LDA ram_0001_t28_btn
    CMP #$FF
    BNE bra_8DBA
    LDA ram_dir_link
    STA ram_0000_t64
    JSR sub_bat_7013_get_Y_from_direction
bra_8DBA:
    LDA ram_dungeon_level
    BEQ bra_8DC3    ; if overworld
; if dungeon
    TYA
    CLC
    ADC #$04
    TAY
bra_8DC3:
    LDA #$00
sub_8DC5:
; in
    ; A = con_btn
    ; ram_0000_t64
    STA ram_0001_t28_btn
    LDA ram_0000_t64
    AND #$0A
    BEQ bra_8DF4
    LDA ram_0002_t39
    CMP tbl_8D80,Y
    BCC bra_8DFB
bra_8DD4:
    LDA ram_btn_press
    AND ram_0001_t28_btn
    STA ram_btn_press
    LDA ram_dungeon_level
    BEQ bra_8DF3_RTS    ; if overworld
; if dungeon
    LDA ram_0001_t28_btn
    BNE bra_8DF3_RTS
    LDY #$0C
    LDA ram_dir_link
    AND #con_dir__UD
    BNE bra_8DEC
    LDY #$03
bra_8DEC:
    TYA
    AND ram_03F8_link
    STA ram_03F8_link
bra_8DF3_RTS:
    RTS
bra_8DF4:
    LDA ram_0002_t39
    CMP tbl_8D80,Y
    BCC bra_8DD4
bra_8DFB:
    LDA #$FF
    STA ram_0001_t28_btn
bra_8DFF_RTS:
    RTS



sub_8E00_A_item_handler:
    LDA ram_item_sword
    BEQ bra_8DFF_RTS
    LDX #$0D    ; sword swing
    LDA ram_state_obj,X
    BNE bra_8DFF_RTS
    LDA #$05
    STA ram_anim_timer_obj,X
    LDA #$01
    JSR sub_8E8F
    LDA #con_sfx_3_sword_swing
    JMP loc_bat_6D80_set_sfx_3



tbl_8E1A:
    .byte $31   ; 00 
    .byte $FF   ; 01 



sub_8E1C_B_item_handler:
    LDA ram_item_slot_index
    CMP #con_item_letter
    BEQ bra_8E71_RTS
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_021_8E38_00_boomerang
    .word ofs_021_bat_70DD_01_bomb
    .word ofs_021_8E72_02_arrow
    .word ofs_021_8EA6_03_RTS
    .word ofs_021_bat_714F_04_candle
    .word ofs_021_0x01EF81_05_flute
    .word ofs_021_8EA7_06_meat
    .word ofs_021_8EB6_07_potion
    .word ofs_021_8EC7_08_staff



ofs_021_8E38_00_boomerang:
    LDA ram_item_boomerang
    ORA ram_item_magic_boomerang
    BEQ bra_8E71_RTS
    LDX #$0F
    LDA ram_state_obj,X
    BEQ bra_8E49
    ASL
    BCC bra_8E71_RTS
bra_8E49:
    LDA #$10
    STA ram_state_obj,X
    LDY ram_item_magic_boomerang
    LDA tbl_8E1A,Y
    STA ram_0380_enemy,X
    JSR sub_bat_711B
    LDA #$C0
    STA ram_03BC_obj,X
    LDA #$03
    STA ram_anim_timer_obj,X
    LDA #$01
    STA ram_anim_timer_link
    LDA ram_03F8_link
    BNE bra_8E6F
    LDA ram_dir_link
bra_8E6F:
    STA ram_dir_enemy,X
bra_8E71_RTS:
    RTS



ofs_021_8E72_02_arrow:
    LDA ram_item_bow
    BEQ bra_8EA6_RTS
    LDX #$12
    LDA ram_state_obj,X
    BEQ bra_8E80
    ASL
    BCC bra_8EA6_RTS
bra_8E80:
    LDA ram_item_rupees
    BEQ bra_8EA6_RTS
    LDA #con_sfx_3_arrow_shoot
    JSR sub_bat_6D80_set_sfx_3
    INC ram_rupees_sbc
    LDA #$10
sub_8E8F:
loc_8E8F:
    STA ram_state_obj,X
    LDA #$C0
    STA ram_03BC_obj,X
    JSR sub_bat_7116
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_8EA6_RTS
    LDA ram_pos_X_enemy,X
    CLC
    ADC #$03
    STA ram_pos_X_enemy,X
bra_8EA6_RTS:
ofs_021_8EA6_03_RTS:
    RTS



ofs_021_8EA7_06_meat:
    LDX #$0F
    LDA ram_state_obj,X
    BNE bra_8EC6_RTS
    LDA #$FF
    STA ram_timer_obj,X
    LDA #$80
    JMP loc_bat_7114



ofs_021_8EB6_07_potion:
    LDA ram_item_potion
    BEQ bra_8EC6_RTS
    DEC ram_item_potion
    LDA #$01
    STA ram_0063
    LDA #$02
    STA ram_pause_flag
bra_8EC6_RTS:
    RTS



ofs_021_8EC7_08_staff:
    LDX #$12
    LDA ram_state_obj,X
    BNE bra_8EC6_RTS
    LDA #$05
    STA ram_anim_timer_obj,X
    LDA #$31
    JMP loc_8E8F



sub_0x014EE7:
    LDA ram_script
    CMP #con_script_09
    BNE bra_8F1C
    LDA ram_pos_Y_link
    CMP #$40
    BCS bra_8EC6_RTS
    LDA ram_03F8_link
    AND #$08
    BEQ bra_8EC6_RTS
; triggers when link gets an item and climbs back by the ladder
    LDY #$06
    LDA ram_map_location
    PHA
bra_8EEF_loop:
; bzk bug, loop doesn't quit after checking Y 00-06,
; which results in Y underflow after DEY and refer
; to unrelated addresses via CMP.
; example at 1st quest demo, 73500+ frame
; it's also possible that this loop will result
; in an infinite loop because of no Y check
    DEY
    CMP ram_6BB2,Y
    BNE bra_8EEF_loop
    TAY
    LDA ram_pos_X_link
    CMP #$80
    BCS bra_8F02
    LDA ram_687E_map_data,Y
    JMP loc_8F05
bra_8F02:
    LDA ram_68FE_map_data,Y
loc_8F05:
    JSR sub_8F58
    PLA
    TAY
    LDA ram_697E_map_data,Y
    PHA
    AND #$F0
    STA ram_pos_X_link
    PLA
; * 10
    ASL
    ASL
    ASL
    ASL
    ORA #$0D
    STA ram_pos_Y_link
    RTS
bra_8F1C:
    PHA
    JSR sub_bat_6E46
    PLA
    CMP #con_script_0C
    BNE bra_8F73
    LDA ram_0394_link
    BNE bra_8F72_RTS
    LDA ram_pos_Y_link
    CMP #$9D
    BNE bra_8F73
    LDY #$01
    LDA ram_pos_X_link
    CMP #$50
    BEQ bra_8F42
    INY
    CMP #$80
    BEQ bra_8F42
    INY
    CMP #$B0
    BNE bra_8F72_RTS
bra_8F42:
    STY ram_0000_t65
    LDY #$FF
    LDA ram_map_location
bra_8F48_loop:
    INY
    CMP ram_6BB2,Y
    BNE bra_8F48_loop
    TYA
    CLC
    ADC ram_0000_t65
    AND #$03
    TAY
    LDA ram_6BB2,Y
sub_8F58:
    STA ram_map_location
    JSR sub_0x01E6D6_set_map_bit5
bra_8F5D:
    LDA #con_script_0A
    STA ram_script
loc_8F61:
    LDA #$00    ; con_obj_state_00
    STA ram_subscript
    STA ram_0011_screen_ready_flag
    STA ram_000F_t01_direction
    STA ram_state_link
    STA ram_00C0_link
    STA ram_00D3_link
    STA ram_invinc_link
bra_8F72_RTS:
    RTS
bra_8F73:
    JSR sub_0x01F171
    LDA ram_0011_screen_ready_flag
    BEQ bra_8F5D
    RTS



sub_0x014F8B:
    LDX ram_0064
    BEQ bra_8FC8_RTS
    LDA ram_state_obj,X
    BEQ bra_8FC1
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_8F9A
    LDA ram_pos_X_link
    CMP ram_pos_X_enemy,X
    BNE bra_8FC1
    LDA ram_pos_Y_link
    CLC
    ADC #$03
    SEC
    SBC ram_pos_Y_enemy,X
    JMP loc_8FA8
bra_8F9A:
    LDA ram_pos_Y_link
    CLC
    ADC #$03
    CMP ram_pos_Y_enemy,X
    BNE bra_8FC1
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
loc_8FA8:
    JSR sub_bat_701F_EOR_FF_if_negative
    STA ram_0000_t66
    CMP #$10
    BCC bra_8FC9
    CMP #$10
    BNE bra_8FC1
    LDA ram_dir_link
    CMP ram_dir_enemy,X
    BNE bra_8FC1
    LDA ram_state_obj,X
    CMP #$01
    BEQ bra_8FCD_loop
bra_8FC1:
    LDA #$00
    STA ram_0064
; bzk optimize, JMP
    JSR sub_0x01FEC1_destroy_object
bra_8FC8_RTS:
    RTS
bra_8FC9:
    LDA #$02
    STA ram_state_obj,X
bra_8FCD_loop:
    LDA ram_03F8_link
    BEQ bra_9011
    LDA ram_dir_link
; bzk bug? this 0000 can be from ram_0000_t05_block_data
    LDY ram_0000_t66
    BEQ bra_8FDC
    CMP ram_dir_enemy,X
    BEQ bra_9011
bra_8FDC:
    LDA ram_dir_enemy,X
    CMP ram_000F_t01_direction
    BEQ bra_9011
    JSR sub_bat_7013_get_Y_from_direction
    CMP ram_dir_link
    BEQ bra_9011
    CMP #con_dir_Down
    BNE bra_900F
    LDA ram_03F8_link
    CMP #$08
    BNE bra_900F
    JSR sub_901F
    LDA ram_pos_Y_link
    PHA
    SEC
    SBC #$08
    STA ram_pos_Y_link
    JSR sub_0x01EE0A_find_current_collision_tile
    PLA
    STA ram_pos_Y_link
    LDA ram_000F_t01_direction
    LDY ram_collision_tile_link
    CPY ram_min_collision_tile
    BCC bra_8FCD_loop
bra_900F:
    LDA #$00
bra_9011:
    PHA
    LDX ram_0064
    JSR sub_0x01FAA3
    LDY #$0C
    LDA #$00
    JSR sub_bat_790C
    PLA
sub_901F:
    STA ram_000F_t01_direction
    LDX #$00
    RTS



sub_0x015034:
    LDA ram_0525
    STA ram_000A_t10
bra_9029_loop:
    LDY #$10
    LDA ram_000A_t10
    AND #$0F
    BEQ bra_9037
    LDY #$F0
    CMP #$0F
    BNE bra_903D
bra_9037:
    TYA
    CLC
    ADC ram_000A_t10
    STA ram_000A_t10
bra_903D:
    LDA ram_000A_t10
    AND #$F0
    CMP #$E0
    BNE bra_904A
    INC ram_000A_t10
    JMP loc_9050
bra_904A:
    CMP #$40
    BNE bra_9050
    DEC ram_000A_t10
bra_9050:
loc_9050:
    JSR sub_AC07_set_block_address_pointer
    LDA ram_000A_t10
    AND #$0F
    TAY
    BEQ bra_9062
bra_905A_loop:
    LDA #$2C
    JSR sub_bat_7276_inc_0000_pointer_by_A
    DEY
    BNE bra_905A_loop
bra_9062:
    LDA ram_000A_t10
    AND #$F0
    SEC
    SBC #$40
; / 08
    LSR
    LSR
    LSR
    TAY
    LDA (ram_0000_t03_block_address),Y
    CMP #$84
    BCC bra_907A
    LDA ram_000A_t10
    CMP ram_0525
    BNE bra_9029_loop
bra_907A:
    LDA ram_000A_t10
    STA ram_0525
    RTS



ofs_main_script_1_0x015090_0B:
; con_script_0B
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_038_B117_00
    .word ofs_038_B14F_01
    .word ofs_038_B130_02
    .word ofs_AB4D_03_draw_normal_cave
    .word ofs_038_AC10_04
    .word ofs_038_B16B_05
    .word ofs_038_B173_06
    .word ofs_038_bat_6D89_07
    .word ofs_038_B180_08



ofs_main_script_1_0x0150A7_0C:
; con_script_0C
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_039_B117_00
    .word ofs_039_B14F_01
    .word ofs_039_B130_02
    .word ofs_039_AB5E_03_draw_cave_with_3_teleports
    .word ofs_039_AC10_04
    .word ofs_039_B16B_05
    .word ofs_039_B173_06
    .word ofs_039_bat_6D89_07
    .word ofs_039_B180_08



sub_90AE_check_room_history:
    LDY #$05
    LDA ram_map_location
bra_90B2_loop:
    CMP ram_room_history,Y
    BEQ bra_90CA
    DEY
    BPL bra_90B2_loop
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    AND #$07
    CMP #$07
    BNE bra_90CA
    LDA (ram_0000_t13_data),Y
    AND #$F8
    STA (ram_0000_t13_data),Y
bra_90C9_RTS:
    RTS
bra_90CA:
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    AND #$07
    BEQ bra_90C9_RTS
    CMP #$07
    BEQ bra_90DE
    STA ram_0004_t18_leftover_enemies
    LDA ram_0003_t15_objects_counter
    SEC
    SBC ram_0004_t18_leftover_enemies
    BPL bra_90E2
bra_90DE:
    LDA #$00
    STA ram_0002_t38_obj_id
bra_90E2:
    STA ram_0003_t15_objects_counter
    RTS



loc_90E5:
; code for overworld only, not for dungeons
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    AND #$07
    STA ram_0002_t40
    LDA (ram_0000_t13_data),Y
    AND #$F8
    STA (ram_0000_t13_data),Y
    LDA ram_room_kill_cnt
    CMP ram_enemy_cnt
    BCS bra_9103
    AND #$07
    CLC
    ADC ram_0002_t40
    CMP #$07
    BCC bra_9105_not_overflow
bra_9103:
    LDA #$07
bra_9105_not_overflow:
    ORA (ram_0000_t13_data),Y
    STA (ram_0000_t13_data),Y
    RTS



ofs_main_script_1_0x01511A_09:
; con_script_09
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_040_B117_00
    .word ofs_040_B133_01
    .word ofs_040_B13C_02
    .word ofs_040_AB62_03_draw_underground_room
    .word ofs_040_AC10_04
    .word ofs_040_B12C_05
    .word ofs_040_B143_06
    .word ofs_040_B13C_07
    .word ofs_040_B199_08
    .word ofs_040_B1CD_09


; bzk garbage, a copy of 0x0102A3
    LDY #con_obj_id_null
    BEQ bra_9129    ; jmp


; bzk garbage, a copy of 0x0102A7
    LDY #con_obj_id_01
bra_9129:
    STY ram_000C_t07_flag
    LDY ram_obj_id_enemy - $01,X
    INY
    STA ram_000D_t04_table_offset
    STY ram_000E_t02
    STX ram_0008_t07
    LDA #$40
    STA ram_spr_index_1
    LDA #$44
    JMP loc_bat_7804



sub_913F:
    LDA ram_0053
    BEQ bra_915E_RTS
    LDY ram_03F8_link
    BEQ bra_915E_RTS
    LDA ram_dir_link
    AND ram_03F8_link
    BNE bra_915B
    LDA ram_dir_link
    JSR sub_bat_7013_get_Y_from_direction
    AND ram_03F8_link
    BNE bra_915B
    LDA ram_dir_link
bra_915B:
    STA ram_03F8_link
bra_915E_RTS:
    RTS


; bzk garbage, a copy of 0x01029A
    LDA #$F8
    STA ram_spr_Y + $40
    STA ram_spr_Y + $44
    RTS



tbl_9168:
    .byte $78   ; 00 
    .byte $78   ; 01 
    .byte $8D   ; 02 
    .byte $8D   ; 03 



tbl_916C:
    .byte $3D   ; 00 
    .byte $BD   ; 01 
    .byte $00   ; 02 
    .byte $CF   ; 03 



tbl_9170:
    .byte $5E   ; 00 
    .byte $DE   ; 01 
    .byte $21   ; 02 
    .byte $F1   ; 03 



tbl_9174:
    .byte $3D   ; 00 
    .byte $BF   ; 01 
    .byte $00   ; 02 
    .byte $D2   ; 03 



tbl_9178:
    .byte $5C   ; 00 
    .byte $DE   ; 01 
    .byte $1F   ; 02 
    .byte $F1   ; 03 



sub_0x01518C:
    LDA ram_0053
    BNE bra_91A2
bra_9180_loop:
    LDA ram_dir_link
    JSR sub_920F
    LDY #$03
bra_9187_loop:
    LDA ram_0000_t67
    CMP tbl_9168,Y
    BNE bra_919A
    LDA ram_0001_t13
    CMP tbl_916C,Y
    BCC bra_919A
    CMP tbl_9170,Y
    BCC bra_91D6
bra_919A:
    DEY
    BPL bra_9187_loop
bra_919D:
    LDA #$00
    STA ram_0053
    RTS
bra_91A2:
    PHA
    JSR sub_920F
    PLA
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_0001_t13
    CMP tbl_916C,Y
    BCC bra_91BC
    CMP tbl_9170,Y
    BCS bra_91BC
    LDA ram_0053
    CMP ram_dir_link
    BEQ bra_9180_loop
bra_91BC:
    LDY #$03
bra_91BE_loop:
    LDA ram_0000_t67
    CMP tbl_9168,Y
    BNE bra_91D1
    LDA ram_0001_t13
    CMP tbl_9174,Y
    BCC bra_91D1
    CMP tbl_9178,Y
    BCC bra_91D6
bra_91D1:
    DEY
    BPL bra_91BE_loop
    BMI bra_919D    ; jmp
bra_91D6:
    STY ram_000E_t09
    LDA ram_03F8_link
    AND #$0F
    STA ram_0002_t24_direction
    STA ram_000C_t08
    CMP tbl_bat_6DC3_direction,Y
    BNE bra_920B_RTS
    JSR sub_A3F6
    STA ram_000D_t09
    JSR sub_9220
    LDY ram_000E_t09
    BMI bra_920B_RTS
    LDA tbl_bat_6DC3_direction,Y
    STA ram_dir_link
    STA ram_000F_t01_direction
    STA ram_0053
    LDA ram_000D_t09
    AND #$07
    CMP #$02
    BEQ bra_920C
    CMP #$03
    BEQ bra_920C
    CMP #$04
    BEQ bra_920C
bra_920B_RTS:
    RTS
bra_920C:
    JMP loc_0x01F192



sub_920F:
; out
    ; ram_0000_t67
    ; ram_0001_t13
    LDX ram_pos_X_link
    LDY ram_pos_Y_link
    AND #$03
    BEQ bra_921B
    LDY ram_pos_X_link
    LDX ram_pos_Y_link
bra_921B:
    STX ram_0000_t67
    STY ram_0001_t13
    RTS



sub_9220:
    AND #$07
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_022_9239_00_RTS
    .word ofs_022_9235_01
    .word ofs_022_923A_02
    .word ofs_022_923A_03
    .word ofs_022_924A_04
    .word ofs_022_926B_05
    .word ofs_022_926B_06
    .word ofs_022_9251_07



bra_9235:
loc_9235:
ofs_022_9235_01:
    LDY #$FF
    STY ram_000E_t09
ofs_022_9239_00_RTS:
    RTS



ofs_022_923A_02:
ofs_022_923A_03:
    LDA ram_timer_link
    BEQ bra_9243
    CMP #$01
    BNE bra_9247
    RTS
bra_9243:
    LDA #$18
    STA ram_timer_link
bra_9247:
    JMP loc_9235



ofs_022_924A_04:
    LDA ram_000C_t08
    AND ram_00EE
    BEQ bra_9235
    RTS



ofs_022_9251_07:
    LDA ram_0054_timer
    BNE bra_9235
    LDA ram_000C_t08
    AND ram_00EE
    BEQ bra_9235
    AND ram_0519
    BEQ bra_9262
    BNE bra_928E    ; jmp
bra_9262:
    LDA ram_0519
    ORA ram_000C_t08
    STA ram_0519
    RTS



ofs_022_926B_05:
ofs_022_926B_06:
    LDA ram_000C_t08
    AND ram_00EE
    BNE bra_9292_RTS
    LDA ram_0054_timer
    BNE bra_928E
    LDA ram_item_magic_key
    BNE bra_9282
    LDA ram_item_keys
    BEQ bra_928B
    DEC ram_item_keys
bra_9282:
    LDA ram_000C_t08
    JSR sub_8ADA
    LDA #$20
    STA ram_timer_link
bra_928B:
    JMP loc_9235
bra_928E:
    LDA ram_timer_link
    BNE bra_928B
bra_9292_RTS:
    RTS



sub_9293:
    LDY #$05
    LDA ram_map_location
bra_9297_loop:
    CMP ram_room_history,Y
    BEQ bra_92C6
    DEY
    BPL bra_9297_loop
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    AND #$C0
    CMP #$C0
    BNE bra_92C6
    LDA ram_0002_t38_obj_id
    CMP #$32
    BCC bra_92BA
    CMP #$3A
    BEQ bra_92BA
    CMP #$3B
    BEQ bra_92BA
    CMP #$49
    BCC bra_92D0
bra_92BA:
    LDA (ram_0000_t13_data),Y
    AND #$3F
    STA (ram_0000_t13_data),Y
    LDA #$00
    STA ram_0560,Y
    RTS
bra_92C6:
    LDY ram_map_location
    LDA ram_0003_t15_objects_counter
    SEC
    SBC ram_0560,Y
    BPL bra_92D4
bra_92D0:
    LDA #$00
    STA ram_0002_t38_obj_id
bra_92D4:
    STA ram_0003_t15_objects_counter
    RTS



sub_92D7:
; code for dungeons only, not for overworld
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    AND #$3F
    STA (ram_0000_t13_data),Y
    LDA ram_enemy_cnt
    BEQ bra_9316
    LDA ram_room_kill_cnt
    BEQ bra_92FB
    LDY ram_copy_obj_id
    CPY #$32
    BCC bra_92FB
    CPY #con_obj_id_3A
    BEQ bra_92FB
    CPY #con_obj_id_3B
    BEQ bra_92FB
    CPY #$49
    BCC bra_9316
bra_92FB:
    CMP ram_enemy_cnt
    BCS bra_9316
    LDY ram_map_location
    CLC
    ADC ram_0560,Y
    STA ram_0560,Y
    CMP #$03
    BCC bra_930F_not_overflow
    LDA #$02
bra_930F_not_overflow:
    CLC
    ROR
    ROR
    ROR
    JMP loc_931F
bra_9316:
    LDY ram_map_location
    LDA #$0F
    STA ram_0560,Y
    LDA #$C0
loc_931F:
    ORA (ram_0000_t13_data),Y
    STA (ram_0000_t13_data),Y
    RTS



tbl_9324_sfx_1:
    .byte $00   ; 00 
    .byte con_sfx_1_10   ; 01 
    .byte con_sfx_1_20   ; 02 
    .byte con_sfx_1_40   ; 03 



sub_0x015338:
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    LDY ram_6BBC
    LDA (ram_0000_t13_data),Y
    AND #$C0
    CMP #$C0
    BEQ bra_934D
    LDY ram_map_location
    LDA ram_6A7E_map_data,Y
    AND #$60
    ASL
    ROL
    ROL
    ROL
    TAX
    LDA tbl_9324_sfx_1,X
    BEQ bra_934D
    ORA #con_sfx_1_80
    STA ram_sfx_1
    RTS
bra_934D:
    LDA #con_sfx_3_80
    JMP loc_bat_6D80_set_sfx_3


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



sub_9400:
; in
    ; ram_0002_t05_data
    ; ram_0004_t19
    ; ram_0007_t08
    ; ram_0009_t01
    LDY ram_0009_t01
    LDA tbl_A5E3,Y
    CLC
    ADC ram_0007_t08
    TAY
    LDA tbl_A5D5,Y
    TAY
    LDA (ram_0002_t05_data),Y
    STA ram_0302_ppu_buffer,X
    INX
    INC ram_0007_t08
    DEC ram_0004_t19
    RTS



tbl_9418:
    .byte $00, $00, $00, $00, $00, $00, $00, $50, $01, $01, $81, $01, $01, $01, $01, $01   ; 00 
    .byte $01, $F1, $C8, $A0, $A1, $A0, $06, $38, $A1, $D2, $A5, $A4, $A2, $A3, $F0, $A6   ; 01 
    .byte $01, $01, $01, $50, $01, $01, $81, $01, $01, $A7, $A9, $C8, $C7, $A0, $06, $06   ; 02 
    .byte $A1, $A5, $A4, $A8, $F0, $A6, $01, $81, $01, $01, $50, $00, $00, $00, $00, $00   ; 03 
    .byte $00, $E6, $06, $06, $A1, $A0, $E7, $E6, $A1, $84, $90, $02, $10, $02, $02, $A8   ; 04 
    .byte $A9, $A8, $A9, $03, $05, $E4, $24, $02, $02, $03, $05, $22, $24, $02, $A8, $A6   ; 05 
    .byte $A7, $A6, $A7, $F1, $A9, $A8, $A9, $A2, $A3, $A8, $A6, $A7, $A6, $A7, $A6, $01   ; 06 
    .byte $01, $01, $01, $01, $50, $01, $A7, $F1, $F0, $A6, $81, $01, $A7, $A6, $01, $01   ; 07 
    .byte $A7, $A9, $A8, $A9, $71, $32, $33, $02, $34, $02, $34, $02, $34, $A8, $F0, $00   ; 08 
    .byte $00, $A9, $10, $53, $54, $B1, $55, $B2, $54, $54, $54, $56, $02, $B5, $A8, $00   ; 09 
    .byte $00, $F1, $A9, $B7, $02, $B7, $67, $68, $70, $B7, $02, $B7, $A5, $A4, $A8, $00   ; 0A 
    .byte $00, $00, $00, $00, $00, $50, $A7, $A9, $10, $02, $A2, $A3, $F0, $F1, $A9, $02   ; 0B 
    .byte $02, $02, $A8, $F0, $F1, $A9, $A5, $A4, $02, $D2, $C8, $C7, $A0, $38, $E7, $00   ; 0C 
    .byte $80, $80, $80, $80, $80, $96, $80, $80, $80, $80, $13, $13, $13, $13, $13, $13   ; 0D 
    .byte $13, $00, $02, $02, $67, $70, $02, $67, $D7, $70, $02, $67, $70, $02, $00, $13   ; 0E 
    .byte $00, $F1, $A9, $02, $33, $02, $32, $B6, $34, $D2, $02, $64, $F2, $F3, $02, $64   ; 0F 
    .byte $66, $02, $E5, $D8, $66, $02, $02, $B6, $71, $02, $32, $02, $33, $02, $A8, $00   ; 10 
    .byte $00, $E6, $06, $83, $06, $A1, $84, $90, $D2, $64, $F2, $F3, $64, $F2, $F3, $64   ; 11 
    .byte $66, $02, $D2, $C8, $C7, $A0, $06, $06, $06, $06, $83, $06, $A1, $84, $90, $02   ; 12 
    .byte $02, $A2, $A3, $B7, $02, $02, $B7, $02, $02, $B7, $B5, $02, $D2, $B7, $C8, $A0   ; 13 
    .byte $06, $E7, $E6, $38, $06, $E7, $E6, $A1, $A2, $A3, $A8, $A9, $D2, $B5, $A8, $A9   ; 14 
    .byte $A8, $A9, $A2, $A3, $A8, $A9, $D2, $02, $A0, $06, $A1, $A6, $A7, $F1, $A9, $02   ; 15 
    .byte $A5, $A4, $C8, $A0, $83, $06, $B4, $B0, $B0, $B0, $B0, $73, $73, $73, $73, $73   ; 16 
    .byte $73, $73, $73, $73, $73, $73, $73, $73, $72, $72, $72, $72, $D4, $72, $72, $72   ; 17 
    .byte $72, $72, $72, $72, $D4, $72, $72, $72, $72, $72, $72, $72, $72, $72, $72, $72   ; 18 
    .byte $72, $72, $72, $72, $72, $72, $C1, $06, $06, $06, $06, $06, $06, $83, $06, $01   ; 19 
    .byte $01, $A7, $A9, $32, $02, $33, $02, $11, $32, $02, $32, $02, $71, $A8, $A6, $01   ; 1A 
    .byte $A7, $A9, $02, $B5, $02, $B6, $02, $B7, $02, $B7, $02, $B7, $02, $B7, $02, $02   ; 1B 
    .byte $02, $02, $B5, $71, $A8, $00, $E6, $04, $04, $D6, $97, $91, $51, $B8, $51, $51   ; 1C 
    .byte $51, $51, $51, $51, $51, $B8, $51, $01, $01, $90, $02, $02, $D2, $02, $02, $02   ; 1D 
    .byte $02, $02, $64, $66, $E5, $D8, $65, $66, $E5, $F3, $64, $F2, $F3, $02, $00, $13   ; 1E 
    .byte $00, $00, $E2, $82, $07, $07, $88, $07, $07, $82, $07, $07, $82, $07, $02, $02   ; 1F 
    .byte $02, $02, $07, $82, $07, $07, $82, $07, $07, $88, $07, $07, $82, $07, $15, $15   ; 20 
    .byte $00, $00, $02, $B7, $B7, $B7, $67, $D7, $F5, $70, $B7, $B7, $B7, $02, $00, $00   ; 21 
    .byte $00, $A9, $02, $71, $32, $34, $B5, $A8, $00, $00, $A9, $02, $02, $B5, $02, $02   ; 22 
    .byte $02, $02, $B7, $A8, $A9, $B7, $A2, $A3, $B7, $02, $B6, $B7, $A2, $A3, $B7, $02   ; 23 
    .byte $02, $02, $B7, $B6, $B5, $B7, $A2, $A3, $B7, $02, $10, $B7, $02, $B6, $A8, $00   ; 24 
    .byte $00, $A9, $07, $D3, $02, $A8, $F0, $F1, $A9, $39, $91, $51, $97, $91, $51, $97   ; 25 
    .byte $91, $51, $97, $91, $51, $97, $13, $C3, $58, $58, $58, $91, $51, $97, $85, $47   ; 26 
    .byte $61, $61, $61, $61, $61, $61, $60, $76, $76, $17, $17, $26, $17, $31, $28, $17   ; 27 
    .byte $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9   ; 28 
    .byte $F9, $F9, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $F9   ; 29 
    .byte $F9, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $F9, $F9   ; 2A 
    .byte $02, $02, $02, $B6, $02, $03, $05, $21, $21, $E4, $24, $02, $A0, $06, $06, $06   ; 2B 
    .byte $06, $06, $83, $A1, $02, $D2, $A2, $18, $18, $35, $36, $36, $36, $36, $36, $36   ; 2C 
    .byte $36, $36, $52, $52, $52, $52, $52, $52, $86, $E1, $13, $13, $13, $13, $13, $13   ; 2D 
    .byte $00, $02, $67, $70, $02, $67, $87, $70, $02, $67, $70, $02, $02, $00, $00, $00   ; 2E 
    .byte $00, $00, $18, $94, $18, $18, $94, $18, $18, $94, $18, $18, $94, $18, $A3, $02   ; 2F 
    .byte $02, $A2, $18, $94, $18, $18, $94, $18, $18, $94, $18, $18, $94, $18, $16, $16   ; 30 
    .byte $F0, $F1, $A9, $C8, $C7, $A0, $06, $83, $A1, $A5, $A4, $C8, $C7, $A6, $01, $01   ; 31 
    .byte $01, $A7, $02, $B7, $02, $B7, $B6, $B7, $02, $B7, $D2, $B7, $02, $B6, $00, $00   ; 32 
    .byte $00, $A9, $B7, $02, $B7, $02, $B7, $02, $07, $39, $47, $47, $47, $47, $91, $78   ; 33 
    .byte $78, $78, $78, $78, $B8, $51, $97, $91, $51, $51, $51, $97, $91, $51, $51, $97   ; 34 
    .byte $91, $97, $58, $58, $91, $51, $97, $91, $97, $13, $13, $13, $13, $13, $13, $13   ; 35 
    .byte $13, $00, $02, $64, $F2, $F3, $64, $65, $66, $E5, $D8, $66, $02, $02, $01, $12   ; 36 
    .byte $12, $12, $12, $12, $12, $12, $44, $18, $18, $17, $28, $17, $25, $17, $17, $15   ; 37 
    .byte $00, $A9, $02, $77, $02, $53, $54, $D1, $D1, $54, $56, $02, $77, $02, $A8, $00   ; 38 
    .byte $00, $00, $C6, $C6, $C6, $C6, $C6, $C5, $C5, $C6, $C6, $C6, $C6, $C6, $C6, $F9   ; 39 
    .byte $F9, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C5, $C5, $00, $00   ; 3A 
    .byte $15, $76, $26, $76, $26, $76, $49, $18, $18, $49, $76, $26, $76, $25, $76, $15   ; 3B 
    .byte $00, $00, $D5, $08, $08, $08, $08, $08, $08, $35, $36, $36, $36, $36, $36, $36   ; 3C 
    .byte $36, $36, $36, $36, $36, $52, $D0, $52, $86, $E1, $13, $13, $13, $13, $13, $13   ; 3D 
    .byte $00, $00, $D5, $93, $08, $08, $93, $08, $08, $93, $08, $08, $93, $08, $B5, $02   ; 3E 
    .byte $02, $02, $08, $93, $08, $08, $93, $08, $08, $93, $08, $08, $93, $08, $15, $15   ; 3F 
    .byte $00, $A9, $02, $77, $10, $77, $02, $07, $18, $45, $13, $13, $13, $13, $13, $13   ; 40 
    .byte $13, $00, $02, $02, $67, $70, $02, $67, $D7, $70, $02, $67, $70, $02, $00, $13   ; 41 
    .byte $13, $13, $13, $13, $13, $13, $43, $92, $52, $F7, $62, $62, $62, $62, $62, $62   ; 42 
    .byte $62, $62, $62, $62, $62, $62, $62, $62, $62, $62, $62, $F7, $62, $62, $62, $62   ; 43 
    .byte $62, $62, $62, $48, $48, $48, $41, $18, $18, $17, $17, $17, $17, $14, $15, $15   ; 44 
    .byte $15, $15, $17, $75, $17, $16, $16, $18, $18, $16, $16, $16, $16, $16, $16, $16   ; 45 
    .byte $F0, $F1, $A9, $A2, $A3, $77, $02, $08, $08, $02, $77, $10, $02, $A8, $F0, $F1   ; 46 
    .byte $16, $76, $27, $76, $76, $76, $26, $76, $25, $76, $15, $14, $18, $18, $15, $15   ; 47 
    .byte $00, $F1, $A2, $A3, $A2, $A3, $A0, $83, $06, $06, $A1, $A2, $A3, $A6, $01, $A7   ; 48 
    .byte $16, $23, $25, $18, $25, $23, $26, $23, $23, $25, $23, $26, $18, $31, $23, $16   ; 49 
    .byte $16, $28, $17, $17, $17, $49, $17, $17, $17, $17, $49, $17, $17, $17, $28, $15   ; 4A 
    .byte $00, $00, $E6, $A1, $A2, $18, $18, $18, $18, $45, $12, $13, $12, $13, $13, $13   ; 4B 
    .byte $00, $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $83, $00   ; 4C 
    .byte $15, $28, $17, $25, $17, $25, $17, $25, $17, $31, $76, $76, $16, $16, $16, $16   ; 4D 
    .byte $16, $16, $17, $17, $30, $57, $57, $74, $74, $57, $57, $57, $57, $57, $30, $30   ; 4E 
    .byte $30, $30, $17, $17, $76, $76, $31, $18, $18, $76, $27, $76, $17, $76, $28, $16   ; 4F 
    .byte $16, $16, $17, $76, $76, $26, $17, $23, $23, $46, $52, $48, $48, $52, $37, $37   ; 50 
    .byte $37, $37, $52, $52, $86, $13, $13, $92, $D0, $52, $36, $52, $36, $52, $37, $37   ; 51 
    .byte $37, $37, $37, $48, $48, $48, $41, $23, $23, $17, $31, $17, $25, $25, $17, $17   ; 52 
    .byte $17, $17, $17, $27, $17, $27, $17, $26, $17, $26, $17, $27, $17, $26, $17, $26   ; 53 
    .byte $26, $17, $26, $76, $27, $76, $26, $18, $18, $26, $76, $26, $76, $27, $76, $16   ; 54 
    .byte $16, $16, $16, $16, $16, $16, $16, $18, $18, $63, $42, $42, $42, $42, $42, $42   ; 55 
    .byte $42, $42, $42, $61, $61, $61, $60, $76, $76, $76, $76, $17, $17, $25, $76, $17   ; 56 
    .byte $17, $18, $31, $18, $18, $18, $25, $18, $25, $18, $26, $17, $18, $23, $17, $30   ; 57 
    .byte $30, $30, $30, $30, $57, $29, $29, $29, $29, $29, $29, $29, $76, $16, $16, $16   ; 58 
    .byte $16, $16, $16, $18, $16, $16, $16, $16, $16, $16, $16, $16, $18, $16, $16, $16   ; 59 
    .byte $F1, $A9, $02, $02, $77, $A2, $A3, $10, $A8, $F0, $F1, $A9, $77, $02, $A8, $00   ; 5A 
    .byte $15, $15, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $28, $16   ; 5B 
    .byte $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $18, $18, $16, $16, $16, $16   ; 5C 
    .byte $16, $16, $16, $16, $16, $19, $18, $76, $14, $19, $19, $19, $19, $19, $28, $28   ; 5D 
    .byte $28, $28, $17, $26, $23, $23, $31, $18, $18, $18, $26, $18, $27, $18, $28, $16   ; 5E 
    .byte $F0, $F1, $A9, $08, $08, $A4, $77, $10, $A5, $08, $08, $A4, $A5, $08, $A4, $02   ; 5F 
    .byte $02, $A5, $08, $E3, $18, $12, $12, $08, $08, $08, $33, $08, $32, $08, $A4, $02   ; 60 
    .byte $02, $02, $02, $33, $33, $33, $33, $10, $32, $32, $32, $E8, $07, $07, $A8, $F0   ; 61 
    .byte $F1, $A9, $02, $33, $02, $33, $02, $D3, $07, $A8, $A9, $02, $33, $02, $A8, $F0   ; 62 
    .byte $F1, $A9, $31, $18, $26, $18, $27, $18, $18, $26, $18, $27, $18, $26, $18, $16   ; 63 
    .byte $16, $28, $25, $17, $17, $26, $17, $23, $23, $40, $48, $48, $48, $48, $48, $48   ; 64 
    .byte $48, $48, $48, $48, $48, $48, $41, $23, $23, $23, $23, $17, $31, $17, $23, $17   ; 65 
    .byte $17, $23, $25, $23, $23, $23, $25, $23, $31, $23, $26, $76, $18, $76, $28, $16   ; 66 
    .byte $16, $16, $16, $16, $19, $14, $28, $17, $17, $17, $17, $17, $23, $30, $30, $30   ; 67 
    .byte $30, $30, $17, $23, $29, $29, $29, $29, $29, $29, $14, $29, $19, $16, $16, $16   ; 68 
    .byte $16, $28, $17, $26, $26, $26, $17, $27, $27, $17, $25, $25, $25, $25, $17, $17   ; 69 
    .byte $A3, $02, $02, $10, $A2, $18, $18, $18, $18, $45, $13, $13, $13, $13, $13, $13   ; 6A 
    .byte $00, $A7, $F1, $A9, $02, $64, $F2, $F3, $64, $F2, $F3, $10, $02, $02, $02, $02   ; 6B 
    .byte $02, $02, $02, $A5, $A4, $D2, $02, $02, $02, $A5, $08, $08, $A4, $A8, $F0, $F1   ; 6C 
    .byte $16, $16, $F4, $F4, $F4, $F4, $74, $74, $30, $30, $30, $30, $30, $30, $30, $30   ; 6D 
    .byte $30, $30, $30, $30, $30, $30, $30, $23, $23, $23, $27, $23, $17, $23, $28, $16   ; 6E 
    .byte $F1, $A9, $02, $02, $B7, $02, $B7, $67, $F5, $70, $B7, $02, $B7, $02, $A8, $00   ; 6F 
    .byte $00, $A9, $10, $C0, $E3, $13, $13, $A3, $33, $02, $32, $02, $33, $02, $02, $02   ; 70 
    .byte $02, $02, $34, $02, $02, $34, $D2, $02, $33, $02, $32, $A5, $08, $08, $F0, $A6   ; 71 
    .byte $01, $A7, $84, $90, $10, $02, $A5, $08, $08, $A0, $06, $06, $06, $06, $01, $01   ; 72 
    .byte $A7, $F1, $25, $23, $31, $23, $26, $23, $23, $26, $23, $26, $23, $26, $23, $17   ; 73 
    .byte $A3, $C8, $C7, $A0, $E7, $E6, $A2, $A3, $71, $32, $34, $02, $A8, $A6, $01, $01   ; 74 
    .byte $01, $A7, $A6, $01, $A7, $F1, $A9, $39, $47, $85, $47, $58, $58, $58, $47, $47   ; 75 
    .byte $47, $47, $47, $47, $47, $47, $85, $47, $47, $47, $47, $47, $47, $47, $47, $47   ; 76 
    .byte $47, $47, $91, $51, $97, $91, $51, $51, $51, $97, $91, $51, $97, $91, $97, $91   ; 77 
    .byte $97, $91, $51, $51, $97, $58, $58, $58, $F6, $E0, $13, $13, $13, $13, $13, $13   ; 78 
off_9BA8_00_normal_cave:
    .byte $00, $00, $95, $95, $95, $95, $95, $C2, $C2, $95, $95, $95, $95, $95, $00, $00   ; 79 
off_9BB8_02_cave_with_3_teleports:
    .byte $00, $00, $95, $95, $95, $F8, $95, $C2, $F8, $95, $95, $F8, $95, $95, $00, $00   ; 7A 
    .byte $00, $A9, $64, $66, $02, $53, $54, $D1, $54, $54, $56, $02, $64, $66, $A8, $00   ; 7B 



tbl_9BD8_overworld:
_off006_0x015BE8_00:
    .byte $DB, $5B, $5B   ; 00 
    .byte $DB, $5B, $1B, $0E, $1A, $5B   ; 01 
    .byte $DB, $4E, $4E, $4E, $0E, $1A, $1B   ; 02 
    .byte $DB, $4E, $32, $1B, $34, $4E, $1A, $1B   ; 03 
    .byte $DB, $5B, $1B, $4E, $4E, $4E   ; 04 
    .byte $DB, $0E, $32, $5B, $1B, $4E, $1A, $1B   ; 05 
    .byte $DB, $5B, $1B, $4E, $4E, $1A, $1B   ; 06 
    .byte $DB   ; 07 
    .byte $CE, $4E, $4E, $4E, $0E, $1A, $1B   ; 08 



_off006_0x015C1D_10:
    .byte $9B, $0C, $4E, $4E, $4E, $0E, $1A, $1B   ; 10 
    .byte $CA, $4E, $0E, $4E, $4E, $4A   ; 11 
    .byte $C5, $45, $05, $0B   ; 12 
    .byte $C5, $45, $05, $45, $45, $45   ; 13 
    .byte $D9, $28, $59   ; 14 
    .byte $D9, $59, $59, $19   ; 15 
    .byte $D9, $59, $4E, $0E, $59   ; 16
    .byte $D9, $4E, $4E, $4E, $0E, $59   ; 17
    .byte $8E, $4E, $4E   ; 18
    .byte $CE, $4E, $4E, $0E   ; 19



_off006_0x015C4E_20:
    .byte $D9, $59, $0E, $4E, $4E, $4E   ; 20 
    .byte $DB, $0E, $5B, $5B, $4E, $1A, $1B   ; 21 
    .byte $DB, $0E, $33, $5B, $1B, $4E, $1A, $1B   ; 22 
    .byte $CE, $4E, $4E, $4E, $0E, $59   ; 23 
    .byte $DB, $4E, $33, $1B, $35, $4E, $1A, $1B   ; 24 
    .byte $D9, $4E, $19, $0E, $19, $4E   ; 25 
    .byte $D9, $0E, $19, $0E, $19, $0E, $19, $0E   ; 26 
    .byte $D9, $4E, $0E, $19, $0E, $4E   ; 27 
    .byte $D9, $19, $4E, $4E, $0E, $19   ; 28 
    .byte $D9, $0E, $59, $59, $59   ; 29 



_off006_0x015C90_30:
    .byte $D9, $0E, $59, $59, $19, $0E   ; 30 
    .byte $D9, $4E, $19, $0E, $28, $4E, $59   ; 31 
    .byte $DB, $4E, $13, $0E, $13, $4E, $1A, $1B   ; 32 
    .byte $DB, $0E, $13, $0E, $13, $0E, $13, $0E, $1A, $1B   ; 33 
    .byte $DB, $4E, $0E, $13, $4E, $0E, $1A, $1B   ; 34 
    .byte $C8, $48, $17, $4E, $4E, $1A, $1B   ; 35 
    .byte $C5, $45, $07, $4E, $4E, $1A, $1B   ; 36 
    .byte $C5, $45, $07, $0E, $1A   ; 37 
    .byte $DB, $5B, $1B, $4E, $4E, $4A   ; 38 
    .byte $DB, $4E, $4E, $15   ; 39 



_off006_0x015CD4_40:
    .byte $C8, $48, $17, $4E, $4E, $59   ; 40 
    .byte $C9, $49, $18, $4E, $4E   ; 41 
    .byte $D9, $59, $4E, $06   ; 42 
    .byte $C5, $45, $45   ; 43 
    .byte $C9, $49, $09, $0B, $49, $49, $09   ; 44 
    .byte $C8, $48, $08, $48   ; 45 
    .byte $C8, $48, $17, $4E, $4E, $4E   ; 46 
    .byte $DB, $4E, $4E, $06   ; 47 
    .byte $C5, $45, $07, $4E, $4E   ; 48 
    .byte $D9, $4E, $2C, $4E, $4E, $59   ; 49 



_off006_0x015D06_50:
    .byte $DB, $5B, $1B, $0E, $4A, $4A, $0A   ; 50 
    .byte $DB, $5B, $4E, $06   ; 51 
    .byte $C5, $45, $07, $4E, $4E, $4E   ; 52 
    .byte $DB, $0E, $15, $48, $17, $4E, $1A, $1B   ; 53 
    .byte $DB, $0E, $06, $45, $07, $4E, $1A, $1B   ; 54 
    .byte $DB, $0E, $06, $05, $45, $45, $45   ; 55 
    .byte $DB, $0E, $16, $49, $18, $4E, $1A, $1B   ; 56 
    .byte $D9, $0E, $59, $59, $19, $0E   ; 57 
    .byte $CE, $4E, $4E, $06, $45, $45   ; 58 



_off006_0x015D42_60:
    .byte $D9, $4E, $4E, $16, $49, $49   ; 60 
    .byte $D9, $4E, $4E, $06   ; 61 
    .byte $C5, $45, $07, $4E   ; 62 
    .byte $D9, $59, $4E, $15, $48, $48   ; 63 
    .byte $DB, $0E, $1C, $1F, $4E, $4E, $1A, $1B   ; 64 
    .byte $DB, $0E, $1D, $0C, $4E, $4E, $1A, $1B   ; 65 
    .byte $DB, $0E, $1E, $20, $4E, $4E, $1A, $1B   ; 66 
    .byte $DB, $0E, $21, $24, $4E, $4E, $1A, $1B   ; 67 
    .byte $DB, $0E, $22, $0C, $4E, $4E, $4A   ; 68 



_off006_0x015D7D_70:
    .byte $DB, $0E, $23, $25, $4E, $4E, $1A, $1B   ; 70 
    .byte $DB, $4E, $0E, $26, $4E, $0E, $1A, $1B   ; 71 
    .byte $DB, $5B, $07, $4E, $1A, $1B   ; 72 
    .byte $DB, $5B, $07, $4E, $4E, $1A, $1B   ; 73 
    .byte $CE, $0E, $59, $59, $19, $0E   ; 74 
    .byte $D9, $4E, $0E, $26, $4E, $0E   ; 75 
    .byte $D9, $4E, $4E, $4E, $4E, $0E   ; 76 
    .byte $DB, $4E, $19, $0E, $19, $4E, $1A, $1B   ; 77 
    .byte $DB, $5B, $5B, $45   ; 78 



_off006_0x015DB8_80:
    .byte $C5, $05, $5B, $5B   ; 80 
    .byte $DB, $5B, $27, $0E, $1A, $5B   ; 81 
    .byte $DB, $0E, $14, $0E, $14, $0E, $14, $4E, $0E   ; 82 
    .byte $CA, $4A, $0A, $4E, $4E, $1A, $1B   ; 83 
    .byte $DB, $1B, $35, $4E, $4E, $0E, $1A, $1B   ; 84 
    .byte $9B, $27, $4E, $4E, $06   ; 85 
    .byte $C5, $45, $05, $2F, $4E, $4E, $0E   ; 86 
    .byte $DB, $0E, $22, $0C, $4E, $4E, $4A   ; 87 
    .byte $DB, $0E, $14, $0E, $29, $0E, $14, $4E, $0E   ; 88 



_off006_0x015DF6_90:
    .byte $DB, $35, $4E, $4E, $4E, $1A, $1B   ; 90 
    .byte $DB, $1B, $34, $4E, $06   ; 91 
    .byte $C5, $45, $05, $2E, $4E, $4E, $0E   ; 92 
    .byte $CE, $0E, $14, $0E, $14, $0E, $14, $0E, $1A, $1B   ; 93 
    .byte $CE, $0E, $14, $0E, $14, $0E, $14, $4E, $0E   ; 94 
    .byte $DB, $4D, $4D, $4D, $0D, $1A, $1B   ; 95 
    .byte $C5, $05, $1B, $0C, $4E, $0E, $4A, $0A   ; 93 
    .byte $DB, $1B, $35, $4E, $06, $45   ; 97 
    .byte $C5, $4E, $4E, $4E, $0E, $45   ; 98 



_off006_0x015E37_A0:
    .byte $DB, $5B, $34, $4E, $4E, $1A, $1B   ; A0 
    .byte $DB, $5B, $35, $4E, $4E, $1A, $1B   ; A1 
    .byte $9B, $35, $4E, $4E, $4E, $0E, $33, $1B   ; A2 
    .byte $9B, $34, $4E, $4E, $4E, $0E, $32, $1B   ; A3 
    .byte $9B, $34, $4E, $4E, $4E, $0E, $1A, $1B   ; A4 
    .byte $9B, $35, $4E, $4E, $4E, $0E, $1A, $1B   ; A5 
    .byte $DB, $5B, $34, $0E, $32   ; A6 
    .byte $DB, $5B, $35, $0E, $33, $5B   ; A7 
    .byte $DB, $34, $4E, $4E, $0E, $32   ; A8 
    .byte $DB, $35, $4E, $4E, $0E, $33   ; A9 



_off006_0x015E7C_B0:
    .byte $DB, $5B, $07, $4E, $4E, $4E   ; B0 
    .byte $DB, $0E, $06, $05, $45, $2F, $0E, $1A, $1B   ; B1 
    .byte $DB, $0E, $06, $05, $45, $2E, $0E, $1A, $1B   ; B2 
    .byte $CA, $4A, $0A, $0E, $1A   ; B3 
    .byte $DB, $5B, $15, $45, $45, $45   ; B4 
    .byte $DB, $4E, $4E, $4E, $0E   ; B5 
    .byte $CA, $4E, $4E, $4E, $0E, $1A, $1B   ; B6 
    .byte $DB, $4E, $2C, $0E, $2C, $4E, $1A, $1B   ; B7 
    .byte $CA, $4A, $4E, $06, $45, $45   ; B8 



_off006_0x015EB9_C0:
    .byte $9B, $35, $4E, $0E, $13, $4E, $0E, $1A, $1B   ; C0 
    .byte $F6, $76, $0F, $4E, $1A, $1B, $5B   ; C1 
    .byte $DB, $4D, $4D, $4D, $4D, $0D   ; C2 
    .byte $CE, $4E, $0E, $30, $45, $45, $05   ; C3 
    .byte $DB   ; C4 
    .byte $F7   ; C5 
    .byte $F7, $77, $77, $37, $77, $1A, $1B   ; C6 
    .byte $DB, $1B, $34, $4E, $4E, $0E, $1A, $1B   ; C7 
    .byte $DB, $34, $0E, $4E, $4E, $0E, $1A, $1B   ; C8 



_off006_0x015EEF_D0:
    .byte $C5, $45, $0B, $4E, $4E, $4E   ; D0 
    .byte $DB, $0E, $06, $45, $07, $4E, $4E   ; D1 
    .byte $9B, $27, $4E, $4E, $4E, $0E, $1A, $1B   ; D2 
    .byte $9B, $27, $4E, $4E, $4E, $4E, $0E   ; D3 
    .byte $DB, $1B, $27, $07, $4E, $1A, $5B, $1B   ; D4 
    .byte $CE, $4E, $4E, $4E, $33, $5B   ; D5 
    .byte $DB, $5B, $1B, $0E, $15, $48, $48   ; D6 
    .byte $DB, $0E, $2D, $0C, $4E, $4E, $4A   ; D7 
    .byte $DB, $0E, $1C, $1F, $0E, $1E, $20, $0E, $1A, $1B   ; D8 



_off006_0x015F31_E0:
    .byte $C8, $48, $08   ; E0 
    .byte $C5, $45, $45, $08, $48, $48   ; E1 
    .byte $DB, $35   ; E2 
    .byte $CE, $4E, $4E, $4E, $0E, $33, $1B   ; E3 
    .byte $DB, $0E, $33, $5B, $27, $4E, $1A, $1B   ; E4 
    .byte $DB, $4E, $4E, $1C, $1F, $0E, $1A, $1B   ; E5 
    .byte $DB, $5B, $1B, $35, $4E, $33   ; E6 
    .byte $DB, $5B, $1B, $34, $4E, $32   ; E7 
    .byte $DB, $4E, $4E, $4E, $0E, $33   ; E8 



_off006_0x015F65_F0:
    .byte $9B, $5B, $34, $4E, $0E, $32   ; F0 
    .byte $DB, $1B, $35, $4E, $0E, $33, $1B   ; F1 
    .byte $DB, $0E, $1E, $20, $0E, $1C, $1F, $0E, $1A, $1B   ; F2 
    .byte $DB, $4E, $4E, $1E, $20, $0E, $1A, $1B   ; F3 
    .byte $D9, $59, $19, $4E, $4E, $59   ; F4 
    .byte $DB, $0E, $2D, $0C, $4E, $4E, $1A, $1B   ; F5 
    .byte $CE, $4E, $0E, $31, $05   ; F6 
    .byte $C5, $45, $07, $4E, $28, $59, $19   ; F7 
    .byte $DB, $4D, $4D, $12, $4D, $1A, $1B   ; F8 
    .byte $DB, $77, $77, $77, $37, $1A, $1B   ; F9 



tbl_9F9C:
; bzk optimize
    .word tbl_9418



tbl_9F9E_overworld:
; bzk optimize
    .word tbl_9BD8_overworld



tbl_9FA0_tiles_id:      ; 78 (4Eh) bytes
; bzk if you change size of this table, make changes to 0x0164A1 as well
;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    .byte $E0, $F5, $F5, $F5, $F5, $B8, $F5, $D4, $F5, $F5, $F5, $C4, $DE, $DE, $BC, $C8   ; 00 
    .byte $DE, $BC, $DE, $DE, $F5, $DC, $C4, $DE, $C8, $DE, $BC, $C8, $DE, $DE, $F5, $DC   ; 10 
    .byte $DC, $00, $C0, $D0, $DC, $00, $F5, $DC, $CC, $00, $F5, $DC, $DC, $00, $F5, $CC   ; 20 
    .byte $D0, $00, $F5, $DC, $DC, $00, $C0, $D0, $DC, $00, $F5, $DC, $CC, $00, $F5, $DC   ; 30 
    .byte $DC, $00, $D8, $CC, $D0, $00, $F5, $DC, $DC, $00, $F5, $DC, $DC, $00             ; 40 



off_9FEE_00:
    .byte $88   ; 00 
    .byte $74   ; 01 
    .byte $8A   ; 02 
    .byte $24   ; 03 
    .byte $87   ; 04 
    .byte $87   ; 05 
    .byte $75   ; 06 
    .byte $89   ; 07 
    .byte $24   ; 08 
    .byte $8B   ; 09 
    .byte $87   ; 0A 
    .byte $87   ; 0B 
    .byte $88   ; 0C 
    .byte $A4   ; 0D 
    .byte $8A   ; 0E 
    .byte $A6   ; 0F 
    .byte $87   ; 10 
    .byte $87   ; 11 
    .byte $A5   ; 12 
    .byte $89   ; 13 
    .byte $A7   ; 14 
    .byte $8B   ; 15 
    .byte $87   ; 16 
    .byte $87   ; 17 
    .byte $88   ; 18 
    .byte $AC   ; 19 
    .byte $8A   ; 1A 
    .byte $AE   ; 1B 
    .byte $87   ; 1C 
    .byte $87   ; 1D 
    .byte $AD   ; 1E 
    .byte $89   ; 1F 
    .byte $AF   ; 20 
    .byte $8B   ; 21 
    .byte $87   ; 22 
    .byte $87   ; 23 
    .byte $DF   ; 24 
    .byte $DF   ; 25 
    .byte $DF   ; 26 
    .byte $DF   ; 27 
    .byte $F5   ; 28 
    .byte $F5   ; 29 
    .byte $DF   ; 2A 
    .byte $DF   ; 2B 
    .byte $DF   ; 2C 
    .byte $DF   ; 2D 
    .byte $F5   ; 2E 
    .byte $F5   ; 2F 
    .byte $DF   ; 30 
    .byte $24   ; 31 
    .byte $DF   ; 32 
    .byte $92   ; 33 
    .byte $F5   ; 34 
    .byte $F5   ; 35 
    .byte $24   ; 36 
    .byte $DF   ; 37 
    .byte $93   ; 38 
    .byte $DF   ; 39 
    .byte $F5   ; 3A 
    .byte $F5   ; 3B 



off_A02A_01:
    .byte $82   ; 00 
    .byte $82   ; 01 
    .byte $83   ; 02 
    .byte $24   ; 03 
    .byte $85   ; 04 
    .byte $76   ; 05 
    .byte $82   ; 06 
    .byte $82   ; 07 
    .byte $24   ; 08 
    .byte $84   ; 09 
    .byte $77   ; 0A 
    .byte $86   ; 0B 
    .byte $82   ; 0C 
    .byte $82   ; 0D 
    .byte $83   ; 0E 
    .byte $A0   ; 0F 
    .byte $85   ; 10 
    .byte $A2   ; 11 
    .byte $82   ; 12 
    .byte $82   ; 13 
    .byte $A1   ; 14 
    .byte $84   ; 15 
    .byte $A3   ; 16 
    .byte $86   ; 17 
    .byte $82   ; 18 
    .byte $82   ; 19 
    .byte $83   ; 1A 
    .byte $AC   ; 1B 
    .byte $85   ; 1C 
    .byte $AE   ; 1D 
    .byte $82   ; 1E 
    .byte $82   ; 1F 
    .byte $AD   ; 20 
    .byte $84   ; 21 
    .byte $AF   ; 22 
    .byte $86   ; 23 
    .byte $F5   ; 24 
    .byte $F5   ; 25 
    .byte $DE   ; 26 
    .byte $DE   ; 27 
    .byte $DE   ; 28 
    .byte $DE   ; 29 
    .byte $F5   ; 2A 
    .byte $F5   ; 2B 
    .byte $DE   ; 2C 
    .byte $DE   ; 2D 
    .byte $DE   ; 2E 
    .byte $DE   ; 2F 
    .byte $F5   ; 30 
    .byte $F5   ; 31 
    .byte $DE   ; 32 
    .byte $90   ; 33 
    .byte $DE   ; 34 
    .byte $24   ; 35 
    .byte $F5   ; 36 
    .byte $F5   ; 37 
    .byte $91   ; 38 
    .byte $DE   ; 39 
    .byte $24   ; 3A 
    .byte $DE   ; 3B 



off_A066_02:
    .byte $7E   ; 00 
    .byte $7F   ; 01 
    .byte $7D   ; 02 
    .byte $76   ; 03 
    .byte $24   ; 04 
    .byte $7D   ; 05 
    .byte $74   ; 06 
    .byte $24   ; 07 
    .byte $7D   ; 08 
    .byte $80   ; 09 
    .byte $81   ; 0A 
    .byte $7D   ; 0B 
    .byte $7E   ; 0C 
    .byte $7F   ; 0D 
    .byte $7D   ; 0E 
    .byte $9C   ; 0F 
    .byte $9D   ; 10 
    .byte $7D   ; 11 
    .byte $9E   ; 12 
    .byte $9F   ; 13 
    .byte $7D   ; 14 
    .byte $80   ; 15 
    .byte $81   ; 16 
    .byte $7D   ; 17 
    .byte $7E   ; 18 
    .byte $7F   ; 19 
    .byte $7D   ; 1A 
    .byte $A8   ; 1B 
    .byte $A9   ; 1C 
    .byte $7D   ; 1D 
    .byte $AA   ; 1E 
    .byte $AB   ; 1F 
    .byte $7D   ; 20 
    .byte $80   ; 21 
    .byte $81   ; 22 
    .byte $7D   ; 23 
    .byte $DD   ; 24 
    .byte $DD   ; 25 
    .byte $F5   ; 26 
    .byte $DD   ; 27 
    .byte $DD   ; 28 
    .byte $F5   ; 29 
    .byte $DD   ; 2A 
    .byte $DD   ; 2B 
    .byte $F5   ; 2C 
    .byte $DD   ; 2D 
    .byte $DD   ; 2E 
    .byte $F5   ; 2F 
    .byte $DD   ; 30 
    .byte $DD   ; 31 
    .byte $F5   ; 32 
    .byte $24   ; 33 
    .byte $8E   ; 34 
    .byte $F5   ; 35 
    .byte $24   ; 36 
    .byte $8F   ; 37 
    .byte $F5   ; 38 
    .byte $DD   ; 39 
    .byte $DD   ; 3A 
    .byte $F5   ; 3B 



off_A0A2_03:
    .byte $78   ; 00 
    .byte $79   ; 01 
    .byte $7A   ; 02 
    .byte $78   ; 03 
    .byte $24   ; 04 
    .byte $77   ; 05 
    .byte $78   ; 06 
    .byte $24   ; 07 
    .byte $75   ; 08 
    .byte $78   ; 09 
    .byte $7B   ; 0A 
    .byte $7C   ; 0B 
    .byte $78   ; 0C 
    .byte $79   ; 0D 
    .byte $7A   ; 0E 
    .byte $78   ; 0F 
    .byte $98   ; 10 
    .byte $99   ; 11 
    .byte $78   ; 12 
    .byte $9A   ; 13 
    .byte $9B   ; 14 
    .byte $78   ; 15 
    .byte $7B   ; 16 
    .byte $7C   ; 17 
    .byte $78   ; 18 
    .byte $79   ; 19 
    .byte $7A   ; 1A 
    .byte $78   ; 1B 
    .byte $A8   ; 1C 
    .byte $A9   ; 1D 
    .byte $78   ; 1E 
    .byte $AA   ; 1F 
    .byte $AB   ; 20 
    .byte $78   ; 21 
    .byte $7B   ; 22 
    .byte $7C   ; 23 
    .byte $F5   ; 24 
    .byte $DC   ; 25 
    .byte $DC   ; 26 
    .byte $F5   ; 27 
    .byte $DC   ; 28 
    .byte $DC   ; 29 
    .byte $F5   ; 2A 
    .byte $DC   ; 2B 
    .byte $DC   ; 2C 
    .byte $F5   ; 2D 
    .byte $DC   ; 2E 
    .byte $DC   ; 2F 
    .byte $F5   ; 30 
    .byte $DC   ; 31 
    .byte $DC   ; 32 
    .byte $F5   ; 33 
    .byte $8C   ; 34 
    .byte $24   ; 35 
    .byte $F5   ; 36 
    .byte $8D   ; 37 
    .byte $24   ; 38 
    .byte $F5   ; 39 
    .byte $DC   ; 3A 
    .byte $DC   ; 3B 



tbl_A0DE:
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00   ; 00 
    .byte $00, $31, $23, $00, $00, $00, $00, $00, $00, $23, $31, $00   ; 01 
    .byte $00, $00, $23, $00, $00, $00, $00, $00, $00, $23, $00, $00   ; 02 
    .byte $00, $00, $12, $00, $00, $00, $00, $00, $00, $12, $00, $00   ; 03 
    .byte $00, $00, $00, $00, $00, $00, $00, $01, $01, $06, $04, $04   ; 04 
    .byte $05, $05, $07, $16, $17, $00, $00, $17, $16, $07, $05, $05   ; 05 
    .byte $72, $31, $00, $02, $00, $00, $00, $00, $02, $00, $31, $53   ; 06 
    .byte $00, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $00   ; 07 
    .byte $00, $12, $12, $12, $12, $12, $12, $12, $12, $12, $13, $00   ; 08 
    .byte $00, $00, $13, $12, $12, $12, $12, $12, $12, $13, $00, $00   ; 09 
    .byte $00, $00, $00, $00, $31, $00, $00, $31, $00, $00, $00, $00   ; 0A 
    .byte $00, $61, $73, $41, $41, $41, $41, $41, $41, $74, $74, $00   ; 0B 
    .byte $00, $57, $34, $54, $25, $13, $00, $35, $25, $13, $33, $55   ; 0C 
    .byte $00, $11, $00, $11, $00, $11, $11, $00, $11, $00, $11, $00   ; 0D 
    .byte $00, $00, $00, $00, $60, $00, $00, $60, $00, $00, $00, $00   ; 0E 
    .byte $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23   ; 0F 
    .byte $00, $13, $00, $13, $00, $13, $13, $00, $13, $00, $13, $00   ; 10 
    .byte $20, $12, $21, $31, $33, $25, $02, $26, $31, $30, $12, $17   ; 11 
    .byte $00, $74, $74, $75, $75, $41, $41, $75, $75, $74, $74, $00   ; 12 
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $61, $00, $00, $00   ; 13 
    .byte $00, $62, $66, $66, $66, $66, $66, $66, $66, $66, $62, $00   ; 14 
    .byte $00, $62, $66, $64, $82, $82, $82, $82, $64, $66, $62, $00   ; 15 
    .byte $73, $70, $67, $65, $73, $66, $66, $73, $65, $67, $70, $73   ; 16 
    .byte $73, $70, $71, $70, $63, $32, $43, $71, $70, $63, $70, $73   ; 17 
    .byte $43, $43, $43, $43, $43, $43, $43, $43, $43, $43, $43, $43   ; 18 
    .byte $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66   ; 19 
    .byte $00, $00, $00, $00, $31, $23, $10, $23, $31, $00, $00, $00   ; 1A 
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04, $03   ; 1B 
    .byte $00, $13, $12, $12, $12, $11, $11, $15, $14, $02, $24, $00   ; 1C 
    .byte $00, $00, $22, $22, $00, $00, $00, $00, $22, $22, $00, $00   ; 1D 
    .byte $00, $00, $00, $00, $00, $22, $22, $00, $00, $00, $00, $00   ; 1E 
    .byte $00, $12, $12, $00, $00, $31, $31, $00, $00, $12, $12, $00   ; 1F 
    .byte $04, $04, $04, $04, $04, $80, $31, $04, $04, $04, $04, $04   ; 20 
    .byte $00, $93, $00, $95, $94, $96, $96, $98, $95, $00, $97, $00   ; 21 
    .byte $00, $00, $00, $00, $00, $31, $00, $00, $00, $00, $00, $00   ; 22 
    .byte $00, $00, $00, $00, $87, $00, $00, $88, $00, $00, $00, $00   ; 23 
    .byte $85, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $52   ; 24 
    .byte $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77   ; 25 
    .byte $76, $76, $76, $76, $76, $76, $76, $76, $76, $76, $76, $76   ; 26 
    .byte $60, $17, $83, $86, $36, $90, $90, $56, $86, $50, $17, $60   ; 27 
    .byte $84, $76, $44, $40, $81, $42, $42, $81, $40, $44, $76, $51   ; 28 
    .byte $00, $13, $12, $46, $91, $25, $25, $92, $45, $12, $13, $00   ; 29 



_off008_A2D6_00:
    .byte $E1   ; 00 
    .byte $80   ; 01 
    .byte $C1, $00, $01   ; 02 
    .byte $A0, $04   ; 03 
    .byte $A0, $01   ; 04 
    .byte $A0, $31   ; 05 
    .byte $90, $21   ; 06 
    .byte $90, $21, $00   ; 07 



_off008_A2E6_10:
    .byte $81, $00, $01, $04   ; 10 
    .byte $81, $00, $01, $00, $01, $00   ; 11 
    .byte $81, $00, $21, $00   ; 12 
    .byte $81, $40   ; 13 
    .byte $81, $20, $01, $00   ; 14 
    .byte $81, $00, $04, $00, $01, $00, $01   ; 15 
    .byte $90, $41   ; 16 
    .byte $80   ; 17 



_off008_A304_20:
    .byte $D1   ; 20 
    .byte $80, $21, $00   ; 21 
    .byte $91, $20   ; 22 
    .byte $91, $00, $01, $00, $11   ; 23 
    .byte $D0   ; 24 
    .byte $81, $00, $41   ; 25 
    .byte $B1, $00   ; 26 



_off008_A315_30:
    .byte $91, $00   ; 30 
    .byte $A1, $00, $21   ; 31 
    .byte $B1, $06   ; 32 
    .byte $91, $00   ; 33 
    .byte $B1, $00   ; 34 
    .byte $81, $00, $21   ; 35 
    .byte $90, $17, $02   ; 36 



_off008_A326_40:
    .byte $91, $17, $01, $17   ; 40 
    .byte $81, $16   ; 41 
    .byte $B1, $07   ; 42 
    .byte $91, $06, $31   ; 43 
    .byte $87, $31, $17   ; 44 
    .byte $81, $00, $01, $03   ; 45 
    .byte $81, $00, $01, $02, $01   ; 46 



_off008_A33D_50:
    .byte $80, $01, $10, $11   ; 50 
    .byte $83, $47   ; 51 
    .byte $83, $41, $03   ; 52 
    .byte $D1, $03   ; 53 
    .byte $90, $01, $10   ; 54 
    .byte $91, $00, $11   ; 55 
    .byte $90, $17, $03, $11   ; 56 
    .byte $C0, $11   ; 57 



_off008_A354_60:
    .byte $E0   ; 60 
    .byte $E6   ; 61 
    .byte $81   ; 62 
    .byte $C6   ; 63 
    .byte $81   ; 64 
    .byte $86, $01, $06, $01, $06   ; 65 
    .byte $81, $06, $21   ; 66 
    .byte $86, $01, $26, $01   ; 67 



_off008_A365_70:
    .byte $86, $41   ; 70 
    .byte $86, $01, $46   ; 71 
    .byte $D1, $02   ; 72 
    .byte $A6, $01, $26   ; 73 
    .byte $81, $56   ; 74 
    .byte $81, $16, $11, $16   ; 75 
    .byte $E7   ; 76 
    .byte $E5   ; 77 



_off008_A377_80:
    .byte $81, $10, $01, $10   ; 80 
    .byte $81, $27   ; 81 
    .byte $A1, $06, $21   ; 82 
    .byte $80, $01, $10, $11   ; 83 
    .byte $82, $47   ; 84 
    .byte $82, $41, $02   ; 85 
    .byte $80, $01, $10   ; 86 
    .byte $A1, $02   ; 87 
    .byte $A1, $03, $21   ; 88 



_off008_A391_90:
    .byte $80, $27, $21   ; 90 
    .byte $81, $00, $02, $11, $00   ; 91 
    .byte $81, $00, $03, $11, $00   ; 92 
    .byte $81, $02   ; 93 
    .byte $81, $02, $01, $02, $01, $02, $05   ; 94 
    .byte $C1, $15   ; 95 
    .byte $B1, $25   ; 96 
    .byte $81, $03   ; 97 
    .byte $81, $03, $01, $03, $01, $03, $05   ; 98 



off_A3B4_04_underground_passage:
    .byte $04, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $04, $04   ; 



off_A3C4_06_underground_room_with_item:
    .byte $04, $04, $00, $01, $00, $00, $00, $03, $03, $03, $03, $02, $03, $03, $04, $04   ; 



tbl_A3D4_dungeon:
    .byte $82, $43, $43, $43, $02, $0C, $43   ; 
    .byte $80, $41, $41, $41, $41, $43   ; 
    .byte $82, $43, $42, $0C, $01, $41, $43   ; 
    .byte $82, $43, $42, $0C, $03, $02, $0C, $43   ; 
    .byte $82, $43, $43, $43, $43, $43   ; 



sub_A3F6:
sub_0x016406:
; in
    ; ram_0002_t24_direction
; out
    ; A = 
    ; ram_0003_t01_loop_counter
    LDA #$01
    STA ram_0001_t01
    LDA #$03
    STA ram_0003_t01_loop_counter
bra_A3FE_loop:
    LDY ram_map_location
    LDA ram_687E_map_data,Y
    LDY ram_0003_t01_loop_counter
    CPY #$02
    BCC bra_A40E
    LDY ram_map_location
    LDA ram_68FE_map_data,Y
bra_A40E:
    STA ram_0000_t3E
    LDA ram_0003_t01_loop_counter
    AND #$01
    BNE bra_A41C
; / 08
    LSR ram_0000_t3E
    LSR ram_0000_t3E
    LSR ram_0000_t3E
bra_A41C:
; / 04 (20)
    LSR ram_0000_t3E
    LSR ram_0000_t3E
    LDA ram_0002_t24_direction
    BIT ram_0001_t01
    BNE bra_A42F
    ASL ram_0001_t01
    DEC ram_0003_t01_loop_counter
    BPL bra_A3FE_loop
    LDA #$08
    RTS
bra_A42F:
    LDA ram_0000_t3E
    AND #$07
    RTS



bra_A434:
    LDA #$13
    STA ram_0006_t04_loop_counter
    LDX #$19
    BNE bra_A484    ; jmp



bra_A43C:   ; bzk
    JSR sub_bat_7298_dec_0004_pointer_by_01
    JMP loc_A48E



sub_A442:
    LDA #< tbl_9FA0_tiles_id
    STA ram_0000_t0F_data
    LDA #> tbl_9FA0_tiles_id
    STA ram_0000_t0F_data + $01
    LDA #< ram_6547
    STA ram_0002_t04_data
    LDA #> ram_6547
    STA ram_0002_t04_data + $01
    LDA #< ram_655A
    STA ram_0004_t04_data
    LDA #> ram_655A
    STA ram_0004_t04_data + $01
    LDA #$0A
    STA ram_0006_t04_loop_counter
    LDY #$00
bra_A460_loop:
    LDA (ram_0000_t0F_data),Y
    BEQ bra_A434
    STA (ram_0002_t04_data),Y
    STA (ram_0004_t04_data),Y
    CMP #$DE
    BEQ bra_A474
    CMP #$E2
    BCS bra_A474
    ADC #$01
    STA (ram_0004_t04_data),Y
bra_A474:
    LDA #$01
    LDX #$01
    DEC ram_0006_t04_loop_counter
    BNE bra_A484
    LDA #$0A
    STA ram_0006_t04_loop_counter
    LDA #$0D
    LDX #$1F
bra_A484:
    JSR sub_bat_7282_inc_0002_pointer_by_A
    TXA
    DEX
    BEQ bra_A43C
    JSR sub_bat_728E_inc_0004_pointer_by_A
loc_A48E:
    JSR sub_bat_7274_inc_0000_pointer_by_01
; bzk warning, dangerous loop exit condition implementation by developers (4E = current table size)
    CMP #< ( tbl_9FA0_tiles_id + $4E )
    BNE bra_A460_loop
    LDA #< ram_6530
    STA ram_0002_t07_data
    LDA #> ram_6530
    STA ram_0002_t07_data + $01
    LDA #< ram_67EF
    STA ram_0004_t05_data
    LDA #> ram_67EF
    STA ram_0004_t05_data + $01
bra_A4A5_loop:
    LDA (ram_0002_t07_data),Y
    STA (ram_0004_t05_data),Y
    CMP #$DD
    BEQ bra_A4CF
    CMP #$E0
    BCS bra_A4BE
    CMP #$DC
    BCS bra_A4B9
    ADC #$01
    STA (ram_0004_t05_data),Y
bra_A4B9:
    CLC
    ADC #$01
bra_A4BC:
    STA (ram_0004_t05_data),Y
bra_A4BE:
    JSR sub_bat_7298_dec_0004_pointer_by_01
    JSR sub_bat_7280_inc_0002_pointer_by_01
    CMP #$90
    BNE bra_A4A5_loop
    LDA ram_0002_t07_data + $01
    CMP #> $6600
    BNE bra_A4A5_loop
    RTS
bra_A4CF:
    LDA #$DC
    BNE bra_A4BC    ; jmp



tbl_A4D3_direction:
    .byte con_dir_Right   ; 00 
    .byte con_dir_Left   ; 01 
    .byte con_dir_Down   ; 02 
    .byte con_dir_Up   ; 03 



tbl_A4D7:
    .byte < off_9FEE_00   ; 00 
    .byte < off_A02A_01   ; 01 
    .byte < off_A066_02   ; 02 
    .byte < off_A0A2_03   ; 03 



tbl_A4DB:
    .byte > off_9FEE_00   ; 00 
    .byte > off_A02A_01   ; 01 
    .byte > off_A066_02   ; 02 
    .byte > off_A0A2_03   ; 03 



tbl_A4DF:
    .byte < ram_67A1   ; 00 
    .byte < ram_654F   ; 01 
    .byte < ram_6676   ; 02 
    .byte < ram_6665   ; 03 



tbl_A4E3:
    .byte > ram_67A1   ; 00 
    .byte > ram_654F   ; 01 
    .byte > ram_6676   ; 02 
    .byte > ram_6665   ; 03 



tbl_A4E7:
    .byte $14   ; 00 
    .byte $01   ; 01 
    .byte $01   ; 02 



tbl_A4EA:
    .byte $02   ; 00 
    .byte $02   ; 01 
    .byte $2C   ; 02 
    .byte $2C   ; 03 



tbl_A4EE_loop_counter:
    .byte $03   ; 00 
    .byte $03   ; 01 
    .byte $02   ; 02 
    .byte $02   ; 03 



tbl_A4F2:   ; loop counter
    .byte $01   ; 00 
    .byte $01   ; 01 
    .byte $02   ; 02 
    .byte $02   ; 03 



sub_A4F6:
loc_A4F6:
    LDX #$03
loc_A4F8:
    LDA #$01
    STA ram_0006_t12
loc_A4FC:
    TXA
    PHA
    STA ram_000B_t08
    LDA tbl_A4D3_direction,X
    STA ram_0002_t24_direction
    JSR sub_A3F6
    CMP #$05
    BCS bra_A528
    CMP #$04
    BNE bra_A518
    LDA #$08
    BNE bra_A528    ; jmp
bra_A514:
    LDA #$09
    BNE bra_A547    ; jmp
bra_A518:
    PHA
    LDA ram_0002_t24_direction
    EOR #$FF
    AND ram_00EE
    STA ram_00EE
    PLA
    CMP #$01
    BCS bra_A528
    LDA #$04
bra_A528:
    PHA
    LDA ram_00EE
    AND ram_0002_t24_direction
    TAX
    PLA
    CPX ram_0002_t24_direction
    BNE bra_A547
    TAY
    PLA
    PHA
    TAX
    TYA
    CMP #$07
    BEQ bra_A545
    PHA
    JSR sub_8A97
    PLA
    CMP #$08
    BEQ bra_A514
bra_A545:
    LDA #$04
bra_A547:
    LDX ram_0006_t12
    BEQ bra_A555
    LDX ram_000B_t08
    PHA
    JSR sub_A3F6
    JSR sub_B641
    PLA
bra_A555:
    CMP #$04
    BCC bra_A5A5
    SEC
    SBC #$03
    TAY
    CPY #$03
    BCC bra_A562
    DEY
bra_A562:
    PLA
    PHA
    JSR sub_A5B4
    LDA ram_0006_t12
    BNE bra_A576
    LDA tbl_A4EA,X
    JSR sub_bat_7276_inc_0000_pointer_by_A
    LDA #$06
    JSR sub_bat_7282_inc_0002_pointer_by_A
bra_A576:
    LDY #$00
    LDA tbl_A4EE_loop_counter,X
    STA ram_0005_t05_loop_counter
bra_A57D_loop:
    PLA
    PHA
    TAX
    LDA tbl_A4F2,X
    TAX
bra_A584_loop:
    LDA (ram_0002_t05_data),Y
    STA (ram_0000_t0E_data),Y
    JSR sub_bat_7280_inc_0002_pointer_by_01
    LDA tbl_A4E7,X
    JSR sub_bat_7276_inc_0000_pointer_by_A
    CPX #$00
    BNE bra_A59E
    PLA
    PHA
    CMP #$02
    BCS bra_A59E
    JSR sub_bat_7274_inc_0000_pointer_by_01
bra_A59E:
    DEX
    BPL bra_A584_loop
    DEC ram_0005_t05_loop_counter
    BNE bra_A57D_loop
bra_A5A5:
    PLA
    TAX
    DEC ram_0006_t12
    BMI bra_A5AE
    JMP loc_A4FC
bra_A5AE:
    DEX
    BMI bra_A5D4_RTS
    JMP loc_A4F8



sub_A5B4:
; in
    ; A = 
    ; Y = 
; out
    ; ram_0000_t0E_data
    ; ram_0002_t05_data
    TAX
    LDA tbl_A4D7,X
    STA ram_0002_t05_data
    LDA tbl_A4DB,X
    STA ram_0002_t05_data + $01
    LDA tbl_A4DF,X
    STA ram_0000_t0E_data
    LDA tbl_A4E3,X
    STA ram_0000_t0E_data + $01
loc_A5C9_loop:
    DEY
    BEQ bra_A5D4_RTS
    LDA #$0C
    JSR sub_bat_7282_inc_0002_pointer_by_A
    JMP loc_A5C9_loop
bra_A5D4_RTS:
    RTS



tbl_A5D5:
tbl__A5D5:
off_A5D5_00:
    .byte $01   ; 00 
    .byte $03   ; 01 
    .byte $06   ; 02 
    .byte $08   ; 03 

off_A5D9_01:
    .byte $03   ; 00 
    .byte $05   ; 01 
    .byte $08   ; 02 
    .byte $0A   ; 03 

off_A5DD_02:
    .byte $03   ; 00 
    .byte $06   ; 01 

off_A5DF_03:
    .byte $04   ; 00 
    .byte $07   ; 01 
    .byte $05   ; 02 
    .byte $08   ; 03 



tbl_A5E3:
    .byte off_A5D5_00 - tbl__A5D5   ; 00 
    .byte off_A5D9_01 - tbl__A5D5   ; 01 
    .byte off_A5DD_02 - tbl__A5D5   ; 02 
    .byte off_A5DF_03 - tbl__A5D5   ; 03 



tbl_A5E7_ppu_addr_hi:
    .byte > $225C   ; 00 
    .byte > $2242   ; 01 
    .byte > $234F   ; 02 
    .byte > $214F   ; 03 



tbl_A5EB_ppu_addr_lo:
    .byte < $225C   ; 00 
    .byte < $2242   ; 01 
    .byte < $234F   ; 02 
    .byte < $214F   ; 03 



tbl_A5EF:
    .byte $01   ; 00 
    .byte $FF   ; 01 
    .byte $10   ; 02 
    .byte $F0   ; 03 



sub_0x016603:
    LDA ram_script
    CMP #con_script_triforce_collected
    BEQ bra_A5D4_RTS
    LDA ram_0027_timer
    BNE bra_A5D4_RTS
    LDA ram_0054_timer
    BEQ bra_A5D4_RTS
    AND #$07
    LDY #$01
    STY ram_0002_t41
    BIT ram_0002_t41
    BEQ bra_A60C
    LSR
bra_A60C:
    CMP #$02
    BNE bra_A614
    LDY #$30
    STY ram_timer_link
bra_A614:
    AND #$03
    SEC
    SBC #$01
    AND #$02
    STA ram_0008_t06
    LDA ram_0054_timer
    CMP #$05
    BCS bra_A631
    LDA ram_0055_direction
    STA ram_0002_t24_direction
    JSR sub_A3F6
    CMP #$07
    BEQ bra_A631
    JMP loc_A682
bra_A631:
    JSR sub_A6B1
bra_A634_loop:
    LDA ram_0006_t13
    STA ram_0004_t19
    LDA ram_0000_t68_ppu_addr_hi
    STA ram_0302_ppu_buffer,X
    INX
    LDA ram_0001_t14_ppu_addr_lo
    STA ram_0302_ppu_buffer,X
    INX
    LDA ram_0006_t13
    STA ram_0302_ppu_buffer,X
    INX
bra_A64A_loop:
    JSR sub_9400
    BNE bra_A64A_loop
    LDA #$20
    ORA ram_0001_t14_ppu_addr_lo
    STA ram_0001_t14_ppu_addr_lo
    DEC ram_0005_t06_loop_counter
    BNE bra_A634_loop
    LDA #$FF
    STA ram_0302_ppu_buffer,X
    TXA
    STA ram_0301_buffer_index
    INC ram_0054_timer
    LDA ram_0054_timer
    AND #$03
    BEQ bra_A66F
    LDA #$08
    STA ram_0027_timer
    RTS
bra_A66F:
    LDA ram_0054_timer
    CMP #$04
    BNE bra_A689
    LDX ram_0009_t01
    JSR sub_8AA0
    LDA ram_0055_direction
    EOR #$0F
    AND ram_00EE
loc_A680:
    STA ram_00EE
loc_A682:
    LDA #$00
    STA ram_0054_timer
    JMP loc_A4F6
bra_A689:
    LDA ram_0055_direction
    STA ram_0002_t24_direction
    JSR sub_A3F6
    CMP #$07
    BEQ bra_A6AA
    LDX ram_0009_t01
    JSR sub_8A97
    TYA
    CLC
    ADC tbl_A5EF,X
    TAY
    TXA
    EOR #$01
    TAX
    LDA (ram_0000_t13_data),Y
    ORA tbl_0x01E6CE_8_bits,X
    STA (ram_0000_t13_data),Y
bra_A6AA:
    LDA ram_0055_direction
    ORA ram_00EE
    JMP loc_A680



sub_A6B1:
; out
    ; ram_0000_t68_ppu_addr_hi
    ; ram_0001_t14_ppu_addr_lo
    LDA ram_0055_direction
    STA ram_0002_t24_direction
    JSR sub_A3F6
    CMP #$05
    BCC bra_A6C3
    PHA
    LDA #con_sfx_1_door
    JSR sub_bat_6D7C_set_sfx_1
    PLA
bra_A6C3:
    CMP #$04
    BNE bra_A6C9
    LDA #$08
bra_A6C9:
    CMP #$01
    BNE bra_A6CF
    LDA #$04
bra_A6CF:
    SEC
    SBC #$03
    TAY
    LDA ram_0008_t06
    BEQ bra_A6DD
    CPY #$05
    BEQ bra_A6E2
    LDY #$01
bra_A6DD:
    CPY #$03
    BCC bra_A6E2
    DEY
bra_A6E2:
    LDA #$03
    SEC
    SBC ram_0003_t01_loop_counter
    JSR sub_A5B4
    LDA tbl_A5E7_ppu_addr_hi,X
    STA ram_0000_t68_ppu_addr_hi
    LDA tbl_A5EB_ppu_addr_lo,X
    STA ram_0001_t14_ppu_addr_lo
    STX ram_0009_t01
    LDX ram_0301_buffer_index
    LDA #$00
    STA ram_0007_t08
    LDA #$02
    STA ram_0006_t13
    STA ram_0005_t06_loop_counter
    RTS



tbl_A704:
    .word _off008_A2D6_00
    .word _off008_A2E6_10
    .word _off008_A304_20
    .word _off008_A315_30
    .word _off008_A326_40
    .word _off008_A33D_50
    .word _off008_A354_60
    .word _off008_A365_70
    .word _off008_A377_80
    .word _off008_A391_90



tbl_A718:
    .byte $B0   ; 00 
    .byte $74   ; 01 
    .byte $94   ; 02 
    .byte $B4   ; 03 
    .byte $70   ; 04 
    .byte $68   ; 05 
    .byte $F4   ; 06 
    .byte $24   ; 07 



loc_A720:
    JSR sub_0x01E86A_get_enemy_id_from_current_map_location
    PHA
    LDA #< tbl_A0DE
    STA ram_0002_t08_data
    LDA #> tbl_A0DE
    STA ram_0002_t08_data + $01
    PLA
; * 04
    ASL
    ASL
    STA ram_0000_t69
; * 03
    JSR sub_bat_7282_inc_0002_pointer_by_A
    LDA ram_0000_t69
    JSR sub_bat_7282_inc_0002_pointer_by_A
    LDA ram_0000_t69
    JSR sub_bat_7282_inc_0002_pointer_by_A
    LDA #< ram_658C
    STA ram_0000_t16_block_data
    LDA #> ram_658C
    STA ram_0000_t16_block_data + $01
    LDY #$00
    STY ram_0006_t07
loc_A74A_loop:
    LDY ram_0006_t07
    LDA (ram_0002_t08_data),Y
    AND #$F0
; / 08
    LSR
    LSR
    LSR
    TAX
    LDA tbl_A704,X
    STA ram_0004_t06_data
    LDA tbl_A704 + $01,X
    STA ram_0004_t06_data + $01
    LDA (ram_0002_t08_data),Y
    AND #$0F
    TAX
    LDY #$00
loc_A765_loop:
    LDA (ram_0004_t06_data),Y
    BPL bra_A76C_00_7F
; 80-FF
    DEX
    BMI bra_A770
bra_A76C_00_7F:
    INY
    JMP loc_A765_loop
bra_A770:
    TYA
    JSR sub_bat_728E_inc_0004_pointer_by_A
    LDA #$00
    STA ram_0007_t02
    STA ram_0008_t05
bra_A77A_loop:
    LDY #$00
    LDA (ram_0004_t06_data),Y
    AND #$07
    TAX
    LDA tbl_A718,X
    LDY #$00
    JSR sub_A7C1_write_2x2_block
    LDA #$02
    JSR sub_bat_7276_inc_0000_pointer_by_A
    LDY #$00
    LDA (ram_0004_t06_data),Y
    AND #$70
; / 10
    LSR
    LSR
    LSR
    LSR
    CMP ram_0008_t05
    BEQ bra_A7A1
    INC ram_0008_t05
    JMP loc_A7A8
bra_A7A1:
    LDA #$00
    STA ram_0008_t05
    JSR sub_bat_728C_inc_0004_pointer_by_01
loc_A7A8:
    INC ram_0007_t02
    LDA ram_0007_t02
    CMP #$07
    BCC bra_A77A_loop
    LDA #$1E
    JSR sub_bat_7276_inc_0000_pointer_by_A
    INC ram_0006_t07
    LDA ram_0006_t07
    CMP #$0C
    BCS bra_A7C0_RTS
    JMP loc_A74A_loop
bra_A7C0_RTS:
    RTS



sub_A7C1_write_2x2_block:
; bzk optimize, write LDY 00 here for readability
    CMP #$70
    BCC bra_A7E0    ; if 00-6F
    CMP #$F3
    BCS bra_A7E0    ; if F3-FF
; if 70-F2, write with 01 increase each time
    ; for example, if 70, then write
    ; 70 71
    ; 72 73
    TAX
    STA (ram_0000_t16_block_data),Y
    INY
    INX
    TXA
    STA (ram_0000_t16_block_data),Y
    TYA
    CLC
    ADC #$15
    TAY
    INX
    TXA
    STA (ram_0000_t16_block_data),Y
    INX
    TXA
loc_A7DC:
    INY
    STA (ram_0000_t16_block_data),Y
    RTS
bra_A7E0:
; else, write the same tile each time
    ; for example, if F5, then write
    ; F5 F5
    ; F5 F5
    STA (ram_0000_t16_block_data),Y
    INY
    STA (ram_0000_t16_block_data),Y
    PHA
    TYA
    CLC
    ADC #$15
    TAY
    PLA
    STA (ram_0000_t16_block_data),Y
; bzk optimize, write INY + STA + RTS here
    JMP loc_A7DC



sub_A7F1:
    LDA #$00
    STA ram_state_obj + $0B
    STA ram_dir_enemy + $0B
    JSR sub_0x01E86A_get_enemy_id_from_current_map_location
    CMP #$21
    BNE bra_A808
    LDA #$40
    STA ram_pos_X_enemy + $0B
    ASL
    STA ram_pos_Y_enemy + $0B
    JMP loc_A82D
bra_A808:
    LDX #$08
    LDY #$0A
bra_A80C_loop:
    LDA tbl_0x01E410_block_addresses,X
    STA ram_0000_t0D_block_data
    LDA tbl_0x01E410_block_addresses + $01,X
    STA ram_0000_t0D_block_data + $01
    LDA (ram_0000_t0D_block_data),Y
    CMP #$B0
    BEQ bra_A824
    INX
    INX
    INX
    INX
    CPX #$34
    BNE bra_A80C_loop
bra_A824:
    TXA
; * 04
    ASL
    ASL
    STA ram_pos_X_enemy + $0B
    LDA #$90
    STA ram_pos_Y_enemy + $0B
loc_A82D:
    LDA #con_obj_id_68
    STA ram_obj_id_enemy + $0A
    RTS



ofs_main_script_1_0x016843_12_triforce_collected:
; con_script_triforce_collected
    LDA #con_music_triforce
    STA ram_music
    LDA #$20
    STA ram_007C
    LDA #$01
    STA ram_007C + $01
    LDA #$30
    STA ram_timer_link
    LDA #$24
    STA ram_000A_t05_tile
    JSR sub_0x01E8E8
    INC ram_0011_screen_ready_flag
    JSR sub_bat_6E1D
    LDA #con_drop_id_1B
    STA ram_0505
    JMP loc_0x01E81C



loc_0x016868:
    JSR sub_bat_6E1D
    JSR sub_0x01E827
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_023_A86D_00
    .word ofs_023_A877_01
    .word ofs_023_A88F_02
    .word ofs_023_A897_03
    .word ofs_023_A8AB_04



ofs_023_A86D_00:
    LDA ram_timer_link
    BNE bra_A887_RTS
    LDA #$30
    STA ram_timer_link
    BNE bra_A88C    ; jmp
ofs_023_A877_01:
    LDY #con_ppu_buf_overworld_palette
    LDA ram_timer_link
    BEQ bra_A888
    AND #$07
    CMP #$04
    BCC bra_A885
    LDY #con_ppu_buf_78
bra_A885:
    STY ram_ppu_load_index
bra_A887_RTS:
    RTS
bra_A888:
    LDA #$02
    STA ram_0063
bra_A88C:
    INC ram_subscript
    RTS



ofs_023_A88F_02:
    JSR sub_0x01ED99
    LDA ram_0063
    BEQ bra_A8A4
    RTS



ofs_023_A897_03:
    LDA ram_timer_link
    BNE bra_A8AA_RTS
    JSR sub_bat_7248_curtain_movement_handler
    LDA ram_007C
    CMP #$11
    BCS bra_A8AA_RTS
bra_A8A4:
    LDA #$80
    STA ram_timer_link
    INC ram_subscript
bra_A8AA_RTS:
    RTS



ofs_023_A8AB_04:
    LDA ram_timer_link
    BNE bra_A8AA_RTS
    JSR sub_0x01E607_hide_all_sprites
    LDA ram_for_2000
    AND #$FB
    STA ram_for_2000
    STA $2000
    JMP loc_B547



bra_A8BE_overworld:
    JSR sub_A9F4
    JMP loc_AB73



sub_A8C4:
    JSR sub_AB30_prepare_columns_table
    LDA ram_dungeon_level
    BEQ bra_A8BE_overworld
; if dungeon
    LDA #$F6
    STA ram_000A_t05_tile
    JSR sub_0x01E8E8
    JSR sub_B66C
    JSR sub_A442
    JSR sub_A4F6
    JMP loc_A720



loc_A8DE_move_curtain:
sub_0x0168EE_move_curtain:
    LDA #< (ram_6530 - $16)
    STA ram_0000_t0C_data
    LDA #> (ram_6530 - $16)
    STA ram_0000_t0C_data + $01
    LDX ram_00E8
    DEX
    TXA
    LDY ram_0301_buffer_index
    STA ram_0302_ppu_buffer + $01,Y
    LDA #$21
    STA ram_0302_ppu_buffer,Y
bra_A8F5_loop:
    LDA #$16
    JSR sub_bat_7276_inc_0000_pointer_by_A
    DEX
    BPL bra_A8F5_loop
    LDA #$96
    STA ram_0302_ppu_buffer + $02,Y
    TXA
    STA ram_0302_ppu_buffer + $19,Y
    TYA
    TAX
    LDY #$00
    STY ram_0006_t05_loop_counter
bra_A90C_loop:
    LDA (ram_0000_t0C_data),Y    ; 6530-67EF
    STA ram_0302_ppu_buffer + $03,X
    JSR sub_bat_7274_inc_0000_pointer_by_01
    INX
    INC ram_0006_t05_loop_counter
    LDA ram_0006_t05_loop_counter
    CMP #$16
    BCC bra_A90C_loop
    INX
    INX
    INX
    STX ram_0301_buffer_index
    RTS



sub_A924:
loc_A924:
    LDA #> ram_6530
    STA ram_0000_t0B_data + $01
    LDA ram_00E9
    TAX
    CLC
    ADC #< ram_6530
    STA ram_0000_t0B_data
    BCC bra_A934_not_overflow
    INC ram_0000_t0B_data + $01
bra_A934_not_overflow:
    LDA #> $20E0
    STA ram_0302_ppu_buffer
    LDA #< $20E0
    STA ram_0302_ppu_buffer + $01
bra_A93E_loop:
    LDA ram_0302_ppu_buffer + $01
    CLC
    ADC #$20
    STA ram_0302_ppu_buffer + $01
    BCC bra_A94C_not_overflow
    INC ram_0302_ppu_buffer ; ppu hi
bra_A94C_not_overflow:
    DEX
    BPL bra_A93E_loop
    LDA #$20
    STA ram_0302_ppu_buffer + $02
    STX ram_0302_ppu_buffer + $23
    LDX #$00
    LDY #$00
bra_A95B_loop:
    LDA (ram_0000_t0B_data),Y
    STA ram_0302_ppu_buffer + $03,X
    LDA #$16
    JSR sub_bat_7276_inc_0000_pointer_by_A
    INX
    CPX #$20
    BCC bra_A95B_loop
    LDA #$23
    STA ram_0301_buffer_index
    RTS



tbl_A970:
    .byte con_obj_id_62   ; 00 (E5) 
    .byte con_obj_id_breakable_wall   ; 01 (E6) 
    .byte con_obj_id_64   ; 02 (E7) 
    .byte con_obj_id_65   ; 03 (E8) 
    .byte con_obj_id_66   ; 04 (E9) 
    .byte con_obj_id_67   ; 05 (EA) 



tbl_A976_replace_metatile:
    .byte $C8   ; 00 (E5) 
    .byte $D8   ; 01 (E6) 
    .byte $C4   ; 02 (E7) 
    .byte $BC   ; 03 (E8) 
    .byte $C0   ; 04 (E9) 
    .byte $C0   ; 05 (EA) 



tbl_A97C:
    .byte $24   ; 00 
    .byte $6F   ; 01 
    .byte $F3   ; 02 
    .byte $FA   ; 03 
    .byte $98   ; 04 
    .byte $90   ; 05 
    .byte $8F   ; 06 
    .byte $95   ; 07 
    .byte $8E   ; 08 
    .byte $90   ; 09 
    .byte $74   ; 0A 
    .byte $76   ; 0B 
    .byte $F3   ; 0C 
    .byte $24   ; 0D 
    .byte $26   ; 0E 
    .byte $89   ; 0F 
    .byte $03   ; 10 
    .byte $04   ; 11 
    .byte $70   ; 12 
    .byte $C8   ; 13 
    .byte $BC   ; 14 
    .byte $8D   ; 15 
    .byte $8F   ; 16 
    .byte $93   ; 17 
    .byte $95   ; 18 
    .byte $C4   ; 19 
    .byte $CE   ; 1A 
    .byte $D8   ; 1B 
    .byte $B0   ; 1C 
    .byte $B4   ; 1D 
    .byte $AA   ; 1E 
    .byte $AC   ; 1F 
    .byte $B8   ; 20 
    .byte $9C   ; 21 
    .byte $A6   ; 22 
    .byte $9A   ; 23 
    .byte $A2   ; 24 
    .byte $A0   ; 25 
    .byte $E5   ; 26 
    .byte $E6   ; 27 
    .byte $E7   ; 28 
    .byte $E8   ; 29 
    .byte $E9   ; 2A 
    .byte $EA   ; 2B 
    .byte $C0   ; 2C 
    .byte $E0   ; 2D 
    .byte $78   ; 2E 
    .byte $7A   ; 2F 
    .byte $7E   ; 30 
    .byte $80   ; 31 
    .byte $CC   ; 32 
    .byte $D0   ; 33 
    .byte $D4   ; 34 
    .byte $DC   ; 35 
    .byte $89   ; 36 
    .byte $84   ; 37 



tbl_A9B4_custom_metatiles:
; 00 
    .byte $24, $24   ; 
    .byte $24, $24   ; 
; 01 
    .byte $6F, $6F   ; 
    .byte $6F, $6F   ; 
; 02 
    .byte $F3, $F3   ; 
    .byte $F3, $F3   ; 
; 03 
    .byte $FA, $FA   ; 
    .byte $FA, $FA   ; 
; 04 
    .byte $98, $95   ; 
    .byte $26, $26   ; 
; 05 
    .byte $90, $95   ; 
    .byte $90, $95   ; 
; 06 
    .byte $8F, $90   ; 
    .byte $8F, $90   ; 
; 07 
    .byte $95, $96   ; 
    .byte $95, $96   ; 
; 08 
    .byte $8E, $93   ; 
    .byte $90, $95   ; 
; 09 
    .byte $90, $95   ; 
    .byte $92, $97   ; 
; 0A 
    .byte $74, $74   ; 
    .byte $75, $75   ; 
; 0B 
    .byte $76, $77   ; 
    .byte $76, $77   ; 
; 0C 
    .byte $F3, $24   ; 
    .byte $F3, $24   ; 
; 0D 
    .byte $24, $24   ; 
    .byte $24, $24   ; 
; 0E 
    .byte $26, $26   ; 
    .byte $26, $26   ; 
; 0F 
    .byte $89, $88   ; 
    .byte $8B, $88   ; 



sub_A9F4:
    LDA tbl_9F9C
    STA ram_0002_t09_data
    LDA tbl_9F9C + $01
    STA ram_0002_t09_data + $01
    LDA #$00
    STA ram_0006_t14
    LDX ram_map_location
    LDA ram_69FE_map_data,X
; * 02
    ASL
; * 08
    ASL
    ROL ram_0006_t14
    ASL
    ROL ram_0006_t14
    ASL
    ROL ram_0006_t14
    ADC ram_0002_t09_data
    STA ram_0002_t09_data
    LDA ram_0006_t14
    ADC ram_0002_t09_data + $01
    STA ram_0002_t09_data + $01
loc_AA1B_draw_special_screen:
; in
    ; ram_0002_t09_data
    LDA ram_6BAF
    STA ram_0008_t02_data
    LDA ram_6BB0
    STA ram_0008_t02_data + $01
    JSR sub_AC07_set_block_address_pointer
    LDA #$00
    STA ram_000C_t09
    STA ram_0006_t06_special_metatile_pos_X
loc_AA2E_loop:
    LDY ram_0006_t06_special_metatile_pos_X
    LDA (ram_0002_t09_data),Y
    AND #$F0
; / 08
    LSR
    LSR
    LSR
    TAX
    LDA tbl_bat_6827_columns,X
    STA ram_0004_t07_columns_data
    LDA tbl_bat_6827_columns + $01,X
    STA ram_0004_t07_columns_data + $01
    LDA (ram_0002_t09_data),Y
    AND #$0F
    TAX
    LDY #$FF
bra_AA49_loop:
    INY
    LDA (ram_0004_t07_columns_data),Y
    BPL bra_AA49_loop
    DEX
    BPL bra_AA49_loop
    TYA
    JSR sub_bat_728E_inc_0004_pointer_by_A
    LDA #$00
    STA ram_0007_t01_special_metatile_pos_Y
bra_AA59_loop:
    LDY #$00
    LDA (ram_0004_t07_columns_data),Y
    AND #$3F
    STA ram_000D_t03
    TAX
    LDA tbl_A97C,X
    PHA
    LDY ram_map_location
    LDA (ram_0008_t02_data),Y
    AND #$80
    BEQ bra_AA88
    PLA
    CMP #$E7
    BEQ bra_AA7B
    CMP #$E6
    BEQ bra_AA83
    CMP #$EA
    BNE bra_AA87
bra_AA7B:
    LDA #$10
    STA ram_000D_t03
    LDA #$70
    BNE bra_AA87    ; jmp
bra_AA83:
    LDA #$0C
    STA ram_000D_t03
bra_AA87:
    PHA
bra_AA88:
    PLA
    JSR sub_AABF
    LDY #$00
    JSR sub_AAF1_unpack_and_write_2x2_block
    LDA #$02
    JSR sub_bat_7276_inc_0000_pointer_by_A
    LDY #$00
    LDA (ram_0004_t07_columns_data),Y
    AND #$40
    BEQ bra_AAA4
    EOR ram_000C_t09
    STA ram_000C_t09
    BNE bra_AAA7
bra_AAA4:
    JSR sub_bat_728C_inc_0004_pointer_by_01
bra_AAA7:
    INC ram_0007_t01_special_metatile_pos_Y
    LDA ram_0007_t01_special_metatile_pos_Y
    CMP #$0B
    BNE bra_AA59_loop
    LDA #$16
    JSR sub_bat_7276_inc_0000_pointer_by_A
    INC ram_0006_t06_special_metatile_pos_X
    LDA ram_0006_t06_special_metatile_pos_X
    CMP #$10
    BCS bra_AAF0_RTS
    JMP loc_AA2E_loop



sub_AABF:
; in
    ; A = metatile
; out
    ; A = metatile
    LDX #$EA
    STX ram_000A_t04_metatile
    LDX #$05
bra_AAC5_loop:
    CMP ram_000A_t04_metatile
    BEQ bra_AAD0
    DEC ram_000A_t04_metatile
    DEX
    BPL bra_AAC5_loop
    BMI bra_AAF0_RTS    ; jmp
bra_AAD0:
    LDA tbl_A976_replace_metatile,X
    PHA
    LDA tbl_A970,X
    STA ram_052B_special_metatile_id
    LDA ram_0006_t06_special_metatile_pos_X
; * 10
    ASL
    ASL
    ASL
    ASL
    STA ram_052C_special_metatile_pos_X
    LDA ram_0007_t01_special_metatile_pos_Y
; * 10
    ASL
    ASL
    ASL
    ASL
    CLC
    ADC #$40
    STA ram_052D_special_metatile_pos_Y
    PLA
bra_AAF0_RTS:
    RTS



sub_AAF1_unpack_and_write_2x2_block:
; in
    ; A = 
    LDX ram_000D_t03
    CPX #$10
    BCC bra_AB0E_00_0F
; if 10-FF, write with 01 increase each time
    ; for example, if 10, then write
    ; 10 11
    ; 12 13
    TAX
    STA (ram_0000_t03_block_address),Y
    INY
    INX
    TXA
    STA (ram_0000_t03_block_address),Y
    TYA
    CLC
    ADC #$15
    TAY
    INX
    TXA
    STA (ram_0000_t03_block_address),Y
    INX
    TXA
loc_AB0A:
    INY
    STA (ram_0000_t03_block_address),Y
    RTS
bra_AB0E_00_0F:
; else, write a custom block from the table
    ; for example, if 0F (0x016A00), then write
    ; 89 88
    ; 8B 88
    TXA
; * 04
    ASL
    ASL
    TAX
    LDA tbl_A9B4_custom_metatiles,X
    STA (ram_0000_t03_block_address),Y
    INY
    INX
    LDA tbl_A9B4_custom_metatiles,X
    STA (ram_0000_t03_block_address),Y
    TYA
    CLC
    ADC #$15
    TAY
    INX
    LDA tbl_A9B4_custom_metatiles,X
    STA (ram_0000_t03_block_address),Y
    INX
    LDA tbl_A9B4_custom_metatiles,X
    JMP loc_AB0A



sub_AB30_prepare_columns_table:
    LDA tbl_9F9E_overworld
    LDX tbl_9F9E_overworld + $01
    LDY ram_dungeon_level
    BEQ bra_AB3E    ; if overworld
; if dungeon
    LDA #< tbl_A3D4_dungeon
    LDX #> tbl_A3D4_dungeon
bra_AB3E:
    STA ram_6827_tbl_bat_columns
    STX ram_6827_tbl_bat_columns + $01
    RTS



tbl_AB45:
    .word off_9BA8_00_normal_cave
    .word off_9BB8_02_cave_with_3_teleports
    .word off_A3B4_04_underground_passage
    .word off_A3C4_06_underground_room_with_item



ofs_AB4D_03_draw_normal_cave:
; old man, shop
    LDX #$00
bra_AB4F_draw_room:
    LDA tbl_AB45,X
    STA ram_0002_t09_data
    LDA tbl_AB45 + $01,X
    STA ram_0002_t09_data + $01
    INC ram_subscript
    JMP loc_AA1B_draw_special_screen



ofs_039_AB5E_03_draw_cave_with_3_teleports:
    LDX #$02
    BNE bra_AB4F_draw_room    ; jmp



ofs_040_AB62_03_draw_underground_room:
    LDA #$00
    STA ram_00E9
    LDX #$04    ; underground passage
    JSR sub_0x01E86A_get_enemy_id_from_current_map_location
    AND #$01
    BEQ bra_AB4F_draw_room
    LDX #$06    ; underground room with an item
    BNE bra_AB4F_draw_room    ; jmp



loc_AB73:
; code for overworld only, not for dungeons
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    ASL
    BCS bra_ABBB_RTS
    LDA (ram_0000_t13_data),Y
    AND #$20
    BEQ bra_ABBB_RTS
    JSR sub_AC07_set_block_address_pointer
    JSR sub_bat_718A
; / 04
    LSR
    LSR
    TAX
    LDA tbl_0x01E410_block_addresses,X
    STA ram_0000_t03_block_address
    LDA tbl_0x01E410_block_addresses + $01,X
    STA ram_0000_t03_block_address + $01
    TYA
    SEC
    SBC #$40
; / 08
    LSR
    LSR
    LSR
    TAY
    LDA (ram_0000_t03_block_address),Y
    CMP #$C4
    BEQ bra_ABBC
    CMP #$BC
    BEQ bra_ABBB_RTS
    CMP #$D8
    BNE bra_ABBC
    LDA ram_052B_special_metatile_id
    CMP #$62
    BEQ bra_ABBC
    LDA #$00
    STA ram_052B_special_metatile_id
    LDA #$0C
    STA ram_000D_t03
bra_ABB8:
; bzk optimize, JMP
    JSR sub_AAF1_unpack_and_write_2x2_block
bra_ABBB_RTS:
    RTS
bra_ABBC:
    LDA #$10
    STA ram_000D_t03
    LDA #$70
    BNE bra_ABB8    ; jmp



sub_0x016BD4:
    TXA
    PHA
    LDA ram_pos_X_enemy,X
    AND #$F0
; / 04
    LSR
    LSR
    TAX
    LDA tbl_0x01E410_block_addresses,X
    STA ram_0000_t03_block_address
    LDA tbl_0x01E410_block_addresses + $01,X
    STA ram_0000_t03_block_address + $1
    PLA
    PHA
    TAX
    LDA ram_pos_Y_enemy,X
    AND #$F0
    SEC
    SBC #$40
; / 08
    LSR
    LSR
    LSR
    JSR sub_bat_7276_inc_0000_pointer_by_A
    LDY #$00
    LDX #$10
    LDA ram_0005_t07
    CMP #$27
    BCC bra_ABF5
    CMP #$F3
    BCC bra_ABFF
bra_ABF5:
    LDX #$0E
bra_ABF7_loop:
    CMP tbl_A97C,X
    BEQ bra_ABFF
    DEX
    BNE bra_ABF7_loop
bra_ABFF:
    STX ram_000D_t03
    JSR sub_AAF1_unpack_and_write_2x2_block
    PLA
    TAX
    RTS



sub_AC07_set_block_address_pointer:
sub_0x016C17_set_block_address_pointer:
; out
    ; ram_0000_t03_block_address
    LDA #< ram_6530
    STA ram_0000_t03_block_address
    LDA #> ram_6530
    STA ram_0000_t03_block_address + $01
    RTS



sub_AC10:
ofs_024_AC10_05:
ofs_038_AC10_04:
ofs_039_AC10_04:
ofs_040_AC10_04:
    JSR sub_AC16
    BCS bra_AC27
    RTS



sub_AC16:
; out
    ; C
        ; 0 = 
        ; 1 = 
    JSR sub_A924
    INC ram_00E9
    LDA ram_00E9
    CMP #$16
    RTS



ofs_024_AC20_04:
    JSR sub_A8C4
    LDA #$00
    STA ram_00E9
bra_AC27:
    INC ram_subscript
    RTS


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



ofs_002_0x017010_02:
    LDA ram_map_location
    JSR sub_83D7
    LDA #con_ppu_buf_overworld_palette
    BNE bra_B018    ; jmp



loc_B009:
ofs_002_0x017019_03:
    LDA #$D0
    LDY #$17
bra_B00D:
    JMP loc_8501



sub_B010:
ofs_002_0x017020_04:
    LDA #$E8
    LDY #$2F
    BNE bra_B00D    ; jmp



ofs_002_0x017026_05:
    LDA #con_ppu_buf_hud
bra_B018:
    STA ram_ppu_load_index
bra_B01A:
    INC ram_subscript
    RTS



ofs_002_0x01702D_06:
    LDA ram_dungeon_level
    BEQ bra_B026    ; if overworld
; if dungeon
    JSR sub_B5EF
    BEQ bra_B01A
bra_B026:
    LDA #con_ppu_buf_44_minimap
    BNE bra_B018    ; jmp



ofs_002_0x01703A_07_draw_level_text:
    LDA ram_6BB1
    BEQ bra_B01A
    STA ram_6825    ; change number for LEVEL-
    LDA #con_ppu_buf_level_text
    BNE bra_B018    ; jmp



ofs_002_0x017046_08:
    JSR sub_A8C4
    LDY #$10
    STY ram_007C
    INY ; 11
    STY ram_007C + $01
    LDA #$00
    STA ram_0017_rendering_flag
    LDA #con_dir_Up
    STA ram_dir_link
    LDA #$78
    STA ram_pos_X_link
    LDA ram_6BA6
    STA ram_pos_Y_link
    JMP loc_bat_6C90



tbl_B054:
; Y = 00
    .byte $11   ; 00 
    .byte $E0   ; 01 
    .byte $4E   ; 02 
    .byte $CD   ; 03 
    .byte $89   ; 04 minimal collision
; Y = 05
    .byte $21   ; 00 
    .byte $D0   ; 01 
    .byte $5E   ; 02 
    .byte $BD   ; 03 
    .byte $78   ; 04 minimal collision



sub_B05E:
sub_0x01706E:
    LDY #$05
    LDA ram_dungeon_level
    BNE bra_B068    ; if dungeon
; if overworld
    LDY #$00
    STY ram_0053
bra_B068:
    LDX #$00
bra_B06A_loop:
    LDA tbl_B054,Y
    STA ram_0346,X
    INY
    INX
    CPX #$05
    BNE bra_B06A_loop
    RTS



tbl_B077:
    .byte $28   ; 00 
    .byte $D8   ; 01 
    .byte $00   ; 02 



ofs_main_script_1_0x01708A_06:
; con_script_screen_trans_start
    JSR sub_0x01EA61
    JSR sub_0x01EA4D
    LDA ram_dungeon_level
    BEQ bra_B087    ; if overworld
; if dungeon
    JSR sub_bat_7512
bra_B087:
    JSR sub_0x01F248
    JSR sub_B464
    LDA ram_dungeon_level
    BEQ bra_B0AB    ; if overworld
; if dungeon
    JSR sub_B0C3
    PHA
    AND #$07
    CMP #$02
    BNE bra_B0A0
    LDA #con_sfx_2_secret_found
    STA ram_sfx_2
bra_B0A0:
    PLA
    AND #$07
    CMP #$02
    BCC bra_B0AB
    CMP #$05
    BCC bra_B0AD
bra_B0AB:
    LDY #$02
bra_B0AD:
    LDA tbl_B077,Y
    STA ram_0394_link
    JSR sub_0x01EAED
sub_B0B6:
sub_0x0170C6:
    LDA #$00
    STA ram_0064
    LDY #$05
bra_B0BC_loop:
    STA ram_00B9,Y
    DEY
    BPL bra_B0BC_loop
    RTS



sub_B0C3:
    LDY #$00
    LDA ram_dir_link
    AND #con_dir__DR
    BEQ bra_B0CC
    INY ; 01
bra_B0CC:
    STY ram_000F_t01_direction
    LDA ram_dir_link
    LDY ram_script
    CPY #con_script_screen_trans_start
    BEQ bra_B0D9
    JSR sub_bat_7013_get_Y_from_direction
bra_B0D9:
    STA ram_0002_t24_direction
    JSR sub_A3F6
    LDY ram_000F_t01_direction
    RTS



sub_B0E1_write_nametable_attributes_to_buffer:
; in
    ; A = 
    ; X = 
    ; Y = 
    STX ram_0302_ppu_buffer
    STA ram_0302_ppu_buffer + $01
    LDX #$18    ; counter
    STX ram_0302_ppu_buffer + $02
    LDA #$FF    ; close buffer
    STA ram_0302_ppu_buffer + $03,X
bra_B0F1_loop:
    LDA ram_0530_nmt_attr_buffer,Y
    STA ram_0302_ppu_buffer + $02,X
    DEY
    DEX
    BNE bra_B0F1_loop
    RTS



ofs_main_script_1_0x01710C_0A:
; con_script_0A
    LDA ram_subscript
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_024_B117_00
    .word ofs_024_B153_01
    .word ofs_024_B147_02
    .word ofs_024_B13C_03
    .word ofs_024_AC20_04
    .word ofs_024_AC10_05
    .word ofs_024_B166_06
    .word ofs_024_B173_07
    .word ofs_024_B14B_08
    .word ofs_024_B13C_09
    .word ofs_024_B15A_0A



ofs_024_B117_00:
ofs_038_B117_00:
ofs_039_B117_00:
ofs_040_B117_00:
    LDA #$00
    STA ram_00E9
    STA ram_00EE
    LDA ram_dungeon_level
    BNE bra_B127    ; if dungeon
; if overworld
    JSR sub_B127
    JMP loc_83B2
bra_B127:
sub_B127:
    INC ram_subscript
    JMP loc_0x01EA4D



ofs_040_B12C_05:
    LDA #con_ppu_buf_26
bra_B12E:
loc_B12E_set_ppu_load_index:
    STA ram_ppu_load_index
bra_B130:
ofs_038_B130_02:
ofs_039_B130_02:
    INC ram_subscript
    RTS



ofs_040_B133_01:
    LDA #$00
bra_B135:
    LDY ram_dungeon_level
    BEQ bra_B130    ; if overworld
; if dungeon
    JSR sub_87B3
ofs_040_B13C_02:
ofs_040_B13C_07:
ofs_024_B13C_03:
ofs_024_B13C_09:
    LDY ram_dungeon_level
    BEQ bra_B130    ; if overworld
; if dungeon
    JMP loc_8CFB



ofs_040_B143_06:
    LDA #$A0
    BNE bra_B135    ; jmp



ofs_024_B147_02:
    LDA #$20
    BNE bra_B135    ; jmp



ofs_024_B14B_08:
    LDA #$80
    BNE bra_B135    ; jmp



ofs_038_B14F_01:
ofs_039_B14F_01:
    LDA #con_ppu_buf_cave_palette
    BNE bra_B12E    ; jmp



ofs_024_B153_01:
    LDA ram_dungeon_level
    BNE bra_B130    ; if dungeon
; if overworld
    JMP loc_0x01EA3B_set_tunic_color



ofs_024_B15A_0A:
    JSR sub_B0B6
    LDA #$00
    STA ram_subscript
    LDA #con_script_04_screen_trans_end
    STA ram_script
    RTS



ofs_024_B166_06:
    LDA ram_map_location
    JMP loc_B16D



ofs_038_B16B_05:
ofs_039_B16B_05:
    LDA #$44
loc_B16D:
    JSR sub_83D7
    JMP loc_B009



ofs_024_B173_07:
ofs_038_B173_06:
ofs_039_B173_06:
    JSR sub_B010
; bzk optimize, after deleting 0x017189 this JMP will be useless
    JMP loc_B17B_clear_screen_transition_flag


; bzk garbage
    INC ram_subscript



loc_B17B_clear_screen_transition_flag:
    LDA #$00
    STA ram_screen_transition_flag
    RTS



ofs_038_B180_08:
ofs_039_B180_08:
    LDA ram_0394_link
    BEQ bra_B194
    LDA ram_dir_link
    STA ram_03F8_link
    STA ram_000F_t01_direction
    LDX #$00
    JSR sub_0x01F09D
    JMP loc_0x01EDD5
bra_B194:
    JMP loc_0x01EAED



tbl_B197:
    .byte $30   ; 00 
    .byte $C0   ; 01 



ofs_040_B199_08:
    LDA ram_subscript
    PHA
    JSR sub_87C6
    JSR sub_B0B6
    PLA
    STA ram_subscript
    LDY ram_map_location
    LDX #$00
    LDA ram_copy_map_location
    CMP ram_687E_map_data,Y
    BEQ bra_B1B2
    INX
bra_B1B2:
    LDA tbl_B197,X
    STA ram_pos_X_link
    LDA #$41
    STA ram_pos_Y_link
    LDA #con_dir_Down
    STA ram_dir_link
    LDA #$E4
    STA ram_0394_link
    LDA #$00
    STA ram_0011_screen_ready_flag
    STA ram_0053
    INC ram_subscript
    RTS



ofs_040_B1CD_09:
    LDA ram_dir_link
    STA ram_03F8_link
    JSR sub_0x01EDB0
    LDA ram_pos_Y_link
    CMP #$5D
    BNE bra_B1E5_RTS
    LDA #con_obj_state_00
    STA ram_state_link
    LDA #$01
    STA ram_005A
    STA ram_0011_screen_ready_flag
bra_B1E5_RTS:
    RTS



sub_0x0171F6:
    LDA ram_0063
    BEQ bra_B213_RTS
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
    LDA ram_item_hearts + $01
    CMP #$F8
    BCS bra_B1FD
    CLC
    ADC #$06
    STA ram_item_hearts + $01
    RTS
bra_B1FD:
    LDA #$00
    STA ram_item_hearts + $01
    JSR sub_bat_746C
    BNE bra_B214
    DEC ram_item_hearts + $01
    LDA #$00
    STA ram_052E
    STA ram_0063
    STA ram_pause_flag
bra_B213_RTS:
    RTS
bra_B214:
    INC ram_item_hearts
    RTS



tbl_B218_ppu_load_index:
    .byte con_ppu_buf_00   ; 00 
    .byte con_ppu_buf_00   ; 01 
    .byte con_ppu_buf_00   ; 02 
    .byte con_ppu_buf_30   ; 03 
    .byte con_ppu_buf_32   ; 04 
    .byte con_ppu_buf_34   ; 05 
    .byte con_ppu_buf_38   ; 06 
    .byte con_ppu_buf_3A   ; 07 
    .byte con_ppu_buf_3C   ; 08 
    .byte con_ppu_buf_00   ; 09 
    .byte con_ppu_buf_00   ; 0A 
    .byte con_ppu_buf_00   ; 0B 
    .byte con_ppu_buf_40   ; 0C 



tbl_B225_ppu_load_index:
    .byte con_ppu_buf_00   ; 00 
    .byte con_ppu_buf_00   ; 01 
    .byte con_ppu_buf_00   ; 02 
    .byte con_ppu_buf_30   ; 03 
    .byte con_ppu_buf_32   ; 04 
    .byte con_ppu_buf_34   ; 05 
    .byte con_ppu_buf_38   ; 06 
    .byte con_ppu_buf_3A   ; 07 
    .byte con_ppu_buf_3C   ; 08 
    .byte con_ppu_buf_00   ; 09 
    .byte con_ppu_buf_00   ; 0A 
    .byte con_ppu_buf_00   ; 0B 
    .byte con_ppu_buf_00   ; 0C 
    .byte con_ppu_buf_00   ; 0D 
    .byte con_ppu_buf_00   ; 0E 
    .byte con_ppu_buf_50   ; 0F 
    .byte con_ppu_buf_52   ; 10 
    .byte con_ppu_buf_54   ; 11 
    .byte con_ppu_buf_56   ; 12 
    .byte con_ppu_buf_58   ; 13 
    .byte con_ppu_buf_5A   ; 14 



sub_B23A:
    LDA ram_005E
    BMI bra_B25A_RTS
    LSR
    TAY
    BCS bra_B25B
    CMP #$0D
    BCS bra_B24C
    LDA tbl_B218_ppu_load_index,Y
loc_B249:
    JMP loc_B291_set_ppu_load_index
bra_B24C:
    CMP #$15
    BNE bra_B255
    LDA #con_ppu_buf_42
    JMP loc_B249   ; bzk optimize, BNE or directly to B291
bra_B255:
    JSR sub_B57F
loc_B258:
    DEC ram_005E
bra_B25A_RTS:
    RTS
bra_B25B:
    LDA #$28    ; ppu hi
    STA ram_0302_ppu_buffer
    LDA #$C0
bra_B262_loop:
    CLC
    ADC #$20
    BCC bra_B26A_not_overflow
    INC ram_0302_ppu_buffer ; ppu hi
bra_B26A_not_overflow:
    DEY
    BPL bra_B262_loop
    STA ram_0302_ppu_buffer + $01
    LDA #$60
    STA ram_0302_ppu_buffer + $02
    LDA #$24
    STA ram_0302_ppu_buffer + $03
    LDA #$FF
    STA ram_0302_ppu_buffer + $04
    JMP loc_B258



sub_B282:
    LDA ram_005E
    BMI bra_B295_RTS
    LSR
    TAY
    BCS bra_B25B    ; bzk
    CMP #$15
    BCS bra_B293
    LDA tbl_B225_ppu_load_index,Y
loc_B291_set_ppu_load_index:
    STA ram_ppu_load_index
bra_B293:
    DEC ram_005E
bra_B295_RTS:
    RTS



tbl_B296:
    .byte $0C   ; 00 
    .byte $0C   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 



sub_0x0172AA:
    LDA ram_state_link
    BNE bra_B2BA    ; if not con_obj_state_00
    JSR sub_8D8C
    LDA ram_sword_disable_timer
    ORA ram_052E
    BNE bra_B2B1
    LDA ram_btn_press
    AND #con_btn_A
    BEQ bra_B2B1
    JSR sub_8E00_A_item_handler
bra_B2B1:
    LDA ram_btn_press
    AND #con_btn_B
    BEQ bra_B2BA
    JSR sub_8E1C_B_item_handler
bra_B2BA:
    LDX #$00
    LDA ram_00C0_link
    BNE bra_B2FC_RTS
    LDA ram_dungeon_level
    BEQ bra_B2C7    ; if overworld
; if dungeon
    JSR sub_913F
bra_B2C7:
    LDA ram_0394_link
    BEQ bra_B2CF
    JMP loc_B38D
bra_B2CF:
; A = 00
    STA ram_000B_t09_counter_1
    STA ram_000C_t10_counter_2
    STA ram_0057
    LDY #$03
bra_B2D7_loop:
    LDA ram_03F8_link
    AND tbl_bat_6DC3_direction,Y
    BEQ bra_B2F5
    STA ram_000F_t01_direction
    TYA
    PHA
    INC ram_000B_t09_counter_1
    JSR sub_0x01EE0A_find_current_collision_tile
    CMP ram_min_collision_tile
    BCS bra_B2F3
    LDA ram_000F_t01_direction
    STA ram_000D_t10_link_direction
    INC ram_000C_t10_counter_2
bra_B2F3:
    PLA
    TAY
bra_B2F5:
    DEY
    BPL bra_B2D7_loop
    LDY ram_000B_t09_counter_1
    BNE bra_B2FD
bra_B2FC_RTS:
    RTS
bra_B2FD:
    LDA ram_000F_t01_direction
    CPY #$01
    BEQ bra_B35F
    LDA ram_000C_t10_counter_2
    BNE bra_B30A
    JMP loc_B3AB
bra_B30A:
    TAY
    INC ram_0057
    LDX #$00
    LDA ram_000D_t10_link_direction
    CPY #$01
    BEQ bra_B35F
    LDY ram_dungeon_level
    BEQ bra_B35F    ; if overworld
; if dungeon
    LDY ram_pos_X_link
    CPY #$20
    BEQ bra_B323
    CPY #$D0
    BNE bra_B333
bra_B323:
    LDY ram_pos_Y_link
    CPY #$85
    BNE bra_B34D
    LDA ram_dir_link
    AND #con_dir_Down
    BEQ bra_B34D
bra_B32F:
    LDA ram_dir_link
    BNE bra_B35F
bra_B333:
    LDA ram_dir_link
    LDX ram_0056
    BEQ bra_B34D
    LDY ram_dungeon_level
    BEQ bra_B35F    ; if overworld
; if dungeon
    LDY ram_pos_X_link
    CPY #$78
    BNE bra_B35F
    LDY ram_pos_Y_link
    CPY #$5D
    BNE bra_B35F
    AND #con_dir__LR
    BEQ bra_B32F
bra_B34D:
    LDA ram_dir_link
    INX
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_03F8_link
    PHA
    AND tbl_B296,Y
    STA ram_000C_t11
    PLA
    EOR ram_000C_t11
bra_B35F:
    STX ram_0056
    JSR sub_B3A9
    LDX #$00
sub_B366:
bra_B366:
    LDA #$60
    STA ram_0000_t40
    LDA ram_dungeon_level
    BNE bra_B387    ; if dungeon
; if overworld
    LDA ram_collision_tile_link
    CMP #con_collision_tile + $74
    BEQ bra_B379
    CMP #con_collision_tile + $75
    BNE bra_B387
bra_B379:
    LDA #$30    ; stairs clibing speed
    STA ram_0000_t40
    CMP ram_03BC_link
    BEQ bra_B387
    LDA #$00
    STA ram_03A8_link
bra_B387:
    LDA ram_0000_t40
    STA ram_03BC_link
bra_B38C_RTS:
    RTS



loc_B38D:
    LDA ram_03F8_link
    BEQ bra_B38C_RTS
    JSR sub_bat_7013_get_Y_from_direction
    LDA tbl_bat_6DC3_direction,Y
    CMP ram_dir_link
    BEQ bra_B366
    ORA ram_dir_link
    CMP #con_dir__LR
    BEQ bra_B3A6
    CMP #con_dir__UD
    BNE bra_B3AF
bra_B3A6:
    LDA tbl_bat_6DC3_direction,Y
sub_B3A9:
    STA ram_dir_link
loc_B3AB:
    STA ram_03F8_link
    RTS
bra_B3AF:
    LDA ram_0057
    BNE bra_B366
    LDA ram_0394_link
    JSR sub_bat_701F_EOR_FF_if_negative
    PHA
    LDA ram_dir_link
    JSR sub_bat_7013_get_Y_from_direction
    STA ram_0001_t29_direction
    PLA
    CMP #$04
    BCS bra_B3F3_RTS
    LDA ram_dir_link
    AND #con_dir__UL
    BEQ bra_B3D3
    LDA ram_0394_link
    BPL bra_B3F3_RTS
    BMI bra_B3D8    ; jmp
bra_B3D3:
    LDA ram_0394_link
    BMI bra_B3F3_RTS
bra_B3D8:
    LDA ram_0001_t29_direction
    STA ram_dir_link
    LDA #$08
    LDY ram_0394_link
    BMI bra_B3E5
    LDA #$F8
bra_B3E5:
    PHA
    TYA
    JSR sub_bat_7021_EOR_FF
    STA ram_0001_t30
    PLA
    SEC
    SBC ram_0001_t30
    STA ram_0394_link
bra_B3F3_RTS:
    RTS



sub_0x017404:
    LDA ram_005A
    ORA ram_0394_link
    BNE bra_B46E_RTS
    LDA ram_dungeon_level
    BNE bra_B40D    ; if dungeon
; if overworld
    LDA ram_map_location
    CMP #con_map_location + $22
    BNE bra_B40D
    LDA ram_pos_X_link
    AND #$07
    BNE bra_B46E_RTS
    BEQ bra_B413    ; jmp
bra_B40D:
    LDA ram_pos_X_link
    AND #$0F
    BNE bra_B46E_RTS
bra_B413:
    LDA ram_pos_Y_link
    AND #$0F
    CMP #$0D
    BNE bra_B46E_RTS
    JSR sub_0x01EE04_find_current_collision_tile___direction_00
    LDA ram_collision_tile_link
    LDY ram_dungeon_level
    BEQ bra_B46F    ; if overworld
; if dungeon
    CMP #$70
    BCC bra_B46E_RTS
    CMP #$74
    BCS bra_B46E_RTS
    JSR sub_B464
    LDA ram_map_location
    STA ram_copy_map_location
    LDX #$FF
bra_B437_loop:
    INX
    LDA ram_6BB2,X
    TAY
    LDA ram_map_location
    CMP ram_687E_map_data,Y
    BEQ bra_B448
    CMP ram_68FE_map_data,Y
    BNE bra_B437_loop
bra_B448:
    STY ram_map_location
    LDA #con_script_09
loc_B44C:
bra_B44C:   ; A = 02 bzk
    STA ram_next_script
    CMP #con_script_09
    BEQ bra_B45A
    JSR sub_bat_6EE9
    STA ram_sfx_2   ; con_sfx_2_00
    STA ram_timer_obj + $14
bra_B45A:
    LDA #con_script_10
    STA ram_script
    JSR sub_B559_disable_greyscale
    JMP loc_8F61



sub_B464:
    LDA ram_dungeon_level
    BNE bra_B46B    ; if dungeon
; if overworld
    JMP loc_90E5
bra_B46B:
; bzk optimize, JMP
    JSR sub_92D7
bra_B46E_RTS:
    RTS
bra_B46F:
    STA ram_0065
    CMP #con_collision_tile + $24
    BEQ bra_B486
    CMP #con_collision_tile + $88
    BEQ bra_B486
    CMP #con_collision_tile + $70
    BCC bra_B46E_RTS
    CMP #con_collision_tile + $74
    BCS bra_B46E_RTS
    LDA #con_collision_tile + $70
    STA ram_collision_tile_link
bra_B486:
    JSR sub_B464
    LDY ram_map_location
    LDA ram_68FE_map_data,Y
    AND #$FC
    CMP #$40
    BCC bra_B49F
    LDY #con_script_0B
    CMP #$50
    BNE bra_B49B
    INY ; con_script_0C
bra_B49B:
    TYA
    JMP loc_B44C
bra_B49F:
; / 04
    LSR
    LSR
    STA ram_dungeon_level
    LDA ram_map_location
    STA ram_0526
    LDA #con_script_02
    BNE bra_B44C    ; jmp



sub_B4AC_check_battery_integrity:
sub_0x0174BC_check_battery_integrity:
; and initialize it if necessary
; out
    ; C
        ; 0 = battery is OK
        ; 1 = battery was not initialized yet
    LDA ram_battery_check_1
    CMP #$5A
    BNE bra_B4BA_check_failed
    LDA ram_battery_check_2
    CMP #$A5
    BEQ bra_B4E6_check_passed
bra_B4BA_check_failed:
; initialization
    LDA #$FF
    STA ram_652A_slot
    STA ram_652A_slot + $01
    STA ram_652A_slot + $02
; clear 6530-7FFF
    LDA #> ram_6530
    STA ram_0000_t0A_data + $01
    LDA #< ram_6530
    STA ram_0000_t0A_data
    LDY #$00
bra_B4CF_loop:
    LDA #$00
    STA (ram_0000_t0A_data),Y
; bzk optimize, INC lo + BNE + INC hi
    LDA ram_0000_t0A_data
    CLC
    ADC #< $0001
    STA ram_0000_t0A_data
    LDA ram_0000_t0A_data + $01
    ADC #> $0001
    STA ram_0000_t0A_data + $01
    CMP #> $8000
    BNE bra_B4CF_loop
    SEC
    RTS
bra_B4E6_check_passed:
    CLC
    RTS



sub_0x0174F8_clear_memory:
    LDA #$07
    LDY #$FE
    JSR sub_0x01E618_clear_memory   ; clear 0300-07FE
; Y = FF
    LDA #$00
    STA ram_00F7_flag
    STA ram_00F5_reset_check_5A
    STA ram_00F6_reset_check_A5
    STA ram_prev_screen_transition_flag
; clear 0000-00EF
; bzk optimize
    LDY #$EF
bra_B4FB_loop:
    STA $0000,Y
    DEY
    CPY #$FF
    BNE bra_B4FB_loop
    LDA #$40
    STA ram_0525
    STA ram_indiv_random
    LDA #$01
    STA ram_slot_active_flag + $03
    STA ram_slot_active_flag + $04
    RTS



tbl_B513_next_map_location_offset:
    .byte $F0   ; 00 up
    .byte $10   ; 01 down
    .byte $FF   ; 02 left
    .byte $01   ; 03 right



ofs_000_0x017527_01:
ofs_000_0x017527_08:
    LDA #$00
    STA ram_00E7
    RTS



bra_B51C:   ; bzk
    ASL ram_0000_t41
    DEX
    JMP loc_B528



ofs_000_0x017532_00:
ofs_000_0x017532_02:
ofs_000_0x017532_03:
ofs_000_0x017532_04:
ofs_000_0x017532_05:
ofs_000_0x017532_06:
ofs_000_0x017532_07:
    LDA #$01
    STA ram_0000_t41
    LDX #$03
loc_B528:
    LDA ram_00E7
    BIT ram_0000_t41
    BEQ bra_B51C
; bzk optimize, game never uses ram_04E4 later
    JSR sub_0x01E86A_get_enemy_id_from_current_map_location
    STA ram_04E4    ; enemy id
    LDA tbl_B513_next_map_location_offset,X
    CLC
    ADC ram_map_location
    STA ram_next_map_location
    LDA ram_dungeon_level
    BNE bra_B543    ; if dungeon
; if overworld
    JSR sub_bat_752F_check_overworld_secret_correct_path
bra_B543:
    LDA ram_next_map_location
    BPL bra_B559
loc_B547:
    JSR sub_0x01EBB3_clear_subscript
; A = 00
    STA ram_00E7
    STA ram_dungeon_level
    LDA #$02    ; con_script_02
    STA ram_script
    STA ram_005A
    LDA #con_sfx_4_80
    STA ram_sfx_4
bra_B559:
sub_B559_disable_greyscale:
sub_0x017569_disable_greyscale:
; bzk optimize, is this necessary?
    LDA ram_for_2001
    AND #$FE
    STA ram_for_2001
    RTS



sub_B560:
; in
    ; A = link direction
    LDX #$01
    STX ram_0000_t42
    LDX #$03
loc_B566_loop:
    BIT ram_0000_t42
    BNE bra_B570
    ASL ram_0000_t42
    DEX
    JMP loc_B566_loop
bra_B570:
    LDA tbl_B513_next_map_location_offset,X
    CLC
    ADC ram_map_location
    RTS



tbl_B577:
    .byte $80   ; 00 
    .byte $40   ; 01 
    .byte $20   ; 02 
    .byte $10   ; 03 
    .byte $08   ; 04 
    .byte $04   ; 05 
    .byte $02   ; 06 
    .byte $01   ; 07 



sub_B57F:
    LDY #$10
    LDA ram_005E
    LSR
    TAX
    LDA #$FF
    STA ram_0302_ppu_buffer + $03,Y
    LDA #$10
    STA ram_0302_ppu_buffer + $02
    LDA #$28    ; ppu hi
    STA ram_0302_ppu_buffer
    LDA #$EC
bra_B596_loop:
    CLC
    ADC #$20
    BCC bra_B59E_not_overflow
    INC ram_0302_ppu_buffer ; ppu hi
bra_B59E_not_overflow:
    DEX
    BPL bra_B596_loop
    STA ram_0302_ppu_buffer + $01
    LDA ram_005D
    PHA
bra_B5A7_loop:
    JSR sub_B608
    DEC ram_005D
    DEY
    BNE bra_B5A7_loop
    PLA
    SEC
    SBC #$10
    STA ram_005D
    LDX ram_6BAB
loc_B5B8:
    BEQ bra_B5D1
    LDA ram_0302_ppu_buffer + $12
    PHA
    LDY #$0E
bra_B5C0_loop:
    LDA ram_0302_ppu_buffer + $03,Y
    STA ram_0302_ppu_buffer + $04,Y
    DEY
    BPL bra_B5C0_loop
    PLA
    STA ram_0302_ppu_buffer + $03
    DEX
    JMP loc_B5B8
bra_B5D1:
    LDA ram_005E
    SEC
    SBC #$1A
    LSR
    TAX
    LDY #$0F
bra_B5DA_loop:
    LDA ram_6BBD,Y
    AND tbl_B577,X
    BNE bra_B5E7
    LDA #$F5
    STA ram_0302_ppu_buffer + $03,Y
bra_B5E7:
    DEY
    BPL bra_B5DA_loop
    RTS



sub_B5EB:
sub_0x0175FB:
    LDX #con_item_compass
    BNE bra_B5F1    ; jmp



sub_B5EF:
    LDX #con_item_map
bra_B5F1:
    LDA ram_dungeon_level
    BEQ bra_B607_RTS    ; if overworld
; if dungeon
    SEC
    SBC #$01
    CMP #$08
    BCC bra_B5FE
    INX ; con_item_d9_compass  or  con_item_d9_map
    INX
bra_B5FE:
    AND #$07
    TAY
    LDA ram_items,X
    AND tbl_0x01E6CE_8_bits,Y
bra_B607_RTS:
    RTS



sub_B608:
; code for dungeons only, not for overworld
    TYA
    PHA
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    LDA ram_map_location
    PHA
    LDA ram_005D
    STA ram_map_location
    LDA #$13
    STA ram_033F
    LDY ram_map_location
    LDA (ram_0000_t13_data),Y
    AND #$20
    BEQ bra_B632
    LDA #$08
    STA ram_0002_t24_direction
    LDX #$03
bra_B627_loop:
    JSR sub_A3F6
    JSR sub_B641
    DEX
    LSR ram_0002_t24_direction
    BNE bra_B627_loop
bra_B632:
    PLA
    STA ram_map_location
    PLA
    TAY
    LDA ram_033F
    CLC
    ADC #$E2
    STA ram_0302_ppu_buffer + $02,Y
    RTS



sub_B641:
    LDY #$00
    PHA
    CMP #$04
    BCC bra_B665
    TXA
    PHA
    TYA
    PHA
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    CLC
    AND tbl_0x01E6CE_8_bits,X
    BEQ bra_B656
    SEC
bra_B656:
    PLA
    TAY
    PLA
    TAX
bra_B65A:
; bzk optimize, Y always 00
    LDA ram_033F,Y
    ROL
    AND #$0F
    STA ram_033F,Y
    PLA
    RTS
bra_B665:
    CMP #$00
    BEQ bra_B65A
    CLC
    BCC bra_B65A    ; jmp



sub_B66C:
; code for dungeons only, not for overworld
    JSR sub_0x01E6DE_get_byte_from_current_map_location
    LDX #$03
bra_B671_loop:
    LDA (ram_0000_t13_data),Y
    AND tbl_0x01E6CE_8_bits,X
    BEQ bra_B67C
    ORA ram_00EE
    STA ram_00EE
bra_B67C:
    DEX
    BPL bra_B671_loop
    RTS


; bzk garbage
    LDA ram_map_location
    PHA
    AND #$0F
    TAY
    PLA
; / 10
    LSR
    LSR
    LSR
    LSR
    TAX
    RTS



sub_B68D:
; out
    ; Z
        ; 0 = 
        ; 1 = 
    LDA ram_dungeon_level
    BEQ bra_B696_RTS    ; if overworld
; if dungeon
    LDA ram_6A7E_map_data,Y
    AND #$80
bra_B696_RTS:
    RTS



tbl_B697_spr_X:
    .byte $80   ; 00 
    .byte $98   ; 01 
    .byte $AC   ; 02 
    .byte $B4   ; 03 
    .byte $C8   ; 04 
    .byte $80   ; 05 
    .byte $98   ; 06 
    .byte $B0   ; 07 
    .byte $C8   ; 08 
    .byte $80   ; 09 
    .byte $94   ; 0A 
    .byte $A0   ; 0B 
    .byte $B0   ; 0C 
    .byte $C0   ; 0D 
    .byte $CC   ; 0E 
    .byte $B0   ; 0F 



sub_B6A7:
    LDX #$1E
bra_B6A9_loop:  ; con_item_boomerang   con_item_magic_boomerang
    LDA ram_items,X
    BNE bra_B6B5
    DEX
    CPX #$1C
    BNE bra_B6A9_loop
    BEQ bra_B6C2    ; jmp
bra_B6B5:
    LDA #$36
    STA ram_0001_t15_spr_Y
    LDA #$80
    STA ram_0000_t21_spr_X
    TXA
    TAY
    JSR sub_0x01E745
bra_B6C2:
    LDX #$01
bra_B6C4_loop:
; 0658-0668
    LDA ram_items,X
    CPX #con_item_compass
    BNE bra_B6D0
    JSR sub_B5EB
    LDX #$10
bra_B6D0:
    CPX #con_item_map
    BNE bra_B6D9
    JSR sub_B5EF
    LDX #$11
bra_B6D9:
    CMP #$00
    BEQ bra_B717
    CPX #con_item_letter
    BNE bra_B6E6
    LDA ram_item_potion
    BNE bra_B717
bra_B6E6:
    TXA
    PHA
    TAY
    LDA tbl_B697_spr_X,X
    STA ram_0000_t21_spr_X
    LDA #$36
    CPX #$05
    BCC bra_B710
    LDA #$46
    CPX #$0F
    BEQ bra_B710
    CPX #$09
    BCC bra_B710
    LDA #$1E
    CPX #$10
    BCC bra_B710
    LDA #$2C
    STA ram_0000_t21_spr_X
    LDA #$9E
    CPX #$11
    BCC bra_B710
; X = 11
    LDA #$76
bra_B710:
    STA ram_0001_t15_spr_Y
    JSR sub_B81C
    PLA
    TAX
bra_B717:
    INX
    CPX #$12
    BCC bra_B6C4_loop
    RTS



tbl_B71D_spr_X:
    .byte $80   ; 
    .byte $98   ; 
    .byte $B0   ; 
    .byte $B0   ; 
    .byte $C8   ; 
    .byte $80   ; 
    .byte $98   ; 
    .byte $B0   ; 
    .byte $C8   ; 



sub_B726:
    LDX ram_item_slot_index
    BNE bra_B739
    LDX #$1E
bra_B72D_loop:  ; con_item_boomerang  con_item_magic_boomerang
    LDA ram_items,X
    BNE bra_B739
    DEX
    CPX #$1C
    BNE bra_B72D_loop
    BEQ bra_B756    ; jmp
bra_B739:
    LDA ram_items,X
    BEQ bra_B756
    CPX #con_item_letter
    BNE bra_B749
    LDA ram_item_potion
    BNE bra_B756
    LDA #$01
bra_B749:
; bzk optimize, useless STA, will be overwritten at 0x01E748
    STA ram_0004_t20_useless
    LDA #$36
    STA ram_0001_t15_spr_Y
    LDA #$40
    STA ram_0000_t21_spr_X
    JSR sub_B81C
bra_B756:
    LDY ram_item_slot_index
    CPY #con_item_letter
    BNE bra_B767
    LDY #con_item_potion
    LDA ram_items,Y
    BEQ bra_B767
    STY ram_item_slot_index
bra_B767:
    LDA tbl_B71D_spr_X,Y
    STA ram_spr_X + $1C
    CLC
    ADC #$08
    STA ram_spr_X + $20
    LDA #$36
; con_item_sword
; con_item_bomb
; con_item_arrow
; con_item_bow
; con_item_candle
    CPY #$05
    BCC bra_B77B
    LDA #$46
bra_B77B:
    STA ram_spr_Y + $1C
    STA ram_spr_Y + $20
    LDA #$1E
    STA ram_spr_T + $1C
    STA ram_spr_T + $20
    LDA ram_frm_cnt
    AND #$08
; / 08
    LSR
    LSR
    LSR
    ADC #$01
    STA ram_spr_A + $1C
    ORA #$40
    STA ram_spr_A + $20
    LDA ram_03F8_link
    CMP ram_00EF
    BEQ bra_B7F1_RTS
    TAX
    BEQ bra_B7C8
    CPX #$04
    BCS bra_B7C8
    LDX #con_sfx_2_cursor_select
    STX ram_sfx_2
    TAX
    LDA ram_item_slot_index
    PHA
    TXA
    JSR sub_B7C8
    PLA
    CMP ram_item_slot_index
    BEQ bra_B7C4
    LDY ram_item_slot_index
    LDA ram_items,Y
    BNE bra_B7C7_RTS
bra_B7C4:
    LSR ram_sfx_2   ; con_sfx_2_00 ???
bra_B7C7_RTS:
    RTS
bra_B7C8:
sub_B7C8:
sub_0x0177D8:   ; A = 02
    STA ram_00EF
    LDX #$09
bra_B7CC_loop:
    JSR sub_B821
    CPY #con_item_sword
    BEQ bra_B7F2
    CPY #con_item_bow
    BEQ bra_B7E0
    LDA ram_items,Y
    BNE bra_B7E5
    CPY #con_item_potion
    BEQ bra_B808
bra_B7E0:
loc_B7E0:
    DEX
    BPL bra_B7CC_loop
    LDY #con_item_sword
bra_B7E5:
loc_B7E5:
    CPY #con_item_arrow
    BNE bra_B7EE
    LDA ram_item_bow
    BEQ bra_B7CC_loop
bra_B7EE:
    STY ram_item_slot_index
bra_B7F1_RTS:
    RTS
bra_B7F2:
    LDY #$1E
bra_B7F4_loop:  ; con_item_boomerang   con_item_magic_boomerang
    LDA ram_items,Y
    BNE bra_B803
    DEY
    CPY #$1C
    BNE bra_B7F4_loop
    LDY #$00
    JMP loc_B7E0
bra_B803:
    LDY #$00
    JMP loc_B7E5
bra_B808:
    LDY #$0F
    LDA ram_items,Y
    BNE bra_B813
    LDY #con_item_potion
    BNE bra_B7E0    ; jmp
bra_B813:
    LDA ram_item_potion
    BEQ bra_B7EE
    LDY #con_item_potion
    BNE bra_B7EE    ; jmp



sub_B81C:
sub_0x01782C:   ; bzk optimize, delete exports, too many cycles to swap bank and go here for a couple of instructions
loc_0x01782C:
    TXA
    TAY
    JMP loc_0x01E745



sub_B821:
    LDA ram_00EF
    AND #$03
    BEQ bra_B839_RTS
    INY
    LSR
    BCS bra_B82D
    DEY
    DEY
bra_B82D:
    CPY #$FF
    BNE bra_B833
    LDY #$08
bra_B833:
    CPY #$09
    BNE bra_B839_RTS
    LDY #$00
bra_B839_RTS:
    RTS



sub_0x01784A:
    LDA #$00
    STA ram_room_item_flag
    LDA ram_dungeon_level
    BEQ bra_B889    ; if overworld
; if dungeon
    JSR sub_bat_7314_check_map_bit4
    BNE bra_B863
    LDY ram_map_location
    LDA ram_6A7E_map_data,Y
    AND #$1F
    CMP #con_drop_id_03
    BNE bra_B854
    DEC ram_room_item_flag
bra_B854:
    STA ram_drop_id_room
    LDA ram_6AFE_map_data,Y
    AND #$07
    CMP #$03
    BEQ bra_B863
    CMP #$07
    BNE bra_B865
bra_B863:
    DEC ram_room_item_flag
bra_B865:
    LDA ram_69FE_map_data,Y
    AND #$40
    BEQ bra_B86F
    JSR sub_A7F1
bra_B86F:
    JSR sub_bat_718A
bra_B872:
    STA ram_0083
    STY ram_0097
    LDY ram_map_location
    LDA ram_6A7E_map_data,Y
    AND #$1F
    CMP #con_drop_id_1B
    BNE bra_B888_RTS
    LDA ram_0083
    SEC
    SBC #$08
    STA ram_0083
bra_B888_RTS:
    RTS
bra_B889:
    LDA #con_drop_id_1A
    STA ram_drop_id_room
    LDA #$C0
    LDY #$90
    LDX ram_script
    CPX #con_script_05_gameplay
    BNE bra_B89D
    LDX ram_map_location
    CPX #con_map_location + $5F
    BEQ bra_B872
bra_B89D:
    DEC ram_room_item_flag
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



.segment "BANK_05i"
.include "copy_bank___BF50_BFF9.asm"



.out .sprintf("Free bytes in bank 05: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))



.segment "VECTORS_05"
    .word vec_0x01E494_NMI
    .word vec_inc_0x003F60_RESET
    .word $BFF0 ; this game doesn't use IRQ
