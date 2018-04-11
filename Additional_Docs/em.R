
# EM algorithm:
em <- function(UI_matrix, C, epsilon, max_steps=100, dataset='movies'){
  
  if (dataset=='movies'){
    possible_ratings = (1:6)
  } else if (dataset=='MS'){
    possible_ratings = (0:1)
  }
  n_users <- dim(UI_matrix)[1]
  n_items <- dim(UI_matrix)[2]
  step <- 0
  K <- length(possible_ratings)
  prob_class <- matrix(1/C, nrow=C)
  prob_rating <- array(1/K, dim=c(C, n_items, K))
  assignment <- matrix(NA, nrow=n_users, ncol=C)
  
  while (TRUE){
    step <- step + 1
    # E:
    new_assignment <- update_assignment(UI_matrix, C, assignment, prob_class, prob_rating, K)
    
    # M:
    new_prob_class <- update_prob_class(UI_matrix, C, prob_class, new_assignment)
    new_prob_rating <- update_prob_rating(UI_matrix, C, prob_rating, new_assignment, possible_ratings)

    if ((step > 1) & (norm(new_prob_class - prob_class) < epsilon) & (norm(as.matrix(new_prob_rating - prob_rating)) < epsilon)){
      # convergence: we check if prob_class and prob_rating converge
      # TODO: maybe checking for convergence of likelihood would be better ?
      print(paste0('converged in ', step, ' steps.'))
      return(list(assignment, prob_class, prob_rating))
    } else if (step > max_steps){
      print('reached max number of steps without converging, returning...')
      return(list(assignment, prob_class, prob_rating))
    }
    
    assignment <- new_assignment
    prob_class <- new_prob_class
    prob_rating <- new_prob_rating
    print(paste0('step ', step,' done'))
  }
}


# Expectation step:
update_assignment <- function(UI_matrix, C, assignment, prob_class, prob_rating, K){
  # trick: prob_rating contains floats between 0 and 1
  # since we do a products of a lot of these floats, we'll underflow at some point
  # to fix this scale prob_rating (to mean=1) initially
  # since we're taking ratios eventually this is still correct.
  n_users <- dim(UI_matrix)[1]
  prob_rating <- prob_rating/mean(prob_rating)
  k_fix <- ifelse(K==2, 1, 0) # for MS, possible ratings are 0 or 1, but prob_rating is indexed starting 1, so shift if necessary

  for (i in 1:n_users){
    movies_rated_by_i <- which(!is.na(UI_matrix[i,]))
    ratings_given_by_i <- UI_matrix[i,!is.na(UI_matrix[i,])]
    
    # we first compute all numerators in the formula for assignment[i,c]:
    for (c in 1:C){
      assignment[i,c] <- prob_class[c]
      for (idx in 1:length(movies_rated_by_i)){
        # still looking for a way to avoid this loop...
        assignment[i,c] <- assignment[i,c] * prob_rating[c, movies_rated_by_i[[idx]], ratings_given_by_i[[idx]] + k_fix]
      }
    }
    
    # and then divide by the sum:
    assignment[i,] <- assignment[i,]/sum(assignment[i,])
    
    if (is.na(sum(assignment[i,]))){
      print("problem in assignment update")
    }
  }
  return(assignment)
}

# Maximization steps:
update_prob_class <- function(UI_matrix, C, prob_class, assignment){
  # C being generally small, no need to optimize this for loop
  n_users <- dim(UI_matrix)[1]
  for (c in 1:C){
    prob_class[c] <- sum(assignment[!is.na(assignment[,c]),c])/n_users
  }
  return(prob_class)
}

update_prob_rating <- function(UI_matrix, C, prob_rating, assignment, possible_ratings){
  n_items <- dim(UI_matrix)[2]
  k_fix <- ifelse(length(possible_ratings) == 2, 1, 0) # for MS, possible ratings are 0 or 1, but prob_rating is indexed starting 1, so shift if necessary
  for (c in 1:C){
    for (j in 1:n_items){
      users_who_rated_item_j <- which(!is.na(UI_matrix[,j]))
      denominator <- sum(assignment[users_who_rated_item_j,c])
      # warning: denominator can be = 0 ! (if prob_class got to 0 for class c at previous step)
      # annoying issue: MS gives ratings 0 or 1, yet prob_rating is indexed starting from 1:
      for (k in possible_ratings){
        if (denominator != 0){
          numerator <- sum((UI_matrix[users_who_rated_item_j,j] == k) * assignment[users_who_rated_item_j,c])
          prob_rating[c,j,k + k_fix] <- numerator/denominator
        } else{
          prob_rating[c,j,k + k_fix] <- 0
        }
      }
    }
    return(prob_rating)
  }
}


# Check parameters:
em_check <- function(assignment, prob_class, prob_rating){
  for (i in 1:dim(assignment)[1]){
    # stopifnot(abs(sum(assignment_movies[i,]) - 1) < 0.001)
    if (abs(sum(assignment[i,]) - 1) > 0.001){
      print(paste0("Probabilities don't sum to 1 for assignment index i=", i))
    }
  }
  
  if (abs(sum(prob_class) - 1) > 0.001){
    print("Probabilities don't sum to 1 for prob_class")
  }
  # stopifnot(abs(sum(prob_class) - 1) < 0.001)
  
  for (c in 1:dim(prob_rating)[1]){
    for (j in 1:dim(prob_rating)[2]){
      # stopifnot(abs(sum(prob_rating[c,j,]) - 1) < 0.001)
      if (abs(sum(prob_rating[c,j,]) - 1) > 0.001){
        print(paste0("Probabilities don't sum to 1 for prob_rating indices c,j=", c,",", j))
        print(c(c,j))
      }
    }
  }
}