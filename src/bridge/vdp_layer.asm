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

; NES CRT overscan offset: NES=240 lines, Genesis=224 lines
; CRT TVs clip ~8px top + ~8px bottom, so intended visible = rows 8-231
; Offset Genesis vscroll by 8 to center the NES content
NES_VSCROLL_OFFSET EQU 8

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
PPU_TITLE_CHR_FLUSH_DONE EQU $FFFFEF14
VDP_IN_VBLANK_FLAG EQU $FFFFEF15
PPU_MIDFRAME_NT_WRITES EQU $FFFFEF16
PPU_MIRROR_MODE EQU $FFFFEF17
PPU_INDEX_ACTIVE_SHADOW EQU $FFFFEF18
PPU_TITLE_FALLBACK_USED EQU $FFFFEF19
PPU_TITLE_REDRAW_DONE EQU $FFFFEF1A
PPU_CHR_DIRTY_FLAG EQU $FFFFEF1B

RAM_FOR_2001    EQU $FFFF00FE
RAM_FOR_2000    EQU $FFFF00FF
RAM_SCROLL_Y    EQU $FFFF00FC
RAM_SCROLL_X    EQU $FFFF00FD
PLANE_A_MAP_BASE EQU $C000
PLANE_B_MAP_BASE EQU $E000
WINDOW_MAP_BASE  EQU $B000
HSCROLL_TABLE_BASE EQU $B800
SPRITE_ATTR_BASE EQU $BE00
PPU_NT_SHADOW   EQU $00FF8200
PPU_PAL_SHADOW  EQU $00FF9200
PPU_CHR_SHADOW  EQU $00FFC000
PPU_NT_MIRROR_MASK EQU $03FF
NES_BACKDROP_TILE_INDEX EQU $0400
NES_BACKDROP_TILE_VRAM  EQU $8000
WINDOW_BLANK_TILE_INDEX EQU $0401
WINDOW_BLANK_TILE_VRAM  EQU $8020
; FIX v490: Sprite tile copies live at VRAM $4000-$7FFF (tiles 512-1023)
; These copies have pixel values shifted +4 so sprites use palette colors 4-7
SPRITE_TILE_VRAM_BASE   EQU $4000
SPRITE_TILE_INDEX_OFS   EQU $0200
NES_BACKDROP_CRAM_INDEX EQU $000F
DEBUG_VISUAL_ENABLE     EQU 0


VDP_INIT:
    move.w  #$8000,($C00004)
    move.w  #$8134,($C00004)    ; Standard NTSC 224-line mode, display off during init
    move.w  #$8230,($C00004)
    move.w  #$832C,($C00004)    ; H32 window table at $B000 (2KB)
    move.w  #$8407,($C00004)
    move.w  #$855F,($C00004)    ; H32 sprite attribute table at $BE00 (512B)
    move.w  #$8700,($C00004)
    move.w  #$8B00,($C00004)
    move.w  #$8C00,($C00004)    ; H32 mode (256px wide), no shadow/highlight, no interlace
    move.w  #$8D2E,($C00004)    ; H32 h-scroll table at $B800 (1KB)
    move.w  #$8F02,($C00004)
    move.w  #$9001,($C00004)
    move.w  #$9100,($C00004)    ; Title composition currently relies on a fullscreen window field
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
    clr.b   (PPU_TITLE_CHR_FLUSH_DONE).l
    clr.b   (VDP_IN_VBLANK_FLAG).l
    clr.w   (PPU_MIDFRAME_NT_WRITES).l
    move.b  #$FF,(PPU_INDEX_ACTIVE_SHADOW).l
    clr.b   (PPU_TITLE_FALLBACK_USED).l
    clr.b   (PPU_TITLE_REDRAW_DONE).l
    clr.b   (PPU_CHR_DIRTY_FLAG).l
    move.b  #$0C,(PPU_MIRROR_MODE).l ; default MMC1 reset control value
    bsr     PPU_CLEAR_SHADOWS

    move.b  #$14,(VDP_REG1_SHADOW).l  ; Keep display off until PPUMASK enables rendering
    move.w  #$8114,($C00004)
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
    ; FIX v482: removed RAM_SCROLL_X writeback — NES $2005 write does NOT
    ; modify the game's RAM shadow ($FD). Only the game code itself updates
    ; ram_scroll_X. The VDP layer must not clobber it.
    move.b  #1,(PPUSCROLL_LATCH).l
    move.w  #HSCROLL_TABLE_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    moveq   #0,D3
    move.b  (PPUSCROLL_X).l,D3
    neg.w   D3
    move.w  D3,($C00000)
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts
.write_y:
    move.b  D0,(PPUSCROLL_Y).l
    ; FIX v482: removed RAM_SCROLL_Y writeback — same as scroll X fix above.
    ; NES $2005 write only sets PPU internal scroll, not RAM at $FC.
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
    moveq   #0,D4
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
    moveq   #0,D4
    move.w  D3,D4
    bsr     PPU_NORMALIZE_PALETTE_INDEX
    lea     (PPU_PAL_SHADOW).l,A0
    move.b  D0,(A0,D4.w)
    bsr     NES_PAL_TO_BGR555
    move.w  D0,D5
    ; Explicitly route palette writes to CRAM entry D4.
    ; Writing to VDP data without setting CRAM address can corrupt VRAM
    ; if the previous VDP address latch targets nametable/pattern data.
    move.l  D4,-(A7)
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.l  (A7)+,D4
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
    move.b  #1,(VDP_IN_VBLANK_FLAG).l
    move.w  ($C00004),D0
    move.w  #$0201,D0
    bsr     TRACE_MARK
    move.w  #$0202,D0
    bsr     TRACE_MARK
    bsr     vec_0x01E494_NMI
    bsr     PPU_HANDLE_INDEXED_BUFFERS
    bsr     VDP_APPLY_TITLE_BLACK_GAP_DISPLAY
    tst.b   (PPU_FULL_REDRAW_PENDING).l
    beq     .skip_nt_flush
    bsr     PPU_FLUSH_VISIBLE_NAMETABLE
