# Coursera: Getting and Cleaning Data

The repository for Getting and Cleaning Data class project. Running the run_analysis.R scripts results in tidydata.txt file being created. The following steps are executed:
* Cleanup old data - removes previous data files and folders if any
* Download data - downoads and unpacks the data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* Load and prepare Features - load Features data set and limit it to Mean and Std measurements
* Load Activities - load Activities
* Load and bind Train data - load trainX, trainY and trainsSubject data and bind it in one data frame
* Load and bind Test data - load testX, testY and testSubject data and bind it in one data frame
* Bind Train and Test data - bind the train and test data frames together and supply them with column names
* Convert Activity and Subject to factors - converts the Activity and Subject columns to factors
* Melt data and calculate Means - melts the data using Activity and Subject, and calculate the corresponding means
* Save output - save the resulting data in the tidydata.txt file
