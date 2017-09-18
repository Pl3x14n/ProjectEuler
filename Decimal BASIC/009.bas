LET t = TIME 

FOR a = 1 TO 333
   LET b = a
   DO UNTIL b = 666 
      LET b = b + 1
      LET c = 1000 - a - b
      IF a^2 + b^2 = c^2 THEN EXIT FOR 
   LOOP 
NEXT a

PRINT a;"*";b;"*";c;" = ";a*b*c
PRINT "(";TIME-t;" s )"
END
