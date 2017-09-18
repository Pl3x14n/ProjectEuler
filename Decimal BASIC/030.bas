LET t = TIME 

FOR i=2 TO 999999                       
   LET digit$ = STR$(i)                         ! i als String
   LET sumz = 0
   FOR j = 1 TO LEN(digit$)
      LET digit = VAL(digit$(j:j))
      LET sumz = sumz + digit^5
   NEXT j
    
   IF sumz=i THEN                               !Bei Gleichheit
      LET sum=sum+i                             !zusammenzählen
      PRINT i
   END IF
NEXT i

PRINT "----------------"
PRINT sum
PRINT "(";TIME-t;" s )"
END