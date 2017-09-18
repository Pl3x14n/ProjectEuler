LET t=TIME  

FOR a=1 TO 10000-1
   LET b = o(a)-a
   IF o(b)-b = a AND a<b THEN
      PRINT a,b
      LET sum = sum + a + b 
   END IF 
NEXT a 

PRINT " ----------------------------"
PRINT sum
PRINT "(";TIME-t;" s )"

FUNCTION o(n)
   local i,ts
    
   FOR i = 1 TO SQR(n)
      IF MOD(n,i)=0 THEN LET ts = ts + i + n/i                
   NEXT i
   IF SQR(n) = INT(SQR(n)) THEN LET ts = ts - SQR(n)
    
   LET o = ts
END FUNCTION 

END