.skip_nt_flush:
    bsr     PPU_FLUSH_TITLE_CHR_TO_VRAM
    bsr     PPU_SYNC_PALETTE_SHADOW_TO_CRAM
    bsr     VDP_OAM_DMA_TRANSFER
    bsr     SAVE_SYNC_VBLANK_TICK
    bsr     VDP_DEBUG_VISUAL_PULSE
    move.w  #$0203,D0
    bsr     TRACE_MARK
    clr.b   (VDP_IN_VBLANK_FLAG).l
    movem.l (A7)+,D0-D7/A0-A6
    rte

PPU_HANDLE_INDEXED_BUFFERS:
    ; Bridge-side indexed buffer handling.
    ; - bounded fallback: queue title buffer once if title hold missed it.
    ; - redraw once per title entry when index 10 first appears.
    movem.l D0-D2,-(A7)

    ; Reset per-entry guards when not in title hold.
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .reset_title_guards
    tst.b   ($00FF042C).l
    bne     .reset_title_guards
    bra     .maybe_fallback

.reset_title_guards:
    clr.b   (PPU_TITLE_FALLBACK_USED).l
    clr.b   (PPU_TITLE_REDRAW_DONE).l

.maybe_fallback:
    ; One-shot fallback only inside title hold.
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .read_index
    tst.b   ($00FF042C).l
    bne     .read_index
    tst.b   (PPU_TITLE_FALLBACK_USED).l
    bne     .read_index
    tst.b   (ram_ppu_load_index).l
    bne     .read_index
    move.b  #con_ppu_buf_title_screen,(ram_ppu_load_index).l
    move.b  #1,(PPU_TITLE_FALLBACK_USED).l
    move.w  #$02AF,D0
    bsr     TRACE_MARK

.read_index:
    move.b  (ram_ppu_load_index).l,D0
    move.b  (PPU_INDEX_ACTIVE_SHADOW).l,D1
    cmp.b   D1,D0
    beq     .done
    move.b  D0,(PPU_INDEX_ACTIVE_SHADOW).l
    moveq   #0,D1
    move.b  D0,D1
    addi.w  #$02B0,D1
    move.w  D1,D0
    bsr     TRACE_MARK
    move.b  (ram_ppu_load_index).l,D0

    ; Redraw gate only for first index-10 transition per title entry.
    cmpi.b  #con_ppu_buf_title_screen,D0
    beq     .mark_redraw
    bra     .done

.mark_redraw:
    tst.b   (PPU_TITLE_REDRAW_DONE).l
    bne     .done
    ; Initialize title palette and dispatch the queued NES title buffer ($10).
    ; This keeps title composition data-driven instead of relying on side effects.
    bsr     INIT_TITLE_PALETTE_SHADOW
    bsr     PPU_DISPATCH_TITLE_BUFFER
    move.b  #1,(PPU_TITLE_REDRAW_DONE).l
    bra     .done

.done:
    movem.l (A7)+,D0-D2
    rts

VDP_APPLY_TITLE_BLACK_GAP_DISPLAY:
    ; Preserve NES PPUMASK intent only.
    move.b  (VDP_REG1_SHADOW).l,D3
    move.b  (PPUMASK_SHADOW).l,D4
    andi.b  #$18,D4
    beq     .display_off

.display_on:
    ori.b   #$40,D3
    bra     .apply

.display_off:
    andi.b  #$BF,D3

.apply:
    move.b  D3,(VDP_REG1_SHADOW).l
    move.w  #$8100,D4
    or.b    D3,D4
    move.w  D4,($C00004)
    rts

