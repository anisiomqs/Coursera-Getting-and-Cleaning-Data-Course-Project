# Human Activity Recognition

## Original data

The source data was obtained from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The full description of the original data can be obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Analysis

The original data was modified with the following steps:

* Training and test sets were combined in one single data set
* Kept only the variables for mean and standard deviation of each measurement
* Added a new variable — `activity` — containing the names of the activities
  - We used the names provided in the file `activity_labels.txt` from the original data set.
* Added a new varible — `subject` — containing the subject ids for each observation. 
  - We obtained this information using the files `train/subject_train.txt` and `test/subject_test.txt`
* Created a second, independent data set, with the average of each variable for each activity and subject.

Therefore, this tidy data set can be summarized in two parts: identifiers and measurements.

### Identifiers

* `activity`: The name of the activity performed by the subject
* `subject`: And identifier for each of the subjects

### Measurements

The columns 3 to 68 of the data set are variables corresponding to the mean and standard deviation from the following measurements in the X, Y and Z axes:

 - `tBodyAcc` - X, Y and Z
 - `tGravityAcc` - X, Y and Z
 - `tBodyAccJerk` - X, Y and Z
 - `tBodyGyro` - X, Y and Z
 - `tBodyGyroJerk` - X, Y and Z
 - `fBodyAcc` - X, Y and Z
 - `fBodyAccJerk` - X, Y and Z
 - `fBodyGyro` - X, Y and Z


Plus the mean and standard deviation of these: 

 - `fBodyAccMag`
 - `fBodyAccJerkMag`
 - `fBodyGyroMag`
 - `fBodyGyroJerkMag`
 - `tBodyAccMag`
 - `tGravityAccMag`
 - `tBodyAccJerkMag`
 - `tBodyGyroMag`
 - `tBodyGyroJerkMag`

They are directly related to the columns with the same name in the original data set, but here are averaged by activity and subject.

