; ???????????????????????????????????????????????????????????????
; vdp_layer.asm - FULL FILE (v68 ready)
; Sega Genesis VDP ? NES PPU translation layer
; FIXED: VBlank now uses jmp (no stack corruption) + forced NMI every frame
; ???????????????????????????????????????????????????????????????

VDP_DATA        EQU $C00000
VDP_CTRL        EQU $C00004
VDP_HVCOUNTER   EQU $C00008

VDP_REG_MODE1   EQU $80
VDP_REG_MODE2   EQU $81
VDP_REG_PLANE_A EQU $82
VDP_REG_WINDOW  EQU $83
VDP_REG_PLANE_B EQU $84
VDP_REG_SPRITE  EQU $85
VDP_REG_BGCOLOR EQU $87
VDP_REG_HSCROLL EQU $8D
VDP_REG_AUTOINC EQU $8F
VDP_REG_SCROLL  EQU $90
VDP_REG_WINHPOS EQU $91
VDP_REG_WINVPOS EQU $92
VDP_REG_DMALENC EQU $93
VDP_REG_DMALENB EQU $94
VDP_REG_DMASRC1 EQU $95
VDP_REG_DMASRC2 EQU $96
VDP_REG_DMASRC3 EQU $97

VDP_SHADOW_BASE EQU $FFFFEF00
PPUCTRL_SHADOW  EQU $FFFFEF00
PPUMASK_SHADOW  EQU $FFFFEF01
PPUADDR_HI      EQU $FFFFEF02
PPUADDR_LO      EQU $FFFFEF03
PPUADDR_LATCH   EQU $FFFFEF04
PPUSCROLL_X     EQU $FFFFEF05
PPUSCROLL_Y     EQU $FFFFEF06
PPUSCROLL_LATCH EQU $FFFFEF07
VRAM_ADDR_CURR  EQU $FFFFEF08
VDP_REG1_SHADOW EQU $FFFFEF0A
PPUDATA_BUFFER  EQU $FFFFEF0C
PPU_LAST_PLANE_ADDR EQU $FFFFEF10
PPU_PLANE_CACHE_VALID EQU $FFFFEF12
PPU_FULL_REDRAW_PENDING EQU $FFFFEF13

RAM_FOR_2001    EQU $FFFF00FE
RAM_FOR_2000    EQU $FFFF00FF
RAM_SCROLL_Y    EQU $FFFF00FC
RAM_SCROLL_X    EQU $FFFF00FD
PLANE_A_MAP_BASE EQU $C000
PLANE_B_MAP_BASE EQU $E000
PPU_NT_SHADOW   EQU $00FF8200
PPU_PAL_SHADOW  EQU $00FF9200
PPU_CHR_SHADOW  EQU $00FFC000
PPU_NT_MIRROR_MASK EQU $03FF
NES_BACKDROP_TILE_INDEX EQU $0200
NES_BACKDROP_TILE_VRAM  EQU $4000
NES_BACKDROP_CRAM_INDEX EQU $000F


VDP_INIT:
    move.w  #$8000,($C00004)
    move.w  #$8134,($C00004)
    move.w  #$8230,($C00004)
    move.w  #$8307,($C00004)
    move.w  #$8407,($C00004)
    move.w  #$856C,($C00004)
    move.w  #$8700,($C00004)
    move.w  #$8B00,($C00004)
    move.w  #$8C81,($C00004)
    move.w  #$8D2F,($C00004)
    move.w  #$8F02,($C00004)
    move.w  #$9001,($C00004)
    move.w  #$9100,($C00004)
    move.w  #$9200,($C00004)

    bsr     VDP_CLEAR_VRAM
    bsr     VDP_INIT_NES_BACKDROP
    bsr     VDP_LOAD_NES_PALETTE

    clr.b   (PPUCTRL_SHADOW).l
    clr.b   (PPUMASK_SHADOW).l
    clr.b   (RAM_FOR_2000).l
    clr.b   (RAM_FOR_2001).l
    clr.b   (RAM_SCROLL_X).l
    clr.b   (RAM_SCROLL_Y).l
    clr.b   (PPUADDR_LATCH).l
    clr.b   (PPUSCROLL_LATCH).l
    clr.w   (VRAM_ADDR_CURR).l
    clr.b   (PPUDATA_BUFFER).l
    clr.w   (PPU_LAST_PLANE_ADDR).l
    clr.b   (PPU_PLANE_CACHE_VALID).l
    clr.b   (PPU_FULL_REDRAW_PENDING).l
    bsr     PPU_CLEAR_SHADOWS

    move.b  #$54,(VDP_REG1_SHADOW).l
    move.w  #$8154,($C00004)
    rts

