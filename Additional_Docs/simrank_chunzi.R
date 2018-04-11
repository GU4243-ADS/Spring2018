calc_simrank <- function(data) {
  
  # Initiate the user similarity matrix.
  weight_mat <- matrix(0, nrow = nrow(data), ncol = nrow(data))
  # Initiate the item similarity matrix.
  item_sim <- matrix(0,nrow=ncol(data),ncol=ncol(data))
  # the similarity of the same user and item remains 1.
  diag(weight_mat) <- 1
  diag(item_sim) <- 1
  
  # Change MS entries from 0 to NA
  data[data == 0] <- NA
  
  # Iteration 5 times
  for (iter in 1:5) {
    
    # fill in user similarity matrix
    weight_func <- function(rowA, rowB) {
      return(0.8*sum(item_sim[which(!is.na(rowA)),which(!is.na(rowB))])/(sum(rowA,na.rm=T)*sum(rowB,na.rm=T)))
    }
    for(i in 1:nrow(data)) {
      weight_mat[i, ] <- apply(data, 1, weight_func, data[i, ])
    }
    diag(weight_mat) <- 1
    
    # fill in item similarity matrix
    sim_func <- function(col1, col2) {
      return(0.8*sum(weight_mat[which(!is.na(col1)),which(!is.na(col2))])/(sum(col1,na.rm=T)*sum(col2,na.rm=T)))
    }
    for(i in 1:ncol(data)) {
      item_sim[i, ] <- apply(data, 2, sim_func, data[,i])
    }
    diag(item_sim) <- 1
    print(iter)
  }
  return(round(weight_mat,4))
}
