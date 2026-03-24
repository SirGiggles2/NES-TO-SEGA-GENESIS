; ═══════════════════════════════════════
; AUTO-TRANSLATED from NES 6502 → Sega Genesis 68000
; ── VDP Layer included via vdp_layer.asm ──
; Run: include "vdp_layer.asm" in your main build

; Source: bank_03.asm
; !! This is a FIRST PASS - hardware I/O needs manual work !!
; Register mapping:
;   A (accumulator) → D0
;   X (index)       → D1
;   Y (index)       → D2
;   Temp            → D3, D4, D5
;   NES RAM base    → A0 = $FF0000
; ═══════════════════════════════════════

    ; [DIRECTIVE] .SEGMENT "BANK_03"  -- needs manual handling  ; orig: .segment "BANK_03"
    ; [DIRECTIVE] .INCLUDE "copy_bank_ram.inc"  -- needs manual handling  ; orig: .include "copy_bank_ram.inc"
    ; [DIRECTIVE] .INCLUDE "copy_bank_val.inc"  -- needs manual handling  ; orig: .include "copy_bank_val.inc"
    ; [DIRECTIVE] .ORG $8000  -- needs manual handling  ; orig: .org $8000  ; for listing file

; 0x00C010-0x01000F



    ; [DIRECTIVE] .EXPORT sub_0x00C054_fill_ppu_with_tiles_3  -- needs manual handling  ; orig: .export sub_0x00C054_fi



b03_tbl_8000_tiles:  ; orig: b03_tbl_8000_tiles:
    ; [DIRECTIVE] .WORD _off004_9DBB_00  -- needs manual handling  ; orig: - - - - - - 0x00C010 03:8000: BB 9D     .wor
    ; [DIRECTIVE] .WORD _off004_9DBB_01  -- needs manual handling  ; orig: - D 0 - - - 0x00C012 03:8002: BB 9D     .wor
    ; [DIRECTIVE] .WORD _off004_9DBB_02  -- needs manual handling  ; orig: - D 0 - - - 0x00C014 03:8004: BB 9D     .wor
    ; [DIRECTIVE] .WORD _off004_987B_03  -- needs manual handling  ; orig: - D 0 - - - 0x00C016 03:8006: 7B 98     .wor
    ; [DIRECTIVE] .WORD _off004_9A9B_04  -- needs manual handling  ; orig: - D 0 - - - 0x00C018 03:8008: 9B 9A     .wor
    ; [DIRECTIVE] .WORD _off004_987B_05  -- needs manual handling  ; orig: - D 0 - - - 0x00C01A 03:800A: 7B 98     .wor
    ; [DIRECTIVE] .WORD _off004_9A9B_06  -- needs manual handling  ; orig: - D 0 - - - 0x00C01C 03:800C: 9B 9A     .wor
    ; [DIRECTIVE] .WORD _off004_9DBB_07  -- needs manual handling  ; orig: - D 0 - - - 0x00C01E 03:800E: BB 9D     .wor
    ; [DIRECTIVE] .WORD _off004_987B_08  -- needs manual handling  ; orig: - D 0 - - - 0x00C020 03:8010: 7B 98     .wor
    ; [DIRECTIVE] .WORD _off004_9A9B_09  -- needs manual handling  ; orig: - D 0 - - - 0x00C022 03:8012: 9B 9A     .wor



tbl_8014_tiles:  ; orig: tbl_8014_tiles:
    ; [DIRECTIVE] .WORD _off005_9FDB_00  -- needs manual handling  ; orig: - - - - - - 0x00C024 03:8014: DB 9F     .wor
    ; [DIRECTIVE] .WORD _off005_9FDB_01  -- needs manual handling  ; orig: - D 0 - - - 0x00C026 03:8016: DB 9F     .wor
    ; [DIRECTIVE] .WORD _off005_9FDB_02  -- needs manual handling  ; orig: - D 0 - - - 0x00C028 03:8018: DB 9F     .wor
    ; [DIRECTIVE] .WORD _off005_A3DB_03  -- needs manual handling  ; orig: - D 0 - - - 0x00C02A 03:801A: DB A3     .wor
    ; [DIRECTIVE] .WORD _off005_A3DB_04  -- needs manual handling  ; orig: - D 0 - - - 0x00C02C 03:801C: DB A3     .wor
    ; [DIRECTIVE] .WORD _off005_9FDB_05  -- needs manual handling  ; orig: - D 0 - - - 0x00C02E 03:801E: DB 9F     .wor
    ; [DIRECTIVE] .WORD _off005_A3DB_06  -- needs manual handling  ; orig: - D 0 - - - 0x00C030 03:8020: DB A3     .wor
    ; [DIRECTIVE] .WORD _off005_9FDB_07  -- needs manual handling  ; orig: - D 0 - - - 0x00C032 03:8022: DB 9F     .wor
    ; [DIRECTIVE] .WORD _off005_A3DB_08  -- needs manual handling  ; orig: - D 0 - - - 0x00C034 03:8024: DB A3     .wor
    ; [DIRECTIVE] .WORD _off005_A7DB_09  -- needs manual handling  ; orig: - D 0 - - - 0x00C036 03:8026: DB A7     .wor



