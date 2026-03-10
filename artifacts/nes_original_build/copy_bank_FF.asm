.segment "BANK_FF"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $C000  ; for listing file
; 0x01C010-0x02000F



.export tbl_0x01E410_block_addresses
.export loc_out_0x01E450
.export sub_0x01E47D_clear_screen
.export vec_0x01E494_NMI
.export sub_0x01E5F2_jump_to_pointers_after_JSR
.export sub_0x01E607_hide_all_sprites
.export loc_0x01E607_hide_all_sprites
.export sub_0x01E618_clear_memory
.export sub_0x01E635_disable_rendering_and_nmi
.export loc_0x01E635_disable_rendering_and_nmi
.export sub_0x01E689
.export sub_0x01E69F
.export tbl_0x01E6CE_8_bits
.export sub_0x01E6D6_set_map_bit5
.export sub_0x01E6DE_get_byte_from_current_map_location
.export sub_0x01E71E
.export sub_0x01E745
.export loc_0x01E745
.export sub_0x01E79A
.export loc_0x01E81C
.export sub_0x01E827
.export sub_0x01E86A_get_enemy_id_from_current_map_location
.export sub_0x01E872_bomb_blasts_breakable_wall
.export sub_0x01E8E8
.export loc_0x01E8E8
.export loc_0x01EA10_clear_room_history
.export tbl_0x01EA1E_save_slot_index
.export sub_0x01EA3B_set_tunic_color
.export loc_0x01EA3B_set_tunic_color
.export sub_0x01EA4D
.export loc_0x01EA4D
.export sub_0x01EA61
.export sub_0x01EADB
.export sub_0x01EAE3
.export sub_0x01EAED
.export loc_0x01EAED
.export loc_0x01EBB1_prepare_next_script
.export sub_0x01EBB3_clear_subscript
.export loc_0x01EBB3_clear_subscript
.export sub_0x01ED99
.export loc_0x01ED99
.export sub_0x01EDB0
.export loc_0x01EDD5
.export sub_0x01EE04_find_current_collision_tile___direction_00
.export sub_0x01EE0A_find_current_collision_tile
.export sub_0x01EE20_find_current_collision_tile
.export sub_0x01EEC8
.export loc_0x01EEC8
.export sub_0x01EEF4
.export loc_0x01EEF4
.export sub_0x01EEF6
.export ofs_021_0x01EF81_05_flute
.export sub_0x01EFE0
.export sub_0x01F09D
.export loc_0x01F159_set_00_direction
.export sub_0x01F171
.export sub_0x01F192
.export loc_0x01F192
.export sub_0x01F1E0
.export sub_0x01F1EF
.export sub_0x01F223
.export sub_0x01F22B
.export sub_0x01F233
.export sub_0x01F239
.export sub_0x01F241
.export sub_0x01F248
.export loc_0x01F248
.export sub_0x01F24C
.export loc_0x01F24C
.export loc_0x01F3A1
.export sub_0x01F3E4
.export sub_0x01F529
.export loc_0x01F58B
.export sub_0x01F865_clear_enemy_state
.export sub_0x01FA5F
.export sub_0x01FA82
.export sub_0x01FA99
.export sub_0x01FAA3
.export loc_0x01FAA3
.export sub_0x01FEA8_decrease_invincibility_timer
.export sub_0x01FEB6
.export sub_0x01FEC1_destroy_object
.export loc_0x01FEC1_destroy_object
.export sub_0x01FEC3_create_object
.export loc_0x01FEC3_create_object
.export sub_0x01FECB_search_for_free_object
.export sub_0x01FEE6
.export loc_0x01FEE6
.export sub_0x01FEEA
.export loc_0x01FEEA
.export loc_0x01FF44
.export loc_0x01FF60_RESET_vector



.incbin "DPCM.bin"



tbl_E400_block_addresses:
tbl_0x01E410_block_addresses:
; bzk the very 1st byte is dpcm
    .word ram_6530 ; 00 
    .word ram_6546 ; 04 
    .word ram_655C ; 08 
    .word ram_6572 ; 10 
    .word ram_6588 ; 10 
    .word ram_659E ; 14 
    .word ram_65B4 ; 18 
    .word ram_65CA ; 20 
    .word ram_65E0 ; 20 
    .word ram_65F6 ; 24 
    .word ram_660C ; 28 
    .word ram_6622 ; 30 
    .word ram_6638 ; 30 
    .word ram_664E ; 34 
    .word ram_6664 ; 38 
    .word ram_667A ; 40 
    .word ram_6690 ; 40 
    .word ram_66A6 ; 44 
    .word ram_66BC ; 48 
    .word ram_66D2 ; 50 
    .word ram_66E8 ; 50 
    .word ram_66FE ; 54 
    .word ram_6714 ; 58 
    .word ram_672A ; 60 
    .word ram_6740 ; 60 
    .word ram_6756 ; 64 
    .word ram_676C ; 68 
    .word ram_6782 ; 70 
    .word ram_6798 ; 70 
    .word ram_67AE ; 74 
    .word ram_67C4 ; 78 
    .word ram_67DA ; 80 



loc_E440:
loc_out_0x01E450:
    LDA #$00
    STA ram_00F4_flag
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0174BC_check_battery_integrity
    JSR sub_0x0174F8_clear_memory
    JSR sub_E45E
    LDA ram_for_2000
    ORA #$A0    ; enable nmi + spr size 8x16
    STA $2000
    STA ram_for_2000
loc_E45B_infinite_loop:
    JMP loc_E45B_infinite_loop



sub_E45E:
    LDA #$00
    STA $4011
    LDA #$0F
    STA $4015
    LDA #$06
    STA $2001
sub_E46D_clear_screen:
sub_0x01E47D_clear_screen:
    JSR sub_E5F7_hide_all_sprites
    JSR sub_E580_set_scroll_to_00
    JSR sub_E625_disable_rendering_and_nmi
    LDA #> $2000
    JSR sub_E47D_clear_nmt
    LDA #> $2800
sub_E47D_clear_nmt:
    LDX #$24    ; fill byte for nametable
    LDY #$00    ; fill byte for attributes
    JMP loc_E594_clear_nmt



vec_E484_NMI:
vec_0x01E494_NMI:
    LDA ram_for_2000
    LDX ram_005C
    BEQ bra_E48C
    EOR #$02
bra_E48C:
    AND #$7F    ; disable nmi
    STA ram_for_2000
    AND #$7E
    STA $2000
    LDA ram_for_2001
    LDY ram_screen_transition_flag
    BNE bra_E4A3_enable_rendering
; if screen transition is OFF
    LDY ram_ppu_load_index
    BNE bra_E4A5_skip_rendering
    LDY ram_0017_rendering_flag
    BNE bra_E4A5_skip_rendering
bra_E4A3_enable_rendering:
    ORA #$1E
bra_E4A5_skip_rendering:
    STA $2001
    STA ram_for_2001
    LDA #< ram_oam
    STA $2003
    LDA #> ram_oam
    STA $4014
    LDA #$00
    STA $2005
    STA $2005
    LDA #con_prg_bank + $06
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01A090_write_buffer_to_ppu
    LDA #> $3F00
    STA $2006
    LDA #< $3F00
    STA $2006
; A = 00
    STA $2006
    STA $2006
bra_E4D4_infinite_loop:
; wait for sprite 0 hit
    LDA $2002
    AND #$40
    BNE bra_E4D4_infinite_loop
; sprite 0 was hit
    LDA $2002
    LDA ram_screen_transition_flag
    BEQ bra_E4EA
; if transition is ON
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014531
bra_E4EA:
    LDA ram_0011_screen_ready_flag
    BEQ bra_E518
    LDA ram_script
    BEQ bra_E506    ; con_script_title_screen
    CMP #con_script_05_gameplay
    BEQ bra_E506
    CMP #con_script_09
    BEQ bra_E506
    CMP #con_script_0B
    BEQ bra_E506
    CMP #con_script_0C
    BEQ bra_E506
    CMP #con_script_final_credits
    BNE bra_E518
bra_E506:
    LDA $2002
    LDA ram_scroll_X
    STA $2005
    LDA ram_scroll_Y
    STA $2005
    LDA ram_for_2000
    STA $2000
bra_E518:
    LDA ram_pause_script
    ORA ram_pause_flag
    BNE bra_E53B_skip
; counters 0027-003C change each frame
; counters 003D-004E change each 10 frames
    LDX #$26    ; < ram_main_timer
    LDA #$3C    ; < ram_003C
    LDY #$4E    ; < ram_004E
; bzk optimize, X is always 26
    STX ram_0000_t5F_useless_26
; bzk optimize, DEC 0026 without X
    DEC ram_main_timer - $26,X
    BPL bra_E52F
    LDA #$09
; bzk optimize, STA 0026 without X
    STA ram_main_timer - $26,X
    TYA
bra_E52F:
    TAX
bra_E530_loop:
; 0027-003C or 0027-004E
    LDA $00,X   ; ram_003C - $3C,X  or  ram_004E - $4E,X
    BEQ bra_E536
    DEC $00,X   ; ram_003C - $3C,X  or  ram_004E - $4E,X
bra_E536:
    DEX
; bzk optimize, always 26
    CPX ram_0000_t5F_useless_26
    BNE bra_E530_loop
bra_E53B_skip:
    LDA ram_screen_transition_flag
    BNE bra_E542
; if no transition
    JSR sub_E62D_read_joysticks
bra_E542:
; bzk bug? loop for 0018-0024, but 0x010703 works with 0019-0025
    LDX #$18    ; < ram_indiv_random
    LDY #$0D    ; 0018-0024
; bzk optimize, LDA 0018 without X
    LDA ram_indiv_random - $18,X
    AND #$02
    STA ram_0000_t4B
; bzk optimize, LDA 0019 without X
    LDA ram_indiv_random - $18 + $01,X
    AND #$02
    EOR ram_0000_t4B
    CLC
    BEQ bra_E556
    SEC
bra_E556:
bra_E556_loop:
    ROR ram_indiv_random - $18,X
    INX
    DEY
    BNE bra_E556_loop
    LDA #con_prg_bank + $00
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x001835_update_sound_driver
    INC ram_frm_cnt
    LDA ram_0011_screen_ready_flag
    BNE bra_E570_skip_handler
    JSR sub_E8F8_main_script_handler_1
    JMP loc_E573
bra_E570_skip_handler:
    JSR sub_EB30_main_script_handler_2
loc_E573:
    LDA $2002
    LDA ram_for_2000
    ORA #$80    ; enable nmi
    STA $2000
    STA ram_for_2000
    RTI



sub_E580_set_scroll_to_00:
    LDA #$00
    STA $2005
    STA ram_scroll_X
    STA $2005
    STA ram_scroll_Y
    LDA #$30
    STA $2000
    STA ram_for_2000
    RTS



loc_E594_clear_nmt:
; in
    ; A = 2006 hi
    ; X = byte to fill nametable
    ; Y = byte to fill attributes
    STA ram_0000_t4C_ppu_hi
    STX ram_0001_t31_fill_byte
; bzk optimize, Y is always 00
    STY ram_0002_t42_useless_00
    LDA $2002
    LDA ram_for_2000
    AND #$FB
    STA $2000
    STA ram_for_2000
    LDA ram_0000_t4C_ppu_hi
    STA $2006
    LDY #$00
    STY $2006
    LDX #$04
    CMP #$20
    BCS bra_E5B8
; bzk optimize, always 00
    LDX ram_0002_t42_useless_00
bra_E5B8:
    LDY #$00
    LDA ram_0001_t31_fill_byte
bra_E5BC_loop:
    STA $2007
    DEY
    BNE bra_E5BC_loop
    DEX
    BNE bra_E5BC_loop
; bzk optimize, always 00
    LDY ram_0002_t42_useless_00
    LDA ram_0000_t4C_ppu_hi
; bzk optimize, useless check, 0000 is always 20 or 28, it can't be < 20.
; this routine was probably supposed to clear 0000-1FFF ppu as well
    CMP #$20
    BCC bra_E5DF
    ADC #$02
    STA $2006
    LDA #$C0
    STA $2006
    LDX #$40
bra_E5D9_loop:
    STY $2007
    DEX
    BNE bra_E5D9_loop
bra_E5DF:
; bzk optimize, useless LDX
    LDX ram_0001_t31_fill_byte
    RTS



sub_E5E2_jump_to_pointers_after_JSR:
sub_0x01E5F2_jump_to_pointers_after_JSR:
    ASL
    TAY
    PLA
    STA ram_0000_t07_data
    PLA
    STA ram_0000_t07_data + $01
    INY
    LDA (ram_0000_t07_data),Y
    STA ram_0002_t10_jmp
    INY
    LDA (ram_0000_t07_data),Y
    STA ram_0002_t10_jmp + $01
    JMP (ram_0002_t10_jmp)



sub_E5F7_hide_all_sprites:
sub_0x01E607_hide_all_sprites:
loc_0x01E607_hide_all_sprites:
    LDY #$00
    LDX #$40
bra_E5FB_loop:
    LDA #$F8
    STA ram_spr_Y,Y
    INY
    INY
    INY
    INY
    DEX ; bzk optimize, no need for X in this loop, use Y only
    BNE bra_E5FB_loop
    RTS



sub_0x01E618_clear_memory:
; in
    ; A = hi address
    ; Y = highest lo address for A
; bzk optimize, move to bank 05
    STA ram_0000_t06_data + $01
    LDA #$00
    STA ram_0000_t06_data
bra_E60E_loop:
    LDA #$00
    STA (ram_0000_t06_data),Y
    DEY
    CPY #$FF
    BNE bra_E60E_loop
    DEC ram_0000_t06_data + $01
    LDA ram_0000_t06_data + $01
    CMP #$03
    BCS bra_E60E_loop
    LDA #$FF
    STA ram_0302_ppu_buffer
    RTS



sub_E625_disable_rendering_and_nmi:
sub_0x01E635_disable_rendering_and_nmi:
loc_0x01E635_disable_rendering_and_nmi:
    LDA #$00
    STA $2001
    STA ram_for_2001
    RTS



sub_E62D_read_joysticks:
    LDA #$01
    STA $4016
    LDA #$00
    STA $4016
    STA ram_0003_t18
    STA ram_0003_t18 + $01
    TAX ; 00
    JSR sub_E640_read_player_input
    INX ; 01
sub_E640_read_player_input:   ; X = 00
bra_E640_loop:
    STA ram_0002_t17
    LDA #$01
    STA $4016
    LDA #$00
    STA $4016
    LDY #$08
bra_E64E_loop:
    LDA $4016,X
    LSR
    ROL ram_btn_press,X
    LSR
    ROL ram_0000_t49
    DEY
    BNE bra_E64E_loop
    LDA ram_btn_press,X
    CMP ram_0002_t17
    BNE bra_E640_loop
    INC ram_0003_t18,X
    LDY ram_0003_t18,X
    CPY #$02
    BCC bra_E640_loop
    LDA ram_0000_t49
    ORA ram_btn_press,X
    STA ram_btn_press,X
    PHA
    EOR ram_btn_hold,X
    AND ram_btn_press,X
    STA ram_btn_press,X
    PLA
    STA ram_btn_hold,X
    RTS



sub_E679:
sub_0x01E689:
    LDA ram_dungeon_level
    BEQ bra_E6CD_RTS    ; if overworld
; if dungeon
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0175FB
    BEQ bra_E6CD_RTS
    LDA ram_6BAE
    LDX #$04
    JMP loc_bat_71ED



sub_0x01E69F:
    LDY ram_dungeon_level
    BEQ bra_E6B8    ; if overworld
; if dungeon
    LDA ram_dir_link
    STA ram_0002_t24_direction
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x016406
    LDY ram_0001_t01
bra_E6A1:
    STY ram_00E7
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_000_0x017532_00
    .word ofs_000_0x017527_01
    .word ofs_000_0x017532_02
    .word ofs_000_0x017532_03
    .word ofs_000_0x017532_04
    .word ofs_000_0x017532_05
    .word ofs_000_0x017532_06
    .word ofs_000_0x017532_07
    .word ofs_000_0x017527_08



bra_E6B8:
    LDY ram_dir_link
    LDA #$00
    BEQ bra_E6A1    ; jmp



tbl_0x01E6CE_8_bits:
    .byte $01   ; 00 
    .byte $02   ; 01 
    .byte $04   ; 02 
    .byte $08   ; 03 
    .byte $10   ; 04 
    .byte $20   ; 05 
    .byte $40   ; 06 
    .byte $80   ; 07 



sub_E6C6_set_map_bit5:
sub_0x01E6D6_set_map_bit5:
    JSR sub_E6CE_get_byte_from_current_map_location
    ORA #$20
    STA (ram_0000_t13_data),Y
bra_E6CD_RTS:
    RTS



sub_E6CE_get_byte_from_current_map_location:
sub_0x01E6DE_get_byte_from_current_map_location:
; out
    ; A = 
    ; ram_0000_t13_data
