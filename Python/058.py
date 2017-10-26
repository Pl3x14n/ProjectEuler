from mathlib import is_prime

sidelen = 1
last = 1
primes = 0
total = lambda : (sidelen-1)//2 * 4 + 1

while True:
    step = sidelen - 1
    next = [last + step, last + 2*step, last + 3*step, last + 4*step]

    primes += len([p for p in next if is_prime(p)])
    # print(sidelen, next, primes, total())

    last = next[-1]
    sidelen += 2

    if (primes != 0 and primes / total() < 0.1): break;

print(sidelen)



