LET t = TIME 

DIM lexo(fact(9))
LET per = 9
LET a = 2

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
                                                      LET l = l + 1
                                                      LET lexo(l) = b*10^8 + c*10^7 + d*10^6 + e*10^5 + f*10^4 + g*10^3 + h*10^2 + i*10^1 + j 
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






LET le = 10^6-2*fact(9)
PRINT lexo(le)+2*10^9
PRINT "(";TIME-t;" s )"

END
 
 
