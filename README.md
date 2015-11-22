# TidyData

## How to run the script 

* Scrip name: run_analysis.R
  Checedk for windows 7.  R version 3.2.2 (2015-08-14) -- "Fire Safety"

### Guide run the script to create the tidy data file

1.  Download data from 

    <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

2.  You shoul Unzip data on working directory. Keep folder structure for test and train data. R scrip uses "./UCI HAR Dataset"  as wrorking directory.   Check README.txt and feature_info.txt  files on working directory for further details about the dataset.

3. Run the script. Tidy.txt file will be added on the working directory with the project tidy data.

## High-level synopsis 

The goal is to prepare tidy data that can be used for later analysis. 


The processing steps are: 


1. Merges the training and the test sets to create one data set.
    Files are read for working directory and ./train and ./test directories. 
    rbind funcion is used to merge these datasets.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

    V_features vector (from features.txt files) contains variable names. Columns which contains mean or standard deviation are filterd with grep function.Names variables from features.txt are kept on tidy.txt file so there is a direct link to original data.

3. Uses descriptive activity names to name the activities in the data set

    Activity labels use are from activity.txt file on working directory.

4. Appropriately labels the data set with descriptive variable names.
   

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
    Additional comments are included on the script for reference. 
   
   