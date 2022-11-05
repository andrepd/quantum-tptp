cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(def_z,definition,
  z = p(ang180)
).

cnf(def_x,definition,
  $(S - x Q) = $(S - h Q - z Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(i,axiom,$(
  $(S - p(T) Q1 - cnot Q1 Q2) = $(S - cnot Q1 Q2 - p(T) Q1)
)).

cnf(property11,lemma,$(
  $(S - cnot Q1 Q2 - h Q1 - h Q2) = $(S - h Q1 - h Q2 - cnot Q2 Q1)
)).

fof(property14,conjecture,$(
  $(S - x Q2 - cnot Q1 Q2) = $(S - cnot Q1 Q2 - x Q2) 
)).
