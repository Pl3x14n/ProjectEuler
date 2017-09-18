OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR basis = 1 TO 9
   FOR exponent = 1 TO 25
      IF LEN(STR$(basis^exponent)) = exponent THEN LET integers = integers + 1
   NEXT exponent
NEXT basis

PRINT integers
PRINT "(";TIME-t;"s )"
 
END
