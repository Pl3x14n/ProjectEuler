from math import sqrt

def is_prime(n):
	if (n % 2 == 0):
		return n == 2

	for f in range(3, int(sqrt(n)) + 1):
		if (n % f == 0): 
			return False

	return True


found = 1
n = 1
while found < 10001:
	n += 2
	if is_prime(n):
		found += 1


print(n)