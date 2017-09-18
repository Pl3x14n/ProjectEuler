LET t = TIME 

FOR deno = 1 TO 12000
   FOR nomi = CEIL(deno/3) TO INT(deno/2)
      IF nomi > deno/3 AND nomi < deno/2 THEN 
         IF gcd(nomi,deno) = 1  THEN LET frac = frac + 1     
      end if
   NEXT nomi
NEXT deno

PRINT frac
PRINT "(";TIME-t;"s )"

FUNCTION gcd(a,b)
   IF b = 0 THEN LET gcd = a ELSE LET gcd = gcd(b,MOD(a,b))
END FUNCTION 


END
