LET t = TIME 

LET MAX = 2000

DEF pent(n) = n*(3*n-1)/2


FOR j = 1 TO MAX           
   FOR k = j+1 TO 2*MAX-1
      LET p_j = pent(j)
      LET p_k = pent(k)
       
      LET diff = p_k - p_j
      LET p = ROUND(SQR(ROUND(diff*2/3,5) + ROUND(0.16667^2,5)),5) + 0.16667
      IF p = INT(p) THEN 
         LET sum = p_j + p_k
         LET p2 = ROUND(SQR(ROUND(sum*2/3,5) + ROUND(0.16667^2,5)),5) + 0.16667
         IF p2 = INT(p2) THEN GOTO 10
      END if 
       
   NEXT k
NEXT j 

10
   LET d =  p_k - p_j
   PRINT d;"    (";p_j;",";p_k;")" 
   PRINT "(";TIME-t;" s )"
END