VDP_DEBUG_VISUAL_PULSE:
    moveq   #0,D0
    move.b  #DEBUG_VISUAL_ENABLE,D0
    beq     .done

    ; Visible heartbeat for hardware capture: title alternates red/blue,
    ; non-title forces green so state transitions are obvious.
    move.b  (ram_script).l,D2
    cmpi.b  #con_script_title_screen,D2
    bne     .non_title
    move.b  (ram_frm_cnt).l,D0
    andi.b  #$10,D0
    beq     .title_blue
    move.w  #$0E00,D0
    bra     .write
.title_blue:
    move.w  #$000E,D0
    bra     .write
.non_title:
    move.w  #$00E0,D0
.write:
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
.done:
    rts

VDP_OAM_DMA_TRANSFER:
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .dma_sprites
    move.w  #SPRITE_ATTR_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #63,D7
.title_hide_loop:
    move.w  #$0000,($C00000)
    move.w  D7,D0
    beq     .title_hide_last
    neg.w   D0
    addi.w  #64,D0
.title_hide_last:
    move.w  D0,($C00000)
    move.w  #$0000,($C00000)
    move.w  #$0000,($C00000)
    dbra    D7,.title_hide_loop
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts
.dma_sprites:
    move.w  #SPRITE_ATTR_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    movea.l #($FF0000+$0200),A1
    move.w  #63,D7
.sprite_loop:
    move.b  (A1)+,D3
    move.b  (A1)+,D4
    move.b  (A1)+,D5
    move.b  (A1)+,D6
    ; GUARD: Sprite Y-hiding — DO NOT REMOVE
    ; NES hides sprites when Y is in the $EF-$FF range. If not handled
    ; explicitly, those entries can leak as flicker in the upper playfield.
    cmpi.b  #$EF,D3
    blo     .spr_visible
    move.w  #$0000,($C00000)      ; Y = offscreen on Genesis
    move.w  D7,D0
    beq     .spr_hidden_last
    neg.w   D0
    addi.w  #64,D0
.spr_hidden_last:
    move.w  D0,($C00000)          ; link
    move.w  #$0000,($C00000)      ; attr/tile
    move.w  #$0000,($C00000)      ; X = offscreen
    dbra    D7,.sprite_loop
    bsr     PPU_INVALIDATE_PLANE_CACHE
    rts
.spr_visible:
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
    ; FIX v490: Add PPUCTRL sprite pattern table offset
    btst    #3,(PPUCTRL_SHADOW).l
    beq     .spr_no_pt_ofs
    addi.w  #$0100,D2
.spr_no_pt_ofs:
    ; FIX v490: Use sprite tile copies (pixel values shifted for colors 4-7)
    addi.w  #SPRITE_TILE_INDEX_OFS,D2
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
    move.w  #32767,D7               ; 32768 words = 65536 bytes = full 64KB VRAM
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
    ; Reserve a transparent tile for the window plane. If the window becomes
    ; visible, it should disappear rather than laying a solid backdrop over
    ; the frontend/title.
    move.w  #WINDOW_BLANK_TILE_VRAM,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #15,D7
.window_blank_loop:
    move.w  #0,($C00000)
    dbra    D7,.window_blank_loop
    ; Fill Plane A with stable backdrop tile so untouched cells do not inherit
    ; changing CHR tile 0 data (which manifests as random dots).
    move.w  #PLANE_A_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #2047,D7
.plane_a_loop:
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    dbra    D7,.plane_a_loop
    move.w  #PLANE_B_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #2047,D7
.plane_loop:
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    dbra    D7,.plane_loop
    ; Title currently composes against a solid window field.
    move.w  #WINDOW_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #1023,D7
.window_loop:
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    dbra    D7,.window_loop
    movem.l (A7)+,D0/D7
    rts

VDP_SYNC_NES_BACKDROP_COLOR:
    move.w  D0,D1
    moveq   #0,D4
    move.w  #NES_BACKDROP_CRAM_INDEX,D4
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  D1,($C00000)
    rts

PPU_SYNC_PALETTE_SHADOW_TO_CRAM:
; FIX v490: Write BG palettes at colors 0-3 AND sprite palettes at colors 4-7
; of each Genesis palette line, so BG and sprites can coexist properly
    movem.l D0-D5/A0,-(A7)
    move.b  (ram_script).l,D0
    cmpi.b  #con_script_title_screen,D0
    beq     .sync_frontend_layout
    cmpi.b  #$01,D0
    beq     .sync_frontend_layout
    cmpi.b  #con_script_register,D0
    beq     .sync_frontend_layout
    cmpi.b  #con_script_elimination,D0
    beq     .sync_frontend_layout
    cmpi.b  #con_script_final_credits,D0
    beq     .sync_frontend_layout
    ; --- Gameplay palette sync ---
    lea     (PPU_PAL_SHADOW).l,A0
    moveq   #0,D5
.gp_line_loop:
    ; Set CRAM write address for palette line D5, color 0
    moveq   #0,D4
    move.w  D5,D4
    lsl.w   #5,D4              ; D4 = line * 32 (CRAM byte offset per line)
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    ; Write BG pal D5 at colors 0-3
    moveq   #0,D3