tbl_8028_tiles_dungeon:  ; orig: tbl_8028_tiles_dungeon:
    ; [DIRECTIVE] .WORD tbl_811B___1700_1F1F  -- needs manual handling  ; orig: - D 0 - - - 0x00C038 03:8028: 1B 81    
    ; [DIRECTIVE] .WORD tbl_9CBB___08E0_09DF  -- needs manual handling  ; orig: - D 0 - - - 0x00C03A 03:802A: BB 9C    



tbl_802C_tiles_overworld:  ; orig: tbl_802C_tiles_overworld:
    ; [DIRECTIVE] .WORD tbl_893B___1700_1F1F  -- needs manual handling  ; orig: - D 0 - - - 0x00C03C 03:802C: 3B 89    
    ; [DIRECTIVE] .WORD tbl_915B___08E0_0FFF  -- needs manual handling  ; orig: - D 0 - - - 0x00C03E 03:802E: 5B 91    



tbl_8030_ppu_addr:
; common
    ; !! UNKNOWN: .DBYT $1700  ; orig: - D 0 - - - 0x00C040 03:8030: 17 00     .dbyt $1700     ; 17
    ; !! UNKNOWN: .DBYT $08E0  ; orig: - D 0 - - - 0x00C042 03:8032: 08 E0     .dbyt $08E0     ; 08
    ; !! UNKNOWN: .DBYT $09E0  ; orig: - D 0 - - - 0x00C044 03:8034: 09 E0     .dbyt $09E0     ; 09
    ; !! UNKNOWN: .DBYT $0C00  ; orig: - D 0 - - - 0x00C046 03:8036: 0C 00     .dbyt $0C00     ; 0C



tbl_8038_counter_overworld:  ; orig: tbl_8038_counter_overworld:
    ; !! UNKNOWN: .DBYT $0820  ; orig: - D 0 - - - 0x00C048 03:8038: 08 20     .dbyt $0820     ; 82
    ; !! UNKNOWN: .DBYT $0720  ; orig: - D 0 - - - 0x00C04A 03:803A: 07 20     .dbyt $0720     ; 72



tbl_803C_counter:  ; orig: tbl_803C_counter:
    ; !! UNKNOWN: .DBYT $0820  ; orig: - D 0 - - - 0x00C04C 03:803C: 08 20     .dbyt $0820     ; 82
    ; !! UNKNOWN: .DBYT $0100  ; orig: - D 0 - - - 0x00C04E 03:803E: 01 00     .dbyt $0100     ; 10
    ; !! UNKNOWN: .DBYT $0220  ; orig: - D 0 - - - 0x00C050 03:8040: 02 20     .dbyt $0220     ; 22
    ; !! UNKNOWN: .DBYT $0400  ; orig: - D 0 - - - 0x00C052 03:8042: 04 00     .dbyt $0400     ; 40



sub_0x00C054_fill_ppu_with_tiles_3:  ; orig: sub_0x00C054_fill_ppu_with_tiles_3:
    MOVE.W  #$0412,D0
    BSR     TRACE_MARK
    BSR     sub_0x01E635_disable_rendering_and_nmi             ; JSR -> BSR  ; orig: C - - - - - 0x00C054 03:8044: 20 2
    BSR     PPU_READ_2002
    CLR.B   ram_051D
    TST.B   ram_dungeon_level
    BNE     b03_load_dungeon_chr

    LEA     tbl_893B___1700_1F1F(PC),A0
    MOVE.W  #$1700,D0
    MOVE.W  #$0820,D1
    BSR     b03_copy_chr_chunk_to_shadow

    LEA     tbl_915B___08E0_0FFF(PC),A0
    MOVE.W  #$08E0,D0
    MOVE.W  #$0720,D1
    BSR     b03_copy_chr_chunk_to_shadow
    BRA     b03_flush_gameplay_chr

