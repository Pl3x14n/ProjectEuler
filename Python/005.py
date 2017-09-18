from functools import reduce

def gcd(a, b): 
	while(b): a, b = b, a%b
	return a

def lcm(a, b):
	return a * b // gcd(a, b)


n = reduce(lambda a, b: lcm(a,b), range(1, 20))

print(n)
