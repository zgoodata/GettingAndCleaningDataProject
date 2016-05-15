# Original Data

The data used for this project is publicly-available wearable-computing data. It and any information about it can be found at the following locations.

Data information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A list of all the variables in the data set can be found in `features.txt`, and the features are described in the code book `features_info.txt`.

# Transformations

The following transformations were applied to the original data in the `run_analysis.R` script.

1. The training (`X_train.txt`) and test (`X_test.txt`) data sets were merged into a single data set.
2. The variables of the data set were given descriptive names from the `features.txt` file.
3. The variables for mean (`-mean()`) and standard deviation (`-std()`) for each measurement were extracted.
4. The activities training (`y_train.txt`) and test (`y_test.txt`) data sets were merged together, and then merged into the above data set with the variable name `activity`.
5. The numeric values in the `activity` column were transformed into descriptive factors using the data in the `activity_labels.txt` file.
6. The subjects training (`subject_train.txt`) and test (`subject_test.txt`) data sets were merged together, and then merged into the above data set with the variable name `subject`.
7. A new data set was created which contains the average of each variable from the above data set for each `subject` and each `activity`. To achieve this, two groups were created: one for the `subject` and one for the `activity`. Then, the mean of each variable was computed over these groups.
