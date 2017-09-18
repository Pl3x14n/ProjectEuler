LET t = TIME

DIM digits(0 TO 9,3)

LET term1 = 1001
DO UNTIL term1 >= 9998
   IF prime(term1) = 1 THEN
      LET term1$ = STR$(term1)
       
      FOR i = 1 TO 4
         LET digits(VAL(term1$(i:i)),1) = digits(VAL(term1$(i:i)),1) + 1
      NEXT i
       
      FOR n1 = 0 TO 9
         IF (n1=VAL(term1$(1:1)) OR n1=VAL(term1$(2:2)) OR n1=VAL(term1$(3:3)) OR n1=VAL(term1$(4:4))) AND n1>=VAL(term1$(1:1)) THEN 
            FOR n2 = 0 TO 9
               IF n2=VAL(term1$(1:1)) OR n2=VAL(term1$(2:2)) OR n2=VAL(term1$(3:3)) OR n2=VAL(term1$(4:4))THEN
                  FOR n3 = 0 TO 9 
                     IF n3=VAL(term1$(1:1)) OR n3=VAL(term1$(2:2)) OR n3=VAL(term1$(3:3)) OR n3=VAL(term1$(4:4)) THEN
                        FOR n4 = 0 TO 9
                           IF n4=VAL(term1$(1:1)) OR n4=VAL(term1$(2:2)) OR n4=VAL(term1$(3:3)) OR n4=VAL(term1$(4:4)) THEN
                           !INPUT g
                            
                              LET term2$ = STR$(n1) & STR$(n2) & STR$(n3) & STR$(n4) 
                               
                              FOR i = 1 TO 4
                                 LET digits(VAL(term2$(i:i)),2) = digits(VAL(term2$(i:i)),2) + 1
                              NEXT i
                               
                              FOR i = 0 TO 9
                                 IF digits(i,1) <> digits(i,2) THEN EXIT FOR
                              NEXT i
                               
                               
                              IF term1$ <> term2$ AND i = 10 AND VAL(term2$)*2 - VAL(term1$) < 9999 AND prime(VAL(term2$)) = 1 THEN 
                                 LET term3$ = STR$(VAL(term2$)*2 - VAL(term1$))
                                 IF term3$(1:1) = term1$(1:1) OR term3$(1:1) = term1$(2:2) OR term3$(1:1) = term1$(3:3) OR term3$(1:1) = term1$(4:4) THEN
                                    IF term3$(2:2) = term1$(1:1) OR term3$(2:2) = term1$(2:2) OR term3$(2:2) = term1$(3:3) OR term3$(2:2) = term1$(4:4) THEN
                                       IF term3$(3:3) = term1$(1:1) OR term3$(3:3) = term1$(2:2) OR term3$(3:3) = term1$(3:3) OR term3$(3:3) = term1$(4:4) THEN
                                          IF term3$(4:4) = term1$(1:1) OR term3$(4:4) = term1$(2:2) OR term3$(4:4) = term1$(3:3) OR term3$(4:4) = term1$(4:4) THEN
                                           
                                             FOR i = 1 TO 4
                                                LET digits(VAL(term3$(i:i)),3) = digits(VAL(term3$(i:i)),3) + 1
                                             NEXT i
                                              
                                             FOR i = 0 TO 9
                                                IF digits(i,1) <> digits(i,3) THEN EXIT FOR
                                             NEXT i
                                             IF i = 10 AND prime(VAL(term3$)) = 1 THEN 
                                              
                                                LET terms = terms + 1
                                                PRINT terms;"           ";term1$;" ";term2$;" ";term3$
                                                IF terms = 2 THEN
                                                   PRINT "--------------------------------------------"
                                                   PRINT term1$;term2$;term3$
                                                   PRINT "(";TIME-t;" s )"
                                                   EXIT DO 
                                                END IF
                                                 
                                             END IF 
                                              
                                          END IF
                                       END IF
                                    END IF 
                                    FOR i = 0 TO 9 
                                       LET digits(i,3) = 0
                                    NEXT i 
                                 END if 
                                  
                                  
                              END IF
                           END if 
                           FOR i = 0 TO 9 
                              LET digits(i,2) = 0
                           NEXT i 
                        NEXT n4
                     END IF 
                  NEXT n3
               END IF 
            NEXT n2
         END if 
      NEXT n1
       
       
       
   END IF 
   FOR i = 0 TO 9 
      LET digits(i,1) = 0
   NEXT i 
   LET term1 = term1 + 2
LOOP 


10
    
   FUNCTION prime(n)
      IF MOD(n,2)=0 THEN
         IF n=2 THEN LET prime = 1 ELSE LET prime = 0
      ELSE
         FOR i=3 TO SQR(n) STEP 2
            IF MOD(n,i)=0 THEN EXIT FOR 
         NEXT i
         IF i<=SQR(n) THEN LET prime = 0 ELSE LET prime = 1
      END IF
   END FUNCTION 
    
    
    
    
END
