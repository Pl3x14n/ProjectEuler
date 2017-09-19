import os, re

path = "." #

langs = ["Python", "C#", "Decimal BASIC"]
exts = ["py", "cs", "bas"]


problems = {}


for i, lang in enumerate(langs):
    folder = os.path.join(path, lang)
    for root, _, files in os.walk(folder):
        val = 0
        if (root == folder): val = 2
        elif (root == os.path.join(folder, "Unsolved")): val = 1

        for f in [f for f in files if re.match("\d{3}\." + exts[i],  f)]:
            no = int(f[0:3])
            if not no in problems: problems[no] = [0] * len(langs)
            problems[no][i] = val
    


def conv(v):
	if v == 2: return u"\u25CF"
	elif v == 1: return u"\u25CB"
	else: return ""



print()
print(" {0:>12}  |{1:^{w}}|{2:^{w}}|{3:^{w}}".format("Problem No.", *langs, w=17))
print(" " + "=" * (14+17*3+3))

for no, vals in sorted(problems.items()):
    print(" {0:>12}  |{1:^{w}}|{2:^{w}}|{3:^{w}}".format(str(no).zfill(3), *[conv(v) for v in vals], w=17))


input()



# solvedfolders = [os.path.join(path, f) for f in next(os.walk(path))[1] if len(f) == 3]
# unsolvedfolders = [os.path.join(path, "Unsolved", f) for f in next(os.walk(os.path.join(path, "Unsolved")))[1] if len(f) == 3]

# fullpaths = solvedfolders + unsolvedfolders
# nums = [fp[-3:] for fp in fullpaths]


# # val: 2 = Solved, 1 = Tried, 0 = Unsolved
# cs = [0] * len(fullpaths)
# bas = [0] * len(fullpaths)
# py = [0] * len(fullpaths)

# count = 0
# for folder in fullpaths:
# 	v = 2 if (folder in solvedfolders) else 1
# 	for file in os.listdir(folder):
# 		if file.lower().endswith(".cs"): 
# 			cs[count] = v
# 		if file.lower().endswith(".bas"):
# 			bas[count] = v 
# 		if file.lower().endswith(".py"): 
# 			py[count] = v

# 	count += 1


# # Tuple = (num, c#, bas, py)
# def conv(v):
# 	if v == 2: return u"\u25CF"
# 	elif v == 1: return u"\u25CB"
# 	else: return ""



# tuples = zip(nums, cs, bas, py)
# tuples = sorted(tuples, key=lambda t: int(t[0]))
# tuples = [t for t in tuples if not (t[1] == t[2] == t[3] == 0)]

# for i in range(len(tuples)-2, 0, -1):
# 	if tuples[i][0] == tuples[i+1][0]:
# 		t = [tuples[i][0]] + [max(tuples[i][j], tuples[i+1][j]) for j in range(1,4)]
# 		tuples[i] = tuple(t)
# 		tuples.pop(i+1)


# formatted = [" {0:>12}  |{1:^{w}}|{2:^{w}}|{3:^{w}}".format(t[0], conv(t[1]), conv(t[2]), conv(t[3]), w=11) for t in tuples]



# print()
# print(" {0:>12}  |{1:^{w}}|{2:^{w}}|{3:^{w}}".format("Problem No.", "C#", "BAS", "PY", w=11))
# print(" " + "=" * (14+11*3+3))
# print(*formatted, sep="\n")
# input()
