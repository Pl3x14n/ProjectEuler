from itertools import permutations 
from math import sqrt
from mathlib import is_prime, to_number


# Every 8- or 9-pandigital number is divisible by 3 (sum of digits eql to 36 or 45) 
pandigitals = permutations(range(7, 0, -1))		
pandigitals = (to_number(tpl) for tpl in pandigitals)


for p in pandigitals:
	if is_prime(p):
		break

print(p)
