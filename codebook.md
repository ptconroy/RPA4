Codebook for output of run_analysis.R
---------
Each row represents one subject performing one activity, and contains the means of the various meaurements of mean and
standard deviation
as specified in UCIDataset/features_info.txt.

Subject: a factor uniquely identifying the subject performing the action.  
Action: a factor specifying the action being performed by the subject  


These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. Variables staring with a t are time domain signals. Those staring with an f are frequency domain signals.  
Additional Variables:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag:
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
*gravityMean
*tBodyAccMean
*tBodyAccJerkMean
*tBodyGyroMean
*tBodyGyroJerkMean

For further information, see UCIDataset/README.txt
