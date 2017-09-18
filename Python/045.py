from itertools import count
from math import sqrt


# Equality:
# T(a) = H(c)
# a*(a+1)/2			=	c(2c-1)
# (aa + a)/2		=	2cc - c
# aa + a 			=	4cc - 2c
# aa + a +1/4-1/4	=   4cc - 2c + 1/4-1/4
# (a+1/2)**2 - 1/4	=	(2c - 1/2)**2 - 1/4
# (a+1/2)**2 		=	(2c - 1/2)**2 
# a + 1/2			=	2c - 1/2
# a = 2c - 1

# This is true for EVERY int c, so checking that is redundant


def pentagonal_index(p):
	n = ((24*p+1)**0.5 + 1) / 6
	return int(n) if n.is_integer() else -1

def h(n):
	return n*(2*n-1)


# Iterating over the Hexagonals makes the most sense, cause below a limit are less hexagonals than pentagonals and triangle nums
found = 0
for c in count(1):
	n = h(c)
	b = pentagonal_index(n)

	if (b != -1):		# H(c) is pentagonal
		a = 2*c - 1
		print((n, a, b, c))
		found += 1

	if (found == 3):
		break
