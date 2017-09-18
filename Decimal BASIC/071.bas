LET t = TIME 

LET MAX = 10^6

FOR a = MAX TO 1 STEP -1
   LET b = 3*a - 1
   IF MOD(b,7) = 0 THEN 
      LET b = b / 7
      IF gcd(b,a) = 1 THEN EXIT FOR  
   END IF 
NEXT a

PRINT b
PRINT "(";TIME-t;"s )"

FUNCTION gcd(a,b)
   IF b = 0 THEN LET gcd = a ELSE LET gcd = gcd(b,MOD(a,b))
END FUNCTION 


END
