#install.packages("data.table")
library(data.table)

train_file <- "./data/UCI HAR Dataset/train/X_train.txt" 
train_label <- "./data/UCI HAR Dataset/train/y_train.txt" 

test_file <- "./data/UCI HAR Dataset/test/X_test.txt" 
test_label <- "./data/UCI HAR Dataset/test/y_test.txt" 

train_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") 
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt") 

features <- read.table("./data/UCI HAR Dataset/features.txt")

train_x <- read.table(train_file)
test_x <- read.table(test_file)
train_y <- read.table(train_label)
test_y <- read.table(test_label)

print(dim(train_x))
print(dim(test_x))

all_x <- rbind(train_x, test_x)
all_y <- rbind(train_y, test_y)
all_sub <- rbind(train_sub, test_sub)
names(all_sub) <- "subject"
print(dim(all_x))

mean_ind <- grep("mean()", features$V2, fixed=TRUE)
std_ind  <- grep("std()", features$V2, fixed=TRUE)
x_sub <- all_x[c(mean_ind,std_ind)]
dim(x_sub)

activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
labels <- activity$V2[all_y$V1]

feature_sub <- features$V2[c(mean_ind,std_ind)]
new_features <- make.names(feature_sub,unique=TRUE)

names(x_sub) <- new_features
d  <- cbind(x_sub,labels)
df <- cbind(all_sub, d)
dt <- data.table(df)

tidy <- dt[,lapply(.SD,mean), by=list(subject,labels)]
write.table(tidy,"tidy.txt")

