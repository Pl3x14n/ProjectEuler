from mathlib import digits

pows = [d*d*d*d*d for d in range(10)]

total = 0
for i in range(2, 500000):
	ds = digits(i)
	s = sum([pows[d] for d in ds])
	if s == i: 
		total += i

print(total)