OPTION ARITHMETIC Decimal_High

LET t = TIME

FOR i = 2 TO 99
   IF SQR(i) <> INT(SQR(i)) THEN 
      LET wurzel$ = STR$(SQR(i))
       
      FOR j = 3 TO 101                                  ! Das Komma nicht mitzählen
         LET quersumme = quersumme + VAL(wurzel$(j:j))
      NEXT j
      LET quersumme = quersumme + VAL(wurzel$(1:1))
       
   END IF 
NEXT i

PRINT quersumme
PRINT "(";TIME-t;"s )"

END
