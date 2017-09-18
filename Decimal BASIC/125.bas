

LET t = TIME 

DEF sumsquare(k,n) = (2*n^3 + 3*n^2 + n)/6  -  (2*(k-1)^3 + 3*(k-1)^2 + k-1)/6 
LET MAX = 10^8
DIM solutions(200)

DO 
   LET start = start + 1
   IF sumsquare(start-1,start) > MAX THEN EXIT DO 
LOOP 
LET maxn = start-1

FOR n = 1 TO maxn-1
   FOR n2 = n+1 TO maxn
      IF sumsquare(n,n2) < MAX AND palindrom(STR$(sumsquare(n,n2))) = 1 THEN 
         LET solu = solu + 1
         LET  solutions(solu) = sumsquare(n,n2)
      END IF  
   NEXT n2
NEXT n

PRINT "Auswertung abgeschlossen"

FOR i = 1 TO solu-1
   FOR j = i+1 TO solu
      IF solutions(i) > solutions(j) THEN swap solutions(i),solutions(j)
   NEXT j
NEXT i

PRINT "Sortierung abgeschlossen"
PRINT REPEAT$("-",30)

FOR i = 1 TO solu
   IF solutions(i) <> solutions(i+1) THEN
      LET s = s + 1
      PRINT s;":   ";solutions(i)
      LET sum = sum + solutions(i)
   END IF 
NEXT i

PRINT REPEAT$("-",30)
PRINT sum
PRINT "(";TIME-t;"s )"





FUNCTION palindrom(n$)
   Local i 
    
   FOR i = 1 TO INT(LEN(n$)/2)
      IF n$(i:i) <> n$(LEN(n$)-i+1:LEN(n$)-i+1) THEN EXIT FOR  
   NEXT i
   IF i-1 = INT(LEN(n$)/2) THEN LET palindrom = 1 ELSE LET palindrom = 0
    
END FUNCTION 


END
