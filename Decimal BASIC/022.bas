
LET t = TIME 

DIM NAMEline$(50),names$(5500),wordvalue(5500)
OPEN #1: NAME("Input022.txt"), ACCESS INPUT
SET POINTER BEGIN

DO 
   LET LINES = LINES + 1
   INPUT #1,IF MISSING THEN EXIT DO: nameline$(LINES)
LOOP 

CLOSE #1



LET names = 1
FOR i = 1 TO LINES
   FOR j = 1 TO LEN(nameline$(i))
    
      IF nameline$(i)(j:j) = "_" THEN
         LET names = names + 1
      ELSE
         LET names$(names) = names$(names) & nameline$(i)(j:j)
      END IF 
       
   NEXT j
NEXT i


FOR i = 1 TO NAMEs

   FOR j = 1 TO LEN(names$(i))
      LET wordvalue(i) = wordvalue(i) + ORD(names$(i)(j:j)) - 64
   NEXT j
    
NEXT i


FOR i = 1 TO names
   LET a$ = ""
   FOR j = 1 TO 10-LEN(names$(i))
      LET a$ = a$ & " "
   NEXT j
   LET names$(i) = names$(i) & a$
NEXT i



FOR i = 1 TO names-1
   FOR j = i+1 TO NAMEs
    
      FOR x = 1 TO 10
         IF ORD(names$(i)(x:x)) > ORD(names$(j)(x:x)) THEN
            swap names$(i),names$(j) 
            swap wordvalue(i),wordvalue(j)
            EXIT FOR 
         ELSEIF ORD(names$(i)(x:x)) < ORD(names$(j)(x:x)) THEN
            EXIT FOR         
         END IF 
      NEXT x
       
   NEXT j
NEXT i


FOR i = 1 TO names
   LET sum = sum + i*wordvalue(i)
NEXT i


PRINT sum
PRINT "(";TIME-t;" s )"



END
