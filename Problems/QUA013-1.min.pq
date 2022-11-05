cnf(independence1,axiom,$(
  $(S - OP1 Q1 - OP2 Q2) = $(S - OP2 Q2 - OP1 Q1)
)).

cnf(independence2,axiom,$( 
  $(S - OP1 Q1 - OP2 Q2 Q3) = $(S - OP2 Q2 Q3 - OP1 Q1)
)).

cnf(swap1,axiom,
  $(S - swap Q1 Q1) = S
).

cnf(swap2,axiom,
  $(S - swap Q1 Q2) = $(S - swap Q2 Q1)
).

cnf(swap3,axiom,
  $(S - swap Q1 Q2 - swap Q1 Q2) = S
).

cnf(swap4,axiom,
  $(S - swap Q1 Q2 - OP Q1) = $(S - OP Q2 - swap Q1 Q2)
).

cnf(swap5,axiom,
  $(S - swap Q1 Q2 - OP Q1 Q2) = $(S - OP Q2 Q1 - swap Q1 Q2)
).

cnf(swap6,axiom,
  $(S - swap Q1 Q2 - OP Q1 Q3) = $(S - OP Q2 Q3 - swap Q1 Q2)
| Q1=Q3|Q2=Q3 ).

cnf(swap7,axiom, 
  $(S - swap Q1 Q2 - OP Q3 Q1) = $(S - OP Q3 Q2 - swap Q1 Q2)
| Q1=Q3|Q2=Q3 ).

cnf(g,axiom,$(
  $(S - cnot Q1 Q3 - cnot Q2 Q3) = $(S - cnot Q1 Q2 - cnot Q2 Q3 - cnot Q1 Q2)
)).

fof(property13,conjecture,$(
  $(S - cnot Q1 Q3 - cnot Q2 Q3) = $(S - cnot Q2 Q1 - cnot Q1 Q3 - cnot Q2 Q1)
)).
