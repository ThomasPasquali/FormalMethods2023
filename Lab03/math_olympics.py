import mathsat
from pysmt.shortcuts import *


def callback(model, converter, result):
    """
    Callback for msat_all_sat.
    This function is called by the MathSAT API everytime a new model
    is found. If the function returns 1, the search continues,
    otherwise it stops.
    """
    # Elements in model are msat_term .
    # Converter.back() provides the pySMT representation of a solver term.
    py_model = [converter.back(v) for v in model]
    result.append(And(py_model))
    return 1  # go on


msat = Solver()
converter = msat.converter  # .converter is a property implemented by all solvers

# At time i we are in position j
vars_aliases = ["a", "b", "c"]
vars = {s: Symbol(s, INT) for s in vars_aliases}

for s in vars_aliases:
    if s != "b":
        msat.add_assertion(NotEquals(vars[s], 0))
    msat.add_assertion(LE(vars[s], 9))
    msat.add_assertion(GE(vars[s], 0))

msat.add_function()
result = []
# Directly invoke the mathsat API !!!
# The second term is a list of "important variables"
mathsat.msat_all_sat(msat.msat_env(),
                     [converter.convert(vars[v]) for v in vars],  # Convert the pySMT term into a MathSAT term
                     lambda model: callback(model, converter, result))

count = 0
for el in result:
    count += 1
    print("Model", count, ":", el)
    print("**************************************")
