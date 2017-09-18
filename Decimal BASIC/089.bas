
LET t = TIME 

DIM ara_roem$(7,2),akt_zahl$(1100)
LET ara_roem$(1,1) = "1"
LET ara_roem$(2,1) = "5"
LET ara_roem$(3,1) = "10"
LET ara_roem$(4,1) = "50"
LET ara_roem$(5,1) = "100"
LET ara_roem$(6,1) = "500"
LET ara_roem$(7,1) = "1000"
LET ara_roem$(1,2) = "I"
LET ara_roem$(2,2) = "V"
LET ara_roem$(3,2) = "X"
LET ara_roem$(4,2) = "L"
LET ara_roem$(5,2) = "C"
LET ara_roem$(6,2) = "D"
LET ara_roem$(7,2) = "M"

OPEN #1: NAME "Input089.txt"
SET POINTER BEGIN 

DO 
   LET romans = romans + 1
   INPUT #1,IF MISSING THEN EXIT DO: akt_zahl$(romans)
LOOP 

CLOSE #1


FOR zahl = 1 TO romans-1
   LET r$ = make_shorter$(akt_zahl$(zahl))
   LET saved_characters = saved_characters + (LEN(akt_zahl$(zahl)) - LEN(r$))
NEXT zahl

PRINT saved_characters
PRINT "(";TIME-t;"s )"






FUNCTION make_shorter$(zahl$)
   local roemisch$,i,j
   LET roemisch$ = zahl$ 
    
   LET i = 0
   DO 
      LET i = i + 1
      IF roemisch$(i:i) = roemisch$(i+1:i+1) AND roemisch$(i:i) = roemisch$(i+2:i+2) AND roemisch$(i:i) = roemisch$(i+3:i+3) AND roemisch$(i:i) <> "M" THEN 
         FOR j = 1 TO 7
            IF roemisch$(i:i) = ara_roem$(j,2) THEN EXIT FOR 
         NEXT j
          
         LET roemisch$ = roemisch$(1:i-1) & ara_roem$(j,2) & ara_roem$(j+1,2) & roemisch$(i+4:LEN(roemisch$))
      END IF 
      IF LEN(roemisch$)-3 <= i THEN EXIT DO  
   LOOP 
    
    
   LET i = 0
   DO 
      LET i = i + 1
      IF roemisch$(i:i) = roemisch$(i+2:i+2) AND roemisch$(i:i) <> "M" THEN
       
         IF roemisch$(i+1:i+1) = "I" THEN
            IF roemisch$(i:i) = "V" THEN LET roemisch$ = roemisch$(1:i-1) & "IX" & roemisch$(i+3:LEN(roemisch$))
         ELSEIF roemisch$(i+1:i+1) = "X" THEN
            IF roemisch$(i:i) = "L" THEN LET roemisch$ = roemisch$(1:i-1) & "XC" & roemisch$(i+3:LEN(roemisch$))
         ELSEIF roemisch$(i+1:i+1) = "C" THEN
            IF roemisch$(i:i) = "D" THEN LET roemisch$ = roemisch$(1:i-1) & "CM" & roemisch$(i+3:LEN(roemisch$))
         END IF 
          
      END IF    
      IF LEN(roemisch$)-2 <= i THEN EXIT DO 
   LOOP 
   LET make_shorter$ = roemisch$
END FUNCTION
END