PPU_WRITE_2000:
    ori.b   #$80,D0
    move.b  D0,(PPUCTRL_SHADOW).l
    move.b  D0,(RAM_FOR_2000).l
    move.b  (VDP_REG1_SHADOW).l,D3
    btst    #7,D0
    beq     .disable_vint
    ori.b   #$20,D3
    bra     .apply
.disable_vint:
    andi.b  #$DF,D3
.apply:
    move.b  D3,(VDP_REG1_SHADOW).l
    move.w  #$8100,D4
    or.b    D3,D4
    move.w  D4,($C00004)
    move.b  (PPUMASK_SHADOW).l,D4
    andi.b  #$18,D4
    beq     .done
    tst.b   (PPU_FULL_REDRAW_PENDING).l
    beq     .done
    movem.l D0-D7/A0,-(A7)
    bsr     PPU_FLUSH_VISIBLE_NAMETABLE
    movem.l (A7)+,D0-D7/A0
.done:
    rts

PPU_WRITE_2001:
    move.b  D0,(PPUMASK_SHADOW).l
    move.b  D0,(RAM_FOR_2001).l
    move.b  (VDP_REG1_SHADOW).l,D3
    move.b  D0,D4
    andi.b  #$18,D4
    beq     .disable_display
    ori.b   #$40,D3
    bra     .apply
.disable_display:
    andi.b  #$BF,D3
.apply:
    move.b  D3,(VDP_REG1_SHADOW).l
    move.w  #$8100,D4
    or.b    D3,D4
    move.w  D4,($C00004)
    rts

PPU_READ_2002:
    move.w  ($C00004),D0
    move.w  D0,D3
    clr.b   D0
    btst    #3,D3
    beq     .no_vblank
    bset    #7,D0
.no_vblank:
    clr.b   (PPUADDR_LATCH).l
    clr.b   (PPUSCROLL_LATCH).l
    rts

PPU_WRITE_2003:
    move.b  D0,($FFFFEF09).l
    rts

PPU_WRITE_2005:
    tst.b   (PPUSCROLL_LATCH).l
    bne     .write_y
    move.b  D0,(PPUSCROLL_X).l
    move.b  D0,(RAM_SCROLL_X).l
    move.b  #1,(PPUSCROLL_LATCH).l
    move.l  #$7C000002,($C00004)
    moveq   #0,D3
    move.b  (PPUSCROLL_X).l,D3
    neg.w   D3
    move.w  D3,($C00000)
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts
.write_y:
    move.b  D0,(PPUSCROLL_Y).l
    move.b  D0,(RAM_SCROLL_Y).l
    clr.b   (PPUSCROLL_LATCH).l
    move.l  #$40004000,($C00004)
    moveq   #0,D3
    move.b  (PPUSCROLL_Y).l,D3
    move.w  D3,($C00000)
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts

PPU_WRITE_2006:
    tst.b   (PPUADDR_LATCH).l
    bne     .write_lo
    move.b  D0,(PPUADDR_HI).l
    move.b  #1,(PPUADDR_LATCH).l
    rts
.write_lo:
    move.b  D0,(PPUADDR_LO).l
    clr.b   (PPUADDR_LATCH).l
    move.b  (PPUADDR_HI).l,D3
    lsl.w   #8,D3
    move.b  (PPUADDR_LO).l,D3
    move.w  D3,(VRAM_ADDR_CURR).l
    bsr     PPU_INVALIDATE_PLANE_CACHE
    move.w  #$0400,D0
    bsr     TRACE_MARK
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$3F00,D4
    beq     .palette_addr
    move.w  #$0403,D0
    bsr     TRACE_MARK
    rts
