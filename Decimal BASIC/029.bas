OPTION ARITHMETIC Decimal_High

LET t = TIME 

LET maxibe = 100
DIM be(2 TO maxibe,2 TO maxibe)

FOR a = 2 TO maxibe
   FOR b = 2 TO maxibe
    
      LET be(a,b) = a^b
       
      FOR i = 2 TO maxibe
         FOR j = 2 TO maxibe
            IF be(a,b) = be(i,j) AND (a<>i OR b<>j) THEN 
               LET gleich = 1 
               GOTO 10
            ELSE 
               LET gleich = 0 
            END IF 
         NEXT j
      NEXT i
10
         LET anzahl = anzahl + 1 - gleich  
      NEXT b
   NEXT a
    
   PRINT anzahl 
   PRINT "(";TIME-t;" s )"
    
END