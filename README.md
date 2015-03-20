Samsung Wearables Dataset Cleaning Scripts
Version 1.0
By: Kendall Giles
www.kendallgiles.com
==========================================

This project contains scripts to clean the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This dataset contains recorded values of 30 test subjects performing a variety of activities while wearing a Samsung smartphone with embedded intertial sensors. 

The R scripts in this project perform the following tasks on the Samsung data:

1. Merges the training and the test sets to create one data set.
   
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The R scripts are in the file run_analysis.R. Note that the script assumes the Samsung data is in the R working directory: in other words, the folder "UCI HAR Dataset" which contains all the associated Samsung data files and subfolders should be in the R working directory. 

The output of the R script is a [tidy dataset](http://www.jstatsoft.org/v59/i10/paper).

The codebook for the tidy dataset (descriptions of the variables, the data, and any transformations or work that was performed to clean up the data) is in CodeBook.md.