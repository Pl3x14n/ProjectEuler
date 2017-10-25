from mathlib import divsum

limit = 28123

abs = set()
sum = 0
for n in range(1, limit):
	if n < divsum(n):
		abs.add(n)
	if all((n-a) not in abs for a in abs):
		sum += n

print(sum)
