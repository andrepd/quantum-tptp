cnf(minus,axiom, minus(ang0) = ang0 ).
cnf(half,axiom, half(ang0) = ang0 ).

cnf(phase1,axiom, $(o(T,S) - OP Q) = o(T,$(S - OP Q)) ).
cnf(phase2,axiom, $(o(T,S) - OP Q1 Q2) = o(T,$(S - OP Q1 Q2)) ).

cnf(def_rx,definition,
  $(S - rx(T) Q) = $(o(minus(half(T)),S) - h Q - p(T) Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(b,axiom,(
  o(ang0,S) = S
)).

cnf(d,axiom,$(
  $(S - p(ang0) Q) = S
)).

fof(property19,conjecture,$(
  $(S - rx(ang0) Q) = S
)).
