from mathlib import divcount, triangle


n = 1
while divcount(triangle(n)) < 500:
	n += 1

print(triangle(n))

