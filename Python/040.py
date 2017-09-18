from itertools import count
from functools import reduce

dec = "."
for x in count(1):
	dec += str(x)
	if len(dec) > 1000000: break

dgts = [int(dec[10**p]) for p in range(7)]
print(reduce(lambda a,b: a*b, dgts))