from math import log10

def uniquedigits(s):
	return len(set(s)) == len(s)


# Product has to be 4d, neither 3d or 5d work
# 4d = 1d x 4d or 4d = 2d x 3d, when a < b
# Clamp b by looking at the length of a and make sure c stays under 10000
# Thus, no further check has to be done for the length of the product

products = set()
for a in range(2, 100):
	lena = int(log10(a))+1
	for b in range(10**(4-lena), min(10**(5-lena), 10000//a)):
		s = str(a) + str(b) + str(a*b)
		if (not "0" in s and uniquedigits(s)):
			products.add(a*b)
			# print("{} x {} = {}".format(a, b, a*b))

print(sum(products))


