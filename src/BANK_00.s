.org $8000

.byte $6F,$70,$71,$72,$5C,$5D,$5E,$5F             ;      0 8000 ........ opqr\]^_ 
.byte $60,$61,$62,$63,$64,$65,$66,$67             ;      8 8008 ........ `abcdefg 
.byte $68,$69,$6A,$5F,$6B,$6C,$6D,$6E             ;     10 8010 ........ hij_klmn 
.byte $5C,$64,$6C,$74,$84,$8C,$94                 ;     18 8018 .......  \dlt???  
D_0_001F:
.byte $9C                                         ;     1F 801F .        ?        
.byte $8E                                         ;     20 8020 D        ?        F:006105
.byte $8F                                         ;     21 8021 D        ?        F:006651
.byte $90                                         ;     22 8022 D        ?        F:008133
.byte $91                                         ;     23 8023 .        ?        
.byte $91                                         ;     24 8024 D        ?        F:041482
.byte $92                                         ;     25 8025 D        ?        F:033566
D_0_0026:
.byte $93                                         ;     26 8026 D        ?        F:043921
.byte $00                                         ;     27 8027 D        ?        F:006105
.byte $00                                         ;     28 8028 D        ?        F:006651
.byte $80                                         ;     29 8029 D        ?        F:008133
.byte $00                                         ;     2A 802A .        ?        
.byte $80                                         ;     2B 802B D        ?        F:041482
.byte $80                                         ;     2C 802C D        ?        F:033566
D_0_002D:
.byte $00                                         ;     2D 802D D        ?        F:043921
.byte $00                                         ;     2E 802E D        ?        F:006105
.byte $00                                         ;     2F 802F D        ?        F:006651
.byte $0C                                         ;     30 8030 D        ?        F:008133
.byte $06                                         ;     31 8031 .        ?        
.byte $07                                         ;     32 8032 D        ?        F:041482
.byte $04                                         ;     33 8033 D        ?        F:033566
.byte $06                                         ;     34 8034 D        ?        F:043921
D_0_0035:
.byte $89                                         ;     35 8035 D        ?        F:008133
.byte $8A                                         ;     36 8036 D        ?        F:012695
.byte $8B                                         ;     37 8037 D        ?        F:016558
.byte $8C                                         ;     38 8038 D        ?        F:034900
.byte $8D                                         ;     39 8039 .        ?        

RunStageSceneInner:
  JSR PPUHideAllAndWaitForNMI                                    ;     3A 803A C 20 C0 99        F:006101
  LDA #$7                                         ;     3D 803D C A9 07           F:006101
  JSR SetNMIRoutine                                    ;     3F 803F C 20 C7 CA        F:006101
  LDA #$7                                         ;     42 8042 C A9 07           F:006101
  LDX #$0                                         ;     44 8044 C A2 00           F:006101
  STX PPUNametable                                ;     46 8046 C 8E 44 03        F:006101
  STX R_05BD                                      ;     49 8049 C 8E BD 05        F:006101
  LDY #$0                                         ;     4C 804C C A0 00           F:006101
  JSR SetNewBackground                                    ;     4E 804E C 20 07 A3        F:006101
  LDA #$6                                         ;     51 8051 C A9 06           F:006103
  LDX #$0                                         ;     53 8053 C A2 00           F:006103
  LDY #$1                                         ;     55 8055 C A0 01           F:006103
  JSR SetNewBackground                                    ;     57 8057 C 20 07 A3        F:006103
  LDA #$0                                         ;     5A 805A C A9 00           F:006104
  STA R_001F                                      ;     5C 805C C 85 1F           F:006104
  JSR MoveSpritesOffscreen                                    ;     5E 805E C 20 D5 99        F:006104
  JSR StageSetFamilyPPUAttributes                                    ;     61 8061 C 20 B2 84        F:006105
  JSR StageDrawCashDisplays                                    ;     64 8064 C 20 D6 81        F:006105
  JSR L_0_0259                                    ;     67 8067 C 20 59 82        F:006105
  LDA StageCutscene                               ;     6A 806A C AD D5 04        F:006105
  CMP #StageCutsceneWalkStageLeftToCenterAndWave            ;     6D 806D C C9 01           F:006105
  BEQ @StageCutscene1                                    ;     6F 806F C F0 13           F:006105
  CMP #StageCutsceneWalkStageLeftToRightFamily    ;     71 8071 C C9 02           F:006651
  BEQ @StageCutscene1                                    ;     73 8073 C F0 0F           F:006651
  CMP #StageCutsceneWalkStageRightToCenter        ;     75 8075 C C9 03           F:008133
  BEQ @StageCutscene2                                    ;     77 8077 C F0 14           F:008133
  CMP #StageCutsceneWalkRightFamilyToLeftFamily   ;     79 8079 C C9 04           F:033565
  BEQ @StageCutscene1                                    ;     7B 807B C F0 07           F:033565
  LDX ActiveFamily                                ;     7D 807D C A6 0B           F:041482
  BEQ @StageCutscene3                                    ;     7F 807F C F0 18           F:041482
  JMP @StageCutscene1F2                                    ;     81 8081 . 4C 87 80        

@StageCutscene1:
  JSR DrawFamily1                                    ;     84 8084 C 20 BF 83        F:006105
@StageCutscene1F2:
  JSR DrawFamily2                                    ;     87 8087 C 20 02 84        F:006105
  JMP @StageCutscene4                                    ;     8A 808A C 4C 9C 80        F:006105

@StageCutscene2:
  JSR DrawFamily1                                    ;     8D 808D C 20 BF 83        F:008133
  JSR DrawFamily2                                    ;     90 8090 C 20 02 84        F:008133
  JSR SetInitialAnsweringFamilyMember                                    ;     93 8093 C 20 86 84        F:008133
  JMP @StageCutscene4                                    ;     96 8096 C 4C 9C 80        F:008133

@StageCutscene3:
  JSR DrawFamily1                                    ;     99 8099 C 20 BF 83        F:041482
@StageCutscene4:
  LDA StageCutscene                               ;     9C 809C C AD D5 04        F:006105
  CMP #$3                                         ;     9F 809F C C9 03           F:006105
  BNE B_0_00CE                                    ;     A1 80A1 C D0 2B           F:006105
  INC CurrentRoundNumber                          ;     A3 80A3 C EE 10 03        F:008133
  JSR SetInitialAnsweringFamilyMember                                    ;     A6 80A6 C 20 86 84        F:008133
  LDY #$0                                         ;     A9 80A9 C A0 00           F:008133
  JSR L_2_528C                                    ;     AB 80AB C 20 8C D2        F:008133
  STX R_05C2                                      ;     AE 80AE C 8E C2 05        F:008133
  LDA #$B0                                        ;     B1 80B1 C A9 B0           F:008133
  STA EntityYLo,X                                 ;     B3 80B3 C 9D CD 05        F:008133
  LDA #$C                                         ;     B6 80B6 C A9 0C           F:008133
  STA EntityYHi,X                                 ;     B8 80B8 C 9D CB 05        F:008133
  LDA #$0                                         ;     BB 80BB C A9 00           F:008133
  STA EntityXLo,X                                 ;     BD 80BD C 9D C9 05        F:008133
  LDA #$6                                         ;     C0 80C0 C A9 06           F:008133
  STA EntityXHi,X                                 ;     C2 80C2 C 9D C7 05        F:008133
  LDY CurrentAnsweringFamilyMember                ;     C5 80C5 C AC DC 04        F:008133
  LDA D_0_0035,Y                                  ;     C8 80C8 C B9 35 80        F:008133
  STA R_05C5,X                                    ;     CB 80CB C 9D C5 05        F:008133
B_0_00CE:
  LDY #$0                                         ;     CE 80CE C A0 00           F:006105
  JSR L_2_528C                                    ;     D0 80D0 C 20 8C D2        F:006105
  STX R_05C1                                      ;     D3 80D3 C 8E C1 05        F:006105
  LDY StageCutscene                               ;     D6 80D6 C AC D5 04        F:006105
  CPY #$4                                         ;     D9 80D9 C C0 04           F:006105
  BNE B_0_00DE                                    ;     DB 80DB C D0 01           F:006105
  INY                                             ;     DD 80DD C C8              F:033566
B_0_00DE:
  CPY #$5                                         ;     DE 80DE C C0 05           F:006105
  BNE B_0_00E7                                    ;     E0 80E0 C D0 05           F:006105
  TYA                                             ;     E2 80E2 C 98              F:033566
  CLC                                             ;     E3 80E3 C 18              F:033566
  ADC ActiveFamily                                ;     E4 80E4 C 65 0B           F:033566
  TAY                                             ;     E6 80E6 C A8              F:033566
B_0_00E7:
  LDA D_0_001F,Y                                  ;     E7 80E7 C B9 1F 80        F:006105
  STA R_05C5,X                                    ;     EA 80EA C 9D C5 05        F:006105
  LDA D_0_0026,Y                                  ;     ED 80ED C B9 26 80        F:006105
  STA EntityXLo,X                                 ;     F0 80F0 C 9D C9 05        F:006105
  LDA D_0_002D,Y                                  ;     F3 80F3 C B9 2D 80        F:006105
  STA EntityXHi,X                                 ;     F6 80F6 C 9D C7 05        F:006105
  LDA #$80                                        ;     F9 80F9 C A9 80           F:006105
  STA EntityYLo,X                                 ;     FB 80FB C 9D CD 05        F:006105
  LDA #$8                                         ;     FE 80FE C A9 08           F:006105
  STA EntityYHi,X                                 ;    100 8100 C 9D CB 05        F:006105
  LDX #$0                                         ;    103 8103 C A2 00           F:006105
  STX R_05A1                                      ;    105 8105 C 8E A1 05        F:006105
B_0_0108:
  LDA PaletteSprites,X                                  ;    108 8108 C BD CF D1        F:006105
  STA PaletteSpriteCopy,X                         ;    10B 810B C 95 30           F:006105
  INX                                             ;    10D 810D C E8              F:006105
  CPX #$10                                        ;    10E 810E C E0 10           F:006105
  BNE B_0_0108                                    ;    110 8110 C D0 F6           F:006105
  LDA #$76                                        ;    112 8112 C A9 76           F:006105
  STA SprYPos                                     ;    114 8114 C 8D 00 02        F:006105
  LDA #$81                                        ;    117 8117 C A9 81           F:006105
  STA SprTile                                     ;    119 8119 C 8D 01 02        F:006105
  LDA #$23                                        ;    11C 811C C A9 23           F:006105
  STA SprFlag                                     ;    11E 811E C 8D 02 02        F:006105
  LDA #$78                                        ;    121 8121 C A9 78           F:006105
  STA SprXPos                                     ;    123 8123 C 8D 03 02        F:006105
  LDA #$8                                         ;    126 8126 C A9 08           F:006105
  JSR L_0_19F7                                    ;    128 8128 C 20 F7 99        F:006105
  JSR L_0_1A0B                                    ;    12B 812B C 20 0B 9A        F:006105
  JSR PPUMASKShowSprites                                    ;    12E 812E C 20 B9 99        F:006105
  JSR PPUMASKShowBackground                                    ;    131 8131 C 20 AB 99        F:006105
  JSR PPUCTRLEnableNMI                                    ;    134 8134 C 20 EF CA        F:006105
  LDA StageCutscene                               ;    137 8137 C AD D5 04        F:006105
  CMP #$1                                         ;    13A 813A C C9 01           F:006105
  BNE B_0_0141                                    ;    13C 813C C D0 03           F:006105
  JSR DelayUntilNMI                                    ;    13E 813E C 20 F9 CA        F:006105
B_0_0141:
  LDA PaletteDirtyFlagPending                     ;    141 8141 C AD 41 03        F:006106
  STA PaletteDirtyFlag                            ;    144 8144 C 8D 3D 03        F:006106
  JSR DelayUntilNMI                                    ;    147 8147 C 20 F9 CA        F:006106
  JSR L_2_52D6                                    ;    14A 814A C 20 D6 D2        F:006107
  JSR L_2_593E                                    ;    14D 814D C 20 3E D9        F:006107
  JSR DelayUntilVBlank                                    ;    150 8150 C 20 D0 9B        F:006107
  LDX #$B9                                        ;    153 8153 C A2 B9           F:006107
B_0_0155:
  DEX                                             ;    155 8155 C CA              F:006107
  BNE B_0_0155                                    ;    156 8156 C D0 FD           F:006107
  NOP                                             ;    158 8158 C EA              F:006107
  LDA #$0                                         ;    159 8159 C A9 00           F:006107
  JSR MMC1SetCHR0                                    ;    15B 815B C 20 54 99        F:006107
  LDA #$C                                         ;    15E 815E C A9 0C           F:006107
  JSR MMC1SetCHR1                                    ;    160 8160 C 20 68 99        F:006107
  LDY #$3                                         ;    163 8163 C A0 03           F:006107
  LDX #$10                                        ;    165 8165 C A2 10           F:006107
B_0_0167:
  DEX                                             ;    167 8167 C CA              F:006107
  BNE B_0_0167                                    ;    168 8168 C D0 FD           F:006107
  DEY                                             ;    16A 816A C 88              F:006107
  BNE B_0_0167                                    ;    16B 816B C D0 FA           F:006107
  LDA #$0                                         ;    16D 816D C A9 00           F:006107
  JSR MMC1SetCHR0                                    ;    16F 816F C 20 54 99        F:006107
  JSR SoundSystemUpdate                                    ;    172 8172 C 20 96 BA        F:006107
  JSR L_0_1A7E                                    ;    175 8175 C 20 7E 9A        F:006107
  LDA R_0028                                      ;    178 8178 C A5 28           F:006107
  CMP #$1                                         ;    17A 817A C C9 01           F:006107
  BCC B_0_0188                                    ;    17C 817C C 90 0A           F:006107
  JSR L_0_1A00                                    ;    17E 817E C 20 00 9A        F:006107
  BCC B_0_0141                                    ;    181 8181 C 90 BE           F:006107
  JSR JoypadHasChanged                                    ;    183 8183 C 20 1C 9B        F:006227
  BCS B_0_0141                                    ;    186 8186 C B0 B9           F:006227
B_0_0188:
  JSR DelayUntilNMI                                    ;    188 8188 C 20 F9 CA        F:006282
  JSR L_2_52D6                                    ;    18B 818B C 20 D6 D2        F:006283
  JSR L_2_593E                                    ;    18E 818E C 20 3E D9        F:006283
  JSR DelayUntilVBlank                                    ;    191 8191 C 20 D0 9B        F:006283
  LDX #$B9                                        ;    194 8194 C A2 B9           F:006283
B_0_0196:
  DEX                                             ;    196 8196 C CA              F:006283
  BNE B_0_0196                                    ;    197 8197 C D0 FD           F:006283
  NOP                                             ;    199 8199 C EA              F:006283
  LDA #$0                                         ;    19A 819A C A9 00           F:006283
  JSR MMC1SetCHR0                                    ;    19C 819C C 20 54 99        F:006283
  LDA #$C                                         ;    19F 819F C A9 0C           F:006283
  JSR MMC1SetCHR1                                    ;    1A1 81A1 C 20 68 99        F:006283
  LDY #$3                                         ;    1A4 81A4 C A0 03           F:006283
  LDX #$10                                        ;    1A6 81A6 C A2 10           F:006283
B_0_01A8:
  DEX                                             ;    1A8 81A8 C CA              F:006283
  BNE B_0_01A8                                    ;    1A9 81A9 C D0 FD           F:006283
  DEY                                             ;    1AB 81AB C 88              F:006283
  BNE B_0_01A8                                    ;    1AC 81AC C D0 FA           F:006283
  LDA #$0                                         ;    1AE 81AE C A9 00           F:006283
  JSR MMC1SetCHR0                                    ;    1B0 81B0 C 20 54 99        F:006283
  JSR SoundSystemUpdate                                    ;    1B3 81B3 C 20 96 BA        F:006283
  LDA #$1                                         ;    1B6 81B6 C A9 01           F:006283
  STA PaletteDirtyFlag                            ;    1B8 81B8 C 8D 3D 03        F:006283
  JSR L_0_1A30                                    ;    1BB 81BB C 20 30 9A        F:006283
  BCC B_0_0188                                    ;    1BE 81BE C 90 C8           F:006283
  LDX R_05C1                                      ;    1C0 81C0 C AE C1 05        F:006294
  BMI B_0_01C8                                    ;    1C3 81C3 C 30 03           F:006294
  JSR L_2_52AA                                    ;    1C5 81C5 C 20 AA D2        F:006294
B_0_01C8:
  LDX R_05C2                                      ;    1C8 81C8 C AE C2 05        F:006294
  BMI B_0_01D0                                    ;    1CB 81CB C 30 03           F:006294
  JSR L_2_52AA                                    ;    1CD 81CD C 20 AA D2        F:006294
B_0_01D0:
  LDA #$0                                         ;    1D0 81D0 C A9 00           F:006294
  STA IsInFastMoney                                      ;    1D2 81D2 C 8D 43 05        F:006294
  RTS                                             ;    1D5 81D5 C 60              F:006294

StageDrawCashDisplays:
  JSR PPUCTRLSetWriteVertical                                    ;    1D6 81D6 C 20 ED 99        F:006105
  LDA #$0                                         ;    1D9 81D9 C A9 00           F:006105
  JSR BCDConverter                                    ;    1DB 81DB C 20 5E AA        F:006105
  LDA BCDOutput+2                                      ;    1DE 81DE C AD C0 04        F:006105
  LDX #$0                                         ;    1E1 81E1 C A2 00           F:006105
  JSR DrawSingleCashCharacter                                    ;    1E3 81E3 C 20 33 82        F:006105
  LDA BCDOutput+3                                      ;    1E6 81E6 C AD C1 04        F:006105
  LDX #$2                                         ;    1E9 81E9 C A2 02           F:006105
  JSR DrawSingleCashCharacter                                    ;    1EB 81EB C 20 33 82        F:006105
  LDA BCDOutput+4                                      ;    1EE 81EE C AD C2 04        F:006105
  LDX #$4                                         ;    1F1 81F1 C A2 04           F:006105
  JSR DrawSingleCashCharacter                                    ;    1F3 81F3 C 20 33 82        F:006105
  LDA #$1                                         ;    1F6 81F6 C A9 01           F:006105
  JSR BCDConverter                                    ;    1F8 81F8 C 20 5E AA        F:006105
  LDA BCDOutput+2                                      ;    1FB 81FB C AD C0 04        F:006105
  LDX #$6                                         ;    1FE 81FE C A2 06           F:006105
  JSR DrawSingleCashCharacter                                    ;    200 8200 C 20 33 82        F:006105
  LDA BCDOutput+3                                      ;    203 8203 C AD C1 04        F:006105
  LDX #$8                                         ;    206 8206 C A2 08           F:006105
  JSR DrawSingleCashCharacter                                    ;    208 8208 C 20 33 82        F:006105
  LDA BCDOutput+4                                      ;    20B 820B C AD C2 04        F:006105
  LDX #$A                                         ;    20E 820E C A2 0A           F:006105
  JSR DrawSingleCashCharacter                                    ;    210 8210 C 20 33 82        F:006105
  LDA #$2                                         ;    213 8213 C A9 02           F:006105
  JSR BCDConverter                                    ;    215 8215 C 20 5E AA        F:006105
  LDA BCDOutput+2                                      ;    218 8218 C AD C0 04        F:006105
  LDX #$C                                         ;    21B 821B C A2 0C           F:006105
  JSR DrawSingleCashCharacter                                    ;    21D 821D C 20 33 82        F:006105
  LDA BCDOutput+3                                      ;    220 8220 C AD C1 04        F:006105
  LDX #$E                                         ;    223 8223 C A2 0E           F:006105
  JSR DrawSingleCashCharacter                                    ;    225 8225 C 20 33 82        F:006105
  LDA BCDOutput+4                                      ;    228 8228 C AD C2 04        F:006105
  LDX #$10                                        ;    22B 822B C A2 10           F:006105
  JSR DrawSingleCashCharacter                                    ;    22D 822D C 20 33 82        F:006105
  JMP PPUCTRLSetWriteHorizontal                                    ;    230 8230 C 4C E3 99        F:006105

DrawSingleCashCharacter:
  CMP #$20                                        ;    233 8233 C C9 20           F:006105
  BNE @CheckedForSpace                                    ;    235 8235 C D0 02           F:006105
  LDA #$3A                                        ;    237 8237 C A9 3A           F:006105
@CheckedForSpace:
  SEC                                             ;    239 8239 C 38              F:006105
  SBC #$30                                        ;    23A 823A C E9 30           F:006105
  TAY                                             ;    23C 823C C A8              F:006105
  LDA StageCashPPULocations+1,X                                  ;    23D 823D C BD 52 83        F:006105
  STA PpuAddr_2006                                ;    240 8240 C 8D 06 20        F:006105
  LDA StageCashPPULocations,X                                  ;    243 8243 C BD 51 83        F:006105
  STA PpuAddr_2006                                ;    246 8246 C 8D 06 20        F:006105
  LDX StageCashCharacterOffsets,Y                                  ;    249 8249 C BE 63 83        F:006105
  LDA StageCashCharacterTiles,X                                  ;    24C 824C C BD 6E 83        F:006105
  STA PpuData_2007                                ;    24F 824F C 8D 07 20        F:006105
  LDA StageCashCharacterTiles+1,X                                  ;    252 8252 C BD 6F 83        F:006105
  STA PpuData_2007                                ;    255 8255 C 8D 07 20        F:006105
B_0_0258:
  RTS                                             ;    258 8258 C 60              F:006105

L_0_0259:
  LDA R_0393                                      ;    259 8259 C AD 93 03        F:006105
  AND #$F                                         ;    25C 825C C 29 0F           F:006105
  BEQ B_0_0258                                    ;    25E 825E C F0 F8           F:006105
  LDX IsInFastMoney                                      ;    260 8260 C AE 43 05        F:012694
  BEQ B_0_0267                                    ;    263 8263 C F0 02           F:012694
  LDA #$B                                         ;    265 8265 C A9 0B           F:043921
B_0_0267:
  STA R_000E                                      ;    267 8267 C 85 0E           F:012694
  LDA CurrentRoundNumber                          ;    269 8269 C AD 10 03        F:012694
  CMP #$3                                         ;    26C 826C C C9 03           F:012694
  ROL                                             ;    26E 826E C 2A              F:012694
  AND #$1                                         ;    26F 826F C 29 01           F:012694
  TAY                                             ;    271 8271 C A8              F:012694
  LDA D_0_03BD,Y                                  ;    272 8272 C B9 BD 83        F:012694
  STA R_000F                                      ;    275 8275 C 85 0F           F:012694
  LDX #$0                                         ;    277 8277 C A2 00           F:012694
L_0_0279:
  TXA                                             ;    279 8279 C 8A              F:012694
  ASL                                             ;    27A 827A C 0A              F:012694
  TAY                                             ;    27B 827B C A8              F:012694
  LDA D_0_0385,Y                                  ;    27C 827C C B9 85 83        F:012694
  STA PpuAddr_2006                                ;    27F 827F C 8D 06 20        F:012694
  LDA D_0_0384,Y                                  ;    282 8282 C B9 84 83        F:012694
  STA PpuAddr_2006                                ;    285 8285 C 8D 06 20        F:012694
  LDA IsInFastMoney                                      ;    288 8288 C AD 43 05        F:012694
  BNE B_0_02B4                                    ;    28B 828B C D0 27           F:012694
  LDA R_0384,X                                    ;    28D 828D C BD 84 03        F:012694
  BNE B_0_02B4                                    ;    290 8290 C D0 22           F:012694
  JSR L_0_033B                                    ;    292 8292 C 20 3B 83        F:033565
  LDA D_0_039F                                    ;    295 8295 C AD 9F 83        F:033565
  STA PpuData_2007                                ;    298 8298 C 8D 07 20        F:033565
  LDA D_0_03A0                                    ;    29B 829B C AD A0 83        F:033565
  STA PpuData_2007                                ;    29E 829E C 8D 07 20        F:033565
  LDA D_0_03A1                                    ;    2A1 82A1 C AD A1 83        F:033565
  STA PpuData_2007                                ;    2A4 82A4 C 8D 07 20        F:033565
  CPX #$6                                         ;    2A7 82A7 C E0 06           F:033565
  BCC B_0_02FB                                    ;    2A9 82A9 C 90 50           F:033565
  LDA D_0_03AB,Y                                  ;    2AB 82AB . B9 AB 83        
  STA PpuData_2007                                ;    2AE 82AE . 8D 07 20        
  JMP B_0_02FB                                    ;    2B1 82B1 . 4C FB 82        

B_0_02B4:
  JSR L_0_033B                                    ;    2B4 82B4 C 20 3B 83        F:012694
  LDA IsInFastMoney                                      ;    2B7 82B7 C AD 43 05        F:012694
  BNE B_0_02DB                                    ;    2BA 82BA C D0 1F           F:012694
B_0_02BC:
  LDA D_0_039C                                    ;    2BC 82BC C AD 9C 83        F:012694
  STA PpuData_2007                                ;    2BF 82BF C 8D 07 20        F:012694
  LDA D_0_039D                                    ;    2C2 82C2 C AD 9D 83        F:012694
  STA PpuData_2007                                ;    2C5 82C5 C 8D 07 20        F:012694
  LDA D_0_039E                                    ;    2C8 82C8 C AD 9E 83        F:012694
  STA PpuData_2007                                ;    2CB 82CB C 8D 07 20        F:012694
  CPX #$6                                         ;    2CE 82CE C E0 06           F:012694
  BCC B_0_02FB                                    ;    2D0 82D0 C 90 29           F:012694
  LDA D_0_03AB,Y                                  ;    2D2 82D2 C B9 AB 83        F:016557
  STA PpuData_2007                                ;    2D5 82D5 C 8D 07 20        F:016557
  JMP B_0_02FB                                    ;    2D8 82D8 C 4C FB 82        F:016557

B_0_02DB:
  CPX #$5                                         ;    2DB 82DB C E0 05           F:043921
  BNE B_0_02BC                                    ;    2DD 82DD C D0 DD           F:043921
  LDA D_0_03A2                                    ;    2DF 82DF C AD A2 83        F:043921
  STA PpuData_2007                                ;    2E2 82E2 C 8D 07 20        F:043921
  LDA D_0_03A3                                    ;    2E5 82E5 C AD A3 83        F:043921
  STA PpuData_2007                                ;    2E8 82E8 C 8D 07 20        F:043921
  LDA D_0_03A4                                    ;    2EB 82EB C AD A4 83        F:043921
  STA PpuData_2007                                ;    2EE 82EE C 8D 07 20        F:043921
  CPX #$6                                         ;    2F1 82F1 C E0 06           F:043921
  BCC B_0_02FB                                    ;    2F3 82F3 C 90 06           F:043921
  LDA D_0_03AB,Y                                  ;    2F5 82F5 . B9 AB 83        
  STA PpuData_2007                                ;    2F8 82F8 . 8D 07 20        
B_0_02FB:
  INX                                             ;    2FB 82FB C E8              F:012694
  CPX R_000E                                      ;    2FC 82FC C E4 0E           F:012694
  BEQ B_0_0303                                    ;    2FE 82FE C F0 03           F:012694
  JMP L_0_0279                                    ;    300 8300 C 4C 79 82        F:012694

B_0_0303:
  CPX #$C                                         ;    303 8303 C E0 0C           F:012694
  BEQ B_0_033A                                    ;    305 8305 C F0 33           F:012694
B_0_0307:
  TXA                                             ;    307 8307 C 8A              F:012694
  ASL                                             ;    308 8308 C 0A              F:012694
  TAY                                             ;    309 8309 C A8              F:012694
  LDA D_0_0385,Y                                  ;    30A 830A C B9 85 83        F:012694
  STA PpuAddr_2006                                ;    30D 830D C 8D 06 20        F:012694
  LDA D_0_0384,Y                                  ;    310 8310 C B9 84 83        F:012694
  STA PpuAddr_2006                                ;    313 8313 C 8D 06 20        F:012694
  JSR L_0_033B                                    ;    316 8316 C 20 3B 83        F:012694
  LDA D_0_03A2                                    ;    319 8319 C AD A2 83        F:012694
  STA PpuData_2007                                ;    31C 831C C 8D 07 20        F:012694
  LDA D_0_03A3                                    ;    31F 831F C AD A3 83        F:012694
  STA PpuData_2007                                ;    322 8322 C 8D 07 20        F:012694
  LDA D_0_03A4                                    ;    325 8325 C AD A4 83        F:012694
  STA PpuData_2007                                ;    328 8328 C 8D 07 20        F:012694
  CPX #$6                                         ;    32B 832B C E0 06           F:012694
  BCC B_0_0335                                    ;    32D 832D C 90 06           F:012694
  LDA D_0_03AB,Y                                  ;    32F 832F C B9 AB 83        F:012694
  STA PpuData_2007                                ;    332 8332 C 8D 07 20        F:012694
B_0_0335:
  INX                                             ;    335 8335 C E8              F:012694
  CPX #$C                                         ;    336 8336 C E0 0C           F:012694
  BNE B_0_0307                                    ;    338 8338 C D0 CD           F:012694
B_0_033A:
  RTS                                             ;    33A 833A C 60              F:012694

L_0_033B:
  TXA                                             ;    33B 833B C 8A              F:012694
  CMP #$6                                         ;    33C 833C C C9 06           F:012694
  BCC B_0_0343                                    ;    33E 833E C 90 03           F:012694
  SBC #$6                                         ;    340 8340 C E9 06           F:012694
  CLC                                             ;    342 8342 C 18              F:012694
B_0_0343:
  ADC R_000F                                      ;    343 8343 C 65 0F           F:012694
  TAY                                             ;    345 8345 C A8              F:012694
  CPX #$6                                         ;    346 8346 C E0 06           F:012694
  BCS B_0_0350                                    ;    348 8348 C B0 06           F:012694
  LDA D_0_03A5,Y                                  ;    34A 834A C B9 A5 83        F:012694
  STA PpuData_2007                                ;    34D 834D C 8D 07 20        F:012694
B_0_0350:
  RTS                                             ;    350 8350 C 60              F:012694

StageCashPPULocations:
  .addr $20E7
  .addr $20E8
  .addr $20E9
  .addr $20F7
  .addr $20F8
  .addr $20F9
  .addr $202F
  .addr $2030
  .addr $2031

StageCashCharacterOffsets:
  .byte $00,$02,$04,$06,$08
  .byte $0A,$0C,$0E,$10,$12
  .byte $14

StageCashCharacterTiles:
  .byte $93,$9F ; 0
  .byte $94,$A0 ; 1
  .byte $95,$A1 ; 2
  .byte $96,$A2 ; 3
  .byte $97,$A3 ; 4
  .byte $98,$A4 ; 5
  .byte $99,$9F ; 6
  .byte $9A,$A5 ; 7
  .byte $9B,$9F ; 8
  .byte $9C,$A2 ; 9
  .byte $08,$11 ; Space

D_0_0384:
.byte $AC                                         ;    384 8384 D        ?        F:012694
D_0_0385:
.byte $20,$CC,$20,$EC,$20,$0C,$21,$2C             ;    385 8385 DDDDDDDD  ? ? ?!, F:012694
.byte $21,$4C,$21,$B0,$20,$D0,$20,$F0             ;    38D 838D DDDDDDDD !L!? ? ? F:012694
.byte $20,$10,$21,$30,$21,$50,$21                 ;    395 8395 DDDDDDD   ?!0!P!  F:012694
D_0_039C:
.byte $84                                         ;    39C 839C D        ?        F:012694
D_0_039D:
.byte $85                                         ;    39D 839D D        ?        F:012694
D_0_039E:
.byte $86                                         ;    39E 839E D        ?        F:012694
D_0_039F:
.byte $87                                         ;    39F 839F D        ?        F:033565
D_0_03A0:
.byte $88                                         ;    3A0 83A0 D        ?        F:033565
D_0_03A1:
.byte $89                                         ;    3A1 83A1 D        ?        F:033565
D_0_03A2:
.byte $8A                                         ;    3A2 83A2 D        ?        F:012694
D_0_03A3:
.byte $8B                                         ;    3A3 83A3 D        ?        F:012694
D_0_03A4:
.byte $8C                                         ;    3A4 83A4 D        ?        F:012694
D_0_03A5:
.byte $2A,$34,$3D,$45,$4C,$56                     ;    3A5 83A5 DDDDDD   *4=ELV   F:012694
D_0_03AB:
.byte $2F,$3B,$44,$4B,$50,$5B                     ;    3AB 83AB DDDDDD   /;DKP[   F:012694
.byte $8D,$8F,$91,$9D,$A6,$A8,$8E,$90             ;    3B1 83B1 DDDDDDDD ???????? F:033565
.byte $92,$9E,$A7,$A9                             ;    3B9 83B9 DDDD     ????     F:033565
D_0_03BD:
.byte $00                                         ;    3BD 83BD D        ?        F:012694
.byte $0C                                         ;    3BE 83BE D        ?        F:033565
DrawFamily1:
  LDA ActiveFamily                                ;    3BF 83BF C A5 0B           F:006105
  PHA                                             ;    3C1 83C1 C 48              F:006105
  LDA #$0                                         ;    3C2 83C2 C A9 00           F:006105
  STA ActiveFamily                                ;    3C4 83C4 C 85 0B           F:006105
  JSR L_2_529D                                    ;    3C6 83C6 C 20 9D D2        F:006105
  STX R_05C3                                      ;    3C9 83C9 C 8E C3 05        F:006105
  LDA #$A                                         ;    3CC 83CC C A9 0A           F:006105
  STA R_05E5,X                                    ;    3CE 83CE C 9D E5 05        F:006105
  LDA #$10                                        ;    3D1 83D1 C A9 10           F:006105
  STA R_05E7,X                                    ;    3D3 83D3 C 9D E7 05        F:006105
  LDA #$80                                        ;    3D6 83D6 C A9 80           F:006105
  STA R_05F7,X                                    ;    3D8 83D8 C 9D F7 05        F:006105
  LDA Family1                                     ;    3DB 83DB C AD 15 03        F:006105
  ASL                                             ;    3DE 83DE C 0A              F:006105
  ADC #$A5                                        ;    3DF 83DF C 69 A5           F:006105
  STA R_05E3,X                                    ;    3E1 83E1 C 9D E3 05        F:006105
B_0_03E4:
  JSR L_2_52D6                                    ;    3E4 83E4 C 20 D6 D2        F:006105
  JSR DrawFamilyMember                                    ;    3E7 83E7 C 20 85 DA        F:006105
  LDX R_05C3                                      ;    3EA 83EA C AE C3 05        F:006105
  LDA R_05E3,X                                    ;    3ED 83ED C BD E3 05        F:006105
  CMP #$FF                                        ;    3F0 83F0 C C9 FF           F:006105
  BNE B_0_03E4                                    ;    3F2 83F2 C D0 F0           F:006105
  JSR L_0_044A                                    ;    3F4 83F4 C 20 4A 84        F:006105
  PLA                                             ;    3F7 83F7 C 68              F:006105
  STA ActiveFamily                                ;    3F8 83F8 C 85 0B           F:006105
  LDX R_05C3                                      ;    3FA 83FA C AE C3 05        F:006105
  BMI B_0_0445                                    ;    3FD 83FD C 30 46           F:006105
  JMP L_2_52B0                                    ;    3FF 83FF C 4C B0 D2        F:006105

DrawFamily2:
  LDA ActiveFamily                                ;    402 8402 C A5 0B           F:006105
  PHA                                             ;    404 8404 C 48              F:006105
  LDA #$1                                         ;    405 8405 C A9 01           F:006105
  STA ActiveFamily                                ;    407 8407 C 85 0B           F:006105
  JSR L_2_529D                                    ;    409 8409 C 20 9D D2        F:006105
  STX R_05C3                                      ;    40C 840C C 8E C3 05        F:006105
  LDA #$14                                        ;    40F 840F C A9 14           F:006105
  STA R_05E5,X                                    ;    411 8411 C 9D E5 05        F:006105
  LDA #$10                                        ;    414 8414 C A9 10           F:006105
  STA R_05E7,X                                    ;    416 8416 C 9D E7 05        F:006105
  LDA #$0                                         ;    419 8419 C A9 00           F:006105
  STA R_05F7,X                                    ;    41B 841B C 9D F7 05        F:006105
  LDA Family2                                     ;    41E 841E C AD 16 03        F:006105
  ASL                                             ;    421 8421 C 0A              F:006105
  ADC #$A5                                        ;    422 8422 C 69 A5           F:006105
  STA R_05E3,X                                    ;    424 8424 C 9D E3 05        F:006105
B_0_0427:
  JSR L_2_52D6                                    ;    427 8427 C 20 D6 D2        F:006105
  JSR DrawFamilyMember                                    ;    42A 842A C 20 85 DA        F:006105
  LDX R_05C3                                      ;    42D 842D C AE C3 05        F:006105
  LDA R_05E3,X                                    ;    430 8430 C BD E3 05        F:006105
  CMP #$FF                                        ;    433 8433 C C9 FF           F:006105
  BNE B_0_0427                                    ;    435 8435 C D0 F0           F:006105
  JSR L_0_044A                                    ;    437 8437 C 20 4A 84        F:006105
  PLA                                             ;    43A 843A C 68              F:006105
  STA ActiveFamily                                ;    43B 843B C 85 0B           F:006105
  LDX R_05C3                                      ;    43D 843D C AE C3 05        F:006105
  BMI B_0_0445                                    ;    440 8440 C 30 03           F:006105
  JMP L_2_52B0                                    ;    442 8442 C 4C B0 D2        F:006105

B_0_0445:
  RTS                                             ;    445 8445 . 60              

D_0_0446:
.byte $A8                                         ;    446 8446 D        ?        F:006651
D_0_0447:
.byte $22                                         ;    447 8447 D        "        F:006651
.byte $B8,$22                                     ;    448 8448 DD       ?"       F:008133
L_0_044A:
  LDX ActiveFamily                                ;    44A 844A C A6 0B           F:006105
  LDY D_0_0FC6,X                                  ;    44C 844C C BC C6 8F        F:006105
  LDA Family1Name,Y                               ;    44F 844F C B9 00 03        F:006105
  CMP #$A0                                        ;    452 8452 C C9 A0           F:006105
  BEQ B_0_0485                                    ;    454 8454 C F0 2F           F:006105
  JSR L_0_17FA                                    ;    456 8456 C 20 FA 97        F:006651
  LSR R_0010                                      ;    459 8459 C 46 10           F:006651
  LDA ActiveFamily                                ;    45B 845B C A5 0B           F:006651
  ASL                                             ;    45D 845D C 0A              F:006651
  TAX                                             ;    45E 845E C AA              F:006651
  SEC                                             ;    45F 845F C 38              F:006651
  LDA D_0_0446,X                                  ;    460 8460 C BD 46 84        F:006651
  SBC R_0010                                      ;    463 8463 C E5 10           F:006651
  PHA                                             ;    465 8465 C 48              F:006651
  LDA D_0_0447,X                                  ;    466 8466 C BD 47 84        F:006651
  STA PpuAddr_2006                                ;    469 8469 C 8D 06 20        F:006651
  PLA                                             ;    46C 846C C 68              F:006651
  STA PpuAddr_2006                                ;    46D 846D C 8D 06 20        F:006651
  LDX ActiveFamily                                ;    470 8470 C A6 0B           F:006651
  LDY D_0_0FC6,X                                  ;    472 8472 C BC C6 8F        F:006651
B_0_0475:
  LDA Family1Name,Y                               ;    475 8475 C B9 00 03        F:006651
  PHP                                             ;    478 8478 C 08              F:006651
  AND #$7F                                        ;    479 8479 C 29 7F           F:006651
  CLC                                             ;    47B 847B C 18              F:006651
  ADC #$A0                                        ;    47C 847C C 69 A0           F:006651
  STA PpuData_2007                                ;    47E 847E C 8D 07 20        F:006651
  INY                                             ;    481 8481 C C8              F:006651
  PLP                                             ;    482 8482 C 28              F:006651
  BPL B_0_0475                                    ;    483 8483 C 10 F0           F:006651
B_0_0485:
  RTS                                             ;    485 8485 C 60              F:006105

SetInitialAnsweringFamilyMember:
  SEC                                             ;    486 8486 C 38              F:008133
  LDA CurrentRoundNumber                          ;    487 8487 C AD 10 03        F:008133
  SBC #$1                                         ;    48A 848A C E9 01           F:008133
: CMP #$5                                         ;    48C 848C C C9 05           F:008133
  BCC :+                                    ;    48E 848E C 90 05           F:008133
  SBC #$5                                         ;    490 8490 C E9 05           F:008133
  JMP :-                                    ;    492 8492 C 4C 8C 84        F:008133
: STA CurrentAnsweringFamilyMember                ;    495 8495 C 8D DC 04        F:008133
  RTS                                             ;    498 8498 C 60              F:008133

FamilyPalettePPULocation:
  .addr $23E0
  .addr $23E5
FamilyPPUAttributeOfs:
  .byte $00,$06,$0C
FamilyPPUAttributeData:
        ;left side   ;right side
  .byte $88,$D5,$44, $11,$75,$22
  .byte $44,$99,$C4, $31,$66,$11
  .byte $44,$E9,$11, $44,$B6,$11


StageSetFamilyPPUAttributes:
  LDX Family1                                     ;    4B2 84B2 C AE 15 03        F:006105
  LDY FamilyPPUAttributeOfs,X                                  ;    4B5 84B5 C BC 9D 84        F:006105
  LDX #$0                                         ;    4B8 84B8 C A2 00           F:006105
  JSR @UpdateSingleFamily                                    ;    4BA 84BA C 20 C9 84        F:006105
  LDY Family2                                     ;    4BD 84BD C AC 16 03        F:006105
  LDA FamilyPPUAttributeOfs,Y                                  ;    4C0 84C0 C B9 9D 84        F:006105
  CLC                                             ;    4C3 84C3 C 18              F:006105
  ADC #$3                                         ;    4C4 84C4 C 69 03           F:006105
  TAY                                             ;    4C6 84C6 C A8              F:006105
  LDX #$2                                         ;    4C7 84C7 C A2 02           F:006105
@UpdateSingleFamily:
  LDA FamilyPalettePPULocation+1,X                                  ;    4C9 84C9 C BD 9A 84        F:006105
  STA PpuAddr_2006                                ;    4CC 84CC C 8D 06 20        F:006105
  LDA FamilyPalettePPULocation,X                                  ;    4CF 84CF C BD 99 84        F:006105
  STA PpuAddr_2006                                ;    4D2 84D2 C 8D 06 20        F:006105
  LDX #$3                                         ;    4D5 84D5 C A2 03           F:006105
@NextByte:
  LDA FamilyPPUAttributeData,Y                                  ;    4D7 84D7 C B9 A0 84        F:006105
  STA PpuData_2007                                ;    4DA 84DA C 8D 07 20        F:006105
  INY                                             ;    4DD 84DD C C8              F:006105
  DEX                                             ;    4DE 84DE C CA              F:006105
  BNE @NextByte                                    ;    4DF 84DF C D0 F6           F:006105
  RTS                                             ;    4E1 84E1 C 60              F:006105

FamilyCHRBanks:
.byte $02,$03                                     ;    4E2 84E2 DD       ??       F:008274
.byte $04                                         ;    4E4 84E4 D        ?        F:023711
L_0_04E5:
  LDA #UserAnswerOperation_PlayerNotAnswering         ;    4E5 84E5 C A9 01           F:008271
  STA UserAnswerOperation                         ;    4E7 84E7 C 8D 70 03        F:008271
  LDA #$20                                        ;    4EA 84EA C A9 20           F:008271
  STA PpuAddr_2006                                ;    4EC 84EC C 8D 06 20        F:008271
  LDA #$0                                         ;    4EF 84EF C A9 00           F:008271
  STA PpuAddr_2006                                ;    4F1 84F1 C 8D 06 20        F:008271
  LDA #$1                                         ;    4F4 84F4 C A9 01           F:008271
  LDY #$9                                         ;    4F6 84F6 C A0 09           F:008271
B_0_04F8:
  LDX #$20                                        ;    4F8 84F8 C A2 20           F:008271
B_0_04FA:
  STA PpuData_2007                                ;    4FA 84FA C 8D 07 20        F:008271
  DEX                                             ;    4FD 84FD C CA              F:008271
  BNE B_0_04FA                                    ;    4FE 84FE C D0 FA           F:008271
  DEY                                             ;    500 8500 C 88              F:008271
  BNE B_0_04F8                                    ;    501 8501 C D0 F5           F:008271
  LDY #$0                                         ;    503 8503 C A0 00           F:008271
B_0_0505:
  LDA D_0_0CF9,Y                                  ;    505 8505 C B9 F9 8C        F:008271
  STA PpuAddr_2006                                ;    508 8508 C 8D 06 20        F:008271
  LDA D_0_0CF8,Y                                  ;    50B 850B C B9 F8 8C        F:008271
  STA PpuAddr_2006                                ;    50E 850E C 8D 06 20        F:008271
  LDA D_0_0D08,X                                  ;    511 8511 C BD 08 8D        F:008271
  STA PpuData_2007                                ;    514 8514 C 8D 07 20        F:008271
  LDA D_0_0D09,X                                  ;    517 8517 C BD 09 8D        F:008271
  STA BGDrawPPUAddress+1                          ;    51A 851A C 85 17           F:008271
  LDA D_0_0D0A,X                                  ;    51C 851C C BD 0A 8D        F:008271
B_0_051F:
  STA PpuData_2007                                ;    51F 851F C 8D 07 20        F:008271
  DEC BGDrawPPUAddress+1                          ;    522 8522 C C6 17           F:008271
  BNE B_0_051F                                    ;    524 8524 C D0 F9           F:008271
  LDA D_0_0D0B,X                                  ;    526 8526 C BD 0B 8D        F:008271
  STA PpuData_2007                                ;    529 8529 C 8D 07 20        F:008271
  INX                                             ;    52C 852C C E8              F:008271
  INX                                             ;    52D 852D C E8              F:008271
  INX                                             ;    52E 852E C E8              F:008271
  INX                                             ;    52F 852F C E8              F:008271
  INY                                             ;    530 8530 C C8              F:008271
  INY                                             ;    531 8531 C C8              F:008271
  CPY #$10                                        ;    532 8532 C C0 10           F:008271
  BNE B_0_0505                                    ;    534 8534 C D0 CF           F:008271
  LDA QuestionTopBackgroundTile                   ;    536 8536 C AD 12 03        F:008272
  BNE B_0_0542                                    ;    539 8539 C D0 07           F:008272
  LDA ActiveFamily                                ;    53B 853B C A5 0B           F:008272
  CMP #$1                                         ;    53D 853D C C9 01           F:008272
  BNE B_0_0542                                    ;    53F 853F C D0 01           F:008272
  RTS                                             ;    541 8541 C 60              F:010031

B_0_0542:
  LDA IsInFastMoney                                      ;    542 8542 C AD 43 05        F:008272
  BNE B_0_05B2                                    ;    545 8545 C D0 6B           F:008272
  LDA #$F                                         ;    547 8547 C A9 0F           F:008272
  JSR BCDConverter                                    ;    549 8549 C 20 5E AA        F:008272
  LDA #$20                                        ;    54C 854C C A9 20           F:008272
  STA PpuAddr_2006                                ;    54E 854E C 8D 06 20        F:008272
  LDA #$62                                        ;    551 8551 C A9 62           F:008272
  STA PpuAddr_2006                                ;    553 8553 C 8D 06 20        F:008272
  LDY #$5                                         ;    556 8556 C A0 05           F:008272
B_0_0558:
  LDX B_0_05B2,Y                                  ;    558 8558 C BE B2 85        F:008272
  LDA D_0_0F66,X                                  ;    55B 855B C BD 66 8F        F:008272
  STA PpuData_2007                                ;    55E 855E C 8D 07 20        F:008272
  DEY                                             ;    561 8561 C 88              F:008272
  BNE B_0_0558                                    ;    562 8562 C D0 F4           F:008272
  LDA #$1                                         ;    564 8564 C A9 01           F:008272
  STA PpuData_2007                                ;    566 8566 C 8D 07 20        F:008272
B_0_0569:
  LDX BCDOutput+2,Y                                    ;    569 8569 C BE C0 04        F:008272
  CPX #$20                                        ;    56C 856C C E0 20           F:008272
  BEQ B_0_0576                                    ;    56E 856E C F0 06           F:008272
  LDA D_0_0F66,X                                  ;    570 8570 C BD 66 8F        F:008272
  STA PpuData_2007                                ;    573 8573 C 8D 07 20        F:008272
B_0_0576:
  INY                                             ;    576 8576 C C8              F:008272
  CPY #$3                                         ;    577 8577 C C0 03           F:008272
  BNE B_0_0569                                    ;    579 8579 C D0 EE           F:008272
  LDA CurrentRoundNumber                          ;    57B 857B C AD 10 03        F:008272
  CMP #$3                                         ;    57E 857E C C9 03           F:008272
  BCC B_0_05B2                                    ;    580 8580 C 90 30           F:008272
  LDA #$20                                        ;    582 8582 C A9 20           F:017055
  STA PpuAddr_2006                                ;    584 8584 C 8D 06 20        F:017055
  LDA #$82                                        ;    587 8587 C A9 82           F:017055
  STA PpuAddr_2006                                ;    589 8589 C 8D 06 20        F:017055
  LDY #$6                                         ;    58C 858C C A0 06           F:017055
B_0_058E:
  LDX D_0_05B7,Y                                  ;    58E 858E C BE B7 85        F:017055
  LDA D_0_0F66,X                                  ;    591 8591 C BD 66 8F        F:017055
  STA PpuData_2007                                ;    594 8594 C 8D 07 20        F:017055
  DEY                                             ;    597 8597 C 88              F:017055
  BNE B_0_058E                                    ;    598 8598 C D0 F4           F:017055
  LDA #$20                                        ;    59A 859A C A9 20           F:017055
  STA PpuAddr_2006                                ;    59C 859C C 8D 06 20        F:017055
  LDA #$A2                                        ;    59F 859F C A9 A2           F:017055
  STA PpuAddr_2006                                ;    5A1 85A1 C 8D 06 20        F:017055
  LDY #$6                                         ;    5A4 85A4 C A0 06           F:017055
B_0_05A6:
  LDX D_0_05BD,Y                                  ;    5A6 85A6 C BE BD 85        F:017055
  LDA D_0_0F66,X                                  ;    5A9 85A9 C BD 66 8F        F:017055
  STA PpuData_2007                                ;    5AC 85AC C 8D 07 20        F:017055
  DEY                                             ;    5AF 85AF C 88              F:017055
  BNE B_0_05A6                                    ;    5B0 85B0 C D0 F4           F:017055
B_0_05B2:
  RTS                                             ;    5B2 85B2 C 60              F:008272

.byte $44,$4E,$55,$4F                             ;    5B3 85B3 DDDD     DNUO     F:008272
D_0_05B7:
.byte $52                                         ;    5B7 85B7 D        R        F:008272
.byte $45,$4C,$42,$55,$4F                         ;    5B8 85B8 DDDDD    ELBUO    F:017055
D_0_05BD:
.byte $44,$53,$54,$4E,$49,$4F,$50                 ;    5BD 85BD DDDDDDD  DSTNIOP  F:017055


L_0_05C4:
  LDA QuestionTopBackgroundTile                   ;    5C4 85C4 C AD 12 03        F:008604
  BNE B_0_05CE                                    ;    5C7 85C7 C D0 05           F:008604
  LDA ActiveFamily                                ;    5C9 85C9 C A5 0B           F:008604
  BEQ B_0_05CE                                    ;    5CB 85CB C F0 01           F:008604
  RTS                                             ;    5CD 85CD C 60              F:010031

B_0_05CE:
  JSR L_0_06B0                                    ;    5CE 85CE C 20 B0 86        F:008604
  LDA #$8                                         ;    5D1 85D1 C A9 08           F:008604
  JMP MMC1SetCHR1                                    ;    5D3 85D3 C 4C 68 99        F:008604

L_0_05D6:
  LDA QuestionTopBackgroundTile                   ;    5D6 85D6 C AD 12 03        F:008605
  BNE B_0_05DF                                    ;    5D9 85D9 C D0 04           F:008605
  LDA ActiveFamily                                ;    5DB 85DB C A5 0B           F:008605
  BNE B_0_05E7                                    ;    5DD 85DD C D0 08           F:008605
B_0_05DF:
  LDA #$2                                         ;    5DF 85DF C A9 02           F:008605
  STA UserAnswerOperation                         ;    5E1 85E1 C 8D 70 03        F:008605
  JSR L_0_06D9                                    ;    5E4 85E4 C 20 D9 86        F:008605
B_0_05E7:
  RTS                                             ;    5E7 85E7 C 60              F:008605

L_0_05E8:
  LDA QuestionTopBackgroundTile                   ;    5E8 85E8 C AD 12 03        F:008605
  BNE B_0_05F2                                    ;    5EB 85EB C D0 05           F:008605
  LDA ActiveFamily                                ;    5ED 85ED C A5 0B           F:008605
  BEQ B_0_05F2                                    ;    5EF 85EF C F0 01           F:008605
  RTS                                             ;    5F1 85F1 C 60              F:010031

B_0_05F2:
  LDY #$0                                         ;    5F2 85F2 C A0 00           F:008605
  LDX #$0                                         ;    5F4 85F4 C A2 00           F:008605
  LDA R_0372                                      ;    5F6 85F6 C AD 72 03        F:008605
  BNE B_0_061F                                    ;    5F9 85F9 C D0 24           F:008605
B_0_05FB:
  LDA D_0_0E4F,Y                                  ;    5FB 85FB C B9 4F 8E        F:008605
  STA PpuAddr_2006                                ;    5FE 85FE C 8D 06 20        F:008605
  LDA D_0_0E4E,Y                                  ;    601 8601 C B9 4E 8E        F:008605
  STA PpuAddr_2006                                ;    604 8604 C 8D 06 20        F:008605
  LDA #$9                                         ;    607 8607 C A9 09           F:008605
  STA R_0011                                      ;    609 8609 C 85 11           F:008605
B_0_060B:
  LDA D_0_0E5E,X                                  ;    60B 860B C BD 5E 8E        F:008605
  STA PpuData_2007                                ;    60E 860E C 8D 07 20        F:008605
  INX                                             ;    611 8611 C E8              F:008605
  DEC R_0011                                      ;    612 8612 C C6 11           F:008605
  BNE B_0_060B                                    ;    614 8614 C D0 F5           F:008605
  INY                                             ;    616 8616 C C8              F:008605
  INY                                             ;    617 8617 C C8              F:008605
  CPY #$10                                        ;    618 8618 C C0 10           F:008605
  BNE B_0_05FB                                    ;    61A 861A C D0 DF           F:008605
  JMP L_0_0640                                    ;    61C 861C C 4C 40 86        F:008605

B_0_061F:
  LDA D_0_0D29,Y                                  ;    61F 861F C B9 29 8D        F:013161
  STA PpuAddr_2006                                ;    622 8622 C 8D 06 20        F:013161
  LDA D_0_0D28,Y                                  ;    625 8625 C B9 28 8D        F:013161
  STA PpuAddr_2006                                ;    628 8628 C 8D 06 20        F:013161
  LDA #$9                                         ;    62B 862B C A9 09           F:013161
  STA R_0011                                      ;    62D 862D C 85 11           F:013161
B_0_062F:
  LDA D_0_0D38,X                                  ;    62F 862F C BD 38 8D        F:013161
  STA PpuData_2007                                ;    632 8632 C 8D 07 20        F:013161
  INX                                             ;    635 8635 C E8              F:013161
  DEC R_0011                                      ;    636 8636 C C6 11           F:013161
  BNE B_0_062F                                    ;    638 8638 C D0 F5           F:013161
  INY                                             ;    63A 863A C C8              F:013161
  INY                                             ;    63B 863B C C8              F:013161
  CPY #$10                                        ;    63C 863C C C0 10           F:013161
  BNE B_0_061F                                    ;    63E 863E C D0 DF           F:013161
L_0_0640:
  RTS                                             ;    640 8640 C 60              F:008605

L_0_0641:
  LDA QuestionTopBackgroundTile                   ;    641 8641 C AD 12 03        F:008606
  BNE B_0_064B                                    ;    644 8644 C D0 05           F:008606
  LDA ActiveFamily                                ;    646 8646 C A5 0B           F:008606
  BEQ B_0_064B                                    ;    648 8648 C F0 01           F:008606
  RTS                                             ;    64A 864A C 60              F:010031

B_0_064B:
  LDY #$0                                         ;    64B 864B C A0 00           F:008606
  LDX #$0                                         ;    64D 864D C A2 00           F:008606
B_0_064F:
  LDA D_0_0F75,Y                                  ;    64F 864F C B9 75 8F        F:008606
  STA PpuAddr_2006                                ;    652 8652 C 8D 06 20        F:008606
  LDA D_0_0F74,Y                                  ;    655 8655 C B9 74 8F        F:008606
  STA PpuAddr_2006                                ;    658 8658 C 8D 06 20        F:008606
  LDA D_0_0F7A,X                                  ;    65B 865B C BD 7A 8F        F:008606
  STA PpuData_2007                                ;    65E 865E C 8D 07 20        F:008606
  LDA D_0_0F7B,X                                  ;    661 8661 C BD 7B 8F        F:008606
  STA BGDrawPPUAddress+1                          ;    664 8664 C 85 17           F:008606
  LDA D_0_0F7C,X                                  ;    666 8666 C BD 7C 8F        F:008606
B_0_0669:
  STA PpuData_2007                                ;    669 8669 C 8D 07 20        F:008606
  DEC BGDrawPPUAddress+1                          ;    66C 866C C C6 17           F:008606
  BNE B_0_0669                                    ;    66E 866E C D0 F9           F:008606
  LDA D_0_0F7D,X                                  ;    670 8670 C BD 7D 8F        F:008606
  STA PpuData_2007                                ;    673 8673 C 8D 07 20        F:008606
  INX                                             ;    676 8676 C E8              F:008606
  INX                                             ;    677 8677 C E8              F:008606
  INX                                             ;    678 8678 C E8              F:008606
  INX                                             ;    679 8679 C E8              F:008606
  INY                                             ;    67A 867A C C8              F:008606
  INY                                             ;    67B 867B C C8              F:008606
  CPY #$6                                         ;    67C 867C C C0 06           F:008606
  BNE B_0_064F                                    ;    67E 867E C D0 CF           F:008606
  LDX IsInFastMoney                                      ;    680 8680 C AE 43 05        F:008606
  BNE B_0_06A0                                    ;    683 8683 C D0 1B           F:008606
  LDA #$21                                        ;    685 8685 C A9 21           F:008606
  STA PpuAddr_2006                                ;    687 8687 C 8D 06 20        F:008606
  LDA #$59                                        ;    68A 868A C A9 59           F:008606
  STA PpuAddr_2006                                ;    68C 868C C 8D 06 20        F:008606
  LDA #$43                                        ;    68F 868F C A9 43           F:008606
  STA PpuData_2007                                ;    691 8691 C 8D 07 20        F:008606
  LDX #$50                                        ;    694 8694 C A2 50           F:008606
  STX PpuData_2007                                ;    696 8696 C 8E 07 20        F:008606
  STA PpuData_2007                                ;    699 8699 C 8D 07 20        F:008606
  STA PpuData_2007                                ;    69C 869C C 8D 07 20        F:008606
  RTS                                             ;    69F 869F C 60              F:008606

B_0_06A0:
  LDA #$21                                        ;    6A0 86A0 C A9 21           F:041841
  STA PpuAddr_2006                                ;    6A2 86A2 C 8D 06 20        F:041841
  LDA #$5A                                        ;    6A5 86A5 C A9 5A           F:041841
  STA PpuAddr_2006                                ;    6A7 86A7 C 8D 06 20        F:041841
  LDA #$50                                        ;    6AA 86AA C A9 50           F:041841
  STA PpuData_2007                                ;    6AC 86AC C 8D 07 20        F:041841
  RTS                                             ;    6AF 86AF C 60              F:041841

L_0_06B0:
  LDA #$1                                         ;    6B0 86B0 C A9 01           F:008604
  STA R_034A                                      ;    6B2 86B2 C 8D 4A 03        F:008604
  STA R_034B                                      ;    6B5 86B5 C 8D 4B 03        F:008604
  LDA #$0                                         ;    6B8 86B8 C A9 00           F:008604
  STA R_0349                                      ;    6BA 86BA C 8D 49 03        F:008604
  STA UserAnswerInputLength                       ;    6BD 86BD C 8D 5F 03        F:008604
  LDA #$10                                        ;    6C0 86C0 C A9 10           F:008604
  STA R_034C                                      ;    6C2 86C2 C 8D 4C 03        F:008604
  STA R_034D                                      ;    6C5 86C5 C 8D 4D 03        F:008604
  LDY R_0372                                      ;    6C8 86C8 C AC 72 03        F:008604
  LDA D_0_06D7,Y                                  ;    6CB 86CB C B9 D7 86        F:008604
  STA R_0347                                      ;    6CE 86CE C 8D 47 03        F:008604
  LDA #$2                                         ;    6D1 86D1 C A9 02           F:008604
  STA R_0348                                      ;    6D3 86D3 C 8D 48 03        F:008604
  RTS                                             ;    6D6 86D6 C 60              F:008604

D_0_06D7:
.byte $03                                         ;    6D7 86D7 D        ?        F:008604
.byte $05                                         ;    6D8 86D8 D        ?        F:013160
L_0_06D9:
  LDY UserAnswerOperation                         ;    6D9 86D9 C AC 70 03        F:008272
  LDA L_0_06F1,Y                                  ;    6DC 86DC C B9 F1 86        F:008272
  STA SprYPos                                     ;    6DF 86DF C 8D 00 02        F:008272
  LDA #$52                                        ;    6E2 86E2 C A9 52           F:008272
  STA SprTile                                     ;    6E4 86E4 C 8D 01 02        F:008272
  LDA #$20                                        ;    6E7 86E7 C A9 20           F:008272
  STA SprFlag                                     ;    6E9 86E9 C 8D 02 02        F:008272
  LDA #$E0                                        ;    6EC 86EC C A9 E0           F:008272
  STA SprXPos                                     ;    6EE 86EE C 8D 03 02        F:008272
L_0_06F1:
  RTS                                             ;    6F1 86F1 C 60              F:008272

.byte $3D                                         ;    6F2 86F2 D        =        F:008272
.byte $55                                         ;    6F3 86F3 D        U        F:008605
MMC1ResetCHRBanks:
  LDA #$8                                         ;    6F4 86F4 C A9 08           F:006299
  JSR MMC1SetCHR0                                    ;    6F6 86F6 C 20 54 99        F:006299
  LDA #$8                                         ;    6F9 86F9 C A9 08           F:006299
  JMP MMC1SetCHR1                                    ;    6FB 86FB C 4C 68 99        F:006299

.byte $FF,$FF,$FF                                 ;    6FE 86FE ...      ???      
SetFamilyCHRBanks:
  JSR DelayUntilVBlank                                    ;    701 8701 C 20 D0 9B        F:008274
  LDA UserAnswerOperation                         ;    704 8704 C AD 70 03        F:008274
  CMP #$2                                         ;    707 8707 C C9 02           F:008274
  BEQ @DelayShortStart                                    ;    709 8709 C F0 0A           F:008274
  LDY #$3                                         ;    70B 870B C A0 03           F:008274
  LDX #$1F                                        ;    70D 870D C A2 1F           F:008274
: DEX                                             ;    70F 870F C CA              F:008274
  BNE :-                                    ;    710 8710 C D0 FD           F:008274
  DEY                                             ;    712 8712 C 88              F:008274
  BNE :-                                    ;    713 8713 C D0 FA           F:008274
@DelayShortStart:
  LDX #$C2                                        ;    715 8715 C A2 C2           F:008274
: DEX                                             ;    717 8717 C CA              F:008274
  BNE :-                                    ;    718 8718 C D0 FD           F:008274
  LDY Family2                                     ;    71A 871A C AC 16 03        F:008274
  LDA FamilyCHRBanks,Y                                  ;    71D 871D C B9 E2 84        F:008274
  JSR MMC1SetCHR0                                    ;    720 8720 C 20 54 99        F:008274
  LDY Family1                                     ;    723 8723 C AC 15 03        F:008274
  LDA FamilyCHRBanks,Y                                  ;    726 8726 C B9 E2 84        F:008274
  JMP MMC1SetCHR1                                    ;    729 8729 C 4C 68 99        F:008274

PrepareQuestionText:
  STX R_0013                                      ;    72C 872C C 86 13           F:008272
  STY R_0012                                      ;    72E 872E C 84 12           F:008272
  LDX #$5F                                        ;    730 8730 C A2 5F           F:008272
  LDA #$1                                         ;    732 8732 C A9 01           F:008272
: STA QuestionText,X                              ;    734 8734 C 9D E3 04        F:008272
  DEX                                             ;    737 8737 C CA              F:008272
  BPL :-                                    ;    738 8738 C 10 FA           F:008272
  LDX #$2                                         ;    73A 873A C A2 02           F:008272
  STX R_0011                                      ;    73C 873C C 86 11           F:008272
  DEX                                             ;    73E 873E C CA              F:008272
  STX BGDrawPPUAddress                            ;    73F 873F C 86 16           F:008272
  DEX                                             ;    741 8741 C CA              F:008272
B_0_0742:
  LDA #$0                                         ;    742 8742 C A9 00           F:008273
  STA JoypadBoth                                      ;    744 8744 C 85 15           F:008273
  LDY #$0                                         ;    746 8746 C A0 00           F:008273
  LDA (R_0012),Y                                  ;    748 8748 C B1 12           F:008273
  BPL B_0_0750                                    ;    74A 874A C 10 04           F:008273
  AND #$7F                                        ;    74C 874C C 29 7F           F:008273
  STA JoypadBoth                                      ;    74E 874E C 85 15           F:008273
B_0_0750:
  CMP #$7B                                        ;    750 8750 C C9 7B           F:008273
  BCS B_0_075A                                    ;    752 8752 C B0 06           F:008273
  CMP #$61                                        ;    754 8754 C C9 61           F:008273
  BCC B_0_075A                                    ;    756 8756 C 90 02           F:008273
  SBC #$20                                        ;    758 8758 C E9 20           F:008273
B_0_075A:
  CMP #$20                                        ;    75A 875A C C9 20           F:008273
  BEQ B_0_0773                                    ;    75C 875C C F0 15           F:008273
  TAY                                             ;    75E 875E C A8              F:008273
  LDA D_0_0F66,Y                                  ;    75F 875F C B9 66 8F        F:008273
  STA R_034E,X                                    ;    762 8762 C 9D 4E 03        F:008273
  INX                                             ;    765 8765 C E8              F:008273
  LDA JoypadBoth                                      ;    766 8766 C A5 15           F:008273
  BNE B_0_0773                                    ;    768 8768 C D0 09           F:008273
  INC R_0012                                      ;    76A 876A C E6 12           F:008273
  BNE B_0_0742                                    ;    76C 876C C D0 D4           F:008273
  INC R_0013                                      ;    76E 876E . E6 13           
  JMP B_0_0742                                    ;    770 8770 . 4C 42 87        

B_0_0773:
  CPX #$0                                         ;    773 8773 C E0 00           F:008273
  BEQ B_0_07A6                                    ;    775 8775 C F0 2F           F:008273
  STX BGDrawPPUAddress+1                          ;    777 8777 C 86 17           F:008273
  CLC                                             ;    779 8779 C 18              F:008273
  TXA                                             ;    77A 877A C 8A              F:008273
  ADC BGDrawPPUAddress                            ;    77B 877B C 65 16           F:008273
  CMP #$12                                        ;    77D 877D C C9 12           F:008273
  BCC B_0_0789                                    ;    77F 877F C 90 08           F:008273
  LDA #$1                                         ;    781 8781 C A9 01           F:008273
  STA BGDrawPPUAddress                            ;    783 8783 C 85 16           F:008273
  INC R_0011                                      ;    785 8785 C E6 11           F:008273
  INC R_0011                                      ;    787 8787 C E6 11           F:008273
B_0_0789:
  LDA R_0011                                      ;    789 8789 C A5 11           F:008273
  LSR                                             ;    78B 878B C 4A              F:008273
  TAX                                             ;    78C 878C C AA              F:008273
  LDA L_0_07BD,X                                  ;    78D 878D C BD BD 87        F:008273
  CLC                                             ;    790 8790 C 18              F:008273
  ADC BGDrawPPUAddress                            ;    791 8791 C 65 16           F:008273
  TAY                                             ;    793 8793 C A8              F:008273
  LDX #$0                                         ;    794 8794 C A2 00           F:008273
B_0_0796:
  LDA R_034E,X                                    ;    796 8796 C BD 4E 03        F:008273
  STA QuestionVisible,Y                           ;    799 8799 C 99 E2 04        F:008273
  INY                                             ;    79C 879C C C8              F:008273
  INC BGDrawPPUAddress                            ;    79D 879D C E6 16           F:008273
  INX                                             ;    79F 879F C E8              F:008273
  CPX BGDrawPPUAddress+1                          ;    7A0 87A0 C E4 17           F:008273
  BNE B_0_0796                                    ;    7A2 87A2 C D0 F2           F:008273
  INC BGDrawPPUAddress                            ;    7A4 87A4 C E6 16           F:008273
B_0_07A6:
  LDA JoypadBoth                                      ;    7A6 87A6 C A5 15           F:008273
  BNE L_0_07BD                                    ;    7A8 87A8 C D0 13           F:008273
  TAX                                             ;    7AA 87AA C AA              F:008273
  TAY                                             ;    7AB 87AB C A8              F:008273
B_0_07AC:
  INC R_0012                                      ;    7AC 87AC C E6 12           F:008273
  BNE B_0_07B2                                    ;    7AE 87AE C D0 02           F:008273
  INC R_0013                                      ;    7B0 87B0 . E6 13           
B_0_07B2:
  LDA (R_0012),Y                                  ;    7B2 87B2 C B1 12           F:008273
  BPL B_0_07BA                                    ;    7B4 87B4 C 10 04           F:008273
  CMP #$20                                        ;    7B6 87B6 . C9 20           
  BEQ B_0_07AC                                    ;    7B8 87B8 . F0 F2           
B_0_07BA:
  JMP B_0_0742                                    ;    7BA 87BA C 4C 42 87        F:008273

L_0_07BD:
  RTS                                             ;    7BD 87BD C 60              F:008273

.byte $00,$10,$20,$30,$40                         ;    7BE 87BE DDDDD    ?? 0@    F:008273
.byte $50                                         ;    7C3 87C3 .        P        
DrawQuestionText:
  LDA #$20                                        ;    7C4 87C4 C A9 20           F:008273
  STA PpuAddr_2006                                ;    7C6 87C6 C 8D 06 20        F:008273
  LDA #$4D                                        ;    7C9 87C9 C A9 4D           F:008273
  STA PpuAddr_2006                                ;    7CB 87CB C 8D 06 20        F:008273
  LDA QuestionText                                ;    7CE 87CE C AD E3 04        F:008273
  STA PpuData_2007                                ;    7D1 87D1 C 8D 07 20        F:008273
  LDA QuestionText+01                                      ;    7D4 87D4 C AD E4 04        F:008273
  STA PpuData_2007                                ;    7D7 87D7 C 8D 07 20        F:008273
  LDA QuestionText+02                                      ;    7DA 87DA C AD E5 04        F:008273
  STA PpuData_2007                                ;    7DD 87DD C 8D 07 20        F:008273
  LDA QuestionText+03                                      ;    7E0 87E0 C AD E6 04        F:008273
  STA PpuData_2007                                ;    7E3 87E3 C 8D 07 20        F:008273
  LDA QuestionText+04                                      ;    7E6 87E6 C AD E7 04        F:008273
  STA PpuData_2007                                ;    7E9 87E9 C 8D 07 20        F:008273
  LDA QuestionText+05                                      ;    7EC 87EC C AD E8 04        F:008273
  STA PpuData_2007                                ;    7EF 87EF C 8D 07 20        F:008273
  LDA QuestionText+06                                      ;    7F2 87F2 C AD E9 04        F:008273
  STA PpuData_2007                                ;    7F5 87F5 C 8D 07 20        F:008273
  LDA QuestionText+07                                      ;    7F8 87F8 C AD EA 04        F:008273
  STA PpuData_2007                                ;    7FB 87FB C 8D 07 20        F:008273
  LDA QuestionText+08                                      ;    7FE 87FE C AD EB 04        F:008273
  STA PpuData_2007                                ;    801 8801 C 8D 07 20        F:008273
  LDA QuestionText+09                                      ;    804 8804 C AD EC 04        F:008273
  STA PpuData_2007                                ;    807 8807 C 8D 07 20        F:008273
  LDA QuestionText+10                                      ;    80A 880A C AD ED 04        F:008273
  STA PpuData_2007                                ;    80D 880D C 8D 07 20        F:008273
  LDA QuestionText+11                                      ;    810 8810 C AD EE 04        F:008273
  STA PpuData_2007                                ;    813 8813 C 8D 07 20        F:008273
  LDA QuestionText+12                                      ;    816 8816 C AD EF 04        F:008273
  STA PpuData_2007                                ;    819 8819 C 8D 07 20        F:008273
  LDA QuestionText+13                                      ;    81C 881C C AD F0 04        F:008273
  STA PpuData_2007                                ;    81F 881F C 8D 07 20        F:008273
  LDA QuestionText+14                                      ;    822 8822 C AD F1 04        F:008273
  STA PpuData_2007                                ;    825 8825 C 8D 07 20        F:008273
  LDA QuestionText+15                                      ;    828 8828 C AD F2 04        F:008273
  STA PpuData_2007                                ;    82B 882B C 8D 07 20        F:008273
  LDA #$20                                        ;    82E 882E C A9 20           F:008273
  STA PpuAddr_2006                                ;    830 8830 C 8D 06 20        F:008273
  LDA #$6D                                        ;    833 8833 C A9 6D           F:008273
  STA PpuAddr_2006                                ;    835 8835 C 8D 06 20        F:008273
  LDX #$10                                        ;    838 8838 C A2 10           F:008273
  LDA QuestionText,X                              ;    83A 883A C BD E3 04        F:008273
  STA PpuData_2007                                ;    83D 883D C 8D 07 20        F:008273
  LDA QuestionText+01,X                                    ;    840 8840 C BD E4 04        F:008273
  STA PpuData_2007                                ;    843 8843 C 8D 07 20        F:008273
  LDA QuestionText+02,X                                    ;    846 8846 C BD E5 04        F:008273
  STA PpuData_2007                                ;    849 8849 C 8D 07 20        F:008273
  LDA QuestionText+03,X                                    ;    84C 884C C BD E6 04        F:008273
  STA PpuData_2007                                ;    84F 884F C 8D 07 20        F:008273
  LDA QuestionText+04,X                                    ;    852 8852 C BD E7 04        F:008273
  STA PpuData_2007                                ;    855 8855 C 8D 07 20        F:008273
  LDA QuestionText+05,X                                    ;    858 8858 C BD E8 04        F:008273
  STA PpuData_2007                                ;    85B 885B C 8D 07 20        F:008273
  LDA QuestionText+06,X                                    ;    85E 885E C BD E9 04        F:008273
  STA PpuData_2007                                ;    861 8861 C 8D 07 20        F:008273
  LDA QuestionText+07,X                                    ;    864 8864 C BD EA 04        F:008273
  STA PpuData_2007                                ;    867 8867 C 8D 07 20        F:008273
  LDA QuestionText+08,X                                    ;    86A 886A C BD EB 04        F:008273
  STA PpuData_2007                                ;    86D 886D C 8D 07 20        F:008273
  LDA QuestionText+09,X                                    ;    870 8870 C BD EC 04        F:008273
  STA PpuData_2007                                ;    873 8873 C 8D 07 20        F:008273
  LDA QuestionText+10,X                                    ;    876 8876 C BD ED 04        F:008273
  STA PpuData_2007                                ;    879 8879 C 8D 07 20        F:008273
  LDA QuestionText+11,X                                    ;    87C 887C C BD EE 04        F:008273
  STA PpuData_2007                                ;    87F 887F C 8D 07 20        F:008273
  LDA QuestionText+12,X                                    ;    882 8882 C BD EF 04        F:008273
  STA PpuData_2007                                ;    885 8885 C 8D 07 20        F:008273
  LDA QuestionText+13,X                                    ;    888 8888 C BD F0 04        F:008273
  STA PpuData_2007                                ;    88B 888B C 8D 07 20        F:008273
  LDA QuestionText+14,X                                    ;    88E 888E C BD F1 04        F:008273
  STA PpuData_2007                                ;    891 8891 C 8D 07 20        F:008273
  LDA QuestionText+15,X                                    ;    894 8894 C BD F2 04        F:008273
  STA PpuData_2007                                ;    897 8897 C 8D 07 20        F:008273
  LDA #$20                                        ;    89A 889A C A9 20           F:008273
  STA PpuAddr_2006                                ;    89C 889C C 8D 06 20        F:008273
  LDA #$8D                                        ;    89F 889F C A9 8D           F:008273
  STA PpuAddr_2006                                ;    8A1 88A1 C 8D 06 20        F:008273
  LDX #$20                                        ;    8A4 88A4 C A2 20           F:008273
  LDA QuestionText,X                              ;    8A6 88A6 C BD E3 04        F:008273
  STA PpuData_2007                                ;    8A9 88A9 C 8D 07 20        F:008273
  LDA QuestionText+01,X                                    ;    8AC 88AC C BD E4 04        F:008273
  STA PpuData_2007                                ;    8AF 88AF C 8D 07 20        F:008273
  LDA QuestionText+02,X                                    ;    8B2 88B2 C BD E5 04        F:008273
  STA PpuData_2007                                ;    8B5 88B5 C 8D 07 20        F:008273
  LDA QuestionText+03,X                                    ;    8B8 88B8 C BD E6 04        F:008273
  STA PpuData_2007                                ;    8BB 88BB C 8D 07 20        F:008273
  LDA QuestionText+04,X                                    ;    8BE 88BE C BD E7 04        F:008273
  STA PpuData_2007                                ;    8C1 88C1 C 8D 07 20        F:008273
  LDA QuestionText+05,X                                    ;    8C4 88C4 C BD E8 04        F:008273
  STA PpuData_2007                                ;    8C7 88C7 C 8D 07 20        F:008273
  LDA QuestionText+06,X                                    ;    8CA 88CA C BD E9 04        F:008273
  STA PpuData_2007                                ;    8CD 88CD C 8D 07 20        F:008273
  LDA QuestionText+07,X                                    ;    8D0 88D0 C BD EA 04        F:008273
  STA PpuData_2007                                ;    8D3 88D3 C 8D 07 20        F:008273
  LDA QuestionText+08,X                                    ;    8D6 88D6 C BD EB 04        F:008273
  STA PpuData_2007                                ;    8D9 88D9 C 8D 07 20        F:008273
  LDA QuestionText+09,X                                    ;    8DC 88DC C BD EC 04        F:008273
  STA PpuData_2007                                ;    8DF 88DF C 8D 07 20        F:008273
  LDA QuestionText+10,X                                    ;    8E2 88E2 C BD ED 04        F:008273
  STA PpuData_2007                                ;    8E5 88E5 C 8D 07 20        F:008273
  LDA QuestionText+11,X                                    ;    8E8 88E8 C BD EE 04        F:008273
  STA PpuData_2007                                ;    8EB 88EB C 8D 07 20        F:008273
  LDA QuestionText+12,X                                    ;    8EE 88EE C BD EF 04        F:008273
  STA PpuData_2007                                ;    8F1 88F1 C 8D 07 20        F:008273
  LDA QuestionText+13,X                                    ;    8F4 88F4 C BD F0 04        F:008273
  STA PpuData_2007                                ;    8F7 88F7 C 8D 07 20        F:008273
  LDA QuestionText+14,X                                    ;    8FA 88FA C BD F1 04        F:008273
  STA PpuData_2007                                ;    8FD 88FD C 8D 07 20        F:008273
  LDA QuestionText+15,X                                    ;    900 8900 C BD F2 04        F:008273
  STA PpuData_2007                                ;    903 8903 C 8D 07 20        F:008273
  LDA #$20                                        ;    906 8906 C A9 20           F:008273
  STA PpuAddr_2006                                ;    908 8908 C 8D 06 20        F:008273
  LDA #$AD                                        ;    90B 890B C A9 AD           F:008273
  STA PpuAddr_2006                                ;    90D 890D C 8D 06 20        F:008273
  LDX #$30                                        ;    910 8910 C A2 30           F:008273
  LDA QuestionText,X                              ;    912 8912 C BD E3 04        F:008273
  STA PpuData_2007                                ;    915 8915 C 8D 07 20        F:008273
  LDA QuestionText+01,X                                    ;    918 8918 C BD E4 04        F:008273
  STA PpuData_2007                                ;    91B 891B C 8D 07 20        F:008273
  LDA QuestionText+02,X                                    ;    91E 891E C BD E5 04        F:008273
  STA PpuData_2007                                ;    921 8921 C 8D 07 20        F:008273
  LDA QuestionText+03,X                                    ;    924 8924 C BD E6 04        F:008273
  STA PpuData_2007                                ;    927 8927 C 8D 07 20        F:008273
  LDA QuestionText+04,X                                    ;    92A 892A C BD E7 04        F:008273
  STA PpuData_2007                                ;    92D 892D C 8D 07 20        F:008273
  LDA QuestionText+05,X                                    ;    930 8930 C BD E8 04        F:008273
  STA PpuData_2007                                ;    933 8933 C 8D 07 20        F:008273
  LDA QuestionText+06,X                                    ;    936 8936 C BD E9 04        F:008273
  STA PpuData_2007                                ;    939 8939 C 8D 07 20        F:008273
  LDA QuestionText+07,X                                    ;    93C 893C C BD EA 04        F:008273
  STA PpuData_2007                                ;    93F 893F C 8D 07 20        F:008273
  LDA QuestionText+08,X                                    ;    942 8942 C BD EB 04        F:008273
  STA PpuData_2007                                ;    945 8945 C 8D 07 20        F:008273
  LDA QuestionText+09,X                                    ;    948 8948 C BD EC 04        F:008273
  STA PpuData_2007                                ;    94B 894B C 8D 07 20        F:008273
  LDA QuestionText+10,X                                    ;    94E 894E C BD ED 04        F:008273
  STA PpuData_2007                                ;    951 8951 C 8D 07 20        F:008273
  LDA QuestionText+11,X                                    ;    954 8954 C BD EE 04        F:008273
  STA PpuData_2007                                ;    957 8957 C 8D 07 20        F:008273
  LDA QuestionText+12,X                                    ;    95A 895A C BD EF 04        F:008273
  STA PpuData_2007                                ;    95D 895D C 8D 07 20        F:008273
  LDA QuestionText+13,X                                    ;    960 8960 C BD F0 04        F:008273
  STA PpuData_2007                                ;    963 8963 C 8D 07 20        F:008273
  LDA QuestionText+14,X                                    ;    966 8966 C BD F1 04        F:008273
  STA PpuData_2007                                ;    969 8969 C 8D 07 20        F:008273
  LDA QuestionText+15,X                                    ;    96C 896C C BD F2 04        F:008273
  STA PpuData_2007                                ;    96F 896F C 8D 07 20        F:008273
  LDA #$20                                        ;    972 8972 C A9 20           F:008273
  STA PpuAddr_2006                                ;    974 8974 C 8D 06 20        F:008273
  LDA #$CD                                        ;    977 8977 C A9 CD           F:008273
  STA PpuAddr_2006                                ;    979 8979 C 8D 06 20        F:008273
  LDX #$40                                        ;    97C 897C C A2 40           F:008273
  LDA QuestionText,X                              ;    97E 897E C BD E3 04        F:008273
  STA PpuData_2007                                ;    981 8981 C 8D 07 20        F:008273
  LDA QuestionText+01,X                                    ;    984 8984 C BD E4 04        F:008273
  STA PpuData_2007                                ;    987 8987 C 8D 07 20        F:008273
  LDA QuestionText+02,X                                    ;    98A 898A C BD E5 04        F:008273
  STA PpuData_2007                                ;    98D 898D C 8D 07 20        F:008273
  LDA QuestionText+03,X                                    ;    990 8990 C BD E6 04        F:008273
  STA PpuData_2007                                ;    993 8993 C 8D 07 20        F:008273
  LDA QuestionText+04,X                                    ;    996 8996 C BD E7 04        F:008273
  STA PpuData_2007                                ;    999 8999 C 8D 07 20        F:008273
  LDA QuestionText+05,X                                    ;    99C 899C C BD E8 04        F:008273
  STA PpuData_2007                                ;    99F 899F C 8D 07 20        F:008273
  LDA QuestionText+06,X                                    ;    9A2 89A2 C BD E9 04        F:008273
  STA PpuData_2007                                ;    9A5 89A5 C 8D 07 20        F:008273
  LDA QuestionText+07,X                                    ;    9A8 89A8 C BD EA 04        F:008273
  STA PpuData_2007                                ;    9AB 89AB C 8D 07 20        F:008273
  LDA QuestionText+08,X                                    ;    9AE 89AE C BD EB 04        F:008273
  STA PpuData_2007                                ;    9B1 89B1 C 8D 07 20        F:008273
  LDA QuestionText+09,X                                    ;    9B4 89B4 C BD EC 04        F:008273
  STA PpuData_2007                                ;    9B7 89B7 C 8D 07 20        F:008273
  LDA QuestionText+10,X                                    ;    9BA 89BA C BD ED 04        F:008273
  STA PpuData_2007                                ;    9BD 89BD C 8D 07 20        F:008273
  LDA QuestionText+11,X                                    ;    9C0 89C0 C BD EE 04        F:008273
  STA PpuData_2007                                ;    9C3 89C3 C 8D 07 20        F:008273
  LDA QuestionText+12,X                                    ;    9C6 89C6 C BD EF 04        F:008273
  STA PpuData_2007                                ;    9C9 89C9 C 8D 07 20        F:008273
  LDA QuestionText+13,X                                    ;    9CC 89CC C BD F0 04        F:008273
  STA PpuData_2007                                ;    9CF 89CF C 8D 07 20        F:008273
  LDA QuestionText+14,X                                    ;    9D2 89D2 C BD F1 04        F:008273
  STA PpuData_2007                                ;    9D5 89D5 C 8D 07 20        F:008273
  LDA QuestionText+15,X                                    ;    9D8 89D8 C BD F2 04        F:008273
  STA PpuData_2007                                ;    9DB 89DB C 8D 07 20        F:008273
  LDA #$20                                        ;    9DE 89DE C A9 20           F:008273
  STA PpuAddr_2006                                ;    9E0 89E0 C 8D 06 20        F:008273
  LDA #$ED                                        ;    9E3 89E3 C A9 ED           F:008273
  STA PpuAddr_2006                                ;    9E5 89E5 C 8D 06 20        F:008273
  LDX #$50                                        ;    9E8 89E8 C A2 50           F:008273
  LDA QuestionText,X                              ;    9EA 89EA C BD E3 04        F:008273
  STA PpuData_2007                                ;    9ED 89ED C 8D 07 20        F:008273
  LDA QuestionText+01,X                                    ;    9F0 89F0 C BD E4 04        F:008273
  STA PpuData_2007                                ;    9F3 89F3 C 8D 07 20        F:008273
  LDA QuestionText+02,X                                    ;    9F6 89F6 C BD E5 04        F:008273
  STA PpuData_2007                                ;    9F9 89F9 C 8D 07 20        F:008273
  LDA QuestionText+03,X                                    ;    9FC 89FC C BD E6 04        F:008273
  STA PpuData_2007                                ;    9FF 89FF C 8D 07 20        F:008273
  RTS                                             ;    A02 8A02 C 60              F:008273

L_0_0A03:
  LDA QuestionTopBackgroundTile                   ;    A03 8A03 C AD 12 03        F:008609
  BNE B_0_0A1A                                    ;    A06 8A06 C D0 12           F:008609
  LDA ActiveFamily                                ;    A08 8A08 C A5 0B           F:008609
  BEQ B_0_0A1A                                    ;    A0A 8A0A C F0 0E           F:008609
  DEC R_04CE                                      ;    A0C 8A0C C CE CE 04        F:009401
  BEQ B_0_0A13                                    ;    A0F 8A0F C F0 02           F:009401
  SEC                                             ;    A11 8A11 C 38              F:009401
  RTS                                             ;    A12 8A12 C 60              F:009401

B_0_0A13:
  LDA #$F0                                        ;    A13 8A13 C A9 F0           F:009520
  STA R_04CE                                      ;    A15 8A15 C 8D CE 04        F:009520
  CLC                                             ;    A18 8A18 C 18              F:009520
  RTS                                             ;    A19 8A19 C 60              F:009520

B_0_0A1A:
  LDA R_035E                                      ;    A1A 8A1A C AD 5E 03        F:008609
  BNE B_0_0A2B                                    ;    A1D 8A1D C D0 0C           F:008609
  LDX #$1                                         ;    A1F 8A1F C A2 01           F:008609
  STX R_035E                                      ;    A21 8A21 C 8E 5E 03        F:008609
  DEX                                             ;    A24 8A24 C CA              F:008609
  STX UserAnswerInputLength                       ;    A25 8A25 C 8E 5F 03        F:008609
  STX UserAnswerInput                             ;    A28 8A28 C 8E 60 03        F:008609
B_0_0A2B:
  LDA R_04CB                                      ;    A2B 8A2B C AD CB 04        F:008609
  ORA R_04CC                                      ;    A2E 8A2E C 0D CC 04        F:008609
  ORA R_04CD                                      ;    A31 8A31 C 0D CD 04        F:008609
  BNE B_0_0A57                                    ;    A34 8A34 C D0 21           F:008609
  LDX R_04CA                                      ;    A36 8A36 C AE CA 04        F:050550
  BNE B_0_0A4C                                    ;    A39 8A39 C D0 11           F:050550
  INX                                             ;    A3B 8A3B C E8              F:050609
  STX R_04CF                                      ;    A3C 8A3C C 8E CF 04        F:050609
  LDX UserAnswerInputLength                       ;    A3F 8A3F C AE 5F 03        F:050609
  BNE B_0_0A85                                    ;    A42 8A42 C D0 41           F:050609
  STX UserAnswerInput                             ;    A44 8A44 . 8E 60 03        
  STX R_035E                                      ;    A47 8A47 . 8E 5E 03        
  CLC                                             ;    A4A 8A4A . 18              
  RTS                                             ;    A4B 8A4B . 60              

B_0_0A4C:
  CPX #$3B                                        ;    A4C 8A4C C E0 3B           F:050550
  BNE B_0_0A57                                    ;    A4E 8A4E C D0 07           F:050550
  LDA #$89                                        ;    A50 8A50 C A9 89           F:050550
  STA R_05F9                                      ;    A52 8A52 C 8D F9 05        F:050550
  SEC                                             ;    A55 8A55 C 38              F:050550
  RTS                                             ;    A56 8A56 C 60              F:050550

B_0_0A57:
  JSR L_0_0A97                                    ;    A57 8A57 C 20 97 8A        F:008609
  BCS B_0_0A80                                    ;    A5A 8A5A C B0 24           F:008609
  LDX UserAnswerInputLength                       ;    A5C 8A5C C AE 5F 03        F:008783
  CMP #$2B                                        ;    A5F 8A5F C C9 2B           F:008783
  BEQ B_0_0A81                                    ;    A61 8A61 C F0 1E           F:008783
  CMP #$2D                                        ;    A63 8A63 C C9 2D           F:008783
  BEQ B_0_0A8F                                    ;    A65 8A65 C F0 28           F:008783
  CPX #$F                                         ;    A67 8A67 C E0 0F           F:008783
  BEQ B_0_0A80                                    ;    A69 8A69 C F0 15           F:008783
  CMP #$20                                        ;    A6B 8A6B C C9 20           F:008783
  BNE B_0_0A78                                    ;    A6D 8A6D C D0 09           F:008783
  CPX #$0                                         ;    A6F 8A6F . E0 00           
  BEQ B_0_0A80                                    ;    A71 8A71 . F0 0D           
  CMP UserAnswerInputLength,X                     ;    A73 8A73 . DD 5F 03        
  BEQ B_0_0A80                                    ;    A76 8A76 . F0 08           
B_0_0A78:
  STA UserAnswerInput,X                           ;    A78 8A78 C 9D 60 03        F:008783
  INX                                             ;    A7B 8A7B C E8              F:008783
B_0_0A7C:
  STX UserAnswerInputLength                       ;    A7C 8A7C C 8E 5F 03        F:008783
  SEC                                             ;    A7F 8A7F C 38              F:008783
B_0_0A80:
  RTS                                             ;    A80 8A80 C 60              F:008609

B_0_0A81:
  CPX #$0                                         ;    A81 8A81 C E0 00           F:008882
  BEQ B_0_0A7C                                    ;    A83 8A83 C F0 F7           F:008882
B_0_0A85:
  LDA #$0                                         ;    A85 8A85 C A9 00           F:008882
  STA UserAnswerInput,X                           ;    A87 8A87 C 9D 60 03        F:008882
  STA R_035E                                      ;    A8A 8A8A C 8D 5E 03        F:008882
  CLC                                             ;    A8D 8A8D C 18              F:008882
  RTS                                             ;    A8E 8A8E C 60              F:008882

B_0_0A8F:
  CPX #$0                                         ;    A8F 8A8F C E0 00           F:014073
  BEQ B_0_0A80                                    ;    A91 8A91 C F0 ED           F:014073
  DEX                                             ;    A93 8A93 C CA              F:014073
  JMP B_0_0A7C                                    ;    A94 8A94 C 4C 7C 8A        F:014073

L_0_0A97:
  LDA #$1                                         ;    A97 8A97 C A9 01           F:008609
  STA R_04D0                                      ;    A99 8A99 C 8D D0 04        F:008609
  LDX ActiveFamily                                ;    A9C 8A9C C A6 0B           F:008609
  JSR L_0_1B37                                    ;    A9E 8A9E C 20 37 9B        F:008609
  BCS B_0_0AE1                                    ;    AA1 8AA1 C B0 3E           F:008609
  LDA JoypadInputsCtl0,X                          ;    AA3 8AA3 C B5 EA           F:008691
  AND #$80                                        ;    AA5 8AA5 C 29 80           F:008691
  BNE B_0_0ABC                                    ;    AA7 8AA7 C D0 13           F:008691
  LDA JoypadInputsCtl0,X                          ;    AA9 8AA9 C B5 EA           F:008691
  AND #$F                                         ;    AAB 8AAB C 29 0F           F:008691
  ASL                                             ;    AAD 8AAD C 0A              F:008691
  TAY                                             ;    AAE 8AAE C A8              F:008691
  LDA D_0_0B7D,Y                                  ;    AAF 8AAF C B9 7D 8B        F:008691
  STA R_0012                                      ;    AB2 8AB2 C 85 12           F:008691
  LDA D_0_0B7E,Y                                  ;    AB4 8AB4 C B9 7E 8B        F:008691
  STA R_0013                                      ;    AB7 8AB7 C 85 13           F:008691
  JMP (R_0012)                                    ;    AB9 8AB9 C 6C 12 00        F:008691

B_0_0ABC:
  JSR L_0_0BFB                                    ;    ABC 8ABC C 20 FB 8B        F:008783
  LSR                                             ;    ABF 8ABF C 4A              F:008783
  LSR                                             ;    AC0 8AC0 C 4A              F:008783
  TAY                                             ;    AC1 8AC1 C A8              F:008783
  LDA R_0372                                      ;    AC2 8AC2 C AD 72 03        F:008783
  BEQ B_0_0ACD                                    ;    AC5 8AC5 C F0 06           F:008783
  LDA D_0_0D80,Y                                  ;    AC7 8AC7 C B9 80 8D        F:013184
  JMP L_0_0AD0                                    ;    ACA 8ACA C 4C D0 8A        F:013184

B_0_0ACD:
  LDA D_0_0EA6,Y                                  ;    ACD 8ACD C B9 A6 8E        F:008783
L_0_0AD0:
  PHA                                             ;    AD0 8AD0 C 48              F:008783
  LDA #$1                                         ;    AD1 8AD1 C A9 01           F:008783
  STA R_034A                                      ;    AD3 8AD3 C 8D 4A 03        F:008783
  LDA #$20                                        ;    AD6 8AD6 C A9 20           F:008783
  STA R_034C                                      ;    AD8 8AD8 C 8D 4C 03        F:008783
  JSR L_0_0AF3                                    ;    ADB 8ADB C 20 F3 8A        F:008783
  PLA                                             ;    ADE 8ADE C 68              F:008783
  CLC                                             ;    ADF 8ADF C 18              F:008783
  RTS                                             ;    AE0 8AE0 C 60              F:008783

B_0_0AE1:
  DEC R_034C                                      ;    AE1 8AE1 C CE 4C 03        F:008609
  BNE L_0_0AF3                                    ;    AE4 8AE4 C D0 0D           F:008609
  LDA #$10                                        ;    AE6 8AE6 C A9 10           F:008624
  STA R_034C                                      ;    AE8 8AE8 C 8D 4C 03        F:008624
  LDA R_034A                                      ;    AEB 8AEB C AD 4A 03        F:008624
  EOR #$1                                         ;    AEE 8AEE C 49 01           F:008624
  STA R_034A                                      ;    AF0 8AF0 C 8D 4A 03        F:008624
L_0_0AF3:
  LDA R_0349                                      ;    AF3 8AF3 C AD 49 03        F:008609
  BEQ B_0_0B3F                                    ;    AF6 8AF6 C F0 47           F:008609
  CMP #$3                                         ;    AF8 8AF8 C C9 03           F:008872
  BEQ B_0_0B21                                    ;    AFA 8AFA C F0 25           F:008872
  LDX #$8                                         ;    AFC 8AFC C A2 08           F:029222
  LDA #$0                                         ;    AFE 8AFE C A9 00           F:029222
  JSR L_0_0B53                                    ;    B00 8B00 C 20 53 8B        F:029222
  LDA #$1                                         ;    B03 8B03 C A9 01           F:029222
  STA R_02FD                                      ;    B05 8B05 C 8D FD 02        F:029222
  LDX #$4                                         ;    B08 8B08 C A2 04           F:029222
  LDA #$8                                         ;    B0A 8B0A C A9 08           F:029222
  JSR L_0_0B53                                    ;    B0C 8B0C C 20 53 8B        F:029222
  LDA #$1                                         ;    B0F 8B0F C A9 01           F:029222
  STA R_02F9                                      ;    B11 8B11 C 8D F9 02        F:029222
  LDX #$0                                         ;    B14 8B14 C A2 00           F:029222
  LDA #$10                                        ;    B16 8B16 C A9 10           F:029222
  JSR L_0_0B53                                    ;    B18 8B18 C 20 53 8B        F:029222
  LDA #$1                                         ;    B1B 8B1B C A9 01           F:029222
  STA R_02F5                                      ;    B1D 8B1D C 8D F5 02        F:029222
  RTS                                             ;    B20 8B20 C 60              F:029222

B_0_0B21:
  LDX #$4                                         ;    B21 8B21 C A2 04           F:008872
  LDA #$0                                         ;    B23 8B23 C A9 00           F:008872
  JSR L_0_0B53                                    ;    B25 8B25 C 20 53 8B        F:008872
  LDA #$1                                         ;    B28 8B28 C A9 01           F:008872
  STA R_02F9                                      ;    B2A 8B2A C 8D F9 02        F:008872
  LDX #$0                                         ;    B2D 8B2D C A2 00           F:008872
  LDA #$8                                         ;    B2F 8B2F C A9 08           F:008872
  JSR L_0_0B53                                    ;    B31 8B31 C 20 53 8B        F:008872
  LDA #$1                                         ;    B34 8B34 C A9 01           F:008872
  STA R_02F5                                      ;    B36 8B36 C 8D F5 02        F:008872
  LDA #$FF                                        ;    B39 8B39 C A9 FF           F:008872
  STA R_02FC                                      ;    B3B 8B3B C 8D FC 02        F:008872
  RTS                                             ;    B3E 8B3E C 60              F:008872

B_0_0B3F:
  LDA #$0                                         ;    B3F 8B3F C A9 00           F:008609
  TAX                                             ;    B41 8B41 C AA              F:008609
  JSR L_0_0B53                                    ;    B42 8B42 C 20 53 8B        F:008609
  LDA #$1                                         ;    B45 8B45 C A9 01           F:008609
  STA R_02F5                                      ;    B47 8B47 C 8D F5 02        F:008609
  LDA #$FF                                        ;    B4A 8B4A C A9 FF           F:008609
  STA R_02F8                                      ;    B4C 8B4C C 8D F8 02        F:008609
  STA R_02FC                                      ;    B4F 8B4F C 8D FC 02        F:008609
  RTS                                             ;    B52 8B52 C 60              F:008609

L_0_0B53:
  STA BGDrawPPUAddress+1                          ;    B53 8B53 C 85 17           F:008609
  LDA R_0347                                      ;    B55 8B55 C AD 47 03        F:008609
  ASL                                             ;    B58 8B58 C 0A              F:008609
  ASL                                             ;    B59 8B59 C 0A              F:008609
  ASL                                             ;    B5A 8B5A C 0A              F:008609
  ADC BGDrawPPUAddress+1                          ;    B5B 8B5B C 65 17           F:008609
  STA R_02F7,X                                    ;    B5D 8B5D C 9D F7 02        F:008609
  LDA R_034A                                      ;    B60 8B60 C AD 4A 03        F:008609
  BNE B_0_0B6A                                    ;    B63 8B63 C D0 05           F:008609
  LDA #$FF                                        ;    B65 8B65 C A9 FF           F:008624
  JMP L_0_0B73                                    ;    B67 8B67 C 4C 73 8B        F:008624

B_0_0B6A:
  LDA R_0348                                      ;    B6A 8B6A C AD 48 03        F:008609
  ASL                                             ;    B6D 8B6D C 0A              F:008609
  ASL                                             ;    B6E 8B6E C 0A              F:008609
  ASL                                             ;    B6F 8B6F C 0A              F:008609
  SEC                                             ;    B70 8B70 C 38              F:008609
  SBC #$1                                         ;    B71 8B71 C E9 01           F:008609
L_0_0B73:
  STA R_02F4,X                                    ;    B73 8B73 C 9D F4 02        F:008609
  LDA #$3                                         ;    B76 8B76 C A9 03           F:008609
  STA R_02F6,X                                    ;    B78 8B78 C 9D F6 02        F:008609
L_0_0B7B:
  SEC                                             ;    B7B 8B7B C 38              F:008609
  RTS                                             ;    B7C 8B7C C 60              F:008609

D_0_0B7D:
.addr L_0_0B7B                                    ;    B7D 8B7D N 7B 8B
D_0_0B7E = * - 1
.addr L_0_0BA5                                    ;    B7F 8B7F N A5 8B
.addr L_0_0BB5                                    ;    B81 8B81 N B5 8B
.byte $7B,$8B                                     ;    B83 8B83 ..       {?       
.addr L_0_0BAD                                    ;    B85 8B85 N AD 8B
.byte $7B,$8B                                     ;    B87 8B87 ..       {?       
.addr L_0_0B7B                                    ;    B89 8B89 N 7B 8B
.byte $7B,$8B                                     ;    B8B 8B8B ..       {?       
.addr L_0_0B9D                                    ;    B8D 8B8D N 9D 8B
.byte $7B,$8B,$7B,$8B,$7B,$8B,$7B,$8B             ;    B8F 8B8F ........ {?{?{?{? 
.byte $7B,$8B,$7B,$8B,$7B,$8B                     ;    B97 8B97 ......   {?{?{?   
L_0_0B9D:
  JSR L_0_0BFB                                    ;    B9D 8B9D C 20 FB 8B        F:008822
  LDX #$0                                         ;    BA0 8BA0 C A2 00           F:008822
  JMP L_0_0BBA                                    ;    BA2 8BA2 C 4C BA 8B        F:008822

L_0_0BA5:
  JSR L_0_0BFB                                    ;    BA5 8BA5 C 20 FB 8B        F:008721
  LDX #$1                                         ;    BA8 8BA8 C A2 01           F:008721
  JMP L_0_0BBA                                    ;    BAA 8BAA C 4C BA 8B        F:008721

L_0_0BAD:
  JSR L_0_0BFB                                    ;    BAD 8BAD C 20 FB 8B        F:008691
  LDX #$2                                         ;    BB0 8BB0 C A2 02           F:008691
  JMP L_0_0BBA                                    ;    BB2 8BB2 C 4C BA 8B        F:008691

L_0_0BB5:
  JSR L_0_0BFB                                    ;    BB5 8BB5 C 20 FB 8B        F:008761
  LDX #$3                                         ;    BB8 8BB8 C A2 03           F:008761
L_0_0BBA:
  STX BGDrawPPUAddress+1                          ;    BBA 8BBA C 86 17           F:008691
  TYA                                             ;    BBC 8BBC C 98              F:008691
  CLC                                             ;    BBD 8BBD C 18              F:008691
  ADC BGDrawPPUAddress+1                          ;    BBE 8BBE C 65 17           F:008691
  TAY                                             ;    BC0 8BC0 C A8              F:008691
  LDA R_0372                                      ;    BC1 8BC1 C AD 72 03        F:008691
  BEQ B_0_0BCC                                    ;    BC4 8BC4 C F0 06           F:008691
  LDA D_0_0DAA,Y                                  ;    BC6 8BC6 C B9 AA 8D        F:013196
  JMP L_0_0BCF                                    ;    BC9 8BC9 C 4C CF 8B        F:013196

B_0_0BCC:
  LDA D_0_0ED0,Y                                  ;    BCC 8BCC C B9 D0 8E        F:008691
L_0_0BCF:
  PHA                                             ;    BCF 8BCF C 48              F:008691
  AND #$F0                                        ;    BD0 8BD0 C 29 F0           F:008691
  LSR                                             ;    BD2 8BD2 C 4A              F:008691
  LSR                                             ;    BD3 8BD3 C 4A              F:008691
  LSR                                             ;    BD4 8BD4 C 4A              F:008691
  LSR                                             ;    BD5 8BD5 C 4A              F:008691
  STA R_0347                                      ;    BD6 8BD6 C 8D 47 03        F:008691
  LDA #$0                                         ;    BD9 8BD9 C A9 00           F:008691
  STA R_0349                                      ;    BDB 8BDB C 8D 49 03        F:008691
  PLA                                             ;    BDE 8BDE C 68              F:008691
  AND #$F                                         ;    BDF 8BDF C 29 0F           F:008691
  STA R_0348                                      ;    BE1 8BE1 C 8D 48 03        F:008691
  CMP #$6                                         ;    BE4 8BE4 C C9 06           F:008691
  ROL R_0349                                      ;    BE6 8BE6 C 2E 49 03        F:008691
  CMP #$7                                         ;    BE9 8BE9 C C9 07           F:008691
  ROL R_0349                                      ;    BEB 8BEB C 2E 49 03        F:008691
  LDA #$1                                         ;    BEE 8BEE C A9 01           F:008691
  STA R_034A                                      ;    BF0 8BF0 C 8D 4A 03        F:008691
  LDA #$20                                        ;    BF3 8BF3 C A9 20           F:008691
  STA R_034C                                      ;    BF5 8BF5 C 8D 4C 03        F:008691
  JMP L_0_0AF3                                    ;    BF8 8BF8 C 4C F3 8A        F:008691

L_0_0BFB:
  SEC                                             ;    BFB 8BFB C 38              F:008691
  LDA R_0348                                      ;    BFC 8BFC C AD 48 03        F:008691
  LDY R_0372                                      ;    BFF 8BFF C AC 72 03        F:008691
  BNE B_0_0C1D                                    ;    C02 8C02 C D0 19           F:008691
  SBC #$2                                         ;    C04 8C04 C E9 02           F:008691
  STA BGDrawPPUAddress+1                          ;    C06 8C06 C 85 17           F:008691
  ASL                                             ;    C08 8C08 C 0A              F:008691
  ASL                                             ;    C09 8C09 C 0A              F:008691
  ASL                                             ;    C0A 8C0A C 0A              F:008691
  SEC                                             ;    C0B 8C0B C 38              F:008691
  SBC BGDrawPPUAddress+1                          ;    C0C 8C0C C E5 17           F:008691
  STA BGDrawPPUAddress+1                          ;    C0E 8C0E C 85 17           F:008691
  SEC                                             ;    C10 8C10 C 38              F:008691
  LDA R_0347                                      ;    C11 8C11 C AD 47 03        F:008691
  SBC #$3                                         ;    C14 8C14 C E9 03           F:008691
L_0_0C16:
  CLC                                             ;    C16 8C16 C 18              F:008691
  ADC BGDrawPPUAddress+1                          ;    C17 8C17 C 65 17           F:008691
  ASL                                             ;    C19 8C19 C 0A              F:008691
  ASL                                             ;    C1A 8C1A C 0A              F:008691
  TAY                                             ;    C1B 8C1B C A8              F:008691
  RTS                                             ;    C1C 8C1C C 60              F:008691

B_0_0C1D:
  SBC #$2                                         ;    C1D 8C1D C E9 02           F:013184
  STA BGDrawPPUAddress+1                          ;    C1F 8C1F C 85 17           F:013184
  ASL                                             ;    C21 8C21 C 0A              F:013184
  ASL                                             ;    C22 8C22 C 0A              F:013184
  ASL                                             ;    C23 8C23 C 0A              F:013184
  SEC                                             ;    C24 8C24 C 38              F:013184
  SBC BGDrawPPUAddress+1                          ;    C25 8C25 C E5 17           F:013184
  STA BGDrawPPUAddress+1                          ;    C27 8C27 C 85 17           F:013184
  SEC                                             ;    C29 8C29 C 38              F:013184
  LDA R_0347                                      ;    C2A 8C2A C AD 47 03        F:013184
  SBC #$3                                         ;    C2D 8C2D C E9 03           F:013184
  JMP L_0_0C16                                    ;    C2F 8C2F C 4C 16 8C        F:013184

L_0_0C32:
  LDA QuestionTopBackgroundTile                   ;    C32 8C32 C AD 12 03        F:008607
  BNE B_0_0C85                                    ;    C35 8C35 C D0 4E           F:008607
  LDA ActiveFamily                                ;    C37 8C37 C A5 0B           F:008607
  BEQ B_0_0C85                                    ;    C39 8C39 C F0 4A           F:008607
  LDX ActiveFamily                                ;    C3B 8C3B . A6 0B           
  LDY D_0_0FC6,X                                  ;    C3D 8C3D . BC C6 8F        
  STY R_0011                                      ;    C40 8C40 . 84 11           
  LDA #$0                                         ;    C42 8C42 . A9 00           
  STA R_0012                                      ;    C44 8C44 . 85 12           
  STA R_0013                                      ;    C46 8C46 . 85 13           
  LDA #$20                                        ;    C48 8C48 . A9 20           
  STA R_000F                                      ;    C4A 8C4A . 85 0F           
  LDA #$62                                        ;    C4C 8C4C . A9 62           
  STA R_000E                                      ;    C4E 8C4E . 85 0E           
  LDY #$FF                                        ;    C50 8C50 . A0 FF           
L_0_0C52:
  LDA R_000F                                      ;    C52 8C52 . A5 0F           
  STA PpuAddr_2006                                ;    C54 8C54 . 8D 06 20        
  LDA R_000E                                      ;    C57 8C57 . A5 0E           
  STA PpuAddr_2006                                ;    C59 8C59 . 8D 06 20        
  LDA #$A                                         ;    C5C 8C5C . A9 0A           
  STA R_0010                                      ;    C5E 8C5E . 85 10           
B_0_0C60:
  INY                                             ;    C60 8C60 . C8              
  LDA D_0_0C9E,Y                                  ;    C61 8C61 . B9 9E 8C        
  BEQ B_0_0C85                                    ;    C64 8C64 . F0 1F           
  CMP #$78                                        ;    C66 8C66 . C9 78           
  BEQ B_0_0C86                                    ;    C68 8C68 . F0 1C           
B_0_0C6A:
  TAX                                             ;    C6A 8C6A . AA              
  LDA D_0_0F66,X                                  ;    C6B 8C6B . BD 66 8F        
  STA PpuData_2007                                ;    C6E 8C6E . 8D 07 20        
B_0_0C71:
  DEC R_0010                                      ;    C71 8C71 . C6 10           
  BNE B_0_0C60                                    ;    C73 8C73 . D0 EB           
  CLC                                             ;    C75 8C75 . 18              
  LDA R_000E                                      ;    C76 8C76 . A5 0E           
  ADC #$20                                        ;    C78 8C78 . 69 20           
  STA R_000E                                      ;    C7A 8C7A . 85 0E           
  LDA R_000F                                      ;    C7C 8C7C . A5 0F           
  ADC #$0                                         ;    C7E 8C7E . 69 00           
  STA R_000F                                      ;    C80 8C80 . 85 0F           
  JMP L_0_0C52                                    ;    C82 8C82 . 4C 52 8C        

B_0_0C85:
  RTS                                             ;    C85 8C85 C 60              F:008607

B_0_0C86:
  LDX R_0012                                      ;    C86 8C86 . A6 12           
  BNE B_0_0C71                                    ;    C88 8C88 . D0 E7           
  LDA R_0013                                      ;    C8A 8C8A . A5 13           
  INC R_0013                                      ;    C8C 8C8C . E6 13           
  CLC                                             ;    C8E 8C8E . 18              
  ADC R_0011                                      ;    C8F 8C8F . 65 11           
  TAX                                             ;    C91 8C91 . AA              
  LDA Family1Name,X                               ;    C92 8C92 . BD 00 03        
  BPL B_0_0C6A                                    ;    C95 8C95 . 10 D3           
  STA R_0012                                      ;    C97 8C97 . 85 12           
  AND #$7F                                        ;    C99 8C99 . 29 7F           
  JMP B_0_0C6A                                    ;    C9B 8C9B . 4C 6A 8C        

D_0_0C9E:
.byte $78,$78,$78,$78,$78,$78,$78,$78             ;    C9E 8C9E ........ xxxxxxxx 
.byte $20,$20,$46,$41,$4D,$49,$4C,$59             ;    CA6 8CA6 ........   FAMILY 
.byte $20,$49,$53,$20,$41,$4E,$53,$57             ;    CAE 8CAE ........  IS ANSW 
.byte $45,$52,$49,$4E,$47,$20,$51,$55             ;    CB6 8CB6 ........ ERING QU 
.byte $45,$53,$54,$49,$4F,$4E,$00                 ;    CBE 8CBE .......  ESTION?  
DrawQuestionTopBackgroundColor:
  LDA #$20                                        ;    CC5 8CC5 C A9 20           F:008271
  STA PpuAddr_2006                                ;    CC7 8CC7 C 8D 06 20        F:008271
  LDA #$0                                         ;    CCA 8CCA C A9 00           F:008271
  STA PpuAddr_2006                                ;    CCC 8CCC C 8D 06 20        F:008271
  LDA QuestionTopBackgroundTile                   ;    CCF 8CCF C AD 12 03        F:008271
  BNE @Start                                    ;    CD2 8CD2 C D0 04           F:008271
  LDA ActiveFamily                                ;    CD4 8CD4 C A5 0B           F:008271
  BNE @B_0_0CE8                                    ;    CD6 8CD6 C D0 10           F:008271
@Start:
  LDA #$1                                         ;    CD8 8CD8 C A9 01           F:008271
  LDY #$C                                         ;    CDA 8CDA C A0 0C           F:008271
@NextLine:
  LDX #$20                                        ;    CDC 8CDC C A2 20           F:008271
:
  STA PpuData_2007                                ;    CDE 8CDE C 8D 07 20        F:008271
  DEX                                             ;    CE1 8CE1 C CA              F:008271
  BNE :-                                    ;    CE2 8CE2 C D0 FA           F:008271
  DEY                                             ;    CE4 8CE4 C 88              F:008271
  BNE @NextLine                                    ;    CE5 8CE5 C D0 F5           F:008271
  RTS                                             ;    CE7 8CE7 C 60              F:008271

@B_0_0CE8:
  LDA #$1                                         ;    CE8 8CE8 C A9 01           F:010031
  LDY #$9                                         ;    CEA 8CEA C A0 09           F:010031
@B_0_0CEC:
  LDX #$20                                        ;    CEC 8CEC C A2 20           F:010031
@B_0_0CEE:
  STA PpuData_2007                                ;    CEE 8CEE C 8D 07 20        F:010031
  DEX                                             ;    CF1 8CF1 C CA              F:010031
  BNE @B_0_0CEE                                    ;    CF2 8CF2 C D0 FA           F:010031
  DEY                                             ;    CF4 8CF4 C 88              F:010031
  BNE @B_0_0CEC                                    ;    CF5 8CF5 C D0 F5           F:010031
  RTS                                             ;    CF7 8CF7 C 60              F:010031

D_0_0CF8:
.byte $2C                                         ;    CF8 8CF8 D        ,        F:008271
D_0_0CF9:
.byte $20                                         ;    CF9 8CF9 D                 F:008271
D_0_0CFA:
.byte $4C                                         ;    CFA 8CFA D        L        F:008271
D_0_0CFB:
.byte $20,$6C,$20,$8C,$20,$AC,$20,$CC             ;    CFB 8CFB DDDDDDDD  l ? ? ? F:008271
.byte $20                                         ;    D03 8D03 D                 F:008271
.byte $EC,$20,$0C,$21                             ;    D04 8D04 DDDD     ? ?!     F:008272
D_0_0D08:
.byte $5B                                         ;    D08 8D08 D        [        F:008271
D_0_0D09:
.byte $10                                         ;    D09 8D09 D        ?        F:008271
D_0_0D0A:
.byte $5C                                         ;    D0A 8D0A D        \        F:008271
D_0_0D0B:
.byte $5D,$5E,$10,$01,$5F,$5E,$10,$01             ;    D0B 8D0B DDDDDDDD ]^??_^?? F:008271
.byte $5F,$5E,$10,$01,$5F,$5E,$10,$01             ;    D13 8D13 DDDDDDDD _^??_^?? F:008271
.byte $5F,$5E,$10,$01                             ;    D1B 8D1B DDDD     _^??     F:008271
.byte $5F,$5E,$10,$01,$5F,$60,$10,$61             ;    D1F 8D1F DDDDDDDD _^??_`?a F:008272
.byte $62                                         ;    D27 8D27 D        b        F:008272
D_0_0D28:
.byte $22                                         ;    D28 8D28 D        "        F:013161
D_0_0D29:
.byte $20,$42,$20,$62,$20,$82,$20,$A2             ;    D29 8D29 DDDDDDDD  B b ? ? F:013161
.byte $20,$C2,$20,$E2,$20,$02,$21                 ;    D31 8D31 DDDDDDD   ? ? ?!  F:013161
D_0_0D38:
.byte $5B,$5C,$5C,$5C,$5C,$5C,$5C,$5C             ;    D38 8D38 DDDDDDDD [\\\\\\\ F:013161
.byte $5D,$5E,$01,$01,$44,$45,$46,$01             ;    D40 8D40 DDDDDDDD ]^??DEF? F:013161
.byte $01,$5F,$5E,$01,$01,$47,$48,$49             ;    D48 8D48 DDDDDDDD ?_^??GHI F:013161
.byte $01,$01,$5F,$5E,$01,$01,$4A,$4B             ;    D50 8D50 DDDDDDDD ??_^??JK F:013161
.byte $4C,$01,$01,$5F,$5E,$01,$01,$01             ;    D58 8D58 DDDDDDDD L??_^??? F:013161
.byte $43,$01,$01,$01,$5F,$5E,$01,$01             ;    D60 8D60 DDDDDDDD C???_^?? F:013161
.byte $01,$01,$01,$01,$01,$5F,$5E,$54             ;    D68 8D68 DDDDDDDD ?????_^T F:013161
.byte $55,$01,$01,$01,$56,$57,$5F,$60             ;    D70 8D70 DDDDDDDD U???VW_` F:013161
.byte $61,$61,$61,$61,$61,$61,$61,$62             ;    D78 8D78 DDDDDDDD aaaaaaab F:013161
D_0_0D80:
.byte $2E,$2E                                     ;    D80 8D80 ..       ..       
.byte $31                                         ;    D82 8D82 D        1        F:013184
.byte $32                                         ;    D83 8D83 D        2        F:013983
.byte $33                                         ;    D84 8D84 D        3        F:014375
.byte $2E,$2E,$2E,$2E                             ;    D85 8D85 ....     ....     
.byte $34                                         ;    D89 8D89 D        4        F:014854
.byte $35                                         ;    D8A 8D8A D        5        F:014154
.byte $36                                         ;    D8B 8D8B D        6        F:042653
.byte $2E,$2E,$2E,$2E                             ;    D8C 8D8C ....     ....     
.byte $37                                         ;    D90 8D90 D        7        F:015696
.byte $38                                         ;    D91 8D91 D        8        F:015090
.byte $39,$2E,$2E,$2E,$2E,$2E                     ;    D92 8D92 ......   9.....   
.byte $30                                         ;    D98 8D98 D        0        F:013260
.byte $2E,$2E,$2E,$2E,$2E,$2E,$2E,$2E             ;    D99 8D99 ........ ........ 
.byte $2E,$2E                                     ;    DA1 8DA1 ..       ..       
.byte $2D                                         ;    DA3 8DA3 D        -        F:014073
.byte $2E,$2E,$2E,$2E                             ;    DA4 8DA4 ....     ....     
.byte $2B                                         ;    DA8 8DA8 D        +        F:013310
.byte $2E                                         ;    DA9 8DA9 .        .        
D_0_0DAA:
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DAA 8DAA ........ ???????? 
.byte $37                                         ;    DB2 8DB2 .        7        
.byte $62                                         ;    DB3 8DB3 D        b        F:014023
.byte $53                                         ;    DB4 8DB4 D        S        F:013965
.byte $87                                         ;    DB5 8DB5 D        ?        F:013196
.byte $65                                         ;    DB6 8DB6 D        e        F:014033
.byte $72                                         ;    DB7 8DB7 D        r        F:014364
.byte $63                                         ;    DB8 8DB8 D        c        F:014143
.byte $52                                         ;    DB9 8DB9 D        R        F:013994
.byte $87                                         ;    DBA 8DBA D        ?        F:014384
.byte $53,$73,$62,$00,$00,$00,$00,$00             ;    DBB 8DBB ........ Ssb????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DC3 8DC3 ........ ???????? 
.byte $00,$00,$00                                 ;    DCB 8DCB ...      ???      
.byte $52                                         ;    DCE 8DCE D        R        F:014122
.byte $63                                         ;    DCF 8DCF D        c        F:013973
.byte $54                                         ;    DD0 8DD0 D        T        F:015689
.byte $72                                         ;    DD1 8DD1 .        r        
.byte $62                                         ;    DD2 8DD2 D        b        F:013977
.byte $73                                         ;    DD3 8DD3 D        s        F:042644
.byte $64                                         ;    DD4 8DD4 D        d        F:015083
.byte $53,$72,$54,$74                             ;    DD5 8DD5 ....     SrTt     
.byte $63                                         ;    DD9 8DD9 D        c        F:042659
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DDA 8DDA ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DE2 8DE2 ........ ???????? 
.byte $53                                         ;    DEA 8DEA D        S        F:014110
.byte $64                                         ;    DEB 8DEB .        d        
.byte $37                                         ;    DEC 8DEC D        7        F:015703
.byte $73,$63,$74                                 ;    DED 8DED ...      sct      
.byte $65                                         ;    DF0 8DF0 D        e        F:013251
.byte $54,$73,$87,$87                             ;    DF1 8DF1 ....     Ts??     
.byte $64                                         ;    DF5 8DF5 D        d        F:013238
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DF6 8DF6 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    DFE 8DFE ........ ???????? 
.byte $00,$00,$00,$00,$64                         ;    E06 8E06 .....    ????d    
.byte $87                                         ;    E0B 8E0B D        ?        F:013270
.byte $62                                         ;    E0C 8E0C .        b        
.byte $37                                         ;    E0D 8E0D D        7        F:014054
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E0E 8E0E ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E16 8E16 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E1E 8E1E ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E26 8E26 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E2E 8E2E ........ ???????? 
.byte $54                                         ;    E36 8E36 D        T        F:014091
.byte $87                                         ;    E37 8E37 D        ?        F:015710
.byte $52,$72,$00,$00,$00,$00,$00,$00             ;    E38 8E38 ........ Rr?????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    E40 8E40 ........ ???????? 
.byte $00,$00                                     ;    E48 8E48 ..       ??       
.byte $74                                         ;    E4A 8E4A D        t        F:013228
.byte $52,$72,$37                                 ;    E4B 8E4B ...      Rr7      
D_0_0E4E:
.byte $22                                         ;    E4E 8E4E D        "        F:008605
D_0_0E4F:
.byte $20,$42,$20,$62,$20,$82,$20,$A2             ;    E4F 8E4F DDDDDDDD  B b ? ? F:008605
.byte $20,$C2,$20,$E2,$20,$02,$21                 ;    E57 8E57 DDDDDDD   ? ? ?!  F:008605
D_0_0E5E:
.byte $5B,$5C,$5C,$5C,$5C,$5C,$5C,$5C             ;    E5E 8E5E DDDDDDDD [\\\\\\\ F:008605
.byte $5D,$5E,$29,$2A,$2B,$2C,$2D,$2E             ;    E66 8E66 DDDDDDDD ]^)*+,-. F:008605
.byte $2F,$5F,$5E,$30,$31,$32,$33,$34             ;    E6E 8E6E DDDDDDDD /_^01234 F:008605
.byte $35,$36,$5F,$5E,$37,$38,$39,$3A             ;    E76 8E76 DDDDDDDD 56_^789: F:008605
.byte $3B,$3C,$3D,$5F,$5E,$01,$3E,$3F             ;    E7E 8E7E DDDDDDDD ;<=_^?>? F:008605
.byte $40,$41,$42,$01,$5F,$5E,$01,$01             ;    E86 8E86 DDDDDDDD @AB?_^?? F:008605
.byte $58,$59,$5A,$01,$01,$5F,$5E,$54             ;    E8E 8E8E DDDDDDDD XYZ??_^T F:008605
.byte $55,$01,$01,$01,$56,$57,$5F,$60             ;    E96 8E96 DDDDDDDD U???VW_` F:008605
.byte $61,$61,$61,$61,$61,$61,$61,$62             ;    E9E 8E9E DDDDDDDD aaaaaaab F:008605
D_0_0EA6:
.byte $41                                         ;    EA6 8EA6 D        A        F:027160
.byte $42                                         ;    EA7 8EA7 D        B        F:048359
.byte $43                                         ;    EA8 8EA8 D        C        F:008830
.byte $44                                         ;    EA9 8EA9 D        D        F:029545
.byte $45                                         ;    EAA 8EAA D        E        F:008855
.byte $46                                         ;    EAB 8EAB D        F        F:025239
.byte $47                                         ;    EAC 8EAC D        G        F:024289
.byte $48                                         ;    EAD 8EAD D        H        F:039091
.byte $49                                         ;    EAE 8EAE D        I        F:008783
.byte $4A                                         ;    EAF 8EAF D        J        F:040419
.byte $4B                                         ;    EB0 8EB0 D        K        F:026357
.byte $4C                                         ;    EB1 8EB1 D        L        F:025300
.byte $4D                                         ;    EB2 8EB2 D        M        F:017755
.byte $4E                                         ;    EB3 8EB3 D        N        F:017835
.byte $4F                                         ;    EB4 8EB4 D        O        F:025372
.byte $50                                         ;    EB5 8EB5 D        P        F:017502
.byte $51                                         ;    EB6 8EB6 .        Q        
.byte $52                                         ;    EB7 8EB7 D        R        F:026679
.byte $53                                         ;    EB8 8EB8 D        S        F:024147
.byte $54                                         ;    EB9 8EB9 D        T        F:017858
.byte $55                                         ;    EBA 8EBA D        U        F:024170
.byte $2E                                         ;    EBB 8EBB .        .        
.byte $56                                         ;    EBC 8EBC D        V        F:030430
.byte $57                                         ;    EBD 8EBD D        W        F:052470
.byte $58                                         ;    EBE 8EBE .        X        
.byte $59                                         ;    EBF 8EBF D        Y        F:054372
.byte $5A                                         ;    EC0 8EC0 D        Z        F:065005
.byte $2E,$2E,$2E,$20,$2E,$2E,$2E,$2E             ;    EC1 8EC1 ........ ... .... 
.byte $2D                                         ;    EC9 8EC9 D        -        F:017692
.byte $2E,$2E,$2E,$2E                             ;    ECA 8ECA ....     ....     
.byte $2B                                         ;    ECE 8ECE D        +        F:008882
.byte $2E                                         ;    ECF 8ECF .        .        
D_0_0ED0:
.byte $37                                         ;    ED0 8ED0 D        7        F:026271
.byte $42                                         ;    ED1 8ED1 D        B        F:025141
.byte $33                                         ;    ED2 8ED2 D        3        F:008691
.byte $87                                         ;    ED3 8ED3 D        ?        F:025761
.byte $37                                         ;    ED4 8ED4 D        7        F:052404
.byte $52                                         ;    ED5 8ED5 D        R        F:025159
.byte $43                                         ;    ED6 8ED6 D        C        F:031492
.byte $32                                         ;    ED7 8ED7 D        2        F:026730
.byte $55                                         ;    ED8 8ED8 D        U        F:053051
.byte $62                                         ;    ED9 8ED9 D        b        F:008838
.byte $53                                         ;    EDA 8EDA D        S        F:030351
.byte $42                                         ;    EDB 8EDB D        B        F:026721
.byte $56                                         ;    EDC 8EDC D        V        F:040332
.byte $72                                         ;    EDD 8EDD D        r        F:008847
.byte $63                                         ;    EDE 8EDE D        c        F:029190
.byte $52                                         ;    EDF 8EDF D        R        F:026705
.byte $75                                         ;    EE0 8EE0 D        u        F:056186
.byte $82                                         ;    EE1 8EE1 D        ?        F:008862
.byte $73                                         ;    EE2 8EE2 D        s        F:026651
.byte $62                                         ;    EE3 8EE3 D        b        F:039948
.byte $87                                         ;    EE4 8EE4 D        ?        F:008872
.byte $92                                         ;    EE5 8EE5 D        ?        F:025868
.byte $83                                         ;    EE6 8EE6 D        ?        F:017744
.byte $72                                         ;    EE7 8EE7 D        r        F:025840
.byte $87                                         ;    EE8 8EE8 D        ?        F:024429
.byte $33                                         ;    EE9 8EE9 D        3        F:031672
.byte $93                                         ;    EEA 8EEA D        ?        F:017825
.byte $82                                         ;    EEB 8EEB D        ?        F:017730
.byte $32                                         ;    EEC 8EEC D        2        F:029502
.byte $43                                         ;    EED 8EED D        C        F:008721
.byte $34                                         ;    EEE 8EEE D        4        F:017483
.byte $92                                         ;    EEF 8EEF D        ?        F:017720
.byte $42                                         ;    EF0 8EF0 D        B        F:027143
.byte $53                                         ;    EF1 8EF1 D        S        F:008747
.byte $44                                         ;    EF2 8EF2 D        D        F:029993
.byte $33                                         ;    EF3 8EF3 D        3        F:017802
.byte $52                                         ;    EF4 8EF4 D        R        F:008822
.byte $63                                         ;    EF5 8EF5 D        c        F:026327
.byte $54                                         ;    EF6 8EF6 D        T        F:030360
.byte $43                                         ;    EF7 8EF7 D        C        F:008761
.byte $62                                         ;    EF8 8EF8 D        b        F:026695
.byte $73                                         ;    EF9 8EF9 D        s        F:026335
.byte $64                                         ;    EFA 8EFA D        d        F:029199
.byte $53                                         ;    EFB 8EFB D        S        F:029560
.byte $72                                         ;    EFC 8EFC D        r        F:026636
.byte $83                                         ;    EFD 8EFD D        ?        F:025317
.byte $74                                         ;    EFE 8EFE D        t        F:026660
.byte $63                                         ;    EFF 8EFF D        c        F:026351
.byte $82                                         ;    F00 8F00 D        ?        F:026383
.byte $93                                         ;    F01 8F01 D        ?        F:017760
.byte $84                                         ;    F02 8F02 D        ?        F:017850
.byte $73                                         ;    F03 8F03 D        s        F:025283
.byte $92                                         ;    F04 8F04 D        ?        F:024200
.byte $34                                         ;    F05 8F05 D        4        F:017636
.byte $94                                         ;    F06 8F06 D        ?        F:029924
.byte $83                                         ;    F07 8F07 D        ?        F:017843
.byte $33                                         ;    F08 8F08 D        3        F:017707
.byte $44                                         ;    F09 8F09 D        D        F:017492
.byte $37                                         ;    F0A 8F0A D        7        F:025393
.byte $93                                         ;    F0B 8F0B D        ?        F:017590
.byte $43                                         ;    F0C 8F0C D        C        F:017787
.byte $54                                         ;    F0D 8F0D D        T        F:024119
.byte $45                                         ;    F0E 8F0E D        E        F:017661
.byte $34                                         ;    F0F 8F0F D        4        F:017566
.byte $53                                         ;    F10 8F10 D        S        F:053094
.byte $64                                         ;    F11 8F11 D        d        F:024130
.byte $55                                         ;    F12 8F12 D        U        F:052460
.byte $44                                         ;    F13 8F13 D        D        F:029475
.byte $63                                         ;    F14 8F14 D        c        F:026686
.byte $74                                         ;    F15 8F15 D        t        F:024138
.byte $65                                         ;    F16 8F16 D        e        F:029213
.byte $54                                         ;    F17 8F17 D        T        F:029465
.byte $73                                         ;    F18 8F18 D        s        F:042243
.byte $84                                         ;    F19 8F19 D        ?        F:024154
.byte $75                                         ;    F1A 8F1A D        u        F:040503
.byte $64                                         ;    F1B 8F1B D        d        F:026669
.byte $83                                         ;    F1C 8F1C D        ?        F:059084
.byte $94                                         ;    F1D 8F1D D        ?        F:024164
.byte $85                                         ;    F1E 8F1E D        ?        F:017865
.byte $74                                         ;    F1F 8F1F D        t        F:027074
.byte $93                                         ;    F20 8F20 D        ?        F:024176
.byte $45                                         ;    F21 8F21 D        E        F:027111
.byte $87                                         ;    F22 8F22 .        ?        
.byte $84                                         ;    F23 8F23 D        ?        F:030038
.byte $00,$00,$00,$00                             ;    F24 8F24 ....     ????     
.byte $44                                         ;    F28 8F28 D        D        F:027125
.byte $55                                         ;    F29 8F29 .        U        
.byte $37                                         ;    F2A 8F2A D        7        F:017677
.byte $94                                         ;    F2B 8F2B .        ?        
.byte $54                                         ;    F2C 8F2C D        T        F:053085
.byte $65                                         ;    F2D 8F2D .        e        
.byte $56                                         ;    F2E 8F2E D        V        F:052485
.byte $45,$64                                     ;    F2F 8F2F ..       Ed       
.byte $75                                         ;    F31 8F31 D        u        F:065429
.byte $56                                         ;    F32 8F32 D        V        F:029222
.byte $55                                         ;    F33 8F33 D        U        F:064487
.byte $74                                         ;    F34 8F34 D        t        F:054384
.byte $85                                         ;    F35 8F35 D        ?        F:059185
.byte $56                                         ;    F36 8F36 D        V        F:040512
.byte $65                                         ;    F37 8F37 D        e        F:056203
.byte $84,$87                                     ;    F38 8F38 ..       ??       
.byte $87                                         ;    F3A 8F3A D        ?        F:017874
.byte $75,$00,$00,$00,$00,$00,$00,$00             ;    F3B 8F3B ........ u??????? 
.byte $00,$00,$00,$00,$00                         ;    F43 8F43 .....    ?????    
.byte $65                                         ;    F48 8F48 D        e        F:050588
.byte $87                                         ;    F49 8F49 D        ?        F:029231
.byte $62                                         ;    F4A 8F4A .        b        
.byte $37                                         ;    F4B 8F4B D        7        F:040349
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    F4C 8F4C ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    F54 8F54 ........ ???????? 
.byte $34                                         ;    F5C 8F5C D        4        F:017698
.byte $87                                         ;    F5D 8F5D D        ?        F:026294
.byte $32                                         ;    F5E 8F5E .        2        
.byte $92                                         ;    F5F 8F5F D        ?        F:025419
.byte $00,$00,$00,$00,$00,$00                     ;    F60 8F60 ......   ??????   
D_0_0F66:
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;    F66 8F66 ........ ???????? 
.byte $00,$00                                     ;    F6E 8F6E ..       ??       
.byte $94                                         ;    F70 8F70 D        ?        F:026417
.byte $32                                         ;    F71 8F71 D        2        F:032393
.byte $92                                         ;    F72 8F72 D        ?        F:027021
.byte $37                                         ;    F73 8F73 D        7        F:026302
D_0_0F74:
.byte $22                                         ;    F74 8F74 D        "        F:008606
D_0_0F75:
.byte $21                                         ;    F75 8F75 D        !        F:008606
D_0_0F76:
.byte $42                                         ;    F76 8F76 D        B        F:008606
D_0_0F77:
.byte $21,$62,$21                                 ;    F77 8F77 DDD      !b!      F:008606
D_0_0F7A:
.byte $5B                                         ;    F7A 8F7A D        [        F:008606
D_0_0F7B:
.byte $1A                                         ;    F7B 8F7B D        ?        F:008606
D_0_0F7C:
.byte $5C                                         ;    F7C 8F7C D        \        F:008606
D_0_0F7D:
.byte $5D,$5E,$1A,$01,$5F,$60,$1A,$61             ;    F7D 8F7D DDDDDDDD ]^??_`?a F:008606
.byte $62                                         ;    F85 8F85 D        b        F:008606
.byte $01                                         ;    F86 8F86 D        ?        F:008610
.byte $01,$51,$01,$01,$01,$01                     ;    F87 8F87 ......   ?Q????   
.byte $4D                                         ;    F8D 8F8D D        M        F:009400
.byte $01,$01,$01,$01,$4E,$4F,$01                 ;    F8E 8F8E .......  ????NO?  
.byte $53                                         ;    F95 8F95 D        S        F:013653
.byte $43                                         ;    F96 8F96 D        C        F:008273
.byte $44                                         ;    F97 8F97 D        D        F:008272
.byte $45                                         ;    F98 8F98 D        E        F:008789
.byte $46                                         ;    F99 8F99 D        F        F:008729
.byte $47,$48                                     ;    F9A 8F9A DD       GH       F:008610
.byte $49                                         ;    F9C 8F9C D        I        F:008273
.byte $4A                                         ;    F9D 8F9D D        J        F:015697
.byte $4B                                         ;    F9E 8F9E D        K        F:015095
.byte $4C                                         ;    F9F 8F9F D        L        F:017810
.byte $50,$01,$01,$01,$01,$01,$01                 ;    FA0 8FA0 .......  P??????  
.byte $29,$2A                                     ;    FA7 8FA7 DD       )*       F:008273
.byte $2B                                         ;    FA9 8FA9 D        +        F:008831
.byte $2C                                         ;    FAA 8FAA D        ,        F:008272
.byte $2D,$2E                                     ;    FAB 8FAB DD       -.       F:008273
.byte $2F                                         ;    FAD 8FAD D        /        F:008589
.byte $30                                         ;    FAE 8FAE D        0        F:008273
.byte $31                                         ;    FAF 8FAF D        1        F:008589
.byte $32                                         ;    FB0 8FB0 D        2        F:040420
.byte $33                                         ;    FB1 8FB1 D        3        F:026358
.byte $34                                         ;    FB2 8FB2 D        4        F:008273
.byte $35                                         ;    FB3 8FB3 D        5        F:008589
.byte $36,$37                                     ;    FB4 8FB4 DD       67       F:008272
.byte $38                                         ;    FB6 8FB6 D        8        F:008273
.byte $39                                         ;    FB7 8FB7 D        9        F:038394
.byte $3A                                         ;    FB8 8FB8 D        :        F:008272
.byte $3B,$3C                                     ;    FB9 8FB9 DD       ;<       F:008273
.byte $3D                                         ;    FBB 8FBB D        =        F:008272
.byte $3E,$3F                                     ;    FBC 8FBC DD       >?       F:008273
.byte $40                                         ;    FBE 8FBE .        @        
.byte $41                                         ;    FBF 8FBF D        A        F:008273
.byte $42                                         ;    FC0 8FC0 D        B        F:065006
.byte $01,$01,$01,$53,$52                         ;    FC1 8FC1 .....    ???SR    
D_0_0FC6:
.byte $00,$08                                     ;    FC6 8FC6 DD       ??       F:006105
D_0_0FC8:
.byte $0D                                         ;    FC8 8FC8 D        ?        F:006295
.byte $0E                                         ;    FC9 8FC9 D        ?        F:007144
FamilyCHR:
.byte $05                                         ;    FCA 8FCA D        ?        F:007149
.byte $06                                         ;    FCB 8FCB D        ?        F:006300
.byte $07                                         ;    FCC 8FCC D        ?        F:023620
D_0_0FCD:
.byte $AA                                         ;    FCD 8FCD D        ?        F:010031
.byte $AB                                         ;    FCE 8FCE D        ?        F:006298
.byte $AC                                         ;    FCF 8FCF D        ?        F:010400
.byte $AD                                         ;    FD0 8FD0 D        ?        F:011987
D_0_0FD1:
.byte $04                                         ;    FD1 8FD1 D        ?        F:013955
D_0_0FD2:
.byte $05                                         ;    FD2 8FD2 D        ?        F:013955
.byte $06,$07,$08,$09,$0A,$0B,$0C,$0D             ;    FD3 8FD3 ........ ???????? 
.byte $0E,$0F,$08,$10                             ;    FDB 8FDB ....     ????     
.byte $11,$12                                     ;    FDF 8FDF DD       ??       F:010031
.byte $13,$14,$15,$16,$17,$18,$19,$1A             ;    FE1 8FE1 ........ ???????? 
.byte $1B,$1C                                     ;    FE9 8FE9 DD       ??       F:010031
.byte $1D,$1E,$08,$1F                             ;    FEB 8FEB ....     ????     
.byte $20,$21                                     ;    FEF 8FEF DD        !       F:010031
.byte $08,$42                                     ;    FF1 8FF1 ..       ?B       
.byte $20,$43                                     ;    FF3 8FF3 DD        C       F:010031
.byte $44,$45,$46,$47                             ;    FF5 8FF5 ....     DEFG     
.byte $48,$49                                     ;    FF9 8FF9 DD       HI       F:010031
.byte $4A,$4B,$4C,$4D,$4E,$4F                     ;    FFB 8FFB ......   JKLMNO   
.byte $50,$51                                     ;   1001 9001 DD       PQ       F:010031
.byte $52,$53                                     ;   1003 9003 ..       RS       
D_0_1005:
.byte $80                                         ;   1005 9005 D        ?        F:006295
.byte $00                                         ;   1006 9006 D        ?        F:007144
D_0_1007:
.byte $0D                                         ;   1007 9007 D        ?        F:006295
.byte $00                                         ;   1008 9008 D        ?        F:007144
D_0_1009:
.byte $40                                         ;   1009 9009 D        @        F:014663
.byte $40                                         ;   100A 900A D        @        F:011375
D_0_100B:
.byte $0D                                         ;   100B 900B D        ?        F:014663
.byte $00                                         ;   100C 900C D        ?        F:011375
D_0_100D:
.byte $80                                         ;   100D 900D D        ?        F:006295
.byte $81                                         ;   100E 900E D        ?        F:007144
D_0_100F:
.byte $80,$80                                     ;   100F 900F ..       ??       
.byte $8A                                         ;   1011 9011 D        ?        F:010400
.byte $86                                         ;   1012 9012 D        ?        F:011987
D_0_1013:
.byte $07                                         ;   1013 9013 D        ?        F:007147
.byte $08                                         ;   1014 9014 D        ?        F:006298
.byte $09                                         ;   1015 9015 D        ?        F:023618
D_0_1016:
.byte $00                                         ;   1016 9016 D        ?        F:010029
.byte $00                                         ;   1017 9017 D        ?        F:013953
.byte $00                                         ;   1018 9018 D        ?        F:018497
.byte $00                                         ;   1019 9019 D        ?        F:039821
.byte $00                                         ;   101A 901A D        ?        F:033699
D_0_101B:
.byte $02                                         ;   101B 901B D        ?        F:010029
.byte $04                                         ;   101C 901C D        ?        F:013953
.byte $06                                         ;   101D 901D D        ?        F:018497
.byte $08                                         ;   101E 901E D        ?        F:039821
.byte $00                                         ;   101F 901F D        ?        F:033699
L_0_1020:
  JSR L_2_52D6                                    ;   1020 9020 C 20 D6 D2        F:010033
  JSR L_2_593E                                    ;   1023 9023 C 20 3E D9        F:010033
  JSR DelayUntilVBlank                                    ;   1026 9026 C 20 D0 9B        F:010033
  LDX #$C4                                        ;   1029 9029 C A2 C4           F:010033
B_0_102B:
  DEX                                             ;   102B 902B C CA              F:010033
  BNE B_0_102B                                    ;   102C 902C C D0 FD           F:010033
  LDX ActiveFamily                                ;   102E 902E C A6 0B           F:010033
  LDY Family1,X                                   ;   1030 9030 C BC 15 03        F:010033
  LDA FamilyCHR,Y                                  ;   1033 9033 C B9 CA 8F        F:010033
  JSR MMC1SetCHR0                                    ;   1036 9036 C 20 54 99        F:010033
  LDA #$C                                         ;   1039 9039 C A9 0C           F:010033
  JSR MMC1SetCHR1                                    ;   103B 903B C 20 68 99        F:010033
  LDA QuestionTopBackgroundTile                   ;   103E 903E C AD 12 03        F:010033
  BNE B_0_104B                                    ;   1041 9041 C D0 08           F:010033
  LDA ActiveFamily                                ;   1043 9043 C A5 0B           F:010033
  BEQ B_0_104E                                    ;   1045 9045 C F0 07           F:010033
  JSR L_0_108D                                    ;   1047 9047 C 20 8D 90        F:010033
  NOP                                             ;   104A 904A C EA              F:010033
B_0_104B:
  JMP B_0_104E                                    ;   104B 904B C 4C 4E 90        F:010033

B_0_104E:
  LDY #$3                                         ;   104E 904E C A0 03           F:010033
  LDX #$D0                                        ;   1050 9050 C A2 D0           F:010033
B_0_1052:
  DEX                                             ;   1052 9052 C CA              F:010033
  BNE B_0_1052                                    ;   1053 9053 C D0 FD           F:010033
  DEY                                             ;   1055 9055 C 88              F:010033
  BNE B_0_1052                                    ;   1056 9056 C D0 FA           F:010033
  JMP L_0_1080                                    ;   1058 9058 C 4C 80 90        F:010033

L_0_105B:
  JSR L_2_52D6                                    ;   105B 905B C 20 D6 D2        F:006300
  JSR L_2_593E                                    ;   105E 905E C 20 3E D9        F:006300
  JSR DelayUntilVBlank                                    ;   1061 9061 C 20 D0 9B        F:006300
  LDX #$15                                        ;   1064 9064 C A2 15           F:006300
B_0_1066:
  DEX                                             ;   1066 9066 C CA              F:006300
  BNE B_0_1066                                    ;   1067 9067 C D0 FD           F:006300
  NOP                                             ;   1069 9069 C EA              F:006300
  LDX #$91                                        ;   106A 906A C A2 91           F:006300
B_0_106C:
  DEX                                             ;   106C 906C C CA              F:006300
  BNE B_0_106C                                    ;   106D 906D C D0 FD           F:006300
  NOP                                             ;   106F 906F C EA              F:006300
  LDX ActiveFamily                                ;   1070 9070 C A6 0B           F:006300
  LDY Family1,X                                   ;   1072 9072 C BC 15 03        F:006300
  LDA FamilyCHR,Y                                  ;   1075 9075 C B9 CA 8F        F:006300
  JSR MMC1SetCHR0                                    ;   1078 9078 C 20 54 99        F:006300
  LDA #$C                                         ;   107B 907B C A9 0C           F:006300
  JSR MMC1SetCHR1                                    ;   107D 907D C 20 68 99        F:006300
L_0_1080:
  LDY #$5                                         ;   1080 9080 C A0 05           F:006300
  LDX #$30                                        ;   1082 9082 C A2 30           F:006300
B_0_1084:
  DEX                                             ;   1084 9084 C CA              F:006300
  BNE B_0_1084                                    ;   1085 9085 C D0 FD           F:006300
  DEY                                             ;   1087 9087 C 88              F:006300
  BNE B_0_1084                                    ;   1088 9088 C D0 FA           F:006300
  JMP L_0_1285                                    ;   108A 908A C 4C 85 92        F:006300

L_0_108D:
  LDY #$3                                         ;   108D 908D C A0 03           F:010033
  LDX #$1D                                        ;   108F 908F C A2 1D           F:010033
B_0_1091:
  DEX                                             ;   1091 9091 C CA              F:010033
  BNE B_0_1091                                    ;   1092 9092 C D0 FD           F:010033
  DEY                                             ;   1094 9094 C 88              F:010033
  BNE B_0_1091                                    ;   1095 9095 C D0 FA           F:010033
  NOP                                             ;   1097 9097 C EA              F:010033
  RTS                                             ;   1098 9098 C 60              F:010033

RunDisplayFamilyScene:
  STA R_0346                                      ;   1099 9099 C 8D 46 03        F:006294
  LDA #$1                                         ;   109C 909C C A9 01           F:006294
  STA R_04DA                                      ;   109E 909E C 8D DA 04        F:006294
L_0_10A1:
  JSR DisplayFamilyScene                                    ;   10A1 90A1 C 20 8A 92        F:006294
L_0_10A4:
  JSR L_0_118D                                    ;   10A4 90A4 C 20 8D 91        F:006299
  LDA #$1                                         ;   10A7 90A7 C A9 01           F:006299
  JSR L_0_19F7                                    ;   10A9 90A9 C 20 F7 99        F:006299
B_0_10AC:
  LDA PaletteDirtyFlagPending                     ;   10AC 90AC C AD 41 03        F:006299
  STA PaletteDirtyFlag                            ;   10AF 90AF C 8D 3D 03        F:006299
  JSR DelayUntilNMI                                    ;   10B2 90B2 C 20 F9 CA        F:006299
  JSR L_0_1A7E                                    ;   10B5 90B5 C 20 7E 9A        F:006300
  LDA R_0346                                      ;   10B8 90B8 C AD 46 03        F:006300
  BNE B_0_1116                                    ;   10BB 90BB C D0 59           F:006300
  JSR L_0_11A2                                    ;   10BD 90BD C 20 A2 91        F:010033
  BCC B_0_10AC                                    ;   10C0 90C0 C 90 EA           F:010033
  LDA IsStealingQuestion                          ;   10C2 90C2 C A5 25           F:010400
  BEQ B_0_10D8                                    ;   10C4 90C4 C F0 12           F:010400
  LDA #$0                                         ;   10C6 90C6 C A9 00           F:034250
  STA R_04BB                                      ;   10C8 90C8 C 8D BB 04        F:034250
  LDA ActiveFamily                                ;   10CB 90CB C A5 0B           F:034250
  EOR R_04C9                                      ;   10CD 90CD C 4D C9 04        F:034250
  CLC                                             ;   10D0 90D0 C 18              F:034250
  ADC #$2                                         ;   10D1 90D1 C 69 02           F:034250
  STA ActiveFamily                                ;   10D3 90D3 C 85 0B           F:034250
  JMP L_2_52B6                                    ;   10D5 90D5 C 4C B6 D2        F:034250

B_0_10D8:
  LDA R_04C9                                      ;   10D8 90D8 C AD C9 04        F:010400
  CMP #$3                                         ;   10DB 90DB C C9 03           F:010400
  BNE B_0_10E2                                    ;   10DD 90DD C D0 03           F:010400
  JMP L_0_1169                                    ;   10DF 90DF C 4C 69 91        F:033561

B_0_10E2:
  LDA R_0393                                      ;   10E2 90E2 C AD 93 03        F:010400
  AND #$F                                         ;   10E5 90E5 C 29 0F           F:010400
  CMP R_0390                                      ;   10E7 90E7 C CD 90 03        F:010400
  BEQ B_0_10FB                                    ;   10EA 90EA C F0 0F           F:010400
  LDX R_04DA                                      ;   10EC 90EC C AE DA 04        F:010400
  LDA D_0_100F,X                                  ;   10EF 90EF C BD 0F 90        F:010400
  STA R_05F9                                      ;   10F2 90F2 C 8D F9 05        F:010400
  JSR L_0_06B0                                    ;   10F5 90F5 C 20 B0 86        F:010400
  JMP L_0_10A4                                    ;   10F8 90F8 C 4C A4 90        F:010400

B_0_10FB:
  LDX R_05C1                                      ;   10FB 90FB C AE C1 05        F:012354
  BMI B_0_1103                                    ;   10FE 90FE C 30 03           F:012354
  JSR L_2_52AA                                    ;   1100 9100 C 20 AA D2        F:012354
B_0_1103:
  LDX R_05C2                                      ;   1103 9103 C AE C2 05        F:012354
  BMI B_0_110B                                    ;   1106 9106 C 30 03           F:012354
  JSR L_2_52AA                                    ;   1108 9108 C 20 AA D2        F:012354
B_0_110B:
  LDX R_05C3                                      ;   110B 910B C AE C3 05        F:012354
  BMI B_0_1113                                    ;   110E 910E C 30 03           F:012354
  JSR L_2_52B0                                    ;   1110 9110 C 20 B0 D2        F:012354
B_0_1113:
  JMP AwardQuestionCash                                    ;   1113 9113 C 4C 08 94        F:012354

B_0_1116:
  LDA R_0346                                      ;   1116 9116 C AD 46 03        F:006300
  BPL B_0_114C                                    ;   1119 9119 C 10 31           F:006300
  JSR L_0_105B                                    ;   111B 911B C 20 5B 90        F:006300
  JSR SoundSystemUpdate                                    ;   111E 911E C 20 96 BA        F:006300
  JSR L_0_163E                                    ;   1121 9121 C 20 3E 96        F:006300
  BCC B_0_1129                                    ;   1124 9124 C 90 03           F:006300
  JMP B_0_10AC                                    ;   1126 9126 C 4C AC 90        F:006300

B_0_1129:
  JSR L_0_1435                                    ;   1129 9129 C 20 35 94        F:006454
  LDA QuestionTopBackgroundTile                   ;   112C 912C C AD 12 03        F:006455
  BNE B_0_113D                                    ;   112F 912F C D0 0C           F:006455
  LDA ActiveFamily                                ;   1131 9131 C A5 0B           F:006455
  BEQ B_0_113D                                    ;   1133 9133 C F0 08           F:006455
  LDA #$F                                         ;   1135 9135 C A9 0F           F:007214
  JSR L_0_19F7                                    ;   1137 9137 C 20 F7 99        F:007214
  JMP L_0_1142                                    ;   113A 913A C 4C 42 91        F:007214

B_0_113D:
  LDA #$3                                         ;   113D 913D C A9 03           F:006455
  JSR L_0_19F7                                    ;   113F 913F C 20 F7 99        F:006455
L_0_1142:
  JSR L_0_1435                                    ;   1142 9142 C 20 35 94        F:006455
  LDA R_0028                                      ;   1145 9145 C A5 28           F:006456
  BNE L_0_1142                                    ;   1147 9147 C D0 F9           F:006456
  JMP L_0_141F                                    ;   1149 9149 C 4C 1F 94        F:006635

B_0_114C:
  LDA R_0022                                      ;   114C 914C C A5 22           F:041624
  BEQ B_0_1158                                    ;   114E 914E C F0 08           F:041624
  JSR L_0_17BE                                    ;   1150 9150 C 20 BE 97        F:041624
  LDA #$0                                         ;   1153 9153 C A9 00           F:041624
  ROL                                             ;   1155 9155 C 2A              F:041624
  STA R_0022                                      ;   1156 9156 C 85 22           F:041624
B_0_1158:
  JSR L_0_105B                                    ;   1158 9158 C 20 5B 90        F:041624
  JSR SoundSystemUpdate                                    ;   115B 915B C 20 96 BA        F:041624
  JSR JoypadHasChanged                                    ;   115E 915E C 20 1C 9B        F:041624
  BCC B_0_1166                                    ;   1161 9161 C 90 03           F:041624
  JMP B_0_10AC                                    ;   1163 9163 C 4C AC 90        F:041624

B_0_1166:
  JMP L_0_141F                                    ;   1166 9166 C 4C 1F 94        F:041627

L_0_1169:
  JSR L_2_52B6                                    ;   1169 9169 C 20 B6 D2        F:033561
  LDA #$0                                         ;   116C 916C C A9 00           F:033561
  STA R_04BB                                      ;   116E 916E C 8D BB 04        F:033561
  LDA ActiveFamily                                ;   1171 9171 C A5 0B           F:033561
  EOR #$1                                         ;   1173 9173 C 49 01           F:033561
  STA ActiveFamily                                ;   1175 9175 C 85 0B           F:033561
  LDA #$4                                         ;   1177 9177 C A9 04           F:033561
  JSR RunStageScene                                    ;   1179 9179 C 20 07 C9        F:033561
  LDA #$1                                         ;   117C 917C C A9 01           F:033698
  STA IsStealingQuestion                          ;   117E 917E C 85 25           F:033698
  LDA #$0                                         ;   1180 9180 C A9 00           F:033698
  STA R_04DA                                      ;   1182 9182 C 8D DA 04        F:033698
  LDA #$4                                         ;   1185 9185 C A9 04           F:033698
  STA CurrentAnsweringFamilyMember                ;   1187 9187 C 8D DC 04        F:033698
  JMP L_0_10A1                                    ;   118A 918A C 4C A1 90        F:033698

L_0_118D:
  LDA #$3B                                        ;   118D 918D C A9 3B           F:006299
  STA R_04CA                                      ;   118F 918F C 8D CA 04        F:006299
  LDA #$5                                         ;   1192 9192 C A9 05           F:006299
  STA R_04CB                                      ;   1194 9194 C 8D CB 04        F:006299
  LDA #$4                                         ;   1197 9197 C A9 04           F:006299
  STA R_04CC                                      ;   1199 9199 C 8D CC 04        F:006299
  LDA #$0                                         ;   119C 919C C A9 00           F:006299
  STA R_04CD                                      ;   119E 919E C 8D CD 04        F:006299
  RTS                                             ;   11A1 91A1 C 60              F:006299

L_0_11A2:
  JSR L_0_0A03                                    ;   11A2 91A2 C 20 03 8A        F:010033
  BCC B_0_11B2                                    ;   11A5 91A5 C 90 0B           F:010033
  JSR L_0_1020                                    ;   11A7 91A7 C 20 20 90        F:010033
  JSR SoundSystemUpdate                                    ;   11AA 91AA C 20 96 BA        F:010033
  JSR L_2_4DBE                                    ;   11AD 91AD C 20 BE CD        F:010033
  CLC                                             ;   11B0 91B0 C 18              F:010033
  RTS                                             ;   11B1 91B1 C 60              F:010033

B_0_11B2:
  JSR SoundSystemUpdate                                    ;   11B2 91B2 C 20 96 BA        F:010272
  JSR L_0_1020                                    ;   11B5 91B5 C 20 20 90        F:010272
  JSR L_1_38FF                                    ;   11B8 91B8 C 20 FF B8        F:010272
  JSR L_0_1447                                    ;   11BB 91BB C 20 47 94        F:010272
  LDA CurrentAnsweringFamilyMember                ;   11BE 91BE C AD DC 04        F:010273
  CMP #$3                                         ;   11C1 91C1 C C9 03           F:010273
  BNE B_0_11D6                                    ;   11C3 91C3 C D0 11           F:010273
  LDX R_05C1                                      ;   11C5 91C5 C AE C1 05        F:011375
  LDY ActiveFamily                                ;   11C8 91C8 C A4 0B           F:011375
  LDA D_0_1009,Y                                  ;   11CA 91CA C B9 09 90        F:011375
  STA EntityXLo,X                                 ;   11CD 91CD C 9D C9 05        F:011375
  LDA D_0_100B,Y                                  ;   11D0 91D0 C B9 0B 90        F:011375
  STA EntityXHi,X                                 ;   11D3 91D3 C 9D C7 05        F:011375
B_0_11D6:
  LDA #$0                                         ;   11D6 91D6 C A9 00           F:010273
  STA R_0029                                      ;   11D8 91D8 C 85 29           F:010273
  STA PaletteDirtyFlag                            ;   11DA 91DA C 8D 3D 03        F:010273
  JSR MoveSpritesOffscreen                                    ;   11DD 91DD C 20 D5 99        F:010273
  JSR L_0_1447                                    ;   11E0 91E0 C 20 47 94        F:010273
  JSR L_0_1BDB                                    ;   11E3 91E3 C 20 DB 9B        F:010274
  PHP                                             ;   11E6 91E6 C 08              F:010400
  JSR L_0_06B0                                    ;   11E7 91E7 C 20 B0 86        F:010400
  LDA R_0393                                      ;   11EA 91EA C AD 93 03        F:010400
  AND #$F                                         ;   11ED 91ED C 29 0F           F:010400
  CMP R_04B9                                      ;   11EF 91EF C CD B9 04        F:010400
  BEQ B_0_120D                                    ;   11F2 91F2 C F0 19           F:010400
  LDY R_04B9                                      ;   11F4 91F4 C AC B9 04        F:010400
  LDA R_0384,Y                                    ;   11F7 91F7 C B9 84 03        F:010400
  BEQ B_0_1208                                    ;   11FA 91FA C F0 0C           F:010400
  PLP                                             ;   11FC 91FC . 28              
  JSR L_0_124B                                    ;   11FD 91FD . 20 4B 92        
  JSR L_0_06B0                                    ;   1200 9200 . 20 B0 86        
  JSR L_0_118D                                    ;   1203 9203 . 20 8D 91        
  CLC                                             ;   1206 9206 . 18              
  RTS                                             ;   1207 9207 . 60              

B_0_1208:
  LDA #$1                                         ;   1208 9208 C A9 01           F:010400
  STA R_0384,Y                                    ;   120A 920A C 99 84 03        F:010400
B_0_120D:
  LDA #$3                                         ;   120D 920D C A9 03           F:010400
  JSR SetNMIRoutine                                    ;   120F 920F C 20 C7 CA        F:010400
  LDA #$1                                         ;   1212 9212 C A9 01           F:010400
  STA R_04BB                                      ;   1214 9214 C 8D BB 04        F:010400
  STA PaletteDirtyFlag                            ;   1217 9217 C 8D 3D 03        F:010400
  INC CurrentAnsweringFamilyMember                ;   121A 921A C EE DC 04        F:010400
  LDA CurrentAnsweringFamilyMember                ;   121D 921D C AD DC 04        F:010400
  CMP #$5                                         ;   1220 9220 C C9 05           F:010400
  BNE B_0_1229                                    ;   1222 9222 C D0 05           F:010400
  LDA #$0                                         ;   1224 9224 C A9 00           F:011987
  STA CurrentAnsweringFamilyMember                ;   1226 9226 C 8D DC 04        F:011987
B_0_1229:
  PLP                                             ;   1229 9229 C 28              F:010400
  BCS B_0_1230                                    ;   122A 922A C B0 04           F:010400
  LDA #$2                                         ;   122C 922C C A9 02           F:010400
  BNE B_0_1232                                    ;   122E 922E C D0 02           F:010400
B_0_1230:
  LDA #$3                                         ;   1230 9230 C A9 03           F:011987
B_0_1232:
  STA R_04DA                                      ;   1232 9232 C 8D DA 04        F:010400
  JSR L_0_1886                                    ;   1235 9235 C 20 86 98        F:010400
  LDY ActiveFamily                                ;   1238 9238 C A4 0B           F:010400
  LDX D_0_0FC8,Y                                  ;   123A 923A C BE C8 8F        F:010400
  LDA #$1                                         ;   123D 923D C A9 01           F:010400
  STA PaletteDirtyFlag                            ;   123F 923F C 8D 3D 03        F:010400
  LDA #$0                                         ;   1242 9242 C A9 00           F:010400
  LDY #$1                                         ;   1244 9244 C A0 01           F:010400
  JSR L_2_4B00                                    ;   1246 9246 C 20 00 CB        F:010400
  SEC                                             ;   1249 9249 C 38              F:010400
  RTS                                             ;   124A 924A C 60              F:010400

L_0_124B:
  LDA #$2                                         ;   124B 924B . A9 02           
  JSR L_0_19F7                                    ;   124D 924D . 20 F7 99        
B_0_1250:
  JSR $CAF9                                       ;   1250 9250 . 20 F9 CA        
  LDA R_0028                                      ;   1253 9253 . A5 28           
  BNE B_0_1250                                    ;   1255 9255 . D0 F9           
  JSR $B8FF                                       ;   1257 9257 . 20 FF B8        
  LDA #$1                                         ;   125A 925A . A9 01           
  STA R_0021                                      ;   125C 925C . 85 21           
  LDA #$89                                        ;   125E 925E . A9 89           
  STA R_05F9                                      ;   1260 9260 . 8D F9 05        
  LDA #$0                                         ;   1263 9263 . A9 00           
  STA R_04DA                                      ;   1265 9265 . 8D DA 04        
  JSR L_0_1886                                    ;   1268 9268 . 20 86 98        
  LDA #$3                                         ;   126B 926B . A9 03           
  JSR $CAC7                                       ;   126D 926D . 20 C7 CA        
  LDA #$0                                         ;   1270 9270 . A9 00           
  LDY #$1                                         ;   1272 9272 . A0 01           
  JSR $CB00                                       ;   1274 9274 . 20 00 CB        
  LDA #$3                                         ;   1277 9277 . A9 03           
  JSR L_0_19F7                                    ;   1279 9279 . 20 F7 99        
B_0_127C:
  JSR L_0_1447                                    ;   127C 927C . 20 47 94        
  LDA R_0028                                      ;   127F 927F . A5 28           
  BNE B_0_127C                                    ;   1281 9281 . D0 F9           
  CLC                                             ;   1283 9283 . 18              
  RTS                                             ;   1284 9284 . 60              

L_0_1285:
  LDA #$9                                         ;   1285 9285 C A9 09           F:006300
  JMP MMC1SetCHR0                                    ;   1287 9287 C 4C 54 99        F:006300

DisplayFamilyScene:
  JSR PPUHideAllAndWaitForNMI                                    ;   128A 928A C 20 C0 99        F:006294
  LDX ActiveFamily                                ;   128D 928D C A6 0B           F:006295
  JSR JoypadReadSingle                                    ;   128F 928F C 20 04 9B        F:006295
  LDA JoypadInputsCtl0,X                          ;   1292 9292 C B5 EA           F:006295
  STA JoypadInputsCtl0Copy,X                      ;   1294 9294 C 95 ED           F:006295
  JSR L_2_52B6                                    ;   1296 9296 C 20 B6 D2        F:006295
  LDY #$1                                         ;   1299 9299 C A0 01           F:006295
  STY R_0022                                      ;   129B 929B C 84 22           F:006295
  STY PaletteDirtyFlag                            ;   129D 929D C 8C 3D 03        F:006295
  DEY                                             ;   12A0 92A0 C 88              F:006295
  STY ActiveScene                                 ;   12A1 92A1 C 8C D3 04        F:006295
  STY R_04C9                                      ;   12A4 92A4 C 8C C9 04        F:006295
  STY R_001F                                      ;   12A7 92A7 C 84 1F           F:006295
  STY R_04BB                                      ;   12A9 92A9 C 8C BB 04        F:006295
  JSR L_2_528C                                    ;   12AC 92AC C 20 8C D2        F:006295
  STX R_05C1                                      ;   12AF 92AF C 8E C1 05        F:006295
  LDA #$0                                         ;   12B2 92B2 C A9 00           F:006295
  STA EntityYLo,X                                 ;   12B4 92B4 C 9D CD 05        F:006295
  LDA #$8                                         ;   12B7 92B7 C A9 08           F:006295
  STA EntityYHi,X                                 ;   12B9 92B9 C 9D CB 05        F:006295
  LDY ActiveFamily                                ;   12BC 92BC C A4 0B           F:006295
  LDA D_0_1005,Y                                  ;   12BE 92BE C B9 05 90        F:006295
  STA EntityXLo,X                                 ;   12C1 92C1 C 9D C9 05        F:006295
  LDA D_0_1007,Y                                  ;   12C4 92C4 C B9 07 90        F:006295
  STA EntityXHi,X                                 ;   12C7 92C7 C 9D C7 05        F:006295
  LDA QuestionVisible                             ;   12CA 92CA C AD E2 04        F:006295
  BEQ B_0_12F8                                    ;   12CD 92CD C F0 29           F:006295
  LDA #$84                                        ;   12CF 92CF C A9 84           F:041619
  STA R_05C5,X                                    ;   12D1 92D1 C 9D C5 05        F:041619
  LDY #$0                                         ;   12D4 92D4 C A0 00           F:041619
  JSR L_2_528C                                    ;   12D6 92D6 C 20 8C D2        F:041619
  STX R_05C2                                      ;   12D9 92D9 C 8E C2 05        F:041619
  LDA #$70                                        ;   12DC 92DC C A9 70           F:041619
  STA EntityYLo,X                                 ;   12DE 92DE C 9D CD 05        F:041619
  LDA #$4                                         ;   12E1 92E1 C A9 04           F:041619
  STA EntityYHi,X                                 ;   12E3 92E3 C 9D CB 05        F:041619
  LDA #$80                                        ;   12E6 92E6 C A9 80           F:041619
  STA EntityXLo,X                                 ;   12E8 92E8 C 9D C9 05        F:041619
  LDA #$6                                         ;   12EB 92EB C A9 06           F:041619
  STA EntityXHi,X                                 ;   12ED 92ED C 9D C7 05        F:041619
  LDA #$85                                        ;   12F0 92F0 C A9 85           F:041619
  STA R_05C5,X                                    ;   12F2 92F2 C 9D C5 05        F:041619
  JMP L_0_1360                                    ;   12F5 92F5 C 4C 60 93        F:041619

B_0_12F8:
  LDA R_0346                                      ;   12F8 92F8 C AD 46 03        F:006295
  BMI B_0_1305                                    ;   12FB 92FB C 30 08           F:006295
  LDA R_0392                                      ;   12FD 92FD C AD 92 03        F:010029
  BEQ B_0_1313                                    ;   1300 9300 C F0 11           F:010029
  JMP L_0_130B                                    ;   1302 9302 C 4C 0B 93        F:012355

B_0_1305:
  LDA ActiveFamily2                               ;   1305 9305 C A5 08           F:006295
  CMP ActiveFamily                                ;   1307 9307 C C5 0B           F:006295
  BNE B_0_1313                                    ;   1309 9309 C D0 08           F:006295
L_0_130B:
  LDA #$84                                        ;   130B 930B C A9 84           F:012355
  STA R_05C5,X                                    ;   130D 930D C 9D C5 05        F:012355
  JMP L_0_1360                                    ;   1310 9310 C 4C 60 93        F:012355

B_0_1313:
  LDA CurrentAnsweringFamilyMember                ;   1313 9313 C AD DC 04        F:006295
  BPL B_0_1321                                    ;   1316 9316 C 10 09           F:006295
  LDA D_0_100D,Y                                  ;   1318 9318 C B9 0D 90        F:006295
  STA R_05C5,X                                    ;   131B 931B C 9D C5 05        F:006295
  JMP L_0_1360                                    ;   131E 931E C 4C 60 93        F:006295

B_0_1321:
  LDA IsStealingQuestion                          ;   1321 9321 C A5 25           F:010029
  BNE B_0_1328                                    ;   1323 9323 C D0 03           F:010029
  JSR SetInitialAnsweringFamilyMember                                    ;   1325 9325 C 20 86 84        F:010029
B_0_1328:
  LDY CurrentAnsweringFamilyMember                ;   1328 9328 C AC DC 04        F:010029
  LDA ActiveFamily                                ;   132B 932B C A5 0B           F:010029
  BNE B_0_1345                                    ;   132D 932D C D0 16           F:010029
  SEC                                             ;   132F 932F C 38              F:013953
  LDA EntityXLo,X                                 ;   1330 9330 C BD C9 05        F:013953
  SBC D_0_1016,Y                                  ;   1333 9333 C F9 16 90        F:013953
  STA EntityXLo,X                                 ;   1336 9336 C 9D C9 05        F:013953
  LDA EntityXHi,X                                 ;   1339 9339 C BD C7 05        F:013953
  SBC D_0_101B,Y                                  ;   133C 933C C F9 1B 90        F:013953
  STA EntityXHi,X                                 ;   133F 933F C 9D C7 05        F:013953
  JMP L_0_1358                                    ;   1342 9342 C 4C 58 93        F:013953

B_0_1345:
  CLC                                             ;   1345 9345 C 18              F:010029
  LDA EntityXLo,X                                 ;   1346 9346 C BD C9 05        F:010029
  ADC D_0_1016,Y                                  ;   1349 9349 C 79 16 90        F:010029
  STA EntityXLo,X                                 ;   134C 934C C 9D C9 05        F:010029
  LDA EntityXHi,X                                 ;   134F 934F C BD C7 05        F:010029
  ADC D_0_101B,Y                                  ;   1352 9352 C 79 1B 90        F:010029
  STA EntityXHi,X                                 ;   1355 9355 C 9D C7 05        F:010029
L_0_1358:
  LDA #$82                                        ;   1358 9358 C A9 82           F:010029
  CLC                                             ;   135A 935A C 18              F:010029
  ADC ActiveFamily                                ;   135B 935B C 65 0B           F:010029
  STA R_05C5,X                                    ;   135D 935D C 9D C5 05        F:010029
L_0_1360:
  LDA R_0346                                      ;   1360 9360 C AD 46 03        F:006295
  BNE B_0_1374                                    ;   1363 9363 C D0 0F           F:006295
  LDA #$0                                         ;   1365 9365 C A9 00           F:010029
  STA R_04DA                                      ;   1367 9367 C 8D DA 04        F:010029
  LDA #$F0                                        ;   136A 936A C A9 F0           F:010029
  STA R_04CE                                      ;   136C 936C C 8D CE 04        F:010029
  LDA #$3                                         ;   136F 936F C A9 03           F:010029
  JMP L_0_1384                                    ;   1371 9371 C 4C 84 93        F:010029

B_0_1374:
  LDA #$3C                                        ;   1374 9374 C A9 3C           F:006295
  STA R_04CE                                      ;   1376 9376 C 8D CE 04        F:006295
  LDA #$0                                         ;   1379 9379 C A9 00           F:006295
  STA R_035E                                      ;   137B 937B C 8D 5E 03        F:006295
  LDA #$FF                                        ;   137E 937E C A9 FF           F:006295
  STA R_0050                                      ;   1380 9380 C 85 50           F:006295
  LDA #$9                                         ;   1382 9382 C A9 09           F:006295
L_0_1384:
  JSR SetNMIRoutine                                    ;   1384 9384 C 20 C7 CA        F:006295
  LDX ActiveFamily                                ;   1387 9387 C A6 0B           F:006295
  LDA D_0_0FC8,X                                  ;   1389 9389 C BD C8 8F        F:006295
  LDX #$0                                         ;   138C 938C C A2 00           F:006295
  STX PPUNametable                                ;   138E 938E C 8E 44 03        F:006295
  LDY #$0                                         ;   1391 9391 C A0 00           F:006295
  JSR SetNewBackground                                    ;   1393 9393 C 20 07 A3        F:006295
  JSR MoveSpritesOffscreen                                    ;   1396 9396 C 20 D5 99        F:006297
  LDA R_0346                                      ;   1399 9399 C AD 46 03        F:006297
  BEQ B_0_13BE                                    ;   139C 939C C F0 20           F:006297
  LDX #$0                                         ;   139E 939E C A2 00           F:006297
  LDY #$1                                         ;   13A0 93A0 C A0 01           F:006297
  LDA #$4                                         ;   13A2 93A2 C A9 04           F:006297
  JSR SetNewBackground                                    ;   13A4 93A4 C 20 07 A3        F:006297
  LDA #$77                                        ;   13A7 93A7 C A9 77           F:006298
  STA SprYPos                                     ;   13A9 93A9 C 8D 00 02        F:006298
  LDA #$16                                        ;   13AC 93AC C A9 16           F:006298
  STA SprTile                                     ;   13AE 93AE C 8D 01 02        F:006298
  LDA #$20                                        ;   13B1 93B1 C A9 20           F:006298
  STA SprFlag                                     ;   13B3 93B3 C 8D 02 02        F:006298
  LDA #$0                                         ;   13B6 93B6 C A9 00           F:006298
  STA SprXPos                                     ;   13B8 93B8 C 8D 03 02        F:006298
  JMP L_0_13E8                                    ;   13BB 93BB C 4C E8 93        F:006298

B_0_13BE:
  JSR DrawQuestionTopBackgroundColor                                    ;   13BE 93BE C 20 C5 8C        F:010031
  JSR L_0_04E5                                    ;   13C1 93C1 C 20 E5 84        F:010031
  LDX #$1                                         ;   13C4 93C4 C A2 01           F:010031
  LDY #$0                                         ;   13C6 93C6 C A0 00           F:010031
  JSR PrepareQuestionText                                    ;   13C8 93C8 C 20 2C 87        F:010031
  JSR DrawQuestionText                                    ;   13CB 93CB C 20 C4 87        F:010031
  JSR L_0_05C4                                    ;   13CE 93CE C 20 C4 85        F:010031
  JSR L_0_05E8                                    ;   13D1 93D1 C 20 E8 85        F:010031
  JSR L_0_0641                                    ;   13D4 93D4 C 20 41 86        F:010031
  LDA QuestionTopBackgroundTile                   ;   13D7 93D7 C AD 12 03        F:010031
  BNE B_0_13E0                                    ;   13DA 93DA C D0 04           F:010031
  LDA ActiveFamily                                ;   13DC 93DC C A5 0B           F:010031
  BNE B_0_13E2                                    ;   13DE 93DE C D0 02           F:010031
B_0_13E0:
  LDA #$2                                         ;   13E0 93E0 C A9 02           F:013955
B_0_13E2:
  STA UserAnswerOperation                         ;   13E2 93E2 C 8D 70 03        F:010031
  JSR L_0_06D9                                    ;   13E5 93E5 C 20 D9 86        F:010031
L_0_13E8:
  JSR L_0_1829                                    ;   13E8 93E8 C 20 29 98        F:006298
  JSR L_0_1872                                    ;   13EB 93EB C 20 72 98        F:006298
  JSR L_0_190A                                    ;   13EE 93EE C 20 0A 99        F:006298
  JSR L_0_192E                                    ;   13F1 93F1 C 20 2E 99        F:006298
  LDA #$FF                                        ;   13F4 93F4 C A9 FF           F:006298
  STA R_04D8                                      ;   13F6 93F6 C 8D D8 04        F:006298
  JSR L_0_1A0B                                    ;   13F9 93F9 C 20 0B 9A        F:006298
  JSR PPUMASKShowSprites                                    ;   13FC 93FC C 20 B9 99        F:006298
  JSR PPUMASKShowBackground                                    ;   13FF 93FF C 20 AB 99        F:006298
  JSR PPUCTRLEnableNMI                                    ;   1402 9402 C 20 EF CA        F:006298
  JMP DelayUntilNMI                                    ;   1405 9405 C 4C F9 CA        F:006298

AwardQuestionCash:
  LDA ActiveFamily                                ;   1408 9408 C A5 0B           F:012354
  ASL                                             ;   140A 940A C 0A              F:012354
  TAX                                             ;   140B 940B C AA              F:012354
  LDA Family1Cash,X                               ;   140C 940C C BD C3 04        F:012354
  ADC QuestionCurrentCash                         ;   140F 940F C 6D C7 04        F:012354
  STA Family1Cash,X                               ;   1412 9412 C 9D C3 04        F:012354
  LDA Family1Cash+1,X                             ;   1415 9415 C BD C4 04        F:012354
  ADC QuestionCurrentCash+1                       ;   1418 9418 C 6D C8 04        F:012354
  STA Family1Cash+1,X                             ;   141B 941B C 9D C4 04        F:012354
  RTS                                             ;   141E 941E C 60              F:012354

L_0_141F:
  LDA #$1                                         ;   141F 941F C A9 01           F:006635
  STA PaletteDirtyFlag                            ;   1421 9421 C 8D 3D 03        F:006635
  JSR DelayUntilNMI                                    ;   1424 9424 C 20 F9 CA        F:006635
  JSR L_0_105B                                    ;   1427 9427 C 20 5B 90        F:006636
  JSR SoundSystemUpdate                                    ;   142A 942A C 20 96 BA        F:006636
  JSR L_0_1A30                                    ;   142D 942D C 20 30 9A        F:006636
  BCC L_0_141F                                    ;   1430 9430 C 90 ED           F:006636
  JMP L_2_52B6                                    ;   1432 9432 C 4C B6 D2        F:006647

L_0_1435:
  LDA PaletteDirtyFlagPending                     ;   1435 9435 C AD 41 03        F:006454
  STA PaletteDirtyFlag                            ;   1438 9438 C 8D 3D 03        F:006454
  JSR DelayUntilNMI                                    ;   143B 943B C 20 F9 CA        F:006454
  JSR L_0_1A7E                                    ;   143E 943E C 20 7E 9A        F:006455
  JSR L_0_105B                                    ;   1441 9441 C 20 5B 90        F:006455
  JMP SoundSystemUpdate                                    ;   1444 9444 C 4C 96 BA        F:006455

L_0_1447:
  JSR DelayUntilNMI                                    ;   1447 9447 C 20 F9 CA        F:010272
  JSR SoundSystemUpdate                                    ;   144A 944A C 20 96 BA        F:010273
  JMP L_0_1020                                    ;   144D 944D C 4C 20 90        F:010273

D_0_1450:
.addr D_0_14A4                                    ;   1450 9450 N A4 94
D_0_1451 = * - 1
.addr D_0_14B0                                    ;   1452 9452 N B0 94
.addr D_0_14BC                                    ;   1454 9454 N BC 94
.addr D_0_14C8                                    ;   1456 9456 N C8 94
.addr D_0_14D4                                    ;   1458 9458 N D4 94
.addr D_0_14E0                                    ;   145A 945A N E0 94
.addr D_0_14EC                                    ;   145C 945C N EC 94
.addr D_0_14F8                                    ;   145E 945E N F8 94
.addr D_0_1504                                    ;   1460 9460 N 04 95
.addr D_0_1510                                    ;   1462 9462 N 10 95
.addr D_0_151C                                    ;   1464 9464 N 1C 95
.addr D_0_1528                                    ;   1466 9466 N 28 95
.addr D_0_1534                                    ;   1468 9468 N 34 95
.addr D_0_1540                                    ;   146A 946A N 40 95
.addr D_0_154C                                    ;   146C 946C N 4C 95
.addr D_0_1558                                    ;   146E 946E N 58 95
.addr D_0_1564                                    ;   1470 9470 N 64 95
.addr D_0_1570                                    ;   1472 9472 N 70 95
.addr D_0_157C                                    ;   1474 9474 N 7C 95
.addr D_0_1588                                    ;   1476 9476 N 88 95
.addr D_0_1594                                    ;   1478 9478 N 94 95
.addr D_0_15A0                                    ;   147A 947A N A0 95
.addr D_0_15AC                                    ;   147C 947C N AC 95
.addr D_0_15B8                                    ;   147E 947E N B8 95
.addr D_0_15C4                                    ;   1480 9480 N C4 95
.addr D_0_15D0                                    ;   1482 9482 N D0 95
.addr D_0_15DC                                    ;   1484 9484 N DC 95
.addr D_0_15E8                                    ;   1486 9486 N E8 95
D_0_1488:
.byte $03                                         ;   1488 9488 D        ?        F:006422
.byte $03,$03,$03,$03,$03,$03                     ;   1489 9489 ......   ??????   
.byte $03                                         ;   148F 948F D        ?        F:007208
.byte $02,$03,$03,$03                             ;   1490 9490 ....     ????     
.byte $03                                         ;   1494 9494 D        ?        F:007208
.byte $03,$03                                     ;   1495 9495 ..       ??       
.byte $03                                         ;   1497 9497 D        ?        F:007208
.byte $03                                         ;   1498 9498 .        ?        
.byte $03                                         ;   1499 9499 D        ?        F:007208
.byte $03,$03                                     ;   149A 949A ..       ??       
.byte $03                                         ;   149C 949C D        ?        F:007208
.byte $03,$03,$03                                 ;   149D 949D ...      ???      
.byte $03                                         ;   14A0 94A0 D        ?        F:007208
.byte $03,$03,$03                                 ;   14A1 94A1 ...      ???      
D_0_14A4:
.byte $67,$68,$69,$03,$75,$76,$77,$03             ;   14A4 94A4 DDDDDDDD ghi?uvw? F:006319
.byte $83,$84,$85,$03                             ;   14AC 94AC DDDD     ????     F:006319
D_0_14B0:
.byte $6A,$6B,$6C,$03,$78,$79,$7A,$03             ;   14B0 94B0 DDDDDDDD jkl?xyz? F:046664
.byte $86,$87,$88,$03                             ;   14B8 94B8 DDDD     ????     F:046664
D_0_14BC:
.byte $6D,$6E,$6F,$03,$7B,$03,$7C,$03             ;   14BC 94BC DDDDDDDD mno?{?|? F:046686
.byte $89,$8A,$8B,$03                             ;   14C4 94C4 DDDD     ????     F:046686
D_0_14C8:
.byte $6A,$70,$71,$03,$78,$03,$7D,$03             ;   14C8 94C8 DDDDDDDD jpq?x?}? F:046720
.byte $86,$87,$88,$03                             ;   14D0 94D0 DDDD     ????     F:046720
D_0_14D4:
.byte $6A,$70,$72,$03,$78,$79,$7E,$03             ;   14D4 94D4 DDDDDDDD jpr?xy~? F:046725
.byte $86,$87,$8C,$03                             ;   14DC 94DC DDDD     ????     F:046725
D_0_14E0:
.byte $6A,$70,$72,$03,$78,$79,$7E,$03             ;   14E0 94E0 DDDDDDDD jpr?xy~? F:046730
.byte $86,$8D,$03,$03                             ;   14E8 94E8 DDDD     ????     F:046730
D_0_14EC:
.byte $6D,$6E,$6F,$03,$7B,$7F,$80,$03             ;   14EC 94EC DDDDDDDD mno?{??? F:046735
.byte $89,$8A,$8E,$03                             ;   14F4 94F4 DDDD     ????     F:046735
D_0_14F8:
.byte $6A,$73,$74,$03,$78,$81,$82,$03             ;   14F8 94F8 DDDDDDDD jst?x??? F:007212
.byte $86,$8F,$90,$03                             ;   1500 9500 DDDD     ????     F:007212
D_0_1504:
.byte $6A,$91,$03,$03                             ;   1504 9504 DDDD     j???     F:046754
.byte $78                                         ;   1508 9508 D        x        F:016244
.byte $03,$03,$03,$86,$8D,$03,$03                 ;   1509 9509 DDDDDDD  ???????  F:046754
D_0_1510:
.byte $03,$92,$74,$03,$9E,$9F,$82,$03             ;   1510 9510 DDDDDDDD ??t????? F:046763
.byte $A8,$A9,$AA,$03                             ;   1518 9518 DDDD     ????     F:046763
D_0_151C:
.byte $6A,$93,$94,$03                             ;   151C 951C DDDD     j???     F:046797
.byte $78                                         ;   1520 9520 D        x        F:007214
.byte $A0,$03,$03,$86,$AB,$AC,$03                 ;   1521 9521 DDDDDDD  ???????  F:046797
D_0_1528:
.byte $6A,$91,$03,$03,$78,$03,$03,$03             ;   1528 9528 DDDDDDDD j???x??? F:046802
.byte $86,$AD,$AE,$03                             ;   1530 9530 DDDD     ????     F:046802
D_0_1534:
.byte $95,$96,$97,$03,$A1,$A2,$A3,$03             ;   1534 9534 DDDDDDDD ???????? F:007208
.byte $86,$AF,$B0,$03                             ;   153C 953C DDDD     ????     F:007208
D_0_1540:
.byte $98,$99,$9A,$03,$A4,$A5,$82,$03             ;   1540 9540 DDDDDDDD ???????? F:046812
.byte $86,$B1,$90,$03                             ;   1548 9548 DDDD     ????     F:046812
D_0_154C:
.byte $6D,$9B,$9C,$03,$7B,$03,$7B,$03             ;   154C 954C DDDDDDDD m???{?{? F:046817
.byte $89,$B2,$B3,$03                             ;   1554 9554 DDDD     ????     F:046817
D_0_1558:
.byte $6A,$9D,$6C,$03,$78,$A6,$A7,$03             ;   1558 9558 DDDDDDDD j?l?x??? F:007211
.byte $86,$8D,$03,$03                             ;   1560 9560 DDDD     ????     F:007211
D_0_1564:
.byte $6D,$9B,$9C,$03,$7B,$BC,$7B,$03             ;   1564 9564 DDDDDDDD m???{?{? F:046827
.byte $89,$CE,$CF,$03                             ;   156C 956C DDDD     ????     F:046827
D_0_1570:
.byte $6A,$9D,$6C,$03,$78,$BD,$BE,$03             ;   1570 9570 DDDDDDDD j?l?x??? F:007210
.byte $86,$8F,$90,$03                             ;   1578 9578 DDDD     ????     F:007210
D_0_157C:
.byte $6D,$6E,$6F,$03,$BF,$C0,$C1,$03             ;   157C 957C DDDDDDDD mno????? F:046837
.byte $D0,$B2,$D1,$03                             ;   1584 9584 DDDD     ????     F:046837
D_0_1588:
.byte $B4,$B5,$72,$03,$C2,$C3,$03,$03             ;   1588 9588 DDDDDDDD ??r????? F:046842
.byte $D2,$D3,$03,$03                             ;   1590 9590 DDDD     ????     F:046842
D_0_1594:
.byte $6A,$73,$74,$03,$C4,$9F,$C5,$03             ;   1594 9594 DDDDDDDD jst????? F:007209
.byte $D4,$D5,$D6,$03                             ;   159C 959C DDDD     ????     F:007209
D_0_15A0:
.byte $6A,$73,$74,$03,$C6,$C7,$C8,$03             ;   15A0 95A0 DDDDDDDD jst????? F:046852
.byte $D7,$D8,$03,$03                             ;   15A8 95A8 DDDD     ????     F:046852
D_0_15AC:
.byte $B6,$B7,$B8,$03,$C9,$CA,$CB,$03             ;   15AC 95AC DDDDDDDD ???????? F:046857
.byte $D9,$DA,$DB,$03                             ;   15B4 95B4 DDDD     ????     F:046857
D_0_15B8:
.byte $B9,$BA,$BB,$03,$CC,$CD,$03,$03             ;   15B8 95B8 DDDDDDDD ???????? F:046873
.byte $DC,$DD,$DE,$03                             ;   15C0 95C0 DDDD     ????     F:046873
D_0_15C4:
.byte $DF,$BA,$BB,$03,$E6,$E7,$03,$03             ;   15C4 95C4 DDDDDDDD ???????? F:007213
.byte $EE,$EF,$03,$03                             ;   15CC 95CC DDDD     ????     F:007213
D_0_15D0:
.byte $E0,$E1,$E2,$03,$E8,$E9,$EA,$03             ;   15D0 95D0 DDDDDDDD ???????? F:046894
.byte $F0,$F1,$F2,$03                             ;   15D8 95D8 DDDD     ????     F:046894
D_0_15DC:
.byte $E3,$E4,$E5,$03,$EB,$EC,$ED,$03             ;   15DC 95DC DDDDDDDD ???????? F:006442
.byte $F3,$F4,$F5,$03                             ;   15E4 95E4 DDDD     ????     F:006442
D_0_15E8:
.byte $03,$03,$03,$03,$03,$03,$03,$03             ;   15E8 95E8 DDDDDDDD ???????? F:006339
.byte $03,$03,$03,$03                             ;   15F0 95F0 DDDD     ????     F:006339
.byte $03,$03,$03                                 ;   15F4 95F4 ...      ???      
D_0_15F7:
.byte $0A,$11,$17,$1C,$21,$28,$30                 ;   15F7 95F7 .......  ????!(0  
.byte $36                                         ;   15FE 95FE D        6        F:007208
.byte $3C,$41,$4B,$45,$4E,$4E,$45,$44             ;   15FF 95FF ........ <AKENNED 
.byte $D9,$52,$45,$41,$47,$41,$CE,$54             ;   1607 9607 ........ ?REAGA?T 
.byte $52,$55,$4D,$D0,$42,$52,$41,$44             ;   160F 960F ........ RUM?BRAD 
.byte $D9,$4A,$41,$43,$4B,$53,$4F,$CE             ;   1617 9617 ........ ?JACKSO? 
.byte $57,$49,$4C,$4C,$49,$41,$4D,$D3             ;   161F 961F ........ WILLIAM? 
.byte $43,$41,$52,$53,$4F,$CE                     ;   1627 9627 ......   CARSO?   
.byte $4D,$55,$52,$50,$48,$D9                     ;   162D 962D DDDDDD   MURPH?   F:007208
.byte $45,$57,$49,$4E,$C7,$42,$55,$52             ;   1633 9633 ........ EWIN?BUR 
.byte $54,$4F,$CE                                 ;   163B 963B ...      TO?      
L_0_163E:
  LDA QuestionTopBackgroundTile                   ;   163E 963E C AD 12 03        F:006300
  BNE EnterFamilyName                                    ;   1641 9641 C D0 30           F:006300
  LDA ActiveFamily                                ;   1643 9643 C A5 0B           F:006300
  BEQ EnterFamilyName                                    ;   1645 9645 C F0 2C           F:006300
  LDA R_035E                                      ;   1647 9647 C AD 5E 03        F:007149
  BNE B_0_1670                                    ;   164A 964A C D0 24           F:007149
  DEC R_04CE                                      ;   164C 964C C CE CE 04        F:007149
  BEQ B_0_1653                                    ;   164F 964F C F0 02           F:007149
  SEC                                             ;   1651 9651 C 38              F:007149
  RTS                                             ;   1652 9652 C 60              F:007149

B_0_1653:
  JSR AdvanceRNG                                    ;   1653 9653 C 20 BB 9B        F:007208
  LDA RNG1                                        ;   1656 9656 C AD FA 01        F:007208
  AND #$F                                         ;   1659 9659 C 29 0F           F:007208
  CMP #$A                                         ;   165B 965B C C9 0A           F:007208
  BCS B_0_1653                                    ;   165D 965D C B0 F4           F:007208
  TAX                                             ;   165F 965F C AA              F:007208
  LDY D_0_15F7,X                                  ;   1660 9660 C BC F7 95        F:007208
  DEY                                             ;   1663 9663 C 88              F:007208
  LDX #$FF                                        ;   1664 9664 C A2 FF           F:007208
B_0_1666:
  INX                                             ;   1666 9666 C E8              F:007208
  INY                                             ;   1667 9667 C C8              F:007208
  LDA D_0_15F7,Y                                  ;   1668 9668 C B9 F7 95        F:007208
  STA Family2Name,X                               ;   166B 966B C 9D 08 03        F:007208
  BPL B_0_1666                                    ;   166E 966E C 10 F6           F:007208
B_0_1670:
  JMP L_0_17BE                                    ;   1670 9670 C 4C BE 97        F:007208

EnterFamilyName:
  LDA ActiveFamily2                               ;   1673 9673 C A5 08           F:006300
  CMP ActiveFamily                                ;   1675 9675 C C5 0B           F:006300
  BEQ B_0_1670                                    ;   1677 9677 C F0 F7           F:006300
  LDA R_035E                                      ;   1679 9679 C AD 5E 03        F:006300
  BNE B_0_169C                                    ;   167C 967C C D0 1E           F:006300
  LDX #$7                                         ;   167E 967E C A2 07           F:006300
@ClearInput:
  LDA #$41                                        ;   1680 9680 C A9 41           F:006300
  STA R_0048,X                                    ;   1682 9682 C 95 48           F:006300
  DEX                                             ;   1684 9684 C CA              F:006300
  BPL @ClearInput                                    ;   1685 9685 C 10 F9           F:006300
  LDA #$0                                         ;   1687 9687 C A9 00           F:006300
  STA R_00D2                                      ;   1689 9689 C 85 D2           F:006300
  STA R_00D3                                      ;   168B 968B C 85 D3           F:006300
  STA R_00D1                                      ;   168D 968D C 85 D1           F:006300
  LDA #$20                                        ;   168F 968F C A9 20           F:006300
  STA R_00D0                                      ;   1691 9691 C 85 D0           F:006300
  LDA #$64                                        ;   1693 9693 C A9 64           F:006300
  STA R_00CF                                      ;   1695 9695 C 85 CF           F:006300
  LDA #$1                                         ;   1697 9697 C A9 01           F:006300
  STA R_035E                                      ;   1699 9699 C 8D 5E 03        F:006300
B_0_169C:
  JSR L_0_1725                                    ;   169C 969C C 20 25 97        F:006300
  BCS B_0_16B8                                    ;   169F 969F C B0 17           F:006300
  LDX ActiveFamily                                ;   16A1 96A1 C A6 0B           F:006454
  LDY D_0_0FC6,X                                  ;   16A3 96A3 C BC C6 8F        F:006454
  LDX #$0                                         ;   16A6 96A6 C A2 00           F:006454
@CopyNameIntoPlace:
  LDA R_0048,X                                    ;   16A8 96A8 C B5 48           F:006454
  STA Family1Name,Y                               ;   16AA 96AA C 99 00 03        F:006454
  INY                                             ;   16AD 96AD C C8              F:006454
  INX                                             ;   16AE 96AE C E8              F:006454
  CPX #$8                                         ;   16AF 96AF C E0 08           F:006454
  BNE @CopyNameIntoPlace                                    ;   16B1 96B1 C D0 F5           F:006454
  JSR L_0_16D5                                    ;   16B3 96B3 C 20 D5 96        F:006454
  CLC                                             ;   16B6 96B6 C 18              F:006454
  RTS                                             ;   16B7 96B7 C 60              F:006454

B_0_16B8:
  LDA R_00D2                                      ;   16B8 96B8 C A5 D2           F:006300
  BMI L_0_16D5                                    ;   16BA 96BA C 30 19           F:006300
  INC R_00D2                                      ;   16BC 96BC C E6 D2           F:006300
  LDA R_00D2                                      ;   16BE 96BE C A5 D2           F:006300
  CMP #$14                                        ;   16C0 96C0 C C9 14           F:006300
  BNE B_0_1723                                    ;   16C2 96C2 C D0 5F           F:006300
  LDA #$0                                         ;   16C4 96C4 C A9 00           F:006319
  STA R_00D2                                      ;   16C6 96C6 C 85 D2           F:006319
  LDA R_00D3                                      ;   16C8 96C8 C A5 D3           F:006319
  EOR #$1                                         ;   16CA 96CA C 49 01           F:006319
  STA R_00D3                                      ;   16CC 96CC C 85 D3           F:006319
  BNE L_0_16D5                                    ;   16CE 96CE C D0 05           F:006319
  LDA #$5C                                        ;   16D0 96D0 C A9 5C           F:006339
  JMP L_0_16E3                                    ;   16D2 96D2 C 4C E3 96        F:006339

L_0_16D5:
  LDX R_00D1                                      ;   16D5 96D5 C A6 D1           F:006319
  LDA R_0048,X                                    ;   16D7 96D7 C B5 48           F:006319
  CMP #$5B                                        ;   16D9 96D9 C C9 5B           F:006319
  BNE L_0_16E3                                    ;   16DB 96DB C D0 06           F:006319
  LDY ValidationAnswerCopy-1,X                                    ;   16DD 96DD C B4 47           F:006442
  BPL L_0_16E3                                    ;   16DF 96DF C 10 02           F:006442
  LDA #$5C                                        ;   16E1 96E1 C A9 5C           F:006454
L_0_16E3:
  SEC                                             ;   16E3 96E3 C 38              F:006319
  SBC #$41                                        ;   16E4 96E4 C E9 41           F:006319
  ASL                                             ;   16E6 96E6 C 0A              F:006319
  TAY                                             ;   16E7 96E7 C A8              F:006319
  LDA D_0_1450,Y                                  ;   16E8 96E8 C B9 50 94        F:006319
  STA R_000E                                      ;   16EB 96EB C 85 0E           F:006319
  LDA D_0_1451,Y                                  ;   16ED 96ED C B9 51 94        F:006319
  STA R_000F                                      ;   16F0 96F0 C 85 0F           F:006319
  LDY #$0                                         ;   16F2 96F2 C A0 00           F:006319
  LDA R_0050                                      ;   16F4 96F4 C A5 50           F:006319
  CMP #$FE                                        ;   16F6 96F6 C C9 FE           F:006319
  BEQ B_0_1723                                    ;   16F8 96F8 C F0 29           F:006319
  CMP #$FD                                        ;   16FA 96FA C C9 FD           F:006319
  BEQ B_0_1702                                    ;   16FC 96FC C F0 04           F:006319
  LDA #$1                                         ;   16FE 96FE C A9 01           F:006319
  STA R_0050                                      ;   1700 9700 C 85 50           F:006319
B_0_1702:
  LDX #$4                                         ;   1702 9702 C A2 04           F:006319
B_0_1704:
  LDA (R_000E),Y                                  ;   1704 9704 C B1 0E           F:006319
  STA a:R_0051,Y                                  ;   1706 9706 C 99 51 00        F:006319
  INY                                             ;   1709 9709 C C8              F:006319
  DEX                                             ;   170A 970A C CA              F:006319
  BNE B_0_1704                                    ;   170B 970B C D0 F7           F:006319
  LDX #$4                                         ;   170D 970D C A2 04           F:006319
B_0_170F:
  LDA (R_000E),Y                                  ;   170F 970F C B1 0E           F:006319
  STA a:R_0051,Y                                  ;   1711 9711 C 99 51 00        F:006319
  INY                                             ;   1714 9714 C C8              F:006319
  DEX                                             ;   1715 9715 C CA              F:006319
  BNE B_0_170F                                    ;   1716 9716 C D0 F7           F:006319
  LDX #$4                                         ;   1718 9718 C A2 04           F:006319
B_0_171A:
  LDA (R_000E),Y                                  ;   171A 971A C B1 0E           F:006319
  STA a:R_0051,Y                                  ;   171C 971C C 99 51 00        F:006319
  INY                                             ;   171F 971F C C8              F:006319
  DEX                                             ;   1720 9720 C CA              F:006319
  BNE B_0_171A                                    ;   1721 9721 C D0 F7           F:006319
B_0_1723:
  SEC                                             ;   1723 9723 C 38              F:006300
  RTS                                             ;   1724 9724 C 60              F:006300

L_0_1725:
  LDA #$1                                         ;   1725 9725 C A9 01           F:006300
  STA R_04D0                                      ;   1727 9727 C 8D D0 04        F:006300
  LDX ActiveFamily                                ;   172A 972A C A6 0B           F:006300
  JSR L_0_1B37                                    ;   172C 972C C 20 37 9B        F:006300
  BCS B_0_174F                                    ;   172F 972F C B0 1E           F:006300
  LDA JoypadInputsCtl0,X                          ;   1731 9731 C B5 EA           F:006421
  AND #$2                                         ;   1733 9733 C 29 02           F:006421
  BNE B_0_1759                                    ;   1735 9735 C D0 22           F:006421
  LDA JoypadInputsCtl0,X                          ;   1737 9737 C B5 EA           F:006421
  AND #$1                                         ;   1739 9739 C 29 01           F:006421
  BNE B_0_1776                                    ;   173B 973B C D0 39           F:006421
  LDA JoypadInputsCtl0,X                          ;   173D 973D C B5 EA           F:006421
  AND #$4                                         ;   173F 973F C 29 04           F:006421
  BNE B_0_1759                                    ;   1741 9741 C D0 16           F:006421
  LDA JoypadInputsCtl0,X                          ;   1743 9743 C B5 EA           F:006421
  AND #$8                                         ;   1745 9745 C 29 08           F:006421
  BNE B_0_1776                                    ;   1747 9747 C D0 2D           F:006421
  LDA JoypadInputsCtl0,X                          ;   1749 9749 C B5 EA           F:006421
  AND #$80                                        ;   174B 974B C 29 80           F:006421
  BNE B_0_1792                                    ;   174D 974D C D0 43           F:006421
B_0_174F:
  LDA R_00D2                                      ;   174F 974F C A5 D2           F:006300
  BPL B_0_1774                                    ;   1751 9751 C 10 21           F:006300
  LDA #$0                                         ;   1753 9753 C A9 00           F:006422
  STA R_00D2                                      ;   1755 9755 C 85 D2           F:006422
  SEC                                             ;   1757 9757 C 38              F:006422
  RTS                                             ;   1758 9758 C 60              F:006422

B_0_1759:
  LDA #$FF                                        ;   1759 9759 C A9 FF           F:006442
  STA R_00D2                                      ;   175B 975B C 85 D2           F:006442
  LDX R_00D1                                      ;   175D 975D C A6 D1           F:006442
  DEC R_0048,X                                    ;   175F 975F C D6 48           F:006442
  LDA R_0048,X                                    ;   1761 9761 C B5 48           F:006442
  CMP #$41                                        ;   1763 9763 C C9 41           F:006442
  BCS B_0_1775                                    ;   1765 9765 C B0 0E           F:006442
  CPX #$0                                         ;   1767 9767 C E0 00           F:006442
  BEQ B_0_1770                                    ;   1769 9769 C F0 05           F:006442
  LDA #$5B                                        ;   176B 976B C A9 5B           F:006442
  JMP L_0_1772                                    ;   176D 976D C 4C 72 97        F:006442

B_0_1770:
  LDA #$5A                                        ;   1770 9770 . A9 5A           
L_0_1772:
  STA R_0048,X                                    ;   1772 9772 C 95 48           F:006442
B_0_1774:
  SEC                                             ;   1774 9774 C 38              F:006300
B_0_1775:
  RTS                                             ;   1775 9775 C 60              F:006300

B_0_1776:
  LDA #$FF                                        ;   1776 9776 C A9 FF           F:046652
  STA R_00D2                                      ;   1778 9778 C 85 D2           F:046652
  LDX R_00D1                                      ;   177A 977A C A6 D1           F:046652
  BNE B_0_1784                                    ;   177C 977C C D0 06           F:046652
  LDA R_0048,X                                    ;   177E 977E . B5 48           
  CMP #$5A                                        ;   1780 9780 . C9 5A           
  BEQ B_0_178C                                    ;   1782 9782 . F0 08           
B_0_1784:
  INC R_0048,X                                    ;   1784 9784 C F6 48           F:046652
  LDA R_0048,X                                    ;   1786 9786 C B5 48           F:046652
  CMP #$5C                                        ;   1788 9788 C C9 5C           F:046652
  BCC B_0_1774                                    ;   178A 978A C 90 E8           F:046652
B_0_178C:
  LDA #$41                                        ;   178C 978C C A9 41           F:046652
  STA R_0048,X                                    ;   178E 978E C 95 48           F:046652
  SEC                                             ;   1790 9790 C 38              F:046652
  RTS                                             ;   1791 9791 C 60              F:046652

B_0_1792:
  LDA #$FE                                        ;   1792 9792 C A9 FE           F:006421
  STA R_00D2                                      ;   1794 9794 C 85 D2           F:006421
  JSR L_0_16D5                                    ;   1796 9796 C 20 D5 96        F:006421
  LDX R_00D1                                      ;   1799 9799 C A6 D1           F:006421
  LDA R_0048,X                                    ;   179B 979B C B5 48           F:006421
  CMP #$5B                                        ;   179D 979D C C9 5B           F:006421
  BEQ B_0_17B5                                    ;   179F 979F C F0 14           F:006421
  LDA #$FE                                        ;   17A1 97A1 C A9 FE           F:006421
  STA R_0050                                      ;   17A3 97A3 C 85 50           F:006421
  LDA R_00D1                                      ;   17A5 97A5 C A5 D1           F:006421
  CMP #$7                                         ;   17A7 97A7 C C9 07           F:006421
  BEQ B_0_17B6                                    ;   17A9 97A9 C F0 0B           F:006421
  LDA R_00CF                                      ;   17AB 97AB C A5 CF           F:006421
  CMP #$77                                        ;   17AD 97AD C C9 77           F:006421
  BCS B_0_17B6                                    ;   17AF 97AF C B0 05           F:006421
  INC R_00D1                                      ;   17B1 97B1 C E6 D1           F:006421
  SEC                                             ;   17B3 97B3 C 38              F:006421
  RTS                                             ;   17B4 97B4 C 60              F:006421

B_0_17B5:
  DEX                                             ;   17B5 97B5 C CA              F:006454
B_0_17B6:
  LDA R_0048,X                                    ;   17B6 97B6 C B5 48           F:006454
  ORA #$80                                        ;   17B8 97B8 C 09 80           F:006454
  STA R_0048,X                                    ;   17BA 97BA C 95 48           F:006454
  CLC                                             ;   17BC 97BC C 18              F:006454
  RTS                                             ;   17BD 97BD C 60              F:006454

L_0_17BE:
  LDA R_035E                                      ;   17BE 97BE C AD 5E 03        F:007208
  BNE B_0_17DE                                    ;   17C1 97C1 C D0 1B           F:007208
  JSR L_0_17FA                                    ;   17C3 97C3 C 20 FA 97        F:007208
  LSR R_000F                                      ;   17C6 97C6 C 46 0F           F:007208
  SEC                                             ;   17C8 97C8 C 38              F:007208
  LDA #$70                                        ;   17C9 97C9 C A9 70           F:007208
  SBC R_000F                                      ;   17CB 97CB C E5 0F           F:007208
  STA R_00CF                                      ;   17CD 97CD C 85 CF           F:007208
  LDA #$20                                        ;   17CF 97CF C A9 20           F:007208
  STA R_00D0                                      ;   17D1 97D1 C 85 D0           F:007208
  LDA #$1                                         ;   17D3 97D3 C A9 01           F:007208
  STA R_035E                                      ;   17D5 97D5 C 8D 5E 03        F:007208
  LDA #$0                                         ;   17D8 97D8 C A9 00           F:007208
  STA R_00D1                                      ;   17DA 97DA C 85 D1           F:007208
  STA R_000F                                      ;   17DC 97DC C 85 0F           F:007208
B_0_17DE:
  LDA #$FD                                        ;   17DE 97DE C A9 FD           F:007208
  STA R_0050                                      ;   17E0 97E0 C 85 50           F:007208
  LDX R_00D1                                      ;   17E2 97E2 C A6 D1           F:007208
  LDA R_0048,X                                    ;   17E4 97E4 C B5 48           F:007208
  AND #$7F                                        ;   17E6 97E6 C 29 7F           F:007208
  JSR L_0_16E3                                    ;   17E8 97E8 C 20 E3 96        F:007208
  LDX R_00D1                                      ;   17EB 97EB C A6 D1           F:007208
  LDA R_0048,X                                    ;   17ED 97ED C B5 48           F:007208
  BMI B_0_17F3                                    ;   17EF 97EF C 30 02           F:007208
  SEC                                             ;   17F1 97F1 C 38              F:007208
  RTS                                             ;   17F2 97F2 C 60              F:007208

B_0_17F3:
  LDA #$0                                         ;   17F3 97F3 C A9 00           F:007213
  STA R_035E                                      ;   17F5 97F5 C 8D 5E 03        F:007213
  CLC                                             ;   17F8 97F8 C 18              F:007213
  RTS                                             ;   17F9 97F9 C 60              F:007213

L_0_17FA:
  LDA #$0                                         ;   17FA 97FA C A9 00           F:006651
  STA R_000F                                      ;   17FC 97FC C 85 0F           F:006651
  LDX ActiveFamily                                ;   17FE 97FE C A6 0B           F:006651
  LDY D_0_0FC6,X                                  ;   1800 9800 C BC C6 8F        F:006651
  LDX #$0                                         ;   1803 9803 C A2 00           F:006651
B_0_1805:
  LDA Family1Name,Y                               ;   1805 9805 C B9 00 03        F:006651
  STA R_0048,X                                    ;   1808 9808 C 95 48           F:006651
  PHP                                             ;   180A 980A C 08              F:006651
  INX                                             ;   180B 980B C E8              F:006651
  INY                                             ;   180C 980C C C8              F:006651
  STY R_000E                                      ;   180D 980D C 84 0E           F:006651
  AND #$7F                                        ;   180F 980F C 29 7F           F:006651
  SEC                                             ;   1811 9811 C 38              F:006651
  SBC #$41                                        ;   1812 9812 C E9 41           F:006651
  TAY                                             ;   1814 9814 C A8              F:006651
  CLC                                             ;   1815 9815 C 18              F:006651
  LDA D_0_1488,Y                                  ;   1816 9816 C B9 88 94        F:006651
  ADC R_000F                                      ;   1819 9819 C 65 0F           F:006651
  STA R_000F                                      ;   181B 981B C 85 0F           F:006651
  LDY R_000E                                      ;   181D 981D C A4 0E           F:006651
  PLP                                             ;   181F 981F C 28              F:006651
  BPL B_0_1805                                    ;   1820 9820 C 10 E3           F:006651
  STX R_0010                                      ;   1822 9822 C 86 10           F:006651
  RTS                                             ;   1824 9824 C 60              F:006651

D_0_1825:
.byte $EF                                         ;   1825 9825 D        ?        F:013955
D_0_1826:
.byte $22                                         ;   1826 9826 D        "        F:013955
.byte $F2,$22                                     ;   1827 9827 DD       ?"       F:010031
L_0_1829:
  LDX ActiveFamily                                ;   1829 9829 C A6 0B           F:006298
  LDY D_0_0FC6,X                                  ;   182B 982B C BC C6 8F        F:006298
  LDA Family1Name,Y                               ;   182E 982E C B9 00 03        F:006298
  CMP #$A0                                        ;   1831 9831 C C9 A0           F:006298
  BEQ B_0_186D                                    ;   1833 9833 C F0 38           F:006298
  JSR L_0_17FA                                    ;   1835 9835 C 20 FA 97        F:010031
  LDA ActiveFamily                                ;   1838 9838 C A5 0B           F:010031
  ASL                                             ;   183A 983A C 0A              F:010031
  TAX                                             ;   183B 983B C AA              F:010031
  SEC                                             ;   183C 983C C 38              F:010031
  LDA D_0_1825,X                                  ;   183D 983D C BD 25 98        F:010031
  SBC R_0010                                      ;   1840 9840 C E5 10           F:010031
  PHA                                             ;   1842 9842 C 48              F:010031
  LDA D_0_1826,X                                  ;   1843 9843 C BD 26 98        F:010031
  STA PpuAddr_2006                                ;   1846 9846 C 8D 06 20        F:010031
  PLA                                             ;   1849 9849 C 68              F:010031
  STA PpuAddr_2006                                ;   184A 984A C 8D 06 20        F:010031
  LDX ActiveFamily                                ;   184D 984D C A6 0B           F:010031
  LDY D_0_0FC6,X                                  ;   184F 984F C BC C6 8F        F:010031
B_0_1852:
  LDA Family1Name,Y                               ;   1852 9852 C B9 00 03        F:010031
  PHP                                             ;   1855 9855 C 08              F:010031
  AND #$7F                                        ;   1856 9856 C 29 7F           F:010031
  SEC                                             ;   1858 9858 C 38              F:010031
  SBC #$41                                        ;   1859 9859 C E9 41           F:010031
  ASL                                             ;   185B 985B C 0A              F:010031
  TAX                                             ;   185C 985C C AA              F:010031
  LDA D_0_0FD1,X                                  ;   185D 985D C BD D1 8F        F:010031
  STA PpuData_2007                                ;   1860 9860 C 8D 07 20        F:010031
  LDA D_0_0FD2,X                                  ;   1863 9863 C BD D2 8F        F:010031
  STA PpuData_2007                                ;   1866 9866 C 8D 07 20        F:010031
  INY                                             ;   1869 9869 C C8              F:010031
  PLP                                             ;   186A 986A C 28              F:010031
  BPL B_0_1852                                    ;   186B 986B C 10 E5           F:010031
B_0_186D:
  RTS                                             ;   186D 986D C 60              F:006298

D_0_186E:
.byte $80                                         ;   186E 986E D        ?        F:006298
.byte $00                                         ;   186F 986F D        ?        F:007147
D_0_1870:
.byte $16                                         ;   1870 9870 D        ?        F:006298
.byte $06                                         ;   1871 9871 D        ?        F:007147
L_0_1872:
  JSR L_0_1886                                    ;   1872 9872 C 20 86 98        F:006298
B_0_1875:
  JSR L_2_52D6                                    ;   1875 9875 C 20 D6 D2        F:006298
  JSR DrawFamilyMember                                    ;   1878 9878 C 20 85 DA        F:006298
  LDX R_05C3                                      ;   187B 987B C AE C3 05        F:006298
  LDA R_05E3,X                                    ;   187E 987E C BD E3 05        F:006298
  CMP #$FF                                        ;   1881 9881 C C9 FF           F:006298
  BNE B_0_1875                                    ;   1883 9883 C D0 F0           F:006298
  RTS                                             ;   1885 9885 C 60              F:006298

L_0_1886:
  LDX R_05C3                                      ;   1886 9886 C AE C3 05        F:006298
  BMI B_0_188E                                    ;   1889 9889 C 30 03           F:006298
  JSR L_2_52B0                                    ;   188B 988B C 20 B0 D2        F:006298
B_0_188E:
  JSR L_2_529D                                    ;   188E 988E C 20 9D D2        F:006298
  STX R_05C3                                      ;   1891 9891 C 8E C3 05        F:006298
  LDY ActiveFamily                                ;   1894 9894 C A4 0B           F:006298
  LDA D_0_1870,Y                                  ;   1896 9896 C B9 70 98        F:006298
  STA R_05E5,X                                    ;   1899 9899 C 9D E5 05        F:006298
  LDA #$10                                        ;   189C 989C C A9 10           F:006298
  STA R_05E7,X                                    ;   189E 989E C 9D E7 05        F:006298
  LDA D_0_186E,Y                                  ;   18A1 98A1 C B9 6E 98        F:006298
  STA R_05F7,X                                    ;   18A4 98A4 C 9D F7 05        F:006298
  LDY R_04DA                                      ;   18A7 98A7 C AC DA 04        F:006298
  LDA D_0_0FCD,Y                                  ;   18AA 98AA C B9 CD 8F        F:006298
  STA R_05E3,X                                    ;   18AD 98AD C 9D E3 05        F:006298
  RTS                                             ;   18B0 98B0 C 60              F:006298

D_0_18B1:
.byte $00                                         ;   18B1 98B1 D        ?        F:007147
.byte $1C                                         ;   18B2 98B2 D        ?        F:006298
.byte $38                                         ;   18B3 98B3 D        8        F:023618
D_0_18B4:
.byte $00                                         ;   18B4 98B4 D        ?        F:006298
.byte $0E                                         ;   18B5 98B5 D        ?        F:007147
D_0_18B6:
.byte $CC,$67,$55,$91,$64,$11,$00,$00             ;   18B6 98B6 DDDDDDDD ?gU?d??? F:022867
.byte $08,$06,$0D,$0B,$06,$01                     ;   18BE 98BE DDDDDD   ??????   F:022867
.byte $44,$91,$64,$55,$9D,$23,$00,$00             ;   18C4 98C4 DDDDDDDD D?dU?#?? F:007147
.byte $04,$09,$0E,$07,$09,$02                     ;   18CC 98CC DDDDDD   ??????   F:007147
.byte $44,$55,$99,$22,$C4,$31,$00,$00             ;   18D2 98D2 DDDDDDDD DU?"?1?? F:006298
.byte $04,$05,$09,$02,$0C,$03                     ;   18DA 98DA DDDDDD   ??????   F:006298
.byte $C4,$31,$88,$66,$55,$11,$00,$00             ;   18E0 98E0 DDDDDDDD ?1?fU??? F:046048
.byte $0C,$03,$08,$06,$05,$01                     ;   18E8 98E8 DDDDDD   ??????   F:046048
.byte $44,$9D,$EB,$76,$11,$00,$00,$00             ;   18EE 98EE ........ D??v???? 
.byte $04,$09,$0E,$07,$01,$00                     ;   18F6 98F6 ......   ??????   
.byte $00,$44,$D9,$BE,$67,$11,$00,$00             ;   18FC 98FC DDDDDDDD ?D??g??? F:023618
.byte $00,$04,$0D,$0B,$06,$01                     ;   1904 9904 DDDDDD   ??????   F:023618
L_0_190A:
  LDA #$23                                        ;   190A 990A C A9 23           F:006298
  STA PpuAddr_2006                                ;   190C 990C C 8D 06 20        F:006298
  LDA #$E1                                        ;   190F 990F C A9 E1           F:006298
  STA PpuAddr_2006                                ;   1911 9911 C 8D 06 20        F:006298
  LDX ActiveFamily                                ;   1914 9914 C A6 0B           F:006298
  LDY Family1,X                                   ;   1916 9916 C BC 15 03        F:006298
  LDA D_0_18B1,Y                                  ;   1919 9919 C B9 B1 98        F:006298
  CLC                                             ;   191C 991C C 18              F:006298
  ADC D_0_18B4,X                                  ;   191D 991D C 7D B4 98        F:006298
  TAY                                             ;   1920 9920 C A8              F:006298
  LDX #$E                                         ;   1921 9921 C A2 0E           F:006298
B_0_1923:
  LDA D_0_18B6,Y                                  ;   1923 9923 C B9 B6 98        F:006298
  STA PpuData_2007                                ;   1926 9926 C 8D 07 20        F:006298
  INY                                             ;   1929 9929 C C8              F:006298
  DEX                                             ;   192A 992A C CA              F:006298
  BNE B_0_1923                                    ;   192B 992B C D0 F6           F:006298
  RTS                                             ;   192D 992D C 60              F:006298

L_0_192E:
  LDX ActiveFamily                                ;   192E 992E C A6 0B           F:006298
  LDY Family1,X                                   ;   1930 9930 C BC 15 03        F:006298
  LDA D_0_1013,Y                                  ;   1933 9933 C B9 13 90        F:006298
  ASL                                             ;   1936 9936 C 0A              F:006298
  TAY                                             ;   1937 9937 C A8              F:006298
  LDA PalettePtrs,Y                                  ;   1938 9938 C B9 60 A4        F:006298
  STA R_000E                                      ;   193B 993B C 85 0E           F:006298
  LDA PalettePtrs+1,Y                                  ;   193D 993D C B9 61 A4        F:006298
  STA R_000F                                      ;   1940 9940 C 85 0F           F:006298
  LDY #$0                                         ;   1942 9942 C A0 00           F:006298
B_0_1944:
  LDA (R_000E),Y                                  ;   1944 9944 C B1 0E           F:006298
  STA R_032D,Y                                    ;   1946 9946 C 99 2D 03        F:006298
  LDA #$F                                         ;   1949 9949 C A9 0F           F:006298
  STA PaletteBackgroundCopy,Y                     ;   194B 994B C 99 1D 03        F:006298
  INY                                             ;   194E 994E C C8              F:006298
  CPY #$10                                        ;   194F 994F C C0 10           F:006298
  BNE B_0_1944                                    ;   1951 9951 C D0 F1           F:006298
  RTS                                             ;   1953 9953 C 60              F:006298

MMC1SetCHR0:
  STA L_1_3FFF                                    ;   1954 9954 C 8D FF BF        F:000004
  LSR                                             ;   1957 9957 C 4A              F:000004
  STA L_1_3FFF                                    ;   1958 9958 C 8D FF BF        F:000004
  LSR                                             ;   195B 995B C 4A              F:000004
  STA L_1_3FFF                                    ;   195C 995C C 8D FF BF        F:000004
  LSR                                             ;   195F 995F C 4A              F:000004
  STA L_1_3FFF                                    ;   1960 9960 C 8D FF BF        F:000004
  LSR                                             ;   1963 9963 C 4A              F:000004
  STA L_1_3FFF                                    ;   1964 9964 C 8D FF BF        F:000004
  RTS                                             ;   1967 9967 C 60              F:000004

MMC1SetCHR1:
  STA $DFFF                                    ;   1968 9968 C 8D FF DF        F:000004
  LSR                                             ;   196B 996B C 4A              F:000004
  STA $DFFF                                    ;   196C 996C C 8D FF DF        F:000004
  LSR                                             ;   196F 996F C 4A              F:000004
  STA $DFFF                                    ;   1970 9970 C 8D FF DF        F:000004
  LSR                                             ;   1973 9973 C 4A              F:000004
  STA $DFFF                                    ;   1974 9974 C 8D FF DF        F:000004
  LSR                                             ;   1977 9977 C 4A              F:000004
  STA $DFFF                                    ;   1978 9978 C 8D FF DF        F:000004
  RTS                                             ;   197B 997B C 60              F:000004

MMC1Setup:
  STA L_0_1FFF                                    ;   197C 997C C 8D FF 9F        F:000004
  LSR                                             ;   197F 997F C 4A              F:000004
  STA L_0_1FFF                                    ;   1980 9980 C 8D FF 9F        F:000004
  LSR                                             ;   1983 9983 C 4A              F:000004
  STA L_0_1FFF                                    ;   1984 9984 C 8D FF 9F        F:000004
  LSR                                             ;   1987 9987 C 4A              F:000004
  STA L_0_1FFF                                    ;   1988 9988 C 8D FF 9F        F:000004
  LSR                                             ;   198B 998B C 4A              F:000004
  STA L_0_1FFF                                    ;   198C 998C C 8D FF 9F        F:000004
  RTS                                             ;   198F 998F C 60              F:000004

.byte $8D,$FF,$FF,$4A,$8D,$FF,$FF,$4A             ;   1990 9990 ........ ???J???J 
.byte $8D,$FF,$FF,$4A,$8D,$FF,$FF,$4A             ;   1998 9998 ........ ???J???J 
.byte $8D,$FF,$FF,$60                             ;   19A0 99A0 ....     ???`     
PPUMASKHideBackground:
  LDA PPUMASK_Mirror                              ;   19A4 99A4 C A5 0D           F:000004
  AND #$F7                                        ;   19A6 99A6 C 29 F7           F:000004
  STA PPUMASK_Mirror                              ;   19A8 99A8 C 85 0D           F:000004
  RTS                                             ;   19AA 99AA C 60              F:000004

PPUMASKShowBackground:
  LDA PPUMASK_Mirror                              ;   19AB 99AB C A5 0D           F:000006
  ORA #$8                                         ;   19AD 99AD C 09 08           F:000006
  STA PPUMASK_Mirror                              ;   19AF 99AF C 85 0D           F:000006
  RTS                                             ;   19B1 99B1 C 60              F:000006

PPUMASKHideSprites:
  LDA PPUMASK_Mirror                              ;   19B2 99B2 C A5 0D           F:000004
  AND #$EF                                        ;   19B4 99B4 C 29 EF           F:000004
  STA PPUMASK_Mirror                              ;   19B6 99B6 C 85 0D           F:000004
  RTS                                             ;   19B8 99B8 C 60              F:000004

PPUMASKShowSprites:
  LDA PPUMASK_Mirror                              ;   19B9 99B9 C A5 0D           F:006018
  ORA #$10                                        ;   19BB 99BB C 09 10           F:006018
  STA PPUMASK_Mirror                              ;   19BD 99BD C 85 0D           F:006018
  RTS                                             ;   19BF 99BF C 60              F:006018

PPUHideAllAndWaitForNMI:
  JSR PPUMASKHideSprites                                    ;   19C0 99C0 C 20 B2 99        F:006101
  JSR PPUMASKHideBackground                                    ;   19C3 99C3 C 20 A4 99        F:006101
  JSR PPUCTRLMirrorDisableNMI                                    ;   19C6 99C6 C 20 E8 CA        F:006101
  JMP DelayUntilNMI                                    ;   19C9 99C9 C 4C F9 CA        F:006101

PPUHideAll:
  JSR PPUMASKHideSprites                                    ;   19CC 99CC C 20 B2 99        F:000004
  JSR PPUMASKHideBackground                                    ;   19CF 99CF C 20 A4 99        F:000004
  JMP PPUCTRLMirrorDisableNMI                                    ;   19D2 99D2 C 4C E8 CA        F:000004

MoveSpritesOffscreen:
  LDY #$4                                         ;   19D5 99D5 C A0 04           F:006007
  LDA #$FF                                        ;   19D7 99D7 C A9 FF           F:006007
: STA SprYPos,Y                                   ;   19D9 99D9 C 99 00 02        F:006007
  INY                                             ;   19DC 99DC C C8              F:006007
  INY                                             ;   19DD 99DD C C8              F:006007
  INY                                             ;   19DE 99DE C C8              F:006007
  INY                                             ;   19DF 99DF C C8              F:006007
  BNE :-                                    ;   19E0 99E0 C D0 F7           F:006007
  RTS                                             ;   19E2 99E2 C 60              F:006007

PPUCTRLSetWriteHorizontal:
  LDA PPUCTRL_Mirror                              ;   19E3 99E3 C A5 0C           F:000007
  AND #$FB                                        ;   19E5 99E5 C 29 FB           F:000007
  STA PpuControl_2000                             ;   19E7 99E7 C 8D 00 20        F:000007
  STA PPUCTRL_Mirror                              ;   19EA 99EA C 85 0C           F:000007
  RTS                                             ;   19EC 99EC C 60              F:000007

PPUCTRLSetWriteVertical:
  LDA PPUCTRL_Mirror                              ;   19ED 99ED C A5 0C           F:006105
  ORA #$4                                         ;   19EF 99EF C 09 04           F:006105
  STA PpuControl_2000                             ;   19F1 99F1 C 8D 00 20        F:006105
  STA PPUCTRL_Mirror                              ;   19F4 99F4 C 85 0C           F:006105
  RTS                                             ;   19F6 99F6 C 60              F:006105

L_0_19F7:
  STA R_0028                                      ;   19F7 99F7 C 85 28           F:000006
  LDA #$3C                                        ;   19F9 99F9 C A9 3C           F:000006
  STA R_0026                                      ;   19FB 99FB C 85 26           F:000006
  STA R_0027                                      ;   19FD 99FD C 85 27           F:000006
  RTS                                             ;   19FF 99FF C 60              F:000006

L_0_1A00:
  LDA R_05A1                                      ;   1A00 9A00 C AD A1 05        F:006107
  CMP #$78                                        ;   1A03 9A03 C C9 78           F:006107
  BCS B_0_1A0A                                    ;   1A05 9A05 C B0 03           F:006107
  INC R_05A1                                      ;   1A07 9A07 C EE A1 05        F:006107
B_0_1A0A:
  RTS                                             ;   1A0A 9A0A C 60              F:006107

L_0_1A0B:
  LDX #$1                                         ;   1A0B 9A0B C A2 01           F:000004
  STX PaletteDirtyFlagPending                     ;   1A0D 9A0D C 8E 41 03        F:000004
  DEX                                             ;   1A10 9A10 C CA              F:000004
  STX R_0342                                      ;   1A11 9A11 C 8E 42 03        F:000004
  RTS                                             ;   1A14 9A14 C 60              F:000004

L_0_1A15:
  JSR PPUCTRLEnableNMI                                    ;   1A15 9A15 C 20 EF CA        F:000006
  JSR PPUMASKShowBackground                                    ;   1A18 9A18 C 20 AB 99        F:000006
B_0_1A1B:
  JSR DelayUntilNMI                                    ;   1A1B 9A1B C 20 F9 CA        F:000006
  JSR SoundSystemUpdate                                    ;   1A1E 9A1E C 20 96 BA        F:000007
  JSR L_0_1A7E                                    ;   1A21 9A21 C 20 7E 9A        F:000007
  BCC B_0_1A1B                                    ;   1A24 9A24 C 90 F5           F:000007
  RTS                                             ;   1A26 9A26 C 60              F:000016

B_0_1A27:
  JSR DelayUntilNMI                                    ;   1A27 9A27 C 20 F9 CA        F:034880
  JSR L_0_1A30                                    ;   1A2A 9A2A C 20 30 9A        F:034881
  BCC B_0_1A27                                    ;   1A2D 9A2D C 90 F8           F:034881
  RTS                                             ;   1A2F 9A2F C 60              F:034895

L_0_1A30:
  DEC R_033E                                      ;   1A30 9A30 C CE 3E 03        F:000307
  BPL B_0_1A7C                                    ;   1A33 9A33 C 10 47           F:000307
  LDA #$2                                         ;   1A35 9A35 C A9 02           F:000309
  STA R_033E                                      ;   1A37 9A37 C 8D 3E 03        F:000309
  LDA #$0                                         ;   1A3A 9A3A C A9 00           F:000309
  STA R_033F                                      ;   1A3C 9A3C C 8D 3F 03        F:000309
  LDX #$F                                         ;   1A3F 9A3F C A2 0F           F:000309
B_0_1A41:
  LDA PaletteBackgroundCopy,X                     ;   1A41 9A41 C BD 1D 03        F:000309
  CMP #$F                                         ;   1A44 9A44 C C9 0F           F:000309
  BEQ B_0_1A56                                    ;   1A46 9A46 C F0 0E           F:000309
  BCS B_0_1A4E                                    ;   1A48 9A48 C B0 04           F:000309
  LDA #$F                                         ;   1A4A 9A4A C A9 0F           F:000309
  BNE B_0_1A50                                    ;   1A4C 9A4C C D0 02           F:000309
B_0_1A4E:
  SBC #$10                                        ;   1A4E 9A4E C E9 10           F:000309
B_0_1A50:
  STA PaletteBackgroundCopy,X                     ;   1A50 9A50 C 9D 1D 03        F:000309
  INC R_033F                                      ;   1A53 9A53 C EE 3F 03        F:000309
B_0_1A56:
  DEX                                             ;   1A56 9A56 C CA              F:000309
  BPL B_0_1A41                                    ;   1A57 9A57 C 10 E8           F:000309
  LDX #$F                                         ;   1A59 9A59 C A2 0F           F:000309
B_0_1A5B:
  LDA PaletteSpriteCopy,X                         ;   1A5B 9A5B C B5 30           F:000309
  CMP #$F                                         ;   1A5D 9A5D C C9 0F           F:000309
  BEQ B_0_1A6E                                    ;   1A5F 9A5F C F0 0D           F:000309
  BCS B_0_1A67                                    ;   1A61 9A61 C B0 04           F:000309
  LDA #$F                                         ;   1A63 9A63 C A9 0F           F:000309
  BNE B_0_1A69                                    ;   1A65 9A65 C D0 02           F:000309
B_0_1A67:
  SBC #$10                                        ;   1A67 9A67 C E9 10           F:000309
B_0_1A69:
  STA PaletteSpriteCopy,X                         ;   1A69 9A69 C 95 30           F:000309
  INC R_033F                                      ;   1A6B 9A6B C EE 3F 03        F:000309
B_0_1A6E:
  DEX                                             ;   1A6E 9A6E C CA              F:000309
  BPL B_0_1A5B                                    ;   1A6F 9A6F C 10 EA           F:000309
  LDA R_033F                                      ;   1A71 9A71 C AD 3F 03        F:000309
  BNE B_0_1A79                                    ;   1A74 9A74 C D0 03           F:000309
  JMP L_0_1AB8                                    ;   1A76 9A76 C 4C B8 9A        F:000318

B_0_1A79:
  STA R_0340                                      ;   1A79 9A79 C 8D 40 03        F:000309
B_0_1A7C:
  CLC                                             ;   1A7C 9A7C C 18              F:000307
  RTS                                             ;   1A7D 9A7D C 60              F:000307

L_0_1A7E:
  LDA PaletteDirtyFlagPending                     ;   1A7E 9A7E C AD 41 03        F:000007
  BEQ L_0_1AB8                                    ;   1A81 9A81 C F0 35           F:000007
  DEC R_033E                                      ;   1A83 9A83 C CE 3E 03        F:000007
  BPL B_0_1AC2                                    ;   1A86 9A86 C 10 3A           F:000007
  LDA #$2                                         ;   1A88 9A88 C A9 02           F:000007
  STA R_033E                                      ;   1A8A 9A8A C 8D 3E 03        F:000007
  LDA #$0                                         ;   1A8D 9A8D C A9 00           F:000007
  STA R_033F                                      ;   1A8F 9A8F C 8D 3F 03        F:000007
  LDX #$F                                         ;   1A92 9A92 C A2 0F           F:000007
B_0_1A94:
  LDA R_032D,X                                    ;   1A94 9A94 C BD 2D 03        F:000007
  CMP PaletteBackgroundCopy,X                     ;   1A97 9A97 C DD 1D 03        F:000007
  BEQ B_0_1AA7                                    ;   1A9A 9A9A C F0 0B           F:000007
  AND #$F                                         ;   1A9C 9A9C C 29 0F           F:000007
  ORA R_0342                                      ;   1A9E 9A9E C 0D 42 03        F:000007
  STA PaletteBackgroundCopy,X                     ;   1AA1 9AA1 C 9D 1D 03        F:000007
  INC R_033F                                      ;   1AA4 9AA4 C EE 3F 03        F:000007
B_0_1AA7:
  DEX                                             ;   1AA7 9AA7 C CA              F:000007
  BPL B_0_1A94                                    ;   1AA8 9AA8 C 10 EA           F:000007
  CLC                                             ;   1AAA 9AAA C 18              F:000007
  LDA R_0342                                      ;   1AAB 9AAB C AD 42 03        F:000007
  ADC #$10                                        ;   1AAE 9AAE C 69 10           F:000007
  STA R_0342                                      ;   1AB0 9AB0 C 8D 42 03        F:000007
  LDA R_033F                                      ;   1AB3 9AB3 C AD 3F 03        F:000007
  BNE B_0_1AC2                                    ;   1AB6 9AB6 C D0 0A           F:000007
L_0_1AB8:
  LDA #$0                                         ;   1AB8 9AB8 C A9 00           F:000016
  STA PaletteDirtyFlagPending                     ;   1ABA 9ABA C 8D 41 03        F:000016
  STA R_0340                                      ;   1ABD 9ABD C 8D 40 03        F:000016
  SEC                                             ;   1AC0 9AC0 C 38              F:000016
  RTS                                             ;   1AC1 9AC1 C 60              F:000016

B_0_1AC2:
  LDX #$0                                         ;   1AC2 9AC2 C A2 00           F:000007
  LDA ActiveScene                                 ;   1AC4 9AC4 C AD D3 04        F:000007
  CMP #$2                                         ;   1AC7 9AC7 C C9 02           F:000007
  BEQ B_0_1AD2                                    ;   1AC9 9AC9 C F0 07           F:000007
  CMP #$3                                         ;   1ACB 9ACB C C9 03           F:000007
  BNE SetDefaultSpritePalette                                    ;   1ACD 9ACD C D0 23           F:000007
  LDX a:ActiveFamily                              ;   1ACF 9ACF C AE 0B 00        F:041645
B_0_1AD2:
  LDY Family1,X                                   ;   1AD2 9AD2 C BC 15 03        F:008274
  LDA D_0_1013,Y                                  ;   1AD5 9AD5 C B9 13 90        F:008274
  ASL                                             ;   1AD8 9AD8 C 0A              F:008274
  TAY                                             ;   1AD9 9AD9 C A8              F:008274
  LDA PalettePtrs,Y                                  ;   1ADA 9ADA C B9 60 A4        F:008274
  STA R_000E                                      ;   1ADD 9ADD C 85 0E           F:008274
  LDA PalettePtrs+1,Y                                  ;   1ADF 9ADF C B9 61 A4        F:008274
  STA R_000F                                      ;   1AE2 9AE2 C 85 0F           F:008274
  LDY #$0                                         ;   1AE4 9AE4 C A0 00           F:008274
B_0_1AE6:
  LDA (R_000E),Y                                  ;   1AE6 9AE6 C B1 0E           F:008274
  STA a:PaletteSpriteCopy,Y                       ;   1AE8 9AE8 C 99 30 00        F:008274
  INY                                             ;   1AEB 9AEB C C8              F:008274
  CPY #$10                                        ;   1AEC 9AEC C C0 10           F:008274
  BNE B_0_1AE6                                    ;   1AEE 9AEE C D0 F6           F:008274
  CLC                                             ;   1AF0 9AF0 C 18              F:008274
  RTS                                             ;   1AF1 9AF1 C 60              F:008274

SetDefaultSpritePalette:
  LDX #$F                                         ;   1AF2 9AF2 C A2 0F           F:000007
: LDA PaletteSprites,X                                  ;   1AF4 9AF4 C BD CF D1        F:000007
  STA PaletteSpriteCopy,X                         ;   1AF7 9AF7 C 95 30           F:000007
  DEX                                             ;   1AF9 9AF9 C CA              F:000007
  BPL :-                                    ;   1AFA 9AFA C 10 F8           F:000007
  CLC                                             ;   1AFC 9AFC C 18              F:000007
  RTS                                             ;   1AFD 9AFD C 60              F:000007

JoypadReadBoth:
  LDX #$0                                         ;   1AFE 9AFE C A2 00           F:000336
  JSR JoypadReadSingle                                    ;   1B00 9B00 C 20 04 9B        F:000336
  INX                                             ;   1B03 9B03 C E8              F:000336
JoypadReadSingle:
  LDY #$1                                         ;   1B04 9B04 C A0 01           F:000004
  STY Ctrl1_4016                                  ;   1B06 9B06 C 8C 16 40        F:000004
  DEY                                             ;   1B09 9B09 C 88              F:000004
  STY Ctrl1_4016                                  ;   1B0A 9B0A C 8C 16 40        F:000004
  LDY #$8                                         ;   1B0D 9B0D C A0 08           F:000004
:
  LDA Ctrl1_4016,X                                ;   1B0F 9B0F C BD 16 40        F:000004
  AND #$3                                         ;   1B12 9B12 C 29 03           F:000004
  CMP #$1                                         ;   1B14 9B14 C C9 01           F:000004
  ROL JoypadInputsCtl0,X                          ;   1B16 9B16 C 36 EA           F:000004
  DEY                                             ;   1B18 9B18 C 88              F:000004
  BNE :-                                    ;   1B19 9B19 C D0 F4           F:000004
  RTS                                             ;   1B1B 9B1B C 60              F:000004

JoypadHasChanged:
  JSR JoypadReadBoth                                    ;   1B1C 9B1C C 20 FE 9A        F:000336
  LDA JoypadInputsCtl0                            ;   1B1F 9B1F C A5 EA           F:000336
  ORA JoypadInputsCtl1                            ;   1B21 9B21 C 05 EB           F:000336
  BEQ @NoInputs                                    ;   1B23 9B23 C F0 0C           F:000336
  STA JoypadBoth                                      ;   1B25 9B25 C 85 15           F:005984
  AND JoypadCachedState                           ;   1B27 9B27 C 25 EC           F:005984
  BNE @Exit                                    ;   1B29 9B29 C D0 0A           F:005984
  LDA JoypadBoth                                      ;   1B2B 9B2B C A5 15           F:005984
  STA JoypadCachedState                           ;   1B2D 9B2D C 85 EC           F:005984
  CLC                                             ;   1B2F 9B2F C 18              F:005984
  RTS                                             ;   1B30 9B30 C 60              F:005984

@NoInputs:
  LDA #$0                                         ;   1B31 9B31 C A9 00           F:000336
  STA JoypadCachedState                           ;   1B33 9B33 C 85 EC           F:000336
@Exit:
  SEC                                             ;   1B35 9B35 C 38              F:000336
  RTS                                             ;   1B36 9B36 C 60              F:000336

L_0_1B37:
  BMI B_0_1B6D                                    ;   1B37 9B37 C 30 34           F:006300
  LDA QuestionTopBackgroundTile                   ;   1B39 9B39 C AD 12 03        F:006300
  BNE B_0_1B42                                    ;   1B3C 9B3C C D0 04           F:006300
  CPX #$1                                         ;   1B3E 9B3E C E0 01           F:006300
  BEQ B_0_1B6D                                    ;   1B40 9B40 C F0 2B           F:006300
B_0_1B42:
  JSR JoypadReadSingle                                    ;   1B42 9B42 C 20 04 9B        F:006300
  LDA JoypadInputsCtl0,X                          ;   1B45 9B45 C B5 EA           F:006300
  BEQ B_0_1B5F                                    ;   1B47 9B47 C F0 16           F:006300
  LDY R_04D0                                      ;   1B49 9B49 C AC D0 04        F:006421
  BNE B_0_1B74                                    ;   1B4C 9B4C C D0 26           F:006421
  STA JoypadBoth                                      ;   1B4E 9B4E C 85 15           F:008603
L_0_1B50:
  AND JoypadInputsCtl0Copy,X                      ;   1B50 9B50 C 35 ED           F:006421
  BNE B_0_1B6D                                    ;   1B52 9B52 C D0 19           F:006421
  LDA JoypadBoth                                      ;   1B54 9B54 C A5 15           F:006421
  STA JoypadInputsCtl0Copy,X                      ;   1B56 9B56 C 95 ED           F:006421
  LDA #$0                                         ;   1B58 9B58 C A9 00           F:006421
  STA R_04D0                                      ;   1B5A 9B5A C 8D D0 04        F:006421
  CLC                                             ;   1B5D 9B5D C 18              F:006421
  RTS                                             ;   1B5E 9B5E C 60              F:006421

B_0_1B5F:
  LDA #$1E                                        ;   1B5F 9B5F C A9 1E           F:006300
  STA R_04D2                                      ;   1B61 9B61 C 8D D2 04        F:006300
  LDA #$4                                         ;   1B64 9B64 C A9 04           F:006300
  STA R_04D1                                      ;   1B66 9B66 C 8D D1 04        F:006300
  LDA #$0                                         ;   1B69 9B69 C A9 00           F:006300
  STA JoypadInputsCtl0Copy,X                      ;   1B6B 9B6B C 95 ED           F:006300
B_0_1B6D:
  LDA #$0                                         ;   1B6D 9B6D C A9 00           F:006300
  STA R_04D0                                      ;   1B6F 9B6F C 8D D0 04        F:006300
  SEC                                             ;   1B72 9B72 C 38              F:006300
  RTS                                             ;   1B73 9B73 C 60              F:006300

B_0_1B74:
  LDY #$0                                         ;   1B74 9B74 C A0 00           F:006421
  STY R_04D0                                      ;   1B76 9B76 C 8C D0 04        F:006421
  STA JoypadBoth                                      ;   1B79 9B79 C 85 15           F:006421
  AND #$F0                                        ;   1B7B 9B7B C 29 F0           F:006421
  BNE B_0_1B87                                    ;   1B7D 9B7D C D0 08           F:006421
  LDA R_04D2                                      ;   1B7F 9B7F C AD D2 04        F:006442
  BEQ B_0_1B8C                                    ;   1B82 9B82 C F0 08           F:006442
  DEC R_04D2                                      ;   1B84 9B84 C CE D2 04        F:006442
B_0_1B87:
  LDA JoypadBoth                                      ;   1B87 9B87 C A5 15           F:006421
  JMP L_0_1B50                                    ;   1B89 9B89 C 4C 50 9B        F:006421

B_0_1B8C:
  DEC R_04D1                                      ;   1B8C 9B8C C CE D1 04        F:046716
  BMI B_0_1B96                                    ;   1B8F 9B8F C 30 05           F:046716
  LDA JoypadBoth                                      ;   1B91 9B91 C A5 15           F:046716
  JMP L_0_1B50                                    ;   1B93 9B93 C 4C 50 9B        F:046716

B_0_1B96:
  LDA #$4                                         ;   1B96 9B96 C A9 04           F:046720
  STA R_04D1                                      ;   1B98 9B98 C 8D D1 04        F:046720
  LDA #$0                                         ;   1B9B 9B9B C A9 00           F:046720
  STA JoypadInputsCtl0Copy,X                      ;   1B9D 9B9D C 95 ED           F:046720
  LDA JoypadBoth                                      ;   1B9F 9B9F C A5 15           F:046720
  JMP L_0_1B50                                    ;   1BA1 9BA1 C 4C 50 9B        F:046720

JoypadReadState:
  LDX #$0                                         ;   1BA4 9BA4 C A2 00           F:000004
  JSR JoypadReadSingle                                    ;   1BA6 9BA6 C 20 04 9B        F:000004
  LDA JoypadInputsCtl0                            ;   1BA9 9BA9 C A5 EA           F:000004
  STA JoypadInputsCtl0Copy                        ;   1BAB 9BAB C 85 ED           F:000004
  LDX #$1                                         ;   1BAD 9BAD C A2 01           F:000004
  JSR JoypadReadSingle                                    ;   1BAF 9BAF C 20 04 9B        F:000004
  LDA JoypadInputsCtl1                            ;   1BB2 9BB2 C A5 EB           F:000004
  STA JoypadInputsCtl1Copy                        ;   1BB4 9BB4 C 85 EE           F:000004
  ORA JoypadInputsCtl0Copy                        ;   1BB6 9BB6 C 05 ED           F:000004
  STA JoypadCachedState                           ;   1BB8 9BB8 C 85 EC           F:000004
  RTS                                             ;   1BBA 9BBA C 60              F:000004

AdvanceRNG:
  LDA RNG3                                        ;
  AND #$80                                        ;
  LSR                                             ;
  EOR RNG3                                        ;
  ROL                                             ;
  ROL                                             ;
  ROL RNG1                                        ;
  ROL RNG2                                        ;
  ROL RNG3                                        ;
  RTS                                             ;

DelayUntilVBlank:
: BIT PpuStatus_2002                              ;   1BD0 9BD0 C 2C 02 20        F:006107
  BVS :-                                    ;   1BD3 9BD3 C 70 FB           F:006107
: BIT PpuStatus_2002                              ;   1BD5 9BD5 C 2C 02 20        F:006107
  BVC :-                                    ;   1BD8 9BD8 C 50 FB           F:006107
  RTS                                             ;   1BDA 9BDA C 60              F:006107

L_0_1BDB:
  LDA R_0391                                      ;   1BDB 9BDB C AD 91 03        F:008942
  BEQ B_0_1BEB                                    ;   1BDE 9BDE C F0 0B           F:008942
  CMP #$FF                                        ;   1BE0 9BE0 . C9 FF           
  BEQ B_0_1BE8                                    ;   1BE2 9BE2 . F0 04           
  CMP #$FD                                        ;   1BE4 9BE4 . C9 FD           
  BNE B_0_1BEE                                    ;   1BE6 9BE6 . D0 06           
B_0_1BE8:
  DEC R_0391                                      ;   1BE8 9BE8 . CE 91 03        
B_0_1BEB:
  JSR L_0_1D24                                    ;   1BEB 9BEB C 20 24 9D        F:008942
B_0_1BEE:
  LDA R_0391                                      ;   1BEE 9BEE C AD 91 03        F:008943
  BNE B_0_1C46                                    ;   1BF1 9BF1 C D0 53           F:008943
  LDA QuestionTopBackgroundTile                   ;   1BF3 9BF3 C AD 12 03        F:008943
  BNE B_0_1C0D                                    ;   1BF6 9BF6 C D0 15           F:008943
  LDA ActiveFamily                                ;   1BF8 9BF8 C A5 0B           F:008943
  BEQ B_0_1C0D                                    ;   1BFA 9BFA C F0 11           F:008943
  JSR L_1_3929                                    ;   1BFC 9BFC C 20 29 B9        F:009582
  CPX #$FF                                        ;   1BFF 9BFF C E0 FF           F:009582
  BEQ B_0_1C1D                                    ;   1C01 9C01 C F0 1A           F:009582
  STX R_00E9                                      ;   1C03 9C03 C 86 E9           F:009582
  JSR AutocompleteAnswer                                    ;   1C05 9C05 C 20 73 FF        F:009582
  LDX R_00E9                                      ;   1C08 9C08 C A6 E9           F:009583
  JMP B_0_1C1D                                    ;   1C0A 9C0A C 4C 1D 9C        F:009583

B_0_1C0D:
  LDA #$FF                                        ;   1C0D 9C0D C A9 FF           F:008943
  JSR BeginAnswerValidation                                    ;   1C0F 9C0F C 20 F6 F8        F:008943
B_0_1C12:
  JSR DelayUntilNMI                                    ;   1C12 9C12 C 20 F9 CA        F:008943
  JSR SoundSystemUpdate                                    ;   1C15 9C15 C 20 96 BA        F:008944
  JSR ValidateAnswer                                    ;   1C18 9C18 C 20 22 F9        F:008944
  BCS B_0_1C12                                    ;   1C1B 9C1B C B0 F5           F:008944
B_0_1C1D:
  STX R_04B9                                      ;   1C1D 9C1D C 8E B9 04        F:009033
  CPX #$FF                                        ;   1C20 9C20 C E0 FF           F:009033
  BEQ B_0_1C3E                                    ;   1C22 9C22 C F0 1A           F:009033
  LDA R_0384,X                                    ;   1C24 9C24 C BD 84 03        F:009583
  BNE B_0_1C3C                                    ;   1C27 9C27 C D0 13           F:009583
  TXA                                             ;   1C29 9C29 C 8A              F:009583
  PHA                                             ;   1C2A 9C2A C 48              F:009583
  JSR AutocompleteAnswer                                    ;   1C2B 9C2B C 20 73 FF        F:009583
  PLA                                             ;   1C2E 9C2E C 68              F:009584
  ASL                                             ;   1C2F 9C2F C 0A              F:009584
  TAX                                             ;   1C30 9C30 C AA              F:009584
  LDY ActiveFamily                                ;   1C31 9C31 C A4 0B           F:009584
  LDA R_0394,X                                    ;   1C33 9C33 C BD 94 03        F:009584
  STA R_04BC,Y                                    ;   1C36 9C36 C 99 BC 04        F:009584
  JMP B_0_1C46                                    ;   1C39 9C39 C 4C 46 9C        F:009584

B_0_1C3C:
  SEC                                             ;   1C3C 9C3C . 38              
  RTS                                             ;   1C3D 9C3D . 60              

B_0_1C3E:
  LDA R_0393                                      ;   1C3E 9C3E C AD 93 03        F:009033
  AND #$F                                         ;   1C41 9C41 C 29 0F           F:009033
  STA R_04B9                                      ;   1C43 9C43 C 8D B9 04        F:009033
B_0_1C46:
  LDA #$1                                         ;   1C46 9C46 C A9 01           F:009033
  JSR L_0_19F7                                    ;   1C48 9C48 C 20 F7 99        F:009033
B_0_1C4B:
  JSR DelayUntilNMI                                    ;   1C4B 9C4B C 20 F9 CA        F:009033
  JSR SoundSystemUpdate                                    ;   1C4E 9C4E C 20 96 BA        F:009034
  LDA R_0028                                      ;   1C51 9C51 C A5 28           F:009034
  BNE B_0_1C4B                                    ;   1C53 9C53 C D0 F6           F:009034
  LDA R_0393                                      ;   1C55 9C55 C AD 93 03        F:009093
  AND #$F                                         ;   1C58 9C58 C 29 0F           F:009093
  CMP R_04B9                                      ;   1C5A 9C5A C CD B9 04        F:009093
  BEQ B_0_1C89                                    ;   1C5D 9C5D C F0 2A           F:009093
  JSR L_0_1EBB                                    ;   1C5F 9C5F C 20 BB 9E        F:009644
  LDA #$85                                        ;   1C62 9C62 C A9 85           F:009644
  STA R_05F9                                      ;   1C64 9C64 C 8D F9 05        F:009644
  INC R_0390                                      ;   1C67 9C67 C EE 90 03        F:009644
  LDA #$1                                         ;   1C6A 9C6A C A9 01           F:009644
  STA SpriteUpdateFlags                           ;   1C6C 9C6C C 85 2D           F:009644
  LDA #$0                                         ;   1C6E 9C6E C A9 00           F:009644
  STA R_0011                                      ;   1C70 9C70 C 85 11           F:009644
  JSR DelayUntilNMI                                    ;   1C72 9C72 C 20 F9 CA        F:009644
  JSR SoundSystemUpdate                                    ;   1C75 9C75 C 20 96 BA        F:009645
  LDA #$1                                         ;   1C78 9C78 C A9 01           F:009645
  STA SpriteUpdateFlags                           ;   1C7A 9C7A C 85 2D           F:009645
  LDA #$1                                         ;   1C7C 9C7C C A9 01           F:009645
  STA R_0011                                      ;   1C7E 9C7E C 85 11           F:009645
  JSR DelayUntilNMI                                    ;   1C80 9C80 C 20 F9 CA        F:009645
  JSR SoundSystemUpdate                                    ;   1C83 9C83 C 20 96 BA        F:009646
  JMP L_0_1CDC                                    ;   1C86 9C86 C 4C DC 9C        F:009646

B_0_1C89:
  LDA #$8B                                        ;   1C89 9C89 C A9 8B           F:009093
  STA R_05F9                                      ;   1C8B 9C8B C 8D F9 05        F:009093
  INC R_04C9                                      ;   1C8E 9C8E C EE C9 04        F:009093
  LDA #$0                                         ;   1C91 9C91 C A9 00           F:009093
  STA R_0029                                      ;   1C93 9C93 C 85 29           F:009093
B_0_1C95:
  JSR L_0_1D06                                    ;   1C95 9C95 C 20 06 9D        F:009093
  INC R_0029                                      ;   1C98 9C98 C E6 29           F:009094
  LDA R_0029                                      ;   1C9A 9C9A C A5 29           F:009094
  CMP R_04C9                                      ;   1C9C 9C9C C CD C9 04        F:009094
  BNE B_0_1C95                                    ;   1C9F 9C9F C D0 F4           F:009094
  LDA #$0                                         ;   1CA1 9CA1 C A9 00           F:009094
  STA SpriteUpdateFlags                           ;   1CA3 9CA3 C 85 2D           F:009094
  LDA #$0                                         ;   1CA5 9CA5 C A9 00           F:009094
  STA R_0029                                      ;   1CA7 9CA7 C 85 29           F:009094
B_0_1CA9:
  JSR L_0_1D10                                    ;   1CA9 9CA9 C 20 10 9D        F:009094
  INC R_0029                                      ;   1CAC 9CAC C E6 29           F:009095
  LDA R_0029                                      ;   1CAE 9CAE C A5 29           F:009095
  CMP R_04C9                                      ;   1CB0 9CB0 C CD C9 04        F:009095
  BNE B_0_1CA9                                    ;   1CB3 9CB3 C D0 F4           F:009095
  LDA #$0                                         ;   1CB5 9CB5 C A9 00           F:009095
  STA SpriteUpdateFlags                           ;   1CB7 9CB7 C 85 2D           F:009095
  LDA #$2                                         ;   1CB9 9CB9 C A9 02           F:009095
  JSR L_0_19F7                                    ;   1CBB 9CBB C 20 F7 99        F:009095
B_0_1CBE:
  JSR DelayUntilNMI                                    ;   1CBE 9CBE C 20 F9 CA        F:009095
  JSR SoundSystemUpdate                                    ;   1CC1 9CC1 C 20 96 BA        F:009096
  LDA R_0028                                      ;   1CC4 9CC4 C A5 28           F:009096
  BNE B_0_1CBE                                    ;   1CC6 9CC6 C D0 F6           F:009096
  STA R_0029                                      ;   1CC8 9CC8 C 85 29           F:009215
B_0_1CCA:
  JSR L_0_1D1A                                    ;   1CCA 9CCA C 20 1A 9D        F:009215
  INC R_0029                                      ;   1CCD 9CCD C E6 29           F:009216
  LDA R_0029                                      ;   1CCF 9CCF C A5 29           F:009216
  CMP R_04C9                                      ;   1CD1 9CD1 C CD C9 04        F:009216
  BNE B_0_1CCA                                    ;   1CD4 9CD4 C D0 F4           F:009216
  LDA #$0                                         ;   1CD6 9CD6 C A9 00           F:009216
  STA SpriteUpdateFlags                           ;   1CD8 9CD8 C 85 2D           F:009216
  BEQ B_0_1CE9                                    ;   1CDA 9CDA C F0 0D           F:009216
L_0_1CDC:
  JSR L_0_1F14                                    ;   1CDC 9CDC C 20 14 9F        F:009646
  LDA #$FF                                        ;   1CDF 9CDF C A9 FF           F:009646
  STA SpriteUpdateFlags                           ;   1CE1 9CE1 C 85 2D           F:009646
  JSR DelayUntilNMI                                    ;   1CE3 9CE3 C 20 F9 CA        F:009646
  JSR SoundSystemUpdate                                    ;   1CE6 9CE6 C 20 96 BA        F:009647
B_0_1CE9:
  LDA #$1                                         ;   1CE9 9CE9 C A9 01           F:009216
  JSR L_0_19F7                                    ;   1CEB 9CEB C 20 F7 99        F:009216
B_0_1CEE:
  JSR DelayUntilNMI                                    ;   1CEE 9CEE C 20 F9 CA        F:009216
  JSR SoundSystemUpdate                                    ;   1CF1 9CF1 C 20 96 BA        F:009217
  LDA R_0028                                      ;   1CF4 9CF4 C A5 28           F:009217
  BNE B_0_1CEE                                    ;   1CF6 9CF6 C D0 F6           F:009217
  LDA R_0393                                      ;   1CF8 9CF8 C AD 93 03        F:009276
  AND #$F                                         ;   1CFB 9CFB C 29 0F           F:009276
  CMP R_04B9                                      ;   1CFD 9CFD C CD B9 04        F:009276
  BEQ B_0_1D04                                    ;   1D00 9D00 C F0 02           F:009276
  CLC                                             ;   1D02 9D02 C 18              F:009707
  RTS                                             ;   1D03 9D03 C 60              F:009707

B_0_1D04:
  SEC                                             ;   1D04 9D04 C 38              F:009276
  RTS                                             ;   1D05 9D05 C 60              F:009276

L_0_1D06:
  LDA #$80                                        ;   1D06 9D06 C A9 80           F:009093
  STA SpriteUpdateFlags                           ;   1D08 9D08 C 85 2D           F:009093
  JSR DelayUntilNMI                                    ;   1D0A 9D0A C 20 F9 CA        F:009093
  JMP SoundSystemUpdate                                    ;   1D0D 9D0D C 4C 96 BA        F:009094

L_0_1D10:
  LDA #$40                                        ;   1D10 9D10 C A9 40           F:009094
  STA SpriteUpdateFlags                           ;   1D12 9D12 C 85 2D           F:009094
  JSR DelayUntilNMI                                    ;   1D14 9D14 C 20 F9 CA        F:009094
  JMP SoundSystemUpdate                                    ;   1D17 9D17 C 4C 96 BA        F:009095

L_0_1D1A:
  LDA #$C0                                        ;   1D1A 9D1A C A9 C0           F:009215
  STA SpriteUpdateFlags                           ;   1D1C 9D1C C 85 2D           F:009215
  JSR DelayUntilNMI                                    ;   1D1E 9D1E C 20 F9 CA        F:009215
  JMP SoundSystemUpdate                                    ;   1D21 9D21 C 4C 96 BA        F:009216

L_0_1D24:
  LDA #$5                                         ;   1D24 9D24 C A9 05           F:008942
  JSR SetNMIRoutine                                    ;   1D26 9D26 C 20 C7 CA        F:008942
  LDA ActiveScene                                 ;   1D29 9D29 C AD D3 04        F:008942
  STA R_04D4                                      ;   1D2C 9D2C C 8D D4 04        F:008942
  LDA #$FF                                        ;   1D2F 9D2F C A9 FF           F:008942
  STA ActiveScene                                 ;   1D31 9D31 C 8D D3 04        F:008942
  LDA #$1                                         ;   1D34 9D34 C A9 01           F:008942
  LDX #$2                                         ;   1D36 9D36 C A2 02           F:008942
  LDY #$0                                         ;   1D38 9D38 C A0 00           F:008942
  JSR L_2_4B00                                    ;   1D3A 9D3A C 20 00 CB        F:008942
  JSR DelayUntilNMI                                    ;   1D3D 9D3D C 20 F9 CA        F:008942
  LDA R_04D4                                      ;   1D40 9D40 C AD D4 04        F:008943
  STA ActiveScene                                 ;   1D43 9D43 C 8D D3 04        F:008943
  RTS                                             ;   1D46 9D46 C 60              F:008943

L_0_1D47:
  LDA R_0393                                      ;   1D47 9D47 C AD 93 03        F:008272
  AND #$F                                         ;   1D4A 9D4A C 29 0F           F:008272
  STA R_0011                                      ;   1D4C 9D4C C 85 11           F:008272
  DEC R_0011                                      ;   1D4E 9D4E C C6 11           F:008272
  CMP #$C                                         ;   1D50 9D50 C C9 0C           F:008272
  BEQ B_0_1D5F                                    ;   1D52 9D52 C F0 0B           F:008272
  LDX #$B                                         ;   1D54 9D54 C A2 0B           F:008272
B_0_1D56:
  TXA                                             ;   1D56 9D56 C 8A              F:008272
  JSR L_0_1D6C                                    ;   1D57 9D57 C 20 6C 9D        F:008272
  DEX                                             ;   1D5A 9D5A C CA              F:008272
  CPX R_0011                                      ;   1D5B 9D5B C E4 11           F:008272
  BNE B_0_1D56                                    ;   1D5D 9D5D C D0 F7           F:008272
B_0_1D5F:
  LDX R_0011                                      ;   1D5F 9D5F C A6 11           F:008272
B_0_1D61:
  TXA                                             ;   1D61 9D61 C 8A              F:008272
  JSR L_0_1DB3                                    ;   1D62 9D62 C 20 B3 9D        F:008272
  DEX                                             ;   1D65 9D65 C CA              F:008272
  BPL B_0_1D61                                    ;   1D66 9D66 C 10 F9           F:008272
  RTS                                             ;   1D68 9D68 C 60              F:008272

D_0_1D69:
.byte $00                                         ;   1D69 9D69 D        ?        F:008272
.byte $00                                         ;   1D6A 9D6A D        ?        F:043045
.byte $06                                         ;   1D6B 9D6B D        ?        F:069373
L_0_1D6C:
  LDY IsInFastMoney                                      ;   1D6C 9D6C C AC 43 05        F:008272
  CLC                                             ;   1D6F 9D6F C 18              F:008272
  ADC D_0_1D69,Y                                  ;   1D70 9D70 C 79 69 9D        F:008272
  ASL                                             ;   1D73 9D73 C 0A              F:008272
  TAY                                             ;   1D74 9D74 C A8              F:008272
  LDA D_1_2051,Y                                  ;   1D75 9D75 C B9 51 A0        F:008272
  STA PpuAddr_2006                                ;   1D78 9D78 C 8D 06 20        F:008272
  STA R_0013                                      ;   1D7B 9D7B C 85 13           F:008272
  LDA D_1_2050,Y                                  ;   1D7D 9D7D C B9 50 A0        F:008272
  STA PpuAddr_2006                                ;   1D80 9D80 C 8D 06 20        F:008272
  STA R_0012                                      ;   1D83 9D83 C 85 12           F:008272
  LDY #$0                                         ;   1D85 9D85 C A0 00           F:008272
B_0_1D87:
  LDA D_1_2068,Y                                  ;   1D87 9D87 C B9 68 A0        F:008272
  STA PpuData_2007                                ;   1D8A 9D8A C 8D 07 20        F:008272
  INY                                             ;   1D8D 9D8D C C8              F:008272
  INY                                             ;   1D8E 9D8E C C8              F:008272
  CPY #$1A                                        ;   1D8F 9D8F C C0 1A           F:008272
  BNE B_0_1D87                                    ;   1D91 9D91 C D0 F4           F:008272
  CLC                                             ;   1D93 9D93 C 18              F:008272
  LDA R_0012                                      ;   1D94 9D94 C A5 12           F:008272
  ADC #$20                                        ;   1D96 9D96 C 69 20           F:008272
  PHA                                             ;   1D98 9D98 C 48              F:008272
  LDA R_0013                                      ;   1D99 9D99 C A5 13           F:008272
  ADC #$0                                         ;   1D9B 9D9B C 69 00           F:008272
  STA PpuAddr_2006                                ;   1D9D 9D9D C 8D 06 20        F:008272
  PLA                                             ;   1DA0 9DA0 C 68              F:008272
  STA PpuAddr_2006                                ;   1DA1 9DA1 C 8D 06 20        F:008272
  LDY #$1                                         ;   1DA4 9DA4 C A0 01           F:008272
B_0_1DA6:
  LDA D_1_2068,Y                                  ;   1DA6 9DA6 C B9 68 A0        F:008272
  STA PpuData_2007                                ;   1DA9 9DA9 C 8D 07 20        F:008272
  INY                                             ;   1DAC 9DAC C C8              F:008272
  INY                                             ;   1DAD 9DAD C C8              F:008272
  CPY #$1B                                        ;   1DAE 9DAE C C0 1B           F:008272
  BNE B_0_1DA6                                    ;   1DB0 9DB0 C D0 F4           F:008272
  RTS                                             ;   1DB2 9DB2 C 60              F:008272

L_0_1DB3:
  LDY IsInFastMoney                                      ;   1DB3 9DB3 C AC 43 05        F:008272
  CLC                                             ;   1DB6 9DB6 C 18              F:008272
  ADC D_0_1D69,Y                                  ;   1DB7 9DB7 C 79 69 9D        F:008272
  ASL                                             ;   1DBA 9DBA C 0A              F:008272
  TAY                                             ;   1DBB 9DBB C A8              F:008272
  LDA D_1_2051,Y                                  ;   1DBC 9DBC C B9 51 A0        F:008272
  STA PpuAddr_2006                                ;   1DBF 9DBF C 8D 06 20        F:008272
  STA R_0013                                      ;   1DC2 9DC2 C 85 13           F:008272
  LDA D_1_2050,Y                                  ;   1DC4 9DC4 C B9 50 A0        F:008272
  STA PpuAddr_2006                                ;   1DC7 9DC7 C 8D 06 20        F:008272
  STA R_0012                                      ;   1DCA 9DCA C 85 12           F:008272
  LDY #$0                                         ;   1DCC 9DCC C A0 00           F:008272
B_0_1DCE:
  LDA D_1_2082,Y                                  ;   1DCE 9DCE C B9 82 A0        F:008272
  STA PpuData_2007                                ;   1DD1 9DD1 C 8D 07 20        F:008272
  INY                                             ;   1DD4 9DD4 C C8              F:008272
  INY                                             ;   1DD5 9DD5 C C8              F:008272
  CPY #$C                                         ;   1DD6 9DD6 C C0 0C           F:008272
  BNE B_0_1DDD                                    ;   1DD8 9DD8 C D0 03           F:008272
  JSR L_0_1E08                                    ;   1DDA 9DDA C 20 08 9E        F:008272
B_0_1DDD:
  CPY #$1A                                        ;   1DDD 9DDD C C0 1A           F:008272
  BNE B_0_1DCE                                    ;   1DDF 9DDF C D0 ED           F:008272
  CLC                                             ;   1DE1 9DE1 C 18              F:008272
  LDA R_0012                                      ;   1DE2 9DE2 C A5 12           F:008272
  ADC #$20                                        ;   1DE4 9DE4 C 69 20           F:008272
  PHA                                             ;   1DE6 9DE6 C 48              F:008272
  LDA R_0013                                      ;   1DE7 9DE7 C A5 13           F:008272
  ADC #$0                                         ;   1DE9 9DE9 C 69 00           F:008272
  STA PpuAddr_2006                                ;   1DEB 9DEB C 8D 06 20        F:008272
  PLA                                             ;   1DEE 9DEE C 68              F:008272
  STA PpuAddr_2006                                ;   1DEF 9DEF C 8D 06 20        F:008272
  LDY #$1                                         ;   1DF2 9DF2 C A0 01           F:008272
B_0_1DF4:
  LDA D_1_2082,Y                                  ;   1DF4 9DF4 C B9 82 A0        F:008272
  STA PpuData_2007                                ;   1DF7 9DF7 C 8D 07 20        F:008272
  INY                                             ;   1DFA 9DFA C C8              F:008272
  INY                                             ;   1DFB 9DFB C C8              F:008272
  CPY #$D                                         ;   1DFC 9DFC C C0 0D           F:008272
  BNE B_0_1E03                                    ;   1DFE 9DFE C D0 03           F:008272
  JSR L_0_1E08                                    ;   1E00 9E00 C 20 08 9E        F:008272
B_0_1E03:
  CPY #$1B                                        ;   1E03 9E03 C C0 1B           F:008272
  BNE B_0_1DF4                                    ;   1E05 9E05 C D0 ED           F:008272
  RTS                                             ;   1E07 9E07 C 60              F:008272

L_0_1E08:
  STY JoypadBoth                                      ;   1E08 9E08 C 84 15           F:008272
  TXA                                             ;   1E0A 9E0A C 8A              F:008272
  ADC #$0                                         ;   1E0B 9E0B C 69 00           F:008272
  CMP #$A                                         ;   1E0D 9E0D C C9 0A           F:008272
  BCS B_0_1E20                                    ;   1E0F 9E0F C B0 0F           F:008272
  TXA                                             ;   1E11 9E11 C 8A              F:008272
L_0_1E12:
  SEC                                             ;   1E12 9E12 C 38              F:008272
  ADC #$30                                        ;   1E13 9E13 C 69 30           F:008272
  SEC                                             ;   1E15 9E15 C 38              F:008272
  SBC #$20                                        ;   1E16 9E16 C E9 20           F:008272
  JSR L_0_1E30                                    ;   1E18 9E18 C 20 30 9E        F:008272
  LDY JoypadBoth                                      ;   1E1B 9E1B C A4 15           F:008272
  INY                                             ;   1E1D 9E1D C C8              F:008272
  INY                                             ;   1E1E 9E1E C C8              F:008272
  RTS                                             ;   1E1F 9E1F C 60              F:008272

B_0_1E20:
  LDA #$11                                        ;   1E20 9E20 C A9 11           F:012833
  JSR L_0_1E30                                    ;   1E22 9E22 C 20 30 9E        F:012833
  INC JoypadBoth                                      ;   1E25 9E25 C E6 15           F:012833
  INC JoypadBoth                                      ;   1E27 9E27 C E6 15           F:012833
  SEC                                             ;   1E29 9E29 C 38              F:012833
  TXA                                             ;   1E2A 9E2A C 8A              F:012833
  SBC #$A                                         ;   1E2B 9E2B C E9 0A           F:012833
  JMP L_0_1E12                                    ;   1E2D 9E2D C 4C 12 9E        F:012833

L_0_1E30:
  TAY                                             ;   1E30 9E30 C A8              F:008272
  LDA D_1_2121,Y                                  ;   1E31 9E31 C B9 21 A1        F:008272
  ASL                                             ;   1E34 9E34 C 0A              F:008272
  TAY                                             ;   1E35 9E35 C A8              F:008272
  LDA D_1_2160,Y                                  ;   1E36 9E36 C B9 60 A1        F:008272
  STA BGDrawPPUAddress                            ;   1E39 9E39 C 85 16           F:008272
  LDA D_1_2161,Y                                  ;   1E3B 9E3B C B9 61 A1        F:008272
  STA BGDrawPPUAddress+1                          ;   1E3E 9E3E C 85 17           F:008272
  LDA JoypadBoth                                      ;   1E40 9E40 C A5 15           F:008272
  AND #$1                                         ;   1E42 9E42 C 29 01           F:008272
  TAY                                             ;   1E44 9E44 C A8              F:008272
  LDA (BGDrawPPUAddress),Y                        ;   1E45 9E45 C B1 16           F:008272
  STA PpuData_2007                                ;   1E47 9E47 C 8D 07 20        F:008272
  RTS                                             ;   1E4A 9E4A C 60              F:008272

D_0_1E4B:
.byte $00                                         ;   1E4B 9E4B D        ?        F:009645
.byte $20                                         ;   1E4C 9E4C D                 F:009646
L_0_1E4D:
  LDX R_0011                                      ;   1E4D 9E4D C A6 11           F:009645
  LDA R_04B9                                      ;   1E4F 9E4F C AD B9 04        F:009645
  LDY IsInFastMoney                                      ;   1E52 9E52 C AC 43 05        F:009645
  CLC                                             ;   1E55 9E55 C 18              F:009645
  ADC D_0_1D69,Y                                  ;   1E56 9E56 C 79 69 9D        F:009645
  ASL                                             ;   1E59 9E59 C 0A              F:009645
  TAY                                             ;   1E5A 9E5A C A8              F:009645
  CLC                                             ;   1E5B 9E5B C 18              F:009645
  LDA D_1_2050,Y                                  ;   1E5C 9E5C C B9 50 A0        F:009645
  ADC D_0_1E4B,X                                  ;   1E5F 9E5F C 7D 4B 9E        F:009645
  PHA                                             ;   1E62 9E62 C 48              F:009645
  LDA D_1_2051,Y                                  ;   1E63 9E63 C B9 51 A0        F:009645
  ADC #$0                                         ;   1E66 9E66 C 69 00           F:009645
  STA PpuAddr_2006                                ;   1E68 9E68 C 8D 06 20        F:009645
  PLA                                             ;   1E6B 9E6B C 68              F:009645
  STA PpuAddr_2006                                ;   1E6C 9E6C C 8D 06 20        F:009645
  LDX #$0                                         ;   1E6F 9E6F C A2 00           F:009645
  STX JoypadBoth                                      ;   1E71 9E71 C 86 15           F:009645
B_0_1E73:
  LDA ValidationScoreboardText,X                                    ;   1E73 9E73 C BD DC 07        F:009645
  BEQ B_0_1E97                                    ;   1E76 9E76 C F0 1F           F:009645
  INC JoypadBoth                                      ;   1E78 9E78 C E6 15           F:009645
  SEC                                             ;   1E7A 9E7A C 38              F:009645
  SBC #$20                                        ;   1E7B 9E7B C E9 20           F:009645
  TAY                                             ;   1E7D 9E7D C A8              F:009645
  LDA D_1_2121,Y                                  ;   1E7E 9E7E C B9 21 A1        F:009645
  ASL                                             ;   1E81 9E81 C 0A              F:009645
  TAY                                             ;   1E82 9E82 C A8              F:009645
  LDA D_1_2160,Y                                  ;   1E83 9E83 C B9 60 A1        F:009645
  STA R_0012                                      ;   1E86 9E86 C 85 12           F:009645
  LDA D_1_2161,Y                                  ;   1E88 9E88 C B9 61 A1        F:009645
  STA R_0013                                      ;   1E8B 9E8B C 85 13           F:009645
  LDY R_0011                                      ;   1E8D 9E8D C A4 11           F:009645
  LDA (R_0012),Y                                  ;   1E8F 9E8F C B1 12           F:009645
  STA PpuData_2007                                ;   1E91 9E91 C 8D 07 20        F:009645
  INX                                             ;   1E94 9E94 C E8              F:009645
  BNE B_0_1E73                                    ;   1E95 9E95 C D0 DC           F:009645
B_0_1E97:
  LDX R_0011                                      ;   1E97 9E97 C A6 11           F:009645
  LDA D_1_20B4,X                                  ;   1E99 9E99 C BD B4 A0        F:009645
  LDY JoypadBoth                                      ;   1E9C 9E9C C A4 15           F:009645
L_0_1E9E:
  CPY #$B                                         ;   1E9E 9E9E C C0 0B           F:009645
  BCS B_0_1EA9                                    ;   1EA0 9EA0 C B0 07           F:009645
  STA PpuData_2007                                ;   1EA2 9EA2 C 8D 07 20        F:009645
  INY                                             ;   1EA5 9EA5 C C8              F:009645
  JMP L_0_1E9E                                    ;   1EA6 9EA6 C 4C 9E 9E        F:009645

B_0_1EA9:
  TXA                                             ;   1EA9 9EA9 C 8A              F:009645
  ASL                                             ;   1EAA 9EAA C 0A              F:009645
  TAX                                             ;   1EAB 9EAB C AA              F:009645
  CPY #$C                                         ;   1EAC 9EAC C C0 0C           F:009645
  BEQ B_0_1EB5                                    ;   1EAE 9EAE C F0 05           F:009645
  LDA R_00C0,X                                    ;   1EB0 9EB0 C B5 C0           F:009645
  STA PpuData_2007                                ;   1EB2 9EB2 C 8D 07 20        F:009645
B_0_1EB5:
  LDA R_00C1,X                                    ;   1EB5 9EB5 C B5 C1           F:009645
  STA PpuData_2007                                ;   1EB7 9EB7 C 8D 07 20        F:009645
  RTS                                             ;   1EBA 9EBA C 60              F:009645

L_0_1EBB:
  LDA R_04B9                                      ;   1EBB 9EBB C AD B9 04        F:009644
  CLC                                             ;   1EBE 9EBE C 18              F:009644
  ADC #$3                                         ;   1EBF 9EBF C 69 03           F:009644
  JSR BCDConverter                                    ;   1EC1 9EC1 C 20 5E AA        F:009644
  LDA R_0391                                      ;   1EC4 9EC4 C AD 91 03        F:009644
  CMP #$FE                                        ;   1EC7 9EC7 C C9 FE           F:009644
  BNE B_0_1EDD                                    ;   1EC9 9EC9 C D0 12           F:009644
  LDY R_04B9                                      ;   1ECB 9ECB . AC B9 04        
  LDA R_0549,Y                                    ;   1ECE 9ECE . B9 49 05        
  BPL B_0_1EDD                                    ;   1ED1 9ED1 . 10 0A           
  LDA #$20                                        ;   1ED3 9ED3 . A9 20           
  STA BCDOutput+3                                      ;   1ED5 9ED5 . 8D C1 04        
  LDA #$30                                        ;   1ED8 9ED8 . A9 30           
  STA BCDOutput+4                                      ;   1EDA 9EDA . 8D C2 04        
B_0_1EDD:
  LDX #$0                                         ;   1EDD 9EDD C A2 00           F:009644
  STX R_0011                                      ;   1EDF 9EDF C 86 11           F:009644
B_0_1EE1:
  LDA BCDOutput+3                                      ;   1EE1 9EE1 C AD C1 04        F:009644
  JSR L_0_1EF6                                    ;   1EE4 9EE4 C 20 F6 9E        F:009644
  LDA BCDOutput+4                                      ;   1EE7 9EE7 C AD C2 04        F:009644
  JSR L_0_1EF6                                    ;   1EEA 9EEA C 20 F6 9E        F:009644
  INC R_0011                                      ;   1EED 9EED C E6 11           F:009644
  LDA R_0011                                      ;   1EEF 9EEF C A5 11           F:009644
  CMP #$4                                         ;   1EF1 9EF1 C C9 04           F:009644
  BNE B_0_1EE1                                    ;   1EF3 9EF3 C D0 EC           F:009644
  RTS                                             ;   1EF5 9EF5 C 60              F:009644

L_0_1EF6:
  SEC                                             ;   1EF6 9EF6 C 38              F:009644
  SBC #$20                                        ;   1EF7 9EF7 C E9 20           F:009644
  TAY                                             ;   1EF9 9EF9 C A8              F:009644
  LDA D_1_2121,Y                                  ;   1EFA 9EFA C B9 21 A1        F:009644
  ASL                                             ;   1EFD 9EFD C 0A              F:009644
  TAY                                             ;   1EFE 9EFE C A8              F:009644
  LDA D_1_2160,Y                                  ;   1EFF 9EFF C B9 60 A1        F:009644
  STA BGDrawPPUAddress                            ;   1F02 9F02 C 85 16           F:009644
  LDA D_1_2161,Y                                  ;   1F04 9F04 C B9 61 A1        F:009644
  STA BGDrawPPUAddress+1                          ;   1F07 9F07 C 85 17           F:009644
  LDA R_0011                                      ;   1F09 9F09 C A5 11           F:009644
  AND #$1                                         ;   1F0B 9F0B C 29 01           F:009644
  TAY                                             ;   1F0D 9F0D C A8              F:009644
  LDA (BGDrawPPUAddress),Y                        ;   1F0E 9F0E C B1 16           F:009644
  STA R_00C0,X                                    ;   1F10 9F10 C 95 C0           F:009644
  INX                                             ;   1F12 9F12 C E8              F:009644
  RTS                                             ;   1F13 9F13 C 60              F:009644

L_0_1F14:
  LDA IsStealingQuestion                          ;   1F14 9F14 C A5 25           F:009646
  BNE B_0_1F40                                    ;   1F16 9F16 C D0 28           F:009646
  LDA R_0391                                      ;   1F18 9F18 C AD 91 03        F:009646
  CMP #$1                                         ;   1F1B 9F1B C C9 01           F:009646
  BEQ B_0_1F59                                    ;   1F1D 9F1D C F0 3A           F:009646
  LDA R_04B9                                      ;   1F1F 9F1F C AD B9 04        F:009646
  ASL                                             ;   1F22 9F22 C 0A              F:009646
  TAY                                             ;   1F23 9F23 C A8              F:009646
  LDX #$1                                         ;   1F24 9F24 C A2 01           F:009646
  LDA CurrentRoundNumber                          ;   1F26 9F26 C AD 10 03        F:009646
  CMP #$3                                         ;   1F29 9F29 C C9 03           F:009646
  BCC B_0_1F2E                                    ;   1F2B 9F2B C 90 01           F:009646
  INX                                             ;   1F2D 9F2D C E8              F:018044
B_0_1F2E:
  CLC                                             ;   1F2E 9F2E C 18              F:009646
  LDA R_0394,Y                                    ;   1F2F 9F2F C B9 94 03        F:009646
  ADC QuestionCurrentCash                         ;   1F32 9F32 C 6D C7 04        F:009646
  STA QuestionCurrentCash                         ;   1F35 9F35 C 8D C7 04        F:009646
  BCC B_0_1F3D                                    ;   1F38 9F38 C 90 03           F:009646
  INC QuestionCurrentCash+1                       ;   1F3A 9F3A . EE C8 04        
B_0_1F3D:
  DEX                                             ;   1F3D 9F3D C CA              F:009646
  BNE B_0_1F2E                                    ;   1F3E 9F3E C D0 EE           F:009646
B_0_1F40:
  LDA #$2                                         ;   1F40 9F40 C A9 02           F:009646
  JSR BCDConverter                                    ;   1F42 9F42 C 20 5E AA        F:009646
  LDA R_04BF                                      ;   1F45 9F45 C AD BF 04        F:009646
  STA R_00B6                                      ;   1F48 9F48 C 85 B6           F:009646
  LDA BCDOutput+2                                      ;   1F4A 9F4A C AD C0 04        F:009646
  STA R_00B7                                      ;   1F4D 9F4D C 85 B7           F:009646
  LDA BCDOutput+3                                      ;   1F4F 9F4F C AD C1 04        F:009646
  STA R_00B8                                      ;   1F52 9F52 C 85 B8           F:009646
  LDA BCDOutput+4                                      ;   1F54 9F54 C AD C2 04        F:009646
  STA R_00B9                                      ;   1F57 9F57 C 85 B9           F:009646
B_0_1F59:
  RTS                                             ;   1F59 9F59 C 60              F:009646

L_0_1F5A:
  JSR PPUCTRLSetWriteVertical                                    ;   1F5A 9F5A C 20 ED 99        F:009647
  LDX #$0                                         ;   1F5D 9F5D C A2 00           F:009647
  LDA R_00B6                                      ;   1F5F 9F5F C A5 B6           F:009647
  JSR L_0_1F7C                                    ;   1F61 9F61 C 20 7C 9F        F:009647
  LDX #$2                                         ;   1F64 9F64 C A2 02           F:009647
  LDA R_00B7                                      ;   1F66 9F66 C A5 B7           F:009647
  JSR L_0_1F7C                                    ;   1F68 9F68 C 20 7C 9F        F:009647
  LDX #$4                                         ;   1F6B 9F6B C A2 04           F:009647
  LDA R_00B8                                      ;   1F6D 9F6D C A5 B8           F:009647
  JSR L_0_1F7C                                    ;   1F6F 9F6F C 20 7C 9F        F:009647
  LDX #$6                                         ;   1F72 9F72 C A2 06           F:009647
  LDA R_00B9                                      ;   1F74 9F74 C A5 B9           F:009647
  JSR L_0_1F7C                                    ;   1F76 9F76 C 20 7C 9F        F:009647
  JMP PPUCTRLSetWriteHorizontal                                    ;   1F79 9F79 C 4C E3 99        F:009647

L_0_1F7C:
  CMP #$20                                        ;   1F7C 9F7C C C9 20           F:009647
  BNE B_0_1F82                                    ;   1F7E 9F7E C D0 02           F:009647
  LDA #$3A                                        ;   1F80 9F80 C A9 3A           F:009647
B_0_1F82:
  SEC                                             ;   1F82 9F82 C 38              F:009647
  SBC #$30                                        ;   1F83 9F83 C E9 30           F:009647
  TAY                                             ;   1F85 9F85 C A8              F:009647
  LDA D_1_20D4,Y                                  ;   1F86 9F86 C B9 D4 A0        F:009647
  TAY                                             ;   1F89 9F89 C A8              F:009647
  LDA #$1                                         ;   1F8A 9F8A C A9 01           F:009647
  STA R_000E                                      ;   1F8C 9F8C C 85 0E           F:009647
  STX R_000F                                      ;   1F8E 9F8E C 86 0F           F:009647
  LDA D_1_20CD,X                                  ;   1F90 9F90 C BD CD A0        F:009647
  STA PpuAddr_2006                                ;   1F93 9F93 C 8D 06 20        F:009647
  LDA D_1_20CC,X                                  ;   1F96 9F96 C BD CC A0        F:009647
  STA PpuAddr_2006                                ;   1F99 9F99 C 8D 06 20        F:009647
  LDX #$3                                         ;   1F9C 9F9C C A2 03           F:009647
B_0_1F9E:
  LDA D_1_20DF,Y                                  ;   1F9E 9F9E C B9 DF A0        F:009647
  STA PpuData_2007                                ;   1FA1 9FA1 C 8D 07 20        F:009647
  INY                                             ;   1FA4 9FA4 C C8              F:009647
  DEX                                             ;   1FA5 9FA5 C CA              F:009647
  BNE B_0_1F9E                                    ;   1FA6 9FA6 C D0 F6           F:009647
  DEC R_000E                                      ;   1FA8 9FA8 C C6 0E           F:009647
  BMI B_0_1FC6                                    ;   1FAA 9FAA C 30 1A           F:009647
  LDX R_000F                                      ;   1FAC 9FAC C A6 0F           F:009647
  CLC                                             ;   1FAE 9FAE C 18              F:009647
  LDA D_1_20CC,X                                  ;   1FAF 9FAF C BD CC A0        F:009647
  ADC #$1                                         ;   1FB2 9FB2 C 69 01           F:009647
  PHA                                             ;   1FB4 9FB4 C 48              F:009647
  LDA D_1_20CD,X                                  ;   1FB5 9FB5 C BD CD A0        F:009647
  ADC #$0                                         ;   1FB8 9FB8 C 69 00           F:009647
  STA PpuAddr_2006                                ;   1FBA 9FBA C 8D 06 20        F:009647
  PLA                                             ;   1FBD 9FBD C 68              F:009647
  STA PpuAddr_2006                                ;   1FBE 9FBE C 8D 06 20        F:009647
  LDX #$3                                         ;   1FC1 9FC1 C A2 03           F:009647
  JMP B_0_1F9E                                    ;   1FC3 9FC3 C 4C 9E 9F        F:009647

B_0_1FC6:
  RTS                                             ;   1FC6 9FC6 C 60              F:009647

L_0_1FC7:
  LDA R_0029                                      ;   1FC7 9FC7 C A5 29           F:009094
  ASL                                             ;   1FC9 9FC9 C 0A              F:009094
  TAY                                             ;   1FCA 9FCA C A8              F:009094
  LDA D_1_20B7,Y                                  ;   1FCB 9FCB C B9 B7 A0        F:009094
  STA PpuAddr_2006                                ;   1FCE 9FCE C 8D 06 20        F:009094
  STA R_0013                                      ;   1FD1 9FD1 C 85 13           F:009094
  LDA D_1_20B6,Y                                  ;   1FD3 9FD3 C B9 B6 A0        F:009094
  STA PpuAddr_2006                                ;   1FD6 9FD6 C 8D 06 20        F:009094
  STA R_0012                                      ;   1FD9 9FD9 C 85 12           F:009094
  LDA SpriteUpdateFlags                           ;   1FDB 9FDB C A5 2D           F:009094
  CMP #$80                                        ;   1FDD 9FDD C C9 80           F:009094
  BNE B_0_1FE4                                    ;   1FDF 9FDF C D0 03           F:009094
  LDA PpuData_2007                                ;   1FE1 9FE1 C AD 07 20        F:009094
B_0_1FE4:
  LDY #$0                                         ;   1FE4 9FE4 C A0 00           F:009094
  LDA #$4                                         ;   1FE6 9FE6 C A9 04           F:009094
  STA BGDrawPPUAddress                            ;   1FE8 9FE8 C 85 16           F:009094
B_0_1FEA:
  LDX #$4                                         ;   1FEA 9FEA C A2 04           F:009094
B_0_1FEC:
  BIT SpriteUpdateFlags                           ;   1FEC 9FEC C 24 2D           F:009094
  BMI B_0_1FF9                                    ;   1FEE 9FEE C 30 09           F:009094
  LDA D_1_20BC,Y                                  ;   1FF0 9FF0 C B9 BC A0        F:009095
  STA PpuData_2007                                ;   1FF3 9FF3 C 8D 07 20        F:009095
  JMP L_1_2026                                    ;   1FF6 9FF6 C 4C 26 A0        F:009095

B_0_1FF9:
  BVS B_1_2012                                    ;   1FF9 9FF9 C 70 17           F:009094
  STX BGDrawPPUAddress+1                          ;   1FFB 9FFB C 86 17           F:009094
  STY R_000E                                      ;   1FFD 9FFD C 84 0E           F:009094
L_0_1FFF:
.byte $A5                                         ;   1FFF 9FFF .        ?        
  AND #$A                                         ;   2000 A000 C 29 0A           F:000000
  ASL                                             ;   2002 A002 C 0A              F:009094
  ASL                                             ;   2003 A003 C 0A              F:009094
  ASL                                             ;   2004 A004 C 0A              F:009094
  ADC R_000E                                      ;   2005 A005 C 65 0E           F:009094
  TAX                                             ;   2007 A007 C AA              F:009094
  LDA PpuData_2007                                ;   2008 A008 C AD 07 20        F:009094
  STA R_0048,X                                    ;   200B A00B C 95 48           F:009094
  LDX BGDrawPPUAddress+1                          ;   200D A00D C A6 17           F:009094
  JMP L_1_2026                                    ;   200F A00F C 4C 26 A0        F:009094

B_1_2012:
  STX BGDrawPPUAddress+1                          ;   2012 A012 C 86 17           F:009216
  STY R_000E                                      ;   2014 A014 C 84 0E           F:009216
  LDA R_0029                                      ;   2016 A016 C A5 29           F:009216
  ASL                                             ;   2018 A018 C 0A              F:009216
  ASL                                             ;   2019 A019 C 0A              F:009216
  ASL                                             ;   201A A01A C 0A              F:009216
  ASL                                             ;   201B A01B C 0A              F:009216
  ADC R_000E                                      ;   201C A01C C 65 0E           F:009216
  TAX                                             ;   201E A01E C AA              F:009216
  LDA R_0048,X                                    ;   201F A01F C B5 48           F:009216
  STA PpuData_2007                                ;   2021 A021 C 8D 07 20        F:009216
  LDX BGDrawPPUAddress+1                          ;   2024 A024 C A6 17           F:009216
L_1_2026:
  INY                                             ;   2026 A026 C C8              F:009094
  DEX                                             ;   2027 A027 C CA              F:009094
  BNE B_0_1FEC                                    ;   2028 A028 C D0 C2           F:009094
  DEC BGDrawPPUAddress                            ;   202A A02A C C6 16           F:009094
  BEQ B_1_204F                                    ;   202C A02C C F0 21           F:009094
  CLC                                             ;   202E A02E C 18              F:009094
  LDA R_0012                                      ;   202F A02F C A5 12           F:009094
  ADC #$20                                        ;   2031 A031 C 69 20           F:009094
  STA R_0012                                      ;   2033 A033 C 85 12           F:009094
  PHA                                             ;   2035 A035 C 48              F:009094
  LDA R_0013                                      ;   2036 A036 C A5 13           F:009094
  ADC #$0                                         ;   2038 A038 C 69 00           F:009094
  STA R_0013                                      ;   203A A03A C 85 13           F:009094
  STA PpuAddr_2006                                ;   203C A03C C 8D 06 20        F:009094
  PLA                                             ;   203F A03F C 68              F:009094
  STA PpuAddr_2006                                ;   2040 A040 C 8D 06 20        F:009094
  LDA SpriteUpdateFlags                           ;   2043 A043 C A5 2D           F:009094
  CMP #$80                                        ;   2045 A045 C C9 80           F:009094
  BNE B_0_1FEA                                    ;   2047 A047 C D0 A1           F:009094
  LDA PpuData_2007                                ;   2049 A049 C AD 07 20        F:009094
  JMP B_0_1FEA                                    ;   204C A04C C 4C EA 9F        F:009094

B_1_204F:
  RTS                                             ;   204F A04F C 60              F:009094

D_1_2050:
.byte $82                                         ;   2050 A050 D        ?        F:008272
D_1_2051:
.byte $25,$C2,$25,$02,$26,$42,$26,$82             ;   2051 A051 DDDDDDDD %?%?&B&? F:008272
.byte $26,$C2,$26,$91,$25,$D1,$25,$11             ;   2059 A059 DDDDDDDD &?&?%?%? F:008272
.byte $26,$51,$26,$91,$26,$D1,$26                 ;   2061 A061 DDDDDDD  &Q&?&?&  F:008272
D_1_2068:
.byte $4E,$5E,$88,$89,$4E,$5E,$88,$89             ;   2068 A068 DDDDDDDD N^??N^?? F:008272
.byte $4E,$5E,$88,$89,$4E,$5E,$88,$89             ;   2070 A070 DDDDDDDD N^??N^?? F:008272
.byte $4E,$5E,$88,$89,$4E,$5E,$88,$89             ;   2078 A078 DDDDDDDD N^??N^?? F:008272
.byte $4E,$5E                                     ;   2080 A080 DD       N^       F:008272
D_1_2082:
.byte $8A,$8D,$8B,$8E,$8B,$8E,$8B,$8E             ;   2082 A082 DDDDDDDD ???????? F:008272
.byte $8B,$8E,$8B,$8E                             ;   208A A08A DDDD     ????     F:008272
.byte $8B,$8E                                     ;   208E A08E ..       ??       
.byte $8B,$8E,$8B,$8E,$8B,$8E,$8B,$8E             ;   2090 A090 DDDDDDDD ???????? F:008272
.byte $8B,$8E,$8C,$8F                             ;   2098 A098 DDDD     ????     F:008272
.byte $4E,$5E,$4E,$5E,$4E,$5E,$4E,$5E             ;   209C A09C ........ N^N^N^N^ 
.byte $4E,$5E,$4E,$5E,$4E,$5E,$4E,$5E             ;   20A4 A0A4 ........ N^N^N^N^ 
.byte $4E,$5E,$4E,$5E,$4E,$5E,$4E,$5E             ;   20AC A0AC ........ N^N^N^N^ 
D_1_20B4:
.byte $4E,$5E                                     ;   20B4 A0B4 DD       N^       F:009644
D_1_20B6:
.byte $07                                         ;   20B6 A0B6 D        ?        F:009094
D_1_20B7:
.byte $26                                         ;   20B7 A0B7 D        &        F:009094
.byte $0E,$26                                     ;   20B8 A0B8 DD       ?&       F:020763
.byte $15,$26                                     ;   20BA A0BA DD       ?&       F:033375
D_1_20BC:
.byte $01,$02,$03,$04,$08,$09,$0A,$0B             ;   20BC A0BC DDDDDDDD ???????? F:009095
.byte $08,$0A,$09,$0B,$12,$13,$13,$14             ;   20C4 A0C4 DDDDDDDD ???????? F:009095
D_1_20CC:
.byte $6D                                         ;   20CC A0CC D        m        F:009647
D_1_20CD:
.byte $24,$6F,$24,$71,$24,$73,$24                 ;   20CD A0CD DDDDDDD  $o$q$s$  F:009647
D_1_20D4:
.byte $00                                         ;   20D4 A0D4 D        ?        F:014462
.byte $06                                         ;   20D5 A0D5 D        ?        F:020398
.byte $0C                                         ;   20D6 A0D6 D        ?        F:010340
.byte $12                                         ;   20D7 A0D7 D        ?        F:014462
.byte $18                                         ;   20D8 A0D8 D        ?        F:018811
.byte $1E                                         ;   20D9 A0D9 D        ?        F:010340
.byte $24                                         ;   20DA A0DA D        $        F:009647
.byte $2A                                         ;   20DB A0DB D        *        F:014756
.byte $30                                         ;   20DC A0DC D        0        F:010707
.byte $36                                         ;   20DD A0DD D        6        F:011074
.byte $3C                                         ;   20DE A0DE D        <        F:009647
D_1_20DF:
.byte $AB,$BA,$C8,$AC,$BA,$C9                     ;   20DF A0DF DDDDDD   ??????   F:014462
.byte $AD,$BB,$CA,$AE,$AE,$CB                     ;   20E5 A0E5 DDDDDD   ??????   F:020398
.byte $AF,$BC,$CC,$B0,$BD,$CD                     ;   20EB A0EB DDDDDD   ??????   F:010340
.byte $B1,$BE,$CE,$AC,$BF,$CF                     ;   20F1 A0F1 DDDDDD   ??????   F:014462
.byte $B2,$C0,$00,$B3,$C1,$D0                     ;   20F7 A0F7 DDDDDD   ??????   F:018811
.byte $B4,$C2,$D1,$B5,$C3,$D2                     ;   20FD A0FD DDDDDD   ??????   F:010340
.byte $B6,$C4,$D3,$B7,$C5,$D4                     ;   2103 A103 DDDDDD   ??????   F:009647
.byte $B8,$C6,$D5,$B9,$C7,$AE                     ;   2109 A109 DDDDDD   ??????   F:014756
.byte $AB,$C4,$C8,$AC,$BF,$CF                     ;   210F A10F DDDDDD   ??????   F:010707
.byte $AB,$C0,$D1,$AC,$BF,$C9                     ;   2115 A115 DDDDDD   ??????   F:011074
.byte $00,$00,$00,$00,$00,$00                     ;   211B A11B DDDDDD   ??????   F:009647
D_1_2121:
.byte $00                                         ;   2121 A121 D        ?        F:009644
.byte $00,$1B,$00,$00,$00,$1F                     ;   2122 A122 ......   ??????   
.byte $1C                                         ;   2128 A128 D        ?        F:021989
.byte $1D,$1E,$00,$00,$21,$22,$00,$00             ;   2129 A129 ........ ????!"?? 
.byte $24                                         ;   2131 A131 D        $        F:012833
.byte $25,$26,$27,$28,$29,$2A                     ;   2132 A132 DDDDDD   %&'()*   F:008272
.byte $2B                                         ;   2138 A138 D        +        F:011438
.byte $2C,$2D                                     ;   2139 A139 DD       ,-       F:012833
.byte $20,$00,$00,$00,$00,$00,$00                 ;   213B A13B .......   ??????  
.byte $01                                         ;   2142 A142 D        ?        F:010338
.byte $02                                         ;   2143 A143 D        ?        F:010705
.byte $03                                         ;   2144 A144 D        ?        F:010338
.byte $04                                         ;   2145 A145 D        ?        F:011072
.byte $05                                         ;   2146 A146 D        ?        F:010338
.byte $06                                         ;   2147 A147 D        ?        F:025679
.byte $07                                         ;   2148 A148 D        ?        F:020029
.byte $08                                         ;   2149 A149 D        ?        F:011439
.byte $09                                         ;   214A A14A D        ?        F:010338
.byte $0A                                         ;   214B A14B D        ?        F:040654
.byte $0B                                         ;   214C A14C D        ?        F:026481
.byte $0C                                         ;   214D A14D D        ?        F:011072
.byte $0D                                         ;   214E A14E D        ?        F:010338
.byte $0E,$0F                                     ;   214F A14F DD       ??       F:009645
.byte $10                                         ;   2151 A151 D        ?        F:018043
.byte $11                                         ;   2152 A152 .        ?        
.byte $12                                         ;   2153 A153 D        ?        F:010338
.byte $13                                         ;   2154 A154 D        ?        F:009645
.byte $14,$15                                     ;   2155 A155 DD       ??       F:010705
.byte $16                                         ;   2157 A157 D        ?        F:030538
.byte $17                                         ;   2158 A158 D        ?        F:009645
.byte $18                                         ;   2159 A159 .        ?        
.byte $19                                         ;   215A A15A D        ?        F:020396
.byte $1A,$00,$00,$00,$23                         ;   215B A15B .....    ????#    
D_1_2160:
.addr D_1_20B4                                    ;   2160 A160 N B4 A0
D_1_2161 = * - 1
.addr D_1_21BC                                    ;   2162 A162 N BC A1
.addr D_1_21BE                                    ;   2164 A164 N BE A1
.addr D_1_21C0                                    ;   2166 A166 N C0 A1
.addr D_1_21C2                                    ;   2168 A168 N C2 A1
.addr D_1_21C4                                    ;   216A A16A N C4 A1
.addr D_1_21C6                                    ;   216C A16C N C6 A1
.addr D_1_21C8                                    ;   216E A16E N C8 A1
.addr D_1_21CA                                    ;   2170 A170 N CA A1
.addr D_1_21CC                                    ;   2172 A172 N CC A1
.addr D_1_21CE                                    ;   2174 A174 N CE A1
.addr D_1_21D0                                    ;   2176 A176 N D0 A1
.addr D_1_21D2                                    ;   2178 A178 N D2 A1
.addr D_1_21D4                                    ;   217A A17A N D4 A1
.addr D_1_21D6                                    ;   217C A17C N D6 A1
.addr D_1_21D8                                    ;   217E A17E N D8 A1
.addr D_1_21DA                                    ;   2180 A180 N DA A1
.byte $DC,$A1                                     ;   2182 A182 ..       ??       
.addr D_1_21DE                                    ;   2184 A184 N DE A1
.addr D_1_21E0                                    ;   2186 A186 N E0 A1
.addr D_1_21E2                                    ;   2188 A188 N E2 A1
.addr D_1_21E4                                    ;   218A A18A N E4 A1
.addr D_1_21E6                                    ;   218C A18C N E6 A1
.addr D_1_21E8                                    ;   218E A18E N E8 A1
.byte $EA,$A1                                     ;   2190 A190 ..       ??       
.addr D_1_21EC                                    ;   2192 A192 N EC A1
.byte $EE,$A1,$F0,$A1                             ;   2194 A194 ....     ????     
.addr D_1_21F2                                    ;   2198 A198 N F2 A1
.byte $F4,$A1,$F6,$A1,$F8,$A1,$FA,$A1             ;   219A A19A ........ ???????? 
.byte $FC,$A1,$FE,$A1,$00,$A2                     ;   21A2 A1A2 ......   ??????   
.addr D_1_2202                                    ;   21A8 A1A8 N 02 A2
.addr D_1_2204                                    ;   21AA A1AA N 04 A2
.addr D_1_2206                                    ;   21AC A1AC N 06 A2
.addr D_1_2208                                    ;   21AE A1AE N 08 A2
.addr D_1_220A                                    ;   21B0 A1B0 N 0A A2
.addr D_1_220C                                    ;   21B2 A1B2 N 0C A2
.addr D_1_220E                                    ;   21B4 A1B4 N 0E A2
.addr D_1_2210                                    ;   21B6 A1B6 N 10 A2
.addr D_1_2212                                    ;   21B8 A1B8 N 12 A2
.addr D_1_2214                                    ;   21BA A1BA N 14 A2
D_1_21BC:
.byte $41                                         ;   21BC A1BC D        A        F:010338
.byte $53                                         ;   21BD A1BD D        S        F:010339
D_1_21BE:
.byte $42                                         ;   21BE A1BE D        B        F:010705
.byte $54                                         ;   21BF A1BF D        T        F:010706
D_1_21C0:
.byte $43                                         ;   21C0 A1C0 D        C        F:010338
.byte $55                                         ;   21C1 A1C1 D        U        F:010339
D_1_21C2:
.byte $44                                         ;   21C2 A1C2 D        D        F:011072
.byte $56                                         ;   21C3 A1C3 D        V        F:011073
D_1_21C4:
.byte $45                                         ;   21C4 A1C4 D        E        F:010338
.byte $57                                         ;   21C5 A1C5 D        W        F:010339
D_1_21C6:
.byte $45                                         ;   21C6 A1C6 D        E        F:025679
.byte $58                                         ;   21C7 A1C7 D        X        F:025680
D_1_21C8:
.byte $43                                         ;   21C8 A1C8 D        C        F:020029
.byte $59                                         ;   21C9 A1C9 D        Y        F:020030
D_1_21CA:
.byte $46                                         ;   21CA A1CA D        F        F:011439
.byte $53                                         ;   21CB A1CB D        S        F:011440
D_1_21CC:
.byte $47                                         ;   21CC A1CC D        G        F:010338
.byte $5A                                         ;   21CD A1CD D        Z        F:010339
D_1_21CE:
.byte $48                                         ;   21CE A1CE D        H        F:040654
.byte $5B                                         ;   21CF A1CF D        [        F:040655
D_1_21D0:
.byte $49                                         ;   21D0 A1D0 D        I        F:026481
.byte $5C                                         ;   21D1 A1D1 D        \        F:026482
D_1_21D2:
.byte $4A                                         ;   21D2 A1D2 D        J        F:011072
.byte $57                                         ;   21D3 A1D3 D        W        F:011073
D_1_21D4:
.byte $4B                                         ;   21D4 A1D4 D        K        F:010338
.byte $5D                                         ;   21D5 A1D5 D        ]        F:010339
D_1_21D6:
.byte $61                                         ;   21D6 A1D6 D        a        F:009645
.byte $6B                                         ;   21D7 A1D7 D        k        F:009646
D_1_21D8:
.byte $62                                         ;   21D8 A1D8 D        b        F:009645
.byte $6C                                         ;   21D9 A1D9 D        l        F:009646
D_1_21DA:
.byte $63                                         ;   21DA A1DA D        c        F:018043
.byte $6D                                         ;   21DB A1DB D        m        F:018044
.byte $62,$6E                                     ;   21DC A1DC ..       bn       
D_1_21DE:
.byte $63                                         ;   21DE A1DE D        c        F:010338
.byte $6F                                         ;   21DF A1DF D        o        F:010339
D_1_21E0:
.byte $64                                         ;   21E0 A1E0 D        d        F:009645
.byte $70                                         ;   21E1 A1E1 D        p        F:009646
D_1_21E2:
.byte $47                                         ;   21E2 A1E2 D        G        F:010705
.byte $71                                         ;   21E3 A1E3 D        q        F:010706
D_1_21E4:
.byte $46                                         ;   21E4 A1E4 D        F        F:010705
.byte $72                                         ;   21E5 A1E5 D        r        F:010706
D_1_21E6:
.byte $46                                         ;   21E6 A1E6 D        F        F:030538
.byte $73                                         ;   21E7 A1E7 D        s        F:030539
D_1_21E8:
.byte $65                                         ;   21E8 A1E8 D        e        F:009645
.byte $74                                         ;   21E9 A1E9 D        t        F:009646
.byte $66,$75                                     ;   21EA A1EA ..       fu       
D_1_21EC:
.byte $67                                         ;   21EC A1EC D        g        F:020396
.byte $76                                         ;   21ED A1ED D        v        F:020397
.byte $68,$77,$90,$5E                             ;   21EE A1EE ....     hw?^     
D_1_21F2:
.byte $91                                         ;   21F2 A1F2 D        ?        F:021989
.byte $5E                                         ;   21F3 A1F3 D        ^        F:021990
.byte $92,$98,$93,$99,$94,$9A,$95,$9B             ;   21F4 A1F4 ........ ???????? 
.byte $4E,$9C,$96,$9D,$97,$D6                     ;   21FC A1FC ......   N?????   
D_1_2202:
.byte $62,$87                                     ;   2202 A202 DD       b?       F:012833
D_1_2204:
.byte $78,$7E                                     ;   2204 A204 DD       x~       F:008272
D_1_2206:
.byte $79,$7F                                     ;   2206 A206 DD       y?       F:008272
D_1_2208:
.byte $79,$80                                     ;   2208 A208 DD       y?       F:008272
D_1_220A:
.byte $7A,$81                                     ;   220A A20A DD       z?       F:008272
D_1_220C:
.byte $7B,$82                                     ;   220C A20C DD       {?       F:008272
D_1_220E:
.byte $7C,$83                                     ;   220E A20E DD       |?       F:008272
D_1_2210:
.byte $7D,$84                                     ;   2210 A210 DD       }?       F:011438
D_1_2212:
.byte $62,$85                                     ;   2212 A212 DD       b?       F:012833
D_1_2214:
.byte $62,$86                                     ;   2214 A214 DD       b?       F:012833
L_1_2216:
  LDA ActiveFamily                                ;   2216 A216 C A5 0B           F:012354
  CMP #$2                                         ;   2218 A218 C C9 02           F:012354
  BCC B_1_2223                                    ;   221A A21A C 90 07           F:012354
  DEC ActiveFamily                                ;   221C A21C C C6 0B           F:034250
  DEC ActiveFamily                                ;   221E A21E C C6 0B           F:034250
  JSR AwardQuestionCash                                    ;   2220 A220 C 20 08 94        F:034250
B_1_2223:
  LDA #$1                                         ;   2223 A223 C A9 01           F:012354
  STA R_0346                                      ;   2225 A225 C 8D 46 03        F:012354
  STA R_0392                                      ;   2228 A228 C 8D 92 03        F:012354
  STA R_04DA                                      ;   222B A22B C 8D DA 04        F:012354
  JSR DisplayFamilyScene                                    ;   222E A22E C 20 8A 92        F:012354
  LDA #$10                                        ;   2231 A231 C A9 10           F:012359
  STA R_0026                                      ;   2233 A233 C 85 26           F:012359
  STA R_0027                                      ;   2235 A235 C 85 27           F:012359
  LDA #$1                                         ;   2237 A237 C A9 01           F:012359
  STA R_0028                                      ;   2239 A239 C 85 28           F:012359
B_1_223B:
  JSR L_0_1435                                    ;   223B A23B C 20 35 94        F:012359
  LDA R_0028                                      ;   223E A23E C A5 28           F:012360
  BNE B_1_223B                                    ;   2240 A240 C D0 F9           F:012360
  LDX #$2                                         ;   2242 A242 C A2 02           F:012375
  LDA D_0_100F,X                                  ;   2244 A244 C BD 0F 90        F:012375
  STA R_05F9                                      ;   2247 A247 C 8D F9 05        F:012375
  STX R_04DA                                      ;   224A A24A C 8E DA 04        F:012375
  JSR L_0_1886                                    ;   224D A24D C 20 86 98        F:012375
  LDA #$5                                         ;   2250 A250 C A9 05           F:012375
  JSR L_0_19F7                                    ;   2252 A252 C 20 F7 99        F:012375
B_1_2255:
  LDA PaletteDirtyFlagPending                     ;   2255 A255 C AD 41 03        F:012375
  STA PaletteDirtyFlag                            ;   2258 A258 C 8D 3D 03        F:012375
  JSR DelayUntilNMI                                    ;   225B A25B C 20 F9 CA        F:012375
  LDA R_0022                                      ;   225E A25E C A5 22           F:012376
  BEQ B_1_226A                                    ;   2260 A260 C F0 08           F:012376
  JSR L_0_17BE                                    ;   2262 A262 C 20 BE 97        F:012376
  LDA #$0                                         ;   2265 A265 C A9 00           F:012376
  ROL                                             ;   2267 A267 C 2A              F:012376
  STA R_0022                                      ;   2268 A268 C 85 22           F:012376
B_1_226A:
  JSR L_0_105B                                    ;   226A A26A C 20 5B 90        F:012376
  JSR SoundSystemUpdate                                    ;   226D A26D C 20 96 BA        F:012376
  JSR L_0_1A7E                                    ;   2270 A270 C 20 7E 9A        F:012376
  LDA R_0028                                      ;   2273 A273 C A5 28           F:012376
  BNE B_1_2255                                    ;   2275 A275 C D0 DE           F:012376
  LDA R_0393                                      ;   2277 A277 C AD 93 03        F:012675
  AND #$F                                         ;   227A A27A C 29 0F           F:012675
  CMP R_0390                                      ;   227C A27C C CD 90 03        F:012675
  BEQ B_1_22DF                                    ;   227F A27F C F0 5E           F:012675
L_1_2281:
  JSR L_0_1D24                                    ;   2281 A281 C 20 24 9D        F:034571
  LDA IsInFastMoney                                      ;   2284 A284 C AD 43 05        F:034572
  BEQ B_1_228B                                    ;   2287 A287 C F0 02           F:034572
  LDX #$2                                         ;   2289 A289 C A2 02           F:043045
B_1_228B:
  STX R_0391                                      ;   228B A28B C 8E 91 03        F:034572
  LDX #$FF                                        ;   228E A28E C A2 FF           F:034572
  STX R_04B9                                      ;   2290 A290 C 8E B9 04        F:034572
  INX                                             ;   2293 A293 C E8              F:034572
  STX PaletteDirtyFlag                            ;   2294 A294 C 8E 3D 03        F:034572
B_1_2297:
  LDA R_0393                                      ;   2297 A297 C AD 93 03        F:034572
  AND #$F                                         ;   229A A29A C 29 0F           F:034572
  CMP R_0390                                      ;   229C A29C C CD 90 03        F:034572
  BEQ B_1_22C2                                    ;   229F A29F C F0 21           F:034572
B_1_22A1:
  INC R_04B9                                      ;   22A1 A2A1 C EE B9 04        F:034572
  LDX R_04B9                                      ;   22A4 A2A4 C AE B9 04        F:034572
  LDA R_0384,X                                    ;   22A7 A2A7 C BD 84 03        F:034572
  BNE B_1_22A1                                    ;   22AA A2AA C D0 F5           F:034572
  LDA #$1                                         ;   22AC A2AC C A9 01           F:034572
  STA R_0384,X                                    ;   22AE A2AE C 9D 84 03        F:034572
  JSR AutocompleteAnswer                                    ;   22B1 A2B1 C 20 73 FF        F:034572
  JSR B_0_1C46                                    ;   22B4 A2B4 C 20 46 9C        F:034573
  LDA R_0391                                      ;   22B7 A2B7 C AD 91 03        F:034696
  BNE B_1_2297                                    ;   22BA A2BA C D0 DB           F:034696
  INC R_0391                                      ;   22BC A2BC . EE 91 03        
  JMP $A297                                       ;   22BF A2BF . 4C 97 A2        

B_1_22C2:
  LDA #$0                                         ;   22C2 A2C2 C A9 00           F:034820
  STA R_0391                                      ;   22C4 A2C4 C 8D 91 03        F:034820
  LDA #$1                                         ;   22C7 A2C7 C A9 01           F:034820
  JSR L_0_19F7                                    ;   22C9 A2C9 C 20 F7 99        F:034820
B_1_22CC:
  JSR DelayUntilNMI                                    ;   22CC A2CC C 20 F9 CA        F:034820
  LDA R_0028                                      ;   22CF A2CF C A5 28           F:034821
  BNE B_1_22CC                                    ;   22D1 A2D1 C D0 F9           F:034821
  JSR B_0_1A27                                    ;   22D3 A2D3 C 20 27 9A        F:034880
B_1_22D6:
  JSR L_2_52B6                                    ;   22D6 A2D6 C 20 B6 D2        F:012690
  LDA #$0                                         ;   22D9 A2D9 C A9 00           F:012690
  STA R_0392                                      ;   22DB A2DB C 8D 92 03        F:012690
  RTS                                             ;   22DE A2DE C 60              F:012690

B_1_22DF:
  LDA #$1                                         ;   22DF A2DF C A9 01           F:012675
  STA PaletteDirtyFlag                            ;   22E1 A2E1 C 8D 3D 03        F:012675
  JSR DelayUntilNMI                                    ;   22E4 A2E4 C 20 F9 CA        F:012675
  JSR L_0_105B                                    ;   22E7 A2E7 C 20 5B 90        F:012676
  JSR SoundSystemUpdate                                    ;   22EA A2EA C 20 96 BA        F:012676
  JSR L_0_1A30                                    ;   22ED A2ED C 20 30 9A        F:012676
  BCC B_1_22DF                                    ;   22F0 A2F0 C 90 ED           F:012676
  BCS B_1_22D6                                    ;   22F2 A2F2 C B0 E2           F:012690
D_1_22F4:
.byte $00                                         ;   22F4 A2F4 D        ?        F:000004
.byte $00                                         ;   22F5 A2F5 D        ?        F:000318
.byte $00                                         ;   22F6 A2F6 D        ?        F:008267
.byte $00                                         ;   22F7 A2F7 D        ?        F:041641
.byte $28                                         ;   22F8 A2F8 D        (        F:006297
.byte $00                                         ;   22F9 A2F9 D        ?        F:006005
.byte $00                                         ;   22FA A2FA D        ?        F:006103
.byte $00                                         ;   22FB A2FB D        ?        F:006101
.byte $00                                         ;   22FC A2FC D        ?        F:008269
.byte $00                                         ;   22FD A2FD D        ?        F:047456
.byte $00                                         ;   22FE A2FE D        ?        F:023706
.byte $00                                         ;   22FF A2FF D        ?        F:044055
.byte $00                                         ;   2300 A300 .        ?        
.byte $00                                         ;   2301 A301 D        ?        F:006295
.byte $00                                         ;   2302 A302 D        ?        F:007144
.byte $00                                         ;   2303 A303 .        ?        
.byte $00                                         ;   2304 A304 D        ?        F:022388
.byte $00                                         ;   2305 A305 .        ?        
.byte $00                                         ;   2306 A306 D        ?        F:044982
SetNewBackground:
  STA BGActive                                    ;   2307 A307 C 8D 45 03        F:000004
  STX BGActiveNametable                           ;   230A A30A C 8E 43 03        F:000004
  STY R_000E                                      ;   230D A30D C 84 0E           F:000004
  JSR PPUMASKHideBackground                                    ;   230F A30F C 20 A4 99        F:000004
  JSR PPUMASKHideSprites                                    ;   2312 A312 C 20 B2 99        F:000004
  LDA PPUCTRL_Mirror                              ;   2315 A315 C A5 0C           F:000004
  STA PpuControl_2000                             ;   2317 A317 C 8D 00 20        F:000004
  LDA PPUMASK_Mirror                              ;   231A A31A C A5 0D           F:000004
  STA PpuMask_2001                                ;   231C A31C C 8D 01 20        F:000004
  JSR L_0_1A0B                                    ;   231F A31F C 20 0B 9A        F:000004
  LDA BGActive                                    ;   2322 A322 C AD 45 03        F:000004
  ASL                                             ;   2325 A325 C 0A              F:000004
  ASL                                             ;   2326 A326 C 0A              F:000004
  TAX                                             ;   2327 A327 C AA              F:000004
  LDA BGBackgrounds,X                                  ;   2328 A328 C BD 10 A4        F:000004
  STA R_0018                                      ;   232B A32B C 85 18           F:000004
  LDA BGBackgrounds+1,X                                  ;   232D A32D C BD 11 A4        F:000004
  STA R_000F                                      ;   2330 A330 C 85 0F           F:000004
  LDA BGBackgrounds+2,X                                  ;   2332 A332 C BD 12 A4        F:000004
  PHA                                             ;   2335 A335 C 48              F:000004
  AND #$F                                         ;   2336 A336 C 29 0F           F:000004
  STA R_0010                                      ;   2338 A338 C 85 10           F:000004
  PLA                                             ;   233A A33A C 68              F:000004
  AND #$F0                                        ;   233B A33B C 29 F0           F:000004
  LSR                                             ;   233D A33D C 4A              F:000004
  LSR                                             ;   233E A33E C 4A              F:000004
  LSR                                             ;   233F A33F C 4A              F:000004
  LSR                                             ;   2340 A340 C 4A              F:000004
  STA R_0019                                      ;   2341 A341 C 85 19           F:000004
  JSR MMC1SetCHR0                                    ;   2343 A343 C 20 54 99        F:000004
  LDA BGActiveNametable                           ;   2346 A346 C AD 43 03        F:000004
  ASL                                             ;   2349 A349 C 0A              F:000004
  TAY                                             ;   234A A34A C A8              F:000004
  LDA PPUNametables,Y                                  ;   234B A34B C B9 65 A3        F:000004
  STA BGDrawPPUAddress                            ;   234E A34E C 85 16           F:000004
  LDA PPUNametables+1,Y                                  ;   2350 A350 C B9 66 A3        F:000004
  STA BGDrawPPUAddress+1                          ;   2353 A353 C 85 17           F:000004
  STX R_0012                                      ;   2355 A355 C 86 12           F:000004
  JSR BGUpdateInner                                    ;   2357 A357 C 20 6D A3        F:000004
  LDX R_0012                                      ;   235A A35A C A6 12           F:000006
  JSR L_1_23A9                                    ;   235C A35C C 20 A9 A3        F:000006
  LDA R_0018                                      ;   235F A35F C A5 18           F:000006
  JSR MMC1SetCHR0                                    ;   2361 A361 C 20 54 99        F:000006
B_1_2364:
  RTS                                             ;   2364 A364 C 60              F:000006

PPUNametables:
  .addr $2000
  .addr $2400
  .addr $2800
  .addr $2C00

BGUpdateInner:
  JSR L_1_23E6                                    ;   236D A36D C 20 E6 A3        F:000004
  STA R_0011                                      ;   2370 A370 C 85 11           F:000004
L_1_2372:
  JSR L_1_23E6                                    ;   2372 A372 C 20 E6 A3        F:000004
  CMP R_0011                                      ;   2375 A375 C C5 11           F:000004
  BNE B_1_23A0                                    ;   2377 A377 C D0 27           F:000004
  JSR L_1_23E6                                    ;   2379 A379 C 20 E6 A3        F:000004
  BEQ B_1_2364                                    ;   237C A37C C F0 E6           F:000004
  TAX                                             ;   237E A37E C AA              F:000004
  DEX                                             ;   237F A37F C CA              F:000004
  JSR L_1_23E6                                    ;   2380 A380 C 20 E6 A3        F:000004
  STA R_0014                                      ;   2383 A383 C 85 14           F:000004
  LDY BGActive                                    ;   2385 A385 C AC 45 03        F:000004
  CMP D_1_22F4,Y                                  ;   2388 A388 C D9 F4 A2        F:000004
  BNE B_1_2395                                    ;   238B A38B C D0 08           F:000004
  LDA R_000E                                      ;   238D A38D C A5 0E           F:000004
  BEQ B_1_2395                                    ;   238F A38F C F0 04           F:000004
  CPX #$3F                                        ;   2391 A391 C E0 3F           F:006103
  BCS B_1_2364                                    ;   2393 A393 C B0 CF           F:006103
B_1_2395:
  LDA R_0014                                      ;   2395 A395 C A5 14           F:000004
B_1_2397:
  JSR L_1_23FD                                    ;   2397 A397 C 20 FD A3        F:000004
  STA PpuData_2007                                ;   239A A39A C 8D 07 20        F:000004
  DEX                                             ;   239D A39D C CA              F:000004
  BNE B_1_2397                                    ;   239E A39E C D0 F7           F:000004
B_1_23A0:
  JSR L_1_23FD                                    ;   23A0 A3A0 C 20 FD A3        F:000004
  STA PpuData_2007                                ;   23A3 A3A3 C 8D 07 20        F:000004
  JMP L_1_2372                                    ;   23A6 A3A6 C 4C 72 A3        F:000004

L_1_23A9:
  LDA BGActive                                    ;   23A9 A3A9 C AD 45 03        F:000006
  CMP #$4                                         ;   23AC A3AC C C9 04           F:000006
  BEQ B_1_23E5                                    ;   23AE A3AE C F0 35           F:000006
  CMP #$6                                         ;   23B0 A3B0 C C9 06           F:000006
  BEQ B_1_23E5                                    ;   23B2 A3B2 C F0 31           F:000006
  LDA R_000E                                      ;   23B4 A3B4 C A5 0E           F:000006
  CMP #$2                                         ;   23B6 A3B6 C C9 02           F:000006
  BEQ B_1_23E5                                    ;   23B8 A3B8 C F0 2B           F:000006
  LDA BGBackgrounds+3,X                                  ;   23BA A3BA C BD 13 A4        F:000006
  ASL                                             ;   23BD A3BD C 0A              F:000006
  TAX                                             ;   23BE A3BE C AA              F:000006
  LDA PalettePtrs,X                                  ;   23BF A3BF C BD 60 A4        F:000006
  STA R_000F                                      ;   23C2 A3C2 C 85 0F           F:000006
  LDA PalettePtrs+1,X                                  ;   23C4 A3C4 C BD 61 A4        F:000006
  STA R_0010                                      ;   23C7 A3C7 C 85 10           F:000006
  LDX #$F                                         ;   23C9 A3C9 C A2 0F           F:000006
  LDY #$F                                         ;   23CB A3CB C A0 0F           F:000006
B_1_23CD:
  LDA PaletteDirtyFlagPending                     ;   23CD A3CD C AD 41 03        F:000006
  BEQ B_1_23DC                                    ;   23D0 A3D0 C F0 0A           F:000006
  LDA (R_000F),Y                                  ;   23D2 A3D2 C B1 0F           F:000006
  STA R_032D,X                                    ;   23D4 A3D4 C 9D 2D 03        F:000006
  LDA #$F                                         ;   23D7 A3D7 C A9 0F           F:000006
  JMP L_1_23DE                                    ;   23D9 A3D9 C 4C DE A3        F:000006

B_1_23DC:
  LDA (R_000F),Y                                  ;   23DC A3DC . B1 0F           
L_1_23DE:
  STA PaletteBackgroundCopy,X                     ;   23DE A3DE C 9D 1D 03        F:000006
  DEX                                             ;   23E1 A3E1 C CA              F:000006
  DEY                                             ;   23E2 A3E2 C 88              F:000006
  BPL B_1_23CD                                    ;   23E3 A3E3 C 10 E8           F:000006
B_1_23E5:
  RTS                                             ;   23E5 A3E5 C 60              F:000006

L_1_23E6:
  LDA R_0010                                      ;   23E6 A3E6 C A5 10           F:000004
  STA PpuAddr_2006                                ;   23E8 A3E8 C 8D 06 20        F:000004
  LDA R_000F                                      ;   23EB A3EB C A5 0F           F:000004
  STA PpuAddr_2006                                ;   23ED A3ED C 8D 06 20        F:000004
  LDA PpuData_2007                                ;   23F0 A3F0 C AD 07 20        F:000004
  INC R_000F                                      ;   23F3 A3F3 C E6 0F           F:000004
  BNE B_1_23F9                                    ;   23F5 A3F5 C D0 02           F:000004
  INC R_0010                                      ;   23F7 A3F7 C E6 10           F:000005
B_1_23F9:
  LDA PpuData_2007                                ;   23F9 A3F9 C AD 07 20        F:000004
  RTS                                             ;   23FC A3FC C 60              F:000004

L_1_23FD:
  PHA                                             ;   23FD A3FD C 48              F:000004
  LDA BGDrawPPUAddress+1                          ;   23FE A3FE C A5 17           F:000004
  STA PpuAddr_2006                                ;   2400 A400 C 8D 06 20        F:000004
  LDA BGDrawPPUAddress                            ;   2403 A403 C A5 16           F:000004
  STA PpuAddr_2006                                ;   2405 A405 C 8D 06 20        F:000004
  INC BGDrawPPUAddress                            ;   2408 A408 C E6 16           F:000004
  BNE B_1_240E                                    ;   240A A40A C D0 02           F:000004
  INC BGDrawPPUAddress+1                          ;   240C A40C C E6 17           F:000004
B_1_240E:
  PLA                                             ;   240E A40E C 68              F:000004
  RTS                                             ;   240F A40F C 60              F:000004

BGBackgrounds:
.byte $0B,$67,$EA,$05
.byte $09,$05,$E5,$0C
.byte $0A,$01,$E8,$02
.byte $0B,$13,$F1,$10
.byte $08,$5F,$E2,$00
.byte $0B,$6A,$EB,$0A
.byte $01,$DE,$E0,$01
.byte $00,$00,$E0,$0B
.byte $02,$31,$F4,$07
.byte $03,$B1,$F4,$08
.byte $04,$31,$F5,$09
.byte $0B,$C0,$F1,$0E
.byte $0B,$9C,$F3,$0D
.byte $09,$2A,$E3,$03
.byte $09,$1D,$E4,$03
.byte $0B,$D6,$EB,$04
.byte $0B,$BE,$EC,$04
.byte $0B,$06,$F0,$04
.byte $0B,$E2,$F2,$0F
.byte $0D,$B1,$F5,$13

PalettePtrs:
.addr PaletteData0
.addr PaletteData1
.addr PaletteData2
.addr PaletteData3
.addr PaletteData4
.addr PaletteData5
.addr PaletteData6
.addr PaletteData7
.addr PaletteData8
.addr PaletteData9
.addr PaletteData10
.addr PaletteData11
.addr PaletteData12
.addr PaletteData13
.addr PaletteData14
.addr PaletteData15
.addr PaletteData16
.addr PaletteData17
.addr PaletteData18
.addr PaletteData19

PaletteData0:
.byte $16,$2C,$27,$0F
.byte $16,$0F,$27,$0F
.byte $16,$37,$17,$07
.byte $16,$3D,$34,$10
PaletteData1:
.byte $16,$2C,$27,$0F
.byte $16,$28,$26,$0F
.byte $16,$12,$26,$0F
.byte $16,$0A,$26,$0F
PaletteData2:
.byte $0F,$28,$17,$16
.byte $0F,$30,$12,$11
.byte $0F,$0F,$0F,$0F
.byte $0F,$28,$17,$27
PaletteData3:
.byte $16,$2C,$27,$0F
.byte $16,$19,$26,$0F
.byte $16,$37,$26,$0F
.byte $16,$13,$26,$0F
PaletteData4:
.byte $0F,$20,$20,$20
.byte $0F,$0F,$06,$16
.byte $0F,$0A,$1A,$2A
.byte $0F,$2D,$00,$28
PaletteData5:
.byte $0F,$20,$11,$21
.byte $0F,$06,$26,$16
.byte $0F,$0A,$1A,$2A
.byte $0F,$08,$18,$28
PaletteData6:
.byte $16,$2C,$27,$0F
.byte $16,$38,$26,$0F
.byte $16,$07,$26,$0F
.byte $16,$02,$26,$0F
PaletteData7:
.byte $16,$2C,$27,$0F
.byte $16,$38,$26,$0F
.byte $16,$02,$26,$0F
.byte $16,$07,$26,$0F
PaletteData8:
.byte $16,$2C,$27,$0F
.byte $16,$28,$26,$0F
.byte $16,$0C,$26,$0F
.byte $16,$0A,$26,$0F
PaletteData9:
.byte $16,$2C,$27,$0F
.byte $16,$28,$26,$0F
.byte $16,$05,$26,$0F
.byte $16,$0A,$26,$0F
PaletteData10:
.byte $0F,$01,$20,$21
.byte $0F,$06,$26,$16
.byte $0F,$0A,$1A,$2A
.byte $0F,$2D,$00,$28
PaletteData11:
.byte $16,$2C,$27,$0F
.byte $16,$28,$26,$0F
.byte $16,$12,$26,$0F
.byte $16,$0A,$26,$0F
PaletteData12:
.byte $16,$0F,$28,$06
.byte $16,$26,$28,$06
.byte $16,$0F,$27,$06
.byte $16,$38,$28,$1C
PaletteData13:
.byte $0F,$20,$2D,$10
.byte $0F,$16,$06,$0F
.byte $0F,$2A,$0A,$0F
.byte $0F,$28,$08,$0F
PaletteData14:
.byte $0F,$20,$2D,$28
.byte $0F,$16,$06,$0F
.byte $0F,$2A,$0A,$0F
.byte $0F,$28,$08,$0F
PaletteData15:
.byte $0F,$01,$20,$22
.byte $0F,$16,$06,$0F
.byte $0F,$2A,$0A,$0F
.byte $0F,$28,$08,$0F
PaletteData16:
.byte $02,$28,$0F,$16
.byte $02,$30,$12,$0F
.byte $02,$30,$16,$0F
.byte $02,$02,$0F,$3D
PaletteData17:
.byte $01,$10,$26,$1D
.byte $01,$0E,$00,$00
.byte $01,$06,$F6,$0D
.byte $01,$00,$B8,$01
PaletteData18:
.byte $01,$10,$26,$1D
.byte $01
PaletteData18_2:
.byte $0E,$00,$00
.byte $01,$06,$F6,$0D
.byte $01,$00,$B8,$01
PaletteData19:
.byte $0D,$00,$30,$02
.byte $0D,$39,$30,$26
.byte $0D,$13,$2A,$21
.byte $0D,$39

D_1_25C6:
.byte $30                                         ;   25C6 A5C6 .        0        
D_1_25C7:
.byte $15                                         ;   25C7 A5C7 .        ?        
D_1_25C8:
.byte $00                                         ;   25C8 A5C8 D        ?        F:042313
.byte $10                                         ;   25C9 A5C9 D        ?        F:042565
.byte $20                                         ;   25CA A5CA D                 F:042693
.byte $30                                         ;   25CB A5CB D        0        F:042825
.byte $40                                         ;   25CC A5CC D        @        F:042915
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   25CD A5CD ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   25D5 A5D5 ........ ???????? 
.byte $63                                         ;   25DD A5DD D        c        F:042700
.byte $64                                         ;   25DE A5DE D        d        F:041873
.byte $65                                         ;   25DF A5DF D        e        F:042399
.byte $66                                         ;   25E0 A5E0 D        f        F:042623
.byte $67                                         ;   25E1 A5E1 D        g        F:042738
.byte $68                                         ;   25E2 A5E2 D        h        F:042838
.byte $69                                         ;   25E3 A5E3 D        i        F:042700
.byte $6A,$6B,$6C,$6D,$00,$00,$00,$00             ;   25E4 A5E4 ........ jklm???? 
.byte $00,$00                                     ;   25EC A5EC ..       ??       
.byte $49                                         ;   25EE A5EE D        I        F:066880
.byte $4A                                         ;   25EF A5EF D        J        F:067188
.byte $4B                                         ;   25F0 A5F0 D        K        F:042369
.byte $4C                                         ;   25F1 A5F1 D        L        F:042577
.byte $4D                                         ;   25F2 A5F2 D        M        F:042369
.byte $4E                                         ;   25F3 A5F3 D        N        F:042577
.byte $4F,$50,$51,$52,$53                         ;   25F4 A5F4 .....    OPQRS    
.byte $54                                         ;   25F9 A5F9 D        T        F:042369
.byte $55                                         ;   25FA A5FA D        U        F:066880
.byte $56                                         ;   25FB A5FB D        V        F:067188
.byte $57                                         ;   25FC A5FC D        W        F:042369
.byte $58,$59                                     ;   25FD A5FD ..       XY       
.byte $5A                                         ;   25FF A5FF D        Z        F:066880
.byte $5B,$5C                                     ;   2600 A600 DD       [\       F:042369
.byte $5D                                         ;   2602 A602 D        ]        F:066880
.byte $5E                                         ;   2603 A603 D        ^        F:067842
.byte $5F,$60                                     ;   2604 A604 ..       _`       
.byte $61                                         ;   2606 A606 D        a        F:067626
.byte $62,$00,$00,$00,$00,$00                     ;   2607 A607 ......   b?????   
.byte $41,$6E,$73,$77,$65,$72,$20,$66             ;   260D A60D DDDDDDDD Answer f F:041644
.byte $69,$76,$65,$20,$71,$75,$65,$73             ;   2615 A615 DDDDDDDD ive ques F:041644
.byte $74,$69,$6F,$6E,$73,$20,$69,$6E             ;   261D A61D DDDDDDDD tions in F:041644
.byte $20,$74,$68,$65,$20,$74,$69,$6D             ;   2625 A625 DDDDDDDD  the tim F:041644
.byte $65,$20,$67,$69,$76,$65,$EE                 ;   262D A62D DDDDDDD  e give?  F:041644
RunFastMoneyScene:
  LDA CurrentFMQuestion                           ;   2634 A634 C AD 1B 03        F:041638
  STA CurrentFMQuestion2                          ;   2637 A637 C 8D 19 03        F:041638
  LDA CurrentFMQuestion+1                                      ;   263A A63A C AD 1C 03        F:041638
  STA CurrentFMQuestion2+1                                      ;   263D A63D C 8D 1A 03        F:041638
  LDA #$3                                         ;   2640 A640 C A9 03           F:041638
  STA ActiveScene                                 ;   2642 A642 C 8D D3 04        F:041638
  LDY #$1                                         ;   2645 A645 C A0 01           F:041638
  STY IsInFastMoney                                      ;   2647 A647 C 8C 43 05        F:041638
  DEY                                             ;   264A A64A C 88              F:041638
  STY IsStealingQuestion                          ;   264B A64B C 84 25           F:041638
  STY QuestionCurrentCash                         ;   264D A64D C 8C C7 04        F:041638
  STY QuestionCurrentCash+1                       ;   2650 A650 C 8C C8 04        F:041638
  STY CurrentRoundNumber                          ;   2653 A653 C 8C 10 03        F:041638
  JSR L_2_52B6                                    ;   2656 A656 C 20 B6 D2        F:041638
L_1_2659:
  LDA #$3B                                        ;   2659 A659 C A9 3B           F:041638
  STA R_04CA                                      ;   265B A65B C 8D CA 04        F:041638
  LDY #$0                                         ;   265E A65E C A0 00           F:041638
  STY R_04CB                                      ;   2660 A660 C 8C CB 04        F:041638
  STY R_04CF                                      ;   2663 A663 C 8C CF 04        F:041638
  LDA #$3                                         ;   2666 A666 C A9 03           F:041638
  STA R_04CC                                      ;   2668 A668 C 8D CC 04        F:041638
  INY                                             ;   266B A66B C C8              F:041638
  STY R_04CD                                      ;   266C A66C C 8C CD 04        F:041638
  JSR PPUHideAllAndWaitForNMI                                    ;   266F A66F C 20 C0 99        F:041638
  LDA #$8                                         ;   2672 A672 C A9 08           F:041639
  JSR SetNMIRoutine                                    ;   2674 A674 C 20 C7 CA        F:041639
  LDX #$1                                         ;   2677 A677 C A2 01           F:041639
  STX PaletteDirtyFlag                            ;   2679 A679 C 8E 3D 03        F:041639
  LDA IsInFastMoney                                      ;   267C A67C C AD 43 05        F:041639
  CMP #$2                                         ;   267F A67F C C9 02           F:041639
  BEQ B_1_268A                                    ;   2681 A681 C F0 07           F:041639
  LDA #$2                                         ;   2683 A683 C A9 02           F:041639
  LDY #$0                                         ;   2685 A685 C A0 00           F:041639
  JSR SetNewBackground                                    ;   2687 A687 C 20 07 A3        F:041639
B_1_268A:
  LDA #$3                                         ;   268A A68A C A9 03           F:041641
  LDX #$0                                         ;   268C A68C C A2 00           F:041641
  STX PPUNametable                                ;   268E A68E C 8E 44 03        F:041641
  LDY #$0                                         ;   2691 A691 C A0 00           F:041641
  JSR SetNewBackground                                    ;   2693 A693 C 20 07 A3        F:041641
  JSR DrawQuestionTopBackgroundColor                                    ;   2696 A696 C 20 C5 8C        F:041643
  LDY #$1                                         ;   2699 A699 C A0 01           F:041643
  STY R_001F                                      ;   269B A69B C 84 1F           F:041643
  DEY                                             ;   269D A69D C 88              F:041643
  STY R_0551                                      ;   269E A69E C 8C 51 05        F:041643
  STY R_0561                                      ;   26A1 A6A1 C 8C 61 05        F:041643
  STY R_0571                                      ;   26A4 A6A4 C 8C 71 05        F:041643
  STY R_0581                                      ;   26A7 A6A7 C 8C 81 05        F:041643
  STY R_0591                                      ;   26AA A6AA C 8C 91 05        F:041643
  STY R_054F                                      ;   26AD A6AD C 8C 4F 05        F:041643
  STY R_0544                                      ;   26B0 A6B0 C 8C 44 05        F:041643
  STY R_0545                                      ;   26B3 A6B3 C 8C 45 05        F:041643
  STY R_0546                                      ;   26B6 A6B6 C 8C 46 05        F:041643
  STY R_0547                                      ;   26B9 A6B9 C 8C 47 05        F:041643
  STY R_0548                                      ;   26BC A6BC C 8C 48 05        F:041643
  STY R_0384                                      ;   26BF A6BF C 8C 84 03        F:041643
  STY R_0385                                      ;   26C2 A6C2 C 8C 85 03        F:041643
  STY R_0386                                      ;   26C5 A6C5 C 8C 86 03        F:041643
  STY R_0387                                      ;   26C8 A6C8 C 8C 87 03        F:041643
  STY R_0388                                      ;   26CB A6CB C 8C 88 03        F:041643
  DEY                                             ;   26CE A6CE C 88              F:041643
  STY R_0550                                      ;   26CF A6CF C 8C 50 05        F:041643
  JSR MoveSpritesOffscreen                                    ;   26D2 A6D2 C 20 D5 99        F:041643
  JSR L_0_04E5                                    ;   26D5 A6D5 C 20 E5 84        F:041643
  LDX #$A6                                        ;   26D8 A6D8 C A2 A6           F:041644
  LDY #$D                                         ;   26DA A6DA C A0 0D           F:041644
  JSR PrepareQuestionText                                    ;   26DC A6DC C 20 2C 87        F:041644
  JSR DrawQuestionText                                    ;   26DF A6DF C 20 C4 87        F:041644
  JSR L_0_06D9                                    ;   26E2 A6E2 C 20 D9 86        F:041644
  LDX R_05C1                                      ;   26E5 A6E5 C AE C1 05        F:041644
  BMI B_1_26ED                                    ;   26E8 A6E8 C 30 03           F:041644
  JSR L_2_52AA                                    ;   26EA A6EA C 20 AA D2        F:041644
B_1_26ED:
  LDX R_05C2                                      ;   26ED A6ED C AE C2 05        F:041644
  BMI B_1_26F5                                    ;   26F0 A6F0 C 30 03           F:041644
  JSR L_2_52AA                                    ;   26F2 A6F2 C 20 AA D2        F:041644
B_1_26F5:
  LDY #$0                                         ;   26F5 A6F5 C A0 00           F:041644
  JSR L_2_528C                                    ;   26F7 A6F7 C 20 8C D2        F:041644
  STX R_05C1                                      ;   26FA A6FA C 8E C1 05        F:041644
  LDA #$80                                        ;   26FD A6FD C A9 80           F:041644
  STA EntityXLo,X                                 ;   26FF A6FF C 9D C9 05        F:041644
  LDA #$B                                         ;   2702 A702 C A9 0B           F:041644
  STA EntityXHi,X                                 ;   2704 A704 C 9D C7 05        F:041644
  LDA #$70                                        ;   2707 A707 C A9 70           F:041644
  STA EntityYLo,X                                 ;   2709 A709 C 9D CD 05        F:041644
  LDA #$8                                         ;   270C A70C C A9 08           F:041644
  STA EntityYHi,X                                 ;   270E A70E C 9D CB 05        F:041644
  LDA #$0                                         ;   2711 A711 C A9 00           F:041644
  STA R_05CF,X                                    ;   2713 A713 C 9D CF 05        F:041644
  STA R_05D1,X                                    ;   2716 A716 C 9D D1 05        F:041644
  LDY IsInFastMoney                                      ;   2719 A719 C AC 43 05        F:041644
  LDA CurrentAnsweringFamilyMember,Y              ;   271C A71C C B9 DC 04        F:041644
  CLC                                             ;   271F A71F C 18              F:041644
  ADC #$AE                                        ;   2720 A720 C 69 AE           F:041644
  STA R_05C5,X                                    ;   2722 A722 C 9D C5 05        F:041644
  LDA #$3                                         ;   2725 A725 C A9 03           F:041644
  JSR L_0_19F7                                    ;   2727 A727 C 20 F7 99        F:041644
  LDA #$0                                         ;   272A A72A C A9 00           F:041644
  STA R_035E                                      ;   272C A72C C 8D 5E 03        F:041644
  STA R_04D6                                      ;   272F A72F C 8D D6 04        F:041644
  STA R_04E0                                      ;   2732 A732 C 8D E0 04        F:041644
  STA R_04E1                                      ;   2735 A735 C 8D E1 04        F:041644
  JSR L_0_1A0B                                    ;   2738 A738 C 20 0B 9A        F:041644
  JSR PPUMASKShowSprites                                    ;   273B A73B C 20 B9 99        F:041644
  JSR PPUMASKShowBackground                                    ;   273E A73E C 20 AB 99        F:041644
  JSR PPUCTRLEnableNMI                                    ;   2741 A741 C 20 EF CA        F:041644
B_1_2744:
  LDA PaletteDirtyFlagPending                     ;   2744 A744 C AD 41 03        F:041644
  STA PaletteDirtyFlag                            ;   2747 A747 C 8D 3D 03        F:041644
  JSR DelayUntilNMI                                    ;   274A A74A C 20 F9 CA        F:041644
  JSR MMC1ResetCHRBanks                                    ;   274D A74D C 20 F4 86        F:041645
  JSR SoundSystemUpdate                                    ;   2750 A750 C 20 96 BA        F:041645
  JSR SetFamilyCHRBanks                                    ;   2753 A753 C 20 01 87        F:041645
  LDA #$B                                         ;   2756 A756 C A9 0B           F:041645
  JSR MMC1SetCHR0                                    ;   2758 A758 C 20 54 99        F:041645
  LDY Family1                                     ;   275B A75B C AC 15 03        F:041645
  LDA FamilyCHR,Y                                  ;   275E A75E C B9 CA 8F        F:041645
  JSR MMC1SetCHR1                                    ;   2761 A761 C 20 68 99        F:041645
  JSR L_0_1A7E                                    ;   2764 A764 C 20 7E 9A        F:041645
  LDA R_0028                                      ;   2767 A767 C A5 28           F:041645
  BNE B_1_2744                                    ;   2769 A769 C D0 D9           F:041645
  LDY #$1                                         ;   276B A76B C A0 01           F:041824
  STY R_054E                                      ;   276D A76D C 8C 4E 05        F:041824
  STY R_04E1                                      ;   2770 A770 C 8C E1 04        F:041824
L_1_2773:
  JSR L_1_2C30                                    ;   2773 A773 C 20 30 AC        F:041824
  JSR L_0_06B0                                    ;   2776 A776 C 20 B0 86        F:041841
  LDA #$0                                         ;   2779 A779 C A9 00           F:041841
  STA R_0550                                      ;   277B A77B C 8D 50 05        F:041841
B_1_277E:
  JSR L_1_2855                                    ;   277E A77E C 20 55 A8        F:041841
  JSR L_0_0A03                                    ;   2781 A781 C 20 03 8A        F:041842
  BCS B_1_277E                                    ;   2784 A784 C B0 F8           F:041842
  LDY R_054E                                      ;   2786 A786 C AC 4E 05        F:042313
  LDX D_1_25C7,Y                                  ;   2789 A789 C BE C7 A5        F:042313
  LDY #$0                                         ;   278C A78C C A0 00           F:042313
B_1_278E:
  LDA UserAnswerInput,Y                           ;   278E A78E C B9 60 03        F:042313
  STA R_0551,X                                    ;   2791 A791 C 9D 51 05        F:042313
  BEQ B_1_279A                                    ;   2794 A794 C F0 04           F:042313
  INX                                             ;   2796 A796 C E8              F:042313
  INY                                             ;   2797 A797 C C8              F:042313
  BNE B_1_278E                                    ;   2798 A798 C D0 F4           F:042313
B_1_279A:
  JSR L_1_38FF                                    ;   279A A79A C 20 FF B8        F:042313
  LDA #$9                                         ;   279D A79D C A9 09           F:042313
  STA R_0021                                      ;   279F A79F C 85 21           F:042313
  LDA #$FF                                        ;   27A1 A7A1 C A9 FF           F:042313
  JSR BeginAnswerValidation                                    ;   27A3 A7A3 C 20 F6 F8        F:042313
B_1_27A6:
  JSR ValidateAnswer                                    ;   27A6 A7A6 C 20 22 F9        F:042313
  BCS B_1_27A6                                    ;   27A9 A7A9 C B0 FB           F:042313
  TXA                                             ;   27AB A7AB C 8A              F:042368
  CPX #$FF                                        ;   27AC A7AC C E0 FF           F:042368
  BNE B_1_27B5                                    ;   27AE A7AE C D0 05           F:042368
  LDA R_0393                                      ;   27B0 A7B0 C AD 93 03        F:068931
  AND #$F                                         ;   27B3 A7B3 C 29 0F           F:068931
B_1_27B5:
  STA R_04B9                                      ;   27B5 A7B5 C 8D B9 04        F:042368
  LDY R_054E                                      ;   27B8 A7B8 C AC 4E 05        F:042368
  CPX #$FF                                        ;   27BB A7BB C E0 FF           F:042368
  BNE B_1_27C2                                    ;   27BD A7BD C D0 03           F:042368
  JMP L_1_2831                                    ;   27BF A7BF C 4C 31 A8        F:068931

B_1_27C2:
  LDX D_1_25C7,Y                                  ;   27C2 A7C2 C BE C7 A5        F:042368
  LDY #$0                                         ;   27C5 A7C5 C A0 00           F:042368
B_1_27C7:
  LDA ValidationScoreboardText,Y                                    ;   27C7 A7C7 C B9 DC 07        F:042368
  STA R_0551,X                                    ;   27CA A7CA C 9D 51 05        F:042368
  BEQ B_1_27D3                                    ;   27CD A7CD C F0 04           F:042368
  INX                                             ;   27CF A7CF C E8              F:042368
  INY                                             ;   27D0 A7D0 C C8              F:042368
  BNE B_1_27C7                                    ;   27D1 A7D1 C D0 F4           F:042368
B_1_27D3:
  LDY R_054E                                      ;   27D3 A7D3 C AC 4E 05        F:042368
  LDA IsInFastMoney                                      ;   27D6 A7D6 C AD 43 05        F:042368
  CMP #$1                                         ;   27D9 A7D9 C C9 01           F:042368
  BEQ B_1_2824                                    ;   27DB A7DB C F0 47           F:042368
  LDA R_04B9                                      ;   27DD A7DD . AD B9 04        
  CMP R_0548,Y                                    ;   27E0 A7E0 . D9 48 05        
  BNE B_1_2824                                    ;   27E3 A7E3 . D0 3F           
  LDA #$89                                        ;   27E5 A7E5 . A9 89           
  STA R_05F9                                      ;   27E7 A7E7 . 8D F9 05        
  JSR MoveSpritesOffscreen                                    ;   27EA A7EA . 20 D5 99        
  JSR L_0_06B0                                    ;   27ED A7ED . 20 B0 86        
  LDA #$1                                         ;   27F0 A7F0 . A9 01           
  STA R_0021                                      ;   27F2 A7F2 . 85 21           
  LDA #$3                                         ;   27F4 A7F4 . A9 03           
  JSR L_0_19F7                                    ;   27F6 A7F6 . 20 F7 99        
B_1_27F9:
  JSR $A855                                       ;   27F9 A7F9 . 20 55 A8        
  LDA R_0028                                      ;   27FC A7FC . A5 28           
  BNE B_1_27F9                                    ;   27FE A7FE . D0 F9           
  LDA #$7                                         ;   2800 A800 . A9 07           
  STA R_0021                                      ;   2802 A802 . 85 21           
  JSR $A855                                       ;   2804 A804 . 20 55 A8        
  LDA R_04CF                                      ;   2807 A807 . AD CF 04        
  BNE B_1_280F                                    ;   280A A80A . D0 03           
  JMP $A77E                                       ;   280C A80C . 4C 7E A7        

B_1_280F:
  LDY R_054E                                      ;   280F A80F . AC 4E 05        
  LDA #$0                                         ;   2812 A812 . A9 00           
  LDX $A5C7,Y                                     ;   2814 A814 . BE C7 A5        
  STA R_0551,X                                    ;   2817 A817 . 9D 51 05        
  STA IsInFastMoney,Y                                    ;   281A A81A . 99 43 05        
  LDA #$FF                                        ;   281D A81D . A9 FF           
  STA R_0548,Y                                    ;   281F A81F . 99 48 05        
  BNE B_1_2861                                    ;   2822 A822 . D0 3D           
B_1_2824:
  LDA R_04B9                                      ;   2824 A824 C AD B9 04        F:042368
  STA R_0548,Y                                    ;   2827 A827 C 99 48 05        F:042368
  LDA R_04CF                                      ;   282A A82A C AD CF 04        F:042368
  BEQ B_1_283B                                    ;   282D A82D C F0 0C           F:042368
  BNE B_1_2861                                    ;   282F A82F . D0 30           
L_1_2831:
  LDA #$FF                                        ;   2831 A831 C A9 FF           F:068931
  STA R_0548,Y                                    ;   2833 A833 C 99 48 05        F:068931
  LDA R_04CF                                      ;   2836 A836 C AD CF 04        F:068931
  BNE B_1_2861                                    ;   2839 A839 C D0 26           F:068931
B_1_283B:
  LDA R_054E                                      ;   283B A83B C AD 4E 05        F:042368
  CMP #$5                                         ;   283E A83E C C9 05           F:042368
  BEQ B_1_2871                                    ;   2840 A840 C F0 2F           F:042368
  LDA #$FE                                        ;   2842 A842 C A9 FE           F:042368
  STA R_0550                                      ;   2844 A844 C 8D 50 05        F:042368
  LDA #$0                                         ;   2847 A847 C A9 00           F:042368
  STA R_04E0                                      ;   2849 A849 C 8D E0 04        F:042368
  JSR L_1_2855                                    ;   284C A84C C 20 55 A8        F:042368
  INC R_054E                                      ;   284F A84F C EE 4E 05        F:042369
  JMP L_1_2773                                    ;   2852 A852 C 4C 73 A7        F:042369

L_1_2855:
  LDX R_04E0                                      ;   2855 A855 C AE E0 04        F:041824
  BEQ L_1_2855                                    ;   2858 A858 C F0 FB           F:041824
  DEX                                             ;   285A A85A C CA              F:041824
  STX R_04E0                                      ;   285B A85B C 8E E0 04        F:041824
  JMP L_2_4DBE                                    ;   285E A85E C 4C BE CD        F:041824

B_1_2861:
  LDY R_054E                                      ;   2861 A861 . AC 4E 05        
  LDA #$FF                                        ;   2864 A864 . A9 FF           
  CPY #$5                                         ;   2866 A866 . C0 05           
  BEQ B_1_2871                                    ;   2868 A868 . F0 07           
  INY                                             ;   286A A86A . C8              
  STA R_0548,Y                                    ;   286B A86B . 99 48 05        
  JMP $A866                                       ;   286E A86E . 4C 66 A8        

B_1_2871:
  LDA #$7                                         ;   2871 A871 C A9 07           F:042924
  STA R_0021                                      ;   2873 A873 C 85 21           F:042924
  LDA #$FE                                        ;   2875 A875 C A9 FE           F:042924
  STA R_0550                                      ;   2877 A877 C 8D 50 05        F:042924
  LDA #$2                                         ;   287A A87A C A9 02           F:042924
  JSR L_0_19F7                                    ;   287C A87C C 20 F7 99        F:042924
B_1_287F:
  LDX R_04E0                                      ;   287F A87F C AE E0 04        F:042924
  BEQ B_1_287F                                    ;   2882 A882 C F0 FB           F:042924
  DEX                                             ;   2884 A884 C CA              F:042924
  STX R_04E0                                      ;   2885 A885 C 8E E0 04        F:042924
  LDA R_0028                                      ;   2888 A888 C A5 28           F:042924
  BNE B_1_287F                                    ;   288A A88A C D0 F3           F:042924
  LDY #$1                                         ;   288C A88C C A0 01           F:043044
B_1_288E:
  TYA                                             ;   288E A88E C 98              F:043044
  ASL                                             ;   288F A88F C 0A              F:043044
  TAX                                             ;   2890 A890 C AA              F:043044
  LDA IsInFastMoney,Y                                    ;   2891 A891 C B9 43 05        F:043044
  STA R_0392,X                                    ;   2894 A894 C 9D 92 03        F:043044
  LDA D_1_25C7,Y                                  ;   2897 A897 C B9 C7 A5        F:043044
  STA R_03AB,Y                                    ;   289A A89A C 99 AB 03        F:043044
  TAX                                             ;   289D A89D C AA              F:043044
L_1_289E:
  LDA R_0551,X                                    ;   289E A89E C BD 51 05        F:043044
  STA QuestionAnswerData,X                        ;   28A1 A8A1 C 9D B9 03        F:043044
  BEQ B_1_28AA                                    ;   28A4 A8A4 C F0 04           F:043044
  INX                                             ;   28A6 A8A6 C E8              F:043044
  JMP L_1_289E                                    ;   28A7 A8A7 C 4C 9E A8        F:043044

B_1_28AA:
  INY                                             ;   28AA A8AA C C8              F:043044
  CPY #$6                                         ;   28AB A8AB C C0 06           F:043044
  BNE B_1_288E                                    ;   28AD A8AD C D0 DF           F:043044
  LDX #$FF                                        ;   28AF A8AF C A2 FF           F:043044
  STX R_0391                                      ;   28B1 A8B1 C 8E 91 03        F:043044
  INX                                             ;   28B4 A8B4 C E8              F:043044
  STX R_04E1                                      ;   28B5 A8B5 C 8E E1 04        F:043044
  STX R_04E0                                      ;   28B8 A8B8 C 8E E0 04        F:043044
  STX R_0390                                      ;   28BB A8BB C 8E 90 03        F:043044
  JSR PPUMASKHideSprites                                    ;   28BE A8BE C 20 B2 99        F:043044
  JSR PPUMASKHideBackground                                    ;   28C1 A8C1 C 20 A4 99        F:043044
  JSR PPUCTRLMirrorDisableNMI                                    ;   28C4 A8C4 C 20 E8 CA        F:043044
B_1_28C7:
  LDX R_04E0                                      ;   28C7 A8C7 C AE E0 04        F:043044
  BEQ B_1_28C7                                    ;   28CA A8CA C F0 FB           F:043044
  LDA #$5                                         ;   28CC A8CC C A9 05           F:043045
  STA R_0393                                      ;   28CE A8CE C 8D 93 03        F:043045
  JSR L_0_1D47                                    ;   28D1 A8D1 C 20 47 9D        F:043045
  JSR PPUMASKShowBackground                                    ;   28D4 A8D4 C 20 AB 99        F:043045
  JSR PPUCTRLEnableNMI                                    ;   28D7 A8D7 C 20 EF CA        F:043045
  JSR L_1_2281                                    ;   28DA A8DA C 20 81 A2        F:043045
  LDA ActiveFamily                                ;   28DD A8DD C A5 0B           F:043736
  ASL                                             ;   28DF A8DF C 0A              F:043736
  TAX                                             ;   28E0 A8E0 C AA              F:043736
  LDA QuestionCurrentCash                         ;   28E1 A8E1 C AD C7 04        F:043736
  STA Family1Cash,X                               ;   28E4 A8E4 C 9D C3 04        F:043736
  LDA QuestionCurrentCash+1                       ;   28E7 A8E7 C AD C8 04        F:043736
  STA Family1Cash+1,X                             ;   28EA A8EA C 9D C4 04        F:043736
  INC IsInFastMoney                                      ;   28ED A8ED C EE 43 05        F:043736
  LDA IsInFastMoney                                      ;   28F0 A8F0 C AD 43 05        F:043736
  CMP #$3                                         ;   28F3 A8F3 C C9 03           F:043736
  BEQ @B_1_2915                                    ;   28F5 A8F5 C F0 1E           F:043736
  LDA QuestionCurrentCash+1                       ;   28F7 A8F7 C AD C8 04        F:043736
  BNE @Award5Grand                                    ;   28FA A8FA C D0 4F           F:043736
  LDA QuestionCurrentCash                         ;   28FC A8FC C AD C7 04        F:043736
  CMP #200                                       ;   28FF A8FF C C9 C8           F:043736
  BCS @Award5Grand                                    ;   2901 A901 C B0 48           F:043736
  LDA CurrentFMQuestion2                          ;   2903 A903 C AD 19 03        F:068653
  STA CurrentFMQuestion                           ;   2906 A906 C 8D 1B 03        F:068653
  LDA CurrentFMQuestion2+1                                      ;   2909 A909 C AD 1A 03        F:068653
  STA CurrentFMQuestion+1                                      ;   290C A90C C 8D 1C 03        F:068653
  JSR FindFMQuestionLocationFar                                    ;   290F A90F C 20 E5 AD        F:068653
  JMP L_1_2659                                    ;   2912 A912 C 4C 59 A6        F:068653

@B_1_2915:
  LDA ActiveFamily                                ;   2915 A915 C A5 0B           F:070063
  ASL                                             ;   2917 A917 C 0A              F:070063
  TAX                                             ;   2918 A918 C AA              F:070063
  LDA QuestionCurrentCash+1                       ;   2919 A919 C AD C8 04        F:070063
  STA R_000E                                      ;   291C A91C C 85 0E           F:070063
  BNE @Award5Grand                                    ;   291E A91E C D0 2B           F:070063
  LDA QuestionCurrentCash                         ;   2920 A920 C AD C7 04        F:070063
  CMP #$C8                                        ;   2923 A923 C C9 C8           F:070063
  BCS @Award5Grand                                    ;   2925 A925 C B0 24           F:070063
  ASL                                             ;   2927 A927 C 0A              F:070063
  ROL QuestionCurrentCash+1                       ;   2928 A928 C 2E C8 04        F:070063
  ASL                                             ;   292B A92B C 0A              F:070063
  ROL QuestionCurrentCash+1                       ;   292C A92C C 2E C8 04        F:070063
  CLC                                             ;   292F A92F C 18              F:070063
  ADC QuestionCurrentCash                         ;   2930 A930 C 6D C7 04        F:070063
  STA QuestionCurrentCash                         ;   2933 A933 C 8D C7 04        F:070063
  STA Family1Cash,X                               ;   2936 A936 C 9D C3 04        F:070063
  STA R_001C                                      ;   2939 A939 C 85 1C           F:070063
  LDA QuestionCurrentCash+1                       ;   293B A93B C AD C8 04        F:070063
  ADC R_000E                                      ;   293E A93E C 65 0E           F:070063
  STA QuestionCurrentCash+1                       ;   2940 A940 C 8D C8 04        F:070063
  STA Family1Cash+1,X                             ;   2943 A943 C 9D C4 04        F:070063
  STA R_001D                                      ;   2946 A946 C 85 1D           F:070063
  JMP L_1_2965                                    ;   2948 A948 C 4C 65 A9        F:070063

@Award5Grand:
  LDA QuestionCurrentCash                         ;   294B A94B C AD C7 04        F:043736
  STA R_001C                                      ;   294E A94E C 85 1C           F:043736
  LDA QuestionCurrentCash+1                       ;   2950 A950 C AD C8 04        F:043736
  STA R_001D                                      ;   2953 A953 C 85 1D           F:043736
  lda     #<5000
  STA QuestionCurrentCash                         ;   2957 A957 C 8D C7 04        F:043736
  STA Family1Cash,X                               ;   295A A95A C 9D C3 04        F:043736
  lda     #>5000
  STA QuestionCurrentCash+1                       ;   295F A95F C 8D C8 04        F:043736
  STA Family1Cash+1,X                             ;   2962 A962 C 9D C4 04        F:043736
L_1_2965:
  LDA #$8A                                        ;   2965 A965 C A9 8A           F:043736
  STA R_05F9                                      ;   2967 A967 C 8D F9 05        F:043736
  LDA ActiveFamily2                               ;   296A A96A C A5 08           F:043736
  BMI B_1_2988                                    ;   296C A96C C 30 1A           F:043736
  CMP ActiveFamily                                ;   296E A96E C C5 0B           F:070063
  BNE B_1_2988                                    ;   2970 A970 C D0 16           F:070063
  CLC                                             ;   2972 A972 C 18              F:070063
  LDA Family1Cash,X                               ;   2973 A973 C BD C3 04        F:070063
  ADC R_0313                                      ;   2976 A976 C 6D 13 03        F:070063
  STA R_0313                                      ;   2979 A979 C 8D 13 03        F:070063
  LDA Family1Cash+1,X                             ;   297C A97C C BD C4 04        F:070063
  ADC R_0314                                      ;   297F A97F C 6D 14 03        F:070063
  STA R_0314                                      ;   2982 A982 C 8D 14 03        F:070063
  JMP L_1_2998                                    ;   2985 A985 C 4C 98 A9        F:070063

B_1_2988:
  LDA Family1Cash,X                               ;   2988 A988 C BD C3 04        F:043736
  STA R_0313                                      ;   298B A98B C 8D 13 03        F:043736
  LDA Family1Cash+1,X                             ;   298E A98E C BD C4 04        F:043736
  STA R_0314                                      ;   2991 A991 C 8D 14 03        F:043736
  LDA ActiveFamily                                ;   2994 A994 C A5 0B           F:043736
  STA ActiveFamily2                               ;   2996 A996 C 85 08           F:043736
L_1_2998:
  JSR B_0_1F40                                    ;   2998 A998 C 20 40 9F        F:043736
  LDA #$FF                                        ;   299B A99B C A9 FF           F:043736
  STA SpriteUpdateFlags                           ;   299D A99D C 85 2D           F:043736
  LDA ActiveFamily                                ;   299F A99F C A5 0B           F:043736
  ASL                                             ;   29A1 A9A1 C 0A              F:043736
  TAX                                             ;   29A2 A9A2 C AA              F:043736
  LDA R_001C                                      ;   29A3 A9A3 C A5 1C           F:043736
  STA QuestionCurrentCash                         ;   29A5 A9A5 C 8D C7 04        F:043736
  STA Family1Cash,X                               ;   29A8 A9A8 C 9D C3 04        F:043736
  LDA R_001D                                      ;   29AB A9AB C A5 1D           F:043736
  STA QuestionCurrentCash+1                       ;   29AD A9AD C 8D C8 04        F:043736
  STA Family1Cash+1,X                             ;   29B0 A9B0 C 9D C4 04        F:043736
  LDA #$3                                         ;   29B3 A9B3 C A9 03           F:043736
  JSR L_0_19F7                                    ;   29B5 A9B5 C 20 F7 99        F:043736
B_1_29B8:
  JSR DelayUntilNMI                                    ;   29B8 A9B8 C 20 F9 CA        F:043736
  JSR SoundSystemUpdate                                    ;   29BB A9BB C 20 96 BA        F:043737
  LDA R_0028                                      ;   29BE A9BE C A5 28           F:043737
  BNE B_1_29B8                                    ;   29C0 A9C0 C D0 F6           F:043737
B_1_29C2:
  RTS                                             ;   29C2 A9C2 C 60              F:043917

L_1_29C3:
  LDA #$FF                                        ;   29C3 A9C3 C A9 FF           F:042369
  STA R_0550                                      ;   29C5 A9C5 C 8D 50 05        F:042369
  LDA R_054E                                      ;   29C8 A9C8 C AD 4E 05        F:042369
  CMP #$1                                         ;   29CB A9CB C C9 01           F:042369
  BEQ B_1_29C2                                    ;   29CD A9CD C F0 F3           F:042369
  SBC #$2                                         ;   29CF A9CF C E9 02           F:042369
  TAY                                             ;   29D1 A9D1 C A8              F:042369
  ASL                                             ;   29D2 A9D2 C 0A              F:042369
  TAX                                             ;   29D3 A9D3 C AA              F:042369
  LDA D_2_4FBD,X                                  ;   29D4 A9D4 C BD BD CF        F:042369
  STA PpuAddr_2006                                ;   29D7 A9D7 C 8D 06 20        F:042369
  LDA D_2_4FBC,X                                  ;   29DA A9DA C BD BC CF        F:042369
  STA PpuAddr_2006                                ;   29DD A9DD C 8D 06 20        F:042369
  TYA                                             ;   29E0 A9E0 C 98              F:042369
  CLC                                             ;   29E1 A9E1 C 18              F:042369
  ADC #$31                                        ;   29E2 A9E2 C 69 31           F:042369
  TAX                                             ;   29E4 A9E4 C AA              F:042369
  LDA PaletteData18_2,X                                  ;   29E5 A9E5 C BD AD A5        F:042369
  STA PpuData_2007                                ;   29E8 A9E8 C 8D 07 20        F:042369
  LDA PpuData_2007                                ;   29EB A9EB C AD 07 20        F:042369
  LDX D_1_25C8,Y                                  ;   29EE A9EE C BE C8 A5        F:042369
B_1_29F1:
  LDY R_0551,X                                    ;   29F1 A9F1 C BC 51 05        F:042369
  BEQ B_1_29FF                                    ;   29F4 A9F4 C F0 09           F:042369
  LDA PaletteData18_2,Y                                  ;   29F6 A9F6 C B9 AD A5        F:042369
  STA PpuData_2007                                ;   29F9 A9F9 C 8D 07 20        F:042369
  INX                                             ;   29FC A9FC C E8              F:042369
  BNE B_1_29F1                                    ;   29FD A9FD C D0 F2           F:042369
B_1_29FF:
  LDA R_04B9                                      ;   29FF A9FF C AD B9 04        F:042369
  TAY                                             ;   2A02 AA02 C A8              F:042369
  ASL                                             ;   2A03 AA03 C 0A              F:042369
  TAX                                             ;   2A04 AA04 C AA              F:042369
  LDA R_0394,X                                    ;   2A05 AA05 C BD 94 03        F:042369
  LDX QuestionAnswerOffsets,Y                     ;   2A08 AA08 C BE AC 03        F:042369
  LDY R_054E                                      ;   2A0B AA0B C AC 4E 05        F:042369
  STA R_0542,Y                                    ;   2A0E AA0E C 99 42 05        F:042369
  LDA #$0                                         ;   2A11 AA11 C A9 00           F:042369
  STA R_0382,Y                                    ;   2A13 AA13 C 99 82 03        F:042369
  LDA D_1_25C6,Y                                  ;   2A16 AA16 C B9 C6 A5        F:042369
  STA R_000E                                      ;   2A19 AA19 C 85 0E           F:042369
  LDA R_0547,Y                                    ;   2A1B AA1B C B9 47 05        F:042369
  BPL B_1_2A25                                    ;   2A1E AA1E C 10 05           F:042369
  LDA #$0                                         ;   2A20 AA20 C A9 00           F:068932
  STA R_0542,Y                                    ;   2A22 AA22 C 99 42 05        F:068932
B_1_2A25:
  LDY R_000E                                      ;   2A25 AA25 C A4 0E           F:042369
  DEY                                             ;   2A27 AA27 C 88              F:042369
  LDX #$FF                                        ;   2A28 AA28 C A2 FF           F:042369
B_1_2A2A:
  CPX #$A                                         ;   2A2A AA2A C E0 0A           F:042369
  BEQ B_1_2A36                                    ;   2A2C AA2C C F0 08           F:042369
  INX                                             ;   2A2E AA2E C E8              F:042369
  INY                                             ;   2A2F AA2F C C8              F:042369
  LDA R_0551,Y                                    ;   2A30 AA30 C B9 51 05        F:042369
  BNE B_1_2A2A                                    ;   2A33 AA33 C D0 F5           F:042369
  RTS                                             ;   2A35 AA35 C 60              F:042369

B_1_2A36:
  LDA #$0                                         ;   2A36 AA36 . A9 00           
  STA R_0552,Y                                    ;   2A38 AA38 . 99 52 05        
  RTS                                             ;   2A3B AA3B . 60              


BCDReadLocations:
.addr Family1Cash
.addr Family2Cash
.addr QuestionCurrentCash
.addr $0394
.addr $0396
.addr $0398
.addr $039A
.addr $039C
.addr $039E
.addr $03A0
.addr $03A2
.addr $03A4
.addr $03A6
.addr $03A8
.addr $03AA
.addr CurrentRoundNumber
.addr $0313

BCDConverter:
        @CurrentOffset = $11
        @TempReadLocation = $12
        @Temp = $16
        @InLeadingZeroes = $19
        ; use input value as offset into BCDReadLocations
        asl a
        tax
        lda #$00
        sta @InLeadingZeroes
        ; find location to read from
        lda BCDReadLocations,x
        sta @TempReadLocation
        lda BCDReadLocations+1,x
        sta @TempReadLocation+1
        ; read two bytes from source
        ldy #$00
        lda (@TempReadLocation),y
        sta @Temp
        iny
        lda (@TempReadLocation),y
        sta @Temp+1
        ldy #$00
        sty @CurrentOffset
@ReadNext:
        ldx #$00
@Continue:
        ; subtract the next decimal point as far as we can
        ; first time this will subtract 10000 per loop, then 1000 etc..
        lda @Temp
        sec
        sbc @DecimalValues,y
        sta @Temp
        lda @Temp+1
        sbc @DecimalValues+1,y
        bcc @Done
        sta @Temp+1
        inx
        jmp @Continue
@Done:
        ; X is now equal to value / 10000 (or 1000, 100, 10)
        ; add back the last value we subtracted
        lda @Temp
        adc @DecimalValues,y
        sta @Temp
        txa
        ; we for some reason set these bits..
        ora #$30
        ; then save the result
        jsr @StoreNextBCDOutput
        ; and skip ahead to the next decimal value
        iny
        iny
        cpy #$08
        ; go back to division unless we've reached the end
        bcc @ReadNext
        ; 
        lda @Temp
        ora #$30
        jsr @StoreNextBCDOutput
        lda BCDOutput+4
        ; if the total value was 0, write a trailing 0 instead of space.
        cmp #$20
        bne @Exit
        lda #$30
        sta BCDOutput+4
@Exit:
        rts
@DecimalValues:
        .word 10000
        .word  1000
        .word   100
        .word    10
@StoreNextBCDOutput:
        @TempYValue = $15
        sty @TempYValue
        cmp #$30
        beq @WriteLeadingSpaceIfNeeded
        ; don't writing spaces on zeroes
        sta @InLeadingZeroes
@Store:
        ldy @CurrentOffset
        sta BCDOutput,y
        inc @CurrentOffset
        ldy @TempYValue
        rts
@WriteLeadingSpaceIfNeeded:
        ldy @InLeadingZeroes
        bne @Store
        ; write space instead of 0
        lda #$20
        jmp @Store

D_1_2ADE:
.byte "Out of 100 people surveyed the top    answers are on the boar", 'd' | $80

L_1_2B1C:
  LDX #$FF                                        ;   2B1C AB1C C A2 FF           F:008272
B_1_2B1E:
  INX                                             ;   2B1E AB1E C E8              F:008272
  LDA D_1_2ADE,X                                  ;   2B1F AB1F C BD DE AA        F:008272
  STA R_0048,X                                    ;   2B22 AB22 C 95 48           F:008272
  BPL B_1_2B1E                                    ;   2B24 AB24 C 10 F8           F:008272
  LDA R_0393                                      ;   2B26 AB26 C AD 93 03        F:008272
  AND #$F                                         ;   2B29 AB29 C 29 0F           F:008272
  CMP #$A                                         ;   2B2B AB2B C C9 0A           F:008272
  BCC B_1_2B36                                    ;   2B2D AB2D C 90 07           F:008272
  LDX #$31                                        ;   2B2F AB2F C A2 31           F:012833
  STX R_006B                                      ;   2B31 AB31 C 86 6B           F:012833
  SBC #$A                                         ;   2B33 AB33 C E9 0A           F:012833
  CLC                                             ;   2B35 AB35 C 18              F:012833
B_1_2B36:
  ADC #$30                                        ;   2B36 AB36 C 69 30           F:008272
  STA R_006C                                      ;   2B38 AB38 C 85 6C           F:008272
  LDX #$0                                         ;   2B3A AB3A C A2 00           F:008272
  LDY #$48                                        ;   2B3C AB3C C A0 48           F:008272
  JSR PrepareQuestionText                                    ;   2B3E AB3E C 20 2C 87        F:008272
  JSR DrawQuestionText                                    ;   2B41 AB41 C 20 C4 87        F:008273
  JSR L_0_1A0B                                    ;   2B44 AB44 C 20 0B 9A        F:008273
  LDA #$3                                         ;   2B47 AB47 C A9 03           F:008273
  JSR L_0_19F7                                    ;   2B49 AB49 C 20 F7 99        F:008273
  LDA #$1                                         ;   2B4C AB4C C A9 01           F:008273
  STA PaletteDirtyFlag                            ;   2B4E AB4E C 8D 3D 03        F:008273
  JSR PPUMASKShowSprites                                    ;   2B51 AB51 C 20 B9 99        F:008273
  JSR PPUMASKShowBackground                                    ;   2B54 AB54 C 20 AB 99        F:008273
  JSR PPUCTRLEnableNMI                                    ;   2B57 AB57 C 20 EF CA        F:008273
B_1_2B5A:
  LDA PaletteDirtyFlagPending                     ;   2B5A AB5A C AD 41 03        F:008273
  STA PaletteDirtyFlag                            ;   2B5D AB5D C 8D 3D 03        F:008273
  JSR DelayUntilNMI                                    ;   2B60 AB60 C 20 F9 CA        F:008273
  JSR SoundSystemUpdate                                    ;   2B63 AB63 C 20 96 BA        F:008274
  JSR SetFamilyCHRBanks                                    ;   2B66 AB66 C 20 01 87        F:008274
  JSR L_1_390B                                    ;   2B69 AB69 C 20 0B B9        F:008274
  JSR L_0_1A7E                                    ;   2B6C AB6C C 20 7E 9A        F:008274
  LDA R_0028                                      ;   2B6F AB6F C A5 28           F:008274
  BNE B_1_2B5A                                    ;   2B71 AB71 C D0 E7           F:008274
  LDA ActiveScene                                 ;   2B73 AB73 C AD D3 04        F:008466
  PHA                                             ;   2B76 AB76 C 48              F:008466
  LDA #$FF                                        ;   2B77 AB77 C A9 FF           F:008466
  STA ActiveScene                                 ;   2B79 AB79 C 8D D3 04        F:008466
  LDA #$5                                         ;   2B7C AB7C C A9 05           F:008466
  JSR SetNMIRoutine                                    ;   2B7E AB7E C 20 C7 CA        F:008466
  LDA #$1                                         ;   2B81 AB81 C A9 01           F:008466
  LDX #$2                                         ;   2B83 AB83 C A2 02           F:008466
  LDY #$0                                         ;   2B85 AB85 C A0 00           F:008466
  JSR L_2_4B00                                    ;   2B87 AB87 C 20 00 CB        F:008466
  JSR DelayUntilNMI                                    ;   2B8A AB8A C 20 F9 CA        F:008466
  LDA #$2                                         ;   2B8D AB8D C A9 02           F:008467
  JSR L_0_19F7                                    ;   2B8F AB8F C 20 F7 99        F:008467
B_1_2B92:
  JSR DelayUntilNMI                                    ;   2B92 AB92 C 20 F9 CA        F:008467
  LDA R_0028                                      ;   2B95 AB95 C A5 28           F:008468
  BNE B_1_2B92                                    ;   2B97 AB97 C D0 F9           F:008468
  LDA #$1                                         ;   2B99 AB99 C A9 01           F:008587
  STA PaletteDirtyFlag                            ;   2B9B AB9B C 8D 3D 03        F:008587
  LDA #$3                                         ;   2B9E AB9E C A9 03           F:008587
  JSR SetNMIRoutine                                    ;   2BA0 ABA0 C 20 C7 CA        F:008587
  LDX a:ActiveFamily                              ;   2BA3 ABA3 C AE 0B 00        F:008587
  LDY Family1,X                                   ;   2BA6 ABA6 C BC 15 03        F:008587
  LDX D_1_34EA,Y                                  ;   2BA9 ABA9 C BE EA B4        F:008587
  LDA #$0                                         ;   2BAC ABAC C A9 00           F:008587
  LDY #$1                                         ;   2BAE ABAE C A0 01           F:008587
  JSR L_2_4B00                                    ;   2BB0 ABB0 C 20 00 CB        F:008587
  PLA                                             ;   2BB3 ABB3 C 68              F:008587
  STA ActiveScene                                 ;   2BB4 ABB4 C 8D D3 04        F:008587
  JMP DelayUntilNMI                                    ;   2BB7 ABB7 C 4C F9 CA        F:008587

L_1_2BBA:
  LDY #$A                                         ;   2BBA ABBA C A0 0A           F:008589
B_1_2BBC:
  LDX #$F                                         ;   2BBC ABBC C A2 0F           F:008589
  CLC                                             ;   2BBE ABBE C 18              F:008589
  LDA D_0_0CFA,Y                                  ;   2BBF ABBF C B9 FA 8C        F:008589
  ADC #$1                                         ;   2BC2 ABC2 C 69 01           F:008589
  PHA                                             ;   2BC4 ABC4 C 48              F:008589
  LDA D_0_0CFB,Y                                  ;   2BC5 ABC5 C B9 FB 8C        F:008589
  ADC #$0                                         ;   2BC8 ABC8 C 69 00           F:008589
  STA PpuAddr_2006                                ;   2BCA ABCA C 8D 06 20        F:008589
  PLA                                             ;   2BCD ABCD C 68              F:008589
  STA PpuAddr_2006                                ;   2BCE ABCE C 8D 06 20        F:008589
  LDA #$1                                         ;   2BD1 ABD1 C A9 01           F:008589
B_1_2BD3:
  STA PpuData_2007                                ;   2BD3 ABD3 C 8D 07 20        F:008589
  DEX                                             ;   2BD6 ABD6 C CA              F:008589
  BPL B_1_2BD3                                    ;   2BD7 ABD7 C 10 FA           F:008589
  DEY                                             ;   2BD9 ABD9 C 88              F:008589
  DEY                                             ;   2BDA ABDA C 88              F:008589
  BPL B_1_2BBC                                    ;   2BDB ABDB C 10 DF           F:008589
  RTS                                             ;   2BDD ABDD C 60              F:008589

L_1_2BDE:
  JSR AdvanceQuestion                                    ;   2BDE ABDE C 20 84 AE        F:008272
  JSR L_1_2F0E                                    ;   2BE1 ABE1 C 20 0E AF        F:008272
  JSR L_1_2CAF                                    ;   2BE4 ABE4 C 20 AF AC        F:008272
@WaitForLoad:
  JSR LoadQuestionFromCHR                                    ;   2BE7 ABE7 C 20 8C AF        F:008272
  LDA QuestionIsLoading                           ;   2BEA ABEA C AD 7B 03        F:008272
  BNE @WaitForLoad                                    ;   2BED ABED C D0 F8           F:008272
  JSR L_1_3031                                    ;   2BEF ABEF C 20 31 B0        F:008272
  JSR L_1_30C3                                    ;   2BF2 ABF2 C 20 C3 B0        F:008272
  JSR L_0_1D47                                    ;   2BF5 ABF5 C 20 47 9D        F:008272
  JSR L_1_2B1C                                    ;   2BF8 ABF8 C 20 1C AB        F:008272
  JSR SoundSystemUpdate                                    ;   2BFB ABFB C 20 96 BA        F:008588
  JSR SetFamilyCHRBanks                                    ;   2BFE ABFE C 20 01 87        F:008588
  JSR L_1_390B                                    ;   2C01 AC01 C 20 0B B9        F:008588
  LDA #$6                                         ;   2C04 AC04 C A9 06           F:008588
  STA R_04D6                                      ;   2C06 AC06 C 8D D6 04        F:008588
  JSR DelayUntilNMI                                    ;   2C09 AC09 C 20 F9 CA        F:008588
  JSR SoundSystemUpdate                                    ;   2C0C AC0C C 20 96 BA        F:008589
  JSR SetFamilyCHRBanks                                    ;   2C0F AC0F C 20 01 87        F:008589
  JSR L_1_390B                                    ;   2C12 AC12 C 20 0B B9        F:008589
  LDX #$1                                         ;   2C15 AC15 C A2 01           F:008589
  LDY #$0                                         ;   2C17 AC17 C A0 00           F:008589
  JSR PrepareQuestionText                                    ;   2C19 AC19 C 20 2C 87        F:008589
  LDA #$8                                         ;   2C1C AC1C C A9 08           F:008589
  STA R_04D6                                      ;   2C1E AC1E C 8D D6 04        F:008589
  JSR DelayUntilNMI                                    ;   2C21 AC21 C 20 F9 CA        F:008589
  JSR SoundSystemUpdate                                    ;   2C24 AC24 C 20 96 BA        F:008590
  JSR SetFamilyCHRBanks                                    ;   2C27 AC27 C 20 01 87        F:008590
  JSR L_1_390B                                    ;   2C2A AC2A C 20 0B B9        F:008590
  JMP L_1_2C9B                                    ;   2C2D AC2D C 4C 9B AC        F:008590

L_1_2C30:
  LDA #$5                                         ;   2C30 AC30 C A9 05           F:041824
  STA R_04D6                                      ;   2C32 AC32 C 8D D6 04        F:041824
  JSR L_1_2855                                    ;   2C35 AC35 C 20 55 A8        F:041824
  LDA #$6                                         ;   2C38 AC38 C A9 06           F:041824
  STA R_04D6                                      ;   2C3A AC3A C 8D D6 04        F:041824
  JSR L_1_2855                                    ;   2C3D AC3D C 20 55 A8        F:041824
  JSR AdvanceQuestion                                    ;   2C40 AC40 C 20 84 AE        F:041825
  LDA CurrentFMQuestion                           ;   2C43 AC43 C AD 1B 03        F:041825
  STA CurrentQuestion                             ;   2C46 AC46 C 8D 17 03        F:041825
  LDA CurrentFMQuestion+1                                      ;   2C49 AC49 C AD 1C 03        F:041825
  STA R_0318                                      ;   2C4C AC4C C 8D 18 03        F:041825
  JSR L_1_2F0E                                    ;   2C4F AC4F C 20 0E AF        F:041825
  JSR L_1_2CAF                                    ;   2C52 AC52 C 20 AF AC        F:041825
  LDA #$1                                         ;   2C55 AC55 C A9 01           F:041825
  STA SpriteUpdateFlags                           ;   2C57 AC57 C 85 2D           F:041825
B_1_2C59:
  LDA #$7                                         ;   2C59 AC59 C A9 07           F:041825
  STA R_04D6                                      ;   2C5B AC5B C 8D D6 04        F:041825
  JSR L_1_2855                                    ;   2C5E AC5E C 20 55 A8        F:041825
  LDA QuestionIsLoading                           ;   2C61 AC61 C AD 7B 03        F:041826
  BNE B_1_2C59                                    ;   2C64 AC64 C D0 F3           F:041826
  LDA #$0                                         ;   2C66 AC66 C A9 00           F:041830
  STA SpriteUpdateFlags                           ;   2C68 AC68 C 85 2D           F:041830
  JSR L_1_3031                                    ;   2C6A AC6A C 20 31 B0        F:041830
  JSR L_1_2855                                    ;   2C6D AC6D C 20 55 A8        F:041830
  JSR L_1_30C3                                    ;   2C70 AC70 C 20 C3 B0        F:041831
  JSR L_1_2855                                    ;   2C73 AC73 C 20 55 A8        F:041837
  LDX #$1                                         ;   2C76 AC76 C A2 01           F:041838
  LDY #$0                                         ;   2C78 AC78 C A0 00           F:041838
  JSR PrepareQuestionText                                    ;   2C7A AC7A C 20 2C 87        F:041838
  LDA #$8                                         ;   2C7D AC7D C A9 08           F:041838
  STA R_04D6                                      ;   2C7F AC7F C 8D D6 04        F:041838
  JSR L_1_2855                                    ;   2C82 AC82 C 20 55 A8        F:041838
  JSR L_1_2C9B                                    ;   2C85 AC85 C 20 9B AC        F:041839
  LDA #$2                                         ;   2C88 AC88 C A9 02           F:041839
  STA R_04D6                                      ;   2C8A AC8A C 8D D6 04        F:041839
  JSR L_1_2855                                    ;   2C8D AC8D C 20 55 A8        F:041839
  JSR L_0_05D6                                    ;   2C90 AC90 C 20 D6 85        F:041840
  LDA #$3                                         ;   2C93 AC93 C A9 03           F:041840
  STA R_04D6                                      ;   2C95 AC95 C 8D D6 04        F:041840
  JMP L_1_2855                                    ;   2C98 AC98 C 4C 55 A8        F:041840

L_1_2C9B:
  LDY #$0                                         ;   2C9B AC9B C A0 00           F:008590
  LDA QuestionAnswerData                          ;   2C9D AC9D C AD B9 03        F:008590
  AND #$7F                                        ;   2CA0 ACA0 C 29 7F           F:008590
  CMP #$30                                        ;   2CA2 ACA2 C C9 30           F:008590
  BCC B_1_2CAB                                    ;   2CA4 ACA4 C 90 05           F:008590
  CMP #$3A                                        ;   2CA6 ACA6 C C9 3A           F:008590
  BCS B_1_2CAB                                    ;   2CA8 ACA8 C B0 01           F:008590
  INY                                             ;   2CAA ACAA C C8              F:013151
B_1_2CAB:
  STY R_0372                                      ;   2CAB ACAB C 8C 72 03        F:008590
  RTS                                             ;   2CAE ACAE C 60              F:008590

L_1_2CAF:
  LDX #$B                                         ;   2CAF ACAF C A2 0B           F:008272
  LDA #$FF                                        ;   2CB1 ACB1 C A9 FF           F:008272
B_1_2CB3:
  STA QuestionAnswerOffsets,X                     ;   2CB3 ACB3 C 9D AC 03        F:008272
  DEX                                             ;   2CB6 ACB6 C CA              F:008272
  BNE B_1_2CB3                                    ;   2CB7 ACB7 C D0 FA           F:008272
  STX QuestionAnswerOffsets                       ;   2CB9 ACB9 C 8E AC 03        F:008272
  RTS                                             ;   2CBC ACBC C 60              F:008272

D_1_2CBD:
.byte $40,$41,$42,$43,$44,$45                     ;   2CBD ACBD DDDDDD   @ABCDE   F:008272
.byte $46                                         ;   2CC3 ACC3 D        F        F:017055
.byte $47                                         ;   2CC4 ACC4 D        G        F:012833
.byte $48,$49                                     ;   2CC5 ACC5 DD       HI       F:008272
.byte $4A                                         ;   2CC7 ACC7 D        J        F:038594
.byte $4B                                         ;   2CC8 ACC8 D        K        F:023709
.byte $4C,$4D,$4E,$4F                             ;   2CC9 ACC9 DDDD     LMNO     F:008272
.byte $50                                         ;   2CCD ACCD D        P        F:017055
.byte $51                                         ;   2CCE ACCE D        Q        F:042705
.byte $52,$53,$54,$55                             ;   2CCF ACCF DDDD     RSTU     F:008272
.byte $56                                         ;   2CD3 ACD3 D        V        F:012833
.byte $57,$58                                     ;   2CD4 ACD4 DD       WX       F:008272
.byte $59                                         ;   2CD6 ACD6 D        Y        F:012833
.byte $5A                                         ;   2CD7 ACD7 .        Z        
.byte $20                                         ;   2CD8 ACD8 D                 F:008272
.byte $20,$7C                                     ;   2CD9 ACD9 ..        |       
.byte $7C                                         ;   2CDB ACDB D        |        F:008272
.byte $7C                                         ;   2CDC ACDC D        |        F:012833
.byte $40,$61,$62,$63,$64,$65,$66,$67             ;   2CDD ACDD ........ @abcdefg 
.byte $68,$69,$6A,$6B,$6C,$6D,$6E,$6F             ;   2CE5 ACE5 ........ hijklmno 
.byte $70,$71,$72,$73,$74,$75,$76,$77             ;   2CED ACED ........ pqrstuvw 
.byte $78,$79,$7A,$20,$20,$20,$20,$20             ;   2CF5 ACF5 ........ xyz      
D_1_2CFD:
.byte $40,$30,$31,$32,$33,$34,$35                 ;   2CFD ACFD DDDDDDD  @012345  F:012833
.byte $36                                         ;   2D04 AD04 D        6        F:042585
.byte $37,$38                                     ;   2D05 AD05 DD       78       F:012833
.byte $39                                         ;   2D07 AD07 .        9        
.byte $2F                                         ;   2D08 AD08 D        /        F:008272
.byte $27,$28                                     ;   2D09 AD09 DD       '(       F:017055
.byte $29                                         ;   2D0B AD0B D        )        F:017056
.byte $2B,$2A                                     ;   2D0C AD0C DD       +*       F:008272
.byte $5B,$5D                                     ;   2D0E AD0E DD       []       F:017055
.byte $2D,$26,$20,$20,$20,$20,$20,$20             ;   2D10 AD10 ........ -&       
.byte $20,$20,$20,$20,$20                         ;   2D18 AD18 .....             
D_1_2D1D:
.byte $1F,$3E,$7C,$F8,$F0,$E0,$C0,$80             ;   2D1D AD1D DDDDDDDD ?>|????? F:008272
L_1_2D25:
  LDX R_0381                                      ;   2D25 AD25 C AE 81 03        F:008272
  LDA AnswerScratchSpace,X                        ;   2D28 AD28 C BD B9 06        F:008272
  LDY R_0380                                      ;   2D2B AD2B C AC 80 03        F:008272
  AND D_1_2D1D,Y                                  ;   2D2E AD2E C 39 1D AD        F:008272
  CPY #$0                                         ;   2D31 AD31 C C0 00           F:008272
  BEQ B_1_2D3F                                    ;   2D33 AD33 C F0 0A           F:008272
  CPY #$4                                         ;   2D35 AD35 C C0 04           F:008272
  BCS B_1_2D82                                    ;   2D37 AD37 C B0 49           F:008272
B_1_2D39:
  LSR                                             ;   2D39 AD39 C 4A              F:008272
  DEY                                             ;   2D3A AD3A C 88              F:008272
  BNE B_1_2D39                                    ;   2D3B AD3B C D0 FC           F:008272
L_1_2D3D:
  AND #$1F                                        ;   2D3D AD3D C 29 1F           F:008272
B_1_2D3F:
  TAY                                             ;   2D3F AD3F C A8              F:008272
  LDA R_0380                                      ;   2D40 AD40 C AD 80 03        F:008272
  CMP #$3                                         ;   2D43 AD43 C C9 03           F:008272
  BCC B_1_2D4B                                    ;   2D45 AD45 C 90 04           F:008272
  INC R_0381                                      ;   2D47 AD47 C EE 81 03        F:008272
  CLC                                             ;   2D4A AD4A C 18              F:008272
B_1_2D4B:
  ADC #$5                                         ;   2D4B AD4B C 69 05           F:008272
  AND #$7                                         ;   2D4D AD4D C 29 07           F:008272
  STA R_0380                                      ;   2D4F AD4F C 8D 80 03        F:008272
  LDA R_0382                                      ;   2D52 AD52 C AD 82 03        F:008272
  BEQ B_1_2D6F                                    ;   2D55 AD55 C F0 18           F:008272
  CMP #$1D                                        ;   2D57 AD57 C C9 1D           F:008272
  BEQ B_1_2D69                                    ;   2D59 AD59 C F0 0E           F:008272
  CMP #$1E                                        ;   2D5B AD5B C C9 1E           F:008272
  BEQ B_1_2D63                                    ;   2D5D AD5D C F0 04           F:008272
  LDA D_1_2CFD,Y                                  ;   2D5F AD5F C B9 FD AC        F:012833
  RTS                                             ;   2D62 AD62 C 60              F:012833

B_1_2D63:
  LDA D_1_2CFD,Y                                  ;   2D63 AD63 C B9 FD AC        F:008272
  JMP L_1_2D7C                                    ;   2D66 AD66 C 4C 7C AD        F:008272

B_1_2D69:
  LDA $ACDD,Y                                     ;   2D69 AD69 . B9 DD AC        
  JMP $AD7C                                       ;   2D6C AD6C . 4C 7C AD        

B_1_2D6F:
  LDA D_1_2CBD,Y                                  ;   2D6F AD6F C B9 BD AC        F:008272
  CMP #$7C                                        ;   2D72 AD72 C C9 7C           F:008272
  BNE L_1_2D7C                                    ;   2D74 AD74 C D0 06           F:008272
  STY R_0382                                      ;   2D76 AD76 C 8C 82 03        F:008272
  JMP L_1_2D25                                    ;   2D79 AD79 C 4C 25 AD        F:008272

L_1_2D7C:
  LDY #$0                                         ;   2D7C AD7C C A0 00           F:008272
  STY R_0382                                      ;   2D7E AD7E C 8C 82 03        F:008272
  RTS                                             ;   2D81 AD81 C 60              F:008272

B_1_2D82:
  STA QuestionAdvanceCount                        ;   2D82 AD82 C 8D 7F 03        F:008272
  TYA                                             ;   2D85 AD85 C 98              F:008272
  ADC #$4                                         ;   2D86 AD86 C 69 04           F:008272
  AND #$7                                         ;   2D88 AD88 C 29 07           F:008272
  TAY                                             ;   2D8A AD8A C A8              F:008272
  LDX R_0381                                      ;   2D8B AD8B C AE 81 03        F:008272
  INX                                             ;   2D8E AD8E C E8              F:008272
  LDA AnswerScratchSpace,X                        ;   2D8F AD8F C BD B9 06        F:008272
B_1_2D92:
  LSR                                             ;   2D92 AD92 C 4A              F:008272
  ROR QuestionAdvanceCount                        ;   2D93 AD93 C 6E 7F 03        F:008272
  DEY                                             ;   2D96 AD96 C 88              F:008272
  BNE B_1_2D92                                    ;   2D97 AD97 C D0 F9           F:008272
  LDY #$5                                         ;   2D99 AD99 C A0 05           F:008272
B_1_2D9B:
  ASL QuestionAdvanceCount                        ;   2D9B AD9B C 0E 7F 03        F:008272
  ROL                                             ;   2D9E AD9E C 2A              F:008272
  DEY                                             ;   2D9F AD9F C 88              F:008272
  BNE B_1_2D9B                                    ;   2DA0 ADA0 C D0 F9           F:008272
  JMP L_1_2D3D                                    ;   2DA2 ADA2 C 4C 3D AD        F:008272

FindQuestionLocationFar:
  LDY #$0                                         ;   2DA5 ADA5 C A0 00           F:006100
  STY QuestionAbsoluteLocation                    ;   2DA7 ADA7 C 8C A3 05        F:006100
  STY QuestionAbsoluteLocation+1                                      ;   2DAA ADAA C 8C A4 05        F:006100
  LDA R_0318                                      ;   2DAD ADAD C AD 18 03        F:006100
  STA R_0010                                      ;   2DB0 ADB0 C 85 10           F:006100
  ORA CurrentQuestion                             ;   2DB2 ADB2 C 0D 17 03        F:006100
  BEQ B_1_2DE4                                    ;   2DB5 ADB5 C F0 2D           F:006100
  LDX CurrentQuestion                             ;   2DB7 ADB7 C AE 17 03        F:006100
  LDA #<QuestionDataLength                                       ;   2DBA ADBA C A9 32           F:006100
  STA R_000E                                      ;   2DBC ADBC C 85 0E           F:006100
  LDA #>QuestionDataLength                                       ;   2DBE ADBE C A9 B1           F:006100
  STA R_000F                                      ;   2DC0 ADC0 C 85 0F           F:006100
B_1_2DC2:
  INY                                             ;   2DC2 ADC2 C C8              F:006100
  BNE B_1_2DC7                                    ;   2DC3 ADC3 C D0 02           F:006100
  INC R_000F                                      ;   2DC5 ADC5 C E6 0F           F:006100
B_1_2DC7:
  LDA (R_000E),Y                                  ;   2DC7 ADC7 C B1 0E           F:006100
  CLC                                             ;   2DC9 ADC9 C 18              F:006100
  ADC QuestionAbsoluteLocation                    ;   2DCA ADCA C 6D A3 05        F:006100
  STA QuestionAbsoluteLocation                    ;   2DCD ADCD C 8D A3 05        F:006100
  LDA QuestionAbsoluteLocation+1                                      ;   2DD0 ADD0 C AD A4 05        F:006100
  ADC #$0                                         ;   2DD3 ADD3 C 69 00           F:006100
  STA QuestionAbsoluteLocation+1                                      ;   2DD5 ADD5 C 8D A4 05        F:006100
  DEX                                             ;   2DD8 ADD8 C CA              F:006100
  BNE B_1_2DC2                                    ;   2DD9 ADD9 C D0 E7           F:006100
  LDA R_0010                                      ;   2DDB ADDB C A5 10           F:006100
  BEQ B_1_2DE4                                    ;   2DDD ADDD C F0 05           F:006100
  DEC R_0010                                      ;   2DDF ADDF C C6 10           F:006100
  JMP B_1_2DC2                                    ;   2DE1 ADE1 C 4C C2 AD        F:006100

B_1_2DE4:
  RTS                                             ;   2DE4 ADE4 C 60              F:006101

FindFMQuestionLocationFar:
  LDA #<D_0_05BD                                       ;   2DE5 ADE5 C A9 BD           F:006101
  STA FMQuestionAbsoluteLocation                  ;   2DE7 ADE7 C 8D A5 05        F:006101
  LDA #>D_0_05BD                                        ;   2DEA ADEA C A9 85           F:006101
  STA FMQuestionAbsoluteLocation+1                                      ;   2DEC ADEC C 8D A6 05        F:006101
  LDA CurrentFMQuestion+1                                      ;   2DEF ADEF C AD 1C 03        F:006101
  STA R_0010                                      ;   2DF2 ADF2 C 85 10           F:006101
  ORA CurrentFMQuestion                           ;   2DF4 ADF4 C 0D 1B 03        F:006101
  BEQ B_1_2DE4                                    ;   2DF7 ADF7 C F0 EB           F:006101
  LDX CurrentFMQuestion                           ;   2DF9 ADF9 C AE 1B 03        F:006101
  LDA #<FMQuestionDataLength                                        ;   2DFC ADFC C A9 12           F:006101
  STA R_000E                                      ;   2DFE ADFE C 85 0E           F:006101
  LDA #>FMQuestionDataLength                                        ;   2E00 AE00 C A9 B3           F:006101
  STA R_000F                                      ;   2E02 AE02 C 85 0F           F:006101
  LDY #$0                                         ;   2E04 AE04 C A0 00           F:006101
B_1_2E06:
  LDA (R_000E),Y                                  ;   2E06 AE06 C B1 0E           F:006101
  INY                                             ;   2E08 AE08 C C8              F:006101
  BNE B_1_2E0D                                    ;   2E09 AE09 C D0 02           F:006101
  INC R_000F                                      ;   2E0B AE0B C E6 0F           F:006101
B_1_2E0D:
  CLC                                             ;   2E0D AE0D C 18              F:006101
  ADC FMQuestionAbsoluteLocation                  ;   2E0E AE0E C 6D A5 05        F:006101
  STA FMQuestionAbsoluteLocation                  ;   2E11 AE11 C 8D A5 05        F:006101
  LDA FMQuestionAbsoluteLocation+1                                      ;   2E14 AE14 C AD A6 05        F:006101
  ADC #$0                                         ;   2E17 AE17 C 69 00           F:006101
  STA FMQuestionAbsoluteLocation+1                                      ;   2E19 AE19 C 8D A6 05        F:006101
  DEX                                             ;   2E1C AE1C C CA              F:006101
  BNE B_1_2E06                                    ;   2E1D AE1D C D0 E7           F:006101
  LDA R_0010                                      ;   2E1F AE1F C A5 10           F:006101
  BEQ B_1_2DE4                                    ;   2E21 AE21 C F0 C1           F:006101
  DEC R_0010                                      ;   2E23 AE23 C C6 10           F:006101
  JMP B_1_2E06                                    ;   2E25 AE25 C 4C 06 AE        F:006101

FindQuestionLocationNear:
  @TempLengthPtr = $0E
  ldx QuestionAdvanceCount
  lda CurrentQuestion
  clc
  adc #<QuestionDataLength
  sta @TempLengthPtr
  lda CurrentQuestion+1
  adc #>QuestionDataLength
  sta @TempLengthPtr+1
  ldy #$01
@Advance:
  lda (@TempLengthPtr),y
  clc
  adc QuestionAbsoluteLocation
  sta QuestionAbsoluteLocation
  lda QuestionAbsoluteLocation+1
  adc #$00
  sta QuestionAbsoluteLocation+1
  inc CurrentQuestion
  bne @OverflowChecked
  inc CurrentQuestion+1
@OverflowChecked:
  iny
  dex
  bne @Advance
  rts

FindFMQuestionLocationNear:
  @TempLengthPtr = $0E
  lda CurrentFMQuestion
  clc
  adc #<FMQuestionDataLength
  sta @TempLengthPtr
  lda CurrentFMQuestion+1
  adc #>FMQuestionDataLength
  sta @TempLengthPtr+1
  ldy #$00
  lda (@TempLengthPtr),y
  adc FMQuestionAbsoluteLocation
  sta FMQuestionAbsoluteLocation
  lda FMQuestionAbsoluteLocation+1
  adc #$00
  sta FMQuestionAbsoluteLocation+1
  inc CurrentFMQuestion
  bne :+
  inc CurrentFMQuestion+1
: rts

AdvanceQuestion:
  lda IsInFastMoney                               ; are we currently in the fast money section?
  bne AdvanceFastMoney                            ; yes - skip ahead to deal with fast money
  jsr AdvanceRNG                                  ; no - roll the rng for the next question
  lda RNG1                                        ; and select the next question based on that rng
  and #$7                                         ;
  tax                                             ; advance by 1 (shouldn't select the same question twice)
  inx                                             ;
  stx QuestionAdvanceCount                        ; store how many questions we advanced
  jsr FindQuestionLocationNear                    ; and load the location of the next selected question
  lda CurrentQuestion+1                           ; check if we are overflowing
  cmp #>TotalQuestions                            ;
  beq @CheckForQuestionOverflow                   ; we may be overflowing, skip ahead
  bcs @HandleOverflow                             ; we're definitely overflowing, skip ahead
@Exit:
  rts                                             ; we're good. exit!
@CheckForQuestionOverflow:
  lda CurrentQuestion                             ; check low byte to check for overflow
  cmp #<TotalQuestions                            ;
  bcc @Exit                                       ; if we're fine, exit, otherwise wraparound.
@HandleOverflow:
  lda CurrentQuestion                             ; wrap question around
  sbc #<TotalQuestions                            ;
  sta CurrentQuestion                             ;
  lda CurrentQuestion+1                           ;
  sbc #>TotalQuestions                            ;
  sta CurrentQuestion+1                           ;
  jmp FindQuestionLocationFar                     ; then find the question location

AdvanceFastMoney:
  jsr FindFMQuestionLocationNear                  ; find the position of the fm question data
  lda CurrentFMQuestion+1                         ; check the high byte of the selected question
  cmp #$1                                         ; 
  beq @CheckOverflow                              ; skip to check if we've selected an out of bounds question
  bcs @HandleOverflow                             ; skip if we're definitely selected too high of an answer
@Exit:
  rts                                             ; exit
@CheckOverflow:
  lda CurrentFMQuestion                           ; check if we're within range on the low byte
  cmp #<TotalFMQuestions                          ; 
  bcc @Exit                                       ; if so, exit, otherwise deal with overflow
@HandleOverflow:
  lda CurrentFMQuestion                           ; we've overflowed, wrap back around.
  sbc #<TotalFMQuestions                          ; 
  sta CurrentFMQuestion                           ; 
  lda CurrentFMQuestion+1                         ; 
  sbc #>TotalFMQuestions                          ; 
  sta CurrentFMQuestion+1                         ; 
  jmp FindFMQuestionLocationFar                   ; then find the question location

AdanceQuestionCHRAddress:
  INC QuestionCHRAddr                             ;   2EE4 AEE4 C EE 73 03        F:008272
  BNE @Done                                       ;   2EE7 AEE7 C D0 24           F:008272
  INC QuestionCHRAddr+1                           ;   2EE9 AEE9 C EE 74 03        F:027957
  LDA QuestionCHRAddr+1                           ;   2EEC AEEC C AD 74 03        F:027957
  CMP #$10                                        ;   2EEF AEEF C C9 10           F:027957
  BNE @Done                                       ;   2EF1 AEF1 C D0 1A           F:027957
  INC QuestionCHRBank                             ;   2EF3 AEF3 C EE 75 03        F:067194
  LDA QuestionCHRBank                             ;   2EF6 AEF6 C AD 75 03        F:067194
  JSR MMC1SetCHR0                                 ;   2EF9 AEF9 C 20 54 99        F:067194
  LDA #$0                                         ;   2EFC AEFC C A9 00           F:067194
  STA PpuAddr_2006                                ;   2EFE AEFE C 8D 06 20        F:067194
  STA PpuAddr_2006                                ;   2F01 AF01 C 8D 06 20        F:067194
  STA QuestionCHRAddr                             ;   2F04 AF04 C 8D 73 03        F:067194
  STA QuestionCHRAddr+1                           ;   2F07 AF07 C 8D 74 03        F:067194
  LDA PpuData_2007                                ;   2F0A AF0A C AD 07 20        F:067194
@Done:
  RTS                                             ;   2F0D AF0D C 60              F:008272

L_1_2F0E:
  LDA IsInFastMoney                                      ;   2F0E AF0E C AD 43 05        F:008272
  BNE B_1_2F28                                    ;   2F11 AF11 C D0 15           F:008272
  LDX #<QuestionDataLength                                        ;   2F13 AF13 C A2 32           F:008272
  LDY #>QuestionDataLength                                        ;   2F15 AF15 C A0 B1           F:008272
  LDA QuestionAbsoluteLocation                    ;   2F17 AF17 C AD A3 05        F:008272
  STA QuestionCHRAddr                             ;   2F1A AF1A C 8D 73 03        F:008272
  LDA QuestionAbsoluteLocation+1                                      ;   2F1D AF1D C AD A4 05        F:008272
  STA NextQuestionCHRBank                         ;   2F20 AF20 C 8D 78 03        F:008272
  LDA #$1                                         ;   2F23 AF23 C A9 01           F:008272
  JMP L_1_2F3A                                    ;   2F25 AF25 C 4C 3A AF        F:008272

B_1_2F28:
  ldx #<FMQuestionDataLength                            ; AF28 A2 12                    ..
  ldy #>FMQuestionDataLength                            ; AF2A A0 B3                    ..
  LDA FMQuestionAbsoluteLocation                  ;   2F2C AF2C C AD A5 05        F:041825
  STA QuestionCHRAddr                             ;   2F2F AF2F C 8D 73 03        F:041825
  LDA FMQuestionAbsoluteLocation+1                                      ;   2F32 AF32 C AD A6 05        F:041825
  STA NextQuestionCHRBank                         ;   2F35 AF35 C 8D 78 03        F:041825
  LDA #$0                                         ;   2F38 AF38 C A9 00           F:041825
L_1_2F3A:
  PHA                                             ;   2F3A AF3A C 48              F:008272
  CLC                                             ;   2F3B AF3B C 18              F:008272
  TXA                                             ;   2F3C AF3C C 8A              F:008272
  ADC CurrentQuestion                             ;   2F3D AF3D C 6D 17 03        F:008272
  STA R_0012                                      ;   2F40 AF40 C 85 12           F:008272
  TYA                                             ;   2F42 AF42 C 98              F:008272
  ADC R_0318                                      ;   2F43 AF43 C 6D 18 03        F:008272
  STA R_0013                                      ;   2F46 AF46 C 85 13           F:008272
  PLA                                             ;   2F48 AF48 C 68              F:008272
  TAY                                             ;   2F49 AF49 C A8              F:008272
  LDA (R_0012),Y                                  ;   2F4A AF4A C B1 12           F:008272
  CLC                                             ;   2F4C AF4C C 18              F:008272
  ADC QuestionCHRAddr                             ;   2F4D AF4D C 6D 73 03        F:008272
  STA NextQuestionCHRAddr                         ;   2F50 AF50 C 8D 76 03        F:008272
  LDA NextQuestionCHRBank                         ;   2F53 AF53 C AD 78 03        F:008272
  ADC #$0                                         ;   2F56 AF56 C 69 00           F:008272
  TAY                                             ;   2F58 AF58 C A8              F:008272
  LDA NextQuestionCHRBank                         ;   2F59 AF59 C AD 78 03        F:008272
  AND #$F                                         ;   2F5C AF5C C 29 0F           F:008272
  STA QuestionCHRAddr+1                           ;   2F5E AF5E C 8D 74 03        F:008272
  LDA NextQuestionCHRBank                         ;   2F61 AF61 C AD 78 03        F:008272
  AND #$F0                                        ;   2F64 AF64 C 29 F0           F:008272
  LSR                                             ;   2F66 AF66 C 4A              F:008272
  LSR                                             ;   2F67 AF67 C 4A              F:008272
  LSR                                             ;   2F68 AF68 C 4A              F:008272
  LSR                                             ;   2F69 AF69 C 4A              F:008272
  ADC #$10                                        ;   2F6A AF6A C 69 10           F:008272
  STA QuestionCHRBank                             ;   2F6C AF6C C 8D 75 03        F:008272
  TYA                                             ;   2F6F AF6F C 98              F:008272
  AND #$F                                         ;   2F70 AF70 C 29 0F           F:008272
  STA NextQuestionCHRAddr+1                       ;   2F72 AF72 C 8D 77 03        F:008272
  TYA                                             ;   2F75 AF75 C 98              F:008272
  AND #$F0                                        ;   2F76 AF76 C 29 F0           F:008272
  LSR                                             ;   2F78 AF78 C 4A              F:008272
  LSR                                             ;   2F79 AF79 C 4A              F:008272
  LSR                                             ;   2F7A AF7A C 4A              F:008272
  LSR                                             ;   2F7B AF7B C 4A              F:008272
  ADC #$10                                        ;   2F7C AF7C C 69 10           F:008272
  STA NextQuestionCHRBank                         ;   2F7E AF7E C 8D 78 03        F:008272
  LDA #$1                                         ;   2F81 AF81 C A9 01           F:008272
  STA QuestionIsLoading                           ;   2F83 AF83 C 8D 7B 03        F:008272
  LDA #$0                                         ;   2F86 AF86 C A9 00           F:008272
  STA QuestionLoadingOffset                       ;   2F88 AF88 C 8D 79 03        F:008272
  RTS                                             ;   2F8B AF8B C 60              F:008272

LoadQuestionFromCHR:
  lda QuestionCHRBank                             ; set the ppu to our loading position
  jsr MMC1SetCHR0
  lda QuestionCHRAddr+1
  sta PpuAddr_2006
  lda QuestionCHRAddr
  sta PpuAddr_2006
  lda PpuData_2007
  ldx QuestionLoadingOffset                       ; fetch how many bytes we've already loaded
  ldy #$0F                                        ; load in 15 bytes of data at a time
@KeepCopying:
  lda PpuData_2007                                ; copy a byte of data
  sta AnswerScratchSpace,x
  jsr AdanceQuestionCHRAddress                    ; then advance our loading address
  inx
  dey
  beq @LoadedEnoughForNow                         ; if we reach 15 bytes it's time to stop.
  lda QuestionCHRBank                             ; otherwise check if there's more data left to load
  cmp NextQuestionCHRBank
  bne @KeepCopying
  lda QuestionCHRAddr+1
  cmp NextQuestionCHRAddr+1
  bne @KeepCopying
  lda QuestionCHRAddr
  cmp NextQuestionCHRAddr
  bne @KeepCopying
@DoneLoading:
  lda #$00                                        ; we've finished loading the question!
  sta QuestionIsLoading
  rts
@LoadedEnoughForNow:
  lda QuestionCHRBank                             ; check to see that there's more to load
  cmp NextQuestionCHRBank
  bne @StoreOffset
  lda QuestionCHRAddr+1
  cmp NextQuestionCHRAddr+1
  bne @StoreOffset
  lda QuestionCHRAddr
  cmp NextQuestionCHRAddr
  beq @DoneLoading                                ; if we're at the end of the data, mark as complete and exit.
@StoreOffset:
  stx QuestionLoadingOffset                       ; if there's more data to load, store the current offset and exit.
  rts

QuestionPrefixes:
.addr QuestionPrefix_NameThe
.addr QuestionPrefix_NameSomething
.addr QuestionPrefix_NameA
.addr QuestionPrefix_NameAn
.addr QuestionPrefix_TellMe
.addr QuestionPrefix_HowMany

QuestionPrefix_NameThe:
.byte "Name the",$00
QuestionPrefix_NameSomething:
.byte "Name something",$00
QuestionPrefix_NameA:
.byte "Name a",$00
QuestionPrefix_NameAn:
.byte "Name an",$00
QuestionPrefix_TellMe:
.byte "Tell me",$00
QuestionPrefix_HowMany:
.byte "How many",$00

L_1_3031:
  LDA #$0                                         ;   3031 B031 C A9 00           F:008272
  STA R_0383                                      ;   3033 B033 C 8D 83 03        F:008272
  STA R_0380                                      ;   3036 B036 C 8D 80 03        F:008272
  STA R_0381                                      ;   3039 B039 C 8D 81 03        F:008272
  STA R_0382                                      ;   303C B03C C 8D 82 03        F:008272
  LDA #$20                                        ;   303F B03F C A9 20           F:008272
B_1_3041:
  PHA                                             ;   3041 B041 C 48              F:008272
  JSR L_1_2D25                                    ;   3042 B042 C 20 25 AD        F:008272
  CMP #$40                                        ;   3045 B045 C C9 40           F:008272
  BEQ B_1_3054                                    ;   3047 B047 C F0 0B           F:008272
  INC R_0383                                      ;   3049 B049 C EE 83 03        F:008272
  CMP #$2A                                        ;   304C B04C C C9 2A           F:008272
  BNE B_1_3041                                    ;   304E B04E C D0 F1           F:008272
  LDA #$22                                        ;   3050 B050 . A9 22           
  BNE B_1_3041                                    ;   3052 B052 . D0 ED           
B_1_3054:
  PLA                                             ;   3054 B054 C 68              F:008272
  ORA #$80                                        ;   3055 B055 C 09 80           F:008272
  PHA                                             ;   3057 B057 C 48              F:008272
  LDX R_0381                                      ;   3058 B058 C AE 81 03        F:008272
  LDA AnswerScratchSpace,X                        ;   305B B05B C BD B9 06        F:008272
  BEQ B_1_3067                                    ;   305E B05E C F0 07           F:008272
  LDX R_0380                                      ;   3060 B060 C AE 80 03        F:008272
  CPX #$3                                         ;   3063 B063 C E0 03           F:008272
  BCC B_1_3070                                    ;   3065 B065 C 90 09           F:008272
B_1_3067:
  INC R_0381                                      ;   3067 B067 C EE 81 03        F:008272
  LDX R_0381                                      ;   306A B06A C AE 81 03        F:008272
  LDA AnswerScratchSpace,X                        ;   306D B06D C BD B9 06        F:008272
B_1_3070:
  STA R_0393                                      ;   3070 B070 C 8D 93 03        F:008272
  AND #$F                                         ;   3073 B073 C 29 0F           F:008272
  STA R_037D                                      ;   3075 B075 C 8D 7D 03        F:008272
  INC R_0381                                      ;   3078 B078 C EE 81 03        F:008272
  LDA R_0393                                      ;   307B B07B C AD 93 03        F:008272
  LSR                                             ;   307E B07E C 4A              F:008272
  LSR                                             ;   307F B07F C 4A              F:008272
  LSR                                             ;   3080 B080 C 4A              F:008272
  AND #$E                                         ;   3081 B081 C 29 0E           F:008272
  BNE B_1_308B                                    ;   3083 B083 C D0 06           F:008272
  LDY R_0383                                      ;   3085 B085 C AC 83 03        F:031142
  JMP L_1_30A8                                    ;   3088 B088 C 4C A8 B0        F:031142

B_1_308B:
  TAY                                             ;   308B B08B C A8              F:008272
  LDA QuestionPrefixes-2,Y                                  ;   308C B08C C B9 EB AF        F:008272
  STA BGDrawPPUAddress                            ;   308F B08F C 85 16           F:008272
  LDA QuestionPrefixes-1,Y                                  ;   3091 B091 C B9 EC AF        F:008272
  STA BGDrawPPUAddress+1                          ;   3094 B094 C 85 17           F:008272
  LDY #$FF                                        ;   3096 B096 C A0 FF           F:008272
B_1_3098:
  INY                                             ;   3098 B098 C C8              F:008272
  LDA (BGDrawPPUAddress),Y                        ;   3099 B099 C B1 16           F:008272
  BEQ B_1_30A2                                    ;   309B B09B C F0 05           F:008272
  STA R_0100,Y                                    ;   309D B09D C 99 00 01        F:008272
  BNE B_1_3098                                    ;   30A0 B0A0 C D0 F6           F:008272
B_1_30A2:
  TYA                                             ;   30A2 B0A2 C 98              F:008272
  CLC                                             ;   30A3 B0A3 C 18              F:008272
  ADC R_0383                                      ;   30A4 B0A4 C 6D 83 03        F:008272
  TAY                                             ;   30A7 B0A7 C A8              F:008272
L_1_30A8:
  PLA                                             ;   30A8 B0A8 C 68              F:008272
  STA R_0100,Y                                    ;   30A9 B0A9 C 99 00 01        F:008272
  DEY                                             ;   30AC B0AC C 88              F:008272
  DEC R_0383                                      ;   30AD B0AD C CE 83 03        F:008272
  BPL L_1_30A8                                    ;   30B0 B0B0 C 10 F6           F:008272
  LDA #$0                                         ;   30B2 B0B2 C A9 00           F:008272
  STA R_0380                                      ;   30B4 B0B4 C 8D 80 03        F:008272
  STA R_0382                                      ;   30B7 B0B7 C 8D 82 03        F:008272
  LDA #$FF                                        ;   30BA B0BA C A9 FF           F:008272
  STA R_037E                                      ;   30BC B0BC C 8D 7E 03        F:008272
  INC R_037D                                      ;   30BF B0BF C EE 7D 03        F:008272
  RTS                                             ;   30C2 B0C2 C 60              F:008272

L_1_30C3:
  DEC R_037D                                      ;   30C3 B0C3 C CE 7D 03        F:008272
  BEQ B_1_3129                                    ;   30C6 B0C6 C F0 61           F:008272
  LDA ActiveScene                                 ;   30C8 B0C8 C AD D3 04        F:008272
  CMP #$3                                         ;   30CB B0CB C C9 03           F:008272
  BNE B_1_30D2                                    ;   30CD B0CD C D0 03           F:008272
  JSR L_1_2855                                    ;   30CF B0CF C 20 55 A8        F:041831
B_1_30D2:
  INC R_037E                                      ;   30D2 B0D2 C EE 7E 03        F:008272
  LDA R_037E                                      ;   30D5 B0D5 C AD 7E 03        F:008272
  ASL                                             ;   30D8 B0D8 C 0A              F:008272
  TAY                                             ;   30D9 B0D9 C A8              F:008272
  LDX R_0381                                      ;   30DA B0DA C AE 81 03        F:008272
  LDA AnswerScratchSpace,X                        ;   30DD B0DD C BD B9 06        F:008272
  STA R_0394,Y                                    ;   30E0 B0E0 C 99 94 03        F:008272
  INC R_0381                                      ;   30E3 B0E3 C EE 81 03        F:008272
  LDA #$0                                         ;   30E6 B0E6 C A9 00           F:008272
  STA R_0380                                      ;   30E8 B0E8 C 8D 80 03        F:008272
  LDY R_037E                                      ;   30EB B0EB C AC 7E 03        F:008272
  LDA QuestionAnswerOffsets,Y                     ;   30EE B0EE C B9 AC 03        F:008272
  STA R_037C                                      ;   30F1 B0F1 C 8D 7C 03        F:008272
L_1_30F4:
  JSR L_1_2D25                                    ;   30F4 B0F4 C 20 25 AD        F:008272
  LDY R_037C                                      ;   30F7 B0F7 C AC 7C 03        F:008272
  CMP #$40                                        ;   30FA B0FA C C9 40           F:008272
  BEQ B_1_3107                                    ;   30FC B0FC C F0 09           F:008272
  STA QuestionAnswerData,Y                        ;   30FE B0FE C 99 B9 03        F:008272
  INC R_037C                                      ;   3101 B101 C EE 7C 03        F:008272
  JMP L_1_30F4                                    ;   3104 B104 C 4C F4 B0        F:008272

B_1_3107:
  LDA #$0                                         ;   3107 B107 C A9 00           F:008272
  STA QuestionAnswerData,Y                        ;   3109 B109 C 99 B9 03        F:008272
  INY                                             ;   310C B10C C C8              F:008272
  TYA                                             ;   310D B10D C 98              F:008272
  LDX R_037E                                      ;   310E B10E C AE 7E 03        F:008272
  STA QuestionAnswerOffsets+1,X                                    ;   3111 B111 C 9D AD 03        F:008272
  LDX R_0381                                      ;   3114 B114 C AE 81 03        F:008272
  LDA AnswerScratchSpace,X                        ;   3117 B117 C BD B9 06        F:008272
  BEQ B_1_3123                                    ;   311A B11A C F0 07           F:008272
  LDA R_0380                                      ;   311C B11C C AD 80 03        F:008272
  CMP #$3                                         ;   311F B11F C C9 03           F:008272
  BCC L_1_30C3                                    ;   3121 B121 C 90 A0           F:008272
B_1_3123:
  INC R_0381                                      ;   3123 B123 C EE 81 03        F:008272
  JMP L_1_30C3                                    ;   3126 B126 C 4C C3 B0        F:008272

B_1_3129:
  LDX R_037E                                      ;   3129 B129 C AE 7E 03        F:008272
  LDA #$FF                                        ;   312C B12C C A9 FF           F:008272
  STA QuestionAnswerOffsets+1,X                                    ;   312E B12E C 9D AD 03        F:008272
  RTS                                             ;   3131 B131 C 60              F:008272

QuestionDataLength:
.byte $00                                         ;   3132 B132 .        ?        
.byte $27,$33,$3C,$2D,$52,$31,$59,$41             ;   3133 B133 DDDDDDDD '3<-R1YA F:006100
.byte $37,$39,$66,$4B,$5C,$39,$6C,$52             ;   313B B13B DDDDDDDD 79fK\9lR F:006100
.byte $6A,$6B,$30,$7D,$43,$64,$32,$29             ;   3143 B143 DDDDDDDD jk0}Cd2) F:006100
.byte $27,$24,$94,$32,$35,$56,$3B,$3A             ;   314B B14B DDDDDDDD '$?25V;: F:006100
.byte $35,$37,$67,$34,$30,$2E,$3F,$41             ;   3153 B153 DDDDDDDD 57g40.?A F:006100
.byte $79,$54,$2D,$3F,$41,$37,$4F,$54             ;   315B B15B DDDDDDDD yT-?A7OT F:006100
.byte $46,$50,$62,$26,$35,$3D,$5F,$31             ;   3163 B163 DDDDDDDD FPb&5=_1 F:006100
.byte $3D,$5D,$3B,$28,$5F,$4F,$5C,$5C             ;   316B B16B DDDDDDDD =];(_O\\ F:006100
.byte $3D,$51,$5A,$45,$27,$2E,$41,$31             ;   3173 B173 DDDDDDDD =QZE'.A1 F:006100
.byte $6C,$34,$36,$1C,$4E,$51,$51,$42             ;   317B B17B DDDDDDDD l46?NQQB F:006100
.byte $6E,$58,$5F,$2E,$41,$42,$5B,$80             ;   3183 B183 DDDDDDDD nX_.AB[? F:006100
.byte $2D,$2F,$52,$30,$2D,$3D,$3B,$3E             ;   318B B18B DDDDDDDD -/R0-=;> F:006100
.byte $40,$61,$53,$37,$5E,$3F,$61,$4C             ;   3193 B193 DDDDDDDD @aS7^?aL F:006100
.byte $44,$3C,$37,$4F,$75,$5C,$34,$51             ;   319B B19B DDDDDDDD D<7Ou\4Q F:006100
.byte $28,$62,$2E,$39,$3A,$3C,$48,$3D             ;   31A3 B1A3 DDDDDDDD (b.9:<H= F:006100
.byte $28,$37,$56,$7C,$31,$4D,$4C,$64             ;   31AB B1AB DDDDDDDD (7V|1MLd F:006100
.byte $54,$39,$27,$36,$2F,$57,$4B,$3B             ;   31B3 B1B3 DDDDDDDD T9'6/WK; F:006100
.byte $43,$51,$54,$43,$30,$35,$47,$4C             ;   31BB B1BB DDDDDDDD CQTC05GL F:006100
.byte $3E,$5F,$2D,$48,$29,$3A,$59,$6B             ;   31C3 B1C3 DDDDDDDD >_-H):Yk F:006100
.byte $31,$4F,$3C,$4A,$45,$40,$39,$68             ;   31CB B1CB DDDDDDDD 1O<JE@9h F:006100
.byte $2A,$37,$4B,$36,$69,$41,$62,$5B             ;   31D3 B1D3 DDDDDDDD *7K6iAb[ F:006100
.byte $52,$4C,$40,$47,$84,$58,$64,$28             ;   31DB B1DB DDDDDDDD RL@G?Xd( F:006100
.byte $67,$4D,$4D,$2D,$2A,$33,$40,$47             ;   31E3 B1E3 DDDDDDDD gMM-*3@G F:006100
.byte $28,$5D,$33,$44,$6B,$4B,$4E,$4B             ;   31EB B1EB DDDDDDDD (]3DkKNK F:006100
.byte $4C,$34,$4A,$49,$35,$57,$58,$34             ;   31F3 B1F3 DDDDDDDD L4JI5WX4 F:006100
.byte $4A,$53,$3D,$3E,$49,$74,$3E,$42             ;   31FB B1FB DDDDDDDD JS=>It>B F:006100
.byte $57,$3B,$47,$45,$8A,$3B,$53,$2A             ;   3203 B203 DDDDDDDD W;GE?;S* F:006100
.byte $46,$5F,$4A,$4F,$60,$3F,$30,$35             ;   320B B20B DDDDDDDD F_JO`?05 F:006100
.byte $44,$4A,$38,$55,$65,$53,$45,$54             ;   3213 B213 DDDDDDDD DJ8UeSET F:006100
.byte $62,$42,$3F,$58,$50,$55,$57,$35             ;   321B B21B DDDDDDDD bB?XPUW5 F:006100
.byte $66,$68,$63,$55,$88,$4C,$26,$59             ;   3223 B223 DDDDDDDD fhcU?L&Y F:006100
.byte $5F,$2F,$33,$50,$6D,$35,$45,$43             ;   322B B22B DDDDDDDD _/3Pm5EC F:006100
.byte $30,$33,$3D,$44,$4A,$38,$42,$54             ;   3233 B233 DDDDDDDD 03=DJ8BT F:006100
.byte $28,$36,$38,$50,$33,$43,$54,$5A             ;   323B B23B DDDDDDDD (68P3CTZ F:006100
.byte $3A,$4A,$1F,$3E,$3F,$40,$41,$2C             ;   3243 B243 DDDDDDDD :J?>?@A, F:006100
.byte $33,$45,$2A,$41,$93,$3C,$34,$2A             ;   324B B24B DDDDDDDD 3E*A?<4* F:006100
.byte $53,$39,$5F,$3C,$3D,$48,$47,$53             ;   3253 B253 DDDDDDDD S9_<=HGS F:006100
.byte $3C,$3A,$42,$56,$35,$38,$35,$4B             ;   325B B25B DDDDDDDD <:BV585K F:006100
.byte $4E,$28,$3D,$42,$60,$27,$63,$54             ;   3263 B263 DDDDDDDD N(=B`'cT F:006100
.byte $32,$39,$33,$56,$40,$3D,$51,$49             ;   326B B26B DDDDDDDD 293V@=QI F:006100
.byte $3F,$1F,$6E,$50,$5F,$3A,$3C,$30             ;   3273 B273 DDDDDDDD ??nP_:<0 F:006100
.byte $35,$65,$48,$21,$36,$59,$29,$3B             ;   327B B27B DDDDDDDD 5eH!6Y); F:006100
.byte $5B,$47,$2D,$2D,$4E,$39,$4A,$37             ;   3283 B283 DDDDDDDD [G--N9J7 F:006100
.byte $33,$35,$28,$38,$41,$48,$21,$3B             ;   328B B28B DDDDDDDD 35(8AH!; F:006100
.byte $55,$48,$37,$40,$46,$3D,$4F,$50             ;   3293 B293 DDDDDDDD UH7@F=OP F:006100
.byte $3F,$34,$40,$2B,$62,$7F,$41,$7A             ;   329B B29B DDDDDDDD ?4@+b?Az F:006100
.byte $51,$4D,$47,$42,$22,$27,$55,$5B             ;   32A3 B2A3 DDDDDDDD QMGB"'U[ F:006100
.byte $22,$3F,$5F,$67                             ;   32AB B2AB DDDD     "?_g     F:006100
.byte $3D,$45,$2F,$51,$50,$45,$5B,$46             ;   32AF B2AF DDDDDDDD =E/QPE[F F:006101
.byte $54,$42,$45,$57,$6D,$88,$68,$7F             ;   32B7 B2B7 DDDDDDDD TBEWm?h? F:006101
.byte $2F,$69,$51,$30,$71,$5C,$3E,$1F             ;   32BF B2BF DDDDDDDD /iQ0q\>? F:006101
.byte $8E,$50,$4C,$24,$99,$49,$8A,$64             ;   32C7 B2C7 DDDDDDDD ?PL$?I?d F:006101
.byte $2D,$47,$46,$3B,$71,$52,$34,$56             ;   32CF B2CF DDDDDDDD -GF;qR4V F:006101
.byte $55,$2E,$7A,$6A,$49,$45,$2F,$48             ;   32D7 B2D7 DDDDDDDD U.zjIE/H F:006101
.byte $2B,$40,$5F,$36,$78,$1D,$34,$45             ;   32DF B2DF DDDDDDDD +@_6x?4E F:006101
.byte $47,$34,$2B,$52,$75,$5D,$26,$3E             ;   32E7 B2E7 DDDDDDDD G4+Ru]&> F:006101
.byte $58,$2D,$4F,$58,$35,$3C,$53,$1B             ;   32EF B2EF DDDDDDDD X-OX5<S? F:006101
.byte $6B,$21,$34,$42,$7B,$64,$3D,$38             ;   32F7 B2F7 DDDDDDDD k!4B{d=8 F:006101
.byte $47,$53,$6B,$65,$4B,$3B,$4A,$50             ;   32FF B2FF DDDDDDDD GSkeK;JP F:006101
.byte $3B,$58,$41,$28                             ;   3307 B307 DDDD     ;XA(     F:006101
.byte $4A,$76,$71,$2F,$34,$4F,$37                 ;   330B B30B DDDDDDD  Jvq/4O7  F:008272

FMQuestionDataLength:
.byte $62,$7C,$25,$97,$26,$2E,$6F,$71             ;   3312 B312 DDDDDDDD b|%?&.oq F:006101
.byte $21,$57,$4B,$39,$7C,$58,$63,$4E             ;   331A B31A DDDDDDDD !WK9|XcN F:006101
.byte $4E,$44,$61,$4C,$6B,$3C,$65,$59             ;   3322 B322 DDDDDDDD NDaLk<eY F:006101
.byte $64,$6F,$47,$4D,$28,$43,$45,$27             ;   332A B32A DDDDDDDD doGM(CE' F:006101
.byte $62,$4C,$32,$3D,$7E,$79,$71,$62             ;   3332 B332 DDDDDDDD bL2=~yqb F:006101
.byte $2E,$59,$7C,$5C,$49,$2A,$47,$63             ;   333A B33A DDDDDDDD .Y|\I*Gc F:006101
.byte $62,$61,$4C,$61,$60,$65,$56,$71             ;   3342 B342 DDDDDDDD baLa`eVq F:006101
.byte $4D,$3A,$29,$38,$24,$35,$3B,$2B             ;   334A B34A DDDDDDDD M:)8$5;+ F:006101
.byte $1A,$37,$1F,$40,$25,$25,$30,$3C             ;   3352 B352 DDDDDDDD ?7?@%%0< F:006101
.byte $41,$4C,$85,$45,$59,$35,$34,$37             ;   335A B35A DDDDDDDD AL?EY547 F:006101
.byte $39,$53,$2D,$37,$1D,$23,$21,$2A             ;   3362 B362 DDDDDDDD 9S-7?#!* F:006101
.byte $47,$20,$33,$2A,$22,$35,$46,$28             ;   336A B36A DDDDDDDD G 3*"5F( F:006101
.byte $29,$24,$4F,$2A,$49,$29,$33,$2F             ;   3372 B372 DDDDDDDD )$O*I)3/ F:006101
.byte $3D,$3F,$40,$3A,$25,$32,$2D,$49             ;   337A B37A DDDDDDDD =?@:%2-I F:006101
.byte $8B,$39,$66,$45,$4A,$43,$1E,$24             ;   3382 B382 DDDDDDDD ?9fEJC?$ F:006101
.byte $46,$4F,$4B,$40,$28,$45,$5D,$8E             ;   338A B38A DDDDDDDD FOK@(E]? F:006101
.byte $25,$29,$59,$25,$33,$99,$30,$5F             ;   3392 B392 DDDDDDDD %)Y%3?0_ F:006101
.byte $33,$40,$80,$62,$1E,$5A,$51,$87             ;   339A B39A DDDDDDDD 3@?b?ZQ? F:006101
.byte $3C,$35,$45,$4C,$38,$36,$3D,$3D             ;   33A2 B3A2 DDDDDDDD <5EL86== F:006101
.byte $2D,$2F,$66,$37,$20,$2E,$35,$3D             ;   33AA B3AA DDDDDDDD -/f7 .5= F:006101
.byte $33,$31,$3A,$41,$4C,$33,$2C,$3C             ;   33B2 B3B2 DDDDDDDD 31:AL3,< F:006101
.byte $34,$2E,$25,$2C,$43,$42,$40,$48             ;   33BA B3BA DDDDDDDD 4.%,CB@H F:006101
.byte $36,$2F,$2B,$20,$30,$2A,$36,$33             ;   33C2 B3C2 DDDDDDDD 6/+ 0*63 F:006101
.byte $85,$5F,$3A,$7A,$5D,$26,$2A,$3A             ;   33CA B3CA DDDDDDDD ?_:z]&*: F:006101
.byte $19,$35,$37,$32,$2E,$33,$46,$40             ;   33D2 B3D2 DDDDDDDD ?572.3F@ F:006101
.byte $3D,$51,$40,$41,$8D,$2E,$2D,$56             ;   33DA B3DA DDDDDDDD =Q@A?.-V F:006101
.byte $28,$33,$24,$43,$80,$61,$93,$27             ;   33E2 B3E2 DDDDDDDD (3$C?a?' F:006101
.byte $2A,$46,$59,$25,$32,$2F,$5F,$32             ;   33EA B3EA DDDDDDDD *FY%2/_2 F:006101
.byte $44,$3C,$28,$2C,$59,$1D,$2F,$31             ;   33F2 B3F2 DDDDDDDD D<(,Y?/1 F:006101
.byte $36,$4D,$41,$3B,$2F,$51,$4D,$30             ;   33FA B3FA DDDDDDDD 6MA;/QM0 F:006101
.byte $45,$33,$3D,$4B,$31,$22,$25,$45             ;   3402 B402 DDDDDDDD E3=K1"%E F:006101
.byte $41,$3C,$2A,$34,$3D,$5E,$61,$50             ;   340A B40A DDDDDDDD A<*4=^aP F:006101
.byte $4C,$44,$37,$35,$43,$55,$32,$54             ;   3412 B412 DDDDDDDD LD75CU2T F:006101
.byte $37,$4D,$2B,$35,$2A,$44,$32,$35             ;   341A B41A DDDDDDDD 7M+5*D25 F:006101
.byte $24,$3A,$4F,$3E,$4E,$33,$2E,$2B             ;   3422 B422 DDDDDDDD $:O>N3.+ F:006101
.byte $53,$30,$32,$32,$36,$2A,$21,$4C             ;   342A B42A DDDDDDDD S0226*!L F:006101
.byte $22,$42,$2D,$3B,$35,$59,$26,$74             ;   3432 B432 DDDDDDDD "B-;5Y&t F:006101
.byte $31,$36,$21,$2F,$26,$35,$36,$39             ;   343A B43A DDDDDDDD 16!/&569 F:006101
.byte $28,$2F,$33,$50,$2D,$1E,$2D,$28             ;   3442 B442 DDDDDDDD (/3P-?-( F:006101
.byte $2B,$3C,$2B,$3A,$65,$3E,$1D,$77             ;   344A B44A DDDDDDDD +<+:e>?w F:006101
.byte $1F,$1A,$5A,$2D,$97,$75,$29,$48             ;   3452 B452 DDDDDDDD ??Z-?u)H F:006101
.byte $2F,$33,$2E,$52,$36,$33,$40,$23             ;   345A B45A DDDDDDDD /3.R63@# F:006101
.byte $30,$22,$2B,$3B,$3E,$27,$58,$3C             ;   3462 B462 DDDDDDDD 0"+;>'X< F:006101
.byte $30,$42,$32,$2B,$32,$27,$33,$25             ;   346A B46A DDDDDDDD 0B2+2'3% F:006101
.byte $30                                         ;   3472 B472 D        0        F:006101
.byte $25,$28,$22,$34,$3E,$27,$21,$25             ;   3473 B473 ........ %("4>'!% 
.byte $61,$31,$33,$27,$24,$33,$39,$63             ;   347B B47B ........ a13'$39c 
.byte $4A,$28,$3F,$21,$23,$2D,$50,$43             ;   3483 B483 ........ J(?!#-PC 
.byte $2E,$2D,$54,$26,$1C,$1F,$35,$28             ;   348B B48B ........ .-T&??5( 
.byte $3C,$38,$41,$1E,$22,$1B,$2C,$3D             ;   3493 B493 ........ <8A?"?,= 
.byte $41,$23,$39,$2A,$47,$2C,$27,$19             ;   349B B49B ........ A#9*G,'? 
.byte $1E,$1D,$39,$2F,$2D,$48,$25,$31             ;   34A3 B4A3 ........ ??9/-H%1 
.byte $3B,$20,$24,$1E,$3C,$3D,$3E,$34             ;   34AB B4AB ........ ; $?<=>4 
.byte $26,$1E,$2A,$35,$26,$36,$1E,$2C             ;   34B3 B4B3 ........ &?*5&6?, 
.byte $58,$8C,$42,$48,$59,$5F,$30,$38             ;   34BB B4BB ........ X?BHY_08 
.byte $6E,$68,$59,$2B,$3F,$37,$59,$2E             ;   34C3 B4C3 ........ nhY+?7Y. 
.byte $32,$6E,$78,$50,$87,$A3,$5B,$50             ;   34CB B4CB ........ 2nxP??[P 
.byte $5F,$50,$3C,$36,$32,$65,$4C,$3D             ;   34D3 B4D3 ........ _P<62eL= 
.byte $54,$49,$3B,$5A,$54,$3A,$63,$75             ;   34DB B4DB ........ TI;ZT:cu 
.byte $3F,$3C,$6F,$5E,$6C,$6C,$9A                 ;   34E3 B4E3 .......  ?<o^ll?  
D_1_34EA:
.byte $08                                         ;   34EA B4EA D        ?        F:008269
.byte $09                                         ;   34EB B4EB D        ?        F:047456
.byte $0A                                         ;   34EC B4EC D        ?        F:023706
D_1_34ED:
.byte $94                                         ;   34ED B4ED D        ?        F:008272
.byte $96                                         ;   34EE B4EE D        ?        F:012833
.byte $98                                         ;   34EF B4EF D        ?        F:017055
.byte $9A                                         ;   34F0 B4F0 D        ?        F:035078
.byte $9C                                         ;   34F1 B4F1 .        ?        
RunTossupScene:
  LDX #$0                                         ;   34F2 B4F2 C A2 00           F:008266
  STX ActiveFamily                                ;   34F4 B4F4 C 86 0B           F:008266
  INX                                             ;   34F6 B4F6 C E8              F:008266
  STX R_0384                                      ;   34F7 B4F7 C 8E 84 03        F:008266
  INX                                             ;   34FA B4FA C E8              F:008266
  STX ActiveScene                                 ;   34FB B4FB C 8E D3 04        F:008266
  JSR L_2_52B6                                    ;   34FE B4FE C 20 B6 D2        F:008266
  JSR PPUHideAllAndWaitForNMI                                    ;   3501 B501 C 20 C0 99        F:008266
  LDA #$3                                         ;   3504 B504 C A9 03           F:008267
  JSR SetNMIRoutine                                    ;   3506 B506 C 20 C7 CA        F:008267
  LDX #$1                                         ;   3509 B509 C A2 01           F:008267
  STX PaletteDirtyFlag                            ;   350B B50B C 8E 3D 03        F:008267
  LDA #$2                                         ;   350E B50E C A9 02           F:008267
  LDY #$0                                         ;   3510 B510 C A0 00           F:008267
  JSR SetNewBackground                                    ;   3512 B512 C 20 07 A3        F:008267
  JSR SetInitialAnsweringFamilyMember                                    ;   3515 B515 C 20 86 84        F:008269
  LDX Family2                                     ;   3518 B518 C AE 16 03        F:008269
  LDA D_1_34EA,X                                  ;   351B B51B C BD EA B4        F:008269
  LDX #$0                                         ;   351E B51E C A2 00           F:008269
  STX PPUNametable                                ;   3520 B520 C 8E 44 03        F:008269
  LDY #$0                                         ;   3523 B523 C A0 00           F:008269
  JSR SetNewBackground                                    ;   3525 B525 C 20 07 A3        F:008269
  JSR L_1_3A40                                    ;   3528 B528 C 20 40 BA        F:008271
  JSR DrawQuestionTopBackgroundColor                                    ;   352B B52B C 20 C5 8C        F:008271
  JSR L_0_04E5                                    ;   352E B52E C 20 E5 84        F:008271
  JSR L_0_06D9                                    ;   3531 B531 C 20 D9 86        F:008272
  LDX #$B                                         ;   3534 B534 C A2 0B           F:008272
B_1_3536:
  LDA #$0                                         ;   3536 B536 C A9 00           F:008272
  STA R_0384,X                                    ;   3538 B538 C 9D 84 03        F:008272
  DEX                                             ;   353B B53B C CA              F:008272
  BPL B_1_3536                                    ;   353C B53C C 10 F8           F:008272
  STX ActiveFamily                                ;   353E B53E C 86 0B           F:008272
  INX                                             ;   3540 B540 C E8              F:008272
  STX UserAnswerInputLength                       ;   3541 B541 C 8E 5F 03        F:008272
  STX R_035E                                      ;   3544 B544 C 8E 5E 03        F:008272
  STX R_054E                                      ;   3547 B547 C 8E 4E 05        F:008272
  INX                                             ;   354A B54A C E8              F:008272
  STX a:R_001F                                    ;   354B B54B C 8E 1F 00        F:008272
  JSR MoveSpritesOffscreen                                    ;   354E B54E C 20 D5 99        F:008272
  JSR L_2_52B6                                    ;   3551 B551 C 20 B6 D2        F:008272
  JSR L_1_395B                                    ;   3554 B554 C 20 5B B9        F:008272
  JSR L_1_39A3                                    ;   3557 B557 C 20 A3 B9        F:008272
  JSR L_1_3989                                    ;   355A B55A C 20 89 B9        F:008272
  JSR L_1_39B9                                    ;   355D B55D C 20 B9 B9        F:008272
  JSR L_1_2BDE                                    ;   3560 B560 C 20 DE AB        F:008272
  LDA #$0                                         ;   3563 B563 C A9 00           F:008590
  STA R_0023                                      ;   3565 B565 C 85 23           F:008590
  STA R_0024                                      ;   3567 B567 C 85 24           F:008590
  STA R_0021                                      ;   3569 B569 C 85 21           F:008590
  STA R_04BC                                      ;   356B B56B C 8D BC 04        F:008590
  STA R_04BD                                      ;   356E B56E C 8D BD 04        F:008590
  STA R_0390                                      ;   3571 B571 C 8D 90 03        F:008590
  STA R_0391                                      ;   3574 B574 C 8D 91 03        F:008590
  STA IsInFastMoney                                      ;   3577 B577 C 8D 43 05        F:008590
  LDA RNG1                                        ;   357A B57A C AD FA 01        F:008590
  AND #$3                                         ;   357D B57D C 29 03           F:008590
  CLC                                             ;   357F B57F C 18              F:008590
  ADC #$1                                         ;   3580 B580 C 69 01           F:008590
  JSR L_0_19F7                                    ;   3582 B582 C 20 F7 99        F:008590
  LDX R_05C4                                      ;   3585 B585 C AE C4 05        F:008590
  LDA #$A1                                        ;   3588 B588 C A9 A1           F:008590
  STA R_05E3,X                                    ;   358A B58A C 9D E3 05        F:008590
  LDA #$78                                        ;   358D B58D C A9 78           F:008590
  STA R_04CE                                      ;   358F B58F C 8D CE 04        F:008590
  JSR JoypadReadState                                    ;   3592 B592 C 20 A4 9B        F:008590
  JSR L_0_1A0B                                    ;   3595 B595 C 20 0B 9A        F:008590
  JSR PPUMASKShowSprites                                    ;   3598 B598 C 20 B9 99        F:008590
  JSR PPUMASKShowBackground                                    ;   359B B59B C 20 AB 99        F:008590
  JSR PPUCTRLEnableNMI                                    ;   359E B59E C 20 EF CA        F:008590
L_1_35A1:
  LDA PaletteDirtyFlagPending                     ;   35A1 B5A1 C AD 41 03        F:008590
  STA PaletteDirtyFlag                            ;   35A4 B5A4 C 8D 3D 03        F:008590
  JSR DelayUntilNMI                                    ;   35A7 B5A7 C 20 F9 CA        F:008590
  JSR SoundSystemUpdate                                    ;   35AA B5AA C 20 96 BA        F:008591
  LDX #$0                                         ;   35AD B5AD C A2 00           F:008591
  JSR L_0_1B37                                    ;   35AF B5AF C 20 37 9B        F:008591
  BCC B_1_35D7                                    ;   35B2 B5B2 C 90 23           F:008591
  LDX #$1                                         ;   35B4 B5B4 C A2 01           F:008591
  LDA QuestionTopBackgroundTile                   ;   35B6 B5B6 C AD 12 03        F:008591
  BNE B_1_35C6                                    ;   35B9 B5B9 C D0 0B           F:008591
  LDA ActiveFamily                                ;   35BB B5BB C A5 0B           F:008591
  BEQ B_1_35C6                                    ;   35BD B5BD C F0 07           F:008591
  LDA R_0028                                      ;   35BF B5BF C A5 28           F:008591
  BEQ B_1_35D7                                    ;   35C1 B5C1 C F0 14           F:008591
  JMP L_1_35CB                                    ;   35C3 B5C3 C 4C CB B5        F:008591

B_1_35C6:
  JSR L_0_1B37                                    ;   35C6 B5C6 C 20 37 9B        F:024028
  BCC B_1_35D7                                    ;   35C9 B5C9 C 90 0C           F:024028
L_1_35CB:
  JSR SetFamilyCHRBanks                                    ;   35CB B5CB C 20 01 87        F:008591
  JSR L_1_390B                                    ;   35CE B5CE C 20 0B B9        F:008591
  JSR L_0_1A7E                                    ;   35D1 B5D1 C 20 7E 9A        F:008591
  JMP L_1_35A1                                    ;   35D4 B5D4 C 4C A1 B5        F:008591

B_1_35D7:
  STX ActiveFamily                                ;   35D7 B5D7 C 86 0B           F:008603
  LDA #$88                                        ;   35D9 B5D9 C A9 88           F:008603
  STA R_05F9                                      ;   35DB B5DB C 8D F9 05        F:008603
  LDX R_05C2                                      ;   35DE B5DE C AE C2 05        F:008603
  LDA #$9E                                        ;   35E1 B5E1 C A9 9E           F:008603
  CLC                                             ;   35E3 B5E3 C 18              F:008603
  ADC ActiveFamily                                ;   35E4 B5E4 C 65 0B           F:008603
  STA R_05C5,X                                    ;   35E6 B5E6 C 9D C5 05        F:008603
  LDA ActiveFamily                                ;   35E9 B5E9 C A5 0B           F:008603
  BNE B_1_35FF                                    ;   35EB B5EB C D0 12           F:008603
  LDX R_05C1                                      ;   35ED B5ED C AE C1 05        F:008603
  LDY CurrentAnsweringFamilyMember                ;   35F0 B5F0 C AC DC 04        F:008603
  CLC                                             ;   35F3 B5F3 C 18              F:008603
  LDA #$1                                         ;   35F4 B5F4 C A9 01           F:008603
  ADC D_1_34ED,Y                                  ;   35F6 B5F6 C 79 ED B4        F:008603
  STA R_05C5,X                                    ;   35F9 B5F9 C 9D C5 05        F:008603
  JMP L_1_360E                                    ;   35FC B5FC C 4C 0E B6        F:008603

B_1_35FF:
  LDX R_05C3                                      ;   35FF B5FF C AE C3 05        F:024034
  LDY CurrentAnsweringFamilyMember                ;   3602 B602 C AC DC 04        F:024034
  CLC                                             ;   3605 B605 C 18              F:024034
  LDA #$1                                         ;   3606 B606 C A9 01           F:024034
  ADC D_1_34ED,Y                                  ;   3608 B608 C 79 ED B4        F:024034
  STA R_05E3,X                                    ;   360B B60B C 9D E3 05        F:024034
L_1_360E:
  LDX R_05C4                                      ;   360E B60E C AE C4 05        F:008603
  CLC                                             ;   3611 B611 C 18              F:008603
  LDA ActiveFamily                                ;   3612 B612 C A5 0B           F:008603
  ADC #$A2                                        ;   3614 B614 C 69 A2           F:008603
  STA R_05E3,X                                    ;   3616 B616 C 9D E3 05        F:008603
  JMP L_1_361E                                    ;   3619 B619 C 4C 1E B6        F:008603

.byte $86,$0B                                     ;   361C B61C ..       ??       
L_1_361E:
  JSR SetFamilyCHRBanks                                    ;   361E B61E C 20 01 87        F:008603
  JSR L_1_390B                                    ;   3621 B621 C 20 0B B9        F:008603
  LDA #$1                                         ;   3624 B624 C A9 01           F:008603
  JSR L_1_38F0                                    ;   3626 B626 C 20 F0 B8        F:008603
  LDA #$2                                         ;   3629 B629 C A9 02           F:008604
  JSR L_1_38F0                                    ;   362B B62B C 20 F0 B8        F:008604
  JSR L_0_05D6                                    ;   362E B62E C 20 D6 85        F:008605
  LDA #$3                                         ;   3631 B631 C A9 03           F:008605
  JSR L_1_38F0                                    ;   3633 B633 C 20 F0 B8        F:008605
  LDA #$4                                         ;   3636 B636 C A9 04           F:008606
  JSR L_1_38F0                                    ;   3638 B638 C 20 F0 B8        F:008606
  JMP L_1_3675                                    ;   363B B63B C 4C 75 B6        F:008607

L_1_363E:
  STX ActiveFamily                                ;   363E B63E C 86 0B           F:009398
  LDX R_05C4                                      ;   3640 B640 C AE C4 05        F:009398
  CLC                                             ;   3643 B643 C 18              F:009398
  LDA ActiveFamily                                ;   3644 B644 C A5 0B           F:009398
  ADC #$A2                                        ;   3646 B646 C 69 A2           F:009398
  STA R_05E3,X                                    ;   3648 B648 C 9D E3 05        F:009398
  JSR SetFamilyCHRBanks                                    ;   364B B64B C 20 01 87        F:009398
  JSR L_1_390B                                    ;   364E B64E C 20 0B B9        F:009398
  JSR DelayUntilNMI                                    ;   3651 B651 C 20 F9 CA        F:009398
  JSR SoundSystemUpdate                                    ;   3654 B654 C 20 96 BA        F:009399
  JSR SetFamilyCHRBanks                                    ;   3657 B657 C 20 01 87        F:009399
  JSR L_1_390B                                    ;   365A B65A C 20 0B B9        F:009399
  JSR L_1_38FF                                    ;   365D B65D C 20 FF B8        F:009399
  LDA QuestionTopBackgroundTile                   ;   3660 B660 C AD 12 03        F:009399
  BNE B_1_366E                                    ;   3663 B663 C D0 09           F:009399
  LDA ActiveFamily                                ;   3665 B665 C A5 0B           F:009399
  BEQ B_1_366E                                    ;   3667 B667 C F0 05           F:009399
  LDA #$8                                         ;   3669 B669 C A9 08           F:009399
  JMP L_1_3670                                    ;   366B B66B C 4C 70 B6        F:009399

B_1_366E:
  LDA #$7                                         ;   366E B66E C A9 07           F:036110
L_1_3670:
  STA R_0021                                      ;   3670 B670 C 85 21           F:009399
  JSR L_0_06B0                                    ;   3672 B672 C 20 B0 86        F:009399
L_1_3675:
  JSR L_1_38E4                                    ;   3675 B675 C 20 E4 B8        F:008607
  JSR L_0_118D                                    ;   3678 B678 C 20 8D 91        F:008608
L_1_367B:
  JSR DelayUntilNMI                                    ;   367B B67B C 20 F9 CA        F:008608
  JSR SoundSystemUpdate                                    ;   367E B67E C 20 96 BA        F:008609
  JSR L_0_0A03                                    ;   3681 B681 C 20 03 8A        F:008609
  PHP                                             ;   3684 B684 C 08              F:008609
  JSR SetFamilyCHRBanks                                    ;   3685 B685 C 20 01 87        F:008609
  JSR L_1_390B                                    ;   3688 B688 C 20 0B B9        F:008609
  PLP                                             ;   368B B68B C 28              F:008609
  BCC B_1_3694                                    ;   368C B68C C 90 06           F:008609
  JSR L_2_4DBE                                    ;   368E B68E C 20 BE CD        F:008609
  JMP L_1_367B                                    ;   3691 B691 C 4C 7B B6        F:008609

B_1_3694:
  LDA QuestionTopBackgroundTile                   ;   3694 B694 C AD 12 03        F:008882
  BNE B_1_369D                                    ;   3697 B697 C D0 04           F:008882
  LDA ActiveFamily                                ;   3699 B699 C A5 0B           F:008882
  BNE B_1_36A4                                    ;   369B B69B C D0 07           F:008882
B_1_369D:
  JSR L_1_38FF                                    ;   369D B69D C 20 FF B8        F:008882
  LDA #$9                                         ;   36A0 B6A0 C A9 09           F:008882
  STA R_0021                                      ;   36A2 B6A2 C 85 21           F:008882
B_1_36A4:
  LDA #$1                                         ;   36A4 B6A4 C A9 01           F:008882
  JSR L_0_19F7                                    ;   36A6 B6A6 C 20 F7 99        F:008882
B_1_36A9:
  JSR L_1_38E4                                    ;   36A9 B6A9 C 20 E4 B8        F:008882
  LDA R_0028                                      ;   36AC B6AC C A5 28           F:008883
  BNE B_1_36A9                                    ;   36AE B6AE C D0 F9           F:008883
  LDA #$0                                         ;   36B0 B6B0 C A9 00           F:008942
  STA R_0029                                      ;   36B2 B6B2 C 85 29           F:008942
  STA R_04C9                                      ;   36B4 B6B4 C 8D C9 04        F:008942
  STA PaletteDirtyFlag                            ;   36B7 B6B7 C 8D 3D 03        F:008942
  JSR L_0_1BDB                                    ;   36BA B6BA C 20 DB 9B        F:008942
  LDA #$2                                         ;   36BD B6BD C A9 02           F:009276
  JSR L_0_19F7                                    ;   36BF B6BF C 20 F7 99        F:009276
B_1_36C2:
  JSR DelayUntilNMI                                    ;   36C2 B6C2 C 20 F9 CA        F:009276
  LDA R_0028                                      ;   36C5 B6C5 C A5 28           F:009277
  BNE B_1_36C2                                    ;   36C7 B6C7 C D0 F9           F:009277
  LDA #$1                                         ;   36C9 B6C9 C A9 01           F:009396
  STA PaletteDirtyFlag                            ;   36CB B6CB C 8D 3D 03        F:009396
  LDA #$0                                         ;   36CE B6CE C A9 00           F:009396
  LDX #$8                                         ;   36D0 B6D0 C A2 08           F:009396
  LDY #$1                                         ;   36D2 B6D2 C A0 01           F:009396
  JSR L_2_4B00                                    ;   36D4 B6D4 C 20 00 CB        F:009396
  LDA #$3                                         ;   36D7 B6D7 C A9 03           F:009396
  JSR SetNMIRoutine                                    ;   36D9 B6D9 C 20 C7 CA        F:009396
  LDA #$7                                         ;   36DC B6DC C A9 07           F:009396
  STA R_0021                                      ;   36DE B6DE C 85 21           F:009396
  JSR DelayUntilNMI                                    ;   36E0 B6E0 C 20 F9 CA        F:009396
  JSR SoundSystemUpdate                                    ;   36E3 B6E3 C 20 96 BA        F:009397
  JSR SetFamilyCHRBanks                                    ;   36E6 B6E6 C 20 01 87        F:009397
  LDA #$0                                         ;   36E9 B6E9 C A9 00           F:009397
  STA PaletteDirtyFlag                            ;   36EB B6EB C 8D 3D 03        F:009397
  LDA R_0393                                      ;   36EE B6EE C AD 93 03        F:009397
  AND #$F                                         ;   36F1 B6F1 C 29 0F           F:009397
  CMP R_04B9                                      ;   36F3 B6F3 C CD B9 04        F:009397
  BEQ B_1_3712                                    ;   36F6 B6F6 C F0 1A           F:009397
  LDY R_04B9                                      ;   36F8 B6F8 C AC B9 04        F:009828
  LDA R_0384,Y                                    ;   36FB B6FB C B9 84 03        F:009828
  BEQ B_1_370D                                    ;   36FE B6FE C F0 0D           F:009828
  JSR $B820                                       ;   3700 B700 . 20 20 B8        
  LDA #$7                                         ;   3703 B703 . A9 07           
  STA R_0021                                      ;   3705 B705 . 85 21           
  JSR L_0_06B0                                    ;   3707 B707 . 20 B0 86        
  JMP $B675                                       ;   370A B70A . 4C 75 B6        

B_1_370D:
  LDA #$1                                         ;   370D B70D C A9 01           F:009828
  STA R_0384,Y                                    ;   370F B70F C 99 84 03        F:009828
B_1_3712:
  JSR DelayUntilNMI                                    ;   3712 B712 C 20 F9 CA        F:009397
  JSR SoundSystemUpdate                                    ;   3715 B715 C 20 96 BA        F:009398
  LDA R_04B9                                      ;   3718 B718 C AD B9 04        F:009398
  BEQ B_1_3739                                    ;   371B B71B C F0 1C           F:009398
  LDA ActiveFamily                                ;   371D B71D C A5 0B           F:009398
  EOR #$1                                         ;   371F B71F C 49 01           F:009398
  TAX                                             ;   3721 B721 C AA              F:009398
  INC R_0024                                      ;   3722 B722 C E6 24           F:009398
  LDA R_0024                                      ;   3724 B724 C A5 24           F:009398
  CMP #$2                                         ;   3726 B726 C C9 02           F:009398
  BEQ B_1_3739                                    ;   3728 B728 C F0 0F           F:009398
  LDA QuestionTopBackgroundTile                   ;   372A B72A C AD 12 03        F:009398
  BNE B_1_3736                                    ;   372D B72D C D0 07           F:009398
  CPX #$1                                         ;   372F B72F C E0 01           F:009398
  BEQ B_1_3736                                    ;   3731 B731 C F0 03           F:009398
  JMP $B61C                                       ;   3733 B733 . 4C 1C B6        

B_1_3736:
  JMP L_1_363E                                    ;   3736 B736 C 4C 3E B6        F:009398

B_1_3739:
  LDA R_04BC                                      ;   3739 B739 C AD BC 04        F:009829
  ORA R_04BD                                      ;   373C B73C C 0D BD 04        F:009829
  BNE B_1_3744                                    ;   373F B73F C D0 03           F:009829
  JMP L_1_37CD                                    ;   3741 B741 C 4C CD B7        F:036940

B_1_3744:
  LDA R_04BC                                      ;   3744 B744 C AD BC 04        F:009829
  CMP R_04BD                                      ;   3747 B747 C CD BD 04        F:009829
  BNE B_1_3751                                    ;   374A B74A C D0 05           F:009829
  LDA ActiveFamily                                ;   374C B74C . A5 0B           
  JMP $B754                                       ;   374E B74E . 4C 54 B7        

B_1_3751:
  LDA #$0                                         ;   3751 B751 C A9 00           F:009829
  ROL                                             ;   3753 B753 C 2A              F:009829
  EOR #$1                                         ;   3754 B754 C 49 01           F:009829
  STA ActiveFamily                                ;   3756 B756 C 85 0B           F:009829
  LDX R_05C4                                      ;   3758 B758 C AE C4 05        F:009829
  CLC                                             ;   375B B75B C 18              F:009829
  ADC #$A2                                        ;   375C B75C C 69 A2           F:009829
  STA R_05E3,X                                    ;   375E B75E C 9D E3 05        F:009829
  LDA #$8A                                        ;   3761 B761 C A9 8A           F:009829
  STA R_05F9                                      ;   3763 B763 C 8D F9 05        F:009829
  JSR SetFamilyCHRBanks                                    ;   3766 B766 C 20 01 87        F:009829
  JSR L_1_390B                                    ;   3769 B769 C 20 0B B9        F:009829
  JSR DelayUntilNMI                                    ;   376C B76C C 20 F9 CA        F:009829
  JSR SoundSystemUpdate                                    ;   376F B76F C 20 96 BA        F:009830
  JSR SetFamilyCHRBanks                                    ;   3772 B772 C 20 01 87        F:009830
  JSR L_1_390B                                    ;   3775 B775 C 20 0B B9        F:009830
  JSR L_1_38FF                                    ;   3778 B778 C 20 FF B8        F:009830
  JSR L_1_3842                                    ;   377B B77B C 20 42 B8        F:009830
  LDX R_05C4                                      ;   377E B77E C AE C4 05        F:009831
  CLC                                             ;   3781 B781 C 18              F:009831
  LDA ActiveFamily                                ;   3782 B782 C A5 0B           F:009831
  ADC #$A2                                        ;   3784 B784 C 69 A2           F:009831
  STA R_05E3,X                                    ;   3786 B786 C 9D E3 05        F:009831
  JSR DelayUntilNMI                                    ;   3789 B789 C 20 F9 CA        F:009831
  JSR SoundSystemUpdate                                    ;   378C B78C C 20 96 BA        F:009832
  JSR SetFamilyCHRBanks                                    ;   378F B78F C 20 01 87        F:009832
  JSR L_1_390B                                    ;   3792 B792 C 20 0B B9        F:009832
  CLC                                             ;   3795 B795 C 18              F:009832
  LDA #$3                                         ;   3796 B796 C A9 03           F:009832
  ADC ActiveFamily                                ;   3798 B798 C 65 0B           F:009832
  STA R_0021                                      ;   379A B79A C 85 21           F:009832
  LDA #$3                                         ;   379C B79C C A9 03           F:009832
  JSR L_0_19F7                                    ;   379E B79E C 20 F7 99        F:009832
B_1_37A1:
  JSR DelayUntilNMI                                    ;   37A1 B7A1 C 20 F9 CA        F:009832
  JSR SoundSystemUpdate                                    ;   37A4 B7A4 C 20 96 BA        F:009833
  JSR SetFamilyCHRBanks                                    ;   37A7 B7A7 C 20 01 87        F:009833
  JSR L_1_390B                                    ;   37AA B7AA C 20 0B B9        F:009833
  LDA R_0028                                      ;   37AD B7AD C A5 28           F:009833
  BNE B_1_37A1                                    ;   37AF B7AF C D0 F0           F:009833
  LDA #$1                                         ;   37B1 B7B1 C A9 01           F:010013
  STA PaletteDirtyFlag                            ;   37B3 B7B3 C 8D 3D 03        F:010013
  JSR L_1_38FF                                    ;   37B6 B7B6 C 20 FF B8        F:010013
B_1_37B9:
  JSR DelayUntilNMI                                    ;   37B9 B7B9 C 20 F9 CA        F:010013
  JSR SoundSystemUpdate                                    ;   37BC B7BC C 20 96 BA        F:010014
  JSR SetFamilyCHRBanks                                    ;   37BF B7BF C 20 01 87        F:010014
  JSR L_1_390B                                    ;   37C2 B7C2 C 20 0B B9        F:010014
  JSR L_0_1A30                                    ;   37C5 B7C5 C 20 30 9A        F:010014
  BCC B_1_37B9                                    ;   37C8 B7C8 C 90 EF           F:010014
  JMP L_2_52B6                                    ;   37CA B7CA C 4C B6 D2        F:010028

L_1_37CD:
  LDA #$0                                         ;   37CD B7CD C A9 00           F:036940
  STA R_0024                                      ;   37CF B7CF C 85 24           F:036940
  STA R_04BC                                      ;   37D1 B7D1 C 8D BC 04        F:036940
  STA R_04BD                                      ;   37D4 B7D4 C 8D BD 04        F:036940
  INC R_0023                                      ;   37D7 B7D7 C E6 23           F:036940
  LDA R_0023                                      ;   37D9 B7D9 C A5 23           F:036940
  CMP #$2                                         ;   37DB B7DB C C9 02           F:036940
  BCS B_1_37E2                                    ;   37DD B7DD C B0 03           F:036940
  JMP L_1_363E                                    ;   37DF B7DF C 4C 3E B6        F:036940

B_1_37E2:
  JSR SetFamilyCHRBanks                                    ;   37E2 B7E2 C 20 01 87        F:038392
  JSR L_1_390B                                    ;   37E5 B7E5 C 20 0B B9        F:038392
  JSR L_1_38FF                                    ;   37E8 B7E8 C 20 FF B8        F:038392
  LDA #$89                                        ;   37EB B7EB C A9 89           F:038392
  STA R_05F9                                      ;   37ED B7ED C 8D F9 05        F:038392
  JSR DelayUntilNMI                                    ;   37F0 B7F0 C 20 F9 CA        F:038392
  JSR SoundSystemUpdate                                    ;   37F3 B7F3 C 20 96 BA        F:038393
  JSR SetFamilyCHRBanks                                    ;   37F6 B7F6 C 20 01 87        F:038393
  JSR L_1_390B                                    ;   37F9 B7F9 C 20 0B B9        F:038393
  LDA #$2                                         ;   37FC B7FC C A9 02           F:038393
  STA R_0021                                      ;   37FE B7FE C 85 21           F:038393
  LDA #$3                                         ;   3800 B800 C A9 03           F:038393
  JSR L_0_19F7                                    ;   3802 B802 C 20 F7 99        F:038393
B_1_3805:
  JSR DelayUntilNMI                                    ;   3805 B805 C 20 F9 CA        F:038393
  JSR SoundSystemUpdate                                    ;   3808 B808 C 20 96 BA        F:038394
  JSR SetFamilyCHRBanks                                    ;   380B B80B C 20 01 87        F:038394
  JSR L_1_390B                                    ;   380E B80E C 20 0B B9        F:038394
  LDA R_0028                                      ;   3811 B811 C A5 28           F:038394
  BNE B_1_3805                                    ;   3813 B813 C D0 F0           F:038394
  LDA #$1                                         ;   3815 B815 C A9 01           F:038573
  STA PaletteDirtyFlag                            ;   3817 B817 C 8D 3D 03        F:038573
  JSR B_1_37B9                                    ;   381A B81A C 20 B9 B7        F:038573
  JMP RunTossupScene                                    ;   381D B81D C 4C F2 B4        F:038588

.byte $20,$FF,$B8,$A9,$89,$8D,$F9,$05             ;   3820 B820 ........  ??????? 
.byte $A9,$01,$85,$21,$A9,$03,$20,$F7             ;   3828 B828 ........ ???!?? ? 
.byte $99,$20,$F9,$CA,$20,$96,$BA,$20             ;   3830 B830 ........ ? ?? ??  
.byte $01,$87,$20,$0B,$B9,$A5,$28,$D0             ;   3838 B838 ........ ?? ???(? 
.byte $F0,$60                                     ;   3840 B840 ..       ?`       
L_1_3842:
  LDA QuestionTopBackgroundTile                   ;   3842 B842 C AD 12 03        F:009830
  BNE B_1_3870                                    ;   3845 B845 C D0 29           F:009830
  LDA ActiveFamily                                ;   3847 B847 C A5 0B           F:009830
  BEQ B_1_3870                                    ;   3849 B849 C F0 25           F:009830
  LDA RNG1                                        ;   384B B84B C AD FA 01        F:009830
  CMP #$80                                        ;   384E B84E C C9 80           F:009830
  BCS B_1_3856                                    ;   3850 B850 C B0 04           F:009830
  LDA #$0                                         ;   3852 B852 . A9 00           
  STA ActiveFamily                                ;   3854 B854 . 85 0B           
B_1_3856:
  LDA #$2                                         ;   3856 B856 C A9 02           F:009830
  STA UserAnswerOperation                         ;   3858 B858 C 8D 70 03        F:009830
  JSR L_0_06D9                                    ;   385B B85B C 20 D9 86        F:009830
  LDA #$9                                         ;   385E B85E C A9 09           F:009830
  STA R_04D6                                      ;   3860 B860 C 8D D6 04        F:009830
  JSR DelayUntilNMI                                    ;   3863 B863 C 20 F9 CA        F:009830
  JSR SoundSystemUpdate                                    ;   3866 B866 C 20 96 BA        F:009831
  JSR SetFamilyCHRBanks                                    ;   3869 B869 C 20 01 87        F:009831
  JSR L_1_390B                                    ;   386C B86C C 20 0B B9        F:009831
  RTS                                             ;   386F B86F C 60              F:009831

B_1_3870:
  LDA #$4                                         ;   3870 B870 C A9 04           F:013652
  JSR SetNMIRoutine                                    ;   3872 B872 C 20 C7 CA        F:013652
  CLC                                             ;   3875 B875 C 18              F:013652
  LDA #$5                                         ;   3876 B876 C A9 05           F:013652
  ADC ActiveFamily                                ;   3878 B878 C 65 0B           F:013652
  STA R_0021                                      ;   387A B87A C 85 21           F:013652
  LDA #$0                                         ;   387C B87C C A9 00           F:013652
  STA R_0371                                      ;   387E B87E C 8D 71 03        F:013652
B_1_3881:
  JSR DelayUntilNMI                                    ;   3881 B881 C 20 F9 CA        F:013652
  JSR SoundSystemUpdate                                    ;   3884 B884 C 20 96 BA        F:013653
  JSR SetFamilyCHRBanks                                    ;   3887 B887 C 20 01 87        F:013653
  JSR L_1_390B                                    ;   388A B88A C 20 0B B9        F:013653
  LDX ActiveFamily                                ;   388D B88D C A6 0B           F:013653
  JSR L_0_1B37                                    ;   388F B88F C 20 37 9B        F:013653
  BCS B_1_3881                                    ;   3892 B892 C B0 ED           F:013653
  LDA JoypadInputsCtl0,X                          ;   3894 B894 C B5 EA           F:013671
  AND #$80                                        ;   3896 B896 C 29 80           F:013671
  BNE B_1_38BC                                    ;   3898 B898 C D0 22           F:013671
  LDA JoypadInputsCtl0,X                          ;   389A B89A C B5 EA           F:013671
  AND #$2                                         ;   389C B89C C 29 02           F:013671
  BNE B_1_38B1                                    ;   389E B89E C D0 11           F:013671
  LDA JoypadInputsCtl0,X                          ;   38A0 B8A0 C B5 EA           F:013671
  AND #$1                                         ;   38A2 B8A2 C 29 01           F:013671
  BEQ B_1_3881                                    ;   38A4 B8A4 C F0 DB           F:013671
  LDA R_0371                                      ;   38A6 B8A6 C AD 71 03        F:018278
  BNE B_1_3881                                    ;   38A9 B8A9 C D0 D6           F:018278
  INC R_0371                                      ;   38AB B8AB C EE 71 03        F:018278
  JMP B_1_3881                                    ;   38AE B8AE C 4C 81 B8        F:018278

B_1_38B1:
  LDA R_0371                                      ;   38B1 B8B1 C AD 71 03        F:052000
  BEQ B_1_3881                                    ;   38B4 B8B4 C F0 CB           F:052000
  DEC R_0371                                      ;   38B6 B8B6 C CE 71 03        F:052000
  JMP B_1_3881                                    ;   38B9 B8B9 C 4C 81 B8        F:052000

B_1_38BC:
  LDA R_0371                                      ;   38BC B8BC C AD 71 03        F:013753
  EOR ActiveFamily                                ;   38BF B8BF C 45 0B           F:013753
  STA ActiveFamily                                ;   38C1 B8C1 C 85 0B           F:013753
  LDA #$7                                         ;   38C3 B8C3 C A9 07           F:013753
  STA R_0021                                      ;   38C5 B8C5 C 85 21           F:013753
  JSR DelayUntilNMI                                    ;   38C7 B8C7 C 20 F9 CA        F:013753
  JSR SoundSystemUpdate                                    ;   38CA B8CA C 20 96 BA        F:013754
  JSR SetFamilyCHRBanks                                    ;   38CD B8CD C 20 01 87        F:013754
  JSR L_1_390B                                    ;   38D0 B8D0 C 20 0B B9        F:013754
  JSR DelayUntilNMI                                    ;   38D3 B8D3 C 20 F9 CA        F:013754
  JSR SoundSystemUpdate                                    ;   38D6 B8D6 C 20 96 BA        F:013755
  JSR SetFamilyCHRBanks                                    ;   38D9 B8D9 C 20 01 87        F:013755
  JSR L_1_390B                                    ;   38DC B8DC C 20 0B B9        F:013755
  LDA #$3                                         ;   38DF B8DF C A9 03           F:013755
  JMP SetNMIRoutine                                    ;   38E1 B8E1 C 4C C7 CA        F:013755

L_1_38E4:
  JSR DelayUntilNMI                                    ;   38E4 B8E4 C 20 F9 CA        F:008607
  JSR SoundSystemUpdate                                    ;   38E7 B8E7 C 20 96 BA        F:008608
  JSR SetFamilyCHRBanks                                    ;   38EA B8EA C 20 01 87        F:008608
  JMP L_1_390B                                    ;   38ED B8ED C 4C 0B B9        F:008608

L_1_38F0:
  STA R_04D6                                      ;   38F0 B8F0 C 8D D6 04        F:008603
  JSR DelayUntilNMI                                    ;   38F3 B8F3 C 20 F9 CA        F:008603
  JSR SoundSystemUpdate                                    ;   38F6 B8F6 C 20 96 BA        F:008604
  JSR SetFamilyCHRBanks                                    ;   38F9 B8F9 C 20 01 87        F:008604
  JMP L_1_390B                                    ;   38FC B8FC C 4C 0B B9        F:008604

L_1_38FF:
  LDA #$FF                                        ;   38FF B8FF C A9 FF           F:008882
  STA R_02F4                                      ;   3901 B901 C 8D F4 02        F:008882
  STA R_02F8                                      ;   3904 B904 C 8D F8 02        F:008882
  STA R_02FC                                      ;   3907 B907 C 8D FC 02        F:008882
  RTS                                             ;   390A B90A C 60              F:008882

L_1_390B:
  JSR L_2_52D6                                    ;   390B B90B C 20 D6 D2        F:008274
  JMP L_2_593E                                    ;   390E B90E C 4C 3E D9        F:008274

D_1_3911:
.byte $07                                         ;   3911 B911 D        ?        F:011744
.byte $02                                         ;   3912 B912 D        ?        F:011377
.byte $03                                         ;   3913 B913 D        ?        F:009582
.byte $08                                         ;   3914 B914 D        ?        F:010275
.byte $0B                                         ;   3915 B915 D        ?        F:010643
.byte $04                                         ;   3916 B916 D        ?        F:011010
.byte $0A,$06                                     ;   3917 B917 DD       ??       F:011744
.byte $00                                         ;   3919 B919 D        ?        F:010275
.byte $05,$09                                     ;   391A B91A DD       ??       F:011744
D_1_391C:
.byte $01                                         ;   391C B91C D        ?        F:010643
.byte $80,$8A,$94,$9E,$A8                         ;   391D B91D .....    ?????    
.byte $B2                                         ;   3922 B922 D        ?        F:009582
.byte $BC                                         ;   3923 B923 .        ?        
.byte $C6                                         ;   3924 B924 D        ?        F:018743
.byte $D0,$DA,$E4,$EE                             ;   3925 B925 ....     ????     
L_1_3929:
  LDA R_0393                                      ;   3929 B929 C AD 93 03        F:009582
  AND #$F                                         ;   392C B92C C 29 0F           F:009582
  STA R_000F                                      ;   392E B92E C 85 0F           F:009582
B_1_3930:
  JSR AdvanceRNG                                    ;   3930 B930 C 20 BB 9B        F:009582
  LDA RNG1                                        ;   3933 B933 C AD FA 01        F:009582
  AND #$F                                         ;   3936 B936 C 29 0F           F:009582
  CMP R_000F                                      ;   3938 B938 C C5 0F           F:009582
  BCS B_1_3930                                    ;   393A B93A C B0 F4           F:009582
  TAX                                             ;   393C B93C C AA              F:009582
B_1_393D:
  LDA D_1_3911,X                                  ;   393D B93D C BD 11 B9        F:009582
  TAX                                             ;   3940 B940 C AA              F:009582
  CMP R_000F                                      ;   3941 B941 C C5 0F           F:009582
  BCS B_1_393D                                    ;   3943 B943 C B0 F8           F:009582
  LDA R_0384,X                                    ;   3945 B945 C BD 84 03        F:009582
  BNE B_1_393D                                    ;   3948 B948 C D0 F3           F:009582
  JSR AdvanceRNG                                    ;   394A B94A C 20 BB 9B        F:009582
  LDA RNG1                                        ;   394D B94D C AD FA 01        F:009582
  LDY R_000F                                      ;   3950 B950 C A4 0F           F:009582
  CMP D_1_391C,Y                                  ;   3952 B952 C D9 1C B9        F:009582
  BCC B_1_395A                                    ;   3955 B955 C 90 03           F:009582
  LDX #$FF                                        ;   3957 B957 C A2 FF           F:011744
  CLC                                             ;   3959 B959 C 18              F:011744
B_1_395A:
  RTS                                             ;   395A B95A C 60              F:009582

L_1_395B:
  LDY #$0                                         ;   395B B95B C A0 00           F:008272
  JSR L_2_528C                                    ;   395D B95D C 20 8C D2        F:008272
  STX R_05C1                                      ;   3960 B960 C 8E C1 05        F:008272
  LDA #$F0                                        ;   3963 B963 C A9 F0           F:008272
  STA EntityYLo,X                                 ;   3965 B965 C 9D CD 05        F:008272
  LDA #$6                                         ;   3968 B968 C A9 06           F:008272
  STA EntityYHi,X                                 ;   396A B96A C 9D CB 05        F:008272
  LDA #$0                                         ;   396D B96D C A9 00           F:008272
  STA EntityXLo,X                                 ;   396F B96F C 9D C9 05        F:008272
  LDA #$5                                         ;   3972 B972 C A9 05           F:008272
  STA EntityXHi,X                                 ;   3974 B974 C 9D C7 05        F:008272
  LDA #$0                                         ;   3977 B977 C A9 00           F:008272
  STA R_05CF,X                                    ;   3979 B979 C 9D CF 05        F:008272
  STA R_05D1,X                                    ;   397C B97C C 9D D1 05        F:008272
  LDY CurrentAnsweringFamilyMember                ;   397F B97F C AC DC 04        F:008272
  LDA D_1_34ED,Y                                  ;   3982 B982 C B9 ED B4        F:008272
  STA R_05C5,X                                    ;   3985 B985 C 9D C5 05        F:008272
  RTS                                             ;   3988 B988 C 60              F:008272

L_1_3989:
  JSR L_2_529D                                    ;   3989 B989 C 20 9D D2        F:008272
  STX R_05C3                                      ;   398C B98C C 8E C3 05        F:008272
  LDA #$12                                        ;   398F B98F C A9 12           F:008272
  STA R_05E5,X                                    ;   3991 B991 C 9D E5 05        F:008272
  LDA #$E                                         ;   3994 B994 C A9 0E           F:008272
  STA R_05E7,X                                    ;   3996 B996 C 9D E7 05        F:008272
  LDY CurrentAnsweringFamilyMember                ;   3999 B999 C AC DC 04        F:008272
  LDA D_1_34ED,Y                                  ;   399C B99C C B9 ED B4        F:008272
  STA R_05E3,X                                    ;   399F B99F C 9D E3 05        F:008272
  RTS                                             ;   39A2 B9A2 C 60              F:008272

L_1_39A3:
  JSR L_2_529D                                    ;   39A3 B9A3 C 20 9D D2        F:008272
  STX R_05C4                                      ;   39A6 B9A6 C 8E C4 05        F:008272
  LDA #$E                                         ;   39A9 B9A9 C A9 0E           F:008272
  STA R_05E5,X                                    ;   39AB B9AB C 9D E5 05        F:008272
  LDA #$E                                         ;   39AE B9AE C A9 0E           F:008272
  STA R_05E7,X                                    ;   39B0 B9B0 C 9D E7 05        F:008272
  LDA #$A1                                        ;   39B3 B9B3 C A9 A1           F:008272
  STA R_05E3,X                                    ;   39B5 B9B5 C 9D E3 05        F:008272
  RTS                                             ;   39B8 B9B8 C 60              F:008272

L_1_39B9:
  LDY #$0                                         ;   39B9 B9B9 C A0 00           F:008272
  JSR L_2_528C                                    ;   39BB B9BB C 20 8C D2        F:008272
  STX R_05C2                                      ;   39BE B9BE C 8E C2 05        F:008272
  LDA #$F0                                        ;   39C1 B9C1 C A9 F0           F:008272
  STA EntityYLo,X                                 ;   39C3 B9C3 C 9D CD 05        F:008272
  LDA #$A                                         ;   39C6 B9C6 C A9 0A           F:008272
  STA EntityYHi,X                                 ;   39C8 B9C8 C 9D CB 05        F:008272
  LDA #$0                                         ;   39CB B9CB C A9 00           F:008272
  STA EntityXLo,X                                 ;   39CD B9CD C 9D C9 05        F:008272
  LDA #$7                                         ;   39D0 B9D0 C A9 07           F:008272
  STA EntityXHi,X                                 ;   39D2 B9D2 C 9D C7 05        F:008272
  LDA #$0                                         ;   39D5 B9D5 C A9 00           F:008272
  STA R_05CF,X                                    ;   39D7 B9D7 C 9D CF 05        F:008272
  STA R_05D1,X                                    ;   39DA B9DA C 9D D1 05        F:008272
  RTS                                             ;   39DD B9DD C 60              F:008272

D_1_39DE:
.byte $00                                         ;   39DE B9DE D        ?        F:008271
.byte $12                                         ;   39DF B9DF D        ?        F:012832
.byte $24                                         ;   39E0 B9E0 D        $        F:017054
.byte $36                                         ;   39E1 B9E1 D        6        F:035077
.byte $48                                         ;   39E2 B9E2 .        H        
D_1_39E3:
.byte $00                                         ;   39E3 B9E3 D        ?        F:008271
.byte $06                                         ;   39E4 B9E4 D        ?        F:047458
.byte $0C                                         ;   39E5 B9E5 D        ?        F:023708
D_1_39E6:
.byte $51,$10,$55,$11,$00,$11                     ;   39E6 B9E6 DDDDDD   Q?U???   F:008271
.byte $51,$10,$DD,$33,$00,$22                     ;   39EC B9EC DDDDDD   Q??3?"   F:047458
.byte $11,$00,$11,$00,$00,$33                     ;   39F2 B9F2 DDDDDD   ?????3   F:023708
.byte $11,$00,$99,$22,$00,$33                     ;   39F8 B9F8 DDDDDD   ???"?3   F:012832
.byte $11,$00,$11,$00,$00,$00                     ;   39FE B9FE DDDDDD   ??????   F:055444
.byte $51,$10,$55,$11,$00,$22                     ;   3A04 BA04 DDDDDD   Q?U??"   F:027956
.byte $51,$10,$D5,$31,$00,$33                     ;   3A0A BA0A DDDDDD   Q??1?3   F:017054
.byte $91,$20,$99,$22,$00,$22                     ;   3A10 BA10 DDDDDD   ? ?"?"   F:062187
.byte $91,$20,$DD,$33,$00,$33                     ;   3A16 BA16 DDDDDD   ? ?3?3   F:031141
.byte $51,$10,$55,$11,$00,$33,$51,$10             ;   3A1C BA1C ........ Q?U??3Q? 
.byte $55,$11,$00,$11                             ;   3A24 BA24 ....     U???     
.byte $D1,$30,$99,$22,$00,$22                     ;   3A28 BA28 DDDDDD   ?0?"?"   F:035077
.byte $D1,$30,$99,$22,$00,$22,$51,$10             ;   3A2E BA2E ........ ?0?"?"Q? 
.byte $55,$11,$00,$22,$51,$10,$55,$11             ;   3A36 BA36 ........ U??"Q?U? 
.byte $00,$11                                     ;   3A3E BA3E ..       ??       
L_1_3A40:
  LDY Family2                                     ;   3A40 BA40 C AC 16 03        F:008271
  LDA D_1_39E3,Y                                  ;   3A43 BA43 C B9 E3 B9        F:008271
  CLC                                             ;   3A46 BA46 C 18              F:008271
  LDX CurrentAnsweringFamilyMember                ;   3A47 BA47 C AE DC 04        F:008271
  ADC D_1_39DE,X                                  ;   3A4A BA4A C 7D DE B9        F:008271
  TAY                                             ;   3A4D BA4D C A8              F:008271
  LDA #$23                                        ;   3A4E BA4E C A9 23           F:008271
  STA PpuAddr_2006                                ;   3A50 BA50 C 8D 06 20        F:008271
  LDA #$DC                                        ;   3A53 BA53 C A9 DC           F:008271
  STA PpuAddr_2006                                ;   3A55 BA55 C 8D 06 20        F:008271
  LDA D_1_39E6,Y                                  ;   3A58 BA58 C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A5B BA5B C 8D 07 20        F:008271
  INY                                             ;   3A5E BA5E C C8              F:008271
  LDA D_1_39E6,Y                                  ;   3A5F BA5F C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A62 BA62 C 8D 07 20        F:008271
  INY                                             ;   3A65 BA65 C C8              F:008271
  LDA #$23                                        ;   3A66 BA66 C A9 23           F:008271
  STA PpuAddr_2006                                ;   3A68 BA68 C 8D 06 20        F:008271
  LDA #$E4                                        ;   3A6B BA6B C A9 E4           F:008271
  STA PpuAddr_2006                                ;   3A6D BA6D C 8D 06 20        F:008271
  LDA D_1_39E6,Y                                  ;   3A70 BA70 C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A73 BA73 C 8D 07 20        F:008271
  INY                                             ;   3A76 BA76 C C8              F:008271
  LDA D_1_39E6,Y                                  ;   3A77 BA77 C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A7A BA7A C 8D 07 20        F:008271
  INY                                             ;   3A7D BA7D C C8              F:008271
  LDA #$23                                        ;   3A7E BA7E C A9 23           F:008271
  STA PpuAddr_2006                                ;   3A80 BA80 C 8D 06 20        F:008271
  LDA #$EC                                        ;   3A83 BA83 C A9 EC           F:008271
  STA PpuAddr_2006                                ;   3A85 BA85 C 8D 06 20        F:008271
  LDA D_1_39E6,Y                                  ;   3A88 BA88 C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A8B BA8B C 8D 07 20        F:008271
  INY                                             ;   3A8E BA8E C C8              F:008271
  LDA D_1_39E6,Y                                  ;   3A8F BA8F C B9 E6 B9        F:008271
  STA PpuData_2007                                ;   3A92 BA92 C 8D 07 20        F:008271
  RTS                                             ;   3A95 BA95 C 60              F:008271

SoundSystemUpdate:
  LDA R_05F9                                      ;   3A96 BA96 C AD F9 05        F:000007
  BEQ B_1_3AF8                                    ;   3A99 BA99 C F0 5D           F:000007
  BPL B_1_3ADF                                    ;   3A9B BA9B C 10 42           F:000007
  AND #$7F                                        ;   3A9D BA9D C 29 7F           F:000007
  STA R_05F9                                      ;   3A9F BA9F C 8D F9 05        F:000007
  ASL                                             ;   3AA2 BAA2 C 0A              F:000007
  STA R_05FF                                      ;   3AA3 BAA3 C 8D FF 05        F:000007
  TAY                                             ;   3AA6 BAA6 C A8              F:000007
  LDA R_0603                                      ;   3AA7 BAA7 C AD 03 06        F:000007
  EOR #$FF                                        ;   3AAA BAAA C 49 FF           F:000007
  AND ApuStatus_4015                              ;   3AAC BAAC C 2D 15 40        F:000007
  STA ApuStatus_4015                              ;   3AAF BAAF C 8D 15 40        F:000007
  LDX R_05F9                                      ;   3AB2 BAB2 C AE F9 05        F:000007
  LDA D_2_44BB,X                                  ;   3AB5 BAB5 C BD BB C4        F:000007
  STA R_05FD                                      ;   3AB8 BAB8 C 8D FD 05        F:000007
  LDA #$1                                         ;   3ABB BABB C A9 01           F:000007
  STA R_0601                                      ;   3ABD BABD C 8D 01 06        F:000007
  LDA #$0                                         ;   3AC0 BAC0 C A9 00           F:000007
  STA R_0603                                      ;   3AC2 BAC2 C 8D 03 06        F:000007
  LDA D_2_44A3,Y                                  ;   3AC5 BAC5 C B9 A3 C4        F:000007
  STA R_00F1                                      ;   3AC8 BAC8 C 85 F1           F:000007
  LDA D_2_44A4,Y                                  ;   3ACA BACA C B9 A4 C4        F:000007
  STA R_00F2                                      ;   3ACD BACD C 85 F2           F:000007
  LDA D_2_448B,Y                                  ;   3ACF BACF C B9 8B C4        F:000007
  STA R_00F5                                      ;   3AD2 BAD2 C 85 F5           F:000007
  LDA D_2_448C,Y                                  ;   3AD4 BAD4 C B9 8C C4        F:000007
  STA R_00F6                                      ;   3AD7 BAD7 C 85 F6           F:000007
  JSR L_1_3CF4                                    ;   3AD9 BAD9 C 20 F4 BC        F:000007
  JMP L_1_3B0F                                    ;   3ADC BADC C 4C 0F BB        F:000007

B_1_3ADF:
  LDA R_05FD                                      ;   3ADF BADF C AD FD 05        F:000008
  BEQ B_1_3AF2                                    ;   3AE2 BAE2 C F0 0E           F:000008
  DEC R_0601                                      ;   3AE4 BAE4 C CE 01 06        F:022392
  BNE B_1_3AF2                                    ;   3AE7 BAE7 C D0 09           F:022392
  LDA R_05FD                                      ;   3AE9 BAE9 C AD FD 05        F:022392
  STA R_0601                                      ;   3AEC BAEC C 8D 01 06        F:022392
  JMP L_1_3B0F                                    ;   3AEF BAEF C 4C 0F BB        F:022392

B_1_3AF2:
  JSR L_1_3CCC                                    ;   3AF2 BAF2 C 20 CC BC        F:000008
  JMP L_1_3B0F                                    ;   3AF5 BAF5 C 4C 0F BB        F:000008

B_1_3AF8:
  LDA R_0603                                      ;   3AF8 BAF8 C AD 03 06        F:000056
  BEQ L_1_3B0F                                    ;   3AFB BAFB C F0 12           F:000056
  LDX #$7                                         ;   3AFD BAFD . A2 07           
B_1_3AFF:
  LDA #$0                                         ;   3AFF BAFF . A9 00           
  STA R_0604,X                                    ;   3B01 BB01 . 9D 04 06        
  JSR $BF71                                       ;   3B04 BB04 . 20 71 BF        
  DEX                                             ;   3B07 BB07 . CA              
  CPX #$4                                         ;   3B08 BB08 . E0 04           
  BPL B_1_3AFF                                    ;   3B0A BB0A . 10 F3           
  JMP $BB0F                                       ;   3B0C BB0C . 4C 0F BB        

L_1_3B0F:
  LDA R_05FA                                      ;   3B0F BB0F C AD FA 05        F:000007
  BEQ B_1_3B66                                    ;   3B12 BB12 C F0 52           F:000007
  BPL B_1_3B51                                    ;   3B14 BB14 . 10 3B           
  AND #$7F                                        ;   3B16 BB16 . 29 7F           
  STA R_05FA                                      ;   3B18 BB18 . 8D FA 05        
  ASL                                             ;   3B1B BB1B . 0A              
  STA R_0600                                      ;   3B1C BB1C . 8D 00 06        
  TAY                                             ;   3B1F BB1F . A8              
  LDA ApuStatus_4015                              ;   3B20 BB20 . AD 15 40        
  AND #$F0                                        ;   3B23 BB23 . 29 F0           
  ORA R_0603                                      ;   3B25 BB25 . 0D 03 06        
  STA ApuStatus_4015                              ;   3B28 BB28 . 8D 15 40        
  LDA $C4A3,Y                                     ;   3B2B BB2B . B9 A3 C4        
  STA R_00EF                                      ;   3B2E BB2E . 85 EF           
  LDA $C4A4,Y                                     ;   3B30 BB30 . B9 A4 C4        
  STA R_00F0                                      ;   3B33 BB33 . 85 F0           
  LDA $C48B,Y                                     ;   3B35 BB35 . B9 8B C4        
  STA R_00F3                                      ;   3B38 BB38 . 85 F3           
  LDA $C48C,Y                                     ;   3B3A BB3A . B9 8C C4        
  STA R_00F4                                      ;   3B3D BB3D . 85 F4           
  LDX R_05FA                                      ;   3B3F BB3F . AE FA 05        
  LDA $C4BB,X                                     ;   3B42 BB42 . BD BB C4        
  STA R_05FE                                      ;   3B45 BB45 . 8D FE 05        
  LDA #$1                                         ;   3B48 BB48 . A9 01           
  STA R_0602                                      ;   3B4A BB4A . 8D 02 06        
  JSR $BCE5                                       ;   3B4D BB4D . 20 E5 BC        
  RTS                                             ;   3B50 BB50 . 60              

B_1_3B51:
  LDA R_05FE                                      ;   3B51 BB51 . AD FE 05        
  BEQ B_1_3B62                                    ;   3B54 BB54 . F0 0C           
  DEC R_0602                                      ;   3B56 BB56 . CE 02 06        
  BNE B_1_3B62                                    ;   3B59 BB59 . D0 07           
  LDA R_05FE                                      ;   3B5B BB5B . AD FE 05        
  STA R_0602                                      ;   3B5E BB5E . 8D 02 06        
  RTS                                             ;   3B61 BB61 . 60              

B_1_3B62:
  JSR $BCB5                                       ;   3B62 BB62 . 20 B5 BC        
  RTS                                             ;   3B65 BB65 . 60              

B_1_3B66:
  LDX #$3                                         ;   3B66 BB66 C A2 03           F:000007
B_1_3B68:
  LDA #$0                                         ;   3B68 BB68 C A9 00           F:000007
  STA R_0604,X                                    ;   3B6A BB6A C 9D 04 06        F:000007
  JSR L_1_3F71                                    ;   3B6D BB6D C 20 71 BF        F:000007
  DEX                                             ;   3B70 BB70 C CA              F:000007
  BPL B_1_3B68                                    ;   3B71 BB71 C 10 F5           F:000007
  RTS                                             ;   3B73 BB73 C 60              F:000007

D_1_3B74:
.byte $2B                                         ;   3B74 BB74 D        +        F:000007
D_1_3B75:
.byte $C4,$43,$C4,$5B,$C4,$73,$C4                 ;   3B75 BB75 DDDDDDD  ?C?[?s?  F:000007
D_1_3B7C:
.byte $03                                         ;   3B7C BB7C D        ?        F:008604
.byte $06                                         ;   3B7D BB7D D        ?        F:000339
.byte $09                                         ;   3B7E BB7E .        ?        
.byte $0C,$12                                     ;   3B7F BB7F DD       ??       F:000321
.byte $15                                         ;   3B81 BB81 .        ?        
.byte $18                                         ;   3B82 BB82 D        ?        F:000321
.byte $24,$2A                                     ;   3B83 BB83 ..       $*       
.byte $30                                         ;   3B85 BB85 D        0        F:000007
.byte $48                                         ;   3B86 BB86 D        H        F:002241
.byte $54                                         ;   3B87 BB87 .        T        
.byte $60                                         ;   3B88 BB88 D        `        F:044166
.byte $90                                         ;   3B89 BB89 D        ?        F:009830
.byte $A8,$02,$03,$04,$06,$07                     ;   3B8A BB8A ......   ??????   
.byte $08                                         ;   3B90 BB90 D        ?        F:044086
.byte $0C,$0E                                     ;   3B91 BB91 ..       ??       
.byte $10                                         ;   3B93 BB93 D        ?        F:044070
.byte $18,$1C,$20,$30,$38                         ;   3B94 BB94 .....    ?? 08    
.byte $FF                                         ;   3B99 BB99 D        ?        F:011988
D_1_3B9A:
.byte $FE                                         ;   3B9A BB9A D        ?        F:000007
.byte $FD                                         ;   3B9B BB9B D        ?        F:000055
.byte $FB                                         ;   3B9C BB9C D        ?        F:000321
.byte $F7                                         ;   3B9D BB9D D        ?        F:009118
.byte $EF,$DF,$BF,$7F                             ;   3B9E BB9E ....     ????     
D_1_3BA2:
.byte $01,$02                                     ;   3BA2 BBA2 DD       ??       F:000007
.byte $04                                         ;   3BA4 BBA4 D        ?        F:000333
.byte $08                                         ;   3BA5 BBA5 D        ?        F:000321
.byte $10,$20,$40,$80                             ;   3BA6 BBA6 ....     ? @?     
D_1_3BAA:
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3BAA BBAA ........ ???????? 
.byte $00,$00,$07,$07,$07,$06,$06                 ;   3BB2 BBB2 .......  ???????  
.byte $05                                         ;   3BB9 BBB9 D        ?        F:000345
.byte $05,$05,$04,$04                             ;   3BBA BBBA ....     ????     
.byte $04                                         ;   3BBE BBBE D        ?        F:000321
.byte $04,$03                                     ;   3BBF BBBF ..       ??       
.byte $03                                         ;   3BC1 BBC1 D        ?        F:000333
.byte $03                                         ;   3BC2 BBC2 .        ?        
.byte $03                                         ;   3BC3 BBC3 D        ?        F:008607
.byte $03,$02                                     ;   3BC4 BBC4 ..       ??       
.byte $02,$02                                     ;   3BC6 BBC6 DD       ??       F:008604
.byte $02                                         ;   3BC8 BBC8 D        ?        F:001467
.byte $02                                         ;   3BC9 BBC9 D        ?        F:011988
.byte $02                                         ;   3BCA BBCA D        ?        F:001089
.byte $02                                         ;   3BCB BBCB D        ?        F:002733
.byte $01                                         ;   3BCC BBCC .        ?        
.byte $01                                         ;   3BCD BBCD D        ?        F:001269
.byte $01                                         ;   3BCE BBCE D        ?        F:008607
.byte $01                                         ;   3BCF BBCF D        ?        F:001263
.byte $01                                         ;   3BD0 BBD0 D        ?        F:001257
.byte $01                                         ;   3BD1 BBD1 D        ?        F:000387
.byte $01,$01                                     ;   3BD2 BBD2 ..       ??       
.byte $01                                         ;   3BD4 BBD4 D        ?        F:000381
.byte $01                                         ;   3BD5 BBD5 .        ?        
.byte $01                                         ;   3BD6 BBD6 D        ?        F:000321
.byte $01                                         ;   3BD7 BBD7 .        ?        
.byte $00                                         ;   3BD8 BBD8 D        ?        F:002319
.byte $00                                         ;   3BD9 BBD9 D        ?        F:000339
.byte $00                                         ;   3BDA BBDA D        ?        F:044118
.byte $00                                         ;   3BDB BBDB D        ?        F:044070
.byte $00                                         ;   3BDC BBDC .        ?        
.byte $00                                         ;   3BDD BBDD D        ?        F:000333
.byte $00                                         ;   3BDE BBDE D        ?        F:022391
.byte $00                                         ;   3BDF BBDF D        ?        F:044166
.byte $00                                         ;   3BE0 BBE0 D        ?        F:022445
.byte $00                                         ;   3BE1 BBE1 .        ?        
.byte $00                                         ;   3BE2 BBE2 D        ?        F:022427
.byte $00                                         ;   3BE3 BBE3 D        ?        F:022445
.byte $00                                         ;   3BE4 BBE4 D        ?        F:038393
.byte $00                                         ;   3BE5 BBE5 D        ?        F:022463
.byte $00                                         ;   3BE6 BBE6 .        ?        
.byte $00                                         ;   3BE7 BBE7 D        ?        F:038393
.byte $00,$00,$00                                 ;   3BE8 BBE8 ...      ???      
.byte $00                                         ;   3BEB BBEB D        ?        F:000007
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3BEC BBEC ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3BF4 BBF4 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3BFC BBFC ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3C04 BC04 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3C0C BC0C ........ ???????? 
.byte $00,$00,$00                                 ;   3C14 BC14 ...      ???      
D_1_3C17:
.byte $00                                         ;   3C17 BC17 D        ?        F:000322
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   3C18 BC18 ........ ???????? 
.byte $00,$EE,$79,$0D,$A8,$4A                     ;   3C20 BC20 ......   ??y??J   
.byte $F0                                         ;   3C26 BC26 D        ?        F:000345
.byte $9A,$4A,$FE,$B6                             ;   3C27 BC27 ....     ?J??     
.byte $72                                         ;   3C2B BC2B D        r        F:000321
.byte $30,$F6                                     ;   3C2C BC2C ..       0?       
.byte $C0                                         ;   3C2E BC2E D        ?        F:000333
.byte $8A                                         ;   3C2F BC2F .        ?        
.byte $56                                         ;   3C30 BC30 D        V        F:008607
.byte $27,$F9                                     ;   3C31 BC31 ..       '?       
.byte $CE,$A6                                     ;   3C33 BC33 DD       ??       F:008604
.byte $7F                                         ;   3C35 BC35 D        ?        F:001467
.byte $5B                                         ;   3C36 BC36 D        [        F:011988
.byte $3A                                         ;   3C37 BC37 D        :        F:001089
.byte $19                                         ;   3C38 BC38 D        ?        F:002733
.byte $FA                                         ;   3C39 BC39 .        ?        
.byte $DF                                         ;   3C3A BC3A D        ?        F:001269
.byte $C3                                         ;   3C3B BC3B D        ?        F:008607
.byte $AA                                         ;   3C3C BC3C D        ?        F:001263
.byte $92                                         ;   3C3D BC3D D        ?        F:001257
.byte $7B                                         ;   3C3E BC3E D        {        F:000387
.byte $66,$51                                     ;   3C3F BC3F ..       fQ       
.byte $3E                                         ;   3C41 BC41 D        >        F:000381
.byte $2C                                         ;   3C42 BC42 .        ,        
.byte $1B                                         ;   3C43 BC43 D        ?        F:000321
.byte $0B                                         ;   3C44 BC44 .        ?        
.byte $FC                                         ;   3C45 BC45 D        ?        F:002319
.byte $EE                                         ;   3C46 BC46 D        ?        F:000339
.byte $E1                                         ;   3C47 BC47 D        ?        F:044118
.byte $D4                                         ;   3C48 BC48 D        ?        F:044070
.byte $C8                                         ;   3C49 BC49 .        ?        
.byte $BD                                         ;   3C4A BC4A D        ?        F:000333
.byte $B2                                         ;   3C4B BC4B D        ?        F:022391
.byte $A8                                         ;   3C4C BC4C D        ?        F:044166
.byte $9E                                         ;   3C4D BC4D D        ?        F:022445
.byte $95                                         ;   3C4E BC4E .        ?        
.byte $8D                                         ;   3C4F BC4F D        ?        F:022427
.byte $85                                         ;   3C50 BC50 D        ?        F:022445
.byte $7D                                         ;   3C51 BC51 D        }        F:038393
.byte $76                                         ;   3C52 BC52 D        v        F:022463
.byte $6F                                         ;   3C53 BC53 .        o        
.byte $69                                         ;   3C54 BC54 D        i        F:038393
.byte $63,$5E,$58                                 ;   3C55 BC55 ...      c^X      
.byte $53                                         ;   3C58 BC58 D        S        F:000007
.byte $4E,$4A,$46,$42,$3E,$3A,$37,$34             ;   3C59 BC59 ........ NJFB>:74 
.byte $31,$2E,$2B,$29,$27,$24,$22,$20             ;   3C61 BC61 ........ 1.+)'$"  
.byte $1E,$1C,$1B,$19,$18,$16,$15,$14             ;   3C69 BC69 ........ ???????? 
.byte $13,$12,$11,$10,$0F,$0E,$0E,$0D             ;   3C71 BC71 ........ ???????? 
.byte $0C,$0B,$0B,$0A,$09,$09,$08,$08             ;   3C79 BC79 ........ ???????? 
.byte $07,$07,$07                                 ;   3C81 BC81 ...      ???      
D_1_3C84:
.byte $00                                         ;   3C84 BC84 .        ?        
.byte $0F                                         ;   3C85 BC85 D        ?        F:000321
.byte $0E,$0D,$0C,$0B                             ;   3C86 BC86 ....     ????     
.byte $0A                                         ;   3C8A BC8A D        ?        F:009094
.byte $09                                         ;   3C8B BC8B D        ?        F:009830
.byte $08,$07,$06,$05,$04,$03,$02,$01             ;   3C8C BC8C ........ ???????? 
.byte $00                                         ;   3C94 BC94 .        ?        
D_1_3C95:
.byte $00                                         ;   3C95 BC95 D        ?        F:044182
.byte $01                                         ;   3C96 BC96 D        ?        F:044071
.byte $02                                         ;   3C97 BC97 D        ?        F:044072
.byte $01                                         ;   3C98 BC98 D        ?        F:044073
.byte $00                                         ;   3C99 BC99 D        ?        F:044074
.byte $FF                                         ;   3C9A BC9A D        ?        F:044075
.byte $FE                                         ;   3C9B BC9B D        ?        F:044076
.byte $FF                                         ;   3C9C BC9C D        ?        F:044077
.byte $00                                         ;   3C9D BC9D D        ?        F:044078
.byte $01                                         ;   3C9E BC9E D        ?        F:044079
.byte $02                                         ;   3C9F BC9F D        ?        F:044080
.byte $01                                         ;   3CA0 BCA0 D        ?        F:044081
.byte $00                                         ;   3CA1 BCA1 D        ?        F:044082
.byte $FF                                         ;   3CA2 BCA2 D        ?        F:044083
.byte $FE                                         ;   3CA3 BCA3 D        ?        F:044084
.byte $FF                                         ;   3CA4 BCA4 D        ?        F:044085
.byte $00,$00,$01,$01,$02,$02,$01,$01             ;   3CA5 BCA5 ........ ???????? 
.byte $00,$00,$FF,$FF,$FE,$FE,$FF,$FF             ;   3CAD BCAD ........ ???????? 
.byte $A2,$04,$CA,$30,$11,$BD,$04,$06             ;   3CB5 BCB5 ........ ???0???? 
.byte $F0,$F8,$20,$24,$BD,$20,$63,$BE             ;   3CBD BCBD ........ ?? $? c? 
.byte $20,$05,$BD,$4C,$B7,$BC,$60                 ;   3CC5 BCC5 .......   ??L??`  
L_1_3CCC:
  LDX #$8                                         ;   3CCC BCCC C A2 08           F:000008
B_1_3CCE:
  DEX                                             ;   3CCE BCCE C CA              F:000008
  CPX #$4                                         ;   3CCF BCCF C E0 04           F:000008
  BMI B_1_3CE4                                    ;   3CD1 BCD1 C 30 11           F:000008
  LDA R_0604,X                                    ;   3CD3 BCD3 C BD 04 06        F:000008
  BEQ B_1_3CCE                                    ;   3CD6 BCD6 C F0 F6           F:000008
  JSR L_1_3D24                                    ;   3CD8 BCD8 C 20 24 BD        F:000008
  JSR L_1_3E63                                    ;   3CDB BCDB C 20 63 BE        F:000008
  JSR L_1_3D05                                    ;   3CDE BCDE C 20 05 BD        F:000008
  JMP B_1_3CCE                                    ;   3CE1 BCE1 C 4C CE BC        F:000008

B_1_3CE4:
  RTS                                             ;   3CE4 BCE4 C 60              F:000008

.byte $A2,$04,$CA,$30,$09,$20,$43,$BD             ;   3CE5 BCE5 ........ ???0? C? 
.byte $20,$05,$BD,$4C,$E7,$BC,$60                 ;   3CED BCED .......   ??L??`  
L_1_3CF4:
  LDX #$8                                         ;   3CF4 BCF4 C A2 08           F:000007
L_1_3CF6:
  DEX                                             ;   3CF6 BCF6 C CA              F:000007
  CPX #$4                                         ;   3CF7 BCF7 C E0 04           F:000007
  BMI B_1_3D04                                    ;   3CF9 BCF9 C 30 09           F:000007
  JSR L_1_3D50                                    ;   3CFB BCFB C 20 50 BD        F:000007
  JSR L_1_3D05                                    ;   3CFE BCFE C 20 05 BD        F:000007
  JMP L_1_3CF6                                    ;   3D01 BD01 C 4C F6 BC        F:000007

B_1_3D04:
  RTS                                             ;   3D04 BD04 C 60              F:000007

L_1_3D05:
  LDA R_00FB                                      ;   3D05 BD05 C A5 FB           F:000007
  STA R_0644,X                                    ;   3D07 BD07 C 9D 44 06        F:000007
  LDA R_00FC                                      ;   3D0A BD0A C A5 FC           F:000007
  STA R_064C,X                                    ;   3D0C BD0C C 9D 4C 06        F:000007
  LDA R_00FE                                      ;   3D0F BD0F C A5 FE           F:000007
  STA R_0654,X                                    ;   3D11 BD11 C 9D 54 06        F:000007
  LDA R_00FD                                      ;   3D14 BD14 C A5 FD           F:000007
  STA R_065C,X                                    ;   3D16 BD16 C 9D 5C 06        F:000007
  LDA R_00F9                                      ;   3D19 BD19 C A5 F9           F:000007
  STA R_0664,X                                    ;   3D1B BD1B C 9D 64 06        F:000007
  LDA R_00FA                                      ;   3D1E BD1E C A5 FA           F:000007
  STA R_066C,X                                    ;   3D20 BD20 C 9D 6C 06        F:000007
  RTS                                             ;   3D23 BD23 C 60              F:000007

L_1_3D24:
  LDA R_0644,X                                    ;   3D24 BD24 C BD 44 06        F:000008
  STA R_00FB                                      ;   3D27 BD27 C 85 FB           F:000008
  LDA R_064C,X                                    ;   3D29 BD29 C BD 4C 06        F:000008
  STA R_00FC                                      ;   3D2C BD2C C 85 FC           F:000008
  LDA R_0654,X                                    ;   3D2E BD2E C BD 54 06        F:000008
  STA R_00FE                                      ;   3D31 BD31 C 85 FE           F:000008
  LDA R_065C,X                                    ;   3D33 BD33 C BD 5C 06        F:000008
  STA R_00FD                                      ;   3D36 BD36 C 85 FD           F:000008
  LDA R_0664,X                                    ;   3D38 BD38 C BD 64 06        F:000008
  STA R_00F9                                      ;   3D3B BD3B C 85 F9           F:000008
  LDA R_066C,X                                    ;   3D3D BD3D C BD 6C 06        F:000008
  STA R_00FA                                      ;   3D40 BD40 C 85 FA           F:000008
  RTS                                             ;   3D42 BD42 C 60              F:000008

.byte $8A,$0A,$A8,$18,$B9,$74,$BB,$6D             ;   3D43 BD43 ........ ?????t?m 
.byte $00,$06,$4C,$5D,$BD                         ;   3D4B BD4B .....    ??L]?    
L_1_3D50:
  TXA                                             ;   3D50 BD50 C 8A              F:000007
  SEC                                             ;   3D51 BD51 C 38              F:000007
  SBC #$4                                         ;   3D52 BD52 C E9 04           F:000007
  ASL                                             ;   3D54 BD54 C 0A              F:000007
  TAY                                             ;   3D55 BD55 C A8              F:000007
  CLC                                             ;   3D56 BD56 C 18              F:000007
  LDA D_1_3B74,Y                                  ;   3D57 BD57 C B9 74 BB        F:000007
  ADC R_05FF                                      ;   3D5A BD5A C 6D FF 05        F:000007
  STA R_00F7                                      ;   3D5D BD5D C 85 F7           F:000007
  LDA D_1_3B75,Y                                  ;   3D5F BD5F C B9 75 BB        F:000007
  ADC #$0                                         ;   3D62 BD62 C 69 00           F:000007
  STA R_00F8                                      ;   3D64 BD64 C 85 F8           F:000007
  LDY #$0                                         ;   3D66 BD66 C A0 00           F:000007
  LDA (R_00F7),Y                                  ;   3D68 BD68 C B1 F7           F:000007
  STA R_00FB                                      ;   3D6A BD6A C 85 FB           F:000007
  INY                                             ;   3D6C BD6C C C8              F:000007
  LDA (R_00F7),Y                                  ;   3D6D BD6D C B1 F7           F:000007
  STA R_00FC                                      ;   3D6F BD6F C 85 FC           F:000007
  LDA #$0                                         ;   3D71 BD71 C A9 00           F:000007
  STA R_00FE                                      ;   3D73 BD73 C 85 FE           F:000007
  STA R_060C,X                                    ;   3D75 BD75 C 9D 0C 06        F:000007
  STA R_0614,X                                    ;   3D78 BD78 C 9D 14 06        F:000007
  STA R_061C,X                                    ;   3D7B BD7B C 9D 1C 06        F:000007
  LDA #$FF                                        ;   3D7E BD7E C A9 FF           F:000007
  STA R_0624,X                                    ;   3D80 BD80 C 9D 24 06        F:000007
  STA R_0604,X                                    ;   3D83 BD83 C 9D 04 06        F:000007
  LDY #$0                                         ;   3D86 BD86 C A0 00           F:000007
  LDA (R_00FB),Y                                  ;   3D88 BD88 C B1 FB           F:000007
  BNE B_1_3D96                                    ;   3D8A BD8A C D0 0A           F:000007
  LDA #$0                                         ;   3D8C BD8C C A9 00           F:000007
  STA R_0604,X                                    ;   3D8E BD8E C 9D 04 06        F:000007
  RTS                                             ;   3D91 BD91 C 60              F:000007

L_1_3D92:
  LDY R_00FE                                      ;   3D92 BD92 C A4 FE           F:000055
  LDA (R_00FB),Y                                  ;   3D94 BD94 C B1 FB           F:000055
B_1_3D96:
  CMP #$1                                         ;   3D96 BD96 C C9 01           F:000007
  BEQ B_1_3DE4                                    ;   3D98 BD98 C F0 4A           F:000007
  CMP #$2                                         ;   3D9A BD9A C C9 02           F:000055
  BEQ B_1_3DB8                                    ;   3D9C BD9C C F0 1A           F:000055
  CMP #$3                                         ;   3D9E BD9E C C9 03           F:000055
  BEQ B_1_3E17                                    ;   3DA0 BDA0 C F0 75           F:000055
  BNE B_1_3DA4                                    ;   3DA2 BDA2 C D0 00           F:000055
B_1_3DA4:
  JSR L_1_3F71                                    ;   3DA4 BDA4 C 20 71 BF        F:000055
  LDA #$0                                         ;   3DA7 BDA7 C A9 00           F:000055
  STA R_0604,X                                    ;   3DA9 BDA9 C 9D 04 06        F:000055
  CPX #$4                                         ;   3DAC BDAC C E0 04           F:000055
  BPL B_1_3DB4                                    ;   3DAE BDAE C 10 04           F:000055
  STA R_05FA                                      ;   3DB0 BDB0 . 8D FA 05        
  RTS                                             ;   3DB3 BDB3 . 60              

B_1_3DB4:
  STA R_05F9                                      ;   3DB4 BDB4 C 8D F9 05        F:000055
  RTS                                             ;   3DB7 BDB7 C 60              F:000055

B_1_3DB8:
  CPX #$0                                         ;   3DB8 BDB8 C E0 00           F:000369
  BNE B_1_3DCA                                    ;   3DBA BDBA C D0 0E           F:000369
  LDA R_05FC                                      ;   3DBC BDBC . AD FC 05        
  BPL B_1_3DDC                                    ;   3DBF BDBF . 10 1B           
  STA R_05FA                                      ;   3DC1 BDC1 . 8D FA 05        
  LDA #$0                                         ;   3DC4 BDC4 . A9 00           
  STA R_05FC                                      ;   3DC6 BDC6 . 8D FC 05        
  RTS                                             ;   3DC9 BDC9 . 60              

B_1_3DCA:
  CPX #$4                                         ;   3DCA BDCA C E0 04           F:000369
  BNE B_1_3DDC                                    ;   3DCC BDCC C D0 0E           F:000369
  LDA R_05FB                                      ;   3DCE BDCE C AD FB 05        F:000369
  BPL B_1_3DDC                                    ;   3DD1 BDD1 C 10 09           F:000369
  STA R_05F9                                      ;   3DD3 BDD3 . 8D F9 05        
  LDA #$0                                         ;   3DD6 BDD6 . A9 00           
  STA R_05FB                                      ;   3DD8 BDD8 . 8D FB 05        
  RTS                                             ;   3DDB BDDB . 60              

B_1_3DDC:
  INY                                             ;   3DDC BDDC C C8              F:000369
  LDA (R_00FB),Y                                  ;   3DDD BDDD C B1 FB           F:000369
  STA R_00FE                                      ;   3DDF BDDF C 85 FE           F:000369
  JMP L_1_3D92                                    ;   3DE1 BDE1 C 4C 92 BD        F:000369

B_1_3DE4:
  INY                                             ;   3DE4 BDE4 C C8              F:000007
  STY R_00FE                                      ;   3DE5 BDE5 C 84 FE           F:000007
  LDA #$0                                         ;   3DE7 BDE7 C A9 00           F:000007
  STA R_00FD                                      ;   3DE9 BDE9 C 85 FD           F:000007
  LDA (R_00FB),Y                                  ;   3DEB BDEB C B1 FB           F:000007
  ASL                                             ;   3DED BDED C 0A              F:000007
  TAY                                             ;   3DEE BDEE C A8              F:000007
  CPX #$4                                         ;   3DEF BDEF C E0 04           F:000007
  BPL B_1_3E04                                    ;   3DF1 BDF1 C 10 11           F:000007
  LDA (R_00F3),Y                                  ;   3DF3 BDF3 . B1 F3           
  INY                                             ;   3DF5 BDF5 . C8              
  CLC                                             ;   3DF6 BDF6 . 18              
  ADC R_00EF                                      ;   3DF7 BDF7 . 65 EF           
  STA R_00F9                                      ;   3DF9 BDF9 . 85 F9           
  LDA (R_00F3),Y                                  ;   3DFB BDFB . B1 F3           
  ADC R_00F0                                      ;   3DFD BDFD . 65 F0           
  STA R_00FA                                      ;   3DFF BDFF . 85 FA           
  JMP $BE12                                       ;   3E01 BE01 . 4C 12 BE        

B_1_3E04:
  LDA (R_00F5),Y                                  ;   3E04 BE04 C B1 F5           F:000007
  INY                                             ;   3E06 BE06 C C8              F:000007
  CLC                                             ;   3E07 BE07 C 18              F:000007
  ADC R_00F1                                      ;   3E08 BE08 C 65 F1           F:000007
  STA R_00F9                                      ;   3E0A BE0A C 85 F9           F:000007
  LDA (R_00F5),Y                                  ;   3E0C BE0C C B1 F5           F:000007
  ADC R_00F2                                      ;   3E0E BE0E C 65 F2           F:000007
  STA R_00FA                                      ;   3E10 BE10 C 85 FA           F:000007
  INC R_00FE                                      ;   3E12 BE12 C E6 FE           F:000007
  JMP L_1_3E6B                                    ;   3E14 BE14 C 4C 6B BE        F:000007

B_1_3E17:
  LDA R_061C,X                                    ;   3E17 BE17 C BD 1C 06        F:008610
  BEQ B_1_3E2B                                    ;   3E1A BE1A C F0 0F           F:008610
  CMP #$1                                         ;   3E1C BE1C C C9 01           F:008616
  BEQ B_1_3E3C                                    ;   3E1E BE1E C F0 1C           F:008616
  DEC R_061C,X                                    ;   3E20 BE20 C DE 1C 06        F:008616
  LDA R_0634,X                                    ;   3E23 BE23 C BD 34 06        F:008616
  STA R_00FE                                      ;   3E26 BE26 C 85 FE           F:008616
  JMP L_1_3D92                                    ;   3E28 BE28 C 4C 92 BD        F:008616

B_1_3E2B:
  INY                                             ;   3E2B BE2B C C8              F:008610
  LDA (R_00FB),Y                                  ;   3E2C BE2C C B1 FB           F:008610
  STA R_0634,X                                    ;   3E2E BE2E C 9D 34 06        F:008610
  STA R_00FE                                      ;   3E31 BE31 C 85 FE           F:008610
  INY                                             ;   3E33 BE33 C C8              F:008610
  LDA (R_00FB),Y                                  ;   3E34 BE34 C B1 FB           F:008610
  STA R_061C,X                                    ;   3E36 BE36 C 9D 1C 06        F:008610
  JMP L_1_3D92                                    ;   3E39 BE39 C 4C 92 BD        F:008610

B_1_3E3C:
  DEC R_061C,X                                    ;   3E3C BE3C C DE 1C 06        F:008664
  INY                                             ;   3E3F BE3F C C8              F:008664
  INY                                             ;   3E40 BE40 C C8              F:008664
  INY                                             ;   3E41 BE41 C C8              F:008664
  STY R_00FE                                      ;   3E42 BE42 C 84 FE           F:008664
  JMP L_1_3D92                                    ;   3E44 BE44 C 4C 92 BD        F:008664

B_1_3E47:
  INC R_00FD                                      ;   3E47 BE47 C E6 FD           F:000007
  AND #$7F                                        ;   3E49 BE49 C 29 7F           F:000007
  ASL                                             ;   3E4B BE4B C 0A              F:000007
  ASL                                             ;   3E4C BE4C C 0A              F:000007
  ASL                                             ;   3E4D BE4D C 0A              F:000007
  STA R_063C,X                                    ;   3E4E BE4E C 9D 3C 06        F:000007
  TAY                                             ;   3E51 BE51 C A8              F:000007
  LDA D_2_40A7,Y                                  ;   3E52 BE52 C B9 A7 C0        F:000007
  AND #$3                                         ;   3E55 BE55 C 29 03           F:000007
  STA R_0624,X                                    ;   3E57 BE57 C 9D 24 06        F:000007
  LDA D_2_40A6,Y                                  ;   3E5A BE5A C B9 A6 C0        F:000007
  STA R_062C,X                                    ;   3E5D BE5D C 9D 2C 06        F:000007
  JMP L_1_3E6B                                    ;   3E60 BE60 C 4C 6B BE        F:000007

L_1_3E63:
  LDA R_060C,X                                    ;   3E63 BE63 C BD 0C 06        F:000008
  BEQ L_1_3E6B                                    ;   3E66 BE66 C F0 03           F:000008
  JMP L_1_3EF5                                    ;   3E68 BE68 C 4C F5 BE        F:000008

L_1_3E6B:
  LDY R_00FD                                      ;   3E6B BE6B C A4 FD           F:000007
  LDA (R_00F9),Y                                  ;   3E6D BE6D C B1 F9           F:000007
  CMP #$FF                                        ;   3E6F BE6F C C9 FF           F:000007
  BNE B_1_3E76                                    ;   3E71 BE71 C D0 03           F:000007
  JMP L_1_3D92                                    ;   3E73 BE73 C 4C 92 BD        F:000055

B_1_3E76:
  CMP #$0                                         ;   3E76 BE76 C C9 00           F:000007
  BMI B_1_3E47                                    ;   3E78 BE78 C 30 CD           F:000007
  BNE B_1_3E84                                    ;   3E7A BE7A C D0 08           F:000007
  JSR L_1_3F71                                    ;   3E7C BE7C C 20 71 BF        F:000321
  LDA #$0                                         ;   3E7F BE7F C A9 00           F:000321
  JMP L_1_3E9C                                    ;   3E81 BE81 C 4C 9C BE        F:000321

B_1_3E84:
  CLC                                             ;   3E84 BE84 C 18              F:000007
  ADC R_062C,X                                    ;   3E85 BE85 C 7D 2C 06        F:000007
  LDY R_0614,X                                    ;   3E88 BE88 C BC 14 06        F:000007
  BEQ L_1_3E9C                                    ;   3E8B BE8B C F0 0F           F:000007
  LDY R_0694,X                                    ;   3E8D BE8D C BC 94 06        F:000345
  BEQ B_1_3E9F                                    ;   3E90 BE90 C F0 0D           F:000345
  TAY                                             ;   3E92 BE92 . A8              
  LDA $BC17,Y                                     ;   3E93 BE93 . B9 17 BC        
  CMP R_069C,X                                    ;   3E96 BE96 . DD 9C 06        
  BNE B_1_3E9F                                    ;   3E99 BE99 . D0 04           
  TYA                                             ;   3E9B BE9B . 98              
L_1_3E9C:
  STA R_0674,X                                    ;   3E9C BE9C C 9D 74 06        F:000007
B_1_3E9F:
  INC R_00FD                                      ;   3E9F BE9F C E6 FD           F:000007
  LDY R_00FD                                      ;   3EA1 BEA1 C A4 FD           F:000007
  LDA (R_00F9),Y                                  ;   3EA3 BEA3 C B1 F9           F:000007
  PHA                                             ;   3EA5 BEA5 C 48              F:000007
  AND #$1F                                        ;   3EA6 BEA6 C 29 1F           F:000007
  TAY                                             ;   3EA8 BEA8 C A8              F:000007
  LDA D_1_3B7C,Y                                  ;   3EA9 BEA9 C B9 7C BB        F:000007
  STA R_060C,X                                    ;   3EAC BEAC C 9D 0C 06        F:000007
  LDA R_0614,X                                    ;   3EAF BEAF C BD 14 06        F:000007
  BNE B_1_3EC1                                    ;   3EB2 BEB2 C D0 0D           F:000007
  LDA R_0674,X                                    ;   3EB4 BEB4 C BD 74 06        F:000007
  BEQ B_1_3EC1                                    ;   3EB7 BEB7 C F0 08           F:000007
  LDA #$0                                         ;   3EB9 BEB9 C A9 00           F:000007
  STA R_0684,X                                    ;   3EBB BEBB C 9D 84 06        F:000007
  JSR L_1_3F97                                    ;   3EBE BEBE C 20 97 BF        F:000007
B_1_3EC1:
  PLA                                             ;   3EC1 BEC1 C 68              F:000007
  TAY                                             ;   3EC2 BEC2 C A8              F:000007
  AND #$40                                        ;   3EC3 BEC3 C 29 40           F:000007
  STA R_0614,X                                    ;   3EC5 BEC5 C 9D 14 06        F:000007
  INC R_00FD                                      ;   3EC8 BEC8 C E6 FD           F:000007
  DEC R_060C,X                                    ;   3ECA BECA C DE 0C 06        F:000007
  TYA                                             ;   3ECD BECD C 98              F:000007
  AND #$20                                        ;   3ECE BECE C 29 20           F:000007
  STA R_0694,X                                    ;   3ED0 BED0 C 9D 94 06        F:000007
  BEQ B_1_3EF4                                    ;   3ED3 BED3 C F0 1F           F:000007
  LDA #$0                                         ;   3ED5 BED5 . A9 00           
  STA R_068C,X                                    ;   3ED7 BED7 . 9D 8C 06        
  LDY R_00FD                                      ;   3EDA BEDA . A4 FD           
  LDA (R_00F9),Y                                  ;   3EDC BEDC . B1 F9           
  CLC                                             ;   3EDE BEDE . 18              
  ADC R_062C,X                                    ;   3EDF BEDF . 7D 2C 06        
  TAY                                             ;   3EE2 BEE2 . A8              
  LDA $BC17,Y                                     ;   3EE3 BEE3 . B9 17 BC        
  STA R_069C,X                                    ;   3EE6 BEE6 . 9D 9C 06        
  TYA                                             ;   3EE9 BEE9 . 98              
  CMP R_0674,X                                    ;   3EEA BEEA . DD 74 06        
  BCC B_1_3EF4                                    ;   3EED BEED . 90 05           
  LDA #$A0                                        ;   3EEF BEEF . A9 A0           
  STA R_0694,X                                    ;   3EF1 BEF1 . 9D 94 06        
B_1_3EF4:
  RTS                                             ;   3EF4 BEF4 C 60              F:000007

L_1_3EF5:
  CMP #$FA                                        ;   3EF5 BEF5 C C9 FA           F:000008
  BCS B_1_3F5E                                    ;   3EF7 BEF7 C B0 65           F:000008
  DEC R_060C,X                                    ;   3EF9 BEF9 C DE 0C 06        F:000008
  LDY R_063C,X                                    ;   3EFC BEFC C BC 3C 06        F:000008
  LDA D_2_40AD,Y                                  ;   3EFF BEFF C B9 AD C0        F:000008
  ORA D_2_40AC,Y                                  ;   3F02 BF02 C 19 AC C0        F:000008
  BEQ B_1_3F51                                    ;   3F05 BF05 C F0 4A           F:000008
  LDY R_0674,X                                    ;   3F07 BF07 C BC 74 06        F:000322
  LDA D_1_3C17,Y                                  ;   3F0A BF0A C B9 17 BC        F:000322
  STA R_06A4                                      ;   3F0D BF0D C 8D A4 06        F:000322
  LDA R_0694,X                                    ;   3F10 BF10 C BD 94 06        F:000322
  BEQ B_1_3F18                                    ;   3F13 BF13 C F0 03           F:000322
  JSR $C059                                       ;   3F15 BF15 . 20 59 C0        
B_1_3F18:
  LDY R_063C,X                                    ;   3F18 BF18 C BC 3C 06        F:000322
  LDA D_2_40AD,Y                                  ;   3F1B BF1B C B9 AD C0        F:000322
  BPL B_1_3F33                                    ;   3F1E BF1E C 10 13           F:000322
  INC R_0684,X                                    ;   3F20 BF20 C FE 84 06        F:044071
  LDA R_0684,X                                    ;   3F23 BF23 C BD 84 06        F:044071
  AND #$F                                         ;   3F26 BF26 C 29 0F           F:044071
  TAY                                             ;   3F28 BF28 C A8              F:044071
  LDA D_1_3C95,Y                                  ;   3F29 BF29 C B9 95 BC        F:044071
  CLC                                             ;   3F2C BF2C C 18              F:044071
  ADC R_06A4                                      ;   3F2D BF2D C 6D A4 06        F:044071
  STA R_06A4                                      ;   3F30 BF30 C 8D A4 06        F:044071
B_1_3F33:
  LDY R_0624,X                                    ;   3F33 BF33 C BC 24 06        F:000322
  CPX #$4                                         ;   3F36 BF36 C E0 04           F:000322
  BPL B_1_3F42                                    ;   3F38 BF38 C 10 08           F:000322
  LDA $BBA2,Y                                     ;   3F3A BF3A . B9 A2 BB        
  AND R_0603                                      ;   3F3D BF3D . 2D 03 06        
  BNE B_1_3F51                                    ;   3F40 BF40 . D0 0F           
B_1_3F42:
  LDA R_06A4                                      ;   3F42 BF42 C AD A4 06        F:000322
  CPY #$0                                         ;   3F45 BF45 C C0 00           F:000322
  BEQ SoundSystemSetPulse1TimerL                                    ;   3F47 BF47 C F0 09           F:000322
  CPY #$1                                         ;   3F49 BF49 C C0 01           F:000322
  BEQ SoundSystemSetPulse2TimerL                                    ;   3F4B BF4B C F0 09           F:000322
  CPY #$2                                         ;   3F4D BF4D C C0 02           F:000322
  BEQ SoundSystemSetTriangleTimerL                                    ;   3F4F BF4F C F0 09           F:000322
B_1_3F51:
  RTS                                             ;   3F51 BF51 C 60              F:000008

SoundSystemSetPulse1TimerL:
  STA Sq0Timer_4002                               ;   3F52 BF52 C 8D 02 40        F:000322
  RTS                                             ;   3F55 BF55 C 60              F:000322

SoundSystemSetPulse2TimerL:
  STA Sq1Timer_4006                               ;   3F56 BF56 C 8D 06 40        F:000322
  RTS                                             ;   3F59 BF59 C 60              F:000322

SoundSystemSetTriangleTimerL:
  STA TrgTimer_400A                               ;   3F5A BF5A C 8D 0A 40        F:000322
  RTS                                             ;   3F5D BF5D C 60              F:000322

B_1_3F5E:
  CPX #$4                                         ;   3F5E BF5E C E0 04           F:011989
  BMI B_1_3F70                                    ;   3F60 BF60 C 30 0E           F:011989
  LDA ApuStatus_4015                              ;   3F62 BF62 C AD 15 40        F:011989
  LDY R_0624,X                                    ;   3F65 BF65 C BC 24 06        F:011989
  AND D_1_3BA2,Y                                  ;   3F68 BF68 C 39 A2 BB        F:011989
  BNE B_1_3F70                                    ;   3F6B BF6B C D0 03           F:011989
  JMP B_1_3DA4                                    ;   3F6D BF6D C 4C A4 BD        F:012069

B_1_3F70:
  RTS                                             ;   3F70 BF70 C 60              F:011989

L_1_3F71:
  LDA R_0624,X                                    ;   3F71 BF71 C BD 24 06        F:000007
  BMI B_1_3F96                                    ;   3F74 BF74 C 30 20           F:000007
  TAY                                             ;   3F76 BF76 C A8              F:000007
  CPX #$4                                         ;   3F77 BF77 C E0 04           F:000007
  BPL B_1_3F84                                    ;   3F79 BF79 C 10 09           F:000007
  LDA D_1_3BA2,Y                                  ;   3F7B BF7B C B9 A2 BB        F:000007
  AND R_0603                                      ;   3F7E BF7E C 2D 03 06        F:000007
  BEQ B_1_3F8D                                    ;   3F81 BF81 C F0 0A           F:000007
  RTS                                             ;   3F83 BF83 C 60              F:000321

B_1_3F84:
  LDA D_1_3B9A,Y                                  ;   3F84 BF84 C B9 9A BB        F:000055
  AND R_0603                                      ;   3F87 BF87 C 2D 03 06        F:000055
  STA R_0603                                      ;   3F8A BF8A C 8D 03 06        F:000055
B_1_3F8D:
  LDA D_1_3B9A,Y                                  ;   3F8D BF8D C B9 9A BB        F:000007
  AND ApuStatus_4015                              ;   3F90 BF90 C 2D 15 40        F:000007
  STA ApuStatus_4015                              ;   3F93 BF93 C 8D 15 40        F:000007
B_1_3F96:
  RTS                                             ;   3F96 BF96 C 60              F:000007

L_1_3F97:
  LDY R_0624,X                                    ;   3F97 BF97 C BC 24 06        F:000007
  CPX #$4                                         ;   3F9A BF9A C E0 04           F:000007
  BPL B_1_3FA7                                    ;   3F9C BF9C C 10 09           F:000007
  LDA $BBA2,Y                                     ;   3F9E BF9E . B9 A2 BB        
  AND R_0603                                      ;   3FA1 BFA1 . 2D 03 06        
  BEQ B_1_3FB0                                    ;   3FA4 BFA4 . F0 0A           
  RTS                                             ;   3FA6 BFA6 . 60              

B_1_3FA7:
  LDA D_1_3BA2,Y                                  ;   3FA7 BFA7 C B9 A2 BB        F:000007
  ORA R_0603                                      ;   3FAA BFAA C 0D 03 06        F:000007
  STA R_0603                                      ;   3FAD BFAD C 8D 03 06        F:000007
B_1_3FB0:
  LDA D_1_3BA2,Y                                  ;   3FB0 BFB0 C B9 A2 BB        F:000007
  ORA ApuStatus_4015                              ;   3FB3 BFB3 C 0D 15 40        F:000007
  STA ApuStatus_4015                              ;   3FB6 BFB6 C 8D 15 40        F:000007
  LDY R_063C,X                                    ;   3FB9 BFB9 C BC 3C 06        F:000007
  LDA R_0624,X                                    ;   3FBC BFBC C BD 24 06        F:000007
  BEQ B_1_3FCC                                    ;   3FBF BFBF C F0 0B           F:000007
  CMP #$1                                         ;   3FC1 BFC1 C C9 01           F:000007
  BEQ B_1_3FF3                                    ;   3FC3 BFC3 C F0 2E           F:000007
  CMP #$2                                         ;   3FC5 BFC5 C C9 02           F:000321
  BEQ B_2_401A                                    ;   3FC7 BFC7 C F0 51           F:000321
  JMP L_2_403B                                    ;   3FC9 BFC9 C 4C 3B C0        F:000321

B_1_3FCC:
  LDA D_2_40A8,Y                                  ;   3FCC BFCC C B9 A8 C0        F:000321
  STA Sq0Duty_4000                                ;   3FCF BFCF C 8D 00 40        F:000321
  LDA D_2_40A9,Y                                  ;   3FD2 BFD2 C B9 A9 C0        F:000321
  STA Sq0Sweep_4001                               ;   3FD5 BFD5 C 8D 01 40        F:000321
  LDY R_0674,X                                    ;   3FD8 BFD8 C BC 74 06        F:000321
  LDA D_1_3C17,Y                                  ;   3FDB BFDB C B9 17 BC        F:000321
  STA Sq0Timer_4002                               ;   3FDE BFDE C 8D 02 40        F:000321
  LDY R_063C,X                                    ;   3FE1 BFE1 C BC 3C 06        F:000321
  LDA D_2_40AB,Y                                  ;   3FE4 BFE4 C B9 AB C0        F:000321
  AND #$F8                                        ;   3FE7 BFE7 C 29 F8           F:000321
  LDY R_0674,X                                    ;   3FE9 BFE9 C BC 74 06        F:000321
  ORA D_1_3BAA,Y                                  ;   3FEC BFEC C 19 AA BB        F:000321
  STA Sq0Length_4003                              ;   3FEF BFEF C 8D 03 40        F:000321
  RTS                                             ;   3FF2 BFF2 C 60              F:000321

B_1_3FF3:
  LDA D_2_40A8,Y                                  ;   3FF3 BFF3 C B9 A8 C0        F:000007
  STA Sq1Duty_4004                                ;   3FF6 BFF6 C 8D 04 40        F:000007
  LDA D_2_40A9,Y                                  ;   3FF9 BFF9 C B9 A9 C0        F:000007
  STA Sq1Sweep_4005                               ;   3FFC BFFC C 8D 05 40        F:000007
L_1_3FFF:
.byte $BC                                         ;   3FFF BFFF .        ?        
  .byte $74,$06                                   ;   4000 C000 C 74 06           F:000000
  LDA D_1_3C17,Y                                  ;   4002 C002 C B9 17 BC        F:000007
  STA Sq1Timer_4006                               ;   4005 C005 C 8D 06 40        F:000007
  LDY R_063C,X                                    ;   4008 C008 C BC 3C 06        F:000007
  LDA D_2_40AB,Y                                  ;   400B C00B C B9 AB C0        F:000007
  AND #$F8                                        ;   400E C00E C 29 F8           F:000007
  LDY R_0674,X                                    ;   4010 C010 C BC 74 06        F:000007
  ORA D_1_3BAA,Y                                  ;   4013 C013 C 19 AA BB        F:000007
  STA Sq1Length_4007                              ;   4016 C016 C 8D 07 40        F:000007
  RTS                                             ;   4019 C019 C 60              F:000007

B_2_401A:
  LDA D_2_40A8,Y                                  ;   401A C01A C B9 A8 C0        F:000333
  STA TrgLinear_4008                              ;   401D C01D C 8D 08 40        F:000333
  LDY R_0674,X                                    ;   4020 C020 C BC 74 06        F:000333
  LDA D_1_3C17,Y                                  ;   4023 C023 C B9 17 BC        F:000333
  STA TrgTimer_400A                               ;   4026 C026 C 8D 0A 40        F:000333
  LDY R_063C,X                                    ;   4029 C029 C BC 3C 06        F:000333
  LDA D_2_40AB,Y                                  ;   402C C02C C B9 AB C0        F:000333
  AND #$F8                                        ;   402F C02F C 29 F8           F:000333
  LDY R_0674,X                                    ;   4031 C031 C BC 74 06        F:000333
  ORA D_1_3BAA,Y                                  ;   4034 C034 C 19 AA BB        F:000333
  STA TrgLength_400B                              ;   4037 C037 C 8D 0B 40        F:000333
  RTS                                             ;   403A C03A C 60              F:000333

L_2_403B:
  LDA D_2_40A8,Y                                  ;   403B C03B C B9 A8 C0        F:000321
  STA NoiseVolume_400C                            ;   403E C03E C 8D 0C 40        F:000321
  LDA D_2_40AA,Y                                  ;   4041 C041 C B9 AA C0        F:000321
  AND #$F0                                        ;   4044 C044 C 29 F0           F:000321
  LDY R_0674,X                                    ;   4046 C046 C BC 74 06        F:000321
  ORA D_1_3C84,Y                                  ;   4049 C049 C 19 84 BC        F:000321
  STA NoisePeriod_400E                            ;   404C C04C C 8D 0E 40        F:000321
  LDY R_063C,X                                    ;   404F C04F C BC 3C 06        F:000321
  LDA D_2_40AB,Y                                  ;   4052 C052 C B9 AB C0        F:000321
  STA NoiseLength_400F                            ;   4055 C055 C 8D 0F 40        F:000321
  RTS                                             ;   4058 C058 C 60              F:000321

.byte $BD,$94,$06,$29,$40,$D0,$22,$BC             ;   4059 C059 ........ ???)@?"? 
.byte $3C,$06,$B9,$AC,$C0,$18,$7D,$8C             ;   4061 C061 ........ <?????}? 
.byte $06,$9D,$8C,$06,$BC,$94,$06,$30             ;   4069 C069 ........ ???????0 
.byte $17,$BC,$74,$06,$79,$17,$BC,$DD             ;   4071 C071 ........ ??t?y??? 
.byte $9C,$06,$90,$08,$A9,$40,$9D,$94             ;   4079 C079 ........ ?????@?? 
.byte $06,$BD,$9C,$06,$8D,$A4,$06,$60             ;   4081 C081 ........ ???????` 
.byte $BC,$74,$06,$B9,$17,$BC,$38,$FD             ;   4089 C089 ........ ?t????8? 
.byte $8C,$06,$DD,$9C,$06,$F0,$02,$B0             ;   4091 C091 ........ ???????? 
.byte $08,$A9,$40,$9D,$94,$06,$BD,$9C             ;   4099 C099 ........ ??@????? 
.byte $06,$8D,$A4,$06,$60                         ;   40A1 C0A1 .....    ????`    
D_2_40A6:
.byte $00                                         ;   40A6 C0A6 D        ?        F:000321
D_2_40A7:
.byte $00                                         ;   40A7 C0A7 D        ?        F:000321
D_2_40A8:
.byte $88                                         ;   40A8 C0A8 D        ?        F:000321
D_2_40A9:
.byte $08                                         ;   40A9 C0A9 D        ?        F:000321
D_2_40AA:
.byte $00                                         ;   40AA C0AA .        ?        
D_2_40AB:
.byte $46                                         ;   40AB C0AB D        F        F:000321
D_2_40AC:
.byte $01                                         ;   40AC C0AC D        ?        F:000322
D_2_40AD:
.byte $00                                         ;   40AD C0AD D        ?        F:000322
.byte $00,$02                                     ;   40AE C0AE DD       ??       F:000321
.byte $F7                                         ;   40B0 C0B0 D        ?        F:000333
.byte $08,$00                                     ;   40B1 C0B1 ..       ??       
.byte $01                                         ;   40B3 C0B3 D        ?        F:000333
.byte $01,$00                                     ;   40B4 C0B4 DD       ??       F:000322
.byte $00,$01,$CF,$00                             ;   40B6 C0B6 DDDD     ????     F:000321
.byte $00                                         ;   40BA C0BA .        ?        
.byte $40                                         ;   40BB C0BB D        @        F:000321
.byte $01,$00                                     ;   40BC C0BC DD       ??       F:000322
.byte $00,$83,$DA,$08,$8A,$41,$00,$00             ;   40BE C0BE ........ ?????A?? 
.byte $F4,$03,$40                                 ;   40C6 C0C6 DDD      ??@      F:000321
.byte $08                                         ;   40C9 C0C9 .        ?        
.byte $00,$08                                     ;   40CA C0CA DD       ??       F:000321
.byte $00,$00                                     ;   40CC C0CC DD       ??       F:000322
.byte $00,$03,$5F                                 ;   40CE C0CE DDD      ??_      F:009094
.byte $08                                         ;   40D1 C0D1 .        ?        
.byte $8A,$40                                     ;   40D2 C0D2 DD       ?@       F:009094
.byte $00,$00                                     ;   40D4 C0D4 DD       ??       F:009095
.byte $00,$01,$8A,$00                             ;   40D6 C0D6 DDDD     ????     F:000007
.byte $00                                         ;   40DA C0DA .        ?        
.byte $41                                         ;   40DB C0DB D        A        F:000007
.byte $00,$00                                     ;   40DC C0DC DD       ??       F:000008
.byte $00,$01,$88,$00,$00,$41,$00,$00             ;   40DE C0DE ........ ?????A?? 
.byte $00,$00,$88,$08,$00,$40,$02,$00             ;   40E6 C0E6 ........ ?????@?? 
.byte $00,$01,$8F,$B6                             ;   40EE C0EE DDDD     ????     F:011988
.byte $00                                         ;   40F2 C0F2 .        ?        
.byte $40                                         ;   40F3 C0F3 D        @        F:011988
.byte $01,$80                                     ;   40F4 C0F4 ..       ??       
.byte $00,$00,$8F,$B6                             ;   40F6 C0F6 DDDD     ????     F:011988
.byte $00                                         ;   40FA C0FA .        ?        
.byte $40                                         ;   40FB C0FB D        @        F:011988
.byte $02,$80                                     ;   40FC C0FC ..       ??       
.byte $00,$00,$58,$00                             ;   40FE C0FE DDDD     ??X?     F:022391
.byte $00                                         ;   4102 C102 .        ?        
.byte $41                                         ;   4103 C103 D        A        F:022391
.byte $00,$00                                     ;   4104 C104 DD       ??       F:022393
.byte $00,$02,$B8                                 ;   4106 C106 DDD      ???      F:022391
.byte $08,$00                                     ;   4109 C109 ..       ??       
.byte $08                                         ;   410B C10B D        ?        F:022391
.byte $00,$00                                     ;   410C C10C DD       ??       F:022393
.byte $00,$01,$98,$00                             ;   410E C10E DDDD     ????     F:022391
.byte $00                                         ;   4112 C112 .        ?        
.byte $41                                         ;   4113 C113 D        A        F:022391
.byte $00,$00                                     ;   4114 C114 DD       ??       F:022393
.byte $00,$01,$98,$00                             ;   4116 C116 DDDD     ????     F:044070
.byte $00                                         ;   411A C11A .        ?        
.byte $C0                                         ;   411B C11B D        ?        F:044070
.byte $00,$80                                     ;   411C C11C DD       ??       F:044071
.byte $00,$02,$98                                 ;   411E C11E DDD      ???      F:044070
.byte $00,$00                                     ;   4121 C121 ..       ??       
.byte $01                                         ;   4123 C123 D        ?        F:044070
.byte $00,$00                                     ;   4124 C124 DD       ??       F:044071
.byte $00,$00,$9F,$19                             ;   4126 C126 DDDD     ????     F:044070
.byte $1D                                         ;   412A C12A .        ?        
.byte $C0                                         ;   412B C12B D        ?        F:044070
.byte $01,$00                                     ;   412C C12C DD       ??       F:044071
.byte $00,$03,$02,$04,$10,$28,$00,$00             ;   412E C12E ........ ?????(?? 
.byte $00,$01,$00,$3E                             ;   4136 C136 DDDD     ???>     F:008604
.byte $9D                                         ;   413A C13A .        ?        
.byte $08                                         ;   413B C13B D        ?        F:008604
.byte $00,$00                                     ;   413C C13C DD       ??       F:008605
.byte $00,$01,$87,$36                             ;   413E C13E DDDD     ???6     F:038393
.byte $0F                                         ;   4142 C142 .        ?        
.byte $0F                                         ;   4143 C143 D        ?        F:038393
.byte $00,$00                                     ;   4144 C144 DD       ??       F:038394
.byte $00,$00,$87,$34                             ;   4146 C146 DDDD     ???4     F:038393
.byte $01                                         ;   414A C14A .        ?        
.byte $08                                         ;   414B C14B D        ?        F:038393
.byte $00,$00                                     ;   414C C14C DD       ??       F:038394
.byte $00,$00,$00,$5B                             ;   414E C14E DDDD     ???[     F:008604
.byte $00                                         ;   4152 C152 .        ?        
.byte $10                                         ;   4153 C153 D        ?        F:008604
.byte $00,$00                                     ;   4154 C154 DD       ??       F:008605
.byte $FD,$03,$9A                                 ;   4156 C156 DDD      ???      F:009830
.byte $08                                         ;   4159 C159 .        ?        
.byte $00,$08                                     ;   415A C15A DD       ??       F:009830
.byte $00,$00                                     ;   415C C15C DD       ??       F:009831
.byte $00,$01,$9F,$D2,$0D,$41,$02,$00             ;   415E C15E ........ ?????A?? 
.byte $13,$00,$96,$5B,$03,$42,$02,$80             ;   4166 C166 ........ ???[?B?? 
.byte $00,$00,$BA,$5B,$24,$10,$00,$00             ;   416E C16E ........ ???[$??? 
.byte $00,$83,$06,$05,$0C,$0B,$00,$00             ;   4176 C176 ........ ???????? 
.byte $00,$00,$0F,$8F,$02,$44,$00,$00             ;   417E C17E ........ ?????D?? 
.byte $00,$00,$80,$8F,$03,$44,$00,$00             ;   4186 C186 ........ ?????D?? 
.byte $00,$00,$8A,$07,$7F,$09,$00,$00             ;   418E C18E ........ ???????? 
.byte $00,$03,$80,$07,$67,$09,$00,$00             ;   4196 C196 ........ ????g??? 
.byte $00,$05,$9B,$0D,$0F,$0C,$00,$00             ;   419E C19E ........ ???????? 
D_2_41A6:
.byte $01,$00                                     ;   41A6 C1A6 DD       ??       F:000321
.byte $02,$00                                     ;   41A8 C1A8 DD       ??       F:000369
D_2_41AA:
.byte $01,$00                                     ;   41AA C1AA DD       ??       F:044070
.byte $00                                         ;   41AC C1AC D        ?        F:044262
D_2_41AD:
.byte $01,$00                                     ;   41AD C1AD DD       ??       F:022391
.byte $00                                         ;   41AF C1AF D        ?        F:022535
.byte $01,$00,$00                                 ;   41B0 C1B0 ...      ???      
D_2_41B3:
.byte $01,$00                                     ;   41B3 C1B3 DD       ??       F:000007
.byte $00                                         ;   41B5 C1B5 D        ?        F:000055
D_2_41B6:
.byte $01,$00                                     ;   41B6 C1B6 DD       ??       F:011988
.byte $00,$01,$00,$00                             ;   41B8 C1B8 ....     ????     
D_2_41BC:
.byte $01,$00                                     ;   41BC C1BC DD       ??       F:008604
.byte $03,$00,$09                                 ;   41BE C1BE DDD      ???      F:008610
.byte $00                                         ;   41C1 C1C1 D        ?        F:008664
D_2_41C2:
.byte $01,$00                                     ;   41C2 C1C2 DD       ??       F:038393
.byte $00                                         ;   41C4 C1C4 D        ?        F:038471
D_2_41C5:
.byte $01,$00                                     ;   41C5 C1C5 DD       ??       F:009830
.byte $00                                         ;   41C7 C1C7 D        ?        F:009974
D_2_41C8:
.byte $01,$00                                     ;   41C8 C1C8 DD       ??       F:009094
.byte $00                                         ;   41CA C1CA D        ?        F:009118
D_2_41CB:
.byte $01,$01                                     ;   41CB C1CB DD       ??       F:000321
.byte $02,$00                                     ;   41CD C1CD DD       ??       F:000369
D_2_41CF:
.byte $01,$01                                     ;   41CF C1CF DD       ??       F:044070
.byte $00                                         ;   41D1 C1D1 D        ?        F:044262
D_2_41D2:
.byte $01,$01                                     ;   41D2 C1D2 DD       ??       F:022391
.byte $00                                         ;   41D4 C1D4 D        ?        F:022535
.byte $01,$01,$00                                 ;   41D5 C1D5 ...      ???      
D_2_41D8:
.byte $00                                         ;   41D8 C1D8 D        ?        F:000007
D_2_41D9:
.byte $01,$01                                     ;   41D9 C1D9 DD       ??       F:011988
.byte $00,$01,$01,$00                             ;   41DB C1DB ....     ????     
D_2_41DF:
.byte $01,$01                                     ;   41DF C1DF DD       ??       F:008604
.byte $03,$00,$09                                 ;   41E1 C1E1 DDD      ???      F:008610
.byte $00                                         ;   41E4 C1E4 D        ?        F:008664
D_2_41E5:
.byte $01,$01                                     ;   41E5 C1E5 DD       ??       F:038393
.byte $00                                         ;   41E7 C1E7 D        ?        F:038471
D_2_41E8:
.byte $00                                         ;   41E8 C1E8 D        ?        F:009830
D_2_41E9:
.byte $00                                         ;   41E9 C1E9 D        ?        F:009094
D_2_41EA:
.byte $01,$02                                     ;   41EA C1EA DD       ??       F:000321
.byte $01,$02                                     ;   41EC C1EC DD       ??       F:000417
.byte $01,$02                                     ;   41EE C1EE DD       ??       F:000513
.byte $01,$02                                     ;   41F0 C1F0 DD       ??       F:000609
.byte $01,$03                                     ;   41F2 C1F2 DD       ??       F:000705
.byte $01,$03                                     ;   41F4 C1F4 DD       ??       F:000801
.byte $01,$02                                     ;   41F6 C1F6 DD       ??       F:000897
.byte $01,$02                                     ;   41F8 C1F8 DD       ??       F:000993
.byte $01,$04                                     ;   41FA C1FA DD       ??       F:001089
.byte $01,$04                                     ;   41FC C1FC DD       ??       F:001473
.byte $01,$02                                     ;   41FE C1FE DD       ??       F:001857
.byte $01,$02                                     ;   4200 C200 DD       ??       F:001953
.byte $01,$02                                     ;   4202 C202 DD       ??       F:002049
.byte $01,$02                                     ;   4204 C204 DD       ??       F:002145
.byte $01,$05                                     ;   4206 C206 DD       ??       F:002241
.byte $01,$05                                     ;   4208 C208 DD       ??       F:002433
.byte $01,$06                                     ;   420A C20A DD       ??       F:002625
.byte $01,$04                                     ;   420C C20C DD       ??       F:002817
.byte $01,$04                                     ;   420E C20E DD       ??       F:003201
.byte $01,$02                                     ;   4210 C210 DD       ??       F:003585
.byte $01,$02                                     ;   4212 C212 DD       ??       F:003681
.byte $01,$02                                     ;   4214 C214 DD       ??       F:003777
.byte $01,$02                                     ;   4216 C216 DD       ??       F:003873
.byte $02,$00                                     ;   4218 C218 DD       ??       F:003969
D_2_421A:
.byte $01,$02                                     ;   421A C21A DD       ??       F:044070
.byte $00                                         ;   421C C21C D        ?        F:044262
D_2_421D:
.byte $01,$02                                     ;   421D C21D DD       ??       F:022391
.byte $00                                         ;   421F C21F D        ?        F:022535
.byte $01,$02,$01,$02,$01,$03,$00                 ;   4220 C220 .......  ???????  
D_2_4227:
.byte $00                                         ;   4227 C227 D        ?        F:000007
D_2_4228:
.byte $00                                         ;   4228 C228 D        ?        F:011988
.byte $00                                         ;   4229 C229 .        ?        
D_2_422A:
.byte $00                                         ;   422A C22A D        ?        F:008604
D_2_422B:
.byte $00                                         ;   422B C22B D        ?        F:038393
D_2_422C:
.byte $00                                         ;   422C C22C D        ?        F:009830
D_2_422D:
.byte $00                                         ;   422D C22D D        ?        F:009094
D_2_422E:
.byte $01,$07                                     ;   422E C22E DD       ??       F:000321
.byte $02,$00                                     ;   4230 C230 DD       ??       F:000417
D_2_4232:
.byte $00                                         ;   4232 C232 D        ?        F:044070
D_2_4233:
.byte $00                                         ;   4233 C233 D        ?        F:022391
.byte $00                                         ;   4234 C234 .        ?        
D_2_4235:
.byte $00                                         ;   4235 C235 D        ?        F:000007
D_2_4236:
.byte $00                                         ;   4236 C236 D        ?        F:011988
.byte $00                                         ;   4237 C237 .        ?        
D_2_4238:
.byte $00                                         ;   4238 C238 D        ?        F:008604
D_2_4239:
.byte $00                                         ;   4239 C239 D        ?        F:038393
D_2_423A:
.byte $00                                         ;   423A C23A D        ?        F:009830
D_2_423B:
.byte $00                                         ;   423B C23B D        ?        F:009094
D_2_423C:
.byte $00,$00,$0A,$00,$14,$00                     ;   423C C23C DDDDDD   ??????   F:000321
.byte $26,$00                                     ;   4242 C242 DD       &?       F:000705
.byte $37,$00                                     ;   4244 C244 DD       7?       F:001089
.byte $90,$00                                     ;   4246 C246 DD       ??       F:002241
.byte $A3,$00                                     ;   4248 C248 DD       ??       F:002625
.byte $BA,$00                                     ;   424A C24A DD       ??       F:000321
D_2_424C:
.byte $00,$00,$12,$00,$24,$00                     ;   424C C24C DDDDDD   ????$?   F:044070
D_2_4252:
.byte $00,$00,$10,$00,$20,$00                     ;   4252 C252 DDDDDD   ???? ?   F:022391
.byte $00,$00,$1C,$00,$32,$00,$3C,$00             ;   4258 C258 ........ ????2?<? 
D_2_4260:
.byte $00,$00                                     ;   4260 C260 DD       ??       F:000007
D_2_4262:
.byte $00,$00,$04,$00                             ;   4262 C262 DDDD     ????     F:011988
.byte $00,$00,$06,$00                             ;   4266 C266 ....     ????     
D_2_426A:
.byte $00,$00,$06,$00                             ;   426A C26A DDDD     ????     F:008604
D_2_426E:
.byte $00,$00,$0E,$00                             ;   426E C26E DDDD     ????     F:038393
D_2_4272:
.byte $00,$00                                     ;   4272 C272 DD       ??       F:009830
D_2_4274:
.byte $00,$00                                     ;   4274 C274 DD       ??       F:009094
.byte $80,$14,$03                                 ;   4276 C276 DDD      ???      F:000321
.byte $17,$03                                     ;   4279 C279 DD       ??       F:000333
.byte $0F,$03                                     ;   427B C27B DD       ??       F:000345
.byte $17,$03                                     ;   427D C27D DD       ??       F:000357
.byte $FF                                         ;   427F C27F D        ?        F:000369
.byte $81,$00,$03                                 ;   4280 C280 DDD      ???      F:000321
.byte $33,$03                                     ;   4283 C283 DD       3?       F:000333
.byte $00,$03                                     ;   4285 C285 DD       ??       F:000345
.byte $33,$03                                     ;   4287 C287 DD       3?       F:000357
.byte $FF                                         ;   4289 C289 D        ?        F:000369
.byte $82,$2C,$04                                 ;   428A C28A DDD      ?,?      F:000321
.byte $2F,$41                                     ;   428D C28D DD       /A       F:000339
.byte $2F,$03                                     ;   428F C28F DD       /?       F:000345
.byte $2C,$43                                     ;   4291 C291 DD       ,C       F:000357
.byte $2C,$03                                     ;   4293 C293 DD       ,?       F:000369
.byte $2A,$01                                     ;   4295 C295 DD       *?       F:000381
.byte $27,$01                                     ;   4297 C297 DD       '?       F:000387
.byte $2C,$06                                     ;   4299 C299 DD       ,?       F:000393
.byte $FF                                         ;   429B C29B D        ?        F:000417
.byte $2A,$03                                     ;   429C C29C DD       *?       F:000705
.byte $2C,$03                                     ;   429E C29E DD       ,?       F:000717
.byte $2C,$03                                     ;   42A0 C2A0 DD       ,?       F:000729
.byte $2C,$03                                     ;   42A2 C2A2 DD       ,?       F:000741
.byte $2C,$03                                     ;   42A4 C2A4 DD       ,?       F:000753
.byte $2C,$03                                     ;   42A6 C2A6 DD       ,?       F:000765
.byte $2C,$03                                     ;   42A8 C2A8 DD       ,?       F:000777
.byte $2C,$03                                     ;   42AA C2AA DD       ,?       F:000789
.byte $FF                                         ;   42AC C2AC D        ?        F:000801
.byte $20,$03                                     ;   42AD C2AD DD        ?       F:001089
.byte $2C,$03                                     ;   42AF C2AF DD       ,?       F:001101
.byte $2A,$03                                     ;   42B1 C2B1 DD       *?       F:001113
.byte $2C,$43                                     ;   42B3 C2B3 DD       ,C       F:001125
.byte $2C,$03                                     ;   42B5 C2B5 DD       ,?       F:001137
.byte $2A,$01                                     ;   42B7 C2B7 DD       *?       F:001149
.byte $27,$01                                     ;   42B9 C2B9 DD       '?       F:001155
.byte $2A,$03                                     ;   42BB C2BB DD       *?       F:001161
.byte $2C,$03                                     ;   42BD C2BD DD       ,?       F:001173
.byte $20,$03                                     ;   42BF C2BF DD        ?       F:001185
.byte $2C,$03                                     ;   42C1 C2C1 DD       ,?       F:001197
.byte $2A,$03                                     ;   42C3 C2C3 DD       *?       F:001209
.byte $2C,$43                                     ;   42C5 C2C5 DD       ,C       F:001221
.byte $2C,$03                                     ;   42C7 C2C7 DD       ,?       F:001233
.byte $2A,$01                                     ;   42C9 C2C9 DD       *?       F:001245
.byte $27,$01                                     ;   42CB C2CB DD       '?       F:001251
.byte $26,$01                                     ;   42CD C2CD DD       &?       F:001257
.byte $25,$01                                     ;   42CF C2CF DD       %?       F:001263
.byte $23,$03                                     ;   42D1 C2D1 DD       #?       F:001269
.byte $20,$03                                     ;   42D3 C2D3 DD        ?       F:001281
.byte $2C,$03                                     ;   42D5 C2D5 DD       ,?       F:001293
.byte $2A,$03                                     ;   42D7 C2D7 DD       *?       F:001305
.byte $2C,$43                                     ;   42D9 C2D9 DD       ,C       F:001317
.byte $2C,$03                                     ;   42DB C2DB DD       ,?       F:001329
.byte $2A,$01                                     ;   42DD C2DD DD       *?       F:001341
.byte $27,$01                                     ;   42DF C2DF DD       '?       F:001347
.byte $2A,$03                                     ;   42E1 C2E1 DD       *?       F:001353
.byte $2C,$03                                     ;   42E3 C2E3 DD       ,?       F:001365
.byte $2F,$01                                     ;   42E5 C2E5 DD       /?       F:001377
.byte $2C,$01                                     ;   42E7 C2E7 DD       ,?       F:001383
.byte $2A,$01                                     ;   42E9 C2E9 DD       *?       F:001389
.byte $2C,$01                                     ;   42EB C2EB DD       ,?       F:001395
.byte $2A,$01                                     ;   42ED C2ED DD       *?       F:001401
.byte $27,$01                                     ;   42EF C2EF DD       '?       F:001407
.byte $26,$01                                     ;   42F1 C2F1 DD       &?       F:001413
.byte $25,$01                                     ;   42F3 C2F3 DD       %?       F:001419
.byte $23,$01                                     ;   42F5 C2F5 DD       #?       F:001425
.byte $20,$01                                     ;   42F7 C2F7 DD        ?       F:001431
.byte $23,$01                                     ;   42F9 C2F9 DD       #?       F:001437
.byte $25,$01                                     ;   42FB C2FB DD       %?       F:001443
.byte $26,$01                                     ;   42FD C2FD DD       &?       F:001449
.byte $25,$01                                     ;   42FF C2FF DD       %?       F:001455
.byte $23,$01                                     ;   4301 C301 DD       #?       F:001461
.byte $1E,$01                                     ;   4303 C303 DD       ??       F:001467
.byte $FF                                         ;   4305 C305 D        ?        F:001473
.byte $2C,$0A                                     ;   4306 C306 DD       ,?       F:002241
.byte $2F,$01                                     ;   4308 C308 DD       /?       F:002313
.byte $2E,$01                                     ;   430A C30A DD       .?       F:002319
.byte $00,$01                                     ;   430C C30C DD       ??       F:002325
.byte $2C,$41                                     ;   430E C30E DD       ,A       F:002331
.byte $2C,$0A                                     ;   4310 C310 DD       ,?       F:002337
.byte $00,$01                                     ;   4312 C312 DD       ??       F:002409
.byte $27,$01                                     ;   4314 C314 DD       '?       F:002415
.byte $2A,$03                                     ;   4316 C316 DD       *?       F:002421
.byte $FF                                         ;   4318 C318 D        ?        F:002433
.byte $2C,$04                                     ;   4319 C319 DD       ,?       F:002625
.byte $2A,$04                                     ;   431B C31B DD       *?       F:002643
.byte $27,$03                                     ;   431D C31D DD       '?       F:002661
.byte $2A,$04                                     ;   431F C31F DD       *?       F:002673
.byte $27,$04                                     ;   4321 C321 DD       '?       F:002691
.byte $25,$03                                     ;   4323 C323 DD       %?       F:002709
.byte $27,$01                                     ;   4325 C325 DD       '?       F:002721
.byte $25,$01                                     ;   4327 C327 DD       %?       F:002727
.byte $21,$43                                     ;   4329 C329 DD       !C       F:002733
.byte $21,$09                                     ;   432B C32B DD       !?       F:002745
.byte $20,$06                                     ;   432D C32D DD        ?       F:002793
.byte $FF                                         ;   432F C32F D        ?        F:002817
.byte $84,$0D,$06                                 ;   4330 C330 DDD      ???      F:000321
.byte $09,$06                                     ;   4333 C333 DD       ??       F:000345
.byte $0D,$06                                     ;   4335 C335 DD       ??       F:000369
.byte $09,$06                                     ;   4337 C337 DD       ??       F:000393
.byte $FF                                         ;   4339 C339 D        ?        F:000417
.byte $8E,$31,$17                                 ;   433A C33A DDD      ?1?      F:044070
.byte $31,$14                                     ;   433D C33D DD       1?       F:044086
.byte $31,$14                                     ;   433F C33F DD       1?       F:044094
.byte $31,$17                                     ;   4341 C341 DD       1?       F:044102
.byte $33,$17                                     ;   4343 C343 DD       3?       F:044118
.byte $31,$17                                     ;   4345 C345 DD       1?       F:044134
.byte $33,$17                                     ;   4347 C347 DD       3?       F:044150
.byte $35,$0C                                     ;   4349 C349 DD       5?       F:044166
.byte $FF                                         ;   434B C34B D        ?        F:044262
.byte $8F,$2E,$17                                 ;   434C C34C DDD      ?.?      F:044070
.byte $2E,$14                                     ;   434F C34F DD       .?       F:044086
.byte $2E,$14                                     ;   4351 C351 DD       .?       F:044094
.byte $2E,$17                                     ;   4353 C353 DD       .?       F:044102
.byte $30,$17                                     ;   4355 C355 DD       0?       F:044118
.byte $2E,$17                                     ;   4357 C357 DD       .?       F:044134
.byte $30,$17                                     ;   4359 C359 DD       0?       F:044150
.byte $31,$0C                                     ;   435B C35B DD       1?       F:044166
.byte $FF                                         ;   435D C35D D        ?        F:044262
.byte $90,$2A,$17                                 ;   435E C35E DDD      ?*?      F:044070
.byte $2A,$14                                     ;   4361 C361 DD       *?       F:044086
.byte $2A,$14                                     ;   4363 C363 DD       *?       F:044094
.byte $2A,$17                                     ;   4365 C365 DD       *?       F:044102
.byte $2C,$17                                     ;   4367 C367 DD       ,?       F:044118
.byte $2A,$17                                     ;   4369 C369 DD       *?       F:044134
.byte $2C,$17                                     ;   436B C36B DD       ,?       F:044150
.byte $2C,$0C                                     ;   436D C36D DD       ,?       F:044166
.byte $FF                                         ;   436F C36F D        ?        F:044262
.byte $8B,$34,$03                                 ;   4370 C370 DDD      ?4?      F:022391
.byte $34,$01                                     ;   4373 C373 DD       4?       F:022409
.byte $34,$01                                     ;   4375 C375 DD       4?       F:022418
.byte $38,$03                                     ;   4377 C377 DD       8?       F:022427
.byte $39,$03                                     ;   4379 C379 DD       9?       F:022445
.byte $3B,$06                                     ;   437B C37B DD       ;?       F:022463
.byte $3B,$06                                     ;   437D C37D DD       ;?       F:022499
.byte $FF                                         ;   437F C37F D        ?        F:022535
.byte $8C,$2F,$03                                 ;   4380 C380 DDD      ?/?      F:022391
.byte $2F,$01                                     ;   4383 C383 DD       /?       F:022409
.byte $2F,$01                                     ;   4385 C385 DD       /?       F:022418
.byte $34,$03                                     ;   4387 C387 DD       4?       F:022427
.byte $36,$03                                     ;   4389 C389 DD       6?       F:022445
.byte $38,$06                                     ;   438B C38B DD       8?       F:022463
.byte $38,$06                                     ;   438D C38D DD       8?       F:022499
.byte $FF                                         ;   438F C38F D        ?        F:022535
.byte $8D,$1C,$06                                 ;   4390 C390 DDD      ???      F:022391
.byte $21,$03                                     ;   4393 C393 DD       !?       F:022427
.byte $23,$03                                     ;   4395 C395 DD       #?       F:022445
.byte $1C,$06                                     ;   4397 C397 DD       ??       F:022463
.byte $1C,$06                                     ;   4399 C399 DD       ??       F:022499
.byte $FF                                         ;   439B C39B D        ?        F:022535
.byte $98,$28,$06,$28,$14,$28,$14,$28             ;   439C C39C ........ ?(?(?(?( 
.byte $14,$2C,$06,$2C,$14,$2C,$14,$2C             ;   43A4 C3A4 ........ ?,?,?,?, 
.byte $14,$2F,$03,$28,$03,$2C,$03,$2F             ;   43AC C3AC ........ ?/?(?,?/ 
.byte $03,$34,$09,$FF,$81,$00,$09,$34             ;   43B4 C3B4 ........ ?4?????4 
.byte $06,$34,$14,$34,$14,$34,$14,$38             ;   43BC C3BC ........ ?4?4?4?8 
.byte $03,$2F,$03,$34,$03,$38,$03,$3B             ;   43C4 C3C4 ........ ?/?4?8?; 
.byte $09,$FF,$97,$10,$06,$10,$14,$10             ;   43CC C3CC ........ ???????? 
.byte $14,$10,$14,$FF,$10,$03,$10,$03             ;   43D4 C3D4 ........ ???????? 
.byte $10,$03,$10,$03,$10,$09,$FF                 ;   43DC C3DC .......  ???????  
.byte $86,$41,$09                                 ;   43E3 C3E3 DDD      ?A?      F:000007
.byte $FF                                         ;   43E6 C3E6 D        ?        F:000055
.byte $89,$20,$1D                                 ;   43E7 C3E7 DDD      ? ?      F:011988
.byte $FF                                         ;   43EA C3EA .        ?        
.byte $8A,$1F,$1D                                 ;   43EB C3EB DDD      ???      F:011988
.byte $FF,$87,$35,$03,$31,$0C,$FF,$88             ;   43EE C3EE ........ ??5?1??? 
.byte $38,$03,$35,$0C,$FF                         ;   43F6 C3F6 .....    8?5??    
.byte $92,$1D,$00                                 ;   43FB C3FB DDD      ???      F:008604
.byte $19,$00                                     ;   43FE C3FE DD       ??       F:008607
.byte $FF                                         ;   4400 C400 D        ?        F:008610
.byte $95,$1C,$00                                 ;   4401 C401 DDD      ???      F:008604
.byte $24,$00                                     ;   4404 C404 DD       $?       F:008607
.byte $FF                                         ;   4406 C406 D        ?        F:008610
.byte $93,$3D,$01                                 ;   4407 C407 DDD      ?=?      F:038393
.byte $3A,$01                                     ;   440A C40A DD       :?       F:038399
.byte $3D,$01                                     ;   440C C40C DD       =?       F:038405
.byte $3A,$01                                     ;   440E C40E DD       :?       F:038411
.byte $3D,$01                                     ;   4410 C410 DD       =?       F:038417
.byte $3A,$09                                     ;   4412 C412 DD       :?       F:038423
.byte $FF                                         ;   4414 C414 D        ?        F:038471
.byte $94,$3A,$01                                 ;   4415 C415 DDD      ?:?      F:038393
.byte $36,$01                                     ;   4418 C418 DD       6?       F:038399
.byte $3A,$01                                     ;   441A C41A DD       :?       F:038405
.byte $36,$01                                     ;   441C C41C DD       6?       F:038411
.byte $3A,$01                                     ;   441E C41E DD       :?       F:038417
.byte $36,$09                                     ;   4420 C420 DD       6?       F:038423
.byte $FF                                         ;   4422 C422 D        ?        F:038471
.byte $96,$0A,$0D                                 ;   4423 C423 DDD      ???      F:009830
.byte $FF                                         ;   4426 C426 D        ?        F:009974
.byte $85,$06,$06                                 ;   4427 C427 DDD      ???      F:009094
.byte $FF                                         ;   442A C42A D        ?        F:009118
.byte $00,$00                                     ;   442B C42B DD       ??       F:008134
.addr D_2_41A6                                    ;   442D C42D N A6 C1
.addr D_2_41AA                                    ;   442F C42F N AA C1
.addr D_2_41AD                                    ;   4431 C431 N AD C1
.byte $B0,$C1                                     ;   4433 C433 ..       ??       
.addr D_2_41B3                                    ;   4435 C435 N B3 C1
.addr D_2_41B6                                    ;   4437 C437 N B6 C1
.byte $B9,$C1                                     ;   4439 C439 ..       ??       
.addr D_2_41BC                                    ;   443B C43B N BC C1
.addr D_2_41C2                                    ;   443D C43D N C2 C1
.addr D_2_41C5                                    ;   443F C43F N C5 C1
.addr D_2_41C8                                    ;   4441 C441 N C8 C1
.byte $00,$00                                     ;   4443 C443 DD       ??       F:008134
.addr D_2_41CB                                    ;   4445 C445 N CB C1
.addr D_2_41CF                                    ;   4447 C447 N CF C1
.addr D_2_41D2                                    ;   4449 C449 N D2 C1
.byte $D5,$C1                                     ;   444B C44B ..       ??       
.addr D_2_41D8                                    ;   444D C44D N D8 C1
.addr D_2_41D9                                    ;   444F C44F N D9 C1
.byte $DC,$C1                                     ;   4451 C451 ..       ??       
.addr D_2_41DF                                    ;   4453 C453 N DF C1
.addr D_2_41E5                                    ;   4455 C455 N E5 C1
.addr D_2_41E8                                    ;   4457 C457 N E8 C1
.addr D_2_41E9                                    ;   4459 C459 N E9 C1
.byte $00,$00                                     ;   445B C45B DD       ??       F:008134
.addr D_2_41EA                                    ;   445D C45D N EA C1
.addr D_2_421A                                    ;   445F C45F N 1A C2
.addr D_2_421D                                    ;   4461 C461 N 1D C2
.byte $20,$C2                                     ;   4463 C463 ..        ?       
.addr D_2_4227                                    ;   4465 C465 N 27 C2
.addr D_2_4228                                    ;   4467 C467 N 28 C2
.byte $29,$C2                                     ;   4469 C469 ..       )?       
.addr D_2_422A                                    ;   446B C46B N 2A C2
.addr D_2_422B                                    ;   446D C46D N 2B C2
.addr D_2_422C                                    ;   446F C46F N 2C C2
.addr D_2_422D                                    ;   4471 C471 N 2D C2
.byte $00,$00                                     ;   4473 C473 DD       ??       F:008134
.addr D_2_422E                                    ;   4475 C475 N 2E C2
.addr D_2_4232                                    ;   4477 C477 N 32 C2
.addr D_2_4233                                    ;   4479 C479 N 33 C2
.byte $34,$C2                                     ;   447B C47B ..       4?       
.addr D_2_4235                                    ;   447D C47D N 35 C2
.addr D_2_4236                                    ;   447F C47F N 36 C2
.byte $37,$C2                                     ;   4481 C481 ..       7?       
.addr D_2_4238                                    ;   4483 C483 N 38 C2
.addr D_2_4239                                    ;   4485 C485 N 39 C2
.addr D_2_423A                                    ;   4487 C487 N 3A C2
.addr D_2_423B                                    ;   4489 C489 N 3B C2
D_2_448B:
.byte $00                                         ;   448B C48B D        ?        F:008134
D_2_448C:
.byte $00                                         ;   448C C48C D        ?        F:008134
.addr D_2_423C                                    ;   448D C48D N 3C C2
.addr D_2_424C                                    ;   448F C48F N 4C C2
.addr D_2_4252                                    ;   4491 C491 N 52 C2
.byte $58,$C2                                     ;   4493 C493 ..       X?       
.addr D_2_4260                                    ;   4495 C495 N 60 C2
.addr D_2_4262                                    ;   4497 C497 N 62 C2
.byte $66,$C2                                     ;   4499 C499 ..       f?       
.addr D_2_426A                                    ;   449B C49B N 6A C2
.addr D_2_426E                                    ;   449D C49D N 6E C2
.addr D_2_4272                                    ;   449F C49F N 72 C2
.addr D_2_4274                                    ;   44A1 C4A1 N 74 C2
D_2_44A3:
.byte $00                                         ;   44A3 C4A3 D        ?        F:008134
D_2_44A4:
.byte $00                                         ;   44A4 C4A4 D        ?        F:008134
.byte $76,$C2                                     ;   44A5 C4A5 DD       v?       F:000321
.byte $3A,$C3                                     ;   44A7 C4A7 DD       :?       F:044070
.byte $70,$C3                                     ;   44A9 C4A9 DD       p?       F:022391
.byte $9C,$C3                                     ;   44AB C4AB ..       ??       
.byte $E3,$C3                                     ;   44AD C4AD DD       ??       F:000007
.byte $E7,$C3                                     ;   44AF C4AF DD       ??       F:011988
.byte $EF,$C3                                     ;   44B1 C4B1 ..       ??       
.byte $FB,$C3                                     ;   44B3 C4B3 DD       ??       F:008604
.byte $07,$C4                                     ;   44B5 C4B5 DD       ??       F:038393
.byte $23,$C4                                     ;   44B7 C4B7 DD       #?       F:009830
.byte $27,$C4                                     ;   44B9 C4B9 DD       '?       F:009094
D_2_44BB:
.byte $00                                         ;   44BB C4BB D        ?        F:008134
.byte $00                                         ;   44BC C4BC D        ?        F:000321
.byte $00                                         ;   44BD C4BD D        ?        F:044070
.byte $03                                         ;   44BE C4BE D        ?        F:022391
.byte $00                                         ;   44BF C4BF .        ?        
.byte $00                                         ;   44C0 C4C0 D        ?        F:000007
.byte $00                                         ;   44C1 C4C1 D        ?        F:011988
.byte $00                                         ;   44C2 C4C2 .        ?        
.byte $00                                         ;   44C3 C4C3 D        ?        F:008604
.byte $00                                         ;   44C4 C4C4 D        ?        F:038393
.byte $00                                         ;   44C5 C4C5 D        ?        F:009830
.byte $00                                         ;   44C6 C4C6 D        ?        F:009094
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   44C7 C4C7 ........ ???????? 
.byte $00,$00,$00,$00,$00                         ;   44CF C4CF .....    ?????    
D_2_44D4:
.byte $2D                                         ;   44D4 C4D4 D        -        F:044057
.byte $2B,$9A,$9B,$9C                             ;   44D5 C4D5 ....     +???     
.byte $9D                                         ;   44D9 C4D9 D        ?        F:044057
.byte $9E,$9F                                     ;   44DA C4DA ..       ??       
.byte $A0                                         ;   44DC C4DC D        ?        F:070663
.byte $2C                                         ;   44DD C4DD .        ,        
D_2_44DE:
.byte $2F                                         ;   44DE C4DE D        /        F:044057
RunEndOfGameMenu:
  JSR PPUHideAllAndWaitForNMI                                    ;   44DF C4DF C 20 C0 99        F:044054
  LDA #$1                                         ;   44E2 C4E2 C A9 01           F:044055
  STA PaletteDirtyFlag                            ;   44E4 C4E4 C 8D 3D 03        F:044055
  JSR L_2_52B6                                    ;   44E7 C4E7 C 20 B6 D2        F:044055
  LDA #$1                                         ;   44EA C4EA C A9 01           F:044055
  JSR SetNMIRoutine                                    ;   44EC C4EC C 20 C7 CA        F:044055
  SEC                                             ;   44EF C4EF C 38              F:044055
  LDA R_0313                                      ;   44F0 C4F0 C AD 13 03        F:044055
  SBC #$20                                        ;   44F3 C4F3 C E9 20           F:044055
  LDA R_0314                                      ;   44F5 C4F5 C AD 14 03        F:044055
  SBC #$4E                                        ;   44F8 C4F8 C E9 4E           F:044055
  BCC B_2_4501                                    ;   44FA C4FA C 90 05           F:044055
  LDA #$0                                         ;   44FC C4FC . A9 00           
  STA R_01FD                                      ;   44FE C4FE . 8D FD 01        
B_2_4501:
  LDA #$0                                         ;   4501 C501 C A9 00           F:044055
  ADC #$B                                         ;   4503 C503 C 69 0B           F:044055
  LDX #$0                                         ;   4505 C505 C A2 00           F:044055
  STX PPUNametable                                ;   4507 C507 C 8E 44 03        F:044055
  LDY #$0                                         ;   450A C50A C A0 00           F:044055
  JSR SetNewBackground                                    ;   450C C50C C 20 07 A3        F:044055
  LDA #$0                                         ;   450F C50F C A9 00           F:044057
  STA R_001F                                      ;   4511 C511 C 85 1F           F:044057
  LDA #$F                                         ;   4513 C513 C A9 0F           F:044057
  STA R_0026                                      ;   4515 C515 C 85 26           F:044057
  STA R_0027                                      ;   4517 C517 C 85 27           F:044057
  LDA #$B                                         ;   4519 C519 C A9 0B           F:044057
  JSR MMC1SetCHR1                                    ;   451B C51B C 20 68 99        F:044057
  JSR MoveSpritesOffscreen                                    ;   451E C51E C 20 D5 99        F:044057
  LDA #$FF                                        ;   4521 C521 C A9 FF           F:044057
  STA SprYPos                                     ;   4523 C523 C 8D 00 02        F:044057
  LDA BGActive                                    ;   4526 C526 C AD 45 03        F:044057
  CMP #$B                                         ;   4529 C529 C C9 0B           F:044057
  BNE B_2_4572                                    ;   452B C52B C D0 45           F:044057
  LDA #$23                                        ;   452D C52D C A9 23           F:044057
  STA PpuAddr_2006                                ;   452F C52F C 8D 06 20        F:044057
  LDA #$AC                                        ;   4532 C532 C A9 AC           F:044057
  STA PpuAddr_2006                                ;   4534 C534 C 8D 06 20        F:044057
  LDA #$0                                         ;   4537 C537 C A9 00           F:044057
  LDX #$B                                         ;   4539 C539 C A2 0B           F:044057
B_2_453B:
  STA PpuData_2007                                ;   453B C53B C 8D 07 20        F:044057
  DEX                                             ;   453E C53E C CA              F:044057
  BNE B_2_453B                                    ;   453F C53F C D0 FA           F:044057
  LDA #$10                                        ;   4541 C541 C A9 10           F:044057
  JSR BCDConverter                                    ;   4543 C543 C 20 5E AA        F:044057
  LDA #$23                                        ;   4546 C546 C A9 23           F:044057
  STA PpuAddr_2006                                ;   4548 C548 C 8D 06 20        F:044057
  LDA #$12                                        ;   454B C54B C A9 12           F:044057
  STA PpuAddr_2006                                ;   454D C54D C 8D 06 20        F:044057
  LDX #$0                                         ;   4550 C550 C A2 00           F:044057
B_2_4552:
  LDA BCDOutput,X                                 ;   4552 C552 C BD BE 04        F:044057
  CMP #$20                                        ;   4555 C555 C C9 20           F:044057
  BEQ B_2_456D                                    ;   4557 C557 C F0 14           F:044057
  SEC                                             ;   4559 C559 C 38              F:044057
  SBC #$30                                        ;   455A C55A C E9 30           F:044057
  TAY                                             ;   455C C55C C A8              F:044057
  LDA D_2_44D4,Y                                  ;   455D C55D C B9 D4 C4        F:044057
  STA PpuData_2007                                ;   4560 C560 C 8D 07 20        F:044057
  CPX #$1                                         ;   4563 C563 C E0 01           F:044057
  BNE B_2_456D                                    ;   4565 C565 C D0 06           F:044057
  LDA D_2_44DE                                    ;   4567 C567 C AD DE C4        F:044057
  STA PpuData_2007                                ;   456A C56A C 8D 07 20        F:044057
B_2_456D:
  INX                                             ;   456D C56D C E8              F:044057
  CPX #$5                                         ;   456E C56E C E0 05           F:044057
  BNE B_2_4552                                    ;   4570 C570 C D0 E0           F:044057
B_2_4572:
  JSR L_0_1A0B                                    ;   4572 C572 C 20 0B 9A        F:044057
  JSR PPUMASKShowSprites                                    ;   4575 C575 C 20 B9 99        F:044057
  JSR PPUMASKShowBackground                                    ;   4578 C578 C 20 AB 99        F:044057
  JSR PPUCTRLEnableNMI                                    ;   457B C57B C 20 EF CA        F:044057
  JSR L_0_1A15                                    ;   457E C57E C 20 15 9A        F:044057
  LDA BGActive                                    ;   4581 C581 C AD 45 03        F:044069
  CMP #$B                                         ;   4584 C584 C C9 0B           F:044069
  BEQ B_2_459F                                    ;   4586 C586 C F0 17           F:044069
  LDA #$A                                         ;   4588 C588 . A9 0A           
  JSR L_0_19F7                                    ;   458A C58A . 20 F7 99        
  LDA #$84                                        ;   458D C58D . A9 84           
  STA R_05F9                                      ;   458F C58F . 8D F9 05        
B_2_4592:
  JSR $CAF9                                       ;   4592 C592 . 20 F9 CA        
  JSR $BA96                                       ;   4595 C595 . 20 96 BA        
  LDA R_0028                                      ;   4598 C598 . A5 28           
  BNE B_2_4592                                    ;   459A C59A . D0 F6           
  JMP B_0_1A27                                    ;   459C C59C . 4C 27 9A        

B_2_459F:
  LDA #$82                                        ;   459F C59F C A9 82           F:044069
  STA R_05F9                                      ;   45A1 C5A1 C 8D F9 05        F:044069
  LDA #$F                                         ;   45A4 C5A4 C A9 0F           F:044069
  JSR L_0_19F7                                    ;   45A6 C5A6 C 20 F7 99        F:044069
B_2_45A9:
  JSR DelayUntilNMI                                    ;   45A9 C5A9 C 20 F9 CA        F:044069
  JSR SoundSystemUpdate                                    ;   45AC C5AC C 20 96 BA        F:044070
  LDA R_0028                                      ;   45AF C5AF C A5 28           F:044070
  BEQ B_2_45BA                                    ;   45B1 C5B1 C F0 07           F:044070
  LDX ActiveFamily                                ;   45B3 C5B3 C A6 0B           F:044070
  JSR L_0_1B37                                    ;   45B5 C5B5 C 20 37 9B        F:044070
  BCS B_2_45A9                                    ;   45B8 C5B8 C B0 EF           F:044070
B_2_45BA:
  JSR B_0_1A27                                    ;   45BA C5BA C 20 27 9A        F:044969
  JSR PPUHideAllAndWaitForNMI                                    ;   45BD C5BD C 20 C0 99        F:044981
  LDA #$6                                         ;   45C0 C5C0 C A9 06           F:044982
  JSR SetNMIRoutine                                    ;   45C2 C5C2 C 20 C7 CA        F:044982
  LDA #$0                                         ;   45C5 C5C5 C A9 00           F:044982
  STA R_000E                                      ;   45C7 C5C7 C 85 0E           F:044982
  STA R_000F                                      ;   45C9 C5C9 C 85 0F           F:044982
  LDA #$4F                                        ;   45CB C5CB C A9 4F           F:044982
  STA R_0204                                      ;   45CD C5CD C 8D 04 02        F:044982
  LDA #$33                                        ;   45D0 C5D0 C A9 33           F:044982
  STA R_0205                                      ;   45D2 C5D2 C 8D 05 02        F:044982
  LDA #$2                                         ;   45D5 C5D5 C A9 02           F:044982
  STA R_0206                                      ;   45D7 C5D7 C 8D 06 02        F:044982
  LDA #$28                                        ;   45DA C5DA C A9 28           F:044982
  STA R_0207                                      ;   45DC C5DC C 8D 07 02        F:044982
  LDX #$0                                         ;   45DF C5DF C A2 00           F:044982
  STX PPUNametable                                ;   45E1 C5E1 C 8E 44 03        F:044982
  LDA #$12                                        ;   45E4 C5E4 C A9 12           F:044982
  LDY #$0                                         ;   45E6 C5E6 C A0 00           F:044982
  JSR SetNewBackground                                    ;   45E8 C5E8 C 20 07 A3        F:044982
  LDA #$21                                        ;   45EB C5EB C A9 21           F:044984
  STA PpuAddr_2006                                ;   45ED C5ED C 8D 06 20        F:044984
  LDA #$45                                        ;   45F0 C5F0 C A9 45           F:044984
  STA PpuAddr_2006                                ;   45F2 C5F2 C 8D 06 20        F:044984
  LDA #$0                                         ;   45F5 C5F5 C A9 00           F:044984
  STA PpuData_2007                                ;   45F7 C5F7 C 8D 07 20        F:044984
  JSR L_0_1A0B                                    ;   45FA C5FA C 20 0B 9A        F:044984
  JSR PPUMASKShowSprites                                    ;   45FD C5FD C 20 B9 99        F:044984
  JSR PPUMASKShowBackground                                    ;   4600 C600 C 20 AB 99        F:044984
  JSR PPUCTRLEnableNMI                                    ;   4603 C603 C 20 EF CA        F:044984
  JSR L_0_1A15                                    ;   4606 C606 C 20 15 9A        F:044984
B_2_4609:
  JSR DelayUntilNMI                                    ;   4609 C609 C 20 F9 CA        F:044996
  JSR SoundSystemUpdate                                    ;   460C C60C C 20 96 BA        F:044997
  LDX ActiveFamily                                ;   460F C60F C A6 0B           F:044997
  JSR L_0_1B37                                    ;   4611 C611 C 20 37 9B        F:044997
  BCS B_2_4609                                    ;   4614 C614 C B0 F3           F:044997
  LDA a:JoypadInputsCtl0,X                        ;   4616 C616 C BD EA 00        F:045110
  AND #$4                                         ;   4619 C619 C 29 04           F:045110
  BNE B_2_463A                                    ;   461B C61B C D0 1D           F:045110
  LDA a:JoypadInputsCtl0,X                        ;   461D C61D C BD EA 00        F:045125
  AND #$8                                         ;   4620 C620 C 29 08           F:045125
  BNE B_2_4657                                    ;   4622 C622 C D0 33           F:045125
  LDA a:JoypadInputsCtl0,X                        ;   4624 C624 C BD EA 00        F:045357
  AND #$10                                        ;   4627 C627 C 29 10           F:045357
  BEQ B_2_4609                                    ;   4629 C629 C F0 DE           F:045357
  LDA R_000E                                      ;   462B C62B C A5 0E           F:045357
  EOR #$1                                         ;   462D C62D C 49 01           F:045357
  STA R_01FD                                      ;   462F C62F C 8D FD 01        F:045357
  LDA #$1                                         ;   4632 C632 C A9 01           F:045357
  JSR SetNMIRoutine                                    ;   4634 C634 C 20 C7 CA        F:045357
  JMP B_0_1A27                                    ;   4637 C637 C 4C 27 9A        F:045357

B_2_463A:
  CLC                                             ;   463A C63A C 18              F:045110
  LDA R_0204                                      ;   463B C63B C AD 04 02        F:045110
  ADC #$40                                        ;   463E C63E C 69 40           F:045110
  STA R_0204                                      ;   4640 C640 C 8D 04 02        F:045110
  INC R_000E                                      ;   4643 C643 C E6 0E           F:045110
  LDA R_000E                                      ;   4645 C645 C A5 0E           F:045110
  CMP #$2                                         ;   4647 C647 C C9 02           F:045110
  BNE B_2_4654                                    ;   4649 C649 C D0 09           F:045110
  LDA #$4F                                        ;   464B C64B . A9 4F           
  STA R_0204                                      ;   464D C64D . 8D 04 02        
  LDA #$0                                         ;   4650 C650 . A9 00           
  STA R_000E                                      ;   4652 C652 . 85 0E           
B_2_4654:
  JMP B_2_4609                                    ;   4654 C654 C 4C 09 C6        F:045110

B_2_4657:
  SEC                                             ;   4657 C657 C 38              F:045125
  LDA R_0204                                      ;   4658 C658 C AD 04 02        F:045125
  SBC #$40                                        ;   465B C65B C E9 40           F:045125
  STA R_0204                                      ;   465D C65D C 8D 04 02        F:045125
  DEC R_000E                                      ;   4660 C660 C C6 0E           F:045125
  LDA R_000E                                      ;   4662 C662 C A5 0E           F:045125
  CMP #$FF                                        ;   4664 C664 C C9 FF           F:045125
  BNE B_2_4671                                    ;   4666 C666 C D0 09           F:045125
  LDA #$8F                                        ;   4668 C668 . A9 8F           
  STA R_0204                                      ;   466A C66A . 8D 04 02        
  LDA #$1                                         ;   466D C66D . A9 01           
  STA R_000E                                      ;   466F C66F . 85 0E           
B_2_4671:
  JMP B_2_4609                                    ;   4671 C671 C 4C 09 C6        F:045125

RunMainGame:
  ldx #$EF                                        ; reset stack
  txs
  jsr RunTitleScene
  jsr RunMainMenuScene

@KeepPlaying:
  ldx #$EF                                        ; reset stack
  txs
  jsr InitializeGameMemory
: lda RNG1                                        ; hang while rng byte is clear (advanced in nmi)
  beq :-
  sta CurrentQuestion                             ; set the question seed based on rng state
  lda RNG2
  and #$01
  sta CurrentQuestion+1
  jsr FindQuestionLocationFar
  jsr AdvanceRNG                                  ; advance rng one step to pick fast money
: lda RNG1                                        ; hang while rng byte is clear (advanced in nmi)
  beq :-
  sta CurrentFMQuestion                           ; set the fast money seed based on rng state
  lda RNG2
  and #$01
  sta CurrentFMQuestion+1
  jsr FindFMQuestionLocationFar
  jsr ResetRound
  jsr RunFamilyNamingScene
@B_2_46B2:
  LDA #$3                                         ;   46B2 C6B2 C A9 03           F:008129
  JSR RunStageScene                                    ;   46B4 C6B4 C 20 07 C9        F:008129
  JSR RunTossupScene                                    ;   46B7 C6B7 C 20 F2 B4        F:008266
  LDA #$0                                         ;   46BA C6BA C A9 00           F:010028
  STA CurrentAnsweringFamilyMember                ;   46BC C6BC C 8D DC 04        F:010028
  JSR RunDisplayFamilyScene                                    ;   46BF C6BF C 20 99 90        F:010028
  JSR L_1_2216                                    ;   46C2 C6C2 C 20 16 A2        F:012354
  JSR QuestionEnding                                    ;   46C5 C6C5 C 20 7A C8        F:012690
  BCC @B_2_46B2                                    ;   46C8 C6C8 C 90 E8           F:012690
  LDA #$8A                                        ;   46CA C6CA C A9 8A           F:041478
  STA R_05F9                                      ;   46CC C6CC C 8D F9 05        F:041478
  LDA #$5                                         ;   46CF C6CF C A9 05           F:041478
  JSR RunStageScene                                    ;   46D1 C6D1 C 20 07 C9        F:041478
  LDA #$1                                         ;   46D4 C6D4 C A9 01           F:041618
  STA QuestionVisible                             ;   46D6 C6D6 C 8D E2 04        F:041618
  JSR RunDisplayFamilyScene                                    ;   46D9 C6D9 C 20 99 90        F:041618
  JSR RunFastMoneyScene                                    ;   46DC C6DC C 20 34 A6        F:041638
  LDA #$0                                         ;   46DF C6DF C A9 00           F:043917
  STA QuestionVisible                             ;   46E1 C6E1 C 8D E2 04        F:043917
  LDA #$8A                                        ;   46E4 C6E4 C A9 8A           F:043917
  STA R_05F9                                      ;   46E6 C6E6 C 8D F9 05        F:043917
  LDA #$7                                         ;   46E9 C6E9 C A9 07           F:043917
  JSR RunStageScene                                    ;   46EB C6EB C 20 07 C9        F:043917
  JSR RunEndOfGameMenu                                    ;   46EE C6EE C 20 DF C4        F:044054
  LDA R_01FD                                      ;   46F1 C6F1 C AD FD 01        F:045372
  BNE @KeepPlaying                                    ;   46F4 C6F4 C D0 87           F:045372
  JMP $C674                                       ;   46F6 C6F6 . 4C 74 C6        

RunCopyrightScene:
  JSR PPUHideAll                                    ;   46F9 C6F9 C 20 CC 99        F:000004
  LDA #$1                                         ;   46FC C6FC C A9 01           F:000004
  STA PaletteDirtyFlag                            ;   46FE C6FE C 8D 3D 03        F:000004
  JSR SetNMIRoutine                                    ;   4701 C701 C 20 C7 CA        F:000004
  LDX #$0                                         ;   4704 C704 C A2 00           F:000004
  STX R_001F                                      ;   4706 C706 C 86 1F           F:000004
  STX PPUNametable                                ;   4708 C708 C 8E 44 03        F:000004
  TXA                                             ;   470B C70B C 8A              F:000004
  TAY                                             ;   470C C70C C A8              F:000004
  JSR SetNewBackground                                    ;   470D C70D C 20 07 A3        F:000004
  LDA #$5                                         ;   4710 C710 C A9 05           F:000006
  JSR L_0_19F7                                    ;   4712 C712 C 20 F7 99        F:000006
  LDA #$85                                        ;   4715 C715 C A9 85           F:000006
  STA R_05F9                                      ;   4717 C717 C 8D F9 05        F:000006
  JSR L_0_1A0B                                    ;   471A C71A C 20 0B 9A        F:000006
  JSR L_0_1A15                                    ;   471D C71D C 20 15 9A        F:000006
B_2_4720:
  JSR DelayUntilNMI                                    ;   4720 C720 C 20 F9 CA        F:000016
  JSR SoundSystemUpdate                                    ;   4723 C723 C 20 96 BA        F:000017
  LDA R_0028                                      ;   4726 C726 C A5 28           F:000017
  BNE B_2_4720                                    ;   4728 C728 C D0 F6           F:000017
B_2_472A:
  JSR DelayUntilNMI                                    ;   472A C72A C 20 F9 CA        F:000306
  JSR SoundSystemUpdate                                    ;   472D C72D C 20 96 BA        F:000307
  JSR L_0_1A30                                    ;   4730 C730 C 20 30 9A        F:000307
  BCC B_2_472A                                    ;   4733 C733 C 90 F5           F:000307
  RTS                                             ;   4735 C735 C 60              F:000318

RunTitleScene:
  JSR PPUHideAll                                    ;   4736 C736 C 20 CC 99        F:000318
  LDA #$2                                         ;   4739 C739 C A9 02           F:000318
  JSR SetNMIRoutine                                    ;   473B C73B C 20 C7 CA        F:000318
  LDA #$1                                         ;   473E C73E C A9 01           F:000318
  STA PaletteDirtyFlag                            ;   4740 C740 C 8D 3D 03        F:000318
  STA R_0028                                      ;   4743 C743 C 85 28           F:000318
  LDX #$0                                         ;   4745 C745 C A2 00           F:000318
  STX PPUNametable                                ;   4747 C747 C 8E 44 03        F:000318
  LDY #$0                                         ;   474A C74A C A0 00           F:000318
  JSR SetNewBackground                                    ;   474C C74C C 20 07 A3        F:000318
  LDA #$0                                         ;   474F C74F C A9 00           F:000321
  STA BGDrawPPUAddress                            ;   4751 C751 C 85 16           F:000321
  STA BGDrawPPUAddress+1                          ;   4753 C753 C 85 17           F:000321
  STA R_001F                                      ;   4755 C755 C 85 1F           F:000321
  STA SpriteUpdateFlags                           ;   4757 C757 C 85 2D           F:000321
  LDA #$F                                         ;   4759 C759 C A9 0F           F:000321
  STA R_0026                                      ;   475B C75B C 85 26           F:000321
  STA R_0027                                      ;   475D C75D C 85 27           F:000321
  LDA #$81                                        ;   475F C75F C A9 81           F:000321
  STA R_05F9                                      ;   4761 C761 C 8D F9 05        F:000321
  JSR L_0_1A0B                                    ;   4764 C764 C 20 0B 9A        F:000321
  JSR L_0_1A15                                    ;   4767 C767 C 20 15 9A        F:000321
B_2_476A:
  JSR DelayUntilNMI                                    ;   476A C76A C 20 F9 CA        F:000335
  JSR SoundSystemUpdate                                    ;   476D C76D C 20 96 BA        F:000336
  JSR JoypadHasChanged                                    ;   4770 C770 C 20 1C 9B        F:000336
  BCC B_2_472A                                    ;   4773 C773 C 90 B5           F:000336
  BCS B_2_476A                                    ;   4775 C775 C B0 F3           F:000336

RunMainMenuScene:
  JSR PPUHideAll                                    ;   4777 C777 C 20 CC 99        F:006005
  JSR PPUMASKHideBackground                                    ;   477A C77A C 20 A4 99        F:006005
  JSR PPUMASKHideSprites                                    ;   477D C77D C 20 B2 99        F:006005
  LDX #$1                                         ;   4780 C780 C A2 01           F:006005
  STX PaletteDirtyFlag                            ;   4782 C782 C 8E 3D 03        F:006005
  STX R_0028                                      ;   4785 C785 C 86 28           F:006005
  DEX                                             ;   4787 C787 C CA              F:006005
  STX R_0393                                      ;   4788 C788 C 8E 93 03        F:006005
  STX CurrentRoundNumber                          ;   478B C78B C 8E 10 03        F:006005
  STX Family1Cash                                 ;   478E C78E C 8E C3 04        F:006005
  STX Family1Cash+1                               ;   4791 C791 C 8E C4 04        F:006005
  STX Family2Cash                                 ;   4794 C794 C 8E C5 04        F:006005
  STX Family2Cash+1                               ;   4797 C797 C 8E C6 04        F:006005
  STX QuestionCurrentCash                         ;   479A C79A C 8E C7 04        F:006005
  STX QuestionCurrentCash+1                       ;   479D C79D C 8E C8 04        F:006005
  STX SpriteUpdateFlags                           ;   47A0 C7A0 C 86 2D           F:006005
  STX PPUNametable                                ;   47A2 C7A2 C 8E 44 03        F:006005
  LDA #$6                                         ;   47A5 C7A5 C A9 06           F:006005
  JSR SetNMIRoutine                                    ;   47A7 C7A7 C 20 C7 CA        F:006005
  LDA #$5                                         ;   47AA C7AA C A9 05           F:006005
  LDY #$0                                         ;   47AC C7AC C A0 00           F:006005
  STY R_001F                                      ;   47AE C7AE C 84 1F           F:006005
  LDX #$0                                         ;   47B0 C7B0 C A2 00           F:006005
  JSR SetNewBackground                                    ;   47B2 C7B2 C 20 07 A3        F:006005
  LDA #$F                                         ;   47B5 C7B5 C A9 0F           F:006007
  STA R_0026                                      ;   47B7 C7B7 C 85 26           F:006007
  STA R_0027                                      ;   47B9 C7B9 C 85 27           F:006007
  LDA #$B                                         ;   47BB C7BB C A9 0B           F:006007
  JSR MMC1SetCHR1                                    ;   47BD C7BD C 20 68 99        F:006007
  JSR MoveSpritesOffscreen                                    ;   47C0 C7C0 C 20 D5 99        F:006007
  LDA #$FF                                        ;   47C3 C7C3 C A9 FF           F:006007
  STA SprYPos                                     ;   47C5 C7C5 C 8D 00 02        F:006007
  LDA #$67                                        ;   47C8 C7C8 C A9 67           F:006007
  STA R_0204                                      ;   47CA C7CA C 8D 04 02        F:006007
  LDA #$33                                        ;   47CD C7CD C A9 33           F:006007
  STA R_0205                                      ;   47CF C7CF C 8D 05 02        F:006007
  LDA #$2                                         ;   47D2 C7D2 C A9 02           F:006007
  STA R_0206                                      ;   47D4 C7D4 C 8D 06 02        F:006007
  LDA #$38                                        ;   47D7 C7D7 C A9 38           F:006007
  STA R_0207                                      ;   47D9 C7D9 C 8D 07 02        F:006007
  LDA #$21                                        ;   47DC C7DC C A9 21           F:006007
  STA PpuAddr_2006                                ;   47DE C7DE C 8D 06 20        F:006007
  LDA #$A7                                        ;   47E1 C7E1 C A9 A7           F:006007
  STA PpuAddr_2006                                ;   47E3 C7E3 C 8D 06 20        F:006007
  LDA #$0                                         ;   47E6 C7E6 C A9 00           F:006007
  STA PpuData_2007                                ;   47E8 C7E8 C 8D 07 20        F:006007
  STA R_000E                                      ;   47EB C7EB C 85 0E           F:006007
  STA R_000F                                      ;   47ED C7ED C 85 0F           F:006007
  JSR L_0_1A0B                                    ;   47EF C7EF C 20 0B 9A        F:006007
  JSR L_0_1A15                                    ;   47F2 C7F2 C 20 15 9A        F:006007
  JSR PPUMASKShowSprites                                    ;   47F5 C7F5 C 20 B9 99        F:006018
B_2_47F8:
  JSR DelayUntilNMI                                    ;   47F8 C7F8 C 20 F9 CA        F:006018
  JSR SoundSystemUpdate                                    ;   47FB C7FB C 20 96 BA        F:006019
  JSR JoypadHasChanged                                    ;   47FE C7FE C 20 1C 9B        F:006019
  BCS B_2_47F8                                    ;   4801 C801 C B0 F5           F:006019
  LDA JoypadBoth                                      ;   4803 C803 C A5 15           F:007361
  AND #%00000100                                         ;   4805 C805 C 29 04           F:007361
  BNE B_2_4840                                    ;   4807 C807 C D0 37           F:007361
  LDA JoypadBoth                                      ;   4809 C809 C A5 15           F:007375
  AND #%00001000                                         ;   480B C80B C 29 08           F:007375
  BNE B_2_485D                                    ;   480D C80D C D0 4E           F:007375
  LDA JoypadInputsCtl1                            ;   480F C80F C A5 EB           F:007420
  BEQ B_2_4822                                    ;   4811 C811 C F0 0F           F:007420
  LDX R_000E                                      ;   4813 C813 . A6 0E           
  CPX #$1                                         ;   4815 C815 . E0 01           
  BNE B_2_47F8                                    ;   4817 C817 . D0 DF           
  AND #$10                                        ;   4819 C819 . 29 10           
  BEQ B_2_47F8                                    ;   481B C81B . F0 DB           
  LDA R_000E                                      ;   481D C81D . A5 0E           
  JMP B_C82A                                      ;   481F C81F . 4C 2A C8        

B_2_4822:
  LDA JoypadInputsCtl0                            ;   4822 C822 C A5 EA           F:007420
  AND #$10                                        ;   4824 C824 C 29 10           F:007420
  BEQ B_2_47F8                                    ;   4826 C826 C F0 D0           F:007420
  LDA R_000E                                      ;   4828 C828 C A5 0E           F:006085
B_C82A:
  STA QuestionTopBackgroundTile                   ;   482A C82A C 8D 12 03        F:006085
  LDX #$FF                                        ;   482D C82D C A2 FF           F:006085
  STX ActiveFamily2                               ;   482F C82F C 86 08           F:006085
  INX                                             ;   4831 C831 C E8              F:006085
  STX R_0313                                      ;   4832 C832 C 8E 13 03        F:006085
  STX R_0314                                      ;   4835 C835 C 8E 14 03        F:006085
  LDA #$1                                         ;   4838 C838 C A9 01           F:006085
  JSR SetNMIRoutine                                    ;   483A C83A C 20 C7 CA        F:006085
  JMP B_2_472A                                    ;   483D C83D C 4C 2A C7        F:006085

B_2_4840:
  CLC                                             ;   4840 C840 C 18              F:007361
  LDA R_0204                                      ;   4841 C841 C AD 04 02        F:007361
  ADC #$10                                        ;   4844 C844 C 69 10           F:007361
  STA R_0204                                      ;   4846 C846 C 8D 04 02        F:007361
  INC R_000E                                      ;   4849 C849 C E6 0E           F:007361
  LDA R_000E                                      ;   484B C84B C A5 0E           F:007361
  CMP #$2                                         ;   484D C84D C C9 02           F:007361
  BNE B_2_485A                                    ;   484F C84F C D0 09           F:007361
  LDA #$67                                        ;   4851 C851 C A9 67           F:007446
  STA R_0204                                      ;   4853 C853 C 8D 04 02        F:007446
  LDA #$0                                         ;   4856 C856 C A9 00           F:007446
  STA R_000E                                      ;   4858 C858 C 85 0E           F:007446
B_2_485A:
  JMP B_2_47F8                                    ;   485A C85A C 4C F8 C7        F:007361

B_2_485D:
  SEC                                             ;   485D C85D C 38              F:007375
  LDA R_0204                                      ;   485E C85E C AD 04 02        F:007375
  SBC #$10                                        ;   4861 C861 C E9 10           F:007375
  STA R_0204                                      ;   4863 C863 C 8D 04 02        F:007375
  DEC R_000E                                      ;   4866 C866 C C6 0E           F:007375
  LDA R_000E                                      ;   4868 C868 C A5 0E           F:007375
  CMP #$FF                                        ;   486A C86A C C9 FF           F:007375
  BNE B_2_4877                                    ;   486C C86C C D0 09           F:007375
  LDA #$77                                        ;   486E C86E C A9 77           F:007426
  STA R_0204                                      ;   4870 C870 C 8D 04 02        F:007426
  LDA #$1                                         ;   4873 C873 C A9 01           F:007426
  STA R_000E                                      ;   4875 C875 C 85 0E           F:007426
B_2_4877:
  JMP B_2_47F8                                    ;   4877 C877 C 4C F8 C7        F:007375

QuestionEnding:
  LDA #$0                                         ;   487A C87A C A9 00           F:012690
  STA IsStealingQuestion                          ;   487C C87C C 85 25           F:012690
  STA QuestionCurrentCash                         ;   487E C87E C 8D C7 04        F:012690
  STA QuestionCurrentCash+1                       ;   4881 C881 C 8D C8 04        F:012690
  STA ActiveFamily                                ;   4884 C884 C 85 0B           F:012690
  LDA Family1Cash+1                               ;   4886 C886 C AD C4 04        F:012690
  BNE B_2_48A8                                    ;   4889 C889 C D0 1D           F:012690
  LDA Family1Cash                                 ;   488B C88B C AD C3 04        F:012690
  CMP #$C8                                        ;   488E C88E C C9 C8           F:012690
  BCS B_2_48A8                                    ;   4890 C890 C B0 16           F:012690
  LDA Family2Cash+1                               ;   4892 C892 C AD C6 04        F:012690
  BNE B_2_489E                                    ;   4895 C895 C D0 07           F:012690
  LDA Family2Cash                                 ;   4897 C897 C AD C5 04        F:012690
  CMP #$C8                                        ;   489A C89A C C9 C8           F:012690
  BCC B_2_48DB                                    ;   489C C89C C 90 3D           F:012690
B_2_489E:
  LDA QuestionTopBackgroundTile                   ;   489E C89E C AD 12 03        F:022387
  BNE B_2_48A6                                    ;   48A1 C8A1 C D0 03           F:022387
  JMP L_2_4926                                    ;   48A3 C8A3 C 4C 26 C9        F:022387

B_2_48A6:
  INC ActiveFamily                                ;   48A6 C8A6 . E6 0B           
B_2_48A8:
  JSR AdvanceRNG                                    ;   48A8 C8A8 C 20 BB 9B        F:041478
  LDA RNG1                                        ;   48AB C8AB C AD FA 01        F:041478
  AND #$7                                         ;   48AE C8AE C 29 07           F:041478
  TAX                                             ;   48B0 C8B0 C AA              F:041478
B_2_48B1:
  JSR AdvanceRNG                                    ;   48B1 C8B1 C 20 BB 9B        F:041478
  DEX                                             ;   48B4 C8B4 C CA              F:041478
  BPL B_2_48B1                                    ;   48B5 C8B5 C 10 FA           F:041478
B_2_48B7:
  JSR AdvanceRNG                                    ;   48B7 C8B7 C 20 BB 9B        F:041478
  LDA RNG1                                        ;   48BA C8BA C AD FA 01        F:041478
  AND #$7                                         ;   48BD C8BD C 29 07           F:041478
  CMP #$5                                         ;   48BF C8BF C C9 05           F:041478
  BCS B_2_48B7                                    ;   48C1 C8C1 C B0 F4           F:041478
  STA R_04DD                                      ;   48C3 C8C3 C 8D DD 04        F:041478
B_2_48C6:
  JSR AdvanceRNG                                    ;   48C6 C8C6 C 20 BB 9B        F:041478
  LDA RNG1                                        ;   48C9 C8C9 C AD FA 01        F:041478
  AND #$7                                         ;   48CC C8CC C 29 07           F:041478
  CMP #$5                                         ;   48CE C8CE C C9 05           F:041478
  BCS B_2_48C6                                    ;   48D0 C8D0 C B0 F4           F:041478
  CMP R_04DD                                      ;   48D2 C8D2 C CD DD 04        F:041478
  BEQ B_2_48C6                                    ;   48D5 C8D5 C F0 EF           F:041478
  STA R_04DE                                      ;   48D7 C8D7 C 8D DE 04        F:041478
  SEC                                             ;   48DA C8DA C 38              F:041478
B_2_48DB:
  RTS                                             ;   48DB C8DB C 60              F:012690

RunFamilyNamingScene:
  LDA #$FF                                        ;   48DC C8DC C A9 FF           F:006101
  STA CurrentAnsweringFamilyMember                ;   48DE C8DE C 8D DC 04        F:006101
  LDA #$1                                         ;   48E1 C8E1 C A9 01           F:006101
  JSR RunStageScene                                    ;   48E3 C8E3 C 20 07 C9        F:006101
  LDA #$0                                         ;   48E6 C8E6 C A9 00           F:006294
  STA ActiveFamily                                ;   48E8 C8E8 C 85 0B           F:006294
  LDA #$81                                        ;   48EA C8EA C A9 81           F:006294
  JSR RunDisplayFamilyScene                                    ;   48EC C8EC C 20 99 90        F:006294
  LDA #$2                                         ;   48EF C8EF C A9 02           F:006647
  JSR RunStageScene                                    ;   48F1 C8F1 C 20 07 C9        F:006647
  LDA #$1                                         ;   48F4 C8F4 C A9 01           F:007143
  STA ActiveFamily                                ;   48F6 C8F6 C 85 0B           F:007143
  LDA #$81                                        ;   48F8 C8F8 C A9 81           F:007143
  JSR RunDisplayFamilyScene                                    ;   48FA C8FA C 20 99 90        F:007143
  LDA #$FF                                        ;   48FD C8FD C A9 FF           F:008129
  STA ActiveFamily                                ;   48FF C8FF C 85 0B           F:008129
  LDA #$80                                        ;   4901 C901 C A9 80           F:008129
  STA R_05F9                                      ;   4903 C903 C 8D F9 05        F:008129
  RTS                                             ;   4906 C906 C 60              F:008129

RunStageScene:
  STA StageCutscene                               ;   4907 C907 C 8D D5 04        F:006101
  LDA #$1                                         ;   490A C90A C A9 01           F:006101
  STA ActiveScene                                 ;   490C C90C C 8D D3 04        F:006101
  JSR RunStageSceneInner                                    ;   490F C90F C 20 3A 80        F:006101
  LDA #$0                                         ;   4912 C912 C A9 00           F:006294
  STA ActiveScene                                 ;   4914 C914 C 8D D3 04        F:006294
  RTS                                             ;   4917 C917 C 60              F:006294

D_2_4918:
.byte $0F,$10,$11,$0F                             ;   4918 C918 ....     ????     
.byte $10                                         ;   491C C91C D        ?        F:022388
.byte $11,$0F,$10                                 ;   491D C91D ...      ???      
D_2_4920:
.byte $8D                                         ;   4920 C920 .        ?        
D_2_4921:
.byte $21                                         ;   4921 C921 .        !        
.byte $8D,$21                                     ;   4922 C922 DD       ?!       F:022390
.byte $93,$21                                     ;   4924 C924 ..       ?!       
L_2_4926:
  JSR PPUHideAllAndWaitForNMI                                    ;   4926 C926 C 20 C0 99        F:022387
  LDA #$1                                         ;   4929 C929 C A9 01           F:022388
  STA PaletteDirtyFlag                            ;   492B C92B C 8D 3D 03        F:022388
  JSR SetNMIRoutine                                    ;   492E C92E C 20 C7 CA        F:022388
  JSR AdvanceRNG                                    ;   4931 C931 C 20 BB 9B        F:022388
  LDA RNG1                                        ;   4934 C934 C AD FA 01        F:022388
  AND #$7                                         ;   4937 C937 C 29 07           F:022388
  TAX                                             ;   4939 C939 C AA              F:022388
  LDA D_2_4918,X                                  ;   493A C93A C BD 18 C9        F:022388
  PHA                                             ;   493D C93D C 48              F:022388
  LDX #$0                                         ;   493E C93E C A2 00           F:022388
  STX R_05A1                                      ;   4940 C940 C 8E A1 05        F:022388
  STX PPUNametable                                ;   4943 C943 C 8E 44 03        F:022388
  LDY #$0                                         ;   4946 C946 C A0 00           F:022388
  STY R_001F                                      ;   4948 C948 C 84 1F           F:022388
  JSR SetNewBackground                                    ;   494A C94A C 20 07 A3        F:022388
  SEC                                             ;   494D C94D C 38              F:022390
  PLA                                             ;   494E C94E C 68              F:022390
  SBC #$F                                         ;   494F C94F C E9 0F           F:022390
  ASL                                             ;   4951 C951 C 0A              F:022390
  TAX                                             ;   4952 C952 C AA              F:022390
  LDA D_2_4921,X                                  ;   4953 C953 C BD 21 C9        F:022390
  STA PpuAddr_2006                                ;   4956 C956 C 8D 06 20        F:022390
  LDA D_2_4920,X                                  ;   4959 C959 C BD 20 C9        F:022390
  STA PpuAddr_2006                                ;   495C C95C C 8D 06 20        F:022390
  LDX #$0                                         ;   495F C95F C A2 00           F:022390
B_2_4961:
  LDA Family2Name,X                               ;   4961 C961 C BD 08 03        F:022390
  PHP                                             ;   4964 C964 C 08              F:022390
  AND #$7F                                        ;   4965 C965 C 29 7F           F:022390
  CLC                                             ;   4967 C967 C 18              F:022390
  ADC #$8                                         ;   4968 C968 C 69 08           F:022390
  STA PpuData_2007                                ;   496A C96A C 8D 07 20        F:022390
  INX                                             ;   496D C96D C E8              F:022390
  PLP                                             ;   496E C96E C 28              F:022390
  BPL B_2_4961                                    ;   496F C96F C 10 F0           F:022390
  LDA #$44                                        ;   4971 C971 C A9 44           F:022390
  STA PpuData_2007                                ;   4973 C973 C 8D 07 20        F:022390
  LDA #$15                                        ;   4976 C976 C A9 15           F:022390
  STA PpuData_2007                                ;   4978 C978 C 8D 07 20        F:022390
  LDA #$A                                         ;   497B C97B C A9 0A           F:022390
  JSR L_0_19F7                                    ;   497D C97D C 20 F7 99        F:022390
  LDA #$83                                        ;   4980 C980 C A9 83           F:022390
  STA R_05F9                                      ;   4982 C982 C 8D F9 05        F:022390
  JSR L_0_1A15                                    ;   4985 C985 C 20 15 9A        F:022390
B_2_4988:
  JSR L_0_1A00                                    ;   4988 C988 C 20 00 9A        F:022402
  BCC B_2_4992                                    ;   498B C98B C 90 05           F:022402
  JSR JoypadHasChanged                                    ;   498D C98D C 20 1C 9B        F:022522
  BCC B_2_499C                                    ;   4990 C990 C 90 0A           F:022522
B_2_4992:
  JSR DelayUntilNMI                                    ;   4992 C992 C 20 F9 CA        F:022402
  JSR SoundSystemUpdate                                    ;   4995 C995 C 20 96 BA        F:022403
  LDA R_0028                                      ;   4998 C998 C A5 28           F:022403
  BNE B_2_4988                                    ;   499A C99A C D0 EC           F:022403
B_2_499C:
  JSR DelayUntilNMI                                    ;   499C C99C C 20 F9 CA        F:022556
  JSR SoundSystemUpdate                                    ;   499F C99F C 20 96 BA        F:022557
  JSR L_0_1A30                                    ;   49A2 C9A2 C 20 30 9A        F:022557
  BCC B_2_499C                                    ;   49A5 C9A5 C 90 F5           F:022557
  PLA                                             ;   49A7 C9A7 C 68              F:022568
  PLA                                             ;   49A8 C9A8 C 68              F:022568
  JMP RunMainGame                                    ;   49A9 C9A9 C 4C 74 C6        F:022568

ResetRound:
  LDA #$0                                         ;   49AC C9AC C A9 00           F:006101
  STA R_0393                                      ;   49AE C9AE C 8D 93 03        F:006101
  STA CurrentRoundNumber                          ;   49B1 C9B1 C 8D 10 03        F:006101
  STA Family1Cash                                 ;   49B4 C9B4 C 8D C3 04        F:006101
  STA Family1Cash+1                               ;   49B7 C9B7 C 8D C4 04        F:006101
  STA Family2Cash                                 ;   49BA C9BA C 8D C5 04        F:006101
  STA Family2Cash+1                               ;   49BD C9BD C 8D C6 04        F:006101
  STA QuestionCurrentCash                         ;   49C0 C9C0 C 8D C7 04        F:006101
  STA QuestionCurrentCash+1                       ;   49C3 C9C3 C 8D C8 04        F:006101
  STA SpriteUpdateFlags                           ;   49C6 C9C6 C 85 2D           F:006101
  LDA ActiveFamily2                               ;   49C8 C9C8 C A5 08           F:006101
  BMI SelectFamilyAppearance                                    ;   49CA C9CA C 30 12           F:006101
  BEQ B_2_49D6                                    ;   49CC C9CC C F0 08           F:045373
  LDA #$A0                                        ;   49CE C9CE . A9 A0           
  STA Family1Name                                 ;   49D0 C9D0 . 8D 00 03        
  JMP $CA0C                                       ;   49D3 C9D3 . 4C 0C CA        

B_2_49D6:
  LDA #$A0                                        ;   49D6 C9D6 C A9 A0           F:045373
  STA Family2Name                                 ;   49D8 C9D8 C 8D 08 03        F:045373
  JMP SelectFamily2Appearance                                    ;   49DB C9DB C 4C 22 CA        F:045373

SelectFamilyAppearance:
: jsr AdvanceRNG                                  ; keep rolling for a non-zero first family
  lda RNG1
  and #$03
  beq :-
  sec                                             ; and subtract one
  sbc #$01
  sta Family1
: jsr AdvanceRNG                                  ; keep rolling for a non-zero second family
  lda RNG1
  and #$03
  beq :-
  sec                                             ; and subtract one
  sbc #$01
  cmp Family1                                     ; keep rolling for the second family to make sure
  beq :-                                          ; that we don't get two of the same families.
  sta Family2
  lda #$A0                                        ; and clear the family names
  sta Family1Name
  sta Family2Name
  rts


SelectFamily1Appearance:                          ; reroll only family 1
: jsr AdvanceRNG                                  ; keep rolling for a non-zero family
  lda RNG1
  and #$03
  beq :-
  sec
  sbc #$01
  cmp Family2                                     ; make sure we havent picked the same as family 2!
  beq :-
  sta Family1                                     ; and finish up
  rts


SelectFamily2Appearance:                          ; reroll only family 2
: jsr AdvanceRNG                                  ; keep rolling for a non-zero family
  lda RNG1
  and #$03
  beq :-
  sec
  sbc #$01
  cmp Family1                                     ; make sure we havent picked the same as family 1!
  beq :-
  sta Family2                                     ; and finish up
  rts

InitializeGameMemory:
  @TempPalettePtr = $0E
  ldx #$0E                                        ; clear memory $0E to $E9
  lda #$00
: sta $00,x
  inx
  cpx #$EA
  bne :-
  ldy #<PaletteBackgroundCopy                     ; clear memory $31D to $5C3
  sty @TempPalettePtr
  ldy #>PaletteBackgroundCopy
  sty @TempPalettePtr+1
  tay
@KeepClearing:
  sta (@TempPalettePtr),y
  iny
  bne @CheckForEnding
  inc @TempPalettePtr+1
@CheckForEnding:
  cpy #$A7
  bne @KeepClearing
  ldx @TempPalettePtr+1
  cpx #$05
  bne @KeepClearing
  rts

VNMI:
  pha
  txa
  pha
  tya
  pha
  lda SpriteUpdateFlags
  bne @SkipSpriteUpdate
  lda #$02                                     ; DMA sprites from $200
  sta SpriteDma_4014
@SkipSpriteUpdate:
  jsr RunNMIRoutine
  jsr UpdatePalettes
L_2_4A72:
  lda PPUCTRL_Mirror                           ; update ppu registers from the mirrors
  sta PpuControl_2000
  lda PPUMASK_Mirror
  sta PpuMask_2001
  lda PPUNametable                             ; find which ppu nametable is active,
  asl a
  tay
  lda PPUNametables+1,y                        ; and move ppuaddr to it!
  sta PpuAddr_2006
  lda PPUNametables,y
  sta PpuAddr_2006
  lda #$00                                     ; clear ppu scroll
  sta PpuScroll_2005
  sta PpuScroll_2005
  lda #$01                                     ; raise the nmi flag, so the game code can continue
  sta NMITriggeredFlag
  jsr AdvanceRNG                               ; always step rng once per frame
  lda $04E1
  beq @RestoreStateAndExit
  jsr MMC1ResetCHRBanks
  jsr SoundSystemUpdate
  jsr SetFamilyCHRBanks
  lda #$0B
  jsr MMC1SetCHR0
  ldy Family1
  lda FamilyCHR,y
  jsr MMC1SetCHR1
  jsr L_2_52D6
  jsr L_2_593E
@RestoreStateAndExit:
  pla
  tay
  pla
  tax
  pla
VIRQ:
  rti

RunNMIRoutine:
  JMP (NMIRoutinePtr)                             ;   4AC4 CAC4 C 6C 09 00        F:000007

SetNMIRoutine:
  ASL                                             ;   4AC7 CAC7 C 0A              F:000004
  TAX                                             ;   4AC8 CAC8 C AA              F:000004
  LDA NMIRoutines,X                                  ;   4AC9 CAC9 C BD D4 CA        F:000004
  STA NMIRoutinePtr                               ;   4ACC CACC C 85 09           F:000004
  LDA NMIRoutines+1,X                                  ;   4ACE CACE C BD D5 CA        F:000004
  STA NMIRoutinePtr+1                             ;   4AD1 CAD1 C 85 0A           F:000004
  RTS                                             ;   4AD3 CAD3 C 60              F:000004

NMIRoutines:
.addr B_2_4B68     
.addr L_2_4B5E                                    ;   4AD6 CAD6 N 5E CB
.addr L_2_4B17                                    ;   4AD8 CAD8 N 17 CB
.addr L_2_4B71                                    ;   4ADA CADA N 71 CB
.addr L_2_4E29                                    ;   4ADC CADC N 29 CE
.addr L_2_4E9C                                    ;   4ADE CADE N 9C CE
.addr L_2_4EC3                                    ;   4AE0 CAE0 N C3 CE
.addr L_2_4EFA                                    ;   4AE2 CAE2 N FA CE
.addr L_2_4F07                                    ;   4AE4 CAE4 N 07 CF
.addr L_2_5055                                    ;   4AE6 CAE6 N 55 D0
PPUCTRLMirrorDisableNMI:
  LDA PPUCTRL_Mirror                              ;   4AE8 CAE8 C A5 0C           F:000004
  AND #$7F                                        ;   4AEA CAEA C 29 7F           F:000004
  STA PPUCTRL_Mirror                              ;   4AEC CAEC C 85 0C           F:000004
  RTS                                             ;   4AEE CAEE C 60              F:000004

PPUCTRLEnableNMI:
  LDA PPUCTRL_Mirror                              ;   4AEF CAEF C A5 0C           F:000006
  ORA #$80                                        ;   4AF1 CAF1 C 09 80           F:000006
  STA PpuControl_2000                             ;   4AF3 CAF3 C 8D 00 20        F:000006
  STA PPUCTRL_Mirror                              ;   4AF6 CAF6 C 85 0C           F:000006
  RTS                                             ;   4AF8 CAF8 C 60              F:000006

DelayUntilNMI:
  LDA NMITriggeredFlag                            ;   4AF9 CAF9 C A5 1E           F:000006
  BEQ DelayUntilNMI                                    ;   4AFB CAFB C F0 FC           F:000006
  DEC NMITriggeredFlag                            ;   4AFD CAFD C C6 1E           F:000007
  RTS                                             ;   4AFF CAFF C 60              F:000007

L_2_4B00:
  STA PPUNametable                                ;   4B00 CB00 C 8D 44 03        F:008466
  TXA                                             ;   4B03 CB03 C 8A              F:008466
  ASL                                             ;   4B04 CB04 C 0A              F:008466
  ASL                                             ;   4B05 CB05 C 0A              F:008466
  STA a:R_0020                                    ;   4B06 CB06 C 8D 20 00        F:008466
  LDA #$1                                         ;   4B09 CB09 C A9 01           F:008466
  STA R_001F                                      ;   4B0B CB0B C 85 1F           F:008466
  CPY #$1                                         ;   4B0D CB0D C C0 01           F:008466
  BEQ B_2_4B14                                    ;   4B0F CB0F C F0 03           F:008466
  JMP PPUMASKHideSprites                                    ;   4B11 CB11 C 4C B2 99        F:008466

B_2_4B14:
  JMP PPUMASKShowSprites                                    ;   4B14 CB14 C 4C B9 99        F:008587

L_2_4B17:
  LDA PaletteDirtyFlagPending                     ;   4B17 CB17 C AD 41 03        F:000321
  BNE L_2_4B5E                                    ;   4B1A CB1A C D0 42           F:000321
  LDA R_032A                                      ;   4B1C CB1C C AD 2A 03        F:000336
  CMP D_2_4B6D                                    ;   4B1F CB1F C CD 6D CB        F:000336
  BEQ B_2_4B33                                    ;   4B22 CB22 C F0 0F           F:000336
  CMP D_2_4B6E                                    ;   4B24 CB24 C CD 6E CB        F:000336
  BEQ B_2_4B33                                    ;   4B27 CB27 C F0 0A           F:000336
  CMP D_2_4B6F                                    ;   4B29 CB29 C CD 6F CB        F:000336
  BEQ B_2_4B33                                    ;   4B2C CB2C C F0 05           F:000336
  CMP D_2_4B70                                    ;   4B2E CB2E C CD 70 CB        F:006000
  BNE L_2_4B5E                                    ;   4B31 CB31 C D0 2B           F:006000
B_2_4B33:
  INC R_002B                                      ;   4B33 CB33 C E6 2B           F:000336
  BNE B_2_4B3F                                    ;   4B35 CB35 C D0 08           F:000336
  INC R_002C                                      ;   4B37 CB37 C E6 2C           F:000591
  LDA R_002C                                      ;   4B39 CB39 C A5 2C           F:000591
  CMP #$7                                         ;   4B3B CB3B C C9 07           F:000591
  BNE B_2_4B3F                                    ;   4B3D CB3D C D0 00           F:000591
B_2_4B3F:
  LDA SpriteUpdateFlags                           ;   4B3F CB3F C A5 2D           F:000336
  AND #$F                                         ;   4B41 CB41 C 29 0F           F:000336
  CMP #$6                                         ;   4B43 CB43 C C9 06           F:000336
  BNE B_2_4B5C                                    ;   4B45 CB45 C D0 15           F:000336
  LDA SpriteUpdateFlags                           ;   4B47 CB47 C A5 2D           F:000342
  AND #$F0                                        ;   4B49 CB49 C 29 F0           F:000342
  ADC #$F                                         ;   4B4B CB4B C 69 0F           F:000342
  STA SpriteUpdateFlags                           ;   4B4D CB4D C 85 2D           F:000342
  LSR                                             ;   4B4F CB4F C 4A              F:000342
  LSR                                             ;   4B50 CB50 C 4A              F:000342
  LSR                                             ;   4B51 CB51 C 4A              F:000342
  LSR                                             ;   4B52 CB52 C 4A              F:000342
  AND #$3                                         ;   4B53 CB53 C 29 03           F:000342
  TAY                                             ;   4B55 CB55 C A8              F:000342
  LDA D_2_4B6D,Y                                  ;   4B56 CB56 C B9 6D CB        F:000342
  STA R_032A                                      ;   4B59 CB59 C 8D 2A 03        F:000342
B_2_4B5C:
  INC SpriteUpdateFlags                           ;   4B5C CB5C C E6 2D           F:000336
L_2_4B5E:
  DEC R_0026                                      ;   4B5E CB5E C C6 26           F:000007
  BNE B_2_4B68                                    ;   4B60 CB60 C D0 06           F:000007
  LDA R_0027                                      ;   4B62 CB62 C A5 27           F:000066
  STA R_0026                                      ;   4B64 CB64 C 85 26           F:000066
  DEC R_0028                                      ;   4B66 CB66 C C6 28           F:000066
B_2_4B68:
  LDA #$0                                         ;   4B68 CB68 C A9 00           F:000007
  STA R_0021                                      ;   4B6A CB6A C 85 21           F:000007
  RTS                                             ;   4B6C CB6C C 60              F:000007

D_2_4B6D:
.byte $18                                         ;   4B6D CB6D D        ?        F:000336
D_2_4B6E:
.byte $28                                         ;   4B6E CB6E D        (        F:000336
D_2_4B6F:
.byte $38                                         ;   4B6F CB6F D        8        F:000336
D_2_4B70:
.byte $28                                         ;   4B70 CB70 D        (        F:000354
L_2_4B71:
  LDA R_04D6                                      ;   4B71 CB71 C AD D6 04        F:008274
  BEQ B_2_4BBC                                    ;   4B74 CB74 C F0 46           F:008274
  CMP #$1                                         ;   4B76 CB76 C C9 01           F:008589
  BNE B_2_4B80                                    ;   4B78 CB78 C D0 06           F:008589
  JSR L_0_05C4                                    ;   4B7A CB7A C 20 C4 85        F:008604
  JMP L_2_4BCC                                    ;   4B7D CB7D C 4C CC CB        F:008604

B_2_4B80:
  CMP #$2                                         ;   4B80 CB80 C C9 02           F:008589
  BNE B_2_4B8A                                    ;   4B82 CB82 C D0 06           F:008589
  JSR L_0_05E8                                    ;   4B84 CB84 C 20 E8 85        F:008605
  JMP L_2_4BCC                                    ;   4B87 CB87 C 4C CC CB        F:008605

B_2_4B8A:
  CMP #$3                                         ;   4B8A CB8A C C9 03           F:008589
  BNE B_2_4B94                                    ;   4B8C CB8C C D0 06           F:008589
  JSR L_0_0641                                    ;   4B8E CB8E C 20 41 86        F:008606
  JMP L_2_4BCC                                    ;   4B91 CB91 C 4C CC CB        F:008606

B_2_4B94:
  CMP #$4                                         ;   4B94 CB94 C C9 04           F:008589
  BNE B_2_4B9E                                    ;   4B96 CB96 C D0 06           F:008589
  JSR L_0_0C32                                    ;   4B98 CB98 C 20 32 8C        F:008607
  JMP L_2_4BCC                                    ;   4B9B CB9B C 4C CC CB        F:008607

B_2_4B9E:
  CMP #$6                                         ;   4B9E CB9E C C9 06           F:008589
  BNE B_2_4BA8                                    ;   4BA0 CBA0 C D0 06           F:008589
  JSR L_1_2BBA                                    ;   4BA2 CBA2 C 20 BA AB        F:008589
  JMP L_2_4BCC                                    ;   4BA5 CBA5 C 4C CC CB        F:008589

B_2_4BA8:
  CMP #$8                                         ;   4BA8 CBA8 C C9 08           F:008590
  BNE B_2_4BB2                                    ;   4BAA CBAA C D0 06           F:008590
  JSR DrawQuestionText                                    ;   4BAC CBAC C 20 C4 87        F:008590
  JMP L_2_4BCC                                    ;   4BAF CBAF C 4C CC CB        F:008590

B_2_4BB2:
  CMP #$9                                         ;   4BB2 CBB2 C C9 09           F:009831
  BNE B_2_4BBC                                    ;   4BB4 CBB4 C D0 06           F:009831
  JSR B_0_064B                                    ;   4BB6 CBB6 C 20 4B 86        F:009831
  JMP L_2_4BCC                                    ;   4BB9 CBB9 C 4C CC CB        F:009831

B_2_4BBC:
  LDA R_0021                                      ;   4BBC CBBC C A5 21           F:008274
  BEQ B_2_4BC3                                    ;   4BBE CBBE C F0 03           F:008274
  JMP L_2_4C8F                                    ;   4BC0 CBC0 C 4C 8F CC        F:008883

B_2_4BC3:
  LDA R_001F                                      ;   4BC3 CBC3 C A5 1F           F:008274
  BNE B_2_4BDE                                    ;   4BC5 CBC5 C D0 17           F:008274
  JSR DrawFamilyMember                                    ;   4BC7 CBC7 C 20 85 DA        F:008275
  BCC B_2_4BDE                                    ;   4BCA CBCA C 90 12           F:008275
L_2_4BCC:
  PLA                                             ;   4BCC CBCC C 68              F:008275
  PLA                                             ;   4BCD CBCD C 68              F:008275
  LDA #$0                                         ;   4BCE CBCE C A9 00           F:008275
  STA R_04D6                                      ;   4BD0 CBD0 C 8D D6 04        F:008275
  LDA QuestionVisible                             ;   4BD3 CBD3 C AD E2 04        F:008275
  BNE B_2_4BDB                                    ;   4BD6 CBD6 C D0 03           F:008275
  JSR MMC1ResetCHRBanks                                    ;   4BD8 CBD8 C 20 F4 86        F:008275
B_2_4BDB:
  JMP L_2_4A72                                    ;   4BDB CBDB C 4C 72 CA        F:008275

B_2_4BDE:
  LDA QuestionTopBackgroundTile                   ;   4BDE CBDE C AD 12 03        F:008274
  BNE B_2_4BF2                                    ;   4BE1 CBE1 C D0 0F           F:008274
  LDA ActiveFamily                                ;   4BE3 CBE3 C A5 0B           F:008274
  BEQ B_2_4BF2                                    ;   4BE5 CBE5 C F0 0B           F:008274
B_2_4BE7:
  LDA QuestionVisible                             ;   4BE7 CBE7 C AD E2 04        F:008274
  BNE B_2_4BEF                                    ;   4BEA CBEA C D0 03           F:008274
  JSR MMC1ResetCHRBanks                                    ;   4BEC CBEC C 20 F4 86        F:008274
B_2_4BEF:
  JMP L_2_4B5E                                    ;   4BEF CBEF C 4C 5E CB        F:008274

B_2_4BF2:
  LDA R_035E                                      ;   4BF2 CBF2 C AD 5E 03        F:008609
  BEQ B_2_4BE7                                    ;   4BF5 CBF5 C F0 F0           F:008609
  JSR L_2_4DF0                                    ;   4BF7 CBF7 C 20 F0 CD        F:008610
  DEC R_034D                                      ;   4BFA CBFA C CE 4D 03        F:008610
  BNE B_2_4C0F                                    ;   4BFD CBFD C D0 10           F:008610
  LDA #$10                                        ;   4BFF CBFF C A9 10           F:008625
  STA R_034D                                      ;   4C01 CC01 C 8D 4D 03        F:008625
  LDA R_034B                                      ;   4C04 CC04 C AD 4B 03        F:008625
  EOR #$1                                         ;   4C07 CC07 C 49 01           F:008625
  STA R_034B                                      ;   4C09 CC09 C 8D 4B 03        F:008625
  JMP B_2_4BE7                                    ;   4C0C CC0C C 4C E7 CB        F:008625

B_2_4C0F:
  JSR L_2_4DA4                                    ;   4C0F CC0F C 20 A4 CD        F:008610
  LDX #$0                                         ;   4C12 CC12 C A2 00           F:008610
L_2_4C14:
  CPX UserAnswerInputLength                       ;   4C14 CC14 C EC 5F 03        F:008610
  BEQ B_2_4C53                                    ;   4C17 CC17 C F0 3A           F:008610
  LDA UserAnswerInput,X                           ;   4C19 CC19 C BD 60 03        F:008784
  BMI B_2_4C2B                                    ;   4C1C CC1C C 30 0D           F:008784
  JSR L_2_4DB6                                    ;   4C1E CC1E C 20 B6 CD        F:008784
  LDA D_0_0F66,Y                                  ;   4C21 CC21 C B9 66 8F        F:008784
  STA PpuData_2007                                ;   4C24 CC24 C 8D 07 20        F:008784
  INX                                             ;   4C27 CC27 C E8              F:008784
  JMP L_2_4C14                                    ;   4C28 CC28 C 4C 14 CC        F:008784

B_2_4C2B:
  AND #$7F                                        ;   4C2B CC2B . 29 7F           
  JSR $CDB6                                       ;   4C2D CC2D . 20 B6 CD        
L_2_4C30:
  LDA R_034B                                      ;   4C30 CC30 C AD 4B 03        F:008610
  BEQ B_2_4C42                                    ;   4C33 CC33 C F0 0D           F:008610
  LDA D_0_0F66,Y                                  ;   4C35 CC35 C B9 66 8F        F:008610
  STA PpuData_2007                                ;   4C38 CC38 C 8D 07 20        F:008610
  CPX #$16                                        ;   4C3B CC3B C E0 16           F:008610
  BEQ B_2_4BE7                                    ;   4C3D CC3D C F0 A8           F:008610
  INX                                             ;   4C3F CC3F C E8              F:008610
  BNE B_2_4C47                                    ;   4C40 CC40 C D0 05           F:008610
B_2_4C42:
  LDA #$52                                        ;   4C42 CC42 C A9 52           F:008626
  STA PpuData_2007                                ;   4C44 CC44 C 8D 07 20        F:008626
B_2_4C47:
  LDA #$1                                         ;   4C47 CC47 C A9 01           F:008610
B_2_4C49:
  CPX #$16                                        ;   4C49 CC49 C E0 16           F:008610
  BCS B_2_4C57                                    ;   4C4B CC4B C B0 0A           F:008610
  STA PpuData_2007                                ;   4C4D CC4D C 8D 07 20        F:008610
  INX                                             ;   4C50 CC50 C E8              F:008610
  BNE B_2_4C49                                    ;   4C51 CC51 C D0 F6           F:008610
B_2_4C53:
  CPX #$16                                        ;   4C53 CC53 C E0 16           F:008610
  BNE B_2_4C5A                                    ;   4C55 CC55 C D0 03           F:008610
B_2_4C57:
  JMP B_2_4BE7                                    ;   4C57 CC57 C 4C E7 CB        F:008610

B_2_4C5A:
  LDY #$20                                        ;   4C5A CC5A C A0 20           F:008610
  INX                                             ;   4C5C CC5C C E8              F:008610
  JMP L_2_4C30                                    ;   4C5D CC5D C 4C 30 CC        F:008610

.byte $A9,$3B,$8D,$CA,$04,$A9,$00,$8D             ;   4C60 CC60 ........ ?;?????? 
.byte $CB,$04,$8D,$CC,$04,$8D,$CD,$04             ;   4C68 CC68 ........ ???????? 
.byte $85,$21,$4C,$E7,$CB                         ;   4C70 CC70 .....    ?!L??    
B_2_4C75:
  SEC                                             ;   4C75 CC75 C 38              F:008883
  LDA UserAnswerInputLength                       ;   4C76 CC76 C AD 5F 03        F:008883
  ADC D_0_0F76                                    ;   4C79 CC79 C 6D 76 8F        F:008883
  PHA                                             ;   4C7C CC7C C 48              F:008883
  LDA D_0_0F77                                    ;   4C7D CC7D C AD 77 8F        F:008883
  STA PpuAddr_2006                                ;   4C80 CC80 C 8D 06 20        F:008883
  PLA                                             ;   4C83 CC83 C 68              F:008883
  STA PpuAddr_2006                                ;   4C84 CC84 C 8D 06 20        F:008883
  LDA #$1                                         ;   4C87 CC87 C A9 01           F:008883
  STA PpuData_2007                                ;   4C89 CC89 C 8D 07 20        F:008883
  JMP B_2_4BE7                                    ;   4C8C CC8C C 4C E7 CB        F:008883

L_2_4C8F:
  CMP #$9                                         ;   4C8F CC8F C C9 09           F:008883
  BEQ B_2_4C75                                    ;   4C91 CC91 C F0 E2           F:008883
  JSR L_2_4CB5                                    ;   4C93 CC93 C 20 B5 CC        F:009397
  LDA IsInFastMoney                                      ;   4C96 CC96 C AD 43 05        F:009397
  BNE B_2_4CAB                                    ;   4C99 CC99 C D0 10           F:009397
  LDA #$3B                                        ;   4C9B CC9B C A9 3B           F:009397
  STA R_04CA                                      ;   4C9D CC9D C 8D CA 04        F:009397
  LDA #$0                                         ;   4CA0 CCA0 C A9 00           F:009397
  STA R_04CB                                      ;   4CA2 CCA2 C 8D CB 04        F:009397
  STA R_04CC                                      ;   4CA5 CCA5 C 8D CC 04        F:009397
  STA R_04CD                                      ;   4CA8 CCA8 C 8D CD 04        F:009397
B_2_4CAB:
  JSR L_2_4DF0                                    ;   4CAB CCAB C 20 F0 CD        F:009397
  LDA #$0                                         ;   4CAE CCAE C A9 00           F:009397
  STA R_0021                                      ;   4CB0 CCB0 C 85 21           F:009397
  JMP B_2_4BE7                                    ;   4CB2 CCB2 C 4C E7 CB        F:009397

L_2_4CB5:
  ASL                                             ;   4CB5 CCB5 C 0A              F:009397
  TAX                                             ;   4CB6 CCB6 C AA              F:009397
  JSR L_2_4DA4                                    ;   4CB7 CCB7 C 20 A4 CD        F:009397
  LDA FaceoffTextDataTable,X                                  ;   4CBA CCBA C BD 14 CD        F:009397
  STA R_0029                                      ;   4CBD CCBD C 85 29           F:009397
  LDA FaceoffTextDataTable+1,X                                  ;   4CBF CCBF C BD 15 CD        F:009397
  STA R_002A                                      ;   4CC2 CCC2 C 85 2A           F:009397
  LDX ActiveFamily                                ;   4CC4 CCC4 C A6 0B           F:009397
  LDY D_0_0FC6,X                                  ;   4CC6 CCC6 C BC C6 8F        F:009397
  STY R_002C                                      ;   4CC9 CCC9 C 84 2C           F:009397
  LDY #$0                                         ;   4CCB CCCB C A0 00           F:009397
  STY R_002E                                      ;   4CCD CCCD C 84 2E           F:009397
  STY R_002F                                      ;   4CCF CCCF C 84 2F           F:009397
  STY R_002B                                      ;   4CD1 CCD1 C 84 2B           F:009397
L_2_4CD3:
  LDA (R_0029),Y                                  ;   4CD3 CCD3 C B1 29           F:009397
  BEQ B_2_4CE8                                    ;   4CD5 CCD5 C F0 11           F:009397
  CMP #$23                                        ;   4CD7 CCD7 C C9 23           F:009397
  BEQ B_2_4CFC                                    ;   4CD9 CCD9 C F0 21           F:009397
B_2_4CDB:
  TAX                                             ;   4CDB CCDB C AA              F:009397
  LDA D_0_0F66,X                                  ;   4CDC CCDC C BD 66 8F        F:009397
  STA PpuData_2007                                ;   4CDF CCDF C 8D 07 20        F:009397
  INC R_002B                                      ;   4CE2 CCE2 C E6 2B           F:009397
B_2_4CE4:
  INY                                             ;   4CE4 CCE4 C C8              F:009397
  JMP L_2_4CD3                                    ;   4CE5 CCE5 C 4C D3 CC        F:009397

B_2_4CE8:
  LDA R_002B                                      ;   4CE8 CCE8 C A5 2B           F:009397
  CMP #$15                                        ;   4CEA CCEA C C9 15           F:009397
  BCC B_2_4CEF                                    ;   4CEC CCEC C 90 01           F:009397
  RTS                                             ;   4CEE CCEE C 60              F:009397

B_2_4CEF:
  LDX #$20                                        ;   4CEF CCEF C A2 20           F:009397
  LDA D_0_0F66,X                                  ;   4CF1 CCF1 C BD 66 8F        F:009397
  STA PpuData_2007                                ;   4CF4 CCF4 C 8D 07 20        F:009397
  INC R_002B                                      ;   4CF7 CCF7 C E6 2B           F:009397
  JMP B_2_4CE8                                    ;   4CF9 CCF9 C 4C E8 CC        F:009397

B_2_4CFC:
  LDX R_002E                                      ;   4CFC CCFC C A6 2E           F:009400
  BNE B_2_4CE4                                    ;   4CFE CCFE C D0 E4           F:009400
  LDA R_002F                                      ;   4D00 CD00 C A5 2F           F:009400
  INC R_002F                                      ;   4D02 CD02 C E6 2F           F:009400
  CLC                                             ;   4D04 CD04 C 18              F:009400
  ADC R_002C                                      ;   4D05 CD05 C 65 2C           F:009400
  TAX                                             ;   4D07 CD07 C AA              F:009400
  LDA Family1Name,X                               ;   4D08 CD08 C BD 00 03        F:009400
  BPL B_2_4CDB                                    ;   4D0B CD0B C 10 CE           F:009400
  STA R_002E                                      ;   4D0D CD0D C 85 2E           F:009400
  AND #$7F                                        ;   4D0F CD0F C 29 7F           F:009400
  JMP B_2_4CDB                                    ;   4D11 CD11 C 4C DB CC        F:009400

FaceoffTextDataTable:
.addr @Text_AlreadyAnswered
.addr @Text_AlreadyAnswered
.addr @Text_NewQuestion                                    ;   4D18 CD18 N 3B CD
.addr @Text_FamilyPlays                                    ;   4D1A CD1A N 50 CD
.addr @Text_FamilyPlays                                    ;   4D1C CD1C N 50 CD
.addr @Text_FamilyPlaysYN                                    ;   4D1E CD1E N 65 CD
.addr @Text_FamilyPlaysYN                                    ;   4D20 CD20 N 65 CD
.addr @Text_Spaces                                    ;   4D22 CD22 N 7A CD
.addr @Text_FamilyAnswering                                    ;   4D24 CD24 N 8F CD

@Text_AlreadyAnswered:
.byte "ALREADY ANSWERED    ",$00
@Text_NewQuestion:
.byte "NEW QUESTION        ",$00
@Text_FamilyPlays:
.byte "########'S PLAY     ",$00
@Text_FamilyPlaysYN:
.byte "########'S PLAY Y/N ",$00
@Text_Spaces:
.byte "                    ",$00
@Text_FamilyAnswering:
.byte "########'S ANSWERING",$00

L_2_4DA4:
  CLC                                             ;   4DA4 CDA4 C 18              F:008610
  LDA D_0_0F76                                    ;   4DA5 CDA5 C AD 76 8F        F:008610
  ADC #$1                                         ;   4DA8 CDA8 C 69 01           F:008610
  PHA                                             ;   4DAA CDAA C 48              F:008610
  LDA D_0_0F77                                    ;   4DAB CDAB C AD 77 8F        F:008610
  STA PpuAddr_2006                                ;   4DAE CDAE C 8D 06 20        F:008610
  PLA                                             ;   4DB1 CDB1 C 68              F:008610
  STA PpuAddr_2006                                ;   4DB2 CDB2 C 8D 06 20        F:008610
  RTS                                             ;   4DB5 CDB5 C 60              F:008610

L_2_4DB6:
  CMP #$5E                                        ;   4DB6 CDB6 C C9 5E           F:008784
  BNE B_2_4DBC                                    ;   4DB8 CDB8 C D0 02           F:008784
  LDA #$2F                                        ;   4DBA CDBA . A9 2F           
B_2_4DBC:
  TAY                                             ;   4DBC CDBC C A8              F:008784
  RTS                                             ;   4DBD CDBD C 60              F:008784

L_2_4DBE:
  DEC R_04CA                                      ;   4DBE CDBE C CE CA 04        F:008609
  BPL B_2_4DEF                                    ;   4DC1 CDC1 C 10 2C           F:008609
  LDA #$3B                                        ;   4DC3 CDC3 C A9 3B           F:008668
  STA R_04CA                                      ;   4DC5 CDC5 C 8D CA 04        F:008668
  DEC R_04CB                                      ;   4DC8 CDC8 C CE CB 04        F:008668
  BPL B_2_4DEF                                    ;   4DCB CDCB C 10 22           F:008668
  LDA #$9                                         ;   4DCD CDCD C A9 09           F:017809
  STA R_04CB                                      ;   4DCF CDCF C 8D CB 04        F:017809
  DEC R_04CC                                      ;   4DD2 CDD2 C CE CC 04        F:017809
  BPL B_2_4DEF                                    ;   4DD5 CDD5 C 10 18           F:017809
  LDA #$5                                         ;   4DD7 CDD7 . A9 05           
  STA R_04CC                                      ;   4DD9 CDD9 . 8D CC 04        
  DEC R_04CD                                      ;   4DDC CDDC . CE CD 04        
  BPL B_2_4DEF                                    ;   4DDF CDDF . 10 0E           
  LDA #$0                                         ;   4DE1 CDE1 . A9 00           
  STA R_04CD                                      ;   4DE3 CDE3 . 8D CD 04        
  STA R_04CC                                      ;   4DE6 CDE6 . 8D CC 04        
  STA R_04CB                                      ;   4DE9 CDE9 . 8D CB 04        
  STA R_04CA                                      ;   4DEC CDEC . 8D CA 04        
B_2_4DEF:
  RTS                                             ;   4DEF CDEF C 60              F:008609

L_2_4DF0:
  LDA #$21                                        ;   4DF0 CDF0 C A9 21           F:008610
  STA PpuAddr_2006                                ;   4DF2 CDF2 C 8D 06 20        F:008610
  LDA #$59                                        ;   4DF5 CDF5 C A9 59           F:008610
  STA PpuAddr_2006                                ;   4DF7 CDF7 C 8D 06 20        F:008610
  LDA R_04CD                                      ;   4DFA CDFA C AD CD 04        F:008610
  ORA #$30                                        ;   4DFD CDFD C 09 30           F:008610
  TAX                                             ;   4DFF CDFF C AA              F:008610
  LDA D_0_0F66,X                                  ;   4E00 CE00 C BD 66 8F        F:008610
  STA PpuData_2007                                ;   4E03 CE03 C 8D 07 20        F:008610
  LDA #$21                                        ;   4E06 CE06 C A9 21           F:008610
  STA PpuAddr_2006                                ;   4E08 CE08 C 8D 06 20        F:008610
  LDA #$5B                                        ;   4E0B CE0B C A9 5B           F:008610
  STA PpuAddr_2006                                ;   4E0D CE0D C 8D 06 20        F:008610
  LDA R_04CC                                      ;   4E10 CE10 C AD CC 04        F:008610
  ORA #$30                                        ;   4E13 CE13 C 09 30           F:008610
  TAX                                             ;   4E15 CE15 C AA              F:008610
  LDA D_0_0F66,X                                  ;   4E16 CE16 C BD 66 8F        F:008610
  STA PpuData_2007                                ;   4E19 CE19 C 8D 07 20        F:008610
  LDA R_04CB                                      ;   4E1C CE1C C AD CB 04        F:008610
  ORA #$30                                        ;   4E1F CE1F C 09 30           F:008610
  TAX                                             ;   4E21 CE21 C AA              F:008610
  LDA D_0_0F66,X                                  ;   4E22 CE22 C BD 66 8F        F:008610
  STA PpuData_2007                                ;   4E25 CE25 C 8D 07 20        F:008610
  RTS                                             ;   4E28 CE28 C 60              F:008610

L_2_4E29:
  LDA R_0021                                      ;   4E29 CE29 C A5 21           F:013653
  BEQ B_2_4E30                                    ;   4E2B CE2B C F0 03           F:013653
  JMP L_2_4C8F                                    ;   4E2D CE2D C 4C 8F CC        F:013653

B_2_4E30:
  DEC R_034D                                      ;   4E30 CE30 C CE 4D 03        F:013654
  BNE B_2_4E42                                    ;   4E33 CE33 C D0 0D           F:013654
  LDA #$10                                        ;   4E35 CE35 C A9 10           F:013668
  STA R_034D                                      ;   4E37 CE37 C 8D 4D 03        F:013668
  LDA R_034B                                      ;   4E3A CE3A C AD 4B 03        F:013668
  EOR #$1                                         ;   4E3D CE3D C 49 01           F:013668
  STA R_034B                                      ;   4E3F CE3F C 8D 4B 03        F:013668
B_2_4E42:
  JSR L_0_17FA                                    ;   4E42 CE42 C 20 FA 97        F:013654
  LDA R_0371                                      ;   4E45 CE45 C AD 71 03        F:013654
  TAX                                             ;   4E48 CE48 C AA              F:013654
  ASL                                             ;   4E49 CE49 C 0A              F:013654
  TAY                                             ;   4E4A CE4A C A8              F:013654
  LDA D_2_4E96,Y                                  ;   4E4B CE4B C B9 96 CE        F:013654
  ADC R_002F                                      ;   4E4E CE4E C 65 2F           F:013654
  PHA                                             ;   4E50 CE50 C 48              F:013654
  LDA D_2_4E97,Y                                  ;   4E51 CE51 C B9 97 CE        F:013654
  ADC #$0                                         ;   4E54 CE54 C 69 00           F:013654
  STA PpuAddr_2006                                ;   4E56 CE56 C 8D 06 20        F:013654
  PLA                                             ;   4E59 CE59 C 68              F:013654
  STA PpuAddr_2006                                ;   4E5A CE5A C 8D 06 20        F:013654
  LDY #$20                                        ;   4E5D CE5D C A0 20           F:013654
  LDA R_034B                                      ;   4E5F CE5F C AD 4B 03        F:013654
  BEQ B_2_4E67                                    ;   4E62 CE62 C F0 03           F:013654
  LDY D_2_4E9A,X                                  ;   4E64 CE64 C BC 9A CE        F:013668
B_2_4E67:
  LDA D_0_0F66,Y                                  ;   4E67 CE67 C B9 66 8F        F:013654
  STA PpuData_2007                                ;   4E6A CE6A C 8D 07 20        F:013654
  LDA R_0371                                      ;   4E6D CE6D C AD 71 03        F:013654
  EOR #$1                                         ;   4E70 CE70 C 49 01           F:013654
  TAX                                             ;   4E72 CE72 C AA              F:013654
  ASL                                             ;   4E73 CE73 C 0A              F:013654
  TAY                                             ;   4E74 CE74 C A8              F:013654
  LDA D_2_4E96,Y                                  ;   4E75 CE75 C B9 96 CE        F:013654
  ADC R_002F                                      ;   4E78 CE78 C 65 2F           F:013654
  PHA                                             ;   4E7A CE7A C 48              F:013654
  LDA D_2_4E97,Y                                  ;   4E7B CE7B C B9 97 CE        F:013654
  ADC #$0                                         ;   4E7E CE7E C 69 00           F:013654
  STA PpuAddr_2006                                ;   4E80 CE80 C 8D 06 20        F:013654
  PLA                                             ;   4E83 CE83 C 68              F:013654
  STA PpuAddr_2006                                ;   4E84 CE84 C 8D 06 20        F:013654
  LDY D_2_4E9A,X                                  ;   4E87 CE87 C BC 9A CE        F:013654
  LDA D_0_0F66,Y                                  ;   4E8A CE8A C B9 66 8F        F:013654
  STA PpuData_2007                                ;   4E8D CE8D C 8D 07 20        F:013654
  JSR DrawFamilyMember                                    ;   4E90 CE90 C 20 85 DA        F:013654
  JMP MMC1ResetCHRBanks                                    ;   4E93 CE93 C 4C F4 86        F:013654

D_2_4E96:
.byte $4B                                         ;   4E96 CE96 D        K        F:013654
D_2_4E97:
.byte $21,$4D,$21                                 ;   4E97 CE97 DDD      !M!      F:013654
D_2_4E9A:
.byte $59                                         ;   4E9A CE9A D        Y        F:013668
.byte $4E                                         ;   4E9B CE9B D        N        F:013654
L_2_4E9C:
  LDA SpriteUpdateFlags                           ;   4E9C CE9C C A5 2D           F:008467
  BEQ B_2_4EBA                                    ;   4E9E CE9E C F0 1A           F:008467
  CMP #$FF                                        ;   4EA0 CEA0 C C9 FF           F:009094
  BEQ B_2_4EBD                                    ;   4EA2 CEA2 C F0 19           F:009094
  CMP #$2                                         ;   4EA4 CEA4 C C9 02           F:009094
  BCC B_2_4EAE                                    ;   4EA6 CEA6 C 90 06           F:009094
  JSR L_0_1FC7                                    ;   4EA8 CEA8 C 20 C7 9F        F:009094
  JMP L_2_4EB5                                    ;   4EAB CEAB C 4C B5 CE        F:009094

B_2_4EAE:
  JSR L_0_1E4D                                    ;   4EAE CEAE C 20 4D 9E        F:009645
L_2_4EB1:
  LDA #$0                                         ;   4EB1 CEB1 C A9 00           F:009645
  STA SpriteUpdateFlags                           ;   4EB3 CEB3 C 85 2D           F:009645
L_2_4EB5:
  PLA                                             ;   4EB5 CEB5 C 68              F:009094
  PLA                                             ;   4EB6 CEB6 C 68              F:009094
  JMP L_2_4A72                                    ;   4EB7 CEB7 C 4C 72 CA        F:009094

B_2_4EBA:
  JMP L_2_4B5E                                    ;   4EBA CEBA C 4C 5E CB        F:008467

B_2_4EBD:
  JSR L_0_1F5A                                    ;   4EBD CEBD C 20 5A 9F        F:009647
  JMP L_2_4EB1                                    ;   4EC0 CEC0 C 4C B1 CE        F:009647

L_2_4EC3:
  LDY R_000F                                      ;   4EC3 CEC3 C A4 0F           F:006007
  LDA D_2_4EDA,Y                                  ;   4EC5 CEC5 C B9 DA CE        F:006007
  STA R_0039                                      ;   4EC8 CEC8 C 85 39           F:006007
  STA R_003A                                      ;   4ECA CECA C 85 3A           F:006007
  STA R_003B                                      ;   4ECC CECC C 85 3B           F:006007
  CLC                                             ;   4ECE CECE C 18              F:006007
  LDA R_000F                                      ;   4ECF CECF C A5 0F           F:006007
  ADC #$1                                         ;   4ED1 CED1 C 69 01           F:006007
  AND #$1F                                        ;   4ED3 CED3 C 29 1F           F:006007
  STA R_000F                                      ;   4ED5 CED5 C 85 0F           F:006007
  JMP L_2_4B5E                                    ;   4ED7 CED7 C 4C 5E CB        F:006007

D_2_4EDA:
.byte $0C                                         ;   4EDA CEDA D        ?        F:006007
.byte $01                                         ;   4EDB CEDB D        ?        F:006008
.byte $02                                         ;   4EDC CEDC D        ?        F:006009
.byte $03                                         ;   4EDD CEDD D        ?        F:006010
.byte $1C                                         ;   4EDE CEDE D        ?        F:006011
.byte $11                                         ;   4EDF CEDF D        ?        F:006012
.byte $12                                         ;   4EE0 CEE0 D        ?        F:006013
.byte $13                                         ;   4EE1 CEE1 D        ?        F:006014
.byte $2C                                         ;   4EE2 CEE2 D        ,        F:006015
.byte $21                                         ;   4EE3 CEE3 D        !        F:006016
.byte $22                                         ;   4EE4 CEE4 D        "        F:006017
.byte $23                                         ;   4EE5 CEE5 D        #        F:006018
.byte $3C                                         ;   4EE6 CEE6 D        <        F:006019
.byte $31                                         ;   4EE7 CEE7 D        1        F:006020
.byte $32                                         ;   4EE8 CEE8 D        2        F:006021
.byte $33                                         ;   4EE9 CEE9 D        3        F:006022
.byte $33                                         ;   4EEA CEEA D        3        F:006023
.byte $32                                         ;   4EEB CEEB D        2        F:006024
.byte $31                                         ;   4EEC CEEC D        1        F:006025
.byte $3C                                         ;   4EED CEED D        <        F:006026
.byte $23                                         ;   4EEE CEEE D        #        F:006027
.byte $22                                         ;   4EEF CEEF D        "        F:006028
.byte $21                                         ;   4EF0 CEF0 D        !        F:006029
.byte $2C                                         ;   4EF1 CEF1 D        ,        F:006030
.byte $13                                         ;   4EF2 CEF2 D        ?        F:006031
.byte $12                                         ;   4EF3 CEF3 D        ?        F:006032
.byte $11                                         ;   4EF4 CEF4 D        ?        F:006033
.byte $1C                                         ;   4EF5 CEF5 D        ?        F:006034
.byte $03                                         ;   4EF6 CEF6 D        ?        F:006035
.byte $02                                         ;   4EF7 CEF7 D        ?        F:006036
.byte $01                                         ;   4EF8 CEF8 D        ?        F:006037
.byte $0C                                         ;   4EF9 CEF9 D        ?        F:006038
L_2_4EFA:
  LDA #$1                                         ;   4EFA CEFA C A9 01           F:006106
  JSR MMC1SetCHR0                                    ;   4EFC CEFC C 20 54 99        F:006106
  LDA #$1                                         ;   4EFF CEFF C A9 01           F:006106
  JSR MMC1SetCHR1                                    ;   4F01 CF01 C 20 68 99        F:006106
  JMP L_2_4B5E                                    ;   4F04 CF04 C 4C 5E CB        F:006106

L_2_4F07:
  LDA #$1                                         ;   4F07 CF07 C A9 01           F:041645
  STA R_04E0                                      ;   4F09 CF09 C 8D E0 04        F:041645
  LDA R_04D6                                      ;   4F0C CF0C C AD D6 04        F:041645
  BEQ B_2_4F64                                    ;   4F0F CF0F C F0 53           F:041645
  CMP #$1                                         ;   4F11 CF11 C C9 01           F:041825
  BNE B_2_4F1B                                    ;   4F13 CF13 C D0 06           F:041825
  JSR L_0_05C4                                    ;   4F15 CF15 . 20 C4 85        
  JMP $CFC6                                       ;   4F18 CF18 . 4C C6 CF        

B_2_4F1B:
  CMP #$2                                         ;   4F1B CF1B C C9 02           F:041825
  BNE B_2_4F28                                    ;   4F1D CF1D C D0 09           F:041825
  JSR L_0_05E8                                    ;   4F1F CF1F C 20 E8 85        F:041840
  JSR L_0_06D9                                    ;   4F22 CF22 C 20 D9 86        F:041840
  JMP L_2_4FC6                                    ;   4F25 CF25 C 4C C6 CF        F:041840

B_2_4F28:
  CMP #$3                                         ;   4F28 CF28 C C9 03           F:041825
  BNE B_2_4F32                                    ;   4F2A CF2A C D0 06           F:041825
  JSR L_0_0641                                    ;   4F2C CF2C C 20 41 86        F:041841
  JMP L_2_4FC6                                    ;   4F2F CF2F C 4C C6 CF        F:041841

B_2_4F32:
  CMP #$4                                         ;   4F32 CF32 C C9 04           F:041825
  BNE B_2_4F3C                                    ;   4F34 CF34 C D0 06           F:041825
  JSR L_0_0C32                                    ;   4F36 CF36 . 20 32 8C        
  JMP $CFC6                                       ;   4F39 CF39 . 4C C6 CF        

B_2_4F3C:
  CMP #$5                                         ;   4F3C CF3C C C9 05           F:041825
  BNE B_2_4F46                                    ;   4F3E CF3E C D0 06           F:041825
  JSR L_1_29C3                                    ;   4F40 CF40 C 20 C3 A9        F:042370
  JMP L_2_4FC6                                    ;   4F43 CF43 C 4C C6 CF        F:042370

B_2_4F46:
  CMP #$6                                         ;   4F46 CF46 C C9 06           F:041825
  BNE B_2_4F50                                    ;   4F48 CF48 C D0 06           F:041825
  JSR L_1_2BBA                                    ;   4F4A CF4A C 20 BA AB        F:041825
  JMP L_2_4FC6                                    ;   4F4D CF4D C 4C C6 CF        F:041825

B_2_4F50:
  CMP #$7                                         ;   4F50 CF50 C C9 07           F:041826
  BNE B_2_4F5A                                    ;   4F52 CF52 C D0 06           F:041826
  JSR LoadQuestionFromCHR                                    ;   4F54 CF54 C 20 8C AF        F:041826
  JMP L_2_4FC6                                    ;   4F57 CF57 C 4C C6 CF        F:041826

B_2_4F5A:
  CMP #$8                                         ;   4F5A CF5A C C9 08           F:041839
  BNE B_2_4F64                                    ;   4F5C CF5C C D0 06           F:041839
  JSR DrawQuestionText                                    ;   4F5E CF5E C 20 C4 87        F:041839
  JMP L_2_4FC6                                    ;   4F61 CF61 C 4C C6 CF        F:041839

B_2_4F64:
  LDA R_0550                                      ;   4F64 CF64 C AD 50 05        F:041645
  CMP #$FF                                        ;   4F67 CF67 C C9 FF           F:041645
  BEQ B_2_4FAD                                    ;   4F69 CF69 C F0 42           F:041645
  CMP #$FE                                        ;   4F6B CF6B C C9 FE           F:041842
  BEQ B_2_4FB0                                    ;   4F6D CF6D C F0 41           F:041842
  INC R_054F                                      ;   4F6F CF6F C EE 4F 05        F:041842
  LDA R_054F                                      ;   4F72 CF72 C AD 4F 05        F:041842
  CMP #$10                                        ;   4F75 CF75 C C9 10           F:041842
  BCC B_2_4FAD                                    ;   4F77 CF77 C 90 34           F:041842
  LDA #$0                                         ;   4F79 CF79 C A9 00           F:041857
  STA R_054F                                      ;   4F7B CF7B C 8D 4F 05        F:041857
  LDA R_054E                                      ;   4F7E CF7E C AD 4E 05        F:041857
  ASL                                             ;   4F81 CF81 C 0A              F:041857
  TAX                                             ;   4F82 CF82 C AA              F:041857
  LDA L_2_4FBB,X                                  ;   4F83 CF83 C BD BB CF        F:041857
  STA PpuAddr_2006                                ;   4F86 CF86 C 8D 06 20        F:041857
  LDA L_2_4FBA,X                                  ;   4F89 CF89 C BD BA CF        F:041857
  STA PpuAddr_2006                                ;   4F8C CF8C C 8D 06 20        F:041857
  LDA R_0550                                      ;   4F8F CF8F C AD 50 05        F:041857
  EOR #$1                                         ;   4F92 CF92 C 49 01           F:041857
  STA R_0550                                      ;   4F94 CF94 C 8D 50 05        F:041857
  BEQ B_2_4FA0                                    ;   4F97 CF97 C F0 07           F:041857
  LDA #$0                                         ;   4F99 CF99 C A9 00           F:041857
  STA PpuData_2007                                ;   4F9B CF9B C 8D 07 20        F:041857
  BEQ B_2_4FAD                                    ;   4F9E CF9E C F0 0D           F:041857
B_2_4FA0:
  LDA R_054E                                      ;   4FA0 CFA0 C AD 4E 05        F:041873
  CLC                                             ;   4FA3 CFA3 C 18              F:041873
  ADC #$30                                        ;   4FA4 CFA4 C 69 30           F:041873
  TAX                                             ;   4FA6 CFA6 C AA              F:041873
  LDA PaletteData18_2,X                                  ;   4FA7 CFA7 C BD AD A5        F:041873
  STA PpuData_2007                                ;   4FAA CFAA C 8D 07 20        F:041873
B_2_4FAD:
  JMP L_2_4B71                                    ;   4FAD CFAD C 4C 71 CB        F:041645

B_2_4FB0:
  INC R_054E                                      ;   4FB0 CFB0 C EE 4E 05        F:042369
  JSR L_1_29C3                                    ;   4FB3 CFB3 C 20 C3 A9        F:042369
  DEC R_054E                                      ;   4FB6 CFB6 C CE 4E 05        F:042369
  JMP L_2_4B5E                                    ;   4FB9 CFB9 C 4C 5E CB        F:042369

D_2_4FBC:
.byte $02                                         ;   4FBC CFBC D        ?        F:041857
D_2_4FBD:
.byte $22                                         ;   4FBD CFBD D        "        F:041857
.byte $42,$22                                     ;   4FBE CFBE DD       B"       F:042383
.byte $82,$22                                     ;   4FC0 CFC0 DD       ?"       F:042607
.byte $C2,$22                                     ;   4FC2 CFC2 DD       ?"       F:042722
.byte $02,$23                                     ;   4FC4 CFC4 DD       ?#       F:042867
L_2_4FC6:
  LDA #$0                                         ;   4FC6 CFC6 C A9 00           F:041825
  STA R_04D6                                      ;   4FC8 CFC8 C 8D D6 04        F:041825
  RTS                                             ;   4FCB CFCB C 60              F:041825

B_2_4FCC:
  RTS                                             ;   4FCC CFCC C 60              F:006101

UpdatePalettes:
  JSR PPUCTRLSetWriteHorizontal                                    ;   4FCD CFCD C 20 E3 99        F:000007
  LDA PaletteDirtyFlag                            ;   4FD0 CFD0 C AD 3D 03        F:000007
  BNE B_2_5027                                    ;   4FD3 CFD3 C D0 52           F:000007
  LDA R_001F                                      ;   4FD5 CFD5 C A5 1F           F:006101
  BEQ B_2_4FCC                                    ;   4FD7 CFD7 C F0 F3           F:006101
  LDA #$3F                                        ;   4FD9 CFD9 C A9 3F           F:008467
  STA PpuAddr_2006                                ;   4FDB CFDB C 8D 06 20        F:008467
  LDA #$0                                         ;   4FDE CFDE C A9 00           F:008467
  STA PpuAddr_2006                                ;   4FE0 CFE0 C 8D 06 20        F:008467
  LDY a:R_0020                                    ;   4FE3 CFE3 C AC 20 00        F:008467
  LDA BGBackgrounds,Y                                  ;   4FE6 CFE6 C B9 10 A4        F:008467
  JSR MMC1SetCHR0                                    ;   4FE9 CFE9 C 20 54 99        F:008467
  LDA ActiveScene                                 ;   4FEC CFEC C AD D3 04        F:008467
  BNE B_2_4FFC                                    ;   4FEF CFEF C D0 0B           F:008467
  LDX ActiveFamily                                ;   4FF1 CFF1 C A6 0B           F:010401
  LDY Family1,X                                   ;   4FF3 CFF3 C BC 15 03        F:010401
  LDA D_0_1013,Y                                  ;   4FF6 CFF6 C B9 13 90        F:010401
  JMP L_2_4FFF                                    ;   4FF9 CFF9 C 4C FF CF        F:010401

B_2_4FFC:
  LDA BGBackgrounds+3,Y                                  ;   4FFC CFFC C B9 13 A4        F:008467
L_2_4FFF:
  ASL                                             ;   4FFF CFFF C 0A              F:008467
  TAY                                             ;   5000 D000 C A8              F:008467
  LDA PalettePtrs,Y                                  ;   5001 D001 C B9 60 A4        F:008467
  STA R_002B                                      ;   5004 D004 C 85 2B           F:008467
  LDA PalettePtrs+1,Y                                  ;   5006 D006 C B9 61 A4        F:008467
  STA R_002C                                      ;   5009 D009 C 85 2C           F:008467
  LDY #$0                                         ;   500B D00B C A0 00           F:008467
  STY R_001F                                      ;   500D D00D C 84 1F           F:008467
B_2_500F:
  LDA (R_002B),Y                                  ;   500F D00F C B1 2B           F:008467
  STA PpuData_2007                                ;   5011 D011 C 8D 07 20        F:008467
  INY                                             ;   5014 D014 C C8              F:008467
  CPY #$10                                        ;   5015 D015 C C0 10           F:008467
  BNE B_2_500F                                    ;   5017 D017 C D0 F6           F:008467
  LDA #$0                                         ;   5019 D019 C A9 00           F:008467
  STA PpuAddr_2006                                ;   501B D01B C 8D 06 20        F:008467
  STA PpuAddr_2006                                ;   501E D01E C 8D 06 20        F:008467
  RTS                                             ;   5021 D021 C 60              F:008467

.byte $AD,$3D,$03,$F0,$A5                         ;   5022 D022 .....    ?=???    
B_2_5027:
  LDA #$3F                                        ;   5027 D027 C A9 3F           F:000007
  STA PpuAddr_2006                                ;   5029 D029 C 8D 06 20        F:000007
  LDA #$10                                        ;   502C D02C C A9 10           F:000007
  STA PpuAddr_2006                                ;   502E D02E C 8D 06 20        F:000007
  LDX #$0                                         ;   5031 D031 C A2 00           F:000007
B_2_5033:
  LDA PaletteSpriteCopy,X                         ;   5033 D033 C B5 30           F:000007
  STA PpuData_2007                                ;   5035 D035 C 8D 07 20        F:000007
  INX                                             ;   5038 D038 C E8              F:000007
  CPX #$10                                        ;   5039 D039 C E0 10           F:000007
  BNE B_2_5033                                    ;   503B D03B C D0 F6           F:000007
  LDA #$3F                                        ;   503D D03D C A9 3F           F:000007
  STA PpuAddr_2006                                ;   503F D03F C 8D 06 20        F:000007
  LDX #$0                                         ;   5042 D042 C A2 00           F:000007
  STX PpuAddr_2006                                ;   5044 D044 C 8E 06 20        F:000007
  STX R_001F                                      ;   5047 D047 C 86 1F           F:000007
B_2_5049:
  LDA PaletteBackgroundCopy,X                     ;   5049 D049 C BD 1D 03        F:000007
  STA PpuData_2007                                ;   504C D04C C 8D 07 20        F:000007
  INX                                             ;   504F D04F C E8              F:000007
  CPX #$10                                        ;   5050 D050 C E0 10           F:000007
  BNE B_2_5049                                    ;   5052 D052 C D0 F5           F:000007
  RTS                                             ;   5054 D054 C 60              F:000007

L_2_5055:
  LDA R_0050                                      ;   5055 D055 C A5 50           F:006299
  CMP #$FD                                        ;   5057 D057 C C9 FD           F:006299
  BNE B_2_505E                                    ;   5059 D059 C D0 03           F:006299
  JMP L_2_50B0                                    ;   505B D05B C 4C B0 D0        F:007209

B_2_505E:
  LDA R_035E                                      ;   505E D05E C AD 5E 03        F:006299
  BEQ B_2_506A                                    ;   5061 D061 C F0 07           F:006299
  LDA R_0050                                      ;   5063 D063 C A5 50           F:006301
  BMI B_2_5073                                    ;   5065 D065 C 30 0C           F:006301
  JMP L_2_508F                                    ;   5067 D067 C 4C 8F D0        F:006320

B_2_506A:
  JSR DrawFamilyMember                                    ;   506A D06A C 20 85 DA        F:006299
  JSR MMC1ResetCHRBanks                                    ;   506D D06D C 20 F4 86        F:006299
  JMP L_2_4B5E                                    ;   5070 D070 C 4C 5E CB        F:006299

B_2_5073:
  CMP #$FF                                        ;   5073 D073 C C9 FF           F:006301
  BEQ B_2_506A                                    ;   5075 D075 C F0 F3           F:006301
  JSR L_2_50E3                                    ;   5077 D077 C 20 E3 D0        F:006422
  LDX R_00D1                                      ;   507A D07A C A6 D1           F:006422
  LDA R_0048,X                                    ;   507C D07C C B5 48           F:006422
  BMI B_2_5092                                    ;   507E D07E C 30 12           F:006422
  LDX R_00D1                                      ;   5080 D080 C A6 D1           F:006422
  DEX                                             ;   5082 D082 C CA              F:006422
  JSR L_2_50CE                                    ;   5083 D083 C 20 CE D0        F:006422
  LDA #$1                                         ;   5086 D086 C A9 01           F:006422
  STA R_0050                                      ;   5088 D088 C 85 50           F:006422
  LDA #$41                                        ;   508A D08A C A9 41           F:006422
  JSR L_0_16E3                                    ;   508C D08C C 20 E3 96        F:006422
L_2_508F:
  JSR L_2_50E3                                    ;   508F D08F C 20 E3 D0        F:006320
B_2_5092:
  JSR PPUCTRLSetWriteVertical                                    ;   5092 D092 C 20 ED 99        F:006320
  LDA #$20                                        ;   5095 D095 C A9 20           F:006320
  STA PpuAddr_2006                                ;   5097 D097 C 8D 06 20        F:006320
  LDA #$7C                                        ;   509A D09A C A9 7C           F:006320
  STA PpuAddr_2006                                ;   509C D09C C 8D 06 20        F:006320
  LDA #$6                                         ;   509F D09F C A9 06           F:006320
  STA PpuData_2007                                ;   50A1 D0A1 C 8D 07 20        F:006320
  STA PpuData_2007                                ;   50A4 D0A4 C 8D 07 20        F:006320
  STA PpuData_2007                                ;   50A7 D0A7 C 8D 07 20        F:006320
  JSR PPUCTRLSetWriteHorizontal                                    ;   50AA D0AA C 20 E3 99        F:006320
  JMP B_2_506A                                    ;   50AD D0AD C 4C 6A D0        F:006320

L_2_50B0:
  JSR L_2_50E3                                    ;   50B0 D0B0 C 20 E3 D0        F:007209
  LDX R_00D1                                      ;   50B3 D0B3 C A6 D1           F:007209
  JSR L_2_50CE                                    ;   50B5 D0B5 C 20 CE D0        F:007209
  LDX R_00D1                                      ;   50B8 D0B8 C A6 D1           F:007209
  CPX #$7                                         ;   50BA D0BA C E0 07           F:007209
  BEQ B_2_50C7                                    ;   50BC D0BC C F0 09           F:007209
  LDA R_0048,X                                    ;   50BE D0BE C B5 48           F:007209
  BMI B_2_50C7                                    ;   50C0 D0C0 C 30 05           F:007209
  INC R_00D1                                      ;   50C2 D0C2 C E6 D1           F:007209
  JMP B_2_5092                                    ;   50C4 D0C4 C 4C 92 D0        F:007209

B_2_50C7:
  LDA #$FF                                        ;   50C7 D0C7 C A9 FF           F:007214
  STA R_0050                                      ;   50C9 D0C9 C 85 50           F:007214
  JMP B_2_5092                                    ;   50CB D0CB C 4C 92 D0        F:007214

L_2_50CE:
  LDA R_0048,X                                    ;   50CE D0CE C B5 48           F:006422
  SEC                                             ;   50D0 D0D0 C 38              F:006422
  SBC #$41                                        ;   50D1 D0D1 C E9 41           F:006422
  TAY                                             ;   50D3 D0D3 C A8              F:006422
  CLC                                             ;   50D4 D0D4 C 18              F:006422
  LDA R_00CF                                      ;   50D5 D0D5 C A5 CF           F:006422
  ADC D_0_1488,Y                                  ;   50D7 D0D7 C 79 88 94        F:006422
  STA R_00CF                                      ;   50DA D0DA C 85 CF           F:006422
  LDA R_00D0                                      ;   50DC D0DC C A5 D0           F:006422
  ADC #$0                                         ;   50DE D0DE C 69 00           F:006422
  STA R_00D0                                      ;   50E0 D0E0 C 85 D0           F:006422
  RTS                                             ;   50E2 D0E2 C 60              F:006422

L_2_50E3:
  LDA R_00D0                                      ;   50E3 D0E3 C A5 D0           F:006320
  STA PpuAddr_2006                                ;   50E5 D0E5 C 8D 06 20        F:006320
  LDA R_00CF                                      ;   50E8 D0E8 C A5 CF           F:006320
  STA PpuAddr_2006                                ;   50EA D0EA C 8D 06 20        F:006320
  LDX #$4                                         ;   50ED D0ED C A2 04           F:006320
  LDY #$0                                         ;   50EF D0EF C A0 00           F:006320
B_2_50F1:
  INY                                             ;   50F1 D0F1 C C8              F:006320
  LDA a:R_0050,Y                                  ;   50F2 D0F2 C B9 50 00        F:006320
  STA PpuData_2007                                ;   50F5 D0F5 C 8D 07 20        F:006320
  DEX                                             ;   50F8 D0F8 C CA              F:006320
  BNE B_2_50F1                                    ;   50F9 D0F9 C D0 F6           F:006320
  CLC                                             ;   50FB D0FB C 18              F:006320
  LDA R_00CF                                      ;   50FC D0FC C A5 CF           F:006320
  ADC #$20                                        ;   50FE D0FE C 69 20           F:006320
  PHA                                             ;   5100 D100 C 48              F:006320
  LDA R_00D0                                      ;   5101 D101 C A5 D0           F:006320
  ADC #$0                                         ;   5103 D103 C 69 00           F:006320
  STA PpuAddr_2006                                ;   5105 D105 C 8D 06 20        F:006320
  PLA                                             ;   5108 D108 C 68              F:006320
  STA PpuAddr_2006                                ;   5109 D109 C 8D 06 20        F:006320
  LDX #$4                                         ;   510C D10C C A2 04           F:006320
B_2_510E:
  INY                                             ;   510E D10E C C8              F:006320
  LDA a:R_0050,Y                                  ;   510F D10F C B9 50 00        F:006320
  STA PpuData_2007                                ;   5112 D112 C 8D 07 20        F:006320
  DEX                                             ;   5115 D115 C CA              F:006320
  BNE B_2_510E                                    ;   5116 D116 C D0 F6           F:006320
  CLC                                             ;   5118 D118 C 18              F:006320
  LDA R_00CF                                      ;   5119 D119 C A5 CF           F:006320
  ADC #$40                                        ;   511B D11B C 69 40           F:006320
  PHA                                             ;   511D D11D C 48              F:006320
  LDA R_00D0                                      ;   511E D11E C A5 D0           F:006320
  ADC #$0                                         ;   5120 D120 C 69 00           F:006320
  STA PpuAddr_2006                                ;   5122 D122 C 8D 06 20        F:006320
  PLA                                             ;   5125 D125 C 68              F:006320
  STA PpuAddr_2006                                ;   5126 D126 C 8D 06 20        F:006320
  LDX #$4                                         ;   5129 D129 C A2 04           F:006320
B_2_512B:
  INY                                             ;   512B D12B C C8              F:006320
  LDA a:R_0050,Y                                  ;   512C D12C C B9 50 00        F:006320
  STA PpuData_2007                                ;   512F D12F C 8D 07 20        F:006320
  DEX                                             ;   5132 D132 C CA              F:006320
  BNE B_2_512B                                    ;   5133 D133 C D0 F6           F:006320
  RTS                                             ;   5135 D135 C 60              F:006320

VSTART:
  sei                                             ; regular startup
  cld
  lda #$00
  sta PpuControl_2000
  sta PpuMask_2001
  ldx #$EF                                        ; reset the stack
  txs
  ldx #$02                                        ; loop delay and rng init a couple of times
@Delay:
: inc RNG1                                        ; advance rng...
  bit PpuStatus_2002
  bpl :-
: inc RNG2                                        ; advance rng...
  bit PpuStatus_2002
  bmi :-
  inc RNG3                                        ; advance rng...
  dex                                             ; decrement rng loop counter
  bne @Delay                                      ; and loop back until done
  inc $9FFF                                       ; clear mmc1
  inc $BFFF
  inc $DFFF
  inc $FFFF
  lda #$12                                        ; setup mmc1
  jsr MMC1Setup
  jsr MMC1SetCHR0
  jsr MMC1SetCHR1
  ldx #$08                                        ; clear $08-$FF
: sta $08,x
  inx
  bne :-
: sta $0200,x                                     ; clear $200-$7FF
  sta $0300,x
  sta $0400,x
  sta $0500,x
  sta $0600,x
  sta $0700,x
  inx
  bne :-
  sta $01FD                                       ; and clear the byte after the RNG
  lda #%00001000                                  ; set sprite pattern table to $1000
  sta PpuControl_2000
  sta PPUCTRL_Mirror
  lda #%00000110                                  ; turn on screen edge sprites
  sta PpuMask_2001
  sta PPUMASK_Mirror
  jsr JoypadReadState
  lda HotBootMarker                               ; check if we're in a reset or cold boot
  cmp #$48
  bne @ColdBoot
  lda HotBootMarker+1
  cmp #$49
  beq @HotBoot
@ColdBoot:
  jsr RunCopyrightScene                           ; display the copyright scene
  lda #$48                                        ; then mark us as booted, so we can skip ahead next time
  sta HotBootMarker
  lda #$49
  sta HotBootMarker+1
  sta $05A7
@HotBoot:
  jsr L_2_522B
  ldx #$0F                                        ; initialize palette sprite copy
  lda #$0F
@ClearPaletteSpriteCopy:
  sta PaletteSpriteCopy,x
  dex
  bpl @ClearPaletteSpriteCopy
  jmp RunMainGame
  
PaletteSprites:
.byte $16,$20,$26,$0F
.byte $16,$0A,$15,$0F
.byte $16,$0F,$0F,$0F
.byte $16,$27,$0F,$0F

D_2_51DF:
.addr L_2_549E                                    ;   51DF D1DF N 9E D4
D_2_51E0 = * - 1
.addr L_2_54A6                                    ;   51E1 D1E1 N A6 D4
.addr L_2_54B2                                    ;   51E3 D1E3 N B2 D4
.addr L_2_54B9                                    ;   51E5 D1E5 N B9 D4
.addr L_2_54C0                                    ;   51E7 D1E7 N C0 D4
.addr L_2_54C9                                    ;   51E9 D1E9 N C9 D4
.addr L_2_54D2                                    ;   51EB D1EB N D2 D4
.byte $DB,$D4,$E4,$D4                             ;   51ED D1ED ....     ????     
.addr L_2_54ED                                    ;   51F1 D1F1 N ED D4
.addr L_2_5502                                    ;   51F3 D1F3 N 02 D5
.addr L_2_5511                                    ;   51F5 D1F5 N 11 D5
.addr L_2_5517                                    ;   51F7 D1F7 N 17 D5
.byte $37,$D5,$11,$D5,$11,$D5                     ;   51F9 D1F9 ......   7?????   
D_2_51FF:
.byte $55                                         ;   51FF D1FF .        U        
D_2_5200:
.byte $D5                                         ;   5200 D200 .        ?        
.addr L_2_555D                                    ;   5201 D201 N 5D D5
.byte $69,$D5,$70,$D5,$76,$D5,$76,$D5             ;   5203 D203 ........ i?p?v?v? 
.addr L_2_5576                                    ;   520B D20B N 76 D5
.byte $76,$D5,$76,$D5                             ;   520D D20D ....     v?v?     
.addr L_2_5577                                    ;   5211 D211 N 77 D5
.addr L_2_558C                                    ;   5213 D213 N 8C D5
.addr L_2_5555                                    ;   5215 D215 N 55 D5
.byte $9B,$D5,$B5,$D5,$55,$D5                     ;   5217 D217 ......   ????U?   
.addr L_2_55D3                                    ;   521D D21D N D3 D5
D_2_521F:
.byte $00                                         ;   521F D21F D        ?        F:007147
.byte $19                                         ;   5220 D220 D        ?        F:006298
.byte $32                                         ;   5221 D221 D        2        F:023618
.byte $7B,$7B                                     ;   5222 D222 DD       {{       F:006105
.byte $7B                                         ;   5224 D224 D        {        F:022726
.byte $4B                                         ;   5225 D225 D        K        F:008274
.byte $5B                                         ;   5226 D226 D        [        F:047461
.byte $6B                                         ;   5227 D227 D        k        F:023711
.byte $00,$19,$32                                 ;   5228 D228 ...      ??2      
L_2_522B:
  LDX #$1                                         ;   522B D22B C A2 01           F:000318
B_2_522D:
  LDA #$FF                                        ;   522D D22D C A9 FF           F:000318
  STA R_05C5,X                                    ;   522F D22F C 9D C5 05        F:000318
  LDA #$0                                         ;   5232 D232 C A9 00           F:000318
  STA EntityXLo,X                                 ;   5234 D234 C 9D C9 05        F:000318
  STA EntityXHi,X                                 ;   5237 D237 C 9D C7 05        F:000318
  STA EntityYLo,X                                 ;   523A D23A C 9D CD 05        F:000318
  STA EntityYHi,X                                 ;   523D D23D C 9D CB 05        F:000318
  STA R_05CF,X                                    ;   5240 D240 C 9D CF 05        F:000318
  STA R_05D1,X                                    ;   5243 D243 C 9D D1 05        F:000318
  STA R_05D3,X                                    ;   5246 D246 C 9D D3 05        F:000318
  STA R_05D5,X                                    ;   5249 D249 C 9D D5 05        F:000318
  STA R_05D7,X                                    ;   524C D24C C 9D D7 05        F:000318
  STA R_05D9,X                                    ;   524F D24F C 9D D9 05        F:000318
  STA R_05DB,X                                    ;   5252 D252 C 9D DB 05        F:000318
  STA R_05DD,X                                    ;   5255 D255 C 9D DD 05        F:000318
  STA R_05DF,X                                    ;   5258 D258 C 9D DF 05        F:000318
  STA R_05E1,X                                    ;   525B D25B C 9D E1 05        F:000318
  DEX                                             ;   525E D25E C CA              F:000318
  BPL B_2_522D                                    ;   525F D25F C 10 CC           F:000318
  LDX #$1                                         ;   5261 D261 C A2 01           F:000318
B_2_5263:
  LDA #$FF                                        ;   5263 D263 C A9 FF           F:000318
  STA R_05E3,X                                    ;   5265 D265 C 9D E3 05        F:000318
  LDA #$0                                         ;   5268 D268 C A9 00           F:000318
  STA R_05E5,X                                    ;   526A D26A C 9D E5 05        F:000318
  STA R_05E7,X                                    ;   526D D26D C 9D E7 05        F:000318
  STA R_05E9,X                                    ;   5270 D270 C 9D E9 05        F:000318
  STA R_05EB,X                                    ;   5273 D273 C 9D EB 05        F:000318
  STA R_05ED,X                                    ;   5276 D276 C 9D ED 05        F:000318
  STA R_05EF,X                                    ;   5279 D279 C 9D EF 05        F:000318
  STA R_05F1,X                                    ;   527C D27C C 9D F1 05        F:000318
  STA R_05F3,X                                    ;   527F D27F C 9D F3 05        F:000318
  STA R_05F5,X                                    ;   5282 D282 C 9D F5 05        F:000318
  STA R_05F7,X                                    ;   5285 D285 C 9D F7 05        F:000318
  DEX                                             ;   5288 D288 C CA              F:000318
  BPL B_2_5263                                    ;   5289 D289 C 10 D8           F:000318
  RTS                                             ;   528B D28B C 60              F:000318

L_2_528C:
  LDX #$2                                         ;   528C D28C C A2 02           F:006105
B_2_528E:
  DEX                                             ;   528E D28E C CA              F:006105
  BMI B_2_529C                                    ;   528F D28F C 30 0B           F:006105
  LDA R_05C5,X                                    ;   5291 D291 C BD C5 05        F:006105
  CMP #$FF                                        ;   5294 D294 C C9 FF           F:006105
  BNE B_2_528E                                    ;   5296 D296 C D0 F6           F:006105
  TYA                                             ;   5298 D298 C 98              F:006105
  STA R_05E1,X                                    ;   5299 D299 C 9D E1 05        F:006105
B_2_529C:
  RTS                                             ;   529C D29C C 60              F:006105

L_2_529D:
  LDX #$2                                         ;   529D D29D C A2 02           F:006105
B_2_529F:
  DEX                                             ;   529F D29F C CA              F:006105
  BMI B_2_52A9                                    ;   52A0 D2A0 C 30 07           F:006105
  LDA R_05E3,X                                    ;   52A2 D2A2 C BD E3 05        F:006105
  CMP #$FF                                        ;   52A5 D2A5 C C9 FF           F:006105
  BNE B_2_529F                                    ;   52A7 D2A7 C D0 F6           F:006105
B_2_52A9:
  RTS                                             ;   52A9 D2A9 C 60              F:006105

L_2_52AA:
  LDA #$FF                                        ;   52AA D2AA C A9 FF           F:006294
  STA R_05C5,X                                    ;   52AC D2AC C 9D C5 05        F:006294
  RTS                                             ;   52AF D2AF C 60              F:006294

L_2_52B0:
  LDA #$FF                                        ;   52B0 D2B0 C A9 FF           F:006105
  STA R_05E3,X                                    ;   52B2 D2B2 C 9D E3 05        F:006105
B_2_52B5:
  RTS                                             ;   52B5 D2B5 C 60              F:006105

L_2_52B6:
  LDX R_05C1                                      ;   52B6 D2B6 C AE C1 05        F:006295
  BMI B_2_52BE                                    ;   52B9 D2B9 C 30 03           F:006295
  JSR L_2_52AA                                    ;   52BB D2BB C 20 AA D2        F:006295
B_2_52BE:
  LDX R_05C3                                      ;   52BE D2BE C AE C3 05        F:006295
  BMI B_2_52C6                                    ;   52C1 D2C1 C 30 03           F:006295
  JSR L_2_52B0                                    ;   52C3 D2C3 C 20 B0 D2        F:006295
B_2_52C6:
  LDX R_05C4                                      ;   52C6 D2C6 C AE C4 05        F:006295
  BMI B_2_52CE                                    ;   52C9 D2C9 C 30 03           F:006295
  JSR L_2_52B0                                    ;   52CB D2CB C 20 B0 D2        F:006295
B_2_52CE:
  LDX R_05C2                                      ;   52CE D2CE C AE C2 05        F:006295
  BMI B_2_52B5                                    ;   52D1 D2D1 C 30 E2           F:006295
  JMP L_2_52AA                                    ;   52D3 D2D3 C 4C AA D2        F:006295

L_2_52D6:
  LDX #$1                                         ;   52D6 D2D6 C A2 01           F:006105
B_2_52D8:
  JSR L_2_52F7                                    ;   52D8 D2D8 C 20 F7 D2        F:006105
  DEX                                             ;   52DB D2DB C CA              F:006105
  BPL B_2_52D8                                    ;   52DC D2DC C 10 FA           F:006105
  LDX #$1                                         ;   52DE D2DE C A2 01           F:006105
B_2_52E0:
  STA R_01F5                                      ;   52E0 D2E0 C 8D F5 01        F:006105
  TXA                                             ;   52E3 D2E3 C 8A              F:006105
  PHA                                             ;   52E4 D2E4 C 48              F:006105
  LDA R_01F5                                      ;   52E5 D2E5 C AD F5 01        F:006105
  JSR L_2_536C                                    ;   52E8 D2E8 C 20 6C D3        F:006105
  STA R_01F5                                      ;   52EB D2EB C 8D F5 01        F:006105
  PLA                                             ;   52EE D2EE C 68              F:006105
  TAX                                             ;   52EF D2EF C AA              F:006105
  LDA R_01F5                                      ;   52F0 D2F0 C AD F5 01        F:006105
  DEX                                             ;   52F3 D2F3 C CA              F:006105
  BPL B_2_52E0                                    ;   52F4 D2F4 C 10 EA           F:006105
  RTS                                             ;   52F6 D2F6 C 60              F:006105

L_2_52F7:
  LDA R_05C5,X                                    ;   52F7 D2F7 C BD C5 05        F:006105
  CMP #$FF                                        ;   52FA D2FA C C9 FF           F:006105
  BEQ B_2_536B                                    ;   52FC D2FC C F0 6D           F:006105
  CMP #$80                                        ;   52FE D2FE C C9 80           F:006107
  BCC B_2_531F                                    ;   5300 D300 C 90 1D           F:006107
  AND #$7F                                        ;   5302 D302 C 29 7F           F:006107
  CMP #$33                                        ;   5304 D304 C C9 33           F:006107
  BCS B_2_536B                                    ;   5306 D306 C B0 63           F:006107
  STA R_05C5,X                                    ;   5308 D308 C 9D C5 05        F:006107
  LDA #$0                                         ;   530B D30B C A9 00           F:006107
  STA R_05D9,X                                    ;   530D D30D C 9D D9 05        F:006107
  STA R_05D5,X                                    ;   5310 D310 C 9D D5 05        F:006107
  STA R_05D7,X                                    ;   5313 D313 C 9D D7 05        F:006107
  STA R_05DB,X                                    ;   5316 D316 C 9D DB 05        F:006107
  STA R_05DD,X                                    ;   5319 D319 C 9D DD 05        F:006107
  STA R_05DF,X                                    ;   531C D31C C 9D DF 05        F:006107
B_2_531F:
  LDA R_05D5,X                                    ;   531F D31F C BD D5 05        F:006107
  BNE B_2_5365                                    ;   5322 D322 C D0 41           F:006107
  LDA R_05D7,X                                    ;   5324 D324 C BD D7 05        F:006107
  STA R_05D5,X                                    ;   5327 D327 C 9D D5 05        F:006107
L_2_532A:
  LDA R_05C5,X                                    ;   532A D32A C BD C5 05        F:006107
  ASL                                             ;   532D D32D C 0A              F:006107
  TAY                                             ;   532E D32E C A8              F:006107
  LDA D_2_55FA,Y                                  ;   532F D32F C B9 FA D5        F:006107
  STA JoypadBoth                                      ;   5332 D332 C 85 15           F:006107
  LDA D_2_55FB,Y                                  ;   5334 D334 C B9 FB D5        F:006107
  STA BGDrawPPUAddress                            ;   5337 D337 C 85 16           F:006107
  LDY R_05D9,X                                    ;   5339 D339 C BC D9 05        F:006107
  INC R_05D9,X                                    ;   533C D33C C FE D9 05        F:006107
  LDA (JoypadBoth),Y                                  ;   533F D33F C B1 15           F:006107
  CMP #$F0                                        ;   5341 D341 C C9 F0           F:006107
  BCC B_2_535F                                    ;   5343 D343 C 90 1A           F:006107
  SBC #$F0                                        ;   5345 D345 C E9 F0           F:006107
  ASL                                             ;   5347 D347 C 0A              F:006107
  TAY                                             ;   5348 D348 C A8              F:006107
  LDA D_2_51DF,Y                                  ;   5349 D349 C B9 DF D1        F:006107
  STA BGDrawPPUAddress+1                          ;   534C D34C C 85 17           F:006107
  LDA D_2_51E0,Y                                  ;   534E D34E C B9 E0 D1        F:006107
  STA R_0018                                      ;   5351 D351 C 85 18           F:006107
  LDY R_05D9,X                                    ;   5353 D353 C BC D9 05        F:006107
  JSR L_2_535C                                    ;   5356 D356 C 20 5C D3        F:006107
  JMP L_2_532A                                    ;   5359 D359 C 4C 2A D3        F:006107

L_2_535C:
  JMP (BGDrawPPUAddress+1)                        ;   535C D35C C 6C 17 00        F:006107

B_2_535F:
  STA R_05D3,X                                    ;   535F D35F C 9D D3 05        F:006107
  JMP L_2_5368                                    ;   5362 D362 C 4C 68 D3        F:006107

B_2_5365:
  DEC R_05D5,X                                    ;   5365 D365 C DE D5 05        F:006108
L_2_5368:
  JSR L_2_5447                                    ;   5368 D368 C 20 47 D4        F:006107
B_2_536B:
  RTS                                             ;   536B D36B C 60              F:006105

L_2_536C:
  LDA R_05E3,X                                    ;   536C D36C C BD E3 05        F:006105
  CMP #$FF                                        ;   536F D36F C C9 FF           F:006105
  BEQ B_2_53E0                                    ;   5371 D371 C F0 6D           F:006105
  CMP #$80                                        ;   5373 D373 C C9 80           F:006105
  BCC B_2_5394                                    ;   5375 D375 C 90 1D           F:006105
  AND #$7F                                        ;   5377 D377 C 29 7F           F:006105
  CMP #$33                                        ;   5379 D379 C C9 33           F:006105
  BCS B_2_53E0                                    ;   537B D37B C B0 63           F:006105
  STA R_05E3,X                                    ;   537D D37D C 9D E3 05        F:006105
  LDA #$0                                         ;   5380 D380 C A9 00           F:006105
  STA R_05EF,X                                    ;   5382 D382 C 9D EF 05        F:006105
  STA R_05EB,X                                    ;   5385 D385 C 9D EB 05        F:006105
  STA R_05ED,X                                    ;   5388 D388 C 9D ED 05        F:006105
  STA R_05F1,X                                    ;   538B D38B C 9D F1 05        F:006105
  STA R_05F3,X                                    ;   538E D38E C 9D F3 05        F:006105
  STA R_05F5,X                                    ;   5391 D391 C 9D F5 05        F:006105
B_2_5394:
  LDA R_05EB,X                                    ;   5394 D394 C BD EB 05        F:006105
  BNE B_2_53DD                                    ;   5397 D397 C D0 44           F:006105
  LDA R_05ED,X                                    ;   5399 D399 C BD ED 05        F:006105
  STA R_05EB,X                                    ;   539C D39C C 9D EB 05        F:006105
L_2_539F:
  LDA R_05E3,X                                    ;   539F D39F C BD E3 05        F:006105
  ASL                                             ;   53A2 D3A2 C 0A              F:006105
  TAY                                             ;   53A3 D3A3 C A8              F:006105
  LDA D_2_55FA,Y                                  ;   53A4 D3A4 C B9 FA D5        F:006105
  STA JoypadBoth                                      ;   53A7 D3A7 C 85 15           F:006105
  LDA D_2_55FB,Y                                  ;   53A9 D3A9 C B9 FB D5        F:006105
  STA BGDrawPPUAddress                            ;   53AC D3AC C 85 16           F:006105
  LDY R_05EF,X                                    ;   53AE D3AE C BC EF 05        F:006105
  INC R_05EF,X                                    ;   53B1 D3B1 C FE EF 05        F:006105
  LDA (JoypadBoth),Y                                  ;   53B4 D3B4 C B1 15           F:006105
  CMP #$F0                                        ;   53B6 D3B6 C C9 F0           F:006105
  BCC B_2_53D4                                    ;   53B8 D3B8 C 90 1A           F:006105
  SBC #$F0                                        ;   53BA D3BA C E9 F0           F:006105
  ASL                                             ;   53BC D3BC C 0A              F:006105
  TAY                                             ;   53BD D3BD C A8              F:006105
  LDA D_2_51FF,Y                                  ;   53BE D3BE C B9 FF D1        F:006105
  STA BGDrawPPUAddress+1                          ;   53C1 D3C1 C 85 17           F:006105
  LDA D_2_5200,Y                                  ;   53C3 D3C3 C B9 00 D2        F:006105
  STA R_0018                                      ;   53C6 D3C6 C 85 18           F:006105
  LDY R_05EF,X                                    ;   53C8 D3C8 C BC EF 05        F:006105
  JSR L_2_53D1                                    ;   53CB D3CB C 20 D1 D3        F:006105
  JMP L_2_539F                                    ;   53CE D3CE C 4C 9F D3        F:006105

L_2_53D1:
  JMP (BGDrawPPUAddress+1)                        ;   53D1 D3D1 C 6C 17 00        F:006105

B_2_53D4:
  STA R_05E9,X                                    ;   53D4 D3D4 C 9D E9 05        F:006105
  INC R_05BD                                      ;   53D7 D3D7 C EE BD 05        F:006105
  JMP L_2_53E1                                    ;   53DA D3DA C 4C E1 D3        F:006105

B_2_53DD:
  DEC R_05EB,X                                    ;   53DD D3DD C DE EB 05        F:008275
B_2_53E0:
  RTS                                             ;   53E0 D3E0 C 60              F:006105

L_2_53E1:
  LDA ActiveScene                                 ;   53E1 D3E1 C AD D3 04        F:006105
  CMP #$2                                         ;   53E4 D3E4 C C9 02           F:006105
  BEQ B_2_53F5                                    ;   53E6 D3E6 C F0 0D           F:006105
  ASL                                             ;   53E8 D3E8 C 0A              F:006105
  ADC ActiveScene                                 ;   53E9 D3E9 C 6D D3 04        F:006105
  LDY a:ActiveFamily                              ;   53EC D3EC C AC 0B 00        F:006105
  ADC Family1,Y                                   ;   53EF D3EF C 79 15 03        F:006105
  JMP L_2_53FC                                    ;   53F2 D3F2 C 4C FC D3        F:006105

B_2_53F5:
  ASL                                             ;   53F5 D3F5 C 0A              F:008274
  ADC ActiveScene                                 ;   53F6 D3F6 C 6D D3 04        F:008274
  ADC Family2                                     ;   53F9 D3F9 C 6D 16 03        F:008274
L_2_53FC:
  TAY                                             ;   53FC D3FC C A8              F:006105
  CLC                                             ;   53FD D3FD C 18              F:006105
  LDA D_2_521F,Y                                  ;   53FE D3FE C B9 1F D2        F:006105
  ADC R_05E9,X                                    ;   5401 D401 C 7D E9 05        F:006105
  PHA                                             ;   5404 D404 C 48              F:006105
  TXA                                             ;   5405 D405 C 8A              F:006105
  TAY                                             ;   5406 D406 C A8              F:006105
  PLA                                             ;   5407 D407 C 68              F:006105
  LDX R_05BE                                      ;   5408 D408 C AE BE 05        F:006105
  STA R_05AE,X                                    ;   540B D40B C 9D AE 05        F:006105
  LDA #$0                                         ;   540E D40E C A9 00           F:006105
  STA R_05B0,X                                    ;   5410 D410 C 9D B0 05        F:006105
  LDA R_05E7,Y                                    ;   5413 D413 C B9 E7 05        F:006105
  ASL                                             ;   5416 D416 C 0A              F:006105
  ROL R_05B0,X                                    ;   5417 D417 C 3E B0 05        F:006105
  ASL                                             ;   541A D41A C 0A              F:006105
  ROL R_05B0,X                                    ;   541B D41B C 3E B0 05        F:006105
  ASL                                             ;   541E D41E C 0A              F:006105
  ROL R_05B0,X                                    ;   541F D41F C 3E B0 05        F:006105
  ASL                                             ;   5422 D422 C 0A              F:006105
  ROL R_05B0,X                                    ;   5423 D423 C 3E B0 05        F:006105
  ASL                                             ;   5426 D426 C 0A              F:006105
  ROL R_05B0,X                                    ;   5427 D427 C 3E B0 05        F:006105
  CLC                                             ;   542A D42A C 18              F:006105
  ADC R_05E5,Y                                    ;   542B D42B C 79 E5 05        F:006105
  STA R_05AF,X                                    ;   542E D42E C 9D AF 05        F:006105
  LDA R_05B0,X                                    ;   5431 D431 C BD B0 05        F:006105
  ADC #$20                                        ;   5434 D434 C 69 20           F:006105
  STA R_05B0,X                                    ;   5436 D436 C 9D B0 05        F:006105
  TXA                                             ;   5439 D439 C 8A              F:006105
  CLC                                             ;   543A D43A C 18              F:006105
  ADC #$3                                         ;   543B D43B C 69 03           F:006105
  CMP #$F                                         ;   543D D43D C C9 0F           F:006105
  BNE B_2_5443                                    ;   543F D43F C D0 02           F:006105
  LDA #$0                                         ;   5441 D441 C A9 00           F:006105
B_2_5443:
  STA R_05BE                                      ;   5443 D443 C 8D BE 05        F:006105
  RTS                                             ;   5446 D446 C 60              F:006105

L_2_5447:
  LDA R_05CF,X                                    ;   5447 D447 C BD CF 05        F:006107
  BMI B_2_545E                                    ;   544A D44A C 30 12           F:006107
  CLC                                             ;   544C D44C C 18              F:006107
  ADC EntityXLo,X                                 ;   544D D44D C 7D C9 05        F:006107
  STA EntityXLo,X                                 ;   5450 D450 C 9D C9 05        F:006107
  LDA EntityXHi,X                                 ;   5453 D453 C BD C7 05        F:006107
  ADC #$0                                         ;   5456 D456 C 69 00           F:006107
  STA EntityXHi,X                                 ;   5458 D458 C 9D C7 05        F:006107
  JMP L_2_5473                                    ;   545B D45B C 4C 73 D4        F:006107

B_2_545E:
  AND #$7F                                        ;   545E D45E C 29 7F           F:006298
  STA R_001B                                      ;   5460 D460 C 85 1B           F:006298
  SEC                                             ;   5462 D462 C 38              F:006298
  LDA EntityXLo,X                                 ;   5463 D463 C BD C9 05        F:006298
  SBC R_001B                                      ;   5466 D466 C E5 1B           F:006298
  STA EntityXLo,X                                 ;   5468 D468 C 9D C9 05        F:006298
  LDA EntityXHi,X                                 ;   546B D46B C BD C7 05        F:006298
  SBC #$0                                         ;   546E D46E C E9 00           F:006298
  STA EntityXHi,X                                 ;   5470 D470 C 9D C7 05        F:006298
L_2_5473:
  LDA R_05D1,X                                    ;   5473 D473 C BD D1 05        F:006107
  BMI B_2_5488                                    ;   5476 D476 C 30 10           F:006107
  CLC                                             ;   5478 D478 C 18              F:006107
  ADC EntityYLo,X                                 ;   5479 D479 C 7D CD 05        F:006107
  STA EntityYLo,X                                 ;   547C D47C C 9D CD 05        F:006107
  LDA EntityYHi,X                                 ;   547F D47F C BD CB 05        F:006107
  ADC #$0                                         ;   5482 D482 C 69 00           F:006107
  STA EntityYHi,X                                 ;   5484 D484 C 9D CB 05        F:006107
  RTS                                             ;   5487 D487 C 60              F:006107

B_2_5488:
  AND #$7F                                        ;   5488 D488 . 29 7F           
  STA R_001B                                      ;   548A D48A . 85 1B           
  SEC                                             ;   548C D48C . 38              
  LDA EntityYLo,X                                 ;   548D D48D . BD CD 05        
  SBC R_001B                                      ;   5490 D490 . E5 1B           
  STA EntityYLo,X                                 ;   5492 D492 . 9D CD 05        
  LDA EntityYHi,X                                 ;   5495 D495 . BD CB 05        
  SBC #$0                                         ;   5498 D498 . E9 00           
  STA EntityYHi,X                                 ;   549A D49A . 9D CB 05        
  RTS                                             ;   549D D49D . 60              

L_2_549E:
  LDA #$FF                                        ;   549E D49E C A9 FF           F:008653
  STA R_05C5,X                                    ;   54A0 D4A0 C 9D C5 05        F:008653
  PLA                                             ;   54A3 D4A3 C 68              F:008653
  PLA                                             ;   54A4 D4A4 C 68              F:008653
  RTS                                             ;   54A5 D4A5 C 60              F:008653

L_2_54A6:
  LDA (JoypadBoth),Y                                  ;   54A6 D4A6 C B1 15           F:006107
  STA R_05D5,X                                    ;   54A8 D4A8 C 9D D5 05        F:006107
  STA R_05D7,X                                    ;   54AB D4AB C 9D D7 05        F:006107
  INC R_05D9,X                                    ;   54AE D4AE C FE D9 05        F:006107
  RTS                                             ;   54B1 D4B1 C 60              F:006107

L_2_54B2:
  LDA R_05D9,X                                    ;   54B2 D4B2 C BD D9 05        F:008134
  STA R_05DB,X                                    ;   54B5 D4B5 C 9D DB 05        F:008134
  RTS                                             ;   54B8 D4B8 C 60              F:008134

L_2_54B9:
  LDA R_05DB,X                                    ;   54B9 D4B9 C BD DB 05        F:008168
  STA R_05D9,X                                    ;   54BC D4BC C 9D D9 05        F:008168
  RTS                                             ;   54BF D4BF C 60              F:008168

L_2_54C0:
  LDA (JoypadBoth),Y                                  ;   54C0 D4C0 C B1 15           F:006107
  STA R_05CF,X                                    ;   54C2 D4C2 C 9D CF 05        F:006107
  INC R_05D9,X                                    ;   54C5 D4C5 C FE D9 05        F:006107
  RTS                                             ;   54C8 D4C8 C 60              F:006107

L_2_54C9:
  LDA (JoypadBoth),Y                                  ;   54C9 D4C9 C B1 15           F:008134
  STA R_05D1,X                                    ;   54CB D4CB C 9D D1 05        F:008134
  INC R_05D9,X                                    ;   54CE D4CE C FE D9 05        F:008134
  RTS                                             ;   54D1 D4D1 C 60              F:008134

L_2_54D2:
  LDA R_05E1,X                                    ;   54D2 D4D2 C BD E1 05        F:006298
  EOR #$40                                        ;   54D5 D4D5 C 49 40           F:006298
  STA R_05E1,X                                    ;   54D7 D4D7 C 9D E1 05        F:006298
  RTS                                             ;   54DA D4DA C 60              F:006298

.byte $BD,$E1,$05,$49,$80,$9D,$E1,$05             ;   54DB D4DB ........ ???I???? 
.byte $60,$BD,$E1,$05,$49,$20,$9D,$E1             ;   54E3 D4E3 ........ `???I ?? 
.byte $05,$60                                     ;   54EB D4EB ..       ?`       
L_2_54ED:
  LDA (JoypadBoth),Y                                  ;   54ED D4ED C B1 15           F:006107
  SEC                                             ;   54EF D4EF C 38              F:006107
  SBC #$1                                         ;   54F0 D4F0 C E9 01           F:006107
  STA R_05DD,X                                    ;   54F2 D4F2 C 9D DD 05        F:006107
  LDA R_05D9,X                                    ;   54F5 D4F5 C BD D9 05        F:006107
  CLC                                             ;   54F8 D4F8 C 18              F:006107
  ADC #$1                                         ;   54F9 D4F9 C 69 01           F:006107
  STA R_05DF,X                                    ;   54FB D4FB C 9D DF 05        F:006107
  INC R_05D9,X                                    ;   54FE D4FE C FE D9 05        F:006107
  RTS                                             ;   5501 D501 C 60              F:006107

L_2_5502:
  LDA R_05DD,X                                    ;   5502 D502 C BD DD 05        F:006143
  BEQ B_2_5510                                    ;   5505 D505 C F0 09           F:006143
  DEC R_05DD,X                                    ;   5507 D507 C DE DD 05        F:006143
  LDA R_05DF,X                                    ;   550A D50A C BD DF 05        F:006143
  STA R_05D9,X                                    ;   550D D50D C 9D D9 05        F:006143
B_2_5510:
  RTS                                             ;   5510 D510 C 60              F:006143

L_2_5511:
  DEC R_05D9,X                                    ;   5511 D511 C DE D9 05        F:007075
  PLA                                             ;   5514 D514 C 68              F:007075
  PLA                                             ;   5515 D515 C 68              F:007075
  RTS                                             ;   5516 D516 C 60              F:007075

L_2_5517:
  LDA (JoypadBoth),Y                                  ;   5517 D517 C B1 15           F:010108
  STA R_0013                                      ;   5519 D519 C 85 13           F:010108
  INY                                             ;   551B D51B C C8              F:010108
  LDA (JoypadBoth),Y                                  ;   551C D51C C B1 15           F:010108
  STA R_0014                                      ;   551E D51E C 85 14           F:010108
  LDY #$0                                         ;   5520 D520 C A0 00           F:010108
  LDA (R_0013),Y                                  ;   5522 D522 C B1 13           F:010108
  BEQ B_2_5531                                    ;   5524 D524 C F0 0B           F:010108
  LDA #$0                                         ;   5526 D526 C A9 00           F:010405
  STA (R_0013),Y                                  ;   5528 D528 C 91 13           F:010405
  INC R_05D9,X                                    ;   552A D52A C FE D9 05        F:010405
  INC R_05D9,X                                    ;   552D D52D C FE D9 05        F:010405
  RTS                                             ;   5530 D530 C 60              F:010405

B_2_5531:
  DEC R_05D9,X                                    ;   5531 D531 C DE D9 05        F:010108
  PLA                                             ;   5534 D534 C 68              F:010108
  PLA                                             ;   5535 D535 C 68              F:010108
  RTS                                             ;   5536 D536 C 60              F:010108

.byte $B1,$15,$85,$1B,$C8,$B1,$15,$85             ;   5537 D537 ........ ???????? 
.byte $13,$C8,$B1,$15,$85,$14,$A0,$00             ;   553F D53F ........ ???????? 
.byte $A5,$1B,$91,$13,$FE,$D9,$05,$FE             ;   5547 D547 ........ ???????? 
.byte $D9,$05,$FE,$D9,$05,$60                     ;   554F D54F ......   ?????`   
L_2_5555:
  LDA #$FF                                        ;   5555 D555 C A9 FF           F:006105
  STA R_05E3,X                                    ;   5557 D557 C 9D E3 05        F:006105
  PLA                                             ;   555A D55A C 68              F:006105
  PLA                                             ;   555B D55B C 68              F:006105
  RTS                                             ;   555C D55C C 60              F:006105

L_2_555D:
  LDA (JoypadBoth),Y                                  ;   555D D55D C B1 15           F:008274
  STA R_05EB,X                                    ;   555F D55F C 9D EB 05        F:008274
  STA R_05ED,X                                    ;   5562 D562 C 9D ED 05        F:008274
  INC R_05EF,X                                    ;   5565 D565 C FE EF 05        F:008274
  RTS                                             ;   5568 D568 C 60              F:008274

.byte $BD,$EF,$05,$9D,$F1,$05,$60,$BD             ;   5569 D569 ........ ??????`? 
.byte $F1,$05,$9D,$EF,$05                         ;   5571 D571 .....    ?????    
L_2_5576:
  RTS                                             ;   5576 D576 C 60              F:008274

L_2_5577:
  LDA (JoypadBoth),Y                                  ;   5577 D577 C B1 15           F:008274
  SEC                                             ;   5579 D579 C 38              F:008274
  SBC #$1                                         ;   557A D57A C E9 01           F:008274
  STA R_05F3,X                                    ;   557C D57C C 9D F3 05        F:008274
  LDA R_05EF,X                                    ;   557F D57F C BD EF 05        F:008274
  CLC                                             ;   5582 D582 C 18              F:008274
  ADC #$1                                         ;   5583 D583 C 69 01           F:008274
  STA R_05F5,X                                    ;   5585 D585 C 9D F5 05        F:008274
  STA R_05EF,X                                    ;   5588 D588 C 9D EF 05        F:008274
  RTS                                             ;   558B D58B C 60              F:008274

L_2_558C:
  LDA R_05F3,X                                    ;   558C D58C C BD F3 05        F:008300
  BEQ B_2_559A                                    ;   558F D58F C F0 09           F:008300
  DEC R_05F3,X                                    ;   5591 D591 C DE F3 05        F:008300
  LDA R_05F5,X                                    ;   5594 D594 C BD F5 05        F:008300
  STA R_05EF,X                                    ;   5597 D597 C 9D EF 05        F:008300
B_2_559A:
  RTS                                             ;   559A D59A C 60              F:008300

.byte $B1,$15,$85,$13,$C8,$B1,$15,$85             ;   559B D59B ........ ???????? 
.byte $14,$A0,$00,$B1,$13,$F0,$07,$FE             ;   55A3 D5A3 ........ ???????? 
.byte $EF,$05,$FE,$EF,$05,$60,$DE,$EF             ;   55AB D5AB ........ ?????`?? 
.byte $05,$60,$B1,$15,$85,$1B,$C8,$B1             ;   55B3 D5B3 ........ ?`?????? 
.byte $15,$85,$13,$C8,$B1,$15,$85,$14             ;   55BB D5BB ........ ???????? 
.byte $A0,$00,$A5,$1B,$91,$13,$FE,$EF             ;   55C3 D5C3 ........ ???????? 
.byte $05,$FE,$EF,$05,$FE,$EF,$05,$60             ;   55CB D5CB ........ ???????` 
L_2_55D3:
  LDA R_05F7,X                                    ;   55D3 D5D3 C BD F7 05        F:006105
  AND #$80                                        ;   55D6 D5D6 C 29 80           F:006105
  BNE B_2_55EA                                    ;   55D8 D5D8 C D0 10           F:006105
  CLC                                             ;   55DA D5DA C 18              F:006105
  LDA R_05E5,X                                    ;   55DB D5DB C BD E5 05        F:006105
  ADC (JoypadBoth),Y                                  ;   55DE D5DE C 71 15           F:006105
  AND #$1F                                        ;   55E0 D5E0 C 29 1F           F:006105
  STA R_05E5,X                                    ;   55E2 D5E2 C 9D E5 05        F:006105
  INY                                             ;   55E5 D5E5 C C8              F:006105
  INC R_05EF,X                                    ;   55E6 D5E6 C FE EF 05        F:006105
  RTS                                             ;   55E9 D5E9 C 60              F:006105

B_2_55EA:
  SEC                                             ;   55EA D5EA C 38              F:006105
  LDA R_05E5,X                                    ;   55EB D5EB C BD E5 05        F:006105
  SBC (JoypadBoth),Y                                  ;   55EE D5EE C F1 15           F:006105
  AND #$1F                                        ;   55F0 D5F0 C 29 1F           F:006105
  STA R_05E5,X                                    ;   55F2 D5F2 C 9D E5 05        F:006105
  INY                                             ;   55F5 D5F5 C C8              F:006105
  INC R_05EF,X                                    ;   55F6 D5F6 C FE EF 05        F:006105
  RTS                                             ;   55F9 D5F9 C 60              F:006105

D_2_55FA:
.addr D_2_5660                                    ;   55FA D5FA N 60 D6
D_2_55FB = * - 1
.addr D_2_56BA                                    ;   55FC D5FC N BA D6
.addr D_2_5714                                    ;   55FE D5FE N 14 D7
.addr D_2_5728                                    ;   5600 D600 N 28 D7
.addr D_2_573B                                    ;   5602 D602 N 3B D7
.addr D_2_573F                                    ;   5604 D604 N 3F D7
.byte $47,$D7,$48,$D7,$49,$D7                     ;   5606 D606 ......   G?H?I?   
.addr D_2_574A                                    ;   560C D60C N 4A D7
.addr D_2_5754                                    ;   560E D60E N 54 D7
.addr D_2_575E                                    ;   5610 D610 N 5E D7
.addr D_2_5768                                    ;   5612 D612 N 68 D7
.byte $72,$D7                                     ;   5614 D614 ..       r?       
.addr D_2_577C                                    ;   5616 D616 N 7C D7
.addr D_2_57A1                                    ;   5618 D618 N A1 D7
.addr D_2_57B3                                    ;   561A D61A N B3 D7
.addr D_2_57C6                                    ;   561C D61C N C6 D7
.addr D_2_57DB                                    ;   561E D61E N DB D7
.addr D_2_57EF                                    ;   5620 D620 N EF D7
.addr D_2_57FC                                    ;   5622 D622 N FC D7
.addr D_2_57FF                                    ;   5624 D624 N FF D7
.addr D_2_5804                                    ;   5626 D626 N 04 D8
.addr D_2_5807                                    ;   5628 D628 N 07 D8
.addr D_2_580C                                    ;   562A D62A N 0C D8
.addr D_2_580F                                    ;   562C D62C N 0F D8
.addr D_2_5814                                    ;   562E D62E N 14 D8
.addr D_2_5817                                    ;   5630 D630 N 17 D8
.byte $1C,$D8,$1F,$D8                             ;   5632 D632 ....     ????     
.addr D_2_5824                                    ;   5636 D636 N 24 D8
.addr D_2_582D                                    ;   5638 D638 N 2D D8
.byte $35,$D8                                     ;   563A D63A ..       5?       
.addr D_2_5837                                    ;   563C D63C N 37 D8
.addr D_2_5840                                    ;   563E D63E N 40 D8
.addr D_2_5845                                    ;   5640 D640 N 45 D8
.byte $4A,$D8                                     ;   5642 D642 ..       J?       
.addr D_2_585A                                    ;   5644 D644 N 5A D8
.byte $6A,$D8                                     ;   5646 D646 ..       j?       
.addr D_2_587A                                    ;   5648 D648 N 7A D8
.byte $8A,$D8                                     ;   564A D64A ..       ??       
.addr D_2_589A                                    ;   564C D64C N 9A D8
.addr D_2_58AA                                    ;   564E D64E N AA D8
.addr D_2_58BA                                    ;   5650 D650 N BA D8
.addr D_2_58CA                                    ;   5652 D652 N CA D8
.addr D_2_5903                                    ;   5654 D654 N 03 D9
.byte $24,$D9,$26,$D9                             ;   5656 D656 ....     $?&?     
.addr D_2_5928                                    ;   565A D65A N 28 D9
.byte $2A,$D9                                     ;   565C D65C ..       *?       
.addr D_2_592C                                    ;   565E D65E N 2C D9
D_2_5660:
.byte $F1,$08,$F4,$89,$F6,$0F                     ;   5660 D660 DDDDDD   ??????   F:006298
.byte $10                                         ;   5666 D666 D        ?        F:006303
.byte $11                                         ;   5667 D667 D        ?        F:006312
.byte $12                                         ;   5668 D668 D        ?        F:006321
.byte $0F                                         ;   5669 D669 D        ?        F:006330
.byte $10                                         ;   566A D66A D        ?        F:006339
.byte $11                                         ;   566B D66B D        ?        F:006348
.byte $12                                         ;   566C D66C D        ?        F:006357
.byte $F4,$00,$13                                 ;   566D D66D DDD      ???      F:006366
.byte $F1,$3C,$15                                 ;   5670 D670 DDD      ?<?      F:006375
.byte $F1,$08,$F4,$84,$F9,$02,$0F                 ;   5673 D673 DDDDDDD  ???????  F:006436
.byte $10                                         ;   567A D67A D        ?        F:006445
.byte $11                                         ;   567B D67B D        ?        F:006454
.byte $12                                         ;   567C D67C D        ?        F:006463
.byte $0F                                         ;   567D D67D D        ?        F:006472
.byte $10                                         ;   567E D67E D        ?        F:006481
.byte $11                                         ;   567F D67F D        ?        F:006490
.byte $12                                         ;   5680 D680 D        ?        F:006499
.byte $F4,$00,$F1,$3C,$16                         ;   5681 D681 DDDDD    ???<?    F:006508
.byte $F1,$08,$F4,$87,$FA                         ;   5686 D686 DDDDD    ?????    F:006569
.byte $F9,$02,$0F,$10,$11,$12,$FA,$F4             ;   568B D68B ........ ???????? 
.byte $00,$F1,$3C,$16,$14,$13,$F1,$08             ;   5693 D693 ........ ??<????? 
.byte $F4,$88,$F9,$03,$0F,$10,$11,$12             ;   569B D69B ........ ???????? 
.byte $FA,$F4,$00,$13,$F1,$3C,$15,$F1             ;   56A3 D6A3 ........ ?????<?? 
.byte $08,$F4,$86,$F9,$02,$0F,$10,$11             ;   56AB D6AB ........ ???????? 
.byte $12,$FA,$F4,$00,$0E,$0D,$FB                 ;   56B3 D6B3 .......  ???????  
D_2_56BA:
.byte $F1,$08,$F4,$09,$0F                         ;   56BA D6BA DDDDD    ?????    F:007147
.byte $10                                         ;   56BF D6BF D        ?        F:007152
.byte $11                                         ;   56C0 D6C0 D        ?        F:007161
.byte $12                                         ;   56C1 D6C1 D        ?        F:007170
.byte $0F                                         ;   56C2 D6C2 D        ?        F:007179
.byte $10                                         ;   56C3 D6C3 D        ?        F:007188
.byte $11                                         ;   56C4 D6C4 D        ?        F:007197
.byte $12                                         ;   56C5 D6C5 D        ?        F:007206
.byte $F4,$00,$13                                 ;   56C6 D6C6 DDD      ???      F:007215
.byte $F1,$3C,$15                                 ;   56C9 D6C9 DDD      ?<?      F:007224
.byte $F1,$08,$F4,$04,$F9,$02,$0F                 ;   56CC D6CC DDDDDDD  ???????  F:007285
.byte $10                                         ;   56D3 D6D3 D        ?        F:007294
.byte $11                                         ;   56D4 D6D4 D        ?        F:007303
.byte $12                                         ;   56D5 D6D5 D        ?        F:007312
.byte $0F                                         ;   56D6 D6D6 D        ?        F:007321
.byte $10                                         ;   56D7 D6D7 D        ?        F:007330
.byte $11                                         ;   56D8 D6D8 D        ?        F:007339
.byte $12                                         ;   56D9 D6D9 D        ?        F:007348
.byte $F4,$00,$F1,$3C,$16                         ;   56DA D6DA DDDDD    ???<?    F:007357
.byte $F1,$08,$F4,$07,$FA                         ;   56DF D6DF DDDDD    ?????    F:007418
.byte $F9,$02,$0F                                 ;   56E4 D6E4 DDD      ???      F:007551
.byte $10                                         ;   56E7 D6E7 D        ?        F:007560
.byte $11                                         ;   56E8 D6E8 D        ?        F:007569
.byte $12                                         ;   56E9 D6E9 D        ?        F:007578
.byte $FA                                         ;   56EA D6EA D        ?        F:007587
.byte $F4,$00,$F1,$3C,$16                         ;   56EB D6EB DDDDD    ???<?    F:007623
.byte $14                                         ;   56F0 D6F0 D        ?        F:007684
.byte $13                                         ;   56F1 D6F1 D        ?        F:007745
.byte $F1,$08,$F4,$08,$F9,$03,$0F                 ;   56F2 D6F2 DDDDDDD  ???????  F:007806
.byte $10                                         ;   56F9 D6F9 D        ?        F:007815
.byte $11                                         ;   56FA D6FA D        ?        F:007824
.byte $12                                         ;   56FB D6FB D        ?        F:007833
.byte $FA                                         ;   56FC D6FC D        ?        F:007842
.byte $F4,$00,$13                                 ;   56FD D6FD DDD      ???      F:007914
.byte $F1,$3C,$15                                 ;   5700 D700 DDD      ?<?      F:007923
.byte $F1,$08,$F4,$08,$0F                         ;   5703 D703 DDDDD    ?????    F:007984
.byte $10                                         ;   5708 D708 D        ?        F:007993
.byte $11                                         ;   5709 D709 D        ?        F:008002
.byte $12                                         ;   570A D70A D        ?        F:008011
.byte $0F                                         ;   570B D70B D        ?        F:008020
.byte $10                                         ;   570C D70C D        ?        F:008029
.byte $11                                         ;   570D D70D D        ?        F:008038
.byte $12                                         ;   570E D70E D        ?        F:008047
.byte $F4,$00,$0E                                 ;   570F D70F DDD      ???      F:008056
.byte $0D                                         ;   5712 D712 D        ?        F:008065
.byte $FB                                         ;   5713 D713 D        ?        F:008074
D_2_5714:
.byte $F1,$08,$F6,$F2,$F4,$88,$F9,$02             ;   5714 D714 DDDDDDDD ???????? F:013955
.byte $0F                                         ;   571C D71C D        ?        F:013955
.byte $10                                         ;   571D D71D D        ?        F:013961
.byte $11                                         ;   571E D71E D        ?        F:013970
.byte $12                                         ;   571F D71F D        ?        F:013979
.byte $FA                                         ;   5720 D720 D        ?        F:013988
.byte $F4,$00,$15                                 ;   5721 D721 DDD      ???      F:014024
.byte $FC,$BB,$04                                 ;   5724 D724 DDD      ???      F:014033
.byte $F3                                         ;   5727 D727 D        ?        F:014326
D_2_5728:
.byte $F1,$08,$F2,$F4,$08,$F9,$02,$0F             ;   5728 D728 DDDDDDDD ???????? F:010031
.byte $10                                         ;   5730 D730 D        ?        F:010036
.byte $11                                         ;   5731 D731 D        ?        F:010045
.byte $12                                         ;   5732 D732 D        ?        F:010054
.byte $FA                                         ;   5733 D733 D        ?        F:010063
.byte $F4,$00,$15                                 ;   5734 D734 DDD      ???      F:010099
.byte $FC,$BB,$04                                 ;   5737 D737 DDD      ???      F:010108
.byte $F3                                         ;   573A D73A D        ?        F:010405
D_2_573B:
.byte $F4,$00,$0D,$FB                             ;   573B D73B DDDD     ????     F:012358
D_2_573F:
.byte $F4,$00,$F1,$14,$F2,$33                     ;   573F D73F DDDDDD   ?????3   F:041622
.byte $32                                         ;   5745 D745 D        2        F:066089
.byte $F3                                         ;   5746 D746 D        ?        F:066110
.byte $F0,$F0,$F0                                 ;   5747 D747 ...      ???      
D_2_574A:
.byte $F1,$10,$F4,$00,$F5,$00,$F2,$01             ;   574A D74A DDDDDDDD ???????? F:008134
.byte $00                                         ;   5752 D752 D        ?        F:008151
.byte $F3                                         ;   5753 D753 D        ?        F:008168
D_2_5754:
.byte $F1,$10,$F4,$00,$F5,$00,$F2,$02             ;   5754 D754 DDDDDDDD ???????? F:012695
.byte $00                                         ;   575C D75C D        ?        F:012712
.byte $F3                                         ;   575D D75D D        ?        F:012729
D_2_575E:
.byte $F1,$10,$F4,$00,$F5,$00,$F2,$03             ;   575E D75E DDDDDDDD ???????? F:016558
.byte $00                                         ;   5766 D766 D        ?        F:016575
.byte $F3                                         ;   5767 D767 D        ?        F:016592
D_2_5768:
.byte $F1,$10,$F4,$00,$F5,$00,$F2,$05             ;   5768 D768 DDDDDDDD ???????? F:034900
.byte $00                                         ;   5770 D770 D        ?        F:034917
.byte $F3                                         ;   5771 D771 D        ?        F:034934
.byte $F1,$10,$F4,$00,$F5,$00,$F2,$04             ;   5772 D772 ........ ???????? 
.byte $00,$F3                                     ;   577A D77A ..       ??       
D_2_577C:
.byte $F1,$08,$F4,$07,$F9,$06,$09                 ;   577C D77C DDDDDDD  ???????  F:006107
.byte $0A                                         ;   5783 D783 D        ?        F:006116
.byte $0B                                         ;   5784 D784 D        ?        F:006125
.byte $0C                                         ;   5785 D785 D        ?        F:006134
.byte $FA                                         ;   5786 D786 D        ?        F:006143
.byte $F4,$00,$F9,$04,$06,$07,$08,$07             ;   5787 D787 ........ ???????? 
.byte $FA,$F6,$F4,$87,$F9,$02,$09,$0A             ;   578F D78F ........ ???????? 
.byte $0B,$0C,$FA,$F4,$00,$F9,$0F,$06             ;   5797 D797 ........ ???????? 
.byte $FA,$FB                                     ;   579F D79F ..       ??       
D_2_57A1:
.byte $F1,$08,$F4,$07,$F9,$08,$09                 ;   57A1 D7A1 DDDDDDD  ???????  F:006652
.byte $0A                                         ;   57A8 D7A8 D        ?        F:006661
.byte $0B                                         ;   57A9 D7A9 D        ?        F:006670
.byte $0C                                         ;   57AA D7AA D        ?        F:006679
.byte $FA                                         ;   57AB D7AB D        ?        F:006688
.byte $F4,$00,$F9,$0F,$06                         ;   57AC D7AC DDDDD    ?????    F:006940
.byte $FA                                         ;   57B1 D7B1 D        ?        F:006949
.byte $FB                                         ;   57B2 D7B2 D        ?        F:007075
D_2_57B3:
.byte $F1,$09,$F4,$86,$F6,$F9,$07,$09             ;   57B3 D7B3 DDDDDDDD ???????? F:008134
.byte $0A                                         ;   57BB D7BB D        ?        F:008144
.byte $0B                                         ;   57BC D7BC D        ?        F:008154
.byte $0C                                         ;   57BD D7BD D        ?        F:008164
.byte $FA                                         ;   57BE D7BE D        ?        F:008174
.byte $F4,$00,$F9,$0F,$06                         ;   57BF D7BF DDDDD    ?????    F:016838
.byte $FA                                         ;   57C4 D7C4 D        ?        F:016848
.byte $FB                                         ;   57C5 D7C5 D        ?        F:016988
D_2_57C6:
.byte $F1,$3C,$F4,$00,$F6,$06                     ;   57C6 D7C6 DDDDDD   ?<????   F:041483
.byte $F1,$08,$F4,$86,$F9,$04,$09                 ;   57CC D7CC DDDDDDD  ???????  F:041544
.byte $0A                                         ;   57D3 D7D3 D        ?        F:041553
.byte $0B                                         ;   57D4 D7D4 D        ?        F:041562
.byte $0C                                         ;   57D5 D7D5 D        ?        F:041571
.byte $FA                                         ;   57D6 D7D6 D        ?        F:041580
.byte $F4,$00,$06,$FB                             ;   57D7 D7D7 ....     ????     
D_2_57DB:
.byte $F1,$3C,$F4,$00,$06                         ;   57DB D7DB DDDDD    ?<???    F:033566
.byte $F1,$08,$F4,$06,$F9,$04,$09                 ;   57E0 D7E0 DDDDDDD  ???????  F:033627
.byte $0A                                         ;   57E7 D7E7 D        ?        F:033636
.byte $0B                                         ;   57E8 D7E8 D        ?        F:033645
.byte $0C                                         ;   57E9 D7E9 D        ?        F:033654
.byte $FA                                         ;   57EA D7EA D        ?        F:033663
.byte $F4,$00,$06,$FB                             ;   57EB D7EB ....     ????     
D_2_57EF:
.byte $F1,$08,$F4,$00,$F9,$04,$06                 ;   57EF D7EF DDDDDDD  ???????  F:043922
.byte $07                                         ;   57F6 D7F6 D        ?        F:043931
.byte $08                                         ;   57F7 D7F7 D        ?        F:043940
.byte $07                                         ;   57F8 D7F8 D        ?        F:043949
.byte $FA                                         ;   57F9 D7F9 D        ?        F:043958
.byte $06                                         ;   57FA D7FA D        ?        F:070393
.byte $FB                                         ;   57FB D7FB D        ?        F:070402
D_2_57FC:
.byte $F6,$00                                     ;   57FC D7FC DD       ??       F:008274
.byte $FB                                         ;   57FE D7FE D        ?        F:008275
D_2_57FF:
.byte $F1,$3C,$07                                 ;   57FF D7FF DDD      ?<?      F:008603
.byte $00                                         ;   5802 D802 D        ?        F:008664
.byte $FB                                         ;   5803 D803 D        ?        F:008725
D_2_5804:
.byte $F6,$01                                     ;   5804 D804 DD       ??       F:012835
.byte $FB                                         ;   5806 D806 D        ?        F:012836
D_2_5807:
.byte $F1,$3C,$08                                 ;   5807 D807 DDD      ?<?      F:013159
.byte $01                                         ;   580A D80A D        ?        F:013220
.byte $FB                                         ;   580B D80B D        ?        F:013281
D_2_580C:
.byte $F6,$03                                     ;   580C D80C DD       ??       F:017057
.byte $FB                                         ;   580E D80E D        ?        F:017058
D_2_580F:
.byte $F1,$3C,$0A                                 ;   580F D80F DDD      ?<?      F:017444
.byte $03                                         ;   5812 D812 D        ?        F:017505
.byte $FB                                         ;   5813 D813 D        ?        F:017566
D_2_5814:
.byte $F6,$02                                     ;   5814 D814 DD       ??       F:035080
.byte $FB                                         ;   5816 D816 D        ?        F:035081
D_2_5817:
.byte $F1,$3C,$09                                 ;   5817 D817 DDD      ?<?      F:035404
.byte $02                                         ;   581A D81A D        ?        F:035465
.byte $FB                                         ;   581B D81B D        ?        F:035526
.byte $F6,$04,$FB,$F1,$3C,$0B,$04,$FB             ;   581C D81C ........ ????<??? 
D_2_5824:
.byte $F1,$04,$F6,$F9,$05,$0F                     ;   5824 D824 DDDDDD   ??????   F:008603
.byte $0E                                         ;   582A D82A D        ?        F:008608
.byte $FA                                         ;   582B D82B D        ?        F:008613
.byte $F0                                         ;   582C D82C D        ?        F:008653
D_2_582D:
.byte $F1,$04,$F9,$05,$0F                         ;   582D D82D DDDDD    ?????    F:024034
.byte $0E                                         ;   5832 D832 D        ?        F:024039
.byte $FA                                         ;   5833 D833 D        ?        F:024044
.byte $F0                                         ;   5834 D834 D        ?        F:024084
.byte $05,$FB                                     ;   5835 D835 ..       ??       
D_2_5837:
.byte $F1,$0C,$F9,$05,$05                         ;   5837 D837 DDDDD    ?????    F:008274
.byte $0D                                         ;   583C D83C D        ?        F:008287
.byte $FA                                         ;   583D D83D D        ?        F:008300
.byte $05                                         ;   583E D83E D        ?        F:008404
.byte $FB                                         ;   583F D83F D        ?        F:008417
D_2_5840:
.byte $F1,$B4,$0C                                 ;   5840 D840 DDD      ???      F:008603
.byte $05                                         ;   5843 D843 D        ?        F:008784
.byte $FB                                         ;   5844 D844 D        ?        F:017806
D_2_5845:
.byte $F1,$B4,$06                                 ;   5845 D845 DDD      ???      F:009398
.byte $05                                         ;   5848 D848 D        ?        F:009579
.byte $FB                                         ;   5849 D849 D        ?        F:024396
.byte $0A,$FF,$02,$0B,$FF,$02,$0C,$FF             ;   584A D84A ........ ???????? 
.byte $02,$0D,$FF,$02,$0E,$FF,$02,$FB             ;   5852 D852 ........ ???????? 
D_2_585A:
.byte $14,$FF,$02,$15,$FF,$02,$16,$FF             ;   585A D85A DDDDDDDD ???????? F:006105
.byte $02,$17,$FF,$02,$18,$FF,$02,$FB             ;   5862 D862 DDDDDDDD ???????? F:006105
.byte $13,$FF,$02,$12,$FF,$02,$11,$FF             ;   586A D86A ........ ???????? 
.byte $02,$10,$FF,$02,$0F,$FF,$02,$FB             ;   5872 D872 ........ ???????? 
D_2_587A:
.byte $1D,$FF,$02,$1C,$FF,$02,$1B,$FF             ;   587A D87A DDDDDDDD ???????? F:006105
.byte $02,$1A,$FF,$02,$19,$FF,$02,$FB             ;   5882 D882 DDDDDDDD ???????? F:006105
.byte $00,$FF,$02,$01,$FF,$02,$02,$FF             ;   588A D88A ........ ???????? 
.byte $02,$03,$FF,$02,$04,$FF,$02,$FB             ;   5892 D892 ........ ???????? 
D_2_589A:
.byte $05,$FF,$02,$06,$FF,$02,$07,$FF             ;   589A D89A DDDDDDDD ???????? F:022726
.byte $02,$08,$FF,$02,$09,$FF,$02,$FB             ;   58A2 D8A2 DDDDDDDD ???????? F:022726
D_2_58AA:
.byte $00,$FF,$04,$05,$FF,$04,$0F,$FF             ;   58AA D8AA DDDDDDDD ???????? F:010031
.byte $04,$0A,$FF,$04,$14,$FF,$04,$FB             ;   58B2 D8B2 DDDDDDDD ???????? F:010031
D_2_58BA:
.byte $03,$FF,$04,$08,$FF,$04,$12,$FF             ;   58BA D8BA DDDDDDDD ???????? F:006298
.byte $04,$0D,$FF,$04,$17,$FF,$04,$FB             ;   58C2 D8C2 DDDDDDDD ???????? F:006298
D_2_58CA:
.byte $F9,$05,$F1,$00,$01                         ;   58CA D8CA DDDDD    ?????    F:010401
.byte $FF,$04,$06                                 ;   58CF D8CF DDD      ???      F:010402
.byte $FF,$04,$10                                 ;   58D2 D8D2 DDD      ???      F:010403
.byte $FF,$04,$0B                                 ;   58D5 D8D5 DDD      ???      F:010404
.byte $FF,$04,$F1,$0A,$15                         ;   58D8 D8D8 DDDDD    ?????    F:010405
.byte $FF,$10,$02                                 ;   58DD D8DD DDD      ???      F:010416
.byte $FF,$04,$F1,$00,$07                         ;   58E0 D8E0 DDDDD    ?????    F:010427
.byte $FF,$04,$11                                 ;   58E5 D8E5 DDD      ???      F:010428
.byte $FF,$04,$0C                                 ;   58E8 D8E8 DDD      ???      F:010429
.byte $FF,$04,$F1,$0A,$16                         ;   58EB D8EB DDDDD    ?????    F:010430
.byte $FF,$10,$FA                                 ;   58F0 D8F0 DDD      ???      F:010441
.byte $F1,$00,$00                                 ;   58F3 D8F3 DDD      ???      F:010601
.byte $FF,$04,$05                                 ;   58F6 D8F6 DDD      ???      F:010602
.byte $FF,$04,$0F                                 ;   58F9 D8F9 DDD      ???      F:010603
.byte $FF,$04,$0A                                 ;   58FC D8FC DDD      ???      F:010604
.byte $FF,$04,$14                                 ;   58FF D8FF DDD      ???      F:010605
.byte $FB                                         ;   5902 D902 D        ?        F:010606
D_2_5903:
.byte $04                                         ;   5903 D903 D        ?        F:011988
.byte $FF,$04,$09                                 ;   5904 D904 DDD      ???      F:011989
.byte $FF,$04,$13                                 ;   5907 D907 DDD      ???      F:011990
.byte $FF,$04,$0E                                 ;   590A D90A DDD      ???      F:011991
.byte $FF,$04,$F1,$78,$18                         ;   590D D90D DDDDD    ???x?    F:011992
.byte $FF,$10,$F1,$00,$00                         ;   5912 D912 DDDDD    ?????    F:012113
.byte $FF,$04,$05                                 ;   5917 D917 DDD      ???      F:012114
.byte $FF,$04,$0F                                 ;   591A D91A DDD      ???      F:012115
.byte $FF,$04,$0A                                 ;   591D D91D DDD      ???      F:012116
.byte $FF,$04,$14                                 ;   5920 D920 DDD      ???      F:012117
.byte $FB                                         ;   5923 D923 D        ?        F:012118
.byte $00,$FB,$05,$FB                             ;   5924 D924 ....     ????     
D_2_5928:
.byte $0F                                         ;   5928 D928 D        ?        F:066355
.byte $FB                                         ;   5929 D929 D        ?        F:066356
.byte $0A,$FB                                     ;   592A D92A ..       ??       
D_2_592C:
.byte $14                                         ;   592C D92C D        ?        F:041825
.byte $FB                                         ;   592D D92D D        ?        F:041826
D_2_592E:
.byte $99                                         ;   592E D92E D        ?        F:006300
.byte $99                                         ;   592F D92F D        ?        F:006107
.byte $4B                                         ;   5930 D930 D        K        F:008274
.byte $00                                         ;   5931 D931 D        ?        F:041825
D_2_5932:
.byte $00                                         ;   5932 D932 D        ?        F:022869
.byte $00                                         ;   5933 D933 D        ?        F:006300
.byte $00                                         ;   5934 D934 .        ?        
.byte $00                                         ;   5935 D935 D        ?        F:022728
.byte $00                                         ;   5936 D936 D        ?        F:006107
.byte $00                                         ;   5937 D937 .        ?        
.byte $00                                         ;   5938 D938 D        ?        F:023711
.byte $10                                         ;   5939 D939 D        ?        F:008274
.byte $20                                         ;   593A D93A .                 
.byte $00                                         ;   593B D93B D        ?        F:041825
.byte $19,$32                                     ;   593C D93C ..       ?2       

L_2_593E:
  lda #$04                                  ; make sure we don't overwrite SPR0
  sta NextSpriteOffset
  ldx #$01
  stx $05AA
LD948:
  lda $05C5,x
  cmp #$FF
  beq LD952
  jsr L_2_596D
LD952:
  dec $05AA
  ldx $05AA
  bpl LD948
  lda #$FF                                  ; move all unused sprites off screen
  ldx NextSpriteOffset
  beq @Exit
@MoveUnusedSpritesOffScreen:
  sta SprYPos,x
  inx
  inx
  inx
  inx
  cpx #$F4
  bcc @MoveUnusedSpritesOffScreen
@Exit:
  rts          

L_2_596D:
  LDA EntityYHi,X                                 ;   596D D96D C BD CB 05        F:006107
  ASL                                             ;   5970 D970 C 0A              F:006107
  ASL                                             ;   5971 D971 C 0A              F:006107
  ASL                                             ;   5972 D972 C 0A              F:006107
  ASL                                             ;   5973 D973 C 0A              F:006107
  STA EntityY                                     ;   5974 D974 C 8D AC 05        F:006107
  LDA EntityYLo,X                                 ;   5977 D977 C BD CD 05        F:006107
  LSR                                             ;   597A D97A C 4A              F:006107
  LSR                                             ;   597B D97B C 4A              F:006107
  LSR                                             ;   597C D97C C 4A              F:006107
  LSR                                             ;   597D D97D C 4A              F:006107
  ORA EntityY                                     ;   597E D97E C 0D AC 05        F:006107
  STA EntityY                                     ;   5981 D981 C 8D AC 05        F:006107
  LDA EntityXHi,X                                 ;   5984 D984 C BD C7 05        F:006107
  ASL                                             ;   5987 D987 C 0A              F:006107
  ASL                                             ;   5988 D988 C 0A              F:006107
  ASL                                             ;   5989 D989 C 0A              F:006107
  ASL                                             ;   598A D98A C 0A              F:006107
  STA EntityX                                     ;   598B D98B C 8D A9 05        F:006107
  LDA EntityXLo,X                                 ;   598E D98E C BD C9 05        F:006107
  LSR                                             ;   5991 D991 C 4A              F:006107
  LSR                                             ;   5992 D992 C 4A              F:006107
  LSR                                             ;   5993 D993 C 4A              F:006107
  LSR                                             ;   5994 D994 C 4A              F:006107
  ORA EntityX                                     ;   5995 D995 C 0D A9 05        F:006107
  STA EntityX                                     ;   5998 D998 C 8D A9 05        F:006107
  LDY ActiveScene                                 ;   599B D99B C AC D3 04        F:006107
  CLC                                             ;   599E D99E C 18              F:006107
  LDA R_05D3,X                                    ;   599F D99F C BD D3 05        F:006107
  ADC D_2_592E,Y                                  ;   59A2 D9A2 C 79 2E D9        F:006107
  PHA                                             ;   59A5 D9A5 C 48              F:006107
  LDA ActiveScene                                 ;   59A6 D9A6 C AD D3 04        F:006107
  ASL                                             ;   59A9 D9A9 C 0A              F:006107
  ADC ActiveScene                                 ;   59AA D9AA C 6D D3 04        F:006107
  ADC Family1                                     ;   59AD D9AD C 6D 15 03        F:006107
  TAY                                             ;   59B0 D9B0 C A8              F:006107
  CLC                                             ;   59B1 D9B1 C 18              F:006107
  PLA                                             ;   59B2 D9B2 C 68              F:006107
  ADC D_2_5932,Y                                  ;   59B3 D9B3 C 79 32 D9        F:006107
  TAY                                             ;   59B6 D9B6 C A8              F:006107
  LDA GfxDataPtrsLo,Y                                  ;   59B7 D9B7 C B9 12 DB        F:006107
  STA R_0019                                      ;   59BA D9BA C 85 19           F:006107
  LDA GfxDataPtrsHi,Y                                  ;   59BC D9BC C B9 DF DB        F:006107
  STA R_001A                                      ;   59BF D9BF C 85 1A           F:006107
  LDA D_3_7218,Y                                  ;   59C1 D9C1 C B9 18 F2        F:006107
  STA R_001B                                      ;   59C4 D9C4 C 85 1B           F:006107
  LDA D_3_72E5,Y                                  ;   59C6 D9C6 C B9 E5 F2        F:006107
  STA R_001C                                      ;   59C9 D9C9 C 85 1C           F:006107
  LDY #$0                                         ;   59CB D9CB C A0 00           F:006107
  LDA (R_0019),Y                                  ;   59CD D9CD C B1 19           F:006107
  STA R_0013                                      ;   59CF D9CF C 85 13           F:006107
  INY                                             ;   59D1 D9D1 C C8              F:006107
  LDA (R_0019),Y                                  ;   59D2 D9D2 C B1 19           F:006107
  STA R_0014                                      ;   59D4 D9D4 C 85 14           F:006107
  LDA R_05E1,X                                    ;   59D6 D9D6 C BD E1 05        F:006107
  STA R_05AB                                      ;   59D9 D9D9 C 8D AB 05        F:006107
  LDX NextSpriteOffset                            ;   59DC D9DC C AE A8 05        F:006107
  AND #$C0                                        ;   59DF D9DF C 29 C0           F:006107
  BNE B_2_5A31                                    ;   59E1 D9E1 C D0 4E           F:006107
B_2_59E3:
  LDA EntityX                                     ;   59E3 D9E3 C AD A9 05        F:006107
  STA R_05AD                                      ;   59E6 D9E6 C 8D AD 05        F:006107
  LDA R_0013                                      ;   59E9 D9E9 C A5 13           F:006107
  STA R_001D                                      ;   59EB D9EB C 85 1D           F:006107
B_2_59ED:
  INY                                             ;   59ED D9ED C C8              F:006107
  BNE B_2_59F4                                    ;   59EE D9EE C D0 04           F:006107
  INC R_001A                                      ;   59F0 D9F0 . E6 1A           
  INC R_001C                                      ;   59F2 D9F2 . E6 1C           
B_2_59F4:
  LDA (R_0019),Y                                  ;   59F4 D9F4 C B1 19           F:006107
  BEQ B_2_5A13                                    ;   59F6 D9F6 C F0 1B           F:006107
  STA SprTile,X                                   ;   59F8 D9F8 C 9D 01 02        F:006107
  LDA EntityY                                     ;   59FB D9FB C AD AC 05        F:006107
  STA SprYPos,X                                   ;   59FE D9FE C 9D 00 02        F:006107
  LDA R_05AD                                      ;   5A01 DA01 C AD AD 05        F:006107
  STA SprXPos,X                                   ;   5A04 DA04 C 9D 03 02        F:006107
  LDA R_05AB                                      ;   5A07 DA07 C AD AB 05        F:006107
  ORA (R_001B),Y                                  ;   5A0A DA0A C 11 1B           F:006107
  STA SprFlag,X                                   ;   5A0C DA0C C 9D 02 02        F:006107
  INX                                             ;   5A0F DA0F C E8              F:006107
  INX                                             ;   5A10 DA10 C E8              F:006107
  INX                                             ;   5A11 DA11 C E8              F:006107
  INX                                             ;   5A12 DA12 C E8              F:006107
B_2_5A13:
  CLC                                             ;   5A13 DA13 C 18              F:006107
  LDA R_05AD                                      ;   5A14 DA14 C AD AD 05        F:006107
  ADC #$8                                         ;   5A17 DA17 C 69 08           F:006107
  STA R_05AD                                      ;   5A19 DA19 C 8D AD 05        F:006107
  DEC R_001D                                      ;   5A1C DA1C C C6 1D           F:006107
  BNE B_2_59ED                                    ;   5A1E DA1E C D0 CD           F:006107
  CLC                                             ;   5A20 DA20 C 18              F:006107
  LDA EntityY                                     ;   5A21 DA21 C AD AC 05        F:006107
  ADC #$8                                         ;   5A24 DA24 C 69 08           F:006107
  STA EntityY                                     ;   5A26 DA26 C 8D AC 05        F:006107
  DEC R_0014                                      ;   5A29 DA29 C C6 14           F:006107
  BNE B_2_59E3                                    ;   5A2B DA2B C D0 B6           F:006107
  STX NextSpriteOffset                            ;   5A2D DA2D C 8E A8 05        F:006107
  RTS                                             ;   5A30 DA30 C 60              F:006107

B_2_5A31:
  LDA R_0013                                      ;   5A31 DA31 C A5 13           F:006300
  STA R_001D                                      ;   5A33 DA33 C 85 1D           F:006300
  ASL                                             ;   5A35 DA35 C 0A              F:006300
  ASL                                             ;   5A36 DA36 C 0A              F:006300
  ASL                                             ;   5A37 DA37 C 0A              F:006300
  SBC #$7                                         ;   5A38 DA38 C E9 07           F:006300
  CLC                                             ;   5A3A DA3A C 18              F:006300
  ADC EntityX                                     ;   5A3B DA3B C 6D A9 05        F:006300
  STA R_05AD                                      ;   5A3E DA3E C 8D AD 05        F:006300
B_2_5A41:
  INY                                             ;   5A41 DA41 C C8              F:006300
  BNE B_2_5A48                                    ;   5A42 DA42 C D0 04           F:006300
  INC R_001A                                      ;   5A44 DA44 . E6 1A           
  INC R_001C                                      ;   5A46 DA46 . E6 1C           
B_2_5A48:
  LDA (R_0019),Y                                  ;   5A48 DA48 C B1 19           F:006300
  BEQ B_2_5A67                                    ;   5A4A DA4A C F0 1B           F:006300
  STA SprTile,X                                   ;   5A4C DA4C C 9D 01 02        F:006300
  LDA EntityY                                     ;   5A4F DA4F C AD AC 05        F:006300
  STA SprYPos,X                                   ;   5A52 DA52 C 9D 00 02        F:006300
  LDA R_05AD                                      ;   5A55 DA55 C AD AD 05        F:006300
  STA SprXPos,X                                   ;   5A58 DA58 C 9D 03 02        F:006300
  LDA R_05AB                                      ;   5A5B DA5B C AD AB 05        F:006300
  ORA (R_001B),Y                                  ;   5A5E DA5E C 11 1B           F:006300
  STA SprFlag,X                                   ;   5A60 DA60 C 9D 02 02        F:006300
  INX                                             ;   5A63 DA63 C E8              F:006300
  INX                                             ;   5A64 DA64 C E8              F:006300
  INX                                             ;   5A65 DA65 C E8              F:006300
  INX                                             ;   5A66 DA66 C E8              F:006300
B_2_5A67:
  SEC                                             ;   5A67 DA67 C 38              F:006300
  LDA R_05AD                                      ;   5A68 DA68 C AD AD 05        F:006300
  SBC #$8                                         ;   5A6B DA6B C E9 08           F:006300
  STA R_05AD                                      ;   5A6D DA6D C 8D AD 05        F:006300
  DEC R_001D                                      ;   5A70 DA70 C C6 1D           F:006300
  BNE B_2_5A41                                    ;   5A72 DA72 C D0 CD           F:006300
  CLC                                             ;   5A74 DA74 C 18              F:006300
  LDA EntityY                                     ;   5A75 DA75 C AD AC 05        F:006300
  ADC #$8                                         ;   5A78 DA78 C 69 08           F:006300
  STA EntityY                                     ;   5A7A DA7A C 8D AC 05        F:006300
  DEC R_0014                                      ;   5A7D DA7D C C6 14           F:006300
  BNE B_2_5A31                                    ;   5A7F DA7F C D0 B0           F:006300
  STX NextSpriteOffset                            ;   5A81 DA81 C 8E A8 05        F:006300
  RTS                                             ;   5A84 DA84 C 60              F:006300

DrawFamilyMember:
  CLC                                             ;   5A85 DA85 C 18              F:006105
  LDA R_05BD                                      ;   5A86 DA86 C AD BD 05        F:006105
  BNE B_2_5A8E                                    ;   5A89 DA89 C D0 03           F:006105
  JMP L_2_5B11                                    ;   5A8B DA8B C 4C 11 DB        F:006105

B_2_5A8E:
  LDA R_0044                                      ;   5A8E DA8E C A5 44           F:006105
  LDY ValidationAnswerCopy-1                                      ;   5A90 DA90 C A4 47           F:006105
  BNE B_2_5AC3                                    ;   5A92 DA92 C D0 2F           F:006105
  LDX R_05BF                                      ;   5A94 DA94 C AE BF 05        F:006105
  LDY R_05AE,X                                    ;   5A97 DA97 C BC AE 05        F:006105
  LDA GfxDataPtrsLo,Y                                  ;   5A9A DA9A C B9 12 DB        F:006105
  STA R_0045                                      ;   5A9D DA9D C 85 45           F:006105
  LDA GfxDataPtrsHi,Y                                  ;   5A9F DA9F C B9 DF DB        F:006105
  STA R_0046                                      ;   5AA2 DAA2 C 85 46           F:006105
  LDY #$0                                         ;   5AA4 DAA4 C A0 00           F:006105
  LDA (R_0045),Y                                  ;   5AA6 DAA6 C B1 45           F:006105
  STA R_0040                                      ;   5AA8 DAA8 C 85 40           F:006105
  INY                                             ;   5AAA DAAA C C8              F:006105
  LDA (R_0045),Y                                  ;   5AAB DAAB C B1 45           F:006105
  STA R_0041                                      ;   5AAD DAAD C 85 41           F:006105
  STA R_0042                                      ;   5AAF DAAF C 85 42           F:006105
  CMP #$7                                         ;   5AB1 DAB1 C C9 07           F:006105
  BCC B_2_5AB9                                    ;   5AB3 DAB3 C 90 04           F:006105
  SBC #$6                                         ;   5AB5 DAB5 C E9 06           F:008276
  STA R_0042                                      ;   5AB7 DAB7 C 85 42           F:008276
B_2_5AB9:
  LDA R_05AF,X                                    ;   5AB9 DAB9 C BD AF 05        F:006105
  STA R_0043                                      ;   5ABC DABC C 85 43           F:006105
  LDA R_05B0,X                                    ;   5ABE DABE C BD B0 05        F:006105
  STA R_0044                                      ;   5AC1 DAC1 C 85 44           F:006105
B_2_5AC3:
  STA PpuAddr_2006                                ;   5AC3 DAC3 C 8D 06 20        F:006105
  LDA R_0043                                      ;   5AC6 DAC6 C A5 43           F:006105
  STA PpuAddr_2006                                ;   5AC8 DAC8 C 8D 06 20        F:006105
  LDA R_0040                                      ;   5ACB DACB C A5 40           F:006105
  STA R_001D                                      ;   5ACD DACD C 85 1D           F:006105
B_2_5ACF:
  INY                                             ;   5ACF DACF C C8              F:006105
  BNE B_2_5AD4                                    ;   5AD0 DAD0 C D0 02           F:006105
  INC R_0046                                      ;   5AD2 DAD2 . E6 46           
B_2_5AD4:
  LDA (R_0045),Y                                  ;   5AD4 DAD4 C B1 45           F:006105
  STA PpuData_2007                                ;   5AD6 DAD6 C 8D 07 20        F:006105
  DEC R_001D                                      ;   5AD9 DAD9 C C6 1D           F:006105
  BNE B_2_5ACF                                    ;   5ADB DADB C D0 F2           F:006105
  CLC                                             ;   5ADD DADD C 18              F:006105
  LDA R_0043                                      ;   5ADE DADE C A5 43           F:006105
  ADC #$20                                        ;   5AE0 DAE0 C 69 20           F:006105
  STA R_0043                                      ;   5AE2 DAE2 C 85 43           F:006105
  LDA R_0044                                      ;   5AE4 DAE4 C A5 44           F:006105
  ADC #$0                                         ;   5AE6 DAE6 C 69 00           F:006105
  STA R_0044                                      ;   5AE8 DAE8 C 85 44           F:006105
  DEC R_0041                                      ;   5AEA DAEA C C6 41           F:006105
  DEC R_0042                                      ;   5AEC DAEC C C6 42           F:006105
  BNE B_2_5AC3                                    ;   5AEE DAEE C D0 D3           F:006105
  LDA R_0041                                      ;   5AF0 DAF0 C A5 41           F:006105
  BEQ B_2_5AFA                                    ;   5AF2 DAF2 C F0 06           F:006105
  STA R_0042                                      ;   5AF4 DAF4 C 85 42           F:008276
  STY ValidationAnswerCopy-1                                      ;   5AF6 DAF6 C 84 47           F:008276
  SEC                                             ;   5AF8 DAF8 C 38              F:008276
  RTS                                             ;   5AF9 DAF9 C 60              F:008276

B_2_5AFA:
  DEC R_05BD                                      ;   5AFA DAFA C CE BD 05        F:006105
  CLC                                             ;   5AFD DAFD C 18              F:006105
  LDA R_05BF                                      ;   5AFE DAFE C AD BF 05        F:006105
  ADC #$3                                         ;   5B01 DB01 C 69 03           F:006105
  CMP #$F                                         ;   5B03 DB03 C C9 0F           F:006105
  BNE B_2_5B09                                    ;   5B05 DB05 C D0 02           F:006105
  LDA #$0                                         ;   5B07 DB07 C A9 00           F:006105
B_2_5B09:
  STA R_05BF                                      ;   5B09 DB09 C 8D BF 05        F:006105
  LDA #$0                                         ;   5B0C DB0C C A9 00           F:006105
  STA ValidationAnswerCopy-1                                      ;   5B0E DB0E C 85 47           F:006105
  SEC                                             ;   5B10 DB10 C 38              F:006105
L_2_5B11:
  RTS                                             ;   5B11 DB11 C 60              F:006105




.define Unknown0Ptrs \
        GfxUnknown0,GfxUnknown1,GfxUnknown2,GfxUnknown3,GfxUnknown4, \
        GfxUnknown4_0,GfxUnknown5,GfxUnknown6,GfxUnknown7,GfxUnknown8, \
        GfxUnknown9,GfxUnknown10,GfxUnknown11,GfxUnknown12,GfxUnknown13, \
        GfxUnknown14,GfxUnknown15,GfxUnknown16,GfxUnknown17,GfxUnknown18, \
        GfxUnknown19,GfxUnknown20,GfxUnknown21,GfxUnknown22,GfxUnknown23, \
        GfxUnknown24,GfxUnknown25,GfxUnknown26,GfxUnknown27,GfxUnknown28, \
        GfxUnknown29,GfxUnknown30,GfxUnknown31,GfxUnknown32,GfxUnknown33, \
        GfxUnknown34,GfxUnknown35,GfxUnknown36,GfxUnknown37,GfxUnknown38, \
        GfxUnknown39,GfxUnknown40,GfxUnknown41,GfxUnknown42,GfxUnknown43, \
        GfxUnknown44,GfxUnknown44_0,GfxUnknown45,GfxUnknown46,GfxUnknown47, \
        GfxBigFamily00_Sad,GfxUnknown48,GfxUnknown49,GfxBigFamily00,GfxUnknown50, \
        GfxUnknown51,GfxUnknown52,GfxUnknown53,GfxUnknown54,GfxUnknown55, \
        GfxUnknown56,GfxUnknown57,GfxUnknown58,GfxUnknown59,GfxUnknown60, \
        GfxUnknown61,GfxUnknown62,GfxUnknown63,GfxUnknown64,GfxUnknown65, \
        GfxUnknown66,GfxUnknown67,GfxUnknown68,GfxUnknown69,GfxUnknown70, \
        GfxUnknown71,GfxUnknown72,GfxUnknown73,GfxUnknown74,GfxUnknown75, \
        GfxUnknown76,GfxUnknown77,GfxUnknown78,GfxUnknown79,GfxUnknown80, \
        GfxUnknown81,GfxUnknown82,GfxUnknown83,GfxUnknown84,GfxUnknown85, \
        GfxUnknown86,GfxTossupCharacter00,GfxTossupCharacter01,GfxTossupCharacter02,GfxTossupCharacter03, \
        GfxTossupCharacter04,GfxUnknown88,GfxUnknown89,GfxTossupCharacter05,GfxTossupCharacter06, \
        GfxTossupCharacter07,GfxTossupCharacter08,GfxTossupCharacter09,GfxUnknown90,GfxUnknown91, \
        GfxUnknown92,GfxUnknown93,GfxTossupCharacter10,GfxTossupCharacter11,GfxTossupCharacter12, \
        GfxTossupCharacter13,GfxTossupCharacter14,GfxUnknown94,GfxUnknown95,GfxUnknown96, \
        GfxUnknown97,GfxUnknown98,GfxUnknown99,GfxUnknown100,GfxUnknown101, \
        GfxUnknown102,GfxUnknown103,GfxUnknown104,GfxSmallFamily00_Sad,GfxSmallFamily01_Sad, \
        GfxSmallFamily02_Sad,GfxSmallFamily03_Sad,GfxSmallFamily04_Sad,GfxSmallFamily00,GfxSmallFamily01, \
        GfxSmallFamily02,GfxSmallFamily03,GfxSmallFamily04,GfxSmallFamily05_Sad,GfxSmallFamily06_Sad, \
        GfxSmallFamily07_Sad,GfxSmallFamily08_Sad,GfxSmallFamily09_Sad,GfxSmallFamily10_Sad,GfxSmallFamily11_Sad, \
        GfxSmallFamily12_Sad,GfxSmallFamily13_Sad,GfxSmallFamily14_Sad,GfxSmallFamily05,GfxSmallFamily06, \
        GfxSmallFamily07,GfxSmallFamily08,GfxSmallFamily09,GfxSmallFamily10,GfxSmallFamily11, \
        GfxSmallFamily12,GfxSmallFamily13,GfxSmallFamily14,GfxUnknown105,GfxUnknown106, \
        GfxUnknown107,GfxUnknown108,GfxUnknown109,GfxUnknown110,GfxUnknown111, \
        GfxUnknown112,GfxUnknown113,GfxUnknown114,GfxUnknown115,GfxUnknown116, \
        GfxUnknown117,GfxUnknown118,GfxUnknown119,GfxUnknown120,GfxUnknown121, \
        GfxUnknown122,GfxUnknown123,GfxUnknown124,GfxUnknown125,GfxUnknown126, \
        GfxUnknown127,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128, \
        GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128, \
        GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128, \
        GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128, \
        GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128, \
        GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown128,GfxUnknown129

GfxDataPtrsLo: .lobytes Unknown0Ptrs
GfxDataPtrsHi: .hibytes Unknown0Ptrs

; ----------------------------------------------------------------------------



GfxUnknown0:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$09,$0A,$0B
.byte $00,$10,$11,$12
.byte $15,$16,$17,$18
.byte $19,$1A,$1B,$1C
.byte $19,$24,$25,$26

GfxUnknown1:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$09,$0C,$0B
.byte $00,$10,$13,$12
.byte $15,$16,$17,$18
.byte $1D,$1E,$1F,$20
.byte $27,$28,$25,$29

GfxUnknown2:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$09,$0C,$0B
.byte $00,$10,$13,$12
.byte $15,$16,$17,$18
.byte $19,$21,$22,$23
.byte $2A,$2B,$2C,$2D

GfxUnknown3:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$09,$0C,$0B
.byte $00,$10,$13,$12
.byte $15,$16,$17,$18
.byte $1D,$1E,$1B,$1C
.byte $27,$28,$25,$26

GfxUnknown4:
.byte $04,$06
.byte $00,$07,$08,$06
.byte $00,$0D,$0E,$0F
.byte $00,$10,$14,$12
.byte $15,$16,$17,$18
.byte $19,$1A,$1B,$1C
.byte $19,$24,$25,$26

GfxUnknown4_0:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$2E,$2F,$30
.byte $00,$32,$33,$34
.byte $00,$38,$39,$3A
.byte $00,$42,$43,$44
.byte $50,$51,$40,$52

GfxUnknown5:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$2E,$2F,$30
.byte $00,$35,$36,$34
.byte $3B,$3C,$39,$3A
.byte $45,$46,$47,$48
.byte $53,$54,$55,$56

GfxUnknown6:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $2E,$2F,$30,$00
.byte $32,$36,$34,$00
.byte $38,$3D,$3C,$3E
.byte $49,$4A,$4B,$4C
.byte $57,$58,$59,$5A

GfxUnknown7:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$2E,$2F,$30
.byte $00,$32,$36,$34
.byte $00,$38,$3D,$3A
.byte $00,$42,$43,$44
.byte $50,$51,$40,$52

GfxUnknown8:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$2E,$31,$30
.byte $00,$32,$37,$34
.byte $00,$3F,$40,$41
.byte $00,$4D,$4E,$4F
.byte $00,$5B,$5C,$5D

GfxUnknown9:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$61,$62,$63
.byte $00,$68,$69,$6A
.byte $00,$72,$73,$74

GfxUnknown10:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$61,$62,$64
.byte $00,$6B,$69,$6C
.byte $00,$75,$73,$76

GfxUnknown11:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$5E
.byte $5F,$00,$00,$60
.byte $65,$66,$62,$67
.byte $6D,$6E,$6F,$70
.byte $00,$77,$73,$78

GfxUnknown12:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$61,$62,$63
.byte $00,$68,$6F,$6A
.byte $00,$72,$73,$74

GfxUnknown13:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$61,$62,$63
.byte $00,$68,$71,$6A
.byte $00,$72,$73,$74

GfxUnknown14:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7D,$7E,$7F
.byte $00,$85,$86,$87
.byte $00,$8F,$90,$91
.byte $00,$99,$9A,$9B
.byte $00,$A4,$A5,$A6

GfxUnknown15:
.byte $04,$06
.byte $00,$79,$00,$00
.byte $00,$80,$7E,$7F
.byte $00,$88,$89,$87
.byte $00,$92,$90,$91
.byte $00,$9C,$9D,$9B
.byte $00,$A7,$A8,$A6

GfxUnknown16:
.byte $04,$06
.byte $00,$00,$00,$7A
.byte $00,$7D,$7E,$81
.byte $00,$85,$89,$8A
.byte $00,$8F,$93,$94
.byte $00,$99,$9E,$9F
.byte $00,$A4,$A9,$AA

GfxUnknown17:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7D,$7E,$7F
.byte $00,$85,$89,$87
.byte $00,$8F,$90,$91
.byte $00,$99,$9A,$9B
.byte $00,$A4,$A5,$A6

GfxUnknown18:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7D,$7E,$7F
.byte $00,$85,$8B,$87
.byte $00,$8F,$95,$91
.byte $00,$99,$A0,$9B
.byte $00,$AB,$AC,$AD

GfxUnknown19:
.byte $04,$06
.byte $00,$7B,$7C,$00
.byte $00,$82,$83,$84
.byte $00,$8C,$B1,$8E
.byte $00,$96,$97,$98
.byte $00,$A1,$A2,$A3
.byte $00,$AE,$AF,$B0

GfxUnknown20:
.byte $04,$06
.byte $00,$7B,$7C,$00
.byte $00,$82,$83,$84
.byte $B2,$8C,$8D,$B3
.byte $B5,$B6,$97,$B7
.byte $BC,$BD,$A2,$BE
.byte $00,$C2,$C3,$B0

GfxUnknown21:
.byte $04,$06
.byte $00,$7B,$7C,$00
.byte $00,$82,$83,$84
.byte $00,$8C,$8D,$8E
.byte $B8,$B9,$BA,$BB
.byte $BF,$C0,$A2,$C1
.byte $00,$C4,$C3,$C5

GfxUnknown22:
.byte $04,$06
.byte $00,$7B,$7C,$00
.byte $00,$82,$83,$84
.byte $00,$8C,$8D,$8E
.byte $00,$96,$97,$98
.byte $00,$A1,$A2,$A3
.byte $00,$AE,$AF,$B0

GfxUnknown23:
.byte $04,$06
.byte $00,$7B,$7C,$00
.byte $00,$82,$83,$84
.byte $00,$8C,$B4,$8E
.byte $00,$96,$97,$98
.byte $00,$A1,$A2,$A3
.byte $00,$AE,$AF,$B0

GfxUnknown24:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$08,$09,$0A
.byte $00,$0D,$0E,$0F
.byte $13,$14,$15,$16
.byte $00,$19,$1A,$1B
.byte $00,$1F,$20,$21

GfxUnknown25:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$08,$0B,$0A
.byte $00,$0D,$0E,$0F
.byte $13,$14,$17,$16
.byte $00,$1C,$1D,$1B
.byte $00,$22,$23,$21

GfxUnknown26:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$08,$0B,$0A
.byte $00,$10,$0E,$0F
.byte $13,$18,$15,$16
.byte $00,$1E,$1A,$1B
.byte $00,$24,$25,$21

GfxUnknown27:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$08,$0B,$0A
.byte $00,$0D,$0E,$0F
.byte $13,$14,$15,$16
.byte $00,$19,$1A,$1B
.byte $00,$1F,$20,$21

GfxUnknown28:
.byte $04,$06
.byte $00,$04,$07,$06
.byte $00,$08,$0C,$0A
.byte $00,$11,$0E,$12
.byte $13,$14,$15,$16
.byte $00,$19,$1A,$1B
.byte $00,$1F,$20,$21

GfxUnknown29:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$26,$27,$28
.byte $00,$29,$2A,$2B
.byte $00,$2F,$30,$31
.byte $00,$36,$37,$38
.byte $00,$40,$41,$42

GfxUnknown30:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$26,$27,$28
.byte $00,$29,$2C,$2B
.byte $00,$32,$30,$31
.byte $00,$39,$3A,$3B
.byte $00,$43,$44,$45

GfxUnknown31:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$26,$27,$28
.byte $00,$29,$2C,$2B
.byte $00,$33,$34,$31
.byte $00,$39,$3C,$3D
.byte $00,$43,$46,$45

GfxUnknown32:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$26,$27,$28
.byte $00,$29,$2C,$2B
.byte $00,$2F,$30,$31
.byte $00,$36,$37,$38
.byte $00,$40,$41,$42

GfxUnknown33:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$26,$27,$28
.byte $00,$2D,$2E,$2B
.byte $00,$2F,$35,$31
.byte $00,$3E,$37,$3F
.byte $00,$40,$47,$42

GfxUnknown34:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$48,$49,$4A
.byte $00,$4C,$4D,$4E
.byte $00,$53,$54,$55
.byte $00,$5C,$5D,$5E

GfxUnknown35:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$48,$49,$4A
.byte $00,$4C,$4F,$4E
.byte $00,$56,$57,$58
.byte $00,$5F,$60,$61

GfxUnknown36:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$48,$49,$4A
.byte $00,$4C,$50,$51
.byte $59,$5A,$54,$5B
.byte $62,$63,$64,$65

GfxUnknown37:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$48,$49,$4A
.byte $00,$4C,$50,$4E
.byte $59,$5A,$54,$55
.byte $62,$63,$64,$5E

GfxUnknown38:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$48,$4B,$4A
.byte $00,$4C,$52,$51
.byte $00,$53,$54,$5B
.byte $00,$5C,$5D,$65

GfxUnknown39:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$66,$67,$68
.byte $00,$69,$6A,$6B
.byte $00,$6F,$70,$71
.byte $00,$75,$76,$77
.byte $82,$83,$84,$85

GfxUnknown40:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$66,$67,$68
.byte $00,$69,$6C,$6B
.byte $00,$6F,$72,$71
.byte $59,$78,$79,$7A
.byte $62,$83,$86,$87

GfxUnknown41:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$66,$67,$68
.byte $00,$6D,$6A,$6B
.byte $00,$73,$70,$71
.byte $7B,$7C,$7D,$7E
.byte $88,$89,$8A,$8B

GfxUnknown42:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$66,$67,$68
.byte $00,$69,$6A,$6B
.byte $00,$6F,$72,$71
.byte $00,$78,$7F,$80
.byte $82,$83,$86,$87

GfxUnknown43:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$66,$67,$68
.byte $00,$69,$6E,$6B
.byte $00,$6F,$74,$71
.byte $00,$78,$79,$81
.byte $82,$83,$84,$85

GfxUnknown44:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $90,$91,$92,$93
.byte $95,$96,$97,$98
.byte $A0,$A1,$A2,$A3
.byte $AB,$AC,$AD,$AE

GfxUnknown44_0:
.byte $04,$06
.byte $8C,$8D,$00,$00
.byte $8E,$8F,$00,$00
.byte $94,$91,$92,$93
.byte $99,$9A,$9B,$98
.byte $A4,$A1,$A5,$A6
.byte $AF,$B0,$AD,$AE

GfxUnknown45:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $90,$91,$92,$93
.byte $9C,$96,$97,$98
.byte $A7,$A1,$A2,$A3
.byte $B1,$B2,$AD,$AE

GfxUnknown46:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $90,$91,$92,$93
.byte $95,$9D,$9B,$98
.byte $A0,$A1,$A2,$A3
.byte $AB,$AC,$AD,$AE

GfxUnknown47:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $90,$91,$92,$93
.byte $95,$9E,$9F,$98
.byte $A8,$A9,$AA,$A6
.byte $AB,$AC,$AD,$AE

GfxBigFamily00_Sad:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$07,$08,$09
.byte $00,$0D,$0E,$0F
.byte $00,$13,$14,$15
.byte $00,$18,$19,$1A
.byte $00,$1F,$20,$21

GfxUnknown48:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$07,$0A,$09
.byte $00,$0D,$10,$0F
.byte $00,$13,$14,$15
.byte $00,$18,$19,$1A
.byte $00,$22,$20,$23

GfxUnknown49:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$07,$0B,$09
.byte $00,$0D,$11,$0F
.byte $00,$13,$14,$15
.byte $00,$1B,$19,$1A
.byte $00,$25,$20,$26

GfxBigFamily00:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$07,$08,$09
.byte $00,$0D,$10,$0F
.byte $00,$13,$14,$15
.byte $00,$18,$19,$1A
.byte $00,$1F,$20,$21

GfxUnknown50:
.byte $04,$06
.byte $00,$04,$05,$06
.byte $00,$07,$0C,$09
.byte $00,$0D,$12,$0F
.byte $00,$16,$14,$17
.byte $00,$1C,$1D,$1E
.byte $00,$1F,$20,$21

GfxUnknown51:
.byte $04,$06
.byte $00,$00,$27,$28
.byte $00,$29,$2A,$2B
.byte $00,$2F,$30,$31
.byte $00,$3B,$3C,$3D
.byte $00,$46,$47,$48
.byte $50,$51,$52,$53

GfxUnknown52:
.byte $04,$06
.byte $00,$00,$27,$28
.byte $00,$29,$2C,$2B
.byte $32,$33,$34,$31
.byte $3E,$3F,$40,$3D
.byte $49,$4A,$47,$48
.byte $54,$55,$52,$53

GfxUnknown53:
.byte $04,$06
.byte $00,$00,$27,$28
.byte $00,$29,$2A,$2B
.byte $35,$36,$34,$31
.byte $41,$42,$3C,$3D
.byte $49,$4B,$47,$48
.byte $54,$55,$52,$53

GfxUnknown54:
.byte $04,$06
.byte $00,$00,$27,$28
.byte $00,$29,$2A,$2B
.byte $00,$37,$34,$31
.byte $00,$43,$3C,$3D
.byte $00,$4C,$47,$48
.byte $50,$51,$52,$53

GfxUnknown55:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$00,$2D,$2E
.byte $00,$38,$39,$3A
.byte $00,$44,$30,$45
.byte $00,$4D,$4E,$4F
.byte $50,$51,$56,$53

GfxUnknown56:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$5A,$5B,$5C
.byte $00,$60,$61,$62
.byte $00,$64,$65,$66
.byte $00,$6B,$20,$6C
.byte $00,$73,$6E,$74

GfxUnknown57:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$5A,$5B,$5C
.byte $00,$60,$5E,$62
.byte $63,$64,$65,$66
.byte $68,$69,$20,$6A
.byte $00,$75,$6E,$6F

GfxUnknown58:
.byte $04,$06
.byte $00,$57,$58,$59
.byte $00,$5D,$5E,$5F
.byte $63,$64,$65,$66
.byte $68,$69,$20,$6A
.byte $00,$6D,$6E,$6F
.byte $00,$76,$77,$78

GfxUnknown59:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$5A,$5B,$5C
.byte $00,$60,$5E,$62
.byte $00,$64,$65,$66
.byte $00,$70,$20,$6A
.byte $00,$79,$6E,$7A

GfxUnknown60:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$5A,$5B,$5C
.byte $00,$60,$67,$62
.byte $00,$64,$65,$66
.byte $00,$71,$20,$72
.byte $00,$79,$6E,$7B

GfxUnknown61:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7C,$7D,$7E
.byte $00,$7F,$80,$81
.byte $00,$83,$84,$85
.byte $00,$87,$88,$89
.byte $00,$8C,$8D,$8E

GfxUnknown62:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7C,$7D,$7E
.byte $00,$7F,$80,$81
.byte $00,$83,$86,$85
.byte $00,$87,$8A,$8B
.byte $00,$8F,$90,$91

GfxUnknown63:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7C,$7D,$7E
.byte $00,$7F,$80,$81
.byte $00,$83,$86,$85
.byte $00,$87,$88,$89
.byte $00,$8C,$8D,$8E

GfxUnknown64:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7C,$7D,$7E
.byte $00,$7F,$82,$81
.byte $00,$83,$3C,$85
.byte $00,$87,$88,$89
.byte $00,$8C,$8D,$8E

GfxUnknown65:
.byte $04,$06
.byte $00,$00,$00,$00
.byte $00,$7C,$7D,$7E
.byte $00,$7F,$82,$81
.byte $00,$83,$84,$85
.byte $00,$87,$88,$89
.byte $00,$8C,$8D,$8E

GfxUnknown66:
.byte $04,$06
.byte $00,$92,$93,$94
.byte $00,$95,$96,$97
.byte $00,$9C,$9D,$9E
.byte $00,$9F,$A0,$A1
.byte $00,$A2,$A3,$77
.byte $00,$AC,$AD,$AE

GfxUnknown67:
.byte $04,$06
.byte $00,$92,$93,$94
.byte $00,$95,$98,$97
.byte $00,$9C,$9D,$9E
.byte $00,$9F,$A0,$A1
.byte $A4,$A5,$A6,$A7
.byte $AF,$77,$B0,$B1

GfxUnknown68:
.byte $04,$06
.byte $00,$92,$93,$94
.byte $00,$99,$98,$97
.byte $00,$9C,$9D,$9E
.byte $00,$9F,$A0,$A1
.byte $A8,$A9,$AA,$AB
.byte $B2,$B3,$B4,$B5

GfxUnknown69:
.byte $04,$06
.byte $00,$92,$93,$94
.byte $00,$9A,$98,$97
.byte $00,$9C,$9D,$9E
.byte $00,$9F,$A0,$A1
.byte $00,$A2,$A3,$77
.byte $00,$AC,$AD,$AE

GfxUnknown70:
.byte $04,$06
.byte $00,$92,$93,$94
.byte $00,$9A,$9B,$97
.byte $00,$9C,$9D,$9E
.byte $00,$9F,$A0,$A1
.byte $00,$A2,$A3,$77
.byte $00,$A5,$AD,$AE

GfxUnknown71:
.byte $04,$0C
.byte $00,$01,$02,$00
.byte $00,$07,$08,$00
.byte $00,$13,$14,$15
.byte $21,$22,$23,$24
.byte $35,$36,$37,$38
.byte $49,$4A,$4B,$4C
.byte $5D,$5E,$5F,$60
.byte $6B,$6C,$6D,$6E
.byte $79,$00,$7A,$7B
.byte $79,$00,$87,$88
.byte $92,$5E,$93,$94
.byte $9D,$6C,$9E,$9F

GfxUnknown72:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$09,$0A,$0B
.byte $00,$16,$17,$18
.byte $00,$25,$26,$27
.byte $00,$39,$3A,$3B
.byte $49,$00,$4D,$4E
.byte $5D,$5E,$61,$62
.byte $6B,$6C,$6F,$70
.byte $79,$00,$7C,$7D
.byte $79,$00,$89,$8A
.byte $92,$5E,$95,$96
.byte $9D,$6C,$A0,$A1

GfxUnknown73:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$28,$29,$2A
.byte $00,$3C,$3D,$3E
.byte $49,$4F,$50,$51
.byte $5D,$5E,$63,$64
.byte $6B,$6C,$71,$72
.byte $79,$00,$7E,$7F
.byte $79,$00,$8B,$8C
.byte $92,$5E,$97,$98
.byte $9D,$6C,$A2,$A3

GfxUnknown74:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$0C,$0D,$0E
.byte $00,$19,$1A,$1B
.byte $00,$2B,$2C,$2D
.byte $00,$3F,$40,$41
.byte $49,$52,$53,$54
.byte $5D,$5E,$65,$66
.byte $6B,$6C,$73,$74
.byte $79,$00,$80,$81
.byte $79,$00,$8D,$8E
.byte $92,$5E,$99,$9A
.byte $9D,$6C,$A4,$A5

GfxUnknown75:
.byte $04,$0C
.byte $00,$03,$04,$00
.byte $00,$0F,$10,$00
.byte $00,$1C,$1D,$1E
.byte $00,$2E,$2F,$30
.byte $00,$42,$43,$44
.byte $55,$56,$57,$58
.byte $5D,$5E,$67,$68
.byte $6B,$6C,$75,$76
.byte $79,$00,$82,$83
.byte $79,$00,$8F,$90
.byte $92,$5E,$9B,$9C
.byte $9D,$6C,$A6,$A7

GfxUnknown76:
.byte $04,$06
.byte $00,$05,$06,$00
.byte $00,$11,$12,$00
.byte $00,$1F,$20,$00
.byte $31,$32,$33,$34
.byte $45,$46,$47,$48
.byte $59,$5A,$5B,$5C

GfxUnknown77:
.byte $04,$06
.byte $00,$69,$6A,$00
.byte $00,$77,$78,$00
.byte $00,$84,$85,$86
.byte $31,$32,$91,$34
.byte $45,$46,$47,$48
.byte $59,$5A,$5B,$5C

GfxUnknown78:
.byte $04,$0C
.byte $00,$A8,$A9,$AA
.byte $00,$AD,$AE,$AF
.byte $00,$B6,$B7,$B8
.byte $C0,$C1,$23,$24
.byte $C6,$36,$37,$38
.byte $CF,$6D,$4B,$4C
.byte $5D,$5E,$5F,$60
.byte $6B,$6C,$6D,$6E
.byte $79,$00,$7A,$7B
.byte $79,$00,$87,$88
.byte $92,$5E,$93,$94
.byte $9D,$6C,$9E,$9F

GfxUnknown79:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$B0,$B1,$B2
.byte $00,$B9,$BA,$BB
.byte $00,$C2,$C3,$27
.byte $00,$C7,$C8,$3B
.byte $D0,$D1,$4D,$4E
.byte $5D,$5E,$61,$62
.byte $6B,$6C,$6F,$70
.byte $79,$00,$7C,$7D
.byte $79,$00,$89,$8A
.byte $92,$5E,$95,$96
.byte $9D,$6C,$A0,$A1

GfxUnknown80:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$C4,$C5,$00
.byte $C9,$CA,$CB,$CC
.byte $D2,$D3,$D4,$D5
.byte $5D,$5E,$DB,$DC
.byte $6B,$6C,$71,$72
.byte $79,$00,$7E,$7F
.byte $79,$00,$8B,$8C
.byte $92,$5E,$97,$98
.byte $9D,$6C,$A2,$A3

GfxUnknown81:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$0C,$0D,$0E
.byte $00,$19,$BC,$1B
.byte $00,$2B,$2C,$2D
.byte $00,$3F,$CD,$41
.byte $D6,$D7,$D8,$54
.byte $5D,$5E,$65,$66
.byte $6B,$6C,$73,$74
.byte $79,$00,$80,$81
.byte $79,$00,$8D,$8E
.byte $92,$5E,$99,$9A
.byte $9D,$6C,$A4,$A5

GfxUnknown82:
.byte $04,$0C
.byte $00,$03,$04,$00
.byte $00,$0F,$10,$00
.byte $00,$1C,$1D,$1E
.byte $00,$2E,$2F,$30
.byte $00,$CE,$43,$44
.byte $D9,$DA,$57,$58
.byte $5D,$5E,$67,$68
.byte $6B,$6C,$75,$76
.byte $79,$00,$82,$83
.byte $79,$00,$8F,$90
.byte $92,$5E,$9B,$9C
.byte $9D,$6C,$A6,$A7

GfxUnknown83:
.byte $04,$06
.byte $AB,$AC,$00,$00
.byte $B3,$B4,$B5,$00
.byte $BD,$BE,$BF,$00
.byte $31,$32,$33,$34
.byte $45,$46,$47,$48
.byte $59,$5A,$5B,$5C

GfxUnknown84:
.byte $04,$06
.byte $00,$05,$06,$00
.byte $00,$DD,$DE,$00
.byte $00,$DF,$E0,$00
.byte $31,$32,$91,$34
.byte $45,$46,$47,$48
.byte $59,$5A,$5B,$5C

GfxUnknown85:
.byte $04,$02
.byte $E1,$E1,$E1,$E1
.byte $E1,$E1,$E1,$E1

GfxUnknown86:
.byte $04,$02
.byte $E1,$E1,$E2,$E2
.byte $E1,$E1,$E2,$E2

GfxTossupCharacter00:
.byte $04,$0C
.byte $00,$01,$02,$03
.byte $00,$08,$09,$0A
.byte $00,$00,$10,$11
.byte $00,$00,$20,$21
.byte $00,$31,$32,$33
.byte $44,$45,$46,$47
.byte $58,$59,$5A,$5B
.byte $64,$65,$66,$67
.byte $70,$00,$71,$72
.byte $70,$00,$7C,$7D
.byte $84,$59,$85,$86
.byte $8D,$65,$8E,$8F

GfxTossupCharacter01:
.byte $04,$0C
.byte $00,$00,$04,$05
.byte $00,$0B,$0C,$0D
.byte $00,$12,$13,$14
.byte $00,$00,$22,$23
.byte $00,$34,$35,$36
.byte $44,$48,$49,$4A
.byte $58,$59,$5C,$5D
.byte $64,$65,$68,$69
.byte $70,$00,$73,$74
.byte $70,$00,$7E,$74
.byte $84,$59,$87,$88
.byte $8D,$65,$90,$91

GfxTossupCharacter02:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$15,$16,$17
.byte $00,$24,$25,$26
.byte $00,$37,$38,$39
.byte $44,$4B,$4C,$4D
.byte $58,$59,$5E,$5F
.byte $64,$65,$6A,$6B
.byte $70,$00,$75,$76
.byte $70,$00,$7F,$80
.byte $84,$59,$89,$8A
.byte $8D,$65,$92,$93

GfxTossupCharacter03:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$18,$19,$1A
.byte $00,$27,$28,$29
.byte $00,$3A,$3B,$3C
.byte $44,$4E,$4F,$50
.byte $58,$59,$5C,$5D
.byte $64,$65,$68,$69
.byte $70,$00,$73,$74
.byte $70,$00,$7E,$74
.byte $84,$59,$87,$88
.byte $8D,$65,$90,$91

GfxTossupCharacter04:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$1B,$1C,$1D
.byte $00,$2A,$2B,$2C
.byte $00,$3D,$3E,$3F
.byte $44,$51,$52,$53
.byte $58,$59,$60,$61
.byte $64,$65,$6C,$6D
.byte $70,$00,$77,$78
.byte $70,$00,$81,$82
.byte $84,$59,$8B,$8C
.byte $8D,$65,$94,$8F

GfxUnknown88:
.byte $04,$06
.byte $00,$06,$07,$00
.byte $00,$0E,$0F,$00
.byte $00,$1E,$1F,$00
.byte $2D,$2E,$2F,$30
.byte $40,$41,$42,$43
.byte $54,$55,$56,$57

GfxUnknown89:
.byte $04,$06
.byte $00,$62,$63,$00
.byte $00,$6E,$6F,$00
.byte $00,$79,$7A,$7B
.byte $2D,$2E,$83,$30
.byte $40,$41,$42,$43
.byte $54,$55,$56,$57

GfxTossupCharacter05:
.byte $04,$0C
.byte $95,$96,$97,$00
.byte $9D,$9E,$9F,$00
.byte $00,$A9,$10,$11
.byte $00,$00,$20,$21
.byte $00,$C2,$32,$33
.byte $CE,$CF,$46,$47
.byte $58,$59,$5A,$5B
.byte $64,$65,$66,$DE
.byte $70,$00,$71,$E1
.byte $70,$00,$7C,$7D
.byte $84,$59,$85,$86
.byte $8D,$65,$8E,$8F

GfxTossupCharacter06:
.byte $04,$0C
.byte $00,$98,$99,$9A
.byte $00,$A0,$A1,$A2
.byte $00,$AA,$AB,$AC
.byte $00,$00,$B8,$B9
.byte $00,$C3,$C4,$C5
.byte $D0,$D1,$D2,$4A
.byte $58,$59,$5C,$5D
.byte $64,$65,$68,$69
.byte $70,$00,$73,$74
.byte $70,$00,$7E,$74
.byte $84,$59,$87,$88
.byte $8D,$65,$90,$91

GfxTossupCharacter07:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$AD,$AE,$00
.byte $00,$BA,$BB,$00
.byte $00,$C6,$C7,$00
.byte $D3,$D4,$D5,$D6
.byte $58,$59,$5E,$5F
.byte $64,$65,$6A,$6B
.byte $70,$00,$75,$76
.byte $70,$00,$7F,$80
.byte $84,$59,$89,$8A
.byte $8D,$65,$92,$93

GfxTossupCharacter08:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$A3,$A4,$A5
.byte $00,$AF,$B0,$B1
.byte $00,$BC,$BD,$BE
.byte $00,$C8,$C9,$CA
.byte $D7,$D8,$D9,$DA
.byte $58,$59,$5C,$5D
.byte $64,$65,$68,$69
.byte $70,$00,$73,$74
.byte $70,$00,$7E,$74
.byte $84,$59,$87,$88
.byte $8D,$65,$90,$91

GfxTossupCharacter09:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$B2,$B3,$B4
.byte $00,$BF,$C0,$C1
.byte $00,$CB,$CC,$CD
.byte $51,$DB,$DC,$DD
.byte $58,$59,$60,$61
.byte $64,$65,$6C,$6D
.byte $70,$00,$77,$78
.byte $70,$00,$81,$82
.byte $84,$59,$8B,$8C
.byte $8D,$65,$94,$8F

GfxUnknown90:
.byte $04,$06
.byte $9B,$9C,$00,$00
.byte $A6,$A7,$A8,$00
.byte $B5,$B6,$B7,$00
.byte $2D,$2E,$2F,$30
.byte $40,$41,$42,$43
.byte $54,$55,$56,$57

GfxUnknown91:
.byte $04,$06
.byte $00,$06,$07,$00
.byte $00,$DF,$E0,$00
.byte $00,$E2,$E3,$00
.byte $2D,$2E,$83,$30
.byte $40,$41,$42,$43
.byte $54,$55,$56,$57

GfxUnknown92:
.byte $04,$02
.byte $E4,$E4,$E4,$E4
.byte $E4,$E4,$E4,$E4

GfxUnknown93:
.byte $04,$02
.byte $E4,$E4,$E5,$E5
.byte $E4,$E4,$E5,$E5

GfxTossupCharacter10:
.byte $04,$0C
.byte $00,$01,$02,$00
.byte $00,$08,$09,$0A
.byte $00,$18,$19,$00
.byte $00,$00,$27,$28
.byte $00,$39,$3A,$3B
.byte $4C,$4D,$4E,$4F
.byte $5E,$5F,$60,$61
.byte $6B,$6C,$6D,$6E
.byte $78,$00,$79,$7A
.byte $78,$00,$86,$87
.byte $90,$5F,$91,$92
.byte $9B,$6C,$9C,$9D

GfxTossupCharacter11:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$0B,$0C,$0D
.byte $00,$1A,$1B,$1C
.byte $00,$29,$2A,$2B
.byte $00,$3C,$3D,$3E
.byte $4C,$50,$51,$52
.byte $5E,$5F,$62,$63
.byte $6B,$6C,$6F,$70
.byte $78,$00,$7B,$7C
.byte $78,$00,$88,$89
.byte $90,$5F,$93,$94
.byte $9B,$6C,$9E,$9F

GfxTossupCharacter12:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$0E,$0F,$10
.byte $00,$1D,$1E,$1F
.byte $00,$2C,$2D,$2E
.byte $00,$3F,$40,$41
.byte $4C,$53,$54,$55
.byte $5E,$5F,$64,$65
.byte $6B,$6C,$71,$72
.byte $78,$00,$7D,$7E
.byte $78,$00,$8A,$7E
.byte $90,$5F,$95,$96
.byte $9B,$6C,$A0,$A1

GfxTossupCharacter13:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$11,$12,$00
.byte $00,$20,$21,$00
.byte $00,$2F,$30,$31
.byte $00,$42,$43,$44
.byte $4C,$00,$56,$57
.byte $5E,$5F,$66,$67
.byte $6B,$6C,$73,$74
.byte $78,$00,$7F,$80
.byte $78,$00,$8B,$8C
.byte $90,$5F,$97,$98
.byte $9B,$6C,$A2,$A3

GfxTossupCharacter14:
.byte $04,$0C
.byte $00,$03,$04,$05
.byte $00,$13,$14,$15
.byte $00,$22,$23,$24
.byte $00,$32,$33,$34
.byte $00,$45,$46,$47
.byte $4C,$58,$59,$47
.byte $5E,$5F,$68,$47
.byte $6B,$6C,$47,$75
.byte $78,$00,$81,$82
.byte $78,$00,$8D,$8E
.byte $90,$5F,$99,$9A
.byte $9B,$6C,$A4,$A5

GfxUnknown94:
.byte $04,$06
.byte $00,$06,$07,$00
.byte $00,$16,$17,$00
.byte $00,$25,$26,$00
.byte $35,$36,$37,$38
.byte $48,$49,$4A,$4B
.byte $5A,$5B,$5C,$5D

GfxUnknown95:
.byte $04,$06
.byte $00,$69,$6A,$00
.byte $00,$76,$77,$00
.byte $00,$83,$84,$85
.byte $35,$36,$8F,$38
.byte $48,$49,$4A,$4B
.byte $5A,$5B,$5C,$5D

GfxUnknown96:
.byte $04,$0C
.byte $00,$01,$02,$00
.byte $00,$08,$09,$0A
.byte $00,$18,$19,$00
.byte $00,$00,$BE,$28
.byte $00,$00,$C5,$C6
.byte $D0,$D1,$D2,$D3
.byte $5E,$5F,$60,$61
.byte $6B,$6C,$6D,$6E
.byte $78,$00,$79,$7A
.byte $78,$00,$86,$87
.byte $90,$5F,$91,$92
.byte $9B,$6C,$9C,$9D

GfxUnknown97:
.byte $04,$0C
.byte $00,$00,$A6,$A7
.byte $00,$AA,$AB,$AC
.byte $00,$B4,$B5,$B6
.byte $00,$00,$BF,$C0
.byte $00,$C7,$C8,$3E
.byte $D0,$D4,$51,$52
.byte $5E,$5F,$62,$63
.byte $6B,$6C,$6F,$70
.byte $78,$00,$7B,$7C
.byte $78,$00,$88,$89
.byte $90,$5F,$93,$94
.byte $9B,$6C,$9E,$9F

GfxUnknown98:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$AD,$AE,$AF
.byte $00,$B7,$B8,$B9
.byte $00,$C1,$C2,$C3
.byte $00,$C9,$CA,$CB
.byte $D5,$D6,$D7,$D8
.byte $5E,$5F,$47,$DE
.byte $6B,$6C,$47,$DF
.byte $78,$00,$E2,$7E
.byte $78,$00,$8A,$7E
.byte $90,$5F,$95,$96
.byte $9B,$6C,$A0,$A1

GfxUnknown99:
.byte $04,$0C
.byte $00,$00,$00,$00
.byte $00,$11,$12,$00
.byte $00,$20,$21,$00
.byte $00,$2F,$30,$31
.byte $00,$00,$CC,$CD
.byte $D9,$DA,$DB,$57
.byte $5E,$5F,$66,$67
.byte $6B,$6C,$73,$74
.byte $78,$00,$7F,$80
.byte $78,$00,$8B,$8C
.byte $90,$5F,$97,$98
.byte $9B,$6C,$A2,$A3

GfxUnknown100:
.byte $04,$0C
.byte $00,$03,$04,$05
.byte $00,$13,$B0,$15
.byte $00,$BA,$23,$24
.byte $00,$C4,$33,$34
.byte $CE,$CF,$46,$47
.byte $DC,$DD,$59,$47
.byte $5E,$5F,$68,$47
.byte $6B,$6C,$47,$75
.byte $78,$00,$81,$82
.byte $78,$00,$8D,$8E
.byte $90,$5F,$99,$9A
.byte $9B,$6C,$A4,$A5

GfxUnknown101:
.byte $04,$06
.byte $A8,$A9,$00,$00
.byte $B1,$B2,$B3,$00
.byte $BB,$BC,$BD,$00
.byte $35,$36,$37,$38
.byte $48,$49,$4A,$4B
.byte $5A,$5B,$5C,$5D

GfxUnknown102:
.byte $04,$06
.byte $00,$06,$07,$00
.byte $00,$E0,$E1,$00
.byte $00,$E3,$E4,$00
.byte $35,$36,$8F,$38
.byte $48,$49,$4A,$4B
.byte $5A,$5B,$5C,$5D

GfxUnknown103:
.byte $04,$02
.byte $E5,$E5,$E5,$E5
.byte $E5,$E5,$E5,$E5

GfxUnknown104:
.byte $04,$02
.byte $E5,$E5,$E6,$E6
.byte $E5,$E5,$E6,$E6

GfxSmallFamily00_Sad:
.byte $02,$04
.byte $5B,$5C
.byte $65,$66
.byte $6F,$70
.byte $79,$7A

GfxSmallFamily01_Sad:
.byte $02,$04
.byte $5D,$5E
.byte $67,$68
.byte $71,$72
.byte $7B,$7C

GfxSmallFamily02_Sad:
.byte $02,$04
.byte $5F,$60
.byte $69,$6A
.byte $73,$74
.byte $7D,$7E

GfxSmallFamily03_Sad:
.byte $02,$04
.byte $61,$62
.byte $6B,$6C
.byte $75,$76
.byte $7F,$80

GfxSmallFamily04_Sad:
.byte $02,$04
.byte $63,$64
.byte $6D,$6E
.byte $77,$78
.byte $81,$82

GfxSmallFamily00:
.byte $02,$04
.byte $5B,$5C
.byte $8B,$8C
.byte $9D,$70
.byte $79,$7A

GfxSmallFamily01:
.byte $02,$04
.byte $5D,$5E
.byte $8D,$8E
.byte $71,$72
.byte $7B,$7C

GfxSmallFamily02:
.byte $02,$04
.byte $5F,$60
.byte $8F,$90
.byte $9E,$9F
.byte $7D,$7E

GfxSmallFamily03:
.byte $02,$04
.byte $61,$62
.byte $91,$92
.byte $75,$76
.byte $7F,$80

GfxSmallFamily04:
.byte $02,$04
.byte $63,$64
.byte $93,$94
.byte $77,$78
.byte $81,$82

GfxSmallFamily05_Sad:
.byte $02,$04
.byte $83,$84
.byte $95,$96
.byte $A0,$A1
.byte $AA,$AB

GfxSmallFamily06_Sad:
.byte $02,$04
.byte $85,$86
.byte $97,$98
.byte $A2,$A3
.byte $AC,$AD

GfxSmallFamily07_Sad:
.byte $02,$04
.byte $87,$88
.byte $99,$9A
.byte $A4,$A5
.byte $AE,$AF

GfxSmallFamily08_Sad:
.byte $02,$04
.byte $00,$00
.byte $00,$00
.byte $A6,$A7
.byte $B0,$B1

GfxSmallFamily09_Sad:
.byte $02,$04
.byte $89,$8A
.byte $9B,$9C
.byte $A8,$A9
.byte $B2,$B3

GfxSmallFamily10_Sad:
.byte $02,$04
.byte $00,$00
.byte $B6,$B7
.byte $C2,$C3
.byte $37,$CD

GfxSmallFamily11_Sad:
.byte $02,$04
.byte $00,$00
.byte $B8,$B9
.byte $C4,$C5
.byte $CE,$CF

GfxSmallFamily12_Sad:
.byte $02,$04
.byte $00,$00
.byte $BA,$BB
.byte $C6,$C7
.byte $D0,$D1

GfxSmallFamily13_Sad:
.byte $02,$04
.byte $85,$86
.byte $BC,$BD
.byte $C8,$C9
.byte $D2,$D3

GfxSmallFamily14_Sad:
.byte $02,$04
.byte $B4,$B5
.byte $BE,$BF
.byte $CA,$CB
.byte $D4,$D5

GfxSmallFamily05:
.byte $02,$04
.byte $83,$84
.byte $95,$96
.byte $A0,$A1
.byte $AA,$AB

GfxSmallFamily06:
.byte $02,$04
.byte $85,$86
.byte $97,$98
.byte $A2,$A3
.byte $AC,$AD

GfxSmallFamily07:
.byte $02,$04
.byte $87,$88
.byte $99,$9A
.byte $CC,$A5
.byte $AE,$AF

GfxSmallFamily08:
.byte $02,$04
.byte $00,$00
.byte $00,$00
.byte $A6,$A7
.byte $D6,$D7

GfxSmallFamily09:
.byte $02,$04
.byte $89,$8A
.byte $C0,$C1
.byte $A8,$A9
.byte $B2,$B3

GfxSmallFamily10:
.byte $02,$04
.byte $00,$00
.byte $B6,$B7
.byte $C2,$DA
.byte $37,$CD

GfxSmallFamily11:
.byte $02,$04
.byte $00,$00
.byte $B8,$B9
.byte $DB,$DC
.byte $CE,$CF

GfxSmallFamily12:
.byte $02,$04
.byte $00,$00
.byte $BA,$BB
.byte $DD,$DE
.byte $D0,$D1

GfxSmallFamily13:
.byte $02,$04
.byte $85,$86
.byte $BC,$BD
.byte $DF,$E0
.byte $D2,$D3

GfxSmallFamily14:
.byte $02,$04
.byte $B4,$B5
.byte $D8,$D9
.byte $CA,$CB
.byte $D4,$D5

GfxUnknown105:
.byte $08,$02
.byte $00,$00,$00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown106:
.byte $08,$02
.byte $01,$02,$03,$04,$05,$06,$07,$08
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown107:
.byte $08,$02
.byte $09,$0A,$0B,$0C,$05,$06,$07,$08
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown108:
.byte $08,$02
.byte $0D,$0E,$0F,$10,$05,$06,$07,$08
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown109:
.byte $08,$02
.byte $11,$12,$13,$04,$05,$06,$07,$08
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown110:
.byte $08,$02
.byte $14,$15,$16,$17,$05,$06,$07,$08
.byte $00,$00,$00,$00,$00,$00,$00,$00

GfxUnknown111:
.byte $08,$08
.byte $00,$00,$00,$18,$19,$00,$00,$00
.byte $00,$00,$00,$1B,$1C,$00,$00,$00
.byte $00,$00,$1F,$20,$21,$22,$00,$00
.byte $00,$00,$27,$28,$29,$2A,$00,$00
.byte $00,$00,$2C,$2D,$2E,$2F,$00,$00
.byte $00,$00,$00,$30,$31,$00,$00,$00
.byte $00,$00,$00,$32,$32,$00,$00,$00
.byte $00,$00,$00,$33,$33,$00,$00,$00

GfxUnknown112:
.byte $08,$08
.byte $00,$00,$00,$18,$19,$00,$00,$00
.byte $00,$1D,$00,$1B,$1C,$00,$00,$00
.byte $23,$24,$25,$20,$21,$22,$00,$00
.byte $00,$00,$2B,$28,$29,$2A,$00,$00
.byte $00,$00,$00,$2E,$2E,$2F,$00,$00
.byte $00,$00,$00,$30,$31,$00,$00,$00
.byte $00,$00,$00,$32,$32,$00,$00,$00
.byte $00,$00,$00,$33,$33,$00,$00,$00

GfxUnknown113:
.byte $08,$08
.byte $00,$00,$1A,$18,$19,$00,$00,$00
.byte $00,$00,$1E,$1B,$1C,$00,$00,$00
.byte $00,$00,$26,$20,$21,$22,$00,$00
.byte $00,$00,$00,$28,$29,$2A,$00,$00
.byte $00,$00,$00,$2E,$2E,$2F,$00,$00
.byte $00,$00,$00,$30,$31,$00,$00,$00
.byte $00,$00,$00,$32,$32,$00,$00,$00
.byte $00,$00,$00,$33,$33,$00,$00,$00

GfxUnknown114:
.byte $08,$08
.byte $00,$00,$00,$34,$35,$00,$00,$00
.byte $00,$00,$00,$36,$37,$00,$00,$00
.byte $00,$00,$00,$38,$39,$3A,$00,$00
.byte $00,$00,$00,$3B,$3C,$2F,$00,$00
.byte $00,$00,$00,$3B,$3D,$3E,$00,$00
.byte $00,$00,$00,$41,$42,$00,$00,$00
.byte $00,$00,$00,$47,$48,$00,$00,$00
.byte $00,$00,$00,$4E,$4F,$50,$00,$00

GfxUnknown115:
.byte $08,$08
.byte $00,$00,$00,$34,$35,$00,$00,$00
.byte $00,$00,$00,$36,$37,$00,$00,$00
.byte $00,$00,$00,$38,$39,$3A,$00,$00
.byte $00,$00,$00,$3B,$3C,$2F,$00,$00
.byte $00,$00,$00,$3B,$3D,$3E,$00,$00
.byte $00,$00,$00,$43,$44,$00,$00,$00
.byte $00,$00,$00,$49,$4A,$00,$00,$00
.byte $00,$00,$00,$51,$52,$00,$00,$00

GfxUnknown116:
.byte $08,$08
.byte $00,$00,$00,$34,$35,$00,$00,$00
.byte $00,$00,$00,$36,$37,$00,$00,$00
.byte $00,$00,$00,$38,$39,$3A,$00,$00
.byte $00,$00,$00,$3B,$3C,$2F,$00,$00
.byte $00,$00,$00,$3F,$40,$00,$00,$00
.byte $00,$00,$00,$45,$46,$00,$00,$00
.byte $00,$00,$00,$4B,$4C,$00,$00,$00
.byte $00,$00,$00,$53,$54,$55,$00,$00

GfxUnknown117:
.byte $08,$08
.byte $00,$00,$00,$34,$35,$00,$00,$00
.byte $00,$00,$00,$36,$37,$00,$00,$00
.byte $00,$00,$00,$38,$39,$3A,$00,$00
.byte $00,$00,$00,$3B,$3C,$2F,$00,$00
.byte $00,$00,$00,$3F,$40,$00,$00,$00
.byte $00,$00,$00,$43,$44,$00,$00,$00
.byte $00,$00,$00,$4D,$4A,$00,$00,$00
.byte $00,$00,$00,$56,$57,$00,$00,$00

GfxUnknown118:
.byte $06,$0C
.byte $00,$00,$58,$59,$00,$00
.byte $00,$00,$5A,$5B,$00,$00
.byte $00,$00,$5C,$5D,$00,$00
.byte $00,$5E,$5F,$60,$61,$00
.byte $00,$41,$63,$64,$65,$00
.byte $00,$41,$2E,$66,$67,$00
.byte $00,$69,$2E,$2E,$6A,$00
.byte $00,$6C,$6D,$2E,$00,$00
.byte $00,$00,$3B,$3B,$00,$00
.byte $00,$00,$6E,$6F,$00,$00
.byte $00,$00,$70,$71,$00,$00
.byte $00,$72,$73,$74,$75,$00

GfxUnknown119:
.byte $06,$0C
.byte $00,$00,$58,$59,$00,$00
.byte $00,$00,$5A,$5B,$00,$00
.byte $00,$00,$5C,$5D,$00,$00
.byte $00,$62,$5F,$60,$61,$00
.byte $00,$41,$63,$64,$65,$00
.byte $00,$3B,$68,$66,$67,$00
.byte $00,$6B,$2E,$2E,$6A,$00
.byte $00,$00,$6D,$2E,$00,$00
.byte $00,$00,$3B,$3B,$00,$00
.byte $00,$00,$6E,$6F,$00,$00
.byte $00,$00,$70,$71,$00,$00
.byte $00,$72,$73,$74,$75,$00

GfxUnknown120:
.byte $06,$0C
.byte $00,$00,$76,$77,$00,$00
.byte $00,$00,$3B,$78,$00,$00
.byte $00,$00,$79,$7A,$00,$00
.byte $00,$00,$7B,$7C,$7D,$7E
.byte $00,$00,$2E,$7F,$80,$81
.byte $00,$00,$2E,$7F,$00,$00
.byte $00,$00,$2E,$83,$84,$00
.byte $00,$00,$3B,$65,$00,$00
.byte $00,$00,$87,$88,$00,$00
.byte $00,$00,$8D,$8E,$00,$00
.byte $00,$00,$99,$9A,$00,$00
.byte $00,$00,$A4,$A5,$00,$00

GfxUnknown121:
.byte $06,$0C
.byte $00,$00,$76,$77,$00,$00
.byte $00,$00,$3B,$78,$00,$00
.byte $00,$00,$79,$7A,$00,$00
.byte $00,$00,$7B,$7C,$7D,$7E
.byte $00,$00,$2E,$7F,$80,$82
.byte $00,$00,$2E,$7F,$00,$00
.byte $00,$00,$2E,$85,$00,$00
.byte $00,$00,$3B,$86,$00,$00
.byte $00,$89,$8A,$8B,$00,$00
.byte $00,$8F,$90,$91,$00,$00
.byte $00,$9B,$9C,$9D,$9E,$00
.byte $00,$A6,$A7,$A8,$A9,$00

GfxUnknown122:
.byte $06,$0C
.byte $00,$00,$76,$77,$00,$00
.byte $00,$00,$3B,$78,$00,$00
.byte $00,$00,$79,$7A,$00,$00
.byte $00,$5E,$2E,$7C,$00,$00
.byte $00,$41,$2E,$7F,$7D,$7E
.byte $00,$41,$2E,$7F,$80,$82
.byte $00,$69,$2E,$85,$00,$00
.byte $00,$6C,$6D,$6A,$00,$00
.byte $00,$00,$6D,$6A,$00,$00
.byte $00,$92,$93,$94,$00,$00
.byte $00,$9F,$2E,$00,$00,$00
.byte $00,$00,$AA,$AB,$00,$00

GfxUnknown123:
.byte $06,$0C
.byte $00,$00,$76,$77,$00,$00
.byte $00,$00,$3B,$78,$00,$00
.byte $00,$00,$79,$7A,$00,$00
.byte $00,$00,$7B,$7C,$7D,$7E
.byte $00,$00,$2E,$7F,$80,$82
.byte $00,$00,$2E,$7F,$00,$00
.byte $00,$00,$2E,$85,$00,$00
.byte $00,$00,$3B,$86,$00,$00
.byte $00,$00,$6D,$2E,$8C,$00
.byte $00,$95,$96,$97,$98,$00
.byte $00,$A0,$A1,$A2,$A3,$00
.byte $00,$AC,$AD,$AE,$AF,$B0

GfxUnknown124:
.byte $06,$0C
.byte $00,$00,$76,$77,$00,$00
.byte $00,$00,$3B,$78,$00,$00
.byte $00,$00,$79,$7A,$00,$00
.byte $00,$00,$7B,$7C,$7D,$7E
.byte $00,$00,$2E,$7F,$80,$82
.byte $00,$00,$2E,$2E,$83,$84
.byte $00,$00,$2E,$85,$00,$00
.byte $00,$00,$3B,$65,$00,$00
.byte $00,$00,$87,$6A,$00,$00
.byte $00,$00,$45,$94,$00,$00
.byte $00,$00,$C3,$C4,$00,$00
.byte $00,$00,$AA,$C6,$00,$00

GfxUnknown125:
.byte $06,$0C
.byte $00,$00,$58,$59,$00,$00
.byte $00,$00,$B1,$B2,$00,$00
.byte $00,$00,$B5,$B6,$00,$00
.byte $00,$00,$7B,$7C,$00,$00
.byte $00,$00,$2E,$7F,$B9,$7E
.byte $00,$00,$2E,$2E,$BA,$BB
.byte $00,$00,$2E,$2E,$BE,$BF
.byte $00,$00,$3B,$65,$00,$00
.byte $00,$00,$87,$6A,$00,$00
.byte $00,$00,$45,$94,$00,$00
.byte $00,$00,$C3,$C4,$00,$00
.byte $00,$00,$AA,$C6,$00,$00

GfxUnknown126:
.byte $06,$0C
.byte $00,$00,$58,$59,$00,$00
.byte $00,$00,$B3,$B4,$00,$00
.byte $00,$00,$B7,$B8,$00,$00
.byte $00,$62,$2E,$2E,$61,$00
.byte $00,$41,$2E,$2E,$65,$00
.byte $BC,$3B,$2E,$2E,$BD,$00
.byte $C0,$C1,$2E,$2E,$6A,$00
.byte $C2,$00,$2E,$2E,$00,$00
.byte $00,$00,$3B,$3B,$00,$00
.byte $00,$00,$6E,$6F,$00,$00
.byte $00,$00,$70,$C5,$00,$00
.byte $00,$C7,$C8,$C9,$CA,$00

GfxUnknown127:
.byte $06,$0C
.byte $00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$CB,$CC,$CD
.byte $00,$00,$00,$CE,$CF,$D0
.byte $00,$00,$D1,$D2,$D3,$D4
.byte $00,$00,$D5,$2E,$2E,$00
.byte $BC,$D6,$2E,$2E,$D7,$00
.byte $C0,$C1,$2E,$2E,$D8,$D9
.byte $C2,$00,$3B,$2E,$DA,$00
.byte $00,$00,$3B,$2E,$00,$00
.byte $00,$DB,$D7,$6F,$00,$00
.byte $00,$DC,$00,$DD,$00,$00
.byte $00,$DE,$00,$AA,$DF,$00

GfxUnknown128:
.byte $06,$04
.byte $00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00
.byte $00,$00,$00,$00,$00,$00

GfxUnknown129:
.byte $06,$04
.byte $00,$00,$00,$00,$00,$00
.byte $38,$34,$29,$41,$00,$00
.byte $2E,$29,$3B,$3C,$00,$00
.byte $35,$37,$36,$2D,$41,$00










.define Unknown1Ptrs \
LF3B2,LF3B2,LF3B2,LF3B2,LF3B2, \
LF3CC,LF3CC,LF3CC,LF3CC,LF3CC, \
LF3E6,LF3E6,LF3E6,LF3E6,LF3E6, \
LF400,LF400,LF400,LF400,LF400, \
LF41A,LF41A,LF41A,LF41A,LF41A, \
LF52E,LF52E,LF52E,LF52E,LF52E, \
LF548,LF548,LF548,LF548,LF548, \
LF562,LF562,LF562,LF562,LF562, \
LF57C,LF57C,LF57C,LF57C,LF57C, \
LF596,LF596,LF596,LF596,LF596, \
LF6AA,LF6AA,LF6AA,LF6AA,LF6AA, \
LF6C4,LF6C4,LF6C4,LF6C4,LF6C4, \
LF6DE,LF6DE,LF6DE,LF6DE,LF6DE, \
LF6F8,LF6F8,LF6F8,LF6F8,LF6F8, \
LF712,LF712,LF712,LF712,LF712, \
LF434,LF466,LF498,LF4CA,LF4FC, \
LF52E,LF52E,LF434,LF466,LF498, \
LF4CA,LF4FC,LF52E,LF52E,LF52E, \
LF52E,LF5B0,LF5E2,LF614,LF646, \
LF678,LF6AA,LF6AA,LF5B0,LF5E2, \
LF614,LF646,LF678,LF6AA,LF6AA, \
LF6AA,LF6AA,LF72C,LF75E,LF790, \
LF7C2,LF7F4,LF826,LF826,LF72C, \
LF75E,LF790,LF7C2,LF7F4,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF826, \
LF826,LF826,LF826,LF826,LF838, \
LF838,LF838,LF838,LF838,LF838, \
LF838,LF838,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF88A, \
LF88A,LF88A,LF88A,LF88A,LF8D4



D_3_7218: .lobytes Unknown1Ptrs
D_3_72E5: .hibytes Unknown1Ptrs


LF3B2:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF3CC:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02

LF3E6:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF400:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03

LF41A:
.byte $00,$00
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02

LF434:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF466:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF498:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF4CA:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF4FC:
.byte $00,$00
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF52E:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03

LF548:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF562:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF57C:
.byte $00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02

LF596:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF5B0:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF5E2:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF614:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF646:
.byte $00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF678:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF6AA:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00


LF6C4:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF6DE:
.byte $00,$00
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02

LF6F8:
.byte $00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03

LF712:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF72C:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF75E:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF790:
.byte $00,$00
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$02,$02
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF7C2:
.byte $00,$00
.byte $02,$02,$02,$02
.byte $02,$02,$02,$02
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$03,$03
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF7F4:
.byte $00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$01,$01
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF826:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00

LF838:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF88A:
.byte $00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$00,$00
.byte $00,$00,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01
.byte $01,$01,$01,$01

LF8D4:
.byte $00,$00
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03
.byte $03,$03,$03,$03




BeginAnswerValidation:
  sta AnswerValidationFailValue                   ; initialize fail value
  ldx #$0                                         ;
  stx ValidationScoreboardText                    ; initialize scoreboard text
  stx a:AnswerValidationStage                     ; set strict mode validation
  stx $07D9                                       ; clear something - todo - unused?
  dex                                             ; set X to FF
  stx AnswerValidationResult                      ; initialize to 'fail' result
  lda #$80                                        ;   7908 F908 C A9 80           F:008943
  STA FinalValidatorBestResult                                      ;   790A F90A C 8D D1 07        F:008943
  lda #12                                         ; start at last possible answer (on the board of 12 answers)
  sta ValidationCurrentAnswer                     ;
  ldx UserAnswerInputLength                       ; check last answer character
  lda UserAnswerInputLength,x                     ;
  cmp #' '                                        ; is it space?
  bne :+                                          ; no - continue ahead
  lda #$0                                         ; yes - clear the trailing space
  sta UserAnswerInputLength,x                     ;
: rts                                             ; done!

ValidateAnswer:
  @TempPtr = $0E
  ldx a:AnswerValidationStage                     ; check current validation stage
  lda AnswerValidatorProceduresLo,x               ; load its address
  sta @TempPtr                                    ;
  lda AnswerValidatorProceduresHi,x               ;
  sta @TempPtr+1                                  ;
  jmp (@TempPtr)                                  ; and run the validator

.define ValidationProcedures \
  AnswerValidatorStrictStart, AnswerValidatorLooseStart, AnswerValidatorFinalStart, \
  AnswerValidatorStrict, AnswerValidatorLoose, AnswerValidatorFinal

AnswerValidatorProceduresLo: .lobytes ValidationProcedures
AnswerValidatorProceduresHi: .hibytes ValidationProcedures

AnswerValidatorStrictStart:
  dec ValidationCurrentAnswer                     ; move to next answer
  bmi ValidationStageFailed                       ; if we've already checked all answers, bail
  ldx ValidationCurrentAnswer                     ;
  lda QuestionAnswerOffsets,x                     ; find the memory offset to the current answer
  cmp #$FF                                        ; if it's FF this is not an active answer.
  beq ValidationContinue                          ; if so skip this frame and continue to the next answer
  jsr PrepareAnswerValidation                     ; otherwise load in the answer text
  lda #AnswerValidator_Strict                     ; and set the validation stage to continue validation
  sta a:AnswerValidationStage                     ;
AnswerValidatorStrict:
  jsr CreateAnswerVariants                        ; start by creating all answer variants for this answer
  bcs ValidatorExit2                              ; one is created per frame, so delay until next frame after each successful variant
  lda #AnswerValidator_StrictStart                ; set answer validator back to start
  sta a:AnswerValidationStage                     ;
  jsr ValidateAnswerStrict                        ; and run the actual validator against user input
  bmi ValidationContinue                          ; if negative, we did not match any variant of the answer, so continue 
  jsr ValidationSuccessful                        ; handle correct answer
FinalValidationStageFailed: 
  ldx AnswerValidationResult                      ; load our validation result
  bpl :+                                          ; and use it if it is set to a positive value
  ldx AnswerValidationFailValue                   ; otherwise load #$FF
: clc                                             ; validation stage has finished.
  rts                                             ; exit!

ValidationStageFailed:
  inc a:AnswerValidationStage                     ; advance to the next stage of validation, allowing more typos
  lda #12                                         ; set the validation back to the last answer
  sta ValidationCurrentAnswer                     ;
ValidationContinue:
  sec                                             ; mark validation as unfinished
ValidatorExit2:
  rts                                             ; and exit!

AnswerValidatorLooseStart:
  dec ValidationCurrentAnswer                     ; move to next answer
  bmi LooseValidationStageFailed                  ; if we've already checked all answers, bail
  ldx ValidationCurrentAnswer                     ;
  lda QuestionAnswerOffsets,x                     ; find the memory offset to the current answer
  cmp #$FF                                        ; if it's FF this is not an active answer.
  beq LooseValidationContinue                     ; if so skip this frame and continue to the next answer
  jsr PrepareAnswerValidation                     ; otherwise load in the answer text
  lda #AnswerValidator_Loose                      ; and set the validation stage to continue validation
  sta a:AnswerValidationStage                     ;
AnswerValidatorLoose:
  jsr CreateAnswerVariants                        ; start by creating all answer variants for this answer
  bcs ValidatorExit2                              ; one is created per frame, so delay until next frame after each successful variant
  lda #AnswerValidator_LooseStart                 ; set answer validator back to start
  sta a:AnswerValidationStage                     ;
  lda AnswerScratchSpace                          ; check first answer character
  cmp #'0'                                        ; compare it to 0
  bcc @Validate                                   ; if lower than 0, run validation
  cmp #'9'+1                                      ; compare it to 9
  bcc LooseValidationContinue                     ; if <= 9, this is a numeric answer, so it can't do loose validation, skip
@Validate:
  jsr ValidateAnswerLoose                         ; run answer validator
  bmi LooseValidationContinue                     ; if negative, we did not match any variant of the answer, so continue
  jsr ValidationSuccessful                        ; handle correct answer
LooseValidationContinue:
  sec                                             ; set carry to indicate that we're still running
  rts                                             ; and exit

LooseValidationStageFailed:
  ldx AnswerValidationResult                      ; get matched answer value
  bmi ValidationStageFailed                       ; if we did not match, run shared validation stage failure to go to next stage
  clc                                             ; clear carry to indicate that we have finished
  rts                                             ; and exit

AnswerValidatorFinalStart:
  dec ValidationCurrentAnswer                     ; move to next answer
  bmi FinalValidationStageFailed                  ; if we've already checked all answers, bail
  ldx ValidationCurrentAnswer                     ;
  lda QuestionAnswerOffsets,x                     ; find the memory offset to the current answer
  cmp #$FF                                        ; if it's FF this is not an active answer.
  beq FinalValidationContinue                     ; if so skip this frame and continue to the next answer
  jsr PrepareAnswerValidation                     ; otherwise load in the answer text
  lda #AnswerValidator_Final                      ; and set the validation stage to continue validation
  sta a:AnswerValidationStage                     ;
AnswerValidatorFinal:
  jsr CreateAnswerVariants                        ; start by creating all answer variants for this answer
  bcs ValidatorExit2                              ; one is created per frame, so delay until next frame after each successful variant
  lda #AnswerValidator_FinalStart                 ; set answer validator back to start
  sta a:AnswerValidationStage                     ;
  lda AnswerScratchSpace                          ; check first answer character
  cmp #'0'                                        ; compare it to 0
  bcc @Validate                                   ; if lower than 0, run validation
  cmp #'9'+1                                      ; compare it to 9
  bcc FinalValidationContinue                     ; if <= 9, this is a numeric answer, so it can't do loose validation, skip
@Validate:
  jsr ValidateAnswerFinal                         ; run answer validator
  bmi FinalValidationContinue                     ; if negative, we did not match any variant of the answer, so continue
  jsr ValidationSuccessful                        ; handle correct answer
FinalValidationContinue:
  sec                                             ; set carry to indicate that we're still running
  rts                                             ; and exit

PrepareAnswerValidation:
  ldy QuestionAnswerOffsets,x                     ; get the location of the current answer
  ldx #$0                                         ;
: iny                                             ;
  inx                                             ;
  lda QuestionAnswerData-1,y                      ; and copy the answer over to temp space
  sta a:QuestionAnswerCopy-1,x                    ;
  bne :-                                          ;
  jsr CopyAnswerToScratch                         ; copy the current answer to scratch space
  ldy #MaxValidationVariants-1                    ; start clearing each variant state
@ClearVariantStates:
  lda #$0                                         ;
  sta AnswerVariantState,y                        ;
  lda #$FF                                        ;
  sta AnswerVariantOffset,y                       ;
  dey                                             ; step to next variant
  bne @ClearVariantStates                         ; loop until 0
  lda #$80                                        ; set first variant as enabled (there should always be 1)
  sta AnswerVariantState                          ;
  lda #$0                                         ; and it will start at the beginning of the scratch space
  sta AnswerVariantOffset                         ;
  jmp PrepareAnswerVariantStates                  ; then we set up the basic variant states

CreateAnswerVariants:
  lda #MaxValidationVariants-1                    ; set selected variant to max value
  sta ValidationCurrentVariant                    ;
@NextVariant:
  ldx ValidationCurrentVariant                    ; get the current selected variant
  lda AnswerVariantState,x                        ; and check its offset
  beq @CheckNext                                  ; if null - check next
  and #$40                                        ; check if bit 6 is set
  bne @CheckNext                                  ; if so this variant has already been set up, skip ahead
  jsr @CreateAnswerVariant                        ; otherwise we need to set up the variant
  sec                                             ; set carry to mark that a new variant was created
  rts                                             ; and exit
@CheckNext:
  dec ValidationCurrentVariant                    ; step to the next variant
  bpl @NextVariant                                ; and continue checking if we have not reached the end
  clc                                             ; clear carry to mark that all variants are created
  rts                                             ; and exit.

@CreateAnswerVariant:
  txa                                             ; store entry state on stack
  pha                                             ;
  ldy AnswerVariantOffset,x                       ;
: lda AnswerScratchSpace,y                        ; check next character
  beq @FinishAnswerVariant                        ; skip to end if we've reached the last character
  iny                                             ; advance to next character
  cmp #'('                                        ; check if we reached the start of a group
  bne :-                                          ; if not - continue reading
@Continue:
  lda AnswerScratchSpace,y                        ; we're in a group! get next character
  cmp #')'                                        ; if this the end of the group?
  beq @EndGroup                                   ; yes - skip ahead to end of group
  stx CreateAnswerVariant_Index                   ; otherwise store away X
  tya                                             ; and store Y on stack
  pha                                             ;
  jsr PrepareAnswerVariantStates                  ; set up the variant states
  jsr GetVariantCount                             ; get the number of variants in use
  lda #$80                                        ; mark final variant
  sta AnswerVariantState,x                        ;
  lda ValidationScratchLength                     ; and set the its offset to the end of scratch
  sta AnswerVariantOffset,x                       ;
  tax                                             ; put end of scratch in X
  jsr ScratchSpaceAnswerSetup                     ; create the scratch space answer for this variant
  ldx CreateAnswerVariant_Index                   ; restore X
  pla                                             ; 
  tay                                             ; restore Y
  jsr SkipToNextCharacter                         ; skip ahead to next relevant character
  jmp @Continue                                   ; keep reading characters
@EndGroup:
  pla                                             ; restore X from stack
  tax                                             ;
  lda #$0                                         ; clear this variants state
  sta AnswerVariantState,x                        ;
  lda #$FF                                        ;
  sta AnswerVariantOffset,x                       ;
  jmp PrepareAnswerVariantStates                  ; and finally set up the variant states
@FinishAnswerVariant:
  pla                                             ; restore X from stack
  tax                                             ;
  lda #$40                                        ; and mark this variant as finished
  ora AnswerVariantState,x                        ;
  sta AnswerVariantState,x                        ;
  rts                                             ; and we are done!

GetVariantCount:
  ldx #$0                                         ; start at first variant
: lda AnswerVariantState,x                        ; check variant state
  beq @Done                                       ; exit if we've reached the end
  inx                                             ; otherwise advance to next
  cpx #MaxValidationVariants                      ; are we at the maximum allowed variants?
  bcc :-                                          ; if not - keep looping
@Done:
  rts                                             ; and finally we're done!

ScratchSpaceAnswerSetup:
  tya                                             ; put current index on stack
  pha                                             ;
  ldy CreateAnswerVariant_Index                   ; get offet to start on from CreateAnswerVariant
  lda AnswerVariantOffset,y                       ;
  tay                                             ; copy offset to y
: lda AnswerScratchSpace,y                        ; get character at offset
  cmp #'('                                        ; check if it's the start of a group
  beq @MoveNextGroup                              ; yes - copy the next group
  sta AnswerScratchSpace,x                        ; no - copy this character to next offset
  iny                                             ; advance to next character
  inx                                             ;
  jmp :-                                          ; and continue
@MoveNextGroup:
  @GroupCounter = $07D7
  lda #$0                                         ; clear temp value
  sta @GroupCounter                               ;
  pla                                             ; pull stored Y value off stack
  tay                                             ;
@ContinueReading:
  lda AnswerScratchSpace,y                        ; check next character
  cmp #'('                                        ; is it the start of a group?
  bne :+                                          ; no - skip ahead
  inc @GroupCounter                               ; yes - increase group counter
: cmp #')'                                        ; is it the end of a group?
  bne :+                                          ; no - skip ahead
  dec @GroupCounter                               ; yes - decrement group counter
  bmi @SkipAndMove                                ; move rest of answer
: cmp #'/'                                        ; is it the separator of a group?
  bne :+                                          ; no - skip ahead
  lda @GroupCounter                               ; are we in the starting group?
  beq @SkipAndMove                                ; yes - move the rest of the answer
: lda AnswerScratchSpace,y                        ; move this character to the next scratch position
  sta AnswerScratchSpace,x                        ;
  iny                                             ; advance to next character
  inx                                             ;
  jmp @ContinueReading                            ; and continue!
@SkipAndMove:
  jsr SkipInnerGroup                              ; start by skipping any inner groups, and advancing Y by 1
: iny                                             ; advance both Y and X
  inx                                             ;
  lda AnswerScratchSpace-1,y                      ; and copy each character one by one
  sta AnswerScratchSpace-1,x                      ;
  bne :-                                          ; until we reach the end of the answer
  rts                                             ; then we are done.

SkipInnerGroup:
  lda AnswerScratchSpace,y                        ; load character
  iny                                             ; and advance
  cmp #')'                                        ; check if we're closing the group
  beq @Done                                       ; if so - exit
  cmp #'('                                        ; check if we're opening a new group
  bne SkipInnerGroup                              ; if not, keep reading
  jsr SkipInnerGroup                              ; another level of nested groups, so, skip inner group
  jmp SkipInnerGroup                              ; then continue to skip this group!
@Done:
  rts                                             ; we are done!

SkipToNextCharacter:
  lda AnswerScratchSpace,y                        ; check the next character
  cmp #')'                                        ; is it a group closing character?
  beq @Done                                       ; if so - exit
  iny                                             ; otherwise advance by one
  cmp #'/'                                        ; check if we've reached a group split
  beq @Done                                       ; yes - exit
  cmp #'('                                        ; check if we're at a nested group
  bne SkipToNextCharacter                         ; no - keep reading
  jsr SkipInnerGroup                              ; yes - read until we've found the end of the inner group
  jmp SkipToNextCharacter                         ; and then continue reading
@Done:
  rts                                             ; we are done!

PrepareAnswerVariantStates:
  txa                                             ; store X and Y on the stack for now
  pha                                             ;
  tya                                             ;
  pha                                             ;
@RestartLoop:
  ldx #$0                                         ; clear X
@CheckVariantOuter:
  lda AnswerVariantState,x                        ; check the state of this variant
  bne @AdvanceToNextVariant0                      ; if this variant is already set, skip to next
  txa                                             ; otherwise state is 0, copy X over to Y
  tay                                             ;
: lda AnswerVariantState+1,y                      ; copy the next variant down 1 to remove this empty variant
  sta AnswerVariantState,y                        ;
  lda AnswerVariantOffset+1,y                     ;
  sta AnswerVariantOffset,y                       ;
  iny                                             ; then advance to next variant
  cpy #MaxValidationVariants-1                    ; have we reached the max variant number?
  bcc :-                                          ; no - keep looping
  lda #$0                                         ; yes - clear the final variants state
  sta AnswerVariantState,y                        ;
  lda #$FF                                        ;
  sta AnswerVariantOffset,y                       ;
@AdvanceToNextVariant0:
  inx                                             ; advance outer iterator
  cpx #MaxValidationVariants-1                    ;
  bcc @CheckVariantOuter                          ; loop until we've checked all variants
  ldx #$0                                         ; then start from first vartiant again
@CheckVariant:
  lda AnswerVariantState,x                        ; get current state of variant
  and #$80                                        ; check if high is set
  beq @AdvanceToNextVariant1                      ; if not, skip ahead to the next variant
  lda AnswerVariantOffset,x                       ; compare offset of this variant to next variant
  cmp AnswerVariantOffset+1,x                     ;
  bcc @AdvanceToNextVariant1                      ; skip ahead if we don't need to flip these variants
  beq @AdvanceToNextVariant1                      ;
  pha                                             ; otherwise store current variant offset on stack
  lda AnswerVariantState,x                        ; and get current variant state
  pha                                             ; store variant state on stack
  lda AnswerVariantOffset+1,x                     ; overwrite current variant with next variant
  sta AnswerVariantOffset,x                       ;
  lda AnswerVariantState+1,x                      ;
  sta AnswerVariantState,x                        ;
  pla                                             ; and replace next variant with stored stack values
  sta AnswerVariantState+1,x                      ;
  pla                                             ;
  sta AnswerVariantOffset+1,x                     ;
  jmp @RestartLoop                                ; re-run the entire loop with new sort order
@AdvanceToNextVariant1:
  inx                                             ; advance index
  cpx #MaxValidationVariants-1                    ; check if we've reached the end of the variants list
  bcc @CheckVariant                               ; if not, keep looping
  ldx #$0                                         ; otherwise reset to the first variant
  stx ValidationCurrentVariant                    ; and update the current variant index
@Continue:
  ldy ValidationCurrentVariant                    ; get current variant index
  lda AnswerVariantState,y                        ; and get the state of the variant
  beq @Next                                       ; if unused, skip ahead
  lda AnswerVariantOffset,y                       ; get offset to current index
  pha                                             ; store it on stack
  txa                                             ; copy current X value to A
  sta AnswerVariantOffset,y                       ; and replace the variant offset at Y with X
  pla                                             ; then restore Y from the stack
  tay                                             ;
: inx                                             ; advance both Y and X
  iny                                             ;
  lda AnswerScratchSpace-1,y                      ; and copy the scratch answer characters from Y to X
  sta AnswerScratchSpace-1,x                      ;
  bne :-                                          ; loop until finished
@Next:
  inc ValidationCurrentVariant                    ; advance to next variant
  lda ValidationCurrentVariant                    ;
  cmp #AnswerMaxChars+1                           ; have we reached the end of the variants list?
  bne @Continue                                   ; no - keep looping
  stx ValidationScratchLength                     ; looping finished, store the scratch space length
  lda #$FF                                        ; and mark the end of the scratch space
  sta AnswerScratchSpace,x                        ;
  pla                                             ; then restore the callers state
  tay                                             ;
  pla                                             ;
  tax                                             ;
  rts                                             ; and we are done!

ValidateAnswerStrict:
  ldx #MaxValidationVariants                      ; set selected variant to maximum possible
  stx ValidationCurrentVariant                    ;
@CheckVariant:
  lda AnswerVariantState,x                        ; check offset of the variants.. offset.
  beq @CheckNextVariant                           ; if zero, this variant is not used, skip to next
  ldy AnswerVariantOffset,x                       ; then get first character offset in scratch
  ldx #$0                                         ; and clear checking index of user answer
: lda AnswerScratchSpace,y                        ; compare scratch character against user character
  cmp UserAnswerInput,x                           ;
  bne @CheckNextVariant                           ; if they do not match, we fail the check
  inx                                             ; otherwise advance to next character
  iny                                             ;
  cmp #$0                                         ; check if scratch character was null
  bne :-                                          ; if not, continue validating
  ldy ValidationCurrentAnswer                     ; if it is we passed the test! set Y and X to the correct answer + variant
  ldx ValidationCurrentVariant                    ;
  clc                                             ; clear carry to indicate success
  rts                                             ; and exit
@CheckNextVariant:
  dec ValidationCurrentVariant                    ; step to the next answer variant
  ldx ValidationCurrentVariant                    ; fetch the variant index
  bpl @CheckVariant                               ; and loop back around until we've reached the end
  sec                                             ; if we made it here, no variant test passed. set carry to indicate failure.
  rts                                             ; and exit

ValidateAnswerLoose:
  ldx #$0                                         ; start at first character
: inx                                             ; advance character
  lda UserAnswerInput-1,x                         ; and load current user answer character
  sta a:ValidationAnswerCopy-1,x                  ; copy it over to our validation test
  bne :-                                          ; keep looping until full answer is copied
  jsr RunLooseValidationSwaps                     ; run a bunch of string wrangling on the user answer
  ldx #$0                                         ; clear X
: inx                                             ; advance to next character
  lda a:QuestionAnswerCopy-1,x                    ; copy the wrangled answer over to another memory space
  sta a:ValidationScratch2-1,x                    ;
  bne :-                                          ; loop until copied
  ldx #MaxValidationVariants-1                    ; set x to maximum variant index
  stx ValidationCurrentVariant                    ;
@Continue:
  lda AnswerVariantState,x                        ; check current variant state
  beq @NextVariant                                ; if not set - skip to next variant
  ldy AnswerVariantOffset,x                       ; get offset to variant text
  ldx #$0                                         ; start at first character
: inx                                             ; advance 1 character
  iny                                             ;
  lda AnswerScratchSpace-1,y                      ; copy variant answer data to a temporary location
  sta a:ValidationAnswerCopy-1,x                  ;
  bne :-                                          ; loop until copied
  ldx #$0                                         ; start at first character for first 3 strict test
: lda UserAnswerInput,x                           ; get user answer character
  beq @NextVariant                                ; go to next variant if we've reached the end
  cmp a:ValidationAnswerCopy,x                    ; compare against variant answer text
  bne @NextVariant                                ; skip to next variant if we don't match
  inx                                             ; advance to next character
  cpx #$3                                         ; have we checked the first 3 strict characters?
  bne :-                                          ; no - keep looping
  jsr RunLooseValidationSwaps                     ; run the swaps again
  ldx #$0                                         ;
: lda a:QuestionAnswerCopy,x                      ; check answer against copy
  cmp a:ValidationScratch2,x                         ;
  bne @NextVariant                                ; if they don't match, skip to next variant
  inx                                             ; otherwise advance to next character
  cmp #$0                                         ; are we at the end of the answer?
  bne :-                                          ; if not - keep looping until end
  ldx ValidationCurrentVariant                    ; otherwise we have a success! set the matched variant.
  sec                                             ; set carry to indicate completion
  rts                                             ; and exit!
@NextVariant:
  dec ValidationCurrentVariant                    ; advance to next variant
  ldx ValidationCurrentVariant                    ; load the variant
  bpl @Continue                                   ; loop until all variants have been tested
  sec                                             ; set carry to indicate completion, without success
  rts                                             ; and exit

ValidateAnswerFinal:
  lda #$FF                                        ; default to failed result
  sta FinalValidatorState                         ;
  ldx #MaxValidationVariants-1                    ; start on last possible variant
  stx ValidationCurrentVariant                    ; and store the current variant
@Continue:
  lda AnswerVariantState,x                        ; check the state of the variant
  beq @NextVariant                                ; skip to next variant if this one is unused
  ldx #$0                                         ; set X to first character
: inx                                             ; advance to next character
  lda UserAnswerInputLength,x                     ; and copy characters one by one
  sta a:ValidationScratch2-1,x                       ; into another memory space
  bne :-                                          ; loop until full answer is copied
  ldx ValidationCurrentVariant                    ; get current variant index
  ldy AnswerVariantOffset,x                       ; and get location in scratch memory for the answer text
  ldx #$0                                         ; then clear X to check first character
: inx                                             ; advance one character in X and Y
  iny                                             ;
  lda AnswerScratchSpace-1,y                      ; and copy variant answer from scratch to a temporary location
  sta a:QuestionAnswerCopy-1,x                    ;
  bne :-                                          ; loop until full answer is copied
  ldx #$0                                         ; start at first character for first 3 strict test
: lda UserAnswerInput,x                           ; get user answer character
  beq @NextVariant                                ; go to next variant if we've reached the end
  cmp a:QuestionAnswerCopy,x                      ; compare against variant answer text
  bne @NextVariant                                ; skip to next variant if we don't match
  inx                                             ; advance to next character
  cpx #$3                                         ; have we checked the first 3 strict characters?
  bne :-                                          ; no - keep looping
  jsr @RunSpellchecker                            ; run the final, last ditch spellcheck
  cmp FinalValidatorBestResult                    ; check against our current closest match
  bcc @NextVariant                                ; skip to next variant if this match is worse
  sta FinalValidatorBestResult                    ; otherwise update best match value
  lda ValidationCurrentVariant                    ; and set this variant as the current closest match
  sta FinalValidatorState                         ;
@NextVariant:
  dec ValidationCurrentVariant                    ; advance to next variant
  ldx ValidationCurrentVariant                    ; load the variant
  bpl @Continue                                   ; loop until all variants have been tested
  ldx FinalValidatorBestResult                    ; get best match result
  bpl @FailResult                                 ; skip ahead if validation failed
  ldx FinalValidatorState                         ; otherwise return the best variant
  sec                                             ;
  rts                                             ; and we are done!
@FailResult:
  ldx #$80                                        ; we did not succeed in matching the answer, mark failure
  sec                                             ;
  rts                                             ; and exit

@RunSpellchecker:
  lda #$7A                                        ; set initial score value
  sta FinalSpellcheckScore                        ;
  ldx #$0                                         ; clear starting state
  ldy #$0                                         ;
  beq @CheckNextCharacter                         ; unconditional branch ahead to check first character
@SkipAsterisk:
  lda a:QuestionAnswerCopy,y                      ; get next character from answer
  beq @SkipUserAsterisk                           ; then skip characters in the users answer
  ora #$80                                        ; set high bit of character
  sta a:QuestionAnswerCopy,y                      ;
  iny                                             ; advance to next character
  cmp #$80 | ' '                                  ; check for space character
  bne @SkipAsterisk                               ; if not space, check next character
@SkipUserAsterisk:
  lda a:ValidationScratch2,x                      ; get next user answer character
  beq @CheckNextCharacter                         ; exit loop at end of answer
  ora #$80                                        ; set high bit of character
  sta a:ValidationScratch2,x                      ;
  inx                                             ; advance to next character
  cmp #$80 | ' '                                  ; check for space character
  bne @SkipUserAsterisk                           ; if not space, check next character
@CheckNextCharacter:
  lda a:ValidationScratch2,x                      ; check user answer character
  beq @CalculateScoreResult                       ; skip ahead if we're at the end of the answer
  lda a:QuestionAnswerCopy,y                      ; check variant answer character
  beq @CalculateScoreResult                       ; skip ahead if we're at the end of the answer
  cmp #'*'                                        ; is the answer character an asterisk (anything is allowed after)
  beq @SkipAsterisk                               ; yes - skip ahead until the next space
  lda #' '                                        ; get space character
  cmp a:ValidationScratch2,x                      ; is the user answer character a space?
  beq :+                                          ; if so - skip ahead
  cmp a:QuestionAnswerCopy,y                      ; otherwise, is it the same as the question character?
  bne @TestCharacter                              ; no - that's not good, branch ahead
: lda a:ValidationScratch2,x                      ; get the user answer character
  beq @CalculateScoreResult                       ; skip ahead if we've reached the end of both answers
  inx                                             ; otherwise advance 1 character
  cmp #' '                                        ; is it a space character?
  bne :-                                          ; no - keep looping until we reach a non-space
: lda a:QuestionAnswerCopy,y                      ; load variant answer character
  beq @CalculateScoreResult                       ; skip ahead if we've reached the end of the answer
  iny                                             ; otherwise advance to next character
  cmp #' '                                        ; is it a space character?
  bne :-                                          ; no - keep looping until we reach a non-space
  beq @CheckNextCharacter                         ; otherwise keep checking characters
@TestCharacter:
  lda a:ValidationScratch2,x                      ; get user answer character again
  cmp a:QuestionAnswerCopy,y                      ; compare against variant answer character
  bne :+                                          ; branch ahead if they do not match
  ora #$80                                        ; otherwise set high bit
  sta a:QuestionAnswerCopy,y                      ; and update both answer characters
  sta a:ValidationScratch2,x                      ;
  clc                                             ;
  lda FinalSpellcheckScore                        ; otherwise increment score by 5
  adc #$5                                         ;
  bcs :+                                          ; avoid overflow
  sta FinalSpellcheckScore                        ; and update the score
: inx                                             ; advance variant answer index
  iny                                             ; advance user answer index
  jmp @CheckNextCharacter                         ; and check next character
@CalculateScoreResult:
  ldx #$0                                         ; start scoring at first character
@CalcNextUserAnswer:
  lda a:ValidationScratch2,x                      ; get the user answer character
  bmi :+                                          ; if high bit is set, this letter was correct, skip ahead
  beq @CheckVariantAnswer                         ; otherwise if we've reached the end of the answer, skip ahead to check variant answer
  sec                                             ; this letter was incorrect.
  lda FinalSpellcheckScore                        ; subtract score value by 4 as a penalty
  sbc #$4                                         ;
  bcc :+                                          ;
  sta FinalSpellcheckScore                        ; and update the score, unless it would overflow
: inx                                             ; advance to next character
  jmp @CalcNextUserAnswer                         ; and continue looping
@CheckVariantAnswer:
  ldx #$0                                         ; start scoring at first character
@CalcNextVariantAnswer:
  lda a:QuestionAnswerCopy,x                      ; get the variant answer character
  bmi :+                                          ; if high bit is set, this letter was correct, skip ahead
  beq @FinishSpellcheck                           ; otherwise if we've reached the end of the answer, skip to end
  sec                                             ; this letter was incorrect.
  lda FinalSpellcheckScore                        ; subtract score value by 4 as a penalty
  sbc #$4                                         ;
  bcc :+                                          ;
  sta FinalSpellcheckScore                        ; and update the score, unless it would overflow
: inx                                             ; advance to next characte
  jmp @CalcNextVariantAnswer                      ; and continue looping
@FinishSpellcheck:
  lda FinalSpellcheckScore                        ; load the spell check score, it will be positive if we failed
  rts                                             ;

RunLooseValidationSwaps:
  ldx #$0                                         ; start at the beginning of the answer text
  ldy #$0                                         ;
@RunLooseValidationSwaps:
  lda a:ValidationAnswerCopy,y                    ; get answer character
  beq @TrimSpaces                                 ; exit loop if we've reached the end
  sta LooseValidationAnswerCopyChar               ; store the current character
  sty LooseValidationAnswerCopyIndex              ; and the current index we're checking
  lda a:ValidationAnswerCopy+1,y                  ; then check the next character of the answer
  cmp #'H'                                        ; is it H?
  bne @CheckLetter                                ; no - skip ahead
  inc LooseValidationAnswerCopyIndex              ; otherwise advance to the next character
  ldy #$0                                         ; clear Y
  beq @CheckH                                     ; then unconditionally branch ahead
@CheckNextH:
  iny                                             ; advance to next optional
  iny                                             ;
@CheckH:
  lda LettersWithOptionalH,y                      ; check allowed letter before H
  beq @NextAnswerCharacter                        ; if we reached the end - skip to next letter
  cmp LooseValidationAnswerCopyChar               ; otherwise compare to our current answer character
  bne @CheckNextH                                 ; if we did not match, check next optional H
  lda LettersWithOptionalH+1,y                    ; we matched, so we replace the letter in the answer by an alternate
  sta a:QuestionAnswerCopy,x                      ;
  inx                                             ; advance to next question answer character
  jmp @NextAnswerCharacter                        ; and to next answer character
@CheckLetter:
  ldy #$0                                         ; start checking for letter swaps at the start
  beq @CheckSelectedLetter                        ; unconditional branch
@CheckNextLetter:
  iny                                             ; advance to next swap
  iny                                             ;
@CheckSelectedLetter:
  lda LetterSwaps,y                               ; check current swap
  beq @NextAnswerCharacter                        ; skip ahead if we've reached the last swap
  cmp LooseValidationAnswerCopyChar               ; check if this letter matches the swap
  bne @CheckNextLetter                            ; if not - skip ahead
  lda LetterSwaps+1,y                             ; otherwise get the character to swap in
  sta a:QuestionAnswerCopy,x                      ; and do the swap
  inx                                             ; and advance to next question answer character
@NextAnswerCharacter:
  ldy LooseValidationAnswerCopyIndex              ; get current answer character
  iny                                             ; advance by 1
  jmp @RunLooseValidationSwaps                    ; loop back to the start
@TrimSpaces:
  lda #$0                                         ; mark the end of the answer with a 0
  sta a:QuestionAnswerCopy,x                      ;
@TrimLeadingSpaces:
  lda a:QuestionAnswerCopy                        ; get first letter of answer
  cmp #' '                                        ; is it a space?
  bne @TrimMultipleSpaces                         ; no - skip ahead to trim multiple space (HELLO  THERE) -> (HELLO THERE)
  ldx #$0                                         ; otherwise start trimming off spaces
: inx                                             ; advance to next character
  lda a:QuestionAnswerCopy,x                      ; copy character
  sta a:QuestionAnswerCopy-1,x                    ;
  bne :-                                          ; keep copying until we've reached the end of the answer
  beq @TrimLeadingSpaces                          ; then loop back to keep checking for more leading spaces
@TrimMultipleSpaces:
  ldx #$FF                                        ; set X to FF to wrap around
: inx                                             ; advance to next character
  lda a:QuestionAnswerCopy,x                      ; load current character
  beq @CheckSpace                                 ; skip ahead if we're at the end of the answer
  cmp a:QuestionAnswerCopy+1,x                    ; compare against the next character
  bne :-                                          ; if they're not the same - keep looping
@CheckSpace:
  dex                                             ; go back to the previous character
  beq @MergeRepeatedCharacters                    ; if it is null, go to merge duplicate characters
  lda a:QuestionAnswerCopy,x                      ; load the character
  cmp #' '                                        ; check if it's a space
  bne @MergeRepeatedCharacters                    ; if not - skip ahead to merge duplicate characters
  lda #$0                                         ; otherwise mark the character as the end of the answer
  sta a:QuestionAnswerCopy,x                      ; 
  jmp @CheckSpace                                 ; keep looping
@MergeRepeatedCharacters:
  ldx #$FF                                        ; set X to FF to wrap around
: inx                                             ; advance to next character
  lda a:QuestionAnswerCopy,x                      ; load the character
  beq @CheckTrailingU                             ; skip ahead if we're at the end of the answer
  cmp a:QuestionAnswerCopy+1,x                    ; compare against the next character
  bne :-                                          ; if they're not the same - keep looping
  txa                                             ; transfer X to Y
  tay                                             ;
: lda a:QuestionAnswerCopy+1,y                    ; copy all characters down 1 step, removing the duplicate character
  sta a:QuestionAnswerCopy,y                      ;
  iny                                             ; advance to next character
  cmp #$0                                         ; is it null?
  bne :-                                          ; no - keep looping
  beq @TrimLeadingSpaces                          ; yes - loop all the way back up top
@CheckTrailingU:
  ldx #$FF                                        ; set X to FF to wrap around
: inx                                             ; advance to next character
  lda a:QuestionAnswerCopy,x                      ; load the character
  bne :-                                          ; keep looping until we reach the end of the answer
  dex                                             ; decrement back to the last character
  bmi @Done                                       ; exit if we looped around (answer has been emptied)
  beq @Done                                       ; exit if we reached zero (only 1 character left in answer)
  lda a:QuestionAnswerCopy,x                      ; check final answer character
  cmp #'U'                                        ; is it a U?
  bne @Done                                       ; no - we are done
  lda #$0                                         ; yes - remove the trailing U
  sta a:QuestionAnswerCopy,x                      ;
  jmp @TrimLeadingSpaces                          ; and keep looping
@Done:
  rts                                             ; then we are done!


LetterSwaps:
.byte "A", "U"
.byte "E", "U"
.byte "I", "U"
.byte "O", "U"
.byte "U", "U"
.byte "Y", "U"
.byte "W", "U"
.byte "'", "U"
.byte "B", "B"
.byte "F", "B"
.byte "P", "B"
.byte "V", "B"
.byte "S", "S"
.byte "Z", "S"
.byte "X", "S"
.byte "D", "D"
.byte "T", "D"
.byte "C", "J"
.byte "G", "J"
.byte "J", "J"
.byte "K", "J"
.byte "Q", "J"
.byte "M", "M"
.byte "N", "N"
.byte "L", "L"
.byte "R", "R"
.byte "*", "*"
.byte " ", " "
.byte $00

; any of these characters can be followed by an optional H which is ignored
LettersWithOptionalH:
.byte "P", "B" ; PH is replaced by BH
.byte "C", "K" ; CH is replaced by KH
.byte $0

CopyAnswerToScratch:
  ldy #$0                                         ; clear first byte of scratch
  lda #'('                                        ; write open paren at the start of the scratch space
  sta AnswerScratchSpace,y                        ;
  iny                                             ;
  ldx #$0                                         ;
CopyNextChar:
  inx                                             ; advance to next char to copy
  lda a:QuestionAnswerCopy-1,x                    ; and fetch that char
  bne @CheckForOptionalChar                       ; process if we found a non-null byte
  lda #')'                                        ; then write a closing paren
  sta AnswerScratchSpace,y                        ;
  lda #$0                                         ; and add a null byte after
  sta AnswerScratchSpace+1,y                      ;
  rts                                             ; done!
@CheckForOptionalChar:
  cmp #'a'                                        ; check if we are inside range of optional characters
  bcc @CheckForAsterisk                           ; if too low - skip ahead
  cmp #'{'                                        ;
  bcs @CheckForAsterisk                           ; if too high - skip ahead
  lda #'('                                        ; othewrise create a paren group of (/A), so, either empty or the correct char
  sta AnswerScratchSpace,y                        ; start by writing (
  iny                                             ;
  lda #'/'                                        ;
  sta AnswerScratchSpace,y                        ; then /
  iny                                             ;
  lda a:QuestionAnswerCopy-1,x                    ; then take the optional character
  sec                                             ;
  sbc #$20                                        ; uppercase it
  sta AnswerScratchSpace,y                        ; and write that into the group
  iny                                             ;
  lda #')'                                        ;
  sta AnswerScratchSpace,y                        ; then write )
  iny                                             ;
  jmp CopyNextChar                                ; and we're finished with this character
@CheckForAsterisk:
  cmp #'*'                                        ; is this character an asterisk?
  bne @CheckForOptionalSpace                      ; no - skip ahead
  lda #'('                                        ; otherwise we make a paren group of (/*)
  sta AnswerScratchSpace,y                        ; write (
  iny                                             ;
  lda #'/'                                        ;
  sta AnswerScratchSpace,y                        ; write /
  iny                                             ;
  lda #'*'                                        ;
  sta AnswerScratchSpace,y                        ; write *
  iny                                             ;
  lda a:QuestionAnswerCopy,x                      ; check if there's a space after the asterisk
  cmp #' '                                        ;
  beq :+                                          ; if so - skip ahead
  lda #' '                                        ; otherwise add a space to the scratch after the asterisk
  sta AnswerScratchSpace,y                        ;
  iny                                             ;
: lda #')'                                        ;
  sta AnswerScratchSpace,y                        ; finally add closing )
  iny                                             ; and advance to the next char
  jmp CopyNextChar                                ;
@CheckForOptionalSpace:
  cmp #'+'                                        ; check for the optional space character
  bne @CheckForOptionalGroup                      ; if not found - skip ahead
  lda #'('                                        ; optional space, write (/ ) to scratch
  sta AnswerScratchSpace,y                        ; write (
  iny                                             ;
  lda #'/'                                        ;
  sta AnswerScratchSpace,y                        ; write /
  iny                                             ;
  lda #' '                                        ;
  sta AnswerScratchSpace,y                        ; write " "
  iny                                             ;
  lda #')'                                        ; write )
  sta AnswerScratchSpace,y                        ;
  iny                                             ;
  jmp CopyNextChar                                ; go to next char!
@CheckForOptionalGroup:
  cmp #'['                                        ; check for optional group character
  bne @CheckForEndOfGroup                         ; not found - skip ahead
  lda #'('                                        ; otherwise write (/, to let the optional text get copied over.
  sta AnswerScratchSpace,y                        ; write (
  iny                                             ;
  lda #'/'                                        ; write /
  sta AnswerScratchSpace,y                        ;
  iny                                             ;
  jmp CopyNextChar                                ; go to next char!
@CheckForEndOfGroup:
  cmp #')'                                        ; check for closing paren
  beq :+                                          ; if found - skip to process
  cmp #']'                                        ; check for closing optional group
  bne @CopyText                                   ; if not found - skip ahead
: lda #')'                                        ; always write a closing paren for groups ([] gets converted to (/))
  sta AnswerScratchSpace,Y                        ;
  iny                                             ;
  jmp CopyNextChar                                ; go to next char!
@CopyText:
  sta AnswerScratchSpace,y                        ; reached a regular character, copy it over
  iny                                             ;
  jmp CopyNextChar                                ; and go to next char!

ValidationSuccessful:
  lda ValidationCurrentAnswer                     ; get the answer number that was matched
  sta AnswerValidationResult                      ; and copy it to the output result
  stx ValidationMatchedVariant                    ; store the variant that was matched
  ldy AnswerVariantOffset,x                       ; and find its offset in the answer scratch space
  jsr GetAnswerLength                             ; then check the length of the validated answer
  cmp #12                                         ; is it 12+ characters long?
  bcc CreateScoreboardAnswer_CopyText             ; no - just copy this answer over, otherwise start checking variants

; checks each answer variant to find one that will work on the scoreboard
CreateScoreboardAnswer:
  lda #$0                                         ; clear starting state
  sta CreateScoreboardAnswer_Length               ;
  lda #$FF                                        ;
  sta CreateScoreboardAnswer_Index                ;
  ldx #$0                                         ; start checking from first variant
CreateScoreboardAnswer_CheckVariant:
  lda AnswerVariantState,x                        ; check variant state
  beq @NextVariant                                ; if it's unused, skip to next variant
  ldy AnswerVariantOffset,x                       ; get scratch space offset of variant
  jsr GetAnswerLength                             ; and check answer length
  beq @NextVariant                                ; if 0 length, skip to next
  cmp CreateScoreboardAnswer_Length               ; otherwise compare it against the temp variant length
  bcc @NextVariant                                ; if its shorter, skip to next
  cmp #12                                         ; check if answer is 12+ characters
  bcs @NextVariant                                ; if so, skip to next
  sta CreateScoreboardAnswer_Length               ; otherwise store this as the variant to show
  stx CreateScoreboardAnswer_Index                ;
@NextVariant:
  inx                                             ; advance to next variant
  cpx #MaxValidationVariants                      ; have we checked all variants?
  bcc CreateScoreboardAnswer_CheckVariant         ; no - keep looping
  ldx CreateScoreboardAnswer_Index                ; check which variant was selected
  bpl CreateScoreboardAnswer_CopyText             ; if it's valid, skip ahead
  ldx ValidationMatchedVariant                    ; if it's invalid, use the variant that was supplied by the user

CreateScoreboardAnswer_CopyText:
  ldy AnswerVariantOffset,x                       ; get offset of variant to show
  ldx #$0                                         ; reset X
@ContinueCopying:
  lda AnswerScratchSpace,y                        ; check character at X
  cmp #'*'                                        ; have we reached an asterisk?
  beq @SkipCharacter                              ; yes - skip character
  sta ValidationScoreboardText,x                  ; otherwise copy to output
  cmp #$0                                         ; was the character null?
  beq @Done                                       ; yes - full answer copied, branch to exit
  inx                                             ; advance character
@SkipCharacter:
  iny                                             ; advance to next character to check
  cpx #11                                         ; have we reached the max scoreboard display characters?
  bcc @ContinueCopying                            ; no - keep looping
  lda #$0                                         ; yes - mark last character as null
  sta ValidationScoreboardText,x                  ;
@Done:
  rts                                             ; and we are done!

AutocompleteAnswer:
  jsr PrepareAnswerValidation                     ; copy answer data over to scratch space and initialize state
: jsr CreateAnswerVariants                        ; create all variants of answer
  bcs :-                                          ; loop until done
  ldx #$0                                         ; prepare to check each state
: lda AnswerVariantState,x                        ; check answer variant
  bne @VariantFound                               ; branch ahead if valid variant found
  inx                                             ; otherwise advance to next variant
  bne :-                                          ; and loop
@VariantFound:
  stx ValidationMatchedVariant                    ; store selected variant
  ldx #$0                                         ; and clear current result
  stx AnswerValidationResult                      ;
  jmp CreateScoreboardAnswer                      ; then copy some answer to the scoreboard

GetAnswerLength:
  @Tmp = R_000E
  lda #$0                                         ; clear temp value
  sta @Tmp                                        ;
: lda AnswerScratchSpace,y                        ; check next character
  cmp #0                                          ; and do a silly null check
  beq @Done                                       ; if null - skip to end
  iny                                             ; otherwise skip to next character
  cmp #'*'                                        ; ignore any asterisks
  beq :-                                          ;
  inc @Tmp                                        ; otherwise increment temp value
  bne :-                                          ; and keep counting
@Done:
  lda @Tmp                                        ; load temp value
  rts                                             ; and we're done!

.byte $CD,$20,$00,$A0,$00,$9A,$F0,$FE             ;   7FA6 FFA6 ........ ? ?????? 
.byte $1D,$F0,$47,$01,$D0,$1C,$56,$01             ;   7FAE FFAE ........ ??G???V? 
.byte $D0,$1C,$BF,$05,$D0,$1C,$D0,$1C             ;   7FB6 FFB6 ........ ???????? 
.byte $01,$01,$01,$00,$02,$03,$04,$FF             ;   7FBE FFBE ........ ???????? 
.byte $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF             ;   7FC6 FFC6 ........ ???????? 
.byte $FF,$FF,$FF,$FF,$9E,$24,$CA,$FF             ;   7FCE FFCE ........ ?????$?? 
.byte $AF,$24,$14,$00,$18,$00,$AF,$24             ;   7FD6 FFD6 ........ ?$?????$ 
.byte $FF,$FF,$FF,$FF,$00,$00,$00,$00             ;   7FDE FFDE ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   7FE6 FFE6 ........ ???????? 
.byte $00,$00,$00,$00,$00,$00,$00,$00             ;   7FEE FFEE ........ ???????? 
.byte $CD,$21,$CB,$00                             ;   7FF6 FFF6 ....     ?!??     

.res $FFFA-*,$00
.addr VNMI                                    ;   7FFA FFFA N 5E CA
.addr VSTART                                    ;   7FFC FFFC N 36 D1
.byte $C3                                         ;   7FFE FFFE .        ?        
D_3_7FFF:
.byte $CA                                         ;   7FFF FFFF .        ?        