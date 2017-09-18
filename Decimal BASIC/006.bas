LET t = TIME

LET n = 100

LET sum_of_the_squares = n*(n+1)*(2*n+1)/6
LET square_of_the_sum = (n*(n+1)/2)^2
LET diffrence = square_of_the_sum - sum_of_the_squares 

PRINT square_of_the_sum;"-";sum_of_the_squares;" = " ;diffrence
PRINT "(";TIME-t;" s )"
END
