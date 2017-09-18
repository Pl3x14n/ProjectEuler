
LET t = TIME 

DIM produkte$(10),digits(0 TO 9)

LET max_rpro$ = "0"


FOR x =  1 TO 9999

   LET n = 1
   LET akt_len = 0
   LET r_pro$ = ""
   MAT digits = ZER 
   FOR i = 1 TO 10
      LET produkte$(i) = ""
   NEXT i
    
   DO    
      LET produkte$(n) = STR$(x*n)
      LET akt_len = akt_len + LEN(produkte$(n)) 
      IF akt_len >=9 THEN EXIT DO 
      LET n = n + 1
   LOOP
    
   FOR i = 1 TO n
      LET r_pro$ = r_pro$ & produkte$(i)
   NEXT i  
    
   FOR i = 1 TO LEN(r_pro$)
      LET digits(VAL(r_pro$(i:i))) = digits(VAL(r_pro$(i:i))) + 1
   NEXT i
    
   FOR i = 1 TO 9
      IF digits(i) <> 1 THEN EXIT FOR
   NEXT i
    
   IF i = 10 AND digits(0) = 0 THEN 
      PRINT r_pro$,x;n
      IF VAL(r_pro$) > VAL(max_rpro$) THEN  LET max_rpro$ = r_pro$
   END IF 
    
NEXT x

PRINT "------------------------------------------------"
PRINT max_rpro$
PRINT "(";TIME-t;" s )"
END
