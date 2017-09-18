from math import sqrt

def t(n): return n*(n+1)//2

def divcount(n):
	c = (1 if sqrt(n).is_integer() else 2)
	for d in range(2, int(sqrt(n)+1)):
		if (n % d == 0):
			c += 2

	return c


n = 1
while divcount(t(n)) < 500:
	n += 1

print(t(n))

