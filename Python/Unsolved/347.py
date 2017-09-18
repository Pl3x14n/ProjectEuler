from math import log

def sieve(l):
	primes = [False, False, True] + [True, False] * (l // 2 - 1)
	i = 3
	while i*i < l:
		for xi in range(i*2, l, i):
			primes[xi] = False

		i += 2
		while(not primes[i]): i += 2

	return (i for i, p in enumerate(primes) if p)





def M(p, q):
	pq = p * q
	while pq * p < N:
		pq *= p

	# Decrease ps in pq and add qs, to find max pq-comb
	max_pq = pq
	while pq % (p*p) == 0:

		#Remove one p
		pq //= p

		#Add as many qs as possible
		while pq * q < N:
			pq *= q

		if pq > max_pq: max_pq = pq

	return max_pq





N = 10000000

primes = list(sieve(N // 2))
# print("Sieve done.")
nums = set()


for ip, p in enumerate(primes):
	maxq = N // p
	if (p > maxq): break

	for q in primes[ip+1:]:
		if q > maxq: break

		nums.add(M(p, q))

	# print(p, "completed.")

print(sum(nums))