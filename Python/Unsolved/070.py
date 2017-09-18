from math import sqrt
from time import time

def sieve(n):
	root = int(sqrt(n))
	primes = [True] * (n + 1)
	primes[0:2] = [False, False]
	for i in range(2, root + 1):
		if primes[i]:
			m = (n // i - i + 1)
			primes[i*i : n+1 : i] = [False] * m


	return (i for i, p in enumerate(primes) if p)



# Euler totient func, phi(n), returns amount of numbers smaller than n, which are coprime with n 
# This func generates the func values for all integers up to bound
def list_totients(bound):
	# If n = product(p_k ** a_k) with p being prime
	# Then phi(n) = n * product((p-1) / p)
	# These loops go over all primes lower then bound and apply the produc formula to all nums which are divisible by this prime

	totients = list(range(bound+1))
	primes = sieve(bound+1)

	for p in primes:
		for np in range(p, bound+1, p):
			totients[np] *= (p - 1)
			totients[np] //= p

	return totients


start = time()
BOUND = int(1E7)
tot = list_totients(BOUND)

min = (1, 0)
for n, tot in enumerate(tot[2:], 2):
	# a/b < c/d  if  a*d < b*c 
	if n * min[1] < tot * min[0]:
		if sorted(str(n)) == sorted(str(tot)):
			min = (n, tot)

print(min[0])
print(time() - start)