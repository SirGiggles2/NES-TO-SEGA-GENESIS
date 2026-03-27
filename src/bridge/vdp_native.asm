; ═══════════════════════════════════════════════════════════════════════════════
; vdp_native.asm - Genesis-Native VDP Bridge (VDP_ALT Branch)
; ═══════════════════════════════════════════════════════════════════════════════
; Philosophy: Direct VRAM writes, no PPU emulation layer, Genesis-optimized layout
; Replaces: vdp_layer.asm (1551 lines) with streamlined native implementation
; ═══════════════════════════════════════════════════════════════════════════════

; ─────────────────────────────────────────────────────────────────────────────
; VDP Hardware Ports
; ─────────────────────────────────────────────────────────────────────────────
VDP_DATA        EQU $C00000
VDP_CTRL        EQU $C00004
VDP_HVCOUNTER   EQU $C00008

; ─────────────────────────────────────────────────────────────────────────────
; VDP Registers (Control writes)
; ─────────────────────────────────────────────────────────────────────────────
VDP_REG_MODE1       EQU $80
VDP_REG_MODE2       EQU $81
VDP_REG_PLANE_A     EQU $82
VDP_REG_PLANE_B     EQU $84
VDP_REG_SPRITE      EQU $85
VDP_REG_BGCOLOR     EQU $87
VDP_REG_HSCROLL     EQU $8D
VDP_REG_AUTOINC     EQU $8F
VDP_REG_SCROLL_MODE EQU $90
VDP_REG_HPOS        EQU $91
VDP_REG_VPOS        EQU $92
VDP_REG_DMA_LEN_H   EQU $93
VDP_REG_DMA_LEN_L   EQU $94
VDP_REG_DMA_SRC_H   EQU $95
VDP_REG_DMA_SRC_M   EQU $96
VDP_REG_DMA_SRC_L   EQU $97

; ─────────────────────────────────────────────────────────────────────────────
; Genesis VRAM Layout (per docs/VDP_ALT_VRAM_LAYOUT.md)
; ─────────────────────────────────────────────────────────────────────────────

; Tile/Pattern Banks (16KB total, $0000-$3FFF)
TILE_BANK_0_VRAM    EQU $0000   ; NES CHR Bank 0 (512 tiles @ 32B each)
TILE_BANK_1_VRAM    EQU $1000   ; NES CHR Bank 1
TILE_BANK_2_VRAM    EQU $2000   ; Sprites
TILE_BANK_3_VRAM    EQU $3000   ; UI/Effects

; Sprite Resources
SPRITE_TILE_VRAM    EQU $4000   ; 128 sprite tile definitions
SPRITE_OAM_VRAM     EQU $7E00   ; Object Attribute Table (80 sprites × 8B)

; Scroll/Sync Tables
HSCROLL_TABLE_VRAM  EQU $7000   ; 224 entries (per-scanline H-scroll)

; Nametables (8KB each)
PLANE_A_VRAM        EQU $8000   ; 64×64 tiles = 4KB nametable
PLANE_B_VRAM        EQU $A000   ; 64×64 tiles = 4KB nametable

; Tile Properties
TILE_SIZE_BYTES     EQU 32      ; 8×8 @ 4bpp
TILES_PER_BANK      EQU 512
BANK_SIZE_BYTES     EQU 16384   ; 512 tiles × 32 bytes = 16KB

; ─────────────────────────────────────────────────────────────────────────────
; RAM Shadows & Working State
; ─────────────────────────────────────────────────────────────────────────────
VDP_SHADOW_BASE     EQU $FFFFEF00

PPUCTRL_SHADOW      EQU $FFFFEF00   ; NES $2000 control state
PPUMASK_SHADOW      EQU $FFFFEF01   ; NES $2001 mask state
PPUADDR_HI          EQU $FFFFEF02   ; NES $2006 high byte latch
PPUADDR_LO          EQU $FFFFEF03   ; NES $2006 low byte latch
PPUADDR_LATCH       EQU $FFFFEF04   ; Latch state for 2006/2007 sequencing
PPUSCROLL_X         EQU $FFFFEF05   ; Current X scroll (from $2005)
PPUSCROLL_Y         EQU $FFFFEF06   ; Current Y scroll (from $2005)
PPUSCROLL_LATCH     EQU $FFFFEF07   ; Latch state for 2005 sequencing

VRAM_ADDR_CURR      EQU $FFFFEF08   ; NES current VRAM address (from 2006)
PPUDATA_BUFFER      EQU $FFFFEF0C   ; Read buffer for 2007 reads

VDP_REG1_SHADOW     EQU $FFFFEF0A   ; VDP Register 1 state

