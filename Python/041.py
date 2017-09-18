from itertools import permutations 
from math import sqrt


def is_prime(n):
	if (n % 2 == 0):
		return n == 2

	for f in range(3, int(sqrt(n)) + 1):
		if (n % f == 0): 
			return False

	return True


def to_number(dgts):
	return sum(d * 10**(len(dgts)-1-i) for i, d in enumerate(dgts))


# Every 8- or 9-pandigital number is divisible by 3 (sum of digits eql to 36 or 45) 
pandigitals = permutations(range(7, 0, -1))		
pandigitals = (to_number(tpl) for tpl in pandigitals)


for p in pandigitals:
	if is_prime(p):
		break

print(p)
