from math import sqrt

# Sieve of Eratostenes
def sieve(l):
	primes = [False, False, True] + [True, False] * (l // 2 - 1)
	i = 3
	while i*i < l:
		for xi in range(i*2, l, i):
			primes[xi] = False

		i += 2
		while(not primes[i]): i += 2

	return (i for i, p in enumerate(primes) if p)


print(sum(sieve(int(2e6))))



