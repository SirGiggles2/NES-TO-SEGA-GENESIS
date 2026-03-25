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

RAM_FOR_2001    EQU $FFFF00FE
RAM_FOR_2000    EQU $FFFF00FF
RAM_SCROLL_Y    EQU $FFFF00FC
RAM_SCROLL_X    EQU $FFFF00FD
PLANE_A_MAP_BASE EQU $C000
PLANE_B_MAP_BASE EQU $E000
WINDOW_MAP_BASE  EQU $3800
PPU_NT_SHADOW   EQU $00FF8200
PPU_PAL_SHADOW  EQU $00FF9200
PPU_CHR_SHADOW  EQU $00FFC000
PPU_NT_MIRROR_MASK EQU $03FF
NES_BACKDROP_TILE_INDEX EQU $0400
NES_BACKDROP_TILE_VRAM  EQU $8000
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
    clr.b   (PPU_TITLE_CHR_FLUSH_DONE).l
    clr.b   (VDP_IN_VBLANK_FLAG).l
    clr.w   (PPU_MIDFRAME_NT_WRITES).l
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
    move.l  #$7C000002,($C00004)
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
    move.b  #1,(VDP_IN_VBLANK_FLAG).l
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
    bsr     VDP_APPLY_TITLE_BLACK_GAP_DISPLAY
    move.b  (PPUMASK_SHADOW).l,D0
    andi.b  #$18,D0
    beq     .skip_nt_flush
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
    move.l  #$58000003,($C00004)
    movea.l #($FF0000+$0200),A1
    move.w  #63,D7
.sprite_loop:
    move.b  (A1)+,D3
    move.b  (A1)+,D4
    move.b  (A1)+,D5
    move.b  (A1)+,D6
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
    ; Window plane can become visible during frontend/title timing.
    ; Fill it with the same backdrop tile to prevent dotted garbage speckle.
    move.w  #WINDOW_MAP_BASE,D0
    bsr     VDP_SET_VRAM_WRITE_ADDR
    move.w  #2047,D7
.window_loop:
    move.w  #NES_BACKDROP_TILE_INDEX,($C00000)
    dbra    D7,.window_loop
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
    moveq   #0,D5
.fe_line_loop:
    ; Set CRAM write address for palette line D5, color 0
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
    bsr     FRONTEND_PAL_LOOKUP
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .fe_bg_no_title_balance
    tst.b   ($00FF042C).l                 ; auto-demo/phase group: title hold is 0
    bne     .fe_bg_no_title_balance
    tst.b   ($00FF042D).l                 ; title sub-phase: hold is 0, fade is 1+
    bne     .fe_bg_no_title_balance
    bsr     TITLE_SCREEN_COLOR_BALANCE
.fe_bg_no_title_balance:
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
    bsr     FRONTEND_PAL_LOOKUP
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .fe_sp_no_title_balance
    tst.b   ($00FF042C).l
    bne     .fe_sp_no_title_balance
    tst.b   ($00FF042D).l
    bne     .fe_sp_no_title_balance
    bsr     TITLE_SCREEN_COLOR_BALANCE
.fe_sp_no_title_balance:
    move.w  D0,($C00000)
    addq.w  #1,D3
    cmpi.w  #4,D3
    bne     .fe_sp_loop
    ; Next palette line
    addq.w  #1,D5
    cmpi.w  #4,D5
    bne     .fe_line_loop
    ; Sync NES backdrop color
    moveq   #0,D0
    move.b  (A0),D0
    bsr     FRONTEND_PAL_LOOKUP
    cmpi.b  #con_script_title_screen,(ram_script).l
    bne     .fe_bd_no_title_balance
    tst.b   ($00FF042C).l
    bne     .fe_bd_no_title_balance
    tst.b   ($00FF042D).l
    bne     .fe_bd_no_title_balance
    bsr     TITLE_SCREEN_COLOR_BALANCE
.fe_bd_no_title_balance:
    bsr     VDP_SYNC_NES_BACKDROP_COLOR
    movem.l (A7)+,D0-D5/A0
    rts

NES_PAL_TO_BGR555:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    lea     NES_PALETTE_DATA,A0
    move.w  (A0,D0.w),D0
    rts

; FIX v446: Frontend-specific palette lookup using CORRECT NES palette
; Uses A1 internally — does NOT clobber A0 (critical for sync loops)
FRONTEND_PAL_LOOKUP:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    lea     CORRECT_NES_PALETTE(PC),A1
    move.w  (A1,D0.w),D0
    rts

; Title-only palette balancing:
; reduce red cast and slightly lift green/blue to better match NES capture.
TITLE_SCREEN_COLOR_BALANCE:
    ; Keep frontend/title palette as raw NES mapping for parity.
    rts

; Accurate NES 2C02 NTSC palette → Genesis $0BGR (3-bit per channel)
; Computed from standard NES 2C02 RGB values, rounded to nearest Genesis level
CORRECT_NES_PALETTE:
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
    bsr     PPU_FLUSH_CHR_SHADOW_TO_VRAM
    move.b  #1,(PPU_TITLE_CHR_FLUSH_DONE).l
    rts
.throttled_flush:
    clr.b   (PPU_TITLE_CHR_FLUSH_DONE).l
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

PPU_PIXEL_PAIR_TABLE:
    dc.b    $00,$01,$10,$11,$02,$03,$12,$13
    dc.b    $20,$21,$30,$31,$22,$23,$32,$33

; FIX v490: Sprite pixel pair table — non-zero pixels shifted +4
; So sprite tiles use palette colors 4-7 instead of 0-3
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