; bzk optimize, JSR E6CE
    LDA ram_6BAF
    STA ram_0000_t13_data
    LDA ram_6BB0
    STA ram_0000_t13_data + $01
    LDY ram_map_location
    LDA (ram_0000_t13_data),Y
    RTS



bra_E6DD:
    LDA ram_pos_X_enemy + $01
    STA ram_0083
    LDA ram_pos_Y_enemy + $01
    STA ram_0097
    JMP loc_E70C
bra_E6E8:
    PLA
bra_E6E9_RTS:
    RTS



sub_E6EA:
    JSR sub_bat_7314_check_map_bit4
    BNE bra_E6E9_RTS
    LDA ram_room_item_flag
    BMI bra_E6E9_RTS
; if room has an item
    LDA ram_drop_id_room
    CMP #$3F
    BEQ bra_E6E9_RTS
    LDX #$01
    LDA ram_obj_id_enemy
    CMP #con_obj_id_17
    BEQ bra_E6DD
    CMP #con_obj_id_2A
    BEQ bra_E6DD
    CMP #con_obj_id_30
    BEQ bra_E6DD
    LDX #$13
loc_E70C:
    LDA ram_drop_id_room
sub_E70E:
sub_0x01E71E:
; in
    ; A = con_drop_id
    ; X = object index
    PHA
    LDA ram_03A8_enemy,X
    CMP #$F0
    BCC bra_E719
    LSR
    BCC bra_E6E8
bra_E719:
    JSR sub_FA93
    PLA
    TAX
    LDA tbl_bat_72C8,X
    CMP #$30
; bzk optimize, no 30 values in the table
    BEQ bra_E731
    AND #$0F
bra_E727:
    STA ram_0004_t21
    LDA tbl_bat_72A4,X
    TAX
    TAY
    JMP loc_E73A
bra_E731:
; bzk garbage
    LDA #$FF
    BNE bra_E727    ; jmp



sub_0x01E745:
loc_0x01E745:
; in
    ; X = con_item
    ; Y = 
    LDA ram_items,X
    STA ram_0004_t21
loc_E73A:
    LDA tbl_bat_72EC,X
    CPX #con_item_1_rupee
    BEQ bra_E74D
    CPX #con_item_triforce
    BEQ bra_E74D
    CPX #con_item_1B
    BEQ bra_E74D
    CPX #con_item_hearts_2
    BNE bra_E756
bra_E74D:
    LDA ram_frm_cnt
    AND #$08
; / 08
    LSR
    LSR
    LSR
    ADC #$01
bra_E756:
    CPX #con_item_sword
    BEQ bra_E773
    CPX #con_item_candle
    BEQ bra_E773
    CPX #con_item_arrow
    BEQ bra_E773
    CPX #con_item_potion
    BEQ bra_E773
    CPX #con_item_ring
    BEQ bra_E773
bra_E76A:
loc_E76A:
; bzk optimize, useless LDX + STX
    LDX #$00
    STX ram_000C_t13_useless
    LDX #$0F
    JMP loc_bat_790C
bra_E773:
    CLC
    ADC ram_0004_t21
    CPX #con_item_sword
    BNE bra_E76A
    CMP #$02
    BNE bra_E76A
    LDY #$20
    JMP loc_E76A



bra_E783:
    LDX #con_item_potion
    STX ram_item_slot_index
    BNE bra_E7A0    ; jmp



loc_E78A:
sub_E78A:
sub_0x01E79A:
    LDX ram_item_slot_index
    BEQ bra_E7B5_check_boomerangs
    LDA ram_items,X
    BEQ bra_E7EE
    CPX #con_item_letter
    BNE bra_E7A0
    LDY ram_item_potion
    BNE bra_E783
    LSR
    ORA #$01
bra_E7A0:
bra_E7A0_boomerang_found:
; bzk optimize, useless STA, will be overwritten at 0x01E748
    STA ram_0004_t24_useless
    LDA #$1F
    STA ram_0001_t15_spr_Y
    LDA #$7C
    STA ram_0000_t21_spr_X
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01782C
    JMP loc_E7D7
bra_E7B5_check_boomerangs:
    LDX #$1E
bra_E7B7_loop:  ; con_item_boomerang   con_item_magic_boomerang
    LDA ram_items,X
    BNE bra_E7A0_boomerang_found
    DEX
    CPX #$1C
    BNE bra_E7B7_loop
; if not found
    LDX #$00
    JMP loc_E7CB
bra_E7C6:
    LDA ram_items,X
    BNE bra_E7D7
bra_E7CB:
loc_E7CB:
    TXA
    TAY
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    LDA #$02
    JSR sub_0x0177D8
bra_E7D7:
loc_E7D7:
    LDX #con_item_sword
    LDA ram_items,X
    BEQ bra_E847_RTS
    LDA #$1F
    STA ram_0001_t15_spr_Y
    LDA #$94
    STA ram_0000_t21_spr_X
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x01782C
bra_E7EE:
    CPX #con_item_potion
    BNE bra_E7C6
    LDA ram_item_letter
    BEQ bra_E7CB
    LDX #con_item_letter
    STX ram_item_slot_index
    BNE bra_E7C6    ; jmp
sub_E7FE:
    LDA ram_0505
    BEQ bra_E859_RTS
    DEC ram_0506
    BEQ bra_E848
; when link picks up an item
    LDA #con_obj_state_freeze
    STA ram_state_link
loc_0x01E81C:
    LDA ram_pos_X_link
    STA ram_0083
    LDA ram_pos_Y_link
    SEC
    SBC #$10
    STA ram_0097
sub_0x01E827:
    LDX #$00
    JSR sub_FA93
; A = 00
    JSR sub_bat_7988_set_spr_A
; A = 00
    STA ram_000C_t06_table_offset
    LDA #$48
    STA ram_spr_index_1
    LDA #$4C
    STA ram_spr_index_2
    LDY #$21
    JSR sub_bat_792C
    INC ram_0504
    LDA ram_0505
    LDX #$13
    JSR sub_E70E
    DEC ram_0504
    LDA ram_0052
    BEQ bra_E847_RTS
    LDA #$08
    STA ram_spr_T + $4C
bra_E847_RTS:
    RTS
bra_E848:
    LDA #$00    ; con_obj_state_00
    STA ram_state_link
    STA ram_0505
    LDY ram_dungeon_level
    BEQ bra_E859_RTS    ; if overworld
; if dungeon
    LDA tbl_EBE0_gameplay_music,Y
    STA ram_music
bra_E859_RTS:
    RTS



sub_0x01E86A_get_enemy_id_from_current_map_location:
    LDY ram_map_location
    LDA ram_69FE_map_data,Y
    AND #$3F
    RTS



sub_0x01E872_bomb_blasts_breakable_wall:
; in
    ; A = position?
; triggers when bomb is exploding near breakable wall
    STA ram_0005_t07
    TXA
    PHA
    LDA ram_pos_X_enemy,X
    STA ram_0003_t07_pos_X
    LDA ram_pos_Y_enemy,X
    STA ram_0002_t18_pos_Y
    JSR sub_bat_7570
    LDX ram_0301_buffer_index
    LDA ram_0000_t6D
    STA ram_0302_ppu_buffer,X
    STA ram_0302_ppu_buffer + $05,X
    LDA ram_0001_t16
    STA ram_0302_ppu_buffer + $01,X
    STA ram_0302_ppu_buffer + $06,X
    INC ram_0302_ppu_buffer + $06,X
    LDA ram_0005_t07
    STA ram_0302_ppu_buffer + $03,X
    STA ram_0302_ppu_buffer + $04,X
    STA ram_0302_ppu_buffer + $08,X
    STA ram_0302_ppu_buffer + $09,X
    CMP #$46
    BCC bra_E8AC
    CMP #$F3
    BCS bra_E8AC
    CLC
    ADC #$02
    STA ram_0302_ppu_buffer + $08,X
    STA ram_0302_ppu_buffer + $09,X
    INC ram_0302_ppu_buffer + $04,X
    INC ram_0302_ppu_buffer + $09,X
bra_E8AC:
    LDA #$82
    STA ram_0302_ppu_buffer + $02,X
    STA ram_0302_ppu_buffer + $07,X
    LDA #$FF
    STA ram_0302_ppu_buffer + $0A,X
    TXA
    CLC
    ADC #$0A
    STA ram_0301_buffer_index
    PLA
    TAX
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x016BD4
    LDA ram_00F7_flag
    BEQ bra_E8D3
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
bra_E8D3:
    LDA #$00
    STA ram_00F7_flag
    RTS



sub_0x01E8E8:
loc_0x01E8E8:
; in
    ; ram_000A_t05_tile
        ; 24 = 
        ; F6 = 
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x016C17_set_block_address_pointer
    LDY #$00
bra_E8E2_loop:
    LDA ram_000A_t05_tile
    STA (ram_0000_t03_block_address),Y
    JSR sub_bat_7274_inc_0000_pointer_by_01
    LDA ram_0000_t03_block_address
    CMP #< (ram_6530 + $2C0)
    BNE bra_E8E2_loop
    LDA ram_0000_t03_block_address + $01
    CMP #> (ram_6530 + $2C0)
    BNE bra_E8E2_loop
    RTS


; bzk garbage
    .byte $FF, $FF   ; 



sub_E8F8_main_script_handler_1:
    LDA ram_00F4_flag
    BNE bra_E919
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x004D10_copy_code_data_to_battery
    LDA #con_prg_bank + $06
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01809C
    LDA #$5A
    STA ram_battery_check_1
    LDA #$A5
    STA ram_battery_check_2
    INC ram_00F4_flag    ; -> 01
    RTS
bra_E919:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    LDA ram_script
; see con_script
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_main_script_1_E94B_00_title_screen
    .word ofs_main_script_1_E96F_01_slot_selection
    .word ofs_main_script_1_E977_02
    .word ofs_main_script_1_E9D8_03
    .word ofs_main_script_1_0x01478B_04
    .word ofs_main_script_1_EA6B_05
    .word ofs_main_script_1_0x01708A_06
    .word ofs_main_script_1_E9A1_07
    .word ofs_main_script_1_0x014610_08_prepare_save_menu
    .word ofs_main_script_1_0x01511A_09
    .word ofs_main_script_1_0x01710C_0A
    .word ofs_main_script_1_0x015090_0B
    .word ofs_main_script_1_0x0150A7_0C
    .word ofs_main_script_1_0x01462A_0D
    .word ofs_main_script_1_E9C3_0E_register
    .word ofs_main_script_1_E9C3_0F_elimination
    .word ofs_main_script_1_0x014638_10
    .word ofs_main_script_1_0x014A3F_11_death
    .word ofs_main_script_1_0x016843_12_triforce_collected
    .word ofs_main_script_1_E9CB_13_final_credits



ofs_main_script_1_E94B_00_title_screen:
; con_script_title_screen
    LDA ram_00F5_reset_check_5A
    CMP #$5A
    BEQ bra_E959
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x008022_fill_ppu_with_tiles_1
bra_E959:
    LDA ram_00F6_reset_check_A5
    CMP #$A5
    BEQ bra_E967
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004D57_fill_ppu_with_tiles_2
bra_E967:
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x009010



ofs_main_script_1_E96F_01_slot_selection:
; con_script_slot_selection
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x00A29A



ofs_main_script_1_E977_02:
; con_script_02
    JSR sub_E625_disable_rendering_and_nmi
    LDA ram_subscript
    BNE bra_E999
    JSR sub_EA00_clear_room_history
; bzk optimize, code expects A = 00 here from EA00
    LDY #$7F
bra_E983_loop:
    STA ram_0560,Y
    DEY
    BPL bra_E983_loop
    LDA #con_prg_bank + $03
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x00C054_fill_ppu_with_tiles_3
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x004D10_copy_code_data_to_battery
bra_E999:
    LDA #con_prg_bank + $06
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x01804E



ofs_main_script_1_E9A1_07:
; con_script_screen_trans_in_prog
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0142B8
    LDA ram_screen_transition_flag
    BEQ bra_E9C2_RTS
; if transition is ON
    LDA ram_prev_screen_transition_flag
    BNE bra_E9C2_RTS
    INC ram_prev_screen_transition_flag
    LDA ram_dir_link
    CMP #$04
    BCC bra_E9BD
    LDA #con_mirroring_H
    BNE bra_E9BF    ; jmp
bra_E9BD:
    LDA #con_mirroring_V
bra_E9BF:
; bzk optimize, JMP
    JSR sub_FF98_set_mirroring
bra_E9C2_RTS:
    RTS



ofs_main_script_1_E9C3_0E_register:
; con_script_register
ofs_main_script_1_E9C3_0F_elimination:
; con_script_elimination
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x009E21



ofs_main_script_1_E9CB_13_final_credits:
; con_script_final_credits
    LDA #con_mirroring_H
    JSR sub_FF98_set_mirroring
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x00A910_final_credits_handler



ofs_main_script_1_E9D8_03:
; con_script_03
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_E625_disable_rendering_and_nmi
    LDA ram_subscript
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_002_E9F7_00_clear_screen_and_room_history
    .word ofs_002_EA11_01
    .word ofs_002_0x017010_02
    .word ofs_002_0x017019_03
    .word ofs_002_0x017020_04
    .word ofs_002_0x017026_05
    .word ofs_002_0x01702D_06
    .word ofs_002_0x01703A_07_draw_level_text
    .word ofs_002_0x017046_08



ofs_002_E9F7_00_clear_screen_and_room_history:
    LDA #$01
    STA ram_0017_rendering_flag
    INC ram_subscript
    JSR sub_E46D_clear_screen
sub_EA00_clear_room_history:
loc_0x01EA10_clear_room_history:
    LDY #$05
    LDA #$00
    STA ram_0529
bra_EA07_loop:
    STA ram_room_history,Y
    DEY
    BPL bra_EA07_loop
; bzk some code expects A = 00 from here
    RTS



tbl_EA0E_save_slot_index:
tbl_0x01EA1E_save_slot_index:
    .byte $00   ; 00 ram_6804_tunic_color
    .byte $04   ; 01 ram_6804_tunic_color + $04
    .byte $08   ; 02 ram_6804_tunic_color + $08



ofs_002_EA11_01:
    LDA ram_dungeon_level
    BNE bra_EA1C    ; if dungeon
; if overworld
    LDA ram_0526
    CMP #$FF
    BNE bra_EA1F
bra_EA1C:
    LDA ram_6BAD
bra_EA1F:
    STA ram_map_location
    CMP ram_0526
    BNE bra_EA2B
    LDA #$FF
    STA ram_0526
bra_EA2B:
sub_0x01EA3B_set_tunic_color:
loc_0x01EA3B_set_tunic_color:
    LDX ram_current_save_slot
    LDY tbl_EA0E_save_slot_index,X
    LDA ram_6804_tunic_color,Y
    STA ram_6B7E_palette_buffer + $14
    LDA #con_ppu_buf_overworld_palette
    STA ram_ppu_load_index
    INC ram_subscript
    RTS



sub_EA3D:
sub_0x01EA4D:
loc_0x01EA4D:
    JSR sub_E5F7_hide_all_sprites
    JSR sub_bat_71DE_draw_dot_on_minimap
    JSR sub_E679
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014939
    JMP loc_E78A



sub_0x01EA61:
    LDA #$00    ; con_obj_state_00
    STA ram_state_link
    STA ram_item_clock
    RTS



tbl_EA59:
    .byte con_ppu_buf_08   ; 00 
    .byte con_ppu_buf_36   ; 01 
    .byte con_ppu_buf_0A   ; 02 
    .byte con_ppu_buf_0A   ; 03 
    .byte con_ppu_buf_0A   ; 04 
    .byte con_ppu_buf_0A   ; 05 
    .byte con_ppu_buf_7C   ; 06 
    .byte con_ppu_buf_7C   ; 07 
    .byte con_ppu_buf_7C   ; 08 



tbl_EA62:
    .byte con_obj_id_3D   ; 00 
    .byte con_obj_id_3E   ; 01 
    .byte con_obj_id_38   ; 02 
    .byte con_obj_id_39   ; 03 
    .byte con_obj_id_32   ; 04 
    .byte con_obj_id_31   ; 05 
    .byte con_obj_id_43   ; 06 
    .byte con_obj_id_44   ; 07 
    .byte con_obj_id_45   ; 08 



ofs_main_script_1_EA6B_05:
; con_script_05_gameplay
    JSR sub_EA3D
    JSR sub_F23C
    LDA ram_dungeon_level
    BEQ bra_EA89    ; if overworld
; if dungeon
    LDY #$08
    LDA ram_obj_id_enemy
bra_EA7A_loop:
    CMP tbl_EA62,Y
    BNE bra_EA84
    LDX tbl_EA59,Y
    BNE bra_EAC9    ; jmp
