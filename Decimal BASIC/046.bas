LET t = TIME

DIM primes(10000)
LET primes(1) = 2

FOR j = 3 TO 10000 STEP 2

   FOR i=3 TO SQR(j) STEP 2
      IF MOD(j,i)=0 THEN EXIT FOR 
   NEXT i
    
   IF i>SQR(j) THEN 
      LET p = p + 1
      LET primes(p+1) = j
   END IF 
    
NEXT j




LET n = 5
DO 
   LET i = 1
   DO UNTIL primes(i)>=n    
      IF SQR((n - primes(i)) / 2) = INT(SQR((n - primes(i)) / 2)) THEN EXIT DO    
      LET i = i + 1
   LOOP 
    
   IF primes(i) > n THEN EXIT DO
   LET n = n + 2 
LOOP 

PRINT "---------------------"
PRINT n
PRINT "(";TIME-t;" s )"
END
