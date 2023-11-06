CurrentQuestion = $10

lda #109
sta CurrentQuestion

KeepPlayingEx:
  ldx #0
  lda CurrentQuestion
@Next100:
  sec
  sbc #100
  bcc @Done100
  inx
  bcs @Next100
@Done100:
  stx $0
  ldx #0
  adc #100
@Next10:
  sec
  sbc #10
  bcc @Done10
  inx
  bcs @Next10
@Done10:
  stx $1
  adc #10
  sta $2
