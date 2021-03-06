from math import log10
from mathlib import sieve, digits

def left_truncation(n):
	while n > 10:
		n = n % (10**int(log10(n)))
		yield n

def right_truncation(n):
	while n > 10:
		n = n // 10
		yield n



primes = set(sieve(1000000))		# Arbitrary limit


piter = iter(primes)
found = 0
sum = 0
while (found < 11):
	p = next(piter)
	if p in [2,3,5,7]: continue
	
	dgts = list(digits(p))
	# Left truncation: last digit gonna be left ==> (2,) 3, 5, 7
	if dgts[0] not in [2, 3, 5, 7]: continue
	# Right truncation: first digit gonna be left ==> 2, 3, 5, 7  
	# AND every digit gonna be last one ==> 1, 3, 7, 9 only (first digit can be 2 or 5 tho)
	if dgts[-1] not in [2, 3, 5, 7]: continue
	if any(d not in [1, 3, 7, 9] for d in dgts[:-1]): continue

	
	pt = list(left_truncation(p)) + list(right_truncation(p))
	if all(t in primes for t in pt):
		found += 1
		sum += p
		print(found, p)


print(sum)