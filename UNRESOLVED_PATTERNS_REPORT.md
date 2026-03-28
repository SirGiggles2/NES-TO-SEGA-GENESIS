# Unresolved #>/#< and Large Displacement Patterns Report

This report lists all flagged unresolved #>/#< and large displacement patterns in the generated VDP assembly files as of March 28, 2026. These require manual review or further automation for long-term build safety.

---

## bank_01_gen68k_vdp.asm
- [Line 1855](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1855): MOVE.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed
- [Line 1857](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1857): MOVE.B  #$A5,D0  ; FIXME: unresolved #</#$A5, manual review needed
- [Line 1859](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1859): MOVE.B  #$90,D0  ; FIXME: unresolved #</#$90, manual review needed
- [Line 1861](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1861): MOVE.B  #$6C,D0  ; FIXME: unresolved #</#$6C, manual review needed
- [Line 1885](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1885): ADD.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 1893](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1893): ADD.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 1899](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1899): CMPI.B  #$7F,D0  ; FIXME: unresolved #</#$7F, manual review needed
- [Line 1904](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L1904): CMPI.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed
- [Line 2009](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L2009): ADD.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 2017](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L2017): SUB.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 2020](src/banks/generated_vdp/bank_01_gen68k_vdp.asm#L2020): SUB.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed

## bank_02_gen68k_vdp.asm
- [Line 3708](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L3708): MOVE.B  #$80,D0  ; FIXME: unresolved #</#$80, manual review needed
- [Line 3710](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L3710): MOVE.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 4003](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4003): MOVE.B  #$80,D0  ; FIXME: unresolved #</#$80, manual review needed
- [Line 4005](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4005): MOVE.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 4128](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4128): MOVE.B  #$80,D0  ; FIXME: unresolved #</#$80, manual review needed
- [Line 4130](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4130): MOVE.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 4557](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4557): CMPI.B  #$FF,D0  ; FIXME: unresolved #</#$FF, manual review needed
- [Line 4560](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4560): CMPI.B  #$07,D0  ; FIXME: unresolved #</#$07, manual review needed
- [Line 4797](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4797): CMPI.B  #$FF,D0  ; FIXME: unresolved #</#$FF, manual review needed
- [Line 4800](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L4800): CMPI.B  #$07,D0  ; FIXME: unresolved #</#$07, manual review needed
- [Line 5059](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L5059): CMPI.B  #$FF,D0  ; FIXME: unresolved #</#$FF, manual review needed
- [Line 5062](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L5062): CMPI.B  #$07,D0  ; FIXME: unresolved #</#$07, manual review needed
- [Line 5303](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L5303): MOVE.B  #$59,D0  ; FIXME: unresolved #</#$59, manual review needed
- [Line 5305](src/banks/generated_vdp/bank_02_gen68k_vdp.asm#L5305): MOVE.B  #$A9,D0  ; FIXME: unresolved #</#$A9, manual review needed

## bank_03_gen68k_vdp.asm
- [Line 282](src/banks/generated_vdp/bank_03_gen68k_vdp.asm#L282): ADD.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 290](src/banks/generated_vdp/bank_03_gen68k_vdp.asm#L290): SUB.B  #$01,D0  ; FIXME: unresolved #</#$01, manual review needed
- [Line 293](src/banks/generated_vdp/bank_03_gen68k_vdp.asm#L293): SUB.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed

## bank_04_gen68k_vdp.asm
- [Line 7165](src/banks/generated_vdp/bank_04_gen68k_vdp.asm#L7165): ADD.B  #$38,D0  ; FIXME: unresolved #</#$38, manual review needed
- [Line 8519](src/banks/generated_vdp/bank_04_gen68k_vdp.asm#L8519): ADD.B  #$80,D0  ; FIXME: unresolved #</#$80, manual review needed

## bank_05_gen68k_vdp.asm
- [Line 553](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L553): MOVE.B  #$23,D0  ; FIXME: unresolved #</#$23, manual review needed
- [Line 555](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L555): MOVE.B  #$A0,D0  ; FIXME: unresolved #</#$A0, manual review needed
- [Line 586](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L586): CMPI.B  #$C0,D0  ; FIXME: unresolved #</#$C0, manual review needed
- [Line 589](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L589): CMPI.B  #$23,D0  ; FIXME: unresolved #</#$23, manual review needed
- [Line 5237](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5237): MOVE.B  #$A0,D0  ; FIXME: unresolved #</#$A0, manual review needed
- [Line 5239](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5239): MOVE.B  #$9F,D0  ; FIXME: unresolved #</#$9F, manual review needed
- [Line 5241](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5241): MOVE.B  #$47,D0  ; FIXME: unresolved #</#$47, manual review needed
- [Line 5243](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5243): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 5245](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5245): MOVE.B  #$5A,D0  ; FIXME: unresolved #</#$5A, manual review needed
- [Line 5314](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5314): CMPI.B  #$EE,D0  ; FIXME: unresolved #</#$EE, manual review needed
- [Line 5316](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5316): MOVE.B  #$30,D0  ; FIXME: unresolved #</#$30, manual review needed
- [Line 5318](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5318): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 5320](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5320): MOVE.B  #$EF,D0  ; FIXME: unresolved #</#$EF, manual review needed
- [Line 5322](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5322): MOVE.B  #$67,D0  ; FIXME: unresolved #</#$67, manual review needed
- [Line 5378](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5378): CMPI.B  #$66,D0  ; FIXME: unresolved #</#$66, manual review needed
- [Line 5934](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5934): MOVE.B  #$DE,D0  ; FIXME: unresolved #</#$DE, manual review needed
- [Line 5936](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5936): MOVE.B  #$A0,D0  ; FIXME: unresolved #</#$A0, manual review needed
- [Line 5951](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5951): MOVE.B  #$8C,D0  ; FIXME: unresolved #</#$8C, manual review needed
- [Line 5953](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L5953): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 6374](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6374): MOVE.B  #$1A,D0  ; FIXME: unresolved #</#$1A, manual review needed
- [Line 6376](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6376): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 6431](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6431): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 6436](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6436): ADD.B  #$30,D0  ; FIXME: unresolved #</#$30, manual review needed
- [Line 6441](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6441): MOVE.B  #$20,D0  ; FIXME: unresolved #</#$20, manual review needed
- [Line 6443](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L6443): MOVE.B  #$E0,D0  ; FIXME: unresolved #</#$E0, manual review needed
- [Line 7022](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L7022): MOVE.B  #$D4,D0  ; FIXME: unresolved #</#$D4, manual review needed
- [Line 7023](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L7023): MOVE.B  #$A3,D1  ; FIXME: unresolved #</#$A3, manual review needed
- [Line 7215](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L7215): MOVE.B  #$30,D0  ; FIXME: unresolved #</#$30, manual review needed
- [Line 7217](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L7217): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed
- [Line 8308](src/banks/generated_vdp/bank_05_gen68k_vdp.asm#L8308): MOVE.B  #$65,D0  ; FIXME: unresolved #</#$65, manual review needed

## bank_FF_gen68k_vdp.asm
- [Line 196](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L196): MOVE.B  #$20,D0  ; FIXME: unresolved #</#$20, manual review needed
- [Line 198](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L198): MOVE.B  #$28,D0  ; FIXME: unresolved #</#$28, manual review needed
- [Line 233](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L233): MOVE.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed
- [Line 236](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L236): MOVE.B  #$02,D0  ; FIXME: unresolved #</#$02, manual review needed
- [Line 246](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L246): MOVE.B  #$3F,D0  ; FIXME: unresolved #</#$3F, manual review needed
- [Line 249](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L249): MOVE.B  #$00,D0  ; FIXME: unresolved #</#$00, manual review needed
- [Line 1140](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L1140): CMPI.B  #$F0,D0  ; FIXME: unresolved #</#$F0, manual review needed
- [Line 1143](src/banks/generated_vdp/bank_FF_gen68k_vdp.asm#L1143): CMPI.B  #$67,D0  ; FIXME: unresolved #</#$67, manual review needed

## bank_s2_gen68k_vdp.asm
- [Line 504](src/banks/generated_vdp/bank_s2_gen68k_vdp.asm#L504): MOVE.B  #$7F,D0  ; FIXME: unresolved #</#$7F, manual review needed
- [Line 506](src/banks/generated_vdp/bank_s2_gen68k_vdp.asm#L506): MOVE.B  #$06,D0  ; FIXME: unresolved #</#$06, manual review needed
- [Line 2234](src/banks/generated_vdp/bank_s2_gen68k_vdp.asm#L2234): MOVE.B  #$3F,D0  ; FIXME: unresolved #</#$3F, manual review needed
- [Line 2239](src/banks/generated_vdp/bank_s2_gen68k_vdp.asm#L2239): MOVE.B  #$08,D0  ; FIXME: unresolved #</#$08, manual review needed

---

Please review and resolve these patterns for long-term build safety. Consider updating the code generator to automate more cases if possible.
