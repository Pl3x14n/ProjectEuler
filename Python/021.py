from mathlib import divsum

dsums = {n: divsum(n) for n in range(2, 10000)}

sum = 0
for n, s in dsums.items():
	if (n == s or s == 1): continue
	if (s < len(dsums) and dsums[s] == n):
		sum += n
		
print(sum)