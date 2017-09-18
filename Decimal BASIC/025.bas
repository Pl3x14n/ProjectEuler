OPTION ARITHMETIC Decimal_High

LET t = TIME 

LET f1=1
LET f2=1
LET n=2
DO 
   LET fn=f1+f2                                                 
   LET f1=f2
   LET f2=fn    
   LET n=n+1
    
   IF LEN(STR$(fn))=1000 THEN
      PRINT n;"  (";fn;")" 
      EXIT DO 
   END IF         
LOOP

PRINT "(";TIME-t;" s )"


 
END
