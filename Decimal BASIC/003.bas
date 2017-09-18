LET t = TIME 
PRINT prime_factor$(600851475143)
PRINT "(";TIME-t;" s )"


FUNCTION prime_factor$(n)
   local f , pf$
    
   LET f = 2
   DO WHILE n<>1 AND f^2 < n
      DO WHILE MOD(n,f)=0
         LET pf$ = pf$ & " * " & STR$(f)
         LET n=n/f 
      LOOP
      LET f=f+1
   LOOP
    
   LET pf$ = pf$(3:LEN(pf$))
   IF f^2 > n THEN  
      LET pf$ = pf$ & " * " & STR$(n)
   END if 
    
   IF pf$ = "" THEN LET prime_factor$ = STR$(n) ELSE LET prime_factor$ = pf$
END FUNCTION


END
 
 