.gp_bg_loop:
    moveq   #0,D4
    tst.w   D3
    beq     .gp_bg_backdrop
    move.w  D5,D4
    lsl.w   #2,D4
    add.w   D3,D4
    bra     .gp_bg_have_idx
.gp_bg_backdrop:
    moveq   #0,D4
.gp_bg_have_idx:
    moveq   #0,D0
    move.b  (A0,D4.w),D0
    move.l  A0,-(A7)
    bsr     NES_PAL_TO_BGR555
    move.l  (A7)+,A0
    move.w  D0,($C00000)
    addq.w  #1,D3
    cmpi.w  #4,D3
    bne     .gp_bg_loop
    ; Write sprite pal D5 at colors 4-7 (VDP auto-incremented to color 4)
    moveq   #0,D3
.gp_sp_loop:
    moveq   #0,D4
    tst.w   D3
    beq     .gp_sp_backdrop
    move.w  D5,D4
    lsl.w   #2,D4
    add.w   D3,D4
    addi.w  #16,D4             ; sprite palettes at shadow[16..31]
    bra     .gp_sp_have_idx
.gp_sp_backdrop:
    moveq   #0,D4              ; color 0 = backdrop (shadow[0])
.gp_sp_have_idx:
    moveq   #0,D0
    move.b  (A0,D4.w),D0
    move.l  A0,-(A7)
    bsr     NES_PAL_TO_BGR555
    move.l  (A7)+,A0
    move.w  D0,($C00000)
    addq.w  #1,D3
    cmpi.w  #4,D3
    bne     .gp_sp_loop
    ; NES BG color 0 is opaque. Mirror the universal backdrop into
    ; Genesis color 15 so BG tiles can use nibble $F instead of transparency.
    moveq   #0,D0
    move.b  (A0),D0
    move.l  A0,-(A7)
    bsr     NES_PAL_TO_BGR555
    move.l  (A7)+,A0
    moveq   #0,D4
    move.w  D5,D4
    lsl.w   #5,D4
    addi.w  #30,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  D0,($C00000)
    ; Next palette line
    addq.w  #1,D5
    cmpi.w  #4,D5
    bne     .gp_line_loop
    ; Sync NES backdrop color
    moveq   #0,D0
    move.b  (A0),D0
    move.l  A0,-(A7)
    bsr     NES_PAL_TO_BGR555
    move.l  (A7)+,A0
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
    movem.l (A7)+,D0-D5/A0
    rts
.sync_frontend_layout:
; FIX v490: Frontend palette sync — BG at colors 0-3, sprites at colors 4-7
    lea     (PPU_PAL_SHADOW).l,A0
    lea     CORRECT_NES_PALETTE(PC),A1
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .fe_table_ready
    lea     TITLE_SCREEN_NES_PALETTE(PC),A1
.fe_table_ready:
    moveq   #0,D5
.fe_line_loop:
    ; Set CRAM write address for palette line D5, color 0
    moveq   #0,D4
    move.w  D5,D4
    lsl.w   #5,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    ; Write BG pal D5 at colors 0-3
    moveq   #0,D3
.fe_bg_loop:
    moveq   #0,D4
    tst.w   D3
    beq     .fe_bg_backdrop
    move.w  D5,D4
    lsl.w   #2,D4
    add.w   D3,D4
    bra     .fe_bg_have_idx
.fe_bg_backdrop:
    moveq   #0,D4
.fe_bg_have_idx:
    moveq   #0,D0
    move.b  (A0,D4.w),D0
    bsr     FRONTEND_PAL_LOOKUP_FROM_TABLE
    move.w  D0,($C00000)
    addq.w  #1,D3
    cmpi.w  #4,D3
    bne     .fe_bg_loop
    ; Write sprite pal D5 at colors 4-7 (VDP auto-incremented to color 4)
    moveq   #0,D3
.fe_sp_loop:
    moveq   #0,D4
    tst.w   D3
    beq     .fe_sp_backdrop
    move.w  D5,D4
    lsl.w   #2,D4
    add.w   D3,D4
    addi.w  #16,D4
    bra     .fe_sp_have_idx
.fe_sp_backdrop:
    moveq   #0,D4
.fe_sp_have_idx:
    moveq   #0,D0
    move.b  (A0,D4.w),D0
    bsr     FRONTEND_PAL_LOOKUP_FROM_TABLE
    move.w  D0,($C00000)
    addq.w  #1,D3
    cmpi.w  #4,D3
    bne     .fe_sp_loop
    ; Frontend/title BG uses the same opaque color-0 rule as gameplay.
    moveq   #0,D0
    move.b  (A0),D0
    bsr     FRONTEND_PAL_LOOKUP_FROM_TABLE
    moveq   #0,D4
    move.w  D5,D4
    lsl.w   #5,D4
    addi.w  #30,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    move.w  D0,($C00000)
    ; Next palette line
    addq.w  #1,D5
    cmpi.w  #4,D5
    bne     .fe_line_loop
    ; Sync NES backdrop color
    moveq   #0,D0
    move.b  (A0),D0
    bsr     FRONTEND_PAL_LOOKUP_FROM_TABLE
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
    movem.l (A7)+,D0-D5/A0
    rts

