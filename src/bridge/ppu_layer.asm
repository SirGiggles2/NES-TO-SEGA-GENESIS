;------------------------------------------------------------------------------
; NES PPU Layer for Genesis Bridge
; This file emulates NES PPU register and VRAM behavior on top of Genesis VDP.
; All graphics code should route through this abstraction, not direct VDP access.
;------------------------------------------------------------------------------

; Example: PPU_WRITE_2007 (VRAM write)
PPU_WRITE_2007:
    ; Darkness fix: always clear high word before composing VDP command
    andi.l  #$0000FFFF,D0   ; Zero D0's high word
    moveq   #0,D1           ; Zero all of D1
    ; TODO: Implement VRAM write logic, including pattern table offset handling
    rts

; Example: PPU_WRITE_2000 (PPUCTRL)
PPU_WRITE_2000:
    ; TODO: Latch control bits, handle BG pattern table select, NMI enable, etc.
    rts

; Example: PPU_WRITE_2001 (PPUMASK)
PPU_WRITE_2001:
    ; TODO: Handle display enable, color emphasis, etc.
    rts

; Example: PPU_WRITE_2005 (Scroll)
PPU_WRITE_2005:
    ; TODO: Latch scroll values, map to Genesis HSCROLL/VSRAM
    rts

; Example: PPU_READ_2007 (VRAM read)
PPU_READ_2007:
    ; TODO: Implement VRAM read buffer with NES one-read-behind behavior
    rts

; Example: PPU OAM DMA (Sprite upload)
PPU_WRITE_2003:
    ; TODO: Implement OAM address latch
    rts

PPU_WRITE_4014:
    ; TODO: Implement OAM DMA transfer to Genesis sprite table
    rts

; Add additional PPU register emulation as needed

; All VRAM writes must clear high words before command composition!
; andi.l  #$0000FFFF,D0
; moveq   #0,D1
; ...
