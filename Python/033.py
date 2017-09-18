# ax/bx = a/b  and  xa/xb = a/b
# both make no sense, since this requires a = b, which is not our definition (a < b)
from fractions import Fraction

res = Fraction(1, 1)
for a in range(0, 10):
	for b in range(a+1, 10):
		for x in range(0, 10):
			if (a == x == 0): continue
			if (10*a+x) / (10*x+b) == a/b:
				res *= Fraction(10*a+x, 10*x+b)
				# print(a, x, x, b)
			if (10*x+a) / (10*b+x) == a/b:
				res *= Fraction(10*x+a, 10*b+x)
				# print(x, a, b, x)

print(res)	