LET t = TIME

LET LIMIT=999
FOR i=1 TO LIMIT 
   IF MOD(i,3)=0 OR MOD(i,5)=0 THEN LET sum=sum+i 
NEXT i
PRINT sum;"   (";TIME-t;" s )"
END