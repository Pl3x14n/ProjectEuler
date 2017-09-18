OPTION ARITHMETIC RATIONAL

LET t = TIME


FOR i = 1 TO 1000

   LET p = i^i
    
   LET sum = sum + i^i
   LET sum = MOD(sum,10^10)
    
NEXT i

PRINT sum
PRINT "(";TIME-t;" s )"
END
