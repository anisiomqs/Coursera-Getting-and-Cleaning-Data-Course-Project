library(data.table)
library(dplyr)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "HAR.zip"
download.file(url, destfile = destfile)

unzip(destfile)

folder <- "UCI HAR Dataset"

# Read feature names, activity labels and 
features <- fread(file.path(folder, "features.txt"), col.names = c("seq", "name"))
labels <- fread(file.path(folder, "activity_labels.txt"), col.names = c("cod", "name"))

# Load data sets
XTrain <- fread(file.path(folder, "train", "X_Train.txt"), col.names = features$name)
yTrain <- fread(file.path(folder, "train", "y_Train.txt"))
trainSubjects <- fread(file.path(folder, "train", "subject_train.txt"))
XTest <- fread(file.path(folder, "test", "X_Test.txt"), col.names = features$name)
yTest <- fread(file.path(folder, "test", "y_Test.txt"))
testSubjects <- fread(file.path(folder, "test", "subject_test.txt"))
originalDT <- rbind(XTrain, XTest)

# Filter the variables for mean and standard deviation
cols <- grep("(mean|std)\\(\\)", featDT$name, value = TRUE)
dataset <- originalDT %>% select(cols)

# Add new variables containing the activity and subject
dataset$activity <- labels$name[rbind(yTrain, yTest)$V1]
dataset$subject <- rbind(trainSubjects, testSubjects)

# Calculate average for each activity and subject
avgData <- aggregate(. ~ activity + subject, dataset, mean)

# Save the data
write.table(avgData, "averagedata.txt", row.names = FALSE)