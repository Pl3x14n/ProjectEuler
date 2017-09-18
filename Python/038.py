from itertools import count


def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10

def is_pandigital(n):
	dgts = sorted(digits(n))
	return all(dgts[i+1] == d+1 for i, d in enumerate(dgts[:-1]))
		


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


