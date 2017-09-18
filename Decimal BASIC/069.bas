REM Damit n/phi(n) groß wird, muss phi(n) klein sein.
REM Damit phi(n) klein ist, muss n eine Primfaktorzerlegung,
REM mit möglichst vielen verschiedenen Primfaktoren, haben.
REM Dadurch haben die Vielfachen und n einen ggT <> 1

REM Nun werden alle Primzahlen multipliziert bis 
REM das Produkt > 1.000.000 ist
 
LET t = TIME 

PRINT 2*3*5*7*11*13*17
PRINT "(";TIME-t;"s )"

END
