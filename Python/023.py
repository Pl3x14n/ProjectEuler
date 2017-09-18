from math import sqrt

def divsum(n):
	s = 1
	for d in range(2, int(sqrt(n))+1):
		if (n % d == 0):
			s += d + n//d
	if (sqrt(n).is_integer()):
		s -= int(sqrt(n))
	return s



limit = 28123

abs = set()
sum = 0
for n in range(1, limit):
	if n < divsum(n):
		abs.add(n)
	if all((n-a) not in abs for a in abs):
		sum += n

print(sum)
