#!/usr/bin/env python3

import sys

def cnf(formula, name='foo', role='axiom', type='cnf', protect=None, padding=None):
  if protect == None: protect = '$' in formula
  if padding == None: padding = '\n' not in formula
  if padding:
    formula = f' {formula} '
  if protect:
    formula = f'$({formula})'
  print(f'{type}({name},{role},{formula}).')

try:
  # unroll = '--unroll' in sys.argv
  if '--unroll' in sys.argv:
    unroll = True
    sys.argv.remove('--unroll')
  n = int(sys.argv[1])
  assert n >= 1
except (IndexError, AssertionError):
  print(f'Usage: {sys.argv[0]} [--unroll] n', file=sys.stderr)
  exit(1)



print(f'% QUA002-{n}: Definitions of multi-controlled gates up to {n} controls')
print(f'% Generated from {sys.argv[0]}')

print()

print('include(\'ARI001-24.ax\').')

print('''cnf(p,axiom,$(
  $(S - h Q) = $(S - p(ang90) Q - rx(ang90) Q - p(ang90) Q)
)).''')

print('''fof(q,axiom, ![A1,A2,A3]: ?[B0,B1,B2,B3]: $(
  $(S - rx(A1) Q - p(A2) Q - rx(A3) Q) = $(o(B0,S) - p(B1) Q - rx(B2) Q - p(B3) Q)
)).''')

def seq(x): return ' '.join(x)

for i in range(n):
  q = [f'Q{j+1}' for j in range(i+2)]
  q1 = q
  q2 = q[:-2] + [q[-1]] + [q[-2]]
  q3 = q[:-2] + [q[-1]]

  lhs = ' - '.join([
    f'rx{i+1}(G1) {seq(q2)}', 
    f'p{i+1}(G2) {seq(q1)}', 
    f'rx{i+1}(G3) {seq(q1)}', 
    f'rx{i+1}(G4) {seq(q2)}', 
  ])

  rhs = ' - '.join([
    f'p{i+1}(D1) {seq(q1)}', 
    f'p{i}(D2) {seq(q3)}', 
    f'rx{i+1}(D3) {seq(q1)}', 
    f'rx{i+1}(D4) {seq(q2)}', 
    f'p{i+1}(D5) {seq(q1)}', 
    f'rx{i+1}(D6) {seq(q1)}', 
    f'p{i+1}(D7) {seq(q1)}', 
    f'p{i+1}(D8) {seq(q2)}', 
    f'p{i}(D9) {seq(q3)}', 
  ])

  quantifiers = '![G1,G2,G3,G4]: ?[D1,D2,D3,D4,D5,D6,D7,D8,D9]:'
  cnf(f' {quantifiers} $(\n  $(S - {lhs}) =\n  $(S - {rhs})\n)', name=f'r{i+1}', role='axiom', type='fof', protect=False)
