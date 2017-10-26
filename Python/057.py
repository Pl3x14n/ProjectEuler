from math import log10

num, den = 3, 2
count = 0
for _ in range(1000):
    num, den = num+2*den, num+den 

    if int(log10(num)) > int(log10(den)): count += 1

print(count)