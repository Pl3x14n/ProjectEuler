from itertools import groupby

def sieve(l):
	primes = [False, False, True] + [True, False] * (l // 2 - 1)
	i = 3
	while i*i < l:
		for xi in range(i*2, l, i):
			primes[xi] = False

		i += 2
		while(not primes[i]): i += 2

	return (i for i, p in enumerate(primes) if p)


def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10


# Get all 4-digit primes
primes = [p for p in sieve(10000) if p > 1000]

# Link digits with primes
pdgts = [(p, sorted(digits(p))) for p in primes]		
pdgts = sorted(pdgts, key=lambda tpl: tpl[1])	


# Group by digits (and in grp select the prime only, since the digits are already in the key)
dgtgrps = [(key, list(itm[0] for itm in grp)) for key, grp in groupby(pdgts, lambda tpl: tpl[1])]

# Only groups with 3+ items interesting
dgtgrps = [g for g in dgtgrps if len(g[1]) >= 3]

# Discard the digits
primegrps = [g[1] for g in dgtgrps] 


# Find a grp of 3 with equal differences 
for grp in primegrps:
	for fi, first in enumerate(grp[0:-2]):
		for si, second in enumerate(grp[fi+1:-1]):
			for third in grp[si+1:]: 
				if (third-second == second-first):
					print(first, second, third)




