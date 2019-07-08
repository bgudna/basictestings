1 RANDOMIZE
10 DIM z(30,2)
11 LET hi=0
15 LET rand=0.1
20 GO SUB 9000
25 LET men=3: LET score=0
30 LET left=0: LET max=20: LET zombie=0: LET go=4
40 POKE 23560,0
100 GO SUB 1000
110 GO SUB 3000
120 GO SUB 2000
130 IF men>2 THEN PRINT AT 0,29,"@"
140 IF men>1 THEN PRINT AT 0,30,"@"
150 IF men>0 THEN PRINT AT 0,31,"@"
160 PRINT AT 0,0;"SCORE: ";score
170 PRINT AT 0,15;"HI: ";hi
200 LET a=PEEK 23560
205 LET tx=px: LET ty=py
210 IF a=97 THEN PRINT AT py,px; " ": LET py=py-1: GO TO 260
220 IF a=115 THEN PRINT AT py,px; " ": LET py=py+1: GO TO 260
230 IF a=107 THEN PRINT AT py,px; " ": LET px=px-1: GO TO 260
240 IF a=108 THEN PRINT AT py,px; " ": LET py=py+1: GO TO 260
250 GO TO 300
260 IF px<1 OR px>30 OR py<2 OR py>20 THEN GO TO 4000
270 IF SCREEN$ (py,px) <>" " THEN GO TO 5000
280 PRINT AT py,px;"@"
300 LET num=30
305 IF num>go THEN GO TO 200
310 LET zombie=zombie+1: IF zombie>max THEN LET zombie=1
320 LET zx=z(zombie,1): LET zy=z(zombie,2): LET tx=zx: LET ty=zy
340 LET dx=0: LET dy=0
350 IF zx<px THEN LET dx=1
360 IF zx>px THEN LET dx=-1
370 IF zy<py THEN LET dy=1
380 IF zy>py THEN LET dy=-1
390 LET zx=zx+dx: LET zy=zy+dy
400 LET num=num+1
410 IF SCREEN$ (zy,zx)= " " THEN GO TO 500
420 IF SCREEN$ (zy,zx)= " :) " THEN GO TO 305
430 IF zx=px AND zy=py THEN GO TO 7000
440 LET z(zombie,1)=0
450 PRINT AT ty,tx; " "
460 LET score=score+1: PRINT AT 0,0;"SCORE: ";score
470 LET left=left-1: IF left=0 THEN GO TO 8000
480 FOR n=1 TO 10: BEEP 0.01,n: NEXT n
485 LET go=1+INT (left/5)
490 GO TO 305

500 PRINT AT ty,tx; " "
510 PRINT AT zy,zx; FLASH 1; INK 2; ":)"
520 LET z(zombie,1)=zx: LET z(zombie,2)=zy
525 BEEP 0.02,30-left
530 GO TO 305

1000 PAPER 6: CLS
1010 PLOT 4,4: DRAW 248,0: DRAW 0,159: DRAW -248,0: DRAW 0,-159
1020 FOR i=20 TO 20
1030 FOR j=i TO 30
1040 IF RND>rand THEN GO TO 1060
1050 PRINT AT i,j; INK 1; "O"
1060 NEXT j: NEXT i
1100 RETURN

2000 LET px=INT (RND*13+5)
2010 LET py=INT (RND*17+5)
2020 REM IF SCREEN$ (py,px)<> " " THEN GO TO 2000
2021 REM IF SCREEN$ (py-1,px-1)<> " " THEN GO TO 2000
2022 REM IF SCREEN$ (py,px-1)<> " " THEN GO TO 2000
2023 REM IF SCREEN$ (py+1,px-1)<> " " THEN GO TO 2000
2024 REM IF SCREEN$ (py-1,px)<> " " THEN GO TO 2000
2025 REM IF SCREEN$ (py+1,px)<> " " THEN GO TO 2000
2026 REM IF SCREEN$ (py-1,px+1)<> " " THEN GO TO 2000
2027 REM IF SCREEN$ (py,px+1)<> " " THEN GO TO 2000
2028 REM IF SCREEN$ (py+1,px+1)<> " " THEN GO TO 2000
2030 PRINT AT py,px;"@"
2100 RETURN

