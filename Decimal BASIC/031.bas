LET t = TIME 

LET betrag = 200 


FOR hundreds = f(100) TO 0 STEP -1
   FOR fifties = f(50) TO 0 STEP -1
      FOR twenties = f(20)  TO 0 STEP -1
         FOR tenner = f(10) TO 0 STEP -1
            FOR fiver = f(5) TO 0 STEP -1
               FOR twosome = f(2)  TO 0 STEP -1
                  FOR singles = f(1) TO 0 STEP -1
                   
                     REM Lösung schreiben = 1 ; Nur neue Lösung in solu hinzuzählen = 2
                     CALL p(solu,2)                  
                      
                  NEXT singles
               NEXT twosome
            NEXT fiver
         NEXT tenner
      NEXT twenties
   NEXT fifties
NEXT hundreds

PRINT REPEAT$("-",40)
PRINT solu + 1                ! 2$ = 2$
PRINT "(";TIME-t;"s )"





SUB p(s,v)
   local a$ , s$
    
   SELECT CASE v
    
   CASE 1     
      IF hundreds*100 + fifties*50 + twenties*20 + tenner*10 + fiver*5 + twosome*2 + SINgles = betrag then 
         LET a$ = ""
         LET a$ = a$ & STR$(hundreds) & "x 100$  +  "
         LET a$ = a$ & STR$(fifties) & "x 50$  +  "
         LET a$ = a$ & STR$(twenties) & "x 20$  +  "
         LET a$ = a$ & STR$(tenner) & "x 10$  +  "
         LET a$ = a$ & STR$(fiver) & "x 5$  +  "
         LET a$ = a$ & STR$(twosome) & "x 2$  +  "
         LET a$ = a$ & STR$(singles) & "x 1$  +  "
         LET a$( LEN(a$)-2 : LEN(a$) )= ""
          
         LET s = s + 1
         LET s$ = "0000" & STR$(s)
         LET s$ = s$( LEN(s$)-4 : LEN(s$) )
         PRINT s$ ; " :    " ; a$
      END IF
   CASE 2
      IF hundreds*100 + fifties*50 + twenties*20 + tenner*10 + fiver*5 + twosome*2 + SINgles = betrag THEN LET s = s + 1
   END SELECT 
    
END SUB 









FUNCTION f(n)

   SELECT CASE n
   CASE 100
      LET f = IP( betrag / 100 )
   CASE 50
      LET f = IP(  (betrag - hundreds*100) / 50 )
   CASE 20
      LET f = IP(  (betrag - (hundreds*100+fifties*50)) / 20 )
   CASE 10
      LET f = IP(  (betrag - (hundreds*100+fifties*50+twenties*20)) / 10 )
   CASE 5
      LET f = IP(  (betrag - (hundreds*100+fifties*50+twenties*20+tenner*10)) / 5 )
   CASE 2
      LET f = IP(  (betrag - (hundreds*100+fifties*50+twenties*20+tenner*10+fiver*5)) / 2 )
   CASE 1
      LET f = IP(  (betrag - (hundreds*100+fifties*50+twenties*20+tenner*10+fiver*5+twosome*2)) )
   END SELECT
    
END FUNCTION 

END

