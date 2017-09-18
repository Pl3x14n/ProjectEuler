sum = 1
n = 1
for sz in range(3, 1002, 2):
	for i in range(0, 4):
		# Difference between dia values is sidelen-1 --> n
		n += sz-1
		sum += n

print(sum)