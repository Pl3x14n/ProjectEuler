from string import ascii_uppercase as abc

def t(n):
	return n*(n+1)//2


triangles = [t(n) for n in range(1, 100)]	# Arbitrary upper bound


content = open("Input042.txt", "r", encoding="utf-8-sig").read()
words = (w[1:-1] for w in content.split(","))
wordtpls = ((wrd, sum(abc.index(chr)+1 for chr in wrd)) for wrd in words)

trglwords = [tpl for tpl in wordtpls if tpl[1] in triangles]
print(len(trglwords))