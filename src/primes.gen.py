# this file is going to be executed
# and its stdout output is going to be
# used as the content of `test.gen.h`
# you can use this to for example
# precalculate some data or generate
# code that would be annoying to write
# by hand

print("#pragma once")
print("static const int primes[] = {")

def is_prime(n):
    for i in range(2, n):
        if n % i == 0:
            return False
    return True

primes = [p for p in range(1000) if is_prime(p)]

print(", ".join(map(str, primes)))

print("};")

