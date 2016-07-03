library(tidyr)
library(dplyr)
run_analysis <- function() {
    
    activity_labels <- read.table("UCIDataset/activity_labels.txt")
    features <- read.table("UCIDataset/features.txt", stringsAsFactors = FALSE)
    
    # get the training data
    x_train <- read.table("UCIDataset/train/X_train.txt")
    subject_train <- read.table("UCIDataset/train/subject_train.txt")
    y_train <- read.table("UCIDataset/train/y_train.txt")
    
    #get the testing data
    x_test <- read.table("UCIDataset/test/X_test.txt")
    subject_test <- read.table("UCIDataset/test/subject_test.txt")
    y_test <- read.table("UCIDataset/test/y_test.txt")
    
    train <- cbind(y_train, x_train)
    test <- cbind(y_test, x_test)
    
    train <- cbind(subject_train, train)
    test <- cbind(subject_test, test)
    
    #join together the large data tables
    x <- rbind(train, test)
    
    #label the columns
    newcols <- c("Subject", "Activity")
    colnames(x) <- c(newcols, features[,2])
    x$Subject <- as.factor(x$Subject)
    
    # Now we have a problem: there are duplicated names of features in the data set.
    # Given no further information, we just drop the columns that are higher indexed duplicates
    
    x <- x[, !duplicated(colnames(x))]
    
    # Now we need to cut down the dataset to only include the mean and standard deviation
    # for each measurement. Which columns those are is a subject of debate. In an abundance of
    # caution, we take the dumb, conservative approach: any column headings containing
    # "mean" or "std" are retained. We also retain our "Subject" and "Activity" columns, of course.
    
    myregex <- ".*mean|std|Subject|Activity.*"
    x <- select(x, matches(myregex))
    
    # get the activity names in there
    m <- merge(x, activity_labels, by.x = "Activity", by.y = "V1")
    m <- mutate(m, Activity = V2)
    m <- select(m, -V2)
    
    # At this point, we have all of the data in one data.frame, appropriately labeled,
    # satisfying Step 4 for the assignment.
    # Now, we need to tidy the data.
    tidy <- m %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
    
    # that was easy.
    
    tidy
}