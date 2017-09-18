OPTION CHARACTER byte 

LET t = TIME 

LET product = 1
DO UNTIL LEN(d$) >= 1000000
   LET i = i + 1
   LET d$ = d$ & STR$(i)
   IF LEN(d$) > 10^dn THEN 
      LET product = product * VAL(d$(10^dn:10^dn))
      LET dn = dn + 1
   END IF    
LOOP

PRINT product
PRINT "(";TIME-t;" s )"

END
