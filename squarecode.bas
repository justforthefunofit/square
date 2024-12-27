100 print "{147}"
120 print "          {17}{17}{17}{17}initialising.."
140 rem -----------------------
160 rem ---- initialisation 
180 rem -----------------------
200 dim p(40,25)
220 for y=1 to 25: 
240   for x=1 to 40
260     p(x,y)=983+x+y*40 
280 next x, y
300 rem ----------------------- 
320 print "           {17}{17}press a key":poke 198,0: wait 198,1:?"{147}" 
340 rr=int(-TI): rem re-initialize random seed
360 mx=40      : rem max columns
380 my=25      : rem max lines
400 cm=55296   : rem color memory
420 poke 53280,0:rem screen background to black
440 poke 53281,0:rem screen border to black
460 rem ----------------------
480 for q = 1 to 500
500 x= int(rnd(1)*40)  : rem starting position of center of square
520 y= int(rnd(1)*25)  : rem starting position of center of square
540 cc=int(rnd(1)*15)+1: rem character color and exclude black
560 rc=77+int(rnd(1)*2): rem random character
580 rw=int(rnd(1)*7)   : rem random width of square
600 w = 0              : rem starting width of square
620 gosub 680          : rem calculate square and display it
640 next q             : rem next square
660 end
680 rem ----------------------
700 rem main routine 
720 rem ----------------------
740 ::
760 for c=0 to rw
780 ::
800 for r=0 to (2*w):xn=x-w+r:yn=y-w:xp=xn:yp=yn:gosub1020: next r
820 xn=x-w+r:yn=y-w 
840 for h=0 to (2*w):xp=xn:yp=yn+h:gosub1020:next h 
860 xn=xn:yn=yn+h
880 for l=0 to (2*w):xp=xn-l:yp=yn:gosub1020:next l
900 xn=xn-l:yn=yn
920 for u=0 to (2*w):xp=xn:yp=yn-u:gosub1020:next u
940 w=w+1
960 next c
980 return
1000 ::
1020 rem ----------------------
1040 rem character on screen
1060 rem ----------------------
1080 if (xp<1)or(xp>mx)or(yp<1)or(yp>my) then return
1100 pOp(xp,yp),81:pOp(xp,yp),32+128:pOp(xp,yp),81: rem just for the walk effect
1120  if c<>rw then poke p(xp,yp),77+int(rnd(1)*2)
1140 if c=rw then poke p(xp,yp),32+128
1160 poke cm-1024+p(xp,yp),cc
1180 return
