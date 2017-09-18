OPTION ARITHMETIC Decimal_High
LET t = TIME 

DEF tri(n) = n*(n+1)/2

DO 
   LET n = n + 1
   IF teileranzahl(tri(n)) > 500 THEN EXIT DO 
LOOP 

PRINT tri(n)
PRINT "(";TIME-t;" s )"
 



FUNCTION teileranzahl(a)
   local i,t
    
   FOR i = 1 TO SQR(a)
      IF MOD(a,i)=0 THEN LET t = t + 2                
   NEXT i
   IF SQR(a) = INT(SQR(a)) THEN LET t = t - 1
    
   LET teileranzahl = t 
END FUNCTION 

END
