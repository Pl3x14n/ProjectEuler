from itertools import count
from mathlib import count_prime_factors


target = 4
counter = 0
for n in count(2):
	if count_prime_factors(n) == target:
		counter += 1
	else:
		counter = 0

	if counter == target:
		break

print(n - target + 1)