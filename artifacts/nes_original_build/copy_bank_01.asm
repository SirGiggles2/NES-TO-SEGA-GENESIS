.segment "BANK_01"
.include "copy_bank_ram.inc"
.include "copy_bank_val.inc"
.org $8000  ; for listing file
; 0x004010-0x00650F

; !! bzk .org control commands here
; take them into account when making
; changes inside this file



.export loc_0x0045E0_old_man_handler
.export loc_0x0046EB
.export loc_0x004A0C
.export loc_0x004A50
.export loc_0x004AC4
.export loc_0x004AE9
.export loc_0x004BB6
.export loc_0x004C6A
.export sub_0x004D10_copy_code_data_to_battery
.export loc_0x004D57_fill_ppu_with_tiles_2
.export loc_0x006028
.export sub_0x0060B8
.export loc_0x006131
.export sub_0x00614E
.export sub_0x00618C
.export loc_0x0061C1
.export sub_0x006233
.export loc_0x0062F2
.export loc_0x00632A
.export loc_0x00635A
.export loc_0x0063FE



tbl_8000_text_messages:
; see con_msg
    .word _off001_804C_00   ; IT'S DANGEROUS TO GO ALONE! TAKE THIS.
    .word _off001_8077_01   ; MASTER USING IT AND YOU CAN HAVE THIS.
    .word _off001_80A1_02   ; TAKE ANY ONE YOU WANT.
    .word _off001_80B9_03   ; SECRET IS IN THE TREE AT THE DEAD-END.
    .word _off001_80E3_04   ; LET'S PLAY MONEY MAKING GAME.
    .word _off001_8105_05   ; PAY ME FOR THE DOOR REPAIR CHARGE.
    .word _off001_812D_06   ; SHOW THIS TO THE OLD WOMAN.
    .word _off001_8152_07   ; MEET THE OLD MAN AT THE GRAVE.
    .word _off001_8179_08   ; BUY MEDICINE BEFORE YOU GO.
    .word _off001_8197_09   ; PAY ME AND I'LL TALK.
    .word _off001_81AE_0A   ; THIS AIN'T ENOUGH TO TALK.
    .word _off001_81D2_0B   ; GO UP,UP, THE MOUNTAIN AHEAD.
    .word _off001_81F8_0C   ; GO NORTH,WEST,SOUTH,WEST TO THE FOREST OF MAZE.
    .word _off001_822C_0D   ; BOY, YOU'RE RICH!
    .word _off001_8241_0E   ; BUY SOMETHIN' WILL YA!
    .word _off001_8258_0F   ; BOY, THIS IS REALLY EXPENSIVE!
    .word _off001_827D_10   ; TAKE ANY ONE YOU WANT. (10)
    .word _off001_8294_11   ; IT'S A SECRET TO EVERYBODY.
    .word _off001_82B8_12   ; GRUMBLE,GRUMBLE...
    .word _off001_82CD_13   ; EASTMOST PENNINSULA IS THE SECRET.
    .word _off001_82F5_14   ; DODONGO DISLIKES SMOKE.
    .word _off001_830D_15   ; DID YOU GET THE SWORD FROM THE OLD MAN ON TOP OF THE WATERFALL?
    .word _off001_834D_16   ; WALK INTO THE WATERFALL.
    .word _off001_8370_17   ; SECRET POWER IS SAID TO BE IN THE ARROW.
    .word _off001_839C_18   ; DIGDOGGER HATES CERTAIN KIND OF SOUND.
    .word _off001_83C6_19   ; I BET YOU'D LIKE TO HAVE MORE BOMBS.
    .word _off001_83F0_1A   ; IF YOU GO IN THE DIRECTION OF THE ARROW.
    .word _off001_841C_1B   ; LEAVE YOUR LIFE OR MONEY.
    .word _off001_843F_1C   ; THERE ARE SECRETS WHERE FAIRIES DON'T LIVE.
    .word _off001_846D_1D   ; AIM AT THE EYES OF GOHMA.
    .word _off001_8490_1E   ; SOUTH OF ARROW MARK HIDES A SECRET.
    .word _off001_84B8_1F   ; THERE'S A SECRET IN THE TIP OF THE NOSE.
    .word _off001_84E3_20   ; SPECTACLE ROCK IS AN ENTRANCE TO DEATH. (20)
    .word _off001_850E_21   ; 10TH ENEMY HAS THE BOMB.
    .word _off001_8526_22   ; ONES WHO DOES NOT HAVE TRIFORCE CAN'T GO IN.
    .word _off001_8553_23   ; PATRA HAS THE MAP.
    .word _off001_8568_24   ; GO TO THE NEXT ROOM.
    .word _off001_857E_25   ; EYES OF SKULL HAS A SECRET.



con_new_line_1                          = $80 ; 
con_new_line_2                          = $40 ; 
con_message_end                         = $C0 ; 



_off001_804C_00:
; con_msg_00
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $12, $1D, $2A, $1C, $24, $0D, $0A, $17, $10, $0E, $1B, $18, $1E, $1C, $24, $1D, $18, $24, $10, $18 + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $0A, $15, $18, $17, $0E, $29, $24, $1D, $0A, $14, $0E, $24, $1D, $11, $12, $1C, $2C + con_message_end   ; 



_off001_8077_01:
; con_msg_01
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $16, $0A, $1C, $1D, $0E, $1B, $24, $1E, $1C, $12, $17, $10, $24, $12, $1D, $24, $0A, $17, $0D + con_new_line_1   ; 
    .byte $25, $25, $25, $22, $18, $1E, $24, $0C, $0A, $17, $24, $11, $0A, $1F, $0E, $24, $1D, $11, $12, $1C, $2C + con_message_end   ; 



_off001_80A1_02:
; con_msg_02
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $1D, $0A, $14, $0E, $24, $0A, $17, $22, $24, $1B, $18, $0A, $0D, $24, $22, $18, $1E, $24, $20, $0A, $17, $1D, $2C + con_message_end   ; 



_off001_80B9_03:
; con_msg_03
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $1C, $0E, $0C, $1B, $0E, $1D, $24, $12, $1C, $24, $12, $17, $24, $1D, $11, $0E, $24, $1D, $1B, $0E, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $0A, $1D, $24, $1D, $11, $0E, $24, $0D, $0E, $0A, $0D, $2F, $0E, $17, $0D, $2C + con_message_end   ; 



_off001_80E3_04:
; con_msg_04
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $15, $0E, $1D, $2A, $1C, $24, $19, $15, $0A, $22, $24, $16, $18, $17, $0E, $22 + con_new_line_1   ; 
    .byte $25, $25, $25, $16, $0A, $14, $12, $17, $10, $24, $10, $0A, $16, $0E, $2C + con_message_end   ; 



_off001_8105_05:
; con_msg_05
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $19, $0A, $22, $24, $16, $0E, $24, $0F, $18, $1B, $24, $1D, $11, $0E, $24, $0D, $18, $18, $1B + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $1B, $0E, $19, $0A, $12, $1B, $24, $0C, $11, $0A, $1B, $10, $0E, $2C + con_message_end   ; 



_off001_812D_06:
; con_msg_06
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $1C, $11, $18, $20, $24, $1D, $11, $12, $1C, $24, $1D, $18, $24, $1D, $11, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $25, $18, $15, $0D, $24, $20, $18, $16, $0A, $17, $2C + con_message_end   ; 



_off001_8152_07:
; con_msg_07
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $16, $0E, $0E, $1D, $24, $1D, $11, $0E, $24, $18, $15, $0D, $24, $16, $0A, $17 + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $0A, $1D, $24, $1D, $11, $0E, $24, $10, $1B, $0A, $1F, $0E, $2C + con_message_end   ; 



_off001_8179_08:
; con_msg_08
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $0B, $1E, $22, $24, $16, $0E, $0D, $12, $0C, $12, $17, $0E, $24, $0B, $0E, $0F, $18, $1B, $0E + con_new_line_1   ; 
    .byte $25, $25, $22, $18, $1E, $24, $10, $18, $2C + con_message_end   ; 



_off001_8197_09:
; con_msg_09
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $19, $0A, $22, $24, $16, $0E, $24, $0A, $17, $0D, $24, $12, $2A, $15, $15, $24, $1D, $0A, $15, $14, $2C + con_message_end   ; 



_off001_81AE_0A:
; con_msg_0A
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $1D, $11, $12, $1C, $24, $0A, $12, $17, $2A, $1D, $24, $0E, $17, $18, $1E, $10, $11 + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $25, $25, $1D, $18, $24, $1D, $0A, $15, $14, $2C + con_message_end   ; 



_off001_81D2_0B:
; con_msg_0B
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $25, $25, $25, $10, $18, $24, $1E, $19, $28, $1E, $19, $28 + con_new_line_1   ; 
    .byte $25, $25, $25, $1D, $11, $0E, $24, $16, $18, $1E, $17, $1D, $0A, $12, $17, $24, $0A, $11, $0E, $0A, $0D, $2C + con_message_end   ; 



