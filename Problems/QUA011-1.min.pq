cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(m,axiom,$(
  $(S - h Q2 - cnot Q1 Q2 - h Q2) = $(S - p(ang90) Q1 - p(ang90) Q2 - cnot Q1 Q2 - p(ang270) Q2 - cnot Q1 Q2)
)).

cnf(property8,lemma,$(
  $(S - cnot Q1 Q2 - p(T) Q2 - cnot Q1 Q2) = $(S - cnot Q2 Q1 - p(T) Q1 - cnot Q2 Q1)
)).

fof(property11,conjecture,$(
  $(S - cnot Q1 Q2 - h Q1 - h Q2) = $(S - h Q1 - h Q2 - cnot Q2 Q1)
)).
