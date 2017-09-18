coins = [1, 2, 5, 10, 20, 50, 100, 200]

# Divide and Conquer
def split(target, max):
	if (target == 0): return 1

	count = 0
	for c in coins:
		if (c > target or c > max): break
		count += split(target - c, c)
	return count


print(split(200, 200))