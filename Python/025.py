from math import log10

a, b = 0, 1
n = 0 

while log10(b)+1 < 1000:
	a, b = b, a+b
	n += 1

print(n+1)