REM Quadratic Diophantine Equation (short: QDE)
REM x² - dy² = 1

DEF qde(x,y,d) = x^2 - d*y^2 

DIM x(30),y(30)      !Das x und y der QDE
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
         DO 
          
            LET cf = 1
            FOR j = i TO 1 STEP -1
               LET cf = b(j) + 1/cf 
            NEXT j
             



             
            LET i = i-1
         LOOP 
          
         PRINT 
          
          
       
       
       
       
       
   END IF 
NEXT d




PRINT "Time: ";TIME-t;"s"








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