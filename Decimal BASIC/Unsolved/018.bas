LET problem = 18     ! 18 or 67

DEBUG ON

IF problem = 18 THEN
   LET LINES = 15
   OPEN #1 : NAME "018.txt" , ACCESS INPUT 
ELSEIF problem = 67 THEN
   LET LINES = 100
   OPEN #1 : NAME "067.txt" , ACCESS INPUT 
END IF

DIM numbers(-5 TO LINES + 5,-5 TO LINES + 5)

DO 
   LET i = i + 1
   INPUT #1, IF MISSING THEN EXIT DO : LINE$ 
    
   FOR j = 1 TO i*2 + i-1 STEP 3
      LET numbers(i,(j+2)/3) = VAL(LINE$(j:j+1))
   NEXT j
LOOP 
CLOSE #1




LET high = 1
FOR i = 1 TO lines
   IF numbers(LINES,high) < numbers(LINES,i) THEN 
      LET high$ = STR$(i) & ","
      LET high = i
   ELSEIF numbers(LINES,high) = numbers(LINES,i) THEN
      LET high$ = high$ & STR$(i) & ","
   END IF 
NEXT i   



DO 
   LET komma = POS(high$,",")
   IF komma = 0 THEN EXIT DO
    
   LET i = VAL(high$(1:komma-1))
   LET solution$ = solution$ & STR$(MAX_path(i)) & ","
   LET high$(1:komma) = ""
LOOP 

PRINT solution$


FUNCTION MAX_path(n)
   local LINE , sum1,sum2,sum3,sum4,sum5,sum6,sum7,sum8 , mp , mpath
    
   FOR LINE = LINES TO 1 STEP -1
      LET sum1 = numbers(LINE,n)  +  numbers(LINE-1,n-1) + numbers(LINE-2,n-2) + numbers(LINE-3,n-3)
      LET sum2 = numbers(line,n)  +  numbers(line-1,n-1) + numbers(line-2,n-2) + numbers(line-3,n-2)
      LET sum3 = numbers(line,n)  +  numbers(line-1,n-1) + numbers(line-2,n-1) + numbers(line-3,n-2)
      LET sum4 = numbers(line,n)  +  numbers(line-1,n-1) + numbers(line-2,n-1) + numbers(line-3,n-1)
      LET sum5 = numbers(line,n)  +  numbers(line-1,n)   + numbers(line-2,n-1) + numbers(line-3,n-2)
      LET sum6 = numbers(line,n)  +  numbers(line-1,n)   + numbers(line-2,n-1) + numbers(line-3,n-1)
      LET sum7 = numbers(line,n)  +  numbers(line-1,n)   + numbers(line-2,n)   + numbers(line-3,n-1)
      LET sum8 = numbers(line,n)  +  numbers(line-1,n)   + numbers(line-2,n)   + numbers(line-3,n)
       
      LET mp = MAX(sum1,sum2)
      LET mp = MAX(mp,sum3)
      LET mp = MAX(mp,sum4)
      LET mp = MAX(mp,sum5)
      LET mp = MAX(mp,sum6)
      LET mp = MAX(mp,sum7)
      LET mp = MAX(mp,sum8)
       
      LET mpath = mpath + numbers(LINE,n)   
      IF mp = sum1 OR mp = sum2 OR mp = sum3 OR mp = sum4 THEN LET n = n-1                               
       
   NEXT LINE  
    
   LET max_path = mpath
    
END FUNCTION

 
END
