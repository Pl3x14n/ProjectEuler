OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR di = 1 TO 1000000
   LET di$ = STR$(di) 
    
   FOR i = 1 TO INT(LEN(di$)/2)
      IF di$(i:i) <> di$(LEN(di$)-i+1:LEN(di$)-i+1) THEN EXIT FOR    
   NEXT i
    
   IF i-1 = INT(LEN(di$)/2) THEN 
      LET bi =binaer(di)
      LET bi$ = STR$(bi)
       
      FOR j = 1 TO INT(LEN(bi$)/2)
         IF bi$(j:j) <> bi$(LEN(bi$)-j+1:LEN(bi$)-j+1) THEN EXIT FOR 
      NEXT j
       
      IF j-1 = INT(LEN(bi$)/2) THEN  
         LET palindroms = palindroms + 1
         LET sum = sum + di
         PRINT palindroms,di;bi
      END if 
   END IF    
    
NEXT di



PRINT "-----------------------------------------------"
PRINT sum
PRINT "(";TIME-t;" s )"



FUNCTION binaer(n)
   LET e$ = ""
   LET ef$ = ""
   DO 
      LET ef$ = ef$ & STR$(MOD(n,2))
      LET n = INT(n/2)
      IF n = 0 THEN EXIT DO 
   LOOP    
    
   FOR i = 1 TO LEN(ef$) 
      LET e$ = e$ & ef$(LEN(ef$)-i+1:LEN(ef$)-i+1)
   NEXT i
    
   LET binaer = VAL(e$)
    
END FUNCTION 


END
 
 
 
 
