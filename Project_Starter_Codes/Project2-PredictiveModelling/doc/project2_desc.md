## STAT GU4243 Spring 2018 Applied Data Science
### Project 2 Predictive Modelling - Model Evaluation and Selection

In this project, we will carry out **model evaluation and selection** for predictive analytics on image data. As data scientists, we often need to **evaluate** different modeling/analysis strategies and decide what is the best. Such decisions need to be supported by sound evidence in the form of *model assessment, validation and comparison*. In addition, we also need to **communicate our decision and supporting evidence** clearly and convincingly in an accessible fashion.

#### Challenge
For this project, you will receive a set of 4387 labeled images of cats and dogs originally constructed by [The Oxford-IIIT Pet Dataset](http://www.robots.ox.ac.uk/%7Evgg/data/pets/). 

Your client is interested in creating a mobile AI program that accurately distinguishes between pictures of dogs and cats. 

The portability of this AI program (holding storage and memory cost) and the computational efficiency (test running time cost) are of great concern to your client. This translates to a balance between the complexity of variables/features/models used and the predictive performance. 

![image](../figs/predictiveprogram.png)

Assume that the **current practice** on your client side is just using [boosted](https://en.wikipedia.org/wiki/Boosting_(machine_learning)) [decision stumps](https://en.wikipedia.org/wiki/Decision_stump) on [SIFT features](https://en.wikipedia.org/wiki/Scale-invariant_feature_transform). `R` package [`gbm`](https://cran.r-project.org/package=gbm) can be used to implement this classifier. 

#### Evaluation criteria 
- Ease of reproducibility by the client (i.e. Cindy and Wenda for classroom purposes)
	* Are the codes for the proposed methods annotated and documented well?
	* Can the analysis be re-run nearly automatically using the project's `main.rmd`.
- Level of reproducibility
	* Can client derive the same evaluation conclusion as presented in the team's final presentation?
	* How close are the reported performances (presentation and online) to the reproduced performances?
- Portability of proposed strategies
	* Computational speed for feature extraction and model training.
	* Computational speed for prediction.
	* Memory use for model training and prediction.
- Presentation and organization
	* Is the presentation convincing about the intuition of the proposed strategies?
	* Is it supported by adequate and appropriate evidence?
	* Is the GitHub organized and prepared in a way that makes it easier for readers to understand the proposed strategies and its advantages and limitations?

#### Project details

For this project, you are to carry out a business feasibility evaluation project that tries to propose a **feasible** improvement over the current practice in terms of running cost (storage, memory and time) **and** prediction accuracy. 

##### Project time table.

- Week 1 (2/5-2/7): Introduction and project description
- Week 2 (2/12-2/14): Image processing and feature extraction
- Week 3 (2/19-2/21): Supervised learning and model assessment
- Week 4 (2/26-2/28): Producing final models
- Final presentation (3/5)

##### Project learning support 

Each week, we will give tutorials in class that are paired with discussion and brainstorming sessions. The instruction team will join team discussions during class and online. 



##### Final presentation
For presentation, the team should present their **proposal** for an improvement over the client's baseline strategy and support this proposal with evidence on 

- Performance improvement;
- Running cost tradeoff;
- Supporting evidence on why the proposed strategies make sense, such as intuitiveness of the selected features etc.

The presentation can be technical but must be accessible to other students in our class. 

##### Platform requirement

You can use any tools for *feature engineering* as you will be processing features for the test images on 3/5.
 
+ Your feature processing needs to be reasonably efficient as you will have only 30 minutes to process around 3000 new images. 
+ Your feature program should have 
	+ a folder path as an input 
	+ and output a single (if you are using R) RData file that contains feature R object as input for your `main.RMD` and `train.R` program.

##### Reproducibility requirement

Each team should organize the project repo on GitHub according to the structure of the starter codes. 

```
data/
GitHub_proj/
├──doc/
├────main.RMD
├──figs/
├──lib/
├──output/
├──README.md
```
- The `data` folder currently contains example hand-written zipcode images for the starter codes. You should **remove** the zipcode data from your final repo.  The project data is too big for Github.
- The `doc` folder should have documentations for this project, presentation files and other supporting materials. You should have a final `main.RMD` following the template given in the starter codes. Your `main.RMD` can assume that there is a data folder of raw images outside the root with subfolders corresponding to the training set and the test set. 
- The `figs` folder contains figure files produced during the project and running of the codes. 
- (For R users) The `lib` folder contain R codes for the AI program. It should have the following files: `feature.R`, `train.R`, and `test.R`. The codes in the `lib` folder are not intended to be run directly but to be called from `main.RMD`. 
- The `output` folder is the holding place for extracted features along with other intermediate and final results.

The instructional team will download each team's GitHub repo and cross-examine each team's proposal for reproducibility on the current dataset and for reliability using a different dataset.

##### Suggested team workflow
1. [wk1] Week 1 is the **understanding** week. Read the data description, fully understand the **project requirement**, and browse data and the starter codes. 
2. [wk1] As a team, download the data, discuss the data management needs of this project, and try adapt the starter codes to a *subset* of images to get a sense of computational burden of this project. 
3. [wk2] Week 2 is the **planning** week.  As a team, read and brainstorm about possible lead on features. 
4. [wk2] Based on outcomes from these brainstorming sessions, start data cleaning.
5. [wk3] Week 3 is the **exploration** week. Try different features and classifiers.
6. [wk3] It is ok to have 2-3 leads to explore at the beginning of week 3 but it is better to converge on a single direction by the end of week 3 (2/26). 
7. [wk4] Week 4 is the program **evaluation** week. By 2/26 (the beginning of week 4), you should have a clear plan on what set of features to consider and what set of classifiers to consider. During the final week, there will be some serious model training, validation and testing, which is likely to take some time. (Start early!)
8. [wk4] By 2/26, you should layout a to-do list and divide up tasks. Teams should work together and resolve any ambiguity about which team member should be doing what for this project. This is **extremely important** for this project due to the computational nature of this project. 

##### Working together
- Setup a GitHub project folder with everyone listed as contributor. Everyone clones the project locally and create a local branch. 
- The data is too big to be stored on GitHub. You can fork the repo to a local folder and have the data stored in "../data/" from root. Your project folder may look like

```
local proj/
├──data/
├──GitHub/
├── README
```
- The team can work with subgroups of 2-3 together more frequently than the entire team. However, everyone should check in regularly on group discussion online and changes in the GitHub folder.  

##### Example starter codes

As an example, you can find in the GitHub starter codes an example using handwritten zipcode data. We will give more examples during tutorials. 

