.segment "INES"
.byte $4E,$45,$53,$1A ; INES
.byte 2 ; PRG banks
.byte 16 ; CHR banks
.byte %10000 ; 6
.byte %0 ; 7
.byte %0 ; 8
.byte %0 ; 9
.byte %0 ; 10
.byte %0 ; 11
.byte %0 ; 12
.byte %0 ; 13
.byte %0 ; 14
.byte %0 ; 15

; allow line continuation feature
.linecont +

.include "inc.s"

.segment "PRG0"
.include "BANK_00.s"

.segment "CHR"
.incbin "chr.bin"
