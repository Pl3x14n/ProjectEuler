LET t = TIME 

DEF h(n) = n*(2*n-1)

DO 
   LET hn = hn + 1
   LET hpt = h(hn)
   LET pn = ROUND(SQR(hpt*2/3 + 0.16667^2),5)+0.16667
   IF pn = INT(pn) THEN
      PRINT hpt;" =  T";STR$(hn*2-1);" = P";STR$(pn);" = H";STR$(hn)
      LET n = n + 1
   END IF
   IF n = 3 THEN EXIT DO 
LOOP
PRINT "(";TIME-t;" s )"
END
