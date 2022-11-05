cnf(def_x,definition,
  $(S - x Q) = $(S - h Q - z Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(property12,lemma,$(
  $(S - x Q - x Q) = S
)).

fof(property15,conjecture,$(
  $(S - z Q - z Q) = S
)).
