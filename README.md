GettingDataCourseraProject-2014
===============================

Getting Data Coursera Project Description


Description of run_analysis.R

1)Reading the data: First step, the script reads the training data(X_train.txt), test data(X_test.txt), corresponding labels (y_train.txt, y_test.txt), subject ID (subject_train.txt, subject_test.txt), feature names (features.txt), and activity labels (activity_labels.txt).

2)Merging the data: The training and test data are merged to create a single dataset using rbind(). The corresponding labels and subjects are also merged. 

~     
