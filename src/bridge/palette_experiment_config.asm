; Shared palette-source experiment profiles.
; 0 = baseline mixed tables:
;     gameplay -> NES_PALETTE_DATA
;     frontend -> CORRECT_NES_PALETTE
;     title    -> TITLE_SCREEN_NES_PALETTE
; 1 = raw table everywhere:
;     gameplay/frontend/title -> NES_PALETTE_DATA
; 2 = corrected frontend table everywhere:
;     gameplay/frontend/title -> CORRECT_NES_PALETTE

PALETTE_EXPERIMENT_BASELINE      EQU 0
PALETTE_EXPERIMENT_RAW_ALL       EQU 1
PALETTE_EXPERIMENT_CORRECTED_ALL EQU 2

PALETTE_EXPERIMENT_PROFILE       EQU PALETTE_EXPERIMENT_BASELINE
