

#' @title Calculate Ancestor Probability
#' @description Calculates the probability of an ancestor given a population size and previous probability.
#' @param population The population size.
#' @param prev The previous probability.
#' @return A vector of probabilities.
#' @export
#'
#' @examples
#' ancestor(population=10000, prev=0.1)
ancestor <- function(population=10000,prev=0.1){
  rbinom(population, 1, prev)
}

#' Simulate multiple ancestors
#'
#' @param population Population
#' @param prev Prevalence of outcome in ancestor(s). If length is 1, the
#' value is reused for all.
#' @param n Number of ancestors to simulate
#' @param anc.names Names of the ancestors (optional). If supplied, n is ignored.
#' @return List of ancestor objects
#' @export
#' @examples
#' pop=10000
#' ancestor.multi(population=pop,prev=0.1,n=3)
#' ancestor.multi(population=pop,prev=c(0.1,0.3,0.2),anc.names=c("anc2","anc3","anc4"))
ancestor.multi <- function(population,prev,n=1,anc.names=NULL){
  if (is.null(anc.names)){
    if (length(prev)!=n) prev <- rep(prev,n)
    l <- lapply(seq_len(n),function(i){
      ancestor(population=population,prev=prev[i])})
    names(l) <- paste0("ancestor",seq_len(n))
  } else {
    if (length(prev)!=length(anc.names)) prev <- rep(prev,length(anc.names))
    l <- lapply(seq_along(anc.names),function(i){
      ancestor(population=population,prev=prev[i])})
    names(l) <- anc.names
  }
  l
}
