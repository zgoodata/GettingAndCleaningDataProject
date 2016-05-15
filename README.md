# GettingAndCleaningDataProject

This repository is for the course project of the Coursera Getting and Cleaning Data course.

## Contents

This repository contains:

1. `CookBook.md`, which describes the data and all summaries and transformations performed on the data.

2. `run_analysis.R`, which transforms the original data set (see Data Set) and creates a new data set, which contains the averages of all the standard deviation and mean measurements for each subject and each activity.

## Data Set

The data used for this project is publicly-available wearable-computing data.

Data information: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data set: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Requirements

1. The `run_analysis.R` script requires the `dplyr` R package.

2. The `run_analysis.R` script must be run from the directory in which the data set was unzipped, i.e., the `UCI HAR Dataset` directory should be in the current working directory.
