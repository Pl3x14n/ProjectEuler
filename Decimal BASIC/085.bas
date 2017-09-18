
LET t = TIME 

DEF triangle(n) = n*(n+1)/2

LET minabs = 10000

FOR x = 1 TO 100
 
   FOR y = 1 TO x
      LET r = triangle(x)*triangle(y)
       
      IF r > 2*10^6 THEN 
         LET a1 = ABS(2*10^6-r)
         LET a2 = ABS(2*10^6-r2)
          
         IF minabs > MIN(a1,a2) THEN
            LET minabs = MIN(a1,a2)
            IF minabs = a1 THEN 
               LET minarea = x*y
            ELSE
               IF y = 1 THEN LET minarea = (x-1)^2 ELSE LET minarea = x*(y-1)
            END IF 
         END IF  
      END IF 
       
      LET r2 = r
   NEXT y
    
NEXT x

PRINT minarea
PRINT "(";TIME-t;"s )"
END
