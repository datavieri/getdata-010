# Getting and Cleaning Data Course Project

Dear grader,
here it is my work for this assignment. In this repository you'll find:

- This README.md
- The [Code book](./Codebook.md) for this [tidy data set](https://github.com/datavieri/getdata-010/blob/master/data/dataset.wide.txt) *(in wide form)*
- Another version of the dataset, this time in [long form](https://github.com/datavieri/getdata-010/blob/master/data/dataset.long.txt)
- The [run_analysis.R](https://github.com/datavieri/getdata-010/blob/master/run_analysis.R) source code

## Is this data set tidy? (and additional assumptions)

### The tidy data principles*

- Each variable forms a column
- Each observation forms a row
- Each type of observational unit forms a table 

  *Hadley Wickham, [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) *

We were asked to generate a tidy data set with the average of each variable for each activity and each subject.
The source data included two sets (train + test) of 561-feature vector with time and frequency domain variables, measured during an experiment where 30 subjects performed 6 types of activities wearing a smartphone on their waist.

Thus, if we have 30 subjects and 6 activities, and we have to group measurements by activity and by subject, we can expect the tidy data set will have 180 rows (at least in its wide form).

This is one of the reasons I choosed to go for the wide form. Still, I also made a long form version of it (available at the above link).

### How variables where selected?

I decided to keep it simple. I considered acceptable mean, std and meanFreq, while I excluded angles between vectors, even if they take mean into considerations (e.g. angle.X.gravityMean). This led me to obtain 79 variables (46 means and 33 standard deviations).

Again, this was an assumption of mine, and may be different from any other, since the criteria were left (deliberately?) open.

## Reading the code

The code has some comments, and it should be readable at least.
I strongly relied on **dplyr** package, and used the **reduce2** package to generate the data set in long form.

Main steps:
- Read the train data (X_train.txt, y_train.txt, subject_train.txt) (7352 lines each), renaming columns for subject and activities and binding them column-wise with cbind
- Read the test data (X_test.txt, y_test.txt, subject_test.txt) (2947 lines each), renaming columns for subject and activities and binding them column-wise with cbind
- rbind train and test data to complete Step 1 of the assignment (full.data data frame)
- Read feature labels and normalise it replacing punctuations with a single dot (e.g., from tBodyAcc-mean()-X to tBodyAcc.mean.X)
- Use normalised labels to name columns in  full.data (first two columns being subject and activity id).
- Subset full.data by column, using dplyr::select and contains
- Read activity labels and join them with the data set using **inner_join** by activity.id. Once joined, drop the activity.id column and keep the descriptive one (i.e. activity), completing Step 3.
- Normalise variable names, to complete Step 4 (more on this later).
- Generate the averaged values data set of Step 5, using group_by and the amazing **summarise_each** function of dplyr. 

## How to run the code

