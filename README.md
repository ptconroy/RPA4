# RPA4
========
Coursera Getting &amp; Cleaning Data Project
--------
This repo contains one program file, run_analysis.R, that is the author's solution to the final project assignment in the Coursera Getting & Cleaning Data Class.
It also contains a the dataset upon which run_analysis does its work. The source of the data set is: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R reads in the data set and, after a series of manipulations, returns a tidy data set as a data.frame containing the per-Subject/per-Activity mean
of the various mean and standard deviation measurements contained in the data set. For details on the dataset, see UCIDataset/README.txt and
UCIDataset/features_info.txt.

To run the code, source run_analysis.R into your R environment. The working directory should be RPA4, with the data in the UCIDataset
subdirectory.

N.B.The specifications were somewhat vague regarding which variables from the original dataset were to be included in the output dataset.
The author has taken the conservative approach of including any variable whose name contains "mean" or "std". 

The packages tidyr and dplyr are required.

Details on what it does:
- Reads in all relevant data files from both the test and train datasets as data.tables.
- binds the activities and subjects to each of the test and train data.tables
- joins the test and train tables together
- labels the columns using the variable names contained in UCIDataset/features.txt
- because features.txt has duplicate names (derp) eliminate the duplicates (which aren't relevant to the mean or std anyhow)
- selects out only the mean and std variables
- replaces numbered activities with the names of the activities (WALKING, etc.)
- returns a tidy data table containing the mean for each variable for each combination of subject and activity (with a pretty sweet one-liner).



To read the sample output dataset, out.txt:
data <- read.table("out.txt", header = TRUE)