bra_EA84:
    DEY
    BPL bra_EA7A_loop
    BMI bra_EABC    ; jmp
bra_EA89:
    LDA ram_map_location
    CMP #con_map_location + $0F
    BNE bra_EA98
    LDA ram_005A
    BNE bra_EA98
    LDA #con_sfx_2_secret_found
    STA ram_sfx_2
bra_EA98:
    LDX #con_ppu_buf_20
    LDA ram_obj_id_enemy + $0A
    CMP #con_obj_id_65
    BEQ bra_EAC9
    CMP #con_obj_id_66
    BEQ bra_EAAB
    CMP #con_obj_id_62
    BNE bra_EAB8
    LDX #con_ppu_buf_24
bra_EAAB:
    LDY ram_map_location
    LDA ram_68FE_map_data,Y
    AND #$01
    BNE bra_EAC9
    LDX #con_ppu_buf_22
    BNE bra_EAC9    ; jmp
bra_EAB8:
    LDX #con_ppu_buf_7A
    BNE bra_EAC9    ; jmp
bra_EABC:
    LDY #$03
bra_EABE_loop:
    LDA ram_6B7E_palette_buffer + $1F,Y
    STA ram_6817,Y
    DEY
    BPL bra_EABE_loop
    LDX #con_ppu_buf_06
bra_EAC9:
    STX ram_ppu_load_index
sub_0x01EADB:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01706E
sub_0x01EAE3:
    LDA ram_dungeon_level
    BEQ bra_EADD    ; if overworld
; if dungeon
    JSR sub_E6C6_set_map_bit5
    JSR sub_bat_7512
bra_EADD:
sub_0x01EAED:
loc_0x01EAED:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01784A
    LDY #$00
    LDX #$05
    LDA ram_map_location
bra_EAEB_loop:
    CMP ram_room_history,X
    BNE bra_EAF1_no_match
    INY
bra_EAF1_no_match:
    DEX
    BPL bra_EAEB_loop
    CPY #$00
    BNE bra_EB0D
    LDX ram_history_id
    STA ram_room_history,X
    INC ram_history_id
    LDA ram_history_id
    CMP #$06
    BCC bra_EB0D    ; if not overflow
    LDA #$00
    STA ram_history_id
bra_EB0D:
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_EB1F
    LDA ram_dungeon_level
    BEQ bra_EB22    ; if overworld
; if dungeon
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x015338
bra_EB1F:
    JMP loc_bat_6C90
bra_EB22:
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x006131


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF   ; 



sub_EB30_main_script_handler_2:
    LDA #con_prg_bank + $02
    JSR sub_FFAC_prg_bankswitch
    LDA ram_script
    JSR sub_E5E2_jump_to_pointers_after_JSR
; see con_script
    .word ofs_main_script_2_0x009030_00_title_screen
    .word ofs_main_script_2_0x00A5A1_01_slot_selection
    .word ofs_main_script_2_EB96_02
    .word ofs_main_script_2_EBAA_03
    .word ofs_main_script_2_EBC0_04_screen_transition___end
    .word ofs_main_script_2_EC1B_05_gameplay
    .word ofs_main_script_2_EBC0_06_screen_transition___start
    .word ofs_main_script_2_EB62_07_screen_transition___in_progress
    .word ofs_main_script_2_EB76_08_save_menu
    .word ofs_main_script_2_EC1B_09
    .word ofs_main_script_2_EC1B_0A
    .word ofs_main_script_2_EC1B_0B
    .word ofs_main_script_2_EC1B_0C
    .word ofs_main_script_2_0x00A6BD_0D
    .word ofs_main_script_2_0x009F00_0E_register
    .word ofs_main_script_2_0x009FD5_0F_elimination
    .word ofs_main_script_2_EB7E_10
    .word ofs_main_script_2_EB86_11_death
    .word ofs_main_script_2_EB8E_12_triforce_collected
    .word ofs_main_script_2_0x00AA20_13_final_credits



ofs_main_script_2_EB62_07_screen_transition___in_progress:
; con_script_screen_trans_in_prog
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01442E_screen_transition_handlers
    LDA ram_screen_transition_flag
    BNE bra_EB75_RTS
; if transition is OFF
    STA ram_prev_screen_transition_flag
    LDA #con_mirroring_H
; bzk optimize, JMP
    JSR sub_FF98_set_mirroring
bra_EB75_RTS:
    RTS



ofs_main_script_2_EB76_08_save_menu:
; con_script_save_menu
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x014B04_save_menu_handler



ofs_main_script_2_EB7E_10:
; con_script_10
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x014B9B



ofs_main_script_2_EB86_11_death:
; con_script_death
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x014C8D_death_subroutines



ofs_main_script_2_EB8E_12_triforce_collected:
; con_script_triforce_collected
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x016868



ofs_main_script_2_EB96_02:
; con_script_02
    JSR sub_E625_disable_rendering_and_nmi
    LDA #con_prg_bank + $06
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x018119
sub_EBA1_prepare_next_script:
loc_0x01EBB1_prepare_next_script:
    INC ram_script
sub_0x01EBB3_clear_subscript:
loc_0x01EBB3_clear_subscript:
    LDA #$00
    STA ram_0011_screen_ready_flag
    STA ram_subscript
    RTS



ofs_main_script_2_EBAA_03:
; con_script_03
    JSR sub_bat_7248_curtain_movement_handler
    LDA ram_007C
    BNE bra_EBF8_RTS
    LDA #con_mirroring_H
    JSR sub_FF98_set_mirroring
    LDA ram_005A
    BEQ bra_EBBD
    JMP loc_EBF2
bra_EBBD:
    JMP loc_EBEA



ofs_main_script_2_EBC0_04_screen_transition___end:
; con_script_04_screen_trans_end
ofs_main_script_2_EBC0_06_screen_transition___start:
; con_script_screen_trans_start
    LDA ram_005A
    BNE bra_EBF9
    LDA ram_0394_link
    BEQ bra_EBF2
    CMP #$08
    BEQ bra_EBF2
    CMP #$F8
    BEQ bra_EBF2
    LDA ram_dir_link
    STA ram_03F8_link
    STA ram_000F_t01_direction
    LDX #$00
    JSR sub_F08D
    JMP loc_EDC5



tbl_EBE0_gameplay_music:
    .byte con_music_overworld   ; 00 
    .byte con_music_dungeon     ; 01 
    .byte con_music_dungeon     ; 02 
    .byte con_music_dungeon     ; 03 
    .byte con_music_dungeon     ; 04 
    .byte con_music_dungeon     ; 05 
    .byte con_music_dungeon     ; 06 
    .byte con_music_dungeon     ; 07 
    .byte con_music_dungeon     ; 08 
    .byte con_music_final_dungeon   ; 09 



loc_EBEA:
bra_EBEA:
    LDY ram_dungeon_level
    LDA tbl_EBE0_gameplay_music,Y
    STA ram_music
bra_EBF2:
loc_EBF2:
    JSR sub_EBA1_prepare_next_script
; A = 00
    STA ram_0394_link
bra_EBF8_RTS:
    RTS



bra_EBF9:
    LDA ram_dungeon_level
    BNE bra_EBEA    ; if dungeon
; if overworld
    LDA ram_0065
    CMP #$24
    BNE bra_EBEA
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014BB8
; triggers when link walks out of a dingeon
    LDA ram_frm_cnt
    AND #$03
    BNE bra_EC1A_RTS
    DEC ram_pos_Y_link
    LDA ram_pos_Y_link
    CMP ram_0412
    BEQ bra_EBEA
bra_EC1A_RTS:
    RTS



ofs_main_script_2_EC1B_05_gameplay:
; con_script_05_gameplay
ofs_main_script_2_EC1B_09:
; con_script_09
ofs_main_script_2_EC1B_0A:
; con_script_0A
ofs_main_script_2_EC1B_0B:
; con_script_0B
ofs_main_script_2_EC1B_0C:
; con_script_0C
    LDA ram_timer_obj + $14
    BNE bra_EBF8_RTS
    LDA ram_051E_flag
    BEQ bra_EC2C
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x0131CE
bra_EC2C:
    LDA ram_pause_script
    BNE bra_EC58
    LDA ram_pause_flag
    CMP #$02
    BEQ bra_EC49
    LDA ram_btn_press
    AND #con_btn_Select
    BEQ bra_EC49
    LDA ram_pause_flag
    EOR #$01    ; toggle flag
    STA ram_pause_flag
    BNE bra_EC49
    LDA #$0F
    STA $4015
bra_EC49:
    LDA ram_pause_flag
    BEQ bra_EC58    ; if not paused
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x017569_disable_greyscale
    JMP loc_ED89
bra_EC58:
    JSR sub_bat_6E1D
    LDA ram_btn_hold
    AND #con_btns_Dpad
    STA ram_03F8_link
    LDA ram_pause_script
    BEQ bra_EC71
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x017569_disable_greyscale
    JMP loc_0x014010_pause_screen_handler
bra_EC71:
    LDA ram_btn_press
    AND #con_btn_Start
    BEQ bra_EC7A
    INC ram_pause_script
    RTS
bra_EC7A:
    LDA ram_item_clock
    BEQ bra_EC88
    LDA ram_invinc_link
    CLC
    ADC #$10
    STA ram_invinc_link
bra_EC88:
    JSR sub_EDA0
    LDA ram_0011_screen_ready_flag
    BNE bra_EC92
    JMP loc_ED7D
bra_EC92:
    LDA ram_0060
    BNE bra_EC9E
    LDA ram_pos_X_link
    STA ram_0061
    LDA ram_pos_Y_link
    STA ram_0062
bra_EC9E:
    LDX #$0D
    JSR sub_F769
    LDX #$0E
    JSR sub_F36F
    LDX #$0F
    JSR sub_F4A0
    LDX #$10
    JSR sub_F92A
    LDX #$11
    JSR sub_F92A
    LDX #$12
    JSR sub_F73E
    LDA ram_random_1
    BNE bra_ECDE
    LDA ram_indiv_random + $01
    AND #$07
    STA ram_random_1
    LDA ram_0060
    EOR #$01
    STA ram_0060
    BEQ bra_ECDE
    LDA ram_0061
    CMP ram_pos_X_link
    BNE bra_ECDE
    EOR #$FF
    STA ram_0061
    LDA ram_0062
    EOR #$FF
    STA ram_0062
bra_ECDE:
bra_ECDE_loop:
    LDX ram_obj_index
    JSR sub_FE98_decrease_invincibility_timer
    LDA ram_obj_id_enemy - $01,X
    BEQ bra_ED0E_next    ; if not exist
    LDA ram_obj_id_enemy - $01,X  ; bzk optimize, loading the same value twice
    JSR sub_FB74
    LDX ram_obj_index
    LDA ram_0405_enemy,X
    BNE bra_ED0E_next
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_01
    BNE bra_ED0E_next
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_04
    BNE bra_ED08
    JSR sub_bat_77D4
bra_ED08:
    LDX ram_obj_index
    JSR sub_bat_79D0
bra_ED0E_next:
    DEC ram_obj_index
    BNE bra_ECDE_loop
    LDA #$0B
    STA ram_obj_index
    LDA ram_item_hearts
    AND #$0F
    BNE bra_ED27
    LDA ram_sfx_4
    ORA #con_sfx_4_low_health
    STA ram_sfx_4
bra_ED27:
    LDA ram_dungeon_level
    BEQ bra_ED4F    ; if overworld
; if dungeon
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x010660
    JSR sub_E679
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014BCC
    JSR sub_0x014ABD
    JSR sub_0x016603
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x00618C
    JMP loc_ED6A
bra_ED4F:
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_ED62
    LDY ram_map_location
    LDA ram_687E_map_data,Y
    AND #$04
; * 08
    ASL
    ASL
    ASL ; con_sfx_3_ocean
    JSR sub_bat_6D80_set_sfx_3
bra_ED62:
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0106F0_try_spawning_zora_in_water
loc_ED6A:
    LDA ram_0301_buffer_index
    BNE bra_ED7D
    LDA ram_04E5
    BEQ bra_ED7D
; when you pick up map item
    LDA #$00
    STA ram_04E5
    LDA #con_ppu_buf_44_minimap
    STA ram_ppu_load_index
bra_ED7D:
loc_ED7D:
    JSR sub_E7FE
    JSR sub_E6EA
    JSR sub_bat_7328
    JSR sub_E78A
loc_ED89:
sub_0x01ED99:
loc_0x01ED99:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0171F6
    JMP loc_bat_6CC0_count_rupees_and_update_hud_info


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



sub_EDA0:
sub_0x01EDB0:
    LDX #$00
    JSR sub_FE98_decrease_invincibility_timer
    LDA ram_state_link
    AND #con_obj_state_freeze + con_obj_state_80
    CMP #con_obj_state_freeze
    BEQ bra_EDEA_RTS
    LDA ram_0512_flag
    BEQ bra_EDBA
    LDA ram_03F8_link
    AND #$F0
    STA ram_03F8_link
bra_EDBA:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0172AA
    JSR sub_EFD0
loc_EDC5:
loc_0x01EDD5:
    LDA ram_script
    CMP #con_script_0A
    BEQ bra_EDEA_RTS
    JSR sub_F23C
    LDA ram_dungeon_level
    BEQ bra_EDD5    ; if overworld
; if dungeon
    JSR sub_bat_6EFB
bra_EDD5:
    LDX #$00
sub_EDD7:
    LDA ram_0394_obj,X
    BNE bra_EDEA_RTS
    LDA ram_pos_X_obj,X
    AND #$F8
    STA ram_pos_X_obj,X
    LDA ram_pos_Y_obj,X
    AND #$F8
    ORA #$05
    STA ram_pos_Y_obj,X
bra_EDEA_RTS:
    RTS



tbl_EDEB_collision_tiles:
    .byte con_collision_tile + $8D   ; 00 
    .byte con_collision_tile + $91   ; 01 
    .byte con_collision_tile + $9C   ; 02 
    .byte con_collision_tile + $AC   ; 03 
    .byte con_collision_tile + $AD   ; 04 
    .byte con_collision_tile + $CC   ; 05 
    .byte con_collision_tile + $D2   ; 06 
    .byte con_collision_tile + $D5   ; 07 
    .byte con_collision_tile + $DF   ; 08 



sub_0x01EE04_find_current_collision_tile___direction_00:
    LDY #con_dir_00
    STY ram_000F_t01_direction
    BEQ bra_EE10    ; jmp



sub_EDFA_find_current_collision_tile:
sub_0x01EE0A_find_current_collision_tile:
; out
    ; A = collision tile
    LDY #$F8
    CPX #$00
    BEQ bra_EE02    ; if link
; if enemy
    LDY #$F0
bra_EE02:
    LDA ram_000F_t01_direction
    AND #con_dir__DR
    BEQ bra_EE10
    LDY #$08
    AND #con_dir_Down
    BNE bra_EE10    ; if down
; if right
    LDY #$10
bra_EE10:
sub_0x01EE20_find_current_collision_tile:
; in
    ; Y = 
    STY ram_0004_t22
    LDA ram_pos_Y_obj,X
    CLC
    ADC #$0B
    TAY
    PHA
    LDA ram_000F_t01_direction
    AND #con_dir__UD
    BEQ bra_EE31
    AND #con_dir_Down
    BEQ bra_EE27    ; if up
; if down
    CPY #$DD
    BCS bra_EE2C
bra_EE27:
    PLA
    CLC
    ADC ram_0004_t22
    PHA
bra_EE2C:
    LDY ram_pos_X_obj,X
    JMP loc_EE48
bra_EE31:
    LDY ram_pos_X_obj,X
    LDA ram_000F_t01_direction
    AND #con_dir_Right
    BEQ bra_EE3F
; if right
    CPY #$F0
    BCS bra_EE48
    BCC bra_EE43    ; jmp
bra_EE3F:
    CPY #$10
    BCC bra_EE48
bra_EE43:
    TYA
    CLC
    ADC ram_0004_t22
    TAY
bra_EE48:
loc_EE48:
    TYA
    AND #$F8
; / 04
    LSR
    LSR
    TAY
    LDA tbl_E400_block_addresses,Y
    STA ram_0000_t05_block_data
    LDA tbl_E400_block_addresses + $01,Y
    STA ram_0000_t05_block_data + $01
    PLA
    SEC
    SBC #$40
; / 08
    LSR
    LSR
    LSR
    TAY
    LDA (ram_0000_t05_block_data),Y
    STA ram_collision_tile_obj,X
    LDA ram_000F_t01_direction
    AND #con_dir__UD
    BEQ bra_EE7A
    TYA
    CLC
    ADC #$16
    TAY
    LDA (ram_0000_t05_block_data),Y
    CMP ram_collision_tile_obj,X
    BCC bra_EE7A
    STA ram_collision_tile_obj,X
bra_EE7A:
    LDA ram_collision_tile_obj,X
    LDY ram_dungeon_level
    BNE bra_EEB7_RTS    ; if dungeon
