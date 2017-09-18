OPTION ARITHMETIC RATIONAL

LET t = TIME 

LET fraction_n = 100

DIM give_nth_element(fraction_n+10)


FOR i = 1 TO fraction_n STEP 3
   LET give_nth_element(i) = 1
   LET give_nth_element(i+1) = (INT(i/3)+1)*2
   LET give_nth_element(i+2) = 1
NEXT i

LET answer = sum_continued_fractions(fraction_n)

LET s$ = STR$(answer)

FOR i = 1 TO LEN(s$)
   IF s$(i:i) = "/" THEN EXIT FOR
NEXT i

LET z = VAL(s$(1:i-1))
LET n = VAL(s$(i+1:LEN(s$)))

FOR i = 1 TO LEN(STR$(MAX(z,n)))
   LET bruchstrich$ = bruchstrich$ & "-"
NEXT i
 

PRINT z
PRINT " ";bruchstrich$
PRINT n
PRINT 
PRINT 
PRINT "--------------------------------"
PRINT digitalsum(z)
PRINT "(";TIME-t;" s)"
 

 
FUNCTION digitalsum(a)
   local a$,i,quer
   LET a$ = STR$(a)
    
   FOR i = 1 TO LEN(a$)
      LET quer = quer + VAL(a$(i:i)) 
   NEXT i 
    
   LET digitalsum = quer
    
END FUNCTION 




FUNCTION sum_continued_fractions(n)
   LOCAL sum, index
    
   IF n > 1 THEN
      LET sum = 1/give_nth_element(n-1)
       
      FOR index = n-2 TO 1 STEP -1
         LET sum = 1/(sum + give_nth_element(index))
      NEXT index
   ELSE
      LET sum = 0
   END IF
    
   LET sum_continued_fractions = 2 + sum
END FUNCTION



END 
