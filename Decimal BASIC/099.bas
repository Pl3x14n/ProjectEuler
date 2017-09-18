DIM potenz(1001,2)

LET t = TIME

OPEN #1: NAME "Input099.txt"
SET POINTER BEGIN

DO 
   LET p = p + 1
   INPUT #1, IF MISSING THEN EXIT DO: line$
    
   FOR j = 1 TO LEN(line$)
      IF line$(j:j) = "_" THEN EXIT FOR 
   NEXT j
    
   LET potenz(p,1) = VAL(line$(1:j-1))
   LET potenz(p,2) = VAL(line$(j+1:LEN(line$)))
    
LOOP

CLOSE #1

FOR i = 1 TO p-1
   IF potenz(i,2) * LOG(potenz(i,1)) > MAXpotenz THEN 
      LET maxpotenz = potenz(i,2) * LOG(potenz(i,1))
      LET MAXline = i
   END if 
NEXT i

PRINT "Reihe:";MAXline;"   (";potenz(MAXline,1);"^";potenz(MAXline,2);")"
PRINT "(";TIME-t;"s )"
END
