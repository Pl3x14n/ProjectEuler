LET t = TIME 

LET zirkulaer = 0
FOR n = 2 TO 1000000
   LET n$ = STR$(n)
    
    
   FOR i = 1 TO LEN(n$)
      IF n$(i:i) <> "1" AND n$(i:i) <> "3" AND n$(i:i) <> "7" AND n$(i:i) <> "9" THEN EXIT FOR  
   NEXT i
    
    
   IF i-1 = LEN(n$) OR LEN(n$) = 1 THEN 
      FOR i = 1 TO LEN(n$)
         LET nr$ = ""
          
         FOR j = i TO LEN(n$)
            LET nr$ = nr$ & n$(j:j)
         NEXT j 
          
         FOR j = 1 TO i-1
            LET nr$ = nr$ & n$(j:j)
         NEXT j
          
         IF prime(VAL(nr$)) = 0 THEN EXIT FOR 
      NEXT i
       
       
       
      IF i-1 = LEN(n$) THEN 
         LET zirkulaer = zirkulaer + 1
         PRINT zirkulaer,n
          
      END IF 
   END IF 
NEXT n

PRINT "--------------------------------------"
PRINT zirkulaer;"        (";TIME-t;" s )"

FUNCTION prime(n)
   IF MOD(n,2)=0 THEN
      IF n=2 THEN LET prime = 1 ELSE LET prime = 0
   ELSE
      FOR k=3 TO SQR(n) STEP 2
         IF MOD(n,k)=0 THEN EXIT FOR 
      NEXT k
      IF k<=SQR(n) THEN LET prime = 0 ELSE LET prime = 1
   END IF
END FUNCTION 



END
