known = {1: 1}


for n in range(2, 1000000):
	chain = [n]
	while (n not in known.keys()):
		if (n % 2 == 0):
			n = n // 2
		else:
			n = 3*n + 1
		
		chain.append(n)

	for i, e in enumerate(chain):
		known[e] = len(chain) - i + known[n] - 1


known = sorted(known.items(), key=lambda p: p[1])
print(known[-1])