from mathlib import is_prime

found = 1
n = 1
while found < 10001:
	n += 2
	if is_prime(n):
		found += 1


print(n)