_off001_81F8_0C:
; con_msg_0C
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $10, $18, $24, $17, $18, $1B, $1D, $11, $28, $20, $0E, $1C, $1D, $28, $1C, $18, $1E, $1D, $11, $28 + con_new_line_1   ; 
    .byte $25, $25, $20, $0E, $1C, $1D, $24, $1D, $18, $24, $1D, $11, $0E, $24, $0F, $18, $1B, $0E, $1C, $1D + con_new_line_2   ; 
    .byte $24, $24, $18, $0F, $24, $16, $0A, $23, $0E, $2C + con_message_end   ; 



_off001_822C_0D:
; con_msg_0D
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $0B, $18, $22, $28, $24, $22, $18, $1E, $2A, $1B, $0E, $24, $1B, $12, $0C, $11, $29 + con_message_end   ; 



_off001_8241_0E:
; con_msg_0E
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $0B, $1E, $22, $24, $1C, $18, $16, $0E, $1D, $11, $12, $17, $2A, $24, $20, $12, $15, $15, $24, $22, $0A, $29 + con_message_end   ; 



_off001_8258_0F:
; con_msg_0F
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $25, $0B, $18, $22, $28, $24, $1D, $11, $12, $1C, $24, $12, $1C + con_new_line_1   ; 
    .byte $25, $25, $25, $1B, $0E, $0A, $15, $15, $22, $24, $0E, $21, $19, $0E, $17, $1C, $12, $1F, $0E, $29 + con_message_end   ; 



_off001_827D_10:
; con_msg_10
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $1D, $0A, $14, $0E, $24, $0A, $17, $22, $24, $18, $17, $0E, $24, $22, $18, $1E, $24, $20, $0A, $17, $1D, $2C + con_message_end   ; 



_off001_8294_11:
; con_msg_11
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $25, $12, $1D, $2A, $1C, $24, $0A, $24, $1C, $0E, $0C, $1B, $0E, $1D + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $1D, $18, $24, $0E, $1F, $0E, $1B, $22, $0B, $18, $0D, $22, $2C + con_message_end   ; 



_off001_82B8_12:
; con_msg_12
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $10, $1B, $1E, $16, $0B, $15, $0E, $28, $10, $1B, $1E, $16, $0B, $15, $0E, $2C, $2C, $2C + con_message_end   ; 



_off001_82CD_13:
; con_msg_13
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $0E, $0A, $1C, $1D, $16, $18, $1C, $1D, $24, $19, $0E, $17, $17, $12, $17, $1C, $1E, $15, $0A + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $12, $1C, $24, $1D, $11, $0E, $24, $1C, $0E, $0C, $1B, $0E, $1D, $2C + con_message_end   ; 



_off001_82F5_14:
; con_msg_14
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $0D, $18, $0D, $18, $17, $10, $18, $24, $0D, $12, $1C, $15, $12, $14, $0E, $1C, $24, $1C, $16, $18, $14, $0E, $2C + con_message_end   ; 



_off001_830D_15:
; con_msg_15
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $0D, $12, $0D, $24, $22, $18, $1E, $24, $10, $0E, $1D, $24, $1D, $11, $0E, $24, $1C, $20, $18, $1B, $0D + con_new_line_1   ; 
    .byte $25, $0F, $1B, $18, $16, $24, $1D, $11, $0E, $24, $18, $15, $0D, $24, $16, $0A, $17, $24, $18, $17 + con_new_line_2   ; 
    .byte $25, $1D, $18, $19, $24, $18, $0F, $24, $1D, $11, $0E, $24, $20, $0A, $1D, $0E, $1B, $0F, $0A, $15, $15, $2E + con_message_end   ; 



_off001_834D_16:
; con_msg_16
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $25, $20, $0A, $15, $14, $24, $12, $17, $1D, $18, $24, $1D, $11, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $25, $20, $0A, $1D, $0E, $1B, $0F, $0A, $15, $15, $2C + con_message_end   ; 



_off001_8370_17:
; con_msg_17
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $1C, $0E, $0C, $1B, $0E, $1D, $24, $19, $18, $20, $0E, $1B, $24, $12, $1C, $24, $1C, $0A, $12, $0D + con_new_line_1   ; 
    .byte $25, $25, $25, $1D, $18, $24, $0B, $0E, $24, $12, $17, $24, $1D, $11, $0E, $24, $0A, $1B, $1B, $18, $20, $2C + con_message_end   ; 



_off001_839C_18:
; con_msg_18
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $0D, $12, $10, $0D, $18, $10, $10, $0E, $1B, $24, $11, $0A, $1D, $0E, $1C + con_new_line_1   ; 
    .byte $25, $0C, $0E, $1B, $1D, $0A, $12, $17, $24, $14, $12, $17, $0D, $24, $18, $0F, $24, $1C, $18, $1E, $17, $0D, $2C + con_message_end   ; 



_off001_83C6_19:
; con_msg_19
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $12, $24, $0B, $0E, $1D, $24, $22, $18, $1E, $2A, $0D, $24, $15, $12, $14, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $1D, $18, $24, $11, $0A, $1F, $0E, $24, $16, $18, $1B, $0E, $24, $0B, $18, $16, $0B, $1C, $2C + con_message_end   ; 



_off001_83F0_1A:
; con_msg_1A
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $12, $0F, $24, $22, $18, $1E, $24, $10, $18, $24, $12, $17, $24, $1D, $11, $0E + con_new_line_1   ; 
    .byte $25, $0D, $12, $1B, $0E, $0C, $1D, $12, $18, $17, $24, $18, $0F, $24, $1D, $11, $0E, $24, $0A, $1B, $1B, $18, $20, $2C + con_message_end   ; 



_off001_841C_1B:
; con_msg_1B
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $15, $0E, $0A, $1F, $0E, $24, $22, $18, $1E, $1B, $24, $15, $12, $0F, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $25, $18, $1B, $24, $16, $18, $17, $0E, $22, $2C + con_message_end   ; 



_off001_843F_1C:
; con_msg_1C
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $1D, $11, $0E, $1B, $0E, $24, $0A, $1B, $0E, $24, $1C, $0E, $0C, $1B, $0E, $1D, $1C, $24, $20, $11, $0E, $1B, $0E + con_new_line_1   ; 
    .byte $25, $25, $25, $0F, $0A, $12, $1B, $12, $0E, $1C, $24, $0D, $18, $17, $2A, $1D, $24, $15, $12, $1F, $0E, $2C + con_message_end   ; 



_off001_846D_1D:
; con_msg_1D
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $0A, $12, $16, $24, $0A, $1D, $24, $1D, $11, $0E, $24, $0E, $22, $0E, $1C + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $25, $25, $18, $0F, $24, $10, $18, $11, $16, $0A, $2C + con_message_end   ; 



_off001_8490_1E:
; con_msg_1E
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $1C, $18, $1E, $1D, $11, $24, $18, $0F, $24, $0A, $1B, $1B, $18, $20, $24, $16, $0A, $1B, $14 + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $11, $12, $0D, $0E, $1C, $24, $0A, $24, $1C, $0E, $0C, $1B, $0E, $1D, $2C + con_message_end   ; 



_off001_84B8_1F:
; con_msg_1F
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $1D, $11, $0E, $1B, $0E, $2A, $1C, $24, $0A, $24, $1C, $0E, $0C, $1B, $0E, $1D, $24, $12, $17 + con_new_line_1   ; 
    .byte $25, $25, $1D, $11, $0E, $24, $1D, $12, $19, $24, $18, $0F, $24, $1D, $11, $0E, $24, $17, $18, $1C, $0E, $2C + con_message_end   ; 



_off001_84E3_20:
; con_msg_20
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $1C, $19, $0E, $0C, $1D, $0A, $0C, $15, $0E, $24, $1B, $18, $0C, $14, $24, $12, $1C + con_new_line_1   ; 
    .byte $25, $25, $0A, $17, $24, $0E, $17, $1D, $1B, $0A, $17, $0C, $0E, $24, $1D, $18, $24, $0D, $0E, $0A, $1D, $11, $2C + con_message_end   ; 



_off001_850E_21:
; con_msg_21
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $01, $00, $1D, $11, $24, $0E, $17, $0E, $16, $22, $24, $11, $0A, $1C, $24, $1D, $11, $0E, $24, $0B, $18, $16, $0B, $2C + con_message_end   ; 



_off001_8526_22:
; con_msg_22
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $18, $17, $0E, $1C, $24, $20, $11, $18, $24, $0D, $18, $0E, $1C, $24, $17, $18, $1D, $24, $11, $0A, $1F, $0E + con_new_line_1   ; 
    .byte $25, $1D, $1B, $12, $0F, $18, $1B, $0C, $0E, $24, $0C, $0A, $17, $2A, $1D, $24, $10, $18, $24, $12, $17, $2C + con_message_end   ; 



_off001_8553_23:
; con_msg_23
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $19, $0A, $1D, $1B, $0A, $24, $11, $0A, $1C, $24, $1D, $11, $0E, $24, $16, $0A, $19, $2C + con_message_end   ; 



_off001_8568_24:
; con_msg_24
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $10, $18, $24, $1D, $18, $24, $1D, $11, $0E, $24, $17, $0E, $21, $1D, $24, $1B, $18, $18, $16, $2C + con_message_end   ; 



