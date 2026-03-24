; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; ── VDP Layer included via vdp_layer.asm ──
; Run: include "vdp_layer.asm" in your main build

; Source: bank_05.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_05"  -- needs manual handling  ; orig: .segment "BANK_05"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $8000  -- needs manual handling  ; orig: .org $8000  ; for listing file

; 0x014010-0x01800F



    ; [DIRECTIVE] .EXPORT loc_0x014010_pause_screen_handler  -- needs manual handling  ; orig: .export loc_0x014010_pause_screen_handler
    ; [DIRECTIVE] .EXPORT sub_0x0142B8  -- needs manual handling  ; orig: .export sub_0x0142B8
    ; [DIRECTIVE] .EXPORT sub_0x01442E_screen_transition_handlers  -- needs manual handling  ; orig: .export sub_0x01442E_screen_transition_handlers
    ; [DIRECTIVE] .EXPORT sub_0x014531  -- needs manual handling  ; orig: .export sub_0x014531
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x014610_08_prepare_save_menu  -- needs manual handling  ; orig: .export ofs_main_script_1_0x014610_08_prepare_save_menu
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x01462A_0D  -- needs manual handling  ; orig: .export ofs_main_script_1_0x01462A_0D
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x014638_10  -- needs manual handling  ; orig: .export ofs_main_script_1_0x014638_10
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x01478B_04  -- needs manual handling  ; orig: .export ofs_main_script_1_0x01478B_04
    ; [DIRECTIVE] .EXPORT sub_0x0147D6  -- needs manual handling  ; orig: .export sub_0x0147D6
    ; [DIRECTIVE] .EXPORT sub_0x014939  -- needs manual handling  ; orig: .export sub_0x014939
    ; [DIRECTIVE] .EXPORT sub_0x014A23  -- needs manual handling  ; orig: .export sub_0x014A23
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x014A3F_11_death  -- needs manual handling  ; orig: .export ofs_main_script_1_0x014A3F_11_death
    ; [DIRECTIVE] .EXPORT sub_0x014ABD  -- needs manual handling  ; orig: .export sub_0x014ABD
    ; [DIRECTIVE] .EXPORT loc_0x014B04_save_menu_handler  -- needs manual handling  ; orig: .export loc_0x014B04_save_menu_handler
    ; [DIRECTIVE] .EXPORT loc_0x014B9B  -- needs manual handling  ; orig: .export loc_0x014B9B
    ; [DIRECTIVE] .EXPORT sub_0x014BB8  -- needs manual handling  ; orig: .export sub_0x014BB8
    ; [DIRECTIVE] .EXPORT sub_0x014BCC  -- needs manual handling  ; orig: .export sub_0x014BCC
    ; [DIRECTIVE] .EXPORT loc_0x014C8D_death_subroutines  -- needs manual handling  ; orig: .export loc_0x014C8D_death_subroutines
    ; [DIRECTIVE] .EXPORT sub_0x014EE7  -- needs manual handling  ; orig: .export sub_0x014EE7
    ; [DIRECTIVE] .EXPORT sub_0x014F8B  -- needs manual handling  ; orig: .export sub_0x014F8B
    ; [DIRECTIVE] .EXPORT sub_0x015034  -- needs manual handling  ; orig: .export sub_0x015034
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x015090_0B  -- needs manual handling  ; orig: .export ofs_main_script_1_0x015090_0B
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x0150A7_0C  -- needs manual handling  ; orig: .export ofs_main_script_1_0x0150A7_0C
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x01511A_09  -- needs manual handling  ; orig: .export ofs_main_script_1_0x01511A_09
    ; [DIRECTIVE] .EXPORT sub_0x01518C  -- needs manual handling  ; orig: .export sub_0x01518C
    ; [DIRECTIVE] .EXPORT sub_0x015338  -- needs manual handling  ; orig: .export sub_0x015338
    ; [DIRECTIVE] .EXPORT _off006_0x015BE8_00  -- needs manual handling  ; orig: .export _off006_0x015BE8_00
    ; [DIRECTIVE] .EXPORT _off006_0x015C1D_10  -- needs manual handling  ; orig: .export _off006_0x015C1D_10
    ; [DIRECTIVE] .EXPORT _off006_0x015C4E_20  -- needs manual handling  ; orig: .export _off006_0x015C4E_20
    ; [DIRECTIVE] .EXPORT _off006_0x015C90_30  -- needs manual handling  ; orig: .export _off006_0x015C90_30
    ; [DIRECTIVE] .EXPORT _off006_0x015CD4_40  -- needs manual handling  ; orig: .export _off006_0x015CD4_40
    ; [DIRECTIVE] .EXPORT _off006_0x015D06_50  -- needs manual handling  ; orig: .export _off006_0x015D06_50
    ; [DIRECTIVE] .EXPORT _off006_0x015D42_60  -- needs manual handling  ; orig: .export _off006_0x015D42_60
    ; [DIRECTIVE] .EXPORT _off006_0x015D7D_70  -- needs manual handling  ; orig: .export _off006_0x015D7D_70
    ; [DIRECTIVE] .EXPORT _off006_0x015DB8_80  -- needs manual handling  ; orig: .export _off006_0x015DB8_80
    ; [DIRECTIVE] .EXPORT _off006_0x015DF6_90  -- needs manual handling  ; orig: .export _off006_0x015DF6_90
    ; [DIRECTIVE] .EXPORT _off006_0x015E37_A0  -- needs manual handling  ; orig: .export _off006_0x015E37_A0
    ; [DIRECTIVE] .EXPORT _off006_0x015E7C_B0  -- needs manual handling  ; orig: .export _off006_0x015E7C_B0
    ; [DIRECTIVE] .EXPORT _off006_0x015EB9_C0  -- needs manual handling  ; orig: .export _off006_0x015EB9_C0
    ; [DIRECTIVE] .EXPORT _off006_0x015EEF_D0  -- needs manual handling  ; orig: .export _off006_0x015EEF_D0
    ; [DIRECTIVE] .EXPORT _off006_0x015F31_E0  -- needs manual handling  ; orig: .export _off006_0x015F31_E0
    ; [DIRECTIVE] .EXPORT _off006_0x015F65_F0  -- needs manual handling  ; orig: .export _off006_0x015F65_F0
    ; [DIRECTIVE] .EXPORT sub_0x016406  -- needs manual handling  ; orig: .export sub_0x016406
    ; [DIRECTIVE] .EXPORT sub_0x016603  -- needs manual handling  ; orig: .export sub_0x016603
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x016843_12_triforce_collected  -- needs manual handling  ; orig: .export ofs_main_script_1_0x016843_12_triforce_collected
    ; [DIRECTIVE] .EXPORT loc_0x016868  -- needs manual handling  ; orig: .export loc_0x016868
    ; [DIRECTIVE] .EXPORT sub_0x0168EE_move_curtain  -- needs manual handling  ; orig: .export sub_0x0168EE_move_curtain
    ; [DIRECTIVE] .EXPORT sub_0x016BD4  -- needs manual handling  ; orig: .export sub_0x016BD4
    ; [DIRECTIVE] .EXPORT sub_0x016C17_set_block_address_pointer  -- needs manual handling  ; orig: .export sub_0x016C17_set_block_address_pointer
    ; [DIRECTIVE] .EXPORT ofs_002_0x017010_02  -- needs manual handling  ; orig: .export ofs_002_0x017010_02
    ; [DIRECTIVE] .EXPORT ofs_002_0x017019_03  -- needs manual handling  ; orig: .export ofs_002_0x017019_03
    ; [DIRECTIVE] .EXPORT ofs_002_0x017020_04  -- needs manual handling  ; orig: .export ofs_002_0x017020_04
    ; [DIRECTIVE] .EXPORT ofs_002_0x017026_05  -- needs manual handling  ; orig: .export ofs_002_0x017026_05
    ; [DIRECTIVE] .EXPORT ofs_002_0x01702D_06  -- needs manual handling  ; orig: .export ofs_002_0x01702D_06
    ; [DIRECTIVE] .EXPORT ofs_002_0x01703A_07_draw_level_text  -- needs manual handling  ; orig: .export ofs_002_0x01703A_07_draw_level_text
    ; [DIRECTIVE] .EXPORT ofs_002_0x017046_08  -- needs manual handling  ; orig: .export ofs_002_0x017046_08
    ; [DIRECTIVE] .EXPORT sub_0x01706E  -- needs manual handling  ; orig: .export sub_0x01706E
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x01708A_06  -- needs manual handling  ; orig: .export ofs_main_script_1_0x01708A_06
    ; [DIRECTIVE] .EXPORT sub_0x0170C6  -- needs manual handling  ; orig: .export sub_0x0170C6
    ; [DIRECTIVE] .EXPORT ofs_main_script_1_0x01710C_0A  -- needs manual handling  ; orig: .export ofs_main_script_1_0x01710C_0A
    ; [DIRECTIVE] .EXPORT sub_0x0171F6  -- needs manual handling  ; orig: .export sub_0x0171F6
    ; [DIRECTIVE] .EXPORT sub_0x0172AA  -- needs manual handling  ; orig: .export sub_0x0172AA
    ; [DIRECTIVE] .EXPORT sub_0x017404  -- needs manual handling  ; orig: .export sub_0x017404
    ; [DIRECTIVE] .EXPORT sub_0x0174BC_check_battery_integrity  -- needs manual handling  ; orig: .export sub_0x0174BC_check_battery_integrity
    ; [DIRECTIVE] .EXPORT sub_0x0174F8_clear_memory  -- needs manual handling  ; orig: .export sub_0x0174F8_clear_memory
    ; [DIRECTIVE] .EXPORT ofs_000_0x017527_01  -- needs manual handling  ; orig: .export ofs_000_0x017527_01
    ; [DIRECTIVE] .EXPORT ofs_000_0x017527_08  -- needs manual handling  ; orig: .export ofs_000_0x017527_08
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_00  -- needs manual handling  ; orig: .export ofs_000_0x017532_00
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_02  -- needs manual handling  ; orig: .export ofs_000_0x017532_02
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_03  -- needs manual handling  ; orig: .export ofs_000_0x017532_03
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_04  -- needs manual handling  ; orig: .export ofs_000_0x017532_04
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_05  -- needs manual handling  ; orig: .export ofs_000_0x017532_05
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_06  -- needs manual handling  ; orig: .export ofs_000_0x017532_06
    ; [DIRECTIVE] .EXPORT ofs_000_0x017532_07  -- needs manual handling  ; orig: .export ofs_000_0x017532_07
    ; [DIRECTIVE] .EXPORT sub_0x017569_disable_greyscale  -- needs manual handling  ; orig: .export sub_0x017569_disable_greyscale
    ; [DIRECTIVE] .EXPORT sub_0x0175FB  -- needs manual handling  ; orig: .export sub_0x0175FB
    ; [DIRECTIVE] .EXPORT sub_0x0177D8  -- needs manual handling  ; orig: .export sub_0x0177D8
    ; [DIRECTIVE] .EXPORT sub_0x01782C  -- needs manual handling  ; orig: .export sub_0x01782C
    ; [DIRECTIVE] .EXPORT loc_0x01782C  -- needs manual handling  ; orig: .export loc_0x01782C
    ; [DIRECTIVE] .EXPORT sub_0x01784A  -- needs manual handling  ; orig: .export sub_0x01784A



loc_0x014010_pause_screen_handler:  ; orig: loc_0x014010_pause_screen_handler:
    BSR     sub_8006_pause_screen_handler             ; JSR -> BSR  ; orig: C D 0 - - - 0x014010 05:8000: 20 06 80  JSR sub_8006_pause_s
    JMP     loc_0x01ED99  ; orig: C - - - - - 0x014013 05:8003: 4C 89 ED  JMP loc_0x01ED99



sub_8006_pause_screen_handler:  ; orig: sub_8006_pause_screen_handler:
    MOVE.B  ram_pause_script,D0  ; orig: C - - - - - 0x014016 05:8006: A5 E1     LDA ram_pause_script
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x014018 05:8008: A4 10     LDY ram_dungeon_leve
    BEQ     bra_8021_overworld             ; BEQ  ; orig: C - - - - - 0x01401A 05:800A: F0 15     BEQ bra_8021_overwor

; if dungeon
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01401C 05:800C: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8056_00_RTS  -- needs manual handling  ; orig: - - - - - - 0x01401F 05:800F: 56 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8038_01  -- needs manual handling  ; orig: - D 0 - I - 0x014021 05:8011: 38 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8057_02  -- needs manual handling  ; orig: - D 0 - I - 0x014023 05:8013: 57 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_805E_03  -- needs manual handling  ; orig: - D 0 - I - 0x014025 05:8015: 5E 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8062_04  -- needs manual handling  ; orig: - D 0 - I - 0x014027 05:8017: 62 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8066_05  -- needs manual handling  ; orig: - D 0 - I - 0x014029 05:8019: 66 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_8076_06  -- needs manual handling  ; orig: - D 0 - I - 0x01402B 05:801B: 76 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_80D4_07_inventory  -- needs manual handling  ; orig: - D 0 - I - 0x01402D 05:801D: D4 80     .word ofs_dungeon_pa
    ; [DIRECTIVE] .WORD ofs_dungeon_pause_handler_810F_08  -- needs manual handling  ; orig: - D 0 - I - 0x01402F 05:801F: 0F 81     .word ofs_dungeon_pa



bra_8021_overworld:  ; orig: bra_8021_overworld:
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x014031 05:8021: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_8056_00_RTS  -- needs manual handling  ; orig: - - - - - - 0x014034 05:8024: 56 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_819A_01_draw_triforce_triangles  -- needs manual handling  ; orig: - D 0 - I - 0x014036 05:8026: 9A 81     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_8038_02  -- needs manual handling  ; orig: - D 0 - I - 0x014038 05:8028: 38 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_8057_03  -- needs manual handling  ; orig: - D 0 - I - 0x01403A 05:802A: 57 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_805E_04  -- needs manual handling  ; orig: - D 0 - I - 0x01403C 05:802C: 5E 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_8062_05  -- needs manual handling  ; orig: - D 0 - I - 0x01403E 05:802E: 62 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_806C_06_draw_triforce_text  -- needs manual handling  ; orig: - D 0 - I - 0x014040 05:8030: 6C 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_8070_07  -- needs manual handling  ; orig: - D 0 - I - 0x014042 05:8032: 70 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_80D4_08_inventory  -- needs manual handling  ; orig: - D 0 - I - 0x014044 05:8034: D4 80     .word ofs_overworld_
    ; [DIRECTIVE] .WORD ofs_overworld_pause_handler_810F_09  -- needs manual handling  ; orig: - D 0 - I - 0x014046 05:8036: 0F 81     .word ofs_overworld_



ofs_dungeon_pause_handler_8038_01:  ; orig: ofs_dungeon_pause_handler_8038_01:
ofs_overworld_pause_handler_8038_02:  ; orig: ofs_overworld_pause_handler_8038_02:
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - J - - 0x014048 05:8038: 20 F7 E5  JSR sub_0x01E607_hid
    BSR     sub_bat_71DE_draw_dot_on_minimap             ; JSR -> BSR  ; orig: C - - - - - 0x01404B 05:803B: 20 DE 71  JSR sub_bat_71DE_dra
    BSR     sub_0x01E689             ; JSR -> BSR  ; orig: C - - - - - 0x01404E 05:803E: 20 79 E6  JSR sub_0x01E689
    MOVE.B  #$EF,D0  ; orig: C - - - - - 0x014051 05:8041: A9 EF     LDA #$EF
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x014053 05:8043: 85 FC     STA ram_scroll_Y
    MOVE.B  D0,ram_005C  ; orig: C - - - - - 0x014055 05:8045: 85 5C     STA ram_005C
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014057 05:8047: A9 01     LDA #$01
    BSR     sub_8130             ; JSR -> BSR  ; orig: C - - - - - 0x014059 05:8049: 20 30 81  JSR sub_8130
    ADDQ.B  #1,ram_pause_script  ; orig: C - - - - - 0x01405C 05:804C: E6 E1     INC ram_pause_script
    MOVE.B  #$2B,D0  ; orig: C - - - - - 0x01405E 05:804E: A9 2B     LDA #$2B
    MOVE.B  D0,ram_005E  ; orig: C - - - - - 0x014060 05:8050: 85 5E     STA ram_005E
    MOVE.B  #$7F,D0  ; orig: C - - - - - 0x014062 05:8052: A9 7F     LDA #$7F
    MOVE.B  D0,ram_005D  ; orig: C - - - - - 0x014064 05:8054: 85 5D     STA ram_005D
ofs_dungeon_pause_handler_8056_00_RTS:  ; orig: ofs_dungeon_pause_handler_8056_00_RTS:
ofs_overworld_pause_handler_8056_00_RTS:  ; orig: ofs_overworld_pause_handler_8056_00_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014066 05:8056: 60        RTS



ofs_dungeon_pause_handler_8057_02:  ; orig: ofs_dungeon_pause_handler_8057_02:
ofs_overworld_pause_handler_8057_03:  ; orig: ofs_overworld_pause_handler_8057_03:
    MOVE.B  #con_ppu_buf_48,D0  ; orig: C - - J - - 0x014067 05:8057: A9 48     LDA #con_ppu_buf_48
bra_8059:  ; orig: bra_8059:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x014069 05:8059: 85 14     STA ram_ppu_load_ind
loc_805B:  ; orig: loc_805B:
    ADDQ.B  #1,ram_pause_script  ; orig: C D 0 - - - 0x01406B 05:805B: E6 E1     INC ram_pause_script
    RTS                     ; RTS  ; orig: C - - - - - 0x01406D 05:805D: 60        RTS



ofs_dungeon_pause_handler_805E_03:  ; orig: ofs_dungeon_pause_handler_805E_03:
ofs_overworld_pause_handler_805E_04:  ; orig: ofs_overworld_pause_handler_805E_04:
    MOVE.B  #con_ppu_buf_4A,D0  ; orig: C - - J - - 0x01406E 05:805E: A9 4A     LDA #con_ppu_buf_4A
    BNE     bra_8059             ; BNE  ; orig: C - - - - - 0x014070 05:8060: D0 F7     BNE bra_8059    ; jm



ofs_dungeon_pause_handler_8062_04:  ; orig: ofs_dungeon_pause_handler_8062_04:
ofs_overworld_pause_handler_8062_05:  ; orig: ofs_overworld_pause_handler_8062_05:
    MOVE.B  #con_ppu_buf_4C,D0  ; orig: C - - J - - 0x014072 05:8062: A9 4C     LDA #con_ppu_buf_4C
    BNE     bra_8059             ; BNE  ; orig: C - - - - - 0x014074 05:8064: D0 F3     BNE bra_8059    ; jm



ofs_dungeon_pause_handler_8066_05:  ; orig: ofs_dungeon_pause_handler_8066_05:
    BSR     sub_B23A             ; JSR -> BSR  ; orig: C - - J - - 0x014076 05:8066: 20 3A B2  JSR sub_B23A
    JMP     loc_805B  ; orig: C - - - - - 0x014079 05:8069: 4C 5B 80  JMP loc_805B



ofs_overworld_pause_handler_806C_06_draw_triforce_text:  ; orig: ofs_overworld_pause_handler_806C_06_draw_triforce_text:
    MOVE.B  #con_ppu_buf_triforce_text,D0  ; orig: C - - J - - 0x01407C 05:806C: A9 5C     LDA #con_ppu_buf_tri
    BNE     bra_8059             ; BNE  ; orig: C - - - - - 0x01407E 05:806E: D0 E9     BNE bra_8059    ; jm



ofs_overworld_pause_handler_8070_07:  ; orig: ofs_overworld_pause_handler_8070_07:
    BSR     sub_B282             ; JSR -> BSR  ; orig: C - - J - - 0x014080 05:8070: 20 82 B2  JSR sub_B282
    JMP     loc_8079  ; orig: C - - - - - 0x014083 05:8073: 4C 79 80  JMP loc_8079



ofs_dungeon_pause_handler_8076_06:  ; orig: ofs_dungeon_pause_handler_8076_06:
    BSR     sub_B23A             ; JSR -> BSR  ; orig: C - - J - - 0x014086 05:8076: 20 3A B2  JSR sub_B23A
loc_8079:  ; orig: loc_8079:
    MOVE.B  #$03,D0  ; orig: C D 0 - - - 0x014089 05:8079: A9 03     LDA #$03
    BSR     sub_8130             ; JSR -> BSR  ; orig: C - - - - - 0x01408B 05:807B: 20 30 81  JSR sub_8130
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x01408E 05:807E: A5 FC     LDA ram_scroll_Y
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014090 05:8080: 38        SEC
    SUBX.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x014091 05:8081: E9 03     SBC #$03
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x014093 05:8083: 85 FC     STA ram_scroll_Y
    CMPI.B  #$41,D0  ; orig: C - - - - - 0x014095 05:8085: C9 41     CMP #$41
    BNE     bra_80D3_RTS             ; BNE  ; orig: C - - - - - 0x014097 05:8087: D0 4A     BNE bra_80D3_RTS
    ADDQ.B  #1,ram_pause_script  ; orig: C - - - - - 0x014099 05:8089: E6 E1     INC ram_pause_script
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01409B 05:808B: A5 10     LDA ram_dungeon_leve
    BEQ     bra_80D3_RTS             ; BEQ  ; orig: C - - - - - 0x01409D 05:808D: F0 44     BEQ bra_80D3_RTS    

; if dungeon
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01409F 05:808F: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x0140A1 05:8091: C9 09     CMP #con_script_09
    BEQ     bra_80D3_RTS             ; BEQ  ; orig: C - - - - - 0x0140A3 05:8093: F0 3E     BEQ bra_80D3_RTS
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0140A5 05:8095: A5 EB     LDA ram_map_location
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0140A7 05:8097: 29 0F     AND #$0F

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140A9 05:8099: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140AA 05:809A: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140AB 05:809B: 0A        ASL
    MOVE.B  D0,ram_0000_t60  ; orig: C - - - - - 0x0140AC 05:809C: 85 00     STA ram_0000_t60
    MOVE.B  ram_6BAB,D0  ; orig: C - - - - - 0x0140AE 05:809E: AD AB 6B  LDA ram_6BAB
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x0140B1 05:80A1: C9 08     CMP #$08
    BCC     bra_80B3             ; BCC  ; orig: C - - - - - 0x0140B3 05:80A3: 90 0E     BCC bra_80B3
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0140B5 05:80A5: A9 10     LDA #$10
    SUBX.B  ram_6BAB,D0  ; orig: C - - - - - 0x0140B7 05:80A7: ED AB 6B  SBC ram_6BAB

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140BA 05:80AA: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140BB 05:80AB: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140BC 05:80AC: 0A        ASL
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x0140BD 05:80AD: 20 21 70  JSR sub_bat_7021_EOR
    JMP     loc_80B6  ; orig: C - - - - - 0x0140C0 05:80B0: 4C B6 80  JMP loc_80B6
bra_80B3:  ; orig: bra_80B3:

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140C3 05:80B3: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140C4 05:80B4: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0140C5 05:80B5: 0A        ASL
loc_80B6:  ; orig: loc_80B6:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C D 0 - - - 0x0140C6 05:80B6: 18        CLC
    ADDX.B  ram_0000_t60,D0  ; orig: C - - - - - 0x0140C7 05:80B7: 65 00     ADC ram_0000_t60
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0140C9 05:80B9: 18        CLC
    ADDX.B  #$62,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0140CA 05:80BA: 69 62     ADC #$62
    ; (empty translation for STA)  ; orig: C - - - - - 0x0140CC 05:80BC: 8D 53 02  STA ram_spr_X + $50
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0140CF 05:80BF: A5 EB     LDA ram_map_location
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0140D1 05:80C1: 29 F0     AND #$F0
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0140D3 05:80C3: 4A        LSR
    ADDX.B  #$69,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0140D4 05:80C4: 69 69     ADC #$69
    ; (empty translation for STA)  ; orig: C - - - - - 0x0140D6 05:80C6: 8D 50 02  STA ram_spr_Y + $50
    MOVE.B  #$3E,D0  ; orig: C - - - - - 0x0140D9 05:80C9: A9 3E     LDA #$3E
    ; (empty translation for STA)  ; orig: C - - - - - 0x0140DB 05:80CB: 8D 51 02  STA ram_spr_T + $50
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0140DE 05:80CE: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: C - - - - - 0x0140E0 05:80D0: 8D 52 02  STA ram_spr_A + $50
bra_80D3_RTS:  ; orig: bra_80D3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0140E3 05:80D3: 60        RTS



ofs_dungeon_pause_handler_80D4_07_inventory:  ; orig: ofs_dungeon_pause_handler_80D4_07_inventory:
ofs_overworld_pause_handler_80D4_08_inventory:  ; orig: ofs_overworld_pause_handler_80D4_08_inventory:

; triggers when inventory is loaded
    BSR     sub_B6A7             ; JSR -> BSR  ; orig: C - - J - - 0x0140E4 05:80D4: 20 A7 B6  JSR sub_B6A7
    BSR     sub_B726             ; JSR -> BSR  ; orig: C - - - - - 0x0140E7 05:80D7: 20 26 B7  JSR sub_B726
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0140EA 05:80DA: A5 FB     LDA ram_btn_hold + $
    ANDI.B  #con_btn_A + con_btn_Up,D0  ; orig: C - - - - - 0x0140EC 05:80DC: 29 88     AND #con_btn_A + con
    CMPI.B  #con_btn_A + con_btn_Up,D0  ; orig: C - - - - - 0x0140EE 05:80DE: C9 88     CMP #con_btn_A + con
    BNE     bra_80F3             ; BNE  ; orig: C - - - - - 0x0140F0 05:80E0: D0 11     BNE bra_80F3    ; do
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C - - - - - 0x0140F2 05:80E2: 20 A3 EB  JSR sub_0x01EBB3_cle

; A = 00
    MOVE.B  D0,ram_pause_script  ; orig: C - - - - - 0x0140F5 05:80E5: 85 E1     STA ram_pause_script
    MOVE.B  #con_script_save_menu,D0  ; orig: C - - - - - 0x0140F7 05:80E7: A9 08     LDA #con_script_save
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x0140F9 05:80E9: 85 12     STA ram_script
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0140FB 05:80EB: A9 00     LDA #$00
    MOVE.B  D0,ram_0619  ; orig: C - - - - - 0x0140FD 05:80ED: 8D 19 06  STA ram_0619
    JMP     loc_8A8E  ; orig: C - - - - - 0x014100 05:80F0: 4C 8E 8A  JMP loc_8A8E
bra_80F3:  ; orig: bra_80F3:
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x014103 05:80F3: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x014105 05:80F5: 29 10     AND #con_btn_Start
    BEQ     bra_8151_RTS             ; BEQ  ; orig: C - - - - - 0x014107 05:80F7: F0 58     BEQ bra_8151_RTS    
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014109 05:80F9: AD 54 02  LDA ram_spr_Y + $54
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01410C 05:80FC: 48        PHA
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01410D 05:80FD: AD 58 02  LDA ram_spr_Y + $58
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014110 05:8100: 48        PHA
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x014111 05:8101: 20 F7 E5  JSR sub_0x01E607_hid
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014114 05:8104: 68        PLA
    ; (empty translation for STA)  ; orig: C - - - - - 0x014115 05:8105: 8D 58 02  STA ram_spr_Y + $58
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014118 05:8108: 68        PLA
    ; (empty translation for STA)  ; orig: C - - - - - 0x014119 05:8109: 8D 54 02  STA ram_spr_Y + $54
    ADDQ.B  #1,ram_pause_script  ; orig: C - - - - - 0x01411C 05:810C: E6 E1     INC ram_pause_script
    RTS                     ; RTS  ; orig: C - - - - - 0x01411E 05:810E: 60        RTS



ofs_dungeon_pause_handler_810F_08:  ; orig: ofs_dungeon_pause_handler_810F_08:
ofs_overworld_pause_handler_810F_09:  ; orig: ofs_overworld_pause_handler_810F_09:
    MOVE.B  #$FD,D0  ; orig: C - - J - - 0x01411F 05:810F: A9 FD     LDA #$FD
    BSR     sub_8130             ; JSR -> BSR  ; orig: C - - - - - 0x014121 05:8111: 20 30 81  JSR sub_8130
    MOVE.B  ram_scroll_Y,D0  ; orig: C - - - - - 0x014124 05:8114: A5 FC     LDA ram_scroll_Y
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014126 05:8116: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014127 05:8117: 69 03     ADC #$03
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x014129 05:8119: 85 FC     STA ram_scroll_Y
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x01412B 05:811B: C9 F0     CMP #$F0
    BCC     bra_8151_RTS             ; BCC  ; orig: C - - - - - 0x01412D 05:811D: 90 32     BCC bra_8151_RTS
    MOVE.B  D0,ram_005C  ; orig: C - - - - - 0x01412F 05:811F: 85 5C     STA ram_005C
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x014131 05:8121: A5 10     LDA ram_dungeon_leve
    BEQ     bra_8128             ; BEQ  ; orig: C - - - - - 0x014133 05:8123: F0 03     BEQ bra_8128    ; if

; if dungeon
    BSR     sub_bat_7512             ; JSR -> BSR  ; orig: C - - - - - 0x014135 05:8125: 20 12 75  JSR sub_bat_7512
bra_8128:  ; orig: bra_8128:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014138 05:8128: A9 00     LDA #$00
    MOVE.B  D0,ram_scroll_Y  ; orig: C - - - - - 0x01413A 05:812A: 85 FC     STA ram_scroll_Y
    MOVE.B  D0,ram_pause_script  ; orig: C - - - - - 0x01413C 05:812C: 85 E1     STA ram_pause_script
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01413E 05:812E: A9 02     LDA #$02
sub_8130:  ; orig: sub_8130:

; in

; A =
    MOVE.B  D0,ram_0000_t61_spr_Y  ; orig: C - - - - - 0x014140 05:8130: 85 00     STA ram_0000_t61_spr
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014142 05:8132: AD 54 02  LDA ram_spr_Y + $54
    CMPI.B  #$F8,D0  ; orig: C - - - - - 0x014145 05:8135: C9 F8     CMP #$F8
    BEQ     bra_813F             ; BEQ  ; orig: C - - - - - 0x014147 05:8137: F0 06     BEQ bra_813F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014149 05:8139: 18        CLC
    ADDX.B  ram_0000_t61_spr_Y,D0  ; orig: C - - - - - 0x01414A 05:813A: 65 00     ADC ram_0000_t61_spr
    ; (empty translation for STA)  ; orig: C - - - - - 0x01414C 05:813C: 8D 54 02  STA ram_spr_Y + $54
bra_813F:  ; orig: bra_813F:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01414F 05:813F: A5 10     LDA ram_dungeon_leve
    BEQ     bra_8151_RTS             ; BEQ  ; orig: C - - - - - 0x014151 05:8141: F0 0E     BEQ bra_8151_RTS    

; if dungeon
    BSR     sub_B5EB             ; JSR -> BSR  ; orig: C - - - - - 0x014153 05:8143: 20 EB B5  JSR sub_B5EB
    BEQ     bra_8151_RTS             ; BEQ  ; orig: C - - - - - 0x014156 05:8146: F0 09     BEQ bra_8151_RTS
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014158 05:8148: AD 58 02  LDA ram_spr_Y + $58
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01415B 05:814B: 18        CLC
    ADDX.B  ram_0000_t61_spr_Y,D0  ; orig: C - - - - - 0x01415C 05:814C: 65 00     ADC ram_0000_t61_spr
    ; (empty translation for STA)  ; orig: C - - - - - 0x01415E 05:814E: 8D 58 02  STA ram_spr_Y + $58
bra_8151_RTS:  ; orig: bra_8151_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014161 05:8151: 60        RTS



tbl_8152:  ; orig: tbl_8152:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x014162 05:8152: 00        .byte $00   ; ram_68
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x014163 05:8153: 08        .byte $08   ; ram_68
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 0 - - - 0x014164 05:8154: 09        .byte $09   ; ram_68
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x014165 05:8155: 01        .byte $01   ; ram_68
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x014166 05:8156: 0A        .byte $0A   ; ram_68
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x014167 05:8157: 0B        .byte $0B   ; ram_68
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 0 - - - 0x014168 05:8158: 12        .byte $12   ; ram_68
    ; [DIRECTIVE] .BYTE $1E  -- needs manual handling  ; orig: - D 0 - - - 0x014169 05:8159: 1E        .byte $1E   ; ram_68
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 0 - - - 0x01416A 05:815A: 1F        .byte $1F   ; ram_68
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x01416B 05:815B: 17        .byte $17   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x01416C 05:815C: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $25  -- needs manual handling  ; orig: - D 0 - - - 0x01416D 05:815D: 25        .byte $25   ; ram_68
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 0 - - - 0x01416E 05:815E: 13        .byte $13   ; ram_68
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 0 - - - 0x01416F 05:815F: 14        .byte $14   ; ram_68
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x014170 05:8160: 21        .byte $21   ; ram_68
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 0 - - - 0x014171 05:8161: 13        .byte $13   ; ram_68
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x014172 05:8162: 20        .byte $20   ; ram_68
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x014173 05:8163: 21        .byte $21   ; ram_68
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 0 - - - 0x014174 05:8164: 15        .byte $15   ; ram_68
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x014175 05:8165: 16        .byte $16   ; ram_68
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 0 - - - 0x014176 05:8166: 22        .byte $22   ; ram_68
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x014177 05:8167: 16        .byte $16   ; ram_68
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 0 - - - 0x014178 05:8168: 22        .byte $22   ; ram_68
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x014179 05:8169: 23        .byte $23   ; ram_68



tbl_816A:  ; orig: tbl_816A:
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x01417A 05:816A: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x01417B 05:816B: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x01417C 05:816C: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x01417D 05:816D: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x01417E 05:816E: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x01417F 05:816F: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x014180 05:8170: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x014181 05:8171: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x014182 05:8172: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x014183 05:8173: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x014184 05:8174: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x014185 05:8175: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $E5  -- needs manual handling  ; orig: - D 0 - - - 0x014186 05:8176: E5        .byte $E5   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x014187 05:8177: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E5  -- needs manual handling  ; orig: - D 0 - - - 0x014188 05:8178: E5        .byte $E5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x014189 05:8179: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x01418A 05:817A: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x01418B 05:817B: E8        .byte $E8   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x01418C 05:817C: F5        .byte $F5   ; ram_68
    ; [DIRECTIVE] .BYTE $E6  -- needs manual handling  ; orig: - D 0 - - - 0x01418D 05:817D: E6        .byte $E6   ; ram_68
    ; [DIRECTIVE] .BYTE $E6  -- needs manual handling  ; orig: - D 0 - - - 0x01418E 05:817E: E6        .byte $E6   ; ram_68
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x01418F 05:817F: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 0 - - - 0x014190 05:8180: E7        .byte $E7   ; ram_68
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 0 - - - 0x014191 05:8181: F5        .byte $F5   ; ram_68



tbl_8182:  ; orig: tbl_8182:
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - - - 0x014192 05:8182: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - - - 0x014193 05:8183: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x014194 05:8184: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - - - 0x014195 05:8185: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x014196 05:8186: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - - - 0x014197 05:8187: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - - - 0x014198 05:8188: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - - - 0x014199 05:8189: E9        .byte $E9   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x01419A 05:818A: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - - - 0x01419B 05:818B: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x01419C 05:818C: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - D 0 - - - 0x01419D 05:818D: EA        .byte $EA   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x01419E 05:818E: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x01419F 05:818F: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A0 05:8190: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A1 05:8191: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A2 05:8192: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A3 05:8193: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A4 05:8194: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A5 05:8195: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A6 05:8196: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A7 05:8197: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A8 05:8198: 24        .byte $24   ; ram_68
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x0141A9 05:8199: 24        .byte $24   ; ram_68



ofs_overworld_pause_handler_819A_01_draw_triforce_triangles:  ; orig: ofs_overworld_pause_handler_819A_01_draw_triforce_triangles:
    MOVE.B  #$17,D2  ; orig: C - - J - - 0x0141AA 05:819A: A0 17     LDY #$17
bra_819C_loop:  ; orig: bra_819C_loop:
    MOVE.B  tbl_8152(D2.L),D1  ; LDX abs,Y  ; orig: C - - - - - 0x0141AC 05:819C: BE 52 81  LDX tbl_8152,Y
    MOVE.B  tbl_8182(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0141AF 05:819F: B9 82 81  LDA tbl_8182,Y
    MOVE.B  D0,ram_684B(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0141B2 05:81A2: 9D 4B 68  STA ram_684B,X
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0141B5 05:81A5: 88        DEY
    BPL     bra_819C_loop             ; BPL  ; orig: C - - - - - 0x0141B6 05:81A6: 10 F4     BPL bra_819C_loop
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0141B8 05:81A8: C8        INY ; 00
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0141B9 05:81A9: A9 01     LDA #$01
    MOVE.B  D0,ram_0006_t03_triforce_piece  ; orig: C - - - - - 0x0141BB 05:81AB: 85 06     STA ram_0006_t03_tri
bra_81AD_loop:  ; orig: bra_81AD_loop:
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x0141BD 05:81AD: A9 03     LDA #$03
    MOVE.B  D0,ram_0007_t03_loop_counter  ; orig: C - - - - - 0x0141BF 05:81AF: 85 07     STA ram_0007_t03_loo
bra_81B1_loop:  ; orig: bra_81B1_loop:
    MOVE.B  tbl_8152(D2.L),D1  ; LDX abs,Y  ; orig: C - - - - - 0x0141C1 05:81B1: BE 52 81  LDX tbl_8152,Y
    MOVE.B  ram_0006_t03_triforce_piece,D0  ; orig: C - - - - - 0x0141C4 05:81B4: A5 06     LDA ram_0006_t03_tri
    BTST    D0,ram_item_triforce_pieces  ; BIT abs  ; orig: C - - - - - 0x0141C6 05:81B6: 2C 71 06  BIT ram_item_triforc
    BEQ     bra_81D1_not_collected             ; BEQ  ; orig: C - - - - - 0x0141C9 05:81B9: F0 16     BEQ bra_81D1_not_col
    MOVE.B  ram_684B(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0141CB 05:81BB: BD 4B 68  LDA ram_684B,X
    CMPI.B  #$E5,D0  ; orig: C - - - - - 0x0141CE 05:81BE: C9 E5     CMP #$E5
    BEQ     bra_81CC             ; BEQ  ; orig: C - - - - - 0x0141D0 05:81C0: F0 0A     BEQ bra_81CC
    CMPI.B  #$E6,D0  ; orig: C - - - - - 0x0141D2 05:81C2: C9 E6     CMP #$E6
    BEQ     bra_81CC             ; BEQ  ; orig: C - - - - - 0x0141D4 05:81C4: F0 06     BEQ bra_81CC
    MOVE.B  tbl_816A(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0141D6 05:81C6: B9 6A 81  LDA tbl_816A,Y
    JMP     loc_81CE  ; orig: C - - - - - 0x0141D9 05:81C9: 4C CE 81  JMP loc_81CE
bra_81CC:  ; orig: bra_81CC:

; replace triangle tiles with a square tile
    MOVE.B  #$F5,D0  ; orig: C - - - - - 0x0141DC 05:81CC: A9 F5     LDA #$F5
loc_81CE:  ; orig: loc_81CE:
    MOVE.B  D0,ram_684B(D1.L)  ; STA abs,X  ; orig: C D 0 - - - 0x0141DE 05:81CE: 9D 4B 68  STA ram_684B,X
bra_81D1_not_collected:  ; orig: bra_81D1_not_collected:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0141E1 05:81D1: C8        INY
    SUBQ.B  #1,ram_0007_t03_loop_counter  ; orig: C - - - - - 0x0141E2 05:81D2: C6 07     DEC ram_0007_t03_loo
    BNE     bra_81B1_loop             ; BNE  ; orig: C - - - - - 0x0141E4 05:81D4: D0 DB     BNE bra_81B1_loop
    ASL.B   #1,ram_0006_t03_triforce_piece  ; orig: C - - - - - 0x0141E6 05:81D6: 06 06     ASL ram_0006_t03_tri
    BNE     bra_81AD_loop             ; BNE  ; orig: C - - - - - 0x0141E8 05:81D8: D0 D3     BNE bra_81AD_loop
    ADDQ.B  #1,ram_pause_script  ; orig: C - - - - - 0x0141EA 05:81DA: E6 E1     INC ram_pause_script
    RTS                     ; RTS  ; orig: C - - - - - 0x0141EC 05:81DC: 60        RTS



sub_81DD:  ; orig: sub_81DD:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x0141ED 05:81DD: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0141EF 05:81DF: 29 03     AND #$03
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x0141F1 05:81E1: A4 10     LDY ram_dungeon_leve
    BNE     bra_81E7             ; BNE  ; orig: C - - - - - 0x0141F3 05:81E3: D0 02     BNE bra_81E7    ; if

; if overworld
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0141F5 05:81E5: 29 01     AND #$01
bra_81E7:  ; orig: bra_81E7:
    CMP.B   ram_00E6,D0  ; orig: C - - - - - 0x0141F7 05:81E7: C5 E6     CMP ram_00E6
    BNE     bra_8255             ; BNE  ; orig: C - - - - - 0x0141F9 05:81E9: D0 6A     BNE bra_8255
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x0141FB 05:81EB: A9 08     LDA #con_dir_Up
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x0141FD 05:81ED: 24 98     BIT ram_dir_link
    BEQ     bra_8228             ; BEQ  ; orig: C - - - - - 0x0141FF 05:81EF: F0 37     BEQ bra_8228
    SUBQ.B  #1,ram_00E9  ; orig: C - - - - - 0x014201 05:81F1: C6 E9     DEC ram_00E9
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014203 05:81F3: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$DD,D0  ; orig: C - - - - - 0x014205 05:81F5: C9 DD     CMP #$DD
    BCS     bra_81FD             ; BCS  ; orig: C - - - - - 0x014207 05:81F7: B0 04     BCS bra_81FD
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014209 05:81F9: 69 08     ADC #$08
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x01420B 05:81FB: 85 84     STA ram_pos_Y_link
bra_81FD:  ; orig: bra_81FD:
    MOVE.B  ram_00E2_ppu_addr_lo,D0  ; orig: C - - - - - 0x01420D 05:81FD: A5 E2     LDA ram_00E2_ppu_add
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01420F 05:81FF: 38        SEC
    SUBX.B  #$20,D0       ; SBC imm  ; orig: C - - - - - 0x014210 05:8200: E9 20     SBC #$20
    MOVE.B  D0,ram_00E2_ppu_addr_lo  ; orig: C - - - - - 0x014212 05:8202: 85 E2     STA ram_00E2_ppu_add
    BCS     bra_8208_not_underflow             ; BCS  ; orig: C - - - - - 0x014214 05:8204: B0 02     BCS bra_8208_not_und
    SUBQ.B  #1,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x014216 05:8206: C6 58     DEC ram_0058_ppu_add
bra_8208_not_underflow:  ; orig: bra_8208_not_underflow:
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x014218 05:8208: C9 E0     CMP #$E0    ; < xxE0
    BNE     bra_821E_RTS             ; BNE  ; orig: C - - - - - 0x01421A 05:820A: D0 12     BNE bra_821E_RTS
    MOVE.B  ram_0058_ppu_addr_hi,D0  ; orig: C - - - - - 0x01421C 05:820C: A5 58     LDA ram_0058_ppu_add
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01421E 05:820E: C9 20     CMP #$20    ; > 20xx
    BEQ     bra_821F             ; BEQ  ; orig: C - - - - - 0x014220 05:8210: F0 0D     BEQ bra_821F
    CMPI.B  #$27,D0  ; orig: C - - - - - 0x014222 05:8212: C9 27     CMP #$27    ; > 27xx
    BNE     bra_821E_RTS             ; BNE  ; orig: C - - - - - 0x014224 05:8214: D0 08     BNE bra_821E_RTS
    MOVE.B  #> $23A0,D0  ; orig: C - - - - - 0x014226 05:8216: A9 23     LDA #> $23A0
    MOVE.B  D0,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x014228 05:8218: 85 58     STA ram_0058_ppu_add
    MOVE.B  #< $23A0,D0  ; orig: C - - - - - 0x01422A 05:821A: A9 A0     LDA #< $23A0
    MOVE.B  D0,ram_00E2_ppu_addr_lo  ; orig: C - - - - - 0x01422C 05:821C: 85 E2     STA ram_00E2_ppu_add
bra_821E_RTS:  ; orig: bra_821E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01422E 05:821E: 60        RTS
bra_821F:  ; orig: bra_821F:
    ADDQ.B  #1,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x01422F 05:821F: E6 58     INC ram_0058_ppu_add
loc_8221:  ; orig: loc_8221:
    MOVE.B  #$00,D0  ; orig: C D 0 - - - 0x014231 05:8221: A9 00     LDA #$00
    MOVE.B  D0,ram_00E2_ppu_addr_lo  ; orig: C - - - - - 0x014233 05:8223: 85 E2     STA ram_00E2_ppu_add
bra_8225:  ; orig: bra_8225:
loc_8225:  ; orig: loc_8225:
    ADDQ.B  #1,ram_subscript  ; orig: C D 0 - - - 0x014235 05:8225: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x014237 05:8227: 60        RTS
bra_8228:  ; orig: bra_8228:
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014238 05:8228: 4A        LSR ; -> 04 con_dir_
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014239 05:8229: 24 98     BIT ram_dir_link
    BEQ     bra_8255             ; BEQ  ; orig: C - - - - - 0x01423B 05:822B: F0 28     BEQ bra_8255
    ADDQ.B  #1,ram_00E9  ; orig: C - - - - - 0x01423D 05:822D: E6 E9     INC ram_00E9
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01423F 05:822F: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$3E,D0  ; orig: C - - - - - 0x014241 05:8231: C9 3E     CMP #$3E
    BCC     bra_8239             ; BCC  ; orig: C - - - - - 0x014243 05:8233: 90 04     BCC bra_8239
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x014245 05:8235: E9 08     SBC #$08
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x014247 05:8237: 85 84     STA ram_pos_Y_link
bra_8239:  ; orig: bra_8239:
    MOVE.B  ram_00E2_ppu_addr_lo,D0  ; orig: C - - - - - 0x014249 05:8239: A5 E2     LDA ram_00E2_ppu_add
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01424B 05:823B: 18        CLC
    ADDX.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01424C 05:823C: 69 20     ADC #$20
    MOVE.B  D0,ram_00E2_ppu_addr_lo  ; orig: C - - - - - 0x01424E 05:823E: 85 E2     STA ram_00E2_ppu_add
    BCC     bra_8244_not_overflow             ; BCC  ; orig: C - - - - - 0x014250 05:8240: 90 02     BCC bra_8244_not_ove
    ADDQ.B  #1,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x014252 05:8242: E6 58     INC ram_0058_ppu_add
bra_8244_not_overflow:  ; orig: bra_8244_not_overflow:
    CMPI.B  #< $23C0,D0  ; orig: C - - - - - 0x014254 05:8244: C9 C0     CMP #< $23C0
    BNE     bra_8287_RTS             ; BNE  ; orig: C - - - - - 0x014256 05:8246: D0 3F     BNE bra_8287_RTS
    MOVE.B  ram_0058_ppu_addr_hi,D0  ; orig: C - - - - - 0x014258 05:8248: A5 58     LDA ram_0058_ppu_add
    CMPI.B  #> $23C0,D0  ; orig: C - - - - - 0x01425A 05:824A: C9 23     CMP #> $23C0
    BNE     bra_8287_RTS             ; BNE  ; orig: C - - - - - 0x01425C 05:824C: D0 39     BNE bra_8287_RTS
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x01425E 05:824E: A9 28     LDA #$28    ; > 2800
    MOVE.B  D0,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x014260 05:8250: 85 58     STA ram_0058_ppu_add
    JMP     loc_8221  ; orig: C - - - - - 0x014262 05:8252: 4C 21 82  JMP loc_8221
bra_8255:  ; orig: bra_8255:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x014265 05:8255: A9 02     LDA #$02
    MOVE.B  #$FE,D1  ; orig: C - - - - - 0x014267 05:8257: A2 FE     LDX #$FE
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x014269 05:8259: A4 10     LDY ram_dungeon_leve
    BNE     bra_8260             ; BNE  ; orig: C - - - - - 0x01426B 05:825B: D0 03     BNE bra_8260    ; if

; if dungeon
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01426D 05:825D: 0A        ASL
    MOVE.B  #$FC,D1  ; orig: C - - - - - 0x01426E 05:825E: A2 FC     LDX #$FC
bra_8260:  ; orig: bra_8260:
    MOVE.B  D0,ram_0000_t62  ; orig: C - - - - - 0x014270 05:8260: 85 00     STA ram_0000_t62
    MOVE.B  D1,ram_0001_t27  ; orig: C - - - - - 0x014272 05:8262: 86 01     STX ram_0001_t27
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x014274 05:8264: A9 02     LDA #con_dir_Left
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014276 05:8266: 24 98     BIT ram_dir_link
    BEQ     bra_8288             ; BEQ  ; orig: C - - - - - 0x014278 05:8268: F0 1E     BEQ bra_8288
    SUBQ.B  #1,ram_00E8  ; orig: C - - - - - 0x01427A 05:826A: C6 E8     DEC ram_00E8
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01427C 05:826C: A5 70     LDA ram_pos_X_link
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x01427E 05:826E: C9 F0     CMP #$F0
    BCS     bra_8276             ; BCS  ; orig: C - - - - - 0x014280 05:8270: B0 04     BCS bra_8276
    ADDX.B  ram_0000_t62,D0  ; orig: C - - - - - 0x014282 05:8272: 65 00     ADC ram_0000_t62
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x014284 05:8274: 85 70     STA ram_pos_X_link
bra_8276:  ; orig: bra_8276:
    MOVE.B  ram_scroll_X,D0  ; orig: C - - - - - 0x014286 05:8276: A5 FD     LDA ram_scroll_X
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014288 05:8278: 38        SEC
    SUBX.B  ram_0000_t62,D0  ; orig: C - - - - - 0x014289 05:8279: E5 00     SBC ram_0000_t62
    MOVE.B  D0,ram_scroll_X  ; orig: C - - - - - 0x01428B 05:827B: 85 FD     STA ram_scroll_X
    BEQ     bra_8225             ; BEQ  ; orig: C - - - - - 0x01428D 05:827D: F0 A6     BEQ bra_8225
    CMP.B   ram_0001_t27,D0  ; orig: C - - - - - 0x01428F 05:827F: C5 01     CMP ram_0001_t27
    BNE     bra_8287_RTS             ; BNE  ; orig: C - - - - - 0x014291 05:8281: D0 04     BNE bra_8287_RTS
sub_8283:  ; orig: sub_8283:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014293 05:8283: A9 01     LDA #$01
    MOVE.B  D0,ram_005F  ; orig: C - - - - - 0x014295 05:8285: 85 5F     STA ram_005F
bra_8287_RTS:  ; orig: bra_8287_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014297 05:8287: 60        RTS
bra_8288:  ; orig: bra_8288:
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014298 05:8288: 4A        LSR ; -> 01 con_dir_
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014299 05:8289: 24 98     BIT ram_dir_link
    BEQ     bra_8287_RTS             ; BEQ  ; orig: C - - - - - 0x01429B 05:828B: F0 FA     BEQ bra_8287_RTS
    ADDQ.B  #1,ram_00E8  ; orig: C - - - - - 0x01429D 05:828D: E6 E8     INC ram_00E8
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01429F 05:828F: A5 70     LDA ram_pos_X_link
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x0142A1 05:8291: C9 01     CMP #$01
    BCC     bra_8299             ; BCC  ; orig: C - - - - - 0x0142A3 05:8293: 90 04     BCC bra_8299
    SUBX.B  ram_0000_t62,D0  ; orig: C - - - - - 0x0142A5 05:8295: E5 00     SBC ram_0000_t62
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x0142A7 05:8297: 85 70     STA ram_pos_X_link
bra_8299:  ; orig: bra_8299:
    MOVE.B  ram_scroll_X,D0  ; orig: C - - - - - 0x0142A9 05:8299: A5 FD     LDA ram_scroll_X
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0142AB 05:829B: 18        CLC
    ADDX.B  ram_0000_t62,D0  ; orig: C - - - - - 0x0142AC 05:829C: 65 00     ADC ram_0000_t62
    MOVE.B  D0,ram_scroll_X  ; orig: C - - - - - 0x0142AE 05:829E: 85 FD     STA ram_scroll_X
    BNE     bra_8287_RTS             ; BNE  ; orig: C - - - - - 0x0142B0 05:82A0: D0 E5     BNE bra_8287_RTS
    BSR     sub_8283             ; JSR -> BSR  ; orig: C - - - - - 0x0142B2 05:82A2: 20 83 82  JSR sub_8283
    JMP     loc_8225  ; orig: C - - - - - 0x0142B5 05:82A5: 4C 25 82  JMP loc_8225



sub_0x0142B8:  ; orig: sub_0x0142B8:
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x0142B8 05:82A8: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0142BA 05:82AA: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_017_830E_00  -- needs manual handling  ; orig: - D 0 - I - 0x0142BD 05:82AD: 0E 83     .word ofs_017_830E_0
    ; [DIRECTIVE] .WORD ofs_017_82BB_01  -- needs manual handling  ; orig: - D 0 - I - 0x0142BF 05:82AF: BB 82     .word ofs_017_82BB_0
    ; [DIRECTIVE] .WORD ofs_017_831F_02  -- needs manual handling  ; orig: - D 0 - I - 0x0142C1 05:82B1: 1F 83     .word ofs_017_831F_0
    ; [DIRECTIVE] .WORD ofs_017_833D_03  -- needs manual handling  ; orig: - D 0 - I - 0x0142C3 05:82B3: 3D 83     .word ofs_017_833D_0
    ; [DIRECTIVE] .WORD ofs_017_833D_04  -- needs manual handling  ; orig: - D 0 - I - 0x0142C5 05:82B5: 3D 83     .word ofs_017_833D_0
    ; [DIRECTIVE] .WORD ofs_017_835C_05  -- needs manual handling  ; orig: - D 0 - I - 0x0142C7 05:82B7: 5C 83     .word ofs_017_835C_0
    ; [DIRECTIVE] .WORD ofs_017_839E_06  -- needs manual handling  ; orig: - D 0 - I - 0x0142C9 05:82B9: 9E 83     .word ofs_017_839E_0



ofs_017_82BB_01:  ; orig: ofs_017_82BB_01:
    BSR     sub_0x01EA4D             ; JSR -> BSR  ; orig: C - - J - - 0x0142CB 05:82BB: 20 3D EA  JSR sub_0x01EA4D
    BSR     sub_0x01F248             ; JSR -> BSR  ; orig: C - - - - - 0x0142CE 05:82BE: 20 38 F2  JSR sub_0x01F248
    MOVE.B  ram_00EE,D0  ; orig: C - - - - - 0x0142D1 05:82C1: A5 EE     LDA ram_00EE
    MOVE.B  D0,ram_0521  ; orig: C - - - - - 0x0142D3 05:82C3: 8D 21 05  STA ram_0521
    BSR     sub_83C2             ; JSR -> BSR  ; orig: C - - - - - 0x0142D6 05:82C6: 20 C2 83  JSR sub_83C2
    SUBQ.B  #1,ram_00ED  ; orig: C - - - - - 0x0142D9 05:82C9: C6 ED     DEC ram_00ED
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0142DB 05:82CB: E6 13     INC ram_subscript
    BSR     sub_0x01E69F             ; JSR -> BSR  ; orig: C - - - - - 0x0142DD 05:82CD: 20 8F E6  JSR sub_0x01E69F
    MOVE.B  ram_next_map_location,D0  ; orig: C - - - - - 0x0142E0 05:82D0: A5 EC     LDA ram_next_map_loc
    BMI     bra_82F4_RTS             ; BMI  ; orig: C - - - - - 0x0142E2 05:82D2: 30 20     BMI bra_82F4_RTS
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0142E4 05:82D4: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0142E6 05:82D6: 48        PHA
    MOVE.B  ram_dir_link,D2  ; orig: C - - - - - 0x0142E7 05:82D7: A4 98     LDY ram_dir_link
    CMPI.B  #con_dir_Up,D2  ; orig: C - - - - - 0x0142E9 05:82D9: C0 08     CPY #con_dir_Up
    BEQ     bra_82E1             ; BEQ  ; orig: C - - - - - 0x0142EB 05:82DB: F0 04     BEQ bra_82E1
    MOVE.B  ram_next_map_location,D0  ; orig: C - - - - - 0x0142ED 05:82DD: A5 EC     LDA ram_next_map_loc
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x0142EF 05:82DF: 85 EB     STA ram_map_location
bra_82E1:  ; orig: bra_82E1:
    BSR     sub_83D7             ; JSR -> BSR  ; orig: C - - - - - 0x0142F1 05:82E1: 20 D7 83  JSR sub_83D7
    MOVE.B  #$15,D0  ; orig: C - - - - - 0x0142F4 05:82E4: A9 15     LDA #$15
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x0142F6 05:82E6: 85 E9     STA ram_00E9
    MOVE.B  ram_dir_link,D2  ; orig: C - - - - - 0x0142F8 05:82E8: A4 98     LDY ram_dir_link
    CMPI.B  #con_dir_Up,D2  ; orig: C - - - - - 0x0142FA 05:82EA: C0 08     CPY #con_dir_Up
    BEQ     bra_82F5             ; BEQ  ; orig: C - - - - - 0x0142FC 05:82EC: F0 07     BEQ bra_82F5
    BSR     sub_A8C4             ; JSR -> BSR  ; orig: C - - - - - 0x0142FE 05:82EE: 20 C4 A8  JSR sub_A8C4
loc_82F1:  ; orig: loc_82F1:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C D 0 - - - 0x014301 05:82F1: 68        PLA
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x014302 05:82F2: 85 EB     STA ram_map_location
bra_82F4_RTS:  ; orig: bra_82F4_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014304 05:82F4: 60        RTS
bra_82F5:  ; orig: bra_82F5:
    BSR     sub_82FB             ; JSR -> BSR  ; orig: C - - - - - 0x014305 05:82F5: 20 FB 82  JSR sub_82FB
    JMP     loc_82F1  ; orig: C - - - - - 0x014308 05:82F8: 4C F1 82  JMP loc_82F1



sub_82FB:  ; orig: sub_82FB:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01430B 05:82FB: A5 10     LDA ram_dungeon_leve
    BEQ     bra_830D_RTS             ; BEQ  ; orig: C - - - - - 0x01430D 05:82FD: F0 0E     BEQ bra_830D_RTS    

; if dungeon
    MOVE.B  ram_00EE,D0  ; orig: C - - - - - 0x01430F 05:82FF: A5 EE     LDA ram_00EE
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014311 05:8301: 48        PHA
    MOVE.B  ram_0521,D0  ; orig: C - - - - - 0x014312 05:8302: AD 21 05  LDA ram_0521
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x014315 05:8305: 85 EE     STA ram_00EE
    BSR     sub_A4F6             ; JSR -> BSR  ; orig: C - - - - - 0x014317 05:8307: 20 F6 A4  JSR sub_A4F6
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01431A 05:830A: 68        PLA
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x01431B 05:830B: 85 EE     STA ram_00EE
bra_830D_RTS:  ; orig: bra_830D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01431D 05:830D: 60        RTS



ofs_017_830E_00:  ; orig: ofs_017_830E_00:
    MOVE.B  ram_0522_flag,D0  ; orig: C - - J - - 0x01431E 05:830E: AD 22 05  LDA ram_0522_flag
    BEQ     bra_8317             ; BEQ  ; orig: C - - - - - 0x014321 05:8311: F0 04     BEQ bra_8317
    MOVE.B  ram_flute_map_location,D0  ; orig: C - - - - - 0x014323 05:8313: A5 EA     LDA ram_flute_map_lo
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x014325 05:8315: 85 EB     STA ram_map_location
bra_8317:  ; orig: bra_8317:
    MOVE.B  ram_051A,D0  ; orig: C - - - - - 0x014327 05:8317: AD 1A 05  LDA ram_051A
    BEQ     bra_833A             ; BEQ  ; orig: C - - - - - 0x01432A 05:831A: F0 1E     BEQ bra_833A

; if you exit location while lake is changing/already changed colors,

; smoothly change colors back and only then resume exiting
    JMP     loc_0x01FF44  ; orig: - - - - - - 0x01432C 05:831C: 4C 34 FF  JMP loc_0x01FF44



ofs_017_831F_02:  ; orig: ofs_017_831F_02:
    BSR     sub_A924             ; JSR -> BSR  ; orig: C - - J - - 0x01432F 05:831F: 20 24 A9  JSR sub_A924
    MOVE.B  ram_0302_ppu_buffer,D0  ; orig: C - - - - - 0x014332 05:8322: AD 02 03  LDA ram_0302_ppu_buf
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x014335 05:8325: 29 0F     AND #$0F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014337 05:8327: 18        CLC
    ADDX.B  #$27,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014338 05:8328: 69 27     ADC #$27
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x01433A 05:832A: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01433D 05:832D: A5 98     LDA ram_dir_link
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01433F 05:832F: C9 04     CMP #$04
    BCS     bra_8336             ; BCS  ; orig: C - - - - - 0x014341 05:8331: B0 03     BCS bra_8336    ; co
    ADDQ.B  #1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x014343 05:8333: EE 02 03  INC ram_0302_ppu_buf
bra_8336:  ; orig: bra_8336:
    SUBQ.B  #1,ram_00E9  ; orig: C - - - - - 0x014346 05:8336: C6 E9     DEC ram_00E9
    BPL     bra_833C_RTS             ; BPL  ; orig: C - - - - - 0x014348 05:8338: 10 02     BPL bra_833C_RTS
bra_833A:  ; orig: bra_833A:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01434A 05:833A: E6 13     INC ram_subscript
bra_833C_RTS:  ; orig: bra_833C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01434C 05:833C: 60        RTS



ofs_017_833D_03:  ; orig: ofs_017_833D_03:
ofs_017_833D_04:  ; orig: ofs_017_833D_04:
    MOVE.B  #con_dir_Up,D0  ; orig: C - - J - - 0x01434D 05:833D: A9 08     LDA #con_dir_Up
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x01434F 05:833F: 24 98     BIT ram_dir_link
    BNE     bra_8348             ; BNE  ; orig: C - - - - - 0x014351 05:8341: D0 05     BNE bra_8348
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014353 05:8343: 4A        LSR ; -> 04 con_dir_
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014354 05:8344: 24 98     BIT ram_dir_link
    BEQ     bra_8358             ; BEQ  ; orig: C - - - - - 0x014356 05:8346: F0 10     BEQ bra_8358
bra_8348:  ; orig: bra_8348:
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x014358 05:8348: A9 C0     LDA #$C0
bra_834A:  ; orig: bra_834A:
    MOVE.B  #$17,D2  ; orig: C - - - - - 0x01435A 05:834A: A0 17     LDY #$17
    MOVE.B  ram_subscript,D1  ; orig: C - - - - - 0x01435C 05:834C: A6 13     LDX ram_subscript
    CMPI.B  #$03,D1  ; orig: C - - - - - 0x01435E 05:834E: E0 03     CPX #$03
    BEQ     bra_8355             ; BEQ  ; orig: C - - - - - 0x014360 05:8350: F0 03     BEQ bra_8355
    BSR     sub_848C             ; JSR -> BSR  ; orig: C - - - - - 0x014362 05:8352: 20 8C 84  JSR sub_848C
bra_8355:  ; orig: bra_8355:
    JMP     loc_8CA4  ; orig: C - - - - - 0x014365 05:8355: 4C A4 8C  JMP loc_8CA4
bra_8358:  ; orig: bra_8358:
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x014368 05:8358: A9 D0     LDA #$D0
    BNE     bra_834A             ; BNE  ; orig: C - - - - - 0x01436A 05:835A: D0 EE     BNE bra_834A    ; jm



ofs_017_835C_05:  ; orig: ofs_017_835C_05:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x01436C 05:835C: A9 00     LDA #$00
    MOVE.B  D0,ram_051C  ; orig: C - - - - - 0x01436E 05:835E: 8D 1C 05  STA ram_051C
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014371 05:8361: A5 98     LDA ram_dir_link
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x014373 05:8363: C9 04     CMP #$04
    BCS     bra_836B             ; BCS  ; orig: C - - - - - 0x014375 05:8365: B0 04     BCS bra_836B    ; co
    MOVE.B  #con_ppu_buf_4E,D2  ; orig: C - - - - - 0x014377 05:8367: A0 4E     LDY #con_ppu_buf_4E
    MOVE.B  D2,ram_ppu_load_index  ; orig: C - - - - - 0x014379 05:8369: 84 14     STY ram_ppu_load_ind
bra_836B:  ; orig: bra_836B:
    CMPI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01437B 05:836B: C9 08     CMP #con_dir_Up
    BNE     bra_837C             ; BNE  ; orig: C - - - - - 0x01437D 05:836D: D0 0D     BNE bra_837C
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01437F 05:836F: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014381 05:8371: 48        PHA
    MOVE.B  ram_next_map_location,D0  ; orig: C - - - - - 0x014382 05:8372: A5 EC     LDA ram_next_map_loc
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x014384 05:8374: 85 EB     STA ram_map_location
    BSR     sub_A8C4             ; JSR -> BSR  ; orig: C - - - - - 0x014386 05:8376: 20 C4 A8  JSR sub_A8C4
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014389 05:8379: 68        PLA
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x01438A 05:837A: 85 EB     STA ram_map_location
bra_837C:  ; orig: bra_837C:
    MOVE.B  ram_next_map_location,D2  ; orig: C - - - - - 0x01438C 05:837C: A4 EC     LDY ram_next_map_loc
    BSR     sub_B68D             ; JSR -> BSR  ; orig: C - - - - - 0x01438E 05:837E: 20 8D B6  JSR sub_B68D
    BEQ     bra_83A3             ; BEQ  ; orig: C - - - - - 0x014391 05:8381: F0 20     BEQ bra_83A3
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x014393 05:8383: A4 EB     LDY ram_map_location
    BSR     sub_B68D             ; JSR -> BSR  ; orig: C - - - - - 0x014395 05:8385: 20 8D B6  JSR sub_B68D
    BNE     bra_8397             ; BNE  ; orig: C - - - - - 0x014398 05:8388: D0 0D     BNE bra_8397
bra_838A:  ; orig: bra_838A:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01439A 05:838A: A9 00     LDA #$00
    MOVE.B  D0,ram_051F_script  ; orig: C - - - - - 0x01439C 05:838C: 8D 1F 05  STA ram_051F_script
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01439F 05:838F: A9 40     LDA #$40
    MOVE.B  D0,ram_051C  ; orig: C - - - - - 0x0143A1 05:8391: 8D 1C 05  STA ram_051C
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0143A4 05:8394: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x0143A6 05:8396: 60        RTS
bra_8397:  ; orig: bra_8397:
    MOVE.B  ram_051F_script,D0  ; orig: C - - - - - 0x0143A7 05:8397: AD 1F 05  LDA ram_051F_script
    BNE     bra_838A             ; BNE  ; orig: C - - - - - 0x0143AA 05:839A: D0 EE     BNE bra_838A
    BEQ     bra_83A3             ; BEQ  ; orig: C - - - - - 0x0143AC 05:839C: F0 05     BEQ bra_83A3    ; jm



ofs_017_839E_06:  ; orig: ofs_017_839E_06:
    BSR     sub_bat_74B7             ; JSR -> BSR  ; orig: C - - J - - 0x0143AE 05:839E: 20 B7 74  JSR sub_bat_74B7
    BNE     bra_83AD_RTS             ; BNE  ; orig: C - - - - - 0x0143B1 05:83A1: D0 0A     BNE bra_83AD_RTS
bra_83A3:  ; orig: bra_83A3:
    MOVE.B  ram_next_map_location,D0  ; orig: C - - - - - 0x0143B3 05:83A3: A5 EC     LDA ram_next_map_loc
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x0143B5 05:83A5: 85 EB     STA ram_map_location
    BSR     sub_83B2             ; JSR -> BSR  ; orig: C - - - - - 0x0143B7 05:83A7: 20 B2 83  JSR sub_83B2

; bzk optimize, JMP
    BSR     sub_bat_6C90             ; JSR -> BSR  ; orig: C - - - - - 0x0143BA 05:83AA: 20 90 6C  JSR sub_bat_6C90
bra_83AD_RTS:  ; orig: bra_83AD_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0143BD 05:83AD: 60        RTS



tbl_83AE_spr_data:  ; orig: tbl_83AE_spr_data:
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 0 - - - 0x0143BE 05:83AE: 27        .byte $27   ; spr_Y
    ; [DIRECTIVE] .BYTE $61  -- needs manual handling  ; orig: - D 0 - - - 0x0143BF 05:83AF: 61        .byte $61   ; spr_T
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x0143C0 05:83B0: 20        .byte $20   ; spr_A
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 0 - - - 0x0143C1 05:83B1: 58        .byte $58   ; spr_X



sub_83B2:  ; orig: sub_83B2:
loc_83B2:  ; orig: loc_83B2:
    MOVE.B  #$01,D0  ; orig: C D 0 - - - 0x0143C2 05:83B2: A9 01     LDA #$01    ; transi
    MOVE.B  D0,ram_screen_transition_flag  ; orig: C - - - - - 0x0143C4 05:83B4: 85 E3     STA ram_screen_trans
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x0143C6 05:83B6: A0 03     LDY #$03
bra_83B8_loop:  ; orig: bra_83B8_loop:
    MOVE.B  tbl_83AE_spr_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0143C8 05:83B8: B9 AE 83  LDA tbl_83AE_spr_dat
    MOVE.B  D0,ram_oam(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x0143CB 05:83BB: 99 00 02  STA ram_oam,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0143CE 05:83BE: 88        DEY
    BPL     bra_83B8_loop             ; BPL  ; orig: C - - - - - 0x0143CF 05:83BF: 10 F7     BPL bra_83B8_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0143D1 05:83C1: 60        RTS



sub_83C2:  ; orig: sub_83C2:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0143D2 05:83C2: A5 98     LDA ram_dir_link
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0143D4 05:83C4: 4A        LSR
    ANDI.B  #$05,D0  ; orig: C - - - - - 0x0143D5 05:83C5: 29 05     AND #$05    ; con_di
    MOVE.B  D0,ram_0000_t50_direction  ; orig: C - - - - - 0x0143D7 05:83C7: 85 00     STA ram_0000_t50_dir
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0143D9 05:83C9: A5 98     LDA ram_dir_link
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0143DB 05:83CB: 0A        ASL
    ANDI.B  #$0A,D0  ; orig: C - - - - - 0x0143DC 05:83CC: 29 0A     AND #$0A    ; con_di
    OR.B    ram_0000_t50_direction,D0  ; orig: C - - - - - 0x0143DE 05:83CE: 05 00     ORA ram_0000_t50_dir
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x0143E0 05:83D0: 85 EE     STA ram_00EE
    RTS                     ; RTS  ; orig: C - - - - - 0x0143E2 05:83D2: 60        RTS



tbl_83D3_nametale_attribute:  ; orig: tbl_83D3_nametale_attribute:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0143E3 05:83D3: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 0 - - - 0x0143E4 05:83D4: 55        .byte $55   ; 01
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 0 - - - 0x0143E5 05:83D5: AA        .byte $AA   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x0143E6 05:83D6: FF        .byte $FF   ; 03



sub_83D7:  ; orig: sub_83D7:
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0143E7 05:83D7: A8        TAY
    MOVE.B  ram_687E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0143E8 05:83D8: B9 7E 68  LDA ram_687E_map_dat
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0143EB 05:83DB: 29 03     AND #$03
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0143ED 05:83DD: AA        TAX
    MOVE.B  tbl_83D3_nametale_attribute(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0143EE 05:83DE: BD D3 83  LDA tbl_83D3_nametal
    MOVE.B  #$2F,D1  ; orig: C - - - - - 0x0143F1 05:83E1: A2 2F     LDX #$2F
bra_83E3_loop:  ; orig: bra_83E3_loop:
    MOVE.B  D0,ram_0530_nmt_attr_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0143F3 05:83E3: 9D 30 05  STA ram_0530_nmt_att
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0143F6 05:83E6: CA        DEX
    BPL     bra_83E3_loop             ; BPL  ; orig: C - - - - - 0x0143F7 05:83E7: 10 FA     BPL bra_83E3_loop
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0143F9 05:83E9: B9 FE 68  LDA ram_68FE_map_dat
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0143FC 05:83EC: 29 03     AND #$03
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0143FE 05:83EE: AA        TAX
    MOVE.B  #$09,D2  ; orig: C - - - - - 0x0143FF 05:83EF: A0 09     LDY #$09
bra_83F1_loop:  ; orig: bra_83F1_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014401 05:83F1: 98        TYA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x014402 05:83F2: 29 07     AND #$07
    BEQ     bra_8404             ; BEQ  ; orig: C - - - - - 0x014404 05:83F4: F0 0E     BEQ bra_8404
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x014406 05:83F6: C9 07     CMP #$07
    BEQ     bra_8404             ; BEQ  ; orig: C - - - - - 0x014408 05:83F8: F0 0A     BEQ bra_8404
    CMPI.B  #$21,D2  ; orig: C - - - - - 0x01440A 05:83FA: C0 21     CPY #$21
    BCS     bra_840A             ; BCS  ; orig: C - - - - - 0x01440C 05:83FC: B0 0C     BCS bra_840A
    MOVE.B  tbl_83D3_nametale_attribute(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01440E 05:83FE: BD D3 83  LDA tbl_83D3_nametal
    MOVE.B  D0,ram_0530_nmt_attr_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x014411 05:8401: 99 30 05  STA ram_0530_nmt_att
bra_8404:  ; orig: bra_8404:
loc_8404_loop:  ; orig: loc_8404_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C D 0 - - - 0x014414 05:8404: C8        INY
    CMPI.B  #$27,D2  ; orig: C - - - - - 0x014415 05:8405: C0 27     CPY #$27
    BCC     bra_83F1_loop             ; BCC  ; orig: C - - - - - 0x014417 05:8407: 90 E8     BCC bra_83F1_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x014419 05:8409: 60        RTS
bra_840A:  ; orig: bra_840A:
    MOVE.B  tbl_83D3_nametale_attribute(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01441A 05:840A: BD D3 83  LDA tbl_83D3_nametal
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01441D 05:840D: 29 0F     AND #$0F
    MOVE.B  D0,ram_0000_t63  ; orig: C - - - - - 0x01441F 05:840F: 85 00     STA ram_0000_t63
    MOVE.B  ram_0530_nmt_attr_buffer(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014421 05:8411: B9 30 05  LDA ram_0530_nmt_att
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x014424 05:8414: 29 F0     AND #$F0
    OR.B    ram_0000_t63,D0  ; orig: C - - - - - 0x014426 05:8416: 05 00     ORA ram_0000_t63
    MOVE.B  D0,ram_0530_nmt_attr_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x014428 05:8418: 99 30 05  STA ram_0530_nmt_att
    JMP     loc_8404_loop  ; orig: C - - - - - 0x01442B 05:841B: 4C 04 84  JMP loc_8404_loop



sub_0x01442E_screen_transition_handlers:  ; orig: sub_0x01442E_screen_transition_handlers:
    BSR     sub_8424             ; JSR -> BSR  ; orig: C - - - - - 0x01442E 05:841E: 20 24 84  JSR sub_8424
    JMP     loc_0x01F248  ; orig: C - - - - - 0x014431 05:8421: 4C 38 F2  JMP loc_0x01F248



sub_8424:  ; orig: sub_8424:
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014434 05:8424: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x014436 05:8426: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_018_8439_00  -- needs manual handling  ; orig: - D 0 - I - 0x014439 05:8429: 39 84     .word ofs_018_8439_0
    ; [DIRECTIVE] .WORD ofs_018_847E_01  -- needs manual handling  ; orig: - D 0 - I - 0x01443B 05:842B: 7E 84     .word ofs_018_847E_0
    ; [DIRECTIVE] .WORD ofs_018_8492_02  -- needs manual handling  ; orig: - D 0 - I - 0x01443D 05:842D: 92 84     .word ofs_018_8492_0
    ; [DIRECTIVE] .WORD ofs_018_84A4_03  -- needs manual handling  ; orig: - D 0 - I - 0x01443F 05:842F: A4 84     .word ofs_018_84A4_0
    ; [DIRECTIVE] .WORD ofs_018_84DF_04  -- needs manual handling  ; orig: - D 0 - I - 0x014441 05:8431: DF 84     .word ofs_018_84DF_0
    ; [DIRECTIVE] .WORD ofs_018_84E8_05  -- needs manual handling  ; orig: - D 0 - I - 0x014443 05:8433: E8 84     .word ofs_018_84E8_0
    ; [DIRECTIVE] .WORD ofs_018_84BA_06  -- needs manual handling  ; orig: - D 0 - I - 0x014445 05:8435: BA 84     .word ofs_018_84BA_0
    ; [DIRECTIVE] .WORD ofs_018_84CC_07  -- needs manual handling  ; orig: - D 0 - I - 0x014447 05:8437: CC 84     .word ofs_018_84CC_0



ofs_018_8439_00:  ; orig: ofs_018_8439_00:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x014449 05:8439: A9 00     LDA #$00
    MOVE.B  D0,ram_00E2_ppu_addr_lo  ; orig: C - - - - - 0x01444B 05:843B: 85 E2     STA ram_00E2_ppu_add
    MOVE.B  D0,ram_scroll_X  ; orig: C - - - - - 0x01444D 05:843D: 85 FD     STA ram_scroll_X
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01444F 05:843F: A9 08     LDA #con_dir_Up
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014451 05:8441: 24 98     BIT ram_dir_link
    BNE     bra_8471             ; BNE  ; orig: C - - - - - 0x014453 05:8443: D0 2C     BNE bra_8471
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014455 05:8445: 4A        LSR ; -> 04 con_dir_
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014456 05:8446: 24 98     BIT ram_dir_link
    BEQ     bra_8457             ; BEQ  ; orig: C - - - - - 0x014458 05:8448: F0 0D     BEQ bra_8457
    MOVE.B  #$21,D0  ; orig: C - - - - - 0x01445A 05:844A: A9 21     LDA #$21
    MOVE.B  D0,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x01445C 05:844C: 85 58     STA ram_0058_ppu_add
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01445E 05:844E: A9 FF     LDA #$FF
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x014460 05:8450: 85 E9     STA ram_00E9
loc_8452:  ; orig: loc_8452:
    ADDQ.B  #1,ram_subscript  ; orig: C D 0 - - - 0x014462 05:8452: E6 13     INC ram_subscript
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014464 05:8454: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x014466 05:8456: 60        RTS
bra_8457:  ; orig: bra_8457:
    MOVE.B  #$A0,D2  ; orig: C - - - - - 0x014467 05:8457: A0 A0     LDY #$A0
    MOVE.B  ram_dungeon_level,D1  ; orig: C - - - - - 0x014469 05:8459: A6 10     LDX ram_dungeon_leve
    BNE     bra_845F             ; BNE  ; orig: C - - - - - 0x01446B 05:845B: D0 02     BNE bra_845F    ; if

; if overworld
    MOVE.B  #$E0,D2  ; orig: C - - - - - 0x01446D 05:845D: A0 E0     LDY #$E0
bra_845F:  ; orig: bra_845F:
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01446F 05:845F: 4A        LSR
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x014470 05:8460: 24 98     BIT ram_dir_link
    BEQ     bra_846C             ; BEQ  ; orig: C - - - - - 0x014472 05:8462: F0 08     BEQ bra_846C
    MOVE.B  #$81,D2  ; orig: C - - - - - 0x014474 05:8464: A0 81     LDY #$81
    MOVE.B  ram_dungeon_level,D1  ; orig: C - - - - - 0x014476 05:8466: A6 10     LDX ram_dungeon_leve
    BNE     bra_846C             ; BNE  ; orig: C - - - - - 0x014478 05:8468: D0 02     BNE bra_846C    ; if

; if overworld
    MOVE.B  #$41,D2  ; orig: C - - - - - 0x01447A 05:846A: A0 41     LDY #$41
bra_846C:  ; orig: bra_846C:
    MOVE.B  D2,ram_00E8  ; orig: C - - - - - 0x01447C 05:846C: 84 E8     STY ram_00E8
    JMP     loc_8452  ; orig: C - - - - - 0x01447E 05:846E: 4C 52 84  JMP loc_8452
bra_8471:  ; orig: bra_8471:
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x014481 05:8471: A9 28     LDA #$28
    MOVE.B  D0,ram_0058_ppu_addr_hi  ; orig: C - - - - - 0x014483 05:8473: 85 58     STA ram_0058_ppu_add
    MOVE.B  #$16,D0  ; orig: C - - - - - 0x014485 05:8475: A9 16     LDA #$16
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x014487 05:8477: 85 E9     STA ram_00E9
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x014489 05:8479: A5 EB     LDA ram_map_location
    BSR     sub_83D7             ; JSR -> BSR  ; orig: C - - - - - 0x01448B 05:847B: 20 D7 83  JSR sub_83D7
ofs_018_847E_01:  ; orig: ofs_018_847E_01:
    BSR     sub_8484             ; JSR -> BSR  ; orig: C - - - - - 0x01448E 05:847E: 20 84 84  JSR sub_8484
    JMP     loc_8501  ; orig: C - - - - - 0x014491 05:8481: 4C 01 85  JMP loc_8501



sub_8484:  ; orig: sub_8484:

; out

; A =

; Y =
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x014494 05:8484: A9 D0     LDA #$D0
    MOVE.B  #$17,D2  ; orig: C - - - - - 0x014496 05:8486: A0 17     LDY #$17
    MOVE.B  ram_subscript,D1  ; orig: C - - - - - 0x014498 05:8488: A6 13     LDX ram_subscript
    BEQ     bra_8491_RTS             ; BEQ  ; orig: C - - - - - 0x01449A 05:848A: F0 05     BEQ bra_8491_RTS
sub_848C:  ; orig: sub_848C:

; in

; A =

; out

; A =

; Y =
    MOVE.B  #$2F,D2  ; orig: C - - - - - 0x01449C 05:848C: A0 2F     LDY #$2F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01449E 05:848E: 18        CLC
    ADDX.B  #$18,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01449F 05:848F: 69 18     ADC #$18
bra_8491_RTS:  ; orig: bra_8491_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0144A1 05:8491: 60        RTS



ofs_018_8492_02:  ; orig: ofs_018_8492_02:
    ADDQ.B  #1,ram_subscript  ; orig: C - - J - - 0x0144A2 05:8492: E6 13     INC ram_subscript
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x0144A4 05:8494: A5 15     LDA ram_frm_cnt
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0144A6 05:8496: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0144A7 05:8497: 69 01     ADC #$01
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0144A9 05:8499: 29 03     AND #$03
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x0144AB 05:849B: A4 10     LDY ram_dungeon_leve
    BNE     bra_84A1             ; BNE  ; orig: C - - - - - 0x0144AD 05:849D: D0 02     BNE bra_84A1    ; if

; if overworld
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0144AF 05:849F: 29 01     AND #$01
bra_84A1:  ; orig: bra_84A1:
    MOVE.B  D0,ram_00E6  ; orig: C - - - - - 0x0144B1 05:84A1: 85 E6     STA ram_00E6
    RTS                     ; RTS  ; orig: C - - - - - 0x0144B3 05:84A3: 60        RTS



ofs_018_84A4_03:  ; orig: ofs_018_84A4_03:
    BSR     sub_81DD             ; JSR -> BSR  ; orig: C - - J - - 0x0144B4 05:84A4: 20 DD 81  JSR sub_81DD
    BSR     sub_8506             ; JSR -> BSR  ; orig: C - - - - - 0x0144B7 05:84A7: 20 06 85  JSR sub_8506
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x0144BA 05:84AA: A5 13     LDA ram_subscript
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x0144BC 05:84AC: C9 03     CMP #$03
    BEQ     bra_84B9_RTS             ; BEQ  ; orig: C - - - - - 0x0144BE 05:84AE: F0 09     BEQ bra_84B9_RTS
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x0144C0 05:84B0: A0 FF     LDY #$FF
    MOVE.B  D2,ram_00E9  ; orig: C - - - - - 0x0144C2 05:84B2: 84 E9     STY ram_00E9
    MOVE.B  D2,ram_00ED  ; orig: C - - - - - 0x0144C4 05:84B4: 84 ED     STY ram_00ED
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0144C6 05:84B6: C8        INY ; 00
    MOVE.B  D2,ram_00E8  ; orig: C - - - - - 0x0144C7 05:84B7: 84 E8     STY ram_00E8
bra_84B9_RTS:  ; orig: bra_84B9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0144C9 05:84B9: 60        RTS



ofs_018_84BA_06:  ; orig: ofs_018_84BA_06:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - J - - 0x0144CA 05:84BA: A5 10     LDA ram_dungeon_leve
    BEQ     bra_84CC             ; BEQ  ; orig: C - - - - - 0x0144CC 05:84BC: F0 0E     BEQ bra_84CC    ; if

; if dungeon
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0144CE 05:84BE: A4 EB     LDY ram_map_location
    BSR     sub_B68D             ; JSR -> BSR  ; orig: C - - - - - 0x0144D0 05:84C0: 20 8D B6  JSR sub_B68D
    BEQ     bra_84CC             ; BEQ  ; orig: C - - - - - 0x0144D3 05:84C3: F0 07     BEQ bra_84CC
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0144D5 05:84C5: A9 00     LDA #$00
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x0144D7 05:84C7: 85 E9     STA ram_00E9
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0144D9 05:84C9: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x0144DB 05:84CB: 60        RTS
bra_84CC:  ; orig: bra_84CC:
ofs_018_84CC_07:  ; orig: ofs_018_84CC_07:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0144DC 05:84CC: A9 01     LDA #$01
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0144DE 05:84CE: 85 13     STA ram_subscript
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0144E0 05:84D0: 4A        LSR ; -> 00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0144E1 05:84D1: 85 11     STA ram_0011_screen_

; bzk optimize, useless STA
    MOVE.B  D0,ram_010C_useless  ; orig: C - - - - - 0x0144E3 05:84D3: 8D 0C 01  STA ram_010C_useless
    MOVE.B  D0,ram_00E7  ; orig: C - - - - - 0x0144E6 05:84D6: 85 E7     STA ram_00E7
    MOVE.B  D0,ram_screen_transition_flag  ; orig: C - - - - - 0x0144E8 05:84D8: 85 E3     STA ram_screen_trans
    MOVE.B  #con_script_04_screen_trans_end,D0  ; orig: C - - - - - 0x0144EA 05:84DA: A9 04     LDA #con_script_04_s
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x0144EC 05:84DC: 85 12     STA ram_script
    RTS                     ; RTS  ; orig: C - - - - - 0x0144EE 05:84DE: 60        RTS



ofs_018_84DF_04:  ; orig: ofs_018_84DF_04:
    MOVE.B  #con_dir_Up,D0  ; orig: C - - J - - 0x0144EF 05:84DF: A9 08     LDA #con_dir_Up
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x0144F1 05:84E1: 24 98     BIT ram_dir_link
    BEQ     bra_84E8             ; BEQ  ; orig: C - - - - - 0x0144F3 05:84E3: F0 03     BEQ bra_84E8
    JMP     loc_8452  ; orig: C - - - - - 0x0144F5 05:84E5: 4C 52 84  JMP loc_8452
bra_84E8:  ; orig: bra_84E8:
ofs_018_84E8_05:  ; orig: ofs_018_84E8_05:
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x0144F8 05:84E8: A9 D0     LDA #$D0
    MOVE.B  #$17,D2  ; orig: C - - - - - 0x0144FA 05:84EA: A0 17     LDY #$17
    MOVE.B  ram_subscript,D1  ; orig: C - - - - - 0x0144FC 05:84EC: A6 13     LDX ram_subscript
    CMPI.B  #$04,D1  ; orig: C - - - - - 0x0144FE 05:84EE: E0 04     CPX #$04
    BEQ     bra_8501             ; BEQ  ; orig: C - - - - - 0x014500 05:84F0: F0 0F     BEQ bra_8501
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014502 05:84F2: 48        PHA
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014503 05:84F3: A5 98     LDA ram_dir_link
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x014505 05:84F5: C9 04     CMP #$04
    BCS     bra_84FD             ; BCS  ; orig: C - - - - - 0x014507 05:84F7: B0 04     BCS bra_84FD    ; co
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014509 05:84F9: A9 00     LDA #$00
    MOVE.B  D0,ram_005F  ; orig: C - - - - - 0x01450B 05:84FB: 85 5F     STA ram_005F
bra_84FD:  ; orig: bra_84FD:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01450D 05:84FD: 68        PLA
    BSR     sub_848C             ; JSR -> BSR  ; orig: C - - - - - 0x01450E 05:84FE: 20 8C 84  JSR sub_848C
bra_8501:  ; orig: bra_8501:
loc_8501:  ; orig: loc_8501:
    MOVE.B  #$23,D1  ; orig: C D 0 - - - 0x014511 05:8501: A2 23     LDX #$23
    JMP     loc_8CA6  ; orig: C - - - - - 0x014513 05:8503: 4C A6 8C  JMP loc_8CA6



sub_8506:  ; orig: sub_8506:
    MOVE.B  ram_00E9,D0  ; orig: C - - - - - 0x014516 05:8506: A5 E9     LDA ram_00E9
    CMPI.B  #$16,D0  ; orig: C - - - - - 0x014518 05:8508: C9 16     CMP #$16
    BCS     bra_8515             ; BCS  ; orig: C - - - - - 0x01451A 05:850A: B0 09     BCS bra_8515
    CMP.B   ram_00ED,D0  ; orig: C - - - - - 0x01451C 05:850C: C5 ED     CMP ram_00ED
    BEQ     bra_8520_RTS             ; BEQ  ; orig: C - - - - - 0x01451E 05:850E: F0 10     BEQ bra_8520_RTS
    MOVE.B  D0,ram_00ED  ; orig: C - - - - - 0x014520 05:8510: 85 ED     STA ram_00ED
    JMP     loc_A924  ; orig: C - - - - - 0x014522 05:8512: 4C 24 A9  JMP loc_A924
bra_8515:  ; orig: bra_8515:
    MOVE.B  ram_00E8,D0  ; orig: C - - - - - 0x014525 05:8515: A5 E8     LDA ram_00E8
    BEQ     bra_8520_RTS             ; BEQ  ; orig: C - - - - - 0x014527 05:8517: F0 07     BEQ bra_8520_RTS
    CMPI.B  #$21,D0  ; orig: C - - - - - 0x014529 05:8519: C9 21     CMP #$21
    BCS     bra_8520_RTS             ; BCS  ; orig: C - - - - - 0x01452B 05:851B: B0 03     BCS bra_8520_RTS
    JMP     loc_A8DE_move_curtain  ; orig: C - - - - - 0x01452D 05:851D: 4C DE A8  JMP loc_A8DE_move_cu
bra_8520_RTS:  ; orig: bra_8520_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014530 05:8520: 60        RTS



sub_0x014531:  ; orig: sub_0x014531:
bra_8521_infinite_loop:  ; orig: bra_8521_infinite_loop:
    BSR     PPU_READ_2002  ; read VDP status → D0  ; was: C - - - - - 0x014531 05:8521: AD 02 20  LDA $2002
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x014534 05:8524: 29 40     AND #$40    ; bzk op
    BEQ     bra_8521_infinite_loop             ; BEQ  ; orig: C - - - - - 0x014536 05:8526: F0 F9     BEQ bra_8521_infinit
    BSR     PPU_READ_2002  ; read VDP status → D0  ; was: C - - - - - 0x014538 05:8528: AD 02 20  LDA $2002
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01453B 05:852B: A0 03     LDY #$03
bra_852D_garbage_loop:  ; orig: bra_852D_garbage_loop:
    MOVE.B  #$30,D1  ; orig: C - - - - - 0x01453D 05:852D: A2 30     LDX #$30
bra_852F_garbage_loop:  ; orig: bra_852F_garbage_loop:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01453F 05:852F: CA        DEX
    BPL     bra_852F_garbage_loop             ; BPL  ; orig: C - - - - - 0x014540 05:8530: 10 FD     BPL bra_852F_garbage
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014542 05:8532: 88        DEY
    BPL     bra_852D_garbage_loop             ; BPL  ; orig: C - - - - - 0x014543 05:8533: 10 F8     BPL bra_852D_garbage

; Y = FF
    NOP  ; orig: C - - - - - 0x014545 05:8535: EA        NOP
    NOP  ; orig: C - - - - - 0x014546 05:8536: EA        NOP
    NOP  ; orig: C - - - - - 0x014547 05:8537: EA        NOP
    NOP  ; orig: C - - - - - 0x014548 05:8538: EA        NOP
    NOP  ; orig: C - - - - - 0x014549 05:8539: EA        NOP
    NOP  ; orig: C - - - - - 0x01454A 05:853A: EA        NOP
    NOP  ; orig: C - - - - - 0x01454B 05:853B: EA        NOP
    NOP  ; orig: C - - - - - 0x01454C 05:853C: EA        NOP
    NOP  ; orig: C - - - - - 0x01454D 05:853D: EA        NOP
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01454E 05:853E: A5 12     LDA ram_script
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x014550 05:8540: C9 08     CMP #$08
    BCS     bra_858C             ; BCS  ; orig: C - - - - - 0x014552 05:8542: B0 48     BCS bra_858C
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014554 05:8544: A5 13     LDA ram_subscript
    BEQ     bra_858B_RTS             ; BEQ  ; orig: C - - - - - 0x014556 05:8546: F0 43     BEQ bra_858B_RTS
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014558 05:8548: A5 98     LDA ram_dir_link
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01455A 05:854A: C9 04     CMP #$04    ; check 
    BCC     bra_856D             ; BCC  ; orig: C - - - - - 0x01455C 05:854C: 90 1F     BCC bra_856D
    MOVE.B  #$5E,D2  ; orig: C - - - - - 0x01455E 05:854E: A0 5E     LDY #$5E
bra_8550_garbage_loop:  ; orig: bra_8550_garbage_loop:
    NOP  ; orig: C - - - - - 0x014560 05:8550: EA        NOP
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014561 05:8551: 88        DEY
    BPL     bra_8550_garbage_loop             ; BPL  ; orig: C - - - - - 0x014562 05:8552: 10 FC     BPL bra_8550_garbage
    NOP  ; orig: C - - - - - 0x014564 05:8554: EA        NOP
    NOP  ; orig: C - - - - - 0x014565 05:8555: EA        NOP
    NOP  ; orig: C - - - - - 0x014566 05:8556: EA        NOP
    NOP  ; orig: C - - - - - 0x014567 05:8557: EA        NOP
    NOP  ; orig: C - - - - - 0x014568 05:8558: EA        NOP
    BSR     PPU_READ_2002  ; read VDP status → D0  ; was: C - - - - - 0x014569 05:8559: AD 02 20  LDA $2002
    MOVE.B  ram_0058_ppu_addr_hi,D0  ; orig: C - - - - - 0x01456C 05:855C: A5 58     LDA ram_0058_ppu_add
    MOVE.B  ram_00E2_ppu_addr_lo,D2  ; orig: C - - - - - 0x01456E 05:855E: A4 E2     LDY ram_00E2_ppu_add
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2006 (VRAM addr)  ; was: C - - - - - 0x014570 05:8560: 8D 06 20  STA $2006
    BSR     PPU_WRITE_2006
    MOVE.B  D2,D0  ; prep for PPU_WRITE_2006 (VRAM addr)  ; was: C - - - - - 0x014573 05:8563: 8C 06 20  STY $2006
    BSR     PPU_WRITE_2006
    BSR     PPU_READ_2007  ; read VRAM data → D0  ; was: C - - - - - 0x014576 05:8566: AD 07 20  LDA $2007
    BSR     PPU_READ_2007  ; read VRAM data → D0  ; was: C - - - - - 0x014579 05:8569: AD 07 20  LDA $2007
    RTS                     ; RTS  ; orig: C - - - - - 0x01457C 05:856C: 60        RTS
bra_856D:  ; orig: bra_856D:
    MOVE.B  #$5E,D2  ; orig: C - - - - - 0x01457D 05:856D: A0 5E     LDY #$5E
bra_856F_garbage_loop:  ; orig: bra_856F_garbage_loop:
    NOP  ; orig: C - - - - - 0x01457F 05:856F: EA        NOP
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014580 05:8570: 88        DEY
    BPL     bra_856F_garbage_loop             ; BPL  ; orig: C - - - - - 0x014581 05:8571: 10 FC     BPL bra_856F_garbage
    NOP  ; orig: C - - - - - 0x014583 05:8573: EA        NOP
    NOP  ; orig: C - - - - - 0x014584 05:8574: EA        NOP
    NOP  ; orig: C - - - - - 0x014585 05:8575: EA        NOP
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x014586 05:8576: A5 FF     LDA ram_for_2000
    ANDI.B  #$FE,D0  ; orig: C - - - - - 0x014588 05:8578: 29 FE     AND #$FE
    OR.B    ram_005F,D0  ; orig: C - - - - - 0x01458A 05:857A: 05 5F     ORA ram_005F
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x01458C 05:857C: 85 FF     STA ram_for_2000
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2000  ; was: C - - - - - 0x01458E 05:857E: 8D 00 20  STA $2000
    BSR     PPU_WRITE_2000
    MOVE.B  ram_scroll_X,D0  ; orig: C - - - - - 0x014591 05:8581: A5 FD     LDA ram_scroll_X
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2005 (scroll)  ; was: C - - - - - 0x014593 05:8583: 8D 05 20  STA $2005
    BSR     PPU_WRITE_2005
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014596 05:8586: A9 00     LDA #$00    ; scroll
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2005 (scroll)  ; was: C - - - - - 0x014598 05:8588: 8D 05 20  STA $2005
    BSR     PPU_WRITE_2005
bra_858B_RTS:  ; orig: bra_858B_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01459B 05:858B: 60        RTS
bra_858C:  ; orig: bra_858C:
    CMPI.B  #$11,D0  ; orig: C - - - - - 0x01459C 05:858C: C9 11     CMP #$11
    BCS     bra_8593             ; BCS  ; orig: C - - - - - 0x01459E 05:858E: B0 03     BCS bra_8593
    JMP     loc_0x01E635_disable_rendering_and_nmi  ; orig: C - - - - - 0x0145A0 05:8590: 4C 25 E6  JMP loc_0x01E635_dis
bra_8593:  ; orig: bra_8593:
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x0145A3 05:8593: A5 FF     LDA ram_for_2000
    ORI.B   #$01,D0  ; orig: C - - - - - 0x0145A5 05:8595: 09 01     ORA #$01
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x0145A7 05:8597: 85 FF     STA ram_for_2000
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2000  ; was: C - - - - - 0x0145A9 05:8599: 8D 00 20  STA $2000
    BSR     PPU_WRITE_2000
    RTS                     ; RTS  ; orig: C - - - - - 0x0145AC 05:859C: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145AD 05:859D: FF        .byte $FF, $FF, $FF 
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145B0 05:85A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145C0 05:85B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145D0 05:85C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145E0 05:85D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0145F0 05:85E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x014600 05:85F0: FF        .byte $FF, $FF, $FF,



ofs_main_script_1_0x014610_08_prepare_save_menu:  ; orig: ofs_main_script_1_0x014610_08_prepare_save_menu:

; con_script_save_menu
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - J - - 0x014610 05:8600: 20 25 E6  JSR sub_0x01E635_dis
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014613 05:8603: A5 13     LDA ram_subscript
    BNE     bra_8613             ; BNE  ; orig: C - - - - - 0x014615 05:8605: D0 0C     BNE bra_8613
    ; (empty translation for STA)  ; orig: C - - - - - 0x014617 05:8607: 8D 5A 00  STA a: ram_005A
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - - - - 0x01461A 05:860A: 20 6D E4  JSR sub_0x01E47D_cle
    BSR     sub_0x01EA3B_set_tunic_color             ; JSR -> BSR  ; orig: C - - - - - 0x01461D 05:860D: 20 2B EA  JSR sub_0x01EA3B_set
    JMP     loc_0x01EA10_clear_room_history  ; orig: C - - - - - 0x014620 05:8610: 4C 00 EA  JMP loc_0x01EA10_cle
bra_8613:  ; orig: bra_8613:
    MOVE.B  #con_ppu_buf_continue,D0  ; orig: C - - - - - 0x014623 05:8613: A9 04     LDA #con_ppu_buf_con
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x014625 05:8615: 85 14     STA ram_ppu_load_ind
    JMP     loc_bat_6C90  ; orig: C - - - - - 0x014627 05:8617: 4C 90 6C  JMP loc_bat_6C90



ofs_main_script_1_0x01462A_0D:  ; orig: ofs_main_script_1_0x01462A_0D:

; con_script_0D
    BSR     sub_0x01E47D_clear_screen             ; JSR -> BSR  ; orig: C - - J - - 0x01462A 05:861A: 20 6D E4  JSR sub_0x01E47D_cle
    BSR     sub_B4AC_check_battery_integrity             ; JSR -> BSR  ; orig: C - - - - - 0x01462D 05:861D: 20 AC B4  JSR sub_B4AC_check_b
    BCS     bra_8625_battery_is_not_ok             ; BCS  ; orig: C - - - - - 0x014630 05:8620: B0 03     BCS bra_8625_battery
    JMP     loc_bat_6C90  ; orig: C - - - - - 0x014632 05:8622: 4C 90 6C  JMP loc_bat_6C90
bra_8625_battery_is_not_ok:  ; orig: bra_8625_battery_is_not_ok:
    JMP     loc_0x01FF60_RESET_vector  ; orig: - - - - - - 0x014635 05:8625: 4C 50 FF  JMP loc_0x01FF60_RES



ofs_main_script_1_0x014638_10:  ; orig: ofs_main_script_1_0x014638_10:

; con_script_10
    MOVE.B  #$00,D1  ; orig: C - - J - - 0x014638 05:8628: A2 00     LDX #$00
    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x01463A 05:862A: 20 F4 ED  JSR sub_0x01EE04_fin
    CMPI.B  #$24,D0  ; orig: C - - - - - 0x01463D 05:862D: C9 24     CMP #$24
    BNE     bra_8643             ; BNE  ; orig: C - - - - - 0x01463F 05:862F: D0 12     BNE bra_8643
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014641 05:8631: A9 00     LDA #$00
    MOVE.B  D0,ram_0619  ; orig: C - - - - - 0x014643 05:8633: 8D 19 06  STA ram_0619
    MOVE.B  #con_sfx_3_walking,D0  ; orig: C - - - - - 0x014646 05:8636: A9 08     LDA #con_sfx_3_walki
    MOVE.B  D0,ram_sfx_3  ; orig: C - - - - - 0x014648 05:8638: 8D 03 06  STA ram_sfx_3
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01464B 05:863B: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01464D 05:863D: 18        CLC
    ADDX.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01464E 05:863E: 69 10     ADC #$10
    MOVE.B  D0,ram_0412  ; orig: C - - - - - 0x014650 05:8640: 8D 12 04  STA ram_0412
bra_8643:  ; orig: bra_8643:
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x014653 05:8643: E6 11     INC ram_0011_screen_
    RTS                     ; RTS  ; orig: C - - - - - 0x014655 05:8645: 60        RTS



tbl_8646_enemy_spawn_positions_lo:  ; orig: tbl_8646_enemy_spawn_positions_lo:
    ; [DIRECTIVE] .BYTE < off_864E_01_right  -- needs manual handling  ; orig: - D 0 - - - 0x014656 05:8646: 4E        .byte < off_864E_01_
    ; [DIRECTIVE] .BYTE < off_8657_02_left  -- needs manual handling  ; orig: - D 0 - - - 0x014657 05:8647: 57        .byte < off_8657_02_
    ; [DIRECTIVE] .BYTE < off_8660_04_down  -- needs manual handling  ; orig: - D 0 - - - 0x014658 05:8648: 60        .byte < off_8660_04_
    ; [DIRECTIVE] .BYTE < off_8669_08_up  -- needs manual handling  ; orig: - D 0 - - - 0x014659 05:8649: 69        .byte < off_8669_08_



tbl_864A_enemy_spawn_positions_hi:  ; orig: tbl_864A_enemy_spawn_positions_hi:
    ; [DIRECTIVE] .BYTE > off_864E_01_right  -- needs manual handling  ; orig: - D 0 - - - 0x01465A 05:864A: 86        .byte > off_864E_01_
    ; [DIRECTIVE] .BYTE > off_8657_02_left  -- needs manual handling  ; orig: - D 0 - - - 0x01465B 05:864B: 86        .byte > off_8657_02_
    ; [DIRECTIVE] .BYTE > off_8660_04_down  -- needs manual handling  ; orig: - D 0 - - - 0x01465C 05:864C: 86        .byte > off_8660_04_
    ; [DIRECTIVE] .BYTE > off_8669_08_up  -- needs manual handling  ; orig: - D 0 - - - 0x01465D 05:864D: 86        .byte > off_8669_08_



off_864E_01_right:  ; orig: off_864E_01_right:
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 0 - I - 0x01465E 05:864E: 55        .byte $55   ;
    ; [DIRECTIVE] .BYTE $B5  -- needs manual handling  ; orig: - D 0 - I - 0x01465F 05:864F: B5        .byte $B5   ;
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 0 - I - 0x014660 05:8650: 78        .byte $78   ;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 0 - I - 0x014661 05:8651: 98        .byte $98   ;
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 0 - I - 0x014662 05:8652: 7A        .byte $7A   ;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 0 - I - 0x014663 05:8653: 9A        .byte $9A   ;
    ; [DIRECTIVE] .BYTE $6C  -- needs manual handling  ; orig: - D 0 - I - 0x014664 05:8654: 6C        .byte $6C   ;
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 0 - I - 0x014665 05:8655: AC        .byte $AC   ;
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 0 - I - 0x014666 05:8656: 8D        .byte $8D   ;



off_8657_02_left:  ; orig: off_8657_02_left:
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 0 - I - 0x014667 05:8657: 82        .byte $82   ;
    ; [DIRECTIVE] .BYTE $63  -- needs manual handling  ; orig: - D 0 - I - 0x014668 05:8658: 63        .byte $63   ;
    ; [DIRECTIVE] .BYTE $A3  -- needs manual handling  ; orig: - D 0 - I - 0x014669 05:8659: A3        .byte $A3   ;
    ; [DIRECTIVE] .BYTE $75  -- needs manual handling  ; orig: - D 0 - I - 0x01466A 05:865A: 75        .byte $75   ;
    ; [DIRECTIVE] .BYTE $95  -- needs manual handling  ; orig: - D 0 - I - 0x01466B 05:865B: 95        .byte $95   ;
    ; [DIRECTIVE] .BYTE $77  -- needs manual handling  ; orig: - D 0 - I - 0x01466C 05:865C: 77        .byte $77   ;
    ; [DIRECTIVE] .BYTE $97  -- needs manual handling  ; orig: - D 0 - I - 0x01466D 05:865D: 97        .byte $97   ;
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 0 - I - 0x01466E 05:865E: 5A        .byte $5A   ;
    ; [DIRECTIVE] .BYTE $BA  -- needs manual handling  ; orig: - D 0 - I - 0x01466F 05:865F: BA        .byte $BA   ;



off_8660_04_down:  ; orig: off_8660_04_down:
    ; [DIRECTIVE] .BYTE $A3  -- needs manual handling  ; orig: - D 0 - I - 0x014670 05:8660: A3        .byte $A3   ;
    ; [DIRECTIVE] .BYTE $75  -- needs manual handling  ; orig: - D 0 - I - 0x014671 05:8661: 75        .byte $75   ;
    ; [DIRECTIVE] .BYTE $B5  -- needs manual handling  ; orig: - D 0 - I - 0x014672 05:8662: B5        .byte $B5   ;
    ; [DIRECTIVE] .BYTE $96  -- needs manual handling  ; orig: - D 0 - I - 0x014673 05:8663: 96        .byte $96   ;
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x014674 05:8664: 87        .byte $87   ;
    ; [DIRECTIVE] .BYTE $99  -- needs manual handling  ; orig: - D 0 - I - 0x014675 05:8665: 99        .byte $99   ;
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 0 - I - 0x014676 05:8666: 7A        .byte $7A   ;
    ; [DIRECTIVE] .BYTE $BA  -- needs manual handling  ; orig: - D 0 - I - 0x014677 05:8667: BA        .byte $BA   ;
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 0 - I - 0x014678 05:8668: AC        .byte $AC   ;



off_8669_08_up:  ; orig: off_8669_08_up:
    ; [DIRECTIVE] .BYTE $63  -- needs manual handling  ; orig: - D 0 - I - 0x014679 05:8669: 63        .byte $63   ;
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 0 - I - 0x01467A 05:866A: 55        .byte $55   ;
    ; [DIRECTIVE] .BYTE $95  -- needs manual handling  ; orig: - D 0 - I - 0x01467B 05:866B: 95        .byte $95   ;
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 0 - I - 0x01467C 05:866C: 76        .byte $76   ;
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 0 - I - 0x01467D 05:866D: 88        .byte $88   ;
    ; [DIRECTIVE] .BYTE $79  -- needs manual handling  ; orig: - D 0 - I - 0x01467E 05:866E: 79        .byte $79   ;
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 0 - I - 0x01467F 05:866F: 5A        .byte $5A   ;
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 0 - I - 0x014680 05:8670: 9A        .byte $9A   ;
    ; [DIRECTIVE] .BYTE $6C  -- needs manual handling  ; orig: - D 0 - I - 0x014681 05:8671: 6C        .byte $6C   ;



tbl_8672:  ; orig: tbl_8672:
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x014682 05:8672: 18        .byte $18   ;
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 0 - - - 0x014683 05:8673: E8        .byte $E8   ;
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 0 - - - 0x014684 05:8674: 28        .byte $28   ;
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 0 - - - 0x014685 05:8675: D8        .byte $D8   ;



_off007_8676_62:  ; orig: _off007_8676_62:
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x014686 05:8676: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x014687 05:8677: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x014688 05:8678: 04        .byte con_obj_id_04 
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x014689 05:8679: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x01468A 05:867A: 04        .byte con_obj_id_04 



_off007_867B_63:  ; orig: _off007_867B_63:
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x01468B 05:867B: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x01468C 05:867C: 04        .byte con_obj_id_04 
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x01468D 05:867D: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x01468E 05:867E: 04        .byte con_obj_id_04 



_off007_867F_64:  ; orig: _off007_867F_64:
    ; [DIRECTIVE] .BYTE con_obj_id_1A  -- needs manual handling  ; orig: - D 0 - I - 0x01468F 05:867F: 1A        .byte con_obj_id_1A 
    ; [DIRECTIVE] .BYTE con_obj_id_1A  -- needs manual handling  ; orig: - D 0 - I - 0x014690 05:8680: 1A        .byte con_obj_id_1A 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x014691 05:8681: 02        .byte con_obj_id_02 
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x014692 05:8682: 01        .byte con_obj_id_01 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x014693 05:8683: 02        .byte con_obj_id_02 
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x014694 05:8684: 01        .byte con_obj_id_01 



_off007_8685_65:  ; orig: _off007_8685_65:
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x014695 05:8685: 01        .byte con_obj_id_01 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x014696 05:8686: 02        .byte con_obj_id_02 
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x014697 05:8687: 01        .byte con_obj_id_01 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x014698 05:8688: 02        .byte con_obj_id_02 



_off007_8689_66:  ; orig: _off007_8689_66:
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x014699 05:8689: 01        .byte con_obj_id_01 
    ; [DIRECTIVE] .BYTE con_obj_id_0F  -- needs manual handling  ; orig: - D 0 - I - 0x01469A 05:868A: 0F        .byte con_obj_id_0F 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x01469B 05:868B: 02        .byte con_obj_id_02 
    ; [DIRECTIVE] .BYTE con_obj_id_01  -- needs manual handling  ; orig: - D 0 - I - 0x01469C 05:868C: 01        .byte con_obj_id_01 
    ; [DIRECTIVE] .BYTE con_obj_id_10  -- needs manual handling  ; orig: - D 0 - I - 0x01469D 05:868D: 10        .byte con_obj_id_10 
    ; [DIRECTIVE] .BYTE con_obj_id_02  -- needs manual handling  ; orig: - D 0 - I - 0x01469E 05:868E: 02        .byte con_obj_id_02 



_off007_868F_67:  ; orig: _off007_868F_67:
    ; [DIRECTIVE] .BYTE con_obj_id_0F  -- needs manual handling  ; orig: - D 0 - I - 0x01469F 05:868F: 0F        .byte con_obj_id_0F 
    ; [DIRECTIVE] .BYTE con_obj_id_1A  -- needs manual handling  ; orig: - D 0 - I - 0x0146A0 05:8690: 1A        .byte con_obj_id_1A 
    ; [DIRECTIVE] .BYTE con_obj_id_10  -- needs manual handling  ; orig: - D 0 - I - 0x0146A1 05:8691: 10        .byte con_obj_id_10 
    ; [DIRECTIVE] .BYTE con_obj_id_1A  -- needs manual handling  ; orig: - D 0 - I - 0x0146A2 05:8692: 1A        .byte con_obj_id_1A 
    ; [DIRECTIVE] .BYTE con_obj_id_0F  -- needs manual handling  ; orig: - D 0 - I - 0x0146A3 05:8693: 0F        .byte con_obj_id_0F 
    ; [DIRECTIVE] .BYTE con_obj_id_1A  -- needs manual handling  ; orig: - D 0 - I - 0x0146A4 05:8694: 1A        .byte con_obj_id_1A 



_off007_8695_68:  ; orig: _off007_8695_68:
    ; [DIRECTIVE] .BYTE con_obj_id_09  -- needs manual handling  ; orig: - D 0 - I - 0x0146A5 05:8695: 09        .byte con_obj_id_09 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146A6 05:8696: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146A7 05:8697: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146A8 05:8698: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146A9 05:8699: 08        .byte con_obj_id_08 



_off007_869A_69:  ; orig: _off007_869A_69:
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146AA 05:869A: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_07  -- needs manual handling  ; orig: - D 0 - I - 0x0146AB 05:869B: 07        .byte con_obj_id_07 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146AC 05:869C: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_07  -- needs manual handling  ; orig: - D 0 - I - 0x0146AD 05:869D: 07        .byte con_obj_id_07 



_off007_869E_6A:  ; orig: _off007_869E_6A:
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146AE 05:869E: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_09  -- needs manual handling  ; orig: - D 0 - I - 0x0146AF 05:869F: 09        .byte con_obj_id_09 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146B0 05:86A0: 08        .byte con_obj_id_08 
    ; [DIRECTIVE] .BYTE con_obj_id_09  -- needs manual handling  ; orig: - D 0 - I - 0x0146B1 05:86A1: 09        .byte con_obj_id_09 
    ; [DIRECTIVE] .BYTE con_obj_id_08  -- needs manual handling  ; orig: - D 0 - I - 0x0146B2 05:86A2: 08        .byte con_obj_id_08 



_off007_86A3_6B:  ; orig: _off007_86A3_6B:
    ; [DIRECTIVE] .BYTE con_obj_id_0A  -- needs manual handling  ; orig: - D 0 - I - 0x0146B3 05:86A3: 0A        .byte con_obj_id_0A 
    ; [DIRECTIVE] .BYTE con_obj_id_07  -- needs manual handling  ; orig: - D 0 - I - 0x0146B4 05:86A4: 07        .byte con_obj_id_07 
    ; [DIRECTIVE] .BYTE con_obj_id_0A  -- needs manual handling  ; orig: - D 0 - I - 0x0146B5 05:86A5: 0A        .byte con_obj_id_0A 
    ; [DIRECTIVE] .BYTE con_obj_id_07  -- needs manual handling  ; orig: - D 0 - I - 0x0146B6 05:86A6: 07        .byte con_obj_id_07 
    ; [DIRECTIVE] .BYTE con_obj_id_07  -- needs manual handling  ; orig: - D 0 - I - 0x0146B7 05:86A7: 07        .byte con_obj_id_07 



_off007_86A8_6C:  ; orig: _off007_86A8_6C:
    ; [DIRECTIVE] .BYTE con_obj_id_03  -- needs manual handling  ; orig: - D 0 - I - 0x0146B8 05:86A8: 03        .byte con_obj_id_03 
    ; [DIRECTIVE] .BYTE con_obj_id_0A  -- needs manual handling  ; orig: - D 0 - I - 0x0146B9 05:86A9: 0A        .byte con_obj_id_0A 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x0146BA 05:86AA: 04        .byte con_obj_id_04 
    ; [DIRECTIVE] .BYTE con_obj_id_0A  -- needs manual handling  ; orig: - D 0 - I - 0x0146BB 05:86AB: 0A        .byte con_obj_id_0A 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x0146BC 05:86AC: 04        .byte con_obj_id_04 
    ; [DIRECTIVE] .BYTE con_obj_id_04  -- needs manual handling  ; orig: - D 0 - I - 0x0146BD 05:86AD: 04        .byte con_obj_id_04 



_off007_86AE_6D:  ; orig: _off007_86AE_6D:
    ; [DIRECTIVE] .BYTE con_obj_id_4A  -- needs manual handling  ; orig: - D 0 - I - 0x0146BE 05:86AE: 4A        .byte con_obj_id_4A 
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146BF 05:86AF: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146C0 05:86B0: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146C1 05:86B1: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146C2 05:86B2: 13        .byte con_obj_id_13 
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146C3 05:86B3: 13        .byte con_obj_id_13 

; bzk garbage?
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146C4 05:86B4: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - - - - - - 0x0146C5 05:86B5: 13        .byte $13   ;



_off007_86B6_6E:  ; orig: _off007_86B6_6E:
    ; [DIRECTIVE] .BYTE con_obj_id_4A  -- needs manual handling  ; orig: - D 0 - I - 0x0146C6 05:86B6: 4A        .byte con_obj_id_4A 
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146C7 05:86B7: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146C8 05:86B8: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x0146C9 05:86B9: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CA 05:86BA: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CB 05:86BB: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CC 05:86BC: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CD 05:86BD: 1B        .byte con_obj_id_1B 



_off007_86BE_6F:  ; orig: _off007_86BE_6F:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CE 05:86BE: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146CF 05:86BF: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146D0 05:86C0: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146D1 05:86C1: 13        .byte con_obj_id_13 
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146D2 05:86C2: 13        .byte con_obj_id_13 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146D3 05:86C3: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146D4 05:86C4: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146D5 05:86C5: 1B        .byte con_obj_id_1B 



_off007_86C6_70:  ; orig: _off007_86C6_70:
    ; [DIRECTIVE] .BYTE con_obj_id_16  -- needs manual handling  ; orig: - D 0 - I - 0x0146D6 05:86C6: 16        .byte con_obj_id_16 
    ; [DIRECTIVE] .BYTE con_obj_id_30  -- needs manual handling  ; orig: - D 0 - I - 0x0146D7 05:86C7: 30        .byte con_obj_id_30 
    ; [DIRECTIVE] .BYTE con_obj_id_30  -- needs manual handling  ; orig: - D 0 - I - 0x0146D8 05:86C8: 30        .byte con_obj_id_30 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146D9 05:86C9: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x0146DA 05:86CA: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_16  -- needs manual handling  ; orig: - D 0 - I - 0x0146DB 05:86CB: 16        .byte con_obj_id_16 

; bzk garbage?
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146DC 05:86CC: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146DD 05:86CD: 00        .byte $00   ;



_off007_86CE_71:  ; orig: _off007_86CE_71:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146DE 05:86CE: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146DF 05:86CF: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146E0 05:86D0: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x0146E1 05:86D1: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x0146E2 05:86D2: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x0146E3 05:86D3: 24        .byte con_obj_id_24 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x0146E4 05:86D4: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x0146E5 05:86D5: 24        .byte con_obj_id_24 



_off007_86D6_72:  ; orig: _off007_86D6_72:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146E6 05:86D6: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146E7 05:86D7: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_12  -- needs manual handling  ; orig: - D 0 - I - 0x0146E8 05:86D8: 12        .byte con_obj_id_12 
    ; [DIRECTIVE] .BYTE con_obj_id_12  -- needs manual handling  ; orig: - D 0 - I - 0x0146E9 05:86D9: 12        .byte con_obj_id_12 
    ; [DIRECTIVE] .BYTE con_obj_id_12  -- needs manual handling  ; orig: - D 0 - I - 0x0146EA 05:86DA: 12        .byte con_obj_id_12 

; bzk garbage?
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146EB 05:86DB: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146EC 05:86DC: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0146ED 05:86DD: 00        .byte $00   ;



_off007_86DE_73:  ; orig: _off007_86DE_73:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146EE 05:86DE: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146EF 05:86DF: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146F0 05:86E0: 13        .byte con_obj_id_13 
    ; [DIRECTIVE] .BYTE con_obj_id_13  -- needs manual handling  ; orig: - D 0 - I - 0x0146F1 05:86E1: 13        .byte con_obj_id_13 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x0146F2 05:86E2: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x0146F3 05:86E3: 17        .byte con_obj_id_17 



_off007_86E4_74:  ; orig: _off007_86E4_74:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146F4 05:86E4: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146F5 05:86E5: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_0C  -- needs manual handling  ; orig: - D 0 - I - 0x0146F6 05:86E6: 0C        .byte con_obj_id_0C 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x0146F7 05:86E7: 0B        .byte con_obj_id_0B 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x0146F8 05:86E8: 0B        .byte con_obj_id_0B 
    ; [DIRECTIVE] .BYTE con_obj_id_30  -- needs manual handling  ; orig: - D 0 - I - 0x0146F9 05:86E9: 30        .byte con_obj_id_30 
    ; [DIRECTIVE] .BYTE con_obj_id_30  -- needs manual handling  ; orig: - D 0 - I - 0x0146FA 05:86EA: 30        .byte con_obj_id_30 
    ; [DIRECTIVE] .BYTE con_obj_id_30  -- needs manual handling  ; orig: - D 0 - I - 0x0146FB 05:86EB: 30        .byte con_obj_id_30 



_off007_86EC_75:  ; orig: _off007_86EC_75:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146FC 05:86EC: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x0146FD 05:86ED: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x0146FE 05:86EE: 05        .byte con_obj_id_05 
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x0146FF 05:86EF: 05        .byte con_obj_id_05 
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x014700 05:86F0: 05        .byte con_obj_id_05 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x014701 05:86F1: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x014702 05:86F2: 1B        .byte con_obj_id_1B 
    ; [DIRECTIVE] .BYTE con_obj_id_1B  -- needs manual handling  ; orig: - D 0 - I - 0x014703 05:86F3: 1B        .byte con_obj_id_1B 



_off007_86F4_76:  ; orig: _off007_86F4_76:
    ; [DIRECTIVE] .BYTE con_obj_id_4A  -- needs manual handling  ; orig: - D 0 - I - 0x014704 05:86F4: 4A        .byte con_obj_id_4A 
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x014705 05:86F5: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x014706 05:86F6: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x014707 05:86F7: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x014708 05:86F8: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x014709 05:86F9: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x01470A 05:86FA: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x01470B 05:86FB: 17        .byte con_obj_id_17 



_off007_86FC_77:  ; orig: _off007_86FC_77:
    ; [DIRECTIVE] .BYTE con_obj_id_4A  -- needs manual handling  ; orig: - D 0 - I - 0x01470C 05:86FC: 4A        .byte con_obj_id_4A 
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x01470D 05:86FD: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x01470E 05:86FE: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_null  -- needs manual handling  ; orig: - D 0 - I - 0x01470F 05:86FF: 00        .byte con_obj_id_nul
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x014710 05:8700: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x014711 05:8701: 24        .byte con_obj_id_24 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x014712 05:8702: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x014713 05:8703: 24        .byte con_obj_id_24 



_off007_8704_78:  ; orig: _off007_8704_78:
    ; [DIRECTIVE] .BYTE con_obj_id_16  -- needs manual handling  ; orig: - D 0 - I - 0x014714 05:8704: 16        .byte con_obj_id_16 
    ; [DIRECTIVE] .BYTE con_obj_id_0C  -- needs manual handling  ; orig: - D 0 - I - 0x014715 05:8705: 0C        .byte con_obj_id_0C 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x014716 05:8706: 0B        .byte con_obj_id_0B 
    ; [DIRECTIVE] .BYTE con_obj_id_0C  -- needs manual handling  ; orig: - D 0 - I - 0x014717 05:8707: 0C        .byte con_obj_id_0C 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x014718 05:8708: 0B        .byte con_obj_id_0B 
    ; [DIRECTIVE] .BYTE con_obj_id_16  -- needs manual handling  ; orig: - D 0 - I - 0x014719 05:8709: 16        .byte con_obj_id_16 



_off007_870A_79:  ; orig: _off007_870A_79:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x01471A 05:870A: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x01471B 05:870B: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x01471C 05:870C: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - D 0 - I - 0x01471D 05:870D: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - D 0 - I - 0x01471E 05:870E: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - D 0 - I - 0x01471F 05:870F: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - D 0 - I - 0x014720 05:8710: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - D 0 - I - 0x014721 05:8711: 27        .byte con_obj_id_27 



_off007_8712_7A:  ; orig: _off007_8712_7A:
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x014722 05:8712: 05        .byte con_obj_id_05 
    ; [DIRECTIVE] .BYTE con_obj_id_06  -- needs manual handling  ; orig: - D 0 - I - 0x014723 05:8713: 06        .byte con_obj_id_06 
    ; [DIRECTIVE] .BYTE con_obj_id_06  -- needs manual handling  ; orig: - D 0 - I - 0x014724 05:8714: 06        .byte con_obj_id_06 
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x014725 05:8715: 05        .byte con_obj_id_05 
    ; [DIRECTIVE] .BYTE con_obj_id_06  -- needs manual handling  ; orig: - D 0 - I - 0x014726 05:8716: 06        .byte con_obj_id_06 
    ; [DIRECTIVE] .BYTE con_obj_id_05  -- needs manual handling  ; orig: - D 0 - I - 0x014727 05:8717: 05        .byte con_obj_id_05 

; bzk garbage?
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x014728 05:8718: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x014729 05:8719: 00        .byte $00   ;



_off007_871A_7B:  ; orig: _off007_871A_7B:
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x01472A 05:871A: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x01472B 05:871B: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x01472C 05:871C: 24        .byte con_obj_id_24 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x01472D 05:871D: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x01472E 05:871E: 24        .byte con_obj_id_24 



_off007_871F_7C:  ; orig: _off007_871F_7C:
    ; [DIRECTIVE] .BYTE con_obj_id_2B  -- needs manual handling  ; orig: - D 0 - I - 0x01472F 05:871F: 2B        .byte con_obj_id_2B 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x014730 05:8720: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x014731 05:8721: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x014732 05:8722: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x014733 05:8723: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x014734 05:8724: 24        .byte con_obj_id_24 
    ; [DIRECTIVE] .BYTE con_obj_id_17  -- needs manual handling  ; orig: - D 0 - I - 0x014735 05:8725: 17        .byte con_obj_id_17 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x014736 05:8726: 24        .byte con_obj_id_24 



_off007_8727_7D:  ; orig: _off007_8727_7D:
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x014737 05:8727: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x014738 05:8728: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x014739 05:8729: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2C  -- needs manual handling  ; orig: - D 0 - I - 0x01473A 05:872A: 2C        .byte con_obj_id_2C 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x01473B 05:872B: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x01473C 05:872C: 24        .byte con_obj_id_24 
    ; [DIRECTIVE] .BYTE con_obj_id_23  -- needs manual handling  ; orig: - D 0 - I - 0x01473D 05:872D: 23        .byte con_obj_id_23 
    ; [DIRECTIVE] .BYTE con_obj_id_24  -- needs manual handling  ; orig: - D 0 - I - 0x01473E 05:872E: 24        .byte con_obj_id_24 



_off007_872F_7E:  ; orig: _off007_872F_7E:
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x01473F 05:872F: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x014740 05:8730: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - D 0 - I - 0x014741 05:8731: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2C  -- needs manual handling  ; orig: - D 0 - I - 0x014742 05:8732: 2C        .byte con_obj_id_2C 
    ; [DIRECTIVE] .BYTE con_obj_id_0C  -- needs manual handling  ; orig: - D 0 - I - 0x014743 05:8733: 0C        .byte con_obj_id_0C 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x014744 05:8734: 0B        .byte con_obj_id_0B 
    ; [DIRECTIVE] .BYTE con_obj_id_0C  -- needs manual handling  ; orig: - D 0 - I - 0x014745 05:8735: 0C        .byte con_obj_id_0C 
    ; [DIRECTIVE] .BYTE con_obj_id_0B  -- needs manual handling  ; orig: - D 0 - I - 0x014746 05:8736: 0B        .byte con_obj_id_0B 



_off007_8737_7F:  ; orig: _off007_8737_7F:
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - - - - - - 0x014747 05:8737: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - - - - - - 0x014748 05:8738: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2D  -- needs manual handling  ; orig: - - - - - - 0x014749 05:8739: 2D        .byte con_obj_id_2D 
    ; [DIRECTIVE] .BYTE con_obj_id_2C  -- needs manual handling  ; orig: - - - - - - 0x01474A 05:873A: 2C        .byte con_obj_id_2C 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - - - - - - 0x01474B 05:873B: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - - - - - - 0x01474C 05:873C: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - - - - - - 0x01474D 05:873D: 27        .byte con_obj_id_27 
    ; [DIRECTIVE] .BYTE con_obj_id_27  -- needs manual handling  ; orig: - - - - - - 0x01474E 05:873E: 27        .byte con_obj_id_27 



tbl_873F_enemy_groups:  ; orig: tbl_873F_enemy_groups:
    ; [DIRECTIVE] .WORD _off007_8676_62  -- needs manual handling  ; orig: - D 0 - - - 0x01474F 05:873F: 76 86     .word _off007_8676_6
    ; [DIRECTIVE] .WORD _off007_867B_63  -- needs manual handling  ; orig: - D 0 - - - 0x014751 05:8741: 7B 86     .word _off007_867B_6
    ; [DIRECTIVE] .WORD _off007_867F_64  -- needs manual handling  ; orig: - D 0 - - - 0x014753 05:8743: 7F 86     .word _off007_867F_6
    ; [DIRECTIVE] .WORD _off007_8685_65  -- needs manual handling  ; orig: - D 0 - - - 0x014755 05:8745: 85 86     .word _off007_8685_6
    ; [DIRECTIVE] .WORD _off007_8689_66  -- needs manual handling  ; orig: - D 0 - - - 0x014757 05:8747: 89 86     .word _off007_8689_6
    ; [DIRECTIVE] .WORD _off007_868F_67  -- needs manual handling  ; orig: - D 0 - - - 0x014759 05:8749: 8F 86     .word _off007_868F_6
    ; [DIRECTIVE] .WORD _off007_8695_68  -- needs manual handling  ; orig: - D 0 - - - 0x01475B 05:874B: 95 86     .word _off007_8695_6
    ; [DIRECTIVE] .WORD _off007_869A_69  -- needs manual handling  ; orig: - D 0 - - - 0x01475D 05:874D: 9A 86     .word _off007_869A_6
    ; [DIRECTIVE] .WORD _off007_869E_6A  -- needs manual handling  ; orig: - D 0 - - - 0x01475F 05:874F: 9E 86     .word _off007_869E_6
    ; [DIRECTIVE] .WORD _off007_86A3_6B  -- needs manual handling  ; orig: - D 0 - - - 0x014761 05:8751: A3 86     .word _off007_86A3_6
    ; [DIRECTIVE] .WORD _off007_86A8_6C  -- needs manual handling  ; orig: - D 0 - - - 0x014763 05:8753: A8 86     .word _off007_86A8_6
    ; [DIRECTIVE] .WORD _off007_86AE_6D  -- needs manual handling  ; orig: - D 0 - - - 0x014765 05:8755: AE 86     .word _off007_86AE_6
    ; [DIRECTIVE] .WORD _off007_86B6_6E  -- needs manual handling  ; orig: - D 0 - - - 0x014767 05:8757: B6 86     .word _off007_86B6_6
    ; [DIRECTIVE] .WORD _off007_86BE_6F  -- needs manual handling  ; orig: - D 0 - - - 0x014769 05:8759: BE 86     .word _off007_86BE_6
    ; [DIRECTIVE] .WORD _off007_86C6_70  -- needs manual handling  ; orig: - D 0 - - - 0x01476B 05:875B: C6 86     .word _off007_86C6_7
    ; [DIRECTIVE] .WORD _off007_86CE_71  -- needs manual handling  ; orig: - D 0 - - - 0x01476D 05:875D: CE 86     .word _off007_86CE_7
    ; [DIRECTIVE] .WORD _off007_86D6_72  -- needs manual handling  ; orig: - D 0 - - - 0x01476F 05:875F: D6 86     .word _off007_86D6_7
    ; [DIRECTIVE] .WORD _off007_86DE_73  -- needs manual handling  ; orig: - D 0 - - - 0x014771 05:8761: DE 86     .word _off007_86DE_7
    ; [DIRECTIVE] .WORD _off007_86E4_74  -- needs manual handling  ; orig: - D 0 - - - 0x014773 05:8763: E4 86     .word _off007_86E4_7
    ; [DIRECTIVE] .WORD _off007_86EC_75  -- needs manual handling  ; orig: - D 0 - - - 0x014775 05:8765: EC 86     .word _off007_86EC_7
    ; [DIRECTIVE] .WORD _off007_86F4_76  -- needs manual handling  ; orig: - D 0 - - - 0x014777 05:8767: F4 86     .word _off007_86F4_7
    ; [DIRECTIVE] .WORD _off007_86FC_77  -- needs manual handling  ; orig: - D 0 - - - 0x014779 05:8769: FC 86     .word _off007_86FC_7
    ; [DIRECTIVE] .WORD _off007_8704_78  -- needs manual handling  ; orig: - D 0 - - - 0x01477B 05:876B: 04 87     .word _off007_8704_7
    ; [DIRECTIVE] .WORD _off007_870A_79  -- needs manual handling  ; orig: - D 0 - - - 0x01477D 05:876D: 0A 87     .word _off007_870A_7
    ; [DIRECTIVE] .WORD _off007_8712_7A  -- needs manual handling  ; orig: - D 0 - - - 0x01477F 05:876F: 12 87     .word _off007_8712_7
    ; [DIRECTIVE] .WORD _off007_871A_7B  -- needs manual handling  ; orig: - D 0 - - - 0x014781 05:8771: 1A 87     .word _off007_871A_7
    ; [DIRECTIVE] .WORD _off007_871F_7C  -- needs manual handling  ; orig: - D 0 - - - 0x014783 05:8773: 1F 87     .word _off007_871F_7
    ; [DIRECTIVE] .WORD _off007_8727_7D  -- needs manual handling  ; orig: - D 0 - - - 0x014785 05:8775: 27 87     .word _off007_8727_7
    ; [DIRECTIVE] .WORD _off007_872F_7E  -- needs manual handling  ; orig: - D 0 - - - 0x014787 05:8777: 2F 87     .word _off007_872F_7
    ; [DIRECTIVE] .WORD _off007_8737_7F  -- needs manual handling  ; orig: - - - - - - 0x014789 05:8779: 37 87     .word _off007_8737_7



ofs_main_script_1_0x01478B_04:  ; orig: ofs_main_script_1_0x01478B_04:

; con_script_04_screen_trans_end
    MOVE.B  ram_subscript,D1  ; orig: C - - J - - 0x01478B 05:877B: A6 13     LDX ram_subscript
    BEQ     bra_87C6             ; BEQ  ; orig: C - - - - - 0x01478D 05:877D: F0 47     BEQ bra_87C6
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01478F 05:877F: CA        DEX
    BNE     bra_878E             ; BNE  ; orig: C - - - - - 0x014790 05:8780: D0 0C     BNE bra_878E
    MOVE.B  ram_00E9,D0  ; orig: C - - - - - 0x014792 05:8782: A5 E9     LDA ram_00E9
    BMI     bra_878B             ; BMI  ; orig: C - - - - - 0x014794 05:8784: 30 05     BMI bra_878B
    BSR     sub_AC16             ; JSR -> BSR  ; orig: C - - - - - 0x014796 05:8786: 20 16 AC  JSR sub_AC16
    BCC     bra_878D_RTS             ; BCC  ; orig: C - - - - - 0x014799 05:8789: 90 02     BCC bra_878D_RTS
bra_878B:  ; orig: bra_878B:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01479B 05:878B: E6 13     INC ram_subscript
bra_878D_RTS:  ; orig: bra_878D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01479D 05:878D: 60        RTS
bra_878E:  ; orig: bra_878E:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01479E 05:878E: CA        DEX
    BNE     bra_87B9             ; BNE  ; orig: C - - - - - 0x01479F 05:878F: D0 28     BNE bra_87B9
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0147A1 05:8791: A4 EB     LDY ram_map_location
    BSR     sub_B68D             ; JSR -> BSR  ; orig: C - - - - - 0x0147A3 05:8793: 20 8D B6  JSR sub_B68D
    BNE     bra_87BE             ; BNE  ; orig: C - - - - - 0x0147A6 05:8796: D0 26     BNE bra_87BE
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0147A8 05:8798: A5 98     LDA ram_dir_link
    BSR     sub_B560             ; JSR -> BSR  ; orig: C - - - - - 0x0147AA 05:879A: 20 60 B5  JSR sub_B560
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0147AD 05:879D: 38        SEC
    SUBX.B  ram_map_location,D0  ; orig: C - - - - - 0x0147AE 05:879E: E5 EB     SBC ram_map_location
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x0147B0 05:87A0: 20 21 70  JSR sub_bat_7021_EOR
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0147B3 05:87A3: 18        CLC
    ADDX.B  ram_map_location,D0  ; orig: C - - - - - 0x0147B4 05:87A4: 65 EB     ADC ram_map_location
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0147B6 05:87A6: A8        TAY
    BSR     sub_B68D             ; JSR -> BSR  ; orig: C - - - - - 0x0147B7 05:87A7: 20 8D B6  JSR sub_B68D
    BEQ     bra_87BE             ; BEQ  ; orig: C - - - - - 0x0147BA 05:87AA: F0 12     BEQ bra_87BE
    MOVE.B  ram_051F_script,D0  ; orig: C - - - - - 0x0147BC 05:87AC: AD 1F 05  LDA ram_051F_script
    BNE     bra_87BE             ; BNE  ; orig: C - - - - - 0x0147BF 05:87AF: D0 0D     BNE bra_87BE
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x0147C1 05:87B1: A9 C0     LDA #$C0
sub_87B3:
; A = 00 A0
    MOVE.B  D0,ram_051C  ; orig: C - - - - - 0x0147C3 05:87B3: 8D 1C 05  STA ram_051C
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0147C6 05:87B6: E6 13     INC ram_subscript
bra_87B8_RTS:  ; orig: bra_87B8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0147C8 05:87B8: 60        RTS
bra_87B9:  ; orig: bra_87B9:
    BSR     sub_bat_74B7             ; JSR -> BSR  ; orig: C - - - - - 0x0147C9 05:87B9: 20 B7 74  JSR sub_bat_74B7
    BNE     bra_87B8_RTS             ; BNE  ; orig: C - - - - - 0x0147CC 05:87BC: D0 FA     BNE bra_87B8_RTS
bra_87BE:  ; orig: bra_87BE:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0147CE 05:87BE: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0147D0 05:87C0: 85 13     STA ram_subscript
    MOVE.B  D0,ram_051F_script  ; orig: C - - - - - 0x0147D2 05:87C2: 8D 1F 05  STA ram_051F_script
    RTS                     ; RTS  ; orig: C - - - - - 0x0147D5 05:87C5: 60        RTS



bra_87C6:
; bzk
sub_87C6:  ; orig: sub_87C6:
sub_0x0147D6:  ; orig: sub_0x0147D6:
    BSR     sub_0x01EA4D             ; JSR -> BSR  ; orig: C - - - - - 0x0147D6 05:87C6: 20 3D EA  JSR sub_0x01EA4D
    BSR     sub_0x01EA61             ; JSR -> BSR  ; orig: C - - - - - 0x0147D9 05:87C9: 20 51 EA  JSR sub_0x01EA61
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x0147DC 05:87CC: A9 05     LDA #$05
    MOVE.B  #$1F,D2  ; orig: C - - - - - 0x0147DE 05:87CE: A0 1F     LDY #$1F
    BSR     sub_0x01E618_clear_memory             ; JSR -> BSR  ; orig: C - - - - - 0x0147E0 05:87D0: 20 08 E6  JSR sub_0x01E618_cle
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0147E3 05:87D3: A9 00     LDA #$00
    MOVE.B  D0,ram_0054_timer  ; orig: C - - - - - 0x0147E5 05:87D5: 85 54     STA ram_0054_timer

; bzk optimize, useless STA?
    MOVE.B  D0,ram_0055_direction  ; orig: C - - - - - 0x0147E7 05:87D7: 85 55     STA ram_0055_directi
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0147E9 05:87D9: A4 EB     LDY ram_map_location
    MOVE.B  ram_6AFE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0147EB 05:87DB: B9 FE 6A  LDA ram_6AFE_map_dat
    MOVE.B  D0,ram_04CD_map_data_byte  ; orig: C - - - - - 0x0147EE 05:87DE: 8D CD 04  STA ram_04CD_map_dat
    BSR     sub_B0B6             ; JSR -> BSR  ; orig: C - - - - - 0x0147F1 05:87E1: 20 B6 B0  JSR sub_B0B6
    MOVE.B  ram_005A,D0  ; orig: C - - - - - 0x0147F4 05:87E4: A5 5A     LDA ram_005A
    BEQ     bra_8820             ; BEQ  ; orig: C - - - - - 0x0147F6 05:87E6: F0 38     BEQ bra_8820
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x0147F8 05:87E8: A5 10     LDA ram_dungeon_leve
    BNE     bra_8815             ; BNE  ; orig: C - - - - - 0x0147FA 05:87EA: D0 29     BNE bra_8815    ; if

; if overworld
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0147FC 05:87EC: A4 EB     LDY ram_map_location
    MOVE.B  ram_687E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0147FE 05:87EE: B9 7E 68  LDA ram_687E_map_dat
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x014801 05:87F1: 29 F0     AND #$F0
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x014803 05:87F3: 85 70     STA ram_pos_X_link
    MOVE.B  ram_6AFE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014805 05:87F5: B9 FE 6A  LDA ram_6AFE_map_dat
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x014808 05:87F8: 29 07     AND #$07

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01480A 05:87FA: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01480B 05:87FB: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01480C 05:87FC: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01480D 05:87FD: 0A        ASL
    ADDX.B  #$4D,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01480E 05:87FE: 69 4D     ADC #$4D
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x014810 05:8800: 85 84     STA ram_pos_Y_link
    MOVE.B  ram_0065,D2  ; orig: C - - - - - 0x014812 05:8802: A4 65     LDY ram_0065
    CMPI.B  #$24,D2  ; orig: C - - - - - 0x014814 05:8804: C0 24     CPY #$24
    BNE     bra_8815             ; BNE  ; orig: C - - - - - 0x014816 05:8806: D0 0D     BNE bra_8815
    MOVE.B  D0,ram_0412  ; orig: C - - - - - 0x014818 05:8808: 8D 12 04  STA ram_0412
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01481B 05:880B: 18        CLC
    ADDX.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01481C 05:880C: 69 10     ADC #$10
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x01481E 05:880E: 85 84     STA ram_pos_Y_link
    MOVE.B  #con_sfx_3_walking,D0  ; orig: C - - - - - 0x014820 05:8810: A9 08     LDA #con_sfx_3_walki
    MOVE.B  D0,ram_sfx_3  ; orig: C - - - - - 0x014822 05:8812: 8D 03 06  STA ram_sfx_3
bra_8815:  ; orig: bra_8815:
    MOVE.B  #con_dir_Down,D0  ; orig: C - - - - - 0x014825 05:8815: A9 04     LDA #con_dir_Down
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x014827 05:8817: 85 98     STA ram_dir_link
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014829 05:8819: A9 00     LDA #$00
    MOVE.B  D0,ram_0053  ; orig: C - - - - - 0x01482B 05:881B: 85 53     STA ram_0053
    JMP     loc_8859  ; orig: C - - - - - 0x01482D 05:881D: 4C 59 88  JMP loc_8859
bra_8820:  ; orig: bra_8820:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014830 05:8820: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_0053  ; orig: C - - - - - 0x014832 05:8822: 85 53     STA ram_0053
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x014834 05:8824: 20 13 70  JSR sub_bat_7013_get
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x014837 05:8827: 25 EE     AND ram_00EE
    MOVE.B  D0,ram_0055_direction  ; orig: C - - - - - 0x014839 05:8829: 85 55     STA ram_0055_directi
    BEQ     bra_8831             ; BEQ  ; orig: C - - - - - 0x01483B 05:882B: F0 04     BEQ bra_8831
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01483D 05:882D: A9 02     LDA #$02
    MOVE.B  D0,ram_0054_timer  ; orig: C - - - - - 0x01483F 05:882F: 85 54     STA ram_0054_timer
bra_8831:  ; orig: bra_8831:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x014841 05:8831: A5 10     LDA ram_dungeon_leve
    BEQ     bra_8859             ; BEQ  ; orig: C - - - - - 0x014843 05:8833: F0 24     BEQ bra_8859    ; if

; if dungeon
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x014845 05:8835: A0 00     LDY #$00    ; pos X
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014847 05:8837: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x014849 05:8839: 29 03     AND #con_dir__LR
    BEQ     bra_8845             ; BEQ  ; orig: C - - - - - 0x01484B 05:883B: F0 08     BEQ bra_8845
    ANDI.B  #con_dir_Right,D0  ; orig: C - - - - - 0x01484D 05:883D: 29 01     AND #con_dir_Right
    BNE     bra_8843             ; BNE  ; orig: C - - - - - 0x01484F 05:883F: D0 02     BNE bra_8843
    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x014851 05:8841: A0 F0     LDY #$F0    ; pos X
bra_8843:  ; orig: bra_8843:
    MOVE.B  D2,ram_pos_X_link  ; orig: C - - - - - 0x014853 05:8843: 84 70     STY ram_pos_X_link
bra_8845:  ; orig: bra_8845:
    BSR     sub_B0C3             ; JSR -> BSR  ; orig: C - - - - - 0x014855 05:8845: 20 C3 B0  JSR sub_B0C3
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x014858 05:8848: 29 07     AND #$07
    BEQ     bra_8856             ; BEQ  ; orig: C - - - - - 0x01485A 05:884A: F0 0A     BEQ bra_8856
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x01485C 05:884C: C9 05     CMP #$05
    BEQ     bra_8856             ; BEQ  ; orig: C - - - - - 0x01485E 05:884E: F0 06     BEQ bra_8856
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x014860 05:8850: C9 06     CMP #$06
    BEQ     bra_8856             ; BEQ  ; orig: C - - - - - 0x014862 05:8852: F0 02     BEQ bra_8856

; 01, 02, 03, 04, 07
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014864 05:8854: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014865 05:8855: C8        INY
bra_8856:  ; orig: bra_8856:

; 00, 05, 06
    MOVE.B  tbl_8672(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014866 05:8856: B9 72 86  LDA tbl_8672,Y
bra_8859:  ; orig: bra_8859:
loc_8859:  ; orig: loc_8859:
    MOVE.B  D0,ram_0394_link  ; orig: C D 0 - - - 0x014869 05:8859: 8D 94 03  STA ram_0394_link
    BSR     sub_B05E             ; JSR -> BSR  ; orig: C - - - - - 0x01486C 05:885C: 20 5E B0  JSR sub_B05E
    MOVE.B  #$0B,D1  ; orig: C - - - - - 0x01486F 05:885F: A2 0B     LDX #$0B
    MOVE.B  D1,ram_obj_index  ; orig: C - - - - - 0x014871 05:8861: 8E 40 03  STX ram_obj_index
bra_8864_loop:  ; orig: bra_8864_loop:
    ; (empty translation for DEC)  ; orig: C - - - - - 0x014874 05:8864: DE 92 04  DEC ram_0492_enemy,X
    BSR     sub_0x01EEF4             ; JSR -> BSR  ; orig: C - - - - - 0x014877 05:8867: 20 E4 EE  JSR sub_0x01EEF4

; A = 00
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01487A 05:886A: 95 AC     STA ram_state_obj,X
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01487C 05:886C: 95 98     STA ram_dir_enemy,X
    MOVE.B  D0,ram_003D_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01487E 05:886E: 95 3D     STA ram_003D_enemy,X
    ; (empty translation for INC)  ; orig: C - - - - - 0x014880 05:8870: FE D0 03  INC ram_anim_timer_o
    ; (empty translation for INC)  ; orig: C - - - - - 0x014883 05:8873: FE 05 04  INC ram_0405_enemy,X
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x014886 05:8876: A9 20     LDA #$20
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014888 05:8878: 9D BC 03  STA ram_03BC_obj,X
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01488B 05:887B: CA        DEX
    BNE     bra_8864_loop             ; BNE  ; orig: C - - - - - 0x01488C 05:887C: D0 E6     BNE bra_8864_loop
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01488E 05:887E: A4 EB     LDY ram_map_location
    MOVE.B  ram_697E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014890 05:8880: B9 7E 69  LDA ram_697E_map_dat
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014893 05:8883: 48        PHA
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x014894 05:8884: 29 3F     AND #$3F
    MOVE.B  D0,ram_0002_t38_obj_id  ; orig: C - - - - - 0x014896 05:8886: 85 02     STA ram_0002_t38_obj
    MOVE.B  ram_69FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014898 05:8888: B9 FE 69  LDA ram_69FE_map_dat
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01489B 05:888B: 0A        ASL
    BCC     bra_8895             ; BCC  ; orig: C - - - - - 0x01489C 05:888C: 90 07     BCC bra_8895

; 80+
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x01489E 05:888E: A5 02     LDA ram_0002_t38_obj
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0148A0 05:8890: 18        CLC
    ADDX.B  #$40,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0148A1 05:8891: 69 40     ADC #$40
    MOVE.B  D0,ram_0002_t38_obj_id  ; orig: C - - - - - 0x0148A3 05:8893: 85 02     STA ram_0002_t38_obj
bra_8895:  ; orig: bra_8895:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0148A5 05:8895: 68        PLA
    ANDI.B  #$C0,D0  ; orig: C - - - - - 0x0148A6 05:8896: 29 C0     AND #$C0
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0148A8 05:8898: 18        CLC
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x0148A9 05:8899: 2A        ROL
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x0148AA 05:889A: 2A        ROL
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x0148AB 05:889B: 2A        ROL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0148AC 05:889C: A8        TAY
    MOVE.B  ram_6BA2(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0148AD 05:889D: B9 A2 6B  LDA ram_6BA2,Y  ; 6B
    MOVE.B  ram_0002_t38_obj_id,D2  ; orig: C - - - - - 0x0148B0 05:88A0: A4 02     LDY ram_0002_t38_obj
    CMPI.B  #$62,D2  ; orig: C - - - - - 0x0148B2 05:88A2: C0 62     CPY #$62
    BCS     bra_88AC             ; BCS  ; orig: C - - - - - 0x0148B4 05:88A4: B0 06     BCS bra_88AC
    CMPI.B  #$32,D2  ; orig: C - - - - - 0x0148B6 05:88A6: C0 32     CPY #$32
    BCC     bra_88AC             ; BCC  ; orig: C - - - - - 0x0148B8 05:88A8: 90 02     BCC bra_88AC

; 32-61
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0148BA 05:88AA: A9 01     LDA #$01
bra_88AC:  ; orig: bra_88AC:

; 00-31, 62-7F
    MOVE.B  D0,ram_0003_t15_objects_counter  ; orig: C - - - - - 0x0148BC 05:88AC: 85 03     STA ram_0003_t15_obj
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x0148BE 05:88AE: A5 10     LDA ram_dungeon_leve
    BNE     bra_88B8             ; BNE  ; orig: C - - - - - 0x0148C0 05:88B0: D0 06     BNE bra_88B8    ; if

; if overworld
    BSR     sub_90AE_check_room_history             ; JSR -> BSR  ; orig: C - - - - - 0x0148C2 05:88B2: 20 AE 90  JSR sub_90AE_check_r
    JMP     loc_88C7  ; orig: C - - - - - 0x0148C5 05:88B5: 4C C7 88  JMP loc_88C7
bra_88B8:  ; orig: bra_88B8:
    BSR     sub_9293             ; JSR -> BSR  ; orig: C - - - - - 0x0148C8 05:88B8: 20 93 92  JSR sub_9293
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x0148CB 05:88BB: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x0148CD 05:88BD: C9 09     CMP #con_script_09
    BNE     bra_88C7             ; BNE  ; orig: C - - - - - 0x0148CF 05:88BF: D0 06     BNE bra_88C7
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0148D1 05:88C1: A9 00     LDA #$00
    MOVE.B  D0,ram_0002_t38_obj_id  ; orig: C - - - - - 0x0148D3 05:88C3: 85 02     STA ram_0002_t38_obj
    MOVE.B  D0,ram_0003_t15_objects_counter  ; orig: C - - - - - 0x0148D5 05:88C5: 85 03     STA ram_0003_t15_obj
bra_88C7:  ; orig: bra_88C7:
loc_88C7:  ; orig: loc_88C7:
    MOVE.B  ram_0003_t15_objects_counter,D0  ; orig: C D 0 - - - 0x0148D7 05:88C7: A5 03     LDA ram_0003_t15_obj
    MOVE.B  D0,ram_enemy_cnt  ; orig: C - - - - - 0x0148D9 05:88C9: 8D 4E 03  STA ram_enemy_cnt
    BEQ     bra_8909             ; BEQ  ; orig: C - - - - - 0x0148DC 05:88CC: F0 3B     BEQ bra_8909
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x0148DE 05:88CE: A5 02     LDA ram_0002_t38_obj
    BEQ     bra_8909             ; BEQ  ; orig: C - - - - - 0x0148E0 05:88D0: F0 37     BEQ bra_8909
    CMPI.B  #$62,D0  ; orig: C - - - - - 0x0148E2 05:88D2: C9 62     CMP #$62
    BCS     bra_88E5_spawn_a_group_of_enemies             ; BCS  ; orig: C - - - - - 0x0148E4 05:88D4: B0 0F     BCS bra_88E5_spawn_a

; spawn the same enemy N times
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0148E6 05:88D6: A2 00     LDX #$00
bra_88D8_loop:  ; orig: bra_88D8_loop:
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x0148E8 05:88D8: A5 02     LDA ram_0002_t38_obj
    MOVE.B  D0,ram_obj_id_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0148EA 05:88DA: 9D 50 03  STA ram_obj_id_enemy
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0148ED 05:88DD: E8        INX
    SUBQ.B  #1,ram_0003_t15_objects_counter  ; orig: C - - - - - 0x0148EE 05:88DE: C6 03     DEC ram_0003_t15_obj
    BNE     bra_88D8_loop             ; BNE  ; orig: C - - - - - 0x0148F0 05:88E0: D0 F6     BNE bra_88D8_loop
    JMP     loc_8903  ; orig: C - - - - - 0x0148F2 05:88E2: 4C 03 89  JMP loc_8903
bra_88E5_spawn_a_group_of_enemies:  ; orig: bra_88E5_spawn_a_group_of_enemies:
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x0148F5 05:88E5: A5 02     LDA ram_0002_t38_obj
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0148F7 05:88E7: 38        SEC
    SUBX.B  #$62,D0       ; SBC imm  ; orig: C - - - - - 0x0148F8 05:88E8: E9 62     SBC #$62
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0148FA 05:88EA: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0148FB 05:88EB: A8        TAY
    MOVE.B  tbl_873F_enemy_groups(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0148FC 05:88EC: B9 3F 87  LDA tbl_873F_enemy_g
    MOVE.B  D0,ram_0004_t03_enemy_groups_data  ; orig: C - - - - - 0x0148FF 05:88EF: 85 04     STA ram_0004_t03_ene
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014901 05:88F1: C8        INY
    MOVE.B  tbl_873F_enemy_groups(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014902 05:88F2: B9 3F 87  LDA tbl_873F_enemy_g
    ; (empty translation for STA)  ; orig: C - - - - - 0x014905 05:88F5: 85 05     STA ram_0004_t03_ene
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x014907 05:88F7: A0 00     LDY #$00
bra_88F9_loop:  ; orig: bra_88F9_loop:
    MOVEA.W ($FF0000+ram_0004_t03_enemy_groups_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x014909 05:88F9: B1 04     LDA (ram_0004_t03_en
    MOVE.B  D0,ram_obj_id_enemy(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01490B 05:88FB: 99 50 03  STA ram_obj_id_enemy
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01490E 05:88FE: C8        INY
    CMP.B   ram_0003_t15_objects_counter,D2  ; orig: C - - - - - 0x01490F 05:88FF: C4 03     CPY ram_0003_t15_obj
    BNE     bra_88F9_loop             ; BNE  ; orig: C - - - - - 0x014911 05:8901: D0 F6     BNE bra_88F9_loop
loc_8903:  ; orig: loc_8903:
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C D 0 - - - 0x014913 05:8903: AD 50 03  LDA ram_obj_id_enemy
    MOVE.B  D0,ram_copy_obj_id  ; orig: C - - - - - 0x014916 05:8906: 8D 5F 03  STA ram_copy_obj_id
bra_8909:  ; orig: bra_8909:
    BSR     sub_896E             ; JSR -> BSR  ; orig: C - - - - - 0x014919 05:8909: 20 6E 89  JSR sub_896E
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01491C 05:890C: A5 10     LDA ram_dungeon_leve
    BNE     bra_8913             ; BNE  ; orig: C - - - - - 0x01491E 05:890E: D0 03     BNE bra_8913    ; if

; if overworld
    BSR     sub_8941             ; JSR -> BSR  ; orig: C - - - - - 0x014920 05:8910: 20 41 89  JSR sub_8941
bra_8913:  ; orig: bra_8913:
    BSR     sub_bat_71DE_draw_dot_on_minimap             ; JSR -> BSR  ; orig: C - - - - - 0x014923 05:8913: 20 DE 71  JSR sub_bat_71DE_dra
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014926 05:8916: A9 00     LDA #$00
    MOVE.B  D0,ram_003D_link  ; orig: C - - - - - 0x014928 05:8918: 85 3D     STA ram_003D_link
    MOVE.B  D0,ram_00C0_link  ; orig: C - - - - - 0x01492A 05:891A: 85 C0     STA ram_00C0_link
    MOVE.B  D0,ram_00D3_link  ; orig: C - - - - - 0x01492C 05:891C: 85 D3     STA ram_00D3_link
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x01492E 05:891E: A9 04     LDA #$04
    MOVE.B  D0,ram_anim_timer_link  ; orig: C - - - - - 0x014930 05:8920: 8D D0 03  STA ram_anim_timer_l
    BSR     sub_B366             ; JSR -> BSR  ; orig: C - - - - - 0x014933 05:8923: 20 66 B3  JSR sub_B366
    BSR     sub_0x01EAE3             ; JSR -> BSR  ; orig: C - - - - - 0x014936 05:8926: 20 D3 EA  JSR sub_0x01EAE3
sub_8929:  ; orig: sub_8929:
sub_0x014939:  ; orig: sub_0x014939:
    BSR     sub_bat_6E40_clear_counter_00_27             ; JSR -> BSR  ; orig: C - - - - - 0x014939 05:8929: 20 40 6E  JSR sub_bat_6E40_cle
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x01493C 05:892C: A5 12     LDA ram_script
    CMPI.B  #con_script_0B,D0  ; orig: C - - - - - 0x01493E 05:892E: C9 0B     CMP #con_script_0B
    BEQ     bra_8939             ; BEQ  ; orig: C - - - - - 0x014940 05:8930: F0 07     BEQ bra_8939
    CMPI.B  #con_script_0C,D0  ; orig: C - - - - - 0x014942 05:8932: C9 0C     CMP #con_script_0C
    BEQ     bra_8939             ; BEQ  ; orig: C - - - - - 0x014944 05:8934: F0 03     BEQ bra_8939
    BSR     sub_0x01F248             ; JSR -> BSR  ; orig: C - - - - - 0x014946 05:8936: 20 38 F2  JSR sub_0x01F248
bra_8939:  ; orig: bra_8939:
    MOVE.B  ram_005A,D0  ; orig: C - - - - - 0x014949 05:8939: A5 5A     LDA ram_005A
    BEQ     bra_8940_RTS             ; BEQ  ; orig: C - - - - - 0x01494B 05:893B: F0 03     BEQ bra_8940_RTS

; bzk optimize, JMP
    BSR     sub_8BAB             ; JSR -> BSR  ; orig: C - - - - - 0x01494D 05:893D: 20 AB 8B  JSR sub_8BAB
bra_8940_RTS:  ; orig: bra_8940_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014950 05:8940: 60        RTS



sub_8941:  ; orig: sub_8941:
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x014951 05:8941: A5 EB     LDA ram_map_location
    CMPI.B  #con_map_location + $3F,D0  ; orig: C - - - - - 0x014953 05:8943: C9 3F     CMP #con_map_locatio
    BEQ     bra_894B             ; BEQ  ; orig: C - - - - - 0x014955 05:8945: F0 04     BEQ bra_894B
    CMPI.B  #con_map_location + $55,D0  ; orig: C - - - - - 0x014957 05:8947: C9 55     CMP #con_map_locatio
    BNE     bra_8950             ; BNE  ; orig: C - - - - - 0x014959 05:8949: D0 05     BNE bra_8950
bra_894B:  ; orig: bra_894B:
    MOVE.B  #con_obj_id_61,D0  ; orig: C - - - - - 0x01495B 05:894B: A9 61     LDA #con_obj_id_61
    JMP     loc_895D  ; orig: C - - - - - 0x01495D 05:894D: 4C 5D 89  JMP loc_895D
bra_8950:  ; orig: bra_8950:
    MOVE.B  ram_052C_special_metatile_pos_X,D0  ; orig: C - - - - - 0x014960 05:8950: AD 2C 05  LDA ram_052C_special
    ; (empty translation for STA)  ; orig: C - - - - - 0x014963 05:8953: 85 7B     STA ram_pos_X_enemy 
    MOVE.B  ram_052D_special_metatile_pos_Y,D0  ; orig: C - - - - - 0x014965 05:8955: AD 2D 05  LDA ram_052D_special
    ; (empty translation for STA)  ; orig: C - - - - - 0x014968 05:8958: 85 8F     STA ram_pos_Y_enemy 
    MOVE.B  ram_052B_special_metatile_id,D0  ; orig: C - - - - - 0x01496A 05:895A: AD 2B 05  LDA ram_052B_special
loc_895D:  ; orig: loc_895D:
    ; (empty translation for STA)  ; orig: C D 0 - - - 0x01496D 05:895D: 8D 5A 03  STA ram_obj_id_enemy
    BSR     sub_bat_6DB7_clear_special_metatile_addresses             ; JSR -> BSR  ; orig: C - - - - - 0x014970 05:8960: 20 B7 6D  JSR sub_bat_6DB7_cle
    ; (empty translation for STA)  ; orig: C - - - - - 0x014973 05:8963: 85 B7     STA ram_state_obj + 
    RTS                     ; RTS  ; orig: C - - - - - 0x014975 05:8965: 60        RTS



tbl_8966_pos_X:  ; orig: tbl_8966_pos_X:
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x014976 05:8966: 20        .byte $20   ; 00
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x014977 05:8967: 60        .byte $60   ; 01
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 0 - - - 0x014978 05:8968: 90        .byte $90   ; 02
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 0 - - - 0x014979 05:8969: D0        .byte $D0   ; 03



tbl_896A_pos_Y:  ; orig: tbl_896A_pos_Y:
    ; [DIRECTIVE] .BYTE $9D  -- needs manual handling  ; orig: - D 0 - - - 0x01497A 05:896A: 9D        .byte $9D   ; 00
    ; [DIRECTIVE] .BYTE $5D  -- needs manual handling  ; orig: - - - - - - 0x01497B 05:896B: 5D        .byte $5D   ; 01
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - - - - - - 0x01497C 05:896C: 7D        .byte $7D   ; 02
    ; [DIRECTIVE] .BYTE $9D  -- needs manual handling  ; orig: - - - - - - 0x01497D 05:896D: 9D        .byte $9D   ; 03



sub_896E:  ; orig: sub_896E:

; in

; ram_0002_t38_obj_id
    MOVE.B  ram_enemy_cnt,D2  ; orig: C - - - - - 0x01497E 05:896E: AC 4E 03  LDY ram_enemy_cnt
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x014981 05:8971: A5 02     LDA ram_0002_t38_obj
    BEQ     bra_89C4             ; BEQ  ; orig: C - - - - - 0x014983 05:8973: F0 4F     BEQ bra_89C4
    CMPI.B  #$37,D0  ; orig: C - - - - - 0x014985 05:8975: C9 37     CMP #$37
    BEQ     bra_89C4             ; BEQ  ; orig: C - - - - - 0x014987 05:8977: F0 4B     BEQ bra_89C4
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x014989 05:8979: A5 10     LDA ram_dungeon_leve
    BNE     bra_8984             ; BNE  ; orig: C - - - - - 0x01498B 05:897B: D0 07     BNE bra_8984    ; if

; if overworld
    MOVE.B  ram_04CD_map_data_byte,D0  ; orig: C - - - - - 0x01498D 05:897D: AD CD 04  LDA ram_04CD_map_dat
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x014990 05:8980: 29 08     AND #$08
    BNE     bra_89C4             ; BNE  ; orig: C - - - - - 0x014992 05:8982: D0 40     BNE bra_89C4
bra_8984:  ; orig: bra_8984:
    MOVE.B  ram_enemy_cnt,D0  ; orig: C - - - - - 0x014994 05:8984: AD 4E 03  LDA ram_enemy_cnt
    BEQ     bra_89C4             ; BEQ  ; orig: C - - - - - 0x014997 05:8987: F0 3B     BEQ bra_89C4

; spawn depends on where link is approaching from
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014999 05:8989: A5 98     LDA ram_dir_link
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x01499B 05:898B: A0 FF     LDY #$FF
bra_898D_loop:  ; orig: bra_898D_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01499D 05:898D: C8        INY
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01499E 05:898E: 4A        LSR
    BCC     bra_898D_loop             ; BCC  ; orig: C - - - - - 0x01499F 05:898F: 90 FC     BCC bra_898D_loop
    MOVE.B  tbl_8646_enemy_spawn_positions_lo(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0149A1 05:8991: B9 46 86  LDA tbl_8646_enemy_s
    MOVE.B  D0,ram_0006_t02_enemy_spawn_pos_data  ; orig: C - - - - - 0x0149A4 05:8994: 85 06     STA ram_0006_t02_ene
    MOVE.B  tbl_864A_enemy_spawn_positions_hi(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0149A6 05:8996: B9 4A 86  LDA tbl_864A_enemy_s
    ; (empty translation for STA)  ; orig: C - - - - - 0x0149A9 05:8999: 85 07     STA ram_0006_t02_ene
    MOVE.B  ram_0524,D2  ; orig: C - - - - - 0x0149AB 05:899B: AC 24 05  LDY ram_0524
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x0149AE 05:899E: A2 01     LDX #$01
bra_89A0_loop:  ; orig: bra_89A0_loop:
    MOVEA.W ($FF0000+ram_0006_t02_enemy_spawn_pos_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0149B0 05:89A0: B1 06     LDA (ram_0006_t02_en
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0149B2 05:89A2: 48        PHA

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0149B3 05:89A3: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0149B4 05:89A4: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0149B5 05:89A5: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0149B6 05:89A6: 0A        ASL
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0149B7 05:89A7: 95 70     STA ram_pos_X_enemy,
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0149B9 05:89A9: 68        PLA
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0149BA 05:89AA: 29 F0     AND #$F0
    ORI.B   #$0D,D0  ; orig: C - - - - - 0x0149BC 05:89AC: 09 0D     ORA #$0D
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0149BE 05:89AE: 95 84     STA ram_pos_Y_enemy,
    BSR     sub_8A04_check_for_valid_spawn_position             ; JSR -> BSR  ; orig: C - - - - - 0x0149C0 05:89B0: 20 04 8A  JSR sub_8A04_check_f
    BCS     bra_89B6_not_valid             ; BCS  ; orig: C - - - - - 0x0149C3 05:89B3: B0 01     BCS bra_89B6_not_val
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0149C5 05:89B5: E8        INX
bra_89B6_not_valid:  ; orig: bra_89B6_not_valid:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0149C6 05:89B6: C8        INY
    CMPI.B  #$09,D2  ; orig: C - - - - - 0x0149C7 05:89B7: C0 09     CPY #$09
    BCC     bra_89BD_not_overflow             ; BCC  ; orig: C - - - - - 0x0149C9 05:89B9: 90 02     BCC bra_89BD_not_ove
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0149CB 05:89BB: A0 00     LDY #$00
bra_89BD_not_overflow:  ; orig: bra_89BD_not_overflow:
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x0149CD 05:89BD: E0 0A     CPX #$0A
    BCC     bra_89A0_loop             ; BCC  ; orig: C - - - - - 0x0149CF 05:89BF: 90 DF     BCC bra_89A0_loop
    MOVE.B  D2,ram_0524  ; orig: C - - - - - 0x0149D1 05:89C1: 8C 24 05  STY ram_0524
bra_89C4:  ; orig: bra_89C4:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x0149D4 05:89C4: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x0149D6 05:89C6: C9 09     CMP #con_script_09
    BNE     bra_89DF             ; BNE  ; orig: C - - - - - 0x0149D8 05:89C8: D0 15     BNE bra_89DF
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x0149DA 05:89CA: A2 03     LDX #$03
bra_89CC_loop:  ; orig: bra_89CC_loop:
    MOVE.B  #con_obj_id_1B,D0  ; orig: C - - - - - 0x0149DC 05:89CC: A9 1B     LDA #con_obj_id_1B
    MOVE.B  D0,ram_obj_id_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0149DE 05:89CE: 9D 50 03  STA ram_obj_id_enemy
    MOVE.B  tbl_8966_pos_X(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0149E1 05:89D1: BD 66 89  LDA tbl_8966_pos_X,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x0149E4 05:89D4: 95 71     STA ram_pos_X_enemy 
    MOVE.B  tbl_896A_pos_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0149E6 05:89D6: B9 6A 89  LDA tbl_896A_pos_Y,Y
    ; (empty translation for STA)  ; orig: C - - - - - 0x0149E9 05:89D9: 95 85     STA ram_pos_Y_enemy 
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0149EB 05:89DB: CA        DEX
    BPL     bra_89CC_loop             ; BPL  ; orig: C - - - - - 0x0149EC 05:89DC: 10 EE     BPL bra_89CC_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0149EE 05:89DE: 60        RTS
bra_89DF:  ; orig: bra_89DF:
    CMPI.B  #con_script_0B,D0  ; orig: C - - - - - 0x0149EF 05:89DF: C9 0B     CMP #con_script_0B
    BEQ     bra_89E7             ; BEQ  ; orig: C - - - - - 0x0149F1 05:89E1: F0 04     BEQ bra_89E7
    CMPI.B  #con_script_0C,D0  ; orig: C - - - - - 0x0149F3 05:89E3: C9 0C     CMP #con_script_0C
    BNE     bra_8A03_RTS             ; BNE  ; orig: C - - - - - 0x0149F5 05:89E5: D0 1C     BNE bra_8A03_RTS
bra_89E7:  ; orig: bra_89E7:
    MOVE.B  #$07,D1  ; orig: C - - - - - 0x0149F7 05:89E7: A2 07     LDX #$07
    MOVE.B  #con_obj_id_null,D0  ; orig: C - - - - - 0x0149F9 05:89E9: A9 00     LDA #con_obj_id_null
bra_89EB_loop:  ; orig: bra_89EB_loop:
    MOVE.B  D0,ram_obj_id_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x0149FB 05:89EB: 9D 50 03  STA ram_obj_id_enemy
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0149FE 05:89EE: CA        DEX
    BPL     bra_89EB_loop             ; BPL  ; orig: C - - - - - 0x0149FF 05:89EF: 10 FA     BPL bra_89EB_loop
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x014A01 05:89F1: A4 EB     LDY ram_map_location
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014A03 05:89F3: B9 FE 68  LDA ram_68FE_map_dat
    ANDI.B  #$FC,D0  ; orig: C - - - - - 0x014A06 05:89F6: 29 FC     AND #$FC
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014A08 05:89F8: 38        SEC
    SUBX.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x014A09 05:89F9: E9 40     SBC #$40

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014A0B 05:89FB: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014A0C 05:89FC: 4A        LSR
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014A0D 05:89FD: 18        CLC
    ADDX.B  #$6A,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014A0E 05:89FE: 69 6A     ADC #$6A
    MOVE.B  D0,ram_obj_id_enemy  ; orig: C - - - - - 0x014A10 05:8A00: 8D 50 03  STA ram_obj_id_enemy
bra_8A03_RTS:  ; orig: bra_8A03_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014A13 05:8A03: 60        RTS



sub_8A04_check_for_valid_spawn_position:  ; orig: sub_8A04_check_for_valid_spawn_position:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014A14 05:8A04: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014A15 05:8A05: 48        PHA
    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x014A16 05:8A06: 20 F4 ED  JSR sub_0x01EE04_fin
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014A19 05:8A09: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014A1A 05:8A0A: A8        TAY
    MOVE.B  ram_collision_tile_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014A1B 05:8A0B: BD 9E 04  LDA ram_collision_ti
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x014A1E 05:8A0E: CD 4A 03  CMP ram_min_collisio
    BCS     bra_8A2D_not_valid             ; BCS  ; orig: C - - - - - 0x014A21 05:8A11: B0 1A     BCS bra_8A2D_not_val
sub_0x014A23:  ; orig: sub_0x014A23:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014A23 05:8A13: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014A25 05:8A15: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x014A26 05:8A16: F5 70     SBC ram_pos_X_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x014A28 05:8A18: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$22,D0  ; orig: C - - - - - 0x014A2B 05:8A1B: C9 22     CMP #$22
    BCS     bra_8A2B_valid             ; BCS  ; orig: C - - - - - 0x014A2D 05:8A1D: B0 0C     BCS bra_8A2B_valid
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014A2F 05:8A1F: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014A31 05:8A21: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x014A32 05:8A22: F5 84     SBC ram_pos_Y_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x014A34 05:8A24: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$22,D0  ; orig: C - - - - - 0x014A37 05:8A27: C9 22     CMP #$22
    BCC     bra_8A2D_not_valid             ; BCC  ; orig: C - - - - - 0x014A39 05:8A29: 90 02     BCC bra_8A2D_not_val
bra_8A2B_valid:  ; orig: bra_8A2B_valid:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014A3B 05:8A2B: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x014A3C 05:8A2C: 60        RTS
bra_8A2D_not_valid:  ; orig: bra_8A2D_not_valid:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014A3D 05:8A2D: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x014A3E 05:8A2E: 60        RTS



ofs_main_script_1_0x014A3F_11_death:  ; orig: ofs_main_script_1_0x014A3F_11_death:

; con_script_death
    MOVE.B  #$00,D1  ; orig: C - - J - - 0x014A3F 05:8A2F: A2 00     LDX #$00
    BSR     sub_0x01FEA8_decrease_invincibility_timer             ; JSR -> BSR  ; orig: C - - - - - 0x014A41 05:8A31: 20 98 FE  JSR sub_0x01FEA8_dec
    BSR     sub_0x01F24C             ; JSR -> BSR  ; orig: C - - - - - 0x014A44 05:8A34: 20 3C F2  JSR sub_0x01F24C
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014A47 05:8A37: A5 13     LDA ram_subscript
    BNE     bra_8A60             ; BNE  ; orig: C - - - - - 0x014A49 05:8A39: D0 25     BNE bra_8A60
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x014A4B 05:8A3B: 20 F7 E5  JSR sub_0x01E607_hid
    BSR     sub_0x01E689             ; JSR -> BSR  ; orig: C - - - - - 0x014A4E 05:8A3E: 20 79 E6  JSR sub_0x01E689
    BSR     sub_8929             ; JSR -> BSR  ; orig: C - - - - - 0x014A51 05:8A41: 20 29 89  JSR sub_8929
    BSR     sub_0x01E79A             ; JSR -> BSR  ; orig: C - - - - - 0x014A54 05:8A44: 20 8A E7  JSR sub_0x01E79A
    BSR     sub_B559_disable_greyscale             ; JSR -> BSR  ; orig: C - - - - - 0x014A57 05:8A47: 20 59 B5  JSR sub_B559_disable
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014A5A 05:8A4A: A9 00     LDA #$00
    MOVE.B  D0,ram_pause_flag  ; orig: C - - - - - 0x014A5C 05:8A4C: 85 E0     STA ram_pause_flag
    ; (empty translation for STA)  ; orig: C - - - - - 0x014A5E 05:8A4E: 8D 70 06  STA ram_item_hearts 
    BSR     sub_bat_6D00_update_hud_info             ; JSR -> BSR  ; orig: C - - - - - 0x014A61 05:8A51: 20 00 6D  JSR sub_bat_6D00_upd
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014A64 05:8A54: E6 13     INC ram_subscript
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x014A66 05:8A56: A9 10     LDA #$10
    MOVE.B  D0,ram_invinc_link  ; orig: C - - - - - 0x014A68 05:8A58: 8D F0 04  STA ram_invinc_link
    MOVE.B  #$21,D0  ; orig: C - - - - - 0x014A6B 05:8A5B: A9 21     LDA #$21
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x014A6D 05:8A5D: 85 28     STA ram_timer_link
    RTS                     ; RTS  ; orig: C - - - - - 0x014A6F 05:8A5F: 60        RTS
bra_8A60:  ; orig: bra_8A60:
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x014A70 05:8A60: A5 28     LDA ram_timer_link
    BNE     bra_8A96_RTS             ; BNE  ; orig: C - - - - - 0x014A72 05:8A62: D0 32     BNE bra_8A96_RTS
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x014A74 05:8A64: 20 5A E8  JSR sub_0x01E86A_get
    ANDI.B  #$3E,D0  ; orig: C - - - - - 0x014A77 05:8A67: 29 3E     AND #$3E
    CMPI.B  #$3E,D0  ; orig: C - - - - - 0x014A79 05:8A69: C9 3E     CMP #$3E
    BEQ     bra_8A75             ; BEQ  ; orig: C - - - - - 0x014A7B 05:8A6B: F0 08     BEQ bra_8A75
    MOVE.B  ram_00EE,D0  ; orig: C - - - - - 0x014A7D 05:8A6D: A5 EE     LDA ram_00EE
    MOVE.B  D0,ram_0521  ; orig: C - - - - - 0x014A7F 05:8A6F: 8D 21 05  STA ram_0521
    BSR     sub_82FB             ; JSR -> BSR  ; orig: C - - - - - 0x014A82 05:8A72: 20 FB 82  JSR sub_82FB
bra_8A75:  ; orig: bra_8A75:
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x014A85 05:8A75: A9 60     LDA #$60
    MOVE.B  D0,ram_051C  ; orig: C - - - - - 0x014A87 05:8A77: 8D 1C 05  STA ram_051C
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x014A8A 05:8A7A: A9 02     LDA #$02
    ; (empty translation for STA)  ; orig: C - - - - - 0x014A8C 05:8A7C: 85 32     STA ram_timer_enemy 
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014A8E 05:8A7E: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x014A90 05:8A80: 85 13     STA ram_subscript
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x014A92 05:8A82: 85 E9     STA ram_00E9
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x014A94 05:8A84: 85 AC     STA ram_state_link
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x014A96 05:8A86: A9 04     LDA #$04    ; con_di
    MOVE.B  D0,ram_00E5_t02_counter  ; orig: C - - - - - 0x014A98 05:8A88: 85 E5     STA ram_00E5_t02_cou
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x014A9A 05:8A8A: 85 98     STA ram_dir_link
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x014A9C 05:8A8C: E6 11     INC ram_0011_screen_
loc_8A8E:  ; orig: loc_8A8E:
    MOVE.B  #$80,D0  ; orig: C D 0 - - - 0x014A9E 05:8A8E: A9 80     LDA #$80    ; con_sf
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x014AA0 05:8A90: 8D 04 06  STA ram_sfx_4
    MOVE.B  D0,ram_sfx_3  ; orig: C - - - - - 0x014AA3 05:8A93: 8D 03 06  STA ram_sfx_3
bra_8A96_RTS:  ; orig: bra_8A96_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014AA6 05:8A96: 60        RTS



sub_8A97:  ; orig: sub_8A97:

; out

; ram_0000_t13_data

; code for dungeons only, not for overworld
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x014AA7 05:8A97: 20 CE E6  JSR sub_0x01E6DE_get
    ; !! ORA tbl_0x01E6CE_8_bits,X - needs manual review  ; orig: C - - - - - 0x014AAA 05:8A9A: 1D BE E6  ORA tbl_0x01E6CE_8_b
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x014AAD 05:8A9D: 91 00     STA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: C - - - - - 0x014AAF 05:8A9F: 60        RTS



sub_8AA0:  ; orig: sub_8AA0:

; code for dungeons only, not for overworld
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x014AB0 05:8AA0: 20 CE E6  JSR sub_0x01E6DE_get
    MOVE.B  tbl_0x01E6CE_8_bits(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014AB3 05:8AA3: BD BE E6  LDA tbl_0x01E6CE_8_b
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x014AB6 05:8AA6: 49 FF     EOR #$FF
    ; !! AND (ram_0000_t13_data),Y - needs manual review  ; orig: C - - - - - 0x014AB8 05:8AA8: 31 00     AND (ram_0000_t13_da
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x014ABA 05:8AAA: 91 00     STA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: C - - - - - 0x014ABC 05:8AAC: 60        RTS



sub_0x014ABD:  ; orig: sub_0x014ABD:
    MOVE.B  ram_04CE_flag,D0  ; orig: C - - - - - 0x014ABD 05:8AAD: AD CE 04  LDA ram_04CE_flag
    BEQ     bra_8AC2             ; BEQ  ; orig: C - - - - - 0x014AC0 05:8AB0: F0 10     BEQ bra_8AC2
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x014AC2 05:8AB2: A9 08     LDA #$08
    MOVE.B  D0,ram_000E_t08_direction  ; orig: C - - - - - 0x014AC4 05:8AB4: 85 0E     STA ram_000E_t08_dir
bra_8AB6:  ; orig: bra_8AB6:
    MOVE.B  ram_000E_t08_direction,D0  ; orig: C - - - - - 0x014AC6 05:8AB6: A5 0E     LDA ram_000E_t08_dir
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x014AC8 05:8AB8: 25 EE     AND ram_00EE
    BEQ     bra_8AC8             ; BEQ  ; orig: C - - - - - 0x014ACA 05:8ABA: F0 0C     BEQ bra_8AC8
bra_8ABC:  ; orig: bra_8ABC:
    LSR.B   #1,ram_000E_t08_direction  ; orig: C - - - - - 0x014ACC 05:8ABC: 46 0E     LSR ram_000E_t08_dir
    MOVE.B  ram_000E_t08_direction,D0  ; orig: C - - - - - 0x014ACE 05:8ABE: A5 0E     LDA ram_000E_t08_dir
    BNE     bra_8AB6             ; BNE  ; orig: C - - - - - 0x014AD0 05:8AC0: D0 F4     BNE bra_8AB6
bra_8AC2:  ; orig: bra_8AC2:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014AD2 05:8AC2: A9 00     LDA #$00
    MOVE.B  D0,ram_04CE_flag  ; orig: C - - - - - 0x014AD4 05:8AC4: 8D CE 04  STA ram_04CE_flag
    RTS                     ; RTS  ; orig: C - - - - - 0x014AD7 05:8AC7: 60        RTS
bra_8AC8:  ; orig: bra_8AC8:
    MOVE.B  ram_000E_t08_direction,D0  ; orig: C - - - - - 0x014AD8 05:8AC8: A5 0E     LDA ram_000E_t08_dir
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x014ADA 05:8ACA: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x014ADC 05:8ACC: 20 F6 A3  JSR sub_A3F6
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x014ADF 05:8ACF: C9 07     CMP #$07
    BNE     bra_8ABC             ; BNE  ; orig: C - - - - - 0x014AE1 05:8AD1: D0 E9     BNE bra_8ABC

; 07
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014AE3 05:8AD3: AD 54 00  LDA a: ram_0054_time
    BNE     bra_8AE2_RTS             ; BNE  ; orig: C - - - - - 0x014AE6 05:8AD6: D0 0A     BNE bra_8AE2_RTS
    MOVE.B  ram_0002_t24_direction,D0  ; orig: C - - - - - 0x014AE8 05:8AD8: A5 02     LDA ram_0002_t24_dir
sub_8ADA:  ; orig: sub_8ADA:
    ; (empty translation for STA)  ; orig: C - - - - - 0x014AEA 05:8ADA: 8D 55 00  STA a: ram_0055_dire
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x014AED 05:8ADD: A9 06     LDA #$06
    ; (empty translation for STA)  ; orig: C - - - - - 0x014AEF 05:8ADF: 8D 54 00  STA a: ram_0054_time
bra_8AE2_RTS:  ; orig: bra_8AE2_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014AF2 05:8AE2: 60        RTS



tbl_8AE3_spr_data:  ; orig: tbl_8AE3_spr_data:
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 0 - - - 0x014AF3 05:8AE3: F3        .byte $F3   ; spr_T
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x014AF4 05:8AE4: 02        .byte $02   ; spr_A
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x014AF5 05:8AE5: 40        .byte $40   ; spr_X



tbl_8AE6_spr_Y:  ; orig: tbl_8AE6_spr_Y:
    ; [DIRECTIVE] .BYTE $4F  -- needs manual handling  ; orig: - D 0 - - - 0x014AF6 05:8AE6: 4F        .byte $4F   ;
    ; [DIRECTIVE] .BYTE $67  -- needs manual handling  ; orig: - D 0 - - - 0x014AF7 05:8AE7: 67        .byte $67   ;
    ; [DIRECTIVE] .BYTE $7F  -- needs manual handling  ; orig: - D 0 - - - 0x014AF8 05:8AE8: 7F        .byte $7F   ;



tbl_8AE9:  ; orig: tbl_8AE9:
    ; [DIRECTIVE] .BYTE con_script_03  -- needs manual handling  ; orig: - D 0 - - - 0x014AF9 05:8AE9: 03        .byte con_script_03 
    ; [DIRECTIVE] .BYTE con_script_0D  -- needs manual handling  ; orig: - D 0 - - - 0x014AFA 05:8AEA: 0D        .byte con_script_0D 
    ; [DIRECTIVE] .BYTE con_script_title_screen  -- needs manual handling  ; orig: - D 0 - - - 0x014AFB 05:8AEB: 00        .byte con_script_tit



tbl_8AEC:  ; orig: tbl_8AEC:
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x014AFC 05:8AEC: 23        .byte $23   ; 00
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 0 - - - 0x014AFD 05:8AED: D2        .byte $D2   ; 01
    ; [DIRECTIVE] .BYTE $43  -- needs manual handling  ; orig: - D 0 - - - 0x014AFE 05:8AEE: 43        .byte $43   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x014AFF 05:8AEF: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x014B00 05:8AF0: FF        .byte $FF   ; 04



tbl_8AF1:  ; orig: tbl_8AF1:
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 0 - - - 0x014B01 05:8AF1: D2        .byte $D2   ; 00
    ; [DIRECTIVE] .BYTE $DA  -- needs manual handling  ; orig: - D 0 - - - 0x014B02 05:8AF2: DA        .byte $DA   ; 01
    ; [DIRECTIVE] .BYTE $E2  -- needs manual handling  ; orig: - D 0 - - - 0x014B03 05:8AF3: E2        .byte $E2   ; 02



loc_0x014B04_save_menu_handler:  ; orig: loc_0x014B04_save_menu_handler:
    MOVE.B  ram_subscript,D0  ; orig: C D 0 - - - 0x014B04 05:8AF4: A5 13     LDA ram_subscript
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014B06 05:8AF6: 0A        ASL
    BCS     bra_8B35_option_was_selected             ; BCS  ; orig: C - - - - - 0x014B07 05:8AF7: B0 3C     BCS bra_8B35_option_

; if was not selected yet
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x014B09 05:8AF9: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Start,D0  ; orig: C - - - - - 0x014B0B 05:8AFB: 29 10     AND #con_btn_Start
    BNE     bra_8B2A_select_option             ; BNE  ; orig: C - - - - - 0x014B0D 05:8AFD: D0 2B     BNE bra_8B2A_select_
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x014B0F 05:8AFF: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_Select,D0  ; orig: C - - - - - 0x014B11 05:8B01: 29 20     AND #con_btn_Select
    BEQ     bra_8B16             ; BEQ  ; orig: C - - - - - 0x014B13 05:8B03: F0 11     BEQ bra_8B16
    MOVE.B  #con_sfx_4_shield_block,D0  ; orig: C - - - - - 0x014B15 05:8B05: A9 01     LDA #con_sfx_4_shiel
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x014B17 05:8B07: 8D 04 06  STA ram_sfx_4
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014B1A 05:8B0A: E6 13     INC ram_subscript
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014B1C 05:8B0C: A5 13     LDA ram_subscript
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x014B1E 05:8B0E: C9 03     CMP #$03
    BNE     bra_8B16             ; BNE  ; orig: C - - - - - 0x014B20 05:8B10: D0 04     BNE bra_8B16
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014B22 05:8B12: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x014B24 05:8B14: 85 13     STA ram_subscript
bra_8B16:  ; orig: bra_8B16:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x014B26 05:8B16: A0 02     LDY #$02
bra_8B18_loop:  ; orig: bra_8B18_loop:
    MOVE.B  tbl_8AE3_spr_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014B28 05:8B18: B9 E3 8A  LDA tbl_8AE3_spr_dat
    MOVE.B  D0,ram_spr_T(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x014B2B 05:8B1B: 99 01 02  STA ram_spr_T,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014B2E 05:8B1E: 88        DEY
    BPL     bra_8B18_loop             ; BPL  ; orig: C - - - - - 0x014B2F 05:8B1F: 10 F7     BPL bra_8B18_loop
    MOVE.B  ram_subscript,D2  ; orig: C - - - - - 0x014B31 05:8B21: A4 13     LDY ram_subscript
    MOVE.B  tbl_8AE6_spr_Y(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014B33 05:8B23: B9 E6 8A  LDA tbl_8AE6_spr_Y,Y
    MOVE.B  D0,ram_spr_Y  ; orig: C - - - - - 0x014B36 05:8B26: 8D 00 02  STA ram_spr_Y
    RTS                     ; RTS  ; orig: C - - - - - 0x014B39 05:8B29: 60        RTS
bra_8B2A_select_option:  ; orig: bra_8B2A_select_option:
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014B3A 05:8B2A: A5 13     LDA ram_subscript
    ORI.B   #$80,D0  ; orig: C - - - - - 0x014B3C 05:8B2C: 09 80     ORA #$80
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x014B3E 05:8B2E: 85 13     STA ram_subscript
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x014B40 05:8B30: A9 40     LDA #$40
    ; (empty translation for STA)  ; orig: C - - - - - 0x014B42 05:8B32: 85 29     STA ram_timer_enemy 
    RTS                     ; RTS  ; orig: C - - - - - 0x014B44 05:8B34: 60        RTS
bra_8B35_option_was_selected:  ; orig: bra_8B35_option_was_selected:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014B45 05:8B35: A5 29     LDA ram_timer_enemy 
    BEQ     bra_8B5D             ; BEQ  ; orig: C - - - - - 0x014B47 05:8B37: F0 24     BEQ bra_8B5D
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x014B49 05:8B39: A0 04     LDY #$04
bra_8B3B_loop:  ; orig: bra_8B3B_loop:
    MOVE.B  tbl_8AEC(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014B4B 05:8B3B: B9 EC 8A  LDA tbl_8AEC,Y
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x014B4E 05:8B3E: 99 02 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014B51 05:8B41: 88        DEY
    BPL     bra_8B3B_loop             ; BPL  ; orig: C - - - - - 0x014B52 05:8B42: 10 F7     BPL bra_8B3B_loop
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014B54 05:8B44: A5 13     LDA ram_subscript
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x014B56 05:8B46: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014B58 05:8B48: A8        TAY
    MOVE.B  tbl_8AF1(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014B59 05:8B49: B9 F1 8A  LDA tbl_8AF1,Y
    ; (empty translation for STA)  ; orig: C - - - - - 0x014B5C 05:8B4C: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x014B5F 05:8B4F: A0 00     LDY #$00
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014B61 05:8B51: A5 29     LDA ram_timer_enemy 
    ANDI.B  #$04,D0  ; orig: C - - - - - 0x014B63 05:8B53: 29 04     AND #$04
    BEQ     bra_8B59             ; BEQ  ; orig: C - - - - - 0x014B65 05:8B55: F0 02     BEQ bra_8B59
    MOVE.B  #$55,D2  ; orig: C - - - - - 0x014B67 05:8B57: A0 55     LDY #$55
bra_8B59:  ; orig: bra_8B59:
    ; (empty translation for STY)  ; orig: C - - - - - 0x014B69 05:8B59: 8C 05 03  STY ram_0302_ppu_buf
    RTS                     ; RTS  ; orig: C - - - - - 0x014B6C 05:8B5C: 60        RTS
bra_8B5D:  ; orig: bra_8B5D:
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x014B6D 05:8B5D: A5 13     LDA ram_subscript
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x014B6F 05:8B5F: 29 03     AND #$03
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x014B71 05:8B61: 85 13     STA ram_subscript
    BSR     sub_0x01EA61             ; JSR -> BSR  ; orig: C - - - - - 0x014B73 05:8B63: 20 51 EA  JSR sub_0x01EA61
    MOVE.B  ram_subscript,D2  ; orig: C - - - - - 0x014B76 05:8B66: A4 13     LDY ram_subscript
    MOVE.B  tbl_8AE9(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014B78 05:8B68: B9 E9 8A  LDA tbl_8AE9,Y
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x014B7B 05:8B6B: 85 12     STA ram_script
    MOVE.B  ram_item_hearts,D0  ; orig: C - - - - - 0x014B7D 05:8B6D: AD 6F 06  LDA ram_item_hearts
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x014B80 05:8B70: 29 F0     AND #$F0
    ORI.B   #$02,D0  ; orig: C - - - - - 0x014B82 05:8B72: 09 02     ORA #$02
    MOVE.B  D0,ram_item_hearts  ; orig: C - - - - - 0x014B84 05:8B74: 8D 6F 06  STA ram_item_hearts
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x014B87 05:8B77: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x014B89 05:8B79: 8D 70 06  STA ram_item_hearts 
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C - - - - - 0x014B8C 05:8B7C: 20 A3 EB  JSR sub_0x01EBB3_cle
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x014B8F 05:8B7F: C0 02     CPY #$02
    BNE     bra_8B88             ; BNE  ; orig: C - - - - - 0x014B91 05:8B81: D0 05     BNE bra_8B88    ; if

; if RETRY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014B93 05:8B83: 88        DEY ; 01
    MOVE.B  D2,ram_subscript  ; orig: C - - - - - 0x014B94 05:8B84: 84 13     STY ram_subscript
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x014B96 05:8B86: E6 11     INC ram_0011_screen_
bra_8B88:  ; orig: bra_8B88:
    JMP     loc_bat_6EE9  ; orig: C - - - - - 0x014B98 05:8B88: 4C E9 6E  JMP loc_bat_6EE9



loc_0x014B9B:  ; orig: loc_0x014B9B:
    MOVE.B  ram_collision_tile_link,D0  ; orig: C D 0 - - - 0x014B9B 05:8B8B: AD 9E 04  LDA ram_collision_ti
    CMPI.B  #con_collision_tile + $24,D0  ; orig: C - - - - - 0x014B9E 05:8B8E: C9 24     CMP #con_collision_t
    BNE     bra_8BA1             ; BNE  ; orig: C - - - - - 0x014BA0 05:8B90: D0 0F     BNE bra_8BA1
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x014BA2 05:8B92: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x014BA4 05:8B94: 29 03     AND #$03
    BNE     bra_8BA8             ; BNE  ; orig: C - - - - - 0x014BA6 05:8B96: D0 10     BNE bra_8BA8
    ADDQ.B  #1,ram_pos_Y_link  ; orig: C - - - - - 0x014BA8 05:8B98: E6 84     INC ram_pos_Y_link
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014BAA 05:8B9A: A5 84     LDA ram_pos_Y_link
    CMP.B   ram_0412,D0  ; orig: C - - - - - 0x014BAC 05:8B9C: CD 12 04  CMP ram_0412
    BNE     bra_8BA8             ; BNE  ; orig: C - - - - - 0x014BAF 05:8B9F: D0 07     BNE bra_8BA8
bra_8BA1:  ; orig: bra_8BA1:
    MOVE.B  ram_next_script,D0  ; orig: C - - - - - 0x014BB1 05:8BA1: A5 5B     LDA ram_next_script
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x014BB3 05:8BA3: 85 12     STA ram_script
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C - - - - - 0x014BB5 05:8BA5: 20 A3 EB  JSR sub_0x01EBB3_cle
bra_8BA8:  ; orig: bra_8BA8:
sub_0x014BB8:  ; orig: sub_0x014BB8:
    BSR     sub_0x01F24C             ; JSR -> BSR  ; orig: C - - - - - 0x014BB8 05:8BA8: 20 3C F2  JSR sub_0x01F24C
sub_8BAB:  ; orig: sub_8BAB:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014BBB 05:8BAB: AD 4A 02  LDA ram_spr_A + $48
    ORI.B   #$20,D0  ; orig: C - - - - - 0x014BBE 05:8BAE: 09 20     ORA #$20
    ; (empty translation for STA)  ; orig: C - - - - - 0x014BC0 05:8BB0: 8D 4A 02  STA ram_spr_A + $48
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014BC3 05:8BB3: AD 4E 02  LDA ram_spr_A + $4C
    ORI.B   #$20,D0  ; orig: C - - - - - 0x014BC6 05:8BB6: 09 20     ORA #$20
    ; (empty translation for STA)  ; orig: C - - - - - 0x014BC8 05:8BB8: 8D 4E 02  STA ram_spr_A + $4C
    RTS                     ; RTS  ; orig: C - - - - - 0x014BCB 05:8BBB: 60        RTS



sub_0x014BCC:  ; orig: sub_0x014BCC:
    BSR     sub_8BFA             ; JSR -> BSR  ; orig: C - - - - - 0x014BCC 05:8BBC: 20 FA 8B  JSR sub_8BFA
    MOVE.B  ram_04CD_map_data_byte,D0  ; orig: C - - - - - 0x014BCF 05:8BBF: AD CD 04  LDA ram_04CD_map_dat
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x014BD2 05:8BC2: 29 07     AND #$07
    BEQ     bra_8BE6_RTS             ; BEQ  ; orig: C - - - - - 0x014BD4 05:8BC4: F0 20     BEQ bra_8BE6_RTS
    BSR     sub_8BE7             ; JSR -> BSR  ; orig: C - - - - - 0x014BD6 05:8BC6: 20 E7 8B  JSR sub_8BE7
    BCC     bra_8BE6_RTS             ; BCC  ; orig: C - - - - - 0x014BD9 05:8BC9: 90 1B     BCC bra_8BE6_RTS
    MOVE.B  ram_04CD_map_data_byte,D0  ; orig: C - - - - - 0x014BDB 05:8BCB: AD CD 04  LDA ram_04CD_map_dat
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x014BDE 05:8BCE: 29 07     AND #$07
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x014BE0 05:8BD0: C9 07     CMP #$07
    BNE     bra_8BE6_RTS             ; BNE  ; orig: C - - - - - 0x014BE2 05:8BD2: D0 12     BNE bra_8BE6_RTS
    MOVE.B  ram_room_item_flag,D0  ; orig: C - - - - - 0x014BE4 05:8BD4: A5 BF     LDA ram_room_item_fl
    BEQ     bra_8BE6_RTS             ; BEQ  ; orig: C - - - - - 0x014BE6 05:8BD6: F0 0E     BEQ bra_8BE6_RTS

; if room doesn't have an item
    BSR     sub_bat_7314_check_map_bit4             ; JSR -> BSR  ; orig: C - - - - - 0x014BE8 05:8BD8: 20 14 73  JSR sub_bat_7314_che
    BNE     bra_8BE6_RTS             ; BNE  ; orig: C - - - - - 0x014BEB 05:8BDB: D0 09     BNE bra_8BE6_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014BED 05:8BDD: A9 00     LDA #$00
    MOVE.B  D0,ram_room_item_flag  ; orig: C - - - - - 0x014BEF 05:8BDF: 85 BF     STA ram_room_item_fl
    MOVE.B  #con_sfx_2_02,D0  ; orig: C - - - - - 0x014BF1 05:8BE1: A9 02     LDA #con_sfx_2_02
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x014BF3 05:8BE3: 8D 02 06  STA ram_sfx_2
bra_8BE6_RTS:  ; orig: bra_8BE6_RTS:
ofs_019_8BE6_00_RTS:  ; orig: ofs_019_8BE6_00_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014BF6 05:8BE6: 60        RTS



sub_8BE7:  ; orig: sub_8BE7:
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x014BF7 05:8BE7: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_019_8BE6_00_RTS  -- needs manual handling  ; orig: - - - - - - 0x014BFA 05:8BEA: E6 8B     .word ofs_019_8BE6_0
    ; [DIRECTIVE] .WORD ofs_019_8C1A_01  -- needs manual handling  ; orig: - D 0 - I - 0x014BFC 05:8BEC: 1A 8C     .word ofs_019_8C1A_0
    ; [DIRECTIVE] .WORD ofs_019_8C28_02  -- needs manual handling  ; orig: - D 0 - I - 0x014BFE 05:8BEE: 28 8C     .word ofs_019_8C28_0
    ; [DIRECTIVE] .WORD ofs_019_8C6F_03  -- needs manual handling  ; orig: - D 0 - I - 0x014C00 05:8BF0: 6F 8C     .word ofs_019_8C6F_0
    ; [DIRECTIVE] .WORD ofs_019_8C4C_04  -- needs manual handling  ; orig: - D 0 - I - 0x014C02 05:8BF2: 4C 8C     .word ofs_019_8C4C_0
    ; [DIRECTIVE] .WORD ofs_019_8C53_05  -- needs manual handling  ; orig: - D 0 - I - 0x014C04 05:8BF4: 53 8C     .word ofs_019_8C53_0
    ; [DIRECTIVE] .WORD ofs_019_8C76_06  -- needs manual handling  ; orig: - D 0 - I - 0x014C06 05:8BF6: 76 8C     .word ofs_019_8C76_0
    ; [DIRECTIVE] .WORD ofs_019_8C1A_07  -- needs manual handling  ; orig: - D 0 - I - 0x014C08 05:8BF8: 1A 8C     .word ofs_019_8C1A_0



sub_8BFA:  ; orig: sub_8BFA:
    MOVE.B  ram_obj_index,D2  ; orig: C - - - - - 0x014C0A 05:8BFA: AC 40 03  LDY ram_obj_index
bra_8BFD_loop:  ; orig: bra_8BFD_loop:
    MOVE.B  ram_obj_id_enemy(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014C0D 05:8BFD: B9 50 03  LDA ram_obj_id_enemy
    BEQ     bra_8C0E             ; BEQ  ; orig: C - - - - - 0x014C10 05:8C00: F0 0C     BEQ bra_8C0E    ; if
    CMPI.B  #$2B,D0  ; orig: C - - - - - 0x014C12 05:8C02: C9 2B     CMP #$2B
    BCC     bra_8C19_RTS             ; BCC  ; orig: C - - - - - 0x014C14 05:8C04: 90 13     BCC bra_8C19_RTS
    CMPI.B  #$2E,D0  ; orig: C - - - - - 0x014C16 05:8C06: C9 2E     CMP #$2E
    BCC     bra_8C0E             ; BCC  ; orig: C - - - - - 0x014C18 05:8C08: 90 04     BCC bra_8C0E
    CMPI.B  #$49,D0  ; orig: C - - - - - 0x014C1A 05:8C0A: C9 49     CMP #$49
    BCC     bra_8C19_RTS             ; BCC  ; orig: C - - - - - 0x014C1C 05:8C0C: 90 0B     BCC bra_8C19_RTS
bra_8C0E:  ; orig: bra_8C0E:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014C1E 05:8C0E: 88        DEY
    BPL     bra_8BFD_loop             ; BPL  ; orig: C - - - - - 0x014C1F 05:8C0F: 10 EC     BPL bra_8BFD_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014C21 05:8C11: A9 00     LDA #$00
    MOVE.B  D0,ram_0512_flag  ; orig: C - - - - - 0x014C23 05:8C13: 8D 12 05  STA ram_0512_flag
    ADDQ.B  #1,ram_034D_flag  ; orig: C - - - - - 0x014C26 05:8C16: EE 4D 03  INC ram_034D_flag
bra_8C19_RTS:  ; orig: bra_8C19_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014C29 05:8C19: 60        RTS



ofs_019_8C1A_01:  ; orig: ofs_019_8C1A_01:
ofs_019_8C1A_07:  ; orig: ofs_019_8C1A_07:
    MOVE.B  ram_034D_flag,D0  ; orig: C - - J - - 0x014C2A 05:8C1A: AD 4D 03  LDA ram_034D_flag
    BEQ     bra_8C26             ; BEQ  ; orig: C - - - - - 0x014C2D 05:8C1D: F0 07     BEQ bra_8C26
bra_8C1F:  ; orig: bra_8C1F:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014C2F 05:8C1F: A9 01     LDA #$01
    MOVE.B  D0,ram_04CE_flag  ; orig: C - - - - - 0x014C31 05:8C21: 8D CE 04  STA ram_04CE_flag
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014C34 05:8C24: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C35 05:8C25: 60        RTS
bra_8C26:  ; orig: bra_8C26:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014C36 05:8C26: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C37 05:8C27: 60        RTS



ofs_019_8C28_02:  ; orig: ofs_019_8C28_02:
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - J - - 0x014C38 05:8C28: AD 50 03  LDA ram_obj_id_enemy
    BEQ     bra_8C31             ; BEQ  ; orig: C - - - - - 0x014C3B 05:8C2B: F0 04     BEQ bra_8C31    ; if
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x014C3D 05:8C2D: C9 53     CMP #$53
    BCC     bra_8C26             ; BCC  ; orig: C - - - - - 0x014C3F 05:8C2F: 90 F5     BCC bra_8C26
bra_8C31:  ; orig: bra_8C31:
    MOVE.B  ram_obj_index,D2  ; orig: C - - - - - 0x014C41 05:8C31: AC 40 03  LDY ram_obj_index
bra_8C34_loop:  ; orig: bra_8C34_loop:
    MOVE.B  ram_obj_id_enemy(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014C44 05:8C34: B9 50 03  LDA ram_obj_id_enemy
    BEQ     bra_8C47             ; BEQ  ; orig: C - - - - - 0x014C47 05:8C37: F0 0E     BEQ bra_8C47    ; if
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x014C49 05:8C39: C9 53     CMP #$53
    BCS     bra_8C47             ; BCS  ; orig: C - - - - - 0x014C4B 05:8C3B: B0 0A     BCS bra_8C47
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014C4D 05:8C3D: B9 06 04  LDA ram_0405_enemy +
    BNE     bra_8C47             ; BNE  ; orig: C - - - - - 0x014C50 05:8C40: D0 05     BNE bra_8C47
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x014C52 05:8C42: A9 10     LDA #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x014C54 05:8C44: 99 06 04  STA ram_0405_enemy +
bra_8C47:  ; orig: bra_8C47:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014C57 05:8C47: 88        DEY
    BPL     bra_8C34_loop             ; BPL  ; orig: C - - - - - 0x014C58 05:8C48: 10 EA     BPL bra_8C34_loop
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014C5A 05:8C4A: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C5B 05:8C4B: 60        RTS



ofs_019_8C4C_04:  ; orig: ofs_019_8C4C_04:
    MOVE.B  ram_04CF_flag,D0  ; orig: C - - J - - 0x014C5C 05:8C4C: AD CF 04  LDA ram_04CF_flag
    BEQ     bra_8C26             ; BEQ  ; orig: C - - - - - 0x014C5F 05:8C4F: F0 D5     BEQ bra_8C26
    BNE     bra_8C1F             ; BNE  ; orig: C - - - - - 0x014C61 05:8C51: D0 CC     BNE bra_8C1F    ; jm



ofs_019_8C53_05:  ; orig: ofs_019_8C53_05:
    MOVE.B  ram_04CF_flag,D0  ; orig: C - - J - - 0x014C63 05:8C53: AD CF 04  LDA ram_04CF_flag
    BEQ     bra_8C26             ; BEQ  ; orig: C - - - - - 0x014C66 05:8C56: F0 CE     BEQ bra_8C26
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014C68 05:8C58: 4A        LSR
    BCC     bra_8C26             ; BCC  ; orig: C - - - - - 0x014C69 05:8C59: 90 CB     BCC bra_8C26
    ADDQ.B  #1,ram_04CF_flag  ; orig: C - - - - - 0x014C6B 05:8C5B: EE CF 04  INC ram_04CF_flag
    MOVE.B  #$0B,D1  ; orig: C - - - - - 0x014C6E 05:8C5E: A2 0B     LDX #$0B
    MOVE.B  #$D0,D0  ; orig: C - - - - - 0x014C70 05:8C60: A9 D0     LDA #$D0
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014C72 05:8C62: 95 70     STA ram_pos_X_enemy,
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x014C74 05:8C64: A9 60     LDA #$60
    MOVE.B  D0,ram_pos_Y_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014C76 05:8C66: 95 84     STA ram_pos_Y_enemy,
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x014C78 05:8C68: A9 70     LDA #$70
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x014C7A 05:8C6A: 20 62 E8  JSR sub_0x01E872_bom
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014C7D 05:8C6D: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C7E 05:8C6E: 60        RTS



ofs_019_8C6F_03:  ; orig: ofs_019_8C6F_03:
    MOVE.B  ram_item_0672,D0  ; orig: C - - J - - 0x014C7F 05:8C6F: AD 72 06  LDA ram_item_0672
    BNE     bra_8C1F             ; BNE  ; orig: C - - - - - 0x014C82 05:8C72: D0 AB     BNE bra_8C1F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014C84 05:8C74: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C85 05:8C75: 60        RTS



ofs_019_8C76_06:  ; orig: ofs_019_8C76_06:
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - J - - 0x014C86 05:8C76: AD 50 03  LDA ram_obj_id_enemy
    BEQ     bra_8C1F             ; BEQ  ; orig: C - - - - - 0x014C89 05:8C79: F0 A4     BEQ bra_8C1F    ; if
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014C8B 05:8C7B: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x014C8C 05:8C7C: 60        RTS



loc_0x014C8D_death_subroutines:  ; orig: loc_0x014C8D_death_subroutines:
    MOVE.B  ram_subscript,D0  ; orig: C D 0 - - - 0x014C8D 05:8C7D: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x014C8F 05:8C7F: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_link_death_8CA1_00  -- needs manual handling  ; orig: - D 0 - I - 0x014C92 05:8C82: A1 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8C9C_01  -- needs manual handling  ; orig: - D 0 - I - 0x014C94 05:8C84: 9C 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CAC_02  -- needs manual handling  ; orig: - D 0 - I - 0x014C96 05:8C86: AC 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CBE_03  -- needs manual handling  ; orig: - D 0 - I - 0x014C98 05:8C88: BE 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CC3_04  -- needs manual handling  ; orig: - D 0 - I - 0x014C9A 05:8C8A: C3 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CC8_05  -- needs manual handling  ; orig: - D 0 - I - 0x014C9C 05:8C8C: C8 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CD1_06  -- needs manual handling  ; orig: - D 0 - I - 0x014C9E 05:8C8E: D1 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CDA_07  -- needs manual handling  ; orig: - D 0 - I - 0x014CA0 05:8C90: DA 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8CFB_08  -- needs manual handling  ; orig: - D 0 - I - 0x014CA2 05:8C92: FB 8C     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8D01_09  -- needs manual handling  ; orig: - D 0 - I - 0x014CA4 05:8C94: 01 8D     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8D0D_0A  -- needs manual handling  ; orig: - D 0 - I - 0x014CA6 05:8C96: 0D 8D     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8D56_0B  -- needs manual handling  ; orig: - D 0 - I - 0x014CA8 05:8C98: 56 8D     .word ofs_link_death
    ; [DIRECTIVE] .WORD ofs_link_death_8D63_0C  -- needs manual handling  ; orig: - D 0 - I - 0x014CAA 05:8C9A: 63 8D     .word ofs_link_death



ofs_link_death_8C9C_01:  ; orig: ofs_link_death_8C9C_01:
    MOVE.B  #con_sfx_2_death,D0  ; orig: C - - J - - 0x014CAC 05:8C9C: A9 80     LDA #con_sfx_2_death
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x014CAE 05:8C9E: 8D 02 06  STA ram_sfx_2
ofs_link_death_8CA1_00:  ; orig: ofs_link_death_8CA1_00:
    BSR     sub_8484             ; JSR -> BSR  ; orig: C - - J - - 0x014CB1 05:8CA1: 20 84 84  JSR sub_8484
loc_8CA4:  ; orig: loc_8CA4:
    MOVE.B  #$2B,D1  ; orig: C D 0 - - - 0x014CB4 05:8CA4: A2 2B     LDX #$2B
loc_8CA6:  ; orig: loc_8CA6:
    BSR     sub_B0E1_write_nametable_attributes_to_buffer             ; JSR -> BSR  ; orig: C D 0 - - - 0x014CB6 05:8CA6: 20 E1 B0  JSR sub_B0E1_write_n
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014CB9 05:8CA9: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x014CBB 05:8CAB: 60        RTS



ofs_link_death_8CAC_02:  ; orig: ofs_link_death_8CAC_02:
    BSR     sub_AC10             ; JSR -> BSR  ; orig: C - - J - - 0x014CBC 05:8CAC: 20 10 AC  JSR sub_AC10
    BCC     bra_8CB4             ; BCC  ; orig: C - - - - - 0x014CBF 05:8CAF: 90 03     BCC bra_8CB4
    BSR     sub_83B2             ; JSR -> BSR  ; orig: C - - - - - 0x014CC1 05:8CB1: 20 B2 83  JSR sub_83B2
bra_8CB4:  ; orig: bra_8CB4:
    MOVE.B  ram_0302_ppu_buffer,D0  ; orig: C - - - - - 0x014CC4 05:8CB4: AD 02 03  LDA ram_0302_ppu_buf
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014CC7 05:8CB7: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014CC8 05:8CB8: 69 08     ADC #$08
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x014CCA 05:8CBA: 8D 02 03  STA ram_0302_ppu_buf
    RTS                     ; RTS  ; orig: C - - - - - 0x014CCD 05:8CBD: 60        RTS



ofs_link_death_8CBE_03:  ; orig: ofs_link_death_8CBE_03:
    MOVE.B  #con_ppu_buf_60,D0  ; orig: C - - J - - 0x014CCE 05:8CBE: A9 60     LDA #con_ppu_buf_60
loc_8CC0_set_ppu_load_index:  ; orig: loc_8CC0_set_ppu_load_index:

; bzk optimize, JMP into JMP
    JMP     loc_B12E_set_ppu_load_index  ; orig: C D 0 - - - 0x014CD0 05:8CC0: 4C 2E B1  JMP loc_B12E_set_ppu



ofs_link_death_8CC3_04:  ; orig: ofs_link_death_8CC3_04:
    MOVE.B  #con_ppu_buf_62,D0  ; orig: C - - J - - 0x014CD3 05:8CC3: A9 62     LDA #con_ppu_buf_62
    JMP     loc_8CC0_set_ppu_load_index  ; orig: C - - - - - 0x014CD5 05:8CC5: 4C C0 8C  JMP loc_8CC0_set_ppu



ofs_link_death_8CC8_05:  ; orig: ofs_link_death_8CC8_05:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x014CD8 05:8CC8: A9 00     LDA #$00
    MOVE.B  D0,ram_screen_transition_flag  ; orig: C - - - - - 0x014CDA 05:8CCA: 85 E3     STA ram_screen_trans
    MOVE.B  #con_ppu_buf_5E,D0  ; orig: C - - - - - 0x014CDC 05:8CCC: A9 5E     LDA #con_ppu_buf_5E
    JMP     loc_8CC0_set_ppu_load_index  ; orig: C - - - - - 0x014CDE 05:8CCE: 4C C0 8C  JMP loc_8CC0_set_ppu



ofs_link_death_8CD1_06:  ; orig: ofs_link_death_8CD1_06:
    MOVE.B  ram_for_2000,D0  ; orig: C - - J - - 0x014CE1 05:8CD1: A5 FF     LDA ram_for_2000
    ANDI.B  #$FE,D0  ; orig: C - - - - - 0x014CE3 05:8CD3: 29 FE     AND #$FE
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x014CE5 05:8CD5: 85 FF     STA ram_for_2000
bra_8CD7_next_subscript:  ; orig: bra_8CD7_next_subscript:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014CE7 05:8CD7: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x014CE9 05:8CD9: 60        RTS



ofs_link_death_8CDA_07:  ; orig: ofs_link_death_8CDA_07:
    MOVE.B  ram_00E5_t02_counter,D0  ; orig: C - - J - - 0x014CEA 05:8CDA: A5 E5     LDA ram_00E5_t02_cou
    BEQ     bra_8CD7_next_subscript             ; BEQ  ; orig: C - - - - - 0x014CEC 05:8CDC: F0 F9     BEQ bra_8CD7_next_su
    ; (empty translation for LDA)  ; orig: C - - - - - 0x014CEE 05:8CDE: A5 33     LDA ram_timer_enemy 
    BNE     bra_8CF2             ; BNE  ; orig: C - - - - - 0x014CF0 05:8CE0: D0 10     BNE bra_8CF2
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x014CF2 05:8CE2: A9 05     LDA #$05
    ; (empty translation for STA)  ; orig: C - - - - - 0x014CF4 05:8CE4: 85 33     STA ram_timer_enemy 
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014CF6 05:8CE6: A5 98     LDA ram_dir_link

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014CF8 05:8CE8: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x014CF9 05:8CE9: 4A        LSR
    BCC     bra_8CF5_not_down             ; BCC  ; orig: C - - - - - 0x014CFA 05:8CEA: 90 09     BCC bra_8CF5_not_dow

; if down
    SUBQ.B  #1,ram_00E5_t02_counter  ; orig: C - - - - - 0x014CFC 05:8CEC: C6 E5     DEC ram_00E5_t02_cou
    MOVE.B  #con_dir_Down,D0  ; orig: C - - - - - 0x014CFE 05:8CEE: A9 04     LDA #con_dir_Down
bra_8CF0:  ; orig: bra_8CF0:
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x014D00 05:8CF0: 85 98     STA ram_dir_link
bra_8CF2:  ; orig: bra_8CF2:
    JMP     loc_0x01F24C  ; orig: C - - - - - 0x014D02 05:8CF2: 4C 3C F2  JMP loc_0x01F24C
bra_8CF5_not_down:  ; orig: bra_8CF5_not_down:
    BNE     bra_8CF0             ; BNE  ; orig: C - - - - - 0x014D05 05:8CF5: D0 F9     BNE bra_8CF0
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x014D07 05:8CF7: A9 08     LDA #con_dir_Up
    BNE     bra_8CF0             ; BNE  ; orig: C - - - - - 0x014D09 05:8CF9: D0 F5     BNE bra_8CF0    ; jm



loc_8CFB:  ; orig: loc_8CFB:
ofs_link_death_8CFB_08:  ; orig: ofs_link_death_8CFB_08:
    BSR     sub_bat_74B7             ; JSR -> BSR  ; orig: C D 0 - - - 0x014D0B 05:8CFB: 20 B7 74  JSR sub_bat_74B7
    BEQ     bra_8CD7_next_subscript             ; BEQ  ; orig: C - - - - - 0x014D0E 05:8CFE: F0 D7     BEQ bra_8CD7_next_su
    RTS                     ; RTS  ; orig: C - - - - - 0x014D10 05:8D00: 60        RTS



ofs_link_death_8D01_09:  ; orig: ofs_link_death_8D01_09:
    MOVE.B  #con_ppu_buf_2C,D0  ; orig: C - - J - - 0x014D11 05:8D01: A9 2C     LDA #con_ppu_buf_2C
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x014D13 05:8D03: 85 14     STA ram_ppu_load_ind
    MOVE.B  #$0F,D0  ; orig: C - - - - - 0x014D15 05:8D05: A9 0F     LDA #$0F
    MOVE.B  D0,ram_00E5_t01  ; orig: C - - - - - 0x014D17 05:8D07: 85 E5     STA ram_00E5_t01
    MOVE.B  #$18,D0  ; orig: C - - - - - 0x014D19 05:8D09: A9 18     LDA #$18
    BNE     bra_8D51             ; BNE  ; orig: C - - - - - 0x014D1B 05:8D0B: D0 44     BNE bra_8D51    ; jm



ofs_link_death_8D0D_0A:  ; orig: ofs_link_death_8D0D_0A:
    ; (empty translation for LDA)  ; orig: C - - J - - 0x014D1D 05:8D0D: A5 33     LDA ram_timer_enemy 
    BNE     bra_8D55_RTS             ; BNE  ; orig: C - - - - - 0x014D1F 05:8D0F: D0 44     BNE bra_8D55_RTS
    MOVE.B  #$62,D1  ; orig: C - - - - - 0x014D21 05:8D11: A2 62     LDX #$62
    MOVE.B  ram_00E5_t01,D0  ; orig: C - - - - - 0x014D23 05:8D13: A5 E5     LDA ram_00E5_t01
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x014D25 05:8D15: C9 06     CMP #$06
    BCS     bra_8D1B             ; BCS  ; orig: C - - - - - 0x014D27 05:8D17: B0 02     BCS bra_8D1B
    MOVE.B  #$64,D1  ; orig: C - - - - - 0x014D29 05:8D19: A2 64     LDX #$64
bra_8D1B:  ; orig: bra_8D1B:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014D2B 05:8D1B: A5 84     LDA ram_pos_Y_link
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D2D 05:8D1D: 8D 48 02  STA ram_spr_Y + $48
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D30 05:8D20: 8D 4C 02  STA ram_spr_Y + $4C
    ; (empty translation for STX)  ; orig: C - - - - - 0x014D33 05:8D23: 8E 49 02  STX ram_spr_T + $48
    ; (empty translation for STX)  ; orig: C - - - - - 0x014D36 05:8D26: 8E 4D 02  STX ram_spr_T + $4C
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014D39 05:8D29: A9 01     LDA #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D3B 05:8D2B: 8D 4A 02  STA ram_spr_A + $48
    MOVE.B  #$41,D0  ; orig: C - - - - - 0x014D3E 05:8D2E: A9 41     LDA #$41
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D40 05:8D30: 8D 4E 02  STA ram_spr_A + $4C
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014D43 05:8D33: A5 70     LDA ram_pos_X_link
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D45 05:8D35: 8D 4B 02  STA ram_spr_X + $48
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014D48 05:8D38: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014D49 05:8D39: 69 08     ADC #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D4B 05:8D3B: 8D 4F 02  STA ram_spr_X + $4C
    SUBQ.B  #1,ram_00E5_t01  ; orig: C - - - - - 0x014D4E 05:8D3E: C6 E5     DEC ram_00E5_t01
    BNE     bra_8D55_RTS             ; BNE  ; orig: C - - - - - 0x014D50 05:8D40: D0 13     BNE bra_8D55_RTS
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: C - - - - - 0x014D52 05:8D42: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x014D54 05:8D44: 8D 04 06  STA ram_sfx_4
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x014D57 05:8D47: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D59 05:8D49: 8D 48 02  STA ram_spr_Y + $48
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D5C 05:8D4C: 8D 4C 02  STA ram_spr_Y + $4C
    MOVE.B  #$2E,D0  ; orig: C - - - - - 0x014D5F 05:8D4F: A9 2E     LDA #$2E
bra_8D51:  ; orig: bra_8D51:
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D61 05:8D51: 85 33     STA ram_timer_enemy 
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x014D63 05:8D53: E6 13     INC ram_subscript
bra_8D55_RTS:  ; orig: bra_8D55_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014D65 05:8D55: 60        RTS



ofs_link_death_8D56_0B:  ; orig: ofs_link_death_8D56_0B:
    ; (empty translation for LDA)  ; orig: C - - J - - 0x014D66 05:8D56: A5 33     LDA ram_timer_enemy 
    BNE     bra_8D55_RTS             ; BNE  ; orig: C - - - - - 0x014D68 05:8D58: D0 FB     BNE bra_8D55_RTS
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x014D6A 05:8D5A: A9 60     LDA #$60
    ; (empty translation for STA)  ; orig: C - - - - - 0x014D6C 05:8D5C: 85 33     STA ram_timer_enemy 
    MOVE.B  #con_ppu_buf_46_game_over,D0  ; orig: C - - - - - 0x014D6E 05:8D5E: A9 46     LDA #con_ppu_buf_46_
    JMP     loc_8CC0_set_ppu_load_index  ; orig: C - - - - - 0x014D70 05:8D60: 4C C0 8C  JMP loc_8CC0_set_ppu



ofs_link_death_8D63_0C:  ; orig: ofs_link_death_8D63_0C:
    ; (empty translation for LDA)  ; orig: C - - J - - 0x014D73 05:8D63: A5 33     LDA ram_timer_enemy 
    BNE     bra_8D7F_RTS             ; BNE  ; orig: C - - - - - 0x014D75 05:8D65: D0 18     BNE bra_8D7F_RTS
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C - - - - - 0x014D77 05:8D67: 20 A3 EB  JSR sub_0x01EBB3_cle
    MOVE.B  #con_script_save_menu,D0  ; orig: C - - - - - 0x014D7A 05:8D6A: A9 08     LDA #con_script_save
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x014D7C 05:8D6C: 85 12     STA ram_script
    MOVE.B  #con_sfx_2_40,D0  ; orig: C - - - - - 0x014D7E 05:8D6E: A9 40     LDA #con_sfx_2_40
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x014D80 05:8D70: 8D 02 06  STA ram_sfx_2
    MOVE.B  ram_current_save_slot,D1  ; orig: C - - - - - 0x014D83 05:8D73: A6 16     LDX ram_current_save
    MOVE.B  ram_death_cnt(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014D85 05:8D75: BD 30 06  LDA ram_death_cnt,X
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x014D88 05:8D78: C9 FF     CMP #$FF
    BEQ     bra_8D7F_RTS             ; BEQ  ; orig: C - - - - - 0x014D8A 05:8D7A: F0 03     BEQ bra_8D7F_RTS
    ; (empty translation for INC)  ; orig: C - - - - - 0x014D8C 05:8D7C: FE 30 06  INC ram_death_cnt,X
bra_8D7F_RTS:  ; orig: bra_8D7F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014D8F 05:8D7F: 60        RTS



tbl_8D80:  ; orig: tbl_8D80:
    ; [DIRECTIVE] .BYTE $D6  -- needs manual handling  ; orig: - D 0 - - - 0x014D90 05:8D80: D6        .byte $D6   ; 00
    ; [DIRECTIVE] .BYTE $45  -- needs manual handling  ; orig: - D 0 - - - 0x014D91 05:8D81: 45        .byte $45   ; 01
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - D 0 - - - 0x014D92 05:8D82: E9        .byte $E9   ; 02
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 0 - - - 0x014D93 05:8D83: 07        .byte $07   ; 03
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 0 - - - 0x014D94 05:8D84: C6        .byte $C6   ; 04
    ; [DIRECTIVE] .BYTE $55  -- needs manual handling  ; orig: - D 0 - - - 0x014D95 05:8D85: 55        .byte $55   ; 05
    ; [DIRECTIVE] .BYTE $D9  -- needs manual handling  ; orig: - D 0 - - - 0x014D96 05:8D86: D9        .byte $D9   ; 06
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 0 - - - 0x014D97 05:8D87: 17        .byte $17   ; 07
    ; [DIRECTIVE] .BYTE $BE  -- needs manual handling  ; orig: - D 0 - - - 0x014D98 05:8D88: BE        .byte $BE   ; 08
    ; [DIRECTIVE] .BYTE $54  -- needs manual handling  ; orig: - D 0 - - - 0x014D99 05:8D89: 54        .byte $54   ; 09
    ; [DIRECTIVE] .BYTE $D1  -- needs manual handling  ; orig: - D 0 - - - 0x014D9A 05:8D8A: D1        .byte $D1   ; 0A
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 0 - - - 0x014D9B 05:8D8B: 1F        .byte $1F   ; 0B



sub_8D8C:  ; orig: sub_8D8C:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014D9C 05:8D8C: A5 98     LDA ram_dir_link
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x014D9E 05:8D8E: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  D0,ram_0000_t64  ; orig: C - - - - - 0x014DA1 05:8D91: 85 00     STA ram_0000_t64
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x014DA3 05:8D93: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014DA6 05:8D96: A5 70     LDA ram_pos_X_link
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x014DA8 05:8D98: C0 02     CPY #$02
    BCS     bra_8D9E             ; BCS  ; orig: C - - - - - 0x014DAA 05:8D9A: B0 02     BCS bra_8D9E
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014DAC 05:8D9C: A5 84     LDA ram_pos_Y_link
bra_8D9E:  ; orig: bra_8D9E:
    MOVE.B  D0,ram_0002_t39  ; orig: C - - - - - 0x014DAE 05:8D9E: 85 02     STA ram_0002_t39
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014DB0 05:8DA0: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014DB1 05:8DA1: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014DB2 05:8DA2: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014DB3 05:8DA3: 69 08     ADC #$08
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014DB5 05:8DA5: A8        TAY
    MOVE.B  #con_btn_A,D0  ; orig: C - - - - - 0x014DB6 05:8DA6: A9 80     LDA #con_btn_A
    BSR     sub_8DC5             ; JSR -> BSR  ; orig: C - - - - - 0x014DB8 05:8DA8: 20 C5 8D  JSR sub_8DC5
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014DBB 05:8DAB: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014DBC 05:8DAC: A8        TAY
    MOVE.B  ram_0001_t28_btn,D0  ; orig: C - - - - - 0x014DBD 05:8DAD: A5 01     LDA ram_0001_t28_btn
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x014DBF 05:8DAF: C9 FF     CMP #$FF
    BNE     bra_8DBA             ; BNE  ; orig: C - - - - - 0x014DC1 05:8DB1: D0 07     BNE bra_8DBA
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014DC3 05:8DB3: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_0000_t64  ; orig: C - - - - - 0x014DC5 05:8DB5: 85 00     STA ram_0000_t64
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x014DC7 05:8DB7: 20 13 70  JSR sub_bat_7013_get
bra_8DBA:  ; orig: bra_8DBA:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x014DCA 05:8DBA: A5 10     LDA ram_dungeon_leve
    BEQ     bra_8DC3             ; BEQ  ; orig: C - - - - - 0x014DCC 05:8DBC: F0 05     BEQ bra_8DC3    ; if

; if dungeon
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014DCE 05:8DBE: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014DCF 05:8DBF: 18        CLC
    ADDX.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014DD0 05:8DC0: 69 04     ADC #$04
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014DD2 05:8DC2: A8        TAY
bra_8DC3:  ; orig: bra_8DC3:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014DD3 05:8DC3: A9 00     LDA #$00
sub_8DC5:  ; orig: sub_8DC5:

; in

; A = con_btn

; ram_0000_t64
    MOVE.B  D0,ram_0001_t28_btn  ; orig: C - - - - - 0x014DD5 05:8DC5: 85 01     STA ram_0001_t28_btn
    MOVE.B  ram_0000_t64,D0  ; orig: C - - - - - 0x014DD7 05:8DC7: A5 00     LDA ram_0000_t64
    ANDI.B  #$0A,D0  ; orig: C - - - - - 0x014DD9 05:8DC9: 29 0A     AND #$0A
    BEQ     bra_8DF4             ; BEQ  ; orig: C - - - - - 0x014DDB 05:8DCB: F0 27     BEQ bra_8DF4
    MOVE.B  ram_0002_t39,D0  ; orig: C - - - - - 0x014DDD 05:8DCD: A5 02     LDA ram_0002_t39
    CMP.B   tbl_8D80(D2.L),D0  ; orig: C - - - - - 0x014DDF 05:8DCF: D9 80 8D  CMP tbl_8D80,Y
    BCC     bra_8DFB             ; BCC  ; orig: C - - - - - 0x014DE2 05:8DD2: 90 27     BCC bra_8DFB
bra_8DD4:  ; orig: bra_8DD4:
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x014DE4 05:8DD4: A5 F8     LDA ram_btn_press
    AND.B   ram_0001_t28_btn,D0  ; orig: C - - - - - 0x014DE6 05:8DD6: 25 01     AND ram_0001_t28_btn
    MOVE.B  D0,ram_btn_press  ; orig: C - - - - - 0x014DE8 05:8DD8: 85 F8     STA ram_btn_press
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x014DEA 05:8DDA: A5 10     LDA ram_dungeon_leve
    BEQ     bra_8DF3_RTS             ; BEQ  ; orig: C - - - - - 0x014DEC 05:8DDC: F0 15     BEQ bra_8DF3_RTS    

; if dungeon
    MOVE.B  ram_0001_t28_btn,D0  ; orig: C - - - - - 0x014DEE 05:8DDE: A5 01     LDA ram_0001_t28_btn
    BNE     bra_8DF3_RTS             ; BNE  ; orig: C - - - - - 0x014DF0 05:8DE0: D0 11     BNE bra_8DF3_RTS
    MOVE.B  #$0C,D2  ; orig: C - - - - - 0x014DF2 05:8DE2: A0 0C     LDY #$0C
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014DF4 05:8DE4: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x014DF6 05:8DE6: 29 0C     AND #con_dir__UD
    BNE     bra_8DEC             ; BNE  ; orig: C - - - - - 0x014DF8 05:8DE8: D0 02     BNE bra_8DEC
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x014DFA 05:8DEA: A0 03     LDY #$03
bra_8DEC:  ; orig: bra_8DEC:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014DFC 05:8DEC: 98        TYA
    AND.B   ram_03F8_link,D0  ; orig: C - - - - - 0x014DFD 05:8DED: 2D F8 03  AND ram_03F8_link
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x014E00 05:8DF0: 8D F8 03  STA ram_03F8_link
bra_8DF3_RTS:  ; orig: bra_8DF3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014E03 05:8DF3: 60        RTS
bra_8DF4:  ; orig: bra_8DF4:
    MOVE.B  ram_0002_t39,D0  ; orig: C - - - - - 0x014E04 05:8DF4: A5 02     LDA ram_0002_t39
    CMP.B   tbl_8D80(D2.L),D0  ; orig: C - - - - - 0x014E06 05:8DF6: D9 80 8D  CMP tbl_8D80,Y
    BCC     bra_8DD4             ; BCC  ; orig: C - - - - - 0x014E09 05:8DF9: 90 D9     BCC bra_8DD4
bra_8DFB:  ; orig: bra_8DFB:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x014E0B 05:8DFB: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0001_t28_btn  ; orig: C - - - - - 0x014E0D 05:8DFD: 85 01     STA ram_0001_t28_btn
bra_8DFF_RTS:  ; orig: bra_8DFF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014E0F 05:8DFF: 60        RTS



sub_8E00_A_item_handler:  ; orig: sub_8E00_A_item_handler:
    MOVE.B  ram_item_sword,D0  ; orig: C - - - - - 0x014E10 05:8E00: AD 57 06  LDA ram_item_sword
    BEQ     bra_8DFF_RTS             ; BEQ  ; orig: C - - - - - 0x014E13 05:8E03: F0 FA     BEQ bra_8DFF_RTS
    MOVE.B  #$0D,D1  ; orig: C - - - - - 0x014E15 05:8E05: A2 0D     LDX #$0D    ; sword 
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014E17 05:8E07: B5 AC     LDA ram_state_obj,X
    BNE     bra_8DFF_RTS             ; BNE  ; orig: C - - - - - 0x014E19 05:8E09: D0 F4     BNE bra_8DFF_RTS
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x014E1B 05:8E0B: A9 05     LDA #$05
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E1D 05:8E0D: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014E20 05:8E10: A9 01     LDA #$01
    BSR     sub_8E8F             ; JSR -> BSR  ; orig: C - - - - - 0x014E22 05:8E12: 20 8F 8E  JSR sub_8E8F
    MOVE.B  #con_sfx_3_sword_swing,D0  ; orig: C - - - - - 0x014E25 05:8E15: A9 01     LDA #con_sfx_3_sword
    JMP     loc_bat_6D80_set_sfx_3  ; orig: C - - - - - 0x014E27 05:8E17: 4C 80 6D  JMP loc_bat_6D80_set



tbl_8E1A:  ; orig: tbl_8E1A:
    ; [DIRECTIVE] .BYTE $31  -- needs manual handling  ; orig: - - - - - - 0x014E2A 05:8E1A: 31        .byte $31   ; 00
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x014E2B 05:8E1B: FF        .byte $FF   ; 01



sub_8E1C_B_item_handler:  ; orig: sub_8E1C_B_item_handler:
    MOVE.B  ram_item_slot_index,D0  ; orig: C - - - - - 0x014E2C 05:8E1C: AD 56 06  LDA ram_item_slot_in
    CMPI.B  #con_item_letter,D0  ; orig: C - - - - - 0x014E2F 05:8E1F: C9 0F     CMP #con_item_letter
    BEQ     bra_8E71_RTS             ; BEQ  ; orig: C - - - - - 0x014E31 05:8E21: F0 4E     BEQ bra_8E71_RTS
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x014E33 05:8E23: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_021_8E38_00_boomerang  -- needs manual handling  ; orig: - D 0 - I - 0x014E36 05:8E26: 38 8E     .word ofs_021_8E38_0
    ; [DIRECTIVE] .WORD ofs_021_bat_70DD_01_bomb  -- needs manual handling  ; orig: - D 0 - I - 0x014E38 05:8E28: DD 70     .word ofs_021_bat_70
    ; [DIRECTIVE] .WORD ofs_021_8E72_02_arrow  -- needs manual handling  ; orig: - D 0 - I - 0x014E3A 05:8E2A: 72 8E     .word ofs_021_8E72_0
    ; [DIRECTIVE] .WORD ofs_021_8EA6_03_RTS  -- needs manual handling  ; orig: - - - - - - 0x014E3C 05:8E2C: A6 8E     .word ofs_021_8EA6_0
    ; [DIRECTIVE] .WORD ofs_021_bat_714F_04_candle  -- needs manual handling  ; orig: - D 0 - I - 0x014E3E 05:8E2E: 4F 71     .word ofs_021_bat_71
    ; [DIRECTIVE] .WORD ofs_021_0x01EF81_05_flute  -- needs manual handling  ; orig: - D 0 - I - 0x014E40 05:8E30: 71 EF     .word ofs_021_0x01EF
    ; [DIRECTIVE] .WORD ofs_021_8EA7_06_meat  -- needs manual handling  ; orig: - D 0 - I - 0x014E42 05:8E32: A7 8E     .word ofs_021_8EA7_0
    ; [DIRECTIVE] .WORD ofs_021_8EB6_07_potion  -- needs manual handling  ; orig: - - - - - - 0x014E44 05:8E34: B6 8E     .word ofs_021_8EB6_0
    ; [DIRECTIVE] .WORD ofs_021_8EC7_08_staff  -- needs manual handling  ; orig: - D 0 - I - 0x014E46 05:8E36: C7 8E     .word ofs_021_8EC7_0



ofs_021_8E38_00_boomerang:  ; orig: ofs_021_8E38_00_boomerang:
    MOVE.B  ram_item_boomerang,D0  ; orig: C - - J - - 0x014E48 05:8E38: AD 74 06  LDA ram_item_boomera
    OR.B    ram_item_magic_boomerang,D0  ; orig: C - - - - - 0x014E4B 05:8E3B: 0D 75 06  ORA ram_item_magic_b
    BEQ     bra_8E71_RTS             ; BEQ  ; orig: C - - - - - 0x014E4E 05:8E3E: F0 31     BEQ bra_8E71_RTS
    MOVE.B  #$0F,D1  ; orig: C - - - - - 0x014E50 05:8E40: A2 0F     LDX #$0F
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014E52 05:8E42: B5 AC     LDA ram_state_obj,X
    BEQ     bra_8E49             ; BEQ  ; orig: C - - - - - 0x014E54 05:8E44: F0 03     BEQ bra_8E49
    ASL.B   #1,D0           ; ASL A  ; orig: - - - - - - 0x014E56 05:8E46: 0A        ASL
    BCC     bra_8E71_RTS             ; BCC  ; orig: - - - - - - 0x014E57 05:8E47: 90 28     BCC bra_8E71_RTS
bra_8E49:  ; orig: bra_8E49:
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x014E59 05:8E49: A9 10     LDA #$10
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E5B 05:8E4B: 95 AC     STA ram_state_obj,X
    MOVE.B  ram_item_magic_boomerang,D2  ; orig: C - - - - - 0x014E5D 05:8E4D: AC 75 06  LDY ram_item_magic_b
    MOVE.B  tbl_8E1A(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014E60 05:8E50: B9 1A 8E  LDA tbl_8E1A,Y
    MOVE.B  D0,ram_0380_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E63 05:8E53: 9D 80 03  STA ram_0380_enemy,X
    BSR     sub_bat_711B             ; JSR -> BSR  ; orig: C - - - - - 0x014E66 05:8E56: 20 1B 71  JSR sub_bat_711B
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x014E69 05:8E59: A9 C0     LDA #$C0
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E6B 05:8E5B: 9D BC 03  STA ram_03BC_obj,X
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x014E6E 05:8E5E: A9 03     LDA #$03
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E70 05:8E60: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x014E73 05:8E63: A9 01     LDA #$01
    MOVE.B  D0,ram_anim_timer_link  ; orig: C - - - - - 0x014E75 05:8E65: 8D D0 03  STA ram_anim_timer_l
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x014E78 05:8E68: AD F8 03  LDA ram_03F8_link
    BNE     bra_8E6F             ; BNE  ; orig: C - - - - - 0x014E7B 05:8E6B: D0 02     BNE bra_8E6F
    MOVE.B  ram_dir_link,D0  ; orig: - - - - - - 0x014E7D 05:8E6D: A5 98     LDA ram_dir_link
bra_8E6F:  ; orig: bra_8E6F:
    MOVE.B  D0,ram_dir_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014E7F 05:8E6F: 95 98     STA ram_dir_enemy,X
bra_8E71_RTS:  ; orig: bra_8E71_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014E81 05:8E71: 60        RTS



ofs_021_8E72_02_arrow:  ; orig: ofs_021_8E72_02_arrow:
    MOVE.B  ram_item_bow,D0  ; orig: C - - J - - 0x014E82 05:8E72: AD 5A 06  LDA ram_item_bow
    BEQ     bra_8EA6_RTS             ; BEQ  ; orig: C - - - - - 0x014E85 05:8E75: F0 2F     BEQ bra_8EA6_RTS
    MOVE.B  #$12,D1  ; orig: C - - - - - 0x014E87 05:8E77: A2 12     LDX #$12
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014E89 05:8E79: B5 AC     LDA ram_state_obj,X
    BEQ     bra_8E80             ; BEQ  ; orig: C - - - - - 0x014E8B 05:8E7B: F0 03     BEQ bra_8E80
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014E8D 05:8E7D: 0A        ASL
    BCC     bra_8EA6_RTS             ; BCC  ; orig: C - - - - - 0x014E8E 05:8E7E: 90 26     BCC bra_8EA6_RTS
bra_8E80:  ; orig: bra_8E80:
    MOVE.B  ram_item_rupees,D0  ; orig: C - - - - - 0x014E90 05:8E80: AD 6D 06  LDA ram_item_rupees
    BEQ     bra_8EA6_RTS             ; BEQ  ; orig: C - - - - - 0x014E93 05:8E83: F0 21     BEQ bra_8EA6_RTS
    MOVE.B  #con_sfx_3_arrow_shoot,D0  ; orig: C - - - - - 0x014E95 05:8E85: A9 02     LDA #con_sfx_3_arrow
    BSR     sub_bat_6D80_set_sfx_3             ; JSR -> BSR  ; orig: C - - - - - 0x014E97 05:8E87: 20 80 6D  JSR sub_bat_6D80_set
    ADDQ.B  #1,ram_rupees_sbc  ; orig: C - - - - - 0x014E9A 05:8E8A: EE 7E 06  INC ram_rupees_sbc
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x014E9D 05:8E8D: A9 10     LDA #$10
sub_8E8F:  ; orig: sub_8E8F:
loc_8E8F:  ; orig: loc_8E8F:
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C D 0 - - - 0x014E9F 05:8E8F: 95 AC     STA ram_state_obj,X
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x014EA1 05:8E91: A9 C0     LDA #$C0
    MOVE.B  D0,ram_03BC_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014EA3 05:8E93: 9D BC 03  STA ram_03BC_obj,X
    BSR     sub_bat_7116             ; JSR -> BSR  ; orig: C - - - - - 0x014EA6 05:8E96: 20 16 71  JSR sub_bat_7116
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014EA9 05:8E99: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x014EAB 05:8E9B: 29 0C     AND #con_dir__UD
    BEQ     bra_8EA6_RTS             ; BEQ  ; orig: C - - - - - 0x014EAD 05:8E9D: F0 07     BEQ bra_8EA6_RTS
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014EAF 05:8E9F: B5 70     LDA ram_pos_X_enemy,
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014EB1 05:8EA1: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014EB2 05:8EA2: 69 03     ADC #$03
    MOVE.B  D0,ram_pos_X_enemy(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014EB4 05:8EA4: 95 70     STA ram_pos_X_enemy,
bra_8EA6_RTS:  ; orig: bra_8EA6_RTS:
ofs_021_8EA6_03_RTS:  ; orig: ofs_021_8EA6_03_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014EB6 05:8EA6: 60        RTS



ofs_021_8EA7_06_meat:  ; orig: ofs_021_8EA7_06_meat:
    MOVE.B  #$0F,D1  ; orig: C - - J - - 0x014EB7 05:8EA7: A2 0F     LDX #$0F
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014EB9 05:8EA9: B5 AC     LDA ram_state_obj,X
    BNE     bra_8EC6_RTS             ; BNE  ; orig: C - - - - - 0x014EBB 05:8EAB: D0 19     BNE bra_8EC6_RTS
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x014EBD 05:8EAD: A9 FF     LDA #$FF
    MOVE.B  D0,ram_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014EBF 05:8EAF: 95 28     STA ram_timer_obj,X
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x014EC1 05:8EB1: A9 80     LDA #$80
    JMP     loc_bat_7114  ; orig: C - - - - - 0x014EC3 05:8EB3: 4C 14 71  JMP loc_bat_7114



ofs_021_8EB6_07_potion:  ; orig: ofs_021_8EB6_07_potion:
    MOVE.B  ram_item_potion,D0  ; orig: - - - - - - 0x014EC6 05:8EB6: AD 5E 06  LDA ram_item_potion
    BEQ     bra_8EC6_RTS             ; BEQ  ; orig: - - - - - - 0x014EC9 05:8EB9: F0 0B     BEQ bra_8EC6_RTS
    SUBQ.B  #1,ram_item_potion  ; orig: - - - - - - 0x014ECB 05:8EBB: CE 5E 06  DEC ram_item_potion
    MOVE.B  #$01,D0  ; orig: - - - - - - 0x014ECE 05:8EBE: A9 01     LDA #$01
    MOVE.B  D0,ram_0063  ; orig: - - - - - - 0x014ED0 05:8EC0: 85 63     STA ram_0063
    MOVE.B  #$02,D0  ; orig: - - - - - - 0x014ED2 05:8EC2: A9 02     LDA #$02
    MOVE.B  D0,ram_pause_flag  ; orig: - - - - - - 0x014ED4 05:8EC4: 85 E0     STA ram_pause_flag
bra_8EC6_RTS:  ; orig: bra_8EC6_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014ED6 05:8EC6: 60        RTS



ofs_021_8EC7_08_staff:  ; orig: ofs_021_8EC7_08_staff:
    MOVE.B  #$12,D1  ; orig: C - - J - - 0x014ED7 05:8EC7: A2 12     LDX #$12
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014ED9 05:8EC9: B5 AC     LDA ram_state_obj,X
    BNE     bra_8EC6_RTS             ; BNE  ; orig: C - - - - - 0x014EDB 05:8ECB: D0 F9     BNE bra_8EC6_RTS
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x014EDD 05:8ECD: A9 05     LDA #$05
    MOVE.B  D0,ram_anim_timer_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014EDF 05:8ECF: 9D D0 03  STA ram_anim_timer_o
    MOVE.B  #$31,D0  ; orig: C - - - - - 0x014EE2 05:8ED2: A9 31     LDA #$31
    JMP     loc_8E8F  ; orig: C - - - - - 0x014EE4 05:8ED4: 4C 8F 8E  JMP loc_8E8F



sub_0x014EE7:  ; orig: sub_0x014EE7:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x014EE7 05:8ED7: A5 12     LDA ram_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x014EE9 05:8ED9: C9 09     CMP #con_script_09
    BNE     bra_8F1C             ; BNE  ; orig: C - - - - - 0x014EEB 05:8EDB: D0 3F     BNE bra_8F1C
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014EED 05:8EDD: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x014EEF 05:8EDF: C9 40     CMP #$40
    BCS     bra_8EC6_RTS             ; BCS  ; orig: C - - - - - 0x014EF1 05:8EE1: B0 E3     BCS bra_8EC6_RTS
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x014EF3 05:8EE3: AD F8 03  LDA ram_03F8_link
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x014EF6 05:8EE6: 29 08     AND #$08
    BEQ     bra_8EC6_RTS             ; BEQ  ; orig: C - - - - - 0x014EF8 05:8EE8: F0 DC     BEQ bra_8EC6_RTS

; triggers when link gets an item and climbs back by the ladder
    MOVE.B  #$06,D2  ; orig: C - - - - - 0x014EFA 05:8EEA: A0 06     LDY #$06
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x014EFC 05:8EEC: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014EFE 05:8EEE: 48        PHA
bra_8EEF_loop:  ; orig: bra_8EEF_loop:

; bzk bug, loop doesn't quit after checking Y 00-06,

; which results in Y underflow after DEY and refer

; to unrelated addresses via CMP.

; example at 1st quest demo, 73500+ frame

; it's also possible that this loop will result

; in an infinite loop because of no Y check
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x014EFF 05:8EEF: 88        DEY
    CMP.B   ram_6BB2(D2.L),D0  ; orig: C - - - - - 0x014F00 05:8EF0: D9 B2 6B  CMP ram_6BB2,Y
    BNE     bra_8EEF_loop             ; BNE  ; orig: C - - - - - 0x014F03 05:8EF3: D0 FA     BNE bra_8EEF_loop
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014F05 05:8EF5: A8        TAY
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014F06 05:8EF6: A5 70     LDA ram_pos_X_link
    CMPI.B  #$80,D0  ; orig: C - - - - - 0x014F08 05:8EF8: C9 80     CMP #$80
    BCS     bra_8F02             ; BCS  ; orig: C - - - - - 0x014F0A 05:8EFA: B0 06     BCS bra_8F02
    MOVE.B  ram_687E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014F0C 05:8EFC: B9 7E 68  LDA ram_687E_map_dat
    JMP     loc_8F05  ; orig: C - - - - - 0x014F0F 05:8EFF: 4C 05 8F  JMP loc_8F05
bra_8F02:  ; orig: bra_8F02:
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014F12 05:8F02: B9 FE 68  LDA ram_68FE_map_dat
loc_8F05:  ; orig: loc_8F05:
    BSR     sub_8F58             ; JSR -> BSR  ; orig: C D 0 - - - 0x014F15 05:8F05: 20 58 8F  JSR sub_8F58
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014F18 05:8F08: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014F19 05:8F09: A8        TAY
    MOVE.B  ram_697E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014F1A 05:8F0A: B9 7E 69  LDA ram_697E_map_dat
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014F1D 05:8F0D: 48        PHA
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x014F1E 05:8F0E: 29 F0     AND #$F0
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x014F20 05:8F10: 85 70     STA ram_pos_X_link
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014F22 05:8F12: 68        PLA

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014F23 05:8F13: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014F24 05:8F14: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014F25 05:8F15: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x014F26 05:8F16: 0A        ASL
    ORI.B   #$0D,D0  ; orig: C - - - - - 0x014F27 05:8F17: 09 0D     ORA #$0D
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x014F29 05:8F19: 85 84     STA ram_pos_Y_link
    RTS                     ; RTS  ; orig: C - - - - - 0x014F2B 05:8F1B: 60        RTS
bra_8F1C:  ; orig: bra_8F1C:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x014F2C 05:8F1C: 48        PHA
    BSR     sub_bat_6E46             ; JSR -> BSR  ; orig: C - - - - - 0x014F2D 05:8F1D: 20 46 6E  JSR sub_bat_6E46
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x014F30 05:8F20: 68        PLA
    CMPI.B  #con_script_0C,D0  ; orig: C - - - - - 0x014F31 05:8F21: C9 0C     CMP #con_script_0C
    BNE     bra_8F73             ; BNE  ; orig: C - - - - - 0x014F33 05:8F23: D0 4E     BNE bra_8F73
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x014F35 05:8F25: AD 94 03  LDA ram_0394_link
    BNE     bra_8F72_RTS             ; BNE  ; orig: C - - - - - 0x014F38 05:8F28: D0 48     BNE bra_8F72_RTS
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014F3A 05:8F2A: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$9D,D0  ; orig: C - - - - - 0x014F3C 05:8F2C: C9 9D     CMP #$9D
    BNE     bra_8F73             ; BNE  ; orig: C - - - - - 0x014F3E 05:8F2E: D0 43     BNE bra_8F73
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x014F40 05:8F30: A0 01     LDY #$01
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014F42 05:8F32: A5 70     LDA ram_pos_X_link
    CMPI.B  #$50,D0  ; orig: C - - - - - 0x014F44 05:8F34: C9 50     CMP #$50
    BEQ     bra_8F42             ; BEQ  ; orig: C - - - - - 0x014F46 05:8F36: F0 0A     BEQ bra_8F42
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014F48 05:8F38: C8        INY
    CMPI.B  #$80,D0  ; orig: C - - - - - 0x014F49 05:8F39: C9 80     CMP #$80
    BEQ     bra_8F42             ; BEQ  ; orig: C - - - - - 0x014F4B 05:8F3B: F0 05     BEQ bra_8F42
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014F4D 05:8F3D: C8        INY
    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x014F4E 05:8F3E: C9 B0     CMP #$B0
    BNE     bra_8F72_RTS             ; BNE  ; orig: C - - - - - 0x014F50 05:8F40: D0 30     BNE bra_8F72_RTS
bra_8F42:  ; orig: bra_8F42:
    MOVE.B  D2,ram_0000_t65  ; orig: C - - - - - 0x014F52 05:8F42: 84 00     STY ram_0000_t65
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x014F54 05:8F44: A0 FF     LDY #$FF
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x014F56 05:8F46: A5 EB     LDA ram_map_location
bra_8F48_loop:  ; orig: bra_8F48_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x014F58 05:8F48: C8        INY
    CMP.B   ram_6BB2(D2.L),D0  ; orig: C - - - - - 0x014F59 05:8F49: D9 B2 6B  CMP ram_6BB2,Y
    BNE     bra_8F48_loop             ; BNE  ; orig: C - - - - - 0x014F5C 05:8F4C: D0 FA     BNE bra_8F48_loop
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x014F5E 05:8F4E: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014F5F 05:8F4F: 18        CLC
    ADDX.B  ram_0000_t65,D0  ; orig: C - - - - - 0x014F60 05:8F50: 65 00     ADC ram_0000_t65
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x014F62 05:8F52: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x014F64 05:8F54: A8        TAY
    MOVE.B  ram_6BB2(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x014F65 05:8F55: B9 B2 6B  LDA ram_6BB2,Y
sub_8F58:  ; orig: sub_8F58:
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x014F68 05:8F58: 85 EB     STA ram_map_location
    BSR     sub_0x01E6D6_set_map_bit5             ; JSR -> BSR  ; orig: C - - - - - 0x014F6A 05:8F5A: 20 C6 E6  JSR sub_0x01E6D6_set
bra_8F5D:  ; orig: bra_8F5D:
    MOVE.B  #con_script_0A,D0  ; orig: C - - - - - 0x014F6D 05:8F5D: A9 0A     LDA #con_script_0A
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x014F6F 05:8F5F: 85 12     STA ram_script
loc_8F61:  ; orig: loc_8F61:
    MOVE.B  #$00,D0  ; orig: C D 0 - - - 0x014F71 05:8F61: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x014F73 05:8F63: 85 13     STA ram_subscript
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x014F75 05:8F65: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x014F77 05:8F67: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x014F79 05:8F69: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_00C0_link  ; orig: C - - - - - 0x014F7B 05:8F6B: 85 C0     STA ram_00C0_link
    MOVE.B  D0,ram_00D3_link  ; orig: C - - - - - 0x014F7D 05:8F6D: 85 D3     STA ram_00D3_link
    MOVE.B  D0,ram_invinc_link  ; orig: C - - - - - 0x014F7F 05:8F6F: 8D F0 04  STA ram_invinc_link
bra_8F72_RTS:  ; orig: bra_8F72_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014F82 05:8F72: 60        RTS
bra_8F73:  ; orig: bra_8F73:
    BSR     sub_0x01F171             ; JSR -> BSR  ; orig: C - - - - - 0x014F83 05:8F73: 20 61 F1  JSR sub_0x01F171
    MOVE.B  ram_0011_screen_ready_flag,D0  ; orig: C - - - - - 0x014F86 05:8F76: A5 11     LDA ram_0011_screen_
    BEQ     bra_8F5D             ; BEQ  ; orig: C - - - - - 0x014F88 05:8F78: F0 E3     BEQ bra_8F5D
    RTS                     ; RTS  ; orig: C - - - - - 0x014F8A 05:8F7A: 60        RTS



sub_0x014F8B:  ; orig: sub_0x014F8B:
    MOVE.B  ram_0064,D1  ; orig: C - - - - - 0x014F8B 05:8F7B: A6 64     LDX ram_0064
    BEQ     bra_8FC8_RTS             ; BEQ  ; orig: C - - - - - 0x014F8D 05:8F7D: F0 49     BEQ bra_8FC8_RTS
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014F8F 05:8F7F: B5 AC     LDA ram_state_obj,X
    BEQ     bra_8FC1             ; BEQ  ; orig: C - - - - - 0x014F91 05:8F81: F0 3E     BEQ bra_8FC1
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014F93 05:8F83: B5 98     LDA ram_dir_enemy,X
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x014F95 05:8F85: 29 0C     AND #con_dir__UD
    BEQ     bra_8F9A             ; BEQ  ; orig: C - - - - - 0x014F97 05:8F87: F0 11     BEQ bra_8F9A
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014F99 05:8F89: A5 70     LDA ram_pos_X_link
    CMP.B   ram_pos_X_enemy(D1.L),D0  ; orig: C - - - - - 0x014F9B 05:8F8B: D5 70     CMP ram_pos_X_enemy,
    BNE     bra_8FC1             ; BNE  ; orig: C - - - - - 0x014F9D 05:8F8D: D0 32     BNE bra_8FC1
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014F9F 05:8F8F: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014FA1 05:8F91: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014FA2 05:8F92: 69 03     ADC #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014FA4 05:8F94: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x014FA5 05:8F95: F5 84     SBC ram_pos_Y_enemy,
    JMP     loc_8FA8  ; orig: C - - - - - 0x014FA7 05:8F97: 4C A8 8F  JMP loc_8FA8
bra_8F9A:  ; orig: bra_8F9A:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x014FAA 05:8F9A: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x014FAC 05:8F9C: 18        CLC
    ADDX.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x014FAD 05:8F9D: 69 03     ADC #$03
    CMP.B   ram_pos_Y_enemy(D1.L),D0  ; orig: C - - - - - 0x014FAF 05:8F9F: D5 84     CMP ram_pos_Y_enemy,
    BNE     bra_8FC1             ; BNE  ; orig: C - - - - - 0x014FB1 05:8FA1: D0 1E     BNE bra_8FC1
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x014FB3 05:8FA3: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x014FB5 05:8FA5: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x014FB6 05:8FA6: F5 70     SBC ram_pos_X_enemy,
loc_8FA8:  ; orig: loc_8FA8:
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C D 0 - - - 0x014FB8 05:8FA8: 20 1F 70  JSR sub_bat_701F_EOR
    MOVE.B  D0,ram_0000_t66  ; orig: C - - - - - 0x014FBB 05:8FAB: 85 00     STA ram_0000_t66
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x014FBD 05:8FAD: C9 10     CMP #$10
    BCC     bra_8FC9             ; BCC  ; orig: C - - - - - 0x014FBF 05:8FAF: 90 18     BCC bra_8FC9
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x014FC1 05:8FB1: C9 10     CMP #$10
    BNE     bra_8FC1             ; BNE  ; orig: C - - - - - 0x014FC3 05:8FB3: D0 0C     BNE bra_8FC1
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014FC5 05:8FB5: A5 98     LDA ram_dir_link
    CMP.B   ram_dir_enemy(D1.L),D0  ; orig: C - - - - - 0x014FC7 05:8FB7: D5 98     CMP ram_dir_enemy,X
    BNE     bra_8FC1             ; BNE  ; orig: C - - - - - 0x014FC9 05:8FB9: D0 06     BNE bra_8FC1
    MOVE.B  ram_state_obj(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014FCB 05:8FBB: B5 AC     LDA ram_state_obj,X
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x014FCD 05:8FBD: C9 01     CMP #$01
    BEQ     bra_8FCD_loop             ; BEQ  ; orig: C - - - - - 0x014FCF 05:8FBF: F0 0C     BEQ bra_8FCD_loop
bra_8FC1:  ; orig: bra_8FC1:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x014FD1 05:8FC1: A9 00     LDA #$00
    MOVE.B  D0,ram_0064  ; orig: C - - - - - 0x014FD3 05:8FC3: 85 64     STA ram_0064

; bzk optimize, JMP
    BSR     sub_0x01FEC1_destroy_object             ; JSR -> BSR  ; orig: C - - - - - 0x014FD5 05:8FC5: 20 B1 FE  JSR sub_0x01FEC1_des
bra_8FC8_RTS:  ; orig: bra_8FC8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x014FD8 05:8FC8: 60        RTS
bra_8FC9:  ; orig: bra_8FC9:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x014FD9 05:8FC9: A9 02     LDA #$02
    MOVE.B  D0,ram_state_obj(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x014FDB 05:8FCB: 95 AC     STA ram_state_obj,X
bra_8FCD_loop:  ; orig: bra_8FCD_loop:
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x014FDD 05:8FCD: AD F8 03  LDA ram_03F8_link
    BEQ     bra_9011             ; BEQ  ; orig: C - - - - - 0x014FE0 05:8FD0: F0 3F     BEQ bra_9011
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x014FE2 05:8FD2: A5 98     LDA ram_dir_link

; bzk bug? this 0000 can be from ram_0000_t05_block_data
    MOVE.B  ram_0000_t66,D2  ; orig: C - - - - - 0x014FE4 05:8FD4: A4 00     LDY ram_0000_t66
    BEQ     bra_8FDC             ; BEQ  ; orig: C - - - - - 0x014FE6 05:8FD6: F0 04     BEQ bra_8FDC
    CMP.B   ram_dir_enemy(D1.L),D0  ; orig: C - - - - - 0x014FE8 05:8FD8: D5 98     CMP ram_dir_enemy,X
    BEQ     bra_9011             ; BEQ  ; orig: C - - - - - 0x014FEA 05:8FDA: F0 35     BEQ bra_9011
bra_8FDC:  ; orig: bra_8FDC:
    MOVE.B  ram_dir_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x014FEC 05:8FDC: B5 98     LDA ram_dir_enemy,X
    CMP.B   ram_000F_t01_direction,D0  ; orig: C - - - - - 0x014FEE 05:8FDE: C5 0F     CMP ram_000F_t01_dir
    BEQ     bra_9011             ; BEQ  ; orig: C - - - - - 0x014FF0 05:8FE0: F0 2F     BEQ bra_9011
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x014FF2 05:8FE2: 20 13 70  JSR sub_bat_7013_get
    CMP.B   ram_dir_link,D0  ; orig: C - - - - - 0x014FF5 05:8FE5: C5 98     CMP ram_dir_link
    BEQ     bra_9011             ; BEQ  ; orig: C - - - - - 0x014FF7 05:8FE7: F0 28     BEQ bra_9011
    CMPI.B  #con_dir_Down,D0  ; orig: C - - - - - 0x014FF9 05:8FE9: C9 04     CMP #con_dir_Down
    BNE     bra_900F             ; BNE  ; orig: C - - - - - 0x014FFB 05:8FEB: D0 22     BNE bra_900F
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x014FFD 05:8FED: AD F8 03  LDA ram_03F8_link
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x015000 05:8FF0: C9 08     CMP #$08
    BNE     bra_900F             ; BNE  ; orig: C - - - - - 0x015002 05:8FF2: D0 1B     BNE bra_900F
    BSR     sub_901F             ; JSR -> BSR  ; orig: C - - - - - 0x015004 05:8FF4: 20 1F 90  JSR sub_901F
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x015007 05:8FF7: A5 84     LDA ram_pos_Y_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x015009 05:8FF9: 48        PHA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01500A 05:8FFA: 38        SEC
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x01500B 05:8FFB: E9 08     SBC #$08
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x01500D 05:8FFD: 85 84     STA ram_pos_Y_link
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01500F 05:8FFF: 20 FA ED  JSR sub_0x01EE0A_fin
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x015012 05:9002: 68        PLA
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x015013 05:9003: 85 84     STA ram_pos_Y_link
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x015015 05:9005: A5 0F     LDA ram_000F_t01_dir
    MOVE.B  ram_collision_tile_link,D2  ; orig: C - - - - - 0x015017 05:9007: AC 9E 04  LDY ram_collision_ti
    CMP.B   ram_min_collision_tile,D2  ; orig: C - - - - - 0x01501A 05:900A: CC 4A 03  CPY ram_min_collisio
    BCC     bra_8FCD_loop             ; BCC  ; orig: C - - - - - 0x01501D 05:900D: 90 BE     BCC bra_8FCD_loop
bra_900F:  ; orig: bra_900F:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01501F 05:900F: A9 00     LDA #$00
bra_9011:  ; orig: bra_9011:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x015021 05:9011: 48        PHA
    MOVE.B  ram_0064,D1  ; orig: C - - - - - 0x015022 05:9012: A6 64     LDX ram_0064
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x015024 05:9014: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  #$0C,D2  ; orig: C - - - - - 0x015027 05:9017: A0 0C     LDY #$0C
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x015029 05:9019: A9 00     LDA #$00
    BSR     sub_bat_790C             ; JSR -> BSR  ; orig: C - - - - - 0x01502B 05:901B: 20 0C 79  JSR sub_bat_790C
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01502E 05:901E: 68        PLA
sub_901F:  ; orig: sub_901F:
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01502F 05:901F: 85 0F     STA ram_000F_t01_dir
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x015031 05:9021: A2 00     LDX #$00
    RTS                     ; RTS  ; orig: C - - - - - 0x015033 05:9023: 60        RTS



sub_0x015034:  ; orig: sub_0x015034:
    MOVE.B  ram_0525,D0  ; orig: C - - - - - 0x015034 05:9024: AD 25 05  LDA ram_0525
    MOVE.B  D0,ram_000A_t10  ; orig: C - - - - - 0x015037 05:9027: 85 0A     STA ram_000A_t10
bra_9029_loop:  ; orig: bra_9029_loop:
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x015039 05:9029: A0 10     LDY #$10
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x01503B 05:902B: A5 0A     LDA ram_000A_t10
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01503D 05:902D: 29 0F     AND #$0F
    BEQ     bra_9037             ; BEQ  ; orig: C - - - - - 0x01503F 05:902F: F0 06     BEQ bra_9037
    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x015041 05:9031: A0 F0     LDY #$F0
    CMPI.B  #$0F,D0  ; orig: C - - - - - 0x015043 05:9033: C9 0F     CMP #$0F
    BNE     bra_903D             ; BNE  ; orig: C - - - - - 0x015045 05:9035: D0 06     BNE bra_903D
bra_9037:  ; orig: bra_9037:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x015047 05:9037: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x015048 05:9038: 18        CLC
    ADDX.B  ram_000A_t10,D0  ; orig: C - - - - - 0x015049 05:9039: 65 0A     ADC ram_000A_t10
    MOVE.B  D0,ram_000A_t10  ; orig: C - - - - - 0x01504B 05:903B: 85 0A     STA ram_000A_t10
bra_903D:  ; orig: bra_903D:
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x01504D 05:903D: A5 0A     LDA ram_000A_t10
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01504F 05:903F: 29 F0     AND #$F0
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x015051 05:9041: C9 E0     CMP #$E0
    BNE     bra_904A             ; BNE  ; orig: C - - - - - 0x015053 05:9043: D0 05     BNE bra_904A
    ADDQ.B  #1,ram_000A_t10  ; orig: C - - - - - 0x015055 05:9045: E6 0A     INC ram_000A_t10
    JMP     loc_9050  ; orig: C - - - - - 0x015057 05:9047: 4C 50 90  JMP loc_9050
bra_904A:  ; orig: bra_904A:
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x01505A 05:904A: C9 40     CMP #$40
    BNE     bra_9050             ; BNE  ; orig: C - - - - - 0x01505C 05:904C: D0 02     BNE bra_9050
    SUBQ.B  #1,ram_000A_t10  ; orig: C - - - - - 0x01505E 05:904E: C6 0A     DEC ram_000A_t10
bra_9050:  ; orig: bra_9050:
loc_9050:  ; orig: loc_9050:
    BSR     sub_AC07_set_block_address_pointer             ; JSR -> BSR  ; orig: C D 0 - - - 0x015060 05:9050: 20 07 AC  JSR sub_AC07_set_blo
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x015063 05:9053: A5 0A     LDA ram_000A_t10
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x015065 05:9055: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x015067 05:9057: A8        TAY
    BEQ     bra_9062             ; BEQ  ; orig: C - - - - - 0x015068 05:9058: F0 08     BEQ bra_9062
bra_905A_loop:  ; orig: bra_905A_loop:
    MOVE.B  #$2C,D0  ; orig: C - - - - - 0x01506A 05:905A: A9 2C     LDA #$2C
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01506C 05:905C: 20 76 72  JSR sub_bat_7276_inc
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01506F 05:905F: 88        DEY
    BNE     bra_905A_loop             ; BNE  ; orig: C - - - - - 0x015070 05:9060: D0 F8     BNE bra_905A_loop
bra_9062:  ; orig: bra_9062:
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x015072 05:9062: A5 0A     LDA ram_000A_t10
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x015074 05:9064: 29 F0     AND #$F0
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x015076 05:9066: 38        SEC
    SUBX.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x015077 05:9067: E9 40     SBC #$40

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x015079 05:9069: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01507A 05:906A: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01507B 05:906B: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01507C 05:906C: A8        TAY
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01507D 05:906D: B1 00     LDA (ram_0000_t03_bl
    CMPI.B  #$84,D0  ; orig: C - - - - - 0x01507F 05:906F: C9 84     CMP #$84
    BCC     bra_907A             ; BCC  ; orig: C - - - - - 0x015081 05:9071: 90 07     BCC bra_907A
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x015083 05:9073: A5 0A     LDA ram_000A_t10
    CMP.B   ram_0525,D0  ; orig: C - - - - - 0x015085 05:9075: CD 25 05  CMP ram_0525
    BNE     bra_9029_loop             ; BNE  ; orig: C - - - - - 0x015088 05:9078: D0 AF     BNE bra_9029_loop
bra_907A:  ; orig: bra_907A:
    MOVE.B  ram_000A_t10,D0  ; orig: C - - - - - 0x01508A 05:907A: A5 0A     LDA ram_000A_t10
    MOVE.B  D0,ram_0525  ; orig: C - - - - - 0x01508C 05:907C: 8D 25 05  STA ram_0525
    RTS                     ; RTS  ; orig: C - - - - - 0x01508F 05:907F: 60        RTS



ofs_main_script_1_0x015090_0B:  ; orig: ofs_main_script_1_0x015090_0B:

; con_script_0B
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x015090 05:9080: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x015092 05:9082: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_038_B117_00  -- needs manual handling  ; orig: - D 0 - I - 0x015095 05:9085: 17 B1     .word ofs_038_B117_0
    ; [DIRECTIVE] .WORD ofs_038_B14F_01  -- needs manual handling  ; orig: - D 0 - I - 0x015097 05:9087: 4F B1     .word ofs_038_B14F_0
    ; [DIRECTIVE] .WORD ofs_038_B130_02  -- needs manual handling  ; orig: - D 0 - I - 0x015099 05:9089: 30 B1     .word ofs_038_B130_0
    ; [DIRECTIVE] .WORD ofs_AB4D_03_draw_normal_cave  -- needs manual handling  ; orig: - D 0 - I - 0x01509B 05:908B: 4D AB     .word ofs_AB4D_03_dr
    ; [DIRECTIVE] .WORD ofs_038_AC10_04  -- needs manual handling  ; orig: - D 0 - I - 0x01509D 05:908D: 10 AC     .word ofs_038_AC10_0
    ; [DIRECTIVE] .WORD ofs_038_B16B_05  -- needs manual handling  ; orig: - D 0 - I - 0x01509F 05:908F: 6B B1     .word ofs_038_B16B_0
    ; [DIRECTIVE] .WORD ofs_038_B173_06  -- needs manual handling  ; orig: - D 0 - I - 0x0150A1 05:9091: 73 B1     .word ofs_038_B173_0
    ; [DIRECTIVE] .WORD ofs_038_bat_6D89_07  -- needs manual handling  ; orig: - D 0 - I - 0x0150A3 05:9093: 89 6D     .word ofs_038_bat_6D
    ; [DIRECTIVE] .WORD ofs_038_B180_08  -- needs manual handling  ; orig: - D 0 - I - 0x0150A5 05:9095: 80 B1     .word ofs_038_B180_0



ofs_main_script_1_0x0150A7_0C:  ; orig: ofs_main_script_1_0x0150A7_0C:

; con_script_0C
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x0150A7 05:9097: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0150A9 05:9099: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_039_B117_00  -- needs manual handling  ; orig: - D 0 - I - 0x0150AC 05:909C: 17 B1     .word ofs_039_B117_0
    ; [DIRECTIVE] .WORD ofs_039_B14F_01  -- needs manual handling  ; orig: - D 0 - I - 0x0150AE 05:909E: 4F B1     .word ofs_039_B14F_0
    ; [DIRECTIVE] .WORD ofs_039_B130_02  -- needs manual handling  ; orig: - D 0 - I - 0x0150B0 05:90A0: 30 B1     .word ofs_039_B130_0
    ; [DIRECTIVE] .WORD ofs_039_AB5E_03_draw_cave_with_3_teleports  -- needs manual handling  ; orig: - D 0 - I - 0x0150B2 05:90A2: 5E AB     .word ofs_039_AB5E_0
    ; [DIRECTIVE] .WORD ofs_039_AC10_04  -- needs manual handling  ; orig: - D 0 - I - 0x0150B4 05:90A4: 10 AC     .word ofs_039_AC10_0
    ; [DIRECTIVE] .WORD ofs_039_B16B_05  -- needs manual handling  ; orig: - D 0 - I - 0x0150B6 05:90A6: 6B B1     .word ofs_039_B16B_0
    ; [DIRECTIVE] .WORD ofs_039_B173_06  -- needs manual handling  ; orig: - D 0 - I - 0x0150B8 05:90A8: 73 B1     .word ofs_039_B173_0
    ; [DIRECTIVE] .WORD ofs_039_bat_6D89_07  -- needs manual handling  ; orig: - D 0 - I - 0x0150BA 05:90AA: 89 6D     .word ofs_039_bat_6D
    ; [DIRECTIVE] .WORD ofs_039_B180_08  -- needs manual handling  ; orig: - D 0 - I - 0x0150BC 05:90AC: 80 B1     .word ofs_039_B180_0



sub_90AE_check_room_history:  ; orig: sub_90AE_check_room_history:
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x0150BE 05:90AE: A0 05     LDY #$05
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0150C0 05:90B0: A5 EB     LDA ram_map_location
bra_90B2_loop:  ; orig: bra_90B2_loop:
    CMP.B   ram_room_history(D2.L),D0  ; orig: C - - - - - 0x0150C2 05:90B2: D9 21 06  CMP ram_room_history
    BEQ     bra_90CA             ; BEQ  ; orig: C - - - - - 0x0150C5 05:90B5: F0 13     BEQ bra_90CA
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0150C7 05:90B7: 88        DEY
    BPL     bra_90B2_loop             ; BPL  ; orig: C - - - - - 0x0150C8 05:90B8: 10 F8     BPL bra_90B2_loop
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x0150CA 05:90BA: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0150CD 05:90BD: 29 07     AND #$07
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x0150CF 05:90BF: C9 07     CMP #$07
    BNE     bra_90CA             ; BNE  ; orig: C - - - - - 0x0150D1 05:90C1: D0 07     BNE bra_90CA
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0150D3 05:90C3: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x0150D5 05:90C5: 29 F8     AND #$F8
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0150D7 05:90C7: 91 00     STA (ram_0000_t13_da
bra_90C9_RTS:  ; orig: bra_90C9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0150D9 05:90C9: 60        RTS
bra_90CA:  ; orig: bra_90CA:
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x0150DA 05:90CA: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0150DD 05:90CD: 29 07     AND #$07
    BEQ     bra_90C9_RTS             ; BEQ  ; orig: C - - - - - 0x0150DF 05:90CF: F0 F8     BEQ bra_90C9_RTS
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x0150E1 05:90D1: C9 07     CMP #$07
    BEQ     bra_90DE             ; BEQ  ; orig: C - - - - - 0x0150E3 05:90D3: F0 09     BEQ bra_90DE
    MOVE.B  D0,ram_0004_t18_leftover_enemies  ; orig: C - - - - - 0x0150E5 05:90D5: 85 04     STA ram_0004_t18_lef
    MOVE.B  ram_0003_t15_objects_counter,D0  ; orig: C - - - - - 0x0150E7 05:90D7: A5 03     LDA ram_0003_t15_obj
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0150E9 05:90D9: 38        SEC
    SUBX.B  ram_0004_t18_leftover_enemies,D0  ; orig: C - - - - - 0x0150EA 05:90DA: E5 04     SBC ram_0004_t18_lef
    BPL     bra_90E2             ; BPL  ; orig: C - - - - - 0x0150EC 05:90DC: 10 04     BPL bra_90E2
bra_90DE:  ; orig: bra_90DE:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0150EE 05:90DE: A9 00     LDA #$00
    MOVE.B  D0,ram_0002_t38_obj_id  ; orig: C - - - - - 0x0150F0 05:90E0: 85 02     STA ram_0002_t38_obj
bra_90E2:  ; orig: bra_90E2:
    MOVE.B  D0,ram_0003_t15_objects_counter  ; orig: C - - - - - 0x0150F2 05:90E2: 85 03     STA ram_0003_t15_obj
    RTS                     ; RTS  ; orig: C - - - - - 0x0150F4 05:90E4: 60        RTS



loc_90E5:  ; orig: loc_90E5:

; code for overworld only, not for dungeons
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C D 0 - - - 0x0150F5 05:90E5: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0150F8 05:90E8: 29 07     AND #$07
    MOVE.B  D0,ram_0002_t40  ; orig: C - - - - - 0x0150FA 05:90EA: 85 02     STA ram_0002_t40
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0150FC 05:90EC: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x0150FE 05:90EE: 29 F8     AND #$F8
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x015100 05:90F0: 91 00     STA (ram_0000_t13_da
    MOVE.B  ram_room_kill_cnt,D0  ; orig: C - - - - - 0x015102 05:90F2: AD 4F 03  LDA ram_room_kill_cn
    CMP.B   ram_enemy_cnt,D0  ; orig: C - - - - - 0x015105 05:90F5: CD 4E 03  CMP ram_enemy_cnt
    BCS     bra_9103             ; BCS  ; orig: C - - - - - 0x015108 05:90F8: B0 09     BCS bra_9103
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01510A 05:90FA: 29 07     AND #$07
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01510C 05:90FC: 18        CLC
    ADDX.B  ram_0002_t40,D0  ; orig: C - - - - - 0x01510D 05:90FD: 65 02     ADC ram_0002_t40
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x01510F 05:90FF: C9 07     CMP #$07
    BCC     bra_9105_not_overflow             ; BCC  ; orig: C - - - - - 0x015111 05:9101: 90 02     BCC bra_9105_not_ove
bra_9103:  ; orig: bra_9103:
    MOVE.B  #$07,D0  ; orig: C - - - - - 0x015113 05:9103: A9 07     LDA #$07
bra_9105_not_overflow:  ; orig: bra_9105_not_overflow:
    ; !! ORA (ram_0000_t13_data),Y - needs manual review  ; orig: C - - - - - 0x015115 05:9105: 11 00     ORA (ram_0000_t13_da
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x015117 05:9107: 91 00     STA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: C - - - - - 0x015119 05:9109: 60        RTS



ofs_main_script_1_0x01511A_09:  ; orig: ofs_main_script_1_0x01511A_09:

; con_script_09
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x01511A 05:910A: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01511C 05:910C: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_040_B117_00  -- needs manual handling  ; orig: - D 0 - I - 0x01511F 05:910F: 17 B1     .word ofs_040_B117_0
    ; [DIRECTIVE] .WORD ofs_040_B133_01  -- needs manual handling  ; orig: - D 0 - I - 0x015121 05:9111: 33 B1     .word ofs_040_B133_0
    ; [DIRECTIVE] .WORD ofs_040_B13C_02  -- needs manual handling  ; orig: - D 0 - I - 0x015123 05:9113: 3C B1     .word ofs_040_B13C_0
    ; [DIRECTIVE] .WORD ofs_040_AB62_03_draw_underground_room  -- needs manual handling  ; orig: - D 0 - I - 0x015125 05:9115: 62 AB     .word ofs_040_AB62_0
    ; [DIRECTIVE] .WORD ofs_040_AC10_04  -- needs manual handling  ; orig: - D 0 - I - 0x015127 05:9117: 10 AC     .word ofs_040_AC10_0
    ; [DIRECTIVE] .WORD ofs_040_B12C_05  -- needs manual handling  ; orig: - D 0 - I - 0x015129 05:9119: 2C B1     .word ofs_040_B12C_0
    ; [DIRECTIVE] .WORD ofs_040_B143_06  -- needs manual handling  ; orig: - D 0 - I - 0x01512B 05:911B: 43 B1     .word ofs_040_B143_0
    ; [DIRECTIVE] .WORD ofs_040_B13C_07  -- needs manual handling  ; orig: - D 0 - I - 0x01512D 05:911D: 3C B1     .word ofs_040_B13C_0
    ; [DIRECTIVE] .WORD ofs_040_B199_08  -- needs manual handling  ; orig: - D 0 - I - 0x01512F 05:911F: 99 B1     .word ofs_040_B199_0
    ; [DIRECTIVE] .WORD ofs_040_B1CD_09  -- needs manual handling  ; orig: - D 0 - I - 0x015131 05:9121: CD B1     .word ofs_040_B1CD_0



; bzk garbage, a copy of 0x0102A3
    MOVE.B  #con_obj_id_null,D2  ; orig: - - - - - - 0x015133 05:9123: A0 00     LDY #con_obj_id_null
    BEQ     bra_9129             ; BEQ  ; orig: - - - - - - 0x015135 05:9125: F0 02     BEQ bra_9129    ; jm



; bzk garbage, a copy of 0x0102A7
    MOVE.B  #con_obj_id_01,D2  ; orig: - - - - - - 0x015137 05:9127: A0 01     LDY #con_obj_id_01
bra_9129:  ; orig: bra_9129:
    MOVE.B  D2,ram_000C_t07_flag  ; orig: - - - - - - 0x015139 05:9129: 84 0C     STY ram_000C_t07_fla
    ; (empty translation for LDY)  ; orig: - - - - - - 0x01513B 05:912B: BC 4F 03  LDY ram_obj_id_enemy
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x01513E 05:912E: C8        INY
    MOVE.B  D0,ram_000D_t04_table_offset  ; orig: - - - - - - 0x01513F 05:912F: 85 0D     STA ram_000D_t04_tab
    MOVE.B  D2,ram_000E_t02  ; orig: - - - - - - 0x015141 05:9131: 84 0E     STY ram_000E_t02
    MOVE.B  D1,ram_0008_t07  ; orig: - - - - - - 0x015143 05:9133: 86 08     STX ram_0008_t07
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x015145 05:9135: A9 40     LDA #$40
    MOVE.B  D0,ram_spr_index_1  ; orig: - - - - - - 0x015147 05:9137: 8D 43 03  STA ram_spr_index_1
    MOVE.B  #$44,D0  ; orig: - - - - - - 0x01514A 05:913A: A9 44     LDA #$44
    JMP     loc_bat_7804  ; orig: - - - - - - 0x01514C 05:913C: 4C 04 78  JMP loc_bat_7804



sub_913F:  ; orig: sub_913F:
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01514F 05:913F: A5 53     LDA ram_0053
    BEQ     bra_915E_RTS             ; BEQ  ; orig: C - - - - - 0x015151 05:9141: F0 1B     BEQ bra_915E_RTS
    MOVE.B  ram_03F8_link,D2  ; orig: C - - - - - 0x015153 05:9143: AC F8 03  LDY ram_03F8_link
    BEQ     bra_915E_RTS             ; BEQ  ; orig: C - - - - - 0x015156 05:9146: F0 16     BEQ bra_915E_RTS
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x015158 05:9148: A5 98     LDA ram_dir_link
    AND.B   ram_03F8_link,D0  ; orig: C - - - - - 0x01515A 05:914A: 2D F8 03  AND ram_03F8_link
    BNE     bra_915B             ; BNE  ; orig: C - - - - - 0x01515D 05:914D: D0 0C     BNE bra_915B
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01515F 05:914F: A5 98     LDA ram_dir_link
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x015161 05:9151: 20 13 70  JSR sub_bat_7013_get
    AND.B   ram_03F8_link,D0  ; orig: C - - - - - 0x015164 05:9154: 2D F8 03  AND ram_03F8_link
    BNE     bra_915B             ; BNE  ; orig: C - - - - - 0x015167 05:9157: D0 02     BNE bra_915B
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x015169 05:9159: A5 98     LDA ram_dir_link
bra_915B:  ; orig: bra_915B:
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x01516B 05:915B: 8D F8 03  STA ram_03F8_link
bra_915E_RTS:  ; orig: bra_915E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01516E 05:915E: 60        RTS



; bzk garbage, a copy of 0x01029A
    MOVE.B  #$F8,D0  ; orig: - - - - - - 0x01516F 05:915F: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: - - - - - - 0x015171 05:9161: 8D 40 02  STA ram_spr_Y + $40
    ; (empty translation for STA)  ; orig: - - - - - - 0x015174 05:9164: 8D 44 02  STA ram_spr_Y + $44
    RTS                     ; RTS  ; orig: - - - - - - 0x015177 05:9167: 60        RTS



tbl_9168:  ; orig: tbl_9168:
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 0 - - - 0x015178 05:9168: 78        .byte $78   ; 00
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 0 - - - 0x015179 05:9169: 78        .byte $78   ; 01
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 0 - - - 0x01517A 05:916A: 8D        .byte $8D   ; 02
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 0 - - - 0x01517B 05:916B: 8D        .byte $8D   ; 03



tbl_916C:  ; orig: tbl_916C:
    ; [DIRECTIVE] .BYTE $3D  -- needs manual handling  ; orig: - D 0 - - - 0x01517C 05:916C: 3D        .byte $3D   ; 00
    ; [DIRECTIVE] .BYTE $BD  -- needs manual handling  ; orig: - D 0 - - - 0x01517D 05:916D: BD        .byte $BD   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x01517E 05:916E: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $CF  -- needs manual handling  ; orig: - D 0 - - - 0x01517F 05:916F: CF        .byte $CF   ; 03



tbl_9170:  ; orig: tbl_9170:
    ; [DIRECTIVE] .BYTE $5E  -- needs manual handling  ; orig: - D 0 - - - 0x015180 05:9170: 5E        .byte $5E   ; 00
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 0 - - - 0x015181 05:9171: DE        .byte $DE   ; 01
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 0 - - - 0x015182 05:9172: 21        .byte $21   ; 02
    ; [DIRECTIVE] .BYTE $F1  -- needs manual handling  ; orig: - D 0 - - - 0x015183 05:9173: F1        .byte $F1   ; 03



tbl_9174:  ; orig: tbl_9174:
    ; [DIRECTIVE] .BYTE $3D  -- needs manual handling  ; orig: - D 0 - - - 0x015184 05:9174: 3D        .byte $3D   ; 00
    ; [DIRECTIVE] .BYTE $BF  -- needs manual handling  ; orig: - D 0 - - - 0x015185 05:9175: BF        .byte $BF   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x015186 05:9176: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 0 - - - 0x015187 05:9177: D2        .byte $D2   ; 03



tbl_9178:  ; orig: tbl_9178:
    ; [DIRECTIVE] .BYTE $5C  -- needs manual handling  ; orig: - D 0 - - - 0x015188 05:9178: 5C        .byte $5C   ; 00
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 0 - - - 0x015189 05:9179: DE        .byte $DE   ; 01
    ; [DIRECTIVE] .BYTE $1F  -- needs manual handling  ; orig: - D 0 - - - 0x01518A 05:917A: 1F        .byte $1F   ; 02
    ; [DIRECTIVE] .BYTE $F1  -- needs manual handling  ; orig: - D 0 - - - 0x01518B 05:917B: F1        .byte $F1   ; 03



sub_0x01518C:  ; orig: sub_0x01518C:
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x01518C 05:917C: A5 53     LDA ram_0053
    BNE     bra_91A2             ; BNE  ; orig: C - - - - - 0x01518E 05:917E: D0 22     BNE bra_91A2
bra_9180_loop:  ; orig: bra_9180_loop:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x015190 05:9180: A5 98     LDA ram_dir_link
    BSR     sub_920F             ; JSR -> BSR  ; orig: C - - - - - 0x015192 05:9182: 20 0F 92  JSR sub_920F
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x015195 05:9185: A0 03     LDY #$03
bra_9187_loop:  ; orig: bra_9187_loop:
    MOVE.B  ram_0000_t67,D0  ; orig: C - - - - - 0x015197 05:9187: A5 00     LDA ram_0000_t67
    CMP.B   tbl_9168(D2.L),D0  ; orig: C - - - - - 0x015199 05:9189: D9 68 91  CMP tbl_9168,Y
    BNE     bra_919A             ; BNE  ; orig: C - - - - - 0x01519C 05:918C: D0 0C     BNE bra_919A
    MOVE.B  ram_0001_t13,D0  ; orig: C - - - - - 0x01519E 05:918E: A5 01     LDA ram_0001_t13
    CMP.B   tbl_916C(D2.L),D0  ; orig: C - - - - - 0x0151A0 05:9190: D9 6C 91  CMP tbl_916C,Y
    BCC     bra_919A             ; BCC  ; orig: C - - - - - 0x0151A3 05:9193: 90 05     BCC bra_919A
    CMP.B   tbl_9170(D2.L),D0  ; orig: C - - - - - 0x0151A5 05:9195: D9 70 91  CMP tbl_9170,Y
    BCC     bra_91D6             ; BCC  ; orig: C - - - - - 0x0151A8 05:9198: 90 3C     BCC bra_91D6
bra_919A:  ; orig: bra_919A:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0151AA 05:919A: 88        DEY
    BPL     bra_9187_loop             ; BPL  ; orig: C - - - - - 0x0151AB 05:919B: 10 EA     BPL bra_9187_loop
bra_919D:  ; orig: bra_919D:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0151AD 05:919D: A9 00     LDA #$00
    MOVE.B  D0,ram_0053  ; orig: C - - - - - 0x0151AF 05:919F: 85 53     STA ram_0053
    RTS                     ; RTS  ; orig: C - - - - - 0x0151B1 05:91A1: 60        RTS
bra_91A2:  ; orig: bra_91A2:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0151B2 05:91A2: 48        PHA
    BSR     sub_920F             ; JSR -> BSR  ; orig: C - - - - - 0x0151B3 05:91A3: 20 0F 92  JSR sub_920F
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0151B6 05:91A6: 68        PLA
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x0151B7 05:91A7: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  ram_0001_t13,D0  ; orig: C - - - - - 0x0151BA 05:91AA: A5 01     LDA ram_0001_t13
    CMP.B   tbl_916C(D2.L),D0  ; orig: C - - - - - 0x0151BC 05:91AC: D9 6C 91  CMP tbl_916C,Y
    BCC     bra_91BC             ; BCC  ; orig: C - - - - - 0x0151BF 05:91AF: 90 0B     BCC bra_91BC
    CMP.B   tbl_9170(D2.L),D0  ; orig: C - - - - - 0x0151C1 05:91B1: D9 70 91  CMP tbl_9170,Y
    BCS     bra_91BC             ; BCS  ; orig: C - - - - - 0x0151C4 05:91B4: B0 06     BCS bra_91BC
    MOVE.B  ram_0053,D0  ; orig: C - - - - - 0x0151C6 05:91B6: A5 53     LDA ram_0053
    CMP.B   ram_dir_link,D0  ; orig: C - - - - - 0x0151C8 05:91B8: C5 98     CMP ram_dir_link
    BEQ     bra_9180_loop             ; BEQ  ; orig: C - - - - - 0x0151CA 05:91BA: F0 C4     BEQ bra_9180_loop
bra_91BC:  ; orig: bra_91BC:
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x0151CC 05:91BC: A0 03     LDY #$03
bra_91BE_loop:  ; orig: bra_91BE_loop:
    MOVE.B  ram_0000_t67,D0  ; orig: C - - - - - 0x0151CE 05:91BE: A5 00     LDA ram_0000_t67
    CMP.B   tbl_9168(D2.L),D0  ; orig: C - - - - - 0x0151D0 05:91C0: D9 68 91  CMP tbl_9168,Y
    BNE     bra_91D1             ; BNE  ; orig: C - - - - - 0x0151D3 05:91C3: D0 0C     BNE bra_91D1
    MOVE.B  ram_0001_t13,D0  ; orig: C - - - - - 0x0151D5 05:91C5: A5 01     LDA ram_0001_t13
    CMP.B   tbl_9174(D2.L),D0  ; orig: C - - - - - 0x0151D7 05:91C7: D9 74 91  CMP tbl_9174,Y
    BCC     bra_91D1             ; BCC  ; orig: C - - - - - 0x0151DA 05:91CA: 90 05     BCC bra_91D1
    CMP.B   tbl_9178(D2.L),D0  ; orig: C - - - - - 0x0151DC 05:91CC: D9 78 91  CMP tbl_9178,Y
    BCC     bra_91D6             ; BCC  ; orig: C - - - - - 0x0151DF 05:91CF: 90 05     BCC bra_91D6
bra_91D1:  ; orig: bra_91D1:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0151E1 05:91D1: 88        DEY
    BPL     bra_91BE_loop             ; BPL  ; orig: C - - - - - 0x0151E2 05:91D2: 10 EA     BPL bra_91BE_loop
    BMI     bra_919D             ; BMI  ; orig: C - - - - - 0x0151E4 05:91D4: 30 C7     BMI bra_919D    ; jm
bra_91D6:  ; orig: bra_91D6:
    MOVE.B  D2,ram_000E_t09  ; orig: C - - - - - 0x0151E6 05:91D6: 84 0E     STY ram_000E_t09
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x0151E8 05:91D8: AD F8 03  LDA ram_03F8_link
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0151EB 05:91DB: 29 0F     AND #$0F
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x0151ED 05:91DD: 85 02     STA ram_0002_t24_dir
    MOVE.B  D0,ram_000C_t08  ; orig: C - - - - - 0x0151EF 05:91DF: 85 0C     STA ram_000C_t08
    CMP.B   tbl_bat_6DC3_direction(D2.L),D0  ; orig: C - - - - - 0x0151F1 05:91E1: D9 C3 6D  CMP tbl_bat_6DC3_dir
    BNE     bra_920B_RTS             ; BNE  ; orig: C - - - - - 0x0151F4 05:91E4: D0 25     BNE bra_920B_RTS
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x0151F6 05:91E6: 20 F6 A3  JSR sub_A3F6
    MOVE.B  D0,ram_000D_t09  ; orig: C - - - - - 0x0151F9 05:91E9: 85 0D     STA ram_000D_t09
    BSR     sub_9220             ; JSR -> BSR  ; orig: C - - - - - 0x0151FB 05:91EB: 20 20 92  JSR sub_9220
    MOVE.B  ram_000E_t09,D2  ; orig: C - - - - - 0x0151FE 05:91EE: A4 0E     LDY ram_000E_t09
    BMI     bra_920B_RTS             ; BMI  ; orig: C - - - - - 0x015200 05:91F0: 30 19     BMI bra_920B_RTS
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x015202 05:91F2: B9 C3 6D  LDA tbl_bat_6DC3_dir
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x015205 05:91F5: 85 98     STA ram_dir_link
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x015207 05:91F7: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D0,ram_0053  ; orig: C - - - - - 0x015209 05:91F9: 85 53     STA ram_0053
    MOVE.B  ram_000D_t09,D0  ; orig: C - - - - - 0x01520B 05:91FB: A5 0D     LDA ram_000D_t09
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01520D 05:91FD: 29 07     AND #$07
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01520F 05:91FF: C9 02     CMP #$02
    BEQ     bra_920C             ; BEQ  ; orig: C - - - - - 0x015211 05:9201: F0 09     BEQ bra_920C
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x015213 05:9203: C9 03     CMP #$03
    BEQ     bra_920C             ; BEQ  ; orig: C - - - - - 0x015215 05:9205: F0 05     BEQ bra_920C
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x015217 05:9207: C9 04     CMP #$04
    BEQ     bra_920C             ; BEQ  ; orig: C - - - - - 0x015219 05:9209: F0 01     BEQ bra_920C
bra_920B_RTS:  ; orig: bra_920B_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01521B 05:920B: 60        RTS
bra_920C:  ; orig: bra_920C:
    JMP     loc_0x01F192  ; orig: C - - - - - 0x01521C 05:920C: 4C 82 F1  JMP loc_0x01F192



sub_920F:  ; orig: sub_920F:

; out

; ram_0000_t67

; ram_0001_t13
    MOVE.B  ram_pos_X_link,D1  ; orig: C - - - - - 0x01521F 05:920F: A6 70     LDX ram_pos_X_link
    MOVE.B  ram_pos_Y_link,D2  ; orig: C - - - - - 0x015221 05:9211: A4 84     LDY ram_pos_Y_link
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x015223 05:9213: 29 03     AND #$03
    BEQ     bra_921B             ; BEQ  ; orig: C - - - - - 0x015225 05:9215: F0 04     BEQ bra_921B
    MOVE.B  ram_pos_X_link,D2  ; orig: C - - - - - 0x015227 05:9217: A4 70     LDY ram_pos_X_link
    MOVE.B  ram_pos_Y_link,D1  ; orig: C - - - - - 0x015229 05:9219: A6 84     LDX ram_pos_Y_link
bra_921B:  ; orig: bra_921B:
    MOVE.B  D1,ram_0000_t67  ; orig: C - - - - - 0x01522B 05:921B: 86 00     STX ram_0000_t67
    MOVE.B  D2,ram_0001_t13  ; orig: C - - - - - 0x01522D 05:921D: 84 01     STY ram_0001_t13
    RTS                     ; RTS  ; orig: C - - - - - 0x01522F 05:921F: 60        RTS



sub_9220:  ; orig: sub_9220:
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x015230 05:9220: 29 07     AND #$07
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x015232 05:9222: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_022_9239_00_RTS  -- needs manual handling  ; orig: - D 0 - I - 0x015235 05:9225: 39 92     .word ofs_022_9239_0
    ; [DIRECTIVE] .WORD ofs_022_9235_01  -- needs manual handling  ; orig: - D 0 - I - 0x015237 05:9227: 35 92     .word ofs_022_9235_0
    ; [DIRECTIVE] .WORD ofs_022_923A_02  -- needs manual handling  ; orig: - D 0 - I - 0x015239 05:9229: 3A 92     .word ofs_022_923A_0
    ; [DIRECTIVE] .WORD ofs_022_923A_03  -- needs manual handling  ; orig: - - - - - - 0x01523B 05:922B: 3A 92     .word ofs_022_923A_0
    ; [DIRECTIVE] .WORD ofs_022_924A_04  -- needs manual handling  ; orig: - D 0 - I - 0x01523D 05:922D: 4A 92     .word ofs_022_924A_0
    ; [DIRECTIVE] .WORD ofs_022_926B_05  -- needs manual handling  ; orig: - D 0 - I - 0x01523F 05:922F: 6B 92     .word ofs_022_926B_0
    ; [DIRECTIVE] .WORD ofs_022_926B_06  -- needs manual handling  ; orig: - - - - - - 0x015241 05:9231: 6B 92     .word ofs_022_926B_0
    ; [DIRECTIVE] .WORD ofs_022_9251_07  -- needs manual handling  ; orig: - D 0 - I - 0x015243 05:9233: 51 92     .word ofs_022_9251_0



bra_9235:  ; orig: bra_9235:
loc_9235:  ; orig: loc_9235:
ofs_022_9235_01:  ; orig: ofs_022_9235_01:
    MOVE.B  #$FF,D2  ; orig: C D 0 - - - 0x015245 05:9235: A0 FF     LDY #$FF
    MOVE.B  D2,ram_000E_t09  ; orig: C - - - - - 0x015247 05:9237: 84 0E     STY ram_000E_t09
ofs_022_9239_00_RTS:  ; orig: ofs_022_9239_00_RTS:
    RTS                     ; RTS  ; orig: C - - J - - 0x015249 05:9239: 60        RTS



ofs_022_923A_02:  ; orig: ofs_022_923A_02:
ofs_022_923A_03:  ; orig: ofs_022_923A_03:
    MOVE.B  ram_timer_link,D0  ; orig: C - - J - - 0x01524A 05:923A: A5 28     LDA ram_timer_link
    BEQ     bra_9243             ; BEQ  ; orig: C - - - - - 0x01524C 05:923C: F0 05     BEQ bra_9243
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x01524E 05:923E: C9 01     CMP #$01
    BNE     bra_9247             ; BNE  ; orig: C - - - - - 0x015250 05:9240: D0 05     BNE bra_9247
    RTS                     ; RTS  ; orig: C - - - - - 0x015252 05:9242: 60        RTS
bra_9243:  ; orig: bra_9243:
    MOVE.B  #$18,D0  ; orig: C - - - - - 0x015253 05:9243: A9 18     LDA #$18
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x015255 05:9245: 85 28     STA ram_timer_link
bra_9247:  ; orig: bra_9247:
    JMP     loc_9235  ; orig: C - - - - - 0x015257 05:9247: 4C 35 92  JMP loc_9235



ofs_022_924A_04:  ; orig: ofs_022_924A_04:
    MOVE.B  ram_000C_t08,D0  ; orig: C - - J - - 0x01525A 05:924A: A5 0C     LDA ram_000C_t08
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x01525C 05:924C: 25 EE     AND ram_00EE
    BEQ     bra_9235             ; BEQ  ; orig: C - - - - - 0x01525E 05:924E: F0 E5     BEQ bra_9235
    RTS                     ; RTS  ; orig: C - - - - - 0x015260 05:9250: 60        RTS



ofs_022_9251_07:  ; orig: ofs_022_9251_07:
    MOVE.B  ram_0054_timer,D0  ; orig: C - - J - - 0x015261 05:9251: A5 54     LDA ram_0054_timer
    BNE     bra_9235             ; BNE  ; orig: C - - - - - 0x015263 05:9253: D0 E0     BNE bra_9235
    MOVE.B  ram_000C_t08,D0  ; orig: C - - - - - 0x015265 05:9255: A5 0C     LDA ram_000C_t08
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x015267 05:9257: 25 EE     AND ram_00EE
    BEQ     bra_9235             ; BEQ  ; orig: C - - - - - 0x015269 05:9259: F0 DA     BEQ bra_9235
    AND.B   ram_0519,D0  ; orig: C - - - - - 0x01526B 05:925B: 2D 19 05  AND ram_0519
    BEQ     bra_9262             ; BEQ  ; orig: C - - - - - 0x01526E 05:925E: F0 02     BEQ bra_9262
    BNE     bra_928E             ; BNE  ; orig: C - - - - - 0x015270 05:9260: D0 2C     BNE bra_928E    ; jm
bra_9262:  ; orig: bra_9262:
    MOVE.B  ram_0519,D0  ; orig: C - - - - - 0x015272 05:9262: AD 19 05  LDA ram_0519
    OR.B    ram_000C_t08,D0  ; orig: C - - - - - 0x015275 05:9265: 05 0C     ORA ram_000C_t08
    MOVE.B  D0,ram_0519  ; orig: C - - - - - 0x015277 05:9267: 8D 19 05  STA ram_0519
    RTS                     ; RTS  ; orig: C - - - - - 0x01527A 05:926A: 60        RTS



ofs_022_926B_05:  ; orig: ofs_022_926B_05:
ofs_022_926B_06:  ; orig: ofs_022_926B_06:
    MOVE.B  ram_000C_t08,D0  ; orig: C - - J - - 0x01527B 05:926B: A5 0C     LDA ram_000C_t08
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x01527D 05:926D: 25 EE     AND ram_00EE
    BNE     bra_9292_RTS             ; BNE  ; orig: C - - - - - 0x01527F 05:926F: D0 21     BNE bra_9292_RTS
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x015281 05:9271: A5 54     LDA ram_0054_timer
    BNE     bra_928E             ; BNE  ; orig: C - - - - - 0x015283 05:9273: D0 19     BNE bra_928E
    MOVE.B  ram_item_magic_key,D0  ; orig: C - - - - - 0x015285 05:9275: AD 64 06  LDA ram_item_magic_k
    BNE     bra_9282             ; BNE  ; orig: C - - - - - 0x015288 05:9278: D0 08     BNE bra_9282
    MOVE.B  ram_item_keys,D0  ; orig: C - - - - - 0x01528A 05:927A: AD 6E 06  LDA ram_item_keys
    BEQ     bra_928B             ; BEQ  ; orig: C - - - - - 0x01528D 05:927D: F0 0C     BEQ bra_928B
    SUBQ.B  #1,ram_item_keys  ; orig: C - - - - - 0x01528F 05:927F: CE 6E 06  DEC ram_item_keys
bra_9282:  ; orig: bra_9282:
    MOVE.B  ram_000C_t08,D0  ; orig: C - - - - - 0x015292 05:9282: A5 0C     LDA ram_000C_t08
    BSR     sub_8ADA             ; JSR -> BSR  ; orig: C - - - - - 0x015294 05:9284: 20 DA 8A  JSR sub_8ADA
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x015297 05:9287: A9 20     LDA #$20
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x015299 05:9289: 85 28     STA ram_timer_link
bra_928B:  ; orig: bra_928B:
    JMP     loc_9235  ; orig: C - - - - - 0x01529B 05:928B: 4C 35 92  JMP loc_9235
bra_928E:  ; orig: bra_928E:
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x01529E 05:928E: A5 28     LDA ram_timer_link
    BNE     bra_928B             ; BNE  ; orig: C - - - - - 0x0152A0 05:9290: D0 F9     BNE bra_928B
bra_9292_RTS:  ; orig: bra_9292_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0152A2 05:9292: 60        RTS



sub_9293:  ; orig: sub_9293:
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x0152A3 05:9293: A0 05     LDY #$05
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0152A5 05:9295: A5 EB     LDA ram_map_location
bra_9297_loop:  ; orig: bra_9297_loop:
    CMP.B   ram_room_history(D2.L),D0  ; orig: C - - - - - 0x0152A7 05:9297: D9 21 06  CMP ram_room_history
    BEQ     bra_92C6             ; BEQ  ; orig: C - - - - - 0x0152AA 05:929A: F0 2A     BEQ bra_92C6
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0152AC 05:929C: 88        DEY
    BPL     bra_9297_loop             ; BPL  ; orig: C - - - - - 0x0152AD 05:929D: 10 F8     BPL bra_9297_loop
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x0152AF 05:929F: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI.B  #$C0,D0  ; orig: C - - - - - 0x0152B2 05:92A2: 29 C0     AND #$C0
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x0152B4 05:92A4: C9 C0     CMP #$C0
    BNE     bra_92C6             ; BNE  ; orig: C - - - - - 0x0152B6 05:92A6: D0 1E     BNE bra_92C6
    MOVE.B  ram_0002_t38_obj_id,D0  ; orig: C - - - - - 0x0152B8 05:92A8: A5 02     LDA ram_0002_t38_obj
    CMPI.B  #$32,D0  ; orig: C - - - - - 0x0152BA 05:92AA: C9 32     CMP #$32
    BCC     bra_92BA             ; BCC  ; orig: C - - - - - 0x0152BC 05:92AC: 90 0C     BCC bra_92BA
    CMPI.B  #$3A,D0  ; orig: - - - - - - 0x0152BE 05:92AE: C9 3A     CMP #$3A
    BEQ     bra_92BA             ; BEQ  ; orig: - - - - - - 0x0152C0 05:92B0: F0 08     BEQ bra_92BA
    CMPI.B  #$3B,D0  ; orig: - - - - - - 0x0152C2 05:92B2: C9 3B     CMP #$3B
    BEQ     bra_92BA             ; BEQ  ; orig: - - - - - - 0x0152C4 05:92B4: F0 04     BEQ bra_92BA
    CMPI.B  #$49,D0  ; orig: - - - - - - 0x0152C6 05:92B6: C9 49     CMP #$49
    BCC     bra_92D0             ; BCC  ; orig: - - - - - - 0x0152C8 05:92B8: 90 16     BCC bra_92D0
bra_92BA:  ; orig: bra_92BA:
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0152CA 05:92BA: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x0152CC 05:92BC: 29 3F     AND #$3F
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0152CE 05:92BE: 91 00     STA (ram_0000_t13_da
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0152D0 05:92C0: A9 00     LDA #$00
    MOVE.B  D0,ram_0560(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x0152D2 05:92C2: 99 60 05  STA ram_0560,Y
    RTS                     ; RTS  ; orig: C - - - - - 0x0152D5 05:92C5: 60        RTS
bra_92C6:  ; orig: bra_92C6:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0152D6 05:92C6: A4 EB     LDY ram_map_location
    MOVE.B  ram_0003_t15_objects_counter,D0  ; orig: C - - - - - 0x0152D8 05:92C8: A5 03     LDA ram_0003_t15_obj
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0152DA 05:92CA: 38        SEC
    ; !! SBC ram_0560,Y - complex mode, manual review needed  ; orig: C - - - - - 0x0152DB 05:92CB: F9 60 05  SBC ram_0560,Y
    BPL     bra_92D4             ; BPL  ; orig: C - - - - - 0x0152DE 05:92CE: 10 04     BPL bra_92D4
bra_92D0:  ; orig: bra_92D0:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0152E0 05:92D0: A9 00     LDA #$00
    MOVE.B  D0,ram_0002_t38_obj_id  ; orig: C - - - - - 0x0152E2 05:92D2: 85 02     STA ram_0002_t38_obj
bra_92D4:  ; orig: bra_92D4:
    MOVE.B  D0,ram_0003_t15_objects_counter  ; orig: C - - - - - 0x0152E4 05:92D4: 85 03     STA ram_0003_t15_obj
    RTS                     ; RTS  ; orig: C - - - - - 0x0152E6 05:92D6: 60        RTS



sub_92D7:  ; orig: sub_92D7:

; code for dungeons only, not for overworld
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x0152E7 05:92D7: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x0152EA 05:92DA: 29 3F     AND #$3F
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0152EC 05:92DC: 91 00     STA (ram_0000_t13_da
    MOVE.B  ram_enemy_cnt,D0  ; orig: C - - - - - 0x0152EE 05:92DE: AD 4E 03  LDA ram_enemy_cnt
    BEQ     bra_9316             ; BEQ  ; orig: C - - - - - 0x0152F1 05:92E1: F0 33     BEQ bra_9316
    MOVE.B  ram_room_kill_cnt,D0  ; orig: C - - - - - 0x0152F3 05:92E3: AD 4F 03  LDA ram_room_kill_cn
    BEQ     bra_92FB             ; BEQ  ; orig: C - - - - - 0x0152F6 05:92E6: F0 13     BEQ bra_92FB
    MOVE.B  ram_copy_obj_id,D2  ; orig: C - - - - - 0x0152F8 05:92E8: AC 5F 03  LDY ram_copy_obj_id
    CMPI.B  #$32,D2  ; orig: C - - - - - 0x0152FB 05:92EB: C0 32     CPY #$32
    BCC     bra_92FB             ; BCC  ; orig: C - - - - - 0x0152FD 05:92ED: 90 0C     BCC bra_92FB
    CMPI.B  #con_obj_id_3A,D2  ; orig: C - - - - - 0x0152FF 05:92EF: C0 3A     CPY #con_obj_id_3A
    BEQ     bra_92FB             ; BEQ  ; orig: C - - - - - 0x015301 05:92F1: F0 08     BEQ bra_92FB
    CMPI.B  #con_obj_id_3B,D2  ; orig: C - - - - - 0x015303 05:92F3: C0 3B     CPY #con_obj_id_3B
    BEQ     bra_92FB             ; BEQ  ; orig: C - - - - - 0x015305 05:92F5: F0 04     BEQ bra_92FB
    CMPI.B  #$49,D2  ; orig: C - - - - - 0x015307 05:92F7: C0 49     CPY #$49
    BCC     bra_9316             ; BCC  ; orig: C - - - - - 0x015309 05:92F9: 90 1B     BCC bra_9316
bra_92FB:  ; orig: bra_92FB:
    CMP.B   ram_enemy_cnt,D0  ; orig: C - - - - - 0x01530B 05:92FB: CD 4E 03  CMP ram_enemy_cnt
    BCS     bra_9316             ; BCS  ; orig: C - - - - - 0x01530E 05:92FE: B0 16     BCS bra_9316
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x015310 05:9300: A4 EB     LDY ram_map_location
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x015312 05:9302: 18        CLC
    ; !! ADC ram_0560,Y - complex mode, manual review needed  ; orig: C - - - - - 0x015313 05:9303: 79 60 05  ADC ram_0560,Y
    MOVE.B  D0,ram_0560(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x015316 05:9306: 99 60 05  STA ram_0560,Y
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x015319 05:9309: C9 03     CMP #$03
    BCC     bra_930F_not_overflow             ; BCC  ; orig: C - - - - - 0x01531B 05:930B: 90 02     BCC bra_930F_not_ove
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01531D 05:930D: A9 02     LDA #$02
bra_930F_not_overflow:  ; orig: bra_930F_not_overflow:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01531F 05:930F: 18        CLC
    ROXR.B  #1,D0           ; ROR A (uses X flag)  ; orig: C - - - - - 0x015320 05:9310: 6A        ROR
    ROXR.B  #1,D0           ; ROR A (uses X flag)  ; orig: C - - - - - 0x015321 05:9311: 6A        ROR
    ROXR.B  #1,D0           ; ROR A (uses X flag)  ; orig: C - - - - - 0x015322 05:9312: 6A        ROR
    JMP     loc_931F  ; orig: C - - - - - 0x015323 05:9313: 4C 1F 93  JMP loc_931F
bra_9316:  ; orig: bra_9316:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x015326 05:9316: A4 EB     LDY ram_map_location
    MOVE.B  #$0F,D0  ; orig: C - - - - - 0x015328 05:9318: A9 0F     LDA #$0F
    MOVE.B  D0,ram_0560(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01532A 05:931A: 99 60 05  STA ram_0560,Y
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x01532D 05:931D: A9 C0     LDA #$C0
loc_931F:  ; orig: loc_931F:
    ; !! ORA (ram_0000_t13_data),Y - needs manual review  ; orig: C D 0 - - - 0x01532F 05:931F: 11 00     ORA (ram_0000_t13_da
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x015331 05:9321: 91 00     STA (ram_0000_t13_da
    RTS                     ; RTS  ; orig: C - - - - - 0x015333 05:9323: 60        RTS



tbl_9324_sfx_1:  ; orig: tbl_9324_sfx_1:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x015334 05:9324: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE con_sfx_1_10  -- needs manual handling  ; orig: - D 0 - - - 0x015335 05:9325: 10        .byte con_sfx_1_10  
    ; [DIRECTIVE] .BYTE con_sfx_1_20  -- needs manual handling  ; orig: - D 0 - - - 0x015336 05:9326: 20        .byte con_sfx_1_20  
    ; [DIRECTIVE] .BYTE con_sfx_1_40  -- needs manual handling  ; orig: - D 0 - - - 0x015337 05:9327: 40        .byte con_sfx_1_40  



sub_0x015338:  ; orig: sub_0x015338:
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x015338 05:9328: 20 CE E6  JSR sub_0x01E6DE_get
    MOVE.B  ram_6BBC,D2  ; orig: C - - - - - 0x01533B 05:932B: AC BC 6B  LDY ram_6BBC
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01533E 05:932E: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$C0,D0  ; orig: C - - - - - 0x015340 05:9330: 29 C0     AND #$C0
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x015342 05:9332: C9 C0     CMP #$C0
    BEQ     bra_934D             ; BEQ  ; orig: C - - - - - 0x015344 05:9334: F0 17     BEQ bra_934D
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x015346 05:9336: A4 EB     LDY ram_map_location
    MOVE.B  ram_6A7E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x015348 05:9338: B9 7E 6A  LDA ram_6A7E_map_dat
    ANDI.B  #$60,D0  ; orig: C - - - - - 0x01534B 05:933B: 29 60     AND #$60
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01534D 05:933D: 0A        ASL
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x01534E 05:933E: 2A        ROL
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x01534F 05:933F: 2A        ROL
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x015350 05:9340: 2A        ROL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x015351 05:9341: AA        TAX
    MOVE.B  tbl_9324_sfx_1(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x015352 05:9342: BD 24 93  LDA tbl_9324_sfx_1,X
    BEQ     bra_934D             ; BEQ  ; orig: C - - - - - 0x015355 05:9345: F0 06     BEQ bra_934D
    ORI.B   #con_sfx_1_80,D0  ; orig: C - - - - - 0x015357 05:9347: 09 80     ORA #con_sfx_1_80
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x015359 05:9349: 8D 01 06  STA ram_sfx_1
    RTS                     ; RTS  ; orig: C - - - - - 0x01535C 05:934C: 60        RTS
bra_934D:  ; orig: bra_934D:
    MOVE.B  #con_sfx_3_80,D0  ; orig: C - - - - - 0x01535D 05:934D: A9 80     LDA #con_sfx_3_80
    JMP     loc_bat_6D80_set_sfx_3  ; orig: C - - - - - 0x01535F 05:934F: 4C 80 6D  JMP loc_bat_6D80_set



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x015362 05:9352: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x015370 05:9360: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x015380 05:9370: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x015390 05:9380: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153A0 05:9390: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153B0 05:93A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153C0 05:93B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153D0 05:93C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153E0 05:93D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0153F0 05:93E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x015400 05:93F0: FF        .byte $FF, $FF, $FF,



sub_9400:  ; orig: sub_9400:

; in

; ram_0002_t05_data

; ram_0004_t19

; ram_0007_t08

; ram_0009_t01
    MOVE.B  ram_0009_t01,D2  ; orig: C - - - - - 0x015410 05:9400: A4 09     LDY ram_0009_t01
    MOVE.B  tbl_A5E3(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x015412 05:9402: B9 E3 A5  LDA tbl_A5E3,Y
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x015415 05:9405: 18        CLC
    ADDX.B  ram_0007_t08,D0  ; orig: C - - - - - 0x015416 05:9406: 65 07     ADC ram_0007_t08
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x015418 05:9408: A8        TAY
    MOVE.B  tbl_A5D5(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x015419 05:9409: B9 D5 A5  LDA tbl_A5D5,Y
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01541C 05:940C: A8        TAY
    MOVEA.W ($FF0000+ram_0002_t05_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01541D 05:940D: B1 02     LDA (ram_0002_t05_da
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01541F 05:940F: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x015422 05:9412: E8        INX
    ADDQ.B  #1,ram_0007_t08  ; orig: C - - - - - 0x015423 05:9413: E6 07     INC ram_0007_t08
    SUBQ.B  #1,ram_0004_t19  ; orig: C - - - - - 0x015425 05:9415: C6 04     DEC ram_0004_t19
    RTS                     ; RTS  ; orig: C - - - - - 0x015427 05:9417: 60        RTS



tbl_9418:  ; orig: tbl_9418:
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $50, $01, $01, $81, $01, $01, $01, $01, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015428 05:9418: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $01, $F1, $C8, $A0, $A1, $A0, $06, $38, $A1, $D2, $A5, $A4, $A2, $A3, $F0, $A6  -- needs manual handling  ; orig: - D 0 - I - 0x015438 05:9428: 01        .byte $01, $F1, $C8,
    ; [DIRECTIVE] .BYTE $01, $01, $01, $50, $01, $01, $81, $01, $01, $A7, $A9, $C8, $C7, $A0, $06, $06  -- needs manual handling  ; orig: - - - - - - 0x015448 05:9438: 01        .byte $01, $01, $01,
    ; [DIRECTIVE] .BYTE $A1, $A5, $A4, $A8, $F0, $A6, $01, $81, $01, $01, $50, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x015458 05:9448: A1        .byte $A1, $A5, $A4,
    ; [DIRECTIVE] .BYTE $00, $E6, $06, $06, $A1, $A0, $E7, $E6, $A1, $84, $90, $02, $10, $02, $02, $A8  -- needs manual handling  ; orig: - - - - - - 0x015468 05:9458: 00        .byte $00, $E6, $06,
    ; [DIRECTIVE] .BYTE $A9, $A8, $A9, $03, $05, $E4, $24, $02, $02, $03, $05, $22, $24, $02, $A8, $A6  -- needs manual handling  ; orig: - D 0 - I - 0x015478 05:9468: A9        .byte $A9, $A8, $A9,
    ; [DIRECTIVE] .BYTE $A7, $A6, $A7, $F1, $A9, $A8, $A9, $A2, $A3, $A8, $A6, $A7, $A6, $A7, $A6, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015488 05:9478: A7        .byte $A7, $A6, $A7,
    ; [DIRECTIVE] .BYTE $01, $01, $01, $01, $50, $01, $A7, $F1, $F0, $A6, $81, $01, $A7, $A6, $01, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015498 05:9488: 01        .byte $01, $01, $01,
    ; [DIRECTIVE] .BYTE $A7, $A9, $A8, $A9, $71, $32, $33, $02, $34, $02, $34, $02, $34, $A8, $F0, $00  -- needs manual handling  ; orig: - - - - - - 0x0154A8 05:9498: A7        .byte $A7, $A9, $A8,
    ; [DIRECTIVE] .BYTE $00, $A9, $10, $53, $54, $B1, $55, $B2, $54, $54, $54, $56, $02, $B5, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x0154B8 05:94A8: 00        .byte $00, $A9, $10,
    ; [DIRECTIVE] .BYTE $00, $F1, $A9, $B7, $02, $B7, $67, $68, $70, $B7, $02, $B7, $A5, $A4, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x0154C8 05:94B8: 00        .byte $00, $F1, $A9,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $50, $A7, $A9, $10, $02, $A2, $A3, $F0, $F1, $A9, $02  -- needs manual handling  ; orig: - D 0 - I - 0x0154D8 05:94C8: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $02, $02, $A8, $F0, $F1, $A9, $A5, $A4, $02, $D2, $C8, $C7, $A0, $38, $E7, $00  -- needs manual handling  ; orig: - D 0 - I - 0x0154E8 05:94D8: 02        .byte $02, $02, $A8,
    ; [DIRECTIVE] .BYTE $80, $80, $80, $80, $80, $96, $80, $80, $80, $80, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x0154F8 05:94E8: 80        .byte $80, $80, $80,
    ; [DIRECTIVE] .BYTE $13, $00, $02, $02, $67, $70, $02, $67, $D7, $70, $02, $67, $70, $02, $00, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015508 05:94F8: 13        .byte $13, $00, $02,
    ; [DIRECTIVE] .BYTE $00, $F1, $A9, $02, $33, $02, $32, $B6, $34, $D2, $02, $64, $F2, $F3, $02, $64  -- needs manual handling  ; orig: - - - - - - 0x015518 05:9508: 00        .byte $00, $F1, $A9,
    ; [DIRECTIVE] .BYTE $66, $02, $E5, $D8, $66, $02, $02, $B6, $71, $02, $32, $02, $33, $02, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015528 05:9518: 66        .byte $66, $02, $E5,
    ; [DIRECTIVE] .BYTE $00, $E6, $06, $83, $06, $A1, $84, $90, $D2, $64, $F2, $F3, $64, $F2, $F3, $64  -- needs manual handling  ; orig: - D 0 - I - 0x015538 05:9528: 00        .byte $00, $E6, $06,
    ; [DIRECTIVE] .BYTE $66, $02, $D2, $C8, $C7, $A0, $06, $06, $06, $06, $83, $06, $A1, $84, $90, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015548 05:9538: 66        .byte $66, $02, $D2,
    ; [DIRECTIVE] .BYTE $02, $A2, $A3, $B7, $02, $02, $B7, $02, $02, $B7, $B5, $02, $D2, $B7, $C8, $A0  -- needs manual handling  ; orig: - D 0 - I - 0x015558 05:9548: 02        .byte $02, $A2, $A3,
    ; [DIRECTIVE] .BYTE $06, $E7, $E6, $38, $06, $E7, $E6, $A1, $A2, $A3, $A8, $A9, $D2, $B5, $A8, $A9  -- needs manual handling  ; orig: - D 0 - I - 0x015568 05:9558: 06        .byte $06, $E7, $E6,
    ; [DIRECTIVE] .BYTE $A8, $A9, $A2, $A3, $A8, $A9, $D2, $02, $A0, $06, $A1, $A6, $A7, $F1, $A9, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015578 05:9568: A8        .byte $A8, $A9, $A2,
    ; [DIRECTIVE] .BYTE $A5, $A4, $C8, $A0, $83, $06, $B4, $B0, $B0, $B0, $B0, $73, $73, $73, $73, $73  -- needs manual handling  ; orig: - D 0 - I - 0x015588 05:9578: A5        .byte $A5, $A4, $C8,
    ; [DIRECTIVE] .BYTE $73, $73, $73, $73, $73, $73, $73, $73, $72, $72, $72, $72, $D4, $72, $72, $72  -- needs manual handling  ; orig: - D 0 - I - 0x015598 05:9588: 73        .byte $73, $73, $73,
    ; [DIRECTIVE] .BYTE $72, $72, $72, $72, $D4, $72, $72, $72, $72, $72, $72, $72, $72, $72, $72, $72  -- needs manual handling  ; orig: - D 0 - I - 0x0155A8 05:9598: 72        .byte $72, $72, $72,
    ; [DIRECTIVE] .BYTE $72, $72, $72, $72, $72, $72, $C1, $06, $06, $06, $06, $06, $06, $83, $06, $01  -- needs manual handling  ; orig: - D 0 - I - 0x0155B8 05:95A8: 72        .byte $72, $72, $72,
    ; [DIRECTIVE] .BYTE $01, $A7, $A9, $32, $02, $33, $02, $11, $32, $02, $32, $02, $71, $A8, $A6, $01  -- needs manual handling  ; orig: - D 0 - I - 0x0155C8 05:95B8: 01        .byte $01, $A7, $A9,
    ; [DIRECTIVE] .BYTE $A7, $A9, $02, $B5, $02, $B6, $02, $B7, $02, $B7, $02, $B7, $02, $B7, $02, $02  -- needs manual handling  ; orig: - D 0 - I - 0x0155D8 05:95C8: A7        .byte $A7, $A9, $02,
    ; [DIRECTIVE] .BYTE $02, $02, $B5, $71, $A8, $00, $E6, $04, $04, $D6, $97, $91, $51, $B8, $51, $51  -- needs manual handling  ; orig: - D 0 - I - 0x0155E8 05:95D8: 02        .byte $02, $02, $B5,
    ; [DIRECTIVE] .BYTE $51, $51, $51, $51, $51, $B8, $51, $01, $01, $90, $02, $02, $D2, $02, $02, $02  -- needs manual handling  ; orig: - D 0 - I - 0x0155F8 05:95E8: 51        .byte $51, $51, $51,
    ; [DIRECTIVE] .BYTE $02, $02, $64, $66, $E5, $D8, $65, $66, $E5, $F3, $64, $F2, $F3, $02, $00, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015608 05:95F8: 02        .byte $02, $02, $64,
    ; [DIRECTIVE] .BYTE $00, $00, $E2, $82, $07, $07, $88, $07, $07, $82, $07, $07, $82, $07, $02, $02  -- needs manual handling  ; orig: - - - - - - 0x015618 05:9608: 00        .byte $00, $00, $E2,
    ; [DIRECTIVE] .BYTE $02, $02, $07, $82, $07, $07, $82, $07, $07, $88, $07, $07, $82, $07, $15, $15  -- needs manual handling  ; orig: - D 0 - I - 0x015628 05:9618: 02        .byte $02, $02, $07,
    ; [DIRECTIVE] .BYTE $00, $00, $02, $B7, $B7, $B7, $67, $D7, $F5, $70, $B7, $B7, $B7, $02, $00, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015638 05:9628: 00        .byte $00, $00, $02,
    ; [DIRECTIVE] .BYTE $00, $A9, $02, $71, $32, $34, $B5, $A8, $00, $00, $A9, $02, $02, $B5, $02, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015648 05:9638: 00        .byte $00, $A9, $02,
    ; [DIRECTIVE] .BYTE $02, $02, $B7, $A8, $A9, $B7, $A2, $A3, $B7, $02, $B6, $B7, $A2, $A3, $B7, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015658 05:9648: 02        .byte $02, $02, $B7,
    ; [DIRECTIVE] .BYTE $02, $02, $B7, $B6, $B5, $B7, $A2, $A3, $B7, $02, $10, $B7, $02, $B6, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015668 05:9658: 02        .byte $02, $02, $B7,
    ; [DIRECTIVE] .BYTE $00, $A9, $07, $D3, $02, $A8, $F0, $F1, $A9, $39, $91, $51, $97, $91, $51, $97  -- needs manual handling  ; orig: - D 0 - I - 0x015678 05:9668: 00        .byte $00, $A9, $07,
    ; [DIRECTIVE] .BYTE $91, $51, $97, $91, $51, $97, $13, $C3, $58, $58, $58, $91, $51, $97, $85, $47  -- needs manual handling  ; orig: - D 0 - I - 0x015688 05:9678: 91        .byte $91, $51, $97,
    ; [DIRECTIVE] .BYTE $61, $61, $61, $61, $61, $61, $60, $76, $76, $17, $17, $26, $17, $31, $28, $17  -- needs manual handling  ; orig: - D 0 - I - 0x015698 05:9688: 61        .byte $61, $61, $61,
    ; [DIRECTIVE] .BYTE $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9, $F9  -- needs manual handling  ; orig: - D 0 - I - 0x0156A8 05:9698: F9        .byte $F9, $F9, $F9,
    ; [DIRECTIVE] .BYTE $F9, $F9, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $F9  -- needs manual handling  ; orig: - D 0 - I - 0x0156B8 05:96A8: F9        .byte $F9, $F9, $C4,
    ; [DIRECTIVE] .BYTE $F9, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $C4, $F9, $F9  -- needs manual handling  ; orig: - D 0 - I - 0x0156C8 05:96B8: F9        .byte $F9, $C4, $C4,
    ; [DIRECTIVE] .BYTE $02, $02, $02, $B6, $02, $03, $05, $21, $21, $E4, $24, $02, $A0, $06, $06, $06  -- needs manual handling  ; orig: - D 0 - I - 0x0156D8 05:96C8: 02        .byte $02, $02, $02,
    ; [DIRECTIVE] .BYTE $06, $06, $83, $A1, $02, $D2, $A2, $18, $18, $35, $36, $36, $36, $36, $36, $36  -- needs manual handling  ; orig: - D 0 - I - 0x0156E8 05:96D8: 06        .byte $06, $06, $83,
    ; [DIRECTIVE] .BYTE $36, $36, $52, $52, $52, $52, $52, $52, $86, $E1, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - - - - - - 0x0156F8 05:96E8: 36        .byte $36, $36, $52,
    ; [DIRECTIVE] .BYTE $00, $02, $67, $70, $02, $67, $87, $70, $02, $67, $70, $02, $02, $00, $00, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015708 05:96F8: 00        .byte $00, $02, $67,
    ; [DIRECTIVE] .BYTE $00, $00, $18, $94, $18, $18, $94, $18, $18, $94, $18, $18, $94, $18, $A3, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015718 05:9708: 00        .byte $00, $00, $18,
    ; [DIRECTIVE] .BYTE $02, $A2, $18, $94, $18, $18, $94, $18, $18, $94, $18, $18, $94, $18, $16, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015728 05:9718: 02        .byte $02, $A2, $18,
    ; [DIRECTIVE] .BYTE $F0, $F1, $A9, $C8, $C7, $A0, $06, $83, $A1, $A5, $A4, $C8, $C7, $A6, $01, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015738 05:9728: F0        .byte $F0, $F1, $A9,
    ; [DIRECTIVE] .BYTE $01, $A7, $02, $B7, $02, $B7, $B6, $B7, $02, $B7, $D2, $B7, $02, $B6, $00, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015748 05:9738: 01        .byte $01, $A7, $02,
    ; [DIRECTIVE] .BYTE $00, $A9, $B7, $02, $B7, $02, $B7, $02, $07, $39, $47, $47, $47, $47, $91, $78  -- needs manual handling  ; orig: - D 0 - I - 0x015758 05:9748: 00        .byte $00, $A9, $B7,
    ; [DIRECTIVE] .BYTE $78, $78, $78, $78, $B8, $51, $97, $91, $51, $51, $51, $97, $91, $51, $51, $97  -- needs manual handling  ; orig: - D 0 - I - 0x015768 05:9758: 78        .byte $78, $78, $78,
    ; [DIRECTIVE] .BYTE $91, $97, $58, $58, $91, $51, $97, $91, $97, $13, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015778 05:9768: 91        .byte $91, $97, $58,
    ; [DIRECTIVE] .BYTE $13, $00, $02, $64, $F2, $F3, $64, $65, $66, $E5, $D8, $66, $02, $02, $01, $12  -- needs manual handling  ; orig: - D 0 - I - 0x015788 05:9778: 13        .byte $13, $00, $02,
    ; [DIRECTIVE] .BYTE $12, $12, $12, $12, $12, $12, $44, $18, $18, $17, $28, $17, $25, $17, $17, $15  -- needs manual handling  ; orig: - D 0 - I - 0x015798 05:9788: 12        .byte $12, $12, $12,
    ; [DIRECTIVE] .BYTE $00, $A9, $02, $77, $02, $53, $54, $D1, $D1, $54, $56, $02, $77, $02, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x0157A8 05:9798: 00        .byte $00, $A9, $02,
    ; [DIRECTIVE] .BYTE $00, $00, $C6, $C6, $C6, $C6, $C6, $C5, $C5, $C6, $C6, $C6, $C6, $C6, $C6, $F9  -- needs manual handling  ; orig: - - - - - - 0x0157B8 05:97A8: 00        .byte $00, $00, $C6,
    ; [DIRECTIVE] .BYTE $F9, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C5, $C5, $00, $00  -- needs manual handling  ; orig: - - - - - - 0x0157C8 05:97B8: F9        .byte $F9, $C6, $C6,
    ; [DIRECTIVE] .BYTE $15, $76, $26, $76, $26, $76, $49, $18, $18, $49, $76, $26, $76, $25, $76, $15  -- needs manual handling  ; orig: - D 0 - I - 0x0157D8 05:97C8: 15        .byte $15, $76, $26,
    ; [DIRECTIVE] .BYTE $00, $00, $D5, $08, $08, $08, $08, $08, $08, $35, $36, $36, $36, $36, $36, $36  -- needs manual handling  ; orig: - - - - - - 0x0157E8 05:97D8: 00        .byte $00, $00, $D5,
    ; [DIRECTIVE] .BYTE $36, $36, $36, $36, $36, $52, $D0, $52, $86, $E1, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x0157F8 05:97E8: 36        .byte $36, $36, $36,
    ; [DIRECTIVE] .BYTE $00, $00, $D5, $93, $08, $08, $93, $08, $08, $93, $08, $08, $93, $08, $B5, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015808 05:97F8: 00        .byte $00, $00, $D5,
    ; [DIRECTIVE] .BYTE $02, $02, $08, $93, $08, $08, $93, $08, $08, $93, $08, $08, $93, $08, $15, $15  -- needs manual handling  ; orig: - D 0 - I - 0x015818 05:9808: 02        .byte $02, $02, $08,
    ; [DIRECTIVE] .BYTE $00, $A9, $02, $77, $10, $77, $02, $07, $18, $45, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015828 05:9818: 00        .byte $00, $A9, $02,
    ; [DIRECTIVE] .BYTE $13, $00, $02, $02, $67, $70, $02, $67, $D7, $70, $02, $67, $70, $02, $00, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015838 05:9828: 13        .byte $13, $00, $02,
    ; [DIRECTIVE] .BYTE $13, $13, $13, $13, $13, $13, $43, $92, $52, $F7, $62, $62, $62, $62, $62, $62  -- needs manual handling  ; orig: - D 0 - I - 0x015848 05:9838: 13        .byte $13, $13, $13,
    ; [DIRECTIVE] .BYTE $62, $62, $62, $62, $62, $62, $62, $62, $62, $62, $62, $F7, $62, $62, $62, $62  -- needs manual handling  ; orig: - D 0 - I - 0x015858 05:9848: 62        .byte $62, $62, $62,
    ; [DIRECTIVE] .BYTE $62, $62, $62, $48, $48, $48, $41, $18, $18, $17, $17, $17, $17, $14, $15, $15  -- needs manual handling  ; orig: - D 0 - I - 0x015868 05:9858: 62        .byte $62, $62, $62,
    ; [DIRECTIVE] .BYTE $15, $15, $17, $75, $17, $16, $16, $18, $18, $16, $16, $16, $16, $16, $16, $16  -- needs manual handling  ; orig: - - - - - - 0x015878 05:9868: 15        .byte $15, $15, $17,
    ; [DIRECTIVE] .BYTE $F0, $F1, $A9, $A2, $A3, $77, $02, $08, $08, $02, $77, $10, $02, $A8, $F0, $F1  -- needs manual handling  ; orig: - - - - - - 0x015888 05:9878: F0        .byte $F0, $F1, $A9,
    ; [DIRECTIVE] .BYTE $16, $76, $27, $76, $76, $76, $26, $76, $25, $76, $15, $14, $18, $18, $15, $15  -- needs manual handling  ; orig: - - - - - - 0x015898 05:9888: 16        .byte $16, $76, $27,
    ; [DIRECTIVE] .BYTE $00, $F1, $A2, $A3, $A2, $A3, $A0, $83, $06, $06, $A1, $A2, $A3, $A6, $01, $A7  -- needs manual handling  ; orig: - D 0 - I - 0x0158A8 05:9898: 00        .byte $00, $F1, $A2,
    ; [DIRECTIVE] .BYTE $16, $23, $25, $18, $25, $23, $26, $23, $23, $25, $23, $26, $18, $31, $23, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0158B8 05:98A8: 16        .byte $16, $23, $25,
    ; [DIRECTIVE] .BYTE $16, $28, $17, $17, $17, $49, $17, $17, $17, $17, $49, $17, $17, $17, $28, $15  -- needs manual handling  ; orig: - - - - - - 0x0158C8 05:98B8: 16        .byte $16, $28, $17,
    ; [DIRECTIVE] .BYTE $00, $00, $E6, $A1, $A2, $18, $18, $18, $18, $45, $12, $13, $12, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x0158D8 05:98C8: 00        .byte $00, $00, $E6,
    ; [DIRECTIVE] .BYTE $00, $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $83, $00  -- needs manual handling  ; orig: - D 0 - I - 0x0158E8 05:98D8: 00        .byte $00, $00, $04,
    ; [DIRECTIVE] .BYTE $15, $28, $17, $25, $17, $25, $17, $25, $17, $31, $76, $76, $16, $16, $16, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0158F8 05:98E8: 15        .byte $15, $28, $17,
    ; [DIRECTIVE] .BYTE $16, $16, $17, $17, $30, $57, $57, $74, $74, $57, $57, $57, $57, $57, $30, $30  -- needs manual handling  ; orig: - D 0 - I - 0x015908 05:98F8: 16        .byte $16, $16, $17,
    ; [DIRECTIVE] .BYTE $30, $30, $17, $17, $76, $76, $31, $18, $18, $76, $27, $76, $17, $76, $28, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015918 05:9908: 30        .byte $30, $30, $17,
    ; [DIRECTIVE] .BYTE $16, $16, $17, $76, $76, $26, $17, $23, $23, $46, $52, $48, $48, $52, $37, $37  -- needs manual handling  ; orig: - D 0 - I - 0x015928 05:9918: 16        .byte $16, $16, $17,
    ; [DIRECTIVE] .BYTE $37, $37, $52, $52, $86, $13, $13, $92, $D0, $52, $36, $52, $36, $52, $37, $37  -- needs manual handling  ; orig: - D 0 - I - 0x015938 05:9928: 37        .byte $37, $37, $52,
    ; [DIRECTIVE] .BYTE $37, $37, $37, $48, $48, $48, $41, $23, $23, $17, $31, $17, $25, $25, $17, $17  -- needs manual handling  ; orig: - D 0 - I - 0x015948 05:9938: 37        .byte $37, $37, $37,
    ; [DIRECTIVE] .BYTE $17, $17, $17, $27, $17, $27, $17, $26, $17, $26, $17, $27, $17, $26, $17, $26  -- needs manual handling  ; orig: - D 0 - I - 0x015958 05:9948: 17        .byte $17, $17, $17,
    ; [DIRECTIVE] .BYTE $26, $17, $26, $76, $27, $76, $26, $18, $18, $26, $76, $26, $76, $27, $76, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015968 05:9958: 26        .byte $26, $17, $26,
    ; [DIRECTIVE] .BYTE $16, $16, $16, $16, $16, $16, $16, $18, $18, $63, $42, $42, $42, $42, $42, $42  -- needs manual handling  ; orig: - - - - - - 0x015978 05:9968: 16        .byte $16, $16, $16,
    ; [DIRECTIVE] .BYTE $42, $42, $42, $61, $61, $61, $60, $76, $76, $76, $76, $17, $17, $25, $76, $17  -- needs manual handling  ; orig: - - - - - - 0x015988 05:9978: 42        .byte $42, $42, $42,
    ; [DIRECTIVE] .BYTE $17, $18, $31, $18, $18, $18, $25, $18, $25, $18, $26, $17, $18, $23, $17, $30  -- needs manual handling  ; orig: - D 0 - I - 0x015998 05:9988: 17        .byte $17, $18, $31,
    ; [DIRECTIVE] .BYTE $30, $30, $30, $30, $57, $29, $29, $29, $29, $29, $29, $29, $76, $16, $16, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0159A8 05:9998: 30        .byte $30, $30, $30,
    ; [DIRECTIVE] .BYTE $16, $16, $16, $18, $16, $16, $16, $16, $16, $16, $16, $16, $18, $16, $16, $16  -- needs manual handling  ; orig: - D 0 - I - 0x0159B8 05:99A8: 16        .byte $16, $16, $16,
    ; [DIRECTIVE] .BYTE $F1, $A9, $02, $02, $77, $A2, $A3, $10, $A8, $F0, $F1, $A9, $77, $02, $A8, $00  -- needs manual handling  ; orig: - - - - - - 0x0159C8 05:99B8: F1        .byte $F1, $A9, $02,
    ; [DIRECTIVE] .BYTE $15, $15, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $28, $16  -- needs manual handling  ; orig: - - - - - - 0x0159D8 05:99C8: 15        .byte $15, $15, $23,
    ; [DIRECTIVE] .BYTE $16, $16, $16, $16, $16, $16, $16, $16, $16, $16, $18, $18, $16, $16, $16, $16  -- needs manual handling  ; orig: - - - - - - 0x0159E8 05:99D8: 16        .byte $16, $16, $16,
    ; [DIRECTIVE] .BYTE $16, $16, $16, $16, $16, $19, $18, $76, $14, $19, $19, $19, $19, $19, $28, $28  -- needs manual handling  ; orig: - D 0 - I - 0x0159F8 05:99E8: 16        .byte $16, $16, $16,
    ; [DIRECTIVE] .BYTE $28, $28, $17, $26, $23, $23, $31, $18, $18, $18, $26, $18, $27, $18, $28, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015A08 05:99F8: 28        .byte $28, $28, $17,
    ; [DIRECTIVE] .BYTE $F0, $F1, $A9, $08, $08, $A4, $77, $10, $A5, $08, $08, $A4, $A5, $08, $A4, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015A18 05:9A08: F0        .byte $F0, $F1, $A9,
    ; [DIRECTIVE] .BYTE $02, $A5, $08, $E3, $18, $12, $12, $08, $08, $08, $33, $08, $32, $08, $A4, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015A28 05:9A18: 02        .byte $02, $A5, $08,
    ; [DIRECTIVE] .BYTE $02, $02, $02, $33, $33, $33, $33, $10, $32, $32, $32, $E8, $07, $07, $A8, $F0  -- needs manual handling  ; orig: - D 0 - I - 0x015A38 05:9A28: 02        .byte $02, $02, $02,
    ; [DIRECTIVE] .BYTE $F1, $A9, $02, $33, $02, $33, $02, $D3, $07, $A8, $A9, $02, $33, $02, $A8, $F0  -- needs manual handling  ; orig: - D 0 - I - 0x015A48 05:9A38: F1        .byte $F1, $A9, $02,
    ; [DIRECTIVE] .BYTE $F1, $A9, $31, $18, $26, $18, $27, $18, $18, $26, $18, $27, $18, $26, $18, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015A58 05:9A48: F1        .byte $F1, $A9, $31,
    ; [DIRECTIVE] .BYTE $16, $28, $25, $17, $17, $26, $17, $23, $23, $40, $48, $48, $48, $48, $48, $48  -- needs manual handling  ; orig: - D 0 - I - 0x015A68 05:9A58: 16        .byte $16, $28, $25,
    ; [DIRECTIVE] .BYTE $48, $48, $48, $48, $48, $48, $41, $23, $23, $23, $23, $17, $31, $17, $23, $17  -- needs manual handling  ; orig: - D 0 - I - 0x015A78 05:9A68: 48        .byte $48, $48, $48,
    ; [DIRECTIVE] .BYTE $17, $23, $25, $23, $23, $23, $25, $23, $31, $23, $26, $76, $18, $76, $28, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015A88 05:9A78: 17        .byte $17, $23, $25,
    ; [DIRECTIVE] .BYTE $16, $16, $16, $16, $19, $14, $28, $17, $17, $17, $17, $17, $23, $30, $30, $30  -- needs manual handling  ; orig: - D 0 - I - 0x015A98 05:9A88: 16        .byte $16, $16, $16,
    ; [DIRECTIVE] .BYTE $30, $30, $17, $23, $29, $29, $29, $29, $29, $29, $14, $29, $19, $16, $16, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015AA8 05:9A98: 30        .byte $30, $30, $17,
    ; [DIRECTIVE] .BYTE $16, $28, $17, $26, $26, $26, $17, $27, $27, $17, $25, $25, $25, $25, $17, $17  -- needs manual handling  ; orig: - D 0 - I - 0x015AB8 05:9AA8: 16        .byte $16, $28, $17,
    ; [DIRECTIVE] .BYTE $A3, $02, $02, $10, $A2, $18, $18, $18, $18, $45, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - D 0 - I - 0x015AC8 05:9AB8: A3        .byte $A3, $02, $02,
    ; [DIRECTIVE] .BYTE $00, $A7, $F1, $A9, $02, $64, $F2, $F3, $64, $F2, $F3, $10, $02, $02, $02, $02  -- needs manual handling  ; orig: - - - - - - 0x015AD8 05:9AC8: 00        .byte $00, $A7, $F1,
    ; [DIRECTIVE] .BYTE $02, $02, $02, $A5, $A4, $D2, $02, $02, $02, $A5, $08, $08, $A4, $A8, $F0, $F1  -- needs manual handling  ; orig: - - - - - - 0x015AE8 05:9AD8: 02        .byte $02, $02, $02,
    ; [DIRECTIVE] .BYTE $16, $16, $F4, $F4, $F4, $F4, $74, $74, $30, $30, $30, $30, $30, $30, $30, $30  -- needs manual handling  ; orig: - - - - - - 0x015AF8 05:9AE8: 16        .byte $16, $16, $F4,
    ; [DIRECTIVE] .BYTE $30, $30, $30, $30, $30, $30, $30, $23, $23, $23, $27, $23, $17, $23, $28, $16  -- needs manual handling  ; orig: - D 0 - I - 0x015B08 05:9AF8: 30        .byte $30, $30, $30,
    ; [DIRECTIVE] .BYTE $F1, $A9, $02, $02, $B7, $02, $B7, $67, $F5, $70, $B7, $02, $B7, $02, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015B18 05:9B08: F1        .byte $F1, $A9, $02,
    ; [DIRECTIVE] .BYTE $00, $A9, $10, $C0, $E3, $13, $13, $A3, $33, $02, $32, $02, $33, $02, $02, $02  -- needs manual handling  ; orig: - D 0 - I - 0x015B28 05:9B18: 00        .byte $00, $A9, $10,
    ; [DIRECTIVE] .BYTE $02, $02, $34, $02, $02, $34, $D2, $02, $33, $02, $32, $A5, $08, $08, $F0, $A6  -- needs manual handling  ; orig: - D 0 - I - 0x015B38 05:9B28: 02        .byte $02, $02, $34,
    ; [DIRECTIVE] .BYTE $01, $A7, $84, $90, $10, $02, $A5, $08, $08, $A0, $06, $06, $06, $06, $01, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015B48 05:9B38: 01        .byte $01, $A7, $84,
    ; [DIRECTIVE] .BYTE $A7, $F1, $25, $23, $31, $23, $26, $23, $23, $26, $23, $26, $23, $26, $23, $17  -- needs manual handling  ; orig: - D 0 - I - 0x015B58 05:9B48: A7        .byte $A7, $F1, $25,
    ; [DIRECTIVE] .BYTE $A3, $C8, $C7, $A0, $E7, $E6, $A2, $A3, $71, $32, $34, $02, $A8, $A6, $01, $01  -- needs manual handling  ; orig: - D 0 - I - 0x015B68 05:9B58: A3        .byte $A3, $C8, $C7,
    ; [DIRECTIVE] .BYTE $01, $A7, $A6, $01, $A7, $F1, $A9, $39, $47, $85, $47, $58, $58, $58, $47, $47  -- needs manual handling  ; orig: - D 0 - I - 0x015B78 05:9B68: 01        .byte $01, $A7, $A6,
    ; [DIRECTIVE] .BYTE $47, $47, $47, $47, $47, $47, $85, $47, $47, $47, $47, $47, $47, $47, $47, $47  -- needs manual handling  ; orig: - - - - - - 0x015B88 05:9B78: 47        .byte $47, $47, $47,
    ; [DIRECTIVE] .BYTE $47, $47, $91, $51, $97, $91, $51, $51, $51, $97, $91, $51, $97, $91, $97, $91  -- needs manual handling  ; orig: - - - - - - 0x015B98 05:9B88: 47        .byte $47, $47, $91,
    ; [DIRECTIVE] .BYTE $97, $91, $51, $51, $97, $58, $58, $58, $F6, $E0, $13, $13, $13, $13, $13, $13  -- needs manual handling  ; orig: - - - - - - 0x015BA8 05:9B98: 97        .byte $97, $91, $51,
off_9BA8_00_normal_cave:  ; orig: off_9BA8_00_normal_cave:
    ; [DIRECTIVE] .BYTE $00, $00, $95, $95, $95, $95, $95, $C2, $C2, $95, $95, $95, $95, $95, $00, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015BB8 05:9BA8: 00        .byte $00, $00, $95,
off_9BB8_02_cave_with_3_teleports:  ; orig: off_9BB8_02_cave_with_3_teleports:
    ; [DIRECTIVE] .BYTE $00, $00, $95, $95, $95, $F8, $95, $C2, $F8, $95, $95, $F8, $95, $95, $00, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015BC8 05:9BB8: 00        .byte $00, $00, $95,
    ; [DIRECTIVE] .BYTE $00, $A9, $64, $66, $02, $53, $54, $D1, $54, $54, $56, $02, $64, $66, $A8, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015BD8 05:9BC8: 00        .byte $00, $A9, $64,



tbl_9BD8_overworld:  ; orig: tbl_9BD8_overworld:
_off006_0x015BE8_00:  ; orig: _off006_0x015BE8_00:
    ; [DIRECTIVE] .BYTE $DB, $5B, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015BE8 05:9BD8: DB        .byte $DB, $5B, $5B 
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $0E, $1A, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015BEB 05:9BDB: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015BF1 05:9BE1: DB        .byte $DB, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $4E, $32, $1B, $34, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015BF8 05:9BE8: DB        .byte $DB, $4E, $32,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015C00 05:9BF0: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $0E, $32, $5B, $1B, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C06 05:9BF6: DB        .byte $DB, $0E, $32,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C0E 05:9BFE: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB  -- needs manual handling  ; orig: - D 0 - I - 0x015C15 05:9C05: DB        .byte $DB   ; 07
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C15 05:9C05: DB        .byte $CE, $4E, $4E,



_off006_0x015C1D_10:  ; orig: _off006_0x015C1D_10:
    ; [DIRECTIVE] .BYTE $9B, $0C, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C1D 05:9C0D: 9B        .byte $9B, $0C, $4E,
    ; [DIRECTIVE] .BYTE $CA, $4E, $0E, $4E, $4E, $4A  -- needs manual handling  ; orig: - D 0 - I - 0x015C25 05:9C15: CA        .byte $CA, $4E, $0E,
    ; [DIRECTIVE] .BYTE $C5, $45, $05, $0B  -- needs manual handling  ; orig: - D 0 - I - 0x015C2B 05:9C1B: C5        .byte $C5, $45, $05,
    ; [DIRECTIVE] .BYTE $C5, $45, $05, $45, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015C2F 05:9C1F: C5        .byte $C5, $45, $05,
    ; [DIRECTIVE] .BYTE $D9, $28, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C35 05:9C25: D9        .byte $D9, $28, $59 
    ; [DIRECTIVE] .BYTE $D9, $59, $59, $19  -- needs manual handling  ; orig: - D 0 - I - 0x015C38 05:9C28: D9        .byte $D9, $59, $59,
    ; [DIRECTIVE] .BYTE $D9, $59, $4E, $0E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C3C 05:9C2C: D9        .byte $D9, $59, $4E,
    ; [DIRECTIVE] .BYTE $D9, $4E, $4E, $4E, $0E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C41 05:9C31: D9        .byte $D9, $4E, $4E,
    ; [DIRECTIVE] .BYTE $8E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015C47 05:9C37: 8E        .byte $8E, $4E, $4E 
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015C4A 05:9C3A: CE        .byte $CE, $4E, $4E,



_off006_0x015C4E_20:  ; orig: _off006_0x015C4E_20:
    ; [DIRECTIVE] .BYTE $D9, $59, $0E, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015C4E 05:9C3E: D9        .byte $D9, $59, $0E,
    ; [DIRECTIVE] .BYTE $DB, $0E, $5B, $5B, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C54 05:9C44: DB        .byte $DB, $0E, $5B,
    ; [DIRECTIVE] .BYTE $DB, $0E, $33, $5B, $1B, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C5B 05:9C4B: DB        .byte $DB, $0E, $33,
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $4E, $0E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C63 05:9C53: CE        .byte $CE, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $4E, $33, $1B, $35, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C69 05:9C59: DB        .byte $DB, $4E, $33,
    ; [DIRECTIVE] .BYTE $D9, $4E, $19, $0E, $19, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015C71 05:9C61: D9        .byte $D9, $4E, $19,
    ; [DIRECTIVE] .BYTE $D9, $0E, $19, $0E, $19, $0E, $19, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015C77 05:9C67: D9        .byte $D9, $0E, $19,
    ; [DIRECTIVE] .BYTE $D9, $4E, $0E, $19, $0E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015C7F 05:9C6F: D9        .byte $D9, $4E, $0E,
    ; [DIRECTIVE] .BYTE $D9, $19, $4E, $4E, $0E, $19  -- needs manual handling  ; orig: - D 0 - I - 0x015C85 05:9C75: D9        .byte $D9, $19, $4E,
    ; [DIRECTIVE] .BYTE $D9, $0E, $59, $59, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C8B 05:9C7B: D9        .byte $D9, $0E, $59,



_off006_0x015C90_30:  ; orig: _off006_0x015C90_30:
    ; [DIRECTIVE] .BYTE $D9, $0E, $59, $59, $19, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015C90 05:9C80: D9        .byte $D9, $0E, $59,
    ; [DIRECTIVE] .BYTE $D9, $4E, $19, $0E, $28, $4E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015C96 05:9C86: D9        .byte $D9, $4E, $19,
    ; [DIRECTIVE] .BYTE $DB, $4E, $13, $0E, $13, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015C9D 05:9C8D: DB        .byte $DB, $4E, $13,
    ; [DIRECTIVE] .BYTE $DB, $0E, $13, $0E, $13, $0E, $13, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015CA5 05:9C95: DB        .byte $DB, $0E, $13,
    ; [DIRECTIVE] .BYTE $DB, $4E, $0E, $13, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015CAF 05:9C9F: DB        .byte $DB, $4E, $0E,
    ; [DIRECTIVE] .BYTE $C8, $48, $17, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015CB7 05:9CA7: C8        .byte $C8, $48, $17,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015CBE 05:9CAE: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $0E, $1A  -- needs manual handling  ; orig: - D 0 - I - 0x015CC5 05:9CB5: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $4E, $4E, $4A  -- needs manual handling  ; orig: - D 0 - I - 0x015CCA 05:9CBA: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $15  -- needs manual handling  ; orig: - D 0 - I - 0x015CD0 05:9CC0: DB        .byte $DB, $4E, $4E,



_off006_0x015CD4_40:  ; orig: _off006_0x015CD4_40:
    ; [DIRECTIVE] .BYTE $C8, $48, $17, $4E, $4E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015CD4 05:9CC4: C8        .byte $C8, $48, $17,
    ; [DIRECTIVE] .BYTE $C9, $49, $18, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015CDA 05:9CCA: C9        .byte $C9, $49, $18,
    ; [DIRECTIVE] .BYTE $D9, $59, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015CDF 05:9CCF: D9        .byte $D9, $59, $4E,
    ; [DIRECTIVE] .BYTE $C5, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015CE3 05:9CD3: C5        .byte $C5, $45, $45 
    ; [DIRECTIVE] .BYTE $C9, $49, $09, $0B, $49, $49, $09  -- needs manual handling  ; orig: - D 0 - I - 0x015CE6 05:9CD6: C9        .byte $C9, $49, $09,
    ; [DIRECTIVE] .BYTE $C8, $48, $08, $48  -- needs manual handling  ; orig: - D 0 - I - 0x015CED 05:9CDD: C8        .byte $C8, $48, $08,
    ; [DIRECTIVE] .BYTE $C8, $48, $17, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015CF1 05:9CE1: C8        .byte $C8, $48, $17,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015CF7 05:9CE7: DB        .byte $DB, $4E, $4E,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015CFB 05:9CEB: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $D9, $4E, $2C, $4E, $4E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015D00 05:9CF0: D9        .byte $D9, $4E, $2C,



_off006_0x015D06_50:  ; orig: _off006_0x015D06_50:
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $0E, $4A, $4A, $0A  -- needs manual handling  ; orig: - D 0 - I - 0x015D06 05:9CF6: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $5B, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015D0D 05:9CFD: DB        .byte $DB, $5B, $4E,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015D11 05:9D01: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $DB, $0E, $15, $48, $17, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D17 05:9D07: DB        .byte $DB, $0E, $15,
    ; [DIRECTIVE] .BYTE $DB, $0E, $06, $45, $07, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D1F 05:9D0F: DB        .byte $DB, $0E, $06,
    ; [DIRECTIVE] .BYTE $DB, $0E, $06, $05, $45, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015D27 05:9D17: DB        .byte $DB, $0E, $06,
    ; [DIRECTIVE] .BYTE $DB, $0E, $16, $49, $18, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D2E 05:9D1E: DB        .byte $DB, $0E, $16,
    ; [DIRECTIVE] .BYTE $D9, $0E, $59, $59, $19, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015D36 05:9D26: D9        .byte $D9, $0E, $59,
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $06, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015D3C 05:9D2C: CE        .byte $CE, $4E, $4E,



_off006_0x015D42_60:  ; orig: _off006_0x015D42_60:
    ; [DIRECTIVE] .BYTE $D9, $4E, $4E, $16, $49, $49  -- needs manual handling  ; orig: - D 0 - I - 0x015D42 05:9D32: D9        .byte $D9, $4E, $4E,
    ; [DIRECTIVE] .BYTE $D9, $4E, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015D48 05:9D38: D9        .byte $D9, $4E, $4E,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015D4C 05:9D3C: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $D9, $59, $4E, $15, $48, $48  -- needs manual handling  ; orig: - D 0 - I - 0x015D50 05:9D40: D9        .byte $D9, $59, $4E,
    ; [DIRECTIVE] .BYTE $DB, $0E, $1C, $1F, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D56 05:9D46: DB        .byte $DB, $0E, $1C,
    ; [DIRECTIVE] .BYTE $DB, $0E, $1D, $0C, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D5E 05:9D4E: DB        .byte $DB, $0E, $1D,
    ; [DIRECTIVE] .BYTE $DB, $0E, $1E, $20, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D66 05:9D56: DB        .byte $DB, $0E, $1E,
    ; [DIRECTIVE] .BYTE $DB, $0E, $21, $24, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D6E 05:9D5E: DB        .byte $DB, $0E, $21,
    ; [DIRECTIVE] .BYTE $DB, $0E, $22, $0C, $4E, $4E, $4A  -- needs manual handling  ; orig: - D 0 - I - 0x015D76 05:9D66: DB        .byte $DB, $0E, $22,



_off006_0x015D7D_70:  ; orig: _off006_0x015D7D_70:
    ; [DIRECTIVE] .BYTE $DB, $0E, $23, $25, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D7D 05:9D6D: DB        .byte $DB, $0E, $23,
    ; [DIRECTIVE] .BYTE $DB, $4E, $0E, $26, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D85 05:9D75: DB        .byte $DB, $4E, $0E,
    ; [DIRECTIVE] .BYTE $DB, $5B, $07, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D8D 05:9D7D: DB        .byte $DB, $5B, $07,
    ; [DIRECTIVE] .BYTE $DB, $5B, $07, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015D93 05:9D83: DB        .byte $DB, $5B, $07,
    ; [DIRECTIVE] .BYTE $CE, $0E, $59, $59, $19, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015D9A 05:9D8A: CE        .byte $CE, $0E, $59,
    ; [DIRECTIVE] .BYTE $D9, $4E, $0E, $26, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015DA0 05:9D90: D9        .byte $D9, $4E, $0E,
    ; [DIRECTIVE] .BYTE $D9, $4E, $4E, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015DA6 05:9D96: D9        .byte $D9, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $4E, $19, $0E, $19, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015DAC 05:9D9C: DB        .byte $DB, $4E, $19,
    ; [DIRECTIVE] .BYTE $DB, $5B, $5B, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015DB4 05:9DA4: DB        .byte $DB, $5B, $5B,



_off006_0x015DB8_80:  ; orig: _off006_0x015DB8_80:
    ; [DIRECTIVE] .BYTE $C5, $05, $5B, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015DB8 05:9DA8: C5        .byte $C5, $05, $5B,
    ; [DIRECTIVE] .BYTE $DB, $5B, $27, $0E, $1A, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015DBC 05:9DAC: DB        .byte $DB, $5B, $27,
    ; [DIRECTIVE] .BYTE $DB, $0E, $14, $0E, $14, $0E, $14, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015DC2 05:9DB2: DB        .byte $DB, $0E, $14,
    ; [DIRECTIVE] .BYTE $CA, $4A, $0A, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015DCB 05:9DBB: CA        .byte $CA, $4A, $0A,
    ; [DIRECTIVE] .BYTE $DB, $1B, $35, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015DD2 05:9DC2: DB        .byte $DB, $1B, $35,
    ; [DIRECTIVE] .BYTE $9B, $27, $4E, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015DDA 05:9DCA: 9B        .byte $9B, $27, $4E,
    ; [DIRECTIVE] .BYTE $C5, $45, $05, $2F, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015DDF 05:9DCF: C5        .byte $C5, $45, $05,
    ; [DIRECTIVE] .BYTE $DB, $0E, $22, $0C, $4E, $4E, $4A  -- needs manual handling  ; orig: - D 0 - I - 0x015DE6 05:9DD6: DB        .byte $DB, $0E, $22,
    ; [DIRECTIVE] .BYTE $DB, $0E, $14, $0E, $29, $0E, $14, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015DED 05:9DDD: DB        .byte $DB, $0E, $14,



_off006_0x015DF6_90:  ; orig: _off006_0x015DF6_90:
    ; [DIRECTIVE] .BYTE $DB, $35, $4E, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015DF6 05:9DE6: DB        .byte $DB, $35, $4E,
    ; [DIRECTIVE] .BYTE $DB, $1B, $34, $4E, $06  -- needs manual handling  ; orig: - D 0 - I - 0x015DFD 05:9DED: DB        .byte $DB, $1B, $34,
    ; [DIRECTIVE] .BYTE $C5, $45, $05, $2E, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015E02 05:9DF2: C5        .byte $C5, $45, $05,
    ; [DIRECTIVE] .BYTE $CE, $0E, $14, $0E, $14, $0E, $14, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E09 05:9DF9: CE        .byte $CE, $0E, $14,
    ; [DIRECTIVE] .BYTE $CE, $0E, $14, $0E, $14, $0E, $14, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015E13 05:9E03: CE        .byte $CE, $0E, $14,
    ; [DIRECTIVE] .BYTE $DB, $4D, $4D, $4D, $0D, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E1C 05:9E0C: DB        .byte $DB, $4D, $4D,
    ; [DIRECTIVE] .BYTE $C5, $05, $1B, $0C, $4E, $0E, $4A, $0A  -- needs manual handling  ; orig: - D 0 - I - 0x015E23 05:9E13: C5        .byte $C5, $05, $1B,
    ; [DIRECTIVE] .BYTE $DB, $1B, $35, $4E, $06, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015E2B 05:9E1B: DB        .byte $DB, $1B, $35,
    ; [DIRECTIVE] .BYTE $C5, $4E, $4E, $4E, $0E, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015E31 05:9E21: C5        .byte $C5, $4E, $4E,



_off006_0x015E37_A0:  ; orig: _off006_0x015E37_A0:
    ; [DIRECTIVE] .BYTE $DB, $5B, $34, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E37 05:9E27: DB        .byte $DB, $5B, $34,
    ; [DIRECTIVE] .BYTE $DB, $5B, $35, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E3E 05:9E2E: DB        .byte $DB, $5B, $35,
    ; [DIRECTIVE] .BYTE $9B, $35, $4E, $4E, $4E, $0E, $33, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E45 05:9E35: 9B        .byte $9B, $35, $4E,
    ; [DIRECTIVE] .BYTE $9B, $34, $4E, $4E, $4E, $0E, $32, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E4D 05:9E3D: 9B        .byte $9B, $34, $4E,
    ; [DIRECTIVE] .BYTE $9B, $34, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E55 05:9E45: 9B        .byte $9B, $34, $4E,
    ; [DIRECTIVE] .BYTE $9B, $35, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E5D 05:9E4D: 9B        .byte $9B, $35, $4E,
    ; [DIRECTIVE] .BYTE $DB, $5B, $34, $0E, $32  -- needs manual handling  ; orig: - D 0 - I - 0x015E65 05:9E55: DB        .byte $DB, $5B, $34,
    ; [DIRECTIVE] .BYTE $DB, $5B, $35, $0E, $33, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015E6A 05:9E5A: DB        .byte $DB, $5B, $35,
    ; [DIRECTIVE] .BYTE $DB, $34, $4E, $4E, $0E, $32  -- needs manual handling  ; orig: - D 0 - I - 0x015E70 05:9E60: DB        .byte $DB, $34, $4E,
    ; [DIRECTIVE] .BYTE $DB, $35, $4E, $4E, $0E, $33  -- needs manual handling  ; orig: - D 0 - I - 0x015E76 05:9E66: DB        .byte $DB, $35, $4E,



_off006_0x015E7C_B0:  ; orig: _off006_0x015E7C_B0:
    ; [DIRECTIVE] .BYTE $DB, $5B, $07, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015E7C 05:9E6C: DB        .byte $DB, $5B, $07,
    ; [DIRECTIVE] .BYTE $DB, $0E, $06, $05, $45, $2F, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E82 05:9E72: DB        .byte $DB, $0E, $06,
    ; [DIRECTIVE] .BYTE $DB, $0E, $06, $05, $45, $2E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015E8B 05:9E7B: DB        .byte $DB, $0E, $06,
    ; [DIRECTIVE] .BYTE $CA, $4A, $0A, $0E, $1A  -- needs manual handling  ; orig: - D 0 - I - 0x015E94 05:9E84: CA        .byte $CA, $4A, $0A,
    ; [DIRECTIVE] .BYTE $DB, $5B, $15, $45, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015E99 05:9E89: DB        .byte $DB, $5B, $15,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015E9F 05:9E8F: DB        .byte $DB, $4E, $4E,
    ; [DIRECTIVE] .BYTE $CA, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EA4 05:9E94: CA        .byte $CA, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $4E, $2C, $0E, $2C, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EAB 05:9E9B: DB        .byte $DB, $4E, $2C,
    ; [DIRECTIVE] .BYTE $CA, $4A, $4E, $06, $45, $45  -- needs manual handling  ; orig: - D 0 - I - 0x015EB3 05:9EA3: CA        .byte $CA, $4A, $4E,



_off006_0x015EB9_C0:  ; orig: _off006_0x015EB9_C0:
    ; [DIRECTIVE] .BYTE $9B, $35, $4E, $0E, $13, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EB9 05:9EA9: 9B        .byte $9B, $35, $4E,
    ; [DIRECTIVE] .BYTE $F6, $76, $0F, $4E, $1A, $1B, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015EC2 05:9EB2: F6        .byte $F6, $76, $0F,
    ; [DIRECTIVE] .BYTE $DB, $4D, $4D, $4D, $4D, $0D  -- needs manual handling  ; orig: - D 0 - I - 0x015EC9 05:9EB9: DB        .byte $DB, $4D, $4D,
    ; [DIRECTIVE] .BYTE $CE, $4E, $0E, $30, $45, $45, $05  -- needs manual handling  ; orig: - D 0 - I - 0x015ECF 05:9EBF: CE        .byte $CE, $4E, $0E,
    ; [DIRECTIVE] .BYTE $DB  -- needs manual handling  ; orig: - D 0 - I - 0x015ED6 05:9EC6: DB        .byte $DB   ; C4
    ; [DIRECTIVE] .BYTE $F7  -- needs manual handling  ; orig: - D 0 - I - 0x015ED7 05:9EC7: F7        .byte $F7   ; C5
    ; [DIRECTIVE] .BYTE $F7, $77, $77, $37, $77, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015ED8 05:9EC8: F7        .byte $F7, $77, $77,
    ; [DIRECTIVE] .BYTE $DB, $1B, $34, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EDF 05:9ECF: DB        .byte $DB, $1B, $34,
    ; [DIRECTIVE] .BYTE $DB, $34, $0E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EE7 05:9ED7: DB        .byte $DB, $34, $0E,



_off006_0x015EEF_D0:  ; orig: _off006_0x015EEF_D0:
    ; [DIRECTIVE] .BYTE $C5, $45, $0B, $4E, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015EEF 05:9EDF: C5        .byte $C5, $45, $0B,
    ; [DIRECTIVE] .BYTE $DB, $0E, $06, $45, $07, $4E, $4E  -- needs manual handling  ; orig: - D 0 - I - 0x015EF5 05:9EE5: DB        .byte $DB, $0E, $06,
    ; [DIRECTIVE] .BYTE $9B, $27, $4E, $4E, $4E, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015EFC 05:9EEC: 9B        .byte $9B, $27, $4E,
    ; [DIRECTIVE] .BYTE $9B, $27, $4E, $4E, $4E, $4E, $0E  -- needs manual handling  ; orig: - D 0 - I - 0x015F04 05:9EF4: 9B        .byte $9B, $27, $4E,
    ; [DIRECTIVE] .BYTE $DB, $1B, $27, $07, $4E, $1A, $5B, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F0B 05:9EFB: DB        .byte $DB, $1B, $27,
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $4E, $33, $5B  -- needs manual handling  ; orig: - D 0 - I - 0x015F13 05:9F03: CE        .byte $CE, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $0E, $15, $48, $48  -- needs manual handling  ; orig: - D 0 - I - 0x015F19 05:9F09: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $0E, $2D, $0C, $4E, $4E, $4A  -- needs manual handling  ; orig: - D 0 - I - 0x015F20 05:9F10: DB        .byte $DB, $0E, $2D,
    ; [DIRECTIVE] .BYTE $DB, $0E, $1C, $1F, $0E, $1E, $20, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F27 05:9F17: DB        .byte $DB, $0E, $1C,



_off006_0x015F31_E0:  ; orig: _off006_0x015F31_E0:
    ; [DIRECTIVE] .BYTE $C8, $48, $08  -- needs manual handling  ; orig: - D 0 - I - 0x015F31 05:9F21: C8        .byte $C8, $48, $08 
    ; [DIRECTIVE] .BYTE $C5, $45, $45, $08, $48, $48  -- needs manual handling  ; orig: - D 0 - I - 0x015F34 05:9F24: C5        .byte $C5, $45, $45,
    ; [DIRECTIVE] .BYTE $DB, $35  -- needs manual handling  ; orig: - D 0 - I - 0x015F3A 05:9F2A: DB        .byte $DB, $35   ; E
    ; [DIRECTIVE] .BYTE $CE, $4E, $4E, $4E, $0E, $33, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F3C 05:9F2C: CE        .byte $CE, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $0E, $33, $5B, $27, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F43 05:9F33: DB        .byte $DB, $0E, $33,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $1C, $1F, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F4B 05:9F3B: DB        .byte $DB, $4E, $4E,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $35, $4E, $33  -- needs manual handling  ; orig: - D 0 - I - 0x015F53 05:9F43: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $5B, $1B, $34, $4E, $32  -- needs manual handling  ; orig: - D 0 - I - 0x015F59 05:9F49: DB        .byte $DB, $5B, $1B,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $4E, $0E, $33  -- needs manual handling  ; orig: - D 0 - I - 0x015F5F 05:9F4F: DB        .byte $DB, $4E, $4E,



_off006_0x015F65_F0:  ; orig: _off006_0x015F65_F0:
    ; [DIRECTIVE] .BYTE $9B, $5B, $34, $4E, $0E, $32  -- needs manual handling  ; orig: - D 0 - I - 0x015F65 05:9F55: 9B        .byte $9B, $5B, $34,
    ; [DIRECTIVE] .BYTE $DB, $1B, $35, $4E, $0E, $33, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F6B 05:9F5B: DB        .byte $DB, $1B, $35,
    ; [DIRECTIVE] .BYTE $DB, $0E, $1E, $20, $0E, $1C, $1F, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F72 05:9F62: DB        .byte $DB, $0E, $1E,
    ; [DIRECTIVE] .BYTE $DB, $4E, $4E, $1E, $20, $0E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F7C 05:9F6C: DB        .byte $DB, $4E, $4E,
    ; [DIRECTIVE] .BYTE $D9, $59, $19, $4E, $4E, $59  -- needs manual handling  ; orig: - D 0 - I - 0x015F84 05:9F74: D9        .byte $D9, $59, $19,
    ; [DIRECTIVE] .BYTE $DB, $0E, $2D, $0C, $4E, $4E, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F8A 05:9F7A: DB        .byte $DB, $0E, $2D,
    ; [DIRECTIVE] .BYTE $CE, $4E, $0E, $31, $05  -- needs manual handling  ; orig: - D 0 - I - 0x015F92 05:9F82: CE        .byte $CE, $4E, $0E,
    ; [DIRECTIVE] .BYTE $C5, $45, $07, $4E, $28, $59, $19  -- needs manual handling  ; orig: - D 0 - I - 0x015F97 05:9F87: C5        .byte $C5, $45, $07,
    ; [DIRECTIVE] .BYTE $DB, $4D, $4D, $12, $4D, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015F9E 05:9F8E: DB        .byte $DB, $4D, $4D,
    ; [DIRECTIVE] .BYTE $DB, $77, $77, $77, $37, $1A, $1B  -- needs manual handling  ; orig: - D 0 - I - 0x015FA5 05:9F95: DB        .byte $DB, $77, $77,



tbl_9F9C:  ; orig: tbl_9F9C:

; bzk optimize
    ; [DIRECTIVE] .WORD tbl_9418  -- needs manual handling  ; orig: - D 0 - - - 0x015FAC 05:9F9C: 18 94     .word tbl_9418



tbl_9F9E_overworld:  ; orig: tbl_9F9E_overworld:

; bzk optimize
    ; [DIRECTIVE] .WORD tbl_9BD8_overworld  -- needs manual handling  ; orig: - D 0 - - - 0x015FAE 05:9F9E: D8 9B     .word tbl_9BD8_overw



tbl_9FA0_tiles_id:
; 78 (4Eh) bytes

; bzk if you change size of this table, make changes to 0x0164A1 as well

;                                              00   01   02   03   04   05   06   07   08   09   0A   0B   0C   0D   0E   0F
    ; [DIRECTIVE] .BYTE $E0, $F5, $F5, $F5, $F5, $B8, $F5, $D4, $F5, $F5, $F5, $C4, $DE, $DE, $BC, $C8  -- needs manual handling  ; orig: - D 0 - I - 0x015FB0 05:9FA0: E0        .byte $E0, $F5, $F5,
    ; [DIRECTIVE] .BYTE $DE, $BC, $DE, $DE, $F5, $DC, $C4, $DE, $C8, $DE, $BC, $C8, $DE, $DE, $F5, $DC  -- needs manual handling  ; orig: - D 0 - I - 0x015FC0 05:9FB0: DE        .byte $DE, $BC, $DE,
    ; [DIRECTIVE] .BYTE $DC, $00, $C0, $D0, $DC, $00, $F5, $DC, $CC, $00, $F5, $DC, $DC, $00, $F5, $CC  -- needs manual handling  ; orig: - D 0 - I - 0x015FD0 05:9FC0: DC        .byte $DC, $00, $C0,
    ; [DIRECTIVE] .BYTE $D0, $00, $F5, $DC, $DC, $00, $C0, $D0, $DC, $00, $F5, $DC, $CC, $00, $F5, $DC  -- needs manual handling  ; orig: - D 0 - I - 0x015FE0 05:9FD0: D0        .byte $D0, $00, $F5,
    ; [DIRECTIVE] .BYTE $DC, $00, $D8, $CC, $D0, $00, $F5, $DC, $DC, $00, $F5, $DC, $DC, $00  -- needs manual handling  ; orig: - D 0 - I - 0x015FF0 05:9FE0: DC        .byte $DC, $00, $D8,



off_9FEE_00:  ; orig: off_9FEE_00:
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 0 - I - 0x015FFE 05:9FEE: 88        .byte $88   ; 00
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 0 - I - 0x015FFF 05:9FEF: 74        .byte $74   ; 01
    ; [DIRECTIVE] .BYTE $8A  -- needs manual handling  ; orig: - D 0 - I - 0x016000 05:9FF0: 8A        .byte $8A   ; 02
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x016001 05:9FF1: 24        .byte $24   ; 03
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x016002 05:9FF2: 87        .byte $87   ; 04
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x016003 05:9FF3: 87        .byte $87   ; 05
    ; [DIRECTIVE] .BYTE $75  -- needs manual handling  ; orig: - D 0 - I - 0x016004 05:9FF4: 75        .byte $75   ; 06
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 0 - I - 0x016005 05:9FF5: 89        .byte $89   ; 07
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - I - 0x016006 05:9FF6: 24        .byte $24   ; 08
    ; [DIRECTIVE] .BYTE $8B  -- needs manual handling  ; orig: - D 0 - I - 0x016007 05:9FF7: 8B        .byte $8B   ; 09
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x016008 05:9FF8: 87        .byte $87   ; 0A
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x016009 05:9FF9: 87        .byte $87   ; 0B
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 0 - I - 0x01600A 05:9FFA: 88        .byte $88   ; 0C
    ; [DIRECTIVE] .BYTE $A4  -- needs manual handling  ; orig: - D 0 - I - 0x01600B 05:9FFB: A4        .byte $A4   ; 0D
    ; [DIRECTIVE] .BYTE $8A  -- needs manual handling  ; orig: - D 0 - I - 0x01600C 05:9FFC: 8A        .byte $8A   ; 0E
    ; [DIRECTIVE] .BYTE $A6  -- needs manual handling  ; orig: - D 0 - I - 0x01600D 05:9FFD: A6        .byte $A6   ; 0F
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x01600E 05:9FFE: 87        .byte $87   ; 10
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 0 - I - 0x01600F 05:9FFF: 87        .byte $87   ; 11
    ; [DIRECTIVE] .BYTE $A5  -- needs manual handling  ; orig: - D 1 - I - 0x016010 05:A000: A5        .byte $A5   ; 12
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 1 - I - 0x016011 05:A001: 89        .byte $89   ; 13
    ; [DIRECTIVE] .BYTE $A7  -- needs manual handling  ; orig: - D 1 - I - 0x016012 05:A002: A7        .byte $A7   ; 14
    ; [DIRECTIVE] .BYTE $8B  -- needs manual handling  ; orig: - D 1 - I - 0x016013 05:A003: 8B        .byte $8B   ; 15
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x016014 05:A004: 87        .byte $87   ; 16
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x016015 05:A005: 87        .byte $87   ; 17
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 1 - I - 0x016016 05:A006: 88        .byte $88   ; 18
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x016017 05:A007: AC        .byte $AC   ; 19
    ; [DIRECTIVE] .BYTE $8A  -- needs manual handling  ; orig: - D 1 - I - 0x016018 05:A008: 8A        .byte $8A   ; 1A
    ; [DIRECTIVE] .BYTE $AE  -- needs manual handling  ; orig: - D 1 - I - 0x016019 05:A009: AE        .byte $AE   ; 1B
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x01601A 05:A00A: 87        .byte $87   ; 1C
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x01601B 05:A00B: 87        .byte $87   ; 1D
    ; [DIRECTIVE] .BYTE $AD  -- needs manual handling  ; orig: - D 1 - I - 0x01601C 05:A00C: AD        .byte $AD   ; 1E
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 1 - I - 0x01601D 05:A00D: 89        .byte $89   ; 1F
    ; [DIRECTIVE] .BYTE $AF  -- needs manual handling  ; orig: - D 1 - I - 0x01601E 05:A00E: AF        .byte $AF   ; 20
    ; [DIRECTIVE] .BYTE $8B  -- needs manual handling  ; orig: - D 1 - I - 0x01601F 05:A00F: 8B        .byte $8B   ; 21
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x016020 05:A010: 87        .byte $87   ; 22
    ; [DIRECTIVE] .BYTE $87  -- needs manual handling  ; orig: - D 1 - I - 0x016021 05:A011: 87        .byte $87   ; 23
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016022 05:A012: DF        .byte $DF   ; 24
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016023 05:A013: DF        .byte $DF   ; 25
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016024 05:A014: DF        .byte $DF   ; 26
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016025 05:A015: DF        .byte $DF   ; 27
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016026 05:A016: F5        .byte $F5   ; 28
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016027 05:A017: F5        .byte $F5   ; 29
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016028 05:A018: DF        .byte $DF   ; 2A
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016029 05:A019: DF        .byte $DF   ; 2B
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x01602A 05:A01A: DF        .byte $DF   ; 2C
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x01602B 05:A01B: DF        .byte $DF   ; 2D
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01602C 05:A01C: F5        .byte $F5   ; 2E
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01602D 05:A01D: F5        .byte $F5   ; 2F
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x01602E 05:A01E: DF        .byte $DF   ; 30
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x01602F 05:A01F: 24        .byte $24   ; 31
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016030 05:A020: DF        .byte $DF   ; 32
    ; [DIRECTIVE] .BYTE $92  -- needs manual handling  ; orig: - D 1 - I - 0x016031 05:A021: 92        .byte $92   ; 33
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016032 05:A022: F5        .byte $F5   ; 34
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016033 05:A023: F5        .byte $F5   ; 35
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x016034 05:A024: 24        .byte $24   ; 36
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016035 05:A025: DF        .byte $DF   ; 37
    ; [DIRECTIVE] .BYTE $93  -- needs manual handling  ; orig: - D 1 - I - 0x016036 05:A026: 93        .byte $93   ; 38
    ; [DIRECTIVE] .BYTE $DF  -- needs manual handling  ; orig: - D 1 - I - 0x016037 05:A027: DF        .byte $DF   ; 39
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016038 05:A028: F5        .byte $F5   ; 3A
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016039 05:A029: F5        .byte $F5   ; 3B



off_A02A_01:  ; orig: off_A02A_01:
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x01603A 05:A02A: 82        .byte $82   ; 00
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x01603B 05:A02B: 82        .byte $82   ; 01
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 1 - I - 0x01603C 05:A02C: 83        .byte $83   ; 02
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x01603D 05:A02D: 24        .byte $24   ; 03
    ; [DIRECTIVE] .BYTE $85  -- needs manual handling  ; orig: - D 1 - I - 0x01603E 05:A02E: 85        .byte $85   ; 04
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - I - 0x01603F 05:A02F: 76        .byte $76   ; 05
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016040 05:A030: 82        .byte $82   ; 06
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016041 05:A031: 82        .byte $82   ; 07
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x016042 05:A032: 24        .byte $24   ; 08
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - I - 0x016043 05:A033: 84        .byte $84   ; 09
    ; [DIRECTIVE] .BYTE $77  -- needs manual handling  ; orig: - D 1 - I - 0x016044 05:A034: 77        .byte $77   ; 0A
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 1 - I - 0x016045 05:A035: 86        .byte $86   ; 0B
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016046 05:A036: 82        .byte $82   ; 0C
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016047 05:A037: 82        .byte $82   ; 0D
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 1 - I - 0x016048 05:A038: 83        .byte $83   ; 0E
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - I - 0x016049 05:A039: A0        .byte $A0   ; 0F
    ; [DIRECTIVE] .BYTE $85  -- needs manual handling  ; orig: - D 1 - I - 0x01604A 05:A03A: 85        .byte $85   ; 10
    ; [DIRECTIVE] .BYTE $A2  -- needs manual handling  ; orig: - D 1 - I - 0x01604B 05:A03B: A2        .byte $A2   ; 11
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x01604C 05:A03C: 82        .byte $82   ; 12
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x01604D 05:A03D: 82        .byte $82   ; 13
    ; [DIRECTIVE] .BYTE $A1  -- needs manual handling  ; orig: - D 1 - I - 0x01604E 05:A03E: A1        .byte $A1   ; 14
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - I - 0x01604F 05:A03F: 84        .byte $84   ; 15
    ; [DIRECTIVE] .BYTE $A3  -- needs manual handling  ; orig: - D 1 - I - 0x016050 05:A040: A3        .byte $A3   ; 16
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 1 - I - 0x016051 05:A041: 86        .byte $86   ; 17
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016052 05:A042: 82        .byte $82   ; 18
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016053 05:A043: 82        .byte $82   ; 19
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 1 - I - 0x016054 05:A044: 83        .byte $83   ; 1A
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - I - 0x016055 05:A045: AC        .byte $AC   ; 1B
    ; [DIRECTIVE] .BYTE $85  -- needs manual handling  ; orig: - D 1 - I - 0x016056 05:A046: 85        .byte $85   ; 1C
    ; [DIRECTIVE] .BYTE $AE  -- needs manual handling  ; orig: - D 1 - I - 0x016057 05:A047: AE        .byte $AE   ; 1D
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016058 05:A048: 82        .byte $82   ; 1E
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 1 - I - 0x016059 05:A049: 82        .byte $82   ; 1F
    ; [DIRECTIVE] .BYTE $AD  -- needs manual handling  ; orig: - D 1 - I - 0x01605A 05:A04A: AD        .byte $AD   ; 20
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - I - 0x01605B 05:A04B: 84        .byte $84   ; 21
    ; [DIRECTIVE] .BYTE $AF  -- needs manual handling  ; orig: - D 1 - I - 0x01605C 05:A04C: AF        .byte $AF   ; 22
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 1 - I - 0x01605D 05:A04D: 86        .byte $86   ; 23
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01605E 05:A04E: F5        .byte $F5   ; 24
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01605F 05:A04F: F5        .byte $F5   ; 25
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016060 05:A050: DE        .byte $DE   ; 26
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016061 05:A051: DE        .byte $DE   ; 27
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016062 05:A052: DE        .byte $DE   ; 28
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016063 05:A053: DE        .byte $DE   ; 29
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016064 05:A054: F5        .byte $F5   ; 2A
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016065 05:A055: F5        .byte $F5   ; 2B
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016066 05:A056: DE        .byte $DE   ; 2C
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016067 05:A057: DE        .byte $DE   ; 2D
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016068 05:A058: DE        .byte $DE   ; 2E
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016069 05:A059: DE        .byte $DE   ; 2F
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01606A 05:A05A: F5        .byte $F5   ; 30
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01606B 05:A05B: F5        .byte $F5   ; 31
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x01606C 05:A05C: DE        .byte $DE   ; 32
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - I - 0x01606D 05:A05D: 90        .byte $90   ; 33
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x01606E 05:A05E: DE        .byte $DE   ; 34
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x01606F 05:A05F: 24        .byte $24   ; 35
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016070 05:A060: F5        .byte $F5   ; 36
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x016071 05:A061: F5        .byte $F5   ; 37
    ; [DIRECTIVE] .BYTE $91  -- needs manual handling  ; orig: - D 1 - I - 0x016072 05:A062: 91        .byte $91   ; 38
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016073 05:A063: DE        .byte $DE   ; 39
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x016074 05:A064: 24        .byte $24   ; 3A
    ; [DIRECTIVE] .BYTE $DE  -- needs manual handling  ; orig: - D 1 - I - 0x016075 05:A065: DE        .byte $DE   ; 3B



off_A066_02:  ; orig: off_A066_02:
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - I - 0x016076 05:A066: 7E        .byte $7E   ; 00
    ; [DIRECTIVE] .BYTE $7F  -- needs manual handling  ; orig: - D 1 - I - 0x016077 05:A067: 7F        .byte $7F   ; 01
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016078 05:A068: 7D        .byte $7D   ; 02
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - I - 0x016079 05:A069: 76        .byte $76   ; 03
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x01607A 05:A06A: 24        .byte $24   ; 04
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x01607B 05:A06B: 7D        .byte $7D   ; 05
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - I - 0x01607C 05:A06C: 74        .byte $74   ; 06
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x01607D 05:A06D: 24        .byte $24   ; 07
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x01607E 05:A06E: 7D        .byte $7D   ; 08
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x01607F 05:A06F: 80        .byte $80   ; 09
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x016080 05:A070: 81        .byte $81   ; 0A
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016081 05:A071: 7D        .byte $7D   ; 0B
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - I - 0x016082 05:A072: 7E        .byte $7E   ; 0C
    ; [DIRECTIVE] .BYTE $7F  -- needs manual handling  ; orig: - D 1 - I - 0x016083 05:A073: 7F        .byte $7F   ; 0D
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016084 05:A074: 7D        .byte $7D   ; 0E
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - I - 0x016085 05:A075: 9C        .byte $9C   ; 0F
    ; [DIRECTIVE] .BYTE $9D  -- needs manual handling  ; orig: - D 1 - I - 0x016086 05:A076: 9D        .byte $9D   ; 10
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016087 05:A077: 7D        .byte $7D   ; 11
    ; [DIRECTIVE] .BYTE $9E  -- needs manual handling  ; orig: - D 1 - I - 0x016088 05:A078: 9E        .byte $9E   ; 12
    ; [DIRECTIVE] .BYTE $9F  -- needs manual handling  ; orig: - D 1 - I - 0x016089 05:A079: 9F        .byte $9F   ; 13
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x01608A 05:A07A: 7D        .byte $7D   ; 14
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x01608B 05:A07B: 80        .byte $80   ; 15
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x01608C 05:A07C: 81        .byte $81   ; 16
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x01608D 05:A07D: 7D        .byte $7D   ; 17
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - I - 0x01608E 05:A07E: 7E        .byte $7E   ; 18
    ; [DIRECTIVE] .BYTE $7F  -- needs manual handling  ; orig: - D 1 - I - 0x01608F 05:A07F: 7F        .byte $7F   ; 19
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016090 05:A080: 7D        .byte $7D   ; 1A
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x016091 05:A081: A8        .byte $A8   ; 1B
    ; [DIRECTIVE] .BYTE $A9  -- needs manual handling  ; orig: - D 1 - I - 0x016092 05:A082: A9        .byte $A9   ; 1C
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016093 05:A083: 7D        .byte $7D   ; 1D
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 1 - I - 0x016094 05:A084: AA        .byte $AA   ; 1E
    ; [DIRECTIVE] .BYTE $AB  -- needs manual handling  ; orig: - D 1 - I - 0x016095 05:A085: AB        .byte $AB   ; 1F
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016096 05:A086: 7D        .byte $7D   ; 20
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x016097 05:A087: 80        .byte $80   ; 21
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x016098 05:A088: 81        .byte $81   ; 22
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - I - 0x016099 05:A089: 7D        .byte $7D   ; 23
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x01609A 05:A08A: DD        .byte $DD   ; 24
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x01609B 05:A08B: DD        .byte $DD   ; 25
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01609C 05:A08C: F5        .byte $F5   ; 26
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x01609D 05:A08D: DD        .byte $DD   ; 27
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x01609E 05:A08E: DD        .byte $DD   ; 28
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x01609F 05:A08F: F5        .byte $F5   ; 29
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A0 05:A090: DD        .byte $DD   ; 2A
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A1 05:A091: DD        .byte $DD   ; 2B
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160A2 05:A092: F5        .byte $F5   ; 2C
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A3 05:A093: DD        .byte $DD   ; 2D
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A4 05:A094: DD        .byte $DD   ; 2E
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160A5 05:A095: F5        .byte $F5   ; 2F
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A6 05:A096: DD        .byte $DD   ; 30
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160A7 05:A097: DD        .byte $DD   ; 31
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160A8 05:A098: F5        .byte $F5   ; 32
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160A9 05:A099: 24        .byte $24   ; 33
    ; [DIRECTIVE] .BYTE $8E  -- needs manual handling  ; orig: - D 1 - I - 0x0160AA 05:A09A: 8E        .byte $8E   ; 34
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160AB 05:A09B: F5        .byte $F5   ; 35
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160AC 05:A09C: 24        .byte $24   ; 36
    ; [DIRECTIVE] .BYTE $8F  -- needs manual handling  ; orig: - D 1 - I - 0x0160AD 05:A09D: 8F        .byte $8F   ; 37
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160AE 05:A09E: F5        .byte $F5   ; 38
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160AF 05:A09F: DD        .byte $DD   ; 39
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 1 - I - 0x0160B0 05:A0A0: DD        .byte $DD   ; 3A
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160B1 05:A0A1: F5        .byte $F5   ; 3B



off_A0A2_03:  ; orig: off_A0A2_03:
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160B2 05:A0A2: 78        .byte $78   ; 00
    ; [DIRECTIVE] .BYTE $79  -- needs manual handling  ; orig: - D 1 - I - 0x0160B3 05:A0A3: 79        .byte $79   ; 01
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - I - 0x0160B4 05:A0A4: 7A        .byte $7A   ; 02
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160B5 05:A0A5: 78        .byte $78   ; 03
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160B6 05:A0A6: 24        .byte $24   ; 04
    ; [DIRECTIVE] .BYTE $77  -- needs manual handling  ; orig: - D 1 - I - 0x0160B7 05:A0A7: 77        .byte $77   ; 05
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160B8 05:A0A8: 78        .byte $78   ; 06
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160B9 05:A0A9: 24        .byte $24   ; 07
    ; [DIRECTIVE] .BYTE $75  -- needs manual handling  ; orig: - D 1 - I - 0x0160BA 05:A0AA: 75        .byte $75   ; 08
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160BB 05:A0AB: 78        .byte $78   ; 09
    ; [DIRECTIVE] .BYTE $7B  -- needs manual handling  ; orig: - D 1 - I - 0x0160BC 05:A0AC: 7B        .byte $7B   ; 0A
    ; [DIRECTIVE] .BYTE $7C  -- needs manual handling  ; orig: - D 1 - I - 0x0160BD 05:A0AD: 7C        .byte $7C   ; 0B
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160BE 05:A0AE: 78        .byte $78   ; 0C
    ; [DIRECTIVE] .BYTE $79  -- needs manual handling  ; orig: - D 1 - I - 0x0160BF 05:A0AF: 79        .byte $79   ; 0D
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - I - 0x0160C0 05:A0B0: 7A        .byte $7A   ; 0E
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160C1 05:A0B1: 78        .byte $78   ; 0F
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - I - 0x0160C2 05:A0B2: 98        .byte $98   ; 10
    ; [DIRECTIVE] .BYTE $99  -- needs manual handling  ; orig: - D 1 - I - 0x0160C3 05:A0B3: 99        .byte $99   ; 11
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160C4 05:A0B4: 78        .byte $78   ; 12
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - I - 0x0160C5 05:A0B5: 9A        .byte $9A   ; 13
    ; [DIRECTIVE] .BYTE $9B  -- needs manual handling  ; orig: - D 1 - I - 0x0160C6 05:A0B6: 9B        .byte $9B   ; 14
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160C7 05:A0B7: 78        .byte $78   ; 15
    ; [DIRECTIVE] .BYTE $7B  -- needs manual handling  ; orig: - D 1 - I - 0x0160C8 05:A0B8: 7B        .byte $7B   ; 16
    ; [DIRECTIVE] .BYTE $7C  -- needs manual handling  ; orig: - D 1 - I - 0x0160C9 05:A0B9: 7C        .byte $7C   ; 17
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160CA 05:A0BA: 78        .byte $78   ; 18
    ; [DIRECTIVE] .BYTE $79  -- needs manual handling  ; orig: - D 1 - I - 0x0160CB 05:A0BB: 79        .byte $79   ; 19
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - I - 0x0160CC 05:A0BC: 7A        .byte $7A   ; 1A
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160CD 05:A0BD: 78        .byte $78   ; 1B
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 1 - I - 0x0160CE 05:A0BE: A8        .byte $A8   ; 1C
    ; [DIRECTIVE] .BYTE $A9  -- needs manual handling  ; orig: - D 1 - I - 0x0160CF 05:A0BF: A9        .byte $A9   ; 1D
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160D0 05:A0C0: 78        .byte $78   ; 1E
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 1 - I - 0x0160D1 05:A0C1: AA        .byte $AA   ; 1F
    ; [DIRECTIVE] .BYTE $AB  -- needs manual handling  ; orig: - D 1 - I - 0x0160D2 05:A0C2: AB        .byte $AB   ; 20
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - I - 0x0160D3 05:A0C3: 78        .byte $78   ; 21
    ; [DIRECTIVE] .BYTE $7B  -- needs manual handling  ; orig: - D 1 - I - 0x0160D4 05:A0C4: 7B        .byte $7B   ; 22
    ; [DIRECTIVE] .BYTE $7C  -- needs manual handling  ; orig: - D 1 - I - 0x0160D5 05:A0C5: 7C        .byte $7C   ; 23
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160D6 05:A0C6: F5        .byte $F5   ; 24
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160D7 05:A0C7: DC        .byte $DC   ; 25
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160D8 05:A0C8: DC        .byte $DC   ; 26
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160D9 05:A0C9: F5        .byte $F5   ; 27
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160DA 05:A0CA: DC        .byte $DC   ; 28
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160DB 05:A0CB: DC        .byte $DC   ; 29
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160DC 05:A0CC: F5        .byte $F5   ; 2A
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160DD 05:A0CD: DC        .byte $DC   ; 2B
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160DE 05:A0CE: DC        .byte $DC   ; 2C
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160DF 05:A0CF: F5        .byte $F5   ; 2D
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160E0 05:A0D0: DC        .byte $DC   ; 2E
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160E1 05:A0D1: DC        .byte $DC   ; 2F
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160E2 05:A0D2: F5        .byte $F5   ; 30
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160E3 05:A0D3: DC        .byte $DC   ; 31
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160E4 05:A0D4: DC        .byte $DC   ; 32
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160E5 05:A0D5: F5        .byte $F5   ; 33
    ; [DIRECTIVE] .BYTE $8C  -- needs manual handling  ; orig: - D 1 - I - 0x0160E6 05:A0D6: 8C        .byte $8C   ; 34
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160E7 05:A0D7: 24        .byte $24   ; 35
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160E8 05:A0D8: F5        .byte $F5   ; 36
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 1 - I - 0x0160E9 05:A0D9: 8D        .byte $8D   ; 37
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - I - 0x0160EA 05:A0DA: 24        .byte $24   ; 38
    ; [DIRECTIVE] .BYTE $F5  -- needs manual handling  ; orig: - D 1 - I - 0x0160EB 05:A0DB: F5        .byte $F5   ; 39
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160EC 05:A0DC: DC        .byte $DC   ; 3A
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - I - 0x0160ED 05:A0DD: DC        .byte $DC   ; 3B



tbl_A0DE:  ; orig: tbl_A0DE:
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0160EE 05:A0DE: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $31, $23, $00, $00, $00, $00, $00, $00, $23, $31, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0160FA 05:A0EA: 00        .byte $00, $31, $23,
    ; [DIRECTIVE] .BYTE $00, $00, $23, $00, $00, $00, $00, $00, $00, $23, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016106 05:A0F6: 00        .byte $00, $00, $23,
    ; [DIRECTIVE] .BYTE $00, $00, $12, $00, $00, $00, $00, $00, $00, $12, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016112 05:A102: 00        .byte $00, $00, $12,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $01, $01, $06, $04, $04  -- needs manual handling  ; orig: - D 1 - I - 0x01611E 05:A10E: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $05, $05, $07, $16, $17, $00, $00, $17, $16, $07, $05, $05  -- needs manual handling  ; orig: - D 1 - I - 0x01612A 05:A11A: 05        .byte $05, $05, $07,
    ; [DIRECTIVE] .BYTE $72, $31, $00, $02, $00, $00, $00, $00, $02, $00, $31, $53  -- needs manual handling  ; orig: - D 1 - I - 0x016136 05:A126: 72        .byte $72, $31, $00,
    ; [DIRECTIVE] .BYTE $00, $11, $11, $11, $11, $11, $11, $11, $11, $11, $11, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016142 05:A132: 00        .byte $00, $11, $11,
    ; [DIRECTIVE] .BYTE $00, $12, $12, $12, $12, $12, $12, $12, $12, $12, $13, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01614E 05:A13E: 00        .byte $00, $12, $12,
    ; [DIRECTIVE] .BYTE $00, $00, $13, $12, $12, $12, $12, $12, $12, $13, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01615A 05:A14A: 00        .byte $00, $00, $13,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $31, $00, $00, $31, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016166 05:A156: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $61, $73, $41, $41, $41, $41, $41, $41, $74, $74, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016172 05:A162: 00        .byte $00, $61, $73,
    ; [DIRECTIVE] .BYTE $00, $57, $34, $54, $25, $13, $00, $35, $25, $13, $33, $55  -- needs manual handling  ; orig: - D 1 - I - 0x01617E 05:A16E: 00        .byte $00, $57, $34,
    ; [DIRECTIVE] .BYTE $00, $11, $00, $11, $00, $11, $11, $00, $11, $00, $11, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01618A 05:A17A: 00        .byte $00, $11, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $60, $00, $00, $60, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016196 05:A186: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23, $23  -- needs manual handling  ; orig: - D 1 - I - 0x0161A2 05:A192: 23        .byte $23, $23, $23,
    ; [DIRECTIVE] .BYTE $00, $13, $00, $13, $00, $13, $13, $00, $13, $00, $13, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0161AE 05:A19E: 00        .byte $00, $13, $00,
    ; [DIRECTIVE] .BYTE $20, $12, $21, $31, $33, $25, $02, $26, $31, $30, $12, $17  -- needs manual handling  ; orig: - D 1 - I - 0x0161BA 05:A1AA: 20        .byte $20, $12, $21,
    ; [DIRECTIVE] .BYTE $00, $74, $74, $75, $75, $41, $41, $75, $75, $74, $74, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0161C6 05:A1B6: 00        .byte $00, $74, $74,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $61, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0161D2 05:A1C2: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $62, $66, $66, $66, $66, $66, $66, $66, $66, $62, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0161DE 05:A1CE: 00        .byte $00, $62, $66,
    ; [DIRECTIVE] .BYTE $00, $62, $66, $64, $82, $82, $82, $82, $64, $66, $62, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0161EA 05:A1DA: 00        .byte $00, $62, $66,
    ; [DIRECTIVE] .BYTE $73, $70, $67, $65, $73, $66, $66, $73, $65, $67, $70, $73  -- needs manual handling  ; orig: - D 1 - I - 0x0161F6 05:A1E6: 73        .byte $73, $70, $67,
    ; [DIRECTIVE] .BYTE $73, $70, $71, $70, $63, $32, $43, $71, $70, $63, $70, $73  -- needs manual handling  ; orig: - D 1 - I - 0x016202 05:A1F2: 73        .byte $73, $70, $71,
    ; [DIRECTIVE] .BYTE $43, $43, $43, $43, $43, $43, $43, $43, $43, $43, $43, $43  -- needs manual handling  ; orig: - D 1 - I - 0x01620E 05:A1FE: 43        .byte $43, $43, $43,
    ; [DIRECTIVE] .BYTE $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66, $66  -- needs manual handling  ; orig: - D 1 - I - 0x01621A 05:A20A: 66        .byte $66, $66, $66,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $31, $23, $10, $23, $31, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016226 05:A216: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $00, $00, $00, $06, $04, $04, $03  -- needs manual handling  ; orig: - D 1 - I - 0x016232 05:A222: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $13, $12, $12, $12, $11, $11, $15, $14, $02, $24, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01623E 05:A22E: 00        .byte $00, $13, $12,
    ; [DIRECTIVE] .BYTE $00, $00, $22, $22, $00, $00, $00, $00, $22, $22, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01624A 05:A23A: 00        .byte $00, $00, $22,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $22, $22, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016256 05:A246: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $12, $12, $00, $00, $31, $31, $00, $00, $12, $12, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016262 05:A252: 00        .byte $00, $12, $12,
    ; [DIRECTIVE] .BYTE $04, $04, $04, $04, $04, $80, $31, $04, $04, $04, $04, $04  -- needs manual handling  ; orig: - D 1 - I - 0x01626E 05:A25E: 04        .byte $04, $04, $04,
    ; [DIRECTIVE] .BYTE $00, $93, $00, $95, $94, $96, $96, $98, $95, $00, $97, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01627A 05:A26A: 00        .byte $00, $93, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $00, $31, $00, $00, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016286 05:A276: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $00, $00, $00, $00, $87, $00, $00, $88, $00, $00, $00, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016292 05:A282: 00        .byte $00, $00, $00,
    ; [DIRECTIVE] .BYTE $85, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $52  -- needs manual handling  ; orig: - D 1 - I - 0x01629E 05:A28E: 85        .byte $85, $00, $00,
    ; [DIRECTIVE] .BYTE $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77, $77  -- needs manual handling  ; orig: - D 1 - I - 0x0162AA 05:A29A: 77        .byte $77, $77, $77,
    ; [DIRECTIVE] .BYTE $76, $76, $76, $76, $76, $76, $76, $76, $76, $76, $76, $76  -- needs manual handling  ; orig: - D 1 - I - 0x0162B6 05:A2A6: 76        .byte $76, $76, $76,
    ; [DIRECTIVE] .BYTE $60, $17, $83, $86, $36, $90, $90, $56, $86, $50, $17, $60  -- needs manual handling  ; orig: - D 1 - I - 0x0162C2 05:A2B2: 60        .byte $60, $17, $83,
    ; [DIRECTIVE] .BYTE $84, $76, $44, $40, $81, $42, $42, $81, $40, $44, $76, $51  -- needs manual handling  ; orig: - D 1 - I - 0x0162CE 05:A2BE: 84        .byte $84, $76, $44,
    ; [DIRECTIVE] .BYTE $00, $13, $12, $46, $91, $25, $25, $92, $45, $12, $13, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0162DA 05:A2CA: 00        .byte $00, $13, $12,



_off008_A2D6_00:  ; orig: _off008_A2D6_00:
    ; [DIRECTIVE] .BYTE $E1  -- needs manual handling  ; orig: - D 1 - I - 0x0162E6 05:A2D6: E1        .byte $E1   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x0162E7 05:A2D7: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $C1, $00, $01  -- needs manual handling  ; orig: - D 1 - I - 0x0162E8 05:A2D8: C1        .byte $C1, $00, $01 
    ; [DIRECTIVE] .BYTE $A0, $04  -- needs manual handling  ; orig: - D 1 - I - 0x0162EB 05:A2DB: A0        .byte $A0, $04   ; 0
    ; [DIRECTIVE] .BYTE $A0, $01  -- needs manual handling  ; orig: - D 1 - I - 0x0162ED 05:A2DD: A0        .byte $A0, $01   ; 0
    ; [DIRECTIVE] .BYTE $A0, $31  -- needs manual handling  ; orig: - D 1 - I - 0x0162EF 05:A2DF: A0        .byte $A0, $31   ; 0
    ; [DIRECTIVE] .BYTE $90, $21  -- needs manual handling  ; orig: - D 1 - I - 0x0162F1 05:A2E1: 90        .byte $90, $21   ; 0
    ; [DIRECTIVE] .BYTE $90, $21, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0162F3 05:A2E3: 90        .byte $90, $21, $00 



_off008_A2E6_10:  ; orig: _off008_A2E6_10:
    ; [DIRECTIVE] .BYTE $81, $00, $01, $04  -- needs manual handling  ; orig: - D 1 - I - 0x0162F6 05:A2E6: 81        .byte $81, $00, $01,
    ; [DIRECTIVE] .BYTE $81, $00, $01, $00, $01, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0162FA 05:A2EA: 81        .byte $81, $00, $01,
    ; [DIRECTIVE] .BYTE $81, $00, $21, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016300 05:A2F0: 81        .byte $81, $00, $21,
    ; [DIRECTIVE] .BYTE $81, $40  -- needs manual handling  ; orig: - D 1 - I - 0x016304 05:A2F4: 81        .byte $81, $40   ; 1
    ; [DIRECTIVE] .BYTE $81, $20, $01, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016306 05:A2F6: 81        .byte $81, $20, $01,
    ; [DIRECTIVE] .BYTE $81, $00, $04, $00, $01, $00, $01  -- needs manual handling  ; orig: - D 1 - I - 0x01630A 05:A2FA: 81        .byte $81, $00, $04,
    ; [DIRECTIVE] .BYTE $90, $41  -- needs manual handling  ; orig: - D 1 - I - 0x016311 05:A301: 90        .byte $90, $41   ; 1
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - I - 0x016313 05:A303: 80        .byte $80   ; 17



_off008_A304_20:  ; orig: _off008_A304_20:
    ; [DIRECTIVE] .BYTE $D1  -- needs manual handling  ; orig: - D 1 - I - 0x016314 05:A304: D1        .byte $D1   ; 20
    ; [DIRECTIVE] .BYTE $80, $21, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016315 05:A305: 80        .byte $80, $21, $00 
    ; [DIRECTIVE] .BYTE $91, $20  -- needs manual handling  ; orig: - D 1 - I - 0x016318 05:A308: 91        .byte $91, $20   ; 2
    ; [DIRECTIVE] .BYTE $91, $00, $01, $00, $11  -- needs manual handling  ; orig: - D 1 - I - 0x01631A 05:A30A: 91        .byte $91, $00, $01,
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - I - 0x01631F 05:A30F: D0        .byte $D0   ; 24
    ; [DIRECTIVE] .BYTE $81, $00, $41  -- needs manual handling  ; orig: - D 1 - I - 0x016320 05:A310: 81        .byte $81, $00, $41 
    ; [DIRECTIVE] .BYTE $B1, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016323 05:A313: B1        .byte $B1, $00   ; 2



_off008_A315_30:  ; orig: _off008_A315_30:
    ; [DIRECTIVE] .BYTE $91, $00  -- needs manual handling  ; orig: - D 1 - I - 0x016325 05:A315: 91        .byte $91, $00   ; 3
    ; [DIRECTIVE] .BYTE $A1, $00, $21  -- needs manual handling  ; orig: - D 1 - I - 0x016327 05:A317: A1        .byte $A1, $00, $21 
    ; [DIRECTIVE] .BYTE $B1, $06  -- needs manual handling  ; orig: - D 1 - I - 0x01632A 05:A31A: B1        .byte $B1, $06   ; 3
    ; [DIRECTIVE] .BYTE $91, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01632C 05:A31C: 91        .byte $91, $00   ; 3
    ; [DIRECTIVE] .BYTE $B1, $00  -- needs manual handling  ; orig: - D 1 - I - 0x01632E 05:A31E: B1        .byte $B1, $00   ; 3
    ; [DIRECTIVE] .BYTE $81, $00, $21  -- needs manual handling  ; orig: - D 1 - I - 0x016330 05:A320: 81        .byte $81, $00, $21 
    ; [DIRECTIVE] .BYTE $90, $17, $02  -- needs manual handling  ; orig: - D 1 - I - 0x016333 05:A323: 90        .byte $90, $17, $02 



_off008_A326_40:  ; orig: _off008_A326_40:
    ; [DIRECTIVE] .BYTE $91, $17, $01, $17  -- needs manual handling  ; orig: - D 1 - I - 0x016336 05:A326: 91        .byte $91, $17, $01,
    ; [DIRECTIVE] .BYTE $81, $16  -- needs manual handling  ; orig: - D 1 - I - 0x01633A 05:A32A: 81        .byte $81, $16   ; 4
    ; [DIRECTIVE] .BYTE $B1, $07  -- needs manual handling  ; orig: - D 1 - I - 0x01633C 05:A32C: B1        .byte $B1, $07   ; 4
    ; [DIRECTIVE] .BYTE $91, $06, $31  -- needs manual handling  ; orig: - D 1 - I - 0x01633E 05:A32E: 91        .byte $91, $06, $31 
    ; [DIRECTIVE] .BYTE $87, $31, $17  -- needs manual handling  ; orig: - D 1 - I - 0x016341 05:A331: 87        .byte $87, $31, $17 
    ; [DIRECTIVE] .BYTE $81, $00, $01, $03  -- needs manual handling  ; orig: - D 1 - I - 0x016344 05:A334: 81        .byte $81, $00, $01,
    ; [DIRECTIVE] .BYTE $81, $00, $01, $02, $01  -- needs manual handling  ; orig: - D 1 - I - 0x016348 05:A338: 81        .byte $81, $00, $01,



_off008_A33D_50:  ; orig: _off008_A33D_50:
    ; [DIRECTIVE] .BYTE $80, $01, $10, $11  -- needs manual handling  ; orig: - D 1 - I - 0x01634D 05:A33D: 80        .byte $80, $01, $10,
    ; [DIRECTIVE] .BYTE $83, $47  -- needs manual handling  ; orig: - D 1 - I - 0x016351 05:A341: 83        .byte $83, $47   ; 5
    ; [DIRECTIVE] .BYTE $83, $41, $03  -- needs manual handling  ; orig: - D 1 - I - 0x016353 05:A343: 83        .byte $83, $41, $03 
    ; [DIRECTIVE] .BYTE $D1, $03  -- needs manual handling  ; orig: - D 1 - I - 0x016356 05:A346: D1        .byte $D1, $03   ; 5
    ; [DIRECTIVE] .BYTE $90, $01, $10  -- needs manual handling  ; orig: - D 1 - I - 0x016358 05:A348: 90        .byte $90, $01, $10 
    ; [DIRECTIVE] .BYTE $91, $00, $11  -- needs manual handling  ; orig: - D 1 - I - 0x01635B 05:A34B: 91        .byte $91, $00, $11 
    ; [DIRECTIVE] .BYTE $90, $17, $03, $11  -- needs manual handling  ; orig: - D 1 - I - 0x01635E 05:A34E: 90        .byte $90, $17, $03,
    ; [DIRECTIVE] .BYTE $C0, $11  -- needs manual handling  ; orig: - D 1 - I - 0x016362 05:A352: C0        .byte $C0, $11   ; 5



_off008_A354_60:  ; orig: _off008_A354_60:
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - I - 0x016364 05:A354: E0        .byte $E0   ; 60
    ; [DIRECTIVE] .BYTE $E6  -- needs manual handling  ; orig: - D 1 - I - 0x016365 05:A355: E6        .byte $E6   ; 61
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x016366 05:A356: 81        .byte $81   ; 62
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - I - 0x016367 05:A357: C6        .byte $C6   ; 63
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 1 - I - 0x016368 05:A358: 81        .byte $81   ; 64
    ; [DIRECTIVE] .BYTE $86, $01, $06, $01, $06  -- needs manual handling  ; orig: - D 1 - I - 0x016369 05:A359: 86        .byte $86, $01, $06,
    ; [DIRECTIVE] .BYTE $81, $06, $21  -- needs manual handling  ; orig: - D 1 - I - 0x01636E 05:A35E: 81        .byte $81, $06, $21 
    ; [DIRECTIVE] .BYTE $86, $01, $26, $01  -- needs manual handling  ; orig: - D 1 - I - 0x016371 05:A361: 86        .byte $86, $01, $26,



_off008_A365_70:  ; orig: _off008_A365_70:
    ; [DIRECTIVE] .BYTE $86, $41  -- needs manual handling  ; orig: - D 1 - I - 0x016375 05:A365: 86        .byte $86, $41   ; 7
    ; [DIRECTIVE] .BYTE $86, $01, $46  -- needs manual handling  ; orig: - D 1 - I - 0x016377 05:A367: 86        .byte $86, $01, $46 
    ; [DIRECTIVE] .BYTE $D1, $02  -- needs manual handling  ; orig: - D 1 - I - 0x01637A 05:A36A: D1        .byte $D1, $02   ; 7
    ; [DIRECTIVE] .BYTE $A6, $01, $26  -- needs manual handling  ; orig: - D 1 - I - 0x01637C 05:A36C: A6        .byte $A6, $01, $26 
    ; [DIRECTIVE] .BYTE $81, $56  -- needs manual handling  ; orig: - D 1 - I - 0x01637F 05:A36F: 81        .byte $81, $56   ; 7
    ; [DIRECTIVE] .BYTE $81, $16, $11, $16  -- needs manual handling  ; orig: - D 1 - I - 0x016381 05:A371: 81        .byte $81, $16, $11,
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 1 - I - 0x016385 05:A375: E7        .byte $E7   ; 76
    ; [DIRECTIVE] .BYTE $E5  -- needs manual handling  ; orig: - D 1 - I - 0x016386 05:A376: E5        .byte $E5   ; 77



_off008_A377_80:  ; orig: _off008_A377_80:
    ; [DIRECTIVE] .BYTE $81, $10, $01, $10  -- needs manual handling  ; orig: - D 1 - I - 0x016387 05:A377: 81        .byte $81, $10, $01,
    ; [DIRECTIVE] .BYTE $81, $27  -- needs manual handling  ; orig: - D 1 - I - 0x01638B 05:A37B: 81        .byte $81, $27   ; 8
    ; [DIRECTIVE] .BYTE $A1, $06, $21  -- needs manual handling  ; orig: - D 1 - I - 0x01638D 05:A37D: A1        .byte $A1, $06, $21 
    ; [DIRECTIVE] .BYTE $80, $01, $10, $11  -- needs manual handling  ; orig: - D 1 - I - 0x016390 05:A380: 80        .byte $80, $01, $10,
    ; [DIRECTIVE] .BYTE $82, $47  -- needs manual handling  ; orig: - D 1 - I - 0x016394 05:A384: 82        .byte $82, $47   ; 8
    ; [DIRECTIVE] .BYTE $82, $41, $02  -- needs manual handling  ; orig: - D 1 - I - 0x016396 05:A386: 82        .byte $82, $41, $02 
    ; [DIRECTIVE] .BYTE $80, $01, $10  -- needs manual handling  ; orig: - D 1 - I - 0x016399 05:A389: 80        .byte $80, $01, $10 
    ; [DIRECTIVE] .BYTE $A1, $02  -- needs manual handling  ; orig: - D 1 - I - 0x01639C 05:A38C: A1        .byte $A1, $02   ; 8
    ; [DIRECTIVE] .BYTE $A1, $03, $21  -- needs manual handling  ; orig: - D 1 - I - 0x01639E 05:A38E: A1        .byte $A1, $03, $21 



_off008_A391_90:  ; orig: _off008_A391_90:
    ; [DIRECTIVE] .BYTE $80, $27, $21  -- needs manual handling  ; orig: - D 1 - I - 0x0163A1 05:A391: 80        .byte $80, $27, $21 
    ; [DIRECTIVE] .BYTE $81, $00, $02, $11, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0163A4 05:A394: 81        .byte $81, $00, $02,
    ; [DIRECTIVE] .BYTE $81, $00, $03, $11, $00  -- needs manual handling  ; orig: - D 1 - I - 0x0163A9 05:A399: 81        .byte $81, $00, $03,
    ; [DIRECTIVE] .BYTE $81, $02  -- needs manual handling  ; orig: - D 1 - I - 0x0163AE 05:A39E: 81        .byte $81, $02   ; 9
    ; [DIRECTIVE] .BYTE $81, $02, $01, $02, $01, $02, $05  -- needs manual handling  ; orig: - D 1 - I - 0x0163B0 05:A3A0: 81        .byte $81, $02, $01,
    ; [DIRECTIVE] .BYTE $C1, $15  -- needs manual handling  ; orig: - D 1 - I - 0x0163B7 05:A3A7: C1        .byte $C1, $15   ; 9
    ; [DIRECTIVE] .BYTE $B1, $25  -- needs manual handling  ; orig: - D 1 - I - 0x0163B9 05:A3A9: B1        .byte $B1, $25   ; 9
    ; [DIRECTIVE] .BYTE $81, $03  -- needs manual handling  ; orig: - D 1 - I - 0x0163BB 05:A3AB: 81        .byte $81, $03   ; 9
    ; [DIRECTIVE] .BYTE $81, $03, $01, $03, $01, $03, $05  -- needs manual handling  ; orig: - D 1 - I - 0x0163BD 05:A3AD: 81        .byte $81, $03, $01,



off_A3B4_04_underground_passage:  ; orig: off_A3B4_04_underground_passage:
    ; [DIRECTIVE] .BYTE $04, $04, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $04, $04  -- needs manual handling  ; orig: - D 1 - I - 0x0163C4 05:A3B4: 04        .byte $04, $04, $00,



off_A3C4_06_underground_room_with_item:  ; orig: off_A3C4_06_underground_room_with_item:
    ; [DIRECTIVE] .BYTE $04, $04, $00, $01, $00, $00, $00, $03, $03, $03, $03, $02, $03, $03, $04, $04  -- needs manual handling  ; orig: - D 1 - I - 0x0163D4 05:A3C4: 04        .byte $04, $04, $00,



tbl_A3D4_dungeon:  ; orig: tbl_A3D4_dungeon:
    ; [DIRECTIVE] .BYTE $82, $43, $43, $43, $02, $0C, $43  -- needs manual handling  ; orig: - D 1 - I - 0x0163E4 05:A3D4: 82        .byte $82, $43, $43,
    ; [DIRECTIVE] .BYTE $80, $41, $41, $41, $41, $43  -- needs manual handling  ; orig: - D 1 - I - 0x0163EB 05:A3DB: 80        .byte $80, $41, $41,
    ; [DIRECTIVE] .BYTE $82, $43, $42, $0C, $01, $41, $43  -- needs manual handling  ; orig: - D 1 - I - 0x0163F1 05:A3E1: 82        .byte $82, $43, $42,
    ; [DIRECTIVE] .BYTE $82, $43, $42, $0C, $03, $02, $0C, $43  -- needs manual handling  ; orig: - D 1 - I - 0x0163F8 05:A3E8: 82        .byte $82, $43, $42,
    ; [DIRECTIVE] .BYTE $82, $43, $43, $43, $43, $43  -- needs manual handling  ; orig: - D 1 - I - 0x016400 05:A3F0: 82        .byte $82, $43, $43,



sub_A3F6:  ; orig: sub_A3F6:
sub_0x016406:  ; orig: sub_0x016406:

; in

; ram_0002_t24_direction

; out

; A =

; ram_0003_t01_loop_counter
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x016406 05:A3F6: A9 01     LDA #$01
    MOVE.B  D0,ram_0001_t01  ; orig: C - - - - - 0x016408 05:A3F8: 85 01     STA ram_0001_t01
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x01640A 05:A3FA: A9 03     LDA #$03
    MOVE.B  D0,ram_0003_t01_loop_counter  ; orig: C - - - - - 0x01640C 05:A3FC: 85 03     STA ram_0003_t01_loo
bra_A3FE_loop:  ; orig: bra_A3FE_loop:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x01640E 05:A3FE: A4 EB     LDY ram_map_location
    MOVE.B  ram_687E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x016410 05:A400: B9 7E 68  LDA ram_687E_map_dat
    MOVE.B  ram_0003_t01_loop_counter,D2  ; orig: C - - - - - 0x016413 05:A403: A4 03     LDY ram_0003_t01_loo
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x016415 05:A405: C0 02     CPY #$02
    BCC     bra_A40E             ; BCC  ; orig: C - - - - - 0x016417 05:A407: 90 05     BCC bra_A40E
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x016419 05:A409: A4 EB     LDY ram_map_location
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01641B 05:A40B: B9 FE 68  LDA ram_68FE_map_dat
bra_A40E:  ; orig: bra_A40E:
    MOVE.B  D0,ram_0000_t3E  ; orig: C - - - - - 0x01641E 05:A40E: 85 00     STA ram_0000_t3E
    MOVE.B  ram_0003_t01_loop_counter,D0  ; orig: C - - - - - 0x016420 05:A410: A5 03     LDA ram_0003_t01_loo
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x016422 05:A412: 29 01     AND #$01
    BNE     bra_A41C             ; BNE  ; orig: C - - - - - 0x016424 05:A414: D0 06     BNE bra_A41C

; / 08
    LSR.B   #1,ram_0000_t3E  ; orig: C - - - - - 0x016426 05:A416: 46 00     LSR ram_0000_t3E
    LSR.B   #1,ram_0000_t3E  ; orig: C - - - - - 0x016428 05:A418: 46 00     LSR ram_0000_t3E
    LSR.B   #1,ram_0000_t3E  ; orig: C - - - - - 0x01642A 05:A41A: 46 00     LSR ram_0000_t3E
bra_A41C:  ; orig: bra_A41C:

; / 04 (20)
    LSR.B   #1,ram_0000_t3E  ; orig: C - - - - - 0x01642C 05:A41C: 46 00     LSR ram_0000_t3E
    LSR.B   #1,ram_0000_t3E  ; orig: C - - - - - 0x01642E 05:A41E: 46 00     LSR ram_0000_t3E
    MOVE.B  ram_0002_t24_direction,D0  ; orig: C - - - - - 0x016430 05:A420: A5 02     LDA ram_0002_t24_dir
    BTST    D0,ram_0001_t01  ; BIT abs  ; orig: C - - - - - 0x016432 05:A422: 24 01     BIT ram_0001_t01
    BNE     bra_A42F             ; BNE  ; orig: C - - - - - 0x016434 05:A424: D0 09     BNE bra_A42F
    ASL.B   #1,ram_0001_t01  ; orig: C - - - - - 0x016436 05:A426: 06 01     ASL ram_0001_t01
    SUBQ.B  #1,ram_0003_t01_loop_counter  ; orig: C - - - - - 0x016438 05:A428: C6 03     DEC ram_0003_t01_loo
    BPL     bra_A3FE_loop             ; BPL  ; orig: C - - - - - 0x01643A 05:A42A: 10 D2     BPL bra_A3FE_loop
    MOVE.B  #$08,D0  ; orig: - - - - - - 0x01643C 05:A42C: A9 08     LDA #$08
    RTS                     ; RTS  ; orig: - - - - - - 0x01643E 05:A42E: 60        RTS
bra_A42F:  ; orig: bra_A42F:
    MOVE.B  ram_0000_t3E,D0  ; orig: C - - - - - 0x01643F 05:A42F: A5 00     LDA ram_0000_t3E
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x016441 05:A431: 29 07     AND #$07
    RTS                     ; RTS  ; orig: C - - - - - 0x016443 05:A433: 60        RTS



bra_A434:  ; orig: bra_A434:
    MOVE.B  #$13,D0  ; orig: C - - - - - 0x016444 05:A434: A9 13     LDA #$13
    MOVE.B  D0,ram_0006_t04_loop_counter  ; orig: C - - - - - 0x016446 05:A436: 85 06     STA ram_0006_t04_loo
    MOVE.B  #$19,D1  ; orig: C - - - - - 0x016448 05:A438: A2 19     LDX #$19
    BNE     bra_A484             ; BNE  ; orig: C - - - - - 0x01644A 05:A43A: D0 48     BNE bra_A484    ; jm



bra_A43C:
; bzk
    BSR     sub_bat_7298_dec_0004_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x01644C 05:A43C: 20 98 72  JSR sub_bat_7298_dec
    JMP     loc_A48E  ; orig: C - - - - - 0x01644F 05:A43F: 4C 8E A4  JMP loc_A48E



sub_A442:  ; orig: sub_A442:
    MOVE.B  #< tbl_9FA0_tiles_id,D0  ; orig: C - - - - - 0x016452 05:A442: A9 A0     LDA #< tbl_9FA0_tile
    MOVE.B  D0,ram_0000_t0F_data  ; orig: C - - - - - 0x016454 05:A444: 85 00     STA ram_0000_t0F_dat
    MOVE.B  #> tbl_9FA0_tiles_id,D0  ; orig: C - - - - - 0x016456 05:A446: A9 9F     LDA #> tbl_9FA0_tile
    ; (empty translation for STA)  ; orig: C - - - - - 0x016458 05:A448: 85 01     STA ram_0000_t0F_dat
    MOVE.B  #< ram_6547,D0  ; orig: C - - - - - 0x01645A 05:A44A: A9 47     LDA #< ram_6547
    MOVE.B  D0,ram_0002_t04_data  ; orig: C - - - - - 0x01645C 05:A44C: 85 02     STA ram_0002_t04_dat
    MOVE.B  #> ram_6547,D0  ; orig: C - - - - - 0x01645E 05:A44E: A9 65     LDA #> ram_6547
    ; (empty translation for STA)  ; orig: C - - - - - 0x016460 05:A450: 85 03     STA ram_0002_t04_dat
    MOVE.B  #< ram_655A,D0  ; orig: C - - - - - 0x016462 05:A452: A9 5A     LDA #< ram_655A
    MOVE.B  D0,ram_0004_t04_data  ; orig: C - - - - - 0x016464 05:A454: 85 04     STA ram_0004_t04_dat
    MOVE.B  #> ram_655A,D0  ; orig: C - - - - - 0x016466 05:A456: A9 65     LDA #> ram_655A
    ; (empty translation for STA)  ; orig: C - - - - - 0x016468 05:A458: 85 05     STA ram_0004_t04_dat
    MOVE.B  #$0A,D0  ; orig: C - - - - - 0x01646A 05:A45A: A9 0A     LDA #$0A
    MOVE.B  D0,ram_0006_t04_loop_counter  ; orig: C - - - - - 0x01646C 05:A45C: 85 06     STA ram_0006_t04_loo
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01646E 05:A45E: A0 00     LDY #$00
bra_A460_loop:  ; orig: bra_A460_loop:
    MOVEA.W ($FF0000+ram_0000_t0F_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016470 05:A460: B1 00     LDA (ram_0000_t0F_da
    BEQ     bra_A434             ; BEQ  ; orig: C - - - - - 0x016472 05:A462: F0 D0     BEQ bra_A434
    MOVEA.W ($FF0000+ram_0002_t04_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016474 05:A464: 91 02     STA (ram_0002_t04_da
    MOVEA.W ($FF0000+ram_0004_t04_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016476 05:A466: 91 04     STA (ram_0004_t04_da
    CMPI.B  #$DE,D0  ; orig: C - - - - - 0x016478 05:A468: C9 DE     CMP #$DE
    BEQ     bra_A474             ; BEQ  ; orig: C - - - - - 0x01647A 05:A46A: F0 08     BEQ bra_A474
    CMPI.B  #$E2,D0  ; orig: C - - - - - 0x01647C 05:A46C: C9 E2     CMP #$E2
    BCS     bra_A474             ; BCS  ; orig: C - - - - - 0x01647E 05:A46E: B0 04     BCS bra_A474
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x016480 05:A470: 69 01     ADC #$01
    MOVEA.W ($FF0000+ram_0004_t04_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016482 05:A472: 91 04     STA (ram_0004_t04_da
bra_A474:  ; orig: bra_A474:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x016484 05:A474: A9 01     LDA #$01
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x016486 05:A476: A2 01     LDX #$01
    SUBQ.B  #1,ram_0006_t04_loop_counter  ; orig: C - - - - - 0x016488 05:A478: C6 06     DEC ram_0006_t04_loo
    BNE     bra_A484             ; BNE  ; orig: C - - - - - 0x01648A 05:A47A: D0 08     BNE bra_A484
    MOVE.B  #$0A,D0  ; orig: C - - - - - 0x01648C 05:A47C: A9 0A     LDA #$0A
    MOVE.B  D0,ram_0006_t04_loop_counter  ; orig: C - - - - - 0x01648E 05:A47E: 85 06     STA ram_0006_t04_loo
    MOVE.B  #$0D,D0  ; orig: C - - - - - 0x016490 05:A480: A9 0D     LDA #$0D
    MOVE.B  #$1F,D1  ; orig: C - - - - - 0x016492 05:A482: A2 1F     LDX #$1F
bra_A484:  ; orig: bra_A484:
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016494 05:A484: 20 82 72  JSR sub_bat_7282_inc
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016497 05:A487: 8A        TXA
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x016498 05:A488: CA        DEX
    BEQ     bra_A43C             ; BEQ  ; orig: C - - - - - 0x016499 05:A489: F0 B1     BEQ bra_A43C
    BSR     sub_bat_728E_inc_0004_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01649B 05:A48B: 20 8E 72  JSR sub_bat_728E_inc
loc_A48E:  ; orig: loc_A48E:
    BSR     sub_bat_7274_inc_0000_pointer_by_01             ; JSR -> BSR  ; orig: C D 1 - - - 0x01649E 05:A48E: 20 74 72  JSR sub_bat_7274_inc

; bzk warning, dangerous loop exit condition implementation by developers (4E = current table size)
    CMPI.B  #< ( tbl_9FA0_tiles_id + $4E ),D0  ; orig: C - - - - - 0x0164A1 05:A491: C9 EE     CMP #< ( tbl_9FA0_ti
    BNE     bra_A460_loop             ; BNE  ; orig: C - - - - - 0x0164A3 05:A493: D0 CB     BNE bra_A460_loop
    MOVE.B  #< ram_6530,D0  ; orig: C - - - - - 0x0164A5 05:A495: A9 30     LDA #< ram_6530
    MOVE.B  D0,ram_0002_t07_data  ; orig: C - - - - - 0x0164A7 05:A497: 85 02     STA ram_0002_t07_dat
    MOVE.B  #> ram_6530,D0  ; orig: C - - - - - 0x0164A9 05:A499: A9 65     LDA #> ram_6530
    ; (empty translation for STA)  ; orig: C - - - - - 0x0164AB 05:A49B: 85 03     STA ram_0002_t07_dat
    MOVE.B  #< ram_67EF,D0  ; orig: C - - - - - 0x0164AD 05:A49D: A9 EF     LDA #< ram_67EF
    MOVE.B  D0,ram_0004_t05_data  ; orig: C - - - - - 0x0164AF 05:A49F: 85 04     STA ram_0004_t05_dat
    MOVE.B  #> ram_67EF,D0  ; orig: C - - - - - 0x0164B1 05:A4A1: A9 67     LDA #> ram_67EF
    ; (empty translation for STA)  ; orig: C - - - - - 0x0164B3 05:A4A3: 85 05     STA ram_0004_t05_dat
bra_A4A5_loop:  ; orig: bra_A4A5_loop:
    MOVEA.W ($FF0000+ram_0002_t07_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0164B5 05:A4A5: B1 02     LDA (ram_0002_t07_da
    MOVEA.W ($FF0000+ram_0004_t05_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0164B7 05:A4A7: 91 04     STA (ram_0004_t05_da
    CMPI.B  #$DD,D0  ; orig: C - - - - - 0x0164B9 05:A4A9: C9 DD     CMP #$DD
    BEQ     bra_A4CF             ; BEQ  ; orig: C - - - - - 0x0164BB 05:A4AB: F0 22     BEQ bra_A4CF
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x0164BD 05:A4AD: C9 E0     CMP #$E0
    BCS     bra_A4BE             ; BCS  ; orig: C - - - - - 0x0164BF 05:A4AF: B0 0D     BCS bra_A4BE
    CMPI.B  #$DC,D0  ; orig: C - - - - - 0x0164C1 05:A4B1: C9 DC     CMP #$DC
    BCS     bra_A4B9             ; BCS  ; orig: C - - - - - 0x0164C3 05:A4B3: B0 04     BCS bra_A4B9
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0164C5 05:A4B5: 69 01     ADC #$01
    MOVEA.W ($FF0000+ram_0004_t05_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0164C7 05:A4B7: 91 04     STA (ram_0004_t05_da
bra_A4B9:  ; orig: bra_A4B9:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0164C9 05:A4B9: 18        CLC
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0164CA 05:A4BA: 69 01     ADC #$01
bra_A4BC:  ; orig: bra_A4BC:
    MOVEA.W ($FF0000+ram_0004_t05_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0164CC 05:A4BC: 91 04     STA (ram_0004_t05_da
bra_A4BE:  ; orig: bra_A4BE:
    BSR     sub_bat_7298_dec_0004_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x0164CE 05:A4BE: 20 98 72  JSR sub_bat_7298_dec
    BSR     sub_bat_7280_inc_0002_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x0164D1 05:A4C1: 20 80 72  JSR sub_bat_7280_inc
    CMPI.B  #$90,D0  ; orig: C - - - - - 0x0164D4 05:A4C4: C9 90     CMP #$90
    BNE     bra_A4A5_loop             ; BNE  ; orig: C - - - - - 0x0164D6 05:A4C6: D0 DD     BNE bra_A4A5_loop
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0164D8 05:A4C8: A5 03     LDA ram_0002_t07_dat
    CMPI.B  #> $6600,D0  ; orig: C - - - - - 0x0164DA 05:A4CA: C9 66     CMP #> $6600
    BNE     bra_A4A5_loop             ; BNE  ; orig: C - - - - - 0x0164DC 05:A4CC: D0 D7     BNE bra_A4A5_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0164DE 05:A4CE: 60        RTS
bra_A4CF:  ; orig: bra_A4CF:
    MOVE.B  #$DC,D0  ; orig: C - - - - - 0x0164DF 05:A4CF: A9 DC     LDA #$DC
    BNE     bra_A4BC             ; BNE  ; orig: C - - - - - 0x0164E1 05:A4D1: D0 E9     BNE bra_A4BC    ; jm



tbl_A4D3_direction:  ; orig: tbl_A4D3_direction:
    ; [DIRECTIVE] .BYTE con_dir_Right  -- needs manual handling  ; orig: - D 1 - - - 0x0164E3 05:A4D3: 01        .byte con_dir_Right 
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - - - 0x0164E4 05:A4D4: 02        .byte con_dir_Left  
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 1 - - - 0x0164E5 05:A4D5: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - - - 0x0164E6 05:A4D6: 08        .byte con_dir_Up   ;



tbl_A4D7:  ; orig: tbl_A4D7:
    ; [DIRECTIVE] .BYTE < off_9FEE_00  -- needs manual handling  ; orig: - D 1 - - - 0x0164E7 05:A4D7: EE        .byte < off_9FEE_00 
    ; [DIRECTIVE] .BYTE < off_A02A_01  -- needs manual handling  ; orig: - D 1 - - - 0x0164E8 05:A4D8: 2A        .byte < off_A02A_01 
    ; [DIRECTIVE] .BYTE < off_A066_02  -- needs manual handling  ; orig: - D 1 - - - 0x0164E9 05:A4D9: 66        .byte < off_A066_02 
    ; [DIRECTIVE] .BYTE < off_A0A2_03  -- needs manual handling  ; orig: - D 1 - - - 0x0164EA 05:A4DA: A2        .byte < off_A0A2_03 



tbl_A4DB:  ; orig: tbl_A4DB:
    ; [DIRECTIVE] .BYTE > off_9FEE_00  -- needs manual handling  ; orig: - D 1 - - - 0x0164EB 05:A4DB: 9F        .byte > off_9FEE_00 
    ; [DIRECTIVE] .BYTE > off_A02A_01  -- needs manual handling  ; orig: - D 1 - - - 0x0164EC 05:A4DC: A0        .byte > off_A02A_01 
    ; [DIRECTIVE] .BYTE > off_A066_02  -- needs manual handling  ; orig: - D 1 - - - 0x0164ED 05:A4DD: A0        .byte > off_A066_02 
    ; [DIRECTIVE] .BYTE > off_A0A2_03  -- needs manual handling  ; orig: - D 1 - - - 0x0164EE 05:A4DE: A0        .byte > off_A0A2_03 



tbl_A4DF:  ; orig: tbl_A4DF:
    ; [DIRECTIVE] .BYTE < ram_67A1  -- needs manual handling  ; orig: - D 1 - - - 0x0164EF 05:A4DF: A1        .byte < ram_67A1   ;
    ; [DIRECTIVE] .BYTE < ram_654F  -- needs manual handling  ; orig: - D 1 - - - 0x0164F0 05:A4E0: 4F        .byte < ram_654F   ;
    ; [DIRECTIVE] .BYTE < ram_6676  -- needs manual handling  ; orig: - D 1 - - - 0x0164F1 05:A4E1: 76        .byte < ram_6676   ;
    ; [DIRECTIVE] .BYTE < ram_6665  -- needs manual handling  ; orig: - D 1 - - - 0x0164F2 05:A4E2: 65        .byte < ram_6665   ;



tbl_A4E3:  ; orig: tbl_A4E3:
    ; [DIRECTIVE] .BYTE > ram_67A1  -- needs manual handling  ; orig: - D 1 - - - 0x0164F3 05:A4E3: 67        .byte > ram_67A1   ;
    ; [DIRECTIVE] .BYTE > ram_654F  -- needs manual handling  ; orig: - D 1 - - - 0x0164F4 05:A4E4: 65        .byte > ram_654F   ;
    ; [DIRECTIVE] .BYTE > ram_6676  -- needs manual handling  ; orig: - D 1 - - - 0x0164F5 05:A4E5: 66        .byte > ram_6676   ;
    ; [DIRECTIVE] .BYTE > ram_6665  -- needs manual handling  ; orig: - D 1 - - - 0x0164F6 05:A4E6: 66        .byte > ram_6665   ;



tbl_A4E7:  ; orig: tbl_A4E7:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - - - 0x0164F7 05:A4E7: 14        .byte $14   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x0164F8 05:A4E8: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x0164F9 05:A4E9: 01        .byte $01   ; 02



tbl_A4EA:  ; orig: tbl_A4EA:
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x0164FA 05:A4EA: 02        .byte $02   ; 00
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x0164FB 05:A4EB: 02        .byte $02   ; 01
    ; [DIRECTIVE] .BYTE $2C  -- needs manual handling  ; orig: - D 1 - - - 0x0164FC 05:A4EC: 2C        .byte $2C   ; 02
    ; [DIRECTIVE] .BYTE $2C  -- needs manual handling  ; orig: - D 1 - - - 0x0164FD 05:A4ED: 2C        .byte $2C   ; 03



tbl_A4EE_loop_counter:  ; orig: tbl_A4EE_loop_counter:
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0164FE 05:A4EE: 03        .byte $03   ; 00
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0164FF 05:A4EF: 03        .byte $03   ; 01
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x016500 05:A4F0: 02        .byte $02   ; 02
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x016501 05:A4F1: 02        .byte $02   ; 03



tbl_A4F2:
; loop counter
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x016502 05:A4F2: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x016503 05:A4F3: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x016504 05:A4F4: 02        .byte $02   ; 02
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x016505 05:A4F5: 02        .byte $02   ; 03



sub_A4F6:  ; orig: sub_A4F6:
loc_A4F6:  ; orig: loc_A4F6:
    MOVE.B  #$03,D1  ; orig: C D 1 - - - 0x016506 05:A4F6: A2 03     LDX #$03
loc_A4F8:  ; orig: loc_A4F8:
    MOVE.B  #$01,D0  ; orig: C D 1 - - - 0x016508 05:A4F8: A9 01     LDA #$01
    MOVE.B  D0,ram_0006_t12  ; orig: C - - - - - 0x01650A 05:A4FA: 85 06     STA ram_0006_t12
loc_A4FC:  ; orig: loc_A4FC:
    MOVE.B  D1,D0           ; TXA  ; orig: C D 1 - - - 0x01650C 05:A4FC: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01650D 05:A4FD: 48        PHA
    MOVE.B  D0,ram_000B_t08  ; orig: C - - - - - 0x01650E 05:A4FE: 85 0B     STA ram_000B_t08
    MOVE.B  tbl_A4D3_direction(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016510 05:A500: BD D3 A4  LDA tbl_A4D3_directi
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x016513 05:A503: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x016515 05:A505: 20 F6 A3  JSR sub_A3F6
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x016518 05:A508: C9 05     CMP #$05
    BCS     bra_A528             ; BCS  ; orig: C - - - - - 0x01651A 05:A50A: B0 1C     BCS bra_A528
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01651C 05:A50C: C9 04     CMP #$04
    BNE     bra_A518             ; BNE  ; orig: C - - - - - 0x01651E 05:A50E: D0 08     BNE bra_A518
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x016520 05:A510: A9 08     LDA #$08
    BNE     bra_A528             ; BNE  ; orig: C - - - - - 0x016522 05:A512: D0 14     BNE bra_A528    ; jm
bra_A514:  ; orig: bra_A514:
    MOVE.B  #$09,D0  ; orig: C - - - - - 0x016524 05:A514: A9 09     LDA #$09
    BNE     bra_A547             ; BNE  ; orig: C - - - - - 0x016526 05:A516: D0 2F     BNE bra_A547    ; jm
bra_A518:  ; orig: bra_A518:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016528 05:A518: 48        PHA
    MOVE.B  ram_0002_t24_direction,D0  ; orig: C - - - - - 0x016529 05:A519: A5 02     LDA ram_0002_t24_dir
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x01652B 05:A51B: 49 FF     EOR #$FF
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x01652D 05:A51D: 25 EE     AND ram_00EE
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x01652F 05:A51F: 85 EE     STA ram_00EE
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016531 05:A521: 68        PLA
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x016532 05:A522: C9 01     CMP #$01
    BCS     bra_A528             ; BCS  ; orig: C - - - - - 0x016534 05:A524: B0 02     BCS bra_A528
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x016536 05:A526: A9 04     LDA #$04
bra_A528:  ; orig: bra_A528:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016538 05:A528: 48        PHA
    MOVE.B  ram_00EE,D0  ; orig: C - - - - - 0x016539 05:A529: A5 EE     LDA ram_00EE
    AND.B   ram_0002_t24_direction,D0  ; orig: C - - - - - 0x01653B 05:A52B: 25 02     AND ram_0002_t24_dir
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01653D 05:A52D: AA        TAX
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01653E 05:A52E: 68        PLA
    CMP.B   ram_0002_t24_direction,D1  ; orig: C - - - - - 0x01653F 05:A52F: E4 02     CPX ram_0002_t24_dir
    BNE     bra_A547             ; BNE  ; orig: C - - - - - 0x016541 05:A531: D0 14     BNE bra_A547
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x016543 05:A533: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016544 05:A534: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016545 05:A535: 48        PHA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016546 05:A536: AA        TAX
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016547 05:A537: 98        TYA
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x016548 05:A538: C9 07     CMP #$07
    BEQ     bra_A545             ; BEQ  ; orig: C - - - - - 0x01654A 05:A53A: F0 09     BEQ bra_A545
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01654C 05:A53C: 48        PHA
    BSR     sub_8A97             ; JSR -> BSR  ; orig: C - - - - - 0x01654D 05:A53D: 20 97 8A  JSR sub_8A97
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016550 05:A540: 68        PLA
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x016551 05:A541: C9 08     CMP #$08
    BEQ     bra_A514             ; BEQ  ; orig: C - - - - - 0x016553 05:A543: F0 CF     BEQ bra_A514
bra_A545:  ; orig: bra_A545:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x016555 05:A545: A9 04     LDA #$04
bra_A547:  ; orig: bra_A547:
    MOVE.B  ram_0006_t12,D1  ; orig: C - - - - - 0x016557 05:A547: A6 06     LDX ram_0006_t12
    BEQ     bra_A555             ; BEQ  ; orig: C - - - - - 0x016559 05:A549: F0 0A     BEQ bra_A555
    MOVE.B  ram_000B_t08,D1  ; orig: C - - - - - 0x01655B 05:A54B: A6 0B     LDX ram_000B_t08
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01655D 05:A54D: 48        PHA
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x01655E 05:A54E: 20 F6 A3  JSR sub_A3F6
    BSR     sub_B641             ; JSR -> BSR  ; orig: C - - - - - 0x016561 05:A551: 20 41 B6  JSR sub_B641
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016564 05:A554: 68        PLA
bra_A555:  ; orig: bra_A555:
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x016565 05:A555: C9 04     CMP #$04
    BCC     bra_A5A5             ; BCC  ; orig: C - - - - - 0x016567 05:A557: 90 4C     BCC bra_A5A5
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x016569 05:A559: 38        SEC
    SUBX.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x01656A 05:A55A: E9 03     SBC #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01656C 05:A55C: A8        TAY
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x01656D 05:A55D: C0 03     CPY #$03
    BCC     bra_A562             ; BCC  ; orig: C - - - - - 0x01656F 05:A55F: 90 01     BCC bra_A562
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x016571 05:A561: 88        DEY
bra_A562:  ; orig: bra_A562:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016572 05:A562: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016573 05:A563: 48        PHA
    BSR     sub_A5B4             ; JSR -> BSR  ; orig: C - - - - - 0x016574 05:A564: 20 B4 A5  JSR sub_A5B4
    MOVE.B  ram_0006_t12,D0  ; orig: C - - - - - 0x016577 05:A567: A5 06     LDA ram_0006_t12
    BNE     bra_A576             ; BNE  ; orig: C - - - - - 0x016579 05:A569: D0 0B     BNE bra_A576
    MOVE.B  tbl_A4EA(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01657B 05:A56B: BD EA A4  LDA tbl_A4EA,X
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01657E 05:A56E: 20 76 72  JSR sub_bat_7276_inc
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x016581 05:A571: A9 06     LDA #$06
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016583 05:A573: 20 82 72  JSR sub_bat_7282_inc
bra_A576:  ; orig: bra_A576:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016586 05:A576: A0 00     LDY #$00
    MOVE.B  tbl_A4EE_loop_counter(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016588 05:A578: BD EE A4  LDA tbl_A4EE_loop_co
    MOVE.B  D0,ram_0005_t05_loop_counter  ; orig: C - - - - - 0x01658B 05:A57B: 85 05     STA ram_0005_t05_loo
bra_A57D_loop:  ; orig: bra_A57D_loop:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01658D 05:A57D: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01658E 05:A57E: 48        PHA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01658F 05:A57F: AA        TAX
    MOVE.B  tbl_A4F2(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016590 05:A580: BD F2 A4  LDA tbl_A4F2,X
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016593 05:A583: AA        TAX
bra_A584_loop:  ; orig: bra_A584_loop:
    MOVEA.W ($FF0000+ram_0002_t05_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016594 05:A584: B1 02     LDA (ram_0002_t05_da
    MOVEA.W ($FF0000+ram_0000_t0E_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016596 05:A586: 91 00     STA (ram_0000_t0E_da
    BSR     sub_bat_7280_inc_0002_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x016598 05:A588: 20 80 72  JSR sub_bat_7280_inc
    MOVE.B  tbl_A4E7(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01659B 05:A58B: BD E7 A4  LDA tbl_A4E7,X
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01659E 05:A58E: 20 76 72  JSR sub_bat_7276_inc
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x0165A1 05:A591: E0 00     CPX #$00
    BNE     bra_A59E             ; BNE  ; orig: C - - - - - 0x0165A3 05:A593: D0 09     BNE bra_A59E
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0165A5 05:A595: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0165A6 05:A596: 48        PHA
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x0165A7 05:A597: C9 02     CMP #$02
    BCS     bra_A59E             ; BCS  ; orig: C - - - - - 0x0165A9 05:A599: B0 03     BCS bra_A59E
    BSR     sub_bat_7274_inc_0000_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x0165AB 05:A59B: 20 74 72  JSR sub_bat_7274_inc
bra_A59E:  ; orig: bra_A59E:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0165AE 05:A59E: CA        DEX
    BPL     bra_A584_loop             ; BPL  ; orig: C - - - - - 0x0165AF 05:A59F: 10 E3     BPL bra_A584_loop
    SUBQ.B  #1,ram_0005_t05_loop_counter  ; orig: C - - - - - 0x0165B1 05:A5A1: C6 05     DEC ram_0005_t05_loo
    BNE     bra_A57D_loop             ; BNE  ; orig: C - - - - - 0x0165B3 05:A5A3: D0 D8     BNE bra_A57D_loop
bra_A5A5:  ; orig: bra_A5A5:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0165B5 05:A5A5: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0165B6 05:A5A6: AA        TAX
    SUBQ.B  #1,ram_0006_t12  ; orig: C - - - - - 0x0165B7 05:A5A7: C6 06     DEC ram_0006_t12
    BMI     bra_A5AE             ; BMI  ; orig: C - - - - - 0x0165B9 05:A5A9: 30 03     BMI bra_A5AE
    JMP     loc_A4FC  ; orig: C - - - - - 0x0165BB 05:A5AB: 4C FC A4  JMP loc_A4FC
bra_A5AE:  ; orig: bra_A5AE:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0165BE 05:A5AE: CA        DEX
    BMI     bra_A5D4_RTS             ; BMI  ; orig: C - - - - - 0x0165BF 05:A5AF: 30 23     BMI bra_A5D4_RTS
    JMP     loc_A4F8  ; orig: C - - - - - 0x0165C1 05:A5B1: 4C F8 A4  JMP loc_A4F8



sub_A5B4:  ; orig: sub_A5B4:

; in

; A =

; Y =

; out

; ram_0000_t0E_data

; ram_0002_t05_data
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0165C4 05:A5B4: AA        TAX
    MOVE.B  tbl_A4D7(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0165C5 05:A5B5: BD D7 A4  LDA tbl_A4D7,X
    MOVE.B  D0,ram_0002_t05_data  ; orig: C - - - - - 0x0165C8 05:A5B8: 85 02     STA ram_0002_t05_dat
    MOVE.B  tbl_A4DB(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0165CA 05:A5BA: BD DB A4  LDA tbl_A4DB,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x0165CD 05:A5BD: 85 03     STA ram_0002_t05_dat
    MOVE.B  tbl_A4DF(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0165CF 05:A5BF: BD DF A4  LDA tbl_A4DF,X
    MOVE.B  D0,ram_0000_t0E_data  ; orig: C - - - - - 0x0165D2 05:A5C2: 85 00     STA ram_0000_t0E_dat
    MOVE.B  tbl_A4E3(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0165D4 05:A5C4: BD E3 A4  LDA tbl_A4E3,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x0165D7 05:A5C7: 85 01     STA ram_0000_t0E_dat
loc_A5C9_loop:  ; orig: loc_A5C9_loop:
    SUBQ.B  #1,D2           ; DEY  ; orig: C D 1 - - - 0x0165D9 05:A5C9: 88        DEY
    BEQ     bra_A5D4_RTS             ; BEQ  ; orig: C - - - - - 0x0165DA 05:A5CA: F0 08     BEQ bra_A5D4_RTS
    MOVE.B  #$0C,D0  ; orig: C - - - - - 0x0165DC 05:A5CC: A9 0C     LDA #$0C
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x0165DE 05:A5CE: 20 82 72  JSR sub_bat_7282_inc
    JMP     loc_A5C9_loop  ; orig: C - - - - - 0x0165E1 05:A5D1: 4C C9 A5  JMP loc_A5C9_loop
bra_A5D4_RTS:  ; orig: bra_A5D4_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0165E4 05:A5D4: 60        RTS



tbl_A5D5:  ; orig: tbl_A5D5:
tbl__A5D5:  ; orig: tbl__A5D5:
off_A5D5_00:  ; orig: off_A5D5_00:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x0165E5 05:A5D5: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0165E6 05:A5D6: 03        .byte $03   ; 01
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x0165E7 05:A5D7: 06        .byte $06   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x0165E8 05:A5D8: 08        .byte $08   ; 03

off_A5D9_01:  ; orig: off_A5D9_01:
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0165E9 05:A5D9: 03        .byte $03   ; 00
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x0165EA 05:A5DA: 05        .byte $05   ; 01
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x0165EB 05:A5DB: 08        .byte $08   ; 02
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - - - 0x0165EC 05:A5DC: 0A        .byte $0A   ; 03

off_A5DD_02:  ; orig: off_A5DD_02:
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0165ED 05:A5DD: 03        .byte $03   ; 00
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x0165EE 05:A5DE: 06        .byte $06   ; 01

off_A5DF_03:  ; orig: off_A5DF_03:
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x0165EF 05:A5DF: 04        .byte $04   ; 00
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - - - 0x0165F0 05:A5E0: 07        .byte $07   ; 01
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x0165F1 05:A5E1: 05        .byte $05   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x0165F2 05:A5E2: 08        .byte $08   ; 03



tbl_A5E3:  ; orig: tbl_A5E3:
    ; [DIRECTIVE] .BYTE off_A5D5_00 - tbl__A5D5  -- needs manual handling  ; orig: - D 1 - - - 0x0165F3 05:A5E3: 00        .byte off_A5D5_00 - 
    ; [DIRECTIVE] .BYTE off_A5D9_01 - tbl__A5D5  -- needs manual handling  ; orig: - D 1 - - - 0x0165F4 05:A5E4: 04        .byte off_A5D9_01 - 
    ; [DIRECTIVE] .BYTE off_A5DD_02 - tbl__A5D5  -- needs manual handling  ; orig: - D 1 - - - 0x0165F5 05:A5E5: 08        .byte off_A5DD_02 - 
    ; [DIRECTIVE] .BYTE off_A5DF_03 - tbl__A5D5  -- needs manual handling  ; orig: - D 1 - - - 0x0165F6 05:A5E6: 0A        .byte off_A5DF_03 - 



tbl_A5E7_ppu_addr_hi:  ; orig: tbl_A5E7_ppu_addr_hi:
    ; [DIRECTIVE] .BYTE > $225C  -- needs manual handling  ; orig: - D 1 - - - 0x0165F7 05:A5E7: 22        .byte > $225C   ; 00
    ; [DIRECTIVE] .BYTE > $2242  -- needs manual handling  ; orig: - D 1 - - - 0x0165F8 05:A5E8: 22        .byte > $2242   ; 01
    ; [DIRECTIVE] .BYTE > $234F  -- needs manual handling  ; orig: - D 1 - - - 0x0165F9 05:A5E9: 23        .byte > $234F   ; 02
    ; [DIRECTIVE] .BYTE > $214F  -- needs manual handling  ; orig: - D 1 - - - 0x0165FA 05:A5EA: 21        .byte > $214F   ; 03



tbl_A5EB_ppu_addr_lo:  ; orig: tbl_A5EB_ppu_addr_lo:
    ; [DIRECTIVE] .BYTE < $225C  -- needs manual handling  ; orig: - D 1 - - - 0x0165FB 05:A5EB: 5C        .byte < $225C   ; 00
    ; [DIRECTIVE] .BYTE < $2242  -- needs manual handling  ; orig: - D 1 - - - 0x0165FC 05:A5EC: 42        .byte < $2242   ; 01
    ; [DIRECTIVE] .BYTE < $234F  -- needs manual handling  ; orig: - D 1 - - - 0x0165FD 05:A5ED: 4F        .byte < $234F   ; 02
    ; [DIRECTIVE] .BYTE < $214F  -- needs manual handling  ; orig: - D 1 - - - 0x0165FE 05:A5EE: 4F        .byte < $214F   ; 03



tbl_A5EF:  ; orig: tbl_A5EF:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x0165FF 05:A5EF: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x016600 05:A5F0: FF        .byte $FF   ; 01
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x016601 05:A5F1: 10        .byte $10   ; 02
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - - - 0x016602 05:A5F2: F0        .byte $F0   ; 03



sub_0x016603:  ; orig: sub_0x016603:
    MOVE.B  ram_script,D0  ; orig: C - - - - - 0x016603 05:A5F3: A5 12     LDA ram_script
    CMPI.B  #con_script_triforce_collected,D0  ; orig: C - - - - - 0x016605 05:A5F5: C9 12     CMP #con_script_trif
    BEQ     bra_A5D4_RTS             ; BEQ  ; orig: C - - - - - 0x016607 05:A5F7: F0 DB     BEQ bra_A5D4_RTS
    MOVE.B  ram_0027_timer,D0  ; orig: C - - - - - 0x016609 05:A5F9: A5 27     LDA ram_0027_timer
    BNE     bra_A5D4_RTS             ; BNE  ; orig: C - - - - - 0x01660B 05:A5FB: D0 D7     BNE bra_A5D4_RTS
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x01660D 05:A5FD: A5 54     LDA ram_0054_timer
    BEQ     bra_A5D4_RTS             ; BEQ  ; orig: C - - - - - 0x01660F 05:A5FF: F0 D3     BEQ bra_A5D4_RTS
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x016611 05:A601: 29 07     AND #$07
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x016613 05:A603: A0 01     LDY #$01
    MOVE.B  D2,ram_0002_t41  ; orig: C - - - - - 0x016615 05:A605: 84 02     STY ram_0002_t41
    BTST    D0,ram_0002_t41  ; BIT abs  ; orig: C - - - - - 0x016617 05:A607: 24 02     BIT ram_0002_t41
    BEQ     bra_A60C             ; BEQ  ; orig: C - - - - - 0x016619 05:A609: F0 01     BEQ bra_A60C
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01661B 05:A60B: 4A        LSR
bra_A60C:  ; orig: bra_A60C:
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01661C 05:A60C: C9 02     CMP #$02
    BNE     bra_A614             ; BNE  ; orig: C - - - - - 0x01661E 05:A60E: D0 04     BNE bra_A614
    MOVE.B  #$30,D2  ; orig: C - - - - - 0x016620 05:A610: A0 30     LDY #$30
    MOVE.B  D2,ram_timer_link  ; orig: C - - - - - 0x016622 05:A612: 84 28     STY ram_timer_link
bra_A614:  ; orig: bra_A614:
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x016624 05:A614: 29 03     AND #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x016626 05:A616: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x016627 05:A617: E9 01     SBC #$01
    ANDI.B  #$02,D0  ; orig: C - - - - - 0x016629 05:A619: 29 02     AND #$02
    MOVE.B  D0,ram_0008_t06  ; orig: C - - - - - 0x01662B 05:A61B: 85 08     STA ram_0008_t06
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x01662D 05:A61D: A5 54     LDA ram_0054_timer
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x01662F 05:A61F: C9 05     CMP #$05
    BCS     bra_A631             ; BCS  ; orig: C - - - - - 0x016631 05:A621: B0 0E     BCS bra_A631
    MOVE.B  ram_0055_direction,D0  ; orig: C - - - - - 0x016633 05:A623: A5 55     LDA ram_0055_directi
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x016635 05:A625: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x016637 05:A627: 20 F6 A3  JSR sub_A3F6
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x01663A 05:A62A: C9 07     CMP #$07
    BEQ     bra_A631             ; BEQ  ; orig: C - - - - - 0x01663C 05:A62C: F0 03     BEQ bra_A631
    JMP     loc_A682  ; orig: C - - - - - 0x01663E 05:A62E: 4C 82 A6  JMP loc_A682
bra_A631:  ; orig: bra_A631:
    BSR     sub_A6B1             ; JSR -> BSR  ; orig: C - - - - - 0x016641 05:A631: 20 B1 A6  JSR sub_A6B1
bra_A634_loop:  ; orig: bra_A634_loop:
    MOVE.B  ram_0006_t13,D0  ; orig: C - - - - - 0x016644 05:A634: A5 06     LDA ram_0006_t13
    MOVE.B  D0,ram_0004_t19  ; orig: C - - - - - 0x016646 05:A636: 85 04     STA ram_0004_t19
    MOVE.B  ram_0000_t68_ppu_addr_hi,D0  ; orig: C - - - - - 0x016648 05:A638: A5 00     LDA ram_0000_t68_ppu
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01664A 05:A63A: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01664D 05:A63D: E8        INX
    MOVE.B  ram_0001_t14_ppu_addr_lo,D0  ; orig: C - - - - - 0x01664E 05:A63E: A5 01     LDA ram_0001_t14_ppu
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x016650 05:A640: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016653 05:A643: E8        INX
    MOVE.B  ram_0006_t13,D0  ; orig: C - - - - - 0x016654 05:A644: A5 06     LDA ram_0006_t13
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x016656 05:A646: 9D 02 03  STA ram_0302_ppu_buf
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016659 05:A649: E8        INX
bra_A64A_loop:  ; orig: bra_A64A_loop:
    BSR     sub_9400             ; JSR -> BSR  ; orig: C - - - - - 0x01665A 05:A64A: 20 00 94  JSR sub_9400
    BNE     bra_A64A_loop             ; BNE  ; orig: C - - - - - 0x01665D 05:A64D: D0 FB     BNE bra_A64A_loop
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01665F 05:A64F: A9 20     LDA #$20
    OR.B    ram_0001_t14_ppu_addr_lo,D0  ; orig: C - - - - - 0x016661 05:A651: 05 01     ORA ram_0001_t14_ppu
    MOVE.B  D0,ram_0001_t14_ppu_addr_lo  ; orig: C - - - - - 0x016663 05:A653: 85 01     STA ram_0001_t14_ppu
    SUBQ.B  #1,ram_0005_t06_loop_counter  ; orig: C - - - - - 0x016665 05:A655: C6 05     DEC ram_0005_t06_loo
    BNE     bra_A634_loop             ; BNE  ; orig: C - - - - - 0x016667 05:A657: D0 DB     BNE bra_A634_loop
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x016669 05:A659: A9 FF     LDA #$FF
    MOVE.B  D0,ram_0302_ppu_buffer(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01666B 05:A65B: 9D 02 03  STA ram_0302_ppu_buf
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01666E 05:A65E: 8A        TXA
    MOVE.B  D0,ram_0301_buffer_index  ; orig: C - - - - - 0x01666F 05:A65F: 8D 01 03  STA ram_0301_buffer_
    ADDQ.B  #1,ram_0054_timer  ; orig: C - - - - - 0x016672 05:A662: E6 54     INC ram_0054_timer
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x016674 05:A664: A5 54     LDA ram_0054_timer
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x016676 05:A666: 29 03     AND #$03
    BEQ     bra_A66F             ; BEQ  ; orig: C - - - - - 0x016678 05:A668: F0 05     BEQ bra_A66F
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01667A 05:A66A: A9 08     LDA #$08
    MOVE.B  D0,ram_0027_timer  ; orig: C - - - - - 0x01667C 05:A66C: 85 27     STA ram_0027_timer
    RTS                     ; RTS  ; orig: C - - - - - 0x01667E 05:A66E: 60        RTS
bra_A66F:  ; orig: bra_A66F:
    MOVE.B  ram_0054_timer,D0  ; orig: C - - - - - 0x01667F 05:A66F: A5 54     LDA ram_0054_timer
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x016681 05:A671: C9 04     CMP #$04
    BNE     bra_A689             ; BNE  ; orig: C - - - - - 0x016683 05:A673: D0 14     BNE bra_A689
    MOVE.B  ram_0009_t01,D1  ; orig: C - - - - - 0x016685 05:A675: A6 09     LDX ram_0009_t01
    BSR     sub_8AA0             ; JSR -> BSR  ; orig: C - - - - - 0x016687 05:A677: 20 A0 8A  JSR sub_8AA0
    MOVE.B  ram_0055_direction,D0  ; orig: C - - - - - 0x01668A 05:A67A: A5 55     LDA ram_0055_directi
    EORI.B  #$0F,D0  ; orig: C - - - - - 0x01668C 05:A67C: 49 0F     EOR #$0F
    AND.B   ram_00EE,D0  ; orig: C - - - - - 0x01668E 05:A67E: 25 EE     AND ram_00EE
loc_A680:  ; orig: loc_A680:
    MOVE.B  D0,ram_00EE  ; orig: C D 1 - - - 0x016690 05:A680: 85 EE     STA ram_00EE
loc_A682:  ; orig: loc_A682:
    MOVE.B  #$00,D0  ; orig: C D 1 - - - 0x016692 05:A682: A9 00     LDA #$00
    MOVE.B  D0,ram_0054_timer  ; orig: C - - - - - 0x016694 05:A684: 85 54     STA ram_0054_timer
    JMP     loc_A4F6  ; orig: C - - - - - 0x016696 05:A686: 4C F6 A4  JMP loc_A4F6
bra_A689:  ; orig: bra_A689:
    MOVE.B  ram_0055_direction,D0  ; orig: C - - - - - 0x016699 05:A689: A5 55     LDA ram_0055_directi
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x01669B 05:A68B: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x01669D 05:A68D: 20 F6 A3  JSR sub_A3F6
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x0166A0 05:A690: C9 07     CMP #$07
    BEQ     bra_A6AA             ; BEQ  ; orig: C - - - - - 0x0166A2 05:A692: F0 16     BEQ bra_A6AA
    MOVE.B  ram_0009_t01,D1  ; orig: C - - - - - 0x0166A4 05:A694: A6 09     LDX ram_0009_t01
    BSR     sub_8A97             ; JSR -> BSR  ; orig: C - - - - - 0x0166A6 05:A696: 20 97 8A  JSR sub_8A97
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0166A9 05:A699: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0166AA 05:A69A: 18        CLC
    ; !! ADC tbl_A5EF,X - complex mode, manual review needed  ; orig: C - - - - - 0x0166AB 05:A69B: 7D EF A5  ADC tbl_A5EF,X
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0166AE 05:A69E: A8        TAY
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0166AF 05:A69F: 8A        TXA
    EORI.B  #$01,D0  ; orig: C - - - - - 0x0166B0 05:A6A0: 49 01     EOR #$01
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0166B2 05:A6A2: AA        TAX
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0166B3 05:A6A3: B1 00     LDA (ram_0000_t13_da
    ; !! ORA tbl_0x01E6CE_8_bits,X - needs manual review  ; orig: C - - - - - 0x0166B5 05:A6A5: 1D BE E6  ORA tbl_0x01E6CE_8_b
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0166B8 05:A6A8: 91 00     STA (ram_0000_t13_da
bra_A6AA:  ; orig: bra_A6AA:
    MOVE.B  ram_0055_direction,D0  ; orig: C - - - - - 0x0166BA 05:A6AA: A5 55     LDA ram_0055_directi
    OR.B    ram_00EE,D0  ; orig: C - - - - - 0x0166BC 05:A6AC: 05 EE     ORA ram_00EE
    JMP     loc_A680  ; orig: C - - - - - 0x0166BE 05:A6AE: 4C 80 A6  JMP loc_A680



sub_A6B1:  ; orig: sub_A6B1:

; out

; ram_0000_t68_ppu_addr_hi

; ram_0001_t14_ppu_addr_lo
    MOVE.B  ram_0055_direction,D0  ; orig: C - - - - - 0x0166C1 05:A6B1: A5 55     LDA ram_0055_directi
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x0166C3 05:A6B3: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x0166C5 05:A6B5: 20 F6 A3  JSR sub_A3F6
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x0166C8 05:A6B8: C9 05     CMP #$05
    BCC     bra_A6C3             ; BCC  ; orig: C - - - - - 0x0166CA 05:A6BA: 90 07     BCC bra_A6C3
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0166CC 05:A6BC: 48        PHA
    MOVE.B  #con_sfx_1_door,D0  ; orig: C - - - - - 0x0166CD 05:A6BD: A9 04     LDA #con_sfx_1_door
    BSR     sub_bat_6D7C_set_sfx_1             ; JSR -> BSR  ; orig: C - - - - - 0x0166CF 05:A6BF: 20 7C 6D  JSR sub_bat_6D7C_set
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0166D2 05:A6C2: 68        PLA
bra_A6C3:  ; orig: bra_A6C3:
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x0166D3 05:A6C3: C9 04     CMP #$04
    BNE     bra_A6C9             ; BNE  ; orig: C - - - - - 0x0166D5 05:A6C5: D0 02     BNE bra_A6C9
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x0166D7 05:A6C7: A9 08     LDA #$08
bra_A6C9:  ; orig: bra_A6C9:
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x0166D9 05:A6C9: C9 01     CMP #$01
    BNE     bra_A6CF             ; BNE  ; orig: C - - - - - 0x0166DB 05:A6CB: D0 02     BNE bra_A6CF
    MOVE.B  #$04,D0  ; orig: - - - - - - 0x0166DD 05:A6CD: A9 04     LDA #$04
bra_A6CF:  ; orig: bra_A6CF:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0166DF 05:A6CF: 38        SEC
    SUBX.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x0166E0 05:A6D0: E9 03     SBC #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0166E2 05:A6D2: A8        TAY
    MOVE.B  ram_0008_t06,D0  ; orig: C - - - - - 0x0166E3 05:A6D3: A5 08     LDA ram_0008_t06
    BEQ     bra_A6DD             ; BEQ  ; orig: C - - - - - 0x0166E5 05:A6D5: F0 06     BEQ bra_A6DD
    CMPI.B  #$05,D2  ; orig: C - - - - - 0x0166E7 05:A6D7: C0 05     CPY #$05
    BEQ     bra_A6E2             ; BEQ  ; orig: C - - - - - 0x0166E9 05:A6D9: F0 07     BEQ bra_A6E2
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x0166EB 05:A6DB: A0 01     LDY #$01
bra_A6DD:  ; orig: bra_A6DD:
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x0166ED 05:A6DD: C0 03     CPY #$03
    BCC     bra_A6E2             ; BCC  ; orig: C - - - - - 0x0166EF 05:A6DF: 90 01     BCC bra_A6E2
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0166F1 05:A6E1: 88        DEY
bra_A6E2:  ; orig: bra_A6E2:
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x0166F2 05:A6E2: A9 03     LDA #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0166F4 05:A6E4: 38        SEC
    SUBX.B  ram_0003_t01_loop_counter,D0  ; orig: C - - - - - 0x0166F5 05:A6E5: E5 03     SBC ram_0003_t01_loo
    BSR     sub_A5B4             ; JSR -> BSR  ; orig: C - - - - - 0x0166F7 05:A6E7: 20 B4 A5  JSR sub_A5B4
    MOVE.B  tbl_A5E7_ppu_addr_hi(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0166FA 05:A6EA: BD E7 A5  LDA tbl_A5E7_ppu_add
    MOVE.B  D0,ram_0000_t68_ppu_addr_hi  ; orig: C - - - - - 0x0166FD 05:A6ED: 85 00     STA ram_0000_t68_ppu
    MOVE.B  tbl_A5EB_ppu_addr_lo(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0166FF 05:A6EF: BD EB A5  LDA tbl_A5EB_ppu_add
    MOVE.B  D0,ram_0001_t14_ppu_addr_lo  ; orig: C - - - - - 0x016702 05:A6F2: 85 01     STA ram_0001_t14_ppu
    MOVE.B  D1,ram_0009_t01  ; orig: C - - - - - 0x016704 05:A6F4: 86 09     STX ram_0009_t01
    MOVE.B  ram_0301_buffer_index,D1  ; orig: C - - - - - 0x016706 05:A6F6: AE 01 03  LDX ram_0301_buffer_
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016709 05:A6F9: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t08  ; orig: C - - - - - 0x01670B 05:A6FB: 85 07     STA ram_0007_t08
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01670D 05:A6FD: A9 02     LDA #$02
    MOVE.B  D0,ram_0006_t13  ; orig: C - - - - - 0x01670F 05:A6FF: 85 06     STA ram_0006_t13
    MOVE.B  D0,ram_0005_t06_loop_counter  ; orig: C - - - - - 0x016711 05:A701: 85 05     STA ram_0005_t06_loo
    RTS                     ; RTS  ; orig: C - - - - - 0x016713 05:A703: 60        RTS



tbl_A704:  ; orig: tbl_A704:
    ; [DIRECTIVE] .WORD _off008_A2D6_00  -- needs manual handling  ; orig: - D 1 - - - 0x016714 05:A704: D6 A2     .word _off008_A2D6_0
    ; [DIRECTIVE] .WORD _off008_A2E6_10  -- needs manual handling  ; orig: - D 1 - - - 0x016716 05:A706: E6 A2     .word _off008_A2E6_1
    ; [DIRECTIVE] .WORD _off008_A304_20  -- needs manual handling  ; orig: - D 1 - - - 0x016718 05:A708: 04 A3     .word _off008_A304_2
    ; [DIRECTIVE] .WORD _off008_A315_30  -- needs manual handling  ; orig: - D 1 - - - 0x01671A 05:A70A: 15 A3     .word _off008_A315_3
    ; [DIRECTIVE] .WORD _off008_A326_40  -- needs manual handling  ; orig: - D 1 - - - 0x01671C 05:A70C: 26 A3     .word _off008_A326_4
    ; [DIRECTIVE] .WORD _off008_A33D_50  -- needs manual handling  ; orig: - D 1 - - - 0x01671E 05:A70E: 3D A3     .word _off008_A33D_5
    ; [DIRECTIVE] .WORD _off008_A354_60  -- needs manual handling  ; orig: - D 1 - - - 0x016720 05:A710: 54 A3     .word _off008_A354_6
    ; [DIRECTIVE] .WORD _off008_A365_70  -- needs manual handling  ; orig: - D 1 - - - 0x016722 05:A712: 65 A3     .word _off008_A365_7
    ; [DIRECTIVE] .WORD _off008_A377_80  -- needs manual handling  ; orig: - D 1 - - - 0x016724 05:A714: 77 A3     .word _off008_A377_8
    ; [DIRECTIVE] .WORD _off008_A391_90  -- needs manual handling  ; orig: - D 1 - - - 0x016726 05:A716: 91 A3     .word _off008_A391_9



tbl_A718:  ; orig: tbl_A718:
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x016728 05:A718: B0        .byte $B0   ; 00
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - - - 0x016729 05:A719: 74        .byte $74   ; 01
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - - - 0x01672A 05:A71A: 94        .byte $94   ; 02
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - - - 0x01672B 05:A71B: B4        .byte $B4   ; 03
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - - - 0x01672C 05:A71C: 70        .byte $70   ; 04
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - - - 0x01672D 05:A71D: 68        .byte $68   ; 05
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 1 - - - 0x01672E 05:A71E: F4        .byte $F4   ; 06
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - - - 0x01672F 05:A71F: 24        .byte $24   ; 07



loc_A720:  ; orig: loc_A720:
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C D 1 - - - 0x016730 05:A720: 20 5A E8  JSR sub_0x01E86A_get
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016733 05:A723: 48        PHA
    MOVE.B  #< tbl_A0DE,D0  ; orig: C - - - - - 0x016734 05:A724: A9 DE     LDA #< tbl_A0DE
    MOVE.B  D0,ram_0002_t08_data  ; orig: C - - - - - 0x016736 05:A726: 85 02     STA ram_0002_t08_dat
    MOVE.B  #> tbl_A0DE,D0  ; orig: C - - - - - 0x016738 05:A728: A9 A0     LDA #> tbl_A0DE
    ; (empty translation for STA)  ; orig: C - - - - - 0x01673A 05:A72A: 85 03     STA ram_0002_t08_dat
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01673C 05:A72C: 68        PLA

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01673D 05:A72D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01673E 05:A72E: 0A        ASL
    MOVE.B  D0,ram_0000_t69  ; orig: C - - - - - 0x01673F 05:A72F: 85 00     STA ram_0000_t69

; * 03
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016741 05:A731: 20 82 72  JSR sub_bat_7282_inc
    MOVE.B  ram_0000_t69,D0  ; orig: C - - - - - 0x016744 05:A734: A5 00     LDA ram_0000_t69
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016746 05:A736: 20 82 72  JSR sub_bat_7282_inc
    MOVE.B  ram_0000_t69,D0  ; orig: C - - - - - 0x016749 05:A739: A5 00     LDA ram_0000_t69
    BSR     sub_bat_7282_inc_0002_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01674B 05:A73B: 20 82 72  JSR sub_bat_7282_inc
    MOVE.B  #< ram_658C,D0  ; orig: C - - - - - 0x01674E 05:A73E: A9 8C     LDA #< ram_658C
    MOVE.B  D0,ram_0000_t16_block_data  ; orig: C - - - - - 0x016750 05:A740: 85 00     STA ram_0000_t16_blo
    MOVE.B  #> ram_658C,D0  ; orig: C - - - - - 0x016752 05:A742: A9 65     LDA #> ram_658C
    ; (empty translation for STA)  ; orig: C - - - - - 0x016754 05:A744: 85 01     STA ram_0000_t16_blo
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016756 05:A746: A0 00     LDY #$00
    MOVE.B  D2,ram_0006_t07  ; orig: C - - - - - 0x016758 05:A748: 84 06     STY ram_0006_t07
loc_A74A_loop:  ; orig: loc_A74A_loop:
    MOVE.B  ram_0006_t07,D2  ; orig: C D 1 - - - 0x01675A 05:A74A: A4 06     LDY ram_0006_t07
    MOVEA.W ($FF0000+ram_0002_t08_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01675C 05:A74C: B1 02     LDA (ram_0002_t08_da
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01675E 05:A74E: 29 F0     AND #$F0

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016760 05:A750: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016761 05:A751: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016762 05:A752: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016763 05:A753: AA        TAX
    MOVE.B  tbl_A704(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016764 05:A754: BD 04 A7  LDA tbl_A704,X
    MOVE.B  D0,ram_0004_t06_data  ; orig: C - - - - - 0x016767 05:A757: 85 04     STA ram_0004_t06_dat
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016769 05:A759: BD 05 A7  LDA tbl_A704 + $01,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x01676C 05:A75C: 85 05     STA ram_0004_t06_dat
    MOVEA.W ($FF0000+ram_0002_t08_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01676E 05:A75E: B1 02     LDA (ram_0002_t08_da
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x016770 05:A760: 29 0F     AND #$0F
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016772 05:A762: AA        TAX
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016773 05:A763: A0 00     LDY #$00
loc_A765_loop:  ; orig: loc_A765_loop:
    MOVEA.W ($FF0000+ram_0004_t06_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C D 1 - - - 0x016775 05:A765: B1 04     LDA (ram_0004_t06_da
    BPL     bra_A76C_00_7F             ; BPL  ; orig: C - - - - - 0x016777 05:A767: 10 03     BPL bra_A76C_00_7F

; 80-FF
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x016779 05:A769: CA        DEX
    BMI     bra_A770             ; BMI  ; orig: C - - - - - 0x01677A 05:A76A: 30 04     BMI bra_A770
bra_A76C_00_7F:  ; orig: bra_A76C_00_7F:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01677C 05:A76C: C8        INY
    JMP     loc_A765_loop  ; orig: C - - - - - 0x01677D 05:A76D: 4C 65 A7  JMP loc_A765_loop
bra_A770:  ; orig: bra_A770:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016780 05:A770: 98        TYA
    BSR     sub_bat_728E_inc_0004_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016781 05:A771: 20 8E 72  JSR sub_bat_728E_inc
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016784 05:A774: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t02  ; orig: C - - - - - 0x016786 05:A776: 85 07     STA ram_0007_t02
    MOVE.B  D0,ram_0008_t05  ; orig: C - - - - - 0x016788 05:A778: 85 08     STA ram_0008_t05
bra_A77A_loop:  ; orig: bra_A77A_loop:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01678A 05:A77A: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_0004_t06_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01678C 05:A77C: B1 04     LDA (ram_0004_t06_da
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01678E 05:A77E: 29 07     AND #$07
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016790 05:A780: AA        TAX
    MOVE.B  tbl_A718(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016791 05:A781: BD 18 A7  LDA tbl_A718,X
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016794 05:A784: A0 00     LDY #$00
    BSR     sub_A7C1_write_2x2_block             ; JSR -> BSR  ; orig: C - - - - - 0x016796 05:A786: 20 C1 A7  JSR sub_A7C1_write_2
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x016799 05:A789: A9 02     LDA #$02
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x01679B 05:A78B: 20 76 72  JSR sub_bat_7276_inc
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01679E 05:A78E: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_0004_t06_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x0167A0 05:A790: B1 04     LDA (ram_0004_t06_da
    ANDI.B  #$70,D0  ; orig: C - - - - - 0x0167A2 05:A792: 29 70     AND #$70

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0167A4 05:A794: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0167A5 05:A795: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0167A6 05:A796: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0167A7 05:A797: 4A        LSR
    CMP.B   ram_0008_t05,D0  ; orig: C - - - - - 0x0167A8 05:A798: C5 08     CMP ram_0008_t05
    BEQ     bra_A7A1             ; BEQ  ; orig: C - - - - - 0x0167AA 05:A79A: F0 05     BEQ bra_A7A1
    ADDQ.B  #1,ram_0008_t05  ; orig: C - - - - - 0x0167AC 05:A79C: E6 08     INC ram_0008_t05
    JMP     loc_A7A8  ; orig: C - - - - - 0x0167AE 05:A79E: 4C A8 A7  JMP loc_A7A8
bra_A7A1:  ; orig: bra_A7A1:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0167B1 05:A7A1: A9 00     LDA #$00
    MOVE.B  D0,ram_0008_t05  ; orig: C - - - - - 0x0167B3 05:A7A3: 85 08     STA ram_0008_t05
    BSR     sub_bat_728C_inc_0004_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x0167B5 05:A7A5: 20 8C 72  JSR sub_bat_728C_inc
loc_A7A8:  ; orig: loc_A7A8:
    ADDQ.B  #1,ram_0007_t02  ; orig: C D 1 - - - 0x0167B8 05:A7A8: E6 07     INC ram_0007_t02
    MOVE.B  ram_0007_t02,D0  ; orig: C - - - - - 0x0167BA 05:A7AA: A5 07     LDA ram_0007_t02
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x0167BC 05:A7AC: C9 07     CMP #$07
    BCC     bra_A77A_loop             ; BCC  ; orig: C - - - - - 0x0167BE 05:A7AE: 90 CA     BCC bra_A77A_loop
    MOVE.B  #$1E,D0  ; orig: C - - - - - 0x0167C0 05:A7B0: A9 1E     LDA #$1E
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x0167C2 05:A7B2: 20 76 72  JSR sub_bat_7276_inc
    ADDQ.B  #1,ram_0006_t07  ; orig: C - - - - - 0x0167C5 05:A7B5: E6 06     INC ram_0006_t07
    MOVE.B  ram_0006_t07,D0  ; orig: C - - - - - 0x0167C7 05:A7B7: A5 06     LDA ram_0006_t07
    CMPI.B  #$0C,D0  ; orig: C - - - - - 0x0167C9 05:A7B9: C9 0C     CMP #$0C
    BCS     bra_A7C0_RTS             ; BCS  ; orig: C - - - - - 0x0167CB 05:A7BB: B0 03     BCS bra_A7C0_RTS
    JMP     loc_A74A_loop  ; orig: C - - - - - 0x0167CD 05:A7BD: 4C 4A A7  JMP loc_A74A_loop
bra_A7C0_RTS:  ; orig: bra_A7C0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0167D0 05:A7C0: 60        RTS



sub_A7C1_write_2x2_block:  ; orig: sub_A7C1_write_2x2_block:

; bzk optimize, write LDY 00 here for readability
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x0167D1 05:A7C1: C9 70     CMP #$70
    BCC     bra_A7E0             ; BCC  ; orig: C - - - - - 0x0167D3 05:A7C3: 90 1B     BCC bra_A7E0    ; if
    CMPI.B  #$F3,D0  ; orig: C - - - - - 0x0167D5 05:A7C5: C9 F3     CMP #$F3
    BCS     bra_A7E0             ; BCS  ; orig: C - - - - - 0x0167D7 05:A7C7: B0 17     BCS bra_A7E0    ; if

; if 70-F2, write with 01 increase each time

; for example, if 70, then write

; 70 71

; 72 73
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0167D9 05:A7C9: AA        TAX
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167DA 05:A7CA: 91 00     STA (ram_0000_t16_bl
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0167DC 05:A7CC: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0167DD 05:A7CD: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0167DE 05:A7CE: 8A        TXA
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167DF 05:A7CF: 91 00     STA (ram_0000_t16_bl
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0167E1 05:A7D1: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0167E2 05:A7D2: 18        CLC
    ADDX.B  #$15,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0167E3 05:A7D3: 69 15     ADC #$15
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0167E5 05:A7D5: A8        TAY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0167E6 05:A7D6: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0167E7 05:A7D7: 8A        TXA
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167E8 05:A7D8: 91 00     STA (ram_0000_t16_bl
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0167EA 05:A7DA: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0167EB 05:A7DB: 8A        TXA
loc_A7DC:  ; orig: loc_A7DC:
    ADDQ.B  #1,D2           ; INY  ; orig: C D 1 - - - 0x0167EC 05:A7DC: C8        INY
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167ED 05:A7DD: 91 00     STA (ram_0000_t16_bl
    RTS                     ; RTS  ; orig: C - - - - - 0x0167EF 05:A7DF: 60        RTS
bra_A7E0:  ; orig: bra_A7E0:

; else, write the same tile each time

; for example, if F5, then write

; F5 F5

; F5 F5
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167F0 05:A7E0: 91 00     STA (ram_0000_t16_bl
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0167F2 05:A7E2: C8        INY
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167F3 05:A7E3: 91 00     STA (ram_0000_t16_bl
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0167F5 05:A7E5: 48        PHA
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0167F6 05:A7E6: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0167F7 05:A7E7: 18        CLC
    ADDX.B  #$15,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0167F8 05:A7E8: 69 15     ADC #$15
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0167FA 05:A7EA: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0167FB 05:A7EB: 68        PLA
    MOVEA.W ($FF0000+ram_0000_t16_block_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0167FC 05:A7EC: 91 00     STA (ram_0000_t16_bl

; bzk optimize, write INY + STA + RTS here
    JMP     loc_A7DC  ; orig: C - - - - - 0x0167FE 05:A7EE: 4C DC A7  JMP loc_A7DC



sub_A7F1:  ; orig: sub_A7F1:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016801 05:A7F1: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: C - - - - - 0x016803 05:A7F3: 85 B7     STA ram_state_obj + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x016805 05:A7F5: 85 A3     STA ram_dir_enemy + 
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x016807 05:A7F7: 20 5A E8  JSR sub_0x01E86A_get
    CMPI.B  #$21,D0  ; orig: C - - - - - 0x01680A 05:A7FA: C9 21     CMP #$21
    BNE     bra_A808             ; BNE  ; orig: C - - - - - 0x01680C 05:A7FC: D0 0A     BNE bra_A808
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x01680E 05:A7FE: A9 40     LDA #$40
    ; (empty translation for STA)  ; orig: - - - - - - 0x016810 05:A800: 85 7B     STA ram_pos_X_enemy 
    ASL.B   #1,D0           ; ASL A  ; orig: - - - - - - 0x016812 05:A802: 0A        ASL
    ; (empty translation for STA)  ; orig: - - - - - - 0x016813 05:A803: 85 8F     STA ram_pos_Y_enemy 
    JMP     loc_A82D  ; orig: - - - - - - 0x016815 05:A805: 4C 2D A8  JMP loc_A82D
bra_A808:  ; orig: bra_A808:
    MOVE.B  #$08,D1  ; orig: C - - - - - 0x016818 05:A808: A2 08     LDX #$08
    MOVE.B  #$0A,D2  ; orig: C - - - - - 0x01681A 05:A80A: A0 0A     LDY #$0A
bra_A80C_loop:  ; orig: bra_A80C_loop:
    MOVE.B  tbl_0x01E410_block_addresses(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01681C 05:A80C: BD 00 E4  LDA tbl_0x01E410_blo
    MOVE.B  D0,ram_0000_t0D_block_data  ; orig: C - - - - - 0x01681F 05:A80F: 85 00     STA ram_0000_t0D_blo
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016821 05:A811: BD 01 E4  LDA tbl_0x01E410_blo
    ; (empty translation for STA)  ; orig: C - - - - - 0x016824 05:A814: 85 01     STA ram_0000_t0D_blo
    MOVEA.W ($FF0000+ram_0000_t0D_block_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016826 05:A816: B1 00     LDA (ram_0000_t0D_bl
    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x016828 05:A818: C9 B0     CMP #$B0
    BEQ     bra_A824             ; BEQ  ; orig: C - - - - - 0x01682A 05:A81A: F0 08     BEQ bra_A824
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01682C 05:A81C: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01682D 05:A81D: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01682E 05:A81E: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01682F 05:A81F: E8        INX
    CMPI.B  #$34,D1  ; orig: C - - - - - 0x016830 05:A820: E0 34     CPX #$34
    BNE     bra_A80C_loop             ; BNE  ; orig: C - - - - - 0x016832 05:A822: D0 E8     BNE bra_A80C_loop
bra_A824:  ; orig: bra_A824:
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016834 05:A824: 8A        TXA

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016835 05:A825: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016836 05:A826: 0A        ASL
    ; (empty translation for STA)  ; orig: C - - - - - 0x016837 05:A827: 85 7B     STA ram_pos_X_enemy 
    MOVE.B  #$90,D0  ; orig: C - - - - - 0x016839 05:A829: A9 90     LDA #$90
    ; (empty translation for STA)  ; orig: C - - - - - 0x01683B 05:A82B: 85 8F     STA ram_pos_Y_enemy 
loc_A82D:  ; orig: loc_A82D:
    MOVE.B  #con_obj_id_68,D0  ; orig: C - - - - - 0x01683D 05:A82D: A9 68     LDA #con_obj_id_68
    ; (empty translation for STA)  ; orig: C - - - - - 0x01683F 05:A82F: 8D 5A 03  STA ram_obj_id_enemy
    RTS                     ; RTS  ; orig: C - - - - - 0x016842 05:A832: 60        RTS



ofs_main_script_1_0x016843_12_triforce_collected:  ; orig: ofs_main_script_1_0x016843_12_triforce_collected:

; con_script_triforce_collected
    MOVE.B  #con_music_triforce,D0  ; orig: C - - J - - 0x016843 05:A833: A9 04     LDA #con_music_trifo
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x016845 05:A835: 8D 00 06  STA ram_music
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x016848 05:A838: A9 20     LDA #$20
    MOVE.B  D0,ram_007C  ; orig: C - - - - - 0x01684A 05:A83A: 85 7C     STA ram_007C
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01684C 05:A83C: A9 01     LDA #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x01684E 05:A83E: 85 7D     STA ram_007C + $01
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x016850 05:A840: A9 30     LDA #$30
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x016852 05:A842: 85 28     STA ram_timer_link
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x016854 05:A844: A9 24     LDA #$24
    MOVE.B  D0,ram_000A_t05_tile  ; orig: C - - - - - 0x016856 05:A846: 85 0A     STA ram_000A_t05_til
    BSR     sub_0x01E8E8             ; JSR -> BSR  ; orig: C - - - - - 0x016858 05:A848: 20 D8 E8  JSR sub_0x01E8E8
    ADDQ.B  #1,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x01685B 05:A84B: E6 11     INC ram_0011_screen_
    BSR     sub_bat_6E1D             ; JSR -> BSR  ; orig: C - - - - - 0x01685D 05:A84D: 20 1D 6E  JSR sub_bat_6E1D
    MOVE.B  #con_drop_id_1B,D0  ; orig: C - - - - - 0x016860 05:A850: A9 1B     LDA #con_drop_id_1B
    MOVE.B  D0,ram_0505  ; orig: C - - - - - 0x016862 05:A852: 8D 05 05  STA ram_0505
    JMP     loc_0x01E81C  ; orig: C - - - - - 0x016865 05:A855: 4C 0C E8  JMP loc_0x01E81C



loc_0x016868:  ; orig: loc_0x016868:
    BSR     sub_bat_6E1D             ; JSR -> BSR  ; orig: C D 1 - - - 0x016868 05:A858: 20 1D 6E  JSR sub_bat_6E1D
    BSR     sub_0x01E827             ; JSR -> BSR  ; orig: C - - - - - 0x01686B 05:A85B: 20 17 E8  JSR sub_0x01E827
    MOVE.B  ram_subscript,D0  ; orig: C - - - - - 0x01686E 05:A85E: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x016870 05:A860: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_023_A86D_00  -- needs manual handling  ; orig: - D 1 - I - 0x016873 05:A863: 6D A8     .word ofs_023_A86D_0
    ; [DIRECTIVE] .WORD ofs_023_A877_01  -- needs manual handling  ; orig: - D 1 - I - 0x016875 05:A865: 77 A8     .word ofs_023_A877_0
    ; [DIRECTIVE] .WORD ofs_023_A88F_02  -- needs manual handling  ; orig: - D 1 - I - 0x016877 05:A867: 8F A8     .word ofs_023_A88F_0
    ; [DIRECTIVE] .WORD ofs_023_A897_03  -- needs manual handling  ; orig: - D 1 - I - 0x016879 05:A869: 97 A8     .word ofs_023_A897_0
    ; [DIRECTIVE] .WORD ofs_023_A8AB_04  -- needs manual handling  ; orig: - D 1 - I - 0x01687B 05:A86B: AB A8     .word ofs_023_A8AB_0



ofs_023_A86D_00:  ; orig: ofs_023_A86D_00:
    MOVE.B  ram_timer_link,D0  ; orig: C - - J - - 0x01687D 05:A86D: A5 28     LDA ram_timer_link
    BNE     bra_A887_RTS             ; BNE  ; orig: C - - - - - 0x01687F 05:A86F: D0 16     BNE bra_A887_RTS
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x016881 05:A871: A9 30     LDA #$30
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x016883 05:A873: 85 28     STA ram_timer_link
    BNE     bra_A88C             ; BNE  ; orig: C - - - - - 0x016885 05:A875: D0 15     BNE bra_A88C    ; jm
ofs_023_A877_01:  ; orig: ofs_023_A877_01:
    MOVE.B  #con_ppu_buf_overworld_palette,D2  ; orig: C - - J - - 0x016887 05:A877: A0 18     LDY #con_ppu_buf_ove
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x016889 05:A879: A5 28     LDA ram_timer_link
    BEQ     bra_A888             ; BEQ  ; orig: C - - - - - 0x01688B 05:A87B: F0 0B     BEQ bra_A888
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01688D 05:A87D: 29 07     AND #$07
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01688F 05:A87F: C9 04     CMP #$04
    BCC     bra_A885             ; BCC  ; orig: C - - - - - 0x016891 05:A881: 90 02     BCC bra_A885
    MOVE.B  #con_ppu_buf_78,D2  ; orig: C - - - - - 0x016893 05:A883: A0 78     LDY #con_ppu_buf_78
bra_A885:  ; orig: bra_A885:
    MOVE.B  D2,ram_ppu_load_index  ; orig: C - - - - - 0x016895 05:A885: 84 14     STY ram_ppu_load_ind
bra_A887_RTS:  ; orig: bra_A887_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x016897 05:A887: 60        RTS
bra_A888:  ; orig: bra_A888:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x016898 05:A888: A9 02     LDA #$02
    MOVE.B  D0,ram_0063  ; orig: C - - - - - 0x01689A 05:A88A: 85 63     STA ram_0063
bra_A88C:  ; orig: bra_A88C:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01689C 05:A88C: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x01689E 05:A88E: 60        RTS



ofs_023_A88F_02:  ; orig: ofs_023_A88F_02:
    BSR     sub_0x01ED99             ; JSR -> BSR  ; orig: C - - J - - 0x01689F 05:A88F: 20 89 ED  JSR sub_0x01ED99
    MOVE.B  ram_0063,D0  ; orig: C - - - - - 0x0168A2 05:A892: A5 63     LDA ram_0063
    BEQ     bra_A8A4             ; BEQ  ; orig: C - - - - - 0x0168A4 05:A894: F0 0E     BEQ bra_A8A4
    RTS                     ; RTS  ; orig: C - - - - - 0x0168A6 05:A896: 60        RTS



ofs_023_A897_03:  ; orig: ofs_023_A897_03:
    MOVE.B  ram_timer_link,D0  ; orig: C - - J - - 0x0168A7 05:A897: A5 28     LDA ram_timer_link
    BNE     bra_A8AA_RTS             ; BNE  ; orig: C - - - - - 0x0168A9 05:A899: D0 0F     BNE bra_A8AA_RTS
    BSR     sub_bat_7248_curtain_movement_handler             ; JSR -> BSR  ; orig: C - - - - - 0x0168AB 05:A89B: 20 48 72  JSR sub_bat_7248_cur
    MOVE.B  ram_007C,D0  ; orig: C - - - - - 0x0168AE 05:A89E: A5 7C     LDA ram_007C
    CMPI.B  #$11,D0  ; orig: C - - - - - 0x0168B0 05:A8A0: C9 11     CMP #$11
    BCS     bra_A8AA_RTS             ; BCS  ; orig: C - - - - - 0x0168B2 05:A8A2: B0 06     BCS bra_A8AA_RTS
bra_A8A4:  ; orig: bra_A8A4:
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x0168B4 05:A8A4: A9 80     LDA #$80
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x0168B6 05:A8A6: 85 28     STA ram_timer_link
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0168B8 05:A8A8: E6 13     INC ram_subscript
bra_A8AA_RTS:  ; orig: bra_A8AA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0168BA 05:A8AA: 60        RTS



ofs_023_A8AB_04:  ; orig: ofs_023_A8AB_04:
    MOVE.B  ram_timer_link,D0  ; orig: C - - J - - 0x0168BB 05:A8AB: A5 28     LDA ram_timer_link
    BNE     bra_A8AA_RTS             ; BNE  ; orig: C - - - - - 0x0168BD 05:A8AD: D0 FB     BNE bra_A8AA_RTS
    BSR     sub_0x01E607_hide_all_sprites             ; JSR -> BSR  ; orig: C - - - - - 0x0168BF 05:A8AF: 20 F7 E5  JSR sub_0x01E607_hid
    MOVE.B  ram_for_2000,D0  ; orig: C - - - - - 0x0168C2 05:A8B2: A5 FF     LDA ram_for_2000
    ANDI.B  #$FB,D0  ; orig: C - - - - - 0x0168C4 05:A8B4: 29 FB     AND #$FB
    MOVE.B  D0,ram_for_2000  ; orig: C - - - - - 0x0168C6 05:A8B6: 85 FF     STA ram_for_2000
    MOVE.B  D0,D0  ; prep for PPU_WRITE_2000  ; was: C - - - - - 0x0168C8 05:A8B8: 8D 00 20  STA $2000
    BSR     PPU_WRITE_2000
    JMP     loc_B547  ; orig: C - - - - - 0x0168CB 05:A8BB: 4C 47 B5  JMP loc_B547



bra_A8BE_overworld:  ; orig: bra_A8BE_overworld:
    BSR     sub_A9F4             ; JSR -> BSR  ; orig: C - - - - - 0x0168CE 05:A8BE: 20 F4 A9  JSR sub_A9F4
    JMP     loc_AB73  ; orig: C - - - - - 0x0168D1 05:A8C1: 4C 73 AB  JMP loc_AB73



sub_A8C4:  ; orig: sub_A8C4:
    BSR     sub_AB30_prepare_columns_table             ; JSR -> BSR  ; orig: C - - - - - 0x0168D4 05:A8C4: 20 30 AB  JSR sub_AB30_prepare
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x0168D7 05:A8C7: A5 10     LDA ram_dungeon_leve
    BEQ     bra_A8BE_overworld             ; BEQ  ; orig: C - - - - - 0x0168D9 05:A8C9: F0 F3     BEQ bra_A8BE_overwor

; if dungeon
    MOVE.B  #$F6,D0  ; orig: C - - - - - 0x0168DB 05:A8CB: A9 F6     LDA #$F6
    MOVE.B  D0,ram_000A_t05_tile  ; orig: C - - - - - 0x0168DD 05:A8CD: 85 0A     STA ram_000A_t05_til
    BSR     sub_0x01E8E8             ; JSR -> BSR  ; orig: C - - - - - 0x0168DF 05:A8CF: 20 D8 E8  JSR sub_0x01E8E8
    BSR     sub_B66C             ; JSR -> BSR  ; orig: C - - - - - 0x0168E2 05:A8D2: 20 6C B6  JSR sub_B66C
    BSR     sub_A442             ; JSR -> BSR  ; orig: C - - - - - 0x0168E5 05:A8D5: 20 42 A4  JSR sub_A442
    BSR     sub_A4F6             ; JSR -> BSR  ; orig: C - - - - - 0x0168E8 05:A8D8: 20 F6 A4  JSR sub_A4F6
    JMP     loc_A720  ; orig: C - - - - - 0x0168EB 05:A8DB: 4C 20 A7  JMP loc_A720



loc_A8DE_move_curtain:  ; orig: loc_A8DE_move_curtain:
sub_0x0168EE_move_curtain:  ; orig: sub_0x0168EE_move_curtain:
    MOVE.B  #< (ram_6530 - $16),D0  ; orig: C D 1 - - - 0x0168EE 05:A8DE: A9 1A     LDA #< (ram_6530 - $
    MOVE.B  D0,ram_0000_t0C_data  ; orig: C - - - - - 0x0168F0 05:A8E0: 85 00     STA ram_0000_t0C_dat
    MOVE.B  #> (ram_6530 - $16),D0  ; orig: C - - - - - 0x0168F2 05:A8E2: A9 65     LDA #> (ram_6530 - $
    ; (empty translation for STA)  ; orig: C - - - - - 0x0168F4 05:A8E4: 85 01     STA ram_0000_t0C_dat
    MOVE.B  ram_00E8,D1  ; orig: C - - - - - 0x0168F6 05:A8E6: A6 E8     LDX ram_00E8
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0168F8 05:A8E8: CA        DEX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0168F9 05:A8E9: 8A        TXA
    MOVE.B  ram_0301_buffer_index,D2  ; orig: C - - - - - 0x0168FA 05:A8EA: AC 01 03  LDY ram_0301_buffer_
    ; (empty translation for STA)  ; orig: C - - - - - 0x0168FD 05:A8ED: 99 03 03  STA ram_0302_ppu_buf
    MOVE.B  #$21,D0  ; orig: C - - - - - 0x016900 05:A8F0: A9 21     LDA #$21
    MOVE.B  D0,ram_0302_ppu_buffer(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x016902 05:A8F2: 99 02 03  STA ram_0302_ppu_buf
bra_A8F5_loop:  ; orig: bra_A8F5_loop:
    MOVE.B  #$16,D0  ; orig: C - - - - - 0x016905 05:A8F5: A9 16     LDA #$16
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016907 05:A8F7: 20 76 72  JSR sub_bat_7276_inc
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01690A 05:A8FA: CA        DEX
    BPL     bra_A8F5_loop             ; BPL  ; orig: C - - - - - 0x01690B 05:A8FB: 10 F8     BPL bra_A8F5_loop
    MOVE.B  #$96,D0  ; orig: C - - - - - 0x01690D 05:A8FD: A9 96     LDA #$96
    ; (empty translation for STA)  ; orig: C - - - - - 0x01690F 05:A8FF: 99 04 03  STA ram_0302_ppu_buf
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016912 05:A902: 8A        TXA
    ; (empty translation for STA)  ; orig: C - - - - - 0x016913 05:A903: 99 1B 03  STA ram_0302_ppu_buf
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016916 05:A906: 98        TYA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016917 05:A907: AA        TAX
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016918 05:A908: A0 00     LDY #$00
    MOVE.B  D2,ram_0006_t05_loop_counter  ; orig: C - - - - - 0x01691A 05:A90A: 84 06     STY ram_0006_t05_loo
bra_A90C_loop:  ; orig: bra_A90C_loop:
    MOVEA.W ($FF0000+ram_0000_t0C_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01691C 05:A90C: B1 00     LDA (ram_0000_t0C_da
    ; (empty translation for STA)  ; orig: C - - - - - 0x01691E 05:A90E: 9D 05 03  STA ram_0302_ppu_buf
    BSR     sub_bat_7274_inc_0000_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x016921 05:A911: 20 74 72  JSR sub_bat_7274_inc
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016924 05:A914: E8        INX
    ADDQ.B  #1,ram_0006_t05_loop_counter  ; orig: C - - - - - 0x016925 05:A915: E6 06     INC ram_0006_t05_loo
    MOVE.B  ram_0006_t05_loop_counter,D0  ; orig: C - - - - - 0x016927 05:A917: A5 06     LDA ram_0006_t05_loo
    CMPI.B  #$16,D0  ; orig: C - - - - - 0x016929 05:A919: C9 16     CMP #$16
    BCC     bra_A90C_loop             ; BCC  ; orig: C - - - - - 0x01692B 05:A91B: 90 EF     BCC bra_A90C_loop
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01692D 05:A91D: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01692E 05:A91E: E8        INX
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01692F 05:A91F: E8        INX
    MOVE.B  D1,ram_0301_buffer_index  ; orig: C - - - - - 0x016930 05:A920: 8E 01 03  STX ram_0301_buffer_
    RTS                     ; RTS  ; orig: C - - - - - 0x016933 05:A923: 60        RTS



sub_A924:  ; orig: sub_A924:
loc_A924:  ; orig: loc_A924:
    MOVE.B  #> ram_6530,D0  ; orig: C D 1 - - - 0x016934 05:A924: A9 65     LDA #> ram_6530
    ; (empty translation for STA)  ; orig: C - - - - - 0x016936 05:A926: 85 01     STA ram_0000_t0B_dat
    MOVE.B  ram_00E9,D0  ; orig: C - - - - - 0x016938 05:A928: A5 E9     LDA ram_00E9
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x01693A 05:A92A: AA        TAX
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01693B 05:A92B: 18        CLC
    ADDX.B  #< ram_6530,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01693C 05:A92C: 69 30     ADC #< ram_6530
    MOVE.B  D0,ram_0000_t0B_data  ; orig: C - - - - - 0x01693E 05:A92E: 85 00     STA ram_0000_t0B_dat
    BCC     bra_A934_not_overflow             ; BCC  ; orig: C - - - - - 0x016940 05:A930: 90 02     BCC bra_A934_not_ove
    ; (empty translation for INC)  ; orig: - - - - - - 0x016942 05:A932: E6 01     INC ram_0000_t0B_dat
bra_A934_not_overflow:  ; orig: bra_A934_not_overflow:
    MOVE.B  #> $20E0,D0  ; orig: C - - - - - 0x016944 05:A934: A9 20     LDA #> $20E0
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x016946 05:A936: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  #< $20E0,D0  ; orig: C - - - - - 0x016949 05:A939: A9 E0     LDA #< $20E0
    ; (empty translation for STA)  ; orig: C - - - - - 0x01694B 05:A93B: 8D 03 03  STA ram_0302_ppu_buf
bra_A93E_loop:  ; orig: bra_A93E_loop:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01694E 05:A93E: AD 03 03  LDA ram_0302_ppu_buf
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x016951 05:A941: 18        CLC
    ADDX.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x016952 05:A942: 69 20     ADC #$20
    ; (empty translation for STA)  ; orig: C - - - - - 0x016954 05:A944: 8D 03 03  STA ram_0302_ppu_buf
    BCC     bra_A94C_not_overflow             ; BCC  ; orig: C - - - - - 0x016957 05:A947: 90 03     BCC bra_A94C_not_ove
    ADDQ.B  #1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x016959 05:A949: EE 02 03  INC ram_0302_ppu_buf
bra_A94C_not_overflow:  ; orig: bra_A94C_not_overflow:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01695C 05:A94C: CA        DEX
    BPL     bra_A93E_loop             ; BPL  ; orig: C - - - - - 0x01695D 05:A94D: 10 EF     BPL bra_A93E_loop
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01695F 05:A94F: A9 20     LDA #$20
    ; (empty translation for STA)  ; orig: C - - - - - 0x016961 05:A951: 8D 04 03  STA ram_0302_ppu_buf
    ; (empty translation for STX)  ; orig: C - - - - - 0x016964 05:A954: 8E 25 03  STX ram_0302_ppu_buf
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x016967 05:A957: A2 00     LDX #$00
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016969 05:A959: A0 00     LDY #$00
bra_A95B_loop:  ; orig: bra_A95B_loop:
    MOVEA.W ($FF0000+ram_0000_t0B_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01696B 05:A95B: B1 00     LDA (ram_0000_t0B_da
    ; (empty translation for STA)  ; orig: C - - - - - 0x01696D 05:A95D: 9D 05 03  STA ram_0302_ppu_buf
    MOVE.B  #$16,D0  ; orig: C - - - - - 0x016970 05:A960: A9 16     LDA #$16
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016972 05:A962: 20 76 72  JSR sub_bat_7276_inc
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016975 05:A965: E8        INX
    CMPI.B  #$20,D1  ; orig: C - - - - - 0x016976 05:A966: E0 20     CPX #$20
    BCC     bra_A95B_loop             ; BCC  ; orig: C - - - - - 0x016978 05:A968: 90 F1     BCC bra_A95B_loop
    MOVE.B  #$23,D0  ; orig: C - - - - - 0x01697A 05:A96A: A9 23     LDA #$23
    MOVE.B  D0,ram_0301_buffer_index  ; orig: C - - - - - 0x01697C 05:A96C: 8D 01 03  STA ram_0301_buffer_
    RTS                     ; RTS  ; orig: C - - - - - 0x01697F 05:A96F: 60        RTS



tbl_A970:  ; orig: tbl_A970:
    ; [DIRECTIVE] .BYTE con_obj_id_62  -- needs manual handling  ; orig: - D 1 - - - 0x016980 05:A970: 62        .byte con_obj_id_62 
    ; [DIRECTIVE] .BYTE con_obj_id_breakable_wall  -- needs manual handling  ; orig: - D 1 - - - 0x016981 05:A971: 63        .byte con_obj_id_bre
    ; [DIRECTIVE] .BYTE con_obj_id_64  -- needs manual handling  ; orig: - D 1 - - - 0x016982 05:A972: 64        .byte con_obj_id_64 
    ; [DIRECTIVE] .BYTE con_obj_id_65  -- needs manual handling  ; orig: - D 1 - - - 0x016983 05:A973: 65        .byte con_obj_id_65 
    ; [DIRECTIVE] .BYTE con_obj_id_66  -- needs manual handling  ; orig: - - - - - - 0x016984 05:A974: 66        .byte con_obj_id_66 
    ; [DIRECTIVE] .BYTE con_obj_id_67  -- needs manual handling  ; orig: - - - - - - 0x016985 05:A975: 67        .byte con_obj_id_67 



tbl_A976_replace_metatile:  ; orig: tbl_A976_replace_metatile:
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x016986 05:A976: C8        .byte $C8   ; 00 (E5
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - - - 0x016987 05:A977: D8        .byte $D8   ; 01 (E6
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - - - 0x016988 05:A978: C4        .byte $C4   ; 02 (E7
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - - - 0x016989 05:A979: BC        .byte $BC   ; 03 (E8
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - - - - - - 0x01698A 05:A97A: C0        .byte $C0   ; 04 (E9
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - - - - - - 0x01698B 05:A97B: C0        .byte $C0   ; 05 (EA



tbl_A97C:  ; orig: tbl_A97C:
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - - - 0x01698C 05:A97C: 24        .byte $24   ; 00
    ; [DIRECTIVE] .BYTE $6F  -- needs manual handling  ; orig: - D 1 - - - 0x01698D 05:A97D: 6F        .byte $6F   ; 01
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 1 - - - 0x01698E 05:A97E: F3        .byte $F3   ; 02
    ; [DIRECTIVE] .BYTE $FA  -- needs manual handling  ; orig: - D 1 - - - 0x01698F 05:A97F: FA        .byte $FA   ; 03
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - - - - - - 0x016990 05:A980: 98        .byte $98   ; 04
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - - - 0x016991 05:A981: 90        .byte $90   ; 05
    ; [DIRECTIVE] .BYTE $8F  -- needs manual handling  ; orig: - D 1 - - - 0x016992 05:A982: 8F        .byte $8F   ; 06
    ; [DIRECTIVE] .BYTE $95  -- needs manual handling  ; orig: - D 1 - - - 0x016993 05:A983: 95        .byte $95   ; 07
    ; [DIRECTIVE] .BYTE $8E  -- needs manual handling  ; orig: - D 1 - - - 0x016994 05:A984: 8E        .byte $8E   ; 08
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - - - 0x016995 05:A985: 90        .byte $90   ; 09
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - - - 0x016996 05:A986: 74        .byte $74   ; 0A
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - - - 0x016997 05:A987: 76        .byte $76   ; 0B
    ; [DIRECTIVE] .BYTE $F3  -- needs manual handling  ; orig: - D 1 - - - 0x016998 05:A988: F3        .byte $F3   ; 0C
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - - - 0x016999 05:A989: 24        .byte $24   ; 0D
    ; [DIRECTIVE] .BYTE $26  -- needs manual handling  ; orig: - D 1 - - - 0x01699A 05:A98A: 26        .byte $26   ; 0E
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 1 - - - 0x01699B 05:A98B: 89        .byte $89   ; 0F
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - - - - - - 0x01699C 05:A98C: 03        .byte $03   ; 10
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x01699D 05:A98D: 04        .byte $04   ; 11
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - - - 0x01699E 05:A98E: 70        .byte $70   ; 12
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x01699F 05:A98F: C8        .byte $C8   ; 13
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 1 - - - 0x0169A0 05:A990: BC        .byte $BC   ; 14
    ; [DIRECTIVE] .BYTE $8D  -- needs manual handling  ; orig: - D 1 - - - 0x0169A1 05:A991: 8D        .byte $8D   ; 15
    ; [DIRECTIVE] .BYTE $8F  -- needs manual handling  ; orig: - D 1 - - - 0x0169A2 05:A992: 8F        .byte $8F   ; 16
    ; [DIRECTIVE] .BYTE $93  -- needs manual handling  ; orig: - D 1 - - - 0x0169A3 05:A993: 93        .byte $93   ; 17
    ; [DIRECTIVE] .BYTE $95  -- needs manual handling  ; orig: - D 1 - - - 0x0169A4 05:A994: 95        .byte $95   ; 18
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - - - 0x0169A5 05:A995: C4        .byte $C4   ; 19
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 1 - - - 0x0169A6 05:A996: CE        .byte $CE   ; 1A
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - - - 0x0169A7 05:A997: D8        .byte $D8   ; 1B
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x0169A8 05:A998: B0        .byte $B0   ; 1C
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - - - 0x0169A9 05:A999: B4        .byte $B4   ; 1D
    ; [DIRECTIVE] .BYTE $AA  -- needs manual handling  ; orig: - D 1 - - - 0x0169AA 05:A99A: AA        .byte $AA   ; 1E
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - - - 0x0169AB 05:A99B: AC        .byte $AC   ; 1F
    ; [DIRECTIVE] .BYTE $B8  -- needs manual handling  ; orig: - D 1 - - - 0x0169AC 05:A99C: B8        .byte $B8   ; 20
    ; [DIRECTIVE] .BYTE $9C  -- needs manual handling  ; orig: - D 1 - - - 0x0169AD 05:A99D: 9C        .byte $9C   ; 21
    ; [DIRECTIVE] .BYTE $A6  -- needs manual handling  ; orig: - D 1 - - - 0x0169AE 05:A99E: A6        .byte $A6   ; 22
    ; [DIRECTIVE] .BYTE $9A  -- needs manual handling  ; orig: - D 1 - - - 0x0169AF 05:A99F: 9A        .byte $9A   ; 23
    ; [DIRECTIVE] .BYTE $A2  -- needs manual handling  ; orig: - D 1 - - - 0x0169B0 05:A9A0: A2        .byte $A2   ; 24
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - - - 0x0169B1 05:A9A1: A0        .byte $A0   ; 25
    ; [DIRECTIVE] .BYTE $E5  -- needs manual handling  ; orig: - D 1 - - - 0x0169B2 05:A9A2: E5        .byte $E5   ; 26
    ; [DIRECTIVE] .BYTE $E6  -- needs manual handling  ; orig: - D 1 - - - 0x0169B3 05:A9A3: E6        .byte $E6   ; 27
    ; [DIRECTIVE] .BYTE $E7  -- needs manual handling  ; orig: - D 1 - - - 0x0169B4 05:A9A4: E7        .byte $E7   ; 28
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - - - 0x0169B5 05:A9A5: E8        .byte $E8   ; 29
    ; [DIRECTIVE] .BYTE $E9  -- needs manual handling  ; orig: - - - - - - 0x0169B6 05:A9A6: E9        .byte $E9   ; 2A
    ; [DIRECTIVE] .BYTE $EA  -- needs manual handling  ; orig: - - - - - - 0x0169B7 05:A9A7: EA        .byte $EA   ; 2B
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - - - 0x0169B8 05:A9A8: C0        .byte $C0   ; 2C
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - - - 0x0169B9 05:A9A9: E0        .byte $E0   ; 2D
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - - - 0x0169BA 05:A9AA: 78        .byte $78   ; 2E
    ; [DIRECTIVE] .BYTE $7A  -- needs manual handling  ; orig: - D 1 - - - 0x0169BB 05:A9AB: 7A        .byte $7A   ; 2F
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - - - 0x0169BC 05:A9AC: 7E        .byte $7E   ; 30
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - - - - - - 0x0169BD 05:A9AD: 80        .byte $80   ; 31
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - - - 0x0169BE 05:A9AE: CC        .byte $CC   ; 32
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - - - 0x0169BF 05:A9AF: D0        .byte $D0   ; 33
    ; [DIRECTIVE] .BYTE $D4  -- needs manual handling  ; orig: - D 1 - - - 0x0169C0 05:A9B0: D4        .byte $D4   ; 34
    ; [DIRECTIVE] .BYTE $DC  -- needs manual handling  ; orig: - D 1 - - - 0x0169C1 05:A9B1: DC        .byte $DC   ; 35
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 1 - - - 0x0169C2 05:A9B2: 89        .byte $89   ; 36
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 1 - - - 0x0169C3 05:A9B3: 84        .byte $84   ; 37



tbl_A9B4_custom_metatiles:  ; orig: tbl_A9B4_custom_metatiles:

; 00
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169C4 05:A9B4: 24        .byte $24, $24   ;
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169C6 05:A9B6: 24        .byte $24, $24   ;

; 01
    ; [DIRECTIVE] .BYTE $6F, $6F  -- needs manual handling  ; orig: - D 1 - - - 0x0169C8 05:A9B8: 6F        .byte $6F, $6F   ;
    ; [DIRECTIVE] .BYTE $6F, $6F  -- needs manual handling  ; orig: - D 1 - - - 0x0169CA 05:A9BA: 6F        .byte $6F, $6F   ;

; 02
    ; [DIRECTIVE] .BYTE $F3, $F3  -- needs manual handling  ; orig: - D 1 - - - 0x0169CC 05:A9BC: F3        .byte $F3, $F3   ;
    ; [DIRECTIVE] .BYTE $F3, $F3  -- needs manual handling  ; orig: - D 1 - - - 0x0169CE 05:A9BE: F3        .byte $F3, $F3   ;

; 03
    ; [DIRECTIVE] .BYTE $FA, $FA  -- needs manual handling  ; orig: - D 1 - - - 0x0169D0 05:A9C0: FA        .byte $FA, $FA   ;
    ; [DIRECTIVE] .BYTE $FA, $FA  -- needs manual handling  ; orig: - D 1 - - - 0x0169D2 05:A9C2: FA        .byte $FA, $FA   ;

; 04
    ; [DIRECTIVE] .BYTE $98, $95  -- needs manual handling  ; orig: - - - - - - 0x0169D4 05:A9C4: 98        .byte $98, $95   ;
    ; [DIRECTIVE] .BYTE $26, $26  -- needs manual handling  ; orig: - - - - - - 0x0169D6 05:A9C6: 26        .byte $26, $26   ;

; 05
    ; [DIRECTIVE] .BYTE $90, $95  -- needs manual handling  ; orig: - D 1 - - - 0x0169D8 05:A9C8: 90        .byte $90, $95   ;
    ; [DIRECTIVE] .BYTE $90, $95  -- needs manual handling  ; orig: - D 1 - - - 0x0169DA 05:A9CA: 90        .byte $90, $95   ;

; 06
    ; [DIRECTIVE] .BYTE $8F, $90  -- needs manual handling  ; orig: - D 1 - - - 0x0169DC 05:A9CC: 8F        .byte $8F, $90   ;
    ; [DIRECTIVE] .BYTE $8F, $90  -- needs manual handling  ; orig: - D 1 - - - 0x0169DE 05:A9CE: 8F        .byte $8F, $90   ;

; 07
    ; [DIRECTIVE] .BYTE $95, $96  -- needs manual handling  ; orig: - D 1 - - - 0x0169E0 05:A9D0: 95        .byte $95, $96   ;
    ; [DIRECTIVE] .BYTE $95, $96  -- needs manual handling  ; orig: - D 1 - - - 0x0169E2 05:A9D2: 95        .byte $95, $96   ;

; 08
    ; [DIRECTIVE] .BYTE $8E, $93  -- needs manual handling  ; orig: - D 1 - - - 0x0169E4 05:A9D4: 8E        .byte $8E, $93   ;
    ; [DIRECTIVE] .BYTE $90, $95  -- needs manual handling  ; orig: - D 1 - - - 0x0169E6 05:A9D6: 90        .byte $90, $95   ;

; 09
    ; [DIRECTIVE] .BYTE $90, $95  -- needs manual handling  ; orig: - D 1 - - - 0x0169E8 05:A9D8: 90        .byte $90, $95   ;
    ; [DIRECTIVE] .BYTE $92, $97  -- needs manual handling  ; orig: - D 1 - - - 0x0169EA 05:A9DA: 92        .byte $92, $97   ;

; 0A
    ; [DIRECTIVE] .BYTE $74, $74  -- needs manual handling  ; orig: - D 1 - - - 0x0169EC 05:A9DC: 74        .byte $74, $74   ;
    ; [DIRECTIVE] .BYTE $75, $75  -- needs manual handling  ; orig: - D 1 - - - 0x0169EE 05:A9DE: 75        .byte $75, $75   ;

; 0B
    ; [DIRECTIVE] .BYTE $76, $77  -- needs manual handling  ; orig: - D 1 - - - 0x0169F0 05:A9E0: 76        .byte $76, $77   ;
    ; [DIRECTIVE] .BYTE $76, $77  -- needs manual handling  ; orig: - D 1 - - - 0x0169F2 05:A9E2: 76        .byte $76, $77   ;

; 0C
    ; [DIRECTIVE] .BYTE $F3, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169F4 05:A9E4: F3        .byte $F3, $24   ;
    ; [DIRECTIVE] .BYTE $F3, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169F6 05:A9E6: F3        .byte $F3, $24   ;

; 0D
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169F8 05:A9E8: 24        .byte $24, $24   ;
    ; [DIRECTIVE] .BYTE $24, $24  -- needs manual handling  ; orig: - D 1 - - - 0x0169FA 05:A9EA: 24        .byte $24, $24   ;

; 0E
    ; [DIRECTIVE] .BYTE $26, $26  -- needs manual handling  ; orig: - D 1 - - - 0x0169FC 05:A9EC: 26        .byte $26, $26   ;
    ; [DIRECTIVE] .BYTE $26, $26  -- needs manual handling  ; orig: - D 1 - - - 0x0169FE 05:A9EE: 26        .byte $26, $26   ;

; 0F
    ; [DIRECTIVE] .BYTE $89, $88  -- needs manual handling  ; orig: - D 1 - - - 0x016A00 05:A9F0: 89        .byte $89, $88   ;
    ; [DIRECTIVE] .BYTE $8B, $88  -- needs manual handling  ; orig: - D 1 - - - 0x016A02 05:A9F2: 8B        .byte $8B, $88   ;



sub_A9F4:  ; orig: sub_A9F4:
    MOVE.B  tbl_9F9C,D0  ; orig: C - - - - - 0x016A04 05:A9F4: AD 9C 9F  LDA tbl_9F9C
    MOVE.B  D0,ram_0002_t09_data  ; orig: C - - - - - 0x016A07 05:A9F7: 85 02     STA ram_0002_t09_dat
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016A09 05:A9F9: AD 9D 9F  LDA tbl_9F9C + $01
    ; (empty translation for STA)  ; orig: C - - - - - 0x016A0C 05:A9FC: 85 03     STA ram_0002_t09_dat
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016A0E 05:A9FE: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t14  ; orig: C - - - - - 0x016A10 05:AA00: 85 06     STA ram_0006_t14
    MOVE.B  ram_map_location,D1  ; orig: C - - - - - 0x016A12 05:AA02: A6 EB     LDX ram_map_location
    MOVE.B  ram_69FE_map_data(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016A14 05:AA04: BD FE 69  LDA ram_69FE_map_dat

; * 02
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016A17 05:AA07: 0A        ASL

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016A18 05:AA08: 0A        ASL
    ROXL.B  #1,ram_0006_t14  ; orig: C - - - - - 0x016A19 05:AA09: 26 06     ROL ram_0006_t14
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016A1B 05:AA0B: 0A        ASL
    ROXL.B  #1,ram_0006_t14  ; orig: C - - - - - 0x016A1C 05:AA0C: 26 06     ROL ram_0006_t14
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016A1E 05:AA0E: 0A        ASL
    ROXL.B  #1,ram_0006_t14  ; orig: C - - - - - 0x016A1F 05:AA0F: 26 06     ROL ram_0006_t14
    ADDX.B  ram_0002_t09_data,D0  ; orig: C - - - - - 0x016A21 05:AA11: 65 02     ADC ram_0002_t09_dat
    MOVE.B  D0,ram_0002_t09_data  ; orig: C - - - - - 0x016A23 05:AA13: 85 02     STA ram_0002_t09_dat
    MOVE.B  ram_0006_t14,D0  ; orig: C - - - - - 0x016A25 05:AA15: A5 06     LDA ram_0006_t14
    ; !! ADC ram_0002_t09_data + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x016A27 05:AA17: 65 03     ADC ram_0002_t09_dat
    ; (empty translation for STA)  ; orig: C - - - - - 0x016A29 05:AA19: 85 03     STA ram_0002_t09_dat
loc_AA1B_draw_special_screen:  ; orig: loc_AA1B_draw_special_screen:

; in

; ram_0002_t09_data
    MOVE.B  ram_6BAF,D0  ; orig: C D 1 - - - 0x016A2B 05:AA1B: AD AF 6B  LDA ram_6BAF
    MOVE.B  D0,ram_0008_t02_data  ; orig: C - - - - - 0x016A2E 05:AA1E: 85 08     STA ram_0008_t02_dat
    MOVE.B  ram_6BB0,D0  ; orig: C - - - - - 0x016A30 05:AA20: AD B0 6B  LDA ram_6BB0
    ; (empty translation for STA)  ; orig: C - - - - - 0x016A33 05:AA23: 85 09     STA ram_0008_t02_dat
    BSR     sub_AC07_set_block_address_pointer             ; JSR -> BSR  ; orig: C - - - - - 0x016A35 05:AA25: 20 07 AC  JSR sub_AC07_set_blo
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016A38 05:AA28: A9 00     LDA #$00
    MOVE.B  D0,ram_000C_t09  ; orig: C - - - - - 0x016A3A 05:AA2A: 85 0C     STA ram_000C_t09
    MOVE.B  D0,ram_0006_t06_special_metatile_pos_X  ; orig: C - - - - - 0x016A3C 05:AA2C: 85 06     STA ram_0006_t06_spe
loc_AA2E_loop:  ; orig: loc_AA2E_loop:
    MOVE.B  ram_0006_t06_special_metatile_pos_X,D2  ; orig: C D 1 - - - 0x016A3E 05:AA2E: A4 06     LDY ram_0006_t06_spe
    MOVEA.W ($FF0000+ram_0002_t09_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016A40 05:AA30: B1 02     LDA (ram_0002_t09_da
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x016A42 05:AA32: 29 F0     AND #$F0

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016A44 05:AA34: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016A45 05:AA35: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016A46 05:AA36: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016A47 05:AA37: AA        TAX
    MOVE.B  tbl_bat_6827_columns(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016A48 05:AA38: BD 27 68  LDA tbl_bat_6827_col
    MOVE.B  D0,ram_0004_t07_columns_data  ; orig: C - - - - - 0x016A4B 05:AA3B: 85 04     STA ram_0004_t07_col
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016A4D 05:AA3D: BD 28 68  LDA tbl_bat_6827_col
    ; (empty translation for STA)  ; orig: C - - - - - 0x016A50 05:AA40: 85 05     STA ram_0004_t07_col
    MOVEA.W ($FF0000+ram_0002_t09_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016A52 05:AA42: B1 02     LDA (ram_0002_t09_da
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x016A54 05:AA44: 29 0F     AND #$0F
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016A56 05:AA46: AA        TAX
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x016A57 05:AA47: A0 FF     LDY #$FF
bra_AA49_loop:  ; orig: bra_AA49_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x016A59 05:AA49: C8        INY
    MOVEA.W ($FF0000+ram_0004_t07_columns_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016A5A 05:AA4A: B1 04     LDA (ram_0004_t07_co
    BPL     bra_AA49_loop             ; BPL  ; orig: C - - - - - 0x016A5C 05:AA4C: 10 FB     BPL bra_AA49_loop
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x016A5E 05:AA4E: CA        DEX
    BPL     bra_AA49_loop             ; BPL  ; orig: C - - - - - 0x016A5F 05:AA4F: 10 F8     BPL bra_AA49_loop
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016A61 05:AA51: 98        TYA
    BSR     sub_bat_728E_inc_0004_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016A62 05:AA52: 20 8E 72  JSR sub_bat_728E_inc
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016A65 05:AA55: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t01_special_metatile_pos_Y  ; orig: C - - - - - 0x016A67 05:AA57: 85 07     STA ram_0007_t01_spe
bra_AA59_loop:  ; orig: bra_AA59_loop:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016A69 05:AA59: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_0004_t07_columns_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016A6B 05:AA5B: B1 04     LDA (ram_0004_t07_co
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x016A6D 05:AA5D: 29 3F     AND #$3F
    MOVE.B  D0,ram_000D_t03  ; orig: C - - - - - 0x016A6F 05:AA5F: 85 0D     STA ram_000D_t03
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016A71 05:AA61: AA        TAX
    MOVE.B  tbl_A97C(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016A72 05:AA62: BD 7C A9  LDA tbl_A97C,X
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016A75 05:AA65: 48        PHA
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x016A76 05:AA66: A4 EB     LDY ram_map_location
    MOVEA.W ($FF0000+ram_0008_t02_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016A78 05:AA68: B1 08     LDA (ram_0008_t02_da
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x016A7A 05:AA6A: 29 80     AND #$80
    BEQ     bra_AA88             ; BEQ  ; orig: C - - - - - 0x016A7C 05:AA6C: F0 1A     BEQ bra_AA88
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016A7E 05:AA6E: 68        PLA
    CMPI.B  #$E7,D0  ; orig: C - - - - - 0x016A7F 05:AA6F: C9 E7     CMP #$E7
    BEQ     bra_AA7B             ; BEQ  ; orig: C - - - - - 0x016A81 05:AA71: F0 08     BEQ bra_AA7B
    CMPI.B  #$E6,D0  ; orig: C - - - - - 0x016A83 05:AA73: C9 E6     CMP #$E6
    BEQ     bra_AA83             ; BEQ  ; orig: C - - - - - 0x016A85 05:AA75: F0 0C     BEQ bra_AA83
    CMPI.B  #$EA,D0  ; orig: C - - - - - 0x016A87 05:AA77: C9 EA     CMP #$EA
    BNE     bra_AA87             ; BNE  ; orig: C - - - - - 0x016A89 05:AA79: D0 0C     BNE bra_AA87
bra_AA7B:  ; orig: bra_AA7B:
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x016A8B 05:AA7B: A9 10     LDA #$10
    MOVE.B  D0,ram_000D_t03  ; orig: C - - - - - 0x016A8D 05:AA7D: 85 0D     STA ram_000D_t03
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x016A8F 05:AA7F: A9 70     LDA #$70
    BNE     bra_AA87             ; BNE  ; orig: C - - - - - 0x016A91 05:AA81: D0 04     BNE bra_AA87    ; jm
bra_AA83:  ; orig: bra_AA83:
    MOVE.B  #$0C,D0  ; orig: C - - - - - 0x016A93 05:AA83: A9 0C     LDA #$0C
    MOVE.B  D0,ram_000D_t03  ; orig: C - - - - - 0x016A95 05:AA85: 85 0D     STA ram_000D_t03
bra_AA87:  ; orig: bra_AA87:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016A97 05:AA87: 48        PHA
bra_AA88:  ; orig: bra_AA88:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016A98 05:AA88: 68        PLA
    BSR     sub_AABF             ; JSR -> BSR  ; orig: C - - - - - 0x016A99 05:AA89: 20 BF AA  JSR sub_AABF
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016A9C 05:AA8C: A0 00     LDY #$00
    BSR     sub_AAF1_unpack_and_write_2x2_block             ; JSR -> BSR  ; orig: C - - - - - 0x016A9E 05:AA8E: 20 F1 AA  JSR sub_AAF1_unpack_
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x016AA1 05:AA91: A9 02     LDA #$02
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016AA3 05:AA93: 20 76 72  JSR sub_bat_7276_inc
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016AA6 05:AA96: A0 00     LDY #$00
    MOVEA.W ($FF0000+ram_0004_t07_columns_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016AA8 05:AA98: B1 04     LDA (ram_0004_t07_co
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x016AAA 05:AA9A: 29 40     AND #$40
    BEQ     bra_AAA4             ; BEQ  ; orig: C - - - - - 0x016AAC 05:AA9C: F0 06     BEQ bra_AAA4
    EOR.B   ram_000C_t09,D0  ; orig: C - - - - - 0x016AAE 05:AA9E: 45 0C     EOR ram_000C_t09
    MOVE.B  D0,ram_000C_t09  ; orig: C - - - - - 0x016AB0 05:AAA0: 85 0C     STA ram_000C_t09
    BNE     bra_AAA7             ; BNE  ; orig: C - - - - - 0x016AB2 05:AAA2: D0 03     BNE bra_AAA7
bra_AAA4:  ; orig: bra_AAA4:
    BSR     sub_bat_728C_inc_0004_pointer_by_01             ; JSR -> BSR  ; orig: C - - - - - 0x016AB4 05:AAA4: 20 8C 72  JSR sub_bat_728C_inc
bra_AAA7:  ; orig: bra_AAA7:
    ADDQ.B  #1,ram_0007_t01_special_metatile_pos_Y  ; orig: C - - - - - 0x016AB7 05:AAA7: E6 07     INC ram_0007_t01_spe
    MOVE.B  ram_0007_t01_special_metatile_pos_Y,D0  ; orig: C - - - - - 0x016AB9 05:AAA9: A5 07     LDA ram_0007_t01_spe
    CMPI.B  #$0B,D0  ; orig: C - - - - - 0x016ABB 05:AAAB: C9 0B     CMP #$0B
    BNE     bra_AA59_loop             ; BNE  ; orig: C - - - - - 0x016ABD 05:AAAD: D0 AA     BNE bra_AA59_loop
    MOVE.B  #$16,D0  ; orig: C - - - - - 0x016ABF 05:AAAF: A9 16     LDA #$16
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016AC1 05:AAB1: 20 76 72  JSR sub_bat_7276_inc
    ADDQ.B  #1,ram_0006_t06_special_metatile_pos_X  ; orig: C - - - - - 0x016AC4 05:AAB4: E6 06     INC ram_0006_t06_spe
    MOVE.B  ram_0006_t06_special_metatile_pos_X,D0  ; orig: C - - - - - 0x016AC6 05:AAB6: A5 06     LDA ram_0006_t06_spe
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x016AC8 05:AAB8: C9 10     CMP #$10
    BCS     bra_AAF0_RTS             ; BCS  ; orig: C - - - - - 0x016ACA 05:AABA: B0 34     BCS bra_AAF0_RTS
    JMP     loc_AA2E_loop  ; orig: C - - - - - 0x016ACC 05:AABC: 4C 2E AA  JMP loc_AA2E_loop



sub_AABF:  ; orig: sub_AABF:

; in

; A = metatile

; out

; A = metatile
    MOVE.B  #$EA,D1  ; orig: C - - - - - 0x016ACF 05:AABF: A2 EA     LDX #$EA
    MOVE.B  D1,ram_000A_t04_metatile  ; orig: C - - - - - 0x016AD1 05:AAC1: 86 0A     STX ram_000A_t04_met
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x016AD3 05:AAC3: A2 05     LDX #$05
bra_AAC5_loop:  ; orig: bra_AAC5_loop:
    CMP.B   ram_000A_t04_metatile,D0  ; orig: C - - - - - 0x016AD5 05:AAC5: C5 0A     CMP ram_000A_t04_met
    BEQ     bra_AAD0             ; BEQ  ; orig: C - - - - - 0x016AD7 05:AAC7: F0 07     BEQ bra_AAD0
    SUBQ.B  #1,ram_000A_t04_metatile  ; orig: C - - - - - 0x016AD9 05:AAC9: C6 0A     DEC ram_000A_t04_met
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x016ADB 05:AACB: CA        DEX
    BPL     bra_AAC5_loop             ; BPL  ; orig: C - - - - - 0x016ADC 05:AACC: 10 F7     BPL bra_AAC5_loop
    BMI     bra_AAF0_RTS             ; BMI  ; orig: C - - - - - 0x016ADE 05:AACE: 30 20     BMI bra_AAF0_RTS    
bra_AAD0:  ; orig: bra_AAD0:
    MOVE.B  tbl_A976_replace_metatile(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016AE0 05:AAD0: BD 76 A9  LDA tbl_A976_replace
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016AE3 05:AAD3: 48        PHA
    MOVE.B  tbl_A970(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016AE4 05:AAD4: BD 70 A9  LDA tbl_A970,X
    MOVE.B  D0,ram_052B_special_metatile_id  ; orig: C - - - - - 0x016AE7 05:AAD7: 8D 2B 05  STA ram_052B_special
    MOVE.B  ram_0006_t06_special_metatile_pos_X,D0  ; orig: C - - - - - 0x016AEA 05:AADA: A5 06     LDA ram_0006_t06_spe

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AEC 05:AADC: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AED 05:AADD: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AEE 05:AADE: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AEF 05:AADF: 0A        ASL
    MOVE.B  D0,ram_052C_special_metatile_pos_X  ; orig: C - - - - - 0x016AF0 05:AAE0: 8D 2C 05  STA ram_052C_special
    MOVE.B  ram_0007_t01_special_metatile_pos_Y,D0  ; orig: C - - - - - 0x016AF3 05:AAE3: A5 07     LDA ram_0007_t01_spe

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AF5 05:AAE5: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AF6 05:AAE6: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AF7 05:AAE7: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016AF8 05:AAE8: 0A        ASL
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x016AF9 05:AAE9: 18        CLC
    ADDX.B  #$40,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x016AFA 05:AAEA: 69 40     ADC #$40
    MOVE.B  D0,ram_052D_special_metatile_pos_Y  ; orig: C - - - - - 0x016AFC 05:AAEC: 8D 2D 05  STA ram_052D_special
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016AFF 05:AAEF: 68        PLA
bra_AAF0_RTS:  ; orig: bra_AAF0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x016B00 05:AAF0: 60        RTS



sub_AAF1_unpack_and_write_2x2_block:  ; orig: sub_AAF1_unpack_and_write_2x2_block:

; in

; A =
    MOVE.B  ram_000D_t03,D1  ; orig: C - - - - - 0x016B01 05:AAF1: A6 0D     LDX ram_000D_t03
    CMPI.B  #$10,D1  ; orig: C - - - - - 0x016B03 05:AAF3: E0 10     CPX #$10
    BCC     bra_AB0E_00_0F             ; BCC  ; orig: C - - - - - 0x016B05 05:AAF5: 90 17     BCC bra_AB0E_00_0F

; if 10-FF, write with 01 increase each time

; for example, if 10, then write

; 10 11

; 12 13
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016B07 05:AAF7: AA        TAX
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B08 05:AAF8: 91 00     STA (ram_0000_t03_bl
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x016B0A 05:AAFA: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B0B 05:AAFB: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016B0C 05:AAFC: 8A        TXA
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B0D 05:AAFD: 91 00     STA (ram_0000_t03_bl
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016B0F 05:AAFF: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x016B10 05:AB00: 18        CLC
    ADDX.B  #$15,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x016B11 05:AB01: 69 15     ADC #$15
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x016B13 05:AB03: A8        TAY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B14 05:AB04: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016B15 05:AB05: 8A        TXA
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B16 05:AB06: 91 00     STA (ram_0000_t03_bl
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B18 05:AB08: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016B19 05:AB09: 8A        TXA
loc_AB0A:  ; orig: loc_AB0A:
    ADDQ.B  #1,D2           ; INY  ; orig: C D 1 - - - 0x016B1A 05:AB0A: C8        INY
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B1B 05:AB0B: 91 00     STA (ram_0000_t03_bl
    RTS                     ; RTS  ; orig: C - - - - - 0x016B1D 05:AB0D: 60        RTS
bra_AB0E_00_0F:  ; orig: bra_AB0E_00_0F:

; else, write a custom block from the table

; for example, if 0F (0x016A00), then write

; 89 88

; 8B 88
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016B1E 05:AB0E: 8A        TXA

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016B1F 05:AB0F: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016B20 05:AB10: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016B21 05:AB11: AA        TAX
    MOVE.B  tbl_A9B4_custom_metatiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B22 05:AB12: BD B4 A9  LDA tbl_A9B4_custom_
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B25 05:AB15: 91 00     STA (ram_0000_t03_bl
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x016B27 05:AB17: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B28 05:AB18: E8        INX
    MOVE.B  tbl_A9B4_custom_metatiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B29 05:AB19: BD B4 A9  LDA tbl_A9B4_custom_
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B2C 05:AB1C: 91 00     STA (ram_0000_t03_bl
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016B2E 05:AB1E: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x016B2F 05:AB1F: 18        CLC
    ADDX.B  #$15,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x016B30 05:AB20: 69 15     ADC #$15
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x016B32 05:AB22: A8        TAY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B33 05:AB23: E8        INX
    MOVE.B  tbl_A9B4_custom_metatiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B34 05:AB24: BD B4 A9  LDA tbl_A9B4_custom_
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x016B37 05:AB27: 91 00     STA (ram_0000_t03_bl
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x016B39 05:AB29: E8        INX
    MOVE.B  tbl_A9B4_custom_metatiles(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B3A 05:AB2A: BD B4 A9  LDA tbl_A9B4_custom_
    JMP     loc_AB0A  ; orig: C - - - - - 0x016B3D 05:AB2D: 4C 0A AB  JMP loc_AB0A



sub_AB30_prepare_columns_table:  ; orig: sub_AB30_prepare_columns_table:
    MOVE.B  tbl_9F9E_overworld,D0  ; orig: C - - - - - 0x016B40 05:AB30: AD 9E 9F  LDA tbl_9F9E_overwor
    ; (empty translation for LDX)  ; orig: C - - - - - 0x016B43 05:AB33: AE 9F 9F  LDX tbl_9F9E_overwor
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x016B46 05:AB36: A4 10     LDY ram_dungeon_leve
    BEQ     bra_AB3E             ; BEQ  ; orig: C - - - - - 0x016B48 05:AB38: F0 04     BEQ bra_AB3E    ; if

; if dungeon
    MOVE.B  #< tbl_A3D4_dungeon,D0  ; orig: C - - - - - 0x016B4A 05:AB3A: A9 D4     LDA #< tbl_A3D4_dung
    MOVE.B  #> tbl_A3D4_dungeon,D1  ; orig: C - - - - - 0x016B4C 05:AB3C: A2 A3     LDX #> tbl_A3D4_dung
bra_AB3E:  ; orig: bra_AB3E:
    MOVE.B  D0,ram_6827_tbl_bat_columns  ; orig: C - - - - - 0x016B4E 05:AB3E: 8D 27 68  STA ram_6827_tbl_bat
    ; (empty translation for STX)  ; orig: C - - - - - 0x016B51 05:AB41: 8E 28 68  STX ram_6827_tbl_bat
    RTS                     ; RTS  ; orig: C - - - - - 0x016B54 05:AB44: 60        RTS



tbl_AB45:  ; orig: tbl_AB45:
    ; [DIRECTIVE] .WORD off_9BA8_00_normal_cave  -- needs manual handling  ; orig: - D 1 - - - 0x016B55 05:AB45: A8 9B     .word off_9BA8_00_no
    ; [DIRECTIVE] .WORD off_9BB8_02_cave_with_3_teleports  -- needs manual handling  ; orig: - D 1 - - - 0x016B57 05:AB47: B8 9B     .word off_9BB8_02_ca
    ; [DIRECTIVE] .WORD off_A3B4_04_underground_passage  -- needs manual handling  ; orig: - D 1 - - - 0x016B59 05:AB49: B4 A3     .word off_A3B4_04_un
    ; [DIRECTIVE] .WORD off_A3C4_06_underground_room_with_item  -- needs manual handling  ; orig: - D 1 - - - 0x016B5B 05:AB4B: C4 A3     .word off_A3C4_06_un



ofs_AB4D_03_draw_normal_cave:  ; orig: ofs_AB4D_03_draw_normal_cave:

; old man, shop
    MOVE.B  #$00,D1  ; orig: C - - J - - 0x016B5D 05:AB4D: A2 00     LDX #$00
bra_AB4F_draw_room:  ; orig: bra_AB4F_draw_room:
    MOVE.B  tbl_AB45(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B5F 05:AB4F: BD 45 AB  LDA tbl_AB45,X
    MOVE.B  D0,ram_0002_t09_data  ; orig: C - - - - - 0x016B62 05:AB52: 85 02     STA ram_0002_t09_dat
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016B64 05:AB54: BD 46 AB  LDA tbl_AB45 + $01,X
    ; (empty translation for STA)  ; orig: C - - - - - 0x016B67 05:AB57: 85 03     STA ram_0002_t09_dat
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x016B69 05:AB59: E6 13     INC ram_subscript
    JMP     loc_AA1B_draw_special_screen  ; orig: C - - - - - 0x016B6B 05:AB5B: 4C 1B AA  JMP loc_AA1B_draw_sp



ofs_039_AB5E_03_draw_cave_with_3_teleports:  ; orig: ofs_039_AB5E_03_draw_cave_with_3_teleports:
    MOVE.B  #$02,D1  ; orig: C - - J - - 0x016B6E 05:AB5E: A2 02     LDX #$02
    BNE     bra_AB4F_draw_room             ; BNE  ; orig: C - - - - - 0x016B70 05:AB60: D0 ED     BNE bra_AB4F_draw_ro



ofs_040_AB62_03_draw_underground_room:  ; orig: ofs_040_AB62_03_draw_underground_room:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x016B72 05:AB62: A9 00     LDA #$00
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x016B74 05:AB64: 85 E9     STA ram_00E9
    MOVE.B  #$04,D1  ; orig: C - - - - - 0x016B76 05:AB66: A2 04     LDX #$04    ; underg
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x016B78 05:AB68: 20 5A E8  JSR sub_0x01E86A_get
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x016B7B 05:AB6B: 29 01     AND #$01
    BEQ     bra_AB4F_draw_room             ; BEQ  ; orig: C - - - - - 0x016B7D 05:AB6D: F0 E0     BEQ bra_AB4F_draw_ro
    MOVE.B  #$06,D1  ; orig: C - - - - - 0x016B7F 05:AB6F: A2 06     LDX #$06    ; underg
    BNE     bra_AB4F_draw_room             ; BNE  ; orig: C - - - - - 0x016B81 05:AB71: D0 DC     BNE bra_AB4F_draw_ro



loc_AB73:  ; orig: loc_AB73:

; code for overworld only, not for dungeons
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C D 1 - - - 0x016B83 05:AB73: 20 CE E6  JSR sub_0x01E6DE_get
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x016B86 05:AB76: 0A        ASL
    BCS     bra_ABBB_RTS             ; BCS  ; orig: C - - - - - 0x016B87 05:AB77: B0 42     BCS bra_ABBB_RTS
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016B89 05:AB79: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$20,D0  ; orig: C - - - - - 0x016B8B 05:AB7B: 29 20     AND #$20
    BEQ     bra_ABBB_RTS             ; BEQ  ; orig: C - - - - - 0x016B8D 05:AB7D: F0 3C     BEQ bra_ABBB_RTS
    BSR     sub_AC07_set_block_address_pointer             ; JSR -> BSR  ; orig: C - - - - - 0x016B8F 05:AB7F: 20 07 AC  JSR sub_AC07_set_blo
    BSR     sub_bat_718A             ; JSR -> BSR  ; orig: C - - - - - 0x016B92 05:AB82: 20 8A 71  JSR sub_bat_718A

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016B95 05:AB85: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016B96 05:AB86: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016B97 05:AB87: AA        TAX
    MOVE.B  tbl_0x01E410_block_addresses(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016B98 05:AB88: BD 00 E4  LDA tbl_0x01E410_blo
    MOVE.B  D0,ram_0000_t03_block_address  ; orig: C - - - - - 0x016B9B 05:AB8B: 85 00     STA ram_0000_t03_blo
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016B9D 05:AB8D: BD 01 E4  LDA tbl_0x01E410_blo
    ; (empty translation for STA)  ; orig: C - - - - - 0x016BA0 05:AB90: 85 01     STA ram_0000_t03_blo
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x016BA2 05:AB92: 98        TYA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x016BA3 05:AB93: 38        SEC
    SUBX.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x016BA4 05:AB94: E9 40     SBC #$40

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BA6 05:AB96: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BA7 05:AB97: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BA8 05:AB98: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x016BA9 05:AB99: A8        TAY
    MOVEA.W ($FF0000+ram_0000_t03_block_address).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x016BAA 05:AB9A: B1 00     LDA (ram_0000_t03_bl
    CMPI.B  #$C4,D0  ; orig: C - - - - - 0x016BAC 05:AB9C: C9 C4     CMP #$C4
    BEQ     bra_ABBC             ; BEQ  ; orig: C - - - - - 0x016BAE 05:AB9E: F0 1C     BEQ bra_ABBC
    CMPI.B  #$BC,D0  ; orig: C - - - - - 0x016BB0 05:ABA0: C9 BC     CMP #$BC
    BEQ     bra_ABBB_RTS             ; BEQ  ; orig: C - - - - - 0x016BB2 05:ABA2: F0 17     BEQ bra_ABBB_RTS
    CMPI.B  #$D8,D0  ; orig: C - - - - - 0x016BB4 05:ABA4: C9 D8     CMP #$D8
    BNE     bra_ABBC             ; BNE  ; orig: C - - - - - 0x016BB6 05:ABA6: D0 14     BNE bra_ABBC
    MOVE.B  ram_052B_special_metatile_id,D0  ; orig: C - - - - - 0x016BB8 05:ABA8: AD 2B 05  LDA ram_052B_special
    CMPI.B  #$62,D0  ; orig: C - - - - - 0x016BBB 05:ABAB: C9 62     CMP #$62
    BEQ     bra_ABBC             ; BEQ  ; orig: C - - - - - 0x016BBD 05:ABAD: F0 0D     BEQ bra_ABBC
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x016BBF 05:ABAF: A9 00     LDA #$00
    MOVE.B  D0,ram_052B_special_metatile_id  ; orig: - - - - - - 0x016BC1 05:ABB1: 8D 2B 05  STA ram_052B_special
    MOVE.B  #$0C,D0  ; orig: - - - - - - 0x016BC4 05:ABB4: A9 0C     LDA #$0C
    MOVE.B  D0,ram_000D_t03  ; orig: - - - - - - 0x016BC6 05:ABB6: 85 0D     STA ram_000D_t03
bra_ABB8:  ; orig: bra_ABB8:

; bzk optimize, JMP
    BSR     sub_AAF1_unpack_and_write_2x2_block             ; JSR -> BSR  ; orig: C - - - - - 0x016BC8 05:ABB8: 20 F1 AA  JSR sub_AAF1_unpack_
bra_ABBB_RTS:  ; orig: bra_ABBB_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x016BCB 05:ABBB: 60        RTS
bra_ABBC:  ; orig: bra_ABBC:
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x016BCC 05:ABBC: A9 10     LDA #$10
    MOVE.B  D0,ram_000D_t03  ; orig: C - - - - - 0x016BCE 05:ABBE: 85 0D     STA ram_000D_t03
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x016BD0 05:ABC0: A9 70     LDA #$70
    BNE     bra_ABB8             ; BNE  ; orig: C - - - - - 0x016BD2 05:ABC2: D0 F4     BNE bra_ABB8    ; jm



sub_0x016BD4:  ; orig: sub_0x016BD4:
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x016BD4 05:ABC4: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016BD5 05:ABC5: 48        PHA
    MOVE.B  ram_pos_X_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016BD6 05:ABC6: B5 70     LDA ram_pos_X_enemy,
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x016BD8 05:ABC8: 29 F0     AND #$F0

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BDA 05:ABCA: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BDB 05:ABCB: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016BDC 05:ABCC: AA        TAX
    MOVE.B  tbl_0x01E410_block_addresses(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016BDD 05:ABCD: BD 00 E4  LDA tbl_0x01E410_blo
    MOVE.B  D0,ram_0000_t03_block_address  ; orig: C - - - - - 0x016BE0 05:ABD0: 85 00     STA ram_0000_t03_blo
    ; (empty translation for LDA)  ; orig: C - - - - - 0x016BE2 05:ABD2: BD 01 E4  LDA tbl_0x01E410_blo
    ; (empty translation for STA)  ; orig: C - - - - - 0x016BE5 05:ABD5: 85 01     STA ram_0000_t03_blo
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016BE7 05:ABD7: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x016BE8 05:ABD8: 48        PHA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016BE9 05:ABD9: AA        TAX
    MOVE.B  ram_pos_Y_enemy(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x016BEA 05:ABDA: B5 84     LDA ram_pos_Y_enemy,
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x016BEC 05:ABDC: 29 F0     AND #$F0
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x016BEE 05:ABDE: 38        SEC
    SUBX.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x016BEF 05:ABDF: E9 40     SBC #$40

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BF1 05:ABE1: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BF2 05:ABE2: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x016BF3 05:ABE3: 4A        LSR
    BSR     sub_bat_7276_inc_0000_pointer_by_A             ; JSR -> BSR  ; orig: C - - - - - 0x016BF4 05:ABE4: 20 76 72  JSR sub_bat_7276_inc
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x016BF7 05:ABE7: A0 00     LDY #$00
    MOVE.B  #$10,D1  ; orig: C - - - - - 0x016BF9 05:ABE9: A2 10     LDX #$10
    MOVE.B  ram_0005_t07,D0  ; orig: C - - - - - 0x016BFB 05:ABEB: A5 05     LDA ram_0005_t07
    CMPI.B  #$27,D0  ; orig: C - - - - - 0x016BFD 05:ABED: C9 27     CMP #$27
    BCC     bra_ABF5             ; BCC  ; orig: C - - - - - 0x016BFF 05:ABEF: 90 04     BCC bra_ABF5
    CMPI.B  #$F3,D0  ; orig: C - - - - - 0x016C01 05:ABF1: C9 F3     CMP #$F3
    BCC     bra_ABFF             ; BCC  ; orig: C - - - - - 0x016C03 05:ABF3: 90 0A     BCC bra_ABFF
bra_ABF5:  ; orig: bra_ABF5:
    MOVE.B  #$0E,D1  ; orig: C - - - - - 0x016C05 05:ABF5: A2 0E     LDX #$0E
bra_ABF7_loop:  ; orig: bra_ABF7_loop:
    CMP.B   tbl_A97C(D1.L),D0  ; orig: C - - - - - 0x016C07 05:ABF7: DD 7C A9  CMP tbl_A97C,X
    BEQ     bra_ABFF             ; BEQ  ; orig: C - - - - - 0x016C0A 05:ABFA: F0 03     BEQ bra_ABFF
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x016C0C 05:ABFC: CA        DEX
    BNE     bra_ABF7_loop             ; BNE  ; orig: C - - - - - 0x016C0D 05:ABFD: D0 F8     BNE bra_ABF7_loop
bra_ABFF:  ; orig: bra_ABFF:
    MOVE.B  D1,ram_000D_t03  ; orig: C - - - - - 0x016C0F 05:ABFF: 86 0D     STX ram_000D_t03
    BSR     sub_AAF1_unpack_and_write_2x2_block             ; JSR -> BSR  ; orig: C - - - - - 0x016C11 05:AC01: 20 F1 AA  JSR sub_AAF1_unpack_
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x016C14 05:AC04: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x016C15 05:AC05: AA        TAX
    RTS                     ; RTS  ; orig: C - - - - - 0x016C16 05:AC06: 60        RTS



sub_AC07_set_block_address_pointer:  ; orig: sub_AC07_set_block_address_pointer:
sub_0x016C17_set_block_address_pointer:  ; orig: sub_0x016C17_set_block_address_pointer:

; out

; ram_0000_t03_block_address
    MOVE.B  #< ram_6530,D0  ; orig: C - - - - - 0x016C17 05:AC07: A9 30     LDA #< ram_6530
    MOVE.B  D0,ram_0000_t03_block_address  ; orig: C - - - - - 0x016C19 05:AC09: 85 00     STA ram_0000_t03_blo
    MOVE.B  #> ram_6530,D0  ; orig: C - - - - - 0x016C1B 05:AC0B: A9 65     LDA #> ram_6530
    ; (empty translation for STA)  ; orig: C - - - - - 0x016C1D 05:AC0D: 85 01     STA ram_0000_t03_blo
    RTS                     ; RTS  ; orig: C - - - - - 0x016C1F 05:AC0F: 60        RTS



sub_AC10:  ; orig: sub_AC10:
ofs_024_AC10_05:  ; orig: ofs_024_AC10_05:
ofs_038_AC10_04:  ; orig: ofs_038_AC10_04:
ofs_039_AC10_04:  ; orig: ofs_039_AC10_04:
ofs_040_AC10_04:  ; orig: ofs_040_AC10_04:
    BSR     sub_AC16             ; JSR -> BSR  ; orig: C - - J - - 0x016C20 05:AC10: 20 16 AC  JSR sub_AC16
    BCS     bra_AC27             ; BCS  ; orig: C - - - - - 0x016C23 05:AC13: B0 12     BCS bra_AC27
    RTS                     ; RTS  ; orig: C - - - - - 0x016C25 05:AC15: 60        RTS



sub_AC16:  ; orig: sub_AC16:

; out

; C

; 0 =

; 1 =
    BSR     sub_A924             ; JSR -> BSR  ; orig: C - - - - - 0x016C26 05:AC16: 20 24 A9  JSR sub_A924
    ADDQ.B  #1,ram_00E9  ; orig: C - - - - - 0x016C29 05:AC19: E6 E9     INC ram_00E9
    MOVE.B  ram_00E9,D0  ; orig: C - - - - - 0x016C2B 05:AC1B: A5 E9     LDA ram_00E9
    CMPI.B  #$16,D0  ; orig: C - - - - - 0x016C2D 05:AC1D: C9 16     CMP #$16
    RTS                     ; RTS  ; orig: C - - - - - 0x016C2F 05:AC1F: 60        RTS



ofs_024_AC20_04:  ; orig: ofs_024_AC20_04:
    BSR     sub_A8C4             ; JSR -> BSR  ; orig: C - - J - - 0x016C30 05:AC20: 20 C4 A8  JSR sub_A8C4
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x016C33 05:AC23: A9 00     LDA #$00
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x016C35 05:AC25: 85 E9     STA ram_00E9
bra_AC27:  ; orig: bra_AC27:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x016C37 05:AC27: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x016C39 05:AC29: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C3A 05:AC2A: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C40 05:AC30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C50 05:AC40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C60 05:AC50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C70 05:AC60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C80 05:AC70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016C90 05:AC80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CA0 05:AC90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CB0 05:ACA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CC0 05:ACB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CD0 05:ACC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CE0 05:ACD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016CF0 05:ACE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D00 05:ACF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D10 05:AD00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D20 05:AD10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D30 05:AD20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D40 05:AD30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D50 05:AD40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D60 05:AD50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D70 05:AD60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D80 05:AD70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016D90 05:AD80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DA0 05:AD90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DB0 05:ADA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DC0 05:ADB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DD0 05:ADC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DE0 05:ADD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016DF0 05:ADE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E00 05:ADF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E10 05:AE00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E20 05:AE10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E30 05:AE20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E40 05:AE30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E50 05:AE40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E60 05:AE50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E70 05:AE60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E80 05:AE70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016E90 05:AE80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016EA0 05:AE90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016EB0 05:AEA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016EC0 05:AEB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016ED0 05:AEC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016EE0 05:AED0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016EF0 05:AEE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F00 05:AEF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F10 05:AF00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F20 05:AF10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F30 05:AF20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F40 05:AF30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F50 05:AF40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F60 05:AF50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F70 05:AF60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F80 05:AF70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016F90 05:AF80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FA0 05:AF90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FB0 05:AFA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FC0 05:AFB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FD0 05:AFC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FE0 05:AFD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x016FF0 05:AFE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017000 05:AFF0: FF        .byte $FF, $FF, $FF,



ofs_002_0x017010_02:  ; orig: ofs_002_0x017010_02:
    MOVE.B  ram_map_location,D0  ; orig: C - - J - - 0x017010 05:B000: A5 EB     LDA ram_map_location
    BSR     sub_83D7             ; JSR -> BSR  ; orig: C - - - - - 0x017012 05:B002: 20 D7 83  JSR sub_83D7
    MOVE.B  #con_ppu_buf_overworld_palette,D0  ; orig: C - - - - - 0x017015 05:B005: A9 18     LDA #con_ppu_buf_ove
    BNE     bra_B018             ; BNE  ; orig: C - - - - - 0x017017 05:B007: D0 0F     BNE bra_B018    ; jm



loc_B009:  ; orig: loc_B009:
ofs_002_0x017019_03:  ; orig: ofs_002_0x017019_03:
    MOVE.B  #$D0,D0  ; orig: C D 1 J - - 0x017019 05:B009: A9 D0     LDA #$D0
    MOVE.B  #$17,D2  ; orig: C - - - - - 0x01701B 05:B00B: A0 17     LDY #$17
bra_B00D:  ; orig: bra_B00D:
    JMP     loc_8501  ; orig: C - - - - - 0x01701D 05:B00D: 4C 01 85  JMP loc_8501



sub_B010:  ; orig: sub_B010:
ofs_002_0x017020_04:  ; orig: ofs_002_0x017020_04:
    MOVE.B  #$E8,D0  ; orig: C - - J - - 0x017020 05:B010: A9 E8     LDA #$E8
    MOVE.B  #$2F,D2  ; orig: C - - - - - 0x017022 05:B012: A0 2F     LDY #$2F
    BNE     bra_B00D             ; BNE  ; orig: C - - - - - 0x017024 05:B014: D0 F7     BNE bra_B00D    ; jm



ofs_002_0x017026_05:  ; orig: ofs_002_0x017026_05:
    MOVE.B  #con_ppu_buf_hud,D0  ; orig: C - - J - - 0x017026 05:B016: A9 0E     LDA #con_ppu_buf_hud
bra_B018:  ; orig: bra_B018:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C - - - - - 0x017028 05:B018: 85 14     STA ram_ppu_load_ind
bra_B01A:  ; orig: bra_B01A:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x01702A 05:B01A: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x01702C 05:B01C: 60        RTS



ofs_002_0x01702D_06:  ; orig: ofs_002_0x01702D_06:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - J - - 0x01702D 05:B01D: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B026             ; BEQ  ; orig: C - - - - - 0x01702F 05:B01F: F0 05     BEQ bra_B026    ; if

; if dungeon
    BSR     sub_B5EF             ; JSR -> BSR  ; orig: C - - - - - 0x017031 05:B021: 20 EF B5  JSR sub_B5EF
    BEQ     bra_B01A             ; BEQ  ; orig: C - - - - - 0x017034 05:B024: F0 F4     BEQ bra_B01A
bra_B026:  ; orig: bra_B026:
    MOVE.B  #con_ppu_buf_44_minimap,D0  ; orig: C - - - - - 0x017036 05:B026: A9 44     LDA #con_ppu_buf_44_
    BNE     bra_B018             ; BNE  ; orig: C - - - - - 0x017038 05:B028: D0 EE     BNE bra_B018    ; jm



ofs_002_0x01703A_07_draw_level_text:  ; orig: ofs_002_0x01703A_07_draw_level_text:
    MOVE.B  ram_6BB1,D0  ; orig: C - - J - - 0x01703A 05:B02A: AD B1 6B  LDA ram_6BB1
    BEQ     bra_B01A             ; BEQ  ; orig: C - - - - - 0x01703D 05:B02D: F0 EB     BEQ bra_B01A
    MOVE.B  D0,ram_6825  ; orig: C - - - - - 0x01703F 05:B02F: 8D 25 68  STA ram_6825    ; ch
    MOVE.B  #con_ppu_buf_level_text,D0  ; orig: C - - - - - 0x017042 05:B032: A9 0C     LDA #con_ppu_buf_lev
    BNE     bra_B018             ; BNE  ; orig: C - - - - - 0x017044 05:B034: D0 E2     BNE bra_B018    ; jm



ofs_002_0x017046_08:  ; orig: ofs_002_0x017046_08:
    BSR     sub_A8C4             ; JSR -> BSR  ; orig: C - - J - - 0x017046 05:B036: 20 C4 A8  JSR sub_A8C4
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x017049 05:B039: A0 10     LDY #$10
    MOVE.B  D2,ram_007C  ; orig: C - - - - - 0x01704B 05:B03B: 84 7C     STY ram_007C
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01704D 05:B03D: C8        INY ; 11
    ; (empty translation for STY)  ; orig: C - - - - - 0x01704E 05:B03E: 84 7D     STY ram_007C + $01
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x017050 05:B040: A9 00     LDA #$00
    MOVE.B  D0,ram_0017_rendering_flag  ; orig: C - - - - - 0x017052 05:B042: 85 17     STA ram_0017_renderi
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x017054 05:B044: A9 08     LDA #con_dir_Up
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x017056 05:B046: 85 98     STA ram_dir_link
    MOVE.B  #$78,D0  ; orig: C - - - - - 0x017058 05:B048: A9 78     LDA #$78
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x01705A 05:B04A: 85 70     STA ram_pos_X_link
    MOVE.B  ram_6BA6,D0  ; orig: C - - - - - 0x01705C 05:B04C: AD A6 6B  LDA ram_6BA6
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x01705F 05:B04F: 85 84     STA ram_pos_Y_link
    JMP     loc_bat_6C90  ; orig: C - - - - - 0x017061 05:B051: 4C 90 6C  JMP loc_bat_6C90



tbl_B054:  ; orig: tbl_B054:

; Y = 00
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 1 - - - 0x017064 05:B054: 11        .byte $11   ; 00
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 1 - - - 0x017065 05:B055: E0        .byte $E0   ; 01
    ; [DIRECTIVE] .BYTE $4E  -- needs manual handling  ; orig: - D 1 - - - 0x017066 05:B056: 4E        .byte $4E   ; 02
    ; [DIRECTIVE] .BYTE $CD  -- needs manual handling  ; orig: - D 1 - - - 0x017067 05:B057: CD        .byte $CD   ; 03
    ; [DIRECTIVE] .BYTE $89  -- needs manual handling  ; orig: - D 1 - - - 0x017068 05:B058: 89        .byte $89   ; 04 min

; Y = 05
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - - - 0x017069 05:B059: 21        .byte $21   ; 00
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - - - 0x01706A 05:B05A: D0        .byte $D0   ; 01
    ; [DIRECTIVE] .BYTE $5E  -- needs manual handling  ; orig: - D 1 - - - 0x01706B 05:B05B: 5E        .byte $5E   ; 02
    ; [DIRECTIVE] .BYTE $BD  -- needs manual handling  ; orig: - D 1 - - - 0x01706C 05:B05C: BD        .byte $BD   ; 03
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - - - 0x01706D 05:B05D: 78        .byte $78   ; 04 min



sub_B05E:  ; orig: sub_B05E:
sub_0x01706E:  ; orig: sub_0x01706E:
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x01706E 05:B05E: A0 05     LDY #$05
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x017070 05:B060: A5 10     LDA ram_dungeon_leve
    BNE     bra_B068             ; BNE  ; orig: C - - - - - 0x017072 05:B062: D0 04     BNE bra_B068    ; if

; if overworld
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x017074 05:B064: A0 00     LDY #$00
    MOVE.B  D2,ram_0053  ; orig: C - - - - - 0x017076 05:B066: 84 53     STY ram_0053
bra_B068:  ; orig: bra_B068:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x017078 05:B068: A2 00     LDX #$00
bra_B06A_loop:  ; orig: bra_B06A_loop:
    MOVE.B  tbl_B054(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01707A 05:B06A: B9 54 B0  LDA tbl_B054,Y
    MOVE.B  D0,ram_0346(D1.L)  ; STA abs,X  ; orig: C - - - - - 0x01707D 05:B06D: 9D 46 03  STA ram_0346,X
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x017080 05:B070: C8        INY
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x017081 05:B071: E8        INX
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x017082 05:B072: E0 05     CPX #$05
    BNE     bra_B06A_loop             ; BNE  ; orig: C - - - - - 0x017084 05:B074: D0 F4     BNE bra_B06A_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x017086 05:B076: 60        RTS



tbl_B077:  ; orig: tbl_B077:
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 1 - - - 0x017087 05:B077: 28        .byte $28   ; 00
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - - - 0x017088 05:B078: D8        .byte $D8   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x017089 05:B079: 00        .byte $00   ; 02



ofs_main_script_1_0x01708A_06:  ; orig: ofs_main_script_1_0x01708A_06:

; con_script_screen_trans_start
    BSR     sub_0x01EA61             ; JSR -> BSR  ; orig: C - - J - - 0x01708A 05:B07A: 20 51 EA  JSR sub_0x01EA61
    BSR     sub_0x01EA4D             ; JSR -> BSR  ; orig: C - - - - - 0x01708D 05:B07D: 20 3D EA  JSR sub_0x01EA4D
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x017090 05:B080: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B087             ; BEQ  ; orig: C - - - - - 0x017092 05:B082: F0 03     BEQ bra_B087    ; if

; if dungeon
    BSR     sub_bat_7512             ; JSR -> BSR  ; orig: C - - - - - 0x017094 05:B084: 20 12 75  JSR sub_bat_7512
bra_B087:  ; orig: bra_B087:
    BSR     sub_0x01F248             ; JSR -> BSR  ; orig: C - - - - - 0x017097 05:B087: 20 38 F2  JSR sub_0x01F248
    BSR     sub_B464             ; JSR -> BSR  ; orig: C - - - - - 0x01709A 05:B08A: 20 64 B4  JSR sub_B464
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01709D 05:B08D: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B0AB             ; BEQ  ; orig: C - - - - - 0x01709F 05:B08F: F0 1A     BEQ bra_B0AB    ; if

; if dungeon
    BSR     sub_B0C3             ; JSR -> BSR  ; orig: C - - - - - 0x0170A1 05:B091: 20 C3 B0  JSR sub_B0C3
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0170A4 05:B094: 48        PHA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0170A5 05:B095: 29 07     AND #$07
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x0170A7 05:B097: C9 02     CMP #$02
    BNE     bra_B0A0             ; BNE  ; orig: C - - - - - 0x0170A9 05:B099: D0 05     BNE bra_B0A0
    MOVE.B  #con_sfx_2_secret_found,D0  ; orig: C - - - - - 0x0170AB 05:B09B: A9 04     LDA #con_sfx_2_secre
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x0170AD 05:B09D: 8D 02 06  STA ram_sfx_2
bra_B0A0:  ; orig: bra_B0A0:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0170B0 05:B0A0: 68        PLA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0170B1 05:B0A1: 29 07     AND #$07
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x0170B3 05:B0A3: C9 02     CMP #$02
    BCC     bra_B0AB             ; BCC  ; orig: C - - - - - 0x0170B5 05:B0A5: 90 04     BCC bra_B0AB
    CMPI.B  #$05,D0  ; orig: C - - - - - 0x0170B7 05:B0A7: C9 05     CMP #$05
    BCC     bra_B0AD             ; BCC  ; orig: C - - - - - 0x0170B9 05:B0A9: 90 02     BCC bra_B0AD
bra_B0AB:  ; orig: bra_B0AB:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x0170BB 05:B0AB: A0 02     LDY #$02
bra_B0AD:  ; orig: bra_B0AD:
    MOVE.B  tbl_B077(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0170BD 05:B0AD: B9 77 B0  LDA tbl_B077,Y
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x0170C0 05:B0B0: 8D 94 03  STA ram_0394_link
    BSR     sub_0x01EAED             ; JSR -> BSR  ; orig: C - - - - - 0x0170C3 05:B0B3: 20 DD EA  JSR sub_0x01EAED
sub_B0B6:  ; orig: sub_B0B6:
sub_0x0170C6:  ; orig: sub_0x0170C6:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0170C6 05:B0B6: A9 00     LDA #$00
    MOVE.B  D0,ram_0064  ; orig: C - - - - - 0x0170C8 05:B0B8: 85 64     STA ram_0064
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x0170CA 05:B0BA: A0 05     LDY #$05
bra_B0BC_loop:  ; orig: bra_B0BC_loop:
    MOVE.B  D0,ram_00B9(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x0170CC 05:B0BC: 99 B9 00  STA ram_00B9,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0170CF 05:B0BF: 88        DEY
    BPL     bra_B0BC_loop             ; BPL  ; orig: C - - - - - 0x0170D0 05:B0C0: 10 FA     BPL bra_B0BC_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0170D2 05:B0C2: 60        RTS



sub_B0C3:  ; orig: sub_B0C3:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0170D3 05:B0C3: A0 00     LDY #$00
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0170D5 05:B0C5: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__DR,D0  ; orig: C - - - - - 0x0170D7 05:B0C7: 29 05     AND #con_dir__DR
    BEQ     bra_B0CC             ; BEQ  ; orig: C - - - - - 0x0170D9 05:B0C9: F0 01     BEQ bra_B0CC
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0170DB 05:B0CB: C8        INY ; 01
bra_B0CC:  ; orig: bra_B0CC:
    MOVE.B  D2,ram_000F_t01_direction  ; orig: C - - - - - 0x0170DC 05:B0CC: 84 0F     STY ram_000F_t01_dir
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0170DE 05:B0CE: A5 98     LDA ram_dir_link
    MOVE.B  ram_script,D2  ; orig: C - - - - - 0x0170E0 05:B0D0: A4 12     LDY ram_script
    CMPI.B  #con_script_screen_trans_start,D2  ; orig: C - - - - - 0x0170E2 05:B0D2: C0 06     CPY #con_script_scre
    BEQ     bra_B0D9             ; BEQ  ; orig: C - - - - - 0x0170E4 05:B0D4: F0 03     BEQ bra_B0D9
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x0170E6 05:B0D6: 20 13 70  JSR sub_bat_7013_get
bra_B0D9:  ; orig: bra_B0D9:
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x0170E9 05:B0D9: 85 02     STA ram_0002_t24_dir
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x0170EB 05:B0DB: 20 F6 A3  JSR sub_A3F6
    MOVE.B  ram_000F_t01_direction,D2  ; orig: C - - - - - 0x0170EE 05:B0DE: A4 0F     LDY ram_000F_t01_dir
    RTS                     ; RTS  ; orig: C - - - - - 0x0170F0 05:B0E0: 60        RTS



sub_B0E1_write_nametable_attributes_to_buffer:  ; orig: sub_B0E1_write_nametable_attributes_to_buffer:

; in

; A =

; X =

; Y =
    MOVE.B  D1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x0170F1 05:B0E1: 8E 02 03  STX ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x0170F4 05:B0E4: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  #$18,D1  ; orig: C - - - - - 0x0170F7 05:B0E7: A2 18     LDX #$18    ; counte
    ; (empty translation for STX)  ; orig: C - - - - - 0x0170F9 05:B0E9: 8E 04 03  STX ram_0302_ppu_buf
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x0170FC 05:B0EC: A9 FF     LDA #$FF    ; close 
    ; (empty translation for STA)  ; orig: C - - - - - 0x0170FE 05:B0EE: 9D 05 03  STA ram_0302_ppu_buf
bra_B0F1_loop:  ; orig: bra_B0F1_loop:
    MOVE.B  ram_0530_nmt_attr_buffer(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017101 05:B0F1: B9 30 05  LDA ram_0530_nmt_att
    ; (empty translation for STA)  ; orig: C - - - - - 0x017104 05:B0F4: 9D 04 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x017107 05:B0F7: 88        DEY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x017108 05:B0F8: CA        DEX
    BNE     bra_B0F1_loop             ; BNE  ; orig: C - - - - - 0x017109 05:B0F9: D0 F6     BNE bra_B0F1_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01710B 05:B0FB: 60        RTS



ofs_main_script_1_0x01710C_0A:  ; orig: ofs_main_script_1_0x01710C_0A:

; con_script_0A
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x01710C 05:B0FC: A5 13     LDA ram_subscript
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01710E 05:B0FE: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_024_B117_00  -- needs manual handling  ; orig: - D 1 - I - 0x017111 05:B101: 17 B1     .word ofs_024_B117_0
    ; [DIRECTIVE] .WORD ofs_024_B153_01  -- needs manual handling  ; orig: - D 1 - I - 0x017113 05:B103: 53 B1     .word ofs_024_B153_0
    ; [DIRECTIVE] .WORD ofs_024_B147_02  -- needs manual handling  ; orig: - D 1 - I - 0x017115 05:B105: 47 B1     .word ofs_024_B147_0
    ; [DIRECTIVE] .WORD ofs_024_B13C_03  -- needs manual handling  ; orig: - D 1 - I - 0x017117 05:B107: 3C B1     .word ofs_024_B13C_0
    ; [DIRECTIVE] .WORD ofs_024_AC20_04  -- needs manual handling  ; orig: - D 1 - I - 0x017119 05:B109: 20 AC     .word ofs_024_AC20_0
    ; [DIRECTIVE] .WORD ofs_024_AC10_05  -- needs manual handling  ; orig: - D 1 - I - 0x01711B 05:B10B: 10 AC     .word ofs_024_AC10_0
    ; [DIRECTIVE] .WORD ofs_024_B166_06  -- needs manual handling  ; orig: - D 1 - I - 0x01711D 05:B10D: 66 B1     .word ofs_024_B166_0
    ; [DIRECTIVE] .WORD ofs_024_B173_07  -- needs manual handling  ; orig: - D 1 - I - 0x01711F 05:B10F: 73 B1     .word ofs_024_B173_0
    ; [DIRECTIVE] .WORD ofs_024_B14B_08  -- needs manual handling  ; orig: - D 1 - I - 0x017121 05:B111: 4B B1     .word ofs_024_B14B_0
    ; [DIRECTIVE] .WORD ofs_024_B13C_09  -- needs manual handling  ; orig: - D 1 - I - 0x017123 05:B113: 3C B1     .word ofs_024_B13C_0
    ; [DIRECTIVE] .WORD ofs_024_B15A_0A  -- needs manual handling  ; orig: - D 1 - I - 0x017125 05:B115: 5A B1     .word ofs_024_B15A_0



ofs_024_B117_00:  ; orig: ofs_024_B117_00:
ofs_038_B117_00:  ; orig: ofs_038_B117_00:
ofs_039_B117_00:  ; orig: ofs_039_B117_00:
ofs_040_B117_00:  ; orig: ofs_040_B117_00:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x017127 05:B117: A9 00     LDA #$00
    MOVE.B  D0,ram_00E9  ; orig: C - - - - - 0x017129 05:B119: 85 E9     STA ram_00E9
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x01712B 05:B11B: 85 EE     STA ram_00EE
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01712D 05:B11D: A5 10     LDA ram_dungeon_leve
    BNE     bra_B127             ; BNE  ; orig: C - - - - - 0x01712F 05:B11F: D0 06     BNE bra_B127    ; if

; if overworld
    BSR     sub_B127             ; JSR -> BSR  ; orig: C - - - - - 0x017131 05:B121: 20 27 B1  JSR sub_B127
    JMP     loc_83B2  ; orig: C - - - - - 0x017134 05:B124: 4C B2 83  JMP loc_83B2
bra_B127:  ; orig: bra_B127:
sub_B127:  ; orig: sub_B127:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x017137 05:B127: E6 13     INC ram_subscript
    JMP     loc_0x01EA4D  ; orig: C - - - - - 0x017139 05:B129: 4C 3D EA  JMP loc_0x01EA4D



ofs_040_B12C_05:  ; orig: ofs_040_B12C_05:
    MOVE.B  #con_ppu_buf_26,D0  ; orig: C - - J - - 0x01713C 05:B12C: A9 26     LDA #con_ppu_buf_26
bra_B12E:  ; orig: bra_B12E:
loc_B12E_set_ppu_load_index:  ; orig: loc_B12E_set_ppu_load_index:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C D 1 - - - 0x01713E 05:B12E: 85 14     STA ram_ppu_load_ind
bra_B130:  ; orig: bra_B130:
ofs_038_B130_02:  ; orig: ofs_038_B130_02:
ofs_039_B130_02:  ; orig: ofs_039_B130_02:
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x017140 05:B130: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x017142 05:B132: 60        RTS



ofs_040_B133_01:  ; orig: ofs_040_B133_01:
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x017143 05:B133: A9 00     LDA #$00
bra_B135:  ; orig: bra_B135:
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x017145 05:B135: A4 10     LDY ram_dungeon_leve
    BEQ     bra_B130             ; BEQ  ; orig: C - - - - - 0x017147 05:B137: F0 F7     BEQ bra_B130    ; if

; if dungeon
    BSR     sub_87B3             ; JSR -> BSR  ; orig: C - - - - - 0x017149 05:B139: 20 B3 87  JSR sub_87B3
ofs_040_B13C_02:  ; orig: ofs_040_B13C_02:
ofs_040_B13C_07:  ; orig: ofs_040_B13C_07:
ofs_024_B13C_03:  ; orig: ofs_024_B13C_03:
ofs_024_B13C_09:  ; orig: ofs_024_B13C_09:
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - J - - 0x01714C 05:B13C: A4 10     LDY ram_dungeon_leve
    BEQ     bra_B130             ; BEQ  ; orig: C - - - - - 0x01714E 05:B13E: F0 F0     BEQ bra_B130    ; if

; if dungeon
    JMP     loc_8CFB  ; orig: C - - - - - 0x017150 05:B140: 4C FB 8C  JMP loc_8CFB



ofs_040_B143_06:  ; orig: ofs_040_B143_06:
    MOVE.B  #$A0,D0  ; orig: C - - J - - 0x017153 05:B143: A9 A0     LDA #$A0
    BNE     bra_B135             ; BNE  ; orig: C - - - - - 0x017155 05:B145: D0 EE     BNE bra_B135    ; jm



ofs_024_B147_02:  ; orig: ofs_024_B147_02:
    MOVE.B  #$20,D0  ; orig: C - - J - - 0x017157 05:B147: A9 20     LDA #$20
    BNE     bra_B135             ; BNE  ; orig: C - - - - - 0x017159 05:B149: D0 EA     BNE bra_B135    ; jm



ofs_024_B14B_08:  ; orig: ofs_024_B14B_08:
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x01715B 05:B14B: A9 80     LDA #$80
    BNE     bra_B135             ; BNE  ; orig: C - - - - - 0x01715D 05:B14D: D0 E6     BNE bra_B135    ; jm



ofs_038_B14F_01:  ; orig: ofs_038_B14F_01:
ofs_039_B14F_01:  ; orig: ofs_039_B14F_01:
    MOVE.B  #con_ppu_buf_cave_palette,D0  ; orig: C - - J - - 0x01715F 05:B14F: A9 3E     LDA #con_ppu_buf_cav
    BNE     bra_B12E             ; BNE  ; orig: C - - - - - 0x017161 05:B151: D0 DB     BNE bra_B12E    ; jm



ofs_024_B153_01:  ; orig: ofs_024_B153_01:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - J - - 0x017163 05:B153: A5 10     LDA ram_dungeon_leve
    BNE     bra_B130             ; BNE  ; orig: C - - - - - 0x017165 05:B155: D0 D9     BNE bra_B130    ; if

; if overworld
    JMP     loc_0x01EA3B_set_tunic_color  ; orig: C - - - - - 0x017167 05:B157: 4C 2B EA  JMP loc_0x01EA3B_set



ofs_024_B15A_0A:  ; orig: ofs_024_B15A_0A:
    BSR     sub_B0B6             ; JSR -> BSR  ; orig: C - - J - - 0x01716A 05:B15A: 20 B6 B0  JSR sub_B0B6
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01716D 05:B15D: A9 00     LDA #$00
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x01716F 05:B15F: 85 13     STA ram_subscript
    MOVE.B  #con_script_04_screen_trans_end,D0  ; orig: C - - - - - 0x017171 05:B161: A9 04     LDA #con_script_04_s
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x017173 05:B163: 85 12     STA ram_script
    RTS                     ; RTS  ; orig: C - - - - - 0x017175 05:B165: 60        RTS



ofs_024_B166_06:  ; orig: ofs_024_B166_06:
    MOVE.B  ram_map_location,D0  ; orig: C - - J - - 0x017176 05:B166: A5 EB     LDA ram_map_location
    JMP     loc_B16D  ; orig: C - - - - - 0x017178 05:B168: 4C 6D B1  JMP loc_B16D



ofs_038_B16B_05:  ; orig: ofs_038_B16B_05:
ofs_039_B16B_05:  ; orig: ofs_039_B16B_05:
    MOVE.B  #$44,D0  ; orig: C - - J - - 0x01717B 05:B16B: A9 44     LDA #$44
loc_B16D:  ; orig: loc_B16D:
    BSR     sub_83D7             ; JSR -> BSR  ; orig: C D 1 - - - 0x01717D 05:B16D: 20 D7 83  JSR sub_83D7
    JMP     loc_B009  ; orig: C - - - - - 0x017180 05:B170: 4C 09 B0  JMP loc_B009



ofs_024_B173_07:  ; orig: ofs_024_B173_07:
ofs_038_B173_06:  ; orig: ofs_038_B173_06:
ofs_039_B173_06:  ; orig: ofs_039_B173_06:
    BSR     sub_B010             ; JSR -> BSR  ; orig: C - - J - - 0x017183 05:B173: 20 10 B0  JSR sub_B010

; bzk optimize, after deleting 0x017189 this JMP will be useless
    JMP     loc_B17B_clear_screen_transition_flag  ; orig: C - - - - - 0x017186 05:B176: 4C 7B B1  JMP loc_B17B_clear_s



; bzk garbage
    ADDQ.B  #1,ram_subscript  ; orig: - - - - - - 0x017189 05:B179: E6 13     INC ram_subscript



loc_B17B_clear_screen_transition_flag:  ; orig: loc_B17B_clear_screen_transition_flag:
    MOVE.B  #$00,D0  ; orig: C D 1 - - - 0x01718B 05:B17B: A9 00     LDA #$00
    MOVE.B  D0,ram_screen_transition_flag  ; orig: C - - - - - 0x01718D 05:B17D: 85 E3     STA ram_screen_trans
    RTS                     ; RTS  ; orig: C - - - - - 0x01718F 05:B17F: 60        RTS



ofs_038_B180_08:  ; orig: ofs_038_B180_08:
ofs_039_B180_08:  ; orig: ofs_039_B180_08:
    MOVE.B  ram_0394_link,D0  ; orig: C - - J - - 0x017190 05:B180: AD 94 03  LDA ram_0394_link
    BEQ     bra_B194             ; BEQ  ; orig: C - - - - - 0x017193 05:B183: F0 0F     BEQ bra_B194
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x017195 05:B185: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x017197 05:B187: 8D F8 03  STA ram_03F8_link
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x01719A 05:B18A: 85 0F     STA ram_000F_t01_dir
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01719C 05:B18C: A2 00     LDX #$00
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x01719E 05:B18E: 20 8D F0  JSR sub_0x01F09D
    JMP     loc_0x01EDD5  ; orig: C - - - - - 0x0171A1 05:B191: 4C C5 ED  JMP loc_0x01EDD5
bra_B194:  ; orig: bra_B194:
    JMP     loc_0x01EAED  ; orig: C - - - - - 0x0171A4 05:B194: 4C DD EA  JMP loc_0x01EAED



tbl_B197:  ; orig: tbl_B197:
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x0171A7 05:B197: 30        .byte $30   ; 00
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - - - 0x0171A8 05:B198: C0        .byte $C0   ; 01



ofs_040_B199_08:  ; orig: ofs_040_B199_08:
    MOVE.B  ram_subscript,D0  ; orig: C - - J - - 0x0171A9 05:B199: A5 13     LDA ram_subscript
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0171AB 05:B19B: 48        PHA
    BSR     sub_87C6             ; JSR -> BSR  ; orig: C - - - - - 0x0171AC 05:B19C: 20 C6 87  JSR sub_87C6
    BSR     sub_B0B6             ; JSR -> BSR  ; orig: C - - - - - 0x0171AF 05:B19F: 20 B6 B0  JSR sub_B0B6
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0171B2 05:B1A2: 68        PLA
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0171B3 05:B1A3: 85 13     STA ram_subscript
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0171B5 05:B1A5: A4 EB     LDY ram_map_location
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0171B7 05:B1A7: A2 00     LDX #$00
    MOVE.B  ram_copy_map_location,D0  ; orig: C - - - - - 0x0171B9 05:B1A9: AD 27 05  LDA ram_copy_map_loc
    CMP.B   ram_687E_map_data(D2.L),D0  ; orig: C - - - - - 0x0171BC 05:B1AC: D9 7E 68  CMP ram_687E_map_dat
    BEQ     bra_B1B2             ; BEQ  ; orig: C - - - - - 0x0171BF 05:B1AF: F0 01     BEQ bra_B1B2
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0171C1 05:B1B1: E8        INX
bra_B1B2:  ; orig: bra_B1B2:
    MOVE.B  tbl_B197(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0171C2 05:B1B2: BD 97 B1  LDA tbl_B197,X
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x0171C5 05:B1B5: 85 70     STA ram_pos_X_link
    MOVE.B  #$41,D0  ; orig: C - - - - - 0x0171C7 05:B1B7: A9 41     LDA #$41
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x0171C9 05:B1B9: 85 84     STA ram_pos_Y_link
    MOVE.B  #con_dir_Down,D0  ; orig: C - - - - - 0x0171CB 05:B1BB: A9 04     LDA #con_dir_Down
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x0171CD 05:B1BD: 85 98     STA ram_dir_link
    MOVE.B  #$E4,D0  ; orig: C - - - - - 0x0171CF 05:B1BF: A9 E4     LDA #$E4
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x0171D1 05:B1C1: 8D 94 03  STA ram_0394_link
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0171D4 05:B1C4: A9 00     LDA #$00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0171D6 05:B1C6: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_0053  ; orig: C - - - - - 0x0171D8 05:B1C8: 85 53     STA ram_0053
    ADDQ.B  #1,ram_subscript  ; orig: C - - - - - 0x0171DA 05:B1CA: E6 13     INC ram_subscript
    RTS                     ; RTS  ; orig: C - - - - - 0x0171DC 05:B1CC: 60        RTS



ofs_040_B1CD_09:  ; orig: ofs_040_B1CD_09:
    MOVE.B  ram_dir_link,D0  ; orig: C - - J - - 0x0171DD 05:B1CD: A5 98     LDA ram_dir_link
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x0171DF 05:B1CF: 8D F8 03  STA ram_03F8_link
    BSR     sub_0x01EDB0             ; JSR -> BSR  ; orig: C - - - - - 0x0171E2 05:B1D2: 20 A0 ED  JSR sub_0x01EDB0
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x0171E5 05:B1D5: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$5D,D0  ; orig: C - - - - - 0x0171E7 05:B1D7: C9 5D     CMP #$5D
    BNE     bra_B1E5_RTS             ; BNE  ; orig: C - - - - - 0x0171E9 05:B1D9: D0 0A     BNE bra_B1E5_RTS
    MOVE.B  #con_obj_state_00,D0  ; orig: C - - - - - 0x0171EB 05:B1DB: A9 00     LDA #con_obj_state_0
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x0171ED 05:B1DD: 85 AC     STA ram_state_link
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0171EF 05:B1DF: A9 01     LDA #$01
    MOVE.B  D0,ram_005A  ; orig: C - - - - - 0x0171F1 05:B1E1: 85 5A     STA ram_005A
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0171F3 05:B1E3: 85 11     STA ram_0011_screen_
bra_B1E5_RTS:  ; orig: bra_B1E5_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0171F5 05:B1E5: 60        RTS



sub_0x0171F6:  ; orig: sub_0x0171F6:
    MOVE.B  ram_0063,D0  ; orig: C - - - - - 0x0171F6 05:B1E6: A5 63     LDA ram_0063
    BEQ     bra_B213_RTS             ; BEQ  ; orig: C - - - - - 0x0171F8 05:B1E8: F0 29     BEQ bra_B213_RTS
    MOVE.B  #con_sfx_4_rupee,D0  ; orig: C - - - - - 0x0171FA 05:B1EA: A9 10     LDA #con_sfx_4_rupee
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x0171FC 05:B1EC: 8D 04 06  STA ram_sfx_4
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0171FF 05:B1EF: AD 70 06  LDA ram_item_hearts 
    CMPI.B  #$F8,D0  ; orig: C - - - - - 0x017202 05:B1F2: C9 F8     CMP #$F8
    BCS     bra_B1FD             ; BCS  ; orig: C - - - - - 0x017204 05:B1F4: B0 07     BCS bra_B1FD
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x017206 05:B1F6: 18        CLC
    ADDX.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x017207 05:B1F7: 69 06     ADC #$06
    ; (empty translation for STA)  ; orig: C - - - - - 0x017209 05:B1F9: 8D 70 06  STA ram_item_hearts 
    RTS                     ; RTS  ; orig: C - - - - - 0x01720C 05:B1FC: 60        RTS
bra_B1FD:  ; orig: bra_B1FD:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01720D 05:B1FD: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: C - - - - - 0x01720F 05:B1FF: 8D 70 06  STA ram_item_hearts 
    BSR     sub_bat_746C             ; JSR -> BSR  ; orig: C - - - - - 0x017212 05:B202: 20 6C 74  JSR sub_bat_746C
    BNE     bra_B214             ; BNE  ; orig: C - - - - - 0x017215 05:B205: D0 0D     BNE bra_B214
    ; (empty translation for DEC)  ; orig: C - - - - - 0x017217 05:B207: CE 70 06  DEC ram_item_hearts 
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01721A 05:B20A: A9 00     LDA #$00
    MOVE.B  D0,ram_052E  ; orig: C - - - - - 0x01721C 05:B20C: 8D 2E 05  STA ram_052E
    MOVE.B  D0,ram_0063  ; orig: C - - - - - 0x01721F 05:B20F: 85 63     STA ram_0063
    MOVE.B  D0,ram_pause_flag  ; orig: C - - - - - 0x017221 05:B211: 85 E0     STA ram_pause_flag
bra_B213_RTS:  ; orig: bra_B213_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017223 05:B213: 60        RTS
bra_B214:  ; orig: bra_B214:
    ADDQ.B  #1,ram_item_hearts  ; orig: C - - - - - 0x017224 05:B214: EE 6F 06  INC ram_item_hearts
    RTS                     ; RTS  ; orig: C - - - - - 0x017227 05:B217: 60        RTS



tbl_B218_ppu_load_index:  ; orig: tbl_B218_ppu_load_index:
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017228 05:B218: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017229 05:B219: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x01722A 05:B21A: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_30  -- needs manual handling  ; orig: - D 1 - - - 0x01722B 05:B21B: 30        .byte con_ppu_buf_30
    ; [DIRECTIVE] .BYTE con_ppu_buf_32  -- needs manual handling  ; orig: - D 1 - - - 0x01722C 05:B21C: 32        .byte con_ppu_buf_32
    ; [DIRECTIVE] .BYTE con_ppu_buf_34  -- needs manual handling  ; orig: - D 1 - - - 0x01722D 05:B21D: 34        .byte con_ppu_buf_34
    ; [DIRECTIVE] .BYTE con_ppu_buf_38  -- needs manual handling  ; orig: - D 1 - - - 0x01722E 05:B21E: 38        .byte con_ppu_buf_38
    ; [DIRECTIVE] .BYTE con_ppu_buf_3A  -- needs manual handling  ; orig: - D 1 - - - 0x01722F 05:B21F: 3A        .byte con_ppu_buf_3A
    ; [DIRECTIVE] .BYTE con_ppu_buf_3C  -- needs manual handling  ; orig: - D 1 - - - 0x017230 05:B220: 3C        .byte con_ppu_buf_3C
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017231 05:B221: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017232 05:B222: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017233 05:B223: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_40  -- needs manual handling  ; orig: - D 1 - - - 0x017234 05:B224: 40        .byte con_ppu_buf_40



tbl_B225_ppu_load_index:  ; orig: tbl_B225_ppu_load_index:
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017235 05:B225: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017236 05:B226: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017237 05:B227: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_30  -- needs manual handling  ; orig: - D 1 - - - 0x017238 05:B228: 30        .byte con_ppu_buf_30
    ; [DIRECTIVE] .BYTE con_ppu_buf_32  -- needs manual handling  ; orig: - D 1 - - - 0x017239 05:B229: 32        .byte con_ppu_buf_32
    ; [DIRECTIVE] .BYTE con_ppu_buf_34  -- needs manual handling  ; orig: - D 1 - - - 0x01723A 05:B22A: 34        .byte con_ppu_buf_34
    ; [DIRECTIVE] .BYTE con_ppu_buf_38  -- needs manual handling  ; orig: - D 1 - - - 0x01723B 05:B22B: 38        .byte con_ppu_buf_38
    ; [DIRECTIVE] .BYTE con_ppu_buf_3A  -- needs manual handling  ; orig: - D 1 - - - 0x01723C 05:B22C: 3A        .byte con_ppu_buf_3A
    ; [DIRECTIVE] .BYTE con_ppu_buf_3C  -- needs manual handling  ; orig: - D 1 - - - 0x01723D 05:B22D: 3C        .byte con_ppu_buf_3C
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x01723E 05:B22E: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x01723F 05:B22F: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017240 05:B230: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017241 05:B231: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017242 05:B232: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_00  -- needs manual handling  ; orig: - D 1 - - - 0x017243 05:B233: 00        .byte con_ppu_buf_00
    ; [DIRECTIVE] .BYTE con_ppu_buf_50  -- needs manual handling  ; orig: - D 1 - - - 0x017244 05:B234: 50        .byte con_ppu_buf_50
    ; [DIRECTIVE] .BYTE con_ppu_buf_52  -- needs manual handling  ; orig: - D 1 - - - 0x017245 05:B235: 52        .byte con_ppu_buf_52
    ; [DIRECTIVE] .BYTE con_ppu_buf_54  -- needs manual handling  ; orig: - D 1 - - - 0x017246 05:B236: 54        .byte con_ppu_buf_54
    ; [DIRECTIVE] .BYTE con_ppu_buf_56  -- needs manual handling  ; orig: - D 1 - - - 0x017247 05:B237: 56        .byte con_ppu_buf_56
    ; [DIRECTIVE] .BYTE con_ppu_buf_58  -- needs manual handling  ; orig: - D 1 - - - 0x017248 05:B238: 58        .byte con_ppu_buf_58
    ; [DIRECTIVE] .BYTE con_ppu_buf_5A  -- needs manual handling  ; orig: - D 1 - - - 0x017249 05:B239: 5A        .byte con_ppu_buf_5A



sub_B23A:  ; orig: sub_B23A:
    MOVE.B  ram_005E,D0  ; orig: C - - - - - 0x01724A 05:B23A: A5 5E     LDA ram_005E
    BMI     bra_B25A_RTS             ; BMI  ; orig: C - - - - - 0x01724C 05:B23C: 30 1C     BMI bra_B25A_RTS
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01724E 05:B23E: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01724F 05:B23F: A8        TAY
    BCS     bra_B25B             ; BCS  ; orig: C - - - - - 0x017250 05:B240: B0 19     BCS bra_B25B
    CMPI.B  #$0D,D0  ; orig: C - - - - - 0x017252 05:B242: C9 0D     CMP #$0D
    BCS     bra_B24C             ; BCS  ; orig: C - - - - - 0x017254 05:B244: B0 06     BCS bra_B24C
    MOVE.B  tbl_B218_ppu_load_index(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017256 05:B246: B9 18 B2  LDA tbl_B218_ppu_loa
loc_B249:  ; orig: loc_B249:
    JMP     loc_B291_set_ppu_load_index  ; orig: C D 1 - - - 0x017259 05:B249: 4C 91 B2  JMP loc_B291_set_ppu
bra_B24C:  ; orig: bra_B24C:
    CMPI.B  #$15,D0  ; orig: C - - - - - 0x01725C 05:B24C: C9 15     CMP #$15
    BNE     bra_B255             ; BNE  ; orig: C - - - - - 0x01725E 05:B24E: D0 05     BNE bra_B255
    MOVE.B  #con_ppu_buf_42,D0  ; orig: C - - - - - 0x017260 05:B250: A9 42     LDA #con_ppu_buf_42
    JMP     loc_B249  ; orig: C - - - - - 0x017262 05:B252: 4C 49 B2  JMP loc_B249   ; bzk
bra_B255:  ; orig: bra_B255:
    BSR     sub_B57F             ; JSR -> BSR  ; orig: C - - - - - 0x017265 05:B255: 20 7F B5  JSR sub_B57F
loc_B258:  ; orig: loc_B258:
    SUBQ.B  #1,ram_005E  ; orig: C D 1 - - - 0x017268 05:B258: C6 5E     DEC ram_005E
bra_B25A_RTS:  ; orig: bra_B25A_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01726A 05:B25A: 60        RTS
bra_B25B:  ; orig: bra_B25B:
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x01726B 05:B25B: A9 28     LDA #$28    ; ppu hi
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x01726D 05:B25D: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x017270 05:B260: A9 C0     LDA #$C0
bra_B262_loop:  ; orig: bra_B262_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x017272 05:B262: 18        CLC
    ADDX.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x017273 05:B263: 69 20     ADC #$20
    BCC     bra_B26A_not_overflow             ; BCC  ; orig: C - - - - - 0x017275 05:B265: 90 03     BCC bra_B26A_not_ove
    ADDQ.B  #1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x017277 05:B267: EE 02 03  INC ram_0302_ppu_buf
bra_B26A_not_overflow:  ; orig: bra_B26A_not_overflow:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01727A 05:B26A: 88        DEY
    BPL     bra_B262_loop             ; BPL  ; orig: C - - - - - 0x01727B 05:B26B: 10 F5     BPL bra_B262_loop
    ; (empty translation for STA)  ; orig: C - - - - - 0x01727D 05:B26D: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x017280 05:B270: A9 60     LDA #$60
    ; (empty translation for STA)  ; orig: C - - - - - 0x017282 05:B272: 8D 04 03  STA ram_0302_ppu_buf
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x017285 05:B275: A9 24     LDA #$24
    ; (empty translation for STA)  ; orig: C - - - - - 0x017287 05:B277: 8D 05 03  STA ram_0302_ppu_buf
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01728A 05:B27A: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x01728C 05:B27C: 8D 06 03  STA ram_0302_ppu_buf
    JMP     loc_B258  ; orig: C - - - - - 0x01728F 05:B27F: 4C 58 B2  JMP loc_B258



sub_B282:  ; orig: sub_B282:
    MOVE.B  ram_005E,D0  ; orig: C - - - - - 0x017292 05:B282: A5 5E     LDA ram_005E
    BMI     bra_B295_RTS             ; BMI  ; orig: C - - - - - 0x017294 05:B284: 30 0F     BMI bra_B295_RTS
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x017296 05:B286: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x017297 05:B287: A8        TAY
    BCS     bra_B25B             ; BCS  ; orig: C - - - - - 0x017298 05:B288: B0 D1     BCS bra_B25B    ; bz
    CMPI.B  #$15,D0  ; orig: C - - - - - 0x01729A 05:B28A: C9 15     CMP #$15
    BCS     bra_B293             ; BCS  ; orig: C - - - - - 0x01729C 05:B28C: B0 05     BCS bra_B293
    MOVE.B  tbl_B225_ppu_load_index(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01729E 05:B28E: B9 25 B2  LDA tbl_B225_ppu_loa
loc_B291_set_ppu_load_index:  ; orig: loc_B291_set_ppu_load_index:
    MOVE.B  D0,ram_ppu_load_index  ; orig: C D 1 - - - 0x0172A1 05:B291: 85 14     STA ram_ppu_load_ind
bra_B293:  ; orig: bra_B293:
    SUBQ.B  #1,ram_005E  ; orig: C - - - - - 0x0172A3 05:B293: C6 5E     DEC ram_005E
bra_B295_RTS:  ; orig: bra_B295_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0172A5 05:B295: 60        RTS



tbl_B296:  ; orig: tbl_B296:
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - - - 0x0172A6 05:B296: 0C        .byte $0C   ; 00
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - - - 0x0172A7 05:B297: 0C        .byte $0C   ; 01
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0172A8 05:B298: 03        .byte $03   ; 02
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x0172A9 05:B299: 03        .byte $03   ; 03



sub_0x0172AA:  ; orig: sub_0x0172AA:
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x0172AA 05:B29A: A5 AC     LDA ram_state_link
    BNE     bra_B2BA             ; BNE  ; orig: C - - - - - 0x0172AC 05:B29C: D0 1C     BNE bra_B2BA    ; if
    BSR     sub_8D8C             ; JSR -> BSR  ; orig: C - - - - - 0x0172AE 05:B29E: 20 8C 8D  JSR sub_8D8C
    MOVE.B  ram_sword_disable_timer,D0  ; orig: C - - - - - 0x0172B1 05:B2A1: A5 4C     LDA ram_sword_disabl
    OR.B    ram_052E,D0  ; orig: C - - - - - 0x0172B3 05:B2A3: 0D 2E 05  ORA ram_052E
    BNE     bra_B2B1             ; BNE  ; orig: C - - - - - 0x0172B6 05:B2A6: D0 09     BNE bra_B2B1
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x0172B8 05:B2A8: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_A,D0  ; orig: C - - - - - 0x0172BA 05:B2AA: 29 80     AND #con_btn_A
    BEQ     bra_B2B1             ; BEQ  ; orig: C - - - - - 0x0172BC 05:B2AC: F0 03     BEQ bra_B2B1
    BSR     sub_8E00_A_item_handler             ; JSR -> BSR  ; orig: C - - - - - 0x0172BE 05:B2AE: 20 00 8E  JSR sub_8E00_A_item_
bra_B2B1:  ; orig: bra_B2B1:
    MOVE.B  ram_btn_press,D0  ; orig: C - - - - - 0x0172C1 05:B2B1: A5 F8     LDA ram_btn_press
    ANDI.B  #con_btn_B,D0  ; orig: C - - - - - 0x0172C3 05:B2B3: 29 40     AND #con_btn_B
    BEQ     bra_B2BA             ; BEQ  ; orig: C - - - - - 0x0172C5 05:B2B5: F0 03     BEQ bra_B2BA
    BSR     sub_8E1C_B_item_handler             ; JSR -> BSR  ; orig: C - - - - - 0x0172C7 05:B2B7: 20 1C 8E  JSR sub_8E1C_B_item_
bra_B2BA:  ; orig: bra_B2BA:
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0172CA 05:B2BA: A2 00     LDX #$00
    MOVE.B  ram_00C0_link,D0  ; orig: C - - - - - 0x0172CC 05:B2BC: A5 C0     LDA ram_00C0_link
    BNE     bra_B2FC_RTS             ; BNE  ; orig: C - - - - - 0x0172CE 05:B2BE: D0 3C     BNE bra_B2FC_RTS
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x0172D0 05:B2C0: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B2C7             ; BEQ  ; orig: C - - - - - 0x0172D2 05:B2C2: F0 03     BEQ bra_B2C7    ; if

; if dungeon
    BSR     sub_913F             ; JSR -> BSR  ; orig: C - - - - - 0x0172D4 05:B2C4: 20 3F 91  JSR sub_913F
bra_B2C7:  ; orig: bra_B2C7:
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x0172D7 05:B2C7: AD 94 03  LDA ram_0394_link
    BEQ     bra_B2CF             ; BEQ  ; orig: C - - - - - 0x0172DA 05:B2CA: F0 03     BEQ bra_B2CF
    JMP     loc_B38D  ; orig: C - - - - - 0x0172DC 05:B2CC: 4C 8D B3  JMP loc_B38D
bra_B2CF:  ; orig: bra_B2CF:

; A = 00
    MOVE.B  D0,ram_000B_t09_counter_1  ; orig: C - - - - - 0x0172DF 05:B2CF: 85 0B     STA ram_000B_t09_cou
    MOVE.B  D0,ram_000C_t10_counter_2  ; orig: C - - - - - 0x0172E1 05:B2D1: 85 0C     STA ram_000C_t10_cou
    MOVE.B  D0,ram_0057  ; orig: C - - - - - 0x0172E3 05:B2D3: 85 57     STA ram_0057
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x0172E5 05:B2D5: A0 03     LDY #$03
bra_B2D7_loop:  ; orig: bra_B2D7_loop:
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x0172E7 05:B2D7: AD F8 03  LDA ram_03F8_link
    ; !! AND tbl_bat_6DC3_direction,Y - needs manual review  ; orig: C - - - - - 0x0172EA 05:B2DA: 39 C3 6D  AND tbl_bat_6DC3_dir
    BEQ     bra_B2F5             ; BEQ  ; orig: C - - - - - 0x0172ED 05:B2DD: F0 16     BEQ bra_B2F5
    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0172EF 05:B2DF: 85 0F     STA ram_000F_t01_dir
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0172F1 05:B2E1: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0172F2 05:B2E2: 48        PHA
    ADDQ.B  #1,ram_000B_t09_counter_1  ; orig: C - - - - - 0x0172F3 05:B2E3: E6 0B     INC ram_000B_t09_cou
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x0172F5 05:B2E5: 20 FA ED  JSR sub_0x01EE0A_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x0172F8 05:B2E8: CD 4A 03  CMP ram_min_collisio
    BCS     bra_B2F3             ; BCS  ; orig: C - - - - - 0x0172FB 05:B2EB: B0 06     BCS bra_B2F3
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x0172FD 05:B2ED: A5 0F     LDA ram_000F_t01_dir
    MOVE.B  D0,ram_000D_t10_link_direction  ; orig: C - - - - - 0x0172FF 05:B2EF: 85 0D     STA ram_000D_t10_lin
    ADDQ.B  #1,ram_000C_t10_counter_2  ; orig: C - - - - - 0x017301 05:B2F1: E6 0C     INC ram_000C_t10_cou
bra_B2F3:  ; orig: bra_B2F3:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017303 05:B2F3: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x017304 05:B2F4: A8        TAY
bra_B2F5:  ; orig: bra_B2F5:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x017305 05:B2F5: 88        DEY
    BPL     bra_B2D7_loop             ; BPL  ; orig: C - - - - - 0x017306 05:B2F6: 10 DF     BPL bra_B2D7_loop
    MOVE.B  ram_000B_t09_counter_1,D2  ; orig: C - - - - - 0x017308 05:B2F8: A4 0B     LDY ram_000B_t09_cou
    BNE     bra_B2FD             ; BNE  ; orig: C - - - - - 0x01730A 05:B2FA: D0 01     BNE bra_B2FD
bra_B2FC_RTS:  ; orig: bra_B2FC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01730C 05:B2FC: 60        RTS
bra_B2FD:  ; orig: bra_B2FD:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01730D 05:B2FD: A5 0F     LDA ram_000F_t01_dir
    CMPI.B  #$01,D2  ; orig: C - - - - - 0x01730F 05:B2FF: C0 01     CPY #$01
    BEQ     bra_B35F             ; BEQ  ; orig: C - - - - - 0x017311 05:B301: F0 5C     BEQ bra_B35F
    MOVE.B  ram_000C_t10_counter_2,D0  ; orig: C - - - - - 0x017313 05:B303: A5 0C     LDA ram_000C_t10_cou
    BNE     bra_B30A             ; BNE  ; orig: C - - - - - 0x017315 05:B305: D0 03     BNE bra_B30A
    JMP     loc_B3AB  ; orig: - - - - - - 0x017317 05:B307: 4C AB B3  JMP loc_B3AB
bra_B30A:  ; orig: bra_B30A:
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01731A 05:B30A: A8        TAY
    ADDQ.B  #1,ram_0057  ; orig: C - - - - - 0x01731B 05:B30B: E6 57     INC ram_0057
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01731D 05:B30D: A2 00     LDX #$00
    MOVE.B  ram_000D_t10_link_direction,D0  ; orig: C - - - - - 0x01731F 05:B30F: A5 0D     LDA ram_000D_t10_lin
    CMPI.B  #$01,D2  ; orig: C - - - - - 0x017321 05:B311: C0 01     CPY #$01
    BEQ     bra_B35F             ; BEQ  ; orig: C - - - - - 0x017323 05:B313: F0 4A     BEQ bra_B35F
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x017325 05:B315: A4 10     LDY ram_dungeon_leve
    BEQ     bra_B35F             ; BEQ  ; orig: C - - - - - 0x017327 05:B317: F0 46     BEQ bra_B35F    ; if

; if dungeon
    MOVE.B  ram_pos_X_link,D2  ; orig: C - - - - - 0x017329 05:B319: A4 70     LDY ram_pos_X_link
    CMPI.B  #$20,D2  ; orig: C - - - - - 0x01732B 05:B31B: C0 20     CPY #$20
    BEQ     bra_B323             ; BEQ  ; orig: C - - - - - 0x01732D 05:B31D: F0 04     BEQ bra_B323
    CMPI.B  #$D0,D2  ; orig: C - - - - - 0x01732F 05:B31F: C0 D0     CPY #$D0
    BNE     bra_B333             ; BNE  ; orig: C - - - - - 0x017331 05:B321: D0 10     BNE bra_B333
bra_B323:  ; orig: bra_B323:
    MOVE.B  ram_pos_Y_link,D2  ; orig: C - - - - - 0x017333 05:B323: A4 84     LDY ram_pos_Y_link
    CMPI.B  #$85,D2  ; orig: C - - - - - 0x017335 05:B325: C0 85     CPY #$85
    BNE     bra_B34D             ; BNE  ; orig: C - - - - - 0x017337 05:B327: D0 24     BNE bra_B34D
    MOVE.B  ram_dir_link,D0  ; orig: - - - - - - 0x017339 05:B329: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir_Down,D0  ; orig: - - - - - - 0x01733B 05:B32B: 29 04     AND #con_dir_Down
    BEQ     bra_B34D             ; BEQ  ; orig: - - - - - - 0x01733D 05:B32D: F0 1E     BEQ bra_B34D
bra_B32F:  ; orig: bra_B32F:
    MOVE.B  ram_dir_link,D0  ; orig: - - - - - - 0x01733F 05:B32F: A5 98     LDA ram_dir_link
    BNE     bra_B35F             ; BNE  ; orig: - - - - - - 0x017341 05:B331: D0 2C     BNE bra_B35F
bra_B333:  ; orig: bra_B333:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x017343 05:B333: A5 98     LDA ram_dir_link
    MOVE.B  ram_0056,D1  ; orig: C - - - - - 0x017345 05:B335: A6 56     LDX ram_0056
    BEQ     bra_B34D             ; BEQ  ; orig: C - - - - - 0x017347 05:B337: F0 14     BEQ bra_B34D
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x017349 05:B339: A4 10     LDY ram_dungeon_leve
    BEQ     bra_B35F             ; BEQ  ; orig: C - - - - - 0x01734B 05:B33B: F0 22     BEQ bra_B35F    ; if

; if dungeon
    MOVE.B  ram_pos_X_link,D2  ; orig: C - - - - - 0x01734D 05:B33D: A4 70     LDY ram_pos_X_link
    CMPI.B  #$78,D2  ; orig: C - - - - - 0x01734F 05:B33F: C0 78     CPY #$78
    BNE     bra_B35F             ; BNE  ; orig: C - - - - - 0x017351 05:B341: D0 1C     BNE bra_B35F
    MOVE.B  ram_pos_Y_link,D2  ; orig: - - - - - - 0x017353 05:B343: A4 84     LDY ram_pos_Y_link
    CMPI.B  #$5D,D2  ; orig: - - - - - - 0x017355 05:B345: C0 5D     CPY #$5D
    BNE     bra_B35F             ; BNE  ; orig: - - - - - - 0x017357 05:B347: D0 16     BNE bra_B35F
    ANDI.B  #con_dir__LR,D0  ; orig: - - - - - - 0x017359 05:B349: 29 03     AND #con_dir__LR
    BEQ     bra_B32F             ; BEQ  ; orig: - - - - - - 0x01735B 05:B34B: F0 E2     BEQ bra_B32F
bra_B34D:  ; orig: bra_B34D:
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01735D 05:B34D: A5 98     LDA ram_dir_link
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01735F 05:B34F: E8        INX
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x017360 05:B350: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x017363 05:B353: AD F8 03  LDA ram_03F8_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x017366 05:B356: 48        PHA
    ; !! AND tbl_B296,Y - needs manual review  ; orig: C - - - - - 0x017367 05:B357: 39 96 B2  AND tbl_B296,Y
    MOVE.B  D0,ram_000C_t11  ; orig: C - - - - - 0x01736A 05:B35A: 85 0C     STA ram_000C_t11
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01736C 05:B35C: 68        PLA
    EOR.B   ram_000C_t11,D0  ; orig: C - - - - - 0x01736D 05:B35D: 45 0C     EOR ram_000C_t11
bra_B35F:  ; orig: bra_B35F:
    MOVE.B  D1,ram_0056  ; orig: C - - - - - 0x01736F 05:B35F: 86 56     STX ram_0056
    BSR     sub_B3A9             ; JSR -> BSR  ; orig: C - - - - - 0x017371 05:B361: 20 A9 B3  JSR sub_B3A9
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x017374 05:B364: A2 00     LDX #$00
sub_B366:  ; orig: sub_B366:
bra_B366:  ; orig: bra_B366:
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x017376 05:B366: A9 60     LDA #$60
    MOVE.B  D0,ram_0000_t40  ; orig: C - - - - - 0x017378 05:B368: 85 00     STA ram_0000_t40
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01737A 05:B36A: A5 10     LDA ram_dungeon_leve
    BNE     bra_B387             ; BNE  ; orig: C - - - - - 0x01737C 05:B36C: D0 19     BNE bra_B387    ; if

; if overworld
    MOVE.B  ram_collision_tile_link,D0  ; orig: C - - - - - 0x01737E 05:B36E: AD 9E 04  LDA ram_collision_ti
    CMPI.B  #con_collision_tile + $74,D0  ; orig: C - - - - - 0x017381 05:B371: C9 74     CMP #con_collision_t
    BEQ     bra_B379             ; BEQ  ; orig: C - - - - - 0x017383 05:B373: F0 04     BEQ bra_B379
    CMPI.B  #con_collision_tile + $75,D0  ; orig: C - - - - - 0x017385 05:B375: C9 75     CMP #con_collision_t
    BNE     bra_B387             ; BNE  ; orig: C - - - - - 0x017387 05:B377: D0 0E     BNE bra_B387
bra_B379:  ; orig: bra_B379:
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x017389 05:B379: A9 30     LDA #$30    ; stairs
    MOVE.B  D0,ram_0000_t40  ; orig: C - - - - - 0x01738B 05:B37B: 85 00     STA ram_0000_t40
    CMP.B   ram_03BC_link,D0  ; orig: C - - - - - 0x01738D 05:B37D: CD BC 03  CMP ram_03BC_link
    BEQ     bra_B387             ; BEQ  ; orig: C - - - - - 0x017390 05:B380: F0 05     BEQ bra_B387
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x017392 05:B382: A9 00     LDA #$00
    MOVE.B  D0,ram_03A8_link  ; orig: C - - - - - 0x017394 05:B384: 8D A8 03  STA ram_03A8_link
bra_B387:  ; orig: bra_B387:
    MOVE.B  ram_0000_t40,D0  ; orig: C - - - - - 0x017397 05:B387: A5 00     LDA ram_0000_t40
    MOVE.B  D0,ram_03BC_link  ; orig: C - - - - - 0x017399 05:B389: 8D BC 03  STA ram_03BC_link
bra_B38C_RTS:  ; orig: bra_B38C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01739C 05:B38C: 60        RTS



loc_B38D:  ; orig: loc_B38D:
    MOVE.B  ram_03F8_link,D0  ; orig: C D 1 - - - 0x01739D 05:B38D: AD F8 03  LDA ram_03F8_link
    BEQ     bra_B38C_RTS             ; BEQ  ; orig: C - - - - - 0x0173A0 05:B390: F0 FA     BEQ bra_B38C_RTS
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x0173A2 05:B392: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0173A5 05:B395: B9 C3 6D  LDA tbl_bat_6DC3_dir
    CMP.B   ram_dir_link,D0  ; orig: C - - - - - 0x0173A8 05:B398: C5 98     CMP ram_dir_link
    BEQ     bra_B366             ; BEQ  ; orig: C - - - - - 0x0173AA 05:B39A: F0 CA     BEQ bra_B366
    OR.B    ram_dir_link,D0  ; orig: C - - - - - 0x0173AC 05:B39C: 05 98     ORA ram_dir_link
    CMPI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x0173AE 05:B39E: C9 03     CMP #con_dir__LR
    BEQ     bra_B3A6             ; BEQ  ; orig: C - - - - - 0x0173B0 05:B3A0: F0 04     BEQ bra_B3A6
    CMPI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x0173B2 05:B3A2: C9 0C     CMP #con_dir__UD
    BNE     bra_B3AF             ; BNE  ; orig: C - - - - - 0x0173B4 05:B3A4: D0 09     BNE bra_B3AF
bra_B3A6:  ; orig: bra_B3A6:
    MOVE.B  tbl_bat_6DC3_direction(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0173B6 05:B3A6: B9 C3 6D  LDA tbl_bat_6DC3_dir
sub_B3A9:  ; orig: sub_B3A9:
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x0173B9 05:B3A9: 85 98     STA ram_dir_link
loc_B3AB:  ; orig: loc_B3AB:
    MOVE.B  D0,ram_03F8_link  ; orig: C - - - - - 0x0173BB 05:B3AB: 8D F8 03  STA ram_03F8_link
    RTS                     ; RTS  ; orig: C - - - - - 0x0173BE 05:B3AE: 60        RTS
bra_B3AF:  ; orig: bra_B3AF:
    MOVE.B  ram_0057,D0  ; orig: C - - - - - 0x0173BF 05:B3AF: A5 57     LDA ram_0057
    BNE     bra_B366             ; BNE  ; orig: C - - - - - 0x0173C1 05:B3B1: D0 B3     BNE bra_B366
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x0173C3 05:B3B3: AD 94 03  LDA ram_0394_link
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x0173C6 05:B3B6: 20 1F 70  JSR sub_bat_701F_EOR
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0173C9 05:B3B9: 48        PHA
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0173CA 05:B3BA: A5 98     LDA ram_dir_link
    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x0173CC 05:B3BC: 20 13 70  JSR sub_bat_7013_get
    MOVE.B  D0,ram_0001_t29_direction  ; orig: C - - - - - 0x0173CF 05:B3BF: 85 01     STA ram_0001_t29_dir
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0173D1 05:B3C1: 68        PLA
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x0173D2 05:B3C2: C9 04     CMP #$04
    BCS     bra_B3F3_RTS             ; BCS  ; orig: C - - - - - 0x0173D4 05:B3C4: B0 2D     BCS bra_B3F3_RTS
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x0173D6 05:B3C6: A5 98     LDA ram_dir_link
    ANDI.B  #con_dir__UL,D0  ; orig: C - - - - - 0x0173D8 05:B3C8: 29 0A     AND #con_dir__UL
    BEQ     bra_B3D3             ; BEQ  ; orig: C - - - - - 0x0173DA 05:B3CA: F0 07     BEQ bra_B3D3
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x0173DC 05:B3CC: AD 94 03  LDA ram_0394_link
    BPL     bra_B3F3_RTS             ; BPL  ; orig: C - - - - - 0x0173DF 05:B3CF: 10 22     BPL bra_B3F3_RTS
    BMI     bra_B3D8             ; BMI  ; orig: C - - - - - 0x0173E1 05:B3D1: 30 05     BMI bra_B3D8    ; jm
bra_B3D3:  ; orig: bra_B3D3:
    MOVE.B  ram_0394_link,D0  ; orig: C - - - - - 0x0173E3 05:B3D3: AD 94 03  LDA ram_0394_link
    BMI     bra_B3F3_RTS             ; BMI  ; orig: C - - - - - 0x0173E6 05:B3D6: 30 1B     BMI bra_B3F3_RTS
bra_B3D8:  ; orig: bra_B3D8:
    MOVE.B  ram_0001_t29_direction,D0  ; orig: C - - - - - 0x0173E8 05:B3D8: A5 01     LDA ram_0001_t29_dir
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x0173EA 05:B3DA: 85 98     STA ram_dir_link
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x0173EC 05:B3DC: A9 08     LDA #$08
    MOVE.B  ram_0394_link,D2  ; orig: C - - - - - 0x0173EE 05:B3DE: AC 94 03  LDY ram_0394_link
    BMI     bra_B3E5             ; BMI  ; orig: C - - - - - 0x0173F1 05:B3E1: 30 02     BMI bra_B3E5
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x0173F3 05:B3E3: A9 F8     LDA #$F8
bra_B3E5:  ; orig: bra_B3E5:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0173F5 05:B3E5: 48        PHA
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0173F6 05:B3E6: 98        TYA
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x0173F7 05:B3E7: 20 21 70  JSR sub_bat_7021_EOR
    MOVE.B  D0,ram_0001_t30  ; orig: C - - - - - 0x0173FA 05:B3EA: 85 01     STA ram_0001_t30
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0173FC 05:B3EC: 68        PLA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0173FD 05:B3ED: 38        SEC
    SUBX.B  ram_0001_t30,D0  ; orig: C - - - - - 0x0173FE 05:B3EE: E5 01     SBC ram_0001_t30
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x017400 05:B3F0: 8D 94 03  STA ram_0394_link
bra_B3F3_RTS:  ; orig: bra_B3F3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017403 05:B3F3: 60        RTS



sub_0x017404:  ; orig: sub_0x017404:
    MOVE.B  ram_005A,D0  ; orig: C - - - - - 0x017404 05:B3F4: A5 5A     LDA ram_005A
    OR.B    ram_0394_link,D0  ; orig: C - - - - - 0x017406 05:B3F6: 0D 94 03  ORA ram_0394_link
    BNE     bra_B46E_RTS             ; BNE  ; orig: C - - - - - 0x017409 05:B3F9: D0 73     BNE bra_B46E_RTS
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01740B 05:B3FB: A5 10     LDA ram_dungeon_leve
    BNE     bra_B40D             ; BNE  ; orig: C - - - - - 0x01740D 05:B3FD: D0 0E     BNE bra_B40D    ; if

; if overworld
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01740F 05:B3FF: A5 EB     LDA ram_map_location
    CMPI.B  #con_map_location + $22,D0  ; orig: C - - - - - 0x017411 05:B401: C9 22     CMP #con_map_locatio
    BNE     bra_B40D             ; BNE  ; orig: C - - - - - 0x017413 05:B403: D0 08     BNE bra_B40D
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x017415 05:B405: A5 70     LDA ram_pos_X_link
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x017417 05:B407: 29 07     AND #$07
    BNE     bra_B46E_RTS             ; BNE  ; orig: C - - - - - 0x017419 05:B409: D0 63     BNE bra_B46E_RTS
    BEQ     bra_B413             ; BEQ  ; orig: C - - - - - 0x01741B 05:B40B: F0 06     BEQ bra_B413    ; jm
bra_B40D:  ; orig: bra_B40D:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01741D 05:B40D: A5 70     LDA ram_pos_X_link
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01741F 05:B40F: 29 0F     AND #$0F
    BNE     bra_B46E_RTS             ; BNE  ; orig: C - - - - - 0x017421 05:B411: D0 5B     BNE bra_B46E_RTS
bra_B413:  ; orig: bra_B413:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x017423 05:B413: A5 84     LDA ram_pos_Y_link
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x017425 05:B415: 29 0F     AND #$0F
    CMPI.B  #$0D,D0  ; orig: C - - - - - 0x017427 05:B417: C9 0D     CMP #$0D
    BNE     bra_B46E_RTS             ; BNE  ; orig: C - - - - - 0x017429 05:B419: D0 53     BNE bra_B46E_RTS
    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x01742B 05:B41B: 20 F4 ED  JSR sub_0x01EE04_fin
    MOVE.B  ram_collision_tile_link,D0  ; orig: C - - - - - 0x01742E 05:B41E: AD 9E 04  LDA ram_collision_ti
    MOVE.B  ram_dungeon_level,D2  ; orig: C - - - - - 0x017431 05:B421: A4 10     LDY ram_dungeon_leve
    BEQ     bra_B46F             ; BEQ  ; orig: C - - - - - 0x017433 05:B423: F0 4A     BEQ bra_B46F    ; if

; if dungeon
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x017435 05:B425: C9 70     CMP #$70
    BCC     bra_B46E_RTS             ; BCC  ; orig: C - - - - - 0x017437 05:B427: 90 45     BCC bra_B46E_RTS
    CMPI.B  #$74,D0  ; orig: C - - - - - 0x017439 05:B429: C9 74     CMP #$74
    BCS     bra_B46E_RTS             ; BCS  ; orig: C - - - - - 0x01743B 05:B42B: B0 41     BCS bra_B46E_RTS
    BSR     sub_B464             ; JSR -> BSR  ; orig: C - - - - - 0x01743D 05:B42D: 20 64 B4  JSR sub_B464
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x017440 05:B430: A5 EB     LDA ram_map_location
    MOVE.B  D0,ram_copy_map_location  ; orig: C - - - - - 0x017442 05:B432: 8D 27 05  STA ram_copy_map_loc
    MOVE.B  #$FF,D1  ; orig: C - - - - - 0x017445 05:B435: A2 FF     LDX #$FF
bra_B437_loop:  ; orig: bra_B437_loop:
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x017447 05:B437: E8        INX
    MOVE.B  ram_6BB2(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x017448 05:B438: BD B2 6B  LDA ram_6BB2,X
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01744B 05:B43B: A8        TAY
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01744C 05:B43C: A5 EB     LDA ram_map_location
    CMP.B   ram_687E_map_data(D2.L),D0  ; orig: C - - - - - 0x01744E 05:B43E: D9 7E 68  CMP ram_687E_map_dat
    BEQ     bra_B448             ; BEQ  ; orig: C - - - - - 0x017451 05:B441: F0 05     BEQ bra_B448
    CMP.B   ram_68FE_map_data(D2.L),D0  ; orig: C - - - - - 0x017453 05:B443: D9 FE 68  CMP ram_68FE_map_dat
    BNE     bra_B437_loop             ; BNE  ; orig: C - - - - - 0x017456 05:B446: D0 EF     BNE bra_B437_loop
bra_B448:  ; orig: bra_B448:
    MOVE.B  D2,ram_map_location  ; orig: C - - - - - 0x017458 05:B448: 84 EB     STY ram_map_location
    MOVE.B  #con_script_09,D0  ; orig: C - - - - - 0x01745A 05:B44A: A9 09     LDA #con_script_09
loc_B44C:  ; orig: loc_B44C:
bra_B44C:
; A = 02 bzk
    MOVE.B  D0,ram_next_script  ; orig: C D 1 - - - 0x01745C 05:B44C: 85 5B     STA ram_next_script
    CMPI.B  #con_script_09,D0  ; orig: C - - - - - 0x01745E 05:B44E: C9 09     CMP #con_script_09
    BEQ     bra_B45A             ; BEQ  ; orig: C - - - - - 0x017460 05:B450: F0 08     BEQ bra_B45A
    BSR     sub_bat_6EE9             ; JSR -> BSR  ; orig: C - - - - - 0x017462 05:B452: 20 E9 6E  JSR sub_bat_6EE9
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x017465 05:B455: 8D 02 06  STA ram_sfx_2   ; co
    ; (empty translation for STA)  ; orig: C - - - - - 0x017468 05:B458: 85 3C     STA ram_timer_obj + 
bra_B45A:  ; orig: bra_B45A:
    MOVE.B  #con_script_10,D0  ; orig: C - - - - - 0x01746A 05:B45A: A9 10     LDA #con_script_10
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x01746C 05:B45C: 85 12     STA ram_script
    BSR     sub_B559_disable_greyscale             ; JSR -> BSR  ; orig: C - - - - - 0x01746E 05:B45E: 20 59 B5  JSR sub_B559_disable
    JMP     loc_8F61  ; orig: C - - - - - 0x017471 05:B461: 4C 61 8F  JMP loc_8F61



sub_B464:  ; orig: sub_B464:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x017474 05:B464: A5 10     LDA ram_dungeon_leve
    BNE     bra_B46B             ; BNE  ; orig: C - - - - - 0x017476 05:B466: D0 03     BNE bra_B46B    ; if

; if overworld
    JMP     loc_90E5  ; orig: C - - - - - 0x017478 05:B468: 4C E5 90  JMP loc_90E5
bra_B46B:  ; orig: bra_B46B:

; bzk optimize, JMP
    BSR     sub_92D7             ; JSR -> BSR  ; orig: C - - - - - 0x01747B 05:B46B: 20 D7 92  JSR sub_92D7
bra_B46E_RTS:  ; orig: bra_B46E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01747E 05:B46E: 60        RTS
bra_B46F:  ; orig: bra_B46F:
    MOVE.B  D0,ram_0065  ; orig: C - - - - - 0x01747F 05:B46F: 85 65     STA ram_0065
    CMPI.B  #con_collision_tile + $24,D0  ; orig: C - - - - - 0x017481 05:B471: C9 24     CMP #con_collision_t
    BEQ     bra_B486             ; BEQ  ; orig: C - - - - - 0x017483 05:B473: F0 11     BEQ bra_B486
    CMPI.B  #con_collision_tile + $88,D0  ; orig: C - - - - - 0x017485 05:B475: C9 88     CMP #con_collision_t
    BEQ     bra_B486             ; BEQ  ; orig: C - - - - - 0x017487 05:B477: F0 0D     BEQ bra_B486
    CMPI.B  #con_collision_tile + $70,D0  ; orig: C - - - - - 0x017489 05:B479: C9 70     CMP #con_collision_t
    BCC     bra_B46E_RTS             ; BCC  ; orig: C - - - - - 0x01748B 05:B47B: 90 F1     BCC bra_B46E_RTS
    CMPI.B  #con_collision_tile + $74,D0  ; orig: C - - - - - 0x01748D 05:B47D: C9 74     CMP #con_collision_t
    BCS     bra_B46E_RTS             ; BCS  ; orig: C - - - - - 0x01748F 05:B47F: B0 ED     BCS bra_B46E_RTS
    MOVE.B  #con_collision_tile + $70,D0  ; orig: C - - - - - 0x017491 05:B481: A9 70     LDA #con_collision_t
    MOVE.B  D0,ram_collision_tile_link  ; orig: C - - - - - 0x017493 05:B483: 8D 9E 04  STA ram_collision_ti
bra_B486:  ; orig: bra_B486:
    BSR     sub_B464             ; JSR -> BSR  ; orig: C - - - - - 0x017496 05:B486: 20 64 B4  JSR sub_B464
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x017499 05:B489: A4 EB     LDY ram_map_location
    MOVE.B  ram_68FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01749B 05:B48B: B9 FE 68  LDA ram_68FE_map_dat
    ANDI.B  #$FC,D0  ; orig: C - - - - - 0x01749E 05:B48E: 29 FC     AND #$FC
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x0174A0 05:B490: C9 40     CMP #$40
    BCC     bra_B49F             ; BCC  ; orig: C - - - - - 0x0174A2 05:B492: 90 0B     BCC bra_B49F
    MOVE.B  #con_script_0B,D2  ; orig: C - - - - - 0x0174A4 05:B494: A0 0B     LDY #con_script_0B
    CMPI.B  #$50,D0  ; orig: C - - - - - 0x0174A6 05:B496: C9 50     CMP #$50
    BNE     bra_B49B             ; BNE  ; orig: C - - - - - 0x0174A8 05:B498: D0 01     BNE bra_B49B
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0174AA 05:B49A: C8        INY ; con_script_0C
bra_B49B:  ; orig: bra_B49B:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0174AB 05:B49B: 98        TYA
    JMP     loc_B44C  ; orig: C - - - - - 0x0174AC 05:B49C: 4C 4C B4  JMP loc_B44C
bra_B49F:  ; orig: bra_B49F:

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0174AF 05:B49F: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0174B0 05:B4A0: 4A        LSR
    MOVE.B  D0,ram_dungeon_level  ; orig: C - - - - - 0x0174B1 05:B4A1: 85 10     STA ram_dungeon_leve
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x0174B3 05:B4A3: A5 EB     LDA ram_map_location
    MOVE.B  D0,ram_0526  ; orig: C - - - - - 0x0174B5 05:B4A5: 8D 26 05  STA ram_0526
    MOVE.B  #con_script_02,D0  ; orig: C - - - - - 0x0174B8 05:B4A8: A9 02     LDA #con_script_02
    BNE     bra_B44C             ; BNE  ; orig: C - - - - - 0x0174BA 05:B4AA: D0 A0     BNE bra_B44C    ; jm



sub_B4AC_check_battery_integrity:  ; orig: sub_B4AC_check_battery_integrity:
sub_0x0174BC_check_battery_integrity:  ; orig: sub_0x0174BC_check_battery_integrity:

; and initialize it if necessary

; out

; C

; 0 = battery is OK

; 1 = battery was not initialized yet
    MOVE.B  ram_battery_check_1,D0  ; orig: C - - - - - 0x0174BC 05:B4AC: AD 01 60  LDA ram_battery_chec
    CMPI.B  #$5A,D0  ; orig: C - - - - - 0x0174BF 05:B4AF: C9 5A     CMP #$5A
    BNE     bra_B4BA_check_failed             ; BNE  ; orig: C - - - - - 0x0174C1 05:B4B1: D0 07     BNE bra_B4BA_check_f
    MOVE.B  ram_battery_check_2,D0  ; orig: C - - - - - 0x0174C3 05:B4B3: AD FF 7F  LDA ram_battery_chec
    CMPI.B  #$A5,D0  ; orig: C - - - - - 0x0174C6 05:B4B6: C9 A5     CMP #$A5
    BEQ     bra_B4E6_check_passed             ; BEQ  ; orig: C - - - - - 0x0174C8 05:B4B8: F0 2C     BEQ bra_B4E6_check_p
bra_B4BA_check_failed:  ; orig: bra_B4BA_check_failed:

; initialization
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x0174CA 05:B4BA: A9 FF     LDA #$FF
    MOVE.B  D0,ram_652A_slot  ; orig: C - - - - - 0x0174CC 05:B4BC: 8D 2A 65  STA ram_652A_slot
    ; (empty translation for STA)  ; orig: C - - - - - 0x0174CF 05:B4BF: 8D 2B 65  STA ram_652A_slot + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x0174D2 05:B4C2: 8D 2C 65  STA ram_652A_slot + 

; clear 6530-7FFF
    MOVE.B  #> ram_6530,D0  ; orig: C - - - - - 0x0174D5 05:B4C5: A9 65     LDA #> ram_6530
    ; (empty translation for STA)  ; orig: C - - - - - 0x0174D7 05:B4C7: 85 01     STA ram_0000_t0A_dat
    MOVE.B  #< ram_6530,D0  ; orig: C - - - - - 0x0174D9 05:B4C9: A9 30     LDA #< ram_6530
    MOVE.B  D0,ram_0000_t0A_data  ; orig: C - - - - - 0x0174DB 05:B4CB: 85 00     STA ram_0000_t0A_dat
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0174DD 05:B4CD: A0 00     LDY #$00
bra_B4CF_loop:  ; orig: bra_B4CF_loop:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0174DF 05:B4CF: A9 00     LDA #$00
    MOVEA.W ($FF0000+ram_0000_t0A_data).l,A1  ; STA (zp),Y
    MOVE.B  D0,($FF0000,A1,D2.W)  ; orig: C - - - - - 0x0174E1 05:B4D1: 91 00     STA (ram_0000_t0A_da

; bzk optimize, INC lo + BNE + INC hi
    MOVE.B  ram_0000_t0A_data,D0  ; orig: C - - - - - 0x0174E3 05:B4D3: A5 00     LDA ram_0000_t0A_dat
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0174E5 05:B4D5: 18        CLC
    ADDX.B  #< $0001,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0174E6 05:B4D6: 69 01     ADC #< $0001
    MOVE.B  D0,ram_0000_t0A_data  ; orig: C - - - - - 0x0174E8 05:B4D8: 85 00     STA ram_0000_t0A_dat
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0174EA 05:B4DA: A5 01     LDA ram_0000_t0A_dat
    ADDX.B  #> $0001,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0174EC 05:B4DC: 69 00     ADC #> $0001
    ; (empty translation for STA)  ; orig: C - - - - - 0x0174EE 05:B4DE: 85 01     STA ram_0000_t0A_dat
    CMPI.B  #> $8000,D0  ; orig: C - - - - - 0x0174F0 05:B4E0: C9 80     CMP #> $8000
    BNE     bra_B4CF_loop             ; BNE  ; orig: C - - - - - 0x0174F2 05:B4E2: D0 EB     BNE bra_B4CF_loop
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0174F4 05:B4E4: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x0174F5 05:B4E5: 60        RTS
bra_B4E6_check_passed:  ; orig: bra_B4E6_check_passed:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0174F6 05:B4E6: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x0174F7 05:B4E7: 60        RTS



sub_0x0174F8_clear_memory:  ; orig: sub_0x0174F8_clear_memory:
    MOVE.B  #$07,D0  ; orig: C - - - - - 0x0174F8 05:B4E8: A9 07     LDA #$07
    MOVE.B  #$FE,D2  ; orig: C - - - - - 0x0174FA 05:B4EA: A0 FE     LDY #$FE
    BSR     sub_0x01E618_clear_memory             ; JSR -> BSR  ; orig: C - - - - - 0x0174FC 05:B4EC: 20 08 E6  JSR sub_0x01E618_cle

; Y = FF
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0174FF 05:B4EF: A9 00     LDA #$00
    MOVE.B  D0,ram_00F7_flag  ; orig: C - - - - - 0x017501 05:B4F1: 85 F7     STA ram_00F7_flag
    MOVE.B  D0,ram_00F5_reset_check_5A  ; orig: C - - - - - 0x017503 05:B4F3: 85 F5     STA ram_00F5_reset_c
    MOVE.B  D0,ram_00F6_reset_check_A5  ; orig: C - - - - - 0x017505 05:B4F5: 85 F6     STA ram_00F6_reset_c
    MOVE.B  D0,ram_prev_screen_transition_flag  ; orig: C - - - - - 0x017507 05:B4F7: 85 F3     STA ram_prev_screen_

; clear 0000-00EF

; bzk optimize
    MOVE.B  #$EF,D2  ; orig: C - - - - - 0x017509 05:B4F9: A0 EF     LDY #$EF
bra_B4FB_loop:  ; orig: bra_B4FB_loop:
    MOVE.B  D0,($FF0000+$0000).l(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x01750B 05:B4FB: 99 00 00  STA $0000,Y
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01750E 05:B4FE: 88        DEY
    CMPI.B  #$FF,D2  ; orig: C - - - - - 0x01750F 05:B4FF: C0 FF     CPY #$FF
    BNE     bra_B4FB_loop             ; BNE  ; orig: C - - - - - 0x017511 05:B501: D0 F8     BNE bra_B4FB_loop
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x017513 05:B503: A9 40     LDA #$40
    MOVE.B  D0,ram_0525  ; orig: C - - - - - 0x017515 05:B505: 8D 25 05  STA ram_0525
    MOVE.B  D0,ram_indiv_random  ; orig: C - - - - - 0x017518 05:B508: 85 18     STA ram_indiv_random
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01751A 05:B50A: A9 01     LDA #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x01751C 05:B50C: 8D 36 06  STA ram_slot_active_
    ; (empty translation for STA)  ; orig: C - - - - - 0x01751F 05:B50F: 8D 37 06  STA ram_slot_active_
    RTS                     ; RTS  ; orig: C - - - - - 0x017522 05:B512: 60        RTS



tbl_B513_next_map_location_offset:  ; orig: tbl_B513_next_map_location_offset:
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - - - 0x017523 05:B513: F0        .byte $F0   ; 00 up
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x017524 05:B514: 10        .byte $10   ; 01 dow
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x017525 05:B515: FF        .byte $FF   ; 02 lef
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x017526 05:B516: 01        .byte $01   ; 03 rig



ofs_000_0x017527_01:  ; orig: ofs_000_0x017527_01:
ofs_000_0x017527_08:  ; orig: ofs_000_0x017527_08:
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x017527 05:B517: A9 00     LDA #$00
    MOVE.B  D0,ram_00E7  ; orig: - - - - - - 0x017529 05:B519: 85 E7     STA ram_00E7
    RTS                     ; RTS  ; orig: - - - - - - 0x01752B 05:B51B: 60        RTS



bra_B51C:
; bzk
    ASL.B   #1,ram_0000_t41  ; orig: C - - - - - 0x01752C 05:B51C: 06 00     ASL ram_0000_t41
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01752E 05:B51E: CA        DEX
    JMP     loc_B528  ; orig: C - - - - - 0x01752F 05:B51F: 4C 28 B5  JMP loc_B528



ofs_000_0x017532_00:  ; orig: ofs_000_0x017532_00:
ofs_000_0x017532_02:  ; orig: ofs_000_0x017532_02:
ofs_000_0x017532_03:  ; orig: ofs_000_0x017532_03:
ofs_000_0x017532_04:  ; orig: ofs_000_0x017532_04:
ofs_000_0x017532_05:  ; orig: ofs_000_0x017532_05:
ofs_000_0x017532_06:  ; orig: ofs_000_0x017532_06:
ofs_000_0x017532_07:  ; orig: ofs_000_0x017532_07:
    MOVE.B  #$01,D0  ; orig: C - - J - - 0x017532 05:B522: A9 01     LDA #$01
    MOVE.B  D0,ram_0000_t41  ; orig: C - - - - - 0x017534 05:B524: 85 00     STA ram_0000_t41
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x017536 05:B526: A2 03     LDX #$03
loc_B528:  ; orig: loc_B528:
    MOVE.B  ram_00E7,D0  ; orig: C D 1 - - - 0x017538 05:B528: A5 E7     LDA ram_00E7
    BTST    D0,ram_0000_t41  ; BIT abs  ; orig: C - - - - - 0x01753A 05:B52A: 24 00     BIT ram_0000_t41
    BEQ     bra_B51C             ; BEQ  ; orig: C - - - - - 0x01753C 05:B52C: F0 EE     BEQ bra_B51C

; bzk optimize, game never uses ram_04E4 later
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x01753E 05:B52E: 20 5A E8  JSR sub_0x01E86A_get
    MOVE.B  D0,ram_04E4  ; orig: C - - - - - 0x017541 05:B531: 8D E4 04  STA ram_04E4    ; en
    MOVE.B  tbl_B513_next_map_location_offset(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x017544 05:B534: BD 13 B5  LDA tbl_B513_next_ma
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x017547 05:B537: 18        CLC
    ADDX.B  ram_map_location,D0  ; orig: C - - - - - 0x017548 05:B538: 65 EB     ADC ram_map_location
    MOVE.B  D0,ram_next_map_location  ; orig: C - - - - - 0x01754A 05:B53A: 85 EC     STA ram_next_map_loc
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01754C 05:B53C: A5 10     LDA ram_dungeon_leve
    BNE     bra_B543             ; BNE  ; orig: C - - - - - 0x01754E 05:B53E: D0 03     BNE bra_B543    ; if

; if overworld
    BSR     sub_bat_752F_check_overworld_secret_correct_path             ; JSR -> BSR  ; orig: C - - - - - 0x017550 05:B540: 20 2F 75  JSR sub_bat_752F_che
bra_B543:  ; orig: bra_B543:
    MOVE.B  ram_next_map_location,D0  ; orig: C - - - - - 0x017553 05:B543: A5 EC     LDA ram_next_map_loc
    BPL     bra_B559             ; BPL  ; orig: C - - - - - 0x017555 05:B545: 10 12     BPL bra_B559
loc_B547:  ; orig: loc_B547:
    BSR     sub_0x01EBB3_clear_subscript             ; JSR -> BSR  ; orig: C D 1 - - - 0x017557 05:B547: 20 A3 EB  JSR sub_0x01EBB3_cle

; A = 00
    MOVE.B  D0,ram_00E7  ; orig: C - - - - - 0x01755A 05:B54A: 85 E7     STA ram_00E7
    MOVE.B  D0,ram_dungeon_level  ; orig: C - - - - - 0x01755C 05:B54C: 85 10     STA ram_dungeon_leve
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01755E 05:B54E: A9 02     LDA #$02    ; con_sc
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x017560 05:B550: 85 12     STA ram_script
    MOVE.B  D0,ram_005A  ; orig: C - - - - - 0x017562 05:B552: 85 5A     STA ram_005A
    MOVE.B  #con_sfx_4_80,D0  ; orig: C - - - - - 0x017564 05:B554: A9 80     LDA #con_sfx_4_80
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x017566 05:B556: 8D 04 06  STA ram_sfx_4
bra_B559:  ; orig: bra_B559:
sub_B559_disable_greyscale:  ; orig: sub_B559_disable_greyscale:
sub_0x017569_disable_greyscale:  ; orig: sub_0x017569_disable_greyscale:

; bzk optimize, is this necessary?
    MOVE.B  ram_for_2001,D0  ; orig: C - - - - - 0x017569 05:B559: A5 FE     LDA ram_for_2001
    ANDI.B  #$FE,D0  ; orig: C - - - - - 0x01756B 05:B55B: 29 FE     AND #$FE
    MOVE.B  D0,ram_for_2001  ; orig: C - - - - - 0x01756D 05:B55D: 85 FE     STA ram_for_2001
    RTS                     ; RTS  ; orig: C - - - - - 0x01756F 05:B55F: 60        RTS



sub_B560:  ; orig: sub_B560:

; in

; A = link direction
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x017570 05:B560: A2 01     LDX #$01
    MOVE.B  D1,ram_0000_t42  ; orig: C - - - - - 0x017572 05:B562: 86 00     STX ram_0000_t42
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x017574 05:B564: A2 03     LDX #$03
loc_B566_loop:  ; orig: loc_B566_loop:
    BTST    D0,ram_0000_t42  ; BIT abs  ; orig: C D 1 - - - 0x017576 05:B566: 24 00     BIT ram_0000_t42
    BNE     bra_B570             ; BNE  ; orig: C - - - - - 0x017578 05:B568: D0 06     BNE bra_B570
    ASL.B   #1,ram_0000_t42  ; orig: C - - - - - 0x01757A 05:B56A: 06 00     ASL ram_0000_t42
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01757C 05:B56C: CA        DEX
    JMP     loc_B566_loop  ; orig: C - - - - - 0x01757D 05:B56D: 4C 66 B5  JMP loc_B566_loop
bra_B570:  ; orig: bra_B570:
    MOVE.B  tbl_B513_next_map_location_offset(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x017580 05:B570: BD 13 B5  LDA tbl_B513_next_ma
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x017583 05:B573: 18        CLC
    ADDX.B  ram_map_location,D0  ; orig: C - - - - - 0x017584 05:B574: 65 EB     ADC ram_map_location
    RTS                     ; RTS  ; orig: C - - - - - 0x017586 05:B576: 60        RTS



tbl_B577:  ; orig: tbl_B577:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x017587 05:B577: 80        .byte $80   ; 00
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 1 - - - 0x017588 05:B578: 40        .byte $40   ; 01
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 1 - - - 0x017589 05:B579: 20        .byte $20   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x01758A 05:B57A: 10        .byte $10   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x01758B 05:B57B: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x01758C 05:B57C: 04        .byte $04   ; 05
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x01758D 05:B57D: 02        .byte $02   ; 06
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x01758E 05:B57E: 01        .byte $01   ; 07



sub_B57F:  ; orig: sub_B57F:
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x01758F 05:B57F: A0 10     LDY #$10
    MOVE.B  ram_005E,D0  ; orig: C - - - - - 0x017591 05:B581: A5 5E     LDA ram_005E
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x017593 05:B583: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x017594 05:B584: AA        TAX
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x017595 05:B585: A9 FF     LDA #$FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x017597 05:B587: 99 05 03  STA ram_0302_ppu_buf
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01759A 05:B58A: A9 10     LDA #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x01759C 05:B58C: 8D 04 03  STA ram_0302_ppu_buf
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x01759F 05:B58F: A9 28     LDA #$28    ; ppu hi
    MOVE.B  D0,ram_0302_ppu_buffer  ; orig: C - - - - - 0x0175A1 05:B591: 8D 02 03  STA ram_0302_ppu_buf
    MOVE.B  #$EC,D0  ; orig: C - - - - - 0x0175A4 05:B594: A9 EC     LDA #$EC
bra_B596_loop:  ; orig: bra_B596_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0175A6 05:B596: 18        CLC
    ADDX.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0175A7 05:B597: 69 20     ADC #$20
    BCC     bra_B59E_not_overflow             ; BCC  ; orig: C - - - - - 0x0175A9 05:B599: 90 03     BCC bra_B59E_not_ove
    ADDQ.B  #1,ram_0302_ppu_buffer  ; orig: C - - - - - 0x0175AB 05:B59B: EE 02 03  INC ram_0302_ppu_buf
bra_B59E_not_overflow:  ; orig: bra_B59E_not_overflow:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0175AE 05:B59E: CA        DEX
    BPL     bra_B596_loop             ; BPL  ; orig: C - - - - - 0x0175AF 05:B59F: 10 F5     BPL bra_B596_loop
    ; (empty translation for STA)  ; orig: C - - - - - 0x0175B1 05:B5A1: 8D 03 03  STA ram_0302_ppu_buf
    MOVE.B  ram_005D,D0  ; orig: C - - - - - 0x0175B4 05:B5A4: A5 5D     LDA ram_005D
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0175B6 05:B5A6: 48        PHA
bra_B5A7_loop:  ; orig: bra_B5A7_loop:
    BSR     sub_B608             ; JSR -> BSR  ; orig: C - - - - - 0x0175B7 05:B5A7: 20 08 B6  JSR sub_B608
    SUBQ.B  #1,ram_005D  ; orig: C - - - - - 0x0175BA 05:B5AA: C6 5D     DEC ram_005D
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0175BC 05:B5AC: 88        DEY
    BNE     bra_B5A7_loop             ; BNE  ; orig: C - - - - - 0x0175BD 05:B5AD: D0 F8     BNE bra_B5A7_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0175BF 05:B5AF: 68        PLA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0175C0 05:B5B0: 38        SEC
    SUBX.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x0175C1 05:B5B1: E9 10     SBC #$10
    MOVE.B  D0,ram_005D  ; orig: C - - - - - 0x0175C3 05:B5B3: 85 5D     STA ram_005D
    MOVE.B  ram_6BAB,D1  ; orig: C - - - - - 0x0175C5 05:B5B5: AE AB 6B  LDX ram_6BAB
loc_B5B8:  ; orig: loc_B5B8:
    BEQ     bra_B5D1             ; BEQ  ; orig: C D 1 - - - 0x0175C8 05:B5B8: F0 17     BEQ bra_B5D1
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0175CA 05:B5BA: AD 14 03  LDA ram_0302_ppu_buf
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0175CD 05:B5BD: 48        PHA
    MOVE.B  #$0E,D2  ; orig: C - - - - - 0x0175CE 05:B5BE: A0 0E     LDY #$0E
bra_B5C0_loop:  ; orig: bra_B5C0_loop:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0175D0 05:B5C0: B9 05 03  LDA ram_0302_ppu_buf
    ; (empty translation for STA)  ; orig: C - - - - - 0x0175D3 05:B5C3: 99 06 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0175D6 05:B5C6: 88        DEY
    BPL     bra_B5C0_loop             ; BPL  ; orig: C - - - - - 0x0175D7 05:B5C7: 10 F7     BPL bra_B5C0_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0175D9 05:B5C9: 68        PLA
    ; (empty translation for STA)  ; orig: C - - - - - 0x0175DA 05:B5CA: 8D 05 03  STA ram_0302_ppu_buf
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0175DD 05:B5CD: CA        DEX
    JMP     loc_B5B8  ; orig: C - - - - - 0x0175DE 05:B5CE: 4C B8 B5  JMP loc_B5B8
bra_B5D1:  ; orig: bra_B5D1:
    MOVE.B  ram_005E,D0  ; orig: C - - - - - 0x0175E1 05:B5D1: A5 5E     LDA ram_005E
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0175E3 05:B5D3: 38        SEC
    SUBX.B  #$1A,D0       ; SBC imm  ; orig: C - - - - - 0x0175E4 05:B5D4: E9 1A     SBC #$1A
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0175E6 05:B5D6: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0175E7 05:B5D7: AA        TAX
    MOVE.B  #$0F,D2  ; orig: C - - - - - 0x0175E8 05:B5D8: A0 0F     LDY #$0F
bra_B5DA_loop:  ; orig: bra_B5DA_loop:
    MOVE.B  ram_6BBD(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0175EA 05:B5DA: B9 BD 6B  LDA ram_6BBD,Y
    ; !! AND tbl_B577,X - needs manual review  ; orig: C - - - - - 0x0175ED 05:B5DD: 3D 77 B5  AND tbl_B577,X
    BNE     bra_B5E7             ; BNE  ; orig: C - - - - - 0x0175F0 05:B5E0: D0 05     BNE bra_B5E7
    MOVE.B  #$F5,D0  ; orig: C - - - - - 0x0175F2 05:B5E2: A9 F5     LDA #$F5
    ; (empty translation for STA)  ; orig: C - - - - - 0x0175F4 05:B5E4: 99 05 03  STA ram_0302_ppu_buf
bra_B5E7:  ; orig: bra_B5E7:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0175F7 05:B5E7: 88        DEY
    BPL     bra_B5DA_loop             ; BPL  ; orig: C - - - - - 0x0175F8 05:B5E8: 10 F0     BPL bra_B5DA_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0175FA 05:B5EA: 60        RTS



sub_B5EB:  ; orig: sub_B5EB:
sub_0x0175FB:  ; orig: sub_0x0175FB:
    MOVE.B  #con_item_compass,D1  ; orig: C - - - - - 0x0175FB 05:B5EB: A2 10     LDX #con_item_compas
    BNE     bra_B5F1             ; BNE  ; orig: C - - - - - 0x0175FD 05:B5ED: D0 02     BNE bra_B5F1    ; jm



sub_B5EF:  ; orig: sub_B5EF:
    MOVE.B  #con_item_map,D1  ; orig: C - - - - - 0x0175FF 05:B5EF: A2 11     LDX #con_item_map
bra_B5F1:  ; orig: bra_B5F1:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x017601 05:B5F1: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B607_RTS             ; BEQ  ; orig: C - - - - - 0x017603 05:B5F3: F0 12     BEQ bra_B607_RTS    

; if dungeon
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x017605 05:B5F5: 38        SEC
    SUBX.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x017606 05:B5F6: E9 01     SBC #$01
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x017608 05:B5F8: C9 08     CMP #$08
    BCC     bra_B5FE             ; BCC  ; orig: C - - - - - 0x01760A 05:B5FA: 90 02     BCC bra_B5FE
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01760C 05:B5FC: E8        INX ; con_item_d9_co
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01760D 05:B5FD: E8        INX
bra_B5FE:  ; orig: bra_B5FE:
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01760E 05:B5FE: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x017610 05:B600: A8        TAY
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x017611 05:B601: BD 57 06  LDA ram_items,X
    ; !! AND tbl_0x01E6CE_8_bits,Y - needs manual review  ; orig: C - - - - - 0x017614 05:B604: 39 BE E6  AND tbl_0x01E6CE_8_b
bra_B607_RTS:  ; orig: bra_B607_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017617 05:B607: 60        RTS



sub_B608:  ; orig: sub_B608:

; code for dungeons only, not for overworld
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x017618 05:B608: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x017619 05:B609: 48        PHA
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x01761A 05:B60A: 20 CE E6  JSR sub_0x01E6DE_get
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x01761D 05:B60D: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01761F 05:B60F: 48        PHA
    MOVE.B  ram_005D,D0  ; orig: C - - - - - 0x017620 05:B610: A5 5D     LDA ram_005D
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x017622 05:B612: 85 EB     STA ram_map_location
    MOVE.B  #$13,D0  ; orig: C - - - - - 0x017624 05:B614: A9 13     LDA #$13
    MOVE.B  D0,ram_033F  ; orig: C - - - - - 0x017626 05:B616: 8D 3F 03  STA ram_033F
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x017629 05:B619: A4 EB     LDY ram_map_location
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x01762B 05:B61B: B1 00     LDA (ram_0000_t13_da
    ANDI.B  #$20,D0  ; orig: C - - - - - 0x01762D 05:B61D: 29 20     AND #$20
    BEQ     bra_B632             ; BEQ  ; orig: C - - - - - 0x01762F 05:B61F: F0 11     BEQ bra_B632
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x017631 05:B621: A9 08     LDA #$08
    MOVE.B  D0,ram_0002_t24_direction  ; orig: C - - - - - 0x017633 05:B623: 85 02     STA ram_0002_t24_dir
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x017635 05:B625: A2 03     LDX #$03
bra_B627_loop:  ; orig: bra_B627_loop:
    BSR     sub_A3F6             ; JSR -> BSR  ; orig: C - - - - - 0x017637 05:B627: 20 F6 A3  JSR sub_A3F6
    BSR     sub_B641             ; JSR -> BSR  ; orig: C - - - - - 0x01763A 05:B62A: 20 41 B6  JSR sub_B641
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01763D 05:B62D: CA        DEX
    LSR.B   #1,ram_0002_t24_direction  ; orig: C - - - - - 0x01763E 05:B62E: 46 02     LSR ram_0002_t24_dir
    BNE     bra_B627_loop             ; BNE  ; orig: C - - - - - 0x017640 05:B630: D0 F5     BNE bra_B627_loop
bra_B632:  ; orig: bra_B632:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017642 05:B632: 68        PLA
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x017643 05:B633: 85 EB     STA ram_map_location
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017645 05:B635: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x017646 05:B636: A8        TAY
    MOVE.B  ram_033F,D0  ; orig: C - - - - - 0x017647 05:B637: AD 3F 03  LDA ram_033F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01764A 05:B63A: 18        CLC
    ADDX.B  #$E2,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01764B 05:B63B: 69 E2     ADC #$E2
    ; (empty translation for STA)  ; orig: C - - - - - 0x01764D 05:B63D: 99 04 03  STA ram_0302_ppu_buf
    RTS                     ; RTS  ; orig: C - - - - - 0x017650 05:B640: 60        RTS



sub_B641:  ; orig: sub_B641:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x017651 05:B641: A0 00     LDY #$00
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x017653 05:B643: 48        PHA
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x017654 05:B644: C9 04     CMP #$04
    BCC     bra_B665             ; BCC  ; orig: C - - - - - 0x017656 05:B646: 90 1D     BCC bra_B665
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x017658 05:B648: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x017659 05:B649: 48        PHA
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01765A 05:B64A: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01765B 05:B64B: 48        PHA
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x01765C 05:B64C: 20 CE E6  JSR sub_0x01E6DE_get
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01765F 05:B64F: 18        CLC
    ; !! AND tbl_0x01E6CE_8_bits,X - needs manual review  ; orig: C - - - - - 0x017660 05:B650: 3D BE E6  AND tbl_0x01E6CE_8_b
    BEQ     bra_B656             ; BEQ  ; orig: C - - - - - 0x017663 05:B653: F0 01     BEQ bra_B656
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x017665 05:B655: 38        SEC
bra_B656:  ; orig: bra_B656:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017666 05:B656: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x017667 05:B657: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017668 05:B658: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x017669 05:B659: AA        TAX
bra_B65A:  ; orig: bra_B65A:

; bzk optimize, Y always 00
    MOVE.B  ram_033F(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01766A 05:B65A: B9 3F 03  LDA ram_033F,Y
    ROXL.B  #1,D0           ; ROL A (uses X flag)  ; orig: C - - - - - 0x01766D 05:B65D: 2A        ROL
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01766E 05:B65E: 29 0F     AND #$0F
    MOVE.B  D0,ram_033F(D2.L)  ; STA abs,Y  ; orig: C - - - - - 0x017670 05:B660: 99 3F 03  STA ram_033F,Y
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017673 05:B663: 68        PLA
    RTS                     ; RTS  ; orig: C - - - - - 0x017674 05:B664: 60        RTS
bra_B665:  ; orig: bra_B665:
    CMPI.B  #$00,D0  ; orig: C - - - - - 0x017675 05:B665: C9 00     CMP #$00
    BEQ     bra_B65A             ; BEQ  ; orig: C - - - - - 0x017677 05:B667: F0 F1     BEQ bra_B65A
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x017679 05:B669: 18        CLC
    BCC     bra_B65A             ; BCC  ; orig: C - - - - - 0x01767A 05:B66A: 90 EE     BCC bra_B65A    ; jm



sub_B66C:  ; orig: sub_B66C:

; code for dungeons only, not for overworld
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x01767C 05:B66C: 20 CE E6  JSR sub_0x01E6DE_get
    MOVE.B  #$03,D1  ; orig: C - - - - - 0x01767F 05:B66F: A2 03     LDX #$03
bra_B671_loop:  ; orig: bra_B671_loop:
    MOVEA.W ($FF0000+ram_0000_t13_data).l,A1  ; LDA (zp),Y
    MOVE.B  ($FF0000,A1,D2.W),D0  ; orig: C - - - - - 0x017681 05:B671: B1 00     LDA (ram_0000_t13_da
    ; !! AND tbl_0x01E6CE_8_bits,X - needs manual review  ; orig: C - - - - - 0x017683 05:B673: 3D BE E6  AND tbl_0x01E6CE_8_b
    BEQ     bra_B67C             ; BEQ  ; orig: C - - - - - 0x017686 05:B676: F0 04     BEQ bra_B67C
    OR.B    ram_00EE,D0  ; orig: C - - - - - 0x017688 05:B678: 05 EE     ORA ram_00EE
    MOVE.B  D0,ram_00EE  ; orig: C - - - - - 0x01768A 05:B67A: 85 EE     STA ram_00EE
bra_B67C:  ; orig: bra_B67C:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01768C 05:B67C: CA        DEX
    BPL     bra_B671_loop             ; BPL  ; orig: C - - - - - 0x01768D 05:B67D: 10 F2     BPL bra_B671_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01768F 05:B67F: 60        RTS



; bzk garbage
    MOVE.B  ram_map_location,D0  ; orig: - - - - - - 0x017690 05:B680: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x017692 05:B682: 48        PHA
    ANDI.B  #$0F,D0  ; orig: - - - - - - 0x017693 05:B683: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: - - - - - - 0x017695 05:B685: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x017696 05:B686: 68        PLA

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x017697 05:B687: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x017698 05:B688: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x017699 05:B689: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x01769A 05:B68A: 4A        LSR
    MOVE.B  D0,D1           ; TAX  ; orig: - - - - - - 0x01769B 05:B68B: AA        TAX
    RTS                     ; RTS  ; orig: - - - - - - 0x01769C 05:B68C: 60        RTS



sub_B68D:  ; orig: sub_B68D:

; out

; Z

; 0 =

; 1 =
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01769D 05:B68D: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B696_RTS             ; BEQ  ; orig: C - - - - - 0x01769F 05:B68F: F0 05     BEQ bra_B696_RTS    

; if dungeon
    MOVE.B  ram_6A7E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0176A1 05:B691: B9 7E 6A  LDA ram_6A7E_map_dat
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x0176A4 05:B694: 29 80     AND #$80
bra_B696_RTS:  ; orig: bra_B696_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0176A6 05:B696: 60        RTS



tbl_B697_spr_X:  ; orig: tbl_B697_spr_X:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - - - - - - 0x0176A7 05:B697: 80        .byte $80   ; 00
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - - - 0x0176A8 05:B698: 98        .byte $98   ; 01
    ; [DIRECTIVE] .BYTE $AC  -- needs manual handling  ; orig: - D 1 - - - 0x0176A9 05:B699: AC        .byte $AC   ; 02
    ; [DIRECTIVE] .BYTE $B4  -- needs manual handling  ; orig: - D 1 - - - 0x0176AA 05:B69A: B4        .byte $B4   ; 03
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x0176AB 05:B69B: C8        .byte $C8   ; 04
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x0176AC 05:B69C: 80        .byte $80   ; 05
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - - - 0x0176AD 05:B69D: 98        .byte $98   ; 06
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x0176AE 05:B69E: B0        .byte $B0   ; 07
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x0176AF 05:B69F: C8        .byte $C8   ; 08
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x0176B0 05:B6A0: 80        .byte $80   ; 09
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 1 - - - 0x0176B1 05:B6A1: 94        .byte $94   ; 0A
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - D 1 - - - 0x0176B2 05:B6A2: A0        .byte $A0   ; 0B
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x0176B3 05:B6A3: B0        .byte $B0   ; 0C
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - - - 0x0176B4 05:B6A4: C0        .byte $C0   ; 0D
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - - - 0x0176B5 05:B6A5: CC        .byte $CC   ; 0E
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x0176B6 05:B6A6: B0        .byte $B0   ; 0F



sub_B6A7:  ; orig: sub_B6A7:
    MOVE.B  #$1E,D1  ; orig: C D 1 - - - 0x0176B7 05:B6A7: A2 1E     LDX #$1E
bra_B6A9_loop:
; con_item_boomerang   con_item_magic_boomerang
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0176B9 05:B6A9: BD 57 06  LDA ram_items,X
    BNE     bra_B6B5             ; BNE  ; orig: C - - - - - 0x0176BC 05:B6AC: D0 07     BNE bra_B6B5
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0176BE 05:B6AE: CA        DEX
    CMPI.B  #$1C,D1  ; orig: C - - - - - 0x0176BF 05:B6AF: E0 1C     CPX #$1C
    BNE     bra_B6A9_loop             ; BNE  ; orig: C - - - - - 0x0176C1 05:B6B1: D0 F6     BNE bra_B6A9_loop
    BEQ     bra_B6C2             ; BEQ  ; orig: C - - - - - 0x0176C3 05:B6B3: F0 0D     BEQ bra_B6C2    ; jm
bra_B6B5:  ; orig: bra_B6B5:
    MOVE.B  #$36,D0  ; orig: C - - - - - 0x0176C5 05:B6B5: A9 36     LDA #$36
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x0176C7 05:B6B7: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x0176C9 05:B6B9: A9 80     LDA #$80
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x0176CB 05:B6BB: 85 00     STA ram_0000_t21_spr
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0176CD 05:B6BD: 8A        TXA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0176CE 05:B6BE: A8        TAY
    BSR     sub_0x01E745             ; JSR -> BSR  ; orig: C - - - - - 0x0176CF 05:B6BF: 20 35 E7  JSR sub_0x01E745
bra_B6C2:  ; orig: bra_B6C2:
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x0176D2 05:B6C2: A2 01     LDX #$01
bra_B6C4_loop:  ; orig: bra_B6C4_loop:

; 0658-0668
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0176D4 05:B6C4: BD 57 06  LDA ram_items,X
    CMPI.B  #con_item_compass,D1  ; orig: C - - - - - 0x0176D7 05:B6C7: E0 10     CPX #con_item_compas
    BNE     bra_B6D0             ; BNE  ; orig: C - - - - - 0x0176D9 05:B6C9: D0 05     BNE bra_B6D0
    BSR     sub_B5EB             ; JSR -> BSR  ; orig: C - - - - - 0x0176DB 05:B6CB: 20 EB B5  JSR sub_B5EB
    MOVE.B  #$10,D1  ; orig: C - - - - - 0x0176DE 05:B6CE: A2 10     LDX #$10
bra_B6D0:  ; orig: bra_B6D0:
    CMPI.B  #con_item_map,D1  ; orig: C - - - - - 0x0176E0 05:B6D0: E0 11     CPX #con_item_map
    BNE     bra_B6D9             ; BNE  ; orig: C - - - - - 0x0176E2 05:B6D2: D0 05     BNE bra_B6D9
    BSR     sub_B5EF             ; JSR -> BSR  ; orig: C - - - - - 0x0176E4 05:B6D4: 20 EF B5  JSR sub_B5EF
    MOVE.B  #$11,D1  ; orig: C - - - - - 0x0176E7 05:B6D7: A2 11     LDX #$11
bra_B6D9:  ; orig: bra_B6D9:
    CMPI.B  #$00,D0  ; orig: C - - - - - 0x0176E9 05:B6D9: C9 00     CMP #$00
    BEQ     bra_B717             ; BEQ  ; orig: C - - - - - 0x0176EB 05:B6DB: F0 3A     BEQ bra_B717
    CMPI.B  #con_item_letter,D1  ; orig: C - - - - - 0x0176ED 05:B6DD: E0 0F     CPX #con_item_letter
    BNE     bra_B6E6             ; BNE  ; orig: C - - - - - 0x0176EF 05:B6DF: D0 05     BNE bra_B6E6
    MOVE.B  ram_item_potion,D0  ; orig: C - - - - - 0x0176F1 05:B6E1: AD 5E 06  LDA ram_item_potion
    BNE     bra_B717             ; BNE  ; orig: C - - - - - 0x0176F4 05:B6E4: D0 31     BNE bra_B717
bra_B6E6:  ; orig: bra_B6E6:
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0176F6 05:B6E6: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0176F7 05:B6E7: 48        PHA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0176F8 05:B6E8: A8        TAY
    MOVE.B  tbl_B697_spr_X(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x0176F9 05:B6E9: BD 97 B6  LDA tbl_B697_spr_X,X
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x0176FC 05:B6EC: 85 00     STA ram_0000_t21_spr
    MOVE.B  #$36,D0  ; orig: C - - - - - 0x0176FE 05:B6EE: A9 36     LDA #$36
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x017700 05:B6F0: E0 05     CPX #$05
    BCC     bra_B710             ; BCC  ; orig: C - - - - - 0x017702 05:B6F2: 90 1C     BCC bra_B710
    MOVE.B  #$46,D0  ; orig: C - - - - - 0x017704 05:B6F4: A9 46     LDA #$46
    CMPI.B  #$0F,D1  ; orig: C - - - - - 0x017706 05:B6F6: E0 0F     CPX #$0F
    BEQ     bra_B710             ; BEQ  ; orig: C - - - - - 0x017708 05:B6F8: F0 16     BEQ bra_B710
    CMPI.B  #$09,D1  ; orig: C - - - - - 0x01770A 05:B6FA: E0 09     CPX #$09
    BCC     bra_B710             ; BCC  ; orig: C - - - - - 0x01770C 05:B6FC: 90 12     BCC bra_B710
    MOVE.B  #$1E,D0  ; orig: C - - - - - 0x01770E 05:B6FE: A9 1E     LDA #$1E
    CMPI.B  #$10,D1  ; orig: C - - - - - 0x017710 05:B700: E0 10     CPX #$10
    BCC     bra_B710             ; BCC  ; orig: C - - - - - 0x017712 05:B702: 90 0C     BCC bra_B710
    MOVE.B  #$2C,D0  ; orig: C - - - - - 0x017714 05:B704: A9 2C     LDA #$2C
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x017716 05:B706: 85 00     STA ram_0000_t21_spr
    MOVE.B  #$9E,D0  ; orig: C - - - - - 0x017718 05:B708: A9 9E     LDA #$9E
    CMPI.B  #$11,D1  ; orig: C - - - - - 0x01771A 05:B70A: E0 11     CPX #$11
    BCC     bra_B710             ; BCC  ; orig: C - - - - - 0x01771C 05:B70C: 90 02     BCC bra_B710

; X = 11
    MOVE.B  #$76,D0  ; orig: C - - - - - 0x01771E 05:B70E: A9 76     LDA #$76
bra_B710:  ; orig: bra_B710:
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x017720 05:B710: 85 01     STA ram_0001_t15_spr
    BSR     sub_B81C             ; JSR -> BSR  ; orig: C - - - - - 0x017722 05:B712: 20 1C B8  JSR sub_B81C
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x017725 05:B715: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x017726 05:B716: AA        TAX
bra_B717:  ; orig: bra_B717:
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x017727 05:B717: E8        INX
    CMPI.B  #$12,D1  ; orig: C - - - - - 0x017728 05:B718: E0 12     CPX #$12
    BCC     bra_B6C4_loop             ; BCC  ; orig: C - - - - - 0x01772A 05:B71A: 90 A8     BCC bra_B6C4_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01772C 05:B71C: 60        RTS



tbl_B71D_spr_X:  ; orig: tbl_B71D_spr_X:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x01772D 05:B71D: 80        .byte $80   ;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - - - 0x01772E 05:B71E: 98        .byte $98   ;
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x01772F 05:B71F: B0        .byte $B0   ;
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - - - - - - 0x017730 05:B720: B0        .byte $B0   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x017731 05:B721: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x017732 05:B722: 80        .byte $80   ;
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - - - 0x017733 05:B723: 98        .byte $98   ;
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x017734 05:B724: B0        .byte $B0   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x017735 05:B725: C8        .byte $C8   ;



sub_B726:  ; orig: sub_B726:
    MOVE.B  ram_item_slot_index,D1  ; orig: C - - - - - 0x017736 05:B726: AE 56 06  LDX ram_item_slot_in
    BNE     bra_B739             ; BNE  ; orig: C - - - - - 0x017739 05:B729: D0 0E     BNE bra_B739
    MOVE.B  #$1E,D1  ; orig: C - - - - - 0x01773B 05:B72B: A2 1E     LDX #$1E
bra_B72D_loop:
; con_item_boomerang  con_item_magic_boomerang
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x01773D 05:B72D: BD 57 06  LDA ram_items,X
    BNE     bra_B739             ; BNE  ; orig: C - - - - - 0x017740 05:B730: D0 07     BNE bra_B739
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x017742 05:B732: CA        DEX
    CMPI.B  #$1C,D1  ; orig: C - - - - - 0x017743 05:B733: E0 1C     CPX #$1C
    BNE     bra_B72D_loop             ; BNE  ; orig: C - - - - - 0x017745 05:B735: D0 F6     BNE bra_B72D_loop
    BEQ     bra_B756             ; BEQ  ; orig: C - - - - - 0x017747 05:B737: F0 1D     BEQ bra_B756    ; jm
bra_B739:  ; orig: bra_B739:
    MOVE.B  ram_items(D1.L),D0  ; LDA abs,X  ; orig: C - - - - - 0x017749 05:B739: BD 57 06  LDA ram_items,X
    BEQ     bra_B756             ; BEQ  ; orig: C - - - - - 0x01774C 05:B73C: F0 18     BEQ bra_B756
    CMPI.B  #con_item_letter,D1  ; orig: C - - - - - 0x01774E 05:B73E: E0 0F     CPX #con_item_letter
    BNE     bra_B749             ; BNE  ; orig: C - - - - - 0x017750 05:B740: D0 07     BNE bra_B749
    MOVE.B  ram_item_potion,D0  ; orig: C - - - - - 0x017752 05:B742: AD 5E 06  LDA ram_item_potion
    BNE     bra_B756             ; BNE  ; orig: C - - - - - 0x017755 05:B745: D0 0F     BNE bra_B756
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x017757 05:B747: A9 01     LDA #$01
bra_B749:  ; orig: bra_B749:

; bzk optimize, useless STA, will be overwritten at 0x01E748
    MOVE.B  D0,ram_0004_t20_useless  ; orig: C - - - - - 0x017759 05:B749: 85 04     STA ram_0004_t20_use
    MOVE.B  #$36,D0  ; orig: C - - - - - 0x01775B 05:B74B: A9 36     LDA #$36
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x01775D 05:B74D: 85 01     STA ram_0001_t15_spr
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01775F 05:B74F: A9 40     LDA #$40
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x017761 05:B751: 85 00     STA ram_0000_t21_spr
    BSR     sub_B81C             ; JSR -> BSR  ; orig: C - - - - - 0x017763 05:B753: 20 1C B8  JSR sub_B81C
bra_B756:  ; orig: bra_B756:
    MOVE.B  ram_item_slot_index,D2  ; orig: C - - - - - 0x017766 05:B756: AC 56 06  LDY ram_item_slot_in
    CMPI.B  #con_item_letter,D2  ; orig: C - - - - - 0x017769 05:B759: C0 0F     CPY #con_item_letter
    BNE     bra_B767             ; BNE  ; orig: C - - - - - 0x01776B 05:B75B: D0 0A     BNE bra_B767
    MOVE.B  #con_item_potion,D2  ; orig: C - - - - - 0x01776D 05:B75D: A0 07     LDY #con_item_potion
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01776F 05:B75F: B9 57 06  LDA ram_items,Y
    BEQ     bra_B767             ; BEQ  ; orig: C - - - - - 0x017772 05:B762: F0 03     BEQ bra_B767
    MOVE.B  D2,ram_item_slot_index  ; orig: - - - - - - 0x017774 05:B764: 8C 56 06  STY ram_item_slot_in
bra_B767:  ; orig: bra_B767:
    MOVE.B  tbl_B71D_spr_X(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017777 05:B767: B9 1D B7  LDA tbl_B71D_spr_X,Y
    ; (empty translation for STA)  ; orig: C - - - - - 0x01777A 05:B76A: 8D 1F 02  STA ram_spr_X + $1C
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01777D 05:B76D: 18        CLC
    ADDX.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01777E 05:B76E: 69 08     ADC #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x017780 05:B770: 8D 23 02  STA ram_spr_X + $20
    MOVE.B  #$36,D0  ; orig: C - - - - - 0x017783 05:B773: A9 36     LDA #$36

; con_item_sword

; con_item_bomb

; con_item_arrow

; con_item_bow

; con_item_candle
    CMPI.B  #$05,D2  ; orig: C - - - - - 0x017785 05:B775: C0 05     CPY #$05
    BCC     bra_B77B             ; BCC  ; orig: C - - - - - 0x017787 05:B777: 90 02     BCC bra_B77B
    MOVE.B  #$46,D0  ; orig: C - - - - - 0x017789 05:B779: A9 46     LDA #$46
bra_B77B:  ; orig: bra_B77B:
    ; (empty translation for STA)  ; orig: C - - - - - 0x01778B 05:B77B: 8D 1C 02  STA ram_spr_Y + $1C
    ; (empty translation for STA)  ; orig: C - - - - - 0x01778E 05:B77E: 8D 20 02  STA ram_spr_Y + $20
    MOVE.B  #$1E,D0  ; orig: C - - - - - 0x017791 05:B781: A9 1E     LDA #$1E
    ; (empty translation for STA)  ; orig: C - - - - - 0x017793 05:B783: 8D 1D 02  STA ram_spr_T + $1C
    ; (empty translation for STA)  ; orig: C - - - - - 0x017796 05:B786: 8D 21 02  STA ram_spr_T + $20
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x017799 05:B789: A5 15     LDA ram_frm_cnt
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x01779B 05:B78B: 29 08     AND #$08

; / 08
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01779D 05:B78D: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01779E 05:B78E: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01779F 05:B78F: 4A        LSR
    ADDX.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0177A0 05:B790: 69 01     ADC #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x0177A2 05:B792: 8D 1E 02  STA ram_spr_A + $1C
    ORI.B   #$40,D0  ; orig: C - - - - - 0x0177A5 05:B795: 09 40     ORA #$40
    ; (empty translation for STA)  ; orig: C - - - - - 0x0177A7 05:B797: 8D 22 02  STA ram_spr_A + $20
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x0177AA 05:B79A: AD F8 03  LDA ram_03F8_link
    CMP.B   ram_00EF,D0  ; orig: C - - - - - 0x0177AD 05:B79D: C5 EF     CMP ram_00EF
    BEQ     bra_B7F1_RTS             ; BEQ  ; orig: C - - - - - 0x0177AF 05:B79F: F0 50     BEQ bra_B7F1_RTS
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0177B1 05:B7A1: AA        TAX
    BEQ     bra_B7C8             ; BEQ  ; orig: C - - - - - 0x0177B2 05:B7A2: F0 24     BEQ bra_B7C8
    CMPI.B  #$04,D1  ; orig: C - - - - - 0x0177B4 05:B7A4: E0 04     CPX #$04
    BCS     bra_B7C8             ; BCS  ; orig: C - - - - - 0x0177B6 05:B7A6: B0 20     BCS bra_B7C8
    MOVE.B  #con_sfx_2_cursor_select,D1  ; orig: C - - - - - 0x0177B8 05:B7A8: A2 01     LDX #con_sfx_2_curso
    MOVE.B  D1,ram_sfx_2  ; orig: C - - - - - 0x0177BA 05:B7AA: 8E 02 06  STX ram_sfx_2
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0177BD 05:B7AD: AA        TAX
    MOVE.B  ram_item_slot_index,D0  ; orig: C - - - - - 0x0177BE 05:B7AE: AD 56 06  LDA ram_item_slot_in
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0177C1 05:B7B1: 48        PHA
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0177C2 05:B7B2: 8A        TXA
    BSR     sub_B7C8             ; JSR -> BSR  ; orig: C - - - - - 0x0177C3 05:B7B3: 20 C8 B7  JSR sub_B7C8
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0177C6 05:B7B6: 68        PLA
    CMP.B   ram_item_slot_index,D0  ; orig: C - - - - - 0x0177C7 05:B7B7: CD 56 06  CMP ram_item_slot_in
    BEQ     bra_B7C4             ; BEQ  ; orig: C - - - - - 0x0177CA 05:B7BA: F0 08     BEQ bra_B7C4
    MOVE.B  ram_item_slot_index,D2  ; orig: C - - - - - 0x0177CC 05:B7BC: AC 56 06  LDY ram_item_slot_in
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0177CF 05:B7BF: B9 57 06  LDA ram_items,Y
    BNE     bra_B7C7_RTS             ; BNE  ; orig: C - - - - - 0x0177D2 05:B7C2: D0 03     BNE bra_B7C7_RTS
bra_B7C4:  ; orig: bra_B7C4:
    LSR.B   #1,ram_sfx_2  ; orig: C - - - - - 0x0177D4 05:B7C4: 4E 02 06  LSR ram_sfx_2   ; co
bra_B7C7_RTS:  ; orig: bra_B7C7_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0177D7 05:B7C7: 60        RTS
bra_B7C8:  ; orig: bra_B7C8:
sub_B7C8:  ; orig: sub_B7C8:
sub_0x0177D8:
; A = 02
    MOVE.B  D0,ram_00EF  ; orig: C - - - - - 0x0177D8 05:B7C8: 85 EF     STA ram_00EF
    MOVE.B  #$09,D1  ; orig: C - - - - - 0x0177DA 05:B7CA: A2 09     LDX #$09
bra_B7CC_loop:  ; orig: bra_B7CC_loop:
    BSR     sub_B821             ; JSR -> BSR  ; orig: C - - - - - 0x0177DC 05:B7CC: 20 21 B8  JSR sub_B821
    CMPI.B  #con_item_sword,D2  ; orig: C - - - - - 0x0177DF 05:B7CF: C0 00     CPY #con_item_sword
    BEQ     bra_B7F2             ; BEQ  ; orig: C - - - - - 0x0177E1 05:B7D1: F0 1F     BEQ bra_B7F2
    CMPI.B  #con_item_bow,D2  ; orig: C - - - - - 0x0177E3 05:B7D3: C0 03     CPY #con_item_bow
    BEQ     bra_B7E0             ; BEQ  ; orig: C - - - - - 0x0177E5 05:B7D5: F0 09     BEQ bra_B7E0
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x0177E7 05:B7D7: B9 57 06  LDA ram_items,Y
    BNE     bra_B7E5             ; BNE  ; orig: C - - - - - 0x0177EA 05:B7DA: D0 09     BNE bra_B7E5
    CMPI.B  #con_item_potion,D2  ; orig: C - - - - - 0x0177EC 05:B7DC: C0 07     CPY #con_item_potion
    BEQ     bra_B808             ; BEQ  ; orig: C - - - - - 0x0177EE 05:B7DE: F0 28     BEQ bra_B808
bra_B7E0:  ; orig: bra_B7E0:
loc_B7E0:  ; orig: loc_B7E0:
    SUBQ.B  #1,D1           ; DEX  ; orig: C D 1 - - - 0x0177F0 05:B7E0: CA        DEX
    BPL     bra_B7CC_loop             ; BPL  ; orig: C - - - - - 0x0177F1 05:B7E1: 10 E9     BPL bra_B7CC_loop
    MOVE.B  #con_item_sword,D2  ; orig: C - - - - - 0x0177F3 05:B7E3: A0 00     LDY #con_item_sword
bra_B7E5:  ; orig: bra_B7E5:
loc_B7E5:  ; orig: loc_B7E5:
    CMPI.B  #con_item_arrow,D2  ; orig: C D 1 - - - 0x0177F5 05:B7E5: C0 02     CPY #con_item_arrow
    BNE     bra_B7EE             ; BNE  ; orig: C - - - - - 0x0177F7 05:B7E7: D0 05     BNE bra_B7EE
    MOVE.B  ram_item_bow,D0  ; orig: C - - - - - 0x0177F9 05:B7E9: AD 5A 06  LDA ram_item_bow
    BEQ     bra_B7CC_loop             ; BEQ  ; orig: C - - - - - 0x0177FC 05:B7EC: F0 DE     BEQ bra_B7CC_loop
bra_B7EE:  ; orig: bra_B7EE:
    MOVE.B  D2,ram_item_slot_index  ; orig: C - - - - - 0x0177FE 05:B7EE: 8C 56 06  STY ram_item_slot_in
bra_B7F1_RTS:  ; orig: bra_B7F1_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017801 05:B7F1: 60        RTS
bra_B7F2:  ; orig: bra_B7F2:
    MOVE.B  #$1E,D2  ; orig: C - - - - - 0x017802 05:B7F2: A0 1E     LDY #$1E
bra_B7F4_loop:
; con_item_boomerang   con_item_magic_boomerang
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017804 05:B7F4: B9 57 06  LDA ram_items,Y
    BNE     bra_B803             ; BNE  ; orig: C - - - - - 0x017807 05:B7F7: D0 0A     BNE bra_B803
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x017809 05:B7F9: 88        DEY
    CMPI.B  #$1C,D2  ; orig: C - - - - - 0x01780A 05:B7FA: C0 1C     CPY #$1C
    BNE     bra_B7F4_loop             ; BNE  ; orig: C - - - - - 0x01780C 05:B7FC: D0 F6     BNE bra_B7F4_loop
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01780E 05:B7FE: A0 00     LDY #$00
    JMP     loc_B7E0  ; orig: C - - - - - 0x017810 05:B800: 4C E0 B7  JMP loc_B7E0
bra_B803:  ; orig: bra_B803:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x017813 05:B803: A0 00     LDY #$00
    JMP     loc_B7E5  ; orig: C - - - - - 0x017815 05:B805: 4C E5 B7  JMP loc_B7E5
bra_B808:  ; orig: bra_B808:
    MOVE.B  #$0F,D2  ; orig: C - - - - - 0x017818 05:B808: A0 0F     LDY #$0F
    MOVE.B  ram_items(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x01781A 05:B80A: B9 57 06  LDA ram_items,Y
    BNE     bra_B813             ; BNE  ; orig: C - - - - - 0x01781D 05:B80D: D0 04     BNE bra_B813
    MOVE.B  #con_item_potion,D2  ; orig: C - - - - - 0x01781F 05:B80F: A0 07     LDY #con_item_potion
    BNE     bra_B7E0             ; BNE  ; orig: C - - - - - 0x017821 05:B811: D0 CD     BNE bra_B7E0    ; jm
bra_B813:  ; orig: bra_B813:
    MOVE.B  ram_item_potion,D0  ; orig: C - - - - - 0x017823 05:B813: AD 5E 06  LDA ram_item_potion
    BEQ     bra_B7EE             ; BEQ  ; orig: C - - - - - 0x017826 05:B816: F0 D6     BEQ bra_B7EE
    MOVE.B  #con_item_potion,D2  ; orig: - - - - - - 0x017828 05:B818: A0 07     LDY #con_item_potion
    BNE     bra_B7EE             ; BNE  ; orig: - - - - - - 0x01782A 05:B81A: D0 D2     BNE bra_B7EE    ; jm



sub_B81C:  ; orig: sub_B81C:
sub_0x01782C:
; bzk optimize, delete exports, too many cycles to swap bank and go here for a couple of instructions
loc_0x01782C:  ; orig: loc_0x01782C:
    MOVE.B  D1,D0           ; TXA  ; orig: C D 1 - - - 0x01782C 05:B81C: 8A        TXA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01782D 05:B81D: A8        TAY
    JMP     loc_0x01E745  ; orig: C - - - - - 0x01782E 05:B81E: 4C 35 E7  JMP loc_0x01E745



sub_B821:  ; orig: sub_B821:
    MOVE.B  ram_00EF,D0  ; orig: C - - - - - 0x017831 05:B821: A5 EF     LDA ram_00EF
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x017833 05:B823: 29 03     AND #$03
    BEQ     bra_B839_RTS             ; BEQ  ; orig: C - - - - - 0x017835 05:B825: F0 12     BEQ bra_B839_RTS
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x017837 05:B827: C8        INY
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x017838 05:B828: 4A        LSR
    BCS     bra_B82D             ; BCS  ; orig: C - - - - - 0x017839 05:B829: B0 02     BCS bra_B82D
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01783B 05:B82B: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01783C 05:B82C: 88        DEY
bra_B82D:  ; orig: bra_B82D:
    CMPI.B  #$FF,D2  ; orig: C - - - - - 0x01783D 05:B82D: C0 FF     CPY #$FF
    BNE     bra_B833             ; BNE  ; orig: C - - - - - 0x01783F 05:B82F: D0 02     BNE bra_B833
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x017841 05:B831: A0 08     LDY #$08
bra_B833:  ; orig: bra_B833:
    CMPI.B  #$09,D2  ; orig: C - - - - - 0x017843 05:B833: C0 09     CPY #$09
    BNE     bra_B839_RTS             ; BNE  ; orig: C - - - - - 0x017845 05:B835: D0 02     BNE bra_B839_RTS
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x017847 05:B837: A0 00     LDY #$00
bra_B839_RTS:  ; orig: bra_B839_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017849 05:B839: 60        RTS



sub_0x01784A:  ; orig: sub_0x01784A:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01784A 05:B83A: A9 00     LDA #$00
    MOVE.B  D0,ram_room_item_flag  ; orig: C - - - - - 0x01784C 05:B83C: 85 BF     STA ram_room_item_fl
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x01784E 05:B83E: A5 10     LDA ram_dungeon_leve
    BEQ     bra_B889             ; BEQ  ; orig: C - - - - - 0x017850 05:B840: F0 47     BEQ bra_B889    ; if

; if dungeon
    BSR     sub_bat_7314_check_map_bit4             ; JSR -> BSR  ; orig: C - - - - - 0x017852 05:B842: 20 14 73  JSR sub_bat_7314_che
    BNE     bra_B863             ; BNE  ; orig: C - - - - - 0x017855 05:B845: D0 1C     BNE bra_B863
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x017857 05:B847: A4 EB     LDY ram_map_location
    MOVE.B  ram_6A7E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017859 05:B849: B9 7E 6A  LDA ram_6A7E_map_dat
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x01785C 05:B84C: 29 1F     AND #$1F
    CMPI.B  #con_drop_id_03,D0  ; orig: C - - - - - 0x01785E 05:B84E: C9 03     CMP #con_drop_id_03
    BNE     bra_B854             ; BNE  ; orig: C - - - - - 0x017860 05:B850: D0 02     BNE bra_B854
    SUBQ.B  #1,ram_room_item_flag  ; orig: C - - - - - 0x017862 05:B852: C6 BF     DEC ram_room_item_fl
bra_B854:  ; orig: bra_B854:
    MOVE.B  D0,ram_drop_id_room  ; orig: C - - - - - 0x017864 05:B854: 85 AB     STA ram_drop_id_room
    MOVE.B  ram_6AFE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017866 05:B856: B9 FE 6A  LDA ram_6AFE_map_dat
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x017869 05:B859: 29 07     AND #$07
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01786B 05:B85B: C9 03     CMP #$03
    BEQ     bra_B863             ; BEQ  ; orig: C - - - - - 0x01786D 05:B85D: F0 04     BEQ bra_B863
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x01786F 05:B85F: C9 07     CMP #$07
    BNE     bra_B865             ; BNE  ; orig: C - - - - - 0x017871 05:B861: D0 02     BNE bra_B865
bra_B863:  ; orig: bra_B863:
    SUBQ.B  #1,ram_room_item_flag  ; orig: C - - - - - 0x017873 05:B863: C6 BF     DEC ram_room_item_fl
bra_B865:  ; orig: bra_B865:
    MOVE.B  ram_69FE_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017875 05:B865: B9 FE 69  LDA ram_69FE_map_dat
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x017878 05:B868: 29 40     AND #$40
    BEQ     bra_B86F             ; BEQ  ; orig: C - - - - - 0x01787A 05:B86A: F0 03     BEQ bra_B86F
    BSR     sub_A7F1             ; JSR -> BSR  ; orig: C - - - - - 0x01787C 05:B86C: 20 F1 A7  JSR sub_A7F1
bra_B86F:  ; orig: bra_B86F:
    BSR     sub_bat_718A             ; JSR -> BSR  ; orig: C - - - - - 0x01787F 05:B86F: 20 8A 71  JSR sub_bat_718A
bra_B872:  ; orig: bra_B872:
    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x017882 05:B872: 85 83     STA ram_0083
    MOVE.B  D2,ram_0097  ; orig: C - - - - - 0x017884 05:B874: 84 97     STY ram_0097
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x017886 05:B876: A4 EB     LDY ram_map_location
    MOVE.B  ram_6A7E_map_data(D2.L),D0  ; LDA abs,Y  ; orig: C - - - - - 0x017888 05:B878: B9 7E 6A  LDA ram_6A7E_map_dat
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x01788B 05:B87B: 29 1F     AND #$1F
    CMPI.B  #con_drop_id_1B,D0  ; orig: C - - - - - 0x01788D 05:B87D: C9 1B     CMP #con_drop_id_1B
    BNE     bra_B888_RTS             ; BNE  ; orig: C - - - - - 0x01788F 05:B87F: D0 07     BNE bra_B888_RTS
    MOVE.B  ram_0083,D0  ; orig: C - - - - - 0x017891 05:B881: A5 83     LDA ram_0083
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x017893 05:B883: 38        SEC
    SUBX.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x017894 05:B884: E9 08     SBC #$08
    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x017896 05:B886: 85 83     STA ram_0083
bra_B888_RTS:  ; orig: bra_B888_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x017898 05:B888: 60        RTS
bra_B889:  ; orig: bra_B889:
    MOVE.B  #con_drop_id_1A,D0  ; orig: C - - - - - 0x017899 05:B889: A9 1A     LDA #con_drop_id_1A
    MOVE.B  D0,ram_drop_id_room  ; orig: C - - - - - 0x01789B 05:B88B: 85 AB     STA ram_drop_id_room
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x01789D 05:B88D: A9 C0     LDA #$C0
    MOVE.B  #$90,D2  ; orig: C - - - - - 0x01789F 05:B88F: A0 90     LDY #$90
    MOVE.B  ram_script,D1  ; orig: C - - - - - 0x0178A1 05:B891: A6 12     LDX ram_script
    CMPI.B  #con_script_05_gameplay,D1  ; orig: C - - - - - 0x0178A3 05:B893: E0 05     CPX #con_script_05_g
    BNE     bra_B89D             ; BNE  ; orig: C - - - - - 0x0178A5 05:B895: D0 06     BNE bra_B89D
    MOVE.B  ram_map_location,D1  ; orig: C - - - - - 0x0178A7 05:B897: A6 EB     LDX ram_map_location
    CMPI.B  #con_map_location + $5F,D1  ; orig: C - - - - - 0x0178A9 05:B899: E0 5F     CPX #con_map_locatio
    BEQ     bra_B872             ; BEQ  ; orig: C - - - - - 0x0178AB 05:B89B: F0 D5     BEQ bra_B872
bra_B89D:  ; orig: bra_B89D:
    SUBQ.B  #1,ram_room_item_flag  ; orig: C - - - - - 0x0178AD 05:B89D: C6 BF     DEC ram_room_item_fl
    RTS                     ; RTS  ; orig: C - - - - - 0x0178AF 05:B89F: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0178B0 05:B8A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0178C0 05:B8B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0178D0 05:B8C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0178E0 05:B8D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0178F0 05:B8E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017900 05:B8F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017910 05:B900: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017920 05:B910: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017930 05:B920: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017940 05:B930: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017950 05:B940: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017960 05:B950: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017970 05:B960: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017980 05:B970: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017990 05:B980: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179A0 05:B990: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179B0 05:B9A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179C0 05:B9B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179D0 05:B9C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179E0 05:B9D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0179F0 05:B9E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A00 05:B9F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A10 05:BA00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A20 05:BA10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A30 05:BA20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A40 05:BA30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A50 05:BA40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A60 05:BA50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A70 05:BA60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A80 05:BA70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017A90 05:BA80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AA0 05:BA90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AB0 05:BAA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AC0 05:BAB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AD0 05:BAC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AE0 05:BAD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017AF0 05:BAE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B00 05:BAF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B10 05:BB00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B20 05:BB10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B30 05:BB20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B40 05:BB30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B50 05:BB40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B60 05:BB50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B70 05:BB60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B80 05:BB70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017B90 05:BB80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BA0 05:BB90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BB0 05:BBA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BC0 05:BBB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BD0 05:BBC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BE0 05:BBD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017BF0 05:BBE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C00 05:BBF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C10 05:BC00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C20 05:BC10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C30 05:BC20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C40 05:BC30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C50 05:BC40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C60 05:BC50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C70 05:BC60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C80 05:BC70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017C90 05:BC80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CA0 05:BC90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CB0 05:BCA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CC0 05:BCB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CD0 05:BCC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CE0 05:BCD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017CF0 05:BCE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D00 05:BCF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D10 05:BD00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D20 05:BD10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D30 05:BD20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D40 05:BD30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D50 05:BD40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D60 05:BD50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D70 05:BD60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D80 05:BD70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017D90 05:BD80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DA0 05:BD90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DB0 05:BDA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DC0 05:BDB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DD0 05:BDC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DE0 05:BDD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017DF0 05:BDE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E00 05:BDF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E10 05:BE00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E20 05:BE10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E30 05:BE20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E40 05:BE30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E50 05:BE40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E60 05:BE50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E70 05:BE60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E80 05:BE70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017E90 05:BE80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017EA0 05:BE90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017EB0 05:BEA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017EC0 05:BEB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017ED0 05:BEC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017EE0 05:BED0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017EF0 05:BEE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F00 05:BEF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F10 05:BF00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F20 05:BF10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F30 05:BF20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F40 05:BF30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x017F50 05:BF40: FF        .byte $FF, $FF, $FF,



    ; [DIRECTIVE] .SEGMENT "BANK_05i"  -- needs manual handling  ; orig: .segment "BANK_05i"
    ; [DIRECTIVE] .INCLUDE "copy_bank___BF50_BFF9.asm"  -- needs manual handling  ; orig: .include "copy_bank___BF50_BFF9.asm"



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank 05: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))  ; orig: .out .sprintf("Free bytes in bank 05: 0x%04X [%d]", ($BFFA -



    ; [DIRECTIVE] .SEGMENT "VECTORS_05"  -- needs manual handling  ; orig: .segment "VECTORS_05"
    ; [DIRECTIVE] .WORD vec_0x01E494_NMI  -- needs manual handling  ; orig: - - - - - - 0x01800A 05:BFFA: 84 E4     .word vec_0x01E494_N
    ; [DIRECTIVE] .WORD vec_inc_0x003F60_RESET  -- needs manual handling  ; orig: - - - - - - 0x01800C 05:BFFC: 50 BF     .word vec_inc_0x003F
    ; [DIRECTIVE] .WORD $BFF0  -- needs manual handling  ; orig: - - - - - - 0x01800E 05:BFFE: F0 BF     .word $BFF0 ; this g

; ── Translation Stats ──
; Translated:  3888
; Warnings:    1772
; Unknown:     1