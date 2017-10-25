import string

content = open("..\Inputs\Input022.txt", "r", encoding="utf-8-sig").read()
names = [n[1:-1] for n in content.split(",")]
names.sort()

abc = string.ascii_uppercase
s = 0
for ind, name in enumerate(names):
	alpha = sum(abc.index(l)+1 for l in name)
	s += (ind+1) * alpha


print(s)