; if overworld
    LDA ram_collision_tile_obj,X
    LDY #$09
bra_EE86_loop:
    DEY
    BMI bra_EE90
    CMP tbl_EDEB_collision_tiles,Y
    BNE bra_EE86_loop
    LDA #con_collision_tile + $26
bra_EE90:
    STA ram_collision_tile_obj,X
    CPX #$00
    BNE bra_EEB4
; if link
    LDA ram_map_location
    CMP #con_map_location + $1F
    BNE bra_EEB4
    LDA #con_dir__UD
    AND ram_000F_t01_direction
    BEQ bra_EEB4
    LDA ram_pos_X_link
    CMP #$80
    BNE bra_EEB4
    LDA ram_pos_Y_link
    CMP #$56
    BCS bra_EEB4
    LDA #con_collision_tile + $26
    STA ram_collision_tile_link
bra_EEB4:
    LDA ram_collision_tile_obj,X
bra_EEB7_RTS:
    RTS



loc_EEB8:
sub_0x01EEC8:
loc_0x01EEC8:
    LDA ram_00C0_obj,X
    ASL
    BCC bra_EEE0
    LSR
    STA ram_00C0_obj,X
    LDY ram_dir_obj,X
    CPY #$03    ; check for either con_dir_Right or con_dir_Left
    BCC bra_EEDB
    AND #con_dir__LR
    BEQ bra_EEDA_RTS
bra_EECA:
    LDA ram_0394_obj,X
    BEQ bra_EEDA_RTS
    CPX #$00
    BNE bra_EEE4
    LDA ram_dir_link
    JSR sub_bat_7013_get_Y_from_direction
    STA ram_00C0_link
bra_EEDA_RTS:
    RTS
bra_EEDB:
    AND #$0C
    BNE bra_EECA
    RTS
bra_EEE0:
    LDA ram_00D3_obj,X
    BNE bra_EEEB
sub_EEE4:
sub_0x01EEF4:
loc_0x01EEF4:
bra_EEE4:
    LDA #$00
sub_0x01EEF6:
    STA ram_00C0_obj,X
    STA ram_00D3_obj,X
    RTS
bra_EEEB:
    LDA #$04
    STA ram_0003_t19_loop_counter
bra_EEEF_loop:
    LDA ram_0394_obj,X
    BNE bra_EF05
    JSR sub_EDD7
    LDA ram_00C0_obj,X
    AND #$0F
    STA ram_000F_t01_direction
    JSR sub_EDFA_find_current_collision_tile
    CMP ram_min_collision_tile
    BCS bra_EEE4
bra_EF05:
    LDA ram_00C0_obj,X
    AND #$0F
    JSR sub_bat_6FB6
    BEQ bra_EEE4
    LDA ram_obj_id_enemy
    CMP #con_obj_id_36
    BEQ bra_EF1D
    CMP #$4B
    BCC bra_EF24
    CMP #$53
    BCS bra_EF24
bra_EF1D:
    JSR sub_bat_6E46
    LDA ram_000F_t01_direction
    BEQ bra_EEE4
bra_EF24:
    LDY #$01
    LDA ram_00C0_obj,X
    AND #$05
    BNE bra_EF2E
    LDY #$FF
bra_EF2E:
    STY ram_0002_t43_pos
    DEC ram_00D3_obj,X
    LDA ram_0394_obj,X
    CLC
    ADC ram_0002_t43_pos
    STA ram_0394_obj,X
    AND #$0F
    BEQ bra_EF47
    CPX #$00
    BNE bra_EF4A
; if link
    AND #$07
    BNE bra_EF4A
bra_EF47:
    STA ram_0394_obj,X
bra_EF4A:
    LDA ram_00C0_obj,X
    AND #$03
    BEQ bra_EF5A
    LDA ram_pos_X_obj,X
    CLC
    ADC ram_0002_t43_pos
    STA ram_pos_X_obj,X
    JMP loc_EF61
bra_EF5A:
    LDA ram_pos_Y_obj,X
    CLC
    ADC ram_0002_t43_pos
    STA ram_pos_Y_obj,X
loc_EF61:
    DEC ram_0003_t19_loop_counter
    BNE bra_EEEF_loop
    RTS



tbl_EF66_flute_map_locations:
    .byte con_map_location + $42   ; 00 
    .byte con_map_location + $06   ; 01 
    .byte con_map_location + $29   ; 02 
    .byte con_map_location + $2B   ; 03 
    .byte con_map_location + $30   ; 04 
    .byte con_map_location + $3A   ; 05 
    .byte con_map_location + $3C   ; 06 
    .byte con_map_location + $58   ; 07 
    .byte con_map_location + $60   ; 08 
    .byte con_map_location + $6E   ; 09 
    .byte con_map_location + $72   ; 0A 



ofs_021_0x01EF81_05_flute:
    LDA #con_sfx_2_flute
    STA ram_sfx_2
    LDA #$98
    STA ram_timer_obj + $14
    LDA ram_dungeon_level
    BNE bra_EFC7    ; if dungeon
; if overworld
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_EFB8_RTS
    LDY ram_current_save_slot
    LDA ram_current_quest,Y
    PHA
    LDA ram_map_location
    LDY #$0A
bra_EF8E_loop:
    CMP tbl_EF66_flute_map_locations,Y
    BEQ bra_EF98_match_found
    DEY
    BPL bra_EF8E_loop
    BMI bra_EFB9_no_matches_found    ; jmp
bra_EF98_match_found:
; bzk better check for an actual 42 location rather than checking for table index
    CPY #$00
    BNE bra_EFA1
; if location 42
    PLA ; ram_current_quest
    BNE bra_EFBA    ; if 2nd quest
    BEQ bra_EFA4    ; jmp if 1st quest
bra_EFA1:
; if not location 42
    PLA ; ram_current_quest
    BEQ bra_EFBA    ; if 1st quest
; if 2nd quest
bra_EFA4:
    LDA ram_051A
    BNE bra_EFB8_RTS
    LDY #$09
bra_EFAB_loop:
    DEY
    BMI bra_EFB8_RTS
    LDA ram_obj_id_enemy,Y
    BNE bra_EFAB_loop
    LDA #con_obj_id_5E
    STA ram_obj_id_enemy,Y
bra_EFB8_RTS:
    RTS
bra_EFB9_no_matches_found:
    PLA
bra_EFBA:
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0060B8
    LDA #con_prg_bank + $05
    JMP loc_FFAC_prg_bankswitch
bra_EFC7:
    LDA ram_051B
    BNE bra_EFCF_RTS
    INC ram_051B
bra_EFCF_RTS:
    RTS



sub_EFD0:
sub_0x01EFE0:
    LDA ram_00C0_enemy,X
    BEQ bra_EFD7
    JMP loc_EEB8
bra_EFD7:
    CPX #$00
    BNE bra_EFE9
    LDA ram_0394_link
    BEQ bra_EFE9
    LDA ram_03F8_link
    BEQ bra_F001
    LDA ram_dir_link
    BNE bra_F003
bra_EFE9:
    CPX #$00
    BEQ bra_EFF4
    LDA ram_item_clock
    ORA ram_003D_enemy,X
    BNE bra_EFCF_RTS
bra_EFF4:
    LDA ram_03F8_obj,X
    BEQ bra_F001
    JSR sub_bat_7013_get_Y_from_direction
    LDA tbl_bat_6DC3_direction,Y
    BNE bra_F003    ; jmp
bra_F001:
    LDA #$00
bra_F003:
    AND #$0F
    STA ram_000F_t01_direction
    LDA #$00
    STA ram_000E_t09
    CPX #$00
    BNE bra_F01D
    LDA ram_state_obj,X
    AND #$F0
    CMP #$10
    BEQ bra_F01B
    CMP #$20
    BNE bra_F01D
bra_F01B:
    STX ram_000F_t01_direction
bra_F01D:
    CPX #$00
    BNE bra_F063
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x00614E
    LDA ram_obj_id_enemy
    CMP #con_obj_id_36
    BEQ bra_F038
    CMP #$4B
    BCC bra_F03B
    CMP #$53
    BCS bra_F03B
bra_F038:
    JSR sub_bat_6E46
bra_F03B:
    LDA ram_0053
    BNE bra_F066
    LDA ram_script
    CMP #con_script_09
    BEQ bra_F04D
    CMP #con_script_0B
    BEQ bra_F04D
    CMP #con_script_0C
    BNE bra_F05B
bra_F04D:
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014EE7
    LDA ram_script
    CMP #con_script_09
    BEQ bra_F066
bra_F05B:
    LDA ram_dungeon_level
    BEQ bra_F066    ; if overworld
; if dungeon
    LDA ram_0053
    BNE bra_F066
bra_F063:
    JSR sub_bat_6FB8
bra_F066:
    CPX #$00
    BNE bra_F07E
    LDA ram_dungeon_level
    BEQ bra_F07E    ; if overworld
; if dungeon
    LDA ram_script
    CMP #con_script_09
    BEQ bra_F07E
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x01518C
    LDX #$00
bra_F07E:
    JSR sub_F0E3
    CPX #$00
    BNE bra_F08D
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014F8B
bra_F08D:
sub_F08D:
sub_0x01F09D:
    LDA #$08
    LDY #$F8
    CPX #$00
    BEQ bra_F099_it_is_link
; if enemy
    LDA #$10
    LDY #$F0
bra_F099_it_is_link:
    STA ram_010E
    STY ram_010F
    LDA ram_000F_t01_direction
    BEQ bra_F0C0_RTS
    JSR sub_F0AC
    JSR sub_F0AC
    JSR sub_F0AC
sub_F0AC:
    LDA ram_000F_t01_direction
    LSR
    BCS bra_F0CB_right
    LSR
    BCS bra_F0D5_left
    LSR
    BCS bra_F0C1_down
; if up
    JSR sub_bat_6FE8
    LDA ram_pos_Y_obj,X
    SBC #$00
    STA ram_pos_Y_obj,X
bra_F0C0_RTS:
    RTS
bra_F0C1_down:
    JSR sub_bat_6FC1
    LDA ram_pos_Y_obj,X
    ADC #$00
    STA ram_pos_Y_obj,X
    RTS
bra_F0CB_right:
    JSR sub_bat_6FC1
    LDA ram_pos_X_obj,X
    ADC #$00
    STA ram_pos_X_obj,X
    RTS
bra_F0D5_left:
    JSR sub_bat_6FE8
    LDA ram_pos_X_obj,X
    SBC #$00
    STA ram_pos_X_obj,X
    RTS



tbl_F0DF:
    .byte $3D   ; 00 
    .byte $DD   ; 01 
    .byte $00   ; 02 
    .byte $F0   ; 03 



sub_F0E3:
    CPX #$00
    BNE bra_F0F2
    LDA ram_0053
    BEQ bra_F0EE
    JMP loc_F14E
bra_F0EE:
    LDA ram_000E_t09
    BMI bra_F148_RTS
bra_F0F2:
    LDA ram_0394_obj,X
    BNE bra_F148_RTS
; A = 00
    STA ram_000E_t10_script_handler
    LDA ram_000F_t01_direction
    BNE bra_F116
    CPX #$00
    BEQ bra_F148_RTS
; triggers when a flying sword hits a wall and explodes
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_10
    BNE bra_F110    ; bzk never branches
; bzk optimize, useless LDA + STA
    LDA ram_03F8_enemy,X
    STA ram_000F_t07_useless
    JMP loc_F129
bra_F110:
    JSR sub_F1D0
    JMP loc_F198
bra_F116:
bra_F116_loop:
    JSR sub_EDFA_find_current_collision_tile
    CMP ram_min_collision_tile
    BCC bra_F14E
    CPX #$00
    BEQ bra_F133
bra_F122:
; triggers when an enemy hits an obstacle while moving
    LDA ram_attr_enemy - $01,X
    AND #con_04C0_10
    BNE bra_F110    ; bzk never branches
loc_F129:
    JSR sub_F1A0
    STA ram_000F_t01_direction
    LDA ram_000E_t10_script_handler
    BNE bra_F116_loop
    RTS
bra_F133:
    LDA ram_dungeon_level
    BNE bra_F13F    ; if dungeon
; if overworld
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x006233
bra_F13F:
    JSR sub_F149_set_00_direction
    STA ram_btn_press
    LDA ram_dungeon_level
    BEQ bra_F14E    ; if overworld
; if dungeon
bra_F148_RTS:
    RTS



sub_F149_set_00_direction:
loc_0x01F159_set_00_direction:
    LDA #con_dir_00
    STA ram_000F_t01_direction
    RTS



bra_F14E:   ; bzk
loc_F14E:
    CPX #$00
    BNE bra_F198
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_F195
    LDA ram_0064
    BNE bra_F148_RTS
    LDA ram_0394_link
    BNE bra_F195
sub_0x01F171:
    LDX ram_pos_Y_link
    LDA ram_03F8_link
    BEQ bra_F195
    JSR sub_bat_7013_get_Y_from_direction
    LDA tbl_bat_6DC3_direction,Y
    AND #$0C
    BNE bra_F174
    LDX ram_pos_X_link
bra_F174:
    STX ram_0000_t43
    LDA ram_0000_t43
    CMP tbl_F0DF,Y
    BNE bra_F195
    LDA tbl_bat_6DC3_direction,Y
    STA ram_dir_link
sub_0x01F192:
loc_0x01F192:
    INC ram_script
    LDA #$00    ; con_obj_state_00
    STA ram_subscript
    STA ram_0011_screen_ready_flag
    STA ram_000F_t01_direction
    STA ram_state_link
    STA ram_00C0_link
    STA ram_00D3_link
    STA ram_invinc_link
bra_F195:
    LDX #$00
    RTS
bra_F198:
loc_F198:
    JSR sub_bat_6FB8
    BEQ bra_F122
    STA ram_dir_enemy,X
    RTS



sub_F1A0:
    LDA ram_000E_t10_script_handler
    INC ram_000E_t10_script_handler
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_028_F1AF_00
    .word ofs_028_F1C3_01
    .word ofs_028_F1D0_02
    .word ofs_028_F1DA_03



ofs_028_F1AF_00:
    LDY #$00
    LDA ram_indiv_random,X
    ASL
    BCS bra_F1B7
    INY
bra_F1B7:
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_F1BF
    INY
    INY
bra_F1BF:
    LDA tbl_bat_6DC3_direction,Y
    RTS



ofs_028_F1C3_01:
    LDA ram_000F_t01_direction
    PHA
    AND #$0A
    BEQ bra_F1CD
    PLA
    LSR
    RTS
bra_F1CD:
    PLA
    ASL
    RTS



sub_F1D0:
ofs_028_F1D0_02:
sub_0x01F1E0:
; something to do with shooting arrows enemies
    LDA ram_dir_enemy,X
    JSR sub_bat_7013_get_Y_from_direction
    STA ram_dir_enemy,X
; bzk optimize, useless STA
    STA ram_000F_t09_useless
    RTS



ofs_028_F1DA_03:
    LDA #$00
    STA ram_000E_t10_script_handler
    RTS



sub_0x01F1EF:
    LDA ram_0394_enemy,X
    BNE bra_F1FC_RTS
    STA ram_000E_t10_script_handler
bra_F1E6_loop:
    JSR sub_F1A0
    STA ram_000F_t01_direction
    BEQ bra_F1FC_RTS
    JSR sub_EDFA_find_current_collision_tile
    CMP ram_min_collision_tile
    BCS bra_F1E6_loop
    JSR sub_bat_6FB8
    BEQ bra_F1E6_loop
    STA ram_dir_enemy,X
bra_F1FC_RTS:
    RTS



tbl_F1FD_stepladder_pos_X:
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $F0   ; 02 
    .byte $10   ; 03 



tbl_F201_stepladder_pos_Y:
    .byte $FB   ; 00 
    .byte $13   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 



tbl_F205:
    .byte $02   ; 00 
    .byte $06   ; 01 
    .byte $08   ; 02 
    .byte $0A   ; 03 



tbl_F209:
    .byte $80   ; 00 
    .byte $54   ; 01 
    .byte $60   ; 02 
    .byte $60   ; 03 



tbl_F20D_map_locations_for_stepladder:
; for overworld
    .byte con_map_location + $17   ; 00 
    .byte con_map_location + $18   ; 01 
    .byte con_map_location + $19   ; 02 
    .byte con_map_location + $27   ; 03 
    .byte con_map_location + $4F   ; 04 
    .byte con_map_location + $5F   ; 05 



sub_0x01F223:
    JSR sub_F23C
    LDA #con_prg_bank + $04
    JMP loc_FFAC_prg_bankswitch



sub_0x01F22B:
    JSR sub_F231
loc_F21E_back_to_bank_01:
    LDA #con_prg_bank + $01
    JMP loc_FFAC_prg_bankswitch