; NES Palette & Pattern Buffer Shadows
PPU_PAL_SHADOW      EQU $00FF9200   ; 32 bytes (NES palette cache)
PPU_CHR_SHADOW      EQU $00FFC000   ; CHR pattern cache

; ─────────────────────────────────────────────────────────────────────────────
; NES Address Space Constants
; ─────────────────────────────────────────────────────────────────────────────
; NES VRAM Address Ranges
NES_PATTERN_TABLE_0 EQU $0000   ; $0000-$0FFF
NES_PATTERN_TABLE_1 EQU $1000   ; $1000-$1FFF
NES_NAMETABLE_BASE  EQU $2000   ; $2000-$2FFF
NES_PALETTE_BASE    EQU $3F00   ; $3F00-$3FFF

; VDP Display Mode
VDP_MODE_H32        EQU $8C00   ; Standard Genesis H32 mode (256px wide)
VDP_MODE_H40        EQU $8C81   ; H40 mode (320px wide) - not currently used

; ─────────────────────────────────────────────────────────────────────────────
; Palette Settings (NES → Genesis)
; ─────────────────────────────────────────────────────────────────────────────
NES_PAL_WIDTH       EQU 16      ; 16 colors per palette
CRAM_PALETTE_0      EQU $00     ; Palette 0 start in CRAM
CRAM_PALETTE_1      EQU $10
CRAM_PALETTE_2      EQU $20
CRAM_PALETTE_3      EQU $30

; ═══════════════════════════════════════════════════════════════════════════════
; INITIALIZATION
; ═══════════════════════════════════════════════════════════════════════════════

VDP_INIT:
    ; Standard Genesis H32 mode, display off during init
    move.w  #$8000,($C00004)        ; Mode 1: disable DMA
    move.w  #$8134,($C00004)        ; Mode 2: H32, 224 lines, vint off
    move.w  #$8207,($C00004)        ; Plane A: $C000
    move.w  #$8407,($C00004)        ; Plane B: $E000 (unused, set for safety)
    move.w  #$857F,($C00004)        ; Sprite table: $7E00
    move.w  #$8700,($C00004)        ; BG color: entry 0, palette 0
    move.w  #$8D00,($C00004)        ; H-scroll: $0000 (unified, not per-line for now)
    move.w  #$8F02,($C00004)        ; Auto-increment: +2
    move.w  #$9001,($C00004)        ; Scroll mode: normal
    move.w  #$9100,($C00004)        ; H-window: off
    move.w  #$9200,($C00004)        ; V-window: off

    ; Clear VRAM
    bsr     VDP_CLEAR_VRAM
    
    ; Clear CRAM (all palettes black)
    bsr     VDP_CLEAR_CRAM
    
    ; Init RAM shadows
    bsr     VDP_INIT_SHADOWS
    
    rts


VDP_CLEAR_VRAM:
    ; Clear all 64KB of VRAM to $0000
    move.l  #$40000000,($C00004)    ; VDP VRAM write command, address $0000
    move.w  #$8F02,($C00004)        ; Auto-increment +2
    moveq   #0,D0
    move.w  #32767,D7               ; 32768 words = 65536 bytes = full 64KB
.vram_clear_loop:
    move.w  D0,($C00000)
    dbra    D7,.vram_clear_loop
    rts


VDP_CLEAR_CRAM:
    ; Clear CRAM (palette memory) to black
    move.l  #$C0000000,($C00004)    ; CRAM write command, address $0000
    moveq   #0,D0
    move.w  #63,D7                  ; 64 words = 128 colors (all palettes)
.cram_clear_loop:
    move.w  D0,($C00000)
    dbra    D7,.cram_clear_loop
    rts


VDP_INIT_SHADOWS:
    move.b  #$80,(PPUCTRL_SHADOW).l
    move.b  #$00,(PPUMASK_SHADOW).l
    move.b  #$00,(PPUADDR_LATCH).l
    move.b  #$00,(PPUSCROLL_LATCH).l
    move.w  #$0000,(VRAM_ADDR_CURR).l
    rts

; ═══════════════════════════════════════════════════════════════════════════════
; PPU HANDLERS - Direct VDP Dispatch (No Emulation Layer)
; ═══════════════════════════════════════════════════════════════════════════════

; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_2000: NES Control Register ($2000)
; ─────────────────────────────────────────────────────────────────────────────
; D0 received in D0.B on entry
; Controls: Nametable select, increment mode, sprite tile select, etc.
; For VDP_ALT, only NMI enable matters (bit 7)
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_2000:
    ori.b   #$80,D0
    move.b  D0,(PPUCTRL_SHADOW).l
    
    ; Extract NMI enable (bit 7) and apply to VDP register 1
    move.b  (VDP_REG1_SHADOW).l,D3
    btst    #7,D0
    beq     .disable_nmi
    ori.b   #$20,D3                 ; Enable V-int
    bra     .apply_reg1