NES_PAL_TO_BGR555:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    lea     NES_PALETTE_DATA,A0
    move.w  (A0,D0.w),D0
    rts

; Frontend-specific hardware palette lookup
; Uses A1 internally — does NOT clobber A0 (critical for sync loops)
FRONTEND_PAL_LOOKUP_FROM_TABLE:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    move.w  (A1,D0.w),D0
    rts

; Generic frontend palette lookup
; Uses A1 internally â€” does NOT clobber A0 (critical for sync loops)
FRONTEND_PAL_LOOKUP:
    lea     CORRECT_NES_PALETTE(PC),A1
    bra     FRONTEND_PAL_LOOKUP_FROM_TABLE

; Runtime title balance removed in favor of the static frontend hardware
; palette table below. Keeping lookup-only sync preserves v659-style timing.

; Accurate NES 2C02 NTSC palette → Genesis $0BGR (3-bit per channel)
; Lift each nonzero channel one 3-bit step until the top band to compensate
; for darker BizHawk/console output without runtime title tint math.
CORRECT_NES_PALETTE:
;   $00      $01      $02      $03      $04      $05      $06      $07
    DC.W $0AAA, $0C60, $0E06, $0E08, $0A0A, $080A, $000A, $0068
;   $08      $09      $0A      $0B      $0C      $0D      $0E      $0F
    DC.W $0066, $0080, $0080, $0080, $0880, $0000, $0000, $0000
;   $10      $11      $12      $13      $14      $15      $16      $17
    DC.W $0EEE, $0EA6, $0E88, $0E6A, $0E6C, $0A6E, $066E, $008C
;   $18      $19      $1A      $1B      $1C      $1D      $1E      $1F
    DC.W $00AA, $00C8, $00C0, $06C0, $0CA0, $0000, $0000, $0000
;   $20      $21      $22      $23      $24      $25      $26      $27
    DC.W $0EEE, $0EEA, $0ECC, $0EAE, $0EAE, $0EAE, $0ACE, $06CE
;   $28      $29      $2A      $2B      $2C      $2D      $2E      $2F
    DC.W $00EE, $00EC, $06EA, $0CE8, $0EE8, $0888, $0000, $0000
;   $30      $31      $32      $33      $34      $35      $36      $37
    DC.W $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE
;   $38      $39      $3A      $3B      $3C      $3D      $3E      $3F
    DC.W $0CEE, $0CEE, $0EEE, $0EEE, $0EEE, $0000, $0000, $0000

; Title-only frontend palette calibrated from a standard NES RGB palette and
; then nudged on the hottest Zelda title indices to match the darker hardware
; path better. Shared SMB title indices were used as a hardware-first sanity
; check so the title does not fall back into the olive/purple console look.
TITLE_SCREEN_NES_PALETTE:
;   $00      $01      $02      $03      $04      $05      $06      $07
    DC.W $0888, $0E00, $0A00, $0A24, $0808, $020A, $002A, $0028
;   $08      $09      $0A      $0B      $0C      $0D      $0E      $0F
    DC.W $08CE, $0080, $0060, $0060, $0640, $0000, $0000, $0000
;   $10      $11      $12      $13      $14      $15      $16      $17
    DC.W $0AAA, $0E80, $0E60, $0E46, $0C0C, $060C, $004A, $02AE
;   $18      $19      $1A      $1B      $1C      $1D      $1E      $1F
    DC.W $008A, $00A0, $08E0, $04A0, $0880, $0000, $0000, $0000
;   $20      $21      $22      $23      $24      $25      $26      $27
    DC.W $0EEE, $0EA4, $0ECC, $0E8A, $0E8E, $0A6E, $068E, $02AE
;   $28      $29      $2A      $2B      $2C      $2D      $2E      $2F
    DC.W $00EE, $02EA, $06C6, $0AE6, $0CC0, $0888, $0000, $0000
;   $30      $31      $32      $33      $34      $35      $36      $37
    DC.W $0EEE, $0ECA, $0EAA, $0EAC, $0EAE, $0AAE, $0CCE, $0EEE
;   $38      $39      $3A      $3B      $3C      $3D      $3E      $3F
    DC.W $08CE, $08EC, $0AEA, $0EEE, $0EE0, $0CCC, $0000, $0000

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

PPU_DISPATCH_TITLE_BUFFER:
    ; Parse NES PPU update buffer $10 and write it into bridge shadows.
    ; Buffer format: lo, hi, len/cmd, <len bytes> ... $FF terminator.
    movem.l D0-D7/A0-A1,-(A7)
    lea     _off000_A869_10_title_screen,A0

