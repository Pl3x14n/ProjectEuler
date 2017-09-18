OPTION ARITHMETIC Decimal_High

LET t = TIME 

LET num = 3
LET den = 2

FOR expansion = 2 TO 1000
   IF LEN(STR$(num)) > LEN(STR$(den)) THEN LET solu = solu + 1
   LET den = num + den
   LET num = 2*(den-num) + num 
NEXT expansion

PRINT solu
PRINT "(";TIME-t;"s )"
END
