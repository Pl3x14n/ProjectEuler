from itertools import count 

def p(n):
	return n*(3*n-1) // 2

def is_p(p):
	return (((24*p+1)**0.5 + 1)/6).is_integer()


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