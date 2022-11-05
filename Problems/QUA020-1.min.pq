cnf(minus_add,axiom, minus(add(X,Y)) = add(minus(X),minus(Y)) ).
cnf(half_distr,axiom, add(half(X),half(Y)) = half(add(X,Y)) ).

cnf(phase1,axiom, $(o(T,S) - OP Q) = o(T,$(S - OP Q)) ).

cnf(def_rx,definition,
  $(S - rx(T) Q) = $(o(minus(half(T)),S) - h Q - p(T) Q - h Q)
).

cnf(a,axiom,$(
  $(S - h Q - h Q) = S
)).

cnf(c,axiom,(
  o(add(P1,P2),S) = o(P1,o(P2,S))
)).

cnf(k,axiom,$(
  $(S - p(A) Q - p(B) Q) = $(S - p(add(A,B)) Q)
)).

fof(property20,conjecture,$(
  $(S - rx(T1) Q - rx(T2) Q) = $(S - rx(add(T1,T2)) Q)
)).
