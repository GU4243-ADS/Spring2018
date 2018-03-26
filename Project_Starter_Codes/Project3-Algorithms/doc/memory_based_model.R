
###################################################################
### Memory-based Collaborative Filtering Algorithm Starter Code ###
###################################################################

### Authors: CIndy Rush
### Project 3
### ADS Spring 2018


########################################################
######## Building the UI matrix for the MS Data ########
########################################################


setwd("/Users/cynthiarush/Dropbox/ADS_Spring_2018/Project3/Class2")
source("functions.R")


setwd("/Users/cynthiarush/Dropbox/ADS_Spring_2018/Project3/Proj3_Data/MS_sample")

# Load the data
MS_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
MS_train <- MS_train[, 2:4]


# Transform from narrow to wide, i.e. user-item matrix 
# using MS_data_transform function

# Below takes 2.17 minutes
MS_UI <- MS_data_transform(MS_train)
save(MS_UI, file = "MS_UI.RData")


# Matrix Calculations
visit_nums <- rowSums(MS_UI != 0)

table(visit_nums)
mean(visit_nums)
median(visit_nums)


# Looping instead of rowSums()

long.row.sums <- function(UI) {
  vec <- rep(NA, nrow(UI))
  for (i in 1:nrow(UI)) {
    vec[i] <- sum(UI[i,], na.rm = TRUE)
  }
  return(vec)
}


system.time(long.row.sums(MS_UI))
system.time(rowSums(MS_UI, na.rm = TRUE))

vec <- long.row.sums(MS_UI)
all(vec == rowSums(MS_UI, na.rm = TRUE))


###############################################################
######## Building the UI matrix for the EachMovie Data ########
###############################################################

setwd("/Users/cynthiarush/Dropbox/ADS_Spring_2018/Project3/Proj3_Data/eachmovie_sample")

# Load the data
movie_train <- read.csv("data_train.csv", as.is = TRUE, header = TRUE)
movie_train <- movie_train[, 2:4]

# How we might fill in the user-item matrix using %in%

# Find sorted lists of users and vroots
users  <- sort(unique(movie_train$User))
movies <- sort(unique(movie_train$Movie))

# Initiate the UI matrix
UI            <- matrix(NA, nrow = length(users), ncol = length(movies))
row.names(UI) <- users
colnames(UI)  <- movies

# We consider just user 1, finding user 1's movies and ratings
movies  <- movie_train$Movie[movie_train$User == users[1]]
ratings <- movie_train$Score[movie_train$User == users[1]]

ord     <- order(movies)
movies  <- movies[ord]
ratings <- ratings[ord]

system.time(UI[1, colnames(UI) %in% movies] <- ratings)

# How we might fill in the user-item matrix using loops 

long.in <- function(movies, ratings) {
  
  # Cycle through the ratings, find the corresponding column
  for (i in 1:length(ratings)) {
    column <- which(colnames(UI) == movies[i])
    UI[2, column] <- ratings[i]
    print(column)
  }
  
}


system.time(long.in(movies, ratings))
  
all(UI[1, ] == UI[2,], na.rm = TRUE)

# Compute the full matrix
# Below takes about 4 minutes

movie_UI <- movie_data_transform(movie_train)
save(movie_UI, file = "movie_UI.RData")

# Some calculations
total_ratings <- rowSums(movie_UI, na.rm = TRUE)

table(total_ratings)
mean(total_ratings)
median(total_ratings)




#################################################################
######## Calculating the Similarity Weights of the Users ########
#################################################################

# Initiate the similarity weight matrix

movie_UI         <- as.matrix(movie_UI)
movie_sim_weight <- matrix(NA, nrow = nrow(movie_UI), ncol = nrow(movie_UI))

# Can calculate Pearson correlation between two rows of UI matrix as:

rowA <- movie_UI[1, ]
rowB <- movie_UI[2, ]

cor(rowA, rowB, method = 'pearson', use = "pairwise.complete.obs")

# Another way:

joint_values <- !is.na(rowA) & !is.na(rowB)
cor(rowA[joint_values], rowB[joint_values], method = 'pearson')

# First fill in row 1 of the similarity matrix using apply

system.time(vec1 <- apply(movie_UI, 1, cor, movie_UI[1, ], method = 'pearson', use = "pairwise.complete.obs"))

# Now fill in row 1 of the similarity matrix looping over the columns and 
# calculating pairwise correlations

long.way <- function(row.num) {
  
  for(i in 1:nrow(movie_UI)) {
    movie_sim_weight[row.num, i] <- cor(movie_UI[i, ], movie_UI[row.num, ], method = 'pearson', use = "pairwise.complete.obs")
  }
  
}

system.time(long.way(1))



# Calculate the full weights on the movie data
# The below took 87 minutes on my Macbook, 35 on my iMac

movie_sim <- calc_weight(movie_UI)
save(movie_sim, file = "movie_sim.RData")


# Calculate the full weights on the MS data
# The below took 30 minutes on my Macbook and 14 on my iMac

MS_sim <- calc_weight(MS_UI)
save(MS_sim, file = "MS_sim.RData")



###########################################################
######## Calculating the Predictions for the Users ########
###########################################################



# Calculate the predictions for user 1

# Initiate the prediction matrix and find the columns we need to predict
# for user 1.
pred_mat        <- MS_UI
cols_to_predict <- which(MS_UI[1, ] == 0)
num_cols        <- length(cols_to_predict)

# Transform the UI matrix into a deviation matrix since we want to calculate
# weighted averages of the deviations
neighb_weights <- MS_sim[1, ]
row_avgs       <- apply(MS_UI, 1, mean, na.rm = TRUE)
dev_mat        <- MS_UI - matrix(rep(row_avgs, ncol(MS_UI)), ncol = ncol(MS_UI))

# We'll calculate the predictions in two ways:

# First by looping over items where we want to make predictions


for (i in 1:num_cols) {
  
  # For each column to predict, first find all deviations for that item
  neighb_devs <- dev_mat[ ,cols_to_predict[i]]
  
  # For each column to predict, calculate the prediction as the weighted average
  pred_mat[1, cols_to_predict[i]] <- row_avgs[1] +  sum(neighb_devs * neighb_weights, na.rm = TRUE)/sum(neighb_weights, na.rm = TRUE)
}


# Now using matrix equations

pred_mat2 <- MS_UI

weight_mat  <- matrix(rep(neighb_weights, ncol(MS_UI)), ncol = ncol(MS_UI))
weight_sub  <- weight_mat[, cols_to_predict]
neighb_devs <- dev_mat[ ,cols_to_predict]

# Now fill in all of row 1 with matrix equations
pred_mat2[1, cols_to_predict] <- row_avgs[1] +  apply(neighb_devs * weight_sub, 2, sum, na.rm = TRUE)/sum(neighb_weights, na.rm = TRUE)


# They're the same
all(pred_mat2[1,] == pred_mat[1, ])


# Calculate predictions for MS
# This calculation took me 15 minutes

MS_pred <- pred_matrix(MS_UI, MS_sim)
save(MS_pred, file = "MS_pred.RData")

# Calculate predictions for movies
# This calculation took me 2493 second

movie_pred <- pred_matrix(movie_UI, movie_sim)
save(movie_pred, file = "movie_pred.RData")
