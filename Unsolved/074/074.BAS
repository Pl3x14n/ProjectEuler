DIM sum(100)

FOR i = 3 TO 1000000
   LET i$=STR$(i)
   MAT sum = ZER
   LET anzahl  = 0
    
   DO  
      LET anzahl = anzahl + 1
      FOR j = 1 TO LEN(i$)
         LET sum(anzahl) = sum(anzahl) + FACT(VAL(i$(j:j)))
      NEXT j
      LET i$ = STR$(sum(anzahl))
       
      FOR j = i TO anzahl-1 
         IF sum(anzahl) = sum(i) THEN GOTO 10
      NEXT j
      
      IF sum(anzahl) = i OR anzahl>=60 THEN 
         LET plus60 = plus60 + 1
         EXIT DO 
      END IF 
      
   LOOP     
10
   NEXT i
   
   PRINT plus60
END
