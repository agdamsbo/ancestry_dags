#' @title Calculate the probability of a child with given parameters
#' @param baserisk A numeric vector containing the base risk
#' @param por A list containing the odds ratios
#' @param parent A list containing the parent's risk factors
#' @return A vector of probabilities of a child
#' @export
#'
#' @examples
#' pop <- 10000
#' child(
#'   baserisk = 0.1,
#'   por = list(1.2, 0.8),
#'   parent = ancestor.multi(population = pop, prev = 0.2, n = 2)
#' )
#' @export
child <- function(baserisk, por, parent) {
  if (!"list" %in% class(por)) {
    l <- list("por" = list(por), "par" = list(parent))
  } else {
    l <- list("por" = por, "par" = parent)
  }

  list.pars <- lapply(seq_len(length(l$por)), function(i) {
    log(l$por[[i]]) * l$par[[i]]
  })

  myxb1 <- log(baserisk / (1 - baserisk)) + do.call("+", list.pars)
  probp1 <- exp(myxb1) / (1 + exp(myxb1))
  rbinom(length(l$par[[1]]), 1, probp1)
}
