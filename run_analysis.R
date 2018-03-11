library(dplyr)

#Download and unzip dataset

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
unzip("dataset.zip")

#Read files to create train and test datasets

X_test_set<-read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep="", stringsAsFactors = FALSE)
X_train_set<-read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep="", stringsAsFactors = FALSE)

y_test_set<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt", sep="", stringsAsFactors = FALSE)
y_train_set<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt", sep="", stringsAsFactors = FALSE)

subject_test<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep="", stringsAsFactors = FALSE)
subject_train<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep="", stringsAsFactors = FALSE)

test_set<-cbind(y_test_set,subject_test, X_test_set)
train_set<-cbind(y_train_set,subject_train, X_train_set)

#Merge train and test set

dataset<-rbind(test_set, train_set)

#Extract only columns, which indicates means or standard deviations. Firstly, read variable names.

features<-read.table(".\\UCI HAR Dataset\\features.txt", stringsAsFactors=FALSE)

#Adding 2, because we want to extract columns with mean and standard deviation, but first two columns indicates activity and subject
dataset<-dataset[,c(1,2,grep("mean[^Freq]|std",features[,2])+2)]

#Activity labels

activity_labels<-read.table(".\\UCI HAR Dataset\\activity_labels.txt", stringsAsFactors=FALSE)
dataset[,1]<-factor(dataset[,1], activity_labels[,1], activity_labels[,2])


#Use descriptive variable names
colnames(dataset)<-c("Activity", "Subject",grep("mean[^Freq]|std",features[,2],value=TRUE))
dataset_header<-colnames(dataset)

dataset_header<-gsub("-","",dataset_header)
dataset_header<-gsub('\\(\\)',"",dataset_header)

dataset_header<-gsub("^t", "Time", dataset_header)
dataset_header<-gsub("^f", "Freqency", dataset_header)

dataset_header<-gsub("Acc", "Accelelator", dataset_header)
dataset_header<-gsub("Gyro", "Gyroscope", dataset_header)
dataset_header<-gsub("Mag", "Magnitude", dataset_header)

dataset_header<-gsub("mean", "Mean", dataset_header)
dataset_header<-gsub("std", "StandardDeviation", dataset_header)

colnames(dataset)<-dataset_header

#Create independent dataset with average for every measurement for each subject and activity

dataset_mean<-dataset%>%group_by(Activity, Subject)%>%summarise_all(mean)

#Write table to file

write.table(dataset_mean, "tidy_data.txt", row.names=FALSE)
