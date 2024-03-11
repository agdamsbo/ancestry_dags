# ancestryDAGs

Package with simple functions to quantify DAGs in R. Based on course material from [PhD course on Directed Acyclic Graphs (DAG)](https://au.phd-courses.dk/CourseCatalog/ShowCourse/1094?returnUrl=https%3A%2F%2Fau.phd-courses.dk%2FMyPage%2FShowMyCourses) at [Aarhus University (AU)](https://au.dk/).

## Use

This package is not on CRAN, so you´ll need to have a package like `remotes` installed, and then install this package.

Install the package using the following function:

```
require(remotes)
remotes::install_github("agdamsbo/ancestryDAGs")
```

## Functions

The package includes two main functions:

* `ancestor()`: Simulates multiple ancestors given a population size and prevalences.
* `child()`: Simulates child given a number of parents and odds ratios for the relations.

## Contributions

Contributions as issues or PRs are very welcome or you can fork the package and go on yourself.

Please note that the ancestryDAGs project is released with a [Contributor Code of Conduct](https://agdamsbo.github.io/ancestryDAGs/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
