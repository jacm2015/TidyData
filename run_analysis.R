## week 3
## project


## Human Activity Recognition Using Smartphones Data Set. Task listed from 1 to 5.  
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## data source from :           https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#  Check the README.txt and feature_info.txt  files for further details about this dataset

rm(list= ls())
setwd("~/MisApuntes/Estadistica/DAtaScienceCourse/3_gettingData/proyect/UCI HAR Dataset")

require(plyr)
require(dplyr)
 

## READ DATA

#  Links the class labels with their activity name.
   activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="") 

# List of all features. 
# complete list of variables of each feature vector. 
  features <- read.table("features.txt", quote="\"", comment.char="")

# TEst Files
# Each row identifies the subject who performed the activity for each window sample. 
  subject_test <- read.table("./test/subject_test.txt", quote="\"", comment.char="")

# Test activity labels
  y_test <- read.table("./test/y_test.txt", quote="\"", comment.char="")
  
# Test set
  x_test <- read.table("./test/x_test.txt", quote="\"", comment.char="")

  
# Train  Files
   subject_train <- read.table("./train/subject_train.txt", quote="\"", comment.char="")
   y_train<- read.table("./train/y_train.txt", quote="\"", comment.char="")
   x_train <- read.table("./train/x_train.txt", quote="\"", comment.char="")


# 1. Merges the training and the test sets to create one data set.
  subject = rbind(subject_train, subject_test)
  x = rbind(x_train, x_test) 
  y = rbind(y_train, y_test)
  
#    2  Extracts only the measurements on the mean and standard deviation 
#       for each measurement. 
  
  v_features = as.vector(features) 
  df_names = v_features[,2]         # vector of field names
  
  names(x) = df_names
  s1 = grep("mean|std", df_names)  # selects mean or standard deviation columns on vector s1
  
  x = x[,s1]  ## select mean and std coulmns on dataset.
  
# 3. Uses descriptive activity names to name the activities in the data set 

  # activity_labels. 
    names(activity_labels) = c("ACtivityCode", "ActivityName")
  # y 
    names(y) = c("ACtivityCode")
   
    # x = cbind(y,x)
    
    
# 4. Appropriately labels the data set with descriptive variable names. 
     # Included in 2 and 3 for dataframe x and activity_labels.
    
  # subject
    names(subject) = "SubjectCode"
   
# 5. From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each activity 
#    and each subject.
    x = cbind (subject,y,x)
    x = merge(activity_labels,x) 
    x$ACtivityCode = NULL
    
    options(warn=-1)
    tidy = aggregate (x, by= list(activity= x$ActivityName, subject = x$SubjectCode  ), mean)
    
    tidy$ActivityName = NULL                              ## deleted  columns. Not relevant for the problem
    tidy$SubjectCode = NULL
    options(warn=0)
   
    write.table(tidy, file="tidy.txt", row.names = FALSE, quote = FALSE)
    
   
    