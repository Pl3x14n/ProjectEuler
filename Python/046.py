from itertools import count
from math import sqrt

def is_prime(n):
	if (n % 2 == 0):
		return n == 2

	for f in range(3, int(sqrt(n)) + 1):
		if (n % f == 0): 
			return False

	return True



primes = [2, 3, 5, 7]
for n in count(9, 2):
	if (is_prime(n)):
		primes.append(n)
		continue

	# if n = p + 2 * s then s = (n - p) / 2
	squares = ((n - p) // 2 for p in primes)
	conj = any(sqrt(sq).is_integer() for sq in squares)

	if not conj:
		print(n)
		break



