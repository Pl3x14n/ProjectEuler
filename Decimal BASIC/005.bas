LET t = TIME

LET solution = 1
FOR n = 1 TO 20
   LET solution = lcm(solution,n)
NEXT n
PRINT solution
PRINT "( ";TIME-t;" s )"


FUNCTION lcm(a,b)
   local z,n,r,gcd
   LET z = a
   LET n = b
   DO 
      LET r = MOD(z,n)
      IF r = 0 THEN EXIT DO 
       
      LET z = n
      LET n = r
   LOOP  
    
   LET gcd = n
    
   LET lcm = ABS(a*b)/gcd
    
END FUNCTION

END
