from itertools import count
import time

def count_prime_factors(n):
	p = 2
	count = 0 if n % 2 == 0 else -1

	while  p*p < n:
		while n % p == 0:
			n //= p

		count += 1
		if n == 1: break

		if p == 2: p += 1
		while n % p != 0:			
			p += 2

	if n > 1: count += 1
	return count

start = time.time()
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
print(time.time() - start)