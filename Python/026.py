from mathlib import is_cyclic



max = (0, 0)	# (d, len)
for d in (x for x in range(2, 1000) if is_cyclic(x)):
	# Division by hand => Same remainder, cycle found
	rems = [1]
	while True:
		r = rems[-1] * 10 % d
		if (r in rems): break
		rems.append(r)


	cyclelen = len(rems) - rems.index(r)

	if (cyclelen > max[1]):
		max = (d, cyclelen)


print(max)





