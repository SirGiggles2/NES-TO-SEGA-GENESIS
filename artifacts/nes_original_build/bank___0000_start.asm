
; =============================================================
; bank___0000_start.asm
; Patch: replace PPU_WRITE_2000 stub at $000534
; =============================================================

        org $000534

PPU_WRITE_2000:
        move.b  D0,($FFFFEF00)     ; PPUCTRL_SHADOW
        btst    #7,D0
        beq.s   .done

        move.w  #$8174,($C00004)   ; enable VBlank interrupt

.done:
        rts
