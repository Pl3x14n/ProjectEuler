LET t = TIME


LET n = 1000

DO UNTIL n = 100
   LET n = n - 1
    
   LET product$ = STR$(n) & reverse$(STR$(n))
    
   FOR divisor = 100 TO 999
      IF MOD(VAL(product$) , divisor) = 0 AND LEN( STR$( VAL(product$)/divisor)) = 3 AND divisor < VAL(product$)/divisor THEN 
         PRINT product$ & "  =  " & STR$(divisor) & " x " & STR$(VAL(product$)/divisor)
         IF solutions = 0 THEN LET biggest$ = product$ 
         LET solutions = solutions + 1 
      END IF 
   NEXT divisor   
LOOP 



LET n = 1000

DO UNTIL n = 100
   LET n = n - 1
    
   LET product$ = STR$(n) & reverse$(STR$(n))
   LET product$(INT(LEN(product$)/2) : INT(LEN(product$)/2)) = ""
    
   FOR divisor = 100 TO 999
      IF MOD(VAL(product$) , divisor) = 0 AND LEN( STR$( VAL(product$)/divisor)) = 3 AND divisor < VAL(product$)/divisor THEN 
         PRINT product$ & "  =  " & STR$(divisor) & " x " & STR$(VAL(product$)/divisor)
         IF solutions = 0 THEN LET biggest$ = product$ 
         LET solutions = solutions + 1
      END IF 
   NEXT divisor
    
LOOP 


PRINT REPEAT$("-",40)
PRINT solutions ; "Solutions"
PRINT " The biggest one is " ; biggest$
PRINT " (";STR$(TIME-t);" s)"




FUNCTION reverse$(n$)
   local i , r$
    
   FOR i = LEN(n$) TO 1 STEP -1
      LET r$ = r$ & n$(i:i)
   NEXT i
    
   LET reverse$ = r$
END FUNCTION 



END
