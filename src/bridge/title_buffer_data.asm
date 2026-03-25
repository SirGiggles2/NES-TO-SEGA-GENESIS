; title_buffer_data.asm
; NES Zelda title screen buffer (index $10) - 0x460 bytes
; This contains the complete PPU write sequence for the title nametable
; Extracted from NES ROM offset 0x01A879

; Structure: Series of PPU write commands
; Each command:   - PPU address (2 bytes, little-endian)
;   - Length byte +command(1 byte, typically 0x20 for 32 bytes)
;   - Data (32 bytes)
;   - Repeat
;   - Terminated with $FF

TITLE_BUFFER_DATA:
; Binary data embedded as byte table (1120 bytes)
INCBIN "src/bridge/title_buffer_bin.dat"
TITLE_BUFFER_END:
TITLE_BUFFER_SIZE EQU TITLE_BUFFER_END - TITLE_BUFFER_DATA
