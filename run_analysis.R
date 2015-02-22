# first downloand the zip file and set R working directory to   UCI HAR Dataset

# 1. Merges the training and the test sets to create one data set.


Xtrain<- read.table("train/X_train.txt")

Xtest<- read.table("test/X_test.txt")

Xdata <- rbind(Xtrain, Xtest)



Ytrain<- read.table("train/y_train.txt")

Ytest<- read.table("test/y_test.txt")

Ylabel <- rbind(Ytrain, Ytest)


Strain <- read.table("train/subject_train.txt")

Stest<- read.table("test/subject_test.txt")

Subject <- rbind(Strain, Stest)




# 2. Extracts only the measurements on the mean and standard deviation for each measurement.



features <- read.table("features.txt")

indicesMeanSD<- grep("mean\\(\\)|std\\(\\)", features[, 2])

Xdata <- Xdata[, indicesMeanSD]



names(Xdata) <- gsub("\\(|\\)", "", features[indicesMeanSD,2])

names(Xdata) <- gsub("-", "", names(Xdata))

names(Xdata) <- gsub("mean", ".Mean.", names(Xdata))

names(Xdata) <- gsub("std", ".Std.", names(Xdata))






# 3. Uses descriptive activity names to name the activities in the data set.




activity<- read.table("activity_labels.txt")

activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))

substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))

substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))

activityLabel <- activity[Ylabel[, 1], 2]

Ylabel[, 1] <- activityLabel

names(Ylabel) <- "activity"




# 4. Appropriately labels the data set with descriptive activity names.



names(Subject) <- "subject"

merged<- cbind(Subject, Ylabel, Xdata)

write.table(merged, "merged_data.txt",row.name=FALSE)



# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



aSubject = unique(Subject)[,1]

nSubject = length(unique(Subject)[,1])

nActivity = length(activity[,1])

nCols = ncol(merged)

result = merged[1:(nSubject*nActivity), ]



row = 1

for (s in 1:nSubject) {

    for (a in 1:nActivity) {

        result[row, 1] = aSubject[s]

        result[row, 2] = activity[a, 2]

        tmp <- merged[merged$subject==s & merged$activity==activity[a, 2], ]

        result[row, 3:nCols] <- colMeans(tmp[, 3:nCols])

        row = row+1

    }

}


write.table(result, "data_average.txt",row.name=FALSE)