.palette_addr:
    move.w  D3,D4
    bsr     PPU_NORMALIZE_PALETTE_INDEX
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  #$0403,D0
    bsr     TRACE_MARK
    rts

PPU_WRITE_2007:
    move.w  (VRAM_ADDR_CURR).l,D3
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$3F00,D4
    beq     .palette_write
    cmpi.w  #$2000,D3
    blo     .pattern_write
    cmpi.w  #$3F00,D3
    bhs     .skip_write
    movem.l D0-D7/A0,-(A7)
    bsr     PPU_WRITE_NAMETABLE_BYTE
    movem.l (A7)+,D0-D7/A0
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts
.pattern_write:
    movem.l D1-D7/A0,-(A7)
    bsr     PPU_WRITE_PATTERN_BYTE
    movem.l (A7)+,D1-D7/A0
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts
.skip_write:
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts
.palette_write:
    move.w  D3,D4
    bsr     PPU_NORMALIZE_PALETTE_INDEX
    lea     (PPU_PAL_SHADOW).l,A0
    move.b  D0,(A0,D4.w)
    bsr     NES_PAL_TO_BGR555
    move.w  D0,D5
    move.w  D5,($C00000)
    tst.w   D4
    bne     .palette_done
    move.w  D5,D0
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
.palette_done:
    bsr     PPU_INVALIDATE_PLANE_CACHE
    bsr     PPU_ADVANCE_VRAM_ADDR
    rts

PPU_READ_2007:
    move.w  (VRAM_ADDR_CURR).l,D3
    move.w  #$0401,D0
    bsr     TRACE_MARK
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$3F00,D4
    beq     .palette_read
    moveq   #0,D0
    move.b  (PPUDATA_BUFFER).l,D0
    cmpi.w  #$2000,D3
    blo     .pattern_read
    cmpi.w  #$3F00,D3
    bhs     .read_no_buffer_fill
    movem.l D1-D7/A0,-(A7)
    bsr     PPU_BUFFER_NAMETABLE_READ
    movem.l (A7)+,D1-D7/A0
    bra     .read_no_buffer_fill
.pattern_read:
    movem.l D1-D7/A0,-(A7)
    bsr     PPU_BUFFER_PATTERN_READ
    movem.l (A7)+,D1-D7/A0
.read_no_buffer_fill:
    bsr     PPU_ADVANCE_VRAM_ADDR
    move.l  D0,-(A7)
    move.w  #$0402,D0
    bsr     TRACE_MARK
    move.l  (A7)+,D0
    rts
.palette_read:
    movem.l D1-D7/A0,-(A7)
    bsr     PPU_READ_PALETTE_BYTE
    movem.l (A7)+,D1-D7/A0
    bsr     PPU_ADVANCE_VRAM_ADDR
    move.l  D0,-(A7)
    move.w  #$0402,D0
    bsr     TRACE_MARK
    move.l  (A7)+,D0
    rts

VDP_VBLANK_HANDLER:
    movem.l D0-D7/A0-A6,-(A7)
    move.w  ($C00004),D0
    move.w  #$0201,D0
    bsr     TRACE_MARK
    tst.b   (ram_0301_buffer_index).l
    bne     .keep_staged_ppu_buffer
    move.b  #$FF,(ram_0302_ppu_buffer).l
.keep_staged_ppu_buffer:
    move.w  #$0202,D0
    bsr     TRACE_MARK
    bsr     vec_0x01E494_NMI
    move.w  #$0203,D0
    bsr     TRACE_MARK

    movem.l (A7)+,D0-D7/A0-A6
    rte

VDP_OAM_DMA_TRANSFER:
    move.l  #$58000003,($C00004)
    movea.l #($FF0000+$0200),A1
    move.w  #63,D7
