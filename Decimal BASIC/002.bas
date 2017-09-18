LET t = TIME

LET LIMIT=4000000
LET z1=1
LET z2=1
DO 
   LET zn=z1+z2                                                 
   LET z1=z2
   LET z2=zn
   IF zn>LIMIT THEN EXIT DO                !Wenn das Limit erreicht ist, dann Ende
   IF MOD(zn,2)=0 THEN LET sum=sum+zn      !Nur wenn die nächste Zahl gerade ist, wird addiert 
LOOP
LET sum=sum+2                              !Da die Schleife mit 3 beginnt, aber 2 eine gerade Zahl von Fibonacci ist,
PRINT sum;"      (";TIME-t;" s )"             !muss diese noch addiert werden


END
