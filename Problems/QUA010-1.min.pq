cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(e,axiom,$(
  $(S - cnot Q1 Q2 - cnot Q1 Q2) = S
)).

cnf(g,axiom,$(
  $(S - cnot Q1 Q3 - cnot Q2 Q3) = $(S - cnot Q1 Q2 - cnot Q2 Q3 - cnot Q1 Q2)
)).

fof(property10,conjecture,$(
  $(S - cnot Q1 Q3 - cnot Q2 Q3) = $(S - cnot Q2 Q3 - cnot Q1 Q3)
)).
