## STAT GU4243 Spring 2018 Applied Data Science
### Project 3 Data and Algorithm Specifics


#### Data
In this project, you need to perform collaborative filtering algorithms on two data sets:

1. The first data set is [Anonymous Microsoft Web Data](https://archive.ics.uci.edu/ml/datasets/ Anonymous+Microsoft+Web+Data).  It’s an example of implicit voting data, with each location of the Microsoft website characterized as being visited (vote of one) or not (no vote).
2. The second data set is [EachMovie](http://www.gatsby.ucl.ac.uk/~chuwei/data/EachMovie/ eachmovie.html). This is an explicit voting example using data, with votes ranging in value from 0 to 5.

The two data sets are both studied and introduced in paper [1].  The full data is available at the above links, however we will be using a subsample of the data for easier computational that can be downloaded from my [Dropbox](https://drive.google.com/file/d/1jDT0nWCqdpTnFnYjkCfbaqTjV-NmcZR2/view?usp=sharing).

#### Algorithms

Each has team has two tasks:

A. *Implement* and *evaluate* the performance of two collaborative filtering algorithms -- one model-based and the other memory-based -- on both datasets.
    [Model 1] The model-based algorithm you are implementing is the clustering algorithm discussed in paper [1] section 2.3.  In the paper, the number of classes is determined via a marginal likelihood method, however we will just use cross-validation.  Note that you will need to code an EM algorithm here, and the method uses a Naive Bayes framework.  If these are new ideas for you, it may be helpful to do some background reading (in, for example, [The Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/)).
    [Model 2] The memory-based algorithm you are implementing is a user-based neighborhood model using Pearson's correlation for similarity weight.  This is introduced in equations (1) and equations (2) in paper [2].
    
B. Evaluate potential performance enhancements on the baseline momeory-based algorithm (Model 2 above) by considering changes to various components of the algorithm.
    [All Groups] Consider different similarity weights: (1) Spearman's correlation, (2) vector similarity, (3) entropy, (4) mean-square difference, and (5) SimRank.  Most are discussed in section 5.1 of paper [2], and SimRank is discussed in paper [4].
    [Groups 1, 2, 3] Consider significance and variance weighting. Section 5.2 and 5.3 of paper [2].
    [Groups 4, 5] Consider selecting neighborhoods. Section 6 of paper [2].
    [Group 6, 7] Consider rating normalization. Section 7 of paper [2].
    
#### Papers

1. Breese, J. S., Heckerman, D., & Kadie, C. (1998, July). Empirical analysis of predictive algorithms for collaborative filtering. In Proceedings of the Fourteenth conference on Uncertainty in artificial intelligence (pp. 43-52). Morgan Kaufmann Publishers Inc..
* This paper provides an introduction to collaborative filtering, and evaluates the data sets we will use.  It also includes the details of the model-based algorithm you are asked to implement,

2. Herlocker, J. L., Konstan, J. A., Borchers, A., & Riedl, J. (1999, August). An algorithmic framework for performing collaborative filtering. In Proceedings of the 22nd annual international ACM SIGIR conference on Research and development in information retrieval (pp. 230-237). ACM.
* This paper proposes the framework for the memory-based (neighborhood) models you are asked to analysis.  It also contains details about the memory-based model components that each groups are assigned to investigate.

3. Su, X., & Khoshgoftaar, T. M. (2009). A survey of collaborative filtering techniques. Advances in artificial intelligence, 2009, 4.
* A review paper of collaborative filtering.

4. Jeh, G., & Widom, J. (2002, July).  SimRank: a measure of structural-context similarity.  In Proceedings of the eighth ACM SIGKDD international conference on Knowledge discovery and data mining (pp. 538-543). ACM.
* Proposes the SimRank similarity measure.

#### Evaluation

You need to compare the performance of the memory-based and model-based algorithms (task A) and also the memory-based model with various component combinations (task B).  To do so you you will need to consider some sort of performance metric.  For the web data, you can use ranked scoring evaluation as in Paper [1].  For the movie data you can use mean absolute error as introduced in Paper [2].  Other evaluation criteria, like ROC sensitivty from Paper [2] are encouraged.
