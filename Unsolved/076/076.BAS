LET t = TIME 

DIM p(-20 TO 100)
LET p(0) = 1

FOR n = 1 TO 100
   LET sign = 1
   FOR k = 1 TO 100
      LET f = k * (3*k-1) / 2
      
      IF p(n-f) = 0 THEN EXIT FOR 
      
      LET p(n) = p(n) + sign*p(n-f)
      LET f = k * (3*k+1)/2
      
      IF p(n-f) = 0 THEN EXIT FOR 
      
      LET p(n) = p(n) + sign*p(n-f)
      LET sign = -sign
       
   NEXT k
NEXT n

PRINT p(100)-1
PRINT "(";TIME-t;"s )"
END

