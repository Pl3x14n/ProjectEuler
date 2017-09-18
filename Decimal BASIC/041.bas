
LET t = TIME 

DIM digit(0 TO 9)
FOR i = 7654321 TO 2 STEP - 2                         ! Da 9-/8-pandigitale Zahlen eine durch drei teilbare Quersumme(45/36) haben,
   LET i$ = STR$(i)                                   ! ist die größt-mögliche n-pandigitale Zahl, die auch eine Primzahl sein kann, 7654321
   MAT digit = ZER
    
    
   FOR n = 1 TO LEN(i$)
      LET digit(VAL(i$(n:n))) = digit(VAL(i$(n:n))) + 1
   NEXT n
    
   FOR n = 1 TO 9 
      IF digit(n) <> 1 THEN EXIT FOR
   NEXT n
    
   IF n-1 = LEN(i$) THEN  
      FOR j = 3 TO SQR(i) STEP 2
         IF MOD(i,j) = 0 THEN EXIT FOR  
      NEXT j
   END IF 
    
   IF j>SQR(i) THEN EXIT FOR  
NEXT i

PRINT i
PRINT "(";TIME-t;"s )"

END
