ex = []
for a in range(2, 101):
	for b in range(2, 101):
		v = a**b
		if (v not in ex):
			ex.append(v)

print(len(ex))