; ═══════════════════════════════════════════════════════════════
; main.asm - Sega Genesis ROM Entry Point
; The Legend of Zelda - NES to Genesis Port
;
; Assemble with vasm (free, excellent 68000 assembler):
;   Download: http://sun.hasenbraten.de/vasm/
;   Command:  vasmm68k_mot.exe -Fbin -o zelda.md main.asm
;
; Test in emulator:
;   BlastEm:  https://www.retrodev.com/blastem/
;   Just drag zelda.md onto BlastEm.exe
; ═══════════════════════════════════════════════════════════════

    ORG $000000

; ═══════════════════════════════════════════════════════════════
; SECTION 1: INTERRUPT VECTOR TABLE ($000000-$0003FF)
; The Genesis/68000 reads these addresses on startup and interrupts
; ═══════════════════════════════════════════════════════════════

    ; Initial stack pointer - top of 68k RAM ($FF0000 + 64KB - 4)
    DC.L    $00FFFE00

    ; Reset vector - where the CPU jumps on power-on
    DC.L    GENESIS_RESET

    ; Exception vectors (bus error, address error, etc.)
    DC.L    EXCEPTION_HANDLER   ; Bus error
    DC.L    EXCEPTION_HANDLER   ; Address error
    DC.L    EXCEPTION_HANDLER   ; Illegal instruction
    DC.L    EXCEPTION_HANDLER   ; Division by zero
    DC.L    EXCEPTION_HANDLER   ; CHK instruction
    DC.L    EXCEPTION_HANDLER   ; TRAPV instruction
    DC.L    EXCEPTION_HANDLER   ; Privilege violation
    DC.L    EXCEPTION_HANDLER   ; Trace
    DC.L    EXCEPTION_HANDLER   ; Line A emulator
    DC.L    EXCEPTION_HANDLER   ; Line F emulator
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; (reserved)
    DC.L    EXCEPTION_HANDLER   ; Spurious interrupt
    DC.L    EXCEPTION_HANDLER   ; Level 1 interrupt
    DC.L    EXCEPTION_HANDLER   ; Level 2 interrupt (EXT)
    DC.L    EXCEPTION_HANDLER   ; Level 3 interrupt
    DC.L    EXCEPTION_HANDLER   ; Level 4 interrupt (H-blank)
    DC.L    EXCEPTION_HANDLER   ; Level 5 interrupt
    DC.L    VDP_VBLANK_HANDLER  ; Level 6 interrupt (V-blank) ← Genesis VDP VBlank
    DC.L    EXCEPTION_HANDLER   ; Level 7 interrupt (NMI)
    DC.L    EXCEPTION_HANDLER   ; TRAP #0
    DC.L    EXCEPTION_HANDLER   ; TRAP #1
    DC.L    EXCEPTION_HANDLER   ; TRAP #2
    DC.L    EXCEPTION_HANDLER   ; TRAP #3
    DC.L    EXCEPTION_HANDLER   ; TRAP #4
    DC.L    EXCEPTION_HANDLER   ; TRAP #5
    DC.L    EXCEPTION_HANDLER   ; TRAP #6
    DC.L    EXCEPTION_HANDLER   ; TRAP #7
    DC.L    EXCEPTION_HANDLER   ; TRAP #8
    DC.L    EXCEPTION_HANDLER   ; TRAP #9
    DC.L    EXCEPTION_HANDLER   ; TRAP #10
    DC.L    EXCEPTION_HANDLER   ; TRAP #11
    DC.L    EXCEPTION_HANDLER   ; TRAP #12
    DC.L    EXCEPTION_HANDLER   ; TRAP #13
    DC.L    EXCEPTION_HANDLER   ; TRAP #14
    DC.L    EXCEPTION_HANDLER   ; TRAP #15
    DC.L    EXCEPTION_HANDLER   ; (reserved x16)
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER
    DC.L    EXCEPTION_HANDLER