_off001_857E_25:
; con_msg_25
;                                              04   05   06   07   08   09   0A   0B   0C   0D   0E   0F   10   11   12   13   14   15   16   17   18   19   1A   1B
    .byte $25, $25, $25, $25, $25, $0E, $22, $0E, $1C, $24, $18, $0F, $24, $1C, $14, $1E, $15, $15 + con_new_line_1   ; 
    .byte $25, $25, $25, $25, $25, $11, $0A, $1C, $24, $0A, $24, $1C, $0E, $0C, $1B, $0E, $1D, $2C + con_message_end   ; 



tbl_85A2:
; ??? + message id
    .byte $40 + con_msg_00   ; 6A 
    .byte $40 + con_msg_20   ; 6B 
    .byte $40 + con_msg_02   ; 6C 
    .byte $40 + con_msg_02   ; 6D 
    .byte $00 + con_msg_04   ; 6E 
    .byte $00 + con_msg_06   ; 6F 
    .byte $40 + con_msg_08   ; 70 
    .byte $00 + con_msg_0A   ; 71 
    .byte $40 + con_msg_0C   ; 72 
    .byte $00 + con_msg_0E   ; 73 
    .byte $C0 + con_msg_10   ; 74 
    .byte $C0 + con_msg_12   ; 75 
    .byte $C0 + con_msg_12   ; 76 
    .byte $C0 + con_msg_1C   ; 77 
    .byte $C0 + con_msg_1C   ; 78 
    .byte $C0 + con_msg_1E   ; 79 
    .byte $C0 + con_msg_1E   ; 7A 
    .byte $40 + con_msg_22   ; 7B 
    .byte $40 + con_msg_22   ; 7C 
    .byte $40 + con_msg_22   ; 7D 



tbl_85B6:
    .byte $0A   ; 00 
    .byte $28   ; 01 



tbl_85B8:
; offset via 0x0045DA
; 02
    .byte $00   ; unused
    .byte $01   ; unused
    .byte $02   ; unused
; 05
    .byte $01   ; 
    .byte $02   ; 
    .byte $00   ; 
; 08
    .byte $02   ; 
    .byte $00   ; 
    .byte $01   ; 
; 0B
    .byte $00   ; 
    .byte $02   ; 
    .byte $01   ; 
; 0E
    .byte $02   ; 
    .byte $01   ; 
    .byte $00   ; 
; 11
    .byte $01   ; 
    .byte $00   ; 
    .byte $02   ; 



tbl_85CA_offset:
    .byte $02   ; 00 
    .byte $05   ; 01 
    .byte $08   ; 02 
    .byte $0B   ; 03 
    .byte $0E   ; 04 
    .byte $11   ; 05 



loc_0x0045E0_old_man_handler:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    LDA ram_obj_id_enemy
    CMP #con_obj_id_72
    BEQ bra_85EA
    CMP #con_obj_id_71
    BEQ bra_85EA
    CMP #$7B
    BCS bra_85EA    ; if 7B+
    CMP #$6E
    BCS bra_85F9    ; if 6E, 70, 73-7A
bra_85EA:
; 00-6D, 71, 72
    JSR sub_bat_7314_check_map_bit4
    BEQ bra_85F9
    LDA #con_obj_id_null
    STA ram_obj_id_enemy
sub_85F4_unfreeze_link:
    LDA #con_obj_state_00
    STA ram_state_link
    RTS
bra_85F9:
    LDA ram_obj_id_enemy
    SEC
    SBC #$6A
    TAY
    LDA tbl_85A2,Y
    PHA
    AND #$3F
    STA ram_message
    PLA
    AND #$C0
    STA ram_0003_t02
    LDA #$FD
bra_8610_loop:
    CLC
    ADC #$03
    DEY
    BPL bra_8610_loop
    TAY
    LDX #$00
bra_8619_loop:
    LDA ram_6A7E_map_data,Y
    STA ram_0422,X
    AND #$C0
    STA ram_0000_t3A,X
    LDA ram_6A7E_map_data + $3C,Y
    STA ram_042B_enemy + $04,X
    INY
    INX
    CPX #$03
    BNE bra_8619_loop
    LDA ram_0003_t02
    ASL
    ROL
    ROL
    ORA ram_0000_t3A
    STA ram_0000_t3A
    LDA ram_0000_t3A + $02
; / 10
    LSR
    LSR
    LSR
    LSR
    ORA ram_0000_t3A
    STA ram_0000_t3A
    LDA ram_0000_t3A + $01
; / 04
    LSR
    LSR
    ORA ram_0000_t3A
    STA ram_0413
    AND #$20
    BEQ bra_8697
    LDA #$FF
    LDY #$06
bra_8653_loop:
    CMP ram_indiv_random + $01
    BCC bra_865D
    SEC
    SBC #$2B
    DEY
    BNE bra_8653_loop
bra_865D:
    LDX tbl_85CA_offset,Y
    LDY #$02
bra_8662_loop:
    LDA tbl_85B8,X
    STA ram_046B_enemy + $01,Y
    DEX
    DEY
    BPL bra_8662_loop
    LDA ram_indiv_random + $02
    AND #$01
    TAY
    LDA tbl_85B6,Y
    STA ram_046B_enemy + $04
    LDA #$0A
    STA ram_046B_enemy + $05
    LDY #$14
    LDA ram_indiv_random + $02
    AND #$02
    BEQ bra_8686
    LDY #$32
bra_8686:
    STY ram_046B_enemy + $06
    LDX #$02
bra_868B_loop:
    LDY ram_046B_enemy + $01,X
    LDA ram_046B_enemy + $04,Y
    STA ram_0448,X
    DEX
    BPL bra_868B_loop
bra_8697:
    LDA #$00
    STA ram_0416
    LDA tbl_8812_ppu_lo + $02
    STA ram_045E_enemy + $01
    RTS



sub_86A3_spawn_old_man:
; bzk optimize, always A = 78 and Y = 80, write here instead
    STA ram_pos_X_enemy,X
    STY ram_pos_Y_enemy,X
    LDA #$00
    STA ram_hp_ememy - $01 - $01,X
    LDA #con_04C0_01 + con_04C0_80
    STA ram_attr_enemy - $01,X
    LDA #con_obj_state_freeze
    STA ram_state_link
    LDA #con_obj_id_40
    STA ram_obj_id_enemy + $01
    STA ram_obj_id_enemy + $02
    LDA #$48
    STA ram_pos_X_enemy + $01,X
    LDA #$A8
    STA ram_pos_X_enemy + $02,X
    STY ram_pos_Y_enemy + $01,X
    STY ram_pos_Y_enemy + $02,X
    RTS



tbl_86CA:
    .byte $22   ; 00 
    .byte $C8   ; 01 
    .byte $0D   ; 02 
    .byte $21   ; 03 
    .byte $24   ; 04 
    .byte $24   ; 05 
    .byte $24   ; 06 
    .byte $24   ; 07 
    .byte $24   ; 08 
    .byte $24   ; 09 
    .byte $24   ; 0A 
    .byte $24   ; 0B 
    .byte $24   ; 0C 
    .byte $24   ; 0D 
    .byte $24   ; 0E 
    .byte $24   ; 0F 
    .byte $FF   ; 10 



loc_0x0046EB:
    LDA ram_state_obj + $01
    CMP #$04
    BNE bra_86E7
    LDA ram_frm_cnt
    AND #$01
    BNE bra_871F
bra_86E7:
    JSR sub_8736
    LDA ram_obj_id_enemy
    CMP #con_obj_id_74
    BNE bra_871C
    LDA ram_item_letter
    CMP #$02
    BEQ bra_871C
    LDY ram_item_slot_index
    CPY #con_item_letter
    BNE bra_8705
    LDA ram_btn_press
    AND #con_btn_B
    BNE bra_870F
bra_8705:
    LDA ram_state_link
    CMP #con_obj_state_freeze
    BNE bra_870E_RTS
    JSR sub_85F4_unfreeze_link
bra_870E_RTS:
    RTS
bra_870F:
    LDA #con_sfx_2_secret_found
    STA ram_sfx_2
    INC ram_item_letter
    LDA #con_item_potion
    STA ram_item_slot_index
bra_871C:
    JSR sub_8749
bra_871F:
    LDA ram_state_obj + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_029_878B_00
    .word ofs_029_8815_01
    .word ofs_029_887A_02
    .word ofs_029_89F7_03
    .word ofs_029_8933_04
    .word ofs_029_8941_05
    .word ofs_029_89F7_06
    .word ofs_029_8815_07
    .word ofs_029_89F6_08_RTS



sub_8736:
    JSR sub_0x01FAA3
; A = 00
    LDY ram_obj_id_enemy
    CPY #$7B
    BCS bra_8743
    JMP loc_bat_77DB
bra_8743:
    JMP loc_bat_77DF



tbl_8746:
    .byte $58   ; 00 
    .byte $78   ; 01 
    .byte $98   ; 02 



