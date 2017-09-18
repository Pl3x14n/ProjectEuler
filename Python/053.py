from math import factorial

def ncr(n, k):
	return factorial(n) // factorial(n-k) // factorial(k)



ctr = 0

for n in range(1, 101):
	for r in range(1, n+1):
		if ncr(n, r) > 1E6: ctr += 1

print(ctr)
