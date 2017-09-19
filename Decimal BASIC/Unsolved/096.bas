LET t = TIME  


FOR g = 1 TO 50
   LET s$ = ""
   LET i$ = "0" & STR$(g)
   LET file$ = "Grids\Grid " & i$(LEN(i$)-1:LEN(i$)) & ".txt"
    
   OPEN #1 : NAME file$ , ACCESS INPUT
   SET POINTER BEGIN 
   DO 
      LET i = i + 1
      INPUT #1 , IF MISSING THEN EXIT DO : l$
      LET s$ = s$ & l$
   LOOP 
   CLOSE #1
    
    
    
    
   CALL sudoku_solver(s$)
   PRINT "Sudoku " ; i$(LEN(i$)-1:LEN(i$)) ;
   IF grid(1,1)<>0 AND grid(1,2)<>0 AND grid(1,3)<>0 THEN
      PRINT " solved :"; grid(1,1) ;  grid(1,2) ; grid(1,3)
      LET solved = solved + 1
      LET sum = sum + grid(1,1)*100 + grid(1,2)*10 + grid(1,3)
   ELSE
      PRINT " unsolved"
   END IF 
    
NEXT g

PRINT REPEAT$("-",35)
PRINT "Solved: " ; solved ; "/ 50"
PRINT "Summe:";sum
PRINT "(";TIME-t;"s )"









DIM grid(9,9)
DIM canidates$(9,9)


 


SUB sudoku_solver(s$)
   local row , gap , i , r , g , startmiss , miss 
    
   MAT grid = ZER 
    
   LET row = 1
   FOR i = 1 TO 81
      LET gap = gap + 1
      IF gap = 10 THEN 
         LET row = row + 1
         LET gap = 1
      END IF
      LET grid(row,gap) = VAL(s$(i:i))
   NEXT i
    
    
    
   LET miss = 81     ! Noch fehlen alle Zahlen
   FOR r = 1 TO 9
      FOR g = 1 TO 9
         LET canidates$(r,g) = "123456789"
      NEXT g
   NEXT r
    
    
   FOR r = 1 TO 9
      FOR g = 1 TO 9
         IF grid(r,g) <> 0 then CALL new_number(r,g,miss)
      NEXT g
   NEXT r
    
    
   REM *********************
   REM ***** Das Lösen *****
   REM *********************
    
   DO UNTIL grid(1,1) <> 0 AND grid(1,2) <> 0 AND grid(1,3) <> 0
    
      LET startmiss = miss
       
      CALL method_b1(miss)
      CALL method_b2(miss)
       
      FOR row = 1 TO 9
         FOR gap = 1 TO 9
            IF grid(row,gap) = 0 THEN
               CALL method_c(row,gap,miss)
               CALL method_a(row,gap,miss)
            END IF
         NEXT gap
      NEXT row 
      IF miss = startmiss THEN EXIT DO
   LOOP
    
   REM *********************
   REM *********************
   REM *********************
    
    
    
END SUB












SUB method_a(r,g,m)
   local d$
    
   LET d$ = dedupe$("0" & canidates$(r,g))
   LET d$ = d$(2:LEN(d$))
    
   IF LEN(d$) = 1 THEN
      LET grid(r,g) = VAL(d$)
      CALL new_number(r,g,m)
   END IF
    
END SUB









SUB method_b1(miss)
   local row , gap , box , m$ , i , avaiable$
    
    
   FOR row = 1 TO 9
      LET m$ = missing$(row,1)
       
      FOR i = 1 TO LEN(m$)
         LET avaiable$ = ""
         FOR gap = 1 TO 9
            IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) = m$(i:i) THEN LET avaiable$ = avaiable$ & STR$(gap)
         NEXT gap
          
         IF LEN(avaiable$) = 1 THEN
            LET grid(row,VAL(avaiable$)) = VAL(m$(i:i))
            CALL new_number(row,VAL(avaiable$),miss)
         END IF
      NEXT i
       
   NEXT row
    
    
    
   FOR gap = 1 TO 9
      LET m$ = missing$(gap,2)
       
      FOR i = 1 TO LEN(m$)
         LET avaiable$ = ""
         FOR row = 1 TO 9
            IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) = m$(i:i) THEN LET avaiable$ = avaiable$ & STR$(row)
         NEXT row
          
         IF LEN(avaiable$) = 1 THEN
            LET grid(VAL(avaiable$),gap) = VAL(m$(i:i))
            CALL new_number(VAL(avaiable$),gap,miss)
         END IF
      NEXT i
       
   NEXT gap
    
    
    
   FOR box = 1 TO 9
      LET m$ = missing$(box,3)
       
      FOR i = 1 TO LEN(m$)
         LET avaiable$ = ""
          
         FOR row = (INT((box-1) / 3) + 1) *3 -2   TO  (INT((box-1) / 3) + 1) *3
            FOR gap = (MOD(box-1,3) + 1) *3 -2   TO   (MOD(box-1,3) + 1) *3
               IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) = m$(i:i) THEN LET avaiable$ = avaiable$ & STR$(row) & STR$(gap) & " "
            NEXT gap
         NEXT row
          
         IF LEN(avaiable$) = 3 THEN
            LET grid(VAL(avaiable$(1:1)),VAL(avaiable$(2:2))) = VAL(m$(i:i))
            CALL new_number(VAL(avaiable$(1:1)),VAL(avaiable$(2:2)),miss)
         END IF
      NEXT i
       
   NEXT box
    
    
