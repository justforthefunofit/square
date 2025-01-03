100 PRINT "{147}" : rem clear screen
120 DIM G,I,P,C,W,F,R,X,Y
140 O = 81.5    : rem used to generate random char
160 J = 160     : rem inverse space
180 A = 81      : rem character circle (cursor effect)
200 N = 40      : rem used to calulate next Y
220 B = 1024    : rem screen memory start
240 M = 54272   : rem 54272+1024=55296=screen color memory
260 Z = 39      : rem used to determin max columns (0-39)
280 E = 24      : rem used to determin max lines (0-24)
300 V = 25      : rem used to rnd start y
320 L = 15      : rem used to rnd start x
340 POKE53280,. : rem border screen to black
360 POKE53281,. : rem center screen to black
380 ::
400 FOR Q=. TO 499    : rem create 500 random squares
420  X=INT(RND(.)*N)  : rem random x start
440  Y=INT(RND(.)*V)  : rem random y start 
460  F=INT(RND(.)*L)+1: rem random color, +1 to exclude black
480  W=INT(RND(.)*7)  : rem random witdh of square
500 ::
520  FOR C=. TO W     : rem from zero to width of square 
540    G=Y-C 
560    FOR R=. TO C+C : I=X-C+R:GOSUB700 : NEXT R : I=X-C+R
580    FOR R=. TO C+C : GOSUB700 : G=G+1 : NEXT R
600    FOR R=. TO C+C : GOSUB700 : I=I-1 : NEXT R
620    FOR R=. TO C+C : GOSUB700 : G=G-1 : NEXT R
640   NEXT C
660  NEXT Q
680 END
700 IF(I<.)OR(I>Z)OR(G<.)OR(G>E)THEN RETURN: rem ensure xy is inside screen
720 P=B+I+N*G                  : rem calculate screen position p=1024+I+40*G
740 POKE M+P,F                 : rem set color memory  54272+P
760 POKE P,A                   : rem char 81 give cursor effect  
780 POKE P,J+(C<>W)*(O+RND(.)) : rem place character on screen
800 RETURN
