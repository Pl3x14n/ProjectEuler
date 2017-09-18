def is_palindromic(s):
	return all(s[i] == s[-i-1] for i in range(0, len(s)//2))



sum = 0
# Note: Palindromic numbers, in either base, may not include leading zeros.
# Means, no 0 at the end --> base 10, not div by 10 and base 2, not div by 2
for n in range(1, 1000000, 2):
	if not is_palindromic(str(n)): continue
	bin = "{0:b}".format(n)
	if not is_palindromic(bin): continue

	sum += n
	# print(n, bin)


print(sum)