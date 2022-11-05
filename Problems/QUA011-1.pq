include('QUA001-1.ax').

fof(property11,conjecture,$(
  $(S - cnot Q1 Q2 - h Q1 - h Q2) = $(S - h Q1 - h Q2 - cnot Q2 Q1)
)).