.disable_nmi:
    andi.b  #$DF,D3                 ; Disable V-int
.apply_reg1:
    move.b  D3,(VDP_REG1_SHADOW).l
    move.w  #$8100,D4
    or.b    D3,D4
    move.w  D4,($C00004)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_2001: NES Mask Register ($2001)
; ─────────────────────────────────────────────────────────────────────────────
; D0 received in D0.B on entry
; Controls: Display enable (bits 3-4)
; VDP_ALT routes directly to display enable/disable
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_2001:
    move.b  D0,(PPUMASK_SHADOW).l
    
    ; Extract display enable bits (3-4)
    move.b  (VDP_REG1_SHADOW).l,D3
    move.b  D0,D4
    andi.b  #$18,D4                 ; Mask bits 3-4
    beq     .disable_display
    ori.b   #$40,D3                 ; Enable display
    bra     .apply_display
.disable_display:
    andi.b  #$BF,D3                 ; Disable display
.apply_display:
    move.b  D3,(VDP_REG1_SHADOW).l
    move.w  #$8100,D4
    or.b    D3,D4
    move.w  D4,($C00004)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_2005: NES Scroll Register ($2005)
; ─────────────────────────────────────────────────────────────────────────────
; D0 received in D0.B on entry
; Two-byte: first write = X scroll, second write = Y scroll
; VDP_ALT: X → HSCROLL table, Y → VSRAM
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_2005:
    tst.b   (PPUSCROLL_LATCH).l
    bne     .write_y
    
    ; First write: X scroll
    move.b  D0,(PPUSCROLL_X).l
    move.b  #1,(PPUSCROLL_LATCH).l
    
    ; Write to HSCROLL table at $7000
    move.w  #HSCROLL_TABLE_VRAM,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    moveq   #0,D3
    move.b  (PPUSCROLL_X).l,D3
    neg.w   D3
    move.w  D3,($C00000)
    rts
    
.write_y:
    ; Second write: Y scroll
    move.b  D0,(PPUSCROLL_Y).l
    clr.b   (PPUSCROLL_LATCH).l
    
    ; Write to VSRAM at $C00008
    moveq   #0,D3
    move.b  (PPUSCROLL_Y).l,D3
    move.w  D3,($C00008)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_2006: NES Address Register ($2006)
; ─────────────────────────────────────────────────────────────────────────────
; D0 received in D0.B on entry
; Two-byte: first write = high byte, second = low byte
; Sets VRAM address for subsequent 2007 reads/writes
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_2006:
    tst.b   (PPUADDR_LATCH).l
    bne     .write_lo
    
    move.b  D0,(PPUADDR_HI).l
    move.b  #1,(PPUADDR_LATCH).l
    rts
    
.write_lo:
    move.b  D0,(PPUADDR_LO).l
    clr.b   (PPUADDR_LATCH).l
    
    ; Combine high + low into 16-bit address
    move.b  (PPUADDR_HI).l,D3
    lsl.w   #8,D3
    move.b  (PPUADDR_LO).l,D3
    move.w  D3,(VRAM_ADDR_CURR).l
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_2007: NES Data Register ($2007)
; ─────────────────────────────────────────────────────────────────────────────
; D0 received in D0.B on entry
; Writes to VRAM at address set by 2006, auto-increments
; VDP_ALT: Direct routing by address range (pattern, nametable, palette)
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_2007:
    move.w  (VRAM_ADDR_CURR).l,D3
    
    ; Check address range
    cmp.w   #NES_NAMETABLE_BASE,D3  ; $2000?
    bhs     .check_palette
    
    ; Pattern/Tile write ($0000-$1FFF)
    movem.l D0-D7/A0,-(A7)
    bsr     PPU_WRITE_PATTERN_NATIVE
    movem.l (A7)+,D0-D7/A0
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts
    
.check_palette:
    cmp.w   #NES_PALETTE_BASE,D3    ; $3F00?
    bhs     .palette_write
    
    ; Nametable write ($2000-$2FFF)
    movem.l D0-D7/A0,-(A7)
    bsr     PPU_WRITE_NAMETABLE_NATIVE
    movem.l (A7)+,D0-D7/A0
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts
    
.palette_write:
    ; Palette write ($3F00-$3FFF)
    bsr     PPU_WRITE_PALETTE_NATIVE
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_PATTERN_NATIVE
; ─────────────────────────────────────────────────────────────────────────────
; D0.B contains pattern byte to write
; D3.W contains NES VRAM address ($0000-$1FFF)
; Maps NES pattern table to Genesis tile banks
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_PATTERN_NATIVE:
    ; For Phase 1: Store in CHR shadow for batch upload later
    ; (Real implementation would DMA or write directly)
    lea     (PPU_CHR_SHADOW).l,A0
    move.b  D0,(A0,D3.w)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_NAMETABLE_NATIVE
