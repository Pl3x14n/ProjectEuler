LET t = TIME 

FOR i = 3 TO 7*fact(9)
   LET i$=STR$(i)
   LET sum = 0
    
   FOR j = 1 TO LEN(i$)
      LET sum = sum + FACT(VAL(i$(j:j)))
   NEXT j
    
   IF sum = i THEN LET endsum = endsum + sum
    
NEXT i

PRINT endsum
PRINT "(";TIME-t;" s )"
END
