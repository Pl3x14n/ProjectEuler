LET t = TIME 

LET n = 2*10^6

DIM s(n)

FOR i = 4 TO n STEP 2
   LET s(i) = 1
NEXT i

LET sum = 2

FOR i = 3 TO n STEP 2
   IF s(i) = 0 THEN
      LET sum = sum + i
      FOR j = i^2 TO n STEP i
         LET s(j) = 1
      NEXT j 
   END IF
NEXT i
 
PRINT sum 
PRINT "(";TIME-t;"s )"
END