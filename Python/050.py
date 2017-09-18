from itertools import accumulate, tee
from time import time as t

def sieve(l):
	primes = [False, False, True] + [True, False] * (l // 2 - 1)
	i = 3
	while i*i < l:
		for xi in range(i*2, l, i):
			primes[xi] = False

		i += 2
		while(not primes[i]): i += 2

	return (i for i, p in enumerate(primes) if p)




limit = 1000000
primegens = tee(sieve(limit), 2)
primelist = list(primegens[0])
primeset = set(primegens[1])
cumulative = [0] + list(accumulate(primelist))

max = (2, 0, 1)

for end in range(max[2], len(primelist)):
	for start in range(end-max[2]-1, -1, -1):
		s = cumulative[end] - cumulative[start]
		if s > limit: break		# break inner loop once the subset yields a sum bigger than the limit
		if s in primeset:
			max = (s, start, end-start)
			# print(max[0], primelist[max[1]:max[1]+max[2]])

print(max[0], max[2])
