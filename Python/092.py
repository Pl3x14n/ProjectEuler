from mathlib import digits

def eval_next(n):
    return sum([d*d for d in digits(n)])


known = {1: 1, 89: 89}

for i in range(1, int(1E7)):
    
    curr = [i]
    while True:
        # Unknown int atm
        if curr[-1] not in known:
            curr.append(eval_next(curr[-1]))
            continue
        
        # Found ending
        for j in curr[:-1]:
            known[j] = known[curr[-1]]
        break


print(len([k for k, v in known.items() if v == 89]))