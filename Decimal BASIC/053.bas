OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR n = 1 TO 100
   FOR r = 1 TO n
      IF comb(n,r) > 10^6 THEN LET solu = solu + 1
   NEXT r
NEXT n

PRINT solu
PRINT "(";TIME-t;"s )"

END 
