cnf(minus,axiom, minus(ang0) = ang0 ).

cnf(b,axiom,(
  o(ang0,S) = S
)).

cnf(d,axiom,$(
  $(S - p(ang0) Q) = S
)).

cnf(l,axiom,$(
  $(S - x Q - p(T) Q - x Q) = $(o(T,S) - p(minus(T)) Q)
)).

fof(property12,conjecture,$(
  $(S - x Q - x Q) = S
)).
