LET t = TIME 

FOR i=1 TO 1000000-1 STEP 2
   LET chain_length = 0
   LET n = i
   DO WHILE n <> 1
      IF MOD(n,2)=0 THEN                              !Gerade,dann durch 2
         LET n = n / 2
         LET chain_length = chain_length + 1
      ELSE                                            !Ungerade,dann mal 3 plus 1
         LET n = n * 3 + 1
         LET n = n / 2
         LET chain_length = chain_length + 2
      END IF
   LOOP 
    
   IF chain_length > MAX_chain_length THEN
      LET MAXn = i
      LET MAX_chain_length = chain_length
   END IF  
    
NEXT i

PRINT maxn;"  (";MAX_chain_length;"Elemente )"
PRINT "(";TIME-t;" s )"
END
