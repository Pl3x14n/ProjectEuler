l = 100

sum1 = sum((i*i for i in range(1, l+1)))
sum2 = (l * (l+1)//2)**2

print(sum2 - sum1)