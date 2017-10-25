from itertools import groupby
from mathlib import sieve, digits


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