sub_8749:
    LDA ram_0413
    AND #$04
    BEQ bra_8774
    LDA #$02
    STA ram_0421
bra_8755_loop:
    LDX ram_0421
    LDA tbl_8746,X
    STA ram_0083
    LDA #$98
    STA ram_0097
    LDA ram_0422,X
    AND #$3F
    CMP #$3F
    BEQ bra_876F
    LDX #$13
    JSR sub_0x01E71E
bra_876F:
    DEC ram_0421
    BPL bra_8755_loop
bra_8774:
    LDA ram_0413
    AND #$08
    BEQ bra_878A_RTS
    LDA #$30
    STA ram_0083
    LDA #$AB
    STA ram_0097
    LDA #con_drop_id_18
    LDX #$13
; bzk optimize, JMP
    JSR sub_0x01E71E
bra_878A_RTS:
    RTS



ofs_029_878B_00:
    LDA ram_0413
    AND #$08
    BEQ bra_87F4
sub_8792:
    JSR sub_8801
    LDA #$21
sub_8797:
    STA ram_0302_ppu_buffer + $03
    LDX #$00
    STX ram_042B_enemy + $02
    STX ram_042B_enemy + $03
bra_87A2_loop:
    LDA ram_042B_enemy + $04,X
    BNE bra_87B2
    LDX #$24
    STX ram_0001_t04_decimal
    STX ram_0001_t04_decimal + $01
    STX ram_0001_t04_decimal + $02
    JMP loc_87BF
bra_87B2:
    JSR sub_bat_6E55_convert_to_decimal
    LDX #$24
    LDA ram_0413
    ASL
    BCC bra_87BF
    LDX #$62
bra_87BF:
loc_87BF:
    STX ram_0004_t12
    LDY ram_042B_enemy + $03
    LDA ram_0001_t04_decimal + $01
    JSR sub_87F7
    STA ram_0302_ppu_buffer + $06,Y
    LDA ram_0001_t04_decimal
    JSR sub_87F7
    STA ram_0302_ppu_buffer + $05,Y
    LDA ram_0001_t04_decimal + $02
    STA ram_0302_ppu_buffer + $07,Y
    LDA ram_042B_enemy + $03
    CLC
    ADC #$04
    STA ram_042B_enemy + $03
    INC ram_042B_enemy + $02
    LDX ram_042B_enemy + $02
    CPX #$03
    BNE bra_87A2_loop
    LDA #$0A
    STA ram_timer_enemy + $01
    BNE bra_87F4    ; jmp
sub_87F2:   ; A = 1E
loc_87F2:   ; A = 1E 2A 76
    STA ram_ppu_load_index
bra_87F4:
; when you pick up a sword at the cave
    INC ram_state_obj + $01
    RTS



sub_87F7:
; in
    ; A = 
    ; ram_0004_t12
; out
    ; A = 
    ; ram_0004_t12
    CMP #$24
    BNE bra_8800_RTS
    TAX
    LDA ram_0004_t12
    STX ram_0004_t12
bra_8800_RTS:
    RTS



sub_8801:
    LDY #$10
bra_8803_loop:
    LDA tbl_86CA,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_8803_loop
    RTS



tbl_880D_ppu_data:
    .dbyt $21A4 ; ppu address
    .byte $01   ; counter
    .byte $24   ; 
    .byte $FF   ; close buffer



tbl_8812_ppu_lo:
    .byte $C4   ; 00 
    .byte $E4   ; 01 
    .byte $A4   ; 02 



ofs_029_8815_01:
ofs_029_8815_07:
ofs_026_8815_00:
    JSR sub_0x01F22B
; bzk optimize, code is similar to 0x00A9A8
    LDA ram_timer_enemy + $01
    BNE bra_8879_RTS
    LDA #$06
    STA ram_timer_enemy + $01
    LDY #$04
bra_8822_loop:
    LDA tbl_880D_ppu_data,Y
    STA ram_0302_ppu_buffer,Y
    DEY
    BPL bra_8822_loop
bra_882B_loop:
    LDA ram_045E_enemy + $01
    STA ram_0302_ppu_buffer + $01
    INC ram_045E_enemy + $01
    LDY ram_message
    LDA tbl_8000_text_messages,Y
    STA ram_0000_t02_text_messages_data
    INY
    LDA tbl_8000_text_messages,Y
    STA ram_0000_t02_text_messages_data + $01
    LDY ram_0416
    INC ram_0416
    LDA (ram_0000_t02_text_messages_data),Y
    AND #$3F
    CMP #$25    ; skip to next position control byte
; bzk optimize, is it necessary to update message pointers in a loop?
    BEQ bra_882B_loop
    STA ram_0302_ppu_buffer + $03
    LDA #con_sfx_4_rupee
    STA ram_sfx_4
    LDA (ram_0000_t02_text_messages_data),Y
    AND #$C0
    BEQ bra_8879_RTS
    LDY #$02
    CMP #$C0
    BEQ bra_886A    ; if message end
    DEY ; 01
    CMP #$40
    BEQ bra_886A    ; if new line 2
    DEY ; 00        ; if new line 1
bra_886A:
    LDA tbl_8812_ppu_lo,Y
    STA ram_045E_enemy + $01
    CPY #$02
    BNE bra_8879_RTS
    INC ram_state_obj + $01
    JSR sub_85F4_unfreeze_link
bra_8879_RTS:
    RTS



ofs_029_887A_02:
    LDA ram_0413
    LSR
    BCS bra_8898
    LDA #$08
    STA ram_state_obj + $01
    LDA ram_obj_id_enemy
    CMP #con_obj_id_71
    BNE bra_8897_RTS
    LDA ram_rupees_sbc
    CLC
    ADC #$14
    STA ram_rupees_sbc
; bzk optimize, JMP
    JSR sub_bat_730C_set_map_bit4
bra_8897_RTS:
    RTS
bra_8898:
    LDA ram_rupees_sbc
    BNE bra_8897_RTS
    LDX #$02
bra_889F_loop:
    LDA ram_0422,X
    AND #$3F
    CMP #$3F
    BEQ bra_88BB
    LDA ram_pos_X_link
    CMP tbl_8746,X
    BNE bra_88BB
    LDA ram_pos_Y_link
    SEC
    SBC #$98
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$06
    BCC bra_88BF
bra_88BB:
    DEX
    BPL bra_889F_loop
    RTS
bra_88BF:
    STX ram_0437_enemy + $01
    LDA ram_0413
    AND #$30
    BEQ bra_88E0
    AND #$10
    BEQ bra_88DB
    LDA ram_item_rupees
    CMP ram_042B_enemy + $04,X
    BCC bra_8932_RTS
    LDA ram_042B_enemy + $04,X
    JSR sub_89DE
bra_88DB:
    LDA #$05
    STA ram_state_obj + $01
    RTS
bra_88E0:
    LDA ram_0413
    AND #$02
    BEQ bra_88F5
    LDA ram_item_rupees
    CMP ram_042B_enemy + $04,X
    BCC bra_8932_RTS
    LDA ram_042B_enemy + $04,X
    JSR sub_89DE
bra_88F5:
    LDA ram_0413
    AND #$40
    BEQ bra_890F
    LDY #$40
    LDA ram_obj_id_enemy
    CMP #con_obj_id_6C
    BEQ bra_8907
    LDY #$B0
bra_8907:
    CPY ram_item_hearts
    BEQ bra_890F
    BCC bra_890F
    RTS
bra_890F:
    JSR sub_bat_730C_set_map_bit4
    LDA ram_0422,X
    AND #$3F
    PHA
    LDA #$FF
    STA ram_0422,X
    PLA
    JSR sub_bat_7370
    LDA #con_ppu_buf_1E
    JSR sub_87F2
    LDA #$40
    STA ram_timer_enemy + $01
sub_892A:
    LDA ram_0413
    AND #$F7
    STA ram_0413
bra_8932_RTS:
    RTS



ofs_029_8933_04:
    LDA ram_timer_enemy + $01
    BNE bra_893A_RTS
    STA ram_obj_id_enemy
bra_893A_RTS:
    RTS



tbl_893B:
    .byte $14   ; 
    .byte $14   ; 
    .byte $16   ; 
    .byte $14   ; 
    .byte $18   ; 
    .byte $1A   ; 



ofs_029_8941_05:
    LDA ram_0413
    AND #$10
    BEQ bra_8971
    LDA #$00
    LDY ram_obj_id_enemy
    CPY #con_obj_id_75
    BEQ bra_8953
    LDA #$03
bra_8953:
    CLC
    ADC ram_0437_enemy + $01
    TAY
    LDA tbl_893B,Y
    STA ram_0415
    LDA tbl_8812_ppu_lo + $02
    STA ram_045E_enemy + $01
    LDA #$00
    STA ram_0416
    JSR sub_892A
    LDA #con_ppu_buf_1E
    JMP loc_87F2
bra_8971:
    LDA ram_obj_id_enemy
    CMP #$7B
    BCC bra_8992
    JSR sub_8801
    LDA #$24
    JSR sub_8797
    LDA #con_sfx_4_pick_up_item
    STA ram_sfx_4
    JSR sub_bat_730C_set_map_bit4
    LDA #$08
    STA ram_state_obj + $01
    LDA ram_042B_enemy + $05
    JMP loc_89D6
