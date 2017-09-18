LET t = TIME 

LET n = 3
DO
   LET n = n + 1
   IF prime_factors(n) = n1 AND n1 = n2 AND n2 = n3 AND n1 = 4 THEN EXIT DO 
   LET n3 = n2
   LET n2 = n1
   LET n1 = prime_factors(n)
LOOP 

PRINT n - 3
PRINT "(";TIME-t;"s )"



FUNCTION prime_factors(n)
   local f , pf , sn
    
   LET f = 2
   DO WHILE n<>1 AND f^2 < n
      LET sn = n
      DO WHILE MOD(n,f)=0
         LET n=n/f 
      LOOP
      IF sn <> n THEN LET pf = pf + 1
      LET f=f+1
   LOOP
    
   IF f^2 > n THEN LET pf = pf + 1
    
   LET prime_factors = pf    
END FUNCTION

END