; ═══════════════════════════════════════════════════════════════
; SECTION 2: ROM HEADER ($000100-$0001FF)
; The Genesis BIOS reads this to identify the game
; ═══════════════════════════════════════════════════════════════

    ORG $000100

    ; Console name (must be exactly "SEGA MEGA DRIVE " or "SEGA GENESIS    ")
    DC.B    "SEGA MEGA DRIVE "          ; 16 bytes

    ; Copyright / release date
    DC.B    "(C)HOMEBREW 2024.JAN"      ; 16 bytes

    ; Domestic game name (Japanese) - 48 bytes, space padded
    DC.B    "THE LEGEND OF ZELDA                             "

    ; Overseas game name (English) - 48 bytes, space padded
    DC.B    "THE LEGEND OF ZELDA (NES PORT)                  "

    ; Serial number and version
    DC.B    "GM ZELDA-NES-00 "          ; 14 bytes + 2 reserved

    ; Checksum (placeholder - will be computed by build script)
    DC.W    $0000

    ; I/O support
    DC.B    "J               "          ; Joypad support, 16 bytes

    ; ROM start and end addresses
    DC.L    $00000000                   ; ROM start
    DC.L    $0007FFFF                   ; ROM end (512KB)

    ; RAM start and end addresses
    DC.L    $00FF0000                   ; RAM start
    DC.L    $00FFFFFF                   ; RAM end

    ; SRAM support (Zelda uses battery-backed SRAM for saves!)
    DC.B    "RA"                        ; SRAM identifier
    DC.W    $F820                       ; SRAM type flags
    DC.L    $00200000                   ; SRAM start address
    DC.L    $00200001                   ; SRAM end address (2 bytes = 3 save slots)

    ; Modem support (none)
    DC.B    "            "              ; 12 bytes

    ; Notes / memo field
    DC.B    "NES->GEN PORT BY JAKE               "  ; 40 bytes

    ; Region support
    DC.B    "JUE "                      ; Japan, USA, Europe

; ═══════════════════════════════════════════════════════════════
; SECTION 3: GENESIS STARTUP CODE ($000200+)
; Hardware init before jumping to Zelda's reset handler
; ═══════════════════════════════════════════════════════════════

    ORG $000200

; ── Crash logger RAM (outside Zelda work RAM / below VDP shadows) ──
CRASH_BASE      EQU $FFEE00
CRASH_MAGIC     EQU $FFEE00
CRASH_VECTOR    EQU $FFEE02
CRASH_SP        EQU $FFEE04
CRASH_SR        EQU $FFEE08
CRASH_PC        EQU $FFEE0A
CRASH_FRAME     EQU $FFEE10
CRASH_REGS      EQU $FFEE40


GENESIS_RESET:
    ; Disable interrupts immediately
    move    #$2700,SR

    ; ── Initialize the TMSS (trademark security system) ──
    ; Required on real hardware or it won't boot
    move.b  ($A10001),D0            ; read hardware version
    andi.b  #$0F,D0                 ; mask version bits
    beq     .skip_tmss              ; version 0 = no TMSS
    move.l  #'SEGA',($A14000)       ; write TMSS signature
.skip_tmss:

    ; ── Stop the Z80 (sound CPU) ──
    move.w  #$0100,($A11100)        ; request Z80 bus
    move.w  #$0100,($A11200)        ; reset Z80
.wait_z80:
    btst    #0,($A11100)            ; wait for bus grant
    bne     .wait_z80
    ; Z80 is now halted, we own the bus

    ; ── Clear Genesis RAM ($FF0000-$FFFFFF) ──
    ; This replaces the NES ClearRAM routine
    ; NOTE: Must happen BEFORE VDP_INIT so shadow registers are not wiped
    movea.l #$FF0000,A0
    move.w  #$3BFF,D0               ; 15360 longs = 60KB (stops before VDP shadow regs at $FFEF00)
