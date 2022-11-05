cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(def_x,definition,
  $(S - x Q) = $(S - h Q - z Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(f,axiom,$(
  $(S - cnot Q1 Q2 - x Q2) = $(S - x Q1 - cnot Q1 Q2 - x Q1)
)).

cnf(property11,lemma,$(
  $(S - cnot Q1 Q2 - h Q1 - h Q2) = $(S - h Q1 - h Q2 - cnot Q2 Q1)
)).

fof(property17,conjecture,$(
  $(S - z Q2 - cnot Q1 Q2) = $(S - cnot Q1 Q2 - z Q1 - z Q2)
)).