sub_0x01F233:
    JSR sub_F23C
    JMP loc_F21E_back_to_bank_01



sub_0x01F239:
    JSR sub_F231
    LDA #con_prg_bank + $04
    JMP loc_FFAC_prg_bankswitch



sub_F231:
sub_0x01F241:
    LDA #$06
    STA ram_anim_timer_link
    BNE bra_F23C    ; jmp



sub_0x01F248:
loc_0x01F248:
    LDA ram_dungeon_level
    BNE bra_F1FC_RTS    ; if dungeon
; if overworld
bra_F23C:
sub_F23C:
sub_0x01F24C:
loc_0x01F24C:
    LDA ram_0522_flag
    BNE bra_F1FC_RTS
    TAX
    LDA ram_script
    CMP #con_script_screen_trans_start
    BEQ bra_F255
    CMP #con_script_05_gameplay
    BCC bra_F255
    LDA ram_0394_link
    BEQ bra_F265
    AND #$07
    BEQ bra_F258
bra_F255:
    JMP loc_F2E3
bra_F258:
    LDA #$00
    STA ram_0394_link
    LDY ram_script
    CPY #con_script_05_gameplay
    BNE bra_F255
    STA ram_005A
bra_F265:
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_F255
    LDA ram_dungeon_level
    BNE bra_F27D    ; if dungeon
; if overworld
    LDA ram_map_location
    LDY #$05
bra_F273_loop:
    CMP tbl_F20D_map_locations_for_stepladder,Y
    BEQ bra_F27D    ; if match
    DEY
    BPL bra_F273_loop
    BMI bra_F2E3    ; jmp if no matches
bra_F27D:
    LDA ram_0053
    BNE bra_F2E3
    LDA ram_item_stepladder
    BEQ bra_F2E3
    LDA ram_state_link
    AND #con_obj_state_freeze + con_obj_state_80
    CMP #con_obj_state_freeze
    BEQ bra_F2E3
    LDA ram_0064
    BNE bra_F2E3
    LDX #$00
    LDA ram_dir_link
    STA ram_000F_t01_direction
    JSR sub_EDFA_find_current_collision_tile
    LDY ram_dungeon_level
    BEQ bra_F2A5    ; if overworld
; if dungeon
    CMP #$F4
    BEQ bra_F2AD
    BNE bra_F2E3    ; jmp
bra_F2A5:
    CMP #$8D
    BCC bra_F2E3
    CMP #$99
    BCS bra_F2E3
; 8D-98
bra_F2AD:
; try to spawn stepladder in front of link
    JSR sub_FEBB_search_for_free_object
    BEQ bra_F2E3    ; if no free objects
    LDA ram_03F8_link
    BEQ bra_F2E3
    LDX ram_free_obj_index
    CMP ram_dir_link
    BNE bra_F2E3
    STX ram_0064
    STA ram_dir_enemy,X
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_pos_X_link
    CLC
    ADC tbl_F1FD_stepladder_pos_X,Y
    STA ram_pos_X_enemy,X
    LDA ram_pos_Y_link
    CLC
    ADC tbl_F201_stepladder_pos_Y,Y
    STA ram_pos_Y_enemy,X
    LDA #con_obj_id_5F
    STA ram_obj_id_enemy - $01,X
    JSR sub_EEE4
; A = 00
    STA ram_invinc_enemy,X
    LDA #$01
    STA ram_state_obj,X
bra_F2E3:
loc_F2E3:
    LDX #$00
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_F2FD
    LDA ram_collision_tile_link
    PHA
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x017404
    LDX #$00
    PLA
    STA ram_collision_tile_link
bra_F2FD:
    JSR sub_FA3C
    LDA ram_script
    CMP #con_script_09
    BEQ bra_F30A
    LDA ram_dungeon_level
    BNE bra_F30E    ; if dungeon
; if overworld
bra_F30A:
    INC ram_0001_t15_spr_Y
    INC ram_0001_t15_spr_Y
bra_F30E:
    LDA ram_state_link
    AND #con_obj_state_10 + con_obj_state_20
    CMP #con_obj_state_10
    BEQ bra_F31A
    CMP #con_obj_state_20
    BNE bra_F31F
bra_F31A:
    TYA
    CLC
    ADC #$04
    TAY
bra_F31F:
    TYA
    LDY #$00
    JSR sub_bat_77E7
    LDA ram_item_magic_shield
    BNE bra_F340
    LDA ram_dir_link
    CMP #con_dir_Down
    BNE bra_F36A_RTS
    LDX #$01
    LDA ram_spr_Y + $48,X
    CMP #$0B
    BCS bra_F36A_RTS
    PHA
    CLC
    ADC #$50
    JMP loc_F35A
bra_F340:
    LDX #$01
    LDA ram_dir_link
    LSR
    BCC bra_F349
    LDX #$05
bra_F349:
    LDY #$04
    LDA ram_spr_Y + $48,X
    PHA
bra_F34F_loop:
    DEY
    BMI bra_F35D
    CMP tbl_F205,Y
    BNE bra_F34F_loop
    LDA tbl_F209,Y
loc_F35A:
    STA ram_spr_Y + $48,X
bra_F35D:
    PLA
    CMP #$0A
    BNE bra_F36A_RTS
    LDA ram_spr_T + $48,X
    AND #$0F
    STA ram_spr_T + $48,X
bra_F36A_RTS:
    RTS



tbl_F36B_spr_flip:
    .byte $40   ; 00 
    .byte $C0   ; 01 
    .byte $80   ; 02 
    .byte $00   ; 03 



sub_F36F:
; X = 0E
    LDA ram_state_obj,X
    BEQ bra_F36A_RTS
    LSR
    BCC bra_F379
    JMP loc_F41D
bra_F379:
    LDA ram_0394_enemy,X
    BNE bra_F37E    ; bzk optimize, useless branch
bra_F37E:
    LDA ram_dir_enemy,X
    JSR sub_bat_7027
    LDA ram_000F_t01_direction
    BEQ bra_F3D4
    LDA ram_0394_enemy,X
    AND #$07
    BNE bra_F391
    STA ram_0394_enemy,X
bra_F391:
loc_0x01F3A1:
    JSR sub_FA93
    LDA ram_dir_enemy,X
    PHA
    AND #con_dir__LR
    BEQ bra_F3A2
    LDA ram_0001_t15_spr_Y
    CLC
    ADC #$03
    STA ram_0001_t15_spr_Y
bra_F3A2:
    PLA
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_frm_cnt
    AND #$03
    ORA tbl_F50D,Y
    JSR sub_bat_7988_set_spr_A
    LDA tbl_F509,Y
    STA ram_000C_t06_table_offset
    CPY #$02
    BNE bra_F3BB
    INC ram_000F_t04_flag
bra_F3BB:
    LDY #$22
    CPX #$0D
    BCS bra_F3CA
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_57
    BEQ bra_F3D1
    BNE bra_F3CF    ; jmp
bra_F3CA:
    LDA ram_state_obj,X
    ASL
    BCC bra_F3D1
bra_F3CF:
    LDY #$23
bra_F3D1:
    JMP loc_bat_7915
bra_F3D4:
sub_0x01F3E4:
    LDA ram_state_obj,X
    ASL
    BCC bra_F416
    LDA ram_item_book
    BEQ bra_F413
    LDA ram_state_link
    PHA
    LDA ram_candle_usage_flag
    PHA
    LDA #$00
    STA ram_candle_usage_flag
    JSR sub_bat_714F_candle
    PLA
    STA ram_candle_usage_flag
    PLA
    STA ram_state_link
    LDA ram_state_obj,X
    CMP #$21
    BNE bra_F411
    INC ram_state_obj,X
    LDY #$0E
    LDA ram_pos_X_obj,Y
    STA ram_pos_X_obj,X
    LDA ram_pos_Y_obj,Y
    STA ram_pos_Y_obj,X
    LDA ram_dir_obj,Y
    STA ram_dir_enemy,X
    LDA #$4F
    STA ram_timer_enemy,X
loc_F411:
bra_F411:
    LDX #$0E
bra_F413:
    JMP loc_F855_clear_enemy_state
bra_F416:
; flying sword projectile hit the wall
    INC ram_state_obj,X
    LDA #$FE
    STA ram_dir_enemy,X ; ???
    RTS



loc_F41D:
    LDA ram_dir_enemy,X
    STA ram_0002_t44
    STA ram_0002_t44 + $01
    LDA #$00
    STA ram_000F_t04_flag
    LDY #$03
bra_F429_loop:
    TYA
    PHA
    LDA ram_0002_t44
    PHA
    LDA ram_0002_t44 + $01
    PHA
    LDA ram_frm_cnt
    AND #$03
    ORA tbl_F36B_spr_flip,Y
    JSR sub_bat_7988_set_spr_A
    LDA ram_pos_X_enemy,X
    CLC
    ADC ram_0002_t44
    STA ram_0000_t21_spr_X
    CMP ram_pos_X_enemy,X
    BCC bra_F450
    CMP #$FC
    BCS bra_F475
    SEC
    SBC ram_pos_X_enemy,X
    JMP loc_F455
bra_F450:
    LDA ram_pos_X_enemy,X
    SEC
    SBC ram_0000_t21_spr_X
loc_F455:
    CMP #$20
    BCS bra_F475
    LDA ram_pos_Y_enemy,X
    CLC
    ADC ram_0002_t44 + $01
    STA ram_0001_t15_spr_Y
    LDY ram_dungeon_level
    BEQ bra_F46C    ; if overworld
; if dungeon
    CMP #$3E
    BCC bra_F475
    CMP #$E8
    BCS bra_F475
; 3E-E7
bra_F46C:
    LDA #$02
    STA ram_000C_t06_table_offset
    LDY #$23
    JSR sub_bat_7915
bra_F475:
    PLA
    STA ram_0002_t44 + $01
    PLA
    STA ram_0002_t44
    PLA
    PHA
    TAY
    CPY #$01
    BNE bra_F484
    LDY #$03
bra_F484:
; ram_0000_t21_spr_X
; ram_0002_t44
    LDA ram_0000_temp,Y
    EOR #$FF
    CLC
    ADC #$01
    STA ram_0000_temp,Y
    PLA
    TAY
    DEY
    BPL bra_F429_loop
    DEC ram_dir_enemy,X ; ???
    LDA ram_dir_enemy,X
    CMP #$E8
    BNE bra_F49F_RTS
    JMP loc_F411
bra_F49F_RTS:
    RTS



sub_F4A0:
; in
    ; X = 0F
; bzk optimize, X always 0F
    LDA ram_state_obj,X
    BEQ bra_F49F_RTS
    ASL
    BCC bra_F519
    LDA ram_timer_enemy,X
    BNE bra_F4B9
    INC ram_state_obj,X
    LDA ram_state_obj,X
    AND #$0F
    CMP #$03
    BEQ bra_F4E2
    LDA #$FF
    STA ram_timer_enemy,X
bra_F4B9:
    LDA ram_copy_obj_id
    CMP #$03
    BCC bra_F4D8    ; if con_obj_id_01 or con_obj_id_02
    CMP #$0B
    BCC bra_F4D0
    CMP #con_obj_id_12
    BEQ bra_F4D0
    CMP #con_obj_id_1B
    BEQ bra_F4D0
    CMP #con_obj_id_1C
    BNE bra_F4D8
bra_F4D0:
    LDA ram_pos_X_enemy,X
    STA ram_0061
    LDA ram_pos_Y_enemy,X
    STA ram_0062
bra_F4D8:
    JSR sub_FA93
    LDA #$02
    LDY #$06
    JMP loc_bat_790C
bra_F4E2:
    JMP loc_F855_clear_enemy_state



tbl_F4E5:
    .byte $00   ; 00 
    .byte $01   ; 01 
    .byte $02   ; 02 
    .byte $01   ; 03 
    .byte $00   ; 04 
    .byte $01   ; 05 
    .byte $02   ; 06 
    .byte $01   ; 07 
    .byte $03   ; 08 



tbl_F4EE:
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $00   ; 02 
    .byte $40   ; 03 
    .byte $40   ; 04 
    .byte $C0   ; 05 
    .byte $80   ; 06 
    .byte $80   ; 07 
    .byte $01   ; 08 



tbl_F4F7:
    .byte $00   ; 00 
    .byte $20   ; 01 
    .byte $36   ; 02 
    .byte $4C   ; 03 
    .byte $60   ; 04 
    .byte $68   ; 05 
    .byte $70   ; 06 
    .byte $78   ; 07 
    .byte $80   ; 08 



tbl_F500:
    .byte $80   ; 00 
    .byte $78   ; 01 
    .byte $70   ; 02 
    .byte $68   ; 03 
    .byte $60   ; 04 
    .byte $4C   ; 05 
    .byte $36   ; 06 
    .byte $20   ; 07 
    .byte $00   ; 08 



tbl_F509:
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $01   ; 02 
    .byte $01   ; 03 



tbl_F50D:
    .byte $00   ; 00 
    .byte $80   ; 01 
    .byte $00   ; 02 
    .byte $00   ; 03 



tbl_F511_pos_X:
    .byte $FC   ; 00 
    .byte $FC   ; 01 
    .byte $00   ; 02 
    .byte $00   ; 03 



tbl_F515_pos_Y:
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 



bra_F519:   ; bzk
loc_F519:
ofs_004_F519_5C:
; con_obj_id_5C
; X = 01+
sub_0x01F529:
    LDA ram_state_obj,X
    BEQ bra_F49F_RTS
    LDA #$00
    STA ram_0000_t6A
    LDA ram_state_obj,X
    AND #$F0
    CMP #$10
    BEQ bra_F52C
    JMP loc_F5B6
bra_F52C:
    LDA #$00
    STA ram_000E_t02
    LDA ram_dir_enemy,X
    AND #con_dir__LR
    BEQ bra_F53B
    JSR sub_bat_7027
    INC ram_000E_t02    ; -> 01/81
bra_F53B:
; bzk optimize, BIT + BMI
    LDA ram_000E_t02
    ASL
    BCS bra_F575
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_F549
    JSR sub_bat_7027
bra_F549:
; bzk optimize, BIT + BMI
    LDA ram_000E_t02
    ASL
    BCS bra_F575
    CPX #$0D
    BCS bra_F559
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5B
    BEQ bra_F57B
bra_F559:
    CPX #$12
    BEQ bra_F57B
    LDA ram_0394_enemy,X
    BPL bra_F567
    EOR #$FF
    CLC
    ADC #$01
bra_F567:
    CMP ram_0380_enemy,X
    BCC bra_F578
    LDA #$10
    STA ram_0380_enemy,X
    LDA #$20
    STA ram_state_obj,X
bra_F575:
    JMP loc_F5E1
bra_F578:
    JMP loc_F6B8
bra_F57B:
loc_0x01F58B:
    LDA #$00
    STA ram_000F_t04_flag
    LDA ram_dir_enemy,X
    CMP #con_dir_Left
    BNE bra_F587
    INC ram_000F_t04_flag   ; -> 01
bra_F587:
    JSR sub_bat_7013_get_Y_from_direction
    LDA tbl_F509,Y
    STA ram_000C_t06_table_offset
    LDA tbl_F50D,Y
loc_F592:
    STA ram_0004_t23
    CPX #$0D
    BCS bra_F5A6
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5B
    BNE bra_F5A6
    LDA ram_0004_t23
    CLC
    ADC #$02
    BNE bra_F5AD
bra_F5A6:
    CLC
    ADC ram_item_arrow
    SEC
    SBC #$01
bra_F5AD:
    STA ram_0004_t13_spr_A
; bzk optimize, useless LDA
    LDA ram_0004_t13_spr_A
    STA ram_0004_t13_spr_A + $01
    JMP loc_F714



loc_F5B6:
    CMP #$20
    BNE bra_F611
    LDA #$28
    STA ram_state_obj,X
    DEC ram_anim_timer_obj,X
    BNE bra_F5ED
    LDA #$40
    STA ram_state_obj,X
    CPX #$0D
    BCS bra_F5D2
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5B
    BEQ bra_F5D6
bra_F5D2:
    CPX #$12
    BNE bra_F5E1
bra_F5D6:
    JSR sub_F855_clear_enemy_state
    CPX #$0D
    BCS bra_F5E0_RTS
; bzk optimize, JMP
    JSR sub_0x010356
bra_F5E0_RTS:
    RTS
bra_F5E1:
loc_F5E1:
    LDA #$03
    STA ram_anim_timer_obj,X
    LDA ram_state_obj,X
    CLC
    ADC #$10
    STA ram_state_obj,X
bra_F5ED:
    CPX #$0D
    BCS bra_F5F8
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_5B
    BEQ bra_F5FF
bra_F5F8:
    CPX #$12
    BEQ bra_F5FF
    JMP loc_F6D3
