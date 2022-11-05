#!/usr/bin/env python3

import sys
import itertools

def split_lex(str, delim=None):
	return (x.strip() for x in str.split(delim))

def delim(open, x, close):
	def find(s, start=0):
		i = x.find(s, start)
		return i if i != -1 else len(x)

	i = find(open)
	if i == len(x): return None

	j = i+len(open)
	level = 1
	while i < len(x) and level != 0:
		a = find('(', j)
		b = find(')', j)
		if a < b:
			level += 1
		elif b < a:
			level -= 1
		else:
			assert False
		j = min(a,b)+1

	return x[:i], x[i+len(open):j-len(close)], x[j:]

def apply_delim(open, x, close, f):
	match delim(open, x, close):
		case None:
			return x
		case [a,b,c]:
			return a + f(b) + apply_delim(open, c, close, f)



def circuit(x):
	'''Convert a circuit into a tptp function, and also return the set of qubits used.'''
	state, *circuit = split_lex(x, '-')
	qubits = set()
	if len(state.split()) != 1:
		circuit = [state] + circuit
		state = 'S'
	for i in circuit:
		op, *args = i.split()
		if not args: raise ValueError(f'Missing qubits on operator {op}')
		qubits.update(args)
		n = len(args)
		args = ','.join(args)
		state = f'app{n}({op},{args},{state})'
	return state, qubits

def guard(qubits):
	'''Return a guard for the qubits in the set'''
	if len(qubits) <= 1:
		return ''
	else:
		qubits = sorted(list(qubits))
		return ' | ' + '|'.join(f'{i}={j}' for i,j in itertools.combinations(qubits, 2))

def convert(x):
	'''Search for $(<circuit>) macros, parse contents.'''
	def outer(x):
		all_qubits = set()
		def inner(x):
			nonlocal all_qubits
			state, qubits = circuit(x)
			all_qubits |= qubits
			return state

		x_new = apply_delim('$(', x, ')', inner)
		if x_new == x:
			return circuit(x)[0]
		else:
			g = guard(all_qubits)
			return f'(({x_new}){g})' if g else f'({x_new})'

	return apply_delim('$(', x, ')', outer)

print(convert(sys.stdin.read()), end='')
