#!/usr/bin/env python3

import sys

def cnf(formula, name='foo', role='axiom', type='cnf'):
  is_unit = not any(x in formula for x in ['|', '&', '=>', '<=>'])
  if is_unit:
    print(f'{type}({name},{role}, {formula} ).')
  else:
    print(f'{type}({name},{role},( {formula} )).')

try:
  n = int(sys.argv[1])
  assert(n % 4 == 0 and 360 % n == 0)
except IndexError:
  print(f'Usage: {sys.argv[0]} n', file=sys.stderr)
  exit(1)
except AssertionError:
  print(f'n must be multiple of 4 and divisor of 360', file=sys.stderr)
  exit(1)

def ang(x): return f'ang{x*360//n}'



print(f'% ARI001-{n} Axioms for arithmetic modulo {n} (incomplete)')
print(f'% Generated from {sys.argv[0]}')

# Basic properties
cnf(f'add(X,Y) = add(Y,X)', name='add_commut')
cnf(f'add(X,add(Y,Z)) = add(add(X,Y),Z)', name='add_assoc')
cnf(f'add(X,minus(X)) = ang0', name='add_inverse')
cnf(f'minus(minus(X)) = X', name='minus_invol')  # Redundant, but useful
cnf(f'minus(add(X,Y)) = add(minus(X),minus(Y))', name='minus_add')  # Redundant, but useful
cnf('add(half(X),half(Y)) = half(add(X,Y))', name='half_distr')  # The axioms do not contain multiplication, except for multiplication by 1/2

# Distinct domain
for i in range(n):
  for j in range(i+1,n):
    cnf(f'{ang(i)} != {ang(j)}', name='domain')

# Sums
for i in range(n):
  for j in range(i,n):
    cnf(f'add({ang(i)}, {ang(j)}) = {ang((i+j)%n)}', name='add')

# Neg
cnf(f'minus(ang0) = ang0', name='minus')
for i in range(1,n):
  cnf(f'minus({ang(i)}) = {ang(n-i)}', name='minus')

# Halfs
for i in range(1)[::2]:
  cnf(f'half({ang(i)}) = {ang(i//2)}', name='half')
