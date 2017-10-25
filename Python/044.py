from itertools import count 
from mathlib import pentagonal as p, is_pentagonal as is_p



pentas = []
for k in count(2):
	pk = p(k) 
	pentas.append(pk)

	for j in range(k-2, 0, -1):		# minimize diff, just in case
		pj = pentas[j-1]

		if is_p(pj + pk) and is_p(pk - pj):
			break
	else:
		continue

	break

# print(pj, pk)
print(pk - pj)