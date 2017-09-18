LET t = TIME 

DIM previous$(0 TO 9,2)
FOR i = 0 TO 9
   LET previous$(i,2) = STR$(i)
NEXT i

LET replies$ = "319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716"

FOR i = 2 TO LEN(replies$) STEP 4
   LET previous$(VAL(replies$(i:i)),1) = previous$(VAL(replies$(i:i)),1) & replies$(i-1:i-1)
   LET previous$(VAL(replies$(i+1:i+1)),1) = previous$(VAL(replies$(i+1:i+1)),1) & replies$(i-1:i)
NEXT i 


FOR i = 0 TO 9
   LET previous$(i,1) = dedupe$(previous$(i,1))
NEXT i


FOR i = 0 TO 8
   FOR j = i+1 TO 9
      IF LEN(previous$(i,1)) > LEN(previous$(j,1)) THEN 
         swap previous$(i,1) , previous$(j,1)
         swap previous$(i,2) , previous$(j,2)
      END IF
   NEXT j
NEXT i


FOR i = 0 TO 9
   IF previous$(i,2) <> "4" AND previous$(i,2) <> "5" THEN PRINT previous$(i,2) & " ";
NEXT i

PRINT 
PRINT "(";TIME-t;"s )"





FUNCTION dedupe$(n$)
   local i,j
    
   DO UNTIL i > LEN(n$)
      LET i = i + 1
       
      LET j = i
      DO UNTIL j > LEN(n$)
         LET j = j + 1
          
         DO WHILE n$(i:i) = n$(j:j)
            LET n$(j:j) = ""
         LOOP 
          
      LOOP
   LOOP
    
   LET dedupe$ = n$
END FUNCTION



END
