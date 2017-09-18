from math import sqrt

peris = [0] * 1001

for a in range(2, 334):
	for b in range(a+1, 1000-a*2):
		c = sqrt(a*a + b*b)
		if a + b + c > 1000: continue
		if c.is_integer():
			peris[a + b + int(c)] += 1

print(peris.index(max(peris)))
				

