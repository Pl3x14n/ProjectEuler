# In a m * n - grid, the way from the UL to the BR is m + n steps long.
# Additionally you know, that you have to move m-times right (R) and n-times down (D)
# I.e.: RRDRDD (3x3-grid). To calculate all possible combinations of that, replace the D with nothing in mind.
# --> RR-R-- (3x3-grid), and the question is, how many combinations there are, to place m (R)'s on (m+n) places.
# --> nCr(m+n, m)

from math import factorial

def ncr(n, k):
	return factorial(n) // factorial(n-k) // factorial(k)

print(ncr(40, 20))