bra_F5FF:
    LDA #$02
    STA ram_000C_t06_table_offset
    LDA #$00
    STA ram_000F_t04_flag
    LDA ram_dir_enemy,X
    JSR sub_bat_7013_get_Y_from_direction
    LDA #$00    ; !!! D 3 flag
    JMP loc_F592
bra_F611:
    CMP #$30
    BNE bra_F641
    LDA #$00
    STA ram_0394_enemy,X
    LDA #$40
    STA ram_03BC_obj,X
    LDA ram_dir_enemy,X
    STA ram_000F_t01_direction
    AND #con_dir_Left
    BEQ bra_F62D
    LDA ram_pos_X_enemy,X
    CMP #$02
    BCC bra_F635
bra_F62D:
    JSR sub_F08D
    DEC ram_0380_enemy,X
    BNE bra_F63E
bra_F635:
    LDA #$20
    STA ram_0380_enemy,X
    LDA #$40
    STA ram_state_obj,X
bra_F63E:
    JMP loc_F6B8
bra_F641:
    LDA #$00
    STA ram_0394_enemy,X
    CPX #$0D
    BCS bra_F64D
    LDA ram_042B_enemy,X
bra_F64D:
    JSR sub_bat_704A
    LDA ram_0000_t6A
    CMP #$02
    BNE bra_F691
    LDA #$00
    STA ram_0380_enemy,X
    CPX #$0D
    BCC bra_F672
    LDA ram_state_link
    ORA #con_obj_state_20
    STA ram_state_link
    LDA #$01
    STA ram_anim_timer_link
    LDY #$0F
    LDA #$00
    STA ram_state_obj,Y
    RTS
bra_F672:
    LDY #$30
    LDA ram_indiv_random,X
    CMP #$30
    BCC bra_F682
    LDY #$50
    CMP #$70
    BCC bra_F682    ; if not overflow
    LDY #$70
bra_F682:
    TYA
    LDY ram_042B_enemy,X
    STA ram_timer_enemy,Y
    LDA #$00
    STA ram_state_obj,Y
    JMP loc_0x010356
bra_F691:
    LDY #$04
    JSR sub_bat_706F
    LDA tbl_F4F7,Y
    JSR sub_bat_70AB
    LDA ram_000A_t06
    STA ram_000F_t01_direction
    STA ram_dir_enemy,X
    TYA
    PHA
    JSR sub_F08D
    PLA
    TAY
    LDA tbl_F500,Y
    JSR sub_bat_70AB
    LDA ram_000B_t03
    STA ram_000F_t01_direction
    STA ram_dir_enemy,X
    JSR sub_F08D
loc_F6B8:
    DEC ram_anim_timer_obj,X
    BNE bra_F6D3
    LDA #$02
    STA ram_anim_timer_obj,X
    INC ram_state_obj,X
    LDA ram_state_obj,X
    AND #$77
    STA ram_state_obj,X
    CPX #$0D
    BCC bra_F6E8
    LDY #con_sfx_3_arrow_shoot
    JSR sub_bat_6E10
bra_F6D3:
loc_F6D3:
    CPX #$0D
    BCS bra_F6E8
    JSR sub_bat_7AA7
    LDA ram_034B_flag
    BEQ bra_F6E8
    LDA #$03
    STA ram_anim_timer_obj,X
    LDA #$20
    STA ram_state_obj,X
bra_F6E8:
    LDA #$00
    STA ram_0000_t21_spr_X
    LDA ram_state_obj,X
    AND #$0F
    TAY
; bzk optimize, delete LDA 00, move STA 0001 to 0x01F6FA
    LDA #$00
    STA ram_0001_t15_spr_Y
    LDA tbl_F4E5,Y
    STA ram_000C_t06_table_offset
; bzk optimize, useless TYA
    TYA
    LDA tbl_F4EE,Y
    STA ram_0004_t14
    LDY #$00
    CMP #$08
    BEQ bra_F709
    LDY ram_item_magic_boomerang
bra_F709:
    TYA
    CLC
    ADC ram_0004_t14
    STA ram_0004_t13_spr_A
    LDY #$1D
    JMP loc_F720



loc_F714:
    LDA tbl_F511_pos_X,Y
    STA ram_0000_t21_spr_X
    LDA tbl_F515_pos_Y,Y
    STA ram_0001_t15_spr_Y
    LDY #$02
loc_F720:
; in
    ; ram_0000_t21_spr_X
    ; ram_0001_t15_spr_Y
    LDA ram_pos_X_enemy,X
    CLC
    ADC ram_0000_t21_spr_X
    STA ram_0000_t21_spr_X
    LDA ram_pos_Y_enemy,X
    CLC
    ADC ram_0001_t15_spr_Y
    STA ram_0001_t15_spr_Y
    LDA ram_state_obj,X
    AND #$F0
    CMP #$20
    BNE bra_F73B
    LDA #$01
    JSR sub_bat_7988_set_spr_A
bra_F73B:
    JMP loc_bat_7915



sub_F73E:
; X = 12
    LDA ram_state_obj,X
    AND #$F0
    CMP #$30
    BCS bra_F769
    JMP loc_F519



tbl_F749_pos_X:
    .byte $FF   ; 
    .byte $01   ; 
    .byte $00   ; 
    .byte $F8   ; 
    .byte $FF   ; 
    .byte $01   ; 
    .byte $F5   ; 
    .byte $0B   ; 
    .byte $FF   ; 
    .byte $01   ; 
    .byte $F9   ; 
    .byte $07   ; 
    .byte $FF   ; 
    .byte $01   ; 
    .byte $FD   ; 
    .byte $03   ; 



tbl_F759_pos_Y:
    .byte $F7   ; 
    .byte $F2   ; 
    .byte $F5   ; 
    .byte $F5   ; 
    .byte $F6   ; 
    .byte $0D   ; 
    .byte $03   ; 
    .byte $03   ; 
    .byte $F7   ; 
    .byte $09   ; 
    .byte $03   ; 
    .byte $03   ; 
    .byte $FF   ; 
    .byte $05   ; 
    .byte $03   ; 
    .byte $03   ; 



bra_F769:   ; bzk
sub_F769:
; X = 0D 12
    LDA ram_state_obj,X
    AND #$0F
    BEQ bra_F793_RTS
    DEC ram_anim_timer_obj,X
    BNE bra_F794
    LDA ram_state_obj,X
    AND #$0F
    TAY
    LDA #$08
    DEY
    BEQ bra_F780
    LDA #$01
bra_F780:
    STA ram_anim_timer_link
    STA ram_anim_timer_obj,X
    INC ram_state_obj,X
    LDA ram_state_obj,X
    AND #$0F
    CMP #$06
    BCC bra_F794
; bzk optimize, JMP
    JSR sub_F855_clear_enemy_state
bra_F793_RTS:
    RTS
bra_F794:
    LDA #$00
    STA ram_000F_t04_flag
    LDA ram_state_obj,X
    AND #$0F
    TAY
    LDA #$FC
    CPY #$05
    BEQ bra_F793_RTS
bra_F7A3_loop:
    CLC
    ADC #$04
    DEY
    BNE bra_F7A3_loop
    STA ram_0000_t4D
    LDA ram_dir_link
    STA ram_dir_enemy,X
    JSR sub_bat_7013_get_Y_from_direction
    TYA
    CLC
    ADC ram_0000_t4D
    TAY
    LDA ram_pos_X_link
    CLC
    ADC tbl_F749_pos_X,Y
    STA ram_pos_X_enemy,X
    STA ram_0000_t21_spr_X
    LDA ram_pos_Y_link
    CLC
    ADC tbl_F759_pos_Y,Y
    STA ram_pos_Y_enemy,X
    STA ram_0001_t15_spr_Y
    LDA ram_state_obj,X
    AND #$0F
    TAY
    LDA #$08
    DEY
    BEQ bra_F7D7
    LDA ram_dir_enemy,X
bra_F7D7:
    JSR sub_bat_7013_get_Y_from_direction
    LDA tbl_F509,Y
    STA ram_000C_t06_table_offset
    LDA tbl_F50D,Y
    CPX #$0D
    BEQ bra_F7EB
    ORA #$01
    JMP loc_F7F2
bra_F7EB:
    CLC
    ADC ram_item_sword
    SEC
    SBC #$01
loc_F7F2:
    JSR sub_bat_7988_set_spr_A
    CPY #$02
    BNE bra_F7FB
    INC ram_000F_t04_flag
bra_F7FB:
    LDA ram_state_obj,X
    AND #$0F
    CMP #$01
    BEQ bra_F854_RTS
    LDY #$00
    CPX #$0D
    BEQ bra_F80B
    LDY #$08
bra_F80B:
    JSR sub_bat_7915
    LDA ram_state_obj,X
    AND #$0F
    CMP #$03
    BNE bra_F854_RTS
    CPX #$12
    BNE bra_F85A
    LDX #$0E    ; flying sword
    LDA ram_state_obj,X
    BEQ bra_F823
    ASL
    BCS bra_F854_RTS
bra_F823:
    LDA #con_sfx_4_energy_wave
    STA ram_sfx_4
    LDA #$80
bra_F82A:
    STA ram_state_obj,X
    LDA #$10
    JSR sub_bat_711F
    LDA ram_dir_enemy,X
    AND #con_dir__LR
    BEQ bra_F841
    LDA ram_pos_X_enemy,X
    CMP #$14
    BCC bra_F855_clear_enemy_state
    CMP #$EC
    BCS bra_F855_clear_enemy_state
bra_F841:
    LDY #$C0
    LDA ram_state_obj,X
    ASL
    BCC bra_F84A
    LDY #$A0
bra_F84A:
    TYA
    STA ram_03BC_obj,X
    LDA ram_0394_link
    STA ram_0394_enemy,X
bra_F854_RTS:
    RTS



loc_F855_clear_enemy_state:
sub_F855_clear_enemy_state:
sub_0x01F865_clear_enemy_state:
bra_F855_clear_enemy_state:
    LDA #$00
    STA ram_state_obj,X
    RTS



bra_F85A:
    LDX #$0E
    LDA ram_state_obj,X
    BNE bra_F854_RTS
    LDA ram_0529
    BNE bra_F87D
    LDA ram_item_hearts
    PHA
    AND #$0F
    STA ram_0000_t48
    PLA
; / 10
    LSR
    LSR
    LSR
    LSR
    CMP ram_0000_t48
    BNE bra_F854_RTS
    LDA ram_item_hearts + $01
    CMP #$80
    BCC bra_F854_RTS
bra_F87D:
    LDA #con_sfx_1_01
    JSR sub_bat_6D7C_set_sfx_1
    LDA #$10    ; flying projectile
    BNE bra_F82A    ; jmp
loc_F886:
    LDA ram_state_obj,X
    CMP #$21
    BNE bra_F8B1
    LDA ram_0394_enemy,X
    PHA
    LDA #$00
    STA ram_0394_enemy,X
    LDA ram_dir_enemy,X
    STA ram_000F_t01_direction
    JSR sub_F08D
    PLA
    CLC
    ADC ram_0394_enemy,X
    STA ram_0394_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$10
    BNE bra_F8C5
    LDA #$3F
    STA ram_timer_obj,X
    INC ram_state_obj,X
bra_F8B1:
    LDA ram_timer_enemy,X
    BEQ bra_F855_clear_enemy_state
    LDA ram_dungeon_level
    BEQ bra_F8C5    ; if overworld
; if dungeon
    TXA
    PHA
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x0131CE
    PLA
    TAX
bra_F8C5:
    LDA #$04
    JSR sub_FA89
    JSR sub_FA72
    JSR sub_bat_7986
    LDA #$00
    STA ram_000C_t07_flag
    LDY #$40
    JSR sub_bat_77E6
    LDA ram_invinc_link
    BNE bra_F91D_RTS
    STX ram_0000_t2A
    LDX #$00
    LDY #$02
    JSR sub_F90D
    LDX ram_0000_t2A
    LDY #$00
    JSR sub_F90D
    LDY ram_0000_t2A
    LDX #$00
    LDA #$0E
    JSR sub_bat_7DFB
    BEQ bra_F91D_RTS
    LDX ram_0000_t2A
    LDY #$00
    STY ram_0000_t2A
    JSR sub_bat_7E26
    LDA #$00
    STA ram_000D_t01_damage_lo
    LDA #$80
    STA ram_000E_t03_damage_hi
    JMP loc_bat_7B4F



sub_F90D:
; in
    ; Y = 00/02
; out
    ; ram_0002_t34_pos_X
    ; ram_0004_t10_pos_X
    LDA ram_pos_X_obj,X
    CLC
    ADC #$08
; ram_0002_t34_pos_X
; ram_0004_t10_pos_X
    STA ram_0002_temp,Y
    LDA ram_pos_Y_obj,X
    CLC
    ADC #$08
; ram_0003_t21_pos_Y
; ram_0005_t08_pos_Y
    STA ram_0003_temp,Y
bra_F91D_RTS:
    RTS



tbl_F91E:
    .byte $30   ; 01 
    .byte $18   ; 02 
    .byte $0C   ; 03 
    .byte $06   ; 04 



tbl_F922_pos_X:
    .byte $78   ; 00 
    .byte $78   ; 01 
    .byte $20   ; 02 
    .byte $D0   ; 03 



tbl_F926_pos_Y:
    .byte $5D   ; 00 
    .byte $BD   ; 01 
    .byte $8D   ; 02 
    .byte $8D   ; 03 



sub_F92A:
; X = 10 11
    LDA ram_state_obj,X
    BEQ bra_F95F_RTS
    AND #$F0
    CMP #$10
    BEQ bra_F937
    JMP loc_F886
bra_F937:
    LDA ram_timer_enemy,X
    BNE bra_F9AE
    LDA ram_state_obj,X
    AND #$0F
    TAY
    LDA tbl_F91E - $01,Y
    STA ram_timer_enemy,X
    INC ram_state_obj,X
    LDA ram_state_obj,X
    AND #$0F
    PHA
    CMP #$03
    BNE bra_F955
    LDA #con_sfx_3_10
    JSR sub_bat_6D80_set_sfx_3
bra_F955:
    PLA
    CMP #$05
    BNE bra_F960
    JSR sub_F855_clear_enemy_state
    STA ram_timer_enemy,X
bra_F95F_RTS:
    RTS
bra_F960:
    CMP #$04
    BNE bra_F9AE
    LDA ram_dungeon_level
    BEQ bra_F9AE    ; if overworld
; if dungeon
    LDA ram_script
    CMP #con_script_09
    BEQ bra_F9AE
    LDY #$04
bra_F970_loop:
    DEY
    BMI bra_F9AE
    LDA tbl_F922_pos_X,Y
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$18
    BCS bra_F970_loop
    LDA tbl_F926_pos_Y,Y
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$18
    BCS bra_F970_loop
    LDA tbl_bat_6DC3_direction,Y
    STA ram_0002_t24_direction
    AND ram_00EE
    BNE bra_F9AE
    LDA ram_0054_timer
    BNE bra_F9AE
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x016406
    CMP #$04
    BNE bra_F9AE
    LDA #$06
    STA ram_0054_timer
    LDA ram_0002_t24_direction
    STA ram_0055_direction
bra_F9AE:
    JSR sub_FA93
    JSR sub_F9BF
    LDA ram_state_obj,X
    AND #$0F
    CMP #$02
    BEQ bra_F95F_RTS
    JMP loc_F9E5



sub_F9BF:
; in
    ; X = 10 11
    JSR sub_bat_71BB
sub_F9C2:
    LDA ram_state_obj,X
    AND #$0F
    SEC
    SBC #$02
sub_F9C9:
    STA ram_000C_t06_table_offset
    LDY #$00
    STY ram_000F_t04_flag
    INY ; 01
    STY ram_0004_t13_spr_A
    STY ram_0004_t13_spr_A + $01
    LDY #$01
    JMP loc_bat_7915



tbl_F9D9_pos_Y:
; reads these 3 bytes, and also 3 bytes at 0x01F9EF
    .byte $F3   ; 00 
    .byte $00   ; 01 
    .byte $0E   ; 02 
tbl_F9DC_pos_X:
; reads these 3 bytes, and also 3 bytes at 0x01F9F2
    .byte $F9   ; 00 
    .byte $0E   ; 01 
    .byte $07   ; 02 
; pos Y
    .byte $F3   ; 06 
    .byte $00   ; 07 
    .byte $0E   ; 08 
; pos X
    .byte $07   ; 06 
    .byte $F3   ; 07 
    .byte $F9   ; 08 



loc_F9E5:
    LDY #$02
bra_F9E7_loop:
    TYA
    PHA
    LDA ram_frm_cnt
    LSR
    BCC bra_F9F3
    TYA
    CLC
    ADC #$06
    TAY
bra_F9F3:
    LDA ram_pos_Y_enemy,X
    CLC
    ADC tbl_F9D9_pos_Y,Y
    STA ram_0001_t15_spr_Y
    LDA ram_pos_X_enemy,X
    CLC
    ADC tbl_F9DC_pos_X,Y
    STA ram_0000_t21_spr_X
    JSR sub_F9C2
    PLA
    TAY
    DEY
    BPL bra_F9E7_loop
    RTS



