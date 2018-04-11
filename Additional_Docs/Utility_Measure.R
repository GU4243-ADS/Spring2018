
ordered.list.score <- function(labeled.data, prob_predictions) {
  ############## Calculating expected, recomended-list utilities #########
  
  ranks.recommend <-  t(apply(-prob_predictions, 1, rank))   # decsending, magnitude-ordered rankings based on predicted probabilties
  # - sign to get descending ranks, t() to return matrix to proper shape after apply().
  
  visit.prob.recommend <-  2^(-(ranks.recommend - 1)/(5-1))     # probabilty of visiting item based on rank ordering of recommendations
  
  true.util <-  labeled.data   # True utility of the item based on label data
  
  item.util.recommend <-  visit.prob.recommend * true.util   # matrix of expected utilities of each item in the ranked list based on the items rank order position and true labeled utility
  
  R_a <- rowSums(item.util.recommend, na.rm = TRUE)     # expected utility of rank ordered list of items for a given user. Based on predicted rank ordering and true labeled revealed user item utilty. dims = vector length n.users
  
  ######## Calculating max expected list utilities ######
  
  ranks.max <- t(apply(-labeled.data, 1, rank, na.last = TRUE, ties.method = "first")) 
  # na.last gives NAs the lowest rank, ties.method = "first" ranks tied elements by the order in which the function encounters them, right to left.
  
  visit.prob.max <- 2^(-(ranks.max - 1)/(5-1)) # probabilty of visiting item based on rank ordering of true labeled votes. 
  
  item.util.max <-  visit.prob.max * true.util
  
  R_a_max <- rowSums(item.util.max, na.rm = TRUE) # Based on true labeled rank ordering and true labeled revealed user item utilty. dims = vector length n.users
  
  R_final <- (sum(R_a)/sum(R_a_max)) * 100
  
  R_final
}
