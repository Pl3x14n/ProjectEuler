from mathlib import digits

max = (0, 0, 0) #a, b, sum
for a in range(1, 100):
    for b in range(1, 100):
        s = sum(digits(a**b))
        if s >= max[2]:
            max = (a, b, s)
            # print(max)


print(max[2])