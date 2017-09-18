def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10



pow = 1
found = False

while not found:

	for n in range(10**pow, 10**(pow+1) // 6):
		dgts = sorted(digits(n))

		for i in range(2, 7):
			if (dgts != sorted(digits(i * n))):
				break
		else:
			found = True
			break

	pow += 1
print(n)







