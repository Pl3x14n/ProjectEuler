from functools import reduce
from mathlib import lcm

n = reduce(lambda a, b: lcm(a,b), range(1, 20))

print(n)
