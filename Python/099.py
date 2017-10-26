from math import log10

# a**b          < c**d 
# log(a**b)     < log(c**d)
# b * log(a)    < d * log(c)


content = open("..\Inputs\Input099.txt", "r", encoding="utf-8-sig").read()
base_exp = [be.split("_") for be in content.split("\n")]
vals = [int(be[1]) * log10(int(be[0])) for be in base_exp]
maxval = max(vals)
line = vals.index(maxval) + 1

print(line) 