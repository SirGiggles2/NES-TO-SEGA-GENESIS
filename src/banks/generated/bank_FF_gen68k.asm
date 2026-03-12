; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; Source: bank_FF.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_FF"  -- needs manual handling  ; orig: .segment "BANK_FF"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $C000  -- needs manual handling  ; orig: .org $C000  ; for listing file

; 0x01C010-0x02000F



    ; [DIRECTIVE] .EXPORT tbl_0x01E410_block_addresses  -- needs manual handling  ; orig: .export tbl_0x01E410_block_addresses
    ; [DIRECTIVE] .EXPORT loc_out_0x01E450  -- needs manual handling  ; orig: .export loc_out_0x01E450
    ; [DIRECTIVE] .EXPORT sub_0x01E47D_clear_screen  -- needs manual handling  ; orig: .export sub_0x01E47D_clear_screen
    ; [DIRECTIVE] .EXPORT vec_0x01E494_NMI  -- needs manual handling  ; orig: .export vec_0x01E494_NMI
    ; [DIRECTIVE] .EXPORT sub_0x01E5F2_jump_to_pointers_after_JSR  -- needs manual handling  ; orig: .export sub_0x01E5F2_jump_to_pointers_after_JSR
    ; [DIRECTIVE] .EXPORT sub_0x01E607_hide_all_sprites  -- needs manual handling  ; orig: .export sub_0x01E607_hide_all_sprites
    ; [DIRECTIVE] .EXPORT loc_0x01E607_hide_all_sprites  -- needs manual handling  ; orig: .export loc_0x01E607_hide_all_sprites
    ; [DIRECTIVE] .EXPORT sub_0x01E618_clear_memory  -- needs manual handling  ; orig: .export sub_0x01E618_clear_memory
    ; [DIRECTIVE] .EXPORT sub_0x01E635_disable_rendering_and_nmi  -- needs manual handling  ; orig: .export sub_0x01E635_disable_rendering_and_nmi
    ; [DIRECTIVE] .EXPORT loc_0x01E635_disable_rendering_and_nmi  -- needs manual handling  ; orig: .export loc_0x01E635_disable_rendering_and_nmi
    ; [DIRECTIVE] .EXPORT sub_0x01E689  -- needs manual handling  ; orig: .export sub_0x01E689
    ; [DIRECTIVE] .EXPORT sub_0x01E69F  -- needs manual handling  ; orig: .export sub_0x01E69F
    ; [DIRECTIVE] .EXPORT tbl_0x01E6CE_8_bits  -- needs manual handling  ; orig: .export tbl_0x01E6CE_8_bits
    ; [DIRECTIVE] .EXPORT sub_0x01E6D6_set_map_bit5  -- needs manual handling  ; orig: .export sub_0x01E6D6_set_map_bit5
    ; [DIRECTIVE] .EXPORT sub_0x01E6DE_get_byte_from_current_map_location  -- needs manual handling  ; orig: .export sub_0x01E6DE_get_byte_from_current_map_location
    ; [DIRECTIVE] .EXPORT sub_0x01E71E  -- needs manual handling  ; orig: .export sub_0x01E71E
    ; [DIRECTIVE] .EXPORT sub_0x01E745  -- needs manual handling  ; orig: .export sub_0x01E745
    ; [DIRECTIVE] .EXPORT loc_0x01E745  -- needs manual handling  ; orig: .export loc_0x01E745
    ; [DIRECTIVE] .EXPORT sub_0x01E79A  -- needs manual handling  ; orig: .export sub_0x01E79A
    ; [DIRECTIVE] .EXPORT loc_0x01E81C  -- needs manual handling  ; orig: .export loc_0x01E81C
    ; [DIRECTIVE] .EXPORT sub_0x01E827  -- needs manual handling  ; orig: .export sub_0x01E827
    ; [DIRECTIVE] .EXPORT sub_0x01E86A_get_enemy_id_from_current_map_location  -- needs manual handling  ; orig: .export sub_0x01E86A_get_enemy_id_from_current_map_location
    ; [DIRECTIVE] .EXPORT sub_0x01E872_bomb_blasts_breakable_wall  -- needs manual handling  ; orig: .export sub_0x01E872_bomb_blasts_breakable_wall
    ; [DIRECTIVE] .EXPORT sub_0x01E8E8  -- needs manual handling  ; orig: .export sub_0x01E8E8
    ; [DIRECTIVE] .EXPORT loc_0x01E8E8  -- needs manual handling  ; orig: .export loc_0x01E8E8
    ; [DIRECTIVE] .EXPORT loc_0x01EA10_clear_room_history  -- needs manual handling  ; orig: .export loc_0x01EA10_clear_room_history
    ; [DIRECTIVE] .EXPORT tbl_0x01EA1E_save_slot_index  -- needs manual handling  ; orig: .export tbl_0x01EA1E_save_slot_index
    ; [DIRECTIVE] .EXPORT sub_0x01EA3B_set_tunic_color  -- needs manual handling  ; orig: .export sub_0x01EA3B_set_tunic_color
    ; [DIRECTIVE] .EXPORT loc_0x01EA3B_set_tunic_color  -- needs manual handling  ; orig: .export loc_0x01EA3B_set_tunic_color
    ; [DIRECTIVE] .EXPORT sub_0x01EA4D  -- needs manual handling  ; orig: .export sub_0x01EA4D
    ; [DIRECTIVE] .EXPORT loc_0x01EA4D  -- needs manual handling  ; orig: .export loc_0x01EA4D
    ; [DIRECTIVE] .EXPORT sub_0x01EA61  -- needs manual handling  ; orig: .export sub_0x01EA61
    ; [DIRECTIVE] .EXPORT sub_0x01EADB  -- needs manual handling  ; orig: .export sub_0x01EADB
    ; [DIRECTIVE] .EXPORT sub_0x01EAE3  -- needs manual handling  ; orig: .export sub_0x01EAE3
    ; [DIRECTIVE] .EXPORT sub_0x01EAED  -- needs manual handling  ; orig: .export sub_0x01EAED
    ; [DIRECTIVE] .EXPORT loc_0x01EAED  -- needs manual handling  ; orig: .export loc_0x01EAED
    ; [DIRECTIVE] .EXPORT loc_0x01EBB1_prepare_next_script  -- needs manual handling  ; orig: .export loc_0x01EBB1_prepare_next_script
    ; [DIRECTIVE] .EXPORT sub_0x01EBB3_clear_subscript  -- needs manual handling  ; orig: .export sub_0x01EBB3_clear_subscript
    ; [DIRECTIVE] .EXPORT loc_0x01EBB3_clear_subscript  -- needs manual handling  ; orig: .export loc_0x01EBB3_clear_subscript
    ; [DIRECTIVE] .EXPORT sub_0x01ED99  -- needs manual handling  ; orig: .export sub_0x01ED99
    ; [DIRECTIVE] .EXPORT loc_0x01ED99  -- needs manual handling  ; orig: .export loc_0x01ED99
    ; [DIRECTIVE] .EXPORT sub_0x01EDB0  -- needs manual handling  ; orig: .export sub_0x01EDB0
    ; [DIRECTIVE] .EXPORT loc_0x01EDD5  -- needs manual handling  ; orig: .export loc_0x01EDD5
    ; [DIRECTIVE] .EXPORT sub_0x01EE04_find_current_collision_tile___direction_00  -- needs manual handling  ; orig: .export sub_0x01EE04_find_current_collision_tile___direction
    ; [DIRECTIVE] .EXPORT sub_0x01EE0A_find_current_collision_tile  -- needs manual handling  ; orig: .export sub_0x01EE0A_find_current_collision_tile
    ; [DIRECTIVE] .EXPORT sub_0x01EE20_find_current_collision_tile  -- needs manual handling  ; orig: .export sub_0x01EE20_find_current_collision_tile
    ; [DIRECTIVE] .EXPORT sub_0x01EEC8  -- needs manual handling  ; orig: .export sub_0x01EEC8
    ; [DIRECTIVE] .EXPORT loc_0x01EEC8  -- needs manual handling  ; orig: .export loc_0x01EEC8
    ; [DIRECTIVE] .EXPORT sub_0x01EEF4  -- needs manual handling  ; orig: .export sub_0x01EEF4
    ; [DIRECTIVE] .EXPORT loc_0x01EEF4  -- needs manual handling  ; orig: .export loc_0x01EEF4
    ; [DIRECTIVE] .EXPORT sub_0x01EEF6  -- needs manual handling  ; orig: .export sub_0x01EEF6
    ; [DIRECTIVE] .EXPORT ofs_021_0x01EF81_05_flute  -- needs manual handling  ; orig: .export ofs_021_0x01EF81_05_flute
    ; [DIRECTIVE] .EXPORT sub_0x01EFE0  -- needs manual handling  ; orig: .export sub_0x01EFE0
    ; [DIRECTIVE] .EXPORT sub_0x01F09D  -- needs manual handling  ; orig: .export sub_0x01F09D
    ; [DIRECTIVE] .EXPORT loc_0x01F159_set_00_direction  -- needs manual handling  ; orig: .export loc_0x01F159_set_00_direction
    ; [DIRECTIVE] .EXPORT sub_0x01F171  -- needs manual handling  ; orig: .export sub_0x01F171
    ; [DIRECTIVE] .EXPORT sub_0x01F192  -- needs manual handling  ; orig: .export sub_0x01F192
    ; [DIRECTIVE] .EXPORT loc_0x01F192  -- needs manual handling  ; orig: .export loc_0x01F192
    ; [DIRECTIVE] .EXPORT sub_0x01F1E0  -- needs manual handling  ; orig: .export sub_0x01F1E0
    ; [DIRECTIVE] .EXPORT sub_0x01F1EF  -- needs manual handling  ; orig: .export sub_0x01F1EF
    ; [DIRECTIVE] .EXPORT sub_0x01F223  -- needs manual handling  ; orig: .export sub_0x01F223
    ; [DIRECTIVE] .EXPORT sub_0x01F22B  -- needs manual handling  ; orig: .export sub_0x01F22B
    ; [DIRECTIVE] .EXPORT sub_0x01F233  -- needs manual handling  ; orig: .export sub_0x01F233
    ; [DIRECTIVE] .EXPORT sub_0x01F239  -- needs manual handling  ; orig: .export sub_0x01F239
    ; [DIRECTIVE] .EXPORT sub_0x01F241  -- needs manual handling  ; orig: .export sub_0x01F241
    ; [DIRECTIVE] .EXPORT sub_0x01F248  -- needs manual handling  ; orig: .export sub_0x01F248
    ; [DIRECTIVE] .EXPORT loc_0x01F248  -- needs manual handling  ; orig: .export loc_0x01F248
    ; [DIRECTIVE] .EXPORT sub_0x01F24C  -- needs manual handling  ; orig: .export sub_0x01F24C
    ; [DIRECTIVE] .EXPORT loc_0x01F24C  -- needs manual handling  ; orig: .export loc_0x01F24C
    ; [DIRECTIVE] .EXPORT loc_0x01F3A1  -- needs manual handling  ; orig: .export loc_0x01F3A1
    ; [DIRECTIVE] .EXPORT sub_0x01F3E4  -- needs manual handling  ; orig: .export sub_0x01F3E4
    ; [DIRECTIVE] .EXPORT sub_0x01F529  -- needs manual handling  ; orig: .export sub_0x01F529
    ; [DIRECTIVE] .EXPORT loc_0x01F58B  -- needs manual handling  ; orig: .export loc_0x01F58B
    ; [DIRECTIVE] .EXPORT sub_0x01F865_clear_enemy_state  -- needs manual handling  ; orig: .export sub_0x01F865_clear_enemy_state
    ; [DIRECTIVE] .EXPORT sub_0x01FA5F  -- needs manual handling  ; orig: .export sub_0x01FA5F
    ; [DIRECTIVE] .EXPORT sub_0x01FA82  -- needs manual handling  ; orig: .export sub_0x01FA82
    ; [DIRECTIVE] .EXPORT sub_0x01FA99  -- needs manual handling  ; orig: .export sub_0x01FA99
    ; [DIRECTIVE] .EXPORT sub_0x01FAA3  -- needs manual handling  ; orig: .export sub_0x01FAA3
    ; [DIRECTIVE] .EXPORT loc_0x01FAA3  -- needs manual handling  ; orig: .export loc_0x01FAA3
    ; [DIRECTIVE] .EXPORT sub_0x01FEA8_decrease_invincibility_timer  -- needs manual handling  ; orig: .export sub_0x01FEA8_decrease_invincibility_timer
    ; [DIRECTIVE] .EXPORT sub_0x01FEB6  -- needs manual handling  ; orig: .export sub_0x01FEB6
    ; [DIRECTIVE] .EXPORT sub_0x01FEC1_destroy_object  -- needs manual handling  ; orig: .export sub_0x01FEC1_destroy_object
    ; [DIRECTIVE] .EXPORT loc_0x01FEC1_destroy_object  -- needs manual handling  ; orig: .export loc_0x01FEC1_destroy_object
    ; [DIRECTIVE] .EXPORT sub_0x01FEC3_create_object  -- needs manual handling  ; orig: .export sub_0x01FEC3_create_object
    ; [DIRECTIVE] .EXPORT loc_0x01FEC3_create_object  -- needs manual handling  ; orig: .export loc_0x01FEC3_create_object
    ; [DIRECTIVE] .EXPORT sub_0x01FECB_search_for_free_object  -- needs manual handling  ; orig: .export sub_0x01FECB_search_for_free_object
    ; [DIRECTIVE] .EXPORT sub_0x01FEE6  -- needs manual handling  ; orig: .export sub_0x01FEE6
    ; [DIRECTIVE] .EXPORT loc_0x01FEE6  -- needs manual handling  ; orig: .export loc_0x01FEE6
    ; [DIRECTIVE] .EXPORT sub_0x01FEEA  -- needs manual handling  ; orig: .export sub_0x01FEEA
    ; [DIRECTIVE] .EXPORT loc_0x01FEEA  -- needs manual handling  ; orig: .export loc_0x01FEEA
    ; [DIRECTIVE] .EXPORT loc_0x01FF44  -- needs manual handling  ; orig: .export loc_0x01FF44
    ; [DIRECTIVE] .EXPORT loc_0x01FF60_RESET_vector  -- needs manual handling  ; orig: .export loc_0x01FF60_RESET_vector



    ; !! UNKNOWN: .INCBIN "DPCM.bin"  ; orig: .incbin "DPCM.bin"



tbl_E400_block_addresses:  ; orig: tbl_E400_block_addresses:
tbl_0x01E410_block_addresses:  ; orig: tbl_0x01E410_block_addresses:

; bzk the very 1st byte is dpcm
    ; [DIRECTIVE] .WORD ram_6530  -- needs manual handling  ; orig: - D 3 - - A 0x01E410 07:E400: 30 65     .word ram_6530 ; 00
    ; [DIRECTIVE] .WORD ram_6546  -- needs manual handling  ; orig: - D 3 - - - 0x01E412 07:E402: 46 65     .word ram_6546 ; 04
    ; [DIRECTIVE] .WORD ram_655C  -- needs manual handling  ; orig: - D 3 - - - 0x01E414 07:E404: 5C 65     .word ram_655C ; 08
    ; [DIRECTIVE] .WORD ram_6572  -- needs manual handling  ; orig: - D 3 - - - 0x01E416 07:E406: 72 65     .word ram_6572 ; 10
    ; [DIRECTIVE] .WORD ram_6588  -- needs manual handling  ; orig: - D 3 - - - 0x01E418 07:E408: 88 65     .word ram_6588 ; 10
    ; [DIRECTIVE] .WORD ram_659E  -- needs manual handling  ; orig: - D 3 - - - 0x01E41A 07:E40A: 9E 65     .word ram_659E ; 14
    ; [DIRECTIVE] .WORD ram_65B4  -- needs manual handling  ; orig: - D 3 - - - 0x01E41C 07:E40C: B4 65     .word ram_65B4 ; 18
    ; [DIRECTIVE] .WORD ram_65CA  -- needs manual handling  ; orig: - D 3 - - - 0x01E41E 07:E40E: CA 65     .word ram_65CA ; 20
    ; [DIRECTIVE] .WORD ram_65E0  -- needs manual handling  ; orig: - D 3 - - - 0x01E420 07:E410: E0 65     .word ram_65E0 ; 20
    ; [DIRECTIVE] .WORD ram_65F6  -- needs manual handling  ; orig: - D 3 - - - 0x01E422 07:E412: F6 65     .word ram_65F6 ; 24
    ; [DIRECTIVE] .WORD ram_660C  -- needs manual handling  ; orig: - D 3 - - - 0x01E424 07:E414: 0C 66     .word ram_660C ; 28
    ; [DIRECTIVE] .WORD ram_6622  -- needs manual handling  ; orig: - D 3 - - - 0x01E426 07:E416: 22 66     .word ram_6622 ; 30
    ; [DIRECTIVE] .WORD ram_6638  -- needs manual handling  ; orig: - D 3 - - - 0x01E428 07:E418: 38 66     .word ram_6638 ; 30
    ; [DIRECTIVE] .WORD ram_664E  -- needs manual handling  ; orig: - D 3 - - - 0x01E42A 07:E41A: 4E 66     .word ram_664E ; 34
    ; [DIRECTIVE] .WORD ram_6664  -- needs manual handling  ; orig: - D 3 - - - 0x01E42C 07:E41C: 64 66     .word ram_6664 ; 38
    ; [DIRECTIVE] .WORD ram_667A  -- needs manual handling  ; orig: - D 3 - - - 0x01E42E 07:E41E: 7A 66     .word ram_667A ; 40
    ; [DIRECTIVE] .WORD ram_6690  -- needs manual handling  ; orig: - D 3 - - - 0x01E430 07:E420: 90 66     .word ram_6690 ; 40
    ; [DIRECTIVE] .WORD ram_66A6  -- needs manual handling  ; orig: - D 3 - - - 0x01E432 07:E422: A6 66     .word ram_66A6 ; 44
    ; [DIRECTIVE] .WORD ram_66BC  -- needs manual handling  ; orig: - D 3 - - - 0x01E434 07:E424: BC 66     .word ram_66BC ; 48
    ; [DIRECTIVE] .WORD ram_66D2  -- needs manual handling  ; orig: - D 3 - - - 0x01E436 07:E426: D2 66     .word ram_66D2 ; 50
    ; [DIRECTIVE] .WORD ram_66E8  -- needs manual handling  ; orig: - D 3 - - - 0x01E438 07:E428: E8 66     .word ram_66E8 ; 50
    ; [DIRECTIVE] .WORD ram_66FE  -- needs manual handling  ; orig: - D 3 - - - 0x01E43A 07:E42A: FE 66     .word ram_66FE ; 54
    ; [DIRECTIVE] .WORD ram_6714  -- needs manual handling  ; orig: - D 3 - - - 0x01E43C 07:E42C: 14 67     .word ram_6714 ; 58
    ; [DIRECTIVE] .WORD ram_672A  -- needs manual handling  ; orig: - D 3 - - - 0x01E43E 07:E42E: 2A 67     .word ram_672A ; 60
    ; [DIRECTIVE] .WORD ram_6740  -- needs manual handling  ; orig: - D 3 - - - 0x01E440 07:E430: 40 67     .word ram_6740 ; 60
    ; [DIRECTIVE] .WORD ram_6756  -- needs manual handling  ; orig: - D 3 - - - 0x01E442 07:E432: 56 67     .word ram_6756 ; 64
    ; [DIRECTIVE] .WORD ram_676C  -- needs manual handling  ; orig: - D 3 - - - 0x01E444 07:E434: 6C 67     .word ram_676C ; 68
    ; [DIRECTIVE] .WORD ram_6782  -- needs manual handling  ; orig: - D 3 - - - 0x01E446 07:E436: 82 67     .word ram_6782 ; 70
    ; [DIRECTIVE] .WORD ram_6798  -- needs manual handling  ; orig: - D 3 - - - 0x01E448 07:E438: 98 67     .word ram_6798 ; 70
    ; [DIRECTIVE] .WORD ram_67AE  -- needs manual handling  ; orig: - D 3 - - - 0x01E44A 07:E43A: AE 67     .word ram_67AE ; 74
    ; [DIRECTIVE] .WORD ram_67C4  -- needs manual handling  ; orig: - D 3 - - - 0x01E44C 07:E43C: C4 67     .word ram_67C4 ; 78
    ; [DIRECTIVE] .WORD ram_67DA  -- needs manual handling  ; orig: - D 3 - - - 0x01E44E 07:E43E: DA 67     .word ram_67DA ; 80



loc_E440:  ; orig: loc_E440:
loc_out_0x01E450:  ; orig: loc_out_0x01E450:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01E450 07:E440: A9 00     LDA #$00
    MOVE.B  D0,ram_00F4_flag  ; orig: C - - - - - 0x01E452 07:E442: 85 F4     STA ram_00F4_flag
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E454 07:E444: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E456 07:E446: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0174BC_check_battery_integrity             ; JSR -> BSR  ; orig: C - - - - - 0x01E459 07:E449: 20 AC B4  JSR sub_0x0174BC_che
    BSR     sub_0x0174F8_clear_memory             ; JSR -> BSR  ; orig: C - - - - - 0x01E45C 07:E44C: 20 E8 B4  JSR sub_0x0174F8_cle
    MOVE.B  #$FF,ram_0302_ppu_buffer            ; bzk fix: init PPU buffer to $FF terminator before NMI fires
    BSR     sub_E45E             ; JSR -> BSR  ; orig: C - - - - - 0x01E45F 07:E44F: 20 5E E4  JSR sub_E45E
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01E462 07:E452: A5 FF     LDA ram_for_2000
    ORI.B   #$A0,D0  ; orig: C - - - - - 0x01E464 07:E454: 09 A0     ORA #$A0    ; enable
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E466 07:E456: 8D 00 20  STA $2000
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01E469 07:E459: 85 FF     STA ram_for_2000
loc_E45B_infinite_loop:  ; orig: loc_E45B_infinite_loop:
    JMP     loc_E45B_infinite_loop  ; orig: C D 3 - - - 0x01E46B 07:E45B: 4C 5B E4  JMP loc_E45B_infinit



sub_E45E:  ; orig: sub_E45E:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E46E 07:E45E: A9 00     LDA #$00
    MOVE.B  D0,$4011  ; orig: C - - - - - 0x01E470 07:E460: 8D 11 40  STA $4011
    MOVE.B  #$0F,D0  ; orig: C - - - - - 0x01E473 07:E463: A9 0F     LDA #$0F
    MOVE.B  D0,$4015  ; orig: C - - - - - 0x01E475 07:E465: 8D 15 40  STA $4015
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01E478 07:E468: A9 06     LDA #$06
    MOVE.B  D0,PPU_REG_$2001  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E47A 07:E46A: 8D 01 20  STA $2001
sub_E46D_clear_screen:  ; orig: sub_E46D_clear_screen:
sub_0x01E47D_clear_screen:  ; orig: sub_0x01E47D_clear_screen:
    BSR     sub_E5F7_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x01E47D 07:E46D: 20 F7 E5  JSR sub_E5F7_hide_al
    BSR     sub_E580_set_scroll_to_00             ; JSR -> BSR  ; orig: C - - - - - 0x01E480 07:E470: 20 80 E5  JSR sub_E580_set_scr
    BSR     sub_E625_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x01E483 07:E473: 20 25 E6  JSR sub_E625_disable
    MOVE.B  #> $2000,D0  ; orig: C - - - - - 0x01E486 07:E476: A9 20     LDA #> $2000
    BSR     sub_E47D_clear_nmt             ; JSR -> BSR  ; orig: C - - - - - 0x01E488 07:E478: 20 7D E4  JSR sub_E47D_clear_n
    MOVE.B  #> $2800,D0  ; orig: C - - - - - 0x01E48B 07:E47B: A9 28     LDA #> $2800
sub_E47D_clear_nmt:  ; orig: sub_E47D_clear_nmt:
    MOVE.B  #$24,D1  ; orig: C - - - - - 0x01E48D 07:E47D: A2 24     LDX #$24    ; fill b
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01E48F 07:E47F: A0 00     LDY #$00    ; fill b
    JMP     loc_E594_clear_nmt  ; orig: C - - - - - 0x01E491 07:E481: 4C 94 E5  JMP loc_E594_clear_n



vec_E484_NMI:  ; orig: vec_E484_NMI:
vec_0x01E494_NMI:  ; orig: vec_0x01E494_NMI:
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01E494 07:E484: A5 FF     LDA ram_for_2000
    MOVE.B  ram_005C,D1  ; orig: C - - - - - 0x01E496 07:E486: A6 5C     LDX ram_005C
    BEQ     bra_E48C             ; BEQ  ; orig: C - - - - - 0x01E498 07:E488: F0 02     BEQ bra_E48C
    EORI.B  #$02,D0  ; orig: C - - - - - 0x01E49A 07:E48A: 49 02     EOR #$02
bra_E48C:  ; orig: bra_E48C:
    ANDI.B  #$7F,D0  ; orig: C - - - - - 0x01E49C 07:E48C: 29 7F     AND #$7F    ; disabl
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01E49E 07:E48E: 85 FF     STA ram_for_2000
    ANDI.B  #$7E,D0  ; orig: C - - - - - 0x01E4A0 07:E490: 29 7E     AND #$7E
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4A2 07:E492: 8D 00 20  STA $2000
    MOVE.B  ram_for_2001,D0  ; orig: C - - - - - 0x01E4A5 07:E495: A5 FE     LDA ram_for_2001
    MOVE.B  ram_screen_transition_flag,D2  ; orig: C - - - - - 0x01E4A7 07:E497: A4 E3     LDY ram_screen_trans
    BNE     bra_E4A3_enable_rendering             ; BNE  ; orig: C - - - - - 0x01E4A9 07:E499: D0 08     BNE bra_E4A3_enable_

; if screen transition is OFF
    MOVE.B  ram_ppu_load_index,D2  ; orig: C - - - - - 0x01E4AB 07:E49B: A4 14     LDY ram_ppu_load_ind
    BNE     bra_E4A5_skip_rendering             ; BNE  ; orig: C - - - - - 0x01E4AD 07:E49D: D0 06     BNE bra_E4A5_skip_re
    MOVE.B  ram_0017_rendering_flag,D2  ; orig: C - - - - - 0x01E4AF 07:E49F: A4 17     LDY ram_0017_renderi
    BNE     bra_E4A5_skip_rendering             ; BNE  ; orig: C - - - - - 0x01E4B1 07:E4A1: D0 02     BNE bra_E4A5_skip_re
bra_E4A3_enable_rendering:  ; orig: bra_E4A3_enable_rendering:
    ORI.B   #$1E,D0  ; orig: C - - - - - 0x01E4B3 07:E4A3: 09 1E     ORA #$1E
bra_E4A5_skip_rendering:  ; orig: bra_E4A5_skip_rendering:
    MOVE.B  D0,PPU_REG_$2001  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4B5 07:E4A5: 8D 01 20  STA $2001
    MOVE.B  D0,ram_for_2001  ; orig: C - - - - - 0x01E4B8 07:E4A8: 85 FE     STA ram_for_2001
    MOVE.B  #< ram_oam,D0  ; orig: C - - - - - 0x01E4BA 07:E4AA: A9 00     LDA #< ram_oam
    MOVE.B  D0,PPU_REG_$2003  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4BC 07:E4AC: 8D 03 20  STA $2003
    MOVE.B  #> ram_oam,D0  ; orig: C - - - - - 0x01E4BF 07:E4AF: A9 02     LDA #> ram_oam
    MOVE.B  D0,$4014  ; orig: C - - - - - 0x01E4C1 07:E4B1: 8D 14 40  STA $4014
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E4C4 07:E4B4: A9 00     LDA #$00
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4C6 07:E4B6: 8D 05 20  STA $2005
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4C9 07:E4B9: 8D 05 20  STA $2005
    MOVE.B  #con_prg_bank + $06,D0  ; orig: C - - - - - 0x01E4CC 07:E4BC: A9 06     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E4CE 07:E4BE: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01A090_write_buffer_to_ppu             ; JSR -> BSR  ; orig: C - - - - - 0x01E4D1 07:E4C1: 20 80 A0  JSR sub_0x01A090_wri
    MOVE.B  #> $3F00,D0  ; orig: C - - - - - 0x01E4D4 07:E4C4: A9 3F     LDA #> $3F00
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4D6 07:E4C6: 8D 06 20  STA $2006
    MOVE.B  #< $3F00,D0  ; orig: C - - - - - 0x01E4D9 07:E4C9: A9 00     LDA #< $3F00
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4DB 07:E4CB: 8D 06 20  STA $2006

; A = 00
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4DE 07:E4CE: 8D 06 20  STA $2006
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E4E1 07:E4D1: 8D 06 20  STA $2006
bra_E4D4_infinite_loop:  ; orig: bra_E4D4_infinite_loop:

; wait for sprite 0 hit
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C - - - - - 0x01E4E4 07:E4D4: AD 02 20  LDA $2002
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x01E4E7 07:E4D7: 29 40     AND #$40
    BNE     bra_E4D4_infinite_loop             ; BNE  ; orig: C - - - - - 0x01E4E9 07:E4D9: D0 F9     BNE bra_E4D4_infinit

; sprite 0 was hit
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C - - - - - 0x01E4EB 07:E4DB: AD 02 20  LDA $2002
    MOVE.B  ram_screen_transition_flag,D0  ; orig: C - - - - - 0x01E4EE 07:E4DE: A5 E3     LDA ram_screen_trans
    BEQ     bra_E4EA             ; BEQ  ; orig: C - - - - - 0x01E4F0 07:E4E0: F0 08     BEQ bra_E4EA

; if transition is ON
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E4F2 07:E4E2: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E4F4 07:E4E4: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014531             ; JSR -> BSR  ; orig: C - - - - - 0x01E4F7 07:E4E7: 20 21 85  JSR sub_0x014531
bra_E4EA:  ; orig: bra_E4EA:
    MOVE.B  ram_0011_screen_ready_flag,D0  ; orig: C - - - - - 0x01E4FA 07:E4EA: A5 11     LDA ram_0011_screen_
    BEQ     bra_E518             ; BEQ  ; orig: C - - - - - 0x01E4FC 07:E4EC: F0 2A     BEQ bra_E518
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01E4FE 07:E4EE: A5 12     LDA ram_script
    BEQ     bra_E506             ; BEQ  ; orig: C - - - - - 0x01E500 07:E4F0: F0 14     BEQ bra_E506    ; co
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01E502 07:E4F2: C9 05     CMP #con_script_05_g
    BEQ     bra_E506             ; BEQ  ; orig: C - - - - - 0x01E504 07:E4F4: F0 10     BEQ bra_E506
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01E506 07:E4F6: C9 09     CMP #con_script_09
    BEQ     bra_E506             ; BEQ  ; orig: C - - - - - 0x01E508 07:E4F8: F0 0C     BEQ bra_E506
    CMPI.B  #con_script_0B,D0  ; orig: C - - - - - 0x01E50A 07:E4FA: C9 0B     CMP #con_script_0B
    BEQ     bra_E506             ; BEQ  ; orig: C - - - - - 0x01E50C 07:E4FC: F0 08     BEQ bra_E506
    CMPI.B  #con_script_0C,D0  ; orig: C - - - - - 0x01E50E 07:E4FE: C9 0C     CMP #con_script_0C
    BEQ     bra_E506             ; BEQ  ; orig: C - - - - - 0x01E510 07:E500: F0 04     BEQ bra_E506
    CMPI.B  #con_script_final_credits,D0  ; orig: C - - - - - 0x01E512 07:E502: C9 13     CMP #con_script_fina
    BNE     bra_E518             ; BNE  ; orig: C - - - - - 0x01E514 07:E504: D0 12     BNE bra_E518
bra_E506:  ; orig: bra_E506:
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C - - - - - 0x01E516 07:E506: AD 02 20  LDA $2002
    MOVE.B  ram_scroll_X,D0  ; orig: C - - - - - 0x01E519 07:E509: A5 FD     LDA ram_scroll_X
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E51B 07:E50B: 8D 05 20  STA $2005
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x01E51E 07:E50E: A5 FC     LDA ram_scroll_Y
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E520 07:E510: 8D 05 20  STA $2005
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01E523 07:E513: A5 FF     LDA ram_for_2000
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E525 07:E515: 8D 00 20  STA $2000
bra_E518:  ; orig: bra_E518:
    MOVE.B  ram_pause_script,D0  ; orig: C - - - - - 0x01E528 07:E518: A5 E1     LDA ram_pause_script
    OR.B    ram_pause_flag,D0  ; orig: C - - - - - 0x01E52A 07:E51A: 05 E0     ORA ram_pause_flag
    BNE     bra_E53B_skip             ; BNE  ; orig: C - - - - - 0x01E52C 07:E51C: D0 1D     BNE bra_E53B_skip

; counters 0027-003C change each frame

; counters 003D-004E change each 10 frames
    MOVE.B  #$26,D1  ; orig: C - - - - - 0x01E52E 07:E51E: A2 26     LDX #$26    ; < ram_
    MOVE.B  #$3C,D0  ; orig: C - - - - - 0x01E530 07:E520: A9 3C     LDA #$3C    ; < ram_
    MOVE.B  #$4E,D2  ; orig: C - - - - - 0x01E532 07:E522: A0 4E     LDY #$4E    ; < ram_

; bzk optimize, X is always 26
    MOVE.B  D1,ram_0000_t5F_useless_26  ; orig: C - - - - - 0x01E534 07:E524: 86 00     STX ram_0000_t5F_use

; bzk optimize, DEC 0026 without X
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01E536 07:E526: D6 00     DEC ram_main_timer -
    BPL     bra_E52F             ; BPL  ; orig: C - - - - - 0x01E538 07:E528: 10 05     BPL bra_E52F
    MOVE.B  #$09,D0  ; orig: C - - - - - 0x01E53A 07:E52A: A9 09     LDA #$09

; bzk optimize, STA 0026 without X
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E53C 07:E52C: 95 00     STA ram_main_timer -
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01E53E 07:E52E: 98        TYA
bra_E52F:  ; orig: bra_E52F:
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01E53F 07:E52F: AA        TAX
bra_E530_loop:  ; orig: bra_E530_loop:

; 0027-003C or 0027-004E
    MOVE.L  D1,D3
    ADD.L   #$FF0000,D3
    ADD.L   #$0000,D3
    MOVE.B  (D3),D0  ; orig: C - - - - - 0x01E540 07:E530: B5 00     LDA $00,X   ; ram_00
    BEQ     bra_E536             ; BEQ  ; orig: C - - - - - 0x01E542 07:E532: F0 02     BEQ bra_E536
    MOVE.L  D1,D3
    ADD.L   #$0000,D3
    SUBQ.B  #1,($FF0000,D3.L)  ; orig: C - - - - - 0x01E544 07:E534: D6 00     DEC $00,X   ; ram_00
bra_E536:  ; orig: bra_E536:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01E546 07:E536: CA        DEX

; bzk optimize, always 26
    CMP.B   ram_0000_t5F_useless_26,D1  ; orig: C - - - - - 0x01E547 07:E537: E4 00     CPX ram_0000_t5F_use
    BNE     bra_E530_loop             ; BNE  ; orig: C - - - - - 0x01E549 07:E539: D0 F5     BNE bra_E530_loop
bra_E53B_skip:  ; orig: bra_E53B_skip:
    MOVE.B  ram_screen_transition_flag,D0  ; orig: C - - - - - 0x01E54B 07:E53B: A5 E3     LDA ram_screen_trans
    BNE     bra_E542             ; BNE  ; orig: C - - - - - 0x01E54D 07:E53D: D0 03     BNE bra_E542

; if no transition
    BSR     sub_E62D_read_joysticks             ; JSR -> BSR  ; orig: C - - - - - 0x01E54F 07:E53F: 20 2D E6  JSR sub_E62D_read_jo
bra_E542:  ; orig: bra_E542:

; bzk bug? loop for 0018-0024, but 0x010703 works with 0019-0025
    MOVE.B  #$18,D1  ; orig: C - - - - - 0x01E552 07:E542: A2 18     LDX #$18    ; < ram_
    MOVE.B  #$0D,D2  ; orig: C - - - - - 0x01E554 07:E544: A0 0D     LDY #$0D    ; 0018-0

; bzk optimize, LDA 0018 without X
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01E556 07:E546: B5 00     LDA ram_indiv_random
    ANDI.B  #$02,D0  ; orig: C - - - - - 0x01E558 07:E548: 29 02     AND #$02
    MOVE.B  D0,ram_0000_t4B  ; orig: C - - - - - 0x01E55A 07:E54A: 85 00     STA ram_0000_t4B

; bzk optimize, LDA 0019 without X
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01E55C 07:E54C: B5 01     LDA ram_indiv_random
    ANDI.B  #$02,D0  ; orig: C - - - - - 0x01E55E 07:E54E: 29 02     AND #$02
    EOR.B   ram_0000_t4B,D0  ; orig: C - - - - - 0x01E560 07:E550: 45 00     EOR ram_0000_t4B
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01E562 07:E552: 18        CLC
    BEQ     bra_E556             ; BEQ  ; orig: C - - - - - 0x01E563 07:E553: F0 01     BEQ bra_E556
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01E565 07:E555: 38        SEC
bra_E556:  ; orig: bra_E556:
bra_E556_loop:  ; orig: bra_E556_loop:
    ; (empty translation for ROR)  ; orig: C - - - - - 0x01E566 07:E556: 76 00     ROR ram_indiv_random
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01E568 07:E558: E8        INX
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01E569 07:E559: 88        DEY
    BNE     bra_E556_loop             ; BNE  ; orig: C - - - - - 0x01E56A 07:E55A: D0 FA     BNE bra_E556_loop
    MOVE.B  #con_prg_bank + $00,D0  ; orig: C - - - - - 0x01E56C 07:E55C: A9 00     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E56E 07:E55E: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x001835_update_sound_driver             ; JSR -> BSR  ; orig: C - - - - - 0x01E571 07:E561: 20 25 98  JSR sub_0x001835_upd
    ADDQ.B  #1,ram_frm_cnt  ; orig: C - - - - - 0x01E574 07:E564: E6 15     INC ram_frm_cnt
    MOVE.W  #$0301,D0
    BSR     TRACE_MARK
    MOVE.B  ram_0011_screen_ready_flag,D0  ; orig: C - - - - - 0x01E576 07:E566: A5 11     LDA ram_0011_screen_
    BNE     bra_E570_skip_handler             ; BNE  ; orig: C - - - - - 0x01E578 07:E568: D0 06     BNE bra_E570_skip_ha
    MOVE.W  #$0302,D0
    BSR     TRACE_MARK
    BSR     sub_E8F8_main_script_handler_1             ; JSR -> BSR  ; orig: C - - - - - 0x01E57A 07:E56A: 20 F8 E8  JSR sub_E8F8_main_sc
    JMP     loc_E573  ; orig: C - - - - - 0x01E57D 07:E56D: 4C 73 E5  JMP loc_E573
bra_E570_skip_handler:  ; orig: bra_E570_skip_handler:
    MOVE.W  #$0303,D0
    BSR     TRACE_MARK
    BSR     sub_EB30_main_script_handler_2             ; JSR -> BSR  ; orig: C - - - - - 0x01E580 07:E570: 20 30 EB  JSR sub_EB30_main_sc
loc_E573:  ; orig: loc_E573:
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C D 3 - - - 0x01E583 07:E573: AD 02 20  LDA $2002
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01E586 07:E576: A5 FF     LDA ram_for_2000
    ORI.B   #$80,D0  ; orig: C - - - - - 0x01E588 07:E578: 09 80     ORA #$80    ; enable
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E58A 07:E57A: 8D 00 20  STA $2000
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01E58D 07:E57D: 85 FF     STA ram_for_2000
    RTS                     ; RTI -> RTS (called via BSR from VDP_VBLANK_HANDLER, not real exception)  ; orig: C - - - - - 0x01E58F 07:E57F: 40        RTI



sub_E580_set_scroll_to_00:  ; orig: sub_E580_set_scroll_to_00:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E590 07:E580: A9 00     LDA #$00
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E592 07:E582: 8D 05 20  STA $2005
    MOVE.B  D0,ram_scroll_X  ; orig: C - - - - - 0x01E595 07:E585: 85 FD     STA ram_scroll_X
    MOVE.B  D0,PPU_REG_$2005  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E597 07:E587: 8D 05 20  STA $2005
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x01E59A 07:E58A: 85 FC     STA ram_scroll_Y
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x01E59C 07:E58C: A9 30     LDA #$30
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E59E 07:E58E: 8D 00 20  STA $2000
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01E5A1 07:E591: 85 FF     STA ram_for_2000
    RTS                     ; RTS  ; orig: C - - - - - 0x01E5A3 07:E593: 60        RTS



loc_E594_clear_nmt:  ; orig: loc_E594_clear_nmt:

; in

; A = 2006 hi

; X = byte to fill nametable

; Y = byte to fill attributes
    MOVE.B  D0,ram_0000_t4C_ppu_hi  ; orig: C D 3 - - - 0x01E5A4 07:E594: 85 00     STA ram_0000_t4C_ppu
    MOVE.B  D1,ram_0001_t31_fill_byte  ; orig: C - - - - - 0x01E5A6 07:E596: 86 01     STX ram_0001_t31_fil

; bzk optimize, Y is always 00
    MOVE.B  D2,ram_0002_t42_useless_00  ; orig: C - - - - - 0x01E5A8 07:E598: 84 02     STY ram_0002_t42_use
    MOVE.B  PPU_REG_$2002  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!,D0  ; orig: C - - - - - 0x01E5AA 07:E59A: AD 02 20  LDA $2002
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x01E5AD 07:E59D: A5 FF     LDA ram_for_2000
    ANDI.B  #$FB,D0  ; orig: C - - - - - 0x01E5AF 07:E59F: 29 FB     AND #$FB
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5B1 07:E5A1: 8D 00 20  STA $2000
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01E5B4 07:E5A4: 85 FF     STA ram_for_2000
    MOVE.B  ram_0000_t4C_ppu_hi,D0  ; orig: C - - - - - 0x01E5B6 07:E5A6: A5 00     LDA ram_0000_t4C_ppu
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5B8 07:E5A8: 8D 06 20  STA $2006
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01E5BB 07:E5AB: A0 00     LDY #$00
    MOVE.B  D2,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5BD 07:E5AD: 8C 06 20  STY $2006
    MOVE.B  #$04,D1  ; orig: C - - - - - 0x01E5C0 07:E5B0: A2 04     LDX #$04
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01E5C2 07:E5B2: C9 20     CMP #$20
    BCS     bra_E5B8             ; BCS  ; orig: C - - - - - 0x01E5C4 07:E5B4: B0 02     BCS bra_E5B8

; bzk optimize, always 00
    MOVE.B  ram_0002_t42_useless_00,D1  ; orig: - - - - - - 0x01E5C6 07:E5B6: A6 02     LDX ram_0002_t42_use
bra_E5B8:  ; orig: bra_E5B8:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01E5C8 07:E5B8: A0 00     LDY #$00
    MOVE.B  ram_0001_t31_fill_byte,D0  ; orig: C - - - - - 0x01E5CA 07:E5BA: A5 01     LDA ram_0001_t31_fil
bra_E5BC_loop:  ; orig: bra_E5BC_loop:
    MOVE.B  D0,PPU_REG_$2007  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5CC 07:E5BC: 8D 07 20  STA $2007
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01E5CF 07:E5BF: 88        DEY
    BNE     bra_E5BC_loop             ; BNE  ; orig: C - - - - - 0x01E5D0 07:E5C0: D0 FA     BNE bra_E5BC_loop
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01E5D2 07:E5C2: CA        DEX
    BNE     bra_E5BC_loop             ; BNE  ; orig: C - - - - - 0x01E5D3 07:E5C3: D0 F7     BNE bra_E5BC_loop

; bzk optimize, always 00
    MOVE.B  ram_0002_t42_useless_00,D2  ; orig: C - - - - - 0x01E5D5 07:E5C5: A4 02     LDY ram_0002_t42_use
    MOVE.B  ram_0000_t4C_ppu_hi,D0  ; orig: C - - - - - 0x01E5D7 07:E5C7: A5 00     LDA ram_0000_t4C_ppu

; bzk optimize, useless check, 0000 is always 20 or 28, it can't be < 20.

; this routine was probably supposed to clear 0000-1FFF ppu as well
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01E5D9 07:E5C9: C9 20     CMP #$20
    BCC     bra_E5DF             ; BCC  ; orig: C - - - - - 0x01E5DB 07:E5CB: 90 12     BCC bra_E5DF
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01E5DD 07:E5CD: 69 02     ADC #$02
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5DF 07:E5CF: 8D 06 20  STA $2006
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x01E5E2 07:E5D2: A9 C0     LDA #$C0
    MOVE.B  D0,PPU_REG_$2006  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5E4 07:E5D4: 8D 06 20  STA $2006
    MOVE.B  #$40,D1  ; orig: C - - - - - 0x01E5E7 07:E5D7: A2 40     LDX #$40
bra_E5D9_loop:  ; orig: bra_E5D9_loop:
    MOVE.B  D2,PPU_REG_$2007  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E5E9 07:E5D9: 8C 07 20  STY $2007
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01E5EC 07:E5DC: CA        DEX
    BNE     bra_E5D9_loop             ; BNE  ; orig: C - - - - - 0x01E5ED 07:E5DD: D0 FA     BNE bra_E5D9_loop
bra_E5DF:  ; orig: bra_E5DF:

; bzk optimize, useless LDX
    MOVE.B  ram_0001_t31_fill_byte,D1  ; orig: C - - - - - 0x01E5EF 07:E5DF: A6 01     LDX ram_0001_t31_fil
    RTS                     ; RTS  ; orig: C - - - - - 0x01E5F1 07:E5E1: 60        RTS



sub_E5E2_jump_to_pointers_after_JSR:  ; orig: sub_E5E2_jump_to_pointers_after_JSR:
sub_0x01E5F2_jump_to_pointers_after_JSR:  ; orig: sub_0x01E5F2_jump_to_pointers_after_JSR:
    ; bzk rewrite: NES JSR dispatch → 68K BSR dispatch with DC.L jump table
    ; NES: JSR pushed 2-byte return addr; PLA/PLA recovered it; table was .WORD (16-bit)
    ; 68K: BSR pushes 4-byte return addr pointing right at DC.L table entries
    ; D0 = script index (0-based, byte)
    MOVE.W  D0,(TRACE_SCRIPT_RAW).l
    MOVE.L  A7,(TRACE_DISP_STACK).l
    ANDI.W  #$00FF,D0
    ASL.W   #2,D0           ; D0 = index * 4 (DC.L entry = 4 bytes each)
    MOVE.W  D0,(TRACE_DISP_INDEX).l
    MOVEA.L (A7)+,A1        ; pop BSR's 4-byte return address → A1 = DC.L table base
    MOVEA.L (A1,D0.W),A0   ; read 32-bit target address from table[index]
    MOVE.L  A1,(TRACE_DISP_BASE).l
    MOVE.L  A0,(TRACE_DISP_TARGET).l
    MOVE.W  D0,-(A7)
    MOVE.W  #$0317,D0
    BSR     TRACE_MARK
    MOVE.W  #$0318,D0
    BSR     TRACE_MARK
    MOVE.W  (A7)+,D0
    JMP     (A0)            ; jump to target (does not return through BSR)



sub_E5F7_hide_all_sprites:  ; orig: sub_E5F7_hide_all_sprites:
sub_0x01E607_hide_all_sprites:  ; orig: sub_0x01E607_hide_all_sprites:
loc_0x01E607_hide_all_sprites:  ; orig: loc_0x01E607_hide_all_sprites:
    MOVE.B  #$00,D2  ; orig: C D 3 - - - 0x01E607 07:E5F7: A0 00     LDY #$00
    MOVE.B  #$40,D1  ; orig: C - - - - - 0x01E609 07:E5F9: A2 40     LDX #$40
bra_E5FB_loop:  ; orig: bra_E5FB_loop:
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x01E60B 07:E5FB: A9 F8     LDA #$F8
    MOVE.B  D0,ram_spr_Y(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01E60D 07:E5FD: 99 00 02  STA ram_spr_Y,Y
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01E610 07:E600: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01E611 07:E601: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01E612 07:E602: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01E613 07:E603: C8        INY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01E614 07:E604: CA        DEX ; bzk optimize, 
    BNE     bra_E5FB_loop             ; BNE  ; orig: C - - - - - 0x01E615 07:E605: D0 F4     BNE bra_E5FB_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01E617 07:E607: 60        RTS



sub_0x01E618_clear_memory:  ; orig: sub_0x01E618_clear_memory:

; in

; A = hi address

; Y = highest lo address for A

; bzk optimize, move to bank 05
    MOVE.B  D0,(ram_0000_t06_data+1+$FF0000).l  ; FIXED: STA ram_0000_t06_data+1 (hi-addr param)
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E61A 07:E60A: A9 00     LDA #$00
    MOVE.B  D0,(ram_0000_t06_data+$FF0000).l  ; orig: C - - - - - 0x01E61C 07:E60C: 85 00     STA ram_0000_t06_dat
bra_E60E_loop:  ; orig: bra_E60E_loop:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E61E 07:E60E: A9 00     LDA #$00
    MOVEA.L #$FF0000,A0
    ADDA.L  #ram_0000_t06_data,A0
    MOVEA.W (A0),A1
    ADDA.L  #$FF0000,A1
    MOVE.B  D0,(A1,D2.W)  ; orig: C - - - - - 0x01E620 07:E610: 91 00     STA (ram_0000_t06_da
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01E622 07:E612: 88        DEY
    CMPI.B  #$FF,D2  ; orig: C - - - - - 0x01E623 07:E613: C0 FF     CPY #$FF
    BNE     bra_E60E_loop             ; BNE  ; orig: C - - - - - 0x01E625 07:E615: D0 F7     BNE bra_E60E_loop
    SUBQ.B  #1,(ram_0000_t06_data+1+$FF0000).l  ; FIXED: DEC ram_0000_t06_data+1
    MOVE.B  (ram_0000_t06_data+1+$FF0000).l,D0  ; FIXED: LDA ram_0000_t06_data+1
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01E62B 07:E61B: C9 03     CMP #$03
    BCS     bra_E60E_loop             ; BCS  ; orig: C - - - - - 0x01E62D 07:E61D: B0 EF     BCS bra_E60E_loop
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01E62F 07:E61F: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x01E631 07:E621: 8D 02 03  STA ram_0302_ppu_buf
    RTS                     ; RTS  ; orig: C - - - - - 0x01E634 07:E624: 60        RTS



sub_E625_disable_rendering_and_nmi:  ; orig: sub_E625_disable_rendering_and_nmi:
sub_0x01E635_disable_rendering_and_nmi:  ; orig: sub_0x01E635_disable_rendering_and_nmi:
loc_0x01E635_disable_rendering_and_nmi:  ; orig: loc_0x01E635_disable_rendering_and_nmi:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01E635 07:E625: A9 00     LDA #$00
    MOVE.B  D0,PPU_REG_$2001  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01E637 07:E627: 8D 01 20  STA $2001
    MOVE.B  D0,ram_for_2001  ; orig: C - - - - - 0x01E63A 07:E62A: 85 FE     STA ram_for_2001
    RTS                     ; RTS  ; orig: C - - - - - 0x01E63C 07:E62C: 60        RTS



sub_E62D_read_joysticks:  ; orig: sub_E62D_read_joysticks:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01E63D 07:E62D: A9 01     LDA #$01
    MOVE.B  D0,$4016  ; orig: C - - - - - 0x01E63F 07:E62F: 8D 16 40  STA $4016
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E642 07:E632: A9 00     LDA #$00
    MOVE.B  D0,$4016  ; orig: C - - - - - 0x01E644 07:E634: 8D 16 40  STA $4016
    MOVE.B  D0,ram_0003_t18  ; orig: C - - - - - 0x01E647 07:E637: 85 03     STA ram_0003_t18
    MOVE.B  D0,ram_0004_t18_leftover_enemies  ; orig: C - - - - - 0x01E649 07:E639: 85 04     STA ram_0003_t18 + $
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01E64B 07:E63B: AA        TAX ; 00
    BSR     sub_E640_read_player_input             ; JSR -> BSR  ; orig: C - - - - - 0x01E64C 07:E63C: 20 40 E6  JSR sub_E640_read_pl
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01E64F 07:E63F: E8        INX ; 01
sub_E640_read_player_input:
; X = 00
bra_E640_loop:  ; orig: bra_E640_loop:
    MOVE.B  D0,ram_0002_t17  ; orig: C - - - - - 0x01E650 07:E640: 85 02     STA ram_0002_t17
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01E652 07:E642: A9 01     LDA #$01
    MOVE.B  D0,$4016  ; orig: C - - - - - 0x01E654 07:E644: 8D 16 40  STA $4016
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E657 07:E647: A9 00     LDA #$00
    MOVE.B  D0,$4016  ; orig: C - - - - - 0x01E659 07:E649: 8D 16 40  STA $4016
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x01E65C 07:E64C: A0 08     LDY #$08
bra_E64E_loop:  ; orig: bra_E64E_loop:
    MOVE.B  $4016(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E65E 07:E64E: BD 16 40  LDA $4016,X
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E661 07:E651: 4A        LSR
    MOVE.B  ram_btn_press(D1.L),D3
    ROXL.B  #1,D3           ; ROL ram_btn_press,X
    MOVE.B  D3,ram_btn_press(D1.L)  ; orig: C - - - - - 0x01E662 07:E652: 36 F8     ROL ram_btn_press,X
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E664 07:E654: 4A        LSR
    ROXL.B  #1,ram_0000_t49  ; orig: C - - - - - 0x01E665 07:E655: 26 00     ROL ram_0000_t49
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01E667 07:E657: 88        DEY
    BNE     bra_E64E_loop             ; BNE  ; orig: C - - - - - 0x01E668 07:E658: D0 F4     BNE bra_E64E_loop
    MOVE.B  ram_btn_press(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E66A 07:E65A: B5 F8     LDA ram_btn_press,X
    CMP.B   ram_0002_t17,D0  ; orig: C - - - - - 0x01E66C 07:E65C: C5 02     CMP ram_0002_t17
    BNE     bra_E640_loop             ; BNE  ; orig: C - - - - - 0x01E66E 07:E65E: D0 E0     BNE bra_E640_loop
    MOVE.B  ram_0003_t18(D1.L),D2
    ADDQ.B  #1,D2           ; INC ram_0003_t18,X
    MOVE.B  D2,ram_0003_t18(D1.L)  ; orig: C - - - - - 0x01E670 07:E660: F6 03     INC ram_0003_t18,X
    MOVE.B  ram_0003_t18(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01E672 07:E662: B4 03     LDY ram_0003_t18,X
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x01E674 07:E664: C0 02     CPY #$02
    BCC     bra_E640_loop             ; BCC  ; orig: C - - - - - 0x01E676 07:E666: 90 D8     BCC bra_E640_loop
    MOVE.B  ram_0000_t49,D0  ; orig: C - - - - - 0x01E678 07:E668: A5 00     LDA ram_0000_t49
    MOVE.B  ram_btn_press(D1.L),D3
    OR.B    D3,D0           ; ORA ram_btn_press,X
    MOVE.B  D0,ram_btn_press(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01E67C 07:E66C: 95 F8     STA ram_btn_press,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01E67E 07:E66E: 48        PHA
    MOVE.B  ram_btn_hold(D1.L),D3
    EOR.B   D3,D0           ; EOR ram_btn_hold,X
    AND.B   ram_btn_press(D1.L),D0  ; AND ram_btn_press,X
    MOVE.B  D0,ram_btn_press(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01E683 07:E673: 95 F8     STA ram_btn_press,X
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01E685 07:E675: 68        PLA
    MOVE.B  D0,ram_btn_hold(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01E686 07:E676: 95 FA     STA ram_btn_hold,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01E688 07:E678: 60        RTS



sub_E679:  ; orig: sub_E679:
sub_0x01E689:  ; orig: sub_0x01E689:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01E689 07:E679: A5 10     LDA ram_dungeon_leve
    BEQ     bra_E6CD_RTS             ; BEQ  ; orig: C - - - - - 0x01E68B 07:E67B: F0 50     BEQ bra_E6CD_RTS    

; if dungeon
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E68D 07:E67D: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E68F 07:E67F: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0175FB             ; JSR -> BSR  ; orig: C - - - - - 0x01E692 07:E682: 20 EB B5  JSR sub_0x0175FB
    BEQ     bra_E6CD_RTS             ; BEQ  ; orig: C - - - - - 0x01E695 07:E685: F0 46     BEQ bra_E6CD_RTS
    MOVE.B  ram_6BAE,D0  ; orig: C - - - - - 0x01E697 07:E687: AD AE 6B  LDA ram_6BAE
    MOVE.B  #$04,D1  ; orig: C - - - - - 0x01E69A 07:E68A: A2 04     LDX #$04
    JMP     loc_bat_71ED  ; orig: C - - - - - 0x01E69C 07:E68C: 4C ED 71  JMP loc_bat_71ED



sub_0x01E69F:  ; orig: sub_0x01E69F:
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x01E69F 07:E68F: A4 10     LDY ram_dungeon_leve
    BEQ     bra_E6B8             ; BEQ  ; orig: C - - - - - 0x01E6A1 07:E691: F0 25     BEQ bra_E6B8    ; if

; if dungeon
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01E6A3 07:E693: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x01E6A5 07:E695: 85 02     STA ram_0002_t24_dir
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E6A7 07:E697: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E6A9 07:E699: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x016406             ; JSR -> BSR  ; orig: C - - - - - 0x01E6AC 07:E69C: 20 F6 A3  JSR sub_0x016406
    MOVE.B  ram_0001_t01,D2  ; orig: C - - - - - 0x01E6AF 07:E69F: A4 01     LDY ram_0001_t01
bra_E6A1:  ; orig: bra_E6A1:
    MOVE.B  D2,ram_00E7  ; orig: C - - - - - 0x01E6B1 07:E6A1: 84 E7     STY ram_00E7
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01E6B3 07:E6A3: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_000_0x017532_00
    DC.L    ofs_000_0x017527_01
    DC.L    ofs_000_0x017532_02
    DC.L    ofs_000_0x017532_03
    DC.L    ofs_000_0x017532_04
    DC.L    ofs_000_0x017532_05
    DC.L    ofs_000_0x017532_06
    DC.L    ofs_000_0x017532_07
    DC.L    ofs_000_0x017527_08



bra_E6B8:  ; orig: bra_E6B8:
    MOVE.B  ram_dir_link,D2  ; orig: C - - - - - 0x01E6C8 07:E6B8: A4 98     LDY ram_dir_link
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E6CA 07:E6BA: A9 00     LDA #$00
    BEQ     bra_E6A1             ; BEQ  ; orig: C - - - - - 0x01E6CC 07:E6BC: F0 E3     BEQ bra_E6A1    ; jm



tbl_0x01E6CE_8_bits:  ; orig: tbl_0x01E6CE_8_bits:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01E6CE 07:E6BE: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 3 - - - 0x01E6CF 07:E6BF: 02        .byte $02   ; 01
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D0 07:E6C0: 04        .byte $04   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D1 07:E6C1: 08        .byte $08   ; 03
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D2 07:E6C2: 10        .byte $10   ; 04
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D3 07:E6C3: 20        .byte $20   ; 05
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D4 07:E6C4: 40        .byte $40   ; 06
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01E6D5 07:E6C5: 80        .byte $80   ; 07



sub_E6C6_set_map_bit5:  ; orig: sub_E6C6_set_map_bit5:
sub_0x01E6D6_set_map_bit5:  ; orig: sub_0x01E6D6_set_map_bit5:
    BSR     sub_E6CE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x01E6D6 07:E6C6: 20 CE E6  JSR sub_E6CE_get_byt
    ORI.B   #$20,D0  ; orig: C - - - - - 0x01E6D9 07:E6C9: 09 20     ORA #$20
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x01E6DB 07:E6CB: 91 00     STA (ram_0000_t13_da
bra_E6CD_RTS:  ; orig: bra_E6CD_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01E6DD 07:E6CD: 60        RTS



sub_E6CE_get_byte_from_current_map_location:  ; orig: sub_E6CE_get_byte_from_current_map_location:
sub_0x01E6DE_get_byte_from_current_map_location:  ; orig: sub_0x01E6DE_get_byte_from_current_map_location:

; out

; A =

; ram_0000_t13_data

; bzk optimize, JSR E6CE
    MOVE.B  ram_6BAF,D0  ; orig: C - - - - - 0x01E6DE 07:E6CE: AD AF 6B  LDA ram_6BAF
    MOVE.B  D0,ram_0000_t13_data  ; orig: C - - - - - 0x01E6E1 07:E6D1: 85 00     STA ram_0000_t13_dat
    MOVE.B  ram_6BB0,D0  ; orig: C - - - - - 0x01E6E3 07:E6D3: AD B0 6B  LDA ram_6BB0
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E6E6 07:E6D6: 85 01     STA ram_0000_t13_dat
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01E6E8 07:E6D8: A4 EB     LDY ram_map_location
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01E6EA 07:E6DA: B1 00     LDA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: C - - - - - 0x01E6EC 07:E6DC: 60        RTS



bra_E6DD:  ; orig: bra_E6DD:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01E6ED 07:E6DD: A5 71     LDA ram_pos_X_enemy 
    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x01E6EF 07:E6DF: 85 83     STA ram_0083
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01E6F1 07:E6E1: A5 85     LDA ram_pos_Y_enemy 
    MOVE.B  D0,ram_0097  ; orig: C - - - - - 0x01E6F3 07:E6E3: 85 97     STA ram_0097
    JMP     loc_E70C  ; orig: C - - - - - 0x01E6F5 07:E6E5: 4C 0C E7  JMP loc_E70C
bra_E6E8:  ; orig: bra_E6E8:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01E6F8 07:E6E8: 68        PLA
bra_E6E9_RTS:  ; orig: bra_E6E9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01E6F9 07:E6E9: 60        RTS



sub_E6EA:  ; orig: sub_E6EA:
    BSR     sub_bat_7314_check_map_bit4             ; JSR -> BSR  ; orig: C - - - - - 0x01E6FA 07:E6EA: 20 14 73  JSR sub_bat_7314_che
    BNE     bra_E6E9_RTS             ; BNE  ; orig: C - - - - - 0x01E6FD 07:E6ED: D0 FA     BNE bra_E6E9_RTS
    MOVE.B  ram_room_item_flag,D0  ; orig: C - - - - - 0x01E6FF 07:E6EF: A5 BF     LDA ram_room_item_fl
    BMI     bra_E6E9_RTS             ; BMI  ; orig: C - - - - - 0x01E701 07:E6F1: 30 F6     BMI bra_E6E9_RTS

; if room has an item
    MOVE.B  ram_drop_id_room,D0  ; orig: C - - - - - 0x01E703 07:E6F3: A5 AB     LDA ram_drop_id_room
    CMPI.B  #$3F,D0  ; orig: C - - - - - 0x01E705 07:E6F5: C9 3F     CMP #$3F
    BEQ     bra_E6E9_RTS             ; BEQ  ; orig: C - - - - - 0x01E707 07:E6F7: F0 F0     BEQ bra_E6E9_RTS
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x01E709 07:E6F9: A2 01     LDX #$01
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x01E70B 07:E6FB: AD 50 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_17,D0  ; orig: C - - - - - 0x01E70E 07:E6FE: C9 17     CMP #con_obj_id_17
    BEQ     bra_E6DD             ; BEQ  ; orig: C - - - - - 0x01E710 07:E700: F0 DB     BEQ bra_E6DD
    CMPI.B  #con_obj_id_2A,D0  ; orig: C - - - - - 0x01E712 07:E702: C9 2A     CMP #con_obj_id_2A
    BEQ     bra_E6DD             ; BEQ  ; orig: C - - - - - 0x01E714 07:E704: F0 D7     BEQ bra_E6DD
    CMPI.B  #con_obj_id_30,D0  ; orig: C - - - - - 0x01E716 07:E706: C9 30     CMP #con_obj_id_30
    BEQ     bra_E6DD             ; BEQ  ; orig: C - - - - - 0x01E718 07:E708: F0 D3     BEQ bra_E6DD
    MOVE.B  #$13,D1  ; orig: C - - - - - 0x01E71A 07:E70A: A2 13     LDX #$13
loc_E70C:  ; orig: loc_E70C:
    MOVE.B  ram_drop_id_room,D0  ; orig: C D 3 - - - 0x01E71C 07:E70C: A5 AB     LDA ram_drop_id_room
sub_E70E:  ; orig: sub_E70E:
sub_0x01E71E:  ; orig: sub_0x01E71E:

; in

; A = con_drop_id

; X = object index
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01E71E 07:E70E: 48        PHA
    MOVE.B  ram_03A8_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E71F 07:E70F: BD A8 03  LDA ram_03A8_enemy,X
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x01E722 07:E712: C9 F0     CMP #$F0
    BCC     bra_E719             ; BCC  ; orig: C - - - - - 0x01E724 07:E714: 90 03     BCC bra_E719
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E726 07:E716: 4A        LSR
    BCC     bra_E6E8             ; BCC  ; orig: C - - - - - 0x01E727 07:E717: 90 CF     BCC bra_E6E8
bra_E719:  ; orig: bra_E719:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01E729 07:E719: 20 93 FA  JSR sub_FA93
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01E72C 07:E71C: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01E72D 07:E71D: AA        TAX
    MOVE.B  tbl_bat_72C8(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E72E 07:E71E: BD C8 72  LDA tbl_bat_72C8,X
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01E731 07:E721: C9 30     CMP #$30

; bzk optimize, no 30 values in the table
    BEQ     bra_E731             ; BEQ  ; orig: C - - - - - 0x01E733 07:E723: F0 0C     BEQ bra_E731
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01E735 07:E725: 29 0F     AND #$0F
bra_E727:  ; orig: bra_E727:
    MOVE.B  D0,ram_0004_t21  ; orig: C - - - - - 0x01E737 07:E727: 85 04     STA ram_0004_t21
    MOVE.B  tbl_bat_72A4(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E739 07:E729: BD A4 72  LDA tbl_bat_72A4,X
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01E73C 07:E72C: AA        TAX
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01E73D 07:E72D: A8        TAY
    JMP     loc_E73A  ; orig: C - - - - - 0x01E73E 07:E72E: 4C 3A E7  JMP loc_E73A
bra_E731:  ; orig: bra_E731:

; bzk garbage
    MOVE.B  #$FF,D0  ; orig: - - - - - - 0x01E741 07:E731: A9 FF     LDA #$FF
    BNE     bra_E727             ; BNE  ; orig: - - - - - - 0x01E743 07:E733: D0 F2     BNE bra_E727    ; jm



sub_0x01E745:  ; orig: sub_0x01E745:
loc_0x01E745:  ; orig: loc_0x01E745:

; in

; X = con_item

; Y =
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01E745 07:E735: BD 57 06  LDA ram_items,X
    MOVE.B  D0,ram_0004_t21  ; orig: C - - - - - 0x01E748 07:E738: 85 04     STA ram_0004_t21
loc_E73A:  ; orig: loc_E73A:
    MOVE.B  tbl_bat_72EC(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01E74A 07:E73A: BD EC 72  LDA tbl_bat_72EC,X
    CMPI.B  #con_item_1_rupee,D1  ; orig: C - - - - - 0x01E74D 07:E73D: E0 16     CPX #con_item_1_rupe
    BEQ     bra_E74D             ; BEQ  ; orig: C - - - - - 0x01E74F 07:E73F: F0 0C     BEQ bra_E74D
    CMPI.B  #con_item_triforce,D1  ; orig: C - - - - - 0x01E751 07:E741: E0 1A     CPX #con_item_trifor
    BEQ     bra_E74D             ; BEQ  ; orig: C - - - - - 0x01E753 07:E743: F0 08     BEQ bra_E74D
    CMPI.B  #con_item_1B,D1  ; orig: C - - - - - 0x01E755 07:E745: E0 1B     CPX #con_item_1B
    BEQ     bra_E74D             ; BEQ  ; orig: C - - - - - 0x01E757 07:E747: F0 04     BEQ bra_E74D
    CMPI.B  #con_item_hearts_2,D1  ; orig: C - - - - - 0x01E759 07:E749: E0 19     CPX #con_item_hearts
    BNE     bra_E756             ; BNE  ; orig: C - - - - - 0x01E75B 07:E74B: D0 09     BNE bra_E756
bra_E74D:  ; orig: bra_E74D:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01E75D 07:E74D: A5 15     LDA ram_frm_cnt
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x01E75F 07:E74F: 29 08     AND #$08

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E761 07:E751: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E762 07:E752: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E763 07:E753: 4A        LSR
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01E764 07:E754: 69 01     ADC #$01
bra_E756:  ; orig: bra_E756:
    CMPI.B  #con_item_sword,D1  ; orig: C - - - - - 0x01E766 07:E756: E0 00     CPX #con_item_sword
    BEQ     bra_E773             ; BEQ  ; orig: C - - - - - 0x01E768 07:E758: F0 19     BEQ bra_E773
    CMPI.B  #con_item_candle,D1  ; orig: C - - - - - 0x01E76A 07:E75A: E0 04     CPX #con_item_candle
    BEQ     bra_E773             ; BEQ  ; orig: C - - - - - 0x01E76C 07:E75C: F0 15     BEQ bra_E773
    CMPI.B  #con_item_arrow,D1  ; orig: C - - - - - 0x01E76E 07:E75E: E0 02     CPX #con_item_arrow
    BEQ     bra_E773             ; BEQ  ; orig: C - - - - - 0x01E770 07:E760: F0 11     BEQ bra_E773
    CMPI.B  #con_item_potion,D1  ; orig: C - - - - - 0x01E772 07:E762: E0 07     CPX #con_item_potion
    BEQ     bra_E773             ; BEQ  ; orig: C - - - - - 0x01E774 07:E764: F0 0D     BEQ bra_E773
    CMPI.B  #con_item_ring,D1  ; orig: C - - - - - 0x01E776 07:E766: E0 0B     CPX #con_item_ring
    BEQ     bra_E773             ; BEQ  ; orig: C - - - - - 0x01E778 07:E768: F0 09     BEQ bra_E773
bra_E76A:  ; orig: bra_E76A:
loc_E76A:  ; orig: loc_E76A:

; bzk optimize, useless LDX + STX
    MOVE.B  #$00,D1  ; orig: C D 3 - - - 0x01E77A 07:E76A: A2 00     LDX #$00
    MOVE.B  D1,ram_000C_t13_useless  ; orig: C - - - - - 0x01E77C 07:E76C: 86 0C     STX ram_000C_t13_use
    MOVE.B  #$0F,D1  ; orig: C - - - - - 0x01E77E 07:E76E: A2 0F     LDX #$0F
    JMP     loc_bat_790C  ; orig: C - - - - - 0x01E780 07:E770: 4C 0C 79  JMP loc_bat_790C
bra_E773:  ; orig: bra_E773:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01E783 07:E773: 18        CLC
    ADDX.B  ram_0004_t21,D0  ; orig: C - - - - - 0x01E784 07:E774: 65 04     ADC ram_0004_t21
    CMPI.B  #con_item_sword,D1  ; orig: C - - - - - 0x01E786 07:E776: E0 00     CPX #con_item_sword
    BNE     bra_E76A             ; BNE  ; orig: C - - - - - 0x01E788 07:E778: D0 F0     BNE bra_E76A
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01E78A 07:E77A: C9 02     CMP #$02
    BNE     bra_E76A             ; BNE  ; orig: C - - - - - 0x01E78C 07:E77C: D0 EC     BNE bra_E76A
    MOVE.B  #$20,D2  ; orig: C - - - - - 0x01E78E 07:E77E: A0 20     LDY #$20
    JMP     loc_E76A  ; orig: C - - - - - 0x01E790 07:E780: 4C 6A E7  JMP loc_E76A



bra_E783:  ; orig: bra_E783:
    MOVE.B  #con_item_potion,D1  ; orig: - - - - - - 0x01E793 07:E783: A2 07     LDX #con_item_potion
    MOVE.B  D1,ram_item_slot_index  ; orig: - - - - - - 0x01E795 07:E785: 8E 56 06  STX ram_item_slot_in
    BNE     bra_E7A0             ; BNE  ; orig: - - - - - - 0x01E798 07:E788: D0 16     BNE bra_E7A0    ; jm



loc_E78A:  ; orig: loc_E78A:
sub_E78A:  ; orig: sub_E78A:
sub_0x01E79A:  ; orig: sub_0x01E79A:
    MOVE.B  ram_item_slot_index,D1  ; orig: C D 3 - - - 0x01E79A 07:E78A: AE 56 06  LDX ram_item_slot_in
    BEQ     bra_E7B5_check_boomerangs             ; BEQ  ; orig: C - - - - - 0x01E79D 07:E78D: F0 26     BEQ bra_E7B5_check_b
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E79F 07:E78F: BD 57 06  LDA ram_items,X
    BEQ     bra_E7EE             ; BEQ  ; orig: C - - - - - 0x01E7A2 07:E792: F0 5A     BEQ bra_E7EE
    CMPI.B  #con_item_letter,D1  ; orig: C - - - - - 0x01E7A4 07:E794: E0 0F     CPX #con_item_letter
    BNE     bra_E7A0             ; BNE  ; orig: C - - - - - 0x01E7A6 07:E796: D0 08     BNE bra_E7A0
    MOVE.B  ram_item_potion,D2  ; orig: C - - - - - 0x01E7A8 07:E798: AC 5E 06  LDY ram_item_potion
    BNE     bra_E783             ; BNE  ; orig: C - - - - - 0x01E7AB 07:E79B: D0 E6     BNE bra_E783
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01E7AD 07:E79D: 4A        LSR
    ORI.B   #$01,D0  ; orig: C - - - - - 0x01E7AE 07:E79E: 09 01     ORA #$01
bra_E7A0:  ; orig: bra_E7A0:
bra_E7A0_boomerang_found:  ; orig: bra_E7A0_boomerang_found:

; bzk optimize, useless STA, will be overwritten at 0x01E748
    MOVE.B  D0,ram_0004_t24_useless  ; orig: C - - - - - 0x01E7B0 07:E7A0: 85 04     STA ram_0004_t24_use
    MOVE.B  #$1F,D0  ; orig: C - - - - - 0x01E7B2 07:E7A2: A9 1F     LDA #$1F
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01E7B4 07:E7A4: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$7C,D0  ; orig: C - - - - - 0x01E7B6 07:E7A6: A9 7C     LDA #$7C
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01E7B8 07:E7A8: 85 00     STA ram_0000_t21_spr
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E7BA 07:E7AA: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E7BC 07:E7AC: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01782C             ; JSR -> BSR  ; orig: C - - - - - 0x01E7BF 07:E7AF: 20 1C B8  JSR sub_0x01782C
    JMP     loc_E7D7  ; orig: C - - - - - 0x01E7C2 07:E7B2: 4C D7 E7  JMP loc_E7D7
bra_E7B5_check_boomerangs:  ; orig: bra_E7B5_check_boomerangs:
    MOVE.B  #$1E,D1  ; orig: C - - - - - 0x01E7C5 07:E7B5: A2 1E     LDX #$1E
bra_E7B7_loop:
; con_item_boomerang   con_item_magic_boomerang
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E7C7 07:E7B7: BD 57 06  LDA ram_items,X
    BNE     bra_E7A0_boomerang_found             ; BNE  ; orig: C - - - - - 0x01E7CA 07:E7BA: D0 E4     BNE bra_E7A0_boomera
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01E7CC 07:E7BC: CA        DEX
    CMPI.B  #$1C,D1  ; orig: C - - - - - 0x01E7CD 07:E7BD: E0 1C     CPX #$1C
    BNE     bra_E7B7_loop             ; BNE  ; orig: C - - - - - 0x01E7CF 07:E7BF: D0 F6     BNE bra_E7B7_loop

; if not found
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01E7D1 07:E7C1: A2 00     LDX #$00
    JMP     loc_E7CB  ; orig: C - - - - - 0x01E7D3 07:E7C3: 4C CB E7  JMP loc_E7CB
bra_E7C6:  ; orig: bra_E7C6:
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E7D6 07:E7C6: BD 57 06  LDA ram_items,X
    BNE     bra_E7D7             ; BNE  ; orig: C - - - - - 0x01E7D9 07:E7C9: D0 0C     BNE bra_E7D7
bra_E7CB:  ; orig: bra_E7CB:
loc_E7CB:  ; orig: loc_E7CB:
    MOVE.B  D1,D0           ; TXA  ; orig: C D 3 - - - 0x01E7DB 07:E7CB: 8A        TXA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01E7DC 07:E7CC: A8        TAY
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E7DD 07:E7CD: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E7DF 07:E7CF: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01E7E2 07:E7D2: A9 02     LDA #$02
    BSR     sub_0x0177D8             ; JSR -> BSR  ; orig: C - - - - - 0x01E7E4 07:E7D4: 20 C8 B7  JSR sub_0x0177D8
bra_E7D7:  ; orig: bra_E7D7:
loc_E7D7:  ; orig: loc_E7D7:
    MOVE.B  #con_item_sword,D1  ; orig: C D 3 - - - 0x01E7E7 07:E7D7: A2 00     LDX #con_item_sword
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E7E9 07:E7D9: BD 57 06  LDA ram_items,X
    BEQ     bra_E847_RTS             ; BEQ  ; orig: C - - - - - 0x01E7EC 07:E7DC: F0 69     BEQ bra_E847_RTS
    MOVE.B  #$1F,D0  ; orig: C - - - - - 0x01E7EE 07:E7DE: A9 1F     LDA #$1F
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01E7F0 07:E7E0: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$94,D0  ; orig: C - - - - - 0x01E7F2 07:E7E2: A9 94     LDA #$94
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01E7F4 07:E7E4: 85 00     STA ram_0000_t21_spr
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E7F6 07:E7E6: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E7F8 07:E7E8: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x01782C  ; orig: C - - - - - 0x01E7FB 07:E7EB: 4C 1C B8  JMP loc_0x01782C
bra_E7EE:  ; orig: bra_E7EE:
    CMPI.B  #con_item_potion,D1  ; orig: C - - - - - 0x01E7FE 07:E7EE: E0 07     CPX #con_item_potion
    BNE     bra_E7C6             ; BNE  ; orig: C - - - - - 0x01E800 07:E7F0: D0 D4     BNE bra_E7C6
    MOVE.B  ram_item_letter,D0  ; orig: C - - - - - 0x01E802 07:E7F2: AD 66 06  LDA ram_item_letter
    BEQ     bra_E7CB             ; BEQ  ; orig: C - - - - - 0x01E805 07:E7F5: F0 D4     BEQ bra_E7CB
    MOVE.B  #con_item_letter,D1  ; orig: C - - - - - 0x01E807 07:E7F7: A2 0F     LDX #con_item_letter
    MOVE.B  D1,ram_item_slot_index  ; orig: C - - - - - 0x01E809 07:E7F9: 8E 56 06  STX ram_item_slot_in
    BNE     bra_E7C6             ; BNE  ; orig: C - - - - - 0x01E80C 07:E7FC: D0 C8     BNE bra_E7C6    ; jm
sub_E7FE:  ; orig: sub_E7FE:
    MOVE.B  ram_0505,D0  ; orig: C - - - - - 0x01E80E 07:E7FE: AD 05 05  LDA ram_0505
    BEQ     bra_E859_RTS             ; BEQ  ; orig: C - - - - - 0x01E811 07:E801: F0 56     BEQ bra_E859_RTS
    SUBQ.B  #1,ram_0506  ; orig: C - - - - - 0x01E813 07:E803: CE 06 05  DEC ram_0506
    BEQ     bra_E848             ; BEQ  ; orig: C - - - - - 0x01E816 07:E806: F0 40     BEQ bra_E848

; when link picks up an item
    MOVE.B  #con_obj_state_freeze,D0  ; orig: C - - - - - 0x01E818 07:E808: A9 40     LDA #con_obj_state_f
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01E81A 07:E80A: 85 AC     STA ram_state_link
loc_0x01E81C:  ; orig: loc_0x01E81C:
    MOVE.B  ram_pos_X_link,D0  ; orig: C D 3 - - - 0x01E81C 07:E80C: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x01E81E 07:E80E: 85 83     STA ram_0083
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01E820 07:E810: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01E822 07:E812: 38        SEC
    SUBX.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x01E823 07:E813: E9 10     SBC #$10
    MOVE.B  D0,ram_0097  ; orig: C - - - - - 0x01E825 07:E815: 85 97     STA ram_0097
sub_0x01E827:  ; orig: sub_0x01E827:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01E827 07:E817: A2 00     LDX #$00
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01E829 07:E819: 20 93 FA  JSR sub_FA93

; A = 00
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01E82C 07:E81C: 20 88 79  JSR sub_bat_7988_set

; A = 00
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01E82F 07:E81F: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$48,D0  ; orig: C - - - - - 0x01E831 07:E821: A9 48     LDA #$48
    MOVE.B  D0,ram_spr_index_1  ; orig: C - - - - - 0x01E833 07:E823: 8D 43 03  STA ram_spr_index_1
    MOVE.B  #$4C,D0  ; orig: C - - - - - 0x01E836 07:E826: A9 4C     LDA #$4C
    MOVE.B  D0,ram_spr_index_2  ; orig: C - - - - - 0x01E838 07:E828: 8D 44 03  STA ram_spr_index_2
    MOVE.B  #$21,D2  ; orig: C - - - - - 0x01E83B 07:E82B: A0 21     LDY #$21
    BSR     sub_bat_792C             ; JSR -> BSR  ; orig: C - - - - - 0x01E83D 07:E82D: 20 2C 79  JSR sub_bat_792C
    ADDQ.B  #1,ram_0504  ; orig: C - - - - - 0x01E840 07:E830: EE 04 05  INC ram_0504
    MOVE.B  ram_0505,D0  ; orig: C - - - - - 0x01E843 07:E833: AD 05 05  LDA ram_0505
    MOVE.B  #$13,D1  ; orig: C - - - - - 0x01E846 07:E836: A2 13     LDX #$13
    BSR     sub_E70E             ; JSR -> BSR  ; orig: C - - - - - 0x01E848 07:E838: 20 0E E7  JSR sub_E70E
    SUBQ.B  #1,ram_0504  ; orig: C - - - - - 0x01E84B 07:E83B: CE 04 05  DEC ram_0504
    MOVE.B  ram_0052,D0  ; orig: C - - - - - 0x01E84E 07:E83E: A5 52     LDA ram_0052
    BEQ     bra_E847_RTS             ; BEQ  ; orig: C - - - - - 0x01E850 07:E840: F0 05     BEQ bra_E847_RTS
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01E852 07:E842: A9 08     LDA #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E854 07:E844: 8D 4D 02  STA ram_spr_T + $4C
bra_E847_RTS:  ; orig: bra_E847_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01E857 07:E847: 60        RTS
bra_E848:  ; orig: bra_E848:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E858 07:E848: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01E85A 07:E84A: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_0505  ; orig: C - - - - - 0x01E85C 07:E84C: 8D 05 05  STA ram_0505
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x01E85F 07:E84F: A4 10     LDY ram_dungeon_leve
    BEQ     bra_E859_RTS             ; BEQ  ; orig: C - - - - - 0x01E861 07:E851: F0 06     BEQ bra_E859_RTS    

; if dungeon
    MOVE.B  tbl_EBE0_gameplay_music(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01E863 07:E853: B9 E0 EB  LDA tbl_EBE0_gamepla
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x01E866 07:E856: 8D 00 06  STA ram_music
bra_E859_RTS:  ; orig: bra_E859_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01E869 07:E859: 60        RTS



sub_0x01E86A_get_enemy_id_from_current_map_location:  ; orig: sub_0x01E86A_get_enemy_id_from_current_map_location:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01E86A 07:E85A: A4 EB     LDY ram_map_location
    MOVE.B  ram_69FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01E86C 07:E85C: B9 FE 69  LDA ram_69FE_map_dat
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x01E86F 07:E85F: 29 3F     AND #$3F
    RTS                     ; RTS  ; orig: C - - - - - 0x01E871 07:E861: 60        RTS



sub_0x01E872_bomb_blasts_breakable_wall:  ; orig: sub_0x01E872_bomb_blasts_breakable_wall:

; in

; A = position?

; triggers when bomb is exploding near breakable wall
    MOVE.B  D0,ram_0005_t07  ; orig: C - - - - - 0x01E872 07:E862: 85 05     STA ram_0005_t07
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01E874 07:E864: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01E875 07:E865: 48        PHA
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E876 07:E866: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0003_t07_pos_X  ; orig: C - - - - - 0x01E878 07:E868: 85 03     STA ram_0003_t07_pos
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01E87A 07:E86A: B5 84     LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0002_t18_pos_Y  ; orig: C - - - - - 0x01E87C 07:E86C: 85 02     STA ram_0002_t18_pos
    BSR     sub_bat_7570             ; JSR -> BSR  ; orig: C - - - - - 0x01E87E 07:E86E: 20 70 75  JSR sub_bat_7570
    MOVE.B  ram_0301_buffer_index,D1  ; orig: C - - - - - 0x01E881 07:E871: AE 01 03  LDX ram_0301_buffer_
    MOVE.B  ram_0000_t6D,D0  ; orig: C - - - - - 0x01E884 07:E874: A5 00     LDA ram_0000_t6D
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01E886 07:E876: 9D 02 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E889 07:E879: 9D 07 03  STA ram_0302_ppu_buf
    MOVE.B  ram_0001_t16,D0  ; orig: C - - - - - 0x01E88C 07:E87C: A5 01     LDA ram_0001_t16
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E88E 07:E87E: 9D 03 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E891 07:E881: 9D 08 03  STA ram_0302_ppu_buf
    ; (empty translation for INC)  ; orig: C - - - - - 0x01E894 07:E884: FE 08 03  INC ram_0302_ppu_buf
    MOVE.B  ram_0005_t07,D0  ; orig: C - - - - - 0x01E897 07:E887: A5 05     LDA ram_0005_t07
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E899 07:E889: 9D 05 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E89C 07:E88C: 9D 06 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E89F 07:E88F: 9D 0A 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8A2 07:E892: 9D 0B 03  STA ram_0302_ppu_buf
    CMPI.B  #$46,D0  ; orig: C - - - - - 0x01E8A5 07:E895: C9 46     CMP #$46
    BCS     bra_E897_bcc_not_taken
    JMP     bra_E8AC
bra_E897_bcc_not_taken:
    CMPI.B  #$F3,D0  ; orig: C - - - - - 0x01E8A9 07:E899: C9 F3     CMP #$F3
    BCC     bra_E89B_bcs_not_taken
    JMP     bra_E8AC
bra_E89B_bcs_not_taken:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01E8AD 07:E89D: 18        CLC
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01E8AE 07:E89E: 69 02     ADC #$02
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8B0 07:E8A0: 9D 0A 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8B3 07:E8A3: 9D 0B 03  STA ram_0302_ppu_buf
    ; (empty translation for INC)  ; orig: C - - - - - 0x01E8B6 07:E8A6: FE 06 03  INC ram_0302_ppu_buf
    ; (empty translation for INC)  ; orig: C - - - - - 0x01E8B9 07:E8A9: FE 0B 03  INC ram_0302_ppu_buf
bra_E8AC:  ; orig: bra_E8AC:
    MOVE.B  #$82,D0  ; orig: C - - - - - 0x01E8BC 07:E8AC: A9 82     LDA #$82
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8BE 07:E8AE: 9D 04 03  STA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8C1 07:E8B1: 9D 09 03  STA ram_0302_ppu_buf
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01E8C4 07:E8B4: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x01E8C6 07:E8B6: 9D 0C 03  STA ram_0302_ppu_buf
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01E8C9 07:E8B9: 8A        TXA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01E8CA 07:E8BA: 18        CLC
    ADDX.B  #$0A,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01E8CB 07:E8BB: 69 0A     ADC #$0A
    MOVE.B  D0,ram_0301_buffer_index  ; orig: C - - - - - 0x01E8CD 07:E8BD: 8D 01 03  STA ram_0301_buffer_
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01E8D0 07:E8C0: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01E8D1 07:E8C1: AA        TAX
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E8D2 07:E8C2: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E8D4 07:E8C4: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x016BD4             ; JSR -> BSR  ; orig: C - - - - - 0x01E8D7 07:E8C7: 20 C4 AB  JSR sub_0x016BD4
    MOVE.B  ram_00F7_flag,D0  ; orig: C - - - - - 0x01E8DA 07:E8CA: A5 F7     LDA ram_00F7_flag
    BEQ     bra_E8D3             ; BEQ  ; orig: C - - - - - 0x01E8DC 07:E8CC: F0 05     BEQ bra_E8D3
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01E8DE 07:E8CE: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E8E0 07:E8D0: 20 AC FF  JSR sub_FFAC_prg_ban
bra_E8D3:  ; orig: bra_E8D3:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01E8E3 07:E8D3: A9 00     LDA #$00
    MOVE.B  D0,ram_00F7_flag  ; orig: C - - - - - 0x01E8E5 07:E8D5: 85 F7     STA ram_00F7_flag
    RTS                     ; RTS  ; orig: C - - - - - 0x01E8E7 07:E8D7: 60        RTS



sub_0x01E8E8:  ; orig: sub_0x01E8E8:
loc_0x01E8E8:  ; orig: loc_0x01E8E8:

; in

; ram_000A_t05_tile

; 24 =

; F6 =
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C D 3 - - - 0x01E8E8 07:E8D8: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E8EA 07:E8DA: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x016C17_set_block_address_pointer             ; JSR -> BSR  ; orig: C - - - - - 0x01E8ED 07:E8DD: 20 07 AC  JSR sub_0x016C17_set
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01E8F0 07:E8E0: A0 00     LDY #$00
bra_E8E2_loop:  ; orig: bra_E8E2_loop:
    MOVE.B  ram_000A_t05_tile,D0  ; orig: C - - - - - 0x01E8F2 07:E8E2: A5 0A     LDA ram_000A_t05_til
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x01E8F4 07:E8E4: 91 00     STA (ram_0000_t03_bl
    BSR     sub_bat_7274_inc_0000_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x01E8F6 07:E8E6: 20 74 72  JSR sub_bat_7274_inc
    MOVE.B  ram_0000_t03_block_address,D0  ; orig: C - - - - - 0x01E8F9 07:E8E9: A5 00     LDA ram_0000_t03_blo
    CMPI.B  #< (ram_6530 + $2C0),D0  ; orig: C - - - - - 0x01E8FB 07:E8EB: C9 F0     CMP #< (ram_6530 + $
    BNE     bra_E8E2_loop             ; BNE  ; orig: C - - - - - 0x01E8FD 07:E8ED: D0 F3     BNE bra_E8E2_loop
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01E8FF 07:E8EF: A5 01     LDA ram_0000_t03_blo
    CMPI.B  #> (ram_6530 + $2C0),D0  ; orig: C - - - - - 0x01E901 07:E8F1: C9 67     CMP #> (ram_6530 + $
    BNE     bra_E8E2_loop             ; BNE  ; orig: C - - - - - 0x01E903 07:E8F3: D0 ED     BNE bra_E8E2_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01E905 07:E8F5: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01E906 07:E8F6: FF        .byte $FF, $FF   ;



sub_E8F8_main_script_handler_1:  ; orig: sub_E8F8_main_script_handler_1:
    MOVE.W  #$0310,D0
    BSR     TRACE_MARK
    MOVE.B  ram_00F4_flag,D0  ; orig: C - - - - - 0x01E908 07:E8F8: A5 F4     LDA ram_00F4_flag
    BNE     bra_E919             ; BNE  ; orig: C - - - - - 0x01E90A 07:E8FA: D0 1D     BNE bra_E919
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01E90C 07:E8FC: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E90E 07:E8FE: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.W  #$0311,D0
    BSR     TRACE_MARK
    BSR     sub_0x004D10_copy_code_data_to_battery             ; JSR -> BSR  ; orig: C - - - - - 0x01E911 07:E901: 20 00 8D  JSR sub_0x004D10_cop
    MOVE.B  #con_prg_bank + $06,D0  ; orig: C - - - - - 0x01E914 07:E904: A9 06     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E916 07:E906: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.W  #$0312,D0
    BSR     TRACE_MARK
    BSR     sub_0x01809C             ; JSR -> BSR  ; orig: C - - - - - 0x01E919 07:E909: 20 8C 80  JSR sub_0x01809C
    MOVE.B  #$5A,D0  ; orig: C - - - - - 0x01E91C 07:E90C: A9 5A     LDA #$5A
    MOVE.B  D0,ram_battery_check_1  ; orig: C - - - - - 0x01E91E 07:E90E: 8D 01 60  STA ram_battery_chec
    MOVE.B  #$A5,D0  ; orig: C - - - - - 0x01E921 07:E911: A9 A5     LDA #$A5
    MOVE.B  D0,ram_battery_check_2  ; orig: C - - - - - 0x01E923 07:E913: 8D FF 7F  STA ram_battery_chec
    ADDQ.B  #1,ram_00F4_flag  ; orig: C - - - - - 0x01E926 07:E916: E6 F4     INC ram_00F4_flag   
    MOVE.W  #$0313,D0
    BSR     TRACE_MARK
    RTS                     ; RTS  ; orig: C - - - - - 0x01E928 07:E918: 60        RTS
bra_E919:  ; orig: bra_E919:
    MOVE.W  #$0314,D0
    BSR     TRACE_MARK
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01E929 07:E919: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E92B 07:E91B: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.W  #$0315,D0
    BSR     TRACE_MARK
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01E92E 07:E91E: A5 12     LDA ram_script

; see con_script
    MOVE.W  #$0316,D0
    BSR     TRACE_MARK
    MOVE.B  ram_script,D0  ; restore the byte index after TRACE_MARK wrote its checkpoint id into D0
    TST.B   D0
    BNE     bra_E920_dispatch_via_table
    MOVE.W  #$0420,D0
    BSR     TRACE_MARK
    BSR     ofs_main_script_1_E94B_00_title_screen
    MOVE.W  #$0421,D0
    BSR     TRACE_MARK
    RTS
bra_E920_dispatch_via_table:
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01E930 07:E920: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_main_script_1_E94B_00_title_screen
    DC.L    ofs_main_script_1_E96F_01_slot_selection
    DC.L    ofs_main_script_1_E977_02
    DC.L    ofs_main_script_1_E9D8_03
    DC.L    ofs_main_script_1_0x01478B_04
    DC.L    ofs_main_script_1_EA6B_05
    DC.L    ofs_main_script_1_0x01708A_06
    DC.L    ofs_main_script_1_E9A1_07
    DC.L    ofs_main_script_1_0x014610_08_prepare_save_menu
    DC.L    ofs_main_script_1_0x01511A_09
    DC.L    ofs_main_script_1_0x01710C_0A
    DC.L    ofs_main_script_1_0x015090_0B
    DC.L    ofs_main_script_1_0x0150A7_0C
    DC.L    ofs_main_script_1_0x01462A_0D
    DC.L    ofs_main_script_1_E9C3_0E_register
    DC.L    ofs_main_script_1_E9C3_0F_elimination
    DC.L    ofs_main_script_1_0x014638_10
    DC.L    ofs_main_script_1_0x014A3F_11_death
    DC.L    ofs_main_script_1_0x016843_12_triforce_collected
    DC.L    ofs_main_script_1_E9CB_13_final_credits



ofs_main_script_1_E94B_00_title_screen:  ; orig: ofs_main_script_1_E94B_00_title_screen:
    MOVE.W  #$0320,D0
    BSR     TRACE_MARK

; con_script_title_screen
    MOVE.B  ram_00F5_reset_check_5A,D0  ; orig: C - - J - - 0x01E95B 07:E94B: A5 F5     LDA ram_00F5_reset_c
    CMPI.B  #$5A,D0  ; orig: C - - - - - 0x01E95D 07:E94D: C9 5A     CMP #$5A
    BEQ     bra_E959             ; BEQ  ; orig: C - - - - - 0x01E95F 07:E94F: F0 08     BEQ bra_E959
    MOVE.W  #$0321,D0
    BSR     TRACE_MARK
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - - - - 0x01E961 07:E951: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E963 07:E953: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.W  #$0322,D0
    BSR     TRACE_MARK
    MOVE.W  #$0323,D0
    BSR     TRACE_MARK
    JMP     loc_0x008022_fill_ppu_with_tiles_1  ; orig: C - - - - - 0x01E966 07:E956: 4C 12 80  JMP loc_0x008022_fil
bra_E959:  ; orig: bra_E959:
    MOVE.B  ram_00F6_reset_check_A5,D0  ; orig: C - - - - - 0x01E969 07:E959: A5 F6     LDA ram_00F6_reset_c
    CMPI.B  #$A5,D0  ; orig: C - - - - - 0x01E96B 07:E95B: C9 A5     CMP #$A5
    BEQ     bra_E967             ; BEQ  ; orig: C - - - - - 0x01E96D 07:E95D: F0 08     BEQ bra_E967
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01E96F 07:E95F: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E971 07:E961: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004D57_fill_ppu_with_tiles_2  ; orig: C - - - - - 0x01E974 07:E964: 4C 47 8D  JMP loc_0x004D57_fil
bra_E967:  ; orig: bra_E967:
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - - - - 0x01E977 07:E967: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E979 07:E969: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x009010  ; orig: C - - - - - 0x01E97C 07:E96C: 4C 00 90  JMP loc_0x009010



ofs_main_script_1_E96F_01_slot_selection:  ; orig: ofs_main_script_1_E96F_01_slot_selection:

; con_script_slot_selection
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - J - - 0x01E97F 07:E96F: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E981 07:E971: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x00A29A  ; orig: C - - - - - 0x01E984 07:E974: 4C 8A A2  JMP loc_0x00A29A



ofs_main_script_1_E977_02:  ; orig: ofs_main_script_1_E977_02:

; con_script_02
    BSR     sub_E625_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - J - - 0x01E987 07:E977: 20 25 E6  JSR sub_E625_disable
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x01E98A 07:E97A: A5 13     LDA ram_subscript
    BNE     bra_E999             ; BNE  ; orig: C - - - - - 0x01E98C 07:E97C: D0 1B     BNE bra_E999
    BSR     sub_EA00_clear_room_history             ; JSR -> BSR  ; orig: C - - - - - 0x01E98E 07:E97E: 20 00 EA  JSR sub_EA00_clear_r

; bzk optimize, code expects A = 00 here from EA00
    MOVE.B  #$7F,D2  ; orig: C - - - - - 0x01E991 07:E981: A0 7F     LDY #$7F
bra_E983_loop:  ; orig: bra_E983_loop:
    MOVE.B  D0,ram_0560(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01E993 07:E983: 99 60 05  STA ram_0560,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01E996 07:E986: 88        DEY
    BPL     bra_E983_loop             ; BPL  ; orig: C - - - - - 0x01E997 07:E987: 10 FA     BPL bra_E983_loop
    MOVE.B  #con_prg_bank + $03,D0  ; orig: C - - - - - 0x01E999 07:E989: A9 03     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E99B 07:E98B: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x00C054_fill_ppu_with_tiles_3             ; JSR -> BSR  ; orig: C - - - - - 0x01E99E 07:E98E: 20 44 80  JSR sub_0x00C054_fil
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01E9A1 07:E991: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9A3 07:E993: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x004D10_copy_code_data_to_battery             ; JSR -> BSR  ; orig: C - - - - - 0x01E9A6 07:E996: 20 00 8D  JSR sub_0x004D10_cop
bra_E999:  ; orig: bra_E999:
    MOVE.B  #con_prg_bank + $06,D0  ; orig: C - - - - - 0x01E9A9 07:E999: A9 06     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9AB 07:E99B: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x01804E  ; orig: C - - - - - 0x01E9AE 07:E99E: 4C 3E 80  JMP loc_0x01804E



ofs_main_script_1_E9A1_07:  ; orig: ofs_main_script_1_E9A1_07:

; con_script_screen_trans_in_prog
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01E9B1 07:E9A1: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9B3 07:E9A3: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0142B8             ; JSR -> BSR  ; orig: C - - - - - 0x01E9B6 07:E9A6: 20 A8 82  JSR sub_0x0142B8
    MOVE.B  ram_screen_transition_flag,D0  ; orig: C - - - - - 0x01E9B9 07:E9A9: A5 E3     LDA ram_screen_trans
    BNE     bra_E9AB_beq_not_taken
    JMP     bra_E9C2_RTS
bra_E9AB_beq_not_taken:

; if transition is ON
    MOVE.B  ram_prev_screen_transition_flag,D0  ; orig: C - - - - - 0x01E9BD 07:E9AD: A5 F3     LDA ram_prev_screen_
    BEQ     bra_E9AF_bne_not_taken
    JMP     bra_E9C2_RTS
bra_E9AF_bne_not_taken:
    ADDQ.B  #1,ram_prev_screen_transition_flag  ; orig: C - - - - - 0x01E9C1 07:E9B1: E6 F3     INC ram_prev_screen_
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01E9C3 07:E9B3: A5 98     LDA ram_dir_link
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01E9C5 07:E9B5: C9 04     CMP #$04
    BCC     bra_E9BD             ; BCC  ; orig: C - - - - - 0x01E9C7 07:E9B7: 90 04     BCC bra_E9BD
    MOVE.B  #con_mirroring_H,D0  ; orig: C - - - - - 0x01E9C9 07:E9B9: A9 0F     LDA #con_mirroring_H
    BNE     bra_E9BF             ; BNE  ; orig: C - - - - - 0x01E9CB 07:E9BB: D0 02     BNE bra_E9BF    ; jm
bra_E9BD:  ; orig: bra_E9BD:
    MOVE.B  #con_mirroring_V,D0  ; orig: C - - - - - 0x01E9CD 07:E9BD: A9 0E     LDA #con_mirroring_V
bra_E9BF:  ; orig: bra_E9BF:

; bzk optimize, JMP
    BSR     sub_FF98_set_mirroring             ; JSR -> BSR  ; orig: C - - - - - 0x01E9CF 07:E9BF: 20 98 FF  JSR sub_FF98_set_mir
bra_E9C2_RTS:  ; orig: bra_E9C2_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01E9D2 07:E9C2: 60        RTS



ofs_main_script_1_E9C3_0E_register:  ; orig: ofs_main_script_1_E9C3_0E_register:

; con_script_register
ofs_main_script_1_E9C3_0F_elimination:  ; orig: ofs_main_script_1_E9C3_0F_elimination:

; con_script_elimination
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - J - - 0x01E9D3 07:E9C3: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9D5 07:E9C5: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x009E21  ; orig: C - - - - - 0x01E9D8 07:E9C8: 4C 11 9E  JMP loc_0x009E21



ofs_main_script_1_E9CB_13_final_credits:  ; orig: ofs_main_script_1_E9CB_13_final_credits:

; con_script_final_credits
    MOVE.B  #con_mirroring_H,D0  ; orig: C - - J - - 0x01E9DB 07:E9CB: A9 0F     LDA #con_mirroring_H
    BSR     sub_FF98_set_mirroring             ; JSR -> BSR  ; orig: C - - - - - 0x01E9DD 07:E9CD: 20 98 FF  JSR sub_FF98_set_mir
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - - - - 0x01E9E0 07:E9D0: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9E2 07:E9D2: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x00A910_final_credits_handler  ; orig: C - - - - - 0x01E9E5 07:E9D5: 4C 00 A9  JMP loc_0x00A910_fin



ofs_main_script_1_E9D8_03:  ; orig: ofs_main_script_1_E9D8_03:

; con_script_03
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01E9E8 07:E9D8: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01E9EA 07:E9DA: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_E625_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x01E9ED 07:E9DD: 20 25 E6  JSR sub_E625_disable
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x01E9F0 07:E9E0: A5 13     LDA ram_subscript
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01E9F2 07:E9E2: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_002_E9F7_00_clear_screen_and_room_history
    DC.L    ofs_002_EA11_01
    DC.L    ofs_002_0x017010_02
    DC.L    ofs_002_0x017019_03
    DC.L    ofs_002_0x017020_04
    DC.L    ofs_002_0x017026_05
    DC.L    ofs_002_0x01702D_06
    DC.L    ofs_002_0x01703A_07_draw_level_text
    DC.L    ofs_002_0x017046_08



ofs_002_E9F7_00_clear_screen_and_room_history:  ; orig: ofs_002_E9F7_00_clear_screen_and_room_history:
    MOVE.B  #$01,D0  ; orig: C - - J - - 0x01EA07 07:E9F7: A9 01     LDA #$01
    MOVE.B  D0,ram_0017_rendering_flag  ; orig: C - - - - - 0x01EA09 07:E9F9: 85 17     STA ram_0017_renderi
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01EA0B 07:E9FB: E6 13     INC ram_subscript
    BSR     sub_E46D_clear_screen             ; JSR -> BSR  ; orig: C - - - - - 0x01EA0D 07:E9FD: 20 6D E4  JSR sub_E46D_clear_s
sub_EA00_clear_room_history:  ; orig: sub_EA00_clear_room_history:
loc_0x01EA10_clear_room_history:  ; orig: loc_0x01EA10_clear_room_history:
    MOVE.B  #$05,D2  ; orig: C D 3 - - - 0x01EA10 07:EA00: A0 05     LDY #$05
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01EA12 07:EA02: A9 00     LDA #$00
    MOVE.B  D0,ram_0529  ; orig: C - - - - - 0x01EA14 07:EA04: 8D 29 05  STA ram_0529
bra_EA07_loop:  ; orig: bra_EA07_loop:
    MOVE.B  D0,ram_room_history(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01EA17 07:EA07: 99 21 06  STA ram_room_history
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EA1A 07:EA0A: 88        DEY
    BPL     bra_EA07_loop             ; BPL  ; orig: C - - - - - 0x01EA1B 07:EA0B: 10 FA     BPL bra_EA07_loop

; bzk some code expects A = 00 from here
    RTS                     ; RTS  ; orig: C - - - - - 0x01EA1D 07:EA0D: 60        RTS



tbl_EA0E_save_slot_index:  ; orig: tbl_EA0E_save_slot_index:
tbl_0x01EA1E_save_slot_index:  ; orig: tbl_0x01EA1E_save_slot_index:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01EA1E 07:EA0E: 00        .byte $00   ; 00 ram
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x01EA1F 07:EA0F: 04        .byte $04   ; 01 ram
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 3 - - - 0x01EA20 07:EA10: 08        .byte $08   ; 02 ram



ofs_002_EA11_01:  ; orig: ofs_002_EA11_01:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - J - - 0x01EA21 07:EA11: A5 10     LDA ram_dungeon_leve
    BNE     bra_EA1C             ; BNE  ; orig: C - - - - - 0x01EA23 07:EA13: D0 07     BNE bra_EA1C    ; if

; if overworld
    MOVE.B  ram_0526,D0  ; orig: C - - - - - 0x01EA25 07:EA15: AD 26 05  LDA ram_0526
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x01EA28 07:EA18: C9 FF     CMP #$FF
    BNE     bra_EA1F             ; BNE  ; orig: C - - - - - 0x01EA2A 07:EA1A: D0 03     BNE bra_EA1F
bra_EA1C:  ; orig: bra_EA1C:
    MOVE.B  ram_6BAD,D0  ; orig: C - - - - - 0x01EA2C 07:EA1C: AD AD 6B  LDA ram_6BAD
bra_EA1F:  ; orig: bra_EA1F:
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x01EA2F 07:EA1F: 85 EB     STA ram_map_location
    CMP.B   ram_0526,D0  ; orig: C - - - - - 0x01EA31 07:EA21: CD 26 05  CMP ram_0526
    BNE     bra_EA2B             ; BNE  ; orig: C - - - - - 0x01EA34 07:EA24: D0 05     BNE bra_EA2B
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01EA36 07:EA26: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0526  ; orig: C - - - - - 0x01EA38 07:EA28: 8D 26 05  STA ram_0526
bra_EA2B:  ; orig: bra_EA2B:
sub_0x01EA3B_set_tunic_color:  ; orig: sub_0x01EA3B_set_tunic_color:
loc_0x01EA3B_set_tunic_color:  ; orig: loc_0x01EA3B_set_tunic_color:
    MOVE.B  ram_current_save_slot,D1  ; orig: C D 3 - - - 0x01EA3B 07:EA2B: A6 16     LDX ram_current_save
    MOVE.B  tbl_EA0E_save_slot_index(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01EA3D 07:EA2D: BC 0E EA  LDY tbl_EA0E_save_sl
    MOVE.B  ram_6804_tunic_color(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EA40 07:EA30: B9 04 68  LDA ram_6804_tunic_c
    ; (empty translation for STA)  ; orig: C - - - - - 0x01EA43 07:EA33: 8D 92 6B  STA ram_6B7E_palette
    MOVE.B  #con_ppu_buf_overworld_palette,D0  ; orig: C - - - - - 0x01EA46 07:EA36: A9 18     LDA #con_ppu_buf_ove
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x01EA48 07:EA38: 85 14     STA ram_ppu_load_ind
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01EA4A 07:EA3A: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x01EA4C 07:EA3C: 60        RTS



sub_EA3D:  ; orig: sub_EA3D:
sub_0x01EA4D:  ; orig: sub_0x01EA4D:
loc_0x01EA4D:  ; orig: loc_0x01EA4D:
    BSR     sub_E5F7_hide_all_sprites             ; JSR -> BSR  ; orig: C D 3 - - - 0x01EA4D 07:EA3D: 20 F7 E5  JSR sub_E5F7_hide_al
    BSR     sub_bat_71DE_draw_dot_on_minimap             ; JSR -> BSR  ; orig: C - - - - - 0x01EA50 07:EA40: 20 DE 71  JSR sub_bat_71DE_dra
    BSR     sub_E679             ; JSR -> BSR  ; orig: C - - - - - 0x01EA53 07:EA43: 20 79 E6  JSR sub_E679
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EA56 07:EA46: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EA58 07:EA48: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014939             ; JSR -> BSR  ; orig: C - - - - - 0x01EA5B 07:EA4B: 20 29 89  JSR sub_0x014939
    JMP     loc_E78A  ; orig: C - - - - - 0x01EA5E 07:EA4E: 4C 8A E7  JMP loc_E78A



sub_0x01EA61:  ; orig: sub_0x01EA61:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01EA61 07:EA51: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01EA63 07:EA53: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_item_clock  ; orig: C - - - - - 0x01EA65 07:EA55: 8D 6C 06  STA ram_item_clock
    RTS                     ; RTS  ; orig: C - - - - - 0x01EA68 07:EA58: 60        RTS



tbl_EA59:  ; orig: tbl_EA59:
    ; [DIRECTIVE] .BYTE con_ppu_buf_08  -- needs manual handling  ; orig: - D 3 - - - 0x01EA69 07:EA59: 08        .byte con_ppu_buf_08
    ; [DIRECTIVE] .BYTE con_ppu_buf_36  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6A 07:EA5A: 36        .byte con_ppu_buf_36
    ; [DIRECTIVE] .BYTE con_ppu_buf_0A  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6B 07:EA5B: 0A        .byte con_ppu_buf_0A
    ; [DIRECTIVE] .BYTE con_ppu_buf_0A  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6C 07:EA5C: 0A        .byte con_ppu_buf_0A
    ; [DIRECTIVE] .BYTE con_ppu_buf_0A  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6D 07:EA5D: 0A        .byte con_ppu_buf_0A
    ; [DIRECTIVE] .BYTE con_ppu_buf_0A  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6E 07:EA5E: 0A        .byte con_ppu_buf_0A
    ; [DIRECTIVE] .BYTE con_ppu_buf_7C  -- needs manual handling  ; orig: - D 3 - - - 0x01EA6F 07:EA5F: 7C        .byte con_ppu_buf_7C
    ; [DIRECTIVE] .BYTE con_ppu_buf_7C  -- needs manual handling  ; orig: - D 3 - - - 0x01EA70 07:EA60: 7C        .byte con_ppu_buf_7C
    ; [DIRECTIVE] .BYTE con_ppu_buf_7C  -- needs manual handling  ; orig: - D 3 - - - 0x01EA71 07:EA61: 7C        .byte con_ppu_buf_7C



tbl_EA62:  ; orig: tbl_EA62:
    ; [DIRECTIVE] .BYTE con_obj_id_3D  -- needs manual handling  ; orig: - D 3 - - - 0x01EA72 07:EA62: 3D        .byte con_obj_id_3D 
    ; [DIRECTIVE] .BYTE con_obj_id_3E  -- needs manual handling  ; orig: - D 3 - - - 0x01EA73 07:EA63: 3E        .byte con_obj_id_3E 
    ; [DIRECTIVE] .BYTE con_obj_id_38  -- needs manual handling  ; orig: - D 3 - - - 0x01EA74 07:EA64: 38        .byte con_obj_id_38 
    ; [DIRECTIVE] .BYTE con_obj_id_39  -- needs manual handling  ; orig: - D 3 - - - 0x01EA75 07:EA65: 39        .byte con_obj_id_39 
    ; [DIRECTIVE] .BYTE con_obj_id_32  -- needs manual handling  ; orig: - D 3 - - - 0x01EA76 07:EA66: 32        .byte con_obj_id_32 
    ; [DIRECTIVE] .BYTE con_obj_id_31  -- needs manual handling  ; orig: - D 3 - - - 0x01EA77 07:EA67: 31        .byte con_obj_id_31 
    ; [DIRECTIVE] .BYTE con_obj_id_43  -- needs manual handling  ; orig: - D 3 - - - 0x01EA78 07:EA68: 43        .byte con_obj_id_43 
    ; [DIRECTIVE] .BYTE con_obj_id_44  -- needs manual handling  ; orig: - D 3 - - - 0x01EA79 07:EA69: 44        .byte con_obj_id_44 
    ; [DIRECTIVE] .BYTE con_obj_id_45  -- needs manual handling  ; orig: - D 3 - - - 0x01EA7A 07:EA6A: 45        .byte con_obj_id_45 



ofs_main_script_1_EA6B_05:  ; orig: ofs_main_script_1_EA6B_05:

; con_script_05_gameplay
    BSR     sub_EA3D             ; JSR -> BSR  ; orig: C - - J - - 0x01EA7B 07:EA6B: 20 3D EA  JSR sub_EA3D
    BSR     sub_F23C             ; JSR -> BSR  ; orig: C - - - - - 0x01EA7E 07:EA6E: 20 3C F2  JSR sub_F23C
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EA81 07:EA71: A5 10     LDA ram_dungeon_leve
    BEQ     bra_EA89             ; BEQ  ; orig: C - - - - - 0x01EA83 07:EA73: F0 14     BEQ bra_EA89    ; if

; if dungeon
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x01EA85 07:EA75: A0 08     LDY #$08
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x01EA87 07:EA77: AD 50 03  LDA ram_obj_id_enemy
bra_EA7A_loop:  ; orig: bra_EA7A_loop:
    CMP.B   tbl_EA62(D2.L),D0  ; orig: C - - - - - 0x01EA8A 07:EA7A: D9 62 EA  CMP tbl_EA62,Y
    BNE     bra_EA84             ; BNE  ; orig: C - - - - - 0x01EA8D 07:EA7D: D0 05     BNE bra_EA84
    MOVE.B  tbl_EA59(D2.L),D1  ; LDX abs,Y  ; orig: C - - - - - 0x01EA8F 07:EA7F: BE 59 EA  LDX tbl_EA59,Y
    BNE     bra_EAC9             ; BNE  ; orig: C - - - - - 0x01EA92 07:EA82: D0 45     BNE bra_EAC9    ; jm
bra_EA84:  ; orig: bra_EA84:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EA94 07:EA84: 88        DEY
    BPL     bra_EA7A_loop             ; BPL  ; orig: C - - - - - 0x01EA95 07:EA85: 10 F3     BPL bra_EA7A_loop
    BMI     bra_EABC             ; BMI  ; orig: C - - - - - 0x01EA97 07:EA87: 30 33     BMI bra_EABC    ; jm
bra_EA89:  ; orig: bra_EA89:
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01EA99 07:EA89: A5 EB     LDA ram_map_location
    CMPI.B  #con_map_location + $0F,D0  ; orig: C - - - - - 0x01EA9B 07:EA8B: C9 0F     CMP #con_map_locatio
    BNE     bra_EA98             ; BNE  ; orig: C - - - - - 0x01EA9D 07:EA8D: D0 09     BNE bra_EA98
    MOVE.B  ram_005A,D0  ; orig: C - - - - - 0x01EA9F 07:EA8F: A5 5A     LDA ram_005A
    BNE     bra_EA98             ; BNE  ; orig: C - - - - - 0x01EAA1 07:EA91: D0 05     BNE bra_EA98
    MOVE.B  #con_sfx_2_secret_found,D0  ; orig: C - - - - - 0x01EAA3 07:EA93: A9 04     LDA #con_sfx_2_secre
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x01EAA5 07:EA95: 8D 02 06  STA ram_sfx_2
bra_EA98:  ; orig: bra_EA98:
    MOVE.B  #con_ppu_buf_20,D1  ; orig: C - - - - - 0x01EAA8 07:EA98: A2 20     LDX #con_ppu_buf_20
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01EAAA 07:EA9A: AD 5A 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_65,D0  ; orig: C - - - - - 0x01EAAD 07:EA9D: C9 65     CMP #con_obj_id_65
    BEQ     bra_EAC9             ; BEQ  ; orig: C - - - - - 0x01EAAF 07:EA9F: F0 28     BEQ bra_EAC9
    CMPI.B  #con_obj_id_66,D0  ; orig: C - - - - - 0x01EAB1 07:EAA1: C9 66     CMP #con_obj_id_66
    BEQ     bra_EAAB             ; BEQ  ; orig: C - - - - - 0x01EAB3 07:EAA3: F0 06     BEQ bra_EAAB
    CMPI.B  #con_obj_id_62,D0  ; orig: C - - - - - 0x01EAB5 07:EAA5: C9 62     CMP #con_obj_id_62
    BNE     bra_EAB8             ; BNE  ; orig: C - - - - - 0x01EAB7 07:EAA7: D0 0F     BNE bra_EAB8
    MOVE.B  #con_ppu_buf_24,D1  ; orig: C - - - - - 0x01EAB9 07:EAA9: A2 24     LDX #con_ppu_buf_24
bra_EAAB:  ; orig: bra_EAAB:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01EABB 07:EAAB: A4 EB     LDY ram_map_location
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EABD 07:EAAD: B9 FE 68  LDA ram_68FE_map_dat
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x01EAC0 07:EAB0: 29 01     AND #$01
    BNE     bra_EAC9             ; BNE  ; orig: C - - - - - 0x01EAC2 07:EAB2: D0 15     BNE bra_EAC9
    MOVE.B  #con_ppu_buf_22,D1  ; orig: - - - - - - 0x01EAC4 07:EAB4: A2 22     LDX #con_ppu_buf_22
    BNE     bra_EAC9             ; BNE  ; orig: - - - - - - 0x01EAC6 07:EAB6: D0 11     BNE bra_EAC9    ; jm
bra_EAB8:  ; orig: bra_EAB8:
    MOVE.B  #con_ppu_buf_7A,D1  ; orig: C - - - - - 0x01EAC8 07:EAB8: A2 7A     LDX #con_ppu_buf_7A
    BNE     bra_EAC9             ; BNE  ; orig: C - - - - - 0x01EACA 07:EABA: D0 0D     BNE bra_EAC9    ; jm
bra_EABC:  ; orig: bra_EABC:
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01EACC 07:EABC: A0 03     LDY #$03
bra_EABE_loop:  ; orig: bra_EABE_loop:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01EACE 07:EABE: B9 9D 6B  LDA ram_6B7E_palette
    MOVE.B  D0,ram_6817(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01EAD1 07:EAC1: 99 17 68  STA ram_6817,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EAD4 07:EAC4: 88        DEY
    BPL     bra_EABE_loop             ; BPL  ; orig: C - - - - - 0x01EAD5 07:EAC5: 10 F7     BPL bra_EABE_loop
    MOVE.B  #con_ppu_buf_06,D1  ; orig: C - - - - - 0x01EAD7 07:EAC7: A2 06     LDX #con_ppu_buf_06
bra_EAC9:  ; orig: bra_EAC9:
    MOVE.B  D1,ram_ppu_load_index  ; orig: C - - - - - 0x01EAD9 07:EAC9: 86 14     STX ram_ppu_load_ind
sub_0x01EADB:  ; orig: sub_0x01EADB:
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EADB 07:EACB: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EADD 07:EACD: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01706E             ; JSR -> BSR  ; orig: C - - - - - 0x01EAE0 07:EAD0: 20 5E B0  JSR sub_0x01706E
sub_0x01EAE3:  ; orig: sub_0x01EAE3:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EAE3 07:EAD3: A5 10     LDA ram_dungeon_leve
    BEQ     bra_EADD             ; BEQ  ; orig: C - - - - - 0x01EAE5 07:EAD5: F0 06     BEQ bra_EADD    ; if

; if dungeon
    BSR     sub_E6C6_set_map_bit5             ; JSR -> BSR  ; orig: C - - - - - 0x01EAE7 07:EAD7: 20 C6 E6  JSR sub_E6C6_set_map
    BSR     sub_bat_7512             ; JSR -> BSR  ; orig: C - - - - - 0x01EAEA 07:EADA: 20 12 75  JSR sub_bat_7512
bra_EADD:  ; orig: bra_EADD:
sub_0x01EAED:  ; orig: sub_0x01EAED:
loc_0x01EAED:  ; orig: loc_0x01EAED:
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C D 3 - - - 0x01EAED 07:EADD: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EAEF 07:EADF: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01784A             ; JSR -> BSR  ; orig: C - - - - - 0x01EAF2 07:EAE2: 20 3A B8  JSR sub_0x01784A
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01EAF5 07:EAE5: A0 00     LDY #$00
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x01EAF7 07:EAE7: A2 05     LDX #$05
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01EAF9 07:EAE9: A5 EB     LDA ram_map_location
bra_EAEB_loop:  ; orig: bra_EAEB_loop:
    CMP.B   ram_room_history(D1.L),D0  ; orig: C - - - - - 0x01EAFB 07:EAEB: DD 21 06  CMP ram_room_history
    BNE     bra_EAF1_no_match             ; BNE  ; orig: C - - - - - 0x01EAFE 07:EAEE: D0 01     BNE bra_EAF1_no_matc
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01EB00 07:EAF0: C8        INY
bra_EAF1_no_match:  ; orig: bra_EAF1_no_match:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01EB01 07:EAF1: CA        DEX
    BPL     bra_EAEB_loop             ; BPL  ; orig: C - - - - - 0x01EB02 07:EAF2: 10 F7     BPL bra_EAEB_loop
    CMPI.B  #$00,D2  ; orig: C - - - - - 0x01EB04 07:EAF4: C0 00     CPY #$00
    BNE     bra_EB0D             ; BNE  ; orig: C - - - - - 0x01EB06 07:EAF6: D0 15     BNE bra_EB0D
    MOVE.B  ram_history_id,D1  ; orig: C - - - - - 0x01EB08 07:EAF8: AE 20 06  LDX ram_history_id
    MOVE.B  D0,ram_room_history(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EB0B 07:EAFB: 9D 21 06  STA ram_room_history
    ADDQ.B  #1,ram_history_id  ; orig: C - - - - - 0x01EB0E 07:EAFE: EE 20 06  INC ram_history_id
    MOVE.B  ram_history_id,D0  ; orig: C - - - - - 0x01EB11 07:EB01: AD 20 06  LDA ram_history_id
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x01EB14 07:EB04: C9 06     CMP #$06
    BCC     bra_EB0D             ; BCC  ; orig: C - - - - - 0x01EB16 07:EB06: 90 05     BCC bra_EB0D    ; if
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01EB18 07:EB08: A9 00     LDA #$00
    MOVE.B  D0,ram_history_id  ; orig: C - - - - - 0x01EB1A 07:EB0A: 8D 20 06  STA ram_history_id
bra_EB0D:  ; orig: bra_EB0D:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01EB1D 07:EB0D: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01EB1F 07:EB0F: C9 05     CMP #con_script_05_g
    BNE     bra_EB1F             ; BNE  ; orig: C - - - - - 0x01EB21 07:EB11: D0 0C     BNE bra_EB1F
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EB23 07:EB13: A5 10     LDA ram_dungeon_leve
    BEQ     bra_EB22             ; BEQ  ; orig: C - - - - - 0x01EB25 07:EB15: F0 0B     BEQ bra_EB22    ; if

; if dungeon
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EB27 07:EB17: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB29 07:EB19: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x015338             ; JSR -> BSR  ; orig: C - - - - - 0x01EB2C 07:EB1C: 20 28 93  JSR sub_0x015338
bra_EB1F:  ; orig: bra_EB1F:
    JMP     loc_bat_6C90  ; orig: C - - - - - 0x01EB2F 07:EB1F: 4C 90 6C  JMP loc_bat_6C90
bra_EB22:  ; orig: bra_EB22:
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01EB32 07:EB22: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB34 07:EB24: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x006131  ; orig: C - - - - - 0x01EB37 07:EB27: 4C 21 A1  JMP loc_0x006131



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01EB3A 07:EB2A: FF        .byte $FF, $FF, $FF,



sub_EB30_main_script_handler_2:  ; orig: sub_EB30_main_script_handler_2:
    MOVE.B  #con_prg_bank + $02,D0  ; orig: C - - - - - 0x01EB40 07:EB30: A9 02     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB42 07:EB32: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01EB45 07:EB35: A5 12     LDA ram_script
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01EB47 07:EB37: 20 E2 E5  JSR sub_E5E2_jump_to

; see con_script
    DC.L    ofs_main_script_2_0x009030_00_title_screen
    DC.L    ofs_main_script_2_0x00A5A1_01_slot_selection
    DC.L    ofs_main_script_2_EB96_02
    DC.L    ofs_main_script_2_EBAA_03
    DC.L    ofs_main_script_2_EBC0_04_screen_transition___end
    DC.L    ofs_main_script_2_EC1B_05_gameplay
    DC.L    ofs_main_script_2_EBC0_06_screen_transition___start
    DC.L    ofs_main_script_2_EB62_07_screen_transition___in_progress
    DC.L    ofs_main_script_2_EB76_08_save_menu
    DC.L    ofs_main_script_2_EC1B_09
    DC.L    ofs_main_script_2_EC1B_0A
    DC.L    ofs_main_script_2_EC1B_0B
    DC.L    ofs_main_script_2_EC1B_0C
    DC.L    ofs_main_script_2_0x00A6BD_0D
    DC.L    ofs_main_script_2_0x009F00_0E_register
    DC.L    ofs_main_script_2_0x009FD5_0F_elimination
    DC.L    ofs_main_script_2_EB7E_10
    DC.L    ofs_main_script_2_EB86_11_death
    DC.L    ofs_main_script_2_EB8E_12_triforce_collected
    DC.L    ofs_main_script_2_0x00AA20_13_final_credits



ofs_main_script_2_EB62_07_screen_transition___in_progress:  ; orig: ofs_main_script_2_EB62_07_screen_transition___in_progress:

; con_script_screen_trans_in_prog
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01EB72 07:EB62: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB74 07:EB64: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01442E_screen_transition_handlers             ; JSR -> BSR  ; orig: C - - - - - 0x01EB77 07:EB67: 20 1E 84  JSR sub_0x01442E_scr
    MOVE.B  ram_screen_transition_flag,D0  ; orig: C - - - - - 0x01EB7A 07:EB6A: A5 E3     LDA ram_screen_trans
    BNE     bra_EB75_RTS             ; BNE  ; orig: C - - - - - 0x01EB7C 07:EB6C: D0 07     BNE bra_EB75_RTS

; if transition is OFF
    MOVE.B  D0,ram_prev_screen_transition_flag  ; orig: C - - - - - 0x01EB7E 07:EB6E: 85 F3     STA ram_prev_screen_
    MOVE.B  #con_mirroring_H,D0  ; orig: C - - - - - 0x01EB80 07:EB70: A9 0F     LDA #con_mirroring_H

; bzk optimize, JMP
    BSR     sub_FF98_set_mirroring             ; JSR -> BSR  ; orig: C - - - - - 0x01EB82 07:EB72: 20 98 FF  JSR sub_FF98_set_mir
bra_EB75_RTS:  ; orig: bra_EB75_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EB85 07:EB75: 60        RTS



ofs_main_script_2_EB76_08_save_menu:  ; orig: ofs_main_script_2_EB76_08_save_menu:

; con_script_save_menu
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01EB86 07:EB76: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB88 07:EB78: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x014B04_save_menu_handler  ; orig: C - - - - - 0x01EB8B 07:EB7B: 4C F4 8A  JMP loc_0x014B04_sav



ofs_main_script_2_EB7E_10:  ; orig: ofs_main_script_2_EB7E_10:

; con_script_10
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01EB8E 07:EB7E: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB90 07:EB80: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x014B9B  ; orig: C - - - - - 0x01EB93 07:EB83: 4C 8B 8B  JMP loc_0x014B9B



ofs_main_script_2_EB86_11_death:  ; orig: ofs_main_script_2_EB86_11_death:

; con_script_death
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01EB96 07:EB86: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EB98 07:EB88: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x014C8D_death_subroutines  ; orig: C - - - - - 0x01EB9B 07:EB8B: 4C 7D 8C  JMP loc_0x014C8D_dea



ofs_main_script_2_EB8E_12_triforce_collected:  ; orig: ofs_main_script_2_EB8E_12_triforce_collected:

; con_script_triforce_collected
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - J - - 0x01EB9E 07:EB8E: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EBA0 07:EB90: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x016868  ; orig: C - - - - - 0x01EBA3 07:EB93: 4C 58 A8  JMP loc_0x016868



ofs_main_script_2_EB96_02:  ; orig: ofs_main_script_2_EB96_02:

; con_script_02
    BSR     sub_E625_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - J - - 0x01EBA6 07:EB96: 20 25 E6  JSR sub_E625_disable
    MOVE.B  #con_prg_bank + $06,D0  ; orig: C - - - - - 0x01EBA9 07:EB99: A9 06     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EBAB 07:EB9B: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x018119             ; JSR -> BSR  ; orig: C - - - - - 0x01EBAE 07:EB9E: 20 09 81  JSR sub_0x018119
sub_EBA1_prepare_next_script:  ; orig: sub_EBA1_prepare_next_script:
loc_0x01EBB1_prepare_next_script:  ; orig: loc_0x01EBB1_prepare_next_script:
    ADDQ.B  #1,ram_script  ; orig: C D 3 - - - 0x01EBB1 07:EBA1: E6 12     INC ram_script
sub_0x01EBB3_clear_subscript:  ; orig: sub_0x01EBB3_clear_subscript:
loc_0x01EBB3_clear_subscript:  ; orig: loc_0x01EBB3_clear_subscript:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01EBB3 07:EBA3: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x01EBB5 07:EBA5: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x01EBB7 07:EBA7: 85 13     STA ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x01EBB9 07:EBA9: 60        RTS



ofs_main_script_2_EBAA_03:  ; orig: ofs_main_script_2_EBAA_03:

; con_script_03
    BSR     sub_bat_7248_curtain_movement_handler             ; JSR -> BSR  ; orig: C - - J - - 0x01EBBA 07:EBAA: 20 48 72  JSR sub_bat_7248_cur
    MOVE.B  ram_007C,D0  ; orig: C - - - - - 0x01EBBD 07:EBAD: A5 7C     LDA ram_007C
    BNE     bra_EBF8_RTS             ; BNE  ; orig: C - - - - - 0x01EBBF 07:EBAF: D0 47     BNE bra_EBF8_RTS
    MOVE.B  #con_mirroring_H,D0  ; orig: C - - - - - 0x01EBC1 07:EBB1: A9 0F     LDA #con_mirroring_H
    BSR     sub_FF98_set_mirroring             ; JSR -> BSR  ; orig: C - - - - - 0x01EBC3 07:EBB3: 20 98 FF  JSR sub_FF98_set_mir
    MOVE.B  ram_005A,D0  ; orig: C - - - - - 0x01EBC6 07:EBB6: A5 5A     LDA ram_005A
    BEQ     bra_EBBD             ; BEQ  ; orig: C - - - - - 0x01EBC8 07:EBB8: F0 03     BEQ bra_EBBD
    JMP     loc_EBF2  ; orig: C - - - - - 0x01EBCA 07:EBBA: 4C F2 EB  JMP loc_EBF2
bra_EBBD:  ; orig: bra_EBBD:
    JMP     loc_EBEA  ; orig: C - - - - - 0x01EBCD 07:EBBD: 4C EA EB  JMP loc_EBEA



ofs_main_script_2_EBC0_04_screen_transition___end:  ; orig: ofs_main_script_2_EBC0_04_screen_transition___end:

; con_script_04_screen_trans_end
ofs_main_script_2_EBC0_06_screen_transition___start:  ; orig: ofs_main_script_2_EBC0_06_screen_transition___start:

; con_script_screen_trans_start
    MOVE.B  ram_005A,D0  ; orig: C - - J - - 0x01EBD0 07:EBC0: A5 5A     LDA ram_005A
    BNE     bra_EBF9             ; BNE  ; orig: C - - - - - 0x01EBD2 07:EBC2: D0 35     BNE bra_EBF9
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x01EBD4 07:EBC4: AD 94 03  LDA ram_0394_link
    BEQ     bra_EBF2             ; BEQ  ; orig: C - - - - - 0x01EBD7 07:EBC7: F0 29     BEQ bra_EBF2
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x01EBD9 07:EBC9: C9 08     CMP #$08
    BEQ     bra_EBF2             ; BEQ  ; orig: C - - - - - 0x01EBDB 07:EBCB: F0 25     BEQ bra_EBF2
    CMPI.B  #$F8,D0  ; orig: C - - - - - 0x01EBDD 07:EBCD: C9 F8     CMP #$F8
    BEQ     bra_EBF2             ; BEQ  ; orig: C - - - - - 0x01EBDF 07:EBCF: F0 21     BEQ bra_EBF2
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01EBE1 07:EBD1: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x01EBE3 07:EBD3: 8D F8 03  STA ram_03F8_link
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01EBE6 07:EBD6: 85 0F     STA ram_000F_t01_dir
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01EBE8 07:EBD8: A2 00     LDX #$00
    BSR     sub_F08D             ; JSR -> BSR  ; orig: C - - - - - 0x01EBEA 07:EBDA: 20 8D F0  JSR sub_F08D
    JMP     loc_EDC5  ; orig: C - - - - - 0x01EBED 07:EBDD: 4C C5 ED  JMP loc_EDC5



tbl_EBE0_gameplay_music:  ; orig: tbl_EBE0_gameplay_music:
    ; [DIRECTIVE] .BYTE con_music_overworld  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF0 07:EBE0: 01        .byte con_music_over
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF1 07:EBE1: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF2 07:EBE2: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF3 07:EBE3: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF4 07:EBE4: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF5 07:EBE5: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF6 07:EBE6: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF7 07:EBE7: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF8 07:EBE8: 40        .byte con_music_dung
    ; [DIRECTIVE] .BYTE con_music_final_dungeon  -- needs manual handling  ; orig: - D 3 - - - 0x01EBF9 07:EBE9: 20        .byte con_music_fina



loc_EBEA:  ; orig: loc_EBEA:
bra_EBEA:  ; orig: bra_EBEA:
    MOVE.B  ram_dungeon_level,D2  ; orig: C D 3 - - - 0x01EBFA 07:EBEA: A4 10     LDY ram_dungeon_leve
    MOVE.B  tbl_EBE0_gameplay_music(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EBFC 07:EBEC: B9 E0 EB  LDA tbl_EBE0_gamepla
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x01EBFF 07:EBEF: 8D 00 06  STA ram_music
bra_EBF2:  ; orig: bra_EBF2:
loc_EBF2:  ; orig: loc_EBF2:
    BSR     sub_EBA1_prepare_next_script             ; JSR -> BSR  ; orig: C D 3 - - - 0x01EC02 07:EBF2: 20 A1 EB  JSR sub_EBA1_prepare

; A = 00
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x01EC05 07:EBF5: 8D 94 03  STA ram_0394_link
bra_EBF8_RTS:  ; orig: bra_EBF8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EC08 07:EBF8: 60        RTS



bra_EBF9:  ; orig: bra_EBF9:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EC09 07:EBF9: A5 10     LDA ram_dungeon_leve
    BNE     bra_EBEA             ; BNE  ; orig: C - - - - - 0x01EC0B 07:EBFB: D0 ED     BNE bra_EBEA    ; if

; if overworld
    MOVE.B  ram_0065,D0  ; orig: C - - - - - 0x01EC0D 07:EBFD: A5 65     LDA ram_0065
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x01EC0F 07:EBFF: C9 24     CMP #$24
    BNE     bra_EBEA             ; BNE  ; orig: C - - - - - 0x01EC11 07:EC01: D0 E7     BNE bra_EBEA
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EC13 07:EC03: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EC15 07:EC05: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014BB8             ; JSR -> BSR  ; orig: C - - - - - 0x01EC18 07:EC08: 20 A8 8B  JSR sub_0x014BB8

; triggers when link walks out of a dingeon
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01EC1B 07:EC0B: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01EC1D 07:EC0D: 29 03     AND #$03
    BNE     bra_EC1A_RTS             ; BNE  ; orig: C - - - - - 0x01EC1F 07:EC0F: D0 09     BNE bra_EC1A_RTS
    SUBQ.B  #1,ram_pos_Y_link  ; orig: C - - - - - 0x01EC21 07:EC11: C6 84     DEC ram_pos_Y_link
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01EC23 07:EC13: A5 84     LDA ram_pos_Y_link
    CMP.B   ram_0412,D0  ; orig: C - - - - - 0x01EC25 07:EC15: CD 12 04  CMP ram_0412
    BEQ     bra_EBEA             ; BEQ  ; orig: C - - - - - 0x01EC28 07:EC18: F0 D0     BEQ bra_EBEA
bra_EC1A_RTS:  ; orig: bra_EC1A_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EC2A 07:EC1A: 60        RTS



ofs_main_script_2_EC1B_05_gameplay:  ; orig: ofs_main_script_2_EC1B_05_gameplay:

; con_script_05_gameplay
ofs_main_script_2_EC1B_09:  ; orig: ofs_main_script_2_EC1B_09:

; con_script_09
ofs_main_script_2_EC1B_0A:  ; orig: ofs_main_script_2_EC1B_0A:

; con_script_0A
ofs_main_script_2_EC1B_0B:  ; orig: ofs_main_script_2_EC1B_0B:

; con_script_0B
ofs_main_script_2_EC1B_0C:  ; orig: ofs_main_script_2_EC1B_0C:

; con_script_0C
    ; (empty translation for LDA)  ; orig: C - - J - - 0x01EC2B 07:EC1B: A5 3C     LDA ram_timer_obj + 
    BNE     bra_EBF8_RTS             ; BNE  ; orig: C - - - - - 0x01EC2D 07:EC1D: D0 D9     BNE bra_EBF8_RTS
    MOVE.B  ram_051E_flag,D0  ; orig: C - - - - - 0x01EC2F 07:EC1F: AD 1E 05  LDA ram_051E_flag
    BEQ     bra_EC2C             ; BEQ  ; orig: C - - - - - 0x01EC32 07:EC22: F0 08     BEQ bra_EC2C
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01EC34 07:EC24: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EC36 07:EC26: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x0131CE  ; orig: C - - - - - 0x01EC39 07:EC29: 4C BE B1  JMP loc_0x0131CE
bra_EC2C:  ; orig: bra_EC2C:
    MOVE.B  ram_pause_script,D0  ; orig: C - - - - - 0x01EC3C 07:EC2C: A5 E1     LDA ram_pause_script
    BNE     bra_EC58             ; BNE  ; orig: C - - - - - 0x01EC3E 07:EC2E: D0 28     BNE bra_EC58
    MOVE.B  ram_pause_flag,D0  ; orig: C - - - - - 0x01EC40 07:EC30: A5 E0     LDA ram_pause_flag
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01EC42 07:EC32: C9 02     CMP #$02
    BEQ     bra_EC49             ; BEQ  ; orig: C - - - - - 0x01EC44 07:EC34: F0 13     BEQ bra_EC49
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x01EC46 07:EC36: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Select,D0  ; orig: C - - - - - 0x01EC48 07:EC38: 29 20     AND #con_btn_Select
    BEQ     bra_EC49             ; BEQ  ; orig: C - - - - - 0x01EC4A 07:EC3A: F0 0D     BEQ bra_EC49
    MOVE.B  ram_pause_flag,D0  ; orig: C - - - - - 0x01EC4C 07:EC3C: A5 E0     LDA ram_pause_flag
    EORI.B  #$01,D0  ; orig: C - - - - - 0x01EC4E 07:EC3E: 49 01     EOR #$01    ; toggle
    MOVE.B  D0,ram_pause_flag  ; orig: C - - - - - 0x01EC50 07:EC40: 85 E0     STA ram_pause_flag
    BNE     bra_EC49             ; BNE  ; orig: C - - - - - 0x01EC52 07:EC42: D0 05     BNE bra_EC49
    MOVE.B  #$0F,D0  ; orig: C - - - - - 0x01EC54 07:EC44: A9 0F     LDA #$0F
    MOVE.B  D0,$4015  ; orig: C - - - - - 0x01EC56 07:EC46: 8D 15 40  STA $4015
bra_EC49:  ; orig: bra_EC49:
    MOVE.B  ram_pause_flag,D0  ; orig: C - - - - - 0x01EC59 07:EC49: A5 E0     LDA ram_pause_flag
    BEQ     bra_EC58             ; BEQ  ; orig: C - - - - - 0x01EC5B 07:EC4B: F0 0B     BEQ bra_EC58    ; if
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EC5D 07:EC4D: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EC5F 07:EC4F: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x017569_disable_greyscale             ; JSR -> BSR  ; orig: C - - - - - 0x01EC62 07:EC52: 20 59 B5  JSR sub_0x017569_dis
    JMP     loc_ED89  ; orig: C - - - - - 0x01EC65 07:EC55: 4C 89 ED  JMP loc_ED89
bra_EC58:  ; orig: bra_EC58:
    BSR     sub_bat_6E1D             ; JSR -> BSR  ; orig: C - - - - - 0x01EC68 07:EC58: 20 1D 6E  JSR sub_bat_6E1D
    MOVE.B  ram_btn_hold,D0  ; orig: C - - - - - 0x01EC6B 07:EC5B: A5 FA     LDA ram_btn_hold
    ANDI.B  #con_btns_Dpad,D0  ; orig: C - - - - - 0x01EC6D 07:EC5D: 29 0F     AND #con_btns_Dpad
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x01EC6F 07:EC5F: 8D F8 03  STA ram_03F8_link
    MOVE.B  ram_pause_script,D0  ; orig: C - - - - - 0x01EC72 07:EC62: A5 E1     LDA ram_pause_script
    BEQ     bra_EC71             ; BEQ  ; orig: C - - - - - 0x01EC74 07:EC64: F0 0B     BEQ bra_EC71
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EC76 07:EC66: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EC78 07:EC68: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x017569_disable_greyscale             ; JSR -> BSR  ; orig: C - - - - - 0x01EC7B 07:EC6B: 20 59 B5  JSR sub_0x017569_dis
    JMP     loc_0x014010_pause_screen_handler  ; orig: C - - - - - 0x01EC7E 07:EC6E: 4C 00 80  JMP loc_0x014010_pau
bra_EC71:  ; orig: bra_EC71:
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x01EC81 07:EC71: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x01EC83 07:EC73: 29 10     AND #con_btn_Start
    BEQ     bra_EC7A             ; BEQ  ; orig: C - - - - - 0x01EC85 07:EC75: F0 03     BEQ bra_EC7A
    ADDQ.B  #1,ram_pause_script  ; orig: C - - - - - 0x01EC87 07:EC77: E6 E1     INC ram_pause_script
    RTS                     ; RTS  ; orig: C - - - - - 0x01EC89 07:EC79: 60        RTS
bra_EC7A:  ; orig: bra_EC7A:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x01EC8A 07:EC7A: AD 6C 06  LDA ram_item_clock
    BEQ     bra_EC88             ; BEQ  ; orig: C - - - - - 0x01EC8D 07:EC7D: F0 09     BEQ bra_EC88
    MOVE.B  ram_invinc_link,D0  ; orig: C - - - - - 0x01EC8F 07:EC7F: AD F0 04  LDA ram_invinc_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EC92 07:EC82: 18        CLC
    ADDX.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01EC93 07:EC83: 69 10     ADC #$10
    MOVE.B  D0,ram_invinc_link  ; orig: C - - - - - 0x01EC95 07:EC85: 8D F0 04  STA ram_invinc_link
bra_EC88:  ; orig: bra_EC88:
    BSR     sub_EDA0             ; JSR -> BSR  ; orig: C - - - - - 0x01EC98 07:EC88: 20 A0 ED  JSR sub_EDA0
    MOVE.B  ram_0011_screen_ready_flag,D0  ; orig: C - - - - - 0x01EC9B 07:EC8B: A5 11     LDA ram_0011_screen_
    BNE     bra_EC92             ; BNE  ; orig: C - - - - - 0x01EC9D 07:EC8D: D0 03     BNE bra_EC92
    JMP     loc_ED7D  ; orig: C - - - - - 0x01EC9F 07:EC8F: 4C 7D ED  JMP loc_ED7D
bra_EC92:  ; orig: bra_EC92:
    MOVE.B  ram_0060,D0  ; orig: C - - - - - 0x01ECA2 07:EC92: A5 60     LDA ram_0060
    BNE     bra_EC9E             ; BNE  ; orig: C - - - - - 0x01ECA4 07:EC94: D0 08     BNE bra_EC9E
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01ECA6 07:EC96: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0061  ; orig: C - - - - - 0x01ECA8 07:EC98: 85 61     STA ram_0061
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01ECAA 07:EC9A: A5 84     LDA ram_pos_Y_link
    MOVE.B  D0,ram_0062  ; orig: C - - - - - 0x01ECAC 07:EC9C: 85 62     STA ram_0062
bra_EC9E:  ; orig: bra_EC9E:
    MOVE.B  #$0D,D1  ; orig: C - - - - - 0x01ECAE 07:EC9E: A2 0D     LDX #$0D
    BSR     sub_F769             ; JSR -> BSR  ; orig: C - - - - - 0x01ECB0 07:ECA0: 20 69 F7  JSR sub_F769
    MOVE.B  #$0E,D1  ; orig: C - - - - - 0x01ECB3 07:ECA3: A2 0E     LDX #$0E
    BSR     sub_F36F             ; JSR -> BSR  ; orig: C - - - - - 0x01ECB5 07:ECA5: 20 6F F3  JSR sub_F36F
    MOVE.B  #$0F,D1  ; orig: C - - - - - 0x01ECB8 07:ECA8: A2 0F     LDX #$0F
    BSR     sub_F4A0             ; JSR -> BSR  ; orig: C - - - - - 0x01ECBA 07:ECAA: 20 A0 F4  JSR sub_F4A0
    MOVE.B  #$10,D1  ; orig: C - - - - - 0x01ECBD 07:ECAD: A2 10     LDX #$10
    BSR     sub_F92A             ; JSR -> BSR  ; orig: C - - - - - 0x01ECBF 07:ECAF: 20 2A F9  JSR sub_F92A
    MOVE.B  #$11,D1  ; orig: C - - - - - 0x01ECC2 07:ECB2: A2 11     LDX #$11
    BSR     sub_F92A             ; JSR -> BSR  ; orig: C - - - - - 0x01ECC4 07:ECB4: 20 2A F9  JSR sub_F92A
    MOVE.B  #$12,D1  ; orig: C - - - - - 0x01ECC7 07:ECB7: A2 12     LDX #$12
    BSR     sub_F73E             ; JSR -> BSR  ; orig: C - - - - - 0x01ECC9 07:ECB9: 20 3E F7  JSR sub_F73E
    MOVE.B  ram_random_1,D0  ; orig: C - - - - - 0x01ECCC 07:ECBC: A5 4A     LDA ram_random_1
    BNE     bra_ECDE             ; BNE  ; orig: C - - - - - 0x01ECCE 07:ECBE: D0 1E     BNE bra_ECDE
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01ECD0 07:ECC0: A5 19     LDA ram_indiv_random
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01ECD2 07:ECC2: 29 07     AND #$07
    MOVE.B  D0,ram_random_1  ; orig: C - - - - - 0x01ECD4 07:ECC4: 85 4A     STA ram_random_1
    MOVE.B  ram_0060,D0  ; orig: C - - - - - 0x01ECD6 07:ECC6: A5 60     LDA ram_0060
    EORI.B  #$01,D0  ; orig: C - - - - - 0x01ECD8 07:ECC8: 49 01     EOR #$01
    MOVE.B  D0,ram_0060  ; orig: C - - - - - 0x01ECDA 07:ECCA: 85 60     STA ram_0060
    BEQ     bra_ECDE             ; BEQ  ; orig: C - - - - - 0x01ECDC 07:ECCC: F0 10     BEQ bra_ECDE
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x01ECDE 07:ECCE: A5 61     LDA ram_0061
    CMP.B   ram_pos_X_link,D0  ; orig: C - - - - - 0x01ECE0 07:ECD0: C5 70     CMP ram_pos_X_link
    BNE     bra_ECDE             ; BNE  ; orig: C - - - - - 0x01ECE2 07:ECD2: D0 0A     BNE bra_ECDE
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x01ECE4 07:ECD4: 49 FF     EOR #$FF
    MOVE.B  D0,ram_0061  ; orig: C - - - - - 0x01ECE6 07:ECD6: 85 61     STA ram_0061
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x01ECE8 07:ECD8: A5 62     LDA ram_0062
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x01ECEA 07:ECDA: 49 FF     EOR #$FF
    MOVE.B  D0,ram_0062  ; orig: C - - - - - 0x01ECEC 07:ECDC: 85 62     STA ram_0062
bra_ECDE:  ; orig: bra_ECDE:
bra_ECDE_loop:  ; orig: bra_ECDE_loop:
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01ECEE 07:ECDE: AE 40 03  LDX ram_obj_index
    BSR     sub_FE98_decrease_invincibility_timer             ; JSR -> BSR  ; orig: C - - - - - 0x01ECF1 07:ECE1: 20 98 FE  JSR sub_FE98_decreas
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01ECF4 07:ECE4: BD 4F 03  LDA ram_obj_id_enemy
    BEQ     bra_ED0E_next             ; BEQ  ; orig: C - - - - - 0x01ECF7 07:ECE7: F0 25     BEQ bra_ED0E_next   
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01ECF9 07:ECE9: BD 4F 03  LDA ram_obj_id_enemy
    BSR     sub_FB74             ; JSR -> BSR  ; orig: C - - - - - 0x01ECFC 07:ECEC: 20 74 FB  JSR sub_FB74
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01ECFF 07:ECEF: AE 40 03  LDX ram_obj_index
    MOVE.B  ram_0405_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01ED02 07:ECF2: BD 05 04  LDA ram_0405_enemy,X
    BNE     bra_ED0E_next             ; BNE  ; orig: C - - - - - 0x01ED05 07:ECF5: D0 17     BNE bra_ED0E_next
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01ED07 07:ECF7: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_01,D0  ; orig: C - - - - - 0x01ED0A 07:ECFA: 29 01     AND #con_04C0_01
    BNE     bra_ED0E_next             ; BNE  ; orig: C - - - - - 0x01ED0C 07:ECFC: D0 10     BNE bra_ED0E_next
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01ED0E 07:ECFE: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_04,D0  ; orig: C - - - - - 0x01ED11 07:ED01: 29 04     AND #con_04C0_04
    BNE     bra_ED08             ; BNE  ; orig: C - - - - - 0x01ED13 07:ED03: D0 03     BNE bra_ED08
    BSR     sub_bat_77D4             ; JSR -> BSR  ; orig: C - - - - - 0x01ED15 07:ED05: 20 D4 77  JSR sub_bat_77D4
bra_ED08:  ; orig: bra_ED08:
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01ED18 07:ED08: AE 40 03  LDX ram_obj_index
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01ED1B 07:ED0B: 20 D0 79  JSR sub_bat_79D0
bra_ED0E_next:  ; orig: bra_ED0E_next:
    SUBQ.B  #1,ram_obj_index  ; orig: C - - - - - 0x01ED1E 07:ED0E: CE 40 03  DEC ram_obj_index
    BNE     bra_ECDE_loop             ; BNE  ; orig: C - - - - - 0x01ED21 07:ED11: D0 CB     BNE bra_ECDE_loop
    MOVE.B  #$0B,D0  ; orig: C - - - - - 0x01ED23 07:ED13: A9 0B     LDA #$0B
    MOVE.B  D0,ram_obj_index  ; orig: C - - - - - 0x01ED25 07:ED15: 8D 40 03  STA ram_obj_index
    MOVE.B  ram_item_hearts,D0  ; orig: C - - - - - 0x01ED28 07:ED18: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01ED2B 07:ED1B: 29 0F     AND #$0F
    BNE     bra_ED27             ; BNE  ; orig: C - - - - - 0x01ED2D 07:ED1D: D0 08     BNE bra_ED27
    MOVE.B  ram_sfx_4,D0  ; orig: C - - - - - 0x01ED2F 07:ED1F: AD 04 06  LDA ram_sfx_4
    ORI.B   #con_sfx_4_low_health,D0  ; orig: C - - - - - 0x01ED32 07:ED22: 09 40     ORA #con_sfx_4_low_h
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x01ED34 07:ED24: 8D 04 06  STA ram_sfx_4
bra_ED27:  ; orig: bra_ED27:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01ED37 07:ED27: A5 10     LDA ram_dungeon_leve
    BEQ     bra_ED4F             ; BEQ  ; orig: C - - - - - 0x01ED39 07:ED29: F0 24     BEQ bra_ED4F    ; if

; if dungeon
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01ED3B 07:ED2B: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01ED3D 07:ED2D: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x010660             ; JSR -> BSR  ; orig: C - - - - - 0x01ED40 07:ED30: 20 50 86  JSR sub_0x010660
    BSR     sub_E679             ; JSR -> BSR  ; orig: C - - - - - 0x01ED43 07:ED33: 20 79 E6  JSR sub_E679
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01ED46 07:ED36: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01ED48 07:ED38: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014BCC             ; JSR -> BSR  ; orig: C - - - - - 0x01ED4B 07:ED3B: 20 BC 8B  JSR sub_0x014BCC
    BSR     sub_0x014ABD             ; JSR -> BSR  ; orig: C - - - - - 0x01ED4E 07:ED3E: 20 AD 8A  JSR sub_0x014ABD
    BSR     sub_0x016603             ; JSR -> BSR  ; orig: C - - - - - 0x01ED51 07:ED41: 20 F3 A5  JSR sub_0x016603
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01ED54 07:ED44: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01ED56 07:ED46: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x00618C             ; JSR -> BSR  ; orig: C - - - - - 0x01ED59 07:ED49: 20 7C A1  JSR sub_0x00618C
    JMP     loc_ED6A  ; orig: C - - - - - 0x01ED5C 07:ED4C: 4C 6A ED  JMP loc_ED6A
bra_ED4F:  ; orig: bra_ED4F:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01ED5F 07:ED4F: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01ED61 07:ED51: C9 05     CMP #con_script_05_g
    BNE     bra_ED62             ; BNE  ; orig: C - - - - - 0x01ED63 07:ED53: D0 0D     BNE bra_ED62
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01ED65 07:ED55: A4 EB     LDY ram_map_location
    MOVE.B  ram_687E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01ED67 07:ED57: B9 7E 68  LDA ram_687E_map_dat
    ANDI.B  #$04,D0  ; orig: C - - - - - 0x01ED6A 07:ED5A: 29 04     AND #$04

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01ED6C 07:ED5C: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01ED6D 07:ED5D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01ED6E 07:ED5E: 0A        ASL ; con_sfx_3_ocea
    BSR     sub_bat_6D80_set_sfx_3             ; JSR -> BSR  ; orig: C - - - - - 0x01ED6F 07:ED5F: 20 80 6D  JSR sub_bat_6D80_set
bra_ED62:  ; orig: bra_ED62:
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01ED72 07:ED62: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01ED74 07:ED64: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0106F0_try_spawning_zora_in_water             ; JSR -> BSR  ; orig: C - - - - - 0x01ED77 07:ED67: 20 E0 86  JSR sub_0x0106F0_try
loc_ED6A:  ; orig: loc_ED6A:
    MOVE.B  ram_0301_buffer_index,D0  ; orig: C D 3 - - - 0x01ED7A 07:ED6A: AD 01 03  LDA ram_0301_buffer_
    BNE     bra_ED7D             ; BNE  ; orig: C - - - - - 0x01ED7D 07:ED6D: D0 0E     BNE bra_ED7D
    MOVE.B  ram_04E5,D0  ; orig: C - - - - - 0x01ED7F 07:ED6F: AD E5 04  LDA ram_04E5
    BEQ     bra_ED7D             ; BEQ  ; orig: C - - - - - 0x01ED82 07:ED72: F0 09     BEQ bra_ED7D

; when you pick up map item
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01ED84 07:ED74: A9 00     LDA #$00
    MOVE.B  D0,ram_04E5  ; orig: C - - - - - 0x01ED86 07:ED76: 8D E5 04  STA ram_04E5
    MOVE.B  #con_ppu_buf_44_minimap,D0  ; orig: C - - - - - 0x01ED89 07:ED79: A9 44     LDA #con_ppu_buf_44_
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x01ED8B 07:ED7B: 85 14     STA ram_ppu_load_ind
bra_ED7D:  ; orig: bra_ED7D:
loc_ED7D:  ; orig: loc_ED7D:
    BSR     sub_E7FE             ; JSR -> BSR  ; orig: C D 3 - - - 0x01ED8D 07:ED7D: 20 FE E7  JSR sub_E7FE
    BSR     sub_E6EA             ; JSR -> BSR  ; orig: C - - - - - 0x01ED90 07:ED80: 20 EA E6  JSR sub_E6EA
    BSR     sub_bat_7328             ; JSR -> BSR  ; orig: C - - - - - 0x01ED93 07:ED83: 20 28 73  JSR sub_bat_7328
    BSR     sub_E78A             ; JSR -> BSR  ; orig: C - - - - - 0x01ED96 07:ED86: 20 8A E7  JSR sub_E78A
loc_ED89:  ; orig: loc_ED89:
sub_0x01ED99:  ; orig: sub_0x01ED99:
loc_0x01ED99:  ; orig: loc_0x01ED99:
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C D 3 - - - 0x01ED99 07:ED89: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01ED9B 07:ED8B: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0171F6             ; JSR -> BSR  ; orig: C - - - - - 0x01ED9E 07:ED8E: 20 E6 B1  JSR sub_0x0171F6
    JMP     loc_bat_6CC0_count_rupees_and_update_hud_info  ; orig: C - - - - - 0x01EDA1 07:ED91: 4C C0 6C  JMP loc_bat_6CC0_cou



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01EDA4 07:ED94: FF        .byte $FF, $FF, $FF,



sub_EDA0:  ; orig: sub_EDA0:
sub_0x01EDB0:  ; orig: sub_0x01EDB0:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01EDB0 07:EDA0: A2 00     LDX #$00
    BSR     sub_FE98_decrease_invincibility_timer             ; JSR -> BSR  ; orig: C - - - - - 0x01EDB2 07:EDA2: 20 98 FE  JSR sub_FE98_decreas
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01EDB5 07:EDA5: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_freeze + con_obj_state_80,D0  ; orig: C - - - - - 0x01EDB7 07:EDA7: 29 C0     AND #con_obj_state_f
    CMPI.B  #con_obj_state_freeze,D0  ; orig: C - - - - - 0x01EDB9 07:EDA9: C9 40     CMP #con_obj_state_f
    BEQ     bra_EDEA_RTS             ; BEQ  ; orig: C - - - - - 0x01EDBB 07:EDAB: F0 3D     BEQ bra_EDEA_RTS
    MOVE.B  ram_0512_flag,D0  ; orig: C - - - - - 0x01EDBD 07:EDAD: AD 12 05  LDA ram_0512_flag
    BEQ     bra_EDBA             ; BEQ  ; orig: C - - - - - 0x01EDC0 07:EDB0: F0 08     BEQ bra_EDBA
    MOVE.B  ram_03F8_link,D0  ; orig: - - - - - - 0x01EDC2 07:EDB2: AD F8 03  LDA ram_03F8_link
    ANDI.B  #$F0,D0  ; orig: - - - - - - 0x01EDC5 07:EDB5: 29 F0     AND #$F0
    MOVE.B  D0,ram_03F8_link  ; orig: - - - - - - 0x01EDC7 07:EDB7: 8D F8 03  STA ram_03F8_link
bra_EDBA:  ; orig: bra_EDBA:
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EDCA 07:EDBA: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EDCC 07:EDBC: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0172AA             ; JSR -> BSR  ; orig: C - - - - - 0x01EDCF 07:EDBF: 20 9A B2  JSR sub_0x0172AA
    BSR     sub_EFD0             ; JSR -> BSR  ; orig: C - - - - - 0x01EDD2 07:EDC2: 20 D0 EF  JSR sub_EFD0
loc_EDC5:  ; orig: loc_EDC5:
loc_0x01EDD5:  ; orig: loc_0x01EDD5:
    MOVE.B  ram_script,D0  ; orig: C D 3 - - - 0x01EDD5 07:EDC5: A5 12     LDA ram_script
    CMPI.B  #con_script_0A,D0  ; orig: C - - - - - 0x01EDD7 07:EDC7: C9 0A     CMP #con_script_0A
    BEQ     bra_EDEA_RTS             ; BEQ  ; orig: C - - - - - 0x01EDD9 07:EDC9: F0 1F     BEQ bra_EDEA_RTS
    BSR     sub_F23C             ; JSR -> BSR  ; orig: C - - - - - 0x01EDDB 07:EDCB: 20 3C F2  JSR sub_F23C
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EDDE 07:EDCE: A5 10     LDA ram_dungeon_leve
    BEQ     bra_EDD5             ; BEQ  ; orig: C - - - - - 0x01EDE0 07:EDD0: F0 03     BEQ bra_EDD5    ; if

; if dungeon
    BSR     sub_bat_6EFB             ; JSR -> BSR  ; orig: C - - - - - 0x01EDE2 07:EDD2: 20 FB 6E  JSR sub_bat_6EFB
bra_EDD5:  ; orig: bra_EDD5:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01EDE5 07:EDD5: A2 00     LDX #$00
sub_EDD7:  ; orig: sub_EDD7:
    MOVE.B  ram_0394_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EDE7 07:EDD7: BD 94 03  LDA ram_0394_obj,X
    BNE     bra_EDEA_RTS             ; BNE  ; orig: C - - - - - 0x01EDEA 07:EDDA: D0 0E     BNE bra_EDEA_RTS
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EDEC 07:EDDC: B5 70     LDA ram_pos_X_obj,X
    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x01EDEE 07:EDDE: 29 F8     AND #$F8
    MOVE.B  D0,ram_pos_X_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EDF0 07:EDE0: 95 70     STA ram_pos_X_obj,X
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EDF2 07:EDE2: B5 84     LDA ram_pos_Y_obj,X
    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x01EDF4 07:EDE4: 29 F8     AND #$F8
    ORI.B   #$05,D0  ; orig: C - - - - - 0x01EDF6 07:EDE6: 09 05     ORA #$05
    MOVE.B  D0,ram_pos_Y_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EDF8 07:EDE8: 95 84     STA ram_pos_Y_obj,X
bra_EDEA_RTS:  ; orig: bra_EDEA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EDFA 07:EDEA: 60        RTS



tbl_EDEB_collision_tiles:  ; orig: tbl_EDEB_collision_tiles:
    ; [DIRECTIVE] .BYTE con_collision_tile + $8D  -- needs manual handling  ; orig: - D 3 - - - 0x01EDFB 07:EDEB: 8D        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $91  -- needs manual handling  ; orig: - D 3 - - - 0x01EDFC 07:EDEC: 91        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $9C  -- needs manual handling  ; orig: - D 3 - - - 0x01EDFD 07:EDED: 9C        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $AC  -- needs manual handling  ; orig: - D 3 - - - 0x01EDFE 07:EDEE: AC        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $AD  -- needs manual handling  ; orig: - D 3 - - - 0x01EDFF 07:EDEF: AD        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $CC  -- needs manual handling  ; orig: - D 3 - - - 0x01EE00 07:EDF0: CC        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $D2  -- needs manual handling  ; orig: - D 3 - - - 0x01EE01 07:EDF1: D2        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $D5  -- needs manual handling  ; orig: - D 3 - - - 0x01EE02 07:EDF2: D5        .byte con_collision_
    ; [DIRECTIVE] .BYTE con_collision_tile + $DF  -- needs manual handling  ; orig: - D 3 - - - 0x01EE03 07:EDF3: DF        .byte con_collision_



sub_0x01EE04_find_current_collision_tile___direction_00:  ; orig: sub_0x01EE04_find_current_collision_tile___direction_00:
    MOVE.B  #con_dir_00,D2  ; orig: C - - - - - 0x01EE04 07:EDF4: A0 00     LDY #con_dir_00
    MOVE.B  D2,ram_000F_t01_direction  ; orig: C - - - - - 0x01EE06 07:EDF6: 84 0F     STY ram_000F_t01_dir
    BEQ     bra_EE10             ; BEQ  ; orig: C - - - - - 0x01EE08 07:EDF8: F0 16     BEQ bra_EE10    ; jm



sub_EDFA_find_current_collision_tile:  ; orig: sub_EDFA_find_current_collision_tile:
sub_0x01EE0A_find_current_collision_tile:  ; orig: sub_0x01EE0A_find_current_collision_tile:

; out

; A = collision tile
    MOVE.B  #$F8,D2  ; orig: C - - - - - 0x01EE0A 07:EDFA: A0 F8     LDY #$F8
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EE0C 07:EDFC: E0 00     CPX #$00
    BEQ     bra_EE02             ; BEQ  ; orig: C - - - - - 0x01EE0E 07:EDFE: F0 02     BEQ bra_EE02    ; if

; if enemy
    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x01EE10 07:EE00: A0 F0     LDY #$F0
bra_EE02:  ; orig: bra_EE02:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EE12 07:EE02: A5 0F     LDA ram_000F_t01_dir
    ANDI.B  #con_dir__DR,D0  ; orig: C - - - - - 0x01EE14 07:EE04: 29 05     AND #con_dir__DR
    BEQ     bra_EE10             ; BEQ  ; orig: C - - - - - 0x01EE16 07:EE06: F0 08     BEQ bra_EE10
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x01EE18 07:EE08: A0 08     LDY #$08
    ANDI.B  #con_dir_Down,D0  ; orig: C - - - - - 0x01EE1A 07:EE0A: 29 04     AND #con_dir_Down
    BNE     bra_EE10             ; BNE  ; orig: C - - - - - 0x01EE1C 07:EE0C: D0 02     BNE bra_EE10    ; if

; if right
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x01EE1E 07:EE0E: A0 10     LDY #$10
bra_EE10:  ; orig: bra_EE10:
sub_0x01EE20_find_current_collision_tile:  ; orig: sub_0x01EE20_find_current_collision_tile:

; in

; Y =
    MOVE.B  D2,ram_0004_t22  ; orig: C - - - - - 0x01EE20 07:EE10: 84 04     STY ram_0004_t22
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EE22 07:EE12: B5 84     LDA ram_pos_Y_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EE24 07:EE14: 18        CLC
    ADDX.B  #$0B,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01EE25 07:EE15: 69 0B     ADC #$0B
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01EE27 07:EE17: A8        TAY
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01EE28 07:EE18: 48        PHA
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EE29 07:EE19: A5 0F     LDA ram_000F_t01_dir
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01EE2B 07:EE1B: 29 0C     AND #con_dir__UD
    BEQ     bra_EE31             ; BEQ  ; orig: C - - - - - 0x01EE2D 07:EE1D: F0 12     BEQ bra_EE31
    ANDI.B  #con_dir_Down,D0  ; orig: C - - - - - 0x01EE2F 07:EE1F: 29 04     AND #con_dir_Down
    BEQ     bra_EE27             ; BEQ  ; orig: C - - - - - 0x01EE31 07:EE21: F0 04     BEQ bra_EE27    ; if

; if down
    CMPI.B  #$DD,D2  ; orig: C - - - - - 0x01EE33 07:EE23: C0 DD     CPY #$DD
    BCS     bra_EE2C             ; BCS  ; orig: C - - - - - 0x01EE35 07:EE25: B0 05     BCS bra_EE2C
bra_EE27:  ; orig: bra_EE27:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01EE37 07:EE27: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EE38 07:EE28: 18        CLC
    ADDX.B  ram_0004_t22,D0  ; orig: C - - - - - 0x01EE39 07:EE29: 65 04     ADC ram_0004_t22
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01EE3B 07:EE2B: 48        PHA
bra_EE2C:  ; orig: bra_EE2C:
    MOVE.B  ram_pos_X_obj(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01EE3C 07:EE2C: B4 70     LDY ram_pos_X_obj,X
    JMP     loc_EE48  ; orig: C - - - - - 0x01EE3E 07:EE2E: 4C 48 EE  JMP loc_EE48
bra_EE31:  ; orig: bra_EE31:
    MOVE.B  ram_pos_X_obj(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01EE41 07:EE31: B4 70     LDY ram_pos_X_obj,X
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EE43 07:EE33: A5 0F     LDA ram_000F_t01_dir
    ANDI.B  #con_dir_Right,D0  ; orig: C - - - - - 0x01EE45 07:EE35: 29 01     AND #con_dir_Right
    BEQ     bra_EE3F             ; BEQ  ; orig: C - - - - - 0x01EE47 07:EE37: F0 06     BEQ bra_EE3F

; if right
    CMPI.B  #$F0,D2  ; orig: C - - - - - 0x01EE49 07:EE39: C0 F0     CPY #$F0
    BCS     bra_EE48             ; BCS  ; orig: C - - - - - 0x01EE4B 07:EE3B: B0 0B     BCS bra_EE48
    BCC     bra_EE43             ; BCC  ; orig: C - - - - - 0x01EE4D 07:EE3D: 90 04     BCC bra_EE43    ; jm
bra_EE3F:  ; orig: bra_EE3F:
    CMPI.B  #$10,D2  ; orig: C - - - - - 0x01EE4F 07:EE3F: C0 10     CPY #$10
    BCC     bra_EE48             ; BCC  ; orig: C - - - - - 0x01EE51 07:EE41: 90 05     BCC bra_EE48
bra_EE43:  ; orig: bra_EE43:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01EE53 07:EE43: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EE54 07:EE44: 18        CLC
    ADDX.B  ram_0004_t22,D0  ; orig: C - - - - - 0x01EE55 07:EE45: 65 04     ADC ram_0004_t22
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01EE57 07:EE47: A8        TAY
bra_EE48:  ; orig: bra_EE48:
loc_EE48:  ; orig: loc_EE48:
    MOVE.B  D2,D0           ; TYA  ; orig: C D 3 - - - 0x01EE58 07:EE48: 98        TYA
    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x01EE59 07:EE49: 29 F8     AND #$F8

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EE5B 07:EE4B: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EE5C 07:EE4C: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01EE5D 07:EE4D: A8        TAY
    MOVE.B  tbl_E400_block_addresses(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EE5E 07:EE4E: B9 00 E4  LDA tbl_E400_block_a
    MOVE.B  D0,ram_0000_t05_block_data  ; orig: C - - - - - 0x01EE61 07:EE51: 85 00     STA ram_0000_t05_blo
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01EE63 07:EE53: B9 01 E4  LDA tbl_E400_block_a
    ; (empty translation for STA)  ; orig: C - - - - - 0x01EE66 07:EE56: 85 01     STA ram_0000_t05_blo
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01EE68 07:EE58: 68        PLA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01EE69 07:EE59: 38        SEC
    SUBX.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x01EE6A 07:EE5A: E9 40     SBC #$40

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EE6C 07:EE5C: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EE6D 07:EE5D: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EE6E 07:EE5E: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01EE6F 07:EE5F: A8        TAY
    MOVEA.W ($FF0000+ram_0000_t05_block_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01EE70 07:EE60: B1 00     LDA (ram_0000_t05_bl
    MOVE.B  D0,ram_collision_tile_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EE72 07:EE62: 9D 9E 04  STA ram_collision_ti
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EE75 07:EE65: A5 0F     LDA ram_000F_t01_dir
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01EE77 07:EE67: 29 0C     AND #con_dir__UD
    BEQ     bra_EE7A             ; BEQ  ; orig: C - - - - - 0x01EE79 07:EE69: F0 0F     BEQ bra_EE7A
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01EE7B 07:EE6B: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EE7C 07:EE6C: 18        CLC
    ADDX.B  #$16,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01EE7D 07:EE6D: 69 16     ADC #$16
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01EE7F 07:EE6F: A8        TAY
    MOVEA.W ($FF0000+ram_0000_t05_block_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01EE80 07:EE70: B1 00     LDA (ram_0000_t05_bl
    CMP.B   ram_collision_tile_obj(D1.L),D0  ; orig: C - - - - - 0x01EE82 07:EE72: DD 9E 04  CMP ram_collision_ti
    BCC     bra_EE7A             ; BCC  ; orig: C - - - - - 0x01EE85 07:EE75: 90 03     BCC bra_EE7A
    MOVE.B  D0,ram_collision_tile_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EE87 07:EE77: 9D 9E 04  STA ram_collision_ti
bra_EE7A:  ; orig: bra_EE7A:
    MOVE.B  ram_collision_tile_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EE8A 07:EE7A: BD 9E 04  LDA ram_collision_ti
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x01EE8D 07:EE7D: A4 10     LDY ram_dungeon_leve
    BNE     bra_EEB7_RTS             ; BNE  ; orig: C - - - - - 0x01EE8F 07:EE7F: D0 36     BNE bra_EEB7_RTS    

; if overworld
    MOVE.B  ram_collision_tile_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EE91 07:EE81: BD 9E 04  LDA ram_collision_ti
    MOVE.B  #$09,D2  ; orig: C - - - - - 0x01EE94 07:EE84: A0 09     LDY #$09
bra_EE86_loop:  ; orig: bra_EE86_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EE96 07:EE86: 88        DEY
    BMI     bra_EE90             ; BMI  ; orig: C - - - - - 0x01EE97 07:EE87: 30 07     BMI bra_EE90
    CMP.B   tbl_EDEB_collision_tiles(D2.L),D0  ; orig: C - - - - - 0x01EE99 07:EE89: D9 EB ED  CMP tbl_EDEB_collisi
    BNE     bra_EE86_loop             ; BNE  ; orig: C - - - - - 0x01EE9C 07:EE8C: D0 F8     BNE bra_EE86_loop
    MOVE.B  #con_collision_tile + $26,D0  ; orig: C - - - - - 0x01EE9E 07:EE8E: A9 26     LDA #con_collision_t
bra_EE90:  ; orig: bra_EE90:
    MOVE.B  D0,ram_collision_tile_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EEA0 07:EE90: 9D 9E 04  STA ram_collision_ti
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EEA3 07:EE93: E0 00     CPX #$00
    BNE     bra_EEB4             ; BNE  ; orig: C - - - - - 0x01EEA5 07:EE95: D0 1D     BNE bra_EEB4

; if link
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01EEA7 07:EE97: A5 EB     LDA ram_map_location
    CMPI.B  #con_map_location + $1F,D0  ; orig: C - - - - - 0x01EEA9 07:EE99: C9 1F     CMP #con_map_locatio
    BNE     bra_EEB4             ; BNE  ; orig: C - - - - - 0x01EEAB 07:EE9B: D0 17     BNE bra_EEB4
    MOVE.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01EEAD 07:EE9D: A9 0C     LDA #con_dir__UD
    AND.B   ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EEAF 07:EE9F: 25 0F     AND ram_000F_t01_dir
    BEQ     bra_EEB4             ; BEQ  ; orig: C - - - - - 0x01EEB1 07:EEA1: F0 11     BEQ bra_EEB4
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01EEB3 07:EEA3: A5 70     LDA ram_pos_X_link
    CMPI.B  #$80,D0  ; orig: C - - - - - 0x01EEB5 07:EEA5: C9 80     CMP #$80
    BNE     bra_EEB4             ; BNE  ; orig: C - - - - - 0x01EEB7 07:EEA7: D0 0B     BNE bra_EEB4
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01EEB9 07:EEA9: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$56,D0  ; orig: C - - - - - 0x01EEBB 07:EEAB: C9 56     CMP #$56
    BCS     bra_EEB4             ; BCS  ; orig: C - - - - - 0x01EEBD 07:EEAD: B0 05     BCS bra_EEB4
    MOVE.B  #con_collision_tile + $26,D0  ; orig: C - - - - - 0x01EEBF 07:EEAF: A9 26     LDA #con_collision_t
    MOVE.B  D0,ram_collision_tile_link  ; orig: C - - - - - 0x01EEC1 07:EEB1: 8D 9E 04  STA ram_collision_ti
bra_EEB4:  ; orig: bra_EEB4:
    MOVE.B  ram_collision_tile_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EEC4 07:EEB4: BD 9E 04  LDA ram_collision_ti
bra_EEB7_RTS:  ; orig: bra_EEB7_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EEC7 07:EEB7: 60        RTS



loc_EEB8:  ; orig: loc_EEB8:
sub_0x01EEC8:  ; orig: sub_0x01EEC8:
loc_0x01EEC8:  ; orig: loc_0x01EEC8:
    MOVE.B  ram_00C0_obj(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01EEC8 07:EEB8: B5 C0     LDA ram_00C0_obj,X
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01EECA 07:EEBA: 0A        ASL
    BCC     bra_EEE0             ; BCC  ; orig: C - - - - - 0x01EECB 07:EEBB: 90 23     BCC bra_EEE0
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01EECD 07:EEBD: 4A        LSR
    MOVE.B  D0,ram_00C0_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EECE 07:EEBE: 95 C0     STA ram_00C0_obj,X
    MOVE.B  ram_dir_obj(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01EED0 07:EEC0: B4 98     LDY ram_dir_obj,X
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x01EED2 07:EEC2: C0 03     CPY #$03    ; check 
    BCC     bra_EEDB             ; BCC  ; orig: C - - - - - 0x01EED4 07:EEC4: 90 15     BCC bra_EEDB
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x01EED6 07:EEC6: 29 03     AND #con_dir__LR
    BEQ     bra_EEDA_RTS             ; BEQ  ; orig: C - - - - - 0x01EED8 07:EEC8: F0 10     BEQ bra_EEDA_RTS
bra_EECA:  ; orig: bra_EECA:
    MOVE.B  ram_0394_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EEDA 07:EECA: BD 94 03  LDA ram_0394_obj,X
    BEQ     bra_EEDA_RTS             ; BEQ  ; orig: C - - - - - 0x01EEDD 07:EECD: F0 0B     BEQ bra_EEDA_RTS
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EEDF 07:EECF: E0 00     CPX #$00
    BNE     bra_EEE4             ; BNE  ; orig: C - - - - - 0x01EEE1 07:EED1: D0 11     BNE bra_EEE4
    MOVE.B  ram_dir_link,D0  ; orig: - - - - - - 0x01EEE3 07:EED3: A5 98     LDA ram_dir_link
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: - - - - - - 0x01EEE5 07:EED5: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  D0,ram_00C0_link  ; orig: - - - - - - 0x01EEE8 07:EED8: 85 C0     STA ram_00C0_link
bra_EEDA_RTS:  ; orig: bra_EEDA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EEEA 07:EEDA: 60        RTS
bra_EEDB:  ; orig: bra_EEDB:
    ANDI.B  #$0C,D0  ; orig: C - - - - - 0x01EEEB 07:EEDB: 29 0C     AND #$0C
    BNE     bra_EECA             ; BNE  ; orig: C - - - - - 0x01EEED 07:EEDD: D0 EB     BNE bra_EECA
    RTS                     ; RTS  ; orig: C - - - - - 0x01EEEF 07:EEDF: 60        RTS
bra_EEE0:  ; orig: bra_EEE0:
    MOVE.B  ram_00D3_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EEF0 07:EEE0: B5 D3     LDA ram_00D3_obj,X
    BNE     bra_EEEB             ; BNE  ; orig: C - - - - - 0x01EEF2 07:EEE2: D0 07     BNE bra_EEEB
sub_EEE4:  ; orig: sub_EEE4:
sub_0x01EEF4:  ; orig: sub_0x01EEF4:
loc_0x01EEF4:  ; orig: loc_0x01EEF4:
bra_EEE4:  ; orig: bra_EEE4:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01EEF4 07:EEE4: A9 00     LDA #$00
sub_0x01EEF6:  ; orig: sub_0x01EEF6:
    MOVE.B  D0,ram_00C0_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EEF6 07:EEE6: 95 C0     STA ram_00C0_obj,X
    MOVE.B  D0,ram_00D3_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EEF8 07:EEE8: 95 D3     STA ram_00D3_obj,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01EEFA 07:EEEA: 60        RTS
bra_EEEB:  ; orig: bra_EEEB:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x01EEFB 07:EEEB: A9 04     LDA #$04
    MOVE.B  D0,ram_0003_t19_loop_counter  ; orig: C - - - - - 0x01EEFD 07:EEED: 85 03     STA ram_0003_t19_loo
bra_EEEF_loop:  ; orig: bra_EEEF_loop:
    MOVE.B  ram_0394_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EEFF 07:EEEF: BD 94 03  LDA ram_0394_obj,X
    BNE     bra_EF05             ; BNE  ; orig: C - - - - - 0x01EF02 07:EEF2: D0 11     BNE bra_EF05
    BSR     sub_EDD7             ; JSR -> BSR  ; orig: C - - - - - 0x01EF04 07:EEF4: 20 D7 ED  JSR sub_EDD7
    MOVE.B  ram_00C0_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF07 07:EEF7: B5 C0     LDA ram_00C0_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01EF09 07:EEF9: 29 0F     AND #$0F
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01EF0B 07:EEFB: 85 0F     STA ram_000F_t01_dir
    BSR     sub_EDFA_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01EF0D 07:EEFD: 20 FA ED  JSR sub_EDFA_find_cu
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x01EF10 07:EF00: CD 4A 03  CMP ram_min_collisio
    BCS     bra_EEE4             ; BCS  ; orig: C - - - - - 0x01EF13 07:EF03: B0 DF     BCS bra_EEE4
bra_EF05:  ; orig: bra_EF05:
    MOVE.B  ram_00C0_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF15 07:EF05: B5 C0     LDA ram_00C0_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01EF17 07:EF07: 29 0F     AND #$0F
    BSR     sub_bat_6FB6             ; JSR -> BSR  ; orig: C - - - - - 0x01EF19 07:EF09: 20 B6 6F  JSR sub_bat_6FB6
    BEQ     bra_EEE4             ; BEQ  ; orig: C - - - - - 0x01EF1C 07:EF0C: F0 D6     BEQ bra_EEE4
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x01EF1E 07:EF0E: AD 50 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_36,D0  ; orig: C - - - - - 0x01EF21 07:EF11: C9 36     CMP #con_obj_id_36
    BEQ     bra_EF1D             ; BEQ  ; orig: C - - - - - 0x01EF23 07:EF13: F0 08     BEQ bra_EF1D
    CMPI.B  #$4B,D0  ; orig: C - - - - - 0x01EF25 07:EF15: C9 4B     CMP #$4B
    BCC     bra_EF24             ; BCC  ; orig: C - - - - - 0x01EF27 07:EF17: 90 0B     BCC bra_EF24
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x01EF29 07:EF19: C9 53     CMP #$53
    BCS     bra_EF24             ; BCS  ; orig: C - - - - - 0x01EF2B 07:EF1B: B0 07     BCS bra_EF24
bra_EF1D:  ; orig: bra_EF1D:
    BSR     sub_bat_6E46             ; JSR -> BSR  ; orig: C - - - - - 0x01EF2D 07:EF1D: 20 46 6E  JSR sub_bat_6E46
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01EF30 07:EF20: A5 0F     LDA ram_000F_t01_dir
    BEQ     bra_EEE4             ; BEQ  ; orig: C - - - - - 0x01EF32 07:EF22: F0 C0     BEQ bra_EEE4
bra_EF24:  ; orig: bra_EF24:
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x01EF34 07:EF24: A0 01     LDY #$01
    MOVE.B  ram_00C0_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF36 07:EF26: B5 C0     LDA ram_00C0_obj,X
    ANDI.B  #$05,D0  ; orig: C - - - - - 0x01EF38 07:EF28: 29 05     AND #$05
    BNE     bra_EF2E             ; BNE  ; orig: C - - - - - 0x01EF3A 07:EF2A: D0 02     BNE bra_EF2E
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x01EF3C 07:EF2C: A0 FF     LDY #$FF
bra_EF2E:  ; orig: bra_EF2E:
    MOVE.B  D2,ram_0002_t43_pos  ; orig: C - - - - - 0x01EF3E 07:EF2E: 84 02     STY ram_0002_t43_pos
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01EF40 07:EF30: D6 D3     DEC ram_00D3_obj,X
    MOVE.B  ram_0394_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF42 07:EF32: BD 94 03  LDA ram_0394_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EF45 07:EF35: 18        CLC
    ADDX.B  ram_0002_t43_pos,D0  ; orig: C - - - - - 0x01EF46 07:EF36: 65 02     ADC ram_0002_t43_pos
    MOVE.B  D0,ram_0394_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EF48 07:EF38: 9D 94 03  STA ram_0394_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01EF4B 07:EF3B: 29 0F     AND #$0F
    BEQ     bra_EF47             ; BEQ  ; orig: C - - - - - 0x01EF4D 07:EF3D: F0 08     BEQ bra_EF47
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EF4F 07:EF3F: E0 00     CPX #$00
    BNE     bra_EF4A             ; BNE  ; orig: C - - - - - 0x01EF51 07:EF41: D0 07     BNE bra_EF4A

; if link
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01EF53 07:EF43: 29 07     AND #$07
    BNE     bra_EF4A             ; BNE  ; orig: C - - - - - 0x01EF55 07:EF45: D0 03     BNE bra_EF4A
bra_EF47:  ; orig: bra_EF47:
    MOVE.B  D0,ram_0394_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EF57 07:EF47: 9D 94 03  STA ram_0394_obj,X
bra_EF4A:  ; orig: bra_EF4A:
    MOVE.B  ram_00C0_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF5A 07:EF4A: B5 C0     LDA ram_00C0_obj,X
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01EF5C 07:EF4C: 29 03     AND #$03
    BEQ     bra_EF5A             ; BEQ  ; orig: C - - - - - 0x01EF5E 07:EF4E: F0 0A     BEQ bra_EF5A
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF60 07:EF50: B5 70     LDA ram_pos_X_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EF62 07:EF52: 18        CLC
    ADDX.B  ram_0002_t43_pos,D0  ; orig: C - - - - - 0x01EF63 07:EF53: 65 02     ADC ram_0002_t43_pos
    MOVE.B  D0,ram_pos_X_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EF65 07:EF55: 95 70     STA ram_pos_X_obj,X
    JMP     loc_EF61  ; orig: C - - - - - 0x01EF67 07:EF57: 4C 61 EF  JMP loc_EF61
bra_EF5A:  ; orig: bra_EF5A:
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EF6A 07:EF5A: B5 84     LDA ram_pos_Y_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01EF6C 07:EF5C: 18        CLC
    ADDX.B  ram_0002_t43_pos,D0  ; orig: C - - - - - 0x01EF6D 07:EF5D: 65 02     ADC ram_0002_t43_pos
    MOVE.B  D0,ram_pos_Y_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01EF6F 07:EF5F: 95 84     STA ram_pos_Y_obj,X
loc_EF61:  ; orig: loc_EF61:
    SUBQ.B  #1,ram_0003_t19_loop_counter  ; orig: C D 3 - - - 0x01EF71 07:EF61: C6 03     DEC ram_0003_t19_loo
    BNE     bra_EEEF_loop             ; BNE  ; orig: C - - - - - 0x01EF73 07:EF63: D0 8A     BNE bra_EEEF_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01EF75 07:EF65: 60        RTS



tbl_EF66_flute_map_locations:  ; orig: tbl_EF66_flute_map_locations:
    ; [DIRECTIVE] .BYTE con_map_location + $42  -- needs manual handling  ; orig: - D 3 - - - 0x01EF76 07:EF66: 42        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $06  -- needs manual handling  ; orig: - D 3 - - - 0x01EF77 07:EF67: 06        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $29  -- needs manual handling  ; orig: - D 3 - - - 0x01EF78 07:EF68: 29        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $2B  -- needs manual handling  ; orig: - D 3 - - - 0x01EF79 07:EF69: 2B        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $30  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7A 07:EF6A: 30        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $3A  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7B 07:EF6B: 3A        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $3C  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7C 07:EF6C: 3C        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $58  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7D 07:EF6D: 58        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $60  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7E 07:EF6E: 60        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $6E  -- needs manual handling  ; orig: - D 3 - - - 0x01EF7F 07:EF6F: 6E        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $72  -- needs manual handling  ; orig: - D 3 - - - 0x01EF80 07:EF70: 72        .byte con_map_locati



ofs_021_0x01EF81_05_flute:  ; orig: ofs_021_0x01EF81_05_flute:
    MOVE.B  #con_sfx_2_flute,D0  ; orig: C - - J - - 0x01EF81 07:EF71: A9 10     LDA #con_sfx_2_flute
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x01EF83 07:EF73: 8D 02 06  STA ram_sfx_2
    MOVE.B  #$98,D0  ; orig: C - - - - - 0x01EF86 07:EF76: A9 98     LDA #$98
    ; (empty translation for STA)  ; orig: C - - - - - 0x01EF88 07:EF78: 85 3C     STA ram_timer_obj + 
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01EF8A 07:EF7A: A5 10     LDA ram_dungeon_leve
    BNE     bra_EFC7             ; BNE  ; orig: C - - - - - 0x01EF8C 07:EF7C: D0 49     BNE bra_EFC7    ; if

; if overworld
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01EF8E 07:EF7E: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01EF90 07:EF80: C9 05     CMP #con_script_05_g
    BNE     bra_EFB8_RTS             ; BNE  ; orig: C - - - - - 0x01EF92 07:EF82: D0 34     BNE bra_EFB8_RTS
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x01EF94 07:EF84: A4 16     LDY ram_current_save
    MOVE.B  ram_current_quest(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EF96 07:EF86: B9 2D 06  LDA ram_current_ques
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01EF99 07:EF89: 48        PHA
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01EF9A 07:EF8A: A5 EB     LDA ram_map_location
    MOVE.B  #$0A,D2  ; orig: C - - - - - 0x01EF9C 07:EF8C: A0 0A     LDY #$0A
bra_EF8E_loop:  ; orig: bra_EF8E_loop:
    CMP.B   tbl_EF66_flute_map_locations(D2.L),D0  ; orig: C - - - - - 0x01EF9E 07:EF8E: D9 66 EF  CMP tbl_EF66_flute_m
    BEQ     bra_EF98_match_found             ; BEQ  ; orig: C - - - - - 0x01EFA1 07:EF91: F0 05     BEQ bra_EF98_match_f
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EFA3 07:EF93: 88        DEY
    BPL     bra_EF8E_loop             ; BPL  ; orig: C - - - - - 0x01EFA4 07:EF94: 10 F8     BPL bra_EF8E_loop
    BMI     bra_EFB9_no_matches_found             ; BMI  ; orig: C - - - - - 0x01EFA6 07:EF96: 30 21     BMI bra_EFB9_no_matc
bra_EF98_match_found:  ; orig: bra_EF98_match_found:

; bzk better check for an actual 42 location rather than checking for table index
    CMPI.B  #$00,D2  ; orig: C - - - - - 0x01EFA8 07:EF98: C0 00     CPY #$00
    BNE     bra_EFA1             ; BNE  ; orig: C - - - - - 0x01EFAA 07:EF9A: D0 05     BNE bra_EFA1

; if location 42
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01EFAC 07:EF9C: 68        PLA ; ram_current_qu
    BNE     bra_EFBA             ; BNE  ; orig: C - - - - - 0x01EFAD 07:EF9D: D0 1B     BNE bra_EFBA    ; if
    BEQ     bra_EFA4             ; BEQ  ; orig: C - - - - - 0x01EFAF 07:EF9F: F0 03     BEQ bra_EFA4    ; jm
bra_EFA1:  ; orig: bra_EFA1:

; if not location 42
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01EFB1 07:EFA1: 68        PLA ; ram_current_qu
    BEQ     bra_EFBA             ; BEQ  ; orig: C - - - - - 0x01EFB2 07:EFA2: F0 16     BEQ bra_EFBA    ; if

; if 2nd quest
bra_EFA4:  ; orig: bra_EFA4:
    MOVE.B  ram_051A,D0  ; orig: C - - - - - 0x01EFB4 07:EFA4: AD 1A 05  LDA ram_051A
    BNE     bra_EFB8_RTS             ; BNE  ; orig: C - - - - - 0x01EFB7 07:EFA7: D0 0F     BNE bra_EFB8_RTS
    MOVE.B  #$09,D2  ; orig: C - - - - - 0x01EFB9 07:EFA9: A0 09     LDY #$09
bra_EFAB_loop:  ; orig: bra_EFAB_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01EFBB 07:EFAB: 88        DEY
    BMI     bra_EFB8_RTS             ; BMI  ; orig: C - - - - - 0x01EFBC 07:EFAC: 30 0A     BMI bra_EFB8_RTS
    MOVE.B  ram_obj_id_enemy(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01EFBE 07:EFAE: B9 50 03  LDA ram_obj_id_enemy
    BNE     bra_EFAB_loop             ; BNE  ; orig: C - - - - - 0x01EFC1 07:EFB1: D0 F8     BNE bra_EFAB_loop
    MOVE.B  #con_obj_id_5E,D0  ; orig: C - - - - - 0x01EFC3 07:EFB3: A9 5E     LDA #con_obj_id_5E
    MOVE.B  D0,ram_obj_id_enemy(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01EFC5 07:EFB5: 99 50 03  STA ram_obj_id_enemy
bra_EFB8_RTS:  ; orig: bra_EFB8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EFC8 07:EFB8: 60        RTS
bra_EFB9_no_matches_found:  ; orig: bra_EFB9_no_matches_found:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01EFC9 07:EFB9: 68        PLA
bra_EFBA:  ; orig: bra_EFBA:
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01EFCA 07:EFBA: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01EFCC 07:EFBC: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0060B8             ; JSR -> BSR  ; orig: C - - - - - 0x01EFCF 07:EFBF: 20 A8 A0  JSR sub_0x0060B8
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01EFD2 07:EFC2: A9 05     LDA #con_prg_bank + 
    JMP     loc_FFAC_prg_bankswitch  ; orig: C - - - - - 0x01EFD4 07:EFC4: 4C AC FF  JMP loc_FFAC_prg_ban
bra_EFC7:  ; orig: bra_EFC7:
    MOVE.B  ram_051B,D0  ; orig: C - - - - - 0x01EFD7 07:EFC7: AD 1B 05  LDA ram_051B
    BNE     bra_EFCF_RTS             ; BNE  ; orig: C - - - - - 0x01EFDA 07:EFCA: D0 03     BNE bra_EFCF_RTS
    ADDQ.B  #1,ram_051B  ; orig: C - - - - - 0x01EFDC 07:EFCC: EE 1B 05  INC ram_051B
bra_EFCF_RTS:  ; orig: bra_EFCF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01EFDF 07:EFCF: 60        RTS



sub_EFD0:  ; orig: sub_EFD0:
sub_0x01EFE0:  ; orig: sub_0x01EFE0:
    MOVE.B  ram_00C0_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01EFE0 07:EFD0: B5 C0     LDA ram_00C0_enemy,X
    BEQ     bra_EFD7             ; BEQ  ; orig: C - - - - - 0x01EFE2 07:EFD2: F0 03     BEQ bra_EFD7
    JMP     loc_EEB8  ; orig: C - - - - - 0x01EFE4 07:EFD4: 4C B8 EE  JMP loc_EEB8
bra_EFD7:  ; orig: bra_EFD7:
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EFE7 07:EFD7: E0 00     CPX #$00
    BNE     bra_EFE9             ; BNE  ; orig: C - - - - - 0x01EFE9 07:EFD9: D0 0E     BNE bra_EFE9
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x01EFEB 07:EFDB: AD 94 03  LDA ram_0394_link
    BEQ     bra_EFE9             ; BEQ  ; orig: C - - - - - 0x01EFEE 07:EFDE: F0 09     BEQ bra_EFE9
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x01EFF0 07:EFE0: AD F8 03  LDA ram_03F8_link
    BEQ     bra_F001             ; BEQ  ; orig: C - - - - - 0x01EFF3 07:EFE3: F0 1C     BEQ bra_F001
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01EFF5 07:EFE5: A5 98     LDA ram_dir_link
    BNE     bra_F003             ; BNE  ; orig: C - - - - - 0x01EFF7 07:EFE7: D0 1A     BNE bra_F003
bra_EFE9:  ; orig: bra_EFE9:
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01EFF9 07:EFE9: E0 00     CPX #$00
    BEQ     bra_EFF4             ; BEQ  ; orig: C - - - - - 0x01EFFB 07:EFEB: F0 07     BEQ bra_EFF4
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x01EFFD 07:EFED: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x01F000 07:EFF0: 15 3D     ORA ram_003D_enemy,X
    BNE     bra_EFCF_RTS             ; BNE  ; orig: C - - - - - 0x01F002 07:EFF2: D0 DB     BNE bra_EFCF_RTS
bra_EFF4:  ; orig: bra_EFF4:
    MOVE.B  ram_03F8_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F004 07:EFF4: BD F8 03  LDA ram_03F8_obj,X
    BEQ     bra_F001             ; BEQ  ; orig: C - - - - - 0x01F007 07:EFF7: F0 08     BEQ bra_F001
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F009 07:EFF9: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F00C 07:EFFC: B9 C3 6D  LDA tbl_bat_6DC3_dir
    BNE     bra_F003             ; BNE  ; orig: C - - - - - 0x01F00F 07:EFFF: D0 02     BNE bra_F003    ; jm
bra_F001:  ; orig: bra_F001:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F011 07:F001: A9 00     LDA #$00
bra_F003:  ; orig: bra_F003:
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F013 07:F003: 29 0F     AND #$0F
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F015 07:F005: 85 0F     STA ram_000F_t01_dir
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F017 07:F007: A9 00     LDA #$00
    MOVE.B  D0,ram_000E_t09  ; orig: C - - - - - 0x01F019 07:F009: 85 0E     STA ram_000E_t09
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F01B 07:F00B: E0 00     CPX #$00
    BNE     bra_F01D             ; BNE  ; orig: C - - - - - 0x01F01D 07:F00D: D0 0E     BNE bra_F01D
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F01F 07:F00F: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01F021 07:F011: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01F023 07:F013: C9 10     CMP #$10
    BEQ     bra_F01B             ; BEQ  ; orig: C - - - - - 0x01F025 07:F015: F0 04     BEQ bra_F01B
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01F027 07:F017: C9 20     CMP #$20
    BNE     bra_F01D             ; BNE  ; orig: C - - - - - 0x01F029 07:F019: D0 02     BNE bra_F01D
bra_F01B:  ; orig: bra_F01B:
    MOVE.B  D1,ram_000F_t01_direction  ; orig: C - - - - - 0x01F02B 07:F01B: 86 0F     STX ram_000F_t01_dir
bra_F01D:  ; orig: bra_F01D:
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F02D 07:F01D: E0 00     CPX #$00
    BNE     bra_F063             ; BNE  ; orig: C - - - - - 0x01F02F 07:F01F: D0 42     BNE bra_F063
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01F031 07:F021: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F033 07:F023: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x00614E             ; JSR -> BSR  ; orig: C - - - - - 0x01F036 07:F026: 20 3E A1  JSR sub_0x00614E
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x01F039 07:F029: AD 50 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_36,D0  ; orig: C - - - - - 0x01F03C 07:F02C: C9 36     CMP #con_obj_id_36
    BEQ     bra_F038             ; BEQ  ; orig: C - - - - - 0x01F03E 07:F02E: F0 08     BEQ bra_F038
    CMPI.B  #$4B,D0  ; orig: C - - - - - 0x01F040 07:F030: C9 4B     CMP #$4B
    BCC     bra_F03B             ; BCC  ; orig: C - - - - - 0x01F042 07:F032: 90 07     BCC bra_F03B
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x01F044 07:F034: C9 53     CMP #$53
    BCS     bra_F03B             ; BCS  ; orig: C - - - - - 0x01F046 07:F036: B0 03     BCS bra_F03B
bra_F038:  ; orig: bra_F038:
    BSR     sub_bat_6E46             ; JSR -> BSR  ; orig: C - - - - - 0x01F048 07:F038: 20 46 6E  JSR sub_bat_6E46
bra_F03B:  ; orig: bra_F03B:
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01F04B 07:F03B: A5 53     LDA ram_0053
    BNE     bra_F066             ; BNE  ; orig: C - - - - - 0x01F04D 07:F03D: D0 27     BNE bra_F066
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F04F 07:F03F: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01F051 07:F041: C9 09     CMP #con_script_09
    BEQ     bra_F04D             ; BEQ  ; orig: C - - - - - 0x01F053 07:F043: F0 08     BEQ bra_F04D
    CMPI.B  #con_script_0B,D0  ; orig: C - - - - - 0x01F055 07:F045: C9 0B     CMP #con_script_0B
    BEQ     bra_F04D             ; BEQ  ; orig: C - - - - - 0x01F057 07:F047: F0 04     BEQ bra_F04D
    CMPI.B  #con_script_0C,D0  ; orig: C - - - - - 0x01F059 07:F049: C9 0C     CMP #con_script_0C
    BNE     bra_F05B             ; BNE  ; orig: C - - - - - 0x01F05B 07:F04B: D0 0E     BNE bra_F05B
bra_F04D:  ; orig: bra_F04D:
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01F05D 07:F04D: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F05F 07:F04F: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014EE7             ; JSR -> BSR  ; orig: C - - - - - 0x01F062 07:F052: 20 D7 8E  JSR sub_0x014EE7
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F065 07:F055: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01F067 07:F057: C9 09     CMP #con_script_09
    BEQ     bra_F066             ; BEQ  ; orig: C - - - - - 0x01F069 07:F059: F0 0B     BEQ bra_F066
bra_F05B:  ; orig: bra_F05B:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F06B 07:F05B: A5 10     LDA ram_dungeon_leve
    BEQ     bra_F066             ; BEQ  ; orig: C - - - - - 0x01F06D 07:F05D: F0 07     BEQ bra_F066    ; if

; if dungeon
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01F06F 07:F05F: A5 53     LDA ram_0053
    BNE     bra_F066             ; BNE  ; orig: C - - - - - 0x01F071 07:F061: D0 03     BNE bra_F066
bra_F063:  ; orig: bra_F063:
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x01F073 07:F063: 20 B8 6F  JSR sub_bat_6FB8
bra_F066:  ; orig: bra_F066:
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F076 07:F066: E0 00     CPX #$00
    BNE     bra_F07E             ; BNE  ; orig: C - - - - - 0x01F078 07:F068: D0 14     BNE bra_F07E
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F07A 07:F06A: A5 10     LDA ram_dungeon_leve
    BEQ     bra_F07E             ; BEQ  ; orig: C - - - - - 0x01F07C 07:F06C: F0 10     BEQ bra_F07E    ; if

; if dungeon
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F07E 07:F06E: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01F080 07:F070: C9 09     CMP #con_script_09
    BEQ     bra_F07E             ; BEQ  ; orig: C - - - - - 0x01F082 07:F072: F0 0A     BEQ bra_F07E
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01F084 07:F074: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F086 07:F076: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x01518C             ; JSR -> BSR  ; orig: C - - - - - 0x01F089 07:F079: 20 7C 91  JSR sub_0x01518C
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F08C 07:F07C: A2 00     LDX #$00
bra_F07E:  ; orig: bra_F07E:
    BSR     sub_F0E3             ; JSR -> BSR  ; orig: C - - - - - 0x01F08E 07:F07E: 20 E3 F0  JSR sub_F0E3
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F091 07:F081: E0 00     CPX #$00
    BNE     bra_F08D             ; BNE  ; orig: C - - - - - 0x01F093 07:F083: D0 08     BNE bra_F08D
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01F095 07:F085: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F097 07:F087: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014F8B             ; JSR -> BSR  ; orig: C - - - - - 0x01F09A 07:F08A: 20 7B 8F  JSR sub_0x014F8B
bra_F08D:  ; orig: bra_F08D:
sub_F08D:  ; orig: sub_F08D:
sub_0x01F09D:  ; orig: sub_0x01F09D:
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01F09D 07:F08D: A9 08     LDA #$08
    MOVE.B  #$F8,D2  ; orig: C - - - - - 0x01F09F 07:F08F: A0 F8     LDY #$F8
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F0A1 07:F091: E0 00     CPX #$00
    BEQ     bra_F099_it_is_link             ; BEQ  ; orig: C - - - - - 0x01F0A3 07:F093: F0 04     BEQ bra_F099_it_is_l

; if enemy
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01F0A5 07:F095: A9 10     LDA #$10
    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x01F0A7 07:F097: A0 F0     LDY #$F0
bra_F099_it_is_link:  ; orig: bra_F099_it_is_link:
    MOVE.B  D0,ram_010E  ; orig: C - - - - - 0x01F0A9 07:F099: 8D 0E 01  STA ram_010E
    MOVE.B  D2,ram_010F  ; orig: C - - - - - 0x01F0AC 07:F09C: 8C 0F 01  STY ram_010F
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01F0AF 07:F09F: A5 0F     LDA ram_000F_t01_dir
    BEQ     bra_F0C0_RTS             ; BEQ  ; orig: C - - - - - 0x01F0B1 07:F0A1: F0 1D     BEQ bra_F0C0_RTS
    BSR     sub_F0AC             ; JSR -> BSR  ; orig: C - - - - - 0x01F0B3 07:F0A3: 20 AC F0  JSR sub_F0AC
    BSR     sub_F0AC             ; JSR -> BSR  ; orig: C - - - - - 0x01F0B6 07:F0A6: 20 AC F0  JSR sub_F0AC
    BSR     sub_F0AC             ; JSR -> BSR  ; orig: C - - - - - 0x01F0B9 07:F0A9: 20 AC F0  JSR sub_F0AC
sub_F0AC:  ; orig: sub_F0AC:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01F0BC 07:F0AC: A5 0F     LDA ram_000F_t01_dir
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F0BE 07:F0AE: 4A        LSR
    BCS     bra_F0CB_right             ; BCS  ; orig: C - - - - - 0x01F0BF 07:F0AF: B0 1A     BCS bra_F0CB_right
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F0C1 07:F0B1: 4A        LSR
    BCS     bra_F0D5_left             ; BCS  ; orig: C - - - - - 0x01F0C2 07:F0B2: B0 21     BCS bra_F0D5_left
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F0C4 07:F0B4: 4A        LSR
    BCS     bra_F0C1_down             ; BCS  ; orig: C - - - - - 0x01F0C5 07:F0B5: B0 0A     BCS bra_F0C1_down

; if up
    BSR     sub_bat_6FE8             ; JSR -> BSR  ; orig: C - - - - - 0x01F0C7 07:F0B7: 20 E8 6F  JSR sub_bat_6FE8
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F0CA 07:F0BA: B5 84     LDA ram_pos_Y_obj,X
    SUBX.B  #$00,D0       ; SBC imm  ; orig: C - - - - - 0x01F0CC 07:F0BC: E9 00     SBC #$00
    MOVE.B  D0,ram_pos_Y_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F0CE 07:F0BE: 95 84     STA ram_pos_Y_obj,X
bra_F0C0_RTS:  ; orig: bra_F0C0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F0D0 07:F0C0: 60        RTS
bra_F0C1_down:  ; orig: bra_F0C1_down:
    BSR     sub_bat_6FC1             ; JSR -> BSR  ; orig: C - - - - - 0x01F0D1 07:F0C1: 20 C1 6F  JSR sub_bat_6FC1
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F0D4 07:F0C4: B5 84     LDA ram_pos_Y_obj,X
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F0D6 07:F0C6: 69 00     ADC #$00
    MOVE.B  D0,ram_pos_Y_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F0D8 07:F0C8: 95 84     STA ram_pos_Y_obj,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01F0DA 07:F0CA: 60        RTS
bra_F0CB_right:  ; orig: bra_F0CB_right:
    BSR     sub_bat_6FC1             ; JSR -> BSR  ; orig: C - - - - - 0x01F0DB 07:F0CB: 20 C1 6F  JSR sub_bat_6FC1
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F0DE 07:F0CE: B5 70     LDA ram_pos_X_obj,X
    ADDX.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F0E0 07:F0D0: 69 00     ADC #$00
    MOVE.B  D0,ram_pos_X_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F0E2 07:F0D2: 95 70     STA ram_pos_X_obj,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01F0E4 07:F0D4: 60        RTS
bra_F0D5_left:  ; orig: bra_F0D5_left:
    BSR     sub_bat_6FE8             ; JSR -> BSR  ; orig: C - - - - - 0x01F0E5 07:F0D5: 20 E8 6F  JSR sub_bat_6FE8
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F0E8 07:F0D8: B5 70     LDA ram_pos_X_obj,X
    SUBX.B  #$00,D0       ; SBC imm  ; orig: C - - - - - 0x01F0EA 07:F0DA: E9 00     SBC #$00
    MOVE.B  D0,ram_pos_X_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F0EC 07:F0DC: 95 70     STA ram_pos_X_obj,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01F0EE 07:F0DE: 60        RTS



tbl_F0DF:  ; orig: tbl_F0DF:
    ; [DIRECTIVE] .BYTE $3D  -- needs manual handling  ; orig: - D 3 - - - 0x01F0EF 07:F0DF: 3D        .byte $3D   ; 00
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 3 - - - 0x01F0F0 07:F0E0: DD        .byte $DD   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F0F1 07:F0E1: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 3 - - - 0x01F0F2 07:F0E2: F0        .byte $F0   ; 03



sub_F0E3:  ; orig: sub_F0E3:
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F0F3 07:F0E3: E0 00     CPX #$00
    BNE     bra_F0F2             ; BNE  ; orig: C - - - - - 0x01F0F5 07:F0E5: D0 0B     BNE bra_F0F2
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01F0F7 07:F0E7: A5 53     LDA ram_0053
    BEQ     bra_F0EE             ; BEQ  ; orig: C - - - - - 0x01F0F9 07:F0E9: F0 03     BEQ bra_F0EE
    JMP     loc_F14E  ; orig: C - - - - - 0x01F0FB 07:F0EB: 4C 4E F1  JMP loc_F14E
bra_F0EE:  ; orig: bra_F0EE:
    MOVE.B  ram_000E_t09,D0  ; orig: C - - - - - 0x01F0FE 07:F0EE: A5 0E     LDA ram_000E_t09
    BMI     bra_F148_RTS             ; BMI  ; orig: C - - - - - 0x01F100 07:F0F0: 30 56     BMI bra_F148_RTS
bra_F0F2:  ; orig: bra_F0F2:
    MOVE.B  ram_0394_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F102 07:F0F2: BD 94 03  LDA ram_0394_obj,X
    BNE     bra_F148_RTS             ; BNE  ; orig: C - - - - - 0x01F105 07:F0F5: D0 51     BNE bra_F148_RTS

; A = 00
    MOVE.B  D0,ram_000E_t10_script_handler  ; orig: C - - - - - 0x01F107 07:F0F7: 85 0E     STA ram_000E_t10_scr
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01F109 07:F0F9: A5 0F     LDA ram_000F_t01_dir
    BNE     bra_F116             ; BNE  ; orig: C - - - - - 0x01F10B 07:F0FB: D0 19     BNE bra_F116
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F10D 07:F0FD: E0 00     CPX #$00
    BEQ     bra_F148_RTS             ; BEQ  ; orig: C - - - - - 0x01F10F 07:F0FF: F0 47     BEQ bra_F148_RTS

; triggers when a flying sword hits a wall and explodes
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F111 07:F101: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_10,D0  ; orig: C - - - - - 0x01F114 07:F104: 29 10     AND #con_04C0_10
    BNE     bra_F110             ; BNE  ; orig: C - - - - - 0x01F116 07:F106: D0 08     BNE bra_F110    ; bz

; bzk optimize, useless LDA + STA
    MOVE.B  ram_03F8_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F118 07:F108: BD F8 03  LDA ram_03F8_enemy,X
    MOVE.B  D0,ram_000F_t07_useless  ; orig: C - - - - - 0x01F11B 07:F10B: 85 0F     STA ram_000F_t07_use
    JMP     loc_F129  ; orig: C - - - - - 0x01F11D 07:F10D: 4C 29 F1  JMP loc_F129
bra_F110:  ; orig: bra_F110:
    BSR     sub_F1D0             ; JSR -> BSR  ; orig: - - - - - - 0x01F120 07:F110: 20 D0 F1  JSR sub_F1D0
    JMP     loc_F198  ; orig: - - - - - - 0x01F123 07:F113: 4C 98 F1  JMP loc_F198
bra_F116:  ; orig: bra_F116:
bra_F116_loop:  ; orig: bra_F116_loop:
    BSR     sub_EDFA_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01F126 07:F116: 20 FA ED  JSR sub_EDFA_find_cu
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x01F129 07:F119: CD 4A 03  CMP ram_min_collisio
    BCC     bra_F14E             ; BCC  ; orig: C - - - - - 0x01F12C 07:F11C: 90 30     BCC bra_F14E
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01F12E 07:F11E: E0 00     CPX #$00
    BEQ     bra_F133             ; BEQ  ; orig: C - - - - - 0x01F130 07:F120: F0 11     BEQ bra_F133
bra_F122:  ; orig: bra_F122:

; triggers when an enemy hits an obstacle while moving
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F132 07:F122: BD BF 04  LDA ram_attr_enemy -
    ANDI.B  #con_04C0_10,D0  ; orig: C - - - - - 0x01F135 07:F125: 29 10     AND #con_04C0_10
    BNE     bra_F110             ; BNE  ; orig: C - - - - - 0x01F137 07:F127: D0 E7     BNE bra_F110    ; bz
loc_F129:  ; orig: loc_F129:
    BSR     sub_F1A0             ; JSR -> BSR  ; orig: C D 3 - - - 0x01F139 07:F129: 20 A0 F1  JSR sub_F1A0
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F13C 07:F12C: 85 0F     STA ram_000F_t01_dir
    MOVE.B  ram_000E_t10_script_handler,D0  ; orig: C - - - - - 0x01F13E 07:F12E: A5 0E     LDA ram_000E_t10_scr
    BNE     bra_F116_loop             ; BNE  ; orig: C - - - - - 0x01F140 07:F130: D0 E4     BNE bra_F116_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01F142 07:F132: 60        RTS
bra_F133:  ; orig: bra_F133:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F143 07:F133: A5 10     LDA ram_dungeon_leve
    BNE     bra_F13F             ; BNE  ; orig: C - - - - - 0x01F145 07:F135: D0 08     BNE bra_F13F    ; if

; if overworld
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01F147 07:F137: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F149 07:F139: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x006233             ; JSR -> BSR  ; orig: C - - - - - 0x01F14C 07:F13C: 20 23 A2  JSR sub_0x006233
bra_F13F:  ; orig: bra_F13F:
    BSR     sub_F149_set_00_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F14F 07:F13F: 20 49 F1  JSR sub_F149_set_00_
    MOVE.B  D0,ram_btn_press  ; orig: C - - - - - 0x01F152 07:F142: 85 F8     STA ram_btn_press
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F154 07:F144: A5 10     LDA ram_dungeon_leve
    BEQ     bra_F14E             ; BEQ  ; orig: C - - - - - 0x01F156 07:F146: F0 06     BEQ bra_F14E    ; if

; if dungeon
bra_F148_RTS:  ; orig: bra_F148_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F158 07:F148: 60        RTS



sub_F149_set_00_direction:  ; orig: sub_F149_set_00_direction:
loc_0x01F159_set_00_direction:  ; orig: loc_0x01F159_set_00_direction:
    MOVE.B  #con_dir_00,D0  ; orig: C D 3 - - - 0x01F159 07:F149: A9 00     LDA #con_dir_00
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F15B 07:F14B: 85 0F     STA ram_000F_t01_dir
    RTS                     ; RTS  ; orig: C - - - - - 0x01F15D 07:F14D: 60        RTS



bra_F14E:
; bzk
loc_F14E:  ; orig: loc_F14E:
    CMPI.B  #$00,D1  ; orig: C D 3 - - - 0x01F15E 07:F14E: E0 00     CPX #$00
    BNE     bra_F198             ; BNE  ; orig: C - - - - - 0x01F160 07:F150: D0 46     BNE bra_F198
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F162 07:F152: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01F164 07:F154: C9 05     CMP #con_script_05_g
    BNE     bra_F195             ; BNE  ; orig: C - - - - - 0x01F166 07:F156: D0 3D     BNE bra_F195
    MOVE.B  ram_0064,D0  ; orig: C - - - - - 0x01F168 07:F158: A5 64     LDA ram_0064
    BNE     bra_F148_RTS             ; BNE  ; orig: C - - - - - 0x01F16A 07:F15A: D0 EC     BNE bra_F148_RTS
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x01F16C 07:F15C: AD 94 03  LDA ram_0394_link
    BNE     bra_F195             ; BNE  ; orig: C - - - - - 0x01F16F 07:F15F: D0 34     BNE bra_F195
sub_0x01F171:  ; orig: sub_0x01F171:
    MOVE.B  ram_pos_Y_link,D1  ; orig: C - - - - - 0x01F171 07:F161: A6 84     LDX ram_pos_Y_link
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x01F173 07:F163: AD F8 03  LDA ram_03F8_link
    BEQ     bra_F195             ; BEQ  ; orig: C - - - - - 0x01F176 07:F166: F0 2D     BEQ bra_F195
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F178 07:F168: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F17B 07:F16B: B9 C3 6D  LDA tbl_bat_6DC3_dir
    ANDI.B  #$0C,D0  ; orig: C - - - - - 0x01F17E 07:F16E: 29 0C     AND #$0C
    BNE     bra_F174             ; BNE  ; orig: C - - - - - 0x01F180 07:F170: D0 02     BNE bra_F174
    MOVE.B  ram_pos_X_link,D1  ; orig: C - - - - - 0x01F182 07:F172: A6 70     LDX ram_pos_X_link
bra_F174:  ; orig: bra_F174:
    MOVE.B  D1,ram_0000_t43  ; orig: C - - - - - 0x01F184 07:F174: 86 00     STX ram_0000_t43
    MOVE.B  ram_0000_t43,D0  ; orig: C - - - - - 0x01F186 07:F176: A5 00     LDA ram_0000_t43
    CMP.B   tbl_F0DF(D2.L),D0  ; orig: C - - - - - 0x01F188 07:F178: D9 DF F0  CMP tbl_F0DF,Y
    BNE     bra_F195             ; BNE  ; orig: C - - - - - 0x01F18B 07:F17B: D0 18     BNE bra_F195
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F18D 07:F17D: B9 C3 6D  LDA tbl_bat_6DC3_dir
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x01F190 07:F180: 85 98     STA ram_dir_link
sub_0x01F192:  ; orig: sub_0x01F192:
loc_0x01F192:  ; orig: loc_0x01F192:
    ADDQ.B  #1,ram_script  ; orig: C D 3 - - - 0x01F192 07:F182: E6 12     INC ram_script
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F194 07:F184: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x01F196 07:F186: 85 13     STA ram_subscript
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x01F198 07:F188: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F19A 07:F18A: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01F19C 07:F18C: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_00C0_link  ; orig: C - - - - - 0x01F19E 07:F18E: 85 C0     STA ram_00C0_link
    MOVE.B  D0,ram_00D3_link  ; orig: C - - - - - 0x01F1A0 07:F190: 85 D3     STA ram_00D3_link
    MOVE.B  D0,ram_invinc_link  ; orig: C - - - - - 0x01F1A2 07:F192: 8D F0 04  STA ram_invinc_link
bra_F195:  ; orig: bra_F195:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F1A5 07:F195: A2 00     LDX #$00
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1A7 07:F197: 60        RTS
bra_F198:  ; orig: bra_F198:
loc_F198:  ; orig: loc_F198:
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x01F1A8 07:F198: 20 B8 6F  JSR sub_bat_6FB8
    BEQ     bra_F122             ; BEQ  ; orig: C - - - - - 0x01F1AB 07:F19B: F0 85     BEQ bra_F122
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F1AD 07:F19D: 95 98     STA ram_dir_enemy,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1AF 07:F19F: 60        RTS



sub_F1A0:  ; orig: sub_F1A0:
    MOVE.B  ram_000E_t10_script_handler,D0  ; orig: C - - - - - 0x01F1B0 07:F1A0: A5 0E     LDA ram_000E_t10_scr
    ADDQ.B  #1,ram_000E_t10_script_handler  ; orig: C - - - - - 0x01F1B2 07:F1A2: E6 0E     INC ram_000E_t10_scr
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01F1B4 07:F1A4: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_028_F1AF_00
    DC.L    ofs_028_F1C3_01
    DC.L    ofs_028_F1D0_02
    DC.L    ofs_028_F1DA_03



ofs_028_F1AF_00:  ; orig: ofs_028_F1AF_00:
    MOVE.B  #$00,D2  ; orig: C - - J - - 0x01F1BF 07:F1AF: A0 00     LDY #$00
    MOVE.B  ram_indiv_random(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F1C1 07:F1B1: B5 18     LDA ram_indiv_random
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F1C3 07:F1B3: 0A        ASL
    BCS     bra_F1B7             ; BCS  ; orig: C - - - - - 0x01F1C4 07:F1B4: B0 01     BCS bra_F1B7
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01F1C6 07:F1B6: C8        INY
bra_F1B7:  ; orig: bra_F1B7:
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F1C7 07:F1B7: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01F1C9 07:F1B9: 29 0C     AND #con_dir__UD
    BEQ     bra_F1BF             ; BEQ  ; orig: C - - - - - 0x01F1CB 07:F1BB: F0 02     BEQ bra_F1BF
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01F1CD 07:F1BD: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01F1CE 07:F1BE: C8        INY
bra_F1BF:  ; orig: bra_F1BF:
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F1CF 07:F1BF: B9 C3 6D  LDA tbl_bat_6DC3_dir
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1D2 07:F1C2: 60        RTS



ofs_028_F1C3_01:  ; orig: ofs_028_F1C3_01:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - J - - 0x01F1D3 07:F1C3: A5 0F     LDA ram_000F_t01_dir
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F1D5 07:F1C5: 48        PHA
    ANDI.B  #$0A,D0  ; orig: C - - - - - 0x01F1D6 07:F1C6: 29 0A     AND #$0A
    BEQ     bra_F1CD             ; BEQ  ; orig: C - - - - - 0x01F1D8 07:F1C8: F0 03     BEQ bra_F1CD
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F1DA 07:F1CA: 68        PLA
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F1DB 07:F1CB: 4A        LSR
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1DC 07:F1CC: 60        RTS
bra_F1CD:  ; orig: bra_F1CD:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F1DD 07:F1CD: 68        PLA
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F1DE 07:F1CE: 0A        ASL
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1DF 07:F1CF: 60        RTS



sub_F1D0:  ; orig: sub_F1D0:
ofs_028_F1D0_02:  ; orig: ofs_028_F1D0_02:
sub_0x01F1E0:  ; orig: sub_0x01F1E0:

; something to do with shooting arrows enemies
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - J - - 0x01F1E0 07:F1D0: B5 98     LDA ram_dir_enemy,X
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F1E2 07:F1D2: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F1E5 07:F1D5: 95 98     STA ram_dir_enemy,X

; bzk optimize, useless STA
    MOVE.B  D0,ram_000F_t09_useless  ; orig: C - - - - - 0x01F1E7 07:F1D7: 85 0F     STA ram_000F_t09_use
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1E9 07:F1D9: 60        RTS



ofs_028_F1DA_03:  ; orig: ofs_028_F1DA_03:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x01F1EA 07:F1DA: A9 00     LDA #$00
    MOVE.B  D0,ram_000E_t10_script_handler  ; orig: C - - - - - 0x01F1EC 07:F1DC: 85 0E     STA ram_000E_t10_scr
    RTS                     ; RTS  ; orig: C - - - - - 0x01F1EE 07:F1DE: 60        RTS



sub_0x01F1EF:  ; orig: sub_0x01F1EF:
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F1EF 07:F1DF: BD 94 03  LDA ram_0394_enemy,X
    BNE     bra_F1FC_RTS             ; BNE  ; orig: C - - - - - 0x01F1F2 07:F1E2: D0 18     BNE bra_F1FC_RTS
    MOVE.B  D0,ram_000E_t10_script_handler  ; orig: C - - - - - 0x01F1F4 07:F1E4: 85 0E     STA ram_000E_t10_scr
bra_F1E6_loop:  ; orig: bra_F1E6_loop:
    BSR     sub_F1A0             ; JSR -> BSR  ; orig: C - - - - - 0x01F1F6 07:F1E6: 20 A0 F1  JSR sub_F1A0
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F1F9 07:F1E9: 85 0F     STA ram_000F_t01_dir
    BEQ     bra_F1FC_RTS             ; BEQ  ; orig: C - - - - - 0x01F1FB 07:F1EB: F0 0F     BEQ bra_F1FC_RTS
    BSR     sub_EDFA_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01F1FD 07:F1ED: 20 FA ED  JSR sub_EDFA_find_cu
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x01F200 07:F1F0: CD 4A 03  CMP ram_min_collisio
    BCS     bra_F1E6_loop             ; BCS  ; orig: C - - - - - 0x01F203 07:F1F3: B0 F1     BCS bra_F1E6_loop
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x01F205 07:F1F5: 20 B8 6F  JSR sub_bat_6FB8
    BEQ     bra_F1E6_loop             ; BEQ  ; orig: C - - - - - 0x01F208 07:F1F8: F0 EC     BEQ bra_F1E6_loop
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F20A 07:F1FA: 95 98     STA ram_dir_enemy,X
bra_F1FC_RTS:  ; orig: bra_F1FC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F20C 07:F1FC: 60        RTS



tbl_F1FD_stepladder_pos_X:  ; orig: tbl_F1FD_stepladder_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F20D 07:F1FD: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F20E 07:F1FE: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 3 - - - 0x01F20F 07:F1FF: F0        .byte $F0   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 3 - - - 0x01F210 07:F200: 10        .byte $10   ; 03



tbl_F201_stepladder_pos_Y:  ; orig: tbl_F201_stepladder_pos_Y:
    ; [DIRECTIVE] .BYTE $FB  -- needs manual handling  ; orig: - D 3 - - - 0x01F211 07:F201: FB        .byte $FB   ; 00
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 3 - - - 0x01F212 07:F202: 13        .byte $13   ; 01
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F213 07:F203: 03        .byte $03   ; 02
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F214 07:F204: 03        .byte $03   ; 03



tbl_F205:  ; orig: tbl_F205:
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 3 - - - 0x01F215 07:F205: 02        .byte $02   ; 00
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 3 - - - 0x01F216 07:F206: 06        .byte $06   ; 01
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 3 - - - 0x01F217 07:F207: 08        .byte $08   ; 02
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 3 - - - 0x01F218 07:F208: 0A        .byte $0A   ; 03



tbl_F209:  ; orig: tbl_F209:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F219 07:F209: 80        .byte $80   ; 00
    ; [DIRECTIVE] .BYTE $54  -- needs manual handling  ; orig: - D 3 - - - 0x01F21A 07:F20A: 54        .byte $54   ; 01
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 3 - - - 0x01F21B 07:F20B: 60        .byte $60   ; 02
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 3 - - - 0x01F21C 07:F20C: 60        .byte $60   ; 03



tbl_F20D_map_locations_for_stepladder:  ; orig: tbl_F20D_map_locations_for_stepladder:

; for overworld
    ; [DIRECTIVE] .BYTE con_map_location + $17  -- needs manual handling  ; orig: - D 3 - - - 0x01F21D 07:F20D: 17        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $18  -- needs manual handling  ; orig: - D 3 - - - 0x01F21E 07:F20E: 18        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $19  -- needs manual handling  ; orig: - D 3 - - - 0x01F21F 07:F20F: 19        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $27  -- needs manual handling  ; orig: - D 3 - - - 0x01F220 07:F210: 27        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $4F  -- needs manual handling  ; orig: - D 3 - - - 0x01F221 07:F211: 4F        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $5F  -- needs manual handling  ; orig: - D 3 - - - 0x01F222 07:F212: 5F        .byte con_map_locati



sub_0x01F223:  ; orig: sub_0x01F223:
    BSR     sub_F23C             ; JSR -> BSR  ; orig: C - - - - - 0x01F223 07:F213: 20 3C F2  JSR sub_F23C
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01F226 07:F216: A9 04     LDA #con_prg_bank + 
    JMP     loc_FFAC_prg_bankswitch  ; orig: C - - - - - 0x01F228 07:F218: 4C AC FF  JMP loc_FFAC_prg_ban



sub_0x01F22B:  ; orig: sub_0x01F22B:
    BSR     sub_F231             ; JSR -> BSR  ; orig: C - - - - - 0x01F22B 07:F21B: 20 31 F2  JSR sub_F231
loc_F21E_back_to_bank_01:  ; orig: loc_F21E_back_to_bank_01:
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C D 3 - - - 0x01F22E 07:F21E: A9 01     LDA #con_prg_bank + 
    JMP     loc_FFAC_prg_bankswitch  ; orig: C - - - - - 0x01F230 07:F220: 4C AC FF  JMP loc_FFAC_prg_ban



sub_0x01F233:  ; orig: sub_0x01F233:
    BSR     sub_F23C             ; JSR -> BSR  ; orig: C - - - - - 0x01F233 07:F223: 20 3C F2  JSR sub_F23C
    JMP     loc_F21E_back_to_bank_01  ; orig: C - - - - - 0x01F236 07:F226: 4C 1E F2  JMP loc_F21E_back_to



sub_0x01F239:  ; orig: sub_0x01F239:
    BSR     sub_F231             ; JSR -> BSR  ; orig: C - - - - - 0x01F239 07:F229: 20 31 F2  JSR sub_F231
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01F23C 07:F22C: A9 04     LDA #con_prg_bank + 
    JMP     loc_FFAC_prg_bankswitch  ; orig: C - - - - - 0x01F23E 07:F22E: 4C AC FF  JMP loc_FFAC_prg_ban



sub_F231:  ; orig: sub_F231:
sub_0x01F241:  ; orig: sub_0x01F241:
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01F241 07:F231: A9 06     LDA #$06
    MOVE.B  D0,ram_anim_timer_link  ; orig: C - - - - - 0x01F243 07:F233: 8D D0 03  STA ram_anim_timer_l
    BNE     bra_F23C             ; BNE  ; orig: C - - - - - 0x01F246 07:F236: D0 04     BNE bra_F23C    ; jm



sub_0x01F248:  ; orig: sub_0x01F248:
loc_0x01F248:  ; orig: loc_0x01F248:
    MOVE.B  ram_dungeon_level,D0  ; orig: C D 3 - - - 0x01F248 07:F238: A5 10     LDA ram_dungeon_leve
    BNE     bra_F1FC_RTS             ; BNE  ; orig: C - - - - - 0x01F24A 07:F23A: D0 C0     BNE bra_F1FC_RTS    

; if overworld
bra_F23C:  ; orig: bra_F23C:
sub_F23C:  ; orig: sub_F23C:
sub_0x01F24C:  ; orig: sub_0x01F24C:
loc_0x01F24C:  ; orig: loc_0x01F24C:
    MOVE.B  ram_0522_flag,D0  ; orig: C D 3 - - - 0x01F24C 07:F23C: AD 22 05  LDA ram_0522_flag
    BNE     bra_F1FC_RTS             ; BNE  ; orig: C - - - - - 0x01F24F 07:F23F: D0 BB     BNE bra_F1FC_RTS
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01F251 07:F241: AA        TAX
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F252 07:F242: A5 12     LDA ram_script
    CMPI.B  #con_script_screen_trans_start,D0  ; orig: C - - - - - 0x01F254 07:F244: C9 06     CMP #con_script_scre
    BEQ     bra_F255             ; BEQ  ; orig: C - - - - - 0x01F256 07:F246: F0 0D     BEQ bra_F255
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01F258 07:F248: C9 05     CMP #con_script_05_g
    BCC     bra_F255             ; BCC  ; orig: C - - - - - 0x01F25A 07:F24A: 90 09     BCC bra_F255
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x01F25C 07:F24C: AD 94 03  LDA ram_0394_link
    BEQ     bra_F265             ; BEQ  ; orig: C - - - - - 0x01F25F 07:F24F: F0 14     BEQ bra_F265
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01F261 07:F251: 29 07     AND #$07
    BEQ     bra_F258             ; BEQ  ; orig: C - - - - - 0x01F263 07:F253: F0 03     BEQ bra_F258
bra_F255:  ; orig: bra_F255:
    JMP     loc_F2E3  ; orig: C - - - - - 0x01F265 07:F255: 4C E3 F2  JMP loc_F2E3
bra_F258:  ; orig: bra_F258:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F268 07:F258: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x01F26A 07:F25A: 8D 94 03  STA ram_0394_link
    MOVE.B  ram_script,D2  ; orig: C - - - - - 0x01F26D 07:F25D: A4 12     LDY ram_script
    CMPI.B  #con_script_05_gameplay,D2  ; orig: C - - - - - 0x01F26F 07:F25F: C0 05     CPY #con_script_05_g
    BNE     bra_F255             ; BNE  ; orig: C - - - - - 0x01F271 07:F261: D0 F2     BNE bra_F255
    MOVE.B  D0,ram_005A  ; orig: C - - - - - 0x01F273 07:F263: 85 5A     STA ram_005A
bra_F265:  ; orig: bra_F265:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F275 07:F265: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01F277 07:F267: C9 05     CMP #con_script_05_g
    BNE     bra_F255             ; BNE  ; orig: C - - - - - 0x01F279 07:F269: D0 EA     BNE bra_F255
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F27B 07:F26B: A5 10     LDA ram_dungeon_leve
    BNE     bra_F27D             ; BNE  ; orig: C - - - - - 0x01F27D 07:F26D: D0 0E     BNE bra_F27D    ; if

; if overworld
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01F27F 07:F26F: A5 EB     LDA ram_map_location
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x01F281 07:F271: A0 05     LDY #$05
bra_F273_loop:  ; orig: bra_F273_loop:
    CMP.B   tbl_F20D_map_locations_for_stepladder(D2.L),D0  ; orig: C - - - - - 0x01F283 07:F273: D9 0D F2  CMP tbl_F20D_map_loc
    BEQ     bra_F27D             ; BEQ  ; orig: C - - - - - 0x01F286 07:F276: F0 05     BEQ bra_F27D    ; if
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F288 07:F278: 88        DEY
    BPL     bra_F273_loop             ; BPL  ; orig: C - - - - - 0x01F289 07:F279: 10 F8     BPL bra_F273_loop
    BMI     bra_F2E3             ; BMI  ; orig: C - - - - - 0x01F28B 07:F27B: 30 66     BMI bra_F2E3    ; jm
bra_F27D:  ; orig: bra_F27D:
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01F28D 07:F27D: A5 53     LDA ram_0053
    BNE     bra_F2E3             ; BNE  ; orig: C - - - - - 0x01F28F 07:F27F: D0 62     BNE bra_F2E3
    MOVE.B  ram_item_stepladder,D0  ; orig: C - - - - - 0x01F291 07:F281: AD 63 06  LDA ram_item_steplad
    BEQ     bra_F2E3             ; BEQ  ; orig: C - - - - - 0x01F294 07:F284: F0 5D     BEQ bra_F2E3
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01F296 07:F286: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_freeze + con_obj_state_80,D0  ; orig: C - - - - - 0x01F298 07:F288: 29 C0     AND #con_obj_state_f
    CMPI.B  #con_obj_state_freeze,D0  ; orig: C - - - - - 0x01F29A 07:F28A: C9 40     CMP #con_obj_state_f
    BEQ     bra_F2E3             ; BEQ  ; orig: C - - - - - 0x01F29C 07:F28C: F0 55     BEQ bra_F2E3
    MOVE.B  ram_0064,D0  ; orig: C - - - - - 0x01F29E 07:F28E: A5 64     LDA ram_0064
    BNE     bra_F2E3             ; BNE  ; orig: C - - - - - 0x01F2A0 07:F290: D0 51     BNE bra_F2E3
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F2A2 07:F292: A2 00     LDX #$00
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01F2A4 07:F294: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F2A6 07:F296: 85 0F     STA ram_000F_t01_dir
    BSR     sub_EDFA_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01F2A8 07:F298: 20 FA ED  JSR sub_EDFA_find_cu
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x01F2AB 07:F29B: A4 10     LDY ram_dungeon_leve
    BEQ     bra_F2A5             ; BEQ  ; orig: C - - - - - 0x01F2AD 07:F29D: F0 06     BEQ bra_F2A5    ; if

; if dungeon
    CMPI.B  #$F4,D0  ; orig: C - - - - - 0x01F2AF 07:F29F: C9 F4     CMP #$F4
    BEQ     bra_F2AD             ; BEQ  ; orig: C - - - - - 0x01F2B1 07:F2A1: F0 0A     BEQ bra_F2AD
    BNE     bra_F2E3             ; BNE  ; orig: C - - - - - 0x01F2B3 07:F2A3: D0 3E     BNE bra_F2E3    ; jm
bra_F2A5:  ; orig: bra_F2A5:
    CMPI.B  #$8D,D0  ; orig: C - - - - - 0x01F2B5 07:F2A5: C9 8D     CMP #$8D
    BCC     bra_F2E3             ; BCC  ; orig: C - - - - - 0x01F2B7 07:F2A7: 90 3A     BCC bra_F2E3
    CMPI.B  #$99,D0  ; orig: C - - - - - 0x01F2B9 07:F2A9: C9 99     CMP #$99
    BCS     bra_F2E3             ; BCS  ; orig: C - - - - - 0x01F2BB 07:F2AB: B0 36     BCS bra_F2E3

; 8D-98
bra_F2AD:  ; orig: bra_F2AD:

; try to spawn stepladder in front of link
    BSR     sub_FEBB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x01F2BD 07:F2AD: 20 BB FE  JSR sub_FEBB_search_
    BEQ     bra_F2E3             ; BEQ  ; orig: C - - - - - 0x01F2C0 07:F2B0: F0 31     BEQ bra_F2E3    ; if
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x01F2C2 07:F2B2: AD F8 03  LDA ram_03F8_link
    BEQ     bra_F2E3             ; BEQ  ; orig: C - - - - - 0x01F2C5 07:F2B5: F0 2C     BEQ bra_F2E3
    MOVE.B  ram_free_obj_index,D1  ; orig: C - - - - - 0x01F2C7 07:F2B7: A6 59     LDX ram_free_obj_ind
    CMP.B   ram_dir_link,D0  ; orig: C - - - - - 0x01F2C9 07:F2B9: C5 98     CMP ram_dir_link
    BNE     bra_F2E3             ; BNE  ; orig: C - - - - - 0x01F2CB 07:F2BB: D0 26     BNE bra_F2E3
    MOVE.B  D1,ram_0064  ; orig: C - - - - - 0x01F2CD 07:F2BD: 86 64     STX ram_0064
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F2CF 07:F2BF: 95 98     STA ram_dir_enemy,X
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F2D1 07:F2C1: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01F2D4 07:F2C4: A5 70     LDA ram_pos_X_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F2D6 07:F2C6: 18        CLC
    ; !! ADC tbl_F1FD_stepladder_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01F2D7 07:F2C7: 79 FD F1  ADC tbl_F1FD_steplad
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F2DA 07:F2CA: 95 70     STA ram_pos_X_enemy,
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01F2DC 07:F2CC: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F2DE 07:F2CE: 18        CLC
    ; !! ADC tbl_F201_stepladder_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01F2DF 07:F2CF: 79 01 F2  ADC tbl_F201_steplad
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F2E2 07:F2D2: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  #con_obj_id_5F,D0  ; orig: C - - - - - 0x01F2E4 07:F2D4: A9 5F     LDA #con_obj_id_5F
    ; (empty translation for STA)  ; orig: C - - - - - 0x01F2E6 07:F2D6: 9D 4F 03  STA ram_obj_id_enemy
    BSR     sub_EEE4             ; JSR -> BSR  ; orig: C - - - - - 0x01F2E9 07:F2D9: 20 E4 EE  JSR sub_EEE4

; A = 00
    MOVE.B  D0,ram_invinc_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F2EC 07:F2DC: 9D F0 04  STA ram_invinc_enemy
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01F2EF 07:F2DF: A9 01     LDA #$01
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F2F1 07:F2E1: 95 AC     STA ram_state_obj,X
bra_F2E3:  ; orig: bra_F2E3:
loc_F2E3:  ; orig: loc_F2E3:
    MOVE.B  #$00,D1  ; orig: C D 3 - - - 0x01F2F3 07:F2E3: A2 00     LDX #$00
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F2F5 07:F2E5: A5 12     LDA ram_script
    CMPI.B  #con_script_05_gameplay,D0  ; orig: C - - - - - 0x01F2F7 07:F2E7: C9 05     CMP #con_script_05_g
    BNE     bra_F2FD             ; BNE  ; orig: C - - - - - 0x01F2F9 07:F2E9: D0 12     BNE bra_F2FD
    MOVE.B  ram_collision_tile_link,D0  ; orig: C - - - - - 0x01F2FB 07:F2EB: AD 9E 04  LDA ram_collision_ti
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F2FE 07:F2EE: 48        PHA
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01F2FF 07:F2EF: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F301 07:F2F1: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x017404             ; JSR -> BSR  ; orig: C - - - - - 0x01F304 07:F2F4: 20 F4 B3  JSR sub_0x017404
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F307 07:F2F7: A2 00     LDX #$00
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F309 07:F2F9: 68        PLA
    MOVE.B  D0,ram_collision_tile_link  ; orig: C - - - - - 0x01F30A 07:F2FA: 8D 9E 04  STA ram_collision_ti
bra_F2FD:  ; orig: bra_F2FD:
    BSR     sub_FA3C             ; JSR -> BSR  ; orig: C - - - - - 0x01F30D 07:F2FD: 20 3C FA  JSR sub_FA3C
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F310 07:F300: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01F312 07:F302: C9 09     CMP #con_script_09
    BEQ     bra_F30A             ; BEQ  ; orig: C - - - - - 0x01F314 07:F304: F0 04     BEQ bra_F30A
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F316 07:F306: A5 10     LDA ram_dungeon_leve
    BNE     bra_F30E             ; BNE  ; orig: C - - - - - 0x01F318 07:F308: D0 04     BNE bra_F30E    ; if

; if overworld
bra_F30A:  ; orig: bra_F30A:
    ADDQ.B  #1,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F31A 07:F30A: E6 01     INC ram_0001_t15_spr
    ADDQ.B  #1,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F31C 07:F30C: E6 01     INC ram_0001_t15_spr
bra_F30E:  ; orig: bra_F30E:
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01F31E 07:F30E: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_10 + con_obj_state_20,D0  ; orig: C - - - - - 0x01F320 07:F310: 29 30     AND #con_obj_state_1
    CMPI.B  #con_obj_state_10,D0  ; orig: C - - - - - 0x01F322 07:F312: C9 10     CMP #con_obj_state_1
    BEQ     bra_F31A             ; BEQ  ; orig: C - - - - - 0x01F324 07:F314: F0 04     BEQ bra_F31A
    CMPI.B  #con_obj_state_20,D0  ; orig: C - - - - - 0x01F326 07:F316: C9 20     CMP #con_obj_state_2
    BNE     bra_F31F             ; BNE  ; orig: C - - - - - 0x01F328 07:F318: D0 05     BNE bra_F31F
bra_F31A:  ; orig: bra_F31A:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F32A 07:F31A: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F32B 07:F31B: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F32C 07:F31C: 69 04     ADC #$04
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F32E 07:F31E: A8        TAY
bra_F31F:  ; orig: bra_F31F:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F32F 07:F31F: 98        TYA
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F330 07:F320: A0 00     LDY #$00
    BSR     sub_bat_77E7             ; JSR -> BSR  ; orig: C - - - - - 0x01F332 07:F322: 20 E7 77  JSR sub_bat_77E7
    MOVE.B  ram_item_magic_shield,D0  ; orig: C - - - - - 0x01F335 07:F325: AD 76 06  LDA ram_item_magic_s
    BNE     bra_F340             ; BNE  ; orig: C - - - - - 0x01F338 07:F328: D0 16     BNE bra_F340
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01F33A 07:F32A: A5 98     LDA ram_dir_link
    CMPI.B  #con_dir_Down,D0  ; orig: C - - - - - 0x01F33C 07:F32C: C9 04     CMP #con_dir_Down
    BNE     bra_F36A_RTS             ; BNE  ; orig: C - - - - - 0x01F33E 07:F32E: D0 3A     BNE bra_F36A_RTS
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x01F340 07:F330: A2 01     LDX #$01
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F342 07:F332: BD 48 02  LDA ram_spr_Y + $48,
    CMPI.B  #$0B,D0  ; orig: C - - - - - 0x01F345 07:F335: C9 0B     CMP #$0B
    BCS     bra_F36A_RTS             ; BCS  ; orig: C - - - - - 0x01F347 07:F337: B0 31     BCS bra_F36A_RTS
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F349 07:F339: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F34A 07:F33A: 18        CLC
    ADDX.B  #$50,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F34B 07:F33B: 69 50     ADC #$50
    JMP     loc_F35A  ; orig: C - - - - - 0x01F34D 07:F33D: 4C 5A F3  JMP loc_F35A
bra_F340:  ; orig: bra_F340:
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x01F350 07:F340: A2 01     LDX #$01
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01F352 07:F342: A5 98     LDA ram_dir_link
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F354 07:F344: 4A        LSR
    BCC     bra_F349             ; BCC  ; orig: C - - - - - 0x01F355 07:F345: 90 02     BCC bra_F349
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x01F357 07:F347: A2 05     LDX #$05
bra_F349:  ; orig: bra_F349:
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x01F359 07:F349: A0 04     LDY #$04
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F35B 07:F34B: BD 48 02  LDA ram_spr_Y + $48,
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F35E 07:F34E: 48        PHA
bra_F34F_loop:  ; orig: bra_F34F_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F35F 07:F34F: 88        DEY
    BMI     bra_F35D             ; BMI  ; orig: C - - - - - 0x01F360 07:F350: 30 0B     BMI bra_F35D
    CMP.B   tbl_F205(D2.L),D0  ; orig: C - - - - - 0x01F362 07:F352: D9 05 F2  CMP tbl_F205,Y
    BNE     bra_F34F_loop             ; BNE  ; orig: C - - - - - 0x01F365 07:F355: D0 F8     BNE bra_F34F_loop
    MOVE.B  tbl_F209(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F367 07:F357: B9 09 F2  LDA tbl_F209,Y
loc_F35A:  ; orig: loc_F35A:
    ; (empty translation for STA)  ; orig: C D 3 - - - 0x01F36A 07:F35A: 9D 48 02  STA ram_spr_Y + $48,
bra_F35D:  ; orig: bra_F35D:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F36D 07:F35D: 68        PLA
    CMPI.B  #$0A,D0  ; orig: C - - - - - 0x01F36E 07:F35E: C9 0A     CMP #$0A
    BNE     bra_F36A_RTS             ; BNE  ; orig: C - - - - - 0x01F370 07:F360: D0 08     BNE bra_F36A_RTS
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F372 07:F362: BD 49 02  LDA ram_spr_T + $48,
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F375 07:F365: 29 0F     AND #$0F
    ; (empty translation for STA)  ; orig: C - - - - - 0x01F377 07:F367: 9D 49 02  STA ram_spr_T + $48,
bra_F36A_RTS:  ; orig: bra_F36A_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F37A 07:F36A: 60        RTS



tbl_F36B_spr_flip:  ; orig: tbl_F36B_spr_flip:
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 3 - - - 0x01F37B 07:F36B: 40        .byte $40   ; 00
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 3 - - - 0x01F37C 07:F36C: C0        .byte $C0   ; 01
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F37D 07:F36D: 80        .byte $80   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F37E 07:F36E: 00        .byte $00   ; 03



sub_F36F:  ; orig: sub_F36F:

; X = 0E
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F37F 07:F36F: B5 AC     LDA ram_state_obj,X
    BEQ     bra_F36A_RTS             ; BEQ  ; orig: C - - - - - 0x01F381 07:F371: F0 F7     BEQ bra_F36A_RTS
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F383 07:F373: 4A        LSR
    BCC     bra_F379             ; BCC  ; orig: C - - - - - 0x01F384 07:F374: 90 03     BCC bra_F379
    JMP     loc_F41D  ; orig: C - - - - - 0x01F386 07:F376: 4C 1D F4  JMP loc_F41D
bra_F379:  ; orig: bra_F379:
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F389 07:F379: BD 94 03  LDA ram_0394_enemy,X
    BNE     bra_F37E             ; BNE  ; orig: C - - - - - 0x01F38C 07:F37C: D0 00     BNE bra_F37E    ; bz
bra_F37E:  ; orig: bra_F37E:
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F38E 07:F37E: B5 98     LDA ram_dir_enemy,X
    BSR     sub_bat_7027             ; JSR -> BSR  ; orig: C - - - - - 0x01F390 07:F380: 20 27 70  JSR sub_bat_7027
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01F393 07:F383: A5 0F     LDA ram_000F_t01_dir
    BEQ     bra_F3D4             ; BEQ  ; orig: C - - - - - 0x01F395 07:F385: F0 4D     BEQ bra_F3D4
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F397 07:F387: BD 94 03  LDA ram_0394_enemy,X
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01F39A 07:F38A: 29 07     AND #$07
    BNE     bra_F391             ; BNE  ; orig: C - - - - - 0x01F39C 07:F38C: D0 03     BNE bra_F391
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F39E 07:F38E: 9D 94 03  STA ram_0394_enemy,X
bra_F391:  ; orig: bra_F391:
loc_0x01F3A1:  ; orig: loc_0x01F3A1:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C D 3 - - - 0x01F3A1 07:F391: 20 93 FA  JSR sub_FA93
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F3A4 07:F394: B5 98     LDA ram_dir_enemy,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F3A6 07:F396: 48        PHA
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x01F3A7 07:F397: 29 03     AND #con_dir__LR
    BEQ     bra_F3A2             ; BEQ  ; orig: C - - - - - 0x01F3A9 07:F399: F0 07     BEQ bra_F3A2
    MOVE.B  ram_0001_t15_spr_Y,D0  ; orig: C - - - - - 0x01F3AB 07:F39B: A5 01     LDA ram_0001_t15_spr
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F3AD 07:F39D: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F3AE 07:F39E: 69 03     ADC #$03
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F3B0 07:F3A0: 85 01     STA ram_0001_t15_spr
bra_F3A2:  ; orig: bra_F3A2:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F3B2 07:F3A2: 68        PLA
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F3B3 07:F3A3: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01F3B6 07:F3A6: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01F3B8 07:F3A8: 29 03     AND #$03
    ; !! ORA tbl_F50D,Y - needs manual review  ; orig: C - - - - - 0x01F3BA 07:F3AA: 19 0D F5  ORA tbl_F50D,Y
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01F3BD 07:F3AD: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  tbl_F509(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F3C0 07:F3B0: B9 09 F5  LDA tbl_F509,Y
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F3C3 07:F3B3: 85 0C     STA ram_000C_t06_tab
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x01F3C5 07:F3B5: C0 02     CPY #$02
    BNE     bra_F3BB             ; BNE  ; orig: C - - - - - 0x01F3C7 07:F3B7: D0 02     BNE bra_F3BB
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x01F3C9 07:F3B9: E6 0F     INC ram_000F_t04_fla
bra_F3BB:  ; orig: bra_F3BB:
    MOVE.B  #$22,D2  ; orig: C - - - - - 0x01F3CB 07:F3BB: A0 22     LDY #$22
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F3CD 07:F3BD: E0 0D     CPX #$0D
    BCS     bra_F3CA             ; BCS  ; orig: C - - - - - 0x01F3CF 07:F3BF: B0 09     BCS bra_F3CA
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F3D1 07:F3C1: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_57,D0  ; orig: C - - - - - 0x01F3D4 07:F3C4: C9 57     CMP #con_obj_id_57
    BEQ     bra_F3D1             ; BEQ  ; orig: C - - - - - 0x01F3D6 07:F3C6: F0 09     BEQ bra_F3D1
    BNE     bra_F3CF             ; BNE  ; orig: C - - - - - 0x01F3D8 07:F3C8: D0 05     BNE bra_F3CF    ; jm
bra_F3CA:  ; orig: bra_F3CA:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F3DA 07:F3CA: B5 AC     LDA ram_state_obj,X
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F3DC 07:F3CC: 0A        ASL
    BCC     bra_F3D1             ; BCC  ; orig: C - - - - - 0x01F3DD 07:F3CD: 90 02     BCC bra_F3D1
bra_F3CF:  ; orig: bra_F3CF:
    MOVE.B  #$23,D2  ; orig: C - - - - - 0x01F3DF 07:F3CF: A0 23     LDY #$23
bra_F3D1:  ; orig: bra_F3D1:
    JMP     loc_bat_7915  ; orig: C - - - - - 0x01F3E1 07:F3D1: 4C 15 79  JMP loc_bat_7915
bra_F3D4:  ; orig: bra_F3D4:
sub_0x01F3E4:  ; orig: sub_0x01F3E4:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F3E4 07:F3D4: B5 AC     LDA ram_state_obj,X
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F3E6 07:F3D6: 0A        ASL
    BCC     bra_F416             ; BCC  ; orig: C - - - - - 0x01F3E7 07:F3D7: 90 3D     BCC bra_F416
    MOVE.B  ram_item_book,D0  ; orig: C - - - - - 0x01F3E9 07:F3D9: AD 61 06  LDA ram_item_book
    BEQ     bra_F413             ; BEQ  ; orig: C - - - - - 0x01F3EC 07:F3DC: F0 35     BEQ bra_F413
    MOVE.B  ram_state_link,D0  ; orig: - - - - - - 0x01F3EE 07:F3DE: A5 AC     LDA ram_state_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x01F3F0 07:F3E0: 48        PHA
    MOVE.B  ram_candle_usage_flag,D0  ; orig: - - - - - - 0x01F3F1 07:F3E1: AD 13 05  LDA ram_candle_usage
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x01F3F4 07:F3E4: 48        PHA
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x01F3F5 07:F3E5: A9 00     LDA #$00
    MOVE.B  D0,ram_candle_usage_flag  ; orig: - - - - - - 0x01F3F7 07:F3E7: 8D 13 05  STA ram_candle_usage
    BSR     sub_bat_714F_candle             ; JSR -> BSR  ; orig: - - - - - - 0x01F3FA 07:F3EA: 20 4F 71  JSR sub_bat_714F_can
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x01F3FD 07:F3ED: 68        PLA
    MOVE.B  D0,ram_candle_usage_flag  ; orig: - - - - - - 0x01F3FE 07:F3EE: 8D 13 05  STA ram_candle_usage
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x01F401 07:F3F1: 68        PLA
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x01F402 07:F3F2: 85 AC     STA ram_state_link
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - - - - - - 0x01F404 07:F3F4: B5 AC     LDA ram_state_obj,X
    CMPI.B  #$21,D0  ; orig: - - - - - - 0x01F406 07:F3F6: C9 21     CMP #$21
    BNE     bra_F411             ; BNE  ; orig: - - - - - - 0x01F408 07:F3F8: D0 17     BNE bra_F411
    ; (empty translation for INC)  ; orig: - - - - - - 0x01F40A 07:F3FA: F6 AC     INC ram_state_obj,X
    MOVE.B  #$0E,D2  ; orig: - - - - - - 0x01F40C 07:F3FC: A0 0E     LDY #$0E
    MOVE.B  ram_pos_X_obj(D2.L),D0  ; LDA abs,Y  ; orig: - - - - - - 0x01F40E 07:F3FE: B9 70 00  LDA ram_pos_X_obj,Y
    MOVE.B  D0,ram_pos_X_obj(D1.L)  ; STA abs,X  ; orig: - - - - - - 0x01F411 07:F401: 95 70     STA ram_pos_X_obj,X
    MOVE.B  ram_pos_Y_obj(D2.L),D0  ; LDA abs,Y  ; orig: - - - - - - 0x01F413 07:F403: B9 84 00  LDA ram_pos_Y_obj,Y
    MOVE.B  D0,ram_pos_Y_obj(D1.L)  ; STA abs,X  ; orig: - - - - - - 0x01F416 07:F406: 95 84     STA ram_pos_Y_obj,X
    MOVE.B  ram_dir_obj(D2.L),D0  ; LDA abs,Y  ; orig: - - - - - - 0x01F418 07:F408: B9 98 00  LDA ram_dir_obj,Y
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: - - - - - - 0x01F41B 07:F40B: 95 98     STA ram_dir_enemy,X
    MOVE.B  #$4F,D0  ; orig: - - - - - - 0x01F41D 07:F40D: A9 4F     LDA #$4F
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: - - - - - - 0x01F41F 07:F40F: 95 28     STA ram_timer_enemy,
loc_F411:  ; orig: loc_F411:
bra_F411:  ; orig: bra_F411:
    MOVE.B  #$0E,D1  ; orig: C D 3 - - - 0x01F421 07:F411: A2 0E     LDX #$0E
bra_F413:  ; orig: bra_F413:
    JMP     loc_F855_clear_enemy_state  ; orig: C - - - - - 0x01F423 07:F413: 4C 55 F8  JMP loc_F855_clear_e
bra_F416:  ; orig: bra_F416:

; flying sword projectile hit the wall
    ; (empty translation for INC)  ; orig: C - - - - - 0x01F426 07:F416: F6 AC     INC ram_state_obj,X
    MOVE.B  #$FE,D0  ; orig: C - - - - - 0x01F428 07:F418: A9 FE     LDA #$FE
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F42A 07:F41A: 95 98     STA ram_dir_enemy,X 
    RTS                     ; RTS  ; orig: C - - - - - 0x01F42C 07:F41C: 60        RTS



loc_F41D:  ; orig: loc_F41D:
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01F42D 07:F41D: B5 98     LDA ram_dir_enemy,X
    MOVE.B  D0,ram_0002_t44  ; orig: C - - - - - 0x01F42F 07:F41F: 85 02     STA ram_0002_t44
    ; (empty translation for STA)  ; orig: C - - - - - 0x01F431 07:F421: 85 03     STA ram_0002_t44 + $
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F433 07:F423: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01F435 07:F425: 85 0F     STA ram_000F_t04_fla
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01F437 07:F427: A0 03     LDY #$03
bra_F429_loop:  ; orig: bra_F429_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F439 07:F429: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F43A 07:F42A: 48        PHA
    MOVE.B  ram_0002_t44,D0  ; orig: C - - - - - 0x01F43B 07:F42B: A5 02     LDA ram_0002_t44
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F43D 07:F42D: 48        PHA
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F43E 07:F42E: A5 03     LDA ram_0002_t44 + $
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F440 07:F430: 48        PHA
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01F441 07:F431: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01F443 07:F433: 29 03     AND #$03
    ; !! ORA tbl_F36B_spr_flip,Y - needs manual review  ; orig: C - - - - - 0x01F445 07:F435: 19 6B F3  ORA tbl_F36B_spr_fli
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01F448 07:F438: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F44B 07:F43B: B5 70     LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F44D 07:F43D: 18        CLC
    ADDX.B  ram_0002_t44,D0  ; orig: C - - - - - 0x01F44E 07:F43E: 65 02     ADC ram_0002_t44
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01F450 07:F440: 85 00     STA ram_0000_t21_spr
    CMP.B   ram_pos_X_enemy(D1.L),D0  ; orig: C - - - - - 0x01F452 07:F442: D5 70     CMP ram_pos_X_enemy,
    BCC     bra_F450             ; BCC  ; orig: C - - - - - 0x01F454 07:F444: 90 0A     BCC bra_F450
    CMPI.B  #$FC,D0  ; orig: C - - - - - 0x01F456 07:F446: C9 FC     CMP #$FC
    BCS     bra_F475             ; BCS  ; orig: C - - - - - 0x01F458 07:F448: B0 2B     BCS bra_F475
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F45A 07:F44A: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01F45B 07:F44B: F5 70     SBC ram_pos_X_enemy,
    JMP     loc_F455  ; orig: C - - - - - 0x01F45D 07:F44D: 4C 55 F4  JMP loc_F455
bra_F450:  ; orig: bra_F450:
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F460 07:F450: B5 70     LDA ram_pos_X_enemy,
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F462 07:F452: 38        SEC
    SUBX.B  ram_0000_t21_spr_X,D0  ; orig: C - - - - - 0x01F463 07:F453: E5 00     SBC ram_0000_t21_spr
loc_F455:  ; orig: loc_F455:
    CMPI.B  #$20,D0  ; orig: C D 3 - - - 0x01F465 07:F455: C9 20     CMP #$20
    BCS     bra_F475             ; BCS  ; orig: C - - - - - 0x01F467 07:F457: B0 1C     BCS bra_F475
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F469 07:F459: B5 84     LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F46B 07:F45B: 18        CLC
    ; !! ADC ram_0002_t44 + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x01F46C 07:F45C: 65 03     ADC ram_0002_t44 + $
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F46E 07:F45E: 85 01     STA ram_0001_t15_spr
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x01F470 07:F460: A4 10     LDY ram_dungeon_leve
    BEQ     bra_F46C             ; BEQ  ; orig: C - - - - - 0x01F472 07:F462: F0 08     BEQ bra_F46C    ; if

; if dungeon
    CMPI.B  #$3E,D0  ; orig: C - - - - - 0x01F474 07:F464: C9 3E     CMP #$3E
    BCC     bra_F475             ; BCC  ; orig: C - - - - - 0x01F476 07:F466: 90 0D     BCC bra_F475
    CMPI.B  #$E8,D0  ; orig: C - - - - - 0x01F478 07:F468: C9 E8     CMP #$E8
    BCS     bra_F475             ; BCS  ; orig: C - - - - - 0x01F47A 07:F46A: B0 09     BCS bra_F475

; 3E-E7
bra_F46C:  ; orig: bra_F46C:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01F47C 07:F46C: A9 02     LDA #$02
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F47E 07:F46E: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$23,D2  ; orig: C - - - - - 0x01F480 07:F470: A0 23     LDY #$23
    BSR     sub_bat_7915             ; JSR -> BSR  ; orig: C - - - - - 0x01F482 07:F472: 20 15 79  JSR sub_bat_7915
bra_F475:  ; orig: bra_F475:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F485 07:F475: 68        PLA
    ; (empty translation for STA)  ; orig: C - - - - - 0x01F486 07:F476: 85 03     STA ram_0002_t44 + $
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F488 07:F478: 68        PLA
    MOVE.B  D0,ram_0002_t44  ; orig: C - - - - - 0x01F489 07:F479: 85 02     STA ram_0002_t44
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F48B 07:F47B: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F48C 07:F47C: 48        PHA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F48D 07:F47D: A8        TAY
    CMPI.B  #$01,D2  ; orig: C - - - - - 0x01F48E 07:F47E: C0 01     CPY #$01
    BNE     bra_F484             ; BNE  ; orig: C - - - - - 0x01F490 07:F480: D0 02     BNE bra_F484
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01F492 07:F482: A0 03     LDY #$03
bra_F484:  ; orig: bra_F484:

; ram_0000_t21_spr_X

; ram_0002_t44
    MOVE.B  ram_0000_temp(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F494 07:F484: B9 00 00  LDA ram_0000_temp,Y
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x01F497 07:F487: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F499 07:F489: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F49A 07:F48A: 69 01     ADC #$01
    MOVE.B  D0,ram_0000_temp(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01F49C 07:F48C: 99 00 00  STA ram_0000_temp,Y
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F49F 07:F48F: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F4A0 07:F490: A8        TAY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F4A1 07:F491: 88        DEY
    BPL     bra_F429_loop             ; BPL  ; orig: C - - - - - 0x01F4A2 07:F492: 10 95     BPL bra_F429_loop
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01F4A4 07:F494: D6 98     DEC ram_dir_enemy,X 
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F4A6 07:F496: B5 98     LDA ram_dir_enemy,X
    CMPI.B  #$E8,D0  ; orig: C - - - - - 0x01F4A8 07:F498: C9 E8     CMP #$E8
    BNE     bra_F49F_RTS             ; BNE  ; orig: C - - - - - 0x01F4AA 07:F49A: D0 03     BNE bra_F49F_RTS
    JMP     loc_F411  ; orig: C - - - - - 0x01F4AC 07:F49C: 4C 11 F4  JMP loc_F411
bra_F49F_RTS:  ; orig: bra_F49F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F4AF 07:F49F: 60        RTS



sub_F4A0:  ; orig: sub_F4A0:

; in

; X = 0F

; bzk optimize, X always 0F
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F4B0 07:F4A0: B5 AC     LDA ram_state_obj,X
    BEQ     bra_F49F_RTS             ; BEQ  ; orig: C - - - - - 0x01F4B2 07:F4A2: F0 FB     BEQ bra_F49F_RTS
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F4B4 07:F4A4: 0A        ASL
    BCC     bra_F519             ; BCC  ; orig: C - - - - - 0x01F4B5 07:F4A5: 90 72     BCC bra_F519
    MOVE.B  ram_timer_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F4B7 07:F4A7: B5 28     LDA ram_timer_enemy,
    BNE     bra_F4B9             ; BNE  ; orig: C - - - - - 0x01F4B9 07:F4A9: D0 0E     BNE bra_F4B9
    ; (empty translation for INC)  ; orig: - - - - - - 0x01F4BB 07:F4AB: F6 AC     INC ram_state_obj,X
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: - - - - - - 0x01F4BD 07:F4AD: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: - - - - - - 0x01F4BF 07:F4AF: 29 0F     AND #$0F
    CMPI.B  #$03,D0  ; orig: - - - - - - 0x01F4C1 07:F4B1: C9 03     CMP #$03
    BEQ     bra_F4E2             ; BEQ  ; orig: - - - - - - 0x01F4C3 07:F4B3: F0 2D     BEQ bra_F4E2
    MOVE.B  #$FF,D0  ; orig: - - - - - - 0x01F4C5 07:F4B5: A9 FF     LDA #$FF
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: - - - - - - 0x01F4C7 07:F4B7: 95 28     STA ram_timer_enemy,
bra_F4B9:  ; orig: bra_F4B9:
    MOVE.B  ram_copy_obj_id,D0  ; orig: C - - - - - 0x01F4C9 07:F4B9: AD 5F 03  LDA ram_copy_obj_id
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01F4CC 07:F4BC: C9 03     CMP #$03
    BCC     bra_F4D8             ; BCC  ; orig: C - - - - - 0x01F4CE 07:F4BE: 90 18     BCC bra_F4D8    ; if
    CMPI.B  #$0B,D0  ; orig: C - - - - - 0x01F4D0 07:F4C0: C9 0B     CMP #$0B
    BCC     bra_F4D0             ; BCC  ; orig: C - - - - - 0x01F4D2 07:F4C2: 90 0C     BCC bra_F4D0
    CMPI.B  #con_obj_id_12,D0  ; orig: C - - - - - 0x01F4D4 07:F4C4: C9 12     CMP #con_obj_id_12
    BEQ     bra_F4D0             ; BEQ  ; orig: C - - - - - 0x01F4D6 07:F4C6: F0 08     BEQ bra_F4D0
    CMPI.B  #con_obj_id_1B,D0  ; orig: C - - - - - 0x01F4D8 07:F4C8: C9 1B     CMP #con_obj_id_1B
    BEQ     bra_F4D0             ; BEQ  ; orig: C - - - - - 0x01F4DA 07:F4CA: F0 04     BEQ bra_F4D0
    CMPI.B  #con_obj_id_1C,D0  ; orig: C - - - - - 0x01F4DC 07:F4CC: C9 1C     CMP #con_obj_id_1C
    BNE     bra_F4D8             ; BNE  ; orig: C - - - - - 0x01F4DE 07:F4CE: D0 08     BNE bra_F4D8
bra_F4D0:  ; orig: bra_F4D0:
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F4E0 07:F4D0: B5 70     LDA ram_pos_X_enemy,
    MOVE.B  D0,ram_0061  ; orig: C - - - - - 0x01F4E2 07:F4D2: 85 61     STA ram_0061
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F4E4 07:F4D4: B5 84     LDA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0062  ; orig: C - - - - - 0x01F4E6 07:F4D6: 85 62     STA ram_0062
bra_F4D8:  ; orig: bra_F4D8:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01F4E8 07:F4D8: 20 93 FA  JSR sub_FA93
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01F4EB 07:F4DB: A9 02     LDA #$02
    MOVE.B  #$06,D2  ; orig: C - - - - - 0x01F4ED 07:F4DD: A0 06     LDY #$06
    JMP     loc_bat_790C  ; orig: C - - - - - 0x01F4EF 07:F4DF: 4C 0C 79  JMP loc_bat_790C
bra_F4E2:  ; orig: bra_F4E2:
    JMP     loc_F855_clear_enemy_state  ; orig: - - - - - - 0x01F4F2 07:F4E2: 4C 55 F8  JMP loc_F855_clear_e



tbl_F4E5:  ; orig: tbl_F4E5:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F4F5 07:F4E5: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F4F6 07:F4E6: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 3 - - - 0x01F4F7 07:F4E7: 02        .byte $02   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F4F8 07:F4E8: 01        .byte $01   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F4F9 07:F4E9: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FA 07:F4EA: 01        .byte $01   ; 05
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FB 07:F4EB: 02        .byte $02   ; 06
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FC 07:F4EC: 01        .byte $01   ; 07
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FD 07:F4ED: 03        .byte $03   ; 08



tbl_F4EE:  ; orig: tbl_F4EE:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FE 07:F4EE: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F4FF 07:F4EF: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F500 07:F4F0: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 3 - - - 0x01F501 07:F4F1: 40        .byte $40   ; 03
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 3 - - - 0x01F502 07:F4F2: 40        .byte $40   ; 04
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 3 - - - 0x01F503 07:F4F3: C0        .byte $C0   ; 05
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F504 07:F4F4: 80        .byte $80   ; 06
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F505 07:F4F5: 80        .byte $80   ; 07
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F506 07:F4F6: 01        .byte $01   ; 08



tbl_F4F7:  ; orig: tbl_F4F7:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F507 07:F4F7: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 3 - - - 0x01F508 07:F4F8: 20        .byte $20   ; 01
    ; [DIRECTIVE] .BYTE $36  -- needs manual handling  ; orig: - D 3 - - - 0x01F509 07:F4F9: 36        .byte $36   ; 02
    ; [DIRECTIVE] .BYTE $4C  -- needs manual handling  ; orig: - D 3 - - - 0x01F50A 07:F4FA: 4C        .byte $4C   ; 03
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 3 - - - 0x01F50B 07:F4FB: 60        .byte $60   ; 04
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - - - - - - 0x01F50C 07:F4FC: 68        .byte $68   ; 05
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - - - - - - 0x01F50D 07:F4FD: 70        .byte $70   ; 06
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - - - - - - 0x01F50E 07:F4FE: 78        .byte $78   ; 07
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F50F 07:F4FF: 80        .byte $80   ; 08



tbl_F500:  ; orig: tbl_F500:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F510 07:F500: 80        .byte $80   ; 00
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 3 - - - 0x01F511 07:F501: 78        .byte $78   ; 01
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 3 - - - 0x01F512 07:F502: 70        .byte $70   ; 02
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 3 - - - 0x01F513 07:F503: 68        .byte $68   ; 03
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 3 - - - 0x01F514 07:F504: 60        .byte $60   ; 04
    ; [DIRECTIVE] .BYTE $4C  -- needs manual handling  ; orig: - - - - - - 0x01F515 07:F505: 4C        .byte $4C   ; 05
    ; [DIRECTIVE] .BYTE $36  -- needs manual handling  ; orig: - - - - - - 0x01F516 07:F506: 36        .byte $36   ; 06
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - - - - - - 0x01F517 07:F507: 20        .byte $20   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F518 07:F508: 00        .byte $00   ; 08



tbl_F509:  ; orig: tbl_F509:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F519 07:F509: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F51A 07:F50A: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F51B 07:F50B: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F51C 07:F50C: 01        .byte $01   ; 03



tbl_F50D:  ; orig: tbl_F50D:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F51D 07:F50D: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 3 - - - 0x01F51E 07:F50E: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F51F 07:F50F: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F520 07:F510: 00        .byte $00   ; 03



tbl_F511_pos_X:  ; orig: tbl_F511_pos_X:
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 3 - - - 0x01F521 07:F511: FC        .byte $FC   ; 00
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 3 - - - 0x01F522 07:F512: FC        .byte $FC   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F523 07:F513: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F524 07:F514: 00        .byte $00   ; 03



tbl_F515_pos_Y:  ; orig: tbl_F515_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F525 07:F515: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F526 07:F516: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F527 07:F517: 03        .byte $03   ; 02
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F528 07:F518: 03        .byte $03   ; 03



bra_F519:
; bzk
loc_F519:  ; orig: loc_F519:
ofs_004_F519_5C:  ; orig: ofs_004_F519_5C:

; con_obj_id_5C

; X = 01+
sub_0x01F529:  ; orig: sub_0x01F529:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01F529 07:F519: B5 AC     LDA ram_state_obj,X
    BEQ     bra_F49F_RTS             ; BEQ  ; orig: C - - - - - 0x01F52B 07:F51B: F0 82     BEQ bra_F49F_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F52D 07:F51D: A9 00     LDA #$00
    MOVE.B  D0,ram_0000_t6A  ; orig: C - - - - - 0x01F52F 07:F51F: 85 00     STA ram_0000_t6A
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F531 07:F521: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01F533 07:F523: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01F535 07:F525: C9 10     CMP #$10
    BEQ     bra_F52C             ; BEQ  ; orig: C - - - - - 0x01F537 07:F527: F0 03     BEQ bra_F52C
    JMP     loc_F5B6  ; orig: C - - - - - 0x01F539 07:F529: 4C B6 F5  JMP loc_F5B6
bra_F52C:  ; orig: bra_F52C:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F53C 07:F52C: A9 00     LDA #$00
    MOVE.B  D0,ram_000E_t02  ; orig: C - - - - - 0x01F53E 07:F52E: 85 0E     STA ram_000E_t02
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F540 07:F530: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x01F542 07:F532: 29 03     AND #con_dir__LR
    BEQ     bra_F53B             ; BEQ  ; orig: C - - - - - 0x01F544 07:F534: F0 05     BEQ bra_F53B
    BSR     sub_bat_7027             ; JSR -> BSR  ; orig: C - - - - - 0x01F546 07:F536: 20 27 70  JSR sub_bat_7027
    ADDQ.B  #1,ram_000E_t02  ; orig: C - - - - - 0x01F549 07:F539: E6 0E     INC ram_000E_t02    
bra_F53B:  ; orig: bra_F53B:

; bzk optimize, BIT + BMI
    MOVE.B  ram_000E_t02,D0  ; orig: C - - - - - 0x01F54B 07:F53B: A5 0E     LDA ram_000E_t02
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F54D 07:F53D: 0A        ASL
    BCS     bra_F575             ; BCS  ; orig: C - - - - - 0x01F54E 07:F53E: B0 35     BCS bra_F575
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F550 07:F540: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01F552 07:F542: 29 0C     AND #con_dir__UD
    BEQ     bra_F549             ; BEQ  ; orig: C - - - - - 0x01F554 07:F544: F0 03     BEQ bra_F549
    BSR     sub_bat_7027             ; JSR -> BSR  ; orig: C - - - - - 0x01F556 07:F546: 20 27 70  JSR sub_bat_7027
bra_F549:  ; orig: bra_F549:

; bzk optimize, BIT + BMI
    MOVE.B  ram_000E_t02,D0  ; orig: C - - - - - 0x01F559 07:F549: A5 0E     LDA ram_000E_t02
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F55B 07:F54B: 0A        ASL
    BCS     bra_F575             ; BCS  ; orig: C - - - - - 0x01F55C 07:F54C: B0 27     BCS bra_F575
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F55E 07:F54E: E0 0D     CPX #$0D
    BCS     bra_F559             ; BCS  ; orig: C - - - - - 0x01F560 07:F550: B0 07     BCS bra_F559
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F562 07:F552: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5B,D0  ; orig: C - - - - - 0x01F565 07:F555: C9 5B     CMP #con_obj_id_5B
    BEQ     bra_F57B             ; BEQ  ; orig: C - - - - - 0x01F567 07:F557: F0 22     BEQ bra_F57B
bra_F559:  ; orig: bra_F559:
    CMPI.B  #$12,D1  ; orig: C - - - - - 0x01F569 07:F559: E0 12     CPX #$12
    BEQ     bra_F57B             ; BEQ  ; orig: C - - - - - 0x01F56B 07:F55B: F0 1E     BEQ bra_F57B
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F56D 07:F55D: BD 94 03  LDA ram_0394_enemy,X
    BPL     bra_F567             ; BPL  ; orig: C - - - - - 0x01F570 07:F560: 10 05     BPL bra_F567
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x01F572 07:F562: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F574 07:F564: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F575 07:F565: 69 01     ADC #$01
bra_F567:  ; orig: bra_F567:
    CMP.B   ram_0380_enemy(D1.L),D0  ; orig: C - - - - - 0x01F577 07:F567: DD 80 03  CMP ram_0380_enemy,X
    BCC     bra_F578             ; BCC  ; orig: C - - - - - 0x01F57A 07:F56A: 90 0C     BCC bra_F578
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01F57C 07:F56C: A9 10     LDA #$10
    MOVE.B  D0,ram_0380_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F57E 07:F56E: 9D 80 03  STA ram_0380_enemy,X
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01F581 07:F571: A9 20     LDA #$20
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F583 07:F573: 95 AC     STA ram_state_obj,X
bra_F575:  ; orig: bra_F575:
    JMP     loc_F5E1  ; orig: C - - - - - 0x01F585 07:F575: 4C E1 F5  JMP loc_F5E1
bra_F578:  ; orig: bra_F578:
    JMP     loc_F6B8  ; orig: C - - - - - 0x01F588 07:F578: 4C B8 F6  JMP loc_F6B8
bra_F57B:  ; orig: bra_F57B:
loc_0x01F58B:  ; orig: loc_0x01F58B:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01F58B 07:F57B: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01F58D 07:F57D: 85 0F     STA ram_000F_t04_fla
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F58F 07:F57F: B5 98     LDA ram_dir_enemy,X
    CMPI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x01F591 07:F581: C9 02     CMP #con_dir_Left
    BNE     bra_F587             ; BNE  ; orig: C - - - - - 0x01F593 07:F583: D0 02     BNE bra_F587
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x01F595 07:F585: E6 0F     INC ram_000F_t04_fla
bra_F587:  ; orig: bra_F587:
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F597 07:F587: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  tbl_F509(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F59A 07:F58A: B9 09 F5  LDA tbl_F509,Y
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F59D 07:F58D: 85 0C     STA ram_000C_t06_tab
    MOVE.B  tbl_F50D(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F59F 07:F58F: B9 0D F5  LDA tbl_F50D,Y
loc_F592:  ; orig: loc_F592:
    MOVE.B  D0,ram_0004_t23  ; orig: C D 3 - - - 0x01F5A2 07:F592: 85 04     STA ram_0004_t23
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F5A4 07:F594: E0 0D     CPX #$0D
    BCS     bra_F5A6             ; BCS  ; orig: C - - - - - 0x01F5A6 07:F596: B0 0E     BCS bra_F5A6
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F5A8 07:F598: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5B,D0  ; orig: C - - - - - 0x01F5AB 07:F59B: C9 5B     CMP #con_obj_id_5B
    BNE     bra_F5A6             ; BNE  ; orig: C - - - - - 0x01F5AD 07:F59D: D0 07     BNE bra_F5A6
    MOVE.B  ram_0004_t23,D0  ; orig: C - - - - - 0x01F5AF 07:F59F: A5 04     LDA ram_0004_t23
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F5B1 07:F5A1: 18        CLC
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F5B2 07:F5A2: 69 02     ADC #$02
    BNE     bra_F5AD             ; BNE  ; orig: C - - - - - 0x01F5B4 07:F5A4: D0 07     BNE bra_F5AD
bra_F5A6:  ; orig: bra_F5A6:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F5B6 07:F5A6: 18        CLC
    ADDX.B  ram_item_arrow,D0  ; orig: C - - - - - 0x01F5B7 07:F5A7: 6D 59 06  ADC ram_item_arrow
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F5BA 07:F5AA: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x01F5BB 07:F5AB: E9 01     SBC #$01
bra_F5AD:  ; orig: bra_F5AD:
    MOVE.B  D0,ram_0004_t13_spr_A  ; orig: C - - - - - 0x01F5BD 07:F5AD: 85 04     STA ram_0004_t13_spr

; bzk optimize, useless LDA
    MOVE.B  ram_0004_t13_spr_A,D0  ; orig: C - - - - - 0x01F5BF 07:F5AF: A5 04     LDA ram_0004_t13_spr
    ; (empty translation for STA)  ; orig: C - - - - - 0x01F5C1 07:F5B1: 85 05     STA ram_0004_t13_spr
    JMP     loc_F714  ; orig: C - - - - - 0x01F5C3 07:F5B3: 4C 14 F7  JMP loc_F714



loc_F5B6:  ; orig: loc_F5B6:
    CMPI.B  #$20,D0  ; orig: C D 3 - - - 0x01F5C6 07:F5B6: C9 20     CMP #$20
    BNE     bra_F611             ; BNE  ; orig: C - - - - - 0x01F5C8 07:F5B8: D0 57     BNE bra_F611
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x01F5CA 07:F5BA: A9 28     LDA #$28
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F5CC 07:F5BC: 95 AC     STA ram_state_obj,X
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01F5CE 07:F5BE: DE D0 03  DEC ram_anim_timer_o
    BNE     bra_F5ED             ; BNE  ; orig: C - - - - - 0x01F5D1 07:F5C1: D0 2A     BNE bra_F5ED
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01F5D3 07:F5C3: A9 40     LDA #$40
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F5D5 07:F5C5: 95 AC     STA ram_state_obj,X
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F5D7 07:F5C7: E0 0D     CPX #$0D
    BCS     bra_F5D2             ; BCS  ; orig: C - - - - - 0x01F5D9 07:F5C9: B0 07     BCS bra_F5D2
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F5DB 07:F5CB: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5B,D0  ; orig: C - - - - - 0x01F5DE 07:F5CE: C9 5B     CMP #con_obj_id_5B
    BEQ     bra_F5D6             ; BEQ  ; orig: C - - - - - 0x01F5E0 07:F5D0: F0 04     BEQ bra_F5D6
bra_F5D2:  ; orig: bra_F5D2:
    CMPI.B  #$12,D1  ; orig: C - - - - - 0x01F5E2 07:F5D2: E0 12     CPX #$12
    BNE     bra_F5E1             ; BNE  ; orig: C - - - - - 0x01F5E4 07:F5D4: D0 0B     BNE bra_F5E1
bra_F5D6:  ; orig: bra_F5D6:
    BSR     sub_F855_clear_enemy_state             ; JSR -> BSR  ; orig: C - - - - - 0x01F5E6 07:F5D6: 20 55 F8  JSR sub_F855_clear_e
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F5E9 07:F5D9: E0 0D     CPX #$0D
    BCS     bra_F5E0_RTS             ; BCS  ; orig: C - - - - - 0x01F5EB 07:F5DB: B0 03     BCS bra_F5E0_RTS

; bzk optimize, JMP
    BSR     sub_0x010356             ; JSR -> BSR  ; orig: C - - - - - 0x01F5ED 07:F5DD: 20 46 83  JSR sub_0x010356
bra_F5E0_RTS:  ; orig: bra_F5E0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F5F0 07:F5E0: 60        RTS
bra_F5E1:  ; orig: bra_F5E1:
loc_F5E1:  ; orig: loc_F5E1:
    MOVE.B  #$03,D0  ; orig: C D 3 - - - 0x01F5F1 07:F5E1: A9 03     LDA #$03
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F5F3 07:F5E3: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F5F6 07:F5E6: B5 AC     LDA ram_state_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F5F8 07:F5E8: 18        CLC
    ADDX.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F5F9 07:F5E9: 69 10     ADC #$10
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F5FB 07:F5EB: 95 AC     STA ram_state_obj,X
bra_F5ED:  ; orig: bra_F5ED:
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F5FD 07:F5ED: E0 0D     CPX #$0D
    BCS     bra_F5F8             ; BCS  ; orig: C - - - - - 0x01F5FF 07:F5EF: B0 07     BCS bra_F5F8
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F601 07:F5F1: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_5B,D0  ; orig: C - - - - - 0x01F604 07:F5F4: C9 5B     CMP #con_obj_id_5B
    BEQ     bra_F5FF             ; BEQ  ; orig: C - - - - - 0x01F606 07:F5F6: F0 07     BEQ bra_F5FF
bra_F5F8:  ; orig: bra_F5F8:
    CMPI.B  #$12,D1  ; orig: C - - - - - 0x01F608 07:F5F8: E0 12     CPX #$12
    BEQ     bra_F5FF             ; BEQ  ; orig: C - - - - - 0x01F60A 07:F5FA: F0 03     BEQ bra_F5FF
    JMP     loc_F6D3  ; orig: C - - - - - 0x01F60C 07:F5FC: 4C D3 F6  JMP loc_F6D3
bra_F5FF:  ; orig: bra_F5FF:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01F60F 07:F5FF: A9 02     LDA #$02
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F611 07:F601: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F613 07:F603: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01F615 07:F605: 85 0F     STA ram_000F_t04_fla
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F617 07:F607: B5 98     LDA ram_dir_enemy,X
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F619 07:F609: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01F61C 07:F60C: A9 00     LDA #$00    ; !!! D 
    JMP     loc_F592  ; orig: C - - - - - 0x01F61E 07:F60E: 4C 92 F5  JMP loc_F592
bra_F611:  ; orig: bra_F611:
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01F621 07:F611: C9 30     CMP #$30
    BNE     bra_F641             ; BNE  ; orig: C - - - - - 0x01F623 07:F613: D0 2C     BNE bra_F641
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F625 07:F615: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F627 07:F617: 9D 94 03  STA ram_0394_enemy,X
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01F62A 07:F61A: A9 40     LDA #$40
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F62C 07:F61C: 9D BC 03  STA ram_03BC_obj,X
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F62F 07:F61F: B5 98     LDA ram_dir_enemy,X
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F631 07:F621: 85 0F     STA ram_000F_t01_dir
    ANDI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x01F633 07:F623: 29 02     AND #con_dir_Left
    BEQ     bra_F62D             ; BEQ  ; orig: C - - - - - 0x01F635 07:F625: F0 06     BEQ bra_F62D
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F637 07:F627: B5 70     LDA ram_pos_X_enemy,
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01F639 07:F629: C9 02     CMP #$02
    BCC     bra_F635             ; BCC  ; orig: C - - - - - 0x01F63B 07:F62B: 90 08     BCC bra_F635
bra_F62D:  ; orig: bra_F62D:
    BSR     sub_F08D             ; JSR -> BSR  ; orig: C - - - - - 0x01F63D 07:F62D: 20 8D F0  JSR sub_F08D
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01F640 07:F630: DE 80 03  DEC ram_0380_enemy,X
    BNE     bra_F63E             ; BNE  ; orig: C - - - - - 0x01F643 07:F633: D0 09     BNE bra_F63E
bra_F635:  ; orig: bra_F635:
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01F645 07:F635: A9 20     LDA #$20
    MOVE.B  D0,ram_0380_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F647 07:F637: 9D 80 03  STA ram_0380_enemy,X
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01F64A 07:F63A: A9 40     LDA #$40
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F64C 07:F63C: 95 AC     STA ram_state_obj,X
bra_F63E:  ; orig: bra_F63E:
    JMP     loc_F6B8  ; orig: C - - - - - 0x01F64E 07:F63E: 4C B8 F6  JMP loc_F6B8
bra_F641:  ; orig: bra_F641:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F651 07:F641: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F653 07:F643: 9D 94 03  STA ram_0394_enemy,X
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F656 07:F646: E0 0D     CPX #$0D
    BCS     bra_F64D             ; BCS  ; orig: C - - - - - 0x01F658 07:F648: B0 03     BCS bra_F64D
    MOVE.B  ram_042B_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F65A 07:F64A: BD 2C 04  LDA ram_042B_enemy,X
bra_F64D:  ; orig: bra_F64D:
    BSR     sub_bat_704A             ; JSR -> BSR  ; orig: C - - - - - 0x01F65D 07:F64D: 20 4A 70  JSR sub_bat_704A
    MOVE.B  ram_0000_t6A,D0  ; orig: C - - - - - 0x01F660 07:F650: A5 00     LDA ram_0000_t6A
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01F662 07:F652: C9 02     CMP #$02
    BNE     bra_F691             ; BNE  ; orig: C - - - - - 0x01F664 07:F654: D0 3B     BNE bra_F691
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F666 07:F656: A9 00     LDA #$00
    MOVE.B  D0,ram_0380_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F668 07:F658: 9D 80 03  STA ram_0380_enemy,X
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F66B 07:F65B: E0 0D     CPX #$0D
    BCC     bra_F672             ; BCC  ; orig: C - - - - - 0x01F66D 07:F65D: 90 13     BCC bra_F672
    MOVE.B  ram_state_link,D0  ; orig: - - - - - - 0x01F66F 07:F65F: A5 AC     LDA ram_state_link
    ORI.B   #con_obj_state_20,D0  ; orig: - - - - - - 0x01F671 07:F661: 09 20     ORA #con_obj_state_2
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x01F673 07:F663: 85 AC     STA ram_state_link
    MOVE.B  #$01,D0  ; orig: - - - - - - 0x01F675 07:F665: A9 01     LDA #$01
    MOVE.B  D0,ram_anim_timer_link  ; orig: - - - - - - 0x01F677 07:F667: 8D D0 03  STA ram_anim_timer_l
    MOVE.B  #$0F,D2  ; orig: - - - - - - 0x01F67A 07:F66A: A0 0F     LDY #$0F
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x01F67C 07:F66C: A9 00     LDA #$00
    MOVE.B  D0,ram_state_obj(D2.L)  ; STA abs,Y  ; orig: - - - - - - 0x01F67E 07:F66E: 99 AC 00  STA ram_state_obj,Y
    RTS                     ; RTS  ; orig: - - - - - - 0x01F681 07:F671: 60        RTS
bra_F672:  ; orig: bra_F672:
    MOVE.B  #$30,D2  ; orig: C - - - - - 0x01F682 07:F672: A0 30     LDY #$30
    MOVE.B  ram_indiv_random(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F684 07:F674: B5 18     LDA ram_indiv_random
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01F686 07:F676: C9 30     CMP #$30
    BCC     bra_F682             ; BCC  ; orig: C - - - - - 0x01F688 07:F678: 90 08     BCC bra_F682
    MOVE.B  #$50,D2  ; orig: C - - - - - 0x01F68A 07:F67A: A0 50     LDY #$50
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x01F68C 07:F67C: C9 70     CMP #$70
    BCC     bra_F682             ; BCC  ; orig: C - - - - - 0x01F68E 07:F67E: 90 02     BCC bra_F682    ; if
    MOVE.B  #$70,D2  ; orig: C - - - - - 0x01F690 07:F680: A0 70     LDY #$70
bra_F682:  ; orig: bra_F682:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F692 07:F682: 98        TYA
    MOVE.B  ram_042B_enemy(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01F693 07:F683: BC 2C 04  LDY ram_042B_enemy,X
    MOVE.B  D0,ram_timer_enemy(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01F696 07:F686: 99 28 00  STA ram_timer_enemy,
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F699 07:F689: A9 00     LDA #$00
    MOVE.B  D0,ram_state_obj(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01F69B 07:F68B: 99 AC 00  STA ram_state_obj,Y
    JMP     loc_0x010356  ; orig: C - - - - - 0x01F69E 07:F68E: 4C 46 83  JMP loc_0x010356
bra_F691:  ; orig: bra_F691:
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x01F6A1 07:F691: A0 04     LDY #$04
    BSR     sub_bat_706F             ; JSR -> BSR  ; orig: C - - - - - 0x01F6A3 07:F693: 20 6F 70  JSR sub_bat_706F
    MOVE.B  tbl_F4F7(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F6A6 07:F696: B9 F7 F4  LDA tbl_F4F7,Y
    BSR     sub_bat_70AB             ; JSR -> BSR  ; orig: C - - - - - 0x01F6A9 07:F699: 20 AB 70  JSR sub_bat_70AB
    MOVE.B  ram_000A_t06,D0  ; orig: C - - - - - 0x01F6AC 07:F69C: A5 0A     LDA ram_000A_t06
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F6AE 07:F69E: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6B0 07:F6A0: 95 98     STA ram_dir_enemy,X
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F6B2 07:F6A2: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F6B3 07:F6A3: 48        PHA
    BSR     sub_F08D             ; JSR -> BSR  ; orig: C - - - - - 0x01F6B4 07:F6A4: 20 8D F0  JSR sub_F08D
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F6B7 07:F6A7: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F6B8 07:F6A8: A8        TAY
    MOVE.B  tbl_F500(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F6B9 07:F6A9: B9 00 F5  LDA tbl_F500,Y
    BSR     sub_bat_70AB             ; JSR -> BSR  ; orig: C - - - - - 0x01F6BC 07:F6AC: 20 AB 70  JSR sub_bat_70AB
    MOVE.B  ram_000B_t03,D0  ; orig: C - - - - - 0x01F6BF 07:F6AF: A5 0B     LDA ram_000B_t03
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F6C1 07:F6B1: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6C3 07:F6B3: 95 98     STA ram_dir_enemy,X
    BSR     sub_F08D             ; JSR -> BSR  ; orig: C - - - - - 0x01F6C5 07:F6B5: 20 8D F0  JSR sub_F08D
loc_F6B8:  ; orig: loc_F6B8:
    ; (empty translation for DEC)  ; orig: C D 3 - - - 0x01F6C8 07:F6B8: DE D0 03  DEC ram_anim_timer_o
    BNE     bra_F6D3             ; BNE  ; orig: C - - - - - 0x01F6CB 07:F6BB: D0 16     BNE bra_F6D3
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01F6CD 07:F6BD: A9 02     LDA #$02
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6CF 07:F6BF: 9D D0 03  STA ram_anim_timer_o
    ; (empty translation for INC)  ; orig: C - - - - - 0x01F6D2 07:F6C2: F6 AC     INC ram_state_obj,X
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F6D4 07:F6C4: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$77,D0  ; orig: C - - - - - 0x01F6D6 07:F6C6: 29 77     AND #$77
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6D8 07:F6C8: 95 AC     STA ram_state_obj,X
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F6DA 07:F6CA: E0 0D     CPX #$0D
    BCC     bra_F6E8             ; BCC  ; orig: C - - - - - 0x01F6DC 07:F6CC: 90 1A     BCC bra_F6E8
    MOVE.B  #con_sfx_3_arrow_shoot,D2  ; orig: C - - - - - 0x01F6DE 07:F6CE: A0 02     LDY #con_sfx_3_arrow
    BSR     sub_bat_6E10             ; JSR -> BSR  ; orig: C - - - - - 0x01F6E0 07:F6D0: 20 10 6E  JSR sub_bat_6E10
bra_F6D3:  ; orig: bra_F6D3:
loc_F6D3:  ; orig: loc_F6D3:
    CMPI.B  #$0D,D1  ; orig: C D 3 - - - 0x01F6E3 07:F6D3: E0 0D     CPX #$0D
    BCS     bra_F6E8             ; BCS  ; orig: C - - - - - 0x01F6E5 07:F6D5: B0 11     BCS bra_F6E8
    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - - - - 0x01F6E7 07:F6D7: 20 A7 7A  JSR sub_bat_7AA7
    MOVE.B  ram_034B_flag,D0  ; orig: C - - - - - 0x01F6EA 07:F6DA: AD 4B 03  LDA ram_034B_flag
    BEQ     bra_F6E8             ; BEQ  ; orig: C - - - - - 0x01F6ED 07:F6DD: F0 09     BEQ bra_F6E8
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x01F6EF 07:F6DF: A9 03     LDA #$03
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6F1 07:F6E1: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01F6F4 07:F6E4: A9 20     LDA #$20
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F6F6 07:F6E6: 95 AC     STA ram_state_obj,X
bra_F6E8:  ; orig: bra_F6E8:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F6F8 07:F6E8: A9 00     LDA #$00
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01F6FA 07:F6EA: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F6FC 07:F6EC: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F6FE 07:F6EE: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F700 07:F6F0: A8        TAY

; bzk optimize, delete LDA 00, move STA 0001 to 0x01F6FA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F701 07:F6F1: A9 00     LDA #$00
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F703 07:F6F3: 85 01     STA ram_0001_t15_spr
    MOVE.B  tbl_F4E5(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F705 07:F6F5: B9 E5 F4  LDA tbl_F4E5,Y
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F708 07:F6F8: 85 0C     STA ram_000C_t06_tab

; bzk optimize, useless TYA
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F70A 07:F6FA: 98        TYA
    MOVE.B  tbl_F4EE(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F70B 07:F6FB: B9 EE F4  LDA tbl_F4EE,Y
    MOVE.B  D0,ram_0004_t14  ; orig: C - - - - - 0x01F70E 07:F6FE: 85 04     STA ram_0004_t14
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F710 07:F700: A0 00     LDY #$00
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x01F712 07:F702: C9 08     CMP #$08
    BEQ     bra_F709             ; BEQ  ; orig: C - - - - - 0x01F714 07:F704: F0 03     BEQ bra_F709
    MOVE.B  ram_item_magic_boomerang,D2  ; orig: C - - - - - 0x01F716 07:F706: AC 75 06  LDY ram_item_magic_b
bra_F709:  ; orig: bra_F709:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F719 07:F709: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F71A 07:F70A: 18        CLC
    ADDX.B  ram_0004_t14,D0  ; orig: C - - - - - 0x01F71B 07:F70B: 65 04     ADC ram_0004_t14
    MOVE.B  D0,ram_0004_t13_spr_A  ; orig: C - - - - - 0x01F71D 07:F70D: 85 04     STA ram_0004_t13_spr
    MOVE.B  #$1D,D2  ; orig: C - - - - - 0x01F71F 07:F70F: A0 1D     LDY #$1D
    JMP     loc_F720  ; orig: C - - - - - 0x01F721 07:F711: 4C 20 F7  JMP loc_F720



loc_F714:  ; orig: loc_F714:
    MOVE.B  tbl_F511_pos_X(D2.L),D0  ; LDA abs,Y  ; orig: C D 3 - - - 0x01F724 07:F714: B9 11 F5  LDA tbl_F511_pos_X,Y
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01F727 07:F717: 85 00     STA ram_0000_t21_spr
    MOVE.B  tbl_F515_pos_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F729 07:F719: B9 15 F5  LDA tbl_F515_pos_Y,Y
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F72C 07:F71C: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x01F72E 07:F71E: A0 02     LDY #$02
loc_F720:  ; orig: loc_F720:

; in

; ram_0000_t21_spr_X

; ram_0001_t15_spr_Y
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01F730 07:F720: B5 70     LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F732 07:F722: 18        CLC
    ADDX.B  ram_0000_t21_spr_X,D0  ; orig: C - - - - - 0x01F733 07:F723: 65 00     ADC ram_0000_t21_spr
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01F735 07:F725: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F737 07:F727: B5 84     LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F739 07:F729: 18        CLC
    ADDX.B  ram_0001_t15_spr_Y,D0  ; orig: C - - - - - 0x01F73A 07:F72A: 65 01     ADC ram_0001_t15_spr
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F73C 07:F72C: 85 01     STA ram_0001_t15_spr
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F73E 07:F72E: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01F740 07:F730: 29 F0     AND #$F0
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01F742 07:F732: C9 20     CMP #$20
    BNE     bra_F73B             ; BNE  ; orig: C - - - - - 0x01F744 07:F734: D0 05     BNE bra_F73B
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01F746 07:F736: A9 01     LDA #$01
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01F748 07:F738: 20 88 79  JSR sub_bat_7988_set
bra_F73B:  ; orig: bra_F73B:
    JMP     loc_bat_7915  ; orig: C - - - - - 0x01F74B 07:F73B: 4C 15 79  JMP loc_bat_7915



sub_F73E:  ; orig: sub_F73E:

; X = 12
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F74E 07:F73E: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01F750 07:F740: 29 F0     AND #$F0
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01F752 07:F742: C9 30     CMP #$30
    BCS     bra_F769             ; BCS  ; orig: C - - - - - 0x01F754 07:F744: B0 23     BCS bra_F769
    JMP     loc_F519  ; orig: C - - - - - 0x01F756 07:F746: 4C 19 F5  JMP loc_F519



tbl_F749_pos_X:  ; orig: tbl_F749_pos_X:
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01F759 07:F749: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F75A 07:F74A: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F75B 07:F74B: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 3 - - - 0x01F75C 07:F74C: F8        .byte $F8   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01F75D 07:F74D: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F75E 07:F74E: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 3 - - - 0x01F75F 07:F74F: F5        .byte $F5   ;
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 3 - - - 0x01F760 07:F750: 0B        .byte $0B   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01F761 07:F751: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F762 07:F752: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $F9  -- needs manual handling  ; orig: - D 3 - - - 0x01F763 07:F753: F9        .byte $F9   ;
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 3 - - - 0x01F764 07:F754: 07        .byte $07   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01F765 07:F755: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 3 - - - 0x01F766 07:F756: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $FD  -- needs manual handling  ; orig: - D 3 - - - 0x01F767 07:F757: FD        .byte $FD   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F768 07:F758: 03        .byte $03   ;



tbl_F759_pos_Y:  ; orig: tbl_F759_pos_Y:
    ; [DIRECTIVE] .BYTE $F7  -- needs manual handling  ; orig: - D 3 - - - 0x01F769 07:F759: F7        .byte $F7   ;
    ; [DIRECTIVE] .BYTE $F2  -- needs manual handling  ; orig: - D 3 - - - 0x01F76A 07:F75A: F2        .byte $F2   ;
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 3 - - - 0x01F76B 07:F75B: F5        .byte $F5   ;
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 3 - - - 0x01F76C 07:F75C: F5        .byte $F5   ;
    ; [DIRECTIVE] .BYTE $F6  -- needs manual handling  ; orig: - D 3 - - - 0x01F76D 07:F75D: F6        .byte $F6   ;
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 3 - - - 0x01F76E 07:F75E: 0D        .byte $0D   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F76F 07:F75F: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F770 07:F760: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $F7  -- needs manual handling  ; orig: - D 3 - - - 0x01F771 07:F761: F7        .byte $F7   ;
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 3 - - - 0x01F772 07:F762: 09        .byte $09   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F773 07:F763: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F774 07:F764: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01F775 07:F765: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 3 - - - 0x01F776 07:F766: 05        .byte $05   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F777 07:F767: 03        .byte $03   ;
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 3 - - - 0x01F778 07:F768: 03        .byte $03   ;



bra_F769:
; bzk
sub_F769:  ; orig: sub_F769:

; X = 0D 12
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F779 07:F769: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F77B 07:F76B: 29 0F     AND #$0F
    BEQ     bra_F793_RTS             ; BEQ  ; orig: C - - - - - 0x01F77D 07:F76D: F0 24     BEQ bra_F793_RTS
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01F77F 07:F76F: DE D0 03  DEC ram_anim_timer_o
    BNE     bra_F794             ; BNE  ; orig: C - - - - - 0x01F782 07:F772: D0 20     BNE bra_F794
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F784 07:F774: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F786 07:F776: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F788 07:F778: A8        TAY
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01F789 07:F779: A9 08     LDA #$08
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F78B 07:F77B: 88        DEY
    BEQ     bra_F780             ; BEQ  ; orig: C - - - - - 0x01F78C 07:F77C: F0 02     BEQ bra_F780
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01F78E 07:F77E: A9 01     LDA #$01
bra_F780:  ; orig: bra_F780:
    MOVE.B  D0,ram_anim_timer_link  ; orig: C - - - - - 0x01F790 07:F780: 8D D0 03  STA ram_anim_timer_l
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F793 07:F783: 9D D0 03  STA ram_anim_timer_o
    ; (empty translation for INC)  ; orig: C - - - - - 0x01F796 07:F786: F6 AC     INC ram_state_obj,X
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F798 07:F788: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F79A 07:F78A: 29 0F     AND #$0F
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x01F79C 07:F78C: C9 06     CMP #$06
    BCC     bra_F794             ; BCC  ; orig: C - - - - - 0x01F79E 07:F78E: 90 04     BCC bra_F794

; bzk optimize, JMP
    BSR     sub_F855_clear_enemy_state             ; JSR -> BSR  ; orig: C - - - - - 0x01F7A0 07:F790: 20 55 F8  JSR sub_F855_clear_e
bra_F793_RTS:  ; orig: bra_F793_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F7A3 07:F793: 60        RTS
bra_F794:  ; orig: bra_F794:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F7A4 07:F794: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01F7A6 07:F796: 85 0F     STA ram_000F_t04_fla
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F7A8 07:F798: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F7AA 07:F79A: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F7AC 07:F79C: A8        TAY
    MOVE.B  #$FC,D0  ; orig: C - - - - - 0x01F7AD 07:F79D: A9 FC     LDA #$FC
    CMPI.B  #$05,D2  ; orig: C - - - - - 0x01F7AF 07:F79F: C0 05     CPY #$05
    BEQ     bra_F793_RTS             ; BEQ  ; orig: C - - - - - 0x01F7B1 07:F7A1: F0 F0     BEQ bra_F793_RTS
bra_F7A3_loop:  ; orig: bra_F7A3_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F7B3 07:F7A3: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F7B4 07:F7A4: 69 04     ADC #$04
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F7B6 07:F7A6: 88        DEY
    BNE     bra_F7A3_loop             ; BNE  ; orig: C - - - - - 0x01F7B7 07:F7A7: D0 FA     BNE bra_F7A3_loop
    MOVE.B  D0,ram_0000_t4D  ; orig: C - - - - - 0x01F7B9 07:F7A9: 85 00     STA ram_0000_t4D
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01F7BB 07:F7AB: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F7BD 07:F7AD: 95 98     STA ram_dir_enemy,X
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F7BF 07:F7AF: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F7C2 07:F7B2: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F7C3 07:F7B3: 18        CLC
    ADDX.B  ram_0000_t4D,D0  ; orig: C - - - - - 0x01F7C4 07:F7B4: 65 00     ADC ram_0000_t4D
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F7C6 07:F7B6: A8        TAY
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01F7C7 07:F7B7: A5 70     LDA ram_pos_X_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F7C9 07:F7B9: 18        CLC
    ; !! ADC tbl_F749_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01F7CA 07:F7BA: 79 49 F7  ADC tbl_F749_pos_X,Y
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F7CD 07:F7BD: 95 70     STA ram_pos_X_enemy,
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01F7CF 07:F7BF: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01F7D1 07:F7C1: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F7D3 07:F7C3: 18        CLC
    ; !! ADC tbl_F759_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01F7D4 07:F7C4: 79 59 F7  ADC tbl_F759_pos_Y,Y
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F7D7 07:F7C7: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01F7D9 07:F7C9: 85 01     STA ram_0001_t15_spr
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F7DB 07:F7CB: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F7DD 07:F7CD: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F7DF 07:F7CF: A8        TAY
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01F7E0 07:F7D0: A9 08     LDA #$08
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F7E2 07:F7D2: 88        DEY
    BEQ     bra_F7D7             ; BEQ  ; orig: C - - - - - 0x01F7E3 07:F7D3: F0 02     BEQ bra_F7D7
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F7E5 07:F7D5: B5 98     LDA ram_dir_enemy,X
bra_F7D7:  ; orig: bra_F7D7:
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01F7E7 07:F7D7: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  tbl_F509(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F7EA 07:F7DA: B9 09 F5  LDA tbl_F509,Y
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F7ED 07:F7DD: 85 0C     STA ram_000C_t06_tab
    MOVE.B  tbl_F50D(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F7EF 07:F7DF: B9 0D F5  LDA tbl_F50D,Y
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F7F2 07:F7E2: E0 0D     CPX #$0D
    BEQ     bra_F7EB             ; BEQ  ; orig: C - - - - - 0x01F7F4 07:F7E4: F0 05     BEQ bra_F7EB
    ORI.B   #$01,D0  ; orig: C - - - - - 0x01F7F6 07:F7E6: 09 01     ORA #$01
    JMP     loc_F7F2  ; orig: C - - - - - 0x01F7F8 07:F7E8: 4C F2 F7  JMP loc_F7F2
bra_F7EB:  ; orig: bra_F7EB:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F7FB 07:F7EB: 18        CLC
    ADDX.B  ram_item_sword,D0  ; orig: C - - - - - 0x01F7FC 07:F7EC: 6D 57 06  ADC ram_item_sword
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F7FF 07:F7EF: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x01F800 07:F7F0: E9 01     SBC #$01
loc_F7F2:  ; orig: loc_F7F2:
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C D 3 - - - 0x01F802 07:F7F2: 20 88 79  JSR sub_bat_7988_set
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x01F805 07:F7F5: C0 02     CPY #$02
    BNE     bra_F7FB             ; BNE  ; orig: C - - - - - 0x01F807 07:F7F7: D0 02     BNE bra_F7FB
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x01F809 07:F7F9: E6 0F     INC ram_000F_t04_fla
bra_F7FB:  ; orig: bra_F7FB:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F80B 07:F7FB: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F80D 07:F7FD: 29 0F     AND #$0F
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x01F80F 07:F7FF: C9 01     CMP #$01
    BEQ     bra_F854_RTS             ; BEQ  ; orig: C - - - - - 0x01F811 07:F801: F0 51     BEQ bra_F854_RTS
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F813 07:F803: A0 00     LDY #$00
    CMPI.B  #$0D,D1  ; orig: C - - - - - 0x01F815 07:F805: E0 0D     CPX #$0D
    BEQ     bra_F80B             ; BEQ  ; orig: C - - - - - 0x01F817 07:F807: F0 02     BEQ bra_F80B
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x01F819 07:F809: A0 08     LDY #$08
bra_F80B:  ; orig: bra_F80B:
    BSR     sub_bat_7915             ; JSR -> BSR  ; orig: C - - - - - 0x01F81B 07:F80B: 20 15 79  JSR sub_bat_7915
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F81E 07:F80E: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F820 07:F810: 29 0F     AND #$0F
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01F822 07:F812: C9 03     CMP #$03
    BNE     bra_F854_RTS             ; BNE  ; orig: C - - - - - 0x01F824 07:F814: D0 3E     BNE bra_F854_RTS
    CMPI.B  #$12,D1  ; orig: C - - - - - 0x01F826 07:F816: E0 12     CPX #$12
    BNE     bra_F85A             ; BNE  ; orig: C - - - - - 0x01F828 07:F818: D0 40     BNE bra_F85A
    MOVE.B  #$0E,D1  ; orig: C - - - - - 0x01F82A 07:F81A: A2 0E     LDX #$0E    ; flying
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F82C 07:F81C: B5 AC     LDA ram_state_obj,X
    BEQ     bra_F823             ; BEQ  ; orig: C - - - - - 0x01F82E 07:F81E: F0 03     BEQ bra_F823
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F830 07:F820: 0A        ASL
    BCS     bra_F854_RTS             ; BCS  ; orig: C - - - - - 0x01F831 07:F821: B0 31     BCS bra_F854_RTS
bra_F823:  ; orig: bra_F823:
    MOVE.B  #con_sfx_4_energy_wave,D0  ; orig: C - - - - - 0x01F833 07:F823: A9 04     LDA #con_sfx_4_energ
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x01F835 07:F825: 8D 04 06  STA ram_sfx_4
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x01F838 07:F828: A9 80     LDA #$80
bra_F82A:  ; orig: bra_F82A:
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F83A 07:F82A: 95 AC     STA ram_state_obj,X
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01F83C 07:F82C: A9 10     LDA #$10
    BSR     sub_bat_711F             ; JSR -> BSR  ; orig: C - - - - - 0x01F83E 07:F82E: 20 1F 71  JSR sub_bat_711F
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F841 07:F831: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x01F843 07:F833: 29 03     AND #con_dir__LR
    BEQ     bra_F841             ; BEQ  ; orig: C - - - - - 0x01F845 07:F835: F0 0A     BEQ bra_F841
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F847 07:F837: B5 70     LDA ram_pos_X_enemy,
    CMPI.B  #$14,D0  ; orig: C - - - - - 0x01F849 07:F839: C9 14     CMP #$14
    BCC     bra_F855_clear_enemy_state             ; BCC  ; orig: C - - - - - 0x01F84B 07:F83B: 90 18     BCC bra_F855_clear_e
    CMPI.B  #$EC,D0  ; orig: C - - - - - 0x01F84D 07:F83D: C9 EC     CMP #$EC
    BCS     bra_F855_clear_enemy_state             ; BCS  ; orig: C - - - - - 0x01F84F 07:F83F: B0 14     BCS bra_F855_clear_e
bra_F841:  ; orig: bra_F841:
    MOVE.B  #$C0,D2  ; orig: C - - - - - 0x01F851 07:F841: A0 C0     LDY #$C0
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F853 07:F843: B5 AC     LDA ram_state_obj,X
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01F855 07:F845: 0A        ASL
    BCC     bra_F84A             ; BCC  ; orig: C - - - - - 0x01F856 07:F846: 90 02     BCC bra_F84A
    MOVE.B  #$A0,D2  ; orig: C D 3 - - - 0x01F858 07:F848: A0 A0     LDY #$A0
bra_F84A:  ; orig: bra_F84A:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F85A 07:F84A: 98        TYA
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F85B 07:F84B: 9D BC 03  STA ram_03BC_obj,X
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x01F85E 07:F84E: AD 94 03  LDA ram_0394_link
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F861 07:F851: 9D 94 03  STA ram_0394_enemy,X
bra_F854_RTS:  ; orig: bra_F854_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F864 07:F854: 60        RTS



loc_F855_clear_enemy_state:  ; orig: loc_F855_clear_enemy_state:
sub_F855_clear_enemy_state:  ; orig: sub_F855_clear_enemy_state:
sub_0x01F865_clear_enemy_state:  ; orig: sub_0x01F865_clear_enemy_state:
bra_F855_clear_enemy_state:  ; orig: bra_F855_clear_enemy_state:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01F865 07:F855: A9 00     LDA #$00
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F867 07:F857: 95 AC     STA ram_state_obj,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01F869 07:F859: 60        RTS



bra_F85A:  ; orig: bra_F85A:
    MOVE.B  #$0E,D1  ; orig: C - - - - - 0x01F86A 07:F85A: A2 0E     LDX #$0E
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F86C 07:F85C: B5 AC     LDA ram_state_obj,X
    BNE     bra_F854_RTS             ; BNE  ; orig: C - - - - - 0x01F86E 07:F85E: D0 F4     BNE bra_F854_RTS
    MOVE.B  ram_0529,D0  ; orig: C - - - - - 0x01F870 07:F860: AD 29 05  LDA ram_0529
    BNE     bra_F87D             ; BNE  ; orig: C - - - - - 0x01F873 07:F863: D0 18     BNE bra_F87D
    MOVE.B  ram_item_hearts,D0  ; orig: C - - - - - 0x01F875 07:F865: AD 6F 06  LDA ram_item_hearts
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F878 07:F868: 48        PHA
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F879 07:F869: 29 0F     AND #$0F
    MOVE.B  D0,ram_0000_t48  ; orig: C - - - - - 0x01F87B 07:F86B: 85 00     STA ram_0000_t48
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F87D 07:F86D: 68        PLA

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F87E 07:F86E: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F87F 07:F86F: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F880 07:F870: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F881 07:F871: 4A        LSR
    CMP.B   ram_0000_t48,D0  ; orig: C - - - - - 0x01F882 07:F872: C5 00     CMP ram_0000_t48
    BNE     bra_F854_RTS             ; BNE  ; orig: C - - - - - 0x01F884 07:F874: D0 DE     BNE bra_F854_RTS
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F886 07:F876: AD 70 06  LDA ram_item_hearts 
    CMPI.B  #$80,D0  ; orig: C - - - - - 0x01F889 07:F879: C9 80     CMP #$80
    BCC     bra_F854_RTS             ; BCC  ; orig: C - - - - - 0x01F88B 07:F87B: 90 D7     BCC bra_F854_RTS
bra_F87D:  ; orig: bra_F87D:
    MOVE.B  #con_sfx_1_01,D0  ; orig: C - - - - - 0x01F88D 07:F87D: A9 01     LDA #con_sfx_1_01
    BSR     sub_bat_6D7C_set_sfx_1             ; JSR -> BSR  ; orig: C - - - - - 0x01F88F 07:F87F: 20 7C 6D  JSR sub_bat_6D7C_set
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01F892 07:F882: A9 10     LDA #$10    ; flying
    BNE     bra_F82A             ; BNE  ; orig: C - - - - - 0x01F894 07:F884: D0 A4     BNE bra_F82A    ; jm
loc_F886:  ; orig: loc_F886:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01F896 07:F886: B5 AC     LDA ram_state_obj,X
    CMPI.B  #$21,D0  ; orig: C - - - - - 0x01F898 07:F888: C9 21     CMP #$21
    BNE     bra_F8B1             ; BNE  ; orig: C - - - - - 0x01F89A 07:F88A: D0 25     BNE bra_F8B1
    MOVE.B  ram_0394_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F89C 07:F88C: BD 94 03  LDA ram_0394_enemy,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F89F 07:F88F: 48        PHA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F8A0 07:F890: A9 00     LDA #$00
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F8A2 07:F892: 9D 94 03  STA ram_0394_enemy,X
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F8A5 07:F895: B5 98     LDA ram_dir_enemy,X
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01F8A7 07:F897: 85 0F     STA ram_000F_t01_dir
    BSR     sub_F08D             ; JSR -> BSR  ; orig: C - - - - - 0x01F8A9 07:F899: 20 8D F0  JSR sub_F08D
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F8AC 07:F89C: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F8AD 07:F89D: 18        CLC
    ; !! ADC ram_0394_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01F8AE 07:F89E: 7D 94 03  ADC ram_0394_enemy,X
    MOVE.B  D0,ram_0394_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F8B1 07:F8A1: 9D 94 03  STA ram_0394_enemy,X
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01F8B4 07:F8A4: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01F8B7 07:F8A7: C9 10     CMP #$10
    BNE     bra_F8C5             ; BNE  ; orig: C - - - - - 0x01F8B9 07:F8A9: D0 1A     BNE bra_F8C5
    MOVE.B  #$3F,D0  ; orig: C - - - - - 0x01F8BB 07:F8AB: A9 3F     LDA #$3F
    MOVE.B  D0,ram_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F8BD 07:F8AD: 95 28     STA ram_timer_obj,X
    ; (empty translation for INC)  ; orig: C - - - - - 0x01F8BF 07:F8AF: F6 AC     INC ram_state_obj,X
bra_F8B1:  ; orig: bra_F8B1:
    MOVE.B  ram_timer_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F8C1 07:F8B1: B5 28     LDA ram_timer_enemy,
    BEQ     bra_F855_clear_enemy_state             ; BEQ  ; orig: C - - - - - 0x01F8C3 07:F8B3: F0 A0     BEQ bra_F855_clear_e
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F8C5 07:F8B5: A5 10     LDA ram_dungeon_leve
    BEQ     bra_F8C5             ; BEQ  ; orig: C - - - - - 0x01F8C7 07:F8B7: F0 0C     BEQ bra_F8C5    ; if

; if dungeon
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01F8C9 07:F8B9: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F8CA 07:F8BA: 48        PHA
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01F8CB 07:F8BB: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F8CD 07:F8BD: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x0131CE             ; JSR -> BSR  ; orig: C - - - - - 0x01F8D0 07:F8C0: 20 BE B1  JSR sub_0x0131CE
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F8D3 07:F8C3: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01F8D4 07:F8C4: AA        TAX
bra_F8C5:  ; orig: bra_F8C5:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x01F8D5 07:F8C5: A9 04     LDA #$04
    BSR     sub_FA89             ; JSR -> BSR  ; orig: C - - - - - 0x01F8D7 07:F8C7: 20 89 FA  JSR sub_FA89
    BSR     sub_FA72             ; JSR -> BSR  ; orig: C - - - - - 0x01F8DA 07:F8CA: 20 72 FA  JSR sub_FA72
    BSR     sub_bat_7986             ; JSR -> BSR  ; orig: C - - - - - 0x01F8DD 07:F8CD: 20 86 79  JSR sub_bat_7986
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F8E0 07:F8D0: A9 00     LDA #$00
    MOVE.B  D0,ram_000C_t07_flag  ; orig: C - - - - - 0x01F8E2 07:F8D2: 85 0C     STA ram_000C_t07_fla
    MOVE.B  #$40,D2  ; orig: C - - - - - 0x01F8E4 07:F8D4: A0 40     LDY #$40
    BSR     sub_bat_77E6             ; JSR -> BSR  ; orig: C - - - - - 0x01F8E6 07:F8D6: 20 E6 77  JSR sub_bat_77E6
    MOVE.B  ram_invinc_link,D0  ; orig: C - - - - - 0x01F8E9 07:F8D9: AD F0 04  LDA ram_invinc_link
    BNE     bra_F91D_RTS             ; BNE  ; orig: C - - - - - 0x01F8EC 07:F8DC: D0 3F     BNE bra_F91D_RTS
    MOVE.B  D1,ram_0000_t2A  ; orig: C - - - - - 0x01F8EE 07:F8DE: 86 00     STX ram_0000_t2A
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F8F0 07:F8E0: A2 00     LDX #$00
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x01F8F2 07:F8E2: A0 02     LDY #$02
    BSR     sub_F90D             ; JSR -> BSR  ; orig: C - - - - - 0x01F8F4 07:F8E4: 20 0D F9  JSR sub_F90D
    MOVE.B  ram_0000_t2A,D1  ; orig: C - - - - - 0x01F8F7 07:F8E7: A6 00     LDX ram_0000_t2A
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F8F9 07:F8E9: A0 00     LDY #$00
    BSR     sub_F90D             ; JSR -> BSR  ; orig: C - - - - - 0x01F8FB 07:F8EB: 20 0D F9  JSR sub_F90D
    MOVE.B  ram_0000_t2A,D2  ; orig: C - - - - - 0x01F8FE 07:F8EE: A4 00     LDY ram_0000_t2A
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01F900 07:F8F0: A2 00     LDX #$00
    MOVE.B  #$0E,D0  ; orig: C - - - - - 0x01F902 07:F8F2: A9 0E     LDA #$0E
    BSR     sub_bat_7DFB             ; JSR -> BSR  ; orig: C - - - - - 0x01F904 07:F8F4: 20 FB 7D  JSR sub_bat_7DFB
    BEQ     bra_F91D_RTS             ; BEQ  ; orig: C - - - - - 0x01F907 07:F8F7: F0 24     BEQ bra_F91D_RTS
    MOVE.B  ram_0000_t2A,D1  ; orig: C - - - - - 0x01F909 07:F8F9: A6 00     LDX ram_0000_t2A
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F90B 07:F8FB: A0 00     LDY #$00
    MOVE.B  D2,ram_0000_t2A  ; orig: C - - - - - 0x01F90D 07:F8FD: 84 00     STY ram_0000_t2A
    BSR     sub_bat_7E26             ; JSR -> BSR  ; orig: C - - - - - 0x01F90F 07:F8FF: 20 26 7E  JSR sub_bat_7E26
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01F912 07:F902: A9 00     LDA #$00
    MOVE.B  D0,ram_000D_t01_damage_lo  ; orig: C - - - - - 0x01F914 07:F904: 85 0D     STA ram_000D_t01_dam
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x01F916 07:F906: A9 80     LDA #$80
    MOVE.B  D0,ram_000E_t03_damage_hi  ; orig: C - - - - - 0x01F918 07:F908: 85 0E     STA ram_000E_t03_dam
    JMP     loc_bat_7B4F  ; orig: C - - - - - 0x01F91A 07:F90A: 4C 4F 7B  JMP loc_bat_7B4F



sub_F90D:  ; orig: sub_F90D:

; in

; Y = 00/02

; out

; ram_0002_t34_pos_X

; ram_0004_t10_pos_X
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F91D 07:F90D: B5 70     LDA ram_pos_X_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F91F 07:F90F: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F920 07:F910: 69 08     ADC #$08

; ram_0002_t34_pos_X

; ram_0004_t10_pos_X
    MOVE.B  D0,ram_0002_temp(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01F922 07:F912: 99 02 00  STA ram_0002_temp,Y
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F925 07:F915: B5 84     LDA ram_pos_Y_obj,X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F927 07:F917: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01F928 07:F918: 69 08     ADC #$08

; ram_0003_t21_pos_Y

; ram_0005_t08_pos_Y
    MOVE.B  D0,ram_0003_temp(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01F92A 07:F91A: 99 03 00  STA ram_0003_temp,Y
bra_F91D_RTS:  ; orig: bra_F91D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F92D 07:F91D: 60        RTS



tbl_F91E:  ; orig: tbl_F91E:
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 3 - - - 0x01F92E 07:F91E: 30        .byte $30   ; 01
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 3 - - - 0x01F92F 07:F91F: 18        .byte $18   ; 02
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 3 - - - 0x01F930 07:F920: 0C        .byte $0C   ; 03
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 3 - - - 0x01F931 07:F921: 06        .byte $06   ; 04



tbl_F922_pos_X:  ; orig: tbl_F922_pos_X:
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 3 - - - 0x01F932 07:F922: 78        .byte $78   ; 00
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 3 - - - 0x01F933 07:F923: 78        .byte $78   ; 01
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 3 - - - 0x01F934 07:F924: 20        .byte $20   ; 02
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 3 - - - 0x01F935 07:F925: D0        .byte $D0   ; 03



tbl_F926_pos_Y:  ; orig: tbl_F926_pos_Y:
    ; [DIRECTIVE] .BYTE $5D  -- needs manual handling  ; orig: - D 3 - - - 0x01F936 07:F926: 5D        .byte $5D   ; 00
    ; [DIRECTIVE] .BYTE $BD  -- needs manual handling  ; orig: - D 3 - - - 0x01F937 07:F927: BD        .byte $BD   ; 01
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 3 - - - 0x01F938 07:F928: 8D        .byte $8D   ; 02
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 3 - - - 0x01F939 07:F929: 8D        .byte $8D   ; 03



sub_F92A:  ; orig: sub_F92A:

; X = 10 11
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F93A 07:F92A: B5 AC     LDA ram_state_obj,X
    BEQ     bra_F95F_RTS             ; BEQ  ; orig: C - - - - - 0x01F93C 07:F92C: F0 31     BEQ bra_F95F_RTS
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01F93E 07:F92E: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01F940 07:F930: C9 10     CMP #$10
    BEQ     bra_F937             ; BEQ  ; orig: C - - - - - 0x01F942 07:F932: F0 03     BEQ bra_F937
    JMP     loc_F886  ; orig: C - - - - - 0x01F944 07:F934: 4C 86 F8  JMP loc_F886
bra_F937:  ; orig: bra_F937:
    MOVE.B  ram_timer_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F947 07:F937: B5 28     LDA ram_timer_enemy,
    BNE     bra_F9AE             ; BNE  ; orig: C - - - - - 0x01F949 07:F939: D0 73     BNE bra_F9AE
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F94B 07:F93B: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F94D 07:F93D: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01F94F 07:F93F: A8        TAY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01F950 07:F940: B9 1D F9  LDA tbl_F91E - $01,Y
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F953 07:F943: 95 28     STA ram_timer_enemy,
    ; (empty translation for INC)  ; orig: C - - - - - 0x01F955 07:F945: F6 AC     INC ram_state_obj,X
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F957 07:F947: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F959 07:F949: 29 0F     AND #$0F
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F95B 07:F94B: 48        PHA
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01F95C 07:F94C: C9 03     CMP #$03
    BNE     bra_F955             ; BNE  ; orig: C - - - - - 0x01F95E 07:F94E: D0 05     BNE bra_F955
    MOVE.B  #con_sfx_3_10,D0  ; orig: C - - - - - 0x01F960 07:F950: A9 10     LDA #con_sfx_3_10
    BSR     sub_bat_6D80_set_sfx_3             ; JSR -> BSR  ; orig: C - - - - - 0x01F962 07:F952: 20 80 6D  JSR sub_bat_6D80_set
bra_F955:  ; orig: bra_F955:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01F965 07:F955: 68        PLA
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x01F966 07:F956: C9 05     CMP #$05
    BNE     bra_F960             ; BNE  ; orig: C - - - - - 0x01F968 07:F958: D0 06     BNE bra_F960
    BSR     sub_F855_clear_enemy_state             ; JSR -> BSR  ; orig: C - - - - - 0x01F96A 07:F95A: 20 55 F8  JSR sub_F855_clear_e
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01F96D 07:F95D: 95 28     STA ram_timer_enemy,
bra_F95F_RTS:  ; orig: bra_F95F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01F96F 07:F95F: 60        RTS
bra_F960:  ; orig: bra_F960:
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01F970 07:F960: C9 04     CMP #$04
    BNE     bra_F9AE             ; BNE  ; orig: C - - - - - 0x01F972 07:F962: D0 4A     BNE bra_F9AE
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01F974 07:F964: A5 10     LDA ram_dungeon_leve
    BEQ     bra_F9AE             ; BEQ  ; orig: C - - - - - 0x01F976 07:F966: F0 46     BEQ bra_F9AE    ; if

; if dungeon
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01F978 07:F968: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01F97A 07:F96A: C9 09     CMP #con_script_09
    BEQ     bra_F9AE             ; BEQ  ; orig: C - - - - - 0x01F97C 07:F96C: F0 40     BEQ bra_F9AE
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x01F97E 07:F96E: A0 04     LDY #$04
bra_F970_loop:  ; orig: bra_F970_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01F980 07:F970: 88        DEY
    BMI     bra_F9AE             ; BMI  ; orig: C - - - - - 0x01F981 07:F971: 30 3B     BMI bra_F9AE
    MOVE.B  tbl_F922_pos_X(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F983 07:F973: B9 22 F9  LDA tbl_F922_pos_X,Y
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F986 07:F976: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01F987 07:F977: F5 70     SBC ram_pos_X_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01F989 07:F979: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$18,D0  ; orig: C - - - - - 0x01F98C 07:F97C: C9 18     CMP #$18
    BCS     bra_F970_loop             ; BCS  ; orig: C - - - - - 0x01F98E 07:F97E: B0 F0     BCS bra_F970_loop
    MOVE.B  tbl_F926_pos_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F990 07:F980: B9 26 F9  LDA tbl_F926_pos_Y,Y
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F993 07:F983: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01F994 07:F984: F5 84     SBC ram_pos_Y_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01F996 07:F986: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$18,D0  ; orig: C - - - - - 0x01F999 07:F989: C9 18     CMP #$18
    BCS     bra_F970_loop             ; BCS  ; orig: C - - - - - 0x01F99B 07:F98B: B0 E3     BCS bra_F970_loop
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01F99D 07:F98D: B9 C3 6D  LDA tbl_bat_6DC3_dir
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x01F9A0 07:F990: 85 02     STA ram_0002_t24_dir
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x01F9A2 07:F992: 25 EE     AND ram_00EE
    BNE     bra_F9AE             ; BNE  ; orig: C - - - - - 0x01F9A4 07:F994: D0 18     BNE bra_F9AE
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x01F9A6 07:F996: A5 54     LDA ram_0054_timer
    BNE     bra_F9AE             ; BNE  ; orig: C - - - - - 0x01F9A8 07:F998: D0 14     BNE bra_F9AE
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01F9AA 07:F99A: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01F9AC 07:F99C: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x016406             ; JSR -> BSR  ; orig: C - - - - - 0x01F9AF 07:F99F: 20 F6 A3  JSR sub_0x016406
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01F9B2 07:F9A2: C9 04     CMP #$04
    BNE     bra_F9AE             ; BNE  ; orig: C - - - - - 0x01F9B4 07:F9A4: D0 08     BNE bra_F9AE
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01F9B6 07:F9A6: A9 06     LDA #$06
    MOVE.B  D0,ram_0054_timer  ; orig: C - - - - - 0x01F9B8 07:F9A8: 85 54     STA ram_0054_timer
    MOVE.B  ram_0002_t24_direction,D0  ; orig: C - - - - - 0x01F9BA 07:F9AA: A5 02     LDA ram_0002_t24_dir
    MOVE.B  D0,ram_0055_direction  ; orig: C - - - - - 0x01F9BC 07:F9AC: 85 55     STA ram_0055_directi
bra_F9AE:  ; orig: bra_F9AE:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01F9BE 07:F9AE: 20 93 FA  JSR sub_FA93
    BSR     sub_F9BF             ; JSR -> BSR  ; orig: C - - - - - 0x01F9C1 07:F9B1: 20 BF F9  JSR sub_F9BF
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F9C4 07:F9B4: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F9C6 07:F9B6: 29 0F     AND #$0F
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01F9C8 07:F9B8: C9 02     CMP #$02
    BEQ     bra_F95F_RTS             ; BEQ  ; orig: C - - - - - 0x01F9CA 07:F9BA: F0 A3     BEQ bra_F95F_RTS
    JMP     loc_F9E5  ; orig: C - - - - - 0x01F9CC 07:F9BC: 4C E5 F9  JMP loc_F9E5



sub_F9BF:  ; orig: sub_F9BF:

; in

; X = 10 11
    BSR     sub_bat_71BB             ; JSR -> BSR  ; orig: C - - - - - 0x01F9CF 07:F9BF: 20 BB 71  JSR sub_bat_71BB
sub_F9C2:  ; orig: sub_F9C2:
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01F9D2 07:F9C2: B5 AC     LDA ram_state_obj,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01F9D4 07:F9C4: 29 0F     AND #$0F
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01F9D6 07:F9C6: 38        SEC
    SUBX.B  #$02,D0       ; SBC imm  ; orig: C - - - - - 0x01F9D7 07:F9C7: E9 02     SBC #$02
sub_F9C9:  ; orig: sub_F9C9:
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01F9D9 07:F9C9: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01F9DB 07:F9CB: A0 00     LDY #$00
    MOVE.B  D2,ram_000F_t04_flag  ; orig: C - - - - - 0x01F9DD 07:F9CD: 84 0F     STY ram_000F_t04_fla
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01F9DF 07:F9CF: C8        INY ; 01
    MOVE.B  D2,ram_0004_t13_spr_A  ; orig: C - - - - - 0x01F9E0 07:F9D0: 84 04     STY ram_0004_t13_spr
    ; (empty translation for STY)  ; orig: C - - - - - 0x01F9E2 07:F9D2: 84 05     STY ram_0004_t13_spr
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x01F9E4 07:F9D4: A0 01     LDY #$01
    JMP     loc_bat_7915  ; orig: C - - - - - 0x01F9E6 07:F9D6: 4C 15 79  JMP loc_bat_7915



tbl_F9D9_pos_Y:  ; orig: tbl_F9D9_pos_Y:

; reads these 3 bytes, and also 3 bytes at 0x01F9EF
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 3 - - - 0x01F9E9 07:F9D9: F3        .byte $F3   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F9EA 07:F9DA: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 3 - - - 0x01F9EB 07:F9DB: 0E        .byte $0E   ; 02
tbl_F9DC_pos_X:  ; orig: tbl_F9DC_pos_X:

; reads these 3 bytes, and also 3 bytes at 0x01F9F2
    ; [DIRECTIVE] .BYTE $F9  -- needs manual handling  ; orig: - D 3 - - - 0x01F9EC 07:F9DC: F9        .byte $F9   ; 00
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 3 - - - 0x01F9ED 07:F9DD: 0E        .byte $0E   ; 01
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 3 - - - 0x01F9EE 07:F9DE: 07        .byte $07   ; 02

; pos Y
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 3 - - - 0x01F9EF 07:F9DF: F3        .byte $F3   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01F9F0 07:F9E0: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 3 - - - 0x01F9F1 07:F9E1: 0E        .byte $0E   ; 08

; pos X
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 3 - - - 0x01F9F2 07:F9E2: 07        .byte $07   ; 06
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 3 - - - 0x01F9F3 07:F9E3: F3        .byte $F3   ; 07
    ; [DIRECTIVE] .BYTE $F9  -- needs manual handling  ; orig: - D 3 - - - 0x01F9F4 07:F9E4: F9        .byte $F9   ; 08



loc_F9E5:  ; orig: loc_F9E5:
    MOVE.B  #$02,D2  ; orig: C D 3 - - - 0x01F9F5 07:F9E5: A0 02     LDY #$02
bra_F9E7_loop:  ; orig: bra_F9E7_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F9F7 07:F9E7: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01F9F8 07:F9E8: 48        PHA
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01F9F9 07:F9E9: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01F9FB 07:F9EB: 4A        LSR
    BCC     bra_F9F3             ; BCC  ; orig: C - - - - - 0x01F9FC 07:F9EC: 90 05     BCC bra_F9F3
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01F9FE 07:F9EE: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01F9FF 07:F9EF: 18        CLC
    ADDX.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01FA00 07:F9F0: 69 06     ADC #$06
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01FA02 07:F9F2: A8        TAY
bra_F9F3:  ; orig: bra_F9F3:
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA03 07:F9F3: B5 84     LDA ram_pos_Y_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01FA05 07:F9F5: 18        CLC
    ; !! ADC tbl_F9D9_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01FA06 07:F9F6: 79 D9 F9  ADC tbl_F9D9_pos_Y,Y
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01FA09 07:F9F9: 85 01     STA ram_0001_t15_spr
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA0B 07:F9FB: B5 70     LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01FA0D 07:F9FD: 18        CLC
    ; !! ADC tbl_F9DC_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01FA0E 07:F9FE: 79 DC F9  ADC tbl_F9DC_pos_X,Y
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01FA11 07:FA01: 85 00     STA ram_0000_t21_spr
    BSR     sub_F9C2             ; JSR -> BSR  ; orig: C - - - - - 0x01FA13 07:FA03: 20 C2 F9  JSR sub_F9C2
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01FA16 07:FA06: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01FA17 07:FA07: A8        TAY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01FA18 07:FA08: 88        DEY
    BPL     bra_F9E7_loop             ; BPL  ; orig: C - - - - - 0x01FA19 07:FA09: 10 DC     BPL bra_F9E7_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01FA1B 07:FA0B: 60        RTS



sub_FA0C:  ; orig: sub_FA0C:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01FA1C 07:FA0C: 20 93 FA  JSR sub_FA93
    MOVE.B  ram_0405_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA1F 07:FA0F: BD 05 04  LDA ram_0405_enemy,X
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01FA22 07:FA12: C9 10     CMP #$10
    BCS     bra_FA27             ; BCS  ; orig: C - - - - - 0x01FA24 07:FA14: B0 11     BCS bra_FA27
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01FA26 07:FA16: 29 0F     AND #$0F
    BSR     sub_F9C9             ; JSR -> BSR  ; orig: C - - - - - 0x01FA28 07:FA18: 20 C9 F9  JSR sub_F9C9
loc_FA1B:  ; orig: loc_FA1B:
    MOVE.B  ram_timer_enemy(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01FA2B 07:FA1B: B5 28     LDA ram_timer_enemy,
    BNE     bra_FA26_RTS             ; BNE  ; orig: C - - - - - 0x01FA2D 07:FA1D: D0 07     BNE bra_FA26_RTS
bra_FA1F:  ; orig: bra_FA1F:
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01FA2F 07:FA1F: A9 06     LDA #$06
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FA31 07:FA21: 95 28     STA ram_timer_enemy,
    ; (empty translation for INC)  ; orig: C - - - - - 0x01FA33 07:FA23: FE 05 04  INC ram_0405_enemy,X
bra_FA26_RTS:  ; orig: bra_FA26_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01FA36 07:FA26: 60        RTS
bra_FA27:  ; orig: bra_FA27:
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01FA37 07:FA27: 29 0F     AND #$0F
    BEQ     bra_FA1F             ; BEQ  ; orig: C - - - - - 0x01FA39 07:FA29: F0 F4     BEQ bra_FA1F
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x01FA3B 07:FA2B: 29 01     AND #$01
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01FA3D 07:FA2D: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01FA3F 07:FA2F: A9 01     LDA #$01
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01FA41 07:FA31: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  #$24,D2  ; orig: C - - - - - 0x01FA44 07:FA34: A0 24     LDY #$24
    BSR     sub_bat_7915             ; JSR -> BSR  ; orig: C - - - - - 0x01FA46 07:FA36: 20 15 79  JSR sub_bat_7915
    JMP     loc_FA1B  ; orig: C - - - - - 0x01FA49 07:FA39: 4C 1B FA  JMP loc_FA1B



sub_FA3C:  ; orig: sub_FA3C:
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01FA4C 07:FA3C: A5 AC     LDA ram_state_link
    BNE     bra_FA4F             ; BNE  ; orig: C - - - - - 0x01FA4E 07:FA3E: D0 0F     BNE bra_FA4F    ; if
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01FA50 07:FA40: A5 12     LDA ram_script
    CMPI.B  #con_script_04_screen_trans_end,D0  ; orig: C - - - - - 0x01FA52 07:FA42: C9 04     CMP #con_script_04_s
    BEQ     bra_FA4F             ; BEQ  ; orig: C - - - - - 0x01FA54 07:FA44: F0 09     BEQ bra_FA4F
    CMPI.B  #con_script_10,D0  ; orig: C - - - - - 0x01FA56 07:FA46: C9 10     CMP #con_script_10
    BEQ     bra_FA4F             ; BEQ  ; orig: C - - - - - 0x01FA58 07:FA48: F0 05     BEQ bra_FA4F
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x01FA5A 07:FA4A: AD F8 03  LDA ram_03F8_link
    BEQ     bra_FA62             ; BEQ  ; orig: C - - - - - 0x01FA5D 07:FA4D: F0 13     BEQ bra_FA62
bra_FA4F:  ; orig: bra_FA4F:
sub_0x01FA5F:  ; orig: sub_0x01FA5F:
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01FA5F 07:FA4F: DE D0 03  DEC ram_anim_timer_o
    BNE     bra_FA62             ; BNE  ; orig: C - - - - - 0x01FA62 07:FA52: D0 0E     BNE bra_FA62
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x01FA64 07:FA54: E0 00     CPX #$00
    BNE     bra_FA5B             ; BNE  ; orig: C - - - - - 0x01FA66 07:FA56: D0 03     BNE bra_FA5B
    BSR     sub_FAAE             ; JSR -> BSR  ; orig: C - - - - - 0x01FA68 07:FA58: 20 AE FA  JSR sub_FAAE
bra_FA5B:  ; orig: bra_FA5B:
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01FA6B 07:FA5B: A9 06     LDA #$06
    MOVE.B  D0,ram_0000_t22  ; orig: C - - - - - 0x01FA6D 07:FA5D: 85 00     STA ram_0000_t22
    BSR     sub_FAA0             ; JSR -> BSR  ; orig: C - - - - - 0x01FA6F 07:FA5F: 20 A0 FA  JSR sub_FAA0
bra_FA62:  ; orig: bra_FA62:
    BSR     sub_FA93             ; JSR -> BSR  ; orig: C - - - - - 0x01FA72 07:FA62: 20 93 FA  JSR sub_FA93
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA75 07:FA65: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x01FA77 07:FA67: 29 0C     AND #con_dir__UD
    BEQ     bra_FA78             ; BEQ  ; orig: C - - - - - 0x01FA79 07:FA69: F0 0D     BEQ bra_FA78
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01FA7B 07:FA6B: A0 03     LDY #$03
    ANDI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01FA7D 07:FA6D: 29 08     AND #con_dir_Up
    BNE     bra_FA72             ; BNE  ; orig: C - - - - - 0x01FA7F 07:FA6F: D0 01     BNE bra_FA72
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01FA81 07:FA71: 88        DEY
bra_FA72:  ; orig: bra_FA72:
sub_FA72:  ; orig: sub_FA72:
sub_0x01FA82:  ; orig: sub_0x01FA82:
    MOVE.B  ram_obj_anim_id(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA82 07:FA72: BD E4 03  LDA ram_obj_anim_id,
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01FA85 07:FA75: 85 0F     STA ram_000F_t04_fla
    RTS                     ; RTS  ; orig: C - - - - - 0x01FA87 07:FA77: 60        RTS
bra_FA78:  ; orig: bra_FA78:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01FA88 07:FA78: A0 00     LDY #$00
    MOVE.B  ram_obj_anim_id(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA8A 07:FA7A: BD E4 03  LDA ram_obj_anim_id,
    BEQ     bra_FA80             ; BEQ  ; orig: C - - - - - 0x01FA8D 07:FA7D: F0 01     BEQ bra_FA80
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01FA8F 07:FA7F: C8        INY
bra_FA80:  ; orig: bra_FA80:
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FA90 07:FA80: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir_Right,D0  ; orig: C - - - - - 0x01FA92 07:FA82: 29 01     AND #con_dir_Right
    BNE     bra_FA88_RTS             ; BNE  ; orig: C - - - - - 0x01FA94 07:FA84: D0 02     BNE bra_FA88_RTS
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x01FA96 07:FA86: E6 0F     INC ram_000F_t04_fla
bra_FA88_RTS:  ; orig: bra_FA88_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01FA98 07:FA88: 60        RTS



sub_FA89:  ; orig: sub_FA89:
sub_0x01FA99:  ; orig: sub_0x01FA99:

; in

; A =
    MOVE.B  D0,ram_0000_t22  ; orig: C - - - - - 0x01FA99 07:FA89: 85 00     STA ram_0000_t22
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01FA9B 07:FA8B: DE D0 03  DEC ram_anim_timer_o
    BNE     bra_FA93             ; BNE  ; orig: C - - - - - 0x01FA9E 07:FA8E: D0 03     BNE bra_FA93
    BSR     sub_FAA0             ; JSR -> BSR  ; orig: C - - - - - 0x01FAA0 07:FA90: 20 A0 FA  JSR sub_FAA0
bra_FA93:  ; orig: bra_FA93:
sub_FA93:  ; orig: sub_FA93:
sub_0x01FAA3:  ; orig: sub_0x01FAA3:
loc_0x01FAA3:  ; orig: loc_0x01FAA3:

; out

; A = 00

; for 0x01E82C 0x010CA0 0x0109DE 0x00724D 0x010EAC 0x010E44

;     0x010D7C 0x01032D 0x00AA82 0x004C7C 0x004BB3 0x004749

; ram_000F_t04_flag
    MOVE.B  ram_pos_X_obj(D1.L),D0  ; LDA abs,X  ; orig: C D 3 - - - 0x01FAA3 07:FA93: B5 70     LDA ram_pos_X_obj,X
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01FAA5 07:FA95: 85 00     STA ram_0000_t21_spr
    MOVE.B  ram_pos_Y_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FAA7 07:FA97: B5 84     LDA ram_pos_Y_obj,X
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01FAA9 07:FA99: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FAAB 07:FA9B: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01FAAD 07:FA9D: 85 0F     STA ram_000F_t04_fla
    RTS                     ; RTS  ; orig: C - - - - - 0x01FAAF 07:FA9F: 60        RTS



sub_FAA0:  ; orig: sub_FAA0:

; in

; ram_0000_t22
    MOVE.B  ram_0000_t22,D0  ; orig: C - - - - - 0x01FAB0 07:FAA0: A5 00     LDA ram_0000_t22
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FAB2 07:FAA2: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  ram_obj_anim_id(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FAB5 07:FAA5: BD E4 03  LDA ram_obj_anim_id,
    EORI.B  #$01,D0  ; orig: C - - - - - 0x01FAB8 07:FAA8: 49 01     EOR #$01
    MOVE.B  D0,ram_obj_anim_id(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FABA 07:FAAA: 9D E4 03  STA ram_obj_anim_id,
    RTS                     ; RTS  ; orig: C - - - - - 0x01FABD 07:FAAD: 60        RTS



sub_FAAE:  ; orig: sub_FAAE:
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01FABE 07:FAAE: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_10 + con_obj_state_20,D0  ; orig: C - - - - - 0x01FAC0 07:FAB0: 29 30     AND #con_obj_state_1
    CMPI.B  #con_obj_state_10,D0  ; orig: C - - - - - 0x01FAC2 07:FAB2: C9 10     CMP #con_obj_state_1
    BNE     bra_FABE             ; BNE  ; orig: C - - - - - 0x01FAC4 07:FAB4: D0 08     BNE bra_FABE
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01FAC6 07:FAB6: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_01 + con_obj_state_02 + con_obj_state_04 + con_obj_state_08,D0  ; orig: C - - - - - 0x01FAC8 07:FAB8: 29 0F     AND #con_obj_state_0
    BNE     bra_FACD             ; BNE  ; orig: C - - - - - 0x01FACA 07:FABA: D0 11     BNE bra_FACD
    BEQ     bra_FAC8             ; BEQ  ; orig: C - - - - - 0x01FACC 07:FABC: F0 0A     BEQ bra_FAC8    ; jm
bra_FABE:  ; orig: bra_FABE:
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01FACE 07:FABE: C9 20     CMP #$20
    BNE     bra_FAD9             ; BNE  ; orig: C - - - - - 0x01FAD0 07:FAC0: D0 17     BNE bra_FAD9
    MOVE.B  ram_state_link,D0  ; orig: - - - - - - 0x01FAD2 07:FAC2: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_01 + con_obj_state_02 + con_obj_state_04 + con_obj_state_08,D0  ; orig: - - - - - - 0x01FAD4 07:FAC4: 29 0F     AND #con_obj_state_0
    BNE     bra_FACD             ; BNE  ; orig: - - - - - - 0x01FAD6 07:FAC6: D0 05     BNE bra_FACD
bra_FAC8:  ; orig: bra_FAC8:

; triggers when link has just pressed a button to swing a sword/staff
    ADDQ.B  #1,ram_state_link  ; orig: C - - - - - 0x01FAD8 07:FAC8: E6 AC     INC ram_state_link  
    JMP     loc_FAD3  ; orig: C - - - - - 0x01FADA 07:FACA: 4C D3 FA  JMP loc_FAD3
bra_FACD:  ; orig: bra_FACD:

; triggers when link sword/staff swing animation has ended
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01FADD 07:FACD: A5 AC     LDA ram_state_link
    ORI.B   #con_obj_state_10 + con_obj_state_20,D0  ; orig: C - - - - - 0x01FADF 07:FACF: 09 30     ORA #con_obj_state_1
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01FAE1 07:FAD1: 85 AC     STA ram_state_link
loc_FAD3:  ; orig: loc_FAD3:
    MOVE.B  #$01,D0  ; orig: C D 3 - - - 0x01FAE3 07:FAD3: A9 01     LDA #$01
    MOVE.B  D0,ram_link_anim_id  ; orig: C - - - - - 0x01FAE5 07:FAD5: 8D E4 03  STA ram_link_anim_id
    RTS                     ; RTS  ; orig: C - - - - - 0x01FAE8 07:FAD8: 60        RTS
bra_FAD9:  ; orig: bra_FAD9:
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01FAE9 07:FAD9: C9 30     CMP #$30
    BNE     bra_FAE3_RTS             ; BNE  ; orig: C - - - - - 0x01FAEB 07:FADB: D0 06     BNE bra_FAE3_RTS

; triggers when link sword/staff swing animation has ended
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01FAED 07:FADD: A5 AC     LDA ram_state_link
    ANDI.B  #con_obj_state_freeze + con_obj_state_80,D0  ; orig: C - - - - - 0x01FAEF 07:FADF: 29 C0     AND #con_obj_state_f
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x01FAF1 07:FAE1: 85 AC     STA ram_state_link
bra_FAE3_RTS:  ; orig: bra_FAE3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01FAF3 07:FAE3: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01FAF4 07:FAE4: FF        .byte $FF, $FF, $FF,



tbl_FAF0:  ; orig: tbl_FAF0:
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB00 07:FAF0: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB01 07:FAF1: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB02 07:FAF2: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB03 07:FAF3: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB04 07:FAF4: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB05 07:FAF5: 00        .byte con_04C0_00   
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_04  -- needs manual handling  ; orig: - D 3 - - - 0x01FB06 07:FAF6: 05        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_04  -- needs manual handling  ; orig: - D 3 - - - 0x01FB07 07:FAF7: 05        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_04  -- needs manual handling  ; orig: - D 3 - - - 0x01FB08 07:FAF8: 05        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_04  -- needs manual handling  ; orig: - D 3 - - - 0x01FB09 07:FAF9: 05        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0A 07:FAFA: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0B 07:FAFB: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0C 07:FAFC: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0D 07:FAFD: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0E 07:FAFE: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB0F 07:FAFF: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB10 07:FB00: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB11 07:FB01: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB12 07:FB02: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_40  -- needs manual handling  ; orig: - D 3 - - - 0x01FB13 07:FB03: 43        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_40  -- needs manual handling  ; orig: - D 3 - - - 0x01FB14 07:FB04: 43        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB15 07:FB05: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB16 07:FB06: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB17 07:FB07: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB18 07:FB08: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB19 07:FB09: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1A 07:FB0A: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1B 07:FB0B: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1C 07:FB0C: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1D 07:FB0D: 01        .byte con_04C0_01   
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1E 07:FB0E: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB1F 07:FB0F: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB20 07:FB10: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB21 07:FB11: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB22 07:FB12: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB23 07:FB13: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB24 07:FB14: C3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB25 07:FB15: C3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB26 07:FB16: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB27 07:FB17: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB28 07:FB18: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB29 07:FB19: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB2A 07:FB1A: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB2B 07:FB1B: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB2C 07:FB1C: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB2D 07:FB1D: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB2E 07:FB1E: 83        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB2F 07:FB1F: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB30 07:FB20: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB31 07:FB21: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB32 07:FB22: C9        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB33 07:FB23: C9        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB34 07:FB24: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB35 07:FB25: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB36 07:FB26: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_20 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB37 07:FB27: A9        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_20 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB38 07:FB28: A9        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40  -- needs manual handling  ; orig: - D 3 - - - 0x01FB39 07:FB29: 41        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3A 07:FB2A: 41        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3B 07:FB2B: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_08 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3C 07:FB2C: 89        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3D 07:FB2D: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3E 07:FB2E: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB3F 07:FB2F: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB40 07:FB30: C1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB41 07:FB31: C1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB42 07:FB32: C1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB43 07:FB33: C1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB44 07:FB34: C1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB45 07:FB35: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB46 07:FB36: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB47 07:FB37: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB48 07:FB38: A1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB49 07:FB39: A1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB4A 07:FB3A: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB4B 07:FB3B: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB4C 07:FB3C: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB4D 07:FB3D: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB4E 07:FB3E: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB4F 07:FB3F: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB50 07:FB40: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB51 07:FB41: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB52 07:FB42: E3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB53 07:FB43: E3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB54 07:FB44: E3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB55 07:FB45: E3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_02 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB56 07:FB46: E3        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB57 07:FB47: E1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB58 07:FB48: E1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB59 07:FB49: E1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB5A 07:FB4A: E1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_20 + con_04C0_40 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB5B 07:FB4B: E1        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - - - - - - 0x01FB5C 07:FB4C: 81        .byte con_04C0_01 + 
    ; [DIRECTIVE] .BYTE con_04C0_01 + con_04C0_80  -- needs manual handling  ; orig: - D 3 - - - 0x01FB5D 07:FB4D: 81        .byte con_04C0_01 + 



tbl_FB4E:  ; orig: tbl_FB4E:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 3 - - - 0x01FB5E 07:FB4E: 06        .byte $06   ; 00
    ; [DIRECTIVE] .BYTE $43  -- needs manual handling  ; orig: - D 3 - - - 0x01FB5F 07:FB4F: 43        .byte $43   ; 02
    ; [DIRECTIVE] .BYTE $25  -- needs manual handling  ; orig: - D 3 - - - 0x01FB60 07:FB50: 25        .byte $25   ; 04
    ; [DIRECTIVE] .BYTE $31  -- needs manual handling  ; orig: - D 3 - - - 0x01FB61 07:FB51: 31        .byte $31   ; 06
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 3 - - - 0x01FB62 07:FB52: 12        .byte $12   ; 08
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 3 - - - 0x01FB63 07:FB53: 24        .byte $24   ; 0A
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 3 - - - 0x01FB64 07:FB54: 81        .byte $81   ; 0C
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 3 - - - 0x01FB65 07:FB55: 14        .byte $14   ; 0E
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 3 - - - 0x01FB66 07:FB56: 22        .byte $22   ; 10
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 3 - - - 0x01FB67 07:FB57: 42        .byte $42   ; 12
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB68 07:FB58: 00        .byte $00   ; 14
    ; [DIRECTIVE] .BYTE $A9  -- needs manual handling  ; orig: - D 3 - - - 0x01FB69 07:FB59: A9        .byte $A9   ; 16
    ; [DIRECTIVE] .BYTE $8F  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6A 07:FB5A: 8F        .byte $8F   ; 18
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6B 07:FB5B: 20        .byte $20   ; 1A
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6C 07:FB5C: 00        .byte $00   ; 1C
    ; [DIRECTIVE] .BYTE $3F  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6D 07:FB5D: 3F        .byte $3F   ; 1E
    ; [DIRECTIVE] .BYTE $F9  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6E 07:FB5E: F9        .byte $F9   ; 20
    ; [DIRECTIVE] .BYTE $FA  -- needs manual handling  ; orig: - D 3 - - - 0x01FB6F 07:FB5F: FA        .byte $FA   ; 22
    ; [DIRECTIVE] .BYTE $46  -- needs manual handling  ; orig: - D 3 - - - 0x01FB70 07:FB60: 46        .byte $46   ; 24
    ; [DIRECTIVE] .BYTE $62  -- needs manual handling  ; orig: - D 3 - - - 0x01FB71 07:FB61: 62        .byte $62   ; 26
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 3 - - - 0x01FB72 07:FB62: 11        .byte $11   ; 28
    ; [DIRECTIVE] .BYTE $2F  -- needs manual handling  ; orig: - D 3 - - - 0x01FB73 07:FB63: 2F        .byte $2F   ; 2A
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01FB74 07:FB64: FF        .byte $FF   ; 2C
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01FB75 07:FB65: FF        .byte $FF   ; 2E
    ; [DIRECTIVE] .BYTE $7F  -- needs manual handling  ; orig: - D 3 - - - 0x01FB76 07:FB66: 7F        .byte $7F   ; 30
    ; [DIRECTIVE] .BYTE $F6  -- needs manual handling  ; orig: - D 3 - - - 0x01FB77 07:FB67: F6        .byte $F6   ; 32
    ; [DIRECTIVE] .BYTE $2F  -- needs manual handling  ; orig: - D 3 - - - 0x01FB78 07:FB68: 2F        .byte $2F   ; 34
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01FB79 07:FB69: FF        .byte $FF   ; 36
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7A 07:FB6A: FF        .byte $FF   ; 38
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7B 07:FB6B: 22        .byte $22   ; 3A
    ; [DIRECTIVE] .BYTE $46  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7C 07:FB6C: 46        .byte $46   ; 3C
    ; [DIRECTIVE] .BYTE $F1  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7D 07:FB6D: F1        .byte $F1   ; 3E
    ; [DIRECTIVE] .BYTE $F2  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7E 07:FB6E: F2        .byte $F2   ; 40
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 3 - - - 0x01FB7F 07:FB6F: AA        .byte $AA   ; 42
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 3 - - - 0x01FB80 07:FB70: AA        .byte $AA   ; 44
    ; [DIRECTIVE] .BYTE $FB  -- needs manual handling  ; orig: - D 3 - - - 0x01FB81 07:FB71: FB        .byte $FB   ; 46
    ; [DIRECTIVE] .BYTE $BF  -- needs manual handling  ; orig: - D 3 - - - 0x01FB82 07:FB72: BF        .byte $BF   ; 48
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 3 - - - 0x01FB83 07:FB73: F0        .byte $F0   ; 4A

; bzk bug, table keeps reading bytes below


sub_FB74:  ; orig: sub_FB74:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C D 3 - - - 0x01FB84 07:FB74: 48        PHA
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C D 3 - - - 0x01FB85 07:FB75: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C D 3 - - - 0x01FB87 07:FB77: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C D 3 - - - 0x01FB8A 07:FB7A: 68        PLA
    MOVE.B  ram_0492_enemy(D1.L),D2  ; LDY abs,X  ; orig: C D 3 - - - 0x01FB8B 07:FB7B: BC 92 04  LDY ram_0492_enemy,X
    MOVE.B  D2,ram_000F_t01_direction  ; orig: C D 3 - - - 0x01FB8E 07:FB7E: 84 0F     STY ram_000F_t01_dir
    BEQ     bra_FB9D             ; BEQ  ; orig: C D 3 - - - 0x01FB90 07:FB80: F0 1B     BEQ bra_FB9D
    ; (empty translation for LDA)  ; orig: C D 3 - - - 0x01FB92 07:FB82: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_1E,D0  ; orig: C D 3 - - - 0x01FB95 07:FB85: C9 1E     CMP #con_obj_id_1E
    BEQ     bra_FB95             ; BEQ  ; orig: C D 3 - - - 0x01FB97 07:FB87: F0 0C     BEQ bra_FB95
    CMPI.B  #con_obj_id_22,D0  ; orig: C D 3 - - - 0x01FB99 07:FB89: C9 22     CMP #con_obj_id_22
    BEQ     bra_FB95             ; BEQ  ; orig: C D 3 - - - 0x01FB9B 07:FB8B: F0 08     BEQ bra_FB95
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x01FB9D 07:FB8D: C9 53     CMP #$53
    BCS     bra_FB95             ; BCS  ; orig: C - - - - - 0x01FB9F 07:FB8F: B0 04     BCS bra_FB95
    MOVE.B  #$07,D0  ; orig: C - - - - - 0x01FBA1 07:FB91: A9 07     LDA #$07
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FBA3 07:FB93: 95 28     STA ram_timer_enemy,
bra_FB95:  ; orig: bra_FB95:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FBA5 07:FB95: A9 00     LDA #$00
    MOVE.B  D0,ram_0492_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FBA7 07:FB97: 9D 92 04  STA ram_0492_enemy,X
    JMP     loc_FCDA  ; orig: C - - - - - 0x01FBAA 07:FB9A: 4C DA FC  JMP loc_FCDA
bra_FB9D:  ; orig: bra_FB9D:
    MOVE.B  ram_0405_enemy(D1.L),D2  ; LDY abs,X  ; orig: C - - - - - 0x01FBAD 07:FB9D: BC 05 04  LDY ram_0405_enemy,X
    BEQ     bra_FBA5             ; BEQ  ; orig: C - - - - - 0x01FBB0 07:FBA0: F0 03     BEQ bra_FBA5
    JMP     loc_FC88  ; orig: C - - - - - 0x01FBB2 07:FBA2: 4C 88 FC  JMP loc_FC88
bra_FBA5:  ; orig: bra_FBA5:
    CMPI.B  #$6A,D0  ; orig: C - - - - - 0x01FBB5 07:FBA5: C9 6A     CMP #$6A
    BCC     bra_FBB1             ; BCC  ; orig: C - - - - - 0x01FBB7 07:FBA7: 90 08     BCC bra_FBB1

; 6A+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01FBB9 07:FBA9: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FBBB 07:FBAB: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x0046EB  ; orig: C - - - - - 0x01FBBE 07:FBAE: 4C DB 86  JMP loc_0x0046EB
bra_FBB1:
; ram_obj_id_enemy - $01,X
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01FBC1 07:FBB1: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_004_FC94_00_RTS
    DC.L    ofs_004_0x0107DC_01
    DC.L    ofs_004_0x0107DC_02
    DC.L    ofs_004_0x0107CF_03
    DC.L    ofs_004_0x0107CF_04
    DC.L    ofs_004_0x010129_05
    DC.L    ofs_004_0x010129_06
    DC.L    ofs_004_0x010C0F_07
    DC.L    ofs_004_0x010C0F_08
    DC.L    ofs_004_0x010C0F_09
    DC.L    ofs_004_0x010C0F_0A
    DC.L    ofs_004_0x011B5B_0B
    DC.L    ofs_004_0x011B5B_0C
    DC.L    ofs_004_0x010908_0D
    DC.L    ofs_004_0x010908_0E
    DC.L    ofs_004_0x010A75_0F
    DC.L    ofs_004_0x010B19_10
    DC.L    ofs_004_0x0107A8_11
    DC.L    ofs_004_0x011D67_12
    DC.L    ofs_004_0x0104DB_13
    DC.L    ofs_004_0x010578_14
    DC.L    ofs_004_0x010578_15
    DC.L    ofs_004_0x011BB2_16
    DC.L    ofs_004_0x011CD9_17
    DC.L    ofs_004_0x011600_18
    DC.L    ofs_004_FC94_19_RTS
    DC.L    ofs_004_0x011038_1A
    DC.L    ofs_004_0x010491_1B
    DC.L    ofs_004_0x010491_1C
    DC.L    ofs_004_0x010491_1D
    DC.L    ofs_004_0x010D60_1E
    DC.L    ofs_004_0x010896_1F
    DC.L    ofs_004_0x010908_20
    DC.L    ofs_004_0x010C7B_21
    DC.L    ofs_004_0x010FFF_22
    DC.L    ofs_004_0x011DF3_23
    DC.L    ofs_004_0x011FB9_24
    DC.L    ofs_004_0x012BEA_25
    DC.L    ofs_004_0x012BEA_26
    DC.L    ofs_004_0x0110F4_27
    DC.L    ofs_004_0x0112E6_28
    DC.L    ofs_004_FC94_29_RTS
    DC.L    ofs_004_0x011387_2A
    DC.L    ofs_004_0x01044E_2B
    DC.L    ofs_004_0x01044E_2C
    DC.L    ofs_004_0x01044E_2D
    DC.L    ofs_004_FE40_2E
    DC.L    ofs_004_0x010DA0_2F
    DC.L    ofs_004_0x011B46_30
    DC.L    ofs_004_0x0118B9_31
    DC.L    ofs_004_0x0118B9_32
    DC.L    ofs_004_0x012326_33
    DC.L    ofs_004_0x012326_34
    DC.L    ofs_004_FE50_35
    DC.L    ofs_004_FE90_36
    DC.L    ofs_004_0x012997_37
    DC.L    ofs_004_0x011600_38
    DC.L    ofs_004_0x011600_39
    DC.L    ofs_004_0x0129FB_3A
    DC.L    ofs_004_0x0129FB_3B
    DC.L    ofs_004_0x012197_3C
    DC.L    ofs_004_0x011796_3D
    DC.L    ofs_004_0x012C8D_3E
    DC.L    ofs_004_0x0129E8_3F
    DC.L    ofs_004_0x01005F_40
    DC.L    ofs_004_0x0114A8_41
    DC.L    ofs_004_0x0124EE_42
    DC.L    ofs_004_0x0124EE_43
    DC.L    ofs_004_0x0124EE_44
    DC.L    ofs_004_0x0124EE_45
    DC.L    ofs_004_0x012487_46
    DC.L    ofs_004_0x012B76_47
    DC.L    ofs_004_0x012B76_48
    DC.L    ofs_004_FE60_49
    DC.L    ofs_004_FE60_4A
    DC.L    ofs_004_FE80_4B
    DC.L    ofs_004_FE80_4C
    DC.L    ofs_004_FE80_4D
    DC.L    ofs_004_FE80_4E
    DC.L    ofs_004_FE80_4F
    DC.L    ofs_004_FE80_50
    DC.L    ofs_004_FE88_51
    DC.L    ofs_004_FE80_52
    DC.L    ofs_004_0x0102E7_53
    DC.L    ofs_004_0x0102E7_54
    DC.L    ofs_004_0x0103A9_55
    DC.L    ofs_004_0x0103A9_56
    DC.L    ofs_004_0x0102E7_57
    DC.L    ofs_004_0x0102E7_58
    DC.L    ofs_004_0x0102E7_59
    DC.L    ofs_004_0x0102E7_5A
    DC.L    ofs_004_0x01084F_5B
    DC.L    ofs_004_F519_5C
    DC.L    ofs_004_FEA6_5D
    DC.L    ofs_004_FEF4_5E
    DC.L    ofs_004_FC94_5F_RTS
    DC.L    ofs_004_0x01310C_60
    DC.L    ofs_004_0x010F86_61
    DC.L    ofs_004_0x010E54_62
    DC.L    ofs_004_0x010EFB_63_breakable_wall
    DC.L    ofs_004_0x010F1E_64
    DC.L    ofs_004_0x010E54_65
    DC.L    ofs_004_0x010E54_66
    DC.L    ofs_004_0x010EFB_67
    DC.L    ofs_004_0x010207_68
    DC.L    ofs_004_FC94_69_RTS



loc_FC88:  ; orig: loc_FC88:
    BSR     sub_FA0C             ; JSR -> BSR  ; orig: C D 3 - - - 0x01FC98 07:FC88: 20 0C FA  JSR sub_FA0C
    MOVE.B  ram_0405_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FC9B 07:FC8B: BD 05 04  LDA ram_0405_enemy,X
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01FC9E 07:FC8E: 29 0F     AND #$0F
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01FCA0 07:FC90: C9 04     CMP #$04
    BCS     bra_FC95             ; BCS  ; orig: C - - - - - 0x01FCA2 07:FC92: B0 01     BCS bra_FC95
ofs_004_FC94_00_RTS:  ; orig: ofs_004_FC94_00_RTS:

; con_obj_id_null
ofs_004_FC94_19_RTS:  ; orig: ofs_004_FC94_19_RTS:

; con_obj_id_19
ofs_004_FC94_29_RTS:  ; orig: ofs_004_FC94_29_RTS:

; con_obj_id_29
ofs_004_FC94_5F_RTS:  ; orig: ofs_004_FC94_5F_RTS:

; con_obj_id_5F
ofs_004_FC94_69_RTS:  ; orig: ofs_004_FC94_69_RTS:

; con_obj_id_69
ofs_005_FC94_00_RTS:  ; orig: ofs_005_FC94_00_RTS:

; con_obj_id_null
ofs_005_FC94_18_RTS:  ; orig: ofs_005_FC94_18_RTS:

; con_obj_id_18
ofs_005_FC94_19_RTS:  ; orig: ofs_005_FC94_19_RTS:

; con_obj_id_19
ofs_005_FC94_29_RTS:  ; orig: ofs_005_FC94_29_RTS:

; con_obj_id_29
ofs_005_FC94_2E_RTS:  ; orig: ofs_005_FC94_2E_RTS:

; con_obj_id_2E
ofs_005_FC94_3F_RTS:  ; orig: ofs_005_FC94_3F_RTS:

; con_obj_id_3F
ofs_005_FC94_40_RTS:  ; orig: ofs_005_FC94_40_RTS:

; con_obj_id_40
    RTS                     ; RTS  ; orig: C - - J - - 0x01FCA4 07:FC94: 60        RTS
bra_FC95:  ; orig: bra_FC95:
    MOVE.B  ram_0405_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FCA5 07:FC95: BD 05 04  LDA ram_0405_enemy,X
    ANDI.B  #$10,D0  ; orig: C - - - - - 0x01FCA8 07:FC98: 29 10     AND #$10
    BEQ     bra_FCD7_not_dead             ; BEQ  ; orig: C - - - - - 0x01FCAA 07:FC9A: F0 3B     BEQ bra_FCD7_not_dea
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FCAC 07:FC9C: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  D0,ram_0412(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FCAF 07:FC9F: 9D 12 04  STA ram_0412,X
    CMPI.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x01FCB2 07:FCA2: C9 5D     CMP #con_obj_id_5D
    BEQ     bra_FCC7             ; BEQ  ; orig: C - - - - - 0x01FCB4 07:FCA4: F0 21     BEQ bra_FCC7
    CMPI.B  #con_obj_id_14,D0  ; orig: C - - - - - 0x01FCB6 07:FCA6: C9 14     CMP #con_obj_id_14
    BEQ     bra_FCC7             ; BEQ  ; orig: C - - - - - 0x01FCB8 07:FCA8: F0 1D     BEQ bra_FCC7
    CMPI.B  #con_obj_id_1C,D0  ; orig: C - - - - - 0x01FCBA 07:FCAA: C9 1C     CMP #con_obj_id_1C
    BEQ     bra_FCC7             ; BEQ  ; orig: C - - - - - 0x01FCBC 07:FCAC: F0 19     BEQ bra_FCC7
    MOVE.B  ram_052A,D0  ; orig: C - - - - - 0x01FCBE 07:FCAE: AD 2A 05  LDA ram_052A
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01FCC1 07:FCB1: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01FCC2 07:FCB2: 69 01     ADC #$01
    CMPI.B  #$0A,D0  ; orig: C - - - - - 0x01FCC4 07:FCB4: C9 0A     CMP #$0A
    BNE     bra_FCBA             ; BNE  ; orig: C - - - - - 0x01FCC6 07:FCB6: D0 02     BNE bra_FCBA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FCC8 07:FCB8: A9 00     LDA #$00
bra_FCBA:  ; orig: bra_FCBA:
    MOVE.B  D0,ram_052A  ; orig: C - - - - - 0x01FCCA 07:FCBA: 8D 2A 05  STA ram_052A
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FCCD 07:FCBD: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_11,D0  ; orig: C - - - - - 0x01FCD0 07:FCC0: C9 11     CMP #con_obj_id_11
    BEQ     bra_FCC7             ; BEQ  ; orig: C - - - - - 0x01FCD2 07:FCC2: F0 03     BEQ bra_FCC7
    ADDQ.B  #1,ram_room_kill_cnt  ; orig: C - - - - - 0x01FCD4 07:FCC4: EE 4F 03  INC ram_room_kill_cn
bra_FCC7:  ; orig: bra_FCC7:
    MOVE.B  #con_obj_id_60,D0  ; orig: C - - - - - 0x01FCD7 07:FCC7: A9 60     LDA #con_obj_id_60
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FCD9 07:FCC9: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,ram_0492_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FCDC 07:FCCC: 9D 92 04  STA ram_0492_enemy,X
    MOVE.B  #con_04C0_01 + con_04C0_80,D0  ; orig: C - - - - - 0x01FCDF 07:FCCF: A9 81     LDA #con_04C0_01 + c
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FCE1 07:FCD1: 9D BF 04  STA ram_attr_enemy -
    BSR     sub_0x01307A_drop_selection             ; JSR -> BSR  ; orig: C - - - - - 0x01FCE4 07:FCD4: 20 6A B0  JSR sub_0x01307A_dro
bra_FCD7_not_dead:  ; orig: bra_FCD7_not_dead:
    JMP     loc_FEDA  ; orig: C - - - - - 0x01FCE7 07:FCD7: 4C DA FE  JMP loc_FEDA



loc_FCDA:  ; orig: loc_FCDA:
    MOVE.B  ram_obj_index,D1  ; orig: C D 3 - - - 0x01FCEA 07:FCDA: AE 40 03  LDX ram_obj_index
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01FCED 07:FCDD: A5 10     LDA ram_dungeon_leve
    BNE     bra_FD3C             ; BNE  ; orig: C - - - - - 0x01FCEF 07:FCDF: D0 5B     BNE bra_FD3C    ; if

; if overworld
    MOVE.B  ram_04CD_map_data_byte,D0  ; orig: C - - - - - 0x01FCF1 07:FCE1: AD CD 04  LDA ram_04CD_map_dat
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x01FCF4 07:FCE4: 29 08     AND #$08
    BEQ     bra_FD3C             ; BEQ  ; orig: C - - - - - 0x01FCF6 07:FCE6: F0 54     BEQ bra_FD3C
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FCF8 07:FCE8: BD 4F 03  LDA ram_obj_id_enemy
    CMPI.B  #con_obj_id_11,D0  ; orig: C - - - - - 0x01FCFB 07:FCEB: C9 11     CMP #con_obj_id_11
    BEQ     bra_FD3C             ; BEQ  ; orig: C - - - - - 0x01FCFD 07:FCED: F0 4D     BEQ bra_FD3C
    CMPI.B  #con_obj_id_40,D0  ; orig: C - - - - - 0x01FCFF 07:FCEF: C9 40     CMP #con_obj_id_40
    BEQ     bra_FD3C             ; BEQ  ; orig: C - - - - - 0x01FD01 07:FCF1: F0 49     BEQ bra_FD3C
    CMPI.B  #con_obj_id_1E,D0  ; orig: C - - - - - 0x01FD03 07:FCF3: C9 1E     CMP #con_obj_id_1E
    BEQ     bra_FD3C             ; BEQ  ; orig: C - - - - - 0x01FD05 07:FCF5: F0 45     BEQ bra_FD3C
    CMPI.B  #con_obj_id_2E,D0  ; orig: C - - - - - 0x01FD07 07:FCF7: C9 2E     CMP #con_obj_id_2E
    BEQ     bra_FD3C             ; BEQ  ; orig: C - - - - - 0x01FD09 07:FCF9: F0 41     BEQ bra_FD3C
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x01FD0B 07:FCFB: C9 53     CMP #$53
    BCS     bra_FD3C             ; BCS  ; orig: C - - - - - 0x01FD0D 07:FCFD: B0 3D     BCS bra_FD3C
bra_FCFF_loop:  ; orig: bra_FCFF_loop:
    MOVE.B  ram_random_2,D0  ; orig: C - - - - - 0x01FD0F 07:FCFF: A5 4B     LDA ram_random_2
    BEQ     bra_FD07             ; BEQ  ; orig: C - - - - - 0x01FD11 07:FD01: F0 04     BEQ bra_FD07
    MOVE.B  D0,ram_0492_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FD13 07:FD03: 9D 92 04  STA ram_0492_enemy,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01FD16 07:FD06: 60        RTS
bra_FD07:  ; orig: bra_FD07:
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01FD17 07:FD07: AE 40 03  LDX ram_obj_index
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01FD1A 07:FD0A: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FD1C 07:FD0C: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x015034             ; JSR -> BSR  ; orig: C - - - - - 0x01FD1F 07:FD0F: 20 24 90  JSR sub_0x015034
    MOVE.B  ram_0525,D0  ; orig: C - - - - - 0x01FD22 07:FD12: AD 25 05  LDA ram_0525
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01FD25 07:FD15: 48        PHA

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01FD26 07:FD16: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01FD27 07:FD17: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01FD28 07:FD18: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01FD29 07:FD19: 0A        ASL
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FD2A 07:FD1A: 95 70     STA ram_pos_X_enemy,
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01FD2C 07:FD1C: 68        PLA
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01FD2D 07:FD1D: 29 F0     AND #$F0
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01FD2F 07:FD1F: 38        SEC
    SUBX.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x01FD30 07:FD20: E9 03     SBC #$03
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FD32 07:FD22: 95 84     STA ram_pos_Y_enemy,
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FD34 07:FD24: B5 19     LDA ram_indiv_random
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01FD36 07:FD26: 29 03     AND #$03
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01FD38 07:FD28: 18        CLC
    ADDX.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01FD39 07:FD29: 69 02     ADC #$02
    MOVE.B  D0,ram_random_2  ; orig: C - - - - - 0x01FD3B 07:FD2B: 85 4B     STA ram_random_2
    MOVE.B  #con_prg_bank + $05,D0  ; orig: C - - - - - 0x01FD3D 07:FD2D: A9 05     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FD3F 07:FD2F: 20 AC FF  JSR sub_FFAC_prg_ban
    BSR     sub_0x014A23             ; JSR -> BSR  ; orig: C - - - - - 0x01FD42 07:FD32: 20 13 8A  JSR sub_0x014A23
    BCS     bra_FCFF_loop             ; BCS  ; orig: C - - - - - 0x01FD45 07:FD35: B0 C8     BCS bra_FCFF_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FD47 07:FD37: A9 00     LDA #$00
    MOVE.B  D0,ram_0405_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FD49 07:FD39: 9D 05 04  STA ram_0405_enemy,X
bra_FD3C:  ; orig: bra_FD3C:
    MOVE.B  #con_prg_bank + $04,D0  ; orig: C - - - - - 0x01FD4C 07:FD3C: A9 04     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FD4E 07:FD3E: 20 AC FF  JSR sub_FFAC_prg_ban
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01FD51 07:FD41: AE 40 03  LDX ram_obj_index
    ; (empty translation for LDY)  ; orig: C - - - - - 0x01FD54 07:FD44: BC 4F 03  LDY ram_obj_id_enemy
    CMPI.B  #con_obj_id_1E,D2  ; orig: C - - - - - 0x01FD57 07:FD47: C0 1E     CPY #con_obj_id_1E
    BEQ     bra_FD56             ; BEQ  ; orig: C - - - - - 0x01FD59 07:FD49: F0 0B     BEQ bra_FD56
    CMPI.B  #con_obj_id_22,D2  ; orig: C - - - - - 0x01FD5B 07:FD4B: C0 22     CPY #con_obj_id_22
    BEQ     bra_FD56             ; BEQ  ; orig: C - - - - - 0x01FD5D 07:FD4D: F0 07     BEQ bra_FD56
    CMPI.B  #$53,D2  ; orig: C - - - - - 0x01FD5F 07:FD4F: C0 53     CPY #$53
    BCS     bra_FD56             ; BCS  ; orig: C - - - - - 0x01FD61 07:FD51: B0 03     BCS bra_FD56
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01FD63 07:FD53: 8A        TXA
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FD64 07:FD54: 95 28     STA ram_timer_enemy,
bra_FD56:  ; orig: bra_FD56:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FD66 07:FD56: B9 EF FA  LDA tbl_FAF0 - $01,Y
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FD69 07:FD59: 9D BF 04  STA ram_attr_enemy -
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01FD6C 07:FD5C: 98        TYA
    MOVE.B  D0,ram_0000_t2B_obj_id  ; orig: C - - - - - 0x01FD6D 07:FD5D: 85 00     STA ram_0000_t2B_obj
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FD6F 07:FD5F: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01FD70 07:FD60: A8        TAY
    MOVE.B  tbl_FB4E(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01FD71 07:FD61: B9 4E FB  LDA tbl_FB4E,Y
    BSR     sub_0x013010             ; JSR -> BSR  ; orig: C - - - - - 0x01FD74 07:FD64: 20 00 B0  JSR sub_0x013010
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FD77 07:FD67: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  ram_0000_t2B_obj_id,D0  ; orig: C - - - - - 0x01FD7A 07:FD6A: A5 00     LDA ram_0000_t2B_obj
    CMPI.B  #$6A,D0  ; orig: C - - - - - 0x01FD7C 07:FD6C: C9 6A     CMP #$6A
    BCC     bra_FD78             ; BCC  ; orig: C - - - - - 0x01FD7E 07:FD6E: 90 08     BCC bra_FD78
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - - - - 0x01FD80 07:FD70: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FD82 07:FD72: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x0045E0_old_man_handler  ; orig: C - - - - - 0x01FD85 07:FD75: 4C D0 85  JMP loc_0x0045E0_old
bra_FD78:  ; orig: bra_FD78:
    CMPI.B  #$5F,D0  ; orig: C - - - - - 0x01FD88 07:FD78: C9 5F     CMP #$5F
    BCC     bra_FD7F             ; BCC  ; orig: C - - - - - 0x01FD8A 07:FD7A: 90 03     BCC bra_FD7F
    JMP     loc_FECA  ; orig: C - - - - - 0x01FD8C 07:FD7C: 4C CA FE  JMP loc_FECA
bra_FD7F:
; ram_obj_id_enemy - $01,X
    BSR     sub_E5E2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01FD8F 07:FD7F: 20 E2 E5  JSR sub_E5E2_jump_to
    DC.L    ofs_005_FC94_00_RTS
    DC.L    ofs_005_0x010035_01
    DC.L    ofs_005_0x010035_02
    DC.L    ofs_005_0x010035_03
    DC.L    ofs_005_0x010035_04
    DC.L    ofs_005_0x010035_05
    DC.L    ofs_005_0x010035_06
    DC.L    ofs_005_0x010765_07
    DC.L    ofs_005_0x010769_08
    DC.L    ofs_005_0x010765_09
    DC.L    ofs_005_0x010769_0A
    DC.L    ofs_005_0x011B30_0B
    DC.L    ofs_005_0x011B30_0C
    DC.L    ofs_005_0x01074F_0D
    DC.L    ofs_005_0x01074F_0E
    DC.L    ofs_005_0x01075E_0F
    DC.L    ofs_005_0x01075E_10
    DC.L    ofs_005_FED6_11
    DC.L    ofs_005_0x010035_12
    DC.L    ofs_005_0x010035_13
    DC.L    ofs_005_0x010035_14
    DC.L    ofs_005_0x010571_15
    DC.L    ofs_005_0x010035_16
    DC.L    ofs_005_0x010035_17
    DC.L    ofs_005_FC94_18_RTS
    DC.L    ofs_005_FC94_19_RTS
    DC.L    ofs_005_0x010785_1A
    DC.L    ofs_005_0x01042D_1B
    DC.L    ofs_005_0x010445_1C
    DC.L    ofs_005_0x010445_1D
    DC.L    ofs_005_0x010CD0_1E
    DC.L    ofs_005_0x010747_1F
    DC.L    ofs_005_0x01074C_20
    DC.L    ofs_005_0x010765_21
    DC.L    ofs_005_0x010CD0_22
    DC.L    ofs_005_FED6_23
    DC.L    ofs_005_FED6_24
    DC.L    ofs_005_FED6_25
    DC.L    ofs_005_FED6_26
    DC.L    ofs_005_FED6_27
    DC.L    ofs_005_0x0112D2_28
    DC.L    ofs_005_FC94_29_RTS
    DC.L    ofs_005_0x010035_2A
    DC.L    ofs_005_0x010425_2B
    DC.L    ofs_005_0x010425_2C
    DC.L    ofs_005_0x010425_2D
    DC.L    ofs_005_FC94_2E_RTS
    DC.L    ofs_005_0x01079A_2F
    DC.L    ofs_005_0x010035_30
    DC.L    ofs_005_0x011497_31
    DC.L    ofs_005_0x011497_32
    DC.L    ofs_005_0x012171_33
    DC.L    ofs_005_0x012171_34
    DC.L    ofs_005_FE48_35
    DC.L    ofs_005_FE78_36
    DC.L    ofs_005_0x0128DA_37
    DC.L    ofs_005_0x01146A_38
    DC.L    ofs_005_0x011489_39
    DC.L    ofs_005_0x0128F4_3A
    DC.L    ofs_005_0x0128F4_3B
    DC.L    ofs_005_0x01211C_3C
    DC.L    ofs_005_0x011457_3D
    DC.L    ofs_005_0x01297F_3E
    DC.L    ofs_005_FC94_3F_RTS
    DC.L    ofs_005_FC94_40_RTS
    DC.L    ofs_005_0x0113F2_41
    DC.L    ofs_005_0x01209D_42
    DC.L    ofs_005_0x01209D_43
    DC.L    ofs_005_0x01209D_44
    DC.L    ofs_005_0x01209D_45
    DC.L    ofs_005_0x012189_46
    DC.L    ofs_005_0x01293E_47
    DC.L    ofs_005_0x01293E_48
    DC.L    ofs_005_FE58_49
    DC.L    ofs_005_FE58_4A
    DC.L    ofs_005_FE68_4B
    DC.L    ofs_005_FE68_4C
    DC.L    ofs_005_FE68_4D
    DC.L    ofs_005_FE68_4E
    DC.L    ofs_005_FE68_4F
    DC.L    ofs_005_FE68_50
    DC.L    ofs_005_FE70_51
    DC.L    ofs_005_FE68_52
    DC.L    ofs_005_0x010025_53
    DC.L    ofs_005_0x010029_54
    DC.L    ofs_005_0x010025_55
    DC.L    ofs_005_0x010025_56
    DC.L    ofs_005_0x010025_57
    DC.L    ofs_005_0x010025_58
    DC.L    ofs_005_0x010025_59
    DC.L    ofs_005_0x010025_5A
    DC.L    ofs_005_FEDA_5A
    DC.L    ofs_005_FEDA_5B
    DC.L    ofs_005_FEA6_5C
    DC.L    ofs_005_FED1_5D



ofs_004_FE40_2E:  ; orig: ofs_004_FE40_2E:

; con_obj_id_2E

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE50 07:FE40: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE52 07:FE42: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x006028  ; orig: C - - - - - 0x01FE55 07:FE45: 4C 18 A0  JMP loc_0x006028



ofs_005_FE48_35:  ; orig: ofs_005_FE48_35:

; con_obj_id_35
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE58 07:FE48: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE5A 07:FE4A: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x0062F2  ; orig: C - - - - - 0x01FE5D 07:FE4D: 4C E2 A2  JMP loc_0x0062F2



ofs_004_FE50_35:  ; orig: ofs_004_FE50_35:

; con_obj_id_35

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE60 07:FE50: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE62 07:FE52: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x0063FE  ; orig: C - - - - - 0x01FE65 07:FE55: 4C EE A3  JMP loc_0x0063FE



ofs_005_FE58_49:  ; orig: ofs_005_FE58_49:

; con_obj_id_49
ofs_005_FE58_4A:  ; orig: ofs_005_FE58_4A:

; con_obj_id_4A
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE68 07:FE58: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE6A 07:FE5A: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x00632A  ; orig: C - - - - - 0x01FE6D 07:FE5D: 4C 1A A3  JMP loc_0x00632A



ofs_004_FE60_49:  ; orig: ofs_004_FE60_49:

; con_obj_id_49
ofs_004_FE60_4A:  ; orig: ofs_004_FE60_4A:

; con_obj_id_4A

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE70 07:FE60: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE72 07:FE62: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x00635A  ; orig: C - - - - - 0x01FE75 07:FE65: 4C 4A A3  JMP loc_0x00635A



ofs_005_FE68_4B:  ; orig: ofs_005_FE68_4B:

; con_obj_id_4B
ofs_005_FE68_4C:  ; orig: ofs_005_FE68_4C:

; con_obj_id_4C
ofs_005_FE68_4D:  ; orig: ofs_005_FE68_4D:

; con_obj_id_4D
ofs_005_FE68_4E:  ; orig: ofs_005_FE68_4E:

; con_obj_id_4E
ofs_005_FE68_4F:  ; orig: ofs_005_FE68_4F:

; con_obj_id_4F
ofs_005_FE68_50:  ; orig: ofs_005_FE68_50:

; con_obj_id_50
ofs_005_FE68_52:  ; orig: ofs_005_FE68_52:

; con_obj_id_52
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE78 07:FE68: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE7A 07:FE6A: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004A0C  ; orig: C - - - - - 0x01FE7D 07:FE6D: 4C FC 89  JMP loc_0x004A0C



ofs_005_FE70_51:  ; orig: ofs_005_FE70_51:

; con_obj_id_51
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE80 07:FE70: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE82 07:FE72: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004A50  ; orig: C - - - - - 0x01FE85 07:FE75: 4C 40 8A  JMP loc_0x004A50



ofs_005_FE78_36:  ; orig: ofs_005_FE78_36:

; con_obj_id_36
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE88 07:FE78: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE8A 07:FE7A: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004AC4  ; orig: C - - - - - 0x01FE8D 07:FE7D: 4C B4 8A  JMP loc_0x004AC4



ofs_004_FE80_4B:  ; orig: ofs_004_FE80_4B:

; con_obj_id_4B
ofs_004_FE80_4C:  ; orig: ofs_004_FE80_4C:

; con_obj_id_4C
ofs_004_FE80_4D:  ; orig: ofs_004_FE80_4D:

; con_obj_id_4D
ofs_004_FE80_4E:  ; orig: ofs_004_FE80_4E:

; con_obj_id_4E
ofs_004_FE80_4F:  ; orig: ofs_004_FE80_4F:

; con_obj_id_4F
ofs_004_FE80_50:  ; orig: ofs_004_FE80_50:

; con_obj_id_50
ofs_004_FE80_52:  ; orig: ofs_004_FE80_52:

; con_obj_id_52

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE90 07:FE80: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE92 07:FE82: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004AE9  ; orig: C - - - - - 0x01FE95 07:FE85: 4C D9 8A  JMP loc_0x004AE9



ofs_004_FE88_51:  ; orig: ofs_004_FE88_51:

; con_obj_id_51

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FE98 07:FE88: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FE9A 07:FE8A: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004BB6  ; orig: C - - - - - 0x01FE9D 07:FE8D: 4C A6 8B  JMP loc_0x004BB6



ofs_004_FE90_36:  ; orig: ofs_004_FE90_36:

; con_obj_id_36

; X = 01+
    MOVE.B  #con_prg_bank + $01,D0  ; orig: C - - J - - 0x01FEA0 07:FE90: A9 01     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FEA2 07:FE92: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_0x004C6A  ; orig: C - - - - - 0x01FEA5 07:FE95: 4C 5A 8C  JMP loc_0x004C6A



sub_FE98_decrease_invincibility_timer:  ; orig: sub_FE98_decrease_invincibility_timer:
sub_0x01FEA8_decrease_invincibility_timer:  ; orig: sub_0x01FEA8_decrease_invincibility_timer:
    MOVE.B  ram_invinc_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01FEA8 07:FE98: BD F0 04  LDA ram_invinc_enemy
    BEQ     bra_FEA5_RTS             ; BEQ  ; orig: C - - - - - 0x01FEAB 07:FE9B: F0 08     BEQ bra_FEA5_RTS
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01FEAD 07:FE9D: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FEAF 07:FE9F: 4A        LSR
    BCS     bra_FEA5_RTS             ; BCS  ; orig: C - - - - - 0x01FEB0 07:FEA0: B0 03     BCS bra_FEA5_RTS
    ; (empty translation for DEC)  ; orig: C - - - - - 0x01FEB2 07:FEA2: DE F0 04  DEC ram_invinc_enemy
bra_FEA5_RTS:  ; orig: bra_FEA5_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01FEB5 07:FEA5: 60        RTS



ofs_004_FEA6_5D:  ; orig: ofs_004_FEA6_5D:

; con_obj_id_5D
ofs_005_FEA6_5C:  ; orig: ofs_005_FEA6_5C:

; con_obj_id_5C

; X = 01+
sub_0x01FEB6:  ; orig: sub_0x01FEB6:
    MOVE.B  #con_sfx_2_enemy_killed,D0  ; orig: C - - - - - 0x01FEB6 07:FEA6: A9 20     LDA #con_sfx_2_enemy
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x01FEB8 07:FEA8: 8D 02 06  STA ram_sfx_2
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01FEBB 07:FEAB: A9 10     LDA #$10
    MOVE.B  D0,ram_0405_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FEBD 07:FEAD: 9D 05 04  STA ram_0405_enemy,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01FEC0 07:FEB0: 60        RTS



sub_0x01FEC1_destroy_object:  ; orig: sub_0x01FEC1_destroy_object:
loc_0x01FEC1_destroy_object:  ; orig: loc_0x01FEC1_destroy_object:
    MOVE.B  #con_obj_id_null,D0  ; orig: C D 3 - - - 0x01FEC1 07:FEB1: A9 00     LDA #con_obj_id_null
sub_0x01FEC3_create_object:  ; orig: sub_0x01FEC3_create_object:
loc_0x01FEC3_create_object:  ; orig: loc_0x01FEC3_create_object:

; bzk optimize, transfer all this to SRAM (or here isntead)
    ; (empty translation for STA)  ; orig: C D 3 - - - 0x01FEC3 07:FEB3: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FEC6 07:FEB6: A9 00     LDA #$00
    JMP     loc_bat_71A5_reset_obj_stats  ; orig: C - - - - - 0x01FEC8 07:FEB8: 4C A5 71  JMP loc_bat_71A5_res



sub_FEBB_search_for_free_object:  ; orig: sub_FEBB_search_for_free_object:
sub_0x01FECB_search_for_free_object:  ; orig: sub_0x01FECB_search_for_free_object:
    MOVE.B  #$0C,D2  ; orig: C - - - - - 0x01FECB 07:FEBB: A0 0C     LDY #$0C
bra_FEBD_loop:  ; orig: bra_FEBD_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01FECD 07:FEBD: 88        DEY

; bzk optimize, branch to 0x01FED9
    BEQ     bra_FEC7             ; BEQ  ; orig: C - - - - - 0x01FECE 07:FEBE: F0 07     BEQ bra_FEC7
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01FED0 07:FEC0: B9 4F 03  LDA ram_obj_id_enemy
    BNE     bra_FEBD_loop             ; BNE  ; orig: C - - - - - 0x01FED3 07:FEC3: D0 F8     BNE bra_FEBD_loop
    MOVE.B  D2,ram_free_obj_index  ; orig: C - - - - - 0x01FED5 07:FEC5: 84 59     STY ram_free_obj_ind
bra_FEC7:  ; orig: bra_FEC7:
    CMPI.B  #$00,D2  ; orig: C - - - - - 0x01FED7 07:FEC7: C0 00     CPY #$00
    RTS                     ; RTS  ; orig: C - - - - - 0x01FED9 07:FEC9: 60        RTS



loc_FECA:  ; orig: loc_FECA:

; X = 01+
    MOVE.B  #con_04C0_01 + con_04C0_80,D0  ; orig: C D 3 - - - 0x01FEDA 07:FECA: A9 81     LDA #con_04C0_01 + c
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FEDC 07:FECC: 9D BF 04  STA ram_attr_enemy -
    BNE     bra_FED6             ; BNE  ; orig: C - - - - - 0x01FEDF 07:FECF: D0 05     BNE bra_FED6    ; jm



ofs_005_FED1_5D:  ; orig: ofs_005_FED1_5D:

; con_obj_id_5D
    MOVE.B  #$01,D0  ; orig: C - - J - - 0x01FEE1 07:FED1: A9 01     LDA #$01
    MOVE.B  D0,ram_051A  ; orig: C - - - - - 0x01FEE3 07:FED3: 8D 1A 05  STA ram_051A
bra_FED6:  ; orig: bra_FED6:
ofs_005_FED6_11:  ; orig: ofs_005_FED6_11:

; con_obj_id_11
ofs_005_FED6_23:  ; orig: ofs_005_FED6_23:

; con_obj_id_23
ofs_005_FED6_24:  ; orig: ofs_005_FED6_24:

; con_obj_id_24
ofs_005_FED6_25:  ; orig: ofs_005_FED6_25:

; con_obj_id_25
ofs_005_FED6_26:  ; orig: ofs_005_FED6_26:

; con_obj_id_26
ofs_005_FED6_27:  ; orig: ofs_005_FED6_27:

; con_obj_id_27
sub_0x01FEE6:  ; orig: sub_0x01FEE6:
loc_0x01FEE6:  ; orig: loc_0x01FEE6:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01FEE6 07:FED6: A9 00     LDA #$00
    MOVE.B  D0,ram_timer_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FEE8 07:FED8: 95 28     STA ram_timer_enemy,
loc_FEDA:  ; orig: loc_FEDA:
ofs_005_FEDA_5A:  ; orig: ofs_005_FEDA_5A:

; con_obj_id_5A
ofs_005_FEDA_5B:  ; orig: ofs_005_FEDA_5B:

; con_obj_id_5B
sub_0x01FEEA:  ; orig: sub_0x01FEEA:
loc_0x01FEEA:  ; orig: loc_0x01FEEA:
    MOVE.B  #$00,D0  ; orig: C D 3 - - - 0x01FEEA 07:FEDA: A9 00     LDA #$00
    MOVE.B  D0,ram_0405_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FEEC 07:FEDC: 9D 05 04  STA ram_0405_enemy,X
    RTS                     ; RTS  ; orig: C - - - - - 0x01FEEF 07:FEDF: 60        RTS



tbl_FEE0_bg_palette:  ; orig: tbl_FEE0_bg_palette:

; 4th color will be overwritten with a color from 0x01FEF8
    ; !! UNKNOWN: .DBYT $3F0C  ; orig: - D 3 - - - 0x01FEF0 07:FEE0: 3F 0C     .dbyt $3F0C ; ppu ad
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 3 - - - 0x01FEF2 07:FEE2: 04        .byte $04   ; counte
    ; [DIRECTIVE] .BYTE $0F, $17, $37, $12  -- needs manual handling  ; orig: - D 3 - - - 0x01FEF3 07:FEE3: 0F        .byte $0F, $17, $37,
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 3 - - - 0x01FEF7 07:FEE7: FF        .byte $FF   ; close 



tbl_FEE8_bg_color:  ; orig: tbl_FEE8_bg_color:
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - - - - - - 0x01FEF8 07:FEE8: 12        .byte $12   ; 00
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 3 - - - 0x01FEF9 07:FEE9: 11        .byte $11   ; 01
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFA 07:FEEA: 22        .byte $22   ; 02
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFB 07:FEEB: 21        .byte $21   ; 03
    ; [DIRECTIVE] .BYTE $31  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFC 07:FEEC: 31        .byte $31   ; 04
    ; [DIRECTIVE] .BYTE $32  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFD 07:FEED: 32        .byte $32   ; 05
    ; [DIRECTIVE] .BYTE $33  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFE 07:FEEE: 33        .byte $33   ; 06
    ; [DIRECTIVE] .BYTE $35  -- needs manual handling  ; orig: - D 3 - - - 0x01FEFF 07:FEEF: 35        .byte $35   ; 07
    ; [DIRECTIVE] .BYTE $34  -- needs manual handling  ; orig: - D 3 - - - 0x01FF00 07:FEF0: 34        .byte $34   ; 08
    ; [DIRECTIVE] .BYTE $36  -- needs manual handling  ; orig: - D 3 - - - 0x01FF01 07:FEF1: 36        .byte $36   ; 09
    ; [DIRECTIVE] .BYTE $37  -- needs manual handling  ; orig: - D 3 - - - 0x01FF02 07:FEF2: 37        .byte $37   ; 0A
    ; [DIRECTIVE] .BYTE $37  -- needs manual handling  ; orig: - - - - - - 0x01FF03 07:FEF3: 37        .byte $37   ; 0B



ofs_004_FEF4_5E:  ; orig: ofs_004_FEF4_5E:

; con_obj_id_5E

; X = 01+
    MOVE.B  ram_051A,D2  ; orig: C - - J - - 0x01FF04 07:FEF4: AC 1A 05  LDY ram_051A
    CMPI.B  #$0C,D2  ; orig: C - - - - - 0x01FF07 07:FEF7: C0 0C     CPY #$0C
    BCS     bra_FF28_RTS             ; BCS  ; orig: C - - - - - 0x01FF09 07:FEF9: B0 2D     BCS bra_FF28_RTS
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01FF0B 07:FEFB: A5 15     LDA ram_frm_cnt
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01FF0D 07:FEFD: 29 07     AND #$07
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01FF0F 07:FEFF: C9 04     CMP #$04
    BNE     bra_FF28_RTS             ; BNE  ; orig: C - - - - - 0x01FF11 07:FF01: D0 25     BNE bra_FF28_RTS
    ADDQ.B  #1,ram_051A  ; orig: C - - - - - 0x01FF13 07:FF03: EE 1A 05  INC ram_051A
    CMPI.B  #$0B,D2  ; orig: C - - - - - 0x01FF16 07:FF06: C0 0B     CPY #$0B
    BEQ     bra_FF29             ; BEQ  ; orig: C - - - - - 0x01FF18 07:FF08: F0 1F     BEQ bra_FF29
loc_FF0A:  ; orig: loc_FF0A:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01FF1A 07:FF0A: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01FF1B 07:FF0B: 48        PHA
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x01FF1C 07:FF0C: A0 07     LDY #$07
bra_FF0E_loop:  ; orig: bra_FF0E_loop:
    MOVE.B  tbl_FEE0_bg_palette(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01FF1E 07:FF0E: B9 E0 FE  LDA tbl_FEE0_bg_pale
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01FF21 07:FF11: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01FF24 07:FF14: 88        DEY
    BPL     bra_FF0E_loop             ; BPL  ; orig: C - - - - - 0x01FF25 07:FF15: 10 F7     BPL bra_FF0E_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01FF27 07:FF17: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01FF28 07:FF18: A8        TAY
    MOVE.B  tbl_FEE8_bg_color(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01FF29 07:FF19: B9 E8 FE  LDA tbl_FEE8_bg_colo
    ; (empty translation for STA)  ; orig: C - - - - - 0x01FF2C 07:FF1C: 8D 08 03  STA ram_0302_ppu_buf
    CMPI.B  #$0A,D2  ; orig: C - - - - - 0x01FF2F 07:FF1F: C0 0A     CPY #$0A
    BNE     bra_FF28_RTS             ; BNE  ; orig: C - - - - - 0x01FF31 07:FF21: D0 05     BNE bra_FF28_RTS
    MOVE.B  #$99,D0  ; orig: C - - - - - 0x01FF33 07:FF23: A9 99     LDA #$99
    MOVE.B  D0,ram_min_collision_tile  ; orig: C - - - - - 0x01FF35 07:FF25: 8D 4A 03  STA ram_min_collisio
bra_FF28_RTS:  ; orig: bra_FF28_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01FF38 07:FF28: 60        RTS
bra_FF29:  ; orig: bra_FF29:

; triggers at 48698 frame 1st quest demo, when going into sand after playing flute opens stairs
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x01FF39 07:FF29: A9 60     LDA #$60
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FF3B 07:FF2B: 95 70     STA ram_pos_X_enemy,
    MOVE.B  #$90,D0  ; orig: C - - - - - 0x01FF3D 07:FF2D: A9 90     LDA #$90
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01FF3F 07:FF2F: 95 84     STA ram_pos_Y_enemy,
    JMP     loc_0x010F42  ; orig: C - - - - - 0x01FF41 07:FF31: 4C 32 8F  JMP loc_0x010F42



loc_0x01FF44:  ; orig: loc_0x01FF44:
    MOVE.B  ram_frm_cnt,D0  ; orig: - - - - - - 0x01FF44 07:FF34: A5 15     LDA ram_frm_cnt
    ANDI.B  #$04,D0  ; orig: - - - - - - 0x01FF46 07:FF36: 29 04     AND #$04
    BEQ     bra_FF28_RTS             ; BEQ  ; orig: - - - - - - 0x01FF48 07:FF38: F0 EE     BEQ bra_FF28_RTS
    SUBQ.B  #1,ram_051A  ; orig: - - - - - - 0x01FF4A 07:FF3A: CE 1A 05  DEC ram_051A
    MOVE.B  ram_051A,D2  ; orig: - - - - - - 0x01FF4D 07:FF3D: AC 1A 05  LDY ram_051A
    JMP     loc_FF0A  ; orig: - - - - - - 0x01FF50 07:FF40: 4C 0A FF  JMP loc_FF0A



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01FF53 07:FF43: FF        .byte $FF, $FF, $FF,



MainInit:        ; Genesis entry point
vec_FF50_RESET:  ; orig: vec_FF50_RESET:
loc_0x01FF60_RESET_vector:  ; orig: loc_0x01FF60_RESET_vector:
    NOP                     ; SEI: NES disables IRQs at reset. Keep IPM=7 during init (CLI elsewhere lowers it)
    NOP                     ; SEI: was wrongly ANDI #$F8FF,SR which enabled IRQs prematurely
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FF62 07:FF52: A9 00     LDA #$00
    MOVE.B  D0,PPU_REG_$2000  ; !! PPU REGISTER - NEEDS VDP TRANSLATION !!  ; orig: C - - - - - 0x01FF64 07:FF54: 8D 00 20  STA $2000
    ; MOVE.L D1,A7 (TXS) SKIPPED - would corrupt Genesis stack pointer
bra_FF5A_infinite_loop:  ; orig: bra_FF5A_infinite_loop: (wait for vblank)
    BSR     PPU_READ_2002   ; Fix W: read PPU status via VDP
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x01FF6D 07:FF5D: 29 80     AND #$80
    BEQ     bra_FF5A_infinite_loop             ; BEQ  ; orig: C - - - - - 0x01FF6F 07:FF5F: F0 F9     BEQ bra_FF5A_infinit
bra_FF61_infinite_loop:  ; orig: bra_FF61_infinite_loop: (wait for second vblank)
    BSR     PPU_READ_2002   ; Fix W: read PPU status via VDP
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x01FF74 07:FF64: 29 80     AND #$80
    BEQ     bra_FF61_infinite_loop             ; BEQ  ; orig: C - - - - - 0x01FF76 07:FF66: F0 F9     BEQ bra_FF61_infinit
    ORI.B   #$FF,D0  ; orig: C - - - - - 0x01FF78 07:FF68: 09 FF     ORA #$FF
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FF7A 07:FF6A: 8D 00 80  STA $8000
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF7D 07:FF6D: 8D 00 A0  STA $A000
    MOVE.B  D0,ROM_$C000  ; orig: C - - - - - 0x01FF80 07:FF70: 8D 00 C0  STA $C000
    MOVE.B  D0,ROM_$E000  ; orig: C - - - - - 0x01FF83 07:FF73: 8D 00 E0  STA $E000
    MOVE.B  #con_mirroring_H,D0  ; orig: C - - - - - 0x01FF86 07:FF76: A9 0F     LDA #con_mirroring_H
    BSR     sub_FF98_set_mirroring             ; JSR -> BSR  ; orig: C - - - - - 0x01FF88 07:FF78: 20 98 FF  JSR sub_FF98_set_mir
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01FF8B 07:FF7B: A9 00     LDA #$00
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF8D 07:FF7D: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FF90 07:FF80: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF91 07:FF81: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FF94 07:FF84: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF95 07:FF85: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FF98 07:FF88: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF99 07:FF89: 8D 00 A0  STA $A000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FF9C 07:FF8C: 4A        LSR
    MOVE.B  D0,ROM_$A000  ; orig: C - - - - - 0x01FF9D 07:FF8D: 8D 00 A0  STA $A000
    MOVE.B  #con_prg_bank + $07,D0  ; orig: C - - - - - 0x01FFA0 07:FF90: A9 07     LDA #con_prg_bank + 
    BSR     sub_FFAC_prg_bankswitch             ; JSR -> BSR  ; orig: C - - - - - 0x01FFA2 07:FF92: 20 AC FF  JSR sub_FFAC_prg_ban
    JMP     loc_E440  ; orig: C - - - - - 0x01FFA5 07:FF95: 4C 40 E4  JMP loc_E440



sub_FF98_set_mirroring:  ; orig: sub_FF98_set_mirroring:
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FFA8 07:FF98: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFAB 07:FF9B: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FFAC 07:FF9C: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFAF 07:FF9F: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FFB0 07:FFA0: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFB3 07:FFA3: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FFB4 07:FFA4: 8D 00 80  STA $8000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFB7 07:FFA7: 4A        LSR
    MOVE.B  D0,ROM_$8000  ; orig: C - - - - - 0x01FFB8 07:FFA8: 8D 00 80  STA $8000
    RTS                     ; RTS  ; orig: C - - - - - 0x01FFBB 07:FFAB: 60        RTS



sub_FFAC_prg_bankswitch:  ; orig: sub_FFAC_prg_bankswitch:
loc_FFAC_prg_bankswitch:  ; orig: loc_FFAC_prg_bankswitch:
    MOVE.W  D0,(TRACE_BANK_RAW).l
    ANDI.W  #$00FF,D0
    MOVE.B  D0,ROM_$E000  ; orig: C D 3 - - - 0x01FFBC 07:FFAC: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFBF 07:FFAF: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: C - - - - - 0x01FFC0 07:FFB0: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFC3 07:FFB3: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: C - - - - - 0x01FFC4 07:FFB4: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFC7 07:FFB7: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: C - - - - - 0x01FFC8 07:FFB8: 8D 00 E0  STA $E000
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01FFCB 07:FFBB: 4A        LSR
    MOVE.B  D0,ROM_$E000  ; orig: C - - - - - 0x01FFCC 07:FFBC: 8D 00 E0  STA $E000
    MOVE.W  D0,(TRACE_BANK_POST).l
    RTS                     ; RTS  ; orig: C - - - - - 0x01FFCF 07:FFBF: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01FFD0 07:FFC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01FFE0 07:FFD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x01FFF0 07:FFE0: FF        .byte $FF, $FF, $FF,



; bzk garbage
    ; [DIRECTIVE] .BYTE "ZELDA"  -- needs manual handling  ; orig: - - - - - - 0x01FFFB 07:FFEB: 5A        .byte "ZELDA"



; bzk garbage
vec_FFF0_IRQ:  ; orig: vec_FFF0_IRQ:
    ; [DIRECTIVE] .BYTE $D7  -- needs manual handling  ; orig: - - - - - - 0x020000 07:FFF0: D7        .byte $D7   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - - - - - - 0x020001 07:FFF1: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x020002 07:FFF2: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x020003 07:FFF3: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $38  -- needs manual handling  ; orig: - - - - - - 0x020004 07:FFF4: 38        .byte $38   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x020005 07:FFF5: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x020006 07:FFF6: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x020007 07:FFF7: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x020008 07:FFF8: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - - - - - - 0x020009 07:FFF9: BE        .byte $BE   ;



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank FF: 0x%04X [%d]", ($FFFA - *), ($FFFA - *))  ; orig: .out .sprintf("Free bytes in bank FF: 0x%04X [%d]", ($FFFA -



    ; [DIRECTIVE] .SEGMENT "VECTORS_FF"  -- needs manual handling  ; orig: .segment "VECTORS_FF"
    ; [DIRECTIVE] .WORD vec_E484_NMI  -- needs manual handling  ; orig: - D 3 - - - 0x02000A 07:FFFA: 84 E4     .word vec_E484_NMI
    ; [DIRECTIVE] .WORD vec_FF50_RESET  -- needs manual handling  ; orig: - D 3 - - - 0x02000C 07:FFFC: 50 FF     .word vec_FF50_RESET
    ; [DIRECTIVE] .WORD vec_FFF0_IRQ  -- needs manual handling  ; orig: - - - - - - 0x02000E 07:FFFE: F0 FF     .word vec_FFF0_IRQ




; ── Translation Stats ──
; Translated:  2716
; Warnings:    810
; Unknown:     3
