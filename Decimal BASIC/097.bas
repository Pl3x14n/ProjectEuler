LET t = TIME

LET mersenne = 1
FOR i = 1 TO 7830457
   LET mersenne = MOD(mersenne,10^10) * 2
NEXT i
LET mersenne = mersenne*28433 + 1

PRINT MOD(mersenne,10^10)
PRINT "(";TIME-t;"s )"

END