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


def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10


def cycle(l):
	for i in range(0, len(l)):
		yield l[i:len(l)] + l[0:i]





primes = list(sieve(1000000))

count = 4 	# 2 3 5 7
for p in primes[4:]:
	dgts = list(digits(p))	# reversed order!
	if any(d not in [1,3,7,9] for d in dgts):	# each digit will be at the end, so primes with even digits or a 5 can be discarded
		continue

	for nd in cycle(dgts):	# skip first, its p
		n = sum(d * 10**i for i, d in enumerate(nd))
		if n not in primes:
			break
	else:
		count += 1
		print(count, p)

print(count)



