## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.



## ----------- PREPARE descriptive datasets -----------------------------------
## read descriptive labels
features <- read.table("features.txt", header = FALSE)
names(features) <- c("id","feature")

## read activity values
activity <- read.table("activity_labels.txt", header = FALSE)
names(activity) <- c("id_act","Activity")


## ----------- MERGE TRAIN datasets --------------------------------------------
## Create data frame for X_train file
x_train <- read.table("X_train.txt", header = FALSE)

# str(x_train)  ## 'data.frame':    7352 obs. of  561 variables:
# sum(colSums(is.na(x_train)))  ## check if there are NAs; if > 0 there are some
# names(x_train)

## read labels for X_train
y_train <- read.table("y_train.txt", header = FALSE)
## add descriptive name to train labels
names(y_train) <- "id_act"

## combine y_test data set with X_test data set -> add column with Activity
## this order of variables in cbind() gives appropriate order of columns in
## x_train_L data set
x_train_L <- cbind(y_train, x_train)


## read subjects for X_train
sub_train <- read.table("subject_train.txt", header = FALSE)
## add descriptive name to train subjects
names(sub_train) <- "Subject"

## combine previous data set (X_train with labels) with subject data set ->
## add column with Subject
## this order of variables in cbind() gives appropriate order of columns in
## x_train_LS data set
x_train_LS <- cbind(sub_train, x_train_L)



## ----------- MERGE TEST datasets ---------------------------------------------
## Create data frame for X_test file
x_test <- read.table("X_test.txt", header = FALSE)

# str(x_test)  ## 'data.frame':    7352 obs. of  561 variables:
# sum(colSums(is.na(x_test)))  ## check if there are NAs; if > 0 there are some
# names(x_test)

## read labels for X_test
y_test <- read.table("y_test.txt", header = FALSE)
## add descriptive name to test labels
names(y_test) <- "id_act"

## combine y_test data set with X_test data set -> add column with Activity
## this order of variables in cbind() gives appropriate order of columns in
## x_test_L data set
x_test_L <- cbind(y_test, x_test)


## read subjects for X_test
sub_test <- read.table("subject_test.txt", header = FALSE)
## add descriptive name to test subjects
names(sub_test) <- "Subject"

## combine previous data set (X_test with labels) with subject data set ->
## add column with Subject
## this order of variables in cbind() gives appropriate order of columns in
## x_test_LS data set
x_test_LS <- cbind(sub_test, x_test_L)


## ----------- DO project steps ------------------------------------------------
## 1. Merge the training and the test sets to create one data set.
x_merged <- merge(x_train_LS, x_test_LS, all=TRUE)
## [info]
print("[info]: Step #1 completed")

## add descriptive variable names to x_merged data set
## use specific indices of data set because of order in cbind in previous steps
names(x_merged)[3:563] <-  as.character(features[,"feature"])
names(x_merged)
## [info]
print("[info]: Step #4 completed")



## 2. Extracts only the measurements on the mean and standard deviation for each
##    measurement.
## create vector with the column names for mean() & std() columns only, 
## without meanFreq()
f <- as.character(features[,"feature"])
colMSD <- (f[( grepl("mean()",f)                   
               != grepl("meanFreq()", f)
               | grepl("std()",f)) == TRUE])

## subset x_merged data set with created vector for appropriate variables
x_MSD <- x_merged[, c("Subject","id_act", colMSD)]
##[info]
print("[info]: Step #2 completed")

## 3. Uses descriptive activity names to name the activities in the data set
x <- merge(x_MSD, activity, by="id_act", x.Activity=y.Activity)
## drop column id_act in final data set
merged_data <- x[,-1]
##[info]
print("[info]: Step #3 completed")

## -----------------------------------
## write out the 1st dataset
write.table(merged_data, "merged_data.txt") 
## -----------------------------------

## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

install.packages("dplyr")
library(dplyr)

# the names of the columns to summarize
#cols <- c("Subject","Activity")
cols <- names(merged_data)[-c(1,68)]
# the dots component of call to summarise
dots <- sapply(cols ,function(x) substitute(mean(x), list(x=as.name(x))))

avg_ACT_SUB <- do.call(summarise, c(list(.data=merged_data), dots))

## ---------------------------------------------
## write out the 2nd dataset
write.table(avg_ACT_SUB, "summarized_data.txt") 
## ---------------------------------------------
