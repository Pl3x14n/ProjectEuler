REM Quadratic Diophantine Equation (short: QDE)
REM x² - dy² = 1

DEF qde(x,y,d) = x^2 - d*y^2 

DIM x(31),y(31)      !Das x und y der QDE
DIM b(31)            !Die Zahl des Kettenbruchs

LET t = TIME



FOR d = 2 TO 1000
   IF INT(SQR(d)) <> SQR(d) THEN
    
      LET cf$ = CONt_fraction$(SQR(d),30)
       
      FOR i = 1 TO 30
         LET k = POS(cf$,",")
         LET b(i) = VAL(cf$(1 : k-1))
         LET cf$ = cf$( k+1 : LEN(cf$))     
      NEXT i
      LET b(31) = VAL(cf$)
       
       
       
      LET i = 31
      DO UNTIL i = 1
       
         LET cf = 1
         FOR j = i TO 1 STEP -1
            LET cf = b(j) + 1/cf 
         NEXT j
          
         IF cf <> INT(cf) THEN  
            LET frac$ = number_to_fraction$(periode$(cf))
            LET x(i) = VAL(frac$(1:POS(frac$,"/")-1))
            LET y(i) = VAL( frac$( POS(frac$,"/")+1 : LEN(frac$)) )
         ELSE
            LET x(i) = cf
            LET y(i) = 1
         END IF           
          
          
         IF qde(x(i),y(i),d) = 1 THEN 
            PRINT STR$(d) ; ": ";STR$(x(i));"² - ";STR$(d);"*";STR$(y(i));"² = 1"
            EXIT DO
         END IF
          
          
         LET i = i-1
      LOOP 
       
      IF i = 1 THEN PRINT STR$(d) ; ": "
       
       
   END IF 
NEXT d




PRINT "Time: ";TIME-t;"s"










REM 0,274111111111111  -->  0,274p1
REM 5,34343434343434   -->  5,p34


FUNCTION periode$(n)
   local n$ , s$,p$ , i,j
    
   LET n$ = STR$(n)
    
    
   FOR i = POS(n$,".")+1 TO LEN(n$)   
      LET s$ = n$(i:i)
      LET p$ = ""
       
      FOR j = i+1 TO LEN(n$)
         IF n$(j:j) = s$ THEN 
            LET p$ = n$(i:j-1)
            EXIT FOR 
         END IF
      NEXT j
       
      IF p$ <> "" THEN
         FOR j = i TO LEN(n$) STEP LEN(p$)
            IF n$(j:j+LEN(p$)-1) <> p$(1:LEN(n$)-j+1) THEN EXIT FOR
         NEXT j
         IF j >= LEN(n$) THEN EXIT FOR
      END IF          
   NEXT i
    
    
   LET n$ = n$(1:i-1)
   IF p$ <> "" THEN LET n$ = n$ & "p" & p$
    
   LET periode$ = n$
END FUNCTION











REM vor der Periode     __
REM p einfügen --> 0,12234 = 0,122p34


FUNCTION number_to_fraction$(x$) 
   local h1,h2 , ganze,u,l,up,lp , upper,lower,g
    
   LET h1 = POS(x$,",")
   IF h1 = 0 THEN LET h1 = POS(x$,".")
   LET h2 = POS(x$,"p")
   IF h2 = 0 THEN LET h2 = LEN(x$)
    
    
   LET ganze = VAL(x$(1:h1-1))
    
   IF h1 + 1 <> h2 THEN   
      LET u = VAL(x$(h1+1:h2-1))
      LET l = 10 ^ LEN(x$(h1+1:h2-1))  
   END IF 
    
   IF h2 <> LEN(x$) THEN   
      LET up = VAL(x$(h2+1:LEN(x$)))
      LET lp = (10^LEN(x$(h2+1:LEN(x$))) - 1) *  10 ^ LEN(x$(h1+1:h2-1))
   END IF 
    
    
   IF u = 0 AND l = 0 AND up = 0 AND lp = 0 THEN 
      LET upper = ganze
      LET lower = 1
   ELSEIF u = 0 AND l = 0 THEN
      LET upper = up
      LET lower = lp
   ELSEIF up = 0 AND lp = 0 THEN
      LET upper = u
      LET lower = l
   ELSE
      LET upper = u*(lp/l) + up
      LET lower = lp
   END IF    
    
   LET upper = upper + ganze*lower
    
   LET g = gcd(upper,lower)
   LET upper = upper/g
   LET lower = lower/g
    
    
   LET number_to_fraction$ = STR$(upper) & "/" & STR$(lower)
    
    
END FUNCTION 


FUNCTION gcd(a,b)
   IF b = 0 THEN LET gcd = a ELSE LET gcd = gcd(b,MOD(a,b))
END FUNCTION 











FUNCTION cont_fraction$(x,steps)
   local cf$,s , i,f
    
   LET i = IP(x)
   LET f = FP(x)
   IF i<>0 THEN LET cf$ = cf$ & STR$(i) & ","
    
    
   DO UNTIL s = steps
      LET x = 1/f
      LET i = IP(x)
      LET f = FP(x)
       
      LET cf$ = cf$ & STR$(i) & ","
       
      LET s = s+1
   LOOP 
    
    
   LET cf$ = cf$(1:LEN(cf$)-1) 
    
    
    
   LET cont_fraction$ = cf$
END FUNCTION

END