b03_load_dungeon_chr:
    LEA     tbl_811B___1700_1F1F(PC),A0
    MOVE.W  #$1700,D0
    MOVE.W  #$0820,D1
    BSR     b03_copy_chr_chunk_to_shadow

    LEA     tbl_9CBB___08E0_09DF(PC),A0
    MOVE.W  #$08E0,D0
    MOVE.W  #$0100,D1
    BSR     b03_copy_chr_chunk_to_shadow

    MOVEQ   #0,D0
    MOVE.B  ram_dungeon_level,D0
    CMPI.W  #10,D0
    BCS     b03_dungeon_level_ok
    MOVEQ   #0,D0
b03_dungeon_level_ok:
    ASL.W   #2,D0

    LEA     b03_dungeon_chr_09e0_table(PC),A1
    MOVEA.L (A1,D0.W),A0
    MOVE.W  #$09E0,D0
    MOVE.W  #$0220,D1
    BSR     b03_copy_chr_chunk_to_shadow

    MOVEQ   #0,D0
    MOVE.B  ram_dungeon_level,D0
    CMPI.W  #10,D0
    BCS     b03_dungeon_level_ok_2
    MOVEQ   #0,D0
b03_dungeon_level_ok_2:
    ASL.W   #2,D0
    LEA     b03_dungeon_chr_0c00_table(PC),A1
    MOVEA.L (A1,D0.W),A0
    MOVE.W  #$0C00,D0
    MOVE.W  #$0400,D1
    BSR     b03_copy_chr_chunk_to_shadow

b03_flush_gameplay_chr:
    MOVE.W  #$008E,D0
    MOVE.W  #$0072,D1
    BSR     PPU_FLUSH_TILE_RANGE_TO_VRAM
    MOVE.W  #$0170,D0
    MOVE.W  #$0082,D1
    BSR     PPU_FLUSH_TILE_RANGE_TO_VRAM
    CLR.B   ram_051D
    RTS

b03_copy_chr_chunk_to_shadow:
    TST.W   D1
    BEQ     b03_copy_chr_done
    MOVEA.L #PPU_CHR_SHADOW,A1
    ADDA.W  D0,A1
    MOVE.W  D1,D7
    LSR.W   #2,D7
    SUBQ.W  #1,D7
b03_copy_chr_loop:
    MOVE.L  (A0)+,(A1)+
    DBRA    D7,b03_copy_chr_loop
b03_copy_chr_done:
    RTS

b03_dungeon_chr_09e0_table:
    DC.L    _off004_9DBB_00
    DC.L    _off004_9DBB_01
    DC.L    _off004_9DBB_02
    DC.L    _off004_987B_03
    DC.L    _off004_9A9B_04
    DC.L    _off004_987B_05
    DC.L    _off004_9A9B_06
    DC.L    _off004_9DBB_07
    DC.L    _off004_987B_08
    DC.L    _off004_9A9B_09

b03_dungeon_chr_0c00_table:
    DC.L    _off005_9FDB_00
    DC.L    _off005_9FDB_01
    DC.L    _off005_9FDB_02
    DC.L    _off005_A3DB_03
    DC.L    _off005_A3DB_04
    DC.L    _off005_9FDB_05
    DC.L    _off005_A3DB_06
    DC.L    _off005_9FDB_07
    DC.L    _off005_A3DB_08
    DC.L    _off005_A7DB_09



sub_8080_select_tiles:  ; orig: sub_8080_select_tiles:

; out

; ram_0000_t12_ppu_data
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x00C090 03:8080: AD 1D 05  LDA ram_051D
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C093 03:8083: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C094 03:8084: AA        TAX
    MOVEA.L #tbl_8028_tiles_dungeon,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t12_ppu_data  ; orig: C - - - - - 0x00C098 03:8088: 85 00     STA ram_0000_t12_ppu
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C09A 03:808A: E8        INX
    MOVEA.L #tbl_8028_tiles_dungeon,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x00C09E 03:808E: 85 01  STA ram_0000_t12_ppu
    RTS                     ; RTS  ; orig: C - - - - - 0x00C0A0 03:8090: 60        RTS



