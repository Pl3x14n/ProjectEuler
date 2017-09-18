OPTION ARITHMETIC Decimal_High

LET t = TIME

DIM a(100,3)
LET LIMIT = 30

FOR bas = 2 TO 100
   FOR EXP = 2 TO 40
      LET be = bas^EXP
      IF digitalsum(be) = bas THEN 
         LET aa = aa + 1     
         LET a(aa,1) = be
         LET a(aa,2) = bas
         LET a(aa,3) = EXP        
      END IF 
   NEXT EXP
NEXT bas


 
FOR i = 1 TO aa-1
   FOR j = i+1 TO aa
      IF a(i,1) > a(j,1) THEN
         swap a(i,1), a(j,1)
         swap a(i,2), a(j,2)
         swap a(i,3), a(j,3)
      END IF
   NEXT j
NEXT i
 
FOR i = 1 TO LIMIT 
   PRINT i,a(i,1);"(";a(i,2);"^";a(i,3);")"
NEXT i  
PRINT "---------------------------------"
PRINT  a(LIMIT,1)
PRINT "(";TIME-t;"s )"
 


FUNCTION digitalsum(a)
   local a$,i,quer
   LET a$ = STR$(a)
    
   FOR i = 1 TO LEN(a$)
      LET quer = quer + VAL(a$(i:i)) 
   NEXT i 
    
   LET digitalsum = quer
    
END FUNCTION 

END
