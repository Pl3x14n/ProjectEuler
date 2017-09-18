from itertools import product, groupby, count
from functools import reduce


def is_prime(n):
	if (n % 2 == 0):
		return n == 2

	for f in range(3, int(n**0.5) + 1):
		if (n % f == 0): 
			return False

	return (n > 1)



def to_pattern(dgts):
	return reduce(lambda curr, n: curr+n, (("*" if d == -1 else str(d)) for d in dgts))



famlen = 6

for l in count(2):
	# All l-digit nums, -1 represents wildcard, skip even nums
	nums = (n for n in product(range(-1, 10), repeat=l) if n[0] != 0 and n[-1] % 2 != 0)	

	# Filter (min one wildcard, max l-1)
	nums = (n for n in nums if 1 <= n.count(-1) < l)	

	#To string 
	numstrs = [to_pattern(list(n)) for n in nums]

	# Group by pattern (wildcards at same spots means same pattern)
	wcpattern = lambda ns: ns.translate(str.maketrans("0123456789", "."*10))
	numpatterns = [wcpattern(ns) for ns in numstrs]
	patterngrps = groupby(zip(numstrs, numpatterns), lambda tpl: tpl[1])
	patterngrps = ((key, list(itm[0] for itm in grp)) for key, grp in patterngrps)

	# Discard grps with len < famlen
	patterngrps = (grp for grp in patterngrps if len(grp[1]) >= famlen)
	print(list(patterngrps))

	# Check each grp, insert digit for wildcards and check if prime
	for key, grp in patterngrps:
		if (key.endswith("*")) else "0123456789"
		for wc in digits:
			nums = (int(n.replace("*", wc)) for n in grp)
			primes = [n for n in nums if is_prime(n)]
			if (len(primes) == famlen):
				print(primes)
				break
		else: continue
		break
	else: continue
	break
