# FormalMethods2023
GitHub repository for lab lectures of the Formal Methods course (University of Trento)


# Surveys and tutorial about SAT/SMT

http://satassociation.org/tutorials.html

# Introduction Python

For people that asked me some links to easily learn the basics of Python, please check the material from the following UniTN course: https://disi.unitn.it/~passerini/teaching/2021-2022/sci-pro/index.html. In particular, the material about "Complex statements"are really useful for our course (List Comprehension and the various loops).

## Lab 1

- Getting started with SAT solving
- Dimacs and SMT-LIB format
- Encoding circuits and checking equivalence
- From real tasks to SAT models: sorting people, cracking codes

## Commands

### DIMACS
```bash
../../../mathsat/bin/mathsat -input=dimacs ex.dimacs
```

### SMT
```bash
../../../mathsat/bin/mathsat ex.smt
../../../mathsat/bin/mathsat -model_generation=true ex.smt
```