sub_FA0C:
    JSR sub_FA93
    LDA ram_0405_enemy,X
    CMP #$10
    BCS bra_FA27
    AND #$0F
    JSR sub_F9C9
loc_FA1B:
    LDA ram_timer_enemy,X
    BNE bra_FA26_RTS
bra_FA1F:
    LDA #$06
    STA ram_timer_enemy,X
    INC ram_0405_enemy,X
bra_FA26_RTS:
    RTS
bra_FA27:
    AND #$0F
    BEQ bra_FA1F
    AND #$01
    STA ram_000C_t06_table_offset
    LDA #$01
    JSR sub_bat_7988_set_spr_A
    LDY #$24
    JSR sub_bat_7915
    JMP loc_FA1B



sub_FA3C:
    LDA ram_state_link
    BNE bra_FA4F    ; if not con_obj_state_00
    LDA ram_script
    CMP #con_script_04_screen_trans_end
    BEQ bra_FA4F
    CMP #con_script_10
    BEQ bra_FA4F
    LDA ram_03F8_link
    BEQ bra_FA62
bra_FA4F:
sub_0x01FA5F:
    DEC ram_anim_timer_obj,X
    BNE bra_FA62
    CPX #$00
    BNE bra_FA5B
    JSR sub_FAAE
bra_FA5B:
    LDA #$06
    STA ram_0000_t22
    JSR sub_FAA0
bra_FA62:
    JSR sub_FA93
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_FA78
    LDY #$03
    AND #con_dir_Up
    BNE bra_FA72
    DEY
bra_FA72:
sub_FA72:
sub_0x01FA82:
    LDA ram_obj_anim_id,X
    STA ram_000F_t04_flag
    RTS
bra_FA78:
    LDY #$00
    LDA ram_obj_anim_id,X
    BEQ bra_FA80
    INY
bra_FA80:
    LDA ram_dir_enemy,X
    AND #con_dir_Right
    BNE bra_FA88_RTS
    INC ram_000F_t04_flag
bra_FA88_RTS:
    RTS



sub_FA89:
sub_0x01FA99:
; in
    ; A = 
    STA ram_0000_t22
    DEC ram_anim_timer_obj,X
    BNE bra_FA93
    JSR sub_FAA0
bra_FA93:
sub_FA93:
sub_0x01FAA3:
loc_0x01FAA3:
; out
    ; A = 00
        ; for 0x01E82C 0x010CA0 0x0109DE 0x00724D 0x010EAC 0x010E44
        ;     0x010D7C 0x01032D 0x00AA82 0x004C7C 0x004BB3 0x004749
    ; ram_000F_t04_flag
    LDA ram_pos_X_obj,X
    STA ram_0000_t21_spr_X
    LDA ram_pos_Y_obj,X
    STA ram_0001_t15_spr_Y
    LDA #$00
    STA ram_000F_t04_flag
    RTS



sub_FAA0:
; in
    ; ram_0000_t22
    LDA ram_0000_t22
    STA ram_anim_timer_obj,X
    LDA ram_obj_anim_id,X
    EOR #$01
    STA ram_obj_anim_id,X
    RTS



sub_FAAE:
    LDA ram_state_link
    AND #con_obj_state_10 + con_obj_state_20
    CMP #con_obj_state_10
    BNE bra_FABE
    LDA ram_state_link
    AND #con_obj_state_01 + con_obj_state_02 + con_obj_state_04 + con_obj_state_08
    BNE bra_FACD
    BEQ bra_FAC8    ; jmp
bra_FABE:
    CMP #$20
    BNE bra_FAD9
    LDA ram_state_link
    AND #con_obj_state_01 + con_obj_state_02 + con_obj_state_04 + con_obj_state_08
    BNE bra_FACD
bra_FAC8:
; triggers when link has just pressed a button to swing a sword/staff
    INC ram_state_link  ; con_obj_state_01
    JMP loc_FAD3
bra_FACD:
; triggers when link sword/staff swing animation has ended
    LDA ram_state_link
    ORA #con_obj_state_10 + con_obj_state_20
    STA ram_state_link
loc_FAD3:
    LDA #$01
    STA ram_link_anim_id
    RTS
bra_FAD9:
    CMP #$30
    BNE bra_FAE3_RTS
; triggers when link sword/staff swing animation has ended
    LDA ram_state_link
    AND #con_obj_state_freeze + con_obj_state_80
    STA ram_state_link
bra_FAE3_RTS:
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



tbl_FAF0:
    .byte con_04C0_00   ; 01 Lynel
    .byte con_04C0_00   ; 02 Lynel
    .byte con_04C0_00   ; 03 Moblin
    .byte con_04C0_00   ; 04 Moblin
    .byte con_04C0_00   ; 05 Goriya
    .byte con_04C0_00   ; 06 Goriya
    .byte con_04C0_01 + con_04C0_04   ; 07 Octorock
    .byte con_04C0_01 + con_04C0_04   ; 08 Octorock
    .byte con_04C0_01 + con_04C0_04   ; 09 Octorock
    .byte con_04C0_01 + con_04C0_04   ; 0A Octorock
    .byte con_04C0_01 + con_04C0_80   ; 0B Darknut
    .byte con_04C0_01 + con_04C0_80   ; 0C Darknut
    .byte con_04C0_01 + con_04C0_80   ; 0D TektiteOrBoulder
    .byte con_04C0_01 + con_04C0_80   ; 0E TektiteOrBoulder
    .byte con_04C0_01   ; 0F BlueLeever
    .byte con_04C0_01   ; 10 RedLeever
    .byte con_04C0_01 + con_04C0_80   ; 11 Zora
    .byte con_04C0_01   ; 12 Vire
    .byte con_04C0_01   ; 13 Zol
    .byte con_04C0_01 + con_04C0_02 + con_04C0_40   ; 14 Gel
    .byte con_04C0_01 + con_04C0_02 + con_04C0_40   ; 15 Gel
    .byte con_04C0_01 + con_04C0_80   ; 16 PolsVoice
    .byte con_04C0_01 + con_04C0_80   ; 17 LikeLike
    .byte con_04C0_01 + con_04C0_80   ; 18 Digdogger
    .byte con_04C0_01 + con_04C0_80   ; 19 unused?
    .byte con_04C0_01   ; 1A Peahat
    .byte con_04C0_01 + con_04C0_80   ; 1B Keese
    .byte con_04C0_01 + con_04C0_80   ; 1C Keese
    .byte con_04C0_01 + con_04C0_80   ; 1D Keese
    .byte con_04C0_01   ; 1E Armos
    .byte con_04C0_01 + con_04C0_80   ; 1F BoulderSet
    .byte con_04C0_01 + con_04C0_80   ; 20 TektiteOrBoulder
    .byte con_04C0_01 + con_04C0_80   ; 21 Ghini
    .byte con_04C0_01 + con_04C0_80   ; 22 FlyingGhini
    .byte con_04C0_01 + con_04C0_80   ; 23 BlueWizzrobe
    .byte con_04C0_01 + con_04C0_80   ; 24 RedWizzrobe
    .byte con_04C0_01 + con_04C0_02 + con_04C0_40 + con_04C0_80   ; 25 PatraChild
    .byte con_04C0_01 + con_04C0_02 + con_04C0_40 + con_04C0_80   ; 26 PatraChild
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 27 Wallmaster
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 28 Rope
    .byte con_04C0_01 + con_04C0_80   ; 29 unused?
    .byte con_04C0_01 + con_04C0_80   ; 2A Stalfos
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 2B Bubble
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 2C Bubble
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 2D Bubble
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 2E Whirlwind
    .byte con_04C0_01 + con_04C0_02 + con_04C0_80   ; 2F PondFairy
    .byte con_04C0_01 + con_04C0_80   ; 30 Gibdo
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 31 Dodongo
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 32 Dodongo
    .byte con_04C0_01 + con_04C0_08 + con_04C0_40 + con_04C0_80   ; 33 Gohma
    .byte con_04C0_01 + con_04C0_08 + con_04C0_40 + con_04C0_80   ; 34 Gohma
    .byte con_04C0_01 + con_04C0_80   ; 35 RupeeStash
    .byte con_04C0_01 + con_04C0_80   ; 36 Grumble
    .byte con_04C0_01 + con_04C0_80   ; 37 Zelda
    .byte con_04C0_01 + con_04C0_08 + con_04C0_20 + con_04C0_80   ; 38 Digdogger
    .byte con_04C0_01 + con_04C0_08 + con_04C0_20 + con_04C0_80   ; 39 Digdogger
    .byte con_04C0_01 + con_04C0_40   ; 3A Lamnola
    .byte con_04C0_01 + con_04C0_40   ; 3B Lamnola
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 3C Manhandla
    .byte con_04C0_01 + con_04C0_08 + con_04C0_80   ; 3D Aquamentus
    .byte con_04C0_01 + con_04C0_80   ; 3E Ganon
    .byte con_04C0_01 + con_04C0_80   ; 3F GuardFire
    .byte con_04C0_01 + con_04C0_80   ; 40 StandingFire
    .byte con_04C0_01 + con_04C0_40 + con_04C0_80   ; 41 Moldorm
    .byte con_04C0_01 + con_04C0_40 + con_04C0_80   ; 42 Gleeok
    .byte con_04C0_01 + con_04C0_40 + con_04C0_80   ; 43 Gleeok
    .byte con_04C0_01 + con_04C0_40 + con_04C0_80   ; 44 Gleeok
    .byte con_04C0_01 + con_04C0_40 + con_04C0_80   ; 45 Gleeok
    .byte con_04C0_01 + con_04C0_80   ; 46 GleeokHead
    .byte con_04C0_01 + con_04C0_80   ; 47 Patra
    .byte con_04C0_01 + con_04C0_80   ; 48 Patra
    .byte con_04C0_01 + con_04C0_20 + con_04C0_80   ; 49 Trap
    .byte con_04C0_01 + con_04C0_20 + con_04C0_80   ; 4A Trap
    .byte con_04C0_01 + con_04C0_80   ; 4B UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 4C UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 4D UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 4E UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 4F UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 50 UnderworldPerson
    .byte con_04C0_01 + con_04C0_80   ; 51 UnderworldPersonLifeOrMoney
    .byte con_04C0_01 + con_04C0_80   ; 52 UnderworldPerson
    .byte con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 53 MonsterShot
    .byte con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 54 MonsterShot
    .byte con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 55 Fireball
    .byte con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 56 Fireball
    .byte con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 57 MonsterShot
    .byte con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 58 MonsterShot
    .byte con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 59 MonsterShot
    .byte con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 5A MonsterShot
    .byte con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 5B MonsterArrow
    .byte con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80   ; 5C ArrowOrBoomerang
    .byte con_04C0_01 + con_04C0_80   ; 5D DeadDummy
    .byte con_04C0_01 + con_04C0_80   ; 5E FluteSecret



tbl_FB4E:
    .byte $06   ; 00 
    .byte $43   ; 02 
    .byte $25   ; 04 
    .byte $31   ; 06 
    .byte $12   ; 08 
    .byte $24   ; 0A 
    .byte $81   ; 0C 
    .byte $14   ; 0E 
    .byte $22   ; 10 
    .byte $42   ; 12 
    .byte $00   ; 14 
    .byte $A9   ; 16 
    .byte $8F   ; 18 
    .byte $20   ; 1A 
    .byte $00   ; 1C 
    .byte $3F   ; 1E 
    .byte $F9   ; 20 
    .byte $FA   ; 22 
    .byte $46   ; 24 
    .byte $62   ; 26 
    .byte $11   ; 28 
    .byte $2F   ; 2A 
    .byte $FF   ; 2C 
    .byte $FF   ; 2E 
    .byte $7F   ; 30 
    .byte $F6   ; 32 
    .byte $2F   ; 34 
    .byte $FF   ; 36 
    .byte $FF   ; 38 
    .byte $22   ; 3A 
    .byte $46   ; 3C 
    .byte $F1   ; 3E 
    .byte $F2   ; 40 
    .byte $AA   ; 42 
    .byte $AA   ; 44 
    .byte $FB   ; 46 
    .byte $BF   ; 48 
    .byte $F0   ; 4A 
; bzk bug, table keeps reading bytes below


sub_FB74:
    PHA
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    PLA
    LDY ram_0492_enemy,X
    STY ram_000F_t01_direction
    BEQ bra_FB9D
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_1E
    BEQ bra_FB95
    CMP #con_obj_id_22
    BEQ bra_FB95
    CMP #$53
    BCS bra_FB95
    LDA #$07
    STA ram_timer_enemy,X
bra_FB95:
    LDA #$00
    STA ram_0492_enemy,X
    JMP loc_FCDA
bra_FB9D:
    LDY ram_0405_enemy,X
    BEQ bra_FBA5
    JMP loc_FC88
bra_FBA5:
    CMP #$6A
    BCC bra_FBB1
; 6A+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x0046EB
bra_FBB1:   ; ram_obj_id_enemy - $01,X
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_004_FC94_00_RTS
    .word ofs_004_0x0107DC_01
    .word ofs_004_0x0107DC_02
    .word ofs_004_0x0107CF_03
    .word ofs_004_0x0107CF_04
    .word ofs_004_0x010129_05
    .word ofs_004_0x010129_06
    .word ofs_004_0x010C0F_07
    .word ofs_004_0x010C0F_08
    .word ofs_004_0x010C0F_09
    .word ofs_004_0x010C0F_0A
    .word ofs_004_0x011B5B_0B
    .word ofs_004_0x011B5B_0C
    .word ofs_004_0x010908_0D
    .word ofs_004_0x010908_0E
    .word ofs_004_0x010A75_0F
    .word ofs_004_0x010B19_10
    .word ofs_004_0x0107A8_11
    .word ofs_004_0x011D67_12
    .word ofs_004_0x0104DB_13
    .word ofs_004_0x010578_14
    .word ofs_004_0x010578_15
    .word ofs_004_0x011BB2_16
    .word ofs_004_0x011CD9_17
    .word ofs_004_0x011600_18
    .word ofs_004_FC94_19_RTS
    .word ofs_004_0x011038_1A
    .word ofs_004_0x010491_1B
    .word ofs_004_0x010491_1C
    .word ofs_004_0x010491_1D
    .word ofs_004_0x010D60_1E
    .word ofs_004_0x010896_1F
    .word ofs_004_0x010908_20
    .word ofs_004_0x010C7B_21
    .word ofs_004_0x010FFF_22
    .word ofs_004_0x011DF3_23
    .word ofs_004_0x011FB9_24
    .word ofs_004_0x012BEA_25
    .word ofs_004_0x012BEA_26
    .word ofs_004_0x0110F4_27
    .word ofs_004_0x0112E6_28
    .word ofs_004_FC94_29_RTS
    .word ofs_004_0x011387_2A
    .word ofs_004_0x01044E_2B
    .word ofs_004_0x01044E_2C
    .word ofs_004_0x01044E_2D
    .word ofs_004_FE40_2E
    .word ofs_004_0x010DA0_2F
    .word ofs_004_0x011B46_30
    .word ofs_004_0x0118B9_31
    .word ofs_004_0x0118B9_32
    .word ofs_004_0x012326_33
    .word ofs_004_0x012326_34
    .word ofs_004_FE50_35
    .word ofs_004_FE90_36
    .word ofs_004_0x012997_37
    .word ofs_004_0x011600_38
    .word ofs_004_0x011600_39
    .word ofs_004_0x0129FB_3A
    .word ofs_004_0x0129FB_3B
    .word ofs_004_0x012197_3C
    .word ofs_004_0x011796_3D
    .word ofs_004_0x012C8D_3E
    .word ofs_004_0x0129E8_3F
    .word ofs_004_0x01005F_40
    .word ofs_004_0x0114A8_41
    .word ofs_004_0x0124EE_42
    .word ofs_004_0x0124EE_43
    .word ofs_004_0x0124EE_44
    .word ofs_004_0x0124EE_45
    .word ofs_004_0x012487_46
    .word ofs_004_0x012B76_47
    .word ofs_004_0x012B76_48
    .word ofs_004_FE60_49
    .word ofs_004_FE60_4A
    .word ofs_004_FE80_4B
    .word ofs_004_FE80_4C
    .word ofs_004_FE80_4D
    .word ofs_004_FE80_4E
    .word ofs_004_FE80_4F
    .word ofs_004_FE80_50
    .word ofs_004_FE88_51
    .word ofs_004_FE80_52
    .word ofs_004_0x0102E7_53
    .word ofs_004_0x0102E7_54
    .word ofs_004_0x0103A9_55
    .word ofs_004_0x0103A9_56
    .word ofs_004_0x0102E7_57
    .word ofs_004_0x0102E7_58
    .word ofs_004_0x0102E7_59
    .word ofs_004_0x0102E7_5A
    .word ofs_004_0x01084F_5B
    .word ofs_004_F519_5C
    .word ofs_004_FEA6_5D
    .word ofs_004_FEF4_5E
    .word ofs_004_FC94_5F_RTS
    .word ofs_004_0x01310C_60
    .word ofs_004_0x010F86_61
    .word ofs_004_0x010E54_62
    .word ofs_004_0x010EFB_63_breakable_wall
    .word ofs_004_0x010F1E_64
    .word ofs_004_0x010E54_65
    .word ofs_004_0x010E54_66
    .word ofs_004_0x010EFB_67
    .word ofs_004_0x010207_68
    .word ofs_004_FC94_69_RTS



