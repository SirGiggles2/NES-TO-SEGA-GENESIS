; ═══════════════════════════════════════════════════════════════
; vdp_layer.asm - FULL FILE (v68 ready)
; Sega Genesis VDP → NES PPU translation layer
; FIXED: VBlank bridges into NES NMI via BSR and cleanly restores 68k context
; ═══════════════════════════════════════════════════════════════

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

RAM_FOR_2001    EQU $FFFF00FE
RAM_FOR_2000    EQU $FFFF00FF
RAM_SCROLL_Y    EQU $FFFF00FC
RAM_SCROLL_X    EQU $FFFF00FD

ram_frm_cnt                 EQU $FF0015
ram_0011_screen_ready_flag  EQU $FF0011
ram_0300_useless            EQU $FF0300
vec_0x01E494_NMI            EQU vec_E484_NMI   ; from bank_FF

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
    move.l  #$BC000003,($C00004)
    moveq   #0,D3
    move.b  (PPUSCROLL_X).l,D3
    neg.w   D3
    move.w  D3,($C00000)
    rts
.write_y:
    move.b  D0,(PPUSCROLL_Y).l
    move.b  D0,(RAM_SCROLL_Y).l
    clr.b   (PPUSCROLL_LATCH).l
    move.l  #$40004000,($C00004)
    moveq   #0,D3
    move.b  (PPUSCROLL_Y).l,D3
    move.w  D3,($C00000)
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
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$3F00,D4
    beq     .palette_addr
    move.w  D3,D4
    andi.w  #$3FFF,D4
    swap    D4
    move.w  D3,D4
    lsr.w   #8,D4
    lsr.w   #6,D4
    ori.l   #$40000000,D4
    move.l  D4,($C00004)
    rts
.palette_addr:
    move.w  D3,D4
    andi.w  #$1F,D4
    lsl.w   #1,D4
    swap    D4
    ori.l   #$C0000000,D4
    move.l  D4,($C00004)
    rts

PPU_WRITE_2007:
    move.w  (VRAM_ADDR_CURR).l,D3
    move.w  D3,D4
    andi.w  #$FF00,D4
    cmpi.w  #$3F00,D4
    beq     .palette_write
    cmpi.w  #$2000,D3
    blo     .skip_write
    move.w  D0,D3
    lsl.w   #8,D3
    move.w  D3,($C00000)
    move.w  (VRAM_ADDR_CURR).l,D3
    btst    #2,(PPUCTRL_SHADOW).l
    beq     .inc_by_1
    addi.w  #32,D3
    bra     .inc_done
.inc_by_1:
    addi.w  #1,D3
.inc_done:
    move.w  D3,(VRAM_ADDR_CURR).l
    rts
.skip_write:
    move.w  (VRAM_ADDR_CURR).l,D3
    btst    #2,(PPUCTRL_SHADOW).l
    beq     .skip_inc_by_1
    addi.w  #32,D3
    bra     .skip_inc_done
.skip_inc_by_1:
    addi.w  #1,D3
.skip_inc_done:
    move.w  D3,(VRAM_ADDR_CURR).l
    rts
.palette_write:
    bsr     NES_PAL_TO_BGR555
    move.w  D0,($C00000)
    move.w  (VRAM_ADDR_CURR).l,D3
    addi.w  #1,D3
    move.w  D3,(VRAM_ADDR_CURR).l
    rts

PPU_READ_2007:
    move.w  ($C00000),D0
    lsr.w   #8,D0
    andi.w  #$00FF,D0
    move.w  (VRAM_ADDR_CURR).l,D3
    btst    #2,(PPUCTRL_SHADOW).l
    beq     .read_inc_by_1
    addi.w  #32,D3
    bra     .read_inc_done
.read_inc_by_1:
    addi.w  #1,D3
.read_inc_done:
    move.w  D3,(VRAM_ADDR_CURR).l
    rts

VDP_VBLANK_HANDLER:
    movem.l D0-D7/A0-A6,-(A7)
    move.w  ($C00004),D0
    addq.b  #1,(ram_frm_cnt).l
    move.b  #1,(ram_0011_screen_ready_flag).l
    move.b  #$3F,(ram_0300_useless).l
    move.b  #$80,(RAM_FOR_2000).l
    bsr     PPU_WRITE_2000
    moveq   #$1E,D0
    bsr     PPU_WRITE_2001
    bsr     vec_0x01E494_NMI
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
    rts

NES_PAL_TO_BGR555:
    andi.w  #$3F,D0
    lsl.w   #1,D0
    lea     NES_PALETTE_DATA,A0
    move.w  (A0,D0.w),D0
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
