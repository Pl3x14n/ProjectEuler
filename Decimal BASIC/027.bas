LET t = TIME 

FOR a = -999 TO 999
   FOR b = -999 TO 999
      IF prime(b) = 1 AND prime(a+b+1) = 1 THEN 
       
         LET quad = 0
         DO
            LET f = quad^2 + a*quad + b
            IF prime(f) = 0 THEN EXIT DO
             
            LET quad = quad + 1
         LOOP 
          
         IF MAXquad < quad THEN 
            LET MAXquad = quad
            LET MAXa = a
            LET MAXb = b
         END IF
          
      END IF 
   NEXT b
NEXT a


PRINT MAXa*MAXb;" = ";MAXa;"*";MAXb;"   (";MAXquad;"Steps )"
PRINT "(";TIME-t;" s )"


FUNCTION prime(n)
   IF MOD(n,2)=0 THEN
      IF n=2 THEN LET prime = 1 ELSE LET prime = 0
   ELSE
      FOR i=3 TO SQR(ABS(n)) STEP 2
         IF MOD(n,i)=0 THEN EXIT FOR 
      NEXT i
      IF i<=SQR(ABS(n)) THEN LET prime = 0 ELSE LET prime = 1
   END IF
END FUNCTION 


END