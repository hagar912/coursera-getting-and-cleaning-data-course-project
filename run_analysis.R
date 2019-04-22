library(dplyr)
if(!file.exists("./getdata"){dir.create("./getdata")}
fileurl <- ""
destfile <- "./getdata/dataset.zip"
downoad.file(fileurl,destfile,method="curl")
if(!file.exists("dataset.zip)){unzip(destfile),exdir="getdata")}

# read test data
x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
# read training data
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")


## 1.Merges the training and the test sets to create one data set.
# merge x , y to get new dataset
# x=value ,y=activity
x_dataset <- rbind(x_test,x_train)
y_dataset <- rbind(y_test,y_train)
subject_dataset <- rbind(subject_test, subject_train)


## 2.Extracts only the measurements on the mean and standard deviation for each measurement.
#reding features table 
features <- read.table("./UCI HAR Dataset/features.txt")
#searching for mean , std 
mean_std <- grepl("mean()",features[,2]) | grepl("std()",features[,2])
#putting them as a new col in x_dataset
x_dataset <- x_dataset[,mean_std]


## 3.Uses descriptive activity names to name the activities in the data set

#reading activity table 
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
#update values with correct activities'names
y_dataset[, 1] <- activities[y_dataset[, 1], 2]
#assign the correct col name
names(y_dataset) <- "activity"

## 4.Appropriately labels the data set with descriptive variable names.

names(subject_dataset) <- "subject"
#in a single dataset
all_singledataset <- cbind(x_dataset, y_dataset, subject_dataset)
colnames(all_singledataset) <- c("subject",features[,2],"activity")

## 5.

Data2<-aggregate(. ~subject + activity, all_singledataset, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata2.txt",row.name=FALSE)

