from itertools import count
from mathlib import is_prime


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



