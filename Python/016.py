n = 1 << 1000

def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10

print(sum(digits(n)))
