LET t = TIME

FOR year = 1901 TO 2000
   FOR month = 1 TO 12
      IF wochentag$(1,month,year) = "Sonntag" THEN 
               LET m$ = "0" & STR$(month)
               LET DATUM$ = "01." & m$(LEN(m$)-1:LEN(m$)) & "." & STR$(year)
               PRINT datum$
         LET sundays = sundays + 1
      END IF
   NEXT month
NEXT year

PRINT REPEAT$("-",30)
PRINT sundays
PRINT "(";TIME-t;"s )"



FUNCTION wochentag$(day,month,year)
   local q,m,j,k,h
    
   LET q = day
   LET m = month
   IF m < 3 THEN LET m = m + 12
   LET j = INT(year/100)
   LET k = MOD(year,100)
   IF m > 12 THEN LET k = k - 1
   IF k < 0 THEN 
      LET k = k + 100
      LET j = j - 1
   END IF 
    
   LET h = q + INT((m+1)*26/10 )
   LET h = h + k + INT(k/4) + INT(j/4) - 2*j   
   LET h = MOD(h,7)
    
   SELECT CASE h
   CASE 0 
      LET wochentag$ = "Samstag"
   CASE 1
      LET wochentag$ = "Sonntag"
   CASE 2
      LET wochentag$ = "Montag"
   CASE 3 
      LET wochentag$ = "Dienstag"
   CASE 4
      LET wochentag$ = "Mittwoch"
   CASE 5
      LET wochentag$ = "Donnerstag"
   CASE 6 
      LET wochentag$ = "Freitag"
   END SELECT    
    
END FUNCTION  
END 
