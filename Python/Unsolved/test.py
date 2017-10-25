import os, sys
sys.path.insert(1, os.path.join(sys.path[0], ".."))


from time import time

def digits(n):
	while n >= 1:
		yield n % 10
		n //= 10


start = time()
for i in range(100000): a = sorted(digits(i))
print(time() - start)

start = time()
for i in range(100000): a = sorted(str(i))
print(time() - start)