.sprite_loop:
    move.b  (A1)+,D3
    move.b  (A1)+,D4
    move.b  (A1)+,D5
    move.b  (A1)+,D6
    move.w  D3,D0
    addi.w  #128,D0
    andi.w  #$01FF,D0
    move.w  D0,($C00000)
    move.w  D7,D0
    beq     .last_sprite
    neg.w   D0
    addi.w  #64,D0
.last_sprite:
    move.w  D0,($C00000)
    move.w  D5,D1
    clr.w   D0
    btst    #7,D1
    beq     .no_vflip
    bset    #12,D0
.no_vflip:
    btst    #6,D1
    beq     .no_hflip
    bset    #11,D0
.no_hflip:
    move.w  D1,D2
    andi.w  #$0003,D2
    lsl.w   #8,D2
    lsl.w   #5,D2
    or.w    D2,D0
    ori.w   #$8000,D0
    move.w  D4,D2
    andi.w  #$00FF,D2
    or.w    D2,D0
    move.w  D0,($C00000)
    move.w  D6,D0
    addi.w  #128,D0
    andi.w  #$01FF,D0
    move.w  D0,($C00000)
    dbra    D7,.sprite_loop
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts

VDP_CLEAR_VRAM:
    move.l  #$40000000,($C00004)
    move.w  #$8F02,($C00004)
    move.w  #16383,D7
.clear_loop:
    move.w  #0,($C00000)
    dbra    D7,.clear_loop
    rts

VDP_LOAD_NES_PALETTE:
    move.l  #$C0000000,($C00004)
    lea     NES_PALETTE_DATA,A0
    move.w  #63,D7
.pal_loop:
    move.w  (A0)+,($C00000)
    dbra    D7,.pal_loop
    move.w  NES_PALETTE_DATA,D0
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
    rts

VDP_INIT_NES_BACKDROP:
    movem.l D0/D7,-(A7)
    move.w  #NES_BACKDROP_TILE_VRAM,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #15,D7
.tile_loop:
    move.w  #$FFFF,($C00000)
    dbra    D7,.tile_loop
    move.w  #PLANE_B_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #2047,D7
.plane_loop:
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    dbra    D7,.plane_loop
    movem.l (A7)+,D0/D7
    rts

VDP_SYNC_NES_BACKDROP_COLOR:
    move.w  D0,D1
    move.w  #NES_BACKDROP_CRAM_INDEX,D4
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  D1,($C00000)
    rts

NES_PAL_TO_BGR555:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    lea     NES_PALETTE_DATA,A0
    move.w  (A0,D0.w),D0
    rts

PPU_CLEAR_SHADOWS:
    lea     (PPU_NT_SHADOW).l,A0
    move.w  #($1000/4)-1,D7
.nt_loop:
    clr.l   (A0)+
    dbra    D7,.nt_loop
    lea     (PPU_PAL_SHADOW).l,A0
    moveq   #0,D0
    move.w  #($20/4)-1,D7
.pal_loop:
    move.l  D0,(A0)+
    dbra    D7,.pal_loop
    lea     (PPU_CHR_SHADOW).l,A0
    move.w  #($2000/4)-1,D7
.chr_loop:
    clr.l   (A0)+
    dbra    D7,.chr_loop
    rts

PPU_ADVANCE_VRAM_ADDR:
    move.w  (VRAM_ADDR_CURR).l,D3
    btst    #2,(PPUCTRL_SHADOW).l
    beq     .inc_by_1
    addi.w  #32,D3
    bra     .done
.inc_by_1:
    addi.w  #1,D3
.done:
    move.w  D3,(VRAM_ADDR_CURR).l
    rts

PPU_INVALIDATE_PLANE_CACHE:
    clr.b   (PPU_PLANE_CACHE_VALID).l
    rts

PPU_FLUSH_VISIBLE_NAMETABLE:
    clr.b   (PPU_FULL_REDRAW_PENDING).l
    bsr     PPU_INVALIDATE_PLANE_CACHE
    moveq   #0,D4
    move.w  #29,D7
.row_loop:
    move.w  #31,D6
