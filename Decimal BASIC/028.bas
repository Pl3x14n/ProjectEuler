LET t = TIME      

LET diagonalsum = 0
LET spiralsize = 1001
 
FOR i = 1 TO spiralsize
   LET diagonalsum = diagonalsum + 2*i^2 - i + 1
   IF MOD(i,2) = 0 THEN LET diagonalsum = diagonalsum + 1
NEXT i

PRINT diagonalsum-1      !Die 1 in der Mitte wird doppelt gezählt
PRINT "(";TIME-t;" s )"

END
