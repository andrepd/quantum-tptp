cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(phase1,axiom, $(o(T,S) - OP Q) = o(T,$(S - OP Q)) ).
cnf(phase2,axiom, $(o(T,S) - OP Q1 Q2) = o(T,$(S - OP Q1 Q2)) ).

cnf(def_rx,definition,
  $(S - rx(T) Q) = $(o(minus(half(T)),S) - h Q - p(T) Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(property8,lemma,$(
  $(S - cnot Q1 Q2 - p(T) Q2 - cnot Q1 Q2) = $(S - cnot Q2 Q1 - p(T) Q1 - cnot Q2 Q1)
)).

cnf(property11,lemma,$(
  $(S - cnot Q1 Q2 - h Q1 - h Q2) = $(S - h Q1 - h Q2 - cnot Q2 Q1)
)).

fof(property9,conjecture,$(
  $(S - cnot Q1 Q2 - rx(T) Q1 - cnot Q1 Q2) = $(S - cnot Q2 Q1 - rx(T) Q2 - cnot Q2 Q1)
)).