.col_loop:
    move.l  D6,-(A7)
    move.l  D7,-(A7)
    bsr     PPU_RENDER_NAMETABLE_CELL
    move.l  (A7)+,D7
    move.l  (A7)+,D6
    addq.w  #1,D4
    dbra    D6,.col_loop
    dbra    D7,.row_loop
    rts

PPU_NORMALIZE_PALETTE_INDEX:
    andi.w  #$001F,D4
    cmpi.w  #$0010,D4
    beq     .mirror_00
    cmpi.w  #$0014,D4
    beq     .mirror_04
    cmpi.w  #$0018,D4
    beq     .mirror_08
    cmpi.w  #$001C,D4
    beq     .mirror_0C
    rts
.mirror_00:
    clr.w   D4
    rts
.mirror_04:
    moveq   #4,D4
    rts
.mirror_08:
    moveq   #8,D4
    rts
.mirror_0C:
    moveq   #12,D4
    rts

PPU_NORMALIZE_NAMETABLE_ADDR:
    move.w  D3,D4
    andi.w  #$3FFF,D4
    subi.w  #$2000,D4
    cmpi.w  #$1000,D4
    blo     .done
    subi.w  #$1000,D4
.done:
    andi.w  #PPU_NT_MIRROR_MASK,D4
    rts

PPU_WRITE_NAMETABLE_BYTE:
    bsr     PPU_NORMALIZE_NAMETABLE_ADDR
    lea     (PPU_NT_SHADOW).l,A0
    cmp.b   (A0,D4.w),D0
    beq     .done
    move.b  D0,(A0,D4.w)
    moveq   #0,D5
    move.b  (PPUMASK_SHADOW).l,D5
    andi.w  #$0018,D5
    beq     .defer_redraw
    move.w  D4,D5
    andi.w  #$03FF,D5
    cmpi.w  #$03C0,D5
    bhs     .attribute
    bsr     PPU_RENDER_NAMETABLE_CELL
    bra     .done
.attribute:
    bsr     PPU_RENDER_ATTRIBUTE_BLOCK
    bra     .done
.defer_redraw:
    move.b  #1,(PPU_FULL_REDRAW_PENDING).l
.done:
    rts

PPU_BUFFER_NAMETABLE_READ:
    bsr     PPU_NORMALIZE_NAMETABLE_ADDR
    lea     (PPU_NT_SHADOW).l,A0
    move.b  (A0,D4.w),(PPUDATA_BUFFER).l
    rts

PPU_BUFFER_PATTERN_READ:
    move.w  D3,D4
    andi.w  #$1FFF,D4
    lea     (PPU_CHR_SHADOW).l,A0
    move.b  (A0,D4.w),(PPUDATA_BUFFER).l
    rts

PPU_READ_PALETTE_BYTE:
    move.w  D3,D4
    bsr     PPU_NORMALIZE_PALETTE_INDEX
    lea     (PPU_PAL_SHADOW).l,A0
    moveq   #0,D0
    move.b  (A0,D4.w),D0
    rts

PPU_WRITE_PATTERN_BYTE:
    move.w  D3,D4
    andi.w  #$1FFF,D4
    lea     (PPU_CHR_SHADOW).l,A0
    move.b  D0,(A0,D4.w)
    rts

PPU_FLUSH_CHR_SHADOW_TO_VRAM:
    movem.l D0-D7/A0-A3,-(A7)
    move.l  #$40000000,(VDP_CTRL)
    lea     (PPU_CHR_SHADOW).l,A0
    lea     PPU_PIXEL_PAIR_TABLE(pc),A3
    move.w  #511,D7
.tile_loop:
    movea.l A0,A1
    lea     8(A0),A2
    moveq   #7,D6
.row_loop:
    moveq   #0,D0
    moveq   #0,D1
    move.b  (A1)+,D0
    move.b  (A2)+,D1
    bsr     PPU_BUILD_GENESIS_ROW
    move.l  D2,(VDP_DATA)
    dbra    D6,.row_loop
    lea     16(A0),A0
    dbra    D7,.tile_loop
    movem.l (A7)+,D0-D7/A0-A3
    rts

