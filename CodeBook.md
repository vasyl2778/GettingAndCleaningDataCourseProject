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
    
After sucessfully completed script you will find 2 output files are generated in
the current working directory:
- merged_data.txt (7.9 Mb): it contains a data frame called merged_data
with 10299*68 dimension.
- summarized_data.txt (220 Kb): it contains a data frame called avg_ACT_SUB
with 180*68 dimension.

Use data <- read.table("summarized_data.txt") command in RStudio to read the file. 
Since we are required to get the average of each variable for each activity and
each subject, and there are 6 activities in total and 30 subjects in total,
we have 180 rows with all combinations for each of the 66 features.