.clear_ram:
    clr.l   (A0)+
    dbra    D0,.clear_ram

    ; ── Initialize VDP (after RAM clear so shadow regs survive) ──
    bsr     VDP_INIT

    ; ── Load pre-converted 4bpp tile data into VRAM ──
    ; Must run AFTER VDP_INIT (which clears VRAM and sets auto-increment=2)
    ; but BEFORE the NES game starts (which tries to do its own tile copies)
    bsr     CHR_VRAM_LOAD

    ; ── Initialize joypad ──
    bsr     JOYPAD_INIT

    ; ── Allow VBlank (Level 6) interrupts ──
    ; NES NMI is non-maskable: fires regardless of I flag.
    ; Genesis Level 6 is maskable: blocked while IPM >= 6.
    ; Zelda never uses CLI (doesn't need to on NES), so we must lower IPM here.
    andi    #$F8FF,SR               ; clear IPM bits → allow Level 6 VBlank

    ; ── Now jump to the translated Zelda init ──
    ; This is the translated NES reset handler
    ; (after CLD, SEI, stack init which we've already done above)
    JMP     ResetHandler_NES

; ═══════════════════════════════════════════════════════════════
; JOYPAD_INIT - Set up Genesis controller ports
; ═══════════════════════════════════════════════════════════════
JOYPAD_INIT:
    move.b  #$40,($A10009)          ; port 1 ctrl: D0=output (for strobe)
    move.b  #$40,($A1000B)          ; port 2 ctrl
    rts

; ═══════════════════════════════════════════════════════════════
; READ_JOYPAD - Read Genesis 3-button controller
; Returns NES-format button byte in D0:
;   bit 7=A(NES), 6=B, 5=Select, 4=Start, 3=Up, 2=Down, 1=Left, 0=Right
;
; Genesis button mapping to NES:
;   Genesis START → NES START
;   Genesis A     → NES A
;   Genesis B     → NES B
;   Genesis C     → NES A (second button)
;   D-pad         → D-pad (direct)
; ═══════════════════════════════════════════════════════════════
READ_JOYPAD:
    ; Strobe high
    move.b  #$40,($A10003)
    nop
    nop
    ; Read high nibble (Start, A, C, B + directions)
    move.b  ($A10003),D1
    ; Strobe low
    move.b  #$00,($A10003)
    nop
    nop
    ; Read low nibble (Start, A, C, B again + mode)
    move.b  ($A10003),D2

    ; Build NES-format byte in D0
    clr.b   D0

    ; D-pad from D1 bits 0-3 (Up=3, Down=2, Left=1, Right=0)
    move.b  D1,D3
    andi.b  #$0F,D3                 ; mask direction bits
    ; NES: bit3=Up, bit2=Down, bit1=Left, bit0=Right (active low on Genesis)
    eori.b  #$0F,D3                 ; invert (Genesis is active low)
    or.b    D3,D0

    ; Start button: Genesis D1 bit 5
    btst    #5,D1
    bne     .no_start               ; active low - not pressed if bit set
    bset    #4,D0                   ; NES Start = bit 4
.no_start:

    ; A button: Genesis D1 bit 6 → NES A = bit 7
    btst    #6,D1
    bne     .no_a
    bset    #7,D0
.no_a:

    ; B button: Genesis D2 bit 4 → NES B = bit 6
    btst    #4,D2
    bne     .no_b
    bset    #6,D0
.no_b:

    ; Select: Genesis has no Select - map to C button (D1 bit 4)
    btst    #4,D1
    bne     .no_select
    bset    #5,D0
.no_select:

    ; Store for NES input routines to read
    ; NES reads controller state from RAM - we mirror it there
    move.b  D0,($FF0000+$00F0)      ; joypad 1 state in NES RAM mirror
    rts

; ═══════════════════════════════════════════════════════════════
; EXCEPTION_HANDLER - Catch all unexpected exceptions
; Stores stack/register state in RAM and flashes red.
; Generic 68000 exception frames place SR at (SP) and PC at 2(SP).
; The raw frame bytes are also copied for deeper inspection.
; ═══════════════════════════════════════════════════════════════
EXCEPTION_HANDLER:
    move.l  A7,(CRASH_SP).l         ; exception frame SP on entry
    move.w  (A7),(CRASH_SR).l       ; generic SR
    move.l  2(A7),(CRASH_PC).l      ; generic PC
    move.w  #$BEEF,(CRASH_MAGIC).l
    clr.w   (CRASH_VECTOR).l

    lea     CRASH_FRAME,A0
    movea.l A7,A1
    moveq   #15,D7                  ; copy first 16 words (32 bytes) of raw frame
.copy_frame:
    move.w  (A1)+,(A0)+
    dbra    D7,.copy_frame

    lea     CRASH_REGS,A0
    movem.l D0-D7/A0-A6,(A0)

    ; Write red to CRAM entry 0 (background color)
    move.l  #$C0000000,($C00004)    ; CRAM write addr 0
    move.w  #$000E,($C00000)        ; red in BGR555
.halt:
    bra     .halt                   ; infinite loop - inspect diag/debugger

; ═══════════════════════════════════════════════════════════════
; CHR_VRAM_LOAD - Copy pre-converted 4bpp tile data into VDP VRAM
; Called once at startup after VDP_INIT.
; Loads 512 tiles (16KB) into VRAM $0000-$3FFF:
;   Tiles   0-255  (VRAM $0000-$1FFF) = PT0 background tiles
;   Tiles 256-511  (VRAM $2000-$3FFF) = PT1 sprite tiles
; Source: zelda_tiles_4bpp.bin (generated by chr_convert.py)
; ═══════════════════════════════════════════════════════════════
CHR_VRAM_LOAD:
    ; Set VRAM write address to $0000 (tile area base)
    move.l  #$40000000,($C00004)    ; VRAM write cmd for addr $0000
    ; Stream 16KB of 4bpp tile data from ROM to VRAM
    ; VDP auto-increment = 2, MOVE.L writes 4 bytes per iteration
    movea.l #ZELDA_TILES_4BPP,A0
    move.w  #(16384/4)-1,D0        ; 4095 = 4096 iterations
.chr_loop:
    move.l  (A0)+,($C00000)        ; 4 bytes → 2 VDP words → VRAM +4
    dbra    D0,.chr_loop
    rts

; ═══════════════════════════════════════════════════════════════
; ResetHandler_NES - Entry point into translated Zelda code
; This bridges the Genesis init to the NES reset handler
; The actual NES reset handler is in bank_FF_gen68k_vdp.asm
; ═══════════════════════════════════════════════════════════════
ResetHandler_NES:
    ; NES reset is in bank_FF (the fixed bank)
    ; After our Genesis init above, skip the NES hardware init
    ; (SEI, CLD, stack setup) since we've done it Genesis-style
    ; Jump straight to the game init proper
    JMP     MainInit                ; defined in bank_FF_gen68k_vdp.asm

; ═══════════════════════════════════════════════════════════════
; INCLUDE all translated bank files and VDP layer
; ═══════════════════════════════════════════════════════════════

    INCLUDE "ram_map.asm"          ; Global RAM/constant label declarations
    INCLUDE "vdp_layer.asm"
    INCLUDE "bank_FF_gen68k_vdp.asm"        ; Fixed bank (always mapped)
    INCLUDE "bank___BF50_BFF9_gen68k_vdp.asm"
    INCLUDE "bank_00_gen68k_vdp.asm"
    INCLUDE "bank_01_gen68k_vdp.asm"
    INCLUDE "bank_02_gen68k_vdp.asm"
    INCLUDE "bank_03_gen68k_vdp.asm"
    INCLUDE "bank_04_gen68k_vdp.asm"
    INCLUDE "bank_05_gen68k_vdp.asm"
    INCLUDE "bank_06_gen68k_vdp.asm"
    INCLUDE "bank_s1_gen68k_vdp.asm"
    INCLUDE "bank_s2_gen68k_vdp.asm"

; ═══════════════════════════════════════════════════════════════
; Pre-converted Genesis 4bpp tile data (generated by chr_convert.py)
; 512 tiles × 32 bytes = 16384 bytes
; ═══════════════════════════════════════════════════════════════
ZELDA_TILES_4BPP:
    INCBIN  "zelda_tiles_4bpp.bin"
