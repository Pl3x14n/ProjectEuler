LET t = TIME 

LET MAXvalue = 1000
DIM p(MAXvalue)

FOR a = 1 TO INT(MAXvalue/3)
   FOR b = a TO INT(maxvalue/3)*2
      LET c = SQR(a^2+b^2)
      IF INT(c) = c AND a+b+c<=1000 THEN LET p(a+b+c) = p(a+b+c) + 1
   NEXT b
NEXT a

FOR i = 1 TO MAXvalue-1
   IF p(i) > MAXsolu THEN
      LET MAXsolu = p(i)
      LET MAXp = i
   END IF 
NEXT i 

PRINT MAXp
PRINT "(";TIME-t;" s )"
END