sub_8091_select_tiles_and_counter:  ; orig: sub_8091_select_tiles_and_counter:

; out

; ram_0000_t12_ppu_data

; ram_0002_t25_data_counter_hi

; ram_0003_t05_data_counter_lo
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x00C0A1 03:8091: AD 1D 05  LDA ram_051D
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C0A4 03:8094: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C0A5 03:8095: AA        TAX
    MOVEA.L #tbl_802C_tiles_overworld,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t12_ppu_data  ; orig: C - - - - - 0x00C0A9 03:8099: 85 00     STA ram_0000_t12_ppu
    MOVEA.L #tbl_8038_counter_overworld,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0002_t25_data_counter_hi  ; orig: C - - - - - 0x00C0AE 03:809E: 85 02     STA ram_0002_t25_dat
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C0B0 03:80A0: E8        INX
    MOVEA.L #tbl_802C_tiles_overworld,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x00C0B4 03:80A4: 85 01  STA ram_0000_t12_ppu
    MOVEA.L #tbl_8038_counter_overworld,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0003_t05_data_counter_lo  ; orig: C - - - - - 0x00C0B9 03:80A9: 85 03     STA ram_0003_t05_dat
    RTS                     ; RTS  ; orig: C - - - - - 0x00C0BB 03:80AB: 60        RTS



sub_80AC_select_tiles:  ; orig: sub_80AC_select_tiles:

; out

; ram_0000_t12_ppu_data
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x00C0BC 03:80AC: A5 10     LDA ram_dungeon_leve
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C0BE 03:80AE: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C0BF 03:80AF: AA        TAX
    MOVEA.L #b03_tbl_8000_tiles,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t12_ppu_data  ; orig: C - - - - - 0x00C0C3 03:80B3: 85 00     STA ram_0000_t12_ppu
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C0C5 03:80B5: E8        INX
    MOVEA.L #b03_tbl_8000_tiles,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x00C0C9 03:80B9: 85 01  STA ram_0000_t12_ppu
    RTS                     ; RTS  ; orig: C - - - - - 0x00C0CB 03:80BB: 60        RTS



sub_80BC_select_tiles:  ; orig: sub_80BC_select_tiles:

; out

; ram_0000_t12_ppu_data
    MOVE.B  ram_dungeon_level,D0  ; orig: C - - - - - 0x00C0CC 03:80BC: A5 10     LDA ram_dungeon_leve
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C0CE 03:80BE: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C0CF 03:80BF: AA        TAX
    MOVEA.L #tbl_8014_tiles,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0000_t12_ppu_data  ; orig: C - - - - - 0x00C0D3 03:80C3: 85 00     STA ram_0000_t12_ppu
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C0D5 03:80C5: E8        INX
    MOVEA.L #tbl_8014_tiles,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x00C0D9 03:80C9: 85 01  STA ram_0000_t12_ppu
    RTS                     ; RTS  ; orig: C - - - - - 0x00C0DB 03:80CB: 60        RTS



sub_80CC_write_to_ppu:  ; orig: sub_80CC_write_to_ppu:

; in

; ram_0000_t12_ppu_data
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x00C0DC 03:80CC: AD 1D 05  LDA ram_051D
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C0DF 03:80CF: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C0E0 03:80D0: AA        TAX
    MOVEA.L #tbl_803C_counter,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0002_t25_data_counter_hi  ; orig: C - - - - - 0x00C0E4 03:80D4: 85 02     STA ram_0002_t25_dat
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C0E6 03:80D6: E8        INX
    MOVEA.L #tbl_803C_counter,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,ram_0003_t05_data_counter_lo  ; orig: C - - - - - 0x00C0EA 03:80DA: 85 03     STA ram_0003_t05_dat
sub_80DC_write_to_ppu:  ; orig: sub_80DC_write_to_ppu:

; in

; ram_0002_t25_data_counter_hi

; ram_0003_t05_data_counter_lo