bra_8992:
    LDA ram_item_rupees
    CMP #$0A
    BCC bra_893A_RTS
    LDA #con_sfx_4_pick_up_item
    STA ram_sfx_4
    LDY #$02
bra_89A0_loop:
    LDA ram_0448,Y
    STA ram_042B_enemy + $04,Y
    DEY
    BPL bra_89A0_loop
    JSR sub_8792
    LDA #$08
    STA ram_state_obj + $01
    LDY #$01
    LDA ram_0448
    JSR sub_89E6
    LDY #$05
    LDA ram_0449
    JSR sub_89E6
    LDY #$09
    LDA ram_044A
    JSR sub_89E6
    LDX ram_0437_enemy + $01
    LDA ram_0448,X
    CMP #$14
    BEQ bra_89D6
    CMP #$32
    BNE bra_89DE
bra_89D6:
loc_89D6:
    CLC
    ADC ram_rupees_adc
    STA ram_rupees_adc
    RTS
bra_89DE:
sub_89DE:
    CLC
    ADC ram_rupees_sbc
    STA ram_rupees_sbc
    RTS



sub_89E6:
    LDX #$64
    CMP #$14
    BEQ bra_89F2
    CMP #$32
    BEQ bra_89F2
    LDX #$62
bra_89F2:
    TXA
    STA ram_0302_ppu_buffer + $04,Y
ofs_029_89F6_08_RTS:
    RTS



ofs_029_89F7_03:
ofs_029_89F7_06:
ofs_026_89F7_02:
    LDA #con_ppu_buf_2A
    JMP loc_87F2



loc_0x004A0C:
    LDA tbl_8812_ppu_lo + $02
    STA ram_045E_enemy + $01
    LDA ram_dungeon_level
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_025_8CAD_00_RTS
    .word ofs_025_8A23_01
    .word ofs_025_8A23_02
    .word ofs_025_8A69_03
    .word ofs_025_8A69_04
    .word ofs_025_8A23_05
    .word ofs_025_8A69_06
    .word ofs_025_8A23_07
    .word ofs_025_8A69_08
    .word ofs_025_8A84_09



tbl_8A1B:
    .byte $28   ; 4B
    .byte $26   ; 4E
    .byte $2E   ; 4F
    .byte $30   ; 50
    .byte $32   ; 51
    .byte $3E   ; 52
    .byte $3E   ; 53
    .byte $34   ; 54



ofs_025_8A23_01:
ofs_025_8A23_02:
ofs_025_8A23_05:
ofs_025_8A23_07:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    LDA ram_obj_id_enemy - $01,X
    SEC
    SBC #$4B
    TAY
    LDA tbl_8A1B,Y
    STA ram_0415
    LDA ram_obj_id_enemy
    CMP #con_obj_id_4F
    BNE bra_8A5E
    BEQ bra_8A52    ; jmp



loc_0x004A50:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    LDA #$36
    STA ram_0415
    LDA tbl_8812_ppu_lo + $02
    STA ram_045E_enemy + $01
bra_8A52:
    JSR sub_bat_7314_check_map_bit4
    BEQ bra_8A5E
    LDA #con_obj_state_00
    STA ram_state_link
    JMP loc_0x01FEC1_destroy_object
bra_8A5E:
    JMP loc_8AD3



tbl_8A61:
    .byte $2A   ; 4B
    .byte $38   ; 4E
    .byte $3A   ; 4F
    .byte $2C   ; 50
    .byte $40   ; 51
    .byte $42   ; 52
    .byte $42   ; 53
    .byte $3C   ; 54



ofs_025_8A69_03:
ofs_025_8A69_04:
ofs_025_8A69_06:
ofs_025_8A69_08:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    LDA ram_obj_id_enemy - $01,X
    SEC
    SBC #$4B
    TAY
    LDA tbl_8A61,Y
    STA ram_0415
    JMP loc_8AD3



tbl_8A80:
    .byte $44   ; 4B
    .byte $46   ; 4E
    .byte $48   ; 4F
    .byte $4A   ; 50



ofs_025_8A84_09:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    JSR sub_8AD3
    LDA ram_obj_id_enemy - $01,X
    PHA
    SEC
    SBC #$4B
    TAY
    LDA tbl_8A80,Y
    STA ram_0415
    PLA
    CMP #$4B
    BNE bra_8AB3_RTS
    LDA ram_item_triforce_pieces
    CMP #$FF
    BNE bra_8AB3_RTS
    LDA #$01
    STA ram_04CE_flag
    LSR ; -> 00 con_obj_state_00
    STA ram_state_link
; bzk optimize, JMP
    JSR sub_0x01FEC1_destroy_object
bra_8AB3_RTS:
    RTS



loc_0x004AC4:
    LDA #$78    ; pos X
    LDY #$80    ; pos Y
    JSR sub_86A3_spawn_old_man
    LDA #$24
    STA ram_0415
    LDA tbl_8812_ppu_lo + $02
    STA ram_045E_enemy + $01
    JSR sub_bat_7314_check_map_bit4
    BEQ bra_8AD3
    LDA #$00    ; con_obj_id_null   con_obj_state_00
    STA ram_state_link
    STA ram_obj_id_enemy
    RTS
bra_8AD3:
loc_8AD3:
sub_8AD3:
    LDA #con_sfx_2_pick_up_item
    STA ram_sfx_2
    RTS



loc_0x004AE9:
    LDA ram_dungeon_level
    CMP #$03
    BCC bra_8AE7
    CMP #$05
    BEQ bra_8AE7
    CMP #$07
    BNE bra_8AEA_07
bra_8AE7:
    JMP loc_8B11
bra_8AEA_07:
    JSR sub_8B9D
    LDA ram_state_obj + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_029_8AF8_00
    .word ofs_029_8815_01
    .word ofs_029_8AFF_02_RTS



ofs_029_8AF8_00:
    LDA #$00
    STA ram_0416
    INC ram_state_obj + $01
ofs_029_8AFF_02_RTS:
    RTS



sub_8B00:
    JSR sub_bat_79D0
    LDA ram_0405_enemy + $01
    BEQ bra_8B10_RTS
    STA ram_04CC_flag
    LDA #$00
    STA ram_0405_enemy + $01
bra_8B10_RTS:
    RTS



loc_8B11:
    LDA ram_state_obj + $01
    CMP #$04
    BNE bra_8B1D
    LDA ram_frm_cnt
    AND #$01
    BNE bra_8B36
bra_8B1D:
    JSR sub_8B9D
    LDA ram_obj_id_enemy
    CMP #con_obj_id_4F
    BNE bra_8B36
    LDA #$78
    STA ram_0083
    LDA #$98
    STA ram_0097
    LDA #con_drop_id_18
    LDX #$13
    JSR sub_0x01E71E
bra_8B36:
    LDA ram_state_obj + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_029_8B45_00
    .word ofs_029_8815_01
    .word ofs_029_8B57_02_buy_max_bombs_upgrade
    .word ofs_029_89F7_03
    .word ofs_029_8B95_04



ofs_029_8B45_00:
    LDA ram_obj_id_enemy
    CMP #con_obj_id_4F
    BNE bra_8B50
    LDA #con_ppu_buf_6C
    STA ram_ppu_load_index
bra_8B50:
    LDA #$0A
    STA ram_timer_enemy + $01
    INC ram_state_obj + $01
    RTS



ofs_029_8B57_02_buy_max_bombs_upgrade:
    LDA ram_obj_id_enemy
    CMP #con_obj_id_4F
    BNE bra_8B70_RTS
    LDA ram_pos_X_link
    CMP #$78
    BNE bra_8B70_RTS
    LDA ram_pos_Y_link
    SEC
    SBC #$98
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$06
    BCC bra_8B71
bra_8B70_RTS:
    RTS
bra_8B71:
    LDA #$64
    CMP ram_item_rupees
    BEQ bra_8B7A
    BCS bra_8B70_RTS
bra_8B7A:
; if enough rupees to spend
    CLC
    ADC ram_rupees_sbc
    STA ram_rupees_sbc
    LDA #con_sfx_4_pick_up_item
    STA ram_sfx_4
    LDA ram_item_max_bombs
    CLC
    ADC #$04
    STA ram_item_max_bombs
    STA ram_item_bombs
    JMP loc_8C8D



ofs_029_8B95_04:
    LDA ram_timer_enemy + $01
    BNE bra_8B9C_RTS
    STA ram_obj_id_enemy
bra_8B9C_RTS:
    RTS



sub_8B9D:
    JSR sub_8B00
    JSR sub_0x01FAA3
; A = 00
    JMP loc_bat_77DB



loc_0x004BB6:
    LDA ram_state_obj + $01
    CMP #$04
    BNE bra_8BB2
    LDA ram_frm_cnt
    AND #$01
    BNE bra_8BB8
bra_8BB2:
    JSR sub_8B9D
    JSR sub_8BCB
