## STAT GU4243 Spring 2018 Applied Data Science
### Project 3 Algorithm Implementation and Evaluation

In this project, working in teams, you will evaluate and **compare** a pair of algorithms for **Collaborative Filtering**.

### Challenge
*Collaborative filtering* (or recommender systems) refers to the process of making automatic predictions (filtering) about the preferences of a new user from a database containing the preferences from many users (collaborating).

For this project, each team will implement, from scratch, **a pair of algorithms** -- one model-based and the other memory-based -- from the *collaborative filtering* literature, and then evaluate their performance on two datasets.  Each team will additionally be tasked with investigating further specific components of the memory-based model.  **Details of the algorithm assignments will be posted to Piazza**.

For submission, you will submit the GitHub repo of your codes, a *testing* report (must be a **reproducible** R notebook or a similar format) on the algorithms in terms of a *side-by-side* comparison of their performance and computational efficiency. Presentations should focus on group-specfic assignments, where each team should briefly explains the details of the component they were assigned to test, how the evaluation was carried out, and their main results.

All developments need to be carried out in group-shared private repo on our Github Classroom.  Each week, we will give a tutorial in class and having live discussion and brainstorm sessions. The instruction team will join team discussions during class and online.

- week 1 [3/19 and 3/21]: Introduction and project description. An overview of collaborative filtering.
- week 2 [3/26 and 3/28]: Paper dicussions and an in-depth look at the algorithms.
- week 3 [4/2 and 4/4]: Work week.

#### Evaluation criteria

- (9pts) Readabiity and reproducibility of codes (including correct implementation)
- (9pts) Validity of evaluation (well-defined measures of performance; experiment set up)
- (7pts) Presentation (final report, Github documentation, and in-class presentation)

*(More details will be posted as grading rubrics in Courseworks)*

### Suggested team workflow
1. [wk1] Week 1 is the **reading** week. Read the papers, and familiarize yourself with the data.  Implement the simple neighborhood model on both dataset.
2. [wk1] As a team, brainstorm about your evaluation plan and assign tasks.  Each team is strongly recommended to demonstrate project progress by posting a project plan with task assignments on GitHub.
3. [wk2] Week 2 is the **coding** week. Make sure you understand the details of the algorithms and start coding.  Look towards evaluating the algorithms.
4. [wk2] It is ok to separate into two sub-teams, one working on one algorithm, as long as the two teams have the same criteria for evaluating the algorithms. The two sub-teams can also serve as others' validators.
5. [wk3] Week 3 is the **evaluation** week.
6. [wk3] By using R Notebook to carry out coding and evaluation, your final report can just be adding explanation and comments to your Notebook.

### Working together
- Setup a GitHub project folder from joining the GitHub classroom link with everyone listed as contributors. Everyone clones the project locally via your GitHub desktop and create a local branch.
- The team can work in subgroups of 2-3, which might meet more frequently than the entire team. However, everyone should check in regularly on group discussion online and changes in the GitHub folder.
- Learn to work together is an important learning goal of this course.

### Resources

#### Papers

1. Breese, J. S., Heckerman, D., & Kadie, C. (1998, July). Empirical analysis of predictive algorithms for collaborative filtering. In Proceedings of the Fourteenth conference on Uncertainty in artificial intelligence (pp. 43-52). Morgan Kaufmann Publishers Inc..
* This paper provides an introduction to collaborative filtering, and evaluates the data sets we will use.  It also includes the details of the model-based algorithm you are asked to implement,

2. Herlocker, J. L., Konstan, J. A., Borchers, A., & Riedl, J. (1999, August). An algorithmic framework for performing collaborative filtering. In Proceedings of the 22nd annual international ACM SIGIR conference on Research and development in information retrieval (pp. 230-237). ACM.
* This paper proposes the framework for the memory-based (neighborhood) models you are asked to analysis.  It also contains details about the memory-based model components that each groups are assigned to investigate.

3. Su, X., & Khoshgoftaar, T. M. (2009). A survey of collaborative filtering techniques. Advances in artificial intelligence, 2009, 4.
* A review paper of collaborative filtering.

Others to be added...
