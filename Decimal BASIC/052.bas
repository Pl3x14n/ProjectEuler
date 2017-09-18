LET t = TIME
 
FOR x = 1 TO 1000000
 
   IF x > 10^(LEN(STR$(x))) / 6 THEN
      LET x = 10^(LEN(STR$(x))) - 1
   ELSE 
      IF LEN(STR$(x)) = LEN(STR$(6*x)) THEN 
       
         LET digit$ = digits$(STR$(x))
         FOR i = 2 TO 6
            IF digit$ <> digits$(STR$(i*x)) THEN EXIT FOR  
         NEXT i
         IF i = 7 THEN EXIT FOR 
      END IF    
   END IF
    
NEXT x

PRINT x
PRINT "(";TIME-t;" s )"




FUNCTION digits$(n$)
   local i,x,d$   
    
   LET d$ = REPEAT$("0",10)    
    
   FOR i = 1 TO LEN(n$)
      LET x = VAL(d$( VAL(n$(i:i))+1 : VAL(n$(i:i))+1 ) )
      LET x = x + 1 
      LET d$ = d$(1  :VAL(n$(i:i))) & STR$(x) & d$(VAL(n$(i:i))+2 : LEN(d$))      
   NEXT i
    
   LET digits$ = d$
END FUNCTION 
END
