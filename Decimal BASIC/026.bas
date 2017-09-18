LET t = TIME

DIM q(1000),r(0 TO 1000)  


FOR d = 2 TO 1000
   MAT r = ZER
   MAT q = ZER
    
   LET radix=10                           
   LET a = 1
   LET b = d  
   LET r(0)=a                                
   LET k=1                                               
   DO                                        
      LET q(k)=int(r(k-1)*radix/b)           
      LET r(k)=mod(r(k-1)*radix,b)           
      LET j=0                                
      DO UNTIL j=k-1 OR r(j)=r(k)            
         LET j=j+1                           
      LOOP                                   
      IF r(j)=r(k) THEN EXIT DO              
      LET k=k+1                              
   LOOP                                      
    
   LET rc = k-j
   IF q(k) = 0 THEN LET rc = 0 
    
   IF rc>rcmax THEN 
      LET rcmax = rc 
      LET dmax = d
   END IF
NEXT d

PRINT dmax;"  (";rcmax;")"
PRINT "(";TIME-t;" s )"



END