END SUB







SUB method_b2(miss)
   local row, gap , i , m$ , avaiable$
    
   FOR row = 1 TO 9
      LET m$ = missing$(row,1)
       
      FOR gap = 1 TO 9
         IF grid(row,gap) = 0 THEN 
            FOR i = 1 TO LEN(m$)
               IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) <> "0" THEN LET avaiable$ = avaiable$ & m$(i:i)
            NEXT i
             
            IF LEN(avaiable$) = 1 THEN 
               LET grid(row,gap) = VAL(avaiable$)
               CALL new_number(row,gap,miss)
            END IF  
            LET avaiable$ = ""
         END IF    
      NEXT gap 
   NEXT row
    
    
    
   FOR gap = 1 TO 9
      LET m$ = missing$(gap,2)
       
      FOR row = 1 TO 9
         IF grid(row,gap) = 0 THEN 
            FOR i = 1 TO LEN(m$)
               IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) <> "0" THEN LET avaiable$ = avaiable$ & m$(i:i)
            NEXT i
             
            IF LEN(avaiable$) = 1 THEN 
               LET grid(row,gap) = VAL(avaiable$)
               CALL new_number(row,gap,miss)
            END IF  
            LET avaiable$ = ""
         END IF    
      NEXT row
   NEXT gap 
    
    
    
   FOR box = 1 TO 9
      LET m$ = missing$(box,3)
       
      FOR row = (INT((box-1) / 3) + 1) *3 -2   TO  (INT((box-1) / 3) + 1) *3
         FOR gap = (MOD(box-1,3) + 1) *3 -2   TO   (MOD(box-1,3) + 1) *3
            IF grid(row,gap) = 0 THEN 
               FOR i = 1 TO LEN(m$)
                  IF canidates$(row,gap)(VAL(m$(i:i)):VAL(m$(i:i))) <> "0" THEN LET avaiable$ = avaiable$ & m$(i:i)
               NEXT i
                
               IF LEN(avaiable$) = 1 THEN 
                  LET grid(row,gap) = VAL(avaiable$)
                  CALL new_number(row,gap,miss)
               END IF  
               LET avaiable$ = ""
            END IF            
         NEXT gap
      NEXT row
       
   NEXT box
    
END SUB  
 
 
 
 
 
SUB method_c(r,g,m)
   local c$ , c , row , gap , SAME , i
    
    
   LET c$ = canidates$(r,g)
   LET c = LEN( dedupe$("0" & c$)) -1 
    
    
    
   FOR gap = 1 TO 9
      IF canidates$(r,gap) = c$ THEN LET SAME = SAME + 1
   NEXT gap
    
   IF SAME = c THEN
      FOR i = 1 TO LEN(c$)
         FOR gap = 1 TO 9
            IF c$ <> canidates$(r,gap) AND c$(i:i) <> "0" THEN LET canidates$(r,gap)(VAL(c$(i:i)):VAL(c$(i:i))) = "0"
         NEXT gap
      NEXT i
   END IF
   LET SAME = 0 
    
    
    
    
    
   FOR row = 1 TO 9
      IF canidates$(row,g) = c$ THEN LET SAME = SAME + 1
   NEXT row
    
   IF SAME = c THEN
      FOR i = 1 TO LEN(c$)
         FOR row = 1 TO 9
            IF c$ <> canidates$(row,g) AND c$(i:i) <> "0" THEN LET canidates$(row,g)(VAL(c$(i:i)):VAL(c$(i:i))) = "0"
         NEXT row
      NEXT i  
   END IF
   LET SAME = 0      
    
    
    
    
    
   FOR row = INT((r+2)/3) *3 -2  TO  INT((r+2)/3) *3
      FOR gap = INT((g+2)/3) *3 -2  TO  INT((g+2)/3) *3
         IF canidates$(row,gap) = c$ THEN LET SAME = SAME + 1
      NEXT gap
   NEXT row
    
   IF SAME = c THEN
      FOR i = 1 TO LEN(c$)
         FOR row = INT((r+2)/3) *3 -2  TO  INT((r+2)/3) *3
            FOR gap = INT((g+2)/3) *3 -2  TO  INT((g+2)/3) *3
               IF c$ <> canidates$(row,gap) AND c$(i:i) <> "0" THEN LET canidates$(row,gap)(VAL(c$(i:i)):VAL(c$(i:i))) = "0"
            NEXT gap
         NEXT row
      NEXT i  
   END IF
    
    