3000 FOR j=2 TO 20
3020  LET i=INT (RND*30+1)
3030 IF SCREEN$ (j,i) <> " " THEN GO TO 3020
3040 PRINT AT j,i; FLASH 1; INK 2; ":D"
3050 LET left=left+1: LET z(left,1)=i: LET z(left,2)=j
3060 NEXT j
3100 RETURN

4000 FOR i=1 TO 20
4010 PRINT AT py,px; " ": PRINT AT ty,tx;"@"
4020 BEEP .02,i
4030 PRINT AT py,px; "@": PRINT AT ty,tx;" "
4040 BEEP .02,20-i
4050 NEXT i
4060 GO TO 7060

5000 FOR i=1 TO 20
5020 PRINT AT py,px;" ": PRINT AT ty,tx;"@"
5030 BEEP .02,20+i
5040 PRINT AT py,px;"@": PRINT AT ty,tx;" "
5050 BEEP .02,20-i
5060 NEXT i
5070 GO TO 7060

7000 FOR i=1 TO 20
7010 PRINT AT py,px; INK 3; ":)": PRINT AT ty,tx; " "
7020 BEEP .02,20+i
7030 PRINT AT py,px;"@": PRINT AT ty,tx; ":)"
7040 BEEP .02,20-i
7050 NEXT i
7060 LET men=men-1: IF men<0 THEN GO TO 7070
7062 FOR i=1 TO 100: NEXT i
7063 LET rand=0.1
7065 GO TO 30
7070 IF score>hi THEN LET hi=score: PRINT AT 0,15;"HI: ";hi
7075 PRINT AT 1,6; "Another Game (Y/N)? "
7080 IF INKEY$="y" THEN GO TO 25
7090 IF INKEY$="n" THEN BORDER 7: PAPER 7: INK 0: STOP
7100 GO TO 7080

8000 PRINT AT 0,10; FLASH 1; "*** BONUS ***"
8005 LET score=score+5
8006 LET rand=rand*0.6
8010 FOR i=1 TO 3
8020 FOR j=i TO 50
8030 BEEP 0.01,j
8040 NEXT j
8050 NEXT i
8060 GO TO 30

9000 POKE USR "A",BIN 00011100
9001 POKE USR "A"+1,BIN 00011100
9002 POKE USR "A"+2,BIN 00011111
9003 POKE USR "A"+3,BIN 00010000
9004 POKE USR "A"+4,BIN 00010000
9005 POKE USR "A"+5,BIN 00010100
9006 POKE USR "A"+6,BIN 00100010
9007 POKE USR "A"+7,BIN 00000000
9010 POKE USR "B",BIN 00000000
9011 POKE USR "B"+1,BIN 01100110
9012 POKE USR "B"+2,BIN 01100110
9013 POKE USR "B"+3,BIN 00000000
9014 POKE USR "B"+4,BIN 00011000
9015 POKE USR "B"+5,BIN 01000010
9016 POKE USR "B"+6,BIN 00111100
9017 POKE USR "B"+7,BIN 01100110
9020 POKE USR "C",0
9021 POKE USR "C"+1,BIN 00111100
9022 POKE USR "C"+2,BIN 01111110
9023 POKE USR "C"+3,BIN 01100110
9024 POKE USR "C"+4,BIN 00100100
9025 POKE USR "C"+5,BIN 01111110
9026 POKE USR "C"+6,BIN 00111100
9027 POKE USR "C"+7,0

9100 BORDER 1: PAPER 6: INK 0: CLS
9110 PRINT AT 1,13; "22 Days Later"
9120 PRINT AT 1,13; OVER 1; "_____________"
9130 PRINT AT 4,4;" retrocorndog 1984"
9140 PRINT AT 8,4; "Keys: "
9150 PRINT AT 10,4; "A = UP"
9160 PRINT AT 11,4; "S = DOWN"
9170 PRINT AT 12,4; "K = LEFT"
9180 PRINT AT 13,4; "L = right"
9190 PRINT AT 15,5; "any other key to stop"
9200 PRINT AT 19,6; "Hit any key to start"
9210 PAUSE 0
9900 RETURN