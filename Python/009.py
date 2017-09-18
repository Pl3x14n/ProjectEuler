from math import sqrt

for a in range(2, 334):
	for b in range(a+1, 1000-a*2):
		c = sqrt(a*a + b*b)
		if c.is_integer():
			if a + b + int(c) == 1000:
				print(a * b * int(c))