.block_loop:
    moveq   #0,D0
    move.b  (A0)+,D0
    cmpi.b  #$FF,D0
    beq     .done

    moveq   #0,D1
    move.b  (A0)+,D1
    lsl.w   #8,D1
    or.w    D0,D1

    moveq   #0,D2
    move.b  (A0)+,D2
    andi.w  #$003F,D2
    beq     .block_loop

    move.w  D1,D3

.byte_loop:
    move.b  (A0)+,D0
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$2000,D3
    blo     .advance
    cmpi.w  #$3F00,D3
    bhs     .advance

    bsr     PPU_NORMALIZE_NAMETABLE_ADDR
    lea     (PPU_NT_SHADOW).l,A1
    move.b  D0,(A1,D4.w)

.advance:
    addq.w  #1,D3
    subq.w  #1,D2
    bne     .byte_loop
    bra     .block_loop

.done:
    move.b  #1,(PPU_FULL_REDRAW_PENDING).l
    bsr     PPU_INVALIDATE_PLANE_CACHE
    movem.l (A7)+,D0-D7/A0-A1
    rts

INIT_TITLE_PALETTE_SHADOW:
    ; Load title screen palette data into PPU_PAL_SHADOW
    ; Title palettes: 8 palettes × 4 colors each = 32 bytes
    ; Palette data from NES bank_02:954F (tbl_954F_demo_manual_palette)
    lea     (PPU_PAL_SHADOW).l,A0
    ; Palette 0: $0F, $30, $30, $30
    move.b  #$0F,(A0)+
    move.b  #$30,(A0)+
    move.b  #$30,(A0)+
    move.b  #$30,(A0)+
    ; Palette 1: $0F, $21, $30, $30
    move.b  #$0F,(A0)+
    move.b  #$21,(A0)+
    move.b  #$30,(A0)+
    move.b  #$30,(A0)+
    ; Palette 2: $0F, $16, $30, $30  move.b  #$0F,(A0)+
    move.b  #$16,(A0)+
    move.b  #$30,(A0)+
    move.b  #$30,(A0)+
    ; Palette 3: $0F, $29, $1A, $09
    move.b  #$0F,(A0)+
    move.b  #$29,(A0)+
    move.b  #$1A,(A0)+
    move.b  #$09,(A0)+
    ; Palette 4: $0F, $29, $37, $17
    move.b  #$0F,(A0)+
    move.b  #$29,(A0)+
    move.b  #$37,(A0)+
    move.b  #$17,(A0)+
    ; Palette 5: $0F, $02, $22, $30
    move.b  #$0F,(A0)+
    move.b  #$02,(A0)+
    move.b  #$22,(A0)+
    move.b  #$30,(A0)+
    ; Palette 6: $0F, $16, $27, $30
    move.b  #$0F,(A0)+
    move.b  #$16,(A0)+
    move.b  #$27,(A0)+
    move.b  #$30,(A0)+
    ; Palette 7: $0F, $0B, $1B, $2B
    move.b  #$0F,(A0)+
    move.b  #$0B,(A0)+
    move.b  #$1B,(A0)+
    move.b  #$2B,(A0)+
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
    ; GUARD: H40 overflow clear — DO NOT REMOVE
    ; H40 mode shows 40 tile columns but NES only uses 32.
    ; Clear columns 32-39 for all 32 plane rows to prevent stale
    ; tile data from previous screens bleeding into the right side.
    movem.l D0-D1/D7,-(A7)
    moveq   #0,D1
    move.w  #31,D7
.clear_overflow_row:
    move.w  D1,D0
    lsl.w   #7,D0              ; row * 128 (64 tiles * 2 bytes)
    addi.w  #64,D0             ; column 32 * 2
    addi.w  #PLANE_A_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    addq.w  #1,D1
    dbra    D7,.clear_overflow_row
    movem.l (A7)+,D0-D1/D7
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
    ; Dynamic mirroring from MMC1 control bits 1:0 in dedicated shadow:
    ; 00 = one-screen lower, 01 = one-screen upper,
    ; 10 = vertical, 11 = horizontal.
    moveq   #0,D5
    move.b  (PPU_MIRROR_MODE).l,D5
    andi.w  #$0003,D5
    cmpi.w  #$0002,D5
    beq     .vertical
    cmpi.w  #$0003,D5
    beq     .horizontal
    tst.w   D5
    bne     .one_screen_upper
.one_screen_lower:
    andi.w  #$03FF,D4
    rts
.one_screen_upper:
    andi.w  #$03FF,D4
    ori.w   #$0400,D4
    rts
.vertical:
    move.w  D4,D5
    andi.w  #$0400,D5
    andi.w  #$03FF,D4
    or.w    D5,D4
    rts
