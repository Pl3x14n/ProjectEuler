LET t = TIME 

DIM buchs$(0 TO 1000)

LET buchs$(1) = "one"
LET buchs$(2) = "two"
LET buchs$(3) = "three"
LET buchs$(4) = "four"
LET buchs$(5) = "five"
LET buchs$(6) = "six"
LET buchs$(7) = "seven"
LET buchs$(8) = "eight"
LET buchs$(9) = "nine"
LET buchs$(10) = "ten"
LET buchs$(11) = "eleven"
LET buchs$(12) = "twelve"
LET buchs$(13) = "thirteen"
LET buchs$(14) = "fourteen"
LET buchs$(15) = "fifteen"
LET buchs$(16) = "sixteen"
LET buchs$(17) = "seventeen"
LET buchs$(18) = "eighteen"
LET buchs$(19) = "nineteen"
LET buchs$(20) = "twenty"
LET buchs$(30) = "thirty"
LET buchs$(40) = "forty"
LET buchs$(50) = "fifty"
LET buchs$(60) = "sixty"
LET buchs$(70) = "seventy"
LET buchs$(80) = "eighty"
LET buchs$(90) = "ninety"
LET buchs$(1000) = "onethousand"


FOR i = 1 TO 1000
   LET i$ = STR$(i)
    
   IF i<=20 THEN 
      LET letters = letters + LEN(buchs$(i))
   ELSEIF i<100 THEN
      LET letters = letters + LEN(buchs$(VAL(i$(1:1)) * 10))     
      LET letters = letters + LEN(buchs$(VAL(i$(2:2)) * 1))
   ELSEIF i<1000 THEN
      LET letters = letters + 3 + 7                                ! 3 = "AND"; 7 = "HUNDRED"
      IF i/100 = INT(i/100) THEN LET letters = letters - 3         ! Doch kein "AND"
      LET letters = letters + LEN(buchs$(VAL(i$(1:1)) * 1))
       
      IF VAL(i$(2:2))*10 + VAL(i$(1:1)) <= 20 THEN
         LET letters = letters + LEN(buchs$(VAL(i$(2:3))))
      ELSE  
         LET letters = letters + LEN(buchs$(VAL(i$(2:2)) * 10))
         LET letters = letters + LEN(buchs$(VAL(i$(3:3)) * 1))
      END IF 
   ELSE
      LET letters = letters + LEN(buchs$(i))
   END IF
    
NEXT i

PRINT letters
PRINT "(";TIME-t;" s )"



END

