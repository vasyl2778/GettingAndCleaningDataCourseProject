GettingAndCleaningDataCourseProject
===================================
This repo explains how all of the scripts work and how they are connected

There is only one script run_analysis.R
Just run it to go throught the steps of Course project.

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