.horizontal:
    move.w  D4,D5
    andi.w  #$0800,D5
    lsr.w   #1,D5
    andi.w  #$03FF,D4
    or.w    D5,D4
    rts

PPU_WRITE_NAMETABLE_BYTE:
    ; GUARD: Frontend artifact cleanup — DO NOT REMOVE
    ; Intercept stale tile 00/08 during file-select, register, elimination.
    ; LIVE: D0=tile byte, D3=VRAM address — DO NOT CLOBBER D3
    move.b  (ram_script).l,D5
    cmpi.b  #$01,D5
    beq     .check_artifact_tile
    cmpi.b  #con_script_register,D5
    beq     .check_artifact_tile
    cmpi.b  #con_script_elimination,D5
    beq     .check_artifact_tile
    bra     .write_normally
.check_artifact_tile:
    cmpi.b  #$00,D0
    beq     .file_select_replace
    cmpi.b  #$08,D0
    bne     .write_normally
.file_select_replace:
    move.b  #$24,D0
.write_normally:
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
    tst.b   (VDP_IN_VBLANK_FLAG).l
    beq     .defer_nt_write
    bsr     PPU_RENDER_NAMETABLE_CELL
    bra     .done
.defer_nt_write:
    addq.w  #1,(PPU_MIDFRAME_NT_WRITES).l
    move.b  #1,(PPU_FULL_REDRAW_PENDING).l
    bra     .done
.attribute:
    tst.b   (VDP_IN_VBLANK_FLAG).l
    beq     .defer_attr_write
    bsr     PPU_RENDER_ATTRIBUTE_BLOCK
    bra     .done
.defer_attr_write:
    addq.w  #1,(PPU_MIDFRAME_NT_WRITES).l
    move.b  #1,(PPU_FULL_REDRAW_PENDING).l
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
    cmp.b   (A0,D4.w),D0
    beq     .done
    move.b  D0,(A0,D4.w)
    move.b  #1,(PPU_CHR_DIRTY_FLAG).l
.done:
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
    ; Keep a sprite-encoded tile copy in a separate VRAM bank so
    ; sprite palettes can use colors 4-7 without affecting BG tiles.
    move.w  #SPRITE_TILE_VRAM_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    lea     (PPU_CHR_SHADOW).l,A0
    lea     PPU_SPRITE_PIXEL_PAIR_TABLE(pc),A3
    move.w  #511,D7
.sprite_tile_loop:
    movea.l A0,A1
    lea     8(A0),A2
    moveq   #7,D6
.sprite_row_loop:
    moveq   #0,D0
    moveq   #0,D1
    move.b  (A1)+,D0
    move.b  (A2)+,D1
    bsr     PPU_BUILD_GENESIS_ROW
    move.l  D2,(VDP_DATA)
    dbra    D6,.sprite_row_loop
    lea     16(A0),A0
    dbra    D7,.sprite_tile_loop
    clr.b   (PPU_CHR_DIRTY_FLAG).l
    movem.l (A7)+,D0-D7/A0-A3
    rts

PPU_FLUSH_TITLE_CHR_TO_VRAM:
    ; Hardware safety: only commit bulk CHR writes during VBlank.
    tst.b   (VDP_IN_VBLANK_FLAG).l
    beq     .done
    ; Reduce title/manual VRAM churn:
    ; - During title hold (phase 0), do a one-time full CHR flush.
    ; - Outside that window, throttle full flushes to every 4th frame.
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .throttled_flush
    tst.b   ($00FF042C).l
    bne     .throttled_flush
    tst.b   ($00FF042D).l
    bne     .throttled_flush
    tst.b   (PPU_TITLE_CHR_FLUSH_DONE).l
    bne     .done
    tst.b   (PPU_CHR_DIRTY_FLAG).l
    beq     .done
    bsr     PPU_FLUSH_CHR_SHADOW_TO_VRAM
    move.b  #1,(PPU_TITLE_CHR_FLUSH_DONE).l
    rts
.throttled_flush:
    clr.b   (PPU_TITLE_CHR_FLUSH_DONE).l
    tst.b   (PPU_CHR_DIRTY_FLAG).l
    beq     .done
    move.b  (ram_frm_cnt).l,D0
    andi.b  #$03,D0
    bne     .done
    bsr     PPU_FLUSH_CHR_SHADOW_TO_VRAM
.done:
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
    ; Also refresh sprite tile copies for the same CHR range.
    move.w  D2,D0
    addi.w  #SPRITE_TILE_VRAM_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  D2,D3
    lsr.w   #1,D3
    lea     (PPU_CHR_SHADOW).l,A0
    adda.w  D3,A0
    lea     PPU_SPRITE_PIXEL_PAIR_TABLE(pc),A3
    move.w  D1,D7
    subq.w  #1,D7
.sprite_tile_loop:
    movea.l A0,A1
    lea     8(A0),A2
    moveq   #7,D6