bra_8BB8:
    LDA ram_state_obj + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_029_8BE6_00
    .word ofs_029_8815_01
    .word ofs_029_8BEF_02
    .word ofs_029_89F7_03
    .word ofs_029_8B95_04



tbl_8BC7:
    .byte $58   ; 00 
    .byte $98   ; 01 



tbl_8BC9_drop_id:
    .byte con_drop_id_1A   ; 00 
    .byte con_drop_id_18   ; 01 



sub_8BCB:
    LDX #$01
bra_8BCD_loop:
    TXA
    PHA
    LDA tbl_8BC7,X
    STA ram_0083
    LDA #$98
    STA ram_0097
    LDA tbl_8BC9_drop_id,X
    LDX #$13
    JSR sub_0x01E71E
    PLA
    TAX
    DEX
    BPL bra_8BCD_loop
    RTS



ofs_029_8BE6_00:
    LDA #$0A
    STA ram_timer_enemy + $01
    LDA #con_ppu_buf_76
    JMP loc_87F2



ofs_029_8BEF_02:
    LDX #$01
bra_8BF1_loop:
    LDA ram_pos_X_link
    CMP tbl_8BC7,X
    BNE bra_8C04
    LDA ram_pos_Y_link
    SEC
    SBC #$98
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$06
    BCC bra_8C08
bra_8C04:
    DEX
    BPL bra_8BF1_loop
bra_8C07_RTS:
    RTS
bra_8C08:
    CPX #$00
    BEQ bra_8C1F
    LDA #$32
    CMP ram_item_rupees
    BEQ bra_8C15
    BCS bra_8C07_RTS
bra_8C15:
    CLC
    ADC ram_rupees_sbc
    STA ram_rupees_sbc
    JMP loc_8C4D
bra_8C1F:
    LDA ram_item_hearts
    AND #$F0
    CMP #$30
    BCS bra_8C33
    STA ram_item_hearts
    LDA #$00
    STA ram_item_hearts + $01
    JMP loc_8C4D
bra_8C33:
    LDA ram_item_hearts
    PHA
    AND #$F0
    SEC
    SBC #$10
    STA ram_0000_t3B
    PLA
    AND #$0F
    SEC
    SBC #$01
    BPL bra_8C48
    LDA #$00
bra_8C48:
    ORA ram_0000_t3B
    STA ram_item_hearts
loc_8C4D:
    LDA #con_sfx_4_pick_up_item
    STA ram_sfx_4
    LDA #$01
    STA ram_04CE_flag
    JMP loc_8C8D



loc_0x004C6A:
    LDA ram_state_obj + $01
    CMP #$03
    BNE bra_8C66
    LDA ram_frm_cnt
    AND #$01
    BNE bra_8C6F
bra_8C66:
    JSR sub_8B00
    JSR sub_0x01FAA3
; A = 00
    JSR sub_bat_77DF
bra_8C6F:
    LDA ram_state_obj + $01
    JSR sub_0x01E5F2_jump_to_pointers_after_JSR
    .word ofs_026_8815_00
    .word ofs_026_8C7C_01
    .word ofs_026_89F7_02
    .word ofs_026_8C99_03



ofs_026_8C7C_01:
    LDY #$0F
    LDA ram_state_obj,Y
    ASL
    BCC bra_8CAD_RTS
    LDA #con_obj_state_freeze
    STA ram_state_link
    LDA #con_sfx_2_secret_found
    STA ram_sfx_2
loc_8C8D:
    JSR sub_bat_730C_set_map_bit4
    LDA #$40
    STA ram_timer_enemy + $01
    LDA #con_ppu_buf_1E
    JMP loc_87F2



ofs_026_8C99_03:
    JSR sub_0x01F233
    LDA ram_timer_enemy + $01
    BNE bra_8CAD_RTS
; A = 00
    LDY #$0F
    STA ram_state_obj,Y   ; con_obj_state_00
    STA ram_item_meat
    STA ram_state_link
    STA ram_obj_id_enemy
bra_8CAD_RTS:
ofs_025_8CAD_00_RTS:
    RTS


; bzk garbage
    .byte $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



sub_0x004D10_copy_code_data_to_battery:
    LDA #< ofs_A500_bank_s2_asm_export
    STA ram_0000_t04_asm_export_data_1
    LDA #> ofs_A500_bank_s2_asm_export
    STA ram_0000_t04_asm_export_data_1 + $01
    LDA #< ofs_bat_6C90_bank_s2_asm_import
    STA ram_0002_t01_asm_export_data_2
    LDA #> ofs_bat_6C90_bank_s2_asm_import
    STA ram_0002_t01_asm_export_data_2 + $01
    LDY #$00
bra_8D12_loop:
    LDA (ram_0000_t04_asm_export_data_1),Y
    STA (ram_0002_t01_asm_export_data_2),Y
    LDA ram_0000_t04_asm_export_data_1
    CLC
    ADC #< $0001
    STA ram_0000_t04_asm_export_data_1
    LDA ram_0000_t04_asm_export_data_1 + $01
    ADC #> $0001
    STA ram_0000_t04_asm_export_data_1 + $01
    LDA ram_0002_t01_asm_export_data_2
    CLC
    ADC #< $0001
    STA ram_0002_t01_asm_export_data_2
    LDA ram_0002_t01_asm_export_data_2 + $01
    ADC #> $0001
    STA ram_0002_t01_asm_export_data_2 + $01
    CMP #> $7F00
    BNE bra_8D12_loop
    LDA ram_0002_t01_asm_export_data_2
; bzk optimize, useless CMP 00
    CMP #< $7F00
    BNE bra_8D12_loop
    RTS



tbl_8D3B_tiles:
    .word tbl_8DB4___0700_0FFF
    .word tbl_96B4___1700_1F1F



tbl_8D3F_counter:
    .dbyt $0900 ; 900 bytes
    .dbyt $0820 ; 820 bytes



tbl_8D43_ppu:
    .dbyt $0700 ; 0700-0FFF
    .dbyt $1700 ; 1700-1F1F



loc_0x004D57_fill_ppu_with_tiles_2:
; in
    ; ram_051D
; out
    ; ram_00F6_reset_check_A5
    ; ram_051D
    JSR sub_0x01E635_disable_rendering_and_nmi
    LDA $2002
bra_8D4D_loop:
    LDA ram_051D
    ASL
    TAX
    LDA tbl_8D3B_tiles,X
    STA ram_0000_t01_tiles_data
    LDA tbl_8D3F_counter,X
    STA ram_0002_t20_data_counter_hi
    LDA tbl_8D43_ppu,X  ; hi
    STA $2006
    INX
    LDA tbl_8D3B_tiles,X
    STA ram_0000_t01_tiles_data + $01
    LDA tbl_8D3F_counter,X
    STA ram_0003_t03_data_counter_lo
    LDA tbl_8D43_ppu,X  ; lo
    JSR sub_8D84_write_to_ppu
    LDA ram_051D
    CMP #$02
    BNE bra_8D4D_loop
    LDA #$A5
    STA ram_00F6_reset_check_A5
    LDA #$00
    STA ram_051D
    RTS



sub_8D84_write_to_ppu:
; bzk optimize, single JSR to here
    STA $2006
    LDY #$00
bra_8D89_loop:
    LDA (ram_0000_t01_tiles_data),Y
    STA $2007
    LDA ram_0000_t01_tiles_data
    CLC
    ADC #< $0001
    STA ram_0000_t01_tiles_data
    LDA ram_0000_t01_tiles_data + $01
    ADC #> $0001
    STA ram_0000_t01_tiles_data + $01
    LDA ram_0003_t03_data_counter_lo
    SEC
    SBC #< $0001
    STA ram_0003_t03_data_counter_lo
    LDA ram_0002_t20_data_counter_hi
    SBC #> $0001
    STA ram_0002_t20_data_counter_hi
; bzk optimize, useless LDA
    LDA ram_0002_t20_data_counter_hi
    BNE bra_8D89_loop
    LDA ram_0003_t03_data_counter_lo
    BNE bra_8D89_loop
    INC ram_051D
    RTS



tbl_8DB4___0700_0FFF:
; 0x004DC4
    .incbin "incbin/chr/01___8DB4_96B3.chr"



tbl_96B4___1700_1F1F:
; 0x0056C4
    .incbin "incbin/chr/01___96B4_9ED3.chr"


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



sub_A000:
    STA ram_pos_Y_link
loc_A002:
    LDA ram_pos_Y_link
    STA ram_pos_Y_enemy,X
    LDA #$00
    STA ram_pos_X_enemy,X
    LDA #con_obj_id_2E
    STA ram_obj_id_enemy - $01,X
    RTS



tbl_A010:
    .byte $36   ; 00 
    .byte $3B   ; 01 
    .byte $73   ; 02 
    .byte $44   ; 03 
    .byte $0A   ; 04 
    .byte $21   ; 05 
    .byte $41   ; 06 
    .byte $6C   ; 07 