PPU_FLUSH_TITLE_CHR_TO_VRAM:
    movem.l D0-D7/A0-A3,-(A7)
    moveq   #0,D0
    move.w  #112,D1
    bsr     PPU_FLUSH_TILE_RANGE_TO_VRAM
    move.w  #256,D0
    move.w  #112,D1
    bsr     PPU_FLUSH_TILE_RANGE_TO_VRAM
    move.w  #498,D0
    move.w  #14,D1
    bsr     PPU_FLUSH_TILE_RANGE_TO_VRAM
    movem.l (A7)+,D0-D7/A0-A3
    rts

PPU_FLUSH_TILE_RANGE_TO_VRAM:
    tst.w   D1
    beq     .done
    move.w  D1,D7
    subq.w  #1,D7
    move.w  D0,D2
    lsl.w   #5,D2
    move.w  D2,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR

    move.w  D2,D3
    lsr.w   #1,D3
    lea     (PPU_CHR_SHADOW).l,A0
    adda.w  D3,A0
    lea     PPU_PIXEL_PAIR_TABLE(pc),A3
.tile_loop:
    movea.l A0,A1
    lea     8(A0),A2
    moveq   #7,D6
.row_loop:
    moveq   #0,D0
    moveq   #0,D1
    move.b  (A1)+,D0
    move.b  (A2)+,D1
    bsr     PPU_BUILD_GENESIS_ROW
    move.l  D2,(VDP_DATA)
    dbra    D6,.row_loop
    lea     16(A0),A0
    dbra    D7,.tile_loop
.done:
    rts

PPU_BUILD_GENESIS_ROW:
    clr.l   D2

    moveq   #0,D3
    move.b  D1,D3
    andi.w  #$00C0,D3
    lsr.w   #4,D3
    moveq   #0,D4
    move.b  D0,D4
    andi.w  #$00C0,D4
    lsr.w   #6,D4
    or.w    D4,D3
    lsl.l   #8,D2
    move.b  (A3,D3.w),D2
    lsl.b   #2,D0
    lsl.b   #2,D1

    moveq   #0,D3
    move.b  D1,D3
    andi.w  #$00C0,D3
    lsr.w   #4,D3
    moveq   #0,D4
    move.b  D0,D4
    andi.w  #$00C0,D4
    lsr.w   #6,D4
    or.w    D4,D3
    lsl.l   #8,D2
    move.b  (A3,D3.w),D2
    lsl.b   #2,D0
    lsl.b   #2,D1

    moveq   #0,D3
    move.b  D1,D3
    andi.w  #$00C0,D3
    lsr.w   #4,D3
    moveq   #0,D4
    move.b  D0,D4
    andi.w  #$00C0,D4
    lsr.w   #6,D4
    or.w    D4,D3
    lsl.l   #8,D2
    move.b  (A3,D3.w),D2
    lsl.b   #2,D0
    lsl.b   #2,D1

    moveq   #0,D3
    move.b  D1,D3
    andi.w  #$00C0,D3
    lsr.w   #4,D3
    moveq   #0,D4
    move.b  D0,D4
    andi.w  #$00C0,D4
    lsr.w   #6,D4
    or.w    D4,D3
    lsl.l   #8,D2
    move.b  (A3,D3.w),D2
    rts

PPU_PIXEL_PAIR_TABLE:
    dc.b    $00,$01,$10,$11,$02,$03,$12,$13
    dc.b    $20,$21,$30,$31,$22,$23,$32,$33

PPU_RENDER_ATTRIBUTE_BLOCK:
    move.w  D4,D5
    lsr.w   #8,D5
    lsr.w   #2,D5
    lsl.w   #8,D5
    lsl.w   #2,D5
    move.w  D4,D6
    andi.w  #$03FF,D6
    subi.w  #$03C0,D6
    move.w  D6,D7
    andi.w  #$0007,D7
    lsl.w   #2,D7
    lsr.w   #3,D6
    lsl.w   #2,D6
    moveq   #3,D1
