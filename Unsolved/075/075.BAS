DIM L(1500000)

LET t = TIME

FOR a = 1 TO 500000

   LET b = a+1
   DO 
      LET c = SQR(a^2+b^2)
      IF c = INT(c) THEN LET L(a+b+c) = L(a+b+c) + 1
       
      IF c-b < 1 THEN EXIT DO 
      LET b = b+1
   LOOP
NEXT a


FOR i = 1 TO 1500000
   IF L(i) = 1 THEN LET solu = solu + 1
NEXT i


PRINT "Solution: ";solu 
PRINT "Time: ";TIME-t;"s"
END
