a, b = 0, 1
s = 0
while(b < 4000000):
	a, b = b, a+b
	if (a % 2 == 0):
		s += a

print(s)