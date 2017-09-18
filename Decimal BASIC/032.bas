LET t = TIME

FOR multiplicand = 1 TO 1000
   FOR multiplier = 10^(4-LEN(STR$(multiplicand))) TO 10^(5-LEN(STR$(multiplicand)))
      LET product$ = STR$(multiplicand*multiplier)      
      LET CONnect$ = STR$(multiplicand) & STR$(multiplier) & product$
       
      IF LEN(connenct$) > 9 THEN EXIT FOR
       
      IF multiplier > multiplicand THEN 
         IF LEN(connect$) = 9 THEN 
            IF digits$(connect$) = "0111111111" THEN 
             
               FOR i = 1 TO LEN(c$)-LEN(product$)
                  IF c$(i:i+LEN(product$)-1) = product$ THEN EXIT FOR              
               NEXT i
                
               IF i-1 = LEN(c$)-LEN(product$) OR c$ = "" THEN 
                  LET c$ = c$ & product$ & "."
                  PRINT multiplicand;"x";multiplier;" =  ";product$
                  LET sum = sum + multiplicand*multiplier 
               ELSE 
                  PRINT TAB(10);"(";multiplicand;"x";multiplier;" =  ";product$;" )"
                   
                   
               END if 
                
            END IF
         END IF 
      END IF 
       
   NEXT multiplier
NEXT multiplicand

PRINT "-------------------------------------"
PRINT sum
PRINT "(";TIME-t;"s )"


fUNCTION digits$(n$)
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