; ram_0000_t12_ppu_data
    MOVE.B  ram_051D,D0  ; orig: C - - - - - 0x00C0EC 03:80DC: AD 1D 05  LDA ram_051D
    ASL.B   #1,D0           ; ASL A  ; orig: C - - - - - 0x00C0EF 03:80DF: 0A        ASL
    MOVE.B  D0,D1           ; TAX  ; orig: C - - - - - 0x00C0F0 03:80E0: AA        TAX
    MOVEA.L #tbl_8030_ppu_addr,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,D0  ; prep for PPU_WRITE_2006 (VRAM addr)  ; was: C - - - - - 0x00C0F4 03:80E4: 8D 06 20  STA $2006
    BSR     PPU_WRITE_2006
    ADDQ.B  #1,D1           ; INX  ; orig: C - - - - - 0x00C0F7 03:80E7: E8        INX
    MOVEA.L #tbl_8030_ppu_addr,A0
    MOVE.B  (A0,D1.L),D0

    MOVE.B  D0,D0  ; prep for PPU_WRITE_2006 (VRAM addr)  ; was: C - - - - - 0x00C0FB 03:80EB: 8D 06 20  STA $2006
    BSR     PPU_WRITE_2006
    MOVE.B  #$00,D2  ; orig: C - - - - - 0x00C0FE 03:80EE: A0 00     LDY #$00
b03_bra_80F0_loop:  ; orig: b03_bra_80F0_loop:
    MOVEA.L #ram_0000_t12_ppu_data,A0
    MOVE.W  (A0),D5
    ROL.W   #8,D5
    MOVEA.W D5,A1

    MOVEA.L A1,A0
    ADDA.L  #$FF0000,A0
    MOVE.B  (A0,D2.W),D0

    MOVE.B  D0,D0  ; prep for PPU_WRITE_2007 (VRAM data)  ; was: C - - - - - 0x00C102 03:80F2: 8D 07 20  STA $2007
    BSR     PPU_WRITE_2007
    MOVE.B  ram_0000_t12_ppu_data,D0  ; orig: C - - - - - 0x00C105 03:80F5: A5 00     LDA ram_0000_t12_ppu
    ANDI    #$FFFE,SR       ; CLC (clear carry)  ; orig: C - - - - - 0x00C107 03:80F7: 18        CLC
    ADD.B  #$01,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00C108 03:80F8: 69 01     ADC #$01
    MOVE.B  D0,ram_0000_t12_ppu_data  ; orig: C - - - - - 0x00C10A 03:80FA: 85 00     STA ram_0000_t12_ppu
    MOVE.B  $FF0001,D0  ; FIX v378: LDA $01  ; orig: C - - - - - 0x00C10C 03:80FC: A5 01  LDA ram_0000_t12_ppu
    ADD.B  #$00,D0       ; ADC imm (uses X flag for carry)  ; orig: C - - - - - 0x00C10E 03:80FE: 69 00     ADC #$00
    MOVE.B  D0,$FF0001  ; FIX v378: STA $01  ; orig: C - - - - - 0x00C110 03:8100: 85 01  STA ram_0000_t12_ppu
    MOVE.B  ram_0003_t05_data_counter_lo,D0  ; orig: C - - - - - 0x00C112 03:8102: A5 03     LDA ram_0003_t05_dat
    ORI     #$0001,SR       ; SEC (set carry)  ; orig: C - - - - - 0x00C114 03:8104: 38        SEC
    SUB.B  #$01,D0       ; SBC imm  ; orig: C - - - - - 0x00C115 03:8105: E9 01     SBC #$01
    MOVE.B  D0,ram_0003_t05_data_counter_lo  ; orig: C - - - - - 0x00C117 03:8107: 85 03     STA ram_0003_t05_dat
    MOVE.B  ram_0002_t25_data_counter_hi,D0  ; orig: C - - - - - 0x00C119 03:8109: A5 02     LDA ram_0002_t25_dat
    SUB.B  #$00,D0       ; SBC imm  ; orig: C - - - - - 0x00C11B 03:810B: E9 00     SBC #$00
    MOVE.B  D0,ram_0002_t25_data_counter_hi  ; orig: C - - - - - 0x00C11D 03:810D: 85 02     STA ram_0002_t25_dat

; bzk optimize, useless LDA
    MOVE.B  ram_0002_t25_data_counter_hi,D0  ; orig: C - - - - - 0x00C11F 03:810F: A5 02     LDA ram_0002_t25_dat
    BNE     b03_bra_80F0_loop             ; BNE  ; orig: C - - - - - 0x00C121 03:8111: D0 DD     BNE b03_bra_80F0_loop
    MOVE.B  ram_0003_t05_data_counter_lo,D0  ; orig: C - - - - - 0x00C123 03:8113: A5 03     LDA ram_0003_t05_dat
    BNE     b03_bra_80F0_loop             ; BNE  ; orig: C - - - - - 0x00C125 03:8115: D0 D9     BNE b03_bra_80F0_loop
    ADDQ.B  #1,ram_051D  ; orig: C - - - - - 0x00C127 03:8117: EE 1D 05  INC ram_051D
    RTS                     ; RTS  ; orig: C - - - - - 0x00C12A 03:811A: 60        RTS



