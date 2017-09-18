words = {0: "", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine", 10: "ten", 11: "eleven", 12: "twelve", 13: "thirteen", 14: "fourteen", 15: "fifteen", 16: "sixteen", 17: "seventeen", 18: "eighteen", 19: "nineteen", 20: "twenty", 30: "thirty", 40: "forty", 50: "fifty", 60: "sixty", 70: "seventy", 80: "eighty", 90: "ninety", 100: "hundred", 1000: "thousand"}


def getword(n):
	if n in range(0, 21):
		return words[n]
	elif n in range(21, 100):
		return words[n // 10 * 10] + words[n % 10]
	elif n % 100 == 0 and n != 1000:
		return words[n // 100] + words[100]
	elif n in range(100, 1000):
		return getword(n // 100 * 100) + "and" + getword(n % 100)
	else:
		return words[1] + words[1000]



# for n in range(1, 1001):
# 	print("%d: %s" % (n, getword(n)))

print(sum(len(getword(x)) for x in range(1, 1001)))