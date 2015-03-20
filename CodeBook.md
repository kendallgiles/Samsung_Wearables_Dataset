# Description

The tidy dataset produced by the run_analysis.R script contains the average of fitness sensor variables for each fitness activity and each subject in the experiment. See the README.txt in the raw dataset for details about the experiment.

# Variables

The tidy data contains the following variables:

* Subject ID: id for each participant in the fitness experiment. The range is 1 to 30.

* Class Description: There were six activities performed in the experiment: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

* 66 mean and standard deviation variables for each fitness measurement. From the raw dataset, variables containing "mean()" and "sd()" in the raw dataset variable name were extracted. The values in the tidy dataset are the averages of the data with that variable name in the raw dataset for each subject and each activity.


# Note

Since there are 30 subjects and six activities, there are 180 total computed means for each of the 66 mean and standard deviation variables. Thus the resulting tidy dataset is a 180 x 68 dataframe.

# How the Script Works:

This script depends on the R library dplyr.

The training and test datasets are read in and merged to create one 10299 x 561 dataframe. 

To extract only the variables relating to measurement mean or standard deviations, the grepl() function was used to search on "mean()" and "std()" in the raw variable names. This resulted in a 10299 x 66 data frame.

A column was added for subject ID from the list of training and test subject ids in the raw dataset.

A column was added for the activity/class description from activity id values in the raw dataset, using the cut() command to substtute activity description for activity id.

Descriptive variable names for the mean and standard deviation variables were found in the raw dataset, and along with "Subject_ID" and "Class_Description," these were added to the data frame using names().

This resulted in a 10299 x 68 dataframe.

The tidy dataset was made from the above dataframe using the group_by() function on Subject_ID and Class_Description, and the means were taken of the variables using summarise_each().

The resulting 180 x 68 dataframe was exported using write.table().


# List of the 68 Variable Names in the tidy dataset:

"Subject_ID"
"Class_Description"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"
