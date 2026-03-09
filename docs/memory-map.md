# Engine Memory Map

Genesis RAM mirrors NES engine state.

---

# Engine State

| Variable | Address |
|--------|--------|
game mode | $FF0010
screen ready | $FF0011
script | $FF0012
subscript | $FF0013
ppu load index | $FF0014
frame counter | $FF0015

---

# PPU Mirrors

| Variable | Address |
|--------|--------|
ram_for_2001 | $FF00FE
ram_for_2000 | $FF00FF
scroll Y | $FF00FC
scroll X | $FF00FD

---

# PPU Buffer

| Variable | Address |
|--------|--------|
ppu_buf_status | $FF0300
ppu_buf_index | $FF0301
ppu_buf_data | $FF0302+

---

# Bridge Shadows

| Variable | Address |
|--------|--------|
PPUCTRL_SHADOW | $FFEF00
PPUMASK_SHADOW | $FFEF01
PPUSCROLL_X | $FFEF05
PPUSCROLL_Y | $FFEF06
VRAM_ADDR_CURR | $FFEF08
VDP_REG1_SHADOW | $FFEF0A