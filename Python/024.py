from itertools import permutations
from math import factorial as fact

# Brute Force approach
perms = permutations(range(10))
for _ in range(1000000-1): next(perms)
print(next(perms))






# Mathematical approach (div and conquer:

# We have 10 digits, 1 + 9. Goal is the 1000000th perm
# Arranging 9 digits has 9! = 362880 possibilities
# So perms 1 to 362880 has the 1st digit in front, 362881 to 725760 the 2nd and 725761 to 1088640 the 3rd.
# Since 1M lies in the 3rd range, the first digit has to be the 3rd of the leftovers, which is 2.

# Now we've got 9 digits left (all except the 2), 1 + 8. Goal is the 1000000-725761 = 274239th perm.
# Arranging 8 digits has 8! = 40320 possibilities
# Simplifying that, 8! fits 6 times in 274239, which means we need the 7th digit of the leftovers (!) which is 7
# Etc. pp.
perm = []
target = 1000000-1
dgts = list(range(10))
while (dgts):
	poss = fact(len(dgts)-1)
	index = target // poss
	perm.append(dgts[index])

	del dgts[index]
	target -= poss * index 

print(perm)







