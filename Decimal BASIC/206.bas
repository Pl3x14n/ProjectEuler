OPTION ARITHMETIC Decimal_High

LET t = TIME 

FOR root = CEIL(SQR(19293949596979899)) TO 1 STEP -2
   LET square = (root*10)^2
   LET square$ = STR$(square)
    
   IF square$(1:1) = "1" THEN 
      IF square$(3:3) = "2" THEN
         IF square$(5:5) = "3" THEN
            IF square$(7:7) = "4" THEN
               IF square$(9:9) = "5" THEN
                  IF square$(11:11) = "6" THEN
                     IF square$(13:13) = "7" THEN
                        IF square$(15:15) = "8" THEN
                           IF square$(17:17) = "9" THEN
                              PRINT root*10;"  (";square$;")"
                              EXIT FOR 
                           END IF
                        END IF
                     END IF
                  END IF
               END IF
            END IF
         END IF
      END IF
   END IF
    
NEXT root

PRINT "(";TIME-t;"s )"
END