END SUB
 











SUB deleting_canidates(r,g)
   local row,gap
    
   REM Dieser Sub löscht die Zahl aus dem Feld r|g
   REM in der Zeile r , der Spalte g und des Blockes
    
   FOR gap = 1 TO 9
      IF grid(r,gap) = 0 AND gap <> g THEN LET canidates$(r,gap)(grid(r,g):grid(r,g)) = "0"
       
   NEXT gap
    
   FOR row = 1 TO 9
      IF grid(row,g) = 0 AND row <> r THEN LET canidates$(row,g)(grid(r,g):grid(r,g)) = "0"
   NEXT row
    
   FOR row = INT((r+2)/3) *3 -2  TO  INT((r+2)/3) *3
      FOR gap = INT((g+2)/3) *3 -2  TO  INT((g+2)/3) *3
         IF grid(row,gap) = 0 AND NOT (row = r AND gap = g) THEN LET canidates$(row,gap)(grid(r,g):grid(r,g)) = "0"
      NEXT gap
   NEXT row
    
END SUB










SUB new_number(r,g,m)

   REM Wenn eine neue Zahl herausgefunden wird , dann...
   REM   - ... werden die Kanidaten der Zahl auf "0" gesetzt
   REM   - ... wird die Zahl aus den Kanidaten der selben Reihe/ der selben Spalte / des selben Blockes gelöscht
   REM   - ... wird die Variable "miss" um 1 vermindert
    
   LET canidates$(r,g) = "0"
    
   CALL deleting_canidates(r,g)
    
   LET m = m - 1
    
END SUB















FUNCTION missing$(LINE,version)
   local row , gap , startrow , endrow , startgap , endgap , m$ , i
    
   REM version = 1  -->  Reihe
   REM version = 2  -->  Spalte
   REM version = 3  -->  Box
   REM    Boxenverteilung :   1 2 3         1
   REM                        4 5 6         2
   REM                        7 8 9         3
    
    
   LET m$ = "123456789" 
    
   SELECT CASE version
    
   CASE 1
    
      FOR gap = 1 TO 9
         IF grid(LINE,gap) <> 0 THEN LET m$(grid(LINE,gap):grid(LINE,gap)) = "0"
      NEXT gap
       
   CASE 2
    
      FOR row = 1 TO 9
         IF grid(row,LINE) <> 0 THEN LET m$(grid(row,LINE):grid(row,LINE)) = "0"
      NEXT row
       
   CASE 3
    
      LET startrow = (INT((LINE-1) / 3) + 1) *3 -2
      LET endrow = startrow + 2
      LET startgap = (MOD(LINE-1,3) + 1) *3 - 2
      LET endgap = startgap + 2
       
      FOR row = startrow TO endrow
         FOR gap = startgap TO endgap
            IF grid(row,gap) <> 0 THEN LET m$(grid(row,gap):grid(row,gap)) = "0"
         NEXT gap
      NEXT row
       
   END SELECT
    
    
    
   LET m$ = dedupe$("0" & m$)
    
   LET missing$ = m$(2:LEN(m$))
    
END FUNCTION











FUNCTION dedupe$(n$)
   local i,j
    
   REM Diese Funktion löscht Dubletten (engl. "dedupe") aus dem String (Bsp. aus "454545454545" wird "45")
    
    
   DO UNTIL i > LEN(n$)
      LET i = i + 1
       
      LET j = i
      DO UNTIL j > LEN(n$)
         LET j = j + 1
          
         DO WHILE n$(i:i) = n$(j:j)
            LET n$(j:j) = ""
         LOOP
          
      LOOP
   LOOP
    
   LET dedupe$ = n$
END FUNCTION








END



