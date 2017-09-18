def prime_factors(n):
	f = 2 
	while (n > 1):
		while(n % f == 0):
			n /= f
			yield f

		f += 1 if f == 2 else 2


print(list(prime_factors(600851475143))[-1])

