# Coursera: Getting and Cleaning Data

The repository for Getting and Cleaning Data class project. Running the run_analysis.R script results in tidydata.txt file being created. The following steps are executed:
* Cleanup old data - removes previous data files and folders if any
* Download data - downloads and unpacks the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Load and prepare Features - load features.txt data set and limit it to Mean and Std measurements
* Load Activities - load activity_labels.txt data set
* Load and bind Train data - load X_train.txt, y_train.txt and subject_train.txt data and bind it in one data frame
* Load and bind Test data - load X_test.txt, y_test and subject_test.txt data and bind it in one data frame
* Bind Train and Test data - bind the train and test data frames together and supply them with column names
* Convert Activity and Subject to factors - convert the Activity and Subject columns to factors
* Melt data and calculate Means - melt the data using Activity and Subject, and calculate the corresponding means
* Save output - save the resulting data in the tidydata.txt file
