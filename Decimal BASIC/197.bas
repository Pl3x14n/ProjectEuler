REM Da BASIC als Exponent eine Ganze Zahl braucht,
REM müssen wir das eben mit dem Logarithmus umgehen :)

DEF f(x) = INT( 10^(LOG10(2)*(30.403243784-x^2) ) )  / 10^9

REM Die Schleife muss nicht bis 10^12 durchlaufen, da
REM ca. ab n = 550 (genau 517) die ersten neun Ziffern sich nicht mehr verändern

LET t = TIME

LET un = -1
FOR n = 1 TO 550 
   LET un = f(un)
   !PRINT  n;":   ";ROUND(un + f(un),9)
NEXT n

!PRINT "-------------------------------"

PRINT ROUND(un + f(un),9)
PRINT "(";TIME-t;"s )"

END