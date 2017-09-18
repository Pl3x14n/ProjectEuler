OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR i = 1 TO 10000
   LET i$ = STR$(i)
    
    
   FOR j = 1 TO 50 
      LET i2$ = ""
      FOR x = 1 TO CEIL(LEN(i$) )
         LET i2$ = i2$ & i$(LEN(i$)-x+1:LEN(i$)-x+1)
      NEXT x
       
      LET i$ = STR$(VAL(i$) + VAL(i2$))
      FOR x = 1 TO CEIL(LEN(i$)/2)
         IF i$(x:x) <> i$(LEN(i$)-x+1:LEN(i$)-x+1) THEN EXIT FOR
      NEXT x
       
      IF x-1 = CEIL(LEN(i$)/2) THEN EXIT FOR 
       
   NEXT j
    
   IF j >= 51 THEN LET lychrel = lychrel + 1
    
NEXT i

PRINT lychrel
PRINT "(";TIME-t;"s )"

END

