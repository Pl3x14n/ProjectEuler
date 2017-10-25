from functools import reduce

# Def subsets
hor = (0, 1, 2, 3, lambda i: i%20 < 17)
ver = (0, 20, 40, 60, lambda i: i < (20-3)*20)
dia1 = (0, 21, 42, 63, lambda i: hor[4](i) and ver[4](i))
dia2 = (0, 19, 38, 57, lambda i: i%20 > 3 and ver[4](i))

# Read nums
content = open("..\Inputs\Input011.txt", "r").read()
nums = [int(x) for x in content[3:].replace("\n", " ").split()]

# Calc products
ps = []
for i in range(0, len(nums)):
	for ss in [hor, ver, dia1, dia2]:
		if ss[4](i):
			p = reduce(lambda a, b: a*b, [nums[i + o] for o in ss[0:4]])
			ps.append(p)


# Return max
max = reduce(lambda curr, next: next if next > curr else curr, ps)

print(max)