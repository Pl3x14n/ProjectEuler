from itertools import count
from mathlib import digits. is_pandigital


# 918273645 must be beaten - so we need a 9 in front

# 2 digit number: 
# 	9? * (1,2,3)	=> 8 digits
# 	9? * (1,2,3,4)	=> 11 digits

# 3 digit number:
# 	9?? * (1,2)		=> 7 digits
# 	9?? * (1,2,3)	=> 11 digits

# 4 digit number
# 	9??? * (1,2)	=> 9 digits	


for x in count(9876, -1):
	if is_pandigital(x * 100000 + 2*x):
		print(x, 2*x)
		break

print(x)