loc_0x006028:
    LDA ram_state_link
    AND #con_obj_state_freeze
    TAY
    LDA #$02
    CLC
    ADC ram_pos_X_enemy,X
    STA ram_pos_X_enemy,X
    CPY #con_obj_state_freeze
    BNE bra_A049
    LDY ram_0522_flag
    BEQ bra_A049
    STA ram_pos_X_link
    DEY
    BEQ bra_A075
    CMP #$80
    BNE bra_A075
    ASL ; -> 00
    STA ram_state_link  ; con_obj_state_00
    STA ram_0522_flag
    STA ram_obj_id_enemy - $01,X
    TXA
    PHA
    JSR sub_bat_71DE_draw_dot_on_minimap
    PLA
    TAX
    JMP loc_A08A
bra_A049:
    JSR sub_bat_7AA7
    LDA ram_0006_t10_flag
    BEQ bra_A075
    LDA #$01    ; con_dir_Right
    STA ram_dir_link
    LSR ; -> 00
    STA ram_00C0_link
    STA ram_00D3_link
    STA ram_005A
    LDA #con_obj_state_freeze
    STA ram_state_link
    LDA #$F8
    STA ram_spr_Y + $48
    STA ram_spr_Y + $4C
    LDA ram_0523
    AND #$07
    TAY
    LDA tbl_A010,Y
    STA ram_flute_map_location
    INC ram_0522_flag
bra_A075:
    LDA ram_pos_X_enemy,X
    CMP #$F0
    BCC bra_A08A
    JSR sub_A08D_destroy_object
    LDA ram_0522_flag
    BEQ bra_A08A
    TXA
    PHA
    JSR sub_0x01F192
    PLA
    TAX
bra_A08A:
loc_A08A:
; bzk optimize, JMP into JMP
    JMP loc_A105



sub_A08D_destroy_object:
; X = 0B
    LDA #$00    ; con_obj_id_null   con_obj_state_00
    STA ram_obj_id_enemy - $01,X
    STA ram_00C0_enemy,X
    STA ram_00D3_enemy,X
    STA ram_timer_enemy,X
    STA ram_state_obj,X
    STA ram_invinc_enemy,X
    LDA #$FF
    STA ram_0492_enemy,X
    LDA #$01
    STA ram_0405_enemy,X
    RTS



sub_0x0060B8:
    LDA ram_script
    CMP #con_script_05_gameplay
    BNE bra_A104_RTS
    JSR sub_A0F5
    LDA ram_0523
    AND #$07
    TAY
    LDA tbl_0x01E6CE_8_bits,Y
    STA ram_0000_t6E_triforce_piece
bra_A0BC_loop:
loc_A0BC_loop:
    LDA ram_item_triforce_pieces
    BEQ bra_A104_RTS
    BIT ram_0000_t6E_triforce_piece
    BNE bra_A0E0
    JSR sub_A0F5
    LDA ram_dir_link
    AND #con_dir__UR
    BEQ bra_A0D7
    ASL ram_0000_t6E_triforce_piece
    BCC bra_A0BC_loop
    ROL ram_0000_t6E_triforce_piece
    JMP loc_A0BC_loop
bra_A0D7:
    LSR ram_0000_t6E_triforce_piece
    BCC bra_A0BC_loop
    ROR ram_0000_t6E_triforce_piece
    JMP loc_A0BC_loop
bra_A0E0:
    LDA ram_0508
    ORA ram_0522_flag
    BNE bra_A104_RTS
    JSR sub_0x01FECB_search_for_free_object
    BEQ bra_A104_RTS    ; if no free objects
    INC ram_0508
    TYA
    TAX
    JMP loc_A002



sub_A0F5:
    INC ram_0523
    LDA ram_dir_link
    AND #con_dir__UR
    BNE bra_A104_RTS
    DEC ram_0523
    DEC ram_0523
bra_A104_RTS:
    RTS



loc_A105:
    LDA #$01
    JSR sub_0x01FA99
    LDA ram_frm_cnt
    AND #$03
    JSR sub_bat_7988_set_spr_A
    JSR sub_0x01FA82
    LDA #$00
    JMP loc_bat_77DF



tbl_A119:
    .byte $8D   ; 00 
    .byte $AD   ; 01 
    .byte $8D   ; 02 
    .byte $8D   ; 03 
    .byte $AD   ; 04 
    .byte $8D   ; 05 
    .byte $AD   ; 06 
    .byte $5D   ; 07 



loc_0x006131:
    LDA ram_0522_flag
    BEQ bra_A13B
    INC ram_0522_flag
    LDA #con_obj_state_freeze
    STA ram_state_link
    LDX #$09
    LDA ram_0523
    AND #$07
    TAY
    LDA tbl_A119,Y
    JSR sub_A000
bra_A13B:
    JMP loc_bat_6C90



sub_0x00614E:
    LDX #$0C
bra_A140_loop:
    LDA ram_obj_id_enemy - $01,X
    CMP #con_obj_id_68
    BEQ bra_A153
    CMP #con_obj_id_62
    BEQ bra_A153
    CMP #con_obj_id_65
    BEQ bra_A153
    CMP #con_obj_id_66
    BNE bra_A178
bra_A153:
    LDA ram_state_obj,X
    CMP #$01
    BNE bra_A178
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$10
    BCS bra_A178
    LDA ram_pos_Y_link
    CLC
    ADC #$03
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$10
    BCS bra_A178
    LDA #con_dir_00
    STA ram_000F_t01_direction
bra_A178:
    DEX
    BNE bra_A140_loop
    RTS



sub_0x00618C:
    LDA ram_0509
    BEQ bra_A1B0_RTS
    LDA ram_timer_link
    BEQ bra_A19D
    LDY #con_ppu_buf_overworld_palette
    LDA ram_timer_link
    BEQ bra_A196
    AND #$07
    CMP #$04
    BCC bra_A193
    LDY #con_ppu_buf_78
bra_A193:
    STY ram_ppu_load_index
    RTS
bra_A196:
    LDA #$02
    STA ram_0063
    INC ram_subscript
    RTS
bra_A19D:
    JSR sub_A1D6
    LDA #con_music_final_dungeon
    STA ram_music
    LDA #$01
    STA ram_item_0672
    LSR ; -> 00
    STA ram_state_link  ; con_obj_state_00
    STA ram_0509
bra_A1B0_RTS:
    RTS



loc_0x0061C1:
    INC ram_0509
    LDA #$C0
    STA ram_timer_link
    LDA #con_obj_state_freeze
    STA ram_state_link
    RTS



tbl_A1BD:
    .byte $3F   ; 00 
    .byte $1C   ; 01 
    .byte $04   ; 02 
    .byte $0F   ; 03 
    .byte $07   ; 04 
    .byte $17   ; 05 
    .byte $27   ; 06 
    .byte $FF   ; 07 



tbl_A1C5:
    .byte $07   ; 00 
    .byte $17   ; 01 
    .byte $30   ; 02 
    .byte $16   ; 03 
    .byte $2C   ; 04 
    .byte $3C   ; 05 
    .byte $27   ; 06 
    .byte $06   ; 07 
    .byte $16   ; 08 


; bzk garbage
    LDY #$02
    BNE bra_A1D8    ; jmp


; bzk garbage
    LDY #$05
    BNE bra_A1D8    ; jmp



sub_A1D6:
    LDY #$08
bra_A1D8:
    TYA
    PHA
    LDX ram_0301_buffer_index
    LDY #$00
bra_A1DF_loop:
    LDA tbl_A1BD,Y
    STA ram_0302_ppu_buffer,X
    INX
    INY
    CPY #$08
    BNE bra_A1DF_loop
    STX ram_0301_buffer_index
    PLA
    TAY
    LDX #$02
bra_A1F2_loop:
    LDA tbl_A1C5,Y
    STA ram_0302_ppu_buffer + $04,X
    DEY
    DEX
    BPL bra_A1F2_loop
    LDX ram_obj_index
    RTS


; bzk garbage
    JSR sub_0x01FAA3
    LDA #$0B
    JMP loc_bat_77DF


; bzk garbage
    LDA ram_room_item_flag
    BEQ bra_A21A_RTS
    JSR sub_bat_7314_check_map_bit4
    BNE bra_A21A_RTS
    LDA #$00
    STA ram_room_item_flag
    LDA #con_sfx_2_02
    STA ram_sfx_2
bra_A21A_RTS:
    RTS



tbl_A21B_pos_X:
    .byte $00   ; 00 
    .byte $00   ; 01 
    .byte $F0   ; 02 
    .byte $10   ; 03 



tbl_A21F_pos_Y:
    .byte $FB   ; 00 
    .byte $13   ; 01 
    .byte $03   ; 02 
    .byte $03   ; 03 



sub_0x006233:
    LDA ram_0394_link
    BNE bra_A23B
    LDA ram_03F8_link
    BEQ bra_A23B
    LDA #$BB
    STA ram_0002_t21
    LDX #$08
    LDA ram_collision_tile_link
bra_A236_loop:
    INC ram_0002_t21
    DEX
    BPL bra_A23E
bra_A23B:
    LDX #$00
    RTS
