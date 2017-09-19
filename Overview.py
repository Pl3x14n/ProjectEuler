import os, re

path = "."

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


