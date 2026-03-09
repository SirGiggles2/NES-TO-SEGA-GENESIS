; ═══════════════════════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; ── VDP Layer included via vdp_layer.asm ──
; Run: include "vdp_layer.asm" in your main build

; Source: bank_04.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_04"  -- needs manual handling  ; orig: .segment "BANK_04"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $8000  -- needs manual handling  ; orig: .org $8000  ; for listing file

; 0x010010-0x01400F



    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_53  -- needs manual handling  ; orig: .export ofs_005_0x010025_53
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_55  -- needs manual handling  ; orig: .export ofs_005_0x010025_55
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_56  -- needs manual handling  ; orig: .export ofs_005_0x010025_56
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_57  -- needs manual handling  ; orig: .export ofs_005_0x010025_57
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_58  -- needs manual handling  ; orig: .export ofs_005_0x010025_58
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_59  -- needs manual handling  ; orig: .export ofs_005_0x010025_59
    ; [DIRECTIVE] .EXPORT ofs_005_0x010025_5A  -- needs manual handling  ; orig: .export ofs_005_0x010025_5A
    ; [DIRECTIVE] .EXPORT ofs_005_0x010029_54  -- needs manual handling  ; orig: .export ofs_005_0x010029_54
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_01  -- needs manual handling  ; orig: .export ofs_005_0x010035_01
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_02  -- needs manual handling  ; orig: .export ofs_005_0x010035_02
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_03  -- needs manual handling  ; orig: .export ofs_005_0x010035_03
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_04  -- needs manual handling  ; orig: .export ofs_005_0x010035_04
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_05  -- needs manual handling  ; orig: .export ofs_005_0x010035_05
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_06  -- needs manual handling  ; orig: .export ofs_005_0x010035_06
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_12  -- needs manual handling  ; orig: .export ofs_005_0x010035_12
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_13  -- needs manual handling  ; orig: .export ofs_005_0x010035_13
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_14  -- needs manual handling  ; orig: .export ofs_005_0x010035_14
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_16  -- needs manual handling  ; orig: .export ofs_005_0x010035_16
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_17  -- needs manual handling  ; orig: .export ofs_005_0x010035_17
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_2A  -- needs manual handling  ; orig: .export ofs_005_0x010035_2A
    ; [DIRECTIVE] .EXPORT ofs_005_0x010035_30  -- needs manual handling  ; orig: .export ofs_005_0x010035_30
    ; [DIRECTIVE] .EXPORT ofs_004_0x01005F_40  -- needs manual handling  ; orig: .export ofs_004_0x01005F_40
    ; [DIRECTIVE] .EXPORT ofs_004_0x010129_05  -- needs manual handling  ; orig: .export ofs_004_0x010129_05
    ; [DIRECTIVE] .EXPORT ofs_004_0x010129_06  -- needs manual handling  ; orig: .export ofs_004_0x010129_06
    ; [DIRECTIVE] .EXPORT ofs_004_0x010207_68  -- needs manual handling  ; orig: .export ofs_004_0x010207_68
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_53  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_53
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_54  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_54
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_57  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_57
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_58  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_58
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_59  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_59
    ; [DIRECTIVE] .EXPORT ofs_004_0x0102E7_5A  -- needs manual handling  ; orig: .export ofs_004_0x0102E7_5A
    ; [DIRECTIVE] .EXPORT sub_0x010356  -- needs manual handling  ; orig: .export sub_0x010356
    ; [DIRECTIVE] .EXPORT loc_0x010356  -- needs manual handling  ; orig: .export loc_0x010356
    ; [DIRECTIVE] .EXPORT ofs_004_0x0103A9_55  -- needs manual handling  ; orig: .export ofs_004_0x0103A9_55
    ; [DIRECTIVE] .EXPORT ofs_004_0x0103A9_56  -- needs manual handling  ; orig: .export ofs_004_0x0103A9_56
    ; [DIRECTIVE] .EXPORT ofs_005_0x010425_2B  -- needs manual handling  ; orig: .export ofs_005_0x010425_2B
    ; [DIRECTIVE] .EXPORT ofs_005_0x010425_2C  -- needs manual handling  ; orig: .export ofs_005_0x010425_2C
    ; [DIRECTIVE] .EXPORT ofs_005_0x010425_2D  -- needs manual handling  ; orig: .export ofs_005_0x010425_2D
    ; [DIRECTIVE] .EXPORT ofs_005_0x01042D_1B  -- needs manual handling  ; orig: .export ofs_005_0x01042D_1B
    ; [DIRECTIVE] .EXPORT ofs_005_0x010445_1C  -- needs manual handling  ; orig: .export ofs_005_0x010445_1C
    ; [DIRECTIVE] .EXPORT ofs_005_0x010445_1D  -- needs manual handling  ; orig: .export ofs_005_0x010445_1D
    ; [DIRECTIVE] .EXPORT ofs_004_0x01044E_2B  -- needs manual handling  ; orig: .export ofs_004_0x01044E_2B
    ; [DIRECTIVE] .EXPORT ofs_004_0x01044E_2C  -- needs manual handling  ; orig: .export ofs_004_0x01044E_2C
    ; [DIRECTIVE] .EXPORT ofs_004_0x01044E_2D  -- needs manual handling  ; orig: .export ofs_004_0x01044E_2D
    ; [DIRECTIVE] .EXPORT ofs_004_0x010491_1B  -- needs manual handling  ; orig: .export ofs_004_0x010491_1B
    ; [DIRECTIVE] .EXPORT ofs_004_0x010491_1C  -- needs manual handling  ; orig: .export ofs_004_0x010491_1C
    ; [DIRECTIVE] .EXPORT ofs_004_0x010491_1D  -- needs manual handling  ; orig: .export ofs_004_0x010491_1D
    ; [DIRECTIVE] .EXPORT ofs_004_0x0104DB_13  -- needs manual handling  ; orig: .export ofs_004_0x0104DB_13
    ; [DIRECTIVE] .EXPORT ofs_005_0x010571_15  -- needs manual handling  ; orig: .export ofs_005_0x010571_15
    ; [DIRECTIVE] .EXPORT ofs_004_0x010578_14  -- needs manual handling  ; orig: .export ofs_004_0x010578_14
    ; [DIRECTIVE] .EXPORT ofs_004_0x010578_15  -- needs manual handling  ; orig: .export ofs_004_0x010578_15
    ; [DIRECTIVE] .EXPORT sub_0x010660  -- needs manual handling  ; orig: .export sub_0x010660
    ; [DIRECTIVE] .EXPORT sub_0x0106F0_try_spawning_zora_in_water  -- needs manual handling  ; orig: .export sub_0x0106F0_try_spawning_zora_in_water
    ; [DIRECTIVE] .EXPORT ofs_005_0x010747_1F  -- needs manual handling  ; orig: .export ofs_005_0x010747_1F
    ; [DIRECTIVE] .EXPORT ofs_005_0x01074C_20  -- needs manual handling  ; orig: .export ofs_005_0x01074C_20
    ; [DIRECTIVE] .EXPORT ofs_005_0x01074F_0D  -- needs manual handling  ; orig: .export ofs_005_0x01074F_0D
    ; [DIRECTIVE] .EXPORT ofs_005_0x01074F_0E  -- needs manual handling  ; orig: .export ofs_005_0x01074F_0E
    ; [DIRECTIVE] .EXPORT ofs_005_0x01075E_0F  -- needs manual handling  ; orig: .export ofs_005_0x01075E_0F
    ; [DIRECTIVE] .EXPORT ofs_005_0x01075E_10  -- needs manual handling  ; orig: .export ofs_005_0x01075E_10
    ; [DIRECTIVE] .EXPORT ofs_005_0x010765_07  -- needs manual handling  ; orig: .export ofs_005_0x010765_07
    ; [DIRECTIVE] .EXPORT ofs_005_0x010765_09  -- needs manual handling  ; orig: .export ofs_005_0x010765_09
    ; [DIRECTIVE] .EXPORT ofs_005_0x010765_21  -- needs manual handling  ; orig: .export ofs_005_0x010765_21
    ; [DIRECTIVE] .EXPORT ofs_005_0x010769_08  -- needs manual handling  ; orig: .export ofs_005_0x010769_08
    ; [DIRECTIVE] .EXPORT ofs_005_0x010769_0A  -- needs manual handling  ; orig: .export ofs_005_0x010769_0A
    ; [DIRECTIVE] .EXPORT ofs_005_0x010785_1A  -- needs manual handling  ; orig: .export ofs_005_0x010785_1A
    ; [DIRECTIVE] .EXPORT ofs_005_0x01079A_2F  -- needs manual handling  ; orig: .export ofs_005_0x01079A_2F
    ; [DIRECTIVE] .EXPORT ofs_004_0x0107A8_11  -- needs manual handling  ; orig: .export ofs_004_0x0107A8_11
    ; [DIRECTIVE] .EXPORT ofs_004_0x0107CF_03  -- needs manual handling  ; orig: .export ofs_004_0x0107CF_03
    ; [DIRECTIVE] .EXPORT ofs_004_0x0107CF_04  -- needs manual handling  ; orig: .export ofs_004_0x0107CF_04
    ; [DIRECTIVE] .EXPORT ofs_004_0x0107DC_01  -- needs manual handling  ; orig: .export ofs_004_0x0107DC_01
    ; [DIRECTIVE] .EXPORT ofs_004_0x0107DC_02  -- needs manual handling  ; orig: .export ofs_004_0x0107DC_02
    ; [DIRECTIVE] .EXPORT ofs_004_0x01084F_5B  -- needs manual handling  ; orig: .export ofs_004_0x01084F_5B
    ; [DIRECTIVE] .EXPORT ofs_004_0x010896_1F  -- needs manual handling  ; orig: .export ofs_004_0x010896_1F
    ; [DIRECTIVE] .EXPORT ofs_004_0x010908_0D  -- needs manual handling  ; orig: .export ofs_004_0x010908_0D
    ; [DIRECTIVE] .EXPORT ofs_004_0x010908_0E  -- needs manual handling  ; orig: .export ofs_004_0x010908_0E
    ; [DIRECTIVE] .EXPORT ofs_004_0x010908_20  -- needs manual handling  ; orig: .export ofs_004_0x010908_20
    ; [DIRECTIVE] .EXPORT ofs_004_0x010A75_0F  -- needs manual handling  ; orig: .export ofs_004_0x010A75_0F
    ; [DIRECTIVE] .EXPORT ofs_004_0x010B19_10  -- needs manual handling  ; orig: .export ofs_004_0x010B19_10
    ; [DIRECTIVE] .EXPORT ofs_004_0x010C0F_07  -- needs manual handling  ; orig: .export ofs_004_0x010C0F_07
    ; [DIRECTIVE] .EXPORT ofs_004_0x010C0F_08  -- needs manual handling  ; orig: .export ofs_004_0x010C0F_08
    ; [DIRECTIVE] .EXPORT ofs_004_0x010C0F_09  -- needs manual handling  ; orig: .export ofs_004_0x010C0F_09
    ; [DIRECTIVE] .EXPORT ofs_004_0x010C0F_0A  -- needs manual handling  ; orig: .export ofs_004_0x010C0F_0A
    ; [DIRECTIVE] .EXPORT ofs_004_0x010C7B_21  -- needs manual handling  ; orig: .export ofs_004_0x010C7B_21
    ; [DIRECTIVE] .EXPORT ofs_005_0x010CD0_1E  -- needs manual handling  ; orig: .export ofs_005_0x010CD0_1E
    ; [DIRECTIVE] .EXPORT ofs_005_0x010CD0_22  -- needs manual handling  ; orig: .export ofs_005_0x010CD0_22
    ; [DIRECTIVE] .EXPORT ofs_004_0x010D60_1E  -- needs manual handling  ; orig: .export ofs_004_0x010D60_1E
    ; [DIRECTIVE] .EXPORT ofs_004_0x010DA0_2F  -- needs manual handling  ; orig: .export ofs_004_0x010DA0_2F
    ; [DIRECTIVE] .EXPORT ofs_004_0x010E54_62  -- needs manual handling  ; orig: .export ofs_004_0x010E54_62
    ; [DIRECTIVE] .EXPORT ofs_004_0x010E54_65  -- needs manual handling  ; orig: .export ofs_004_0x010E54_65
    ; [DIRECTIVE] .EXPORT ofs_004_0x010E54_66  -- needs manual handling  ; orig: .export ofs_004_0x010E54_66
    ; [DIRECTIVE] .EXPORT ofs_004_0x010EFB_63_breakable_wall  -- needs manual handling  ; orig: .export ofs_004_0x010EFB_63_breakable_wall
    ; [DIRECTIVE] .EXPORT ofs_004_0x010EFB_67  -- needs manual handling  ; orig: .export ofs_004_0x010EFB_67
    ; [DIRECTIVE] .EXPORT ofs_004_0x010F1E_64  -- needs manual handling  ; orig: .export ofs_004_0x010F1E_64
    ; [DIRECTIVE] .EXPORT loc_0x010F42  -- needs manual handling  ; orig: .export loc_0x010F42
    ; [DIRECTIVE] .EXPORT ofs_004_0x010F86_61  -- needs manual handling  ; orig: .export ofs_004_0x010F86_61
    ; [DIRECTIVE] .EXPORT ofs_004_0x010FFF_22  -- needs manual handling  ; orig: .export ofs_004_0x010FFF_22
    ; [DIRECTIVE] .EXPORT ofs_004_0x011038_1A  -- needs manual handling  ; orig: .export ofs_004_0x011038_1A
    ; [DIRECTIVE] .EXPORT ofs_004_0x0110F4_27  -- needs manual handling  ; orig: .export ofs_004_0x0110F4_27
    ; [DIRECTIVE] .EXPORT ofs_005_0x0112D2_28  -- needs manual handling  ; orig: .export ofs_005_0x0112D2_28
    ; [DIRECTIVE] .EXPORT ofs_004_0x0112E6_28  -- needs manual handling  ; orig: .export ofs_004_0x0112E6_28
    ; [DIRECTIVE] .EXPORT ofs_004_0x011387_2A  -- needs manual handling  ; orig: .export ofs_004_0x011387_2A
    ; [DIRECTIVE] .EXPORT ofs_005_0x0113F2_41  -- needs manual handling  ; orig: .export ofs_005_0x0113F2_41
    ; [DIRECTIVE] .EXPORT ofs_005_0x011457_3D  -- needs manual handling  ; orig: .export ofs_005_0x011457_3D
    ; [DIRECTIVE] .EXPORT ofs_005_0x01146A_38  -- needs manual handling  ; orig: .export ofs_005_0x01146A_38
    ; [DIRECTIVE] .EXPORT ofs_005_0x011489_39  -- needs manual handling  ; orig: .export ofs_005_0x011489_39
    ; [DIRECTIVE] .EXPORT ofs_005_0x011497_31  -- needs manual handling  ; orig: .export ofs_005_0x011497_31
    ; [DIRECTIVE] .EXPORT ofs_005_0x011497_32  -- needs manual handling  ; orig: .export ofs_005_0x011497_32
    ; [DIRECTIVE] .EXPORT ofs_004_0x0114A8_41  -- needs manual handling  ; orig: .export ofs_004_0x0114A8_41
    ; [DIRECTIVE] .EXPORT ofs_004_0x011600_18  -- needs manual handling  ; orig: .export ofs_004_0x011600_18
    ; [DIRECTIVE] .EXPORT ofs_004_0x011600_38  -- needs manual handling  ; orig: .export ofs_004_0x011600_38
    ; [DIRECTIVE] .EXPORT ofs_004_0x011600_39  -- needs manual handling  ; orig: .export ofs_004_0x011600_39
    ; [DIRECTIVE] .EXPORT ofs_004_0x011796_3D  -- needs manual handling  ; orig: .export ofs_004_0x011796_3D
    ; [DIRECTIVE] .EXPORT ofs_004_0x0118B9_31  -- needs manual handling  ; orig: .export ofs_004_0x0118B9_31
    ; [DIRECTIVE] .EXPORT ofs_004_0x0118B9_32  -- needs manual handling  ; orig: .export ofs_004_0x0118B9_32
    ; [DIRECTIVE] .EXPORT ofs_005_0x011B30_0B  -- needs manual handling  ; orig: .export ofs_005_0x011B30_0B
    ; [DIRECTIVE] .EXPORT ofs_005_0x011B30_0C  -- needs manual handling  ; orig: .export ofs_005_0x011B30_0C
    ; [DIRECTIVE] .EXPORT ofs_004_0x011B46_30  -- needs manual handling  ; orig: .export ofs_004_0x011B46_30
    ; [DIRECTIVE] .EXPORT ofs_004_0x011B5B_0B  -- needs manual handling  ; orig: .export ofs_004_0x011B5B_0B
    ; [DIRECTIVE] .EXPORT ofs_004_0x011B5B_0C  -- needs manual handling  ; orig: .export ofs_004_0x011B5B_0C
    ; [DIRECTIVE] .EXPORT ofs_004_0x011BB2_16  -- needs manual handling  ; orig: .export ofs_004_0x011BB2_16
    ; [DIRECTIVE] .EXPORT ofs_004_0x011CD9_17  -- needs manual handling  ; orig: .export ofs_004_0x011CD9_17
    ; [DIRECTIVE] .EXPORT ofs_004_0x011D67_12  -- needs manual handling  ; orig: .export ofs_004_0x011D67_12
    ; [DIRECTIVE] .EXPORT ofs_004_0x011DF3_23  -- needs manual handling  ; orig: .export ofs_004_0x011DF3_23
    ; [DIRECTIVE] .EXPORT ofs_004_0x011FB9_24  -- needs manual handling  ; orig: .export ofs_004_0x011FB9_24
    ; [DIRECTIVE] .EXPORT ofs_005_0x01209D_42  -- needs manual handling  ; orig: .export ofs_005_0x01209D_42
    ; [DIRECTIVE] .EXPORT ofs_005_0x01209D_43  -- needs manual handling  ; orig: .export ofs_005_0x01209D_43
    ; [DIRECTIVE] .EXPORT ofs_005_0x01209D_44  -- needs manual handling  ; orig: .export ofs_005_0x01209D_44
    ; [DIRECTIVE] .EXPORT ofs_005_0x01209D_45  -- needs manual handling  ; orig: .export ofs_005_0x01209D_45
    ; [DIRECTIVE] .EXPORT ofs_005_0x01211C_3C  -- needs manual handling  ; orig: .export ofs_005_0x01211C_3C
    ; [DIRECTIVE] .EXPORT ofs_005_0x012171_33  -- needs manual handling  ; orig: .export ofs_005_0x012171_33
    ; [DIRECTIVE] .EXPORT ofs_005_0x012171_34  -- needs manual handling  ; orig: .export ofs_005_0x012171_34
    ; [DIRECTIVE] .EXPORT ofs_005_0x012189_46  -- needs manual handling  ; orig: .export ofs_005_0x012189_46
    ; [DIRECTIVE] .EXPORT ofs_004_0x012197_3C  -- needs manual handling  ; orig: .export ofs_004_0x012197_3C
    ; [DIRECTIVE] .EXPORT ofs_004_0x012326_33  -- needs manual handling  ; orig: .export ofs_004_0x012326_33
    ; [DIRECTIVE] .EXPORT ofs_004_0x012326_34  -- needs manual handling  ; orig: .export ofs_004_0x012326_34
    ; [DIRECTIVE] .EXPORT loc_0x012450  -- needs manual handling  ; orig: .export loc_0x012450
    ; [DIRECTIVE] .EXPORT ofs_004_0x012487_46  -- needs manual handling  ; orig: .export ofs_004_0x012487_46
    ; [DIRECTIVE] .EXPORT ofs_004_0x0124EE_42  -- needs manual handling  ; orig: .export ofs_004_0x0124EE_42
    ; [DIRECTIVE] .EXPORT ofs_004_0x0124EE_43  -- needs manual handling  ; orig: .export ofs_004_0x0124EE_43
    ; [DIRECTIVE] .EXPORT ofs_004_0x0124EE_44  -- needs manual handling  ; orig: .export ofs_004_0x0124EE_44
    ; [DIRECTIVE] .EXPORT ofs_004_0x0124EE_45  -- needs manual handling  ; orig: .export ofs_004_0x0124EE_45
    ; [DIRECTIVE] .EXPORT ofs_005_0x0128DA_37  -- needs manual handling  ; orig: .export ofs_005_0x0128DA_37
    ; [DIRECTIVE] .EXPORT ofs_005_0x0128F4_3A  -- needs manual handling  ; orig: .export ofs_005_0x0128F4_3A
    ; [DIRECTIVE] .EXPORT ofs_005_0x0128F4_3B  -- needs manual handling  ; orig: .export ofs_005_0x0128F4_3B
    ; [DIRECTIVE] .EXPORT ofs_005_0x01293E_47  -- needs manual handling  ; orig: .export ofs_005_0x01293E_47
    ; [DIRECTIVE] .EXPORT ofs_005_0x01293E_48  -- needs manual handling  ; orig: .export ofs_005_0x01293E_48
    ; [DIRECTIVE] .EXPORT ofs_005_0x01297F_3E  -- needs manual handling  ; orig: .export ofs_005_0x01297F_3E
    ; [DIRECTIVE] .EXPORT ofs_004_0x012997_37  -- needs manual handling  ; orig: .export ofs_004_0x012997_37
    ; [DIRECTIVE] .EXPORT ofs_004_0x0129E8_3F  -- needs manual handling  ; orig: .export ofs_004_0x0129E8_3F
    ; [DIRECTIVE] .EXPORT ofs_004_0x0129FB_3A  -- needs manual handling  ; orig: .export ofs_004_0x0129FB_3A
    ; [DIRECTIVE] .EXPORT ofs_004_0x0129FB_3B  -- needs manual handling  ; orig: .export ofs_004_0x0129FB_3B
    ; [DIRECTIVE] .EXPORT ofs_004_0x012B76_47  -- needs manual handling  ; orig: .export ofs_004_0x012B76_47
    ; [DIRECTIVE] .EXPORT ofs_004_0x012B76_48  -- needs manual handling  ; orig: .export ofs_004_0x012B76_48
    ; [DIRECTIVE] .EXPORT ofs_004_0x012BEA_25  -- needs manual handling  ; orig: .export ofs_004_0x012BEA_25
    ; [DIRECTIVE] .EXPORT ofs_004_0x012BEA_26  -- needs manual handling  ; orig: .export ofs_004_0x012BEA_26
    ; [DIRECTIVE] .EXPORT ofs_004_0x012C8D_3E  -- needs manual handling  ; orig: .export ofs_004_0x012C8D_3E
    ; [DIRECTIVE] .EXPORT sub_0x013010  -- needs manual handling  ; orig: .export sub_0x013010
    ; [DIRECTIVE] .EXPORT sub_0x01307A_drop_selection  -- needs manual handling  ; orig: .export sub_0x01307A_drop_selection
    ; [DIRECTIVE] .EXPORT ofs_004_0x01310C_60  -- needs manual handling  ; orig: .export ofs_004_0x01310C_60
    ; [DIRECTIVE] .EXPORT sub_0x0131CE  -- needs manual handling  ; orig: .export sub_0x0131CE
    ; [DIRECTIVE] .EXPORT loc_0x0131CE  -- needs manual handling  ; orig: .export loc_0x0131CE



sub_8000:  ; orig: sub_8000:
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x010013 04:8003: C9 10     CMP #$10
    BNE     b04_bra_800C_RTS             ; BNE  ; orig: C - - - - - 0x010015 04:8005: D0 05     BNE b04_bra_800C_RTS
    MOVE.B  #con_sfx_1_02,D0  ; orig: C - - - - - 0x010017 04:8007: A9 02     LDA #con_sfx_1_02
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x010019 04:8009: 8D 01 06  STA ram_sfx_1
b04_bra_800C_RTS:  ; orig: b04_bra_800C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01001C 04:800C: 60        RTS



sub_800D:  ; orig: sub_800D:
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_800C_RTS             ; BEQ  ; orig: C - - - - - 0x010020 04:8010: F0 FA     BEQ b04_bra_800C_RTS
    JMP     loc_B010  ; orig: C - - - - - 0x010022 04:8012: 4C 10 B0  JMP loc_B010



ofs_005_0x010025_53:  ; orig: ofs_005_0x010025_53:

; con_obj_id_53
ofs_005_0x010025_55:  ; orig: ofs_005_0x010025_55:

; con_obj_id_55
ofs_005_0x010025_56:  ; orig: ofs_005_0x010025_56:

; con_obj_id_56
ofs_005_0x010025_57:  ; orig: ofs_005_0x010025_57:

; con_obj_id_57
ofs_005_0x010025_58:  ; orig: ofs_005_0x010025_58:

; con_obj_id_58
ofs_005_0x010025_59:  ; orig: ofs_005_0x010025_59:

; con_obj_id_59
ofs_005_0x010025_5A:  ; orig: ofs_005_0x010025_5A:

; con_obj_id_5A
    MOVE.B  #$C0,D0  ; orig: C - - J - - 0x010025 04:8015: A9 C0     LDA #$C0
    BNE     b04_bra_801B             ; BNE  ; orig: C - - - - - 0x010027 04:8017: D0 02     BNE b04_bra_801B    ; jm



ofs_005_0x010029_54:  ; orig: ofs_005_0x010029_54:

; con_obj_id_54
    MOVE.B  #$E0,D0  ; orig: - - - - - - 0x010029 04:8019: A9 E0     LDA #$E0
b04_bra_801B:  ; orig: b04_bra_801B:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_0x01FEEA  ; orig: C - - - - - 0x01002E 04:801E: 4C DA FE  JMP loc_0x01FEEA



; bzk garbage
    MOVE.B  #$80,D0  ; orig: - - - - - - 0x010031 04:8021: A9 80     LDA #$80
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)




loc_8025:  ; orig: loc_8025:
ofs_005_0x010035_01:  ; orig: ofs_005_0x010035_01:

; con_obj_id_01
ofs_005_0x010035_02:  ; orig: ofs_005_0x010035_02:

; con_obj_id_02
ofs_005_0x010035_03:  ; orig: ofs_005_0x010035_03:

; con_obj_id_03
ofs_005_0x010035_04:  ; orig: ofs_005_0x010035_04:

; con_obj_id_04
ofs_005_0x010035_05:  ; orig: ofs_005_0x010035_05:

; con_obj_id_05
ofs_005_0x010035_06:  ; orig: ofs_005_0x010035_06:

; con_obj_id_06
ofs_005_0x010035_12:  ; orig: ofs_005_0x010035_12:

; con_obj_id_12
ofs_005_0x010035_13:  ; orig: ofs_005_0x010035_13:

; con_obj_id_13
ofs_005_0x010035_14:  ; orig: ofs_005_0x010035_14:

; con_obj_id_14
ofs_005_0x010035_16:  ; orig: ofs_005_0x010035_16:

; con_obj_id_16
ofs_005_0x010035_17:  ; orig: ofs_005_0x010035_17:

; con_obj_id_17
ofs_005_0x010035_2A:  ; orig: ofs_005_0x010035_2A:

; con_obj_id_2A
ofs_005_0x010035_30:  ; orig: ofs_005_0x010035_30:

; con_obj_id_30

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_804E_RTS             ; BNE  ; orig: C - - - - - 0x010037 04:8027: D0 25     BNE b04_bra_804E_RTS
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x010039 04:8029: A0 02     LDY #$02
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x01003B 04:802B: A5 61     LDA ram_0061
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01003D 04:802D: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01003E 04:802E: F5 70     SBC ram_pos_X_enemy,
    BCS     b04_bra_8033             ; BCS  ; orig: C - - - - - 0x010040 04:8030: B0 01     BCS b04_bra_8033
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010042 04:8032: 88        DEY ; 01
b04_bra_8033:  ; orig: b04_bra_8033:
    MOVE.B  D0,ram_0000_t38  ; orig: C - - - - - 0x010043 04:8033: 85 00     STA ram_0000_t38
    MOVE.B  D2,ram_0001_t09  ; orig: C - - - - - 0x010045 04:8035: 84 01     STY ram_0001_t09
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010047 04:8037: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    MOVE.B  #con_dir_Down,D2  ; orig: C - - - - - 0x010049 04:8039: A0 04     LDY #con_dir_Down
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x01004B 04:803B: A5 62     LDA ram_0062
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01004D 04:803D: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01004E 04:803E: F5 84     SBC ram_pos_Y_enemy,
    BCS     b04_bra_8044             ; BCS  ; orig: C - - - - - 0x010050 04:8040: B0 02     BCS b04_bra_8044
    MOVE.B  #con_dir_Up,D2  ; orig: C - - - - - 0x010052 04:8042: A0 08     LDY #con_dir_Up
b04_bra_8044:  ; orig: b04_bra_8044:
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010054 04:8044: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    CMP.B   ram_0000_t38,D0  ; orig: C - - - - - 0x010056 04:8046: C5 00     CMP ram_0000_t38
    BCC     b04_bra_804E_RTS             ; BCC  ; orig: C - - - - - 0x010058 04:8048: 90 04     BCC b04_bra_804E_RTS
    MOVE.B  ram_0001_t09,D0  ; orig: C - - - - - 0x01005A 04:804A: A5 01     LDA ram_0001_t09
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_804E_RTS:  ; orig: b04_bra_804E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01005E 04:804E: 60        RTS



ofs_004_0x01005F_40:  ; orig: ofs_004_0x01005F_40:

; con_obj_id_40

; in

; X = 01+
    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - J - - 0x01005F 04:804F: 20 A7 7A  JSR sub_bat_7AA7
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x010062 04:8052: A9 02     LDA #$02
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x010064 04:8054: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x010067 04:8057: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01FA5F             ; JSR -> BSR  ; orig: C - - - - - 0x01006B 04:805B: 20 4F FA  JSR sub_0x01FA5F
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01006E 04:805E: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_40,D0  ; orig: C - - - - - 0x010071 04:8061: C9 40     CMP #con_obj_id_40
    BEQ     b04_bra_8069             ; BEQ  ; orig: C - - - - - 0x010073 04:8063: F0 04     BEQ b04_bra_8069
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x010075 04:8065: A9 00     LDA #$00
    MOVE.B  D0,ram_000F_t04_flag  ; orig: - - - - - - 0x010077 04:8067: 85 0F     STA ram_000F_t04_fla
b04_bra_8069:  ; orig: b04_bra_8069:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010079 04:8069: A9 00     LDA #$00
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x01007B 04:806B: 4C DF 77  JMP loc_bat_77DF



sub_806E:  ; orig: sub_806E:
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8078             ; BEQ  ; orig: C - - - - - 0x010083 04:8073: F0 03     BEQ b04_bra_8078
    JMP     loc_0x01EEC8  ; orig: C - - - - - 0x010085 04:8075: 4C B8 EE  JMP loc_0x01EEC8
b04_bra_8078:  ; orig: b04_bra_8078:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x010088 04:8078: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x01008B 04:807B: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_80A3_RTS             ; BNE  ; orig: C - - - - - 0x01008D 04:807D: D0 24     BNE b04_bra_80A3_RTS

; bzk optimize, after deleting 0x010092 this JMP will be useless
    JMP     loc_8094  ; orig: C - - - - - 0x01008F 04:807F: 4C 94 80  JMP loc_8094



; bzk garbage
    MOVE.B  #$70,D0  ; orig: - - - - - - 0x010092 04:8082: A9 70     LDA #$70
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: - - - - - - 0x010094 04:8084: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_05,D2  ; orig: - - - - - - 0x010097 04:8087: C0 05     CPY #con_obj_id_05
    BEQ     b04_bra_808D             ; BEQ  ; orig: - - - - - - 0x010099 04:8089: F0 02     BEQ b04_bra_808D
    MOVE.B  #$A0,D0  ; orig: - - - - - - 0x01009B 04:808B: A9 A0     LDA #$A0
b04_bra_808D:  ; orig: b04_bra_808D:
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BMI     b04_bra_80A3_RTS             ; BMI  ; orig: - - - - - - 0x0100A2 04:8092: 30 0F     BMI b04_bra_80A3_RTS



loc_8094:  ; orig: loc_8094:
sub_8094:  ; orig: sub_8094:
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_809C             ; BEQ  ; orig: C - - - - - 0x0100A7 04:8097: F0 03     BEQ b04_bra_809C
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0100A9 04:8099: DE 78 04  DEC ram_0478_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_809C:  ; orig: b04_bra_809C:
    BSR     sub_0x01EFE0             ; JSR -> BSR  ; orig: C - - - - - 0x0100AC 04:809C: 20 D0 EF  JSR sub_0x01EFE0
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_80A4             ; BEQ  ; orig: C - - - - - 0x0100B1 04:80A1: F0 01     BEQ b04_bra_80A4
b04_bra_80A3_RTS:  ; orig: b04_bra_80A3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0100B3 04:80A3: 60        RTS
b04_bra_80A4:  ; orig: b04_bra_80A4:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8116             ; BEQ  ; orig: C - - - - - 0x0100B7 04:80A7: F0 6D     BEQ b04_bra_8116
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0100BC 04:80AC: 29 0F     AND #$0F
    BNE     b04_bra_8116             ; BNE  ; orig: C - - - - - 0x0100BE 04:80AE: D0 66     BNE b04_bra_8116

; A = 00
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ; !! CMP ram_indiv_random + $01,X - needs manual review  ; orig: C - - - - - 0x0100C6 04:80B6: D5 19     CMP ram_indiv_random
    BCC     b04_bra_8104             ; BCC  ; orig: C - - - - - 0x0100C8 04:80B8: 90 4A     BCC b04_bra_8104
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x0100CA 04:80BA: A5 AC     LDA ram_state_link
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x0100CC 04:80BC: C9 FF     CMP #$FF    ; con_ob
    BEQ     b04_bra_8104             ; BEQ  ; orig: C - - - - - 0x0100CE 04:80BE: F0 44     BEQ b04_bra_8104
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x0100D0 04:80C0: A5 61     LDA ram_0061
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0100D2 04:80C2: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x0100D3 04:80C3: F5 70     SBC ram_pos_X_enemy,
    BPL     b04_bra_80CC             ; BPL  ; orig: C - - - - - 0x0100D5 04:80C5: 10 05     BPL b04_bra_80CC
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x0100D7 04:80C7: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0100D9 04:80C9: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0100DA 04:80CA: 69 01     ADC #$01
b04_bra_80CC:  ; orig: b04_bra_80CC:
    CMPI.B  #$09,D0  ; orig: C - - - - - 0x0100DC 04:80CC: C9 09     CMP #$09
    BCS     b04_bra_80DC             ; BCS  ; orig: C - - - - - 0x0100DE 04:80CE: B0 0C     BCS b04_bra_80DC
b04_bra_80D0_loop:  ; orig: b04_bra_80D0_loop:
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x0100E0 04:80D0: A0 08     LDY #$08
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x0100E2 04:80D2: A5 62     LDA ram_0062
    MOVEA.L #ram_pos_Y_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCC     b04_bra_80F5             ; BCC  ; orig: C - - - - - 0x0100E6 04:80D6: 90 1D     BCC b04_bra_80F5
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x0100E8 04:80D8: A0 04     LDY #$04
    BNE     b04_bra_80F5             ; BNE  ; orig: C - - - - - 0x0100EA 04:80DA: D0 19     BNE b04_bra_80F5    ; jm
b04_bra_80DC:  ; orig: b04_bra_80DC:
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x0100EC 04:80DC: A5 62     LDA ram_0062
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0100EE 04:80DE: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x0100EF 04:80DF: F5 84     SBC ram_pos_Y_enemy,
    BPL     b04_bra_80E8             ; BPL  ; orig: C - - - - - 0x0100F1 04:80E1: 10 05     BPL b04_bra_80E8
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x0100F3 04:80E3: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0100F5 04:80E5: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0100F6 04:80E6: 69 01     ADC #$01
b04_bra_80E8:  ; orig: b04_bra_80E8:
    CMPI.B  #$09,D0  ; orig: C - - - - - 0x0100F8 04:80E8: C9 09     CMP #$09
    BCS     b04_bra_8104             ; BCS  ; orig: C - - - - - 0x0100FA 04:80EA: B0 18     BCS b04_bra_8104
b04_bra_80EC:  ; orig: b04_bra_80EC:
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x0100FC 04:80EC: A0 01     LDY #$01
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x0100FE 04:80EE: A5 61     LDA ram_0061
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCS     b04_bra_80F5             ; BCS  ; orig: C - - - - - 0x010102 04:80F2: B0 01     BCS b04_bra_80F5
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010104 04:80F4: C8        INY
b04_bra_80F5:  ; orig: b04_bra_80F5:
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010105 04:80F5: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01010C 04:80FC: A9 01     LDA #$01
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_8190  ; orig: C - - - - - 0x010111 04:8101: 4C 90 81  JMP loc_8190
b04_bra_8104:  ; orig: b04_bra_8104:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010114 04:8104: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8116             ; BNE  ; orig: C - - - - - 0x01011C 04:810C: D0 08     BNE b04_bra_8116
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x010120 04:8110: 29 0C     AND #con_dir__UD
    BNE     b04_bra_80EC             ; BNE  ; orig: C - - - - - 0x010122 04:8112: D0 D8     BNE b04_bra_80EC
    BEQ     b04_bra_80D0_loop             ; BEQ  ; orig: C - - - - - 0x010124 04:8114: F0 BA     BEQ b04_bra_80D0_loop   
b04_bra_8116:  ; orig: b04_bra_8116:
    JMP     loc_8190  ; orig: C - - - - - 0x010126 04:8116: 4C 90 81  JMP loc_8190



sub_8119:  ; orig: sub_8119:
ofs_004_0x010129_05:  ; orig: ofs_004_0x010129_05:

; con_obj_id_05
ofs_004_0x010129_06:  ; orig: ofs_004_0x010129_06:

; con_obj_id_06

; in

; X = 01+
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #con_obj_id_1E,D0  ; orig: C - - - - - 0x01012C 04:811C: C9 1E     CMP #con_obj_id_1E
    BEQ     b04_bra_8124             ; BEQ  ; orig: C - - - - - 0x01012E 04:811E: F0 04     BEQ b04_bra_8124
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BMI     b04_bra_812B_RTS             ; BMI  ; orig: C - - - - - 0x010132 04:8122: 30 07     BMI b04_bra_812B_RTS
b04_bra_8124:  ; orig: b04_bra_8124:
    BSR     sub_0x01EFE0             ; JSR -> BSR  ; orig: C - - - - - 0x010134 04:8124: 20 D0 EF  JSR sub_0x01EFE0
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_812C             ; BEQ  ; orig: C - - - - - 0x010139 04:8129: F0 01     BEQ b04_bra_812C
b04_bra_812B_RTS:  ; orig: b04_bra_812B_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01013B 04:812B: 60        RTS
b04_bra_812C:  ; orig: b04_bra_812C:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8190             ; BEQ  ; orig: C - - - - - 0x01013F 04:812F: F0 5F     BEQ b04_bra_8190
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x010144 04:8134: 29 0F     AND #$0F
    BNE     b04_bra_8190             ; BNE  ; orig: C - - - - - 0x010146 04:8136: D0 58     BNE b04_bra_8190
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x01014B 04:813B: A5 AC     LDA ram_state_link
    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x01014D 04:813D: C9 FF     CMP #$FF    ; con_ob
    BEQ     b04_bra_8190             ; BEQ  ; orig: C - - - - - 0x01014F 04:813F: F0 4F     BEQ b04_bra_8190
    MOVE.B  #con_dir_Down,D0  ; orig: C - - - - - 0x010151 04:8141: A9 04     LDA #con_dir_Down
    MOVE.B  D0,ram_0002_t12_direction  ; orig: C - - - - - 0x010153 04:8143: 85 02     STA ram_0002_t12_dir
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x010155 04:8145: A5 62     LDA ram_0062
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #ram_pos_Y_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCS     b04_bra_8153             ; BCS  ; orig: C - - - - - 0x01015B 04:814B: B0 06     BCS b04_bra_8153
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0062,D2  ; orig: C - - - - - 0x01015F 04:814F: A4 62     LDY ram_0062
    MOVE.B  (ram_0002_t12_direction).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t12_direction).l  ; orig: C - - - - - 0x010161 04:8151: 06 02     ASL ram_0002_t12_dir

b04_bra_8153:  ; orig: b04_bra_8153:
    MOVE.B  D2,ram_000E_t06  ; orig: C - - - - - 0x010163 04:8153: 84 0E     STY ram_000E_t06
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010165 04:8155: 38        SEC
    MOVE.B  ram_000E_t06,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x010166 04:8156: E5 0E     SBC ram_000E_t06

    MOVE.B  D0,ram_0000_t31  ; orig: C - - - - - 0x010168 04:8158: 85 00     STA ram_0000_t31
    MOVE.B  #con_dir_Right,D0  ; orig: C - - - - - 0x01016A 04:815A: A9 01     LDA #con_dir_Right
    MOVE.B  D0,ram_0003_t06_direction  ; orig: C - - - - - 0x01016C 04:815C: 85 03     STA ram_0003_t06_dir
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x01016E 04:815E: A5 61     LDA ram_0061
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCS     b04_bra_816C             ; BCS  ; orig: C - - - - - 0x010174 04:8164: B0 06     BCS b04_bra_816C
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0061,D2  ; orig: C - - - - - 0x010178 04:8168: A4 61     LDY ram_0061
    MOVE.B  (ram_0003_t06_direction).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0003_t06_direction).l  ; orig: C - - - - - 0x01017A 04:816A: 06 03     ASL ram_0003_t06_dir

b04_bra_816C:  ; orig: b04_bra_816C:
    MOVE.B  D2,ram_000E_t07  ; orig: C - - - - - 0x01017C 04:816C: 84 0E     STY ram_000E_t07
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01017E 04:816E: 38        SEC
    MOVE.B  ram_000E_t07,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x01017F 04:816F: E5 0E     SBC ram_000E_t07

    MOVE.B  D0,ram_0001_t10  ; orig: C - - - - - 0x010181 04:8171: 85 01     STA ram_0001_t10
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x010183 04:8173: A0 00     LDY #$00
    MOVE.B  ram_0000_t31,D0  ; orig: C - - - - - 0x010185 04:8175: A5 00     LDA ram_0000_t31
    CMP.B   ram_0001_t10,D0  ; orig: C - - - - - 0x010187 04:8177: C5 01     CMP ram_0001_t10
    BCS     b04_bra_817C             ; BCS  ; orig: C - - - - - 0x010189 04:8179: B0 01     BCS b04_bra_817C
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01018B 04:817B: C8        INY ; 01
b04_bra_817C:  ; orig: b04_bra_817C:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01018C 04:817C: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)


; also ram_0001_t10
    MOVEA.L #ram_0000_t31,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$51,D0  ; orig: C - - - - - 0x010194 04:8184: C9 51     CMP #$51
    BCS     b04_bra_8190             ; BCS  ; orig: C - - - - - 0x010196 04:8186: B0 08     BCS b04_bra_8190
    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010198 04:8188: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^

; also ram_0003_t06_direction
    MOVEA.L #ram_0002_t12_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8190:  ; orig: b04_bra_8190:
loc_8190:  ; orig: loc_8190:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_03F8_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_obj_id_5C,D0  ; orig: C - - - - - 0x0101A5 04:8195: A9 5C     LDA #con_obj_id_5C
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x0101A7 04:8197: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_05,D2  ; orig: C - - - - - 0x0101AA 04:819A: C0 05     CPY #con_obj_id_05
    BEQ     b04_bra_81AE             ; BEQ  ; orig: C - - - - - 0x0101AC 04:819C: F0 10     BEQ b04_bra_81AE
    CMPI.B  #con_obj_id_06,D2  ; orig: C - - - - - 0x0101AE 04:819E: C0 06     CPY #con_obj_id_06
    BNE     b04_bra_81F2_RTS             ; BNE  ; orig: C - - - - - 0x0101B0 04:81A0: D0 50     BNE b04_bra_81F2_RTS
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$23,D0  ; orig: C - - - - - 0x0101B4 04:81A4: C9 23     CMP #$23
    BEQ     b04_bra_81AC             ; BEQ  ; orig: C - - - - - 0x0101B6 04:81A6: F0 04     BEQ b04_bra_81AC
    CMPI.B  #$77,D0  ; orig: C - - - - - 0x0101B8 04:81A8: C9 77     CMP #$77
    BNE     b04_bra_81F2_RTS             ; BNE  ; orig: C - - - - - 0x0101BA 04:81AA: D0 46     BNE b04_bra_81F2_RTS
b04_bra_81AC:  ; orig: b04_bra_81AC:
    MOVE.B  #con_obj_id_5C,D0  ; orig: C - - - - - 0x0101BC 04:81AC: A9 5C     LDA #con_obj_id_5C
b04_bra_81AE:  ; orig: b04_bra_81AE:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D2

    BNE     b04_bra_81F2_RTS             ; BNE  ; orig: C - - - - - 0x0101C0 04:81B0: D0 40     BNE b04_bra_81F2_RTS

; bzk optimize, the same con_obj_id_5C will be written despite conditions
    MOVE.B  D0,ram_0000_t23  ; orig: C - - - - - 0x0101C2 04:81B2: 85 00     STA ram_0000_t23
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x0101C4 04:81B4: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x0101C7 04:81B7: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_81F2_RTS             ; BNE  ; orig: C - - - - - 0x0101C9 04:81B9: D0 37     BNE b04_bra_81F2_RTS
    MOVE.B  ram_0000_t23,D0  ; orig: C - - - - - 0x0101CB 04:81BB: A5 00     LDA ram_0000_t23
    BSR     sub_B179             ; JSR -> BSR  ; orig: C - - - - - 0x0101CD 04:81BD: 20 79 B1  JSR sub_B179
    BCC     b04_bra_81F2_RTS             ; BCC  ; orig: C - - - - - 0x0101D0 04:81C0: 90 30     BCC b04_bra_81F2_RTS
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x0101D2 04:81C2: A9 80     LDA #$80
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0101D6 04:81C6: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0101DB 04:81CB: 8A        TXA
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0101DF 04:81CF: 98        TYA
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0101E3 04:81D3: A9 10     LDA #$10
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x0101E8 04:81D8: A9 A0     LDA #$A0
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$51,D0  ; orig: C - - - - - 0x0101ED 04:81DD: A9 51     LDA #$51
    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0101F2 04:81E2: A9 00     LDA #$00
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$03,D0  ; orig: C - - - - - 0x0101F7 04:81E7: A9 03     LDA #$03
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x0101FE 04:81EE: 29 3F     AND #$3F
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_81F2_RTS:  ; orig: b04_bra_81F2_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010202 04:81F2: 60        RTS



tbl_81F3:  ; orig: tbl_81F3:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010203 04:81F3: 08        .byte $08   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x010204 04:81F4: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x010205 04:81F5: 02        .byte $02   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010206 04:81F6: 01        .byte $01   ; 03



ofs_004_0x010207_68:  ; orig: ofs_004_0x010207_68:

; con_obj_id_68

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$03,D0  ; orig: C - - - - - 0x010209 04:81F9: 29 03     AND #$03
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01020B 04:81FB: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_014_8204_00  -- needs manual handling  ; orig: - D 0 - I - 0x01020E 04:81FE: 04 82     .word ofs_014_8204_0
    ; [DIRECTIVE] .WORD ofs_014_8263_01  -- needs manual handling  ; orig: - D 0 - I - 0x010210 04:8200: 63 82     .word ofs_014_8263_0
    ; [DIRECTIVE] .WORD ofs_014_8289_02_RTS  -- needs manual handling  ; orig: - D 0 - I - 0x010212 04:8202: 89 82     .word ofs_014_8289_0



ofs_014_8204_00:  ; orig: ofs_014_8204_00:
    MOVE.B  ram_034D_flag,D0  ; orig: C - - J - - 0x010214 04:8204: AD 4D 03  LDA ram_034D_flag
    BEQ     b04_bra_825D             ; BEQ  ; orig: C - - - - - 0x010217 04:8207: F0 54     BEQ b04_bra_825D
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x010219 04:8209: A5 70     LDA ram_pos_X_link
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_821C             ; BNE  ; orig: C - - - - - 0x01021D 04:820D: D0 0D     BNE b04_bra_821C
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01021F 04:820F: A0 00     LDY #$00
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010221 04:8211: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010223 04:8213: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010224 04:8214: 69 03     ADC #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010226 04:8216: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x010227 04:8217: F5 84     SBC ram_pos_Y_enemy,
    JMP     loc_822C  ; orig: C - - - - - 0x010229 04:8219: 4C 2C 82  JMP loc_822C
b04_bra_821C:  ; orig: b04_bra_821C:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01022C 04:821C: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01022E 04:821E: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01022F 04:821F: 69 03     ADC #$03
    MOVEA.L #ram_pos_Y_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_825D             ; BNE  ; orig: C - - - - - 0x010233 04:8223: D0 38     BNE b04_bra_825D
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x010235 04:8225: A0 02     LDY #$02
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x010237 04:8227: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010239 04:8229: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01023A 04:822A: F5 70     SBC ram_pos_X_enemy,
loc_822C:  ; orig: loc_822C:
    BPL     b04_bra_8232             ; BPL  ; orig: C D 0 - - - 0x01023C 04:822C: 10 04     BPL b04_bra_8232
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01023E 04:822E: C8        INY
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x01023F 04:822F: 20 21 70  JSR sub_bat_7021_EOR
b04_bra_8232:  ; orig: b04_bra_8232:
    CMPI.B  #$11,D0  ; orig: C - - - - - 0x010242 04:8232: C9 11     CMP #$11
    BCS     b04_bra_825D             ; BCS  ; orig: C - - - - - 0x010244 04:8234: B0 27     BCS b04_bra_825D
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x010246 04:8236: AD F8 03  LDA ram_03F8_link
    MOVEA.L #tbl_81F3,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_825D             ; BNE  ; orig: C - - - - - 0x01024C 04:823C: D0 1F     BNE b04_bra_825D
    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01024E 04:823E: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$10,D2  ; orig: C - - - - - 0x010254 04:8244: C0 10     CPY #$10    ; timer 
    BCC     b04_bra_8262_RTS             ; BCC  ; orig: C - - - - - 0x010256 04:8246: 90 1A     BCC b04_bra_8262_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01025A 04:824A: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x01025C 04:824C: E6 F7     INC ram_00F7_flag
    MOVE.B  #$74,D0  ; orig: C - - - - - 0x01025E 04:824E: A9 74     LDA #$74
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010260 04:8250: 20 62 E8  JSR sub_0x01E872_bom
sub_8253:  ; orig: sub_8253:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010263 04:8253: 20 93 FA  JSR sub_0x01FAA3
    SUBQ.B  #1,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x010266 04:8256: C6 01     DEC ram_0001_t15_spr
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010268 04:8258: A9 00     LDA #$00
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x01026A 04:825A: 4C DF 77  JMP loc_bat_77DF
b04_bra_825D:  ; orig: b04_bra_825D:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01026D 04:825D: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8262_RTS:  ; orig: b04_bra_8262_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010272 04:8262: 60        RTS



ofs_014_8263_01:  ; orig: ofs_014_8263_01:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x010275 04:8265: 85 0F     STA ram_000F_t01_dir
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x010277 04:8267: 20 8D F0  JSR sub_0x01F09D
    BSR     sub_8253             ; JSR -> BSR  ; orig: C - - - - - 0x01027A 04:826A: 20 53 82  JSR sub_8253
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x010280 04:8270: C9 10     CMP #$10
    BEQ     b04_bra_8278             ; BEQ  ; orig: C - - - - - 0x010282 04:8272: F0 04     BEQ b04_bra_8278
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x010284 04:8274: C9 F0     CMP #$F0
    BNE     b04_bra_8289_RTS             ; BNE  ; orig: C - - - - - 0x010286 04:8276: D0 11     BNE b04_bra_8289_RTS
b04_bra_8278:  ; orig: b04_bra_8278:
    MOVE.B  #con_sfx_2_secret_found,D0  ; orig: C - - - - - 0x010288 04:8278: A9 04     LDA #con_sfx_2_secre
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x01028A 04:827A: 8D 02 06  STA ram_sfx_2
    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x01028D 04:827D: E6 F7     INC ram_00F7_flag
    MOVE.B  #$B0,D0  ; orig: C - - - - - 0x01028F 04:827F: A9 B0     LDA #$B0
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010291 04:8281: 20 62 E8  JSR sub_0x01E872_bom
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010294 04:8284: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    ADDQ.B  #1,ram_04CF_flag  ; orig: C - - - - - 0x010296 04:8286: EE CF 04  INC ram_04CF_flag
b04_bra_8289_RTS:  ; orig: b04_bra_8289_RTS:
ofs_014_8289_02_RTS:  ; orig: ofs_014_8289_02_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010299 04:8289: 60        RTS



sub_828A:  ; orig: sub_828A:
loc_828A:  ; orig: loc_828A:
    MOVE.B  #$F8,D0  ; orig: - - - - - - 0x01029A 04:828A: A9 F8     LDA #$F8
    ; (empty translation for STA)  ; orig: - - - - - - 0x01029C 04:828C: 8D 40 02  STA ram_spr_Y + $40
    ; (empty translation for STA)  ; orig: - - - - - - 0x01029F 04:828F: 8D 44 02  STA ram_spr_Y + $44
    RTS                     ; RTS  ; orig: - - - - - - 0x0102A2 04:8292: 60        RTS



sub_8293:  ; orig: sub_8293:
    MOVE.B  #$00,D2  ; orig: - - - - - - 0x0102A3 04:8293: A0 00     LDY #$00
    BEQ     b04_bra_8299             ; BEQ  ; orig: - - - - - - 0x0102A5 04:8295: F0 02     BEQ b04_bra_8299    ; jm



sub_8297:  ; orig: sub_8297:
    MOVE.B  #$01,D2  ; orig: - - - - - - 0x0102A7 04:8297: A0 01     LDY #$01
b04_bra_8299:  ; orig: b04_bra_8299:
    MOVE.B  D2,ram_000C_t07_flag  ; orig: - - - - - - 0x0102A9 04:8299: 84 0C     STY ram_000C_t07_fla
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: - - - - - - 0x0102AB 04:829B: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x0102AE 04:829E: C8        INY
    MOVE.B  D0,ram_000D_t04_table_offset  ; orig: - - - - - - 0x0102AF 04:829F: 85 0D     STA ram_000D_t04_tab
    MOVE.B  D2,ram_000E_t02  ; orig: - - - - - - 0x0102B1 04:82A1: 84 0E     STY ram_000E_t02
    MOVE.B  D1,ram_0008_t07  ; orig: - - - - - - 0x0102B3 04:82A3: 86 08     STX ram_0008_t07
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x0102B5 04:82A5: A9 40     LDA #$40
    MOVE.B  D0,ram_spr_index_1  ; orig: - - - - - - 0x0102B7 04:82A7: 8D 43 03  STA ram_spr_index_1
    MOVE.B  #$44,D0  ; orig: - - - - - - 0x0102BA 04:82AA: A9 44     LDA #$44
    JMP     loc_bat_7804  ; orig: - - - - - - 0x0102BC 04:82AC: 4C 04 78  JMP loc_bat_7804



sub_82AF_create_object:  ; orig: sub_82AF_create_object:
loc_82AF_create_object:  ; orig: loc_82AF_create_object:
    MOVE.B  D0,ram_0000_t24  ; orig: C D 0 - - - 0x0102BF 04:82AF: 85 00     STA ram_0000_t24
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x0102C1 04:82B1: 20 BB FE  JSR sub_0x01FECB_sea
    BEQ     b04_bra_82D0_RTS             ; BEQ  ; orig: C - - - - - 0x0102C4 04:82B4: F0 1A     BEQ b04_bra_82D0_RTS    
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0102C6 04:82B6: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0102C7 04:82B7: 48        PHA
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0102C8 04:82B8: 98        TYA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0102C9 04:82B9: AA        TAX
    MOVE.B  ram_0000_t24,D0  ; orig: C - - - - - 0x0102CA 04:82BA: A5 00     LDA ram_0000_t24
    BSR     sub_0x01FEC3_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0102CC 04:82BC: 20 B3 FE  JSR sub_0x01FEC3_cre
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0102CF 04:82BF: 8A        TXA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0102D0 04:82C0: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0102D1 04:82C1: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0102D2 04:82C2: AA        TAX
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0102D5 04:82C5: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0102D6 04:82C6: 69 04     ADC #$04
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D2.L)

b04_bra_82D0_RTS:  ; orig: b04_bra_82D0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0102E0 04:82D0: 60        RTS



tbl_82D1_pos_X:  ; orig: tbl_82D1_pos_X:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0102E1 04:82D1: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0102E2 04:82D2: FF        .byte $FF   ;
tbl_82D3_pos_Y:  ; orig: tbl_82D3_pos_Y:
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 0 - - - 0x0102E3 04:82D3: FE        .byte $FE   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x0102E4 04:82D4: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x0102E5 04:82D5: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x0102E6 04:82D6: FF        .byte $FF   ;



ofs_004_0x0102E7_53:  ; orig: ofs_004_0x0102E7_53:

; con_obj_id_53
ofs_004_0x0102E7_54:  ; orig: ofs_004_0x0102E7_54:

; con_obj_id_54
ofs_004_0x0102E7_57:  ; orig: ofs_004_0x0102E7_57:

; con_obj_id_57
ofs_004_0x0102E7_58:  ; orig: ofs_004_0x0102E7_58:

; con_obj_id_58
ofs_004_0x0102E7_59:  ; orig: ofs_004_0x0102E7_59:

; con_obj_id_59
ofs_004_0x0102E7_5A:  ; orig: ofs_004_0x0102E7_5A:

; con_obj_id_5A

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0102E9 04:82D9: 85 0F     STA ram_000F_t01_dir
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0102ED 04:82DD: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x0102EF 04:82DF: C9 10     CMP #$10
    BNE     b04_bra_834C             ; BNE  ; orig: C - - - - - 0x0102F1 04:82E1: D0 69     BNE b04_bra_834C
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0102F3 04:82E3: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$55,D0  ; orig: C - - - - - 0x0102F6 04:82E6: C9 55     CMP #$55
    BCS     b04_bra_82F6             ; BCS  ; orig: C - - - - - 0x0102F8 04:82E8: B0 0C     BCS b04_bra_82F6
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_82FE             ; BNE  ; orig: C - - - - - 0x0102FC 04:82EC: D0 10     BNE b04_bra_82FE
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x0102FE 04:82EE: 20 FA ED  JSR sub_0x01EE0A_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x010301 04:82F1: CD 4A 03  CMP ram_min_collisio
    BCS     b04_bra_833B             ; BCS  ; orig: C - - - - - 0x010304 04:82F4: B0 45     BCS b04_bra_833B
b04_bra_82F6:  ; orig: b04_bra_82F6:
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x010306 04:82F6: 20 B8 6F  JSR sub_bat_6FB8
    BEQ     b04_bra_833B             ; BEQ  ; orig: C - - - - - 0x010309 04:82F9: F0 40     BEQ b04_bra_833B
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x01030B 04:82FB: 20 8D F0  JSR sub_0x01F09D
b04_bra_82FE:  ; orig: b04_bra_82FE:
    BSR     sub_8371             ; JSR -> BSR  ; orig: C - - - - - 0x01030E 04:82FE: 20 71 83  JSR sub_8371
    MOVE.B  ram_0006_t10_flag,D0  ; orig: C - - - - - 0x010311 04:8301: A5 06     LDA ram_0006_t10_fla
    BNE     b04_bra_833B             ; BNE  ; orig: C - - - - - 0x010313 04:8303: D0 36     BNE b04_bra_833B
b04_bra_8305:  ; orig: b04_bra_8305:
loc_8305:  ; orig: loc_8305:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C D 0 - - - 0x010315 04:8305: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_5B,D0  ; orig: C - - - - - 0x010318 04:8308: C9 5B     CMP #con_obj_id_5B
    BNE     b04_bra_830F             ; BNE  ; orig: C - - - - - 0x01031A 04:830A: D0 03     BNE b04_bra_830F
    JMP     loc_0x01F58B  ; orig: C - - - - - 0x01031C 04:830C: 4C 7B F5  JMP loc_0x01F58B
b04_bra_830F:  ; orig: b04_bra_830F:
    CMPI.B  #$57,D0  ; orig: C - - - - - 0x01031F 04:830F: C9 57     CMP #$57
    BCC     b04_bra_831A             ; BCC  ; orig: C - - - - - 0x010321 04:8311: 90 07     BCC b04_bra_831A
    CMPI.B  #$5A,D0  ; orig: C - - - - - 0x010323 04:8313: C9 5A     CMP #$5A
    BCS     b04_bra_831A             ; BCS  ; orig: C - - - - - 0x010325 04:8315: B0 03     BCS b04_bra_831A
    JMP     loc_0x01F3A1  ; orig: C - - - - - 0x010327 04:8317: 4C 91 F3  JMP loc_0x01F3A1
b04_bra_831A:  ; orig: b04_bra_831A:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x01032A 04:831A: 20 93 FA  JSR sub_0x01FAA3

; A = 00

; bzk optimize, A is always 00
    MOVE.B  D0,ram_000D_t05_useless_00  ; orig: C - - - - - 0x01032D 04:831D: 85 0D     STA ram_000D_t05_use
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01032F 04:831F: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x010331 04:8321: 29 03     AND #$03
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010333 04:8323: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #$55,D2  ; orig: C - - - - - 0x010336 04:8326: C0 55     CPY #$55
    BCS     b04_bra_8333             ; BCS  ; orig: C - - - - - 0x010338 04:8328: B0 09     BCS b04_bra_8333
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x01033A 04:832A: A0 03     LDY #$03
b04_bra_832C_loop:  ; orig: b04_bra_832C_loop:
    ADDQ.B  #1,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01033C 04:832C: E6 00     INC ram_0000_t21_spr
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01033E 04:832E: 88        DEY
    BPL     b04_bra_832C_loop             ; BPL  ; orig: C - - - - - 0x01033F 04:832F: 10 FB     BPL b04_bra_832C_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010341 04:8331: A9 00     LDA #$00
b04_bra_8333:  ; orig: b04_bra_8333:
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x010343 04:8333: 20 88 79  JSR sub_bat_7988_set

; bzk optimize, always 00
    MOVE.B  ram_000D_t05_useless_00,D0  ; orig: C - - - - - 0x010346 04:8336: A5 0D     LDA ram_000D_t05_use
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x010348 04:8338: 4C DF 77  JMP loc_bat_77DF
b04_bra_833B:  ; orig: b04_bra_833B:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01034B 04:833B: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_55,D0  ; orig: C - - - - - 0x01034E 04:833E: C9 55     CMP #con_obj_id_55
    BEQ     b04_bra_8349_fireball             ; BEQ  ; orig: C - - - - - 0x010350 04:8340: F0 07     BEQ bra_8349_firebal
    CMPI.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x010352 04:8342: C9 56     CMP #con_obj_id_56
    BEQ     b04_bra_8349_fireball             ; BEQ  ; orig: C - - - - - 0x010354 04:8344: F0 03     BEQ bra_8349_firebal

; if not fireball
loc_8346:  ; orig: loc_8346:
sub_0x010356:  ; orig: sub_0x010356:
loc_0x010356:  ; orig: loc_0x010356:
    SUBQ.B  #1,ram_enemy_proj_cnt  ; orig: C D 0 - - - 0x010356 04:8346: CE 4C 03  DEC ram_enemy_proj_c
b04_bra_8349_fireball:  ; orig: b04_bra_8349_fireball:
    JMP     loc_0x01FEC1_destroy_object  ; orig: C - - - - - 0x010359 04:8349: 4C B1 FE  JMP loc_0x01FEC1_des
b04_bra_834C:  ; orig: b04_bra_834C:
loc_834C:  ; orig: loc_834C:
    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_7013_get_Y_from_direction             ; JSR -> BSR  ; orig: C - - - - - 0x01035F 04:834F: 20 13 70  JSR sub_bat_7013_get
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010364 04:8354: 18        CLC
    ; !! ADC tbl_82D3_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x010365 04:8355: 79 D3 82  ADC tbl_82D3_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01036C 04:835C: 18        CLC
    ; !! ADC tbl_82D1_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01036D 04:835D: 79 D1 82  ADC tbl_82D1_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010375 04:8365: 18        CLC
    ADD.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010376 04:8366: 69 02     ADC #$02
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01037B 04:836B: C9 20     CMP #$20
    BCS     b04_bra_833B             ; BCS  ; orig: C - - - - - 0x01037D 04:836D: B0 CC     BCS b04_bra_833B
    BCC     b04_bra_8305             ; BCC  ; orig: C - - - - - 0x01037F 04:836F: 90 94     BCC b04_bra_8305    ; jm



sub_8371:  ; orig: sub_8371:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010381 04:8371: A9 00     LDA #$00
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - - - - 0x010386 04:8376: 20 A7 7A  JSR sub_bat_7AA7
    MOVE.B  ram_034B_flag,D0  ; orig: C - - - - - 0x010389 04:8379: AD 4B 03  LDA ram_034B_flag
    BEQ     b04_bra_8387_RTS             ; BEQ  ; orig: C - - - - - 0x01038C 04:837C: F0 09     BEQ b04_bra_8387_RTS
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x01038E 04:837E: A5 98     LDA ram_dir_link
    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  D0,(A0,D1.L)


; deflected projectile with a shield
    MOVE.B  #$30,D0  ; orig: C - - - - - 0x010393 04:8383: A9 30     LDA #$30
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8387_RTS:  ; orig: b04_bra_8387_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010397 04:8387: 60        RTS



tbl_8388:  ; orig: tbl_8388:
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 0 - - - 0x010398 04:8388: 70        .byte $70   ; 00
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 0 - - - 0x010399 04:8389: 68        .byte $68   ; 01
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x01039A 04:838A: 60        .byte $60   ; 02
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 0 - - - 0x01039B 04:838B: 58        .byte $58   ; 03
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x01039C 04:838C: 50        .byte $50   ; 04
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - D 0 - - - 0x01039D 04:838D: 3C        .byte $3C   ; 05
    ; [DIRECTIVE] .BYTE $26  -- needs manual handling  ; orig: - D 0 - - - 0x01039E 04:838E: 26        .byte $26   ; 06
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x01039F 04:838F: 10        .byte $10   ; 07



tbl_8390:  ; orig: tbl_8390:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0103A0 04:8390: 00        .byte $00   ; 00    
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x0103A1 04:8391: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $26  -- needs manual handling  ; orig: - D 0 - - - 0x0103A2 04:8392: 26        .byte $26   ; 02
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - D 0 - - - 0x0103A3 04:8393: 3C        .byte $3C   ; 03
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x0103A4 04:8394: 50        .byte $50   ; 04
    ; [DIRECTIVE] .BYTE $58  -- needs manual handling  ; orig: - D 0 - - - 0x0103A5 04:8395: 58        .byte $58   ; 05
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x0103A6 04:8396: 60        .byte $60   ; 06
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 0 - - - 0x0103A7 04:8397: 68        .byte $68   ; 07
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 0 - - - 0x0103A8 04:8398: 70        .byte $70   ; 08



ofs_004_0x0103A9_55:  ; orig: ofs_004_0x0103A9_55:

; con_obj_id_55
ofs_004_0x0103A9_56:  ; orig: ofs_004_0x0103A9_56:

; con_obj_id_56

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_83CC             ; BNE  ; orig: C - - - - - 0x0103AB 04:839B: D0 2F     BNE b04_bra_83CC
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_bat_704A             ; JSR -> BSR  ; orig: C - - - - - 0x0103B3 04:83A3: 20 4A 70  JSR sub_bat_704A
    MOVE.B  ram_000B_t03,D0  ; orig: C - - - - - 0x0103B6 04:83A6: A5 0B     LDA ram_000B_t03
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_000A_t06,D0  ; orig: C - - - - - 0x0103BB 04:83AB: A5 0A     LDA ram_000A_t06
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    OR.B    ram_000B_t03,D0  ; orig: C - - - - - 0x0103C0 04:83B0: 05 0B     ORA ram_000B_t03
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$04,D2  ; orig: C - - - - - 0x0103C4 04:83B4: A0 04     LDY #$04
    BSR     sub_bat_706F             ; JSR -> BSR  ; orig: C - - - - - 0x0103C6 04:83B6: 20 6F 70  JSR sub_bat_706F
    MOVEA.L #tbl_8388,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #tbl_8390,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0103D5 04:83C5: A9 10     LDA #$10
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x0103DB 04:83CB: 60        RTS
b04_bra_83CC:  ; orig: b04_bra_83CC:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_83FC             ; BNE  ; orig: C - - - - - 0x0103DE 04:83CE: D0 2C     BNE b04_bra_83FC
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_6FB6             ; JSR -> BSR  ; orig: C - - - - - 0x0103E2 04:83D2: 20 B6 6F  JSR sub_bat_6FB6
    BNE     b04_bra_83DA             ; BNE  ; orig: C - - - - - 0x0103E5 04:83D5: D0 03     BNE b04_bra_83DA
b04_bra_83D7:  ; orig: b04_bra_83D7:
    JMP     loc_0x01FEC1_destroy_object  ; orig: C - - - - - 0x0103E7 04:83D7: 4C B1 FE  JMP loc_0x01FEC1_des
b04_bra_83DA:  ; orig: b04_bra_83DA:
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0103ED 04:83DD: 85 0F     STA ram_000F_t01_dir
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D2

    BSR     sub_8407             ; JSR -> BSR  ; orig: C - - - - - 0x0103F5 04:83E5: 20 07 84  JSR sub_8407
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0103FE 04:83EE: 85 0F     STA ram_000F_t01_dir
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  (A0,D1.L),D2

    BSR     sub_8407             ; JSR -> BSR  ; orig: C - - - - - 0x010406 04:83F6: 20 07 84  JSR sub_8407
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_83FC:  ; orig: b04_bra_83FC:
    BSR     sub_8371             ; JSR -> BSR  ; orig: C - - - - - 0x01040C 04:83FC: 20 71 83  JSR sub_8371
    MOVE.B  ram_034B_flag,D0  ; orig: C - - - - - 0x01040F 04:83FF: AD 4B 03  LDA ram_034B_flag
    BNE     b04_bra_83D7             ; BNE  ; orig: C - - - - - 0x010412 04:8402: D0 D3     BNE b04_bra_83D7
    JMP     loc_8305  ; orig: C - - - - - 0x010414 04:8404: 4C 05 83  JMP loc_8305



sub_8407:  ; orig: sub_8407:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01041A 04:840A: 98        TYA
    MOVEA.L #ram_03A8_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x01041E 04:840E: 20 8D F0  JSR sub_0x01F09D
    MOVEA.L #ram_03A8_enemy,A0
    MOVE.B  (A0,D1.L),D0

    RTS                     ; RTS  ; orig: C - - - - - 0x010424 04:8414: 60        RTS



ofs_005_0x010425_2B:  ; orig: ofs_005_0x010425_2B:

; con_obj_id_2B
ofs_005_0x010425_2C:  ; orig: ofs_005_0x010425_2C:

; con_obj_id_2C
ofs_005_0x010425_2D:  ; orig: ofs_005_0x010425_2D:

; con_obj_id_2D

; in

; X = 01+
    MOVE.B  #$40,D0  ; orig: C - - J - - 0x010425 04:8415: A9 40     LDA #$40
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_8025  ; orig: C - - - - - 0x01042A 04:841A: 4C 25 80  JMP loc_8025



sub_841D:  ; orig: sub_841D:
ofs_005_0x01042D_1B:  ; orig: ofs_005_0x01042D_1B:

; con_obj_id_1B

; in

; X = 01+
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01042F 04:841F: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010431 04:8421: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_B20B_clear_obj_stuff             ; JSR -> BSR  ; orig: C - - - - - 0x010437 04:8427: 20 0B B2  JSR sub_B20B_clear_o
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x01043A 04:842A: A9 C0     LDA #$C0
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x01043C 04:842C: 8D D1 04  STA ram_04D1
    MOVE.B  #$1F,D0  ; orig: C - - - - - 0x01043F 04:842F: A9 1F     LDA #$1F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x010444 04:8434: 60        RTS



ofs_005_0x010445_1C:  ; orig: ofs_005_0x010445_1C:

; con_obj_id_1C
ofs_005_0x010445_1D:  ; orig: ofs_005_0x010445_1D:

; con_obj_id_1D

; in

; X = 01+
    BSR     sub_841D             ; JSR -> BSR  ; orig: C - - J - - 0x010445 04:8435: 20 1D 84  JSR sub_841D
    MOVE.B  #$7F,D0  ; orig: C - - - - - 0x010448 04:8438: A9 7F     LDA #$7F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01044D 04:843D: 60        RTS



ofs_004_0x01044E_2B:  ; orig: ofs_004_0x01044E_2B:

; con_obj_id_2B
ofs_004_0x01044E_2C:  ; orig: ofs_004_0x01044E_2C:

; con_obj_id_2C
ofs_004_0x01044E_2D:  ; orig: ofs_004_0x01044E_2D:

; con_obj_id_2D

; in

; X = 01+
    MOVE.B  #$40,D0  ; orig: C - - J - - 0x01044E 04:843E: A9 40     LDA #$40
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x010450 04:8440: 20 6E 80  JSR sub_806E
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010453 04:8443: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_2B,D0  ; orig: C - - - - - 0x010456 04:8446: C9 2B     CMP #con_obj_id_2B
    BEQ     b04_bra_8450             ; BEQ  ; orig: C - - - - - 0x010458 04:8448: F0 06     BEQ b04_bra_8450
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01045A 04:844A: 38        SEC
    SUB.B  #$2B,D0       ; SBC imm  ; orig: C - - - - - 0x01045B 04:844B: E9 2B     SBC #$2B
    JMP     loc_8454  ; orig: C - - - - - 0x01045D 04:844D: 4C 54 84  JMP loc_8454
b04_bra_8450:  ; orig: b04_bra_8450:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x010460 04:8450: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x010462 04:8452: 29 03     AND #$03
loc_8454:  ; orig: loc_8454:
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C D 0 - - - 0x010464 04:8454: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x010467 04:8457: A9 01     LDA #$01
    BSR     sub_8476             ; JSR -> BSR  ; orig: C - - - - - 0x010469 04:8459: 20 76 84  JSR sub_8476
    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - - - - 0x01046C 04:845C: 20 A7 7A  JSR sub_bat_7AA7
    MOVE.B  ram_0006_t10_flag,D0  ; orig: C - - - - - 0x01046F 04:845F: A5 06     LDA ram_0006_t10_fla
    BEQ     b04_bra_846E_RTS             ; BEQ  ; orig: C - - - - - 0x010471 04:8461: F0 0B     BEQ b04_bra_846E_RTS
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010473 04:8463: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_2B,D0  ; orig: C - - - - - 0x010476 04:8466: C9 2B     CMP #con_obj_id_2B
    BNE     b04_bra_846F             ; BNE  ; orig: C - - - - - 0x010478 04:8468: D0 05     BNE b04_bra_846F
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01047A 04:846A: A9 10     LDA #$10
    MOVE.B  D0,ram_sword_disable_timer  ; orig: C - - - - - 0x01047C 04:846C: 85 4C     STA ram_sword_disabl
b04_bra_846E_RTS:  ; orig: b04_bra_846E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01047E 04:846E: 60        RTS
b04_bra_846F:  ; orig: b04_bra_846F:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01047F 04:846F: 38        SEC
    SUB.B  #$2C,D0       ; SBC imm  ; orig: C - - - - - 0x010480 04:8470: E9 2C     SBC #$2C
    MOVE.B  D0,ram_052E  ; orig: C - - - - - 0x010482 04:8472: 8D 2E 05  STA ram_052E
    RTS                     ; RTS  ; orig: C - - - - - 0x010485 04:8475: 60        RTS



sub_8476:  ; orig: sub_8476:
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x010486 04:8476: 20 89 FA  JSR sub_0x01FA99
    BSR     sub_0x01FA82             ; JSR -> BSR  ; orig: C - - - - - 0x010489 04:8479: 20 72 FA  JSR sub_0x01FA82
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01048C 04:847C: A9 00     LDA #$00
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x01048E 04:847E: 4C DF 77  JMP loc_bat_77DF



ofs_004_0x010491_1B:  ; orig: ofs_004_0x010491_1B:

; con_obj_id_1B
ofs_004_0x010491_1C:  ; orig: ofs_004_0x010491_1C:

; con_obj_id_1C
ofs_004_0x010491_1D:  ; orig: ofs_004_0x010491_1D:

; con_obj_id_1D

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x010491 04:8481: AD 6C 06  LDA ram_item_clock
    OR.B    ram_0506,D0  ; orig: C - - - - - 0x010494 04:8484: 0D 06 05  ORA ram_0506
    BNE     b04_bra_848F             ; BNE  ; orig: C - - - - - 0x010497 04:8487: D0 06     BNE b04_bra_848F
    BSR     sub_84A1             ; JSR -> BSR  ; orig: C - - - - - 0x010499 04:8489: 20 A1 84  JSR sub_84A1
    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x01049C 04:848C: 20 88 B2  JSR sub_B288
b04_bra_848F:  ; orig: b04_bra_848F:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x01049F 04:848F: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$02,D0  ; orig: C - - - - - 0x0104A5 04:8495: 29 02     AND #$02
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0104A7 04:8497: 4A        LSR
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x0104A8 04:8498: 20 DB 77  JSR sub_bat_77DB
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0104AB 04:849B: 20 D0 79  JSR sub_bat_79D0
    JMP     loc_0x01EEF4  ; orig: C - - - - - 0x0104AE 04:849E: 4C E4 EE  JMP loc_0x01EEF4



sub_84A1:  ; orig: sub_84A1:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0104B4 04:84A4: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - D 0 - I - 0x0104B7 04:84A7: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_84B3_01  -- needs manual handling  ; orig: - D 0 - I - 0x0104B9 04:84A9: B3 84     .word ofs_030_84B3_0
    ; [DIRECTIVE] .WORD ofs_030_B308_02  -- needs manual handling  ; orig: - D 0 - I - 0x0104BB 04:84AB: 08 B3     .word ofs_030_B308_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - D 0 - I - 0x0104BD 04:84AD: 78 B3     .word ofs_030_B378_0
    ; [DIRECTIVE] .WORD ofs_030_B260_04  -- needs manual handling  ; orig: - D 0 - I - 0x0104BF 04:84AF: 60 B2     .word ofs_030_B260_0
    ; [DIRECTIVE] .WORD ofs_030_B256_05  -- needs manual handling  ; orig: - D 0 - I - 0x0104C1 04:84B1: 56 B2     .word ofs_030_B256_0



ofs_030_84B3_01:  ; orig: ofs_030_84B3_01:
    MOVE.B  #$02,D2  ; orig: C - - J - - 0x0104C3 04:84B3: A0 02     LDY #$02
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0104C5 04:84B5: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$A0,D0  ; orig: C - - - - - 0x0104C7 04:84B7: C9 A0     CMP #$A0
    BCS     b04_bra_84C1             ; BCS  ; orig: C - - - - - 0x0104C9 04:84B9: B0 06     BCS b04_bra_84C1
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0104CB 04:84BB: C8        INY
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x0104CC 04:84BC: C9 20     CMP #$20
    BCS     b04_bra_84C1             ; BCS  ; orig: C - - - - - 0x0104CE 04:84BE: B0 01     BCS b04_bra_84C1
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0104D0 04:84C0: C8        INY
b04_bra_84C1:  ; orig: b04_bra_84C1:
loc_84C1:  ; orig: loc_84C1:
    MOVE.B  D2,D0           ; TYA  ; orig: C D 0 - - - 0x0104D1 04:84C1: 98        TYA
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$06,D0  ; orig: C - - - - - 0x0104D5 04:84C5: A9 06     LDA #$06
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x0104DA 04:84CA: 60        RTS



ofs_004_0x0104DB_13:  ; orig: ofs_004_0x0104DB_13:

; con_obj_id_13

; in

; X = 01+
    BSR     sub_84E1             ; JSR -> BSR  ; orig: C - - J - - 0x0104DB 04:84CB: 20 E1 84  JSR sub_84E1
    BSR     sub_852C             ; JSR -> BSR  ; orig: C - - - - - 0x0104DE 04:84CE: 20 2C 85  JSR sub_852C
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x0104E1 04:84D1: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0104E4 04:84D4: A0 00     LDY #$00
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x0104E6 04:84D6: A5 15     LDA ram_frm_cnt
    ANDI.B  #$08,D0  ; orig: C - - - - - 0x0104E8 04:84D8: 29 08     AND #$08
    BNE     b04_bra_84DD             ; BNE  ; orig: C - - - - - 0x0104EA 04:84DA: D0 01     BNE b04_bra_84DD
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0104EC 04:84DC: C8        INY
b04_bra_84DD:  ; orig: b04_bra_84DD:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0104ED 04:84DD: 98        TYA
    JMP     loc_bat_77DB  ; orig: C - - - - - 0x0104EE 04:84DE: 4C DB 77  JMP loc_bat_77DB



sub_84E1:  ; orig: sub_84E1:

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0104F3 04:84E3: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_031_84EC_00  -- needs manual handling  ; orig: - D 0 - I - 0x0104F6 04:84E6: EC 84     .word ofs_031_84EC_0
    ; [DIRECTIVE] .WORD ofs_031_84F1_01  -- needs manual handling  ; orig: - D 0 - I - 0x0104F8 04:84E8: F1 84     .word ofs_031_84F1_0
    ; [DIRECTIVE] .WORD ofs_031_84F9_02  -- needs manual handling  ; orig: - D 0 - I - 0x0104FA 04:84EA: F9 84     .word ofs_031_84F9_0



ofs_031_84EC_00:  ; orig: ofs_031_84EC_00:

; in

; X = 01+
    MOVE.B  #$18,D0  ; orig: C - - J - - 0x0104FC 04:84EC: A9 18     LDA #$18
    JMP     loc_85C8  ; orig: C - - - - - 0x0104FE 04:84EE: 4C C8 85  JMP loc_85C8



ofs_031_84F1_01:  ; orig: ofs_031_84F1_01:

; in

; X = 01+
    BSR     sub_85FE             ; JSR -> BSR  ; orig: C - - J - - 0x010501 04:84F1: 20 FE 85  JSR sub_85FE
    BCC     b04_bra_84F8_RTS             ; BCC  ; orig: C - - - - - 0x010504 04:84F4: 90 02     BCC b04_bra_84F8_RTS
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010506 04:84F6: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_84F8_RTS:  ; orig: b04_bra_84F8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010508 04:84F8: 60        RTS



ofs_031_84F9_02:  ; orig: ofs_031_84F9_02:

; in

; X = 01+
    ADDQ.B  #1,ram_enemy_cnt  ; orig: C - - J - - 0x010509 04:84F9: EE 4E 03  INC ram_enemy_cnt
    BSR     sub_0x01FEC1_destroy_object             ; JSR -> BSR  ; orig: C - - - - - 0x01050C 04:84FC: 20 B1 FE  JSR sub_0x01FEC1_des
    BSR     sub_8519             ; JSR -> BSR  ; orig: C - - - - - 0x01050F 04:84FF: 20 19 85  JSR sub_8519
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #con_dir_Down,D0  ; orig: C - - - - - 0x010514 04:8504: C9 04     CMP #con_dir_Down
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x010516 04:8506: A9 02     LDA #con_dir_Left
    BCS     b04_bra_850C             ; BCS  ; orig: C - - - - - 0x010518 04:8508: B0 02     BCS b04_bra_850C
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01051A 04:850A: A9 08     LDA #con_dir_Up
b04_bra_850C:  ; orig: b04_bra_850C:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01051F 04:850F: 48        PHA
    BSR     sub_8519             ; JSR -> BSR  ; orig: C - - - - - 0x010520 04:8510: 20 19 85  JSR sub_8519
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010523 04:8513: 68        PLA
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010524 04:8514: 4A        LSR
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x010528 04:8518: 60        RTS



sub_8519:  ; orig: sub_8519:

; in

; X = 01+
    MOVE.B  #con_obj_id_14,D0  ; orig: C - - - - - 0x010529 04:8519: A9 14     LDA #con_obj_id_14
    MOVE.B  D0,ram_0000_t36_obj_id  ; orig: C - - - - - 0x01052B 04:851B: 85 00     STA ram_0000_t36_obj
    BSR     sub_B180             ; JSR -> BSR  ; orig: C - - - - - 0x01052D 04:851D: 20 80 B1  JSR sub_B180
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010530 04:8520: A9 00     LDA #$00
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01053B 04:852B: 60        RTS



sub_852C:  ; orig: sub_852C:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8560_RTS             ; BNE  ; orig: C - - - - - 0x01053E 04:852E: D0 30     BNE b04_bra_8560_RTS
    BSR     sub_8629             ; JSR -> BSR  ; orig: C - - - - - 0x010540 04:8530: 20 29 86  JSR sub_8629
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8560_RTS             ; BNE  ; orig: C - - - - - 0x010546 04:8536: D0 28     BNE b04_bra_8560_RTS
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8560_RTS             ; BEQ  ; orig: C - - - - - 0x01054B 04:853B: F0 23     BEQ b04_bra_8560_RTS
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01054D 04:853D: A0 00     LDY #$00
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x010551 04:8541: 29 0F     AND #$0F
    CMPI.B  #$0D,D0  ; orig: C - - - - - 0x010553 04:8543: C9 0D     CMP #$0D
    BNE     b04_bra_8549             ; BNE  ; orig: C - - - - - 0x010555 04:8545: D0 02     BNE b04_bra_8549
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x010557 04:8547: A0 03     LDY #$03
b04_bra_8549:  ; orig: b04_bra_8549:
    MOVE.B  D2,ram_0000_t25  ; orig: C - - - - - 0x010559 04:8549: 84 00     STY ram_0000_t25
    MOVE.B  #con_dir_00,D2  ; orig: C - - - - - 0x01055B 04:854B: A0 00     LDY #con_dir_00
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01055F 04:854F: 29 0F     AND #$0F
    BNE     b04_bra_8555             ; BNE  ; orig: C - - - - - 0x010561 04:8551: D0 02     BNE b04_bra_8555
    MOVE.B  #con_dir__UD,D2  ; orig: C - - - - - 0x010563 04:8553: A0 0C     LDY #con_dir__UD
b04_bra_8555:  ; orig: b04_bra_8555:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x010565 04:8555: 98        TYA
    OR.B    ram_0000_t25,D0  ; orig: C - - - - - 0x010566 04:8556: 05 00     ORA ram_0000_t25
    AND.B   ram_dir_link,D0  ; orig: C - - - - - 0x010568 04:8558: 25 98     AND ram_dir_link
    BNE     b04_bra_855E             ; BNE  ; orig: C - - - - - 0x01056A 04:855A: D0 02     BNE b04_bra_855E
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01056C 04:855C: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_855E:  ; orig: b04_bra_855E:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01056E 04:855E: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_8560_RTS:  ; orig: b04_bra_8560_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010570 04:8560: 60        RTS



ofs_005_0x010571_15:  ; orig: ofs_005_0x010571_15:

; con_obj_id_15

; in

; X = 01+
    MOVE.B  #$02,D0  ; orig: C - - J - - 0x010571 04:8561: A9 02     LDA #$02
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_8025  ; orig: C - - - - - 0x010575 04:8565: 4C 25 80  JMP loc_8025



ofs_004_0x010578_14:  ; orig: ofs_004_0x010578_14:

; con_obj_id_14
ofs_004_0x010578_15:  ; orig: ofs_004_0x010578_15:

; con_obj_id_15

; in

; X = 01+
    BSR     sub_858F             ; JSR -> BSR  ; orig: C - - J - - 0x010578 04:8568: 20 8F 85  JSR sub_858F
    BSR     sub_8629             ; JSR -> BSR  ; orig: C - - - - - 0x01057B 04:856B: 20 29 86  JSR sub_8629
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010580 04:8570: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010581 04:8571: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010582 04:8572: 69 04     ADC #$04
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010586 04:8576: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x010589 04:8579: A0 00     LDY #$00
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01058B 04:857B: A5 15     LDA ram_frm_cnt
    ANDI.B  #$02,D0  ; orig: C - - - - - 0x01058D 04:857D: 29 02     AND #$02
    BNE     b04_bra_8582             ; BNE  ; orig: C - - - - - 0x01058F 04:857F: D0 01     BNE b04_bra_8582
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010591 04:8581: C8        INY
b04_bra_8582:  ; orig: b04_bra_8582:
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x010592 04:8582: A9 03     LDA #$03
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x010594 04:8584: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x010597 04:8587: 98        TYA
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x010598 04:8588: 20 DF 77  JSR sub_bat_77DF
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01059B 04:858B: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01059E 04:858E: 60        RTS



sub_858F:  ; orig: sub_858F:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    BEQ     b04_bra_85BA             ; BEQ  ; orig: C - - - - - 0x0105A1 04:8591: F0 27     BEQ b04_bra_85BA
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0105A3 04:8593: 88        DEY
    BNE     b04_bra_85C6             ; BNE  ; orig: C - - - - - 0x0105A4 04:8594: D0 30     BNE b04_bra_85C6
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_859F             ; BEQ  ; orig: C - - - - - 0x0105A8 04:8598: F0 05     BEQ b04_bra_859F
    BSR     sub_85FE             ; JSR -> BSR  ; orig: C - - - - - 0x0105AA 04:859A: 20 FE 85  JSR sub_85FE
    BCC     b04_bra_85B9_RTS             ; BCC  ; orig: C - - - - - 0x0105AD 04:859D: 90 1A     BCC b04_bra_85B9_RTS
b04_bra_859F:  ; orig: b04_bra_859F:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0105B1 04:85A1: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0105B2 04:85A2: 69 08     ADC #$08
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0105B4 04:85A4: 29 F0     AND #$F0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0105BA 04:85AA: 69 08     ADC #$08
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x0105BC 04:85AC: 29 F0     AND #$F0
    ORI.B   #$0D,D0  ; orig: C - - - - - 0x0105BE 04:85AE: 09 0D     ORA #$0D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0105C2 04:85B2: A9 00     LDA #$00
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0105C7 04:85B7: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_85B9_RTS:  ; orig: b04_bra_85B9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0105C9 04:85B9: 60        RTS
b04_bra_85BA:  ; orig: b04_bra_85BA:
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0105CA 04:85BA: A9 20     LDA #$20
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$05,D0  ; orig: C - - - - - 0x0105CF 04:85BF: A9 05     LDA #$05
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0105D3 04:85C3: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x0105D5 04:85C5: 60        RTS
b04_bra_85C6:  ; orig: b04_bra_85C6:
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0105D6 04:85C6: A9 40     LDA #$40
loc_85C8:
; A = 18
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$05,D0  ; orig: C - - - - - 0x0105DD 04:85CD: C9 05     CMP #$05
    BCS     b04_bra_85F5_RTS             ; BCS  ; orig: C - - - - - 0x0105DF 04:85CF: B0 24     BCS b04_bra_85F5_RTS
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0105E1 04:85D1: A9 20     LDA #$20
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8094             ; JSR -> BSR  ; orig: C - - - - - 0x0105E6 04:85D6: 20 94 80  JSR sub_8094
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ; !! ORA ram_timer_enemy,X - needs manual review  ; orig: C - - - - - 0x0105EC 04:85DC: 15 28     ORA ram_timer_enemy,
    BNE     b04_bra_85F5_RTS             ; BNE  ; orig: C - - - - - 0x0105EE 04:85DE: D0 15     BNE b04_bra_85F5_RTS
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0105F2 04:85E2: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0105F4 04:85E4: A8        TAY
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0105F5 04:85E5: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_13,D0  ; orig: C - - - - - 0x0105F8 04:85E8: C9 13     CMP #con_obj_id_13
    BEQ     b04_bra_85F0             ; BEQ  ; orig: C - - - - - 0x0105FA 04:85EA: F0 04     BEQ b04_bra_85F0
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0105FC 04:85EC: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0105FD 04:85ED: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0105FE 04:85EE: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0105FF 04:85EF: C8        INY
b04_bra_85F0:  ; orig: b04_bra_85F0:
    MOVEA.L #tbl_85F6,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_85F5_RTS:  ; orig: b04_bra_85F5_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010605 04:85F5: 60        RTS



tbl_85F6:  ; orig: tbl_85F6:
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x010606 04:85F6: 18        .byte $18   ; 00
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 0 - - - 0x010607 04:85F7: 28        .byte $28   ; 01
    ; [DIRECTIVE] .BYTE $38  -- needs manual handling  ; orig: - D 0 - - - 0x010608 04:85F8: 38        .byte $38   ; 02
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x010609 04:85F9: 48        .byte $48   ; 03

    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x01060A 04:85FA: 08        .byte $08   ; 00
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 0 - - - 0x01060B 04:85FB: 18        .byte $18   ; 01
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 0 - - - 0x01060C 04:85FC: 28        .byte $28   ; 02
    ; [DIRECTIVE] .BYTE $38  -- needs manual handling  ; orig: - D 0 - - - 0x01060D 04:85FD: 38        .byte $38   ; 03



sub_85FE:  ; orig: sub_85FE:

; out

; C

; 0 =

; 1 =
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01060E 04:85FE: A9 FF     LDA #$FF
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x010615 04:8605: 85 0F     STA ram_000F_t01_dir
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8614             ; BNE  ; orig: C - - - - - 0x01061A 04:860A: D0 08     BNE b04_bra_8614
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x01061C 04:860C: 20 FA ED  JSR sub_0x01EE0A_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x01061F 04:860F: CD 4A 03  CMP ram_min_collisio
    BCS     b04_bra_8628_RTS             ; BCS  ; orig: C - - - - - 0x010622 04:8612: B0 14     BCS b04_bra_8628_RTS
b04_bra_8614:  ; orig: b04_bra_8614:
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x010624 04:8614: 20 B8 6F  JSR sub_bat_6FB8
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010627 04:8617: 38        SEC
    BEQ     b04_bra_8628_RTS             ; BEQ  ; orig: C - - - - - 0x010628 04:8618: F0 0E     BEQ b04_bra_8628_RTS
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x01062A 04:861A: 20 8D F0  JSR sub_0x01F09D
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x010630 04:8620: 29 0F     AND #$0F
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010632 04:8622: 18        CLC
    BNE     b04_bra_8628_RTS             ; BNE  ; orig: C - - - - - 0x010633 04:8623: D0 03     BNE b04_bra_8628_RTS
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8628_RTS:  ; orig: b04_bra_8628_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010638 04:8628: 60        RTS



sub_8629:  ; orig: sub_8629:

; bzk optimize, useless LDA + STA, 0002 will be overwritten at 0x0072AF
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0002_t15_useless  ; orig: C - - - - - 0x01063B 04:862B: 85 02     STA ram_0002_t15_use

; bzk optimize, useless LDA + STA, 0003 will be overwritten at 0x0072B1
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0003_t10_useless  ; orig: C - - - - - 0x01063F 04:862F: 85 03     STA ram_0003_t10_use
    JMP     loc_bat_79D0  ; orig: C - - - - - 0x010641 04:8631: 4C D0 79  JMP loc_bat_79D0



tbl_8634:  ; orig: tbl_8634:
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x010644 04:8634: 24        .byte $24   ; 00
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 0 - - - 0x010645 04:8635: 23        .byte $23   ; 01



tbl_8636:  ; orig: tbl_8636:
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x010646 04:8636: 03        .byte $03   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010647 04:8637: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010648 04:8638: 01        .byte $01   ; 02



tbl_8639:  ; orig: tbl_8639:
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x010649 04:8639: 50        .byte $50   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x01064A 04:863A: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x01064B 04:863B: F0        .byte $F0   ; 02
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x01064C 04:863C: 60        .byte $60   ; 03



tbl_863D:  ; orig: tbl_863D:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x01064D 04:863D: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x01064E 04:863E: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x01064F 04:863F: 06        .byte $06   ; 02



tbl_8640:  ; orig: tbl_8640:
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x010650 04:8640: 24        .byte $24   ; 00
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x010651 04:8641: C8        .byte $C8   ; 01
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 0 - - - 0x010652 04:8642: 24        .byte $24   ; 02
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x010653 04:8643: C8        .byte $C8   ; 03
    ; [DIRECTIVE] .BYTE $64  -- needs manual handling  ; orig: - D 0 - - - 0x010654 04:8644: 64        .byte $64   ; 04
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 0 - - - 0x010655 04:8645: 88        .byte $88   ; 05
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x010656 04:8646: 48        .byte $48   ; 06
    ; [DIRECTIVE] .BYTE $A8  -- needs manual handling  ; orig: - D 0 - - - 0x010657 04:8647: A8        .byte $A8   ; 07



tbl_8648:  ; orig: tbl_8648:
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 0 - - - 0x010658 04:8648: C0        .byte $C0   ; 00
    ; [DIRECTIVE] .BYTE $BC  -- needs manual handling  ; orig: - D 0 - - - 0x010659 04:8649: BC        .byte $BC   ; 01
    ; [DIRECTIVE] .BYTE $64  -- needs manual handling  ; orig: - D 0 - - - 0x01065A 04:864A: 64        .byte $64   ; 02
    ; [DIRECTIVE] .BYTE $5C  -- needs manual handling  ; orig: - D 0 - - - 0x01065B 04:864B: 5C        .byte $5C   ; 03
    ; [DIRECTIVE] .BYTE $94  -- needs manual handling  ; orig: - D 0 - - - 0x01065C 04:864C: 94        .byte $94   ; 04
    ; [DIRECTIVE] .BYTE $8C  -- needs manual handling  ; orig: - D 0 - - - 0x01065D 04:864D: 8C        .byte $8C   ; 05
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 0 - - - 0x01065E 04:864E: 82        .byte $82   ; 06
    ; [DIRECTIVE] .BYTE $86  -- needs manual handling  ; orig: - D 0 - - - 0x01065F 04:864F: 86        .byte $86   ; 07



sub_0x010660:  ; orig: sub_0x010660:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x010660 04:8650: A0 02     LDY #$02
    MOVE.B  ram_04CC_flag,D0  ; orig: C - - - - - 0x010662 04:8652: AD CC 04  LDA ram_04CC_flag
    BNE     b04_bra_8665             ; BNE  ; orig: C - - - - - 0x010665 04:8655: D0 0E     BNE b04_bra_8665
    BSR     sub_0x01E86A_get_enemy_id_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x010667 04:8657: 20 5A E8  JSR sub_0x01E86A_get
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x01066A 04:865A: A0 01     LDY #$01
b04_bra_865C_loop:  ; orig: b04_bra_865C_loop:
    MOVEA.L #tbl_8634,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_8665             ; BEQ  ; orig: C - - - - - 0x01066F 04:865F: F0 04     BEQ b04_bra_8665
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010671 04:8661: 88        DEY
    BPL     b04_bra_865C_loop             ; BPL  ; orig: C - - - - - 0x010672 04:8662: 10 F8     BPL b04_bra_865C_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x010674 04:8664: 60        RTS
b04_bra_8665:  ; orig: b04_bra_8665:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x010675 04:8665: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010676 04:8666: 48        PHA
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x010677 04:8667: 20 BB FE  JSR sub_0x01FECB_sea
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x01067A 04:866A: C9 01     CMP #$01
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01067C 04:866C: 68        PLA
    BCS     b04_bra_86DC_RTS             ; BCS  ; orig: C - - - - - 0x01067D 04:866D: B0 6D     BCS b04_bra_86DC_RTS
    CMPI.B  #$06,D2  ; orig: C - - - - - 0x01067F 04:866F: C0 06     CPY #$06
    BCC     b04_bra_86DC_RTS             ; BCC  ; orig: C - - - - - 0x010681 04:8671: 90 69     BCC b04_bra_86DC_RTS
    MOVE.B  D2,ram_000A_t07  ; orig: C - - - - - 0x010683 04:8673: 84 0A     STY ram_000A_t07
    MOVE.B  D0,ram_000B_t05_table_index  ; orig: C - - - - - 0x010685 04:8675: 85 0B     STA ram_000B_t05_tab
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010687 04:8677: A8        TAY
    MOVEA.L #tbl_8636,A0
    MOVE.B  (A0,D2.L),D1

b04_bra_867B_loop:  ; orig: b04_bra_867B_loop:
    MOVEA.L #ram_04E8,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01068E 04:867E: 88        DEY
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01068F 04:867F: 98        TYA
    MOVEA.L #ram_04E8,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010693 04:8683: C8        INY
    BNE     b04_bra_86D9             ; BNE  ; orig: C - - - - - 0x010694 04:8684: D0 53     BNE b04_bra_86D9
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x010698 04:8688: C9 F0     CMP #$F0
    BCS     b04_bra_86D9             ; BCS  ; orig: C - - - - - 0x01069A 04:868A: B0 4D     BCS b04_bra_86D9
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01069C 04:868C: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01069E 04:868E: A8        TAY
    MOVEA.L #tbl_8639,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_04E8,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_000B_t05_table_index,D2  ; orig: C - - - - - 0x0106A5 04:8695: A4 0B     LDY ram_000B_t05_tab
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0106A7 04:8697: 8A        TXA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0106A8 04:8698: 18        CLC
    ; !! ADC tbl_863D,Y - complex mode, manual review needed  ; orig: C - - - - - 0x0106A9 04:8699: 79 3D 86  ADC tbl_863D,Y
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0106AC 04:869C: A8        TAY
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0106AD 04:869D: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0106AE 04:869E: 48        PHA
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0106AF 04:869F: A2 00     LDX #$00
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x0106B1 04:86A1: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  ram_000A_t07,D1  ; orig: C - - - - - 0x0106B4 04:86A4: A6 0A     LDX ram_000A_t07
    MOVEA.L #tbl_8640,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0002_t26  ; orig: C - - - - - 0x0106B9 04:86A9: 85 02     STA ram_0002_t26
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #tbl_8648,A0
    MOVE.B  (A0,D2.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x0106C0 04:86B0: 85 03     STA ram_0002_t26 + $
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$03,D0  ; orig: C - - - - - 0x0106C4 04:86B4: A9 03     LDA #$03
    MOVE.B  D0,ram_0004_t09  ; orig: C - - - - - 0x0106C6 04:86B6: 85 04     STA ram_0004_t09
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x0106C8 04:86B8: A0 01     LDY #$01
b04_bra_86BA_loop:  ; orig: b04_bra_86BA_loop:

; ram_0000_t21_spr_X

; ram_0001_t15_spr_Y
    MOVEA.L #ram_0000_temp,A0
    MOVE.B  (A0,D2.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0106CD 04:86BD: 38        SEC
    ; !! SBC ram_0002_t26,Y - complex mode, manual review needed  ; orig: C - - - - - 0x0106CE 04:86BE: F9 02 00  SBC ram_0002_t26,Y
    CMPI.B  #$18,D0  ; orig: C - - - - - 0x0106D1 04:86C1: C9 18     CMP #$18
    BPL     b04_bra_86CB             ; BPL  ; orig: C - - - - - 0x0106D3 04:86C3: 10 06     BPL b04_bra_86CB
    CMPI.B  #$E8,D0  ; orig: C - - - - - 0x0106D5 04:86C5: C9 E8     CMP #$E8
    BMI     b04_bra_86CB             ; BMI  ; orig: C - - - - - 0x0106D7 04:86C7: 30 02     BMI b04_bra_86CB
    MOVE.B  (ram_0004_t09).l,D3
    LSR.B  #1,D3
    MOVE.B  D3,(ram_0004_t09).l  ; orig: C - - - - - 0x0106D9 04:86C9: 46 04     LSR ram_0004_t09

b04_bra_86CB:  ; orig: b04_bra_86CB:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0106DB 04:86CB: 88        DEY
    BPL     b04_bra_86BA_loop             ; BPL  ; orig: C - - - - - 0x0106DC 04:86CC: 10 EC     BPL b04_bra_86BA_loop
    MOVE.B  ram_0004_t09,D0  ; orig: C - - - - - 0x0106DE 04:86CE: A5 04     LDA ram_0004_t09
    BEQ     b04_bra_86D7             ; BEQ  ; orig: C - - - - - 0x0106E0 04:86D0: F0 05     BEQ b04_bra_86D7
    MOVE.B  #con_obj_id_55,D0  ; orig: C - - - - - 0x0106E2 04:86D2: A9 55     LDA #con_obj_id_55
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0106E4 04:86D4: 20 AF 82  JSR sub_82AF_create_
b04_bra_86D7:  ; orig: b04_bra_86D7:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0106E7 04:86D7: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0106E8 04:86D8: AA        TAX
b04_bra_86D9:  ; orig: b04_bra_86D9:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0106E9 04:86D9: CA        DEX
    BPL     b04_bra_867B_loop             ; BPL  ; orig: C - - - - - 0x0106EA 04:86DA: 10 9F     BPL b04_bra_867B_loop
b04_bra_86DC_RTS:  ; orig: b04_bra_86DC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0106EC 04:86DC: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0106ED 04:86DD: FF        .byte $FF, $FF, $FF 



sub_0x0106F0_try_spawning_zora_in_water:  ; orig: sub_0x0106F0_try_spawning_zora_in_water:
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x0106F0 04:86E0: A4 EB     LDY ram_map_location
    MOVEA.L #ram_687E_map_data,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$08,D0  ; orig: C - - - - - 0x0106F5 04:86E5: 29 08     AND #$08
    BEQ     b04_bra_8732_RTS             ; BEQ  ; orig: C - - - - - 0x0106F7 04:86E7: F0 49     BEQ b04_bra_8732_RTS

; if no zora in this location
    MOVE.B  ram_zora_spawn_flag,D0  ; orig: C - - - - - 0x0106F9 04:86E9: AD 14 05  LDA ram_zora_spawn_f
    BNE     b04_bra_8732_RTS             ; BNE  ; orig: C - - - - - 0x0106FC 04:86EC: D0 44     BNE b04_bra_8732_RTS

; if wasn't spawned yet
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x0106FE 04:86EE: 20 BB FE  JSR sub_0x01FECB_sea
    BEQ     b04_bra_8732_RTS             ; BEQ  ; orig: C - - - - - 0x010701 04:86F1: F0 3F     BEQ b04_bra_8732_RTS    

; bzk bug? loop for 0019-0025, but 0x01E552 works with 0018-0024
    MOVE.B  #$0D,D0  ; orig: C - - - - - 0x010703 04:86F3: A9 0D     LDA #$0D
    MOVE.B  D0,ram_000D_t06_loop_counter  ; orig: C - - - - - 0x010705 04:86F5: 85 0D     STA ram_000D_t06_loo
    MOVE.B  ram_free_obj_index,D1  ; orig: C - - - - - 0x010707 04:86F7: A6 59     LDX ram_free_obj_ind
b04_bra_86F9_loop:  ; orig: b04_bra_86F9_loop:
    MOVE.B  ram_000D_t06_loop_counter,D2  ; orig: C - - - - - 0x010709 04:86F9: A4 0D     LDY ram_000D_t06_loo
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01070E 04:86FE: 29 F0     AND #$F0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BEQ     b04_bra_872E             ; BEQ  ; orig: C - - - - - 0x010712 04:8702: F0 2A     BEQ b04_bra_872E
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x010714 04:8704: C9 F0     CMP #$F0
    BEQ     b04_bra_872E             ; BEQ  ; orig: C - - - - - 0x010716 04:8706: F0 26     BEQ b04_bra_872E
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D2.L),D0


; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01071B 04:870B: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01071C 04:870C: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01071D 04:870D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01071E 04:870E: 0A        ASL
    CMPI.B  #$50,D0  ; orig: C - - - - - 0x01071F 04:870F: C9 50     CMP #$50
    BCC     b04_bra_872E             ; BCC  ; orig: C - - - - - 0x010721 04:8711: 90 1B     BCC b04_bra_872E
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x010723 04:8713: C9 E0     CMP #$E0
    BCS     b04_bra_872E             ; BCS  ; orig: C - - - - - 0x010725 04:8715: B0 17     BCS b04_bra_872E
    ORI.B   #$0D,D0  ; orig: C - - - - - 0x010727 04:8717: 09 0D     ORA #$0D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x01072B 04:871B: 20 F4 ED  JSR sub_0x01EE04_fin
    CMPI.B  #$8D,D0  ; orig: C - - - - - 0x01072E 04:871E: C9 8D     CMP #$8D
    BCC     b04_bra_872E             ; BCC  ; orig: C - - - - - 0x010730 04:8720: 90 0C     BCC b04_bra_872E
    CMPI.B  #$99,D0  ; orig: C - - - - - 0x010732 04:8722: C9 99     CMP #$99
    BCS     b04_bra_872E             ; BCS  ; orig: C - - - - - 0x010734 04:8724: B0 08     BCS b04_bra_872E
    ADDQ.B  #1,ram_zora_spawn_flag  ; orig: C - - - - - 0x010736 04:8726: EE 14 05  INC ram_zora_spawn_f
    MOVE.B  #con_obj_id_11,D0  ; orig: C - - - - - 0x010739 04:8729: A9 11     LDA #con_obj_id_11
    JMP     loc_0x01FEC3_create_object  ; orig: C - - - - - 0x01073B 04:872B: 4C B3 FE  JMP loc_0x01FEC3_cre
b04_bra_872E:  ; orig: b04_bra_872E:
    SUBQ.B  #1,ram_000D_t06_loop_counter  ; orig: C - - - - - 0x01073E 04:872E: C6 0D     DEC ram_000D_t06_loo
    BNE     b04_bra_86F9_loop             ; BNE  ; orig: C - - - - - 0x010740 04:8730: D0 C7     BNE b04_bra_86F9_loop
b04_bra_8732_RTS:  ; orig: b04_bra_8732_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010742 04:8732: 60        RTS



tbl_8733_direction:  ; orig: tbl_8733_direction:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010743 04:8733: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x010744 04:8734: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x010745 04:8735: 05        .byte $05   ;
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x010746 04:8736: 0A        .byte $0A   ;



ofs_005_0x010747_1F:  ; orig: ofs_005_0x010747_1F:

; con_obj_id_1F

; in

; X = 01+
    MOVE.B  #$00,D0  ; orig: C - - J - - 0x010747 04:8737: A9 00     LDA #$00
    MOVE.B  D0,ram_0515  ; orig: C - - - - - 0x010749 04:8739: 8D 15 05  STA ram_0515
ofs_005_0x01074C_20:  ; orig: ofs_005_0x01074C_20:

; con_obj_id_20

; in

; X = 01+
    BSR     sub_0x01FEE6             ; JSR -> BSR  ; orig: C - - - - - 0x01074C 04:873C: 20 D6 FE  JSR sub_0x01FEE6
ofs_005_0x01074F_0D:  ; orig: ofs_005_0x01074F_0D:

; con_obj_id_0D
ofs_005_0x01074F_0E:  ; orig: ofs_005_0x01074F_0E:

; con_obj_id_0E

; in

; X = 01+
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - J - - 0x01074F 04:873F: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x010751 04:8741: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010753 04:8743: A8        TAY
    MOVEA.L #tbl_8733_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)


; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010759 04:8749: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01075A 04:874A: 0A        ASL
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01075D 04:874D: 60        RTS



ofs_005_0x01075E_0F:  ; orig: ofs_005_0x01075E_0F:

; con_obj_id_0F
ofs_005_0x01075E_10:  ; orig: ofs_005_0x01075E_10:

; con_obj_id_10

; in

; X = 01+
    MOVE.B  #$05,D0  ; orig: C - - J - - 0x01075E 04:874E: A9 05     LDA #$05
    MOVE.B  D0,ram_004D  ; orig: C - - - - - 0x010760 04:8750: 85 4D     STA ram_004D
    BSR     sub_0x01FEE6             ; JSR -> BSR  ; orig: C - - - - - 0x010762 04:8752: 20 D6 FE  JSR sub_0x01FEE6
ofs_005_0x010765_07:  ; orig: ofs_005_0x010765_07:

; con_obj_id_07
ofs_005_0x010765_09:  ; orig: ofs_005_0x010765_09:

; con_obj_id_09
ofs_005_0x010765_21:  ; orig: ofs_005_0x010765_21:

; con_obj_id_21

; in

; X = 01+
    MOVE.B  #$20,D0  ; orig: C - - J - - 0x010765 04:8755: A9 20     LDA #$20
    BNE     b04_bra_875B             ; BNE  ; orig: C - - - - - 0x010767 04:8757: D0 02     BNE b04_bra_875B    ; jm



ofs_005_0x010769_08:  ; orig: ofs_005_0x010769_08:

; con_obj_id_08
ofs_005_0x010769_0A:  ; orig: ofs_005_0x010769_0A:

; con_obj_id_0A

; in

; X = 01+
    MOVE.B  #$30,D0  ; orig: C - - J - - 0x010769 04:8759: A9 30     LDA #$30
b04_bra_875B:  ; orig: b04_bra_875B:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x01076E 04:875E: E8        INX
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x01076F 04:875F: 8A        TXA
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x010770 04:8760: CA        DEX

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010771 04:8761: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010772 04:8762: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010773 04:8763: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010774 04:8764: 0A        ASL
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01F865_clear_enemy_state             ; JSR -> BSR  ; orig: C - - - - - 0x010777 04:8767: 20 55 F8  JSR sub_0x01F865_cle
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01077D 04:876D: A9 06     LDA #$06
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_8025  ; orig: C - - - - - 0x010782 04:8772: 4C 25 80  JMP loc_8025



ofs_005_0x010785_1A:  ; orig: ofs_005_0x010785_1A:

; con_obj_id_1A

; in

; X = 01+
    BSR     sub_0x01FEE6             ; JSR -> BSR  ; orig: C - - J - - 0x010785 04:8775: 20 D6 FE  JSR sub_0x01FEE6
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x010788 04:8778: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

loc_877C:  ; orig: loc_877C:
    BSR     sub_B20B_clear_obj_stuff             ; JSR -> BSR  ; orig: C - - - - - 0x01078C 04:877C: 20 0B B2  JSR sub_B20B_clear_o
    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x01078F 04:877F: A9 A0     LDA #$A0
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x010791 04:8781: 8D D1 04  STA ram_04D1
    MOVE.B  #$1F,D0  ; orig: C - - - - - 0x010794 04:8784: A9 1F     LDA #$1F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x010799 04:8789: 60        RTS



ofs_005_0x01079A_2F:  ; orig: ofs_005_0x01079A_2F:

; con_obj_id_2F

; in

; X = 01+
    MOVE.B  #con_sfx_2_pick_up_item,D0  ; orig: - - - - - - 0x01079A 04:878A: A9 08     LDA #con_sfx_2_pick_
    MOVE.B  D0,ram_sfx_2  ; orig: - - - - - - 0x01079C 04:878C: 8D 02 06  STA ram_sfx_2
    MOVE.B  #$78,D0  ; orig: - - - - - - 0x01079F 04:878F: A9 78     LDA #$78
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$7D,D0  ; orig: - - - - - - 0x0107A3 04:8793: A9 7D     LDA #$7D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8797_RTS:  ; orig: b04_bra_8797_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0107A7 04:8797: 60        RTS



ofs_004_0x0107A8_11:  ; orig: ofs_004_0x0107A8_11:

; con_obj_id_11

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x0107A8 04:8798: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_8797_RTS             ; BNE  ; orig: C - - - - - 0x0107AB 04:879B: D0 FA     BNE b04_bra_8797_RTS
    BSR     sub_8A6D             ; JSR -> BSR  ; orig: C - - - - - 0x0107AD 04:879D: 20 6D 8A  JSR sub_8A6D
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$03,D0  ; orig: C - - - - - 0x0107B2 04:87A2: C9 03     CMP #$03
    BNE     b04_bra_87B5             ; BNE  ; orig: C - - - - - 0x0107B4 04:87A4: D0 0F     BNE b04_bra_87B5
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$FD,D0  ; orig: C - - - - - 0x0107B8 04:87A8: C9 FD     CMP #$FD
    BNE     b04_bra_87B5             ; BNE  ; orig: C - - - - - 0x0107BA 04:87AA: D0 09     BNE b04_bra_87B5
    MOVE.B  #con_obj_id_55,D0  ; orig: C - - - - - 0x0107BC 04:87AC: A9 55     LDA #con_obj_id_55
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0107BE 04:87AE: 20 AF 82  JSR sub_82AF_create_
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0107C1 04:87B1: A9 20     LDA #$20
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_87B5:  ; orig: b04_bra_87B5:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8797_RTS             ; BNE  ; orig: C - - - - - 0x0107C7 04:87B7: D0 DE     BNE b04_bra_8797_RTS
    SUBQ.B  #1,ram_zora_spawn_flag  ; orig: C - - - - - 0x0107C9 04:87B9: CE 14 05  DEC ram_zora_spawn_f
    JMP     loc_0x01FEC1_destroy_object  ; orig: C - - - - - 0x0107CC 04:87BC: 4C B1 FE  JMP loc_0x01FEC1_des



ofs_004_0x0107CF_03:  ; orig: ofs_004_0x0107CF_03:

; con_obj_id_03
ofs_004_0x0107CF_04:  ; orig: ofs_004_0x0107CF_04:

; con_obj_id_04

; in

; X = 01+
    MOVE.B  #$A0,D0  ; orig: C - - J - - 0x0107CF 04:87BF: A9 A0     LDA #$A0
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8094             ; JSR -> BSR  ; orig: C - - - - - 0x0107D4 04:87C4: 20 94 80  JSR sub_8094
    MOVE.B  #$5B,D2  ; orig: C - - - - - 0x0107D7 04:87C7: A0 5B     LDY #$5B
    JMP     loc_87D1  ; orig: C - - - - - 0x0107D9 04:87C9: 4C D1 87  JMP loc_87D1



ofs_004_0x0107DC_01:  ; orig: ofs_004_0x0107DC_01:

; con_obj_id_01
ofs_004_0x0107DC_02:  ; orig: ofs_004_0x0107DC_02:

; con_obj_id_02

; in

; X = 01+
    BSR     sub_8119             ; JSR -> BSR  ; orig: C - - J - - 0x0107DC 04:87CC: 20 19 81  JSR sub_8119
    MOVE.B  #con_obj_id_57,D2  ; orig: C - - - - - 0x0107DF 04:87CF: A0 57     LDY #con_obj_id_57
loc_87D1:  ; orig: loc_87D1:
    MOVE.B  #$20,D0  ; orig: C D 0 - - - 0x0107E1 04:87D1: A9 20     LDA #$20
sub_87D3:  ; orig: sub_87D3:
    MOVE.B  D0,ram_0001_t08  ; orig: C - - - - - 0x0107E3 04:87D3: 85 01     STA ram_0001_t08
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0107E5 04:87D5: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_03,D0  ; orig: C - - - - - 0x0107E8 04:87D8: C9 03     CMP #con_obj_id_03
    BEQ     b04_bra_87F3             ; BEQ  ; orig: C - - - - - 0x0107EA 04:87DA: F0 17     BEQ b04_bra_87F3
    CMPI.B  #con_obj_id_01,D0  ; orig: C - - - - - 0x0107EC 04:87DC: C9 01     CMP #con_obj_id_01
    BEQ     b04_bra_87F3             ; BEQ  ; orig: C - - - - - 0x0107EE 04:87DE: F0 13     BEQ b04_bra_87F3
    CMPI.B  #con_obj_id_09,D0  ; orig: C - - - - - 0x0107F0 04:87E0: C9 09     CMP #con_obj_id_09
    BEQ     b04_bra_87F3             ; BEQ  ; orig: C - - - - - 0x0107F2 04:87E2: F0 0F     BEQ b04_bra_87F3
    CMPI.B  #con_obj_id_0A,D0  ; orig: C - - - - - 0x0107F4 04:87E4: C9 0A     CMP #con_obj_id_0A
    BEQ     b04_bra_87F3             ; BEQ  ; orig: C - - - - - 0x0107F6 04:87E6: F0 0B     BEQ b04_bra_87F3
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_87F3             ; BNE  ; orig: C - - - - - 0x0107FB 04:87EB: D0 06     BNE b04_bra_87F3
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$F8,D0  ; orig: C - - - - - 0x0107FF 04:87EF: C9 F8     CMP #$F8
    BCC     b04_bra_8831_RTS             ; BCC  ; orig: C - - - - - 0x010801 04:87F1: 90 3E     BCC b04_bra_8831_RTS
b04_bra_87F3:  ; orig: b04_bra_87F3:
    MOVE.B  ram_0001_t08,D0  ; orig: C - - - - - 0x010803 04:87F3: A5 01     LDA ram_0001_t08
    MOVE.B  D2,ram_0000_t26  ; orig: C - - - - - 0x010805 04:87F5: 84 00     STY ram_0000_t26
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010807 04:87F7: 48        PHA
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x010808 04:87F8: A0 00     LDY #$00
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_880C             ; BNE  ; orig: C - - - - - 0x01080D 04:87FD: D0 0D     BNE b04_bra_880C
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010812 04:8802: 88        DEY
    BPL     b04_bra_880C             ; BPL  ; orig: C - - - - - 0x010813 04:8803: 10 07     BPL b04_bra_880C
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_882D             ; BEQ  ; orig: C - - - - - 0x010818 04:8808: F0 23     BEQ b04_bra_882D
    MOVE.B  #$30,D2  ; orig: C - - - - - 0x01081A 04:880A: A0 30     LDY #$30
b04_bra_880C:  ; orig: b04_bra_880C:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01081C 04:880C: 98        TYA
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BEQ     b04_bra_882D             ; BEQ  ; orig: C - - - - - 0x010820 04:8810: F0 1B     BEQ b04_bra_882D
    CMPI.B  #$10,D2  ; orig: C - - - - - 0x010822 04:8812: C0 10     CPY #$10
    BNE     b04_bra_8829             ; BNE  ; orig: C - - - - - 0x010824 04:8814: D0 13     BNE b04_bra_8829
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x010826 04:8816: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x010829 04:8819: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_8829             ; BNE  ; orig: C - - - - - 0x01082B 04:881B: D0 0C     BNE b04_bra_8829
    MOVE.B  ram_0000_t26,D0  ; orig: C - - - - - 0x01082D 04:881D: A5 00     LDA ram_0000_t26
    BSR     sub_8832             ; JSR -> BSR  ; orig: C - - - - - 0x01082F 04:881F: 20 32 88  JSR sub_8832
    BCC     b04_bra_882D             ; BCC  ; orig: C - - - - - 0x010832 04:8822: 90 09     BCC b04_bra_882D
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010834 04:8824: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8829:  ; orig: b04_bra_8829:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010839 04:8829: 68        PLA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01083A 04:882A: A9 00     LDA #$00
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01083C 04:882C: 48        PHA
b04_bra_882D:  ; orig: b04_bra_882D:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01083D 04:882D: 68        PLA
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8831_RTS:  ; orig: b04_bra_8831_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010841 04:8831: 60        RTS



sub_8832:  ; orig: sub_8832:
    BSR     sub_B179             ; JSR -> BSR  ; orig: C - - - - - 0x010842 04:8832: 20 79 B1  JSR sub_B179
    BCC     b04_bra_883E_RTS             ; BCC  ; orig: C - - - - - 0x010845 04:8835: 90 07     BCC b04_bra_883E_RTS
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x010847 04:8837: A9 80     LDA #$80
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0437,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x01084B 04:883B: DE 37 04  DEC ram_0437_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_883E_RTS:  ; orig: b04_bra_883E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01084E 04:883E: 60        RTS



ofs_004_0x01084F_5B:  ; orig: ofs_004_0x01084F_5B:

; con_obj_id_5B

; in

; X = 01+
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x01084F 04:883F: A9 80     LDA #$80
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_885C             ; BNE  ; orig: C - - - - - 0x010856 04:8846: D0 14     BNE b04_bra_885C
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010858 04:8848: BD AC 00  LDA a: ram_state_obj
    MOVE.B  (A0,D1.L),D0  ; ^
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01085B 04:884B: 29 F0     AND #$F0
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01085D 04:884D: C9 20     CMP #$20
    BEQ     b04_bra_8869             ; BEQ  ; orig: C - - - - - 0x01085F 04:884F: F0 18     BEQ b04_bra_8869
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x010861 04:8851: C9 10     CMP #$10
    BNE     b04_bra_887F             ; BNE  ; orig: C - - - - - 0x010863 04:8853: D0 2A     BNE b04_bra_887F

; bzk optimize, useless LDA + STA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t08_useless  ; orig: C - - - - - 0x010867 04:8857: 85 0F     STA ram_000F_t08_use
    JMP     loc_8869  ; orig: C - - - - - 0x010869 04:8859: 4C 69 88  JMP loc_8869
b04_bra_885C:  ; orig: b04_bra_885C:
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: - - - - - - 0x01086F 04:885F: B9 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D2.L),D0  ; ^
    BNE     b04_bra_8866             ; BNE  ; orig: - - - - - - 0x010872 04:8862: D0 02     BNE b04_bra_8866    ; if
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8866:  ; orig: b04_bra_8866:
    JMP     loc_0x01F58B  ; orig: - - - - - - 0x010876 04:8866: 4C 7B F5  JMP loc_0x01F58B
b04_bra_8869:  ; orig: b04_bra_8869:
loc_8869:  ; orig: loc_8869:
    BSR     sub_0x01F529             ; JSR -> BSR  ; orig: C D 0 - - - 0x010879 04:8869: 20 19 F5  JSR sub_0x01F529
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01087C 04:886C: BD AC 00  LDA a: ram_state_obj
    MOVE.B  (A0,D1.L),D0  ; ^
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01087F 04:886F: 29 F0     AND #$F0
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x010881 04:8871: C9 10     CMP #$10
    BNE     b04_bra_887F             ; BNE  ; orig: C - - - - - 0x010883 04:8873: D0 0A     BNE b04_bra_887F
    BSR     sub_8371             ; JSR -> BSR  ; orig: C - - - - - 0x010885 04:8875: 20 71 83  JSR sub_8371
    MOVE.B  ram_0006_t10_flag,D0  ; orig: C - - - - - 0x010888 04:8878: A5 06     LDA ram_0006_t10_fla
    BEQ     b04_bra_883E_RTS             ; BEQ  ; orig: C - - - - - 0x01088A 04:887A: F0 C2     BEQ b04_bra_883E_RTS
    JMP     loc_8346  ; orig: C - - - - - 0x01088C 04:887C: 4C 46 83  JMP loc_8346
b04_bra_887F:  ; orig: b04_bra_887F:
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x01088F 04:887F: C9 30     CMP #$30
    BNE     b04_bra_883E_RTS             ; BNE  ; orig: C - - - - - 0x010891 04:8881: D0 BB     BNE b04_bra_883E_RTS
    JMP     loc_834C  ; orig: C - - - - - 0x010893 04:8883: 4C 4C 83  JMP loc_834C



ofs_004_0x010896_1F:  ; orig: ofs_004_0x010896_1F:

; con_obj_id_1F

; in

; X = 01+
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_88C9_RTS             ; BNE  ; orig: C - - - - - 0x010898 04:8888: D0 3F     BNE b04_bra_88C9_RTS
    MOVE.B  ram_0515,D0  ; orig: C - - - - - 0x01089A 04:888A: AD 15 05  LDA ram_0515
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01089D 04:888D: C9 03     CMP #$03
    BEQ     b04_bra_88C2             ; BEQ  ; orig: C - - - - - 0x01089F 04:888F: F0 31     BEQ b04_bra_88C2
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x0108A1 04:8891: 20 BB FE  JSR sub_0x01FECB_sea
    BEQ     b04_bra_88C9_RTS             ; BEQ  ; orig: C - - - - - 0x0108A4 04:8894: F0 33     BEQ b04_bra_88C9_RTS    
    MOVE.B  ram_free_obj_index,D1  ; orig: C - - - - - 0x0108A6 04:8896: A6 59     LDX ram_free_obj_ind
    ADDQ.B  #1,ram_0515  ; orig: C - - - - - 0x0108A8 04:8898: EE 15 05  INC ram_0515
    MOVE.B  #con_obj_id_20,D0  ; orig: C - - - - - 0x0108AB 04:889B: A9 20     LDA #con_obj_id_20
    BSR     sub_0x01FEC3_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0108AD 04:889D: 20 B3 FE  JSR sub_0x01FEC3_cre
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0108B0 04:88A0: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  ram_0061,D2  ; orig: C - - - - - 0x0108B2 04:88A2: A4 61     LDY ram_0061
    CMPI.B  #$80,D2  ; orig: C - - - - - 0x0108B4 04:88A4: C0 80     CPY #$80
    BCS     b04_bra_88AD             ; BCS  ; orig: C - - - - - 0x0108B6 04:88A6: B0 05     BCS b04_bra_88AD
    ANDI.B  #$7F,D0  ; orig: C - - - - - 0x0108B8 04:88A8: 29 7F     AND #$7F
    JMP     loc_88AF  ; orig: C - - - - - 0x0108BA 04:88AA: 4C AF 88  JMP loc_88AF
b04_bra_88AD:  ; orig: b04_bra_88AD:
    ORI.B   #$80,D0  ; orig: C - - - - - 0x0108BD 04:88AD: 09 80     ORA #$80
loc_88AF:  ; orig: loc_88AF:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0108C1 04:88B1: A9 40     LDA #$40
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x0108C5 04:88B5: AE 40 03  LDX ram_obj_index
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x0108C8 04:88B8: A9 08     LDA #$08
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0108CA 04:88BA: 18        CLC
    ; !! ADC ram_indiv_random + $01,X - complex mode, manual review needed  ; orig: C - - - - - 0x0108CB 04:88BB: 75 19     ADC ram_indiv_random
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x0108CD 04:88BD: 29 1F     AND #$1F
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x0108D1 04:88C1: 60        RTS
b04_bra_88C2:  ; orig: b04_bra_88C2:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0108D4 04:88C4: 18        CLC
    ; !! ADC ram_indiv_random + $01,X - complex mode, manual review needed  ; orig: C - - - - - 0x0108D5 04:88C5: 75 19     ADC ram_indiv_random
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_88C9_RTS:  ; orig: b04_bra_88C9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0108D9 04:88C9: 60        RTS



tbl_88CA:  ; orig: tbl_88CA:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108DA 04:88CA: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0108DB 04:88CB: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0108DC 04:88CC: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108DD 04:88CD: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108DE 04:88CE: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x0108DF 04:88CF: 20        .byte $20   ; 05
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x0108E0 04:88D0: 20        .byte $20   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108E1 04:88D1: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108E2 04:88D2: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x0108E3 04:88D3: E0        .byte $E0   ; 09
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x0108E4 04:88D4: E0        .byte $E0   ; 0A



tbl_88D5:  ; orig: tbl_88D5:

; offset via 0x010905

; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108E5 04:88D5: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0108E6 04:88D6: 40        .byte $40   ; 01
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0108E7 04:88D7: 40        .byte $40   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108E8 04:88D8: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108E9 04:88D9: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0108EA 04:88DA: 40        .byte $40   ; 05
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0108EB 04:88DB: 40        .byte $40   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108EC 04:88DC: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108ED 04:88DD: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x0108EE 04:88DE: 30        .byte $30   ; 09
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x0108EF 04:88DF: 30        .byte $30   ; 0A

; 0B
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108F0 04:88E0: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x0108F1 04:88E1: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x0108F2 04:88E2: 80        .byte $80   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108F3 04:88E3: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108F4 04:88E4: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x0108F5 04:88E5: 80        .byte $80   ; 05
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x0108F6 04:88E6: 80        .byte $80   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108F7 04:88E7: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0108F8 04:88E8: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x0108F9 04:88E9: 50        .byte $50   ; 09
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x0108FA 04:88EA: 50        .byte $50   ; 0A

; 16
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - - - - - - 0x0108FB 04:88EB: 60        .byte $60   ; 00
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - - - - - - 0x0108FC 04:88EC: 60        .byte $60   ; 01
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - - - - - - 0x0108FD 04:88ED: 60        .byte $60   ; 02
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - - - - - - 0x0108FE 04:88EE: 60        .byte $60   ; 03
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - - - - - - 0x0108FF 04:88EF: 60        .byte $60   ; 04
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x010900 04:88F0: 60        .byte $60   ; 05
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x010901 04:88F1: 60        .byte $60   ; 06



tbl_88F2:  ; orig: tbl_88F2:
    ; [DIRECTIVE] .BYTE $FD  -- needs manual handling  ; orig: - D 0 - - - 0x010902 04:88F2: FD        .byte $FD   ; 00
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 0 - - - 0x010903 04:88F3: FC        .byte $FC   ; 01
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 0 - - - 0x010904 04:88F4: FE        .byte $FE   ; 02



tbl_88F5_offset:  ; orig: tbl_88F5_offset:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010905 04:88F5: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x010906 04:88F6: 0B        .byte $0B   ; 01
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 0 - - - 0x010907 04:88F7: 16        .byte $16   ; 02



ofs_004_0x010908_0D:  ; orig: ofs_004_0x010908_0D:

; con_obj_id_0D
ofs_004_0x010908_0E:  ; orig: ofs_004_0x010908_0E:

; con_obj_id_0E
ofs_004_0x010908_20:  ; orig: ofs_004_0x010908_20:

; con_obj_id_20

; in

; X = 01+
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8902             ; BEQ  ; orig: C - - - - - 0x01090A 04:88FA: F0 06     BEQ b04_bra_8902
    JMP     loc_0x01EEC8  ; orig: - - - - - - 0x01090C 04:88FC: 4C B8 EE  JMP loc_0x01EEC8
b04_bra_88FF:  ; orig: b04_bra_88FF:
    JMP     loc_89CB  ; orig: - - - - - - 0x01090F 04:88FF: 4C CB 89  JMP loc_89CB
b04_bra_8902:  ; orig: b04_bra_8902:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x010912 04:8902: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x010915 04:8905: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_88FF             ; BNE  ; orig: C - - - - - 0x010917 04:8907: D0 F6     BNE b04_bra_88FF
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8959             ; BNE  ; orig: C - - - - - 0x01091B 04:890B: D0 4C     BNE b04_bra_8959
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8956             ; BNE  ; orig: C - - - - - 0x01091F 04:890F: D0 45     BNE b04_bra_8956
    BSR     sub_B31A             ; JSR -> BSR  ; orig: C - - - - - 0x010921 04:8911: 20 1A B3  JSR sub_B31A
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x010926 04:8916: 29 03     AND #con_dir__LR
    BNE     b04_bra_8928             ; BNE  ; orig: C - - - - - 0x010928 04:8918: D0 0E     BNE b04_bra_8928
    MOVE.B  #con_dir_Left,D2  ; orig: C - - - - - 0x01092A 04:891A: A0 02     LDY #con_dir_Left
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x01092C 04:891C: A5 61     LDA ram_0061
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCC     b04_bra_8923             ; BCC  ; orig: C - - - - - 0x010930 04:8920: 90 01     BCC b04_bra_8923
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010932 04:8922: 88        DEY ; con_dir_Right
b04_bra_8923:  ; orig: b04_bra_8923:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x010933 04:8923: 98        TYA
    ; !! ORA ram_dir_enemy,X - needs manual review  ; orig: C - - - - - 0x010934 04:8924: 15 98     ORA ram_dir_enemy,X
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8928:  ; orig: b04_bra_8928:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010938 04:8928: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
loc_892A:  ; orig: loc_892A:
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01093D 04:892D: C9 02     CMP #$02
    BCC     b04_bra_893C             ; BCC  ; orig: C - - - - - 0x01093F 04:892F: 90 0B     BCC b04_bra_893C
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x010943 04:8933: 49 03     EOR #con_dir__LR
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010947 04:8937: A9 00     LDA #$00
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_893C:  ; orig: b04_bra_893C:
    BSR     sub_8A11             ; JSR -> BSR  ; orig: C - - - - - 0x01094C 04:893C: 20 11 8A  JSR sub_8A11
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010953 04:8943: 18        CLC
    ; !! ADC tbl_88CA,Y - complex mode, manual review needed  ; orig: C - - - - - 0x010954 04:8944: 79 CA 88  ADC tbl_88CA,Y
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8A03             ; JSR -> BSR  ; orig: C - - - - - 0x01095A 04:894A: 20 03 8A  JSR sub_8A03
    MOVEA.L #tbl_88F2,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8A4D             ; JSR -> BSR  ; orig: C - - - - - 0x010963 04:8953: 20 4D 8A  JSR sub_8A4D
b04_bra_8956:  ; orig: b04_bra_8956:
    JMP     loc_89CB  ; orig: C - - - - - 0x010966 04:8956: 4C CB 89  JMP loc_89CB
b04_bra_8959:  ; orig: b04_bra_8959:
    BSR     sub_B2CD             ; JSR -> BSR  ; orig: C - - - - - 0x010969 04:8959: 20 CD B2  JSR sub_B2CD
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x01096C 04:895C: A5 0F     LDA ram_000F_t01_dir
    BNE     b04_bra_8966             ; BNE  ; orig: C - - - - - 0x01096E 04:895E: D0 06     BNE b04_bra_8966
    MOVEA.L #$FF0451,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010970 04:8960: FE 51 04  INC ram_0451_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_892A  ; orig: C - - - - - 0x010973 04:8963: 4C 2A 89  JMP loc_892A
b04_bra_8966:  ; orig: b04_bra_8966:
    BSR     sub_8A11             ; JSR -> BSR  ; orig: C - - - - - 0x010976 04:8966: 20 11 8A  JSR sub_8A11
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010979 04:8969: A9 00     LDA #$00
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8A03             ; JSR -> BSR  ; orig: C - - - - - 0x01097E 04:896E: 20 03 8A  JSR sub_8A03
    MOVEA.L #tbl_88F5_offset,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010984 04:8974: 18        CLC
    ; !! ADC ram_dir_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x010985 04:8975: 75 98     ADC ram_dir_enemy,X
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010987 04:8977: A8        TAY
    MOVEA.L #tbl_88D5,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  #$02,D2  ; orig: C - - - - - 0x01098B 04:897B: A0 02     LDY #$02
    BSR     sub_8A21             ; JSR -> BSR  ; orig: C - - - - - 0x01098D 04:897D: 20 21 8A  JSR sub_8A21
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x010990 04:8980: A0 FF     LDY #$FF
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x010994 04:8984: 29 02     AND #con_dir_Left
    BNE     b04_bra_898A             ; BNE  ; orig: C - - - - - 0x010996 04:8986: D0 02     BNE b04_bra_898A
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x010998 04:8988: A0 01     LDY #$01
b04_bra_898A:  ; orig: b04_bra_898A:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01099A 04:898A: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01099B 04:898B: 18        CLC
    ; !! ADC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01099C 04:898C: 75 70     ADC ram_pos_X_enemy,
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    BMI     b04_bra_89CB             ; BMI  ; orig: C - - - - - 0x0109A3 04:8993: 30 36     BMI b04_bra_89CB
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0109A7 04:8997: 38        SEC
    ; !! SBC ram_0444_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x0109A8 04:8998: FD 44 04  SBC ram_0444_enemy,X
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x0109AB 04:899B: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x0109AE 04:899E: C9 03     CMP #$03
    BCS     b04_bra_89CB             ; BCS  ; orig: C - - - - - 0x0109B0 04:89A0: B0 29     BCS b04_bra_89CB
    BSR     sub_0x01F865_clear_enemy_state             ; JSR -> BSR  ; orig: C - - - - - 0x0109B2 04:89A2: 20 55 F8  JSR sub_0x01F865_cle
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x0109B5 04:89A5: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_20,D2  ; orig: C - - - - - 0x0109B8 04:89A8: C0 20     CPY #con_obj_id_20
    BEQ     b04_bra_89C9             ; BEQ  ; orig: C - - - - - 0x0109BA 04:89AA: F0 1D     BEQ b04_bra_89C9
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0109BC 04:89AC: A9 10     LDA #$10
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0109BE 04:89AE: 18        CLC
    ; !! ADC ram_indiv_random + $01,X - complex mode, manual review needed  ; orig: C - - - - - 0x0109BF 04:89AF: 75 19     ADC ram_indiv_random
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x0109C1 04:89B1: C9 20     CMP #$20
    BCS     b04_bra_89B8             ; BCS  ; orig: C - - - - - 0x0109C3 04:89B3: B0 03     BCS b04_bra_89B8
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0109C5 04:89B5: 38        SEC
    SUB.B  #$40,D0       ; SBC imm  ; orig: C - - - - - 0x0109C6 04:89B6: E9 40     SBC #$40
b04_bra_89B8:  ; orig: b04_bra_89B8:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x0109C8 04:89B8: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_0D,D2  ; orig: C - - - - - 0x0109CB 04:89BB: C0 0D     CPY #con_obj_id_0D
    BEQ     b04_bra_89C9             ; BEQ  ; orig: C - - - - - 0x0109CD 04:89BD: F0 0A     BEQ b04_bra_89C9
    ANDI.B  #$7F,D0  ; orig: C - - - - - 0x0109CF 04:89BF: 29 7F     AND #$7F
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x0109D1 04:89C1: B4 19     LDY ram_indiv_random
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #$A0,D2  ; orig: C - - - - - 0x0109D3 04:89C3: C0 A0     CPY #$A0
    BCC     b04_bra_89C9             ; BCC  ; orig: C - - - - - 0x0109D5 04:89C5: 90 02     BCC b04_bra_89C9
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0109D7 04:89C7: 29 0F     AND #$0F
b04_bra_89C9:  ; orig: b04_bra_89C9:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_89CB:  ; orig: b04_bra_89CB:
loc_89CB:  ; orig: loc_89CB:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C D 0 - - - 0x0109DB 04:89CB: 20 93 FA  JSR sub_0x01FAA3

; A = 00

; bzk optimize, useless STA
    MOVE.B  D0,ram_000D_t13_useless  ; orig: C - - - - - 0x0109DE 04:89CE: 85 0D     STA ram_000D_t13_use
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0109E0 04:89D0: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_20,D0  ; orig: C - - - - - 0x0109E3 04:89D3: C9 20     CMP #con_obj_id_20
    BEQ     b04_bra_89EC             ; BEQ  ; orig: C - - - - - 0x0109E5 04:89D5: F0 15     BEQ b04_bra_89EC
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_89E9             ; BNE  ; orig: C - - - - - 0x0109E9 04:89D9: D0 0E     BNE b04_bra_89E9
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$21,D2  ; orig: C - - - - - 0x0109ED 04:89DD: C0 21     CPY #$21
    BCC     b04_bra_89E9             ; BCC  ; orig: C - - - - - 0x0109EF 04:89DF: 90 08     BCC b04_bra_89E9
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0109F1 04:89E1: A9 10     LDA #$10
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x0109F3 04:89E3: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

b04_bra_89E9:  ; orig: b04_bra_89E9:
    JMP     loc_8C65  ; orig: C - - - - - 0x0109F9 04:89E9: 4C 65 8C  JMP loc_8C65
b04_bra_89EC:  ; orig: b04_bra_89EC:
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x0109FC 04:89EC: A9 06     LDA #$06
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x0109FE 04:89EE: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_8CAC             ; JSR -> BSR  ; orig: C - - - - - 0x010A04 04:89F4: 20 AC 8C  JSR sub_8CAC
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x010A09 04:89F9: C9 F0     CMP #$F0
    BCC     b04_bra_8A10_RTS             ; BCC  ; orig: C - - - - - 0x010A0B 04:89FB: 90 13     BCC b04_bra_8A10_RTS
    SUBQ.B  #1,ram_0515  ; orig: - - - - - - 0x010A0D 04:89FD: CE 15 05  DEC ram_0515
    JMP     loc_0x01FEC1_destroy_object  ; orig: - - - - - - 0x010A10 04:8A00: 4C B1 FE  JMP loc_0x01FEC1_des



sub_8A03:  ; orig: sub_8A03:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010A13 04:8A03: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010A16 04:8A06: 38        SEC
    SUB.B  #$0D,D0       ; SBC imm  ; orig: C - - - - - 0x010A17 04:8A07: E9 0D     SBC #$0D
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010A19 04:8A09: A8        TAY
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x010A1A 04:8A0A: C0 02     CPY #$02    ; con_ob
    BCC     b04_bra_8A10_RTS             ; BCC  ; orig: C - - - - - 0x010A1C 04:8A0C: 90 02     BCC b04_bra_8A10_RTS
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x010A1E 04:8A0E: A0 02     LDY #$02
b04_bra_8A10_RTS:  ; orig: b04_bra_8A10_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010A20 04:8A10: 60        RTS



sub_8A11:  ; orig: sub_8A11:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010A21 04:8A11: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_20,D0  ; orig: C - - - - - 0x010A24 04:8A14: C9 20     CMP #con_obj_id_20
    BNE     b04_bra_8A20_RTS             ; BNE  ; orig: C - - - - - 0x010A26 04:8A16: D0 08     BNE b04_bra_8A20_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x010A2A 04:8A1A: 29 03     AND #con_dir__LR
    ORI.B   #con_dir_Down,D0  ; orig: C - - - - - 0x010A2C 04:8A1C: 09 04     ORA #con_dir_Down
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8A20_RTS:  ; orig: b04_bra_8A20_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010A30 04:8A20: 60        RTS



sub_8A21:  ; orig: sub_8A21:

; in

; A =

; Y =
    MOVE.B  D0,ram_0000_t27  ; orig: C - - - - - 0x010A31 04:8A21: 85 00     STA ram_0000_t27
    MOVE.B  D2,ram_0002_t19  ; orig: C - - - - - 0x010A33 04:8A23: 84 02     STY ram_0002_t19
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ; !! ADC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x010A38 04:8A28: 75 84     ADC ram_pos_Y_enemy,
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010A3F 04:8A2F: 18        CLC
    MOVE.B  ram_0000_t27,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x010A40 04:8A30: 65 00     ADC ram_0000_t27

    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010A48 04:8A38: 69 00     ADC #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    CMP.B   ram_0002_t19,D0  ; orig: C - - - - - 0x010A4D 04:8A3D: C5 02     CMP ram_0002_t19
    BMI     b04_bra_8A52_RTS             ; BMI  ; orig: C - - - - - 0x010A4F 04:8A3F: 30 11     BMI b04_bra_8A52_RTS
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x010A54 04:8A44: C9 80     CMP #$80
    BCC     b04_bra_8A52_RTS             ; BCC  ; orig: C - - - - - 0x010A56 04:8A46: 90 0A     BCC b04_bra_8A52_RTS
    MOVE.B  ram_0002_t19,D0  ; orig: C - - - - - 0x010A58 04:8A48: A5 02     LDA ram_0002_t19
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

sub_8A4D:  ; orig: sub_8A4D:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010A5D 04:8A4D: A9 00     LDA #$00
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8A52_RTS:  ; orig: b04_bra_8A52_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010A62 04:8A52: 60        RTS



tbl_8A53:  ; orig: tbl_8A53:
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010A63 04:8A53: 08        .byte $08   ; 00
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x010A64 04:8A54: 0A        .byte $0A   ; 01
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010A65 04:8A55: 10        .byte $10   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x010A66 04:8A56: 20        .byte $20   ; 03
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010A67 04:8A57: 10        .byte $10   ; 04
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x010A68 04:8A58: 0A        .byte $0A   ; 05



tbl_8A59:  ; orig: tbl_8A59:
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 0 - - - 0x010A69 04:8A59: 80        .byte $80   ; 00
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x010A6A 04:8A5A: 20        .byte $20   ; 01
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 0 - - - 0x010A6B 04:8A5B: 0F        .byte $0F   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x010A6C 04:8A5C: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010A6D 04:8A5D: 10        .byte $10   ; 04
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 0 - - - 0x010A6E 04:8A5E: 60        .byte $60   ; 05



tbl_8A5F:  ; orig: tbl_8A5F:
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010A6F 04:8A5F: 10        .byte $10   ; 00
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x010A70 04:8A60: 0B        .byte $0B   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010A71 04:8A61: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x010A72 04:8A62: 05        .byte $05   ; 03
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010A73 04:8A63: 01        .byte $01   ; 04
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 0 - - - 0x010A74 04:8A64: 0B        .byte $0B   ; 05



ofs_004_0x010A75_0F:  ; orig: ofs_004_0x010A75_0F:

; con_obj_id_0F

; in

; X = 01+
    MOVE.B  #$A0,D0  ; orig: C - - J - - 0x010A75 04:8A65: A9 A0     LDA #$A0
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8094             ; JSR -> BSR  ; orig: C - - - - - 0x010A7A 04:8A6A: 20 94 80  JSR sub_8094
sub_8A6D:  ; orig: sub_8A6D:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8AA1             ; BNE  ; orig: C - - - - - 0x010A7F 04:8A6F: D0 30     BNE b04_bra_8AA1
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010A81 04:8A71: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_11,D0  ; orig: C - - - - - 0x010A84 04:8A74: C9 11     CMP #con_obj_id_11
    BNE     b04_bra_8A88             ; BNE  ; orig: C - - - - - 0x010A86 04:8A76: D0 10     BNE b04_bra_8A88
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010A8A 04:8A7A: 88        DEY
    BNE     b04_bra_8A88             ; BNE  ; orig: C - - - - - 0x010A8B 04:8A7B: D0 0B     BNE b04_bra_8A88
    MOVE.B  #con_dir__LR,D2  ; orig: C - - - - - 0x010A8D 04:8A7D: A0 03     LDY #con_dir__LR
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMP.B   ram_pos_Y_link,D0  ; orig: C - - - - - 0x010A91 04:8A81: C5 84     CMP ram_pos_Y_link
    BCS     b04_bra_8A86             ; BCS  ; orig: C - - - - - 0x010A93 04:8A83: B0 01     BCS b04_bra_8A86
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010A95 04:8A85: 88        DEY ; con_dir_Left
b04_bra_8A86:  ; orig: b04_bra_8A86:
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010A96 04:8A86: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
b04_bra_8A88:  ; orig: b04_bra_8A88:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010A9A 04:8A8A: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010A9B 04:8A8B: 69 01     ADC #$01
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x010A9D 04:8A8D: C9 06     CMP #$06
    BCC     b04_bra_8A93             ; BCC  ; orig: C - - - - - 0x010A9F 04:8A8F: 90 02     BCC b04_bra_8A93
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010AA1 04:8A91: A9 00     LDA #$00
b04_bra_8A93:  ; orig: b04_bra_8A93:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010AA5 04:8A95: A8        TAY
    MOVEA.L #tbl_8A53,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #tbl_8A59,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8AA1:  ; orig: b04_bra_8AA1:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_8A5F,A0
    MOVE.B  (A0,D2.L),D0

loc_8AA6:  ; orig: loc_8AA6:
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C D 0 - - - 0x010AB6 04:8AA6: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8AF6_RTS             ; BEQ  ; orig: C - - - - - 0x010ABB 04:8AAB: F0 49     BEQ b04_bra_8AF6_RTS
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010ABD 04:8AAD: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_11,D2  ; orig: C - - - - - 0x010AC0 04:8AB0: C0 11     CPY #con_obj_id_11
    BNE     b04_bra_8AC2             ; BNE  ; orig: C - - - - - 0x010AC2 04:8AB2: D0 0E     BNE b04_bra_8AC2
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$02,D2  ; orig: C - - - - - 0x010AC6 04:8AB6: C0 02     CPY #$02
    BCC     b04_bra_8AC2             ; BCC  ; orig: C - - - - - 0x010AC8 04:8AB8: 90 08     BCC b04_bra_8AC2
    CMPI.B  #$05,D2  ; orig: C - - - - - 0x010ACA 04:8ABA: C0 05     CPY #$05
    BCS     b04_bra_8AC2             ; BCS  ; orig: C - - - - - 0x010ACC 04:8ABC: B0 04     BCS b04_bra_8AC2
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8ACA             ; BNE  ; orig: C - - - - - 0x010AD0 04:8AC0: D0 08     BNE b04_bra_8ACA
b04_bra_8AC2:  ; orig: b04_bra_8AC2:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010AD2 04:8AC2: 38        SEC
    SUB.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x010AD3 04:8AC3: E9 01     SBC #$01
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010AD5 04:8AC5: 0A        ASL
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010AD6 04:8AC6: 18        CLC
    ; !! ADC ram_obj_anim_id,X - complex mode, manual review needed  ; orig: C - - - - - 0x010AD7 04:8AC7: 7D E4 03  ADC ram_obj_anim_id,
b04_bra_8ACA:  ; orig: b04_bra_8ACA:
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x010ADA 04:8ACA: 20 DB 77  JSR sub_bat_77DB
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010ADD 04:8ACD: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_11,D0  ; orig: C - - - - - 0x010AE0 04:8AD0: C9 11     CMP #con_obj_id_11
    BNE     b04_bra_8ADE             ; BNE  ; orig: C - - - - - 0x010AE2 04:8AD2: D0 0A     BNE b04_bra_8ADE
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x010AE6 04:8AD6: C9 02     CMP #$02
    BEQ     b04_bra_8AE4             ; BEQ  ; orig: C - - - - - 0x010AE8 04:8AD8: F0 0A     BEQ b04_bra_8AE4
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x010AEA 04:8ADA: C9 04     CMP #$04
    BEQ     b04_bra_8AE4             ; BEQ  ; orig: C - - - - - 0x010AEC 04:8ADC: F0 06     BEQ b04_bra_8AE4
b04_bra_8ADE:  ; orig: b04_bra_8ADE:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$03,D0  ; orig: C - - - - - 0x010AF0 04:8AE0: C9 03     CMP #$03
    BNE     b04_bra_8AF6_RTS             ; BNE  ; orig: C - - - - - 0x010AF2 04:8AE2: D0 12     BNE b04_bra_8AF6_RTS
b04_bra_8AE4:  ; orig: b04_bra_8AE4:
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x010AF4 04:8AE4: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8AF6_RTS             ; BEQ  ; orig: C - - - - - 0x010AFA 04:8AEA: F0 0A     BEQ b04_bra_8AF6_RTS
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010AFC 04:8AEC: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_10,D0  ; orig: C - - - - - 0x010AFF 04:8AEF: C9 10     CMP #con_obj_id_10
    BNE     b04_bra_8AF6_RTS             ; BNE  ; orig: C - - - - - 0x010B01 04:8AF1: D0 03     BNE b04_bra_8AF6_RTS
    SUBQ.B  #1,ram_0510_counter  ; orig: C - - - - - 0x010B03 04:8AF3: CE 10 05  DEC ram_0510_counter
b04_bra_8AF6_RTS:  ; orig: b04_bra_8AF6_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010B06 04:8AF6: 60        RTS



tbl_8AF7:  ; orig: tbl_8AF7:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B07 04:8AF7: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B08 04:8AF8: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B09 04:8AF9: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x010B0A 04:8AFA: 20        .byte $20   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B0B 04:8AFB: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B0C 04:8AFC: 00        .byte $00   ; 05



tbl_8AFD:  ; orig: tbl_8AFD:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010B0D 04:8AFD: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010B0E 04:8AFE: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B0F 04:8AFF: 08        .byte $08   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x010B10 04:8B00: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B11 04:8B01: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010B12 04:8B02: 10        .byte $10   ; 05



tbl_8B03:  ; orig: tbl_8B03:
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x010B13 04:8B03: 10        .byte $10   ; 00
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B14 04:8B04: 08        .byte $08   ; 01
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B15 04:8B05: 08        .byte $08   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x010B16 04:8B06: 05        .byte $05   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B17 04:8B07: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x010B18 04:8B08: 08        .byte $08   ; 05



ofs_004_0x010B19_10:  ; orig: ofs_004_0x010B19_10:

; con_obj_id_10

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8B10             ; BEQ  ; orig: C - - - - - 0x010B1B 04:8B0B: F0 03     BEQ b04_bra_8B10
    JMP     loc_8B9D  ; orig: C - - - - - 0x010B1D 04:8B0D: 4C 9D 8B  JMP loc_8B9D
b04_bra_8B10:  ; orig: b04_bra_8B10:
    MOVE.B  ram_004D,D0  ; orig: C - - - - - 0x010B20 04:8B10: A5 4D     LDA ram_004D
    BNE     b04_bra_8B4D_RTS             ; BNE  ; orig: C - - - - - 0x010B22 04:8B12: D0 39     BNE b04_bra_8B4D_RTS
    MOVE.B  ram_0510_counter,D0  ; orig: C - - - - - 0x010B24 04:8B14: AD 10 05  LDA ram_0510_counter
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x010B27 04:8B17: C9 02     CMP #$02
    BCS     b04_bra_8B4D_RTS             ; BCS  ; orig: C - - - - - 0x010B29 04:8B19: B0 32     BCS b04_bra_8B4D_RTS
    MOVE.B  ram_dir_link,D0  ; orig: C - - - - - 0x010B2B 04:8B1B: A5 98     LDA ram_dir_link
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010B2F 04:8B1F: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x010B31 04:8B21: C9 C0     CMP #$C0
    BCC     b04_bra_8B28             ; BCC  ; orig: C - - - - - 0x010B33 04:8B23: 90 03     BCC b04_bra_8B28
    BSR     sub_0x01F1E0             ; JSR -> BSR  ; orig: C - - - - - 0x010B35 04:8B25: 20 D0 F1  JSR sub_0x01F1E0
b04_bra_8B28:  ; orig: b04_bra_8B28:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x010B3A 04:8B2A: 29 0C     AND #con_dir__UD
    BEQ     b04_bra_8B4E             ; BEQ  ; orig: C - - - - - 0x010B3C 04:8B2C: F0 20     BEQ b04_bra_8B4E
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x010B3E 04:8B2E: A5 70     LDA ram_pos_X_link
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$28,D2  ; orig: C - - - - - 0x010B42 04:8B32: A0 28     LDY #$28
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x010B46 04:8B36: 29 08     AND #con_dir_Up
    BEQ     b04_bra_8B3C             ; BEQ  ; orig: C - - - - - 0x010B48 04:8B38: F0 02     BEQ b04_bra_8B3C
    MOVE.B  #$D8,D2  ; orig: C - - - - - 0x010B4A 04:8B3A: A0 D8     LDY #$D8
b04_bra_8B3C:  ; orig: b04_bra_8B3C:
    MOVE.B  D2,ram_0000_t34_pos_Y  ; orig: C - - - - - 0x010B4C 04:8B3C: 84 00     STY ram_0000_t34_pos
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010B4E 04:8B3E: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010B50 04:8B40: 18        CLC
    MOVE.B  ram_0000_t34_pos_Y,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x010B51 04:8B41: 65 00     ADC ram_0000_t34_pos

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x010B53 04:8B43: 29 F0     AND #$F0
    ORI.B   #$0D,D0  ; orig: C - - - - - 0x010B55 04:8B45: 09 0D     ORA #$0D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$5D,D0  ; orig: C - - - - - 0x010B59 04:8B49: C9 5D     CMP #$5D
    BCS     b04_bra_8B84             ; BCS  ; orig: C - - - - - 0x010B5B 04:8B4B: B0 37     BCS b04_bra_8B84
b04_bra_8B4D_RTS:  ; orig: b04_bra_8B4D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010B5D 04:8B4D: 60        RTS
b04_bra_8B4E:  ; orig: b04_bra_8B4E:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010B5E 04:8B4E: A5 84     LDA ram_pos_Y_link
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$5D,D0  ; orig: C - - - - - 0x010B62 04:8B52: C9 5D     CMP #$5D
    BCC     b04_bra_8B4D_RTS             ; BCC  ; orig: C - - - - - 0x010B64 04:8B54: 90 F7     BCC b04_bra_8B4D_RTS
    MOVE.B  #$28,D2  ; orig: C - - - - - 0x010B66 04:8B56: A0 28     LDY #$28
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x010B6A 04:8B5A: 29 02     AND #con_dir_Left
    BEQ     b04_bra_8B60             ; BEQ  ; orig: C - - - - - 0x010B6C 04:8B5C: F0 02     BEQ b04_bra_8B60
    MOVE.B  #$D8,D2  ; orig: C - - - - - 0x010B6E 04:8B5E: A0 D8     LDY #$D8
b04_bra_8B60:  ; orig: b04_bra_8B60:
    MOVE.B  D2,ram_0000_t35_pos_X  ; orig: C - - - - - 0x010B70 04:8B60: 84 00     STY ram_0000_t35_pos
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x010B72 04:8B62: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0001_t07_pos_X_1  ; orig: C - - - - - 0x010B74 04:8B64: 85 01     STA ram_0001_t07_pos
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010B76 04:8B66: 18        CLC
    MOVE.B  ram_0000_t35_pos_X,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x010B77 04:8B67: 65 00     ADC ram_0000_t35_pos

    ANDI.B  #$F8,D0  ; orig: C - - - - - 0x010B79 04:8B69: 29 F8     AND #$F8
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,ram_0002_t11_pos_X_2  ; orig: C - - - - - 0x010B7D 04:8B6D: 85 02     STA ram_0002_t11_pos
    CMP.B   ram_0001_t07_pos_X_1,D0  ; orig: C - - - - - 0x010B7F 04:8B6F: C5 01     CMP ram_0001_t07_pos
    BCC     b04_bra_8B7B             ; BCC  ; orig: C - - - - - 0x010B81 04:8B71: 90 08     BCC b04_bra_8B7B

; swap positions
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010B83 04:8B73: 48        PHA
    MOVE.B  ram_0001_t07_pos_X_1,D0  ; orig: C - - - - - 0x010B84 04:8B74: A5 01     LDA ram_0001_t07_pos
    MOVE.B  D0,ram_0002_t11_pos_X_2  ; orig: C - - - - - 0x010B86 04:8B76: 85 02     STA ram_0002_t11_pos
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010B88 04:8B78: 68        PLA
    MOVE.B  D0,ram_0001_t07_pos_X_1  ; orig: C - - - - - 0x010B89 04:8B79: 85 01     STA ram_0001_t07_pos
b04_bra_8B7B:  ; orig: b04_bra_8B7B:
    MOVE.B  ram_0001_t07_pos_X_1,D0  ; orig: C - - - - - 0x010B8B 04:8B7B: A5 01     LDA ram_0001_t07_pos
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010B8D 04:8B7D: 38        SEC
    MOVE.B  ram_0002_t11_pos_X_2,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x010B8E 04:8B7E: E5 02     SBC ram_0002_t11_pos

    CMPI.B  #$30,D0  ; orig: C - - - - - 0x010B90 04:8B80: C9 30     CMP #$30
    BCS     b04_bra_8B4D_RTS             ; BCS  ; orig: C - - - - - 0x010B92 04:8B82: B0 C9     BCS b04_bra_8B4D_RTS
b04_bra_8B84:  ; orig: b04_bra_8B84:
    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x010B94 04:8B84: 20 F4 ED  JSR sub_0x01EE04_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x010B97 04:8B87: CD 4A 03  CMP ram_min_collisio
    BCS     b04_bra_8B4D_RTS             ; BCS  ; orig: C - - - - - 0x010B9A 04:8B8A: B0 C1     BCS b04_bra_8B4D_RTS
    ADDQ.B  #1,ram_0510_counter  ; orig: C - - - - - 0x010B9C 04:8B8C: EE 10 05  INC ram_0510_counter
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x010B9F 04:8B8F: A9 01     LDA #$01
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010BA4 04:8B94: 0A        ASL ; 02
    MOVE.B  D0,ram_004D  ; orig: C - - - - - 0x010BA5 04:8B95: 85 4D     STA ram_004D
    BSR     sub_8BDA             ; JSR -> BSR  ; orig: C - - - - - 0x010BA7 04:8B97: 20 DA 8B  JSR sub_8BDA
    BSR     sub_0x01F1E0             ; JSR -> BSR  ; orig: C - - - - - 0x010BAA 04:8B9A: 20 D0 F1  JSR sub_0x01F1E0
loc_8B9D:  ; orig: loc_8B9D:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$03,D0  ; orig: C - - - - - 0x010BAF 04:8B9F: C9 03     CMP #$03
    BNE     b04_bra_8BD6             ; BNE  ; orig: C - - - - - 0x010BB1 04:8BA1: D0 33     BNE b04_bra_8BD6
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8BAD             ; BEQ  ; orig: C - - - - - 0x010BB5 04:8BA5: F0 06     BEQ b04_bra_8BAD
    BSR     sub_0x01EEC8             ; JSR -> BSR  ; orig: C - - - - - 0x010BB7 04:8BA7: 20 B8 EE  JSR sub_0x01EEC8
    JMP     loc_8BF6  ; orig: C - - - - - 0x010BBA 04:8BAA: 4C F6 8B  JMP loc_8BF6
b04_bra_8BAD:  ; orig: b04_bra_8BAD:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x010BBD 04:8BAD: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x010BC0 04:8BB0: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_8BF6             ; BNE  ; orig: C - - - - - 0x010BC2 04:8BB2: D0 42     BNE b04_bra_8BF6
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x010BC6 04:8BB6: 85 0F     STA ram_000F_t01_dir
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x010BC8 04:8BB8: 20 FA ED  JSR sub_0x01EE0A_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x010BCB 04:8BBB: CD 4A 03  CMP ram_min_collisio
    BCS     b04_bra_8BDA             ; BCS  ; orig: C - - - - - 0x010BCE 04:8BBE: B0 1A     BCS b04_bra_8BDA
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x010BD0 04:8BC0: 20 B8 6F  JSR sub_bat_6FB8
    BEQ     b04_bra_8BDA             ; BEQ  ; orig: C - - - - - 0x010BD3 04:8BC3: F0 15     BEQ b04_bra_8BDA
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x010BD5 04:8BC5: 20 8D F0  JSR sub_0x01F09D
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x010BDB 04:8BCB: 29 0F     AND #$0F
    BNE     b04_bra_8BD2             ; BNE  ; orig: C - - - - - 0x010BDD 04:8BCD: D0 03     BNE b04_bra_8BD2
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8BD2:  ; orig: b04_bra_8BD2:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x010BE2 04:8BD2: A9 FF     LDA #$FF
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8BD6:  ; orig: b04_bra_8BD6:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8BF6             ; BNE  ; orig: C - - - - - 0x010BE8 04:8BD8: D0 1C     BNE b04_bra_8BF6
b04_bra_8BDA:  ; orig: b04_bra_8BDA:
sub_8BDA:  ; orig: sub_8BDA:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010BEC 04:8BDC: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010BED 04:8BDD: 69 01     ADC #$01
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x010BEF 04:8BDF: C9 06     CMP #$06
    BCC     b04_bra_8BE8             ; BCC  ; orig: C - - - - - 0x010BF1 04:8BE1: 90 05     BCC b04_bra_8BE8
    SUBQ.B  #1,ram_0510_counter  ; orig: C - - - - - 0x010BF3 04:8BE3: CE 10 05  DEC ram_0510_counter
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010BF6 04:8BE6: A9 00     LDA #$00
b04_bra_8BE8:  ; orig: b04_bra_8BE8:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010BFA 04:8BEA: A8        TAY
    MOVEA.L #tbl_8AF7,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #tbl_8AFD,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8BF6:  ; orig: b04_bra_8BF6:
loc_8BF6:  ; orig: loc_8BF6:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_8B03,A0
    MOVE.B  (A0,D2.L),D0

    JMP     loc_8AA6  ; orig: C - - - - - 0x010C0B 04:8BFB: 4C A6 8A  JMP loc_8AA6



; bzk garbage
    RTS                     ; RTS  ; orig: - - - - - - 0x010C0E 04:8BFE: 60        RTS



ofs_004_0x010C0F_07:  ; orig: ofs_004_0x010C0F_07:

; con_obj_id_07
ofs_004_0x010C0F_08:  ; orig: ofs_004_0x010C0F_08:

; con_obj_id_08
ofs_004_0x010C0F_09:  ; orig: ofs_004_0x010C0F_09:

; con_obj_id_09
ofs_004_0x010C0F_0A:  ; orig: ofs_004_0x010C0F_0A:

; con_obj_id_0A

; in

; X = 01+
    MOVE.B  #$A0,D0  ; orig: C - - J - - 0x010C0F 04:8BFF: A9 A0     LDA #$A0
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010C11 04:8C01: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #$09,D2  ; orig: C - - - - - 0x010C14 04:8C04: C0 09     CPY #$09
    BCS     b04_bra_8C0A             ; BCS  ; orig: C - - - - - 0x010C16 04:8C06: B0 02     BCS b04_bra_8C0A
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x010C18 04:8C08: A9 70     LDA #$70
b04_bra_8C0A:  ; orig: b04_bra_8C0A:
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8094             ; JSR -> BSR  ; orig: C - - - - - 0x010C1D 04:8C0D: 20 94 80  JSR sub_8094
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x010C20 04:8C10: A9 20     LDA #$20
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010C22 04:8C12: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_07,D2  ; orig: C - - - - - 0x010C25 04:8C15: C0 07     CPY #con_obj_id_07
    BEQ     b04_bra_8C1E             ; BEQ  ; orig: C - - - - - 0x010C27 04:8C17: F0 05     BEQ b04_bra_8C1E
    CMPI.B  #con_obj_id_09,D2  ; orig: C - - - - - 0x010C29 04:8C19: C0 09     CPY #con_obj_id_09
    BEQ     b04_bra_8C1E             ; BEQ  ; orig: C - - - - - 0x010C2B 04:8C1B: F0 01     BEQ b04_bra_8C1E
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x010C2D 04:8C1D: 0A        ASL
b04_bra_8C1E:  ; orig: b04_bra_8C1E:
    MOVE.B  #con_obj_id_53,D2  ; orig: C - - - - - 0x010C2E 04:8C1E: A0 53     LDY #con_obj_id_53
    BSR     sub_87D3             ; JSR -> BSR  ; orig: C - - - - - 0x010C30 04:8C20: 20 D3 87  JSR sub_87D3
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010C33 04:8C23: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010C38 04:8C28: A8        TAY
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x010C39 04:8C29: 29 0C     AND #con_dir__UD
    BEQ     b04_bra_8C37             ; BEQ  ; orig: C - - - - - 0x010C3B 04:8C2B: F0 0A     BEQ b04_bra_8C37
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x010C3D 04:8C2D: A9 02     LDA #$02
    CMPI.B  #con_dir_Up,D2  ; orig: C - - - - - 0x010C3F 04:8C2F: C0 08     CPY #con_dir_Up
    BNE     b04_bra_8C3F             ; BNE  ; orig: C - - - - - 0x010C41 04:8C31: D0 0C     BNE b04_bra_8C3F
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x010C43 04:8C33: A9 01     LDA #$01
    BNE     b04_bra_8C3F             ; BNE  ; orig: C - - - - - 0x010C45 04:8C35: D0 08     BNE b04_bra_8C3F    ; jm
b04_bra_8C37:  ; orig: b04_bra_8C37:
    CMPI.B  #con_dir_Right,D2  ; orig: C - - - - - 0x010C47 04:8C37: C0 01     CPY #con_dir_Right
    BNE     b04_bra_8C3D             ; BNE  ; orig: C - - - - - 0x010C49 04:8C39: D0 02     BNE b04_bra_8C3D
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x010C4B 04:8C3B: E6 0F     INC ram_000F_t04_fla
b04_bra_8C3D:  ; orig: b04_bra_8C3D:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010C4D 04:8C3D: A9 00     LDA #$00
b04_bra_8C3F:  ; orig: b04_bra_8C3F:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010C4F 04:8C3F: 48        PHA
    MOVEA.L #$FF03D0,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x010C50 04:8C40: DE D0 03  DEC ram_anim_timer_o
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_8C51             ; BNE  ; orig: C - - - - - 0x010C53 04:8C43: D0 0C     BNE b04_bra_8C51
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x010C55 04:8C45: A9 06     LDA #$06
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010C5A 04:8C4A: 4A        LSR
    ; !! EOR ram_obj_anim_id,X - needs manual review  ; orig: C - - - - - 0x010C5B 04:8C4B: 5D E4 03  EOR ram_obj_anim_id,
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8C51:  ; orig: b04_bra_8C51:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010C61 04:8C51: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010C62 04:8C52: 18        CLC
    ; !! ADC ram_obj_anim_id,X - complex mode, manual review needed  ; orig: C - - - - - 0x010C63 04:8C53: 7D E4 03  ADC ram_obj_anim_id,
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010C66 04:8C56: 48        PHA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x010C69 04:8C59: 29 0C     AND #con_dir__UD
    BNE     b04_bra_8C64             ; BNE  ; orig: C - - - - - 0x010C6B 04:8C5B: D0 07     BNE b04_bra_8C64
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010C6D 04:8C5D: 68        PLA
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x010C6E 04:8C5E: 20 DF 77  JSR sub_bat_77DF
    JMP     loc_bat_79D0  ; orig: C - - - - - 0x010C71 04:8C61: 4C D0 79  JMP loc_bat_79D0
b04_bra_8C64:  ; orig: b04_bra_8C64:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010C74 04:8C64: 68        PLA
loc_8C65:  ; orig: loc_8C65:
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C D 0 - - - 0x010C75 04:8C65: 20 DB 77  JSR sub_bat_77DB
    JMP     loc_bat_79D0  ; orig: C - - - - - 0x010C78 04:8C68: 4C D0 79  JMP loc_bat_79D0



ofs_004_0x010C7B_21:  ; orig: ofs_004_0x010C7B_21:

; con_obj_id_21

; in

; X = 01+
    MOVE.B  #$FF,D0  ; orig: C - - J - - 0x010C7B 04:8C6B: A9 FF     LDA #$FF
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x010C7D 04:8C6D: 20 6E 80  JSR sub_806E
    BSR     sub_8C8D             ; JSR -> BSR  ; orig: C - - - - - 0x010C80 04:8C70: 20 8D 8C  JSR sub_8C8D
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x010C83 04:8C73: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8C8C_RTS             ; BEQ  ; orig: C - - - - - 0x010C89 04:8C79: F0 11     BEQ b04_bra_8C8C_RTS
    MOVE.B  #$0B,D2  ; orig: - - - - - - 0x010C8B 04:8C7B: A0 0B     LDY #$0B
b04_bra_8C7D_loop:  ; orig: b04_bra_8C7D_loop:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: - - - - - - 0x010C8D 04:8C7D: B9 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D2.L),D0  ; ^
    CMPI.B  #con_obj_id_22,D0  ; orig: - - - - - - 0x010C90 04:8C80: C9 22     CMP #con_obj_id_22
    BNE     b04_bra_8C89             ; BNE  ; orig: - - - - - - 0x010C92 04:8C82: D0 05     BNE b04_bra_8C89
    MOVE.B  #$11,D0  ; orig: - - - - - - 0x010C94 04:8C84: A9 11     LDA #$11
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  D0,(A0,D2.L)

b04_bra_8C89:  ; orig: b04_bra_8C89:
    SUBQ.B  #1,D2           ; DEY  ; orig: - - - - - - 0x010C99 04:8C89: 88        DEY
    BNE     b04_bra_8C7D_loop             ; BNE  ; orig: - - - - - - 0x010C9A 04:8C8A: D0 F1     BNE b04_bra_8C7D_loop
b04_bra_8C8C_RTS:  ; orig: b04_bra_8C8C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010C9C 04:8C8C: 60        RTS



sub_8C8D:  ; orig: sub_8C8D:
b04_loc_8C8D:  ; orig: b04_loc_8C8D:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010C9D 04:8C8D: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    MOVE.B  D0,ram_000D_t07  ; orig: C - - - - - 0x010CA0 04:8C90: 85 0D     STA ram_000D_t07
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x010CA4 04:8C94: 29 08     AND #con_dir_Up
    BNE     b04_bra_8CA2             ; BNE  ; orig: C - - - - - 0x010CA6 04:8C96: D0 0A     BNE b04_bra_8CA2
    ADDQ.B  #1,ram_000D_t07  ; orig: C - - - - - 0x010CA8 04:8C98: E6 0D     INC ram_000D_t07    
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Right,D0  ; orig: C - - - - - 0x010CAC 04:8C9C: 29 01     AND #con_dir_Right
    BEQ     b04_bra_8CAA             ; BEQ  ; orig: C - - - - - 0x010CAE 04:8C9E: F0 0A     BEQ b04_bra_8CAA
    BNE     b04_bra_8CA8             ; BNE  ; orig: C - - - - - 0x010CB0 04:8CA0: D0 06     BNE b04_bra_8CA8    ; jm
b04_bra_8CA2:  ; orig: b04_bra_8CA2:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x010CB4 04:8CA4: 29 02     AND #con_dir_Left
    BEQ     b04_bra_8CAA             ; BEQ  ; orig: C - - - - - 0x010CB6 04:8CA6: F0 02     BEQ b04_bra_8CAA
b04_bra_8CA8:  ; orig: b04_bra_8CA8:
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x010CB8 04:8CA8: E6 0F     INC ram_000F_t04_fla
b04_bra_8CAA:  ; orig: b04_bra_8CAA:
    MOVE.B  ram_000D_t07,D0  ; orig: C - - - - - 0x010CBA 04:8CAA: A5 0D     LDA ram_000D_t07
sub_8CAC:  ; orig: sub_8CAC:

; in

; A =
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x010CBC 04:8CAC: 20 DF 77  JSR sub_bat_77DF
    JMP     loc_bat_7AA7  ; orig: C - - - - - 0x010CBF 04:8CAF: 4C A7 7A  JMP loc_bat_7AA7



tbl_8CB2:  ; orig: tbl_8CB2:
    ; [DIRECTIVE] .BYTE con_map_location + $24  -- needs manual handling  ; orig: - D 0 - - - 0x010CC2 04:8CB2: 24        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $0B  -- needs manual handling  ; orig: - D 0 - - - 0x010CC3 04:8CB3: 0B        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $1C  -- needs manual handling  ; orig: - D 0 - - - 0x010CC4 04:8CB4: 1C        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $22  -- needs manual handling  ; orig: - D 0 - - - 0x010CC5 04:8CB5: 22        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $34  -- needs manual handling  ; orig: - D 0 - - - 0x010CC6 04:8CB6: 34        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $3D  -- needs manual handling  ; orig: - D 0 - - - 0x010CC7 04:8CB7: 3D        .byte con_map_locati
    ; [DIRECTIVE] .BYTE con_map_location + $4E  -- needs manual handling  ; orig: - D 0 - - - 0x010CC8 04:8CB8: 4E        .byte con_map_locati



tbl_8CB9_pos_X:  ; orig: tbl_8CB9_pos_X:
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x010CC9 04:8CB9: E0        .byte $E0   ; 00
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 0 - - - 0x010CCA 04:8CBA: B0        .byte $B0   ; 01
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - - - - - - 0x010CCB 04:8CBB: B0        .byte $B0   ; 02
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x010CCC 04:8CBC: 30        .byte $30   ; 03
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x010CCD 04:8CBD: 40        .byte $40   ; 04
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - - - - - - 0x010CCE 04:8CBE: 90        .byte $90   ; 05
    ; [DIRECTIVE] .BYTE $A0  -- needs manual handling  ; orig: - - - - - - 0x010CCF 04:8CBF: A0        .byte $A0   ; 06



ofs_005_0x010CD0_1E:  ; orig: ofs_005_0x010CD0_1E:

; con_obj_id_1E
ofs_005_0x010CD0_22:  ; orig: ofs_005_0x010CD0_22:

; con_obj_id_22

; in

; X = 01+
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0492_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BNE     b04_bra_8D2B             ; BNE  ; orig: C - - - - - 0x010CD5 04:8CC5: D0 64     BNE b04_bra_8D2B
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010CD7 04:8CC7: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_22,D0  ; orig: C - - - - - 0x010CDA 04:8CCA: C9 22     CMP #con_obj_id_22
    BEQ     b04_bra_8D2B             ; BEQ  ; orig: C - - - - - 0x010CDC 04:8CCC: F0 5D     BEQ b04_bra_8D2B
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x010CDE 04:8CCE: A9 70     LDA #$70
    MOVE.B  D0,ram_0000_t28  ; orig: C - - - - - 0x010CE0 04:8CD0: 85 00     STA ram_0000_t28
    MOVE.B  #$06,D2  ; orig: C - - - - - 0x010CE2 04:8CD2: A0 06     LDY #$06
b04_bra_8CD4_loop:  ; orig: b04_bra_8CD4_loop:
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x010CE4 04:8CD4: A5 EB     LDA ram_map_location
    MOVEA.L #tbl_8CB2,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_8D02             ; BNE  ; orig: C - - - - - 0x010CE9 04:8CD9: D0 27     BNE b04_bra_8D02
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #tbl_8CB9_pos_X,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_8D02             ; BNE  ; orig: C - - - - - 0x010CF0 04:8CE0: D0 20     BNE b04_bra_8D02
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x010CF4 04:8CE4: C9 80     CMP #$80
    BNE     b04_bra_8D02             ; BNE  ; orig: C - - - - - 0x010CF6 04:8CE6: D0 1A     BNE b04_bra_8D02
    CMPI.B  #$00,D2  ; orig: C - - - - - 0x010CF8 04:8CE8: C0 00     CPY #$00
    BNE     b04_bra_8D09             ; BNE  ; orig: C - - - - - 0x010CFA 04:8CEA: D0 1D     BNE b04_bra_8D09

; Y = 00
    MOVE.B  D0,ram_0097  ; orig: C - - - - - 0x010CFC 04:8CEC: 85 97     STA ram_0097
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x010D00 04:8CF0: 85 83     STA ram_0083
    MOVE.B  D2,ram_room_item_flag  ; orig: C - - - - - 0x010D02 04:8CF2: 84 BF     STY ram_room_item_fl
    MOVE.B  #con_drop_id_14,D0  ; orig: C - - - - - 0x010D04 04:8CF4: A9 14     LDA #con_drop_id_14
    MOVE.B  D0,ram_drop_id_room  ; orig: C - - - - - 0x010D06 04:8CF6: 85 AB     STA ram_drop_id_room
    BSR     sub_bat_7314_check_map_bit4             ; JSR -> BSR  ; orig: C - - - - - 0x010D08 04:8CF8: 20 14 73  JSR sub_bat_7314_che
    BNE     b04_bra_8D05             ; BNE  ; orig: C - - - - - 0x010D0B 04:8CFB: D0 08     BNE b04_bra_8D05
    BSR     sub_9081_write_found_secret_sound             ; JSR -> BSR  ; orig: C - - - - - 0x010D0D 04:8CFD: 20 81 90  JSR sub_9081_write_f
    BNE     b04_bra_8D05             ; BNE  ; orig: C - - - - - 0x010D10 04:8D00: D0 03     BNE b04_bra_8D05    ; jm
b04_bra_8D02:  ; orig: b04_bra_8D02:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010D12 04:8D02: 88        DEY
    BPL     b04_bra_8CD4_loop             ; BPL  ; orig: C - - - - - 0x010D13 04:8D03: 10 CF     BPL b04_bra_8CD4_loop
b04_bra_8D05:  ; orig: b04_bra_8D05:
    MOVE.B  #$26,D0  ; orig: C - - - - - 0x010D15 04:8D05: A9 26     LDA #$26
    MOVE.B  D0,ram_0000_t28  ; orig: C - - - - - 0x010D17 04:8D07: 85 00     STA ram_0000_t28
b04_bra_8D09:  ; orig: b04_bra_8D09:
    MOVE.B  ram_0000_t28,D0  ; orig: C - - - - - 0x010D19 04:8D09: A5 00     LDA ram_0000_t28
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010D1B 04:8D0B: 48        PHA
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x010D1C 04:8D0C: C9 70     CMP #$70
    BNE     b04_bra_8D13             ; BNE  ; orig: C - - - - - 0x010D1E 04:8D0E: D0 03     BNE b04_bra_8D13
    BSR     sub_9081_write_found_secret_sound             ; JSR -> BSR  ; orig: C - - - - - 0x010D20 04:8D10: 20 81 90  JSR sub_9081_write_f
b04_bra_8D13:  ; orig: b04_bra_8D13:
    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x010D23 04:8D13: E6 F7     INC ram_00F7_flag
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010D25 04:8D15: 68        PLA
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010D26 04:8D16: 20 62 E8  JSR sub_0x01E872_bom
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x010D29 04:8D19: A9 03     LDA #$03
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$20,D0  ; orig: C - - - - - 0x010D2E 04:8D1E: A9 20     LDA #$20
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010D30 04:8D20: B4 19     LDY ram_indiv_random
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #$80,D2  ; orig: C - - - - - 0x010D32 04:8D22: C0 80     CPY #$80
    BCC     b04_bra_8D28             ; BCC  ; orig: C - - - - - 0x010D34 04:8D24: 90 02     BCC b04_bra_8D28
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x010D36 04:8D26: A9 60     LDA #$60
b04_bra_8D28:  ; orig: b04_bra_8D28:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8D2B:  ; orig: b04_bra_8D2B:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x010D3B 04:8D2B: A9 04     LDA #$04    ; con_di
    MOVEA.L #ram_03F8_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010D44 04:8D34: 4A        LSR
    BCS     b04_bra_8D41_RTS             ; BCS  ; orig: C - - - - - 0x010D45 04:8D35: B0 0A     BCS b04_bra_8D41_RTS
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010D47 04:8D37: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_22,D0  ; orig: C - - - - - 0x010D4A 04:8D3A: C9 22     CMP #con_obj_id_22
    BEQ     b04_bra_8D42             ; BEQ  ; orig: C - - - - - 0x010D4C 04:8D3C: F0 04     BEQ b04_bra_8D42

; bzk optimize, JMP
    BSR     sub_8D69             ; JSR -> BSR  ; orig: C - - - - - 0x010D4E 04:8D3E: 20 69 8D  JSR sub_8D69
b04_bra_8D41_RTS:  ; orig: b04_bra_8D41_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010D51 04:8D41: 60        RTS
b04_bra_8D42:  ; orig: b04_bra_8D42:
    BSR     sub_8C8D             ; JSR -> BSR  ; orig: C - - - - - 0x010D52 04:8D42: 20 8D 8C  JSR sub_8C8D
    MOVEA.L #ram_0492_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8D41_RTS             ; BNE  ; orig: C - - - - - 0x010D58 04:8D48: D0 F7     BNE b04_bra_8D41_RTS
    BSR     sub_0x01FEE6             ; JSR -> BSR  ; orig: - - - - - - 0x010D5A 04:8D4A: 20 D6 FE  JSR sub_0x01FEE6
    JMP     loc_877C  ; orig: - - - - - - 0x010D5D 04:8D4D: 4C 7C 87  JMP loc_877C



ofs_004_0x010D60_1E:  ; orig: ofs_004_0x010D60_1E:

; con_obj_id_1E

; in

; X = 01+
    BSR     sub_8119             ; JSR -> BSR  ; orig: C - - J - - 0x010D60 04:8D50: 20 19 81  JSR sub_8119
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8D69             ; BNE  ; orig: C - - - - - 0x010D65 04:8D55: D0 12     BNE b04_bra_8D69
    MOVEA.L #$FF03D0,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x010D67 04:8D57: DE D0 03  DEC ram_anim_timer_o
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_8D69             ; BNE  ; orig: C - - - - - 0x010D6A 04:8D5A: D0 0D     BNE b04_bra_8D69
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x010D6C 04:8D5C: A9 06     LDA #$06
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #$02,D0  ; orig: C - - - - - 0x010D74 04:8D64: 49 02     EOR #$02
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8D69:  ; orig: b04_bra_8D69:
sub_8D69:  ; orig: sub_8D69:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010D79 04:8D69: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #con_dir_Up,D2  ; orig: C - - - - - 0x010D7E 04:8D6E: C0 08     CPY #con_dir_Up
    BNE     b04_bra_8D74             ; BNE  ; orig: C - - - - - 0x010D80 04:8D70: D0 02     BNE b04_bra_8D74
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x010D82 04:8D72: A9 01     LDA #$01
b04_bra_8D74:  ; orig: b04_bra_8D74:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010D84 04:8D74: 18        CLC
    ; !! ADC ram_obj_anim_id,X - complex mode, manual review needed  ; orig: C - - - - - 0x010D85 04:8D75: 7D E4 03  ADC ram_obj_anim_id,
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x010D88 04:8D78: 20 DF 77  JSR sub_bat_77DF
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8D8D             ; BNE  ; orig: C - - - - - 0x010D8D 04:8D7D: D0 0E     BNE b04_bra_8D8D
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x010D8F 04:8D7F: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_8D8C_RTS             ; BEQ  ; orig: C - - - - - 0x010D95 04:8D85: F0 05     BEQ b04_bra_8D8C_RTS
    MOVE.B  #con_obj_id_5D,D0  ; orig: - - - - - - 0x010D97 04:8D87: A9 5D     LDA #con_obj_id_5D
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: - - - - - - 0x010D99 04:8D89: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_8D8C_RTS:  ; orig: b04_bra_8D8C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010D9C 04:8D8C: 60        RTS
b04_bra_8D8D:  ; orig: b04_bra_8D8D:
    JMP     loc_bat_7AA7  ; orig: C - - - - - 0x010D9D 04:8D8D: 4C A7 7A  JMP loc_bat_7AA7



ofs_004_0x010DA0_2F:  ; orig: ofs_004_0x010DA0_2F:

; con_obj_id_2F

; in

; X = 01+
    BSR     sub_B223             ; JSR -> BSR  ; orig: - - - - - - 0x010DA0 04:8D90: 20 23 B2  JSR sub_B223
    ; (empty translation for LDA)  ; orig: - - - - - - 0x010DA3 04:8D93: A5 AD     LDA ram_state_obj + 
    BNE     b04_bra_8DB0             ; BNE  ; orig: - - - - - - 0x010DA5 04:8D95: D0 19     BNE b04_bra_8DB0
    MOVE.B  ram_pos_Y_link,D0  ; orig: - - - - - - 0x010DA7 04:8D97: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$AD,D0  ; orig: - - - - - - 0x010DA9 04:8D99: C9 AD     CMP #$AD
    BNE     b04_bra_8DAF_RTS             ; BNE  ; orig: - - - - - - 0x010DAB 04:8D9B: D0 12     BNE b04_bra_8DAF_RTS
    MOVE.B  ram_pos_X_link,D0  ; orig: - - - - - - 0x010DAD 04:8D9D: A5 70     LDA ram_pos_X_link
    CMPI.B  #$70,D0  ; orig: - - - - - - 0x010DAF 04:8D9F: C9 70     CMP #$70
    BCC     b04_bra_8DAF_RTS             ; BCC  ; orig: - - - - - - 0x010DB1 04:8DA1: 90 0C     BCC b04_bra_8DAF_RTS
    CMPI.B  #$81,D0  ; orig: - - - - - - 0x010DB3 04:8DA3: C9 81     CMP #$81
    BCS     b04_bra_8DAF_RTS             ; BCS  ; orig: - - - - - - 0x010DB5 04:8DA5: B0 08     BCS b04_bra_8DAF_RTS
    ; (empty translation for INC)  ; orig: - - - - - - 0x010DB7 04:8DA7: E6 AD     INC ram_state_obj + 
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x010DB9 04:8DA9: A9 40     LDA #$40    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x010DBB 04:8DAB: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_0063  ; orig: - - - - - - 0x010DBD 04:8DAD: 85 63     STA ram_0063
b04_bra_8DAF_RTS:  ; orig: b04_bra_8DAF_RTS:
    RTS                     ; RTS  ; orig: - - - - - - 0x010DBF 04:8DAF: 60        RTS
b04_bra_8DB0:  ; orig: b04_bra_8DB0:
    CMPI.B  #$01,D0  ; orig: - - - - - - 0x010DC0 04:8DB0: C9 01     CMP #$01
    BNE     b04_bra_8DBE             ; BNE  ; orig: - - - - - - 0x010DC2 04:8DB2: D0 0A     BNE b04_bra_8DBE
    MOVE.B  ram_0063,D0  ; orig: - - - - - - 0x010DC4 04:8DB4: A5 63     LDA ram_0063
    BNE     b04_bra_8DCC             ; BNE  ; orig: - - - - - - 0x010DC6 04:8DB6: D0 14     BNE b04_bra_8DCC
    ; (empty translation for INC)  ; orig: - - - - - - 0x010DC8 04:8DB8: E6 AD     INC ram_state_obj + 
    MOVE.B  #$50,D0  ; orig: - - - - - - 0x010DCA 04:8DBA: A9 50     LDA #$50
    ; (empty translation for STA)  ; orig: - - - - - - 0x010DCC 04:8DBC: 85 29     STA ram_timer_enemy 
b04_bra_8DBE:  ; orig: b04_bra_8DBE:
    CMPI.B  #$02,D0  ; orig: - - - - - - 0x010DCE 04:8DBE: C9 02     CMP #$02
    BNE     b04_bra_8DE2_RTS             ; BNE  ; orig: - - - - - - 0x010DD0 04:8DC0: D0 20     BNE b04_bra_8DE2_RTS
    ; (empty translation for LDA)  ; orig: - - - - - - 0x010DD2 04:8DC2: A5 29     LDA ram_timer_enemy 
    BNE     b04_bra_8DCC             ; BNE  ; orig: - - - - - - 0x010DD4 04:8DC4: D0 06     BNE b04_bra_8DCC
    ; (empty translation for INC)  ; orig: - - - - - - 0x010DD6 04:8DC6: E6 AD     INC ram_state_obj + 
    MOVE.B  #con_obj_state_00,D0  ; orig: - - - - - - 0x010DD8 04:8DC8: A9 00     LDA #con_obj_state_0
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x010DDA 04:8DCA: 85 AC     STA ram_state_link
b04_bra_8DCC:  ; orig: b04_bra_8DCC:
    MOVE.B  #$00,D2  ; orig: - - - - - - 0x010DDC 04:8DCC: A0 00     LDY #$00
    MOVE.B  D2,ram_03F8_link  ; orig: - - - - - - 0x010DDE 04:8DCE: 8C F8 03  STY ram_03F8_link
    MOVE.B  ram_state_link,D0  ; orig: - - - - - - 0x010DE1 04:8DD1: A5 AC     LDA ram_state_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x010DE3 04:8DD3: 48        PHA
    MOVE.B  D2,ram_state_link  ; orig: - - - - - - 0x010DE4 04:8DD4: 84 AC     STY ram_state_link
    BSR     sub_0x01F223             ; JSR -> BSR  ; orig: - - - - - - 0x010DE6 04:8DD6: 20 13 F2  JSR sub_0x01F223
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x010DE9 04:8DD9: 68        PLA
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x010DEA 04:8DDA: 85 AC     STA ram_state_link
    BSR     sub_8DEA             ; JSR -> BSR  ; orig: - - - - - - 0x010DEC 04:8DDC: 20 EA 8D  JSR sub_8DEA
    MOVE.B  ram_obj_index,D1  ; orig: - - - - - - 0x010DEF 04:8DDF: AE 40 03  LDX ram_obj_index
b04_bra_8DE2_RTS:  ; orig: b04_bra_8DE2_RTS:
    RTS                     ; RTS  ; orig: - - - - - - 0x010DF2 04:8DE2: 60        RTS



tbl_8DE3:  ; orig: tbl_8DE3:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - - - - - - 0x010DF3 04:8DE3: 14        .byte $14   ; 03
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - - - - - - 0x010DF4 04:8DE4: 10        .byte $10   ; 04
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - - - - - - 0x010DF5 04:8DE5: 0C        .byte $0C   ; 05
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - - - - - - 0x010DF6 04:8DE6: 08        .byte $08   ; 06
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x010DF7 04:8DE7: 04        .byte $04   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x010DF8 04:8DE8: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - - - - - - 0x010DF9 04:8DE9: 1C        .byte $1C   ; 09



sub_8DEA:  ; orig: sub_8DEA:

; bzk garbage?
    MOVE.B  #$02,D1  ; orig: - - - - - - 0x010DFA 04:8DEA: A2 02     LDX #$02
b04_bra_8DEC_loop:  ; orig: b04_bra_8DEC_loop:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8E1B             ; BNE  ; orig: - - - - - - 0x010DFE 04:8DEE: D0 2B     BNE b04_bra_8E1B
    CMPI.B  #$02,D1  ; orig: - - - - - - 0x010E00 04:8DF0: E0 02     CPX #$02
    BEQ     b04_bra_8E05             ; BEQ  ; orig: - - - - - - 0x010E02 04:8DF2: F0 11     BEQ b04_bra_8E05
    ; (empty translation for LDA)  ; orig: - - - - - - 0x010E04 04:8DF4: A5 AE     LDA ram_state_obj + 
    BEQ     b04_bra_8DEC_loop             ; BEQ  ; orig: - - - - - - 0x010E06 04:8DF6: F0 F4     BEQ b04_bra_8DEC_loop   
    MOVE.B  D1,D0           ; TXA  ; orig: - - - - - - 0x010E08 04:8DF8: 8A        TXA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - - - - - - 0x010E09 04:8DF9: 38        SEC
    SUB.B  #$03,D0       ; SBC imm  ; orig: - - - - - - 0x010E0A 04:8DFA: E9 03     SBC #$03
    MOVE.B  D0,D2           ; TAY  ; orig: - - - - - - 0x010E0C 04:8DFC: A8        TAY
    ; (empty translation for LDA)  ; orig: - - - - - - 0x010E0D 04:8DFD: AD 96 03  LDA ram_0394_enemy +
    MOVEA.L #tbl_8DE3,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_8E3C             ; BNE  ; orig: - - - - - - 0x010E13 04:8E03: D0 37     BNE b04_bra_8E3C
b04_bra_8E05:  ; orig: b04_bra_8E05:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: - - - - - - 0x010E15 04:8E05: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$80,D0  ; orig: - - - - - - 0x010E17 04:8E07: A9 80     LDA #$80    ; ???
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$18,D0  ; orig: - - - - - - 0x010E1B 04:8E0B: A9 18     LDA #$18
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: - - - - - - 0x010E20 04:8E10: A5 71     LDA ram_pos_X_enemy 
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: - - - - - - 0x010E24 04:8E14: A5 85     LDA ram_pos_Y_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: - - - - - - 0x010E26 04:8E16: 38        SEC
    SUB.B  #$1C,D0       ; SBC imm  ; orig: - - - - - - 0x010E27 04:8E17: E9 1C     SBC #$1C
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8E1B:  ; orig: b04_bra_8E1B:
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x010E2B 04:8E1B: A9 00     LDA #$00
    MOVE.B  D0,ram_000B_t07_useless_00  ; orig: - - - - - - 0x010E2D 04:8E1D: 85 0B     STA ram_000B_t07_use
    MOVE.B  #$60,D0  ; orig: - - - - - - 0x010E2F 04:8E1F: A9 60     LDA #$60
    BSR     sub_B459             ; JSR -> BSR  ; orig: - - - - - - 0x010E31 04:8E21: 20 59 B4  JSR sub_B459
    MOVE.B  #$06,D0  ; orig: - - - - - - 0x010E34 04:8E24: A9 06     LDA #$06
    MOVE.B  D0,D2           ; TAY  ; orig: - - - - - - 0x010E36 04:8E26: A8        TAY
    BSR     sub_B3BD             ; JSR -> BSR  ; orig: - - - - - - 0x010E37 04:8E27: 20 BD B3  JSR sub_B3BD
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D1,D0           ; TXA  ; orig: - - - - - - 0x010E3C 04:8E2C: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x010E3D 04:8E2D: 48        PHA
    BSR     sub_bat_7986             ; JSR -> BSR  ; orig: - - - - - - 0x010E3E 04:8E2E: 20 86 79  JSR sub_bat_7986
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: - - - - - - 0x010E41 04:8E31: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    MOVE.B  ram_obj_index,D1  ; orig: - - - - - - 0x010E44 04:8E34: AE 40 03  LDX ram_obj_index
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: - - - - - - 0x010E47 04:8E37: 20 DF 77  JSR sub_bat_77DF
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x010E4A 04:8E3A: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: - - - - - - 0x010E4B 04:8E3B: AA        TAX
b04_bra_8E3C:  ; orig: b04_bra_8E3C:
    ADDQ.B  #1,D1           ; INX  ; orig: - - - - - - 0x010E4C 04:8E3C: E8        INX
    CMPI.B  #$0A,D1  ; orig: - - - - - - 0x010E4D 04:8E3D: E0 0A     CPX #$0A
    BNE     b04_bra_8DEC_loop             ; BNE  ; orig: - - - - - - 0x010E4F 04:8E3F: D0 AB     BNE b04_bra_8DEC_loop
    RTS                     ; RTS  ; orig: - - - - - - 0x010E51 04:8E41: 60        RTS



tbl_8E42_direction:  ; orig: tbl_8E42_direction:
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 0 - - - 0x010E52 04:8E42: 08        .byte con_dir_Up    
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 0 - - - 0x010E53 04:8E43: 04        .byte con_dir_Down  



ofs_004_0x010E54_62:  ; orig: ofs_004_0x010E54_62:

; con_obj_id_62
ofs_004_0x010E54_65:  ; orig: ofs_004_0x010E54_65:

; con_obj_id_65
ofs_004_0x010E54_66:  ; orig: ofs_004_0x010E54_66:

; con_obj_id_66

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8E92             ; BNE  ; orig: C - - - - - 0x010E56 04:8E46: D0 4A     BNE b04_bra_8E92
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010E58 04:8E48: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_65,D0  ; orig: C - - - - - 0x010E5B 04:8E4B: C9 65     CMP #con_obj_id_65
    BEQ     b04_bra_8E54             ; BEQ  ; orig: C - - - - - 0x010E5D 04:8E4D: F0 05     BEQ b04_bra_8E54
    MOVE.B  ram_item_bracelet,D0  ; orig: C - - - - - 0x010E5F 04:8E4F: AD 65 06  LDA ram_item_bracele
    BEQ     b04_bra_8E91_RTS             ; BEQ  ; orig: C - - - - - 0x010E62 04:8E52: F0 3D     BEQ b04_bra_8E91_RTS
b04_bra_8E54:  ; orig: b04_bra_8E54:
    BSR     sub_8F5A             ; JSR -> BSR  ; orig: C - - - - - 0x010E64 04:8E54: 20 5A 8F  JSR sub_8F5A
    BCS     b04_bra_8E91_RTS             ; BCS  ; orig: C - - - - - 0x010E67 04:8E57: B0 38     BCS b04_bra_8E91_RTS
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x010E69 04:8E59: A5 70     LDA ram_pos_X_link
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_8E91_RTS             ; BNE  ; orig: C - - - - - 0x010E6D 04:8E5D: D0 32     BNE b04_bra_8E91_RTS
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x010E6F 04:8E5F: A0 00     LDY #$00
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010E71 04:8E61: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010E73 04:8E63: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010E74 04:8E64: 69 03     ADC #$03
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010E76 04:8E66: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x010E77 04:8E67: F5 84     SBC ram_pos_Y_enemy,
    BPL     b04_bra_8E71             ; BPL  ; orig: C - - - - - 0x010E79 04:8E69: 10 06     BPL b04_bra_8E71
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010E7B 04:8E6B: C8        INY
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x010E7C 04:8E6C: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010E7E 04:8E6E: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010E7F 04:8E6F: 69 01     ADC #$01
b04_bra_8E71:  ; orig: b04_bra_8E71:
    CMPI.B  #$11,D0  ; orig: C - - - - - 0x010E81 04:8E71: C9 11     CMP #$11
    BCS     b04_bra_8E91_RTS             ; BCS  ; orig: C - - - - - 0x010E83 04:8E73: B0 1C     BCS b04_bra_8E91_RTS
    MOVE.B  ram_03F8_link,D0  ; orig: C - - - - - 0x010E85 04:8E75: AD F8 03  LDA ram_03F8_link
    ANDI.B  #$0C,D0  ; orig: C - - - - - 0x010E88 04:8E78: 29 0C     AND #$0C
    BEQ     b04_bra_8E91_RTS             ; BEQ  ; orig: C - - - - - 0x010E8A 04:8E7A: F0 15     BEQ b04_bra_8E91_RTS
    MOVEA.L #tbl_8E42_direction,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_8E91_RTS             ; BNE  ; orig: C - - - - - 0x010E8F 04:8E7F: D0 10     BNE b04_bra_8E91_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010E93 04:8E83: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x010E95 04:8E85: A5 EB     LDA ram_map_location
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x010E9A 04:8E8A: E6 F7     INC ram_00F7_flag
    MOVE.B  #$26,D0  ; orig: C - - - - - 0x010E9C 04:8E8C: A9 26     LDA #$26

; bzk optimize, JMP
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010E9E 04:8E8E: 20 62 E8  JSR sub_0x01E872_bom
b04_bra_8E91_RTS:  ; orig: b04_bra_8E91_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010EA1 04:8E91: 60        RTS
b04_bra_8E92:  ; orig: b04_bra_8E92:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x010EA4 04:8E94: 85 0F     STA ram_000F_t01_dir
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x010EA6 04:8E96: 20 8D F0  JSR sub_0x01F09D
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x010EA9 04:8E99: 20 93 FA  JSR sub_0x01FAA3

; A = 00
    SUBQ.B  #1,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x010EAC 04:8E9C: C6 01     DEC ram_0001_t15_spr
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x010EAE 04:8E9E: 20 DF 77  JSR sub_bat_77DF
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x010EB4 04:8EA4: C9 10     CMP #$10
    BEQ     b04_bra_8EAC             ; BEQ  ; orig: C - - - - - 0x010EB6 04:8EA6: F0 04     BEQ b04_bra_8EAC
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x010EB8 04:8EA8: C9 F0     CMP #$F0
    BNE     b04_bra_8E91_RTS             ; BNE  ; orig: C - - - - - 0x010EBA 04:8EAA: D0 E5     BNE b04_bra_8E91_RTS
b04_bra_8EAC:  ; orig: b04_bra_8EAC:
    MOVE.B  ram_map_location,D0  ; orig: C - - - - - 0x010EBC 04:8EAC: A5 EB     LDA ram_map_location
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010EBE 04:8EAE: 48        PHA
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x010EC2 04:8EB2: 85 EB     STA ram_map_location
    BSR     sub_0x01E6D6_set_map_bit5             ; JSR -> BSR  ; orig: C - - - - - 0x010EC4 04:8EB4: 20 C6 E6  JSR sub_0x01E6D6_set
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010EC7 04:8EB7: 68        PLA
    MOVE.B  D0,ram_map_location  ; orig: C - - - - - 0x010EC8 04:8EB8: 85 EB     STA ram_map_location
    MOVE.B  #$C8,D0  ; orig: C - - - - - 0x010ECA 04:8EBA: A9 C8     LDA #$C8
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x010ECC 04:8EBC: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_62,D2  ; orig: C - - - - - 0x010ECF 04:8EBF: C0 62     CPY #con_obj_id_62
    BEQ     b04_bra_8ECB             ; BEQ  ; orig: C - - - - - 0x010ED1 04:8EC1: F0 08     BEQ b04_bra_8ECB
    MOVE.B  #$BC,D0  ; orig: C - - - - - 0x010ED3 04:8EC3: A9 BC     LDA #$BC
    CMPI.B  #con_obj_id_65,D2  ; orig: C - - - - - 0x010ED5 04:8EC5: C0 65     CPY #con_obj_id_65
    BEQ     b04_bra_8ECB             ; BEQ  ; orig: C - - - - - 0x010ED7 04:8EC7: F0 02     BEQ b04_bra_8ECB
    MOVE.B  #$C0,D0  ; orig: - - - - - - 0x010ED9 04:8EC9: A9 C0     LDA #$C0
b04_bra_8ECB:  ; orig: b04_bra_8ECB:
    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x010EDB 04:8ECB: E6 F7     INC ram_00F7_flag
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010EDD 04:8ECD: 20 62 E8  JSR sub_0x01E872_bom
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x010EE0 04:8ED0: A9 70     LDA #$70
    MOVE.B  D0,ram_0000_t29  ; orig: C - - - - - 0x010EE2 04:8ED2: 85 00     STA ram_0000_t29
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D2

    BSR     sub_bat_718C             ; JSR -> BSR  ; orig: C - - - - - 0x010EE7 04:8ED7: 20 8C 71  JSR sub_bat_718C
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010EEC 04:8EDC: 94 84     STY ram_pos_Y_enemy,
    MOVE.B  D2,(A0,D1.L)  ; ^
    MOVE.B  ram_0000_t29,D0  ; orig: C - - - - - 0x010EEE 04:8EDE: A5 00     LDA ram_0000_t29
sub_8EE0:
; A = 24/70
    ADDQ.B  #1,ram_00F7_flag  ; orig: C - - - - - 0x010EF0 04:8EE0: E6 F7     INC ram_00F7_flag
    BSR     sub_0x01E872_bomb_blasts_breakable_wall             ; JSR -> BSR  ; orig: C - - - - - 0x010EF2 04:8EE2: 20 62 E8  JSR sub_0x01E872_bom
    BSR     sub_B15F             ; JSR -> BSR  ; orig: C - - - - - 0x010EF5 04:8EE5: 20 5F B1  JSR sub_B15F
    JMP     loc_9081_write_found_secret_sound  ; orig: C - - - - - 0x010EF8 04:8EE8: 4C 81 90  JMP loc_9081_write_f



ofs_004_0x010EFB_63_breakable_wall:  ; orig: ofs_004_0x010EFB_63_breakable_wall:

; con_obj_id_breakable_wall
ofs_004_0x010EFB_67:  ; orig: ofs_004_0x010EFB_67:

; con_obj_id_67

; in

; X = 01+
    BSR     sub_8F5A             ; JSR -> BSR  ; orig: C - - J - - 0x010EFB 04:8EEB: 20 5A 8F  JSR sub_8F5A
    BCS     b04_bra_8F0D_RTS             ; BCS  ; orig: C - - - - - 0x010EFE 04:8EEE: B0 1D     BCS b04_bra_8F0D_RTS
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x010F00 04:8EF0: A0 10     LDY #$10
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$13,D0  ; orig: C - - - - - 0x010F05 04:8EF5: C9 13     CMP #$13
    BEQ     b04_bra_8F01             ; BEQ  ; orig: C - - - - - 0x010F07 04:8EF7: F0 08     BEQ b04_bra_8F01
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010F09 04:8EF9: C8        INY ; 11
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$13,D0  ; orig: C - - - - - 0x010F0D 04:8EFD: C9 13     CMP #$13
    BNE     b04_bra_8F0D_RTS             ; BNE  ; orig: C - - - - - 0x010F0F 04:8EFF: D0 0C     BNE b04_bra_8F0D_RTS
b04_bra_8F01:  ; orig: b04_bra_8F01:

; triggers ditring bomb explosion animation
    MOVE.B  D2,ram_0000_t2A  ; orig: C - - - - - 0x010F11 04:8F01: 84 00     STY ram_0000_t2A
    BSR     sub_8F3F             ; JSR -> BSR  ; orig: C - - - - - 0x010F13 04:8F03: 20 3F 8F  JSR sub_8F3F
    BEQ     b04_bra_8F0D_RTS             ; BEQ  ; orig: C - - - - - 0x010F16 04:8F06: F0 05     BEQ b04_bra_8F0D_RTS

; triggers when bomb exloads near breakable wall
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x010F18 04:8F08: A9 24     LDA #$24

; bzk optimize, JMP
    BSR     sub_8F34             ; JSR -> BSR  ; orig: C - - - - - 0x010F1A 04:8F0A: 20 34 8F  JSR sub_8F34
b04_bra_8F0D_RTS:  ; orig: b04_bra_8F0D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010F1D 04:8F0D: 60        RTS



ofs_004_0x010F1E_64:  ; orig: ofs_004_0x010F1E_64:

; con_obj_id_64

; in

; X = 01+
    BSR     sub_8F5A             ; JSR -> BSR  ; orig: C - - J - - 0x010F1E 04:8F0E: 20 5A 8F  JSR sub_8F5A
    BCS     b04_bra_8F3E_RTS             ; BCS  ; orig: C - - - - - 0x010F21 04:8F11: B0 2B     BCS b04_bra_8F3E_RTS
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x010F23 04:8F13: A0 10     LDY #$10
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$22,D0  ; orig: C - - - - - 0x010F28 04:8F18: C9 22     CMP #$22
    BEQ     b04_bra_8F24             ; BEQ  ; orig: C - - - - - 0x010F2A 04:8F1A: F0 08     BEQ b04_bra_8F24
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010F2C 04:8F1C: C8        INY ; 11
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$22,D0  ; orig: C - - - - - 0x010F30 04:8F20: C9 22     CMP #$22
    BNE     b04_bra_8F3E_RTS             ; BNE  ; orig: C - - - - - 0x010F32 04:8F22: D0 1A     BNE b04_bra_8F3E_RTS
b04_bra_8F24:  ; orig: b04_bra_8F24:
    MOVE.B  D2,ram_0000_t2A  ; orig: C - - - - - 0x010F34 04:8F24: 84 00     STY ram_0000_t2A
    MOVEA.L #ram_timer_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x010F39 04:8F29: C9 02     CMP #$02
    BCS     b04_bra_8F3E_RTS             ; BCS  ; orig: C - - - - - 0x010F3B 04:8F2B: B0 11     BCS b04_bra_8F3E_RTS
    BSR     sub_8F3F             ; JSR -> BSR  ; orig: C - - - - - 0x010F3D 04:8F2D: 20 3F 8F  JSR sub_8F3F
    BEQ     b04_bra_8F3E_RTS             ; BEQ  ; orig: C - - - - - 0x010F40 04:8F30: F0 0C     BEQ b04_bra_8F3E_RTS
loc_0x010F42:  ; orig: loc_0x010F42:
    MOVE.B  #$70,D0  ; orig: C D 0 - - - 0x010F42 04:8F32: A9 70     LDA #$70
sub_8F34:  ; orig: sub_8F34:
    BSR     sub_8EE0             ; JSR -> BSR  ; orig: C - - - - - 0x010F44 04:8F34: 20 E0 8E  JSR sub_8EE0
    BSR     sub_0x01E6DE_get_byte_from_current_map_location             ; JSR -> BSR  ; orig: C - - - - - 0x010F47 04:8F37: 20 CE E6  JSR sub_0x01E6DE_get
    ORI.B   #$80,D0  ; orig: C - - - - - 0x010F4A 04:8F3A: 09 80     ORA #$80
    MOVEA.L #ram_0000_t13_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  D0,(A0,D2.W)

b04_bra_8F3E_RTS:  ; orig: b04_bra_8F3E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010F4E 04:8F3E: 60        RTS



sub_8F3F:  ; orig: sub_8F3F:

; out

; Z

; 0 =

; 1 =
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010F52 04:8F42: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010F53 04:8F43: 69 08     ADC #$08
    MOVE.B  D0,ram_0004_t10_pos_X  ; orig: C - - - - - 0x010F55 04:8F45: 85 04     STA ram_0004_t10_pos
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010F5A 04:8F4A: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010F5B 04:8F4B: 69 08     ADC #$08
    MOVE.B  D0,ram_0005_t08_pos_Y  ; orig: C - - - - - 0x010F5D 04:8F4D: 85 05     STA ram_0005_t08_pos
    BSR     sub_bat_7A2D             ; JSR -> BSR  ; orig: C - - - - - 0x010F5F 04:8F4F: 20 2D 7A  JSR sub_bat_7A2D
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x010F62 04:8F52: A9 10     LDA #$10
    JMP     loc_bat_7DFB  ; orig: C - - - - - 0x010F64 04:8F54: 4C FB 7D  JMP loc_bat_7DFB



tbl_8F57:  ; orig: tbl_8F57:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x010F67 04:8F57: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x010F68 04:8F58: 00        .byte $00   ; 40
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x010F69 04:8F59: 01        .byte $01   ; 80



sub_8F5A:  ; orig: sub_8F5A:

; out

; C

; 0 =

; 1 =
    MOVE.B  ram_04CD_map_data_byte,D0  ; orig: C - - - - - 0x010F6A 04:8F5A: AD CD 04  LDA ram_04CD_map_dat

; / 40
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F6D 04:8F5D: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F6E 04:8F5E: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F6F 04:8F5F: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F70 04:8F60: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F71 04:8F61: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x010F72 04:8F62: 4A        LSR
    BEQ     b04_bra_8F72             ; BEQ  ; orig: C - - - - - 0x010F73 04:8F63: F0 0D     BEQ b04_bra_8F72
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x010F75 04:8F65: A8        TAY
    MOVEA.L #tbl_8F57,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x010F79 04:8F69: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_8F72             ; BEQ  ; orig: C - - - - - 0x010F7E 04:8F6E: F0 02     BEQ b04_bra_8F72
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x010F80 04:8F70: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x010F81 04:8F71: 60        RTS
b04_bra_8F72:  ; orig: b04_bra_8F72:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010F82 04:8F72: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x010F83 04:8F73: 60        RTS



tbl_8F74_direction:  ; orig: tbl_8F74_direction:
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 0 - - - 0x010F84 04:8F74: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 0 - - - 0x010F85 04:8F75: 08        .byte con_dir_Up    



ofs_004_0x010F86_61:  ; orig: ofs_004_0x010F86_61:

; con_obj_id_61

; in

; X = 01+
    MOVE.B  ram_item_raft,D0  ; orig: C - - J - - 0x010F86 04:8F76: AD 60 06  LDA ram_item_raft
    BEQ     b04_bra_8FAF_RTS             ; BEQ  ; orig: C - - - - - 0x010F89 04:8F79: F0 34     BEQ b04_bra_8FAF_RTS
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_8FB0             ; BNE  ; orig: C - - - - - 0x010F8D 04:8F7D: D0 31     BNE b04_bra_8FB0
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x010F8F 04:8F7F: A9 80     LDA #$80
    MOVE.B  ram_map_location,D2  ; orig: C - - - - - 0x010F91 04:8F81: A4 EB     LDY ram_map_location
    CMPI.B  #$55,D2  ; orig: C - - - - - 0x010F93 04:8F83: C0 55     CPY #con_map_locatio
    BEQ     b04_bra_8F89             ; BEQ  ; orig: C - - - - - 0x010F95 04:8F85: F0 02     BEQ b04_bra_8F89
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x010F97 04:8F87: A9 60     LDA #$60
b04_bra_8F89:  ; orig: b04_bra_8F89:
    CMP.B   ram_pos_X_link,D0  ; orig: C - - - - - 0x010F99 04:8F89: C5 70     CMP ram_pos_X_link
    BNE     b04_bra_8FAF_RTS             ; BNE  ; orig: C - - - - - 0x010F9B 04:8F8B: D0 22     BNE b04_bra_8FAF_RTS
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$01,D2  ; orig: C - - - - - 0x010F9F 04:8F8F: A0 01     LDY #$01
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010FA1 04:8F91: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$3D,D0  ; orig: C - - - - - 0x010FA3 04:8F93: C9 3D     CMP #$3D
    BEQ     b04_bra_8F9C             ; BEQ  ; orig: C - - - - - 0x010FA5 04:8F95: F0 05     BEQ b04_bra_8F9C
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x010FA7 04:8F97: C8        INY
    CMPI.B  #$7D,D0  ; orig: C - - - - - 0x010FA8 04:8F98: C9 7D     CMP #$7D
    BNE     b04_bra_8FAF_RTS             ; BNE  ; orig: C - - - - - 0x010FAA 04:8F9A: D0 13     BNE b04_bra_8FAF_RTS
b04_bra_8F9C:  ; orig: b04_bra_8F9C:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x010FAC 04:8F9C: 94 AC     STY ram_state_obj,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x010FAE 04:8F9E: 18        CLC
    ADD.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x010FAF 04:8F9F: 69 06     ADC #$06
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9081_write_found_secret_sound             ; JSR -> BSR  ; orig: C - - - - - 0x010FB3 04:8FA3: 20 81 90  JSR sub_9081_write_f
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x010FB6 04:8FA6: A9 40     LDA #con_obj_state_f
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x010FB8 04:8FA8: 85 AC     STA ram_state_link
    MOVEA.L #$FF8F73,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x010FBA 04:8FAA: B9 73 8F  LDA tbl_8F74_directi
    MOVE.B  (A0,D2.L),D0  ; ^
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x010FBD 04:8FAD: 85 98     STA ram_dir_link
b04_bra_8FAF_RTS:  ; orig: b04_bra_8FAF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x010FBF 04:8FAF: 60        RTS
b04_bra_8FB0:  ; orig: b04_bra_8FB0:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x010FC2 04:8FB2: 88        DEY
    BEQ     b04_bra_8FC9             ; BEQ  ; orig: C - - - - - 0x010FC3 04:8FB3: F0 14     BEQ b04_bra_8FC9
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x010FC5 04:8FB5: D6 84     DEC ram_pos_Y_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
    SUBQ.B  #1,ram_pos_Y_link  ; orig: C - - - - - 0x010FC7 04:8FB7: C6 84     DEC ram_pos_Y_link
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010FC9 04:8FB9: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$3D,D0  ; orig: C - - - - - 0x010FCB 04:8FBB: C9 3D     CMP #$3D
    BNE     b04_bra_8FDE             ; BNE  ; orig: C - - - - - 0x010FCD 04:8FBD: D0 1F     BNE b04_bra_8FDE
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x010FCF 04:8FBF: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010FD0 04:8FC0: 48        PHA
    BSR     sub_0x01F192             ; JSR -> BSR  ; orig: C - - - - - 0x010FD1 04:8FC1: 20 82 F1  JSR sub_0x01F192
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010FD4 04:8FC4: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x010FD5 04:8FC5: AA        TAX
    JMP     loc_8FD8  ; orig: C - - - - - 0x010FD6 04:8FC6: 4C D8 8F  JMP loc_8FD8
b04_bra_8FC9:  ; orig: b04_bra_8FC9:
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x010FD9 04:8FC9: F6 84     INC ram_pos_Y_enemy,
    ADDQ.B  #1,(A0,D1.L)  ; ^
    ADDQ.B  #1,ram_pos_Y_link  ; orig: C - - - - - 0x010FDB 04:8FCB: E6 84     INC ram_pos_Y_link
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x010FDD 04:8FCD: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$7F,D0  ; orig: C - - - - - 0x010FDF 04:8FCF: C9 7F     CMP #$7F
    BNE     b04_bra_8FDE             ; BNE  ; orig: C - - - - - 0x010FE1 04:8FD1: D0 0B     BNE b04_bra_8FDE
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x010FE3 04:8FD3: A9 02     LDA #$02
    MOVE.B  D0,ram_0394_link  ; orig: C - - - - - 0x010FE5 04:8FD5: 8D 94 03  STA ram_0394_link
loc_8FD8:  ; orig: loc_8FD8:
    MOVE.B  #$00,D0  ; orig: C D 0 - - - 0x010FE8 04:8FD8: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x010FEA 04:8FDA: 85 AC     STA ram_state_link
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_8FDE:  ; orig: b04_bra_8FDE:
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x010FEE 04:8FDE: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x010FEF 04:8FDF: 48        PHA
    BSR     sub_0x01F223             ; JSR -> BSR  ; orig: C - - - - - 0x010FF0 04:8FE0: 20 13 F2  JSR sub_0x01F223
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x010FF3 04:8FE3: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x010FF4 04:8FE4: AA        TAX
    BSR     sub_0x01FA5F             ; JSR -> BSR  ; orig: C - - - - - 0x010FF5 04:8FE5: 20 4F FA  JSR sub_0x01FA5F
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x010FF8 04:8FE8: A9 00     LDA #$00
    MOVE.B  #$09,D2  ; orig: C - - - - - 0x010FFA 04:8FEA: A0 09     LDY #$09
    JMP     loc_bat_790C  ; orig: C - - - - - 0x010FFC 04:8FEC: 4C 0C 79  JMP loc_bat_790C



ofs_004_0x010FFF_22:  ; orig: ofs_004_0x010FFF_22:

; con_obj_id_22

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: - - - - - - 0x010FFF 04:8FEF: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_8FFA             ; BNE  ; orig: - - - - - - 0x011002 04:8FF2: D0 06     BNE b04_bra_8FFA
    BSR     sub_9005             ; JSR -> BSR  ; orig: - - - - - - 0x011004 04:8FF4: 20 05 90  JSR sub_9005
    BSR     sub_B288             ; JSR -> BSR  ; orig: - - - - - - 0x011007 04:8FF7: 20 88 B2  JSR sub_B288
b04_bra_8FFA:  ; orig: b04_bra_8FFA:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: - - - - - - 0x01100A 04:8FFA: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$01,D0  ; orig: - - - - - - 0x011010 04:9000: 29 01     AND #$01
    JMP     b04_loc_8C8D  ; orig: - - - - - - 0x011012 04:9002: 4C 8D 8C  JMP b04_loc_8C8D



sub_9005:  ; orig: sub_9005:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: - - - - - - 0x011018 04:9008: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - - - - - - 0x01101B 04:900B: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_9017_01  -- needs manual handling  ; orig: - - - - - - 0x01101D 04:900D: 17 90     .word ofs_030_9017_0
    ; [DIRECTIVE] .WORD ofs_030_B308_02  -- needs manual handling  ; orig: - - - - - - 0x01101F 04:900F: 08 B3     .word ofs_030_B308_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - - - - - - 0x011021 04:9011: 78 B3     .word ofs_030_B378_0
    ; [DIRECTIVE] .WORD ofs_030_B260_04  -- needs manual handling  ; orig: - - - - - - 0x011023 04:9013: 60 B2     .word ofs_030_B260_0
    ; [DIRECTIVE] .WORD ofs_030_B256_05  -- needs manual handling  ; orig: - - - - - - 0x011025 04:9015: 56 B2     .word ofs_030_B256_0



ofs_030_9017_01:  ; orig: ofs_030_9017_01:
    MOVE.B  #$02,D2  ; orig: - - - - - - 0x011027 04:9017: A0 02     LDY #$02
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$A0,D0  ; orig: - - - - - - 0x01102B 04:901B: C9 A0     CMP #$A0
    BCS     b04_bra_9025             ; BCS  ; orig: - - - - - - 0x01102D 04:901D: B0 06     BCS b04_bra_9025
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x01102F 04:901F: C8        INY
    CMPI.B  #$08,D0  ; orig: - - - - - - 0x011030 04:9020: C9 08     CMP #$08
    BCS     b04_bra_9025             ; BCS  ; orig: - - - - - - 0x011032 04:9022: B0 01     BCS b04_bra_9025
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x011034 04:9024: C8        INY
b04_bra_9025:  ; orig: b04_bra_9025:
    JMP     loc_9077  ; orig: - - - - - - 0x011035 04:9025: 4C 77 90  JMP loc_9077



ofs_004_0x011038_1A:  ; orig: ofs_004_0x011038_1A:

; con_obj_id_1A

; in

; X = 01+
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9032             ; BEQ  ; orig: C - - - - - 0x01103A 04:902A: F0 06     BEQ b04_bra_9032
    BSR     sub_0x01EEC8             ; JSR -> BSR  ; orig: C - - - - - 0x01103C 04:902C: 20 B8 EE  JSR sub_0x01EEC8
b04_bra_902F:  ; orig: b04_bra_902F:
    JMP     loc_903F  ; orig: C - - - - - 0x01103F 04:902F: 4C 3F 90  JMP loc_903F
b04_bra_9032:  ; orig: b04_bra_9032:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x011042 04:9032: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x011045 04:9035: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_902F             ; BNE  ; orig: C - - - - - 0x011047 04:9037: D0 F6     BNE b04_bra_902F
    BSR     sub_9057             ; JSR -> BSR  ; orig: C - - - - - 0x011049 04:9039: 20 57 90  JSR sub_9057
    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x01104C 04:903C: 20 88 B2  JSR sub_B288
loc_903F:  ; orig: loc_903F:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C D 0 - - - 0x01104F 04:903F: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$01,D0  ; orig: C - - - - - 0x011055 04:9045: 29 01     AND #$01
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x011057 04:9047: 20 DB 77  JSR sub_bat_77DB
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$05,D0  ; orig: C - - - - - 0x01105D 04:904D: C9 05     CMP #$05
    BEQ     b04_bra_9054             ; BEQ  ; orig: C - - - - - 0x01105F 04:904F: F0 03     BEQ b04_bra_9054
    JMP     loc_bat_7AA7  ; orig: C - - - - - 0x011061 04:9051: 4C A7 7A  JMP loc_bat_7AA7
b04_bra_9054:  ; orig: b04_bra_9054:
    JMP     loc_bat_79D0  ; orig: C - - - - - 0x011064 04:9054: 4C D0 79  JMP loc_bat_79D0



sub_9057:  ; orig: sub_9057:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x01106A 04:905A: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - D 0 - I - 0x01106D 04:905D: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_9069_01  -- needs manual handling  ; orig: - D 0 - I - 0x01106F 04:905F: 69 90     .word ofs_030_9069_0
    ; [DIRECTIVE] .WORD ofs_030_B308_02  -- needs manual handling  ; orig: - D 0 - I - 0x011071 04:9061: 08 B3     .word ofs_030_B308_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - D 0 - I - 0x011073 04:9063: 78 B3     .word ofs_030_B378_0
    ; [DIRECTIVE] .WORD ofs_030_B260_04  -- needs manual handling  ; orig: - D 0 - I - 0x011075 04:9065: 60 B2     .word ofs_030_B260_0
    ; [DIRECTIVE] .WORD ofs_030_B256_05  -- needs manual handling  ; orig: - D 0 - I - 0x011077 04:9067: 56 B2     .word ofs_030_B256_0



ofs_030_9069_01:  ; orig: ofs_030_9069_01:
    MOVE.B  #$02,D2  ; orig: C - - J - - 0x011079 04:9069: A0 02     LDY #$02
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x01107D 04:906D: C9 B0     CMP #$B0
    BCS     b04_bra_9077             ; BCS  ; orig: C - - - - - 0x01107F 04:906F: B0 06     BCS b04_bra_9077
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011081 04:9071: C8        INY
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x011082 04:9072: C9 20     CMP #$20
    BCS     b04_bra_9077             ; BCS  ; orig: C - - - - - 0x011084 04:9074: B0 01     BCS b04_bra_9077
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011086 04:9076: C8        INY
b04_bra_9077:  ; orig: b04_bra_9077:
loc_9077:  ; orig: loc_9077:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011087 04:9077: 98        TYA
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01108B 04:907B: A9 06     LDA #$06
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011090 04:9080: 60        RTS



sub_9081_write_found_secret_sound:  ; orig: sub_9081_write_found_secret_sound:
loc_9081_write_found_secret_sound:  ; orig: loc_9081_write_found_secret_sound:
    MOVE.B  #con_sfx_2_secret_found,D0  ; orig: C D 0 - - - 0x011091 04:9081: A9 04     LDA #con_sfx_2_secre
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x011093 04:9083: 8D 02 06  STA ram_sfx_2
    RTS                     ; RTS  ; orig: C - - - - - 0x011096 04:9086: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x011097 04:9087: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0110A0 04:9090: FF        .byte $FF, $FF, $FF,



tbl_90A0:  ; orig: tbl_90A0:

; ....xxxx = direction

; xxxx.... = ???
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0110B0 04:90A0: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0110B1 04:90A1: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0110B2 04:90A2: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0110B3 04:90A3: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0110B4 04:90A4: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x0110B5 04:90A5: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - - - - - - 0x0110B6 04:90A6: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - - - - - - 0x0110B7 04:90A7: 02        .byte $02   ;
    ; [DIRECTIVE] .BYTE $C1  -- needs manual handling  ; orig: - - - - - - 0x0110B8 04:90A8: C1        .byte $C1   ;
    ; [DIRECTIVE] .BYTE $C1  -- needs manual handling  ; orig: - - - - - - 0x0110B9 04:90A9: C1        .byte $C1   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - - - - - - 0x0110BA 04:90AA: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - - - - - - 0x0110BB 04:90AB: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - - - - - - 0x0110BC 04:90AC: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - - - - - - 0x0110BD 04:90AD: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - - - - - - 0x0110BE 04:90AE: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - - - - - - 0x0110BF 04:90AF: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 0 - - - 0x0110C0 04:90B0: 42        .byte $42   ;
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 0 - - - 0x0110C1 04:90B1: 42        .byte $42   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x0110C2 04:90B2: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x0110C3 04:90B3: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x0110C4 04:90B4: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $41  -- needs manual handling  ; orig: - - - - - - 0x0110C5 04:90B5: 41        .byte $41   ;
    ; [DIRECTIVE] .BYTE $41  -- needs manual handling  ; orig: - - - - - - 0x0110C6 04:90B6: 41        .byte $41   ;
    ; [DIRECTIVE] .BYTE $41  -- needs manual handling  ; orig: - - - - - - 0x0110C7 04:90B7: 41        .byte $41   ;
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 0 - - - 0x0110C8 04:90B8: 82        .byte $82   ;
    ; [DIRECTIVE] .BYTE $82  -- needs manual handling  ; orig: - D 0 - - - 0x0110C9 04:90B9: 82        .byte $82   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - - - - - - 0x0110CA 04:90BA: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - - - - - - 0x0110CB 04:90BB: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - - - - - - 0x0110CC 04:90BC: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - - - - - - 0x0110CD 04:90BD: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - - - - - - 0x0110CE 04:90BE: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - - - - - - 0x0110CF 04:90BF: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 0 - - - 0x0110D0 04:90C0: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 0 - - - 0x0110D1 04:90C1: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 0 - - - 0x0110D2 04:90C2: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 0 - - - 0x0110D3 04:90C3: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 0 - - - 0x0110D4 04:90C4: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x0110D5 04:90C5: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x0110D6 04:90C6: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - - - - - - 0x0110D7 04:90C7: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 0 - - - 0x0110D8 04:90C8: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $84  -- needs manual handling  ; orig: - D 0 - - - 0x0110D9 04:90C9: 84        .byte $84   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - D 0 - - - 0x0110DA 04:90CA: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - - - - - - 0x0110DB 04:90CB: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $81  -- needs manual handling  ; orig: - - - - - - 0x0110DC 04:90CC: 81        .byte $81   ;
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - - - - - - 0x0110DD 04:90CD: 88        .byte $88   ;
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - - - - - - 0x0110DE 04:90CE: 88        .byte $88   ;
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - - - - - - 0x0110DF 04:90CF: 88        .byte $88   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x0110E0 04:90D0: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $48  -- needs manual handling  ; orig: - D 0 - - - 0x0110E1 04:90D1: 48        .byte $48   ;
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 0 - - - 0x0110E2 04:90D2: 42        .byte $42   ;
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - - - - - - 0x0110E3 04:90D3: 42        .byte $42   ;
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - - - - - - 0x0110E4 04:90D4: 42        .byte $42   ;
    ; [DIRECTIVE] .BYTE $44  -- needs manual handling  ; orig: - - - - - - 0x0110E5 04:90D5: 44        .byte $44   ;
    ; [DIRECTIVE] .BYTE $44  -- needs manual handling  ; orig: - - - - - - 0x0110E6 04:90D6: 44        .byte $44   ;
    ; [DIRECTIVE] .BYTE $44  -- needs manual handling  ; orig: - - - - - - 0x0110E7 04:90D7: 44        .byte $44   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0110E8 04:90D8: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0110E9 04:90D9: 08        .byte $08   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0110EA 04:90DA: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0110EB 04:90DB: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x0110EC 04:90DC: 01        .byte $01   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x0110ED 04:90DD: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x0110EE 04:90DE: 04        .byte $04   ;
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x0110EF 04:90DF: 04        .byte $04   ;



tbl_90E0:  ; orig: tbl_90E0:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0110F0 04:90E0: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x0110F1 04:90E1: F0        .byte $F0   ; 01



tbl_90E2:  ; orig: tbl_90E2:
    ; [DIRECTIVE] .BYTE $3D  -- needs manual handling  ; orig: - D 0 - - - 0x0110F2 04:90E2: 3D        .byte $3D   ; 00
    ; [DIRECTIVE] .BYTE $DD  -- needs manual handling  ; orig: - D 0 - - - 0x0110F3 04:90E3: DD        .byte $DD   ; 01



ofs_004_0x0110F4_27:  ; orig: ofs_004_0x0110F4_27:

; con_obj_id_27

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_90EB             ; BEQ  ; orig: C - - - - - 0x0110F6 04:90E6: F0 03     BEQ b04_bra_90EB
    JMP     loc_917D  ; orig: C - - - - - 0x0110F8 04:90E8: 4C 7D 91  JMP loc_917D
b04_bra_90EB:  ; orig: b04_bra_90EB:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0110FB 04:90EB: A5 29     LDA ram_timer_enemy 
    BNE     b04_bra_90F5_RTS             ; BNE  ; orig: C - - - - - 0x0110FD 04:90ED: D0 06     BNE b04_bra_90F5_RTS
    MOVE.B  ram_state_link,D0  ; orig: C - - - - - 0x0110FF 04:90EF: A5 AC     LDA ram_state_link
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x011101 04:90F1: C9 40     CMP #con_obj_state_f
    BNE     b04_bra_90F6             ; BNE  ; orig: C - - - - - 0x011103 04:90F3: D0 01     BNE b04_bra_90F6
b04_bra_90F5_RTS:  ; orig: b04_bra_90F5_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011105 04:90F5: 60        RTS
b04_bra_90F6:  ; orig: b04_bra_90F6:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x011106 04:90F6: A5 70     LDA ram_pos_X_link
    CMPI.B  #$29,D0  ; orig: C - - - - - 0x011108 04:90F8: C9 29     CMP #$29
    BCC     b04_bra_9100             ; BCC  ; orig: C - - - - - 0x01110A 04:90FA: 90 04     BCC b04_bra_9100
    CMPI.B  #$C8,D0  ; orig: C - - - - - 0x01110C 04:90FC: C9 C8     CMP #$C8
    BCC     b04_bra_910A             ; BCC  ; orig: C - - - - - 0x01110E 04:90FE: 90 0A     BCC b04_bra_910A
b04_bra_9100:  ; orig: b04_bra_9100:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x011110 04:9100: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$6D,D0  ; orig: C - - - - - 0x011112 04:9102: C9 6D     CMP #$6D
    BCC     b04_bra_90F5_RTS             ; BCC  ; orig: C - - - - - 0x011114 04:9104: 90 EF     BCC b04_bra_90F5_RTS
    CMPI.B  #$B5,D0  ; orig: C - - - - - 0x011116 04:9106: C9 B5     CMP #$B5
    BCS     b04_bra_90F5_RTS             ; BCS  ; orig: C - - - - - 0x011118 04:9108: B0 EB     BCS b04_bra_90F5_RTS
b04_bra_910A:  ; orig: b04_bra_910A:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01111A 04:910A: A5 70     LDA ram_pos_X_link
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x01111C 04:910C: C9 20     CMP #$20
    BEQ     b04_bra_9114             ; BEQ  ; orig: C - - - - - 0x01111E 04:910E: F0 04     BEQ b04_bra_9114
    CMPI.B  #$D0,D0  ; orig: C - - - - - 0x011120 04:9110: C9 D0     CMP #$D0
    BNE     b04_bra_9131             ; BNE  ; orig: C - - - - - 0x011122 04:9112: D0 1D     BNE b04_bra_9131
b04_bra_9114:  ; orig: b04_bra_9114:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x011124 04:9114: A5 84     LDA ram_pos_Y_link
    MOVE.B  D0,ram_0000_t2C_pos_link_1  ; orig: C - - - - - 0x011126 04:9116: 85 00     STA ram_0000_t2C_pos
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x011128 04:9118: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0001_t21_pos_link_2  ; orig: C - - - - - 0x01112A 04:911A: 85 01     STA ram_0001_t21_pos
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01112C 04:911C: A9 08     LDA #$08
    MOVE.B  D0,ram_0002_t27  ; orig: C - - - - - 0x01112E 04:911E: 85 02     STA ram_0002_t27
    MOVE.B  #$20,D2  ; orig: C - - - - - 0x011130 04:9120: A0 20     LDY #$20
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011132 04:9122: A9 00     LDA #$00
    BSR     sub_9262             ; JSR -> BSR  ; orig: C - - - - - 0x011134 04:9124: 20 62 92  JSR sub_9262
    MOVE.B  ram_0004_t15,D0  ; orig: C - - - - - 0x011137 04:9127: A5 04     LDA ram_0004_t15
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #tbl_90E0,A0
    MOVE.B  (A0,D2.L),D0

    JMP     loc_9155  ; orig: C - - - - - 0x01113E 04:912E: 4C 55 91  JMP loc_9155
b04_bra_9131:  ; orig: b04_bra_9131:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x011141 04:9131: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$5D,D0  ; orig: C - - - - - 0x011143 04:9133: C9 5D     CMP #$5D
    BEQ     b04_bra_913B             ; BEQ  ; orig: C - - - - - 0x011145 04:9135: F0 04     BEQ b04_bra_913B
    CMPI.B  #$BD,D0  ; orig: C - - - - - 0x011147 04:9137: C9 BD     CMP #$BD
    BNE     b04_bra_90F5_RTS             ; BNE  ; orig: C - - - - - 0x011149 04:9139: D0 BA     BNE b04_bra_90F5_RTS
b04_bra_913B:  ; orig: b04_bra_913B:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01114B 04:913B: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,ram_0000_t2C_pos_link_1  ; orig: C - - - - - 0x01114D 04:913D: 85 00     STA ram_0000_t2C_pos
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01114F 04:913F: A5 84     LDA ram_pos_Y_link
    MOVE.B  D0,ram_0001_t21_pos_link_2  ; orig: C - - - - - 0x011151 04:9141: 85 01     STA ram_0001_t21_pos
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x011153 04:9143: A9 02     LDA #$02
    MOVE.B  D0,ram_0002_t27  ; orig: C - - - - - 0x011155 04:9145: 85 02     STA ram_0002_t27
    MOVE.B  #$5D,D2  ; orig: C - - - - - 0x011157 04:9147: A0 5D     LDY #$5D
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x011159 04:9149: A9 20     LDA #$20
    BSR     sub_9262             ; JSR -> BSR  ; orig: C - - - - - 0x01115B 04:914B: 20 62 92  JSR sub_9262
    MOVEA.L #tbl_90E2,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_0004_t15,D0  ; orig: C - - - - - 0x011163 04:9153: A5 04     LDA ram_0004_t15
loc_9155:  ; orig: loc_9155:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_90A0,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01116D 04:915D: 29 0F     AND #$0F
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$60,D0  ; orig: C - - - - - 0x011171 04:9161: A9 60     LDA #$60
    ; (empty translation for STA)  ; orig: C - - - - - 0x011173 04:9163: 85 29     STA ram_timer_enemy 
    MOVE.B  #$18,D0  ; orig: C - - - - - 0x011175 04:9165: A9 18     LDA #$18
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01117A 04:916A: A9 08     LDA #$08
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01117F 04:916F: A9 00     LDA #$00
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01118A 04:917A: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x01118C 04:917C: 60        RTS



loc_917D:  ; orig: loc_917D:
    MOVEA.L #ram_00C0_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9187             ; BEQ  ; orig: C - - - - - 0x01118F 04:917F: F0 06     BEQ b04_bra_9187
    BSR     sub_0x01EEC8             ; JSR -> BSR  ; orig: C - - - - - 0x011191 04:9181: 20 B8 EE  JSR sub_0x01EEC8
b04_bra_9184:  ; orig: b04_bra_9184:
    JMP     loc_91D3  ; orig: C - - - - - 0x011194 04:9184: 4C D3 91  JMP loc_91D3
b04_bra_9187:  ; orig: b04_bra_9187:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x011197 04:9187: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x01119A 04:918A: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_9184             ; BNE  ; orig: C - - - - - 0x01119C 04:918C: D0 F6     BNE b04_bra_9184
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0111A0 04:9190: 85 0F     STA ram_000F_t01_dir
    BSR     sub_0x01F09D             ; JSR -> BSR  ; orig: C - - - - - 0x0111A2 04:9192: 20 8D F0  JSR sub_0x01F09D
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x0111A8 04:9198: C9 10     CMP #$10
    BEQ     b04_bra_91A0             ; BEQ  ; orig: C - - - - - 0x0111AA 04:919A: F0 04     BEQ b04_bra_91A0
    CMPI.B  #$F0,D0  ; orig: C - - - - - 0x0111AC 04:919C: C9 F0     CMP #$F0
    BNE     b04_bra_91D3             ; BNE  ; orig: C - - - - - 0x0111AE 04:919E: D0 33     BNE b04_bra_91D3
b04_bra_91A0:  ; orig: b04_bra_91A0:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0111B0 04:91A0: A9 00     LDA #$00
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0111B5 04:91A5: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_90A0,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0111BE 04:91AE: 29 0F     AND #$0F
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF041F,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0111C2 04:91B2: FE 1F 04  INC ram_041F,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$07,D0  ; orig: C - - - - - 0x0111C8 04:91B8: C9 07     CMP #$07
    BCC     b04_bra_91D3             ; BCC  ; orig: C - - - - - 0x0111CA 04:91BA: 90 17     BCC b04_bra_91D3
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_91D0             ; BEQ  ; orig: - - - - - - 0x0111CF 04:91BF: F0 0F     BEQ b04_bra_91D0
    BSR     sub_828A             ; JSR -> BSR  ; orig: - - - - - - 0x0111D1 04:91C1: 20 8A 82  JSR sub_828A
    MOVE.B  #con_script_03,D0  ; orig: - - - - - - 0x0111D4 04:91C4: A9 03     LDA #con_script_03
    MOVE.B  D0,ram_script  ; orig: - - - - - - 0x0111D6 04:91C6: 85 12     STA ram_script
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x0111D8 04:91C8: A9 00     LDA #$00    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x0111DA 04:91CA: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: - - - - - - 0x0111DC 04:91CC: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_subscript  ; orig: - - - - - - 0x0111DE 04:91CE: 85 13     STA ram_subscript
b04_bra_91D0:  ; orig: b04_bra_91D0:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: - - - - - - 0x0111E2 04:91D2: 60        RTS
b04_bra_91D3:  ; orig: b04_bra_91D3:
loc_91D3:  ; orig: loc_91D3:
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_921D             ; BNE  ; orig: C - - - - - 0x0111E6 04:91D6: D0 45     BNE b04_bra_921D
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0111E8 04:91D8: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_91E8             ; BEQ  ; orig: C - - - - - 0x0111EE 04:91DE: F0 08     BEQ b04_bra_91E8
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x0111F0 04:91E0: A9 40     LDA #con_obj_state_f
    MOVE.B  D0,ram_state_link  ; orig: - - - - - - 0x0111F2 04:91E2: 85 AC     STA ram_state_link
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x0111F4 04:91E4: A9 00     LDA #$00
    MOVE.B  D0,ram_00C0_link  ; orig: - - - - - - 0x0111F6 04:91E6: 85 C0     STA ram_00C0_link
b04_bra_91E8:  ; orig: b04_bra_91E8:
    MOVE.B  ram_counter_00_27,D0  ; orig: C - - - - - 0x0111F8 04:91E8: AD 41 03  LDA ram_counter_00_2
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0111FB 04:91EB: 48        PHA
    BSR     sub_9242             ; JSR -> BSR  ; orig: C - - - - - 0x0111FC 04:91EC: 20 42 92  JSR sub_9242
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x011202 04:91F2: 20 DF 77  JSR sub_bat_77DF
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011205 04:91F5: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011206 04:91F6: A8        TAY
    MOVEA.L #tbl_bat_77AB,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0000_t2D  ; orig: C - - - - - 0x01120A 04:91FA: 85 00     STA ram_0000_t2D
    MOVEA.L #$FF77AC,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01120C 04:91FC: B9 AC 77  LDA tbl_bat_77AB + $
    MOVE.B  (A0,D2.L),D0  ; ^
loc_91FF:  ; orig: loc_91FF:
    MOVE.B  D0,ram_0001_t17  ; orig: C - - - - - 0x01120F 04:91FF: 85 01     STA ram_0001_t17
    BSR     sub_929E             ; JSR -> BSR  ; orig: C - - - - - 0x011211 04:9201: 20 9E 92  JSR sub_929E
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x011214 04:9204: AE 40 03  LDX ram_obj_index
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_921C_RTS             ; BEQ  ; orig: C - - - - - 0x01121A 04:920A: F0 10     BEQ b04_bra_921C_RTS
    MOVE.B  ram_0000_t2D,D2  ; orig: C - - - - - 0x01121C 04:920C: A4 00     LDY ram_0000_t2D
    MOVEA.L #ram_spr_T,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$9C,D0  ; orig: C - - - - - 0x011221 04:9211: C9 9C     CMP #$9C
    BEQ     b04_bra_9217             ; BEQ  ; orig: C - - - - - 0x011223 04:9213: F0 02     BEQ b04_bra_9217
    MOVE.B  ram_0001_t17,D2  ; orig: C - - - - - 0x011225 04:9215: A4 01     LDY ram_0001_t17
b04_bra_9217:  ; orig: b04_bra_9217:
    MOVE.B  #$AC,D0  ; orig: C - - - - - 0x011227 04:9217: A9 AC     LDA #$AC
    MOVEA.L #ram_spr_T,A0
    MOVE.B  D0,(A0,D2.L)

b04_bra_921C_RTS:  ; orig: b04_bra_921C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01122C 04:921C: 60        RTS
b04_bra_921D:  ; orig: b04_bra_921D:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_pos_X_link  ; orig: - - - - - - 0x01122F 04:921F: 85 70     STA ram_pos_X_link
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_pos_Y_link  ; orig: - - - - - - 0x011233 04:9223: 85 84     STA ram_pos_Y_link
    BSR     sub_0x01F223             ; JSR -> BSR  ; orig: - - - - - - 0x011235 04:9225: 20 13 F2  JSR sub_0x01F223
    BSR     sub_bat_6EFB             ; JSR -> BSR  ; orig: - - - - - - 0x011238 04:9228: 20 FB 6E  JSR sub_bat_6EFB
    MOVE.B  ram_obj_index,D1  ; orig: - - - - - - 0x01123B 04:922B: AE 40 03  LDX ram_obj_index
    BSR     sub_9242             ; JSR -> BSR  ; orig: - - - - - - 0x01123E 04:922E: 20 42 92  JSR sub_9242
    MOVE.B  #$01,D0  ; orig: - - - - - - 0x011241 04:9231: A9 01     LDA #$01
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8293             ; JSR -> BSR  ; orig: - - - - - - 0x011246 04:9236: 20 93 82  JSR sub_8293
    MOVE.B  #$40,D0  ; orig: - - - - - - 0x011249 04:9239: A9 40     LDA #$40
    MOVE.B  D0,ram_0000_t2D  ; orig: - - - - - - 0x01124B 04:923B: 85 00     STA ram_0000_t2D
    MOVE.B  #$44,D0  ; orig: - - - - - - 0x01124D 04:923D: A9 44     LDA #$44
    JMP     loc_91FF  ; orig: - - - - - - 0x01124F 04:923F: 4C FF 91  JMP loc_91FF



sub_9242:  ; orig: sub_9242:
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011252 04:9242: A9 08     LDA #$08
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011254 04:9244: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_90A0,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x01125D 04:924D: 29 F0     AND #$F0
    ORI.B   #$01,D0  ; orig: C - - - - - 0x01125F 04:924F: 09 01     ORA #$01
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x011261 04:9251: 20 88 79  JSR sub_bat_7988_set
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x011264 04:9254: 29 40     AND #$40
    BEQ     b04_bra_9261_RTS             ; BEQ  ; orig: C - - - - - 0x011266 04:9256: F0 09     BEQ b04_bra_9261_RTS
    MOVE.B  ram_0004_t13_spr_A,D0  ; orig: C - - - - - 0x011268 04:9258: A5 04     LDA ram_0004_t13_spr
    ANDI.B  #$8F,D0  ; orig: C - - - - - 0x01126A 04:925A: 29 8F     AND #$8F
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01126C 04:925C: 20 88 79  JSR sub_bat_7988_set
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x01126F 04:925F: E6 0F     INC ram_000F_t04_fla
b04_bra_9261_RTS:  ; orig: b04_bra_9261_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011271 04:9261: 60        RTS



sub_9262:  ; orig: sub_9262:

; in

; ram_0000_t2C_pos_link_1

; ram_0002_t27
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D2,ram_0003_t08  ; orig: C - - - - - 0x011275 04:9265: 84 03     STY ram_0003_t08
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x011277 04:9267: A9 24     LDA #$24
    MOVE.B  ram_03F8_link,D2  ; orig: C - - - - - 0x011279 04:9269: AC F8 03  LDY ram_03F8_link
    BEQ     b04_bra_9270             ; BEQ  ; orig: C - - - - - 0x01127C 04:926C: F0 02     BEQ b04_bra_9270
    MOVE.B  #$32,D0  ; orig: C - - - - - 0x01127E 04:926E: A9 32     LDA #$32
b04_bra_9270:  ; orig: b04_bra_9270:
    MOVE.B  ram_dir_link,D2  ; orig: C - - - - - 0x011280 04:9270: A4 98     LDY ram_dir_link
    CMP.B   ram_0002_t27,D2  ; orig: C - - - - - 0x011282 04:9272: C4 02     CPY ram_0002_t27
    BNE     b04_bra_9286             ; BNE  ; orig: C - - - - - 0x011284 04:9274: D0 10     BNE b04_bra_9286
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011286 04:9276: 48        PHA
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01128A 04:927A: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01128B 04:927B: 69 08     ADC #$08
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011290 04:9280: 68        PLA
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x011291 04:9281: 49 FF     EOR #$FF
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011293 04:9283: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011294 04:9284: 69 01     ADC #$01
b04_bra_9286:  ; orig: b04_bra_9286:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011296 04:9286: 18        CLC
    MOVE.B  ram_0000_t2C_pos_link_1,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x011297 04:9287: 65 00     ADC ram_0000_t2C_pos

    MOVE.B  D0,ram_0004_t15  ; orig: C - - - - - 0x011299 04:9289: 85 04     STA ram_0004_t15
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x01129B 04:928B: A0 00     LDY #$00
    MOVE.B  ram_0001_t21_pos_link_2,D0  ; orig: C - - - - - 0x01129D 04:928D: A5 01     LDA ram_0001_t21_pos
    CMP.B   ram_0003_t08,D0  ; orig: C - - - - - 0x01129F 04:928F: C5 03     CMP ram_0003_t08
    BEQ     b04_bra_929D_RTS             ; BEQ  ; orig: C - - - - - 0x0112A1 04:9291: F0 0A     BEQ b04_bra_929D_RTS
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0112A6 04:9296: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0112A7 04:9297: 69 10     ADC #$10
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0112AC 04:929C: C8        INY
b04_bra_929D_RTS:  ; orig: b04_bra_929D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0112AD 04:929D: 60        RTS



sub_929E:  ; orig: sub_929E:

; in

; ram_0000_t2D

; ram_0001_t17
    MOVE.B  ram_0000_t2D,D2  ; orig: C - - - - - 0x0112AE 04:929E: A4 00     LDY ram_0000_t2D
    BSR     sub_92A5             ; JSR -> BSR  ; orig: C - - - - - 0x0112B0 04:92A0: 20 A5 92  JSR sub_92A5
    MOVE.B  ram_0001_t17,D2  ; orig: C - - - - - 0x0112B3 04:92A3: A4 01     LDY ram_0001_t17
sub_92A5:  ; orig: sub_92A5:
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x0112B5 04:92A5: A2 01     LDX #$01
b04_bra_92A7_loop:  ; orig: b04_bra_92A7_loop:
    MOVEA.L #ram_spr_X,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0112BA 04:92AA: 18        CLC
    ; !! ADC tbl_bat_6EF9,X - complex mode, manual review needed  ; orig: C - - - - - 0x0112BB 04:92AB: 7D F9 6E  ADC tbl_bat_6EF9,X
    CMPI.B  #$E9,D0  ; orig: C - - - - - 0x0112BE 04:92AE: C9 E9     CMP #$E9
    BCS     b04_bra_92B6             ; BCS  ; orig: C - - - - - 0x0112C0 04:92B0: B0 04     BCS b04_bra_92B6

; bzk bug maybe, 0x00678F has CMP 10
    CMPI.B  #$18,D0  ; orig: C - - - - - 0x0112C2 04:92B2: C9 18     CMP #$18
    BCS     b04_bra_92BE             ; BCS  ; orig: C - - - - - 0x0112C4 04:92B4: B0 08     BCS b04_bra_92BE
b04_bra_92B6:  ; orig: b04_bra_92B6:

; 00-17, E9-FF
    MOVEA.L #ram_spr_A,A0
    MOVE.B  (A0,D2.L),D0

    ORI.B   #$20,D0  ; orig: C - - - - - 0x0112C9 04:92B9: 09 20     ORA #$20
    MOVEA.L #ram_spr_A,A0
    MOVE.B  D0,(A0,D2.L)

b04_bra_92BE:  ; orig: b04_bra_92BE:

; 18-E8
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0112CE 04:92BE: CA        DEX
    BPL     b04_bra_92A7_loop             ; BPL  ; orig: C - - - - - 0x0112CF 04:92BF: 10 E6     BPL b04_bra_92A7_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0112D1 04:92C1: 60        RTS



ofs_005_0x0112D2_28:  ; orig: ofs_005_0x0112D2_28:

; con_obj_id_28

; in

; X = 01+
    MOVE.B  #$10,D0  ; orig: C - - J - - 0x0112D2 04:92C2: A9 10     LDA #$10
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0112D4 04:92C4: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x0112D7 04:92C7: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    MOVE.B  (A0,D2.L),D0

    BEQ     b04_bra_92D3_1st_quest             ; BEQ  ; orig: C - - - - - 0x0112DC 04:92CC: F0 05     BEQ bra_92D3_1st_que

; if 2nd quest
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0112DE 04:92CE: A9 40     LDA #$40
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0112E0 04:92D0: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_92D3_1st_quest:  ; orig: b04_bra_92D3_1st_quest:
    JMP     loc_8025  ; orig: C - - - - - 0x0112E3 04:92D3: 4C 25 80  JMP loc_8025



ofs_004_0x0112E6_28:  ; orig: ofs_004_0x0112E6_28:

; con_obj_id_28

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_03F8_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0112EB 04:92DB: 48        PHA
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x0112EC 04:92DC: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x0112EF 04:92DF: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_9304             ; BNE  ; orig: C - - - - - 0x0112F1 04:92E1: D0 21     BNE b04_bra_9304
    BSR     sub_0x01EFE0             ; JSR -> BSR  ; orig: C - - - - - 0x0112F3 04:92E3: 20 D0 EF  JSR sub_0x01EFE0
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0112F9 04:92E9: 29 0F     AND #$0F
    BNE     b04_bra_92F0             ; BNE  ; orig: C - - - - - 0x0112FB 04:92EB: D0 03     BNE b04_bra_92F0
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_92F0:  ; orig: b04_bra_92F0:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$60,D0  ; orig: C - - - - - 0x011303 04:92F3: C9 60     CMP #$60
    BEQ     b04_bra_9304             ; BEQ  ; orig: C - - - - - 0x011305 04:92F5: F0 0D     BEQ b04_bra_9304
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9304             ; BNE  ; orig: C - - - - - 0x011309 04:92F9: D0 09     BNE b04_bra_9304
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x01130D 04:92FD: 29 3F     AND #$3F
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_0x01F1EF             ; JSR -> BSR  ; orig: C - - - - - 0x011311 04:9301: 20 DF F1  JSR sub_0x01F1EF
b04_bra_9304:  ; orig: b04_bra_9304:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011314 04:9304: 68        PLA
    MOVEA.L #ram_dir_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_930E             ; BEQ  ; orig: C - - - - - 0x011317 04:9307: F0 05     BEQ b04_bra_930E
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x011319 04:9309: A9 20     LDA #$20
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_930E:  ; orig: b04_bra_930E:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$20,D0  ; orig: C - - - - - 0x011321 04:9311: C9 20     CMP #$20
    BNE     b04_bra_9337             ; BNE  ; orig: C - - - - - 0x011323 04:9313: D0 22     BNE b04_bra_9337
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9337             ; BNE  ; orig: C - - - - - 0x011328 04:9318: D0 1D     BNE b04_bra_9337
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01132A 04:931A: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01132C 04:931C: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x01132D 04:931D: F5 70     SBC ram_pos_X_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01132F 04:931F: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x011332 04:9322: C9 08     CMP #$08
    BCS     b04_bra_935F             ; BCS  ; orig: C - - - - - 0x011334 04:9324: B0 39     BCS b04_bra_935F
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x011336 04:9326: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01133A 04:932A: A5 84     LDA ram_pos_Y_link
    MOVEA.L #ram_pos_Y_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCC     b04_bra_9332             ; BCC  ; orig: C - - - - - 0x01133E 04:932E: 90 02     BCC b04_bra_9332
b04_bra_9330:  ; orig: b04_bra_9330:
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for LSR)  ; orig: C - - - - - 0x011340 04:9330: 56 98     LSR ram_dir_enemy,X
    MOVE.B  (A0,D1.L),D3  ; ^ load
    LSR.B   #1,D3  ; ^ lsr
    MOVE.B  D3,(A0,D1.L)  ; ^ store
b04_bra_9332:  ; orig: b04_bra_9332:
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x011342 04:9332: A9 60     LDA #$60
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9337:  ; orig: b04_bra_9337:
    MOVE.B  #$0A,D0  ; orig: C - - - - - 0x011347 04:9337: A9 0A     LDA #$0A
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011349 04:9339: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x01134E 04:933E: 29 02     AND #con_dir_Left
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011350 04:9340: 4A        LSR
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x011351 04:9341: 85 0F     STA ram_000F_t04_fla
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x011353 04:9343: A9 02     LDA #$02
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x011355 04:9345: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x011358 04:9348: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    MOVE.B  (A0,D2.L),D0

    BEQ     b04_bra_9356_1st_quest             ; BEQ  ; orig: C - - - - - 0x01135D 04:934D: F0 07     BEQ bra_9356_1st_que

; if 2nd quest
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01135F 04:934F: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x011361 04:9351: 29 03     AND #$03
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x011363 04:9353: 20 88 79  JSR sub_bat_7988_set
b04_bra_9356_1st_quest:  ; orig: b04_bra_9356_1st_quest:
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x011369 04:9359: 20 DF 77  JSR sub_bat_77DF
    JMP     loc_bat_79D0  ; orig: C - - - - - 0x01136C 04:935C: 4C D0 79  JMP loc_bat_79D0
b04_bra_935F:  ; orig: b04_bra_935F:
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01136F 04:935F: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x011371 04:9361: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x011372 04:9362: F5 84     SBC ram_pos_Y_enemy,
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x011374 04:9364: 20 1F 70  JSR sub_bat_701F_EOR
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x011377 04:9367: C9 08     CMP #$08
    BCS     b04_bra_9337             ; BCS  ; orig: C - - - - - 0x011379 04:9369: B0 CC     BCS b04_bra_9337
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x01137B 04:936B: A9 02     LDA #con_dir_Left
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01137F 04:936F: A5 70     LDA ram_pos_X_link
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCS     b04_bra_9330             ; BCS  ; orig: C - - - - - 0x011383 04:9373: B0 BB     BCS b04_bra_9330
    BCC     b04_bra_9332             ; BCC  ; orig: C - - - - - 0x011385 04:9375: 90 BB     BCC b04_bra_9332    ; jm



ofs_004_0x011387_2A:  ; orig: ofs_004_0x011387_2A:

; con_obj_id_2A

; in

; X = 01+
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x011387 04:9377: A9 80     LDA #$80
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x011389 04:9379: 20 6E 80  JSR sub_806E
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01138C 04:937C: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x01138F 04:937F: A9 08     LDA #$08
    BSR     sub_8476             ; JSR -> BSR  ; orig: C - - - - - 0x011391 04:9381: 20 76 84  JSR sub_8476
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x011394 04:9384: A9 20     LDA #$20
    MOVE.B  D0,ram_0001_t22_useless_20  ; orig: C - - - - - 0x011396 04:9386: 85 01     STA ram_0001_t22_use
    MOVE.B  ram_current_save_slot,D2  ; orig: C - - - - - 0x011398 04:9388: A4 16     LDY ram_current_save
    MOVEA.L #ram_current_quest,A0
    MOVE.B  (A0,D2.L),D0

    BEQ     b04_bra_93E1_RTS             ; BEQ  ; orig: C - - - - - 0x01139D 04:938D: F0 52     BEQ b04_bra_93E1_RTS

; if 2nd quest
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_939A             ; BNE  ; orig: - - - - - - 0x0113A2 04:9392: D0 06     BNE b04_bra_939A
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$F8,D0  ; orig: - - - - - - 0x0113A6 04:9396: C9 F8     CMP #$F8
    BCC     b04_bra_93E1_RTS             ; BCC  ; orig: - - - - - - 0x0113A8 04:9398: 90 47     BCC b04_bra_93E1_RTS
b04_bra_939A:  ; orig: b04_bra_939A:

; bzk optimize, always 20
    MOVE.B  ram_0001_t22_useless_20,D0  ; orig: - - - - - - 0x0113AA 04:939A: A5 01     LDA ram_0001_t22_use
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x0113AC 04:939C: 48        PHA
    MOVE.B  #$00,D2  ; orig: - - - - - - 0x0113AD 04:939D: A0 00     LDY #$00
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_93B1             ; BNE  ; orig: - - - - - - 0x0113B2 04:93A2: D0 0D     BNE b04_bra_93B1
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: - - - - - - 0x0113B7 04:93A7: 88        DEY
    BPL     b04_bra_93B1             ; BPL  ; orig: - - - - - - 0x0113B8 04:93A8: 10 07     BPL b04_bra_93B1
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_93DD             ; BEQ  ; orig: - - - - - - 0x0113BD 04:93AD: F0 2E     BEQ b04_bra_93DD
    MOVE.B  #$30,D2  ; orig: - - - - - - 0x0113BF 04:93AF: A0 30     LDY #$30
b04_bra_93B1:  ; orig: b04_bra_93B1:
    MOVE.B  D2,D0           ; TYA  ; orig: - - - - - - 0x0113C1 04:93B1: 98        TYA
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BEQ     b04_bra_93DD             ; BEQ  ; orig: - - - - - - 0x0113C5 04:93B5: F0 26     BEQ b04_bra_93DD
    CMPI.B  #$10,D2  ; orig: - - - - - - 0x0113C7 04:93B7: C0 10     CPY #$10
    BNE     b04_bra_93D9             ; BNE  ; orig: - - - - - - 0x0113C9 04:93B9: D0 1E     BNE b04_bra_93D9
    MOVE.B  ram_item_clock,D0  ; orig: - - - - - - 0x0113CB 04:93BB: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: - - - - - - 0x0113CE 04:93BE: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_93D9             ; BNE  ; orig: - - - - - - 0x0113D0 04:93C0: D0 17     BNE b04_bra_93D9
    MOVE.B  #con_obj_id_57,D0  ; orig: - - - - - - 0x0113D2 04:93C2: A9 57     LDA #con_obj_id_57

; bzk optimize, useless STA, will be overwritten at 0x013189
    MOVE.B  D0,ram_0000_t4A_useless  ; orig: - - - - - - 0x0113D4 04:93C4: 85 00     STA ram_0000_t4A_use
    BSR     sub_B179             ; JSR -> BSR  ; orig: - - - - - - 0x0113D6 04:93C6: 20 79 B1  JSR sub_B179
    BCC     b04_bra_93D2             ; BCC  ; orig: - - - - - - 0x0113D9 04:93C9: 90 07     BCC b04_bra_93D2
    MOVE.B  #$80,D0  ; orig: - - - - - - 0x0113DB 04:93CB: A9 80     LDA #$80
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0437,A0  ; Fix X: ; (empty translation for DEC)  ; orig: - - - - - - 0x0113DF 04:93CF: DE 37 04  DEC ram_0437_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_93D2:  ; orig: b04_bra_93D2:
    BCC     b04_bra_93DD             ; BCC  ; orig: - - - - - - 0x0113E2 04:93D2: 90 09     BCC b04_bra_93DD
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x0113E4 04:93D4: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_93D9:  ; orig: b04_bra_93D9:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x0113E9 04:93D9: 68        PLA
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x0113EA 04:93DA: A9 00     LDA #$00
    MOVE.B  D0,-(A7)        ; PHA  ; orig: - - - - - - 0x0113EC 04:93DC: 48        PHA
b04_bra_93DD:  ; orig: b04_bra_93DD:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: - - - - - - 0x0113ED 04:93DD: 68        PLA
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_93E1_RTS:  ; orig: b04_bra_93E1_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0113F1 04:93E1: 60        RTS



ofs_005_0x0113F2_41:  ; orig: ofs_005_0x0113F2_41:

; con_obj_id_41
    MOVE.B  #$09,D2  ; orig: C - - J - - 0x0113F2 04:93E2: A0 09     LDY #$09
b04_bra_93E4_loop:  ; orig: b04_bra_93E4_loop:
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x0113F4 04:93E4: A9 80     LDA #$80
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0113F6 04:93E6: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x0113F9 04:93E9: A9 70     LDA #$70
    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0113FB 04:93EB: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0113FE 04:93EE: A9 00     LDA #$00    ; con_di
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011400 04:93F0: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF03BD,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011403 04:93F3: 99 BD 03  STA ram_03BC_obj + $
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0406,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011406 04:93F6: 99 06 04  STA ram_0405_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0493,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011409 04:93F9: 99 93 04  STA ram_0492_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  ram_attr_enemy,D0  ; orig: C - - - - - 0x01140C 04:93FC: AD C0 04  LDA ram_attr_enemy
    MOVEA.L #$FF04C0,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01140F 04:93FF: 99 C0 04  STA ram_attr_enemy -
    MOVE.B  D0,(A0,D2.L)  ; ^
    ; (empty translation for LDA)  ; orig: C - - - - - 0x011412 04:9402: AD 86 04  LDA ram_hp_ememy - $
    MOVEA.L #$FF0486,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011415 04:9405: 99 86 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x011418 04:9408: A9 80     LDA #$80
    MOVEA.L #ram_0420,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$02,D0  ; orig: C - - - - - 0x01141D 04:940D: A9 02     LDA #$02
    MOVEA.L #ram_0445,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #con_obj_id_41,D0  ; orig: C - - - - - 0x011422 04:9412: A9 41     LDA #con_obj_id_41
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011427 04:9417: 88        DEY
    BPL     b04_bra_93E4_loop             ; BPL  ; orig: C - - - - - 0x011428 04:9418: 10 CA     BPL b04_bra_93E4_loop
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01142A 04:941A: A5 1D     LDA ram_indiv_random
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01142C 04:941C: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01142E 04:941E: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x011432 04:9422: 85 9D     STA ram_dir_enemy + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x011434 04:9424: 8D 85 03  STA ram_0380_enemy +
    ; (empty translation for LDA)  ; orig: C - - - - - 0x011437 04:9427: A5 22     LDA ram_indiv_random
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x011439 04:9429: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01143B 04:942B: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x01143F 04:942F: 85 A2     STA ram_dir_enemy + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x011441 04:9431: 8D 8A 03  STA ram_0380_enemy +
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x011444 04:9434: A9 01     LDA #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x011446 04:9436: 8D 31 04  STA ram_042B_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x011449 04:9439: 8D 36 04  STA ram_042B_enemy +
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x01144C 04:943C: A9 80     LDA #$80
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x01144E 04:943E: 8D D1 04  STA ram_04D1
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011451 04:9441: A9 08     LDA #$08
    MOVE.B  D0,ram_enemy_cnt  ; orig: C - - - - - 0x011453 04:9443: 8D 4E 03  STA ram_enemy_cnt
    RTS                     ; RTS  ; orig: C - - - - - 0x011456 04:9446: 60        RTS



ofs_005_0x011457_3D:  ; orig: ofs_005_0x011457_3D:

; con_obj_id_3D
    MOVE.B  #$E2,D0  ; orig: C - - J - - 0x011457 04:9447: A9 E2     LDA #$E2
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_sfx_1_10,D0  ; orig: C - - - - - 0x01145C 04:944C: A9 10     LDA #con_sfx_1_10
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x01145E 04:944E: 8D 01 06  STA ram_sfx_1
    MOVE.B  #$B0,D0  ; orig: C - - - - - 0x011461 04:9451: A9 B0     LDA #$B0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$80,D0  ; orig: C - - - - - 0x011465 04:9455: A9 80     LDA #$80
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011469 04:9459: 60        RTS



sub_945A:  ; orig: sub_945A:
ofs_005_0x01146A_38:  ; orig: ofs_005_0x01146A_38:

; con_obj_id_38
    MOVE.B  #con_sfx_1_40,D0  ; orig: C - - J - - 0x01146A 04:945A: A9 40     LDA #con_sfx_1_40
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x01146C 04:945C: 8D 01 06  STA ram_sfx_1
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$07,D0  ; orig: C - - - - - 0x011471 04:9461: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011473 04:9463: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$3F,D0  ; orig: C - - - - - 0x011479 04:9469: A9 3F     LDA #$3F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$80,D0  ; orig: C - - - - - 0x01147E 04:946E: A9 80     LDA #$80
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$03,D0  ; orig: C - - - - - 0x011483 04:9473: A9 03     LDA #$03
    MOVE.B  D0,ram_0507  ; orig: C - - - - - 0x011485 04:9475: 8D 07 05  STA ram_0507
    RTS                     ; RTS  ; orig: C - - - - - 0x011488 04:9478: 60        RTS



ofs_005_0x011489_39:  ; orig: ofs_005_0x011489_39:

; con_obj_id_39
    BSR     sub_945A             ; JSR -> BSR  ; orig: C - - J - - 0x011489 04:9479: 20 5A 94  JSR sub_945A
    MOVE.B  #con_obj_id_38,D0  ; orig: C - - - - - 0x01148C 04:947C: A9 38     LDA #con_obj_id_38
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01148E 04:947E: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x011491 04:9481: A9 01     LDA #$01
    MOVE.B  D0,ram_0507  ; orig: C - - - - - 0x011493 04:9483: 8D 07 05  STA ram_0507
    RTS                     ; RTS  ; orig: C - - - - - 0x011496 04:9486: 60        RTS



ofs_005_0x011497_31:  ; orig: ofs_005_0x011497_31:

; con_obj_id_31
ofs_005_0x011497_32:  ; orig: ofs_005_0x011497_32:

; con_obj_id_32
    MOVE.B  #con_sfx_1_20,D0  ; orig: C - - J - - 0x011497 04:9487: A9 20     LDA #con_sfx_1_20
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x011499 04:9489: 8D 01 06  STA ram_sfx_1
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x01149C 04:948C: A0 01     LDY #$01    ; con_di
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x0114A0 04:9490: C9 80     CMP #$80
    BCC     b04_bra_9495             ; BCC  ; orig: C - - - - - 0x0114A2 04:9492: 90 01     BCC b04_bra_9495
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0114A4 04:9494: C8        INY ; con_dir_Left
b04_bra_9495:  ; orig: b04_bra_9495:
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0114A5 04:9495: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x0114A7 04:9497: 60        RTS



ofs_004_0x0114A8_41:  ; orig: ofs_004_0x0114A8_41:

; con_obj_id_41

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9501_RTS             ; BEQ  ; orig: C - - - - - 0x0114AA 04:949A: F0 65     BEQ b04_bra_9501_RTS
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x0114AC 04:949C: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_94A7             ; BNE  ; orig: C - - - - - 0x0114AF 04:949F: D0 06     BNE b04_bra_94A7
    BSR     sub_9502             ; JSR -> BSR  ; orig: C - - - - - 0x0114B1 04:94A1: 20 02 95  JSR sub_9502
    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x0114B4 04:94A4: 20 88 B2  JSR sub_B288
b04_bra_94A7:  ; orig: b04_bra_94A7:
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x0114B7 04:94A7: A9 02     LDA #$02
    MOVE.B  D0,ram_0003_t16_spr_A  ; orig: C - - - - - 0x0114B9 04:94A9: 85 03     STA ram_0003_t16_spr
    MOVE.B  #$44,D0  ; orig: C - - - - - 0x0114BB 04:94AB: A9 44     LDA #$44
    BSR     sub_bat_7991             ; JSR -> BSR  ; orig: C - - - - - 0x0114BD 04:94AD: 20 91 79  JSR sub_bat_7991
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0114C2 04:94B2: 48        PHA
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0114C5 04:94B5: 48        PHA
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0114C6 04:94B6: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0114C9 04:94B9: 68        PLA
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0114CC 04:94BC: 68        PLA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9501_RTS             ; BEQ  ; orig: C - - - - - 0x0114D2 04:94C2: F0 3D     BEQ b04_bra_9501_RTS
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0114D4 04:94C4: A9 20     LDA #$20
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0114D6 04:94C6: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    BSR     sub_979A             ; JSR -> BSR  ; orig: C - - - - - 0x0114D9 04:94C9: 20 9A 97  JSR sub_979A
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x0114DC 04:94CC: A0 FF     LDY #$FF
    CMPI.B  #$06,D1  ; orig: C - - - - - 0x0114DE 04:94CE: E0 06     CPX #$06
    BCC     b04_bra_94D4             ; BCC  ; orig: C - - - - - 0x0114E0 04:94D0: 90 02     BCC b04_bra_94D4
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x0114E2 04:94D2: A0 04     LDY #$04
b04_bra_94D4:  ; orig: b04_bra_94D4:
b04_bra_94D4_loop:  ; orig: b04_bra_94D4_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0114E4 04:94D4: C8        INY
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #con_obj_id_41,D0  ; orig: C - - - - - 0x0114E8 04:94D8: C9 41     CMP #con_obj_id_41
    BNE     b04_bra_94D4_loop             ; BNE  ; orig: C - - - - - 0x0114EA 04:94DA: D0 F8     BNE b04_bra_94D4_loop
    MOVE.B  #$11,D0  ; orig: C - - - - - 0x0114EC 04:94DC: A9 11     LDA #$11
    MOVEA.L #$FF0029,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0114EE 04:94DE: 99 29 00  STA ram_timer_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF04F1,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0114F4 04:94E4: 99 F1 04  STA ram_invinc_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0114F9 04:94E9: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0114FE 04:94EE: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    CMPI.B  #$04,D2  ; orig: C - - - - - 0x011501 04:94F1: C0 04     CPY #$04
    BEQ     b04_bra_9501_RTS             ; BEQ  ; orig: C - - - - - 0x011503 04:94F3: F0 0C     BEQ b04_bra_9501_RTS
    CMPI.B  #$09,D2  ; orig: C - - - - - 0x011505 04:94F5: C0 09     CPY #$09
    BEQ     b04_bra_9501_RTS             ; BEQ  ; orig: C - - - - - 0x011507 04:94F7: F0 08     BEQ b04_bra_9501_RTS
    MOVE.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x011509 04:94F9: A9 5D     LDA #con_obj_id_5D
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  D0,(A0,D2.L)


; bzk optimize, JMP
    BSR     sub_0x01FEEA             ; JSR -> BSR  ; orig: C - - - - - 0x01150E 04:94FE: 20 DA FE  JSR sub_0x01FEEA
b04_bra_9501_RTS:  ; orig: b04_bra_9501_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011511 04:9501: 60        RTS



sub_9502:  ; orig: sub_9502:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x011515 04:9505: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_034_9510_00  -- needs manual handling  ; orig: - - - - - - 0x011518 04:9508: 10 95     .word ofs_034_9510_0
    ; [DIRECTIVE] .WORD ofs_034_9510_01  -- needs manual handling  ; orig: - - - - - - 0x01151A 04:950A: 10 95     .word ofs_034_9510_0
    ; [DIRECTIVE] .WORD ofs_034_9510_02  -- needs manual handling  ; orig: - D 0 - I - 0x01151C 04:950C: 10 95     .word ofs_034_9510_0
    ; [DIRECTIVE] .WORD ofs_034_952B_03  -- needs manual handling  ; orig: - D 0 - I - 0x01151E 04:950E: 2B 95     .word ofs_034_952B_0



ofs_034_9510_00:  ; orig: ofs_034_9510_00:
ofs_034_9510_01:  ; orig: ofs_034_9510_01:
ofs_034_9510_02:  ; orig: ofs_034_9510_02:
    CMPI.B  #$05,D1  ; orig: C - - J - - 0x011520 04:9510: E0 05     CPX #$05
    BEQ     b04_bra_9518             ; BEQ  ; orig: C - - - - - 0x011522 04:9512: F0 04     BEQ b04_bra_9518
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x011524 04:9514: E0 0A     CPX #$0A
    BNE     b04_bra_956B_RTS             ; BNE  ; orig: C - - - - - 0x011526 04:9516: D0 53     BNE b04_bra_956B_RTS
b04_bra_9518:  ; orig: b04_bra_9518:
    BSR     sub_B308             ; JSR -> BSR  ; orig: C - - - - - 0x011528 04:9518: 20 08 B3  JSR sub_B308
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_953A             ; BNE  ; orig: C - - - - - 0x01152D 04:951D: D0 1B     BNE b04_bra_953A
b04_bra_951F:  ; orig: b04_bra_951F:
    BSR     sub_956C             ; JSR -> BSR  ; orig: C - - - - - 0x01152F 04:951F: 20 6C 95  JSR sub_956C
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x011532 04:9522: A9 10     LDA #$10
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0097,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_953A             ; BNE  ; orig: C - - - - - 0x011538 04:9528: D0 10     BNE b04_bra_953A
    RTS                     ; RTS  ; orig: C - - - - - 0x01153A 04:952A: 60        RTS



ofs_034_952B_03:  ; orig: ofs_034_952B_03:
    CMPI.B  #$05,D1  ; orig: C - - J - - 0x01153B 04:952B: E0 05     CPX #$05
    BEQ     b04_bra_9533             ; BEQ  ; orig: C - - - - - 0x01153D 04:952D: F0 04     BEQ b04_bra_9533
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x01153F 04:952F: E0 0A     CPX #$0A
    BNE     b04_bra_956B_RTS             ; BNE  ; orig: C - - - - - 0x011541 04:9531: D0 38     BNE b04_bra_956B_RTS
b04_bra_9533:  ; orig: b04_bra_9533:
    BSR     sub_B378             ; JSR -> BSR  ; orig: C - - - - - 0x011543 04:9533: 20 78 B3  JSR sub_B378
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_951F             ; BEQ  ; orig: C - - - - - 0x011548 04:9538: F0 E5     BEQ b04_bra_951F
b04_bra_953A:  ; orig: b04_bra_953A:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01154C 04:953C: C9 10     CMP #$10
    BNE     b04_bra_956B_RTS             ; BNE  ; orig: C - - - - - 0x01154E 04:953E: D0 2B     BNE b04_bra_956B_RTS
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_954C             ; BEQ  ; orig: C - - - - - 0x011553 04:9543: F0 07     BEQ b04_bra_954C
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011557 04:9547: A9 00     LDA #$00
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_954C:  ; orig: b04_bra_954C:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x01155C 04:954C: A9 04     LDA #$04
    MOVE.B  D0,ram_0000_t2E_loop_counter  ; orig: C - - - - - 0x01155E 04:954E: 85 00     STA ram_0000_t2E_loo
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x011560 04:9550: A0 00     LDY #$00
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x011562 04:9552: E0 05     CPX #$05
    BEQ     b04_bra_9558             ; BEQ  ; orig: C - - - - - 0x011564 04:9554: F0 02     BEQ b04_bra_9558
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x011566 04:9556: A0 05     LDY #$05
b04_bra_9558:  ; orig: b04_bra_9558:
b04_bra_9558_loop:  ; orig: b04_bra_9558_loop:
    MOVEA.L #$FF0382,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x011568 04:9558: B9 82 03  LDA ram_0380_enemy +
    MOVE.B  (A0,D2.L),D0  ; ^
    MOVEA.L #$FF0381,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01156B 04:955B: 99 81 03  STA ram_0380_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01156E 04:955E: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011571 04:9561: C8        INY
    SUBQ.B  #1,ram_0000_t2E_loop_counter  ; orig: C - - - - - 0x011572 04:9562: C6 00     DEC ram_0000_t2E_loo
    BNE     b04_bra_9558_loop             ; BNE  ; orig: C - - - - - 0x011574 04:9564: D0 F2     BNE b04_bra_9558_loop
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_956B_RTS:  ; orig: b04_bra_956B_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01157B 04:956B: 60        RTS



sub_956C:  ; orig: sub_956C:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x01157C 04:956C: A0 02     LDY #$02
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$40,D0  ; orig: C - - - - - 0x011580 04:9570: C9 40     CMP #$40
    BCS     b04_bra_9575             ; BCS  ; orig: C - - - - - 0x011582 04:9572: B0 01     BCS b04_bra_9575
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011584 04:9574: C8        INY
b04_bra_9575:  ; orig: b04_bra_9575:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011585 04:9575: 98        TYA
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011589 04:9579: A9 08     LDA #$08
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01158E 04:957E: 60        RTS



tbl_957F_pos_X:  ; orig: tbl_957F_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x01158F 04:957F: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011590 04:9580: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011591 04:9581: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x011592 04:9582: F0        .byte $F0   ;



tbl_9583_pos_Y:  ; orig: tbl_9583_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011593 04:9583: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011594 04:9584: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x011595 04:9585: F0        .byte $F0   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011596 04:9586: 10        .byte $10   ;



b04_bra_9587:
; bzk fucking developers
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011597 04:9587: 88        DEY
    BNE     b04_bra_9599             ; BNE  ; orig: C - - - - - 0x011598 04:9588: D0 0F     BNE b04_bra_9599
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_95FC             ; BNE  ; orig: C - - - - - 0x01159D 04:958D: D0 6D     BNE b04_bra_95FC
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x01159F 04:958F: A9 40     LDA #$40
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,ram_051B  ; orig: C - - - - - 0x0115A3 04:9593: EE 1B 05  INC ram_051B
    JMP     loc_9621  ; orig: C - - - - - 0x0115A6 04:9596: 4C 21 96  JMP loc_9621
b04_bra_9599:  ; orig: b04_bra_9599:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_95AE             ; BEQ  ; orig: C - - - - - 0x0115AB 04:959B: F0 11     BEQ b04_bra_95AE
    ANDI.B  #$07,D0  ; orig: - - - - - - 0x0115AD 04:959D: 29 07     AND #$07
    BNE     b04_bra_95AB             ; BNE  ; orig: - - - - - - 0x0115AF 04:959F: D0 0A     BNE b04_bra_95AB
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #$01,D0  ; orig: - - - - - - 0x0115B4 04:95A4: 49 01     EOR #$01
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BEQ     b04_bra_9621             ; BEQ  ; orig: - - - - - - 0x0115B9 04:95A9: F0 76     BEQ b04_bra_9621
b04_bra_95AB:  ; orig: b04_bra_95AB:
    JMP     loc_9658  ; orig: - - - - - - 0x0115BB 04:95AB: 4C 58 96  JMP loc_9658
b04_bra_95AE:  ; orig: b04_bra_95AE:
    SUBQ.B  #1,ram_051B  ; orig: C - - - - - 0x0115BE 04:95AE: CE 1B 05  DEC ram_051B
    MOVE.B  ram_0507,D0  ; orig: C - - - - - 0x0115C1 04:95B1: AD 07 05  LDA ram_0507
    MOVE.B  D0,ram_0000_t1B_loop_counter  ; orig: C - - - - - 0x0115C4 04:95B4: 85 00     STA ram_0000_t1B_loo
    MOVE.B  D0,ram_enemy_cnt  ; orig: C - - - - - 0x0115C6 04:95B6: 8D 4E 03  STA ram_enemy_cnt
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0115C9 04:95B9: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0115CA 04:95BA: 48        PHA
b04_bra_95BB_loop:  ; orig: b04_bra_95BB_loop:
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0115CB 04:95BB: E8        INX
    BSR     sub_945A             ; JSR -> BSR  ; orig: C - - - - - 0x0115CC 04:95BC: 20 5A 94  JSR sub_945A
    MOVE.B  #con_obj_id_18,D0  ; orig: C - - - - - 0x0115CF 04:95BF: A9 18     LDA #con_obj_id_18
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0115D1 04:95C1: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0444,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0115D4 04:95C4: FE 44 04  INC ram_0444_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0115D7 04:95C7: A9 01     LDA #$01
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0115DC 04:95CC: A9 00     LDA #$00
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x0115E1 04:95D1: A5 71     LDA ram_pos_X_enemy 
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x0115E5 04:95D5: A5 85     LDA ram_pos_Y_enemy 
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    SUBQ.B  #1,ram_0000_t1B_loop_counter  ; orig: C - - - - - 0x0115E9 04:95D9: C6 00     DEC ram_0000_t1B_loo
    BNE     b04_bra_95BB_loop             ; BNE  ; orig: C - - - - - 0x0115EB 04:95DB: D0 DE     BNE b04_bra_95BB_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0115ED 04:95DD: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x0115EE 04:95DE: AA        TAX
    BSR     b04_sub_B010             ; JSR -> BSR  ; orig: C - - - - - 0x0115EF 04:95DF: 20 10 B0  JSR b04_sub_B010
    MOVE.B  #con_obj_id_null,D0  ; orig: C - - - - - 0x0115F2 04:95E2: A9 00     LDA #con_obj_id_null
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0115F4 04:95E4: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    JMP     loc_9658  ; orig: C - - - - - 0x0115F7 04:95E7: 4C 58 96  JMP loc_9658
b04_bra_95EA:  ; orig: b04_bra_95EA:
    BSR     sub_B31A             ; JSR -> BSR  ; orig: C - - - - - 0x0115FA 04:95EA: 20 1A B3  JSR sub_B31A
    JMP     loc_9610  ; orig: C - - - - - 0x0115FD 04:95ED: 4C 10 96  JMP loc_9610



ofs_004_0x011600_18:  ; orig: ofs_004_0x011600_18:

; con_obj_id_18
ofs_004_0x011600_38:  ; orig: ofs_004_0x011600_38:

; con_obj_id_38
ofs_004_0x011600_39:  ; orig: ofs_004_0x011600_39:

; con_obj_id_39

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x011600 04:95F0: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x011603 04:95F3: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_9613             ; BNE  ; orig: C - - - - - 0x011605 04:95F5: D0 1C     BNE b04_bra_9613
    MOVE.B  ram_051B,D2  ; orig: C - - - - - 0x011607 04:95F7: AC 1B 05  LDY ram_051B
    BNE     b04_bra_9587             ; BNE  ; orig: C - - - - - 0x01160A 04:95FA: D0 8B     BNE b04_bra_9587    ; br
b04_bra_95FC:  ; orig: b04_bra_95FC:
    BSR     sub_968E             ; JSR -> BSR  ; orig: C - - - - - 0x01160C 04:95FC: 20 8E 96  JSR sub_968E
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9610             ; BNE  ; orig: C - - - - - 0x011611 04:9601: D0 0D     BNE b04_bra_9610
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x011613 04:9603: A9 10     LDA #$10
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x011619 04:9609: C9 80     CMP #$80
    BCS     b04_bra_95EA             ; BCS  ; orig: C - - - - - 0x01161B 04:960B: B0 DD     BCS b04_bra_95EA
    BSR     sub_B388             ; JSR -> BSR  ; orig: C - - - - - 0x01161D 04:960D: 20 88 B3  JSR sub_B388
b04_bra_9610:  ; orig: b04_bra_9610:
loc_9610:  ; orig: loc_9610:
    BSR     sub_96EB             ; JSR -> BSR  ; orig: C D 0 - - - 0x011620 04:9610: 20 EB 96  JSR sub_96EB
b04_bra_9613:  ; orig: b04_bra_9613:
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9621             ; BEQ  ; orig: C - - - - - 0x011626 04:9616: F0 09     BEQ b04_bra_9621
    BSR     sub_B2CD             ; JSR -> BSR  ; orig: C - - - - - 0x011628 04:9618: 20 CD B2  JSR sub_B2CD
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01162B 04:961B: 20 D0 79  JSR sub_bat_79D0
    JMP     loc_9748  ; orig: C - - - - - 0x01162E 04:961E: 4C 48 97  JMP loc_9748
b04_bra_9621:  ; orig: b04_bra_9621:
loc_9621:  ; orig: loc_9621:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011633 04:9623: 48        PHA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011636 04:9626: 48        PHA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011637 04:9627: A9 00     LDA #$00
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_962C_loop:  ; orig: b04_bra_962C_loop:
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011641 04:9631: 18        CLC
    ; !! ADC tbl_957F_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011642 04:9632: 79 7F 95  ADC tbl_957F_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011649 04:9639: 18        CLC
    ; !! ADC tbl_9583_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01164A 04:963A: 79 83 95  ADC tbl_9583_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_B2CD             ; JSR -> BSR  ; orig: C - - - - - 0x01164F 04:963F: 20 CD B2  JSR sub_B2CD
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011652 04:9642: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011655 04:9645: FE 78 04  INC ram_0478_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01165B 04:964B: C9 04     CMP #$04
    BCC     b04_bra_962C_loop             ; BCC  ; orig: C - - - - - 0x01165D 04:964D: 90 DD     BCC b04_bra_962C_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01165F 04:964F: 68        PLA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011662 04:9652: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9748             ; JSR -> BSR  ; orig: C - - - - - 0x011665 04:9655: 20 48 97  JSR sub_9748
loc_9658:  ; orig: loc_9658:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01166A 04:965A: 48        PHA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01166D 04:965D: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01166E 04:965E: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01166F 04:965F: 69 08     ADC #$08
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011675 04:9665: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011676 04:9666: 69 08     ADC #$08
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01167D 04:966D: 48        PHA
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01167E 04:966E: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011681 04:9671: 48        PHA
    MOVE.B  #con_obj_id_18,D0  ; orig: C - - - - - 0x011682 04:9672: A9 18     LDA #con_obj_id_18
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011684 04:9674: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x011687 04:9677: A9 01     LDA #$01
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9748             ; JSR -> BSR  ; orig: C - - - - - 0x01168C 04:967C: 20 48 97  JSR sub_9748
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01168F 04:967F: 68        PLA
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x011690 04:9680: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011693 04:9683: 68        PLA
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011697 04:9687: 68        PLA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01169A 04:968A: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01169D 04:968D: 60        RTS



sub_968E:  ; orig: sub_968E:
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0116A1 04:9691: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_035_9698_00  -- needs manual handling  ; orig: - D 0 - I - 0x0116A4 04:9694: 98 96     .word ofs_035_9698_0
    ; [DIRECTIVE] .WORD ofs_035_96B8_01  -- needs manual handling  ; orig: - D 0 - I - 0x0116A6 04:9696: B8 96     .word ofs_035_96B8_0



ofs_035_9698_00:  ; orig: ofs_035_9698_00:
    MOVEA.L #$FF041F,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - J - - 0x0116A8 04:9698: FE 1F 04  INC ram_041F,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_96A0             ; BNE  ; orig: C - - - - - 0x0116AB 04:969B: D0 03     BNE b04_bra_96A0
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for INC)  ; orig: - - - - - - 0x0116AD 04:969D: FE 2C 04  INC ram_042B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_96A0:  ; orig: b04_bra_96A0:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0437_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_96EA_RTS             ; BNE  ; orig: C - - - - - 0x0116B6 04:96A6: D0 42     BNE b04_bra_96EA_RTS
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0444_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_96EA_RTS             ; BNE  ; orig: C - - - - - 0x0116BE 04:96AE: D0 3A     BNE b04_bra_96EA_RTS
    MOVEA.L #$FF045E,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0116C0 04:96B0: FE 5E 04  INC ram_045E_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0116C3 04:96B3: A9 40     LDA #$40
    JMP     loc_96DA  ; orig: C - - - - - 0x0116C5 04:96B5: 4C DA 96  JMP loc_96DA



ofs_035_96B8_01:  ; orig: ofs_035_96B8_01:
    MOVEA.L #$FF041F,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - J - - 0x0116C8 04:96B8: DE 1F 04  DEC ram_041F,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x0116CE 04:96BE: C9 FF     CMP #$FF
    BNE     b04_bra_96C5             ; BNE  ; orig: C - - - - - 0x0116D0 04:96C0: D0 03     BNE b04_bra_96C5
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for DEC)  ; orig: - - - - - - 0x0116D2 04:96C2: DE 2C 04  DEC ram_042B_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_96C5:  ; orig: b04_bra_96C5:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0437_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_96EA_RTS             ; BNE  ; orig: C - - - - - 0x0116DB 04:96CB: D0 1D     BNE b04_bra_96EA_RTS
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0444_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_96EA_RTS             ; BNE  ; orig: - - - - - - 0x0116E3 04:96D3: D0 15     BNE b04_bra_96EA_RTS
    MOVEA.L #$FF045E,A0  ; Fix X: ; (empty translation for DEC)  ; orig: - - - - - - 0x0116E5 04:96D5: DE 5E 04  DEC ram_045E_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$80,D0  ; orig: - - - - - - 0x0116E8 04:96D8: A9 80     LDA #$80
loc_96DA:  ; orig: loc_96DA:
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0116ED 04:96DD: A9 00     LDA #$00
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_96EA_RTS             ; BEQ  ; orig: C - - - - - 0x0116F5 04:96E5: F0 03     BEQ b04_bra_96EA_RTS
    MOVEA.L #$FF0444,A0  ; Fix X: ; (empty translation for INC)  ; orig: - - - - - - 0x0116F7 04:96E7: FE 44 04  INC ram_0444_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_96EA_RTS:  ; orig: b04_bra_96EA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0116FA 04:96EA: 60        RTS



sub_96EB:  ; orig: sub_96EB:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$E0,D0  ; orig: C - - - - - 0x0116FE 04:96EE: 29 E0     AND #$E0
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011700 04:96F0: 18        CLC
    ; !! ADC ram_0412,X - complex mode, manual review needed  ; orig: C - - - - - 0x011701 04:96F1: 7D 12 04  ADC ram_0412,X
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01170A 04:96FA: 69 00     ADC #$00
    MOVE.B  D0,ram_0003_t17  ; orig: C - - - - - 0x01170C 04:96FC: 85 03     STA ram_0003_t17
    MOVE.B  #$A1,D0  ; orig: C - - - - - 0x01170E 04:96FE: A9 A1     LDA #$A1
    MOVE.B  D0,ram_0002_t28  ; orig: C - - - - - 0x011710 04:9700: 85 02     STA ram_0002_t28
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BTST    D0,ram_0002_t28  ; BIT abs  ; orig: C - - - - - 0x011714 04:9704: 24 02     BIT ram_0002_t28
    BEQ     b04_bra_970F             ; BEQ  ; orig: C - - - - - 0x011716 04:9706: F0 07     BEQ b04_bra_970F
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01171A 04:970A: 18        CLC
    MOVE.B  ram_0003_t17,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x01171B 04:970B: 65 03     ADC ram_0003_t17

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_970F:  ; orig: b04_bra_970F:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t28).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t28).l  ; orig: C - - - - - 0x011721 04:9711: 06 02     ASL ram_0002_t28    

    BTST    D0,ram_0002_t28  ; BIT abs  ; orig: C - - - - - 0x011723 04:9713: 24 02     BIT ram_0002_t28
    BEQ     b04_bra_971D             ; BEQ  ; orig: C - - - - - 0x011725 04:9715: F0 06     BEQ b04_bra_971D
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t17,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x011729 04:9719: E5 03     SBC ram_0003_t17

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_971D:  ; orig: b04_bra_971D:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t28).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t28).l  ; orig: C - - - - - 0x01172F 04:971F: 06 02     ASL ram_0002_t28    

    BTST    D0,ram_0002_t28  ; BIT abs  ; orig: C - - - - - 0x011731 04:9721: 24 02     BIT ram_0002_t28
    BEQ     b04_bra_972B             ; BEQ  ; orig: C - - - - - 0x011733 04:9723: F0 06     BEQ b04_bra_972B
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t17,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x011737 04:9727: 65 03     ADC ram_0003_t17

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_972B:  ; orig: b04_bra_972B:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t28).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t28).l  ; orig: C - - - - - 0x01173D 04:972D: 06 02     ASL ram_0002_t28    

    BTST    D0,ram_0002_t28  ; BIT abs  ; orig: C - - - - - 0x01173F 04:972F: 24 02     BIT ram_0002_t28
    BEQ     b04_bra_9739             ; BEQ  ; orig: C - - - - - 0x011741 04:9731: F0 06     BEQ b04_bra_9739
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t17,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x011745 04:9735: E5 03     SBC ram_0003_t17

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9739:  ; orig: b04_bra_9739:
    JMP     loc_0x01FAA3  ; orig: C - - - - - 0x011749 04:9739: 4C 93 FA  JMP loc_0x01FAA3



tbl_973C_pos_X:  ; orig: tbl_973C_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x01174C 04:973C: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x01174D 04:973D: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x01174E 04:973E: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x01174F 04:973F: 10        .byte $10   ; 03



tbl_9740_pos_Y:  ; orig: tbl_9740_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011750 04:9740: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011751 04:9741: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011752 04:9742: 10        .byte $10   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011753 04:9743: 10        .byte $10   ; 03



tbl_9744:  ; orig: tbl_9744:
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x011754 04:9744: 03        .byte $03   ; 00
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x011755 04:9745: 03        .byte $03   ; 01
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 0 - - - 0x011756 04:9746: 83        .byte $83   ; 02
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 0 - - - 0x011757 04:9747: 83        .byte $83   ; 03



loc_9748:  ; orig: loc_9748:
sub_9748:  ; orig: sub_9748:
    MOVE.B  #$06,D0  ; orig: C D 0 - - - 0x011758 04:9748: A9 06     LDA #$06
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x01175A 04:974A: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_977D             ; BNE  ; orig: C - - - - - 0x011760 04:9750: D0 2B     BNE b04_bra_977D
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x011762 04:9752: A0 00     LDY #$00
b04_bra_9754_loop:  ; orig: b04_bra_9754_loop:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011766 04:9756: 18        CLC
    ; !! ADC tbl_973C_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011767 04:9757: 79 3C 97  ADC tbl_973C_pos_X,Y
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x01176A 04:975A: 85 00     STA ram_0000_t21_spr
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01176E 04:975E: 18        CLC
    ; !! ADC tbl_9740_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01176F 04:975F: 79 40 97  ADC tbl_9740_pos_Y,Y
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x011772 04:9762: 85 01     STA ram_0001_t15_spr
    MOVEA.L #tbl_9744,A0
    MOVE.B  (A0,D2.L),D0

    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x011777 04:9767: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01177A 04:976A: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01177B 04:976B: 48        PHA
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x01177C 04:976C: 29 01     AND #$01
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01177E 04:976E: 85 0F     STA ram_000F_t04_fla
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011780 04:9770: A9 00     LDA #$00
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x011782 04:9772: 20 DF 77  JSR sub_bat_77DF
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011785 04:9775: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011786 04:9776: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011787 04:9777: C8        INY
    CMPI.B  #$04,D2  ; orig: C - - - - - 0x011788 04:9778: C0 04     CPY #$04
    BNE     b04_bra_9754_loop             ; BNE  ; orig: C - - - - - 0x01178A 04:977A: D0 D8     BNE b04_bra_9754_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01178C 04:977C: 60        RTS
b04_bra_977D:  ; orig: b04_bra_977D:
    BSR     sub_9AFB             ; JSR -> BSR  ; orig: C - - - - - 0x01178D 04:977D: 20 FB 9A  JSR sub_9AFB
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    JMP     loc_bat_77DB  ; orig: C - - - - - 0x011793 04:9783: 4C DB 77  JMP loc_bat_77DB



ofs_004_0x011796_3D:  ; orig: ofs_004_0x011796_3D:

; con_obj_id_3D

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x011796 04:9786: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_9791             ; BNE  ; orig: C - - - - - 0x011799 04:9789: D0 06     BNE b04_bra_9791
    BSR     sub_97A2             ; JSR -> BSR  ; orig: C - - - - - 0x01179B 04:978B: 20 A2 97  JSR sub_97A2
    BSR     sub_97EF             ; JSR -> BSR  ; orig: C - - - - - 0x01179E 04:978E: 20 EF 97  JSR sub_97EF
b04_bra_9791:  ; orig: b04_bra_9791:
    BSR     sub_984C             ; JSR -> BSR  ; orig: C - - - - - 0x0117A1 04:9791: 20 4C 98  JSR sub_984C
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0117A4 04:9794: 20 D0 79  JSR sub_bat_79D0
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x0117A7 04:9797: 20 00 80  JSR sub_8000
sub_979A:  ; orig: sub_979A:
    BSR     sub_800D             ; JSR -> BSR  ; orig: C - - - - - 0x0117AA 04:979A: 20 0D 80  JSR sub_800D
    JMP     loc_0x01EEF4  ; orig: C - - - - - 0x0117AD 04:979D: 4C E4 EE  JMP loc_0x01EEF4



tbl_97A0_pos_X:  ; orig: tbl_97A0_pos_X:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x0117B0 04:97A0: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x0117B1 04:97A1: FF        .byte $FF   ; 01



sub_97A2:  ; orig: sub_97A2:
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_97B9             ; BNE  ; orig: C - - - - - 0x0117B5 04:97A5: D0 12     BNE b04_bra_97B9
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0117B9 04:97A9: 48        PHA
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0117BA 04:97AA: 29 0F     AND #$0F
    ORI.B   #$07,D0  ; orig: C - - - - - 0x0117BC 04:97AC: 09 07     ORA #$07
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0117C1 04:97B1: 68        PLA
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0117C2 04:97B2: 29 01     AND #$01
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0117C4 04:97B4: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0117C5 04:97B5: C8        INY
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0117C6 04:97B6: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x0117C8 04:97B8: 60        RTS
b04_bra_97B9:  ; orig: b04_bra_97B9:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x0117C9 04:97B9: A5 15     LDA ram_frm_cnt
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0117CB 04:97BB: 29 07     AND #$07
    BNE     b04_bra_97EE_RTS             ; BNE  ; orig: C - - - - - 0x0117CD 04:97BD: D0 2F     BNE b04_bra_97EE_RTS
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$88,D0  ; orig: C - - - - - 0x0117D1 04:97C1: C9 88     CMP #$88
    BCS     b04_bra_97CF             ; BCS  ; orig: C - - - - - 0x0117D3 04:97C3: B0 0A     BCS b04_bra_97CF
    MOVE.B  #$88,D0  ; orig: - - - - - - 0x0117D5 04:97C5: A9 88     LDA #$88
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_dir_Right,D0  ; orig: - - - - - - 0x0117D9 04:97C9: A9 01     LDA #con_dir_Right
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BNE     b04_bra_97DB             ; BNE  ; orig: - - - - - - 0x0117DD 04:97CD: D0 0C     BNE b04_bra_97DB
b04_bra_97CF:  ; orig: b04_bra_97CF:
    CMPI.B  #$C8,D0  ; orig: C - - - - - 0x0117DF 04:97CF: C9 C8     CMP #$C8
    BCC     b04_bra_97E0             ; BCC  ; orig: C - - - - - 0x0117E1 04:97D1: 90 0D     BCC b04_bra_97E0
    MOVE.B  #$C7,D0  ; orig: - - - - - - 0x0117E3 04:97D3: A9 C7     LDA #$C7
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_dir_Left,D0  ; orig: - - - - - - 0x0117E7 04:97D7: A9 02     LDA #con_dir_Left
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_97DB:  ; orig: b04_bra_97DB:
    MOVE.B  #$07,D0  ; orig: - - - - - - 0x0117EB 04:97DB: A9 07     LDA #$07
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_97E0:  ; orig: b04_bra_97E0:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0117F2 04:97E2: 88        DEY
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0117F5 04:97E5: 18        CLC
    ; !! ADC tbl_97A0_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x0117F6 04:97E6: 79 A0 97  ADC tbl_97A0_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0394,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0117FB 04:97EB: DE 94 03  DEC ram_0394_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_97EE_RTS:  ; orig: b04_bra_97EE_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0117FE 04:97EE: 60        RTS



sub_97EF:  ; orig: sub_97EF:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9812             ; BNE  ; orig: C - - - - - 0x011801 04:97F1: D0 1F     BNE b04_bra_9812
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ORI.B   #$70,D0  ; orig: C - - - - - 0x011805 04:97F5: 09 70     ORA #$70
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_982F_create_object_55_fireball             ; JSR -> BSR  ; orig: C - - - - - 0x011809 04:97F9: 20 2F 98  JSR sub_982F_create_
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01180C 04:97FC: A9 00     LDA #$00
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    BSR     sub_982F_create_object_55_fireball             ; JSR -> BSR  ; orig: C - - - - - 0x011811 04:9801: 20 2F 98  JSR sub_982F_create_
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x011814 04:9804: A9 01     LDA #$01
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    BSR     sub_982F_create_object_55_fireball             ; JSR -> BSR  ; orig: C - - - - - 0x011819 04:9809: 20 2F 98  JSR sub_982F_create_
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01181C 04:980C: A9 FF     LDA #$FF
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011821 04:9811: 60        RTS
b04_bra_9812:  ; orig: b04_bra_9812:

; bzk optimize, currently loop checks with X = 00 as well, which is unnecessary

; because 034F doesn't contain object id. this can lead to potential bugs

; replace BPL with BNE
    MOVE.B  #$0B,D1  ; orig: C - - - - - 0x011822 04:9812: A2 0B     LDX #$0B
b04_bra_9814_loop:  ; orig: b04_bra_9814_loop:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x011824 04:9814: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_55,D0  ; orig: C - - - - - 0x011827 04:9817: C9 55     CMP #con_obj_id_55  
    BNE     b04_bra_9828_check_next             ; BNE  ; orig: C - - - - - 0x011829 04:9819: D0 0D     BNE bra_9828_check_n
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01182B 04:981B: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01182D 04:981D: 4A        LSR
    BCS     b04_bra_9828_check_next             ; BCS  ; orig: C - - - - - 0x01182E 04:981E: B0 08     BCS bra_9828_check_n
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011832 04:9822: 18        CLC
    ; !! ADC ram_0478_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x011833 04:9823: 7D 78 04  ADC ram_0478_enemy,X
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9828_check_next:  ; orig: b04_bra_9828_check_next:
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x011838 04:9828: CA        DEX
    BPL     b04_bra_9814_loop             ; BPL  ; orig: C - - - - - 0x011839 04:9829: 10 E9     BPL b04_bra_9814_loop
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x01183B 04:982B: AE 40 03  LDX ram_obj_index
    RTS                     ; RTS  ; orig: C - - - - - 0x01183E 04:982E: 60        RTS



sub_982F_create_object_55_fireball:  ; orig: sub_982F_create_object_55_fireball:
    MOVE.B  #con_obj_id_55,D0  ; orig: C - - - - - 0x01183F 04:982F: A9 55     LDA #con_obj_id_55
    JMP     loc_82AF_create_object  ; orig: C - - - - - 0x011841 04:9831: 4C AF 82  JMP loc_82AF_create_



tbl_9834:  ; orig: tbl_9834:
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 0 - - - 0x011844 04:9834: CC        .byte $CC   ; 00
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 0 - - - 0x011845 04:9835: C4        .byte $C4   ; 01
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x011846 04:9836: C8        .byte $C8   ; 02
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 0 - - - 0x011847 04:9837: C2        .byte $C2   ; 03
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 0 - - - 0x011848 04:9838: C6        .byte $C6   ; 04
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 0 - - - 0x011849 04:9839: CA        .byte $CA   ; 05

    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 0 - - - 0x01184A 04:983A: CC        .byte $CC   ; 06
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 0 - - - 0x01184B 04:983B: C4        .byte $C4   ; 07
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 0 - - - 0x01184C 04:983C: C8        .byte $C8   ; 08
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 0 - - - 0x01184D 04:983D: CE        .byte $CE   ; 09
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 0 - - - 0x01184E 04:983E: D0        .byte $D0   ; 0A
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 0 - - - 0x01184F 04:983F: D2        .byte $D2   ; 0B



tbl_9840_pos_Y:  ; orig: tbl_9840_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011850 04:9840: 00        .byte $00   ; 00 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011851 04:9841: 00        .byte $00   ; 01 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011852 04:9842: 00        .byte $00   ; 02 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011853 04:9843: 10        .byte $10   ; 03 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011854 04:9844: 10        .byte $10   ; 04 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011855 04:9845: 10        .byte $10   ; 05 / 0



tbl_9846_pos_X:  ; orig: tbl_9846_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011856 04:9846: 00        .byte $00   ; 00 / 0
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011857 04:9847: 08        .byte $08   ; 01 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x011858 04:9848: 10        .byte $10   ; 02 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011859 04:9849: 00        .byte $00   ; 03 / 0
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x01185A 04:984A: 08        .byte $08   ; 04 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x01185B 04:984B: 10        .byte $10   ; 05 / 0



sub_984C:  ; orig: sub_984C:
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x01185C 04:984C: A0 05     LDY #$05
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01185E 04:984E: A5 15     LDA ram_frm_cnt
    ANDI.B  #$10,D0  ; orig: C - - - - - 0x011860 04:9850: 29 10     AND #$10
    BNE     b04_bra_9856             ; BNE  ; orig: C - - - - - 0x011862 04:9852: D0 02     BNE b04_bra_9856
    MOVE.B  #$0B,D2  ; orig: C - - - - - 0x011864 04:9854: A0 0B     LDY #$0B
b04_bra_9856:  ; orig: b04_bra_9856:
    MOVE.B  D2,ram_000A_t08_table_index  ; orig: C - - - - - 0x011866 04:9856: 84 0A     STY ram_000A_t08_tab
    MOVE.B  #$05,D0  ; orig: C - - - - - 0x011868 04:9858: A9 05     LDA #$05
    MOVE.B  D0,ram_000B_t06_loop_counter  ; orig: C - - - - - 0x01186A 04:985A: 85 0B     STA ram_000B_t06_loo
b04_bra_985C_loop:  ; orig: b04_bra_985C_loop:
    MOVE.B  ram_000B_t06_loop_counter,D2  ; orig: C - - - - - 0x01186C 04:985C: A4 0B     LDY ram_000B_t06_loo
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011870 04:9860: 18        CLC
    ; !! ADC tbl_9846_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011871 04:9861: 79 46 98  ADC tbl_9846_pos_X,Y
    MOVE.B  D0,ram_0000_t1C_spr_X  ; orig: C - - - - - 0x011874 04:9864: 85 00     STA ram_0000_t1C_spr
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011878 04:9868: 18        CLC
    ; !! ADC tbl_9840_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011879 04:9869: 79 40 98  ADC tbl_9840_pos_Y,Y
    MOVE.B  D0,ram_0001_t18_spr_Y  ; orig: C - - - - - 0x01187C 04:986C: 85 01     STA ram_0001_t18_spr
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$03,D0  ; orig: C - - - - - 0x011881 04:9871: 29 03     AND #$03
    EORI.B  #$03,D0  ; orig: C - - - - - 0x011883 04:9873: 49 03     EOR #$03
    MOVE.B  D0,ram_0003_t16_spr_A  ; orig: C - - - - - 0x011885 04:9875: 85 03     STA ram_0003_t16_spr
    MOVE.B  ram_000A_t08_table_index,D2  ; orig: C - - - - - 0x011887 04:9877: A4 0A     LDY ram_000A_t08_tab
    MOVEA.L #tbl_9834,A0
    MOVE.B  (A0,D2.L),D0

    CMP.B   tbl_9834,D0  ; orig: C - - - - - 0x01188C 04:987C: CD 34 98  CMP tbl_9834
    BNE     b04_bra_9889             ; BNE  ; orig: C - - - - - 0x01188F 04:987F: D0 08     BNE b04_bra_9889
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$20,D2  ; orig: C - - - - - 0x011893 04:9883: C0 20     CPY #$20
    BCS     b04_bra_9889             ; BCS  ; orig: C - - - - - 0x011895 04:9885: B0 02     BCS b04_bra_9889
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x011897 04:9887: A9 C0     LDA #$C0
b04_bra_9889:  ; orig: b04_bra_9889:
    BSR     sub_9893             ; JSR -> BSR  ; orig: C - - - - - 0x011899 04:9889: 20 93 98  JSR sub_9893
    SUBQ.B  #1,ram_000A_t08_table_index  ; orig: C - - - - - 0x01189C 04:988C: C6 0A     DEC ram_000A_t08_tab
    SUBQ.B  #1,ram_000B_t06_loop_counter  ; orig: C - - - - - 0x01189E 04:988E: C6 0B     DEC ram_000B_t06_loo
    BPL     b04_bra_985C_loop             ; BPL  ; orig: C - - - - - 0x0118A0 04:9890: 10 CA     BPL b04_bra_985C_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0118A2 04:9892: 60        RTS



sub_9893:  ; orig: sub_9893:

; in

; A =

; ram_0000_t1C_spr_X

; ram_0001_t18_spr_Y

; ram_0003_t16
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0118A3 04:9893: 48        PHA
    MOVE.B  ram_counter_00_27,D2  ; orig: C - - - - - 0x0118A4 04:9894: AC 41 03  LDY ram_counter_00_2
    MOVEA.L #tbl_bat_77AB,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0118AA 04:989A: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0118AB 04:989B: 68        PLA
    MOVEA.L #ram_spr_T,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  ram_0000_t1C_spr_X,D0  ; orig: C - - - - - 0x0118AF 04:989F: A5 00     LDA ram_0000_t1C_spr
    MOVEA.L #ram_spr_X,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  ram_0001_t18_spr_Y,D0  ; orig: C - - - - - 0x0118B4 04:98A4: A5 01     LDA ram_0001_t18_spr
    JMP     loc_bat_79AF  ; orig: C - - - - - 0x0118B6 04:98A6: 4C AF 79  JMP loc_bat_79AF



ofs_004_0x0118B9_31:  ; orig: ofs_004_0x0118B9_31:

; con_obj_id_31
ofs_004_0x0118B9_32:  ; orig: ofs_004_0x0118B9_32:

; con_obj_id_32

; in

; X = 01+
    BSR     sub_98BD             ; JSR -> BSR  ; orig: C - - J - - 0x0118B9 04:98A9: 20 BD 98  JSR sub_98BD
    BSR     sub_995F             ; JSR -> BSR  ; orig: C - - - - - 0x0118BC 04:98AC: 20 5F 99  JSR sub_995F
    BSR     sub_99B9             ; JSR -> BSR  ; orig: C - - - - - 0x0118BF 04:98AF: 20 B9 99  JSR sub_99B9
    JMP     loc_9A84  ; orig: C - - - - - 0x0118C2 04:98B2: 4C 84 9A  JMP loc_9A84



; bzk garbage
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - - - - - - 0x0118C5 04:98B5: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - - - - - - 0x0118C6 04:98B6: F0        .byte $F0   ;
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - - - - - - 0x0118C7 04:98B7: 10        .byte $10   ;
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0118C8 04:98B8: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - - - - - - 0x0118C9 04:98B9: F0        .byte $F0   ;



tbl_98BA:  ; orig: tbl_98BA:
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x0118CA 04:98BA: 20        .byte $20   ; 00
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0118CB 04:98BB: 40        .byte $40   ; 01
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x0118CC 04:98BC: 40        .byte $40   ; 02



sub_98BD:  ; orig: sub_98BD:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0118CF 04:98BF: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_036_98C8_00  -- needs manual handling  ; orig: - D 0 - I - 0x0118D2 04:98C2: C8 98     .word ofs_036_98C8_0
    ; [DIRECTIVE] .WORD ofs_036_9900_01  -- needs manual handling  ; orig: - D 0 - I - 0x0118D4 04:98C4: 00 99     .word ofs_036_9900_0
    ; [DIRECTIVE] .WORD ofs_036_98F2_02  -- needs manual handling  ; orig: - D 0 - I - 0x0118D6 04:98C6: F2 98     .word ofs_036_98F2_0



ofs_036_98C8_00:  ; orig: ofs_036_98C8_00:

; triggers when dodongo is on the screen
    MOVE.B  #$00,D2  ; orig: C - - J - - 0x0118D8 04:98C8: A0 00     LDY #$00
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__RUD,D0  ; orig: C - - - - - 0x0118DC 04:98CC: 29 0D     AND #con_dir__RUD
    BEQ     b04_bra_98D9             ; BEQ  ; orig: C - - - - - 0x0118DE 04:98CE: F0 09     BEQ b04_bra_98D9
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0118E2 04:98D2: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0118E3 04:98D3: 69 10     ADC #$10
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$F0,D2  ; orig: C - - - - - 0x0118E7 04:98D7: A0 F0     LDY #$F0
b04_bra_98D9:  ; orig: b04_bra_98D9:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0118E9 04:98D9: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0118EA 04:98DA: 48        PHA
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0118EB 04:98DB: A9 20     LDA #$20
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_8094             ; JSR -> BSR  ; orig: C - - - - - 0x0118F0 04:98E0: 20 94 80  JSR sub_8094
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0118F3 04:98E3: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0118F4 04:98E4: 18        CLC
    ; !! ADC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x0118F5 04:98E5: 75 70     ADC ram_pos_X_enemy,
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$20,D0  ; orig: C - - - - - 0x0118F9 04:98E9: C9 20     CMP #$20
    BCS     b04_bra_98F1_RTS             ; BCS  ; orig: C - - - - - 0x0118FB 04:98EB: B0 04     BCS b04_bra_98F1_RTS
    MOVE.B  #con_dir_Right,D0  ; orig: - - - - - - 0x0118FD 04:98ED: A9 01     LDA #con_dir_Right
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_98F1_RTS:  ; orig: b04_bra_98F1_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011901 04:98F1: 60        RTS



ofs_036_98F2_02:  ; orig: ofs_036_98F2_02:
    MOVEA.L #$FF003D,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - J - - 0x011902 04:98F2: BC 3D 00  LDY a: ram_003D_enem
    MOVE.B  (A0,D1.L),D2  ; ^
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011905 04:98F5: 88        DEY
    BEQ     b04_bra_9958             ; BEQ  ; orig: C - - - - - 0x011906 04:98F6: F0 60     BEQ b04_bra_9958    ; br
    BPL     b04_bra_98FF_RTS             ; BPL  ; orig: C - - - - - 0x011908 04:98F8: 10 05     BPL b04_bra_98FF_RTS
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x01190A 04:98FA: A9 20     LDA #$20
    MOVEA.L #$FF003D,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01190C 04:98FC: 9D 3D 00  STA a: ram_003D_enem
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_98FF_RTS:  ; orig: b04_bra_98FF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01190F 04:98FF: 60        RTS



ofs_036_9900_01:  ; orig: ofs_036_9900_01:
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x011913 04:9903: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_037_9910_00  -- needs manual handling  ; orig: - D 0 - I - 0x011916 04:9906: 10 99     .word ofs_037_9910_0
    ; [DIRECTIVE] .WORD ofs_037_9910_01  -- needs manual handling  ; orig: - D 0 - I - 0x011918 04:9908: 10 99     .word ofs_037_9910_0
    ; [DIRECTIVE] .WORD ofs_037_9910_02  -- needs manual handling  ; orig: - D 0 - I - 0x01191A 04:990A: 10 99     .word ofs_037_9910_0
    ; [DIRECTIVE] .WORD ofs_037_9952_03  -- needs manual handling  ; orig: - D 0 - I - 0x01191C 04:990C: 52 99     .word ofs_037_9952_0
    ; [DIRECTIVE] .WORD ofs_037_9958_04  -- needs manual handling  ; orig: - D 0 - I - 0x01191E 04:990E: 58 99     .word ofs_037_9958_0



ofs_037_9910_00:  ; orig: ofs_037_9910_00:
ofs_037_9910_01:  ; orig: ofs_037_9910_01:
ofs_037_9910_02:  ; orig: ofs_037_9910_02:
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011923 04:9913: 88        DEY
    BEQ     b04_bra_9938             ; BEQ  ; orig: C - - - - - 0x011924 04:9914: F0 22     BEQ b04_bra_9938
    BPL     b04_bra_994E             ; BPL  ; orig: C - - - - - 0x011926 04:9916: 10 36     BPL b04_bra_994E
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #tbl_98BA,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$00,D2  ; orig: C - - - - - 0x011931 04:9921: C0 00     CPY #$00
    BNE     b04_bra_994E             ; BNE  ; orig: C - - - - - 0x011933 04:9923: D0 29     BNE b04_bra_994E
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x011935 04:9925: A0 10     LDY #$10
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011937 04:9927: A9 00     LDA #$00
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01193F 04:992F: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011940 04:9930: 69 01     ADC #$01
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_994E  ; orig: C - - - - - 0x011945 04:9935: 4C 4E 99  JMP loc_994E
b04_bra_9938:  ; orig: b04_bra_9938:
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011948 04:9938: FE 2C 04  INC ram_042B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x01194E 04:993E: C9 02     CMP #$02
    BCC     b04_bra_994E             ; BCC  ; orig: C - - - - - 0x011950 04:9940: 90 0C     BCC b04_bra_994E
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$02,D2  ; orig: C - - - - - 0x011955 04:9945: C0 02     CPY #$02
    BCS     b04_bra_994E             ; BCS  ; orig: C - - - - - 0x011957 04:9947: B0 05     BCS b04_bra_994E
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x011959 04:9949: A9 04     LDA #$04
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_994E:  ; orig: b04_bra_994E:
loc_994E:  ; orig: loc_994E:
    MOVEA.L #$FF045E,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C D 0 - - - 0x01195E 04:994E: DE 5E 04  DEC ram_045E_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x011961 04:9951: 60        RTS



sub_9952:  ; orig: sub_9952:
ofs_037_9952_03:  ; orig: ofs_037_9952_03:
    BSR     sub_0x01FEB6             ; JSR -> BSR  ; orig: C - - J - - 0x011962 04:9952: 20 A6 FE  JSR sub_0x01FEB6
    BSR     b04_sub_B010             ; JSR -> BSR  ; orig: C - - - - - 0x011965 04:9955: 20 10 B0  JSR b04_sub_B010
b04_bra_9958:
; bzk fucking developers
ofs_037_9958_04:  ; orig: ofs_037_9958_04:
    BSR     sub_0x01F865_clear_enemy_state             ; JSR -> BSR  ; orig: C - - J - - 0x011968 04:9958: 20 55 F8  JSR sub_0x01F865_cle
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01196E 04:995E: 60        RTS



sub_995F:  ; orig: sub_995F:
    BSR     sub_998A             ; JSR -> BSR  ; orig: C - - - - - 0x01196F 04:995F: 20 8A 99  JSR sub_998A
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9980             ; BNE  ; orig: C - - - - - 0x011975 04:9965: D0 19     BNE b04_bra_9980
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$04,D0  ; orig: C - - - - - 0x011979 04:9969: C9 04     CMP #$04
    BCS     b04_bra_9989_RTS             ; BCS  ; orig: C - - - - - 0x01197B 04:996B: B0 1C     BCS b04_bra_9989_RTS    
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01197F 04:996F: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011980 04:9970: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011981 04:9971: 69 10     ADC #$10
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_998A             ; JSR -> BSR  ; orig: C - - - - - 0x011985 04:9975: 20 8A 99  JSR sub_998A
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011988 04:9978: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9989_RTS             ; BEQ  ; orig: C - - - - - 0x01198E 04:997E: F0 09     BEQ b04_bra_9989_RTS
b04_bra_9980:  ; orig: b04_bra_9980:
    BSR     sub_9952             ; JSR -> BSR  ; orig: C - - - - - 0x011990 04:9980: 20 52 99  JSR sub_9952
    MOVE.B  #$0A,D0  ; orig: C - - - - - 0x011993 04:9983: A9 0A     LDA #$0A
    MOVE.B  D0,ram_0050  ; orig: C - - - - - 0x011995 04:9985: 85 50     STA ram_0050
    MOVE.B  D0,ram_0051  ; orig: C - - - - - 0x011997 04:9987: 85 51     STA ram_0051
b04_bra_9989_RTS:  ; orig: b04_bra_9989_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011999 04:9989: 60        RTS



sub_998A:  ; orig: sub_998A:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01199A 04:998A: A9 FF     LDA #$FF
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01199F 04:998F: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x0119A4 04:9994: C9 02     CMP #$02
    BNE     b04_bra_9989_RTS             ; BNE  ; orig: C - - - - - 0x0119A6 04:9996: D0 F1     BNE b04_bra_9989_RTS
    MOVE.B  #$FE,D0  ; orig: C - - - - - 0x0119A8 04:9998: A9 FE     LDA #$FE
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_bat_7A2D             ; JSR -> BSR  ; orig: C - - - - - 0x0119AD 04:999D: 20 2D 7A  JSR sub_bat_7A2D
    MOVE.B  #$0D,D2  ; orig: C - - - - - 0x0119B0 04:99A0: A0 0D     LDY #$0D
    JMP     loc_bat_7D29  ; orig: C - - - - - 0x0119B2 04:99A2: 4C 29 7D  JMP loc_bat_7D29



tbl_99A5:  ; orig: tbl_99A5:
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x0119B5 04:99A5: F0        .byte $F0   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0119B6 04:99A6: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 0 - - - 0x0119B7 04:99A7: F8        .byte $F8   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0119B8 04:99A8: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 0 - - - 0x0119B9 04:99A9: F8        .byte $F8   ; 04
tbl_99AA:  ; orig: tbl_99AA:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0119BA 04:99AA: 00        .byte $00   ; 00 / 0
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x0119BB 04:99AB: 10        .byte $10   ; 01 / 0
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0119BC 04:99AC: 08        .byte $08   ; 02 / 0
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0119BD 04:99AD: FF        .byte $FF   ; 03 / 0
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x0119BE 04:99AE: 08        .byte $08   ; 04 / 0
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 0 - - - 0x0119BF 04:99AF: FC        .byte $FC   ; 05 / 0
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 0 - - - 0x0119C0 04:99B0: FC        .byte $FC   ; 06 / 0
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - - - - - - 0x0119C1 04:99B1: F0        .byte $F0   ; 07 / 0
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0119C2 04:99B2: FF        .byte $FF   ; 08 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x0119C3 04:99B3: 00        .byte $00   ; 09 / 0
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x0119C4 04:99B4: 04        .byte $04   ; 0A
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x0119C5 04:99B5: 04        .byte $04   ; 0B
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x0119C6 04:99B6: 00        .byte $00   ; 0C
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x0119C7 04:99B7: FF        .byte $FF   ; 0D
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 0 - - - 0x0119C8 04:99B8: 10        .byte $10   ; 0E



sub_99B9:  ; orig: sub_99B9:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_99FA_RTS             ; BNE  ; orig: C - - - - - 0x0119CB 04:99BB: D0 3D     BNE b04_bra_99FA_RTS
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0119CF 04:99BF: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0119D0 04:99C0: 69 08     ADC #$08
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$04,D2  ; orig: C - - - - - 0x0119D4 04:99C4: C0 04     CPY #$04
    BCS     b04_bra_99CA             ; BCS  ; orig: C - - - - - 0x0119D6 04:99C6: B0 02     BCS b04_bra_99CA    ; co
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0119D8 04:99C8: 69 08     ADC #$08
b04_bra_99CA:  ; orig: b04_bra_99CA:
    MOVE.B  D0,ram_0000_t1D  ; orig: C - - - - - 0x0119DA 04:99CA: 85 00     STA ram_0000_t1D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0119DE 04:99CE: 69 08     ADC #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x0119E0 04:99D0: 85 01     STA ram_0000_t1D + $
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x0119E2 04:99D2: A0 10     LDY #$10
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D2.L),D0

    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0119E7 04:99D7: 69 08     ADC #$08
    MOVE.B  D0,ram_0002_t29_pos  ; orig: C - - - - - 0x0119E9 04:99D9: 85 02     STA ram_0002_t29_pos
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D2.L),D0

    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0119EE 04:99DE: 69 08     ADC #$08
    ; (empty translation for STA)  ; orig: C - - - - - 0x0119F0 04:99E0: 85 03     STA ram_0002_t29_pos
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    BEQ     b04_bra_99FA_RTS             ; BEQ  ; orig: C - - - - - 0x0119F5 04:99E5: F0 13     BEQ b04_bra_99FA_RTS
    CMPI.B  #$12,D0  ; orig: C - - - - - 0x0119F7 04:99E7: C9 12     CMP #$12
    BEQ     b04_bra_99FB             ; BEQ  ; orig: C - - - - - 0x0119F9 04:99E9: F0 10     BEQ b04_bra_99FB
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x0119FB 04:99EB: C9 20     CMP #$20
    BCS     b04_bra_99FA_RTS             ; BCS  ; orig: C - - - - - 0x0119FD 04:99ED: B0 0B     BCS b04_bra_99FA_RTS
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x0119FF 04:99EF: A0 00     LDY #$00
    BSR     sub_9A32             ; JSR -> BSR  ; orig: C - - - - - 0x011A01 04:99F1: 20 32 9A  JSR sub_9A32
    BNE     b04_bra_99FA_RTS             ; BNE  ; orig: C - - - - - 0x011A04 04:99F4: D0 04     BNE b04_bra_99FA_RTS

; if dodongo walks into explosion of a bomb
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x011A06 04:99F6: A9 02     LDA #$02
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_99FA_RTS:  ; orig: b04_bra_99FA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011A0A 04:99FA: 60        RTS
b04_bra_99FB:  ; orig: b04_bra_99FB:
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x011A0B 04:99FB: A0 01     LDY #$01
    BSR     sub_9A32             ; JSR -> BSR  ; orig: C - - - - - 0x011A0D 04:99FD: 20 32 9A  JSR sub_9A32
    BNE     b04_bra_9A2D_RTS             ; BNE  ; orig: C - - - - - 0x011A10 04:9A00: D0 2B     BNE b04_bra_9A2D_RTS
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x011A12 04:9A02: A9 01     LDA #$01
    MOVE.B  D0,ram_0000_t5E_loop_counter  ; orig: C - - - - - 0x011A14 04:9A04: 85 00     STA ram_0000_t5E_loo
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011A18 04:9A08: 4A        LSR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011A19 04:9A09: A8        TAY
    MOVE.B  ram_0004_t16,D0  ; orig: C - - - - - 0x011A1A 04:9A0A: A5 04     LDA ram_0004_t16
b04_bra_9A0C_loop:  ; orig: b04_bra_9A0C_loop:
    MOVEA.L #tbl_99A5,A0
    CMP.B  (A0,D2.L),D0

    BMI     b04_bra_9A2D_RTS             ; BMI  ; orig: C - - - - - 0x011A1F 04:9A0F: 30 1C     BMI b04_bra_9A2D_RTS
    MOVEA.L #tbl_99AA,A0
    CMP.B  (A0,D2.L),D0

    BPL     b04_bra_9A2D_RTS             ; BPL  ; orig: C - - - - - 0x011A24 04:9A14: 10 17     BPL b04_bra_9A2D_RTS
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011A26 04:9A16: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011A27 04:9A17: 18        CLC
    ADD.B  #$0A,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011A28 04:9A18: 69 0A     ADC #$0A
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011A2A 04:9A1A: A8        TAY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x011A2B 04:9A1B: A5 05     LDA ram_0004_t16 + $
    SUBQ.B  #1,ram_0000_t5E_loop_counter  ; orig: C - - - - - 0x011A2D 04:9A1D: C6 00     DEC ram_0000_t5E_loo
    BPL     b04_bra_9A0C_loop             ; BPL  ; orig: C - - - - - 0x011A2F 04:9A1F: 10 EB     BPL b04_bra_9A0C_loop

; if dodongo eats a bomb
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011A31 04:9A21: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x011A33 04:9A23: A0 10     LDY #$10
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011A35 04:9A25: A9 00     LDA #$00
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9A2D_RTS:  ; orig: b04_bra_9A2D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011A3D 04:9A2D: 60        RTS



tbl_9A2E:  ; orig: tbl_9A2E:
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 0 - - - 0x011A3E 04:9A2E: 0C        .byte $0C   ; 00
    ; [DIRECTIVE] .BYTE $11  -- needs manual handling  ; orig: - D 0 - - - 0x011A3F 04:9A2F: 11        .byte $11   ; 01



tbl_9A30:  ; orig: tbl_9A30:
    ; [DIRECTIVE] .BYTE $F4  -- needs manual handling  ; orig: - D 0 - - - 0x011A40 04:9A30: F4        .byte $F4   ; 00
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 0 - - - 0x011A41 04:9A31: F0        .byte $F0   ; 01



sub_9A32:  ; orig: sub_9A32:

; in

; ram_0000_t1D

; out

; Z

; 0 =

; 1 =
    MOVEA.L #tbl_9A2E,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0006_t08  ; orig: C - - - - - 0x011A45 04:9A35: 85 06     STA ram_0006_t08
    MOVEA.L #tbl_9A30,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0007_t04  ; orig: C - - - - - 0x011A4A 04:9A3A: 85 07     STA ram_0007_t04
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x011A4C 04:9A3C: A9 03     LDA #$03
    MOVE.B  D0,ram_0008_t04  ; orig: C - - - - - 0x011A4E 04:9A3E: 85 08     STA ram_0008_t04
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x011A50 04:9A40: A0 01     LDY #$01
b04_bra_9A42_loop:  ; orig: b04_bra_9A42_loop:
    MOVEA.L #ram_0000_t1D,A0
    MOVE.B  (A0,D2.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x011A55 04:9A45: 38        SEC
    ; !! SBC ram_0002_t29_pos,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011A56 04:9A46: F9 02 00  SBC ram_0002_t29_pos
    CMP.B   ram_0006_t08,D0  ; orig: C - - - - - 0x011A59 04:9A49: C5 06     CMP ram_0006_t08
    BPL     b04_bra_9A56             ; BPL  ; orig: C - - - - - 0x011A5B 04:9A4B: 10 09     BPL b04_bra_9A56
    CMP.B   ram_0007_t04,D0  ; orig: C - - - - - 0x011A5D 04:9A4D: C5 07     CMP ram_0007_t04
    BMI     b04_bra_9A56             ; BMI  ; orig: C - - - - - 0x011A5F 04:9A4F: 30 05     BMI b04_bra_9A56
    MOVEA.L #ram_0004_t16,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  (ram_0008_t04).l,D3
    LSR.B  #1,D3
    MOVE.B  D3,(ram_0008_t04).l  ; orig: C - - - - - 0x011A64 04:9A54: 46 08     LSR ram_0008_t04

b04_bra_9A56:  ; orig: b04_bra_9A56:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011A66 04:9A56: 88        DEY
    BPL     b04_bra_9A42_loop             ; BPL  ; orig: C - - - - - 0x011A67 04:9A57: 10 E9     BPL b04_bra_9A42_loop
    MOVE.B  ram_0008_t04,D0  ; orig: C - - - - - 0x011A69 04:9A59: A5 08     LDA ram_0008_t04
    RTS                     ; RTS  ; orig: C - - - - - 0x011A6B 04:9A5B: 60        RTS



tbl_9A5C:  ; orig: tbl_9A5C:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011A6C 04:9A5C: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011A6D 04:9A5D: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x011A6E 04:9A5E: 06        .byte $06   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A6F 04:9A5F: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011A70 04:9A60: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x011A71 04:9A61: 02        .byte $02   ; 05
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x011A72 04:9A62: 03        .byte $03   ; 06
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x011A73 04:9A63: 06        .byte $06   ; 07
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A74 04:9A64: FF        .byte $FF   ; 08
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011A75 04:9A65: 08        .byte $08   ; 09
tbl_9A66:  ; orig: tbl_9A66:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011A76 04:9A66: 00        .byte $00   ; 00 / 0
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011A77 04:9A67: 40        .byte $40   ; 01 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011A78 04:9A68: 00        .byte $00   ; 02 / 0
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A79 04:9A69: FF        .byte $FF   ; 03 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011A7A 04:9A6A: 00        .byte $00   ; 04 / 0
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011A7B 04:9A6B: 00        .byte $00   ; 05 / 0
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011A7C 04:9A6C: 40        .byte $40   ; 06 / 1
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011A7D 04:9A6D: 40        .byte $40   ; 07 / 1
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A7E 04:9A6E: FF        .byte $FF   ; 08 / 1
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011A7F 04:9A6F: 40        .byte $40   ; 09 / 1
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x011A80 04:9A70: 04        .byte $04   ; 0A / 1
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x011A81 04:9A71: 05        .byte $05   ; 0B / 1
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - - - - - - 0x011A82 04:9A72: 07        .byte $07   ; 0C / 1
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A83 04:9A73: FF        .byte $FF   ; 0D / 1
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - - - - - - 0x011A84 04:9A74: 09        .byte $09   ; 0E / 1
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x011A85 04:9A75: 04        .byte $04   ; 0F / 1
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - - - - - - 0x011A86 04:9A76: 05        .byte $05   ; 10 / 1
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - - - - - - 0x011A87 04:9A77: 07        .byte $07   ; 11 / 1
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A88 04:9A78: FF        .byte $FF   ; 12 / 1
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - - - - - - 0x011A89 04:9A79: 09        .byte $09   ; 13 / 1
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A8A 04:9A7A: 00        .byte $00   ; 14
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011A8B 04:9A7B: 40        .byte $40   ; 15
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A8C 04:9A7C: 00        .byte $00   ; 16
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A8D 04:9A7D: FF        .byte $FF   ; 17
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A8E 04:9A7E: 00        .byte $00   ; 18
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A8F 04:9A7F: 00        .byte $00   ; 19
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - - - - - - 0x011A90 04:9A80: 40        .byte $40   ; 1A
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A91 04:9A81: 00        .byte $00   ; 1B
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011A92 04:9A82: FF        .byte $FF   ; 1C
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011A93 04:9A83: 00        .byte $00   ; 1D



loc_9A84:  ; orig: loc_9A84:
    BSR     sub_9AFB             ; JSR -> BSR  ; orig: C D 0 - - - 0x011A94 04:9A84: 20 FB 9A  JSR sub_9AFB
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011A99 04:9A89: 4A        LSR
    MOVE.B  D0,ram_0000_t1E  ; orig: C - - - - - 0x011A9A 04:9A8A: 85 00     STA ram_0000_t1E
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    BEQ     b04_bra_9AB6             ; BEQ  ; orig: C - - - - - 0x011A9E 04:9A8E: F0 26     BEQ b04_bra_9AB6
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x011AA0 04:9A90: A9 20     LDA #$20
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011AA2 04:9A92: 88        DEY
    BNE     b04_bra_9AB8             ; BNE  ; orig: C - - - - - 0x011AA3 04:9A93: D0 23     BNE b04_bra_9AB8
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D2

    BEQ     b04_bra_9AB6             ; BEQ  ; orig: C - - - - - 0x011AA8 04:9A98: F0 1C     BEQ b04_bra_9AB6
    CMPI.B  #$02,D2  ; orig: C - - - - - 0x011AAA 04:9A9A: C0 02     CPY #$02
    BEQ     b04_bra_9AAB             ; BEQ  ; orig: C - - - - - 0x011AAC 04:9A9C: F0 0D     BEQ b04_bra_9AAB
    CMPI.B  #$03,D2  ; orig: C - - - - - 0x011AAE 04:9A9E: C0 03     CPY #$03
    BEQ     b04_bra_9AAB             ; BEQ  ; orig: C - - - - - 0x011AB0 04:9AA0: F0 09     BEQ b04_bra_9AAB
    MOVE.B  ram_0000_t1E,D0  ; orig: C - - - - - 0x011AB2 04:9AA2: A5 00     LDA ram_0000_t1E
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011AB4 04:9AA4: 18        CLC
    ADD.B  #$14,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011AB5 04:9AA5: 69 14     ADC #$14
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011AB7 04:9AA7: A8        TAY
    JMP     loc_9AC3  ; orig: C - - - - - 0x011AB8 04:9AA8: 4C C3 9A  JMP loc_9AC3
b04_bra_9AAB:  ; orig: b04_bra_9AAB:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x011ABB 04:9AAB: A5 15     LDA ram_frm_cnt
    ANDI.B  #$02,D0  ; orig: C - - - - - 0x011ABD 04:9AAD: 29 02     AND #$02
    BEQ     b04_bra_9B00_RTS             ; BEQ  ; orig: C - - - - - 0x011ABF 04:9AAF: F0 4F     BEQ b04_bra_9B00_RTS
    MOVE.B  ram_0000_t1E,D2  ; orig: C - - - - - 0x011AC1 04:9AB1: A4 00     LDY ram_0000_t1E
    JMP     loc_9AC3  ; orig: C - - - - - 0x011AC3 04:9AB3: 4C C3 9A  JMP loc_9AC3
b04_bra_9AB6:  ; orig: b04_bra_9AB6:
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011AC6 04:9AB6: A9 08     LDA #$08
b04_bra_9AB8:  ; orig: b04_bra_9AB8:
    MOVE.B  ram_0000_t1E,D2  ; orig: C - - - - - 0x011AC8 04:9AB8: A4 00     LDY ram_0000_t1E
    AND.B   ram_frm_cnt,D0  ; orig: C - - - - - 0x011ACA 04:9ABA: 25 15     AND ram_frm_cnt
    BEQ     b04_bra_9AC3             ; BEQ  ; orig: C - - - - - 0x011ACC 04:9ABC: F0 05     BEQ b04_bra_9AC3
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011ACE 04:9ABE: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011ACF 04:9ABF: 18        CLC
    ADD.B  #$05,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011AD0 04:9AC0: 69 05     ADC #$05
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011AD2 04:9AC2: A8        TAY
b04_bra_9AC3:  ; orig: b04_bra_9AC3:
loc_9AC3:  ; orig: loc_9AC3:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C D 0 - - - 0x011AD3 04:9AC3: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011AD6 04:9AC6: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011AD7 04:9AC7: 48        PHA
    MOVEA.L #tbl_9A66,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x011ADB 04:9ACB: 85 0F     STA ram_000F_t04_fla
    MOVEA.L #tbl_9A5C,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$07,D0  ; orig: C - - - - - 0x011AE0 04:9AD0: C9 07     CMP #$07
    BEQ     b04_bra_9AD8             ; BEQ  ; orig: C - - - - - 0x011AE2 04:9AD2: F0 04     BEQ b04_bra_9AD8
    CMPI.B  #$09,D0  ; orig: C - - - - - 0x011AE4 04:9AD4: C9 09     CMP #$09
    BNE     b04_bra_9ADE             ; BNE  ; orig: C - - - - - 0x011AE6 04:9AD6: D0 06     BNE b04_bra_9ADE
b04_bra_9AD8:  ; orig: b04_bra_9AD8:
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: - - - - - - 0x011AE8 04:9AD8: 20 DB 77  JSR sub_bat_77DB
    JMP     loc_9AE1  ; orig: - - - - - - 0x011AEB 04:9ADB: 4C E1 9A  JMP loc_9AE1
b04_bra_9ADE:  ; orig: b04_bra_9ADE:
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x011AEE 04:9ADE: 20 DF 77  JSR sub_bat_77DF
loc_9AE1:  ; orig: loc_9AE1:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011AF1 04:9AE1: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011AF2 04:9AE2: A8        TAY
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011AF5 04:9AE5: 29 03     AND #con_dir__LR
    BEQ     b04_bra_9B00_RTS             ; BEQ  ; orig: C - - - - - 0x011AF7 04:9AE7: F0 17     BEQ b04_bra_9B00_RTS
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011AFB 04:9AEB: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011AFC 04:9AEC: 69 10     ADC #$10
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x011AFE 04:9AEE: 85 00     STA ram_0000_t21_spr
    BSR     sub_9AFB             ; JSR -> BSR  ; orig: C - - - - - 0x011B00 04:9AF0: 20 FB 9A  JSR sub_9AFB
    MOVEA.L #tbl_9A5C,A0
    MOVE.B  (A0,D2.L),D0

    EORI.B  #$01,D0  ; orig: C - - - - - 0x011B06 04:9AF6: 49 01     EOR #$01
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x011B08 04:9AF8: 4C DF 77  JMP loc_bat_77DF



sub_9AFB:  ; orig: sub_9AFB:
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x011B0B 04:9AFB: A9 03     LDA #$03

; bzk optimize, JMP
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x011B0D 04:9AFD: 20 88 79  JSR sub_bat_7988_set
b04_bra_9B00_RTS:  ; orig: b04_bra_9B00_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011B10 04:9B00: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x011B11 04:9B01: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x011B20 04:9B10: FF        .byte $FF, $FF, $FF,



ofs_005_0x011B30_0B:  ; orig: ofs_005_0x011B30_0B:

; con_obj_id_0B
ofs_005_0x011B30_0C:  ; orig: ofs_005_0x011B30_0C:

; con_obj_id_0C
    MOVE.B  #$F6,D0  ; orig: C - - J - - 0x011B30 04:9B20: A9 F6     LDA #$F6
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$20,D0  ; orig: C - - - - - 0x011B35 04:9B25: A9 20     LDA #$20
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x011B37 04:9B27: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_0B,D2  ; orig: C - - - - - 0x011B3A 04:9B2A: C0 0B     CPY #con_obj_id_0B
    BEQ     b04_bra_9B30             ; BEQ  ; orig: C - - - - - 0x011B3C 04:9B2C: F0 02     BEQ b04_bra_9B30
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x011B3E 04:9B2E: A9 28     LDA #$28
b04_bra_9B30:  ; orig: b04_bra_9B30:
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_8025  ; orig: C - - - - - 0x011B43 04:9B33: 4C 25 80  JMP loc_8025



ofs_004_0x011B46_30:  ; orig: ofs_004_0x011B46_30:

; con_obj_id_30

; in

; X = 01+
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x011B46 04:9B36: A9 80     LDA #$80
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x011B48 04:9B38: 20 6E 80  JSR sub_806E
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011B4B 04:9B3B: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011B4E 04:9B3E: A9 08     LDA #$08
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011B50 04:9B40: 20 89 FA  JSR sub_0x01FA99
    BSR     sub_0x01FA82             ; JSR -> BSR  ; orig: C - - - - - 0x011B53 04:9B43: 20 72 FA  JSR sub_0x01FA82
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011B56 04:9B46: A9 00     LDA #$00
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x011B58 04:9B48: 4C DF 77  JMP loc_bat_77DF



ofs_004_0x011B5B_0B:  ; orig: ofs_004_0x011B5B_0B:

; con_obj_id_0B
ofs_004_0x011B5B_0C:  ; orig: ofs_004_0x011B5B_0C:

; con_obj_id_0C

; in

; X = 01+
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x011B5B 04:9B4B: A9 80     LDA #$80
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x011B5D 04:9B4D: 20 6E 80  JSR sub_806E
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011B60 04:9B50: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011B63 04:9B53: A9 00     LDA #$00
    MOVEA.L #ram_003D_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011B67 04:9B57: A9 08     LDA #$08
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011B69 04:9B59: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #con_dir_Left,D0  ; orig: C - - - - - 0x011B6E 04:9B5E: C9 02     CMP #con_dir_Left
    BNE     b04_bra_9B64             ; BNE  ; orig: C - - - - - 0x011B70 04:9B60: D0 02     BNE b04_bra_9B64
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x011B72 04:9B62: E6 0F     INC ram_000F_t04_fla
b04_bra_9B64:  ; orig: b04_bra_9B64:

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011B74 04:9B64: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011B75 04:9B65: 4A        LSR
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D2

    BEQ     b04_bra_9B76             ; BEQ  ; orig: C - - - - - 0x011B79 04:9B69: F0 0B     BEQ b04_bra_9B76
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011B7B 04:9B6B: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011B7C 04:9B6C: 69 03     ADC #$03
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #con_dir_Up,D2  ; orig: C - - - - - 0x011B80 04:9B70: C0 08     CPY #con_dir_Up
    BNE     b04_bra_9B76             ; BNE  ; orig: C - - - - - 0x011B82 04:9B72: D0 02     BNE b04_bra_9B76
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x011B84 04:9B74: E6 0F     INC ram_000F_t04_fla
b04_bra_9B76:  ; orig: b04_bra_9B76:

; bzk optimize, JMP
    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x011B86 04:9B76: 20 DF 77  JSR sub_bat_77DF
    RTS                     ; RTS  ; orig: C - - - - - 0x011B89 04:9B79: 60        RTS



tbl_9B7A_pos_X:  ; orig: tbl_9B7A_pos_X:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011B8A 04:9B7A: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011B8B 04:9B7B: FF        .byte $FF   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011B8C 04:9B7C: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011B8D 04:9B7D: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x011B8E 04:9B7E: 01        .byte $01   ; 04
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011B8F 04:9B7F: FF        .byte $FF   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011B90 04:9B80: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011B91 04:9B81: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x011B92 04:9B82: 01        .byte $01   ; 08
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011B93 04:9B83: FF        .byte $FF   ; 09



tbl_9B84_pos_Y:  ; orig: tbl_9B84_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011B94 04:9B84: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011B95 04:9B85: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011B96 04:9B86: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011B97 04:9B87: 01        .byte $01   ; 03
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x011B98 04:9B88: 01        .byte $01   ; 04
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x011B99 04:9B89: 01        .byte $01   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011B9A 04:9B8A: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011B9B 04:9B8B: FF        .byte $FF   ; 07
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011B9C 04:9B8C: FF        .byte $FF   ; 08
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011B9D 04:9B8D: FF        .byte $FF   ; 09



tbl_9B8E:  ; orig: tbl_9B8E:
    ; [DIRECTIVE] .BYTE $FD  -- needs manual handling  ; orig: - D 0 - - - 0x011B9E 04:9B8E: FD        .byte $FD   ; 00
    ; [DIRECTIVE] .BYTE $FD  -- needs manual handling  ; orig: - D 0 - - - 0x011B9F 04:9B8F: FD        .byte $FD   ; 01
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011BA0 04:9B90: FF        .byte $FF   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011BA1 04:9B91: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011BA2 04:9B92: FF        .byte $FF   ; 04
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011BA3 04:9B93: FF        .byte $FF   ; 05
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x011BA4 04:9B94: FF        .byte $FF   ; 06
    ; [DIRECTIVE] .BYTE $FC  -- needs manual handling  ; orig: - D 0 - - - 0x011BA5 04:9B95: FC        .byte $FC   ; 07



tbl_9B96_pos_Y:  ; orig: tbl_9B96_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011BA6 04:9B96: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011BA7 04:9B97: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - - - - - - 0x011BA8 04:9B98: 20        .byte $20   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011BA9 04:9B99: 20        .byte $20   ; 03
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - - - - - - 0x011BAA 04:9B9A: 20        .byte $20   ; 04
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - - - - - - 0x011BAB 04:9B9B: 20        .byte $20   ; 05
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - - - - - - 0x011BAC 04:9B9C: 20        .byte $20   ; 06
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011BAD 04:9B9D: E0        .byte $E0   ; 07



tbl_9B9E_direction:  ; orig: tbl_9B9E_direction:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011BAE 04:9B9E: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x011BAF 04:9B9F: 02        .byte $02   ; 01
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011BB0 04:9BA0: 04        .byte $04   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011BB1 04:9BA1: 08        .byte $08   ; 03



ofs_004_0x011BB2_16:  ; orig: ofs_004_0x011BB2_16:

; con_obj_id_16

; in

; X = 01+
    CMPI.B  #$01,D1  ; orig: C - - J - - 0x011BB2 04:9BA2: E0 01     CPX #$01
    BNE     b04_bra_9BA6             ; BNE  ; orig: C - - - - - 0x011BB4 04:9BA4: D0 00     BNE b04_bra_9BA6    ; bz
b04_bra_9BA6:  ; orig: b04_bra_9BA6:
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x011BB6 04:9BA6: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x011BB9 04:9BA9: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_9BFA             ; BNE  ; orig: C - - - - - 0x011BBB 04:9BAB: D0 4D     BNE b04_bra_9BFA
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x011BBD 04:9BAD: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011BBF 04:9BAF: 4A        LSR
    BCS     b04_bra_9C26             ; BCS  ; orig: C - - - - - 0x011BC0 04:9BB0: B0 74     BCS b04_bra_9C26
    BSR     sub_9CBD             ; JSR -> BSR  ; orig: C - - - - - 0x011BC2 04:9BB2: 20 BD 9C  JSR sub_9CBD
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9BBF             ; BEQ  ; orig: C - - - - - 0x011BC7 04:9BB7: F0 06     BEQ b04_bra_9BBF
    BSR     sub_9C3A             ; JSR -> BSR  ; orig: C - - - - - 0x011BC9 04:9BB9: 20 3A 9C  JSR sub_9C3A
    JMP     loc_9BCF  ; orig: C - - - - - 0x011BCC 04:9BBC: 4C CF 9B  JMP loc_9BCF
b04_bra_9BBF:  ; orig: b04_bra_9BBF:
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9BFD             ; BEQ  ; orig: C - - - - - 0x011BD2 04:9BC2: F0 39     BEQ b04_bra_9BFD
    MOVEA.L #$FF0394,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x011BD4 04:9BC4: DE 94 03  DEC ram_0394_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011BD9 04:9BC9: 18        CLC
    ; !! ADC tbl_9B84_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011BDA 04:9BCA: 79 84 9B  ADC tbl_9B84_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

loc_9BCF:  ; orig: loc_9BCF:
    BSR     sub_9C8F             ; JSR -> BSR  ; orig: C D 0 - - - 0x011BDF 04:9BCF: 20 8F 9C  JSR sub_9C8F
    BCC     b04_bra_9BFA             ; BCC  ; orig: C - - - - - 0x011BE2 04:9BD2: 90 26     BCC b04_bra_9BFA
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$FC,D0  ; orig: C - - - - - 0x011BE7 04:9BD7: 29 FC     AND #$FC
    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x011BE9 04:9BD9: C9 B0     CMP #$B0
    BEQ     b04_bra_9BFD             ; BEQ  ; orig: C - - - - - 0x011BEB 04:9BDB: F0 20     BEQ b04_bra_9BFD
    CMPI.B  #$F4,D0  ; orig: C - - - - - 0x011BED 04:9BDD: C9 F4     CMP #$F4
    BCS     b04_bra_9BFD             ; BCS  ; orig: C - - - - - 0x011BEF 04:9BDF: B0 1C     BCS b04_bra_9BFD
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011BF3 04:9BE3: 29 03     AND #con_dir__LR
    BNE     b04_bra_9BF0             ; BNE  ; orig: C - - - - - 0x011BF5 04:9BE5: D0 09     BNE b04_bra_9BF0
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x011BF9 04:9BE9: 49 0C     EOR #con_dir__UD
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_9C26  ; orig: C - - - - - 0x011BFD 04:9BED: 4C 26 9C  JMP loc_9C26
b04_bra_9BF0:  ; orig: b04_bra_9BF0:
    EORI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011C00 04:9BF0: 49 03     EOR #con_dir__LR
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9CBD             ; JSR -> BSR  ; orig: C - - - - - 0x011C04 04:9BF4: 20 BD 9C  JSR sub_9CBD
    BSR     sub_9CBD             ; JSR -> BSR  ; orig: C - - - - - 0x011C07 04:9BF7: 20 BD 9C  JSR sub_9CBD
b04_bra_9BFA:  ; orig: b04_bra_9BFA:
    JMP     loc_9C26  ; orig: C - - - - - 0x011C0A 04:9BFA: 4C 26 9C  JMP loc_9C26
b04_bra_9BFD:  ; orig: b04_bra_9BFD:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9C26             ; BNE  ; orig: C - - - - - 0x011C0F 04:9BFF: D0 25     BNE b04_bra_9C26
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011C11 04:9C01: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011C15 04:9C05: 88        DEY
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$78,D0  ; orig: C - - - - - 0x011C18 04:9C08: C9 78     CMP #$78
    BCS     b04_bra_9C0E             ; BCS  ; orig: C - - - - - 0x011C1A 04:9C0A: B0 02     BCS b04_bra_9C0E
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x011C1C 04:9C0C: A0 03     LDY #$03    ; con_di
b04_bra_9C0E:  ; orig: b04_bra_9C0E:
    CMPI.B  #$A8,D0  ; orig: C - - - - - 0x011C1E 04:9C0E: C9 A8     CMP #$A8
    BCC     b04_bra_9C14             ; BCC  ; orig: C - - - - - 0x011C20 04:9C10: 90 02     BCC b04_bra_9C14
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x011C22 04:9C12: A0 07     LDY #$07    ; con_di
b04_bra_9C14:  ; orig: b04_bra_9C14:
    MOVEA.L #tbl_9B8E,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011C2C 04:9C1C: 18        CLC
    ; !! ADC tbl_9B96_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011C2D 04:9C1D: 79 96 9B  ADC tbl_9B96_pos_Y,Y
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011C33 04:9C23: C8        INY
    MOVEA.L #$FF0098,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x011C34 04:9C24: 94 98     STY ram_dir_enemy,X
    MOVE.B  D2,(A0,D1.L)  ; ^
b04_bra_9C26:  ; orig: b04_bra_9C26:
loc_9C26:  ; orig: loc_9C26:
    MOVE.B  #$08,D0  ; orig: C D 0 - - - 0x011C36 04:9C26: A9 08     LDA #$08
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011C38 04:9C28: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x011C3E 04:9C2E: 20 DB 77  JSR sub_bat_77DB
    MOVE.B  #$FE,D0  ; orig: C - - - - - 0x011C41 04:9C31: A9 FE     LDA #$FE
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)


; bzk optimize, JMP
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011C46 04:9C36: 20 D0 79  JSR sub_bat_79D0
    RTS                     ; RTS  ; orig: C - - - - - 0x011C49 04:9C39: 60        RTS



sub_9C3A:  ; orig: sub_9C3A:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011C4D 04:9C3D: 18        CLC
    ADD.B  #$38,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011C4E 04:9C3E: 69 38     ADC #$38
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011C56 04:9C46: 69 00     ADC #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011C5B 04:9C4B: 18        CLC
    ; !! ADC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x011C5C 04:9C4C: 75 84     ADC ram_pos_Y_enemy,
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    BMI     b04_bra_9C8E_RTS             ; BMI  ; orig: C - - - - - 0x011C63 04:9C53: 30 39     BMI b04_bra_9C8E_RTS
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_042B_enemy,A0
    CMP.B  (A0,D1.L),D0

    BCC     b04_bra_9C8E_RTS             ; BCC  ; orig: C - - - - - 0x011C6A 04:9C5A: 90 32     BCC b04_bra_9C8E_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011C6C 04:9C5C: A9 00     LDA #$00
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$03,D0  ; orig: C - - - - - 0x011C78 04:9C68: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011C7A 04:9C6A: A8        TAY
    MOVEA.L #tbl_9B9E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$40,D0  ; orig: C - - - - - 0x011C82 04:9C72: 29 40     AND #$40
    ADD.B  #$30,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011C84 04:9C74: 69 30     ADC #$30
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011C8B 04:9C7B: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011C8C 04:9C7C: 69 08     ADC #$08
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011C8E 04:9C7E: 29 F0     AND #$F0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011C94 04:9C84: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011C95 04:9C85: 69 08     ADC #$08
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011C97 04:9C87: 29 F0     AND #$F0
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x011C99 04:9C89: 38        SEC
    SUB.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x011C9A 04:9C8A: E9 03     SBC #$03
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9C8E_RTS:  ; orig: b04_bra_9C8E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011C9E 04:9C8E: 60        RTS



sub_9C8F:  ; orig: sub_9C8F:
    BSR     sub_9CAE             ; JSR -> BSR  ; orig: C - - - - - 0x011C9F 04:9C8F: 20 AE 9C  JSR sub_9CAE
    BCS     b04_bra_9CAD_RTS             ; BCS  ; orig: C - - - - - 0x011CA2 04:9C92: B0 19     BCS b04_bra_9CAD_RTS
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011CA6 04:9C96: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011CA7 04:9C97: 18        CLC
    ADD.B  #$0E,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011CA8 04:9C98: 69 0E     ADC #$0E
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011CAE 04:9C9E: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011CAF 04:9C9F: 18        CLC
    ADD.B  #$06,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011CB0 04:9CA0: 69 06     ADC #$06
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9CAE             ; JSR -> BSR  ; orig: C - - - - - 0x011CB4 04:9CA4: 20 AE 9C  JSR sub_9CAE
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011CB7 04:9CA7: 68        PLA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011CBA 04:9CAA: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9CAD_RTS:  ; orig: b04_bra_9CAD_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011CBD 04:9CAD: 60        RTS



sub_9CAE:  ; orig: sub_9CAE:
    MOVE.B  #con_dir_00,D2  ; orig: C - - - - - 0x011CBE 04:9CAE: A0 00     LDY #con_dir_00
    BSR     sub_0x01EE20_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x011CC0 04:9CB0: 20 10 EE  JSR sub_0x01EE20_fin
    MOVEA.L #ram_collision_tile_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x011CC6 04:9CB6: CD 4A 03  CMP ram_min_collisio
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011CCC 04:9CBC: 60        RTS



sub_9CBD:  ; orig: sub_9CBD:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011CCF 04:9CBF: 88        DEY
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011CD2 04:9CC2: 18        CLC
    ; !! ADC tbl_9B7A_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011CD3 04:9CC3: 79 7A 9B  ADC tbl_9B7A_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011CD8 04:9CC8: 60        RTS



ofs_004_0x011CD9_17:  ; orig: ofs_004_0x011CD9_17:

; con_obj_id_17

; in

; X = 01+
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9D17             ; BNE  ; orig: C - - - - - 0x011CDC 04:9CCC: D0 49     BNE b04_bra_9D17
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x011CDE 04:9CCE: A9 80     LDA #$80
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x011CE0 04:9CD0: 20 6E 80  JSR sub_806E
    MOVEA.L #$FF03D0,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x011CE3 04:9CD3: DE D0 03  DEC ram_anim_timer_o
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_9CE7             ; BNE  ; orig: C - - - - - 0x011CE6 04:9CD6: D0 0F     BNE b04_bra_9CE7
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x011CE8 04:9CD8: A9 08     LDA #$08
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D2

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x011CF0 04:9CE0: C8        INY
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011CF1 04:9CE1: 98        TYA
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x011CF2 04:9CE2: 29 03     AND #$03
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9CE7:  ; orig: b04_bra_9CE7:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x011CF7 04:9CE7: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x011CFD 04:9CED: 20 DB 77  JSR sub_bat_77DB
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011D00 04:9CF0: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9D16_RTS             ; BEQ  ; orig: C - - - - - 0x011D06 04:9CF6: F0 1E     BEQ b04_bra_9D16_RTS
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x011D08 04:9CF8: A5 70     LDA ram_pos_X_link
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x011D0C 04:9CFC: A5 84     LDA ram_pos_Y_link
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011D10 04:9D00: A9 00     LDA #$00
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x011D12 04:9D02: 85 28     STA ram_timer_link
    MOVE.B  D0,ram_0405_enemy  ; orig: C - - - - - 0x011D14 04:9D04: 8D 05 04  STA ram_0405_enemy
    MOVE.B  D0,ram_00C0_link  ; orig: C - - - - - 0x011D17 04:9D07: 85 C0     STA ram_00C0_link
    MOVE.B  D0,ram_00D3_link  ; orig: C - - - - - 0x011D19 04:9D09: 85 D3     STA ram_00D3_link
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$04,D0  ; orig: C - - - - - 0x011D1E 04:9D0E: A9 04     LDA #$04
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,ram_0512_flag  ; orig: C - - - - - 0x011D23 04:9D13: EE 12 05  INC ram_0512_flag
b04_bra_9D16_RTS:  ; orig: b04_bra_9D16_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011D26 04:9D16: 60        RTS
b04_bra_9D17:  ; orig: b04_bra_9D17:
    MOVE.B  #$02,D0  ; orig: - - - - - - 0x011D27 04:9D17: A9 02     LDA #$02
    MOVEA.L #ram_obj_anim_id,A0
    CMP.B  (A0,D1.L),D0

    BCC     b04_bra_9D2A             ; BCC  ; orig: - - - - - - 0x011D2C 04:9D1C: 90 0C     BCC b04_bra_9D2A
    MOVEA.L #$FF03D0,A0  ; Fix X: ; (empty translation for DEC)  ; orig: - - - - - - 0x011D2E 04:9D1E: DE D0 03  DEC ram_anim_timer_o
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_9D2A             ; BNE  ; orig: - - - - - - 0x011D31 04:9D21: D0 07     BNE b04_bra_9D2A
    ASL.B   #1,D0           ; ASL A  ; orig: - - - - - - 0x011D33 04:9D23: 0A        ASL
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF03E4,A0  ; Fix X: ; (empty translation for INC)  ; orig: - - - - - - 0x011D37 04:9D27: FE E4 03  INC ram_obj_anim_id,
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_9D2A:  ; orig: b04_bra_9D2A:
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for INC)  ; orig: - - - - - - 0x011D3A 04:9D2A: FE 2C 04  INC ram_042B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$60,D0  ; orig: - - - - - - 0x011D40 04:9D30: C9 60     CMP #$60
    BCC     b04_bra_9D3E             ; BCC  ; orig: - - - - - - 0x011D42 04:9D32: 90 0A     BCC b04_bra_9D3E
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x011D44 04:9D34: A9 00     LDA #$00
    MOVE.B  D0,ram_item_magic_shield  ; orig: - - - - - - 0x011D46 04:9D36: 8D 76 06  STA ram_item_magic_s
    MOVE.B  #$C0,D0  ; orig: - - - - - - 0x011D49 04:9D39: A9 C0     LDA #$C0
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9D3E:  ; orig: b04_bra_9D3E:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: - - - - - - 0x011D4E 04:9D3E: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_8297             ; JSR -> BSR  ; orig: - - - - - - 0x011D54 04:9D44: 20 97 82  JSR sub_8297
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: - - - - - - 0x011D57 04:9D47: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9D16_RTS             ; BEQ  ; orig: - - - - - - 0x011D5D 04:9D4D: F0 C7     BEQ b04_bra_9D16_RTS
    MOVE.B  #$00,D0  ; orig: - - - - - - 0x011D5F 04:9D4F: A9 00     LDA #$00
    MOVE.B  D0,ram_0512_flag  ; orig: - - - - - - 0x011D61 04:9D51: 8D 12 05  STA ram_0512_flag
    JMP     loc_828A  ; orig: - - - - - - 0x011D64 04:9D54: 4C 8A 82  JMP loc_828A



ofs_004_0x011D67_12:  ; orig: ofs_004_0x011D67_12:

; con_obj_id_12

; in

; X = 01+
    BSR     sub_9D82             ; JSR -> BSR  ; orig: C - - J - - 0x011D67 04:9D57: 20 82 9D  JSR sub_9D82
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$02,D0  ; orig: C - - - - - 0x011D6C 04:9D5C: C9 02     CMP #$02
    BCS     b04_bra_9D66             ; BCS  ; orig: C - - - - - 0x011D6E 04:9D5E: B0 06     BCS b04_bra_9D66
    BSR     sub_9DBD             ; JSR -> BSR  ; orig: C - - - - - 0x011D70 04:9D60: 20 BD 9D  JSR sub_9DBD
    JMP     loc_9DD1  ; orig: C - - - - - 0x011D73 04:9D63: 4C D1 9D  JMP loc_9DD1
b04_bra_9D66:  ; orig: b04_bra_9D66:
    ADDQ.B  #1,ram_enemy_cnt  ; orig: C - - - - - 0x011D76 04:9D66: EE 4E 03  INC ram_enemy_cnt
    BSR     sub_0x01FEC1_destroy_object             ; JSR -> BSR  ; orig: C - - - - - 0x011D79 04:9D69: 20 B1 FE  JSR sub_0x01FEC1_des
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x011D7C 04:9D6C: A0 01     LDY #$01
b04_bra_9D6E_loop:  ; orig: b04_bra_9D6E_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011D7E 04:9D6E: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011D7F 04:9D6F: 48        PHA
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C - - - - - 0x011D80 04:9D70: 20 BB FE  JSR sub_0x01FECB_sea
    BEQ     b04_bra_9D7C             ; BEQ  ; orig: C - - - - - 0x011D83 04:9D73: F0 07     BEQ b04_bra_9D7C    ; if
    MOVE.B  #con_obj_id_1C,D0  ; orig: C - - - - - 0x011D85 04:9D75: A9 1C     LDA #con_obj_id_1C
    MOVE.B  D0,ram_0000_t36_obj_id  ; orig: C - - - - - 0x011D87 04:9D77: 85 00     STA ram_0000_t36_obj
    BSR     sub_B195             ; JSR -> BSR  ; orig: C - - - - - 0x011D89 04:9D79: 20 95 B1  JSR sub_B195
b04_bra_9D7C:  ; orig: b04_bra_9D7C:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011D8C 04:9D7C: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011D8D 04:9D7D: A8        TAY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011D8E 04:9D7E: 88        DEY
    BPL     b04_bra_9D6E_loop             ; BPL  ; orig: C - - - - - 0x011D8F 04:9D7F: 10 ED     BPL b04_bra_9D6E_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x011D91 04:9D81: 60        RTS



sub_9D82:  ; orig: sub_9D82:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x011D94 04:9D84: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_031_9D9B_00  -- needs manual handling  ; orig: - D 0 - I - 0x011D97 04:9D87: 9B 9D     .word ofs_031_9D9B_0
    ; [DIRECTIVE] .WORD ofs_031_84F1_01  -- needs manual handling  ; orig: - D 0 - I - 0x011D99 04:9D89: F1 84     .word ofs_031_84F1_0



tbl_9D8B_pos_Y:  ; orig: tbl_9D8B_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011D9B 04:9D8B: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $FD  -- needs manual handling  ; orig: - D 0 - - - 0x011D9C 04:9D8C: FD        .byte $FD   ; 01
    ; [DIRECTIVE] .BYTE $FE  -- needs manual handling  ; orig: - D 0 - - - 0x011D9D 04:9D8D: FE        .byte $FE   ; 02
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011D9E 04:9D8E: FF        .byte $FF   ; 03
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011D9F 04:9D8F: FF        .byte $FF   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011DA0 04:9D90: 00        .byte $00   ; 05
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011DA1 04:9D91: FF        .byte $FF   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011DA2 04:9D92: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011DA3 04:9D93: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011DA4 04:9D94: 01        .byte $01   ; 09
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011DA5 04:9D95: 00        .byte $00   ; 0A
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011DA6 04:9D96: 01        .byte $01   ; 0B
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011DA7 04:9D97: 01        .byte $01   ; 0C
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x011DA8 04:9D98: 02        .byte $02   ; 0D
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 0 - - - 0x011DA9 04:9D99: 03        .byte $03   ; 0E
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011DAA 04:9D9A: 00        .byte $00   ; 0F



ofs_031_9D9B_00:  ; orig: ofs_031_9D9B_00:
    MOVE.B  #$80,D0  ; orig: C - - J - - 0x011DAB 04:9D9B: A9 80     LDA #$80
    BSR     sub_806E             ; JSR -> BSR  ; orig: C - - - - - 0x011DAD 04:9D9D: 20 6E 80  JSR sub_806E
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x011DB0 04:9DA0: AD 6C 06  LDA ram_item_clock
    ; !! ORA ram_003D_enemy,X - needs manual review  ; orig: C - - - - - 0x011DB3 04:9DA3: 15 3D     ORA ram_003D_enemy,X
    BNE     b04_bra_9DBC_RTS             ; BNE  ; orig: C - - - - - 0x011DB5 04:9DA5: D0 15     BNE b04_bra_9DBC_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011DB9 04:9DA9: 29 03     AND #con_dir__LR
    BEQ     b04_bra_9DBC_RTS             ; BEQ  ; orig: C - - - - - 0x011DBB 04:9DAB: F0 0F     BEQ b04_bra_9DBC_RTS
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x011DC0 04:9DB0: 20 1F 70  JSR sub_bat_701F_EOR
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011DC3 04:9DB3: A8        TAY
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011DC6 04:9DB6: 18        CLC
    ; !! ADC tbl_9D8B_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011DC7 04:9DB7: 79 8B 9D  ADC tbl_9D8B_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9DBC_RTS:  ; orig: b04_bra_9DBC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011DCC 04:9DBC: 60        RTS



sub_9DBD:  ; orig: sub_9DBD:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9DD0_RTS             ; BNE  ; orig: C - - - - - 0x011DCF 04:9DBF: D0 0F     BNE b04_bra_9DD0_RTS
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x011DD1 04:9DC1: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9DD0_RTS             ; BNE  ; orig: C - - - - - 0x011DD7 04:9DC7: D0 07     BNE b04_bra_9DD0_RTS
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9DD0_RTS             ; BEQ  ; orig: C - - - - - 0x011DDC 04:9DCC: F0 02     BEQ b04_bra_9DD0_RTS
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011DDE 04:9DCE: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_9DD0_RTS:  ; orig: b04_bra_9DD0_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011DE0 04:9DD0: 60        RTS



loc_9DD1:  ; orig: loc_9DD1:
    MOVE.B  #$0A,D0  ; orig: C D 0 - - - 0x011DE1 04:9DD1: A9 0A     LDA #$0A
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x011DE3 04:9DD3: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x011DE8 04:9DD8: 29 08     AND #con_dir_Up

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011DEA 04:9DDA: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011DEB 04:9DDB: 4A        LSR
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011DEC 04:9DDC: 18        CLC
    ; !! ADC ram_obj_anim_id,X - complex mode, manual review needed  ; orig: C - - - - - 0x011DED 04:9DDD: 7D E4 03  ADC ram_obj_anim_id,
    JMP     loc_bat_77DB  ; orig: C - - - - - 0x011DF0 04:9DE0: 4C DB 77  JMP loc_bat_77DB



ofs_004_0x011DF3_23:  ; orig: ofs_004_0x011DF3_23:

; con_obj_id_23

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x011DF3 04:9DE3: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_9DF4             ; BNE  ; orig: C - - - - - 0x011DF6 04:9DE6: D0 0C     BNE b04_bra_9DF4
    BSR     sub_9DF7             ; JSR -> BSR  ; orig: C - - - - - 0x011DF8 04:9DE8: 20 F7 9D  JSR sub_9DF7
    BSR     sub_9F58             ; JSR -> BSR  ; orig: C - - - - - 0x011DFB 04:9DEB: 20 58 9F  JSR sub_9F58
loc_9DEE:  ; orig: loc_9DEE:

; in

; X = 01+
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011E01 04:9DF1: 4A        LSR
    BCS     b04_bra_9E17_RTS             ; BCS  ; orig: C - - - - - 0x011E02 04:9DF2: B0 23     BCS b04_bra_9E17_RTS
b04_bra_9DF4:  ; orig: b04_bra_9DF4:
    JMP     loc_A040  ; orig: C - - - - - 0x011E04 04:9DF4: 4C 40 A0  JMP loc_A040



sub_9DF7:  ; orig: sub_9DF7:

; in

; X = 01+
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9E0C             ; BNE  ; orig: C - - - - - 0x011E09 04:9DF9: D0 11     BNE b04_bra_9E0C
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_9E06             ; BEQ  ; orig: C - - - - - 0x011E0E 04:9DFE: F0 06     BEQ b04_bra_9E06
    MOVEA.L #$FF0394,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x011E10 04:9E00: DE 94 03  DEC ram_0394_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_9E20  ; orig: C - - - - - 0x011E13 04:9E03: 4C 20 9E  JMP loc_9E20
b04_bra_9E06:  ; orig: b04_bra_9E06:
    BSR     sub_9EFC             ; JSR -> BSR  ; orig: C - - - - - 0x011E16 04:9E06: 20 FC 9E  JSR sub_9EFC
    JMP     loc_9E62  ; orig: C - - - - - 0x011E19 04:9E09: 4C 62 9E  JMP loc_9E62
b04_bra_9E0C:  ; orig: b04_bra_9E0C:
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x011E1C 04:9E0C: C9 10     CMP #$10
    BCS     b04_bra_9E18             ; BCS  ; orig: C - - - - - 0x011E1E 04:9E0E: B0 08     BCS b04_bra_9E18
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x011E20 04:9E10: C9 01     CMP #$01
    BNE     b04_bra_9E17_RTS             ; BNE  ; orig: C - - - - - 0x011E22 04:9E12: D0 03     BNE b04_bra_9E17_RTS
    BSR     sub_9EBC             ; JSR -> BSR  ; orig: C - - - - - 0x011E24 04:9E14: 20 BC 9E  JSR sub_9EBC
b04_bra_9E17_RTS:  ; orig: b04_bra_9E17_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011E27 04:9E17: 60        RTS
b04_bra_9E18:  ; orig: b04_bra_9E18:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x011E28 04:9E18: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011E2A 04:9E1A: 4A        LSR
    BCS     b04_bra_9E5B             ; BCS  ; orig: C - - - - - 0x011E2B 04:9E1B: B0 3E     BCS b04_bra_9E5B    ; bz
sub_9E1D:  ; orig: sub_9E1D:
    BSR     sub_9E58             ; JSR -> BSR  ; orig: C - - - - - 0x011E2D 04:9E1D: 20 58 9E  JSR sub_9E58
loc_9E20:  ; orig: loc_9E20:
    BSR     sub_9E9D_change_position_by_direction             ; JSR -> BSR  ; orig: C D 0 - - - 0x011E30 04:9E20: 20 9D 9E  JSR sub_9E9D_change_
    BSR     sub_9F2C             ; JSR -> BSR  ; orig: C - - - - - 0x011E33 04:9E23: 20 2C 9F  JSR sub_9F2C
    BCC     b04_bra_9E57_RTS             ; BCC  ; orig: C - - - - - 0x011E36 04:9E26: 90 2F     BCC b04_bra_9E57_RTS
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$FC,D0  ; orig: C - - - - - 0x011E3B 04:9E2B: 29 FC     AND #$FC
    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x011E3D 04:9E2D: C9 B0     CMP #$B0
    BEQ     b04_bra_9E35             ; BEQ  ; orig: C - - - - - 0x011E3F 04:9E2F: F0 04     BEQ b04_bra_9E35
    CMPI.B  #$F4,D0  ; orig: C - - - - - 0x011E41 04:9E31: C9 F4     CMP #$F4
    BCC     b04_bra_9E3D             ; BCC  ; orig: C - - - - - 0x011E43 04:9E33: 90 08     BCC b04_bra_9E3D
b04_bra_9E35:  ; orig: b04_bra_9E35:
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9E17_RTS             ; BNE  ; orig: C - - - - - 0x011E48 04:9E38: D0 DD     BNE b04_bra_9E17_RTS
    JMP     loc_9EEB  ; orig: C - - - - - 0x011E4A 04:9E3A: 4C EB 9E  JMP loc_9EEB
b04_bra_9E3D:  ; orig: b04_bra_9E3D:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011E4F 04:9E3F: 98        TYA
    ANDI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x011E50 04:9E40: 29 0C     AND #con_dir__UD
    BEQ     b04_bra_9E4A             ; BEQ  ; orig: C - - - - - 0x011E52 04:9E42: F0 06     BEQ b04_bra_9E4A
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011E54 04:9E44: 98        TYA
    EORI.B  #con_dir__UD,D0  ; orig: C - - - - - 0x011E55 04:9E45: 49 0C     EOR #con_dir__UD
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011E59 04:9E49: A8        TAY
b04_bra_9E4A:  ; orig: b04_bra_9E4A:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011E5A 04:9E4A: 98        TYA
    ANDI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011E5B 04:9E4B: 29 03     AND #con_dir__LR
    BEQ     b04_bra_9E54             ; BEQ  ; orig: C - - - - - 0x011E5D 04:9E4D: F0 05     BEQ b04_bra_9E54
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011E5F 04:9E4F: 98        TYA
    EORI.B  #con_dir__LR,D0  ; orig: C - - - - - 0x011E60 04:9E50: 49 03     EOR #con_dir__LR
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9E54:  ; orig: b04_bra_9E54:
    JMP     loc_9E9D_change_position_by_direction  ; orig: C - - - - - 0x011E64 04:9E54: 4C 9D 9E  JMP loc_9E9D_change_
b04_bra_9E57_RTS:  ; orig: b04_bra_9E57_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011E67 04:9E57: 60        RTS



sub_9E58:  ; orig: sub_9E58:
    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011E68 04:9E58: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_9E5B:  ; orig: b04_bra_9E5B:
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x011E6E 04:9E5E: 29 3F     AND #$3F
    BNE     b04_bra_9EAF_RTS             ; BNE  ; orig: C - - - - - 0x011E70 04:9E60: D0 4D     BNE b04_bra_9EAF_RTS
loc_9E62:  ; orig: loc_9E62:
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$40,D0  ; orig: C - - - - - 0x011E75 04:9E65: 29 40     AND #$40
    BNE     b04_bra_9E75             ; BNE  ; orig: C - - - - - 0x011E77 04:9E67: D0 0C     BNE b04_bra_9E75
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x011E79 04:9E69: A9 02     LDA #con_dir_Left
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMP.B   ram_pos_X_link,D2  ; orig: C - - - - - 0x011E7D 04:9E6D: C4 70     CPY ram_pos_X_link
    BCS     b04_bra_9E72             ; BCS  ; orig: C - - - - - 0x011E7F 04:9E6F: B0 01     BCS b04_bra_9E72
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011E81 04:9E71: 4A        LSR ; -> 01 con_dir_
b04_bra_9E72:  ; orig: b04_bra_9E72:
    JMP     loc_9E7E  ; orig: C - - - - - 0x011E82 04:9E72: 4C 7E 9E  JMP loc_9E7E
b04_bra_9E75:  ; orig: b04_bra_9E75:
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x011E85 04:9E75: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMP.B   ram_pos_Y_link,D2  ; orig: C - - - - - 0x011E89 04:9E79: C4 84     CPY ram_pos_Y_link
    BCS     b04_bra_9E7E             ; BCS  ; orig: C - - - - - 0x011E8B 04:9E7B: B0 01     BCS b04_bra_9E7E
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011E8D 04:9E7D: 4A        LSR ; -> 04 con_dir_
b04_bra_9E7E:  ; orig: b04_bra_9E7E:
loc_9E7E:  ; orig: loc_9E7E:
    MOVEA.L #ram_dir_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_9EAF_RTS             ; BEQ  ; orig: C - - - - - 0x011E90 04:9E80: F0 2D     BEQ b04_bra_9EAF_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_9F02  ; orig: C - - - - - 0x011E94 04:9E84: 4C 02 9F  JMP loc_9F02



tbl_9E87_pos_X:  ; orig: tbl_9E87_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011E97 04:9E87: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011E98 04:9E88: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011E99 04:9E89: FF        .byte $FF   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011E9A 04:9E8A: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011E9B 04:9E8B: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011E9C 04:9E8C: 01        .byte $01   ; 05
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011E9D 04:9E8D: FF        .byte $FF   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011E9E 04:9E8E: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011E9F 04:9E8F: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011EA0 04:9E90: 01        .byte $01   ; 09
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011EA1 04:9E91: FF        .byte $FF   ; 0A



tbl_9E92_pos_Y:  ; orig: tbl_9E92_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011EA2 04:9E92: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011EA3 04:9E93: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011EA4 04:9E94: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011EA5 04:9E95: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011EA6 04:9E96: 01        .byte $01   ; 04
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011EA7 04:9E97: 01        .byte $01   ; 05
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011EA8 04:9E98: 01        .byte $01   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011EA9 04:9E99: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011EAA 04:9E9A: FF        .byte $FF   ; 08
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011EAB 04:9E9B: FF        .byte $FF   ; 09
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 0 - - - 0x011EAC 04:9E9C: FF        .byte $FF   ; 0A



sub_9E9D_change_position_by_direction:  ; orig: sub_9E9D_change_position_by_direction:
loc_9E9D_change_position_by_direction:  ; orig: loc_9E9D_change_position_by_direction:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011EB1 04:9EA1: 18        CLC
    ; !! ADC tbl_9E87_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011EB2 04:9EA2: 79 87 9E  ADC tbl_9E87_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011EB9 04:9EA9: 18        CLC
    ; !! ADC tbl_9E92_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011EBA 04:9EAA: 79 92 9E  ADC tbl_9E92_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9EAF_RTS:  ; orig: b04_bra_9EAF_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011EBF 04:9EAF: 60        RTS



tbl_9EB0_pos_X:  ; orig: tbl_9EB0_pos_X:
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011EC0 04:9EB0: E0        .byte $E0   ; 00
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011EC1 04:9EB1: 20        .byte $20   ; 01
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011EC2 04:9EB2: E0        .byte $E0   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011EC3 04:9EB3: 20        .byte $20   ; 03



tbl_9EB4_pos_Y:  ; orig: tbl_9EB4_pos_Y:
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011EC4 04:9EB4: E0        .byte $E0   ; 00
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011EC5 04:9EB5: E0        .byte $E0   ; 01
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011EC6 04:9EB6: 20        .byte $20   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011EC7 04:9EB7: 20        .byte $20   ; 03



tbl_9EB8_direction:  ; orig: tbl_9EB8_direction:
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 0 - - - 0x011EC8 04:9EB8: 0A        .byte $0A   ; 00
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 0 - - - 0x011EC9 04:9EB9: 09        .byte $09   ; 01
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 0 - - - 0x011ECA 04:9EBA: 06        .byte $06   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 0 - - - 0x011ECB 04:9EBB: 05        .byte $05   ; 03



sub_9EBC:  ; orig: sub_9EBC:
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$03,D0  ; orig: C - - - - - 0x011ECE 04:9EBE: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011ED0 04:9EC0: A8        TAY
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011ED3 04:9EC3: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011ED4 04:9EC4: 18        CLC
    ; !! ADC tbl_9EB0_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011ED5 04:9EC5: 79 B0 9E  ADC tbl_9EB0_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011EDC 04:9ECC: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011EDD 04:9ECD: 18        CLC
    ; !! ADC tbl_9EB4_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011EDE 04:9ECE: 79 B4 9E  ADC tbl_9EB4_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x011EE3 04:9ED3: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011EE4 04:9ED4: 48        PHA
    MOVEA.L #tbl_9EB8_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011EE8 04:9ED8: A8        TAY
    BSR     sub_9F2E             ; JSR -> BSR  ; orig: C - - - - - 0x011EE9 04:9ED9: 20 2E 9F  JSR sub_9F2E
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011EEC 04:9EDC: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x011EED 04:9EDD: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011EEE 04:9EDE: 68        PLA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011EF1 04:9EE1: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BCS     b04_bra_9EFC             ; BCS  ; orig: C - - - - - 0x011EF4 04:9EE4: B0 16     BCS b04_bra_9EFC
    MOVEA.L #tbl_9EB8_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

loc_9EEB:  ; orig: loc_9EEB:
    MOVE.B  #$20,D0  ; orig: C D 0 - - - 0x011EFB 04:9EEB: A9 20     LDA #$20
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #$40,D0  ; orig: C - - - - - 0x011F03 04:9EF3: 49 40     EOR #$40
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x011F08 04:9EF8: A9 00     LDA #$00
    BEQ     b04_bra_9F00             ; BEQ  ; orig: C - - - - - 0x011F0A 04:9EFA: F0 04     BEQ b04_bra_9F00    ; jm
b04_bra_9EFC:  ; orig: b04_bra_9EFC:
sub_9EFC:  ; orig: sub_9EFC:
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ORI.B   #$70,D0  ; orig: C - - - - - 0x011F0E 04:9EFE: 09 70     ORA #$70
b04_bra_9F00:  ; orig: b04_bra_9F00:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

loc_9F02:  ; orig: loc_9F02:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011F14 04:9F04: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011F15 04:9F05: 69 08     ADC #$08
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011F17 04:9F07: 29 F0     AND #$F0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011F1D 04:9F0D: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x011F1E 04:9F0E: 69 08     ADC #$08
sub_9F10:  ; orig: sub_9F10:
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011F20 04:9F10: 29 F0     AND #$F0
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x011F22 04:9F12: 38        SEC
    SUB.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x011F23 04:9F13: E9 03     SBC #$03
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011F27 04:9F17: 60        RTS



tbl_9F18_pos_X:  ; orig: tbl_9F18_pos_X:
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 0 - - - 0x011F28 04:9F18: 0F        .byte $0F   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011F29 04:9F19: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011F2A 04:9F1A: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011F2B 04:9F1B: 04        .byte $04   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011F2C 04:9F1C: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011F2D 04:9F1D: 00        .byte $00   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011F2E 04:9F1E: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011F2F 04:9F1F: 04        .byte $04   ; 07
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011F30 04:9F20: 08        .byte $08   ; 08
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011F31 04:9F21: 00        .byte $00   ; 09



tbl_9F22_pos_Y:  ; orig: tbl_9F22_pos_Y:
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011F32 04:9F22: 04        .byte $04   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011F33 04:9F23: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011F34 04:9F24: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011F35 04:9F25: 08        .byte $08   ; 03
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011F36 04:9F26: 08        .byte $08   ; 04
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011F37 04:9F27: 08        .byte $08   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x011F38 04:9F28: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $F8  -- needs manual handling  ; orig: - D 0 - - - 0x011F39 04:9F29: F8        .byte $F8   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011F3A 04:9F2A: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011F3B 04:9F2B: 00        .byte $00   ; 09



sub_9F2C:  ; orig: sub_9F2C:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D2

sub_9F2E:  ; orig: sub_9F2E:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x011F3E 04:9F2E: 88        DEY
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011F41 04:9F31: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011F42 04:9F32: 18        CLC
    ; !! ADC tbl_9F18_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011F43 04:9F33: 79 18 9F  ADC tbl_9F18_pos_X,Y
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x011F4A 04:9F3A: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x011F4B 04:9F3B: 18        CLC
    ; !! ADC tbl_9F22_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x011F4C 04:9F3C: 79 22 9F  ADC tbl_9F22_pos_Y,Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9F4B             ; JSR -> BSR  ; orig: C - - - - - 0x011F51 04:9F41: 20 4B 9F  JSR sub_9F4B
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011F54 04:9F44: 68        PLA
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x011F57 04:9F47: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011F5A 04:9F4A: 60        RTS



sub_9F4B:  ; orig: sub_9F4B:
    BSR     sub_0x01EE04_find_current_collision_tile___direction_00             ; JSR -> BSR  ; orig: C - - - - - 0x011F5B 04:9F4B: 20 F4 ED  JSR sub_0x01EE04_fin
    MOVEA.L #ram_collision_tile_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x011F61 04:9F51: CD 4A 03  CMP ram_min_collisio
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x011F67 04:9F57: 60        RTS



sub_9F58:  ; orig: sub_9F58:

; in

; X = 01+
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_9F7E_RTS             ; BNE  ; orig: C - - - - - 0x011F6B 04:9F5B: D0 21     BNE b04_bra_9F7E_RTS
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x011F6D 04:9F5D: A5 15     LDA ram_frm_cnt
    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x011F6F 04:9F5F: 29 1F     AND #$1F
    BNE     b04_bra_9F7E_RTS             ; BNE  ; orig: C - - - - - 0x011F71 04:9F61: D0 1B     BNE b04_bra_9F7E_RTS
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011F75 04:9F65: 29 F0     AND #$F0
    MOVE.B  D0,ram_0000_t1F  ; orig: C - - - - - 0x011F77 04:9F67: 85 00     STA ram_0000_t1F
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x011F79 04:9F69: A5 84     LDA ram_pos_Y_link
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011F7B 04:9F6B: 29 F0     AND #$F0
    CMP.B   ram_0000_t1F,D0  ; orig: C - - - - - 0x011F7D 04:9F6D: C5 00     CMP ram_0000_t1F
    BNE     b04_bra_9F7F             ; BNE  ; orig: C - - - - - 0x011F7F 04:9F6F: D0 0E     BNE b04_bra_9F7F
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x011F81 04:9F71: A9 02     LDA #con_dir_Left
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMP.B   ram_pos_X_link,D2  ; orig: C - - - - - 0x011F85 04:9F75: C4 70     CPY ram_pos_X_link
    BCS     b04_bra_9F7A             ; BCS  ; orig: C - - - - - 0x011F87 04:9F77: B0 01     BCS b04_bra_9F7A
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011F89 04:9F79: 4A        LSR ; -> 01 con_dir_
b04_bra_9F7A:  ; orig: b04_bra_9F7A:
    MOVEA.L #ram_dir_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_9F98             ; BEQ  ; orig: C - - - - - 0x011F8C 04:9F7C: F0 1A     BEQ b04_bra_9F98
b04_bra_9F7E_RTS:  ; orig: b04_bra_9F7E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x011F8E 04:9F7E: 60        RTS
b04_bra_9F7F:  ; orig: b04_bra_9F7F:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x011F91 04:9F81: 29 F0     AND #$F0
    MOVE.B  D0,ram_0000_t5A  ; orig: C - - - - - 0x011F93 04:9F83: 85 00     STA ram_0000_t5A
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x011F95 04:9F85: A5 70     LDA ram_pos_X_link
    CMP.B   ram_0000_t5A,D0  ; orig: C - - - - - 0x011F97 04:9F87: C5 00     CMP ram_0000_t5A
    BNE     b04_bra_9F7E_RTS             ; BNE  ; orig: C - - - - - 0x011F99 04:9F89: D0 F3     BNE b04_bra_9F7E_RTS
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x011F9B 04:9F8B: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMP.B   ram_pos_Y_link,D2  ; orig: C - - - - - 0x011F9F 04:9F8F: C4 84     CPY ram_pos_Y_link
    BCS     b04_bra_9F94             ; BCS  ; orig: C - - - - - 0x011FA1 04:9F91: B0 01     BCS b04_bra_9F94
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FA3 04:9F93: 4A        LSR ; -> 04 con_dir_
b04_bra_9F94:  ; orig: b04_bra_9F94:
    MOVEA.L #ram_dir_enemy,A0
    CMP.B  (A0,D1.L),D0

    BNE     b04_bra_9F7E_RTS             ; BNE  ; orig: C - - - - - 0x011FA6 04:9F96: D0 E6     BNE b04_bra_9F7E_RTS
b04_bra_9F98:  ; orig: b04_bra_9F98:
    MOVE.B  #con_obj_id_58,D0  ; orig: C - - - - - 0x011FA8 04:9F98: A9 58     LDA #con_obj_id_58
sub_9F9A:  ; orig: sub_9F9A:

; in

; X = 01+
    MOVE.B  D0,ram_0000_t36_obj_id  ; orig: C - - - - - 0x011FAA 04:9F9A: 85 00     STA ram_0000_t36_obj
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x011FAC 04:9F9C: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_9F7E_RTS             ; BNE  ; orig: C - - - - - 0x011FAF 04:9F9F: D0 DD     BNE b04_bra_9F7E_RTS
    MOVE.B  #con_sfx_4_energy_wave,D0  ; orig: C - - - - - 0x011FB1 04:9FA1: A9 04     LDA #con_sfx_4_energ
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x011FB3 04:9FA3: 8D 04 06  STA ram_sfx_4
    JMP     loc_B180  ; orig: C - - - - - 0x011FB6 04:9FA6: 4C 80 B1  JMP loc_B180



ofs_004_0x011FB9_24:  ; orig: ofs_004_0x011FB9_24:

; con_obj_id_24

; in

; X = 01+
    MOVE.B  ram_item_clock,D0  ; orig: C - - J - - 0x011FB9 04:9FA9: AD 6C 06  LDA ram_item_clock
    BEQ     b04_bra_9FB1             ; BEQ  ; orig: C - - - - - 0x011FBC 04:9FAC: F0 03     BEQ b04_bra_9FB1
    JMP     loc_A040  ; orig: - - - - - - 0x011FBE 04:9FAE: 4C 40 A0  JMP loc_A040
b04_bra_9FB1:  ; orig: b04_bra_9FB1:
    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x011FC1 04:9FB1: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x011FC4 04:9FB4: D6 AC     DEC ram_state_obj,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0


; / 40
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FC8 04:9FB8: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FC9 04:9FB9: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FCA 04:9FBA: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FCB 04:9FBB: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FCC 04:9FBC: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x011FCD 04:9FBD: 4A        LSR
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x011FCE 04:9FBE: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_032_A034_00_RTS  -- needs manual handling  ; orig: - D 0 - I - 0x011FD1 04:9FC1: 34 A0     .word ofs_032_A034_0
    ; [DIRECTIVE] .WORD ofs_032_9FED_40  -- needs manual handling  ; orig: - D 0 - I - 0x011FD3 04:9FC3: ED 9F     .word ofs_032_9FED_4
    ; [DIRECTIVE] .WORD ofs_032_A035_80  -- needs manual handling  ; orig: - D 0 - I - 0x011FD5 04:9FC5: 35 A0     .word ofs_032_A035_8
    ; [DIRECTIVE] .WORD ofs_032_9FFD_C0  -- needs manual handling  ; orig: - D 0 - I - 0x011FD7 04:9FC7: FD 9F     .word ofs_032_9FFD_C



tbl_9FC9_pos_X:  ; orig: tbl_9FC9_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FD9 04:9FC9: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FDA 04:9FCA: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011FDB 04:9FCB: E0        .byte $E0   ; 02
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011FDC 04:9FCC: 20        .byte $20   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FDD 04:9FCD: 00        .byte $00   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FDE 04:9FCE: 00        .byte $00   ; 05
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 0 - - - 0x011FDF 04:9FCF: C0        .byte $C0   ; 06
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011FE0 04:9FD0: 40        .byte $40   ; 07
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FE1 04:9FD1: 00        .byte $00   ; 08
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FE2 04:9FD2: 00        .byte $00   ; 09
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 0 - - - 0x011FE3 04:9FD3: D0        .byte $D0   ; 0A
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x011FE4 04:9FD4: 30        .byte $30   ; 0B
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FE5 04:9FD5: 00        .byte $00   ; 0C
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FE6 04:9FD6: 00        .byte $00   ; 0D
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 0 - - - 0x011FE7 04:9FD7: B0        .byte $B0   ; 0E
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x011FE8 04:9FD8: 50        .byte $50   ; 0F



tbl_9FD9_pos_Y:  ; orig: tbl_9FD9_pos_Y:
    ; [DIRECTIVE] .BYTE $E0  -- needs manual handling  ; orig: - D 0 - - - 0x011FE9 04:9FD9: E0        .byte $E0   ; 00
    ; [DIRECTIVE] .BYTE $20  -- needs manual handling  ; orig: - D 0 - - - 0x011FEA 04:9FDA: 20        .byte $20   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FEB 04:9FDB: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FEC 04:9FDC: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 0 - - - 0x011FED 04:9FDD: C0        .byte $C0   ; 04
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 0 - - - 0x011FEE 04:9FDE: 40        .byte $40   ; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FEF 04:9FDF: 00        .byte $00   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FF0 04:9FE0: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 0 - - - 0x011FF1 04:9FE1: D0        .byte $D0   ; 08
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 0 - - - 0x011FF2 04:9FE2: 30        .byte $30   ; 09
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FF3 04:9FE3: 00        .byte $00   ; 0A
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FF4 04:9FE4: 00        .byte $00   ; 0B
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 0 - - - 0x011FF5 04:9FE5: B0        .byte $B0   ; 0C
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 0 - - - 0x011FF6 04:9FE6: 50        .byte $50   ; 0D
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FF7 04:9FE7: 00        .byte $00   ; 0E
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 0 - - - 0x011FF8 04:9FE8: 00        .byte $00   ; 0F



tbl_9FE9:  ; orig: tbl_9FE9:
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 0 - - - 0x011FF9 04:9FE9: 04        .byte $04   ; 00
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 0 - - - 0x011FFA 04:9FEA: 08        .byte $08   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 0 - - - 0x011FFB 04:9FEB: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 0 - - - 0x011FFC 04:9FEC: 02        .byte $02   ; 03



ofs_032_9FED_40:  ; orig: ofs_032_9FED_40:

; in

; X = 01+
b04_bra_9FED:  ; orig: b04_bra_9FED:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$7F,D0  ; orig: C - - - - - 0x011FFF 04:9FEF: C9 7F     CMP #$7F
    BNE     b04_bra_9FF7             ; BNE  ; orig: C - - - - - 0x012001 04:9FF1: D0 04     BNE b04_bra_9FF7
    MOVE.B  #$4F,D0  ; orig: C - - - - - 0x012003 04:9FF3: A9 4F     LDA #$4F
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_9FF7:  ; orig: b04_bra_9FF7:
    MOVEA.L #$FF0394,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012007 04:9FF7: FE 94 03  INC ram_0394_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_9DEE  ; orig: C - - - - - 0x01200A 04:9FFA: 4C EE 9D  JMP loc_9DEE



ofs_032_9FFD_C0:  ; orig: ofs_032_9FFD_C0:

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D2

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01200F 04:9FFF: C8        INY
    BNE     b04_bra_9FED             ; BNE  ; orig: C - - - - - 0x012010 04:A000: D0 EB     BNE b04_bra_9FED
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012014 04:A004: 48        PHA
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x012015 04:A005: 29 03     AND #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012017 04:A007: A8        TAY
    MOVEA.L #tbl_9FE9,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01201D 04:A00D: 68        PLA
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x01201E 04:A00E: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012020 04:A010: A8        TAY
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x012021 04:A011: A5 70     LDA ram_pos_X_link
    ; !! ADC tbl_9FC9_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x012023 04:A013: 79 C9 9F  ADC tbl_9FC9_pos_X,Y
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x012026 04:A016: 29 F0     AND #$F0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x01202A 04:A01A: A5 84     LDA ram_pos_Y_link
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01202C 04:A01C: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01202D 04:A01D: 69 03     ADC #$03
    ; !! ADC tbl_9FD9_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01202F 04:A01F: 79 D9 9F  ADC tbl_9FD9_pos_Y,Y
    BSR     sub_9F10             ; JSR -> BSR  ; orig: C - - - - - 0x012032 04:A022: 20 10 9F  JSR sub_9F10
    CMPI.B  #$5D,D0  ; orig: C - - - - - 0x012035 04:A025: C9 5D     CMP #$5D
    BCC     b04_bra_A032             ; BCC  ; orig: C - - - - - 0x012037 04:A027: 90 09     BCC b04_bra_A032
    CMPI.B  #$C4,D0  ; orig: C - - - - - 0x012039 04:A029: C9 C4     CMP #$C4
    BCS     b04_bra_A032             ; BCS  ; orig: C - - - - - 0x01203B 04:A02B: B0 05     BCS b04_bra_A032
    BSR     sub_9F2C             ; JSR -> BSR  ; orig: C - - - - - 0x01203D 04:A02D: 20 2C 9F  JSR sub_9F2C
    BCC     b04_bra_A034_RTS             ; BCC  ; orig: C - - - - - 0x012040 04:A030: 90 02     BCC b04_bra_A034_RTS
b04_bra_A032:  ; orig: b04_bra_A032:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012042 04:A032: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A034_RTS:  ; orig: b04_bra_A034_RTS:
ofs_032_A034_00_RTS:  ; orig: ofs_032_A034_00_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012044 04:A034: 60        RTS



ofs_032_A035_80:  ; orig: ofs_032_A035_80:

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$B0,D0  ; orig: C - - - - - 0x012047 04:A037: C9 B0     CMP #$B0
    BNE     b04_bra_A040             ; BNE  ; orig: C - - - - - 0x012049 04:A039: D0 05     BNE b04_bra_A040
    MOVE.B  #con_obj_id_59,D0  ; orig: C - - - - - 0x01204B 04:A03B: A9 59     LDA #con_obj_id_59
    BSR     sub_9F9A             ; JSR -> BSR  ; orig: C - - - - - 0x01204D 04:A03D: 20 9A 9F  JSR sub_9F9A
b04_bra_A040:  ; orig: b04_bra_A040:
loc_A040:  ; orig: loc_A040:
    MOVE.B  #$F6,D0  ; orig: C D 1 - - - 0x012050 04:A040: A9 F6     LDA #$F6
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_bat_7A2D             ; JSR -> BSR  ; orig: C - - - - - 0x012055 04:A045: 20 2D 7A  JSR sub_bat_7A2D
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A061             ; BNE  ; orig: C - - - - - 0x01205B 04:A04B: D0 14     BNE b04_bra_A061
    MOVE.B  #$0E,D2  ; orig: C - - - - - 0x01205D 04:A04D: A0 0E     LDY #$0E
    BSR     sub_bat_7C9D             ; JSR -> BSR  ; orig: C - - - - - 0x01205F 04:A04F: 20 9D 7C  JSR sub_bat_7C9D
    MOVE.B  #$10,D2  ; orig: C - - - - - 0x012062 04:A052: A0 10     LDY #$10
    BSR     sub_bat_7CDC             ; JSR -> BSR  ; orig: C - - - - - 0x012064 04:A054: 20 DC 7C  JSR sub_bat_7CDC
    MOVE.B  #$11,D2  ; orig: C - - - - - 0x012067 04:A057: A0 11     LDY #$11
    BSR     sub_bat_7CDC             ; JSR -> BSR  ; orig: C - - - - - 0x012069 04:A059: 20 DC 7C  JSR sub_bat_7CDC
    MOVE.B  #$0D,D2  ; orig: C - - - - - 0x01206C 04:A05C: A0 0D     LDY #$0D
    BSR     sub_bat_7D29             ; JSR -> BSR  ; orig: C - - - - - 0x01206E 04:A05E: 20 29 7D  JSR sub_bat_7D29
b04_bra_A061:  ; orig: b04_bra_A061:
    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - - - - 0x012071 04:A061: 20 A7 7A  JSR sub_bat_7AA7
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0


; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012077 04:A067: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012078 04:A068: 4A        LSR
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x012079 04:A069: 29 01     AND #$01
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01207B 04:A06B: 48        PHA
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x01207C 04:A06C: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x012081 04:A071: 29 08     AND #con_dir_Up
    BNE     b04_bra_A080             ; BNE  ; orig: C - - - - - 0x012083 04:A073: D0 0B     BNE b04_bra_A080
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012087 04:A077: 4A        LSR
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x012088 04:A078: 29 01     AND #$01    ; con_di
    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x01208A 04:A07A: 85 0F     STA ram_000F_t04_fla
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01208C 04:A07C: 68        PLA
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x01208D 04:A07D: 4C DF 77  JMP loc_bat_77DF
b04_bra_A080:  ; orig: b04_bra_A080:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012090 04:A080: 68        PLA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012091 04:A081: 18        CLC
    ADD.B  #$02,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012092 04:A082: 69 02     ADC #$02
    JMP     loc_bat_77DB  ; orig: C - - - - - 0x012094 04:A084: 4C DB 77  JMP loc_bat_77DB



tbl_A087:  ; orig: tbl_A087:
    ; [DIRECTIVE] .BYTE $6F  -- needs manual handling  ; orig: - D 1 - - - 0x012097 04:A087: 6F        .byte $6F   ; 00
    ; [DIRECTIVE] .BYTE $74  -- needs manual handling  ; orig: - D 1 - - - 0x012098 04:A088: 74        .byte $74   ; 01
    ; [DIRECTIVE] .BYTE $79  -- needs manual handling  ; orig: - D 1 - - - 0x012099 04:A089: 79        .byte $79   ; 02
    ; [DIRECTIVE] .BYTE $7E  -- needs manual handling  ; orig: - D 1 - - - 0x01209A 04:A08A: 7E        .byte $7E   ; 03
    ; [DIRECTIVE] .BYTE $83  -- needs manual handling  ; orig: - D 1 - - - 0x01209B 04:A08B: 83        .byte $83   ; 04
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 1 - - - 0x01209C 04:A08C: 88        .byte $88   ; 05



ofs_005_0x01209D_42:  ; orig: ofs_005_0x01209D_42:

; con_obj_id_42
ofs_005_0x01209D_43:  ; orig: ofs_005_0x01209D_43:

; con_obj_id_43
ofs_005_0x01209D_44:  ; orig: ofs_005_0x01209D_44:

; con_obj_id_44
ofs_005_0x01209D_45:  ; orig: ofs_005_0x01209D_45:

; con_obj_id_45
    MOVE.B  #con_sfx_1_10,D0  ; orig: C - - J - - 0x01209D 04:A08D: A9 10     LDA #con_sfx_1_10
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x01209F 04:A08F: 8D 01 06  STA ram_sfx_1
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x0120A2 04:A092: A2 05     LDX #$05
b04_bra_A094_loop:  ; orig: b04_bra_A094_loop:
    MOVE.B  #$7C,D0  ; orig: C - - - - - 0x0120A4 04:A094: A9 7C     LDA #$7C
    MOVEA.L #$FF0438,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120A6 04:A096: 9D 38 04  STA ram_0437_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0452,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120A9 04:A099: 9D 52 04  STA ram_0451_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF046C,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120AC 04:A09C: 9D 6C 04  STA ram_046B_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0395,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120AF 04:A09F: 9D 95 03  STA ram_0394_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120B2 04:A0A2: 95 71     STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #tbl_A087,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0445,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120B7 04:A0A7: 9D 45 04  STA ram_0444_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF045F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120BA 04:A0AA: 9D 5F 04  STA ram_045E_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0479,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120BD 04:A0AD: 9D 79 04  STA ram_0478_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF03BD,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120C0 04:A0B0: 9D BD 03  STA ram_03BC_obj + $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120C3 04:A0B3: 95 85     STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x0120C5 04:A0B5: A9 A0     LDA #$A0
    MOVEA.L #$FF0486,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120C7 04:A0B7: 9D 86 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0120CA 04:A0BA: A9 00     LDA #$00
    MOVEA.L #$FF0406,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120CC 04:A0BC: 9D 06 04  STA ram_0405_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF0494,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120CF 04:A0BF: 9D 94 04  STA ram_0492_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$FE,D0  ; orig: C - - - - - 0x0120D2 04:A0C2: A9 FE     LDA #$FE
    MOVEA.L #$FF04B3,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0120D4 04:A0C4: 9D B3 04  STA ram_04B2_enemy +
    MOVE.B  D0,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0120D7 04:A0C7: CA        DEX
    BPL     b04_bra_A094_loop             ; BPL  ; orig: C - - - - - 0x0120D8 04:A0C8: 10 CA     BPL b04_bra_A094_loop
    MOVE.B  D1,ram_0422  ; orig: C - - - - - 0x0120DA 04:A0CA: 8E 22 04  STX ram_0422
    ; (empty translation for STX)  ; orig: C - - - - - 0x0120DD 04:A0CD: 8E 30 04  STX ram_042B_enemy +
    ; (empty translation for STX)  ; orig: C - - - - - 0x0120E0 04:A0D0: 8E 83 03  STX ram_0380_enemy +
    ; (empty translation for STX)  ; orig: C - - - - - 0x0120E3 04:A0D3: 8E AC 03  STX ram_03A8_enemy +
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x0120E6 04:A0D6: A9 03     LDA #$03
    MOVE.B  D0,ram_0421  ; orig: C - - - - - 0x0120E8 04:A0D8: 8D 21 04  STA ram_0421
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120EB 04:A0DB: 8D 2E 04  STA ram_042B_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120EE 04:A0DE: 8D 82 03  STA ram_0380_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120F1 04:A0E1: 8D AA 03  STA ram_03A8_enemy +
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0120F4 04:A0E4: 0A        ASL
    MOVE.B  D0,ram_0420  ; orig: C - - - - - 0x0120F5 04:A0E5: 8D 20 04  STA ram_0420
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120F8 04:A0E8: 8D 2D 04  STA ram_042B_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120FB 04:A0EB: 8D 81 03  STA ram_0380_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x0120FE 04:A0EE: 8D A9 03  STA ram_03A8_enemy +
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012101 04:A0F1: 0A        ASL
    ; (empty translation for STA)  ; orig: C - - - - - 0x012102 04:A0F2: 8D 32 04  STA ram_042B_enemy +
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012105 04:A0F5: 0A        ASL
    ; (empty translation for STA)  ; orig: C - - - - - 0x012106 04:A0F6: 8D 86 03  STA ram_0380_enemy +
    ; !! ADC ram_042B_enemy + $06 - complex mode, manual review needed  ; orig: C - - - - - 0x012109 04:A0F9: 6D 32 04  ADC ram_042B_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x01210C 04:A0FC: 8D AE 03  STA ram_03A8_enemy +
    RTS                     ; RTS  ; orig: C - - - - - 0x01210F 04:A0FF: 60        RTS



tbl_A100:  ; orig: tbl_A100:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012110 04:A100: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x012111 04:A101: 80        .byte $80   ; 01
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x012112 04:A102: 02        .byte $02   ; 02
    ; [DIRECTIVE] .BYTE $42  -- needs manual handling  ; orig: - D 1 - - - 0x012113 04:A103: 42        .byte $42   ; 03
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012114 04:A104: 04        .byte $04   ; 04



tbl_A105:  ; orig: tbl_A105:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012115 04:A105: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012116 04:A106: 00        .byte $00   ; 01



tbl_A107:  ; orig: tbl_A107:
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - - - 0x012117 04:A107: F0        .byte $F0   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012118 04:A108: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012119 04:A109: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x01211A 04:A10A: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x01211B 04:A10B: 00        .byte $00   ; 04



ofs_005_0x01211C_3C:  ; orig: ofs_005_0x01211C_3C:

; con_obj_id_3C
    MOVE.B  #con_sfx_1_40,D0  ; orig: C - - J - - 0x01211C 04:A10C: A9 40     LDA #con_sfx_1_40
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x01211E 04:A10E: 8D 01 06  STA ram_sfx_1
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$07,D0  ; orig: C - - - - - 0x012123 04:A113: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012125 04:A115: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$04,D2  ; orig: C - - - - - 0x01212B 04:A11B: A0 04     LDY #$04
b04_bra_A11D_loop:  ; orig: b04_bra_A11D_loop:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01212D 04:A11D: A5 99     LDA ram_dir_enemy + 
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01212F 04:A11F: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #con_obj_id_3C,D0  ; orig: C - - - - - 0x012132 04:A122: A9 3C     LDA #con_obj_id_3C
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$E2,D0  ; orig: C - - - - - 0x012137 04:A127: A9 E2     LDA #$E2
    MOVEA.L #$FF04B3,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012139 04:A129: 99 B3 04  STA ram_04B2_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #tbl_A100,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #$FF0479,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01213F 04:A12F: 99 79 04  STA ram_0478_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012142 04:A132: A9 00     LDA #$00
    MOVEA.L #$FF0406,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012144 04:A134: 99 06 04  STA ram_0405_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0493,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012147 04:A137: 99 93 04  STA ram_0492_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  ram_attr_enemy,D0  ; orig: C - - - - - 0x01214A 04:A13A: AD C0 04  LDA ram_attr_enemy
    MOVEA.L #$FF04C0,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01214D 04:A13D: 99 C0 04  STA ram_attr_enemy -
    MOVE.B  D0,(A0,D2.L)  ; ^
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012150 04:A140: AD 86 04  LDA ram_hp_ememy - $
    MOVEA.L #$FF0486,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012153 04:A143: 99 86 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D2.L)  ; ^
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012156 04:A146: A5 75     LDA ram_pos_X_enemy 
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012158 04:A148: 18        CLC
    ; !! ADC tbl_A105,Y - complex mode, manual review needed  ; orig: C - - - - - 0x012159 04:A149: 79 05 A1  ADC tbl_A105,Y
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01215C 04:A14C: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01215F 04:A14F: A5 89     LDA ram_pos_Y_enemy 
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012161 04:A151: 18        CLC
    ; !! ADC tbl_A107,Y - complex mode, manual review needed  ; orig: C - - - - - 0x012162 04:A152: 79 07 A1  ADC tbl_A107,Y
    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012165 04:A155: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x012168 04:A158: A9 80     LDA #$80
    MOVEA.L #ram_0420,A0
    MOVE.B  D0,(A0,D2.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01216D 04:A15D: 88        DEY
    BPL     b04_bra_A11D_loop             ; BPL  ; orig: C - - - - - 0x01216E 04:A15E: 10 BD     BPL b04_bra_A11D_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x012170 04:A160: 60        RTS



ofs_005_0x012171_33:  ; orig: ofs_005_0x012171_33:

; con_obj_id_33
ofs_005_0x012171_34:  ; orig: ofs_005_0x012171_34:

; con_obj_id_34
    MOVE.B  #con_sfx_1_20,D0  ; orig: C - - J - - 0x012171 04:A161: A9 20     LDA #con_sfx_1_20
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x012173 04:A163: 8D 01 06  STA ram_sfx_1
    MOVE.B  #$FB,D0  ; orig: C - - - - - 0x012176 04:A166: A9 FB     LDA #$FB
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0380,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01217B 04:A16B: FE 80 03  INC ram_0380_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x01217E 04:A16E: A9 80     LDA #$80
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$70,D0  ; orig: C - - - - - 0x012182 04:A172: A9 70     LDA #$70
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_0x01FEE6  ; orig: C - - - - - 0x012186 04:A176: 4C D6 FE  JMP loc_0x01FEE6



ofs_005_0x012189_46:  ; orig: ofs_005_0x012189_46:

; con_obj_id_46
    BSR     sub_841D             ; JSR -> BSR  ; orig: C - - J - - 0x012189 04:A179: 20 1D 84  JSR sub_841D
    MOVE.B  #$E0,D0  ; orig: C - - - - - 0x01218C 04:A17C: A9 E0     LDA #$E0
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x01218E 04:A17E: 8D D1 04  STA ram_04D1
    MOVE.B  #$BF,D0  ; orig: C - - - - - 0x012191 04:A181: A9 BF     LDA #$BF
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x012196 04:A186: 60        RTS



ofs_004_0x012197_3C:  ; orig: ofs_004_0x012197_3C:

; con_obj_id_3C

; in

; X = 01+
    CMPI.B  #$05,D1  ; orig: C - - J - - 0x012197 04:A187: E0 05     CPX #$05
    BNE     b04_bra_A1CC             ; BNE  ; orig: C - - - - - 0x012199 04:A189: D0 41     BNE b04_bra_A1CC
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01219B 04:A18B: AD 83 03  LDA ram_0380_enemy +
    BEQ     b04_bra_A1AB             ; BEQ  ; orig: C - - - - - 0x01219E 04:A18E: F0 1B     BEQ b04_bra_A1AB
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x0121A0 04:A190: A0 04     LDY #$04
b04_bra_A192_loop:  ; orig: b04_bra_A192_loop:
    MOVEA.L #ram_0420,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0121A5 04:A195: 18        CLC
    ADD.B  #$80,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0121A6 04:A196: 69 80     ADC #$80
    MOVEA.L #ram_0420,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #$FF042D,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0121AB 04:A19B: B9 2D 04  LDA ram_042B_enemy +
    MOVE.B  (A0,D2.L),D0  ; ^
    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0121AE 04:A19E: 69 00     ADC #$00
    MOVEA.L #$FF042D,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0121B0 04:A1A0: 99 2D 04  STA ram_042B_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0121B3 04:A1A3: 88        DEY
    BPL     b04_bra_A192_loop             ; BPL  ; orig: C - - - - - 0x0121B4 04:A1A4: 10 EC     BPL b04_bra_A192_loop
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0121B6 04:A1A6: A9 00     LDA #$00
    ; (empty translation for STA)  ; orig: C - - - - - 0x0121B8 04:A1A8: 8D 83 03  STA ram_0380_enemy +
b04_bra_A1AB:  ; orig: b04_bra_A1AB:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0121BB 04:A1AB: AD 85 03  LDA ram_0380_enemy +
    BEQ     b04_bra_A1B3             ; BEQ  ; orig: C - - - - - 0x0121BE 04:A1AE: F0 03     BEQ b04_bra_A1B3
    BSR     sub_A285_set_direction_enemies             ; JSR -> BSR  ; orig: C - - - - - 0x0121C0 04:A1B0: 20 85 A2  JSR sub_A285_set_dir
b04_bra_A1B3:  ; orig: b04_bra_A1B3:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A1CC             ; BNE  ; orig: C - - - - - 0x0121C5 04:A1B5: D0 15     BNE b04_bra_A1CC
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0121C7 04:A1B7: A9 10     LDA #$10
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x0121CD 04:A1BD: C9 80     CMP #$80
    BCS     b04_bra_A21F             ; BCS  ; orig: C - - - - - 0x0121CF 04:A1BF: B0 5E     BCS b04_bra_A21F
    BSR     sub_B388             ; JSR -> BSR  ; orig: C - - - - - 0x0121D1 04:A1C1: 20 88 B3  JSR sub_B388
loc_A1C4:  ; orig: loc_A1C4:
    ; (empty translation for LDA)  ; orig: C D 1 - - - 0x0121D4 04:A1C4: A5 9D     LDA ram_dir_enemy + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x0121D6 04:A1C6: 8D 85 03  STA ram_0380_enemy +
    BSR     sub_A285_set_direction_enemies             ; JSR -> BSR  ; orig: C - - - - - 0x0121D9 04:A1C9: 20 85 A2  JSR sub_A285_set_dir
b04_bra_A1CC:  ; orig: b04_bra_A1CC:
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x0121DC 04:A1CC: E0 05     CPX #$05
    BNE     b04_bra_A1D5             ; BNE  ; orig: C - - - - - 0x0121DE 04:A1CE: D0 05     BNE b04_bra_A1D5
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x0121E2 04:A1D2: 8D 84 03  STA ram_0380_enemy +
b04_bra_A1D5:  ; orig: b04_bra_A1D5:
    BSR     sub_A28E             ; JSR -> BSR  ; orig: C - - - - - 0x0121E5 04:A1D5: 20 8E A2  JSR sub_A28E
    BSR     sub_A225             ; JSR -> BSR  ; orig: C - - - - - 0x0121E8 04:A1D8: 20 25 A2  JSR sub_A225
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ; !! CMP ram_0380_enemy + $04 - needs manual review  ; orig: C - - - - - 0x0121ED 04:A1DD: CD 84 03  CMP ram_0380_enemy +
    BEQ     b04_bra_A1E5             ; BEQ  ; orig: C - - - - - 0x0121F0 04:A1E0: F0 03     BEQ b04_bra_A1E5
    ; (empty translation for STA)  ; orig: C - - - - - 0x0121F2 04:A1E2: 8D 85 03  STA ram_0380_enemy +
b04_bra_A1E5:  ; orig: b04_bra_A1E5:
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$10,D0  ; orig: C - - - - - 0x0121F8 04:A1E8: 29 10     AND #$10

; / 10
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0121FA 04:A1EA: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0121FB 04:A1EB: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0121FC 04:A1EC: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0121FD 04:A1ED: 4A        LSR
    MOVE.B  D0,ram_0000_t5B  ; orig: C - - - - - 0x0121FE 04:A1EE: 85 00     STA ram_0000_t5B
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$FE,D0  ; orig: C - - - - - 0x012203 04:A1F3: 29 FE     AND #$FE
    OR.B    ram_0000_t5B,D0  ; orig: C - - - - - 0x012205 04:A1F5: 05 00     ORA ram_0000_t5B
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$05,D1  ; orig: C - - - - - 0x01220A 04:A1FA: E0 05     CPX #$05
    BEQ     b04_bra_A21C             ; BEQ  ; orig: C - - - - - 0x01220C 04:A1FC: F0 1E     BEQ b04_bra_A21C
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_0437_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_A21C             ; BEQ  ; orig: C - - - - - 0x012214 04:A204: F0 16     BEQ b04_bra_A21C
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012219 04:A209: 4A        LSR
    BCS     b04_bra_A21C             ; BCS  ; orig: C - - - - - 0x01221A 04:A20A: B0 10     BCS b04_bra_A21C
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01221C 04:A20C: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$E0,D0  ; orig: C - - - - - 0x01221E 04:A20E: C9 E0     CMP #$E0
    BCC     b04_bra_A21C             ; BCC  ; orig: C - - - - - 0x012220 04:A210: 90 0A     BCC b04_bra_A21C
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012222 04:A212: AD 56 03  LDA ram_obj_id_enemy
    BNE     b04_bra_A21C             ; BNE  ; orig: C - - - - - 0x012225 04:A215: D0 05     BNE b04_bra_A21C    ; if
    MOVE.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x012227 04:A217: A9 56     LDA #con_obj_id_56
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x012229 04:A219: 20 AF 82  JSR sub_82AF_create_
b04_bra_A21C:  ; orig: b04_bra_A21C:
    JMP     loc_A2EF  ; orig: C - - - - - 0x01222C 04:A21C: 4C EF A2  JMP loc_A2EF
b04_bra_A21F:  ; orig: b04_bra_A21F:
    BSR     sub_B31A             ; JSR -> BSR  ; orig: C - - - - - 0x01222F 04:A21F: 20 1A B3  JSR sub_B31A
    JMP     loc_A1C4  ; orig: C - - - - - 0x012232 04:A222: 4C C4 A1  JMP loc_A1C4



sub_A225:  ; orig: sub_A225:

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012237 04:A227: 48        PHA
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01223A 04:A22A: 48        PHA
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01223B 04:A22B: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01223E 04:A22E: 68        PLA
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012241 04:A231: 68        PLA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012244 04:A234: E0 05     CPX #$05
    BNE     b04_bra_A23D             ; BNE  ; orig: C - - - - - 0x012246 04:A236: D0 05     BNE b04_bra_A23D
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012248 04:A238: A9 00     LDA #$00
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A23D:  ; orig: b04_bra_A23D:
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x01224D 04:A23D: 20 00 80  JSR sub_8000
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A27C_RTS             ; BEQ  ; orig: C - - - - - 0x012253 04:A243: F0 37     BEQ b04_bra_A27C_RTS
    BSR     sub_0x01EEF4             ; JSR -> BSR  ; orig: C - - - - - 0x012255 04:A245: 20 E4 EE  JSR sub_0x01EEF4

; A = 00
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012258 04:A248: E0 05     CPX #$05
    BNE     b04_bra_A252             ; BNE  ; orig: C - - - - - 0x01225A 04:A24A: D0 06     BNE b04_bra_A252
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_A27C_RTS  ; orig: C - - - - - 0x01225F 04:A24F: 4C 7C A2  JMP loc_A27C_RTS
b04_bra_A252:  ; orig: b04_bra_A252:
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x012262 04:A252: A0 03     LDY #$03
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012264 04:A254: A9 00     LDA #$00
    MOVE.B  D0,ram_0000_t51_counter  ; orig: C - - - - - 0x012266 04:A256: 85 00     STA ram_0000_t51_cou
b04_bra_A258_loop:  ; orig: b04_bra_A258_loop:
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #con_obj_id_3C,D0  ; orig: C - - - - - 0x01226B 04:A25B: C9 3C     CMP #con_obj_id_3C
    BNE     b04_bra_A261             ; BNE  ; orig: C - - - - - 0x01226D 04:A25D: D0 02     BNE b04_bra_A261
    ADDQ.B  #1,ram_0000_t51_counter  ; orig: C - - - - - 0x01226F 04:A25F: E6 00     INC ram_0000_t51_cou
b04_bra_A261:  ; orig: b04_bra_A261:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012271 04:A261: 88        DEY
    BPL     b04_bra_A258_loop             ; BPL  ; orig: C - - - - - 0x012272 04:A262: 10 F4     BPL b04_bra_A258_loop
    SUBQ.B  #1,ram_0000_t51_counter  ; orig: C - - - - - 0x012274 04:A264: C6 00     DEC ram_0000_t51_cou
    BMI     b04_bra_A26A             ; BMI  ; orig: C - - - - - 0x012276 04:A266: 30 02     BMI b04_bra_A26A
    BNE     b04_bra_A27D             ; BNE  ; orig: C - - - - - 0x012278 04:A268: D0 13     BNE b04_bra_A27D
b04_bra_A26A:  ; orig: b04_bra_A26A:
    BSR     b04_sub_B010             ; JSR -> BSR  ; orig: C - - - - - 0x01227A 04:A26A: 20 10 B0  JSR b04_sub_B010
    MOVE.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x01227D 04:A26D: A9 5D     LDA #con_obj_id_5D
    ; (empty translation for STA)  ; orig: C - - - - - 0x01227F 04:A26F: 8D 54 03  STA ram_obj_id_enemy
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x012282 04:A272: A9 10     LDA #$10
    ; (empty translation for STA)  ; orig: C - - - - - 0x012284 04:A274: 8D 0A 04  STA ram_0405_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x012287 04:A277: 85 2D     STA ram_timer_enemy 
loc_A279:  ; orig: loc_A279:
    ; (empty translation for INC)  ; orig: C D 1 - - - 0x012289 04:A279: EE 83 03  INC ram_0380_enemy +
b04_bra_A27C_RTS:  ; orig: b04_bra_A27C_RTS:
loc_A27C_RTS:  ; orig: loc_A27C_RTS:
    RTS                     ; RTS  ; orig: C D 1 - - - 0x01228C 04:A27C: 60        RTS
b04_bra_A27D:  ; orig: b04_bra_A27D:
    MOVE.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x01228D 04:A27D: A9 5D     LDA #con_obj_id_5D
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01228F 04:A27F: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    JMP     loc_A279  ; orig: C - - - - - 0x012292 04:A282: 4C 79 A2  JMP loc_A279



sub_A285_set_direction_enemies:  ; orig: sub_A285_set_direction_enemies:
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x012295 04:A285: A0 04     LDY #$04
b04_bra_A287_loop:  ; orig: b04_bra_A287_loop:
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012297 04:A287: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01229A 04:A28A: 88        DEY
    BPL     b04_bra_A287_loop             ; BPL  ; orig: C - - - - - 0x01229B 04:A28B: 10 FA     BPL b04_bra_A287_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01229D 04:A28D: 60        RTS



sub_A28E:  ; orig: sub_A28E:

; in

; X = 01+
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$E0,D0  ; orig: C - - - - - 0x0122A1 04:A291: 29 E0     AND #$E0
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0122A3 04:A293: 18        CLC
    ; !! ADC ram_0412,X - complex mode, manual review needed  ; orig: C - - - - - 0x0122A4 04:A294: 7D 12 04  ADC ram_0412,X
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0122AD 04:A29D: 69 00     ADC #$00
    MOVE.B  D0,ram_0003_t11  ; orig: C - - - - - 0x0122AF 04:A29F: 85 03     STA ram_0003_t11
    MOVE.B  #$A1,D0  ; orig: C - - - - - 0x0122B1 04:A2A1: A9 A1     LDA #$A1
    MOVE.B  D0,ram_0002_t30  ; orig: C - - - - - 0x0122B3 04:A2A3: 85 02     STA ram_0002_t30
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BTST    D0,ram_0002_t30  ; BIT abs  ; orig: C - - - - - 0x0122B7 04:A2A7: 24 02     BIT ram_0002_t30
    BEQ     b04_bra_A2B2             ; BEQ  ; orig: C - - - - - 0x0122B9 04:A2A9: F0 07     BEQ b04_bra_A2B2
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0122BD 04:A2AD: 18        CLC
    MOVE.B  ram_0003_t11,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x0122BE 04:A2AE: 65 03     ADC ram_0003_t11

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A2B2:  ; orig: b04_bra_A2B2:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t30).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t30).l  ; orig: C - - - - - 0x0122C4 04:A2B4: 06 02     ASL ram_0002_t30    

    BTST    D0,ram_0002_t30  ; BIT abs  ; orig: C - - - - - 0x0122C6 04:A2B6: 24 02     BIT ram_0002_t30
    BEQ     b04_bra_A2C0             ; BEQ  ; orig: C - - - - - 0x0122C8 04:A2B8: F0 06     BEQ b04_bra_A2C0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t11,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x0122CC 04:A2BC: E5 03     SBC ram_0003_t11

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A2C0:  ; orig: b04_bra_A2C0:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t30).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t30).l  ; orig: C - - - - - 0x0122D2 04:A2C2: 06 02     ASL ram_0002_t30    

    BTST    D0,ram_0002_t30  ; BIT abs  ; orig: C - - - - - 0x0122D4 04:A2C4: 24 02     BIT ram_0002_t30
    BEQ     b04_bra_A2CE             ; BEQ  ; orig: C - - - - - 0x0122D6 04:A2C6: F0 06     BEQ b04_bra_A2CE
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t11,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x0122DA 04:A2CA: 65 03     ADC ram_0003_t11

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A2CE:  ; orig: b04_bra_A2CE:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t30).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t30).l  ; orig: C - - - - - 0x0122E0 04:A2D0: 06 02     ASL ram_0002_t30    

    BTST    D0,ram_0002_t30  ; BIT abs  ; orig: C - - - - - 0x0122E2 04:A2D2: 24 02     BIT ram_0002_t30
    BEQ     b04_bra_A2DC             ; BEQ  ; orig: C - - - - - 0x0122E4 04:A2D4: F0 06     BEQ b04_bra_A2DC
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t11,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x0122E8 04:A2D8: E5 03     SBC ram_0003_t11

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A2DC:  ; orig: b04_bra_A2DC:
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0122EC 04:A2DC: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x0122EE 04:A2DE: 29 03     AND #$03
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0122F0 04:A2E0: 18        CLC
    MOVE.B  ram_0003_t11,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x0122F1 04:A2E1: 65 03     ADC ram_0003_t11

    ; !! ADC ram_0451_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x0122F3 04:A2E3: 7D 51 04  ADC ram_0451_enemy,X
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_B2CD             ; JSR -> BSR  ; orig: C - - - - - 0x0122F9 04:A2E9: 20 CD B2  JSR sub_B2CD
    JMP     loc_0x01FAA3  ; orig: C - - - - - 0x0122FC 04:A2EC: 4C 93 FA  JMP loc_0x01FAA3



loc_A2EF:  ; orig: loc_A2EF:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C D 1 - - - 0x0122FF 04:A2EF: 20 93 FA  JSR sub_0x01FAA3
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012305 04:A2F5: 48        PHA
    ANDI.B  #$80,D0  ; orig: C - - - - - 0x012306 04:A2F6: 29 80     AND #$80
    ORI.B   #$01,D0  ; orig: C - - - - - 0x012308 04:A2F8: 09 01     ORA #$01
    BSR     sub_bat_7988_set_spr_A             ; JSR -> BSR  ; orig: C - - - - - 0x01230A 04:A2FA: 20 88 79  JSR sub_bat_7988_set
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01230D 04:A2FD: 68        PLA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01230E 04:A2FE: 48        PHA
    ANDI.B  #$40,D0  ; orig: C - - - - - 0x01230F 04:A2FF: 29 40     AND #$40
    BEQ     b04_bra_A305             ; BEQ  ; orig: C - - - - - 0x012311 04:A301: F0 02     BEQ b04_bra_A305
    ADDQ.B  #1,ram_000F_t04_flag  ; orig: C - - - - - 0x012313 04:A303: E6 0F     INC ram_000F_t04_fla
b04_bra_A305:  ; orig: b04_bra_A305:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012315 04:A305: 68        PLA
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x012316 04:A306: 29 0F     AND #$0F
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x012318 04:A308: C9 02     CMP #$02
    BEQ     b04_bra_A313             ; BEQ  ; orig: C - - - - - 0x01231A 04:A30A: F0 07     BEQ b04_bra_A313
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01231C 04:A30C: C9 03     CMP #$03
    BEQ     b04_bra_A313             ; BEQ  ; orig: C - - - - - 0x01231E 04:A30E: F0 03     BEQ b04_bra_A313
    JMP     loc_bat_77DB  ; orig: C - - - - - 0x012320 04:A310: 4C DB 77  JMP loc_bat_77DB
b04_bra_A313:  ; orig: b04_bra_A313:
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x012323 04:A313: 4C DF 77  JMP loc_bat_77DF



ofs_004_0x012326_33:  ; orig: ofs_004_0x012326_33:

; con_obj_id_33
ofs_004_0x012326_34:  ; orig: ofs_004_0x012326_34:

; con_obj_id_34

; in

; X = 01+
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A331             ; BNE  ; orig: C - - - - - 0x012329 04:A319: D0 16     BNE b04_bra_A331
    MOVE.B  #con_dir_Right,D0  ; orig: C - - - - - 0x01232B 04:A31B: A9 01     LDA #con_dir_Right
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$B0,D2  ; orig: C - - - - - 0x01232F 04:A31F: C0 B0     CPY #$B0
    BCS     b04_bra_A329             ; BCS  ; orig: C - - - - - 0x012331 04:A321: B0 06     BCS b04_bra_A329
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012333 04:A323: 0A        ASL
    CMPI.B  #$60,D2  ; orig: C - - - - - 0x012334 04:A324: C0 60     CPY #$60
    BCS     b04_bra_A329             ; BCS  ; orig: C - - - - - 0x012336 04:A326: B0 01     BCS b04_bra_A329
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012338 04:A328: 0A        ASL ; con_dir_Left
b04_bra_A329:  ; orig: b04_bra_A329:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FF0451,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01233B 04:A32B: FE 51 04  INC ram_0451_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_A380  ; orig: C - - - - - 0x01233E 04:A32E: 4C 80 A3  JMP loc_A380
b04_bra_A331:  ; orig: b04_bra_A331:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012344 04:A334: 18        CLC
    ADD.B  #$80,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012345 04:A335: 69 80     ADC #$80
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    BCC     b04_bra_A380             ; BCC  ; orig: C - - - - - 0x01234A 04:A33A: 90 44     BCC b04_bra_A380
    MOVEA.L #$FF0412,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01234C 04:A33C: FE 12 04  INC ram_0412,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x01234F 04:A33F: A9 01     LDA #$01    ; con_di
    MOVE.B  D0,ram_0002_t31  ; orig: C - - - - - 0x012351 04:A341: 85 02     STA ram_0002_t31
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BTST    D0,ram_0002_t31  ; BIT abs  ; orig: C - - - - - 0x012355 04:A345: 24 02     BIT ram_0002_t31
    BEQ     b04_bra_A34B             ; BEQ  ; orig: C - - - - - 0x012357 04:A347: F0 02     BEQ b04_bra_A34B
    MOVEA.L #$FF0070,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012359 04:A349: F6 70     INC ram_pos_X_enemy,
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A34B:  ; orig: b04_bra_A34B:
    MOVE.B  (ram_0002_t31).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t31).l  ; orig: C - - - - - 0x01235B 04:A34B: 06 02     ASL ram_0002_t31    

    BTST    D0,ram_0002_t31  ; BIT abs  ; orig: C - - - - - 0x01235D 04:A34D: 24 02     BIT ram_0002_t31
    BEQ     b04_bra_A353             ; BEQ  ; orig: C - - - - - 0x01235F 04:A34F: F0 02     BEQ b04_bra_A353
    MOVEA.L #$FF0070,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x012361 04:A351: D6 70     DEC ram_pos_X_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A353:  ; orig: b04_bra_A353:
    MOVE.B  (ram_0002_t31).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t31).l  ; orig: C - - - - - 0x012363 04:A353: 06 02     ASL ram_0002_t31    

    BTST    D0,ram_0002_t31  ; BIT abs  ; orig: C - - - - - 0x012365 04:A355: 24 02     BIT ram_0002_t31
    BEQ     b04_bra_A35B             ; BEQ  ; orig: C - - - - - 0x012367 04:A357: F0 02     BEQ b04_bra_A35B
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012369 04:A359: F6 84     INC ram_pos_Y_enemy,
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A35B:  ; orig: b04_bra_A35B:
    MOVE.B  (ram_0002_t31).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t31).l  ; orig: C - - - - - 0x01236B 04:A35B: 06 02     ASL ram_0002_t31    

    BTST    D0,ram_0002_t31  ; BIT abs  ; orig: C - - - - - 0x01236D 04:A35D: 24 02     BIT ram_0002_t31
    BEQ     b04_bra_A363             ; BEQ  ; orig: C - - - - - 0x01236F 04:A35F: F0 02     BEQ b04_bra_A363
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for DEC)  ; orig: - - - - - - 0x012371 04:A361: D6 84     DEC ram_pos_Y_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A363:  ; orig: b04_bra_A363:
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$20,D0  ; orig: C - - - - - 0x012376 04:A366: C9 20     CMP #$20
    BNE     b04_bra_A380             ; BNE  ; orig: C - - - - - 0x012378 04:A368: D0 16     BNE b04_bra_A380
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01237A 04:A36A: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_B2E2             ; JSR -> BSR  ; orig: C - - - - - 0x01237F 04:A36F: 20 E2 B2  JSR sub_B2E2
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF045E,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012385 04:A375: FE 5E 04  INC ram_045E_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012388 04:A378: 4A        LSR
    BCC     b04_bra_A380             ; BCC  ; orig: C - - - - - 0x012389 04:A379: 90 05     BCC b04_bra_A380
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01238B 04:A37B: A9 00     LDA #$00
    MOVEA.L #ram_0451_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A380:  ; orig: b04_bra_A380:
loc_A380:  ; orig: loc_A380:
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A391             ; BNE  ; orig: C - - - - - 0x012393 04:A383: D0 0C     BNE b04_bra_A391
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x012395 04:A385: A9 80     LDA #$80
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x01239A 04:A38A: A9 C0     LDA #$C0
    ; !! ORA ram_indiv_random,X - needs manual review  ; orig: C - - - - - 0x01239C 04:A38C: 15 18     ORA ram_indiv_random
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A391:  ; orig: b04_bra_A391:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x0123A1 04:A391: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0123A3 04:A393: 4A        LSR
    BCC     b04_bra_A399             ; BCC  ; orig: C - - - - - 0x0123A4 04:A394: 90 03     BCC b04_bra_A399
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0123A6 04:A396: DE 2C 04  DEC ram_042B_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A399:  ; orig: b04_bra_A399:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A3C8             ; BEQ  ; orig: C - - - - - 0x0123AC 04:A39C: F0 2A     BEQ b04_bra_A3C8
    MOVEA.L #$FF0444,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0123AE 04:A39E: DE 44 04  DEC ram_0444_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x0123B1 04:A3A1: A0 02     LDY #$02
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x0123B3 04:A3A3: C9 70     CMP #$70
    BCS     b04_bra_A3AC             ; BCS  ; orig: C - - - - - 0x0123B5 04:A3A5: B0 05     BCS b04_bra_A3AC
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x0123B7 04:A3A7: C9 10     CMP #$10
    BCC     b04_bra_A3AC             ; BCC  ; orig: C - - - - - 0x0123B9 04:A3A9: 90 01     BCC b04_bra_A3AC
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0123BB 04:A3AB: C8        INY
b04_bra_A3AC:  ; orig: b04_bra_A3AC:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0123BC 04:A3AC: 98        TYA
loc_A3AD:  ; orig: loc_A3AD:
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A3B0:  ; orig: b04_bra_A3B0:
    MOVEA.L #$FF0380,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0123C0 04:A3B0: DE 80 03  DEC ram_0380_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_A3BF             ; BNE  ; orig: C - - - - - 0x0123C3 04:A3B3: D0 0A     BNE b04_bra_A3BF
    MOVE.B  #$41,D0  ; orig: C - - - - - 0x0123C5 04:A3B5: A9 41     LDA #$41
    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x0123CA 04:A3BA: A9 56     LDA #con_obj_id_56
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0123CC 04:A3BC: 20 AF 82  JSR sub_82AF_create_
b04_bra_A3BF:  ; orig: b04_bra_A3BF:
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_A3E3             ; JSR -> BSR  ; orig: C - - - - - 0x0123D2 04:A3C2: 20 E3 A3  JSR sub_A3E3
    JMP     loc_A422  ; orig: C - - - - - 0x0123D5 04:A3C5: 4C 22 A4  JMP loc_A422
b04_bra_A3C8:  ; orig: b04_bra_A3C8:
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0123D8 04:A3C8: FE 78 04  INC ram_0478_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$08,D0  ; orig: C - - - - - 0x0123DE 04:A3CE: C9 08     CMP #$08
    BNE     b04_bra_A3B0             ; BNE  ; orig: C - - - - - 0x0123E0 04:A3D0: D0 DE     BNE b04_bra_A3B0
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0123E2 04:A3D2: A9 00     LDA #$00
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$01,D0  ; orig: C - - - - - 0x0123EA 04:A3DA: 29 01     AND #$01
    EORI.B  #$01,D0  ; orig: C - - - - - 0x0123EC 04:A3DC: 49 01     EOR #$01
    JMP     loc_A3AD  ; orig: C - - - - - 0x0123EE 04:A3DE: 4C AD A3  JMP loc_A3AD



tbl_A3E1_pos_X:  ; orig: tbl_A3E1_pos_X:
    ; [DIRECTIVE] .BYTE $F0  -- needs manual handling  ; orig: - D 1 - - - 0x0123F1 04:A3E1: F0        .byte $F0   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x0123F2 04:A3E2: 10        .byte $10   ; 01



sub_A3E3:  ; orig: sub_A3E3:
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0123F3 04:A3E3: 48        PHA
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x0123F4 04:A3E4: 20 93 FA  JSR sub_0x01FAA3
    BSR     sub_A419             ; JSR -> BSR  ; orig: C - - - - - 0x0123F7 04:A3E7: 20 19 A4  JSR sub_A419
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0123FA 04:A3EA: 68        PLA
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x0123FB 04:A3EB: 20 DB 77  JSR sub_bat_77DB
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0123FE 04:A3EE: A9 10     LDA #$10
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x012400 04:A3F0: 20 89 FA  JSR sub_0x01FA99
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x012403 04:A3F3: A0 01     LDY #$01
    BSR     sub_A3FA             ; JSR -> BSR  ; orig: C - - - - - 0x012405 04:A3F5: 20 FA A3  JSR sub_A3FA
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012408 04:A3F8: A0 00     LDY #$00
sub_A3FA:  ; orig: sub_A3FA:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01240C 04:A3FC: 18        CLC
    ; !! ADC tbl_A3E1_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x01240D 04:A3FD: 79 E1 A3  ADC tbl_A3E1_pos_X,Y
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012410 04:A400: 85 00     STA ram_0000_t21_spr
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012414 04:A404: 85 01     STA ram_0001_t15_spr
    BSR     sub_A419             ; JSR -> BSR  ; orig: C - - - - - 0x012416 04:A406: 20 19 A4  JSR sub_A419
    BSR     sub_0x01FA82             ; JSR -> BSR  ; orig: C - - - - - 0x012419 04:A409: 20 72 FA  JSR sub_0x01FA82
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x01241C 04:A40C: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01241D 04:A40D: 18        CLC
    ; !! ADC ram_obj_anim_id,X - complex mode, manual review needed  ; orig: C - - - - - 0x01241E 04:A40E: 7D E4 03  ADC ram_obj_anim_id,
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x012421 04:A411: 29 01     AND #$01
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012423 04:A413: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012424 04:A414: 69 04     ADC #$04
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x012426 04:A416: 4C DF 77  JMP loc_bat_77DF



sub_A419:  ; orig: sub_A419:
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012429 04:A419: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01242C 04:A41C: 38        SEC
    SUB.B  #$32,D0       ; SBC imm  ; orig: C - - - - - 0x01242D 04:A41D: E9 32     SBC #$32
    JMP     loc_bat_7988_set_spr_A  ; orig: C - - - - - 0x01242F 04:A41F: 4C 88 79  JMP loc_bat_7988_set



loc_A422:  ; orig: loc_A422:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012434 04:A424: 48        PHA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012435 04:A425: 38        SEC
    SUB.B  #$10,D0       ; SBC imm  ; orig: C - - - - - 0x012436 04:A426: E9 10     SBC #$10
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$05,D0  ; orig: C - - - - - 0x01243A 04:A42A: A9 05     LDA #$05
    MOVE.B  D0,ram_000F_t05  ; orig: C - - - - - 0x01243C 04:A42C: 85 0F     STA ram_000F_t05
b04_bra_A42E_loop:  ; orig: b04_bra_A42E_loop:
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x01243E 04:A42E: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012443 04:A433: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012444 04:A434: 69 08     ADC #$08
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    SUBQ.B  #1,ram_000F_t05  ; orig: C - - - - - 0x012448 04:A438: C6 0F     DEC ram_000F_t05
    BNE     b04_bra_A42E_loop             ; BNE  ; orig: C - - - - - 0x01244A 04:A43A: D0 F2     BNE b04_bra_A42E_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01244C 04:A43C: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01244F 04:A43F: 60        RTS



loc_0x012450:  ; orig: loc_0x012450:
    CMPI.B  #$12,D2  ; orig: C D 1 - - - 0x012450 04:A440: C0 12     CPY #$12
    BNE     b04_bra_A44E             ; BNE  ; orig: C - - - - - 0x012452 04:A442: D0 0A     BNE b04_bra_A44E
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x012454 04:A444: A9 28     LDA #$28
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$04,D0  ; orig: C - - - - - 0x012459 04:A449: A9 04     LDA #$04
    MOVEA.L #ram_anim_timer_obj,A0
    MOVE.B  D0,(A0,D2.L)

b04_bra_A44E:  ; orig: b04_bra_A44E:
    MOVE.B  ram_000F_t05,D0  ; orig: C - - - - - 0x01245E 04:A44E: A5 0F     LDA ram_000F_t05
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x012460 04:A450: C9 03     CMP #$03
    BEQ     b04_bra_A458             ; BEQ  ; orig: C - - - - - 0x012462 04:A452: F0 04     BEQ b04_bra_A458
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x012464 04:A454: C9 04     CMP #$04
    BNE     b04_bra_A471             ; BNE  ; orig: C - - - - - 0x012466 04:A456: D0 19     BNE b04_bra_A471
b04_bra_A458:  ; orig: b04_bra_A458:
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$03,D0  ; orig: C - - - - - 0x01246B 04:A45B: C9 03     CMP #$03
    BNE     b04_bra_A471             ; BNE  ; orig: C - - - - - 0x01246D 04:A45D: D0 12     BNE b04_bra_A471
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #con_dir_Up,D0  ; orig: C - - - - - 0x012472 04:A462: C9 08     CMP #con_dir_Up
    BNE     b04_bra_A471             ; BNE  ; orig: C - - - - - 0x012474 04:A464: D0 0B     BNE b04_bra_A471
    MOVE.B  #con_sfx_1_02,D0  ; orig: C - - - - - 0x012476 04:A466: A9 02     LDA #con_sfx_1_02
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x012478 04:A468: 8D 01 06  STA ram_sfx_1
    BSR     sub_bat_7C54             ; JSR -> BSR  ; orig: C - - - - - 0x01247B 04:A46B: 20 54 7C  JSR sub_bat_7C54
    BSR     sub_800D             ; JSR -> BSR  ; orig: C - - - - - 0x01247E 04:A46E: 20 0D 80  JSR sub_800D
b04_bra_A471:  ; orig: b04_bra_A471:
    MOVE.B  #con_sfx_4_shield_block,D0  ; orig: C - - - - - 0x012481 04:A471: A9 01     LDA #con_sfx_4_shiel
    MOVE.B  D0,ram_sfx_4  ; orig: C - - - - - 0x012483 04:A473: 8D 04 06  STA ram_sfx_4
    RTS                     ; RTS  ; orig: C - - - - - 0x012486 04:A476: 60        RTS



ofs_004_0x012487_46:  ; orig: ofs_004_0x012487_46:

; con_obj_id_46

; in

; X = 01+
    BSR     sub_A4AC             ; JSR -> BSR  ; orig: C - - J - - 0x012487 04:A477: 20 AC A4  JSR sub_A4AC
    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x01248A 04:A47A: 20 88 B2  JSR sub_B288
    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$01,D0  ; orig: C - - - - - 0x012490 04:A480: 29 01     AND #$01
    BNE     b04_bra_A494             ; BNE  ; orig: C - - - - - 0x012492 04:A482: D0 10     BNE b04_bra_A494
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012494 04:A484: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x012496 04:A486: C9 20     CMP #$20
    BCS     b04_bra_A494             ; BCS  ; orig: C - - - - - 0x012498 04:A488: B0 0A     BCS b04_bra_A494
    ; (empty translation for LDA)  ; orig: C - - - - - 0x01249A 04:A48A: AD 5A 03  LDA ram_obj_id_enemy
    BNE     b04_bra_A494             ; BNE  ; orig: C - - - - - 0x01249D 04:A48D: D0 05     BNE b04_bra_A494    ; if
    MOVE.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x01249F 04:A48F: A9 56     LDA #con_obj_id_56
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0124A1 04:A491: 20 AF 82  JSR sub_82AF_create_
b04_bra_A494:  ; orig: b04_bra_A494:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0124A4 04:A494: A9 01     LDA #$01
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x0124A6 04:A496: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x0124AC 04:A49C: 20 DB 77  JSR sub_bat_77DB
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0124AF 04:A49F: 20 D0 79  JSR sub_bat_79D0
    BSR     sub_0x01FEEA             ; JSR -> BSR  ; orig: C - - - - - 0x0124B2 04:A4A2: 20 DA FE  JSR sub_0x01FEEA
    BSR     sub_0x01EEF6             ; JSR -> BSR  ; orig: C - - - - - 0x0124B5 04:A4A5: 20 E6 EE  JSR sub_0x01EEF6
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x0124BB 04:A4AB: 60        RTS



sub_A4AC:  ; orig: sub_A4AC:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0124BF 04:A4AF: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - D 1 - I - 0x0124C2 04:A4B2: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_A4BA_01  -- needs manual handling  ; orig: - D 1 - I - 0x0124C4 04:A4B4: BA A4     .word ofs_030_A4BA_0
    ; [DIRECTIVE] .WORD ofs_030_B308_02  -- needs manual handling  ; orig: - D 1 - I - 0x0124C6 04:A4B6: 08 B3     .word ofs_030_B308_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - D 1 - I - 0x0124C8 04:A4B8: 78 B3     .word ofs_030_B378_0



ofs_030_A4BA_01:  ; orig: ofs_030_A4BA_01:
    MOVE.B  #$02,D2  ; orig: C - - J - - 0x0124CA 04:A4BA: A0 02     LDY #$02
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0124CC 04:A4BC: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$D0,D0  ; orig: C - - - - - 0x0124CE 04:A4BE: C9 D0     CMP #$D0
    BCC     b04_bra_A4C3             ; BCC  ; orig: C - - - - - 0x0124D0 04:A4C0: 90 01     BCC b04_bra_A4C3
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0124D2 04:A4C2: C8        INY
b04_bra_A4C3:  ; orig: b04_bra_A4C3:
    JMP     loc_84C1  ; orig: C - - - - - 0x0124D3 04:A4C3: 4C C1 84  JMP loc_84C1



tbl_A4C6_pos_X_lo:  ; orig: tbl_A4C6_pos_X_lo:
    ; [DIRECTIVE] .BYTE < (ram_0437_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124D6 04:A4C6: 38        .byte < (ram_0437_en
    ; [DIRECTIVE] .BYTE < (ram_0451_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124D7 04:A4C7: 52        .byte < (ram_0451_en
    ; [DIRECTIVE] .BYTE < (ram_046B_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124D8 04:A4C8: 6C        .byte < (ram_046B_en
    ; [DIRECTIVE] .BYTE < (ram_0394_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124D9 04:A4C9: 95        .byte < (ram_0394_en



tbl_A4CA_pos_X_hi:  ; orig: tbl_A4CA_pos_X_hi:
    ; [DIRECTIVE] .BYTE > (ram_0437_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DA 04:A4CA: 04        .byte > (ram_0437_en
    ; [DIRECTIVE] .BYTE > (ram_0451_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DB 04:A4CB: 04        .byte > (ram_0451_en
    ; [DIRECTIVE] .BYTE > (ram_046B_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DC 04:A4CC: 04        .byte > (ram_046B_en
    ; [DIRECTIVE] .BYTE > (ram_0394_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DD 04:A4CD: 03        .byte > (ram_0394_en



tbl_A4CE_pos_Y_lo:  ; orig: tbl_A4CE_pos_Y_lo:
    ; [DIRECTIVE] .BYTE < (ram_0444_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DE 04:A4CE: 45        .byte < (ram_0444_en
    ; [DIRECTIVE] .BYTE < (ram_045E_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124DF 04:A4CF: 5F        .byte < (ram_045E_en
    ; [DIRECTIVE] .BYTE < (ram_0478_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E0 04:A4D0: 79        .byte < (ram_0478_en
    ; [DIRECTIVE] .BYTE < (ram_03BC_obj + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E1 04:A4D1: BD        .byte < (ram_03BC_ob



tbl_A4D2_pos_Y_hi:  ; orig: tbl_A4D2_pos_Y_hi:
    ; [DIRECTIVE] .BYTE > (ram_0444_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E2 04:A4D2: 04        .byte > (ram_0444_en
    ; [DIRECTIVE] .BYTE > (ram_045E_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E3 04:A4D3: 04        .byte > (ram_045E_en
    ; [DIRECTIVE] .BYTE > (ram_0478_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E4 04:A4D4: 04        .byte > (ram_0478_en
    ; [DIRECTIVE] .BYTE > (ram_03BC_obj + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E5 04:A4D5: 03        .byte > (ram_03BC_ob



tbl_A4D6_lo:  ; orig: tbl_A4D6_lo:
    ; [DIRECTIVE] .BYTE < (ram_0420)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E6 04:A4D6: 20        .byte < (ram_0420)  
    ; [DIRECTIVE] .BYTE < (ram_042B_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E7 04:A4D7: 2D        .byte < (ram_042B_en
    ; [DIRECTIVE] .BYTE < (ram_0380_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E8 04:A4D8: 81        .byte < (ram_0380_en
    ; [DIRECTIVE] .BYTE < (ram_03A8_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124E9 04:A4D9: A9        .byte < (ram_03A8_en



tbl_A4DA_hi:  ; orig: tbl_A4DA_hi:
    ; [DIRECTIVE] .BYTE > (ram_0420)  -- needs manual handling  ; orig: - D 1 - - - 0x0124EA 04:A4DA: 04        .byte > (ram_0420)  
    ; [DIRECTIVE] .BYTE > (ram_042B_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124EB 04:A4DB: 04        .byte > (ram_042B_en
    ; [DIRECTIVE] .BYTE > (ram_0380_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124EC 04:A4DC: 03        .byte > (ram_0380_en
    ; [DIRECTIVE] .BYTE > (ram_03A8_enemy + $01)  -- needs manual handling  ; orig: - D 1 - - - 0x0124ED 04:A4DD: 03        .byte > (ram_03A8_en



ofs_004_0x0124EE_42:  ; orig: ofs_004_0x0124EE_42:

; con_obj_id_42
ofs_004_0x0124EE_43:  ; orig: ofs_004_0x0124EE_43:

; con_obj_id_43
ofs_004_0x0124EE_44:  ; orig: ofs_004_0x0124EE_44:

; con_obj_id_44
ofs_004_0x0124EE_45:  ; orig: ofs_004_0x0124EE_45:

; con_obj_id_45

; in

; X = 01+
    BSR     sub_A825             ; JSR -> BSR  ; orig: C - - J - - 0x0124EE 04:A4DE: 20 25 A8  JSR sub_A825
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x0124F1 04:A4E1: AD 50 03  LDA ram_obj_id_enemy
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0124F4 04:A4E4: 38        SEC
    SUB.B  #$42,D0       ; SBC imm  ; orig: C - - - - - 0x0124F5 04:A4E5: E9 42     SBC #$42
    MOVE.B  D0,ram_04D7  ; orig: C - - - - - 0x0124F7 04:A4E7: 8D D7 04  STA ram_04D7
b04_bra_A4EA_loop:  ; orig: b04_bra_A4EA_loop:
    MOVE.B  ram_04D7,D2  ; orig: C - - - - - 0x0124FA 04:A4EA: AC D7 04  LDY ram_04D7
    MOVEA.L #tbl_0x01E6CE_8_bits,A0
    MOVE.B  (A0,D2.L),D0

    BTST    D0,ram_0511_bits  ; BIT abs  ; orig: C - - - - - 0x012500 04:A4F0: 2C 11 05  BIT ram_0511_bits
    BEQ     b04_bra_A4F8             ; BEQ  ; orig: C - - - - - 0x012503 04:A4F3: F0 03     BEQ b04_bra_A4F8
    JMP     loc_A547  ; orig: C - - - - - 0x012505 04:A4F5: 4C 47 A5  JMP loc_A547
b04_bra_A4F8:  ; orig: b04_bra_A4F8:
    BSR     sub_A54D_prepare_tables             ; JSR -> BSR  ; orig: C - - - - - 0x012508 04:A4F8: 20 4D A5  JSR sub_A54D_prepare
b04_bra_A4FB_loop:  ; orig: b04_bra_A4FB_loop:
    MOVEA.L #ram_0000_t14_pos_X_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01250D 04:A4FD: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_0002_t02_pos_Y_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012512 04:A502: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_0004_t01_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVEA.L #ram_0413,A0
    MOVE.B  D0,(A0,D2.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01251A 04:A50A: 88        DEY
    BPL     b04_bra_A4FB_loop             ; BPL  ; orig: C - - - - - 0x01251B 04:A50B: 10 EE     BPL b04_bra_A4FB_loop
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x01251D 04:A50D: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01251F 04:A50F: 29 03     AND #$03
    MOVE.B  D0,ram_0000_t52  ; orig: C - - - - - 0x012521 04:A511: 85 00     STA ram_0000_t52
    CMP.B   ram_0000_t52,D1  ; orig: C - - - - - 0x012523 04:A513: E4 00     CPX ram_0000_t52
    BNE     b04_bra_A52F             ; BNE  ; orig: C - - - - - 0x012525 04:A515: D0 18     BNE b04_bra_A52F
    BSR     sub_A576             ; JSR -> BSR  ; orig: C - - - - - 0x012527 04:A517: 20 76 A5  JSR sub_A576
    BSR     sub_A7A4             ; JSR -> BSR  ; orig: C - - - - - 0x01252A 04:A51A: 20 A4 A7  JSR sub_A7A4
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x01252D 04:A51D: A2 05     LDX #$05
    MOVEA.L #$FF0018,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01252F 04:A51F: B5 18     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$20,D0  ; orig: C - - - - - 0x012531 04:A521: C9 20     CMP #$20
    BCS     b04_bra_A52F             ; BCS  ; orig: C - - - - - 0x012533 04:A523: B0 0A     BCS b04_bra_A52F
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012535 04:A525: AD 5A 03  LDA ram_obj_id_enemy
    BNE     b04_bra_A52F             ; BNE  ; orig: C - - - - - 0x012538 04:A528: D0 05     BNE b04_bra_A52F    ; if
    MOVE.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x01253A 04:A52A: A9 56     LDA #con_obj_id_56
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x01253C 04:A52C: 20 AF 82  JSR sub_82AF_create_
b04_bra_A52F:  ; orig: b04_bra_A52F:
    BSR     sub_A6E5             ; JSR -> BSR  ; orig: C - - - - - 0x01253F 04:A52F: 20 E5 A6  JSR sub_A6E5
    BSR     sub_A54D_prepare_tables             ; JSR -> BSR  ; orig: C - - - - - 0x012542 04:A532: 20 4D A5  JSR sub_A54D_prepare
b04_bra_A535_loop:  ; orig: b04_bra_A535_loop:
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012545 04:A535: B9 71 00  LDA ram_pos_X_enemy
    MOVE.B  (A0,D2.L),D0  ; ^
    MOVEA.L #ram_0000_t14_pos_X_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  D0,(A0,D2.W)

    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01254A 04:A53A: B9 85 00  LDA ram_pos_Y_enemy
    MOVE.B  (A0,D2.L),D0  ; ^
    MOVEA.L #ram_0002_t02_pos_Y_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  D0,(A0,D2.W)

    MOVEA.L #ram_0413,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_0004_t01_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  D0,(A0,D2.W)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012554 04:A544: 88        DEY
    BPL     b04_bra_A535_loop             ; BPL  ; orig: C - - - - - 0x012555 04:A545: 10 EE     BPL b04_bra_A535_loop
loc_A547:  ; orig: loc_A547:
    SUBQ.B  #1,ram_04D7  ; orig: C D 1 - - - 0x012557 04:A547: CE D7 04  DEC ram_04D7
    BPL     b04_bra_A4EA_loop             ; BPL  ; orig: C - - - - - 0x01255A 04:A54A: 10 9E     BPL b04_bra_A4EA_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01255C 04:A54C: 60        RTS



sub_A54D_prepare_tables:  ; orig: sub_A54D_prepare_tables:

; out

; ram_0000_t14_pos_X_data

; ram_0002_t02_pos_Y_data

; ram_0004_t01_data
    MOVE.B  ram_04D7,D1  ; orig: C - - - - - 0x01255D 04:A54D: AE D7 04  LDX ram_04D7
    MOVEA.L #tbl_A4C6_pos_X_lo,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t14_pos_X_data  ; orig: C - - - - - 0x012563 04:A553: 85 00     STA ram_0000_t14_pos
    MOVEA.L #tbl_A4CA_pos_X_hi,A0
    MOVE.B  (A0,D1.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x012568 04:A558: 85 01     STA ram_0000_t14_pos
    MOVEA.L #tbl_A4CE_pos_Y_lo,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0002_t02_pos_Y_data  ; orig: C - - - - - 0x01256D 04:A55D: 85 02     STA ram_0002_t02_pos
    MOVEA.L #tbl_A4D2_pos_Y_hi,A0
    MOVE.B  (A0,D1.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x012572 04:A562: 85 03     STA ram_0002_t02_pos
    MOVEA.L #tbl_A4D6_lo,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0004_t01_data  ; orig: C - - - - - 0x012577 04:A567: 85 04     STA ram_0004_t01_dat
    MOVEA.L #tbl_A4DA_hi,A0
    MOVE.B  (A0,D1.L),D0

    ; (empty translation for STA)  ; orig: C - - - - - 0x01257C 04:A56C: 85 05     STA ram_0004_t01_dat
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x01257E 04:A56E: A0 05     LDY #$05
    RTS                     ; RTS  ; orig: C - - - - - 0x012580 04:A570: 60        RTS



b04_bra_A571:  ; orig: b04_bra_A571:

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012581 04:A571: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012582 04:A572: 4A        LSR
    JMP     loc_A585  ; orig: C - - - - - 0x012583 04:A573: 4C 85 A5  JMP loc_A585



sub_A576:  ; orig: sub_A576:
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012586 04:A576: A5 75     LDA ram_pos_X_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012588 04:A578: 38        SEC
    ; !! SBC ram_pos_X_enemy + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x012589 04:A579: E5 71     SBC ram_pos_X_enemy 
    BPL     b04_bra_A571             ; BPL  ; orig: C - - - - - 0x01258B 04:A57B: 10 F4     BPL b04_bra_A571
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x01258D 04:A57D: 20 21 70  JSR sub_bat_7021_EOR

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012590 04:A580: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012591 04:A581: 4A        LSR
    BSR     sub_bat_7021_EOR_FF             ; JSR -> BSR  ; orig: C - - - - - 0x012592 04:A582: 20 21 70  JSR sub_bat_7021_EOR
loc_A585:  ; orig: loc_A585:
    MOVE.B  D0,ram_04D8  ; orig: C D 1 - - - 0x012595 04:A585: 8D D8 04  STA ram_04D8
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x012598 04:A588: 20 1F 70  JSR sub_bat_701F_EOR
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x01259B 04:A58B: A2 00     LDX #$00
    BSR     sub_A621             ; JSR -> BSR  ; orig: C - - - - - 0x01259D 04:A58D: 20 21 A6  JSR sub_A621
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0125A0 04:A590: A5 89     LDA ram_pos_Y_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0125A2 04:A592: 38        SEC
    ; !! SBC ram_pos_Y_enemy + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x0125A3 04:A593: E5 85     SBC ram_pos_Y_enemy 
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x0125A5 04:A595: 20 1F 70  JSR sub_bat_701F_EOR

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0125A8 04:A598: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x0125A9 04:A599: 4A        LSR
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0125AA 04:A59A: E8        INX
    BSR     sub_A621             ; JSR -> BSR  ; orig: C - - - - - 0x0125AB 04:A59B: 20 21 A6  JSR sub_A621
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0125AE 04:A59E: A2 00     LDX #$00
b04_bra_A5A0_loop:  ; orig: b04_bra_A5A0_loop:
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0125B0 04:A5A0: B5 71     LDA ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0125B2 04:A5A2: 38        SEC
    ; !! SBC ram_pos_X_enemy + $02,X - complex mode, manual review needed  ; orig: C - - - - - 0x0125B3 04:A5A3: F5 72     SBC ram_pos_X_enemy 
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x0125B5 04:A5A5: 20 1F 70  JSR sub_bat_701F_EOR
    CMP.B   ram_04DD,D0  ; orig: C - - - - - 0x0125B8 04:A5A8: CD DD 04  CMP ram_04DD
    BCC     b04_bra_A5BC             ; BCC  ; orig: C - - - - - 0x0125BB 04:A5AB: 90 0F     BCC b04_bra_A5BC
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0125BD 04:A5AD: B5 72     LDA ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0125BF 04:A5AF: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0125C0 04:A5B0: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0125C1 04:A5B1: C8        INY
    ; !! CMP ram_pos_X_enemy + $01,X - needs manual review  ; orig: C - - - - - 0x0125C2 04:A5B2: D5 71     CMP ram_pos_X_enemy 
    BCC     b04_bra_A5BA             ; BCC  ; orig: C - - - - - 0x0125C4 04:A5B4: 90 04     BCC b04_bra_A5BA
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125C6 04:A5B6: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125C7 04:A5B7: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125C8 04:A5B8: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125C9 04:A5B9: 88        DEY
b04_bra_A5BA:  ; orig: b04_bra_A5BA:
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0125CA 04:A5BA: 94 72     STY ram_pos_X_enemy
    MOVE.B  D2,(A0,D1.L)  ; ^
b04_bra_A5BC:  ; orig: b04_bra_A5BC:
    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0125CC 04:A5BC: B5 85     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0125CE 04:A5BE: 38        SEC
    ; !! SBC ram_pos_Y_enemy + $02,X - complex mode, manual review needed  ; orig: C - - - - - 0x0125CF 04:A5BF: F5 86     SBC ram_pos_Y_enemy 
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x0125D1 04:A5C1: 20 1F 70  JSR sub_bat_701F_EOR
    CMP.B   ram_04DE,D0  ; orig: C - - - - - 0x0125D4 04:A5C4: CD DE 04  CMP ram_04DE
    BCC     b04_bra_A5D8             ; BCC  ; orig: C - - - - - 0x0125D7 04:A5C7: 90 0F     BCC b04_bra_A5D8
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0125D9 04:A5C9: B5 86     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0125DB 04:A5CB: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0125DC 04:A5CC: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0125DD 04:A5CD: C8        INY
    ; !! CMP ram_pos_Y_enemy + $01,X - needs manual review  ; orig: C - - - - - 0x0125DE 04:A5CE: D5 85     CMP ram_pos_Y_enemy 
    BCC     b04_bra_A5D6             ; BCC  ; orig: C - - - - - 0x0125E0 04:A5D0: 90 04     BCC b04_bra_A5D6
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125E2 04:A5D2: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125E3 04:A5D3: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125E4 04:A5D4: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0125E5 04:A5D5: 88        DEY
b04_bra_A5D6:  ; orig: b04_bra_A5D6:
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0125E6 04:A5D6: 94 86     STY ram_pos_Y_enemy
    MOVE.B  D2,(A0,D1.L)  ; ^
b04_bra_A5D8:  ; orig: b04_bra_A5D8:
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0125E8 04:A5D8: E8        INX
    CMPI.B  #$04,D1  ; orig: C - - - - - 0x0125E9 04:A5D9: E0 04     CPX #$04
    BNE     b04_bra_A5A0_loop             ; BNE  ; orig: C - - - - - 0x0125EB 04:A5DB: D0 C3     BNE b04_bra_A5A0_loop
    MOVE.B  #$00,D1  ; orig: C - - - - - 0x0125ED 04:A5DD: A2 00     LDX #$00
b04_bra_A5DF_loop:  ; orig: b04_bra_A5DF_loop:
    BSR     sub_A643             ; JSR -> BSR  ; orig: C - - - - - 0x0125EF 04:A5DF: 20 43 A6  JSR sub_A643
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x0125F2 04:A5E2: E8        INX
    CMPI.B  #$03,D1  ; orig: C - - - - - 0x0125F3 04:A5E3: E0 03     CPX #$03
    BCC     b04_bra_A5DF_loop             ; BCC  ; orig: C - - - - - 0x0125F5 04:A5E5: 90 F8     BCC b04_bra_A5DF_loop
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x0125F7 04:A5E7: A2 02     LDX #$02
b04_bra_A5E9_loop:  ; orig: b04_bra_A5E9_loop:
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x0125F9 04:A5E9: 8A        TXA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0125FA 04:A5EA: A8        TAY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0125FB 04:A5EB: A5 71     LDA ram_pos_X_enemy 
b04_bra_A5ED_loop:  ; orig: b04_bra_A5ED_loop:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0125FD 04:A5ED: 18        CLC
    MOVE.B  ram_04D8,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x0125FE 04:A5EE: 6D D8 04  ADC ram_04D8

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012601 04:A5F1: 88        DEY
    BPL     b04_bra_A5ED_loop             ; BPL  ; orig: C - - - - - 0x012602 04:A5F2: 10 F9     BPL b04_bra_A5ED_loop
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x012604 04:A5F4: B4 72     LDY ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012606 04:A5F6: C8        INY
    ; !! CMP ram_pos_X_enemy + $02,X - needs manual review  ; orig: C - - - - - 0x012607 04:A5F7: D5 72     CMP ram_pos_X_enemy 
    BCS     b04_bra_A5FD             ; BCS  ; orig: C - - - - - 0x012609 04:A5F9: B0 02     BCS b04_bra_A5FD
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01260B 04:A5FB: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01260C 04:A5FC: 88        DEY
b04_bra_A5FD:  ; orig: b04_bra_A5FD:
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x01260D 04:A5FD: 94 72     STY ram_pos_X_enemy
    MOVE.B  D2,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x01260F 04:A5FF: CA        DEX
    BPL     b04_bra_A5E9_loop             ; BPL  ; orig: C - - - - - 0x012610 04:A600: 10 E7     BPL b04_bra_A5E9_loop
    MOVE.B  #$01,D1  ; orig: C - - - - - 0x012612 04:A602: A2 01     LDX #$01
b04_bra_A604_loop:  ; orig: b04_bra_A604_loop:
    MOVEA.L #$FF0087,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012614 04:A604: B5 87     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ; !! CMP ram_pos_Y_enemy + $02,X - needs manual review  ; orig: C - - - - - 0x012616 04:A606: D5 86     CMP ram_pos_Y_enemy 
    BCS     b04_bra_A613             ; BCS  ; orig: C - - - - - 0x012618 04:A608: B0 09     BCS b04_bra_A613
    ; !! CMP ram_pos_Y_enemy + $04,X - needs manual review  ; orig: C - - - - - 0x01261A 04:A60A: D5 88     CMP ram_pos_Y_enemy 
    BCS     b04_bra_A61D             ; BCS  ; orig: C - - - - - 0x01261C 04:A60C: B0 0F     BCS b04_bra_A61D
    MOVEA.L #$FF0087,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x01261E 04:A60E: F6 87     INC ram_pos_Y_enemy
    ADDQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_A61D  ; orig: C - - - - - 0x012620 04:A610: 4C 1D A6  JMP loc_A61D
b04_bra_A613:  ; orig: b04_bra_A613:
    ; !! CMP ram_pos_Y_enemy + $02,X - needs manual review  ; orig: C - - - - - 0x012623 04:A613: D5 86     CMP ram_pos_Y_enemy 
    BCC     b04_bra_A61D             ; BCC  ; orig: C - - - - - 0x012625 04:A615: 90 06     BCC b04_bra_A61D
    ; !! CMP ram_pos_Y_enemy + $04,X - needs manual review  ; orig: C - - - - - 0x012627 04:A617: D5 88     CMP ram_pos_Y_enemy 
    BCC     b04_bra_A61D             ; BCC  ; orig: C - - - - - 0x012629 04:A619: 90 02     BCC b04_bra_A61D
    MOVEA.L #$FF0087,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x01262B 04:A61B: D6 87     DEC ram_pos_Y_enemy
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_A61D:  ; orig: b04_bra_A61D:
loc_A61D:  ; orig: loc_A61D:
    SUBQ.B  #1,D1           ; DEX  ; orig: C D 1 - - - 0x01262D 04:A61D: CA        DEX
    BPL     b04_bra_A604_loop             ; BPL  ; orig: C - - - - - 0x01262E 04:A61E: 10 E4     BPL b04_bra_A604_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x012630 04:A620: 60        RTS



sub_A621:  ; orig: sub_A621:
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x012631 04:A621: C9 04     CMP #$04
    BCC     b04_bra_A627             ; BCC  ; orig: C - - - - - 0x012633 04:A623: 90 02     BCC b04_bra_A627
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x012635 04:A625: A9 04     LDA #$04
b04_bra_A627:  ; orig: b04_bra_A627:
    MOVEA.L #ram_04D9,A0
    MOVE.B  D0,(A0,D1.L)

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01263A 04:A62A: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01263B 04:A62B: 69 04     ADC #$04
    CMPI.B  #$08,D0  ; orig: C - - - - - 0x01263D 04:A62D: C9 08     CMP #$08
    BCC     b04_bra_A633_not_overflow             ; BCC  ; orig: C - - - - - 0x01263F 04:A62F: 90 02     BCC bra_A633_not_ove
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012641 04:A631: A9 08     LDA #$08
b04_bra_A633_not_overflow:  ; orig: b04_bra_A633_not_overflow:
    MOVEA.L #ram_04DB,A0
    MOVE.B  D0,(A0,D1.L)

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012646 04:A636: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012647 04:A637: 69 04     ADC #$04
    CMPI.B  #$0B,D0  ; orig: C - - - - - 0x012649 04:A639: C9 0B     CMP #$0B
    BCC     b04_bra_A63F_not_overflow             ; BCC  ; orig: C - - - - - 0x01264B 04:A63B: 90 02     BCC bra_A63F_not_ove
    MOVE.B  #$0B,D0  ; orig: C - - - - - 0x01264D 04:A63D: A9 0B     LDA #$0B
b04_bra_A63F_not_overflow:  ; orig: b04_bra_A63F_not_overflow:
    MOVEA.L #ram_04DD,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x012652 04:A642: 60        RTS



sub_A643:  ; orig: sub_A643:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012653 04:A643: A0 00     LDY #$00
    MOVEA.L #$FF0073,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012655 04:A645: B5 73     LDA ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012657 04:A647: 38        SEC
    ; !! SBC ram_pos_X_enemy + $03,X - complex mode, manual review needed  ; orig: C - - - - - 0x012658 04:A648: F5 73     SBC ram_pos_X_enemy 
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01265A 04:A64A: 20 1F 70  JSR sub_bat_701F_EOR
    CMP.B   ram_04D9,D0  ; orig: C - - - - - 0x01265D 04:A64D: CD D9 04  CMP ram_04D9
    BCC     b04_bra_A653             ; BCC  ; orig: C - - - - - 0x012660 04:A650: 90 01     BCC b04_bra_A653
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012662 04:A652: C8        INY
b04_bra_A653:  ; orig: b04_bra_A653:
    CMP.B   ram_04DB,D0  ; orig: C - - - - - 0x012663 04:A653: CD DB 04  CMP ram_04DB
    BCC     b04_bra_A659             ; BCC  ; orig: C - - - - - 0x012666 04:A656: 90 01     BCC b04_bra_A659
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x012668 04:A658: C8        INY
b04_bra_A659:  ; orig: b04_bra_A659:
    MOVEA.L #$FF0087,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012669 04:A659: B5 87     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01266B 04:A65B: 38        SEC
    ; !! SBC ram_pos_Y_enemy + $02,X - complex mode, manual review needed  ; orig: C - - - - - 0x01266C 04:A65C: F5 86     SBC ram_pos_Y_enemy 
    BSR     sub_bat_701F_EOR_FF_if_negative             ; JSR -> BSR  ; orig: C - - - - - 0x01266E 04:A65E: 20 1F 70  JSR sub_bat_701F_EOR
    CMP.B   ram_04DA,D0  ; orig: C - - - - - 0x012671 04:A661: CD DA 04  CMP ram_04DA
    BCC     b04_bra_A669             ; BCC  ; orig: C - - - - - 0x012674 04:A664: 90 03     BCC b04_bra_A669
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012676 04:A666: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012677 04:A667: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012678 04:A668: C8        INY
b04_bra_A669:  ; orig: b04_bra_A669:
    CMP.B   ram_04DC,D0  ; orig: C - - - - - 0x012679 04:A669: CD DC 04  CMP ram_04DC
    BCC     b04_bra_A671             ; BCC  ; orig: C - - - - - 0x01267C 04:A66C: 90 03     BCC b04_bra_A671
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01267E 04:A66E: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01267F 04:A66F: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012680 04:A670: C8        INY
b04_bra_A671:  ; orig: b04_bra_A671:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x012681 04:A671: 98        TYA
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x012682 04:A672: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_033_A687_00  -- needs manual handling  ; orig: - D 1 - I - 0x012685 04:A675: 87 A6     .word ofs_033_A687_0
    ; [DIRECTIVE] .WORD ofs_033_A69C_01_RTS  -- needs manual handling  ; orig: - D 1 - I - 0x012687 04:A677: 9C A6     .word ofs_033_A69C_0
    ; [DIRECTIVE] .WORD ofs_033_A6B5_02  -- needs manual handling  ; orig: - - - - - - 0x012689 04:A679: B5 A6     .word ofs_033_A6B5_0
    ; [DIRECTIVE] .WORD ofs_033_A69C_03_RTS  -- needs manual handling  ; orig: - D 1 - I - 0x01268B 04:A67B: 9C A6     .word ofs_033_A69C_0
    ; [DIRECTIVE] .WORD ofs_033_A69C_04_RTS  -- needs manual handling  ; orig: - D 1 - I - 0x01268D 04:A67D: 9C A6     .word ofs_033_A69C_0
    ; [DIRECTIVE] .WORD ofs_033_A6B5_05  -- needs manual handling  ; orig: - - - - - - 0x01268F 04:A67F: B5 A6     .word ofs_033_A6B5_0
    ; [DIRECTIVE] .WORD ofs_033_A69D_06  -- needs manual handling  ; orig: - D 1 - I - 0x012691 04:A681: 9D A6     .word ofs_033_A69D_0
    ; [DIRECTIVE] .WORD ofs_033_A69D_07  -- needs manual handling  ; orig: - D 1 - I - 0x012693 04:A683: 9D A6     .word ofs_033_A69D_0
    ; [DIRECTIVE] .WORD ofs_033_A6C5_08  -- needs manual handling  ; orig: - - - - - - 0x012695 04:A685: C5 A6     .word ofs_033_A6C5_0



ofs_033_A687_00:  ; orig: ofs_033_A687_00:
    MOVE.B  ram_indiv_random,D0  ; orig: C - - J - - 0x012697 04:A687: A5 18     LDA ram_indiv_random
    BPL     b04_bra_A6AA             ; BPL  ; orig: C - - - - - 0x012699 04:A689: 10 1F     BPL b04_bra_A6AA
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01269B 04:A68B: B5 86     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01269D 04:A68D: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01269E 04:A68E: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01269F 04:A68F: C8        INY
    ; !! CMP ram_pos_Y_enemy + $03,X - needs manual review  ; orig: C - - - - - 0x0126A0 04:A690: D5 87     CMP ram_pos_Y_enemy 
    BEQ     b04_bra_A696             ; BEQ  ; orig: C - - - - - 0x0126A2 04:A692: F0 02     BEQ b04_bra_A696
    BCS     b04_bra_A69A             ; BCS  ; orig: C - - - - - 0x0126A4 04:A694: B0 04     BCS b04_bra_A69A
b04_bra_A696:  ; orig: b04_bra_A696:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126A6 04:A696: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126A7 04:A697: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126A8 04:A698: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126A9 04:A699: 88        DEY
b04_bra_A69A:  ; orig: b04_bra_A69A:
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0126AA 04:A69A: 94 86     STY ram_pos_Y_enemy
    MOVE.B  D2,(A0,D1.L)  ; ^
ofs_033_A69C_01_RTS:  ; orig: ofs_033_A69C_01_RTS:
ofs_033_A69C_03_RTS:  ; orig: ofs_033_A69C_03_RTS:
ofs_033_A69C_04_RTS:  ; orig: ofs_033_A69C_04_RTS:
    RTS                     ; RTS  ; orig: C - - J - - 0x0126AC 04:A69C: 60        RTS



ofs_033_A69D_06:  ; orig: ofs_033_A69D_06:
ofs_033_A69D_07:  ; orig: ofs_033_A69D_07:
b04_bra_A69D:
; bzk
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - J - - 0x0126AD 04:A69D: B5 86     LDA ram_pos_Y_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0126AF 04:A69F: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0126B0 04:A6A0: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0126B1 04:A6A1: C8        INY
    ; !! CMP ram_pos_Y_enemy + $03,X - needs manual review  ; orig: C - - - - - 0x0126B2 04:A6A2: D5 87     CMP ram_pos_Y_enemy 
    BEQ     b04_bra_A69A             ; BEQ  ; orig: C - - - - - 0x0126B4 04:A6A4: F0 F4     BEQ b04_bra_A69A
    BCC     b04_bra_A69A             ; BCC  ; orig: C - - - - - 0x0126B6 04:A6A6: 90 F2     BCC b04_bra_A69A
    BCS     b04_bra_A696             ; BCS  ; orig: - - - - - - 0x0126B8 04:A6A8: B0 EC     BCS b04_bra_A696    ; jm
b04_bra_A6AA:  ; orig: b04_bra_A6AA:
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0126BA 04:A6AA: B5 72     LDA ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0126BC 04:A6AC: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0126BD 04:A6AD: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0126BE 04:A6AE: C8        INY
    ; !! CMP ram_pos_X_enemy + $03,X - needs manual review  ; orig: C - - - - - 0x0126BF 04:A6AF: D5 73     CMP ram_pos_X_enemy 
    BCS     b04_bra_A6C2             ; BCS  ; orig: C - - - - - 0x0126C1 04:A6B1: B0 0F     BCS b04_bra_A6C2
    BCC     b04_bra_A6BE             ; BCC  ; orig: C - - - - - 0x0126C3 04:A6B3: 90 09     BCC b04_bra_A6BE    ; jm



ofs_033_A6B5_02:  ; orig: ofs_033_A6B5_02:
ofs_033_A6B5_05:  ; orig: ofs_033_A6B5_05:
b04_bra_A6B5:
; bzk
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for LDA)  ; orig: - - - - - - 0x0126C5 04:A6B5: B5 72     LDA ram_pos_X_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVE.B  D0,D2           ; TAY  ; orig: - - - - - - 0x0126C7 04:A6B7: A8        TAY
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x0126C8 04:A6B8: C8        INY
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x0126C9 04:A6B9: C8        INY
    ; !! CMP ram_pos_X_enemy + $03,X - needs manual review  ; orig: - - - - - - 0x0126CA 04:A6BA: D5 73     CMP ram_pos_X_enemy 
    BCC     b04_bra_A6C2             ; BCC  ; orig: - - - - - - 0x0126CC 04:A6BC: 90 04     BCC b04_bra_A6C2
b04_bra_A6BE:  ; orig: b04_bra_A6BE:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126CE 04:A6BE: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126CF 04:A6BF: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126D0 04:A6C0: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0126D1 04:A6C1: 88        DEY
b04_bra_A6C2:  ; orig: b04_bra_A6C2:
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for STY)  ; orig: C - - - - - 0x0126D2 04:A6C2: 94 72     STY ram_pos_X_enemy
    MOVE.B  D2,(A0,D1.L)  ; ^
    RTS                     ; RTS  ; orig: C - - - - - 0x0126D4 04:A6C4: 60        RTS



ofs_033_A6C5_08:  ; orig: ofs_033_A6C5_08:
    MOVE.B  ram_indiv_random,D0  ; orig: - - - - - - 0x0126D5 04:A6C5: A5 18     LDA ram_indiv_random
    BPL     b04_bra_A6B5             ; BPL  ; orig: - - - - - - 0x0126D7 04:A6C7: 10 EC     BPL b04_bra_A6B5
    BMI     b04_bra_A69D             ; BMI  ; orig: - - - - - - 0x0126D9 04:A6C9: 30 D2     BMI b04_bra_A69D    ; jm



b04_bra_A6CB:
; bzk
    MOVE.B  #$03,D2  ; orig: C - - - - - 0x0126DB 04:A6CB: A0 03     LDY #$03
    MOVE.B  D2,ram_0003_t16_spr_A  ; orig: C - - - - - 0x0126DD 04:A6CD: 84 03     STY ram_0003_t16_spr
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x0126DF 04:A6CF: 48        PHA
    MOVE.B  ram_04D7,D0  ; orig: C - - - - - 0x0126E0 04:A6D0: AD D7 04  LDA ram_04D7

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0126E3 04:A6D3: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0126E4 04:A6D4: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x0126E5 04:A6D5: 0A        ASL
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x0126E6 04:A6D6: E0 05     CPX #$05
    BEQ     b04_bra_A6DD             ; BEQ  ; orig: C - - - - - 0x0126E8 04:A6D8: F0 03     BEQ b04_bra_A6DD
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0126EA 04:A6DA: 18        CLC
    ADD.B  #$20,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0126EB 04:A6DB: 69 20     ADC #$20
b04_bra_A6DD:  ; orig: b04_bra_A6DD:
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0126ED 04:A6DD: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x0126EE 04:A6DE: 68        PLA
    BSR     sub_bat_79A5             ; JSR -> BSR  ; orig: C - - - - - 0x0126EF 04:A6DF: 20 A5 79  JSR sub_bat_79A5
    JMP     loc_A6FA  ; orig: C - - - - - 0x0126F2 04:A6E2: 4C FA A6  JMP loc_A6FA



sub_A6E5:  ; orig: sub_A6E5:
    MOVE.B  #$05,D1  ; orig: C - - - - - 0x0126F5 04:A6E5: A2 05     LDX #$05
loc_A6E7_loop:  ; orig: loc_A6E7_loop:
    MOVE.B  #$DA,D0  ; orig: C D 1 - - - 0x0126F7 04:A6E7: A9 DA     LDA #$DA    ; spr_T
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x0126F9 04:A6E9: E0 05     CPX #$05
    BNE     b04_bra_A6EF             ; BNE  ; orig: C - - - - - 0x0126FB 04:A6EB: D0 02     BNE b04_bra_A6EF
    MOVE.B  #$DC,D0  ; orig: C - - - - - 0x0126FD 04:A6ED: A9 DC     LDA #$DC    ; spr_T
b04_bra_A6EF:  ; orig: b04_bra_A6EF:
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x0126FF 04:A6EF: E0 05     CPX #$05
    BEQ     b04_bra_A6CB             ; BEQ  ; orig: C - - - - - 0x012701 04:A6F1: F0 D8     BEQ b04_bra_A6CB
    CMPI.B  #$01,D1  ; orig: C - - - - - 0x012703 04:A6F3: E0 01     CPX #$01
    BEQ     b04_bra_A6CB             ; BEQ  ; orig: C - - - - - 0x012705 04:A6F5: F0 D4     BEQ b04_bra_A6CB
    BSR     sub_bat_798D             ; JSR -> BSR  ; orig: C - - - - - 0x012707 04:A6F7: 20 8D 79  JSR sub_bat_798D
loc_A6FA:  ; orig: loc_A6FA:
    CMPI.B  #$05,D1  ; orig: C D 1 - - - 0x01270A 04:A6FA: E0 05     CPX #$05
    BEQ     b04_bra_A705             ; BEQ  ; orig: C - - - - - 0x01270C 04:A6FC: F0 07     BEQ b04_bra_A705
    CMPI.B  #$01,D1  ; orig: C - - - - - 0x01270E 04:A6FE: E0 01     CPX #$01
    BEQ     b04_bra_A705             ; BEQ  ; orig: C - - - - - 0x012710 04:A700: F0 03     BEQ b04_bra_A705
    JMP     loc_A784  ; orig: C - - - - - 0x012712 04:A702: 4C 84 A7  JMP loc_A784
b04_bra_A705:  ; orig: b04_bra_A705:
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x012715 04:A705: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #$FF00C0,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012718 04:A708: BD C0 00  LDA a: ram_00C0_enem
    MOVE.B  (A0,D1.L),D0  ; ^
    BEQ     b04_bra_A715             ; BEQ  ; orig: C - - - - - 0x01271B 04:A70B: F0 08     BEQ b04_bra_A715
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x01271D 04:A70D: A9 06     LDA #$06
    MOVE.B  D0,ram_04E6  ; orig: C - - - - - 0x01271F 04:A70F: 8D E6 04  STA ram_04E6
    MOVE.B  D0,ram_0510_counter  ; orig: C - - - - - 0x012722 04:A712: 8D 10 05  STA ram_0510_counter
b04_bra_A715:  ; orig: b04_bra_A715:
    BSR     sub_0x01EEF4             ; JSR -> BSR  ; orig: C - - - - - 0x012725 04:A715: 20 E4 EE  JSR sub_0x01EEF4
    CMPI.B  #$01,D1  ; orig: C - - - - - 0x012728 04:A718: E0 01     CPX #$01
    BEQ     b04_bra_A781             ; BEQ  ; orig: C - - - - - 0x01272A 04:A71A: F0 65     BEQ b04_bra_A781
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x01272C 04:A71C: 20 00 80  JSR sub_8000
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A784             ; BEQ  ; orig: C - - - - - 0x012732 04:A722: F0 60     BEQ b04_bra_A784
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x012734 04:A724: A9 60     LDA #$60
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012736 04:A726: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x012739 04:A729: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x01273A 04:A72A: 48        PHA
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x01273B 04:A72B: E0 05     CPX #$05
    BNE     b04_bra_A748             ; BNE  ; orig: C - - - - - 0x01273D 04:A72D: D0 19     BNE b04_bra_A748
    MOVE.B  ram_04D7,D0  ; orig: C - - - - - 0x01273F 04:A72F: AD D7 04  LDA ram_04D7
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012742 04:A732: 18        CLC
    ADD.B  #$07,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012743 04:A733: 69 07     ADC #$07
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x012745 04:A735: AA        TAX
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x012746 04:A736: A9 FF     LDA #$FF
    MOVEA.L #ram_0492_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x01274B 04:A73B: A5 75     LDA ram_pos_X_enemy 
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x01274F 04:A73F: A5 89     LDA ram_pos_Y_enemy 
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_obj_id_46,D0  ; orig: C - - - - - 0x012753 04:A743: A9 46     LDA #con_obj_id_46
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012755 04:A745: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_A748:  ; orig: b04_bra_A748:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012758 04:A748: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x012759 04:A749: AA        TAX
    MOVE.B  ram_04D7,D0  ; orig: C - - - - - 0x01275A 04:A74A: AD D7 04  LDA ram_04D7

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01275D 04:A74D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01275E 04:A74E: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01275F 04:A74F: 0A        ASL
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012760 04:A750: A8        TAY
    MOVE.B  #$F8,D0  ; orig: C - - - - - 0x012761 04:A751: A9 F8     LDA #$F8
    MOVEA.L #ram_spr_Y,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #$FF0220,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012766 04:A756: 99 20 02  STA ram_spr_Y + $20,
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  ram_04D7,D2  ; orig: C - - - - - 0x012769 04:A759: AC D7 04  LDY ram_04D7
    MOVEA.L #tbl_0x01E6CE_8_bits,A0
    MOVE.B  (A0,D2.L),D0

    OR.B    ram_0511_bits,D0  ; orig: C - - - - - 0x01276F 04:A75F: 0D 11 05  ORA ram_0511_bits
    MOVE.B  D0,ram_0511_bits  ; orig: C - - - - - 0x012772 04:A762: 8D 11 05  STA ram_0511_bits
    MOVE.B  D0,ram_0000_t53  ; orig: C - - - - - 0x012775 04:A765: 85 00     STA ram_0000_t53
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012777 04:A767: A9 00     LDA #$00
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x012779 04:A769: A0 04     LDY #$04
b04_bra_A76B_loop:  ; orig: b04_bra_A76B_loop:
    MOVE.B  (ram_0000_t53).l,D3
    LSR.B  #1,D3
    MOVE.B  D3,(ram_0000_t53).l  ; orig: C - - - - - 0x01277B 04:A76B: 46 00     LSR ram_0000_t53

    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01277D 04:A76D: 69 00     ADC #$00
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01277F 04:A76F: 88        DEY
    BNE     b04_bra_A76B_loop             ; BNE  ; orig: C - - - - - 0x012780 04:A770: D0 F9     BNE b04_bra_A76B_loop
    MOVE.B  D0,ram_0000_t54  ; orig: C - - - - - 0x012782 04:A772: 85 00     STA ram_0000_t54
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x012784 04:A774: AD 50 03  LDA ram_obj_id_enemy
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012787 04:A777: 38        SEC
    SUB.B  #$41,D0       ; SBC imm  ; orig: C - - - - - 0x012788 04:A778: E9 41     SBC #$41
    CMP.B   ram_0000_t54,D0  ; orig: C - - - - - 0x01278A 04:A77A: C5 00     CMP ram_0000_t54
    BEQ     b04_bra_A78C             ; BEQ  ; orig: C - - - - - 0x01278C 04:A77C: F0 0E     BEQ b04_bra_A78C
    JMP     loc_0x01FEEA  ; orig: C - - - - - 0x01278E 04:A77E: 4C DA FE  JMP loc_0x01FEEA
b04_bra_A781:  ; orig: b04_bra_A781:
    BSR     sub_0x01FEEA             ; JSR -> BSR  ; orig: C - - - - - 0x012791 04:A781: 20 DA FE  JSR sub_0x01FEEA
b04_bra_A784:  ; orig: b04_bra_A784:
loc_A784:  ; orig: loc_A784:
    SUBQ.B  #1,D1           ; DEX  ; orig: C D 1 - - - 0x012794 04:A784: CA        DEX
    CMPI.B  #$01,D1  ; orig: C - - - - - 0x012795 04:A785: E0 01     CPX #$01
    BCC     b04_bra_A7FA_RTS             ; BCC  ; orig: C - - - - - 0x012797 04:A787: 90 71     BCC b04_bra_A7FA_RTS
    JMP     loc_A6E7_loop  ; orig: C - - - - - 0x012799 04:A789: 4C E7 A6  JMP loc_A6E7_loop
b04_bra_A78C:  ; orig: b04_bra_A78C:
    BSR     sub_bat_7512             ; JSR -> BSR  ; orig: C - - - - - 0x01279C 04:A78C: 20 12 75  JSR sub_bat_7512
    BSR     b04_sub_B010             ; JSR -> BSR  ; orig: C - - - - - 0x01279F 04:A78F: 20 10 B0  JSR b04_sub_B010
    MOVE.B  #$11,D0  ; orig: C - - - - - 0x0127A2 04:A792: A9 11     LDA #$11
    ; (empty translation for STA)  ; orig: C - - - - - 0x0127A4 04:A794: 8D 06 04  STA ram_0405_enemy +
    MOVE.B  #$01,D2  ; orig: C - - - - - 0x0127A7 04:A797: A0 01     LDY #$01
b04_bra_A799_loop:  ; orig: b04_bra_A799_loop:
    MOVE.B  #con_obj_id_null,D0  ; orig: C - - - - - 0x0127A9 04:A799: A9 00     LDA #con_obj_id_null
    MOVEA.L #$FF0350,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0127AB 04:A79B: 99 50 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0127AE 04:A79E: C8        INY
    CMPI.B  #$0A,D2  ; orig: C - - - - - 0x0127AF 04:A79F: C0 0A     CPY #$0A
    BCC     b04_bra_A799_loop             ; BCC  ; orig: C - - - - - 0x0127B1 04:A7A1: 90 F6     BCC b04_bra_A799_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0127B3 04:A7A3: 60        RTS



sub_A7A4:  ; orig: sub_A7A4:
    MOVE.B  ram_0418,D0  ; orig: C - - - - - 0x0127B4 04:A7A4: AD 18 04  LDA ram_0418
    BNE     b04_bra_A7FB             ; BNE  ; orig: C - - - - - 0x0127B7 04:A7A7: D0 52     BNE b04_bra_A7FB
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0127B9 04:A7A9: A5 75     LDA ram_pos_X_enemy 
    MOVE.B  ram_0415,D2  ; orig: C - - - - - 0x0127BB 04:A7AB: AC 15 04  LDY ram_0415
    BSR     sub_A7FF             ; JSR -> BSR  ; orig: C - - - - - 0x0127BE 04:A7AE: 20 FF A7  JSR sub_A7FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x0127C1 04:A7B1: 85 75     STA ram_pos_X_enemy 
    ; (empty translation for LDA)  ; orig: C - - - - - 0x0127C3 04:A7B3: A5 89     LDA ram_pos_Y_enemy 
    MOVE.B  ram_0416,D2  ; orig: C - - - - - 0x0127C5 04:A7B5: AC 16 04  LDY ram_0416
    BSR     sub_A7FF             ; JSR -> BSR  ; orig: C - - - - - 0x0127C8 04:A7B8: 20 FF A7  JSR sub_A7FF
    ; (empty translation for STA)  ; orig: C - - - - - 0x0127CB 04:A7BB: 85 89     STA ram_pos_Y_enemy 
    ADDQ.B  #1,ram_0417  ; orig: C - - - - - 0x0127CD 04:A7BD: EE 17 04  INC ram_0417
    MOVE.B  ram_0417,D0  ; orig: C - - - - - 0x0127D0 04:A7C0: AD 17 04  LDA ram_0417
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x0127D3 04:A7C3: C9 04     CMP #$04
    BCC     b04_bra_A7FA_RTS             ; BCC  ; orig: C - - - - - 0x0127D5 04:A7C5: 90 33     BCC b04_bra_A7FA_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0127D7 04:A7C7: A9 00     LDA #$00
    MOVE.B  D0,ram_0417  ; orig: C - - - - - 0x0127D9 04:A7C9: 8D 17 04  STA ram_0417
    ADDQ.B  #1,ram_0413  ; orig: C - - - - - 0x0127DC 04:A7CC: EE 13 04  INC ram_0413
    MOVE.B  ram_0413,D0  ; orig: C - - - - - 0x0127DF 04:A7CF: AD 13 04  LDA ram_0413
    CMPI.B  #$0C,D0  ; orig: C - - - - - 0x0127E2 04:A7D2: C9 0C     CMP #$0C
    BCC     b04_bra_A7E3             ; BCC  ; orig: C - - - - - 0x0127E4 04:A7D4: 90 0D     BCC b04_bra_A7E3
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0127E6 04:A7D6: A9 00     LDA #$00
    MOVE.B  D0,ram_0413  ; orig: C - - - - - 0x0127E8 04:A7D8: 8D 13 04  STA ram_0413
    MOVE.B  ram_0415,D0  ; orig: C - - - - - 0x0127EB 04:A7DB: AD 15 04  LDA ram_0415
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x0127EE 04:A7DE: 49 FF     EOR #$FF
    MOVE.B  D0,ram_0415  ; orig: C - - - - - 0x0127F0 04:A7E0: 8D 15 04  STA ram_0415
b04_bra_A7E3:  ; orig: b04_bra_A7E3:
    ADDQ.B  #1,ram_0414  ; orig: C - - - - - 0x0127F3 04:A7E3: EE 14 04  INC ram_0414
    MOVE.B  ram_0414,D0  ; orig: C - - - - - 0x0127F6 04:A7E6: AD 14 04  LDA ram_0414
    CMPI.B  #$06,D0  ; orig: C - - - - - 0x0127F9 04:A7E9: C9 06     CMP #$06
    BCC     b04_bra_A7FA_RTS             ; BCC  ; orig: C - - - - - 0x0127FB 04:A7EB: 90 0D     BCC b04_bra_A7FA_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0127FD 04:A7ED: A9 00     LDA #$00
    MOVE.B  D0,ram_0414  ; orig: C - - - - - 0x0127FF 04:A7EF: 8D 14 04  STA ram_0414
    MOVE.B  ram_0416,D0  ; orig: C - - - - - 0x012802 04:A7F2: AD 16 04  LDA ram_0416
    EORI.B  #$FF,D0  ; orig: C - - - - - 0x012805 04:A7F5: 49 FF     EOR #$FF
    MOVE.B  D0,ram_0416  ; orig: C - - - - - 0x012807 04:A7F7: 8D 16 04  STA ram_0416
b04_bra_A7FA_RTS:  ; orig: b04_bra_A7FA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01280A 04:A7FA: 60        RTS
b04_bra_A7FB:  ; orig: b04_bra_A7FB:
    SUBQ.B  #1,ram_0418  ; orig: C - - - - - 0x01280B 04:A7FB: CE 18 04  DEC ram_0418
    RTS                     ; RTS  ; orig: C - - - - - 0x01280E 04:A7FE: 60        RTS



sub_A7FF:  ; orig: sub_A7FF:
    BNE     b04_bra_A805             ; BNE  ; orig: C - - - - - 0x01280F 04:A7FF: D0 04     BNE b04_bra_A805
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012811 04:A801: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012812 04:A802: 69 01     ADC #$01
    RTS                     ; RTS  ; orig: C - - - - - 0x012814 04:A804: 60        RTS
b04_bra_A805:  ; orig: b04_bra_A805:
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012815 04:A805: 38        SEC
    SUB.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x012816 04:A806: E9 01     SBC #$01
    RTS                     ; RTS  ; orig: C - - - - - 0x012818 04:A808: 60        RTS



tbl_A809_spt_T:  ; orig: tbl_A809_spt_T:

; offset via 0x01282B

; 00
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - - - 0x012819 04:A809: C0        .byte $C0   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - - - 0x01281A 04:A80A: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $C8  -- needs manual handling  ; orig: - D 1 - - - 0x01281B 04:A80B: C8        .byte $C8   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 1 - - - 0x01281C 04:A80C: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - - - 0x01281D 04:A80D: C6        .byte $C6   ;
    ; [DIRECTIVE] .BYTE $CA  -- needs manual handling  ; orig: - D 1 - - - 0x01281E 04:A80E: CA        .byte $CA   ;

; 06
    ; [DIRECTIVE] .BYTE $CC  -- needs manual handling  ; orig: - D 1 - - - 0x01281F 04:A80F: CC        .byte $CC   ;
    ; [DIRECTIVE] .BYTE $C4  -- needs manual handling  ; orig: - D 1 - - - 0x012820 04:A810: C4        .byte $C4   ;
    ; [DIRECTIVE] .BYTE $CE  -- needs manual handling  ; orig: - D 1 - - - 0x012821 04:A811: CE        .byte $CE   ;
    ; [DIRECTIVE] .BYTE $C2  -- needs manual handling  ; orig: - D 1 - - - 0x012822 04:A812: C2        .byte $C2   ;
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - - - 0x012823 04:A813: C6        .byte $C6   ;
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - - - 0x012824 04:A814: D0        .byte $D0   ;

; 0C
    ; [DIRECTIVE] .BYTE $D2  -- needs manual handling  ; orig: - D 1 - - - 0x012825 04:A815: D2        .byte $D2   ;
    ; [DIRECTIVE] .BYTE $D6  -- needs manual handling  ; orig: - D 1 - - - 0x012826 04:A816: D6        .byte $D6   ;
    ; [DIRECTIVE] .BYTE $D8  -- needs manual handling  ; orig: - D 1 - - - 0x012827 04:A817: D8        .byte $D8   ;
    ; [DIRECTIVE] .BYTE $D4  -- needs manual handling  ; orig: - D 1 - - - 0x012828 04:A818: D4        .byte $D4   ;
    ; [DIRECTIVE] .BYTE $C6  -- needs manual handling  ; orig: - D 1 - - - 0x012829 04:A819: C6        .byte $C6   ;
    ; [DIRECTIVE] .BYTE $D0  -- needs manual handling  ; orig: - D 1 - - - 0x01282A 04:A81A: D0        .byte $D0   ;



tbl_A81B:  ; orig: tbl_A81B:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x01282B 04:A81B: 06        .byte $06   ;
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x01282C 04:A81C: 00        .byte $00   ;
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x01282D 04:A81D: 06        .byte $06   ;
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - - - 0x01282E 04:A81E: 0C        .byte $0C   ;



b04_bra_A81F:  ; orig: b04_bra_A81F:
    SUBQ.B  #1,ram_04E6  ; orig: C - - - - - 0x01282F 04:A81F: CE E6 04  DEC ram_04E6
    JMP     loc_A844  ; orig: C - - - - - 0x012832 04:A822: 4C 44 A8  JMP loc_A844
sub_A825:  ; orig: sub_A825:
    MOVE.B  ram_04E6,D0  ; orig: C - - - - - 0x012835 04:A825: AD E6 04  LDA ram_04E6
    BNE     b04_bra_A81F             ; BNE  ; orig: C - - - - - 0x012838 04:A828: D0 F5     BNE b04_bra_A81F
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x01283A 04:A82A: A9 10     LDA #$10
    MOVE.B  ram_0510_counter,D2  ; orig: C - - - - - 0x01283C 04:A82C: AC 10 05  LDY ram_0510_counter
    BEQ     b04_bra_A836             ; BEQ  ; orig: C - - - - - 0x01283F 04:A82F: F0 05     BEQ b04_bra_A836
    SUBQ.B  #1,ram_0510_counter  ; orig: C - - - - - 0x012841 04:A831: CE 10 05  DEC ram_0510_counter
    MOVE.B  #$06,D0  ; orig: C - - - - - 0x012844 04:A834: A9 06     LDA #$06
b04_bra_A836:  ; orig: b04_bra_A836:
    MOVE.B  D0,ram_04E6  ; orig: C - - - - - 0x012846 04:A836: 8D E6 04  STA ram_04E6
    MOVE.B  ram_04E7,D0  ; orig: C - - - - - 0x012849 04:A839: AD E7 04  LDA ram_04E7
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01284C 04:A83C: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01284D 04:A83D: 69 01     ADC #$01
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x01284F 04:A83F: 29 03     AND #$03
    MOVE.B  D0,ram_04E7  ; orig: C - - - - - 0x012851 04:A841: 8D E7 04  STA ram_04E7
loc_A844:  ; orig: loc_A844:
    MOVE.B  #$00,D0  ; orig: C D 1 - - - 0x012854 04:A844: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t09  ; orig: C - - - - - 0x012856 04:A846: 85 06     STA ram_0006_t09
    MOVE.B  ram_04E7,D2  ; orig: C - - - - - 0x012858 04:A848: AC E7 04  LDY ram_04E7
    MOVEA.L #tbl_A81B,A0
    MOVE.B  (A0,D2.L),D1

b04_bra_A84E_loop:  ; orig: b04_bra_A84E_loop:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01285E 04:A84E: A9 00     LDA #$00
    MOVE.B  D0,ram_0007_t05  ; orig: C - - - - - 0x012860 04:A850: 85 07     STA ram_0007_t05
b04_bra_A852_loop:  ; orig: b04_bra_A852_loop:
    MOVE.B  ram_counter_00_27,D2  ; orig: C - - - - - 0x012862 04:A852: AC 41 03  LDY ram_counter_00_2
    MOVEA.L #tbl_bat_77AB,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012868 04:A858: A8        TAY
    MOVE.B  ram_0006_t09,D0  ; orig: C - - - - - 0x012869 04:A859: A5 06     LDA ram_0006_t09

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01286B 04:A85B: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01286C 04:A85C: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01286D 04:A85D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01286E 04:A85E: 0A        ASL
    ADD.B  #$57,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01286F 04:A85F: 69 57     ADC #$57
    MOVEA.L #ram_spr_Y,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #tbl_A809_spt_T,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_spr_T,A0
    MOVE.B  D0,(A0,D2.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x01287A 04:A86A: AD F5 04  LDA ram_invinc_enemy
    BNE     b04_bra_A871             ; BNE  ; orig: C - - - - - 0x01287D 04:A86D: D0 02     BNE b04_bra_A871
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x01287F 04:A86F: A9 03     LDA #$03
b04_bra_A871:  ; orig: b04_bra_A871:
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x012881 04:A871: 29 03     AND #$03
    MOVEA.L #ram_spr_A,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  ram_0007_t05,D0  ; orig: C - - - - - 0x012886 04:A876: A5 07     LDA ram_0007_t05

; * 08
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012888 04:A878: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012889 04:A879: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01288A 04:A87A: 0A        ASL
    ADD.B  #$74,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x01288B 04:A87B: 69 74     ADC #$74
    MOVEA.L #ram_spr_X,A0
    MOVE.B  D0,(A0,D2.L)

    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x012890 04:A880: E8        INX
    BSR     sub_bat_6E36_increase_counter_00_27             ; JSR -> BSR  ; orig: C - - - - - 0x012891 04:A881: 20 36 6E  JSR sub_bat_6E36_inc
    ADDQ.B  #1,ram_0007_t05  ; orig: C - - - - - 0x012894 04:A884: E6 07     INC ram_0007_t05
    MOVE.B  ram_0007_t05,D0  ; orig: C - - - - - 0x012896 04:A886: A5 07     LDA ram_0007_t05
    CMPI.B  #$03,D0  ; orig: C - - - - - 0x012898 04:A888: C9 03     CMP #$03
    BCC     b04_bra_A852_loop             ; BCC  ; orig: C - - - - - 0x01289A 04:A88A: 90 C6     BCC b04_bra_A852_loop
    ADDQ.B  #1,ram_0006_t09  ; orig: C - - - - - 0x01289C 04:A88C: E6 06     INC ram_0006_t09
    MOVE.B  ram_0006_t09,D0  ; orig: C - - - - - 0x01289E 04:A88E: A5 06     LDA ram_0006_t09
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x0128A0 04:A890: C9 02     CMP #$02
    BCC     b04_bra_A84E_loop             ; BCC  ; orig: C - - - - - 0x0128A2 04:A892: 90 BA     BCC b04_bra_A84E_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x0128A4 04:A894: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0128A5 04:A895: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0128B0 04:A8A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0128C0 04:A8B0: FF        .byte $FF, $FF, $FF,



tbl_A8C0_pos_X:  ; orig: tbl_A8C0_pos_X:
    ; [DIRECTIVE] .BYTE $78  -- needs manual handling  ; orig: - D 1 - - - 0x0128D0 04:A8C0: 78        .byte $78   ; 01
    ; [DIRECTIVE] .BYTE $60  -- needs manual handling  ; orig: - D 1 - - - 0x0128D1 04:A8C1: 60        .byte $60   ; 02
    ; [DIRECTIVE] .BYTE $70  -- needs manual handling  ; orig: - D 1 - - - 0x0128D2 04:A8C2: 70        .byte $70   ; 03
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x0128D3 04:A8C3: 80        .byte $80   ; 04
    ; [DIRECTIVE] .BYTE $90  -- needs manual handling  ; orig: - D 1 - - - 0x0128D4 04:A8C4: 90        .byte $90   ; 05



tbl_A8C5_pos_Y:  ; orig: tbl_A8C5_pos_Y:
    ; [DIRECTIVE] .BYTE $88  -- needs manual handling  ; orig: - D 1 - - - 0x0128D5 04:A8C5: 88        .byte $88   ; 01
    ; [DIRECTIVE] .BYTE $B5  -- needs manual handling  ; orig: - D 1 - - - 0x0128D6 04:A8C6: B5        .byte $B5   ; 02
    ; [DIRECTIVE] .BYTE $9D  -- needs manual handling  ; orig: - D 1 - - - 0x0128D7 04:A8C7: 9D        .byte $9D   ; 03
    ; [DIRECTIVE] .BYTE $9D  -- needs manual handling  ; orig: - D 1 - - - 0x0128D8 04:A8C8: 9D        .byte $9D   ; 04
    ; [DIRECTIVE] .BYTE $B5  -- needs manual handling  ; orig: - D 1 - - - 0x0128D9 04:A8C9: B5        .byte $B5   ; 05



ofs_005_0x0128DA_37:  ; orig: ofs_005_0x0128DA_37:

; con_obj_id_37
    MOVE.B  #$05,D1  ; orig: C - - J - - 0x0128DA 04:A8CA: A2 05     LDX #$05
b04_bra_A8CC_loop:  ; orig: b04_bra_A8CC_loop:
    MOVEA.L #$FFA8BF,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0128DC 04:A8CC: BD BF A8  LDA tbl_A8C0_pos_X -
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #$FFA8C4,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0128E1 04:A8D1: BD C4 A8  LDA tbl_A8C5_pos_Y -
    MOVE.B  (A0,D1.L),D0  ; ^
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_obj_id_3F,D0  ; orig: C - - - - - 0x0128E6 04:A8D6: A9 3F     LDA #con_obj_id_3F
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0128E8 04:A8D8: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x0128EB 04:A8DB: CA        DEX
    BNE     b04_bra_A8CC_loop             ; BNE  ; orig: C - - - - - 0x0128EC 04:A8DC: D0 EE     BNE b04_bra_A8CC_loop
    MOVE.B  #con_obj_id_37,D0  ; orig: C - - - - - 0x0128EE 04:A8DE: A9 37     LDA #con_obj_id_37
    MOVE.B  D0,ram_obj_id_enemy  ; orig: C - - - - - 0x0128F0 04:A8E0: 8D 50 03  STA ram_obj_id_enemy
    RTS                     ; RTS  ; orig: C - - - - - 0x0128F3 04:A8E3: 60        RTS



ofs_005_0x0128F4_3A:  ; orig: ofs_005_0x0128F4_3A:

; con_obj_id_3A
ofs_005_0x0128F4_3B:  ; orig: ofs_005_0x0128F4_3B:

; con_obj_id_3B
    MOVE.B  #$09,D2  ; orig: C - - J - - 0x0128F4 04:A8E4: A0 09     LDY #$09
b04_bra_A8E6_loop:  ; orig: b04_bra_A8E6_loop:
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0128F6 04:A8E6: A9 40     LDA #$40
    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0128F8 04:A8E8: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$8D,D0  ; orig: C - - - - - 0x0128FB 04:A8EB: A9 8D     LDA #$8D
    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0128FD 04:A8ED: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012900 04:A8F0: A9 00     LDA #$00    ; con_di
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012902 04:A8F2: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0406,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012905 04:A8F5: 99 06 04  STA ram_0405_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #$FF0493,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012908 04:A8F8: 99 93 04  STA ram_0492_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  ram_attr_enemy,D0  ; orig: C - - - - - 0x01290B 04:A8FB: AD C0 04  LDA ram_attr_enemy
    MOVEA.L #ram_attr_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x012911 04:A901: AD 86 04  LDA ram_hp_ememy - $
    MOVEA.L #$FF0486,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012914 04:A904: 99 86 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x012917 04:A907: AD 50 03  LDA ram_obj_id_enemy
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01291D 04:A90D: 88        DEY
    BPL     b04_bra_A8E6_loop             ; BPL  ; orig: C - - - - - 0x01291E 04:A90E: 10 D6     BPL b04_bra_A8E6_loop
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012920 04:A910: A9 08     LDA #$08    ; con_di
    ; (empty translation for STA)  ; orig: C - - - - - 0x012922 04:A912: 85 9D     STA ram_dir_enemy + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x012924 04:A914: 8D 85 03  STA ram_0380_enemy +
    ; (empty translation for STA)  ; orig: C - - - - - 0x012927 04:A917: 85 A2     STA ram_dir_enemy + 
    ; (empty translation for STA)  ; orig: C - - - - - 0x012929 04:A919: 8D 8A 03  STA ram_0380_enemy +
    MOVE.B  ram_obj_id_enemy,D0  ; orig: C - - - - - 0x01292C 04:A91C: AD 50 03  LDA ram_obj_id_enemy
    MOVE.B  D0,ram_04E7  ; orig: C - - - - - 0x01292F 04:A91F: 8D E7 04  STA ram_04E7
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012932 04:A922: 38        SEC
    SUB.B  #$39,D0       ; SBC imm  ; orig: C - - - - - 0x012933 04:A923: E9 39     SBC #$39
    MOVE.B  D0,ram_04E6  ; orig: C - - - - - 0x012935 04:A925: 8D E6 04  STA ram_04E6
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012938 04:A928: A9 08     LDA #$08
    MOVE.B  D0,ram_enemy_cnt  ; orig: C - - - - - 0x01293A 04:A92A: 8D 4E 03  STA ram_enemy_cnt
    RTS                     ; RTS  ; orig: C - - - - - 0x01293D 04:A92D: 60        RTS



ofs_005_0x01293E_47:  ; orig: ofs_005_0x01293E_47:

; con_obj_id_47
ofs_005_0x01293E_48:  ; orig: ofs_005_0x01293E_48:

; con_obj_id_48
    MOVE.B  #$FE,D0  ; orig: C - - J - - 0x01293E 04:A92E: A9 FE     LDA #$FE
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$80,D0  ; orig: C - - - - - 0x012943 04:A933: A9 80     LDA #$80
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$70,D0  ; orig: C - - - - - 0x012947 04:A937: A9 70     LDA #$70
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01294B 04:A93B: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$1F,D0  ; orig: C - - - - - 0x01294F 04:A93F: A9 1F     LDA #$1F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$40,D0  ; orig: C - - - - - 0x012954 04:A944: A9 40     LDA #$40    ; con_sf
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x012956 04:A946: 8D D1 04  STA ram_04D1
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x012959 04:A949: 8D 01 06  STA ram_sfx_1
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01295C 04:A94C: A9 FF     LDA #$FF
    MOVEA.L #$FF0029,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x01295E 04:A94E: 95 29     STA ram_timer_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #con_obj_id_25,D0  ; orig: C - - - - - 0x012960 04:A950: A9 25     LDA #con_obj_id_25
    MOVE.B  ram_obj_id_enemy,D2  ; orig: C - - - - - 0x012962 04:A952: AC 50 03  LDY ram_obj_id_enemy
    CMPI.B  #$47,D2  ; orig: C - - - - - 0x012965 04:A955: C0 47     CPY #$47
    BEQ     b04_bra_A95B             ; BEQ  ; orig: C - - - - - 0x012967 04:A957: F0 02     BEQ b04_bra_A95B
    MOVE.B  #con_obj_id_26,D0  ; orig: C - - - - - 0x012969 04:A959: A9 26     LDA #con_obj_id_26
b04_bra_A95B:  ; orig: b04_bra_A95B:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x01296B 04:A95B: A0 02     LDY #$02
    MOVE.B  D0,ram_0000_t55  ; orig: C - - - - - 0x01296D 04:A95D: 85 00     STA ram_0000_t55
b04_bra_A95F_loop:  ; orig: b04_bra_A95F_loop:
    MOVE.B  ram_0000_t55,D0  ; orig: C - - - - - 0x01296F 04:A95F: A5 00     LDA ram_0000_t55
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012971 04:A961: 99 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVE.B  #$FE,D0  ; orig: C - - - - - 0x012974 04:A964: A9 FE     LDA #$FE
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012979 04:A969: C8        INY
    CMPI.B  #$0A,D2  ; orig: C - - - - - 0x01297A 04:A96A: C0 0A     CPY #$0A
    BNE     b04_bra_A95F_loop             ; BNE  ; orig: C - - - - - 0x01297C 04:A96C: D0 F1     BNE b04_bra_A95F_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x01297E 04:A96E: 60        RTS



ofs_005_0x01297F_3E:  ; orig: ofs_005_0x01297F_3E:

; con_obj_id_3E
    MOVE.B  #$FA,D0  ; orig: C - - J - - 0x01297F 04:A96F: A9 FA     LDA #$FA
    MOVEA.L #ram_04B2_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$40,D0  ; orig: C - - - - - 0x012984 04:A974: A9 40     LDA #$40    ; con_ob
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x012986 04:A976: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x012988 04:A978: 85 28     STA ram_timer_link
    MOVE.B  #con_sfx_1_02,D0  ; orig: C - - - - - 0x01298A 04:A97A: A9 02     LDA #con_sfx_1_02
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x01298C 04:A97C: 8D 01 06  STA ram_sfx_1
    MOVE.B  #con_sfx_1_10,D0  ; orig: C - - - - - 0x01298F 04:A97F: A9 10     LDA #con_sfx_1_10
    BSR     sub_bat_6D7C_set_sfx_1             ; JSR -> BSR  ; orig: C - - - - - 0x012991 04:A981: 20 7C 6D  JSR sub_bat_6D7C_set
    JMP     loc_0x01FEE6  ; orig: C - - - - - 0x012994 04:A984: 4C D6 FE  JMP loc_0x01FEE6



ofs_004_0x012997_37:  ; orig: ofs_004_0x012997_37:

; con_obj_id_37

; in

; X = 01+
    BSR     sub_bat_79CA             ; JSR -> BSR  ; orig: C - - J - - 0x012997 04:A987: 20 CA 79  JSR sub_bat_79CA
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A9B8             ; BNE  ; orig: C - - - - - 0x01299C 04:A98C: D0 2A     BNE b04_bra_A9B8
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x01299E 04:A98E: A5 70     LDA ram_pos_X_link
    CMPI.B  #$70,D0  ; orig: C - - - - - 0x0129A0 04:A990: C9 70     CMP #$70
    BCC     b04_bra_A9B7_RTS             ; BCC  ; orig: C - - - - - 0x0129A2 04:A992: 90 23     BCC b04_bra_A9B7_RTS
    CMPI.B  #$81,D0  ; orig: C - - - - - 0x0129A4 04:A994: C9 81     CMP #$81
    BCS     b04_bra_A9B7_RTS             ; BCS  ; orig: C - - - - - 0x0129A6 04:A996: B0 1F     BCS b04_bra_A9B7_RTS
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x0129A8 04:A998: A5 84     LDA ram_pos_Y_link
    CMPI.B  #$95,D0  ; orig: C - - - - - 0x0129AA 04:A99A: C9 95     CMP #$95
    BNE     b04_bra_A9B7_RTS             ; BNE  ; orig: C - - - - - 0x0129AC 04:A99C: D0 19     BNE b04_bra_A9B7_RTS
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0129AE 04:A99E: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x0129B0 04:A9A0: A9 40     LDA #con_obj_state_f
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x0129B2 04:A9A2: 85 AC     STA ram_state_link
    MOVE.B  #$88,D0  ; orig: C - - - - - 0x0129B4 04:A9A4: A9 88     LDA #$88
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x0129B6 04:A9A6: 85 70     STA ram_pos_X_link
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x0129B8 04:A9A8: 85 84     STA ram_pos_Y_link
    MOVE.B  #con_dir_Left,D0  ; orig: C - - - - - 0x0129BA 04:A9AA: A9 02     LDA #con_dir_Left
    MOVE.B  D0,ram_dir_link  ; orig: C - - - - - 0x0129BC 04:A9AC: 85 98     STA ram_dir_link
    MOVE.B  #con_music_quest_complete,D0  ; orig: C - - - - - 0x0129BE 04:A9AE: A9 06     LDA #con_music_quest
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x0129C0 04:A9B0: 8D 00 06  STA ram_music
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x0129C3 04:A9B3: A9 80     LDA #$80
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_A9B7_RTS:  ; orig: b04_bra_A9B7_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0129C7 04:A9B7: 60        RTS
b04_bra_A9B8:  ; orig: b04_bra_A9B8:
    BSR     sub_0x01F239             ; JSR -> BSR  ; orig: C - - - - - 0x0129C8 04:A9B8: 20 29 F2  JSR sub_0x01F239
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_A9B7_RTS             ; BNE  ; orig: C - - - - - 0x0129CD 04:A9BD: D0 F8     BNE b04_bra_A9B7_RTS

; A = 00    con_obj_state_00
    MOVE.B  D0,ram_0011_screen_ready_flag  ; orig: C - - - - - 0x0129CF 04:A9BF: 85 11     STA ram_0011_screen_
    MOVE.B  D0,ram_subscript  ; orig: C - - - - - 0x0129D1 04:A9C1: 85 13     STA ram_subscript
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x0129D3 04:A9C3: 85 AC     STA ram_state_link
    MOVE.B  #con_script_final_credits,D0  ; orig: C - - - - - 0x0129D5 04:A9C5: A9 13     LDA #con_script_fina
    MOVE.B  D0,ram_script  ; orig: C - - - - - 0x0129D7 04:A9C7: 85 12     STA ram_script
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x0129D9 04:A9C9: A9 20     LDA #$20
    MOVE.B  D0,ram_007C  ; orig: C - - - - - 0x0129DB 04:A9CB: 85 7C     STA ram_007C
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0129DD 04:A9CD: A9 01     LDA #$01
    ; (empty translation for STA)  ; orig: C - - - - - 0x0129DF 04:A9CF: 85 7D     STA ram_007C + $01
    MOVE.B  #$24,D0  ; orig: C - - - - - 0x0129E1 04:A9D1: A9 24     LDA #$24
    MOVE.B  D0,ram_000A_t05_tile  ; orig: C - - - - - 0x0129E3 04:A9D3: 85 0A     STA ram_000A_t05_til
    JMP     loc_0x01E8E8  ; orig: C - - - - - 0x0129E5 04:A9D5: 4C D8 E8  JMP loc_0x01E8E8



ofs_004_0x0129E8_3F:  ; orig: ofs_004_0x0129E8_3F:

; con_obj_id_3F

; in

; X = 01+
    MOVE.B  #$06,D0  ; orig: C - - J - - 0x0129E8 04:A9D8: A9 06     LDA #$06
    BSR     sub_8476             ; JSR -> BSR  ; orig: C - - - - - 0x0129EA 04:A9DA: 20 76 84  JSR sub_8476
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x0129ED 04:A9DD: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A9EA_RTS             ; BEQ  ; orig: C - - - - - 0x0129F3 04:A9E3: F0 05     BEQ b04_bra_A9EA_RTS
sub_A9E5:  ; orig: sub_A9E5:
    MOVE.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x0129F5 04:A9E5: A9 5D     LDA #con_obj_id_5D
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x0129F7 04:A9E7: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_A9EA_RTS:  ; orig: b04_bra_A9EA_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0129FA 04:A9EA: 60        RTS



ofs_004_0x0129FB_3A:  ; orig: ofs_004_0x0129FB_3A:

; con_obj_id_3A
ofs_004_0x0129FB_3B:  ; orig: ofs_004_0x0129FB_3B:

; con_obj_id_3B

; in

; X = 01+
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A9EA_RTS             ; BEQ  ; orig: C - - - - - 0x0129FD 04:A9ED: F0 FB     BEQ b04_bra_A9EA_RTS
    MOVE.B  ram_item_clock,D0  ; orig: C - - - - - 0x0129FF 04:A9EF: AD 6C 06  LDA ram_item_clock
    BNE     b04_bra_AA02             ; BNE  ; orig: C - - - - - 0x012A02 04:A9F2: D0 0E     BNE b04_bra_AA02
    BSR     sub_AB24             ; JSR -> BSR  ; orig: C - - - - - 0x012A04 04:A9F4: 20 24 AB  JSR sub_AB24
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012A07 04:A9F7: E0 05     CPX #$05
    BEQ     b04_bra_A9FF             ; BEQ  ; orig: C - - - - - 0x012A09 04:A9F9: F0 04     BEQ b04_bra_A9FF
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x012A0B 04:A9FB: E0 0A     CPX #$0A
    BNE     b04_bra_AA02             ; BNE  ; orig: C - - - - - 0x012A0D 04:A9FD: D0 03     BNE b04_bra_AA02
b04_bra_A9FF:  ; orig: b04_bra_A9FF:
    BSR     sub_AA70             ; JSR -> BSR  ; orig: C - - - - - 0x012A0F 04:A9FF: 20 70 AA  JSR sub_AA70
b04_bra_AA02:  ; orig: b04_bra_AA02:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012A14 04:AA04: 48        PHA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012A15 04:AA05: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012A16 04:AA06: 69 04     ADC #$04
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_04E6,D0  ; orig: C - - - - - 0x012A1A 04:AA0A: AD E6 04  LDA ram_04E6
    EORI.B  #$03,D0  ; orig: C - - - - - 0x012A1D 04:AA0D: 49 03     EOR #$03
    MOVE.B  D0,ram_0003_t16_spr_A  ; orig: C - - - - - 0x012A1F 04:AA0F: 85 03     STA ram_0003_t16_spr
    MOVE.B  #$9E,D0  ; orig: C - - - - - 0x012A21 04:AA11: A9 9E     LDA #$9E
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012A23 04:AA13: E0 05     CPX #$05
    BEQ     b04_bra_AA1D             ; BEQ  ; orig: C - - - - - 0x012A25 04:AA15: F0 06     BEQ b04_bra_AA1D
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x012A27 04:AA17: E0 0A     CPX #$0A
    BEQ     b04_bra_AA1D             ; BEQ  ; orig: C - - - - - 0x012A29 04:AA19: F0 02     BEQ b04_bra_AA1D
    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x012A2B 04:AA1B: A9 A0     LDA #$A0
b04_bra_AA1D:  ; orig: b04_bra_AA1D:
    BSR     sub_bat_7991             ; JSR -> BSR  ; orig: C - - - - - 0x012A2D 04:AA1D: 20 91 79  JSR sub_bat_7991
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012A30 04:AA20: 68        PLA
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012A35 04:AA25: 48        PHA
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x012A36 04:AA26: 20 D0 79  JSR sub_bat_79D0
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012A39 04:AA29: 68        PLA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_A9EA_RTS             ; BEQ  ; orig: C - - - - - 0x012A3F 04:AA2F: F0 B9     BEQ b04_bra_A9EA_RTS
    BSR     sub_0x01EEF4             ; JSR -> BSR  ; orig: C - - - - - 0x012A41 04:AA31: 20 E4 EE  JSR sub_0x01EEF4
    MOVE.B  #$20,D0  ; orig: C - - - - - 0x012A44 04:AA34: A9 20     LDA #$20
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A46 04:AA36: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVE.B  #$FF,D2  ; orig: C - - - - - 0x012A49 04:AA39: A0 FF     LDY #$FF
    CMPI.B  #$06,D1  ; orig: C - - - - - 0x012A4B 04:AA3B: E0 06     CPX #$06
    BCC     b04_bra_AA41             ; BCC  ; orig: C - - - - - 0x012A4D 04:AA3D: 90 02     BCC b04_bra_AA41
    MOVE.B  #$04,D2  ; orig: C - - - - - 0x012A4F 04:AA3F: A0 04     LDY #$04
b04_bra_AA41:  ; orig: b04_bra_AA41:
b04_bra_AA41_loop:  ; orig: b04_bra_AA41_loop:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012A51 04:AA41: C8        INY
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  (A0,D2.L),D0

    CMP.B   ram_04E7,D0  ; orig: C - - - - - 0x012A55 04:AA45: CD E7 04  CMP ram_04E7
    BNE     b04_bra_AA41_loop             ; BNE  ; orig: C - - - - - 0x012A58 04:AA48: D0 F7     BNE b04_bra_AA41_loop
    MOVE.B  #$11,D0  ; orig: C - - - - - 0x012A5A 04:AA4A: A9 11     LDA #$11
    MOVEA.L #$FF0029,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A5C 04:AA4C: 99 29 00  STA ram_timer_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF04F1,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A62 04:AA52: 99 F1 04  STA ram_invinc_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0071,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A67 04:AA57: 99 71 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0085,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A6C 04:AA5C: 99 85 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    CMPI.B  #$04,D2  ; orig: C - - - - - 0x012A6F 04:AA5F: C0 04     CPY #$04
    BEQ     b04_bra_A9EA_RTS             ; BEQ  ; orig: C - - - - - 0x012A71 04:AA61: F0 87     BEQ b04_bra_A9EA_RTS
    CMPI.B  #$09,D2  ; orig: C - - - - - 0x012A73 04:AA63: C0 09     CPY #$09
    BEQ     b04_bra_A9EA_RTS             ; BEQ  ; orig: C - - - - - 0x012A75 04:AA65: F0 83     BEQ b04_bra_A9EA_RTS
    MOVE.B  #con_obj_id_5D,D0  ; orig: C - - - - - 0x012A77 04:AA67: A9 5D     LDA #con_obj_id_5D
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    JMP     loc_0x01FEEA  ; orig: C - - - - - 0x012A7C 04:AA6C: 4C DA FE  JMP loc_0x01FEEA
b04_bra_AA6F_RTS:  ; orig: b04_bra_AA6F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012A7F 04:AA6F: 60        RTS



sub_AA70:  ; orig: sub_AA70:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$07,D0  ; orig: C - - - - - 0x012A82 04:AA72: 29 07     AND #$07
    BNE     b04_bra_AA6F_RTS             ; BNE  ; orig: C - - - - - 0x012A84 04:AA74: D0 F9     BNE b04_bra_AA6F_RTS
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012A88 04:AA78: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012A89 04:AA79: 69 03     ADC #$03
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x012A8B 04:AA7B: 29 07     AND #$07
    BNE     b04_bra_AA6F_RTS             ; BNE  ; orig: C - - - - - 0x012A8D 04:AA7D: D0 F0     BNE b04_bra_AA6F_RTS
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x012A8F 04:AA7F: A9 04     LDA #$04
    MOVE.B  D0,ram_0000_t56_loop_counter  ; orig: C - - - - - 0x012A91 04:AA81: 85 00     STA ram_0000_t56_loo
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012A93 04:AA83: A0 00     LDY #$00
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012A95 04:AA85: E0 05     CPX #$05
    BEQ     b04_bra_AA8B             ; BEQ  ; orig: C - - - - - 0x012A97 04:AA87: F0 02     BEQ b04_bra_AA8B
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x012A99 04:AA89: A0 05     LDY #$05
b04_bra_AA8B:  ; orig: b04_bra_AA8B:
b04_bra_AA8B_loop:  ; orig: b04_bra_AA8B_loop:
    MOVEA.L #$FF009A,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012A9B 04:AA8B: B9 9A 00  LDA ram_dir_enemy +
    MOVE.B  (A0,D2.L),D0  ; ^
    MOVEA.L #$FF0099,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012A9E 04:AA8E: 99 99 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012AA1 04:AA91: C8        INY
    SUBQ.B  #1,ram_0000_t56_loop_counter  ; orig: C - - - - - 0x012AA2 04:AA92: C6 00     DEC ram_0000_t56_loo
    BNE     b04_bra_AA8B_loop             ; BNE  ; orig: C - - - - - 0x012AA4 04:AA94: D0 F5     BNE b04_bra_AA8B_loop
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x012AA8 04:AA98: 29 0F     AND #$0F
    BNE     b04_bra_AAF9_RTS             ; BNE  ; orig: C - - - - - 0x012AAA 04:AA9A: D0 5D     BNE b04_bra_AAF9_RTS
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012AAE 04:AA9E: 18        CLC
    ADD.B  #$03,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012AAF 04:AA9F: 69 03     ADC #$03
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x012AB1 04:AAA1: 29 0F     AND #$0F
    BNE     b04_bra_AAF9_RTS             ; BNE  ; orig: C - - - - - 0x012AB3 04:AAA3: D0 54     BNE b04_bra_AAF9_RTS
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012AB7 04:AAA7: 4A        LSR
    ANDI.B  #$05,D0  ; orig: C - - - - - 0x012AB8 04:AAA8: 29 05     AND #$05    ; con_di
    MOVE.B  D0,ram_0000_t57  ; orig: C - - - - - 0x012ABA 04:AAAA: 85 00     STA ram_0000_t57
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012ABE 04:AAAE: 0A        ASL
    ANDI.B  #$0A,D0  ; orig: C - - - - - 0x012ABF 04:AAAF: 29 0A     AND #$0A    ; con_di
    OR.B    ram_0000_t57,D0  ; orig: C - - - - - 0x012AC1 04:AAB1: 05 00     ORA ram_0000_t57
    EORI.B  #$0F,D0  ; orig: C - - - - - 0x012AC3 04:AAB3: 49 0F     EOR #$0F
    MOVE.B  D0,ram_050F  ; orig: C - - - - - 0x012AC5 04:AAB5: 8D 0F 05  STA ram_050F
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$80,D0  ; orig: C - - - - - 0x012ACA 04:AABA: C9 80     CMP #$80
    BCC     b04_bra_AAFA             ; BCC  ; orig: C - - - - - 0x012ACC 04:AABC: 90 3C     BCC b04_bra_AAFA
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x012AD0 04:AAC0: B4 19     LDY ram_indiv_random
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #$80,D2  ; orig: C - - - - - 0x012AD2 04:AAC2: C0 80     CPY #$80
    BCS     b04_bra_AAD8             ; BCS  ; orig: C - - - - - 0x012AD4 04:AAC4: B0 12     BCS b04_bra_AAD8
b04_bra_AAC6:  ; orig: b04_bra_AAC6:
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012AD6 04:AAC6: 4A        LSR
    BCC     b04_bra_AACB             ; BCC  ; orig: C - - - - - 0x012AD7 04:AAC7: 90 02     BCC b04_bra_AACB
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012AD9 04:AAC9: A9 08     LDA #$08
b04_bra_AACB:  ; orig: b04_bra_AACB:
    BTST    D0,ram_050F  ; BIT abs  ; orig: C - - - - - 0x012ADB 04:AACB: 2C 0F 05  BIT ram_050F
    BEQ     b04_bra_AAC6             ; BEQ  ; orig: C - - - - - 0x012ADE 04:AACE: F0 F6     BEQ b04_bra_AAC6
    CMPI.B  #$40,D2  ; orig: C - - - - - 0x012AE0 04:AAD0: C0 40     CPY #$40
    BCS     b04_bra_AAD8             ; BCS  ; orig: C - - - - - 0x012AE2 04:AAD2: B0 04     BCS b04_bra_AAD8
    MOVE.B  #$40,D2  ; orig: C - - - - - 0x012AE4 04:AAD4: A0 40     LDY #$40
    BCC     b04_bra_AAC6             ; BCC  ; orig: C - - - - - 0x012AE6 04:AAD6: 90 EE     BCC b04_bra_AAC6    ; jm
b04_bra_AAD8:  ; orig: b04_bra_AAD8:
loc_AAD8:  ; orig: loc_AAD8:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x012AEA 04:AADA: 85 0F     STA ram_000F_t01_dir
    BSR     sub_bat_6FB8             ; JSR -> BSR  ; orig: C - - - - - 0x012AEC 04:AADC: 20 B8 6F  JSR sub_bat_6FB8
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x012AEF 04:AADF: A5 0F     LDA ram_000F_t01_dir
    BNE     b04_bra_AAF1             ; BNE  ; orig: C - - - - - 0x012AF1 04:AAE1: D0 0E     BNE b04_bra_AAF1
b04_bra_AAE3:  ; orig: b04_bra_AAE3:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

b04_bra_AAE5:  ; orig: b04_bra_AAE5:
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012AF5 04:AAE5: 4A        LSR
    BCC     b04_bra_AAEA             ; BCC  ; orig: C - - - - - 0x012AF6 04:AAE6: 90 02     BCC b04_bra_AAEA
    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012AF8 04:AAE8: A9 08     LDA #$08
b04_bra_AAEA:  ; orig: b04_bra_AAEA:
    BTST    D0,ram_050F  ; BIT abs  ; orig: C - - - - - 0x012AFA 04:AAEA: 2C 0F 05  BIT ram_050F
    BNE     b04_bra_AAD8             ; BNE  ; orig: C - - - - - 0x012AFD 04:AAED: D0 E9     BNE b04_bra_AAD8
    BEQ     b04_bra_AAE5             ; BEQ  ; orig: C - - - - - 0x012AFF 04:AAEF: F0 F4     BEQ b04_bra_AAE5    ; jm
b04_bra_AAF1:  ; orig: b04_bra_AAF1:
    BSR     sub_0x01EE0A_find_current_collision_tile             ; JSR -> BSR  ; orig: C - - - - - 0x012B01 04:AAF1: 20 FA ED  JSR sub_0x01EE0A_fin
    CMP.B   ram_min_collision_tile,D0  ; orig: C - - - - - 0x012B04 04:AAF4: CD 4A 03  CMP ram_min_collisio
    BCS     b04_bra_AAE3             ; BCS  ; orig: C - - - - - 0x012B07 04:AAF7: B0 EA     BCS b04_bra_AAE3
b04_bra_AAF9_RTS:  ; orig: b04_bra_AAF9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012B09 04:AAF9: 60        RTS
b04_bra_AAFA:  ; orig: b04_bra_AAFA:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x012B0A 04:AAFA: A9 01     LDA #$01
    MOVE.B  D0,ram_0002_t32  ; orig: C - - - - - 0x012B0C 04:AAFC: 85 02     STA ram_0002_t32
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x012B0E 04:AAFE: A5 70     LDA ram_pos_X_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012B10 04:AB00: 38        SEC
    ; !! SBC ram_pos_X_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012B11 04:AB01: F5 70     SBC ram_pos_X_enemy,
    BCS     b04_bra_AB07             ; BCS  ; orig: C - - - - - 0x012B13 04:AB03: B0 02     BCS b04_bra_AB07
    MOVE.B  (ram_0002_t32).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t32).l  ; orig: C - - - - - 0x012B15 04:AB05: 06 02     ASL ram_0002_t32    

b04_bra_AB07:  ; orig: b04_bra_AB07:
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x012B17 04:AB07: A9 04     LDA #$04
    MOVE.B  D0,ram_0003_t12  ; orig: C - - - - - 0x012B19 04:AB09: 85 03     STA ram_0003_t12
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x012B1B 04:AB0B: A5 84     LDA ram_pos_Y_link
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012B1D 04:AB0D: 38        SEC
    ; !! SBC ram_pos_Y_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012B1E 04:AB0E: F5 84     SBC ram_pos_Y_enemy,
    BCS     b04_bra_AB14             ; BCS  ; orig: C - - - - - 0x012B20 04:AB10: B0 02     BCS b04_bra_AB14
    MOVE.B  (ram_0003_t12).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0003_t12).l  ; orig: C - - - - - 0x012B22 04:AB12: 06 03     ASL ram_0003_t12    

b04_bra_AB14:  ; orig: b04_bra_AB14:
    MOVE.B  ram_0002_t32,D0  ; orig: C - - - - - 0x012B24 04:AB14: A5 02     LDA ram_0002_t32
    BTST    D0,ram_050F  ; BIT abs  ; orig: C - - - - - 0x012B26 04:AB16: 2C 0F 05  BIT ram_050F
    BEQ     b04_bra_AB1F             ; BEQ  ; orig: C - - - - - 0x012B29 04:AB19: F0 04     BEQ b04_bra_AB1F
    BTST    D0,ram_dir_link  ; BIT abs  ; orig: C - - - - - 0x012B2B 04:AB1B: 24 98     BIT ram_dir_link
    BNE     b04_bra_AB21             ; BNE  ; orig: C - - - - - 0x012B2D 04:AB1D: D0 02     BNE b04_bra_AB21
b04_bra_AB1F:  ; orig: b04_bra_AB1F:
    MOVE.B  ram_0003_t12,D0  ; orig: C - - - - - 0x012B2F 04:AB1F: A5 03     LDA ram_0003_t12
b04_bra_AB21:  ; orig: b04_bra_AB21:
    JMP     loc_AAD8  ; orig: C - - - - - 0x012B31 04:AB21: 4C D8 AA  JMP loc_AAD8



sub_AB24:  ; orig: sub_AB24:
    MOVE.B  #$A1,D0  ; orig: C - - - - - 0x012B34 04:AB24: A9 A1     LDA #$A1
    MOVE.B  D0,ram_0002_t33  ; orig: C - - - - - 0x012B36 04:AB26: 85 02     STA ram_0002_t33
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BTST    D0,ram_0002_t33  ; BIT abs  ; orig: C - - - - - 0x012B3A 04:AB2A: 24 02     BIT ram_0002_t33
    BEQ     b04_bra_AB36             ; BEQ  ; orig: C - - - - - 0x012B3C 04:AB2C: F0 08     BEQ b04_bra_AB36
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012B40 04:AB30: 18        CLC
    MOVE.B  ram_04E6,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x012B41 04:AB31: 6D E6 04  ADC ram_04E6

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AB36:  ; orig: b04_bra_AB36:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t33).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t33).l  ; orig: C - - - - - 0x012B48 04:AB38: 06 02     ASL ram_0002_t33    

    BTST    D0,ram_0002_t33  ; BIT abs  ; orig: C - - - - - 0x012B4A 04:AB3A: 24 02     BIT ram_0002_t33
    BEQ     b04_bra_AB45             ; BEQ  ; orig: C - - - - - 0x012B4C 04:AB3C: F0 07     BEQ b04_bra_AB45
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_04E6,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x012B50 04:AB40: ED E6 04  SBC ram_04E6

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AB45:  ; orig: b04_bra_AB45:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t33).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t33).l  ; orig: C - - - - - 0x012B57 04:AB47: 06 02     ASL ram_0002_t33    

    BTST    D0,ram_0002_t33  ; BIT abs  ; orig: C - - - - - 0x012B59 04:AB49: 24 02     BIT ram_0002_t33
    BEQ     b04_bra_AB54             ; BEQ  ; orig: C - - - - - 0x012B5B 04:AB4B: F0 07     BEQ b04_bra_AB54
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_04E6,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x012B5F 04:AB4F: 6D E6 04  ADC ram_04E6

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AB54:  ; orig: b04_bra_AB54:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  (ram_0002_t33).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t33).l  ; orig: C - - - - - 0x012B66 04:AB56: 06 02     ASL ram_0002_t33    

    BTST    D0,ram_0002_t33  ; BIT abs  ; orig: C - - - - - 0x012B68 04:AB58: 24 02     BIT ram_0002_t33
    BEQ     b04_bra_AB63_RTS             ; BEQ  ; orig: C - - - - - 0x012B6A 04:AB5A: F0 07     BEQ b04_bra_AB63_RTS
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_04E6,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x012B6E 04:AB5E: ED E6 04  SBC ram_04E6

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AB63_RTS:  ; orig: b04_bra_AB63_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012B73 04:AB63: 60        RTS



tbl_AB64:  ; orig: tbl_AB64:
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x012B74 04:AB64: FF        .byte $FF   ; 00
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - - - - - - 0x012B75 04:AB65: 50        .byte $50   ; 01



ofs_004_0x012B76_47:  ; orig: ofs_004_0x012B76_47:

; con_obj_id_47
ofs_004_0x012B76_48:  ; orig: ofs_004_0x012B76_48:

; con_obj_id_48

; in

; X = 01+
    BSR     sub_ABAE             ; JSR -> BSR  ; orig: C - - J - - 0x012B76 04:AB66: 20 AE AB  JSR sub_ABAE
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012B79 04:AB69: A9 00     LDA #$00
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x012B81 04:AB71: 20 88 B2  JSR sub_B288
    MOVE.B  #$02,D0  ; orig: C - - - - - 0x012B84 04:AB74: A9 02     LDA #$02
    BSR     sub_8476             ; JSR -> BSR  ; orig: C - - - - - 0x012B86 04:AB76: 20 76 84  JSR sub_8476
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x012B89 04:AB79: A0 08     LDY #$08
b04_bra_AB7B_loop:  ; orig: b04_bra_AB7B_loop:
    MOVEA.L #ram_obj_id_enemy,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #con_obj_id_25,D0  ; orig: C - - - - - 0x012B8E 04:AB7E: C9 25     CMP #con_obj_id_25
    BEQ     b04_bra_AB95_is_among_them             ; BEQ  ; orig: C - - - - - 0x012B90 04:AB80: F0 13     BEQ bra_AB95_is_amon
    CMPI.B  #con_obj_id_26,D0  ; orig: C - - - - - 0x012B92 04:AB82: C9 26     CMP #con_obj_id_26
    BEQ     b04_bra_AB95_is_among_them             ; BEQ  ; orig: C - - - - - 0x012B94 04:AB84: F0 0F     BEQ bra_AB95_is_amon
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012B96 04:AB86: 88        DEY
    BNE     b04_bra_AB7B_loop             ; BNE  ; orig: C - - - - - 0x012B97 04:AB87: D0 F2     BNE b04_bra_AB7B_loop
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x012B99 04:AB89: 20 D0 79  JSR sub_bat_79D0
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x012B9C 04:AB8C: 20 00 80  JSR sub_8000
    BSR     sub_800D             ; JSR -> BSR  ; orig: C - - - - - 0x012B9F 04:AB8F: 20 0D 80  JSR sub_800D
    JMP     loc_AB98  ; orig: C - - - - - 0x012BA2 04:AB92: 4C 98 AB  JMP loc_AB98
b04_bra_AB95_is_among_them:  ; orig: b04_bra_AB95_is_among_them:
    BSR     sub_bat_7AA7             ; JSR -> BSR  ; orig: C - - - - - 0x012BA5 04:AB95: 20 A7 7A  JSR sub_bat_7AA7
loc_AB98:  ; orig: loc_AB98:
    MOVEA.L #$FF0029,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C D 1 - - - 0x012BA8 04:AB98: B5 29     LDA ram_timer_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    ; !! ORA ram_0394_enemy + $03 - needs manual review  ; orig: C - - - - - 0x012BAA 04:AB9A: 0D 97 03  ORA ram_0394_enemy +
    BNE     b04_bra_ABAD_RTS             ; BNE  ; orig: C - - - - - 0x012BAD 04:AB9D: D0 0E     BNE b04_bra_ABAD_RTS
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  (A0,D1.L),D0

    EORI.B  #$01,D0  ; orig: C - - - - - 0x012BB2 04:ABA2: 49 01     EOR #$01
    MOVEA.L #ram_045E_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x012BB7 04:ABA7: 98        TYA
    MOVEA.L #tbl_AB64,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #$FF0029,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012BBB 04:ABAB: 95 29     STA ram_timer_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
b04_bra_ABAD_RTS:  ; orig: b04_bra_ABAD_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012BBD 04:ABAD: 60        RTS



sub_ABAE:  ; orig: sub_ABAE:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x012BC1 04:ABB1: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - D 1 - I - 0x012BC4 04:ABB4: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_ABBC_01  -- needs manual handling  ; orig: - D 1 - I - 0x012BC6 04:ABB6: BC AB     .word ofs_030_ABBC_0
    ; [DIRECTIVE] .WORD ofs_030_B308_02  -- needs manual handling  ; orig: - D 1 - I - 0x012BC8 04:ABB8: 08 B3     .word ofs_030_B308_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - D 1 - I - 0x012BCA 04:ABBA: 78 B3     .word ofs_030_B378_0



ofs_030_ABBC_01:  ; orig: ofs_030_ABBC_01:
    MOVE.B  #$02,D2  ; orig: C - - J - - 0x012BCC 04:ABBC: A0 02     LDY #$02
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$40,D0  ; orig: C - - - - - 0x012BD0 04:ABC0: C9 40     CMP #$40
    BCS     b04_bra_ABC5             ; BCS  ; orig: C - - - - - 0x012BD2 04:ABC2: B0 01     BCS b04_bra_ABC5
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012BD4 04:ABC4: C8        INY
b04_bra_ABC5:  ; orig: b04_bra_ABC5:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x012BD5 04:ABC5: 98        TYA
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012BD9 04:ABC9: A9 08     LDA #$08
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x012BDE 04:ABCE: 60        RTS



tbl_ABCF:  ; orig: tbl_ABCF:
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - - - 0x012BDF 04:ABCF: 14        .byte $14   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012BE0 04:ABD0: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $0C  -- needs manual handling  ; orig: - D 1 - - - 0x012BE1 04:ABD1: 0C        .byte $0C   ; 02
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x012BE2 04:ABD2: 08        .byte $08   ; 03
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012BE3 04:ABD3: 04        .byte $04   ; 04
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012BE4 04:ABD4: 00        .byte $00   ; 05
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - - - 0x012BE5 04:ABD5: 1C        .byte $1C   ; 06



tbl_ABD6:  ; orig: tbl_ABD6:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012BE6 04:ABD6: 06        .byte $06   ;
tbl_ABD7:  ; orig: tbl_ABD7:
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x012BE7 04:ABD7: 05        .byte $05   ;
tbl_ABD8:  ; orig: tbl_ABD8:
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012BE8 04:ABD8: 06        .byte $06   ;
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012BE9 04:ABD9: 06        .byte $06   ;



ofs_004_0x012BEA_25:  ; orig: ofs_004_0x012BEA_25:

; con_obj_id_25
ofs_004_0x012BEA_26:  ; orig: ofs_004_0x012BEA_26:

; con_obj_id_26

; in

; X = 01+
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AC1D             ; BNE  ; orig: C - - - - - 0x012BEC 04:ABDC: D0 3F     BNE b04_bra_AC1D
    CMPI.B  #$02,D1  ; orig: C - - - - - 0x012BEE 04:ABDE: E0 02     CPX #$02
    BEQ     b04_bra_ABF3             ; BEQ  ; orig: C - - - - - 0x012BF0 04:ABE0: F0 11     BEQ b04_bra_ABF3
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012BF2 04:ABE2: A5 AE     LDA ram_state_obj + 
    BEQ     b04_bra_AC1C_RTS             ; BEQ  ; orig: C - - - - - 0x012BF4 04:ABE4: F0 36     BEQ b04_bra_AC1C_RTS
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x012BF6 04:ABE6: 8A        TXA
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012BF7 04:ABE7: 38        SEC
    SUB.B  #$03,D0       ; SBC imm  ; orig: C - - - - - 0x012BF8 04:ABE8: E9 03     SBC #$03
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012BFA 04:ABEA: A8        TAY
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012BFB 04:ABEB: AD 96 03  LDA ram_0394_enemy +
    MOVEA.L #tbl_ABCF,A0
    CMP.B  (A0,D2.L),D0

    BNE     b04_bra_AC1C_RTS             ; BNE  ; orig: C - - - - - 0x012C01 04:ABF1: D0 29     BNE b04_bra_AC1C_RTS
b04_bra_ABF3:  ; orig: b04_bra_ABF3:
    CMPI.B  #$09,D1  ; orig: C - - - - - 0x012C03 04:ABF3: E0 09     CPX #$09
    BNE     b04_bra_ABF9             ; BNE  ; orig: C - - - - - 0x012C05 04:ABF5: D0 02     BNE b04_bra_ABF9
    ; (empty translation for INC)  ; orig: C - - - - - 0x012C07 04:ABF7: E6 AD     INC ram_state_obj + 
b04_bra_ABF9:  ; orig: b04_bra_ABF9:
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012C09 04:ABF9: F6 AC     INC ram_state_obj,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$80,D0  ; orig: C - - - - - 0x012C0B 04:ABFB: A9 80     LDA #$80    ; ???
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$18,D0  ; orig: C - - - - - 0x012C0F 04:ABFF: A9 18     LDA #$18
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    ; (empty translation for LDA)  ; orig: C - - - - - 0x012C14 04:AC04: A5 71     LDA ram_pos_X_enemy 
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$2C,D0  ; orig: C - - - - - 0x012C18 04:AC08: A9 2C     LDA #$2C
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x012C1A 04:AC0A: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_25,D2  ; orig: C - - - - - 0x012C1D 04:AC0D: C0 25     CPY #con_obj_id_25
    BEQ     b04_bra_AC13             ; BEQ  ; orig: C - - - - - 0x012C1F 04:AC0F: F0 02     BEQ b04_bra_AC13
    MOVE.B  #$18,D0  ; orig: C - - - - - 0x012C21 04:AC11: A9 18     LDA #$18
b04_bra_AC13:  ; orig: b04_bra_AC13:
    MOVE.B  D0,ram_0000_t58  ; orig: C - - - - - 0x012C23 04:AC13: 85 00     STA ram_0000_t58
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012C25 04:AC15: A5 85     LDA ram_pos_Y_enemy 
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012C27 04:AC17: 38        SEC
    MOVE.B  ram_0000_t58,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x012C28 04:AC18: E5 00     SBC ram_0000_t58

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AC1C_RTS:  ; orig: b04_bra_AC1C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012C2C 04:AC1C: 60        RTS
b04_bra_AC1D:  ; orig: b04_bra_AC1D:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012C2F 04:AC1F: 18        CLC
    ; !! ADC ram_046B_enemy + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x012C30 04:AC20: 6D 6C 04  ADC ram_046B_enemy +
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012C37 04:AC27: 18        CLC
    ; !! ADC ram_0478_enemy + $01 - complex mode, manual review needed  ; orig: C - - - - - 0x012C38 04:AC28: 6D 79 04  ADC ram_0478_enemy +
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012C3D 04:AC2D: A9 00     LDA #$00
    MOVE.B  D0,ram_000B_t07_useless_00  ; orig: C - - - - - 0x012C3F 04:AC2F: 85 0B     STA ram_000B_t07_use
    MOVE.B  #$70,D0  ; orig: C - - - - - 0x012C41 04:AC31: A9 70     LDA #$70
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDY)  ; orig: C - - - - - 0x012C43 04:AC33: BC 4F 03  LDY ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D2  ; ^
    CMPI.B  #con_obj_id_25,D2  ; orig: C - - - - - 0x012C46 04:AC36: C0 25     CPY #con_obj_id_25
    BEQ     b04_bra_AC3C             ; BEQ  ; orig: C - - - - - 0x012C48 04:AC38: F0 02     BEQ b04_bra_AC3C
    MOVE.B  #$60,D0  ; orig: C - - - - - 0x012C4A 04:AC3A: A9 60     LDA #$60
b04_bra_AC3C:  ; orig: b04_bra_AC3C:
    BSR     sub_B459             ; JSR -> BSR  ; orig: C - - - - - 0x012C4C 04:AC3C: 20 59 B4  JSR sub_B459

; triggers at 69314 frame 1st quest demo, when entering a room with a blue flying bug surrounded with 8 orange smaller bugs
    ; (empty translation for LDY)  ; orig: C - - - - - 0x012C4F 04:AC3F: AC 5F 04  LDY ram_045E_enemy +
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x012C52 04:AC42: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_25,D0  ; orig: C - - - - - 0x012C55 04:AC45: C9 25     CMP #con_obj_id_25
    BNE     b04_bra_AC55             ; BNE  ; orig: C - - - - - 0x012C57 04:AC47: D0 0C     BNE b04_bra_AC55
    MOVEA.L #tbl_ABD6,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012C5C 04:AC4C: 48        PHA
    MOVEA.L #tbl_ABD8,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012C60 04:AC50: A8        TAY
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012C61 04:AC51: 68        PLA
    JMP     loc_AC59  ; orig: C - - - - - 0x012C62 04:AC52: 4C 59 AC  JMP loc_AC59
b04_bra_AC55:  ; orig: b04_bra_AC55:
    MOVEA.L #tbl_ABD7,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012C68 04:AC58: A8        TAY
loc_AC59:  ; orig: loc_AC59:
    BSR     sub_B3BD             ; JSR -> BSR  ; orig: C D 1 - - - 0x012C69 04:AC59: 20 BD B3  JSR sub_B3BD
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_AC71             ; JSR -> BSR  ; orig: C - - - - - 0x012C6E 04:AC5E: 20 71 AC  JSR sub_AC71
    ; (empty translation for LDA)  ; orig: C - - - - - 0x012C71 04:AC61: A5 AD     LDA ram_state_obj + 
    BEQ     b04_bra_AC70_RTS             ; BEQ  ; orig: C - - - - - 0x012C73 04:AC63: F0 0B     BEQ b04_bra_AC70_RTS
    BSR     sub_bat_79D0             ; JSR -> BSR  ; orig: C - - - - - 0x012C75 04:AC65: 20 D0 79  JSR sub_bat_79D0
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_AC70_RTS             ; BEQ  ; orig: C - - - - - 0x012C7B 04:AC6B: F0 03     BEQ b04_bra_AC70_RTS

; bzk optimize, JMP
    BSR     sub_A9E5             ; JSR -> BSR  ; orig: C - - - - - 0x012C7D 04:AC6D: 20 E5 A9  JSR sub_A9E5
b04_bra_AC70_RTS:  ; orig: b04_bra_AC70_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012C80 04:AC70: 60        RTS



sub_AC71:  ; orig: sub_AC71:
    BSR     sub_bat_7986             ; JSR -> BSR  ; orig: C - - - - - 0x012C81 04:AC71: 20 86 79  JSR sub_bat_7986
    BSR     sub_0x01FA99             ; JSR -> BSR  ; orig: C - - - - - 0x012C84 04:AC74: 20 89 FA  JSR sub_0x01FA99
    MOVEA.L #ram_obj_anim_id,A0
    MOVE.B  (A0,D1.L),D0

    JMP     loc_bat_77DF  ; orig: C - - - - - 0x012C8A 04:AC7A: 4C DF 77  JMP loc_bat_77DF



ofs_004_0x012C8D_3E:  ; orig: ofs_004_0x012C8D_3E:

; con_obj_id_3E

; in

; X = 01+
    MOVE.B  ram_0445,D0  ; orig: C - - J - - 0x012C8D 04:AC7D: AD 45 04  LDA ram_0445
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x012C90 04:AC80: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_AC89_00  -- needs manual handling  ; orig: - D 1 - I - 0x012C93 04:AC83: 89 AC     .word ofs_AC89_00
    ; [DIRECTIVE] .WORD ofs_ACC6_01  -- needs manual handling  ; orig: - D 1 - I - 0x012C95 04:AC85: C6 AC     .word ofs_ACC6_01
    ; [DIRECTIVE] .WORD ofs_ACE4_02  -- needs manual handling  ; orig: - D 1 - I - 0x012C97 04:AC87: E4 AC     .word ofs_ACE4_02



ofs_AC89_00:  ; orig: ofs_AC89_00:
    MOVE.B  #con_drop_id_1B,D0  ; orig: C - - J - - 0x012C99 04:AC89: A9 1B     LDA #con_drop_id_1B
    MOVE.B  D0,ram_0505  ; orig: C - - - - - 0x012C9B 04:AC8B: 8D 05 05  STA ram_0505
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x012C9E 04:AC8E: A5 28     LDA ram_timer_link
    BNE     b04_bra_ACBC             ; BNE  ; orig: C - - - - - 0x012CA0 04:AC90: D0 2A     BNE b04_bra_ACBC
    MOVE.B  D1,D0           ; TXA  ; orig: C - - - - - 0x012CA2 04:AC92: 8A        TXA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012CA3 04:AC93: 48        PHA
    BSR     sub_B1BE             ; JSR -> BSR  ; orig: C - - - - - 0x012CA4 04:AC94: 20 BE B1  JSR sub_B1BE
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012CA7 04:AC97: 68        PLA
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x012CA8 04:AC98: AA        TAX
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012CA9 04:AC99: A9 00     LDA #$00
    MOVE.B  D0,ram_051E_flag  ; orig: C - - - - - 0x012CAB 04:AC9B: 8D 1E 05  STA ram_051E_flag
    MOVE.B  ram_051C,D0  ; orig: C - - - - - 0x012CAE 04:AC9E: AD 1C 05  LDA ram_051C
    CMPI.B  #$C0,D0  ; orig: C - - - - - 0x012CB1 04:ACA1: C9 C0     CMP #$C0
    BNE     b04_bra_ACAA             ; BNE  ; orig: C - - - - - 0x012CB3 04:ACA3: D0 05     BNE b04_bra_ACAA
    MOVE.B  #con_music_boss_killed,D0  ; orig: C - - - - - 0x012CB5 04:ACA5: A9 02     LDA #con_music_boss_
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x012CB7 04:ACA7: 8D 00 06  STA ram_music
b04_bra_ACAA:  ; orig: b04_bra_ACAA:
    MOVE.B  ram_051C,D0  ; orig: C - - - - - 0x012CBA 04:ACAA: AD 1C 05  LDA ram_051C
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x012CBD 04:ACAD: 29 0F     AND #$0F
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x012CBF 04:ACAF: C9 04     CMP #$04
    BNE     b04_bra_ACDC             ; BNE  ; orig: C - - - - - 0x012CC1 04:ACB1: D0 29     BNE b04_bra_ACDC
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x012CC3 04:ACB3: A9 C0     LDA #$C0
    MOVE.B  D0,ram_timer_link  ; orig: C - - - - - 0x012CC5 04:ACB5: 85 28     STA ram_timer_link
    ADDQ.B  #1,ram_0445  ; orig: C - - - - - 0x012CC7 04:ACB7: EE 45 04  INC ram_0445
    BNE     b04_bra_ACDC             ; BNE  ; orig: C - - - - - 0x012CCA 04:ACBA: D0 20     BNE b04_bra_ACDC
b04_bra_ACBC:  ; orig: b04_bra_ACBC:
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x012CCC 04:ACBC: C9 01     CMP #$01
    BNE     b04_bra_ACC5_RTS             ; BNE  ; orig: C - - - - - 0x012CCE 04:ACBE: D0 05     BNE b04_bra_ACC5_RTS
    MOVE.B  #con_sfx_1_02,D0  ; orig: C - - - - - 0x012CD0 04:ACC0: A9 02     LDA #con_sfx_1_02
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x012CD2 04:ACC2: 8D 01 06  STA ram_sfx_1
b04_bra_ACC5_RTS:  ; orig: b04_bra_ACC5_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012CD5 04:ACC5: 60        RTS



ofs_ACC6_01:  ; orig: ofs_ACC6_01:
    MOVE.B  #con_drop_id_1B,D0  ; orig: C - - J - - 0x012CD6 04:ACC6: A9 1B     LDA #con_drop_id_1B
    MOVE.B  D0,ram_0505  ; orig: C - - - - - 0x012CD8 04:ACC8: 8D 05 05  STA ram_0505
    MOVE.B  ram_timer_link,D0  ; orig: C - - - - - 0x012CDB 04:ACCB: A5 28     LDA ram_timer_link
    BNE     b04_bra_ACDC             ; BNE  ; orig: C - - - - - 0x012CDD 04:ACCD: D0 0D     BNE b04_bra_ACDC

; A = 00    con_obj_state_00
    MOVE.B  D0,ram_state_link  ; orig: C - - - - - 0x012CDF 04:ACCF: 85 AC     STA ram_state_link
    MOVE.B  D0,ram_0505  ; orig: C - - - - - 0x012CE1 04:ACD1: 8D 05 05  STA ram_0505
    MOVE.B  #con_music_final_dungeon,D0  ; orig: C - - - - - 0x012CE4 04:ACD4: A9 20     LDA #con_music_final
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x012CE6 04:ACD6: 8D 00 06  STA ram_music
    ADDQ.B  #1,ram_0445  ; orig: C - - - - - 0x012CE9 04:ACD9: EE 45 04  INC ram_0445
b04_bra_ACDC:  ; orig: b04_bra_ACDC:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012CEC 04:ACDC: A9 00     LDA #$00
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    JMP     loc_AEB5  ; orig: C - - - - - 0x012CF1 04:ACE1: 4C B5 AE  JMP loc_AEB5



ofs_ACE4_02:  ; orig: ofs_ACE4_02:
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AD4D             ; BNE  ; orig: C - - - - - 0x012CF7 04:ACE7: D0 64     BNE b04_bra_AD4D
    BSR     sub_AEE4_trying_to_kill_ganon             ; JSR -> BSR  ; orig: C - - - - - 0x012CF9 04:ACE9: 20 E4 AE  JSR sub_AEE4_trying_
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x012CFC 04:ACEC: 20 00 80  JSR sub_8000
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AD2F             ; BNE  ; orig: C - - - - - 0x012D01 04:ACF1: D0 3C     BNE b04_bra_AD2F
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_AD0A             ; BEQ  ; orig: C - - - - - 0x012D05 04:ACF5: F0 13     BEQ b04_bra_AD0A
    CMPI.B  #$01,D0  ; orig: C - - - - - 0x012D07 04:ACF7: C9 01     CMP #$01
    BNE     b04_bra_AD49             ; BNE  ; orig: C - - - - - 0x012D09 04:ACF9: D0 4E     BNE b04_bra_AD49
sub_ACFB:  ; orig: sub_ACFB:
    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x012D0B 04:ACFB: A9 A0     LDA #$A0
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012D0F 04:ACFF: A5 15     LDA ram_frm_cnt
    ANDI.B  #$01,D0  ; orig: C - - - - - 0x012D11 04:AD01: 29 01     AND #$01
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012D13 04:AD03: A8        TAY
    MOVEA.L #tbl_AD2D,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x012D19 04:AD09: 60        RTS
b04_bra_AD0A:  ; orig: b04_bra_AD0A:
    MOVEA.L #$FF046B,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012D1A 04:AD0A: FE 6B 04  INC ram_046B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$06,D0  ; orig: C - - - - - 0x012D20 04:AD10: C9 06     CMP #$06
    BNE     b04_bra_AD19             ; BNE  ; orig: C - - - - - 0x012D22 04:AD12: D0 05     BNE b04_bra_AD19
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012D24 04:AD14: A9 00     LDA #$00
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AD19:  ; orig: b04_bra_AD19:
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x012D29 04:AD19: A9 01     LDA #$01
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_9E1D             ; JSR -> BSR  ; orig: C - - - - - 0x012D2E 04:AD1E: 20 1D 9E  JSR sub_9E1D
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012D31 04:AD21: A5 15     LDA ram_frm_cnt
    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x012D33 04:AD23: 29 3F     AND #$3F
    BNE     b04_bra_AD2C_RTS             ; BNE  ; orig: C - - - - - 0x012D35 04:AD25: D0 05     BNE b04_bra_AD2C_RTS
    MOVE.B  #con_obj_id_56,D0  ; orig: C - - - - - 0x012D37 04:AD27: A9 56     LDA #con_obj_id_56
    BSR     sub_82AF_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x012D39 04:AD29: 20 AF 82  JSR sub_82AF_create_
b04_bra_AD2C_RTS:  ; orig: b04_bra_AD2C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012D3C 04:AD2C: 60        RTS



tbl_AD2D:  ; orig: tbl_AD2D:
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012D3D 04:AD2D: 30        .byte $30   ; 00
    ; [DIRECTIVE] .BYTE $B0  -- needs manual handling  ; orig: - D 1 - - - 0x012D3E 04:AD2E: B0        .byte $B0   ; 01



b04_bra_AD2F:  ; orig: b04_bra_AD2F:
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012D3F 04:AD2F: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x012D41 04:AD31: 4A        LSR
    BCC     b04_bra_AD3E             ; BCC  ; orig: C - - - - - 0x012D42 04:AD32: 90 0A     BCC b04_bra_AD3E
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x012D44 04:AD34: D6 AC     DEC ram_state_obj,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_AD3E             ; BNE  ; orig: C - - - - - 0x012D46 04:AD36: D0 06     BNE b04_bra_AD3E
    BSR     sub_ACFB             ; JSR -> BSR  ; orig: - - - - - - 0x012D48 04:AD38: 20 FB AC  JSR sub_ACFB
    JMP     loc_AF71  ; orig: - - - - - - 0x012D4B 04:AD3B: 4C 71 AF  JMP loc_AF71
b04_bra_AD3E:  ; orig: b04_bra_AD3E:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$30,D0  ; orig: C - - - - - 0x012D50 04:AD40: C9 30     CMP #$30
    BCS     b04_bra_AD49             ; BCS  ; orig: C - - - - - 0x012D52 04:AD42: B0 05     BCS b04_bra_AD49
    MOVE.B  ram_frm_cnt,D0  ; orig: - - - - - - 0x012D54 04:AD44: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: - - - - - - 0x012D56 04:AD46: 4A        LSR
    BCC     b04_bra_AD4C_RTS             ; BCC  ; orig: - - - - - - 0x012D57 04:AD47: 90 03     BCC b04_bra_AD4C_RTS
b04_bra_AD49:  ; orig: b04_bra_AD49:

; bzk optimize, JMP
    BSR     sub_AEB5             ; JSR -> BSR  ; orig: C - - - - - 0x012D59 04:AD49: 20 B5 AE  JSR sub_AEB5
b04_bra_AD4C_RTS:  ; orig: b04_bra_AD4C_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012D5C 04:AD4C: 60        RTS

b04_bra_AD4D:  ; orig: b04_bra_AD4D:
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012D5D 04:AD4D: FE 2C 04  INC ram_042B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AD5A             ; BNE  ; orig: C - - - - - 0x012D63 04:AD53: D0 05     BNE b04_bra_AD5A
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x012D65 04:AD55: A9 FF     LDA #$FF
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AD5A:  ; orig: b04_bra_AD5A:
    CMPI.B  #$50,D0  ; orig: C - - - - - 0x012D6A 04:AD5A: C9 50     CMP #$50
    BCC     b04_bra_AD49             ; BCC  ; orig: C - - - - - 0x012D6C 04:AD5C: 90 EB     BCC b04_bra_AD49
    BNE     b04_bra_AD7A             ; BNE  ; orig: C - - - - - 0x012D6E 04:AD5E: D0 1A     BNE b04_bra_AD7A
    BSR     sub_AF75             ; JSR -> BSR  ; orig: C - - - - - 0x012D70 04:AD60: 20 75 AF  JSR sub_AF75
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$07,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012D75 04:AD65: 69 07     ADC #$07
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012D7B 04:AD6B: 69 08     ADC #$08
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    BSR     sub_ADB1             ; JSR -> BSR  ; orig: C - - - - - 0x012D7F 04:AD6F: 20 B1 AD  JSR sub_ADB1
    BSR     b04_sub_B010             ; JSR -> BSR  ; orig: C - - - - - 0x012D82 04:AD72: 20 10 B0  JSR b04_sub_B010
    MOVE.B  #con_music_boss_killed,D0  ; orig: C - - - - - 0x012D85 04:AD75: A9 02     LDA #con_music_boss_
    MOVE.B  D0,ram_music  ; orig: C - - - - - 0x012D87 04:AD77: 8D 00 06  STA ram_music
b04_bra_AD7A:  ; orig: b04_bra_AD7A:
    BSR     sub_AF9F             ; JSR -> BSR  ; orig: C - - - - - 0x012D8A 04:AD7A: 20 9F AF  JSR sub_AF9F
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$A0,D0  ; orig: C - - - - - 0x012D90 04:AD80: C9 A0     CMP #$A0
    BCC     b04_bra_ADEB             ; BCC  ; orig: C - - - - - 0x012D92 04:AD82: 90 67     BCC b04_bra_ADEB
    BNE     b04_bra_AD94_RTS             ; BNE  ; orig: C - - - - - 0x012D94 04:AD84: D0 0E     BNE b04_bra_AD94_RTS
    BSR     sub_AFA7             ; JSR -> BSR  ; orig: C - - - - - 0x012D96 04:AD86: 20 A7 AF  JSR sub_AFA7
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0083  ; orig: C - - - - - 0x012D9B 04:AD8B: 85 83     STA ram_0083
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0097  ; orig: C - - - - - 0x012D9F 04:AD8F: 85 97     STA ram_0097
    ADDQ.B  #1,ram_room_kill_cnt  ; orig: C - - - - - 0x012DA1 04:AD91: EE 4F 03  INC ram_room_kill_cn
b04_bra_AD94_RTS:  ; orig: b04_bra_AD94_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012DA4 04:AD94: 60        RTS



tbl_AD95_direction:  ; orig: tbl_AD95_direction:
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x012DA5 04:AD95: 01        .byte $01   ; 00
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x012DA6 04:AD96: 02        .byte $02   ; 01
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012DA7 04:AD97: 04        .byte $04   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x012DA8 04:AD98: 05        .byte $05   ; 03
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012DA9 04:AD99: 06        .byte $06   ; 04
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x012DAA 04:AD9A: 08        .byte $08   ; 05
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - - - 0x012DAB 04:AD9B: 09        .byte $09   ; 06
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - - - 0x012DAC 04:AD9C: 0A        .byte $0A   ; 07



tbl_AD9D:  ; orig: tbl_AD9D:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012DAD 04:AD9D: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012DAE 04:AD9E: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 1 - - - 0x012DAF 04:AD9F: 40        .byte $40   ; 02
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012DB0 04:ADA0: 00        .byte $00   ; 03
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x012DB1 04:ADA1: 80        .byte $80   ; 04
    ; [DIRECTIVE] .BYTE $C0  -- needs manual handling  ; orig: - D 1 - - - 0x012DB2 04:ADA2: C0        .byte $C0   ; 05
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x012DB3 04:ADA3: 80        .byte $80   ; 06
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012DB4 04:ADA4: 00        .byte $00   ; 07
    ; [DIRECTIVE] .BYTE $40  -- needs manual handling  ; orig: - D 1 - - - 0x012DB5 04:ADA5: 40        .byte $40   ; 08
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012DB6 04:ADA6: 00        .byte $00   ; 09



tbl_ADA7:  ; orig: tbl_ADA7:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012DB7 04:ADA7: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012DB8 04:ADA8: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - - - 0x012DB9 04:ADA9: EE        .byte $EE   ; 02
    ; [DIRECTIVE] .BYTE $EE  -- needs manual handling  ; orig: - D 1 - - - 0x012DBA 04:ADAA: EE        .byte $EE   ; 03
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - - - 0x012DBB 04:ADAB: E8        .byte $E8   ; 04
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012DBC 04:ADAC: 30        .byte $30   ; 05
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012DBD 04:ADAD: 30        .byte $30   ; 06
    ; [DIRECTIVE] .BYTE $E8  -- needs manual handling  ; orig: - D 1 - - - 0x012DBE 04:ADAE: E8        .byte $E8   ; 07
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012DBF 04:ADAF: 30        .byte $30   ; 08
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012DC0 04:ADB0: 30        .byte $30   ; 09



sub_ADB1:  ; orig: sub_ADB1:
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x012DC1 04:ADB1: A0 07     LDY #$07
b04_bra_ADB3_loop:  ; orig: b04_bra_ADB3_loop:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012DC5 04:ADB5: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012DC6 04:ADB6: 69 04     ADC #$04
    MOVEA.L #$FF0072,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012DC8 04:ADB8: 99 72 00  STA ram_pos_X_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012DCD 04:ADBD: 69 04     ADC #$04
    MOVEA.L #$FF0086,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012DCF 04:ADBF: 99 86 00  STA ram_pos_Y_enemy
    MOVE.B  D0,(A0,D2.L)  ; ^
    MOVEA.L #tbl_AD95_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #$FF009A,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012DD5 04:ADC5: 99 9A 00  STA ram_dir_enemy +
    MOVE.B  D0,(A0,D2.L)  ; ^
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012DD8 04:ADC8: 88        DEY
    BPL     b04_bra_ADB3_loop             ; BPL  ; orig: C - - - - - 0x012DD9 04:ADC9: 10 E8     BPL b04_bra_ADB3_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x012DDB 04:ADCB: 60        RTS



sub_ADCC:  ; orig: sub_ADCC:
    MOVE.B  ram_0000_t21_spr_X,D0  ; orig: C - - - - - 0x012DDC 04:ADCC: A5 00     LDA ram_0000_t21_spr
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012DDE 04:ADCE: 48        PHA
    MOVE.B  ram_0001_t15_spr_Y,D0  ; orig: C - - - - - 0x012DDF 04:ADCF: A5 01     LDA ram_0001_t15_spr
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012DE1 04:ADD1: 48        PHA
    MOVE.B  #$0C,D0  ; orig: C - - - - - 0x012DE2 04:ADD2: A9 0C     LDA #$0C
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D2

    CMPI.B  #$06,D2  ; orig: C - - - - - 0x012DE7 04:ADD7: C0 06     CPY #$06
    BCS     b04_bra_ADDD             ; BCS  ; orig: C - - - - - 0x012DE9 04:ADD9: B0 02     BCS b04_bra_ADDD
    MOVE.B  #$0D,D0  ; orig: C - - - - - 0x012DEB 04:ADDB: A9 0D     LDA #$0D
b04_bra_ADDD:  ; orig: b04_bra_ADDD:
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012DED 04:ADDD: A0 00     LDY #$00
    MOVE.B  D2,ram_000F_t04_flag  ; orig: C - - - - - 0x012DEF 04:ADDF: 84 0F     STY ram_000F_t04_fla
    BSR     sub_bat_77DB             ; JSR -> BSR  ; orig: C - - - - - 0x012DF1 04:ADE1: 20 DB 77  JSR sub_bat_77DB
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012DF4 04:ADE4: 68        PLA
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012DF5 04:ADE5: 85 01     STA ram_0001_t15_spr
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012DF7 04:ADE7: 68        PLA
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012DF8 04:ADE8: 85 00     STA ram_0000_t21_spr
    RTS                     ; RTS  ; orig: C - - - - - 0x012DFA 04:ADEA: 60        RTS



b04_bra_ADEB:
; bzk
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_ADF9             ; BEQ  ; orig: C - - - - - 0x012DFE 04:ADEE: F0 09     BEQ b04_bra_ADF9
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012E00 04:ADF0: A5 15     LDA ram_frm_cnt
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x012E02 04:ADF2: 29 07     AND #$07
    BNE     b04_bra_ADF9             ; BNE  ; orig: C - - - - - 0x012E04 04:ADF4: D0 03     BNE b04_bra_ADF9
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x012E06 04:ADF6: DE 78 04  DEC ram_0478_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_ADF9:  ; orig: b04_bra_ADF9:
    BSR     sub_AE6D             ; JSR -> BSR  ; orig: C - - - - - 0x012E09 04:ADF9: 20 6D AE  JSR sub_AE6D
    BSR     sub_AE7F             ; JSR -> BSR  ; orig: C - - - - - 0x012E0C 04:ADFC: 20 7F AE  JSR sub_AE7F
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E0F 04:ADFF: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE76             ; JSR -> BSR  ; orig: C - - - - - 0x012E12 04:AE02: 20 76 AE  JSR sub_AE76
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E15 04:AE05: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE6D             ; JSR -> BSR  ; orig: C - - - - - 0x012E18 04:AE08: 20 6D AE  JSR sub_AE6D
    BSR     sub_AE88             ; JSR -> BSR  ; orig: C - - - - - 0x012E1B 04:AE0B: 20 88 AE  JSR sub_AE88
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E1E 04:AE0E: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE76             ; JSR -> BSR  ; orig: C - - - - - 0x012E21 04:AE11: 20 76 AE  JSR sub_AE76
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E24 04:AE14: 20 CC AD  JSR sub_ADCC
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012E29 04:AE19: 85 00     STA ram_0000_t21_spr
    BSR     sub_AE7F             ; JSR -> BSR  ; orig: C - - - - - 0x012E2B 04:AE1B: 20 7F AE  JSR sub_AE7F
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E2E 04:AE1E: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE88             ; JSR -> BSR  ; orig: C - - - - - 0x012E31 04:AE21: 20 88 AE  JSR sub_AE88
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E34 04:AE24: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE6D             ; JSR -> BSR  ; orig: C - - - - - 0x012E37 04:AE27: 20 6D AE  JSR sub_AE6D
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012E3C 04:AE2C: 85 01     STA ram_0001_t15_spr
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E3E 04:AE2E: 20 CC AD  JSR sub_ADCC
    BSR     sub_AE76             ; JSR -> BSR  ; orig: C - - - - - 0x012E41 04:AE31: 20 76 AE  JSR sub_AE76
    BSR     sub_ADCC             ; JSR -> BSR  ; orig: C - - - - - 0x012E44 04:AE34: 20 CC AD  JSR sub_ADCC
    MOVE.B  ram_obj_index,D0  ; orig: C - - - - - 0x012E47 04:AE37: AD 40 03  LDA ram_obj_index
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012E4A 04:AE3A: 48        PHA
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x012E4B 04:AE3B: A2 02     LDX #$02
b04_bra_AE3D_loop:  ; orig: b04_bra_AE3D_loop:
    MOVE.B  D1,ram_obj_index  ; orig: C - - - - - 0x012E4D 04:AE3D: 8E 40 03  STX ram_obj_index
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x012E50 04:AE40: E0 05     CPX #$05
    BCC     b04_bra_AE4E             ; BCC  ; orig: C - - - - - 0x012E52 04:AE42: 90 0A     BCC b04_bra_AE4E
    CMPI.B  #$07,D1  ; orig: C - - - - - 0x012E54 04:AE44: E0 07     CPX #$07
    BEQ     b04_bra_AE4E             ; BEQ  ; orig: C - - - - - 0x012E56 04:AE46: F0 06     BEQ b04_bra_AE4E
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012E58 04:AE48: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x012E5A 04:AE4A: 29 03     AND #$03
    BEQ     b04_bra_AE51             ; BEQ  ; orig: C - - - - - 0x012E5C 04:AE4C: F0 03     BEQ b04_bra_AE51
b04_bra_AE4E:  ; orig: b04_bra_AE4E:
    BSR     sub_9E9D_change_position_by_direction             ; JSR -> BSR  ; orig: C - - - - - 0x012E5E 04:AE4E: 20 9D 9E  JSR sub_9E9D_change_
b04_bra_AE51:  ; orig: b04_bra_AE51:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x012E61 04:AE51: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - - - - 0x012E64 04:AE54: A5 15     LDA ram_frm_cnt
    ANDI.B  #$03,D0  ; orig: C - - - - - 0x012E66 04:AE56: 29 03     AND #$03
    ; !! ORA tbl_AD9D,X - needs manual review  ; orig: C - - - - - 0x012E68 04:AE58: 1D 9D AD  ORA tbl_AD9D,X
    MOVE.B  D0,ram_0003_t16_spr_A  ; orig: C - - - - - 0x012E6B 04:AE5B: 85 03     STA ram_0003_t16_spr
    MOVEA.L #tbl_ADA7,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_bat_7991             ; JSR -> BSR  ; orig: C - - - - - 0x012E70 04:AE60: 20 91 79  JSR sub_bat_7991
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x012E73 04:AE63: E8        INX
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x012E74 04:AE64: E0 0A     CPX #$0A
    BCC     b04_bra_AE3D_loop             ; BCC  ; orig: C - - - - - 0x012E76 04:AE66: 90 D5     BCC b04_bra_AE3D_loop
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012E78 04:AE68: 68        PLA
    MOVE.B  D0,ram_obj_index  ; orig: C - - - - - 0x012E79 04:AE69: 8D 40 03  STA ram_obj_index
    RTS                     ; RTS  ; orig: C - - - - - 0x012E7C 04:AE6C: 60        RTS



sub_AE6D:  ; orig: sub_AE6D:

; out

; ram_0000_t21_spr_X
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012E7F 04:AE6F: 38        SEC
    ; !! SBC ram_0478_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012E80 04:AE70: FD 78 04  SBC ram_0478_enemy,X
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012E83 04:AE73: 85 00     STA ram_0000_t21_spr
    RTS                     ; RTS  ; orig: C - - - - - 0x012E85 04:AE75: 60        RTS



sub_AE76:  ; orig: sub_AE76:

; out

; ram_0000_t21_spr_X
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012E88 04:AE78: 18        CLC
    ; !! ADC ram_0478_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012E89 04:AE79: 7D 78 04  ADC ram_0478_enemy,X
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012E8C 04:AE7C: 85 00     STA ram_0000_t21_spr
    RTS                     ; RTS  ; orig: C - - - - - 0x012E8E 04:AE7E: 60        RTS



sub_AE7F:  ; orig: sub_AE7F:

; out

; ram_0001_t15_spr_Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x012E91 04:AE81: 38        SEC
    ; !! SBC ram_0478_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012E92 04:AE82: FD 78 04  SBC ram_0478_enemy,X
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012E95 04:AE85: 85 01     STA ram_0001_t15_spr
    RTS                     ; RTS  ; orig: C - - - - - 0x012E97 04:AE87: 60        RTS



sub_AE88:  ; orig: sub_AE88:

; ram_0001_t15_spr_Y
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012E9A 04:AE8A: 18        CLC
    ; !! ADC ram_0478_enemy,X - complex mode, manual review needed  ; orig: C - - - - - 0x012E9B 04:AE8B: 7D 78 04  ADC ram_0478_enemy,X
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012E9E 04:AE8E: 85 01     STA ram_0001_t15_spr
    RTS                     ; RTS  ; orig: C - - - - - 0x012EA0 04:AE90: 60        RTS



tbl_AE91:  ; orig: tbl_AE91:

; 00
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012EA1 04:AE91: 06        .byte $06   ; 00
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x012EA2 04:AE92: 08        .byte $08   ; 01
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - - - 0x012EA3 04:AE93: 07        .byte $07   ; 02
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - - - 0x012EA4 04:AE94: 09        .byte $09   ; 03

; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012EA5 04:AE95: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012EA6 04:AE96: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x012EA7 04:AE97: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x012EA8 04:AE98: 01        .byte $01   ; 03

; 02
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x012EA9 04:AE99: 02        .byte $02   ; 00
    ; [DIRECTIVE] .BYTE $02  -- needs manual handling  ; orig: - D 1 - - - 0x012EAA 04:AE9A: 02        .byte $02   ; 01
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x012EAB 04:AE9B: 03        .byte $03   ; 02
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x012EAC 04:AE9C: 03        .byte $03   ; 03

; 03
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012EAD 04:AE9D: 04        .byte $04   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EAE 04:AE9E: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x012EAF 04:AE9F: 05        .byte $05   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x012EB0 04:AEA0: 01        .byte $01   ; 03

; 04
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012EB1 04:AEA1: 04        .byte $04   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012EB2 04:AEA2: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x012EB3 04:AEA3: 05        .byte $05   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - D 1 - - - 0x012EB4 04:AEA4: 05        .byte $05   ; 03

; 05
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - - - - - - 0x012EB5 04:AEA5: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - - - - - - 0x012EB6 04:AEA6: 04        .byte $04   ; 01
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - - - - - - 0x012EB7 04:AEA7: 01        .byte $01   ; 02
    ; [DIRECTIVE] .BYTE $05  -- needs manual handling  ; orig: - - - - - - 0x012EB8 04:AEA8: 05        .byte $05   ; 03



tbl_AEA9_pos_X:  ; orig: tbl_AEA9_pos_X:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EB9 04:AEA9: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012EBA 04:AEAA: 10        .byte $10   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EBB 04:AEAB: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012EBC 04:AEAC: 10        .byte $10   ; 03



tbl_AEAD_pos_Y:  ; orig: tbl_AEAD_pos_Y:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EBD 04:AEAD: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EBE 04:AEAE: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012EBF 04:AEAF: 10        .byte $10   ; 02
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x012EC0 04:AEB0: 10        .byte $10   ; 03



tbl_AEB1:  ; orig: tbl_AEB1:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EC1 04:AEB1: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x012EC2 04:AEB2: 01        .byte $01   ; 01
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x012EC3 04:AEB3: 00        .byte $00   ; 02
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x012EC4 04:AEB4: 01        .byte $01   ; 03



loc_AEB5:  ; orig: loc_AEB5:
sub_AEB5:  ; orig: sub_AEB5:
    MOVE.B  #$03,D2  ; orig: C D 1 - - - 0x012EC5 04:AEB5: A0 03     LDY #$03
b04_bra_AEB7_loop:  ; orig: b04_bra_AEB7_loop:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012EC9 04:AEB9: 18        CLC
    ; !! ADC tbl_AEA9_pos_X,Y - complex mode, manual review needed  ; orig: C - - - - - 0x012ECA 04:AEBA: 79 A9 AE  ADC tbl_AEA9_pos_X,Y
    MOVE.B  D0,ram_0000_t21_spr_X  ; orig: C - - - - - 0x012ECD 04:AEBD: 85 00     STA ram_0000_t21_spr
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012ED1 04:AEC1: 18        CLC
    ; !! ADC tbl_AEAD_pos_Y,Y - complex mode, manual review needed  ; orig: C - - - - - 0x012ED2 04:AEC2: 79 AD AE  ADC tbl_AEAD_pos_Y,Y
    MOVE.B  D0,ram_0001_t15_spr_Y  ; orig: C - - - - - 0x012ED5 04:AEC5: 85 01     STA ram_0001_t15_spr
    MOVEA.L #tbl_AEB1,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_000F_t04_flag  ; orig: C - - - - - 0x012EDA 04:AECA: 85 0F     STA ram_000F_t04_fla
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x012EDC 04:AECC: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012EDD 04:AECD: 48        PHA
    MOVE.B  D0,ram_0007_t07  ; orig: C - - - - - 0x012EDE 04:AECE: 85 07     STA ram_0007_t07
    MOVEA.L #ram_046B_enemy,A0
    MOVE.B  (A0,D1.L),D0


; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012EE3 04:AED3: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x012EE4 04:AED4: 0A        ASL
    MOVE.B  ram_0007_t07,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x012EE5 04:AED5: 65 07     ADC ram_0007_t07

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012EE7 04:AED7: A8        TAY
    MOVEA.L #tbl_AE91,A0
    MOVE.B  (A0,D2.L),D0

    BSR     sub_bat_77DF             ; JSR -> BSR  ; orig: C - - - - - 0x012EEB 04:AEDB: 20 DF 77  JSR sub_bat_77DF
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012EEE 04:AEDE: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012EEF 04:AEDF: A8        TAY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012EF0 04:AEE0: 88        DEY
    BPL     b04_bra_AEB7_loop             ; BPL  ; orig: C - - - - - 0x012EF1 04:AEE1: 10 D4     BPL b04_bra_AEB7_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x012EF3 04:AEE3: 60        RTS



sub_AEE4_trying_to_kill_ganon:  ; orig: sub_AEE4_trying_to_kill_ganon:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012EF6 04:AEE6: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012EF7 04:AEE7: 69 10     ADC #$10
    MOVE.B  D0,ram_0002_t34_pos_X  ; orig: C - - - - - 0x012EF9 04:AEE9: 85 02     STA ram_0002_t34_pos
    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x012EFD 04:AEED: 18        CLC
    ADD.B  #$10,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x012EFE 04:AEEE: 69 10     ADC #$10
    MOVE.B  D0,ram_0003_t21_pos_Y  ; orig: C - - - - - 0x012F00 04:AEF0: 85 03     STA ram_0003_t21_pos
    MOVE.B  ram_invinc_link,D0  ; orig: C - - - - - 0x012F02 04:AEF2: AD F0 04  LDA ram_invinc_link
    BNE     b04_bra_AF04             ; BNE  ; orig: C - - - - - 0x012F05 04:AEF5: D0 0D     BNE b04_bra_AF04

; A = 00

; bzk optimize, useless STA
    MOVE.B  D0,ram_0006_t16_useless  ; orig: C - - - - - 0x012F07 04:AEF7: 85 06     STA ram_0006_t16_use
    MOVE.B  D0,ram_0009_t02  ; orig: C - - - - - 0x012F09 04:AEF9: 85 09     STA ram_0009_t02
    MOVE.B  D0,ram_000C_t12_flag  ; orig: C - - - - - 0x012F0B 04:AEFB: 85 0C     STA ram_000C_t12_fla
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012F0D 04:AEFD: A0 00     LDY #$00
    MOVE.B  D2,ram_0000_t2A  ; orig: C - - - - - 0x012F0F 04:AEFF: 84 00     STY ram_0000_t2A
    BSR     sub_bat_7AC5             ; JSR -> BSR  ; orig: C - - - - - 0x012F11 04:AF01: 20 C5 7A  JSR sub_bat_7AC5
b04_bra_AF04:  ; orig: b04_bra_AF04:
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AF33             ; BNE  ; orig: C - - - - - 0x012F16 04:AF06: D0 2B     BNE b04_bra_AF33
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_AF32_RTS             ; BNE  ; orig: C - - - - - 0x012F1A 04:AF0A: D0 26     BNE b04_bra_AF32_RTS
    MOVE.B  #$0D,D2  ; orig: C - - - - - 0x012F1C 04:AF0C: A0 0D     LDY #$0D
    BSR     sub_bat_7D29             ; JSR -> BSR  ; orig: C - - - - - 0x012F1E 04:AF0E: 20 29 7D  JSR sub_bat_7D29
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_AF20             ; BEQ  ; orig: C - - - - - 0x012F24 04:AF14: F0 0A     BEQ b04_bra_AF20
    MOVE.B  #$F0,D0  ; orig: C - - - - - 0x012F26 04:AF16: A9 F0     LDA #$F0
    MOVEA.L #$FF0485,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012F28 04:AF18: 9D 85 04  STA ram_hp_ememy - $
    MOVE.B  D0,(A0,D1.L)  ; ^
    MOVEA.L #$FF00AC,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x012F2B 04:AF1B: D6 AC     DEC ram_state_obj,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BSR     sub_AF6D             ; JSR -> BSR  ; orig: C - - - - - 0x012F2D 04:AF1D: 20 6D AF  JSR sub_AF6D
b04_bra_AF20:  ; orig: b04_bra_AF20:
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_AF2C             ; BEQ  ; orig: C - - - - - 0x012F33 04:AF23: F0 07     BEQ b04_bra_AF2C
    BSR     sub_8000             ; JSR -> BSR  ; orig: C - - - - - 0x012F35 04:AF25: 20 00 80  JSR sub_8000
    MOVE.B  #$40,D0  ; orig: C - - - - - 0x012F38 04:AF28: A9 40     LDA #$40
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_AF2C:  ; orig: b04_bra_AF2C:
    BSR     sub_0x01FEEA             ; JSR -> BSR  ; orig: C - - - - - 0x012F3C 04:AF2C: 20 DA FE  JSR sub_0x01FEEA

; bzk optimize, JMP
    BSR     sub_bat_7C96             ; JSR -> BSR  ; orig: C - - - - - 0x012F3F 04:AF2F: 20 96 7C  JSR sub_bat_7C96
b04_bra_AF32_RTS:  ; orig: b04_bra_AF32_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012F42 04:AF32: 60        RTS
b04_bra_AF33:  ; orig: b04_bra_AF33:
    MOVE.B  ram_item_arrow,D0  ; orig: C - - - - - 0x012F43 04:AF33: AD 59 06  LDA ram_item_arrow
    CMPI.B  #$02,D0  ; orig: C - - - - - 0x012F46 04:AF36: C9 02     CMP #$02
    BNE     b04_bra_AF32_RTS             ; BNE  ; orig: C - - - - - 0x012F48 04:AF38: D0 F8     BNE b04_bra_AF32_RTS

; if silver arrow

; bzk optimize, useless LDA + STA
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012F4A 04:AF3A: A9 00     LDA #$00
    MOVE.B  D0,ram_0006_t15_useless  ; orig: C - - - - - 0x012F4C 04:AF3C: 85 06     STA ram_0006_t15_use
    MOVE.B  #$12,D2  ; orig: C - - - - - 0x012F4E 04:AF3E: A0 12     LDY #$12
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D2.L),D0

    CMPI.B  #$10,D0  ; orig: C - - - - - 0x012F53 04:AF43: C9 10     CMP #$10
    BNE     b04_bra_AF32_RTS             ; BNE  ; orig: C - - - - - 0x012F55 04:AF45: D0 EB     BNE b04_bra_AF32_RTS
    BSR     sub_bat_7D5F             ; JSR -> BSR  ; orig: C - - - - - 0x012F57 04:AF47: 20 5F 7D  JSR sub_bat_7D5F
    MOVE.B  ram_0006_t10_flag,D0  ; orig: C - - - - - 0x012F5A 04:AF4A: A5 06     LDA ram_0006_t10_fla
    BEQ     b04_bra_AF32_RTS             ; BEQ  ; orig: C - - - - - 0x012F5C 04:AF4C: F0 E4     BEQ b04_bra_AF32_RTS
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x012F5E 04:AF4E: FE 2C 04  INC ram_042B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVE.B  #$28,D0  ; orig: C - - - - - 0x012F61 04:AF51: A9 28     LDA #$28
    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$08,D0  ; orig: C - - - - - 0x012F66 04:AF56: A9 08     LDA #$08
    MOVEA.L #ram_0478_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x012F6B 04:AF5B: 60        RTS



tbl_AF5C:  ; orig: tbl_AF5C:
    ; [DIRECTIVE] .BYTE $3F  -- needs manual handling  ; orig: - D 1 - - - 0x012F6C 04:AF5C: 3F        .byte $3F   ; 00
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - - - 0x012F6D 04:AF5D: 1C        .byte $1C   ; 01
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x012F6E 04:AF5E: 04        .byte $04   ; 02
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - - - 0x012F6F 04:AF5F: 0F        .byte $0F   ; 03
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - - - 0x012F70 04:AF60: 07        .byte $07   ; 04
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - - - 0x012F71 04:AF61: 17        .byte $17   ; 05
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 1 - - - 0x012F72 04:AF62: 27        .byte $27   ; 06
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - D 1 - - - 0x012F73 04:AF63: FF        .byte $FF   ; 07



tbl_AF64:  ; orig: tbl_AF64:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - - - 0x012F74 04:AF64: 07        .byte $07   ; 00
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - - - 0x012F75 04:AF65: 17        .byte $17   ; 01
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x012F76 04:AF66: 30        .byte $30   ; 02
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - - - - - - 0x012F77 04:AF67: 16        .byte $16   ; 03
    ; [DIRECTIVE] .BYTE $2C  -- needs manual handling  ; orig: - - - - - - 0x012F78 04:AF68: 2C        .byte $2C   ; 04
    ; [DIRECTIVE] .BYTE $3C  -- needs manual handling  ; orig: - - - - - - 0x012F79 04:AF69: 3C        .byte $3C   ; 05
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 1 - - - 0x012F7A 04:AF6A: 27        .byte $27   ; 06
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x012F7B 04:AF6B: 06        .byte $06   ; 07
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - - - 0x012F7C 04:AF6C: 16        .byte $16   ; 08



sub_AF6D:  ; orig: sub_AF6D:
    MOVE.B  #$02,D2  ; orig: C - - - - - 0x012F7D 04:AF6D: A0 02     LDY #$02
    BNE     b04_bra_AF77             ; BNE  ; orig: C - - - - - 0x012F7F 04:AF6F: D0 06     BNE b04_bra_AF77    ; jm



loc_AF71:  ; orig: loc_AF71:
    MOVE.B  #$05,D2  ; orig: - - - - - - 0x012F81 04:AF71: A0 05     LDY #$05
    BNE     b04_bra_AF77             ; BNE  ; orig: - - - - - - 0x012F83 04:AF73: D0 02     BNE b04_bra_AF77    ; jm



sub_AF75:  ; orig: sub_AF75:
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x012F85 04:AF75: A0 08     LDY #$08
b04_bra_AF77:  ; orig: b04_bra_AF77:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x012F87 04:AF77: 98        TYA
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x012F88 04:AF78: 48        PHA
    MOVE.B  ram_0301_buffer_index,D1  ; orig: C - - - - - 0x012F89 04:AF79: AE 01 03  LDX ram_0301_buffer_
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x012F8C 04:AF7C: A0 00     LDY #$00
b04_bra_AF7E_loop:  ; orig: b04_bra_AF7E_loop:
    MOVEA.L #tbl_AF5C,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_0302_ppu_buffer,A0
    MOVE.B  D0,(A0,D1.L)

    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x012F94 04:AF84: E8        INX
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x012F95 04:AF85: C8        INY
    CMPI.B  #$08,D2  ; orig: C - - - - - 0x012F96 04:AF86: C0 08     CPY #$08
    BNE     b04_bra_AF7E_loop             ; BNE  ; orig: C - - - - - 0x012F98 04:AF88: D0 F4     BNE b04_bra_AF7E_loop
    MOVE.B  D1,ram_0301_buffer_index  ; orig: C - - - - - 0x012F9A 04:AF8A: 8E 01 03  STX ram_0301_buffer_
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x012F9D 04:AF8D: 68        PLA
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x012F9E 04:AF8E: A8        TAY
    MOVE.B  #$02,D1  ; orig: C - - - - - 0x012F9F 04:AF8F: A2 02     LDX #$02
b04_bra_AF91_loop:  ; orig: b04_bra_AF91_loop:
    MOVEA.L #tbl_AF64,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #$FF0306,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x012FA4 04:AF94: 9D 06 03  STA ram_0302_ppu_buf
    MOVE.B  D0,(A0,D1.L)  ; ^
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x012FA7 04:AF97: 88        DEY
    SUBQ.B  #1,D1           ; DEX  ; orig: C - - - - - 0x012FA8 04:AF98: CA        DEX
    BPL     b04_bra_AF91_loop             ; BPL  ; orig: C - - - - - 0x012FA9 04:AF99: 10 F6     BPL b04_bra_AF91_loop
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x012FAB 04:AF9B: AE 40 03  LDX ram_obj_index
    RTS                     ; RTS  ; orig: C - - - - - 0x012FAE 04:AF9E: 60        RTS



sub_AF9F:  ; orig: sub_AF9F:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x012FAF 04:AF9F: 20 93 FA  JSR sub_0x01FAA3
    MOVE.B  #$0B,D0  ; orig: C - - - - - 0x012FB2 04:AFA2: A9 0B     LDA #$0B
    JMP     loc_bat_77DF  ; orig: C - - - - - 0x012FB4 04:AFA4: 4C DF 77  JMP loc_bat_77DF



sub_AFA7:  ; orig: sub_AFA7:
    MOVE.B  ram_room_item_flag,D0  ; orig: C - - - - - 0x012FB7 04:AFA7: A5 BF     LDA ram_room_item_fl
    BEQ     b04_bra_AFB9_RTS             ; BEQ  ; orig: C - - - - - 0x012FB9 04:AFA9: F0 0E     BEQ b04_bra_AFB9_RTS
    BSR     sub_bat_7314_check_map_bit4             ; JSR -> BSR  ; orig: C - - - - - 0x012FBB 04:AFAB: 20 14 73  JSR sub_bat_7314_che
    BNE     b04_bra_AFB9_RTS             ; BNE  ; orig: C - - - - - 0x012FBE 04:AFAE: D0 09     BNE b04_bra_AFB9_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x012FC0 04:AFB0: A9 00     LDA #$00
    MOVE.B  D0,ram_room_item_flag  ; orig: C - - - - - 0x012FC2 04:AFB2: 85 BF     STA ram_room_item_fl
    MOVE.B  #con_sfx_2_02,D0  ; orig: C - - - - - 0x012FC4 04:AFB4: A9 02     LDA #con_sfx_2_02
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x012FC6 04:AFB6: 8D 02 06  STA ram_sfx_2
b04_bra_AFB9_RTS:  ; orig: b04_bra_AFB9_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x012FC9 04:AFB9: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x012FCA 04:AFBA: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x012FD0 04:AFC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x012FE0 04:AFD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x012FF0 04:AFE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013000 04:AFF0: FF        .byte $FF, $FF, $FF,



sub_0x013010:  ; orig: sub_0x013010:

; in

; ram_0000_t2B_obj_id

; out

; A =
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x013010 04:B000: 48        PHA
    MOVE.B  ram_0000_t2B_obj_id,D0  ; orig: C - - - - - 0x013011 04:B001: A5 00     LDA ram_0000_t2B_obj
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x013013 04:B003: 4A        LSR
    BCS     b04_bra_B00A             ; BCS  ; orig: C - - - - - 0x013014 04:B004: B0 04     BCS b04_bra_B00A
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x013016 04:B006: 68        PLA
    ANDI.B  #$F0,D0  ; orig: C - - - - - 0x013017 04:B007: 29 F0     AND #$F0
    RTS                     ; RTS  ; orig: C - - - - - 0x013019 04:B009: 60        RTS
b04_bra_B00A:  ; orig: b04_bra_B00A:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01301A 04:B00A: 68        PLA

; * 10
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01301B 04:B00B: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01301C 04:B00C: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01301D 04:B00D: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x01301E 04:B00E: 0A        ASL
    RTS                     ; RTS  ; orig: C - - - - - 0x01301F 04:B00F: 60        RTS



loc_B010:  ; orig: loc_B010:
b04_sub_B010:  ; orig: b04_sub_B010:
    MOVE.B  #con_sfx_1_02,D0  ; orig: C D 1 - - - 0x013020 04:B010: A9 02     LDA #con_sfx_1_02
    MOVE.B  D0,ram_sfx_1  ; orig: C - - - - - 0x013022 04:B012: 8D 01 06  STA ram_sfx_1
    MOVE.B  #con_sfx_3_80,D0  ; orig: C - - - - - 0x013025 04:B015: A9 80     LDA #con_sfx_3_80
    MOVE.B  D0,ram_sfx_3  ; orig: C - - - - - 0x013027 04:B017: 8D 03 06  STA ram_sfx_3
    RTS                     ; RTS  ; orig: C - - - - - 0x01302A 04:B01A: 60        RTS



tbl_B01B:  ; orig: tbl_B01B:
    ; [DIRECTIVE] .BYTE $5D  -- needs manual handling  ; orig: - D 1 - - - 0x01302B 04:B01B: 5D        .byte $5D   ; 00 ?
    ; [DIRECTIVE] .BYTE $14  -- needs manual handling  ; orig: - D 1 - - - 0x01302C 04:B01C: 14        .byte $14   ; 01 Gel
    ; [DIRECTIVE] .BYTE $15  -- needs manual handling  ; orig: - D 1 - - - 0x01302D 04:B01D: 15        .byte $15   ; 02 Gel
    ; [DIRECTIVE] .BYTE $1B  -- needs manual handling  ; orig: - D 1 - - - 0x01302E 04:B01E: 1B        .byte $1B   ; 03 Blu
    ; [DIRECTIVE] .BYTE $1C  -- needs manual handling  ; orig: - D 1 - - - 0x01302F 04:B01F: 1C        .byte $1C   ; 04 Red
    ; [DIRECTIVE] .BYTE $1D  -- needs manual handling  ; orig: - D 1 - - - 0x013030 04:B020: 1D        .byte $1D   ; 05 Dar
    ; [DIRECTIVE] .BYTE $17  -- needs manual handling  ; orig: - D 1 - - - 0x013031 04:B021: 17        .byte $17   ; 06 Lik



tbl_B022:  ; orig: tbl_B022:
    ; [DIRECTIVE] .BYTE $07  -- needs manual handling  ; orig: - D 1 - - - 0x013032 04:B022: 07        .byte $07   ; 00 Red
    ; [DIRECTIVE] .BYTE $08  -- needs manual handling  ; orig: - D 1 - - - 0x013033 04:B023: 08        .byte $08   ; 01 Red
    ; [DIRECTIVE] .BYTE $0E  -- needs manual handling  ; orig: - D 1 - - - 0x013034 04:B024: 0E        .byte $0E   ; 02 Red
    ; [DIRECTIVE] .BYTE $04  -- needs manual handling  ; orig: - D 1 - - - 0x013035 04:B025: 04        .byte $04   ; 03 Red
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - - - 0x013036 04:B026: 0F        .byte $0F   ; 04 Blu
    ; [DIRECTIVE] .BYTE $23  -- needs manual handling  ; orig: - D 1 - - - 0x013037 04:B027: 23        .byte $23   ; 05 Blu



tbl_B028:  ; orig: tbl_B028:
    ; [DIRECTIVE] .BYTE $21  -- needs manual handling  ; orig: - D 1 - - - 0x013038 04:B028: 21        .byte $21   ; 00 Ghi
    ; [DIRECTIVE] .BYTE $22  -- needs manual handling  ; orig: - D 1 - - - 0x013039 04:B029: 22        .byte $22   ; 01 Ghi
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 1 - - - 0x01303A 04:B02A: 0D        .byte $0D   ; 02 Blu
    ; [DIRECTIVE] .BYTE $10  -- needs manual handling  ; orig: - D 1 - - - 0x01303B 04:B02B: 10        .byte $10   ; 03 Red
    ; [DIRECTIVE] .BYTE $13  -- needs manual handling  ; orig: - D 1 - - - 0x01303C 04:B02C: 13        .byte $13   ; 04 Zol
    ; [DIRECTIVE] .BYTE $28  -- needs manual handling  ; orig: - D 1 - - - 0x01303D 04:B02D: 28        .byte $28   ; 05 Rop
    ; [DIRECTIVE] .BYTE $2A  -- needs manual handling  ; orig: - D 1 - - - 0x01303E 04:B02E: 2A        .byte $2A   ; 06 Sta
    ; [DIRECTIVE] .BYTE $27  -- needs manual handling  ; orig: - D 1 - - - 0x01303F 04:B02F: 27        .byte $27   ; 07 Wal
    ; [DIRECTIVE] .BYTE $16  -- needs manual handling  ; orig: - D 1 - - - 0x013040 04:B030: 16        .byte $16   ; 08 Pol



tbl_B031:  ; orig: tbl_B031:
    ; [DIRECTIVE] .BYTE $09  -- needs manual handling  ; orig: - D 1 - - - 0x013041 04:B031: 09        .byte $09   ; 00 Blu
    ; [DIRECTIVE] .BYTE $0A  -- needs manual handling  ; orig: - D 1 - - - 0x013042 04:B032: 0A        .byte $0A   ; 01 Blu
    ; [DIRECTIVE] .BYTE $03  -- needs manual handling  ; orig: - D 1 - - - 0x013043 04:B033: 03        .byte $03   ; 02 Blu
    ; [DIRECTIVE] .BYTE $01  -- needs manual handling  ; orig: - D 1 - - - 0x013044 04:B034: 01        .byte $01   ; 03 Blu
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 1 - - - 0x013045 04:B035: 12        .byte $12   ; 04 Vir
    ; [DIRECTIVE] .BYTE $06  -- needs manual handling  ; orig: - D 1 - - - 0x013046 04:B036: 06        .byte $06   ; 05 Red
    ; [DIRECTIVE] .BYTE $0B  -- needs manual handling  ; orig: - D 1 - - - 0x013047 04:B037: 0B        .byte $0B   ; 06 Red
    ; [DIRECTIVE] .BYTE $24  -- needs manual handling  ; orig: - D 1 - - - 0x013048 04:B038: 24        .byte $24   ; 07 Red
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x013049 04:B039: 30        .byte $30   ; 08 Gib



tbl_B03A_index:  ; orig: tbl_B03A_index:
    ; [DIRECTIVE] .BYTE off_B042_00 - tbl__B042  -- needs manual handling  ; orig: - D 1 - - - 0x01304A 04:B03A: 00        .byte off_B042_00 - 
    ; [DIRECTIVE] .BYTE off_B04C_01 - tbl__B042  -- needs manual handling  ; orig: - D 1 - - - 0x01304B 04:B03B: 0A        .byte off_B04C_01 - 
    ; [DIRECTIVE] .BYTE off_B056_02 - tbl__B042  -- needs manual handling  ; orig: - D 1 - - - 0x01304C 04:B03C: 14        .byte off_B056_02 - 
    ; [DIRECTIVE] .BYTE off_B060_03 - tbl__B042  -- needs manual handling  ; orig: - D 1 - - - 0x01304D 04:B03D: 1E        .byte off_B060_03 - 




tbl_B03E_drop_chance:  ; orig: tbl_B03E_drop_chance:
    ; [DIRECTIVE] .BYTE $50  -- needs manual handling  ; orig: - D 1 - - - 0x01304E 04:B03E: 50        .byte $50   ; 00
    ; [DIRECTIVE] .BYTE $98  -- needs manual handling  ; orig: - D 1 - - - 0x01304F 04:B03F: 98        .byte $98   ; 01
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - - - 0x013050 04:B040: 68        .byte $68   ; 02
    ; [DIRECTIVE] .BYTE $68  -- needs manual handling  ; orig: - D 1 - - - 0x013051 04:B041: 68        .byte $68   ; 03



tbl_B042_drop_id:  ; orig: tbl_B042_drop_id:
tbl__B042:  ; orig: tbl__B042:
off_B042_00:  ; orig: off_B042_00:
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013052 04:B042: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013053 04:B043: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013054 04:B044: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013055 04:B045: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_23  -- needs manual handling  ; orig: - D 1 - - - 0x013056 04:B046: 23        .byte con_drop_id_23
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013057 04:B047: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013058 04:B048: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013059 04:B049: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01305A 04:B04A: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01305B 04:B04B: 18        .byte con_drop_id_18

off_B04C_01:  ; orig: off_B04C_01:
    ; [DIRECTIVE] .BYTE con_drop_id_0F  -- needs manual handling  ; orig: - D 1 - - - 0x01305C 04:B04C: 0F        .byte con_drop_id_0F
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01305D 04:B04D: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x01305E 04:B04E: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01305F 04:B04F: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_0F  -- needs manual handling  ; orig: - D 1 - - - 0x013060 04:B050: 0F        .byte con_drop_id_0F
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013061 04:B051: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_21  -- needs manual handling  ; orig: - D 1 - - - 0x013062 04:B052: 21        .byte con_drop_id_21
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013063 04:B053: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013064 04:B054: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013065 04:B055: 18        .byte con_drop_id_18

off_B056_02:  ; orig: off_B056_02:
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013066 04:B056: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_00  -- needs manual handling  ; orig: - D 1 - - - 0x013067 04:B057: 00        .byte con_drop_id_00
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013068 04:B058: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_21  -- needs manual handling  ; orig: - D 1 - - - 0x013069 04:B059: 21        .byte con_drop_id_21
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01306A 04:B05A: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x01306B 04:B05B: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_00  -- needs manual handling  ; orig: - D 1 - - - 0x01306C 04:B05C: 00        .byte con_drop_id_00
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x01306D 04:B05D: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_00  -- needs manual handling  ; orig: - D 1 - - - 0x01306E 04:B05E: 00        .byte con_drop_id_00
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x01306F 04:B05F: 22        .byte con_drop_id_22

off_B060_03:  ; orig: off_B060_03:
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013070 04:B060: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013071 04:B061: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_23  -- needs manual handling  ; orig: - D 1 - - - 0x013072 04:B062: 23        .byte con_drop_id_23
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013073 04:B063: 18        .byte con_drop_id_18
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013074 04:B064: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_23  -- needs manual handling  ; orig: - D 1 - - - 0x013075 04:B065: 23        .byte con_drop_id_23
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013076 04:B066: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013077 04:B067: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_22  -- needs manual handling  ; orig: - D 1 - - - 0x013078 04:B068: 22        .byte con_drop_id_22
    ; [DIRECTIVE] .BYTE con_drop_id_18  -- needs manual handling  ; orig: - D 1 - - - 0x013079 04:B069: 18        .byte con_drop_id_18



sub_0x01307A_drop_selection:  ; orig: sub_0x01307A_drop_selection:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01307A 04:B06A: A9 00     LDA #$00
    MOVE.B  D0,ram_0001_t23_table_index  ; orig: C - - - - - 0x01307C 04:B06C: 85 01     STA ram_0001_t23_tab
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  #$06,D2  ; orig: C - - - - - 0x013081 04:B071: A0 06     LDY #$06
b04_bra_B073_loop:  ; orig: b04_bra_B073_loop:
    MOVEA.L #tbl_B01B,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_B0F5             ; BEQ  ; orig: C - - - - - 0x013086 04:B076: F0 7D     BEQ b04_bra_B0F5
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x013088 04:B078: 88        DEY
    BPL     b04_bra_B073_loop             ; BPL  ; orig: C - - - - - 0x013089 04:B079: 10 F8     BPL b04_bra_B073_loop
    MOVE.B  #$05,D2  ; orig: C - - - - - 0x01308B 04:B07B: A0 05     LDY #$05
b04_bra_B07D_loop:  ; orig: b04_bra_B07D_loop:
    MOVEA.L #tbl_B022,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_B09F             ; BEQ  ; orig: C - - - - - 0x013090 04:B080: F0 1D     BEQ b04_bra_B09F
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x013092 04:B082: 88        DEY
    BPL     b04_bra_B07D_loop             ; BPL  ; orig: C - - - - - 0x013093 04:B083: 10 F8     BPL b04_bra_B07D_loop
    ADDQ.B  #1,ram_0001_t23_table_index  ; orig: C - - - - - 0x013095 04:B085: E6 01     INC ram_0001_t23_tab
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x013097 04:B087: A0 08     LDY #$08
b04_bra_B089_loop:  ; orig: b04_bra_B089_loop:
    MOVEA.L #tbl_B028,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_B09F             ; BEQ  ; orig: C - - - - - 0x01309C 04:B08C: F0 11     BEQ b04_bra_B09F
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01309E 04:B08E: 88        DEY
    BPL     b04_bra_B089_loop             ; BPL  ; orig: C - - - - - 0x01309F 04:B08F: 10 F8     BPL b04_bra_B089_loop
    ADDQ.B  #1,ram_0001_t23_table_index  ; orig: C - - - - - 0x0130A1 04:B091: E6 01     INC ram_0001_t23_tab
    MOVE.B  #$08,D2  ; orig: C - - - - - 0x0130A3 04:B093: A0 08     LDY #$08
b04_bra_B095_loop:  ; orig: b04_bra_B095_loop:
    MOVEA.L #tbl_B031,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_B09F             ; BEQ  ; orig: C - - - - - 0x0130A8 04:B098: F0 05     BEQ b04_bra_B09F
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0130AA 04:B09A: 88        DEY
    BPL     b04_bra_B095_loop             ; BPL  ; orig: C - - - - - 0x0130AB 04:B09B: 10 F8     BPL b04_bra_B095_loop
    ADDQ.B  #1,ram_0001_t23_table_index  ; orig: C - - - - - 0x0130AD 04:B09D: E6 01     INC ram_0001_t23_tab
b04_bra_B09F:  ; orig: b04_bra_B09F:
    CMPI.B  #$01,D1  ; orig: C - - - - - 0x0130AF 04:B09F: E0 01     CPX #$01
    BNE     b04_bra_B0AB             ; BNE  ; orig: C - - - - - 0x0130B1 04:B0A1: D0 08     BNE b04_bra_B0AB
    CMPI.B  #$2A,D0  ; orig: C - - - - - 0x0130B3 04:B0A3: C9 2A     CMP #$2A
    BEQ     b04_bra_B0F5             ; BEQ  ; orig: C - - - - - 0x0130B5 04:B0A5: F0 4E     BEQ b04_bra_B0F5
    CMPI.B  #$30,D0  ; orig: C - - - - - 0x0130B7 04:B0A7: C9 30     CMP #$30
    BEQ     b04_bra_B0F5             ; BEQ  ; orig: C - - - - - 0x0130B9 04:B0A9: F0 4A     BEQ b04_bra_B0F5
b04_bra_B0AB:  ; orig: b04_bra_B0AB:
    MOVE.B  ram_0001_t23_table_index,D2  ; orig: C - - - - - 0x0130BB 04:B0AB: A4 01     LDY ram_0001_t23_tab
    MOVEA.L #tbl_B03A_index,A0
    MOVE.B  (A0,D2.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0130C0 04:B0B0: 18        CLC
    MOVE.B  ram_052A,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x0130C1 04:B0B1: 6D 2A 05  ADC ram_052A

    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0130C4 04:B0B4: A8        TAY
    MOVEA.L #tbl_B042_drop_id,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0000_t5C_drop_id  ; orig: C - - - - - 0x0130C8 04:B0B8: 85 00     STA ram_0000_t5C_dro
    MOVE.B  #con_drop_id_23,D0  ; orig: C - - - - - 0x0130CA 04:B0BA: A9 23     LDA #con_drop_id_23
    MOVE.B  ram_total_kill_cnt,D2  ; orig: C - - - - - 0x0130CC 04:B0BC: AC 27 06  LDY ram_total_kill_c
    CMPI.B  #$10,D2  ; orig: C - - - - - 0x0130CF 04:B0BF: C0 10     CPY #$10
    BEQ     b04_bra_B0D1             ; BEQ  ; orig: C - - - - - 0x0130D1 04:B0C1: F0 0E     BEQ b04_bra_B0D1
    MOVE.B  ram_0050,D0  ; orig: C - - - - - 0x0130D3 04:B0C3: A5 50     LDA ram_0050
    CMPI.B  #$0A,D0  ; orig: C - - - - - 0x0130D5 04:B0C5: C9 0A     CMP #$0A
    BCC     b04_bra_B0DB             ; BCC  ; orig: C - - - - - 0x0130D7 04:B0C7: 90 12     BCC b04_bra_B0DB
    MOVE.B  #$0F,D0  ; orig: C - - - - - 0x0130D9 04:B0C9: A9 0F     LDA #$0F
    MOVE.B  ram_0051,D2  ; orig: C - - - - - 0x0130DB 04:B0CB: A4 51     LDY ram_0051
    BEQ     b04_bra_B0D1             ; BEQ  ; orig: C - - - - - 0x0130DD 04:B0CD: F0 02     BEQ b04_bra_B0D1
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0130DF 04:B0CF: A9 00     LDA #$00
b04_bra_B0D1:  ; orig: b04_bra_B0D1:
    MOVE.B  D0,ram_0000_t5C_drop_id  ; orig: C - - - - - 0x0130E1 04:B0D1: 85 00     STA ram_0000_t5C_dro
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0130E3 04:B0D3: A9 00     LDA #$00
    MOVE.B  D0,ram_0050  ; orig: C - - - - - 0x0130E5 04:B0D5: 85 50     STA ram_0050
    MOVE.B  D0,ram_0051  ; orig: C - - - - - 0x0130E7 04:B0D7: 85 51     STA ram_0051
    BEQ     b04_bra_B0E4             ; BEQ  ; orig: C - - - - - 0x0130E9 04:B0D9: F0 09     BEQ b04_bra_B0E4    ; jm
b04_bra_B0DB:  ; orig: b04_bra_B0DB:
    MOVE.B  ram_0001_t23_table_index,D2  ; orig: C - - - - - 0x0130EB 04:B0DB: A4 01     LDY ram_0001_t23_tab
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #tbl_B03E_drop_chance,A0
    CMP.B  (A0,D2.L),D0

    BCS     b04_bra_B0F5             ; BCS  ; orig: C - - - - - 0x0130F2 04:B0E2: B0 11     BCS b04_bra_B0F5
b04_bra_B0E4:  ; orig: b04_bra_B0E4:
    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x0130F4 04:B0E4: A9 FF     LDA #$FF
    MOVEA.L #ram_03A8_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  ram_0000_t5C_drop_id,D0  ; orig: C - - - - - 0x0130F9 04:B0E9: A5 00     LDA ram_0000_t5C_dro
    MOVEA.L #ram_drop_id_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    CMPI.B  #con_drop_id_23,D0  ; orig: C - - - - - 0x0130FD 04:B0ED: C9 23     CMP #con_drop_id_23
    BNE     b04_bra_B0F4_RTS             ; BNE  ; orig: C - - - - - 0x0130FF 04:B0EF: D0 03     BNE b04_bra_B0F4_RTS
    JMP     loc_B1F4_spawn_fairy  ; orig: C - - - - - 0x013101 04:B0F1: 4C F4 B1  JMP loc_B1F4_spawn_f
b04_bra_B0F4_RTS:  ; orig: b04_bra_B0F4_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x013104 04:B0F4: 60        RTS
b04_bra_B0F5:  ; orig: b04_bra_B0F5:
    JMP     loc_B15F  ; orig: C - - - - - 0x013105 04:B0F5: 4C 5F B1  JMP loc_B15F



tbl_B0F8:  ; orig: tbl_B0F8:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x013108 04:B0F8: 00        .byte $00   ; 01
    ; [DIRECTIVE] .BYTE $0F  -- needs manual handling  ; orig: - D 1 - - - 0x013109 04:B0F9: 0F        .byte $0F   ; 02
    ; [DIRECTIVE] .BYTE $0D  -- needs manual handling  ; orig: - D 1 - - - 0x01310A 04:B0FA: 0D        .byte $0D   ; 03
    ; [DIRECTIVE] .BYTE $12  -- needs manual handling  ; orig: - D 1 - - - 0x01310B 04:B0FB: 12        .byte $12   ; 04



ofs_004_0x01310C_60:  ; orig: ofs_004_0x01310C_60:

; con_obj_id_60

; in

; X = 01+
    MOVE.B  ram_frm_cnt,D0  ; orig: C - - J - - 0x01310C 04:B0FC: A5 15     LDA ram_frm_cnt
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01310E 04:B0FE: 4A        LSR
    BCC     b04_bra_B104             ; BCC  ; orig: C - - - - - 0x01310F 04:B0FF: 90 03     BCC b04_bra_B104
    MOVEA.L #$FF03A8,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x013111 04:B101: DE A8 03  DEC ram_03A8_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_B104:  ; orig: b04_bra_B104:
    MOVEA.L #ram_03A8_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_B15F             ; BEQ  ; orig: C - - - - - 0x013117 04:B107: F0 56     BEQ b04_bra_B15F
    MOVEA.L #ram_drop_id_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #con_drop_id_23,D0  ; orig: C - - - - - 0x01311B 04:B10B: C9 23     CMP #con_drop_id_23
    BEQ     b04_bra_B115             ; BEQ  ; orig: C - - - - - 0x01311D 04:B10D: F0 06     BEQ b04_bra_B115
    BSR     sub_0x01E71E             ; JSR -> BSR  ; orig: C - - - - - 0x01311F 04:B10F: 20 0E E7  JSR sub_0x01E71E
    JMP     loc_B118  ; orig: C - - - - - 0x013122 04:B112: 4C 18 B1  JMP loc_B118
b04_bra_B115:  ; orig: b04_bra_B115:
    BSR     sub_B21D             ; JSR -> BSR  ; orig: C - - - - - 0x013125 04:B115: 20 1D B2  JSR sub_B21D
loc_B118:  ; orig: loc_B118:
    MOVE.B  ram_state_link,D0  ; orig: C D 1 - - - 0x013128 04:B118: A5 AC     LDA ram_state_link
    ANDI.B  #$C0,D0  ; orig: C - - - - - 0x01312A 04:B11A: 29 C0     AND #con_obj_state_f
    CMPI.B  #$40,D0  ; orig: C - - - - - 0x01312C 04:B11C: C9 40     CMP #con_obj_state_f
    BEQ     b04_bra_B15E_RTS             ; BEQ  ; orig: C - - - - - 0x01312E 04:B11E: F0 3E     BEQ b04_bra_B15E_RTS
    MOVE.B  #$04,D0  ; orig: C - - - - - 0x013130 04:B120: A9 04     LDA #$04
    MOVE.B  D0,ram_000D_t08_loop_counter  ; orig: C - - - - - 0x013132 04:B122: 85 0D     STA ram_000D_t08_loo
b04_bra_B124_loop:  ; orig: b04_bra_B124_loop:
    MOVE.B  ram_pos_X_link,D0  ; orig: C - - - - - 0x013134 04:B124: A5 70     LDA ram_pos_X_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x013136 04:B126: 48        PHA
    MOVE.B  ram_pos_Y_link,D0  ; orig: C - - - - - 0x013137 04:B127: A5 84     LDA ram_pos_Y_link
    MOVE.B  D0,-(A7)        ; PHA  ; orig: C - - - - - 0x013139 04:B129: 48        PHA
    MOVE.B  ram_000D_t08_loop_counter,D2  ; orig: C - - - - - 0x01313A 04:B12A: A4 0D     LDY ram_000D_t08_loo
    MOVEA.L #$FFB0F7,A0  ; Fix X: ; (empty translation for LDX)  ; orig: C - - - - - 0x01313C 04:B12C: BE F7 B0  LDX tbl_B0F8 - $01,Y
    MOVE.B  (A0,D2.L),D1  ; ^
    MOVEA.L #ram_pos_X_obj,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x013141 04:B131: 85 70     STA ram_pos_X_link
    MOVEA.L #ram_pos_Y_obj,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x013145 04:B135: 85 84     STA ram_pos_Y_link
    CMPI.B  #$00,D1  ; orig: C - - - - - 0x013147 04:B137: E0 00     CPX #$00
    BEQ     b04_bra_B141             ; BEQ  ; orig: C - - - - - 0x013149 04:B139: F0 06     BEQ b04_bra_B141
    MOVEA.L #ram_state_obj,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_B14B             ; BEQ  ; orig: C - - - - - 0x01314D 04:B13D: F0 0C     BEQ b04_bra_B14B
    BMI     b04_bra_B14B             ; BMI  ; orig: C - - - - - 0x01314F 04:B13F: 30 0A     BMI b04_bra_B14B
b04_bra_B141:  ; orig: b04_bra_B141:
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x013151 04:B141: AE 40 03  LDX ram_obj_index
    MOVEA.L #ram_drop_id_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0004_t17  ; orig: C - - - - - 0x013156 04:B146: 85 04     STA ram_0004_t17
    BSR     sub_bat_733F             ; JSR -> BSR  ; orig: C - - - - - 0x013158 04:B148: 20 3F 73  JSR sub_bat_733F
b04_bra_B14B:  ; orig: b04_bra_B14B:
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01315B 04:B14B: 68        PLA
    MOVE.B  D0,ram_pos_Y_link  ; orig: C - - - - - 0x01315C 04:B14C: 85 84     STA ram_pos_Y_link
    MOVE.B  (A7)+,D0        ; PLA  ; orig: C - - - - - 0x01315E 04:B14E: 68        PLA
    MOVE.B  D0,ram_pos_X_link  ; orig: C - - - - - 0x01315F 04:B14F: 85 70     STA ram_pos_X_link
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x013161 04:B151: AE 40 03  LDX ram_obj_index
    MOVEA.L #ram_drop_id_enemy,A0
    MOVE.B  (A0,D1.L),D0

    CMPI.B  #$FF,D0  ; orig: C - - - - - 0x013166 04:B156: C9 FF     CMP #$FF
    BEQ     b04_bra_B15F             ; BEQ  ; orig: C - - - - - 0x013168 04:B158: F0 05     BEQ b04_bra_B15F
    SUBQ.B  #1,ram_000D_t08_loop_counter  ; orig: C - - - - - 0x01316A 04:B15A: C6 0D     DEC ram_000D_t08_loo
    BNE     b04_bra_B124_loop             ; BNE  ; orig: C - - - - - 0x01316C 04:B15C: D0 C6     BNE b04_bra_B124_loop
b04_bra_B15E_RTS:  ; orig: b04_bra_B15E_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01316E 04:B15E: 60        RTS
b04_bra_B15F:  ; orig: b04_bra_B15F:
sub_B15F:  ; orig: sub_B15F:
loc_B15F:  ; orig: loc_B15F:
    MOVE.B  #con_obj_id_null,D0  ; orig: C D 1 - - - 0x01316F 04:B15F: A9 00     LDA #con_obj_id_null
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for STA)  ; orig: C - - - - - 0x013171 04:B161: 9D 4F 03  STA ram_obj_id_enemy
    MOVE.B  D0,(A0,D1.L)  ; ^
    BSR     sub_0x01EEF6             ; JSR -> BSR  ; orig: C - - - - - 0x013174 04:B164: 20 E6 EE  JSR sub_0x01EEF6
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_drop_id_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$FF,D0  ; orig: C - - - - - 0x01317E 04:B16E: A9 FF     LDA #$FF
    MOVEA.L #ram_0492_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$01,D0  ; orig: C - - - - - 0x013183 04:B173: A9 01     LDA #$01
    MOVEA.L #ram_0405_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x013188 04:B178: 60        RTS



sub_B179:  ; orig: sub_B179:

; in

; X = 01+

; out

; C

; 0 =

; 1 =
    MOVE.B  D0,ram_0000_t36_obj_id  ; orig: C - - - - - 0x013189 04:B179: 85 00     STA ram_0000_t36_obj
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    BEQ     b04_bra_B1BC             ; BEQ  ; orig: C - - - - - 0x01318E 04:B17E: F0 3C     BEQ b04_bra_B1BC
sub_B180:  ; orig: sub_B180:
loc_B180:  ; orig: loc_B180:

; in

; X = 01+

; out

; C

; 0 =

; 1 =
    BSR     sub_0x01FECB_search_for_free_object             ; JSR -> BSR  ; orig: C D 1 - - - 0x013190 04:B180: 20 BB FE  JSR sub_0x01FECB_sea
    BEQ     b04_bra_B1BC             ; BEQ  ; orig: C - - - - - 0x013193 04:B183: F0 37     BEQ b04_bra_B1BC    ; if
    MOVE.B  ram_0000_t36_obj_id,D0  ; orig: C - - - - - 0x013195 04:B185: A5 00     LDA ram_0000_t36_obj
    CMPI.B  #$53,D0  ; orig: C - - - - - 0x013197 04:B187: C9 53     CMP #$53
    BCC     b04_bra_B195             ; BCC  ; orig: C - - - - - 0x013199 04:B189: 90 0A     BCC b04_bra_B195
    MOVE.B  ram_enemy_proj_cnt,D0  ; orig: C - - - - - 0x01319B 04:B18B: AD 4C 03  LDA ram_enemy_proj_c
    CMPI.B  #$04,D0  ; orig: C - - - - - 0x01319E 04:B18E: C9 04     CMP #$04
    BCS     b04_bra_B1BC             ; BCS  ; orig: C - - - - - 0x0131A0 04:B190: B0 2A     BCS b04_bra_B1BC
    ADDQ.B  #1,ram_enemy_proj_cnt  ; orig: C - - - - - 0x0131A2 04:B192: EE 4C 03  INC ram_enemy_proj_c
b04_bra_B195:  ; orig: b04_bra_B195:
sub_B195:  ; orig: sub_B195:

; out

; C

; 0 =

; 1 =
    MOVE.B  ram_free_obj_index,D1  ; orig: C - - - - - 0x0131A5 04:B195: A6 59     LDX ram_free_obj_ind
    MOVE.B  ram_0000_t36_obj_id,D0  ; orig: C - - - - - 0x0131A7 04:B197: A5 00     LDA ram_0000_t36_obj
    BSR     sub_0x01FEC3_create_object             ; JSR -> BSR  ; orig: C - - - - - 0x0131A9 04:B199: 20 B3 FE  JSR sub_0x01FEC3_cre
    MOVE.B  ram_free_obj_index,D2  ; orig: C - - - - - 0x0131AC 04:B19C: A4 59     LDY ram_free_obj_ind
    MOVE.B  ram_obj_index,D1  ; orig: C - - - - - 0x0131AE 04:B19E: AE 40 03  LDX ram_obj_index
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x0131B1 04:B1A1: A9 10     LDA #$10
    MOVEA.L #ram_state_obj,A0
    MOVE.B  D0,(A0,D2.L)

    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0131B6 04:B1A6: A9 00     LDA #$00
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  D0,(A0,D2.L)

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0131CA 04:B1BA: 38        SEC
    RTS                     ; RTS  ; orig: C - - - - - 0x0131CB 04:B1BB: 60        RTS
b04_bra_B1BC:  ; orig: b04_bra_B1BC:
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0131CC 04:B1BC: 18        CLC
    RTS                     ; RTS  ; orig: C - - - - - 0x0131CD 04:B1BD: 60        RTS



sub_B1BE:  ; orig: sub_B1BE:
sub_0x0131CE:  ; orig: sub_0x0131CE:
loc_0x0131CE:  ; orig: loc_0x0131CE:
    MOVE.B  ram_051F_script,D0  ; orig: C D 1 - - - 0x0131CE 04:B1BE: AD 1F 05  LDA ram_051F_script
    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x0131D1 04:B1C1: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_016_B1CA_00  -- needs manual handling  ; orig: - D 1 - I - 0x0131D4 04:B1C4: CA B1     .word ofs_016_B1CA_0
    ; [DIRECTIVE] .WORD ofs_016_B1E4_01  -- needs manual handling  ; orig: - D 1 - I - 0x0131D6 04:B1C6: E4 B1     .word ofs_016_B1E4_0
    ; [DIRECTIVE] .WORD ofs_016_B1DC_02_RTS  -- needs manual handling  ; orig: - D 1 - I - 0x0131D8 04:B1C8: DC B1     .word ofs_016_B1DC_0



ofs_016_B1CA_00:  ; orig: ofs_016_B1CA_00:
    MOVE.B  ram_map_location,D2  ; orig: C - - J - - 0x0131DA 04:B1CA: A4 EB     LDY ram_map_location
    BSR     sub_B1EA             ; JSR -> BSR  ; orig: C - - - - - 0x0131DC 04:B1CC: 20 EA B1  JSR sub_B1EA
    BEQ     b04_bra_B1DC_RTS             ; BEQ  ; orig: C - - - - - 0x0131DF 04:B1CF: F0 0B     BEQ b04_bra_B1DC_RTS
    MOVE.B  #$C0,D0  ; orig: C - - - - - 0x0131E1 04:B1D1: A9 C0     LDA #$C0
    MOVE.B  D0,ram_051C  ; orig: C - - - - - 0x0131E3 04:B1D3: 8D 1C 05  STA ram_051C
    ADDQ.B  #1,ram_051E_flag  ; orig: C - - - - - 0x0131E6 04:B1D6: EE 1E 05  INC ram_051E_flag
b04_bra_B1D9:  ; orig: b04_bra_B1D9:
    ADDQ.B  #1,ram_051F_script  ; orig: C - - - - - 0x0131E9 04:B1D9: EE 1F 05  INC ram_051F_script
b04_bra_B1DC_RTS:  ; orig: b04_bra_B1DC_RTS:
ofs_016_B1DC_02_RTS:  ; orig: ofs_016_B1DC_02_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0131EC 04:B1DC: 60        RTS



b04_bra_B1DD:  ; orig: b04_bra_B1DD:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x0131ED 04:B1DD: A9 00     LDA #$00
    MOVE.B  D0,ram_051E_flag  ; orig: C - - - - - 0x0131EF 04:B1DF: 8D 1E 05  STA ram_051E_flag
    BEQ     b04_bra_B1D9             ; BEQ  ; orig: C - - - - - 0x0131F2 04:B1E2: F0 F5     BEQ b04_bra_B1D9    ; jm



ofs_016_B1E4_01:  ; orig: ofs_016_B1E4_01:
    BSR     sub_bat_74B7             ; JSR -> BSR  ; orig: C - - J - - 0x0131F4 04:B1E4: 20 B7 74  JSR sub_bat_74B7
    BEQ     b04_bra_B1DD             ; BEQ  ; orig: C - - - - - 0x0131F7 04:B1E7: F0 F4     BEQ b04_bra_B1DD
    RTS                     ; RTS  ; orig: C - - - - - 0x0131F9 04:B1E9: 60        RTS



sub_B1EA:  ; orig: sub_B1EA:
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x0131FA 04:B1EA: A5 10     LDA ram_dungeon_leve
    BEQ     b04_bra_B1F3_RTS             ; BEQ  ; orig: C - - - - - 0x0131FC 04:B1EC: F0 05     BEQ b04_bra_B1F3_RTS    

; if dungeon
    MOVEA.L #ram_6A7E_map_data,A0
    MOVE.B  (A0,D2.L),D0

    ANDI.B  #$80,D0  ; orig: C - - - - - 0x013201 04:B1F1: 29 80     AND #$80
b04_bra_B1F3_RTS:  ; orig: b04_bra_B1F3_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x013203 04:B1F3: 60        RTS



loc_B1F4_spawn_fairy:  ; orig: loc_B1F4_spawn_fairy:
    MOVE.B  #con_sfx_2_pick_up_item,D0  ; orig: C D 1 - - - 0x013204 04:B1F4: A9 08     LDA #con_sfx_2_pick_
    MOVE.B  D0,ram_sfx_2  ; orig: C - - - - - 0x013206 04:B1F6: 8D 02 06  STA ram_sfx_2
    BSR     sub_B20B_clear_obj_stuff             ; JSR -> BSR  ; orig: C - - - - - 0x013209 04:B1F9: 20 0B B2  JSR sub_B20B_clear_o
    MOVE.B  #con_dir_Up,D0  ; orig: C - - - - - 0x01320C 04:B1FC: A9 08     LDA #con_dir_Up
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$7F,D0  ; orig: C - - - - - 0x013210 04:B200: A9 7F     LDA #$7F
    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$A0,D0  ; orig: C - - - - - 0x013215 04:B205: A9 A0     LDA #$A0
    MOVE.B  D0,ram_04D1  ; orig: C - - - - - 0x013217 04:B207: 8D D1 04  STA ram_04D1
    RTS                     ; RTS  ; orig: C - - - - - 0x01321A 04:B20A: 60        RTS



sub_B20B_clear_obj_stuff:  ; orig: sub_B20B_clear_obj_stuff:
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01321B 04:B20B: A9 00     LDA #$00
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0437_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_invinc_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01322C 04:B21C: 60        RTS



sub_B21D:  ; orig: sub_B21D:
    BSR     sub_B235             ; JSR -> BSR  ; orig: C - - - - - 0x01322D 04:B21D: 20 35 B2  JSR sub_B235
    BSR     sub_B288             ; JSR -> BSR  ; orig: C - - - - - 0x013230 04:B220: 20 88 B2  JSR sub_B288
sub_B223:  ; orig: sub_B223:
    BSR     sub_0x01FAA3             ; JSR -> BSR  ; orig: C - - - - - 0x013233 04:B223: 20 93 FA  JSR sub_0x01FAA3
    BSR     sub_bat_7986             ; JSR -> BSR  ; orig: C - - - - - 0x013236 04:B226: 20 86 79  JSR sub_bat_7986
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x013239 04:B229: 0A        ASL
    AND.B   ram_frm_cnt,D0  ; orig: C - - - - - 0x01323A 04:B22A: 25 15     AND ram_frm_cnt

; / 04
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01323C 04:B22C: 4A        LSR
    LSR.B   #1,D0           ; LSR A  ; orig: C - - - - - 0x01323D 04:B22D: 4A        LSR
    MOVE.B  D0,ram_000C_t06_table_offset  ; orig: C - - - - - 0x01323E 04:B22E: 85 0C     STA ram_000C_t06_tab
    MOVE.B  #$14,D2  ; orig: C - - - - - 0x013240 04:B230: A0 14     LDY #$14
    JMP     loc_bat_7915  ; orig: C - - - - - 0x013242 04:B232: 4C 15 79  JMP loc_bat_7915



sub_B235:  ; orig: sub_B235:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BSR     sub_0x01E5F2_jump_to_pointers_after_JSR             ; JSR -> BSR  ; orig: C - - - - - 0x013248 04:B238: 20 E2 E5  JSR sub_0x01E5F2_jum
    ; [DIRECTIVE] .WORD ofs_030_B266_00  -- needs manual handling  ; orig: - D 1 - I - 0x01324B 04:B23B: 66 B2     .word ofs_030_B266_0
    ; [DIRECTIVE] .WORD ofs_030_B243_01  -- needs manual handling  ; orig: - D 1 - I - 0x01324D 04:B23D: 43 B2     .word ofs_030_B243_0
    ; [DIRECTIVE] .WORD ofs_030_B24D_02_RTS  -- needs manual handling  ; orig: - - - - - - 0x01324F 04:B23F: 4D B2     .word ofs_030_B24D_0
    ; [DIRECTIVE] .WORD ofs_030_B378_03  -- needs manual handling  ; orig: - D 1 - I - 0x013251 04:B241: 78 B3     .word ofs_030_B378_0



ofs_030_B243_01:  ; orig: ofs_030_B243_01:
    MOVE.B  #$03,D0  ; orig: C - - J - - 0x013253 04:B243: A9 03     LDA #$03
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$06,D0  ; orig: C - - - - - 0x013258 04:B248: A9 06     LDA #$06
    MOVEA.L #ram_042B_enemy,A0
    MOVE.B  D0,(A0,D1.L)

ofs_030_B24D_02_RTS:  ; orig: ofs_030_B24D_02_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01325D 04:B24D: 60        RTS



tbl_B24E_direction:  ; orig: tbl_B24E_direction:
    ; [DIRECTIVE] .BYTE con_dir_Up  -- needs manual handling  ; orig: - D 1 - - - 0x01325E 04:B24E: 08        .byte con_dir_Up    
    ; [DIRECTIVE] .BYTE con_dir__UR  -- needs manual handling  ; orig: - D 1 - - - 0x01325F 04:B24F: 09        .byte con_dir__UR   
    ; [DIRECTIVE] .BYTE con_dir_Right  -- needs manual handling  ; orig: - D 1 - - - 0x013260 04:B250: 01        .byte con_dir_Right 
    ; [DIRECTIVE] .BYTE con_dir__DR  -- needs manual handling  ; orig: - D 1 - - - 0x013261 04:B251: 05        .byte con_dir__DR   
    ; [DIRECTIVE] .BYTE con_dir_Down  -- needs manual handling  ; orig: - D 1 - - - 0x013262 04:B252: 04        .byte con_dir_Down  
    ; [DIRECTIVE] .BYTE con_dir__DL  -- needs manual handling  ; orig: - D 1 - - - 0x013263 04:B253: 06        .byte con_dir__DL   
    ; [DIRECTIVE] .BYTE con_dir_Left  -- needs manual handling  ; orig: - D 1 - - - 0x013264 04:B254: 02        .byte con_dir_Left  
    ; [DIRECTIVE] .BYTE con_dir__UL  -- needs manual handling  ; orig: - D 1 - - - 0x013265 04:B255: 0A        .byte con_dir__UL   



ofs_030_B256_05:  ; orig: ofs_030_B256_05:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_B25F_RTS             ; BNE  ; orig: C - - - - - 0x013268 04:B258: D0 05     BNE b04_bra_B25F_RTS
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01326A 04:B25A: A9 00     LDA #$00
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_B25F_RTS:  ; orig: b04_bra_B25F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01326F 04:B25F: 60        RTS



ofs_030_B260_04:  ; orig: ofs_030_B260_04:
    MOVEA.L #$FF041F,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - J - - 0x013270 04:B260: DE 1F 04  DEC ram_041F,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    JMP     loc_B269  ; orig: C - - - - - 0x013273 04:B263: 4C 69 B2  JMP loc_B269



ofs_030_B266_00:  ; orig: ofs_030_B266_00:
    MOVEA.L #$FF041F,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - J - - 0x013276 04:B266: FE 1F 04  INC ram_041F,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
loc_B269:  ; orig: loc_B269:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$E0,D0  ; orig: C - - - - - 0x01327C 04:B26C: 29 E0     AND #$E0
    BNE     b04_bra_B27E             ; BNE  ; orig: C - - - - - 0x01327E 04:B26E: D0 0E     BNE b04_bra_B27E
    MOVEA.L #ram_indiv_random,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$3F,D0  ; orig: C - - - - - 0x013282 04:B272: 29 3F     AND #$3F
    ORI.B   #$40,D0  ; orig: C - - - - - 0x013284 04:B274: 09 40     ORA #$40
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVE.B  #$05,D0  ; orig: C - - - - - 0x013288 04:B278: A9 05     LDA #$05
loc_B27A:  ; orig: loc_B27A:
    MOVEA.L #ram_0444_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_B27D_RTS:  ; orig: b04_bra_B27D_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01328D 04:B27D: 60        RTS
b04_bra_B27E:  ; orig: b04_bra_B27E:
    CMP.B   ram_04D1,D0  ; orig: C - - - - - 0x01328E 04:B27E: CD D1 04  CMP ram_04D1
    BCC     b04_bra_B27D_RTS             ; BCC  ; orig: C - - - - - 0x013291 04:B281: 90 FA     BCC b04_bra_B27D_RTS
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x013293 04:B283: A9 01     LDA #$01
    JMP     loc_B27A  ; orig: C - - - - - 0x013295 04:B285: 4C 7A B2  JMP loc_B27A



sub_B288:  ; orig: sub_B288:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$E0,D0  ; orig: C - - - - - 0x01329B 04:B28B: 29 E0     AND #$E0
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01329D 04:B28D: 18        CLC
    ; !! ADC ram_0412,X - complex mode, manual review needed  ; orig: C - - - - - 0x01329E 04:B28E: 7D 12 04  ADC ram_0412,X
    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    BCC     b04_bra_B2CC_RTS             ; BCC  ; orig: C - - - - - 0x0132A4 04:B294: 90 36     BCC b04_bra_B2CC_RTS
    MOVE.B  #$01,D0  ; orig: C - - - - - 0x0132A6 04:B296: A9 01     LDA #$01
    MOVE.B  D0,ram_0002_t36  ; orig: C - - - - - 0x0132A8 04:B298: 85 02     STA ram_0002_t36
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BTST    D0,ram_0002_t36  ; BIT abs  ; orig: C - - - - - 0x0132AC 04:B29C: 24 02     BIT ram_0002_t36
    BEQ     b04_bra_B2A5             ; BEQ  ; orig: C - - - - - 0x0132AE 04:B29E: F0 05     BEQ b04_bra_B2A5
    MOVEA.L #$FF0070,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0132B0 04:B2A0: F6 70     INC ram_pos_X_enemy,
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #$FF046B,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0132B2 04:B2A2: FE 6B 04  INC ram_046B_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_B2A5:  ; orig: b04_bra_B2A5:
    MOVE.B  (ram_0002_t36).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t36).l  ; orig: C - - - - - 0x0132B5 04:B2A5: 06 02     ASL ram_0002_t36    

    BTST    D0,ram_0002_t36  ; BIT abs  ; orig: C - - - - - 0x0132B7 04:B2A7: 24 02     BIT ram_0002_t36
    BEQ     b04_bra_B2B0             ; BEQ  ; orig: C - - - - - 0x0132B9 04:B2A9: F0 05     BEQ b04_bra_B2B0
    MOVEA.L #$FF0070,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0132BB 04:B2AB: D6 70     DEC ram_pos_X_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #$FF046B,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0132BD 04:B2AD: DE 6B 04  DEC ram_046B_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_B2B0:  ; orig: b04_bra_B2B0:
    MOVE.B  (ram_0002_t36).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t36).l  ; orig: C - - - - - 0x0132C0 04:B2B0: 06 02     ASL ram_0002_t36    

    BTST    D0,ram_0002_t36  ; BIT abs  ; orig: C - - - - - 0x0132C2 04:B2B2: 24 02     BIT ram_0002_t36
    BEQ     b04_bra_B2BB             ; BEQ  ; orig: C - - - - - 0x0132C4 04:B2B4: F0 05     BEQ b04_bra_B2BB
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0132C6 04:B2B6: F6 84     INC ram_pos_Y_enemy,
    ADDQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0132C8 04:B2B8: FE 78 04  INC ram_0478_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^
b04_bra_B2BB:  ; orig: b04_bra_B2BB:
    MOVE.B  (ram_0002_t36).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t36).l  ; orig: C - - - - - 0x0132CB 04:B2BB: 06 02     ASL ram_0002_t36    

    BTST    D0,ram_0002_t36  ; BIT abs  ; orig: C - - - - - 0x0132CD 04:B2BD: 24 02     BIT ram_0002_t36
    BEQ     b04_bra_B2C6             ; BEQ  ; orig: C - - - - - 0x0132CF 04:B2BF: F0 05     BEQ b04_bra_B2C6
    MOVEA.L #$FF0084,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0132D1 04:B2C1: D6 84     DEC ram_pos_Y_enemy,
    SUBQ.B  #1,(A0,D1.L)  ; ^
    MOVEA.L #$FF0478,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x0132D3 04:B2C3: DE 78 04  DEC ram_0478_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
b04_bra_B2C6:  ; orig: b04_bra_B2C6:
    MOVEA.L #$FF0437,A0  ; Fix X: ; (empty translation for INC)  ; orig: C - - - - - 0x0132D6 04:B2C6: FE 37 04  INC ram_0437_enemy,X
    ADDQ.B  #1,(A0,D1.L)  ; ^

; bzk optimize, JMP
    BSR     sub_B2CD             ; JSR -> BSR  ; orig: C - - - - - 0x0132D9 04:B2C9: 20 CD B2  JSR sub_B2CD
b04_bra_B2CC_RTS:  ; orig: b04_bra_B2CC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0132DC 04:B2CC: 60        RTS



sub_B2CD:  ; orig: sub_B2CD:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_000F_t01_direction  ; orig: C - - - - - 0x0132DF 04:B2CF: 85 0F     STA ram_000F_t01_dir
    BSR     sub_bat_6F29             ; JSR -> BSR  ; orig: C - - - - - 0x0132E1 04:B2D1: 20 29 6F  JSR sub_bat_6F29
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0132E4 04:B2D4: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_20,D0  ; orig: C - - - - - 0x0132E7 04:B2D7: C9 20     CMP #con_obj_id_20
    BEQ     b04_bra_B2DE             ; BEQ  ; orig: C - - - - - 0x0132E9 04:B2D9: F0 03     BEQ b04_bra_B2DE
    BSR     sub_bat_6F73             ; JSR -> BSR  ; orig: C - - - - - 0x0132EB 04:B2DB: 20 73 6F  JSR sub_bat_6F73
b04_bra_B2DE:  ; orig: b04_bra_B2DE:
    MOVE.B  ram_000F_t01_direction,D0  ; orig: C - - - - - 0x0132EE 04:B2DE: A5 0F     LDA ram_000F_t01_dir
    BNE     b04_bra_B2F8_RTS             ; BNE  ; orig: C - - - - - 0x0132F0 04:B2E0: D0 16     BNE b04_bra_B2F8_RTS
sub_B2E2:  ; orig: sub_B2E2:
    BSR     sub_B39F             ; JSR -> BSR  ; orig: C - - - - - 0x0132F2 04:B2E2: 20 9F B3  JSR sub_B39F
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0132F5 04:B2E5: 98        TYA
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x0132F6 04:B2E6: 18        CLC
    ADD.B  #$04,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x0132F7 04:B2E7: 69 04     ADC #$04
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0132F9 04:B2E9: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0132FB 04:B2EB: A8        TAY
    MOVEA.L #$FF034F,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x0132FC 04:B2EC: BD 4F 03  LDA ram_obj_id_enemy
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #con_obj_id_41,D0  ; orig: C - - - - - 0x0132FF 04:B2EF: C9 41     CMP #con_obj_id_41
    BEQ     b04_bra_B2F9             ; BEQ  ; orig: C - - - - - 0x013301 04:B2F1: F0 06     BEQ b04_bra_B2F9
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_B2F8_RTS:  ; orig: b04_bra_B2F8_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x013308 04:B2F8: 60        RTS
b04_bra_B2F9:  ; orig: b04_bra_B2F9:
    CMPI.B  #$05,D1  ; orig: C - - - - - 0x013309 04:B2F9: E0 05     CPX #$05
    BEQ     b04_bra_B301             ; BEQ  ; orig: C - - - - - 0x01330B 04:B2FB: F0 04     BEQ b04_bra_B301
    CMPI.B  #$0A,D1  ; orig: C - - - - - 0x01330D 04:B2FD: E0 0A     CPX #$0A
    BNE     b04_bra_B307_RTS             ; BNE  ; orig: C - - - - - 0x01330F 04:B2FF: D0 06     BNE b04_bra_B307_RTS
b04_bra_B301:  ; orig: b04_bra_B301:
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_B307_RTS:  ; orig: b04_bra_B307_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x013317 04:B307: 60        RTS



sub_B308:  ; orig: sub_B308:
ofs_030_B308_02:  ; orig: ofs_030_B308_02:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_B307_RTS             ; BNE  ; orig: C - - - - - 0x01331A 04:B30A: D0 FB     BNE b04_bra_B307_RTS
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x01331C 04:B30C: DE 2C 04  DEC ram_042B_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_B316             ; BNE  ; orig: C - - - - - 0x01331F 04:B30F: D0 05     BNE b04_bra_B316
loc_B311:  ; orig: loc_B311:
    MOVE.B  #$01,D0  ; orig: C D 1 - - - 0x013321 04:B311: A9 01     LDA #$01
    JMP     loc_B27A  ; orig: C - - - - - 0x013323 04:B313: 4C 7A B2  JMP loc_B27A
b04_bra_B316:  ; orig: b04_bra_B316:
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x013326 04:B316: A9 10     LDA #$10
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

sub_B31A:  ; orig: sub_B31A:
    MOVE.B  #con_dir_00,D2  ; orig: C - - - - - 0x01332A 04:B31A: A0 00     LDY #con_dir_00
    MOVE.B  D2,ram_0000_t37_direction  ; orig: C - - - - - 0x01332C 04:B31C: 84 00     STY ram_0000_t37_dir
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x01332E 04:B31E: C8        INY ; 01
    MOVE.B  ram_0061,D0  ; orig: C - - - - - 0x01332F 04:B31F: A5 61     LDA ram_0061
    MOVEA.L #ram_pos_X_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_B32A             ; BEQ  ; orig: C - - - - - 0x013333 04:B323: F0 05     BEQ b04_bra_B32A
    BCS     b04_bra_B328             ; BCS  ; orig: C - - - - - 0x013335 04:B325: B0 01     BCS b04_bra_B328
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x013337 04:B327: C8        INY ; 02 con_dir_Lef
b04_bra_B328:  ; orig: b04_bra_B328:
    MOVE.B  D2,ram_0000_t37_direction  ; orig: C - - - - - 0x013338 04:B328: 84 00     STY ram_0000_t37_dir
b04_bra_B32A:  ; orig: b04_bra_B32A:
    MOVE.B  #con_dir_Right,D2  ; orig: C - - - - - 0x01333A 04:B32A: A0 01     LDY #con_dir_Right
    MOVE.B  ram_0062,D0  ; orig: C - - - - - 0x01333C 04:B32C: A5 62     LDA ram_0062
    MOVEA.L #ram_pos_Y_enemy,A0
    CMP.B  (A0,D1.L),D0

    BEQ     b04_bra_B33C             ; BEQ  ; orig: C - - - - - 0x013340 04:B330: F0 0A     BEQ b04_bra_B33C
    BCS     b04_bra_B335             ; BCS  ; orig: C - - - - - 0x013342 04:B332: B0 01     BCS b04_bra_B335
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x013344 04:B334: C8        INY ; 02 con_dir_Lef
b04_bra_B335:  ; orig: b04_bra_B335:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x013345 04:B335: 98        TYA

; * 04
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x013346 04:B336: 0A        ASL
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x013347 04:B337: 0A        ASL
    OR.B    ram_0000_t37_direction,D0  ; orig: C - - - - - 0x013348 04:B338: 05 00     ORA ram_0000_t37_dir
    MOVE.B  D0,ram_0000_t37_direction  ; orig: C - - - - - 0x01334A 04:B33A: 85 00     STA ram_0000_t37_dir
b04_bra_B33C:  ; orig: b04_bra_B33C:
    BSR     sub_B39F             ; JSR -> BSR  ; orig: C - - - - - 0x01334C 04:B33C: 20 9F B3  JSR sub_B39F
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x01334F 04:B33F: A9 03     LDA #$03
    MOVE.B  D0,ram_0001_t24_loop_counter  ; orig: C - - - - - 0x013351 04:B341: 85 01     STA ram_0001_t24_loo
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x013353 04:B343: C8        INY
b04_bra_B344_loop:  ; orig: b04_bra_B344_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x013354 04:B344: 98        TYA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x013355 04:B345: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x013357 04:B347: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    CMP.B   ram_0000_t37_direction,D0  ; orig: C - - - - - 0x01335B 04:B34B: C5 00     CMP ram_0000_t37_dir
    BEQ     b04_bra_B36F_RTS             ; BEQ  ; orig: C - - - - - 0x01335D 04:B34D: F0 20     BEQ b04_bra_B36F_RTS
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x01335F 04:B34F: 88        DEY
    SUBQ.B  #1,ram_0001_t24_loop_counter  ; orig: C - - - - - 0x013360 04:B350: C6 01     DEC ram_0001_t24_loo
    BNE     b04_bra_B344_loop             ; BNE  ; orig: C - - - - - 0x013362 04:B352: D0 F0     BNE b04_bra_B344_loop
    MOVE.B  #$03,D0  ; orig: C - - - - - 0x013364 04:B354: A9 03     LDA #$03
    MOVE.B  D0,ram_0001_t25_loop_counter  ; orig: C - - - - - 0x013366 04:B356: 85 01     STA ram_0001_t25_loo
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x013368 04:B358: C8        INY
b04_bra_B359_loop:  ; orig: b04_bra_B359_loop:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x013369 04:B359: 98        TYA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x01336A 04:B35A: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x01336C 04:B35C: A8        TAY
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    BTST    D0,ram_0000_t37_direction  ; BIT abs  ; orig: C - - - - - 0x013370 04:B360: 24 00     BIT ram_0000_t37_dir
    BNE     b04_bra_B370             ; BNE  ; orig: C - - - - - 0x013372 04:B362: D0 0C     BNE b04_bra_B370
b04_bra_B364:  ; orig: b04_bra_B364:
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x013374 04:B364: C8        INY
    SUBQ.B  #1,ram_0001_t25_loop_counter  ; orig: C - - - - - 0x013375 04:B365: C6 01     DEC ram_0001_t25_loo
    BNE     b04_bra_B359_loop             ; BNE  ; orig: C - - - - - 0x013377 04:B367: D0 F0     BNE b04_bra_B359_loop
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x013379 04:B369: 88        DEY
b04_bra_B36A:  ; orig: b04_bra_B36A:
loc_B36A:  ; orig: loc_B36A:
    MOVEA.L #tbl_B24E_direction,A0
    MOVE.B  (A0,D2.L),D0

    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  D0,(A0,D1.L)

b04_bra_B36F_RTS:  ; orig: b04_bra_B36F_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x01337F 04:B36F: 60        RTS
b04_bra_B370:  ; orig: b04_bra_B370:
    OR.B    ram_0000_t37_direction,D0  ; orig: C - - - - - 0x013380 04:B370: 05 00     ORA ram_0000_t37_dir
    CMPI.B  #$07,D0  ; orig: C - - - - - 0x013382 04:B372: C9 07     CMP #$07
    BCS     b04_bra_B364             ; BCS  ; orig: C - - - - - 0x013384 04:B374: B0 EE     BCS b04_bra_B364
    BCC     b04_bra_B36A             ; BCC  ; orig: C - - - - - 0x013386 04:B376: 90 F2     BCC b04_bra_B36A    ; jm



sub_B378:  ; orig: sub_B378:
ofs_030_B378_03:  ; orig: ofs_030_B378_03:
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  (A0,D1.L),D0

    BNE     b04_bra_B3AC_RTS             ; BNE  ; orig: C - - - - - 0x01338A 04:B37A: D0 30     BNE b04_bra_B3AC_RTS
    MOVEA.L #$FF042C,A0  ; Fix X: ; (empty translation for DEC)  ; orig: C - - - - - 0x01338C 04:B37C: DE 2C 04  DEC ram_042B_enemy,X
    SUBQ.B  #1,(A0,D1.L)  ; ^
    BNE     b04_bra_B384             ; BNE  ; orig: C - - - - - 0x01338F 04:B37F: D0 03     BNE b04_bra_B384
    JMP     loc_B311  ; orig: C - - - - - 0x013391 04:B381: 4C 11 B3  JMP loc_B311
b04_bra_B384:  ; orig: b04_bra_B384:
    MOVE.B  #$10,D0  ; orig: C - - - - - 0x013394 04:B384: A9 10     LDA #$10
    MOVEA.L #ram_timer_enemy,A0
    MOVE.B  D0,(A0,D1.L)

sub_B388:  ; orig: sub_B388:
    BSR     sub_B39F             ; JSR -> BSR  ; orig: C - - - - - 0x013398 04:B388: 20 9F B3  JSR sub_B39F
    MOVEA.L #$FF0019,A0  ; Fix X: ; (empty translation for LDA)  ; orig: C - - - - - 0x01339B 04:B38B: B5 19     LDA ram_indiv_random
    MOVE.B  (A0,D1.L),D0  ; ^
    CMPI.B  #$A0,D0  ; orig: C - - - - - 0x01339D 04:B38D: C9 A0     CMP #$A0
    BCS     b04_bra_B398             ; BCS  ; orig: C - - - - - 0x01339F 04:B38F: B0 07     BCS b04_bra_B398
    ADDQ.B  #1,D2           ; INY  ; orig: C - - - - - 0x0133A1 04:B391: C8        INY
    CMPI.B  #$50,D0  ; orig: C - - - - - 0x0133A2 04:B392: C9 50     CMP #$50
    BCS     b04_bra_B398             ; BCS  ; orig: C - - - - - 0x0133A4 04:B394: B0 02     BCS b04_bra_B398
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0133A6 04:B396: 88        DEY
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0133A7 04:B397: 88        DEY
b04_bra_B398:  ; orig: b04_bra_B398:
    MOVE.B  D2,D0           ; TYA  ; orig: C - - - - - 0x0133A8 04:B398: 98        TYA
    ANDI.B  #$07,D0  ; orig: C - - - - - 0x0133A9 04:B399: 29 07     AND #$07
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0133AB 04:B39B: A8        TAY
    JMP     loc_B36A  ; orig: C - - - - - 0x0133AC 04:B39C: 4C 6A B3  JMP loc_B36A



sub_B39F:  ; orig: sub_B39F:

; out

; Y =
    MOVE.B  #$07,D2  ; orig: C - - - - - 0x0133AF 04:B39F: A0 07     LDY #$07
b04_bra_B3A1_loop:  ; orig: b04_bra_B3A1_loop:
    MOVEA.L #ram_dir_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVEA.L #tbl_B24E_direction,A0
    CMP.B  (A0,D2.L),D0

    BEQ     b04_bra_B3AC_RTS             ; BEQ  ; orig: C - - - - - 0x0133B6 04:B3A6: F0 04     BEQ b04_bra_B3AC_RTS
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x0133B8 04:B3A8: 88        DEY
    BPL     b04_bra_B3A1_loop             ; BPL  ; orig: C - - - - - 0x0133B9 04:B3A9: 10 F6     BPL b04_bra_B3A1_loop
    ADDQ.B  #1,D2           ; INY  ; orig: - - - - - - 0x0133BB 04:B3AB: C8        INY
b04_bra_B3AC_RTS:  ; orig: b04_bra_B3AC_RTS:
    RTS                     ; RTS  ; orig: C - - - - - 0x0133BC 04:B3AC: 60        RTS



tbl_B3AD:  ; orig: tbl_B3AD:
    ; [DIRECTIVE] .BYTE $00  -- needs manual handling  ; orig: - D 1 - - - 0x0133BD 04:B3AD: 00        .byte $00   ; 00
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - - - 0x0133BE 04:B3AE: 18        .byte $18   ; 01
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x0133BF 04:B3AF: 30        .byte $30   ; 02
    ; [DIRECTIVE] .BYTE $47  -- needs manual handling  ; orig: - D 1 - - - 0x0133C0 04:B3B0: 47        .byte $47   ; 03
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - - - 0x0133C1 04:B3B1: 5A        .byte $5A   ; 04
    ; [DIRECTIVE] .BYTE $6A  -- needs manual handling  ; orig: - D 1 - - - 0x0133C2 04:B3B2: 6A        .byte $6A   ; 05
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - - - 0x0133C3 04:B3B3: 76        .byte $76   ; 06
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - - - 0x0133C4 04:B3B4: 7D        .byte $7D   ; 07
    ; [DIRECTIVE] .BYTE $80  -- needs manual handling  ; orig: - D 1 - - - 0x0133C5 04:B3B5: 80        .byte $80   ; 08
    ; [DIRECTIVE] .BYTE $7D  -- needs manual handling  ; orig: - D 1 - - - 0x0133C6 04:B3B6: 7D        .byte $7D   ; 09
    ; [DIRECTIVE] .BYTE $76  -- needs manual handling  ; orig: - D 1 - - - 0x0133C7 04:B3B7: 76        .byte $76   ; 0A
    ; [DIRECTIVE] .BYTE $6A  -- needs manual handling  ; orig: - D 1 - - - 0x0133C8 04:B3B8: 6A        .byte $6A   ; 0B
    ; [DIRECTIVE] .BYTE $5A  -- needs manual handling  ; orig: - D 1 - - - 0x0133C9 04:B3B9: 5A        .byte $5A   ; 0C
    ; [DIRECTIVE] .BYTE $47  -- needs manual handling  ; orig: - D 1 - - - 0x0133CA 04:B3BA: 47        .byte $47   ; 0D
    ; [DIRECTIVE] .BYTE $30  -- needs manual handling  ; orig: - D 1 - - - 0x0133CB 04:B3BB: 30        .byte $30   ; 0E
    ; [DIRECTIVE] .BYTE $18  -- needs manual handling  ; orig: - D 1 - - - 0x0133CC 04:B3BC: 18        .byte $18   ; 0F



sub_B3BD:  ; orig: sub_B3BD:

; in

; A =

; Y =
    MOVE.B  D0,ram_0006_t11  ; orig: C - - - - - 0x0133CD 04:B3BD: 85 06     STA ram_0006_t11
    MOVE.B  D2,ram_0005_t04  ; orig: C - - - - - 0x0133CF 04:B3BF: 84 05     STY ram_0005_t04
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x0133D4 04:B3C4: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x0133D6 04:B3C6: A8        TAY
    MOVEA.L #tbl_B3AD,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0000_t5D  ; orig: C - - - - - 0x0133DA 04:B3CA: 85 00     STA ram_0000_t5D
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0005_t04,D2  ; orig: C - - - - - 0x0133DF 04:B3CF: A4 05     LDY ram_0005_t04
    BSR     sub_B43A             ; JSR -> BSR  ; orig: C - - - - - 0x0133E1 04:B3D1: 20 3A B4  JSR sub_B43A
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI.B  #$18,D0  ; orig: C - - - - - 0x0133E7 04:B3D7: 29 18     AND #$18
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x0133E9 04:B3D9: C9 10     CMP #$10
    BCC     b04_bra_B3ED             ; BCC  ; orig: C - - - - - 0x0133EB 04:B3DB: 90 10     BCC b04_bra_B3ED
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x0133F0 04:B3E0: 38        SEC
    MOVE.B  ram_0002_t37_lo,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x0133F1 04:B3E1: E5 02     SBC ram_0002_t37_lo

    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t14_hi,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x0133F8 04:B3E8: E5 03     SBC ram_0003_t14_hi

    JMP     loc_B3FA  ; orig: C - - - - - 0x0133FA 04:B3EA: 4C FA B3  JMP loc_B3FA
b04_bra_B3ED:  ; orig: b04_bra_B3ED:
    MOVEA.L #ram_0412,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x013400 04:B3F0: 18        CLC
    MOVE.B  ram_0002_t37_lo,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x013401 04:B3F1: 65 02     ADC ram_0002_t37_lo

    MOVEA.L #ram_0412,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t14_hi,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x013408 04:B3F8: 65 03     ADC ram_0003_t14_hi

loc_B3FA:  ; orig: loc_B3FA:
    MOVEA.L #ram_pos_X_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01340F 04:B3FF: 18        CLC
    ADD.B  #$08,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x013410 04:B400: 69 08     ADC #$08
    ANDI.B  #$0F,D0  ; orig: C - - - - - 0x013412 04:B402: 29 0F     AND #$0F
    MOVE.B  D0,D2           ; TAY  ; orig: C - - - - - 0x013414 04:B404: A8        TAY
    MOVEA.L #tbl_B3AD,A0
    MOVE.B  (A0,D2.L),D0

    MOVE.B  D0,ram_0000_t5D  ; orig: C - - - - - 0x013418 04:B408: 85 00     STA ram_0000_t5D
    MOVEA.L #ram_03BC_obj,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0006_t11,D2  ; orig: C - - - - - 0x01341D 04:B40D: A4 06     LDY ram_0006_t11
    BSR     sub_B43A             ; JSR -> BSR  ; orig: C - - - - - 0x01341F 04:B40F: 20 3A B4  JSR sub_B43A
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x013425 04:B415: 38        SEC
    SUB.B  #$08,D0       ; SBC imm  ; orig: C - - - - - 0x013426 04:B416: E9 08     SBC #$08
    ANDI.B  #$18,D0  ; orig: C - - - - - 0x013428 04:B418: 29 18     AND #$18
    CMPI.B  #$10,D0  ; orig: C - - - - - 0x01342A 04:B41A: C9 10     CMP #$10
    BCC     b04_bra_B42C             ; BCC  ; orig: C - - - - - 0x01342C 04:B41C: 90 0E     BCC b04_bra_B42C
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x013431 04:B421: 38        SEC
    MOVE.B  ram_0002_t37_lo,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x013432 04:B422: E5 02     SBC ram_0002_t37_lo

    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t14_hi,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x013439 04:B429: E5 03     SBC ram_0003_t14_hi

    RTS                     ; RTS  ; orig: C - - - - - 0x01343B 04:B42B: 60        RTS
b04_bra_B42C:  ; orig: b04_bra_B42C:
    MOVEA.L #ram_041F,A0
    MOVE.B  (A0,D1.L),D0

    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01343F 04:B42F: 18        CLC
    MOVE.B  ram_0002_t37_lo,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x013440 04:B430: 65 02     ADC ram_0002_t37_lo

    MOVEA.L #ram_041F,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_pos_Y_enemy,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  ram_0003_t14_hi,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x013447 04:B437: 65 03     ADC ram_0003_t14_hi

    RTS                     ; RTS  ; orig: C - - - - - 0x013449 04:B439: 60        RTS



sub_B43A:  ; orig: sub_B43A:

; in

; A =

; ram_0000_t5D

; out

; ram_0002_t37_lo

; ram_0003_t14_hi
    MOVE.B  D0,ram_0001_t26  ; orig: C - - - - - 0x01344A 04:B43A: 85 01     STA ram_0001_t26
    MOVE.B  #$00,D0  ; orig: C - - - - - 0x01344C 04:B43C: A9 00     LDA #$00
    MOVE.B  D0,ram_0002_t37_lo  ; orig: C - - - - - 0x01344E 04:B43E: 85 02     STA ram_0002_t37_lo
    MOVE.B  D0,ram_0003_t14_hi  ; orig: C - - - - - 0x013450 04:B440: 85 03     STA ram_0003_t14_hi
b04_bra_B442_loop:  ; orig: b04_bra_B442_loop:
    MOVE.B  (ram_0002_t37_lo).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0002_t37_lo).l  ; orig: C - - - - - 0x013452 04:B442: 06 02     ASL ram_0002_t37_lo

    MOVE.B  (ram_0003_t14_hi).l,D3
    ROXL.B  #1,D3
    MOVE.B  D3,(ram_0003_t14_hi).l  ; orig: C - - - - - 0x013454 04:B444: 26 03     ROL ram_0003_t14_hi

    MOVE.B  (ram_0000_t5D).l,D3
    ASL.B  #1,D3
    MOVE.B  D3,(ram_0000_t5D).l  ; orig: C - - - - - 0x013456 04:B446: 06 00     ASL ram_0000_t5D

    BCC     b04_bra_B455             ; BCC  ; orig: C - - - - - 0x013458 04:B448: 90 0B     BCC b04_bra_B455
    MOVE.B  ram_0002_t37_lo,D0  ; orig: C - - - - - 0x01345A 04:B44A: A5 02     LDA ram_0002_t37_lo
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x01345C 04:B44C: 18        CLC
    MOVE.B  ram_0001_t26,D3
    ADD.B   D3,D0  ; orig: C - - - - - 0x01345D 04:B44D: 65 01     ADC ram_0001_t26

    MOVE.B  D0,ram_0002_t37_lo  ; orig: C - - - - - 0x01345F 04:B44F: 85 02     STA ram_0002_t37_lo
    BCC     b04_bra_B455             ; BCC  ; orig: C - - - - - 0x013461 04:B451: 90 02     BCC b04_bra_B455

; if overflow
    ADDQ.B  #1,ram_0003_t14_hi  ; orig: - - - - - - 0x013463 04:B453: E6 03     INC ram_0003_t14_hi
b04_bra_B455:  ; orig: b04_bra_B455:
    SUBQ.B  #1,D2           ; DEY  ; orig: C - - - - - 0x013465 04:B455: 88        DEY
    BNE     b04_bra_B442_loop             ; BNE  ; orig: C - - - - - 0x013466 04:B456: D0 EA     BNE b04_bra_B442_loop
    RTS                     ; RTS  ; orig: C - - - - - 0x013468 04:B458: 60        RTS



sub_B459:  ; orig: sub_B459:

; in

; A =

; ram_000B_t07_useless_00
    MOVE.B  D0,ram_000A_t09  ; orig: C - - - - - 0x013469 04:B459: 85 0A     STA ram_000A_t09
    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  (A0,D1.L),D0

    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x01346E 04:B45E: 38        SEC
    MOVE.B  ram_000A_t09,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x01346F 04:B45F: E5 0A     SBC ram_000A_t09

    MOVEA.L #ram_0380_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  (A0,D1.L),D0


; bzk optimize, always 00
    MOVE.B  ram_000B_t07_useless_00,D3
    SUB.B   D3,D0  ; orig: C - - - - - 0x013477 04:B467: E5 0B     SBC ram_000B_t07_use

    ANDI.B  #$1F,D0  ; orig: C - - - - - 0x013479 04:B469: 29 1F     AND #$1F
    MOVEA.L #ram_0394_enemy,A0
    MOVE.B  D0,(A0,D1.L)

    RTS                     ; RTS  ; orig: C - - - - - 0x01347E 04:B46E: 60        RTS



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF  -- needs manual handling  ; orig: - - - - - - 0x01347F 04:B46F: FF        .byte $FF   ;
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013480 04:B470: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013490 04:B480: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134A0 04:B490: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134B0 04:B4A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134C0 04:B4B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134D0 04:B4C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134E0 04:B4D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0134F0 04:B4E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013500 04:B4F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013510 04:B500: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013520 04:B510: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013530 04:B520: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013540 04:B530: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013550 04:B540: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013560 04:B550: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013570 04:B560: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013580 04:B570: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013590 04:B580: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135A0 04:B590: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135B0 04:B5A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135C0 04:B5B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135D0 04:B5C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135E0 04:B5D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0135F0 04:B5E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013600 04:B5F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013610 04:B600: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013620 04:B610: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013630 04:B620: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013640 04:B630: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013650 04:B640: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013660 04:B650: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013670 04:B660: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013680 04:B670: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013690 04:B680: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136A0 04:B690: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136B0 04:B6A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136C0 04:B6B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136D0 04:B6C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136E0 04:B6D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0136F0 04:B6E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013700 04:B6F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013710 04:B700: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013720 04:B710: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013730 04:B720: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013740 04:B730: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013750 04:B740: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013760 04:B750: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013770 04:B760: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013780 04:B770: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013790 04:B780: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137A0 04:B790: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137B0 04:B7A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137C0 04:B7B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137D0 04:B7C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137E0 04:B7D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0137F0 04:B7E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013800 04:B7F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013810 04:B800: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013820 04:B810: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013830 04:B820: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013840 04:B830: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013850 04:B840: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013860 04:B850: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013870 04:B860: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013880 04:B870: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013890 04:B880: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138A0 04:B890: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138B0 04:B8A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138C0 04:B8B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138D0 04:B8C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138E0 04:B8D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0138F0 04:B8E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013900 04:B8F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013910 04:B900: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013920 04:B910: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013930 04:B920: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013940 04:B930: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013950 04:B940: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013960 04:B950: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013970 04:B960: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013980 04:B970: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013990 04:B980: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139A0 04:B990: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139B0 04:B9A0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139C0 04:B9B0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139D0 04:B9C0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139E0 04:B9D0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x0139F0 04:B9E0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A00 04:B9F0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A10 04:BA00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A20 04:BA10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A30 04:BA20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A40 04:BA30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A50 04:BA40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A60 04:BA50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A70 04:BA60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A80 04:BA70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013A90 04:BA80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AA0 04:BA90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AB0 04:BAA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AC0 04:BAB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AD0 04:BAC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AE0 04:BAD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013AF0 04:BAE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B00 04:BAF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B10 04:BB00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B20 04:BB10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B30 04:BB20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B40 04:BB30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B50 04:BB40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B60 04:BB50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B70 04:BB60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B80 04:BB70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013B90 04:BB80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BA0 04:BB90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BB0 04:BBA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BC0 04:BBB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BD0 04:BBC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BE0 04:BBD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013BF0 04:BBE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C00 04:BBF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C10 04:BC00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C20 04:BC10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C30 04:BC20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C40 04:BC30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C50 04:BC40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C60 04:BC50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C70 04:BC60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C80 04:BC70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013C90 04:BC80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CA0 04:BC90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CB0 04:BCA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CC0 04:BCB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CD0 04:BCC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CE0 04:BCD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013CF0 04:BCE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D00 04:BCF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D10 04:BD00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D20 04:BD10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D30 04:BD20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D40 04:BD30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D50 04:BD40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D60 04:BD50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D70 04:BD60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D80 04:BD70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013D90 04:BD80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DA0 04:BD90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DB0 04:BDA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DC0 04:BDB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DD0 04:BDC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DE0 04:BDD0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013DF0 04:BDE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E00 04:BDF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E10 04:BE00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E20 04:BE10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E30 04:BE20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E40 04:BE30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E50 04:BE40: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E60 04:BE50: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E70 04:BE60: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E80 04:BE70: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013E90 04:BE80: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013EA0 04:BE90: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013EB0 04:BEA0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013EC0 04:BEB0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013ED0 04:BEC0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013EE0 04:BED0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013EF0 04:BEE0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F00 04:BEF0: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F10 04:BF00: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F20 04:BF10: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F30 04:BF20: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F40 04:BF30: FF        .byte $FF, $FF, $FF,
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x013F50 04:BF40: FF        .byte $FF, $FF, $FF,



    ; [DIRECTIVE] .SEGMENT "BANK_04i"  -- needs manual handling  ; orig: .segment "BANK_04i"
    ; [DIRECTIVE] .INCLUDE "copy_bank___BF50_BFF9.asm"  -- needs manual handling  ; orig: .include "copy_bank___BF50_BFF9.asm"



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank 04: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))  ; orig: .out .sprintf("Free bytes in bank 04: 0x%04X [%d]", ($BFFA -



    ; [DIRECTIVE] .SEGMENT "VECTORS_04"  -- needs manual handling  ; orig: .segment "VECTORS_04"
    ; [DIRECTIVE] .WORD vec_0x01E494_NMI  -- needs manual handling  ; orig: - - - - - - 0x01400A 04:BFFA: 84 E4     .word vec_0x01E494_N
    ; [DIRECTIVE] .WORD vec_inc_0x003F60_RESET  -- needs manual handling  ; orig: - - - - - - 0x01400C 04:BFFC: 50 BF     .word vec_inc_0x003F
    ; [DIRECTIVE] .WORD $BFF0  -- needs manual handling  ; orig: - - - - - - 0x01400E 04:BFFE: F0 BF     .word $BFF0 ; this g

; ── Translation Stats ──
; Translated:  5312
; Warnings:    1323
; Unknown:     1