OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR a = 2 TO 99
   FOR b = 1 TO 99
    
      LET digit_sum = digitalsum(a^b)
       
      IF digit_sum > maxi_digitsum THEN
         LET maxi_digitsum = digit_sum
         LET BASE = a
         LET EXP = b
      END IF
       
   NEXT b
NEXT a

PRINT maxi_digitsum;"    (";BASE;"^";EXP;")"
PRINT "(";TIME-t;"s )"



FUNCTION digitalsum(a)
   local a$,i,quer
   LET a$ = STR$(a)
    
   FOR i = 1 TO LEN(a$)
      LET quer = quer + VAL(a$(i:i)) 
   NEXT i 
    
   LET digitalsum = quer
    
END FUNCTION 







END
