from math import factorial, sqrt


# ----- Sieve of Eratostenes ----------------------------------------------------------------------
def sieve(n):
	root = int(sqrt(n))
	primes = [True] * (n + 1)
	primes[0:2] = [False, False]
	for i in range(2, root + 1):
		if primes[i]:
			m = (n // i - i + 1)
			primes[i*i : n+1 : i] = [False] * m


	return (i for i, p in enumerate(primes) if p)



# ----- Is Prime ----------------------------------------------------------------------------------
def is_prime(n):
	if (n % 2 == 0):
		return n == 2

	for f in range(3, int(n**0.5) + 1):
		if (n % f == 0): 
			return False

	return (n > 1)




# ----- Get Prime Factors (as tuples) -------------------------------------------------------------

def prime_factors(n):
	p = 2;
	while p*p <= n:
		px = 0
		while n % p == 0:
			n //= p
			px += 1

		if px != 0: yield (p, px)
		if n == 1: break

		if p == 2: p += 1
		while n % p != 0:			
			p += 2

	if n > 1:
		yield(n, 1)
		


# ----- Count distinct prime factors -------------------------------------------------------------
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






# ----- Nth polygonal number -----------------------------------------------------------------------
def triangle(n):
	return n*(n+1) // 2

def square(n):
	return n*n

def pentagonal(n):
	return n*(3*n-1) // 2

def hexagonal(n):
	return n*(2*n-1)

def heptagonal(n):
	return n*(5*n-3) // 2

def octagonal(n):
	return n*(3*n-2)


def is_pentagonal(p):
	return (((24*p+1)**0.5 + 1)/6).is_integer()




# ----- Returns digits of n (reversed!) -----------------------------------------------------------
def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10


# ----- Turns a iterable of digits into a number --------------------------------------------------
def to_number(dgts, reversed=False):
	if (reversed):
		return sum(d * 10**i for i, d in enumerate(dgts))
	else:
		return sum(d * 10**(len(dgts)-1-i) for i, d in enumerate(dgts))




# ----- Checks if n is pandigital (contains every digit from a to b exactly) ---------------------
def is_pandigital(n):
	dgts = sorted(digits(n))
	return all(dgts[i+1] == d+1 for i, d in enumerate(dgts[:-1]))
				




# ----- Checks if string s is palindromic (s == reverse(s)) --------------------------------------
def is_palindromic(s):
	return all(s[i] == s[-i-1] for i in range(0, len(s)//2))




# ----- Checks if 1/d gives an recurring cycle (base 10) -----------------------------------------
def is_cyclic(d):
	while(d % 2 == 0): d //= 2
	while(d % 5 == 0): d //= 5
	return d != 1



# ----- N choose K ------------------------------------------------------------------------------
def ncr(n, k):
	return factorial(n) // factorial(n-k) // factorial(k)



# ----- Counts divisors of n --------------------------------------------------------------------
def divcount(n):
	c = (1 if sqrt(n).is_integer() else 2)
	for d in range(2, int(sqrt(n)+1)):
		if (n % d == 0):
			c += 2
	return c



# ----- Sums proper(!) divisors of n ------------------------------------------------------------
def divsum(n):
	s = 1
	for d in range(2, int(sqrt(n))+1):
		if (n % d == 0):
			s += d + n//d
	if (sqrt(n).is_integer()):
		s -= int(sqrt(n))
	return s




# ----- Greatest Common Divisor -----------------------------------------------------------------
def gcd(a, b): 
	while(b): a, b = b, a%b
	return a



# ----- Least Common Multiple -------------------------------------------------------------------
def lcm(a, b):
	return a * b // gcd(a, b)