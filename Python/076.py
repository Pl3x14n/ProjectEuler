memory = {}

# Dynamic programming solution
def summations(target, max, tabs=0):
    if target == 0:
        return 1

    total = 0
    for x in range(max, 0, -1):
        #print("  "*tabs + str(x))
        newtarget = target - x
        newmax = min(target-x, x)

        if (newtarget, newmax) in memory:
            total += memory[(newtarget, newmax)]
        else:
            s = summations(newtarget, newmax, tabs+1)
            memory[(newtarget, newmax)] = s
            total += s
    return total

print(str(summations(100, 99)))