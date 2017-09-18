nums = [int(x) for x in  open("Input013.txt", "r", encoding="utf-8-sig").read().split("\n")]
sum = sum(nums)

print(str(sum)[0:10])