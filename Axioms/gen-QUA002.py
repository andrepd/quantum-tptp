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

def seq(x): return ' '.join(x)

cnf(f'rx0 = rx', name=f'rx0', role='definition')
for i in range(n):
  q = [f'Q{j+1}' for j in range(i+2)]
  lhs = f'rx{i+1}(T) {seq(q)}'
  rhs = ' - '.join((
      f'h {q[0]}',
      f'rx{i}(half(T)) {seq(q[1:])}',
      f'cnot {q[-1]} {q[0]}',
      f'rx{i}(minus(half(T))) {seq(q[1:])}',
      f'cnot {q[-1]} {q[0]}',
      f'h {q[0]}',
    ))
  cnf(f' $(S - {lhs}) =\n  $(S - {rhs})\n', name=f'rx{i+1}', role='definition')

print()

cnf(f'p0 = p', name=f'p0', role='definition')
for i in range(n):
  q = [f'Q{j+1}' for j in range(i+2)]
  lhs = f'p{i+1}(T) {seq(q)}'
  rhs = ' - '.join((
      f'p{i}(half(T)) {seq(q[:-1])}',
      f'h {q[0]}',
      f'rx{i+1}(T) {seq(q)}',
      f'h {q[-1]}',
    ))
  cnf(f' $(S - {lhs}) =\n  $(S - {rhs})\n', name=f'p{i+1}', role='definition')

print()

cnf(f'x0 = x', name=f'x0', role='definition')
for i in range(n):
  q = [f'Q{j+1}' for j in range(i+2)]
  lhs = f'x{i+1} {seq(q)}'
  rhs = ' - '.join((
      f'h {q[-1]}',
      f'p{i+1}(ang180) {seq(q)}',
      f'h {q[-1]}',
    ))
  cnf(f' $(S - {lhs}) =\n  $(S - {rhs})\n', name=f'x{i+1}', role='definition')

print()

cnf(f'o0 = o', name=f'o0', role='definition')
for i in range(n+1):
  q = [f'Q{j+1}' for j in range(i+1)]
  lhs = f'o{i+1}(T) {seq(q)}'
  rhs = f'p{i}(T) {seq(q)}'
  cnf(f' $(S - {lhs}) =\n  $(S - {rhs})\n', name=f'o{i+1}', role='definition')
