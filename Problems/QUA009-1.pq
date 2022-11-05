include('QUA001-1.ax').

fof(property9,conjecture,$(
  $(S - cnot Q1 Q2 - rx(T) Q1 - cnot Q1 Q2) = $(S - cnot Q2 Q1 - rx(T) Q2 - cnot Q2 Q1)
)).
