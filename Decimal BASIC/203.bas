OPTION ARITHMETIC Decimal_High

LET t = TIME 

DIM bino_coeff(1500)


FOR n = 0 TO 51-1
   FOR k = 1 TO n-1
      LET coeff = coeff + 1
      LET bino_coeff(coeff) = comb(n,k)
   NEXT k
NEXT n


FOR i = 1 TO coeff-1
   FOR j = i+1 TO coeff
      IF bino_coeff(i) = bino_coeff(j) THEN LET bino_coeff(j) = 0 
   NEXT j
NEXT i


FOR i = 1 TO coeff
   IF bino_coeff(i) <> 0 THEN 
      IF squarefree(bino_coeff(i)) = 1 THEN LET sum = sum + bino_coeff(i)
   END IF  
NEXT i   


PRINT sum + 1
PRINT "(";TIME-t;"s )"








FUNCTION squarefree(n)
   local d,squareful
    
   LET d = 1
   DO UNTIL d > n
      LET d = d + 1
      IF MOD(n,d) = 0 THEN
         LET n = n / d
         IF MOD(n,d) = 0 THEN 
            LET squareful = 1
            EXIT do 
         END IF 
      END IF
   LOOP
    
   IF squareful = 1 THEN LET squarefree = 0 ELSE LET squarefree = 1
    
END FUNCTION
 
 
END
