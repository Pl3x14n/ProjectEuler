
LET t = TIME

LET sidelength = 1
LET dia_num = 1
LET drt1 = 1
LET drt2 = 7

DO 
   LET sidelength = sidelength + 2
   LET dia_num = dia_num + 4
   LET drt = drt1 + (drt1 - drt2) + 8
   LET dlt = drt + sidelength - 1
   LET dlb = dlt + sidelength - 1
   LET drb = dlb + sidelength - 1
    
   IF prime(drt) = 1 THEN LET dia_prim = dia_prim + 1  
   IF prime(dlt) = 1 THEN LET dia_prim = dia_prim + 1
   IF prime(dlb) = 1 THEN LET dia_prim = dia_prim + 1
   IF prime(drb) = 1 THEN LET dia_prim = dia_prim + 1
    
   LET drt2 = drt1
   LET drt1 = drt
    
   IF dia_prim / dia_num <0.1 THEN EXIT DO 
LOOP 

PRINT sidelength
PRINT "(";TIME-t;"s )"


FUNCTION prime(n)
   IF MOD(n,2)=0 THEN
      IF n=2 THEN LET prime = 1 ELSE LET prime = 0
   ELSE
      FOR i=3 TO SQR(n) STEP 2
         IF MOD(n,i)=0 THEN EXIT FOR 
      NEXT i
      IF i<=SQR(n) THEN LET prime = 0 ELSE LET prime = 1
   END IF
END FUNCTION 



END
