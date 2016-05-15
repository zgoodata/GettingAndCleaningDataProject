# This script works with wearable-computing data which is publicly available.
# Data information:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Data set:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# The data are loaded and merged before the mean and std variables are extracted.
# The variables are given descriptive names from the feature labels.
# The activities are given descriptive names from the activity labels.
# The subjects are read to create a new data set which contains the average
# of each variable from the previous data set for each activity and each subject.

library(dplyr)

# Data file paths
trainingDataFile <- './UCI HAR Dataset/train/X_train.txt'
testingDataFile <- './UCI HAR Dataset/test/X_test.txt'
trainingSubjectsFile <- './UCI HAR Dataset/train/subject_train.txt'
testingSubjectsFile <- './UCI HAR Dataset/test/subject_test.txt'
trainingActivitiesFile <- './UCI HAR Dataset/train/y_train.txt'
testingActivitiesFile <- './UCI HAR Dataset/test/y_test.txt'
activityLabelsFile <- './UCI HAR Dataset/activity_labels.txt'
featureLabelsFile <- './UCI HAR Dataset/features.txt'

# Load the data
trainingData <- read.table(trainingDataFile)
testingData <- read.table(testingDataFile)
trainingSubjects <- read.table(trainingSubjectsFile)
testingSubjects <- read.table(testingSubjectsFile)
trainingActivities <- read.table(trainingActivitiesFile)
testingActivities <- read.table(testingActivitiesFile)
activityLabels <- read.table(activityLabelsFile)
featureLabels <- read.table(featureLabelsFile)

# Merge training and test data
data <- rbind(trainingData, testingData)
# Name each variable using the feature labels
names(data) <- featureLabels[[2]]

# Extract only the mean and std measurements
extractCols <- grep('-(mean|std)\\(\\)', names(data))
data <- data[,extractCols]

# Merge training and test activities
activities <- rbind(trainingActivities, testingActivities)
# Label activity variable
names(activities) <- c('activity')
# Merge activity variable and data
data <- cbind(activities, data)
# Use activity labels as factors/descriptive names
data$activity <- factor(data$activity, levels = activityLabels[[1]],
                                       labels = activityLabels[[2]])

# Merge training and test subjects
subjects <- rbind(trainingSubjects, testingSubjects)
# Label subject variable
names(subjects) <- c('subject')

# Create second data set with means of all variables for each subject and activity
dataAvg <- cbind(subjects, data) %>%        # Merge subject variable and data
           group_by(subject, activity) %>%  # Create groups in data set
           summarize_each(funs(mean))       # Call mean() for each variable over groups

# Write data set to file
dataAvgFile <- './data_avg.txt'
write.table(dataAvg, dataAvgFile, row.names = FALSE)