.row_loop:
    move.w  D5,D4
    move.w  D6,D2
    lsl.w   #5,D2
    add.w   D2,D4
    add.w   D7,D4
    moveq   #3,D0
.col_loop:
    move.l  D0,-(A7)
    move.l  D1,-(A7)
    move.l  D4,-(A7)
    move.l  D5,-(A7)
    move.l  D6,-(A7)
    move.l  D7,-(A7)
    bsr     PPU_RENDER_NAMETABLE_CELL
    move.l  (A7)+,D7
    move.l  (A7)+,D6
    move.l  (A7)+,D5
    move.l  (A7)+,D4
    move.l  (A7)+,D1
    move.l  (A7)+,D0
    addq.w  #1,D4
    dbra    D0,.col_loop
    addq.w  #1,D6
    dbra    D1,.row_loop
    rts

PPU_RENDER_NAMETABLE_CELL:
    lea     (PPU_NT_SHADOW).l,A0
    move.w  D4,D5
    lsr.w   #8,D5
    lsr.w   #2,D5
    move.w  D4,D6
    andi.w  #$03FF,D6
    move.w  D6,D7
    andi.w  #$001F,D7
    move.w  D6,D1
    lsr.w   #5,D1

    moveq   #0,D2
    move.b  (A0,D4.w),D2
    btst    #4,(PPUCTRL_SHADOW).l
    beq     .tile_base_done
    addi.w  #$0100,D2
.tile_base_done:

    move.w  D5,D3
    lsl.w   #8,D3
    lsl.w   #2,D3
    move.w  D1,D6
    lsr.w   #2,D6
    lsl.w   #3,D6
    add.w   D6,D3
    move.w  D7,D6
    lsr.w   #2,D6
    add.w   D6,D3
    addi.w  #$03C0,D3
    moveq   #0,D6
    move.b  (A0,D3.w),D6

    move.w  D1,D0
    andi.w  #$0002,D0
    lsl.w   #1,D0
    move.w  D7,D3
    andi.w  #$0002,D3
    or.w    D3,D0
    lsr.w   D0,D6
    andi.w  #$0003,D6
    lsl.w   #8,D6
    lsl.w   #5,D6
    or.w    D2,D6

    move.w  D5,D0
    andi.w  #$0001,D0
    lsl.w   #5,D0
    add.w   D0,D7
    move.w  D1,D0
    lsl.w   #6,D0
    add.w   D7,D0
    lsl.w   #1,D0
    addi.w  #PLANE_A_MAP_BASE,D0
    tst.b   (PPU_PLANE_CACHE_VALID).l
    beq     .set_addr
    move.w  (PPU_LAST_PLANE_ADDR).l,D3
    addq.w  #2,D3
    cmp.w   D0,D3
    beq     .write_cell
.set_addr:
    bsr     VDP_SET_VRAM_WRITE_ADDR
.write_cell:
    move.w  D0,(PPU_LAST_PLANE_ADDR).l
    move.b  #1,(PPU_PLANE_CACHE_VALID).l
    move.w  D6,($C00000)
    rts

VDP_SET_VRAM_WRITE_ADDR:
    move.w  D0,D1
    andi.w  #$3FFF,D1
    swap    D1
    move.w  D0,D1
    lsr.w   #8,D1
    lsr.w   #6,D1
    ori.l   #$40000000,D1
    move.l  D1,($C00004)
    rts

NES_PALETTE_DATA:
    DC.W $0000,$0888,$0000,$0604,$0400,$0420,$0400,$0620
    DC.W $0240,$0040,$0060,$0046,$0444,$0000,$0000,$0000
    DC.W $0AAA,$0E00,$0C04,$0A06,$0808,$0808,$0608,$0446
    DC.W $0262,$0060,$0068,$0068,$0086,$0000,$0000,$0000
    DC.W $0EEE,$0EE2,$0EE6,$0EC8,$0EAA,$0EAA,$0EA4,$0EA0
    DC.W $0CE0,$04E0,$04E4,$04EE,$006E,$0000,$0000,$0000
    DC.W $0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE
    DC.W $0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0000,$0000,$0000

