#
# Author: Kendall Giles
# Note: this script assumes the Samsung data is in the R working directory:
# in other words, the folder "UCI HAR Dataset" which contains all the associated Samsung 
# data files and subfolders should be in the R working directory.
#
# raw data website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#

library(dplyr)

#
# 1. Merges the training and the test sets to create one data set.
#

# read in the raw train and test data
train.raw <- read.table("./UCI HAR Dataset/train/X_train.txt")
test.raw <- read.table("./UCI HAR Dataset/test/X_test.txt")

# > dim(train.raw)
# [1] 7352  561
# > dim(test.raw)
# [1] 2947  561


# combine train and raw into one data frame
train.test.raw <- rbind(train.raw,test.raw)

# > dim(train.test.raw)
# [1] 10299   561

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# In other words, keep only columns w/ mean() and sd() in the variable name
#

features <- read.table("./UCI HAR Dataset/features.txt",  stringsAsFactors=FALSE)

cols.mean <- grepl("mean()", features$V2, fixed=TRUE)
cols.std <- grepl("std()", features$V2, fixed=TRUE)

desired.cols <- cols.mean | cols.std

train.test <- train.test.raw[,desired.cols]

# > dim(train.test)
# [1] 10299    66


# Add the column for subject id
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

train.test <- cbind(train.test, c(train.subject$V1,test.subject$V1))

# > dim(train.test)
# [1] 10299    67

#
# 3. Uses descriptive activity names to name the activities in the data set
# Note: Interpreted to mean use activity name instead of activity ID
#

train.class.labels <- read.table("./UCI HAR Dataset/train/y_train.txt")
test.class.labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

train.class.descriptions <- cut(c(train.class.labels$V1,test.class.labels$V1), breaks=nrow(activity.labels), labels=activity.labels$V2)

train.test <- cbind(train.test, train.class.descriptions)

# > dim(train.test)
# [1] 10299    68

#
# 4. Appropriately labels the data set with descriptive variable names. 
#

features$V2[desired.cols]

column.names <- c(features$V2[desired.cols], "Subject_ID", "Class_Description")

names(train.test) <- column.names

#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
#

# 30 subjects
# 6 activities
# 66 vars
#
# 180 rows, 66 var cols + subect id + activity --> 68 cols
# col 67 == subject id
# col 68 == class description

grouped.data <- group_by(train.test, Subject_ID, Class_Description)

tidy.dataset <- summarise_each(grouped.data, funs(mean))

# > dim(tidy.dataset)
# [1] 180  68

write.table(tidy.dataset, "./tidy_dataset.txt", row.name=FALSE)


