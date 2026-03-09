; Legend of Zelda - sample routines for translation testing
; Based on cyneprepou4uk disassembly patterns

; ── RAM locations (from bank_ram.inc) ──
; $0010 = Link X position
; $0011 = Link Y position  
; $0016 = Link direction
; $006D = game state
; $007C = health (hearts)

; ── Init routine ──
ResetHandler:
    SEI                  ; disable interrupts
    CLD                  ; clear decimal mode
    LDX #$FF
    TXS                  ; set stack pointer
    LDX #$00
    STX $2000            ; disable PPU NMI
    STX $2001            ; disable rendering

WaitVBlank1:
    LDA $2002            ; read PPU status
    BPL WaitVBlank1      ; wait for vblank

ClearRAM:
    LDA #$00
    STA $00,X
    INX
    BNE ClearRAM

WaitVBlank2:
    LDA $2002
    BPL WaitVBlank2

    JMP MainInit

; ── Link movement ──
UpdateLinkPosition:
    LDA $16              ; load direction
    CMP #$00
    BEQ MoveUp
    CMP #$01
    BEQ MoveDown
    CMP #$02
    BEQ MoveLeft
    CMP #$03
    BEQ MoveRight
    RTS

MoveUp:
    LDA $11              ; Y position
    SEC
    SBC #$02             ; move up by 2
    STA $11
    RTS

MoveDown:
    LDA $11
    CLC
    ADC #$02
    STA $11
    RTS

MoveLeft:
    LDA $10              ; X position
    SEC
    SBC #$02
    STA $10
    RTS

MoveRight:
    LDA $10
    CLC
    ADC #$02
    STA $10
    RTS

; ── Health check ──
CheckHealth:
    LDA $7C              ; current health
    BEQ LinkDead
    CMP #$08             ; check low health beep threshold
    BPL HealthOK
    ; TODO: trigger low health sound
    JMP HealthOK

LinkDead:
    LDA #$00
    STA $6D              ; set game state to dead
    RTS

HealthOK:
    RTS

; ── Enemy collision ──
CheckEnemyHit:
    LDX #$00             ; enemy index
EnemyLoop:
    LDA $0200,X          ; enemy active flag
    BEQ NextEnemy
    LDA $0202,X          ; enemy X
    SEC
    SBC $10              ; subtract Link X
    BPL .positive1
    EOR #$FF
    ADC #$01
.positive1:
    CMP #$10             ; within 16 pixels?
    BCS NextEnemy
    LDA $0203,X          ; enemy Y
    SEC
    SBC $11
    BPL .positive2
    EOR #$FF
    ADC #$01
.positive2:
    CMP #$10
    BCS NextEnemy
    JSR HitLink
NextEnemy:
    INX
    INX
    INX
    INX
    CPX #$40             ; checked all enemies?
    BNE EnemyLoop
    RTS

HitLink:
    LDA $7C
    BEQ LinkDead
    SEC
    SBC #$02             ; lose one heart
    STA $7C
    RTS

MainInit:
    NOP
    RTS
