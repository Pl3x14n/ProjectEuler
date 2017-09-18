from math import sqrt

def divsum(n):
	s = 1
	for d in range(2, int(sqrt(n))+1):
		if (n % d == 0):
			s += d + n//d
	if (sqrt(n).is_integer()):
		s -= int(sqrt(n))
	return s



dsums = {n: divsum(n) for n in range(2, 10000)}

sum = 0
for n, s in dsums.items():
	if (n == s or s == 1): continue
	if (s < len(dsums) and dsums[s] == n):
		sum += n
		
print(sum)