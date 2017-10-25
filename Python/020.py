from math import factorial
from mathlib import digits

n = factorial(100)
print(sum(digits(n)))