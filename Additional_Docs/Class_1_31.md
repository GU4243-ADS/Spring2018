### Class 1/31

Project 1 is due on Monday, February 5 before class.  To 'turn in' project 1, submit the URL of your GitHub repo in the assignment one Courseworks.  We'll talk about what to do for the peer review on Monday.

# For today:

a. Read the Project 1 Self-assessment below.

b. If the answer to any of questions 1. - 3. in the self-assessment is 'no', then your assignment for today is to make sure the answer becomes 'yes' for all of these questions by the end of the class period.  Please use myself and Wenda -- we are here to help.

c. If the answer to questions 1. - 3. in the self-assessment is 'yes', your assignment for today is to choose one (or more) of the potential analyses from our brainstorming session on Monday and explore it with the dataset.  At the end of class, you will have the opportunity to share with the class what you found.  Especially helpful to your classmates, would be sharing packages/tools you have found to be useful in your analysis beyond those we've already seen in the tutorial.

d. If you're using Python for Project 1, please read the note to you at the end.



# Project 1 Self-assessment

Here is a list of questions and comments you can use to assess the progress of your project 1. You do not need to answer them anywhere -- it is for your *self*-assessment.
 
1. Have you initiated a GitHub repo within our GitHub classroom <https://classroom.github.com/a/c04UiTlQ>? Following this link, you should see a private repo just for you holding the starter codes that you should have cloned to your local computer.  (If you work on your local computer remember to commit and sync changes with the remote repo.)
2. Have you managed to replicate the example code (Tutorials/Week1-TextMining) for Project 1?
3. Have you started carrying out exploratory data analysis on the text data? 
4. Have you thought about what kind of analysis you want to do for your R project?
5. What new tools would you need to learn to carry out this analysis for your project?
6. Have you identified the resources required for learning new tools (e.g., tutorials or R packages)? 
7. Do you have a plan (time table) for your project so that it is complete on Monday?

# A list of potential directions to explore from class 1/29
 
Data Cleaning
* Punctuation -- typical sentence structure. Clauses they have. Number of commas or semicolons.
* Dialog more often than others.
* He/she 
* n-grams, bi-grams
* Groups of words that represent a theme.
* Making a numerical dataset -- number of semicolons, number of words, type of punctuation, etc.
* Length of sentence in words
* Nouns, Adjectives, Adverbs, pronouns, etc.
* We didn't do any stemming/lemmatization.
* Any information in the stop words.
* Studying the first and last words in the sentence.
* Which author uses more questions than the others.
* Customize stop_words 
* HPL makes up a lot of words
* Can we find specifically "British" words for MS.
* Capitalization/sentence format
* Sentence generation
 
Sentiment Analysis
* We did sentiment analysis at the word level. Can we do this at the sentence level? What proportion of sentences are "postive"? Ideas like this...
* Kmeans on emotion counts per sentence.
* Are the results from the other lexicons different? If so, how?
* We're looking at the word counts for each emotion... is some sort of normalization important here?
* What are the top few emotions represented by each author? Are they same across the authors.
* Psychoanalytic profile of the authors.
* Checking to see if the words actually match their profiles. Study the number of negations.
* Emotions never referenced. What is left out?
* Looking at sentence-level emotions, are there some emotions that occur together more often than others?
 
Topic Modelling
* To look at the top five sentence representing each topic.
* Visualizing author topics
* Is twelve topics best? How can we determine how many topics to use?
* Should we use other algorithms than LDA?
 
Other
* Lovecraft is writing about 100 years later.
* MS is British
 

# A Note to Python Users

Since much of the emphasis of Project 1 is on reproducibility and we are asking for a peer review, it would be nice if you incorporate your Python into an R Notebook and include necessary Python installation instruction in the appendix for your reader. (This won't be necessaray for all projects.)

# Some Handy Packages/Functions

* Base R has `kmeans()` and `prcomp()` functions for clustering and PCA.
* `wordnet` package <https://wordnet.princeton.edu>
* A helpful write-up on R's MLP resources <https://rpubs.com/lmullen/nlp-chapter>

# Some fun things

* ["Artificial Intelligence May Have Cracked Freaky 600-year-old Manuscript" on Gizmodo](https://gizmodo.com/artificial-intelligence-may-have-cracked-freaky-600-yea-1822519232)
* ["This Neural Net Has Weird Ideas About What Humans Like To Eat"](http://aiweirdness.com/post/140508739392/the-neural-network-has-weird-ideas-about-what)