.sprite_row_loop:
    moveq   #0,D0
    moveq   #0,D1
    move.b  (A1)+,D0
    move.b  (A2)+,D1
    bsr     PPU_BUILD_GENESIS_ROW
    move.l  D2,(VDP_DATA)
    dbra    D6,.sprite_row_loop
    lea     16(A0),A0
    dbra    D7,.sprite_tile_loop
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

; NES background color 0 is the universal backdrop color, not transparency.
; Encode BG zeroes as Genesis color $F and mirror the backdrop into color 15
; of each BG palette line during CRAM sync.
PPU_PIXEL_PAIR_TABLE:
    dc.b    $FF,$F1,$1F,$11,$F2,$F3,$12,$13
    dc.b    $2F,$21,$3F,$31,$22,$23,$32,$33

; GUARD: v490 sprite pixel pair table — DO NOT MODIFY
; FIX v490: Sprite pixel pair table — non-zero pixels shifted +4
; So sprite tiles use palette colors 4-7 instead of 0-3.
; Interdependent with SPRITE_TILE_INDEX_OFS and palette split logic.
PPU_SPRITE_PIXEL_PAIR_TABLE:
    dc.b    $00,$05,$50,$55,$06,$07,$56,$57
    dc.b    $60,$65,$70,$75,$66,$67,$76,$77

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
.ppuctrl_bg_select:
    ; Frontend/title/register/file-select paths should use direct NT tile IDs.
    ; Applying MMC1 CHR bank offsets here can generate incorrect tile numbers
    ; during fades/transitions when mapper registers are transient.
    move.b  (ram_script).l,D0
    cmpi.b  #con_script_title_screen,D0
    beq     .frontend_tile_base
    cmpi.b  #con_script_register,D0
    beq     .frontend_tile_base
    cmpi.b  #con_script_elimination,D0
    beq     .frontend_tile_base
    cmpi.b  #con_script_final_credits,D0
    beq     .frontend_tile_base

    ; Apply MMC1 CHR banking for background tile fetch.
    moveq   #0,D0
    move.b  (PPU_MIRROR_MODE).l,D0
    btst    #4,D0
    bne     .chr_4k_mode

.chr_8k_mode:
    moveq   #0,D3
    move.b  (ROM_$A000).l,D3
    andi.w  #$001E,D3
    lsl.w   #8,D3
    add.w   D3,D2
    btst    #4,(PPUCTRL_SHADOW).l
    beq     .tile_base_done
    addi.w  #$0100,D2
    bra     .tile_base_done

.chr_4k_mode:
    btst    #4,(PPUCTRL_SHADOW).l
    bne     .chr_4k_bg_hi
    moveq   #0,D3
    move.b  (ROM_$A000).l,D3
    bra     .chr_4k_have_bank
.chr_4k_bg_hi:
    moveq   #0,D3
    move.b  (ROM_$C000).l,D3
.chr_4k_have_bank:
    andi.w  #$001F,D3
    lsl.w   #8,D3
    add.w   D3,D2
    bra     .tile_base_done

.frontend_tile_base:
    tst.w   D2
    beq     .tile_base_done
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
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .title_priority_done
    ori.w   #$8000,D6
.title_priority_done:

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
;   $00      $01      $02      $03      $04      $05      $06      $07
    DC.W $0666, $0820, $0A02, $0A04, $0606, $0406, $0006, $0024
;   $08      $09      $0A      $0B      $0C      $0D      $0E      $0F
    DC.W $0022, $0040, $0040, $0040, $0440, $0000, $0000, $0000
;   $10      $11      $12      $13      $14      $15      $16      $17
    DC.W $0AAA, $0C62, $0E44, $0E26, $0C28, $062A, $022A, $0048
;   $18      $19      $1A      $1B      $1C      $1D      $1E      $1F
    DC.W $0066, $0084, $0080, $0280, $0860, $0000, $0000, $0000
;   $20      $21      $22      $23      $24      $25      $26      $27
    DC.W $0EEE, $0EA6, $0E88, $0E6A, $0E6E, $0C6E, $068E, $028C
;   $28      $29      $2A      $2B      $2C      $2D      $2E      $2F
    DC.W $00AA, $00C8, $02C6, $08C4, $0CC4, $0444, $0000, $0000
;   $30      $31      $32      $33      $34      $35      $36      $37
    DC.W $0EEE, $0ECA, $0ECC, $0EAC, $0EAE, $0CAE, $0ACE, $0ACE
;   $38      $39      $3A      $3B      $3C      $3D      $3E      $3F
    DC.W $08CC, $08EC, $0AEA, $0CEA, $0ECA, $0000, $0000, $0000



; ===================================================================
; NES ZELDA TITLE SCREEN BUFFER (Index $10)
; Extracted from NES ROM - contains complete PPU nametable+attributes
; Structure: PPU_ADDR(2 LE) + LEN_CMD(1, $20) + DATA(32) ... repeat ... $FF
; ===================================================================
