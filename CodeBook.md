## This is a code book that describes the variables, the data, and any transformations or work ## performed to clean up the data


## Transformations

In the 1st part script prepares descriptive datasets from:
- features.txt
- activity_labels.txt

In the 2nd part script merges TRAIN datasets:
- X_train.txt
- y_train.txt
- subject_train.txt
to  x_train_LS data set.

In the 3rd part script merges TEST datasets:
- X_test.txt
- y_test.txt
- subject_test.txt
to  x_test_LS data set.

In the last part script completed project steps:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each
    measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set
    with the average of each variable for each activity and each subject.

# Datasets
After sucessfully completed script you will find 2 output files generated in
the working directory:
- merged_data.txt (7.96 Mb): with a data frame called merged_data (10299 observations of 68 variables).
- summarized_data.txt (220 Kb): with a data frame called avg_ACT_SUB (180 observations of 68 variables).

To read the file use the following command in RStudio:
data <- read.table("summarized_data.txt")
