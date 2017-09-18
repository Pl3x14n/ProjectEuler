LET t = TIME

LET MAXn = 150000
DIM s(maxn)

 

FOR i = 4 TO maxn STEP 2
   LET s(i) = 1
NEXT i

LET p = 1
LET i = 1
DO 
   LET i = i + 2
   IF s(i) = 0 THEN
      LET p = p + 1
      IF p = 10001 THEN EXIT DO 
      FOR j = i^2 TO MAXn STEP i
         LET s(j) = 1
      NEXT j 
   END IF
LOOP

PRINT i 
PRINT "(";TIME-t;"s )"
 
END

