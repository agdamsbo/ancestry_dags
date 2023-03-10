# ancestryDAGs

Package with simple functions to quantify DAGs in R. Based on course mmaterial from PhD course on Directed Acyclic Graphs (DAG) at AU.

## Use

Install the package using the following function:

```
remotes::install_github("agdamsbo/ancestryDAGs")
```

## Functions

The package includes four functions:

* `ancestor()`: Simulates multiple ancestors given a population size and prevalences.
* `child()`: Simulates child given a number of parents and odds ratios for the relations.
