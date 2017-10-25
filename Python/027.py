from mathlib import sieve


primes = set(sieve(500000))
formula = lambda n, a, b: n*n + a*n + b
max = (0, 0, 0)		# (n, a, b)

# First two produced primes: b and (a+b+1)
# So: b is prime, (a+b+1) is prime and a+b+1 >= 2
# Thus, first, b >= 1-a
# Since (a+b+1) is prime, (a+b) is even, and since b is odd, a has to be odd too
for a in range(-999, 1000, 2):
	for b in (p for p in primes if (1-a) < p < 1000):
		n = 1
		while (formula(n, a, b) in primes):
			n += 1

		if n > max[0]:
			max = (n, a, b)

# print(max)
print(max[1] * max[2])
