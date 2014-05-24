GettingDataCourseraProject-2014
===============================

Getting Data Coursera Project Description


Description of run_analysis.R

* Reading the data: First step, the script reads the training data(X_train.txt), test data(X_test.txt), corresponding labels (y_train.txt, y_test.txt), subject ID (subject_train.txt, subject_test.txt), feature names (features.txt), and activity labels (activity_labels.txt).

* Merging the data: The training and test data are merged to create a single dataset using rbind(). The corresponding labels and subjects are also merged. This results in a dataset of 10299 rows and 561 columns.
 
* Feature extraction:  From the 561 features, only the features that correspond to the mean and std. deviation of signal measurements are extracted. According to the information in features_info.txt, these are the features that contain "mean()" and "std()" in their names. This is done using grep() with fixed=TRUE to get an exact match. Note that I am not including features like meanFreq() as that is a weighted average. This step reduces the feature dimensions to 66.     

* Renaming activities: The numeric activity labels are mapped to corresponding descriptive names using the information in "activity_labels.txt" and the resulting column is called activityNames.

~     
