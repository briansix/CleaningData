# ASSUMPTIONS - data is unzipped in current working directory

# 1. Merges the training and the test sets to create one data set.
# Import test and train data sets
X_test <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")

# Import features, add data
features <- read.table("features.txt")
names(X_test) <- features$V2
names(X_train) <- features$V2

# Remove duplicate column names! No means or std in duplicate set
X_test <- X_test[ , !duplicated(colnames(X_test))]
X_train <- X_train[ , !duplicated(colnames(X_train))]

# Import labels
y_test <- read.table("test/y_test.txt"); names(y_test) <- "activitycode"
y_train <- read.table("train/y_train.txt"); names(y_train) <- "activitycode"

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Find measure names with mean and std
measures <- grep("mean|std",names(X_test),value = F)

# Keep only measures
library(dplyr)
X_test <- select(X_test,measures)
X_train <- select(X_train,measures)

# Import subject
subject_test <- read.table("test/subject_test.txt"); names(subject_test) <- "subject"
subject_train <- read.table("train/subject_train.txt"); names(subject_train) <- "subject"

# Import activity labels
activity_labels <- read.table("activity_labels.txt"); names(activity_labels) <- c("activitycode","activity")

# Add labels and subjects
test <- cbind(subject_test,y_test,X_test)
train <- cbind(subject_train,y_train,X_train)

# Combine test and train 
activity <- rbind(test,train)

# 3. Uses descriptive activity names to name the activities in the data set
# Join activity labels
library(plyr)
activity <- join(activity,activity_labels, by = "activitycode")

# Reorder columns
headers <- c(1,ncol(activity),4:ncol(activity)-1)
activity <- select(activity,headers)

# 4. Appropriately labels the data set with descriptive variable names.
# Duplicates removed and names added in rows 14,15,19,20,32,33,36
# Make variable names all lower case
names(activity) <- tolower(names(activity))

# Turn activities into factors
activity$activity <- factor(activity$activity)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Melt data into vertical form for processing
library(reshape2)
averages <- melt(activity,id.vars=c("subject","activity"))
# Calculate mean of variables for instances of subject and activity
averages <- dcast(averages, subject + activity ~ ..., mean)

# Write result to file
write.table(averages, file = "final.txt", row.name=FALSE)

