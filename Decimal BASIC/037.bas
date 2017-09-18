LET ti = TIME 

DIM truncable(20)

LET n = 10 

DO UNTIL t_primes = 11
   LET n = n + 1 
   LET n$ = STR$(n)
   LET t = 0
    
   CALL trunc_left
   CALL trunc_right
    
   FOR j = 1 TO t
      CALL prime(truncable(j))
      IF prime = 0 THEN EXIT FOR 
   NEXT j 
    
    
   IF j-1 = t THEN 
      LET t_primes = t_primes + 1
      LET sum = sum + n
      PRINT t_primes,n   
   END IF 
    
    
LOOP


PRINT "-------------------------------"
PRINT sum
PRINT "(";TIME-ti;" s )"







SUB trunc_left
   FOR i = 1 TO LEN(n$)
      LET t = t + 1
      LET truncable(t) = VAL(n$(1:LEN(n$)-i+1))
   NEXT i
    
END SUB


SUB trunc_right
   FOR i = 1 TO LEN(n$)-1
      LET t = t + 1
      LET truncable(t) = VAL(n$(1+i:LEN(n$)))
   NEXT i
END SUB 



SUB prime(n)
   IF n = 1 THEN 
      LET prime = 0
   ELSEIF MOD(n,2)=0 THEN
      IF n=2 THEN LET prime = 1 ELSE LET prime = 0
   ELSE
      FOR i=3 TO SQR(n) STEP 2
         IF MOD(n,i)=0 THEN EXIT FOR 
      NEXT i
      IF i<=SQR(n) THEN LET prime = 0 ELSE LET prime = 1
   END IF
END SUB
END
