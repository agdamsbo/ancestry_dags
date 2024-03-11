#' @title Calculate the probability of a child with given parameters
#' @param baserisk A numeric vector containing the base risk
#' @param por A vector containing the odds ratios
#' @param parent A list containing the parent's risk factors
#' @return A vector of prevalence of a child
#' @importFrom stats rbinom
#' @export
#'
#' @examples
#' pop <- 10000
#' child(
#'   baserisk = 0.1,
#'   por = c(1.2, 0.8),
#'   parent = ancestor(population = pop, prev = 0.2, n = 2)
#' )
child <- function(baserisk, por, parent) {
  # Checks por is vector
  if (!is.vector(por)){
    stop("por should be a vector of ORs of same length as parent")
  }

  # Checks parent is list
  if (!is.list(parent)){
    stop("parent should be a list of ancestors")
  }

  # If only one por supplied, this is reused for all relations
  if (length(por) == 1) por <- rep(por, length(parent))

  # Calculations
  list.pars <- lapply(seq_len(length(parent)), function(i) {
    log(por[i]) * parent[[i]]
  })

  myxb1 <- log(baserisk / (1 - baserisk)) + do.call("+", list.pars)
  probp1 <- exp(myxb1) / (1 + exp(myxb1))
  rbinom(length(parent[[1]]), 1, probp1)
}



