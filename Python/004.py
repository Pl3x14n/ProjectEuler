for i in range(999, 99, -1):
	n = i * 1000 + int(str(i)[::-1])
	
	for f in range(999, 99, -1):
		if (n % f == 0):
			if (100 < n/f < 1000):
				print(n)
				break
	else:
		continue

	break

