library(reshape2)

# Cleanup old data
zip    <- "data.zip"
folder <- "UCI HAR Dataset"
output <- "tidydata.txt"

if (file.exists(zip)) file.remove(zip)
if (file.exists(folder)) file.remove(folder)
if (file.exists(output)) file.remove(output)


# Download data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, zip, method = "curl")
unzip(zip) 


# Load and prepare Features
allFeatures <- read.table("UCI HAR Dataset/features.txt")
filter      <- grep(".*mean.*|.*std.*", allFeatures[,2])

features    <- allFeatures[filter, ]

features[,2] <- gsub('-mean', 'Mean', features[,2])
features[,2] <- gsub('-std', 'Std', features[,2])
features[,2] <- gsub('[()-]', '', features[,2])


# Load Activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")


# Load and bind Train data
trainX       <- read.table("UCI HAR Dataset/train/X_train.txt")[filter]
trainY       <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

trainData    <- cbind(trainX, trainY, trainSubject)


# Load and bind Test data
testX       <- read.table("UCI HAR Dataset/test/X_test.txt")[filter]
testY       <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

testData    <- cbind(testX, testY, testSubject)


# Bind Train and Test data
data           <- rbind(trainData, testData)
colnames(data) <- c(features[,2], "Activity", "Subject")


# Convert Activity and Subject to factors
data$Activity <- factor(data$Activity, levels = activities[,1], labels = activities[,2])
data$Subject  <- as.factor(data$Subject)


# Melt data and calculate Means
melted <- melt(data, id = c("Activity", "Subject"))
means  <- dcast(melted, Activity + Subject ~ variable, mean)


# Save output
write.table(means, output, row.names = FALSE, quote = FALSE)