; ─────────────────────────────────────────────────────────────────────────────
; D0.B contains nametable byte
; D3.W contains NES VRAM address ($2000-$2FFF)
; Maps to Genesis Plane A ($8000) or Plane B ($A000) nametable
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_NAMETABLE_NATIVE:
    ; Compute offset: NES nametable addresses map to Genesis VRAM
    ; For now, store in shadow and sync on demand
    ; TODO: Implement real-time write
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_WRITE_PALETTE_NATIVE
; ─────────────────────────────────────────────────────────────────────────────
; D0.B contains palette byte
; D3.W contains NES palette address ($3F00-$3FFF)
; Converts NES color to BGR555 and writes to Genesis CRAM
; ─────────────────────────────────────────────────────────────────────────────
PPU_WRITE_PALETTE_NATIVE:
    ; Store in palette shadow
    lea     (PPU_PAL_SHADOW).l,A0
    moveq   #0,D4
    move.w  D3,D4
    andi.w  #$1F,D4                 ; Mask to 32 entries (2 palettes)
    move.b  D0,(A0,D4.w)
    
    ; Convert NES color index to BGR555
    moveq   #0,D4
    move.b  D0,D4
    bsr     NES_PAL_TO_BGR555
    
    ; Write to CRAM (palette index = NES palette index)
    moveq   #0,D4
    move.w  D3,D4
    andi.w  #$1F,D4
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  D0,($C00000)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; PPU_ADVANCE_VRAM_ADDR
; ─────────────────────────────────────────────────────────────────────────────
; Auto-increment VRAM address after write (NES $2007 behavior)
; ─────────────────────────────────────────────────────────────────────────────
PPU_ADVANCE_VRAM_ADDR:
    move.w  (VRAM_ADDR_CURR).l,D0
    addi.w  #$0001,D0               ; Default increment $2007 = +1
    move.w  D0,(VRAM_ADDR_CURR).l
    rts


; ═══════════════════════════════════════════════════════════════════════════════
; VDP UTILITIES
; ═══════════════════════════════════════════════════════════════════════════════

; ─────────────────────────────────────────────────────────────────────────────
; VDP_SET_VRAM_WRITE_ADDR
; ─────────────────────────────────────────────────────────────────────────────
; D0.W contains VRAM address
; Sets VDP control latch for VRAM write
; ─────────────────────────────────────────────────────────────────────────────
VDP_SET_VRAM_WRITE_ADDR:
    swap    D0                      ; Put address word in upper 16 bits
    ori.l   #$40000000,D0           ; OR with VRAM write command
    move.l  D0,($C00004)
    rts


; ─────────────────────────────────────────────────────────────────────────────
; NES_PAL_TO_BGR555
; ─────────────────────────────────────────────────────────────────────────────
; D4.B (or input) contains NES palette index
; Returns D0.W with Genesis BGR555 color
; TODO: Implement full NES → Genesis color conversion
; ─────────────────────────────────────────────────────────────────────────────
NES_PAL_TO_BGR555:
    ; Placeholder: Return color based on index
    ; Real implementation would use NES palette LUT
    moveq   #$0000,D0
    rts


; ═══════════════════════════════════════════════════════════════════════════════
; NES Reads (PPU_READ_xxxx) - Phase 2
; ═══════════════════════════════════════════════════════════════════════════════

PPU_READ_2002:
    ; Status register ($2002): return V-blank flag from VDP
    ; TODO: Implement
    rts


PPU_READ_2007:
    ; Data register read ($2007): return from VRAM buffer
    ; TODO: Implement
    rts

; ═══════════════════════════════════════════════════════════════════════════════
; Additional Stubs for Phase 1
; ═══════════════════════════════════════════════════════════════════════════════

PPU_FLUSH_TITLE_CHR_TO_VRAM:
    ; Flush title CHR data from shadow to VRAM
    ; TODO: Phase 2 - implement DMA or direct VRAM writes
    rts

PPU_WRITE_2003:
    ; OAM address register ($2003)
    ; Used for sprite OAM index - store for later use
    move.b  D0,($FFFFEF09).l
    rts

VDP_VBLANK_HANDLER:
    ; VBlank interrupt handler
    ; TODO: Phase 2 - implement VDP status/sync
    rts

; ═══════════════════════════════════════════════════════════════════════════════
; End vdp_native.asm
; ═══════════════════════════════════════════════════════════════════════════════
