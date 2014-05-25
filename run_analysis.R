#install.packages("data.table")
library(data.table)

# Getting data Coursera project: Sudha Krishnamurthy

##============Read the data ==============================##
# Read and process the data collected from the 
# accelerometers from the Samsung Galaxy S smartphone

# Read the training data
train_file <- "./UCI HAR Dataset/train/X_train.txt" 
train_label <- "./UCI HAR Dataset/train/y_train.txt" 

train_x <- read.table(train_file)
train_y <- read.table(train_label)
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt") 

print(dim(train_x))

# Read the test data
test_file <- "./UCI HAR Dataset/test/X_test.txt" 
test_label <- "./UCI HAR Dataset/test/y_test.txt" 

test_x <- read.table(test_file)
test_y <- read.table(test_label)
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
print(dim(test_x))

# read the list of features
features <- read.table("./UCI HAR Dataset/features.txt")

# read the activity labels
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")


##====(1) Merge the data===============================##

# Merge the training and test data
all_x <- rbind(train_x, test_x)
print(dim(all_x))
# merge the training and test labels
all_y <- rbind(train_y, test_y)

# merge the training and test subjects
all_sub <- rbind(train_sub, test_sub)
# name the subject column
names(all_sub) <- "subject"

##====(2) Extract features===========================##

# extract the features corresponding to 
# the mean and standard deviation for each measurement.
mean_ind <- grep("mean()", features$V2, fixed=TRUE)
std_ind  <- grep("std()", features$V2, fixed=TRUE)
x_sub <- all_x[c(mean_ind,std_ind)]
print(dim(x_sub))

##=====(3) Rename activities==========================##
# convert all the activity codes in the merged dataset to names
activityNames <- activity$V2[all_y$V1]

##====(4) Rename feature names========================##

#rename the extracted features by cleaning up the names

# get the names of the extracted features
feature_sub <- features$V2[c(mean_ind,std_ind)]
# rename the features
new_names <- make.names(feature_sub,unique=TRUE)
new_features <- gsub("\\.", "",new_names)

##====(5) Create a second tidy dataset =================##

# assign the new names to the merged dataset
names(x_sub) <- new_features
# add the subject and activity names as columns to the dataset
d  <- cbind(x_sub,activityNames)
df <- cbind(all_sub, d)

# get the average of each extracted variable group by
# subject and activity
dt <- data.table(df)
tidy <- dt[,lapply(.SD,mean), by=list(subject, activityNames)]
print(dim(tidy))
write.table(tidy,"tidy.txt", sep="\t", row.names=FALSE)

