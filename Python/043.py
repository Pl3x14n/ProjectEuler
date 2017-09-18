from itertools import permutations
from math import factorial as fact


# d1d2d3: div by 2		--> 	d3 % 2 == 0
# d2d3d4: div by 3		-->		(d2+d3+d4) % 3 == 0
# d3d4d5: div by 5		-->		d5 % 5 == 0, better d5 in [0, 5]
# d4d5d6: div by 7
# d5d6d7: div by 11		-->		(d5+d7-d6) % 11 == 0
# d6d7d8: div by 13
# d7d8d9: div by 17
def satisfies_conditions(d):
	if d[3] % 2 != 0: return False
	if sum(d[2:4]) % 3 != 0: return False
	if d[5] not in [0, 5]: return False
	if (d[4]*100 + d[5]*10 + d[6]) % 7 != 0: return False
	if (d[5]-d[6]+d[7]) % 11 != 0: return False
	if (d[6]*100 + d[7]*10 + d[8]) % 13 != 0: return False
	if (d[7]*100 + d[8]*10 + d[9]) % 17 != 0: return False
	return True


def to_number(dgts):
	return sum(d * 10**(len(dgts)-1-i) for i, d in enumerate(dgts))



pandigitals = permutations(range(10))
for _ in range(fact(9)): next(pandigitals)	# Skip perms with leading zero
goodones = (tpl for tpl in pandigitals if satisfies_conditions(tpl))
goodones = (to_number(tpl) for tpl in goodones)
print(sum(goodones))





# Solvable by logical reduction (divisibilty analysis):

# 1:	d3d4d5 div by 5, so d5 in [0, 5]
# 2: 	d5d6d7 div by 11, so d5d6d7 with d5 = 0 gives [011, 022, ..., 099], none pandigital, so d5 = 5
# 			--> d5d6d7 in [506, 517, 528, 539, 561, 572, 583, 594] due to the divisibilty
# 3: 	d6d7d8 div by 13, and d6d7 is limited to 8 poss, so we've got 8 poss for d6d7d8 at max.
#			Considering d5 = 5, this gives only 4 poss for d5d6d7d8 (no repitition!) 
#			--> d5d6d7d8 in [5286, 5390, 5728, 5832]
# 4:	d7d8d9: div by 17 with the given set for d5d6d7d8 gives d5d6d7d8d9 in [52867, 53901, 57289]
# 5: 	d4d5d6: div by 7 and d5d6 in [52, 53, 57], so d4d5d6d7d8d9 in [952867, 357289]
# 6:	d1d2d3: div by 2, so 2 is even
#			--> d3d4d5d6d7d8d9 in [0952867, 4952867, 0357289, 4357289, 6357289] (again, no repititions)
# 7:	d2d3d4: div by 3, so d2+d3+d4 % 3 == 0, given that d3d4 in [09, 49, 03, 43, 63] and the other given digits
#			--> d2d3d4d5d6d7d8d9 in [30952867, 60357289, 06357289]
# 8: 	Since no rules for d0d1 are given, we just run all poss for d0d1 (which are [14, 41]) over [30952867, 60357289, 06357289]
#
# Pandigitals: [1430952867, 1460357289, 1406357289, 4130952867, 4160357289, 4106357289]





