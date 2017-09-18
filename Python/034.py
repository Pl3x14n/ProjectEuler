from math import factorial as fact

facts = [fact(x) for x in range(0, 10)]

s = 0
for n in range(3, 7*fact(9)):
	if sum(facts[int(d)] for d in str(n)) == n:
		s += n
		# print(n)

print(s)
