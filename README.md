# Human Activity Recognition

Anisio Marques Junior

## Description

This project manipulates the data from [Human Activity Recognition dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to provide a tidy dataset containing averages by activity and subject.

A full description of the original data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Data Manipulation

For each record in the source dataset it is provided:

 - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
 - Triaxial Angular velocity from the gyroscope.
 - A 561-feature vector with time and frequency domain variables.
 - Its activity label.
 - An identifier of the subject who carried out the experiment.

### 1. Merge the training and the test sets to create one data set

The following files were used in this task:

 - `train/X_train.txt`
 - `train/y_train.txt`
 - `train/subject_train.txt`
 - `test/X_test.txt`
 - `test/y_test.txt`
 - `test/subject_test.txt`
 
These information were combined to produce one `data.table` containing all the observations.

### 2. Extract only the measurements on the mean and standard deviation for each measurement

In this step we used the file `features.txt`, which contains the names for each variable. Then, using `grep`, we selected only the variables corresponsing to the mean or standard deviation (std) for each measurement. This greatly reduced the number of variables that we need to deal with.


### 3. Use descriptive activity names to name the activities in the data set

Using the file `activity_labels.txt`, which contains the code and name for each activity, we placed another variable, named `activity`, on the data set. We took advantage that the codes were sequential, so we could use the values joined from `y_train` and `y_test` and just index from activities' names.


### 4. Appropriately label the data set with descriptive variable names

The columns 1 to 66 of the intermediate data set (named simply `dataset`) are variables corresponding to the mean and standard deviation from the following measurements in the X, Y and Z axes:

 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ


And the mean and standard deviation of these: 

 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 
The last two columns contain the activity and the subject id, respectively.

### 5. Independent tidy data set with the average of each variable for each activity and each subject

Finally, using this data, we generate a tidy dataset with the averages for each of the above variables for each activity and subject. The result is found in the `data.table` named `avgData` and is saved to the file `averagedata.txt`.


