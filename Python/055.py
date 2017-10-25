from mathlib import digits, to_number, is_palindromic


def reverse_no(x):
    return to_number(list(digits(x)))

lychrel_count = 0
for n in range(1, 10001):
    # Check if not lychrel no
    lychrel = False
    curr = n
    for iter in range(50):
        curr = curr + reverse_no(curr)
        if is_palindromic(str(curr)): break
    else:
        lychrel = True
            
    lychrel_count += int(lychrel)


print(lychrel_count)
