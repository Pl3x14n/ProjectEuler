OPTION ARITHMETIC Decimal_High

LET t = TIME 

DIM words$(2100),wordline$(50)


OPEN #1: NAME "Input042.txt", ACCESS INPUT 
SET #1: POINTER BEGIN

DO 
   LET LINES = LINES + 1
   INPUT #1,IF MISSING THEN EXIT DO: wordline$(LINES)
LOOP 

CLOSE #1



LET words = 1
FOR i = 1 TO LINES
   FOR j = 1 TO LEN(wordline$(i))
    
      IF wordline$(i)(j:j) = "_" THEN
         LET words = words + 1
      ELSE
         LET words$(words) = words$(words) & wordline$(i)(j:j)
      END IF 
       
   NEXT j
NEXT i
 

FOR i = 1 TO words 
   LET word_value = 0
   FOR j = 1 TO LEN(words$(i))
      LET word_value = word_value + ORD(words$(i)(j:j)) - 64
   NEXT j
    
   LET v = SQR((word_value*8+1)/4)-0.5 
   IF v = INT(v) THEN
      PRINT words$(i),word_value,v
      LET triangle_words = triangle_words + 1
   END if 
    
NEXT i

PRINT "-----------------------------------"
PRINT triangle_words
PRINT "(";TIME-t;" s )"
END