tbl_811B___1700_1F1F:  ; orig: tbl_811B___1700_1F1F:

; 0x00C12B
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___811B_893A.chr"



tbl_893B___1700_1F1F:  ; orig: tbl_893B___1700_1F1F:

; 0x00C94B
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___893B_915A.chr"



tbl_915B___08E0_0FFF:  ; orig: tbl_915B___08E0_0FFF:

; 0x00D16B
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___915B_987A.chr"



_off004_987B_03:  ; orig: _off004_987B_03:
_off004_987B_05:  ; orig: _off004_987B_05:
_off004_987B_08:  ; orig: _off004_987B_08:

; 0x00D88B
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___987B_9A9A.chr"



_off004_9A9B_04:  ; orig: _off004_9A9B_04:
_off004_9A9B_06:  ; orig: _off004_9A9B_06:
_off004_9A9B_09:  ; orig: _off004_9A9B_09:

; 0x00DAAB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___9A9B_9CBA.chr"



tbl_9CBB___08E0_09DF:  ; orig: tbl_9CBB___08E0_09DF:

; 0x00DCCB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___9CBB_9DBA.chr"



_off004_9DBB_00:  ; orig: _off004_9DBB_00:
_off004_9DBB_01:  ; orig: _off004_9DBB_01:
_off004_9DBB_02:  ; orig: _off004_9DBB_02:
_off004_9DBB_07:  ; orig: _off004_9DBB_07:

; 0x00DDCB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___9DBB_9FDA.chr"



_off005_9FDB_00:  ; orig: _off005_9FDB_00:
_off005_9FDB_01:  ; orig: _off005_9FDB_01:
_off005_9FDB_02:  ; orig: _off005_9FDB_02:
_off005_9FDB_05:  ; orig: _off005_9FDB_05:
_off005_9FDB_07:  ; orig: _off005_9FDB_07:

; 0x00DFEB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___9FDB_A3DA.chr"



_off005_A3DB_03:  ; orig: _off005_A3DB_03:
_off005_A3DB_04:  ; orig: _off005_A3DB_04:
_off005_A3DB_06:  ; orig: _off005_A3DB_06:
_off005_A3DB_08:  ; orig: _off005_A3DB_08:

; 0x00E3EB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___A3DB_A7DA.chr"



_off005_A7DB_09:  ; orig: _off005_A7DB_09:

; 0x00E7EB
    INCBIN  "..\artifacts\nes_original_build\incbin\chr\03___A7DB_ABDA.chr"



; bzk garbage
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF  -- needs manual handling  ; orig: - - - - - - 0x00EBEB 03:ABDB: FF    
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual
    ; [DIRECTIVE] .BYTE $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF  -- needs manual



    ; [DIRECTIVE] .SEGMENT "BANK_03i"  -- needs manual handling  ; orig: .segment "BANK_03i"
    ; [DIRECTIVE] .INCLUDE "copy_bank___BF50_BFF9.asm"  -- needs manual handling  ; orig: .include "copy_bank___BF50_BF



    ; !! UNKNOWN: .OUT .sprintf("Free bytes in bank 03: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))  ; orig: .out .sprintf(



    ; [DIRECTIVE] .SEGMENT "VECTORS_03"  -- needs manual handling  ; orig: .segment "VECTORS_03"
    ; [DIRECTIVE] .WORD vec_0x01E494_NMI  -- needs manual handling  ; orig: - - - - - - 0x01000A 03:BFFA: 84 E4     .wo
    ; [DIRECTIVE] .WORD vec_inc_0x003F60_RESET  -- needs manual handling  ; orig: - - - - - - 0x01000C 03:BFFC: 50 BF  
    ; [DIRECTIVE] .WORD $BFF0  -- needs manual handling  ; orig: - - - - - - 0x01000E 03:BFFE: F0 BF     .word $BFF0 ; 

; ── Translation Stats ──
; Translated:  93
; Warnings:    351
; Unknown:     21

