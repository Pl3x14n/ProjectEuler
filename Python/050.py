from itertools import accumulate, tee
from mathlib import sieve


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
