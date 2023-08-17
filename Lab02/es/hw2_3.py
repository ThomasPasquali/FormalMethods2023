from pysmt.shortcuts import *

N = 8

vars = {f"q{i}{j}": Symbol(f"q{i}{j}", BOOL) for i in range(N) for j in range(N)}

msat = Solver()

# One queen for each row
for i in range(N):
  msat.add_assertion(ExactlyOne([vars[f"q{i}{j}"] for j in range(N)]))

# One queen for each column
for i in range(N):
  msat.add_assertion(ExactlyOne([vars[f"q{j}{i}"] for j in range(N)]))

# At most one Queen per bottom-left to top-right diagonal
for i in range(2 * N - 1):
  print([vars[f'q{i-d}{d}'] for d in range(N) if i-d >= 0 and i-d < N])
  msat.add_assertion(AtMostOne([vars[f'q{i-d}{d}'] for d in range(N) if i-d >= 0 and i-d < N]))

# At most one Queen per top-left to bottom-right diagonal
for i in range(-N, N):
  print([vars[f'q{i+d}{d}'] for d in range(N) if i+d >= 0 and i+d < N])
  msat.add_assertion(AtMostOne([vars[f'q{i+d}{d}'] for d in range(N) if i+d >= 0 and i+d < N]))

res = msat.solve()

if res:
  model = {e[0].symbol_name(): e[1] for e in msat.get_model()}
  # print(model)
  for i in range(N):
    sol_row = list()
    for j in range(N):
      sol_row.append('Q' if model[f"q{i}{j}"] == Bool(True) else ' ')
    print(sol_row)

  print('---------')
  model = list(map(lambda p : vars[p[0]], list(filter(lambda p : p[1] == Bool(True), model.items()))))
  msat.add_assertion(Not(And(model)))
  res = msat.solve()
  if res:
    model = {e[0].symbol_name(): e[1] for e in msat.get_model()}
    # print(model)
    for i in range(N):
      sol_row = list()
      for j in range(N):
        sol_row.append('Q' if model[f"q{i}{j}"] == Bool(True) else ' ')
      print(sol_row)
  else:
    print('Solution is unique')
else:
  print('UNSAT')
