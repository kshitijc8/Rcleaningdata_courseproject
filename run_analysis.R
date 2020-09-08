# Loading libraries
library(data.table)
library(dplyr)

# Reading the data
features <- read.table("features.txt", col.names = c("number","features"))
col_names = features$features

x_test <- read.table(".\\test\\X_test.txt", col.names = col_names)
y_test <- read.table(".\\test\\y_test.txt", col.names = "code")

act_label <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table(".\\test\\subject_test.txt", col.names = "subject")

subject_train <- read.table(".\\train\\subject_train.txt", col.names = "subject")
x_train <- read.table(".\\train\\X_train.txt", col.names = col_names)
y_train <- read.table(".\\train\\y_train.txt", col.names = "code")

# Data Merging

X = rbind(x_train, x_test)
y = rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#Merge to give final data
final_merge_set <- cbind(X, y)


# Extracts only the measurements on the mean and 
# standard deviation for each measurement

final_data <- select(final_merge_set, contains("mean"), contains("std"), code)
subject <- rbind(subject_train, subject_test)
final_data <- cbind(subject, final_data)

# Uses descriptive activity names to name the
# activities in the data set
final_data$activity = act_label[final_data$code,2]

# Appropriately labels the data set with 
# descriptive variable names

names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
names(final_data)<-gsub("Freq", "Frequency", names(final_data))
names(final_data)<-gsub("^f", "Frequency", names(final_data))
names(final_data)<-gsub("BodyBody", "Body", names(final_data))
names(final_data)<-gsub("angle", "Angle", names(final_data))
names(final_data)<-gsub("gravity", "Gravity", names(final_data))
names(final_data)<-gsub("^t", "Time", names(final_data))
names(final_data)<-gsub("tbody", "TimeBody", names(final_data))

# From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable
# for each activity and each subject.

tidy_data <- aggregate(final_data, by=final_data[c("activity","subject")], FUN =  mean)
tidy_data <- tidy_data[-c(3, 91)]

write.table(tidy_data, "FinalDataset.txt", row.name=FALSE)



