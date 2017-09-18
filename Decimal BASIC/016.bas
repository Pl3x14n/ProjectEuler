OPTION ARITHMETIC Decimal_High
LET t = TIME 

LET n = 2^1000
PRINT q(n)
PRINT "(";TIME-t;" s )"

FUNCTION q(a)
   local a$,i,quer
   LET a$ = STR$(a)
    
   FOR i = 1 TO LEN(a$)
      LET quer = quer + VAL(a$(i:i)) 
   NEXT i 
    
   LET q = quer
    
END FUNCTION 
END
