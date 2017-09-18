
LET t = TIME

DIM teiler(7)
LET teiler(1) = 2
LET teiler(2) = 3
LET teiler(3) = 5
LET teiler(4) = 7
LET teiler(5) = 11
LET teiler(6) = 13
LET teiler(7) = 17


LET per = 9

FOR a = 1 TO per
   FOR b = 0 TO per
      IF  b <> a THEN
         FOR c = 0 TO per
            IF c <> b AND c <> a THEN 
               FOR d = 0 TO per
                  IF d <> c AND d <> b AND d <> a THEN 
                     FOR e = 0 TO per
                        IF e <> d AND e <> c AND e <> b AND e <> a THEN 
                           FOR f = 0 TO per
                              IF f <> e AND f <> d AND f <> c AND f <> b AND f <> a THEN 
                                 FOR g = 0 TO per
                                    IF g <> f AND g <> e AND g <> d AND g <> c AND g <> b AND g <> a THEN
                                       FOR h = 0 TO per
                                          IF h <> g AND h <> f AND h <> e AND h <> d AND h <> c AND h <> b AND h <> a THEN 
                                             FOR i = 0 TO per
                                                IF i <> h AND i <> g AND i <> f AND i <> e AND i <> d AND i <> c AND i <> b AND i <> a THEN 
                                                   FOR j = 0 TO per
                                                      IF j <> i AND j <> h AND j <> g AND j <> f AND j <> e AND j <> d AND j <> c AND j <> b AND j <> a THEN 
                                                       
                                                         IF MOD((b*100 + c*10 + d),teiler(1)) = 0 THEN 
                                                            IF MOD((c*100 + d*10 + e),teiler(2)) = 0 THEN 
                                                               IF MOD((d*100 + e*10 + f),teiler(3)) = 0 THEN 
                                                                  IF MOD((e*100 + f*10 + g),teiler(4)) = 0 THEN 
                                                                     IF MOD((f*100 + g*10 + h),teiler(5)) = 0 THEN 
                                                                        IF MOD((g*100 + h*10 + i),teiler(6)) = 0 THEN 
                                                                           IF MOD((h*100 + i*10 + j),teiler(7)) = 0 THEN    
                                                                              LET sum = sum + a*10^9 + b*10^8 + c*10^7 + d*10^6 + e*10^5 + f*10^4 + g*10^3 + h*10^2 + i*10^1 + j
                                                                           END IF  
                                                                        END IF   
                                                                     END IF   
                                                                  END IF   
                                                               END IF   
                                                            END IF   
                                                         END IF                          
                                                      END IF     
                                                       
                                                   NEXT j  
                                                END IF                         
                                             NEXT i
                                          END IF                       
                                       NEXT h 
                                    END IF                   
                                 NEXT g      
                              END IF           
                           NEXT f   
                        END IF           
                     NEXT e  
                  END IF         
               NEXT d   
            END IF     
         NEXT c    
      END IF 
   NEXT b
NEXT a 



PRINT sum
PRINT "(";TIME-t;" s )"



END
