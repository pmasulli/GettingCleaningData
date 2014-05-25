## Analyze and tidy up the Samsun Data Set for the Course Project 
## in the Coursera class Getting and Cleaning Data, May 2014.
## The data is transformed as specified in the file CodeBook.md,
## and the functioning of this script is detailed in README.md

## Note: the script assumes that the data set is found in a directory called "UCI HAR Dataset" 
## located in the script directory. If this is not the case, the data set location 
## can be adjusted by editing the following variable:

dataSetLocation <- "./UCI HAR Dataset/"

## set to a positive value to limit the number of lines read from each data file (only for debugging)
n <- -1

## load the test and the training data
trainingData <- read.table(paste0(dataSetLocation,"train/X_train.txt"),nrows=n)
testData <- read.table(paste0(dataSetLocation,"test/X_test.txt"),nrows=n)

## load the subject and activity data for the training and the test data sets
trainingSubjectData <-read.table(paste0(dataSetLocation,"train/subject_train.txt"),nrows=n)
trainingActivityData <- read.table(paste0(dataSetLocation,"train/y_train.txt"),nrows=n)
testSubjectData <-read.table(paste0(dataSetLocation,"test/subject_test.txt"),nrows=n)
testActivityData <- read.table(paste0(dataSetLocation,"test/y_test.txt"),nrows=n)

## read the activity labels
activityLabels <-read.table(paste0(dataSetLocation,"activity_labels.txt"))

## read the list of features
featuresList <- read.table(paste0(dataSetLocation,"features.txt"))

## join the training ang test data frames vertically
allData <- rbind(trainingData,testData)
allSubjectData <- rbind(trainingSubjectData,testSubjectData)
allActivityData <- rbind(trainingActivityData,testActivityData)

## select the features we're interested in, as detailed in the code book
selectedFeaturesList <- featuresList[ (
  grepl("mean", featuresList$V2, ignore.case=TRUE) | 
  grepl("std", featuresList$V2, ignore.case=TRUE)) & 
  !grepl("meanFreq", featuresList$V2, ignore.case=TRUE) & 
  !grepl("angle", featuresList$V2, ignore.case=TRUE) 
  , ]

## select from the data the features we want
selectedData <- allData[,selectedFeaturesList$V1]

## adjust column names to follow the standards
columnNames <- gsub("\\(\\)","",selectedFeaturesList$V2)
columnNames <- gsub("-",".",columnNames)
columnNames <- tolower(columnNames)

colnames(selectedData) <- columnNames
colnames(allSubjectData) <- c("subject.code")
colnames(allActivityData) <- c("activity.name")

## use the correct labels for activity names
allActivityData$activity.name <- activityLabels[allActivityData$activity.name, ]$V2

## put together all the data
completeData <- cbind(allSubjectData,allActivityData,selectedData)

## write it to a CSV file
write.csv(completeData,"tidyData.csv")

## create a new data frame containing only the average of each measurement, for each
## subject and each activity type
aggregatedData <- aggregate(completeData,by=list(completeData$subject.code,completeData$activity.name),FUN="mean", na.rm=TRUE)
aggregatedData$subject.code <- NULL
aggregatedData$activity.name <- NULL
colnames(aggregatedData)[1] <- "subject.code"
colnames(aggregatedData)[2] <- "activity.name"

## save the average data to another csv file
write.csv(aggregatedData,"avgData.csv")


