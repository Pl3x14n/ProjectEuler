REM Die Gleichung n^3 + n^2*p lässt sich auf n^2*(n + p) kürzen.
REM Also muss sowohl n^2 als auch n+p eine Kubikzahl sein.
REM D.h. p ist die Differenz zweier Kubikzahlen (z.B. a^3 und b^3)
REM Bei der Äquivalenzumformung von a^3 - b^3 kommt man zum Ergebnis,
REM dass a = b+1. Somit muss p die Differenz zweier aufeinanderfolgenden
REM Kubikzahlen sein. 

LET t = TIME 


LET i = 1
DO 
   LET i = i + 1
   LET p = i^3-((i-1)^3)
   IF p > 10^6 THEN EXIT DO 
   IF prime(p) = 1 THEN LET pro = pro + 1
LOOP 

PRINT pro
PRINT "(";TIME-t;"s )"


FUNCTION prime(n)
   local i
   IF MOD(n,2)=0 THEN
      IF n=2 THEN LET prime = 1 ELSE LET prime = 0
   ELSE
      FOR i=3 TO SQR(n) STEP 2
         IF MOD(n,i)=0 THEN EXIT FOR 
      NEXT i
      IF i<=SQR(n) THEN LET prime = 0 ELSE LET prime = 1
   END IF
END FUNCTION 

END