bra_A23E:
    CMP ram_0002_t21
    BNE bra_A236_loop
    LDA ram_pos_X_link
    STA ram_0000_t3C_copy_pos_X_link
    LDA ram_pos_Y_link
    STA ram_0001_t02_copy_pos_Y_link
    LDA ram_dir_link
    AND #con_dir__UD
    BEQ bra_A265
    LDA ram_0002_t21
    AND #$03
    TAY
    LDA ram_0000_t3C_copy_pos_X_link
    CPY #$02
    BCS bra_A25E
    CLC
    ADC #$08
bra_A25E:
    AND #$F0
    STA ram_0000_t3C_copy_pos_X_link
    JMP loc_A271
bra_A265:
    LDA ram_0002_t21
    LSR
    BCS bra_A271
    LDA ram_0001_t02_copy_pos_Y_link
    CLC
    ADC #$08
    STA ram_0001_t02_copy_pos_Y_link
bra_A271:
loc_A271:
    JSR sub_0x01FECB_search_for_free_object
    BEQ bra_A2CB    ; if no free objects
    LDX ram_free_obj_index
    LDA ram_dir_link
    JSR sub_bat_7013_get_Y_from_direction
    LDA ram_0000_t3C_copy_pos_X_link
    CLC
    ADC tbl_A21B_pos_X,Y
    STA ram_pos_X_enemy,X
    LDA ram_0001_t02_copy_pos_Y_link
    CLC
    ADC tbl_A21F_pos_Y,Y
    STA ram_pos_Y_enemy,X
    LDA ram_0492_enemy,X
    BEQ bra_A2CB
    LDY #$0B
    STX ram_0003_t04
bra_A296_loop:
    CPY ram_0003_t04
    BEQ bra_A2B4
    LDA ram_pos_X_enemy,Y
    CMP ram_pos_X_enemy,X
    BNE bra_A2B4
    LDA ram_pos_Y_enemy,Y
    CMP ram_pos_Y_enemy,X
    BNE bra_A2B4
    LDA ram_obj_id_enemy - $01,Y
    BNE bra_A2CB    ; if exist
    LDA ram_0492_enemy,Y
    BEQ bra_A2CB
    BNE bra_A2B7    ; jmp
bra_A2B4:
    DEY
    BNE bra_A296_loop
bra_A2B7:
    LDA #con_obj_id_1E
    LDY ram_0002_t21
    CPY #$C0
    BCS bra_A2C1
    LDA #con_obj_id_22
bra_A2C1:
    STA ram_obj_id_enemy - $01,X
    JSR sub_0x01FEEA
    LDA #$3F
    STA ram_timer_enemy,X
bra_A2CB:
    LDX #$00
    RTS



tbl_A2CE:
    .byte $78   ; 01 
    .byte $70   ; 02 
    .byte $80   ; 03 
    .byte $60   ; 04 
    .byte $70   ; 05 
    .byte $80   ; 06 
    .byte $90   ; 07 
    .byte $70   ; 08 
    .byte $80   ; 09 
    .byte $78   ; 0A 



tbl_A2D8:
    .byte $70   ; 01 
    .byte $80   ; 02 
    .byte $80   ; 03 
    .byte $90   ; 04 
    .byte $90   ; 05 
    .byte $90   ; 06 
    .byte $90   ; 07 
    .byte $A0   ; 08 
    .byte $A0   ; 09 
    .byte $B0   ; 0A 



loc_0x0062F2:
    LDA ram_attr_enemy - $01,X
    STA ram_0001_t20
    LDA #con_obj_id_35
    STA ram_0000_t39
    LDX #$0A
bra_A2ED_loop:
    JSR sub_A2FE
    LDA tbl_A2CE - $01,X
    STA ram_pos_X_enemy,X
    LDA tbl_A2D8 - $01,X
    STA ram_pos_Y_enemy,X
    DEX
    BNE bra_A2ED_loop
    RTS



sub_A2FE:
    LDA ram_0000_t39
    STA ram_obj_id_enemy - $01,X
    LDA #$00
    STA ram_0492_enemy,X
    LDA ram_0001_t20
    STA ram_attr_enemy - $01,X
    RTS



tbl_A30E:
    .byte $20   ; 00 
    .byte $20   ; 01 
    .byte $D0   ; 02 
    .byte $D0   ; 03 
    .byte $40   ; 04 
    .byte $B0   ; 05 



tbl_A314:
    .byte $5D   ; 00 
    .byte $BD   ; 01 
    .byte $5D   ; 02 
    .byte $BD   ; 03 
    .byte $8D   ; 04 
    .byte $8D   ; 05 



loc_0x00632A:
    LDA ram_attr_enemy - $01,X
    STA ram_0001_t20
    LDY #$05
    LDA #con_obj_id_49
    STA ram_0000_t39
    CMP ram_obj_id_enemy - $01,X
    BEQ bra_A32C_loop
    LDY #$03
bra_A32C_loop:
    TYA
    CLC
    ADC ram_obj_index
    TAX
    LDA tbl_A30E,Y
    STA ram_pos_X_enemy,X
    LDA tbl_A314,Y
    STA ram_pos_Y_enemy,X
    JSR sub_A2FE
    DEX
    DEY
    BPL bra_A32C_loop
    RTS



tbl_A344_direction:
    .byte con_dir__DR   ; 01 
    .byte con_dir__UR   ; 02 
    .byte con_dir__DL   ; 03 
    .byte con_dir__UL   ; 04 
    .byte con_dir_Right   ; 05 
    .byte con_dir_Left   ; 06 



loc_0x00635A:
    LDA ram_state_obj,X
    BNE bra_A399
    LDA ram_pos_Y_link
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$0E
    BCS bra_A37D
    LDY #$01
    LDA ram_pos_X_link
    CMP ram_pos_X_enemy,X
    BEQ bra_A37D
    BCS bra_A366
    LDY #$02
bra_A366:
    LDA ram_pos_X_enemy,X
bra_A368_loop:
    STA ram_0380_enemy,X
    TYA
    STA ram_dir_enemy,X
    AND tbl_A344_direction - $01,X
    BEQ bra_A37A
    INC ram_state_obj,X
    LDA #$70
    STA ram_03BC_obj,X
bra_A37A:
    JMP loc_A3EB
bra_A37D:
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$0E
    BCS bra_A37A
    LDY #$04
    LDA ram_pos_Y_link
    CMP ram_pos_Y_enemy,X
    BEQ bra_A37A
    BCS bra_A395
    LDY #$08
bra_A395:
    LDA ram_pos_Y_enemy,X
    BNE bra_A368_loop
bra_A399:
    LDA ram_dir_enemy,X
    STA ram_000F_t01_direction
    JSR sub_0x01F09D
    LDA ram_0394_enemy,X
    AND #$0F
    BNE bra_A3AA
    STA ram_0394_enemy,X
bra_A3AA:
    JSR sub_bat_7AA7
    LDY ram_pos_X_enemy,X
    LDA #$78
    STA ram_0000_t20
    LDA ram_dir_enemy,X
    AND #con_dir__UD
    BEQ bra_A3BF
    LDY ram_pos_Y_enemy,X
    LDA #$90
    STA ram_0000_t20
bra_A3BF:
    LDA ram_state_obj,X
    AND #$01
    BEQ bra_A3E1
    TYA
    SEC
    SBC ram_0000_t20
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$05
    BCS bra_A3DE
    LDA ram_dir_enemy,X
    JSR sub_bat_7013_get_Y_from_direction
    STA ram_dir_enemy,X
    LDA #$20
    STA ram_03BC_obj,X
    INC ram_state_obj,X
bra_A3DE:
    JMP loc_A3EB
bra_A3E1:
    TYA
    CMP ram_0380_enemy,X
    BNE bra_A3EB
    LDA #$00
    STA ram_state_obj,X
bra_A3EB:
loc_A3EB:
; bzk optimize, JMP into JMP
    JMP loc_bat_79BA



loc_0x0063FE:
    TXA
    PHA
    LDA ram_pos_Y_link
    SEC
    SBC ram_pos_Y_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$09
    BCS bra_A416
    LDA ram_pos_X_link
    SEC
    SBC ram_pos_X_enemy,X
    JSR sub_bat_701F_EOR_FF_if_negative
    CMP #$09
    BCS bra_A416
    JSR sub_bat_74A3_increase_rupees_and_add_sfx
    JSR sub_0x01FEC1_destroy_object
    LDA #$00
    STA ram_enemy_cnt
; bzk optimize, BEQ
    JMP loc_A420
bra_A416:
    JSR sub_0x01FAA3
    LDX #con_item_1_rupee
    LDY #$16
    JSR sub_0x01E745
loc_A420:
    PLA
    TAX
    RTS


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



ofs_A500_bank_s2_asm_export:
.include "copy_bank_s2.asm"



; 0x007780-0x00800F
.org $B770


; bzk garbage
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 
    .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF   ; 



.org $BF50
.segment "BANK_01i"
.include "copy_bank___BF50_BFF9.asm"



.out .sprintf("Free bytes in bank 01: 0x%04X [%d]", ($BFFA - *), ($BFFA - *))



.segment "VECTORS_01"
    .word vec_0x01E494_NMI
    .word vec_inc_0x003F60_RESET
    .word $BFF0 ; this game doesn't use IRQ