loc_FC88:
    JSR sub_FA0C
    LDA ram_0405_enemy,X
    AND #$0F
    CMP #$04
    BCS bra_FC95
ofs_004_FC94_00_RTS:
; con_obj_id_null
ofs_004_FC94_19_RTS:
; con_obj_id_19
ofs_004_FC94_29_RTS:
; con_obj_id_29
ofs_004_FC94_5F_RTS:
; con_obj_id_5F
ofs_004_FC94_69_RTS:
; con_obj_id_69
ofs_005_FC94_00_RTS:
; con_obj_id_null
ofs_005_FC94_18_RTS:
; con_obj_id_18
ofs_005_FC94_19_RTS:
; con_obj_id_19
ofs_005_FC94_29_RTS:
; con_obj_id_29
ofs_005_FC94_2E_RTS:
; con_obj_id_2E
ofs_005_FC94_3F_RTS:
; con_obj_id_3F
ofs_005_FC94_40_RTS:
; con_obj_id_40
    RTS
bra_FC95:
    LDA ram_0405_enemy,X
    AND #$10
    BEQ bra_FCD7_not_dead
    LDA ram_obj_id_enemy - $01,X
    STA ram_0412,X
    CMP #con_obj_id_5D
    BEQ bra_FCC7
    CMP #con_obj_id_14
    BEQ bra_FCC7
    CMP #con_obj_id_1C
    BEQ bra_FCC7
    LDA ram_052A
    CLC
    ADC #$01
    CMP #$0A
    BNE bra_FCBA
    LDA #$00
bra_FCBA:
    STA ram_052A
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_11
    BEQ bra_FCC7
    INC ram_room_kill_cnt
bra_FCC7:
    LDA #con_obj_id_60
    STA ram_obj_id_enemy - $01,X
    STA ram_0492_enemy,X
    LDA #con_04C0_01 + con_04C0_80
    STA ram_attr_enemy - $01,X
    JSR sub_0x01307A_drop_selection
bra_FCD7_not_dead:
    JMP loc_FEDA



loc_FCDA:
    LDX ram_obj_index
    LDA ram_dungeon_level
    BNE bra_FD3C    ; if dungeon
; if overworld
    LDA ram_04CD_map_data_byte
    AND #$08
    BEQ bra_FD3C
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_11
    BEQ bra_FD3C
    CMP #con_obj_id_40
    BEQ bra_FD3C
    CMP #con_obj_id_1E
    BEQ bra_FD3C
    CMP #con_obj_id_2E
    BEQ bra_FD3C
    CMP #$53
    BCS bra_FD3C
bra_FCFF_loop:
    LDA ram_random_2
    BEQ bra_FD07
    STA ram_0492_enemy,X
    RTS
bra_FD07:
    LDX ram_obj_index
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x015034
    LDA ram_0525
    PHA
; * 10
    ASL
    ASL
    ASL
    ASL
    STA ram_pos_X_enemy,X
    PLA
    AND #$F0
    SEC
    SBC #$03
    STA ram_pos_Y_enemy,X
    LDA ram_indiv_random + $01,X
    AND #$03
    CLC
    ADC #$02
    STA ram_random_2
    LDA #con_prg_bank + $05
    JSR sub_FFAC_prg_bankswitch
    JSR sub_0x014A23
    BCS bra_FCFF_loop
    LDA #$00
    STA ram_0405_enemy,X
bra_FD3C:
    LDA #con_prg_bank + $04
    JSR sub_FFAC_prg_bankswitch
    LDX ram_obj_index
    LDY ram_obj_id_enemy - $01,X
    CPY #con_obj_id_1E
    BEQ bra_FD56
    CPY #con_obj_id_22
    BEQ bra_FD56
    CPY #$53
    BCS bra_FD56
    TXA
    STA ram_timer_enemy,X
bra_FD56:
    LDA tbl_FAF0 - $01,Y
    STA ram_attr_enemy - $01,X
    TYA
    STA ram_0000_t2B_obj_id
    LSR
    TAY
    LDA tbl_FB4E,Y
    JSR sub_0x013010
    STA ram_hp_ememy - $01 - $01,X
    LDA ram_0000_t2B_obj_id
    CMP #$6A
    BCC bra_FD78
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x0045E0_old_man_handler
bra_FD78:
    CMP #$5F
    BCC bra_FD7F
    JMP loc_FECA
bra_FD7F:   ; ram_obj_id_enemy - $01,X
    JSR sub_E5E2_jump_to_pointers_after_JSR
    .word ofs_005_FC94_00_RTS
    .word ofs_005_0x010035_01
    .word ofs_005_0x010035_02
    .word ofs_005_0x010035_03
    .word ofs_005_0x010035_04
    .word ofs_005_0x010035_05
    .word ofs_005_0x010035_06
    .word ofs_005_0x010765_07
    .word ofs_005_0x010769_08
    .word ofs_005_0x010765_09
    .word ofs_005_0x010769_0A
    .word ofs_005_0x011B30_0B
    .word ofs_005_0x011B30_0C
    .word ofs_005_0x01074F_0D
    .word ofs_005_0x01074F_0E
    .word ofs_005_0x01075E_0F
    .word ofs_005_0x01075E_10
    .word ofs_005_FED6_11
    .word ofs_005_0x010035_12
    .word ofs_005_0x010035_13
    .word ofs_005_0x010035_14
    .word ofs_005_0x010571_15
    .word ofs_005_0x010035_16
    .word ofs_005_0x010035_17
    .word ofs_005_FC94_18_RTS
    .word ofs_005_FC94_19_RTS
    .word ofs_005_0x010785_1A
    .word ofs_005_0x01042D_1B
    .word ofs_005_0x010445_1C
    .word ofs_005_0x010445_1D
    .word ofs_005_0x010CD0_1E
    .word ofs_005_0x010747_1F
    .word ofs_005_0x01074C_20
    .word ofs_005_0x010765_21
    .word ofs_005_0x010CD0_22
    .word ofs_005_FED6_23
    .word ofs_005_FED6_24
    .word ofs_005_FED6_25
    .word ofs_005_FED6_26
    .word ofs_005_FED6_27
    .word ofs_005_0x0112D2_28
    .word ofs_005_FC94_29_RTS
    .word ofs_005_0x010035_2A
    .word ofs_005_0x010425_2B
    .word ofs_005_0x010425_2C
    .word ofs_005_0x010425_2D
    .word ofs_005_FC94_2E_RTS
    .word ofs_005_0x01079A_2F
    .word ofs_005_0x010035_30
    .word ofs_005_0x011497_31
    .word ofs_005_0x011497_32
    .word ofs_005_0x012171_33
    .word ofs_005_0x012171_34
    .word ofs_005_FE48_35
    .word ofs_005_FE78_36
    .word ofs_005_0x0128DA_37
    .word ofs_005_0x01146A_38
    .word ofs_005_0x011489_39
    .word ofs_005_0x0128F4_3A
    .word ofs_005_0x0128F4_3B
    .word ofs_005_0x01211C_3C
    .word ofs_005_0x011457_3D
    .word ofs_005_0x01297F_3E
    .word ofs_005_FC94_3F_RTS
    .word ofs_005_FC94_40_RTS
    .word ofs_005_0x0113F2_41
    .word ofs_005_0x01209D_42
    .word ofs_005_0x01209D_43
    .word ofs_005_0x01209D_44
    .word ofs_005_0x01209D_45
    .word ofs_005_0x012189_46
    .word ofs_005_0x01293E_47
    .word ofs_005_0x01293E_48
    .word ofs_005_FE58_49
    .word ofs_005_FE58_4A
    .word ofs_005_FE68_4B
    .word ofs_005_FE68_4C
    .word ofs_005_FE68_4D
    .word ofs_005_FE68_4E
    .word ofs_005_FE68_4F
    .word ofs_005_FE68_50
    .word ofs_005_FE70_51
    .word ofs_005_FE68_52
    .word ofs_005_0x010025_53
    .word ofs_005_0x010029_54
    .word ofs_005_0x010025_55
    .word ofs_005_0x010025_56
    .word ofs_005_0x010025_57
    .word ofs_005_0x010025_58
    .word ofs_005_0x010025_59
    .word ofs_005_0x010025_5A
    .word ofs_005_FEDA_5A
    .word ofs_005_FEDA_5B
    .word ofs_005_FEA6_5C
    .word ofs_005_FED1_5D



ofs_004_FE40_2E:
; con_obj_id_2E
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x006028



ofs_005_FE48_35:
; con_obj_id_35
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x0062F2



ofs_004_FE50_35:
; con_obj_id_35
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x0063FE



ofs_005_FE58_49:
; con_obj_id_49
ofs_005_FE58_4A:
; con_obj_id_4A
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x00632A



ofs_004_FE60_49:
; con_obj_id_49
ofs_004_FE60_4A:
; con_obj_id_4A
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x00635A



ofs_005_FE68_4B:
; con_obj_id_4B
ofs_005_FE68_4C:
; con_obj_id_4C
ofs_005_FE68_4D:
; con_obj_id_4D
ofs_005_FE68_4E:
; con_obj_id_4E
ofs_005_FE68_4F:
; con_obj_id_4F
ofs_005_FE68_50:
; con_obj_id_50
ofs_005_FE68_52:
; con_obj_id_52
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004A0C



ofs_005_FE70_51:
; con_obj_id_51
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004A50



ofs_005_FE78_36:
; con_obj_id_36
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004AC4



ofs_004_FE80_4B:
; con_obj_id_4B
ofs_004_FE80_4C:
; con_obj_id_4C
ofs_004_FE80_4D:
; con_obj_id_4D
ofs_004_FE80_4E:
; con_obj_id_4E
ofs_004_FE80_4F:
; con_obj_id_4F
ofs_004_FE80_50:
; con_obj_id_50
ofs_004_FE80_52:
; con_obj_id_52
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004AE9



ofs_004_FE88_51:
; con_obj_id_51
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004BB6



ofs_004_FE90_36:
; con_obj_id_36
; X = 01+
    LDA #con_prg_bank + $01
    JSR sub_FFAC_prg_bankswitch
    JMP loc_0x004C6A



sub_FE98_decrease_invincibility_timer:
sub_0x01FEA8_decrease_invincibility_timer:
    LDA ram_invinc_enemy,X
    BEQ bra_FEA5_RTS
    LDA ram_frm_cnt
    LSR
    BCS bra_FEA5_RTS
    DEC ram_invinc_enemy,X
bra_FEA5_RTS:
    RTS



ofs_004_FEA6_5D:
; con_obj_id_5D
ofs_005_FEA6_5C:
; con_obj_id_5C
; X = 01+
sub_0x01FEB6:
    LDA #con_sfx_2_enemy_killed
    STA ram_sfx_2
    LDA #$10
    STA ram_0405_enemy,X
    RTS



sub_0x01FEC1_destroy_object:
loc_0x01FEC1_destroy_object:
    LDA #con_obj_id_null
sub_0x01FEC3_create_object:
loc_0x01FEC3_create_object:
; bzk optimize, transfer all this to SRAM (or here isntead)
    STA ram_obj_id_enemy - $01,X
    LDA #$00
    JMP loc_bat_71A5_reset_obj_stats



sub_FEBB_search_for_free_object:
sub_0x01FECB_search_for_free_object:
    LDY #$0C
bra_FEBD_loop:
    DEY
; bzk optimize, branch to 0x01FED9
    BEQ bra_FEC7
    LDA ram_obj_id_enemy - $01,Y
    BNE bra_FEBD_loop
    STY ram_free_obj_index
bra_FEC7:
    CPY #$00
    RTS



loc_FECA:
; X = 01+
    LDA #con_04C0_01 + con_04C0_80
    STA ram_attr_enemy - $01,X
    BNE bra_FED6    ; jmp



ofs_005_FED1_5D:
; con_obj_id_5D
    LDA #$01
    STA ram_051A
bra_FED6:
ofs_005_FED6_11:
; con_obj_id_11
ofs_005_FED6_23:
; con_obj_id_23
ofs_005_FED6_24:
; con_obj_id_24
ofs_005_FED6_25:
; con_obj_id_25
ofs_005_FED6_26:
; con_obj_id_26
ofs_005_FED6_27:
; con_obj_id_27
sub_0x01FEE6:
loc_0x01FEE6:
    LDA #$00
    STA ram_timer_enemy,X
loc_FEDA:
ofs_005_FEDA_5A:
; con_obj_id_5A
ofs_005_FEDA_5B:
; con_obj_id_5B
sub_0x01FEEA:
loc_0x01FEEA:
    LDA #$00
    STA ram_0405_enemy,X
    RTS



tbl_FEE0_bg_palette:
; 4th color will be overwritten with a color from 0x01FEF8
    .dbyt $3F0C ; ppu address
    .byte $04   ; counter
    .byte $0F, $17, $37, $12   ; colors
    .byte $FF   ; close buffer



tbl_FEE8_bg_color:
    .byte $12   ; 00 
    .byte $11   ; 01 
    .byte $22   ; 02 
    .byte $21   ; 03 
    .byte $31   ; 04 
    .byte $32   ; 05 
    .byte $33   ; 06 
    .byte $35   ; 07 
    .byte $34   ; 08 
    .byte $36   ; 09 
    .byte $37   ; 0A 
    .byte $37   ; 0B 



ofs_004_FEF4_5E:
; con_obj_id_5E
; X = 01+
    LDY ram_051A
    CPY #$0C
    BCS bra_FF28_RTS
    LDA ram_frm_cnt
    AND #$07
    CMP #$04
    BNE bra_FF28_RTS
    INC ram_051A
    CPY #$0B
    BEQ bra_FF29
loc_FF0A:
    TYA
    PHA
    LDY #$07
bra_FF0E_loop:
    LDA tbl_FEE0_bg_palette,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_FF0E_loop
    PLA
    TAY
    LDA tbl_FEE8_bg_color,Y
    STA ram_0302_ppu_buffer + $06
    CPY #$0A
    BNE bra_FF28_RTS
    LDA #$99
    STA ram_min_collision_tile
bra_FF28_RTS:
    RTS
bra_FF29:
; triggers at 48698 frame 1st quest demo, when going into sand after playing flute opens stairs
    LDA #$60
    STA ram_pos_X_enemy,X
    LDA #$90
    STA ram_pos_Y_enemy,X
    JMP loc_0x010F42



loc_0x01FF44:
    LDA ram_frm_cnt
    AND #$04
    BEQ bra_FF28_RTS
    DEC ram_051A
    LDY ram_051A
    JMP loc_FF0A


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



vec_FF50_RESET:
loc_0x01FF60_RESET_vector:
    SEI
    CLD
    LDA #$00
    STA $2000
    LDX #$FF
    TXS
bra_FF5A_infinite_loop:
    LDA $2002
    AND #$80
    BEQ bra_FF5A_infinite_loop
bra_FF61_infinite_loop:
    LDA $2002
    AND #$80
    BEQ bra_FF61_infinite_loop
    ORA #$FF
    STA $8000
    STA $A000
    STA $C000
    STA $E000
    LDA #con_mirroring_H
    JSR sub_FF98_set_mirroring
    LDA #$00
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LSR
    STA $A000
    LDA #con_prg_bank + $07
    JSR sub_FFAC_prg_bankswitch
    JMP loc_E440



sub_FF98_set_mirroring:
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    LSR
    STA $8000
    RTS



sub_FFAC_prg_bankswitch:
loc_FFAC_prg_bankswitch:
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    LSR
    STA $E000
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 


; bzk garbage
    .byte "ZELDA"


; bzk garbage
vec_FFF0_IRQ:
    .byte $D7   ; 
    .byte $C8   ; 
    .byte $00   ; 
    .byte $00   ; 
    .byte $38   ; 
    .byte $04   ; 
    .byte $01   ; 
    .byte $04   ; 
    .byte $01   ; 
    .byte $BE   ; 



.out .sprintf("Free bytes in bank FF: 0x%04X [%d]", ($FFFA - *), ($FFFA - *))



.segment "VECTORS_FF"
    .word vec_E484_NMI
    .word vec_FF50_RESET
    .word vec_FFF0_IRQ



