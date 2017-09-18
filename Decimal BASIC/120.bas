OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR a = 3 TO 1000
   LET sum = sum  +  2 * (a-2+MOD(a,2)) / 2 * a
NEXT a


PRINT sum
PRINT "(";TIME-t;"s )"
END
